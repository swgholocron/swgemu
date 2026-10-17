-- Custom bosses ported from Project Phoenix, placed at the Phoenix coordinates.
-- Revan's Lok outpost is a 5-phase encounter (kill a decoy, its boss appears); the rest are static spawns.
-- The General's Bunker on Lok (building, droids, Necrosis, Leia, the Palpatine hologram) is spawned here too.
-- Flip this to false to turn all of them off.
PHOENIX_BOSSES_ENABLED = true

phoenix_bosses = ScreenPlay:new {
	numberOfActs = 1,
}

registerScreenPlay("phoenix_bosses", true)

function phoenix_bosses:start()
	if (not PHOENIX_BOSSES_ENABLED) then
		return
	end

	for planet, spawns in pairs(self.spawns) do
		if (isZoneEnabled(planet)) then
			for i = 1, #spawns, 1 do
				local s = spawns[i]
				spawnMobile(planet, s[1], s[2], s[3], s[4], s[5], s[6], s[7])
			end
		end
	end

	if (isZoneEnabled("lok")) then
		self:spawnRevanOutpost()
		self:spawnGeneralsBunker()
	end
end

-- { template, respawn, x, z, y, heading, cell }
phoenix_bosses.spawns = {
	dantooine = {
		{"som_dark_jedi_minion_7", 2700, 180.911, -66.0965, -97.5385, -97, 8535546},
		{"cinderclaw", 2700, 193.557, -66.871, -101.828, -105.995, 8535546},
		{"janta_chieftain", 1800, -90.7565, -100.897, -99.4075, -178, 529333},
		{"som_dark_jedi_minion_3", 900, 4190.67, 14.7383, 5193.06, 21, 0},
		{"som_dark_jedi_minion_4", 900, 4245.93, 8, 5178.97, -83, 0},
		{"som_dark_jedi_minion_8", 900, 4260.79, 8, 5208.05, 21, 0},
	},
	dathomir = {
		{"nightsister_elder_2", 4200, -7120.29, 460.67, 1179.38, 35, 0},
		{"nightsister_elder_2", 4220, -6953.8, 551.6, -3032.1, -45, 0},
		{"nightsister_elder_2", 3600, 1085.0, 103.0, -4485.2, -95, 0},
	},
	endor = {
		{"mando_boss", 3600, -2, -60.0, -172.6, 176, 5996352},
	},
	lok = {
		{"booba_fett", 3600, 3641.66, 1, 2208.25, -167, 0},
		{"mandalorian_aliitalor", 1800, 3645.13, 1, 2198.08, -174, 0},
		{"mandalorian_aliitalor", 1800, 3633.67, 1, 2201.54, -171, 0},
		{"poggle_the_lesser", 300, 2963.31, 290, -4696.46, 286.282, 0},
	},
	rori = {
		{"ep3_harwakokok_mighty", 3600, -1440.63, 95.0269, 4423.33, 48, 0},
	},
	talus = {
		{"ep3_clone_relics_durge", 3600, 4965.16, 450, -5982, -21, 0},
		{"orf_torton", 3600, -4743.67, 4.16993, -4613.93, 41, 0},
	},
	tatooine = {
		{"krayt_king", 300, 7429.9, 7.1, 4477.3, 0, 0},
		{"krayt_king", 300, -4521.3, 27.2, -4298.2, 144, 0},
		{"tusken_executioner_quest", 0, -3977.5, 60, 6252, 0, 0},
		{"tusken_executioner_quest", 0, -3984.21, 60, 6249.58, 0, 0},
		{"tusken_executioner_quest", 0, -3986.01, 60, 6275.87, 0, 0},
		{"tusken_executioner_quest", 0, -3981.63, 60, 6292.17, 0, 0},
		{"tusken_executioner_quest", 0, -3969.87, 60, 6284.58, 0, 0},
	},
	yavin4 = {
		{"thrawn1", 3600, -107.7, -18, -33.8, 176, 1627790},
		{"sher_kar", 3600, -127.2, -34, -189.0, -93, 1627815},
		{"acklay_elder", 300, 98.0, -34.1, -334.4, -53, 1627823},
		{"acklay_elder", 300, 120.2, -33.9, -330.6, -33, 1627823},
		{"luke_elder", 300, -5575.59, 87.861, 4903.66, -179, 0},
		{"darthvader_elder", 300, 5080.18, 79.4253, 306.668, 90, 0},
		{"general_grievous", 3600, -0.302274, 55, -13.3869, 0, 3465362},
	},
}

