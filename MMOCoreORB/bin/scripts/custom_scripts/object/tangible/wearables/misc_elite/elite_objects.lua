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


-- Elite backpacks/robes/capes ported from Bloodfin.Net's client assets.
-- Nearly all of these crafted-output files were already present in our
-- deployed client -- just never server-registered. Plain craftable
-- tangible wearables, matching the vanilla backpack_s01.lua pattern
-- (fixed hitpoints, no armor resistance fields -- these aren't armor).

object_tangible_wearables_misc_backpack_galactic_marine_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/backpack/shared_backpack_galactic_marine.iff"
}

object_tangible_wearables_misc_backpack_gmf_01_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/backpack/shared_backpack_gmf_01.iff"
}

object_tangible_wearables_misc_backpack_krayt_skull_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/backpack/shared_backpack_krayt_skull.iff"
}

object_tangible_wearables_misc_backpack_rebel_snow_soldier_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/backpack/shared_backpack_rebel_snow_soldier.iff"
}

object_tangible_wearables_misc_backpack_s07_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/backpack/shared_backpack_s07.iff"
}

object_tangible_wearables_misc_backpack_s08_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/backpack/shared_backpack_s08.iff"
}

object_tangible_wearables_misc_backpack_s09_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/backpack/shared_backpack_s09.iff"
}

object_tangible_wearables_misc_backpack_snowtrooper_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/backpack/shared_backpack_snowtrooper.iff"
}

object_tangible_wearables_misc_backpack_tauntaun_skull_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/backpack/shared_backpack_tauntaun_skull.iff"
}

object_tangible_wearables_misc_cape_imperial_01_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/cape/shared_cape_imperial_01.iff"
}

object_tangible_wearables_misc_cape_rebel_01_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/cape/shared_cape_rebel_01.iff"
}

object_tangible_wearables_misc_empireday_rebel_endor_backpack_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/backpack/shared_empireday_rebel_endor_backpack.iff"
}

object_tangible_wearables_misc_empireday_sandtrooper_backpack_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/backpack/shared_empireday_sandtrooper_backpack.iff"
}

object_tangible_wearables_misc_ep3_chiss_poacher_backpack_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/backpack/shared_ep3_chiss_poacher_backpack.iff"
}

object_tangible_wearables_misc_fannypack_s01_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/backpack/shared_fannypack_s01.iff"
}

object_tangible_wearables_misc_nym_themepark_backpack_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/backpack/shared_nym_themepark_backpack.iff"
}

object_tangible_wearables_misc_padawan_pouch_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/backpack/shared_padawan_pouch.iff"
}

object_tangible_wearables_misc_robe_s32_h1_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/robe/shared_robe_s32_h1.iff"
}

object_tangible_wearables_misc_robe_s33_h1_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/robe/shared_robe_s33_h1.iff"
}

object_tangible_wearables_misc_wearable_backpack_armored_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/backpack/shared_wearable_backpack_armored.iff"
}

object_tangible_wearables_misc_wearable_backpack_c3po_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/backpack/shared_wearable_backpack_c3po.iff"
}

object_tangible_wearables_misc_wearable_backpack_recon_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/backpack/shared_wearable_backpack_recon.iff"
}

object_tangible_wearables_misc_wearable_backpack_yoda_shared = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/backpack/shared_wearable_backpack_yoda.iff"
}
