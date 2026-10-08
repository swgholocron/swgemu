-- Ported from SWG Infinity for the Death Watch Bunker changes (server templates)

object_draft_schematic_armor_armor_segment_mandalorian = object_draft_schematic_armor_shared_armor_segment_mandalorian:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "Mandalorian Armor Segment",

	craftingToolTab = 2, -- (See DraftSchematicObjectTemplate.h)
	complexity = 1,
	size = 6,
	factoryCrateSize = 0,

	xpType = "crafting_clothing_armor",
	xp = 35,

	assemblySkill = "armor_assembly",
	experimentingSkill = "armor_experimentation",
	customizationSkill = "armor_customization",

	customizationOptions = {},
	customizationStringNames = {},
	customizationDefaults = {},

	ingredientTemplateNames = {"craft_armor_ingredients_n", "craft_armor_ingredients_n", "craft_armor_ingredients_n", "craft_armor_ingredients_n", "craft_armor_ingredients_n", "craft_armor_ingredients_n", "craft_armor_ingredients_n"},
	ingredientTitleNames = {"segment_layer_assembly_plate", "armor_layer_weld_tabs", "segment_mounting_tabs", "defensive_layer", "defensive_layer_2", "defensive_layer_3", "segment_enhancement"},
	ingredientSlotType = {0, 0, 0, 3, 3, 3, 3},
	resourceTypes = {"iron_colat", "steel_kiirium", "copper_polysteel", "object/tangible/component/armor/shared_armor_layer.iff", "object/tangible/component/armor/shared_armor_layer.iff", "object/tangible/component/armor/shared_armor_layer.iff", "object/tangible/component/armor/shared_base_armor_segment_enhancement.iff"},
	resourceQuantities = {16, 8, 5, 1, 1, 1, 1},
	contribution = {100, 100, 100, 100, 100, 100, 100},

	targetTemplate = "object/tangible/component/armor/armor_segment_mandalorian.iff",

	additionalTemplates = {}
}
ObjectTemplates:addTemplate(object_draft_schematic_armor_armor_segment_mandalorian, "object/draft_schematic/armor/armor_segment_mandalorian.iff")

object_draft_schematic_clothing_clothing_armor_mandalorian_shoes = object_draft_schematic_clothing_shared_clothing_armor_mandalorian_shoes:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Mandalorian Armor Boots",

   craftingToolTab = 2, -- (See DraftSchematicObjectTemplate.h)
   complexity = 1,
   size = 4,
   factoryCrateSize = 0,

   xpType = "crafting_clothing_armor",
   xp = 420,

   assemblySkill = "armor_assembly",
   experimentingSkill = "armor_experimentation",
   customizationSkill = "armor_customization",

   customizationOptions = {2},
   customizationStringNames = {"/private/index_color_1"},
   customizationDefaults = {0},

   ingredientTemplateNames = {"craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n", "craft_clothing_ingredients_n"},
   ingredientTitleNames = {"auxilary_coverage", "body", "liner", "hardware_and_attachments", "binding_and_reinforcement", "padding", "armor", "load_bearing_harness", "reinforcement"},
   ingredientSlotType = {0, 0, 0, 0, 0, 0, 1, 1, 1},
   resourceTypes = {"ore_intrusive", "fuel_petrochem_solid_known", "fiberplast_naboo", "aluminum", "copper_beyrllius", "hide_wooly", "object/tangible/component/armor/shared_armor_segment_mandalorian.iff", "object/tangible/component/clothing/shared_synthetic_cloth.iff", "object/tangible/component/clothing/shared_reinforced_fiber_panels.iff"},
   resourceQuantities = {50, 50, 25, 30, 20, 20, 1, 1, 1},
   contribution = {100, 100, 100, 100, 100, 100, 100, 100, 100},


   targetTemplate = "object/tangible/wearables/armor/mandalorian/armor_mandalorian_shoes.iff",

   additionalTemplates = {
             }


}
ObjectTemplates:addTemplate(object_draft_schematic_clothing_clothing_armor_mandalorian_shoes, "object/draft_schematic/clothing/clothing_armor_mandalorian_shoes.iff")

