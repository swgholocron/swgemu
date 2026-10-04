/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef RECALCFORCECOMMAND_H_
#define RECALCFORCECOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/managers/skill/SkillManager.h"

// Re-sums the Force pool/regen from a character's skills. Players can fix themselves;
// staff can target another player.
class RecalcForceCommand : public QueueCommand {
public:
	RecalcForceCommand(const String& name, ZoneProcessServer* server) : QueueCommand(name, server) {
	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {
		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		CreatureObject* targetCreature = creature;

		ManagedReference<SceneObject*> object = server->getZoneServer()->getObject(target);

		if (object != nullptr && object->isPlayerCreature() && object != creature) {
			PlayerObject* ghost = creature->getPlayerObject();

			if (ghost == nullptr || !ghost->isPrivileged())
				return INVALIDTARGET;

			targetCreature = object->asCreatureObject();
		}

		if (targetCreature == nullptr || targetCreature->getPlayerObject() == nullptr)
			return INVALIDTARGET;

		SkillManager* skillManager = SkillManager::instance();

		if (targetCreature == creature) {
			skillManager->awardForceFromSkills(creature);
		} else {
			Locker clocker(targetCreature, creature);
			skillManager->awardForceFromSkills(targetCreature);
		}

		creature->sendSystemMessage("Recalculated max Force and Force regeneration.");

		return SUCCESS;
	}
};

#endif // RECALCFORCECOMMAND_H_
