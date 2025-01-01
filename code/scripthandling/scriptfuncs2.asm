
; =============== S U B	R O U T	I N E =======================================


PlayerTalk:					  ; DATA XREF: j_PlayerTalkt
		movem.l	d0-a6,-(sp)
		move.w	#$FFFF,(g_Character).l
		btst	#CTRL_DOWN,(g_Controller2State).l
		beq.s	loc_251B8
		tst.w	(DebugModeEnable).w
		bne.s	loc_251B8
		bsr.w	DebugMenu
		bra.s	loc_251CA
; ---------------------------------------------------------------------------

loc_251B8:					  ; CODE XREF: PlayerTalk+14j
						  ; PlayerTalk+1Aj
		bsr.s	loc_251D0
		bcs.s	loc_251CA
		lea	CharacterScriptTable(pc),a0
		add.w	d0,d0
		move.w	(a0,d0.w),d0
		bsr.w	RunTextCmd

loc_251CA:					  ; CODE XREF: PlayerTalk+20j
						  ; PlayerTalk+24j
		movem.l	(sp)+,d0-a6
		rts
; End of function PlayerTalk

; ---------------------------------------------------------------------------

loc_251D0:					  ; CODE XREF: sub_24A98+10p
						  ; PlayerTalk:loc_251B8p
		movem.l	d1-d2/d4/a0,-(sp)
		bsr.w	GetDialogueForRoom
		bcs.s	loc_25212
		clr.w	d1
		move.b	(g_currentSpeakerScriptID).l,d1
		bsr.w	GetSpeakerSfx
		bcs.s	loc_25212
		subq.w	#$01,d2

loc_251EA:					  ; CODE XREF: ROM:000251FEj
		move.w	(a0)+,d0
		move.w	d0,d4
		andi.w	#$7800,d4
		rol.w	#$05,d4
		andi.w	#$07FF,d0
		cmp.w	d4,d1
		blt.s	loc_25204
		sub.w	d4,d1
		dbf	d2,loc_251EA
		bra.s	loc_25218
; ---------------------------------------------------------------------------

loc_25204:					  ; CODE XREF: ROM:000251FAj
		add.w	d1,d0
		move.w	d0,(word_FF1924).l
		move.w	d0,(word_FF1196).l

loc_25212:					  ; CODE XREF: ROM:000251D8j
						  ; ROM:000251E6j ...
		movem.l	(sp)+,d1-d2/d4/a0
		rts
; ---------------------------------------------------------------------------

loc_25218:					  ; CODE XREF: ROM:00025202j
		tst.w	(DebugModeEnable).w
		bne.s	loc_25222
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $0,$0		  ; Run	text script at offset 0x0277F6
						  ; 0xE000: PRINT MSG 0x004D, MSGBOX CLEARED, END: "? ERROR 7{5E}"
; ---------------------------------------------------------------------------

loc_25222:					  ; CODE XREF: ROM:0002521Cj
		ori	#$01,ccr
		bra.s	loc_25212
; ---------------------------------------------------------------------------

LoadNextCharacterFromRoomTbl:			  ; CODE XREF: ROM:00028F38p
		movem.l	d2-d4/a0,-(sp)
		bsr.s	GetDialogueForRoom
		bcs.s	loc_2525C
		clr.w	d1
		subq.w	#$01,d2

loc_25234:					  ; CODE XREF: ROM:00025250j
		move.w	(a0)+,d3
		move.w	d3,d4
		andi.w	#$7800,d4		  ; dialogue idx
		rol.w	#$05,d4
		andi.w	#$07FF,d3		  ; character
		subq.w	#$01,d4

loc_25244:					  ; CODE XREF: ROM:0002524Cj
		cmp.w	d3,d0
		beq.s	loc_25256
		addq.w	#$01,d1
		addq.w	#$01,d3
		dbf	d4,loc_25244
		dbf	d2,loc_25234
		bra.s	loc_25262
; ---------------------------------------------------------------------------

loc_25256:					  ; CODE XREF: ROM:00025246j
		move.b	d1,(g_currentSpeakerScriptID).l

loc_2525C:					  ; CODE XREF: ROM:0002522Ej
						  ; ROM:00025270j
		movem.l	(sp)+,d2-d4/a0
		rts
; ---------------------------------------------------------------------------