object_draft_schematic_munition_grenade_cortosis = object_draft_schematic_munition_shared_grenade_cortosis:new {

   templateType = DRAFTSCHEMATIC,

   customObjectName = "Cortosis Grenade",

   craftingToolTab = 1, -- (See DraftSchematicObjectTemplate.h)
   complexity = 1, 
   size = 4, 
	factoryCrateSize = 5000,

   xpType = "crafting_weapons_general", 
   xp = 90, 

   assemblySkill = "weapon_assembly", 
   experimentingSkill = "weapon_experimentation", 
   customizationSkill = "weapon_customization", 

   customizationOptions = {},
   customizationStringNames = {},
   customizationDefaults = {},

   ingredientTemplateNames = {"craft_munition_ingredients_n", "craft_munition_ingredients_n", "craft_munition_ingredients_n", "craft_munition_ingredients_n", "craft_munition_ingredients_n"},
   ingredientTitleNames = {"trigger_and_timer_mechanism", "activation_agent_mechanism", "warhead_assembly", "warhead_fusing", "warhead_booster"},
   ingredientSlotType = {0, 0, 1, 1, 3},
   resourceTypes = {"steel", "radioactive", "object/tangible/component/munition/shared_warhead_light.iff", "object/tangible/component/munition/shared_warhead_fusing_mechanism.iff", "object/tangible/component/munition/shared_enhanced_charge_composition.iff"},
   resourceQuantities = {25, 20, 1, 1, 1},
   contribution = {100, 100, 100, 100, 100},


   targetTemplate = "object/weapon/ranged/grenade/grenade_cortosis.iff",

   additionalTemplates = {
             }

}
ObjectTemplates:addTemplate(object_draft_schematic_munition_grenade_cortosis, "object/draft_schematic/munition/grenade_cortosis.iff")

object_draft_schematic_structure_musty_house_schem = object_draft_schematic_structure_shared_musty_house_schem:new {

   templateType = DRAFTSCHEMATIC,

   --customObjectName = "Deed for: Mustafarian Bunker",

 	craftingToolTab = 1024, -- (See DraftSchematicObjectTemplate.h)
	complexity = 1,
	size = 14,
	factoryCrateSize = 0,

	xpType = "crafting_structure_general",
	xp = 10000,

	assemblySkill = "structure_assembly",
	experimentingSkill = "structure_experimentation",
	customizationSkill = "structure_customization",

	customizationOptions = {},
	customizationStringNames = {},
	customizationDefaults = {},

	ingredientTemplateNames = {"craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n", "craft_structure_ingredients_n"},
	ingredientTitleNames = {"load_bearing_structure_and_shell", "insulation_and_covering", "foundation", "wall_sections", "power_supply_unit", "storage_space"},
	ingredientSlotType = {0, 0, 0, 2, 1, 1},
	resourceTypes = {"metal", "ore", "ore", "object/tangible/component/structure/shared_wall_module.iff", "object/tangible/component/structure/shared_power_core_unit.iff", "object/tangible/component/structure/shared_structure_storage_section.iff"},
	resourceQuantities = {1500, 2500, 400, 10, 1, 2},
	contribution = {100, 100, 100, 100, 100, 100},


   targetTemplate = "object/tangible/deed/player_house_deed/musty_house_deed.iff",

   additionalTemplates = {}

}
ObjectTemplates:addTemplate(object_draft_schematic_structure_musty_house_schem, "object/draft_schematic/structure/musty_house_schem.iff")

