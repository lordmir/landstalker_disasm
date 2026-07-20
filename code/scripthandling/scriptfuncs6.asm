ScriptFuncs6	module
; The script-word interpreter and the textbox/session helpers.
;
; A script (reached via RunTextCmd/ScriptID) is a stream of words:
;   bit 15 set   - print string (bits 0-12) + SCRIPT_STRINGS_BEGIN
;   bit 15 clear - action in bits 12-10, argument in bits 0-9; the
;                  argument $3FF means "take the value from the
;                  address in the next longword of the stream"
;   bit 14       - clear the textbox after this word
;   bit 13       - last word of the script
; Actions 0-3 fill the four text-item slots (g_CurrentTextItem and
; g_TextItemSlot1-3) that the string engine pops in order for names;
; action 4 sets the numeric variable; 5 sets a game flag (argument
; < 1000) or runs an ActionPointerList entry (1000+); 6 switches the
; speaker; 7 stores a character id in g_Character.

ProcessScriptWord:
		movem.l	d0-d1/a0-a1,-(sp)

_pswWord:
		move.w	(a0)+,d0
		btst	#$0F,d0			  ; Bit	15 - Display text
		beq.s	_pswAction
		bsr.s	DisplayTextFromScriptWord
		bra.s	_pswFlags
; ---------------------------------------------------------------------------

_pswAction:
		move.w	d0,d1
		andi.w	#$1C00,d1		  ; Bits 12-10 - action
		rol.w	#$07,d1
		lea	ActionTable(pc),a1
		adda.w	(a1,d1.w),a1
		jsr	(a1)

_pswFlags:
		btst	#$0E,d0			  ; Bit	14 - Clear textbox
		beq.s	_pswEnd
		bsr.w	ClearTextbox

_pswEnd:
		btst	#$0D,d0			  ; Bit	13 - Don't process any more words
		beq.s	_pswWord
		movem.l	(sp)+,d0-d1/a0-a1
		rts

; ---------------------------------------------------------------------------
ActionTable:	dc.w LoadItemIntoSlot0-ActionTable
		dc.w LoadItemIntoSlot1-ActionTable
		dc.w LoadItemIntoSlot2-ActionTable
		dc.w LoadItemIntoSlot3-ActionTable
		dc.w GetNumericValue-ActionTable
		dc.w DoSpecialAction-ActionTable
		dc.w SwitchCharacter-ActionTable
		dc.w LoadNextCharacter-ActionTable

DisplayTextFromScriptWord:
		move.l	d0,-(sp)
		andi.w	#$1FFF,d0
		addi.w	#SCRIPT_STRINGS_BEGIN,d0
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		move.l	(sp)+,d0
		rts

; Actions 0-3: store the argument (or the word at the inline
; address, when the argument is $3FF) into a text-item slot.
LoadItemIntoSlot0:
		movem.l	d0/a1,-(sp)
		andi.l	#$000003FF,d0
		cmpi.w	#$03FF,d0
		bne.s	_lis0Imm
		movea.l	(a0)+,a1
		move.w	(a1),(g_CurrentTextItem).l
		bra.s	_lis0Done
; ---------------------------------------------------------------------------

_lis0Imm:
		move.w	d0,(g_CurrentTextItem).l

_lis0Done:
		movem.l	(sp)+,d0/a1
		rts

LoadItemIntoSlot1:
		movem.l	d0/a1,-(sp)
		andi.l	#$000003FF,d0
		cmpi.w	#$03FF,d0
		bne.s	_lis1Imm
		movea.l	(a0)+,a1
		move.w	(a1),(g_TextItemSlot1).l
		bra.s	_lis1Done
; ---------------------------------------------------------------------------

_lis1Imm:
		move.w	d0,(g_TextItemSlot1).l

_lis1Done:
		movem.l	(sp)+,d0/a1
		rts

LoadItemIntoSlot2:
		movem.l	d0/a1,-(sp)
		andi.l	#$000003FF,d0
		cmpi.w	#$03FF,d0
		bne.s	_lis2Imm
		movea.l	(a0)+,a1
		move.w	(a1),(g_TextItemSlot2).l
		bra.s	_lis2Done
; ---------------------------------------------------------------------------

_lis2Imm:
		move.w	d0,(g_TextItemSlot2).l

_lis2Done:
		movem.l	(sp)+,d0/a1
		rts

LoadItemIntoSlot3:
		movem.l	d0/a1,-(sp)
		andi.l	#$000003FF,d0
		cmpi.w	#$03FF,d0
		bne.s	_lis3Imm
		movea.l	(a0)+,a1
		move.w	(a1),(g_TextItemSlot3).l
		bra.s	_lis3Done
; ---------------------------------------------------------------------------

_lis3Imm:
		move.w	d0,(g_TextItemSlot3).l

_lis3Done:
		movem.l	(sp)+,d0/a1
		rts

