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

	allowed_spawns = list("Cryogenic Storage")
	default_spawn = "Cryogenic Storage"

	lobby_screens = list("torch.ec.scg")

	evac_controller_type = /datum/evacuation_controller/starship

	use_overmap = 1
	num_exoplanets = 1
	away_site_budget = 3
	welcome_sound = 'sound/effects/cowboysting.ogg'

	department_money = 0
	salary_modifier = 0.6

	lobby_screens = list('maps/ftl/lobby/Kestrel.jpg')
	lobby_tracks = list(
		/music_track/chasing_time,
		/music_track/torch,
		/music_track/human,
		/music_track/marhaba,
		/music_track/treacherous_voyage,
		/music_track/comet_haley,
		/music_track/lysendraa,
		/music_track/lasers,
		/music_track/martiancowboy,
		/music_track/monument,
		/music_track/asfarasitgets,
		/music_track/eighties,
		/music_track/torn,
		/music_track/nebula,
		/music_track/epicintro2015,
		/music_track/epicintro2017
	)


/datum/map/FTL/get_map_info()
	return "You are one of many contractors hired by corporations to scout and secure sectors they find appealing. You do not know your employer, but you do know that the more information you manage to gather, the higher the pay."