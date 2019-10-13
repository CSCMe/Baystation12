/decl/hierarchy/outfit/job/FTL
	l_ear = /obj/item/device/radio/headset/contractor/alt
	pda_slot = slot_l_store
	var/exo_slot = slot_s_store //Yeah, shut up, it works
	flags = OUTFIT_HAS_BACKPACK|OUTFIT_EXTENDED_SURVIVAL

//big boss
/decl/hierarchy/outfit/job/FTL/Commander
	name = OUTFIT_JOB_NAME("Fleet Commander")
	uniform = /obj/item/clothing/under/color/black
	suit = /obj/item/clothing/suit/armor/hos/jensen
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/FTL/commander
	pda_type = /obj/item/modular_computer/pda/captain
	r_pocket = /obj/item/weapon/gun/energy/gun/small
	glasses = /obj/item/clothing/glasses/sunglasses

//boss
/decl/hierarchy/outfit/job/FTL/ACommander
	name = OUTFIT_JOB_NAME("Assistant Commander")
	uniform = /obj/item/clothing/under/color/black
	suit = /obj/item/clothing/suit/armor/hos/jensen
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/FTL/assistant_commander
	pda_type = /obj/item/modular_computer/pda/captain
	r_pocket = /obj/item/weapon/gun/energy/gun/small

//engineer
/decl/hierarchy/outfit/job/FTL/Engineer
	name = OUTFIT_JOB_NAME("Engineer")
	uniform = /obj/item/clothing/under/hazard/FTL
	shoes = /obj/item/clothing/shoes/workboots
	id_type = /obj/item/weapon/card/id/FTL/engineer
	pda_type = /obj/item/modular_computer/pda/engineering
	r_pocket = /obj/item/weapon/gun/energy/confuseray
	gloves = /obj/item/clothing/gloves/insulated
	glasses = /obj/item/clothing/glasses/welding/

//doctor
/decl/hierarchy/outfit/job/FTL/Doctor
	name = OUTFIT_JOB_NAME("Doctor")
	uniform = /obj/item/clothing/under/rank/medical
	shoes = /obj/item/clothing/shoes/white
	glasses = /obj/item/clothing/glasses/hud/health
	id_type = /obj/item/weapon/card/id/FTL/doctor
	pda_type = /obj/item/modular_computer/pda/medical
	r_pocket = /obj/item/weapon/gun/energy/confuseray

//pilot
/decl/hierarchy/outfit/job/FTL/Pilot
	name = OUTFIT_JOB_NAME("Pilot")
	uniform = /obj/item/clothing/under/color/black
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/FTL/pilot
	pda_type = /obj/item/modular_computer/pda
	r_pocket = /obj/item/weapon/gun/energy/confuseray

//enforcer
/decl/hierarchy/outfit/job/FTL/Enforcer
	name = OUTFIT_JOB_NAME("Enforcer")
	uniform = /obj/item/clothing/under/color/black
	suit = /obj/item/clothing/suit/armor/pcarrier/medium
	shoes = /obj/item/clothing/shoes/dutyboots
	exo_slot = /obj/item/weapon/gun/projectile/automatic/merc_smg
	head =/obj/item/clothing/head/helmet
	id_type = /obj/item/weapon/card/id/FTL/enforcer
	pda_type = /obj/item/modular_computer/pda/security
	r_pocket = /obj/item/weapon/handcuffs
	belt = /obj/item/weapon/storage/belt/holster/security/tactical/FTL

//researcher
/decl/hierarchy/outfit/job/FTL/Researcher
	name = OUTFIT_JOB_NAME("Researcher")
	uniform = /obj/item/clothing/under/rank/scientist
	shoes = /obj/item/clothing/glasses/science
	glasses = /obj/item/clothing/glasses/
	id_type = /obj/item/weapon/card/id/FTL/researcher
	pda_type = /obj/item/modular_computer/pda/science
	r_pocket = /obj/item/weapon/gun/energy/confuseray

//crewman
/decl/hierarchy/outfit/job/FTL/Crewman
	name = OUTFIT_JOB_NAME("Crewman")
	uniform = /obj/item/clothing/under/color/black
	shoes = /obj/item/clothing/shoes/dutyboots
	id_type = /obj/item/weapon/card/id/FTL
	pda_type = /obj/item/modular_computer/pda/science