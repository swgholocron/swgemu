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
	inline bool containsTemplate(SceneObject* parent, uint32 crc, int depth = 0) {
		if (parent == nullptr || depth > 8)
			return false;

		for (int i = 0; i < parent->getContainerObjectsSize(); ++i) {
			ManagedReference<SceneObject*> child = parent->getContainerObject(i);

			if (child == nullptr)
				continue;

			if (child->getServerObjectCRC() == crc || containsTemplate(child, crc, depth + 1))
				return true;
		}

		return false;
	}

	// True if the character wears, carries or has banked an item made from the template.
	inline bool hasTemplate(CreatureObject* creature, uint32 crc) {
		for (int i = 0; i < creature->getSlottedObjectsSize(); ++i) {
			ManagedReference<SceneObject*> object = creature->getSlottedObject(i);

			if (object == nullptr)
				continue;

			if (object->getServerObjectCRC() == crc || containsTemplate(object, crc))
				return true;
		}

		return false;
	}

	// Creates the robe in the inventory unless the character already has one.
	inline void giveRobeIfMissing(CreatureObject* creature, const String& robePath) {
		uint32 crc = robePath.hashCode();

		if (hasTemplate(creature, crc))
			return;

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
	}

	// Gives a Grey Jedi the starter schematics and the Grey Jedi robes their skills earn: the starter robe with the
	// first skill and the mantle with the last. A missing robe is created again. Safe to call repeatedly.
	inline void giveStarterKit(CreatureObject* creature, PlayerObject* ghost) {
		if (creature == nullptr || ghost == nullptr || !creature->isPlayerCreature())
			return;

		Vector<String> groups;
		groups.add("craftSaberTraining");
		groups.add("craftJediTool");

		SchematicMap::instance()->addSchematics(ghost, groups, true);

		if (creature->hasSkill(firstSkill()))
			giveRobeIfMissing(creature, "object/tangible/wearables/robe/robe_jedi_gray_01.iff");

		if (creature->hasSkill(masterSkill()))
			giveRobeIfMissing(creature, "object/tangible/wearables/robe/robe_jedi_gray_02.iff");
	}
}

#endif /* GREYJEDI_H_ */
