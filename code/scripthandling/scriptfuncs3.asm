
; =============== S U B	R O U T	I N E =======================================


RunTextCmd:					  ; CODE XREF: sub_24A98+2Ep
						  ; sub_24B48+30p ...
		movem.l	d0/a0,-(sp)
		btst	#$00,d0
		beq.s	loc_2540E
		andi.w	#$FFFE,d0
		adda.w	d0,a0
		bsr.w	ProcessScriptWord
		bra.s	loc_25412
; ---------------------------------------------------------------------------

loc_2540E:					  ; CODE XREF: RunTextCmd+8j
		jsr	(a0,d0.w)

loc_25412:					  ; CODE XREF: RunTextCmd+14j
		movem.l	(sp)+,d0/a0
		rts
; End of function RunTextCmd


; =============== S U B	R O U T	I N E =======================================


PlayCutsceneScript:				  ; DATA XREF: j_PlayCutsceneScriptt
		movem.l	d0/a0,-(sp)
		lea	CutsceneScriptTable(pc),a0
		add.w	d0,d0
		move.w	(a0,d0.w),d0
		bsr.s	RunTextCmd
		movem.l	(sp)+,d0/a0
		rts
; End of function PlayCutsceneScript

; ---------------------------------------------------------------------------
