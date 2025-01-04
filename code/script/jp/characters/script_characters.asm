; ---------------------------------------------------------------------------

CS_0143:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $F2,$0	; Prompt:	Run text script	at offset 0x0288A0
					; 0x1833: LOAD CHARACTER SCRIPT	0x0033
					; 0xA0E1: PRINT	MSG 0x012E, END
		ScriptID    $F4,$1	; Answer 'yes': Run text script at offset 0x0288A4
					; 0x75C7: SET BIT 7 OF FLAG 0x038, MSGBOX CLEARED, END
		ScriptJump  ClearTextbox,$2 ; Answer 'no':  Jump to address 0x029D50
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0000:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $FE,$1	; Run text script at offset 0x0288B8
					; 0xE0EB: PRINT	MSG 0x0138, MSGBOX CLEARED, END
					;
		dc.w 1			; Params 00, 01
		ScriptID    $FF,$3	; Run text script at offset 0x0288BA
					; 0xE0EC: PRINT	MSG 0x0139, MSGBOX CLEARED, END
					;
		dc.w 2			; Params 00, 02
		ScriptID    $100,$5	; Run text script at offset 0x0288BC
					; 0xE0ED: PRINT	MSG 0x013A, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $101,$7	; Run text script at offset 0x0288BE
					; 0x1422: SET BIT 2 OF FLAG 0x004
					; 0x80EE: PRINT	MSG 0x013B
					; 0x80EF: PRINT	MSG 0x013C
					; 0x80F0: PRINT	MSG 0x013D
					; 0x0028: LOAD 0x0028 INTO 0xFF1196
					; 0x17E8: RECEIVE ITEM [0xFF1196]
					; 0x1800: LOAD CHARACTER SCRIPT	0x0000
					; 0xE0F1: PRINT	MSG 0x013E, MSGBOX CLEARED, END
					;
		dc.w 5			; Params 00, 05
		ScriptID    $108,$9	; Run text script at offset 0x0288CC
					; 0xE0F1: PRINT	MSG 0x013E, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0001:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $109,$1	; Run text script at offset 0x0288CE
					; 0xE0F2: PRINT	MSG 0x013F, MSGBOX CLEARED, END
					;
		dc.w 1			; Params 00, 01
		ScriptID    $10A,$3	; Run text script at offset 0x0288D0
					; 0xE0F3: PRINT	MSG 0x0140, MSGBOX CLEARED, END
					;
		dc.w 2			; Params 00, 02
		ScriptID    $10B,$5	; Run text script at offset 0x0288D2
					; 0xE0F4: PRINT	MSG 0x0141, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $10C,$7	; Run text script at offset 0x0288D4
					; 0xE0F5: PRINT	MSG 0x0142, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $10D,$1	; Run text script at offset 0x0288D6
					; 0xE0F6: PRINT	MSG 0x0143, MSGBOX CLEARED, END
					;
		dc.w 2			; Params 00, 02
		ScriptID    $10E,$3	; Run text script at offset 0x0288D8
					; 0xE0F7: PRINT	MSG 0x0144, MSGBOX CLEARED, END
					;
		dc.w 3			; Params 00, 03
		ScriptID    $10F,$5	; Run text script at offset 0x0288DA
					; 0x80F8: PRINT	MSG 0x0145
					; 0xE0F9: PRINT	MSG 0x0146, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $111,$7	; Run text script at offset 0x0288DE
					; 0xE0FA: PRINT	MSG 0x0147, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $112,$1	; Run text script at offset 0x0288E0
					; 0xE0FB: PRINT	MSG 0x0148, MSGBOX CLEARED, END
					;
		dc.w 2			; Params 00, 02
		ScriptID    $113,$3	; Run text script at offset 0x0288E2
					; 0x80FC: PRINT	MSG 0x0149
					; 0xE0FD: PRINT	MSG 0x014A, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $115,$5	; Run text script at offset 0x0288E6
					; 0xE0FE: PRINT	MSG 0x014B, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0002:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptJump  CS_0002_1,$1 ; Jump	to address 0x026ECC
					;
		dc.w 2			; Params 00, 02
		ScriptID    $119,$3	; Run text script at offset 0x0288EE
					; 0xE102: PRINT	MSG 0x014F, MSGBOX CLEARED, END
					;
		dc.w 3			; Params 00, 03
		ScriptID    $11A,$5	; Run text script at offset 0x0288F0
					; 0xE103: PRINT	MSG 0x0150, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $11B,$7	; Run text script at offset 0x0288F2
					; 0xE104: PRINT	MSG 0x0151, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0002_1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $116,$0	; Prompt:	Run text script	at offset 0x0288E8
					; 0xA0FF: PRINT	MSG 0x014C, END
		ScriptID    $117,$1	; Answer 'yes': Run text script at offset 0x0288EA
					; 0xE100: PRINT	MSG 0x014D, MSGBOX CLEARED, END
		ScriptID    $118,$2	; Answer 'no':  Run text script at offset 0x0288EC
					; 0xE101: PRINT	MSG 0x014E, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_007C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $11C,$1	; Run text script at offset 0x0288F4
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0x8105: PRINT	MSG 0x0152
					; 0x8106: PRINT	MSG 0x0153
					; 0xE107: PRINT	MSG 0x0154, MSGBOX CLEARED, END
					;
		dc.w 2			; Params 00, 02
		ScriptID    $120,$3	; Run text script at offset 0x0288FC
					; 0xE108: PRINT	MSG 0x0155, MSGBOX CLEARED, END
					;
		dc.w 3			; Params 00, 03
		ScriptID    $121,$5	; Run text script at offset 0x0288FE
					; 0xE109: PRINT	MSG 0x0156, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $122,$7	; Run text script at offset 0x028900
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0x810A: PRINT	MSG 0x0157
					; 0xE10B: PRINT	MSG 0x0158, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $125,$9	; Run text script at offset 0x028906
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0x810C: PRINT	MSG 0x0159
					; 0x0400: LOAD 0x0000 INTO 0xFF1198
					; 0xE10D: PRINT	MSG 0x015A, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $129,$1	; Run text script at offset 0x02890E
					; 0xE10E: PRINT	MSG 0x015B, MSGBOX CLEARED, END
					;
		dc.w 2			; Params 00, 02
		ScriptID    $12A,$3	; Run text script at offset 0x028910
					; 0xE10F: PRINT	MSG 0x015C, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $12B,$5	; Run text script at offset 0x028912
					; 0xE110: PRINT	MSG 0x015D, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $12C,$1	; Run text script at offset 0x028914
					; 0x8111: PRINT	MSG 0x015E
					; 0xE112: PRINT	MSG 0x015F, MSGBOX CLEARED, END
					;
		dc.w 1			; Params 00, 01
		ScriptID    $12E,$3	; Run text script at offset 0x028918
					; 0xE113: PRINT	MSG 0x0160, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $12F,$5	; Run text script at offset 0x02891A
					; 0xE114: PRINT	MSG 0x0161, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $130,$1	; Run text script at offset 0x02891C
					; 0xE115: PRINT	MSG 0x0162, MSGBOX CLEARED, END
					;
		dc.w 1			; Params 00, 01
		ScriptID    $131,$3	; Run text script at offset 0x02891E
					; 0xE116: PRINT	MSG 0x0163, MSGBOX CLEARED, END
					;
		dc.w 2			; Params 00, 02
		ScriptID    $132,$5	; Run text script at offset 0x028920
					; 0xE117: PRINT	MSG 0x0164, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $133,$7	; Run text script at offset 0x028922
					; 0xE118: PRINT	MSG 0x0165, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0003:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptJump  CS_0003_1,$1 ; Jump	to address 0x026F4A
					;
		dc.w 3			; Params 00, 03
		ScriptJump  CS_0003_2,$3 ; Jump	to address 0x026F56
					;
		dc.w 4			; Params 00, 04
		ScriptID    $13C,$5	; Run text script at offset 0x028934
					; 0xE121: PRINT	MSG 0x016E, MSGBOX CLEARED, END
					;
		dc.w 7			; Params 00, 07
		ScriptJump  CS_0003_3,$7 ; Jump	to address 0x026F62
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $13F,$9	; Run text script at offset 0x02893A
					; 0xE124: PRINT	MSG 0x0171, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $140,$B	; Run text script at offset 0x02893C
					; 0x8125: PRINT	MSG 0x0172
					; 0x8126: PRINT	MSG 0x0173
					; 0x8127: PRINT	MSG 0x0174
					; 0xE128: PRINT	MSG 0x0175, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0003_1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $134,$0	; Prompt:	Run text script	at offset 0x028924
					; 0x8119: PRINT	MSG 0x0166
					; 0xA11A: PRINT	MSG 0x0167, END
		ScriptID    $136,$1	; Answer 'yes': Run text script at offset 0x028928
					; 0xE11B: PRINT	MSG 0x0168, MSGBOX CLEARED, END
		ScriptID    $137,$2	; Answer 'no':  Run text script at offset 0x02892A
					; 0xE11C: PRINT	MSG 0x0169, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0003_2:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C1		; Bit 1	of flag	0x018
		ScriptID    $138,$1	; Flag clear: Run text script at offset	0x02892C
					; 0x811D: PRINT	MSG 0x016A
					; 0x811E: PRINT	MSG 0x016B
					; 0xE11F: PRINT	MSG 0x016C, MSGBOX CLEARED, END
		ScriptID    $13B,$2	; Flag set:   Run text script at offset	0x028932
					; 0xE120: PRINT	MSG 0x016D, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0003_3:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DA		; Bit 2	of flag	0x01B
		ScriptID    $13D,$1	; Flag clear: Run text script at offset	0x028936
					; 0x8122: PRINT	MSG 0x016F
					; 0xE123: PRINT	MSG 0x0170, MSGBOX CLEARED, END
		ScriptID    $13E,$2	; Flag set:   Run text script at offset	0x028938
					; 0xE123: PRINT	MSG 0x0170, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0080:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $144,$1	; Run text script at offset 0x028944
					; 0xE129: PRINT	MSG 0x0176, MSGBOX CLEARED, END
					;
		dc.w 2			; Params 00, 02
		ScriptID    $145,$3	; Run text script at offset 0x028946
					; 0xE12A: PRINT	MSG 0x0177, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $146,$5	; Run text script at offset 0x028948
					; 0xE12B: PRINT	MSG 0x0178, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0081:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptJump  CS_0081_1,$1 ; Jump	to address 0x026F96
					;
		dc.w 2			; Params 00, 02
		ScriptID    $149,$3	; Run text script at offset 0x02894E
					; 0xE12D: PRINT	MSG 0x017A, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $14A,$5	; Run text script at offset 0x028950
					; 0xE12E: PRINT	MSG 0x017B, MSGBOX CLEARED, END
					;
		dc.w 5			; Params 00, 05
		ScriptID    $14B,$7	; Run text script at offset 0x028952
					; 0xE12F: PRINT	MSG 0x017C, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0081_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C0		; Bit 0	of flag	0x018
		ScriptID    $147,$1	; Flag clear: Run text script at offset	0x02894A
					; 0x7C10: LOAD CUSTOM ACTION 0x10 (0x01213C CSA_0010), MSGBOX CLEARED, END
		ScriptID    $148,$2	; Flag set:   Run text script at offset	0x02894C
					; 0xE12C: PRINT	MSG 0x0179, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0082:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $14C,$1	; Run text script at offset 0x028954
					; 0x8130: PRINT	MSG 0x017D
					; 0xE131: PRINT	MSG 0x017E, MSGBOX CLEARED, END
					;
		dc.w 2			; Params 00, 02
		ScriptID    $14E,$3	; Run text script at offset 0x028958
					; 0xE132: PRINT	MSG 0x017F, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $14C,$5	; Run text script at offset 0x028954
					; 0x8130: PRINT	MSG 0x017D
					; 0xE131: PRINT	MSG 0x017E, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0083:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $14F,$1	; Run text script at offset 0x02895A
					; 0xE133: PRINT	MSG 0x0180, MSGBOX CLEARED, END
					;
		dc.w 2			; Params 00, 02
		ScriptID    $150,$3	; Run text script at offset 0x02895C
					; 0xE134: PRINT	MSG 0x0181, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $151,$5	; Run text script at offset 0x02895E
					; 0xE135: PRINT	MSG 0x0182, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0084:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptJump  CS_0084_1,$1 ; Jump	to address 0x026FD8
					;
		dc.w 2			; Params 00, 02
		ScriptID    $157,$3	; Run text script at offset 0x02896A
					; 0x813B: PRINT	MSG 0x0188
					; 0xE13C: PRINT	MSG 0x0189, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $159,$5	; Run text script at offset 0x02896E
					; 0xE13D: PRINT	MSG 0x018A, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0084_1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $152,$0	; Prompt:	Run text script	at offset 0x028960
					; 0x8136: PRINT	MSG 0x0183
					; 0xA137: PRINT	MSG 0x0184, END
		ScriptID    $154,$1	; Answer 'yes': Run text script at offset 0x028964
					; 0xE138: PRINT	MSG 0x0185, MSGBOX CLEARED, END
		ScriptID    $155,$2	; Answer 'no':  Run text script at offset 0x028966
					; 0x8139: PRINT	MSG 0x0186
					; 0xE13A: PRINT	MSG 0x0187, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0004:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $15A,$1	; Run text script at offset 0x028970
					; 0xE13E: PRINT	MSG 0x018B, MSGBOX CLEARED, END
					;
		dc.w $201		; Params 02, 01
		ScriptID    $15B,$3	; Run text script at offset 0x028972
					; 0x153C: SET BIT 4 OF FLAG 0x027
					; 0x813F: PRINT	MSG 0x018C
					; 0x8140: PRINT	MSG 0x018D
					; 0x8141: PRINT	MSG 0x018E
					; 0x8142: PRINT	MSG 0x018F
					; 0x8143: PRINT	MSG 0x0190
					; 0xE144: PRINT	MSG 0x0191, MSGBOX CLEARED, END
					;
		dc.w $203		; Params 02, 03
		ScriptJump  CS_0004_1,$5 ; Jump	to address 0x026FF6
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0004_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E2		; Bit 2	of flag	0x01C
		ScriptID    $162,$1	; Flag clear: Run text script at offset	0x028980
					; 0x8145: PRINT	MSG 0x0192
					; 0xE146: PRINT	MSG 0x0193, MSGBOX CLEARED, END
		ScriptID    $164,$2	; Flag set:   Run text script at offset	0x028984
					; 0xE147: PRINT	MSG 0x0194, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0085:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $165,$0	; Run text script at offset 0x028986
					; 0xE148: PRINT	MSG 0x0195, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0086:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $166,$0	; Run text script at offset 0x028988
					; 0xE149: PRINT	MSG 0x0196, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0005:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $167,$0	; Run text script at offset 0x02898A
					; 0xE14A: PRINT	MSG 0x0197, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0006:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $168,$0	; Run text script at offset 0x02898C
					; 0xE14B: PRINT	MSG 0x0198, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0087:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $169,$1	; Run text script at offset 0x02898E
					; 0xE14C: PRINT	MSG 0x0199, MSGBOX CLEARED, END
					;
		dc.w 2			; Params 00, 02
		ScriptID    $16A,$3	; Run text script at offset 0x028990
					; 0xE14D: PRINT	MSG 0x019A, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $16B,$5	; Run text script at offset 0x028992
					; 0xE14E: PRINT	MSG 0x019B, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0007:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $16C,$0	; Run text script at offset 0x028994
					; 0x0425: LOAD 0x0025 INTO 0xFF1198
					; 0x0826: LOAD 0x0026 INTO 0xFF119A
					; 0xE14F: PRINT	MSG 0x019C, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0088:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 1			; Params 00, 01
		ScriptID    $16F,$1	; Run text script at offset 0x02899A
					; 0xE150: PRINT	MSG 0x019D, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $170,$3	; Run text script at offset 0x02899C
					; 0xE151: PRINT	MSG 0x019E, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0008:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 1			; Params 00, 01
		ScriptID    $171,$1	; Run text script at offset 0x02899E
					; 0x1400: SET BIT 0 OF FLAG 0x000
					; 0x7C08: LOAD CUSTOM ACTION 0x08 (0x01211C CSA_0008), MSGBOX CLEARED, END
					;
		dc.w 2			; Params 00, 02
		ScriptJump  CS_0008_1,$3 ; Jump	to address 0x02706E
					;
		dc.w 3			; Params 00, 03
		ScriptID    $174,$5	; Run text script at offset 0x0289A4
					; 0x8153: PRINT	MSG 0x01A0
					; 0x8154: PRINT	MSG 0x01A1
					; 0xE155: PRINT	MSG 0x01A2, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $177,$7	; Run text script at offset 0x0289AA
					; 0x8156: PRINT	MSG 0x01A3
					; 0x8157: PRINT	MSG 0x01A4
					; 0xE158: PRINT	MSG 0x01A5, MSGBOX CLEARED, END
					;
		dc.w 8			; Params 00, 08
		ScriptID    $17A,$9	; Run text script at offset 0x0289B0
					; 0x8159: PRINT	MSG 0x01A6
					; 0x815A: PRINT	MSG 0x01A7
					; 0xE15B: PRINT	MSG 0x01A8, MSGBOX CLEARED, END
					;
		dc.w 9			; Params 00, 09
		ScriptID    $17D,$B	; Run text script at offset 0x0289B6
					; 0xE15C: PRINT	MSG 0x01A9, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $17E,$D	; Run text script at offset 0x0289B8
					; 0xE15D: PRINT	MSG 0x01AA, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptID    $17F,$F	; Run text script at offset 0x0289BA
					; 0x815E: PRINT	MSG 0x01AB
					; 0xE15F: PRINT	MSG 0x01AC, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $181,$11	; Run text script at offset 0x0289BE
					; 0x8160: PRINT	MSG 0x01AD
					; 0xE161: PRINT	MSG 0x01AE, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $183,$13	; Run text script at offset 0x0289C2
					; 0x8162: PRINT	MSG 0x01AF
					; 0xE163: PRINT	MSG 0x01B0, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0008_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $12		; Bit 2	of flag	0x002
		ScriptID    $174,$1	; Flag set:   Run text script at offset	0x0289A4
					; 0x8153: PRINT	MSG 0x01A0
					; 0x8154: PRINT	MSG 0x01A1
					; 0xE155: PRINT	MSG 0x01A2, MSGBOX CLEARED, END
		ScriptID    $173,$2	; Flag clear: Run text script at offset	0x0289A2
					; 0xE152: PRINT	MSG 0x019F, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_008A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 2			; Params 00, 02
		ScriptID    $185,$1	; Run text script at offset 0x0289C6
					; 0xE164: PRINT	MSG 0x01B1, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $186,$3	; Run text script at offset 0x0289C8
					; 0xE165: PRINT	MSG 0x01B2, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_008B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 2			; Params 00, 02
		ScriptID    $187,$1	; Run text script at offset 0x0289CA
					; 0xE166: PRINT	MSG 0x01B3, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $188,$3	; Run text script at offset 0x0289CC
					; 0xE167: PRINT	MSG 0x01B4, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_008C:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $189,$0	; Run text script at offset 0x0289CE
					; 0x8168: PRINT	MSG 0x01B5
					; 0xE169: PRINT	MSG 0x01B6, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0009:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C2		; Bit 2	of flag	0x018
		ScriptID    $18B,$1	; Flag clear: Run text script at offset	0x0289D2
					; 0x816A: PRINT	MSG 0x01B7
					; 0xE16B: PRINT	MSG 0x01B8, MSGBOX CLEARED, END
		ScriptID    $18D,$2	; Flag set:   Run text script at offset	0x0289D6
					; 0xE16C: PRINT	MSG 0x01B9, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_000A:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $18E,$0	; Run text script at offset 0x0289D8
					; 0xE16D: PRINT	MSG 0x01BA, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_008D:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $18F,$0	; Run text script at offset 0x0289DA
					; 0xE16E: PRINT	MSG 0x01BB, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_008E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 3			; Params 00, 03
		ScriptID    $190,$1	; Run text script at offset 0x0289DC
					; 0xE16F: PRINT	MSG 0x01BC, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $191,$3	; Run text script at offset 0x0289DE
					; 0xE170: PRINT	MSG 0x01BD, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_008F:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $192,$0	; Run text script at offset 0x0289E0
					; 0xE171: PRINT	MSG 0x01BE, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0090:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 3			; Params 00, 03
		ScriptID    $193,$1	; Run text script at offset 0x0289E2
					; 0xE172: PRINT	MSG 0x01BF, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $194,$3	; Run text script at offset 0x0289E4
					; 0xE173: PRINT	MSG 0x01C0, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0091:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 4			; Params 00, 04
		ScriptID    $195,$1	; Run text script at offset 0x0289E6
					; 0xE174: PRINT	MSG 0x01C1, MSGBOX CLEARED, END
					;
		dc.w 5			; Params 00, 05
		ScriptID    $196,$3	; Run text script at offset 0x0289E8
					; 0xE175: PRINT	MSG 0x01C2, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0092:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 4			; Params 00, 04
		ScriptID    $197,$1	; Run text script at offset 0x0289EA
					; 0xE176: PRINT	MSG 0x01C3, MSGBOX CLEARED, END
					;
		dc.w 5			; Params 00, 05
		ScriptJump  CS_0092_1,$3 ; Jump	to address 0x0270F2
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0092_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C3		; Bit 3	of flag	0x018
		ScriptID    $198,$1	; Flag clear: Run text script at offset	0x0289EC
					; 0x7C0D: LOAD CUSTOM ACTION 0x0D (0x012130 CSA_000D), MSGBOX CLEARED, END
		ScriptID    $199,$2	; Flag set:   Run text script at offset	0x0289EE
					; 0xE177: PRINT	MSG 0x01C4, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0093:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 2			; Params 00, 02
		ScriptID    $19A,$1	; Run text script at offset 0x0289F0
					; 0xE178: PRINT	MSG 0x01C5, MSGBOX CLEARED, END
					;
		dc.w $19		; Params 00, 19
		ScriptID    $19B,$3	; Run text script at offset 0x0289F2
					; 0xE179: PRINT	MSG 0x01C6, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0094:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $19C,$0	; Run text script at offset 0x0289F4
					; 0xE17A: PRINT	MSG 0x01C7, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_000B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 3			; Params 00, 03
		ScriptID    $19D,$1	; Run text script at offset 0x0289F6
					; 0xE17B: PRINT	MSG 0x01C8, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $19E,$3	; Run text script at offset 0x0289F8
					; 0xE17C: PRINT	MSG 0x01C9, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_000C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 3			; Params 00, 03
		ScriptID    $19F,$1	; Run text script at offset 0x0289FA
					; 0xE17D: PRINT	MSG 0x01CA, MSGBOX CLEARED, END
					;
		dc.w 4			; Params 00, 04
		ScriptID    $1A0,$3	; Run text script at offset 0x0289FC
					; 0xE17E: PRINT	MSG 0x01CB, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0095:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 4			; Params 00, 04
		ScriptID    $1A1,$1	; Run text script at offset 0x0289FE
					; 0xE17F: PRINT	MSG 0x01CC, MSGBOX CLEARED, END
					;
		dc.w 5			; Params 00, 05
		ScriptJump  CS_0095_1,$3 ; Jump	to address 0x02713C
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0095_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C3		; Bit 3	of flag	0x018
		ScriptID    $1A2,$1	; Flag clear: Run text script at offset	0x028A00
					; 0x7C0D: LOAD CUSTOM ACTION 0x0D (0x012130 CSA_000D), MSGBOX CLEARED, END
		ScriptID    $1A3,$2	; Flag set:   Run text script at offset	0x028A02
					; 0xE180: PRINT	MSG 0x01CD, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0096:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1A4,$1	; Run text script at offset 0x028A04
					; 0xE181: PRINT	MSG 0x01CE, MSGBOX CLEARED, END
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1A5,$3	; Run text script at offset 0x028A06
					; 0xE182: PRINT	MSG 0x01CF, MSGBOX CLEARED, END
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1A6,$5	; Run text script at offset 0x028A08
					; 0xE183: PRINT	MSG 0x01D0, MSGBOX CLEARED, END
					;
		dc.w $A			; Params 00, 0A
		ScriptID    $1A7,$7	; Run text script at offset 0x028A0A
					; 0xE184: PRINT	MSG 0x01D1, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1A8,$9	; Run text script at offset 0x028A0C
					; 0xE185: PRINT	MSG 0x01D2, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1A4,$B	; Run text script at offset 0x028A04
					; 0xE181: PRINT	MSG 0x01CE, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0097:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1A9,$1	; Run text script at offset 0x028A0E
					; 0xE186: PRINT	MSG 0x01D3, MSGBOX CLEARED, END
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1AA,$3	; Run text script at offset 0x028A10
					; 0xE187: PRINT	MSG 0x01D4, MSGBOX CLEARED, END
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1AB,$5	; Run text script at offset 0x028A12
					; 0xE188: PRINT	MSG 0x01D5, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1AC,$7	; Run text script at offset 0x028A14
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0xE189: PRINT	MSG 0x01D6, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1AB,$9	; Run text script at offset 0x028A12
					; 0xE188: PRINT	MSG 0x01D5, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0098:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1AE,$1	; Run text script at offset 0x028A18
					; 0xE18A: PRINT	MSG 0x01D7, MSGBOX CLEARED, END
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1AF,$3	; Run text script at offset 0x028A1A
					; 0xE18B: PRINT	MSG 0x01D8, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1B0,$5	; Run text script at offset 0x028A1C
					; 0xE18C: PRINT	MSG 0x01D9, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0099:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1B1,$1	; Run text script at offset 0x028A1E
					; 0x818D: PRINT	MSG 0x01DA
					; 0xE18E: PRINT	MSG 0x01DB, MSGBOX CLEARED, END
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1B3,$3	; Run text script at offset 0x028A22
					; 0xE18F: PRINT	MSG 0x01DC, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_000D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1B4,$1	; Run text script at offset 0x028A24
					; 0xE190: PRINT	MSG 0x01DD, MSGBOX CLEARED, END
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1B5,$3	; Run text script at offset 0x028A26
					; 0xE191: PRINT	MSG 0x01DE, MSGBOX CLEARED, END
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1B6,$5	; Run text script at offset 0x028A28
					; 0xE192: PRINT	MSG 0x01DF, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1B7,$7	; Run text script at offset 0x028A2A
					; 0x8193: PRINT	MSG 0x01E0
					; 0xE194: PRINT	MSG 0x01E1, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1B6,$9	; Run text script at offset 0x028A28
					; 0xE192: PRINT	MSG 0x01DF, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1B9,$1	; Run text script at offset 0x028A2E
					; 0xE195: PRINT	MSG 0x01E2, MSGBOX CLEARED, END
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1BA,$3	; Run text script at offset 0x028A30
					; 0xE196: PRINT	MSG 0x01E3, MSGBOX CLEARED, END
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1BB,$5	; Run text script at offset 0x028A32
					; 0xE197: PRINT	MSG 0x01E4, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1BC,$1	; Run text script at offset 0x028A34
					; 0xE198: PRINT	MSG 0x01E5, MSGBOX CLEARED, END
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1BD,$3	; Run text script at offset 0x028A36
					; 0xE199: PRINT	MSG 0x01E6, MSGBOX CLEARED, END
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1BE,$5	; Run text script at offset 0x028A38
					; 0xE19A: PRINT	MSG 0x01E7, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1BF,$7	; Run text script at offset 0x028A3A
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0xE19B: PRINT	MSG 0x01E8, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009C:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1C1,$0	; Run text script at offset 0x028A3E
					; 0xE19C: PRINT	MSG 0x01E9, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_000E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1C2,$1	; Run text script at offset 0x028A40
					; 0xE19D: PRINT	MSG 0x01EA, MSGBOX CLEARED, END
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1C3,$3	; Run text script at offset 0x028A42
					; 0xE19E: PRINT	MSG 0x01EB, MSGBOX CLEARED, END
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1C4,$5	; Run text script at offset 0x028A44
					; 0xE19F: PRINT	MSG 0x01EC, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1C5,$7	; Run text script at offset 0x028A46
					; 0xE1A0: PRINT	MSG 0x01ED, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1C6,$1	; Run text script at offset 0x028A48
					; 0xE1A1: PRINT	MSG 0x01EE, MSGBOX CLEARED, END
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1C7,$3	; Run text script at offset 0x028A4A
					; 0xE1A2: PRINT	MSG 0x01EF, MSGBOX CLEARED, END
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1C8,$5	; Run text script at offset 0x028A4C
					; 0xE1A3: PRINT	MSG 0x01F0, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1C9,$7	; Run text script at offset 0x028A4E
					; 0xE1A4: PRINT	MSG 0x01F1, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1CA,$9	; Run text script at offset 0x028A50
					; 0xE1A5: PRINT	MSG 0x01F2, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1CB,$1	; Run text script at offset 0x028A52
					; 0x81A6: PRINT	MSG 0x01F3
					; 0xE1A7: PRINT	MSG 0x01F4, MSGBOX CLEARED, END
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1CD,$3	; Run text script at offset 0x028A56
					; 0xE1A8: PRINT	MSG 0x01F5, MSGBOX CLEARED, END
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1CE,$5	; Run text script at offset 0x028A58
					; 0xE1A9: PRINT	MSG 0x01F6, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1CF,$7	; Run text script at offset 0x028A5A
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0xE1AA: PRINT	MSG 0x01F7, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1D1,$9	; Run text script at offset 0x028A5E
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0xE1AB: PRINT	MSG 0x01F8, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_000F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 8			; Params 00, 08
		ScriptID    $1D3,$1	; Run text script at offset 0x028A62
					; 0x81AC: PRINT	MSG 0x01F9
					; 0xE1AD: PRINT	MSG 0x01FA, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1D5,$3	; Run text script at offset 0x028A66
					; 0x81AE: PRINT	MSG 0x01FB
					; 0xE1AF: PRINT	MSG 0x01FC, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1D7,$1	; Run text script at offset 0x028A6A
					; 0xE1B0: PRINT	MSG 0x01FD, MSGBOX CLEARED, END
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1D8,$3	; Run text script at offset 0x028A6C
					; 0xE1B1: PRINT	MSG 0x01FE, MSGBOX CLEARED, END
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1D9,$5	; Run text script at offset 0x028A6E
					; 0xE1B2: PRINT	MSG 0x01FF, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1DA,$7	; Run text script at offset 0x028A70
					; 0x81B3: PRINT	MSG 0x0200
					; 0xE1B4: PRINT	MSG 0x0201, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1DC,$1	; Run text script at offset 0x028A74
					; 0xE1B5: PRINT	MSG 0x0202, MSGBOX CLEARED, END
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1DD,$3	; Run text script at offset 0x028A76
					; 0xE1B6: PRINT	MSG 0x0203, MSGBOX CLEARED, END
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1DE,$5	; Run text script at offset 0x028A78
					; 0xE1B7: PRINT	MSG 0x0204, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1DF,$7	; Run text script at offset 0x028A7A
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0xE1B8: PRINT	MSG 0x0205, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1E1,$9	; Run text script at offset 0x028A7E
					; 0xE1B9: PRINT	MSG 0x0206, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 8			; Params 00, 08
		ScriptJump  CS_00A1_1,$1 ; Jump	to address 0x027282
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1E6,$3	; Run text script at offset 0x028A88
					; 0x81BE: PRINT	MSG 0x020B
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0xE1BF: PRINT	MSG 0x020C, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $83C,$5	; Run text script at offset 0x029734
					; 0xE677: PRINT	MSG 0x06C4, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A1_1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $1E2,$0	; Prompt:	Run text script	at offset 0x028A80
					; 0x81BA: PRINT	MSG 0x0207
					; 0xA1BB: PRINT	MSG 0x0208, END
		ScriptID    $1E4,$1	; Answer 'yes': Run text script at offset 0x028A84
					; 0xE1BC: PRINT	MSG 0x0209, MSGBOX CLEARED, END
		ScriptID    $1E5,$2	; Answer 'no':  Run text script at offset 0x028A86
					; 0xE1BD: PRINT	MSG 0x020A, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0010:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1E9,$1	; Run text script at offset 0x028A8E
					; 0x81C0: PRINT	MSG 0x020D
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0xE1C1: PRINT	MSG 0x020E, MSGBOX CLEARED, END
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1EC,$3	; Run text script at offset 0x028A94
					; 0xE1C2: PRINT	MSG 0x020F, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1ED,$5	; Run text script at offset 0x028A96
					; 0xE1C3: PRINT	MSG 0x0210, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1EE,$7	; Run text script at offset 0x028A98
					; 0xE1C4: PRINT	MSG 0x0211, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $1EF,$9	; Run text script at offset 0x028A9A
					; 0xE1C5: PRINT	MSG 0x0212, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A2:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1F0,$1	; Run text script at offset 0x028A9C
					; 0x81C6: PRINT	MSG 0x0213
					; 0xE1C7: PRINT	MSG 0x0214, MSGBOX CLEARED, END
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1F2,$3	; Run text script at offset 0x028AA0
					; 0x81C8: PRINT	MSG 0x0215
					; 0xE1C9: PRINT	MSG 0x0216, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1F4,$5	; Run text script at offset 0x028AA4
					; 0x81CA: PRINT	MSG 0x0217
					; 0xE1CB: PRINT	MSG 0x0218, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A3:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1F6,$1	; Run text script at offset 0x028AA8
					; 0xE1CC: PRINT	MSG 0x0219, MSGBOX CLEARED, END
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1F7,$3	; Run text script at offset 0x028AAA
					; 0x81CD: PRINT	MSG 0x021A
					; 0xE1CE: PRINT	MSG 0x021B, MSGBOX CLEARED, END
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1F9,$5	; Run text script at offset 0x028AAE
					; 0xE1CF: PRINT	MSG 0x021C, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1FA,$7	; Run text script at offset 0x028AB0
					; 0x81D0: PRINT	MSG 0x021D
					; 0x81D1: PRINT	MSG 0x021E
					; 0xE1D2: PRINT	MSG 0x021F, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1F9,$9	; Run text script at offset 0x028AAE
					; 0xE1CF: PRINT	MSG 0x021C, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A4:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1FD,$1	; Run text script at offset 0x028AB6
					; 0xE1D3: PRINT	MSG 0x0220, MSGBOX CLEARED, END
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1FE,$3	; Run text script at offset 0x028AB8
					; 0xE1D4: PRINT	MSG 0x0221, MSGBOX CLEARED, END
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1FF,$5	; Run text script at offset 0x028ABA
					; 0xE1D5: PRINT	MSG 0x0222, MSGBOX CLEARED, END
					;
		dc.w $A			; Params 00, 0A
		ScriptID    $200,$7	; Run text script at offset 0x028ABC
					; 0xE1D6: PRINT	MSG 0x0223, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $201,$9	; Run text script at offset 0x028ABE
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0x81D7: PRINT	MSG 0x0224
					; 0xE1D8: PRINT	MSG 0x0225, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $200,$B	; Run text script at offset 0x028ABC
					; 0xE1D6: PRINT	MSG 0x0223, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $204,$1	; Run text script at offset 0x028AC4
					; 0xE1D9: PRINT	MSG 0x0226, MSGBOX CLEARED, END
					;
		dc.w 6			; Params 00, 06
		ScriptJump  CS_00A5_1,$3 ; Jump	to address 0x027310
					;
		dc.w 7			; Params 00, 07
		ScriptID    $209,$5	; Run text script at offset 0x028ACE
					; 0xE1DD: PRINT	MSG 0x022A, MSGBOX CLEARED, END
					;
		dc.w 8			; Params 00, 08
		ScriptID    $20D,$7	; Run text script at offset 0x028AD6
					; 0xE1E1: PRINT	MSG 0x022E, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $20E,$9	; Run text script at offset 0x028AD8
					; 0x81E2: PRINT	MSG 0x022F
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0xE1E3: PRINT	MSG 0x0230, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $20D,$B	; Run text script at offset 0x028AD6
					; 0xE1E1: PRINT	MSG 0x022E, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A5_1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $205,$0	; Prompt:	Run text script	at offset 0x028AC6
					; 0x81DA: PRINT	MSG 0x0227
					; 0xA1DB: PRINT	MSG 0x0228, END
		ScriptID    $207,$1	; Answer 'yes': Run text script at offset 0x028ACA
					; 0x81DC: PRINT	MSG 0x0229
					; 0x1420: SET BIT 0 OF FLAG 0x004
					; 0xE1DD: PRINT	MSG 0x022A, MSGBOX CLEARED, END
		ScriptJump  CS_00A5_2,$2 ; Answer 'no':  Jump to address 0x02731C
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00A5_2:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $20A,$0	; Prompt:	Run text script	at offset 0x028AD0
					; 0x81DE: PRINT	MSG 0x022B
					; 0xA1DF: PRINT	MSG 0x022C, END
		ScriptID    $208,$1	; Answer 'yes': Run text script at offset 0x028ACC
					; 0x1420: SET BIT 0 OF FLAG 0x004
					; 0xE1DD: PRINT	MSG 0x022A, MSGBOX CLEARED, END
		ScriptID    $20C,$2	; Answer 'no':  Run text script at offset 0x028AD4
					; 0xE1E0: PRINT	MSG 0x022D, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00A6:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $211,$0	; Run text script at offset 0x028ADE
					; 0xE1E4: PRINT	MSG 0x0231, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00A7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $212,$1	; Run text script at offset 0x028AE0
					; 0x7C14: LOAD CUSTOM ACTION 0x14 (0x01214C CSA_0014), MSGBOX CLEARED, END
					;
		dc.w 6			; Params 00, 06
		ScriptID    $213,$3	; Run text script at offset 0x028AE2
					; 0xE1E5: PRINT	MSG 0x0232, MSGBOX CLEARED, END
					;
		dc.w 8			; Params 00, 08
		ScriptID    $214,$5	; Run text script at offset 0x028AE4
					; 0xE1E6: PRINT	MSG 0x0233, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $215,$7	; Run text script at offset 0x028AE6
					; 0xE1E7: PRINT	MSG 0x0234, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $216,$1	; Run text script at offset 0x028AE8
					; 0xE1E8: PRINT	MSG 0x0235, MSGBOX CLEARED, END
					;
		dc.w $19		; Params 00, 19
		ScriptID    $217,$3	; Run text script at offset 0x028AEA
					; 0xE1E9: PRINT	MSG 0x0236, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0011:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 8			; Params 00, 08
		ScriptID    $218,$1	; Run text script at offset 0x028AEC
					; 0x7C21: LOAD CUSTOM ACTION 0x21 (0x012180 CSA_0021), MSGBOX CLEARED, END
					;
		dc.w 9			; Params 00, 09
		ScriptID    $219,$3	; Run text script at offset 0x028AEE
					; 0x0433: LOAD 0x0033 INTO 0xFF1198
					; 0xE1EA: PRINT	MSG 0x0237, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $21B,$5	; Run text script at offset 0x028AF2
					; 0xE1EB: PRINT	MSG 0x0238, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0089:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $21C,$1	; Run text script at offset 0x028AF4
					; 0xE1EC: PRINT	MSG 0x0239, MSGBOX CLEARED, END
					;
		dc.w 6			; Params 00, 06
		ScriptID    $21D,$3	; Run text script at offset 0x028AF6
					; 0xE1ED: PRINT	MSG 0x023A, MSGBOX CLEARED, END
					;
		dc.w 8			; Params 00, 08
		ScriptID    $21E,$5	; Run text script at offset 0x028AF8
					; 0xE1EE: PRINT	MSG 0x023B, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $21F,$1	; Run text script at offset 0x028AFA
					; 0x18A9: LOAD CHARACTER SCRIPT	0x00A9
					; 0xE1EF: PRINT	MSG 0x023C, MSGBOX CLEARED, END
					;
		dc.w 9			; Params 00, 09
		ScriptID    $221,$3	; Run text script at offset 0x028AFE
					; 0xE1F0: PRINT	MSG 0x023D, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptID    $222,$5	; Run text script at offset 0x028B00
					; 0xE1F1: PRINT	MSG 0x023E, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $223,$1	; Run text script at offset 0x028B02
					; 0x18AA: LOAD CHARACTER SCRIPT	0x00AA
					; 0xE1F2: PRINT	MSG 0x023F, MSGBOX CLEARED, END
					;
		dc.w 9			; Params 00, 09
		ScriptID    $225,$3	; Run text script at offset 0x028B06
					; 0xE1F3: PRINT	MSG 0x0240, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptID    $226,$5	; Run text script at offset 0x028B08
					; 0xE1F4: PRINT	MSG 0x0241, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0012:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $227,$0	; Run text script at offset 0x028B0A
					; 0xE1F5: PRINT	MSG 0x0242, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00AB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $228,$1	; Run text script at offset 0x028B0C
					; 0xE1F6: PRINT	MSG 0x0243, MSGBOX CLEARED, END
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $229,$3	; Run text script at offset 0x028B0E
					; 0xE1F7: PRINT	MSG 0x0244, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $22A,$5	; Run text script at offset 0x028B10
					; 0xE1F8: PRINT	MSG 0x0245, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $22B,$1	; Run text script at offset 0x028B12
					; 0xE1F9: PRINT	MSG 0x0246, MSGBOX CLEARED, END
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $22C,$3	; Run text script at offset 0x028B14
					; 0xE1FA: PRINT	MSG 0x0247, MSGBOX CLEARED, END
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $22D,$5	; Run text script at offset 0x028B16
					; 0xE1FB: PRINT	MSG 0x0248, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $22E,$7	; Run text script at offset 0x028B18
					; 0x81FC: PRINT	MSG 0x0249
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0xE1FD: PRINT	MSG 0x024A, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $231,$9	; Run text script at offset 0x028B1E
					; 0xE1FE: PRINT	MSG 0x024B, MSGBOX CLEARED, END
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $232,$B	; Run text script at offset 0x028B20
					; 0xE1FF: PRINT	MSG 0x024C, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $233,$D	; Run text script at offset 0x028B22
					; 0xE200: PRINT	MSG 0x024D, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $234,$1	; Run text script at offset 0x028B24
					; 0xE201: PRINT	MSG 0x024E, MSGBOX CLEARED, END
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $235,$3	; Run text script at offset 0x028B26
					; 0xE202: PRINT	MSG 0x024F, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $236,$5	; Run text script at offset 0x028B28
					; 0xE203: PRINT	MSG 0x0250, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0013:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $237,$1	; Run text script at offset 0x028B2A
					; 0xE204: PRINT	MSG 0x0251, MSGBOX CLEARED, END
					;
		dc.w $D			; Params 00, 0D
		ScriptID    $238,$3	; Run text script at offset 0x028B2C
					; 0x7C3D: LOAD CUSTOM ACTION 0x3D (0x0121F0 CSA_003D), MSGBOX CLEARED, END
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $239,$5	; Run text script at offset 0x028B2E
					; 0xE205: PRINT	MSG 0x0252, MSGBOX CLEARED, END
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $23A,$7	; Run text script at offset 0x028B30
					; 0xE206: PRINT	MSG 0x0253, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $23B,$9	; Run text script at offset 0x028B32
					; 0xE207: PRINT	MSG 0x0254, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptJump  CS_0013_1,$B ; Jump	to address 0x027408
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $243,$D	; Run text script at offset 0x028B42
					; 0xE20C: PRINT	MSG 0x0259, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0013_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $132		; Bit 2	of flag	0x026
		ScriptID    $241,$1	; Flag set:   Run text script at offset	0x028B3E
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0xE20B: PRINT	MSG 0x0258, MSGBOX CLEARED, END
		ScriptID    $23C,$2	; Flag clear: Run text script at offset	0x028B34
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0x081E: LOAD 0x001E INTO 0xFF119A
					; 0x8208: PRINT	MSG 0x0255
					; 0x8209: PRINT	MSG 0x0256
					; 0xE20A: PRINT	MSG 0x0257, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00AE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $244,$1	; Run text script at offset 0x028B44
					; 0xE20D: PRINT	MSG 0x025A, MSGBOX CLEARED, END
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $245,$3	; Run text script at offset 0x028B46
					; 0xE20E: PRINT	MSG 0x025B, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AF:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $246,$1	; Run text script at offset 0x028B48
					; 0xE20F: PRINT	MSG 0x025C, MSGBOX CLEARED, END
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $247,$3	; Run text script at offset 0x028B4A
					; 0xE210: PRINT	MSG 0x025D, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $248,$1	; Run text script at offset 0x028B4C
					; 0xE211: PRINT	MSG 0x025E, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $249,$3	; Run text script at offset 0x028B4E
					; 0xE212: PRINT	MSG 0x025F, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $24A,$5	; Run text script at offset 0x028B50
					; 0xE213: PRINT	MSG 0x0260, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B1:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $24B,$0	; Run text script at offset 0x028B52
					; 0x1BEE: LOAD SPECIAL CHARACTER 0x06
					; 0xE214: PRINT	MSG 0x0261, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B2:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $24D,$0	; Run text script at offset 0x028B56
					; 0x1BEF: LOAD SPECIAL CHARACTER 0x07
					; 0xE215: PRINT	MSG 0x0262, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B3:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $24F,$0	; Run text script at offset 0x028B5A
					; 0x1BEE: LOAD SPECIAL CHARACTER 0x06
					; 0xE216: PRINT	MSG 0x0263, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B4:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $251,$0	; Run text script at offset 0x028B5E
					; 0x1BEF: LOAD SPECIAL CHARACTER 0x07
					; 0xE217: PRINT	MSG 0x0264, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $253,$1	; Run text script at offset 0x028B62
					; 0x8218: PRINT	MSG 0x0265
					; 0xE219: PRINT	MSG 0x0266, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $255,$3	; Run text script at offset 0x028B66
					; 0xE21A: PRINT	MSG 0x0267, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $256,$5	; Run text script at offset 0x028B68
					; 0xE21B: PRINT	MSG 0x0268, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $257,$1	; Run text script at offset 0x028B6A
					; 0x821C: PRINT	MSG 0x0269
					; 0x821D: PRINT	MSG 0x026A
					; 0xE21E: PRINT	MSG 0x026B, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptID    $25A,$3	; Run text script at offset 0x028B70
					; 0xE21F: PRINT	MSG 0x026C, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $25B,$5	; Run text script at offset 0x028B72
					; 0xE220: PRINT	MSG 0x026D, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $25C,$7	; Run text script at offset 0x028B74
					; 0xE221: PRINT	MSG 0x026E, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $25D,$1	; Run text script at offset 0x028B76
					; 0x8222: PRINT	MSG 0x026F
					; 0xE223: PRINT	MSG 0x0270, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $25F,$3	; Run text script at offset 0x028B7A
					; 0xE224: PRINT	MSG 0x0271, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $260,$1	; Run text script at offset 0x028B7C
					; 0x8225: PRINT	MSG 0x0272
					; 0xE226: PRINT	MSG 0x0273, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $262,$3	; Run text script at offset 0x028B80
					; 0xE227: PRINT	MSG 0x0274, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $263,$5	; Run text script at offset 0x028B82
					; 0x8228: PRINT	MSG 0x0275
					; 0xE229: PRINT	MSG 0x0276, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $265,$7	; Run text script at offset 0x028B86
					; 0xE22A: PRINT	MSG 0x0277, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0014:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $266,$0	; Run text script at offset 0x028B88
					; 0xE22B: PRINT	MSG 0x0278, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $267,$1	; Run text script at offset 0x028B8A
					; 0xE22C: PRINT	MSG 0x0279, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $268,$3	; Run text script at offset 0x028B8C
					; 0xE22D: PRINT	MSG 0x027A, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00BA:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $269,$0	; Run text script at offset 0x028B8E
					; 0xE22E: PRINT	MSG 0x027B, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00BB:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $26A,$0	; Run text script at offset 0x028B90
					; 0xE22F: PRINT	MSG 0x027C, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0015:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $26B,$1	; Run text script at offset 0x028B92
					; 0xE230: PRINT	MSG 0x027D, MSGBOX CLEARED, END
					;
		dc.w $C			; Params 00, 0C
		ScriptID    $26C,$3	; Run text script at offset 0x028B94
					; 0xE231: PRINT	MSG 0x027E, MSGBOX CLEARED, END
					;
		dc.w $E			; Params 00, 0E
		ScriptJump  CS_0015_1,$5 ; Jump	to address 0x0274DC
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $26F,$7	; Run text script at offset 0x028B9A
					; 0xE233: PRINT	MSG 0x0280, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0015_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $1A		; Bit 2	of flag	0x003
		ScriptID    $26E,$1	; Flag set:   Run text script at offset	0x028B98
					; 0xE232: PRINT	MSG 0x027F, MSGBOX CLEARED, END
		ScriptID    $26D,$2	; Flag clear: Run text script at offset	0x028B96
					; 0x7C3E: LOAD CUSTOM ACTION 0x3E (0x0121F4 CSA_003E), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0016:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_0016_1,$1 ; Jump	to address 0x0274FE
					;
		dc.w $C			; Params 00, 0C
		ScriptJump  CS_0016_2,$3 ; Jump	to address 0x027516
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $273,$5	; Run text script at offset 0x028BA2
					; 0xE236: PRINT	MSG 0x0283, MSGBOX CLEARED, END
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $274,$7	; Run text script at offset 0x028BA4
					; 0xE237: PRINT	MSG 0x0284, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0016_1:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $270,$0	; Run text script at offset 0x028B9C
					; 0x14C6: SET BIT 6 OF FLAG 0x018
					; 0xE234: PRINT	MSG 0x0281, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		move.w	#$C8,d0	; 'È'

