#define EVAC_OPT_ABANDON_SHIP "abandon_ship"
#define EVAC_OPT_SLEEP_SEQUENCE "sleep_sequence"
#define EVAC_OPT_CANCEL_ABANDON_SHIP "cancel_abandon_ship"
#define EVAC_OPT_CANCEL_SLEEP_SEQUENCE "cancel_sleep_sequence"

// Apparently, emergency_evacuation --> "abandon ship" and !emergency_evacuation --> "sleep sequence"
// That stuff should be moved to the evacuation option datums but someone can do that later
/datum/evacuation_controller/bearcat
	name = "escape pod controller"

	evac_prep_delay    = 7 MINUTES
	evac_launch_delay  = 0 MINUTES
	evac_transit_delay = 2 MINUTES

	transfer_prep_additional_delay     = 8 MINUTES
	autotransfer_prep_additional_delay = 5 MINUTES
	emergency_prep_additional_delay    = 0 MINUTES

	evacuation_options = list(
		EVAC_OPT_ABANDON_SHIP = new /datum/evacuation_option/abandon_ship(),
		EVAC_OPT_SLEEP_SEQUENCE = new /datum/evacuation_option/sleep_sequence(),
		EVAC_OPT_CANCEL_ABANDON_SHIP = new /datum/evacuation_option/cancel_abandon_ship(),
		EVAC_OPT_CANCEL_SLEEP_SEQUENCE = new /datum/evacuation_option/cancel_sleep_sequence()
	)


/datum/evacuation_controller/bearcat/launch_evacuation()
	state = EVAC_IN_TRANSIT
	if (emergency_evacuation)
		priority_announcement.Announce(replacetext(replacetext(GLOB.using_map.emergency_shuttle_leaving_dock, "%dock_name%", "[GLOB.using_map.dock_name]"),  "%ETA%", "[round(get_eta()/60,1)] minute\s"))
	else
		// Sleep
		priority_announcement.Announce(replacetext(replacetext(GLOB.using_map.shuttle_leaving_dock, "%dock_name%", "[GLOB.using_map.dock_name]"),  "%ETA%", "[round(get_eta()/60,1)] minute\s"))

/datum/evacuation_controller/bearcat/available_evac_options()
	if (is_on_cooldown())
		return list()
	if (is_idle())
		return list(evacuation_options[EVAC_OPT_SLEEP_SEQUENCE], evacuation_options[EVAC_OPT_ABANDON_SHIP])
	if (is_evacuating())
		if (emergency_evacuation)
			return list(evacuation_options[EVAC_OPT_CANCEL_ABANDON_SHIP])
		else
			return list(evacuation_options[EVAC_OPT_CANCEL_SLEEP_SEQUENCE])

/datum/evacuation_option/abandon_ship
	option_text = "Abandon spacecraft"
	option_desc = "abandon the spacecraft"
	option_target = EVAC_OPT_ABANDON_SHIP
	needs_syscontrol = TRUE
	silicon_allowed = TRUE
	abandon_ship = TRUE

/datum/evacuation_option/abandon_ship/execute(mob/user)
	if (!evacuation_controller)
		return
	if (evacuation_controller.deny)
		to_chat(user, "Unable to initiate escape procedures.")
		return
	if (evacuation_controller.is_on_cooldown())
		to_chat(user, evacuation_controller.get_cooldown_message())
		return
	if (evacuation_controller.is_evacuating())
		to_chat(user, "Escape procedures already in progress.")
		return
	if (evacuation_controller.call_evacuation(user, 1))
		log_and_message_admins("[user? key_name(user) : "Autotransfer"] has initiated abandonment of the spacecraft.")


/datum/evacuation_option/cancel_abandon_ship
	option_text = "Cancel abandonment"
	option_desc = "cancel abandonment of the spacecraft"
	option_target = EVAC_OPT_CANCEL_ABANDON_SHIP
	needs_syscontrol = TRUE
	silicon_allowed = FALSE

/datum/evacuation_option/cancel_abandon_ship/execute(mob/user)
	if (evacuation_controller && evacuation_controller.cancel_evacuation())
		log_and_message_admins("[key_name(user)] has cancelled abandonment of the spacecraft.")


/datum/evacuation_option/sleep_sequence
	option_text = "Initiate sleep sequence"
	option_desc = "initiate a sleep sequence"
	option_target = EVAC_OPT_SLEEP_SEQUENCE
	needs_syscontrol = TRUE
	silicon_allowed = TRUE

/datum/evacuation_option/sleep_sequence/execute(mob/user)
	if (!evacuation_controller)
		return
	if (evacuation_controller.deny)
		to_chat(user, "Unable to initiate sleep sequence preparation.")
		return
	if (evacuation_controller.is_on_cooldown())
		to_chat(user, evacuation_controller.get_cooldown_message())
		return
	if (evacuation_controller.is_evacuating())
		to_chat(user, "Sleep sequence preparation already in progress.")
		return
	if (evacuation_controller.call_evacuation(user, 0))
		log_and_message_admins("[user? key_name(user) : "Autotransfer"] has initiated sleep sequence preparation.")

/datum/evacuation_option/cancel_sleep_sequence
	option_text = "Cancel sleep sequence"
	option_desc = "cancel the sleep sequence preparation"
	option_target = EVAC_OPT_CANCEL_SLEEP_SEQUENCE
	needs_syscontrol = TRUE
	silicon_allowed = TRUE

/datum/evacuation_option/cancel_sleep_sequence/execute(mob/user)
	if (evacuation_controller && evacuation_controller.cancel_evacuation())
		log_and_message_admins("[key_name(user)] has cancelled the sleep sequence.")


#undef EVAC_OPT_ABANDON_SHIP
#undef EVAC_OPT_SLEEP_SEQUENCE
#undef EVAC_OPT_CANCEL_ABANDON_SHIP
#undef EVAC_OPT_CANCEL_SLEEP_SEQUENCE