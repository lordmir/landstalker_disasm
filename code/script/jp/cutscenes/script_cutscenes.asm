; ---------------------------------------------------------------------------

XS_001B:
		move.w	#$21,d0	; '!'
		bsr.w	TestFlagBit
		bne.s	XS_001B_1
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $549,$0	; Prompt:	Run text script	at offset 0x02914E
					; 0x1BE9: LOAD SPECIAL CHARACTER 0x01
					; 0xA4B3: PRINT	MSG 0x0500, END
		ScriptID    $54B,$1	; Answer 'yes': Run text script at offset 0x029152
					; 0xE4B4: PRINT	MSG 0x0501, MSGBOX CLEARED, END
		ScriptID    $54C,$2	; Answer 'no':  Run text script at offset 0x029154
					; 0xE4B5: PRINT	MSG 0x0502, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	XS_001B_2
; ---------------------------------------------------------------------------

XS_001B_1:				; CODE XREF: ROM:00028226j
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $54D,$0	; Prompt:	Run text script	at offset 0x029156
					; 0x1BE9: LOAD SPECIAL CHARACTER 0x01
					; 0xA4B6: PRINT	MSG 0x0503, END
		ScriptID    $54F,$1	; Answer 'yes': Run text script at offset 0x02915A
					; 0xE4B7: PRINT	MSG 0x0504, MSGBOX CLEARED, END
		ScriptID    $550,$2	; Answer 'no':  Run text script at offset 0x02915C
					; 0xE4B8: PRINT	MSG 0x0505, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

XS_001B_2:				; CODE XREF: ROM:00028232j
		rts
; ---------------------------------------------------------------------------

XS_001C:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $551,$0	; Prompt:	Run text script	at offset 0x02915E
					; 0x1BE9: LOAD SPECIAL CHARACTER 0x01
					; 0xA4B9: PRINT	MSG 0x0506, END
		ScriptID    $553,$1	; Answer 'yes': Run text script at offset 0x029162
					; 0xE4BA: PRINT	MSG 0x0507, MSGBOX CLEARED, END
		ScriptID    $554,$2	; Answer 'no':  Run text script at offset 0x029164
					; 0xE4BB: PRINT	MSG 0x0508, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_002A:
		trap	#0
; ---------------------------------------------------------------------------
		dc.w $65
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $595,$0	; Run text script at offset 0x0291E6
					; 0x0027: LOAD 0x0027 INTO 0xFF1196
					; 0x84DC: PRINT	MSG 0x0529
					; 0x182D: LOAD CHARACTER SCRIPT	0x002D
					; 0xE4DD: PRINT	MSG 0x052A, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_002E:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5A5,$0	; Run text script at offset 0x029206
					; 0x181D: LOAD CHARACTER SCRIPT	0x001D
					; 0x84E5: PRINT	MSG 0x0532
					; 0xA4E6: PRINT	MSG 0x0533, END
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		rts
; ---------------------------------------------------------------------------

XS_0036:
		move.w	#$23,d0	; '#'
		bsr.w	TestFlagBit
		bne.s	XS_0036_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $21F,$0	; Run text script at offset 0x028AFA
					; 0x18A9: LOAD CHARACTER SCRIPT	0x00A9
					; 0xE1EF: PRINT	MSG 0x023C, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $223,$0	; Run text script at offset 0x028B02
					; 0x18AA: LOAD CHARACTER SCRIPT	0x00AA
					; 0xE1F2: PRINT	MSG 0x023F, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	XS_0036_6
; ---------------------------------------------------------------------------

XS_0036_1:				; CODE XREF: ROM:00028268j
		move.l	d0,-(sp)
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5B8,$0	; Run text script at offset 0x02922C
					; 0x18A9: LOAD CHARACTER SCRIPT	0x00A9
					; 0x84EF: PRINT	MSG 0x053C
					; 0x84F0: PRINT	MSG 0x053D
					; 0x84F1: PRINT	MSG 0x053E
					; 0x10C8: LOAD 200 INTO	NUMERIC	VARIABLE
					; 0xA4F2: PRINT	MSG 0x053F, END
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0036_4
		move.l	(g_PrintNumericDwordValue).l,d0
		jsr	(j_RemoveGold).l
		bcc.s	XS_0036_2
		jsr	(j_GetGold).l
		jsr	(j_RemoveGold).l
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5C0,$0	; Run text script at offset 0x02923C
					; 0xE4F5: PRINT	MSG 0x0542, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	XS_0036_3
; ---------------------------------------------------------------------------

XS_0036_2:				; CODE XREF: ROM:0002828Cj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5BE,$0	; Run text script at offset 0x029238
					; 0x84F3: PRINT	MSG 0x0540
					; 0xE4F4: PRINT	MSG 0x0541, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

XS_0036_3:				; CODE XREF: ROM:0002829Ej
		bra.s	XS_0036_5
; ---------------------------------------------------------------------------

XS_0036_4:				; CODE XREF: ROM:0002827Ej
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5C1,$0	; Run text script at offset 0x02923E
					; 0xE4F6: PRINT	MSG 0x0543, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

XS_0036_5:				; CODE XREF: ROM:XS_0036_3j
		move.l	(sp)+,d0

XS_0036_6:				; CODE XREF: ROM:00028272j
		rts
; ---------------------------------------------------------------------------

