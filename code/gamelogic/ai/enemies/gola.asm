Gola	module
; AI for SPR_GOLA, the final boss - the fire-breathing dragon god.
; The sprite is only her head; the body and tail are part of the
; stage background, and her Z height drives the move set: very high
; (>= $F0) she swoops down to the north or west edge of the arena,
; aligned with the player (BHVS_DESCEND_6); high (>= $94) she can
; lash her tail - an earthquake animated by background tile swaps
; (j_DoTileSwap 8, then $10) around a ScreenShake that stuns the
; player if he is on the ground, and if the stun lands she dives to
; $38 beside him and breathes fire in his face; low (< $64) she
; spits large fireballs (SPR_GOLAFIREBALL, AttackStrength $1400) -
; one while advancing along her edge steering toward the player
; (BHVS_FORWARD_12), or the spread of three (straight,
; diagonally right, diagonally left) - and rises away (BHVS_ASCEND_15)
; with a chance that grows as the player closes in on her corner.
; The flame breath (state $22) spits a level-flying fireball
; (BHVS_PROJECTILE_LEVEL) every 3 ticks while the room's backdrop
; pulses deep red (CRAM colours 0 and 15).

; B routine (behaviour command $2B): reset and rise away.
EnemyAI_Gola_B:
		bra.s	EnemyAI_Gola

; A routine, run every tick. Speed is pinned to 2.
EnemyAI_Gola_A:
		move.b	#$02,Speed(a5)
		btst	#$01,InteractFlags(a5)
		bne.s	_hurtTick
		move.b	AIState(a5),d0
		beq.s	_think
		cmpi.b	#$10,d0
		beq.s	_think
		bra.w	_attackStates

_hurtTick:
		bsr.w	j_j_OnTick
		rts

EnemyAI_Gola:
		bsr.s	_reset
		bra.w	_startRise

; Reset: drop the flags, idle behaviour, ready state ($10), and
; black out CRAM colours 0 and 15 (the fire glow).
_reset:
		bclr	#$06,CombatFlags(a5)
		bclr	#$00,CombatFlags(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		move.l	#$C0000000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_DATA_REG).l
		move.l	#$C01E0000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_DATA_REG).l
		rts

; States 0 and $10: pick the next move (all gated on her height).
; Note the advance try skips even the behaviour tick on success.
_think:
		bsr.w	_tryTriple
		bcs.s	_thinkTick
		bsr.w	_tryQuake
		bcs.s	_thinkTick
		bsr.s	_trySwoop
		bcs.s	_thinkTick
		bsr.w	_tryBreath
		bcs.s	_thinkTick
		bsr.w	_tryAdvance
		bcs.s	_thinkRts
		bsr.w	_tryRise

_thinkTick:
		bsr.w	j_j_OnTick

_thinkRts:
		rts

; Head low (Z < $64): 50% chance to spit the spread of three (state
; $27).
_tryTriple:
		cmpi.w	#$0064,Z(a5)
		bcc.w	_lowMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.w	_lowMiss
		move.b	#$27,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		trap	#$00			  ; Trap00Handler
		dc.w SND_Slash1
		ori	#$01,ccr
		rts

