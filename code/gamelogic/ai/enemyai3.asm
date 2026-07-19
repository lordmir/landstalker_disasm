EnemyAI3	module

; Loads a two-colour projectile glow into the sprite palettes: entry
; d0 (1-based, 2 colours / 4 bytes each) of ProjectilePalette1 (which
; sits directly after this file in ROM, hence the pc-relative reads)
; is written to palette 3 colours 8-9 and palette 1 colours 13-14, in
; CRAM and in the base + active RAM copies. Used by the bosses and
; undead (Gola, Mir, Ifrit, spectres, reapers) when readying a
; projectile; every current caller passes d0 = 1.
LoadProjectilePalette:
		subq.b	#$01,d0
		ext.w	d0
		lsl.b	#$02,d0
		move.l	#$C0700000,(VDP_CTRL_REG).l ; CRAM $70: palette 3, colour 8
		move.w	ProjectilePalette1(pc,d0.w),d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal3Base+$10).l
		move.w	d1,(g_Pal3Active+$10).l
		move.w	ProjectilePalette1+2(pc,d0.w),d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal3Base+$12).l
		move.w	d1,(g_Pal3Active+$12).l
		move.l	#$C03A0000,(VDP_CTRL_REG).l ; CRAM $3A: palette 1, colour 13
		move.w	ProjectilePalette1(pc,d0.w),d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal1Base+$1A).l
		move.w	d1,(g_Pal1Active+$1A).l
		move.w	ProjectilePalette1+2(pc,d0.w),d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal1Base+$1C).l
		move.w	d1,(g_Pal1Active+$1C).l
		rts

		modend