; Action 4: set the numeric variable printed by the number control
; char (a longword when read through an inline address).
GetNumericValue:
		movem.l	d0/a1,-(sp)
		andi.l	#$000003FF,d0
		cmpi.w	#$03FF,d0
		bne.s	_gnvImm
		movea.l	(a0)+,a1
		move.l	(a1),(g_PrintNumericDwordValue).l
		bra.s	_gnvDone
; ---------------------------------------------------------------------------

_gnvImm:
		move.l	d0,(g_PrintNumericDwordValue).l

_gnvDone:
		movem.l	(sp)+,d0/a1
		rts

; Action 5: argument < 1000 sets that game flag; 1000+ runs the
; matching ActionPointerList routine.
DoSpecialAction:
		movem.l	d0/a1,-(sp)
		andi.w	#$03FF,d0
		cmpi.w	#$03FF,d0		  ; 0x03FF - special command to	load address
		bne.s	_dsaResolve
		movea.l	(a0)+,a1
		move.w	(a1),d0

_dsaResolve:
		cmpi.w	#01000,d0
		bcc.s	_dsaAction
		bsr.w	SetFlagBit
		bra.s	_dsaDone
; ---------------------------------------------------------------------------

_dsaAction:
		lea	ActionPointerList(pc),a1
		subi.w	#01000,d0
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		jsr	(a1,d0.w)

_dsaDone:
		movem.l	(sp)+,d0/a1
		rts

; ---------------------------------------------------------------------------
ActionPointerList:dc.w ReceiveItem-ActionPointerList	; 1000
		dc.w ReceiveGold-ActionPointerList	; 1001
		dc.w PlayMusicTrack36-ActionPointerList	; 1002
		dc.w PlayMusicTrack14-ActionPointerList	; 1003
; ---------------------------------------------------------------------------

; Special action 1000: give the item in text slot 0 with the chest
; jingle and the "Got ITEM" message, then restore the room music.
ReceiveItem:
		move.l	d0,-(sp)
		bsr.w	OpenTextbox
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicChestOpen
; ---------------------------------------------------------------------------
		move.w	(g_CurrentTextItem).l,d0
		bsr.w	GetItem
	if ((REGION=FR)!(REGION=DE))
		moveq	#2,d0
		bsr.w	GetItemFoundString
	else
		move.w	#$0013,d0		  ; Got	ITEM
	endif
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		jsr	(j_RestoreBGM).l
		move.l	(sp)+,d0
		rts
; ---------------------------------------------------------------------------

; Special action 1001: add the numeric variable to the gold count
; with the chest jingle and the "Got X golds" message.
ReceiveGold:
		move.l	d0,-(sp)
		bsr.w	OpenTextbox
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicChestOpen
; ---------------------------------------------------------------------------
		move.l	(g_PrintNumericDwordValue).l,d0
		jsr	(j_AddGold).l
		move.w	#$0015,d0		  ; Got	X golds
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		jsr	(j_RestoreBGM).l
		move.l	(sp)+,d0
		rts
; ---------------------------------------------------------------------------

PlayMusicTrack36:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicHappyVillage
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

PlayMusicTrack14:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicHarbour
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

; Action 6: switch the speaker to the argument character: ids below
; 1000 are room characters (slot lookup + voice sfx), 1000+ are the
; special characters (SetSpecialCharacter). Reopens the textbox.
SwitchCharacter:
		movem.l	d0-d1/a1,-(sp)
		andi.w	#$03FF,d0
		cmpi.w	#$03FF,d0		  ; 0x03FF - special value means next operand is an address
		bne.s	_swcSet
		movea.l	(a0)+,a1
		move.w	(a1),d0

_swcSet:
		move.w	d0,(g_SpeakerCharId).l
		move.w	d0,(g_CurrentTextItem).l
		cmpi.w	#01000,d0
		bcc.s	_swcSpecial
		bsr.w	LoadNextCharacterFromRoomTbl
		bsr.w	GetSpeakerSfx
		bra.s	_swcOpen
; ---------------------------------------------------------------------------

_swcSpecial:
		bsr.w	SetSpecialCharacter

_swcOpen:
		bsr.w	OpenTextbox
		movem.l	(sp)+,d0-d1/a1
		rts
; ---------------------------------------------------------------------------

; Action 7: store a character id in g_Character (reset to $FFFF by
; PlayerTalk).
LoadNextCharacter:
		movem.l	d0-d1/a1,-(sp)
		andi.w	#$03FF,d0		  ; 0x03FF - special value means next operand is an address
		cmpi.w	#$03FF,d0
		bne.s	_ldcSet
		movea.l	(a0)+,a1
		move.w	(a1),d0

_ldcSet:
		move.w	d0,(g_Character).l
		movem.l	(sp)+,d0-d1/a1
		rts

