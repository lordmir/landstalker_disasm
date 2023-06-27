
; =============== S U B	R O U T	I N E =======================================


DisplayClimaxLogo:				  ; CODE XREF: DisplayTitlep
		jsr	(j_DisableDisplayAndInts).l
		clr.w	d6
		jsr	(j_FillHScrollData).l
		jsr	(j_FillVSRAM).l
		move.w	#$8000,d0
		move.w	#$8000,d1
		clr.w	d2
		jsr	(j_DoDMAFill).l
		lea	ClimaxLogo(pc),a0
		lea	(g_Buffer).l,a1
		lea	(0000000000).w,a2
		jsr	(j_LoadCompressedGfx).l	  ; a0 - compressed graphics source
						  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination
		lea	ClimaxLogoMap(pc),a0
		lea	(g_Buffer).l,a1
		bsr.w	DecompTilemap
		move.w	#$0000,d0
		bsr.w	ReindexDecompTilemap
		lea	($0000C410).l,a1
		bsr.w	CopyTilemapToVDP
		lea	ClimaxLogoPalette(pc),a0
		lea	(g_Pal0Base).l,a1
		move.l	(a0)+,(a1)+
		move.l	(a0)+,(a1)+
		jsr	(j_EnableDisplayAndInts).l
		jsr	(j_FadeFromBlack).l
		jsr	(j_Wait3SecondsOrUntilButtonPushed).l
		jsr	(j_FadeToBlack).l
		rts
; End of function DisplayClimaxLogo

; ---------------------------------------------------------------------------