CS_0016_3:				; CODE XREF: ROM:000279C8j
		bsr.w	TestFlagBit
		beq.s	CS_0016_4
		move.w	#$2C,d0	; ','
		bsr.w	SetFlagBit

CS_0016_4:				; CODE XREF: ROM:0002750Aj
		rts
; ---------------------------------------------------------------------------

CS_0016_2:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $1E		; Bit 6	of flag	0x003
		ScriptID    $274,$1	; Flag set:   Run text script at offset	0x028BA4
					; 0xE237: PRINT	MSG 0x0284, MSGBOX CLEARED, END
		ScriptID    $272,$2	; Flag clear: Run text script at offset	0x028BA0
					; 0xE235: PRINT	MSG 0x0282, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0017:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $275,$1	; Run text script at offset 0x028BA6
					; 0xE238: PRINT	MSG 0x0285, MSGBOX CLEARED, END
					;
		dc.w $C			; Params 00, 0C
		ScriptID    $276,$3	; Run text script at offset 0x028BA8
					; 0x142E: SET BIT 6 OF FLAG 0x005
					; 0x8239: PRINT	MSG 0x0286
					; 0xE23A: PRINT	MSG 0x0287, MSGBOX CLEARED, END
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $279,$5	; Run text script at offset 0x028BAE
					; 0xE23B: PRINT	MSG 0x0288, MSGBOX CLEARED, END
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $27A,$7	; Run text script at offset 0x028BB0
					; 0xE23C: PRINT	MSG 0x0289, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00BC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $27B,$1	; Run text script at offset 0x028BB2
					; 0xE23D: PRINT	MSG 0x028A, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $27C,$3	; Run text script at offset 0x028BB4
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0xE23E: PRINT	MSG 0x028B, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $27E,$5	; Run text script at offset 0x028BB8
					; 0xE23F: PRINT	MSG 0x028C, MSGBOX CLEARED, END
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $27F,$7	; Run text script at offset 0x028BBA
					; 0xE240: PRINT	MSG 0x028D, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $280,$9	; Run text script at offset 0x028BBC
					; 0xE241: PRINT	MSG 0x028E, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00BD:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $281,$0	; Run text script at offset 0x028BBE
					; 0xE242: PRINT	MSG 0x028F, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00BE:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $282,$0	; Run text script at offset 0x028BC0
					; 0xE243: PRINT	MSG 0x0290, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00BF:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_00BF_1,$1 ; Jump	to address 0x027578
					;
		dc.w $101		; Params 01, 01
		ScriptJump  CS_00BF_2,$3 ; Jump	to address 0x027584
					;
		dc.w $102		; Params 01, 02
		ScriptID    $29B,$5	; Run text script at offset 0x028BF2
					; 0xE258: PRINT	MSG 0x02A5, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_00BF_8,$7 ; Jump	to address 0x0275CC
					;
		dc.w $103		; Params 01, 03
		ScriptJump  CS_00BF_7,$9 ; Jump	to address 0x0275C0
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00BF_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C7		; Bit 7	of flag	0x018
		ScriptID    $283,$1	; Flag clear: Run text script at offset	0x028BC2
					; 0x8244: PRINT	MSG 0x0291
					; 0x8245: PRINT	MSG 0x0292
					; 0x8246: PRINT	MSG 0x0293
					; 0xE247: PRINT	MSG 0x0294, MSGBOX CLEARED, END
		ScriptID    $287,$2	; Flag set:   Run text script at offset	0x028BCA
					; 0xE248: PRINT	MSG 0x0295, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00BF_2:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $288,$0	; Run text script at offset 0x028BCC
					; 0x8249: PRINT	MSG 0x0296
					; 0x824A: PRINT	MSG 0x0297
					; 0xA24B: PRINT	MSG 0x0298, END
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	CS_00BF_3
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $28B,$0	; Run text script at offset 0x028BD2
					; 0xE24C: PRINT	MSG 0x0299, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	CS_00BF_9
