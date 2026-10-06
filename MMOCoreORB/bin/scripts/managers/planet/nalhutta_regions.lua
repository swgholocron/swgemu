-- Nalhutta regions, ported from Flurry (spawn_manager/nalhutta_regions.lua).
--
-- Hutt City is a no-spawn / no-build zone; the world spawner uses the nalhutta_world group.
require("scripts.managers.planet.regions")

nalhutta_regions = {
	{"huttcity", 0, 0, {CIRCLE, 750}, NOSPAWNAREA + NOBUILDZONEAREA},
	{"nalhutta_world_spawner", 0, 0, {RECTANGLE, 0, 0}, SPAWNAREA + WORLDSPAWNAREA, {"nalhutta_world"}, 2048},
}