-- Revan's outpost: killing a decoy calls out its boss. The decoys are respawned by hand (an hour after the kill)
-- so the observer is attached to every new decoy, not just the first.
phoenix_bosses.revanDecoys = {
	{"revan_quest1", -1939.94, 12, -2969.95, 138.087},
	{"revan_quest1", -2020.51, 12, -3069.16, 138.087},
	{"revan_quest1", -1944.12, 12, -3197.34, 138.087},
	{"revan_quest1", -1841.88, 12, -3084.52, 138.087},
	{"revan_clone", -1852.3, 19, -3092.6, 90}
}

phoenix_bosses.revanBosses = {
	{"emperors_hand", -1939.94, 12, -2969.95, 138.087, "Protect the outpost!"},
	{"palpatine_elder", -1852.3, 19, -3097.6, 90, "Protect the outpost!"},
	{"darthvader_elder", -1944.12, 12, -3197.34, 138.087, "Protect the outpost!"},
	{"som_dark_jedi_boss", -1841.88, 12, -3084.52, 138.087, "Protect the outpost!"},
	{"revan", -1959, 12, -3075.66, 0, "Kill me if you can!"}
}

phoenix_bosses.revanDecoyRespawn = 3600 * 1000

function phoenix_bosses:spawnRevanOutpost()
	for i = 1, #self.revanDecoys, 1 do
		self:spawnDecoy(i)
	end
end

function phoenix_bosses:spawnDecoy(index)
	local d = self.revanDecoys[index]
	local pDecoy = spawnMobile("lok", d[1], 0, d[2], d[3], d[4], d[5], 0)

	if (pDecoy ~= nil) then
		createObserver(OBJECTDESTRUCTION, "phoenix_bosses", "notifyDecoyDead", pDecoy)
		writeData(SceneObject(pDecoy):getObjectID() .. ":phoenixDecoy", index)
	end
end

function phoenix_bosses:respawnDecoy(pNil, indexString)
	self:spawnDecoy(tonumber(indexString))
end

function phoenix_bosses:notifyDecoyDead(pDecoy, pKiller)
	if (pDecoy == nil) then
		return 1
	end

	local key = SceneObject(pDecoy):getObjectID() .. ":phoenixDecoy"
	local index = readData(key)
	deleteData(key)

	if (index == 0) then
		return 1
	end

	local b = self.revanBosses[index]
	local pBoss = spawnMobile("lok", b[1], 0, b[2], b[3], b[4], b[5], 0)

	if (pBoss ~= nil) then
		spatialChat(pBoss, b[6])
	end

	createEvent(self.revanDecoyRespawn, "phoenix_bosses", "respawnDecoy", nil, tostring(index))

	return 1
end

-- General's Bunker (Lok). Phoenix placed an Imperial prison bunker through its world snapshot; this server has no such
-- snapshot entry, so the bunker is spawned here and its droids are placed by cell number.
-- Placement is derived from the Phoenix guards outside the door (the door faces the way they face), so it may need a nudge
-- in game: change generalsBunker.x / .y / .z / .heading and restart.
phoenix_bosses.generalsBunker = {
	template = "object/building/general/bunker_imperial_prison_01.iff",
	x = 3756.5, z = 12.0, y = -3081.5,
	heading = -70, -- degrees, the same convention as spawnMobile; the door faces this way
}

-- { template, respawn, x, z, y, heading }
phoenix_bosses.generalsBunkerOutside = {
	{"nk_droideka", 200, 3740.4, 12.0, -3079.2, -70},
	{"nk_droideka", 200, 3742.6, 12.1, -3072.9, -70},
}

