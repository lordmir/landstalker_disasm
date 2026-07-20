ScriptFuncs7	module

; Speaker switch to a special (non-room) character, id 1000+: set
; their voice blip from SpecialCharacterSfxList (entry 0 = Nigel).
SetSpecialCharacter:
		move.l	d0,-(sp)
		subi.w	#01000,d0
		move.b	SpecialCharacterSfxList(pc,d0.w),(g_TalkSoundEffect).l
		move.l	(sp)+,d0
		rts

	modend
