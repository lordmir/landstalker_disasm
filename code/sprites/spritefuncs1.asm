SpriteFuncs1	module
; Advances the animation frame of every active sprite once per tick.
UpdateFrames:
		lea	(Sprite1_X).l,a0
		moveq	#$0E,d7

_ufLoop:
		move.b	(a0),d0
		bmi.s	_ufDone
		cmpi.b	#$7F,d0
		beq.s	_ufNext
		movem.l	d7-a0,-(sp)
		bsr.s	UpdateSpriteFrame
		movem.l	(sp)+,d7-a0

_ufNext:
		lea	$80(a0),a0
		dbf	d7,_ufLoop

_ufDone:
		rts


; Chooses sprite a0's animation index/frame from its queued action
; and facing. AnimFlags (d3, from the SpriteAnimFlags table) selects
; the sprite's capabilities: bit 0 = idle breathing cycle, bit 1 =
; alternate idle bank (+8), bit 2 = has a jump animation, bit 3 =
; two-frame walk, bit 4 = never rotate with facing, bit 5 = has a
; damage animation, bit 6 = eight-phase walk / extended attack set.
; CombatFlags bit 1 mirrors the facing (moving backwards), bit 6
; picks the disguised set (mimics/mushrooms).
UpdateSpriteFrame:
		move.w	PrevAction(a0),d2
		move.w	QueuedAction(a0),d0
		move.w	d0,PrevAction(a0)
		btst	#$01,InteractFlags(a0)
		beq.s	_chkAnim
		move.b	RenderFlags(a0),d1
		andi.b	#$07,d1
		bne.s	_chkAnim
		bchg	#$06,InteractFlags(a0)

_chkAnim:
		move.b	AnimCtrl(a0),d1
		andi.b	#$7F,d1
		beq.s	_clrForce
		move.b	AnimFlags(a0),d3
		btst	#$05,d3			  ; HasTakeDamageAnim
		beq.s	_chkAction
		move.w	d0,d1
		andi.w	#ACT_DAMAGE,d1
		bne.w	LoadDamageAnimFrame	  ; Bit5: HasDamageAnim

_chkAction:
		tst.b	AnimCtrl(a0)
		bmi.s	_resetFrame
		cmpi.b	#$FF,d0			  ; Any	Movement
		beq.w	_pickupFrame
		tst.w	d0
		beq.s	LoadIdleAnimFrame	  ; Idle
		btst	#$00,InteractFlags(a0)
		bne.s	_usfDone
		move.w	d0,d1
		andi.w	#ACT_DAMAGE,d1		  ; Take Dmg
		bne.w	LoadDamageAnimFrame	  ; Bit5: HasDamageAnim
		move.w	d0,d1
		andi.w	#ACT_ATTACK_MASK,d1		  ; Attack
		bne.w	LoadAttackAnimFrame
		move.w	d0,d1
		andi.w	#ACT_AIR_MASK,d1		  ; Jump/Fall
		bne.w	LoadJumpAnimFrame
		move.w	d0,d1
		andi.w	#ACT_WALK_MASK,d1	  ; Walk
		bne.w	LoadWalkAnimFrame
		rts

_clrForce:
		andi.b	#$7F,AnimCtrl(a0)

_usfDone:
		rts

; External entry (dialogue actions): force the frame dirty and reset
; sprite a0 to its facing-appropriate idle frame.
ForceIdleFrame:
		ori.b	#$80,AnimCtrl(a0)
		move.b	AnimFlags(a0),d3
		bra.s	_resetFrame

LoadIdleAnimFrame:
		btst	#$00,d3
		beq.w	_idleCycle
		btst	#$00,InteractFlags(a0)
		bne.s	_usfDone
		bsr.w	CheckAnimActionChanged

_resetFrame:
		clr.w	AnimationFrame(a0)
		move.w	#$0000,d1
		btst	#$06,CombatFlags(a0)		  ; True for mimic, mushroom
		beq.w	_chkNoRotate
		move.w	#$0008,d1

_chkNoRotate:
		btst	#$01,d3
		beq.s	GetRotatedFrame		  ; Bit	4 - Do not rotate
		move.w	#$0008,d1

GetRotatedFrame:
		btst	#$04,d3			  ; Bit	4 - Do not rotate
		bne.s	GetNWFrame
		move.b	RotationAndSize(a0),d0
		andi.b	#DIR_MASK,d0
		beq.s	GetNWFrame
		cmpi.b	#DIR_SW,d0
		beq.s	GetNEFrame
		bhi.s	GetSEFrame

GetSWFrame:
		addq.w	#$04,d1
		move.w	d1,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts

GetNWFrame:
		move.w	d1,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts

