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


-- Elite melee weapons ported from Bloodfin.Net's client assets
-- (holocron2.tre, not yet deployed). Standalone loot weapons -- no
-- draft schematic backs any of them in Bloodfin's own client data
-- either (confirmed: none of these binaries carry a craftedSharedTemplate
-- chunk). certificationsRequired is left empty, same reasoning as the
-- ranged weapon pass. Stats are tiered off the item's own naming
-- convention (_npe/_generic/_static/_legendary/"ep3_loot_"/"som_")
-- against the closest vanilla weapon of the same class (sword/2h_sword/
-- polearm/baton/unarmed) -- Bloodfin's own server-side numbers aren't
-- recoverable from the client alone, so these are our extrapolation,
-- not final balance.

-- beskar_spear [polearm/legendary]
object_weapon_melee_beskar_spear_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/polearm/shared_beskar_spear.iff"
}

-- 2h_sword_avatar_wke_toothpick [2h_sword/named]
object_weapon_melee_2h_sword_avatar_wke_toothpick_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_2h_sword_avatar_wke_toothpick.iff"
}

-- 2h_sword_avatar_wke_toothpick2 [2h_sword/named]
object_weapon_melee_2h_sword_avatar_wke_toothpick2_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_2h_sword_avatar_wke_toothpick2.iff"
}

-- 2h_sword_battleaxe [2h_sword/named]
object_weapon_melee_2h_sword_battleaxe_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_2h_sword_battleaxe.iff"
}

-- 2h_sword_battleaxe_npe [2h_sword/npe]
object_weapon_melee_2h_sword_battleaxe_npe_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_2h_sword_battleaxe_npe.iff"
}

-- 2h_sword_cleaver_npe [2h_sword/npe]
object_weapon_melee_2h_sword_cleaver_npe_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_2h_sword_cleaver_npe.iff"
}

-- 2h_sword_kashyyk_wod [2h_sword/named]
object_weapon_melee_2h_sword_kashyyk_wod_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_2h_sword_kashyyk_wod.iff"
}

-- 2h_sword_katana_generic [2h_sword/generic]
object_weapon_melee_2h_sword_katana_generic_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_2h_sword_katana_generic.iff"
}

-- 2h_sword_kun_massassi [2h_sword/named]
object_weapon_melee_2h_sword_kun_massassi_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_2h_sword_kun_massassi.iff"
}

-- 2h_sword_maul_legendary [2h_sword/legendary]
object_weapon_melee_2h_sword_maul_legendary_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_2h_sword_maul_legendary.iff"
}

-- 2h_sword_pvp_bf_01 [2h_sword/named]
object_weapon_melee_2h_sword_pvp_bf_01_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_2h_sword_pvp_bf_01.iff"
}

-- 2h_sword_sith_generic [2h_sword/generic]
object_weapon_melee_2h_sword_sith_generic_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_2h_sword_sith_generic.iff"
}

-- 2h_sword_sith_wod [2h_sword/named]
object_weapon_melee_2h_sword_sith_wod_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_2h_sword_sith_wod.iff"
}

-- 2h_sword_wod_scyth [2h_sword/named]
object_weapon_melee_2h_sword_wod_scyth_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_2h_sword_wod_scyth.iff"
}

-- 2h_sword_wod_sword [2h_sword/named]
object_weapon_melee_2h_sword_wod_sword_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_2h_sword_wod_sword.iff"
}

-- baton_avatar_trando_stun_stick [baton/named]
object_weapon_melee_baton_avatar_trando_stun_stick_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_baton_avatar_trando_stun_stick.iff"
}

-- baton_gaderiffi_elite [baton/legendary]
object_weapon_melee_baton_gaderiffi_elite_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_baton_gaderiffi_elite.iff"
}

-- baton_gaderiffi_npe [baton/npe]
object_weapon_melee_baton_gaderiffi_npe_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_baton_gaderiffi_npe.iff"
}

-- baton_stun [baton/named]
object_weapon_melee_baton_stun_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_baton_stun.iff"
}

-- baton_stun_legendary [baton/legendary]
object_weapon_melee_baton_stun_legendary_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_baton_stun_legendary.iff"
}

-- blacksun_razor_generic [baton/generic]
object_weapon_melee_blacksun_razor_generic_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_blacksun_razor_generic.iff"
}

-- blasterfist_generic [baton/generic]
object_weapon_melee_blasterfist_generic_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_blasterfist_generic.iff"
}

-- ep3_loot_eventide [sword/ep3]
object_weapon_melee_ep3_loot_eventide_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_ep3_loot_eventide.iff"
}

-- ep3_loot_executer [baton/ep3]
object_weapon_melee_ep3_loot_executer_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_ep3_loot_executer.iff"
}

-- ep3_loot_heartstriker [baton/ep3]
object_weapon_melee_ep3_loot_heartstriker_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_ep3_loot_heartstriker.iff"
}