-- { template, respawn, x, z, y, heading, cell number }
phoenix_bosses.generalsBunkerInside = {
	{"nk_droideka", 200, -10.6, -17.0, 75.8, 179, 8},
	{"nk_s_battle_droid_01", 200, 7.7, -9.0, 28.9, 176, 4},
	{"nk_s_battle_droid_01", 200, -1.0, -9.0, 29.0, 176, 4},
	{"nk_battle_droid_01", 200, -10.5, -9.0, 34.7, 179, 8},
	{"nk_battle_droid_01", 200, -5.5, -17.0, 63.1, -89, 8},
	{"nk_battle_droid_01", 200, -38.5, -19.0, 82.6, 178, 9},
	{"nk_battle_droid_02", 200, -42.9, -23.0, 103.1, 85, 9},
	{"nk_battle_droid_03", 200, 15.0, -23.0, 103.7, -91, 9},
	{"nk_battle_droid_03", 200, 9.5, -19.0, 81.6, 177, 9},
	{"nk_s_battle_droid_02", 200, 37.2, -21.0, 133.3, 178, 10},
	{"nk_s_battle_droid_03", 200, 37.5, -21.0, 153.1, 179, 10},
	{"nk_necrosis", 200, 2.4, -23.0, 284.0, -179, 16},
	{"nk_mega_droid", 200, -38.1, -23.0, 199.0, 179, 9},
	{"nk_mega_droid", 200, 9.5, -23.0, 199.8, 175, 9},
	{"ep3_clone_relics_leia", 200, -87.8, -23.0, 232.9, 174, 13},
	{"commoner", 200, -9.0, -23.0, 143.5, -176, 9},
	{"commoner", 200, -3.7, -23.0, 136.2, -178, 9},
	{"commoner", 200, -11.7, -23.0, 131.0, 87, 9},
	{"commoner", 200, -25.0, -23.0, 144.9, -174, 9},
	{"commoner", 200, -18.2, -23.0, 136.4, 178, 9},
	{"commoner", 200, -18.7, -23.0, 151.1, 93, 9},
	{"commoner", 200, -18.7, -23.0, 163.0, -1, 9},
	{"commoner", 200, -26.7, -23.0, 171.4, -92, 9},
	{"commoner", 200, -5.4, -23.0, 165.8, 179, 9},
	{"commoner", 200, -10.2, -23.0, 176.7, 2, 9},
	{"nk_droideka", 200, 9.2, -23.0, 220.3, -175, 14},
	{"nk_droideka", 200, -2.4, -23.0, 247.4, -177, 17},
	{"nk_droideka", 200, 10.8, -23.0, 275.9, -177, 16},
	{"nk_droideka", 200, -4.1, -23.0, 269.1, 86, 16},
	{"nk_droideka", 200, 29.4, -23.0, 253.0, 177, 17},
	{"nk_droideka", 200, 23.6, -23.0, 219.4, -90, 12},
	{"commoner", 200, 37.8, -23.0, 206.4, -1, 12},
	{"commoner", 200, 44.8, -23.0, 206.2, 0, 12},
	{"commoner", 200, 51.5, -23.0, 233.6, 178, 12},
	{"nk_droideka", 200, -53.1, -23.0, 219.3, 89, 13},
	{"commoner", 200, -73.6, -23.0, 205.1, -1, 13},
	{"commoner", 200, -80.5, -23.0, 232.8, -178, 13},
	{"nk_droideka", 200, -89.2, -21.0, 223.3, -177, 13},
	{"nk_droideka", 200, -85.8, -21.0, 223.5, -177, 13},
	{"palpatine_hologram", 200, 70.7, -23.0, 219.1, -90, 12},
}

function phoenix_bosses:spawnGeneralsBunker()
	local b = self.generalsBunker
	local pBuilding = spawnSceneObject("lok", b.template, b.x, b.z, b.y, 0, math.rad(b.heading))

	if (pBuilding == nil) then
		printf("phoenix_bosses: could not spawn the General's Bunker building\n")
		return
	end

	for i = 1, #self.generalsBunkerOutside, 1 do
		local s = self.generalsBunkerOutside[i]
		spawnMobile("lok", s[1], s[2], s[3], s[4], s[5], s[6], 0)
	end

	local cells = {}

	for i = 1, #self.generalsBunkerInside, 1 do
		local s = self.generalsBunkerInside[i]
		local pCell = cells[s[7]]

		if (pCell == nil) then
			pCell = BuildingObject(pBuilding):getCell(s[7])
			cells[s[7]] = pCell
		end

		if (pCell ~= nil) then
			spawnMobile("lok", s[1], s[2], s[3], s[4], s[5], s[6], SceneObject(pCell):getObjectID())
		end
	end
end
