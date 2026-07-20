StringFuncs1	module
; Core text engine: prints a huffman-compressed string into the
; textbox tile buffer, character by character. String id d0 selects
; bank (id high byte) and entry (low byte) via StringPtr; DecodeChar
; (stringfuncs3) decompresses one character at a time.
;
; Two print modes, selected by bit 0 of g_TextFlags:
;   PrintString          - typewriter: the textbox is DMA-copied to
;                          VRAM after every glyph (dialogue).
;   PrintStringInstantly - the copy only happens at newlines and at
;                          the end of the string, so the text appears
;                          a line at a time (menus, save screens).
; g_TextFlags: bit 0 = instant mode, bit 1 = always set, bit 5 = talk
; mode. flags>>1 doubles as the line-home value for g_TextCursorX:
; $01 normally, $11 in talk mode (indented past the speaker portrait
; margin).
;
; The cursor is pixel-based: g_TextCursorX (auto-wraps past $114),
; g_TextCursorY ($10 per text line; past the last line - 3 in the
; dialogue box, 2 in the inventory text area - the box is scrolled
; up instead).
;
; Substrings (speaker/item names, numbers) are expanded into
; g_InsertedString as a $FFFF-terminated list of word-sized chars;
; GetNextChar drains that list (g_InsertedStringPtr non-zero) before
; returning to the compressed stream.
;
; Characters >= CHR_ARROW_PROMPT are control characters: ControlChars
; maps them to a complemented control code, and ProcessChar sends
; negative codes to the HandleControlChars jump table.

PrintStringInstantly:
		move.b	#$01,(g_TextFlags).l
		bra.s	_psCommon

