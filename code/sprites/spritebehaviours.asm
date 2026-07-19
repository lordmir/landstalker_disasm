SpriteBehaviours	module
; Behaviour-script command handlers (EB_*) and the movement helpers
; they share. A sprite's behaviour script (see LoadSpriteBehaviour) is
; a byte stream of {command, arguments...} records read through
; BehaviourLUTPtr; OnTick (spritebehaviourjumptable.asm) dispatches the
; current BehavCmd (with BehavParam holding its first argument) here
; every tick. A handler either returns to run again next tick, or
; consumes its record (LoadNextCmd, d0 = record size) and re-enters
; ProcessNextCmd to execute the following command in the same tick.

; Behaviour word 0: no behaviour.
EB_NULL:
		rts

; Consume a 1-byte (no-argument) record and run the next command in
; the same tick.
ProcessNextCmdImmediately_1:
		moveq	#$1,d0
		bsr.s	LoadNextCmd
		bra.w	ProcessNextCmd

; Consume a 2-byte {cmd, arg} record and run the next command in the
; same tick.
ProcessNextCmdImmediately_2:
		moveq	#$2,d0
		bsr.s	LoadNextCmd
		bra.w	ProcessNextCmd

; Advances the behaviour script by d0 bytes (the size of the record
; just executed) and loads the next BehavCmd/BehavParam pair.
LoadNextCmd:
		movea.l	BehaviourLUTPtr(a5),a6
		adda.l	d0,a6
		move.l	a6,BehaviourLUTPtr(a5)
		move.b	(a6)+,BehavCmd(a5)
		move.b	(a6),BehavParam(a5)
		rts

; Cmd $00: wait BehavParam ticks.
EB_Pause:
		subq.b	#$01,BehavParam(a5)
		bne.s	_pauseRts
		moveq	#$2,d0
		bsr.s	LoadNextCmd

_pauseRts:
		rts

; Cmd $2A: move forward for a random number of ticks between
; BehavParam and script arg 2, then continue as EB_MoveTimed.
EB_MoveRandomTime:
		clr.w	d6
		move.b	BehavParam(a5),d6
		jsr	(j_GenerateRandomNumber).l
		movea.l	BehaviourLUTPtr(a5),a6
		clr.w	d6
		move.b	2(a6),d6
		sub.w	d7,d6
		addq.b	#$01,d6
		move.b	d6,BehavParam(a5)
		addq.l	#$01,BehaviourLUTPtr(a5)
		move.b	#BHV_MOVE_TIMED,BehavCmd(a5)

; Cmd $01: move forward for BehavParam ticks (blocked ticks count too).
EB_MoveTimed:
		bsr.s	MoveSpriteForward
		subq.b	#$01,BehavParam(a5)
		bne.s	_mtRts
		bra.w	ProcessNextCmdImmediately_2

_mtRts:
		rts

; Cmd $11: move forward BehavParam unblocked steps.
EB_MoveRelative:
		bsr.s	MoveSpriteForward
		bcs.s	_mrRts
		subq.b	#$01,BehavParam(a5)
		bne.s	_mrRts
		moveq	#$2,d0
		bsr.s	LoadNextCmd

_mrRts:
		rts

; Cmd $4F: as EB_MoveRelative, but through walls and sprites.
EB_MoveNoClip:
		bsr.s	MoveSpriteForwardNoClip
		bcs.s	_mncRts
		subq.b	#$01,BehavParam(a5)
		bne.s	_mncRts
		moveq	#$2,d0
		bsr.s	LoadNextCmd

_mncRts:
		rts

; One movement step ignoring walls and sprites: RenderFlags bit 6
; makes the shared move code skip its collision checks.
MoveSpriteForwardNoClip:
		bset	#$06,RenderFlags(a5)
		bsr.s	_moveFwd
		bclr	#$06,RenderFlags(a5)
		rts

; Moves the sprite one step in its facing direction at Speed (low
; nibble). Per direction: advances the leading hitbox edge, checks the
; wall on cell crossings and other sprites (ApplyContactDamage decides
; solid vs pass-through), then commits Centre/Sub coordinates and, on a
; cell crossing, the cell coordinate + HeightmapOffset/GroundHeight,
; and sets the walk Action1/MovedDirFlags bits (skipped while riding a
; platform). Carry set = blocked; d7 = $FF sprite / $00 wall.
MoveSpriteForward:
		bclr	#$06,RenderFlags(a5)

_moveFwd:
		move.b	RotationAndSize(a5),d0
		andi.b	#DIR_MASK,d0
		beq.s	_moveNE
		cmpi.b	#DIR_SW,d0
		bhi.w	_moveNW
		beq.w	_moveSW
		bcs.w	_moveSE

_moveNE:
		move.w	HitBoxYStart(a5),d1
		move.w	StateFlags(a5),d0
		andi.w	#$000F,d0
		sub.w	d0,HitBoxYStart(a5)
		sub.w	d0,HitBoxYEnd(a5)
		btst	#$06,RenderFlags(a5)
		bne.w	_neApply
		move.w	HitBoxYStart(a5),d0
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.s	_neCollide
		movea.l	a5,a0
		jsr	(j_CheckSpriteWallNE).l
		bcc.s	_neCollide
		clr.b	d7
		move.b	d0,d1
		bra.s	_neRevert

_neContact:
		bsr.w	ApplyContactDamage
		bcs.s	_neApply

_neRevert:
		move.w	StateFlags(a5),d0
		andi.w	#$000F,d0
		add.w	d0,HitBoxYStart(a5)
		add.w	d0,HitBoxYEnd(a5)
		ori	#$01,ccr
		rts

_neCollide:
		move.l	a5,d0
		subi.l	#Player_X,d0
		jsr	(j_CollisionDetect).l
		bcs.s	_neContact

_neApply:
		move.w	CentreY(a5),d0
		move.w	d0,d1
		move.w	StateFlags(a5),d2
		andi.w	#$000F,d2
		sub.w	d2,d0
		move.w	d0,CentreY(a5)
		andi.b	#$0F,d0
		move.b	d0,SubY(a5)
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.s	_neFlags
		subq.b	#$01,Y(a5)
		subi.w	#$0094,HeightmapOffset(a5)
		movea.w	HeightmapOffset(a5),a6
		move.w	(a6),GroundHeight(a5)

_neFlags:
		btst	#ACTBH_RIDING,QueuedAction(a5)
		bne.s	_neDone
		bset	#ACTB_WALK_NE,Action1(a5)
		bset	#ACTB_WALK_NE,MovedDirFlags(a5)

_neDone:
		tst.b	d0
		rts

; A moving sprite (a5) has touched sprite a0. Hostile movers hurt the
; player: direction + $40 into g_PlayerPendingHit, AttackStrength
; copied over, and fireballs also set the player's charged-hit flash.
; Gola fireballs pass through each other, and a non-hostile sprite
; running EB_MoveToTargetPosition (cmd $5C) passes through the player.
; Carry set = pass through, clear = solid (d7 = $FF).
ApplyContactDamage:
		tst.b	InteractFlags(a5)
		bpl.s	_cdPassive
		cmpa.l	#Player_X,a0
		bne.s	_cdOther
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_cdSolid
		move.b	RotationAndSize(a5),d7
		lsr.b	#$06,d7
		ori.b	#$40,d7
		move.b	d7,(g_PlayerPendingHit).l
		move.w	AttackStrength(a5),(Player_AttackStrength).l
		cmpi.b	#SPR_SMLFIREBALL,SpriteType(a5)
		beq.s	_cdFireball
		cmpi.b	#SPR_IFRITFIREBALL,SpriteType(a5)
		beq.s	_cdFireball
		cmpi.b	#SPR_GOLAFIREBALL,SpriteType(a5)
		bne.s	_cdSolid

_cdFireball:
		bset	#$00,(Player_RenderFlags).l

_cdSolid:
		move.b	#$FF,d7
		tst.b	d0
		rts

_cdOther:
		cmpi.b	#SPR_GOLAFIREBALL,SpriteType(a5)
		bne.s	_cdSolid
		cmpi.b	#SPR_GOLAFIREBALL,SpriteType(a0)
		bne.s	_cdSolid
		bra.s	_cdPass

_cdPassive:
		cmpa.l	#Player_X,a0
		bne.s	_cdSolid
		cmpi.b	#BHV_MOVE_TO_TARGET_POSITION,BehavCmd(a5)
		bne.s	_cdSolid

_cdPass:
		ori	#$01,ccr
		rts

_moveSE:
		move.w	HitBoxXEnd(a5),d1
		move.w	StateFlags(a5),d0
		andi.w	#$000F,d0
		add.w	d0,HitBoxXStart(a5)
		add.w	d0,HitBoxXEnd(a5)
		btst	#$06,RenderFlags(a5)
		bne.w	_seApply
		move.w	HitBoxXEnd(a5),d0
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bls.s	_seCollide
		movea.l	a5,a0
		jsr	(j_CheckSpriteWallSE).l
		bcc.s	_seCollide
		clr.b	d7
		move.b	d0,d1
		bra.s	_seRevert

_seContact:
		bsr.w	ApplyContactDamage
		bcs.s	_seApply

_seRevert:
		move.w	StateFlags(a5),d0
		andi.w	#$000F,d0
		sub.w	d0,HitBoxXStart(a5)
		sub.w	d0,HitBoxXEnd(a5)
		ori	#$01,ccr
		rts

_seCollide:
		move.l	a5,d0
		subi.l	#Player_X,d0
		jsr	(j_CollisionDetect).l
		bcs.s	_seContact

_seApply:
		move.w	CentreX(a5),d0
		move.w	d0,d1
		move.w	StateFlags(a5),d2
		andi.w	#$000F,d2
		add.w	d2,d0
		move.w	d0,CentreX(a5)
		andi.b	#$0F,d0
		move.b	d0,SubX(a5)
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d1,d0
		bcc.s	_seFlags
		addq.b	#$01,(a5)
		addq.w	#$02,HeightmapOffset(a5)
		movea.w	HeightmapOffset(a5),a6
		move.w	(a6),GroundHeight(a5)

_seFlags:
		btst	#ACTBH_RIDING,QueuedAction(a5)
		bne.s	_seDone
		bset	#ACTB_WALK_SE,Action1(a5)
		bset	#ACTB_WALK_SE,MovedDirFlags(a5)

_seDone:
		tst.b	d0
		rts

_moveSW:
		move.w	HitBoxYEnd(a5),d1
		move.w	StateFlags(a5),d0
		andi.w	#$000F,d0
		add.w	d0,HitBoxYStart(a5)
		add.w	d0,HitBoxYEnd(a5)
		btst	#$06,RenderFlags(a5)
		bne.w	_swApply
		move.w	HitBoxYEnd(a5),d0
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bls.s	_swCollide
		movea.l	a5,a0
		jsr	(j_CheckSpriteWallSW).l
		bcc.s	_swCollide
		clr.b	d7
		move.b	d0,d1
		bra.s	_swRevert

