giant_canyon_krayt_dragon_elder = Creature:new {
	objectName = "@mob/creature_names:",
	customName = "giant canyon krayt dragon elder",
	socialGroup = "krayt",
	faction = "",
	level = 300,
	chanceHit = 30.25,
	damageMin = 1520,
	damageMax = 2750,
	baseXp = 260356,
	baseHAM = 321000,
	baseHAMmax = 392000,
	armor = 3,
	resists = {50,50,50,50,50,50,50,50,15},
	meatType = "meat_carnivore",
	meatAmount = 1000,
	hideType = "hide_bristley",
	hideAmount = 750,
	boneType = "bone_mammal",
	boneAmount = 675,
	milk = 0,
	tamingChance = 0.25,
	ferocity = 20,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED,
	diet = CARNIVORE,

	templates = {"object/mobile/canyon_krayt_dragon.iff"},
	scale = 0.9;
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
				{group = "tiertwo", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "tierthree", chance = 10000000}
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "tierthree", chance = 10000000}
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
			lootChance = 5000000
		},
		{
			groups = {
				{group = "g_jedi_robes", chance = 10000000}
			},
			lootChance = 250000
		}
	},
	weapons = {},
	conversationTemplate = "",
	attacks = {
		{"creatureareaattack","stateAccuracyBonus=30"},
		{"stunattack","stateAccuracyBonus=30"}
	}
}

CreatureTemplates:addCreatureTemplate(giant_canyon_krayt_dragon_elder, "giant_canyon_krayt_dragon_elder")