; ---------------------------------------------------------------------------

CS_00BF_3:				; CODE XREF: ROM:0002758Cj
					; ROM:000275B8j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $28C,$0	; Run text script at offset 0x028BD4
					; 0xA24D: PRINT	MSG 0x029A, END
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	CS_00BF_4
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $291,$0	; Run text script at offset 0x028BDE
					; 0x1553: SET BIT 3 OF FLAG 0x02A
					; 0xA252: PRINT	MSG 0x029F, END
; ---------------------------------------------------------------------------
		bra.s	CS_00BF_6
; ---------------------------------------------------------------------------

CS_00BF_4:				; CODE XREF: ROM:0002759Cj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $28D,$0	; Run text script at offset 0x028BD6
					; 0xA24E: PRINT	MSG 0x029B, END
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	CS_00BF_5
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $293,$0	; Run text script at offset 0x028BE2
					; 0xA253: PRINT	MSG 0x02A0, END
; ---------------------------------------------------------------------------
		bra.s	CS_00BF_6
; ---------------------------------------------------------------------------

CS_00BF_5:				; CODE XREF: ROM:000275ACj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $28E,$0	; Run text script at offset 0x028BD8
					; 0x824F: PRINT	MSG 0x029C
					; 0x8250: PRINT	MSG 0x029D
					; 0xA251: PRINT	MSG 0x029E, END
; ---------------------------------------------------------------------------
		bra.s	CS_00BF_3
; ---------------------------------------------------------------------------

CS_00BF_6:				; CODE XREF: ROM:000275A2j
					; ROM:000275B2j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $294,$0	; Run text script at offset 0x028BE4
					; 0x1552: SET BIT 2 OF FLAG 0x02A
					; 0x8254: PRINT	MSG 0x02A1
					; 0x8255: PRINT	MSG 0x02A2
					; 0x8256: PRINT	MSG 0x02A3
					; 0x8257: PRINT	MSG 0x02A4
					; 0x0019: LOAD 0x0019 INTO 0xFF1196
					; 0x77E8: RECEIVE ITEM [0xFF1196], MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

