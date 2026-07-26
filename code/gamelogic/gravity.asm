Gravity	module

; Run gravity (ProcessGravity) for the player / for entity a0, setting
; the fall action bit and returning d6 = distance fallen.
ApplyGravityPlayer:
		lea	(Player_X).l,a0


ApplyGravity:
		move.w	Z(a0),d6
		bsr.s	ProcessGravity
		sub.w	Z(a0),d6
		beq.s	_noFall
		bset	#ACTB_FALL,Action1(a0)

_noFall:
		rts


; Gravity: FallRate low 5 bits count fall frames (bit 7 = no gravity),
; indexing FallAcceleration for this frame's fall speed, clamped to the
; drop distance available below. No-op once at the room's floor height.
ProcessGravity:
		move.b	(g_RoomMinHeight).l,d4
		andi.w	#$00FF,d4
		cmp.w	Z(a0),d4
		beq.s	_fallDone
		move.b	FallRate(a0),d0
		bmi.s	_fallDone
		andi.b	#$1F,d0
		ext.w	d0
		cmpi.b	#$10,d0
		bls.s	_clampRate
		move.b	#$10,d0

_clampRate:
		andi.b	#$E0,FallRate(a0)
		clr.w	d2
		move.b	FallAcceleration(pc,d0.w),d2
		addq.b	#$01,d0
		bsr.s	GetDropDistance
		cmp.w	d2,d5
		bhi.s	_applyFall
		clr.b	d0
		move.w	d5,d2
		beq.s	_storeRate

_applyFall:
		sub.w	d2,Z(a0)
		sub.w	d2,HitBoxZEnd(a0)

_storeRate:
		or.b	d0,FallRate(a0)

_fallDone:
		rts

FallAcceleration:
		dc.b $01, $01, $01, $02, $02, $02, $02, $03
		dc.b $03, $03, $04, $04, $04, $05, $06,	$07
		dc.b $08, $FF


; d5 = how far entity a0 can drop: Z minus the higher of the heightmap
; floor (rescanned only after the entity moved horizontally, cached in
; FloorHeight) and the tallest standable sprite below.
GetDropDistance:
		movem.w	d0/d2/d6-d7,-(sp)
		clr.w	d4
		move.b	FloorHeight(a0),d4
		move.b	MovedDirFlags(a0),d7
		andi.b	#$0F,d7
		beq.s	_dropSprites
		move.w	Z(a0),d7
		bsr.s	GetHighestFloorUnder
		move.b	d4,FloorHeight(a0)

_dropSprites:
		movem.w	d4,-(sp)
		bsr.w	GetSpriteFloorUnder
		movem.w	(sp)+,d4
		cmp.w	d5,d4
		bcc.s	_dropDist
		move.w	d5,d4

_dropDist:
		move.w	Z(a0),d5
		sub.w	d4,d5
		movem.w	(sp)+,d0/d2/d6-d7
		rts


; Scans the heightmap cells under a0's hitbox: d4 = tallest floor at
; or below d7 (entity Z), d1 = 1 if any cell is out of bounds for this
; entity (mask depends on player vs NPC).
GetHighestFloorUnder:
		clr.b	d0
		btst	#$04,GroundHeight(a0)	  ; 0x10 - Raft	track
		bne.s	_floorScan
		move.b	#$40,d0			  ; 0x40 - out of bounds to all
		cmpa.l	#Player_X,a0
		beq.s	_floorScan
		move.b	#$60,d0			  ; 0x60 = 0x40	| 0x20
						  ; 0x20 = Out of bounds to NPC	only

_floorScan:
		clr.w	d4
		move.w	HitBoxXStart(a0),d1
		move.w	HitBoxYStart(a0),d2
		move.w	HitBoxYEnd(a0),d6
		move.w	d2,d5
		lsr.w	#$04,d5
		lsr.w	#$04,d6
		sub.w	d5,d6
		lsr.w	#$04,d2
		jsr	(MultiplyD2By148).l
		lea	(g_HeightMap).l,a6
		adda.w	d2,a6
		move.w	d1,d3
		lsr.w	#$03,d1
		andi.b	#$FE,d1
		adda.w	d1,a6
		move.w	HitBoxXEnd(a0),d5
		lsr.w	#$04,d3
		lsr.w	#$04,d5
		sub.w	d3,d5
		clr.b	d1

_rowLoop:
		movem.l	d5/a6,-(sp)

_cellLoop:
		move.b	(a6),d3
		move.b	d3,d2
		and.b	d0,d2
		beq.s	_cellHeight
		move.b	#$01,d1

_cellHeight:
		andi.w	#$000F,d3
		lsl.b	#$04,d3
		cmp.w	d4,d3
		bls.s	_cellNext
		cmp.w	d7,d3
		bhi.s	_cellNext
		move.w	d3,d4

_cellNext:
		addq.w	#$02,a6
		dbf	d5,_cellLoop
		movem.l	(sp)+,d5/a6
		lea	$94(a6),a6
		dbf	d6,_rowLoop
		rts


; d5 = top (+1) of the tallest standable sprite under a0's hitbox that
; is below a0's Z.
GetSpriteFloorUnder:
		move.w	HitBoxXStart(a0),d1
		move.w	HitBoxXEnd(a0),d2
		move.w	HitBoxYStart(a0),d3
		move.w	HitBoxYEnd(a0),d4
		move.w	Z(a0),d6
		clr.w	d5
		lea	(Player_X).l,a1
		moveq	#$F,d7

