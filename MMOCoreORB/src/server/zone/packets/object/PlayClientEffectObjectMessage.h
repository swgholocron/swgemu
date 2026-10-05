/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef PLAYCLIENTEFFECTOBJECTMESSAGE_H_
#define PLAYCLIENTEFFECTOBJECTMESSAGE_H_

#include "engine/service/proto/BaseMessage.h"

#include "server/zone/objects/scene/SceneObject.h"

class PlayClientEffectObjectMessage : public BaseMessage {
public:
	PlayClientEffectObjectMessage(SceneObject* obj, const String& file, const String& aux) : BaseMessage() {
		insertShort(0x05);
		insertInt(0x8855434A);  // CRC
		insertAscii(file.toCharArray());
		insertAscii(aux.toCharArray());
		insertLong(obj->getObjectID());
	}

	// Labelled variant, so the effect can later be cancelled with StopClientEffectObjectByLabelMessage.
	PlayClientEffectObjectMessage(SceneObject* obj, const String& file, const String& aux, const String& label) : BaseMessage() {
		insertShort(0x05);
		insertInt(0x8855434A);  // CRC
		insertAscii(file.toCharArray());
		insertAscii(aux.toCharArray());
		insertLong(obj->getObjectID());
		insertAscii(label.toCharArray());
	}

};

#endif /*PLAYCLIENTEFFECTOBJECTMESSAGE_H_*/