; Print string d0 in the textbox (typewriter mode). Returns when the
; string terminator (the next string's CHR_STR_BEGIN marker) is hit.
PrintString:
		clr.b	(g_TextFlags).l

_psCommon:
		movem.l	d0-a6,-(sp)
		bsr.w	InitCompString
		cmpi.b	#$01,(g_comprStringLen).l
		beq.w	_psExit			  ; Empty string
		bsr.w	InitHuffmanDecomp
		move.l	a0,(g_ComprCharPtr).l
		bsr.w	_printFirstChar

_psNextChar:
		bsr.w	GetNextChar

_psProcess:
		cmpi.w	#$FFF0,d0		  ; Control $0F: continue prompt
		beq.s	_psPutChar
		cmpi.w	#$FFF6,d0		  ; Control $09: 1.5s pause
		beq.s	_psPutChar
		bsr.s	_autoWrap

_psPutChar:
		bsr.w	ProcessChar
		bra.s	_psNextChar
; ---------------------------------------------------------------------------

; Start a new line if the cursor has passed the right edge of the
; textbox ($114 px). Skipped for the prompt/pause controls above.
_autoWrap:
		cmpi.w	#$0114,(g_TextCursorX).l
		bls.s	_nlDone

; New line, preserving d0.
HandleNewLine:
		movem.w	d0,-(sp)
		bsr.s	_newLine
		movem.w	(sp)+,d0
		rts

; Move the cursor to the start of the next line. In instant mode this
; is also where the textbox is flushed to VRAM. Home X = flags>>1
; ($01, or $11 in talk mode); if Y passes the bottom of the box
; ($30 in-game, $20 in the two-line inventory text area), the box
; scrolls up one text line instead.
_newLine:
		bsr.w	_testInstantMode
		bcs.s	_nlHome
		movem.w	d0,-(sp)
		bsr.w	DMACopyTextboxTiles
		movem.w	(sp)+,d0

_nlHome:
		bsr.w	TestIfInventoryIsOpen
		bcs.s	_nlTall
		move.b	#$20,d1			  ; 2-line inventory text area
		bra.s	_nlApply
; ---------------------------------------------------------------------------

_nlTall:
		move.b	#$30,d1			  ; 3-line dialogue textbox

_nlApply:
		move.b	(g_TextFlags).l,d2
		lsr.b	#$01,d2
		ext.w	d2
		move.w	d2,(g_TextCursorX).l	  ; X = line home
		addi.b	#$10,(g_TextCursorY).l
		cmp.b	(g_TextCursorY).l,d1
		bcc.s	_nlDone
		bsr.w	ScrollTextboxUp
		subi.b	#$10,(g_TextCursorY).l

_nlDone:
		rts

; Locate compressed string d0 and reset the per-string state.
InitCompString:
		bsr.s	GetComprStringPtr
		bsr.s	InitStringVars
		rts

; Handle the first character: a leading down-arrow prompt char (the
; no-op control $15) is swallowed; anything else gets the cursor
; homed first, then is fed straight into the main loop (our own
; return address is discarded into d1).
_printFirstChar:
		bsr.w	GetNextChar
		cmpi.w	#~$0015,d0
		beq.s	_pfcDone
		movem.l	d0,-(sp)
		bsr.w	InsertNewline
		movem.l	(sp)+,d0
		movem.l	(sp)+,d1
		bra.w	_psProcess
; ---------------------------------------------------------------------------

_pfcDone:
		rts

; Reset string state: no inserted substring, talk mode off, read the
; compressed length byte, point the item list at g_CurrentTextItem
; and set flags bit 1 (the "|= 2" keeps the line-home X at 1).
InitStringVars:
		clr.l	(g_InsertedStringPtr).l
		clr.b	(g_TalkBlipCounter).l
		move.b	(a0)+,(g_comprStringLen).l ; Number of compressed bytes	to process
		move.l	#g_CurrentTextItem,(g_TextItemPtr).l
		move.b	#$01,d1
		add.b	d1,d1
		or.b	d1,(g_TextFlags).l	  ; |=2
		rts

; a0 = compressed string d0: bank = id high byte (an index into the
; StringPtr table), then walk the bank's length-prefixed entries
; until entry (id low byte) is reached.
GetComprStringPtr:
		movem.w	d0,-(sp)
		lsr.w	#$06,d0
		andi.b	#$FC,d0			  ; Top	byte: string bank
		movea.l	(StringPtr).l,a0
		movea.l	(a0,d0.w),a0
		movem.w	(sp)+,d0		  ; Bottom byte: index in bank

_gcspNext:
		tst.b	d0			  ; Keep looking until we find our string
		beq.s	_gcspFound		  ; 1st	byte of	entry: num bytes in compressed string
		moveq	#$00000000,d7
		move.b	(a0),d7
		adda.l	d7,a0
		subq.b	#$01,d0
		bra.s	_gcspNext
; ---------------------------------------------------------------------------

_gcspFound:
		rts

; Fetch the next character into d0: a word from the inserted
; substring if one is active, otherwise the next decompressed char.
; Literal chars return as-is; control chars return their complemented
; code from ControlChars. Hitting CHR_STR_BEGIN (the terminator) ends
; the whole print: the main-loop return address is discarded and
; PrintString returns to its caller.
GetNextChar:
		tst.l	(g_InsertedStringPtr).l
		bne.w	_gncInsertedChar

_gncStream:
		movea.l	(g_ComprCharPtr).l,a0
		bsr.w	DecodeChar
		move.l	a0,(g_ComprCharPtr).l
		cmpi.b	#CHR_STR_BEGIN,d0	  ; String begin
		beq.s	_gncEndOfString
		bcs.s	_gncLiteral
		subi.b	#CHR_ARROW_PROMPT,d0	  ; Control character
		andi.w	#$00FF,d0
		add.w	d0,d0
		lea	ControlChars(pc),a1
		move.w	(a1,d0.w),d0
		rts
; ---------------------------------------------------------------------------

_gncLiteral:
		andi.w	#$00FF,d0
		rts
; ---------------------------------------------------------------------------

_gncEndOfString:
		bsr.w	_testInstantMode
		bcs.s	_gncAbort
		bsr.w	DMACopyTextboxTiles	  ; Final flush in instant mode

_gncAbort:
		movem.l	(sp)+,d0		  ; Discard main-loop return address

_psExit:
		movem.l	(sp)+,d0-a6
		rts
; ---------------------------------------------------------------------------

; Read the next word char from the inserted substring; $FFFF ends it
; and resumes the compressed stream. Non-JP: the word-wrap hint chars
; are skipped, and a breaking space becomes char 0 (a plain space).
_gncInsertedChar:
		movea.l	(g_InsertedStringPtr).l,a1
		move.w	(a1)+,d0
		move.l	a1,(g_InsertedStringPtr).l
		cmpi.w	#$FFFF,d0
		beq.s	_gncInsertEnd
	if	~(REGION=JP)
		cmpi.w	#CHR_HYPHENATION_POINT,d0
		beq.s	_gncInsertedChar
		cmpi.w	#CHR_BREAKING_SPACE,d0
		beq.s	_gncSpace
		cmpi.w	#CHR_BREAK_POINT,d0
		beq.s	_gncInsertedChar
	endif
		rts
; ---------------------------------------------------------------------------

	if	~(REGION=JP)
_gncSpace:
		clr.w	d0
		rts
; ---------------------------------------------------------------------------
	endif

_gncInsertEnd:
		clr.l	(g_InsertedStringPtr).l
		bra.w	_gncStream

; Print character d0: negative control codes dispatch through
; HandleControlChars; anything else is drawn. CHR_BEGIN_TALK (emitted
; after a speaker name) arms talk mode: flags |= $22 (indent + talk)
; and the voice-blip counter starts. DE prints its ss char as "SS".
ProcessChar:
		tst.w	d0
	if ~((REGION=FR)!(REGION=DE))
		bpl.s	_pcGlyph
_pcControl:
		not.w	d0
		lsl.w	#$02,d0
		jmp	HandleControlChars(pc,d0.w)
	else
		bmi.w	_pcControl
	endif
; ---------------------------------------------------------------------------
_pcGlyph:
	if REGION=DE
		cmpi.b	#CHR_SS,d0
		bne.s	_pcNotSS
		move.w	#CHR_UPPERCASE_S,d0
		bsr.s	ProcessChar
		move.w	#CHR_UPPERCASE_S,d0
		bsr.s	ProcessChar
		bra.s	_pcDone
_pcNotSS:
	elseif REGION=FR
		cmpi.b	#CHR_OPEN_BRACKET,d0	; Leftover compare - result unused
	endif
		cmpi.b	#CHR_BEGIN_TALK,d0
		bne.s	_pcDraw
		andi.b	#$01,(g_TextFlags).l
		ori.b	#$22,(g_TextFlags).l
		move.b	#$01,(g_TalkBlipCounter).l
_pcDraw:
		bsr.s	_talkTick
		bsr.w	DrawTextGlyph
		bsr.s	_testInstantMode
		bcc.s	_pcDone
		bsr.w	DMACopyTextboxTiles	  ; Typewriter mode: flush every glyph

_pcDone:
		rts
; ---------------------------------------------------------------------------

; Voice blip: in talk mode (counter non-zero), count printed chars
; (spaces and periods excluded) and play g_TalkSoundEffect on every
; other pair, giving the two-on/two-off chatter rhythm.
_talkTick:
		movem.w	d0,-(sp)
		tst.b	(g_TalkBlipCounter).l
		beq.s	_ttDone
		cmpi.b	#CHR_SPACE,d0
		beq.s	_ttDone
		cmpi.b	#CHR_PERIOD,d0
		beq.s	_ttDone
		addq.b	#$01,(g_TalkBlipCounter).l
		btst	#$01,(g_TalkBlipCounter).l
		beq.s	_ttDone
		move.b	(g_TalkSoundEffect).l,d0
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_LoadFromD0
; ---------------------------------------------------------------------------

_ttDone:
		movem.w	(sp)+,d0
		rts

; Carry clear = instant mode (g_TextFlags bit 0 set), carry set =
; typewriter mode. Preserves d0.
_testInstantMode:
		btst	#$00,(g_TextFlags).l
		beq.s	_timTypewriter
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

_timTypewriter:
		ori	#$01,ccr
		rts

; ---------------------------------------------------------------------------
	if ((REGION=FR)!(REGION=DE))
_pcControl:
		not.w	d0
		lsl.w	#$02,d0
		jmp	HandleControlChars(pc,d0.w)
	endif

; Control-code dispatch (code = complemented value from ControlChars,
; 4 bytes per slot). The zero fillers execute as harmless
; "ori.b #0,d0" pairs and fall through to the next real entry.
HandleControlChars:
		bra.w	_abortPrint		; $00: abort print (unused?)
; ---------------------------------------------------------------------------
		bra.w	HandleNewLine		; $01: new line
; ---------------------------------------------------------------------------
		bra.w	PopName			; $02: repeat last name
; ---------------------------------------------------------------------------
		bra.w	HandleItemName		; $03: insert item/menu string
; ---------------------------------------------------------------------------
		bra.w	HandleWaitForInput	; $04: wait for button
; ---------------------------------------------------------------------------
		bra.w	HandleSpeakerName	; $05: insert speaker name
; ---------------------------------------------------------------------------
		bra.w	_noop6			; $06
; ---------------------------------------------------------------------------
		bra.w	_noop7			; $07
; ---------------------------------------------------------------------------
		bra.w	Handle1sPauseOrInput	; $08
; ---------------------------------------------------------------------------
		bra.w	Handle1_5sPauseOrInput	; $09
; ---------------------------------------------------------------------------
		bra.w	Handle2sPauseOrInput	; $0A
; ---------------------------------------------------------------------------
		bra.w	Handle1sPause		; $0B
; ---------------------------------------------------------------------------
		bra.w	HandleNumericVariable	; $0C: insert number
; ---------------------------------------------------------------------------
		bra.w	HandleNewLineAndPrompt	; $0D
; ---------------------------------------------------------------------------
		bra.w	InsertNewline		; $0E: newline unless at home
; ---------------------------------------------------------------------------
		bra.w	HandleContinuePrompt	; $0F: blinking down arrow
; ---------------------------------------------------------------------------
		dcb.l 5,$00000000		; $10-$14: unused, fall through
; ---------------------------------------------------------------------------
		bra.w	_noop15			; $15: no-op (down-arrow char)
; ---------------------------------------------------------------------------
		dcb.l 3,$00000000		; $16-$18: fall through to $19
; ---------------------------------------------------------------------------
		bra.w	HandleTextColour	; $19: set text colour
; ---------------------------------------------------------------------------
	if	~(REGION=JP)
		bra.w	_pcDone			; $1A: no-op
; ---------------------------------------------------------------------------
		bra.w	_printSpaceChar		; $1B: print a space
; ---------------------------------------------------------------------------
		bra.w	_pcDone			; $1C: no-op
; ---------------------------------------------------------------------------

_printSpaceChar:
		clr.w	d0
		bra.w	_pcGlyph
; ---------------------------------------------------------------------------
	endif

; Slot $00: flush (instant mode) then abandon the print by discarding
; the main-loop return address. No charset entry maps to this code
; (IDA called it HandleYesNo, but the yes/no menu is run by the
; script engine).
_abortPrint:
		bsr.w	_testInstantMode
		bcs.s	_apSkipFlush
		bsr.w	DMACopyTextboxTiles

_apSkipFlush:
		movem.l	(sp)+,d0
		rts
; ---------------------------------------------------------------------------

; Slot $02: pops a script item but reuses the last string looked up
; (a2/d7 are left over from a previous lookup) - looks like a
; leftover of the JP speaker-name handler.
PopName:
		bsr.w	PopItem
		bra.w	CopyStringToBuffer
; ---------------------------------------------------------------------------

; Slot $03: pop an id and insert that item name (< $40) or menu
; string (>= $40) into the text.
HandleItemName:
		bsr.w	PopItem
		bsr.w	LoadUncompressedString
		bra.w	CopyStringToBuffer
; ---------------------------------------------------------------------------

; Slot $05: pop a character id and insert its name. Outside JP/BETA
; the name goes on a fresh line and is followed by CHR_BEGIN_TALK
; plus a space, so talk mode arms once the name has printed (FR/DE
; also reset the cursor and restart the item list here).
HandleSpeakerName:
	if	((REGION=JP)!(REGION=US_BETA))
		bsr.w	PopItem
		bsr.w	GetChrName
		bra.w	CopyStringToBuffer
	else
		bsr.w	InsertNewline
	if ((REGION=FR)!(REGION=DE))
		clr.w	(g_TextCursorX).l
		move.l	#g_CurrentTextItem,(g_TextItemPtr).l
	endif
		bsr.w	PopItem
		bsr.w	GetChrName
		bsr.w	CopyStringToBuffer
		move.w	#CHR_BEGIN_TALK,(a1)+
		clr.w	(a1)+
		move.w	#$FFFF,(a1)+
		rts
	endif
; ---------------------------------------------------------------------------

_noop6:
		rts
; ---------------------------------------------------------------------------

_noop7:
		rts
; ---------------------------------------------------------------------------

; Slots $08-$0A: wait N frames, or until A/B/C is pressed.
; (sic - the wait loops save d2 but restore the value into d0.)
Handle1sPauseOrInput:
		move.w	#00059,d0

_pauseFrames:
		movem.w	d2,-(sp)

_pfTick:
		jsr	(j_UpdateControllerInputs).l
		move.b	(g_Controller1State).l,d1
		andi.b	#$70,d1			  ; A/B/C
		bne.s	_pauseDone
		jsr	(j_WaitUntilVBlank).l
		dbf	d0,_pfTick

_pauseDone:
		movem.w	(sp)+,d0
		rts
; ---------------------------------------------------------------------------

Handle1_5sPauseOrInput:
		move.w	#00089,d0
		bra.s	_pauseFrames
; ---------------------------------------------------------------------------

Handle2sPauseOrInput:
		move.w	#00119,d0
		bra.s	_pauseFrames
; ---------------------------------------------------------------------------

; Slot $0B: fixed 1-second pause, not skippable.
Handle1sPause:
		move.w	#00059,d0
		jmp	(j_Sleep).l
; ---------------------------------------------------------------------------

; Slot $0C: insert g_PrintNumericDwordValue as decimal. The base-10
; digits are value+1 with 0 meaning a leading blank (skipped), so the
; word chars written are the digit glyphs 1-10 = "0"-"9".
HandleNumericVariable:
		move.l	(g_PrintNumericDwordValue).l,d7
		jsr	(j_ConvertToBase10).l
		lea	(g_InsertedString).l,a1
		move.l	a1,(g_InsertedStringPtr).l
		lea	(g_Base10Digits).l,a0
		moveq	#$00000009,d1

_hnvDigit:
		clr.w	d0
		move.b	(a0)+,d0
		beq.s	_hnvNext
		move.w	d0,(a1)+

_hnvNext:
		dbf	d1,_hnvDigit
		move.w	#$FFFF,(a1)+
		rts
; ---------------------------------------------------------------------------

; Slot $04: wait for A/B/C to be released, then pressed.
HandleWaitForInput:
		movem.w	d2,-(sp)

_wfiRelease:
		jsr	(j_WaitUntilVBlank).l
		bsr.s	_readABCButtons
		bne.s	_wfiRelease

_wfiPress:
		jsr	(j_WaitUntilVBlank).l
		bsr.s	_readABCButtons
		beq.s	_wfiPress
		bra.s	_pauseDone
; ---------------------------------------------------------------------------

; Slots $0D/$0F: newline, then show the blinking down arrow until
; A/B/C is released and pressed again.
HandleNewLineAndPrompt:
		bsr.w	HandleNewLine

HandleContinuePrompt:
		bsr.w	_loadArrowGfx
		clr.b	(g_Scratch1800).l	  ; Blink timer
		movem.w	d2,-(sp)

_hcpRelease:
		jsr	(j_WaitUntilVBlank).l
		bsr.s	_updateContinueArrow
		bsr.s	_readABCButtons
		bne.s	_hcpRelease

_hcpPress:
		jsr	(j_WaitUntilVBlank).l
		bsr.s	_updateContinueArrow
		bsr.s	_readABCButtons
		beq.s	_hcpPress
		clr.w	(g_VDPSpr02_Y).l	  ; Hide the arrow
		bra.w	_pauseDone

; d1 = held A/B/C buttons (mask $70).
_readABCButtons:
		jsr	(j_UpdateControllerInputs).l
		move.b	(g_Controller1State).l,d1
		andi.b	#$70,d1
		rts

; Blink the 16x16 down-arrow sprite at the bottom right of the
; textbox: the timer advances 8/frame, visible while bit 7 is clear
; (16 frames on, 16 off).
_updateContinueArrow:
		move.w	#$0148,d0
		addq.b	#$08,(g_Scratch1800).l
		tst.b	(g_Scratch1800).l
		bpl.s	_ucaSetY
		clr.w	d0

_ucaSetY:
		move.w	d0,(g_VDPSpr02_Y).l
		move.b	#$05,(g_VDPSpr02_Size).l
		move.w	#$E524,(g_VDPSpr02_TileSource).l
		move.w	#$01A0,(g_VDPSpr02_X).l
		rts

; Slot $0E: new line, but only if the cursor is not already at the
; line-home column (g_TextFlags>>1).
InsertNewline:
		move.b	(g_TextFlags).l,d2
		lsr.b	#$01,d2
		ext.w	d2
		cmp.w	(g_TextCursorX).l,d2
		bne.w	HandleNewLine
		rts

; ---------------------------------------------------------------------------

_noop15:
		rts
; ---------------------------------------------------------------------------

; Slot $19 (also reached by $16-$18 through the zero filler): pop a
; word and set the text colour (palette index, default $0B).
HandleTextColour:
		bsr.s	PopItem
		move.b	d1,(g_TextColour).l
		rts

; d1 = the next word from the script's item list (the parameters set
; up in g_CurrentTextItem before printing).
PopItem:
		movea.l	(g_TextItemPtr).l,a1
		move.w	(a1)+,d1
		move.l	a1,(g_TextItemPtr).l
		rts

