/*
 * AttachmentImplementation.cpp
 *
 *  Created on: Mar 10, 2011
 *      Author: polonel
 */

#include "server/zone/objects/tangible/attachment/Attachment.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/ZoneProcessServer.h"
#include "server/zone/packets/scene/AttributeListMessage.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/managers/loot/LootManager.h"
#include "server/zone/managers/loot/LootValues.h"
#include "server/zone/managers/stringid/StringIdManager.h"

void AttachmentImplementation::initializeMembers() {
	if (gameObjectType == SceneObjectType::CLOTHINGATTACHMENT) {
		setOptionsBitmask(32, true);
		attachmentType = CLOTHINGTYPE;

	} else if (gameObjectType == SceneObjectType::ARMORATTACHMENT) {
		setOptionsBitmask(32, true);
		attachmentType = ARMORTYPE;

	} else if (gameObjectType == SceneObjectType::WEAPONATTACHMENT) {
		setOptionsBitmask(32, true);
		attachmentType = WEAPONTYPE;
	}
}

void AttachmentImplementation::initializeTransientMembers() {
	TangibleObjectImplementation::initializeTransientMembers();

	setLoggingName("AttachmentObject");

	// This is here to convert the existing HashTable to a VectorMap
	if (skillModifiers.size() < 1) {
		HashTableIterator<String, int> iterator = skillModMap.iterator();

		String key = "";
		int value = 0;

		for (int i = 0; i < skillModMap.size(); ++i) {
			iterator.getNextKeyAndValue(key, value);

			skillModifiers.put(key, value);
		}
	}
}

void AttachmentImplementation::updateCraftingValues(CraftingValues* values, bool firstUpdate) {
	float level = values->hasExperimentalAttribute("creatureLevel") ? values->getCurrentValue("creatureLevel") : 1;
	float bonus = values->hasExperimentalAttribute("modifier") ? values->getCurrentValue("modifier") : 1;

	generateSkillModsForLevel(level, bonus);
}

void AttachmentImplementation::generateSkillMods(int level) {
	generateSkillModsForLevel(level, 1.f);
}

void AttachmentImplementation::generateSkillModsForLevel(float level, float bonus) {
	auto zoneServer = getZoneServer();

	if (zoneServer == nullptr) {
		return;
	}

	auto lootManager = zoneServer->getLootManager();

	if (lootManager == nullptr) {
		return;
	}

	skillModifiers.removeAll();

	float rank = LootValues::getLevelRankValue(level, 0.2f, 0.9f);

	int chance = rank * bonus * 100.f;
	int roll = System::random(1000);
	int modCount = 1;

	int pivot = chance - roll;

	if (pivot < 40) {
		modCount = 1;
	} else if (pivot < 70) {
		modCount = System::random(1) + 1;
	} else if (pivot < 100) {
		modCount = System::random(2) + 1;
	} else {
		modCount = System::random(1) + 2;
	}

	for (int i = 0; i < modCount; ++i) {
		float step = 1.f - ((i / (float)modCount) * 0.5f);
		int min = Math::clamp(-1, (int)round(0.075f * level) - 1, 25) * step;
		int max = Math::clamp(-1, (int)round(0.125f * level) + 1, 25);
		int mod = System::random(max - min) + min;

		String modName = lootManager->getRandomLootableMod(gameObjectType);

		if (modName.isEmpty()) {
			continue;
		}

		skillModifiers.put(modName, ((mod <= 0) ? 1 : mod));
	}

	StringBuffer name;

	// Weapon attachments read "Weapon Attachment: +20 Pistol Aiming"; armor/clothing attachments "Pistol Aiming +20".
	bool weaponAttachment = (gameObjectType == SceneObjectType::WEAPONATTACHMENT);

	if (weaponAttachment)
		name << "Weapon Attachment: ";

	for (int i = 0; i < skillModifiers.size(); ++i) {
		if (i > 0)
			name << ", ";

		const String& key = skillModifiers.elementAt(i).getKey();

		// Custom names are not localized by the client, so resolve the stat's display name here.
		String statName = StringIdManager::instance()->getStringId(String("@stat_n:" + key).hashCode()).toString();

		if (statName.isEmpty()) {
			statName = key;

			for (int c = 0; c < statName.length(); ++c) {
				if (statName.charAt(c) == '_')
					statName = statName.replaceFirst("_", " ");
			}
		}

		if (weaponAttachment)
			name << "+" << skillModifiers.elementAt(i).getValue() << " " << statName;
		else
			name << statName << " +" << skillModifiers.elementAt(i).getValue();
	}

	setCustomObjectName(name.toString(), true);
}

void AttachmentImplementation::fillAttributeList(AttributeListMessage* msg, CreatureObject* object) {
	TangibleObjectImplementation::fillAttributeList(msg, object);

	StringBuffer name;

	for (int i = 0; i < skillModifiers.size(); i++) {
		auto key = skillModifiers.elementAt(i).getKey();
		auto value = skillModifiers.elementAt(i).getValue();

		name << "cat_skill_mod_bonus.@stat_n:" << key;

		msg->insertAttribute(name.toString(), value);

		name.deleteAll();
	}
}
