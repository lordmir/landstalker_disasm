MapFlagChanges	module
; Persistent map graphics changes: on room load, story/door flags
; replay "tile swaps" - block copies within the loaded map layers
; (row stride $94 bytes) and heightmap - so opened doors, drained
; water etc. stay changed. The TileSwaps table holds 16-byte entries
; (source/dest map and heightmap coordinates, size, copy mode, with
; the room number at offset $C and the swap id at $E).

; Room load: applies every flagged tile swap for this room.
CheckRoomGfxFlags:
		bsr.s	CheckTileSwapFlags
		bsr.s	CheckTreeWarpFlags
		rts


; Scans RoomGfxSwapFlags, then falls through to scan the unlocked
; door swaps in LockedDoorGfxSwapFlags.
CheckTileSwapFlags:
		lea	RoomGfxSwapFlags(pc),a0
		lea	(g_Flags).l,a1
		bsr.s	CheckForGraphicSwapFlags
		lea	LockedDoorGfxSwapFlags(pc),a0


; Applies the swaps in table a0: 4-byte entries {room.w, flag
; byte.b (negative = apply unconditionally), swap id (bits 3-6) |
; flag bit (low 3 bits) .b}. a1 = g_Flags.
CheckForGraphicSwapFlags:
		move.w	(a0),d0
		bmi.s	_gsDone
		cmp.w	(g_CurrentRoom).l,d0
		bne.s	_gsNext
		move.b	2(a0),d0
		bmi.s	_gsApply
		ext.w	d0
		move.b	3(a0),d1
		andi.b	#$07,d1
		btst	d1,(a1,d0.w)
		beq.s	_gsNext

_gsApply:
		move.b	3(a0),d0
		andi.b	#$78,d0
		movem.l	a0-a1,-(sp)
		bsr.s	ApplyTileSwap
		movem.l	(sp)+,a0-a1

_gsNext:
		addq.l	#$04,a0
		bra.s	CheckForGraphicSwapFlags

_gsDone:
		rts


; Applies swap 8 for TreeWarpGfxSwapFlags entries whose flag AND the
; next flag bit are both set - the tree warps opening up (gated on
; g_AdditionalFlags+4 bit 7). Relies on a1 = g_Flags left by
; CheckTileSwapFlags running immediately before.
CheckTreeWarpFlags:
		lea	TreeWarpGfxSwapFlags(pc),a0
		TestFlag	FLAG_TREE_WARPS_OPEN
		beq.s	_twDone

_twScan:
		move.w	(a0),d0
		bmi.s	_twDone
		cmp.w	(g_CurrentRoom).l,d0
		bne.s	_twNext
		move.b	2(a0),d0
		ext.w	d0
		move.b	3(a0),d1
		andi.b	#$07,d1
		btst	d1,(a1,d0.w)
		beq.s	_twNext
		addq.b	#$01,d1
		btst	d1,(a1,d0.w)
		beq.s	_twNext
		move.b	#$08,d0
		movem.l	a0-a1,-(sp)
		bsr.s	ApplyTileSwap
		movem.l	(sp)+,a0-a1

_twNext:
		addq.l	#$04,a0
		bra.s	_twScan

_twDone:
		rts


; Applies tile swap d0 to both the map layers and the heightmap.
ApplyTileSwap:
		bsr.s	MapTileSwap
		bra.s	HMTileSwap


; Applies swap d0's block copy to the foreground/background map
; layers.
MapTileSwap:
		bsr.s	LoadTileSwap
		bsr.w	GetMapOffsets
		movea.l	a1,a3
		movea.l	a2,a4
		bsr.w	GetMapOffsets
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		ext.w	d0
		ext.w	d1
		bsr.s	DoMapTileSwap
		rts


; Applies swap d0's copy to the heightmap.
HMTileSwap:
		bsr.w	GetHeightmapCoordOffset
		movea.l	a1,a2
		bsr.w	GetHeightmapCoordOffset
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		ext.w	d0
		ext.w	d1
		bsr.w	SwapHMTiles
		rts


; Finds the TileSwaps entry for the current room with swap id d0
; (ids are stored offset by 8). A missing entry hangs forever
; beeping - a debug alarm for bad data.
LoadTileSwap:
		subi.b	#$08,d0
		lea	TileSwaps(pc),a0