CS_00BF_9:				; CODE XREF: ROM:00027592j
		rts
; ---------------------------------------------------------------------------

CS_00BF_7:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DD		; Bit 5	of flag	0x01B
		ScriptID    $29C,$1	; Flag clear: Run text script at offset	0x028BF4
					; 0x8259: PRINT	MSG 0x02A6
					; 0x825A: PRINT	MSG 0x02A7
					; 0x825B: PRINT	MSG 0x02A8
					; 0xE25C: PRINT	MSG 0x02A9, MSGBOX CLEARED, END
		ScriptID    $2A0,$2	; Flag set:   Run text script at offset	0x028BFC
					; 0xE25D: PRINT	MSG 0x02AA, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00BF_8:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $152		; Bit 2	of flag	0x02A
		ScriptID    $2A1,$1	; Flag set:   Run text script at offset	0x028BFE
					; 0x825E: PRINT	MSG 0x02AB
					; 0xE25F: PRINT	MSG 0x02AC, MSGBOX CLEARED, END
		ScriptJump  CS_00BF_1,$2 ; Flag	clear: Jump to address 0x037578
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2A3,$1	; Run text script at offset 0x028C02
					; 0xE260: PRINT	MSG 0x02AD, MSGBOX CLEARED, END
					;
		dc.w $101		; Params 01, 01
		ScriptID    $2A4,$3	; Run text script at offset 0x028C04
					; 0xE261: PRINT	MSG 0x02AE, MSGBOX CLEARED, END
					;
		dc.w $102		; Params 01, 02
		ScriptJump  CS_00C0_1,$5 ; Jump	to address 0x0275F2
					;
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_00C0_2,$7 ; Jump	to address 0x0275FE
					;
		dc.w $103		; Params 01, 03
		ScriptID    $2A7,$9	; Run text script at offset 0x028C0A
					; 0xE264: PRINT	MSG 0x02B1, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C0_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $153		; Bit 3	of flag	0x02A
		ScriptID    $2A5,$1	; Flag set:   Run text script at offset	0x028C06
					; 0xE262: PRINT	MSG 0x02AF, MSGBOX CLEARED, END
		ScriptID    $2A6,$2	; Flag clear: Run text script at offset	0x028C08
					; 0xE263: PRINT	MSG 0x02B0, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C0_2:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $152		; Bit 2	of flag	0x02A
		ScriptID    $2A7,$1	; Flag set:   Run text script at offset	0x028C0A
					; 0xE264: PRINT	MSG 0x02B1, MSGBOX CLEARED, END
		ScriptID    $2A3,$2	; Flag clear: Run text script at offset	0x028C02
					; 0xE260: PRINT	MSG 0x02AD, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0018:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $E4		; Bit 4	of flag	0x01C
		ScriptID    $5EE,$1	; Flag set:   Run text script at offset	0x029298
					; 0x1BF6: LOAD SPECIAL CHARACTER 0x0E
					; 0xE510: PRINT	MSG 0x055D, MSGBOX CLEARED, END
		ScriptID    $2A8,$2	; Flag clear: Run text script at offset	0x028C0C
					; 0x7C30: LOAD CUSTOM ACTION 0x30 (0x0121BC CSA_0030), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2AA,$1	; Run text script at offset 0x028C10
					; 0x8266: PRINT	MSG 0x02B3
					; 0xE267: PRINT	MSG 0x02B4, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2AC,$3	; Run text script at offset 0x028C14
					; 0x8268: PRINT	MSG 0x02B5
					; 0xE269: PRINT	MSG 0x02B6, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptID    $2AE,$5	; Run text script at offset 0x028C18
					; 0x826A: PRINT	MSG 0x02B7
					; 0x826B: PRINT	MSG 0x02B8
					; 0xE26C: PRINT	MSG 0x02B9, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2B1,$7	; Run text script at offset 0x028C1E
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0xE26D: PRINT	MSG 0x02BA, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2B3,$9	; Run text script at offset 0x028C22
					; 0xE26E: PRINT	MSG 0x02BB, MSGBOX CLEARED, END
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $2B4,$B	; Run text script at offset 0x028C24
					; 0xE26F: PRINT	MSG 0x02BC, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2B5,$D	; Run text script at offset 0x028C26
					; 0xE270: PRINT	MSG 0x02BD, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C2:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2B6,$1	; Run text script at offset 0x028C28
					; 0xE271: PRINT	MSG 0x02BE, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2B7,$3	; Run text script at offset 0x028C2A
					; 0xE272: PRINT	MSG 0x02BF, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptID    $2B8,$5	; Run text script at offset 0x028C2C
					; 0xE273: PRINT	MSG 0x02C0, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2B9,$7	; Run text script at offset 0x028C2E
					; 0x8274: PRINT	MSG 0x02C1
					; 0xE275: PRINT	MSG 0x02C2, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2BB,$9	; Run text script at offset 0x028C32
					; 0xE276: PRINT	MSG 0x02C3, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2BC,$B	; Run text script at offset 0x028C34
					; 0xE277: PRINT	MSG 0x02C4, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C3:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2BD,$1	; Run text script at offset 0x028C36
					; 0x8278: PRINT	MSG 0x02C5
					; 0xE279: PRINT	MSG 0x02C6, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2BF,$3	; Run text script at offset 0x028C3A
					; 0xE27A: PRINT	MSG 0x02C7, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptID    $2C0,$5	; Run text script at offset 0x028C3C
					; 0xE27B: PRINT	MSG 0x02C8, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2C1,$7	; Run text script at offset 0x028C3E
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0xE27C: PRINT	MSG 0x02C9, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2C3,$9	; Run text script at offset 0x028C42
					; 0x827D: PRINT	MSG 0x02CA
					; 0xE27E: PRINT	MSG 0x02CB, MSGBOX CLEARED, END
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $2C5,$B	; Run text script at offset 0x028C46
					; 0xE27F: PRINT	MSG 0x02CC, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2C6,$D	; Run text script at offset 0x028C48
					; 0xE280: PRINT	MSG 0x02CD, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0019:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2C7,$1	; Run text script at offset 0x028C4A
					; 0x8281: PRINT	MSG 0x02CE
					; 0xE282: PRINT	MSG 0x02CF, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2C9,$3	; Run text script at offset 0x028C4E
					; 0x8283: PRINT	MSG 0x02D0
					; 0xE284: PRINT	MSG 0x02D1, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptID    $2CB,$5	; Run text script at offset 0x028C52
					; 0xE285: PRINT	MSG 0x02D2, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2CC,$7	; Run text script at offset 0x028C54
					; 0x8286: PRINT	MSG 0x02D3
					; 0xE287: PRINT	MSG 0x02D4, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  CS_0019_1,$9 ; Jump	to address 0x027692
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0019_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $14A		; Bit 2	of flag	0x029
		ScriptID    $96B,$1	; Flag set:   Run text script at offset	0x029992
					; 0x1819: LOAD CHARACTER SCRIPT	0x0019
					; 0xE733: PRINT	MSG 0x0780, MSGBOX CLEARED, END
		ScriptID    $2CE,$2	; Flag clear: Run text script at offset	0x028C58
					; 0x8288: PRINT	MSG 0x02D5
					; 0xE289: PRINT	MSG 0x02D6, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_001A_1,$1 ; Jump	to address 0x0276AC
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2D7,$3	; Run text script at offset 0x028C6A
					; 0x8291: PRINT	MSG 0x02DE
					; 0x8292: PRINT	MSG 0x02DF
					; 0xE293: PRINT	MSG 0x02E0, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001A_1:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2D0,$0	; Run text script at offset 0x028C5C
					; 0x828A: PRINT	MSG 0x02D7
					; 0xA28B: PRINT	MSG 0x02D8, END
; ---------------------------------------------------------------------------

CS_001A_2:				; CODE XREF: ROM:000276C0j
		bsr.w	GetYesNoAnswer
		bcc.s	CS_001A_3
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2D2,$0	; Run text script at offset 0x028C60
					; 0x828C: PRINT	MSG 0x02D9
					; 0x828D: PRINT	MSG 0x02DA
					; 0x828E: PRINT	MSG 0x02DB
					; 0xE28F: PRINT	MSG 0x02DC, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	CS_001A_4
; ---------------------------------------------------------------------------

CS_001A_3:				; CODE XREF: ROM:000276B4j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2D6,$0	; Run text script at offset 0x028C68
					; 0xA290: PRINT	MSG 0x02DD, END
; ---------------------------------------------------------------------------
		bra.s	CS_001A_2
; ---------------------------------------------------------------------------

CS_001A_4:				; CODE XREF: ROM:000276BAj
		rts
; ---------------------------------------------------------------------------

CS_00C4:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2DA,$1	; Run text script at offset 0x028C70
					; 0xE294: PRINT	MSG 0x02E1, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2DB,$3	; Run text script at offset 0x028C72
					; 0x8295: PRINT	MSG 0x02E2
					; 0xE296: PRINT	MSG 0x02E3, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2DD,$5	; Run text script at offset 0x028C76
					; 0x8297: PRINT	MSG 0x02E4
					; 0xE298: PRINT	MSG 0x02E5, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2DF,$7	; Run text script at offset 0x028C7A
					; 0xE299: PRINT	MSG 0x02E6, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2E0,$1	; Run text script at offset 0x028C7C
					; 0xE29A: PRINT	MSG 0x02E7, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2E1,$3	; Run text script at offset 0x028C7E
					; 0x829B: PRINT	MSG 0x02E8
					; 0xE29C: PRINT	MSG 0x02E9, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2E3,$5	; Run text script at offset 0x028C82
					; 0xE29D: PRINT	MSG 0x02EA, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2E4,$1	; Run text script at offset 0x028C84
					; 0xE29E: PRINT	MSG 0x02EB, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptID    $2E5,$3	; Run text script at offset 0x028C86
					; 0xE29F: PRINT	MSG 0x02EC, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2E6,$5	; Run text script at offset 0x028C88
					; 0x82A0: PRINT	MSG 0x02ED
					; 0xE2A1: PRINT	MSG 0x02EE, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2E8,$7	; Run text script at offset 0x028C8C
					; 0xE2A2: PRINT	MSG 0x02EF, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2E9,$1	; Run text script at offset 0x028C8E
					; 0xE2A3: PRINT	MSG 0x02F0, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2EA,$3	; Run text script at offset 0x028C90
					; 0xE2A4: PRINT	MSG 0x02F1, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  CS_00C7_1,$5 ; Jump	to address 0x027714
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C7_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $14A		; Bit 2	of flag	0x029
		ScriptID    $969,$1	; Flag set:   Run text script at offset	0x02998E
					; 0x18C7: LOAD CHARACTER SCRIPT	0x00C7
					; 0xE732: PRINT	MSG 0x077F, MSGBOX CLEARED, END
		ScriptID    $2EB,$2	; Flag clear: Run text script at offset	0x028C92
					; 0x7D2B: LOAD CUSTOM ACTION 0x12B (0x0125A8 CSA_012B),	MSGBOX CLEARED,	END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_00C8_1,$1 ; Jump	to address 0x02772E
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2EE,$3	; Run text script at offset 0x028C98
					; 0xE2A7: PRINT	MSG 0x02F4, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C8_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $28		; Bit 0	of flag	0x005
		ScriptID    $2ED,$1	; Flag set:   Run text script at offset	0x028C96
					; 0xE2A6: PRINT	MSG 0x02F3, MSGBOX CLEARED, END
		ScriptID    $2EC,$2	; Flag clear: Run text script at offset	0x028C94
					; 0xE2A5: PRINT	MSG 0x02F2, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2EF,$1	; Run text script at offset 0x028C9A
					; 0x82A8: PRINT	MSG 0x02F5
					; 0x82A9: PRINT	MSG 0x02F6
					; 0xE2AA: PRINT	MSG 0x02F7, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2F2,$3	; Run text script at offset 0x028CA0
					; 0x82AB: PRINT	MSG 0x02F8
					; 0xE2AC: PRINT	MSG 0x02F9, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptID    $2F4,$5	; Run text script at offset 0x028CA4
					; 0xE2AD: PRINT	MSG 0x02FA, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2F5,$7	; Run text script at offset 0x028CA6
					; 0xE2AE: PRINT	MSG 0x02FB, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2F6,$1	; Run text script at offset 0x028CA8
					; 0x82AF: PRINT	MSG 0x02FC
					; 0xE2B0: PRINT	MSG 0x02FD, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2F8,$3	; Run text script at offset 0x028CAC
					; 0x82B1: PRINT	MSG 0x02FE
					; 0xE2B2: PRINT	MSG 0x02FF, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptID    $2FA,$5	; Run text script at offset 0x028CB0
					; 0xE2B3: PRINT	MSG 0x0300, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2FB,$7	; Run text script at offset 0x028CB2
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0x82B4: PRINT	MSG 0x0301
					; 0xE2B5: PRINT	MSG 0x0302, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2FE,$9	; Run text script at offset 0x028CB8
					; 0xE2B6: PRINT	MSG 0x0303, MSGBOX CLEARED, END
					;
		dc.w $1B		; Params 00, 1B
		ScriptJump  CS_00CA_1,$B ; Jump	to address 0x027772
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $303,$D	; Run text script at offset 0x028CC2
					; 0xE2BB: PRINT	MSG 0x0308, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CA_1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $2FF,$0	; Prompt:	Run text script	at offset 0x028CBA
					; 0xA2B7: PRINT	MSG 0x0304, END
		ScriptID    $301,$1	; Answer 'yes': Run text script at offset 0x028CBE
					; 0x82B9: PRINT	MSG 0x0306
					; 0xE2BA: PRINT	MSG 0x0307, MSGBOX CLEARED, END
		ScriptID    $300,$2	; Answer 'no':  Run text script at offset 0x028CBC
					; 0x82B8: PRINT	MSG 0x0305
					; 0x82B9: PRINT	MSG 0x0306
					; 0xE2BA: PRINT	MSG 0x0307, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00CB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $304,$1	; Run text script at offset 0x028CC4
					; 0xE2BC: PRINT	MSG 0x0309, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptJump  CS_00CB_1,$3 ; Jump	to address 0x027790
					;
		dc.w $15		; Params 00, 15
		ScriptID    $308,$5	; Run text script at offset 0x028CCC
					; 0xE2C0: PRINT	MSG 0x030D, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CB_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $A2		; Bit 2	of flag	0x014
		ScriptID    $307,$1	; Flag set:   Run text script at offset	0x028CCA
					; 0xE2BF: PRINT	MSG 0x030C, MSGBOX CLEARED, END
		ScriptID    $305,$2	; Flag clear: Run text script at offset	0x028CC6
					; 0x82BD: PRINT	MSG 0x030A
					; 0xE2BE: PRINT	MSG 0x030B, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001B:
		cmpi.w	#1600,(g_AdditionalFlags+$1C).l
		blt.s	CS_001B_1
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w 8			; Bit 0	of flag	0x001
		ScriptID    $605,$1	; Flag set:   Run text script at offset	0x0292C6
					; 0xE51F: PRINT	MSG 0x056C, MSGBOX CLEARED, END
		ScriptID    $603,$2	; Flag clear: Run text script at offset	0x0292C2
					; 0x1408: SET BIT 0 OF FLAG 0x001
					; 0xE51E: PRINT	MSG 0x056B, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	CS_001B_2
; ---------------------------------------------------------------------------

CS_001B_1:				; CODE XREF: ROM:000277A4j
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w 8			; Bit 0	of flag	0x001
		ScriptID    $30A,$1	; Flag set:   Run text script at offset	0x028CD0
					; 0xE2C1: PRINT	MSG 0x030E, MSGBOX CLEARED, END
		ScriptID    $309,$2	; Flag clear: Run text script at offset	0x028CCE
					; 0x7C34: LOAD CUSTOM ACTION 0x34 (0x0121CC CSA_0034), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

CS_001B_2:				; CODE XREF: ROM:000277B0j
		rts
; ---------------------------------------------------------------------------

CS_00CC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $30B,$1	; Run text script at offset 0x028CD2
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0xE2C2: PRINT	MSG 0x030F, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $30D,$3	; Run text script at offset 0x028CD6
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0xE2C3: PRINT	MSG 0x0310, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $30F,$5	; Run text script at offset 0x028CDA
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0xE2C4: PRINT	MSG 0x0311, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $311,$1	; Run text script at offset 0x028CDE
					; 0xE2C5: PRINT	MSG 0x0312, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $312,$3	; Run text script at offset 0x028CE0
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0xE2C6: PRINT	MSG 0x0313, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $314,$1	; Run text script at offset 0x028CE4
					; 0xE2C7: PRINT	MSG 0x0314, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $315,$3	; Run text script at offset 0x028CE6
					; 0xE2C8: PRINT	MSG 0x0315, MSGBOX CLEARED, END
					;
		dc.w $16		; Params 00, 16
		ScriptID    $316,$5	; Run text script at offset 0x028CE8
					; 0xE2C9: PRINT	MSG 0x0316, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CF:
		move.w	#$1B,d0
		bsr.w	TestFlagBit
		beq.s	CS_00CF_3
		move.w	#$F,d0
		bsr.w	TestFlagBit
		bne.s	CS_00CF_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $615,$0	; Run text script at offset 0x0292E6
					; 0x18CF: LOAD CHARACTER SCRIPT	0x00CF
					; 0x8527: PRINT	MSG 0x0574
					; 0xE528: PRINT	MSG 0x0575, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	CS_00CF_2
; ---------------------------------------------------------------------------

CS_00CF_1:				; CODE XREF: ROM:00027802j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $613,$0	; Run text script at offset 0x0292E2
					; 0x18CF: LOAD CHARACTER SCRIPT	0x00CF
					; 0xE526: PRINT	MSG 0x0573, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

CS_00CF_2:				; CODE XREF: ROM:00027808j
		bra.s	CS_00CF_5
; ---------------------------------------------------------------------------

CS_00CF_3:				; CODE XREF: ROM:000277F8j
		move.w	#$1A,d0
		bsr.w	TestFlagBit
		bne.s	CS_00CF_4
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $317,$0	; Run text script at offset 0x028CEA
					; 0x7C38: LOAD CUSTOM ACTION 0x38 (0x0121DC CSA_0038), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	CS_00CF_5
; ---------------------------------------------------------------------------

CS_00CF_4:				; CODE XREF: ROM:00027818j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $618,$0	; Run text script at offset 0x0292EC
					; 0x18CF: LOAD CHARACTER SCRIPT	0x00CF
					; 0xE529: PRINT	MSG 0x0576, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

