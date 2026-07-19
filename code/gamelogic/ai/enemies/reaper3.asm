Reaper3	module
; AI for SPR_REAPER3. The strongest reaper: it acts every $1E ticks,
; each teleport is 401-in-1000, and the fireball's AttackStrength is
; $800 - the hardest-hitting projectile of the regular enemies.

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Reaper3_B:
		bra.s	EnemyAI_Reaper3

; A routine, run every tick.
EnemyAI_Reaper3_A:
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

; State 0: run the placed behaviour until the player comes within
; $100 in every direction, then aggro.
_idle:
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0100,d5
		move.w	#$0100,d6
		move.w	#$0100,d7
		bsr.w	CheckPlayerInRange
		bcs.s	EnemyAI_Reaper3
		rts

; Aggro / attack-over / hitstun recovery: chase (behaviour 6,
; AIState $10).
EnemyAI_Reaper3:
		bra.w	StartEnemyChase

; State $10: hidden and frozen (no behaviour tick) while AICounter
; runs up to $1E; then act - appear and cast if the player is ahead,
; else roll the two teleports.
_chase:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_playerHurt
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$1E,AICounter(a5)
		bcs.s	_stayHidden
		clr.b	AICounter(a5)
		bsr.s	_tryCastInPlace
		bcs.s	_chaseTick
		ori.b	#$40,InteractFlags(a5)
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)
		bsr.s	_tryTeleportBehind
		bcs.s	_chaseTick
		bsr.w	_tryTeleportFront

_chaseTick:
		bsr.w	j_j_OnTick
		rts

; Countdown tick: keep hidden (InteractFlags bit 6) at the floating
; height, without running the behaviour.
_stayHidden:
		ori.b	#$40,InteractFlags(a5)
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)
		rts

_playerHurt:
		bra.w	RunChaseBehaviour

; Player in the $48-$60 band ahead, $10 lateral: appear right here
; and cast (state $20).
_tryCastInPlace:
		move.w	#$0060,d5
		move.w	#$FFB8,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_castInPlaceMiss
		move.b	#$20,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_castInPlaceMiss:
		tst.b	d0
		rts

; 401-in-1000 chance to teleport in behind the player (state $21).
_tryTeleportBehind:
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00400,d7
		bhi.s	_teleBehindMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts

_teleBehindMiss:
		tst.b	d0
		rts

; 401-in-1000 chance to teleport in facing the player (state $22).
_tryTeleportFront:
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00400,d7
		bhi.s	_teleFrontMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts

_teleFrontMiss:
		tst.b	d0
		rts

; States $20+: 0 = appear and cast, 1 = teleport behind the player,
; 2+ = teleport in front of him.
_attackStates:
		clr.b	AnimPhase(a5)
		andi.b	#$0F,d0
		beq.w	_cast
		cmpi.b	#$01,d0
		beq.s	_teleportBehind
		cmpi.b	#$02,d0
		beq.w	_teleportFront
		cmpi.b	#$03,d0
		beq.w	_teleportFront
		bra.w	_teleportFront

; Teleport behind: the spot is $68 in the direction the player is
; facing *away* from (his facing flipped 180), and the reaper will
; face the same way as him - at his back. Saves the position (X, Y
; and subpixels) in case the spot is blocked.
_teleportBehind:
		move.l	(a5),d0
		movem.l	d0,-(sp)
		move.b	(Player_RotationAndSize).l,d0
		eori.b	#DIR_FLIP,d0
		clr.b	d1
		bra.s	_teleportPlace

; Teleport in front: the spot is $68 in the player's facing
; direction, and the reaper will face him (d1 = $80 flips the facing
; below).
_teleportFront:
		move.l	(a5),d0
		movem.l	d0,-(sp)
		move.b	(Player_RotationAndSize).l,d0
		move.b	#$80,d1

; Compute the spot (player centre + $68 in direction d0), drop to
; the floor there and validate. Blocked: restore the old position
; and the floating height, and go back to waiting. Clear: land with
; a hop (ACT_JUMP bit), set the facing (player's facing eor d1) and
; cast (state $20).
_teleportPlace:
		movem.w	d1,-(sp)
		move.w	(Player_CentreX).l,d1
		move.w	(Player_CentreY).l,d2
		andi.b	#$C0,d0
		beq.s	_spotNE
		cmpi.b	#$80,d0
		beq.s	_spotSW
		bhi.s	_spotNW
		addi.w	#$0068,d1	; SE: X + $68
		bra.s	_applySpot

_spotNE:
		subi.w	#$0068,d2	; NE: Y - $68
		bra.s	_applySpot

_spotSW:
		addi.w	#$0068,d2	; SW: Y + $68
		bra.s	_applySpot

_spotNW:
		subi.w	#$0068,d1	; NW: X - $68

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
		clr.w	d0
		move.b	FloorHeight(a5),d0
		move.w	d0,Z(a5)
		addi.w	#$001F,d0
		move.w	d0,HitBoxZEnd(a5)
		movea.l	a5,a1
		jsr	(j_j_CalcSpriteHitbox).l
		jsr	(j_ValidateSpritePosition).l
		bcc.s	_landed
		movem.w	(sp)+,d1
		movem.l	(sp)+,d0
		move.l	d0,(a5)
		movea.l	a5,a1
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)
		jsr	(j_j_CalcSpriteHitbox).l
		bra.w	EnemyAI_Reaper3

_landed:
		movem.w	(sp)+,d1
		bset	#$05,Action1(a5)	; ACT_JUMP bit - drop in from the air
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		eor.b	d1,d0
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d0,RotationAndSize(a5)
		movem.l	(sp)+,d0
		move.b	#$20,AIState(a5)
		clr.b	AICounter(a5)
		rts

; Cast: become visible again (clear bit 6) pinned to the floor, then
; the fireball sequence driven by AICounter: tick 1 - casting pose
; (ACT_ATTACK1) and load the fireball's flame graphics (shared
; with the Magic Sword's burn animation) to VRAM $9880 (tail call); tick 2 - load the
; projectile palette; tick $2D - throwing pose (ACT_ATTACK2) and
; spawn the fireball (type 1, AttackStrength $800; abort if no free
; slot); then recover until tick $46.
_cast:
		andi.b	#$BF,InteractFlags(a5)
		clr.w	d0
		move.b	FloorHeight(a5),d0
		move.w	d0,Z(a5)
		addi.w	#$001F,d0
		move.w	d0,HitBoxZEnd(a5)
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$01,AICounter(a5)
		bne.s	_castPalette
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		lea	($00009880).l,a2
		move.b	#ITM_MAGICSWORD,d0
		jmp	(j_LoadMagicSwordEffect).l

_castPalette:
		cmpi.b	#$02,AICounter(a5)
		bne.w	_castThrow
		move.b	#$01,d0
		bra.w	LoadProjectilePalette

_castThrow:
		cmpi.b	#$2D,AICounter(a5)
		bhi.w	_castRecover
		bcs.w	_castWait
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		move.b	#$01,d0
		move.w	#$0800,d1
		bsr.w	SpawnSmallProjectile
		bcs.w	_castDone
		rts

_castRecover:
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$46,AICounter(a5)
		beq.w	_castDone

_castWait:
		rts

_castDone:
		clr.b	AICounter(a5)
		bra.w	EnemyAI_Reaper3

		modend
