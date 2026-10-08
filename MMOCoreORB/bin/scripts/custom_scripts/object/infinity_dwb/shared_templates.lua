-- Ported from SWG Infinity for the Death Watch Bunker changes (client templates)

object_draft_schematic_armor_shared_armor_segment_mandalorian = SharedDraftSchematicObjectTemplate:new {
	clientTemplateFileName = "object/draft_schematic/armor/shared_armor_segment_mandalorian.iff"
}
ObjectTemplates:addClientTemplate(object_draft_schematic_armor_shared_armor_segment_mandalorian, "object/draft_schematic/armor/shared_armor_segment_mandalorian.iff")

object_draft_schematic_clothing_shared_clothing_armor_mandalorian_shoes = SharedDraftSchematicObjectTemplate:new {
	clientTemplateFileName = "object/draft_schematic/clothing/shared_clothing_armor_mandalorian_shoes.iff"
	--Data below here is deprecated and loaded from the tres, keeping for easy lookups
--[[
	appearanceFilename = "",
	arrangementDescriptorFilename = "abstract/slot/arrangement/arrangement_datapad.iff",

	clearFloraRadius = 0,
	clientDataFile = "",
	clientGameObjectType = 2049,
	collisionActionBlockFlags = 0,
	collisionActionFlags = 0,
	collisionActionPassFlags = 0,
	collisionMaterialBlockFlags = 0,
	collisionMaterialFlags = 0,
	collisionMaterialPassFlags = 0,
	containerType = 0,
	containerVolumeLimit = 0,

	detailedDescription = "string_id_table",

	gameObjectType = 2049,

	locationReservationRadius = 0,
	lookAtText = "string_id_table",

	noBuildRadius = 0,

	objectName = "string_id_table",
	onlyVisibleInTools = 0,

	portalLayoutFilename = "",

	scale = 0,
	scaleThresholdBeforeExtentTest = 0.5,
	sendToClient = 1,
	slotDescriptorFilename = "",
	snapToTerrain = 0,
	surfaceType = 0,

	totalCellNumber = 0,

	clientObjectCRC = 569544757,
	derivedFromTemplates = {"object/object/base/shared_base_object.iff", "object/intangible/base/shared_base_intangible.iff", "object/draft_schematic/base/shared_base_draft_schematic.iff"}
]]
}
ObjectTemplates:addClientTemplate(object_draft_schematic_clothing_shared_clothing_armor_mandalorian_shoes, "object/draft_schematic/clothing/shared_clothing_armor_mandalorian_shoes.iff")

object_draft_schematic_munition_shared_grenade_cortosis = SharedDraftSchematicObjectTemplate:new {
	clientTemplateFileName = "object/draft_schematic/munition/shared_grenade_cortosis.iff"
}
ObjectTemplates:addClientTemplate(object_draft_schematic_munition_shared_grenade_cortosis, "object/draft_schematic/munition/shared_grenade_cortosis.iff")

object_draft_schematic_structure_shared_musty_house_schem = SharedDraftSchematicObjectTemplate:new {
	clientTemplateFileName = "object/draft_schematic/structure/shared_musty_house_schem.iff"
}
ObjectTemplates:addClientTemplate(object_draft_schematic_structure_shared_musty_house_schem, "object/draft_schematic/structure/shared_musty_house_schem.iff")

object_draft_schematic_vehicle_civilian_shared_stap_speeder = SharedDraftSchematicObjectTemplate:new {
	clientTemplateFileName = "object/draft_schematic/vehicle/civilian/shared_speeder_stap.iff"
}
ObjectTemplates:addClientTemplate(object_draft_schematic_vehicle_civilian_shared_stap_speeder, "object/draft_schematic/vehicle/civilian/shared_speeder_stap.iff")

object_intangible_vehicle_shared_stap_speeder_pcd = SharedIntangibleObjectTemplate:new {
	clientTemplateFileName = "object/intangible/vehicle/shared_stap_speeder_pcd.iff"
}
ObjectTemplates:addClientTemplate(object_intangible_vehicle_shared_stap_speeder_pcd, "object/intangible/vehicle/shared_stap_speeder_pcd.iff")

object_mobile_vehicle_shared_stap_speeder = SharedCreatureObjectTemplate:new {
	clientTemplateFileName = "object/mobile/vehicle/shared_stap_speeder.iff"
}
ObjectTemplates:addClientTemplate(object_mobile_vehicle_shared_stap_speeder, "object/mobile/vehicle/shared_stap_speeder.iff")

