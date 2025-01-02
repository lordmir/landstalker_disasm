		dc.b $25		; DATA XREF: sub_25A0E+8t
		dc.b $14
		dc.w $260
		ScriptID    $42,$2	; Run text script at offset 0x028740
					; 0xE042: PRINT	MSG 0x008F, MSGBOX CLEARED, END
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x025F0A
		ScriptID    $41,$4	; Run text script at offset 0x02873E
					; 0xE041: PRINT	MSG 0x008E, MSGBOX CLEARED, END
		ScriptID    $43,$5	; Run text script at offset 0x028742
					; 0xA043: PRINT	MSG 0x0090, END
		ScriptID    $44,$6	; Run text script at offset 0x028744
					; 0xE044: PRINT	MSG 0x0091, MSGBOX CLEARED, END
		ScriptID    $45,$7	; Run text script at offset 0x028746
					; 0xE045: PRINT	MSG 0x0092, MSGBOX CLEARED, END
		ScriptID    $46,$8	; Run text script at offset 0x028748
					; 0xE046: PRINT	MSG 0x0093, MSGBOX CLEARED, END
		ScriptID    $47,$9	; Run text script at offset 0x02874A
					; 0xE047: PRINT	MSG 0x0094, MSGBOX CLEARED, END
		dc.b $26
		dc.b $C
		dc.w $260
		ScriptID    $48,$2	; Run text script at offset 0x02874C
					; 0xE048: PRINT	MSG 0x0095, MSGBOX CLEARED, END
		ScriptJump  HandleMap,$3 ; Jump	to address 0x025F78
		ScriptID    $41,$4	; Run text script at offset 0x02873E
					; 0xE041: PRINT	MSG 0x008E, MSGBOX CLEARED, END
		ScriptID    $49,$5	; Run text script at offset 0x02874E
					; 0xA049: PRINT	MSG 0x0096, END
		dc.b $25
		dc.b $14
		dc.w $26F
		ScriptID    $5A,$2	; Run text script at offset 0x028770
					; 0xE05A: PRINT	MSG 0x00A7, MSGBOX CLEARED, END
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x025F0A
		ScriptID    $59,$4	; Run text script at offset 0x02876E
					; 0xE059: PRINT	MSG 0x00A6, MSGBOX CLEARED, END
		ScriptID    $5B,$5	; Run text script at offset 0x028772
					; 0xA05B: PRINT	MSG 0x00A8, END
		ScriptID    $5C,$6	; Run text script at offset 0x028774
					; 0xE05C: PRINT	MSG 0x00A9, MSGBOX CLEARED, END
		ScriptID    $5D,$7	; Run text script at offset 0x028776
					; 0xE05D: PRINT	MSG 0x00AA, MSGBOX CLEARED, END
		ScriptID    $5E,$8	; Run text script at offset 0x028778
					; 0xE05E: PRINT	MSG 0x00AB, MSGBOX CLEARED, END
		ScriptID    $5F,$9	; Run text script at offset 0x02877A
					; 0xE05F: PRINT	MSG 0x00AC, MSGBOX CLEARED, END
		dc.b $26
		dc.b $C
		dc.w $26F
		ScriptID    $60,$2	; Run text script at offset 0x02877C
					; 0xE060: PRINT	MSG 0x00AD, MSGBOX CLEARED, END
		ScriptJump  HandleMap,$3 ; Jump	to address 0x025F78
		ScriptID    $59,$4	; Run text script at offset 0x02876E
					; 0xE059: PRINT	MSG 0x00A6, MSGBOX CLEARED, END
		ScriptID    $61,$5	; Run text script at offset 0x02877E
					; 0xA061: PRINT	MSG 0x00AE, END
		dc.b $25
		dc.b $14
		dc.w $2BD
		ScriptID    $76,$2	; Run text script at offset 0x0287A8
					; 0xE076: PRINT	MSG 0x00C3, MSGBOX CLEARED, END
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x025F0A
		ScriptID    $75,$4	; Run text script at offset 0x0287A6
					; 0xE075: PRINT	MSG 0x00C2, MSGBOX CLEARED, END
		ScriptID    $77,$5	; Run text script at offset 0x0287AA
					; 0xA077: PRINT	MSG 0x00C4, END
		ScriptID    $78,$6	; Run text script at offset 0x0287AC
					; 0xE078: PRINT	MSG 0x00C5, MSGBOX CLEARED, END
		ScriptID    $79,$7	; Run text script at offset 0x0287AE
					; 0xE079: PRINT	MSG 0x00C6, MSGBOX CLEARED, END
		ScriptID    $7A,$8	; Run text script at offset 0x0287B0
					; 0xE07A: PRINT	MSG 0x00C7, MSGBOX CLEARED, END
		ScriptID    $7B,$9	; Run text script at offset 0x0287B2
					; 0xE07B: PRINT	MSG 0x00C8, MSGBOX CLEARED, END
		dc.b $26
		dc.b $C
		dc.w $2BD
		ScriptID    $7C,$2	; Run text script at offset 0x0287B4
					; 0xE07C: PRINT	MSG 0x00C9, MSGBOX CLEARED, END
		ScriptJump  HandleMap,$3 ; Jump	to address 0x025F78
		ScriptID    $75,$4	; Run text script at offset 0x0287A6
					; 0xE075: PRINT	MSG 0x00C2, MSGBOX CLEARED, END
		ScriptID    $7D,$5	; Run text script at offset 0x0287B6
					; 0xA07D: PRINT	MSG 0x00CA, END
		dc.b $26
		dc.b $C
		dc.w $2CF
		ScriptJump  ShopMap_07,$2 ; Jump to address 0x026DC6
		ScriptJump  HandleMap,$3 ; Jump	to address 0x025F78
		ScriptJump  ShopSteal_07,$4 ; Jump to address 0x026D7E
		ScriptJump  ShopConfirmMap_07,$5 ; Jump	to address 0x026DD2
		dc.b $24
		dc.b $A
		dc.w $2E0
		ScriptID    $34,$2	; Run text script at offset 0x028724
					; 0xE034: PRINT	MSG 0x0081, MSGBOX CLEARED, END
		ScriptJump  HandleSpellbook,$3 ; Jump to address 0x025FC6
		ScriptID    $39,$4	; Run text script at offset 0x02872E
					; 0xE039: PRINT	MSG 0x0086, MSGBOX CLEARED, END
		dc.b $25
		dc.b $14
		dc.w $2D9
		ScriptID    $5A,$2	; Run text script at offset 0x028770
					; 0xE05A: PRINT	MSG 0x00A7, MSGBOX CLEARED, END
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x025F0A
		ScriptID    $59,$4	; Run text script at offset 0x02876E
					; 0xE059: PRINT	MSG 0x00A6, MSGBOX CLEARED, END
		ScriptID    $5B,$5	; Run text script at offset 0x028772
					; 0xA05B: PRINT	MSG 0x00A8, END
		ScriptID    $5C,$6	; Run text script at offset 0x028774
					; 0xE05C: PRINT	MSG 0x00A9, MSGBOX CLEARED, END
		ScriptID    $5D,$7	; Run text script at offset 0x028776
					; 0xE05D: PRINT	MSG 0x00AA, MSGBOX CLEARED, END
		ScriptID    $5E,$8	; Run text script at offset 0x028778
					; 0xE05E: PRINT	MSG 0x00AB, MSGBOX CLEARED, END
		ScriptID    $5F,$9	; Run text script at offset 0x02877A
					; 0xE05F: PRINT	MSG 0x00AC, MSGBOX CLEARED, END
		dc.b $26
		dc.b $C
		dc.w $2D9
		ScriptID    $60,$2	; Run text script at offset 0x02877C
					; 0xE060: PRINT	MSG 0x00AD, MSGBOX CLEARED, END
		ScriptJump  HandleMap,$3 ; Jump	to address 0x025F78
		ScriptID    $59,$4	; Run text script at offset 0x02876E
					; 0xE059: PRINT	MSG 0x00A6, MSGBOX CLEARED, END
		ScriptID    $61,$5	; Run text script at offset 0x02877E
					; 0xA061: PRINT	MSG 0x00AE, END
		dc.b $25
		dc.b $14
		dc.w $2E9
		ScriptID    $2C,$2	; Run text script at offset 0x028714
					; 0xE02C: PRINT	MSG 0x0079, MSGBOX CLEARED, END
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x025F0A
		ScriptID    $9A,$4	; Run text script at offset 0x0287F0
					; 0xE09A: PRINT	MSG 0x00E7, MSGBOX CLEARED, END
		ScriptID    $2D,$5	; Run text script at offset 0x028716
					; 0xA02D: PRINT	MSG 0x007A, END
		ScriptID    $9B,$6	; Run text script at offset 0x0287F2
					; 0xE09B: PRINT	MSG 0x00E8, MSGBOX CLEARED, END
		ScriptID    $2F,$7	; Run text script at offset 0x02871A
					; 0xE02F: PRINT	MSG 0x007C, MSGBOX CLEARED, END
		ScriptID    $30,$8	; Run text script at offset 0x02871C
					; 0xE030: PRINT	MSG 0x007D, MSGBOX CLEARED, END
		ScriptID    $31,$9	; Run text script at offset 0x02871E
					; 0xE031: PRINT	MSG 0x007E, MSGBOX CLEARED, END
		dc.b 0
		dc.b 6
		dc.w $307
		ScriptJump  GainItem,$2	; Jump to address 0x035996
		dc.b $12
		dc.b 6
		dc.w $307
		ScriptJump  GainItem,$2	; Jump to address 0x035996
		dc.b $21
		dc.b $18
		dc.w $FFFF
		ScriptID    $15,$2	; Run text script at offset 0x0286E6
					; 0xE015: PRINT	MSG 0x0062, MSGBOX CLEARED, END
		ScriptJump  HandleStatusCure,$3	; Jump to address 0x025E26
		ScriptID    $14,$4	; Run text script at offset 0x0286E4
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END
		ScriptID    $16,$5	; Run text script at offset 0x0286E8
					; 0xA016: PRINT	MSG 0x0063, END
		ScriptID    $17,$6	; Run text script at offset 0x0286EA
					; 0xE017: PRINT	MSG 0x0064, MSGBOX CLEARED, END
		ScriptID    $18,$7	; Run text script at offset 0x0286EC
					; 0xE018: PRINT	MSG 0x0065, MSGBOX CLEARED, END
		ScriptID    $19,$8	; Run text script at offset 0x0286EE
					; 0xE019: PRINT	MSG 0x0066, MSGBOX CLEARED, END
		ScriptID    $1A,$9	; Run text script at offset 0x0286F0
					; 0xE01A: PRINT	MSG 0x0067, MSGBOX CLEARED, END
		ScriptID    $1B,$A	; Run text script at offset 0x0286F2
					; 0xE01B: PRINT	MSG 0x0068, MSGBOX CLEARED, END
		dc.w $100
		dc.b $22
		dc.b $18
		dc.w $FFFF
		ScriptID    $1C,$2	; Run text script at offset 0x0286F4
					; 0xE01C: PRINT	MSG 0x0069, MSGBOX CLEARED, END
		ScriptJump  HandleStatusCure,$3	; Jump to address 0x025E26
		ScriptID    $14,$4	; Run text script at offset 0x0286E4
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END
		ScriptID    $1D,$5	; Run text script at offset 0x0286F6
					; 0xA01D: PRINT	MSG 0x006A, END
		ScriptID    $17,$6	; Run text script at offset 0x0286EA
					; 0xE017: PRINT	MSG 0x0064, MSGBOX CLEARED, END
		ScriptID    $1E,$7	; Run text script at offset 0x0286F8
					; 0xE01E: PRINT	MSG 0x006B, MSGBOX CLEARED, END
		ScriptID    $19,$8	; Run text script at offset 0x0286EE
					; 0xE019: PRINT	MSG 0x0066, MSGBOX CLEARED, END
		ScriptID    $1A,$9	; Run text script at offset 0x0286F0
					; 0xE01A: PRINT	MSG 0x0067, MSGBOX CLEARED, END
		ScriptID    $1F,$A	; Run text script at offset 0x0286FA
					; 0xE01F: PRINT	MSG 0x006C, MSGBOX CLEARED, END
		dc.w $800
		dc.b $11
		dc.b $18
		dc.w $FFFF
		ScriptID    $20,$2	; Run text script at offset 0x0286FC
					; 0xE020: PRINT	MSG 0x006D, MSGBOX CLEARED, END
		ScriptJump  HandleStatusCure,$3	; Jump to address 0x025E26
		ScriptID    $14,$4	; Run text script at offset 0x0286E4
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END
		ScriptID    $21,$5	; Run text script at offset 0x0286FE
					; 0xA021: PRINT	MSG 0x006E, END
		ScriptID    $17,$6	; Run text script at offset 0x0286EA
					; 0xE017: PRINT	MSG 0x0064, MSGBOX CLEARED, END
		ScriptID    $22,$7	; Run text script at offset 0x028700
					; 0xE022: PRINT	MSG 0x006F, MSGBOX CLEARED, END
		ScriptID    $19,$8	; Run text script at offset 0x0286EE
					; 0xE019: PRINT	MSG 0x0066, MSGBOX CLEARED, END
		ScriptID    $1A,$9	; Run text script at offset 0x0286F0
					; 0xE01A: PRINT	MSG 0x0067, MSGBOX CLEARED, END
		ScriptID    $23,$A	; Run text script at offset 0x028702
					; 0xE023: PRINT	MSG 0x0070, MSGBOX CLEARED, END
		dc.w $200
		dc.b $23
		dc.b $18
		dc.w $FFFF
		ScriptJump  HandleIdentifyRecordBook,$2	; Jump to address 0x026DDE
		ScriptJump  HandleRecordBookUse,$3 ; Jump to address 0x025EA6
		ScriptJump  HandleRecordBookTheft,$4 ; Jump to address 0x026E1E
		ScriptJump  RequestGameSaveMsg,$5 ; Jump to address 0x026DE6
		ScriptJump  InitiateGameSaveMsg,$6 ; Jump to address 0x026DEE
		ScriptJump  GameSaveCompleteMsg,$7 ; Jump to address 0x026DF6
		ScriptJump  GameSaveRefusedMsg,$8 ; Jump to address 0x026DFE
		ScriptJump  RequestGameContinueMsg,$9 ;	Jump to	address	0x026E06
		ScriptJump  ConfirmGameContinueMsg,$A ;	Jump to	address	0x026E0E
		ScriptJump  ConfirmGameStopMsg,$B ; Jump to address 0x026E16
		dc.b $25
		dc.b $14
		dc.w $FFFF
		ScriptID    $2C,$2	; Run text script at offset 0x028714
					; 0xE02C: PRINT	MSG 0x0079, MSGBOX CLEARED, END
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x025F0A
		ScriptID    $11,$4	; Run text script at offset 0x0286DE
					; 0xE011: PRINT	MSG 0x005E, MSGBOX CLEARED, END
		ScriptID    $2D,$5	; Run text script at offset 0x028716
					; 0xA02D: PRINT	MSG 0x007A, END
		ScriptID    $2E,$6	; Run text script at offset 0x028718
					; 0xE02E: PRINT	MSG 0x007B, MSGBOX CLEARED, END
		ScriptID    $2F,$7	; Run text script at offset 0x02871A
					; 0xE02F: PRINT	MSG 0x007C, MSGBOX CLEARED, END
		ScriptID    $30,$8	; Run text script at offset 0x02871C
					; 0xE030: PRINT	MSG 0x007D, MSGBOX CLEARED, END
		ScriptID    $31,$9	; Run text script at offset 0x02871E
					; 0xE031: PRINT	MSG 0x007E, MSGBOX CLEARED, END
		dc.b $26
		dc.b $C
		dc.w $FFFF
		ScriptID    $32,$2	; Run text script at offset 0x028720
					; 0xE032: PRINT	MSG 0x007F, MSGBOX CLEARED, END
		ScriptJump  HandleMap,$3 ; Jump	to address 0x025F78
		ScriptID    $11,$4	; Run text script at offset 0x0286DE
					; 0xE011: PRINT	MSG 0x005E, MSGBOX CLEARED, END
		ScriptID    $33,$5	; Run text script at offset 0x028722
					; 0xA033: PRINT	MSG 0x0080, END
		dc.w $FFFF		; Run text script at offset 0x035B20
					; 0x71F6: LOAD 502 INTO	NUMERIC	VARIABLE, MSGBOX CLEARED, END
