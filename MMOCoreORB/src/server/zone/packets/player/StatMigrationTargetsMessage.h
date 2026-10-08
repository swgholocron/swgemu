/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef STATMIGRATIONTARGETSMESSAGE_H_
#define STATMIGRATIONTARGETSMESSAGE_H_

#include "engine/service/proto/BaseMessage.h"

class StatMigrationTargetsMessage : public BaseMessage {
public:
	StatMigrationTargetsMessage(CreatureObject* creo) : BaseMessage() {
		insertShort(0x09);
		insertInt(0xEFAC38C4);  // CRC

		const DeltaVector<int>* baseHam = creo->getBaseHAM();

		for (int i = 0; i < 9; ++i) {
			insertInt(baseHam->get(i));
		}

		insertInt(0); // Points Remaining

		setCompression(true);
	}

	StatMigrationTargetsMessage(CreatureObject* creo, MigrateStatsSession* stats) {
		insertShort(0x09);
		insertInt(0xEFAC38C4);  // CRC

		// The pool to spend is the species total (staff holding more keep their current total).
		int totalLimit = PlayerCreationManager::instance()->getTotalAttributeLimit(creo->getSpeciesName());
		int currentTotal = 0;

		for (int i = 0; i < 9; ++i)
			currentTotal += creo->getBaseHAM(i);

		if (currentTotal > totalLimit)
			totalLimit = currentTotal;

		for (int i = 0; i < 9; ++i) {
			int val = stats->getAttribtueToModify(i);

			totalLimit -= val;

			insertInt(val);
		}

		insertInt(totalLimit);

		setCompression(true);
	}

};

#endif /*STATMIGRATIONTARGETSMESSAGE_H_*/
