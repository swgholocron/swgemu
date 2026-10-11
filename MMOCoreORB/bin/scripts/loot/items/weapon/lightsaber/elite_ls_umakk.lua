--Ported from Bloodfin.Net client assets (holocron2.tre), elite lightsaber loot pass.

elite_ls_umakk = {
	minimumLevel = 0,
	maximumLevel = -1,
	customObjectName = "Umakk's lightsaber",
	directObjectTemplate = "object/weapon/melee/sword_lightsaber_umakk.iff",
	-- Gen 5 one-handed: same ranges as the crafted Gen 5 one-handed saber (Gen 4 +25% damage).
	craftingValues = {
		{"mindamage",175,200,0},
		{"maxdamage",288,338,0},
		{"attackspeed",4.5,4.2,1},
		{"woundchance",25,50,0},
		{"forcecost",55,48,1},
		{"attackhealthcost",45,40,0},
		{"attackactioncost",60,45,0},
		{"attackmindcost",95,65,0},
	},
	customizationStringNames = {},
	customizationValues = {}
}

addLootItemTemplate("elite_ls_umakk", elite_ls_umakk)
