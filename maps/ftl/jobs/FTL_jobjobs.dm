//big boss
/datum/job/commander
	title = "Fleet Commander"
	supervisors = "money"
	department = "Command"
	total_positions = 1
	spawn_positions = 1
	department_flag = COM
	selection_color = "#2f2f7f"
	minimal_player_age = 1
	economic_power = 5
	alt_titles = list()
	ideal_character_age = 40
	outfit_type = /decl/hierarchy/outfit/job/FTL/Commander
	access = list(access_kestrel, access_voyager, access_engine, access_bridge, access_security, access_medical, access_change_ids, access_engine_equip, access_brig)
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/contractor
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_PILOT       = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/commander/get_description_blurb()
	return "You are the Fleet Commander. You are the law. You are in charge of all the contractors in this small fleet of yours, and now you just have to make sure they do their job, while also ensuring a pristine sector is ready for wahtever your employer wants to do with it."

/datum/job/captain/post_equip_rank(var/mob/person, var/alt_title)
	var/sound/announce_sound = (GAME_STATE <= RUNLEVEL_SETUP)? null : sound('sound/misc/boatswain.ogg', volume=20)
	captain_announcement.Announce("All hands, [alt_title || title] [person.real_name] on deck!", new_sound = announce_sound)
	..()

//boss
/datum/job/assistant_commander
	title = "Assistant Commander"
	supervisors = "the Fleet Commander"
	department = "Command"
	department_flag = COM
	selection_color = "#2f2f7f"
	total_positions = 1
	spawn_positions = 1
	minimal_player_age = 0
	economic_power = 4
	alt_titles = list()
	ideal_character_age = 30
	outfit_type = /decl/hierarchy/outfit/job/FTL/ACommander
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/contractor
	)
	min_skill = list(   SKILL_PILOT       = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)
	skill_points = 30
	access = list(access_kestrel, access_voyager, access_engine, access_bridge, access_security, access_medical, access_engine_equip)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/card_mod,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/reports)

/datum/job/assistant_commander/get_description_blurb()
	return "You are the Assistant Commander. Your job is to help the Commander with whatever you are able to, and to make sure the crew stays on your side."

//engineer
/datum/job/engineer
	title = "Engineer"
	department = "Engineering"
	department_flag = ENG
	total_positions = 6
	spawn_positions = 6
	hud_icon = "hudengineer"
	supervisors = "the Assistant Commander"
	economic_power = 2
	alt_titles = list()
	minimal_player_age = 0
	ideal_character_age = 30
	outfit_type = /decl/hierarchy/outfit/job/FTL/Engineer
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/contractor
	)
	min_skill = list(   SKILL_COMPUTER     = SKILL_BASIC,
	                    SKILL_EVA          = SKILL_BASIC,
	                    SKILL_CONSTRUCTION = SKILL_ADEPT,
	                    SKILL_ELECTRICAL   = SKILL_BASIC,
	                    SKILL_ATMOS        = SKILL_BASIC,
	                    SKILL_ENGINES      = SKILL_BASIC)

	max_skill = list(   SKILL_CONSTRUCTION = SKILL_MAX,
	                    SKILL_ELECTRICAL   = SKILL_MAX,
	                    SKILL_ATMOS        = SKILL_MAX,
	                    SKILL_ENGINES      = SKILL_MAX)
	skill_points = 25

	access = list(access_kestrel, access_engine, access_voyager, access_engine_equip)

	software_on_spawn = list(/datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/atmos_control,
							 /datum/computer_file/program/rcon_console,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor)

/datum/job/engineer/get_description_blurb()
	return "You are the Ship Engineer, specialized in keeping space faring vessels operational. You are subordinate to the Assistant Commander and the Fleet commander and are expected to follow them."

//doctor
/datum/job/doctor
	title = "Doctor"
	department = "Medical"
	department_flag = MED
	total_positions = 4
	spawn_positions = 4
	hud_icon = "hudmedicaldoctor"
	supervisors = "the Assistant Commander"
	economic_power = 2
	alt_titles = list()
	ideal_character_age = 30
	minimal_player_age = 0
	outfit_type = /decl/hierarchy/outfit/job/FTL/Doctor
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/contractor
	)
	min_skill = list(   SKILL_EVA     = SKILL_BASIC,
	                    SKILL_MEDICAL = SKILL_BASIC,
	                    SKILL_ANATOMY = SKILL_BASIC)

	max_skill = list(   SKILL_MEDICAL     = SKILL_MAX,
	                    SKILL_CHEMISTRY   = SKILL_MAX,
	                    SKILL_VIROLOGY    = SKILL_MAX)

	access = list(access_kestrel, access_voyager, access_medical)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/camera_monitor)
	skill_points = 26

