worldboss_7 = Creature:new {
	customName = "\\#00ff00<<< Meatlump King >>> \\#0000ff[lvl 275]",
	socialGroup = "meatlump",
	faction = "",
	level = 275,
	chanceHit = 50.0,
	damageMin = 2500,
	damageMax = 5500,
	baseXp = 20000,
	baseHAM = 400000,
	baseHAMmax = 500000,
	armor = 2,
	resists = {50,50,50,50,50,50,50,50,50},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0,
	ferocity = 30,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED + INTERESTING,
	diet = CARNIVORE,
	scale = 1.5,

	templates = {"object/mobile/meatlump_king.iff"},
	lootGroups = {
		{
			groups = {
				{group = "eliteharvesterdeeds", chance = 10000000},
			},
			lootChance = 1000000
		},
		{
			groups = {
				{group = "eliteLightsabers", chance = 10000000},
			},
			lootChance = 500000
		},
		{
			groups = {
				{group = "eliteWeaponsLegendary", chance = 10000000},
			},
			lootChance = 500000
		},
		{
			groups = {
				{group = "eliteWeaponsNamed", chance = 10000000},
			},
			lootChance = 1500000
		},
		{
			groups = {
				{group = "eliteArmorSchematics", chance = 10000000},
			},
			lootChance = 800000
		},
		{
			groups = {
				{group = "eliteWearableMisc", chance = 10000000},
			},
			lootChance = 1500000
		},
		{
			groups = {
				{group = "eliteVehicleDeeds", chance = 10000000},
			},
			lootChance = 1500000
		},
		{
			groups = {
				{group = "eliteWalkerDeeds", chance = 10000000},
			},
			lootChance = 200000
		},
		{
			groups = {
				{group = "eliteSwoopSchematics", chance = 10000000},
			},
			lootChance = 1000000
		},
		{
			groups = {
				{group = "vehicledeedsnormal", chance = 10000000},
			},
			lootChance = 5000000
		},
		{
			groups = {
				{group = "vehicledeedsrare", chance = 10000000},
			},
			lootChance = 2500000
		},		
		{
			groups = {
				{group = "tierthree", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "tierthree", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "tiertwo", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "armor_attachments", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "clothing_attachments", chance = 10000000},
			},
			lootChance = 10000000
		}
        },
	weapons = {"blood_razer_weapons"},
	conversationTemplate = "",
	attacks = merge(pikemanmaster,riflemanmaster,pistoleermaster)
}

CreatureTemplates:addCreatureTemplate(worldboss_7, "worldboss_7")
