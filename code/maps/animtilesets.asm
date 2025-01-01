
; =============== S U B	R O U T	I N E =======================================


LoadAnimTiles:					  ; CODE XREF: LoadRoom_0+60p
		lea	(byte_FF1134).l,a4
		lea	(word_FF1210).l,a5
		lea	(unk_FF1860).l,a6
		clr.w	(a5)
		clr.w	$00000004(a5)
		move.b	(g_CurrentTileset).l,d0
		clr.w	d1
		lea	AnimatedTilesetIdxs(pc),a0
		nop

loc_9D5C:					  ; CODE XREF: LoadAnimTiles+30j
		move.b	(a0)+,d2
		bmi.s	locret_9DA0
		cmp.b	d2,d0
		beq.s	loc_9D68

loc_9D64:					  ; CODE XREF: LoadAnimTiles+68j
		addq.w	#$01,d1
		bra.s	loc_9D5C
; ---------------------------------------------------------------------------

loc_9D68:					  ; CODE XREF: LoadAnimTiles+2Cj
		move.w	d1,d3
		mulu.w	#$000A,d3
		lea	AnimatedTilesetData(pc),a1
		nop
		move.w	(a1,d3.w),(a5)+
		move.w	$00000002(a1,d3.w),(a5)+
		move.b	$00000004(a1,d3.w),(a4)+
		cmpi.w	#$01ED,(g_RmNum1).l	  ; Ship
		bne.s	loc_9D90
		move.b	#$02,(a4)+
		bra.s	loc_9D94
; ---------------------------------------------------------------------------

loc_9D90:					  ; CODE XREF: LoadAnimTiles+52j
		move.b	$00000005(a1,d3.w),(a4)+

loc_9D94:					  ; CODE XREF: LoadAnimTiles+58j
		movea.l	$00000006(a1,d3.w),a3
		move.l	(a3),(a6)+
		clr.b	(a4)+
		clr.b	(a4)+
		bra.s	loc_9D64
; ---------------------------------------------------------------------------

locret_9DA0:					  ; CODE XREF: LoadAnimTiles+28j
		rts
; End of function LoadAnimTiles


; =============== S U B	R O U T	I N E =======================================


sub_9DA2:					  ; CODE XREF: CheckOpenChest+15Ap
						  ; sub_7250+Ep
						  ; DATA XREF: ...
		lea	(byte_FF1134).l,a4
		lea	(word_FF1210).l,a5
		lea	(unk_FF1860).l,a6
		bsr.s	sub_9DBC
		addq.w	#$04,a4
		addq.w	#$04,a5
		addq.w	#$04,a6
; End of function sub_9DA2


; =============== S U B	R O U T	I N E =======================================


sub_9DBC:					  ; CODE XREF: sub_9DA2+12p
		move.w	(a5),d0
		beq.s	locret_9E02
		movea.w	d0,a1
		move.b	$00000002(a4),d0
		addq.b	#$01,d0
		cmp.b	(a4),d0
		bcc.s	loc_9DD2
		addq.b	#$01,$00000002(a4)
		bra.s	locret_9E02
; ---------------------------------------------------------------------------

loc_9DD2:					  ; CODE XREF: sub_9DBC+Ej
		clr.b	$00000002(a4)
		move.b	$00000003(a4),d1
		addq.b	#$01,d1
		cmp.b	$00000001(a4),d1
		bcs.s	loc_9DEA
		move.b	#$FF,$00000003(a4)
		clr.b	d1

loc_9DEA:					  ; CODE XREF: sub_9DBC+24j
		addq.b	#$01,$00000003(a4)
		ext.w	d1
		add.b	d1,d1
		move.w	$00000002(a5),d0
		mulu.w	d0,d1
		movea.l	(a6),a0
		adda.l	d1,a0
		jsr	(QueueDMAOp).l		  ; d0 - DMA Length
						  ; a0 - DMA Source
						  ; a1 - DMA Copy

locret_9E02:					  ; CODE XREF: sub_9DBC+2j
						  ; sub_9DBC+14j
		rts
; End of function sub_9DBC

; ---------------------------------------------------------------------------