-- ep3_loot_lifeblood [baton/ep3]
object_weapon_melee_ep3_loot_lifeblood_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_ep3_loot_lifeblood.iff"
}

-- ep3_loot_necrosis [baton/ep3]
object_weapon_melee_ep3_loot_necrosis_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_ep3_loot_necrosis.iff"
}

-- ep3_loot_pestilence [baton/ep3]
object_weapon_melee_ep3_loot_pestilence_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_ep3_loot_pestilence.iff"
}

-- ep3_loot_pestilence_wod [baton/ep3]
object_weapon_melee_ep3_loot_pestilence_wod_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_ep3_loot_pestilence_wod.iff"
}

-- ep3_loot_poisonspike [baton/ep3]
object_weapon_melee_ep3_loot_poisonspike_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_ep3_loot_poisonspike.iff"
}

-- ep3_loot_ripper [sword/ep3]
object_weapon_melee_ep3_loot_ripper_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_ep3_loot_ripper.iff"
}

-- ep3_loot_ripper_wod [sword/ep3]
object_weapon_melee_ep3_loot_ripper_wod_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_ep3_loot_ripper_wod.iff"
}

-- ep3_loot_sickle [baton/ep3]
object_weapon_melee_ep3_loot_sickle_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_ep3_loot_sickle.iff"
}

-- ep3_loot_sickle_wod [baton/ep3]
object_weapon_melee_ep3_loot_sickle_wod_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_ep3_loot_sickle_wod.iff"
}

-- ep3_loot_soulstinger [baton/ep3]
object_weapon_melee_ep3_loot_soulstinger_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_ep3_loot_soulstinger.iff"
}

-- ep3_loot_strike [baton/ep3]
object_weapon_melee_ep3_loot_strike_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_ep3_loot_strike.iff"
}

-- fan_metal [baton/named]
object_weapon_melee_fan_metal_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_fan_metal.iff"
}

-- lance_avatar_wke_heartlance [polearm/legendary]
object_weapon_melee_lance_avatar_wke_heartlance_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_lance_avatar_wke_heartlance.iff"
}

-- lance_controllerfp_npe [polearm/npe]
object_weapon_melee_lance_controllerfp_npe_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_lance_controllerfp_npe.iff"
}

-- lance_gcw_gand_shockprod [polearm/named]
object_weapon_melee_lance_gcw_gand_shockprod_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_lance_gcw_gand_shockprod.iff"
}

-- lance_kaminoan_generic [polearm/generic]
object_weapon_melee_lance_kaminoan_generic_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_lance_kaminoan_generic.iff"
}

-- lance_kashyyk_generic [polearm/generic]
object_weapon_melee_lance_kashyyk_generic_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_lance_kashyyk_generic.iff"
}

-- lance_nightsister_legendary [polearm/legendary]
object_weapon_melee_lance_nightsister_legendary_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_lance_nightsister_legendary.iff"
}

-- lance_staff_magna_guard [polearm/named]
object_weapon_melee_lance_staff_magna_guard_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_lance_staff_magna_guard.iff"
}

-- lance_staff_wood_s1_npe [polearm/npe]
object_weapon_melee_lance_staff_wood_s1_npe_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_lance_staff_wood_s1_npe.iff"
}

-- lance_staff_wood_s2_npe [polearm/npe]
object_weapon_melee_lance_staff_wood_s2_npe_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_lance_staff_wood_s2_npe.iff"
}

-- lance_wod_twin_blade [polearm/named]
object_weapon_melee_lance_wod_twin_blade_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_lance_wod_twin_blade.iff"
}

-- mandoviol_smasher [baton/named]
object_weapon_melee_mandoviol_smasher_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_mandoviol_smasher.iff"
}

-- massassiknuckler_generic [unarmed/generic]
object_weapon_melee_massassiknuckler_generic_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_massassiknuckler_generic.iff"
}

-- polearm_heroic_sd [polearm/named]
object_weapon_melee_polearm_heroic_sd_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_polearm_heroic_sd.iff"
}

-- polearm_vibro_axe_npe [polearm/npe]
object_weapon_melee_polearm_vibro_axe_npe_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_polearm_vibro_axe_npe.iff"
}

-- punch_dagger [unarmed/named]
object_weapon_melee_punch_dagger_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_punch_dagger.iff"
}

-- pvp_bf_knuckler [unarmed/named]
object_weapon_melee_pvp_bf_knuckler_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_pvp_bf_knuckler.iff"
}

-- quest_2h_sword_battleaxe [2h_sword/named]
object_weapon_melee_quest_2h_sword_battleaxe_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_quest_2h_sword_battleaxe.iff"
}

-- quest_2h_sword_maul [2h_sword/named]
object_weapon_melee_quest_2h_sword_maul_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_quest_2h_sword_maul.iff"
}

-- som_2h_sword_massassi [2h_sword/som]
object_weapon_melee_som_2h_sword_massassi_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_som_2h_sword_massassi.iff"
}

