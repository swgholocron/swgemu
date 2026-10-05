/*
 * HalloweenMenuComponent.cpp
 *
 * Opening a Halloween Crate consumes it and grants one random Halloween item.
 */

#include "HalloweenMenuComponent.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/transaction/TransactionLog.h"
#include "server/zone/managers/loot/LootManager.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/Zone.h"
#include "server/zone/ZoneServer.h"

void HalloweenMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const {
	TangibleObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);

	if (sceneObject->isASubChildOf(player))
		menuResponse->addRadialMenuItem(20, 3, "Halloween Items");
}

int HalloweenMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const {
	if (selectedID != 20)
		return TangibleObjectMenuComponent::handleObjectMenuSelect(sceneObject, player, selectedID);

	if (!sceneObject->isTangibleObject() || !player->isPlayerCreature())
		return 0;

	if (!sceneObject->isASubChildOf(player))
		return 0;

	Zone* zone = player->getZone();

	if (zone == nullptr)
		return 0;

	ManagedReference<LootManager*> lootManager = zone->getZoneServer()->getLootManager();
	ManagedReference<SceneObject*> inventory = player->getSlottedObject("inventory");

	if (lootManager == nullptr || inventory == nullptr)
		return 0;

	TransactionLog trx(TrxCode::NPCLOOTCLAIM, player);

	if (lootManager->createLoot(trx, inventory, "halloween1", 300) > 0) {
		trx.commit(true);
	} else {
		trx.abort() << "createLoot halloween1 failed";
		return 0;
	}

	sceneObject->destroyObjectFromWorld(true);
	sceneObject->destroyObjectFromDatabase(true);

	return 0;
}
