/*
 * HalloweenMenuComponent.h
 *
 * Radial menu for the Halloween Crate dropped by the Halloween event skeletons.
 */

#ifndef HALLOWEENMENUCOMPONENT_H_
#define HALLOWEENMENUCOMPONENT_H_

#include "../TangibleObjectMenuComponent.h"

class HalloweenMenuComponent : public TangibleObjectMenuComponent {
public:
	virtual void fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const;

	virtual int handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const;
};

#endif /* HALLOWEENMENUCOMPONENT_H_ */
