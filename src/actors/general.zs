
actor "MMC mob" {
	radius 16 height 32 health 100  scale 2.5
	+ISMONSTER +USEDAMAGEEVENTSCRIPT +USESPAWNEVENTSCRIPT
	+SOLID +CANPASS +ACTIVATEMCROSS +SHOOTABLE +COUNTKILL
	+CANPUSHWALLS +CANUSEWALLS +MOVEWITHSECTOR +DONTBLAST
	
	states {
		spawn: METT D -1
			loop}}