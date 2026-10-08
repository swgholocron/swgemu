/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef REQUESTSETSTATMIGRATIONDATACOMMAND_H_
#define REQUESTSETSTATMIGRATIONDATACOMMAND_H_

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/sessions/MigrateStatsSession.h"
#include "server/zone/managers/player/creation/PlayerCreationManager.h"

class RequestSetStatMigrationDataCommand : public QueueCommand {
public:
	RequestSetStatMigrationDataCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {
	}

	static uint32 getMaxAttribute(CreatureObject* creature, uint8 attribute) {
		return PlayerCreationManager::instance()->getMaximumAttributeLimit(creature->getSpeciesName(), attribute);
	}

	static uint32 getMinAttribute(CreatureObject* creature, uint8 attribute) {
		return PlayerCreationManager::instance()->getMinimumAttributeLimit(creature->getSpeciesName(), attribute);
	}

	static uint32 getTotalAttribPoints(CreatureObject* creature) {
		return PlayerCreationManager::instance()->getTotalAttributeLimit(creature->getSpeciesName());
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->isPlayerCreature()) {
			return GENERALERROR;
		}

		auto ghost = creature->getPlayerObject();

		if (ghost == nullptr) {
			return GENERALERROR;
		}

		bool privilegedPlayer = ghost->isPrivileged();

		ManagedReference<Facade*> facade = creature->getActiveSession(SessionFacadeType::MIGRATESTATS);
		ManagedReference<MigrateStatsSession*> session = dynamic_cast<MigrateStatsSession*>(facade.get());

		if (session == nullptr) {
			return GENERALERROR;
		}

		StringTokenizer tokenizer(arguments.toString());
		tokenizer.setDelimeter(" ");

		uint32 targetPointsTotal = 0;
		uint32 targetAttributes[9] = {0,0,0,0,0,0,0,0,0};

		for (int i = 0; tokenizer.hasMoreTokens() && i < 9; ++i) {
			int value = tokenizer.getIntToken();

			// Every stat must stay within the species minimum / maximum. Staff characters (whose stats are
			// set by other means) are exempt so they can still use the window.
			if (value < 0 || (!privilegedPlayer && ((uint32) value < getMinAttribute(creature, i) || (uint32) value > getMaxAttribute(creature, i)))) {
				warning() << "Player: " << creature->getDisplayedName() << " ID: " << creature->getObjectID() << " --- stat migration value out of the allowed range.";
				creature->sendSystemMessage("Each stat must stay within its minimum and maximum.");
				return GENERALERROR;
			}

			targetAttributes[i] = value;
			targetPointsTotal += value;
		}

		// All points must be spent: players redistribute their species total between stats. Staff may also use
		// whatever total they currently hold.
		uint32 currentTotal = 0;

		for (int i = 0; i < 9; ++i) {
			currentTotal += creature->getBaseHAM(i);
		}

		bool totalOk = targetPointsTotal == getTotalAttribPoints(creature) || (privilegedPlayer && targetPointsTotal == currentTotal);

		if (totalOk) {
			for (int i = 0; i < 9; ++i) {
				session->setAttributeToModify(i, targetAttributes[i]);
			}
		} else {
			creature->error("targetPointsTotal = " + String::valueOf(targetPointsTotal));
			creature->error("totalAttribPoints = " + String::valueOf(getTotalAttribPoints(creature)));
			creature->error("Trying to set migratory stats without assigning all available points.");
			return GENERALERROR;
		}

		// Stat migration is allowed on any planet and does not require an image designer.
		session->migrateStats();

		if (privilegedPlayer) {
			creature->sendSystemMessage("Stat Migration Permitted due to Staff Privileges.");
		}

		return SUCCESS;
	}
};

#endif //REQUESTSETSTATMIGRATIONDATACOMMAND_H_
