#define EVAC_OPT_ABANDON_SHIP "abandon_ship"
#define EVAC_OPT_CALL_CARRIER "call_carrier"
#define EVAC_OPT_SLEEP_SEQUENCE "sleep_sequence"
#define EVAC_OPT_CANCEL_ABANDON_SHIP "cancel_abandon_ship"
#define EVAC_OPT_CANCEL_CALL_CARRIER "cancel_call_carrier"
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
		EVAC_OPT_CALL_CARRIER = new /datum/evacuation_option/call_carrier(),
		EVAC_OPT_SLEEP_SEQUENCE = new /datum/evacuation_option/sleep_sequence(),
		EVAC_OPT_CANCEL_ABANDON_SHIP = new /datum/evacuation_option/cancel_abandon_ship(),
		EVAC_OPT_CANCEL_CALL_CARRIER = new /datum/evacuation_option/cancel_call_carrier(),
		EVAC_OPT_CANCEL_SLEEP_SEQUENCE = new /datum/evacuation_option/cancel_sleep_sequence()
	)

/datum/evacuation_controller/bearcat/available_evac_options()
	if (is_on_cooldown())
		return list()
	if (is_idle())
		return list(evacuation_options[EVAC_OPT_SLEEP_SEQUENCE], evacuation_options[EVAC_OPT_CALL_CARRIER], evacuation_options[EVAC_OPT_ABANDON_SHIP])
	if (is_evacuating())
		return list(evacuation_options[selected.option_cancel])


/datum/evacuation_option/abandon_ship
	option_text = "Abandon spacecraft"
	option_desc = "abandon the spacecraft"
	option_target = EVAC_OPT_ABANDON_SHIP
	option_cancel = EVAC_OPT_CANCEL_ABANDON_SHIP
	needs_syscontrol = TRUE
	silicon_allowed = TRUE
	abandon_ship = TRUE
	leaving_message = "Attention all hands: The life pods have been launched, maintaining burn for %ETA%."
	called_message = "Attention all hands: Emergency evacuation procedures are now in effect. Life pods will launch in %ETA%"
	recall_message = "Attention all hands: Emergency evacuation sequence aborted. Return to normal operating conditions."

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
	option_cancel = EVAC_OPT_CANCEL_SLEEP_SEQUENCE
	needs_syscontrol = TRUE
	silicon_allowed = TRUE
	called_message = "Attention all hands: Preparing sleep sequence. Preparations done in: %ETA%." //Start
	leaving_message = "Attention all hands: Intitiating sleep sequence in: %ETA%." //End
	recall_message = "Attention all hands: Sleep sequence aborted. Return to normal operating conditions."
	hide_option = TRUE

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

/datum/evacuation_option/call_carrier
	option_text = "Call the bluespace carrier"
	option_desc = "Call the bluespace carrier"
	option_target = EVAC_OPT_CALL_CARRIER
	option_cancel = EVAC_OPT_CANCEL_CALL_CARRIER
	needs_syscontrol = TRUE
	silicon_allowed = TRUE
	called_message = "Attention all hands: FTC Vector bluespace drive spooling up. Time to jump: %ETA%"
	docked_message = "Attention all hands: FTU carrier Vector entering bluespace."
	leaving_message = "Attention all hands: Bluespace carrier on intercept course, clamping in: %ETA%."
	recall_message = "Attention all hands: Carrier call canceled. Return to normal operating conditions."

/datum/evacuation_option/call_carrier/execute(mob/user)
	if (!evacuation_controller)
		return
	if (evacuation_controller.deny)
		to_chat(user, "Unable to call a carrier.")
		return
	if (evacuation_controller.is_on_cooldown())
		to_chat(user, evacuation_controller.get_cooldown_message())
		return
	if (evacuation_controller.is_evacuating())
		to_chat(user, "Carrier call already in progress.")
		return
	if (evacuation_controller.call_evacuation(user, 0))
		log_and_message_admins("[user? key_name(user) : "Autotransfer"] has initiated a carrier call.")

/datum/evacuation_option/cancel_call_carrier
	option_text = "Cancel carrier call"
	option_desc = "cancel the carrier call"
	option_target = EVAC_OPT_CANCEL_CALL_CARRIER
	needs_syscontrol = TRUE
	silicon_allowed = TRUE

/datum/evacuation_option/cancel_call_carrier/execute(mob/user)
	if (evacuation_controller && evacuation_controller.cancel_evacuation())
		log_and_message_admins("[key_name(user)] has cancelled the carrier call.")


#undef EVAC_OPT_CALL_CARRIER
#undef EVAC_OPT_ABANDON_SHIP
#undef EVAC_OPT_SLEEP_SEQUENCE
#undef EVAC_OPT_CANCEL_ABANDON_SHIP
#undef EVAC_OPT_CANCEL_SLEEP_SEQUENCE
#undef EVAC_OPT_CANCEL_CALL_CARRIER