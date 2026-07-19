Ifrit	module
; AI for SPR_IFRIT, the fire boss. He lives on a grid of four lava
; pits (the IfritCoordinates table: cells $1B1D, $221D, $1B24, $2224)
; and never walks - each tick in his ready state he rolls for one of:
; a dash (11%) - an invincible no-clip glide to the adjacent pit his
; facing points at (BHVS_DASH_NE/SE/SW/NW picked from which pit he is
; in); a teleport (21%) - sinking down, vanishing, and surfacing in a
; random other pit facing the player; or a fireball cast (the rest -
; always): 75% a single medium fireball (SPR_IFRITFIREBALL,
; AttackStrength $F00, BHVS_PROJECTILE_64), 25% a spread of three
; (straight, weave clockwise, weave anticlockwise) from the three
; cells ahead of him. Being hurt pins him in place (Speed cleared).

; B routine (behaviour command $2B): reset, then teleport away.
EnemyAI_Ifrit_B:
		bra.s	EnemyAI_Ifrit

; A routine, run every tick.
EnemyAI_Ifrit_A:
		btst	#$01,InteractFlags(a5)
		bne.s	_hurtTick
		move.b	AIState(a5),d0
		beq.s	EnemyAI_Ifrit
		cmpi.b	#$10,d0
		beq.s	_chooseMove
		bra.w	_attackStates

_hurtTick:
		clr.b	Speed(a5)
		bsr.w	j_j_OnTick
		rts

; Fresh fight (state 0) or B routine: reset, then open with the
; teleport.
EnemyAI_Ifrit:
		bsr.s	_reset
		bra.w	_startTeleport

; Reset: drop the invincibility and alternate-bank flags, stand on
; the idle behaviour in the ready state ($10).
_reset:
		bclr	#$06,CombatFlags(a5)
		bclr	#$00,CombatFlags(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		rts

; State $10: standing in his pit, rolling for the next move. (The
; fourth call is never reached - the fireball try always succeeds.)
_chooseMove:
		bclr	#$00,CombatFlags(a5)
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryDash
		bcs.s	_moveTick
		bsr.w	_tryTeleport
		bcs.s	_moveTick
		bsr.w	_tryFireball
		bcs.s	_moveTick
		bsr.w	_tripleFireball

_moveTick:
		bsr.w	j_j_OnTick
		rts

; 11-in-100: dash to an adjacent pit (state $21). The pit he is in
; (X:Y cell) and his current facing select the dash: each pit allows
; the two directions along the pit grid, and the roll is wasted if
; he faces a diagonal with no neighbour.
_tryDash:
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00010,d7
		bhi.w	_dashMiss
		move.b	RotationAndSize(a5),d0
		andi.b	#DIR_MASK,d0
		cmpi.w	#$1B1D,X(a5)
		beq.s	_dashFromNorth
		cmpi.w	#$221D,X(a5)
		beq.s	_dashFromEast
		cmpi.w	#$1B24,X(a5)
		beq.s	_dashFromWest
		move.w	#BHVS_DASH_NE,d1	; south pit ($2224)
		tst.b	d0
		beq.s	_startDash
		move.w	#BHVS_DASH_NW,d1
		cmpi.b	#$C0,d0
		beq.s	_startDash
		bra.s	_dashMiss

_dashFromNorth:
		move.w	#BHVS_DASH_SE,d1
		cmpi.b	#$40,d0
		beq.s	_startDash
		move.w	#BHVS_DASH_SW,d1
		cmpi.b	#$80,d0
		beq.s	_startDash
		bra.s	_dashMiss

_dashFromEast:
		move.w	#BHVS_DASH_SW,d1
		cmpi.b	#$80,d0
		beq.s	_startDash
		move.w	#BHVS_DASH_NW,d1
		cmpi.b	#$C0,d0
		beq.s	_startDash
		bra.s	_dashMiss

_dashFromWest:
		move.w	#BHVS_DASH_SE,d1
		cmpi.b	#$40,d0
		beq.s	_startDash
		move.w	#BHVS_DASH_NE,d1
		tst.b	d0
		beq.s	_startDash
		bra.s	_dashMiss

_startDash:
		move.b	#$21,AIState(a5)
		move.w	d1,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		bset	#$00,CombatFlags(a5)
		bset	#$06,CombatFlags(a5)
		ori	#$01,ccr
		rts

_dashMiss:
		tst.b	d0
		rts

; 21-in-100: teleport to another pit (state $22, invincible).
_tryTeleport:
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00020,d7
		bhi.s	_teleportMiss

_startTeleport:
		move.b	#$22,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		bset	#$00,CombatFlags(a5)
		ori	#$01,ccr
		rts

_teleportMiss:
		tst.b	d0
		rts

; The fireball: 75-in-100 a single one (state $23), else fall into
; the spread of three. Both face the player first.
_tryFireball:
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00075,d7
		bcc.s	_tripleFireball
		move.b	#$23,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		bsr.s	_facePlayer
		ori	#$01,ccr
		rts

