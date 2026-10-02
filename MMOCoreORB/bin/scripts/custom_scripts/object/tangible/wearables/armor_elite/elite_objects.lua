--Copyright (C) 2010 <SWGEmu>


--This File is part of Core3.

--This program is free software; you can redistribute
--it and/or modify it under the terms of the GNU Lesser
--General Public License as published by the Free Software
--Foundation; either version 2 of the License,
--or (at your option) any later version.

--This program is distributed in the hope that it will be useful,
--but WITHOUT ANY WARRANTY; without even the implied warranty of
--MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
--See the GNU Lesser General Public License for
--more details.

--You should have received a copy of the GNU Lesser General
--Public License along with this program; if not, write to
--the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

--Linking Engine3 statically or dynamically with other modules
--is making a combined work based on Engine3.
--Thus, the terms and conditions of the GNU Lesser General Public License
--cover the whole combination.

--In addition, as a special exception, the copyright holders of Engine3
--give you permission to combine Engine3 program with free software
--programs or libraries that are released under the GNU LGPL and with
--code included in the standard release of Core3 under the GNU LGPL
--license (or modified versions of such code, with unchanged license).
--You may copy and distribute such a system following the terms of the
--GNU LGPL for Engine3 and the licenses of the other code concerned,
--provided that you include the source code of that other code when
--and as the GNU LGPL requires distribution of source code.

--Note that people who make modified versions of Engine3 are not obligated
--to grant this special exception for their modified versions;
--it is their choice whether to do so. The GNU Lesser General Public License
--gives permission to release a modified version without this exception;
--this exception also makes it possible to release a modified version


-- Elite armor pieces ported from Bloodfin.Net's client assets. Most of
-- these crafted-output .iff files were ALREADY present in our deployed
-- client (holocron.tre/mtg_patch_022.tre) -- the art shipped years ago,
-- the server-side wrapper never did (same gap as the 5 world-boss object
-- templates fixed earlier). Resistance values are our own extrapolation
-- per named set, anchored against two real references already in our
-- tree: vanilla Composite (~75, top endgame tier) and the existing
-- Marauder S02 pieces already registered (25/15/.../15, a light
-- lower-tier set) -- Bloodfin's actual server-side numbers aren't
-- recoverable from the client alone, so treat these as a starting
-- point, not final balance.

object_tangible_wearables_armor_mandalorian_imperial_armor_mandalorian_imperial_belt_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_imperial/shared_armor_mandalorian_imperial_belt.iff"
}

object_tangible_wearables_armor_mandalorian_imperial_armor_mandalorian_imperial_bicep_l_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_imperial/shared_armor_mandalorian_imperial_bicep_l.iff"
}

object_tangible_wearables_armor_mandalorian_imperial_armor_mandalorian_imperial_bicep_r_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_imperial/shared_armor_mandalorian_imperial_bicep_r.iff"
}

object_tangible_wearables_armor_mandalorian_imperial_armor_mandalorian_imperial_boots_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_imperial/shared_armor_mandalorian_imperial_boots.iff"
}

object_tangible_wearables_armor_mandalorian_imperial_armor_mandalorian_imperial_bracer_l_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_imperial/shared_armor_mandalorian_imperial_bracer_l.iff"
}

object_tangible_wearables_armor_mandalorian_imperial_armor_mandalorian_imperial_bracer_r_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_imperial/shared_armor_mandalorian_imperial_bracer_r.iff"
}

object_tangible_wearables_armor_mandalorian_imperial_armor_mandalorian_imperial_chest_plate_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_imperial/shared_armor_mandalorian_imperial_chest_plate.iff"
}

object_tangible_wearables_armor_mandalorian_imperial_armor_mandalorian_imperial_gloves_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_imperial/shared_armor_mandalorian_imperial_gloves.iff"
}

object_tangible_wearables_armor_mandalorian_imperial_armor_mandalorian_imperial_helmet_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_imperial/shared_armor_mandalorian_imperial_helmet.iff"
}

object_tangible_wearables_armor_mandalorian_imperial_armor_mandalorian_imperial_leggings_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_imperial/shared_armor_mandalorian_imperial_leggings.iff"
}

object_tangible_wearables_armor_mandalorian_rebel_armor_mandalorian_rebel_belt_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_rebel/shared_armor_mandalorian_rebel_belt.iff"
}

object_tangible_wearables_armor_mandalorian_rebel_armor_mandalorian_rebel_bicep_l_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_rebel/shared_armor_mandalorian_rebel_bicep_l.iff"
}

