/datum/map/bearcat
	name = "Bearcat"
	full_name = "Bearcat"
	path = "overmap_example"

	station_name  = "FTV Bearcat"
	station_short = "Bearcat"

	dock_name     = "FTS Capitalist's Rest"
	boss_name     = "FTU Merchant Navy"
	boss_short    = "Merchant Admiral"
	company_name  = "Legit Cargo Ltd."
	company_short = "LC"
	overmap_event_areas = 11

	default_law_type = /datum/ai_laws/corporate

	lobby_icon = 'maps/bearcat/bearcat_lobby.dmi'
	lobby_screens = list("spess","aesthetic")

	allowed_spawns = list("Cryogenic Storage")
	default_spawn = "Cryogenic Storage"
	use_overmap = 1
	num_exoplanets = 3
	away_site_budget = 3
	welcome_sound = 'sound/effects/cowboysting.ogg'

	evac_controller_type = /datum/evacuation_controller/bearcat

	starting_money = 5000
	department_money = 0
	salary_modifier = 0.2

/datum/map/bearcat/get_map_info()
	return "You're aboard the <b>[station_name],</b> an independent vessel affiliated with the Free Trade Union, at the edge of known place. \
	You were brought here via the FTC Vector, a bluespace ship carrier, to survey the area for resources and earn some cash. \
	No major corporation or government has laid claim on the planets in this sector, so their exploitation is entirely up to you - mine, poach and deforest all you want."

/datum/map/bearcat/setup_map()
	..()
	SStrade.traders += new /datum/trader/xeno_shop
	SStrade.traders += new /datum/trader/medical
	SStrade.traders += new /datum/trader/mining