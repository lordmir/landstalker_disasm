StoneWarrior	module
; AI for SPR_STONEWARRIOR1 and SPR_STONEWARRIOR2, the stone and gold
; warriors - both jump-table entries route here, so the gold warrior
; encounter runs exactly the same AI (only the sprite and placement
; stats differ). Two moves: a leap-slam (BHVS_POUNCE, invincible
; while airborne, landing with a heavy thud and a screen shake), and
; the hammer floor-strike - raise (ACT_ATTACK1), swing (ACT_ATTACK2)
; and hold the hammer on the ground (ACT_ATTACK3, $19 box live) with
; a mini earthquake that stuns the player anywhere in the room,
; unless he is in the air when it hits. After hitstun, its reset
; turns it 180 degrees and pounces - a retaliation leap.

; B routine (behaviour command $2B) / hitstun recovery: resume the
; chase, then turn 180 and pounce.
EnemyAI_StoneWarrior_B:
		bra.s	EnemyAI_StoneWarrior

; A routine, run every tick.
EnemyAI_StoneWarrior_A:
		btst	#$01,InteractFlags(a5)
		bne.s	_hurtTick
		move.b	AIState(a5),d0
		beq.s	_idle
		cmpi.b	#$10,d0
		beq.s	_chase
		bra.w	_attackStates

_hurtTick:
		bsr.w	j_j_OnTick
		rts

; State 0: run the placed behaviour until the player enters the
; detection box ($60 ahead, $20 behind, $30 lateral), then aggro.
_idle:
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	CheckPlayerInRange
		bcs.s	_startChase
		rts

; The retaliation reset: chase, but flipped 180 - straight into the
; pounce.
EnemyAI_StoneWarrior:
		bsr.s	_startChase
		eori.b	#DIR_FLIP,RotationAndSize(a5)
		bra.w	_startPounce

_startChase:
		bra.w	StartEnemyChase

; State $10: chasing. If the player is already in hitstun just keep
; chasing; otherwise try the long-range quake, then the melee.
_chase:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_playerHurt
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.w	_tryQuakeFar
		bcs.s	_chaseTick
		bsr.w	_tryMelee

_chaseTick:
		bsr.w	j_j_OnTick
		rts

_playerHurt:
		bra.w	RunChaseBehaviour

; Player in the ring within $80 but not within $30, all around:
; 7-in-1000 chance to strike the floor from afar (state $24) - the
; quake stuns at any range.
_tryQuakeFar:
		move.w	#$0080,d5
		move.w	#$0080,d6
		move.w	#$0080,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_quakeFarMiss
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	CheckPlayerInRange
		bcs.s	_quakeFarMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00006,d7
		bhi.s	_quakeFarMiss
		move.b	#$24,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_quakeFarMiss:
		tst.b	d0
		rts

; Player within $20 ahead, $8 lateral: 50% leap-slam (state $23,
; BHVS_POUNCE), else the hammer floor-strike (state $24).
_tryMelee:
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_meleeMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	_meleeQuake

_startPounce:
		move.b	#$23,AIState(a5)
		move.w	#BHVS_POUNCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_meleeQuake:
		move.b	#$24,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_meleeMiss:
		tst.b	d0
		rts

; States $20+: 0 = plain pounce (unreachable leftover - no move sets
; a state that dispatches here), 1/2 = behaviour tick (also unused),
; 3 = leap-slam, 4+ = hammer floor-strike.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_pounceLand
		cmpi.b	#$01,d0
		beq.s	_behaviourTick
		cmpi.b	#$02,d0
		beq.s	_behaviourTick
		cmpi.b	#$03,d0
		beq.s	_slam
		bra.s	_quake

_pounceLand:
		move.b	Action1(a5),d0
		andi.b	#$30,d0
		beq.w	_startChase

_behaviourTick:
		bsr.w	j_j_OnTick
		rts

; Leap-slam: invincible (CombatFlags bit 0) while airborne, riding
; the pounce behaviour. On landing: first tick plays the heavy thud
; (SND_DoorLock) in the slam pose (ACT_ATTACK4); the next tick shakes
; the screen and returns to the chase. Contact does the damage.
_slam:
		bclr	#$00,CombatFlags(a5)
		move.b	Action1(a5),d0
		andi.b	#$30,d0
		beq.w	_slamLanded
		bset	#$00,CombatFlags(a5)
		bsr.w	j_j_OnTick
		rts

_slamLanded:
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$01,AICounter(a5)
		bne.s	_slamShake
		trap	#$00			  ; Trap00Handler
		dc.w SND_DoorLock
		move.w	#ACT_ATTACK4,QueuedAction(a5)
		rts

_slamShake:
		bsr.s	ScreenShake
		bra.w	_startChase

; Hammer floor-strike: raise the hammer (ACT_ATTACK1) until tick $F,
; then swing (ACT_ATTACK2, AICounter now counts up 2 per tick); the
; thud (SND_DoorLock) sounds at $1E, and from there the hammer's hit
; box ($19 ahead, 9 behind, 9 lateral) is live each tick with the
; hammer-down pose (ACT_ATTACK3). At $20, the earthquake: shake the
; screen and stun the player (forced input playback 8) - but only if
; he is standing on the ground (jumping dodges it) and not already in
; hitstun. Recover until $2D.
_quake:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$0F,AICounter(a5)
		bcs.w	_quakeRts
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$1E,AICounter(a5)
		bcs.w	_quakeRts
		bne.s	_quakeHit
		trap	#$00			  ; Trap00Handler
		dc.w SND_DoorLock

_quakeHit:
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		cmpi.b	#$20,AICounter(a5)
		bne.w	_quakeEnd
		bsr.w	ScreenShake
		move.b	(Player_Z+1).l,d0
		cmp.b	(Player_FloorHeight).l,d0
		bne.s	_quakeNoStun
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_quakeNoStun
		move.b	#$08,d0			  ; Stun player
		jsr	(j_PlaybackInput).l

_quakeNoStun:
		tst.b	d0
		rts

        include         "code/gamelogic/ai/screenshake.asm"

_quakeEnd:
		cmpi.b	#$2D,AICounter(a5)
		bcs.s	_quakeRts
		bra.w	_startChase

; Unreachable leftover: an orphaned success return.
		ori	#$01,ccr
		rts

_quakeRts:
		rts

		modend
