/*
 * GreyJedi.h
 *
 * Helpers for Grey Jedi, who learn the combat_jedi_* and force_rank_gray_* skills instead of going through
 * the village / Padawan path. They get the same starter kit and the same lightsaber crystal tuning as a
 * regular Jedi.
 */

#ifndef GREYJEDI_H_
#define GREYJEDI_H_

#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/creature/variables/Skill.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/managers/crafting/schematicmap/SchematicMap.h"
#include "server/zone/ZoneServer.h"

namespace GreyJedi {

	// First skill of the Grey Jedi path.
	inline const char* firstSkill() {
		return "combat_jedi_novice";
	}

	// True for the skill boxes of the Grey Jedi path.
	inline bool isGreyJediSkillName(const String& name) {
		return name.beginsWith("combat_jedi") || name.beginsWith("force_rank_gray");
	}

	// True when the character has any Grey Jedi skill.
	inline bool hasGreyJediSkill(CreatureObject* creature) {
		if (creature == nullptr)
			return false;

		const SkillList* list = creature->getSkillList();

		for (int i = 0; i < list->size(); ++i) {
			Skill* skill = list->get(i);

			if (skill == nullptr)
				continue;

			const String& name = skill->getSkillName();

			if (isGreyJediSkillName(name))
				return true;
		}

		return false;
	}

	// Regular Jedi (Padawan or better) and Grey Jedi may tune lightsaber crystals and pearls.
	inline bool canTuneCrystals(CreatureObject* creature) {
		return creature->hasSkill("force_title_jedi_rank_01") || hasGreyJediSkill(creature);
	}

	// Last skill of the Grey Jedi path.
	inline const char* masterSkill() {
		return "force_rank_gray_master";
	}

	// True when the character has any Jedi-tree skill requirement that a Grey Jedi stands in for.
	inline bool isJediSkillName(const String& name) {
		return name.beginsWith("force_title_jedi") || name.beginsWith("force_rank_") || name.beginsWith("jedi_") || name.beginsWith("combat_jedi") || name.beginsWith("force_sensitive") || name.beginsWith("force_discipline");
	}

	// A Grey Jedi may use or wear anything a Jedi can: if an item asks for any Jedi skill, a Grey Jedi qualifies.
	inline bool meetsJediRequirement(CreatureObject* creature, const Vector<String>& skillsRequired) {
		if (!hasGreyJediSkill(creature))
			return false;

		for (int i = 0; i < skillsRequired.size(); ++i) {
			if (isJediSkillName(skillsRequired.get(i)))
				return true;
		}

		return false;
	}

	// Searches everything below an object (inventory, bank, bags) for an item made from the template CRC.
	// Returns its object ID, or 0.
	inline uint64 findTemplate(SceneObject* parent, uint32 crc, int depth = 0) {
		if (parent == nullptr || depth > 8)
			return 0;

		for (int i = 0; i < parent->getContainerObjectsSize(); ++i) {
			ManagedReference<SceneObject*> child = parent->getContainerObject(i);

			if (child == nullptr)
				continue;

			if (child->getServerObjectCRC() == crc)
				return child->getObjectID();

			uint64 found = findTemplate(child, crc, depth + 1);

			if (found != 0)
				return found;
		}

		return 0;
	}

	// Object ID of the item made from the template that the character wears, carries or has banked, or 0.
	inline uint64 findTemplate(CreatureObject* creature, uint32 crc) {
		for (int i = 0; i < creature->getSlottedObjectsSize(); ++i) {
			ManagedReference<SceneObject*> object = creature->getSlottedObject(i);

			if (object == nullptr)
				continue;

			if (object->getServerObjectCRC() == crc)
				return object->getObjectID();

			uint64 found = findTemplate(object.get(), crc);

			if (found != 0)
				return found;
		}

		return 0;
	}

	// Creates the robe in the inventory unless the character already has one. The robe given is recorded on the
	// character (by object ID), so it is not given again for as long as that robe still exists anywhere, even if it
	// has been moved somewhere the search above does not reach. If the recorded robe is gone (destroyed or deleted)
	// a new one is created.
	inline void giveRobeIfMissing(CreatureObject* creature, PlayerObject* ghost, const String& robePath) {
		uint32 crc = robePath.hashCode();
		String recordKey = "robe_" + String::valueOf(crc);

		String recorded = ghost->getScreenPlayData("GreyJedi", recordKey);

		if (!recorded.isEmpty()) {
			uint64 recordedID = UnsignedLong::valueOf(recorded);

			if (recordedID != 0 && creature->getZoneServer()->getObject(recordedID) != nullptr)
				return;
		}

		uint64 owned = findTemplate(creature, crc);

		if (owned != 0) {
			ghost->setScreenPlayData("GreyJedi", recordKey, String::valueOf(owned));
			return;
		}

		ManagedReference<SceneObject*> inventory = creature->getSlottedObject("inventory");

		if (inventory == nullptr || inventory->isContainerFullRecursive()) {
			creature->sendSystemMessage("@jedi_spam:inventory_full_jedi_robe"); // retried on the next login
			return;
		}

		ManagedReference<SceneObject*> robe = creature->getZoneServer()->createObject(crc, 2);

		if (robe == nullptr)
			return;

		Locker robeLocker(robe, creature);

		if (!inventory->transferObject(robe, -1, true)) {
			robe->destroyObjectFromDatabase(true);
			return;
		}

		inventory->broadcastObject(robe, true);

		ghost->setScreenPlayData("GreyJedi", recordKey, String::valueOf(robe->getObjectID()));
	}

	// Gives a Grey Jedi the starter schematics and the Grey Jedi robes their skills earn: the starter robe with the
	// first skill and the mantle with the last. A robe is only created if none exists. Safe to call repeatedly.
	inline void giveStarterKit(CreatureObject* creature, PlayerObject* ghost) {
		if (creature == nullptr || ghost == nullptr || !creature->isPlayerCreature())
			return;

		Vector<String> groups;
		groups.add("craftSaberTraining");
		groups.add("craftJediTool");

		SchematicMap::instance()->addSchematics(ghost, groups, true);

		if (creature->hasSkill(firstSkill()))
			giveRobeIfMissing(creature, ghost, "object/tangible/wearables/robe/robe_jedi_gray_01.iff");

		if (creature->hasSkill(masterSkill()))
			giveRobeIfMissing(creature, ghost, "object/tangible/wearables/robe/robe_jedi_gray_02.iff");
	}
}

#endif /* GREYJEDI_H_ */
