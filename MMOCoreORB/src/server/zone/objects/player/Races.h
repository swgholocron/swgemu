/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef RACES_H_
#define RACES_H_

#include "system/lang.h"

const static char* Species[] = {
    "human", // human male
    "trandoshan", // trandoshan male
    "twilek", // twilek male
    "bothan", // bothan male
    "zabrak", // zabrak male
    "rodian", // rodian male
    "moncal", // moncal male
    "wookiee", // wookiee male
    "sullustan", // sullustan male
    "ithorian", // ithorian male
    "human", // human female
    "trandoshan", // trandoshan female
    "twilek", // twilek female
    "bothan", // bothan female
    "zabrak", // zabrak female
    "rodian", // rodian female
    "moncal", // moncal female
    "wookiee", // wookiee female
    "sullustan", // sullustan female
    "ithorian", // DA E7   -   ithorian female
    // --- Extra playable species (male) ---
    "hutt", // hutt male
    "nautolan", // nautolan male
    "chiss", // chiss male
    "devaronian", // devaronian male
    "gran", // gran male
    "ishi_tib", // ishi tib male
    "nikto", // nikto male
    "quarren", // quarren male
    "weequay", // weequay male
    "aqualish", // aqualish male
    "bith", // bith male
    "gotal", // gotal male
    "talz", // talz male
    // --- Extra playable species (female) ---
    "hutt", // hutt female
    "togruta", // togruta female
    "chiss", // chiss female
    "nightsister", // nightsister female
    "smc", // singing mountain clan witch female
    "aqualish", // aqualish female
    "bith" // bith female
};

const static int TemplateSpecies[] = {
		0,
		2,
		6,
		5,
		7,
		1,
		3,
		4,
		0x31,
		0x21,
		0,
		2,
		6,
		5,
		7,
		1,
		3,
		4,
		0x31,
		0x21,
		// --- Extra playable species (male) ---
		0x1f, // hutt
		0x2c, // nautolan
		0x34, // chiss
		0x35, // devaronian
		0x36, // gran
		0x37, // ishi tib
		0x39, // nikto
		0x3a, // quarren
		0x3c, // weequay
		0, // aqualish (reuses human skeleton)
		0, // bith (reuses human skeleton)
		0, // gotal (reuses human skeleton)
		0, // talz (reuses human skeleton)
		// --- Extra playable species (female) ---
		0x1f, // hutt
		0x2d, // togruta
		0x34, // chiss
		0x38, // nightsister
		0x3b, // smc
		0, // aqualish (reuses human skeleton)
		0 // bith (reuses human skeleton)
};

const static char* Gender[] = {
    "male", // human male
    "male", // trandoshan male
    "male", // twilek male
    "male", // bothan male
    "male", // zabrak male
    "male", // rodian male
    "male", // moncal male
    "male", // wookiee male
    "male", // sullustan male
    "male", // ithorian male
    "female", // human female
    "female", // trandoshan female
    "female", // twilek female
    "female", // bothan female
    "female", // zabrak female
    "female", // rodian female
    "female", // moncal female
    "female", // wookiee female
    "female", // sullustan female
    "female", // DA E7   -   ithorian female
    // --- Extra playable species (male) ---
    "male", // hutt
    "male", // nautolan
    "male", // chiss
    "male", // devaronian
    "male", // gran
    "male", // ishi tib
    "male", // nikto
    "male", // quarren
    "male", // weequay
    "male", // aqualish
    "male", // bith
    "male", // gotal
    "male", // talz
    // --- Extra playable species (female) ---
    "female", // hutt
    "female", // togruta
    "female", // chiss
    "female", // nightsister
    "female", // smc
    "female", // aqualish
    "female" // bith
};

