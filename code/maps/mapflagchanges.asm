
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
		btst	#$07,(g_Vars+4).l
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
		bsr.s	sub_4E94
		bra.s	sub_4EAE
; End of function sub_4E90


; =============== S U B	R O U T	I N E =======================================


sub_4E94:					  ; CODE XREF: sub_4B52+3Ep
						  ; sub_4E90p
		bsr.s	sub_4EC6
		bsr.w	sub_4DBC
		movea.l	a1,a3
		movea.l	a2,a4
		bsr.w	sub_4DBC
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		ext.w	d0
		ext.w	d1
		bsr.s	sub_4EF4
		rts
; End of function sub_4E94


; =============== S U B	R O U T	I N E =======================================


sub_4EAE:					  ; CODE XREF: sub_4B52+36p
						  ; sub_4E90+2j
		bsr.w	sub_4DD8
		movea.l	a1,a2
		bsr.w	sub_4DD8
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		ext.w	d0
		ext.w	d1
		bsr.w	sub_4F8C
		rts
; End of function sub_4EAE


; =============== S U B	R O U T	I N E =======================================


sub_4EC6:					  ; CODE XREF: sub_4B52+14p
						  ; sub_4E94p
		subi.b	#$08,d0
		lea	TileSwaps(pc),a0

loc_4ECE:					  ; CODE XREF: sub_4EC6+20j
		move.w	$0000000C(a0),d1
		bmi.s	loc_4EE8
		cmp.w	(g_RmNum1).l,d1
		bne.s	loc_4EE2
		cmp.b	$0000000E(a0),d0
		beq.s	locret_4EF2

loc_4EE2:					  ; CODE XREF: sub_4EC6+14j
		lea	$00000010(a0),a0
		bra.s	loc_4ECE
; ---------------------------------------------------------------------------

loc_4EE8:					  ; CODE XREF: sub_4EC6+Cj
						  ; sub_4EC6+2Aj
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_NigelDropObj2
; ---------------------------------------------------------------------------
		nop
		nop
		bra.s	loc_4EE8
; ---------------------------------------------------------------------------

locret_4EF2:					  ; CODE XREF: sub_4EC6+1Aj
		rts
; End of function sub_4EC6


; =============== S U B	R O U T	I N E =======================================


sub_4EF4:					  ; CODE XREF: sub_4E94+16p
		cmpi.b	#$01,$00000009(a0)
		beq.s	loc_4F24
		bhi.s	loc_4F4E

loc_4EFE:					  ; CODE XREF: sub_4EF4+2Aj
		movem.l	d0/a1-a4,-(sp)

loc_4F02:					  ; CODE XREF: sub_4EF4+12j
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

loc_4F24:					  ; CODE XREF: sub_4EF4+6j
		addq.w	#$02,a1
		addq.w	#$02,a3

loc_4F28:					  ; CODE XREF: sub_4EF4+54j
		movem.l	d0/a1-a4,-(sp)

loc_4F2C:					  ; CODE XREF: sub_4EF4+3Cj
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

loc_4F4E:					  ; CODE XREF: sub_4EF4+8j
		lea	$00000094(a2),a2
		lea	$00000094(a4),a4

loc_4F56:					  ; CODE XREF: sub_4EF4+92j
		movem.l	d0/a1-a4,-(sp)

loc_4F5A:					  ; CODE XREF: sub_4EF4+7Aj
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
; End of function sub_4EF4


; =============== S U B	R O U T	I N E =======================================


sub_4F8C:					  ; CODE XREF: sub_4EAE+12p
						  ; sub_4F8C+16j
		movem.l	d0/a1-a2,-(sp)

loc_4F90:					  ; CODE XREF: sub_4F8C+6j
		move.w	(a2)+,(a1)+
		dbf	d0,loc_4F90
		movem.l	(sp)+,d0/a1-a2
		lea	$00000094(a1),a1
		lea	$00000094(a2),a2
		dbf	d1,sub_4F8C
		rts
; End of function sub_4F8C


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
		bsr.w	sub_4B52

locret_4FE4:					  ; CODE XREF: sub_4FA8+10j
		rts
; ---------------------------------------------------------------------------

loc_4FE6:					  ; CODE XREF: sub_4FA8+18j
						  ; sub_4FA8+24j
		addq.l	#$04,a0
		bra.s	loc_4FB6
; End of function sub_4FA8

; ---------------------------------------------------------------------------