_sfLoop:
		cmpa.l	a0,a1
		beq.s	_sfNext
		cmp.w	HitBoxXEnd(a1),d1
		bhi.s	_sfNext
		cmp.w	HitBoxXStart(a1),d2
		bcs.s	_sfNext
		cmp.w	HitBoxYEnd(a1),d3
		bhi.s	_sfNext
		cmp.w	HitBoxYStart(a1),d4
		bcs.s	_sfNext
		cmp.w	HitBoxZEnd(a1),d6
		bls.s	_sfNext
		cmp.w	HitBoxZEnd(a1),d5
		bhi.s	_sfNext
		tst.b	StateFlags(a1)
		bne.s	_sfNext
		move.w	HitBoxZEnd(a1),d5
		addq.w	#$01,d5

_sfNext:
		lea	SPRITE_SIZE(a1),a1
		tst.b	(a1)
		dbmi	d7,_sfLoop
		rts


; d5 = gap between a5's head (HitBoxZEnd) and the lowest sprite above
; it - the ladder-climb head-bump check.
GetClearanceAbove:
		move.w	HitBoxXStart(a5),d1
		move.w	HitBoxXEnd(a5),d2
		move.w	HitBoxYStart(a5),d3
		move.w	HitBoxYEnd(a5),d4
		move.w	HitBoxZEnd(a5),d6
		move.w	#$FFFF,d5
		lea	(Player_X).l,a1
		moveq	#$F,d7

_caLoop:
		cmpa.l	a5,a1
		beq.s	_caNext
		btst	#SF_CARRIED,StateFlags(a1)
		bne.s	_caNext
		cmp.w	HitBoxXEnd(a1),d1
		bhi.s	_caNext
		cmp.w	HitBoxXStart(a1),d2
		bcs.s	_caNext
		cmp.w	HitBoxYEnd(a1),d3
		bhi.s	_caNext
		cmp.w	HitBoxYStart(a1),d4
		bcs.s	_caNext
		cmp.w	Z(a1),d6
		bcc.s	_caNext
		cmp.w	Z(a1),d5
		bls.s	_caNext
		tst.b	StateFlags(a1)
		bne.s	_caNext
		move.w	Z(a1),d5

_caNext:
		lea	SPRITE_SIZE(a1),a1
		tst.b	(a1)
		dbmi	d7,_caLoop
		subq.b	#$01,d5
		sub.w	HitBoxZEnd(a5),d5
		rts


; Carry set if entity a5's current position is invalid: overlapping
; another sprite (via CheckForCollision) or on an out-of-bounds /
; too-tall floor (a1 = 0 marks the floor case).
ValidateSpritePosition:
		movem.l	a5,-(sp)
		move.l	a5,d0
		subi.l	#Player_X,d0
		bsr.w	CheckForCollision
		bcs.s	_vspCollide
		movem.l	(sp)+,a0
		move.b	($FF).w,d7
		bsr.w	GetHighestFloorUnder
		tst.b	d1
		bne.s	_vspFloorBlock
		cmp.w	Z(a0),d4
		bhi.s	_vspFloorBlock
		tst.b	d0
		rts

_vspCollide:
		movem.l	(sp)+,a5
		ori	#$01,ccr
		rts

_vspFloorBlock:
		movea.l	#$0,a1
		ori	#$01,ccr
		rts


; Finds the sprite whose top is exactly one unit under a5's feet:
; returns d0 = struct offset (or -1). A sprite overlapping at least
; the entity's size (RotationAndSize & $3E) wins outright; otherwise
; the largest X+Y overlap wins (scratch at g_Scratch1800/g_Scratch1804).
FindSpriteUnderneath:
		lea	(Player_X).l,a0
		move.w	Z(a5),d0
		subq.w	#$01,d0
		clr.w	(g_Scratch1800).l
		clr.l	(g_Scratch1804).l
		moveq	#$F,d7

_fsLoop:
		cmp.w	HitBoxZEnd(a0),d0
		bne.s	_fsNext
		move.w	HitBoxXStart(a5),d1
		move.w	HitBoxXEnd(a5),d2
		move.w	HitBoxYStart(a5),d3
		move.w	HitBoxYEnd(a5),d4
		cmp.w	HitBoxXEnd(a0),d1
		bhi.s	_fsNext
		cmp.w	HitBoxXStart(a0),d2
		bcs.s	_fsNext
		cmp.w	HitBoxYEnd(a0),d3
		bhi.s	_fsNext
		cmp.w	HitBoxYStart(a0),d4
		bcs.s	_fsNext
		move.w	HitBoxXEnd(a0),d5
		sub.w	d1,d5
		move.w	d2,d6
		sub.w	HitBoxXStart(a0),d6
		cmp.w	d5,d6
		bcc.s	_fsOverlapY
		move.w	d6,d5

_fsOverlapY:
		move.w	HitBoxYEnd(a0),d6
		sub.w	d3,d6
		sub.w	HitBoxYStart(a0),d4
		cmp.w	d6,d4
		bcc.s	_fsSizeChk
		move.w	d4,d6

_fsSizeChk:
		move.b	RotationAndSize(a5),d4
		andi.b	#$3E,d4
		cmp.b	d4,d5
		bcs.s	_fsScore
		cmp.b	d4,d6
		bcs.s	_fsScore
		move.l	a0,d0
		bra.s	_fsFound

_fsScore:
		move.w	HitBoxYEnd(a5),d4
		add.w	d5,d6
		cmp.w	(g_Scratch1800).l,d6
		bls.s	_fsNext
		move.w	d6,(g_Scratch1800).l
		move.l	a0,(g_Scratch1804).l

_fsNext:
		lea	SPRITE_SIZE(a0),a0
		tst.b	(a0)
		dbmi	d7,_fsLoop
		move.l	(g_Scratch1804).l,d0
		beq.s	_fsNone

_fsFound:
		subi.l	#Player_X,d0
		rts

_fsNone:
		moveq	#$FFFFFFFF,d0
		rts

		modend
