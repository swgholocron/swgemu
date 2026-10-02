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


-- Elite ranged weapons ported from Bloodfin.Net's client assets
-- (holocron2.tre, not yet deployed). These are standalone loot weapons --
-- no draft schematic backs any of them, matching Bloodfin's own client
-- data (no craftedSharedTemplate/resource-slot chunks in any of these
-- binaries). certificationsRequired is left empty (matching the vanilla
-- creature-weapon convention) since there's no schematic to grant a
-- weapon-specific cert -- these are meant to be usable the moment
-- they're looted. Stats are modeled on the closest vanilla weapon of the
-- same class (pistol/carbine/rifle base), since Bloodfin's own
-- server-side numbers aren't recoverable from the client alone.
-- shared_pistol_dx2.iff and shared_pistol_flare.iff were renamed from
-- Bloodfin's own messy filenames ("... - Copy.iff", "....apt.iff") --
-- both are complete, valid weapon data, not junk.

-- Imperial-issue carbine, modeled on vanilla carbine_dh17.
object_weapon_ranged_carbine_dc15_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/ranged/carbine/shared_carbine_dc15.iff"
}

-- Carbine-class bowcaster, scaled down from vanilla rifle_bowcaster.
object_weapon_ranged_carbine_wookiee_bowcaster_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/ranged/carbine/shared_carbine_wookiee_bowcaster.iff"
}

-- Heavy cannon; client derives it from the rifle base despite the 'heavy' folder. Modeled above vanilla rifle_berserker.
object_weapon_ranged_heat_lava_cannon_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/ranged/heavy/shared_heat_lava_cannon.iff"
}

-- DX-2-style disruptor pistol; boosted above vanilla pistol_d18 for its namesake's reputation.
object_weapon_ranged_pistol_dx2_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/ranged/pistol/shared_pistol_dx2.iff"
}

-- Ion/stun sidearm -- electricity damage type per SW lore, lower lethal output.
object_weapon_ranged_pistol_ion_stunner_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/ranged/pistol/shared_pistol_ion_stunner.iff"
}

-- Suppressed pistol, modest damage matching vanilla pistol_d18 tier.
object_weapon_ranged_pistol_trando_suppressor_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/ranged/pistol/shared_pistol_trando_suppressor.iff"
}

-- Wookiee-scale pistol, slightly boosted over vanilla pistol_d18.
object_weapon_ranged_pistol_wookiee_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/ranged/pistol/shared_pistol_wookiee.iff"
}

-- Pistol-class bowcaster, scaled down from vanilla rifle_bowcaster.
object_weapon_ranged_pistol_wookiee_bowcaster_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/ranged/pistol/shared_pistol_wookiee_bowcaster.iff"
}

-- Flare/signal pistol -- weak combat stats befitting a non-combat tool pressed into use.
object_weapon_ranged_pistol_flare_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/ranged/pistol/shared_pistol_flare.iff"
}

-- Crystal-powered rifle, modeled on vanilla rifle_cdef with a moderate boost.
object_weapon_ranged_rifle_naktra_crystal_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/ranged/rifle/shared_rifle_naktra_crystal.iff"
}

-- Trandoshan hunter rifle, above vanilla rifle_cdef given the bounty-hunter theme.
object_weapon_ranged_rifle_trando_hunter_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/ranged/rifle/shared_rifle_trando_hunter.iff"
}

-- Refined variant of the hunter rifle above -- modest upgrade over the base version.
object_weapon_ranged_rifle_trando_hunter_crafted_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/ranged/rifle/shared_rifle_trando_hunter_crafted.iff"
}

-- Directly reuses vanilla rifle_berserker's exact stats -- same 'berserker' weapon archetype.
object_weapon_ranged_rifle_tusken_berserker_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/ranged/rifle/shared_rifle_tusken_berserker.iff"
}
