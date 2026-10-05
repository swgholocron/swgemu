/*
 * JediBuffEffectTask.h
 *
 * Replays a short client effect while a Jedi buff is active. The client plays an effect for a fixed
 * time and the server cannot cancel it, so a long effect (e.g. the 120s force run aura) keeps going
 * after the buff is toggled off. Using a short effect and replaying it only while the buff is up makes
 * the visual end shortly after the buff does.
 */

#ifndef JEDIBUFFEFFECTTASK_H_
#define JEDIBUFFEFFECTTASK_H_

#include "engine/engine.h"
#include "server/zone/objects/creature/CreatureObject.h"

class JediBuffEffectTask : public Task {
	ManagedReference<CreatureObject*> player;
	uint32 buffCRC;
	String effect;

public:
	static const int REPLAY_MS = 2500;

	JediBuffEffectTask(CreatureObject* pl, uint32 crc, const String& fx) : buffCRC(crc), effect(fx) {
		player = pl;
	}

	static String getEffectTaskName() {
		return "jedibuffeffect";
	}

	void run() {
		Locker playerLocker(player);

		Reference<JediBuffEffectTask*> self = player->getPendingTask(getEffectTaskName()).castTo<JediBuffEffectTask*>();

		// Cancelled (buff toggled off) or replaced by a newer task.
		if (self == nullptr || self.get() != this)
			return;

		if (!player->hasBuff(buffCRC)) {
			player->removePendingTask(getEffectTaskName());
			return;
		}

		player->playEffect(effect, "");

		reschedule(REPLAY_MS);
	}
};

#endif /* JEDIBUFFEFFECTTASK_H_ */