CS_00CF_5:				; CODE XREF: ROM:CS_00CF_2j
					; ROM:0002781Ej
		rts
; ---------------------------------------------------------------------------

CS_00D0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $318,$1	; Run text script at offset 0x028CEC
					; 0x82CA: PRINT	MSG 0x0317
					; 0xE2CB: PRINT	MSG 0x0318, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $31A,$3	; Run text script at offset 0x028CF0
					; 0xE2CC: PRINT	MSG 0x0319, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $31B,$5	; Run text script at offset 0x028CF2
					; 0x82CD: PRINT	MSG 0x031A
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0x82CE: PRINT	MSG 0x031B
					; 0x82CF: PRINT	MSG 0x031C
					; 0xE2D0: PRINT	MSG 0x031D, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $320,$7	; Run text script at offset 0x028CFC
					; 0xE2D1: PRINT	MSG 0x031E, MSGBOX CLEARED, END
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $321,$9	; Run text script at offset 0x028CFE
					; 0xE2D2: PRINT	MSG 0x031F, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $322,$B	; Run text script at offset 0x028D00
					; 0xE2D3: PRINT	MSG 0x0320, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $323,$1	; Run text script at offset 0x028D02
					; 0x82D4: PRINT	MSG 0x0321
					; 0xE2D5: PRINT	MSG 0x0322, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $325,$3	; Run text script at offset 0x028D06
					; 0x82D6: PRINT	MSG 0x0323
					; 0xE2D7: PRINT	MSG 0x0324, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $327,$5	; Run text script at offset 0x028D0A
					; 0xE2D8: PRINT	MSG 0x0325, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $328,$7	; Run text script at offset 0x028D0C
					; 0xE2D9: PRINT	MSG 0x0326, MSGBOX CLEARED, END
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $329,$9	; Run text script at offset 0x028D0E
					; 0xE2DA: PRINT	MSG 0x0327, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $32A,$B	; Run text script at offset 0x028D10
					; 0xE2DB: PRINT	MSG 0x0328, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001C:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $32B,$0	; Run text script at offset 0x028D12
					; 0xE2DC: PRINT	MSG 0x0329, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00D2:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $32C,$0	; Run text script at offset 0x028D14
					; 0xE2DD: PRINT	MSG 0x032A, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00D3:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $32D,$0	; Run text script at offset 0x028D16
					; 0x82DE: PRINT	MSG 0x032B
					; 0xE2DF: PRINT	MSG 0x032C, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00D4:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $32F,$1	; Run text script at offset 0x028D1A
					; 0xE2E0: PRINT	MSG 0x032D, MSGBOX CLEARED, END
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $330,$3	; Run text script at offset 0x028D1C
					; 0x82E1: PRINT	MSG 0x032E
					; 0xE2E2: PRINT	MSG 0x032F, MSGBOX CLEARED, END
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $32F,$5	; Run text script at offset 0x028D1A
					; 0xE2E0: PRINT	MSG 0x032D, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $332,$7	; Run text script at offset 0x028D20
					; 0xE2E3: PRINT	MSG 0x0330, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptID    $333,$9	; Run text script at offset 0x028D22
					; 0xE2E4: PRINT	MSG 0x0331, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $334,$B	; Run text script at offset 0x028D24
					; 0x82E5: PRINT	MSG 0x0332
					; 0xE2E6: PRINT	MSG 0x0333, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $336,$D	; Run text script at offset 0x028D28
					; 0xE2E7: PRINT	MSG 0x0334, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $337,$F	; Run text script at offset 0x028D2A
					; 0x82E8: PRINT	MSG 0x0335
					; 0xE2E9: PRINT	MSG 0x0336, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $339,$1	; Run text script at offset 0x028D2E
					; 0xE2EA: PRINT	MSG 0x0337, MSGBOX CLEARED, END
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $33A,$3	; Run text script at offset 0x028D30
					; 0x82EB: PRINT	MSG 0x0338
					; 0xE2EC: PRINT	MSG 0x0339, MSGBOX CLEARED, END
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $339,$5	; Run text script at offset 0x028D2E
					; 0xE2EA: PRINT	MSG 0x0337, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $33C,$7	; Run text script at offset 0x028D34
					; 0xE2ED: PRINT	MSG 0x033A, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $33D,$1	; Run text script at offset 0x028D36
					; 0xE2EE: PRINT	MSG 0x033B, MSGBOX CLEARED, END
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $33E,$3	; Run text script at offset 0x028D38
					; 0xE2EF: PRINT	MSG 0x033C, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $33F,$5	; Run text script at offset 0x028D3A
					; 0xE2F0: PRINT	MSG 0x033D, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $340,$7	; Run text script at offset 0x028D3C
					; 0xE2F1: PRINT	MSG 0x033E, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $341,$9	; Run text script at offset 0x028D3E
					; 0xE2F2: PRINT	MSG 0x033F, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $342,$B	; Run text script at offset 0x028D40
					; 0xE2F3: PRINT	MSG 0x0340, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $343,$1	; Run text script at offset 0x028D42
					; 0xE2F4: PRINT	MSG 0x0341, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $344,$3	; Run text script at offset 0x028D44
					; 0xE2F5: PRINT	MSG 0x0342, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $345,$5	; Run text script at offset 0x028D46
					; 0xE2F6: PRINT	MSG 0x0343, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $346,$7	; Run text script at offset 0x028D48
					; 0x82F7: PRINT	MSG 0x0344
					; 0xE2F8: PRINT	MSG 0x0345, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $348,$9	; Run text script at offset 0x028D4C
					; 0xE2F9: PRINT	MSG 0x0346, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D8:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $349,$0	; Run text script at offset 0x028D4E
					; 0xE2FA: PRINT	MSG 0x0347, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00D9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $34A,$1	; Run text script at offset 0x028D50
					; 0xE2FB: PRINT	MSG 0x0348, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $34B,$3	; Run text script at offset 0x028D52
					; 0xE2FC: PRINT	MSG 0x0349, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptID    $34C,$5	; Run text script at offset 0x028D54
					; 0xE2FD: PRINT	MSG 0x034A, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00DA:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $34D,$0	; Run text script at offset 0x028D56
					; 0xE2FE: PRINT	MSG 0x034B, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00DB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $34E,$1	; Run text script at offset 0x028D58
					; 0xE2FF: PRINT	MSG 0x034C, MSGBOX CLEARED, END
					;
		dc.w $19		; Params 00, 19
		ScriptID    $34F,$3	; Run text script at offset 0x028D5A
					; 0xE300: PRINT	MSG 0x034D, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_001D_1,$1 ; Jump	to address 0x027932
					;
		dc.w $C			; Params 00, 0C
		ScriptID    $352,$3	; Run text script at offset 0x028D60
					; 0xE302: PRINT	MSG 0x034F, MSGBOX CLEARED, END
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $353,$5	; Run text script at offset 0x028D62
					; 0xE303: PRINT	MSG 0x0350, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $354,$7	; Run text script at offset 0x028D64
					; 0x8304: PRINT	MSG 0x0351
					; 0xE305: PRINT	MSG 0x0352, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $356,$9	; Run text script at offset 0x028D68
					; 0xE306: PRINT	MSG 0x0353, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $357,$B	; Run text script at offset 0x028D6A
					; 0xE307: PRINT	MSG 0x0354, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001D_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $2A		; Bit 2	of flag	0x005
		ScriptID    $351,$1	; Flag set:   Run text script at offset	0x028D5E
					; 0xE301: PRINT	MSG 0x034E, MSGBOX CLEARED, END
		ScriptID    $350,$2	; Flag clear: Run text script at offset	0x028D5C
					; 0x7C2F: LOAD CUSTOM ACTION 0x2F (0x0121B8 CSA_002F), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00DC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $358,$1	; Run text script at offset 0x028D6C
					; 0x8308: PRINT	MSG 0x0355
					; 0xE309: PRINT	MSG 0x0356, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $35A,$3	; Run text script at offset 0x028D70
					; 0xE30A: PRINT	MSG 0x0357, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $35B,$5	; Run text script at offset 0x028D72
					; 0xE30B: PRINT	MSG 0x0358, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00DD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $35C,$1	; Run text script at offset 0x028D74
					; 0xE30C: PRINT	MSG 0x0359, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $35D,$3	; Run text script at offset 0x028D76
					; 0xE30D: PRINT	MSG 0x035A, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $35E,$5	; Run text script at offset 0x028D78
					; 0xE30E: PRINT	MSG 0x035B, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $35F,$7	; Run text script at offset 0x028D7A
					; 0xE30F: PRINT	MSG 0x035C, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00DE:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $360,$0	; Run text script at offset 0x028D7C
					; 0x8310: PRINT	MSG 0x035D
					; 0xE311: PRINT	MSG 0x035E, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00DF:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $362,$1	; Run text script at offset 0x028D80
					; 0xE312: PRINT	MSG 0x035F, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $363,$3	; Run text script at offset 0x028D82
					; 0xE313: PRINT	MSG 0x0360, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $364,$1	; Run text script at offset 0x028D84
					; 0x8314: PRINT	MSG 0x0361
					; 0xE315: PRINT	MSG 0x0362, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $366,$3	; Run text script at offset 0x028D88
					; 0xE316: PRINT	MSG 0x0363, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $367,$1	; Run text script at offset 0x028D8A
					; 0xE317: PRINT	MSG 0x0364, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $368,$3	; Run text script at offset 0x028D8C
					; 0xE318: PRINT	MSG 0x0365, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E2:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $369,$0	; Run text script at offset 0x028D8E
					; 0xE319: PRINT	MSG 0x0366, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E3:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $36A,$0	; Run text script at offset 0x028D90
					; 0xE31A: PRINT	MSG 0x0367, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E4:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_00E4_1,$1 ; Jump	to address 0x0279C0
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $36D,$3	; Run text script at offset 0x028D96
					; 0xE31C: PRINT	MSG 0x0369, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $36E,$5	; Run text script at offset 0x028D98
					; 0xE31D: PRINT	MSG 0x036A, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptJump  CS_00E4_2,$7 ; Jump	to address 0x0279CC
					;
		dc.w $18		; Params 00, 18
		ScriptID    $372,$9	; Run text script at offset 0x028DA0
					; 0xE31F: PRINT	MSG 0x036C, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $373,$B	; Run text script at offset 0x028DA2
					; 0xE320: PRINT	MSG 0x036D, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E4_1:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $36B,$0	; Run text script at offset 0x028D92
					; 0x14C8: SET BIT 0 OF FLAG 0x019
					; 0xE31B: PRINT	MSG 0x0368, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

CS_00E4_3:				; CODE XREF: ROM:000279FAj
		move.w	#$C6,d0	; 'Æ'
		bra.w	CS_0016_3
; ---------------------------------------------------------------------------

CS_00E4_2:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DC		; Bit 4	of flag	0x01B
		ScriptID    $36F,$1	; Flag clear: Run text script at offset	0x028D9A
					; 0x7CEF: LOAD CUSTOM ACTION 0xEF (0x0124B8 CSA_00EF), MSGBOX CLEARED, END
		ScriptID    $371,$2	; Flag set:   Run text script at offset	0x028D9E
					; 0xE31E: PRINT	MSG 0x036B, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_00E5_1,$1 ; Jump	to address 0x0279F6
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $377,$3	; Run text script at offset 0x028DAA
					; 0xE323: PRINT	MSG 0x0370, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $378,$5	; Run text script at offset 0x028DAC
					; 0xE324: PRINT	MSG 0x0371, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptJump  CS_00E5_2,$7 ; Jump	to address 0x0279FC
					;
		dc.w $18		; Params 00, 18
		ScriptID    $37A,$9	; Run text script at offset 0x028DB0
					; 0xE326: PRINT	MSG 0x0373, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $37B,$B	; Run text script at offset 0x028DB2
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0xE327: PRINT	MSG 0x0374, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E5_1:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $374,$0	; Run text script at offset 0x028DA4
					; 0x14C8: SET BIT 0 OF FLAG 0x019
					; 0x8321: PRINT	MSG 0x036E
					; 0xE322: PRINT	MSG 0x036F, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	CS_00E4_3
; ---------------------------------------------------------------------------

CS_00E5_2:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DC		; Bit 4	of flag	0x01B
		ScriptID    $36F,$1	; Flag clear: Run text script at offset	0x028D9A
					; 0x7CEF: LOAD CUSTOM ACTION 0xEF (0x0124B8 CSA_00EF), MSGBOX CLEARED, END
		ScriptID    $379,$2	; Flag set:   Run text script at offset	0x028DAE
					; 0xE325: PRINT	MSG 0x0372, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E6:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $37D,$0	; Run text script at offset 0x028DB6
					; 0xE328: PRINT	MSG 0x0375, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E7:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $28		; Bit 0	of flag	0x005
		ScriptID    $37F,$1	; Flag set:   Run text script at offset	0x028DBA
					; 0xE329: PRINT	MSG 0x0376, MSGBOX CLEARED, END
		ScriptID    $37E,$2	; Flag clear: Run text script at offset	0x028DB8
					; 0x7C29: LOAD CUSTOM ACTION 0x29 (0x0121A0 CSA_0029), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptJump  CS_001E_1,$1 ; Jump	to address 0x027A38
					;
		dc.w $12		; Params 00, 12
		ScriptID    $44A,$3	; Run text script at offset 0x028F50
					; 0x83E6: PRINT	MSG 0x0433
					; 0xE3E7: PRINT	MSG 0x0434, MSGBOX CLEARED, END
					;
		dc.w $13		; Params 00, 13
		ScriptJump  CS_001E_3,$5 ; Jump	to address 0x027A50
					;
		dc.w $14		; Params 00, 14
		ScriptJump  CS_001E_4,$7 ; Jump	to address 0x027A5C
					;
		dc.w $18		; Params 00, 18
		ScriptJump  CS_001E_5,$9 ; Jump	to address 0x027A68
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  CS_001E_6,$B ; Jump	to address 0x027A74
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001E_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CE		; Bit 6	of flag	0x019
		ScriptID    $447,$1	; Flag clear: Run text script at offset	0x028F4A
					; 0x7C51: LOAD CUSTOM ACTION 0x51 (0x012240 CSA_0051), MSGBOX CLEARED, END
		ScriptJump  CS_001E_2,$2 ; Flag	set:   Jump to address 0x027A44
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_2:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $DB		; Bit 3	of flag	0x01B
		ScriptID    $449,$1	; Flag set:   Run text script at offset	0x028F4E
					; 0x1493: SET BIT 3 OF FLAG 0x012
					; 0x83E6: PRINT	MSG 0x0433
					; 0xE3E7: PRINT	MSG 0x0434, MSGBOX CLEARED, END
		ScriptID    $448,$2	; Flag clear: Run text script at offset	0x028F4C
					; 0xE3E5: PRINT	MSG 0x0432, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_3:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CF		; Bit 7	of flag	0x019
		ScriptID    $44C,$1	; Flag clear: Run text script at offset	0x028F54
					; 0x83E8: PRINT	MSG 0x0435
					; 0x83E9: PRINT	MSG 0x0436
					; 0x83EA: PRINT	MSG 0x0437
					; 0x83EB: PRINT	MSG 0x0438
					; 0x83EC: PRINT	MSG 0x0439
					; 0xE3ED: PRINT	MSG 0x043A, MSGBOX CLEARED, END
		ScriptID    $452,$2	; Flag set:   Run text script at offset	0x028F60
					; 0xE3EE: PRINT	MSG 0x043B, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_4:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D1		; Bit 1	of flag	0x01A
		ScriptID    $453,$1	; Flag clear: Run text script at offset	0x028F62
					; 0x83EF: PRINT	MSG 0x043C
					; 0x83F0: PRINT	MSG 0x043D
					; 0x83F1: PRINT	MSG 0x043E
					; 0x83F2: PRINT	MSG 0x043F
					; 0xE3F3: PRINT	MSG 0x0440, MSGBOX CLEARED, END
		ScriptID    $457,$2	; Flag set:   Run text script at offset	0x028F6A
					; 0xE3F3: PRINT	MSG 0x0440, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_5:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D5		; Bit 5	of flag	0x01A
		ScriptID    $458,$1	; Flag clear: Run text script at offset	0x028F6C
					; 0x7CB5: LOAD CUSTOM ACTION 0xB5 (0x0123D0 CSA_00B5), MSGBOX CLEARED, END
		ScriptID    $459,$2	; Flag set:   Run text script at offset	0x028F6E
					; 0xE3F4: PRINT	MSG 0x0441, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_6:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DE		; Bit 6	of flag	0x01B
		ScriptID    $45A,$1	; Flag clear: Run text script at offset	0x028F70
					; 0x83F5: PRINT	MSG 0x0442
					; 0x83F6: PRINT	MSG 0x0443
					; 0x83F7: PRINT	MSG 0x0444
					; 0x83F8: PRINT	MSG 0x0445
					; 0x83F9: PRINT	MSG 0x0446
					; 0x83FA: PRINT	MSG 0x0447
					; 0x83FB: PRINT	MSG 0x0448
					; 0x0016: LOAD 0x0016 INTO 0xFF1196
					; 0x17E8: RECEIVE ITEM [0xFF1196]
					; 0x181E: LOAD CHARACTER SCRIPT	0x001E
					; 0xE3FC: PRINT	MSG 0x0449, MSGBOX CLEARED, END
		ScriptJump  CS_001E_7,$2 ; Flag	set:   Jump to address 0x027A80
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_7:
		move.w	#$16,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	CS_001E_8
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $463,$0	; Run text script at offset 0x028F82
					; 0x181E: LOAD CHARACTER SCRIPT	0x001E
					; 0xE3FC: PRINT	MSG 0x0449, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	CS_001E_9
; ---------------------------------------------------------------------------

CS_001E_8:				; CODE XREF: ROM:00027A88j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $465,$0	; Run text script at offset 0x028F86
					; 0x83FD: PRINT	MSG 0x044A
					; 0x0016: LOAD 0x0016 INTO 0xFF1196
					; 0x77E8: RECEIVE ITEM [0xFF1196], MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

CS_001E_9:				; CODE XREF: ROM:00027A8Ej
		rts
; ---------------------------------------------------------------------------