_swContact:
		bsr.w	ApplyContactDamage
		bcs.s	_swApply

_swRevert:
		move.w	StateFlags(a5),d0
		andi.w	#$000F,d0
		sub.w	d0,HitBoxYStart(a5)
		sub.w	d0,HitBoxYEnd(a5)
		ori	#$01,ccr
		rts

_swCollide:
		move.l	a5,d0
		subi.l	#Player_X,d0
		jsr	(j_CollisionDetect).l
		bcs.s	_swContact

_swApply:
		move.w	CentreY(a5),d0
		move.w	d0,d1
		move.w	StateFlags(a5),d2
		andi.w	#$000F,d2
		add.w	d2,d0
		move.w	d0,CentreY(a5)
		andi.b	#$0F,d0
		move.b	d0,SubY(a5)
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d1,d0
		bcc.s	_swFlags
		addq.b	#$01,Y(a5)
		addi.w	#$0094,HeightmapOffset(a5)
		movea.w	HeightmapOffset(a5),a6
		move.w	(a6),GroundHeight(a5)

_swFlags:
		btst	#ACTBH_RIDING,QueuedAction(a5)
		bne.s	_swDone
		bset	#ACTB_WALK_SW,Action1(a5)
		bset	#ACTB_WALK_SW,MovedDirFlags(a5)

_swDone:
		tst.b	d0
		rts

_moveNW:
		move.w	HitBoxXStart(a5),d1
		move.w	StateFlags(a5),d0
		andi.w	#$000F,d0
		sub.w	d0,HitBoxXStart(a5)
		sub.w	d0,HitBoxXEnd(a5)
		btst	#$06,RenderFlags(a5)
		bne.s	_nwApply
		move.w	HitBoxXStart(a5),d0
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.s	_nwCollide
		movea.l	a5,a0
		jsr	(j_CheckSpriteWallNW).l
		bcc.s	_nwCollide
		clr.b	d7
		move.b	d0,d1
		bra.s	_nwRevert

_nwContact:
		bsr.w	ApplyContactDamage
		bcs.s	_nwApply

_nwRevert:
		move.w	StateFlags(a5),d0
		andi.w	#$000F,d0
		add.w	d0,HitBoxXStart(a5)
		add.w	d0,HitBoxXEnd(a5)
		ori	#$01,ccr
		rts

_nwCollide:
		move.l	a5,d0
		subi.l	#Player_X,d0
		jsr	(j_CollisionDetect).l
		bcs.s	_nwContact

_nwApply:
		move.w	CentreX(a5),d0
		move.w	d0,d1
		move.w	StateFlags(a5),d2
		andi.w	#$000F,d2
		sub.w	d2,d0
		move.w	d0,CentreX(a5)
		andi.b	#$0F,d0
		move.b	d0,SubX(a5)
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.s	_nwFlags
		subq.b	#$01,(a5)
		subq.w	#$02,HeightmapOffset(a5)
		movea.w	HeightmapOffset(a5),a6
		move.w	(a6),GroundHeight(a5)

_nwFlags:
		btst	#ACTBH_RIDING,QueuedAction(a5)
		bne.s	_nwDone
		bset	#ACTB_WALK_NW,Action1(a5)
		bset	#ACTB_WALK_NW,MovedDirFlags(a5)

_nwDone:
		tst.b	d0
		rts

EB_TurnCWImmediate:
		bsr.s	EB_TurnCW
		bra.w	ProcessNextCmd

EB_TurnCCWImmediate:
		bsr.s	EB_TurnCCW
		bra.w	ProcessNextCmd

EB_TurnNEImmediate:
		bsr.s	EB_TurnNE
		bra.w	ProcessNextCmd

EB_TurnSEImmediate:
		bsr.s	EB_TurnSE
		bra.w	ProcessNextCmd

EB_TurnSWImmediate:
		bsr.s	EB_TurnSW
		bra.w	ProcessNextCmd

EB_TurnNWImmediate:
		bsr.s	EB_TurnNW
		bra.w	ProcessNextCmd

; RefreshSpriteFacing unless rotation is disabled (InteractFlags bit 0).
RefreshFacingIfRotatable:
		btst	#$00,InteractFlags(a5)
		bne.s	_rfRts
		bsr.s	RefreshSpriteFacing

_rfRts:
		rts

; Cmd $58: refresh the facing animation.
EB_UpdateSpriteFacing:
		bsr.s	RefreshSpriteFacing
		bra.w	ProcessNextCmdImmediately_1

; Applies the RotationAndSize facing to the animation
; (SetSpriteRotationAnimFlags) and marks the frame dirty.
RefreshSpriteFacing:
		move.b	RotationAndSize(a5),d1
		andi.b	#DIR_MASK,d1
		movea.l	a5,a1
		bsr.w	SetSpriteRotationAnimFlags
		ori.b	#$80,AnimCtrl(a5)
		ori.b	#$80,RenderFlags(a5)
		rts

EB_TurnCW:
		bsr.s	EB_SetDirCW
		bra.s	RefreshFacingIfRotatable

EB_TurnCCW:
		bsr.s	EB_SetDirCCW
		bra.s	RefreshFacingIfRotatable

EB_TurnNE:
		bsr.s	EB_SetDirNE
		bra.s	RefreshFacingIfRotatable

EB_TurnSE:
		bsr.s	EB_SetDirSE
		bra.s	RefreshFacingIfRotatable

EB_TurnSW:
		bsr.s	EB_SetDirSW
		bra.s	RefreshFacingIfRotatable

EB_TurnNW:
		bsr.s	EB_SetDirNW
		bra.s	RefreshFacingIfRotatable

EB_SetDirCW:
		move.b	RotationAndSize(a5),d0
		andi.b	#$3F,RotationAndSize(a5)
		addi.b	#$40,d0
		andi.b	#$C0,d0
		or.b	d0,RotationAndSize(a5)
		moveq	#$1,d0
		bra.w	LoadNextCmd

EB_SetDirCCW:
		move.b	RotationAndSize(a5),d0
		andi.b	#$3F,RotationAndSize(a5)
		subi.b	#$40,d0
		andi.b	#$C0,d0
		or.b	d0,RotationAndSize(a5)
		moveq	#$1,d0
		bra.w	LoadNextCmd

EB_SetDirNE:
		andi.b	#$3F,RotationAndSize(a5)
		moveq	#$1,d0
		bra.w	LoadNextCmd

EB_SetDirSE:
		andi.b	#$3F,RotationAndSize(a5)
		ori.b	#DIR_SE,RotationAndSize(a5)
		moveq	#$1,d0
		bra.w	LoadNextCmd

EB_SetDirSW:
		andi.b	#$3F,RotationAndSize(a5)
		ori.b	#DIR_SW,RotationAndSize(a5)
		moveq	#$1,d0
		bra.w	LoadNextCmd

EB_SetDirNW:
		ori.b	#DIR_NW,RotationAndSize(a5)
		moveq	#$1,d0
		bra.w	LoadNextCmd

EB_TurnRandomImmediate:
		bsr.s	EB_TurnRandom
		bra.w	ProcessNextCmd

EB_TurnRandom:
		bsr.s	EB_SetDirRandom
		bra.w	RefreshFacingIfRotatable

EB_SetDirRandom:
		move.w	#$0100,d6
		jsr	(j_GenerateRandomNumber).l
		andi.b	#$C0,d7
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d7,RotationAndSize(a5)
		moveq	#$1,d0
		bra.w	LoadNextCmd

EB_Turn180Immediate:
		bsr.s	EB_Turn180
		bra.w	ProcessNextCmd

EB_Turn180:
		bsr.s	EB_SetDir180
		bsr.w	RefreshFacingIfRotatable
		rts

EB_SetDir180:
		eori.b	#DIR_FLIP,RotationAndSize(a5)
		moveq	#$1,d0
		bra.w	LoadNextCmd

EB_MakeVisible:
		andi.b	#$BF,InteractFlags(a5)
		bra.w	ProcessNextCmdImmediately_1

EB_MakeInvisible:
		ori.b	#$40,InteractFlags(a5)
		bra.w	ProcessNextCmdImmediately_1

