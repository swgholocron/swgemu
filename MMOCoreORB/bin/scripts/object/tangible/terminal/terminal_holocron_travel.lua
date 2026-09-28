object_tangible_terminal_terminal_holocron_travel = object_tangible_terminal_shared_terminal_character_builder:new {
	gameObjectType = 16400,

	maxCondition = 0,

	customName = "Holocron Travel Service",

	templateType = CHARACTERBUILDERTERMINAL,

	itemList = {
		"Coruscant",
		{
			"Imperial City Starport (5,000 Credits)", "coruscant_imperial_city_travel",
		},
		"Hoth",
		{
			"Hoth Starport (5,000 Credits)", "hoth_starport_travel",
		},
		"Kashyyyk",
		{
			"Kachirho Starport (5,000 Credits)", "kashyyyk_kachirho_travel",
		},
		"Nal Hutta",
		{
			"Hutt City Starport (5,000 Credits)", "nalhutta_huttcity_travel",
		},
		"Taanab",
		{
			"Starhunter Station (5,000 Credits)", "taanab_starhunter_travel",
		},
	}
}
ObjectTemplates:addTemplate(object_tangible_terminal_terminal_holocron_travel, "object/tangible/terminal/terminal_holocron_travel.iff")
