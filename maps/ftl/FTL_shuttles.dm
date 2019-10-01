//Voyager

/datum/shuttle/autodock/overmap/voyager
	name = "Voyager"
	warmup_time = 5
	move_time = 30
	shuttle_area = /area/voyager/start
	dock_target ="voyager_shuttle"
	current_location = "nav_kestrel_voyager"
	landmark_transition = "nav_transit_voyager"
	sound_takeoff = 'sound/effects/rocket.ogg'
	sound_landing = 'sound/effects/rocket_backwards.ogg'
	fuel_consumption = 2
	logging_home_tag = "nav_kestrel_voyager"
	skill_needed = SKILL_NONE
	ceiling_type = /turf/simulated/floor/shuttle_ceiling

/obj/effect/shuttle_landmark/kestrel/voyager
	name = "Voyager Dock"
	landmark_tag = "nav_kestrel_voyager"
	base_area = /area/space
	base_turf = /turf/space

/obj/effect/shuttle_landmark/transit/voyager
	name = "In transit"
	landmark_tag = "nav_transit_voyager"

//In case multiple shuttles can dock at a location,
//subtypes can be used to hold the shuttle-specific data