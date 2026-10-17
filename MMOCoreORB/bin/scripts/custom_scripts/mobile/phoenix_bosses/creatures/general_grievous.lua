general_grievous = Creature:new {
	--objectName = "@mob/creature_names:ep3_general_grievous",
	customName = "General Grievous",
	socialGroup = "droids",
	pvpFaction = "",
	faction = "",
	level = 300,
	chanceHit = 100,
	damageMin = 2000,
	damageMax = 4000,
	baseXp = 16884,
	baseHAM = 585000,
	baseHAMmax = 1085000,
	armor = 1,
	resists = {90,90,90,90,90,90,90,90,90},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = KILLER + STALKER,
	optionsBitmask = AIENABLED + INTERESTING,
	diet = HERBIVORE,
	scale = 1.5,

	templates = {"object/mobile/ep3/general_grievous.iff"},
	lootGroups = {
		{
			groups = {
				{group = "eliteharvesterdeeds", chance = 10000000}
			},
			lootChance = 1000000
		},
		{
			groups = {
				{group = "eliteLightsabers", chance = 10000000}
			},
			lootChance = 500000
		},
		{
			groups = {
				{group = "eliteWeaponsLegendary", chance = 10000000}
			},
			lootChance = 500000
		},
		{
			groups = {
				{group = "eliteWeaponsNamed", chance = 10000000}
			},
			lootChance = 1500000
		},
		{
			groups = {
				{group = "eliteArmorSchematics", chance = 10000000}
			},
			lootChance = 800000
		},
		{
			groups = {
				{group = "eliteVehicleDeeds", chance = 10000000}
			},
			lootChance = 1500000
		},
		{
			groups = {
				{group = "eliteWalkerDeeds", chance = 10000000}
			},
			lootChance = 200000
		},
		{
			groups = {
				{group = "eliteSwoopSchematics", chance = 10000000}
			},
			lootChance = 1000000
		},
		{
			groups = {
				{group = "goggles_all", chance = 10000000}
			},
			lootChance = 1000000
		},
		{
			groups = {
				{group = "nge_all", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "neck_crafter", chance = 10000000}
			},
			lootChance = 1000000
		},
		{
			groups = {
				{group = "non_jedi_ring_crafter_second", chance = 10000000}
			},
			lootChance = 1000000
		},
		{
			groups = {
				{group = "non_jedi_ring_crafter", chance = 10000000}
			},
			lootChance = 1000000
		},
		{
			groups = {
				{group = "non_jedi_rings_ranged", chance = 10000000}
			},
			lootChance = 1000000
		},
		{
			groups = {
				{group = "non_jedi_rings", chance = 10000000}
			},
			lootChance = 1000000
		},
		{
			groups = {
				{group = "tierone", chance = 1500000},
				{group = "tiertwo", chance = 3500000},
				{group = "tierthree", chance = 2500000},
				{group = "tierdiamond", chance = 2500000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "tierone", chance = 1500000},
				{group = "tiertwo", chance = 3500000},
				{group = "tierthree", chance = 2500000},
				{group = "tierdiamond", chance = 2500000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "tierdiamond", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "armor_attachments", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "clothing_attachments", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "weapon_attachments", chance = 10000000}
			},
			lootChance = 7500000
		},
		{
			groups = {
				{group = "weapons_all", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "g_named_crystals", chance = 10000000}
			},
			lootChance = 2500000
		},
		{
			groups = {
				{group = "power_crystals", chance = 10000000}
			},
			lootChance = 1000000
		},
		{
			groups = {
				{group = "g_jedi_robes", chance = 10000000}
			},
			lootChance = 500000
		}
	},
	weapons = {"dark_jedi_weapons_gen4"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster)
}

CreatureTemplates:addCreatureTemplate(general_grievous, "general_grievous")
