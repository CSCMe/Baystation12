/datum/map/FTL
	name = "FTL"
	full_name = "Faster Than Light"
	path = "overmap_example"

	station_name  = "FTV Bearcat"
	station_short = "Bearcat"

	dock_name     = "STNDRD"
	boss_name     = "NTHQ"
	boss_short    = "NT"
	overmap_event_areas = 11

	default_law_type = /datum/ai_laws/corporate


	lobby_screens = list("torch.ec.scg")

	evac_controller_type = /datum/evacuation_controller/starship

	allowed_spawns = list("Cryogenic Storage")
	default_spawn = "Cryogenic Storage"
	use_overmap = 1
	num_exoplanets = 1
	away_site_budget = 4
	welcome_sound = 'sound/effects/cowboysting.ogg'

	department_money = 0
	salary_modifier = 0.4

/datum/map/bearcat/get_map_info()
	return "You're aboard the <b>[station_name]</b>."

//I'll do all this later, ocne I figure it out