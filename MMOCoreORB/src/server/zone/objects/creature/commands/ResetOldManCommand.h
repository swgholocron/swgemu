/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef RESETOLDMANCOMMAND_H_
#define RESETOLDMANCOMMAND_H_

#include "server/zone/managers/jedi/JediManager.h"

// /resetoldman: restarts the old man visits for a player who is stuck in the village intro or outro.
// The Lua jedi manager decides whether the player is currently in either of those phases.
class ResetOldManCommand : public QueueCommand {
public:
	ResetOldManCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!creature->isPlayerCreature())
			return GENERALERROR;

		JediManager::instance()->resetOldManCommand(creature);

		return SUCCESS;
	}
};

#endif // RESETOLDMANCOMMAND_H_
