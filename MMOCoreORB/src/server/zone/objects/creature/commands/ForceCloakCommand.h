/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions. */

#ifndef FORCECLOAKCOMMAND_H_
#define FORCECLOAKCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/creature/events/ForceCloakEvent.h"

// Grey Jedi Force Cloak (ported from Flurry). Hides the caster; use again to drop the cloak.
class ForceCloakCommand : public QueueCommand {
public:
	ForceCloakCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		if (!creature->hasSkill("force_rank_gray_master"))
			return GENERALERROR;

		Reference<Task*> task = creature->getPendingTask("cloakevent");

		if (task != nullptr) {
			Reference<CloakEvent*> cloakTask = task.castTo<CloakEvent*>();

			if (cloakTask == nullptr)
				return GENERALERROR;

			creature->sendSystemMessage("Your cloak has been canceled.");
			cloakTask->removeCloak();

			return SUCCESS;
		}

		ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();

		if (ghost == nullptr)
			return GENERALERROR;

		if (ghost->getForcePower() < ForceCloakEvent::getForceCost()) {
			creature->sendSystemMessage("You don't have the Force power to cloak yourself.");
			return GENERALERROR;
		}

		if (creature->isDead() || creature->isIncapacitated()) {
			creature->sendSystemMessage("You can't hide yourself right now.");
			return GENERALERROR;
		}

		if (creature->getParent() != nullptr || creature->isInCombat()) {
			creature->sendSystemMessage("You can't cloak right now.");
			return GENERALERROR;
		}

		Reference<ForceCloakEvent*> forceCloakTask = new ForceCloakEvent(creature);

		creature->sendSystemMessage("The Force surges through you... soon you will vanish from sight.");
		creature->addPendingTask("cloakevent", forceCloakTask, 3000);

		return SUCCESS;
	}
};

#endif // FORCECLOAKCOMMAND_H_