const static char* RaceStrs[] = {
    "object/creature/player/shared_human_male.iff", // human male
    "object/creature/player/shared_trandoshan_male.iff", // trandoshan male
    "object/creature/player/shared_twilek_male.iff", // twilek male
    "object/creature/player/shared_bothan_male.iff", // bothan male
    "object/creature/player/shared_zabrak_male.iff", // zabrak male
    "object/creature/player/shared_rodian_male.iff", // rodian male
    "object/creature/player/shared_moncal_male.iff", // moncal male
    "object/creature/player/shared_wookiee_male.iff", // wookiee male
    "object/creature/player/shared_sullustan_male.iff", // sullustan male
    "object/creature/player/shared_ithorian_male.iff", // ithorian male
    "object/creature/player/shared_human_female.iff", // human female
    "object/creature/player/shared_trandoshan_female.iff", // trandoshan female
    "object/creature/player/shared_twilek_female.iff", // twilek female
    "object/creature/player/shared_bothan_female.iff", // bothan female
    "object/creature/player/shared_zabrak_female.iff", // zabrak female
    "object/creature/player/shared_rodian_female.iff", // rodian female
    "object/creature/player/shared_moncal_female.iff", // moncal female
    "object/creature/player/shared_wookiee_female.iff", // wookiee female
    "object/creature/player/shared_sullustan_female.iff", // sullustan female
    "object/creature/player/shared_ithorian_female.iff", // DA E7   -   ithorian female
    // --- Extra playable species (male) ---
    "object/creature/player/shared_hutt_male.iff",
    "object/creature/player/shared_nautolan_male.iff",
    "object/creature/player/shared_chiss_male.iff",
    "object/creature/player/shared_devaronian_male.iff",
    "object/creature/player/shared_gran_male.iff",
    "object/creature/player/shared_ishi_tib_male.iff",
    "object/creature/player/shared_nikto_male.iff",
    "object/creature/player/shared_quarren_male.iff",
    "object/creature/player/shared_weequay_male.iff",
    "object/creature/player/shared_aqualish_male.iff",
    "object/creature/player/shared_bith_male.iff",
    "object/creature/player/shared_gotal_male.iff",
    "object/creature/player/shared_talz_male.iff",
    // --- Extra playable species (female) ---
    "object/creature/player/shared_hutt_female.iff",
    "object/creature/player/shared_togruta_female.iff",
    "object/creature/player/shared_chiss_female.iff",
    "object/creature/player/shared_nightsister_female.iff",
    "object/creature/player/shared_smc_female.iff",
    "object/creature/player/shared_aqualish_female.iff",
    "object/creature/player/shared_bith_female.iff"
};

const static char* CCRaceStrs[] = {
    "object/creature/player/human_male.iff", // human male
    "object/creature/player/trandoshan_male.iff", // trandoshan male
    "object/creature/player/twilek_male.iff", // twilek male
    "object/creature/player/bothan_male.iff", // bothan male
    "object/creature/player/zabrak_male.iff", // zabrak male
    "object/creature/player/rodian_male.iff", // rodian male
    "object/creature/player/moncal_male.iff", // moncal male
    "object/creature/player/wookiee_male.iff", // wookiee male
    "object/creature/player/sullustan_male.iff", // sullustan male
    "object/creature/player/ithorian_male.iff", // ithorian male
    "object/creature/player/human_female.iff", // human female
    "object/creature/player/trandoshan_female.iff", // trandoshan female
    "object/creature/player/twilek_female.iff", // twilek female
    "object/creature/player/bothan_female.iff", // bothan female
    "object/creature/player/zabrak_female.iff", // zabrak female
    "object/creature/player/rodian_female.iff", // rodian female
    "object/creature/player/moncal_female.iff", // moncal female
    "object/creature/player/wookiee_female.iff", // wookiee female
    "object/creature/player/sullustan_female.iff", // sullustan female
    "object/creature/player/ithorian_female.iff", // DA E7   -   ithorian female
    // --- Extra playable species (male) ---
    "object/creature/player/hutt_male.iff",
    "object/creature/player/nautolan_male.iff",
    "object/creature/player/chiss_male.iff",
    "object/creature/player/devaronian_male.iff",
    "object/creature/player/gran_male.iff",
    "object/creature/player/ishi_tib_male.iff",
    "object/creature/player/nikto_male.iff",
    "object/creature/player/quarren_male.iff",
    "object/creature/player/weequay_male.iff",
    "object/creature/player/aqualish_male.iff",
    "object/creature/player/bith_male.iff",
    "object/creature/player/gotal_male.iff",
    "object/creature/player/talz_male.iff",
    // --- Extra playable species (female) ---
    "object/creature/player/hutt_female.iff",
    "object/creature/player/togruta_female.iff",
    "object/creature/player/chiss_female.iff",
    "object/creature/player/nightsister_female.iff",
    "object/creature/player/smc_female.iff",
    "object/creature/player/aqualish_female.iff",
    "object/creature/player/bith_female.iff"
};

