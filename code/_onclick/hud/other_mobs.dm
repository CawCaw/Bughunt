
//AI

/datum/hud/ai/New(mob/living/silicon/ai/owner)
	..()


/mob/living/silicon/ai/create_hud()
	if(!hud_used)
		hud_used = new /datum/hud/ai(src)


//BRAIN

/datum/hud/brain/New(mob/living/brain/owner, ui_style='icons/mob/hud/human_midnight.dmi')
	..()

/mob/living/brain/create_hud()
	if(!hud_used)
		hud_used = new /datum/hud/brain(src)
