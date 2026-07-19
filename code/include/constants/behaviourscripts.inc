; Behaviour script IDs (BehaviourLUTIndex values) that the code loads
; directly. The scripts themselves live in the SpriteBehaviourTable
; binary (see behav\behaviourN.yaml for the decoded scripts, and
; docs\behaviour_commands.md for the command set). "AI" below = the
; script ends with RunSpecialAI, handing control to the sprite's
; EnemyAI_*_B routine; "idle" = it ends with Pause(0), stopping forever.

BHVS_IDLE:                  equ $000 ; pause forever
BHVS_SHOP_ITEM:             equ $002 ; ShopItem (default for room item sprites)
BHVS_WANDER:                equ $004 ; walk until collision, turn randomly, repeat
BHVS_CHASE_NO_JUMP:         equ $005 ; follow the player (no ledge jumps), forever
BHVS_CHASE:                 equ $006 ; follow the player with ledge jumps, forever
BHVS_PAUSE_60_AI:           equ $007 ; stand still for 60 ticks, AI
BHVS_RETREAT:               equ $008 ; turn 180, walk 32 ticks, AI
BHVS_HOP:                   equ $009 ; jump, then idle
BHVS_KNOCKBACK_NE:          equ $00A ; face SW, slide NE 16 ticks at speed 2, AI
BHVS_KNOCKBACK_SE:          equ $00B ; face NW, slide SE 16 ticks at speed 2, AI
BHVS_KNOCKBACK_SW:          equ $00C ; face NE, slide SW 16 ticks at speed 2, AI
BHVS_KNOCKBACK_NW:          equ $00D ; face SE, slide NW 16 ticks at speed 2, AI
BHVS_POUNCE:                equ $00E ; jump + run forward 32 ticks
BHVS_ADVANCE:               equ $011 ; walk forward 32 ticks, AI
BHVS_LEAP_ADVANCE:          equ $012 ; jump, walk forward 32 ticks, AI
BHVS_PAUSE_32_AI:           equ $013 ; stand still for 32 ticks, AI
BHVS_RUSH_24:               equ $014 ; walk forward 24 ticks at speed 2, AI
BHVS_RUSH_28:               equ $015 ; walk forward 28 ticks at speed 2, AI
BHVS_WAIT_RUSH:             equ $016 ; pause 32, then walk 24 ticks at speed 2, AI
BHVS_BACKSTEP:              equ $017 ; turn 180, walk 16 at speed 2, turn back, AI
BHVS_CHASE_BURST:           equ $018 ; follow the player for 16 ticks, AI
BHVS_RUN_JUMP:              equ $019 ; run 16 at speed 2, jump, run 24, AI
BHVS_RUSH_40:               equ $01A ; walk forward 40 ticks at speed 2, AI
BHVS_HOP_AI:                equ $01B ; jump, AI
BHVS_FLEE_RANDOM:           equ $01C ; random turn, flee 32 ticks at speed 2, AI
BHVS_FLEE_FAST:             equ $01D ; turn 180, flee 32 ticks at speed 4, AI
BHVS_FLEE_FASTER:           equ $01E ; turn 180, flee 32 ticks at speed 8, AI
BHVS_RUSH_40_2:             equ $01F ; identical to BHVS_RUSH_40
BHVS_RANDOM_STEP:           equ $020 ; random turn, walk 16 ticks, idle
BHVS_CHASE_BRIEF:           equ $021 ; follow the player for 32 ticks, idle
BHVS_HOP_CHASE:             equ $022 ; jump, follow the player for 32 ticks, idle
BHVS_KNOCKBACK_BACK:        equ $0E3 ; turn 180, slide back 15 ticks at speed 2, AI
BHVS_PLAYER_PROJECTILE:     equ $13C ; no gravity, fly 32 ticks hitting enemies, despawn
BHVS_ENEMY_HITSTUN:         equ $13E ; pause 16 ticks, AI (loaded on every enemy hit)
BHVS_WALK_START_CUTSCENE:   equ $14D ; walk to ($130,$150), face SE, start lo cutscene $31
BHVS_BACK_LEAP:             equ $17F ; jump away walking backwards, AI
BHVS_RESUME_CHASE:          equ $180 ; clear walk-backwards, then follow forever
BHVS_STUTTER_CHASE:         equ $181 ; 3x {pause 16, follow 40}, AI
BHVS_ENEMY_PROJECTILE:      equ $21C ; no gravity, fly 32 ticks with contact damage, despawn
BHVS_FLEE_8:                equ $266 ; flee 8 ticks at speed 4, idle
BHVS_CHASE_8:               equ $267 ; follow 8 ticks at speed 4, idle
BHVS_ENEMY_HITSTUN_2:       equ $268 ; identical to BHVS_ENEMY_HITSTUN
BHVS_CHARGE_TO_WALL:        equ $320 ; charge at speed 8 until collision, AI
BHVS_PROJECTILE_64:         equ $345 ; fly straight 64 ticks, despawn (Ifrit's fireball)
BHVS_PROJECTILE_WEAVE_CW:   equ $346 ; weave clockwise 64 ticks, despawn
BHVS_PROJECTILE_WEAVE_CCW:  equ $347 ; weave anticlockwise 64 ticks, despawn
BHVS_DASH_NE:               equ $34A ; pause 15, face NE, no-clip dash 14 at speed 8, idle
BHVS_DASH_SE:               equ $34B ; pause 15, face SE, no-clip dash 14 at speed 8, idle
BHVS_DASH_SW:               equ $34C ; pause 15, face SW, no-clip dash 14 at speed 8, idle
BHVS_DASH_NW:               equ $34D ; pause 15, face NW, no-clip dash 14 at speed 8, idle
BHVS_DESCEND_6:             equ $361 ; move down 6.0, idle
BHVS_ASCEND_15:             equ $362 ; move up 15.0, idle
BHVS_FORWARD_12:            equ $363 ; move forward 12.5, idle
BHVS_KNOCK_UP:              equ $364 ; launched upward 16 ticks, AI
BHVS_BOOMERANG:             equ $36A ; fly out 32 ticks, turn 180, fly back 32, despawn
BHVS_PAUSE_60_AI_IDLE:      equ $383 ; stand 60 ticks, AI once, then idle
BHVS_PAUSE_30_AI_IDLE:      equ $384 ; stand 30 ticks, AI once, then idle