object_tangible_wearables_armor_mandalorian_rebel_armor_mandalorian_rebel_bicep_r_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_rebel/shared_armor_mandalorian_rebel_bicep_r.iff"
}

object_tangible_wearables_armor_mandalorian_rebel_armor_mandalorian_rebel_boots_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_rebel/shared_armor_mandalorian_rebel_boots.iff"
}

object_tangible_wearables_armor_mandalorian_rebel_armor_mandalorian_rebel_bracer_l_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_rebel/shared_armor_mandalorian_rebel_bracer_l.iff"
}

object_tangible_wearables_armor_mandalorian_rebel_armor_mandalorian_rebel_bracer_r_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_rebel/shared_armor_mandalorian_rebel_bracer_r.iff"
}

object_tangible_wearables_armor_mandalorian_rebel_armor_mandalorian_rebel_chest_plate_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_rebel/shared_armor_mandalorian_rebel_chest_plate.iff"
}

object_tangible_wearables_armor_mandalorian_rebel_armor_mandalorian_rebel_gloves_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_rebel/shared_armor_mandalorian_rebel_gloves.iff"
}

object_tangible_wearables_armor_mandalorian_rebel_armor_mandalorian_rebel_helmet_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_rebel/shared_armor_mandalorian_rebel_helmet.iff"
}

object_tangible_wearables_armor_mandalorian_rebel_armor_mandalorian_rebel_leggings_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_rebel/shared_armor_mandalorian_rebel_leggings.iff"
}

object_tangible_wearables_armor_mandalorian_rebel_armor_mandalorian_rebel_bicep_l_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_rebel/shared_armor_mandalorian_rebel_bicep_l.iff"
}

object_tangible_wearables_armor_mandalorian_rebel_armor_mandalorian_rebel_bicep_r_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/mandalorian_rebel/shared_armor_mandalorian_rebel_bicep_r.iff"
}

object_tangible_wearables_armor_marauder_armor_marauder_s02_gloves_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/marauder/shared_armor_marauder_s02_gloves.iff"
}

object_tangible_wearables_armor_marauder_armor_marauder_s02_helmet_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/marauder/shared_armor_marauder_s02_helmet.iff"
}

object_tangible_wearables_armor_rebel_battle_armor_rebel_battle_belt_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_battle/shared_armor_rebel_battle_belt.iff"
}

object_tangible_wearables_armor_rebel_battle_armor_rebel_battle_bicep_l_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_battle/shared_armor_rebel_battle_bicep_l.iff"
}

object_tangible_wearables_armor_rebel_battle_armor_rebel_battle_bicep_r_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_battle/shared_armor_rebel_battle_bicep_r.iff"
}

object_tangible_wearables_armor_rebel_battle_armor_rebel_battle_boots_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_battle/shared_armor_rebel_battle_boots.iff"
}

object_tangible_wearables_armor_rebel_battle_armor_rebel_battle_bracer_l_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_battle/shared_armor_rebel_battle_bracer_l.iff"
}

object_tangible_wearables_armor_rebel_battle_armor_rebel_battle_bracer_r_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_battle/shared_armor_rebel_battle_bracer_r.iff"
}

object_tangible_wearables_armor_rebel_battle_armor_rebel_battle_chest_plate_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_battle/shared_armor_rebel_battle_chest_plate.iff"
}

object_tangible_wearables_armor_rebel_battle_armor_rebel_battle_gloves_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_battle/shared_armor_rebel_battle_gloves.iff"
}

object_tangible_wearables_armor_rebel_battle_armor_rebel_battle_helmet_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_battle/shared_armor_rebel_battle_helmet.iff"
}

object_tangible_wearables_armor_rebel_battle_armor_rebel_battle_leggings_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_battle/shared_armor_rebel_battle_leggings.iff"
}

object_tangible_wearables_armor_snowtrooper_armor_snowtrooper_bicep_l_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/snowtrooper/shared_armor_snowtrooper_bicep_l.iff"
}

object_tangible_wearables_armor_snowtrooper_armor_snowtrooper_bicep_r_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/snowtrooper/shared_armor_snowtrooper_bicep_r.iff"
}

object_tangible_wearables_armor_snowtrooper_armor_snowtrooper_boots_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/snowtrooper/shared_armor_snowtrooper_boots.iff"
}

object_tangible_wearables_armor_snowtrooper_armor_snowtrooper_bicep_l_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/snowtrooper/shared_armor_snowtrooper_bicep_l.iff"
}