XS_0037:
		move.l	d0,-(sp)
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5C2,$0	; Run text script at offset 0x029240
					; 0x1BF6: LOAD SPECIAL CHARACTER 0x0E
					; 0x84F7: PRINT	MSG 0x0544
					; 0xA4F8: PRINT	MSG 0x0545, END
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0037_5
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5C5,$0	; Run text script at offset 0x029246
					; 0x1014: LOAD 20 INTO NUMERIC VARIABLE
					; 0xA4F9: PRINT	MSG 0x0546, END
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0037_5
		move.l	(g_PrintNumericDwordValue).l,d0
		jsr	(j_RemoveGold).l
		bcc.s	XS_0037_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5C7,$0	; Run text script at offset 0x02924A
					; 0xE4FA: PRINT	MSG 0x0547, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	XS_0037_4
; ---------------------------------------------------------------------------

XS_0037_1:				; CODE XREF: ROM:000282D0j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5C9,$0	; Run text script at offset 0x02924E
					; 0xA4FC: PRINT	MSG 0x0549, END
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0037_2
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5CA,$0	; Run text script at offset 0x029250
					; 0x84FD: PRINT	MSG 0x054A
					; 0x84FE: PRINT	MSG 0x054B
					; 0x84FF: PRINT	MSG 0x054C
					; 0xE500: PRINT	MSG 0x054D, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	XS_0037_3
; ---------------------------------------------------------------------------

XS_0037_2:				; CODE XREF: ROM:000282E6j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5CE,$0	; Run text script at offset 0x029258
					; 0xE501: PRINT	MSG 0x054E, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

XS_0037_3:				; CODE XREF: ROM:000282ECj
		st	(g_YesNoPromptResult).l

XS_0037_4:				; CODE XREF: ROM:000282DCj
					; ROM:00028300j
		move.l	(sp)+,d0
		rts
; ---------------------------------------------------------------------------

XS_0037_5:				; CODE XREF: ROM:000282B8j
					; ROM:000282C2j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5C8,$0	; Run text script at offset 0x02924C
					; 0xE4FB: PRINT	MSG 0x0548, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	XS_0037_4
; ---------------------------------------------------------------------------

XS_0038:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $5CF,$0	; Prompt:	Run text script	at offset 0x02925A
					; 0x1BF6: LOAD SPECIAL CHARACTER 0x0E
					; 0x8502: PRINT	MSG 0x054F
					; 0x1019: LOAD 25 INTO NUMERIC VARIABLE
					; 0xA503: PRINT	MSG 0x0550, END
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x029D50
		ScriptID    $5D3,$2	; Answer 'no':  Run text script at offset 0x029262
					; 0x8504: PRINT	MSG 0x0551
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER 0x0E
					; 0xE505: PRINT	MSG 0x0552, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0039:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $5D7,$0	; Prompt:	Run text script	at offset 0x02926A
					; 0x1BF6: LOAD SPECIAL CHARACTER 0x0E
					; 0x8506: PRINT	MSG 0x0553
					; 0x1032: LOAD 50 INTO NUMERIC VARIABLE
					; 0xA507: PRINT	MSG 0x0554, END
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x029D50
		ScriptID    $5D3,$2	; Answer 'no':  Run text script at offset 0x029262
					; 0x8504: PRINT	MSG 0x0551
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER 0x0E
					; 0xE505: PRINT	MSG 0x0552, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003A:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $5DB,$0	; Prompt:	Run text script	at offset 0x029272
					; 0x1BF6: LOAD SPECIAL CHARACTER 0x0E
					; 0x8508: PRINT	MSG 0x0555
					; 0x1064: LOAD 100 INTO	NUMERIC	VARIABLE
					; 0xA509: PRINT	MSG 0x0556, END
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x029D50
		ScriptID    $5D3,$2	; Answer 'no':  Run text script at offset 0x029262
					; 0x8504: PRINT	MSG 0x0551
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER 0x0E
					; 0xE505: PRINT	MSG 0x0552, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003B:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $5DF,$0	; Prompt:	Run text script	at offset 0x02927A
					; 0x1BF6: LOAD SPECIAL CHARACTER 0x0E
					; 0x850A: PRINT	MSG 0x0557
					; 0x10C8: LOAD 200 INTO	NUMERIC	VARIABLE
					; 0xA50B: PRINT	MSG 0x0558, END
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x029D50
		ScriptID    $5D3,$2	; Answer 'no':  Run text script at offset 0x029262
					; 0x8504: PRINT	MSG 0x0551
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER 0x0E
					; 0xE505: PRINT	MSG 0x0552, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003C:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $5E3,$0	; Prompt:	Run text script	at offset 0x029282
					; 0x1BF6: LOAD SPECIAL CHARACTER 0x0E
					; 0x850C: PRINT	MSG 0x0559
					; 0x1190: LOAD 400 INTO	NUMERIC	VARIABLE
					; 0xA50D: PRINT	MSG 0x055A, END
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x029D50
		ScriptID    $5D3,$2	; Answer 'no':  Run text script at offset 0x029262
					; 0x8504: PRINT	MSG 0x0551
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER 0x0E
					; 0xE505: PRINT	MSG 0x0552, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003F:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5F3,$0	; Run text script at offset 0x0292A2
					; 0x181B: LOAD CHARACTER SCRIPT	0x001B
					; 0x8513: PRINT	MSG 0x0560
					; 0x1032: LOAD 50 INTO NUMERIC VARIABLE
					; 0xA514: PRINT	MSG 0x0561, END
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	XS_003F_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5FA,$0	; Run text script at offset 0x0292B0
					; 0xE517: PRINT	MSG 0x0564, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	XS_003F_5
