
; =============== S U B	R O U T	I N E =======================================


CheckRoomGfxFlags:				  ; CODE XREF: ROM:00002BC2p
		bsr.s	CheckTileSwapFlags
		bsr.s	CheckTreeWarpFlags
		rts
; End of function CheckRoomGfxFlags


; =============== S U B	R O U T	I N E =======================================


CheckTileSwapFlags:				  ; CODE XREF: CheckRoomGfxFlagsp
		lea	RoomGfxSwapFlags(pc),a0
		lea	(g_Flags).l,a1
		bsr.s	CheckForGraphicSwapFlags
		lea	LockedDoorGfxSwapFlags(pc),a0
; End of function CheckTileSwapFlags


; =============== S U B	R O U T	I N E =======================================


CheckForGraphicSwapFlags:			  ; CODE XREF: CheckTileSwapFlags+Ap
						  ; CheckForGraphicSwapFlags+36j
		move.w	(a0),d0
		bmi.s	locret_4E44
		cmp.w	(g_RmNum1).l,d0
		bne.s	loc_4E40
		move.b	$00000002(a0),d0
		bmi.s	loc_4E2E
		ext.w	d0
		move.b	$00000003(a0),d1
		andi.b	#$07,d1
		btst	d1,(a1,d0.w)
		beq.s	loc_4E40

loc_4E2E:					  ; CODE XREF: CheckForGraphicSwapFlags+10j
		move.b	$00000003(a0),d0
		andi.b	#$78,d0
		movem.l	a0-a1,-(sp)
		bsr.s	sub_4E90
		movem.l	(sp)+,a0-a1

loc_4E40:					  ; CODE XREF: CheckForGraphicSwapFlags+Aj
						  ; CheckForGraphicSwapFlags+20j
		addq.l	#$04,a0
		bra.s	CheckForGraphicSwapFlags
; ---------------------------------------------------------------------------

locret_4E44:					  ; CODE XREF: CheckForGraphicSwapFlags+2j
		rts
; End of function CheckForGraphicSwapFlags


; =============== S U B	R O U T	I N E =======================================


CheckTreeWarpFlags:				  ; CODE XREF: CheckRoomGfxFlags+2p
		lea	TreeWarpGfxSwapFlags(pc),a0
		btst	#$07,(g_AdditionalFlags+4).l
		beq.s	locret_4E8E

loc_4E54:					  ; CODE XREF: CheckTreeWarpFlags+46j
		move.w	(a0),d0
		bmi.s	locret_4E8E
		cmp.w	(g_RmNum1).l,d0
		bne.s	loc_4E8A
		move.b	$00000002(a0),d0
		ext.w	d0
		move.b	$00000003(a0),d1
		andi.b	#$07,d1
		btst	d1,(a1,d0.w)
		beq.s	loc_4E8A
		addq.b	#$01,d1
		btst	d1,(a1,d0.w)
		beq.s	loc_4E8A
		move.b	#$08,d0
		movem.l	a0-a1,-(sp)
		bsr.s	sub_4E90
		movem.l	(sp)+,a0-a1

loc_4E8A:					  ; CODE XREF: CheckTreeWarpFlags+18j
						  ; CheckTreeWarpFlags+2Cj ...
		addq.l	#$04,a0
		bra.s	loc_4E54
; ---------------------------------------------------------------------------

locret_4E8E:					  ; CODE XREF: CheckTreeWarpFlags+Cj
						  ; CheckTreeWarpFlags+10j
		rts
; End of function CheckTreeWarpFlags


; =============== S U B	R O U T	I N E =======================================


sub_4E90:					  ; CODE XREF: CheckForGraphicSwapFlags+2Ep
						  ; CheckTreeWarpFlags+3Ep
		bsr.s	MapTileSwap
		bra.s	HMTileSwap
; End of function sub_4E90


; =============== S U B	R O U T	I N E =======================================


MapTileSwap:					  ; CODE XREF: DoTileSwap+3Ep
						  ; sub_4E90p
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
; End of function MapTileSwap


; =============== S U B	R O U T	I N E =======================================


HMTileSwap:					  ; CODE XREF: DoTileSwap+36p
						  ; sub_4E90+2j
		bsr.w	GetHeightmapCoordOffset
		movea.l	a1,a2
		bsr.w	GetHeightmapCoordOffset
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		ext.w	d0
		ext.w	d1
		bsr.w	SwapHMTiles
		rts
; End of function HMTileSwap


; =============== S U B	R O U T	I N E =======================================


LoadTileSwap:					  ; CODE XREF: DoTileSwap+14p
						  ; MapTileSwapp
		subi.b	#$08,d0
		lea	TileSwaps(pc),a0

loc_4ECE:					  ; CODE XREF: LoadTileSwap+20j
		move.w	$0000000C(a0),d1
		bmi.s	loc_4EE8
		cmp.w	(g_RmNum1).l,d1
		bne.s	loc_4EE2
		cmp.b	$0000000E(a0),d0
		beq.s	locret_4EF2

