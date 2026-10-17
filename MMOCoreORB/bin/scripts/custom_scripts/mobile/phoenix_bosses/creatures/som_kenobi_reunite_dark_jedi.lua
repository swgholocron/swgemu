som_kenobi_reunite_dark_jedi = Creature:new {
	customName = "Mysterious Dark Jedi",
	socialGroup = "self",
	pvpFaction = "",
	faction = "",
	level = 300,
	chanceHit = 50,
	damageMin = 1645,
	damageMax = 3000,
	baseXp = 25266,
	baseHAM = 261000,
	baseHAMmax = 320000,
	armor = 3,
	resists = {90,90,90,90,90,90,90,90,-1},
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
	creatureBitmask = PACK + STALKER,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,

	templates = {"object/mobile/som/som_kenobi_reunite_dark_jedi.iff"},
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
	weapons = {"dark_jedi_weapons_gen3"},
	conversationTemplate = "",
	attacks = merge(lightsabermaster)
}

CreatureTemplates:addCreatureTemplate(som_kenobi_reunite_dark_jedi, "som_kenobi_reunite_dark_jedi")
