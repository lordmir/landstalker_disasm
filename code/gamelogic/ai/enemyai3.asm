
; =============== S U B	R O U T	I N E =======================================


LoadProjectilePalette:				  ; CODE XREF: ROM:001AC0BCj
						  ; ROM:001AC3B0j ...
		subq.b	#$01,d0
		ext.w	d0
		lsl.b	#$02,d0
		move.l	#$C0700000,(VDP_CTRL_REG).l ; Palette address 0x70 : Pal 3, index 8
		move.w	ProjectilePalette1(pc,d0.w),d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal3Base+$10).l
		move.w	d1,(g_Pal3Active+$10).l
		move.w	ProjectilePalette1+2(pc,d0.w),d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal3Base+$12).l
		move.w	d1,(g_Pal3Active+$12).l
		move.l	#$C03A0000,(VDP_CTRL_REG).l
		move.w	ProjectilePalette1(pc,d0.w),d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal1Base+$1A).l
		move.w	d1,(g_Pal1Active+$1A).l
		move.w	ProjectilePalette1+2(pc,d0.w),d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal1Base+$1C).l
		move.w	d1,(g_Pal1Active+$1C).l
		rts
; End of function LoadProjectilePalette

; ---------------------------------------------------------------------------