object_draft_schematic_vehicle_civilian_stap_speeder = object_draft_schematic_vehicle_civilian_shared_stap_speeder:new {

	templateType = DRAFTSCHEMATIC,

	customObjectName = "STAP Speeder",

	craftingToolTab = 16, -- (See DraftSchematicObjectTemplate.h)
	complexity = 1,
	size = 1,
	factoryCrateSize = 0,

	xpType = "crafting_general",
	xp = 1600,

	assemblySkill = "general_assembly",
	experimentingSkill = "general_experimentation",
	customizationSkill = "clothing_customization",

	customizationOptions = {},
	customizationStringNames = {},
	customizationDefaults = {},

	ingredientTemplateNames = {"craft_vehicle_ingredients_n", "craft_vehicle_ingredients_n"},
	ingredientTitleNames = {"vehicle_body", "structural_frame"},
	ingredientSlotType = {0, 0},
	resourceTypes = {"metal_nonferrous", "metal_ferrous"},
	resourceQuantities = {2000, 6950},
	contribution = {100, 100},

	targetTemplate = "object/tangible/deed/vehicle_deed/speeder_stap_deed.iff",

	additionalTemplates = {}
}
ObjectTemplates:addTemplate(object_draft_schematic_vehicle_civilian_stap_speeder, "object/draft_schematic/vehicle/civilian/speeder_stap.iff")

object_intangible_vehicle_stap_speeder_pcd = object_intangible_vehicle_shared_stap_speeder_pcd:new {

}
ObjectTemplates:addTemplate(object_intangible_vehicle_stap_speeder_pcd, "object/intangible/vehicle/stap_speeder_pcd.iff")

object_mobile_vehicle_stap_speeder = object_mobile_vehicle_shared_stap_speeder:new {
	templateType = VEHICLE,
	decayRate = 15, -- Damage tick per decay cycle
	decayCycle = 600 -- Time in seconds per cycle
}
ObjectTemplates:addTemplate(object_mobile_vehicle_stap_speeder, "object/mobile/vehicle/stap_speeder.iff")

object_tangible_component_armor_armor_segment_mandalorian = object_tangible_component_armor_shared_armor_segment_mandalorian:new {

	numberExperimentalProperties = {1, 1, 1, 2, 2, 2, 2, 2, 1, 1, 2, 1},
	experimentalProperties = {"XX", "XX", "XX", "OQ", "SR", "OQ", "UT", "MA", "OQ", "MA", "OQ", "MA", "OQ", "XX", "XX", "OQ", "SR", "XX"},
	experimentalWeights = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
	experimentalGroupTitles = {"null", "null", "exp_durability", "exp_quality", "exp_durability", "exp_durability", "exp_durability", "exp_durability", "null", "null", "exp_resistance", "null"},
	experimentalSubGroupTitles = {"null", "null", "hit_points", "armor_effectiveness", "armor_integrity", "armor_health_encumbrance", "armor_action_encumbrance", "armor_mind_encumbrance", "armor_rating", "armor_special_type", "armor_special_effectiveness", "armor_special_integrity"},
	experimentalMin = {0, 0, 1000, 1, 100, 15, 15, 9, 1, 16, 2, 100},
	experimentalMax = {0, 0, 1000, 25, 1000, 1, 1, 1, 1, 16, 45.5, 1000},
	experimentalPrecision = {0, 0, 0, 12, 0, 0, 0, 0, 0, 0, 12, 0},
	experimentalCombineType = {0, 0, 1, 1, 1, 1, 1, 1, 4, 4, 4, 1},
}
ObjectTemplates:addTemplate(object_tangible_component_armor_armor_segment_mandalorian, "object/tangible/component/armor/armor_segment_mandalorian.iff")

object_tangible_deed_vehicle_deed_speeder_stap_deed = object_tangible_deed_vehicle_deed_shared_speeder_stap_deed:new {

	templateType = VEHICLEDEED,

	controlDeviceObjectTemplate = "object/intangible/vehicle/stap_speeder_pcd.iff",
	generatedObjectTemplate = "object/mobile/vehicle/stap_speeder.iff",

	numberExperimentalProperties = {1, 1, 1},
	experimentalProperties = {"XX", "XX", "SR"},
	experimentalWeights = {1, 1, 1},
	experimentalGroupTitles = {"null", "null", "exp_durability"},
	experimentalSubGroupTitles = {"null", "null", "hit_points"},
	experimentalMin = {0, 0, 3000},
	experimentalMax = {0, 0, 5000},
	experimentalPrecision = {0, 0, 0},
	experimentalCombineType = {0, 0, 1},
}
ObjectTemplates:addTemplate(object_tangible_deed_vehicle_deed_speeder_stap_deed, "object/tangible/deed/vehicle_deed/speeder_stap_deed.iff")