object_tangible_component_armor_shared_armor_segment_mandalorian = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/component/armor/shared_armor_segment_mandalorian.iff"
}
ObjectTemplates:addClientTemplate(object_tangible_component_armor_shared_armor_segment_mandalorian, "object/tangible/component/armor/shared_armor_segment_mandalorian.iff")

object_tangible_deed_vehicle_deed_shared_speeder_stap_deed = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/deed/vehicle_deed/shared_speeder_stap_deed.iff"
}
ObjectTemplates:addClientTemplate(object_tangible_deed_vehicle_deed_shared_speeder_stap_deed, "object/tangible/deed/vehicle_deed/shared_speeder_stap_deed.iff")

object_tangible_loot_loot_schematic_shared_armor_segment_mandalorian_schematic = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/loot/loot_schematic/shared_armor_segment_mandalorian_schematic.iff"
}
ObjectTemplates:addClientTemplate(object_tangible_loot_loot_schematic_shared_armor_segment_mandalorian_schematic, "object/tangible/loot/loot_schematic/shared_armor_segment_mandalorian_schematic.iff")

object_tangible_loot_loot_schematic_shared_grenade_cortosis_schematic = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/loot/loot_schematic/shared_cortosis_grenade.iff"
}
ObjectTemplates:addClientTemplate(object_tangible_loot_loot_schematic_shared_grenade_cortosis_schematic, "object/tangible/loot/loot_schematic/shared_cortosis_grenade.iff")

object_tangible_loot_loot_schematic_shared_death_watch_mandalorian_shoes_schematic = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/loot/loot_schematic/shared_death_watch_mandalorian_shoes_schematic.iff"
	--Data below here is deprecated and loaded from the tres, keeping for easy lookups
--[[
	appearanceFilename = "appearance/eqp_tool_handheld_viewscreen_s1.apt",
	arrangementDescriptorFilename = "",

	certificationsRequired = {},
	clearFloraRadius = 0,
	clientDataFile = "",
	clientGameObjectType = 8211,
	collisionActionBlockFlags = 0,
	collisionActionFlags = 51,
	collisionActionPassFlags = 1,
	collisionMaterialBlockFlags = 0,
	collisionMaterialFlags = 1,
	collisionMaterialPassFlags = 0,
	containerType = 0,
	containerVolumeLimit = 1,
	customizationVariableMapping = {},

	detailedDescription = "@craft_item_ingredients_d:armor_mandalorian_boots",

	gameObjectType = 8211,

	locationReservationRadius = 0,
	lookAtText = "string_id_table",

	noBuildRadius = 0,

	objectName = "@craft_item_ingredients_n:armor_mandalorian_boots",
	onlyVisibleInTools = 0,

	paletteColorCustomizationVariables = {},
	portalLayoutFilename = "",

	rangedIntCustomizationVariables = {},

	scale = 1,
	scaleThresholdBeforeExtentTest = 0.5,
	sendToClient = 1,
	slotDescriptorFilename = "",
	snapToTerrain = 1,
	socketDestinations = {},
	structureFootprintFileName = "",
	surfaceType = 0,

	targetable = 1,
	totalCellNumber = 0,

	useStructureFootprintOutline = 0,

	clientObjectCRC = 4294515772,
	derivedFromTemplates = {"object/object/base/shared_base_object.iff", "object/tangible/base/shared_tangible_base.iff"}
]]
}
ObjectTemplates:addClientTemplate(object_tangible_loot_loot_schematic_shared_death_watch_mandalorian_shoes_schematic, "object/tangible/loot/loot_schematic/shared_death_watch_mandalorian_shoes_schematic.iff")

object_tangible_loot_loot_schematic_shared_musty_house_loot_schem = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/loot/loot_schematic/shared_musty_house_loot_schem.iff"
}
ObjectTemplates:addClientTemplate(object_tangible_loot_loot_schematic_shared_musty_house_loot_schem, "object/tangible/loot/loot_schematic/shared_musty_house_loot_schem.iff")

object_tangible_loot_loot_schematic_shared_stap_speeder_schematic = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/loot/loot_schematic/shared_stap_speeder_schematic.iff"
}
ObjectTemplates:addClientTemplate(object_tangible_loot_loot_schematic_shared_stap_speeder_schematic, "object/tangible/loot/loot_schematic/shared_stap_speeder_schematic.iff")

object_weapon_ranged_grenade_shared_grenade_cortosis = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/ranged/grenade/shared_grenade_cortosis.iff"
}
ObjectTemplates:addClientTemplate(object_weapon_ranged_grenade_shared_grenade_cortosis, "object/weapon/ranged/grenade/shared_grenade_cortosis.iff")
