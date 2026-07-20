LithographScreen	module
; Full-screen view of the Lithograph artwork (invoked from the
; cutscene action that shows it, via j_DisplayLithograph): fade
; out, set the window to the top three cell rows with HInt on line
; 24, load the tiles/tilemap/palette, fade back in. The caller
; restores the display afterwards.
DisplayLithograph:
		jsr	(j_FadeOutToDarkness).l
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

LoadLithographTiles:
		lea	Lithograph(pc),a0
		lea	(g_Buffer).l,a1
		lea	($00002000).w,a2
		jsr	(j_DecompressAndQueueGfxCopy).l
		jsr	(j_FlushDMACopyQueue).l
		rts

; Clears sprites and scroll, then copies the decompressed tilemap
; (first two bytes = width and height in cells) row by row into
; plane A at VRAM $C29E.
LoadLithographTilemap:
		jsr	(j_DisableInterrupts).l
		jsr	(j_ClearAndRefreshVDPSpriteTableDMA).l
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

_tmRow:
		movem.l	d6/a0,-(sp)
		move.l	a0,(VDP_CTRL_REG).l

_tmCell:
		move.w	(a1)+,(VDP_DATA_REG).l
		dbf	d6,_tmCell
		movem.l	(sp)+,d6/a0
		adda.l	#$00800000,a0		  ; Increment VRAM Dest	by 0x80
		dbf	d7,_tmRow
		rts

LoadLithographPalette:
		lea	LithographPalette(pc),a0
		jmp	(j_LoadPaletteToRAM).l

		modend
