
; =============== S U B	R O U T	I N E =======================================


SetSpecialCharacter:				  ; CODE XREF: ROM:loc_28F42p
		move.l	d0,-(sp)
		subi.w	#01000,d0
		move.b	SpecialCharacterSfxList(pc,d0.w),(g_TalkSoundEffect).l ; Nigel
		move.l	(sp)+,d0
		rts
; End of function SetSpecialCharacter

; ---------------------------------------------------------------------------
