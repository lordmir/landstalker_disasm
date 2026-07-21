ScriptFuncs2	module
; Speaker resolution: which character the player is talking to and
; which script runs for them. RoomDialogueTable holds, per room, a
; header word {bits 14-11: entry count, bits 10-0: room number}
; followed by that many entry words {bits 14-11: run length,
; bits 10-0: first character id} - each declaring a run of
; consecutive character ids occupying the room's next dialogue
; slots. A speaker's slot index (g_currentSpeakerScriptID) resolves
; to a character id by walking the runs.
;
; The "? ERROR 7" paths: when DebugModeEnable is zero (the retail
; state), a missing table entry shows the error script via trap #1;
; otherwise it is silently skipped. Either way the lookup returns
; carry set.

; Talk to the current speaker: resolve their character id and run
; their script from CharacterScriptTable. Holding Down on pad 2
; while talking opens the debug menu instead (retail cheat; only
; while DebugModeEnable is zero).
PlayerTalk:
		movem.l	d0-a6,-(sp)
		move.w	#$FFFF,(g_PendingCutsceneAction).l
		btst	#CTRL_DOWN,(g_Controller2State).l
		beq.s	_ptTalk
		tst.w	(DebugModeEnable).w
		bne.s	_ptTalk
		bsr.w	DebugMenu
		bra.s	_ptDone
; ---------------------------------------------------------------------------

_ptTalk:
		bsr.s	GetSpeakerCharacter
		bcs.s	_ptDone
		lea	CharacterScriptTable(pc),a0
		add.w	d0,d0
		move.w	(a0,d0.w),d0
		bsr.w	RunTextCmd

_ptDone:
		movem.l	(sp)+,d0-a6
		rts

; Resolve dialogue slot g_currentSpeakerScriptID in the current
; room to a character id: d0 = character, also stored in
; g_SpeakerCharId and g_CurrentTextItem (so text can print the
; speaker's name). Sets the voice blip on the way (GetSpeakerSfx,
; whose closing tst means its error branch never takes). Carry set =
; not found. Also used by the shop flow (shopscriptfuncs1).
GetSpeakerCharacter:
		movem.l	d1-d2/d4/a0,-(sp)
		bsr.w	GetDialogueForRoom
		bcs.s	_gscDone
		clr.w	d1
		move.b	(g_currentSpeakerScriptID).l,d1
		bsr.w	GetSpeakerSfx
		bcs.s	_gscDone
		subq.w	#$01,d2

_gscEntry:
		move.w	(a0)+,d0
		move.w	d0,d4
		andi.w	#$7800,d4
		rol.w	#$05,d4			  ; Run length
		andi.w	#$07FF,d0		  ; First character id
		cmp.w	d4,d1
		blt.s	_gscFound
		sub.w	d4,d1
		dbf	d2,_gscEntry
		bra.s	_gscError
; ---------------------------------------------------------------------------

_gscFound:
		add.w	d1,d0			  ; Character = run base + remainder
		move.w	d0,(g_SpeakerCharId).l
		move.w	d0,(g_CurrentTextItem).l

_gscDone:
		movem.l	(sp)+,d1-d2/d4/a0
		rts
; ---------------------------------------------------------------------------

_gscError:
		tst.w	(DebugModeEnable).w
		bne.s	_gscFail
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
	if	((REGION=JP)!(REGION=US_BETA))
		ScriptID     $3,$0
	else
		ScriptID    $0,$0		  ; Run	text script at offset 0x0277F6
					; 0xE000: PRINT MSG 0x004D, MSGBOX CLEARED, END: "? ERROR 7{5E}"
	endif
; ---------------------------------------------------------------------------

_gscFail:
		ori	#$01,ccr
		bra.s	_gscDone
; ---------------------------------------------------------------------------

; The reverse mapping: find character d0 among the current room's
; runs and store its dialogue slot index in
; g_currentSpeakerScriptID. Used when a script switches speaker.
LoadNextCharacterFromRoomTbl:
		movem.l	d2-d4/a0,-(sp)
		bsr.s	GetDialogueForRoom
		bcs.s	_lncDone
		clr.w	d1
		subq.w	#$01,d2

_lncEntry:
		move.w	(a0)+,d3
		move.w	d3,d4
		andi.w	#$7800,d4		  ; dialogue idx
		rol.w	#$05,d4			  ; Run length
		andi.w	#$07FF,d3		  ; character
		subq.w	#$01,d4

_lncSlot:
		cmp.w	d3,d0
		beq.s	_lncFound
		addq.w	#$01,d1
		addq.w	#$01,d3
		dbf	d4,_lncSlot
		dbf	d2,_lncEntry
		bra.s	_lncError
; ---------------------------------------------------------------------------

_lncFound:
		move.b	d1,(g_currentSpeakerScriptID).l