object_tangible_loot_loot_schematic_armor_segment_mandalorian_schematic = object_tangible_loot_loot_schematic_shared_armor_segment_mandalorian_schematic:new {
	templateType = LOOTSCHEMATIC,
	objectMenuComponent = "LootSchematicMenuComponent",
	attributeListComponent = "LootSchematicAttributeListComponent",
	requiredSkill = "crafting_armorsmith_master",
	targetDraftSchematic = "object/draft_schematic/armor/armor_segment_mandalorian.iff",
	targetUseCount = 4
}
ObjectTemplates:addTemplate(object_tangible_loot_loot_schematic_armor_segment_mandalorian_schematic, "object/tangible/loot/loot_schematic/armor_segment_mandalorian_schematic.iff")

object_tangible_loot_loot_schematic_grenade_cortosis_schematic = object_tangible_loot_loot_schematic_shared_grenade_cortosis_schematic:new {
	templateType = LOOTSCHEMATIC,
	objectMenuComponent = "LootSchematicMenuComponent",
	attributeListComponent = "LootSchematicAttributeListComponent",
	requiredSkill = "crafting_weaponsmith_master",
	targetDraftSchematic = "object/draft_schematic/munition/grenade_cortosis.iff",
	targetUseCount = 10
}
ObjectTemplates:addTemplate(object_tangible_loot_loot_schematic_grenade_cortosis_schematic, "object/tangible/loot/loot_schematic/cortosis_grenade.iff")

object_tangible_loot_loot_schematic_death_watch_mandalorian_shoes_schematic = object_tangible_loot_loot_schematic_shared_death_watch_mandalorian_shoes_schematic:new {
	templateType = LOOTSCHEMATIC,
	objectMenuComponent = "LootSchematicMenuComponent",
	attributeListComponent = "LootSchematicAttributeListComponent",
	requiredSkill = "crafting_armorsmith_master",
	targetDraftSchematic = "object/draft_schematic/clothing/clothing_armor_mandalorian_shoes.iff",
	targetUseCount = 1
}
ObjectTemplates:addTemplate(object_tangible_loot_loot_schematic_death_watch_mandalorian_shoes_schematic, "object/tangible/loot/loot_schematic/death_watch_mandalorian_shoes_schematic.iff")

object_tangible_loot_loot_schematic_musty_house_loot_schem = object_tangible_loot_loot_schematic_shared_musty_house_loot_schem:new {
	templateType = LOOTSCHEMATIC,
	objectMenuComponent = "LootSchematicMenuComponent",
	attributeListComponent = "LootSchematicAttributeListComponent",
	requiredSkill = "crafting_architect_master",
	targetDraftSchematic = "object/draft_schematic/structure/musty_house_schem.iff",
	targetUseCount = 1,
	
}
ObjectTemplates:addTemplate(object_tangible_loot_loot_schematic_musty_house_loot_schem, "object/tangible/loot/loot_schematic/musty_house_loot_schem.iff")

object_tangible_loot_loot_schematic_stap_speeder_schematic = object_tangible_loot_loot_schematic_shared_stap_speeder_schematic:new {
	templateType = LOOTSCHEMATIC,
	objectMenuComponent = "LootSchematicMenuComponent",
	attributeListComponent = "LootSchematicAttributeListComponent",
	requiredSkill = "crafting_artisan_master",
	targetDraftSchematic = "object/draft_schematic/vehicle/civilian/speeder_stap.iff",
	targetUseCount = 3
}
ObjectTemplates:addTemplate(object_tangible_loot_loot_schematic_stap_speeder_schematic, "object/tangible/loot/loot_schematic/stap_speeder_schematic.iff")

