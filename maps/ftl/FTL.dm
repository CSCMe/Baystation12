#if !defined(using_map_DATUM)
//    #include "FTL_unit_testing.dm"

    #include "FTL_areas.dm"
	#include "Kestrel.dmm"
	#include "FTL_overmap.dm"
	#include "FTL_unit_testing.dm"
	#include "FTL_shuttles.dm"
	#include "FTL_transitlevel.dmm"

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