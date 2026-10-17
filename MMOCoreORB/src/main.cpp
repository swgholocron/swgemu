/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions. */

#ifndef PLATFORM_WIN
#include "CoreProcess.h"
#endif

#include "server/ServerCore.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/chat/ChatManager.h"
#include "server/zone/managers/collision/NavMeshManager.h"
#include "server/zone/managers/director/DirectorManager.h"
#include "server/zone/managers/object/ObjectManager.h"

#ifdef COMPILE_CORE3_TESTS
#include "tests/TestCore.h"

#include "gtest/gtest.h"
#endif

#ifdef WITH_SWGREALMS_API
#include "server/login/SWGRealmsAPI.h"
#endif

#include "engine/orb/db/DOBObjectManager.h"

#ifndef PLATFORM_WIN
#include <signal.h>
#include <pthread.h>
#include <unistd.h>

// Ctrl+C (SIGINT), SIGTERM and SIGHUP used to kill the server on the spot: no log line, no final save.
// They are blocked in every thread and picked up here instead, and turn into the console "exit" command, which
// does the normal clean shutdown with a final save. A second signal quits immediately, for a shutdown that hangs.
static void* terminationSignalWatcher(void* arg) {
	sigset_t* signals = static_cast<sigset_t*>(arg);
	int received = 0;

	while (true) {
		int signalNumber = 0;

		if (sigwait(signals, &signalNumber) != 0)
			continue;

		++received;

		ServerCore* core = ServerCore::getInstance();
		int state = core != nullptr ? core->getRunState() : 0;

		if (received > 1) {
			Logger::console.error("termination signal received again, quitting immediately");
			_exit(128 + signalNumber);
		}

		if (state == 1) {
			Logger::console.info("termination signal (" + String::valueOf(signalNumber) + ", Ctrl+C) received: shutting down cleanly with a final save. Signal again to quit immediately.", true);
			core->queueConsoleCommand("exit");
		} else if (state == 2) {
			Logger::console.info("termination signal received while the server is already shutting down, waiting for the final save. Signal again to quit immediately.", true);
		} else {
			Logger::console.info("termination signal received while the server is still starting up, exiting", true);
			_exit(128 + signalNumber);
		}
	}

	return nullptr;
}

static void installTerminationSignalWatcher() {
	static sigset_t signals;

	sigemptyset(&signals);
	sigaddset(&signals, SIGINT);
	sigaddset(&signals, SIGTERM);
	sigaddset(&signals, SIGHUP);

	// Must happen before the server starts any other thread, so every thread inherits the blocked mask.
	pthread_sigmask(SIG_BLOCK, &signals, nullptr);

	pthread_t watcher;

	if (pthread_create(&watcher, nullptr, terminationSignalWatcher, &signals) == 0) {
		pthread_detach(watcher);
	} else {
		pthread_sigmask(SIG_UNBLOCK, &signals, nullptr);
		Logger::console.error("could not start the termination signal watcher, Ctrl+C will stop the server immediately");
	}
}
#endif

int main(int argc, char* argv[]) {
	System::setStreamBuffer(stdout, nullptr);

	if (argc) {
		StackTrace::setBinaryName(argv[0]);
	} else {
		Logger::console.warning("empty argv list");
	}

	static int ret = 0;

	try {
		SortedVector<String> arguments;
		arguments.setNoDuplicateInsertPlan();

		for (int i = 1; i < argc; ++i) {
			arguments.put(argv[i]);
		}

		if (arguments.contains("testScreenPlays")) {
			DirectorManager::DEBUG_MODE = 1;

			ConfigManager::instance()->loadConfigData();

			DirectorManager::instance()->info("Testing screen plays...", true);

			auto elapsed = Timer().run([]() { DirectorManager::instance()->getLuaInstance(); });

			DirectorManager::instance()->info(true) << "Done in " << elapsed / 1000000 << "ms";
		} else if (arguments.contains("service")) {
#ifndef PLATFORM_WIN
			while (true) {
				CoreProcess core(arguments);
				core.start();

				core.wait();
			}
#endif
#ifdef COMPILE_CORE3_TESTS
		} else if (arguments.contains("runUnitTests")) {
			TestCore core;
			core.info("Running unit tests...", true);

			testing::InitGoogleTest(&argc, argv);

			ret = RUN_ALL_TESTS();

#ifdef WITH_SWGREALMS_API
			SWGRealmsAPI::finalizeInstance();
#endif
			ObjectManager::instance()->shutdown();
#endif
		} else if (arguments.contains("dumpNavMeshesToFile")) {
			NavMeshManager::instance()->info("Dumping nav meshes to files...", true);

			NavMeshManager::instance()->dumpMeshesToFiles();
		} else {
			bool truncateData = arguments.contains("clean");

#ifndef PLATFORM_WIN
			installTerminationSignalWatcher();
#endif

			ServerCore core(truncateData, arguments);
			core.start();

#ifndef PLATFORM_WIN
			// start() only returns after the full shutdown ("server closed"): everything is saved and the databases
			// are closed. Tearing the rest of the process down the normal way used to end in a SIGSEGV on exit, so
			// leave right here.
			System::flushStream(stdout);
			System::flushStream(stderr);
			_exit(ret);
#endif
		}

	} catch (const Exception& e) {
		e.printStackTrace();
	} catch (...) {
		System::err << "unreported exception caught main()" << endl;
	}

#ifdef WITH_SWGREALMS_API
	// Known bug in cpprestsdk with websockets can't kill the final resolver_service_base thread
	_exit(ret);
#else
	pthread_exit(&ret);
#endif

	return 0;
}

