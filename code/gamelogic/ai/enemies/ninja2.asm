Ninja2	module
; AI for SPR_NINJA2. As Ninja1, but it adds the teleport: from the
; $30-$38 ring it can vanish and reappear $18 in front of the player,
; facing him, dropping out of the air straight into a slash.
; Point-blank it slashes 50% leaping / 50% advancing.

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Ninja2_B:
		bra.s	EnemyAI_Ninja2

; A routine, run every tick.
EnemyAI_Ninja2_A:
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
; detection box ($60 ahead, $30 behind, $40 lateral), then aggro.
_idle:
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	CheckPlayerInRange
		bcs.s	EnemyAI_Ninja2
		rts

; Aggro / attack-over / hitstun recovery: chase (behaviour 6,
; AIState $10).
EnemyAI_Ninja2:
		bra.w	StartEnemyChase

; State $10: chasing. If the player is already in hitstun just keep
; chasing; otherwise try each move in turn.
_chase:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_playerHurt
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryStance
		bcs.s	_chaseTick
		bsr.s	_tryRetreat
		bcs.s	_chaseTick
		bsr.w	_tryTeleport
		bcs.s	_chaseTick
		bsr.w	_tryMelee

_chaseTick:
		bsr.w	j_j_OnTick
		rts

_playerHurt:
		bra.w	RunChaseBehaviour

; Player in the $38-$40 band ahead, $20 lateral: 38-in-1000 chance to
; square up in the stance (state $20).
_tryStance:
		move.w	#$0040,d5
		move.w	#$FFC8,d6
		move.w	#$0020,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_stanceMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00037,d7
		bhi.s	_stanceMiss
		move.b	#$20,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_stanceMiss:
		tst.b	d0
		rts

; Player in the $30-$38 band ahead, $38 lateral: 13-in-1000 chance to
; back away (state $21, BHVS_RETREAT).
_tryRetreat:
		move.w	#$0038,d5
		move.w	#$FFD0,d6
		move.w	#$0038,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_retreatMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	_retreatMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_RETREAT,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_retreatMiss:
		tst.b	d0
		rts

; Player in the mid-range ring (within $38 but not within $30, all
; around): 13-in-1000 chance to teleport to him (state $22).
_tryTeleport:
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_teleportMiss
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	CheckPlayerInRange
		bcs.s	_teleportMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	_teleportMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_teleportMiss:
		tst.b	d0
		rts

; Player within $30 all around: 50% slash leaping (state $23,
; BHVS_LEAP_ADVANCE), else advancing (state $24, BHVS_ADVANCE).
_tryMelee:
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_meleeMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	_meleeAdvance
		move.b	#$23,AIState(a5)
		move.w	#BHVS_LEAP_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_meleeAdvance:
		move.b	#$24,AIState(a5)
		move.w	#BHVS_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_meleeMiss:
		tst.b	d0
		rts

; States $20+: 0 = stance, 1 = retreat (behaviour ticks), 2 =
; teleport, 3/4 = slash (leaping or advancing).
_attackStates:
		andi.b	#$0F,d0
		beq.s	_stance
		cmpi.b	#$01,d0
		beq.s	_behaviourTick
		cmpi.b	#$02,d0
		beq.s	_teleport
		cmpi.b	#$03,d0
		beq.w	_slash
		bra.w	_slash

; Stance: hold facing the player while he stays in the $38-$40 band,
; alternating two forced frames ($40/$80) every $10 ticks; give up
; after $80 ticks or when he leaves the band.
_stance:
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0040,d5
		move.w	#$FFC8,d6
		move.w	#$0020,d7
		bsr.w	CheckPlayerInRange
		bcc.w	EnemyAI_Ninja2
		addq.b	#$01,AnimPhase(a5)
		move.b	AnimPhase(a5),d0
		cmpi.b	#$80,d0
		beq.w	EnemyAI_Ninja2
		andi.b	#$0F,d0
		cmpi.b	#$01,d0
		bne.s	_stanceRts
		move.b	#$FF,Action1(a5)
		move.b	AnimPhase(a5),d0
		andi.w	#$0010,d0
		addi.b	#$10,d0
		lsl.b	#$02,d0
		move.w	d0,PrevAction(a5)

_stanceRts:
		rts

_behaviourTick:
		bsr.w	j_j_OnTick
		rts

; Teleport: reappear $18 along the player's facing from his centre -
; right in front of him - staying at ground level. Saves the position
; (X, Y and subpixels); if the spot is blocked, restore it and reset.
; Clear: drop in with the ACT_JUMP bit, face him (his facing flipped
; 180) and go straight to the slash (state $23 - the idle behaviour
; is still loaded, so it is a standing slash).
_teleport:
		move.l	(a5),d0
		movem.l	d0,-(sp)
		move.w	(Player_CentreX).l,d1
		move.w	(Player_CentreY).l,d2
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		beq.s	_spotNE
		cmpi.b	#$80,d0
		beq.s	_spotSW
		bhi.s	_spotNW
		addi.w	#$0018,d1	; SE: X + $18
		bra.s	_applySpot

_spotNE:
		subi.w	#$0018,d2	; NE: Y - $18
		bra.s	_applySpot

_spotSW:
		addi.w	#$0018,d2	; SW: Y + $18
		bra.s	_applySpot

_spotNW:
		subi.w	#$0018,d1	; NW: X - $18

_applySpot:
		move.w	d1,d0
		lsr.w	#$04,d1
		move.b	d1,X(a5)
		andi.b	#$0F,d0
		move.b	d0,SubX(a5)
		move.w	d2,d0
		lsr.w	#$04,d2
		move.b	d2,Y(a5)
		andi.b	#$0F,d0
		move.b	d0,SubY(a5)
		movea.l	a5,a1
		jsr	(j_j_CalcSpriteHitbox).l
		jsr	(j_ValidateSpritePosition).l
		bcc.s	_landed
		movem.l	(sp)+,d0
		move.l	d0,(a5)
		movea.l	a5,a1
		jsr	(j_j_CalcSpriteHitbox).l
		bra.w	EnemyAI_Ninja2

_landed:
		bset	#$05,Action1(a5)	; ACT_JUMP bit - drop in from the air
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		eori.b	#DIR_FLIP,d0
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d0,RotationAndSize(a5)
		movem.l	(sp)+,d0
		move.b	#$23,AIState(a5)
		rts

; Slash: ACT_ATTACK1 windup for $F ticks, then the hit box ($19
; ahead, 9 behind, 9 lateral) is live with ACT_ATTACK2 each tick
; until tick $1E, then back to chasing. Runs the behaviour, so the
; leap and advance variants keep moving.
_slash:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	_slashTick
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcs.s	_slashTick
		beq.w	EnemyAI_Ninja2

_slashTick:
		bsr.w	j_j_OnTick
		rts

		modend
