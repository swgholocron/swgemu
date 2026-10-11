/*
 * DurabilityRules.h
 *
 * Clothing and jewelry have no durability on this server: they never take
 * condition damage (death decay, repairs, etc.) and never show a condition.
 * Armor, weapons and everything else keep the normal condition system.
 */

#ifndef DURABILITYRULES_H_
#define DURABILITYRULES_H_

#include "server/zone/objects/scene/SceneObjectType.h"

class DurabilityRules {
public:
	static bool isDurabilityFree(uint32 gameObjectType) {
		// Jewelry: JEWELRY, RING, BRACELET, NECKLACE, EARRING
		if (gameObjectType >= SceneObjectType::JEWELRY && gameObjectType <= SceneObjectType::EARRING)
			return true;

		// Clothing: CLOTHING through SKIRT (bandolier, belt, robe, shirt, ...)
		if (gameObjectType >= SceneObjectType::CLOTHING && gameObjectType <= SceneObjectType::SKIRT)
			return true;

		return false;
	}
};

#endif /* DURABILITYRULES_H_ */
