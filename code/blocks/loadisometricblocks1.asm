
; =============== S U B	R O U T	I N E =======================================


LoadTopTiles:					  ; CODE XREF: InitBlocks:loc_9110p
						  ; InitBlocks:loc_913Ep
						  ; DATA XREF: ...
		move.b	(g_PlayerXFlattened).l,d0
		move.b	(g_PlayerYFlattened).l,d1
		subi.b	#011,d0
		lea	TopLeftMapOffsets(pc),a6  ; RU,	LU

loc_A630:					  ; CODE XREF: LoadBottomTiles+14j
		move.w	(g_BlockTableIndex).l,d2
		add.w	d2,d2
		move.w	(a6,d2.w),d2
		bsr.w	ConvertXYToBlockPtr
		moveq	#$0000000B,d7
		movea.l	(g_ScreenBufferPtr).l,a0
		lea	(g_Blockset).l,a4
		movea.l	a4,a5
		addq.w	#$04,a5

loc_A652:					  ; CODE XREF: LoadTopTiles:loc_A684j
		bsr.w	BlockToTiles
		suba.w	#00146,a6
		subi.w	#$001F,d2
		beq.s	loc_A672
		bpl.s	loc_A678
		addi.w	#$0210,d2
		cmpi.w	#$0200,d2
		bcs.s	loc_A684
		subi.w	#$0020,d2
		bra.s	loc_A684
; ---------------------------------------------------------------------------

loc_A672:					  ; CODE XREF: LoadTopTiles+42j
		move.w	#$01F0,d2
		bra.s	loc_A684
; ---------------------------------------------------------------------------

loc_A678:					  ; CODE XREF: LoadTopTiles+44j
		move.b	d2,d6
		andi.b	#$1F,d6
		bne.s	loc_A684
		subi.w	#$0020,d2

loc_A684:					  ; CODE XREF: LoadTopTiles+4Ej
						  ; LoadTopTiles+54j ...
		dbf	d7,loc_A652
		move.l	a0,(g_ScreenBufferPtr).l
		addi.b	#$0C,(byte_FF1128).l
		rts
; End of function LoadTopTiles


; =============== S U B	R O U T	I N E =======================================


LoadBottomTiles:				  ; DATA XREF: HandleDirectionalControl+482t
						  ; HandleDirectionalControl:loc_1F3Ct	...
		move.b	(g_PlayerXFlattened).l,d0
		move.b	(g_PlayerYFlattened).l,d1
		addi.b	#011,d1
		lea	BottomMapOffsets(pc),a6	  ; RD,	LD
		bra.w	loc_A630
; End of function LoadBottomTiles


; =============== S U B	R O U T	I N E =======================================


LoadLeftTiles:					  ; DATA XREF: HandleDirectionalControl+60Ct
						  ; HandleDirectionalControl+810t ...
		move.b	(g_PlayerXFlattened).l,d0
		move.b	(g_PlayerYFlattened).l,d1
		subi.b	#011,d0
		lea	TopLeftMapOffsets(pc),a6  ; LD,	LU

loc_A6C4:					  ; CODE XREF: LoadRightTiles+14j
		move.w	(g_BlockTableIndex).l,d2
		add.w	d2,d2
		move.w	(a6,d2.w),d2
		bsr.w	ConvertXYToBlockPtr
		moveq	#$0000000B,d7
		movea.l	(g_ScreenBufferPtr).l,a0
		lea	(g_Blockset).l,a4
		movea.l	a4,a5
		addq.w	#$04,a5

loc_A6E6:					  ; CODE XREF: LoadLeftTiles:loc_A71Cj
		bsr.w	BlockToTiles
		adda.w	#$0096,a6
		addi.w	#$0021,d2
		cmpi.w	#$0220,d2
		beq.s	loc_A712
		move.b	d2,d6
		andi.b	#$1F,d6
		beq.s	loc_A718
		cmpi.w	#$0200,d2
		bcs.s	loc_A71C
		subi.w	#$0210,d2
		bpl.s	loc_A71C
		addi.w	#$0020,d2
		bra.s	loc_A71C
; ---------------------------------------------------------------------------

loc_A712:					  ; CODE XREF: LoadLeftTiles+46j
		move.w	#$0010,d2
		bra.s	loc_A71C
; ---------------------------------------------------------------------------

loc_A718:					  ; CODE XREF: LoadLeftTiles+4Ej
		subi.w	#$0020,d2

loc_A71C:					  ; CODE XREF: LoadLeftTiles+54j
						  ; LoadLeftTiles+5Aj ...
		dbf	d7,loc_A6E6
		move.l	a0,(g_ScreenBufferPtr).l
		addi.b	#$0C,(byte_FF1128).l
		rts
; End of function LoadLeftTiles


; =============== S U B	R O U T	I N E =======================================


LoadRightTiles:					  ; DATA XREF: HandleDirectionalControl:loc_1C24t
						  ; HandleDirectionalControl:loc_1DB2t	...
		move.b	(g_PlayerXFlattened).l,d0
		move.b	(g_PlayerYFlattened).l,d1
		subi.b	#$0B,d1
		lea	RightMapOffsets(pc),a6	  ; RU,	RD
		bra.w	loc_A6C4
; End of function LoadRightTiles


; =============== S U B	R O U T	I N E =======================================


BlockToTiles:					  ; CODE XREF: LoadTopTiles:loc_A652p
						  ; LoadLeftTiles:loc_A6E6p
		move.w	(a6),d4			  ; BG Block at	XY
		andi.w	#$03FF,d4
		lsl.w	#$03,d4
		move.w	$00002AC8(a6),d5	  ; FG Block at	XY
		andi.w	#$03FF,d5
		lsl.w	#$03,d5
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
; End of function BlockToTiles

; ---------------------------------------------------------------------------
