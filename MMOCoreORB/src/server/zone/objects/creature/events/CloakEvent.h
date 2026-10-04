/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions. */

#ifndef CLOAKEVENT_H_
#define CLOAKEVENT_H_

#include "engine/engine.h"

#include "server/zone/Zone.h"
#include "server/zone/CloseObjectsVector.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/packets/chat/ChatSystemMessage.h"
#include "server/zone/packets/scene/PlayClientEffectLocMessage.h"
#include "server/zone/packets/scene/UpdateTransformMessage.h"

/**
 * Ported from the Flurry server's cloak system. Hides a player from everyone nearby, drains a cost
 * every COST_INTERVAL_TICKS seconds, and drops the cloak on combat, entering a building, incapacitation,
 * logout or when the cost can't be paid. Damage/combat is polled once per second instead of using an observer.
 */
class CloakEvent : public Task, public Logger {
protected:
	ManagedReference<CreatureObject*> player;

	bool cloakApplied;
	int ticksUntilCost;

	static const int TICK_MS = 1000;
	static const int COST_INTERVAL_TICKS = 10;

public:
	CloakEvent(CreatureObject* pl) : Task(), Logger() {
		player = pl;
		cloakApplied = false;
		ticksUntilCost = COST_INTERVAL_TICKS;

		Logger::setLoggingName("CloakEvent");
		Logger::setLogging(false);
	}

	virtual ~CloakEvent() {
	}

	void run() {
		if (player == nullptr)
			return;

		Locker playerLocker(player);

		if (!player->isOnline() || player->isIncapacitated() || player->isDead()) {
			removeCloak();
			return;
		}

		if (!cloakApplied) {
			if (!canApplyCloak()) {
				player->sendSystemMessage("The cloak could not be applied.");
				removeCloak();
				return;
			}

			processCost();
			applyCloak();

			ticksUntilCost = COST_INTERVAL_TICKS;
			reschedule(TICK_MS);
			return;
		}

		if (player->getParent() != nullptr) {
			player->sendSystemMessage("You cannot maintain your cloak here.");
			removeCloak();
			return;
		}

		if (player->isInCombat()) {
			player->sendSystemMessage("You cannot maintain your cloak in combat!");
			removeCloak();
			return;
		}

		if (--ticksUntilCost <= 0) {
			if (!hasResourcesForCloak()) {
				player->sendSystemMessage("You lack the strength needed to maintain your cloak.");
				removeCloak();
				return;
			}

			processCost();
			ticksUntilCost = COST_INTERVAL_TICKS;
		}

		reschedule(TICK_MS);
	}

	bool getCloakApplied() const {
		return cloakApplied;
	}

	void applyCloak() {
		if (cloakApplied)
			return;

		player->setInvisible(true);

		forEachNearby([this](SceneObject* nearby) {
			nearby->notifyDissapear(player);
		});

		playEffectAtPlayer();

		player->sendSystemMessage("The cloak has been applied.");

		cloakApplied = true;
	}

	void removeCloak() {
		if (isScheduled())
			cancel();

		player->removePendingTask("cloakevent");

		if (!cloakApplied)
			return;

		player->setInvisible(false);

		forEachNearby([this](SceneObject* nearby) {
			nearby->notifyInsert(player);
		});

		playEffectAtPlayer();

		UpdateTransformMessage* msg = new UpdateTransformMessage(player);
		player->broadcastMessage(msg, true);

		player->sendSystemMessage("Your cloak has been removed.");

		cloakApplied = false;
	}

	bool canApplyCloak() {
		return player->getParent() == nullptr && hasResourcesForCloak() && !player->isInCombat();
	}

protected:
	template <typename F>
	void forEachNearby(F action) {
		Zone* zone = player->getZone();

		if (zone == nullptr)
			return;

		SortedVector<TreeEntry*> closeObjects(512, 512);
		CloseObjectsVector* closeVector = (CloseObjectsVector*) player->getCloseObjects();

		if (closeVector == nullptr) {
			zone->getInRangeObjects(player->getPositionX(), player->getPositionZ(), player->getPositionY(), 32, &closeObjects, true);
		} else {
			closeVector->safeCopyTo(closeObjects);
		}

		for (int i = 0; i < closeObjects.size(); ++i) {
			SceneObject* nearby = static_cast<SceneObject*>(closeObjects.get(i));

			if (nearby != nullptr && nearby != player && !nearby->isBuildingObject())
				action(nearby);
		}
	}

	void playEffectAtPlayer() {
		Zone* zone = player->getZone();

		if (zone == nullptr)
			return;

		PlayClientEffectLoc* effect = new PlayClientEffectLoc(getClientEffect(), zone->getZoneName(), player->getPositionX(), player->getPositionZ(), player->getPositionY());
		player->broadcastMessage(effect, true);
	}

	virtual const char* getClientEffect() const {
		return "clienteffect/pl_force_speed_self.cef";
	}

	virtual void processCost() {
		player->inflictDamage(player, CreatureAttribute::ACTION, 400, true);
	}

	virtual bool hasResourcesForCloak() {
		return player->getHAM(CreatureAttribute::ACTION) >= 400;
	}
};

#endif /* CLOAKEVENT_H_ */