_lncDone:
		movem.l	(sp)+,d2-d4/a0
		rts
; ---------------------------------------------------------------------------

_lncError:
		tst.w	(DebugModeEnable).w
		bne.s	_lncFail
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
	if	((REGION=JP)!(REGION=US_BETA))
		ScriptID     $4,$0
	else
		ScriptID    $0,$0		  ; Run	text script at offset 0x0277F6
					; 0xE000: PRINT MSG 0x004D, MSGBOX CLEARED, END: "? ERROR 7{5E}"
	endif
; ---------------------------------------------------------------------------

_lncFail:
		ori	#$01,ccr
		bra.s	_lncDone
; ---------------------------------------------------------------------------

; Find the current room (g_OriginalRoom) in RoomDialogueTable:
; a0 = its first entry word, d2 = entry count, carry clear. A
; negative header word terminates the table (carry set = no entry).
GetDialogueForRoom:
		movem.w	d0-d1,-(sp)
		move.w	(g_OriginalRoom).l,d0
		lea	RoomDialogueTable(pc),a0

_gdrScan:
		move.w	(a0)+,d1
		blt.s	_gdrError
		move.w	d1,d2
		andi.w	#$7800,d2
		rol.w	#$05,d2			  ; Entry count
		andi.w	#$07FF,d1		  ; Room number
		cmp.w	d0,d1
		beq.s	_gdrDone
		adda.w	d2,a0			  ; Skip this room's entries
		adda.w	d2,a0
		bra.s	_gdrScan
; ---------------------------------------------------------------------------

_gdrDone:
		movem.w	(sp)+,d0-d1
		rts
; ---------------------------------------------------------------------------

_gdrError:
		tst.w	(DebugModeEnable).w
		bne.s	_gdrFail
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
	if	((REGION=JP)!(REGION=US_BETA))
		ScriptID     $2,$0
	else
		ScriptID    $0,$0		  ; Run	text script at offset 0x0277F6
					; 0xE000: PRINT MSG 0x004D, MSGBOX CLEARED, END: "? ERROR 7{5E}"
	endif
; ---------------------------------------------------------------------------

_gdrFail:
		ori	#$01,ccr
		bra.s	_gdrDone

; Run a character's progress-dependent dialogue. First refresh the
; eight story-progress bytes (GetFlagProgress recomputes
; g_GameFlagProgress1..+7 from the game flags), raising each to at
; least the value in g_GameFlagProgressFloor (nothing appears to
; write that block - the merge looks like a vestigial floor).
;
; Inline data after the bsr: 4-byte records {progress byte index,
; threshold, script id word}, ascending, ended by a record whose
; first byte is negative. Scanning backwards, the last record whose
; threshold <= the current progress runs; the rts then returns from
; the calling stub (its return address is discarded).
HandleProgressDependentDialogue:
		movem.l	d0/a0-a2,-(sp)
		bsr.w	GetFlagProgress
		lea	(g_GameFlagProgress1).l,a0
		lea	(g_GameFlagProgressFloor).l,a1
		moveq	#$00000007,d0

_hpdMerge:
		cmpm.b	(a1)+,(a0)+
		bcc.s	_hpdNext
		move.b	-$00000001(a1),-$00000001(a0)

_hpdNext:
		dbf	d0,_hpdMerge
		movea.l	$00000010(sp),a0	  ; Return address = inline records
		movea.l	a0,a1

_hpdFindEnd:
		tst.b	(a1)
		blt.s	_hpdScan		  ; Reached end	of list	of cmds?
		addq.l	#$04,a1
		bra.s	_hpdFindEnd
; ---------------------------------------------------------------------------

_hpdScan:
		clr.w	d0
		lea	(g_GameFlagProgress1).l,a2

_hpdRecord:
		subq.l	#$04,a1
		cmpa.l	a0,a1			  ; No match found
		bcs.s	_hpdError
		move.b	(a1),d0			  ; Progress byte index
		move.b	(a2,d0.w),d0
		cmp.b	$00000001(a1),d0	  ; Below this record's threshold?
		blt.s	_hpdRecord
		move.w	$00000002(a1),d0
		bsr.w	RunTextCmd

_hpdDone:
		movem.l	(sp)+,d0/a0-a2
		addq.l	#$04,sp			  ; Skip the inline data
		rts
; ---------------------------------------------------------------------------

_hpdError:
		tst.w	(DebugModeEnable).w
		bne.s	_hpdFail
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
	if	((REGION=JP)!(REGION=US_BETA))
		ScriptID     $5,$0
	else
		ScriptID    $0,$0		  ; Run	text script at offset 0x0277F6
					; 0xE000: PRINT MSG 0x004D, MSGBOX CLEARED, END: "? ERROR 7{5E}"
	endif
; ---------------------------------------------------------------------------

_hpdFail:
		bra.s	_hpdDone

	modend