; ---------------------------------------------------------------------------

XS_003F_1:				; CODE XREF: ROM:00028346j
		move.l	(g_PrintNumericDwordValue).l,d0
		jsr	(j_RemoveGold).l
		bcc.s	XS_003F_2
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5F9,$0	; Run text script at offset 0x0292AE
					; 0xE516: PRINT	MSG 0x0563, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	XS_003F_5
; ---------------------------------------------------------------------------

XS_003F_2:				; CODE XREF: ROM:0002835Aj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5F7,$0	; Run text script at offset 0x0292AA
					; 0x181B: LOAD CHARACTER SCRIPT	0x001B
					; 0xA515: PRINT	MSG 0x0562, END
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_003F_3
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5FB,$0	; Run text script at offset 0x0292B2
					; 0x8518: PRINT	MSG 0x0565
					; 0x8519: PRINT	MSG 0x0566
					; 0xE51A: PRINT	MSG 0x0567, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	XS_003F_4
; ---------------------------------------------------------------------------

XS_003F_3:				; CODE XREF: ROM:00028370j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5FE,$0	; Run text script at offset 0x0292B8
					; 0xE51B: PRINT	MSG 0x0568, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

XS_003F_4:				; CODE XREF: ROM:00028376j
		st	(g_YesNoPromptResult).l

XS_003F_5:				; CODE XREF: ROM:0002834Cj
					; ROM:00028366j
		rts
; ---------------------------------------------------------------------------

XS_0042:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $606,$0	; Run text script at offset 0x0292C8
					; 0x18CF: LOAD CHARACTER SCRIPT	0x00CF
					; 0x8520: PRINT	MSG 0x056D
					; 0xA521: PRINT	MSG 0x056E, END
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0042_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $609,$0	; Run text script at offset 0x0292CE
					; 0x18CF: LOAD CHARACTER SCRIPT	0x00CF
					; 0x8522: PRINT	MSG 0x056F
					; 0xE523: PRINT	MSG 0x0570, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	XS_0042_2
; ---------------------------------------------------------------------------

XS_0042_1:				; CODE XREF: ROM:0002838Cj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $60C,$0	; Run text script at offset 0x0292D4
					; 0x18CF: LOAD CHARACTER SCRIPT	0x00CF
					; 0xE524: PRINT	MSG 0x0571, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

XS_0042_2:				; CODE XREF: ROM:00028392j
		rts
; ---------------------------------------------------------------------------

XS_0043:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $60E,$0	; Run text script at offset 0x0292D8
					; 0x140F: SET BIT 7 OF FLAG 0x001
					; 0x18CF: LOAD CHARACTER SCRIPT	0x00CF
					; 0x8525: PRINT	MSG 0x0572
					; 0x1001: LOAD 1 INTO NUMERIC VARIABLE
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x18CF: LOAD CHARACTER SCRIPT	0x00CF
					; 0xE526: PRINT	MSG 0x0573, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0046:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $621,$0	; Run text script at offset 0x0292FE
					; 0x181E: LOAD CHARACTER SCRIPT	0x001E
					; 0xA52E: PRINT	MSG 0x057B, END
; ---------------------------------------------------------------------------
		trap	#0
; ---------------------------------------------------------------------------
		dc.w 5
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $623,$0	; Run text script at offset 0x029302
					; 0x181E: LOAD CHARACTER SCRIPT	0x001E
					; 0x10FA: LOAD 250 INTO	NUMERIC	VARIABLE
					; 0xA52F: PRINT	MSG 0x057C, END
; ---------------------------------------------------------------------------
		jsr	(j_RestoreBGM).l
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $626,$0	; Run text script at offset 0x029308
					; 0x181E: LOAD CHARACTER SCRIPT	0x001E
					; 0x8530: PRINT	MSG 0x057D
					; 0x18E8: LOAD CHARACTER SCRIPT	0x00E8
					; 0xE531: PRINT	MSG 0x057E, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0048:
		moveq	#$F,d0
		bsr.w	TestPlayerStatus
		beq.s	XS_0048_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $633,$0	; Run text script at offset 0x029322
					; 0x1813: LOAD CHARACTER SCRIPT	0x0013
					; 0xE537: PRINT	MSG 0x0584, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	XS_0048_2
; ---------------------------------------------------------------------------

XS_0048_1:				; CODE XREF: ROM:000283BEj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $62C,$0	; Run text script at offset 0x029314
					; 0x141C: SET BIT 4 OF FLAG 0x003
					; 0x1813: LOAD CHARACTER SCRIPT	0x0013
					; 0x8533: PRINT	MSG 0x0580
					; 0xE534: PRINT	MSG 0x0581, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		st	(g_YesNoPromptResult).l

XS_0048_2:				; CODE XREF: ROM:000283CAj
		rts
; ---------------------------------------------------------------------------