GetSEFrame:
		move.w	d1,AnimationIndex(a0)
		bset	#$03,TileSource(a0)
		rts

GetNEFrame:
		addq.w	#$04,d1
		move.w	d1,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)

_rotDone:
		rts

; QueuedAction $FF: pick-up/put-down pose, staged from the previous
; action's carry/attack bits.
_pickupFrame:
		btst	#$00,InteractFlags(a0)
		bne.s	_rotDone
		clr.w	PrevAction(a0)
		bsr.w	CheckAnimActionChanged
		andi.w	#$07C0,d2
		beq.s	_pickupIdle
		subi.w	#$0040,d2
		lsr.w	#$04,d2
		move.w	d2,AnimationFrame(a0)
		btst	#$01,d3
		beq.s	_pickupNoAlt
		move.w	#$0018,d1
		bra.w	GetRotatedFrame		  ; Bit	4 - Do not rotate

_pickupNoAlt:
		move.w	#$0010,d1
		bra.w	GetRotatedFrame		  ; Bit	4 - Do not rotate

_pickupIdle:
		clr.w	AnimationFrame(a0)
		move.w	#$0000,d1
		btst	#$06,CombatFlags(a0)
		beq.w	GetRotatedFrame		  ; Bit	4 - Do not rotate
		move.w	#$0008,d1
		bra.w	GetRotatedFrame		  ; Bit	4 - Do not rotate

_idleCycle:
		move.b	AnimPhase(a0),d0
		move.b	d0,d1
		move.b	Speed(a0),d7
		bne.s	_idleStep
		move.w	#$0001,d7

_idleStep:
		add.b	d7,d1
		neg.b	d7
		and.b	d7,d1
		move.b	d1,AnimPhase(a0)
		cmpi.b	#$3F,d0
		bls.s	_idleDone
		andi.b	#$3F,d0
		move.b	d0,AnimPhase(a0)
		move.b	AnimationFrame1(a0),d1
		addq.b	#$04,d1
		andi.b	#$04,d1
		move.b	d1,AnimationFrame1(a0)
		bset	#$07,AnimCtrl(a0)

_idleDone:
		rts

LoadWalkAnimFrame:
		btst	#$06,d3
		bne.s	_walk8
		btst	#$03,d3
		bne.w	_walk2
		bra.s	_walk4

_walk8:
		move.b	#$1C,d5
		move.w	#$0008,d4
		andi.b	#$0F,d2
		cmp.b	d1,d2
		beq.s	_walkTick8
		move.b	#$08,AnimPhase(a0)

_walkTick8:
		move.b	AnimPhase(a0),d0
		move.b	d0,d1
		move.b	Speed(a0),d7
		add.b	d7,d7
		bne.s	_walkAdv
		move.w	#$0004,d7
		bra.s	_walkAdv

_walk4:
		move.b	#$0C,d5
		clr.w	d4
		btst	#$06,CombatFlags(a0)
		beq.s	_walkPhase
		move.w	#$0018,d4

_walkPhase:
		andi.b	#$0F,d2
		cmp.b	d1,d2
		beq.s	_walkTick
		move.b	#$08,AnimPhase(a0)

_walkTick:
		move.b	AnimPhase(a0),d0
		move.b	d0,d1
		move.b	Speed(a0),d7
		bne.s	_walkAdv
		move.w	#$0002,d7

_walkAdv:
		btst	#$01,CombatFlags(a0)
		beq.s	_walkFwd
		sub.b	d7,d1
		bra.s	_walkWrap

_walkFwd:
		add.b	d7,d1

_walkWrap:
		neg.b	d7
		and.b	d7,d1
		move.b	d1,AnimPhase(a0)
		cmpi.b	#$07,d0
		bls.s	_walkFacing
		andi.b	#$07,d0
		move.b	d0,AnimPhase(a0)
		move.b	AnimationFrame1(a0),d0
		move.b	d0,d1
		addq.b	#$04,d1
		and.b	d5,d1
		move.b	d1,AnimationFrame1(a0)
		bset	#$07,AnimCtrl(a0)

_walkFacing:
		move.b	RotationAndSize(a0),d0
		btst	#$01,CombatFlags(a0)
		beq.s	_walkRotChk
		eori.b	#DIR_FLIP,d0

_walkRotChk:
		btst	#$04,d3
		bne.s	_walkNoFlip
		andi.b	#DIR_MASK,d0
		beq.s	_walkNoFlip
		cmpi.b	#DIR_SW,d0
		beq.s	_walkNEIdx
		bhi.s	_walkFlip
		addq.w	#$04,d4
		bra.s	_walkFlip

_walkNoFlip:
		move.w	d4,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)
		rts

_walkFlip:
		move.w	d4,AnimationIndex(a0)
		bset	#$03,TileSource(a0)

