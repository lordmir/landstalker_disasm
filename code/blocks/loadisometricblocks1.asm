LoadIsometricBlocks1	module
; Streams map blocks into the VDP plane name tables as the camera
; scrolls. Whenever the camera crosses a block boundary, the mover
; (gamelogic1) calls two of the strip loaders below to convert the 12
; newly revealed blocks along each leading screen edge into tile cells,
; queued in g_ScreenBuffer and drained by ProcessPendingBlockCopies
; (mapload) during HBlank. InitBlocks (gamelogic6) builds the initial
; window the same way, calling LoadTopTiles once per camera step.
;
; d2 is the destination slot in the plane ring: the name tables hold
; 32x16 blocks (64x32 tiles), slot = row*$20 + column, $200 slots,
; wrapping with the same rules as g_BlockTableIndex (the camera anchor
; slot). The strip-start tables after this include (TopLeftMapOffsets,
; BottomMapOffsets, RightMapOffsets) give the first slot of each strip,
; indexed by g_BlockTableIndex. VDPCopyBlockCmds holds four precomputed
; VRAM write commands per slot: FG/BG plane x top/bottom tile row.

; Queues the strip revealed at the top edge of the screen (camera
; moving up-right or up-left), 11 blocks left of the camera anchor.
LoadTopTiles:
		move.b	(g_PlayerXFlattened).l,d0
		move.b	(g_PlayerYFlattened).l,d1
		subi.b	#011,d0
		lea	TopLeftMapOffsets(pc),a6  ; strip-start slots (scroll RU/LU)

; Shared horizontal-strip loader: fetch the starting plane slot for
; this camera position, point a6 at the map cell for (d0,d1), then
; convert 12 blocks walking one map row up and one block right each.
_loadHorizStrip:
		move.w	(g_BlockTableIndex).l,d2
		add.w	d2,d2
		move.w	(a6,d2.w),d2
		bsr.w	ConvertXYToBlockPtr
		moveq	#$0000000B,d7		  ; 12 blocks per strip
		movea.l	(g_ScreenBufferPtr).l,a0
		lea	(g_Blockset).l,a4	  ; a4 = top tile pair of each block
		movea.l	a4,a5
		addq.w	#$04,a5			  ; a5 = bottom tile pair

_hsLoop:
		bsr.w	BlockToTiles
		suba.w	#00146,a6		  ; map cell: one row up, one block right
		subi.w	#$001F,d2		  ; plane slot: one row up, one column right
		beq.s	_hsWrapZero
		bpl.s	_hsColCheck
		addi.w	#$0210,d2		  ; crossed the top row: wrap to the
		cmpi.w	#$0200,d2		  ; bottom, offset by the $10 stagger
		bcs.s	_hsNext
		subi.w	#$0020,d2
		bra.s	_hsNext

_hsWrapZero:
		move.w	#$01F0,d2		  ; slot 0 wraps straight to $1F0
		bra.s	_hsNext

_hsColCheck:
		move.b	d2,d6
		andi.b	#$1F,d6			  ; column wrapped around to 0?
		bne.s	_hsNext			  ; step back one row
		subi.w	#$0020,d2

_hsNext:
		dbf	d7,_hsLoop
		move.l	a0,(g_ScreenBufferPtr).l
		addi.b	#$0C,(g_PendingBlockCopies).l
		rts

; Queues the strip revealed at the bottom edge of the screen (camera
; moving down-right or down-left), 11 blocks below the camera anchor.
LoadBottomTiles:
		move.b	(g_PlayerXFlattened).l,d0
		move.b	(g_PlayerYFlattened).l,d1
		addi.b	#011,d1
		lea	BottomMapOffsets(pc),a6	  ; strip-start slots (scroll RD/LD)
		bra.w	_loadHorizStrip

; Queues the strip revealed at the left edge of the screen (camera
; moving down-left or up-left).
LoadLeftTiles:
		move.b	(g_PlayerXFlattened).l,d0
		move.b	(g_PlayerYFlattened).l,d1
		subi.b	#011,d0
		lea	TopLeftMapOffsets(pc),a6  ; strip-start slots (scroll LD/LU)

; Shared vertical-strip loader: as above, but each step walks one map
; row down and one block right.
_loadVertStrip:
		move.w	(g_BlockTableIndex).l,d2
		add.w	d2,d2
		move.w	(a6,d2.w),d2
		bsr.w	ConvertXYToBlockPtr
		moveq	#$0000000B,d7		  ; 12 blocks per strip
		movea.l	(g_ScreenBufferPtr).l,a0
		lea	(g_Blockset).l,a4	  ; a4 = top tile pair of each block
		movea.l	a4,a5
		addq.w	#$04,a5			  ; a5 = bottom tile pair

_vsLoop:
		bsr.w	BlockToTiles
		adda.w	#$0096,a6		  ; map cell: one row down, one block right
		addi.w	#$0021,d2		  ; plane slot: one row down, one column right
		cmpi.w	#$0220,d2		  ; ran off the end of the ring?
		beq.s	_vsWrapEnd
		move.b	d2,d6
		andi.b	#$1F,d6			  ; column wrapped around to 0?
		beq.s	_vsColWrap		  ; step back one row
		cmpi.w	#$0200,d2		  ; crossed the bottom row: wrap to the
		bcs.s	_vsNext			  ; top, offset by the $10 stagger
		subi.w	#$0210,d2
		bpl.s	_vsNext
		addi.w	#$0020,d2
		bra.s	_vsNext

_vsWrapEnd:
		move.w	#$0010,d2		  ; slot $220 wraps straight to $10
		bra.s	_vsNext

_vsColWrap:
		subi.w	#$0020,d2

_vsNext:
		dbf	d7,_vsLoop
		move.l	a0,(g_ScreenBufferPtr).l
		addi.b	#$0C,(g_PendingBlockCopies).l
		rts

; Queues the strip revealed at the right edge of the screen (camera
; moving up-right or down-right), 11 blocks up from the camera anchor.
LoadRightTiles:
		move.b	(g_PlayerXFlattened).l,d0
		move.b	(g_PlayerYFlattened).l,d1
		subi.b	#$0B,d1
		lea	RightMapOffsets(pc),a6	  ; strip-start slots (scroll RU/RD)
		bra.w	_loadVertStrip

; Converts the map block at cell (a6) to four queued VDP writes for
; plane slot d2. Map words hold the block index in the low 10 bits;
; blockset entries are 8 bytes (2x2 tile cells: top pair, bottom
; pair). Each g_ScreenBuffer entry is {VRAM address.w, tile pair.l},
; written in VDPCopyBlockCmds order: FG top, BG top, FG bottom,
; BG bottom.
BlockToTiles:
		move.w	(a6),d4			  ; foreground block at the cell
		andi.w	#$03FF,d4
		lsl.w	#$03,d4
		move.w	$00002AC8(a6),d5	  ; background block at the cell
		andi.w	#$03FF,d5		  ; (g_BackgroundBlocks-g_ForegroundBlocks
		lsl.w	#$03,d5			  ; = $2AC8)
		move.w	d2,d6
		lea	VDPCopyBlockCmds(pc),a1
		lsl.w	#$03,d6
		adda.w	d6,a1
		move.w	(a1)+,(a0)+
		move.l	(a4,d4.w),(a0)+
		move.w	(a1)+,(a0)+
		move.l	(a4,d5.w),(a0)+
		move.w	(a1)+,(a0)+
		move.l	(a5,d4.w),(a0)+
		move.w	(a1)+,(a0)+
		move.l	(a5,d5.w),(a0)+
		rts

		modend
