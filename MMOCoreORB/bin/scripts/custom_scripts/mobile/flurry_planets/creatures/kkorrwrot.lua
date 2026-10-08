kkorrwrot = Creature:new {
	customName = "Kkorrwrot",
	socialGroup = "kkorrwrot",
	faction = "",
	level = 187,
	chanceHit = 0.9,
	damageMin = 860,
	damageMax = 1650,
	baseXp = 12500,
	baseHAM = 125000,
	baseHAMmax = 185000,
	armor = 2,
	resists = {0,0,0,0,0,0,0,-1,-1},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milkType = "",
	milk = 0,
	tamingChance = 0.25,
	ferocity = 0,
	pvpBitmask = ATTACKABLE,
	creatureBitmask = HERD,
	optionsBitmask = AIENABLED,
	diet = HERBIVORE,


	templates = {"object/mobile/kkorrwrot.iff"},
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
        },   -- same loot design as the Meatlump King (worldboss_7)
	weapons = {},
	attacks = {
	}
}

CreatureTemplates:addCreatureTemplate(kkorrwrot, "kkorrwrot")
