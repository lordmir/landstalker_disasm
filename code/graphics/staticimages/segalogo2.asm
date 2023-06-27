
; =============== S U B	R O U T	I N E =======================================


LoadSegaLogoTiles:				  ; CODE XREF: DisplaySegaLogo+Ap
		lea	SegaLogoTiles(pc),a0
		lea	(g_Buffer).l,a1
		lea	($00000020).w,a2
		jmp	(j_LoadCompressedGfx).l	  ; a0 - compressed graphics source
; End of function LoadSegaLogoTiles		  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination
; ---------------------------------------------------------------------------
