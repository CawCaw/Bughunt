/obj/structure/largecrate
	name = "large crate"
	desc = "A hefty wooden crate."
	icon = 'icons/obj/structures/crates.dmi'
	icon_state = "densecrate"
	density = 1
	anchored = 0

/obj/structure/largecrate/initialize_pass_flags(var/datum/pass_flags_container/PF)
	..()
	if (PF)
		PF.flags_can_pass_all = PASS_OVER|PASS_AROUND

/obj/structure/largecrate/attack_hand(mob/user as mob)
	to_chat(user, SPAN_NOTICE("You need a crowbar to pry this open!"))
	return

/obj/structure/largecrate/attackby(obj/item/W as obj, mob/user as mob)
	if(HAS_TRAIT(W, TRAIT_TOOL_CROWBAR))
		new /obj/item/stack/sheet/wood(src)
		var/turf/T = get_turf(src)
		for(var/obj/O in contents)
			O.forceMove(T)
		user.visible_message(SPAN_NOTICE("[user] pries \the [src] open."), \
							 SPAN_NOTICE("You pry open \the [src]."), \
							 SPAN_NOTICE("You hear splitting wood."))
		qdel(src)
	else
		return attack_hand(user)

/obj/structure/largecrate/ex_act(var/power)
	if(power >= EXPLOSION_THRESHOLD_VLOW)
		var/turf/T = get_turf(src)
		new /obj/item/stack/sheet/wood(T)
		for(var/obj/O in contents)
			O.forceMove(T)

		qdel(src)

/obj/structure/largecrate/mule
	icon_state = "mulecrate"

/obj/structure/largecrate/lisa
	icon_state = "lisacrate"

/obj/structure/largecrate/lisa/attackby(obj/item/W as obj, mob/user as mob)	//ugly but oh well
	if(HAS_TRAIT(W, TRAIT_TOOL_CROWBAR))
		new /mob/living/simple_animal/corgi/Lisa(loc)
	..()

/obj/structure/largecrate/cow
	name = "cow crate"
	icon_state = "lisacrate"

/obj/structure/largecrate/cow/attackby(obj/item/W as obj, mob/user as mob)
	if(HAS_TRAIT(W, TRAIT_TOOL_CROWBAR))
		new /mob/living/simple_animal/cow(loc)
	..()

/obj/structure/largecrate/goat
	name = "goat crate"
	icon_state = "lisacrate"

/obj/structure/largecrate/goat/attackby(obj/item/W as obj, mob/user as mob)
	if(HAS_TRAIT(W, TRAIT_TOOL_CROWBAR))
		new /mob/living/simple_animal/hostile/retaliate/goat(loc)
	..()

/obj/structure/largecrate/chick
	name = "chicken crate"
	icon_state = "lisacrate"

/obj/structure/largecrate/chick/attackby(obj/item/W as obj, mob/user as mob)
	if(HAS_TRAIT(W, TRAIT_TOOL_CROWBAR))
		var/num = rand(4, 6)
		for(var/i = 0, i < num, i++)
			new /mob/living/simple_animal/chick(loc)
	..()


///////////CM largecrates ///////////////////////
//Possibly the most generically named procs in history. congrats
/obj/structure/largecrate/random
	name = "supply crate"
	var/num_things = 0
	var/list/stuff = list(/obj/item/cell/high,
						/obj/item/storage/belt/utility/full,
						/obj/item/device/multitool,
						/obj/item/tool/crowbar,
						/obj/item/device/flashlight,
						/obj/item/reagent_container/food/snacks/donkpocket,
						/obj/item/explosive/grenade/smokebomb,
						/obj/item/circuitboard/airlock,
						/obj/item/device/assembly/igniter,
						/obj/item/tool/weldingtool,
						/obj/item/tool/wirecutters,
						/obj/item/device/analyzer,
						/obj/item/clothing/under/marine,
						/obj/item/clothing/shoes/marine)

/obj/structure/largecrate/random/Initialize()
	. = ..()
	if(!num_things) num_things = rand(0,3)

	for(var/i in 1 to num_things)
		var/obj/item/thing = pick(stuff)
		new thing(src)
	num_things = 0

/obj/structure/largecrate/random/case
	name = "storage case"
	desc = "A black storage case."
	icon_state = "case"

/obj/structure/largecrate/random/case/double
	name = "cases"
	desc = "A stack of black storage cases."
	icon_state = "case_double"

/obj/structure/largecrate/random/case/double/Del()
	new /obj/structure/largecrate/random/case(loc)
	..()

/obj/structure/largecrate/random/case/small
	name = "small cases"
	desc = "Two small black storage cases."
	icon_state = "case_small"

/obj/structure/largecrate/random/barrel
	name = "blue barrel"
	desc = "A blue storage barrel"
	icon_state = "barrel_blue"

/obj/structure/largecrate/random/barrel/blue
	name = "blue barrel"
	desc = "A blue storage barrel"
	icon_state = "barrel_blue"

/obj/structure/largecrate/random/barrel/red
	name = "red barrel"
	desc = "A red storage barrel"
	icon_state = "barrel_red"

/obj/structure/largecrate/random/barrel/green
	name = "green barrel"
	desc = "A green storage barrel"
	icon_state = "barrel_green"

