
; =============== S U B	R O U T	I N E =======================================


DisplaySegaLogo:				  ; DATA XREF: j_DisplaySegaLogot
		jsr	(j_DisableDisplayAndInts).l
		bsr.w	LoadSegaLogoPalette
		bsr.w	LoadSegaLogoTiles
		bsr.s	LoadSegaLogoTilemap
		jsr	(j_EnableDisplayAndInts).l
		jsr	(j_FadeFromBlack).l
		move.w	#00240,d7

loc_38634:					  ; CODE XREF: DisplaySegaLogo+36j
		jsr	(j_WaitUntilVBlank).l
		jsr	(j_UpdateControllerInputs).l
		move.b	(g_Controller1State).l,d0
		andi.b	#CTRLBF_BUTTONS,d0
		dbne	d7,loc_38634
		jmp	(j_FadeToBlack).l
; End of function DisplaySegaLogo


; =============== S U B	R O U T	I N E =======================================


LoadSegaLogoTilemap:				  ; CODE XREF: DisplaySegaLogo+Ep
		move.w	#$0001,d0
	if REGION=JP
		move.l	#$451C0003,(VDP_CTRL_REG).l ; VDP VRAM WRITE 0xC51C
		bsr.s	FillAscendingTileNums
		move.l	#$459C0003,(VDP_CTRL_REG).l ; VDP VRAM WRITE 0xC59C
		bsr.s	FillAscendingTileNums
		move.l	#$461C0003,(VDP_CTRL_REG).l ; VDP VRAM WRITE 0xC61C
		bsr.s	FillAscendingTileNums
		move.l	#$469C0003,(VDP_CTRL_REG).l ; VDP VRAM WRITE 0xC69C
		bsr.s	FillAscendingTileNums
	else
		move.l	#$461C0003,(VDP_CTRL_REG).l ; VDP VRAM WRITE 0xC61C
		bsr.s	FillAscendingTileNums
		move.l	#$469C0003,(VDP_CTRL_REG).l ; VDP VRAM WRITE 0xC69C
		bsr.s	FillAscendingTileNums
		move.l	#$471C0003,(VDP_CTRL_REG).l ; VDP VRAM WRITE 0xC71C
		bsr.s	FillAscendingTileNums
		move.l	#$479C0003,(VDP_CTRL_REG).l ; VDP VRAM WRITE 0xC79C
		bsr.s	FillAscendingTileNums
	endif
		rts
; End of function LoadSegaLogoTilemap


; =============== S U B	R O U T	I N E =======================================


FillAscendingTileNums:				  ; CODE XREF: LoadSegaLogoTilemap+Ep
						  ; LoadSegaLogoTilemap+1Ap ...
		move.w	#$000B,d1

loc_3868E:					  ; CODE XREF: FillAscendingTileNums+Cj
		move.w	d0,(VDP_DATA_REG).l
		addq.b	#$01,d0
		dbf	d1,loc_3868E
		rts
; End of function FillAscendingTileNums


; =============== S U B	R O U T	I N E =======================================


LoadSegaLogoPalette:				  ; CODE XREF: DisplaySegaLogo+6p
		move.l	#$C0000000,(VDP_CTRL_REG).l
		move.w	#$003F,d7

loc_386AA:					  ; CODE XREF: LoadSegaLogoPalette+16j
		move.w	#$0000,(VDP_DATA_REG).l
		dbf	d7,loc_386AA
		lea	SegaLogoPalette(pc),a0
		moveq	#$00000006,d0
		jmp	(j_LoadPaletteToRAM).l
; End of function LoadSegaLogoPalette

; ---------------------------------------------------------------------------
