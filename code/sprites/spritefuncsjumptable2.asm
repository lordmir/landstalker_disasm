
; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_HideSprite:					  ; DATA XREF: ROM:000117A6t
						  ; ROM:000117B2t ...
		jmp	HideSprite(pc)
; End of function j_HideSprite


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_1A4404:					  ; DATA XREF: sub_178C8:loc_178F6t
		jmp	sub_1A83E6(pc)
; End of function sub_1A4404


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_MoveSpriteOffscreen:				  ; DATA XREF: OnTick:loc_188BCt
						  ; OnTick+FFCt ...
		jmp	MoveSpriteOffscreen(pc)
; End of function j_MoveSpriteOffscreen


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_1A440C:					  ; DATA XREF: ROM:00012C96t
						  ; sub_16220+1E8t ...
		jmp	sub_1A86D6(pc)
; End of function sub_1A440C

; ---------------------------------------------------------------------------
		jmp	LoadProjectilePalette(pc)
