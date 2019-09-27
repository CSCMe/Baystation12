/datum/extension/interactive/ntos/device
	expected_type = /obj/item/modular_computer

/datum/extension/interactive/ntos/device/host_status()
	var/obj/item/modular_computer/C = holder
	return C.enabled

/datum/extension/interactive/ntos/device/get_hardware_flag()
	var/obj/item/modular_computer/C = holder
	return C.hardware_flag

/datum/extension/interactive/ntos/device/get_power_usage()
	var/obj/item/modular_computer/C = holder
	return C.last_power_usage

/datum/extension/interactive/ntos/device/recalc_power_usage()
	var/obj/item/modular_computer/C = holder
	C.calculate_power_usage()
	
/datum/extension/interactive/ntos/device/emagged()
	var/obj/item/modular_computer/C = holder
	return C.computer_emagged

// Hack to make status bar work

/obj/item/modular_computer/initial_data()
	. = ..()
	var/datum/extension/interactive/ntos/os = get_extension(src, /datum/extension/interactive/ntos)
	if(os)
		. += os.get_header_data()