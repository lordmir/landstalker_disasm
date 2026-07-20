StaticGraphicJmps	module
; Long-jump thunks for the static image screens.

j_DisplaySegaLogo:
		jmp	DisplaySegaLogo(pc)

j_DisplayTitle:
		jmp	DisplayTitle(pc)

j_DecompTilemap:
		jmp	DecompTilemap(pc)

j_DisplayLithograph:
		jmp	DisplayLithograph(pc)

j_DisplayIslandMap:
		jmp	DisplayIslandMap(pc)

		modend
