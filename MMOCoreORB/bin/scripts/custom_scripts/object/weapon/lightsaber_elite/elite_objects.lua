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


-- Elite lightsaber weapon templates ported from Bloodfin.Net's client
-- assets (holocron2.tre, not yet deployed). These are the crafted-output
-- weapons for the elite schematics -- Bloodfin's client shipped the model
-- but never a server-side wrapper, same gap we found and fixed for the
-- world boss object templates. Stats are copied from the closest existing
-- vanilla analog of the same weapon class (polearm or one-handed lightsaber)
-- since actual damage is crystal-driven, not hilt-driven, in this engine --
-- our own gen4/gen5 polearm sabers already plateau at identical numbers.

-- Real crafted output of the elite polearm gen6 schematic (polearm/lance base).
object_weapon_sword_lightsaber_polearm_gen6_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/polearm/crafted_saber/shared_sword_lightsaber_polearm_gen6.iff"
}

-- Real crafted output of the elite Mandalorian lightsaber schematic (sword base).
object_weapon_sword_lightsaber_one_handed_pvp_bf_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/sword/crafted_saber/shared_sword_lightsaber_one_handed_pvp_bf.iff"
}

-- Standalone named blade (NPC/loot use), same base class as the one-handed gen5 saber.
object_weapon_sword_lightsaber_adeen_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_sword_lightsaber_adeen.iff"
}

-- Standalone named blade (NPC/loot use), same base class as the one-handed gen5 saber.
object_weapon_sword_lightsaber_umakk_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_sword_lightsaber_umakk.iff"
}
