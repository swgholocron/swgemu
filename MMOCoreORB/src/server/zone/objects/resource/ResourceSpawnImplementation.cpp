/*
 				Copyright <SWGEmu>
		See file COPYING for copying conditions. */

#include "server/zone/objects/resource/ResourceSpawn.h"
#include "server/zone/Zone.h"
#include "server/zone/objects/resource/ResourceContainer.h"
#include "server/zone/managers/crafting/CraftingManager.h"

#include "server/zone/objects/player/sui/listbox/SuiListBox.h"

void ResourceSpawnImplementation::fillAttributeList(AttributeListMessage* alm,
		CreatureObject* object) {

		alm->insertAttribute("resource_class", getFinalClass());

		for (int i = 0; i < spawnAttributes.size(); ++i) {
			String attrib;
			int value = getAttributeAndValue(attrib, i);
			alm->insertAttribute(attrib, value);
		}
}

bool ResourceSpawnImplementation::inShift() const {
	return despawned > time(0);
}

void ResourceSpawnImplementation::addAttribute(const String& attribute, int value) {
	spawnAttributes.put(attribute, value);
}

// A resource class tag should always be a short stf-style key. Anything this
// long is a bug (accidental accumulation, memory corruption, etc.) rather
// than legitimate content -- refuse it here instead of persisting a value
// that would later abort the whole server when it's saved to the database.
static const int MAX_RESOURCE_CLASS_LENGTH = 256;

void ResourceSpawnImplementation::addClass(const String& newclass) {
	if (newclass.length() > MAX_RESOURCE_CLASS_LENGTH) {
		error("addClass() given an oversized string (" + String::valueOf(newclass.length()) + " chars) -- refusing to store it, resource may be misconfigured");
		return;
	}

	spawnClasses.add(newclass);
}

void ResourceSpawnImplementation::addStfClass(const String& newclass) {
	if (newclass.length() > MAX_RESOURCE_CLASS_LENGTH) {
		error("addStfClass() given an oversized string (" + String::valueOf(newclass.length()) + " chars) -- refusing to store it, resource may be misconfigured");
		return;
	}

	stfSpawnClasses.add(newclass);
}

// A String keeps its length in a leading int and short strings inline in the object. A stored resource has been
// seen with a stray high bit in that length (0x4000B for "res_quality"), which makes any copy of it run off the end
// of the buffer and abort the server at startup. If a length is implausible but the inline text is a short,
// printable, terminated string, put the real length back. The layout is taken from a probe string at run time, and
// nothing is touched if it doesn't match what we expect.
static bool repairStringLength(const String& str) {
	int len = str.length();

	if (len >= 0 && len <= MAX_RESOURCE_CLASS_LENGTH)
		return false;

	static const String probe("x");
	static const ptrdiff_t inlineOffset = probe.toCharArray() - (const char*) &probe;

	if (inlineOffset <= 0 || inlineOffset > 16 || *((const int*) &probe) != 1)
		return false;

	const char* raw = ((const char*) &str) + inlineOffset;
	int real = -1;

	for (int i = 0; i < 16; ++i) {
		if (raw[i] == '\0') {
			real = i;
			break;
		}

		if (raw[i] < 32 || raw[i] > 126)
			return false;
	}

	if (real <= 0)
		return false;

	*((int*) &str) = real;

	return true;
}

int ResourceSpawnImplementation::repairCorruptedStrings() {
	int repaired = 0;

	for (int i = 0; i < spawnAttributes.size(); ++i) {
		if (repairStringLength(spawnAttributes.elementAt(i).getKey()))
			++repaired;
	}

	for (int i = 0; i < spawnClasses.size(); ++i) {
		if (repairStringLength(spawnClasses.get(i)))
			++repaired;
	}

	for (int i = 0; i < stfSpawnClasses.size(); ++i) {
		if (repairStringLength(stfSpawnClasses.get(i)))
			++repaired;
	}

	if (repairStringLength(spawnType))
		++repaired;

	if (repairStringLength(spawnName))
		++repaired;

	if (repairStringLength(poolSlot))
		++repaired;

	if (repairStringLength(zoneRestriction))
		++repaired;

	return repaired;
}

