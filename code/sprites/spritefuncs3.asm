
; =============== S U B	R O U T	I N E =======================================


j_InitSpritePalettes:				  ; DATA XREF: InitSprites+Ct

; FUNCTION CHUNK AT 001AEEDA SIZE 00000024 BYTES
; FUNCTION CHUNK AT 001AEF4C SIZE 00000026 BYTES
; FUNCTION CHUNK AT 001AF0D8 SIZE 000000B2 BYTES
; FUNCTION CHUNK AT 001AF1FC SIZE 00000082 BYTES
; FUNCTION CHUNK AT 001AF292 SIZE 000001B6 BYTES
; FUNCTION CHUNK AT 001AF4FE SIZE 00000088 BYTES

		jmp	InitSpritePalettes(pc)
; ---------------------------------------------------------------------------

loc_1A4418:					  ; DATA XREF: sub_12CAE+16t
		jmp	GetSpritePalette(pc)
; ---------------------------------------------------------------------------
		jmp	(EnemyAI_Gola_A).l
; ---------------------------------------------------------------------------

InitSpritePalettes:				  ; DATA XREF: j_InitSpritePalettest
		lea	((g_Pal1Base+4)).l,a0
		lea	((g_Pal1Base+$10)).l,a1
		lea	((g_Pal3Base+4)).l,a2
		moveq	#$00000005,d7

loc_1A4436:					  ; CODE XREF: j_InitSpritePalettes+28j
		clr.w	(a0)+
		clr.w	(a1)+
		clr.w	(a2)+
		dbf	d7,loc_1A4436
		clr.w	(a1)
		lea	(Sprite1_X).l,a0
		moveq	#$0000000E,d7

loc_1A444A:					  ; CODE XREF: j_InitSpritePalettes+4Ej
		tst.w	X(a0)
		bmi.s	locret_1A4466
		move.b	TileSource(a0),d0
		andi.b	#$20,d0
		beq.s	loc_1A445E
		move.b	SpriteType(a0),d0
		bsr.s	GetSpritePalette

loc_1A445E:					  ; CODE XREF: j_InitSpritePalettes+42j
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,loc_1A444A

locret_1A4466:					  ; CODE XREF: j_InitSpritePalettes+38j
		rts
; End of function j_InitSpritePalettes


; =============== S U B	R O U T	I N E =======================================


GetSpritePalette:				  ; CODE XREF: j_InitSpritePalettes+48p
						  ; DATA XREF: j_InitSpritePalettes:loc_1A4418t
		lea	SpritePaletteLUT(pc),a1

loc_1A446C:					  ; CODE XREF: GetSpritePalette+10j
		move.b	(a1),d1
		cmp.b	d1,d0
		beq.s	loc_1A447C		  ; Palette is 1 or 3

loc_1A4472:					  ; CODE XREF: GetSpritePalette+1Aj
						  ; GetSpritePalette+7Ej ...
		addq.l	#$02,a1
		cmpi.b	#$FF,(a1)
		bne.s	loc_1A446C
		rts
; ---------------------------------------------------------------------------

loc_1A447C:					  ; CODE XREF: GetSpritePalette+8j
		btst	#$05,$00000006(a0)	  ; Palette is 1 or 3
		beq.s	loc_1A4472		  ; SKIP - Palette 1 is	the room palette, palette 3 is Nigel's palette. Either way, we already have the palette.
		move.b	$00000001(a1),d2
		bmi.s	loc_1A44A0		  ; High bit set - High	palette
		btst	#$06,$00000006(a0)	  ; Palette is 4 - we only have	a low slot, as the high	slot is	occupied by the	HUD.
		beq.s	loc_1A44BE
		lea	((g_Pal3Base+4)).l,a2
		lea	SpritePaletteLo(pc),a3
		moveq	#$00000005,d6
		bra.s	loc_1A44CA		  ; Load low palette
; ---------------------------------------------------------------------------

loc_1A44A0:					  ; CODE XREF: GetSpritePalette+20j
		btst	#$06,$00000006(a0)
		bne.s	loc_1A450A
		lea	((g_Pal1Base+$10)).l,a2
		lea	SpritePaletteHi(pc),a3
		moveq	#$00000006,d6
		andi.w	#$007F,d2
		mulu.w	#$000E,d2
		bra.s	loc_1A44D2		  ; Load high palette
; ---------------------------------------------------------------------------

loc_1A44BE:					  ; CODE XREF: GetSpritePalette+28j
		lea	((g_Pal1Base+4)).l,a2
		lea	SpritePaletteLo(pc),a3
		moveq	#$00000005,d6

loc_1A44CA:					  ; CODE XREF: GetSpritePalette+36j
		andi.w	#$007F,d2
		mulu.w	#$000C,d2

loc_1A44D2:					  ; CODE XREF: GetSpritePalette+54j
						  ; GetSpritePalette+7Aj
		move.w	(a2),d5
		beq.s	loc_1A44DC
		cmp.w	(a3,d2.w),d5
		bne.s	loc_1A44EA

loc_1A44DC:					  ; CODE XREF: GetSpritePalette+6Cj
						  ; GetSpritePalette+86j ...
		move.w	(a3,d2.w),(a2)+
		addq.w	#$02,d2
		dbf	d6,loc_1A44D2
		bra.w	loc_1A4472
; ---------------------------------------------------------------------------

loc_1A44EA:					  ; CODE XREF: GetSpritePalette+72j
		tst.w	(DebugModeEnable).w
		bmi.w	loc_1A44DC
		movem.w	d0,-(sp)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_EnemyDie1
; ---------------------------------------------------------------------------
		move.w	#$0006,d0
		jsr	(j_Sleep).l
		movem.w	(sp)+,d0
		bra.s	loc_1A44DC
; ---------------------------------------------------------------------------

loc_1A450A:					  ; CODE XREF: GetSpritePalette+3Ej
		tst.w	(DebugModeEnable).w
		bmi.w	loc_1A4472
		movem.w	d7,-(sp)
		moveq	#$00000006,d7

loc_1A4518:					  ; CODE XREF: GetSpritePalette+C6j
		movem.w	d0,-(sp)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_HealthRecover1
; ---------------------------------------------------------------------------
		move.w	#$0006,d0
		jsr	(j_Sleep).l
		movem.w	(sp)+,d0
		dbf	d7,loc_1A4518
		movem.w	(sp)+,d7
		bra.w	loc_1A4472
; End of function GetSpritePalette

; ---------------------------------------------------------------------------
