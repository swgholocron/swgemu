-- Collection / boss crates (silver, gold, platinum, diamond, world boss).
-- Flurry implements these as compiled menu components; here they are Lua menu components so no rebuild is needed.
-- Each crate rolls its loot groups into the opener's inventory and is then consumed.

local function openCrate(pCrate, pPlayer, rolls)
	if (pCrate == nil or pPlayer == nil) then
		return 0
	end

	if (not SceneObject(pCrate):isASubChildOf(pPlayer)) then
		CreatureObject(pPlayer):sendSystemMessage("The crate must be in your inventory to open it.")
		return 0
	end

	local pInventory = SceneObject(pPlayer):getSlottedObject("inventory")

	if (pInventory == nil) then
		return 0
	end

	if (SceneObject(pInventory):isContainerFullRecursive()) then
		CreatureObject(pPlayer):sendSystemMessage("Your inventory is full. Make some room and try again.")
		return 0
	end

	for i = 1, #rolls, 1 do
		createLoot(pInventory, rolls[i][1], rolls[i][2], false)
	end

	SceneObject(pCrate):destroyObjectFromWorld()
	SceneObject(pCrate):destroyObjectFromDatabase()
	return 0
end

local function repeatRoll(group, level, count)
	local rolls = {}

	for i = 1, count, 1 do
		rolls[i] = { group, level }
	end

	return rolls
end

local function join(...)
	local out = {}

	for _, list in ipairs({ ... }) do
		for _, roll in ipairs(list) do
			out[#out + 1] = roll
		end
	end

	return out
end

CollectionsilverMenuComponent = { }

function CollectionsilverMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	LuaObjectMenuResponse(pMenuResponse):addRadialMenuItem(20, 3, "Open Silver Crate")
end

function CollectionsilverMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (selectedID ~= 20) then
		return 0
	end

	return openCrate(pSceneObject, pPlayer, repeatRoll("lootcollectiontierone", 100, 2))
end

CollectiongoldMenuComponent = { }

function CollectiongoldMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	LuaObjectMenuResponse(pMenuResponse):addRadialMenuItem(20, 3, "Open Gold Crate")
end

function CollectiongoldMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (selectedID ~= 20) then
		return 0
	end

	return openCrate(pSceneObject, pPlayer, repeatRoll("lootcollectiontiertwo", 200, 3))
end

CollectionplatinumMenuComponent = { }

function CollectionplatinumMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	LuaObjectMenuResponse(pMenuResponse):addRadialMenuItem(20, 3, "Open Platinum Crate")
end

function CollectionplatinumMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (selectedID ~= 20) then
		return 0
	end

	return openCrate(pSceneObject, pPlayer, repeatRoll("lootcollectiontierthree", 300, 4))
end

DiamondMenuComponent = { }

function DiamondMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	LuaObjectMenuResponse(pMenuResponse):addRadialMenuItem(20, 3, "Open Diamond Crate")
end

function DiamondMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (selectedID ~= 20) then
		return 0
	end

	local result = openCrate(pSceneObject, pPlayer, join(repeatRoll("lootcollectiontierdiamond", 300, 5), { { "armor_attachments", 300 }, { "clothing_attachments", 300 } }))
	CreatureObject(pPlayer):playEffect("clienteffect/level_granted.cef", "")
	return result
end

WorldMenuComponent = { }

function WorldMenuComponent:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
	LuaObjectMenuResponse(pMenuResponse):addRadialMenuItem(20, 3, "Open World Boss Crate")
end

function WorldMenuComponent:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
	if (selectedID ~= 20) then
		return 0
	end

	local result = openCrate(pSceneObject, pPlayer, join(repeatRoll("lootcollectiontierdiamond", 300, 6), {
		{ "clothing_attachments", 300 }, { "armor_attachments", 300 }, { "power_crystals", 300 },
		{ "tiertwo", 300 }, { "tierthree", 300 }, { "tierone", 300 }, { "tierdiamond", 300 }
	}))
	CreatureObject(pPlayer):playEffect("clienteffect/level_granted.cef", "")
	return result
end

-- Faction point rewards (the imppoints / rebpoints loot groups)
local function factionPoints(faction, label)
	local component = { }

	function component:fillObjectMenuResponse(pSceneObject, pMenuResponse, pPlayer)
		LuaObjectMenuResponse(pMenuResponse):addRadialMenuItem(20, 3, "Increase " .. label .. " Faction")
	end

	function component:handleObjectMenuSelect(pSceneObject, pPlayer, selectedID)
		if (selectedID ~= 20 or pPlayer == nil) then
			return 0
		end

		if (not SceneObject(pSceneObject):isASubChildOf(pPlayer)) then
			return 0
		end

		local pGhost = CreatureObject(pPlayer):getPlayerObject()

		if (pGhost == nil) then
			return 0
		end

		PlayerObject(pGhost):increaseFactionStanding(faction, 500)
		SceneObject(pSceneObject):destroyObjectFromWorld()
		SceneObject(pSceneObject):destroyObjectFromDatabase()
		return 0
	end

	return component
end

ImperialMenuComponent = factionPoints("imperial", "Imperial")
RebelMenuComponent = factionPoints("rebel", "Rebel")