/obj/structure/largecrate/random/barrel/yellow
	name = "yellow barrel"
	desc = "A yellow storage barrel"
	icon_state = "barrel_yellow"

/obj/structure/largecrate/random/barrel/white
	name = "white barrel"
	desc = "A white storage barrel"
	icon_state = "barrel_white"

/obj/structure/largecrate/random/secure
	name = "secure supply crate"
	desc = "A secure crate."
	icon_state = "secure_crate_strapped"
	var/strapped = 1

/obj/structure/largecrate/random/secure/attackby(var/obj/item/W as obj, var/mob/user as mob)
	if (!strapped)
		..()
		return

	if (!W.sharp)
		to_chat(user, SPAN_NOTICE("You need something sharp to cut off the straps."))
		return

	to_chat(user, SPAN_NOTICE("You begin to cut the straps off \the [src]..."))

	if (do_after(user, 15, INTERRUPT_ALL, BUSY_ICON_GENERIC))
		playsound(loc, 'sound/items/Wirecutter.ogg', 25, 1)
		to_chat(user, SPAN_NOTICE("You cut the straps away."))
		icon_state = "secure_crate"
		strapped = 0


/obj/structure/largecrate/guns
	name = "\improper USCM firearms crate (x3)"
	var/num_guns = 3
	var/num_mags = 0
	var/list/stuff = list(
					/obj/item/weapon/gun/pistol/m4a3 = /obj/item/ammo_magazine/pistol,
					/obj/item/weapon/gun/pistol/m4a3 = /obj/item/ammo_magazine/pistol,
					/obj/item/weapon/gun/revolver/m44 = /obj/item/ammo_magazine/revolver,
					/obj/item/weapon/gun/rifle/m41a = /obj/item/ammo_magazine/rifle,
					/obj/item/weapon/gun/rifle/m41a = /obj/item/ammo_magazine/rifle,
					/obj/item/weapon/gun/shotgun/pump = /obj/item/ammo_magazine/shotgun,
					/obj/item/weapon/gun/smg/m39 = /obj/item/ammo_magazine/smg/m39,
					/obj/item/weapon/gun/smg/m39 = /obj/item/ammo_magazine/smg/m39
				)

/obj/structure/largecrate/guns/New()
	..()
	var/gun_type
	var/i = 0
	while(++i <= num_guns)
		gun_type = pick(stuff)
		new gun_type(src)
		var/obj/item/ammo_magazine/new_mag = stuff[gun_type]
		var/m = 0
		while(++m <= num_mags)
			new new_mag(src)

/obj/structure/largecrate/guns/russian
	num_guns = 1
	num_mags = 1
	name = "\improper Nagant-Yamasaki firearm crate"
	stuff = list(	/obj/item/weapon/gun/revolver/nagant = /obj/item/ammo_magazine/revolver/upp,
					/obj/item/weapon/gun/pistol/c99 = /obj/item/ammo_magazine/pistol/c99,
					/obj/item/weapon/gun/pistol/kt42 = /obj/item/ammo_magazine/pistol/automatic,
					/obj/item/weapon/gun/rifle/mar40 = /obj/item/ammo_magazine/rifle/mar40,
					/obj/item/weapon/gun/rifle/mar40/carbine = /obj/item/ammo_magazine/rifle/mar40/extended,
					/obj/item/weapon/gun/rifle/sniper/svd = /obj/item/ammo_magazine/sniper/svd,
					/obj/item/weapon/gun/smg/ppsh = /obj/item/ammo_magazine/smg/ppsh
				)

/obj/structure/largecrate/guns/merc
	num_guns = 1
	num_mags = 1
	name = "\improper Black market firearm crate"
	stuff = list(	/obj/item/weapon/gun/pistol/holdout = /obj/item/ammo_magazine/pistol/holdout,
					/obj/item/weapon/gun/pistol/highpower = /obj/item/ammo_magazine/pistol/highpower,
					/obj/item/weapon/gun/pistol/m1911 = /obj/item/ammo_magazine/pistol/m1911,
					/obj/item/weapon/gun/pistol/heavy = /obj/item/ammo_magazine/pistol/heavy,
					/obj/item/weapon/gun/revolver/small = /obj/item/ammo_magazine/revolver/small,
					/obj/item/weapon/gun/revolver/cmb = /obj/item/ammo_magazine/revolver/cmb,
					/obj/item/weapon/gun/shotgun/merc = /obj/item/ammo_magazine/shotgun,
					/obj/item/weapon/gun/shotgun/pump/cmb = /obj/item/ammo_magazine/shotgun/incendiary,
					/obj/item/weapon/gun/shotgun/double = /obj/item/ammo_magazine/shotgun/buckshot,
					/obj/item/weapon/gun/smg/mp7 = /obj/item/ammo_magazine/smg/mp7,
					/obj/item/weapon/gun/pistol/skorpion = /obj/item/ammo_magazine/pistol/skorpion,
					/obj/item/weapon/gun/smg/uzi = /obj/item/ammo_magazine/smg/uzi,
					/obj/item/weapon/gun/smg/fp9000 = /obj/item/ammo_magazine/smg/fp9000
				)
