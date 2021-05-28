/*

### This file contains a list of all the areas in your station. Format is as follows:

/area/CATEGORY/OR/DESCRIPTOR/NAME 	(you can make as many subdivisions as you want)
	name = "NICE NAME" 				(not required but makes things really nice)
	icon = "ICON FILENAME" 			(defaults to areas.dmi)
	icon_state = "NAME OF ICON" 	(defaults to "unknown" (blank))
	requires_power = 0 				(defaults to 1)
	music = "music/music.ogg"		(defaults to "music/music.ogg")

NOTE: there are two lists of areas in the end of this file: centcom and station itself. Please maintain these lists valid. --rastaf0

*/

/*-----------------------------------------------------------------------------*/
/area/space
	name = "\improper Space"
	requires_power = 1
	always_unpowered = 1
	lighting_use_dynamic = 0
	power_light = FALSE
	power_equip = FALSE
	power_environ = FALSE
	temperature = TCMB
	pressure = 0
	flags_area = AREA_NOTUNNEL
	test_exemptions = MAP_TEST_EXEMPTION_SPACE

/area/engine
	//ambience = list('sound/ambience/ambisin1.ogg','sound/ambience/ambisin2.ogg','sound/ambience/ambisin3.ogg','sound/ambience/ambisin4.ogg')

/area/admin
	name = "\improper Admin room"
	icon_state = "start"

/area/admin/droppod
	lighting_use_dynamic = FALSE

/area/admin/droppod/holding
	name = "\improper Admin Supply Drops Droppod"

/area/admin/droppod/loading
	name = "\improper Admin Supply Drops Loading"

//Defined for fulton recovery storage
/area/space/highalt
	name = "High Altitude"
	icon_state = "blue"

/area/start            // will be unused once kurper gets his login interface patch done
	name = "start area"
	icon_state = "start"
	requires_power = 0
	luminosity = 1
	lighting_use_dynamic = 0
	has_gravity = 1

// === end remove

// CENTCOM

/area/centcom
	name = "\improper abandoned  Centcom"
	icon_state = "centcom"
	requires_power = 0
	statistic_exempt = TRUE

/area/centcom/control
	name = "\improper abandoned  Centcom Control"

/area/centcom/living
	name = "\improper abandoned  Centcom Living Quarters"

/area/tdome
	name = "\improper abandoned  Thunderdome"
	icon_state = "thunder"
	requires_power = 0
	flags_area = AREA_NOTUNNEL
	statistic_exempt = TRUE

/area/tdome/tdome1
	name = "\improper abandoned  Thunderdome (Team 1)"
	icon_state = "green"

/area/tdome/tdome2
	name = "\improper abandoned  Thunderdome (Team 2)"
	icon_state = "yellow"

/area/tdome/tdomeadmin
	name = "\improper abandoned  Thunderdome (Admin.)"
	icon_state = "purple"

/area/tdome/tdomeobserve
	name = "\improper abandoned  Thunderdome (Observer.)"
	icon_state = "purple"

/area/shuttle
	ceiling = CEILING_METAL
	requires_power = 0
	test_exemptions = MAP_TEST_EXEMPTION_SPACE
	ambience_exterior = AMBIENCE_ALMAYER
	ceiling_muffle = FALSE


//Drop Pods
/area/shuttle/drop1
	//soundscape_playlist = list('sound/soundscape/drum1.ogg')
	soundscape_interval = 30 //seconds
	is_resin_allowed = FALSE
	flags_area = AREA_NOTUNNEL

/area/shuttle/drop1/Enter(atom/movable/O, atom/oldloc)
	if(istype(O, /obj/structure/barricade))
		return FALSE
	return TRUE

/area/shuttle/drop1/sulaco
	name = "\improper Dropship Alamo"
	icon_state = "shuttlered"
	base_muffle = MUFFLE_HIGH

/area/shuttle/drop1/LV624
	name = "\improper Dropship Alamo"
	ambience_exterior = AMBIENCE_LV624
	icon_state = "shuttle"

/area/shuttle/drop1/Haunted
	name = "\improper Dropship Alamo"
	icon_state = "shuttle"

/area/shuttle/drop1/prison
	name = "\improper Dropship Alamo"
	ambience_exterior = AMBIENCE_PRISON
	icon_state = "shuttle"

