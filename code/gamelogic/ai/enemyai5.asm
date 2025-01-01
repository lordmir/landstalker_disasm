
; =============== S U B	R O U T	I N E =======================================


LoadPal3Low:					  ; CODE XREF: sub_1A4414+AEB4p
						  ; sub_1A4414+AEF2p ...
		move.l	#$C0640000,(VDP_CTRL_REG).l ; CRAM 0x64	(Palette 3, Entry 4)
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
; End of function LoadPal3Low

; ---------------------------------------------------------------------------
