
; =============== S U B	R O U T	I N E =======================================


ProcessScriptWord:				  ; CODE XREF: RunTextCmd+10p
						  ; DATA XREF: ROM:00022EBCt
		movem.l	d0-d1/a0-a1,-(sp)

loc_28D68:					  ; CODE XREF: ProcessScriptWord+30j
		move.w	(a0)+,d0
		btst	#$0F,d0			  ; Bit	15 - Display text
		beq.s	loc_28D74		  ; Bit	15 not set? - run special action based off bits	10-12
						  ; Argument to	be used	is derived from	bits 0-9
		bsr.s	DisplayTextFromScriptWord
		bra.s	loc_28D86		  ; Bit	14 - Clear textbox
; ---------------------------------------------------------------------------

loc_28D74:					  ; CODE XREF: ProcessScriptWord+Aj
		move.w	d0,d1			  ; Bit	15 not set? - run special action based off bits	10-12
						  ; Argument to	be used	is derived from	bits 0-9
		andi.w	#$1C00,d1
		rol.w	#$07,d1
		lea	ActionTable(pc),a1
		adda.w	(a1,d1.w),a1
		jsr	(a1)

loc_28D86:					  ; CODE XREF: ProcessScriptWord+Ej
		btst	#$0E,d0			  ; Bit	14 - Clear textbox
		beq.s	loc_28D90		  ; Bit	13 - Don't process any more words
		bsr.w	ClearTextbox

loc_28D90:					  ; CODE XREF: ProcessScriptWord+26j
		btst	#$0D,d0			  ; Bit	13 - Don't process any more words
		beq.s	loc_28D68
		movem.l	(sp)+,d0-d1/a0-a1
		rts
; End of function ProcessScriptWord

; ---------------------------------------------------------------------------
ActionTable:	dc.w LoadItemIntoSlot0-ActionTable ; DATA XREF:	ProcessScriptWord+18t
						  ; ROM:ActionTableo ...
		dc.w LoadItemIntoSlot1-ActionTable
		dc.w LoadItemIntoSlot2-ActionTable
		dc.w LoadItemIntoSlot3-ActionTable
		dc.w GetNumericValue-ActionTable
		dc.w DoSpecialAction-ActionTable
		dc.w SwitchCharacter-ActionTable
		dc.w LoadNextCharacter-ActionTable

; =============== S U B	R O U T	I N E =======================================


DisplayTextFromScriptWord:			  ; CODE XREF: ProcessScriptWord+Cp
		move.l	d0,-(sp)
		andi.w	#$1FFF,d0
		addi.w	#SCRIPT_STRINGS_BEGIN,d0
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		move.l	(sp)+,d0
		rts
; End of function DisplayTextFromScriptWord


; =============== S U B	R O U T	I N E =======================================


LoadItemIntoSlot0:				  ; DATA XREF: ROM:ActionTableo
		movem.l	d0/a1,-(sp)
		andi.l	#$000003FF,d0		  ; 0x03FF - special value means next operand is an address
		cmpi.w	#$03FF,d0
		bne.s	loc_28DD8
		movea.l	(a0)+,a1
		move.w	(a1),(word_FF1196).l
		bra.s	loc_28DDE
; ---------------------------------------------------------------------------

loc_28DD8:					  ; CODE XREF: LoadItemIntoSlot0+Ej
		move.w	d0,(word_FF1196).l

loc_28DDE:					  ; CODE XREF: LoadItemIntoSlot0+18j
		movem.l	(sp)+,d0/a1
		rts
; End of function LoadItemIntoSlot0


; =============== S U B	R O U T	I N E =======================================


LoadItemIntoSlot1:				  ; DATA XREF: ROM:ActionTableo
		movem.l	d0/a1,-(sp)
		andi.l	#$000003FF,d0		  ; 0x03FF - special value means next operand is an address
		cmpi.w	#$03FF,d0
		bne.s	loc_28DFE
		movea.l	(a0)+,a1
		move.w	(a1),(word_FF1198).l
		bra.s	loc_28E04
; ---------------------------------------------------------------------------

loc_28DFE:					  ; CODE XREF: LoadItemIntoSlot1+Ej
		move.w	d0,(word_FF1198).l

loc_28E04:					  ; CODE XREF: LoadItemIntoSlot1+18j
		movem.l	(sp)+,d0/a1
		rts
