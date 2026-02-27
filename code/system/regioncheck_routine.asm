
; =============== S U B	R O U T	I N E =======================================


CheckRegion:					  ; DATA XREF: j_CheckRegiont
	if NTSC
		move.b	#$80,d1
	else
		move.b	#$C0,d1
	endif
		bne.s	loc_11EA6C
		rts
; ---------------------------------------------------------------------------

loc_11EA6C:					  ; CODE XREF: CheckRegion+4j
		move.b	(SEGA_VERSION_REG).l,d0
		andi.b	#$C0,d0
		cmp.b	d0,d1
		bne.s	loc_11EA7C
		rts
; ---------------------------------------------------------------------------

loc_11EA7C:					  ; CODE XREF: CheckRegion+14j
		jsr	(j_DisableDisplayAndInts).l
		lea	RegionErrorLine1(pc),a0
		lea	((g_ForegroundBlocks+$886)).l,a1
		bsr.w	sub_11EB40
	if NTSC
		move.b	#$80,d1
	else
		move.b	#$C0,d1
	endif
		cmpi.b	#$80,d1
		bne.s	loc_11EAAA
		lea	RegionErrorNTSC(pc),a0
		lea	((g_ForegroundBlocks+$A06)).l,a1
		bsr.w	sub_11EB40
		bra.s	loc_11EAB8
; ---------------------------------------------------------------------------

loc_11EAAA:					  ; CODE XREF: CheckRegion+34j
		lea	RegionErrorPAL(pc),a0
		lea	((g_ForegroundBlocks+$A06)).l,a1
		bsr.w	sub_11EB40

loc_11EAB8:					  ; CODE XREF: CheckRegion+44j
		lea	RegionErrorLine3(pc),a0
		lea	((g_ForegroundBlocks+$B86)).l,a1
		bsr.w	sub_11EB40
		jsr	(j_EnableDisplayAndInts).l
		lea	((g_ForegroundBlocks+$3FE)).l,a0
		lea	($0000C000).l,a1
		move.w	#$0800,d0
		moveq	#$00000002,d1
		jsr	(j_QueueDMAOp).l
		lea	SystemFont(pc),a0
		nop
		lea	($00000400).w,a1
		move.w	#$03B0,d0
		moveq	#$00000002,d1
		jsr	(j_QueueDMAOp).l
		move.w	#$0EEE,(g_Pal0Active+2).l
		clr.l	(g_Pal0Active+4).l
		clr.l	(g_Pal0Active+8).l
		clr.l	(g_Pal0Active+$C).l
		clr.l	(g_Pal0Active+$10).l
		clr.l	(g_Pal0Active+$14).l
		clr.l	(g_Pal0Active+$18).l
		clr.l	(g_Pal0Active+$1C).l
		jsr	(j_QueueFullPaletteDMA).l
		jsr	(j_EnableDMAQueueProcessing).l

loc_11EB38:					  ; CODE XREF: CheckRegion+DAj
		jsr	(j_WaitUntilVBlank).l
		bra.s	loc_11EB38
; End of function CheckRegion


; =============== S U B	R O U T	I N E =======================================


sub_11EB40:					  ; CODE XREF: CheckRegion+28p
						  ; CheckRegion+40p ...
		clr.w	d0
		move.b	(a0)+,d0
		bne.s	loc_11EB48
		rts
; ---------------------------------------------------------------------------

loc_11EB48:					  ; CODE XREF: sub_11EB40+4j
		move.w	d0,(a1)+
		bra.s	sub_11EB40
; End of function sub_11EB40

; ---------------------------------------------------------------------------
