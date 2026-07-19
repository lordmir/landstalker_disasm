SpriteFuncs3	module
; Sprite palette allocation. Palettes 1 and 3 carry the sprite
; colours: each has a "low" slot (colours 2-7); palette 1 also has a
; "high" slot (colours 8-14), while palette 3's high half belongs to
; the HUD. A sprite's TileSource palette bits select where its
; colours load (bit 5 set = palettes 1/3 in use, bit 6 = palette 3).
; SpritePaletteLUT maps sprite type -> palette index (bit 7 = high
; slot), with colour data in SpritePaletteLo (6 colours) and
; SpritePaletteHi (7 colours).

j_InitSpritePalettes:
		jmp	InitSpritePalettes(pc)

j_GetSpritePalette:
		jmp	GetSpritePalette(pc)

		jmp	(EnemyAI_Gola_A).l

; Room load: clears all three sprite palette slots, then loads the
; palette of every sprite that uses one.
InitSpritePalettes:
		lea	((g_Pal1Base+4)).l,a0
		lea	((g_Pal1Base+$10)).l,a1
		lea	((g_Pal3Base+4)).l,a2
		moveq	#$5,d7

_clrPalLoop:
		clr.w	(a0)+
		clr.w	(a1)+
		clr.w	(a2)+
		dbf	d7,_clrPalLoop
		clr.w	(a1)
		lea	(Sprite1_X).l,a0
		moveq	#$E,d7

_spriteLoop:
		tst.w	X(a0)
		bmi.s	_ispDone
		move.b	TileSource(a0),d0
		andi.b	#$20,d0
		beq.s	_nextSprite
		move.b	SpriteType(a0),d0
		bsr.s	GetSpritePalette

_nextSprite:
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,_spriteLoop

_ispDone:
		rts


; Loads the palette for sprite a0 (type in d0) into the slot chosen
; by its TileSource palette bits. If the slot already holds a
; different palette, a debug alarm beeps (one SND_EnemyDie1) before
; overwriting; requesting the high slot on palette 3 (occupied by
; the HUD) beeps seven times and loads nothing. Debug mode silences
; both alarms.
GetSpritePalette:
		lea	SpritePaletteLUT(pc),a1

_lutScan:
		move.b	(a1),d1
		cmp.b	d1,d0
		beq.s	_typeFound		  ; Palette is 1 or 3

_lutNext:
		addq.l	#$02,a1
		cmpi.b	#$FF,(a1)
		bne.s	_lutScan
		rts

_typeFound:
		btst	#$05,TileSource(a0)	  ; Palette is 1 or 3
		beq.s	_lutNext		  ; SKIP - Palette 1 is	the room palette, palette 3 is Nigel's palette. Either way, we already have the palette.
		move.b	1(a1),d2
		bmi.s	_hiSlot			  ; High bit set - High	palette
		btst	#$06,TileSource(a0)	  ; Palette is 4 - we only have	a low slot, as the high	slot is	occupied by the	HUD.
		beq.s	_loPal1
		lea	((g_Pal3Base+4)).l,a2
		lea	SpritePaletteLo(pc),a3
		moveq	#$5,d6
		bra.s	_loCopy			  ; Load low palette

_hiSlot:
		btst	#$06,TileSource(a0)
		bne.s	_hiOnPal3
		lea	((g_Pal1Base+$10)).l,a2
		lea	SpritePaletteHi(pc),a3
		moveq	#$6,d6
		andi.w	#$007F,d2
		mulu.w	#$000E,d2
		bra.s	_copyLoop		  ; Load high palette

_loPal1:
		lea	((g_Pal1Base+4)).l,a2
		lea	SpritePaletteLo(pc),a3
		moveq	#$5,d6

_loCopy:
		andi.w	#$007F,d2
		mulu.w	#$000C,d2

_copyLoop:
		move.w	(a2),d5
		beq.s	_copyColour
		cmp.w	(a3,d2.w),d5
		bne.s	_conflict

_copyColour:
		move.w	(a3,d2.w),(a2)+
		addq.w	#$02,d2
		dbf	d6,_copyLoop
		bra.w	_lutNext

; Slot already holds a different palette: debug alarm, then
; overwrite anyway.
_conflict:
		tst.w	(DebugModeEnable).w
		bmi.w	_copyColour
		movem.w	d0,-(sp)
		trap	#$00			  ; Trap00Handler
		dc.w SND_EnemyDie1
		move.w	#$0006,d0
		jsr	(j_Sleep).l
		movem.w	(sp)+,d0
		bra.s	_copyColour

; High slot requested on palette 3 - impossible (the HUD owns it):
; seven beeps, palette not loaded.
_hiOnPal3:
		tst.w	(DebugModeEnable).w
		bmi.w	_lutNext
		movem.w	d7,-(sp)
		moveq	#$6,d7

_beepLoop:
		movem.w	d0,-(sp)
		trap	#$00			  ; Trap00Handler
		dc.w SND_HealthRecover1
		move.w	#$0006,d0
		jsr	(j_Sleep).l
		movem.w	(sp)+,d0
		dbf	d7,_beepLoop
		movem.w	(sp)+,d7
		bra.w	_lutNext

		modend
