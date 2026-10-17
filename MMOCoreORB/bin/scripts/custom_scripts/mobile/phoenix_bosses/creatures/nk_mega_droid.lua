nk_mega_droid = Creature:new {
	--objectName = "@mob/creature_names:mand_bunker_super_battle_droid",
	customName = "NK-Mega_Droid",
	socialGroup = "NK",
	pvpFaction = "NK",
	faction = "",
	level = 300,
	chanceHit = 25.0,
	damageMin = 1000,
	damageMax = 2100,
	baseXp = 168840,
	baseHAM = 580000,
	baseHAMmax = 1960000,
	armor = 3,
	resists = {30,30,30,30,30,30,30,30,-1},--kinetic,energy,blast,heat,cold,electric,acid,stun,ls
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
	creatureBitmask = KILLER,
	optionsBitmask = AIENABLED,
	diet = NONE,

	templates = {
		"object/mobile/death_watch_s_battle_droid.iff"},
		--"object/mobile/death_watch_s_battle_droid_02.iff",
		--"object/mobile/death_watch_s_battle_droid_03.iff"},
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
	conversationTemplate = "",
	scale = 5.0,
	defaultWeapon = "object/weapon/ranged/droid/droid_droideka_ranged.iff",
	defaultAttack = "creaturerangedattack"
}

CreatureTemplates:addCreatureTemplate(nk_mega_droid, "nk_mega_droid")