_walkDone:
		rts

_walkNEIdx:
		addq.w	#$04,d4
		bra.s	_walkNoFlip

_walk2:
		btst	#$03,d3
		beq.s	_walkDone
		move.b	#$04,d5
		clr.w	d4
		btst	#$06,CombatFlags(a0)
		beq.w	_walkPhase
		move.w	#$0008,d4
		bra.w	_walkPhase

LoadAttackAnimFrame:
		bsr.w	CheckAnimActionChanged
		btst	#$06,d3
		bne.s	GetAttackFrame
		move.w	#$0008,d2
		bra.s	_attackFrames

GetAttackFrame:
		move.w	#$0038,d2

_attackFrames:
		clr.w	AnimationFrame(a0)
		cmpi.w	#$0100,d1
		beq.s	GetRotatedAnimIdx
		move.w	#$0004,AnimationFrame(a0)
		cmpi.w	#$0200,d1
		beq.s	GetRotatedAnimIdx
		move.w	#$0008,AnimationFrame(a0)
		cmpi.w	#$0300,d1
		beq.s	GetRotatedAnimIdx
		move.w	#$000C,AnimationFrame(a0)
		cmpi.w	#$0400,d1
		beq.s	GetRotatedAnimIdx
		move.w	#$0010,AnimationFrame(a0)
		cmpi.w	#$0500,d1
		beq.s	GetRotatedAnimIdx
		move.w	#$0014,AnimationFrame(a0)
		cmpi.w	#$0600,d1
		beq.s	GetRotatedAnimIdx
		move.w	#$0018,AnimationFrame(a0)

GetRotatedAnimIdx:
		move.b	RotationAndSize(a0),d0
		btst	#$01,CombatFlags(a0)
		beq.s	_raiFacing
		eori.b	#DIR_FLIP,d0

_raiFacing:
		andi.b	#DIR_MASK,d0
		beq.s	_raiNoFlip
		cmpi.b	#DIR_SW,d0
		beq.s	_raiNEIdx
		bhi.s	_raiFlip
		addq.w	#$04,d2

_raiFlip:
		move.w	d2,AnimationIndex(a0)
		bset	#$03,TileSource(a0)	  ; Set	HFlip
		rts

_raiNEIdx:
		addq.w	#$04,d2

_raiNoFlip:
		move.w	d2,AnimationIndex(a0)
		bclr	#$03,TileSource(a0)	  ; Clear HFlip
		rts

LoadJumpAnimFrame:
		btst	#$02,d3
		beq.w	LoadIdleAnimFrame
		bsr.w	CheckAnimActionChanged
		clr.w	AnimationFrame(a0)
		btst	#$06,d3
		beq.s	_jumpNoAlt
		move.w	#$0020,d2
		bra.s	GetRotatedAnimIdx

_jumpNoAlt:
		move.w	#$0010,d2
		bra.s	GetRotatedAnimIdx

LoadDamageAnimFrame:
		btst	#$05,d3			  ; Bit5: HasDamageAnim
		beq.w	_dmgDone
		bsr.w	CheckAnimActionChanged
		clr.w	AnimationFrame(a0)
		btst	#$02,d3
		bne.s	_dmgAlt
		move.w	#$0018,d2
		bra.w	GetRotatedAnimIdx

_dmgDone:
		rts

_dmgAlt:
		move.w	#$0020,d2
		bra.w	GetRotatedAnimIdx


; Head guard for the Load*AnimFrame handlers: d0 = new action, d2 =
; previous. If the action changed, marks the frame dirty (AnimCtrl
; bit 7) and returns; if unchanged, pops the return address and
; returns straight to UpdateSpriteFrame's caller - no frame work.
CheckAnimActionChanged:
		cmp.w	d0,d2
		beq.s	_noChange
		cmpi.w	#$FFFF,d2
		bne.s	_markDirty
		clr.w	d2

_markDirty:
		bset	#$07,AnimCtrl(a0)
		rts

_noChange:
		movem.l	(sp)+,d0
		rts


; Sets AnimFlags for sprite a1 from the SpriteAnimFlags table
; ({graphic, flags} byte pairs, negative-terminated; default $01).
LookupSpriteAnimFlags:
		move.b	AnimCtrl(a1),d1
		andi.b	#$7F,d1
		beq.s	_afDefault
		move.b	SpriteGraphic(a1),d1
		lea	SpriteAnimFlags(pc),a0

_afScan:
		move.b	1(a0),d3
		bmi.s	_afDefault
		cmp.b	(a0),d1
		beq.s	_afSet
		addq.l	#$02,a0
		bra.s	_afScan

_afDefault:
		move.b	#$01,d3

_afSet:
		move.b	d3,AnimFlags(a1)
		rts

		modend
