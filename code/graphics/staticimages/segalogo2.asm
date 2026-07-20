SegaLogo2	module
; Second half of the SEGA logo code (see segalogo1).
LoadSegaLogoTiles:
		lea	SegaLogoTiles(pc),a0
		lea	(g_Buffer).l,a1
		lea	($00000020).w,a2
		jmp	(j_LoadCompressedGfx).l	  ; a0 - compressed graphics source
						  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination

		modend