object_tangible_wearables_armor_snowtrooper_armor_snowtrooper_bracer_l_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/snowtrooper/shared_armor_snowtrooper_bracer_l.iff"
}

object_tangible_wearables_armor_snowtrooper_armor_snowtrooper_chest_plate_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/snowtrooper/shared_armor_snowtrooper_chest_plate.iff"
}

object_tangible_wearables_armor_snowtrooper_armor_snowtrooper_gloves_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/snowtrooper/shared_armor_snowtrooper_gloves.iff"
}

object_tangible_wearables_armor_snowtrooper_armor_snowtrooper_helmet_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/snowtrooper/shared_armor_snowtrooper_helmet.iff"
}

object_tangible_wearables_armor_snowtrooper_armor_snowtrooper_leggings_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/snowtrooper/shared_armor_snowtrooper_leggings.iff"
}

object_tangible_wearables_armor_infiltrator_armor_infiltrator_s01_belt_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/infiltrator/shared_armor_infiltrator_s01_belt.iff"
}

object_tangible_wearables_armor_infiltrator_armor_infiltrator_s01_bicep_l_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/infiltrator/shared_armor_infiltrator_s01_bicep_l.iff"
}

object_tangible_wearables_armor_infiltrator_armor_infiltrator_s01_bicep_r_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/infiltrator/shared_armor_infiltrator_s01_bicep_r.iff"
}

object_tangible_wearables_armor_infiltrator_armor_infiltrator_s01_boots_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/infiltrator/shared_armor_infiltrator_s01_boots.iff"
}

object_tangible_wearables_armor_infiltrator_armor_infiltrator_s01_bracer_l_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/infiltrator/shared_armor_infiltrator_s01_bracer_l.iff"
}

object_tangible_wearables_armor_infiltrator_armor_infiltrator_s01_bracer_r_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/infiltrator/shared_armor_infiltrator_s01_bracer_r.iff"
}

object_tangible_wearables_armor_infiltrator_armor_infiltrator_s01_chest_plate_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/infiltrator/shared_armor_infiltrator_s01_chest_plate.iff"
}

object_tangible_wearables_armor_infiltrator_armor_infiltrator_s01_gloves_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/infiltrator/shared_armor_infiltrator_s01_gloves.iff"
}

object_tangible_wearables_armor_infiltrator_armor_infiltrator_s01_helmet_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/infiltrator/shared_armor_infiltrator_s01_helmet.iff"
}

object_tangible_wearables_armor_infiltrator_armor_infiltrator_s01_leggings_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/infiltrator/shared_armor_infiltrator_s01_leggings.iff"
}

object_tangible_wearables_armor_rebel_spec_force_armor_rebel_spec_force_belt_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_spec_force/shared_armor_rebel_spec_force_belt.iff"
}

object_tangible_wearables_armor_rebel_spec_force_armor_rebel_spec_force_bicep_l_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_spec_force/shared_armor_rebel_spec_force_bicep_l.iff"
}

object_tangible_wearables_armor_rebel_spec_force_armor_rebel_spec_force_bicep_r_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_spec_force/shared_armor_rebel_spec_force_bicep_r.iff"
}

object_tangible_wearables_armor_rebel_spec_force_armor_rebel_spec_force_boots_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_spec_force/shared_armor_rebel_spec_force_boots.iff"
}

object_tangible_wearables_armor_rebel_spec_force_armor_rebel_spec_force_bracer_l_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_spec_force/shared_armor_rebel_spec_force_bracer_l.iff"
}

object_tangible_wearables_armor_rebel_spec_force_armor_rebel_spec_force_bracer_r_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_spec_force/shared_armor_rebel_spec_force_bracer_r.iff"
}

object_tangible_wearables_armor_rebel_spec_force_armor_rebel_spec_force_chest_plate_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_spec_force/shared_armor_rebel_spec_force_chest_plate.iff"
}

object_tangible_wearables_armor_rebel_spec_force_armor_rebel_spec_force_gloves_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_spec_force/shared_armor_rebel_spec_force_gloves.iff"
}

object_tangible_wearables_armor_rebel_spec_force_armor_rebel_spec_force_helmet_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_spec_force/shared_armor_rebel_spec_force_helmet.iff"
}

object_tangible_wearables_armor_rebel_spec_force_armor_rebel_spec_force_leggings_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/armor/rebel_spec_force/shared_armor_rebel_spec_force_leggings.iff"
}