XS_005D:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $DB		; Bit 3	of flag	0x01B
		ScriptID    $67F,$1	; Flag set:   Run text script at offset	0x0293BA
					; 0x1493: SET BIT 3 OF FLAG 0x012
					; 0x8568: PRINT	MSG 0x05B5
					; 0x8569: PRINT	MSG 0x05B6
					; 0xE56A: PRINT	MSG 0x05B7, MSGBOX CLEARED, END
		ScriptID    $67E,$2	; Flag clear: Run text script at offset	0x0293B8
					; 0xE567: PRINT	MSG 0x05B4, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_005E:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $683,$0	; Prompt:	Run text script	at offset 0x0293C2
					; 0x182D: LOAD CHARACTER SCRIPT	0x002D
					; 0x856B: PRINT	MSG 0x05B8
					; 0xA56C: PRINT	MSG 0x05B9, END
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x029D50
		ScriptID    $68D,$2	; Answer 'no':  Run text script at offset 0x0293D6
					; 0x182D: LOAD CHARACTER SCRIPT	0x002D
					; 0x8571: PRINT	MSG 0x05BE
					; 0xE572: PRINT	MSG 0x05BF, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0064:				; CODE XREF: ROM:000283F8j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $694,$0	; Run text script at offset 0x0293E4
					; 0x1BF1: LOAD SPECIAL CHARACTER 0x09
					; 0x8575: PRINT	MSG 0x05C2
					; 0x8576: PRINT	MSG 0x05C3
					; 0x8577: PRINT	MSG 0x05C4
					; 0x8578: PRINT	MSG 0x05C5
					; 0x8579: PRINT	MSG 0x05C6
					; 0x857A: PRINT	MSG 0x05C7
					; 0x857B: PRINT	MSG 0x05C8
					; 0x857C: PRINT	MSG 0x05C9
					; 0xA57D: PRINT	MSG 0x05CA, END
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	XS_0064
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $69E,$0	; Run text script at offset 0x0293F8
					; 0x1BF1: LOAD SPECIAL CHARACTER 0x09
					; 0x857E: PRINT	MSG 0x05CB
					; 0x857F: PRINT	MSG 0x05CC
					; 0x8580: PRINT	MSG 0x05CD
					; 0x8581: PRINT	MSG 0x05CE
					; 0xE582: PRINT	MSG 0x05CF, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0069:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $6B4,$0	; Prompt:	Run text script	at offset 0x029424
					; 0x1BE9: LOAD SPECIAL CHARACTER 0x01
					; 0xA58D: PRINT	MSG 0x05DA, END
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x029D50
		ScriptID    $6B6,$2	; Answer 'no':  Run text script at offset 0x029428
					; 0x1BE9: LOAD SPECIAL CHARACTER 0x01
					; 0xE58E: PRINT	MSG 0x05DB, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0073:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $6D5,$0	; Run text script at offset 0x029466
					; 0x1064: LOAD 100 INTO	NUMERIC	VARIABLE
					; 0x18F3: LOAD CHARACTER SCRIPT	0x00F3
					; 0xA5A0: PRINT	MSG 0x05ED, END
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0073_1
		move.l	(g_PrintNumericDwordValue).l,d0
		jsr	(j_RemoveGold).l
		bcs.s	XS_0073_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $6D9,$0	; Run text script at offset 0x02946E
					; 0x14D2: SET BIT 2 OF FLAG 0x01A
					; 0xE5A2: PRINT	MSG 0x05EF, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		st	(g_YesNoPromptResult).l

XS_0073_2:				; CODE XREF: ROM:0002843Aj
		rts
; ---------------------------------------------------------------------------

XS_0073_1:				; CODE XREF: ROM:00028414j
					; ROM:00028422j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $6D8,$0	; Run text script at offset 0x02946C
					; 0xE5A1: PRINT	MSG 0x05EE, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	XS_0073_2
; ---------------------------------------------------------------------------

XS_0075:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $153		; Bit 3	of flag	0x02A
		ScriptID    $6DE,$1	; Flag set:   Run text script at offset	0x029478
					; 0x18F0: LOAD CHARACTER SCRIPT	0x00F0
					; 0xA5A4: PRINT	MSG 0x05F1, END
		ScriptID    $6E0,$2	; Flag clear: Run text script at offset	0x02947C
					; 0x18F0: LOAD CHARACTER SCRIPT	0x00F0
					; 0xA5A5: PRINT	MSG 0x05F2, END
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $6E2,$0	; Run text script at offset 0x029480
					; 0xE5A6: PRINT	MSG 0x05F3, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0076:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $6E3,$0	; Prompt:	Run text script	at offset 0x029482
					; 0x1BEF: LOAD SPECIAL CHARACTER 0x07
					; 0x85A7: PRINT	MSG 0x05F4
					; 0xA5A8: PRINT	MSG 0x05F5, END
		ScriptID    $6E6,$1	; Answer 'yes': Run text script at offset 0x029488
					; 0x1BEF: LOAD SPECIAL CHARACTER 0x07
					; 0x85A9: PRINT	MSG 0x05F6
					; 0x85AA: PRINT	MSG 0x05F7
					; 0x85AB: PRINT	MSG 0x05F8
					; 0xE5AC: PRINT	MSG 0x05F9, MSGBOX CLEARED, END
		ScriptID    $6EB,$2	; Answer 'no':  Run text script at offset 0x029492
					; 0x1BEF: LOAD SPECIAL CHARACTER 0x07
					; 0xE5AD: PRINT	MSG 0x05FA, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0077:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $6ED,$0	; Prompt:	Run text script	at offset 0x029496
					; 0x1BEF: LOAD SPECIAL CHARACTER 0x07
					; 0x85AE: PRINT	MSG 0x05FB
					; 0xA5AF: PRINT	MSG 0x05FC, END
		ScriptID    $6F1,$1	; Answer 'yes': Run text script at offset 0x02949E
					; 0xE5B1: PRINT	MSG 0x05FE, MSGBOX CLEARED, END
		ScriptID    $6F0,$2	; Answer 'no':  Run text script at offset 0x02949C
					; 0xE5B0: PRINT	MSG 0x05FD, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0079:
		move.w	#$1F,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	XS_0079_1
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $6F3,$0	; Prompt:	Run text script	at offset 0x0294A2
					; 0x1BEF: LOAD SPECIAL CHARACTER 0x07
					; 0x85B3: PRINT	MSG 0x0600
					; 0xA5B4: PRINT	MSG 0x0601, END
		ScriptID    $6F7,$1	; Answer 'yes': Run text script at offset 0x0294AA
					; 0xE5B6: PRINT	MSG 0x0603, MSGBOX CLEARED, END
		ScriptID    $6F6,$2	; Answer 'no':  Run text script at offset 0x0294A8
					; 0xE5B5: PRINT	MSG 0x0602, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	XS_0079_2