loc_4EE2:					  ; CODE XREF: LoadTileSwap+14j
		lea	$00000010(a0),a0
		bra.s	loc_4ECE
; ---------------------------------------------------------------------------

loc_4EE8:					  ; CODE XREF: LoadTileSwap+Cj
						  ; LoadTileSwap+2Aj
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_NigelDropObj2
; ---------------------------------------------------------------------------
		nop
		nop
		bra.s	loc_4EE8
; ---------------------------------------------------------------------------

locret_4EF2:					  ; CODE XREF: LoadTileSwap+1Aj
		rts
; End of function LoadTileSwap


; =============== S U B	R O U T	I N E =======================================


DoMapTileSwap:					  ; CODE XREF: MapTileSwap+16p
		cmpi.b	#$01,$00000009(a0)
		beq.s	loc_4F24
		bhi.s	loc_4F4E

loc_4EFE:					  ; CODE XREF: DoMapTileSwap+2Aj
		movem.l	d0/a1-a4,-(sp)

loc_4F02:					  ; CODE XREF: DoMapTileSwap+12j
		move.w	(a3)+,(a1)+
		move.w	(a4)+,(a2)+
		dbf	d0,loc_4F02
		movem.l	(sp)+,d0/a1-a4
		lea	$00000094(a1),a1
		lea	$00000094(a2),a2
		lea	$00000094(a3),a3
		lea	$00000094(a4),a4
		dbf	d1,loc_4EFE
		rts
; ---------------------------------------------------------------------------

loc_4F24:					  ; CODE XREF: DoMapTileSwap+6j
		addq.w	#$02,a1
		addq.w	#$02,a3

loc_4F28:					  ; CODE XREF: DoMapTileSwap+54j
		movem.l	d0/a1-a4,-(sp)

loc_4F2C:					  ; CODE XREF: DoMapTileSwap+3Cj
		move.w	(a3)+,(a1)+
		move.w	(a4)+,(a2)+
		dbf	d0,loc_4F2C
		movem.l	(sp)+,d0/a1-a4
		lea	$00000096(a1),a1
		lea	$00000096(a2),a2
		lea	$00000096(a3),a3
		lea	$00000096(a4),a4
		dbf	d1,loc_4F28
		rts
; ---------------------------------------------------------------------------

loc_4F4E:					  ; CODE XREF: DoMapTileSwap+8j
		lea	$00000094(a2),a2
		lea	$00000094(a4),a4

loc_4F56:					  ; CODE XREF: DoMapTileSwap+92j
		movem.l	d0/a1-a4,-(sp)

loc_4F5A:					  ; CODE XREF: DoMapTileSwap+7Aj
		move.w	(a3),(a1)
		move.w	(a4),(a2)
		lea	$00000094(a1),a1
		lea	$00000094(a2),a2
		lea	$00000094(a3),a3
		lea	$00000094(a4),a4
		dbf	d0,loc_4F5A
		movem.l	(sp)+,d0/a1-a4
		lea	$00000096(a1),a1
		lea	$00000096(a2),a2
		lea	$00000096(a3),a3
		lea	$00000096(a4),a4
		dbf	d1,loc_4F56
		rts
; End of function DoMapTileSwap


; =============== S U B	R O U T	I N E =======================================


SwapHMTiles:					  ; CODE XREF: HMTileSwap+12p
						  ; SwapHMTiles+16j
		movem.l	d0/a1-a2,-(sp)

loc_4F90:					  ; CODE XREF: SwapHMTiles+6j
		move.w	(a2)+,(a1)+
		dbf	d0,loc_4F90
		movem.l	(sp)+,d0/a1-a2
		lea	$00000094(a1),a1
		lea	$00000094(a2),a2
		dbf	d1,SwapHMTiles
		rts
; End of function SwapHMTiles


; =============== S U B	R O U T	I N E =======================================


sub_4FA8:					  ; CODE XREF: ROM:00008CD4p
		lsl.b	#$03,d2
		addq.b	#$08,d2
		lea	LockedDoorGfxSwapFlags(pc),a0
		lea	(g_Flags).l,a1

loc_4FB6:					  ; CODE XREF: sub_4FA8+40j
		move.w	(a0),d0
		bmi.s	locret_4FE4
		cmp.w	(g_RmNum1).l,d0
		bne.s	loc_4FE6
		move.b	$00000003(a0),d0
		andi.b	#$78,d0
		cmp.b	d0,d2
		bne.s	loc_4FE6
		move.b	$00000002(a0),d3
		ext.w	d3
		move.b	$00000003(a0),d1
		andi.b	#$07,d1
		bset	d1,(a1,d3.w)
		bsr.w	DoTileSwap

locret_4FE4:					  ; CODE XREF: sub_4FA8+10j
		rts
; ---------------------------------------------------------------------------

loc_4FE6:					  ; CODE XREF: sub_4FA8+18j
						  ; sub_4FA8+24j
		addq.l	#$04,a0
		bra.s	loc_4FB6
; End of function sub_4FA8

; ---------------------------------------------------------------------------
