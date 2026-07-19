GameLogic6	module
; Writes the two fixed HUD VDP sprites (tile $6B4 at Y $80) into
; slots 0-1 of the sprite table.
LoadHUDSprites:
		lea	HUDSprites(pc),a0
		lea	(g_VDPSpr00_Y).l,a1
		move.w	#$0007,d0

_copySprites:
		move.w	(a0)+,(a1)+
		dbf	d0,_copySprites
		rts

HUDSprites:
		dc.w $0080, $0201, $86B4, $0001
		dc.w $0080, $0202, $86B4, $0000


; Room load: derives the initial scroll registers from the camera sub
; position - HScroll = (subY - subX) + $90 for both planes, VSRAM =
; (subX + subY)/2 - $68 - and resets the vertical scroll parity.
InitScrollRegs:
		move.w	#$0001,(g_VScrollParity).l
		andi.w	#$FEFE,(g_CameraSubX).l
		clr.w	d6
		move.b	(g_CameraSubY).l,d6
		sub.b	(g_CameraSubX).l,d6
		bpl.s	_setHScroll
		ext.w	d6

_setHScroll:
		addi.w	#$0090,d6
		jsr	(FillHScrollData).l
		jsr	(FillHScrollDataOffset1).l
		clr.w	d6
		move.b	(g_CameraSubX).l,d6
		add.b	(g_CameraSubY).l,d6
		lsr.b	#$01,d6
		subi.w	#$0068,d6
		jsr	(FillVSRAM).l
		jsr	(FillVSRAMOffset1).l
		jmp	(EnableDMAQueueProcessing).l


; Room load: streams the initial visible block window into VRAM by
; stepping the camera 12 cells diagonally up (-X then -Y per step,
; with the same block-table wrap rules as the movers), loading a row
; of top tiles after each shift.
InitBlocks:
		jsr	(FlushDMACopyQueue).l
		addi.b	#$0C,(g_PlayerXFlattened).l
		addi.b	#$0C,(g_PlayerYFlattened).l
		move.w	#$018C,(g_BlockTableIndex).l
		move.w	#$000B,d7

_rowLoop:
		movem.w	d7,-(sp)
		subq.b	#$01,(g_PlayerXFlattened).l
		move.w	(g_BlockTableIndex).l,d0
		subq.w	#$01,d0
		move.w	d0,(g_BlockTableIndex).l
		andi.w	#$001F,d0
		cmpi.w	#$001F,d0
		bne.s	_loadRowX
		addi.w	#$0020,(g_BlockTableIndex).l

_loadRowX:
		bsr.w	LoadTopTiles
		subq.b	#$01,(g_PlayerYFlattened).l
		subi.w	#$0020,(g_BlockTableIndex).l
		bpl.s	_loadRowY
		addi.w	#$0210,(g_BlockTableIndex).l
		cmpi.w	#$0200,(g_BlockTableIndex).l
		bcs.s	_loadRowY
		subi.w	#$0020,(g_BlockTableIndex).l

_loadRowY:
		bsr.w	LoadTopTiles
		jsr	(WaitUntilVBlank).l
		movem.w	(sp)+,d7
		dbf	d7,_rowLoop
		rts

		modend
