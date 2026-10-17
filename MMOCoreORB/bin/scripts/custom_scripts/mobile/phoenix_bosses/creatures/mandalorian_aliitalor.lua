mandalorian_aliitalor = Creature:new {
	objectName = "",
	customName = "Mandalorian Aliit'alor",
	socialGroup = "mandalorian",
	faction = "",
     level = 300,
	chanceHit = 75.5,
	damageMin = 2250,
	damageMax = 2750,
	baseXp = 20948,
	baseHAM = 250000,
	baseHAMmax = 300000,
	armor = 3,
	resists = {80,80,90,80,45,45,100,70,40},
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
  creatureBitmask = PACK + KILLER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,
	scale = 1.55,

	templates = {"object/mobile/dressed_death_watch_silver.iff"},
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
	weapons = {"death_watch_commander_weapons"},
	conversationTemplate = "",
  attacks = merge(bountyhuntermaster,marksmanmaster,brawlermaster,pistoleermaster,commandomaster,carbineermaster)
}

CreatureTemplates:addCreatureTemplate(mandalorian_aliitalor, "mandalorian_aliitalor")
