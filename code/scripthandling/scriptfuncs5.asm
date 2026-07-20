ScriptFuncs5	module

; Church script helper: two inline words after the bsr - {script for
; a normal priest, script for the skeleton priest}. Looks up the
; sprite of speaker slot 0 (the priest) and runs the matching entry
; through RunTextCmd, then advances the return address past the data
; so the stub continues. Used by the save/identify/heal prompts.
HandleChurchInteraction:
		movem.l	d0-a6,-(sp)
		clr.b	d0
		jsr	(j_GetSpeakerSpriteId).l
		movea.l	$0000003C(sp),a0	  ; Return address = inline words
		cmpi.b	#SPR_SKELETONPRIEST,d1
		bne.s	_hciNormal
		move.w	$00000002(a0),d0
		bra.s	_hciRun
; ---------------------------------------------------------------------------

_hciNormal:
		move.w	(a0),d0

_hciRun:
		bsr.w	RunTextCmd
		addq.l	#$04,$0000003C(sp)	  ; Resume past the data
		movem.l	(sp)+,d0-a6
		rts

	modend