object_weapon_ranged_grenade_grenade_cortosis = object_weapon_ranged_grenade_shared_grenade_cortosis:new {

	objectMenuComponent = "ThrowGrenadeMenuComponent",

	playerRaces = { "object/creature/player/bothan_male.iff",
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
			"object/creature/player/zabrak_male.iff","object/creature/player/chiss_male.iff",
			"object/creature/player/zabrak_female.iff","object/creature/player/chiss_female.iff"},

	-- RANGEDATTACK, MELEEATTACK, FORCEATTACK, TRAPATTACK, GRENADEATTACK, HEAVYACIDBEAMATTACK,
	-- HEAVYLIGHTNINGBEAMATTACK, HEAVYPARTICLEBEAMATTACK, HEAVYROCKETLAUNCHERATTACK, HEAVYLAUNCHERATTACK
	attackType = GRENADEATTACK,

	-- ENERGY, KINETIC, ELECTRICITY, STUN, BLAST, HEAT, COLD, ACID, LIGHTSABER
	damageType = KINETIC,

	-- NONE, LIGHT, MEDIUM, HEAVY
	armorPiercing = NONE,

	-- combat_rangedspecialize_bactarifle, combat_rangedspecialize_rifle, combat_rangedspecialize_pistol, combat_rangedspecialize_heavy, combat_rangedspecialize_carbine
	-- combat_meleespecialize_unarmed, combat_meleespecialize_twohand, combat_meleespecialize_polearm, combat_meleespecialize_onehand, combat_general,
	-- combat_meleespecialize_twohandlightsaber, combat_meleespecialize_polearmlightsaber, combat_meleespecialize_onehandlightsaber
	xpType = "combat_general",

	-- See http://www.ocdsoft.com/files/certifications.xls
	certificationsRequired = { "cert_grenade_cortosis" },

	-- See http://www.ocdsoft.com/files/accuracy.xls
	creatureAccuracyModifiers = { "thrown_accuracy" },

	-- See http://www.ocdsoft.com/files/defense.xls
	defenderDefenseModifiers = { "ranged_defense" },

	-- See http://www.ocdsoft.com/files/speed.xls
	speedModifiers = { "thrown_speed" },

	-- Leave blank for now
	damageModifiers = { },

	useCount = 5,

	combatSpam = "throw_cortosis",

	healthAttackCost = 20,
	actionAttackCost = 60,
	mindAttackCost = 15,

	pointBlankRange = 0,
	pointBlankAccuracy = 50,

	idealRange = 20,
	idealAccuracy = 95,

	maxRange = 64,
	maxRangeAccuracy = 50,

	minDamage = 90,
	maxDamage = 450,
	
	attackSpeed = 1.5,

	woundsRatio = 20,
	animationType = "imperial_detonator",

	numberExperimentalProperties = {1, 1, 2, 2, 2, 2, 1, 2, 2, 2, 2, 1, 2, 2, 2},
	experimentalProperties = {"XX", "XX", "OQ", "SR", "OQ", "SR", "OQ", "SR", "OQ", "SR", "XX", "OQ", "SR", "OQ", "SR", "OQ", "SR", "OQ", "SR", "XX", "OQ", "SR", "OQ", "SR", "OQ", "SR"},
	experimentalWeights = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
	experimentalGroupTitles = {"null", "null", "expDamage", "expDamage", "expDamage", "expDamage", "null", "expRange", "expRange", "expRange", "expRange", "null", "expEffeciency", "expEffeciency", "expEffeciency"},
	experimentalSubGroupTitles = {"null", "null", "mindamage", "maxdamage", "attackspeed", "woundchance", "hitpoints", "zerorangemod", "maxrangemod", "midrangemod", "midrange", "maxrange", "attackhealthcost", "attackactioncost", "attackmindcost"},
	experimentalMin = {0, 0, 125, 250, 5.0,  7, 1000, -5, -15, 10, 24, 64, 52, 130, 20},
	experimentalMax = {0, 0, 225, 450, 2.5, 13, 1000, 25,  15, 60, 40, 64, 28,  70, 11},
	experimentalPrecision = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	experimentalCombineType = {0, 0, 1, 1, 1, 1, 4, 1, 1, 1, 1, 1, 1, 1, 1},
}
ObjectTemplates:addTemplate(object_weapon_ranged_grenade_grenade_cortosis, "object/weapon/ranged/grenade/grenade_cortosis.iff")