; ---------------------------------------------------------------------------

XS_0079_1:				; CODE XREF: ROM:0002846Cj
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $6F9,$0	; Prompt:	Run text script	at offset 0x0294AE
					; 0x1BEF: LOAD SPECIAL CHARACTER 0x07
					; 0x85B8: PRINT	MSG 0x0605
					; 0xA5B9: PRINT	MSG 0x0606, END
		ScriptID    $6FD,$1	; Answer 'yes': Run text script at offset 0x0294B6
					; 0xE5BB: PRINT	MSG 0x0608, MSGBOX CLEARED, END
		ScriptID    $6FC,$2	; Answer 'no':  Run text script at offset 0x0294B4
					; 0xE5BA: PRINT	MSG 0x0607, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

XS_0079_2:				; CODE XREF: ROM:00028478j
		rts
; ---------------------------------------------------------------------------

XS_007A:
		move.w	#$1F,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	XS_007A_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $6F8,$0	; Run text script at offset 0x0294AC
					; 0xE5B7: PRINT	MSG 0x0604, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	XS_007A_2
; ---------------------------------------------------------------------------

XS_007A_1:				; CODE XREF: ROM:0002848Ej
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $6FE,$0	; Run text script at offset 0x0294B8
					; 0xE5BC: PRINT	MSG 0x0609, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

XS_007A_2:				; CODE XREF: ROM:00028494j
		rts
; ---------------------------------------------------------------------------

XS_007D:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $702,$0	; Prompt:	Run text script	at offset 0x0294C0
					; 0x1833: LOAD CHARACTER SCRIPT	0x0033
					; 0xA5BF: PRINT	MSG 0x060C, END
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x029D50
		ScriptID    $704,$2	; Answer 'no':  Run text script at offset 0x0294C4
					; 0x1833: LOAD CHARACTER SCRIPT	0x0033
					; 0xE5C0: PRINT	MSG 0x060D, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_007E:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $706,$0	; Prompt:	Run text script	at offset 0x0294C8
					; 0x1833: LOAD CHARACTER SCRIPT	0x0033
					; 0xA5C1: PRINT	MSG 0x060E, END
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x029D50
		ScriptID    $708,$2	; Answer 'no':  Run text script at offset 0x0294CC
					; 0x1833: LOAD CHARACTER SCRIPT	0x0033
					; 0xE5C2: PRINT	MSG 0x060F, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_007F:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $70A,$0	; Prompt:	Run text script	at offset 0x0294D0
					; 0x1833: LOAD CHARACTER SCRIPT	0x0033
					; 0xA5C3: PRINT	MSG 0x0610, END
		ScriptID    $70C,$1	; Answer 'yes': Run text script at offset 0x0294D4
					; 0x1833: LOAD CHARACTER SCRIPT	0x0033
					; 0xE5C4: PRINT	MSG 0x0611, MSGBOX CLEARED, END
		ScriptID    $70E,$2	; Answer 'no':  Run text script at offset 0x0294D8
					; 0x1833: LOAD CHARACTER SCRIPT	0x0033
					; 0xE5C5: PRINT	MSG 0x0612, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0089:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $737,$0	; Run text script at offset 0x02952A
					; 0x1833: LOAD CHARACTER SCRIPT	0x0033
					; 0xA5DC: PRINT	MSG 0x0629, END
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bsr.w	ClearTextbox
		rts
; ---------------------------------------------------------------------------

XS_0091:
		trap	#0
; ---------------------------------------------------------------------------
		dc.w $65
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $75A,$0	; Run text script at offset 0x029570
					; 0x85F2: PRINT	MSG 0x063F
					; 0x1BF1: LOAD SPECIAL CHARACTER 0x09
					; 0xE5F3: PRINT	MSG 0x0640, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00A5:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $7A5,$0	; Run text script at offset 0x029606
					; 0x1BE9: LOAD SPECIAL CHARACTER 0x01
					; 0x8626: PRINT	MSG 0x0673
					; 0x8627: PRINT	MSG 0x0674
					; 0x0400: LOAD 0x0000 INTO 0xFF1198
					; 0xA628: PRINT	MSG 0x0675, END
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	XS_00A5_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $7B3,$0	; Run text script at offset 0x029622
					; 0x1BE9: LOAD SPECIAL CHARACTER 0x01
					; 0xA62E: PRINT	MSG 0x067B, END
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	XS_00A5_1
		bsr.s	XS_00A5_2
		beq.s	XS_00A5_3
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $7B5,$0	; Run text script at offset 0x029626
					; 0x1BE9: LOAD SPECIAL CHARACTER 0x01
					; 0xE62F: PRINT	MSG 0x067C, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	XS_00A5_3
; ---------------------------------------------------------------------------