static uint32 SharedRace[] = {
    0xAF1DC1A1,
    0x50C45B8F,
    0xF280E27B,
    0x5BF77F33,
    0xE204A556,
    0x0BF9CD9C,
    0xB9C855A8,
    0x0564791D,
    0x0B9399A4,
    0x38BAC7C4,
    0xFFFFBBE9,
    0x183C24C6,
    0x849752DC,
    0x1D52730E,
    0xA9E35FFD,
    0xC264245B,
    0x982FBFDE,
    0x0DAB65E2,
    0x1573341A,
    0xB3E08013,
    // --- Extra playable species (male) ---
    0x916443F9, // hutt
    0xAB03ACB1, // nautolan
    0x02F60EAC, // chiss
    0x68731058, // devaronian
    0xC2872D34, // gran
    0x809EF398, // ishi tib
    0x59ECB38B, // nikto
    0x3435F686, // quarren
    0x4F0718B5, // weequay
    0xCEF4B4A1, // aqualish
    0x73C992FF, // bith
    0x30CFFED2, // gotal
    0xDBA89F7C, // talz
    // --- Extra playable species (female) ---
    0xE0B607C0, // hutt
    0x3D953B50, // togruta
    0x614A1B68, // chiss
    0xC56D9790, // nightsister
    0x82A138F9, // smc
    0xDE63F629, // aqualish
    0xB2C9CBE0 // bith
};

static unsigned int attributeLimits[10][19] = {
		{400, 1100,	400, 1100,  400, 1100, 400, 1100, 400, 1100, 400, 1100,	400, 1100, 400,	1100, 400, 1100, 5400},
		{550, 1250,	600,  800,	700,  800, 300,	1000, 300,  450, 300,  400,	300, 1000, 300,	 500, 300,	600, 5550},
		{300, 1000,	300,  500,	550,  650, 550,	1250, 600,	750, 300,  400,	400, 1100, 300,	 500, 300,	500, 5400},
		{300, 1000,	300,  500,	300,  400, 600,	1300, 600,	750, 400,  500,	400, 1100, 400,	 600, 300,	500, 5400},
		{500, 1200,	300,  500,	300,  400, 600,	1300, 300,	450, 300,  400,	300, 1000, 300,	 500, 700,	900, 5400},
		{300, 1000,	300,  500,	300,  400, 300,	1200, 300,	650, 450,  850,	300, 1000, 300,	 500, 350,	550, 5400},
		{300, 1000,	300,  500,	300,  400, 300,	1000, 300,	450, 450,  550,	600, 1300, 600,	 800, 450,	650, 5400},
		{650, 1350,	650,  850,	450,  550, 500,	1200, 400,	550, 400,  500,	400, 1100, 450,	 650, 400,	600, 6100},
		{300, 1200,	300,  500,	300,  400, 600,	1400, 300,	750, 300,  500,	400, 1200, 400,	 600, 300,	600, 5400},
		{300, 1400,	300,  600,	300,  500, 600,	1100, 300,	750, 300,  500,	400, 1300, 400,	 600, 300,	500, 5400}
};
// Extra playable species (raceid >= 20) have no dedicated balance row; getAttribLimits()
// wraps raceid % 10, reusing the closest base species' HAM limits as a placeholder.

class Races {
public:
	inline const static char* getRace(int raceid) {
		if (raceid < 0 || raceid > 39)
			return "";

		return RaceStrs[raceid];
	}

	inline static int getSpeciesID(int raceid) {
		if (raceid < 0 || raceid > 39)
			return 0;

		return TemplateSpecies[raceid];
	}

	inline const static char* getSpecies(int raceid) {
		if (raceid < 0 || raceid > 39)
			return "";

		return Species[raceid];
	}

	inline const static char* getGender(int raceid) {
		if (raceid < 0 || raceid > 39)
			return "";

		return Gender[raceid];
	}

	inline static uint32 getRaceCRC(int raceid) {
		if (raceid < 0 || raceid > 39)
			return 0;

		return SharedRace[raceid];
	}

	inline static const char* getCompleteRace(uint32 sharedRaceCRC) {
		int race = -1;
		for (int i = 0; i < 40; ++i) {
			if (SharedRace[i] == sharedRaceCRC) {
				race = i;
				break;
			}
		}

		if (race == -1)
			return "";
		else
			return CCRaceStrs[race];
	}

	inline static int getRaceID(const String& name) {
    	for (int i = 0; i < 40; i++) {
        	if (strcmp(name.toCharArray(), CCRaceStrs[i]) == 0)
            	return i;
    	}

    	return 0;
	}

	inline static unsigned int * getAttribLimits(int raceid) {
		return attributeLimits[raceid % 10];
	}

};

#endif /*RACES_H_*/