; End of function LoadItemIntoSlot1


; =============== S U B	R O U T	I N E =======================================


LoadItemIntoSlot2:				  ; DATA XREF: ROM:ActionTableo
		movem.l	d0/a1,-(sp)
		andi.l	#$000003FF,d0		  ; 0x03FF - special value means next operand is an address
		cmpi.w	#$03FF,d0
		bne.s	loc_28E24
		movea.l	(a0)+,a1
		move.w	(a1),(word_FF119A).l
		bra.s	loc_28E2A
; ---------------------------------------------------------------------------

loc_28E24:					  ; CODE XREF: LoadItemIntoSlot2+Ej
		move.w	d0,(word_FF119A).l

loc_28E2A:					  ; CODE XREF: LoadItemIntoSlot2+18j
		movem.l	(sp)+,d0/a1
		rts
; End of function LoadItemIntoSlot2


; =============== S U B	R O U T	I N E =======================================


LoadItemIntoSlot3:				  ; DATA XREF: ROM:ActionTableo
		movem.l	d0/a1,-(sp)
		andi.l	#$000003FF,d0
		cmpi.w	#$03FF,d0		  ; 0x03FF - special value means next operand is an address
		bne.s	loc_28E4A
		movea.l	(a0)+,a1
		move.w	(a1),(word_FF119C).l
		bra.s	loc_28E50
; ---------------------------------------------------------------------------

loc_28E4A:					  ; CODE XREF: LoadItemIntoSlot3+Ej
		move.w	d0,(word_FF119C).l

loc_28E50:					  ; CODE XREF: LoadItemIntoSlot3+18j
		movem.l	(sp)+,d0/a1
		rts
; End of function LoadItemIntoSlot3


; =============== S U B	R O U T	I N E =======================================


GetNumericValue:				  ; DATA XREF: ROM:ActionTableo
		movem.l	d0/a1,-(sp)
		andi.l	#$000003FF,d0
		cmpi.w	#$03FF,d0
		bne.s	loc_28E70
		movea.l	(a0)+,a1
		move.l	(a1),(g_PrintNumericDwordValue).l
		bra.s	loc_28E76
; ---------------------------------------------------------------------------

loc_28E70:					  ; CODE XREF: GetNumericValue+Ej
		move.l	d0,(g_PrintNumericDwordValue).l

loc_28E76:					  ; CODE XREF: GetNumericValue+18j
		movem.l	(sp)+,d0/a1
		rts
; End of function GetNumericValue


; =============== S U B	R O U T	I N E =======================================


DoSpecialAction:				  ; DATA XREF: ROM:ActionTableo
		movem.l	d0/a1,-(sp)
		andi.w	#$03FF,d0
		cmpi.w	#$03FF,d0		  ; 0x03FF - special command to	load address
		bne.s	loc_28E8E
		movea.l	(a0)+,a1
		move.w	(a1),d0

loc_28E8E:					  ; CODE XREF: DoSpecialAction+Cj
		cmpi.w	#01000,d0
		bcc.s	loc_28E9A
		bsr.w	SetFlagBit
		bra.s	loc_28EAC
; ---------------------------------------------------------------------------

loc_28E9A:					  ; CODE XREF: DoSpecialAction+16j
		lea	ActionPointerList(pc),a1
		subi.w	#01000,d0
		add.w	d0,d0
		move.w	(a1,d0.w),d0
		jsr	(a1,d0.w)

loc_28EAC:					  ; CODE XREF: DoSpecialAction+1Cj
		movem.l	(sp)+,d0/a1
		rts
; End of function DoSpecialAction

; ---------------------------------------------------------------------------
ActionPointerList:dc.w ReceiveItem-ActionPointerList ; DATA XREF: DoSpecialAction:loc_28E9At
						  ; ROM:ActionPointerListo ...
		dc.w ReceiveGold-ActionPointerList
		dc.w PlayMusicTrack36-ActionPointerList
		dc.w PlayMusicTrack14-ActionPointerList
; ---------------------------------------------------------------------------

ReceiveItem:					  ; DATA XREF: ROM:ActionPointerListo
		move.l	d0,-(sp)
		bsr.w	OpenTextbox
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicChestOpen
; ---------------------------------------------------------------------------
		move.w	(word_FF1196).l,d0
		bsr.w	GetItem
		move.w	#$0013,d0		  ; Got	ITEM
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		jsr	(j_RestoreBGM).l
		move.l	(sp)+,d0
		rts
