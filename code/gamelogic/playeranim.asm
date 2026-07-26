PlayerAnim	module

; Player-specific replacement for UpdateSpriteFrame (used whenever
; Nigel's graphic is loaded): decodes Player_Action with priority
; damage > attack > jump/fall > walk > carry > climb and sets
; AnimationIndex/Frame + facing flip accordingly.
UpdatePlayerSprite:


		lea	(Player_X).l,a0
		cmpi.b	#SpriteB_Nigel,Player_SpriteGraphic-Player_X(a0)
		beq.s	UpdatePlayerSpriteFrame
		jsr	(j_UpdateSpriteFrame).l
		rts

UpdatePlayerSpriteFrame:
		move.w	(Player_PrevAction).l,d2
		move.w	(Player_Action).l,d0
		move.w	d0,(Player_PrevAction).l
		btst	#IF_NO_ROTATE,InteractFlags(a0)
		bne.s	_upsDone
		tst.w	d0
		beq.s	_idle
		move.w	d0,d1
		andi.w	#$2000,d1		  ; Take Damage
		bne.w	PlayerTakeDamage
		move.w	d0,d1
		andi.w	#$0700,d1		  ; Attack
		bne.w	PlayerAttack
		move.w	d0,d1
		andi.w	#$0030,d1		  ; Jump/Fall
		bne.w	PlayerJump
		move.w	d0,d1
		andi.w	#$000F,d1		  ; Move
		bne.w	PlayerMove
		move.w	d0,d1
		andi.w	#$00C0,d1		  ; PickUp/Carry/Throw
		bne.s	PlayerPickUp
		move.w	d0,d1
		andi.w	#$1000,d1		  ; Climb
		bne.w	PlayerClimb

_upsDone:
		rts

_idle:
		bsr.w	_markFrameDirty

SetPlayerIdlePose:
		clr.w	AnimationFrame(a0)
		move.b	RotationAndSize(a0),d0
		andi.b	#DIR_MASK,d0
		beq.s	_idleNE
		cmpi.b	#DIR_SW,d0
		beq.s	_idleSW
		bhi.s	_idleNW
		move.w	#$0004,AnimationIndex(a0)
		bset	#TS_HFLIP,TileSource(a0)
		rts

_idleNE:
		clr.w	AnimationIndex(a0)
		bclr	#TS_HFLIP,TileSource(a0)
		rts

_idleNW:
		clr.w	AnimationIndex(a0)
		bset	#TS_HFLIP,TileSource(a0)
		rts

_idleSW:
		move.w	#$0004,AnimationIndex(a0)
		bclr	#TS_HFLIP,TileSource(a0)
		rts

PlayerPickUp:
		bsr.s	_markFrameDirty
		clr.w	AnimationFrame(a0)
		cmpi.w	#$00C0,d1
		beq.s	_puFace
		move.w	#$0004,AnimationFrame(a0)
		cmpi.w	#$0080,d1
		beq.s	_puFace
		move.w	#$0008,AnimationFrame(a0)

_puFace:
		move.b	RotationAndSize(a0),d0
		andi.b	#DIR_MASK,d0
		beq.s	_puFaceNE
		cmpi.b	#DIR_SW,d0
		beq.s	_puFaceSW
		bhi.s	_puFaceNW
		move.w	#$0014,AnimationIndex(a0)
		bset	#TS_HFLIP,TileSource(a0)
		rts

_puFaceNE:
		move.w	#$0010,AnimationIndex(a0)
		bclr	#TS_HFLIP,TileSource(a0)
		rts

_puFaceNW:
		move.w	#$0010,AnimationIndex(a0)
		bset	#TS_HFLIP,TileSource(a0)
		rts

_puFaceSW:
		move.w	#$0014,AnimationIndex(a0)
		bclr	#TS_HFLIP,TileSource(a0)
		rts


; Flag the frame graphics for reload if the action word changed.
_markFrameDirty:
		cmp.w	d0,d2
		beq.s	_mfdDone
		bset	#AC_FRAME_DIRTY,AnimCtrl(a0)
		bset	#RF_LAYOUT_DIRTY,RenderFlags(a0)

_mfdDone:
		rts


; Walk animation: 8 frames stepped at the walk speed, reversed while
; the walk-backwards flag is set; uses the carry-walk animation while
; carrying.
PlayerMove:
		andi.b	#$0F,d2
		cmp.b	d1,d2
		beq.s	_walkAnim
		clr.b	AnimPhase(a0)

_walkAnim:
		move.w	#$0008,AnimationIndex(a0)
		move.w	d0,d1
		andi.b	#$C0,d1
		beq.s	_walkPhase
		cmpi.b	#$18,(g_CarryPhase).l
		bcc.s	_walkPhase
		move.w	#$0010,AnimationIndex(a0)

_walkPhase:
		move.b	AnimPhase(a0),d0
		move.b	d0,d1
		move.b	(g_PlayerSpeed+1).l,d7
		bne.s	_walkStep
		move.w	#$0002,d7

_walkStep:
		add.b	d7,d1
		neg.b	d7
		and.b	d7,d1
		move.b	d1,AnimPhase(a0)
		andi.b	#$07,d0
		bne.s	_walkFacing
		move.b	AnimationFrame1(a0),d0
		move.b	d0,d1
		andi.b	#$E0,AnimationFrame1(a0)
		btst	#CF_WALK_BACKWARDS,CombatFlags(a0)
		beq.s	_walkFwdFrame
		subq.b	#$04,d1
		bra.s	_walkSetFrame

_walkFwdFrame:
		addq.b	#$04,d1

_walkSetFrame:
		andi.b	#$1C,d1
		or.b	d1,AnimationFrame1(a0)
		bset	#AC_FRAME_DIRTY,AnimCtrl(a0)
		bset	#RF_LAYOUT_DIRTY,RenderFlags(a0)

_walkFacing:
		move.b	RotationAndSize(a0),d0
		btst	#CF_WALK_BACKWARDS,CombatFlags(a0)
		beq.s	_walkFace
		eori.b	#DIR_FLIP,d0

_walkFace:
		andi.b	#$C0,d0
		beq.s	_walkNE
		cmpi.b	#$80,d0
		beq.s	_walkSW
		bhi.s	_walkNW
		ori.b	#$0C,AnimationIndex1(a0)
		bset	#TS_HFLIP,TileSource(a0)
		rts

_walkNE:
		ori.b	#$08,AnimationIndex1(a0)
		bclr	#TS_HFLIP,TileSource(a0)
		rts

_walkNW:
		ori.b	#$08,AnimationIndex1(a0)
		bset	#TS_HFLIP,TileSource(a0)
		rts

_walkSW:
		ori.b	#$0C,AnimationIndex1(a0)
		bclr	#TS_HFLIP,TileSource(a0)
		rts

PlayerJump:
		bsr.w	_markFrameDirty
		move.b	d0,d1
		clr.w	AnimationFrame(a0)
		andi.b	#$10,d1
		beq.s	_jumpAnim
		move.w	#$0004,AnimationFrame(a0)

_jumpAnim:
		clr.w	AnimationIndex(a0)
		clr.b	AnimPhase(a0)
		andi.b	#$C0,d0
		beq.s	_jumpFace
		cmpi.b	#$C0,d0
		beq.s	_jumpCarryBoth
		move.w	#$0010,AnimationIndex(a0)
		clr.w	AnimationFrame(a0)
		cmpi.b	#$80,d0
		beq.w	_jumpFace
		move.w	#$0004,AnimationFrame(a0)
		bra.s	_jumpFace

_jumpCarryBoth:
		move.w	#$0008,AnimationIndex(a0)

_jumpFace:
		move.b	RotationAndSize(a0),d0
		andi.b	#DIR_MASK,d0
		beq.s	_jumpNE
		cmpi.b	#DIR_SW,d0
		beq.s	_jumpSW
		bhi.s	_jumpNW
		addi.w	#$0024,AnimationIndex(a0)
		bset	#TS_HFLIP,TileSource(a0)
		rts

_jumpNE:
		addi.w	#$0020,AnimationIndex(a0)
		bclr	#TS_HFLIP,TileSource(a0)
		rts

_jumpNW:
		addi.w	#$0020,AnimationIndex(a0)
		bset	#TS_HFLIP,TileSource(a0)
		rts

_jumpSW:
		addi.w	#$0024,AnimationIndex(a0)
		bclr	#TS_HFLIP,TileSource(a0)
		rts

PlayerAttack:
		bsr.w	_markFrameDirty
		clr.w	AnimationFrame(a0)
		cmpi.w	#$0100,d1
		beq.s	_atkFace
		move.w	#$0004,AnimationFrame(a0)
		cmpi.w	#$0200,d1
		beq.s	_atkFace
		move.w	#$0008,AnimationFrame(a0)
		cmpi.w	#$0300,d1
		beq.s	_atkFace
		move.w	#$000C,AnimationFrame(a0)

_atkFace:
		move.b	RotationAndSize(a0),d0
		andi.b	#DIR_MASK,d0
		beq.s	_atkNE
		cmpi.b	#DIR_SW,d0
		beq.s	_atkSW
		bhi.s	_atkNW
		move.w	#$003C,AnimationIndex(a0)
		bset	#TS_HFLIP,TileSource(a0)
		rts

_atkNE:
		move.w	#$0038,AnimationIndex(a0)
		bclr	#TS_HFLIP,TileSource(a0)
		rts

_atkNW:
		move.w	#$0038,AnimationIndex(a0)
		bset	#TS_HFLIP,TileSource(a0)
		rts

_atkSW:
		move.w	#$003C,AnimationIndex(a0)
		bclr	#TS_HFLIP,TileSource(a0)
		rts

PlayerClimb:
		move.w	#$0040,AnimationIndex(a0)
		btst	#$06,RotationAndSize(a0)
		beq.s	_climbNoFlip
		bset	#TS_HFLIP,TileSource(a0)
		bra.s	_climbFrame

_climbNoFlip:
		bclr	#TS_HFLIP,TileSource(a0)

_climbFrame:
		move.b	AnimPhase(a0),d0
		andi.b	#$03,d0
		bne.s	_climbRet
		move.b	AnimPhase(a0),d0
		andi.w	#$000C,d0
		lsr.b	#$01,d0
		move.w	FrameNumbers(pc,d0.w),AnimationFrame(a0)
		bset	#AC_FRAME_DIRTY,AnimCtrl(a0)
		bset	#RF_LAYOUT_DIRTY,RenderFlags(a0)

_climbRet:
		rts
FrameNumbers:	dc.w $0000,$0004,$0000,$0008

PlayerTakeDamage:
		bsr.w	_markFrameDirty
		clr.w	AnimationFrame(a0)
		move.b	RotationAndSize(a0),d0
		andi.b	#DIR_MASK,d0
		beq.s	_dmgNE
		cmpi.b	#DIR_SW,d0
		beq.s	_dmgSW
		bcs.s	_dmgNW
		move.w	#$0044,AnimationIndex(a0)
		bset	#TS_HFLIP,TileSource(a0)
		rts

_dmgNE:
		move.w	#$0044,AnimationIndex(a0)
		bclr	#TS_HFLIP,TileSource(a0)
		rts

_dmgNW:
		move.w	#$0048,AnimationIndex(a0)
		bset	#TS_HFLIP,TileSource(a0)
		rts

_dmgSW:
		move.w	#$0048,AnimationIndex(a0)
		bclr	#TS_HFLIP,TileSource(a0)
		rts

		modend