loc_25262:					  ; CODE XREF: ROM:00025254j
		tst.w	(DebugModeEnable).w
		bne.s	loc_2526C
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $0,$0		  ; Run	text script at offset 0x0277F6
						  ; 0xE000: PRINT MSG 0x004D, MSGBOX CLEARED, END: "? ERROR 7{5E}"
; ---------------------------------------------------------------------------

loc_2526C:					  ; CODE XREF: ROM:00025266j
		ori	#$01,ccr
		bra.s	loc_2525C
; ---------------------------------------------------------------------------

GetDialogueForRoom:				  ; CODE XREF: ROM:000251D4p
						  ; ROM:0002522Cp
		movem.w	d0-d1,-(sp)
		move.w	(RmNum2).l,d0
		lea	RoomDialogueTable(pc),a0

loc_25280:					  ; CODE XREF: ROM:00025298j
		move.w	(a0)+,d1
		blt.s	loc_252A0
		move.w	d1,d2
		andi.w	#$7800,d2
		rol.w	#$05,d2
		andi.w	#$07FF,d1
		cmp.w	d0,d1
		beq.s	loc_2529A
		adda.w	d2,a0
		adda.w	d2,a0
		bra.s	loc_25280
; ---------------------------------------------------------------------------

loc_2529A:					  ; CODE XREF: ROM:00025292j
						  ; ROM:000252AEj
		movem.w	(sp)+,d0-d1
		rts
; ---------------------------------------------------------------------------

loc_252A0:					  ; CODE XREF: ROM:00025282j
		tst.w	(DebugModeEnable).w
		bne.s	loc_252AA
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $0,$0		  ; Run	text script at offset 0x0277F6
						  ; 0xE000: PRINT MSG 0x004D, MSGBOX CLEARED, END: "? ERROR 7{5E}"
; ---------------------------------------------------------------------------

loc_252AA:					  ; CODE XREF: ROM:000252A4j
		ori	#$01,ccr
		bra.s	loc_2529A

; =============== S U B	R O U T	I N E =======================================


HandleProgressDependentDialogue:		  ; CODE XREF: ROM:CS_0000p
						  ; ROM:CS_0001p ...
		movem.l	d0/a0-a2,-(sp)
		bsr.w	GetFlagProgress
		lea	(g_GameFlagProgress1).l,a0
		lea	(unk_FF190E).l,a1
		moveq	#$00000007,d0

loc_252C6:					  ; CODE XREF: HandleProgressDependentDialogue:loc_252D0j
		cmpm.b	(a1)+,(a0)+
		bcc.s	loc_252D0
		move.b	-$00000001(a1),-$00000001(a0)

loc_252D0:					  ; CODE XREF: HandleProgressDependentDialogue+18j
		dbf	d0,loc_252C6
		movea.l	$00000010(sp),a0	  ; Previous PC
		movea.l	a0,a1

loc_252DA:					  ; CODE XREF: HandleProgressDependentDialogue+30j
		tst.b	(a1)
		blt.s	loc_252E2		  ; Reached end	of list	of cmds?
		addq.l	#$04,a1
		bra.s	loc_252DA
; ---------------------------------------------------------------------------

loc_252E2:					  ; CODE XREF: HandleProgressDependentDialogue+2Cj
		clr.w	d0
		lea	(g_GameFlagProgress1).l,a2

loc_252EA:					  ; CODE XREF: HandleProgressDependentDialogue+4Aj
		subq.l	#$04,a1
		cmpa.l	a0,a1			  ; No match found
		bcs.s	loc_2530C
		move.b	(a1),d0
		move.b	(a2,d0.w),d0
		cmp.b	$00000001(a1),d0
		blt.s	loc_252EA
		move.w	$00000002(a1),d0
		bsr.w	RunTextCmd

loc_25304:					  ; CODE XREF: HandleProgressDependentDialogue:loc_25316j
		movem.l	(sp)+,d0/a0-a2
		addq.l	#$04,sp
		rts
; ---------------------------------------------------------------------------

loc_2530C:					  ; CODE XREF: HandleProgressDependentDialogue+3Ej
		tst.w	(DebugModeEnable).w
		bne.s	loc_25316
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $0,$0		  ; Run	text script at offset 0x0277F6
						  ; 0xE000: PRINT MSG 0x004D, MSGBOX CLEARED, END: "? ERROR 7{5E}"
; ---------------------------------------------------------------------------

loc_25316:					  ; CODE XREF: HandleProgressDependentDialogue+60j
		bra.s	loc_25304
; End of function HandleProgressDependentDialogue

