/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions. */

#ifndef FORCECLOAKEVENT_H_
#define FORCECLOAKEVENT_H_

#include "engine/engine.h"

#include "server/zone/objects/creature/events/CloakEvent.h"

class ForceCloakEvent : public CloakEvent {
public:
	ForceCloakEvent(CreatureObject* pl) : CloakEvent(pl) {
		Logger::setLoggingName("ForceCloakEvent");
	}

	static int getForceCost() {
		return 400;
	}

protected:
	virtual const char* getClientEffect() const {
		return "clienteffect/death_trooper_anti_virus.cef";
	}

	virtual void processCost() {
		ManagedReference<PlayerObject*> playerObject = player->getPlayerObject();

		if (playerObject == nullptr)
			return;

		playerObject->setForcePower(playerObject->getForcePower() - getForceCost());

		if (cloakApplied)
			player->sendSystemMessage("Your Force drains to keep you hidden.");
	}

	virtual bool hasResourcesForCloak() {
		ManagedReference<PlayerObject*> playerObject = player->getPlayerObject();

		return playerObject != nullptr && playerObject->getForcePower() >= getForceCost();
	}
};

#endif /* FORCECLOAKEVENT_H_ */