int ResourceSpawnImplementation::getAttributeAndValue(String& attribute,
		int index) const {

	if (index < spawnAttributes.size()) {
		attribute = spawnAttributes.elementAt(index).getKey();
		return spawnAttributes.get(index);
	} else {
		return 0;
	}
}

int ResourceSpawnImplementation::getValueOf(int stat) const {

	String attribute = "";

	switch(stat) {
	case CraftingManager::CR:
		attribute = "res_cold_resist";
		break;
	case CraftingManager::CD:
		attribute = "res_conductivity";
		break;
	case CraftingManager::DR:
		attribute = "res_decay_resist";
		break;
	case CraftingManager::HR:
		attribute = "res_heat_resist";
		break;
	case CraftingManager::FL:
		attribute = "res_flavor";
		break;
	case CraftingManager::MA:
		attribute = "res_malleability";
		break;
	case CraftingManager::PE:
		attribute = "res_potential_energy";
		break;
	case CraftingManager::OQ:
		attribute = "res_quality";
		break;
	case CraftingManager::SR:
		attribute = "res_shock_resistance";
		break;
	case CraftingManager::UT:
		attribute = "res_toughness";
		break;
	default:
		return 0;
		break;
	}

	return getValueOf(attribute);
}

int ResourceSpawnImplementation::getValueOf(const String& attribute) const {
	if(spawnAttributes.contains(attribute))
		return spawnAttributes.get(attribute);

	return 0;
}

bool ResourceSpawnImplementation::isUnknownType() const {
	for (int i = 0; i < stfSpawnClasses.size(); ++i) {
		if (stfSpawnClasses.get(i).indexOf("unknown") != -1)
			return true;
	}
	return false;
}

String ResourceSpawnImplementation::getFamilyName() const {
   	int offset = 2;

   	if(isUnknownType())
   		offset = 1;

   	if(spawnClasses.size() > offset)
   		return spawnClasses.get(spawnClasses.size() - offset);
   	else
   		return "";
}

String ResourceSpawnImplementation::getSurveyMissionSpawnFamilyName() const {
   	int offset = 3;

   	if(isUnknownType() || isType("chemical"))
   		offset = 2;

   	if(spawnClasses.size() > offset)
   		return spawnClasses.get(spawnClasses.size() - offset);
   	else
   		return "";
}

void ResourceSpawnImplementation::createSpawnMaps(bool jtl, int minpool, int maxpool,
		const String& zonerestriction, Vector<String>& activeZones) {

	int concentration = getConcentration(jtl);
	Vector<String> zonenames = getSpawnZones(minpool, maxpool, zonerestriction, activeZones);

	for (int i = 0; i < zonenames.size(); ++i) {

		Zone* zone = server->getZoneServer()->getZone(zonenames.get(i));
		if (zone == nullptr)
			continue;

		SpawnDensityMap newMap(isType("ore"), concentration, zone->getMinX(),
				zone->getMaxX(), zone->getMinY(), zone->getMaxY());

		spawnMaps.put(zonenames.get(i), newMap);
	}
}

int ResourceSpawnImplementation::getConcentration(bool jtl) const {
	/**
	 * Here we are using defined rules to set the max
	 * density of this specific spawn
	 */

	if (jtl || isType("chemical") || isType("gas_inert"))
		return SpawnDensityMap::HIGHDENSITY;

	else if (isType("ore") || isType("water") || isType("energy_renewable_unlimited_solar") || isType("energy_renewable_unlimited_wind"))
		return SpawnDensityMap::LOWDENSITY;

	else
		return SpawnDensityMap::MEDIUMDENSITY;
}