; ---------------------------------------------------------------------------

ReceiveGold:					  ; DATA XREF: ROM:00028EB4o
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

PlayMusicTrack36:				  ; DATA XREF: ROM:00028EB6o
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicHappyVillage
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

PlayMusicTrack14:				  ; DATA XREF: ROM:00028EB8o
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicHarbour
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

SwitchCharacter:				  ; DATA XREF: ROM:ActionTableo
		movem.l	d0-d1/a1,-(sp)
		andi.w	#$03FF,d0
		cmpi.w	#$03FF,d0		  ; 0x03FF - special value means next operand is an address
		bne.s	loc_28F26
		movea.l	(a0)+,a1
		move.w	(a1),d0

loc_28F26:					  ; CODE XREF: ROM:00028F20j
		move.w	d0,(word_FF1924).l
		move.w	d0,(word_FF1196).l
		cmpi.w	#01000,d0
		bcc.s	loc_28F42
		bsr.w	LoadNextCharacterFromRoomTbl
		bsr.w	GetSpeakerSfx
		bra.s	loc_28F46
; ---------------------------------------------------------------------------

loc_28F42:					  ; CODE XREF: ROM:00028F36j
		bsr.w	SetSpecialCharacter

loc_28F46:					  ; CODE XREF: ROM:00028F40j
		bsr.w	OpenTextbox
		movem.l	(sp)+,d0-d1/a1
		rts
; ---------------------------------------------------------------------------

LoadNextCharacter:				  ; DATA XREF: ROM:ActionTableo
		movem.l	d0-d1/a1,-(sp)
		andi.w	#$03FF,d0		  ; 0x03FF - special value means next operand is an address
		cmpi.w	#$03FF,d0
		bne.s	loc_28F62
		movea.l	(a0)+,a1
		move.w	(a1),d0

loc_28F62:					  ; CODE XREF: ROM:00028F5Cj
		move.w	d0,(g_Character).l
		movem.l	(sp)+,d0-d1/a1
		rts

; =============== S U B	R O U T	I N E =======================================


LoadTextboxGraphics:				  ; CODE XREF: DisplayText+4p
		movem.l	d0-a6,-(sp)
		btst	#$00,(g_RightArrowCursorState).l
		bne.s	loc_28F98
		bsr.w	j_RefreshAndClearTextbox
		jsr	(j_QueueTextboxTilemapDMA).l
		jsr	(j_FlushDMACopyQueue).l
		bsr.w	j_SetTextboxHInt
		bset	#$00,(g_RightArrowCursorState).l

loc_28F98:					  ; CODE XREF: LoadTextboxGraphics+Cj
		movem.l	(sp)+,d0-a6
		rts
; End of function LoadTextboxGraphics


; =============== S U B	R O U T	I N E =======================================


OpenTextbox:					  ; CODE XREF: ROM:00028EBCp
						  ; ROM:00028EE2p ...
		movem.l	d0-a6,-(sp)
		bsr.w	j_ReloadTextbox
		jsr	(j_QueueTextboxTilemapDMA).l
		jsr	(j_FlushDMACopyQueue).l
		movem.l	(sp)+,d0-a6
		rts
; End of function OpenTextbox


; =============== S U B	R O U T	I N E =======================================


ClearTextbox:					  ; CODE XREF: ROM:loc_24B3Ep
						  ; ROM:000250C4p ...
		movem.l	d0-a6,-(sp)
		btst	#$00,(g_RightArrowCursorState).l
		beq.s	loc_28FD2
		bsr.w	j_SetUpTextDisplay
		bclr	#$00,(g_RightArrowCursorState).l

loc_28FD2:					  ; CODE XREF: ClearTextbox+Cj
		movem.l	(sp)+,d0-a6
		rts
; End of function ClearTextbox


; =============== S U B	R O U T	I N E =======================================

; Prints the compressed	string identified by d0

DisplayText:					  ; CODE XREF: ROM:00024AEEp
						  ; ROM:00024B02p ...
		movem.l	d0-a6,-(sp)
		bsr.s	LoadTextboxGraphics
		bsr.w	j_PrintString
		movem.l	(sp)+,d0-a6
		rts
; End of function DisplayText


