/*
 * WeaponAttachmentMenuComponent.h
 *
 * Radial menu on weapon attachments: "Attach to Equipped Weapon".
 */

#ifndef WEAPONATTACHMENTMENUCOMPONENT_H_
#define WEAPONATTACHMENTMENUCOMPONENT_H_

#include "TangibleObjectMenuComponent.h"

class WeaponAttachmentMenuComponent : public TangibleObjectMenuComponent {
public:
	virtual int handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const;

	virtual void fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const;
};

#endif /* WEAPONATTACHMENTMENUCOMPONENT_H_ */
