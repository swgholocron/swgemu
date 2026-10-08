-- Exar Kun relic sabers: the client files exist in holocron.tre but no server templates did (Flurry never defined them either).
object_weapon_melee_sword_crafted_saber_sword_lightsaber_onehanded_gen5_exar_kun = object_weapon_melee_sword_crafted_saber_shared_sword_lightsaber_onehanded_gen5_exar_kun:new {
	playerRaces = {
		"object/creature/player/bothan_male.iff",
		"object/creature/player/bothan_female.iff",
		"object/creature/player/human_male.iff",
		"object/creature/player/human_female.iff",
		"object/creature/player/ithorian_male.iff",
		"object/creature/player/ithorian_female.iff",
		"object/creature/player/moncal_male.iff",
		"object/creature/player/moncal_female.iff",
		"object/creature/player/rodian_male.iff",
		"object/creature/player/rodian_female.iff",
		"object/creature/player/sullustan_male.iff",
		"object/creature/player/sullustan_female.iff",
		"object/creature/player/trandoshan_male.iff",
		"object/creature/player/trandoshan_female.iff",
		"object/creature/player/twilek_male.iff",
		"object/creature/player/twilek_female.iff",
		"object/creature/player/wookiee_male.iff",
		"object/creature/player/wookiee_female.iff",
		"object/creature/player/zabrak_male.iff",
		"object/creature/player/zabrak_female.iff"
	},

	-- RANGEDATTACK, MELEEATTACK, FORCEATTACK, TRAPATTACK, GRENADEATTACK, HEAVYACIDBEAMATTACK, 
	-- HEAVYLIGHTNINGBEAMATTACK, HEAVYPARTICLEBEAMATTACK, HEAVYROCKETLAUNCHERATTACK, HEAVYLAUNCHERATTACK
	attackType = MELEEATTACK,

	-- ENERGY, KINETIC, ELECTRICITY, STUN, BLAST, HEAT, COLD, ACID, LIGHTSABER
	damageType = LIGHTSABER,

	-- NONE, LIGHT, MEDIUM, HEAVY
	armorPiercing = MEDIUM,

	-- combat_rangedspecialize_bactarifle, combat_rangedspecialize_rifle, combat_rangedspecialize_pistol, combat_rangedspecialize_heavy, combat_rangedspecialize_carbine
	-- combat_meleespecialize_unarmed, combat_meleespecialize_twohand, combat_meleespecialize_polearm, combat_meleespecialize_onehand, combat_general,
	-- combat_meleespecialize_twohandlightsaber, combat_meleespecialize_polearmlightsaber, jedi_general
	xpType = "jedi_general",
	
	-- See http://www.ocdsoft.com/files/certifications.xls
	certificationsRequired = { "cert_onehandlightsaber_gen4" },
	-- See http://www.ocdsoft.com/files/accuracy.xls
	creatureAccuracyModifiers = { "onehandlightsaber_accuracy" },

	-- See http://www.ocdsoft.com/files/defense.xls
	defenderDefenseModifiers = { "melee_defense" },

	-- Leave as "dodge" for now, may have additions later
	defenderSecondaryDefenseModifiers = { "saber_block" },

	-- See http://www.ocdsoft.com/files/speed.xls
	speedModifiers = { "onehandlightsaber_speed" },

	-- Leave blank for now
	damageModifiers = { },
	
	defenderToughnessModifiers = { "lightsaber_toughness" },
  	
	noTrade = 1,
   
	-- The values below are the default values.  To be used for blue frog objects primarily
	healthAttackCost = 0,
	actionAttackCost = 0,
	mindAttackCost = 0,
	forceCost = 0,

	pointBlankRange = 0,
	pointBlankAccuracy = 20,

	idealRange = 3,
	idealAccuracy = 15,

	maxRange = 5,
	maxRangeAccuracy = 5,

	attackSpeed = 4.5,

	woundsRatio = 45,
}
ObjectTemplates:addTemplate(object_weapon_melee_sword_crafted_saber_sword_lightsaber_onehanded_gen5_exar_kun, "object/weapon/melee/sword/crafted_saber/sword_lightsaber_onehanded_gen5_exar_kun.iff")

object_draft_schematic_weapon_lightsaber_lightsaber_onehanded_gen5_exar_kun = object_draft_schematic_weapon_lightsaber_shared_lightsaber_onehanded_gen5_exar_kun:new {
    factoryCrateType = "object/factory/factory_crate_weapon.iff"
}
ObjectTemplates:addTemplate(object_draft_schematic_weapon_lightsaber_lightsaber_onehanded_gen5_exar_kun, "object/draft_schematic/weapon/lightsaber/lightsaber_onehanded_gen5_exar_kun.iff")

object_tangible_loot_loot_schematic_sword_lightsaber_onehanded_gen5_exar_kun_schematic = object_tangible_loot_loot_schematic_shared_sword_lightsaber_onehanded_gen5_exar_kun_schematic:new {
	templateType = LOOTSCHEMATIC,
	objectMenuComponent = "LootSchematicMenuComponent",
	attributeListComponent = "LootSchematicAttributeListComponent",
	requiredSkill = "",
	targetDraftSchematic = "object/draft_schematic/weapon/lightsaber/lightsaber_onehanded_gen5_exar_kun.iff",
	targetUseCount = 1,
}
ObjectTemplates:addTemplate(object_tangible_loot_loot_schematic_sword_lightsaber_onehanded_gen5_exar_kun_schematic, "object/tangible/loot/loot_schematic/sword_lightsaber_onehanded_gen5_exar_kun_schematic.iff")

