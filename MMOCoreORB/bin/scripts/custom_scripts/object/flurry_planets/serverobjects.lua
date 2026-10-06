-- Object templates for the ported Taanab / Mustafar creatures (client assets are already in the client archives).
object_intangible_pet_shared_nerf_hue = SharedIntangibleObjectTemplate:new {
	clientTemplateFileName = "object/intangible/pet/shared_nerf_hue.iff"
}

ObjectTemplates:addClientTemplate(object_intangible_pet_shared_nerf_hue, "object/intangible/pet/shared_nerf_hue.iff")

object_mobile_som_shared_sher_kar = SharedCreatureObjectTemplate:new {
	clientTemplateFileName = "object/mobile/som/shared_sher_kar.iff"
}

ObjectTemplates:addClientTemplate(object_mobile_som_shared_sher_kar, "object/mobile/som/shared_sher_kar.iff")

object_intangible_pet_nerf_hue = object_intangible_pet_shared_nerf_hue:new {

}

ObjectTemplates:addTemplate(object_intangible_pet_nerf_hue, "object/intangible/pet/nerf_hue.iff")

object_mobile_som_sher_kar = object_mobile_som_shared_sher_kar:new {

}

ObjectTemplates:addTemplate(object_mobile_som_sher_kar, "object/mobile/som/sher_kar.iff")
includeFile("../custom_scripts/object/flurry_planets/hoth_kashyyyk.lua")
includeFile("../custom_scripts/object/flurry_planets/kashyyyk_doors.lua")