; =============== S U B	R O U T	I N E =======================================


GetYesNoAnswer:					  ; CODE XREF: HandleShopInterraction+14p
						  ; ROM:00024F7Cp ...
		movem.l	d0-a6,-(sp)
		clr.b	(g_YesNoPromptResult).l
		bsr.w	j_YesNoPrompt
		move	sr,-(sp)
		bcc.s	loc_29000
		st	(g_YesNoPromptResult).l

loc_29000:					  ; CODE XREF: GetYesNoAnswer+10j
		bsr.s	OpenTextbox
		move	(sp)+,ccr
		movem.l	(sp)+,d0-a6
		rts
; End of function GetYesNoAnswer

; ---------------------------------------------------------------------------

NoMoneyEffect:					  ; CODE XREF: HandleShopInterraction+2Ap
						  ; ROM:00024F92p ...
		btst	#$01,(g_RightArrowCursorState).l
		bne.s	locret_29024
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Stop
; ---------------------------------------------------------------------------
		bsr.w	sub_29CC4
		bset	#$01,(g_RightArrowCursorState).l

locret_29024:					  ; CODE XREF: ROM:00029012j
		rts

; =============== S U B	R O U T	I N E =======================================


sub_29026:					  ; CODE XREF: HandleShopInterraction+4Ap
						  ; ROM:00024F9Ap ...
		btst	#$01,(g_RightArrowCursorState).l
		beq.s	locret_29044
		bsr.w	sub_29D16
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicChestOpen
; ---------------------------------------------------------------------------
		bsr.w	RestoreBGM_1
		bclr	#$01,(g_RightArrowCursorState).l

locret_29044:					  ; CODE XREF: sub_29026+8j
		rts
; End of function sub_29026


; =============== S U B	R O U T	I N E =======================================


Sleep_0:					  ; CODE XREF: ROM:00024B0Ep
						  ; ROM:00024FA8p ...
		movem.l	d0/a0,-(sp)
		movea.l	$00000008(sp),a0	  ; Previous sp
		move.w	(a0)+,d0
		move.l	a0,$00000008(sp)
		jsr	(j_Sleep).l
		movem.l	(sp)+,d0/a0
		rts
; End of function Sleep_0

; ---------------------------------------------------------------------------

RestoreBGM_1:					  ; CODE XREF: ROM:000250EEp
						  ; ROM:00025132p ...
		move.l	d0,-(sp)
		clr.w	d0
		move.b	(g_BGM).l,d0
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_LoadFromD0
; ---------------------------------------------------------------------------
		move.l	(sp)+,d0
		rts

; =============== S U B	R O U T	I N E =======================================


UpdateEkeEke:					  ; CODE XREF: ROM:00024FC0p
						  ; ROM:00025098p ...
		movem.l	d0-a6,-(sp)
		jsr	(j_UpdateEkeEkeHUD).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		movem.l	(sp)+,d0-a6
		rts
; End of function UpdateEkeEke


; =============== S U B	R O U T	I N E =======================================


GetSpeakerSfx:					  ; CODE XREF: ROM:000251E2p
						  ; ROM:00028F3Cp
		movem.l	d0-a6,-(sp)
		clr.b	(g_TalkSoundEffect).l
		move.b	d1,d0			  ; d0 - current talker	script num
		jsr	(j_GetSpeakerSpriteId).l  ; d1 - current talker	sprite ID
		bcs.s	loc_290C2
		move.w	d1,(g_SpeakerSpriteId).l
		lea	SpriteIdToTalkSfx(pc),a0

loc_290AC:					  ; CODE XREF: GetSpeakerSfx+2Cj
		move.b	(a0)+,d0
		cmpi.b	#$FF,d0
		beq.s	loc_290C2
		cmp.b	d1,d0
		beq.s	loc_290BC
		addq.l	#$01,a0
		bra.s	loc_290AC
; ---------------------------------------------------------------------------

loc_290BC:					  ; CODE XREF: GetSpeakerSfx+28j
		move.b	(a0),(g_TalkSoundEffect).l

loc_290C2:					  ; CODE XREF: GetSpeakerSfx+12j
						  ; GetSpeakerSfx+24j
		tst.w	d0
		movem.l	(sp)+,d0-a6
		rts
; End of function GetSpeakerSfx

; ---------------------------------------------------------------------------