XS_00A5_1:				; CODE XREF: ROM:000284E0j
					; ROM:000284EAj
		bsr.s	XS_00A5_2
		beq.s	XS_00A5_3
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $7AA,$0	; Run text script at offset 0x029610
					; 0x1BE9: LOAD SPECIAL CHARACTER 0x01
					; 0xE629: PRINT	MSG 0x0676, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

XS_00A5_3:				; CODE XREF: ROM:000284EEj
					; ROM:000284F4j ...
		rts

; =============== S U B	R O U T	I N E =======================================


XS_00A5_2:				; CODE XREF: ROM:000284ECp
					; ROM:XS_00A5_1p
		move.w	(word_FF1198).l,d0
		bsr.w	CheckIfItemIsOwned
		bne.s	XS_00A5_4
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $7B7,$0	; Run text script at offset 0x02962A
					; 0x1BE9: LOAD SPECIAL CHARACTER 0x01
					; 0x0400: LOAD 0x0000 INTO 0xFF1198
					; 0xE630: PRINT	MSG 0x067D, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l

XS_00A5_4:				; CODE XREF: XS_00A5_2+Aj
		rts
; End of function XS_00A5_2

; ---------------------------------------------------------------------------

XS_00AC:
		movem.l	d0/d6-a0,-(sp)
		lea	XS_00AC_Options(pc),a0
		moveq	#4,d6
		jsr	(j_GenerateRandomNumber).l
		add.w	d7,d7
		move.w	(a0,d7.w),d0
		bsr.w	RunTextCmd
		movem.l	(sp)+,d0/d6-a0
		rts
; ---------------------------------------------------------------------------
XS_00AC_Options:ScriptID    $7D1,$0	; DATA XREF: ROM:0002851Ct
					; ID 0x000 : Run text script at	offset 0x02965E
					; 0x1BED: LOAD SPECIAL CHARACTER 0x05
					; 0xE63C: PRINT	MSG 0x0689, MSGBOX CLEARED, END
		ScriptID    $7D3,$1	; ID 0x001 : Run text script at	offset 0x029662
					; 0x1BED: LOAD SPECIAL CHARACTER 0x05
					; 0xE63D: PRINT	MSG 0x068A, MSGBOX CLEARED, END
		ScriptID    $7D5,$2	; ID 0x002 : Run text script at	offset 0x029666
					; 0x1BED: LOAD SPECIAL CHARACTER 0x05
					; 0xE63E: PRINT	MSG 0x068B, MSGBOX CLEARED, END
		ScriptID    $7D7,$3	; ID 0x003 : Run text script at	offset 0x02966A
					; 0x1BED: LOAD SPECIAL CHARACTER 0x05
					; 0xE63F: PRINT	MSG 0x068C, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

XS_00AD:
		movem.l	d0/d6-a0,-(sp)
		lea	XS_00AD_Options(pc),a0
		moveq	#4,d6
		jsr	(j_GenerateRandomNumber).l
		add.w	d7,d7
		move.w	(a0,d7.w),d0
		bsr.w	RunTextCmd
		movem.l	(sp)+,d0/d6-a0
		rts
; ---------------------------------------------------------------------------
XS_00AD_Options:ScriptID    $7D9,$0	; DATA XREF: ROM:00028544t
					; ID 0x000 : Run text script at	offset 0x02966E
					; 0x1BED: LOAD SPECIAL CHARACTER 0x05
					; 0xE640: PRINT	MSG 0x068D, MSGBOX CLEARED, END
		ScriptID    $7DB,$1	; ID 0x001 : Run text script at	offset 0x029672
					; 0x1BED: LOAD SPECIAL CHARACTER 0x05
					; 0xE641: PRINT	MSG 0x068E, MSGBOX CLEARED, END
		ScriptID    $7DD,$2	; ID 0x002 : Run text script at	offset 0x029676
					; 0x1BED: LOAD SPECIAL CHARACTER 0x05
					; 0xE642: PRINT	MSG 0x068F, MSGBOX CLEARED, END
		ScriptID    $7DF,$3	; ID 0x003 : Run text script at	offset 0x02967A
					; 0x1BED: LOAD SPECIAL CHARACTER 0x05
					; 0xE643: PRINT	MSG 0x0690, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

XS_00B2:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $7EE,$0	; Run text script at offset 0x029698
					; 0x1BED: LOAD SPECIAL CHARACTER 0x05
					; 0x864D: PRINT	MSG 0x069A
					; 0x864E: PRINT	MSG 0x069B
					; 0xA64F: PRINT	MSG 0x069C, END
; ---------------------------------------------------------------------------
		move.w	#$2E,d0	; '.'
		bsr.w	GetRemainingItemAllowedCount
		beq.s	XS_00B2_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $7F2,$0	; Run text script at offset 0x0296A0
					; 0x8650: PRINT	MSG 0x069D
					; 0x002E: LOAD 0x002E INTO 0xFF1196
					; 0x17E8: RECEIVE ITEM [0xFF1196]
					; 0x1BED: LOAD SPECIAL CHARACTER 0x05
					; 0xE651: PRINT	MSG 0x069E, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	XS_00B2_2
; ---------------------------------------------------------------------------

XS_00B2_1:				; CODE XREF: ROM:00028574j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $7F7,$0	; Run text script at offset 0x0296AA
					; 0xE652: PRINT	MSG 0x069F, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

XS_00B2_2:				; CODE XREF: ROM:0002857Aj
		rts
; ---------------------------------------------------------------------------

