/datum/evacuation_option
	var/option_text = "Generic evac option"
	var/option_desc = "do something that should never be seen"
	var/option_target = "generic"
	var/option_cancel
	var/needs_syscontrol = FALSE
	var/silicon_allowed = TRUE
	var/abandon_ship = FALSE
	var/called_sound
	var/docked_sound
	var/leaving_sound
	var/recall_sound
	var/called_message
	var/docked_message
	var/leaving_message
	var/recall_message
	var/hide_option = FALSE
	
/datum/evacuation_option/proc/execute(var/mob/user)
	return