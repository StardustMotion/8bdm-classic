actor "8C Blader" : "8C Mob" {
    translation "198:198=74:74", "192:92=168:168" // 109 green
    obituary "$8C_OBIT_BLADER" -SOLID
    +NOGRAVITY radius 20 height 50 health 200
    meleerange 2048 accuracy 14
        states { 
            idle:
                BLAD A 0 A_LookEx(0,0,meleerange,meleerange>>1,120,"see")
                BLAD A 0 A_ChangeVelocity(accuracy>>1,0,0,CVF_REPLACE|CVF_RELATIVE)
                BLAD ABABABAB 6
                BLAD A 0 A_LookEx(0,0,meleerange,meleerange>>1,120,"see")
                BLAD ABABABAB 6
                BLAD A 0 A_LookEx(0,0,meleerange,meleerange>>1,120,"see")
                BLAD ABABABAB 6
                BLAD A 0 A_SetAngle(angle+random(155,205))
                loop
            see:
                BLAD A 0 A_FaceTarget
                BLAD A 0 A_PlaySoundEx("8CBLADER", "Weapon")
                BLAD A 0 A_ChangeVelocity(accuracy*0.8,0,0,CVF_REPLACE|CVF_RELATIVE)
                BLAD AAAABBBBAAAA 1 A_JumpIf((CallACS("8C",XY_DIST)*1.4) < (CallACS("8C",Z_DIST)), "diveStart")
                BLAD A 0 A_PlaySoundEx("8CBLADER", "Weapon")
                BLAD BBBBAAAABBBB 1 A_JumpIf((CallACS("8C",XY_DIST)*1.4) < (CallACS("8C",Z_DIST)), "diveStart")
                BLAD A 0 A_JumpIf(CallACS("8C", IS_GONE, AAPTR_TARGET), "idle")
                loop
            diveStart:
                BLAD A 0 ACS_NamedExecuteWithResult("core_predicthome", accuracy, AAPTR_TARGET, -5)
                TNT1 A 0 A_GiveInventory("8c follow me")
                TNT1 A 0 A_SetArg(0, 0)
                TNT1 A 0 A_SetArg(1,z)
                TNT1 A 0 A_SetArg(2, CallACS("8C", Z_DIST)/accuracy)
                BLAD A 0 A_SpawnItemEx("8C Blader contact",0,0,-12)
            diveLoop:
                BLAD A 0 A_ChangeVelocity(accuracy,0,-accuracy,CVF_REPLACE|CVF_RELATIVE)
                BLAD A 0 A_PlaySoundEx("8CBLADER", "Weapon")

                BLAD A 1 A_SetArg(0,args[0]+1) BLAD A 0 A_JumpIf(args[0] == args[2], "raise")
                BLAD A 1 A_SetArg(0,args[0]+1) BLAD A 0 A_JumpIf(args[0] == args[2], "raise")
                BLAD B 1 A_SetArg(0,args[0]+1) BLAD A 0 A_JumpIf(args[0] == args[2], "raise")
                BLAD B 1 A_SetArg(0,args[0]+1) BLAD A 0 A_JumpIf(args[0] == args[2], "raise")
                loop
            raise:
                TNT1 A 0 A_PlaySoundEx("misc/sunstargroundflame", "Item")
            raiseLoop:
                BLAD A 0 A_PlaySoundEx("8CBLADER", "Weapon")
                BLAD A 0 A_ChangeVelocity(accuracy,0,+accuracy,CVF_REPLACE|CVF_RELATIVE)

                BLAD A 1 A_SetArg(0,args[0]-1) BLAD A 0 A_JumpIf((args[0] <= -16) || (z >= args[1]), "end")
                BLAD A 1 A_SetArg(0,args[0]-1) BLAD A 0 A_JumpIf((args[0] <= -16) || (z >= args[1]), "end")
                BLAD B 1 A_SetArg(0,args[0]-1) BLAD A 0 A_JumpIf((args[0] <= -16) || (z >= args[1]), "end")
                BLAD B 1 A_SetArg(0,args[0]-1) BLAD A 0 A_JumpIf((args[0] <= -16) || (z >= args[1]), "end")
                loop
            end:
                BLAD A 0 A_ChangeVelocity(accuracy,0,0,CVF_REPLACE|CVF_RELATIVE)
                BLAD A 0 A_PlaySoundEx("8CBLADER", "Weapon")
                TNT1 A 0 A_TakeInventory("8c follow me")
                BLAD ABAB 4
                BLAD A 0 A_JumpIf(CallACS("8C", IS_GONE, AAPTR_TARGET), "idle")
                goto see
        }
}

actor "8C Blader contact" : proj {  // : damagerBox
    var int user_PierceRipper; +SERVERSIDEONLY
    damage (6) PoisonDamage 6,1,3 damagetype "8CBlader"
    radius 32 height 62 states {
    spawn: 
        ICES B 0 nodelay ACS_NamedExecuteWithResult("8C", FOLLOW_ACTOR, AAPTR_TARGET)
    idle:
        TNT1 A 1
        TNT1 A 0 A_JumpIfInTargetInventory("8c follow me", 1, "idle")
        stop}}


actor "pouwa" : powerdamage {
    Powerup.Color BlueMap powerup.duration -50
}