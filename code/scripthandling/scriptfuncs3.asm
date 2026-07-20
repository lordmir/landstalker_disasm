ScriptFuncs3	module
; The script dispatcher and the flag-based value picker.

; (a0) = a value chosen by game flags. Inline data after the bsr:
; {flag id, value<<8} word pairs, ended by a negative word; the
; first record whose flag tests set (TestFlagBit) wins, and (a0)
; stays 0 when none do. On exit the caller's return address is
; advanced past the table, so execution resumes after it. Chained by
; GetFlagProgress to fill the eight story-progress bytes.
PickValueBasedOnFlags:
		movem.l	d0/a1,-(sp)
		clr.b	(a0)
		movea.l	$00000008(sp),a1	  ; Return address = inline records

_pvbRecord:
		move.w	(a1)+,d0
		blt.s	_pvbDone
		bsr.w	TestFlagBit
		bne.s	_pvbFound
		addq.l	#$02,a1
		bra.s	_pvbRecord
; ---------------------------------------------------------------------------

_pvbFound:
		move.b	(a1),(a0)		  ; Value = record's high byte
		addq.l	#$02,a1

_pvbSkip:
		tst.w	(a1)+			  ; Walk to the terminator
		blt.s	_pvbDone
		addq.l	#$02,a1
		bra.s	_pvbSkip
; ---------------------------------------------------------------------------

_pvbDone:
		move.l	a1,$00000008(sp)	  ; Resume past the table
		movem.l	(sp)+,d0/a1
		rts

; Run script entry d0, an offset relative to a0 (a script table or
; an inline argument block; the ScriptID/ScriptJump macros' second
; argument bakes each word's position out, so every offset is
; base-relative). Odd offsets (ScriptID) point at script-word data:
; the flag bit is stripped and ProcessScriptWord interprets it.
; Even offsets (ScriptJump) are machine-code stubs and are jsr'd.
RunTextCmd:
		movem.l	d0/a0,-(sp)
		btst	#$00,d0
		beq.s	_rtcCode
		andi.w	#$FFFE,d0
		adda.w	d0,a0
		bsr.w	ProcessScriptWord
		bra.s	_rtcDone
; ---------------------------------------------------------------------------

_rtcCode:
		jsr	(a0,d0.w)

_rtcDone:
		movem.l	(sp)+,d0/a0
		rts

; Run cutscene d0 from CutsceneScriptTable.
PlayCutsceneScript:
		movem.l	d0/a0,-(sp)
		lea	CutsceneScriptTable(pc),a0
		add.w	d0,d0
		move.w	(a0,d0.w),d0
		bsr.s	RunTextCmd
		movem.l	(sp)+,d0/a0
		rts

	modend
