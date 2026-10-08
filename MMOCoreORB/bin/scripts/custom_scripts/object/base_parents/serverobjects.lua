-- Parent (base) templates that ported content derives from.
--
-- When a shared template is loaded the server walks its DERV chain and, for every parent, also looks for that
-- parent's server-side Lua template (TemplateManager::getLuaObject). If it is neither already registered nor a
-- file at scripts/<path>.lua it logs "could not open lua derv". These parents have no server-side fields of their
-- own, so registering empty templates simply satisfies the lookup.
--
-- Included first in custom_scripts/object/serverobjects.lua so the parents exist before their children load.

-- Creature skeleton parents used by the ported Hoth / Kashyyyk / Mustafar creatures
object_mobile_skeleton_shared_varactyl = SharedCreatureObjectTemplate:new {
	clientTemplateFileName = "object/mobile/skeleton/shared_varactyl.iff"
}

ObjectTemplates:addClientTemplate(object_mobile_skeleton_shared_varactyl, "object/mobile/skeleton/shared_varactyl.iff")

object_mobile_skeleton_shared_sher_kar = SharedCreatureObjectTemplate:new {
	clientTemplateFileName = "object/mobile/skeleton/shared_sher_kar.iff"
}

ObjectTemplates:addClientTemplate(object_mobile_skeleton_shared_sher_kar, "object/mobile/skeleton/shared_sher_kar.iff")

object_mobile_skeleton_varactyl = object_mobile_skeleton_shared_varactyl:new {

}

ObjectTemplates:addTemplate(object_mobile_skeleton_varactyl, "object/mobile/skeleton/varactyl.iff")

object_mobile_skeleton_sher_kar = object_mobile_skeleton_shared_sher_kar:new {

}

ObjectTemplates:addTemplate(object_mobile_skeleton_sher_kar, "object/mobile/skeleton/sher_kar.iff")

-- Jedi cloak parent used by the cultist hoods
object_tangible_wearables_base_shared_base_jedicloak = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/wearables/base/shared_base_jedicloak.iff"
}

ObjectTemplates:addClientTemplate(object_tangible_wearables_base_shared_base_jedicloak, "object/tangible/wearables/base/shared_base_jedicloak.iff")

object_tangible_wearables_base_base_jedicloak = object_tangible_wearables_base_shared_base_jedicloak:new {

}

ObjectTemplates:addTemplate(object_tangible_wearables_base_base_jedicloak, "object/tangible/wearables/base/base_jedicloak.iff")

-- Loot and vehicle-component bases (the stock shared vehicles and the ported crates / loot items derive from these)
object_tangible_loot_base_shared_loot_base = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/loot/base/shared_loot_base.iff"
}

ObjectTemplates:addClientTemplate(object_tangible_loot_base_shared_loot_base, "object/tangible/loot/base/shared_loot_base.iff")

object_tangible_loot_base_loot_base = object_tangible_loot_base_shared_loot_base:new {

}

ObjectTemplates:addTemplate(object_tangible_loot_base_loot_base, "object/tangible/loot/base/loot_base.iff")

object_tangible_component_vehicle_base_shared_base_vehicle = SharedTangibleObjectTemplate:new {
	clientTemplateFileName = "object/tangible/component/vehicle/base/shared_base_vehicle.iff"
}

ObjectTemplates:addClientTemplate(object_tangible_component_vehicle_base_shared_base_vehicle, "object/tangible/component/vehicle/base/shared_base_vehicle.iff")

object_tangible_component_vehicle_base_base_vehicle = object_tangible_component_vehicle_base_shared_base_vehicle:new {

}

ObjectTemplates:addTemplate(object_tangible_component_vehicle_base_base_vehicle, "object/tangible/component/vehicle/base/base_vehicle.iff")