_tsScan:
		move.w	$C(a0),d1
		bmi.s	_tsMissing
		cmp.w	(g_CurrentRoom).l,d1
		bne.s	_tsNext
		cmp.b	$E(a0),d0
		beq.s	_tsFound

_tsNext:
		lea	$10(a0),a0
		bra.s	_tsScan

_tsMissing:
		trap	#$00			  ; Trap00Handler
		dc.w SND_NigelDropObj2
		nop
		nop
		bra.s	_tsMissing

_tsFound:
		rts


; Copies a (d0+1) x (d1+1) cell block in both map layers, a1/a2 =
; foreground/background dest, a3/a4 = source. Mode (entry byte at
; 9(a0)): 0 = plain rows (stride $94); 1 = rows shifted one cell
; with stride $96, following the isometric diagonal; 2+ = column
; copy (stepping a row at a time) advancing diagonally.
DoMapTileSwap:
		cmpi.b	#$01,9(a0)
		beq.s	_mode1
		bhi.s	_mode2

_m0Rows:
		movem.l	d0/a1-a4,-(sp)

_m0Row:
		move.w	(a3)+,(a1)+
		move.w	(a4)+,(a2)+
		dbf	d0,_m0Row
		movem.l	(sp)+,d0/a1-a4
		lea	$94(a1),a1
		lea	$94(a2),a2
		lea	$94(a3),a3
		lea	$94(a4),a4
		dbf	d1,_m0Rows
		rts

_mode1:
		addq.w	#$02,a1
		addq.w	#$02,a3

_m1Rows:
		movem.l	d0/a1-a4,-(sp)

_m1Row:
		move.w	(a3)+,(a1)+
		move.w	(a4)+,(a2)+
		dbf	d0,_m1Row
		movem.l	(sp)+,d0/a1-a4
		lea	$96(a1),a1
		lea	$96(a2),a2
		lea	$96(a3),a3
		lea	$96(a4),a4
		dbf	d1,_m1Rows
		rts

_mode2:
		lea	$94(a2),a2
		lea	$94(a4),a4

_m2Cols:
		movem.l	d0/a1-a4,-(sp)

_m2Col:
		move.w	(a3),(a1)
		move.w	(a4),(a2)
		lea	$94(a1),a1
		lea	$94(a2),a2
		lea	$94(a3),a3
		lea	$94(a4),a4
		dbf	d0,_m2Col
		movem.l	(sp)+,d0/a1-a4
		lea	$96(a1),a1
		lea	$96(a2),a2
		lea	$96(a3),a3
		lea	$96(a4),a4
		dbf	d1,_m2Cols
		rts


; Copies a (d0+1) x (d1+1) block within the heightmap (a1 = dest,
; a2 = source, row stride $94).
SwapHMTiles:
		movem.l	d0/a1-a2,-(sp)

_hmRow:
		move.w	(a2)+,(a1)+
		dbf	d0,_hmRow
		movem.l	(sp)+,d0/a1-a2
		lea	$94(a1),a1
		lea	$94(a2),a2
		dbf	d1,SwapHMTiles
		rts


; Using a key on a locked door (PostUseKey): d2 = door index from
; the floor type. Finds this room's LockedDoorGfxSwapFlags entry
; with swap id (d2*8)+8, sets its persistent flag and applies the
; door-opening tile swap immediately.
UnlockDoorTileSwap:
		lsl.b	#$03,d2
		addq.b	#$08,d2
		lea	LockedDoorGfxSwapFlags(pc),a0
		lea	(g_Flags).l,a1

_ldScan:
		move.w	(a0),d0
		bmi.s	_ldDone
		cmp.w	(g_CurrentRoom).l,d0
		bne.s	_ldNext
		move.b	3(a0),d0
		andi.b	#$78,d0
		cmp.b	d0,d2
		bne.s	_ldNext
		move.b	2(a0),d3
		ext.w	d3
		move.b	3(a0),d1
		andi.b	#$07,d1
		bset	d1,(a1,d3.w)
		bsr.w	DoTileSwap

_ldDone:
		rts

_ldNext:
		addq.l	#$04,a0
		bra.s	_ldScan

		modend
