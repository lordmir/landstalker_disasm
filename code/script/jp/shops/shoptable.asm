			dc.w $254		; DATA XREF: sub_2595E+2At
					; sub_25BD2+At
		dc.b $10
		dc.b 8
		ScriptID    $7,$2	; Run text script at offset 0x0286CA
					; 0xE007: PRINT	MSG 0x0054, MSGBOX CLEARED, END
		ScriptID    $8,$3	; Run text script at offset 0x0286CC
					; 0xE008: PRINT	MSG 0x0055, MSGBOX CLEARED, END
		ScriptJump  ShopPrice_01,$4 ; Jump to address 0x026CDC
		ScriptJump  Shop_01,$5	; Jump to address 0x026CE2
		ScriptID    $E,$6	; Run text script at offset 0x0286D8
					; 0xE00E: PRINT	MSG 0x005B, MSGBOX CLEARED, END
		dc.w $255
		dc.b $10
		dc.b $10
		ScriptID    $12,$9	; Run text script at offset 0x0286E0
					; 0xE012: PRINT	MSG 0x005F, MSGBOX CLEARED, END
		ScriptID    $13,$A	; Run text script at offset 0x0286E2
					; 0xE013: PRINT	MSG 0x0060, MSGBOX CLEARED, END
		ScriptJump  CS_NULL,$B	; Jump to address 0x0280E6
		ScriptJump  CS_NULL,$C	; Jump to address 0x0280E6
		ScriptID    $14,$D	; Run text script at offset 0x0286E4
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END
		dc.w $256
		dc.b 8
		dc.b $10
		ScriptID    $F,$10	; Run text script at offset 0x0286DA
					; 0xE00F: PRINT	MSG 0x005C, MSGBOX CLEARED, END
		ScriptID    $10,$11	; Run text script at offset 0x0286DC
					; 0xE010: PRINT	MSG 0x005D, MSGBOX CLEARED, END
		ScriptJump  CS_NULL,$12	; Jump to address 0x0280E6
		ScriptJump  CS_NULL,$13	; Jump to address 0x0280E6
		ScriptID    $11,$14	; Run text script at offset 0x0286DE
					; 0xE011: PRINT	MSG 0x005E, MSGBOX CLEARED, END
		dc.w $25F
		dc.b $10
		dc.b $10
		ScriptID    $12,$17	; Run text script at offset 0x0286E0
					; 0xE012: PRINT	MSG 0x005F, MSGBOX CLEARED, END
		ScriptID    $13,$18	; Run text script at offset 0x0286E2
					; 0xE013: PRINT	MSG 0x0060, MSGBOX CLEARED, END
		ScriptJump  CS_NULL,$19	; Jump to address 0x0280E6
		ScriptJump  CS_NULL,$1A	; Jump to address 0x0280E6
		ScriptID    $14,$1B	; Run text script at offset 0x0286E4
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END
		dc.w $260
		dc.b $10
		dc.b $B
		ScriptID    $3A,$1E	; Run text script at offset 0x028730
					; 0xE03A: PRINT	MSG 0x0087, MSGBOX CLEARED, END
		ScriptID    $3B,$1F	; Run text script at offset 0x028732
					; 0xE03B: PRINT	MSG 0x0088, MSGBOX CLEARED, END
		ScriptJump  ShopPrice_02,$20 ; Jump to address 0x026CEE
		ScriptJump  Shop_02,$21	; Jump to address 0x026CF4
		ScriptID    $41,$22	; Run text script at offset 0x02873E
					; 0xE041: PRINT	MSG 0x008E, MSGBOX CLEARED, END
		dc.w $267
		dc.b $10
		dc.b $10
		ScriptID    $4A,$25	; Run text script at offset 0x028750
					; 0xE04A: PRINT	MSG 0x0097, MSGBOX CLEARED, END
		ScriptID    $4B,$26	; Run text script at offset 0x028752
					; 0xE04B: PRINT	MSG 0x0098, MSGBOX CLEARED, END
		ScriptJump  ShopPrice_03,$27 ; Jump to address 0x026D00
		ScriptJump  Shop_03,$28	; Jump to address 0x026D06
		ScriptID    $51,$29	; Run text script at offset 0x02875E
					; 0xE051: PRINT	MSG 0x009E, MSGBOX CLEARED, END
		dc.w $265
		dc.b $10
		dc.b $10
		ScriptID    $12,$2C	; Run text script at offset 0x0286E0
					; 0xE012: PRINT	MSG 0x005F, MSGBOX CLEARED, END
		ScriptID    $13,$2D	; Run text script at offset 0x0286E2
					; 0xE013: PRINT	MSG 0x0060, MSGBOX CLEARED, END
		ScriptJump  CS_NULL,$2E	; Jump to address 0x0280E6
		ScriptJump  CS_NULL,$2F	; Jump to address 0x0280E6
		ScriptID    $14,$30	; Run text script at offset 0x0286E4
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END
		dc.w $26F
		dc.b $10
		dc.b $10
		ScriptID    $52,$33	; Run text script at offset 0x028760
					; 0xE052: PRINT	MSG 0x009F, MSGBOX CLEARED, END
		ScriptID    $53,$34	; Run text script at offset 0x028762
					; 0xE053: PRINT	MSG 0x00A0, MSGBOX CLEARED, END
		ScriptJump  ShopPrice_04,$35 ; Jump to address 0x026D12
		ScriptJump  Shop_04,$36	; Jump to address 0x026D18
		ScriptID    $59,$37	; Run text script at offset 0x02876E
					; 0xE059: PRINT	MSG 0x00A6, MSGBOX CLEARED, END
		dc.w $2A6
		dc.b $18
		dc.b $10
		ScriptID    $62,$3A	; Run text script at offset 0x028780
					; 0xE062: PRINT	MSG 0x00AF, MSGBOX CLEARED, END
		ScriptID    $63,$3B	; Run text script at offset 0x028782
					; 0xE063: PRINT	MSG 0x00B0, MSGBOX CLEARED, END
		ScriptJump  ShopPrice_05,$3C ; Jump to address 0x026D24
		ScriptJump  Shop_05,$3D	; Jump to address 0x026D2A
		ScriptID    $69,$3E	; Run text script at offset 0x02878E
					; 0xE069: PRINT	MSG 0x00B6, MSGBOX CLEARED, END
		dc.w $2B7
		dc.b $10
		dc.b $10
		ScriptID    $6A,$41	; Run text script at offset 0x028790
					; 0xE06A: PRINT	MSG 0x00B7, MSGBOX CLEARED, END
		ScriptID    $6B,$42	; Run text script at offset 0x028792
					; 0xE06B: PRINT	MSG 0x00B8, MSGBOX CLEARED, END
		ScriptJump  ShopPrice_06,$43 ; Jump to address 0x026D36
		ScriptJump  Shop_06,$44	; Jump to address 0x026D3C
		ScriptID    $72,$45	; Run text script at offset 0x0287A0
					; 0xE072: PRINT	MSG 0x00BF, MSGBOX CLEARED, END
		dc.w $281
		dc.b $C
		dc.b $10
		ScriptJump  CS_NULL,$48	; Jump to address 0x0280E6
		ScriptJump  CS_NULL,$49	; Jump to address 0x0280E6
		ScriptJump  ShopPrice_01,$4A ; Jump to address 0x026CDC
		ScriptJump  Shop_01,$4B	; Jump to address 0x026CE2
		ScriptID    $E,$4C	; Run text script at offset 0x0286D8
					; 0xE00E: PRINT	MSG 0x005B, MSGBOX CLEARED, END
		dc.w $2BB
		dc.b $10
		dc.b $10
		ScriptID    $12,$4F	; Run text script at offset 0x0286E0
					; 0xE012: PRINT	MSG 0x005F, MSGBOX CLEARED, END
		ScriptID    $13,$50	; Run text script at offset 0x0286E2
					; 0xE013: PRINT	MSG 0x0060, MSGBOX CLEARED, END
		ScriptJump  CS_NULL,$51	; Jump to address 0x0280E6
		ScriptJump  CS_NULL,$52	; Jump to address 0x0280E6
		ScriptID    $14,$53	; Run text script at offset 0x0286E4
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END
		dc.w $2BD
		dc.b $20
		dc.b $10
		ScriptID    $73,$56	; Run text script at offset 0x0287A2
					; 0xE073: PRINT	MSG 0x00C0, MSGBOX CLEARED, END
		ScriptID    $74,$57	; Run text script at offset 0x0287A4
					; 0xE074: PRINT	MSG 0x00C1, MSGBOX CLEARED, END
		ScriptJump  CS_NULL,$58	; Jump to address 0x0280E6
		ScriptJump  CS_NULL,$59	; Jump to address 0x0280E6
		ScriptID    $75,$5A	; Run text script at offset 0x0287A6
					; 0xE075: PRINT	MSG 0x00C2, MSGBOX CLEARED, END
		dc.w $2CF
		dc.b $10
		dc.b $18
		ScriptJump  ShopEnter_07,$5D ; Jump to address 0x026D66
		ScriptJump  ShopLeave_07,$5E ; Jump to address 0x026D72
		ScriptJump  ShopPrice_07,$5F ; Jump to address 0x026D54
		ScriptJump  Shop_07,$60	; Jump to address 0x026D5A
		ScriptJump  ShopSteal_07,$61 ; Jump to address 0x026D7E
		dc.w $2D1
		dc.b $10
		dc.b $10
		ScriptID    $12,$64	; Run text script at offset 0x0286E0
					; 0xE012: PRINT	MSG 0x005F, MSGBOX CLEARED, END
		ScriptID    $13,$65	; Run text script at offset 0x0286E2
					; 0xE013: PRINT	MSG 0x0060, MSGBOX CLEARED, END
		ScriptJump  CS_NULL,$66	; Jump to address 0x0280E6
		ScriptJump  CS_NULL,$67	; Jump to address 0x0280E6
		ScriptID    $14,$68	; Run text script at offset 0x0286E4
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END
		dc.w $2DD
		dc.b $10
		dc.b $20
		ScriptID    $92,$6B	; Run text script at offset 0x0287E0
					; 0xE092: PRINT	MSG 0x00DF, MSGBOX CLEARED, END
		ScriptID    $93,$6C	; Run text script at offset 0x0287E2
					; 0xE093: PRINT	MSG 0x00E0, MSGBOX CLEARED, END
		ScriptJump  ShopPrice_03,$6D ; Jump to address 0x026D00
		ScriptJump  Shop_03,$6E	; Jump to address 0x026D06
		ScriptID    $94,$6F	; Run text script at offset 0x0287E4
					; 0xE094: PRINT	MSG 0x00E1, MSGBOX CLEARED, END
		dc.w $2E0
		dc.b $10
		dc.b $10
		ScriptID    $12,$72	; Run text script at offset 0x0286E0
					; 0xE012: PRINT	MSG 0x005F, MSGBOX CLEARED, END
		ScriptID    $13,$73	; Run text script at offset 0x0286E2
					; 0xE013: PRINT	MSG 0x0060, MSGBOX CLEARED, END
		ScriptJump  CS_NULL,$74	; Jump to address 0x0280E6
		ScriptJump  CS_NULL,$75	; Jump to address 0x0280E6
		ScriptID    $14,$76	; Run text script at offset 0x0286E4
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END
		dc.w $2D9
		dc.b $10
		dc.b $10
		ScriptID    $95,$79	; Run text script at offset 0x0287E6
					; 0xE095: PRINT	MSG 0x00E2, MSGBOX CLEARED, END
		ScriptID    $53,$7A	; Run text script at offset 0x028762
					; 0xE053: PRINT	MSG 0x00A0, MSGBOX CLEARED, END
		ScriptJump  ShopPrice_04,$7B ; Jump to address 0x026D12
		ScriptJump  Shop_04,$7C	; Jump to address 0x026D18
		ScriptID    $59,$7D	; Run text script at offset 0x02876E
					; 0xE059: PRINT	MSG 0x00A6, MSGBOX CLEARED, END
		dc.w $2EB
		dc.b $10
		dc.b $40
		ScriptID    $96,$80	; Run text script at offset 0x0287E8
					; 0xE096: PRINT	MSG 0x00E3, MSGBOX CLEARED, END
		ScriptID    $97,$81	; Run text script at offset 0x0287EA
					; 0xE097: PRINT	MSG 0x00E4, MSGBOX CLEARED, END
		ScriptJump  ShopPrice_01,$82 ; Jump to address 0x026CDC
		ScriptJump  Shop_01,$83	; Jump to address 0x026CE2
		ScriptID    $98,$84	; Run text script at offset 0x0287EC
					; 0xE098: PRINT	MSG 0x00E5, MSGBOX CLEARED, END
		dc.w $2ED
		dc.b $10
		dc.b $10
		ScriptID    $12,$87	; Run text script at offset 0x0286E0
					; 0xE012: PRINT	MSG 0x005F, MSGBOX CLEARED, END
		ScriptID    $13,$88	; Run text script at offset 0x0286E2
					; 0xE013: PRINT	MSG 0x0060, MSGBOX CLEARED, END
		ScriptJump  CS_NULL,$89	; Jump to address 0x0280E6
		ScriptJump  CS_NULL,$8A	; Jump to address 0x0280E6
		ScriptID    $14,$8B	; Run text script at offset 0x0286E4
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END
		dc.w $2E9
		dc.b $10
		dc.b $10
		ScriptID    $99,$8E	; Run text script at offset 0x0287EE
					; 0xE099: PRINT	MSG 0x00E6, MSGBOX CLEARED, END
		ScriptID    $10,$8F	; Run text script at offset 0x0286DC
					; 0xE010: PRINT	MSG 0x005D, MSGBOX CLEARED, END
		ScriptJump  CS_NULL,$90	; Jump to address 0x0280E6
		ScriptJump  CS_NULL,$91	; Jump to address 0x0280E6
		ScriptID    $9A,$92	; Run text script at offset 0x0287F0
					; 0xE09A: PRINT	MSG 0x00E7, MSGBOX CLEARED, END
		dc.w $307
		dc.b $10
		dc.b $10
		ScriptJump  CS_NULL,$95	; Jump to address 0x0280E6
		ScriptJump  CS_NULL,$96	; Jump to address 0x0280E6
		ScriptJump  CS_NULL,$97	; Jump to address 0x0280E6
		ScriptJump  CS_NULL,$98	; Jump to address 0x0280E6
		ScriptID    $9C,$99	; Run text script at offset 0x0287F4
					; 0xE09C: PRINT	MSG 0x00E9, MSGBOX CLEARED, END
		dc.w $29
		dc.b $10
		dc.b $10
		ScriptID    $A5,$9C	; Run text script at offset 0x028806
					; 0xE0A5: PRINT	MSG 0x00F2, MSGBOX CLEARED, END
		ScriptID    $A6,$9D	; Run text script at offset 0x028808
					; 0xE0A6: PRINT	MSG 0x00F3, MSGBOX CLEARED, END
		ScriptJump  CS_NULL,$9E	; Jump to address 0x0280E6
		ScriptJump  CS_NULL,$9F	; Jump to address 0x0280E6
		ScriptID    $9C,$A0	; Run text script at offset 0x0287F4
					; 0xE09C: PRINT	MSG 0x00E9, MSGBOX CLEARED, END
		dc.w $294
		dc.b $10
		dc.b $10
		ScriptID    $8BD,$A3	; Run text script at offset 0x029836
					; 0xE6C9: PRINT	MSG 0x0716, MSGBOX CLEARED, END
		ScriptJump  ShopLeave_08,$A4 ; Jump to address 0x02600C
		ScriptJump  ShopPrice_08,$A5 ; Jump to address 0x026026
		ScriptJump  Shop_08,$A6	; Jump to address 0x02603E
		ScriptID    $8C4,$A7	; Run text script at offset 0x029844
					; 0xE6D0: PRINT	MSG 0x071D, MSGBOX CLEARED, END
		dc.w $205
		dc.b $10
		dc.b $10
		ScriptID    $A7,$AA	; Run text script at offset 0x02880A
					; 0xE0A7: PRINT	MSG 0x00F4, MSGBOX CLEARED, END
		ScriptID    $A8,$AB	; Run text script at offset 0x02880C
					; 0xE0A8: PRINT	MSG 0x00F5, MSGBOX CLEARED, END
		ScriptJump  ShopPrice_04,$AC ; Jump to address 0x026D12
		ScriptJump  Shop_04,$AD	; Jump to address 0x026D18
		ScriptID    $A9,$AE	; Run text script at offset 0x02880E
					; 0xE0A9: PRINT	MSG 0x00F6, MSGBOX CLEARED, END
		dc.w $20E
		dc.b $13
		dc.b $30
		ScriptID    $AA,$B1	; Run text script at offset 0x028810
					; 0xE0AA: PRINT	MSG 0x00F7, MSGBOX CLEARED, END
		ScriptID    $93,$B2	; Run text script at offset 0x0287E2
					; 0xE093: PRINT	MSG 0x00E0, MSGBOX CLEARED, END
		ScriptJump  ShopPrice_03,$B3 ; Jump to address 0x026D00
		ScriptJump  Shop_03,$B4	; Jump to address 0x026D06
		ScriptID    $94,$B5	; Run text script at offset 0x0287E4
					; 0xE094: PRINT	MSG 0x00E1, MSGBOX CLEARED, END
		dc.w $131
		dc.b $10
		dc.b $10
		ScriptID    $A5,$B8	; Run text script at offset 0x028806
					; 0xE0A5: PRINT	MSG 0x00F2, MSGBOX CLEARED, END
		ScriptID    $A6,$B9	; Run text script at offset 0x028808
					; 0xE0A6: PRINT	MSG 0x00F3, MSGBOX CLEARED, END
		ScriptJump  CS_NULL,$BA	; Jump to address 0x0280E6
		ScriptJump  CS_NULL,$BB	; Jump to address 0x0280E6
		ScriptID    $9C,$BC	; Run text script at offset 0x0287F4
					; 0xE09C: PRINT	MSG 0x00E9, MSGBOX CLEARED, END
		dc.w $188
		dc.b $10
		dc.b $10
		ScriptJump  CS_NULL,$BF	; Jump to address 0x0280E6
		ScriptJump  CS_NULL,$C0	; Jump to address 0x0280E6
		ScriptJump  CS_NULL,$C1	; Jump to address 0x0280E6
		ScriptJump  CS_NULL,$C2	; Jump to address 0x0280E6
		ScriptID    $9C,$C3	; Run text script at offset 0x0287F4
					; 0xE09C: PRINT	MSG 0x00E9, MSGBOX CLEARED, END
		dc.w $FFFF
