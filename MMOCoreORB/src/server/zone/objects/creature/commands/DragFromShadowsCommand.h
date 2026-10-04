/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef DRAGFROMSHADOWSCOMMAND_H_
#define DRAGFROMSHADOWSCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/Zone.h"
#include "server/zone/CloseObjectsVector.h"
#include "server/zone/objects/creature/events/CloakEvent.h"

// Drag from Shadows (ported from Flurry): reveals every cloaked player within range. Long cooldown.
class DragFromShadowsCommand : public QueueCommand {
public:
	DragFromShadowsCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		const float range = 64.f;

		if (!creature->checkCooldownRecovery("drag")) {
			StringIdChatParameter stringId;

			const Time* cdTime = creature->getCooldownTime("drag");

			int timeLeft = (int) floor((float) cdTime->miliDifference() / 1000) * -1;

			stringId.setStringId("@innate:equil_wait"); // You are still recovering from your last Command available in %DI seconds.
			stringId.setDI(timeLeft);
			creature->sendSystemMessage(stringId);

			return GENERALERROR;
		}

		Zone* zone = creature->getZone();

		if (zone == nullptr)
			return GENERALERROR;

		creature->addCooldown("drag", 420 * 1000);
		creature->playEffect("clienteffect/survey_effect.cef");

		SortedVector<TreeEntry*> closeObjects(512, 512);
		CloseObjectsVector* closeVector = (CloseObjectsVector*) creature->getCloseObjects();

		if (closeVector == nullptr) {
			zone->getInRangeObjects(creature->getPositionX(), creature->getPositionZ(), creature->getPositionY(), range, &closeObjects, true);
		} else {
			closeVector->safeCopyReceiversTo(closeObjects, CloseObjectsVector::CREOTYPE);
		}

		for (int i = 0; i < closeObjects.size(); ++i) {
			SceneObject* object = static_cast<SceneObject*>(closeObjects.get(i));

			if (object == nullptr || object == creature || !object->isPlayerCreature())
				continue;

			ManagedReference<CreatureObject*> targetPlayer = object->asCreatureObject();

			if (targetPlayer == nullptr || !creature->isInRange(targetPlayer, range))
				continue;

			Locker locker(targetPlayer, creature);

			if (!targetPlayer->isInvisible())
				continue;

			// Never expose staff who are invisible.
			PlayerObject* targetGhost = targetPlayer->getPlayerObject();

			if (targetGhost != nullptr && targetGhost->isPrivileged())
				continue;

			Reference<Task*> task = targetPlayer->getPendingTask("cloakevent");

			if (task != nullptr) {
				Reference<CloakEvent*> cloakTask = task.castTo<CloakEvent*>();

				if (cloakTask != nullptr) {
					targetPlayer->sendSystemMessage("You are now visible to all players and creatures.");
					cloakTask->removeCloak();
				}
			}
		}

		return SUCCESS;
	}
};

#endif // DRAGFROMSHADOWSCOMMAND_H_
