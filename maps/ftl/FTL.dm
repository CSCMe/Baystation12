#if !defined(using_map_DATUM)
//    #include "FTL_unit_testing.dm"

    #include "FTL_areas.dm"
	#include "FTL_overmap.dm"
	#include "FTL_unit_testing.dm"
	#include "FTL_shuttles.dm"
	#include "FTL_ranks.dm"
	#include "FTL_map_templates.dm"

	#include "jobs/FTL_access.dm"
	#include "jobs/FTL_IDs.dm"
	#include "jobs/FTL_jobjobs.dm"
	#include "jobs/FTL_jobs.dm"
	#include "jobs/FTL_outfits.dm"

	#include "Kestrel.dmm"
	#include "FTL_transitlevel.dmm"

	#include "language/human/euro.dm"
	#include "language/human/misc/spacer.dm"

	#define using_map_DATUM /datum/map/FTL

    #include "../away/empty.dmm"
	#include "../away/ascent/ascent.dm"
	#include "../away/mining/mining.dm"
	#include "../away/derelict/derelict.dm"
	#include "../away/bearcat/bearcat.dm"
	#include "../away/lost_supply_base/lost_supply_base.dm"
	#include "../away/smugglers/smugglers.dm"
	#include "../away/magshield/magshield.dm"
	#include "../away/casino/casino.dm"
	#include "../away/yacht/yacht.dm"
	#include "../away/blueriver/blueriver.dm"
	#include "../away/slavers/slavers_base.dm"
	#include "../away/mobius_rift/mobius_rift.dm"
	#include "../away/icarus/icarus.dm"
	#include "../away/errant_pisces/errant_pisces.dm"
	#include "../away/lar_maria/lar_maria.dm"
	#include "../away/unishi/unishi.dm"
	#include "../away/voxship/voxship.dm"

	#endif

//all the overrides and new stuff

/obj/machinery/door/airlock/hatch/autoname/command
	stripe_color = COLOR_COMMAND_BLUE

/obj/machinery/door/airlock/hatch/autoname/engineering
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/autoname/engineering
	stripe_color = COLOR_AMBER

/obj/machinery/door/airlock/autoname/command
	stripe_color = COLOR_COMMAND_BLUE

/obj/machinery/door/airlock/autoname/civilian
	stripe_color = COLOR_CIVIE_GREEN

/obj/machinery/door/airlock/autoname/weapons
	stripe_color = COLOR_RED

/turf/simulated/wall/NTred
	color = COLOR_NT_RED

/turf/simulated/wall/r_wall/NTred
	color = COLOR_NT_RED

/obj/item/device/radio/headset/contractor/alt
	name = "contractor headset"
	desc = "A headset often used by contractors on ships where having a full communications system is simply too expensive."
	item_state = "cargo_headset" //not alt headset sprite because they look bad on other species
	icon_state = "cargo_headset"
	max_keys = 3

/obj/item/weapon/storage/belt/utility/full/FTL/New()
	..()
	new /obj/item/device/multitool(src)
	update_icon()


/obj/item/weapon/storage/belt/holster/security/FTL
	name = "combat belt"
	desc = "Can hold security gear like handcuffs and flashes, with more pouches for more storage."
	icon_state = "swatbelt"
	item_state = "swatbelt"
	storage_slots = 10

/obj/item/weapon/storage/belt/holster/security/FTL/New()
	..()
	new /obj/item/weapon/melee/baton/loaded(src)
	new /obj/item/weapon/gun/energy/gun/small/secure(src)
	new /obj/item/device/flashlight/maglight(src)
	new /obj/item/device/flash(src)
	new /obj/item/weapon/reagent_containers/spray/pepper(src)
	new /obj/item/weapon/grenade/flashbang(src)
	update_icon()

/obj/machinery/suit_cycler/mining/FTL
	req_access = list()