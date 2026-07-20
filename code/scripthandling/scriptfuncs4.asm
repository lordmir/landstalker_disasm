ScriptFuncs4	module
; Script-stub helpers for two-way branches. Each takes three inline
; words after the bsr - {selector, script A, script B} - runs one of
; the two script entries through RunTextCmd (offsets relative to the
; block, as encoded by the ScriptID/ScriptJump macros), then
; advances the return address past the data so the stub continues.

; {flag id, script if set, script if clear}.
CheckFlagAndDisplayMessage:
		movem.l	d0/a0,-(sp)
		movea.l	$00000008(sp),a0	  ; Return address = inline words
		move.w	(a0),d0
		bsr.w	TestFlagBit
		beq.s	_cfdmClear
		move.w	$00000002(a0),d0
		bra.s	_cfdmRun
; ---------------------------------------------------------------------------

_cfdmClear:
		move.w	$00000004(a0),d0

_cfdmRun:
		bsr.w	RunTextCmd
		addq.l	#$06,$00000008(sp)	  ; Resume past the data
		movem.l	(sp)+,d0/a0
		rts

; {flag id, script for the first time, script afterwards}: sets the
; flag on the first run, so the second script plays from then on.
SetFlagBitOnTalking:
		movem.l	d0/a0,-(sp)
		movea.l	$00000008(sp),a0	  ; Return address = inline words
		move.w	(a0),d0
		bsr.w	TestFlagBit
		bne.s	_sfbtAgain
		bsr.w	SetFlagBit
		move.w	$00000002(a0),d0
		bra.s	_sfbtRun
; ---------------------------------------------------------------------------

_sfbtAgain:
		move.w	$00000004(a0),d0

_sfbtRun:
		bsr.w	RunTextCmd
		addq.l	#$06,$00000008(sp)	  ; Resume past the data
		movem.l	(sp)+,d0/a0
		rts

; {question script, script if Yes, script if No}: asks the question,
; runs the yes/no prompt (carry set = Yes) and the matching script.
HandleYesNoPrompt:
		movem.l	d0/a0,-(sp)
		movea.l	$00000008(sp),a0	  ; Return address = inline words
		move.w	(a0),d0
		bsr.w	RunTextCmd
		bsr.w	GetYesNoAnswer
		bcc.s	_hynpNo
		move.w	$00000002(a0),d0
		bra.s	_hynpRun
; ---------------------------------------------------------------------------

_hynpNo:
		move.w	$00000004(a0),d0

_hynpRun:
		bsr.w	RunTextCmd
		addq.l	#$06,$00000008(sp)	  ; Resume past the data
		movem.l	(sp)+,d0/a0
		rts

	modend