/datum/job/doctor/get_description_blurb()
	return "You are the Doctor, specialized in keeping spacemen operational. You are subordinate to the Assistant Commander and the Fleet commander and are expected to follow them."

//pilot
/datum/job/pilot
	title = "Pilot"
	department = "Command"
	department_flag = COM
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Assistant Commander"
	selection_color = "#2f2f7f"
	minimal_player_age = 0
	alt_titles = list()
	economic_power = 2
	ideal_character_age = 30
	outfit_type = /decl/hierarchy/outfit/job/FTL/Pilot
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/contractor
	)
	min_skill = list(  SKILL_PILOT       = SKILL_ADEPT)

	max_skill = list(   SKILL_PILOT       = SKILL_MAX)
	skill_points = 25


	access = list(access_kestrel, access_bridge, access_voyager)

	software_on_spawn = list(/datum/computer_file/program/comm,
							 /datum/computer_file/program/suit_sensors,
							 /datum/computer_file/program/power_monitor,
							 /datum/computer_file/program/supermatter_monitor,
							 /datum/computer_file/program/alarm_monitor,
							 /datum/computer_file/program/camera_monitor,
							 /datum/computer_file/program/shields_monitor,
							 /datum/computer_file/program/reports,
							 /datum/computer_file/program/deck_management)

/datum/job/pilot/get_description_blurb()
	return "You are the Pilot, specialized in operating spacecraft. You are subordinate to the Assistant Commander and the Fleet commander and are expected to follow them."

//enforcer
/datum/job/enforcer
	title = "Enforcer"
	department = "Security"
	department_flag = SEC
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Assistant Commander"
	selection_color = "#8b0000"
	economic_power = 2
	minimal_player_age = 0
	skill_points = 25
	ideal_character_age = 25
	alt_titles = list() // This is a hack. Overriding a list var with null does not actually override it due to the particulars of dm list init. Do not "clean up" without testing. Ye waht taht guy said
	outfit_type = /decl/hierarchy/outfit/job/FTL/Enforcer
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/contractor
	)
	min_skill = list(   SKILL_BUREAUCRACY = SKILL_BASIC,
	                    SKILL_EVA         = SKILL_BASIC,
	                    SKILL_COMBAT      = SKILL_BASIC,
	                    SKILL_WEAPONS     = SKILL_ADEPT,
	                    SKILL_FORENSICS   = SKILL_BASIC)

	max_skill = list(   SKILL_COMBAT      = SKILL_MAX,
	                    SKILL_WEAPONS     = SKILL_MAX,
	                    SKILL_FORENSICS   = SKILL_MAX)

	access = list(access_kestrel, access_voyager, access_security)
	minimal_access = list()

	software_on_spawn = list(/datum/computer_file/program/digitalwarrant,
							 /datum/computer_file/program/camera_monitor)

/datum/job/enforcer/get_description_blurb()
	return "You are the Enforcer, specialized in repelling pirates and keeping the peace. You are subordinate to the Assistant Commander and the Fleet commander and are expected to follow them."

//researcher
/datum/job/researcher
	title = "Researcher"
	department = "Research"
	department_flag = SCI
	total_positions = 4
	spawn_positions = 4
	supervisors = "the Assistant Commander"
	selection_color = "#633d63"
	economic_power = 3
	skill_points = 25
	ideal_character_age = 30
	alt_titles = list()

	outfit_type = /decl/hierarchy/outfit/job/FTL/Researcher
	allowed_branches = list(
		/datum/mil_branch/civilian,
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/contractor
	)
	max_skill = list(   SKILL_ANATOMY     = SKILL_MAX,
	                    SKILL_DEVICES     = SKILL_MAX,
	                    SKILL_SCIENCE     = SKILL_MAX)

	access = list(access_kestrel, access_voyager, access_research)

/datum/job/researcher/get_description_blurb()
	return "You are the Researcher, specialized in operating the analyzer and exploring strange new worlds. You are subordinate to the Assistant Commander and the Fleet commander and are expected to follow them."

//crewman
/datum/job/crewman
	title = "Crewman"
	total_positions = -1
	spawn_positions = -1
	supervisors = "Everyone"
	economic_power = 1
	alt_titles = list("Junior Engineer", "Junior Researcher", "Junior Physician")
	ideal_character_age = 30
	minimal_player_age = 0
	outfit_type = /decl/hierarchy/outfit/job/FTL/Crewman
	allowed_branches = list(
		/datum/mil_branch/civilian
	)
	allowed_ranks = list(
		/datum/mil_rank/civ/contractor
	)

	access = list(access_kestrel)
	minimal_access = list()

	skill_points = 18

/datum/job/crewman/get_description_blurb()
	return "You are the Crewman. You are subordinate to everyone and are expected to assist them with everything."