CS_00E9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $A			; Params 00, 0A
		ScriptID    $380,$1	; Run text script at offset 0x028DBC
					; 0x7C39: LOAD CUSTOM ACTION 0x39 (0x0121E0 CSA_0039), MSGBOX CLEARED, END
					;
		dc.w $C			; Params 00, 0C
		ScriptID    $62B,$3	; Run text script at offset 0x029312
					; 0xE532: PRINT	MSG 0x057F, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $381,$1	; Run text script at offset 0x028DBE
					; 0xE32A: PRINT	MSG 0x0377, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $382,$3	; Run text script at offset 0x028DC0
					; 0xE32B: PRINT	MSG 0x0378, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $383,$5	; Run text script at offset 0x028DC2
					; 0xE32C: PRINT	MSG 0x0379, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00EA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $384,$1	; Run text script at offset 0x028DC4
					; 0xE32D: PRINT	MSG 0x037A, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $385,$3	; Run text script at offset 0x028DC6
					; 0x832E: PRINT	MSG 0x037B
					; 0xE32F: PRINT	MSG 0x037C, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $387,$5	; Run text script at offset 0x028DCA
					; 0x8330: PRINT	MSG 0x037D
					; 0xE331: PRINT	MSG 0x037E, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00EB:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $389,$0	; Run text script at offset 0x028DCE
					; 0xE332: PRINT	MSG 0x037F, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00EC:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $38A,$0	; Run text script at offset 0x028DD0
					; 0xE333: PRINT	MSG 0x0380, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00ED:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $38B,$1	; Run text script at offset 0x028DD2
					; 0xE334: PRINT	MSG 0x0381, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $38C,$3	; Run text script at offset 0x028DD4
					; 0xE335: PRINT	MSG 0x0382, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $38D,$5	; Run text script at offset 0x028DD6
					; 0x7CD2: LOAD CUSTOM ACTION 0xD2 (0x012444 CSA_00D2), MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00EE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $38E,$1	; Run text script at offset 0x028DD8
					; 0x8336: PRINT	MSG 0x0383
					; 0xE337: PRINT	MSG 0x0384, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $390,$3	; Run text script at offset 0x028DDC
					; 0xE338: PRINT	MSG 0x0385, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $391,$5	; Run text script at offset 0x028DDE
					; 0xE339: PRINT	MSG 0x0386, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00EF:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $392,$1	; Run text script at offset 0x028DE0
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0x833A: PRINT	MSG 0x0387
					; 0xE33B: PRINT	MSG 0x0388, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $395,$3	; Run text script at offset 0x028DE6
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0x833C: PRINT	MSG 0x0389
					; 0xE33D: PRINT	MSG 0x038A, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $398,$5	; Run text script at offset 0x028DEC
					; 0xE33E: PRINT	MSG 0x038B, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_00F0_2,$1 ; Jump	to address 0x027B2C
					;
		dc.w $101		; Params 01, 01
		ScriptID    $399,$3	; Run text script at offset 0x028DEE
					; 0xE33F: PRINT	MSG 0x038C, MSGBOX CLEARED, END
					;
		dc.w $102		; Params 01, 02
		ScriptJump  CS_00F0_1,$5 ; Jump	to address 0x027B20
					;
		dc.w $103		; Params 01, 03
		ScriptID    $39C,$7	; Run text script at offset 0x028DF4
					; 0xE341: PRINT	MSG 0x038E, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F0_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $A5		; Bit 5	of flag	0x014
		ScriptID    $39B,$1	; Flag set:   Run text script at offset	0x028DF2
					; 0xE340: PRINT	MSG 0x038D, MSGBOX CLEARED, END
		ScriptID    $39A,$2	; Flag clear: Run text script at offset	0x028DF0
					; 0x7C6D: LOAD CUSTOM ACTION 0x6D (0x0122B0 CSA_006D), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F0_2:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $39D,$0	; Prompt:	Run text script	at offset 0x028DF6
					; 0xA342: PRINT	MSG 0x038F, END
		ScriptID    $39E,$1	; Answer 'yes': Run text script at offset 0x028DF8
					; 0x8343: PRINT	MSG 0x0390
					; 0xE344: PRINT	MSG 0x0391, MSGBOX CLEARED, END
		ScriptID    $3A0,$2	; Answer 'no':  Run text script at offset 0x028DFC
					; 0x8345: PRINT	MSG 0x0392
					; 0x8346: PRINT	MSG 0x0393
					; 0xE347: PRINT	MSG 0x0394, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F1:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3A3,$0	; Run text script at offset 0x028E02
					; 0xE348: PRINT	MSG 0x0395, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F2:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $3AD,$1	; Run text script at offset 0x028E16
					; 0xE350: PRINT	MSG 0x039D, MSGBOX CLEARED, END
					;
		dc.w $16		; Params 00, 16
		ScriptID    $3AE,$3	; Run text script at offset 0x028E18
					; 0x8351: PRINT	MSG 0x039E
					; 0xE352: PRINT	MSG 0x039F, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F3:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $A4		; Bit 4	of flag	0x014
		ScriptJump  CS_00F3_1,$1 ; Flag	set:   Jump to address 0x027B58
		ScriptID    $3A4,$2	; Flag clear: Run text script at offset	0x028E04
					; 0x7C6A: LOAD CUSTOM ACTION 0x6A (0x0122A4 CSA_006A), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F3_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $D2		; Bit 2	of flag	0x01A
		ScriptID    $3A6,$1	; Flag set:   Run text script at offset	0x028E08
					; 0xE34A: PRINT	MSG 0x0397, MSGBOX CLEARED, END
		ScriptID    $3A5,$2	; Flag clear: Run text script at offset	0x028E06
					; 0xE349: PRINT	MSG 0x0396, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F4:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $3A7,$1	; Run text script at offset 0x028E0A
					; 0xE34B: PRINT	MSG 0x0398, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $3A8,$3	; Run text script at offset 0x028E0C
					; 0xE34C: PRINT	MSG 0x0399, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $3A9,$5	; Run text script at offset 0x028E0E
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0xE34D: PRINT	MSG 0x039A, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F5:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3AB,$0	; Run text script at offset 0x028E12
					; 0x834E: PRINT	MSG 0x039B
					; 0xE34F: PRINT	MSG 0x039C, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0020:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2A9,$0	; Run text script at offset 0x028C0E
					; 0xE265: PRINT	MSG 0x02B2, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $3B0,$1	; Run text script at offset 0x028E1C
					; 0xE353: PRINT	MSG 0x03A0, MSGBOX CLEARED, END
					;
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_00F6_1,$3 ; Jump	to address 0x027B90
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F6_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $D9		; Bit 1	of flag	0x01B
		ScriptID    $84B,$1	; Flag set:   Run text script at offset	0x029752
					; 0x18F6: LOAD CHARACTER SCRIPT	0x00F6
					; 0xE681: PRINT	MSG 0x06CE, MSGBOX CLEARED, END
		ScriptID    $3B1,$2	; Flag clear: Run text script at offset	0x028E1E
					; 0x7CD1: LOAD CUSTOM ACTION 0xD1 (0x012440 CSA_00D1), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F7:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3B2,$0	; Run text script at offset 0x028E20
					; 0xE354: PRINT	MSG 0x03A1, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $F			; Params 00, 0F
		ScriptID    $3B3,$1	; Run text script at offset 0x028E22
					; 0xE355: PRINT	MSG 0x03A2, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptJump  CS_00F8_1,$3 ; Jump	to address 0x027BC0
					;
		dc.w $17		; Params 00, 17
		ScriptID    $3B7,$5	; Run text script at offset 0x028E2A
					; 0xE359: PRINT	MSG 0x03A6, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptJump  CS_00F8_2,$7 ; Jump	to address 0x027BCC
					;
		dc.w $19		; Params 00, 19
		ScriptID    $3BB,$9	; Run text script at offset 0x028E32
					; 0xE35D: PRINT	MSG 0x03AA, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $3BC,$B	; Run text script at offset 0x028E34
					; 0x835E: PRINT	MSG 0x03AB
					; 0xE35F: PRINT	MSG 0x03AC, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F8_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D4		; Bit 4	of flag	0x01A
		ScriptID    $3B4,$1	; Flag clear: Run text script at offset	0x028E24
					; 0x8356: PRINT	MSG 0x03A3
					; 0xE357: PRINT	MSG 0x03A4, MSGBOX CLEARED, END
		ScriptID    $3B6,$2	; Flag set:   Run text script at offset	0x028E28
					; 0xE358: PRINT	MSG 0x03A5, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F8_2:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E8		; Bit 0	of flag	0x01D
		ScriptID    $3B8,$1	; Flag clear: Run text script at offset	0x028E2C
					; 0x835A: PRINT	MSG 0x03A7
					; 0xE35B: PRINT	MSG 0x03A8, MSGBOX CLEARED, END
		ScriptID    $3BA,$2	; Flag set:   Run text script at offset	0x028E30
					; 0xE35C: PRINT	MSG 0x03A9, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $F			; Params 00, 0F
		ScriptID    $3BE,$1	; Run text script at offset 0x028E38
					; 0x8360: PRINT	MSG 0x03AD
					; 0xE361: PRINT	MSG 0x03AE, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $3C0,$3	; Run text script at offset 0x028E3C
					; 0xE362: PRINT	MSG 0x03AF, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptID    $3C1,$5	; Run text script at offset 0x028E3E
					; 0xE363: PRINT	MSG 0x03B0, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $3C2,$7	; Run text script at offset 0x028E40
					; 0x8364: PRINT	MSG 0x03B1
					; 0xE365: PRINT	MSG 0x03B2, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $3C4,$9	; Run text script at offset 0x028E44
					; 0xE366: PRINT	MSG 0x03B3, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $F			; Params 00, 0F
		ScriptID    $3C7,$1	; Run text script at offset 0x028E4A
					; 0xE369: PRINT	MSG 0x03B6, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $3C8,$3	; Run text script at offset 0x028E4C
					; 0x836A: PRINT	MSG 0x03B7
					; 0xE36B: PRINT	MSG 0x03B8, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptID    $3CA,$5	; Run text script at offset 0x028E50
					; 0xE36C: PRINT	MSG 0x03B9, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $3CB,$7	; Run text script at offset 0x028E52
					; 0x836D: PRINT	MSG 0x03BA
					; 0xE36E: PRINT	MSG 0x03BB, MSGBOX CLEARED, END
					;
		dc.w $19		; Params 00, 19
		ScriptID    $3CD,$9	; Run text script at offset 0x028E56
					; 0xE36F: PRINT	MSG 0x03BC, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $3CE,$1	; Run text script at offset 0x028E58
					; 0xE370: PRINT	MSG 0x03BD, MSGBOX CLEARED, END
					;
		dc.w $12		; Params 00, 12
		ScriptID    $3CF,$3	; Run text script at offset 0x028E5A
					; 0xE371: PRINT	MSG 0x03BE, MSGBOX CLEARED, END
					;
		dc.w $13		; Params 00, 13
		ScriptID    $3D0,$5	; Run text script at offset 0x028E5C
					; 0x8372: PRINT	MSG 0x03BF
					; 0xE373: PRINT	MSG 0x03C0, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $3D2,$7	; Run text script at offset 0x028E60
					; 0xE374: PRINT	MSG 0x03C1, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptID    $3D3,$9	; Run text script at offset 0x028E62
					; 0xE375: PRINT	MSG 0x03C2, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $3D4,$1	; Run text script at offset 0x028E64
					; 0xE376: PRINT	MSG 0x03C3, MSGBOX CLEARED, END
					;
		dc.w $12		; Params 00, 12
		ScriptID    $3D5,$3	; Run text script at offset 0x028E66
					; 0xE377: PRINT	MSG 0x03C4, MSGBOX CLEARED, END
					;
		dc.w $13		; Params 00, 13
		ScriptID    $3D6,$5	; Run text script at offset 0x028E68
					; 0xE378: PRINT	MSG 0x03C5, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $3D7,$7	; Run text script at offset 0x028E6A
					; 0xE379: PRINT	MSG 0x03C6, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptID    $3D8,$9	; Run text script at offset 0x028E6C
					; 0xE37A: PRINT	MSG 0x03C7, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $3D9,$1	; Run text script at offset 0x028E6E
					; 0xE37B: PRINT	MSG 0x03C8, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptJump  CS_00FD_1,$3 ; Jump	to address 0x027C4E
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FD_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $A1		; Bit 1	of flag	0x014
		ScriptID    $3DA,$1	; Flag set:   Run text script at offset	0x028E70
					; 0x837C: PRINT	MSG 0x03C9
					; 0xE37D: PRINT	MSG 0x03CA, MSGBOX CLEARED, END
		ScriptID    $3D9,$2	; Flag clear: Run text script at offset	0x028E6E
					; 0xE37B: PRINT	MSG 0x03C8, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00FE:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CB		; Bit 3	of flag	0x019
		ScriptID    $3DC,$1	; Flag clear: Run text script at offset	0x028E74
					; 0x837E: PRINT	MSG 0x03CB
					; 0x837F: PRINT	MSG 0x03CC
					; 0xE380: PRINT	MSG 0x03CD, MSGBOX CLEARED, END
		ScriptID    $3DF,$2	; Flag set:   Run text script at offset	0x028E7A
					; 0xE381: PRINT	MSG 0x03CE, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00FF:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptJump  CS_00FF_1,$1 ; Jump	to address 0x027C74
					;
		dc.w $12		; Params 00, 12
		ScriptID    $3E4,$3	; Run text script at offset 0x028E84
					; 0x8386: PRINT	MSG 0x03D3
					; 0xE387: PRINT	MSG 0x03D4, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FF_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CC		; Bit 4	of flag	0x019
		ScriptID    $3E0,$1	; Flag clear: Run text script at offset	0x028E7C
					; 0x8382: PRINT	MSG 0x03CF
					; 0x8383: PRINT	MSG 0x03D0
					; 0xE384: PRINT	MSG 0x03D1, MSGBOX CLEARED, END
		ScriptID    $3E3,$2	; Flag set:   Run text script at offset	0x028E82
					; 0xE385: PRINT	MSG 0x03D2, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0100:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $3E6,$1	; Run text script at offset 0x028E88
					; 0xE388: PRINT	MSG 0x03D5, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $3E7,$3	; Run text script at offset 0x028E8A
					; 0xE389: PRINT	MSG 0x03D6, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0101:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $10		; Params 00, 10
		ScriptID    $3E8,$1	; Run text script at offset 0x028E8C
					; 0x7C50: LOAD CUSTOM ACTION 0x50 (0x01223C CSA_0050), MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $3E9,$3	; Run text script at offset 0x028E8E
					; 0xE38A: PRINT	MSG 0x03D7, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0102:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3EA,$0	; Run text script at offset 0x028E90
					; 0xE38B: PRINT	MSG 0x03D8, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0021:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $10		; Params 00, 10
		ScriptJump  CS_0021_1,$1 ; Jump	to address 0x027CB0
					;
		dc.w $13		; Params 00, 13
		ScriptID    $3EE,$3	; Run text script at offset 0x028E98
					; 0xE38F: PRINT	MSG 0x03DC, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0021_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CA		; Bit 2	of flag	0x019
		ScriptID    $3EB,$1	; Flag clear: Run text script at offset	0x028E92
					; 0x838C: PRINT	MSG 0x03D9
					; 0x838D: PRINT	MSG 0x03DA
					; 0xE38E: PRINT	MSG 0x03DB, MSGBOX CLEARED, END
		ScriptID    $3ED,$2	; Flag set:   Run text script at offset	0x028E96
					; 0xE38E: PRINT	MSG 0x03DB, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0103:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $3FE,$1	; Run text script at offset 0x028EB8
					; 0xE39E: PRINT	MSG 0x03EB, MSGBOX CLEARED, END
					;
		dc.w $12		; Params 00, 12
		ScriptID    $3FF,$3	; Run text script at offset 0x028EBA
					; 0xE39F: PRINT	MSG 0x03EC, MSGBOX CLEARED, END
					;
		dc.w $13		; Params 00, 13
		ScriptID    $400,$5	; Run text script at offset 0x028EBC
					; 0xE3A0: PRINT	MSG 0x03ED, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $401,$7	; Run text script at offset 0x028EBE
					; 0xE3A1: PRINT	MSG 0x03EE, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0104:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $402,$1	; Run text script at offset 0x028EC0
					; 0xE3A2: PRINT	MSG 0x03EF, MSGBOX CLEARED, END
					;
		dc.w $12		; Params 00, 12
		ScriptID    $403,$3	; Run text script at offset 0x028EC2
					; 0xE3A3: PRINT	MSG 0x03F0, MSGBOX CLEARED, END
					;
		dc.w $13		; Params 00, 13
		ScriptID    $404,$5	; Run text script at offset 0x028EC4
					; 0xE3A4: PRINT	MSG 0x03F1, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $405,$7	; Run text script at offset 0x028EC6
					; 0xE3A5: PRINT	MSG 0x03F2, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0105:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $406,$1	; Run text script at offset 0x028EC8
					; 0xE3A6: PRINT	MSG 0x03F3, MSGBOX CLEARED, END
					;
		dc.w $12		; Params 00, 12
		ScriptID    $407,$3	; Run text script at offset 0x028ECA
					; 0xE3A7: PRINT	MSG 0x03F4, MSGBOX CLEARED, END
					;
		dc.w $13		; Params 00, 13
		ScriptID    $408,$5	; Run text script at offset 0x028ECC
					; 0xE3A8: PRINT	MSG 0x03F5, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $409,$7	; Run text script at offset 0x028ECE
					; 0xE3A9: PRINT	MSG 0x03F6, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0106:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $40A,$1	; Run text script at offset 0x028ED0
					; 0xE3AA: PRINT	MSG 0x03F7, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $40B,$3	; Run text script at offset 0x028ED2
					; 0xE3AB: PRINT	MSG 0x03F8, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0107:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $40C,$1	; Run text script at offset 0x028ED4
					; 0xE3AC: PRINT	MSG 0x03F9, MSGBOX CLEARED, END
					;
		dc.w $12		; Params 00, 12
		ScriptID    $40D,$3	; Run text script at offset 0x028ED6
					; 0xE3AD: PRINT	MSG 0x03FA, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $40E,$5	; Run text script at offset 0x028ED8
					; 0xE3AE: PRINT	MSG 0x03FB, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0108:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $40F,$1	; Run text script at offset 0x028EDA
					; 0xE3AF: PRINT	MSG 0x03FC, MSGBOX CLEARED, END
					;
		dc.w $12		; Params 00, 12
		ScriptID    $410,$3	; Run text script at offset 0x028EDC
					; 0xE3B0: PRINT	MSG 0x03FD, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $411,$5	; Run text script at offset 0x028EDE
					; 0xE3B1: PRINT	MSG 0x03FE, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0109:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $412,$1	; Run text script at offset 0x028EE0
					; 0xE3B2: PRINT	MSG 0x03FF, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $413,$3	; Run text script at offset 0x028EE2
					; 0xE3B3: PRINT	MSG 0x0400, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $414,$5	; Run text script at offset 0x028EE4
					; 0x83B4: PRINT	MSG 0x0401
					; 0xE3B5: PRINT	MSG 0x0402, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $416,$1	; Run text script at offset 0x028EE8
					; 0x83B6: PRINT	MSG 0x0403
					; 0xE3B7: PRINT	MSG 0x0404, MSGBOX CLEARED, END
					;
		dc.w $12		; Params 00, 12
		ScriptID    $418,$3	; Run text script at offset 0x028EEC
					; 0xE3B8: PRINT	MSG 0x0405, MSGBOX CLEARED, END
					;
		dc.w $13		; Params 00, 13
		ScriptID    $419,$5	; Run text script at offset 0x028EEE
					; 0xE3B9: PRINT	MSG 0x0406, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $41A,$1	; Run text script at offset 0x028EF0
					; 0x83BA: PRINT	MSG 0x0407
					; 0xE3BB: PRINT	MSG 0x0408, MSGBOX CLEARED, END
					;
		dc.w $13		; Params 00, 13
		ScriptID    $41C,$3	; Run text script at offset 0x028EF4
					; 0x83BC: PRINT	MSG 0x0409
					; 0xE3BD: PRINT	MSG 0x040A, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $41E,$5	; Run text script at offset 0x028EF8
					; 0xE3BE: PRINT	MSG 0x040B, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $41F,$1	; Run text script at offset 0x028EFA
					; 0x83BF: PRINT	MSG 0x040C
					; 0xE3C0: PRINT	MSG 0x040D, MSGBOX CLEARED, END
					;
		dc.w $13		; Params 00, 13
		ScriptID    $421,$3	; Run text script at offset 0x028EFE
					; 0xE3C1: PRINT	MSG 0x040E, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $422,$5	; Run text script at offset 0x028F00
					; 0x83C2: PRINT	MSG 0x040F
					; 0xE3C3: PRINT	MSG 0x0410, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptJump  CS_010D_1,$1 ; Jump	to address 0x027D8A
					;
		dc.w $12		; Params 00, 12
		ScriptID    $427,$3	; Run text script at offset 0x028F0A
					; 0xE3C7: PRINT	MSG 0x0414, MSGBOX CLEARED, END
					;
		dc.w $13		; Params 00, 13
		ScriptID    $428,$5	; Run text script at offset 0x028F0C
					; 0xE3C8: PRINT	MSG 0x0415, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010D_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CD		; Bit 5	of flag	0x019
		ScriptID    $424,$1	; Flag clear: Run text script at offset	0x028F04
					; 0x83C4: PRINT	MSG 0x0411
					; 0xE3C5: PRINT	MSG 0x0412, MSGBOX CLEARED, END
		ScriptID    $426,$2	; Flag set:   Run text script at offset	0x028F08
					; 0xE3C6: PRINT	MSG 0x0413, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_010E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $429,$1	; Run text script at offset 0x028F0E
					; 0xE3C9: PRINT	MSG 0x0416, MSGBOX CLEARED, END
					;
		dc.w $13		; Params 00, 13
		ScriptID    $42A,$3	; Run text script at offset 0x028F10
					; 0xE3CA: PRINT	MSG 0x0417, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $42B,$5	; Run text script at offset 0x028F12
					; 0x83CB: PRINT	MSG 0x0418
					; 0xE3CC: PRINT	MSG 0x0419, MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $42D,$7	; Run text script at offset 0x028F16
					; 0xE3CD: PRINT	MSG 0x041A, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $42E,$1	; Run text script at offset 0x028F18
					; 0xE3CE: PRINT	MSG 0x041B, MSGBOX CLEARED, END
					;
		dc.w $13		; Params 00, 13
		ScriptID    $42F,$3	; Run text script at offset 0x028F1A
					; 0x83CF: PRINT	MSG 0x041C
					; 0xE3D0: PRINT	MSG 0x041D, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0110:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $431,$1	; Run text script at offset 0x028F1E
					; 0xE3D1: PRINT	MSG 0x041E, MSGBOX CLEARED, END
					;
		dc.w $13		; Params 00, 13
		ScriptID    $432,$3	; Run text script at offset 0x028F20
					; 0xE3D2: PRINT	MSG 0x041F, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0111:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptJump  CS_0111_1,$1 ; Jump	to address 0x027DDA
					;
		dc.w $12		; Params 00, 12
		ScriptID    $437,$3	; Run text script at offset 0x028F2A
					; 0xE3D5: PRINT	MSG 0x0422, MSGBOX CLEARED, END
					;
		dc.w $13		; Params 00, 13
		ScriptID    $438,$5	; Run text script at offset 0x028F2C
					; 0xE3D6: PRINT	MSG 0x0423, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0111_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $CE		; Bit 6	of flag	0x019
		ScriptID    $435,$1	; Flag set:   Run text script at offset	0x028F26
					; 0x1493: SET BIT 3 OF FLAG 0x012
					; 0xE3D4: PRINT	MSG 0x0421, MSGBOX CLEARED, END
		ScriptID    $433,$2	; Flag clear: Run text script at offset	0x028F22
					; 0x14DB: SET BIT 3 OF FLAG 0x01B
					; 0xE3D3: PRINT	MSG 0x0420, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0112:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $439,$0	; Run text script at offset 0x028F2E
					; 0x83D7: PRINT	MSG 0x0424
					; 0xE3D8: PRINT	MSG 0x0425, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0113:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $43B,$0	; Run text script at offset 0x028F32
					; 0x83D9: PRINT	MSG 0x0426
					; 0xE3DA: PRINT	MSG 0x0427, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0114:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $43D,$0	; Run text script at offset 0x028F36
					; 0xE3DB: PRINT	MSG 0x0428, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0115:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $43E,$1	; Run text script at offset 0x028F38
					; 0x83DC: PRINT	MSG 0x0429
					; 0xE3DD: PRINT	MSG 0x042A, MSGBOX CLEARED, END
					;
		dc.w $13		; Params 00, 13
		ScriptID    $440,$3	; Run text script at offset 0x028F3C
					; 0xE3DE: PRINT	MSG 0x042B, MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $441,$5	; Run text script at offset 0x028F3E
					; 0x83DF: PRINT	MSG 0x042C
					; 0xE3E0: PRINT	MSG 0x042D, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0116:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $443,$0	; Run text script at offset 0x028F42
					; 0xE3E1: PRINT	MSG 0x042E, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0117:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $444,$0	; Run text script at offset 0x028F44
					; 0xE3E2: PRINT	MSG 0x042F, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0118:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $445,$0	; Run text script at offset 0x028F46
					; 0xE3E3: PRINT	MSG 0x0430, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0119:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $446,$0	; Run text script at offset 0x028F48
					; 0xE3E4: PRINT	MSG 0x0431, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011A:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3C5,$0	; Run text script at offset 0x028E46
					; 0xE367: PRINT	MSG 0x03B4, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011B:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3C6,$0	; Run text script at offset 0x028E48
					; 0xE368: PRINT	MSG 0x03B5, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011C:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $468,$0	; Run text script at offset 0x028F8C
					; 0xE3FE: PRINT	MSG 0x044B, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0022:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $17		; Params 00, 17
		ScriptID    $477,$1	; Run text script at offset 0x028FAA
					; 0x7CA5: LOAD CUSTOM ACTION 0xA5 (0x012390 CSA_00A5), MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $79D,$3	; Run text script at offset 0x0295F6
					; 0xE620: PRINT	MSG 0x066D, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_011D:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D0		; Bit 0	of flag	0x01A
		ScriptID    $478,$1	; Flag clear: Run text script at offset	0x028FAC
					; 0x840C: PRINT	MSG 0x0459
					; 0xE40D: PRINT	MSG 0x045A, MSGBOX CLEARED, END
		ScriptID    $479,$2	; Flag set:   Run text script at offset	0x028FAE
					; 0xE40D: PRINT	MSG 0x045A, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $499,$1	; Run text script at offset 0x028FEE
					; 0x8426: PRINT	MSG 0x0473
					; 0x8427: PRINT	MSG 0x0474
					; 0xE428: PRINT	MSG 0x0475, MSGBOX CLEARED, END
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $49C,$3	; Run text script at offset 0x028FF4
					; 0xE429: PRINT	MSG 0x0476, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0023:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $49D,$1	; Run text script at offset 0x028FF6
					; 0xE42A: PRINT	MSG 0x0477, MSGBOX CLEARED, END
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $49E,$3	; Run text script at offset 0x028FF8
					; 0xE42B: PRINT	MSG 0x0478, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_011F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $49F,$1	; Run text script at offset 0x028FFA
					; 0xE42C: PRINT	MSG 0x0479, MSGBOX CLEARED, END
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $4A0,$3	; Run text script at offset 0x028FFC
					; 0xE42D: PRINT	MSG 0x047A, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0120:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0120_1,$1 ; Jump	to address 0x027E86
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $4A6,$3	; Run text script at offset 0x029008
					; 0xE433: PRINT	MSG 0x0480, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0120_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $135		; Bit 5	of flag	0x026
		ScriptID    $4A2,$1	; Flag set:   Run text script at offset	0x029000
					; 0x842F: PRINT	MSG 0x047C
					; 0x8430: PRINT	MSG 0x047D
					; 0x8431: PRINT	MSG 0x047E
					; 0xE432: PRINT	MSG 0x047F, MSGBOX CLEARED, END
		ScriptID    $4A1,$2	; Flag clear: Run text script at offset	0x028FFE
					; 0xE42E: PRINT	MSG 0x047B, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0121:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0121_1,$1 ; Jump	to address 0x027EA0
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $4AA,$3	; Run text script at offset 0x029010
					; 0xE437: PRINT	MSG 0x0484, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0121_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $135		; Bit 5	of flag	0x026
		ScriptID    $4A8,$1	; Flag set:   Run text script at offset	0x02900C
					; 0x8435: PRINT	MSG 0x0482
					; 0xE436: PRINT	MSG 0x0483, MSGBOX CLEARED, END
		ScriptID    $4A7,$2	; Flag clear: Run text script at offset	0x02900A
					; 0xE434: PRINT	MSG 0x0481, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0122:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0122_1,$1 ; Jump	to address 0x027EBA
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $4AD,$3	; Run text script at offset 0x029016
					; 0xE43A: PRINT	MSG 0x0487, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0122_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $135		; Bit 5	of flag	0x026
		ScriptID    $4AC,$1	; Flag set:   Run text script at offset	0x029014
					; 0xE439: PRINT	MSG 0x0486, MSGBOX CLEARED, END
		ScriptID    $4AB,$2	; Flag clear: Run text script at offset	0x029012
					; 0xE438: PRINT	MSG 0x0485, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0123:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0123_1,$1 ; Jump	to address 0x027ED4
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $4B1,$3	; Run text script at offset 0x02901E
					; 0x843E: PRINT	MSG 0x048B
					; 0xE43F: PRINT	MSG 0x048C, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0123_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $136		; Bit 6	of flag	0x026
		ScriptID    $4AF,$1	; Flag set:   Run text script at offset	0x02901A
					; 0x843C: PRINT	MSG 0x0489
					; 0xE43D: PRINT	MSG 0x048A, MSGBOX CLEARED, END
		ScriptID    $4AE,$2	; Flag clear: Run text script at offset	0x029018
					; 0xE43B: PRINT	MSG 0x0488, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0124:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $4B3,$1	; Run text script at offset 0x029022
					; 0xE440: PRINT	MSG 0x048D, MSGBOX CLEARED, END
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $4B4,$3	; Run text script at offset 0x029024
					; 0x8441: PRINT	MSG 0x048E
					; 0xE442: PRINT	MSG 0x048F, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0125:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0125_1,$1 ; Jump	to address 0x027EFC
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $4B8,$3	; Run text script at offset 0x02902C
					; 0x8445: PRINT	MSG 0x0492
					; 0xE446: PRINT	MSG 0x0493, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0125_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $136		; Bit 6	of flag	0x026
		ScriptID    $4B7,$1	; Flag set:   Run text script at offset	0x02902A
					; 0xE444: PRINT	MSG 0x0491, MSGBOX CLEARED, END
		ScriptID    $4B6,$2	; Flag clear: Run text script at offset	0x029028
					; 0xE443: PRINT	MSG 0x0490, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0126:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0126_1,$1 ; Jump	to address 0x027F16
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $4BE,$3	; Run text script at offset 0x029038
					; 0x844B: PRINT	MSG 0x0498
					; 0xE44C: PRINT	MSG 0x0499, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0126_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $137		; Bit 7	of flag	0x026
		ScriptID    $4BB,$1	; Flag set:   Run text script at offset	0x029032
					; 0x8448: PRINT	MSG 0x0495
					; 0x8449: PRINT	MSG 0x0496
					; 0xE44A: PRINT	MSG 0x0497, MSGBOX CLEARED, END
		ScriptID    $4BA,$2	; Flag clear: Run text script at offset	0x029030
					; 0xE447: PRINT	MSG 0x0494, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0127:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0127_1,$1 ; Jump	to address 0x027F30
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $4C2,$3	; Run text script at offset 0x029040
					; 0x7CDF: LOAD CUSTOM ACTION 0xDF (0x012478 CSA_00DF), MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0127_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $137		; Bit 7	of flag	0x026
		ScriptID    $4C1,$1	; Flag set:   Run text script at offset	0x02903E
					; 0xE44E: PRINT	MSG 0x049B, MSGBOX CLEARED, END
		ScriptID    $4C0,$2	; Flag clear: Run text script at offset	0x02903C
					; 0xE44D: PRINT	MSG 0x049A, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0128:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0128_1,$1 ; Jump	to address 0x027F4A
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $4C5,$3	; Run text script at offset 0x029046
					; 0xE451: PRINT	MSG 0x049E, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0128_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $137		; Bit 7	of flag	0x026
		ScriptJump  CS_0128_2,$1 ; Flag	set:   Jump to address 0x027F56
		ScriptID    $4C3,$2	; Flag clear: Run text script at offset	0x029042
					; 0xE44F: PRINT	MSG 0x049C, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0128_2:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $13D		; Bit 5	of flag	0x027
		ScriptID    $862,$1	; Flag set:   Run text script at offset	0x029780
					; 0x1928: LOAD CHARACTER SCRIPT	0x0128
					; 0xE691: PRINT	MSG 0x06DE, MSGBOX CLEARED, END
		ScriptID    $4C4,$2	; Flag clear: Run text script at offset	0x029044
					; 0xE450: PRINT	MSG 0x049D, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0129:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $4C6,$1	; Run text script at offset 0x029048
					; 0xE452: PRINT	MSG 0x049F, MSGBOX CLEARED, END
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $4C7,$3	; Run text script at offset 0x02904A
					; 0x8453: PRINT	MSG 0x04A0
					; 0xE454: PRINT	MSG 0x04A1, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_012A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $4C9,$1	; Run text script at offset 0x02904E
					; 0xE455: PRINT	MSG 0x04A2, MSGBOX CLEARED, END
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $4CA,$3	; Run text script at offset 0x029050
					; 0x8456: PRINT	MSG 0x04A3
					; 0xE457: PRINT	MSG 0x04A4, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_012B:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4CC,$0	; Run text script at offset 0x029054
					; 0xE458: PRINT	MSG 0x04A5, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_012C:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4CD,$0	; Run text script at offset 0x029056
					; 0xE459: PRINT	MSG 0x04A6, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0024:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1B		; Params 00, 1B
		ScriptID    $4CE,$1	; Run text script at offset 0x029058
					; 0x845A: PRINT	MSG 0x04A7
					; 0x845B: PRINT	MSG 0x04A8
					; 0x845C: PRINT	MSG 0x04A9
					; 0xE45D: PRINT	MSG 0x04AA, MSGBOX CLEARED, END
					;
		dc.w $1C		; Params 00, 1C
		ScriptID    $4D2,$3	; Run text script at offset 0x029060
					; 0x845E: PRINT	MSG 0x04AB
					; 0xE45F: PRINT	MSG 0x04AC, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_012D:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4D4,$0	; Run text script at offset 0x029064
					; 0xE460: PRINT	MSG 0x04AD, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_012E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1B		; Params 00, 1B
		ScriptID    $4D5,$1	; Run text script at offset 0x029066
					; 0x8461: PRINT	MSG 0x04AE
					; 0xE462: PRINT	MSG 0x04AF, MSGBOX CLEARED, END
					;
		dc.w $1C		; Params 00, 1C
		ScriptID    $4D7,$3	; Run text script at offset 0x02906A
					; 0x8463: PRINT	MSG 0x04B0
					; 0xE464: PRINT	MSG 0x04B1, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0025:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4D9,$0	; Run text script at offset 0x02906E
					; 0xE465: PRINT	MSG 0x04B2, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0026:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4DA,$0	; Run text script at offset 0x029070
					; 0xE466: PRINT	MSG 0x04B3, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_012F:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4DB,$0	; Run text script at offset 0x029072
					; 0xE467: PRINT	MSG 0x04B4, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0027:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4DC,$0	; Run text script at offset 0x029074
					; 0xE468: PRINT	MSG 0x04B5, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0130:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4DD,$0	; Run text script at offset 0x029076
					; 0xE469: PRINT	MSG 0x04B6, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0131:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1B		; Params 00, 1B
		ScriptID    $4DE,$1	; Run text script at offset 0x029078
					; 0xE46A: PRINT	MSG 0x04B7, MSGBOX CLEARED, END
					;
		dc.w $1C		; Params 00, 1C
		ScriptID    $4DF,$3	; Run text script at offset 0x02907A
					; 0xE46B: PRINT	MSG 0x04B8, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0132:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4E0,$0	; Run text script at offset 0x02907C
					; 0x846C: PRINT	MSG 0x04B9
					; 0xE46D: PRINT	MSG 0x04BA, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0133:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4E2,$0	; Run text script at offset 0x029080
					; 0x846E: PRINT	MSG 0x04BB
					; 0xE46F: PRINT	MSG 0x04BC, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0134:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1B		; Params 00, 1B
		ScriptID    $4E4,$1	; Run text script at offset 0x029084
					; 0x8470: PRINT	MSG 0x04BD
					; 0xE471: PRINT	MSG 0x04BE, MSGBOX CLEARED, END
					;
		dc.w $1C		; Params 00, 1C
		ScriptID    $4E6,$3	; Run text script at offset 0x029088
					; 0x8472: PRINT	MSG 0x04BF
					; 0xE473: PRINT	MSG 0x04C0, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0028:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4E8,$0	; Run text script at offset 0x02908C
					; 0xE474: PRINT	MSG 0x04C1, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0029:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4E9,$0	; Run text script at offset 0x02908E
					; 0xE475: PRINT	MSG 0x04C2, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002A:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4EA,$0	; Run text script at offset 0x029090
					; 0x8476: PRINT	MSG 0x04C3
					; 0xE477: PRINT	MSG 0x04C4, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0135:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4EC,$0	; Run text script at offset 0x029094
					; 0x8478: PRINT	MSG 0x04C5
					; 0xE479: PRINT	MSG 0x04C6, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0136:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4EE,$0	; Run text script at offset 0x029098
					; 0x847A: PRINT	MSG 0x04C7
					; 0x847B: PRINT	MSG 0x04C8
					; 0xE47C: PRINT	MSG 0x04C9, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002B:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4F1,$0	; Run text script at offset 0x02909E
					; 0x847D: PRINT	MSG 0x04CA
					; 0xE47E: PRINT	MSG 0x04CB, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0137:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4F3,$0	; Run text script at offset 0x0290A2
					; 0x847F: PRINT	MSG 0x04CC
					; 0xE480: PRINT	MSG 0x04CD, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0138:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4F5,$0	; Run text script at offset 0x0290A6
					; 0x8481: PRINT	MSG 0x04CE
					; 0xE482: PRINT	MSG 0x04CF, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002C:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4F7,$0	; Run text script at offset 0x0290AA
					; 0xE483: PRINT	MSG 0x04D0, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0139:
		move.w	#$A,d0
		bsr.w	TestFlagBit
		beq.s	CS_0139_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $978,$0	; Run text script at offset 0x0299AC
					; 0x1939: LOAD CHARACTER SCRIPT	0x0139
					; 0xE73B: PRINT	MSG 0x0788, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	CS_0139_3
