/*
 * WeaponAttachmentMenuComponent.cpp
 */

#include "WeaponAttachmentMenuComponent.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/tangible/attachment/Attachment.h"
#include "server/zone/objects/tangible/weapon/WeaponObject.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"

void WeaponAttachmentMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const {
	TangibleObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);

	if (sceneObject->isASubChildOf(player))
		menuResponse->addRadialMenuItem(20, 3, "Attach to Equipped Weapon");
}

int WeaponAttachmentMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const {
	if (selectedID != 20)
		return TangibleObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);

	if (player == nullptr || !sceneObject->isASubChildOf(player))
		return 0;

	Attachment* attachment = dynamic_cast<Attachment*>(sceneObject);

	if (attachment == nullptr || !attachment->isWeaponAttachment())
		return 0;

	ManagedReference<WeaponObject*> weapon = player->getWeapon();

	// getWeapon() falls back to the unarmed default weapon, which has no sockets.
	if (weapon == nullptr || weapon->getRemainingSockets() < 1) {
		player->sendSystemMessage("Equip a weapon that has a free attachment socket, then use the attachment.");
		return 0;
	}

	Locker wlock(weapon, player);

	weapon->applyAttachment(player, attachment);

	player->sendSystemMessage("The attachment has been fitted to your weapon.");

	return 0;
}