object_weapon_melee_polearm_crafted_saber_sword_lightsaber_polearm_gen5_exar_kun = object_weapon_melee_polearm_crafted_saber_shared_sword_lightsaber_polearm_gen5_exar_kun:new {
	playerRaces = {
		"object/creature/player/bothan_male.iff",
		"object/creature/player/bothan_female.iff",
		"object/creature/player/human_male.iff",
		"object/creature/player/human_female.iff",
		"object/creature/player/ithorian_male.iff",
		"object/creature/player/ithorian_female.iff",
		"object/creature/player/moncal_male.iff",
		"object/creature/player/moncal_female.iff",
		"object/creature/player/rodian_male.iff",
		"object/creature/player/rodian_female.iff",
		"object/creature/player/sullustan_male.iff",
		"object/creature/player/sullustan_female.iff",
		"object/creature/player/trandoshan_male.iff",
		"object/creature/player/trandoshan_female.iff",
		"object/creature/player/twilek_male.iff",
		"object/creature/player/twilek_female.iff",
		"object/creature/player/wookiee_male.iff",
		"object/creature/player/wookiee_female.iff",
		"object/creature/player/zabrak_male.iff",
		"object/creature/player/zabrak_female.iff"
	},

	-- RANGEDATTACK, MELEEATTACK, FORCEATTACK, TRAPATTACK, GRENADEATTACK, HEAVYACIDBEAMATTACK, 
	-- HEAVYLIGHTNINGBEAMATTACK, HEAVYPARTICLEBEAMATTACK, HEAVYROCKETLAUNCHERATTACK, HEAVYLAUNCHERATTACK
	attackType = MELEEATTACK,

	-- ENERGY, KINETIC, ELECTRICITY, STUN, BLAST, HEAT, COLD, ACID, LIGHTSABER
	damageType = LIGHTSABER,

	-- NONE, LIGHT, MEDIUM, HEAVY
	armorPiercing = MEDIUM,

	-- combat_rangedspecialize_bactarifle, combat_rangedspecialize_rifle, combat_rangedspecialize_pistol, combat_rangedspecialize_heavy, combat_rangedspecialize_carbine
	-- combat_meleespecialize_unarmed, combat_meleespecialize_twohand, combat_meleespecialize_polearm, combat_meleespecialize_onehand, combat_general,
	-- combat_meleespecialize_twohandlightsaber, jedi_general, combat_meleespecialize_onehandlightsaber
	xpType = "jedi_general",

	-- See http://www.ocdsoft.com/files/certifications.xls
	certificationsRequired = { "cert_polearmlightsaber_gen4" },
	-- See http://www.ocdsoft.com/files/accuracy.xls
	creatureAccuracyModifiers = { "polearmlightsaber_accuracy" },

	-- See http://www.ocdsoft.com/files/defense.xls
	defenderDefenseModifiers = { "melee_defense" },

	-- Leave as "dodge" for now, may have additions later
	defenderSecondaryDefenseModifiers = { "saber_block" },

	-- See http://www.ocdsoft.com/files/speed.xls
	speedModifiers = { "polearmlightsaber_speed" },

	-- Leave blank for now
	damageModifiers = { },

	defenderToughnessModifiers = { "lightsaber_toughness" },

	-- The values below are the default values.  To be used for blue frog objects primarily
	gameObjectType = 131090,

	healthAttackCost = 0,
	actionAttackCost = 0,
	mindAttackCost = 0,
	forceCost = 0,

	pointBlankRange = 0,
	pointBlankAccuracy = 20,

	idealRange = 3,
	idealAccuracy = 15,

	maxRange = 5,
	maxRangeAccuracy = 5,

	minDamage = 225,
	maxDamage = 305,

	attackSpeed = 0,

	woundsRatio = 45,

	noTrade = 1,
}
ObjectTemplates:addTemplate(object_weapon_melee_polearm_crafted_saber_sword_lightsaber_polearm_gen5_exar_kun, "object/weapon/melee/polearm/crafted_saber/sword_lightsaber_polearm_gen5_exar_kun.iff")

object_draft_schematic_weapon_lightsaber_lightsaber_polearm_gen5_exar_kun = object_draft_schematic_weapon_lightsaber_shared_lightsaber_polearm_gen5_exar_kun:new {
    factoryCrateType = "object/factory/factory_crate_weapon.iff"
}
ObjectTemplates:addTemplate(object_draft_schematic_weapon_lightsaber_lightsaber_polearm_gen5_exar_kun, "object/draft_schematic/weapon/lightsaber/lightsaber_polearm_gen5_exar_kun.iff")

object_tangible_loot_loot_schematic_sword_lightsaber_polearm_gen5_exar_kun_schematic = object_tangible_loot_loot_schematic_shared_sword_lightsaber_polearm_gen5_exar_kun_schematic:new {
	templateType = LOOTSCHEMATIC,
	objectMenuComponent = "LootSchematicMenuComponent",
	attributeListComponent = "LootSchematicAttributeListComponent",
	requiredSkill = "",
	targetDraftSchematic = "object/draft_schematic/weapon/lightsaber/lightsaber_polearm_gen5_exar_kun.iff",
	targetUseCount = 1,
}
ObjectTemplates:addTemplate(object_tangible_loot_loot_schematic_sword_lightsaber_polearm_gen5_exar_kun_schematic, "object/tangible/loot/loot_schematic/sword_lightsaber_polearm_gen5_exar_kun_schematic.iff")
