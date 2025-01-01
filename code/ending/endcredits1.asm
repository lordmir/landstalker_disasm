; ---------------------------------------------------------------------------

PlayEndCredits:					  ; DATA XREF: j_PlayEndCreditst
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicEnding
; ---------------------------------------------------------------------------
		link	a6,#-$0010
		clr.w	-$00000002(a6)
		clr.w	-$00000010(a6)
		clr.w	-$0000000C(a6)
		clr.w	-$00000004(a6)
		lea	(g_HUD_Row1).l,a0
		move.w	#$0000,d0
		move.w	#$07FF,d7

loc_9EC06:					  ; CODE XREF: ROM:0009EC08j
		move.w	d0,(a0)+
		dbf	d7,loc_9EC06
		jsr	(j_DisableDisplayAndInts).l
		clr.w	d0
		clr.w	d1
		clr.w	d2
		jsr	(j_DoDMAFill).l
		lea	EndCreditFont(pc),a0
		lea	(g_Buffer).l,a1
		lea	($00004000).w,a2
		jsr	(j_LoadCompressedGfx).l	  ; a0 - compressed graphics source
						  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination
		lea	EndCreditLogos(pc),a0
		lea	(g_Blockset).l,a1
		lea	($00002000).w,a2
		jsr	(j_LoadCompressedGfx).l	  ; a0 - compressed graphics source
						  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination
		lea	EndCreditLogoMap(pc),a0
		lea	(g_Blockset).l,a1
		jsr	(j_DecompTilemap).l
		lea	EndCreditPal(pc),a0
		lea	(g_Pal0Base).l,a1
		move.l	(a0)+,(a1)+
		move.l	(a0)+,(a1)+
		move.b	(a0)+,(a1)+
		jsr	(j_CopyBasePalleteToActivePalette).l
		jsr	(j_EnableDisplayAndInts).l
		jsr	(j_EnableVDPSpriteUpdate).l
		move.b	#$01,(byte_FF112A).l
		lea	(byte_FF1BFA).l,a0
		move.b	#$00,(a0)+
		move.b	#$01,(a0)+
		move.b	#$02,(a0)+
		move.b	#$03,(a0)+
		lea	EndCreditText(pc),a0

loc_9EC9A:					  ; CODE XREF: ROM:0009ECC0j
		move.w	-$0000000C(a6),d0
		move.w	-$00000002(a6),d1
		lsr.w	#$04,d1
		cmp.w	d0,d1
		bcs.s	loc_9ECBC
		clr.w	d0
		move.b	(a0)+,d0
		cmpi.b	#$FF,d0
		beq.w	loc_9ECC2
		add.w	d0,-$0000000C(a6)
		bsr.w	sub_9ED10

loc_9ECBC:					  ; CODE XREF: ROM:0009ECA6j
		bsr.w	sub_9ECDC
		bra.s	loc_9EC9A
; ---------------------------------------------------------------------------

loc_9ECC2:					  ; CODE XREF: ROM:0009ECB0j
		move.w	#10799,d0
		jsr	(j_Sleep).l
		jsr	(j_UpdateControllerInputs).l
		move.b	(g_Controller1State).l,d1
		unlk	a6
		rts

; =============== S U B	R O U T	I N E =======================================


sub_9ECDC:					  ; CODE XREF: ROM:loc_9ECBCp
						  ; sub_9F6D4+7Ep ...
		movem.l	d0-a6,-(sp)
		move.w	-$00000002(a6),d6
		lsr.w	#$01,d6
		bcs.s	loc_9ECF8
		addi.w	#$0010,d6
		jsr	(j_FillVSRAMOffset1).l
		jsr	(j_EnableDMAQueueProcessing).l

loc_9ECF8:					  ; CODE XREF: sub_9ECDC+Aj
		bsr.w	UpdateCreditScroll
		jsr	(j_WaitUntilVBlank).l
		addq.w	#$01,-$00000002(a6)
		addq.w	#$01,-$00000010(a6)
		movem.l	(sp)+,d0-a6
		rts
; End of function sub_9ECDC


; =============== S U B	R O U T	I N E =======================================


sub_9ED10:					  ; CODE XREF: ROM:0009ECB8p
		clr.w	d0
		move.b	(a0)+,d0
		bsr.w	sub_9F6D4
		rts
; End of function sub_9ED10

; ---------------------------------------------------------------------------
