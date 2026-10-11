halloween_skeleton_king = Creature:new {
	customName = "Skeleton King",
	--objectName = "",
	--randomNameType = NAME_GENERIC_TAG,
	socialGroup = "halloween",
	faction = "halloween",
	level = 300,
	chanceHit = 30.0,
	damageMin = 1645,
	damageMax = 3000,
	specialDamageMult = 7.5,
	baseXp = 28549,
	baseHAM = 385000,
	baseHAMmax = 471000,
	armor = 3,
	resists = {75,75,75,75,75,75,75,75,75},
	meatType = "",
	meatAmount = 0,
	hideType = "",
	hideAmount = 0,
	boneType = "",
	boneAmount = 0,
	milk = 0,
	tamingChance = 0.0,
	ferocity = 0,
	pvpBitmask = AGGRESSIVE + ATTACKABLE + ENEMY,
	creatureBitmask = PACK + KILLER + STALKER,
	optionsBitmask = AIENABLED + JTLINTERESTING,
	diet = HERBIVORE,

	templates = {"object/mobile/halloween_skeleton_1.iff"},
  	outfit = "custom_halloween_outfit",
	scale = 2.0,
	lootGroups = {
		{
			groups = {
				{group = "tierone", chance = 10000000},
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
				{group = "tierthree", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "tierdiamond", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "halloween", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "power_crystals", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "nightsister_tier_2", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "nightsister_tier_3", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "nightsister_tier_4", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "nightsister_tier_5", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "krayt_tissue_rare", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "krayt_pearls", chance = 10000000},
			},
			lootChance = 10000000
		},
		{
			groups = {
				{group = "clothing_attachments", chance = 10000000},
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
				{group = "g_jedi_robes", chance = 10000000}
			},
			lootChance = 1000000
		}
	},
	weapons = {},
	reactionStf = "@npc_reaction/slang",
	attacks = merge(tkamaster,brawlermaster,fencermaster,swordsmanmaster,pikemanmaster)
}

CreatureTemplates:addCreatureTemplate(halloween_skeleton_king, "halloween_skeleton_king")

