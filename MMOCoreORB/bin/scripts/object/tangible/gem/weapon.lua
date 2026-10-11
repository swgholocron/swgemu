-- Weapon attachment (server-defined). Own client template (shared_weapon.iff: armor attachment copy with the power bit model), with its own
-- object type so it can only be fitted to weapons. Fitted by dropping it on a weapon (GiveItemCommand / TransferItemMiscCommand) or from its radial menu (WeaponAttachmentMenuComponent).

object_tangible_gem_weapon = object_tangible_gem_shared_weapon:new {
	gameObjectType = 8259, -- SceneObjectType::WEAPONATTACHMENT (0x2043)
	clientGameObjectType = 8221,
	objectMenuComponent = "WeaponAttachmentMenuComponent"
}

ObjectTemplates:addTemplate(object_tangible_gem_weapon, "object/tangible/gem/weapon.iff")
