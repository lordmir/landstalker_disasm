Doors	module
; Opening door graphics: when the player steps on a door floor cell,
; these find the door in the room's DoorTable and remove its blocks
; from the foreground map (queued to VRAM), so the door visually
; opens before the warp. Returns carry set when a door was opened -
; the callers in FloorTypeDispatch then delay the warp 6 frames for
; the effect - or carry clear when the cell has no door graphic.
;
; DoorLookup is one byte per room (0 = no doors, else the room's
; DoorTable byte count + 1), summed to locate the room's entries.
; DoorTable entries are 2 bytes: {Y (low 6 bits) | size bit 6,
; X (low 6 bits) | size bits 6-7}, the three size bits indexing
; DoorSizes {column height, extra columns} pairs.

; Door on the NW wall: scan to the door's near corner along -Y.
CheckForDoorNW:
		move.l	#RAM_Start,d0
		move.w	(Player_HeightmapOffset).l,d0
		movea.l	d0,a0

_nwScan:
		suba.w	#$0094,a0
		move.w	(a0),d0
		andi.b	#$3F,d0
		cmpi.b	#FLOOR_DOOR_NW,d0
		beq.s	_nwScan
		lea	$94(a0),a0
		move.w	#$FFFE,d5
		clr.b	d1
		move.b	#$01,d3
		bra.s	_findDoor


; Door on the NE wall: scan to the door's near corner along -X.
CheckForDoorNE:
		move.l	#RAM_Start,d0
		move.w	(Player_HeightmapOffset).l,d0
		movea.l	d0,a0

_neScan:
		move.w	-(a0),d0
		andi.b	#$3F,d0
		cmpi.b	#FLOOR_DOOR_NE,d0
		beq.s	_neScan
		addq.w	#$02,a0
		move.w	#$0002,d5
		move.b	#$01,d1
		clr.b	d3

_findDoor:
		movem.w	d1/d3/d5,-(sp)
		move.w	(a0),d0
		movem.w	d0,-(sp)
		suba.l	#g_HeightMap,a0
		move.w	a0,d0
		ext.l	d0
		divu.w	#$0094,d0
		move.w	d0,d1			  ; Y co-ordinate (division)
		swap	d0
		lsr.b	#$01,d0			  ; X co-ordinate (remainder)
		lea	DoorLookup(pc),a0
		move.w	(g_CurrentRoom).l,d7
		moveq	#$00,d3
		moveq	#$00,d2

_roomIdxLoop:
		move.b	(a0)+,d3
		beq.s	_roomIdxNext		  ; Get	index to data based on room number
		subq.b	#$01,d3
		add.l	d3,d2

_roomIdxNext:
		dbf	d7,_roomIdxLoop		  ; Get	index to data based on room number
		tst.b	-1(a0)
		beq.s	_noDoor			  ; Return, nothing to do
		lea	DoorTable(pc),a0
		adda.l	d2,a0			  ; Get	pointer	to start of room data
		moveq	#$1F,d7

_entryLoop:
		move.b	(a0)+,d2		  ; Byte 1 into	d2
		bmi.s	_noDoor			  ; Negative? Return
		move.b	d2,d4			  ; d4 = byte 1
		move.b	(a0)+,d3		  ; d3 = byte 2
		andi.b	#$3F,d2			  ; d2 &= 0x3F (Y COORD)
		cmp.b	d2,d1
		bne.s	_entryNext		  ; No match? loop
		move.b	d3,d5			  ; d5 = byte 2
		andi.b	#$3F,d3			  ; d3 &= 0x3F (X COORD)
		cmp.b	d3,d0
		beq.s	_doorFound		  ; Jump if X and Y match

_entryNext:
		dbf	d7,_entryLoop

_noDoor:
		movem.w	(sp)+,d0
		movem.w	(sp)+,d1/d3/d5
		tst.b	d0
		rts

