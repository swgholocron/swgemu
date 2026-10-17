orf_torton = Creature:new {
	customName = "Sheldon, Lord of the Tortons",
	socialGroup = "mustafar",
	pvpFaction = "",
	faction = "",
	level = 300,
	chanceHit = 30,
	damageMin = 4450,
	damageMax = 5800,
	baseXp = 34675,
	baseHAM = 888500,
	baseHAMmax = 1311000,
	armor = 3,
	resists = {55,55,55,55,55,55,55,55,55},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0.10,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = PACK + STALKER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 3.0,

	templates = {"object/mobile/som/orf_torton.iff"},
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
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareacombo","stateAccuracyBonus=100"},
		{"creatureareaknockdown","stateAccuracyBonus=100"},
		{"knockdownattack",""},
		{"creatureareaknockdown",""},
		{"dizzyattack",""},
		{"stunattack",""},
		{"mildpoison",""},
		{"intimidationattack",""},
		{"mediumpoison",""},
		{"creatureareaattack",""}
	}
}
CreatureTemplates:addCreatureTemplate(orf_torton, "orf_torton")