/area/shuttle/drop1/BigRed
	name = "\improper Dropship Alamo"
	ambience_exterior = AMBIENCE_BIGRED
	icon_state = "shuttle"

/area/shuttle/drop1/ice_colony
	name = "\improper Dropship Alamo"
	icon_state = "shuttle"

/area/shuttle/drop1/DesertDam
	name = "\improper Dropship Alamo"
	ambience_exterior = AMBIENCE_TRIJENT
	icon_state = "shuttle"

/area/shuttle/drop1/transit
	ambience_exterior 	= 'sound/ambience/dropship_ambience_loop.ogg'
	name = "\improper Dropship Alamo Transit"
	icon_state = "shuttle2"

/area/shuttle/drop1/lz1
	name = "\improper Alamo Landing Zone"
	icon_state = "away1"


/area/shuttle/drop2/Enter(atom/movable/O, atom/oldloc)
	if(istype(O, /obj/structure/barricade))
		return FALSE
	return TRUE

/area/shuttle/drop2
	//soundscape_playlist = list('sound/soundscape/drum1.ogg')
	soundscape_interval = 30 //seconds
	is_resin_allowed = FALSE
	flags_area = AREA_NOTUNNEL

/area/shuttle/drop2/sulaco
	name = "\improper Dropship Normandy"
	icon_state = "shuttle"
	base_muffle = MUFFLE_HIGH

/area/shuttle/drop2/LV624
	name = "\improper Dropship Normandy"
	ambience_exterior = AMBIENCE_LV624
	icon_state = "shuttle2"

/area/shuttle/drop2/Haunted
	name = "\improper Dropship Normandy"
	icon_state = "shuttle2"

/area/shuttle/drop2/prison
	name = "\improper Dropship Normandy"
	ambience_exterior = AMBIENCE_PRISON
	icon_state = "shuttle2"

/area/shuttle/drop2/BigRed
	name = "\improper Dropship Normandy"
	ambience_exterior = AMBIENCE_BIGRED
	icon_state = "shuttle2"

/area/shuttle/drop2/ice_colony
	name = "\improper Dropship Normandy"
	icon_state = "shuttle2"

/area/shuttle/drop2/DesertDam
	name = "\improper Dropship Normandy"
	ambience_exterior = AMBIENCE_TRIJENT
	icon_state = "shuttle2"

/area/shuttle/drop2/transit
	ambience_exterior 	= 'sound/ambience/dropship_ambience_loop.ogg'
	name = "\improper Dropship Normandy Transit"
	icon_state = "shuttlered"

/area/shuttle/drop2/lz2
	name = "\improper Normandy Landing Zone"
	icon_state = "away2"





//DISTRESS SHUTTLES

/area/shuttle/distress
	lighting_use_dynamic = FALSE
	unique = TRUE

/area/shuttle/distress/start
	name = "\improper Distress Shuttle"
	icon_state = "away1"
	flags_atom = AREA_ALLOW_XENO_JOIN

/area/shuttle/distress/transit
	name = "\improper Distress Shuttle Transit"
	icon_state = "away2"


/area/shuttle/distress/start_pmc
	name = "\improper Distress Shuttle PMC"
	icon_state = "away1"

/area/shuttle/distress/transit_pmc
	name = "\improper Distress Shuttle PMC Transit"
	icon_state = "away2"


/area/shuttle/distress/start_upp
	name = "\improper Distress Shuttle UPP"
	icon_state = "away1"


/area/shuttle/distress/transit_upp
	name = "\improper Distress Shuttle UPP Transit"
	icon_state = "away2"


/area/shuttle/distress/start_big
	name = "\improper Distress Shuttle Big"
	icon_state = "away1"


/area/shuttle/distress/transit_big
	name = "\improper Distress Shuttle Big Transit"
	icon_state = "away2"


/area/shuttle/distress/arrive_1
	name = "\improper Distress Shuttle"
	icon_state = "away3"

/area/shuttle/distress/arrive_2
	name = "\improper Distress Shuttle"
	icon_state = "away4"

/area/shuttle/distress/arrive_3
	name = "\improper Distress Shuttle"
	icon_state = "away"


/area/shuttle/distress/arrive_n_hangar
	name = "\improper Distress Shuttle"
	icon_state = "away"

/area/shuttle/distress/arrive_s_hangar
	name = "\improper Distress Shuttle"
	icon_state = "away3"