; Bring the textbox up if it isn't already (g_TextboxState bit 0):
; redraw it empty, DMA its tilemap and point the raster split at it.
LoadTextboxGraphics:
		movem.l	d0-a6,-(sp)
		btst	#$00,(g_TextboxState).l
		bne.s	_ltgDone
		bsr.w	j_RefreshAndClearTextbox
		jsr	(j_QueueTextboxTilemapDMA).l
		jsr	(j_FlushDMACopyQueue).l
		bsr.w	j_SetTextboxHInt
		bset	#$00,(g_TextboxState).l

_ltgDone:
		movem.l	(sp)+,d0-a6
		rts

; Reset the textbox to empty and re-DMA it (it stays open).
OpenTextbox:
		movem.l	d0-a6,-(sp)
		bsr.w	j_ReloadTextbox
		jsr	(j_QueueTextboxTilemapDMA).l
		jsr	(j_FlushDMACopyQueue).l
		movem.l	(sp)+,d0-a6
		rts

; Take the textbox down again (if bit 0 says it is up).
ClearTextbox:
		movem.l	d0-a6,-(sp)
		btst	#$00,(g_TextboxState).l
		beq.s	_ctbDone
		bsr.w	j_SetUpTextDisplay
		bclr	#$00,(g_TextboxState).l

_ctbDone:
		movem.l	(sp)+,d0-a6
		rts

; Prints the compressed	string identified by d0
DisplayText:
		movem.l	d0-a6,-(sp)
		bsr.s	LoadTextboxGraphics
		bsr.w	j_PrintString
		movem.l	(sp)+,d0-a6
		rts

; Run the yes/no prompt and reset the textbox afterwards, keeping
; the answer in the carry flag (set = Yes) and latched in
; g_YesNoPromptResult ($FF = Yes).
GetYesNoAnswer:
		movem.l	d0-a6,-(sp)
		clr.b	(g_YesNoPromptResult).l
		bsr.w	j_YesNoPrompt
		move	sr,-(sp)
		bcc.s	_gynaClose
		st	(g_YesNoPromptResult).l

_gynaClose:
		bsr.s	OpenTextbox
		move	(sp)+,ccr
		movem.l	(sp)+,d0-a6
		rts

; Shop "can't afford it" effect: stop the music and start the
; visual effect (script_visualfx), latched by g_TextboxState bit 1.
NoMoneyEffect:
		btst	#$01,(g_TextboxState).l
		bne.s	_nmeDone
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Stop
; ---------------------------------------------------------------------------
		bsr.w	NoMoneyDarken
		bset	#$01,(g_TextboxState).l

_nmeDone:
		rts

; Undo the no-money effect and restart the room music.
RestoreFromNoMoneyEffect:
		btst	#$01,(g_TextboxState).l
		beq.s	_rnmDone
		bsr.w	NoMoneyBrighten
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicChestOpen
; ---------------------------------------------------------------------------
		bsr.w	RestartBGM
		bclr	#$01,(g_TextboxState).l

_rnmDone:
		rts

; Script helper: sleep for the number of frames in the inline word
; after the bsr (the return address is advanced past it).
ScriptSleep:
		movem.l	d0/a0,-(sp)
		movea.l	$00000008(sp),a0	  ; Return address = inline word
		move.w	(a0)+,d0
		move.l	a0,$00000008(sp)
		jsr	(j_Sleep).l
		movem.l	(sp)+,d0/a0
		rts

; Restart the room's music track (g_BGM) from the beginning.
RestartBGM:
		move.l	d0,-(sp)
		clr.w	d0
		move.b	(g_BGM).l,d0
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_LoadFromD0
; ---------------------------------------------------------------------------
		move.l	(sp)+,d0
		rts

; Redraw the HUD after a script changed the EkeEke count.
UpdateEkeEke:
		movem.l	d0-a6,-(sp)
		jsr	(j_UpdateEkeEkeHUD).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		movem.l	(sp)+,d0-a6
		rts

; Set the voice blip for speaker slot d1: look up the speaker's
; sprite and find it in SpriteIdToTalkSfx ({sprite, sfx} byte pairs,
; $FF-terminated); no match leaves the blip silent. The closing tst
; always clears carry, so callers' error branches never take.
GetSpeakerSfx:
		movem.l	d0-a6,-(sp)
		clr.b	(g_TalkSoundEffect).l
		move.b	d1,d0			  ; d0 - current talker	script num
		jsr	(j_GetSpeakerSpriteId).l  ; d1 - current talker	sprite ID
		bcs.s	_gssDone
		move.w	d1,(g_SpeakerSpriteId).l
		lea	SpriteIdToTalkSfx(pc),a0

_gssScan:
		move.b	(a0)+,d0
		cmpi.b	#$FF,d0
		beq.s	_gssDone
		cmp.b	d1,d0
		beq.s	_gssFound
		addq.l	#$01,a0
		bra.s	_gssScan
; ---------------------------------------------------------------------------

_gssFound:
		move.b	(a0),(g_TalkSoundEffect).l

_gssDone:
		tst.w	d0
		movem.l	(sp)+,d0-a6
		rts

	modend
