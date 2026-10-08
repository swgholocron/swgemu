-- Parent templates first: they must exist before the templates that derive from them load.
includeFile("../custom_scripts/object/base_parents/serverobjects.lua")

-- Object templates for vanilla creature appearances reused as custom world
-- bosses (Flurry ported these without their own object/mobile registration,
-- so the client meshes existed but the server had no template to spawn them).
includeFile("../custom_scripts/object/mobile/shared_carax.lua")
includeFile("../custom_scripts/object/mobile/carax.lua")
includeFile("../custom_scripts/object/mobile/shared_dressed_dathomir_nightsister_sage.lua")
includeFile("../custom_scripts/object/mobile/dressed_dathomir_nightsister_sage.lua")
includeFile("../custom_scripts/object/mobile/shared_kkorrwrot.lua")
includeFile("../custom_scripts/object/mobile/kkorrwrot.lua")
includeFile("../custom_scripts/object/mobile/shared_meatlump_king.lua")
includeFile("../custom_scripts/object/mobile/meatlump_king.lua")
includeFile("../custom_scripts/object/mobile/shared_mutant_acklay.lua")
includeFile("../custom_scripts/object/mobile/mutant_acklay.lua")

-- Elite-tier harvester/generator installations + deeds ported from
-- Bloodfin.Net's client assets (holocron2.tre, not yet deployed to the
-- client or added to TrePath -- these templates are dormant until both the
-- client patch ships and something actually spawns/grants them; nothing
-- loots or crafts these yet). Stats are our own extrapolation of the
-- existing small/medium/heavy progression one tier further, since
-- Bloodfin's original server-side numbers aren't recoverable from their
-- client install alone -- treat them as a starting point, not final balance.
includeFile("../custom_scripts/object/installation/generators/elite_serverobjects.lua")
includeFile("../custom_scripts/object/installation/mining_ore/elite_serverobjects.lua")
includeFile("../custom_scripts/object/installation/mining_gas/elite_serverobjects.lua")
includeFile("../custom_scripts/object/installation/mining_liquid/elite_serverobjects.lua")
includeFile("../custom_scripts/object/installation/mining_organic/elite_serverobjects.lua")
includeFile("../custom_scripts/object/tangible/deed/generator_deed/elite_serverobjects.lua")
includeFile("../custom_scripts/object/tangible/deed/harvester_deed/elite_serverobjects.lua")

-- Elite lightsaber schematics, their crafted-output weapons, and the
-- use-to-learn loot tokens that grant them, ported from Bloodfin.Net's
-- client assets. Two real Bloodfin content bugs fixed directly in the
-- extracted holocron2.tre binaries before this: the gen6 polearm schematic's
-- crafted-output pointer mistakenly referenced gen5's weapon file (now
-- points at its own gen6 output), and the reverse-grip schematic pointed at
-- a weapon file that doesn't exist in any Bloodfin or vanilla archive (now
-- redirected to the same generic one-handed lightsaber base other
-- schematics already use). The one-handed-pvp-bf weapon's client asset is
-- already present in our live client (holocron.tre) -- it works today,
-- independent of holocron2.tre's deployment status.
includeFile("../custom_scripts/object/draft_schematic/lightsaber_elite/elite_serverobjects.lua")
includeFile("../custom_scripts/object/weapon/lightsaber_elite/elite_serverobjects.lua")
includeFile("../custom_scripts/object/tangible/loot_schematic/lightsaber_elite/elite_serverobjects.lua")

-- Elite ranged weapons ported from Bloodfin.Net's client assets. Standalone
-- loot weapons (no schematic backs any of them in Bloodfin's own client
-- data either). Two files renamed from messy originals during extraction
-- (shared_pistol_dx2.iff was "... - Copy.iff", shared_pistol_flare.iff was
-- "wp_pistol_flare.apt.iff") -- both are complete, valid weapon data.
includeFile("../custom_scripts/object/weapon/ranged_elite/elite_serverobjects.lua")