; The spread of three (state $24). The range-box loads are a dead
; leftover - nothing checks them.
_tripleFireball:
		move.w	#$0040,d5
		move.w	#$FFF0,d6
		move.w	#$0010,d7
		move.b	#$24,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		bsr.s	_facePlayer
		ori	#$01,ccr
		rts

; Unreachable leftover: an orphaned miss exit.
		tst.b	d0
		rts

; Turn to face the player (quadrant from GetDirToPlayer).
_facePlayer:
		bsr.w	GetDirToPlayer
		move.b	d2,d1
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d2,RotationAndSize(a5)
		rts

; States $20+: 0 = nothing, 1 = dash, 2 = teleport, 3 = single
; fireball, 4+ = the spread of three.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_stateRts
		cmpi.b	#$01,d0
		beq.s	_dash
		cmpi.b	#$02,d0
		beq.w	_teleport
		cmpi.b	#$03,d0
		beq.w	_castOne
		bra.w	_castThree

_stateRts:
		rts

; Dash: invincible in the alternate animation bank while the dash
; behaviour glides him to the next pit; poses ACT_ATTACK3/4/5 with a
; Z hop (+$10 at tick $F, back down at $1D), done at tick $27.
_dash:
		bset	#$00,CombatFlags(a5)
		bset	#$06,CombatFlags(a5)
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$05,AICounter(a5)
		bcs.w	_dashTick
		cmpi.b	#$0F,AICounter(a5)
		bne.s	_dashMid
		move.w	#ACT_ATTACK5,QueuedAction(a5)
		addi.w	#$0010,Z(a5)
		bra.w	_dashTick

_dashMid:
		move.w	#ACT_ATTACK4,QueuedAction(a5)
		cmpi.b	#$10,AICounter(a5)
		bcs.w	_dashTick
		clr.w	QueuedAction(a5)
		cmpi.b	#$1D,AICounter(a5)
		bcs.w	_dashTick
		bne.s	_dashDown
		subi.w	#$0010,Z(a5)

_dashDown:
		move.w	#ACT_ATTACK4,QueuedAction(a5)
		cmpi.b	#$22,AICounter(a5)
		bcs.w	_dashTick
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		cmpi.b	#$27,AICounter(a5)
		bcs.w	_dashTick
		bra.w	_reset

_dashTick:
		bsr.w	j_j_OnTick
		bclr	#$07,AnimCtrl(a5)
		rts

; Teleport: sink (ACT_ATTACK6, then ACT_ATTACK7 from tick 5),
; vanish at $F (InteractFlags bit 6) and jump to a random pit from
; the table - stepping to the next one if it rolled the pit he is
; already in - centred in the cell (SubX/SubY $0808). Surface at
; $14, facing the player; hold ACT_ATTACK6 until $1E, then reset.
_teleport:
		bset	#$00,CombatFlags(a5)
		move.w	#ACT_ATTACK6,QueuedAction(a5)
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$05,AICounter(a5)
		bcs.w	_teleRts
		move.w	#ACT_ATTACK7,QueuedAction(a5)
		cmpi.b	#$0F,AICounter(a5)
		bcs.s	_teleRts
		bhi.s	_teleSurface
		bset	#$06,InteractFlags(a5)
		move.w	#00004,d6
		jsr	(j_GenerateRandomNumber).l
		add.b	d7,d7
		move.w	IfritCoordinates(pc,d7.w),d6
		cmp.w	X(a5),d6
		bne.s	_telePlace
		addq.b	#$02,d7
		andi.b	#$06,d7
		move.w	IfritCoordinates(pc,d7.w),d6

_telePlace:
		move.w	d6,X(a5)
		move.w	#$0808,SubX(a5)
		movea.l	a5,a1
		jsr	(j_j_CalcSpriteHitbox).l
		rts

; The four lava pits (X:Y cells).
IfritCoordinates:dc.w $1B1D
		dc.w $221D
		dc.w $1B24
		dc.w $2224

_teleSurface:
		cmpi.b	#$14,AICounter(a5)
		bcs.s	_teleRts
		bhi.s	_teleRecover
		bsr.w	_facePlayer
		bclr	#$06,InteractFlags(a5)
		rts

_teleRecover:
		move.w	#ACT_ATTACK6,QueuedAction(a5)
		cmpi.b	#$1E,AICounter(a5)
		bcs.s	_teleRts
		beq.w	_reset

_teleRts:
		rts

; Single fireball (state 3): casting pose (ACT_ATTACK1); tick 1 -
; load the flame graphics (shared with the Magic Sword's burn
; animation) to VRAM $9880 (tail call); tick 2 - the projectile
; palette; tick $A - throw (ACT_ATTACK2): one straight-flying
; fireball; recover until tick $14.
_castOne:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$01,AICounter(a5)
		bne.s	_cast1Palette
		lea	($00009880).l,a2
		move.b	#ITM_MAGICSWORD,d0
		jmp	(j_LoadMagicSwordEffect).l

_cast1Palette:
		cmpi.b	#$02,AICounter(a5)
		bne.w	_cast1Throw
		move.b	#$01,d0
		bra.w	LoadProjectilePalette