; ---------------------------------------------------------------------------

; Unreachable leftover: another copy of the length-prefixed
; string-table scanner (cf. scriptfuncs_names.asm) - skips d0
; strings at a2 and returns the next string's length-2 in d7.
_orphanScan:
		dbf	d0,_orphanSkip
		bra.s	_orphanLen
; ---------------------------------------------------------------------------

_orphanSkip:
		clr.l	d1
		move.b	(a2),d1
		adda.l	d1,a2
		bra.s	_orphanScan
; ---------------------------------------------------------------------------

_orphanLen:
		clr.l	d7
		move.b	(a2)+,d7
		subq.w	#$02,d7
		rts

; Copy the string at a2 (d7+1 bytes) into g_InsertedString as word
; chars and point GetNextChar at it. The $FFFF terminator is written
; without advancing a1, so HandleSpeakerName can append to the name.
CopyStringToBuffer:
		lea	(g_InsertedString).l,a1
		move.l	a1,(g_InsertedStringPtr).l

_csbCopy:
		clr.w	d0
		move.b	(a2)+,d0
		move.w	d0,(a1)+
		dbf	d7,_csbCopy
		move.w	#$FFFF,(a1)
		rts

; ---------------------------------------------------------------------------
; Maps each control character (offset from CHR_ARROW_PROMPT) to its
; complemented HandleControlChars code.
ControlChars:	dc.w ~$0015			  ; +$00: no-op (down-arrow prompt char)
		dc.w ~$000E			  ; +$01: newline unless at home
		dc.w ~$0001			  ; +$02: new line
		dc.w ~$000B			  ; +$03: 1s pause
		dc.w ~$000C			  ; +$04: insert number
		dc.w ~$0005			  ; +$05: speaker name
		dc.w ~$0007			  ; +$06: no-op
		dc.w ~$0006			  ; +$07: no-op
		dc.w ~$0004			  ; +$08: wait for input
		dc.w ~$0003			  ; +$09: insert item/menu string
		dc.w ~$0002			  ; +$0A: repeat last name
		dc.w ~$0018			  ; +$0B: set text colour
		dc.w ~$000F			  ; +$0C: continue prompt
		dc.w ~$000D			  ; +$0D: newline + continue prompt
		dc.w ~$0008			  ; +$0E: 1s pause or input
		dc.w ~$0009			  ; +$0F: 1.5s pause or input
		dc.w ~$000A			  ; +$10: 2s pause or input
		dc.w ~$0017			  ; +$11: set text colour
		dc.w ~$0019			  ; +$12: set text colour

; Queue the down-arrow prompt graphics (2 tiles) into VRAM $A480.
_loadArrowGfx:
		lea	DownArrowGfx(pc),a0
		lea	($0000A480).l,a1
		move.w	#$0040,d0
		jsr	(j_QueueDMAOp).l
		jsr	(j_EnableDMAQueueProcessing).l
		rts

; ---------------------------------------------------------------------------

	modend
