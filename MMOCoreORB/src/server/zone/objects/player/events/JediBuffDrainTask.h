/*
 * JediBuffDrainTask.h
 *
 * Drains a percentage of max Force every second while a Jedi buff (Force Run) is active and the player is moving.
 * Standing still pauses the drain, so Force regenerates normally. When the Force runs out the buff ends.
 */

#ifndef JEDIBUFFDRAINTASK_H_
#define JEDIBUFFDRAINTASK_H_

#include "engine/engine.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/player/PlayerObject.h"

class JediBuffDrainTask : public Task {
	ManagedReference<CreatureObject*> player;
	uint32 buffCRC;
	float drainPercent;
	Vector3 lastPosition;

public:
	static const int TICK_MS = 1000;
	static const int MOVE_DISTANCE = 1; // meters moved since the last tick that count as running

	JediBuffDrainTask(CreatureObject* pl, uint32 crc, float percent) : buffCRC(crc), drainPercent(percent) {
		player = pl;
		lastPosition = pl->getWorldPosition();
	}

	static String getDrainTaskName() {
		return "jedibuffdrain";
	}

	void run() {
		Locker playerLocker(player);

		Reference<JediBuffDrainTask*> self = player->getPendingTask(getDrainTaskName()).castTo<JediBuffDrainTask*>();

		// Cancelled (buff toggled off) or replaced by a newer task.
		if (self == nullptr || self.get() != this)
			return;

		if (!player->hasBuff(buffCRC)) {
			player->removePendingTask(getDrainTaskName());
			return;
		}

		Vector3 position = player->getWorldPosition();
		bool moving = position.distanceTo(lastPosition) >= MOVE_DISTANCE;
		lastPosition = position;

		if (moving) {
			ManagedReference<PlayerObject*> ghost = player->getPlayerObject();

			if (ghost == nullptr) {
				player->removePendingTask(getDrainTaskName());
				return;
			}

			int force = ghost->getForcePower();

			// % of max Force each second, never less than 1 so small pools still drain.
			int drainPerTick = (int)((ghost->getForcePowerMax() * drainPercent / 100.f) + .5f);

			if (drainPerTick < 1)
				drainPerTick = 1;

			if (force < drainPerTick) {
				ghost->setForcePower(0);
				player->removePendingTask(getDrainTaskName());
				player->removeBuff(buffCRC);
				player->sendSystemMessage("Your Force is depleted and you can no longer Force Run.");
				return;
			}

			ghost->setForcePower(force - drainPerTick);
		}

		reschedule(TICK_MS);
	}
};

#endif /* JEDIBUFFDRAINTASK_H_ */