; ---------------------------------------------------------------------------

CS_0139_1:				; CODE XREF: ROM:00028030j
		move.w	#8,d0
		bsr.w	TestFlagBit
		beq.s	CS_0139_2
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $971,$0	; Run text script at offset 0x02999E
					; 0x1939: LOAD CHARACTER SCRIPT	0x0139
					; 0xE737: PRINT	MSG 0x0784, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	CS_0139_3
; ---------------------------------------------------------------------------

CS_0139_2:				; CODE XREF: ROM:00028040j
		move.w	#$132,(g_Character).l

CS_0139_3:				; CODE XREF: ROM:00028036j
					; ROM:00028046j
		rts
; ---------------------------------------------------------------------------

CS_013A:
		move.w	#$A,d0
		bsr.w	TestFlagBit
		beq.s	CS_013A_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $978,$0	; Run text script at offset 0x0299AC
					; 0x1939: LOAD CHARACTER SCRIPT	0x0139
					; 0xE73B: PRINT	MSG 0x0788, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	CS_013A_3
; ---------------------------------------------------------------------------

CS_013A_1:				; CODE XREF: ROM:0002805Aj
		move.w	#8,d0
		bsr.w	TestFlagBit
		beq.s	CS_013A_2
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $971,$0	; Run text script at offset 0x02999E
					; 0x1939: LOAD CHARACTER SCRIPT	0x0139
					; 0xE737: PRINT	MSG 0x0784, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	CS_013A_3
