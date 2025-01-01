
; =============== S U B	R O U T	I N E =======================================


PickValueBasedOnFlags:				  ; CODE XREF: ROM:00025320p
						  ; ROM:000253A0p ...
		movem.l	d0/a1,-(sp)
		clr.b	(a0)
		movea.l	$00000008(sp),a1

loc_253D4:					  ; CODE XREF: PickValueBasedOnFlags+16j
		move.w	(a1)+,d0
		blt.s	loc_253EE
		bsr.w	TestFlagBit
		bne.s	loc_253E2
		addq.l	#$02,a1
		bra.s	loc_253D4
; ---------------------------------------------------------------------------

loc_253E2:					  ; CODE XREF: PickValueBasedOnFlags+12j
		move.b	(a1),(a0)
		addq.l	#$02,a1

loc_253E6:					  ; CODE XREF: PickValueBasedOnFlags+22j
		tst.w	(a1)+
		blt.s	loc_253EE
		addq.l	#$02,a1
		bra.s	loc_253E6
; ---------------------------------------------------------------------------

loc_253EE:					  ; CODE XREF: PickValueBasedOnFlags+Cj
						  ; PickValueBasedOnFlags+1Ej
		move.l	a1,$00000008(sp)
		movem.l	(sp)+,d0/a1
		rts
; End of function PickValueBasedOnFlags


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
