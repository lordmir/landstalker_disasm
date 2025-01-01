
; =============== S U B	R O U T	I N E =======================================


LoadHUDSprites:					  ; CODE XREF: LoadRoom+42p
						  ; ROM:00008DCEp ...
		lea	HUDSprites(pc),a0
		lea	(g_VDPSpr00_Y).l,a1
		move.w	#$0007,d0

loc_9054:					  ; CODE XREF: LoadHUDSprites+10j
		move.w	(a0)+,(a1)+
		dbf	d0,loc_9054
		rts
; End of function LoadHUDSprites

; ---------------------------------------------------------------------------
HUDSprites:	dc.w $0080, $0201, $86B4, $0001	  ; DATA XREF: LoadHUDSpritest
		dc.w $0080, $0202, $86B4, $0000

; =============== S U B	R O U T	I N E =======================================


InitScrollRegs:					  ; CODE XREF: ROM:00008DD2p
						  ; InitVDP+Ap
		move.w	#$0001,(word_FF1180).l
		andi.w	#$FEFE,(word_FF1126).l
		clr.w	d6
		move.b	(word_FF1126+1).l,d6
		sub.b	(word_FF1126).l,d6
		bpl.s	loc_908E
		ext.w	d6

loc_908E:					  ; CODE XREF: InitScrollRegs+1Ej
		addi.w	#$0090,d6
		jsr	(FillHScrollData).l
		jsr	(FillHScrollDataOffset1).l
		clr.w	d6
		move.b	(word_FF1126).l,d6
		add.b	(word_FF1126+1).l,d6
		lsr.b	#$01,d6
		subi.w	#$0068,d6
		jsr	(FillVSRAM).l
		jsr	(FillVSRAMOffset1).l
		jmp	(EnableDMAQueueProcessing).l
; End of function InitScrollRegs


; =============== S U B	R O U T	I N E =======================================


InitBlocks:					  ; CODE XREF: ROM:00008DD6p
						  ; InitVDP+Ep
		jsr	(FlushDMACopyQueue).l
		addi.b	#$0C,(g_PlayerXFlattened).l
		addi.b	#$0C,(g_PlayerYFlattened).l
		move.w	#$018C,(g_BlockTableIndex).l
		move.w	#$000B,d7

loc_90E6:					  ; CODE XREF: InitBlocks+88j
		movem.w	d7,-(sp)
		subq.b	#$01,(g_PlayerXFlattened).l
		move.w	(g_BlockTableIndex).l,d0
		subq.w	#$01,d0
		move.w	d0,(g_BlockTableIndex).l
		andi.w	#$001F,d0
		cmpi.w	#$001F,d0
		bne.s	loc_9110
		addi.w	#$0020,(g_BlockTableIndex).l

loc_9110:					  ; CODE XREF: InitBlocks+42j
		bsr.w	LoadTopTiles
		subq.b	#$01,(g_PlayerYFlattened).l
		subi.w	#$0020,(g_BlockTableIndex).l
		bpl.s	loc_913E
		addi.w	#$0210,(g_BlockTableIndex).l
		cmpi.w	#$0200,(g_BlockTableIndex).l
		bcs.s	loc_913E
		subi.w	#$0020,(g_BlockTableIndex).l

loc_913E:					  ; CODE XREF: InitBlocks+5Ej
						  ; InitBlocks+70j
		bsr.w	LoadTopTiles
		jsr	(WaitUntilVBlank).l
		movem.w	(sp)+,d7
		dbf	d7,loc_90E6
		rts
; End of function InitBlocks

; ---------------------------------------------------------------------------
