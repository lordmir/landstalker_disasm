EnemyAI5	module

; Loads the four ProjectilePalette2 colours (the file sits directly
; after this one in ROM, hence the pc-relative reads) into palette 3
; colours 2-5, in CRAM and in the base + active RAM copies. Called
; only by Gola, alongside LoadProjectilePalette, when readying her
; fireball attacks.
LoadPal3Low:
		move.l	#$C0640000,(VDP_CTRL_REG).l ; CRAM $64: palette 3, colour 2
		move.w	(ProjectilePalette2,pc),d1
		nop
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal3Base+4).l
		move.w	d1,(g_Pal3Active+4).l
		move.w	((ProjectilePalette2+2),pc),d1
		nop
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal3Base+6).l
		move.w	d1,(g_Pal3Active+6).l
		move.w	((ProjectilePalette2+4),pc),d1
		nop
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal3Base+8).l
		move.w	d1,(g_Pal3Active+8).l
		move.w	((ProjectilePalette2+6),pc),d1
		nop
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal3Base+$A).l
		move.w	d1,(g_Pal3Active+$A).l
		rts

		modend