; Head very high (Z >= $F0): swoop - reposition to the north edge
; (player's X, Y = $16, facing SW) or the west edge (X = $19,
; player's Y, facing SE), a coin flip, with TileSource bit 3 picking
; the matching head tiles - then descend (state $24, BHVS_DESCEND_6).
_trySwoop:
		cmpi.w	#$00F0,Z(a5)
		bcs.s	_swoopMiss
		move.w	#$0002,d6
		jsr	(j_GenerateRandomNumber).l
		tst.b	d7
		beq.s	_swoopWest
		move.b	(Player_X).l,(a5)
		move.b	#$16,Y(a5)
		andi.b	#$3F,RotationAndSize(a5)
		ori.b	#DIR_SW,RotationAndSize(a5)
		bclr	#$03,TileSource(a5)
		bra.s	_swoopPlace

_swoopWest:
		move.b	#$19,X(a5)
		move.b	(Player_Y).l,Y(a5)
		andi.b	#$3F,RotationAndSize(a5)
		ori.b	#DIR_SE,RotationAndSize(a5)
		bset	#$03,TileSource(a5)

_swoopPlace:
		bset	#$07,RenderFlags(a5)
		clr.w	SubX(a5)
		movea.l	a5,a1
		jsr	(j_j_CalcSpriteHitbox).l
		bra.w	_startDescend

_swoopMiss:
		tst.b	d0
		rts

; Head high (Z >= $94): 31% chance to lash the tail (state $21).
_tryQuake:
		cmpi.w	#$0094,Z(a5)
		bcs.s	_quakeMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00030,d7
		bhi.w	_quakeMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_quakeMiss:
		tst.b	d0
		rts

; 11% chance (at any height) to breathe fire for 60 ticks (state
; $22, BHVS_PAUSE_60_AI_IDLE - the "AI once" at its end makes the B
; routine rise away).
_tryBreath:
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00010,d7
		bhi.s	_breathMiss
		move.w	#BHVS_PAUSE_60_AI_IDLE,BehaviourLUTIndex(a5)

_startBreath:
		move.b	#$22,AIState(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		trap	#$00			  ; Trap00Handler
		dc.w SND_Fireball1
		ori	#$01,ccr
		rts

_breathMiss:
		tst.b	d0
		rts

; Head low (Z < $64): 85% chance to advance along her edge spitting
; a fireball (state $23, BHVS_FORWARD_12).
_tryAdvance:
		cmpi.w	#$0064,Z(a5)
		bcc.s	_lowMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00085,d7
		bcc.s	_lowMiss
		move.b	#$23,AIState(a5)
		move.w	#BHVS_FORWARD_12,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		trap	#$00			  ; Trap00Handler
		dc.w SND_Slash1
		ori	#$01,ccr
		rts

_lowMiss:
		tst.b	d0
		rts

_startDescend:
		move.b	#$24,AIState(a5)
		move.w	#BHVS_DESCEND_6,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

; After the earthquake: if the stun did not take (no input playback
; running), just reset; otherwise dive on the stunned player -
; reposition $38 from him along a random axis, facing him, and
; descend onto him (state $26) with an immediate $20 drop. A failed
; placement restores the old position.
_quakeDive:
		tst.w	(g_ControllerPlayback).l
		beq.w	_reset
		move.l	(a5),d0
		movem.l	d0,-(sp)
		move.w	(Player_CentreX).l,d0
		move.w	(Player_CentreY).l,d1
		move.w	#$0002,d6
		jsr	(j_GenerateRandomNumber).l
		tst.b	d7
		beq.s	_diveAlongY
		subi.w	#$0038,d0
		move.b	#$40,d2
		bra.s	_divePlace

_diveAlongY:
		subi.w	#$0038,d1
		move.b	#$80,d2

_divePlace:
		move.w	d0,d3
		andi.b	#$F0,d0
		lsr.w	#$04,d0
		move.b	d0,X(a5)
		andi.b	#$0F,d3
		move.b	d3,SubX(a5)
		move.w	d1,d3
		andi.b	#$F0,d1
		lsr.w	#$04,d1
		move.b	d1,Y(a5)
		andi.b	#$0F,d3
		move.b	d3,SubY(a5)
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d2,RotationAndSize(a5)
		bset	#$07,RenderFlags(a5)
		bset	#$07,AnimCtrl(a5)
		movea.l	a5,a1
		jsr	(j_j_CalcSpriteHitbox).l
		movem.l	(sp)+,d0
		bcs.s	_diveFail
		move.b	#$26,AIState(a5)
		move.w	#BHVS_DESCEND_6,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		subi.w	#$0020,Z(a5)
		subi.w	#$0020,HitBoxZEnd(a5)
		ori	#$01,ccr
		rts

_diveFail:
		move.l	d0,(a5)
		tst.b	d0
		rts

; Head low (Z < $64): rise away (state $25). The roll is weighted by
; the player's distance from her corner ($18,$15) - the closer he
; gets, the likelier she is to retreat upward.
_tryRise:
		cmpi.w	#$0064,Z(a5)
		bcc.s	_riseMiss
		move.w	#00025,d6
		jsr	(j_GenerateRandomNumber).l
		move.b	(Player_X).l,d6
		subi.b	#$18,d6
		add.b	(Player_Y).l,d6
		subi.b	#$15,d6
		move.b	#$18,d5
		sub.b	d6,d5
		cmp.b	d5,d7
		bcc.s	_riseMiss

_startRise:
		move.l	#$C0000000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_DATA_REG).l
		move.b	#$25,AIState(a5)
		move.w	#BHVS_ASCEND_15,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_riseMiss:
		tst.b	d0
		rts

; Unreachable leftover: Ifrit's face-the-player helper, never called
; here.
		bsr.w	GetDirToPlayer
		move.b	d2,d1
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d2,RotationAndSize(a5)
		rts

; States $20+: 0 = nothing, 1 = tail earthquake, 2 = flame breath,
; 3 = advancing spit, 4/5 = descend/rise glides, 6 = the dive onto
; the player, 7+ = the spread of three.
_attackStates:
		andi.b	#$0F,d0
		beq.s	_stateRts
		cmpi.b	#$01,d0
		beq.s	_quake
		cmpi.b	#$02,d0
		beq.w	_breath
		cmpi.b	#$03,d0
		beq.w	_advance
		cmpi.b	#$04,d0
		beq.w	_glide
		cmpi.b	#$05,d0
		beq.w	_glide
		cmpi.b	#$06,d0
		beq.w	_dive
		bra.w	_tripleFireball

_stateRts:
		rts

; The tail earthquake: tick 1 swaps the background tiles to raise
; the tail (j_DoTileSwap 8, with the thud); at tick $10 it slams -
; stun the player (forced input playback 8) if he is standing on the
; ground and not already in hitstun, swap the tail back ($10) and
; shake the screen; tick $11 decides the follow-up dive.
_quake:
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$01,AICounter(a5)
		beq.w	_quakeStart
		cmpi.b	#$10,AICounter(a5)
		bne.w	_quakeWait
		move.b	(Player_Z+1).l,d0
		cmp.b	(Player_FloorHeight).l,d0
		bne.s	_quakeShake
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_quakeShake
		move.b	#$08,d0
		jsr	(j_PlaybackInput).l

_quakeShake:
		move.b	#$10,d0
		bsr.s	_tailSwap
		bsr.w	ScreenShake
		rts

_quakeStart:
		move.b	#$08,d0

; Play the thud and run background tile swap d0 (8 = tail raised,
; $10 = tail down).
_tailSwap:
		trap	#$00			  ; Trap00Handler
		dc.w SND_Thud
		movem.l	a5,-(sp)
		jsr	(j_DoTileSwap).l
		movem.l	(sp)+,a5
		rts

_quakeWait:
		cmpi.b	#$11,AICounter(a5)
		beq.w	_quakeDive
		rts

; The flame breath, on a 3-tick cycle: tick 1 loads the flame
; graphics and palettes and turns CRAM colours 0 and 15 deep red
; ($000E); tick 2 reloads the palettes and blacks them out again;
; tick 3 spits a level-flying fireball (BHVS_PROJECTILE_LEVEL) and
; starts over - so the room pulses red as she breathes, until the
; pause behaviour ends and the B routine lifts her away.
_breath:
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$01,AICounter(a5)
		bne.s	_breathFlashOff
		lea	($00009880).l,a2
		move.b	#ITM_MAGICSWORD,d0
		jsr	(j_LoadMagicSwordEffect).l
		move.b	#$01,d0
		bsr.w	LoadProjectilePalette
		bsr.w	LoadPal3Low
		move.l	#$C0000000,(VDP_CTRL_REG).l
		move.w	#$000E,(VDP_DATA_REG).l
		move.l	#$C01E0000,(VDP_CTRL_REG).l
		move.w	#$000E,(VDP_DATA_REG).l
		bra.w	_breathTick

_breathFlashOff:
		cmpi.b	#$02,AICounter(a5)
		bne.w	_breathSpawn
		move.b	#$01,d0
		bsr.w	LoadProjectilePalette
		bsr.w	LoadPal3Low
		move.l	#$C0000000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_DATA_REG).l
		move.l	#$C01E0000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_DATA_REG).l
		bra.w	_breathTick

_breathSpawn:
		cmpi.b	#$03,AICounter(a5)
		bne.w	_breathTick
		move.w	#BHVS_PROJECTILE_LEVEL,d6
		bsr.w	_spawnFireball
		clr.b	AICounter(a5)

_breathTick:
		bsr.w	j_j_OnTick
		rts

; Descend / rise (states 4/5): ride the glide behaviour; when it
; finishes (BehavCmd 0), reset.
_glide:
		bsr.w	j_j_OnTick
		tst.b	BehavCmd(a5)
		beq.w	_reset
		rts

; The dive onto the stunned player (state 6): ride the descent, then
; breathe fire in his face for 30 ticks.
_dive:
		bsr.w	j_j_OnTick
		tst.b	BehavCmd(a5)
		beq.s	_diveBreath
		rts

_diveBreath:
		move.w	#BHVS_PAUSE_30_AI_IDLE,BehaviourLUTIndex(a5)
		bra.w	_startBreath

; Advancing spit (state 3): the cast sequence on AICounter (flame
; graphics, palettes, one straight fireball at tick $A, recover to
; $14), while every tick the steering below temporarily turns her
; along her edge axis toward the player for the behaviour tick.
_advance:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$01,AICounter(a5)
		bne.s	_advPalette
		lea	($00009880).l,a2
		move.b	#ITM_MAGICSWORD,d0
		jsr	(j_LoadMagicSwordEffect).l
		bra.w	_advSteer

_advPalette:
		cmpi.b	#$02,AICounter(a5)
		bne.w	_advThrow
		move.b	#$01,d0
		bsr.w	LoadProjectilePalette
		bsr.w	LoadPal3Low
		bra.w	_advSteer

_advThrow:
		cmpi.b	#$0A,AICounter(a5)
		bhi.w	_advRecover
		bcs.w	_advSteer
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		move.w	#BHVS_PROJECTILE_64,d6
		bsr.w	_spawnFireball
		bcs.w	_advDone
		bra.s	_advSteer

_advRecover:
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$14,AICounter(a5)
		beq.w	_advDone

; Steer: north-edge Gola (facing SW) slides along X, west-edge
; (facing SE) along Y - temporarily face toward the player on that
; axis for the behaviour tick (or skip the tick when aligned with
; him), then restore the real facing.
_advSteer:
		move.b	RotationAndSize(a5),d0
		movem.w	d0,-(sp)
		andi.b	#$C0,d0
		cmpi.b	#$80,d0
		beq.s	_steerAlongX
		move.b	#$00,d1
		move.b	Y(a5),d0
		cmp.b	(Player_Y).l,d0
		beq.s	_steerDone
		bhi.s	_steerApply
		move.b	#$80,d1
		bra.s	_steerApply

_steerAlongX:
		move.b	#$C0,d1
		move.b	(a5),d0
		cmp.b	(Player_X).l,d0
		beq.s	_steerDone
		bhi.s	_steerApply
		move.b	#$40,d1

_steerApply:
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d1,RotationAndSize(a5)
		bsr.w	j_j_OnTick

_steerDone:
		movem.w	(sp)+,d0
		move.b	d0,RotationAndSize(a5)
		rts

_advDone:
		bclr	#$00,InteractFlags(a5)
		clr.b	AICounter(a5)
		bra.w	_reset

; Spawn one large fireball with behaviour d6, $1A ahead of her
; facing: SPR_GOLAFIREBALL, AttackStrength $1400, at her Z, tiles at
; $64B4, speed 4, no gravity, invincible, InteractFlags bit 7 (kept
; in the Init copy too). Carry set if no free slot.
_spawnFireball:
		move.b	RotationAndSize(a5),d2
		movem.w	d6,-(sp)
		movem.w	d2,-(sp)
		jsr	(j_FindFreeSpriteSlot).l
		movem.w	(sp)+,d1
		movem.w	(sp)+,d6
		bcs.w	_spawnFail
		move.w	CentreX(a5),d2
		move.w	CentreY(a5),d3
		andi.b	#$C0,d1
		beq.s	_aimNE
		cmpi.b	#$80,d1
		bcs.s	_aimSE
		beq.s	_aimSW
		subi.w	#$001A,d2	; NW: X - $1A
		bra.s	_spawn

_aimNE:
		subi.w	#$001A,d3	; NE: Y - $1A
		bra.s	_spawn

_aimSE:
		addi.w	#$001A,d2	; SE: X + $1A
		bra.s	_spawn

_aimSW:
		addi.w	#$001A,d3	; SW: Y + $1A

_spawn:
		move.w	d2,d0
		andi.b	#$0F,d0
		move.b	d0,SubX(a1)
		lsr.w	#$04,d2
		move.b	d2,(a1)
		move.w	d3,d0
		andi.b	#$0F,d0
		move.b	d0,SubY(a1)
		lsr.w	#$04,d3
		move.b	d3,Y(a1)
		move.b	d1,RotationAndSize(a1)
		move.b	#SPR_GOLAFIREBALL,d2
		move.w	#$1400,AttackStrength(a1)
		move.w	Z(a5),d3
		move.w	d3,Z(a1)
		move.w	#$64B4,TileSource(a1)
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

; The spread of three (state 7+): flame graphics and palettes, then
; at tick $10 three fireballs - one straight, one diagonally right, one
; diagonally left - and recovery until tick $20.
_tripleFireball:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$01,AICounter(a5)
		bne.s	_triplePalette
		lea	($00009880).l,a2
		move.b	#ITM_MAGICSWORD,d0
		jmp	(j_LoadMagicSwordEffect).l

_triplePalette:
		cmpi.b	#$02,AICounter(a5)
		bne.w	_tripleThrow
		move.b	#$01,d0
		bsr.w	LoadProjectilePalette
		bra.w	LoadPal3Low

_tripleThrow:
		cmpi.b	#$10,AICounter(a5)
		bhi.w	_tripleRecover
		bcs.w	_tripleRts
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		move.w	#BHVS_PROJECTILE_64,d6
		bsr.w	_spawnFireball
		bcs.w	_tripleDone
		move.w	#BHVS_PROJECTILE_DIAG_RIGHT,d6
		bsr.w	_spawnFireball
		bcs.w	_tripleDone
		move.w	#BHVS_PROJECTILE_DIAG_LEFT,d6
		bsr.w	_spawnFireball
		rts

_tripleRecover:
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$20,AICounter(a5)
		beq.w	_tripleDone

_tripleRts:
		rts

_tripleDone:
		clr.b	AICounter(a5)
		bra.w	_reset

		modend