-- Elite melee weapons ported from Bloodfin.Net's client assets. Standalone
-- loot weapons (no schematic backs any of them in Bloodfin's own client
-- data either). Stats are tiered off each item's own naming convention
-- (_npe/_generic/_static/_legendary/"ep3_loot_"/"som_") against the closest
-- vanilla weapon of the same class -- extrapolated, not Bloodfin's real
-- numbers (not recoverable from the client alone).
includeFile("../custom_scripts/object/weapon/melee_elite/elite_serverobjects.lua")

-- Elite armor/clothing schematics + crafted pieces ported from Bloodfin.Net's
-- client assets. 90 of the 94 crafted-output armor/backpack/robe files were
-- ALREADY live in our deployed client (holocron.tre/mtg_patch_022.tre) with
-- no server-side registration at all -- same gap as the 5 world-boss object
-- templates fixed earlier, just at a much larger scale. Also fixed two real
-- Bloodfin content bugs directly in the holocron2.tre binaries: the Imperial
-- and Rebel capes' crafted-output pointers said "wearables/robe/" when the
-- actual asset lives under "wearables/cape/" (same length, safe swap), and
-- the two "helmet_invis" schematics pointed at crafted files that don't
-- exist anywhere -- redirected to each set's own regular (visible) helmet,
-- which already exists and is already registered. True invisible-helmet
-- rendering isn't implemented by this fix; it's a fallback so the schematic
-- doesn't dangle. Discovered 2 complete armor sets (Infiltrator, Rebel Spec
-- Force) that weren't in the original skim -- they used "clothing_armor_*"
-- naming instead of "armor_*". Resistance values are our own extrapolation
-- per named set, anchored against two real references already in our tree:
-- vanilla Composite (~75, top endgame tier) and the existing Marauder S02
-- pieces (25/15/.../15, a lighter lower tier) -- not Bloodfin's real numbers.
includeFile("../custom_scripts/object/draft_schematic/armor_elite/elite_serverobjects.lua")
includeFile("../custom_scripts/object/tangible/wearables/armor_elite/elite_serverobjects.lua")
includeFile("../custom_scripts/object/tangible/wearables/base_fannypack.lua")
includeFile("../custom_scripts/object/tangible/wearables/misc_elite/elite_serverobjects.lua")

-- Elite vehicles ported from Bloodfin.Net client assets + a large pre-existing
-- registration gap in the baseline deployed client (holocron.tre/mtg_patch_022.tre):
-- 68 vehicle deed client files were already live with zero server-side templates,
-- plus 7 swoop racer colors whose deed+control-device already exist in the baseline
-- client but whose rideable mesh only exists in holocron2.tre (dormant pending
-- deployment, same status as the sabers/armor). 15 of the registrations below also
-- fix a pre-existing live bug: vanilla's own vehicledeedsrare loot group (already
-- rolling on every world boss/event mob) referenced 15 TCG-series/podracer deeds
-- that were never registered -- those loot items needed zero changes, just the
-- missing templates. The 8 AT-walker-class vehicles (AT-AT/AT-PT/AT-ST/AT-RT/AT-XT
-- plus the older camo/legacy/TCG walker variants) are registered but intentionally
-- excluded from any schematic or normal loot group -- per server design decision,
-- they are rare boss-loot-only, never craftable or vendor-sold. Crafting fields on
-- the 39 schematics are extrapolated from vanilla's landspeeder_x34 as the closest
-- equivalent -- not Bloodfin's original numbers (not recoverable from the client).
includeFile("../custom_scripts/object/mobile/vehicle_elite/podracer_anakin.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/podracer_gasgano.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/podracer_mawhonic.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/sith_speeder_tcg.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/koro2_exodrive.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/podracer_longtail.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/swamp_speeder_tcg.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/balta_podracer_tcg.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/geonosian_speeder_tcg.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/senate_pod_tcg.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/air2_swoop_speeder_tcg.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/fg_8t8_podracer_tcg.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/xj6_air_speeder_tcg.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/tcg_hk47_jetpack_fix.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/tcg_republic_gunship_fix.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/walker_atat.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/walker_atpt.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/walker_atrt.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/walker_atst.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/walker_atxt_h2.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/walker_at_rt_camo.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/walker_at_xt_legacy.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/walker_at_pt_tcg.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/swoop_black.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/swoop_blue.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/swoop_gold.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/swoop_green.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/swoop_purple.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/swoop_red.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/swoop_silver.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_a1_deluxe_floater_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_barc_speeder_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_barc_speeder_imperial_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_barc_speeder_rebel_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_basilisk_war_droid.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_flare_s_swoop.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_flare_s_swoop_crafted.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_grievous_wheel_bike_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_hover_chair_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_hoverlifter_speeder.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_hoverlifter_speeder_crafted.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_koro2_speeder_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_landspeeder_ab1_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_landspeeder_desert_skiff_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_landspeeder_lava_skiff_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_landspeeder_organa_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_landspeeder_tantive4_adv_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_landspeeder_tantive4_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_landspeeder_usv5_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_landspeeder_usv5_s02_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_landspeeder_v35_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_landspeeder_xp38_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_light_bending_barc_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_mechno_chair_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_military_transport_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_mustafar_panning_droid.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_pod_racer_ipg_longtail_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_pod_racer_light_bending_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_pod_racer_one_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_pod_racer_two_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_snowspeeder_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_speeder_ric_920_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_speeder_stap_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_tcg_8_air_speeder_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_tcg_merr_sonn_jt12_jetpack_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_tcg_military_transport_deed.lua")
includeFile("../custom_scripts/object/mobile/vehicle_elite/veh_temp_walker1_deed.lua")