; ---------------------------------------------------------------------------

CS_013A_2:				; CODE XREF: ROM:0002806Aj
		move.w	#$159,(g_Character).l

CS_013A_3:				; CODE XREF: ROM:00028060j
					; ROM:00028070j
		rts
; ---------------------------------------------------------------------------

CS_013B:
		move.w	#$A,d0
		bsr.w	TestFlagBit
		beq.s	CS_013B_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $978,$0	; Run text script at offset 0x0299AC
					; 0x1939: LOAD CHARACTER SCRIPT	0x0139
					; 0xE73B: PRINT	MSG 0x0788, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	CS_013B_3
; ---------------------------------------------------------------------------

CS_013B_1:				; CODE XREF: ROM:00028084j
		move.w	#8,d0
		bsr.w	TestFlagBit
		beq.s	CS_013B_2
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $971,$0	; Run text script at offset 0x02999E
					; 0x1939: LOAD CHARACTER SCRIPT	0x0139
					; 0xE737: PRINT	MSG 0x0784, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	CS_013B_3
; ---------------------------------------------------------------------------

CS_013B_2:				; CODE XREF: ROM:00028094j
		move.w	#$135,(g_Character).l

CS_013B_3:				; CODE XREF: ROM:0002808Aj
					; ROM:0002809Aj
		rts
; ---------------------------------------------------------------------------

CS_013C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $987,$1	; Run text script at offset 0x0299CA
					; 0xE745: PRINT	MSG 0x0792, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  CS_013C_1,$3 ; Jump	to address 0x0280B4
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_013C_1:
		move.w	#$14B,d0
		bsr.w	TestFlagBit
		bne.s	CS_013C_2
		move.w	#$137,(g_Character).l
		bra.s	CS_013C_3
; ---------------------------------------------------------------------------

CS_013C_2:				; CODE XREF: ROM:000280BCj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $98B,$0	; Run text script at offset 0x0299D2
					; 0x193C: LOAD CHARACTER SCRIPT	0x013C
					; 0xE747: PRINT	MSG 0x0794, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

CS_013C_3:				; CODE XREF: ROM:000280C6j
		rts
; ---------------------------------------------------------------------------

CS_013D:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E5		; Bit 5	of flag	0x01C
		ScriptID    $9D6,$1	; Flag clear: Run text script at offset	0x029A68
					; 0x1BF3: LOAD SPECIAL CHARACTER 0x0B
					; 0x8770: PRINT	MSG 0x07BD
					; 0x8771: PRINT	MSG 0x07BE
					; 0x8772: PRINT	MSG 0x07BF
					; 0x8773: PRINT	MSG 0x07C0
					; 0xE774: PRINT	MSG 0x07C1, MSGBOX CLEARED, END
		ScriptID    $9DC,$2	; Flag set:   Run text script at offset	0x029A74
					; 0x1BF3: LOAD SPECIAL CHARACTER 0x0B
					; 0xE775: PRINT	MSG 0x07C2, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_013E:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E6		; Bit 6	of flag	0x01C
		ScriptID    $9DE,$1	; Flag clear: Run text script at offset	0x029A78
					; 0x1BF4: LOAD SPECIAL CHARACTER 0x0C
					; 0x8776: PRINT	MSG 0x07C3
					; 0x8777: PRINT	MSG 0x07C4
					; 0x1BE9: LOAD SPECIAL CHARACTER 0x01
					; 0x8778: PRINT	MSG 0x07C5
					; 0x1BF4: LOAD SPECIAL CHARACTER 0x0C
					; 0xE779: PRINT	MSG 0x07C6, MSGBOX CLEARED, END
		ScriptID    $9E5,$2	; Flag set:   Run text script at offset	0x029A86
					; 0x1BF4: LOAD SPECIAL CHARACTER 0x0C
					; 0xE77A: PRINT	MSG 0x07C7, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_NULL:
		rts
; ---------------------------------------------------------------------------

CS_002D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $17		; Params 00, 17
		ScriptID    $469,$1	; Run text script at offset 0x028F8E
					; 0xE3FF: PRINT	MSG 0x044C, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  CS_002D_1,$3 ; Jump	to address 0x0280F6
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_002D_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E7		; Bit 7	of flag	0x01C
		ScriptID    $46A,$1	; Flag clear: Run text script at offset	0x028F90
					; 0x8400: PRINT	MSG 0x044D
					; 0x8401: PRINT	MSG 0x044E
					; 0x8402: PRINT	MSG 0x044F
					; 0xE403: PRINT	MSG 0x0450, MSGBOX CLEARED, END
		ScriptID    $46E,$2	; Flag set:   Run text script at offset	0x028F98
					; 0xE404: PRINT	MSG 0x0451, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $12		; Params 00, 12
		ScriptID    $46F,$1	; Run text script at offset 0x028F9A
					; 0xE405: PRINT	MSG 0x0452, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptID    $470,$3	; Run text script at offset 0x028F9C
					; 0xE406: PRINT	MSG 0x0453, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $471,$5	; Run text script at offset 0x028F9E
					; 0xE407: PRINT	MSG 0x0454, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_002F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $12		; Params 00, 12
		ScriptID    $472,$1	; Run text script at offset 0x028FA0
					; 0xE408: PRINT	MSG 0x0455, MSGBOX CLEARED, END
					;
		dc.w $17		; Params 00, 17
		ScriptID    $762,$3	; Run text script at offset 0x029580
					; 0xE5F6: PRINT	MSG 0x0643, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $473,$5	; Run text script at offset 0x028FA2
					; 0xE409: PRINT	MSG 0x0456, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0030:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $474,$0	; Run text script at offset 0x028FA4
					; 0x1830: LOAD CHARACTER SCRIPT	0x0030
					; 0x840A: PRINT	MSG 0x0457
					; 0xE40B: PRINT	MSG 0x0458, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0031:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $10		; Params 00, 10
		ScriptJump  CS_0031_1,$1 ; Jump	to address 0x028142
					;
		dc.w $11		; Params 00, 11
		ScriptID    $3F6,$3	; Run text script at offset 0x028EA8
					; 0xE397: PRINT	MSG 0x03E4, MSGBOX CLEARED, END
					;
		dc.w $13		; Params 00, 13
		ScriptID    $3F7,$5	; Run text script at offset 0x028EAA
					; 0x8398: PRINT	MSG 0x03E5
					; 0xE399: PRINT	MSG 0x03E6, MSGBOX CLEARED, END
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $3F9,$7	; Run text script at offset 0x028EAE
					; 0x7CFA: LOAD CUSTOM ACTION 0xFA (0x0124E4 CSA_00FA), MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0031_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C9		; Bit 1	of flag	0x019
		ScriptJump  CS_0031_2,$1 ; Flag	clear: Jump to address 0x02814E
		ScriptID    $3F5,$2	; Flag set:   Run text script at offset	0x028EA6
					; 0xE396: PRINT	MSG 0x03E3, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0031_2:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $3EF,$0	; Prompt:	Run text script	at offset 0x028E9A
					; 0x8390: PRINT	MSG 0x03DD
					; 0xA391: PRINT	MSG 0x03DE, END
		ScriptID    $3F1,$1	; Answer 'yes': Run text script at offset 0x028E9E
					; 0x8392: PRINT	MSG 0x03DF
					; 0xE393: PRINT	MSG 0x03E0, MSGBOX CLEARED, END
		ScriptID    $3F3,$2	; Answer 'no':  Run text script at offset 0x028EA2
					; 0x8394: PRINT	MSG 0x03E1
					; 0xE395: PRINT	MSG 0x03E2, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0032:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $10		; Params 00, 10
		ScriptID    $3FA,$1	; Run text script at offset 0x028EB0
					; 0xE39A: PRINT	MSG 0x03E7, MSGBOX CLEARED, END
					;
		dc.w $11		; Params 00, 11
		ScriptID    $3FB,$3	; Run text script at offset 0x028EB2
					; 0x839B: PRINT	MSG 0x03E8
					; 0xE39C: PRINT	MSG 0x03E9, MSGBOX CLEARED, END
					;
		dc.w $13		; Params 00, 13
		ScriptID    $3FD,$5	; Run text script at offset 0x028EB6
					; 0xE39D: PRINT	MSG 0x03EA, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0033:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $16		; Params 00, 16
		ScriptID    $47B,$1	; Run text script at offset 0x028FB2
					; 0xE40E: PRINT	MSG 0x045B, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0034:
		rts
; ---------------------------------------------------------------------------

CS_0035:
		rts
; ---------------------------------------------------------------------------

CS_0036:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $18		; Params 00, 18
		ScriptID    $48D,$1	; Run text script at offset 0x028FD6
					; 0xE41C: PRINT	MSG 0x0469, MSGBOX CLEARED, END
					;
		dc.w $19		; Params 00, 19
		ScriptID    $48E,$3	; Run text script at offset 0x028FD8
					; 0xE41D: PRINT	MSG 0x046A, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0037:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $18		; Params 00, 18
		ScriptID    $48F,$1	; Run text script at offset 0x028FDA
					; 0x7CC6: LOAD CUSTOM ACTION 0xC6 (0x012414 CSA_00C6), MSGBOX CLEARED, END
					;
		dc.w $19		; Params 00, 19
		ScriptID    $7D0,$3	; Run text script at offset 0x02965C
					; 0xE63B: PRINT	MSG 0x0688, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0038:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DF		; Bit 7	of flag	0x01B
		ScriptID    $826,$1	; Flag clear: Run text script at offset	0x029708
					; 0x866A: PRINT	MSG 0x06B7
					; 0x866B: PRINT	MSG 0x06B8
					; 0x866C: PRINT	MSG 0x06B9
					; 0x0001: LOAD 0x0001 INTO 0xFF1196
					; 0x17E8: RECEIVE ITEM [0xFF1196]
					; 0x1838: LOAD CHARACTER SCRIPT	0x0038
					; 0x866D: PRINT	MSG 0x06BA
					; 0x866E: PRINT	MSG 0x06BB
					; 0xE66F: PRINT	MSG 0x06BC, MSGBOX CLEARED, END
		ScriptJump  CS_0038_1,$2 ; Flag	set:   Jump to address 0x0281A2
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0038_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E3		; Bit 3	of flag	0x01C
		ScriptID    $82F,$1	; Flag clear: Run text script at offset	0x02971A
					; 0x8670: PRINT	MSG 0x06BD
					; 0x8671: PRINT	MSG 0x06BE
					; 0x0403: LOAD 0x0003 INTO 0xFF1198
					; 0x0802: LOAD 0x0002 INTO 0xFF119A
					; 0x8672: PRINT	MSG 0x06BF
					; 0xE673: PRINT	MSG 0x06C0, MSGBOX CLEARED, END
		ScriptID    $82E,$2	; Flag set:   Run text script at offset	0x029718
					; 0xE66F: PRINT	MSG 0x06BC, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0039:
		move.w	#$1E,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	CS_0039_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $48A,$0	; Run text script at offset 0x028FD0
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0x841A: PRINT	MSG 0x0467
					; 0xE41B: PRINT	MSG 0x0468, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	CS_0039_2
; ---------------------------------------------------------------------------

CS_0039_1:				; CODE XREF: ROM:000281B6j
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D7		; Bit 7	of flag	0x01A
		ScriptID    $47C,$1	; Flag clear: Run text script at offset	0x028FB4
					; 0x840F: PRINT	MSG 0x045C
					; 0x8410: PRINT	MSG 0x045D
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0x081E: LOAD 0x001E INTO 0xFF119A
					; 0x8411: PRINT	MSG 0x045E
					; 0x8412: PRINT	MSG 0x045F
					; 0xA413: PRINT	MSG 0x0460, END
		ScriptID    $482,$2	; Flag set:   Run text script at offset	0x028FC0
					; 0xA413: PRINT	MSG 0x0460, END
; ---------------------------------------------------------------------------
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptJump  CS_NULL,$0	; Prompt:	Jump to	address	0x0380E6
		ScriptID    $483,$1	; Answer 'yes': Run text script at offset 0x028FC2
					; 0x8414: PRINT	MSG 0x0461
					; 0x8415: PRINT	MSG 0x0462
					; 0x8416: PRINT	MSG 0x0463
					; 0x8417: PRINT	MSG 0x0464
					; 0x8418: PRINT	MSG 0x0465
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0xE419: PRINT	MSG 0x0466, MSGBOX CLEARED, END
		ScriptID    $488,$2	; Answer 'no':  Run text script at offset 0x028FCC
					; 0x041E: LOAD 0x001E INTO 0xFF1198
					; 0xE419: PRINT	MSG 0x0466, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

CS_0039_2:				; CODE XREF: ROM:000281BCj
		rts
; ---------------------------------------------------------------------------

CS_013F:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $47A,$0	; Run text script at offset 0x028FB0
					; 0x7C81: LOAD CUSTOM ACTION 0x81 (0x012300 CSA_0081), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0140:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $490,$0	; Run text script at offset 0x028FDC
					; 0x1BED: LOAD SPECIAL CHARACTER 0x05
					; 0x841E: PRINT	MSG 0x046B
					; 0x841F: PRINT	MSG 0x046C
					; 0xE420: PRINT	MSG 0x046D, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_003A:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $494,$0	; Run text script at offset 0x028FE4
					; 0xE421: PRINT	MSG 0x046E, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_003B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $495,$1	; Run text script at offset 0x028FE6
					; 0xE422: PRINT	MSG 0x046F, MSGBOX CLEARED, END
					;
		dc.w $201		; Params 02, 01
		ScriptID    $498,$3	; Run text script at offset 0x028FEC
					; 0xE425: PRINT	MSG 0x0472, MSGBOX CLEARED, END
					;
		dc.w $202		; Params 02, 02
		ScriptID    $496,$5	; Run text script at offset 0x028FE8
					; 0xE423: PRINT	MSG 0x0470, MSGBOX CLEARED, END
					;
		dc.w $203		; Params 02, 03
		ScriptID    $497,$7	; Run text script at offset 0x028FEA
					; 0xE424: PRINT	MSG 0x0471, MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0141:
		move.w	#$138,(g_Character).l
		rts
; ---------------------------------------------------------------------------

CS_0142:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $14D		; Bit 5	of flag	0x029
		ScriptJump  CS_0142_1,$1 ; Flag	clear: Jump to address 0x028212
		ScriptID    $99B,$2	; Flag set:   Run text script at offset	0x0299F2
					; 0x14E0: SET BIT 0 OF FLAG 0x01C
					; 0x1BED: LOAD SPECIAL CHARACTER 0x05
					; 0x874E: PRINT	MSG 0x079B
					; 0x042F: LOAD 0x002F INTO 0xFF1198
					; 0xE74F: PRINT	MSG 0x079C, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0142_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $15B		; Bit 3	of flag	0x02B
		ScriptID    $9A3,$1	; Flag set:   Run text script at offset	0x029A02
					; 0x1BED: LOAD SPECIAL CHARACTER 0x05
					; 0xE751: PRINT	MSG 0x079E, MSGBOX CLEARED, END
		ScriptID    $9A0,$2	; Flag clear: Run text script at offset	0x0299FC
					; 0x1BED: LOAD SPECIAL CHARACTER 0x05
					; 0x042F: LOAD 0x002F INTO 0xFF1198
					; 0xE750: PRINT	MSG 0x079D, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
