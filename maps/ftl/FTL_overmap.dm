/obj/effect/overmap/visitable/ship/landable/voyager
	name = "IV Voyager"
	desc = "A small shuttle capable of atmospheric entry. It bears mercenary markings."
	shuttle = "Voyager"
	max_speed = 1/(1 SECONDS)
	burn_delay = 1 SECONDS
	vessel_mass = 1000
	fore_dir = EAST
	skill_needed = SKILL_NONE
	vessel_size = SHIP_SIZE_TINY

/obj/effect/overmap/visitable/ship/kestrel
	name = "IV Kestrel"
	desc = "An old cruiser, refitted and updated, with mercenary markings. It is equipped with point defense systems and appears to be modified to support a shuttle. Radiation tracing indicates the presence of a nuclear reactor"
	color = "#ffffff"
	base = TRUE
	fore_dir = EAST
	vessel_mass = 15000
	max_speed = 1/(2 SECONDS)
	burn_delay = 2 SECONDS

	initial_generic_waypoints = list(
		"nav_kestrel_fore_port",
		"nav_kestrel_fore_starboard"
	)

/obj/machinery/computer/shuttle_control/explore/voyager
	name = "voyager control console"
	shuttle_tag = "Voyager"