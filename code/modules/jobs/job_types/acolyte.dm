/*
Acolyte
*/
/datum/job/acolyte
	title = "Acolyte"
	flag = ACOLYTE
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	supervisors = "absolutely everyone"
	selection_color = "#dddddd"
	access = list()			//See /datum/job/acolyte/get_access()
	minimal_access = list()	//See /datum/job/acolyte/get_access()
	outfit = /datum/outfit/job/acolyte
	antag_rep = 7
	paycheck = PAYCHECK_ACOLYTE // Get a job. Job reassignment changes your paycheck now. Get over it. | Get a real sense of humor, Goof.
	paycheck_department = ACCOUNT_CIV

/datum/job/acolyte/get_access()
	if(CONFIG_GET(flag/acolytes_have_maint_access) || !CONFIG_GET(flag/jobs_have_minimal_access)) //Config has acolyte maint access set
		. = ..()
		. |= list(ACCESS_MAINT_TUNNELS)
	else
		return ..()

/datum/outfit/job/acolyte
	name = "Acolyte"
	jobtype = /datum/job/acolyte

/datum/outfit/job/acolyte/pre_equip(mob/living/carbon/human/H)
	..()
	if (CONFIG_GET(flag/grey_acolytes))
		uniform = /obj/item/clothing/under/color/grey
	else
		uniform = /obj/item/clothing/under/color/random
