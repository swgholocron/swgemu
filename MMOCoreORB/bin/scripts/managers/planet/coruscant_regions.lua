-- Coruscant regions. No tree we ported from (Flurry, Infinity, Phoenix, Sanctuary) has one, so this is built from
-- the client's own region table (datatables/clientregion/coruscant.iff): the five districts and their radii.
--
-- The whole planet is a no-build zone, and each district is a no-spawn / no-build city region named with the same
-- @coruscant_region_names strings the client uses.
--
-- No navigation areas: large navmesh areas fail to build on this server (see the Hoth zone 2 note), and Coruscant's
-- NPCs are placed by the screenplays in custom_scripts/screenplays/flurry_planets/coruscant.
require("scripts.managers.planet.regions")

coruscant_regions = {
	{"fullplanet", -1, 1, {CIRCLE, 12000}, NOBUILDZONEAREA},

	{"@coruscant_region_names:entertainment_district", 2248, -4462, {CIRCLE, 300}, CITY + NOSPAWNAREA + NOBUILDZONEAREA},
	{"@coruscant_region_names:monument_square", 1566, 662, {CIRCLE, 300}, CITY + NOSPAWNAREA + NOBUILDZONEAREA},
	{"@coruscant_region_names:spaceport_district", -114, 3227, {CIRCLE, 300}, CITY + NOSPAWNAREA + NOBUILDZONEAREA},
	{"@coruscant_region_names:coco_district", -1918, -134, {CIRCLE, 300}, CITY + NOSPAWNAREA + NOBUILDZONEAREA},
	{"@coruscant_region_names:palace_district", -472, 6679, {CIRCLE, 400}, CITY + NOSPAWNAREA + NOBUILDZONEAREA},
}
