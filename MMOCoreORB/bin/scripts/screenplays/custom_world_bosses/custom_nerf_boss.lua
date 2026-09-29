local screenplayHelper = {}

custom_nerf_boss_screenplay = ScreenPlay:new {
	numberOfActs = 1,

	screenplayName = "custom_nerf_boss_screenplay",

}

registerScreenPlay("custom_nerf_boss_screenplay", true)

function custom_nerf_boss_screenplay:start()
	if (isZoneEnabled("corellia")) then
		self:spawnMobiles()
	end
end

function custom_nerf_boss_screenplay:spawnMobiles()
  	pNerfBoss = spawnMobile("corellia", "custom_nerf_boss", 1800, 6489, 20, -2841, 15, 0)
--Need code to add spawns as time goes by
	-- Herd spawns clustered around the boss (Flurry's original coordinates here
	-- were copy-pasted from the Tatooine jawa boss screenplay and pointed at
	-- the wrong planet's terrain; these use the same relative offsets applied
	-- around the actual Corellia boss position instead).
	pNpc = spawnMobile("corellia", "custom_nerf_herd", 1800, 6512, 20, -2838, 15, 0)
	pNpc = spawnMobile("corellia", "custom_nerf_herd", 1800, 6479, 20, -2872, 15, 0)
	pNpc = spawnMobile("corellia", "custom_nerf_herd", 1800, 6407, 20, -2883, 15, 0)
	pNpc = spawnMobile("corellia", "custom_nerf_herd", 1800, 6455, 20, -2807, 15, 0)
end

