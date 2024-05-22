// see acs_source/data.acs
const int MOB_ON_SPAWN = 0;
const int XY_DIST = 1;
const int Z_DIST = 2;
const int IS_GONE = 3;
const int FOLLOW_ACTOR = 4;


// used to warp to/copy velocity of another actor i.e a remote mine stuck on an actor
actor "8c follow me" : once {}
actor "8c follower" : once {}

// they are so common
actor proj : BasicProjectile { obituary "$8C_OBIT_DEFAULT" }
actor watcher : BasicWatcher {}

const int FLAG_MOB = 0x1;
actor "8C flags" : once { inventory.maxamount 0xFFFFFFFF }

actor "8C Mob" {
	radius 16 height 32 health 100 scale 2.5 obituary "%o was kill" mass 9999
	+ISMONSTER +USEDAMAGEEVENTSCRIPT +USESPAWNEVENTSCRIPT
	+SOLID +CANPASS +ACTIVATEMCROSS +SHOOTABLE +COUNTKILL
	+CANPUSHWALLS +CANUSEWALLS +MOVEWITHSECTOR +DONTBLAST +FLOORCLIP
    //species 8c_unsolid  +THRUSPECIES
    health 100 var int user_attack;
    //stencilcolor "white"
	// var score	
	states {
		spawn:
            TNT1 A 0 nodelay ACS_NamedExecuteWithResult("8C", MOB_ON_SPAWN)
            TNT1 A 0 A_GiveInventory("8C flags", FLAG_MOB)
            TNT1 A 0 A_JumpIf(true, "onSpawn")
            goto onSpawn
        onSpawn: TNT1 A 0 A_JumpIf(true, "idle")
            goto idle
        death:
            TNT1 A 0 A_SpawnItemEx("ExplosionEffect1",0,0,height>>1)
            TNT1 A 0 A_PlaySoundEx("8CPAIN01", CHAN_VOICE)
            stop}}

            



// actor "8C Protoman" : Megaman {
//     player.displayname "8C Protoman"
//     player.startitem "MagnetMissileWep"
//     +THRUSPECIES species 8c_unsolid
// }

