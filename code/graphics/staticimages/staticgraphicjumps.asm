
; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_DisplaySegaLogo:				  ; DATA XREF: ROM:000016BAt
		jmp	DisplaySegaLogo(pc)
; End of function j_DisplaySegaLogo


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_DisplayTitle:					  ; DATA XREF: ROM:000016C0t
		jmp	DisplayTitle(pc)
; End of function j_DisplayTitle


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_DecompTilemap:				  ; DATA XREF: LoadGameSelectMenu+42t
						  ; ROM:0009EC50t
		jmp	DecompTilemap(pc)
; End of function j_DecompTilemap


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_DisplayLithograph:				  ; DATA XREF: ROM:000136D0t
		jmp	DisplayLithograph(pc)
; End of function j_DisplayLithograph


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_DisplayIslandMap:				  ; DATA XREF: ROM:000142D0t
						  ; ROM:0001433At ...
		jmp	DisplayIslandMap(pc)
; End of function j_DisplayIslandMap