_doorFound:
		andi.b	#$40,d4
		andi.b	#$C0,d5
		lsr.b	#$03,d4			  ; d4 = bit 6 of byte 1
		lsr.b	#$05,d5			  ; d5 = bits 6-7 of byte 2
		or.b	d4,d5			  ; Combine bits. d5 between 0 and 7
		ext.w	d5
		move.b	DoorSizes(pc,d5.w),d6	  ; column height
		move.b	DoorSizes+1(pc,d5.w),d7	  ; extra columns
		sub.b	d6,d1			  ; Sub	height from X and Y co-ords
		sub.b	d6,d0
		movem.w	(sp)+,d5		  ; Heightmap entry
		lsr.w	#$08,d5
		andi.b	#$0F,d5			  ; Get	Z component
		sub.b	d5,d1
		sub.b	d5,d0
		move.b	d0,d2
		move.b	d1,d0
		subq.b	#$01,d6
		movem.w	(sp)+,d1/d3/d5
		add.b	d1,d2
		add.b	d3,d2
		add.b	d3,d0
		add.b	d6,d6
		ext.w	d6
		ext.w	d7
		andi.w	#$003F,d0
		move.w	d0,d1
		bsr.w	MultiplyD0By148
		andi.w	#$003F,d2
		move.w	d2,d3
		add.b	d2,d2
		add.w	d2,d0
		lea	(g_ForegroundBlocks).l,a0
		adda.w	d0,a0
		move.w	d3,d0
		move.w	d5,d4
		lsr.w	#$01,d4

_colLoop:
		movem.l	d0-d1/d4-d7,-(sp)
		bsr.s	ClearDoorColumn
		movem.l	(sp)+,d0-d1/d4-d7
		adda.w	d5,a0
		add.b	d4,d0
		dbf	d7,_colLoop
		trap	#$00			  ; Trap00Handler
		dc.w SND_DoorLock

		ori	#$01,ccr		  ; carry set =	door opened
		rts


; Clears one column of the door: jumps into the ladder below by
; height (d6 = (height-1)*2), clearing up to 8 blocks along the
; isometric vertical (row stride + one cell = $96) and queueing a
; VRAM update for each.
ClearDoorColumn:
		jmp	_clrJump(pc,d6.w)

DoorSizes:	dc.b $04,$00			  ; 0
		dc.b $04,$01			  ; 2
		dc.b $05,$01			  ; 4
		dc.b $01,$00			  ; 6
		dc.b $01,$00			  ; 8
		dc.b $01,$00			  ; 10
		dc.b $01,$00			  ; 12
		dc.b $01,$00			  ; 14

_clrJump:
		bra.s	_clr1
		bra.s	_clr2
		bra.s	_clr3
		bra.s	_clr4
		bra.s	_clr5
		bra.s	_clr6
		bra.s	_clr7
		clr.w	$41A(a0)
		bsr.w	QueueClearMapBlock
		addq.b	#$01,d0
		addq.b	#$01,d1

_clr7:
		clr.w	$384(a0)
		bsr.w	QueueClearMapBlock
		addq.b	#$01,d0
		addq.b	#$01,d1

_clr6:
		clr.w	$2EE(a0)
		bsr.w	QueueClearMapBlock
		addq.b	#$01,d0
		addq.b	#$01,d1

_clr5:
		clr.w	$258(a0)
		bsr.w	QueueClearMapBlock
		addq.b	#$01,d0
		addq.b	#$01,d1

_clr4:
		clr.w	$1C2(a0)
		bsr.w	QueueClearMapBlock
		addq.b	#$01,d0
		addq.b	#$01,d1

_clr3:
		clr.w	$12C(a0)
		bsr.w	QueueClearMapBlock
		addq.b	#$01,d0
		addq.b	#$01,d1

_clr2:
		clr.w	$96(a0)
		bsr.w	QueueClearMapBlock
		addq.b	#$01,d0
		addq.b	#$01,d1

_clr1:
		clr.w	(a0)
		bsr.w	QueueClearMapBlock
		rts

		modend
