/datum/map/FTL
	name = "FTL"
	full_name = "Faster Than Light"
	path = "FTL"

	station_name  = "FTL"
	station_short = "FTL"

	dock_name     = "STNDRD"
	boss_name     = "Corporate"
	boss_short    = "CorpHQ"
	overmap_event_areas = 11

	default_law_type = /datum/ai_laws/corporate


	lobby_screens = list("torch.ec.scg")

	evac_controller_type = /datum/evacuation_controller/starship

	use_overmap = 1
	num_exoplanets = 1
	away_site_budget = 3
	welcome_sound = 'sound/effects/cowboysting.ogg'

	department_money = 0
	salary_modifier = 0.6

/datum/map/FTL/get_map_info()
	return "You're one of many contractors hired by corporations to scout and secure sectors they find appealing. You do not know your employer, but you do know that the more information you manage to gather, the higher the payday."