Vector<String> ResourceSpawnImplementation::getSpawnZones(int minpool, int maxpool,
		const String& zonerestriction, Vector<String>& activeZones) const {
	/**
	 * Here we are using defined rules to set the number
	 * of zones and specific zones of this specific spawn
	 */
	Vector<String> zonenames;
	int zonecount = 0;

	if (minpool == maxpool)
		zonecount = maxpool;
	else
		zonecount = System::random(maxpool - minpool) + minpool;

	if (zonecount > activeZones.size())
		zonecount = activeZones.size();

	/// If resource is zone restricted, add only the restricted zone
	if (zonerestriction != "") {
		zonenames.add(zonerestriction);
		return zonenames;
	}

	/// Randomly remove entries until the Vector contains
	/// a number of elements equal to zonecount
	while (activeZones.size() > zonecount)
		activeZones.remove(System::random(activeZones.size() - 1));

	return activeZones;
}

float ResourceSpawnImplementation::getDensityAt(const String& zoneName, float x, float y) const {
	if (!spawnMaps.contains(zoneName))
		return 0;

	if (!inShift())
		return 0;

	const SpawnDensityMap map = spawnMaps.get(zoneName);

	return map.getDensityAt(x, y);
}

String ResourceSpawnImplementation::getSpawnMapZone(int i) const {
	if (spawnMaps.size() > i)
		return spawnMaps.getKey(i);
	else
		return "";
}

uint32 ResourceSpawnImplementation::getPlanetCRC() const {
	String zoneName = getSpawnMapZone(0);

	if (zoneName == "")
		return 0;

	Zone* zone = server->getZoneServer()->getZone(zoneName);

	return zone->getZoneCRC();
}

void ResourceSpawnImplementation::extractResource(const String& zoneName, int units) {
	unitsInCirculation += units;

}

Reference<ResourceContainer*> ResourceSpawnImplementation::createResource(int units) {
   	Reference<ResourceContainer*> newResource = nullptr;

   	newResource = (getZoneServer()->createObject(containerCRC, 2)).castTo<ResourceContainer*>();

   	if(newResource == nullptr) {
   		error("Unable to create resource container, using generic.  CRC attempted was: " + String::valueOf(containerCRC));
   		print();
   		String genericContainer = "object/resource_container/organic_food.iff";
   		newResource = (getZoneServer()->createObject(genericContainer.hashCode(), 2)).castTo<ResourceContainer*>();
   	}

   	Locker locker(newResource);

   	newResource->setSpawnObject(_this.getReferenceUnsafeStaticCast());

   	if (units != 0)
   		newResource->setQuantity(units);

   	newResource->setCustomObjectName(spawnName, false);

   	++containerReferenceCount;

   	return newResource;
}

void ResourceSpawnImplementation::decreaseContainerReferenceCount() {
	/*if (--containerReferenceCount < 1 && !inShift()) {
		destroyObjectFromDatabase(true);

		dbDestroyed = true;
	}*/
}
void ResourceSpawnImplementation::addStatsToDeedListBox(SuiListBox* suil) {
	suil->setPromptTitle("@veteran:resource_name"); //Resource Name
	suil->setPromptText("@veteran:confirm_choose_type"); //Please confirm that you would like to select this resource as your Veteran Reward Crate of Resources. Use the CANCEL button to go back and select a different resource.

	String tempname = "Name = " + spawnName;
	suil->addMenuItem(tempname);

	for (int i = 0; i < spawnAttributes.size(); ++i) {
		String attrib;
		int value = getAttributeAndValue(attrib, i);

		String tempstat = "@obj_attr_n:" + attrib + " = " + value;
		suil->addMenuItem(tempstat);
	}
}

void ResourceSpawnImplementation::print() const {
	info("**** Resource Data ****\n", true);
	info("Class: " + getFinalClass(), true);
	info("Name: " + spawnName, true);
	info("--------Classes--------", true);
	for (int i = 0; i < spawnClasses.size(); ++i)
		info(spawnClasses.get(i) + "(" + stfSpawnClasses.get(i) + ")", true);
	info("------Attributes-------", true);

	for (int i = 0; i < spawnAttributes.size(); ++i) {
		String attrib;
		int value = getAttributeAndValue(attrib, i);
		info(attrib + " " + value, true);
	}

	for (int i = 0; i < spawnMaps.size(); ++i) {
		info(spawnMaps.getKey(i));
		spawnMaps.get(i).print();
	}

	info("***********************", true);
}