-- som_2h_sword_obsidian [2h_sword/som]
object_weapon_melee_som_2h_sword_obsidian_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_som_2h_sword_obsidian.iff"
}

-- som_2h_sword_obsidian_generic [2h_sword/generic]
object_weapon_melee_som_2h_sword_obsidian_generic_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_som_2h_sword_obsidian_generic.iff"
}

-- som_2h_sword_tulrus [2h_sword/som]
object_weapon_melee_som_2h_sword_tulrus_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_som_2h_sword_tulrus.iff"
}

-- som_2h_sword_tulrus_generic [2h_sword/generic]
object_weapon_melee_som_2h_sword_tulrus_generic_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_som_2h_sword_tulrus_generic.iff"
}

-- som_lance_obsidian [polearm/som]
object_weapon_melee_som_lance_obsidian_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_som_lance_obsidian.iff"
}

-- som_lance_obsidian_generic [polearm/generic]
object_weapon_melee_som_lance_obsidian_generic_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_som_lance_obsidian_generic.iff"
}

-- som_lance_xandank [polearm/som]
object_weapon_melee_som_lance_xandank_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_som_lance_xandank.iff"
}

-- som_lance_xandank_generic [polearm/generic]
object_weapon_melee_som_lance_xandank_generic_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_som_lance_xandank_generic.iff"
}

-- som_sword_mustafar_bandit [sword/som]
object_weapon_melee_som_sword_mustafar_bandit_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_som_sword_mustafar_bandit.iff"
}

-- som_sword_mustafar_bandit_generic [sword/generic]
object_weapon_melee_som_sword_mustafar_bandit_generic_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_som_sword_mustafar_bandit_generic.iff"
}

-- som_sword_obsidian [sword/som]
object_weapon_melee_som_sword_obsidian_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_som_sword_obsidian.iff"
}

-- som_sword_obsidian_generic [sword/generic]
object_weapon_melee_som_sword_obsidian_generic_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_som_sword_obsidian_generic.iff"
}

-- sword_01_npe [sword/npe]
object_weapon_melee_sword_01_npe_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_sword_01_npe.iff"
}

-- sword_01_static [sword/generic]
object_weapon_melee_sword_01_static_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_sword_01_static.iff"
}

-- sword_02_generic [sword/generic]
object_weapon_melee_sword_02_generic_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_sword_02_generic.iff"
}

-- sword_avatar_wke_spiritblade [sword/legendary]
object_weapon_melee_sword_avatar_wke_spiritblade_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_sword_avatar_wke_spiritblade.iff"
}

-- sword_mace_junti_generic [sword/generic]
object_weapon_melee_sword_mace_junti_generic_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_sword_mace_junti_generic.iff"
}

-- sword_mandalorian [sword/named]
object_weapon_melee_sword_mandalorian_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_sword_mandalorian.iff"
}

-- sword_massassi_generic [sword/generic]
object_weapon_melee_sword_massassi_generic_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_sword_massassi_generic.iff"
}

-- sword_pvp_bf_01 [sword/named]
object_weapon_melee_sword_pvp_bf_01_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_sword_pvp_bf_01.iff"
}

-- sword_rantok_generic [sword/generic]
object_weapon_melee_sword_rantok_generic_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_sword_rantok_generic.iff"
}

-- sword_rebel [sword/named]
object_weapon_melee_sword_rebel_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_sword_rebel.iff"
}

-- sword_rsf_generic [sword/generic]
object_weapon_melee_sword_rsf_generic_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_sword_rsf_generic.iff"
}

-- sword_wod_scyth [sword/named]
object_weapon_melee_sword_wod_scyth_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_sword_wod_scyth.iff"
}

-- sword_wod_sword [sword/named]
object_weapon_melee_sword_wod_sword_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_sword_wod_sword.iff"
}

-- sword_wookiee [sword/named]
object_weapon_melee_sword_wookiee_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_sword_wookiee.iff"
}

-- vibroknuckler_npe [unarmed/npe]
object_weapon_melee_vibroknuckler_npe_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_vibroknuckler_npe.iff"
}

-- vibroknuckler_static [unarmed/generic]
object_weapon_melee_vibroknuckler_static_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_vibroknuckler_static.iff"
}

-- wod_war_fan [baton/named]
object_weapon_melee_wod_war_fan_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_wod_war_fan.iff"
}

-- wookiee_knuckler_wod [unarmed/named]
object_weapon_melee_wookiee_knuckler_wod_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_wookiee_knuckler_wod.iff"
}

-- xantha_smasher [baton/named]
object_weapon_melee_xantha_smasher_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/shared_xantha_smasher.iff"
}

-- mando_mytho_claw [baton/legendary]
object_weapon_melee_mando_mytho_claw_shared = SharedWeaponObjectTemplate:new {
	clientTemplateFileName = "object/weapon/melee/special/shared_mando_mytho_claw.iff"
}