XS_00B3:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $7F8,$0	; Run text script at offset 0x0296AC
					; 0x1BE9: LOAD SPECIAL CHARACTER 0x01
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0x8653: PRINT	MSG 0x06A0
					; 0x1BE8: LOAD SPECIAL CHARACTER 0x00
					; 0xE654: PRINT	MSG 0x06A1, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		moveq	#$20,d0	; ' '
		bsr.w	CheckIfItemIsOwned
		beq.s	XS_00B3_1
		bsr.w	ClearTextbox
		st	d0
		bra.s	XS_00B3_2
; ---------------------------------------------------------------------------

XS_00B3_1:				; CODE XREF: ROM:0002858Cj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $807,$0	; Run text script at offset 0x0296CA
					; 0x1BE9: LOAD SPECIAL CHARACTER 0x01
					; 0xE65A: PRINT	MSG 0x06A7, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		clr.b	d0

XS_00B3_2:				; CODE XREF: ROM:00028594j
		move.b	d0,(g_YesNoPromptResult).l
		rts
; ---------------------------------------------------------------------------

XS_00C1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $844,$0	; Prompt:	Run text script	at offset 0x029744
					; 0x18F6: LOAD CHARACTER SCRIPT	0x00F6
					; 0x867C: PRINT	MSG 0x06C9
					; 0xA67D: PRINT	MSG 0x06CA, END
		ScriptID    $847,$1	; Answer 'yes': Run text script at offset 0x02974A
					; 0x14D9: SET BIT 1 OF FLAG 0x01B
					; 0xE67E: PRINT	MSG 0x06CB, MSGBOX CLEARED, END
		ScriptID    $84A,$2	; Answer 'no':  Run text script at offset 0x029750
					; 0xE680: PRINT	MSG 0x06CD, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00E5:
		trap	#0
; ---------------------------------------------------------------------------
		dc.w $1F
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $8C7,$0	; Run text script at offset 0x02984A
					; 0x1BF1: LOAD SPECIAL CHARACTER 0x09
					; 0x86D2: PRINT	MSG 0x071F
					; 0xE6D3: PRINT	MSG 0x0720, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00E9:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $8D5,$0	; Run text script at offset 0x029866
					; 0x1835: LOAD CHARACTER SCRIPT	0x0035
					; 0x86DB: PRINT	MSG 0x0728
					; 0xA6DC: PRINT	MSG 0x0729, END
; ---------------------------------------------------------------------------
		trap	#0
; ---------------------------------------------------------------------------
		dc.w $FD
; ---------------------------------------------------------------------------
		bsr.w	Sleep_0
; ---------------------------------------------------------------------------
		dc.w 59
; ---------------------------------------------------------------------------
		trap	#0
; ---------------------------------------------------------------------------
		dc.w $27
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $8D8,$0	; Run text script at offset 0x02986C
					; 0x1835: LOAD CHARACTER SCRIPT	0x0035
					; 0x86DD: PRINT	MSG 0x072A
					; 0xE6DE: PRINT	MSG 0x072B, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		trap	#0
; ---------------------------------------------------------------------------
		dc.w $FD
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00EB:
		bsr.w	RestoreBGM_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $8DD,$0	; Run text script at offset 0x029876
					; 0x1835: LOAD CHARACTER SCRIPT	0x0035
					; 0x86E0: PRINT	MSG 0x072D
					; 0xE6E1: PRINT	MSG 0x072E, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00F0:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $8F1,$0	; Run text script at offset 0x02989E
					; 0x1835: LOAD CHARACTER SCRIPT	0x0035
					; 0x86EE: PRINT	MSG 0x073B
					; 0x1822: LOAD CHARACTER SCRIPT	0x0022
					; 0xA6EF: PRINT	MSG 0x073C, END
; ---------------------------------------------------------------------------
		trap	#0
; ---------------------------------------------------------------------------
		dc.w $2D
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $8F5,$0	; Run text script at offset 0x0298A6
					; 0x1835: LOAD CHARACTER SCRIPT	0x0035
					; 0x86F0: PRINT	MSG 0x073D
					; 0x86F1: PRINT	MSG 0x073E
					; 0x86F2: PRINT	MSG 0x073F
					; 0x1822: LOAD CHARACTER SCRIPT	0x0022
					; 0x86F3: PRINT	MSG 0x0740
					; 0x1835: LOAD CHARACTER SCRIPT	0x0035
					; 0xE6F4: PRINT	MSG 0x0741, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00F2:
		bsr.w	RestoreBGM_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $900,$0	; Run text script at offset 0x0298BC
					; 0x1BE9: LOAD SPECIAL CHARACTER 0x01
					; 0x86F7: PRINT	MSG 0x0744
					; 0xE6F8: PRINT	MSG 0x0745, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00FE:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $925,$0	; Run text script at offset 0x029906
					; 0x1805: LOAD CHARACTER SCRIPT	0x0005
					; 0xA70E: PRINT	MSG 0x075B, END
; ---------------------------------------------------------------------------
		bsr.w	Sleep_0
; ---------------------------------------------------------------------------
		dc.w 119
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0122:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $96D,$0	; Run text script at offset 0x029996
					; 0x1939: LOAD CHARACTER SCRIPT	0x0139
					; 0x8734: PRINT	MSG 0x0781
					; 0x8735: PRINT	MSG 0x0782
					; 0xA736: PRINT	MSG 0x0783, END
; ---------------------------------------------------------------------------
		moveq	#$32,d0	; '2'