; Per-tick speed profile of a thrown object, indexed by BehavParam:
; starts at 0 for a straight drop, at $17 for a directional throw
; (see gamelogic4's carry state machine); $FF terminator.
ThrowSpeedTable:	dc.b $08,$04,$04,$04,$04,$04,$04,$04,$02,$02
		dc.b $02,$02,$02,$02,$02,$02,$02,$02,$01,$01
		dc.b $01,$01,$01,$08,$08,$08,$08,$04,$04,$04
		dc.b $04,$04,$04,$04,$04,$04,$04,$04,$04,$04
		dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02
		dc.b $02,$02,$02,$01,$01,$01,$01,$FF

; Cmds $10/$2F ($2F = thrown shop item): flight of a thrown or dropped
; carried object. While in the early phases it still rides a player
; jump (Z snapped above the player's head). Each tick it moves at
; ThrowSpeedTable[BehavParam++]; on impact it plays a thud, damages a
; struck vulnerable enemy as a player attack (vases instead shatter:
; drop the liftable flag and switch to behaviour $55), and bounces off
; walls (180 degree turn). Once landed/expired it restores the
; behaviour saved at pickup - unless that was itself a carried/thrown
; command: $10/$16/$32 stop dead, $2F reverts to EB_ShopItem.
EB_ThrownObject:
		move.b	BehavParam(a5),d0
		addq.b	#$01,BehavParam(a5)
		cmpi.b	#$03,d0
		bcs.s	_toLift
		cmpi.b	#$17,d0
		bcs.s	_toMove
		cmpi.b	#$1A,d0
		bcc.s	_toMove

_toLift:
		btst	#ACTB_JUMP,(Player_Action+1).l
		beq.s	_toMove
		move.w	(Player_HitBoxZEnd).l,d1
		addq.w	#$01,d1
		move.w	d1,Z(a5)
		clr.w	d7
		move.b	Height(a5),d7
		add.w	d7,d1
		subq.w	#$01,d1
		move.w	d1,HitBoxZEnd(a5)

_toMove:
		ext.w	d0
		move.b	ThrowSpeedTable(pc,d0.w),d0
		move.b	d0,Speed(a5)
		bsr.w	MoveSpriteForward
		bcc.w	_toPhase
		trap	#$00			  ; Trap00Handler
		dc.w SND_SpeakerPitch1
		tst.b	d7
		beq.s	_toVase
		move.b	InteractFlags(a0),d0
		andi.b	#$82,d0
		cmpi.b	#$80,d0
		bne.s	_toVase
		btst	#$00,CombatFlags(a0)
		bne.s	_toVase
		cmpi.w	#$0001,ItemDropProbability(a0)
		bne.s	_toHitEnemy
		tst.b	GoldOrChestContents(a0)
		beq.s	_toVase

_toHitEnemy:
		movem.l	a5,-(sp)
		move.b	RotationAndSize(a5),d0
		andi.w	#DIR_MASK,d0
		rol.b	#$02,d0
		addi.b	#$0A,d0
		cmpa.l	a0,a5
		bcs.s	_toApplyHit
		bchg	#$06,InteractFlags(a0)

_toApplyHit:
		movea.l	a0,a5
		move.w	d0,BehaviourLUTIndex(a5)
		jsr	(j_LoadSpriteBehaviour).l
		move.w	Defence(a5),d0
		bsr.w	CalculatePlayerDamageOutput
		sub.w	d0,CurrentHealth(a5)
		bhi.s	_toHitstun
		bsr.w	MarkEnemyDead
		bra.s	_toHitDone

_toHitstun:
		bsr.w	StartEnemyHitstun
		trap	#$00			  ; Trap00Handler
		dc.w SND_EnemyHit1

_toHitDone:
		movem.l	(sp)+,a5

_toVase:
		cmpi.b	#SpriteB_Vase,SpriteGraphic(a5)
		bne.s	_toBounce
		bclr	#$05,InteractFlags(a5)
		move.w	#BHV_SPECIAL_ANIMATION,BehavParam(a5)
		clr.b	Speed(a5)
		rts

_toBounce:
		eori.b	#DIR_FLIP,RotationAndSize(a5)

_toPhase:
		cmpi.b	#$20,BehavParam(a5)
		bcc.s	_toAirChk
		cmpi.b	#$17,BehavParam(a5)
		bcc.s	_toChkStop
		cmpi.b	#$09,BehavParam(a5)
		bcc.s	_toAirChk

_toChkStop:
		cmpi.b	#$39,BehavParam(a5)
		bcc.s	_toRestore
		cmpi.b	#$17,BehavParam(a5)
		bne.s	_toRts

_toRestore:
		cmpi.b	#BHV_THROWN_OBJECT,SavedBehavCmd(a5)
		beq.s	_toClear
		cmpi.b	#BHV_PUT_DOWN_OBJECT,SavedBehavCmd(a5)
		beq.s	_toClear
		cmpi.b	#BHV_THROWN_SHOP_ITEM,SavedBehavCmd(a5)
		beq.s	_toShopIdle
		cmpi.b	#BHV_PUT_DOWN_SHOP_ITEM,SavedBehavCmd(a5)
		beq.s	_toClear
		move.l	SavedBehaviourLUTPtr(a5),BehaviourLUTPtr(a5)
		move.b	SavedBehavParam(a5),BehavParam(a5)
		move.b	SavedBehavCmd(a5),BehavCmd(a5)
		move.b	SavedSpeed(a5),Speed(a5)
		rts

_toClear:
		clr.w	BehavParam(a5)
		bra.s	_toHalt

_toShopIdle:
		move.w	#BHV_SHOP_ITEM,BehavParam(a5)

_toHalt:
		clr.b	Speed(a5)

_toRts:
		rts

_toAirChk:
		move.b	AnimAction1(a5),d0
		andi.b	#ACT_AIR_MASK,d0
		beq.s	_toRestore
		bra.s	_toChkStop

; Cmds $16/$32 ($32 = shop item): object just put down, still sliding
; with momentum inherited from a moving platform (see gamelogic4
; _putDown). Keeps moving until it stops or hits something, then
; restores the saved behaviour (same special cases as EB_ThrownObject).
EB_PutDownObject:
		move.b	BehavParam(a5),d0
		addq.b	#$01,BehavParam(a5)
		tst.b	d0
		beq.s	_pdMove
		bmi.s	_pdRts
		move.b	AnimAction1(a5),d0
		andi.b	#ACT_AIR_MASK,d0
		beq.s	_pdRestore

_pdMove:
		bsr.w	MoveSpriteForward
		bcc.s	_pdRts

_pdRestore:
		cmpi.b	#BHV_THROWN_OBJECT,SavedBehavCmd(a5)
		beq.s	_pdClear
		cmpi.b	#BHV_PUT_DOWN_OBJECT,SavedBehavCmd(a5)
		beq.s	_pdClear
		cmpi.b	#BHV_THROWN_SHOP_ITEM,SavedBehavCmd(a5)
		beq.s	_pdClear
		cmpi.b	#BHV_PUT_DOWN_SHOP_ITEM,SavedBehavCmd(a5)
		beq.s	_pdShopIdle
		move.l	SavedBehaviourLUTPtr(a5),BehaviourLUTPtr(a5)
		move.b	SavedBehavParam(a5),BehavParam(a5)
		move.b	SavedBehavCmd(a5),BehavCmd(a5)
		move.b	SavedSpeed(a5),Speed(a5)
		rts

_pdShopIdle:
		move.w	#BHV_SHOP_ITEM,BehavParam(a5)
		rts

_pdClear:
		clr.w	BehavParam(a5)

_pdRts:
		rts

; Cmd $13: move forward until blocked.
EB_MoveUntilCollision:
		bsr.w	MoveSpriteForward
		bcc.s	_mucRts
		bra.w	ProcessNextCmdImmediately_1

_mucRts:
		rts

; Cmd $12: jump BehavParam (signed) bytes within the script.
EB_GoToInstruction:
		move.b	BehavParam(a5),d0
		ext.w	d0
		ext.l	d0
		bsr.w	LoadNextCmd
		bra.w	ProcessNextCmd

; Cmd $1E: stop moving (Speed = 0).
EB_Freeze:
		move.b	#$00,Speed(a5)
		bra.w	ProcessNextCmdImmediately_1

EB_SetSpeed1:
		move.b	#$01,Speed(a5)
		bra.w	ProcessNextCmdImmediately_1

EB_SetSpeed2:
		move.b	#$02,Speed(a5)
		bra.w	ProcessNextCmdImmediately_1

EB_SetSpeed4:
		move.b	#$04,Speed(a5)
		bra.w	ProcessNextCmdImmediately_1

EB_SetSpeed8:
		move.b	#$08,Speed(a5)
		bra.w	ProcessNextCmdImmediately_1

; Cmd $33: run away from the player for BehavParam ticks (the X/Y
; steering directions point away from the player; shares FollowPlayerStep's
; steering tail).
EB_FleePlayer:
		subq.b	#$01,BehavParam(a5)
		beq.w	_nextCmd2
		move.w	CentreX(a5),d0
		move.w	CentreY(a5),d1
		sub.w	(Player_CentreX).l,d0
		beq.s	_mtpXNone
		bpl.s	_mtpXPos
		neg.w	d0
		move.b	#DIR_NW,d2
		bra.s	_mtpChkY

_mtpXPos:
		move.b	#DIR_SE,d2
		bra.s	_mtpChkY

_mtpXNone:
		move.b	#$FF,d2

_mtpChkY:
		sub.w	(Player_CentreY).l,d1
		beq.s	_mtpYNone
		bpl.s	_mtpYPos
		neg.w	d1
		clr.b	d3
		bra.s	_mtpSteer

_mtpYPos:
		move.b	#DIR_SW,d3
		bra.s	_mtpSteer

_mtpYNone:
		move.b	#$FF,d3

_mtpSteer:
		bra.w	_steerToTarget

; Cmd $5B: load TargetX/Y/SubX/SubY from the script's 4 arguments.
EB_SetTargetPosition:
		movea.l	BehaviourLUTPtr(a5),a6
		move.b	1(a6),TargetX(a5)
		move.b	2(a6),TargetY(a5)
		move.b	3(a6),TargetSubX(a5)
		move.b	4(a6),TargetSubY(a5)
		moveq	#$5,d0
		bsr.w	LoadNextCmd
		bra.w	ProcessNextCmd

; Cmd $5C: steer towards the stored target (compared at 4-pixel
; granularity); advances the script on arrival. A non-hostile
; sprite running this passes through the player (ApplyContactDamage).
EB_MoveToTargetPosition:
		move.w	TargetX(a5),d2
		move.w	TargetSubX(a5),d3
		move.w	CentreX(a5),d0
		move.w	CentreY(a5),d1
		andi.w	#$FFFC,d0
		andi.w	#$FFFC,d1
		andi.w	#$FFFC,d2
		andi.w	#$FFFC,d3
		cmp.w	d0,d2
		bne.s	_mttDeltas
		cmp.w	d1,d3
		beq.w	ProcessNextCmdImmediately_1

_mttDeltas:
		sub.w	d2,d0
		beq.s	_mttXNone
		bpl.s	_mttXPos
		neg.w	d0
		move.b	#DIR_SE,d2
		bra.s	_mttChkY

_mttXPos:
		move.b	#DIR_NW,d2
		bra.s	_mttChkY

_mttXNone:
		move.b	#$FF,d2

_mttChkY:
		sub.w	d3,d1
		beq.s	_mttYNone
		bpl.s	_mttYPos
		neg.w	d1
		move.b	#DIR_SW,d3
		bra.s	_mttDispatch

_mttYPos:
		clr.b	d3
		bra.s	_mttDispatch

_mttYNone:
		move.b	#$FF,d3

_mttDispatch:
		move.b	RotationAndSize(a5),d4
		andi.b	#DIR_MASK,d4
		beq.w	_steerNE
		cmpi.b	#DIR_SW,d4
		bcs.w	_steerSE
		beq.w	_steerSW
		bra.w	_steerNW

; Cmd $2C: follow the player for BehavParam ticks, never jumping.
EB_FollowPlayerNoJump:
		subq.b	#$01,BehavParam(a5)
		beq.s	_nextCmd2
		bsr.s	FollowPlayerStep
		bclr	#$07,JumpRate(a5)
		rts

; Cmd $26: follow the player for BehavParam ticks, jumping up ledges.
EB_FollowPlayerWithJump:
		subq.b	#$01,BehavParam(a5)
		bne.s	FollowPlayerStep

_nextCmd2:
		bra.w	ProcessNextCmdImmediately_2

_loadNext2:
		moveq	#$2,d0
		bra.w	LoadNextCmd

; One follow-the-player step: d2/d3 = X/Y direction towards the player
; (reversed once within $0F to stand off rather than overlap), then
; movement is tried facing-first with side-step and reverse fallbacks
; (TryStepForward). When blocked by a step in front, starts a jump
; (JumpRate bit 7) unless already falling/rising. _steerToTarget is
; entered directly by EB_FleePlayer/EB_MoveToTargetPosition.
FollowPlayerStep:
		move.w	(Player_CentreX).l,d2
		move.w	(Player_CentreY).l,d3
		move.w	CentreX(a5),d0
		move.w	CentreY(a5),d1
		sub.w	d2,d0
		beq.s	_fpXNone
		bpl.s	_fpXPos
		neg.w	d0
		move.b	#DIR_SE,d2
		bra.s	_fpChkY

_fpXPos:
		move.b	#DIR_NW,d2
		bra.s	_fpChkY

_fpXNone:
		move.b	#$FF,d2

_fpChkY:
		sub.w	d3,d1
		beq.s	_fpYNone
		bpl.s	_fpYPos
		neg.w	d1
		move.b	#DIR_SW,d3
		bra.s	_fpNearChk

_fpYPos:
		clr.b	d3
		bra.s	_fpNearChk

_fpYNone:
		move.b	#$FF,d3

_fpNearChk:
		cmpi.b	#$0F,d0
		bhi.s	_steerToTarget
		cmpi.b	#$0F,d1
		bhi.s	_steerToTarget
		cmpi.b	#$FF,d2
		beq.s	_fpFlipY
		eori.b	#DIR_FLIP,d2

_fpFlipY:
		cmpi.b	#$FF,d3
		beq.s	_steerToTarget
		eori.b	#DIR_FLIP,d3

_steerToTarget:
		move.b	RotationAndSize(a5),d4
		andi.b	#DIR_MASK,d4
		beq.w	_steerNE
		cmpi.b	#DIR_SW,d4
		bcs.s	_steerSE
		beq.w	_steerSW

_steerNW:
		cmpi.b	#$C0,d2
		beq.s	_fwdXMatch
		cmpi.b	#$40,d2
		beq.w	_xOpposed
		bra.w	_turnToY

_steerSE:
		cmpi.b	#$40,d2
		beq.s	_fwdXMatch
		cmpi.b	#$C0,d2
		beq.w	_xOpposed
		bra.w	_turnToY

_fwdXMatch:
		bsr.w	TryStepForward
		bcc.w	_stepRts
		tst.b	d7
		beq.s	_xmLedgeChk
		move.w	HitBoxZEnd(a0),d7
		sub.w	Z(a5),d7
		cmpi.w	#$0010,d7
		bhi.s	_xmSideStep
		bra.s	_xmJumpChk

_xmLedgeChk:
		andi.w	#$004F,d1
		move.w	Z(a5),d0
		lsr.w	#$04,d0
		addq.w	#$01,d0
		sub.w	d0,d1
		bne.s	_xmSideStep

_xmJumpChk:
		btst	#ACTB_FALL,Action1(a5)
		bne.s	_xmSideStep
		btst	#ACTB_JUMP,Action1(a5)
		bne.s	_xmRts
		bset	#$07,JumpRate(a5)

_xmRts:
		rts

_xmSideStep:
		andi.b	#$80,d3
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d3,RotationAndSize(a5)
		bsr.w	TryStepForward
		bcc.w	_stepRts
		eori.b	#DIR_FLIP,d3
		andi.b	#$3F,RotationAndSize(a5)
		andi.b	#$C0,d3
		or.b	d3,RotationAndSize(a5)
		bsr.w	TryStepForward
		bcc.w	_stepRts
		eori.b	#DIR_FLIP,d2
		andi.b	#$C0,d2
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d2,RotationAndSize(a5)
		bra.w	TryStepForward

_turnToY:
		cmpi.b	#$FF,d3
		beq.w	_loadNext2
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d3,RotationAndSize(a5)
		bsr.w	TryStepForward
		bcc.w	_stepRts
		tst.b	d7
		beq.s	_tyLedgeChk
		move.w	HitBoxZEnd(a0),d7
		sub.w	Z(a5),d7
		cmpi.w	#$0010,d7
		bhi.s	_tyFallback
		bra.s	_tyJumpChk

_tyLedgeChk:
		andi.w	#$004F,d1
		move.w	Z(a5),d0
		lsr.w	#$04,d0
		addq.w	#$01,d0
		sub.w	d0,d1
		bne.s	_tyFallback

_tyJumpChk:
		btst	#ACTB_FALL,Action1(a5)
		bne.s	_tyFallback
		btst	#ACTB_JUMP,Action1(a5)
		bne.s	_tyRts
		bset	#$07,JumpRate(a5)

_tyRts:
		rts

_tyFallback:
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d4,RotationAndSize(a5)
		bsr.w	TryStepForward
		bcc.w	_stepRts
		andi.b	#$3F,RotationAndSize(a5)
		andi.b	#$C0,d3
		or.b	d3,RotationAndSize(a5)
		eori.b	#DIR_FLIP,RotationAndSize(a5)
		bsr.w	TryStepForward
		bcc.w	_stepRts
		andi.b	#$3F,RotationAndSize(a5)
		andi.b	#$C0,d4
		or.b	d4,RotationAndSize(a5)
		eori.b	#DIR_FLIP,RotationAndSize(a5)
		bra.w	TryStepForward

_xOpposed:
		cmpi.b	#$FF,d3
		bne.s	_xoTryY
		move.b	(g_VBlankCounterLow).l,d3
		ror.b	#$02,d3
		andi.b	#$C0,d3

_xoTryY:
		andi.b	#$80,d3
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d3,RotationAndSize(a5)
		bsr.w	TryStepForward
		bcc.w	_stepRts
		andi.b	#$3F,RotationAndSize(a5)
		andi.b	#$C0,d4
		or.b	d4,RotationAndSize(a5)
		bsr.w	TryStepForward
		bcc.w	_stepRts
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d4,RotationAndSize(a5)
		eori.b	#DIR_FLIP,RotationAndSize(a5)
		bsr.w	TryStepForward
		bcc.w	_stepRts
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d3,RotationAndSize(a5)
		eori.b	#DIR_FLIP,RotationAndSize(a5)
		bra.w	TryStepForward

_steerNE:
		cmpi.b	#$00,d3
		beq.s	_fwdYMatch
		cmpi.b	#$80,d3
		beq.w	_yOpposed
		bra.w	_turnToX

_steerSW:
		cmpi.b	#$80,d3
		beq.s	_fwdYMatch
		cmpi.b	#$00,d3
		beq.w	_yOpposed
		bra.w	_turnToX

_fwdYMatch:
		bsr.w	TryStepForward
		bcc.w	_stepRts
		tst.b	d7
		beq.s	_ymLedgeChk
		move.w	HitBoxZEnd(a0),d7
		sub.w	Z(a5),d7
		cmpi.w	#$0010,d7
		bhi.s	_ymSideStep
		bra.s	_ymJumpChk

_ymLedgeChk:
		andi.w	#$004F,d1
		move.w	Z(a5),d0
		lsr.w	#$04,d0
		addq.w	#$01,d0
		sub.w	d0,d1
		bne.s	_ymSideStep

_ymJumpChk:
		btst	#ACTB_FALL,Action1(a5)
		bne.s	_ymSideStep
		btst	#ACTB_JUMP,Action1(a5)
		bne.s	_ymRts
		bset	#$07,JumpRate(a5)

_ymRts:
		rts

_ymSideStep:
		ori.b	#$40,d2
		andi.b	#$C0,d2
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d2,RotationAndSize(a5)
		bsr.w	TryStepForward
		bcc.w	_stepRts
		eori.b	#DIR_FLIP,d2
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d2,RotationAndSize(a5)
		bsr.w	TryStepForward
		bcc.w	_stepRts
		eori.b	#DIR_FLIP,d3
		andi.b	#$C0,d3
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d3,RotationAndSize(a5)
		bra.w	TryStepForward

_turnToX:
		cmpi.b	#$FF,d2
		beq.w	_loadNext2
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d2,RotationAndSize(a5)
		bsr.w	TryStepForward
		bcc.w	_stepRts
		tst.b	d7
		beq.s	_txLedgeChk
		move.w	HitBoxZEnd(a0),d7
		sub.w	Z(a5),d7
		cmpi.w	#$0010,d7
		bhi.s	_txFallback
		bra.s	_txJumpChk

_txLedgeChk:
		andi.w	#$004F,d1
		move.w	Z(a5),d0
		lsr.w	#$04,d0
		addq.w	#$01,d0
		sub.w	d0,d1
		bne.s	_txFallback

_txJumpChk:
		btst	#ACTB_FALL,Action1(a5)
		bne.s	_txFallback
		btst	#ACTB_JUMP,Action1(a5)
		bne.s	_txRts
		bset	#$07,JumpRate(a5)

_txRts:
		rts

_txFallback:
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d4,RotationAndSize(a5)
		bsr.w	TryStepForward
		bcc.w	_stepRts
		andi.b	#$3F,RotationAndSize(a5)
		andi.b	#$C0,d2
		or.b	d2,RotationAndSize(a5)
		eori.b	#DIR_FLIP,RotationAndSize(a5)
		bsr.w	TryStepForward
		bcc.w	_stepRts
		andi.b	#$3F,RotationAndSize(a5)
		andi.b	#$C0,d4
		or.b	d4,RotationAndSize(a5)
		eori.b	#DIR_FLIP,RotationAndSize(a5)
		bra.w	TryStepForward

_yOpposed:
		cmpi.b	#$FF,d2
		bne.s	_yoTryX
		move.b	(g_VBlankCounterLow).l,d2
		ror.b	#$02,d2
		andi.b	#$C0,d2

_yoTryX:
		ori.b	#$40,d2
		andi.b	#$3F,RotationAndSize(a5)
		andi.b	#$C0,d2
		or.b	d2,RotationAndSize(a5)
		bsr.w	TryStepForward
		bcc.s	_stepRts
		andi.b	#$3F,RotationAndSize(a5)
		andi.b	#$C0,d4
		or.b	d4,RotationAndSize(a5)
		bsr.w	TryStepForward
		bcc.s	_stepRts
		andi.b	#$3F,RotationAndSize(a5)
		andi.b	#$C0,d4
		or.b	d4,RotationAndSize(a5)
		eori.b	#DIR_FLIP,RotationAndSize(a5)
		bsr.w	TryStepForward
		bcc.s	_stepRts
		andi.b	#$3F,RotationAndSize(a5)
		andi.b	#$C0,d2
		or.b	d2,RotationAndSize(a5)
		eori.b	#DIR_FLIP,RotationAndSize(a5)
		bra.w	TryStepForward

_stepRts:
		rts

; MoveSpriteForward preserving the d2-d4 steering directions.
TryStepForward:
		movem.w	d2-d4,-(sp)
		bsr.w	MoveSpriteForward
		movem.w	(sp)+,d2-d4
		rts

; Cmd $27: start a jump (JumpRate bit 7).
EB_Jump:
		bset	#$07,JumpRate(a5)
		bra.w	ProcessNextCmdImmediately_1

EB_EnableRotation:
		bclr	#$00,InteractFlags(a5)
		bra.w	ProcessNextCmdImmediately_1

EB_DisableRotation:
		bset	#$00,InteractFlags(a5)
		bra.w	ProcessNextCmdImmediately_1

; Cmd $2D: money bag / dropped item waiting to be collected. Scans all
; entities overlapping it: the player receives the item (or gold via
; AddGold), while a hostile enemy touching it absorbs dropped gold into
; its own GoldOrChestContents. The lifetime timer runs in
; CurrentHealth: blinking from $F0 ticks, faster from $168, and gone
; at 420 (a decimal literal in the original).
EB_Loot:
		tst.b	AnimCtrl(a5)
		bmi.w	_lootRts
		move.w	CentreX(a5),d0
		move.w	d0,d2
		subi.w	#$0010,d0
		addi.w	#$0010,d2
		move.w	CentreY(a5),d1
		move.w	d1,d3
		subi.w	#$0010,d1
		addi.w	#$0010,d3
		move.w	HitBoxZEnd(a5),d4
		addq.w	#$01,d4
		move.w	Z(a5),d5
		lea	(Player_X).l,a0
		moveq	#$F,d7

_lootLoop:
		cmp.w	CentreX(a0),d0
		bhi.w	_lootNext
		cmp.w	CentreX(a0),d2
		bcs.w	_lootNext
		cmp.w	CentreY(a0),d1
		bhi.w	_lootNext
		cmp.w	CentreY(a0),d3
		bcs.w	_lootNext
		cmp.w	Z(a0),d4
		bcs.w	_lootNext
		cmp.w	HitBoxZEnd(a0),d5
		bhi.w	_lootNext
		cmpa.l	a0,a5
		beq.w	_lootNext
		tst.b	InteractFlags(a0)
		bmi.s	_lootGive
		cmpa.l	#Player_X,a0
		bne.w	_lootNext

_lootGive:
		clr.w	d0
		move.b	GoldOrChestContents(a5),d0
		bne.s	_lootGold
		trap	#$00			  ; Trap00Handler
		dc.w SND_HealthRecover1
		cmpa.l	#Player_X,a0
		bne.w	_lootDespawn
		move.b	ItemDrop(a5),d0
		jsr	(j_GetItemQtyAndMaxQty).l
		addq.b	#$01,d1
		bne.s	_lootItem
		addq.b	#$01,d1

_lootItem:
		jsr	(j_GetItem).l
		ext.w	d0
		move.w	d0,(g_CurrentTextItem).l
		bne.s	_lootMsg
		bsr.w	UpdateEkeEkeHUD
		bsr.w	MarkHUDForUpdate
		bsr.w	RefreshHUD

_lootMsg:
		jsr	(j_FlushDMACopyQueue).l
		jsr	(sub_22EE8).l
	if REGION=DE
		move.w	#2,d0
		jsr		(j_GetItemFoundString).l
	else
		move.w	#$0013,d0
	endif
		jsr	(j_PrintString).l
		jsr	(j_SetUpTextDisplay).l
		bra.s	_lootDespawn

_lootGold:
		trap	#$00			  ; Trap00Handler
		dc.w SND_PickupMoney
		cmpa.l	#Player_X,a0
		beq.s	_lootPlayerGold
		add.b	d0,GoldOrChestContents(a0)
		bcc.s	_lootDespawn
		move.b	#$FF,GoldOrChestContents(a0)
		bra.s	_lootDespawn

_lootPlayerGold:
		jsr	(j_AddGold).l
		bra.s	_lootDespawn

_lootNext:
		lea	SPRITE_SIZE(a0),a0
		tst.b	(a0)
		dbmi	d7,_lootLoop
		addq.w	#$01,CurrentHealth(a5)
		move.w	CurrentHealth(a5),d0
		cmpi.w	#$00F0,d0
		bcs.s	_lootRts
		bclr	#$06,InteractFlags(a5)
		move.w	d0,d1
		andi.b	#$03,d1
		bne.s	_lootBlink2
		bset	#$06,InteractFlags(a5)

_lootBlink2:
		cmpi.w	#$0168,d0
		bcs.s	_lootExpire
		move.w	d0,d1
		andi.b	#$01,d1
		ror.b	#$02,d1
		andi.b	#$BF,InteractFlags(a5)
		or.b	d1,InteractFlags(a5)

_lootExpire:
		cmpi.w	#00420,d0
		bcs.s	_lootRts

_lootDespawn:
		jsr	(j_MoveSpriteOffscreen).l

_lootRts:
		rts

; Cmd $2E: shop-stock item. On pickup (player holds it overhead,
; latched by StateFlags bit 3) runs the shop pick-up script, which
; despawns it if it was bought/stolen. On put-down it only settles on
; a counter tile (FLOOR_COUNTER) at ground height (latched by
; CombatFlags bit 7) and runs the put-down script.
EB_ShopItem:
		btst	#$06,StateFlags(a5)
		beq.s	_shopPutDown
		move.b	(Player_AnimAction1).l,d0
		andi.b	#$C0,d0
		cmpi.b	#$C0,d0
		bne.s	_shopRts
		bset	#$03,StateFlags(a5)
		bne.s	_shopRts
		move.b	GoldOrChestContents(a5),(g_ShopItemId).l
		jsr	(j_RunShopItemPickUp).l
		tst.b	(g_ShopItemId).l
		bpl.s	_shopMaskAC
		jsr	(j_MoveSpriteOffscreen).l
		subi.w	#$0010,(Player_HitBoxZEnd).l
		clr.b	(g_CarryPhase).l
		clr.w	(g_CarriedEntity).l

_shopMaskAC:
		move.b	#$60,(g_SwordButtonMask).l

_shopRts:
		rts

_shopPutDown:
		bclr	#$03,StateFlags(a5)
		move.b	GroundType(a5),d0
		andi.b	#$3F,d0
		cmpi.b	#FLOOR_COUNTER,d0
		bne.s	_shopReset
		btst	#ACTB_FALL,Action1(a5)
		bne.s	_shopReset
		clr.w	d0
		move.b	GroundHeight(a5),d0
		lsl.b	#$04,d0
		cmp.w	Z(a5),d0
		bne.s	_shopReset
		bset	#$07,CombatFlags(a5)
		bne.s	_shopRts
		move.b	GoldOrChestContents(a5),(g_ShopItemId).l
		jsr	(j_RunShopItemPutDown).l
		tst.b	(g_ShopItemId).l
		bpl.s	_shopRts2
		jsr	(j_MoveSpriteOffscreen).l

_shopRts2:
		rts

_shopReset:
		bclr	#$07,CombatFlags(a5)
		rts

; Cmd $30: rise by Speed for BehavParam ticks; while blocked by
; something above, the countdown pauses.
EB_MoveUpRelative:
		bsr.s	RaiseSpriteZ
		bsr.s	CheckZMoveCollision
		bcs.s	UndoRaiseSpriteZ

_riseFlag:
		bset	#ACTB_JUMP,Action1(a5)

_riseCount:
		subq.b	#$01,BehavParam(a5)
		bne.s	_riseRts
		moveq	#$2,d0
		bra.w	LoadNextCmd

; Backs out the RaiseSpriteZ step just made.
UndoRaiseSpriteZ:
		clr.w	d0
		move.b	Speed(a5),d0
		sub.w	d0,Z(a5)
		sub.w	d0,HitBoxZEnd(a5)

_riseRts:
		rts

; Raises Z/HitBoxZEnd by Speed; pops the caller's return when Speed
; is 0 (nothing to move).
RaiseSpriteZ:
		clr.w	d0
		move.b	Speed(a5),d0
		beq.s	_rzAbort
		add.w	d0,HitBoxZEnd(a5)
		add.w	d0,Z(a5)
		bcc.s	_rzRts
		bchg	#$06,InteractFlags(a5)

_rzRts:
		rts

_rzAbort:
		movem.l	(sp)+,d0
		rts

; Cmd $3A: as EB_MoveUpRelative, but blocked ticks count down too.
EB_MoveUpTimed:
		bsr.s	RaiseSpriteZ
		bsr.s	CheckZMoveCollision
		bcc.s	_riseFlag
		bsr.s	UndoRaiseSpriteZ
		bra.s	_riseCount

; Cmd $31: sink by Speed for BehavParam ticks; while blocked, the
; countdown pauses.
EB_MoveDownRelative:
		bsr.s	LowerSpriteZ
		bsr.s	CheckZMoveCollision
		bcs.s	UndoLowerSpriteZ

_sinkFlag:
		bset	#ACTB_FALL,Action1(a5)

_sinkCount:
		subq.b	#$01,BehavParam(a5)
		bne.s	_sinkRts
		moveq	#$2,d0
		bra.w	LoadNextCmd

; Backs out the LowerSpriteZ step just made.
UndoLowerSpriteZ:
		clr.w	d0
		move.b	Speed(a5),d0
		add.w	d0,Z(a5)
		add.w	d0,HitBoxZEnd(a5)

_sinkRts:
		rts

; Sprite-overlap check for vertical movement: carry set = blocked.
; A hostile mover crushes the player (pending hit $80 = from above);
; Gola fireballs pass through each other.
CheckZMoveCollision:
		move.l	a5,d0
		subi.l	#Player_X,d0
		jsr	(j_CollisionDetect).l
		bcc.s	_zcClear
		tst.b	InteractFlags(a5)
		bpl.s	_zcBlocked
		cmpa.l	#Player_X,a0
		bne.s	_zcFireball
		move.b	#$80,(g_PlayerPendingHit).l
		move.w	AttackStrength(a5),(Player_AttackStrength).l

_zcBlocked:
		ori	#$01,ccr
		rts

_zcFireball:
		cmpi.b	#SPR_GOLAFIREBALL,SpriteType(a5)
		bne.s	_zcBlocked
		cmpi.b	#SPR_GOLAFIREBALL,SpriteType(a0)
		bne.s	_zcBlocked

_zcClear:
		tst.b	d0
		rts

; Lowers Z/HitBoxZEnd by Speed; pops the caller's return when Speed is 0.
LowerSpriteZ:
		clr.w	d0
		move.b	Speed(a5),d0
		beq.s	_lzAbort
		sub.w	d0,HitBoxZEnd(a5)
		sub.w	d0,Z(a5)
		bcc.s	_lzRts
		bchg	#$06,InteractFlags(a5)

_lzRts:
		rts

_lzAbort:
		movem.l	(sp)+,d0
		rts

; Cmd $3B: as EB_MoveDownRelative, but blocked ticks count down too.
EB_MoveDownTimed:
		bsr.s	LowerSpriteZ
		bsr.s	CheckZMoveCollision
		bcc.w	_sinkFlag
		bsr.w	UndoLowerSpriteZ
		bra.w	_sinkCount

; Cmd $3C: rise until Z reaches BehavParam.
EB_MoveUpAbsolute:
		bsr.w	RaiseSpriteZ
		bsr.s	CheckZMoveCollision
		bcs.w	UndoRaiseSpriteZ
		bset	#ACTB_JUMP,Action1(a5)
		move.w	Z(a5),d0
		clr.w	d1
		move.b	BehavParam(a5),d1
		cmp.w	d1,d0
		bcs.w	_riseRts
		moveq	#$2,d0
		bra.w	LoadNextCmd

; Cmd $3D: sink until Z reaches BehavParam.
EB_MoveDownAbsolute:
		bsr.s	LowerSpriteZ
		bsr.w	CheckZMoveCollision
		bcs.w	UndoLowerSpriteZ
		bset	#ACTB_FALL,Action1(a5)
		move.w	Z(a5),d0
		clr.w	d1
		move.b	BehavParam(a5),d1
		cmp.w	d1,d0
		bhi.w	_sinkRts
		moveq	#$2,d0
		bra.w	LoadNextCmd

; Cmd $3F: rise every tick until blocked by something above, then
; advance the script.
EB_MoveUpUntilCollision:
		bsr.w	RaiseSpriteZ
		bsr.w	CheckZMoveCollision
		bcc.s	_nudgeRise
		bsr.w	UndoRaiseSpriteZ
		moveq	#$1,d0
		bra.w	LoadNextCmd

_nudgeRise:
		bset	#ACTB_JUMP,Action1(a5)
		rts

; Cmd $40: sink until landing on the floor or another sprite.
EB_MoveDownUntilCollision:
		bsr.s	MoveSpriteDownToFloor
		bcc.s	_mdcRts
		moveq	#$1,d0
		bra.w	LoadNextCmd

_mdcRts:
		rts

; Lowers the sprite by Speed, clamped by the heightmap floor
; underneath and sprite collision; carry set = landed or blocked
; (the step is backed out), clear = still falling (ACTB_FALL set).
MoveSpriteDownToFloor:
		movea.l	a5,a0
		move.w	Z(a0),d7
		jsr	(j_GetHighestFloorUnder).l
		clr.w	d0
		move.b	Speed(a5),d0
		sub.w	d0,HitBoxZEnd(a5)
		sub.w	d0,Z(a5)
		bcs.s	_mdfLanded
		movem.w	d4,-(sp)
		jsr	CheckZMoveCollision(pc)
		bcc.s	_mdfFloorChk
		movem.w	(sp)+,d4

_mdfLanded:
		bsr.w	UndoLowerSpriteZ
		ori	#$01,ccr
		rts

_mdfFloorChk:
		movem.w	(sp)+,d4
		cmp.w	Z(a5),d4
		bhi.s	_mdfLanded
		bset	#ACTB_FALL,Action1(a5)
		tst.b	d0
		rts

; Cmd $34: force controller playback sequence BehavParam (PlaybackInput).
EB_PlaybackInput:
		move.b	BehavParam(a5),d0
		jsr	(PlaybackInput).l
		bra.w	ProcessNextCmdImmediately_2

; Cmd $35: stop controller playback.
EB_ResetPlayback:
		clr.w	(g_ControllerPlayback).l
		bra.w	ProcessNextCmdImmediately_1

; Cmd $37: playback sequence 9 (hold still) and clear the player's action.
EB_Pause4s:
		move.b	#$09,d0
		jsr	(PlaybackInput).l
		clr.w	(Player_Action).l
		bra.w	ProcessNextCmdImmediately_1

; Cmd $36: wait until trigger condition BehavParam holds
; (ProcessTriggerAction).
EB_WaitForCondition:
		move.b	BehavParam(a5),d0
		jsr	(ProcessTriggerAction).l
		bcc.s	_wfcRts
		bra.w	ProcessNextCmdImmediately_2

_wfcRts:
		rts

EB_EnableGravity:
		bclr	#$07,FallRate(a5)
		bra.w	ProcessNextCmdImmediately_1

EB_DisableGravity:
		bset	#$07,FallRate(a5)
		bra.w	ProcessNextCmdImmediately_1

; Cmd $41: set story flag [BehavParam] bit [script arg 2].
EB_SetFlag:
		bsr.s	LoadFlagCmdArgs
		bset	d7,(a6,d6.w)

_flagNext:
		moveq	#$3,d0
		bsr.w	LoadNextCmd
		bra.w	ProcessNextCmd

; Arguments for the flag commands: d6 = flag byte offset (BehavParam),
; d7 = bit number (script arg 2), a6 = g_Flags.
LoadFlagCmdArgs:
		clr.w	d6
		move.b	BehavParam(a5),d6
		movea.l	BehaviourLUTPtr(a5),a6
		move.b	2(a6),d7
		lea	(g_Flags).l,a6
		rts

; Cmd $43: clear story flag [BehavParam] bit [script arg 2].
EB_ClearFlag:
		bsr.s	LoadFlagCmdArgs
		bclr	d7,(a6,d6.w)
		bra.s	_flagNext

; Cmd $42: wait until the flag is set.
EB_WaitForFlagSet:
		bsr.s	LoadFlagCmdArgs
		btst	d7,(a6,d6.w)
		bne.s	_flagNext
		rts

; Cmd $46: wait until the flag is clear.
EB_WaitForFlagClear:
		bsr.s	LoadFlagCmdArgs
		btst	d7,(a6,d6.w)
		beq.s	_flagNext
		rts

; Cmd $44: hide (StateFlags bit 0) but keep running the script.
EB_Hide:
		bset	#$00,StateFlags(a5)
		bra.w	ProcessNextCmdImmediately_1

; Cmd $45: unhide as soon as nothing overlaps this spot.
EB_ShowWhenCollisionClear:
		move.l	a5,d0
		subi.l	#Player_X,d0
		jsr	(j_CheckForCollision).l
		bcs.s	_swcRts
		bclr	#$00,StateFlags(a5)
		bra.w	ProcessNextCmdImmediately_1

_swcRts:
		rts

; Cmd $47: wait until sprite slot BehavParam is no longer hostile.
EB_WaitSpriteNotHostile:
		clr.w	d0
		move.b	BehavParam(a5),d0
		lsl.w	#$07,d0
		lea	(Sprite1_X).l,a6
		tst.b	InteractFlags(a6,d0.w)
		bmi.s	_wshRts
		bra.w	ProcessNextCmdImmediately_2

_wshRts:
		rts

; Cmd $48: set sprite slot BehavParam's Speed to script arg 2.
EB_SetEntitySpeed:
		clr.w	d0
		move.b	BehavParam(a5),d0
		movea.l	BehaviourLUTPtr(a5),a6
		move.b	2(a6),d7
		lsl.w	#$07,d0
		lea	(Sprite1_X).l,a6
		move.b	d7,Speed(a6,d0.w)
		moveq	#$3,d0
		bsr.w	LoadNextCmd
		bra.w	ProcessNextCmd

; Cmd $49: flip to the pressed pose (face SW) with the switch sound.
EB_ActivateSwitch:
		bsr.w	EB_TurnSW
		bsr.w	RefreshSpriteFacing
		trap	#$00			  ; Trap00Handler
		dc.w SND_Switch
		bra.w	ProcessNextCmd

; Cmd $4A: flip back to the released pose (face NE).
EB_ResetSwitch:
		bsr.w	EB_TurnNE
		bsr.w	RefreshSpriteFacing
		bra.w	ProcessNextCmd

; Cmd $4B: teleport to cell X = BehavParam, Y = script arg 2.
EB_MoveToXYPosImmediate:
		move.b	BehavParam(a5),(a5)
		movea.l	BehaviourLUTPtr(a5),a6
		move.b	2(a6),Y(a5)
		movea.l	a5,a1
		jsr	(CalcSpriteHitbox).l
		moveq	#$3,d0
		bsr.w	LoadNextCmd
		bra.w	ProcessNextCmd

; Cmd $4C: teleport to Z = BehavParam.
EB_MoveToZPosImmediate:
		clr.w	d0
		move.b	BehavParam(a5),d0
		move.w	d0,Z(a5)
		movea.l	a5,a1
		bsr.w	CalcSpriteHitbox
		bra.w	ProcessNextCmdImmediately_2

; Cmd $4D: restore the spawn-time state (position, graphic, flags,
; dialogue, health); if the spawn spot is now blocked, hide instead.
EB_ResetToInitParams:
		move.w	InitX(a5),X(a5)
		move.w	InitSubX(a5),SubX(a5)
		move.w	InitRotAndSize(a5),RotationAndSize(a5)
		andi.b	#$1F,TileSource(a5)
		move.b	InitTileSource(a5),d0
		or.b	d0,TileSource(a5)
		move.w	InitAnimCtrl(a5),AnimCtrl(a5)
		move.b	InitInteractFlags(a5),InteractFlags(a5)
		move.w	InitZ(a5),Z(a5)
		move.b	InitGoldOrChestCont(a5),GoldOrChestContents(a5)
		move.b	InitCombatFlags(a5),CombatFlags(a5)
		move.w	InitDialogue(a5),Dialogue(a5)
		move.w	MaxHealth(a5),CurrentHealth(a5)
		clr.b	AIState(a5)
		movea.l	a5,a1
		jsr	(LookupSpriteAnimFlags).l
		jsr	(CalcSpriteHitbox).l
		jsr	(j_ValidateSpritePosition).l
		bcc.s	_resetOk
		bset	#$00,StateFlags(a5)
		rts

_resetOk:
		bclr	#$00,StateFlags(a5)
		clr.w	QueuedAction(a5)
		move.w	#$FFFF,PrevAction(a5)
		clr.w	AnimationFrame(a5)
		clr.w	AnimationIndex(a5)
		bra.w	ProcessNextCmdImmediately_1

; Cmd $64: run dialogue script action $100 + BehavParam.
EB_StartHiCutscene:
		move.w	#$0100,d0
		move.b	BehavParam(a5),d0
		bra.s	_runScript

; Cmd $4E: run dialogue script action BehavParam.
EB_StartLoCutscene:
		clr.w	d0
		move.b	BehavParam(a5),d0

_runScript:
		movem.l	a5,-(sp)
		bsr.w	ProcessDialogueScriptAction
		movem.l	(sp)+,a5
		bra.w	ProcessNextCmdImmediately_2

; Cmd $50: turn the player to facing BehavParam (0-3) and reload the
; idle pose.
EB_RotatePlayer:
		move.b	BehavParam(a5),d0
		lsl.b	#$06,d0
		lea	(Player_X).l,a0
		andi.b	#$3F,RotationAndSize(a0)
		or.b	d0,RotationAndSize(a0)
		ori.b	#$80,AnimCtrl(a0)
		movem.l	a5,-(sp)
		jsr	(j_SetPlayerIdlePose).l
		jsr	(j_LoadSprites).l
		movem.l	(sp)+,a5
		bra.w	ProcessNextCmdImmediately_2

; Cmd $51: turn hostile and load this sprite type's enemy stats.
EB_MakeHostile:
		bset	#$07,InteractFlags(a5)
		bset	#$07,InitInteractFlags(a5)
		movea.l	a5,a1
		bsr.w	GetEnemyStats
		bra.w	ProcessNextCmdImmediately_1

; Cmd $52: clear the hostile flag (also in the respawn template).
EB_MakeNonHostile:
		bclr	#$07,InteractFlags(a5)
		bclr	#$07,InitInteractFlags(a5)
		bra.w	ProcessNextCmdImmediately_1

; Cmd $3E: despawn (thunk to HideSprite); also called by the
; projectile handlers below.
EB_DespawnEntity:
		jmp	(j_HideSprite).l

; Cmd $2B: run the sprite's EnemyAI_*_B routine this tick.
EB_RunSpecialAI:
		jmp	(j_RunEnemyAI_B).l

; Cmd $53: walk normally again (clear CombatFlags bit 1).
EB_DisableWalkBackwards:
		bclr	#$01,CombatFlags(a5)
		bra.w	ProcessNextCmdImmediately_1

; Cmd $54: walk backwards (CombatFlags bit 1: walk cycle plays in
; reverse and the facing is drawn flipped 180 degrees).
EB_EnableWalkBackwards:
		bset	#$01,CombatFlags(a5)
		bra.w	ProcessNextCmdImmediately_1

; Cmd $55: scripted collapse animation stepped by BehavParam: thud +
; special-anim frame 0, frame 4 at $0A, sunken frame with reduced
; height at $14, then blinks out and hides from $1E (also the
; shattered-vase behaviour set by EB_ThrownObject).
EB_SpecialAnimation:
		move.b	BehavParam(a5),d0
		addq.b	#$01,BehavParam(a5)
		tst.b	d0
		bne.s	_saMid
		trap	#$00			  ; Trap00Handler
		dc.w SND_Thud
		move.w	#$0008,AnimationIndex(a5)
		clr.w	AnimationFrame(a5)
		bset	#$07,RenderFlags(a5)
		rts

_saMid:
		cmpi.b	#$0A,d0
		bne.s	_saLate
		move.w	#$0008,AnimationIndex(a5)
		move.w	#$0004,AnimationFrame(a5)
		bset	#$07,RenderFlags(a5)
		rts

_saLate:
		cmpi.b	#$14,d0
		bcs.s	_saRts
		bne.s	_saFlicker
		move.w	#$0008,AnimationIndex(a5)
		move.w	#$0008,AnimationFrame(a5)
		bset	#$07,RenderFlags(a5)
		subi.w	#$000C,HitBoxZEnd(a5)
		subi.b	#$0C,Height(a5)
		rts

_saFlicker:
		bchg	#$06,InteractFlags(a5)
		cmpi.b	#$1E,d0
		bcs.s	_saRts
		jmp	(j_HideSprite).l

_saRts:
		rts

; Cmd $56: rise back to the spawn height (InitZ); on contact with
; something above it keeps pushing an extra step per tick.
EB_MoveUpToInitPos:
		bsr.w	RaiseSpriteZ
		bsr.w	CheckZMoveCollision
		bcs.w	_muiSink
		bset	#ACTB_JUMP,Action1(a5)
		move.w	Z(a5),d0
		cmp.w	InitZ(a5),d0
		bcs.w	_muiRts
		moveq	#$1,d0
		bra.w	LoadNextCmd

_muiSink:
		clr.w	d0
		move.b	Speed(a5),d0
		add.w	d0,Z(a5)
		add.w	d0,HitBoxZEnd(a5)

_muiRts:
		rts

; Cmd $57: apply tile swap BehavParam (DoTileSwap).
EB_TriggerTileSwap:
		movem.l	a5,-(sp)
		move.b	BehavParam(a5),d0
		lsl.b	#$03,d0
		jsr	(j_DoTileSwap).l
		jsr	(j_EnableDMAQueueProcessing).l
		movem.l	(sp)+,a5
		bra.w	ProcessNextCmdImmediately_2

; Cmd $59: print string number (BehavParam<<8 | script arg 2).
EB_PrintText:
		jsr	(j_ReloadTextbox).l
		move.b	BehavParam(a5),d0
		lsl.w	#$08,d0
		movea.l	BehaviourLUTPtr(a5),a6
		move.b	2(a6),d0
		jsr	(j_PrintString_0).l
		moveq	#$3,d0
		bsr.w	LoadNextCmd
		bra.w	ProcessNextCmd

; Cmd $5A: fly forward for BehavParam ticks; on impact it despawns
; and a struck vulnerable hostile takes damage as from a player
; attack, with hitstun (behaviour $13E).
EB_ProjectileHitEnemies:
		bsr.w	MoveSpriteForward
		bcs.s	_phHit
		subq.b	#$01,BehavParam(a5)
		bne.s	_phRts
		bra.w	ProcessNextCmdImmediately_2

_phRts:
		rts

_phHit:
		movem.l	d7-a0,-(sp)
		bsr.w	EB_DespawnEntity
		movem.l	(sp)+,d7-a0
		tst.b	d7
		bpl.s	_phDone
		movea.l	a0,a5
		btst	#$00,CombatFlags(a5)
		bne.s	_phDone
		move.b	InteractFlags(a5),d0
		andi.b	#$82,d0
		cmpi.b	#$80,d0
		bne.s	_phDone
		move.w	Defence(a5),d0
		bsr.w	CalculatePlayerDamageOutput
		sub.w	d0,CurrentHealth(a5)
		bhi.s	_phHitstun
		bsr.w	MarkEnemyDead
		bra.s	_phDone

_phHitstun:
		bsr.w	StartEnemyHitstun
		move.w	#$013E,BehaviourLUTIndex(a5)
		jsr	(j_LoadSpriteBehaviour).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_EnemyHit1

_phDone:
		rts

; Cmd $63: fly forward; a wall or a sprite of a different type
; despawns it (contact damage applies on the way), sprites of the
; same type are flown through.
EB_ProjectileMove:
		bsr.w	MoveSpriteForward
		bcs.s	_pmHit

_pmCount:
		subq.b	#$01,BehavParam(a5)
		bne.s	_pmRts
		bra.w	ProcessNextCmdImmediately_2

_pmRts:
		rts

_pmHit:
		tst.b	d7
		beq.s	_pmDespawn
		move.b	SpriteType(a5),d0
		cmp.b	SpriteType(a0),d0
		beq.s	_pmCount

_pmDespawn:
		movem.l	d7-a0,-(sp)
		bsr.w	EB_DespawnEntity
		movem.l	(sp)+,d7-a0
		rts
; Unreachable leftover.
		ori	#$01,ccr
		rts

; Cmd $65: as EB_ProjectileMove, but each tick also takes a second
; step rotated 90 degrees CW - a diagonal path between two facings.
EB_ProjectileWeaveCW:
		bsr.w	MoveSpriteForward
		bcs.s	_wcwHit

_wcwStep2:
		bsr.s	RotateFacingCW
		bsr.w	MoveSpriteForward
		bcs.s	_wcwHit
		bsr.s	RotateFacingCCW
		subq.b	#$01,BehavParam(a5)
		bne.s	_wcwRts
		bra.w	ProcessNextCmdImmediately_2

_wcwRts:
		rts

_wcwHit:
		tst.b	d7
		beq.s	_wcwDespawn
		move.b	SpriteType(a5),d0
		cmp.b	SpriteType(a0),d0
		beq.s	_wcwStep2

_wcwDespawn:
		bsr.s	RotateFacingCCW
		bra.s	_pmHit

; Rotates the facing 90 degrees CW without touching the animation.
RotateFacingCW:
		move.b	RotationAndSize(a5),d0
		addi.b	#$40,d0
		andi.b	#$C0,d0
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d0,RotationAndSize(a5)
		rts

; Rotates the facing 90 degrees CCW without touching the animation.
RotateFacingCCW:
		move.b	RotationAndSize(a5),d0
		subi.b	#$40,d0
		andi.b	#$C0,d0
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d0,RotationAndSize(a5)
		rts

; Cmd $66: mirror of EB_ProjectileWeaveCW (second step rotated CCW).
EB_ProjectileWeaveCCW:
		bsr.w	MoveSpriteForward
		bcs.s	_wccwHit

_wccwStep2:
		bsr.s	RotateFacingCCW
		bsr.w	MoveSpriteForward
		bcs.s	_wccwHit
		bsr.s	RotateFacingCW
		subq.b	#$01,BehavParam(a5)
		bne.s	_wccwRts
		bra.w	ProcessNextCmdImmediately_2

_wccwRts:
		rts

_wccwHit:
		tst.b	d7
		beq.s	_wccwDespawn
		move.b	SpriteType(a5),d0
		cmp.b	SpriteType(a0),d0
		beq.s	_wccwStep2

_wccwDespawn:
		bsr.s	RotateFacingCW
		bra.s	_wcwHit

; Cmd $67: as EB_ProjectileMove, but also sinking (Speed per tick);
; despawns on landing.
EB_ProjectileFall:
		bsr.w	MoveSpriteForward
		bcs.w	_pfHit
		bsr.w	MoveSpriteDownToFloor
		bcs.w	_pfDespawn
		rts

_pfRts:
		rts

_pfHit:
		tst.b	d7
		beq.s	_pfDespawn
		move.b	SpriteType(a5),d0
		cmp.b	SpriteType(a0),d0
		beq.s	_pfRts

_pfDespawn:
		movem.l	d7-a0,-(sp)
		bsr.w	EB_DespawnEntity
		movem.l	(sp)+,d7-a0
		rts
; Unreachable leftover.
		ori	#$01,ccr
		rts

; Cmd $5D: start of a repeat block; BehavParam = iteration count
; (0 = keep the current count).
EB_RepeatBegin:
		move.b	BehavParam(a5),d0
		beq.s	_repSetPtr
		move.b	d0,RepeatCount(a5)

_repSetPtr:
		movea.l	BehaviourLUTPtr(a5),a0
		addq.l	#$02,a0
		move.l	a0,RepeatPtr(a5)
		bra.w	ProcessNextCmdImmediately_2

; Cmd $5E: loop back to the repeat block until the count runs out.
EB_RepeatEnd:
		subq.b	#$01,RepeatCount(a5)
		beq.w	ProcessNextCmdImmediately_1
		move.l	RepeatPtr(a5),BehaviourLUTPtr(a5)
		moveq	#$0,d0
		bsr.w	LoadNextCmd
		bra.w	ProcessNextCmd

; Cmd $5F: despawn/appear flicker - toggles visibility at the
; accelerating tick marks in DecayFlashFrames, advancing the script
; when the schedule ends.
EB_DecayFlash:
		addq.b	#$01,BehavParam(a5)
		lea	DecayFlashFrames(pc),a0

_dfScan:
		move.b	(a0)+,d0
		cmpi.b	#$FF,d0
		beq.s	_dfRts
		cmp.b	BehavParam(a5),d0
		bne.s	_dfScan
		bchg	#$06,InteractFlags(a5)
		cmpi.b	#$FF,1(a0)
		bne.s	_dfRts
		moveq	#$2,d0
		bra.w	LoadNextCmd

_dfRts:
		rts

; Tick numbers at which EB_DecayFlash toggles visibility.
DecayFlashFrames:	dc.b $08,$09,$10,$11,$17,$18,$1D,$1E,$22,$23,$26,$27,$29,$2A,$2B
		dc.b $2D,$2E,$31,$32,$36,$37,$3C,$3D,$43,$44,$4B,$4C,$54,$FF,$FF

; Cmd $60: EB_DecayFlash plus a spin between flicker steps, spinning
; slower as it materialises.
EB_FlashSpinAppear:
		move.b	BehavParam(a5),d0
		move.b	#$00,d1
		cmpi.b	#$2C,d0
		bcs.s	_fsStep
		move.b	#$01,d1
		cmpi.b	#$3C,d0
		bcs.s	_fsStep
		move.b	#$03,d1
		cmpi.b	#$46,d0
		bcs.s	_fsStep
		move.b	#$07,d1

_fsStep:
		and.b	d1,d0
		bne.w	EB_DecayFlash
		move.b	RotationAndSize(a5),d1
		addi.b	#$40,d1
		andi.b	#$C0,d1
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d1,RotationAndSize(a5)
		movea.l	a5,a1
		bsr.w	SetSpriteRotationAnimFlags
		bset	#$07,RenderFlags(a5)
		bra.w	EB_DecayFlash

; Cmd $61: mirror of EB_FlashSpinAppear - spins faster as it fades.
EB_FlashSpinDisappear:
		move.b	BehavParam(a5),d0
		move.b	#$07,d1
		cmpi.b	#$2C,d0
		bcs.s	_fsStep
		move.b	#$03,d1
		cmpi.b	#$3C,d0
		bcs.s	_fsStep
		move.b	#$01,d1
		cmpi.b	#$46,d0
		bcs.s	_fsStep
		move.b	#$00,d1
		bra.s	_fsStep

; Cmd $62: play sound BehavParam.
EB_PlaySound:
		move.b	BehavParam(a5),d0
		trap	#$00			  ; Trap00Handler
		dc.w SND_LoadFromD0
		bra.w	ProcessNextCmdImmediately_2

; Carries every sprite along with a moving platform it stands on
; (speed/direction sideways, Z upwards) - the sprite counterpart of
; MoveWithPlatform/MoveWithPlatformZ.
MoveSpritesWithPlatforms:
		lea	(Sprite1_X).l,a5
		moveq	#$E,d7

_mspLoop:
		move.b	(a5),d0
		bmi.s	_mspRts
		cmpi.b	#$7F,d0
		beq.s	_mspNext
		bset	#ACTBH_RIDING,QueuedAction(a5)
		movem.l	d7/a5,-(sp)
		movem.l	a5,-(sp)
		bsr.w	MoveSpriteWithPlatform
		movem.l	(sp)+,a5
		bsr.w	MoveSpriteWithPlatformZ
		movem.l	(sp)+,d7/a5
		bclr	#ACTBH_RIDING,QueuedAction(a5)

_mspNext:
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,_mspLoop

_mspRts:
		rts

; Drags the sprite along with the sprite it stands on (unless
; frictionless, InteractFlags bit 2): one step in the carrier's walk
; direction at the carrier's speed.
MoveSpriteWithPlatform:
		bsr.w	UpdateCarriedSpritePos
		move.w	SpriteUnderneath(a5),d0
		bmi.s	_carryRts
		btst	#$02,InteractFlags(a5)
		bne.s	_carryRts
		lea	(Player_X).l,a0
		adda.w	d0,a0
		move.b	Speed(a0),d0
		andi.b	#$0F,d0
		beq.s	_carryRts
		move.b	Speed(a5),d1
		movem.w	d1,-(sp)
		bsr.s	MoveSpriteInCarrierDir
		movem.w	(sp)+,d1
		move.b	d1,Speed(a5)
		rts

; Moves this sprite one step in carrier a0's current walk direction
; (Action1 bits), reusing MoveSpriteForward's per-direction chunks.
MoveSpriteInCarrierDir:
		move.b	d0,Speed(a5)
		move.b	Action1(a0),d1		  ; Direction of travel
		move.b	#$09,d0
		lsr.b	#$01,d1
		bcs.w	_moveNE
		move.b	#$06,d0
		lsr.b	#$01,d1
		bcs.w	_moveSW
		move.b	#$05,d0
		lsr.b	#$01,d1
		bcs.w	_moveNW
		move.b	#$0A,d0
		lsr.b	#$01,d1
		bcs.w	_moveSE

_carryRts:
		rts

; Carries the sprite upward with a rising (jumping) carrier: Z
; tracks the carrier's HitBoxZEnd.
MoveSpriteWithPlatformZ:
		move.w	SpriteUnderneath(a5),d0
		bmi.s	_mspzRts
		btst	#$06,StateFlags(a5)
		bne.s	_mspzRts
		lea	(Player_X).l,a0
		adda.w	d0,a0
		btst	#ACTB_JUMP,Action1(a0)
		beq.s	_mspzRts
		move.w	HitBoxZEnd(a0),d7
		sub.w	Z(a5),d7
		addq.w	#$01,d7
		beq.s	_mspzRts
		add.w	d7,Z(a5)
		add.w	d7,HitBoxZEnd(a5)
		rts

_mspzRts:
		rts

; Hides the sprite once it rests exactly on a pit floor (FLOOR_PIT)
; with gravity enabled, popping OnTick's return to end its tick.
DespawnSpriteInPit:
		move.w	GroundHeight(a5),d0
		andi.b	#$3F,d0
		cmpi.b	#FLOOR_PIT,d0
		bne.s	_pitRts
		tst.b	FallRate(a5)
		bmi.s	_pitRts
		clr.w	d0
		move.b	GroundHeight(a5),d0
		lsl.b	#$04,d0
		cmp.w	Z(a5),d0
		beq.s	_pitDespawn

_pitRts:
		rts

_pitDespawn:
		jsr	(j_MoveSpriteOffscreen).l
		movem.l	(sp)+,d0
		rts

; Continues sprite a0's jump while JumpRate's count/latch bits are
; set (sets the jump action and applies HandleJumpRise).
ProcessSpriteJump:
		movea.l	a0,a5
		move.b	JumpRate(a5),d0
		andi.w	#$001F,d0
		bne.s	_psjRise
		bclr	#$07,JumpRate(a5)
		beq.s	_psjRts

_psjRise:
		bset	#ACTB_JUMP,Action1(a5)
		jsr	(j_HandleJumpRise).l

_psjRts:
		rts

; Keeps a grabbed/carried sprite glued to the player: carried
; overhead (StateFlags bit 6) copies the full position to sit on the
; player's head (fireballs keep their own facing); grabbed (bit 5)
; inherits Player_SpriteUnderneath.
UpdateCarriedSpritePos:
		btst	#$06,StateFlags(a5)
		beq.s	_grabbed
		move.w	(Player_HitBoxZEnd).l,d0
		move.w	d0,HitBoxZEnd(a5)
		clr.w	d1
		move.b	Height(a5),d1
		sub.w	d1,d0
		addq.w	#$01,d0
		move.w	d0,Z(a5)
		cmpi.b	#$61,SpriteGraphic(a5)
		beq.s	_carriedPos
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d0,RotationAndSize(a5)

_carriedPos:
		move.l	(Player_X).l,(a5)
		move.l	(Player_CentreX).l,CentreX(a5)
		move.l	(Player_HitBoxXStart).l,HitBoxXStart(a5)
		move.l	(Player_HitBoxYStart).l,HitBoxYStart(a5)
		move.w	(Player_GroundHeight).l,GroundHeight(a5)
		move.w	(Player_HeightmapOffset).l,HeightmapOffset(a5)
		clr.w	SpriteUnderneath(a5)
		rts

_grabbed:
		btst	#$05,StateFlags(a5)
		beq.s	_ucsRts
		move.w	(Player_SpriteUnderneath).l,SpriteUnderneath(a5)

_ucsRts:
		rts

; Finds a sprite slot for spawning (projectiles, debris): returns
; a1 = first slot past the end of the table, or a hidden slot
; ($7F7F) whose StateFlags bit 0 is set; carry set when all 15 are
; taken.
FindFreeSpriteSlot:
		lea	(Sprite1_X).l,a1
		move.w	#$000E,d7

_ffsLoop:
		move.w	(a1),d0
		bmi.s	_ffsFound
		cmpi.w	#$7F7F,d0
		bne.s	_ffsNext
		btst	#$00,StateFlags(a1)
		bne.s	_ffsFound

_ffsNext:
		lea	SPRITE_SIZE(a1),a1
		dbf	d7,_ffsLoop
		ori	#$01,ccr
		rts

_ffsFound:
		tst.b	d0
		rts

; Initialises spawned sprite a1 as type d2: graphic, animation,
; dimensions, hitbox and behaviour script, keeping the table's
; $FFFF terminator intact.
InitSpawnedSprite:
		movem.l	a1/a5,-(sp)
		clr.b	StateFlags(a1)
		clr.b	InteractFlags(a1)
		move.b	#$01,AnimCtrl(a1)
		move.b	d2,d0
		move.b	d0,SpriteType(a1)
		bsr.w	LookupSpriteGfxIndex
		jsr	(LookupSpriteAnimFlags).l
		move.b	SpriteGraphic(a1),d0
		bsr.w	GetSpriteDims
		movem.l	a1,-(sp)
		bsr.w	CalcSpriteHitbox
		movem.l	(sp)+,a1
		move.b	RotationAndSize(a1),d1
		bsr.w	SetSpriteRotationAnimFlags
		bset	#$07,RenderFlags(a1)
		tst.w	SPRITE_SIZE(a1)
		bne.s	_issBehav
		move.w	#$FFFF,SPRITE_SIZE(a1)

_issBehav:
		movea.l	a1,a5
		jsr	(j_LoadSpriteBehaviour).l
		movem.l	(sp)+,a1/a5
		rts

		modend
