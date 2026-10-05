/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef STOPCLIENTEFFECTOBJECTBYLABELMESSAGE_H_
#define STOPCLIENTEFFECTOBJECTBYLABELMESSAGE_H_

#include "engine/service/proto/BaseMessage.h"

#include "server/zone/objects/scene/SceneObject.h"

// Cancels a client effect that was started with a labelled PlayClientEffectObjectMessage.
class StopClientEffectObjectByLabelMessage : public BaseMessage {
public:
	StopClientEffectObjectByLabelMessage(SceneObject* obj, const String& label, bool softTerminate = false) : BaseMessage() {
		insertShort(0x04);
		insertInt(0xAD6F6B26);  // CRC of StopClientEffectObjectByLabelMessage
		insertLong(obj->getObjectID());
		insertAscii(label.toCharArray());
		insertByte(softTerminate ? 1 : 0);
	}

};

#endif /*STOPCLIENTEFFECTOBJECTBYLABELMESSAGE_H_*/