XS_0122_1:				; CODE XREF: ROM:00028646j
					; ROM:0002864Ej
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0122_4
		jsr	(j_RemoveGold).l
		bcs.s	XS_0122_2
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $971,$0	; Run text script at offset 0x02999E
					; 0x1939: LOAD CHARACTER SCRIPT	0x0139
					; 0xE737: PRINT	MSG 0x0784, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	XS_0122_3
; ---------------------------------------------------------------------------

XS_0122_2:				; CODE XREF: ROM:00028616j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $973,$0	; Run text script at offset 0x0299A2
					; 0xE738: PRINT	MSG 0x0785, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l

XS_0122_3:				; CODE XREF: ROM:0002861Cj
		bra.s	XS_0122_5
; ---------------------------------------------------------------------------

XS_0122_4:				; CODE XREF: ROM:0002860Ej
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $974,$0	; Run text script at offset 0x0299A4
					; 0xE739: PRINT	MSG 0x0786, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

XS_0122_5:				; CODE XREF: ROM:XS_0122_3j
		rts
; ---------------------------------------------------------------------------

XS_0123:
		move.l	#200,(g_PrintNumericDwordValue).l

XS_0127:				; CODE XREF: ROM:0002865Aj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $975,$0	; Run text script at offset 0x0299A6
					; 0x1939: LOAD CHARACTER SCRIPT	0x0139
					; 0x873A: PRINT	MSG 0x0787
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1939: LOAD CHARACTER SCRIPT	0x0139
					; 0xE73B: PRINT	MSG 0x0788, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0125:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $97C,$0	; Run text script at offset 0x0299B4
					; 0x193A: LOAD CHARACTER SCRIPT	0x013A
					; 0x873D: PRINT	MSG 0x078A
					; 0x873E: PRINT	MSG 0x078B
					; 0x873F: PRINT	MSG 0x078C
					; 0xA740: PRINT	MSG 0x078D, END
; ---------------------------------------------------------------------------
		moveq	#$14,d0
		bra.s	XS_0122_1
; ---------------------------------------------------------------------------

XS_0128:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $983,$0	; Run text script at offset 0x0299C2
					; 0x193B: LOAD CHARACTER SCRIPT	0x013B
					; 0x8742: PRINT	MSG 0x078F
					; 0x8743: PRINT	MSG 0x0790
					; 0xA744: PRINT	MSG 0x0791, END
; ---------------------------------------------------------------------------
		moveq	#$32,d0	; '2'
		bra.s	XS_0122_1
; ---------------------------------------------------------------------------

XS_0129:
		move.l	#200,(g_PrintNumericDwordValue).l
		bra.s	XS_0127
; ---------------------------------------------------------------------------

XS_012A:
		moveq	#$16,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	XS_012A_3
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $988,$0	; Run text script at offset 0x0299CC
					; 0x193C: LOAD CHARACTER SCRIPT	0x013C
					; 0x0416: LOAD 0x0016 INTO 0xFF1198
					; 0xA746: PRINT	MSG 0x0793, END
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_012A_1
		bsr.w	CheckAndConsumeItem
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $98B,$0	; Run text script at offset 0x0299D2
					; 0x193C: LOAD CHARACTER SCRIPT	0x013C
					; 0xE747: PRINT	MSG 0x0794, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	XS_012A_2
; ---------------------------------------------------------------------------

XS_012A_1:				; CODE XREF: ROM:0002866Cj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $98D,$0	; Run text script at offset 0x0299D6
					; 0x193C: LOAD CHARACTER SCRIPT	0x013C
					; 0xE748: PRINT	MSG 0x0795, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

XS_012A_2:				; CODE XREF: ROM:00028676j
		bra.s	XS_012A_4
; ---------------------------------------------------------------------------

XS_012A_3:				; CODE XREF: ROM:00028662j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $98F,$0	; Run text script at offset 0x0299DA
					; 0x193C: LOAD CHARACTER SCRIPT	0x013C
					; 0x0416: LOAD 0x0016 INTO 0xFF1198
					; 0xE749: PRINT	MSG 0x0796, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l

XS_012A_4:				; CODE XREF: ROM:XS_012A_2j
		rts
; ---------------------------------------------------------------------------

XS_012B:
		clr.b	(g_YesNoPromptResult).l
		move.w	#$E0,d0	; 'à'
		bsr.w	TestFlagBit
		beq.s	XS_012B_3
		move.w	#$E1,d0	; 'á'
		bsr.w	TestFlagBit
		beq.s	XS_012B_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $997,$0	; Run text script at offset 0x0299EA
					; 0x1BED: LOAD SPECIAL CHARACTER 0x05
					; 0xE74C: PRINT	MSG 0x0799, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	XS_012B_2
; ---------------------------------------------------------------------------

XS_012B_1:				; CODE XREF: ROM:000286A2j
		st	(g_YesNoPromptResult).l
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $994,$0	; Run text script at offset 0x0299E4
					; 0x14E1: SET BIT 1 OF FLAG 0x01C
					; 0x1BED: LOAD SPECIAL CHARACTER 0x05
					; 0xE74B: PRINT	MSG 0x0798, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

XS_012B_2:				; CODE XREF: ROM:000286A8j
		bra.s	XS_012B_4
; ---------------------------------------------------------------------------

XS_012B_3:				; CODE XREF: ROM:00028698j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $992,$0	; Run text script at offset 0x0299E0
					; 0x1BED: LOAD SPECIAL CHARACTER 0x05
					; 0xE74A: PRINT	MSG 0x0797, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

XS_012B_4:				; CODE XREF: ROM:XS_012B_2j
		rts
; ---------------------------------------------------------------------------
