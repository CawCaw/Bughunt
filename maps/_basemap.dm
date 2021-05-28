//#define LOWMEMORYMODE //uncomment this to load centcom and runtime station and thats it.

#include "map_files\generic\Admin_level.dmm"
#include "map_files\generic\Low_Orbit.dmm"

#ifndef LOWMEMORYMODE
	#ifdef ALL_MAPS
		#include "map_files\LV624\LV624.dmm"
		#include "map_files\USS_Almayer\USS_Almayer.dmm"
		#ifdef CIBUILDING
			#include "templates.dm"
		#endif
	#endif
#endif
