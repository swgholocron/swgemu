-- Taanab regions, ported from Flurry (spawn_manager/taanab_regions.lua).
--
-- Cities, the mine, cave, hex farms and downed ship are no-spawn / no-build zones. The world spawner uses
-- the taanab_world group (defined in custom_scripts/mobile/flurry_planets/spawn) and the Great Herd area
-- uses taanab_nerfherd.
require("scripts.managers.planet.regions")

taanab_regions = {
	{"pandath", 2000, 5400, {CIRCLE, 300}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"starhunterstation", 3763, -5425, {CIRCLE, 300}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"taanab_world_spawner", 0, 0, {RECTANGLE, 0, 0}, SPAWNAREA + WORLDSPAWNAREA, {"taanab_world"}, 2048},
	{"taanabhexfarms", -3000, -105, {CIRCLE, 300}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"taanabgreatherd", 5537, -4958, {CIRCLE, 300}, NOWORLDSPAWNAREA + NOBUILDZONEAREA + SPAWNAREA, {"taanab_nerfherd"}, 1024},
	{"downedship", 3293, -1324, {CIRCLE, 150}, NOBUILDZONEAREA},
	{"taanabcanyonlands", -2590, 3705, {CIRCLE, 50}, NOBUILDZONEAREA},
	{"taanabmine", -2609, -1305, {CIRCLE, 200}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"taanabcave", -850, 7200, {CIRCLE, 150}, NOSPAWNAREA + NOBUILDZONEAREA},
}
