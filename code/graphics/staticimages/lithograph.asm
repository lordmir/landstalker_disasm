
; =============== S U B	R O U T	I N E =======================================


DisplayLithograph:				  ; DATA XREF: j_DisplayLithographt
		jsr	(sub_3E6).l
		move.w	#$0000,d0
		move.b	#$10,d1
		jsr	(j_OrVDPReg).l		  ; Enable HInt
		move.w	#$9203,d0		  ; #18	- Window 3 cells from top
		jsr	(j_SetVDPReg).l
		move.w	#$8A18,(g_VDPReg10_HIntLine).l ; #10 - Set HInt	on line	24
		move.w	#$8A18,(VDP_CTRL_REG).l
		bsr.s	LoadLithographTiles
		bsr.s	LoadLithographTilemap
		bsr.w	LoadLithographPalette
		jsr	(j_FadeInFromDarkness).l
		rts
; End of function DisplayLithograph


; =============== S U B	R O U T	I N E =======================================


LoadLithographTiles:				  ; CODE XREF: DisplayLithograph+2Ep
		lea	Lithograph(pc),a0
		lea	(g_Buffer).l,a1
		lea	($00002000).w,a2
		jsr	(j_DecompressAndQueueGfxCopy).l
		jsr	(j_FlushDMACopyQueue).l
		rts
; End of function LoadLithographTiles


; =============== S U B	R O U T	I N E =======================================


LoadLithographTilemap:				  ; CODE XREF: DisplayLithograph+30p
		jsr	(j_DisableInterrupts).l
		jsr	(j_CopyVDPSpriteTableDMA).l
		jsr	(j_EnableInterrupts).l
		clr.w	(g_HorizontalScrollData).l
		clr.w	(g_VSRAMData).l
		jsr	(j_QueueHScrollDMAUpdate).l
		jsr	(j_QueueVSRAMUpdate).l
		jsr	(j_FlushDMACopyQueue).l
		lea	LithographTilemap(pc),a0
		lea	(g_Buffer).l,a1
		bsr.w	DecompTilemap
		clr.w	d6
		clr.w	d7
		move.b	(a1)+,d6
		move.b	(a1)+,d7
		subq.w	#$01,d6
		subq.w	#$01,d7
		lea	($429E0003).l,a0	  ; Write VRAM 0xC29E

loc_38A7E:					  ; CODE XREF: LoadLithographTilemap+6Ej
		movem.l	d6/a0,-(sp)
		move.l	a0,(VDP_CTRL_REG).l

loc_38A88:					  ; CODE XREF: LoadLithographTilemap+60j
		move.w	(a1)+,(VDP_DATA_REG).l
		dbf	d6,loc_38A88
		movem.l	(sp)+,d6/a0
		adda.l	#$00800000,a0		  ; Increment VRAM Dest	by 0x80
		dbf	d7,loc_38A7E
		rts
; End of function LoadLithographTilemap


; =============== S U B	R O U T	I N E =======================================


LoadLithographPalette:				  ; CODE XREF: DisplayLithograph+32p
		lea	LithographPalette(pc),a0
		jmp	(j_LoadPaletteToRAM).l
; End of function LoadLithographPalette

; ---------------------------------------------------------------------------
