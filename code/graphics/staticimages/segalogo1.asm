SegaLogo1	module
; The boot SEGA logo (via j_DisplaySegaLogo). Split across
; segalogo1/2 because the palette and tile assets are incbin'd
; between them (pc-relative reach). Shown for 240 frames or until
; any button is pressed.
DisplaySegaLogo:
		jsr	(j_DisableDisplayAndInts).l
		bsr.w	LoadSegaLogoPalette
		bsr.w	LoadSegaLogoTiles
		bsr.s	LoadSegaLogoTilemap
		jsr	(j_EnableDisplayAndInts).l
		jsr	(j_FadeFromBlack).l
		move.w	#00240,d7

_slWait:
		jsr	(j_WaitUntilVBlank).l
		jsr	(j_UpdateControllerInputs).l
		move.b	(g_Controller1State).l,d0
		andi.b	#CTRLBF_BUTTONS,d0
		dbne	d7,_slWait
		jmp	(j_FadeToBlack).l

; Writes the logo cells (12 x 4, ascending tile numbers from 1)
; into plane A. The JP/FR/DE builds place the logo two cell rows
; higher (row 10) than the others (row 12).
LoadSegaLogoTilemap:
		move.w	#$0001,d0
	if ((REGION=JP)!(REGION=FR)!(REGION=DE))
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

; Writes 12 cells with ascending tile numbers from d0.
FillAscendingTileNums:
		move.w	#$000B,d1

_fatnCell:
		move.w	d0,(VDP_DATA_REG).l
		addq.b	#$01,d0
		dbf	d1,_fatnCell
		rts

; Clears all 64 CRAM colours, then loads the logo's seven colours.
LoadSegaLogoPalette:
		move.l	#$C0000000,(VDP_CTRL_REG).l
		move.w	#$003F,d7

_slpClear:
		move.w	#$0000,(VDP_DATA_REG).l
		dbf	d7,_slpClear
		lea	SegaLogoPalette(pc),a0
		moveq	#$00000006,d0
		jmp	(j_LoadPaletteToRAM).l

		modend