_cast1Throw:
		cmpi.b	#$0A,AICounter(a5)
		bhi.w	_cast1Recover
		bcs.w	_cast1Rts
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		move.w	#BHVS_PROJECTILE_64,d6
		bsr.w	_spawnFireball
		bcs.w	_castDone
		rts

_cast1Recover:
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$14,AICounter(a5)
		beq.w	_castDone

_cast1Rts:
		rts

_castDone:
		clr.b	AICounter(a5)
		bra.w	_reset

; The spread of three (state 4+): as the single cast, but the throw
; comes at tick $10 - one straight, one weaving clockwise, one
; anticlockwise, from the three cells ahead - and recovery runs to
; tick $20.
_castThree:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$01,AICounter(a5)
		bne.s	_cast3Palette
		lea	($00009880).l,a2
		move.b	#ITM_MAGICSWORD,d0
		jmp	(j_LoadMagicSwordEffect).l

_cast3Palette:
		cmpi.b	#$02,AICounter(a5)
		bne.w	_cast3Throw
		move.b	#$01,d0
		bra.w	LoadProjectilePalette

_cast3Throw:
		cmpi.b	#$10,AICounter(a5)
		bhi.w	_cast3Recover
		bcs.w	_cast3Rts
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		move.w	#BHVS_PROJECTILE_64,d6
		bsr.s	_spawnFireball
		bcs.w	_cast3Done
		move.w	#BHVS_PROJECTILE_WEAVE_CW,d6
		bsr.s	_spawnFireball
		bcs.w	_cast3Done
		move.w	#BHVS_PROJECTILE_WEAVE_CCW,d6
		bsr.s	_spawnFireball
		rts

_cast3Recover:
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$20,AICounter(a5)
		beq.w	_cast3Done

_cast3Rts:
		rts

_cast3Done:
		clr.b	AICounter(a5)
		bra.w	_reset

; Spawn one medium fireball with behaviour d6. The spawn cell is one
; ahead of Ifrit's facing; the weave-clockwise one starts one cell
; further to one side, the anticlockwise one to the other, so the
; spread fans out. Set up: SPR_IFRITFIREBALL, AttackStrength $F00,
; $20 above his Z, tiles at $24B4, speed 4, no gravity (FallRate
; $80), invincible, and InteractFlags bit 7 (kept in the Init copy
; too). Carry set if no free slot.
_spawnFireball:
		move.b	RotationAndSize(a5),d2
		movem.w	d6,-(sp)
		movem.w	d2,-(sp)
		jsr	(j_FindFreeSpriteSlot).l
		movem.w	(sp)+,d1
		movem.w	(sp)+,d6
		bcs.w	_spawnFail
		move.w	(a5),d0
		andi.b	#$C0,d1
		beq.s	_aimNE
		cmpi.b	#$80,d1
		bcs.s	_aimSE
		beq.s	_aimSW
		subi.w	#$0100,d0	; NW: X - 1
		cmpi.w	#BHVS_PROJECTILE_64,d6
		beq.s	_spawn
		subi.w	#$0001,d0
		cmpi.w	#BHVS_PROJECTILE_WEAVE_CW,d6
		beq.s	_spawn
		addi.w	#$0002,d0
		bra.s	_spawn

_aimNE:
		subq.b	#$01,d0		; NE: Y - 1
		cmpi.w	#BHVS_PROJECTILE_64,d6
		beq.s	_spawn
		addi.w	#$0100,d0
		cmpi.w	#BHVS_PROJECTILE_WEAVE_CW,d6
		beq.s	_spawn
		subi.w	#$0200,d0
		bra.s	_spawn

_aimSE:
		addi.w	#$0100,d0	; SE: X + 1
		cmpi.w	#BHVS_PROJECTILE_64,d6
		beq.s	_spawn
		addi.w	#$0001,d0
		cmpi.w	#BHVS_PROJECTILE_WEAVE_CW,d6
		beq.s	_spawn
		subi.w	#$0002,d0
		bra.s	_spawn

_aimSW:
		addq.b	#$01,d0		; SW: Y + 1
		cmpi.w	#BHVS_PROJECTILE_64,d6
		beq.s	_spawn
		subi.w	#$0100,d0
		cmpi.w	#BHVS_PROJECTILE_WEAVE_CW,d6
		beq.s	_spawn
		addi.w	#$0200,d0

_spawn:
		move.w	d0,X(a1)
		move.b	d1,RotationAndSize(a1)
		move.b	#SPR_IFRITFIREBALL,d2
		move.w	#$0F00,AttackStrength(a1)
		move.w	Z(a5),d3
		addi.w	#$0020,d3
		move.w	d3,Z(a1)
		move.w	SubX(a5),SubX(a1)
		move.w	#$24B4,TileSource(a1)
		move.w	d6,BehaviourLUTIndex(a1)
		move.b	#$04,Speed(a1)
		move.b	#$80,FallRate(a1)
		jsr	(j_InitSpawnedSprite).l
		bset	#$00,CombatFlags(a1)
		bset	#$07,InteractFlags(a1)
		bset	#$07,InitInteractFlags(a1)
		tst.b	d0
		rts

_spawnFail:
		ori	#$01,ccr
		rts

		modend
