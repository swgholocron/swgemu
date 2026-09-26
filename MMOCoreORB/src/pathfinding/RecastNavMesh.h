/*
 * RecastNavMesh.h
 *
 *  Created on: April 29, 2016
 *      Author: gslomin
 */

#ifndef RECASTNAVMESH_H_
#define RECASTNAVMESH_H_

#include "engine/engine.h"
#include "pathfinding/RecastTileBuilder.h"

class dtNavMesh;

class RecastNavMesh : public Object, public Logger {
	void loadAll(ObjectInputStream* stream);
	void saveAll(ObjectOutputStream* stream);

	dtNavMesh *navMesh;
	NavMeshSetHeader header;
	String name;

	// Set when loadAll() encountered a corrupt/truncated tile and had to skip
	// it. The mesh is then missing geometry it should have, so callers must
	// treat it as not usable and rebuild it rather than pathfinding on it.
	bool tilesFailedToLoad;

public:
	RecastNavMesh() : Logger("RecastNavMesh"), header() {
		navMesh = nullptr;
		tilesFailedToLoad = false;
	}

	~RecastNavMesh() {
		dtFreeNavMesh(navMesh);
	}

	bool toBinaryStream(ObjectOutputStream* stream);

	bool parseFromBinaryStream(ObjectInputStream* stream);

	bool isLoaded() const {
		return navMesh != nullptr && !tilesFailedToLoad;
	}

	const NavMeshSetHeader& getMeshHeader() {
		return header;
	}

	dtNavMesh* getNavMesh() {
		return navMesh;
	}

	void setDetourNavMeshHeader(const NavMeshSetHeader& header) {
		this->header = header;
	}

	void setDetourNavMesh(dtNavMesh* navMesh) {
		this->navMesh = navMesh;
		tilesFailedToLoad = false;
	}

	void setName(const String& name) {
		this->name = name;
		Logger::setLoggingName("RecastNavMesh " + name);
	}

	void setupDetourNavMeshHeader();

	void copyMeshTo(dtNavMesh* mesh);

	void saveToFile();
};
#endif /* RECASTNAVMESH_H_ */