includeFile("../custom_scripts/object/intangible/vehicle_elite/podracer_anakin_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/podracer_gasgano_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/podracer_mawhonic_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/sith_speeder_tcg_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/koro2_exodrive_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/podracer_longtail_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/swamp_speeder_tcg_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/balta_podracer_tcg_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/geonosian_speeder_tcg_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/senate_pod_tcg_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/air2_swoop_speeder_tcg_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/fg_8t8_podracer_tcg_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/xj6_air_speeder_tcg_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/tcg_hk47_jetpack_fix_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/tcg_republic_gunship_fix_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/walker_atat_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/walker_atpt_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/walker_atrt_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/walker_atst_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/walker_atxt_h2_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/walker_at_rt_camo_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/walker_at_xt_legacy_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/walker_at_pt_tcg_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/swoop_black_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/swoop_blue_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/swoop_gold_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/swoop_green_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/swoop_purple_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/swoop_red_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/swoop_silver_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_a1_deluxe_floater_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_barc_speeder_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_barc_speeder_imperial_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_barc_speeder_rebel_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_basilisk_war_droid_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_flare_s_swoop_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_flare_s_swoop_crafted_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_grievous_wheel_bike_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_hover_chair_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_hoverlifter_speeder_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_hoverlifter_speeder_crafted_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_koro2_speeder_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_landspeeder_ab1_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_landspeeder_desert_skiff_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_landspeeder_lava_skiff_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_landspeeder_organa_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_landspeeder_tantive4_adv_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_landspeeder_tantive4_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_landspeeder_usv5_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_landspeeder_usv5_s02_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_landspeeder_v35_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_landspeeder_xp38_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_light_bending_barc_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_mechno_chair_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_military_transport_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_mustafar_panning_droid_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_pod_racer_ipg_longtail_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_pod_racer_light_bending_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_pod_racer_one_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_pod_racer_two_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_snowspeeder_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_speeder_ric_920_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_speeder_stap_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_tcg_8_air_speeder_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_tcg_merr_sonn_jt12_jetpack_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_tcg_military_transport_deed_pcd.lua")
includeFile("../custom_scripts/object/intangible/vehicle_elite/veh_temp_walker1_deed_pcd.lua")

includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/podracer_anakin.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/podracer_gasgano.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/podracer_mawhonic.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/sith_speeder_tcg.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/koro2_exodrive.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/podracer_longtail.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/swamp_speeder_tcg.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/balta_podracer_tcg.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/geonosian_speeder_tcg.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/senate_pod_tcg.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/air2_swoop_speeder_tcg.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/fg_8t8_podracer_tcg.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/xj6_air_speeder_tcg.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/tcg_hk47_jetpack_fix.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/tcg_republic_gunship_fix.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/walker_atat.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/walker_atpt.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/walker_atrt.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/walker_atst.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/walker_atxt_h2.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/walker_at_rt_camo.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/walker_at_xt_legacy.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/walker_at_pt_tcg.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/swoop_black.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/swoop_blue.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/swoop_gold.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/swoop_green.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/swoop_purple.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/swoop_red.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/swoop_silver.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_a1_deluxe_floater_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_barc_speeder_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_barc_speeder_imperial_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_barc_speeder_rebel_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_basilisk_war_droid.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_flare_s_swoop.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_flare_s_swoop_crafted.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_grievous_wheel_bike_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_hover_chair_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_hoverlifter_speeder.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_hoverlifter_speeder_crafted.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_koro2_speeder_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_landspeeder_ab1_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_landspeeder_desert_skiff_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_landspeeder_lava_skiff_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_landspeeder_organa_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_landspeeder_tantive4_adv_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_landspeeder_tantive4_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_landspeeder_usv5_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_landspeeder_usv5_s02_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_landspeeder_v35_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_landspeeder_xp38_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_light_bending_barc_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_mechno_chair_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_military_transport_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_mustafar_panning_droid.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_pod_racer_ipg_longtail_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_pod_racer_light_bending_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_pod_racer_one_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_pod_racer_two_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_snowspeeder_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_speeder_ric_920_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_speeder_stap_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_tcg_8_air_speeder_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_tcg_merr_sonn_jt12_jetpack_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_tcg_military_transport_deed.lua")
includeFile("../custom_scripts/object/tangible/deed/vehicle_deed_elite/veh_temp_walker1_deed.lua")

includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/swoop_black.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/swoop_blue.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/swoop_gold.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/swoop_green.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/swoop_purple.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/swoop_red.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/swoop_silver.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_a1_deluxe_floater_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_barc_speeder_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_barc_speeder_imperial_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_barc_speeder_rebel_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_basilisk_war_droid.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_flare_s_swoop.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_flare_s_swoop_crafted.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_hover_chair_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_hoverlifter_speeder.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_hoverlifter_speeder_crafted.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_koro2_speeder_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_landspeeder_ab1_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_landspeeder_desert_skiff_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_landspeeder_lava_skiff_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_landspeeder_organa_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_landspeeder_tantive4_adv_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_landspeeder_tantive4_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_landspeeder_usv5_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_landspeeder_usv5_s02_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_landspeeder_v35_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_landspeeder_xp38_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_mechno_chair_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_mustafar_panning_droid.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_pod_racer_ipg_longtail_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_pod_racer_one_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_pod_racer_two_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_snowspeeder_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_speeder_ric_920_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_speeder_stap_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_tcg_8_air_speeder_deed.lua")
includeFile("../custom_scripts/object/draft_schematic/vehicle_elite/veh_tcg_military_transport_deed.lua")

includeFile("../custom_scripts/object/tangible/loot_schematic/vehicle_elite/swoop_black.lua")
includeFile("../custom_scripts/object/tangible/loot_schematic/vehicle_elite/swoop_blue.lua")
includeFile("../custom_scripts/object/tangible/loot_schematic/vehicle_elite/swoop_gold.lua")
includeFile("../custom_scripts/object/tangible/loot_schematic/vehicle_elite/swoop_green.lua")
includeFile("../custom_scripts/object/tangible/loot_schematic/vehicle_elite/swoop_purple.lua")
includeFile("../custom_scripts/object/tangible/loot_schematic/vehicle_elite/swoop_red.lua")
includeFile("../custom_scripts/object/tangible/loot_schematic/vehicle_elite/swoop_silver.lua")


-- Halloween event (ported from Flurry)
includeFile("../custom_scripts/object/halloween/serverobjects.lua")

-- Taanab / Mustafar creature object templates (ported from Flurry)
includeFile("../custom_scripts/object/flurry_planets/serverobjects.lua")
includeFile("../custom_scripts/object/infinity_dwb/serverobjects.lua")
includeFile("../custom_scripts/object/flurry_loot/serverobjects.lua")
