; ---------------------------------------------------------------------------

ShopPrice_01:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $9,$0	; Run text script at offset 0x0286CE
					; 0xE009: PRINT	MSG 0x0056, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

Shop_01:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $A,$0	; Sale prompt:	     Run text script at	offset 0x0286D0
					; 0xA00A: PRINT	MSG 0x0057, END
		ScriptID    $B,$1	; Sale confirmation: Run text script at	offset 0x0286D2
					; 0xE00B: PRINT	MSG 0x0058, MSGBOX CLEARED, END
		ScriptID    $C,$2	; Not enough money:  Run text script at	offset 0x0286D4
					; 0xE00C: PRINT	MSG 0x0059, MSGBOX CLEARED, END
		ScriptID    $D,$3	; Sale declined:     Run text script at	offset 0x0286D6
					; 0xE00D: PRINT	MSG 0x005A, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

ShopPrice_02:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $3C,$0	; Run text script at offset 0x028734
					; 0xE03C: PRINT	MSG 0x0089, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

Shop_02:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $3D,$0	; Sale prompt:	     Run text script at	offset 0x028736
					; 0xA03D: PRINT	MSG 0x008A, END
		ScriptID    $3E,$1	; Sale confirmation: Run text script at	offset 0x028738
					; 0xE03E: PRINT	MSG 0x008B, MSGBOX CLEARED, END
		ScriptID    $3F,$2	; Not enough money:  Run text script at	offset 0x02873A
					; 0xE03F: PRINT	MSG 0x008C, MSGBOX CLEARED, END
		ScriptID    $40,$3	; Sale declined:     Run text script at	offset 0x02873C
					; 0xE040: PRINT	MSG 0x008D, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

ShopPrice_03:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $4C,$0	; Run text script at offset 0x028754
					; 0xE04C: PRINT	MSG 0x0099, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

Shop_03:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $4D,$0	; Sale prompt:	     Run text script at	offset 0x028756
					; 0xA04D: PRINT	MSG 0x009A, END
		ScriptID    $4E,$1	; Sale confirmation: Run text script at	offset 0x028758
					; 0xE04E: PRINT	MSG 0x009B, MSGBOX CLEARED, END
		ScriptID    $4F,$2	; Not enough money:  Run text script at	offset 0x02875A
					; 0xE04F: PRINT	MSG 0x009C, MSGBOX CLEARED, END
		ScriptID    $50,$3	; Sale declined:     Run text script at	offset 0x02875C
					; 0xE050: PRINT	MSG 0x009D, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

ShopPrice_04:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $54,$0	; Run text script at offset 0x028764
					; 0xE054: PRINT	MSG 0x00A1, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

Shop_04:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $55,$0	; Sale prompt:	     Run text script at	offset 0x028766
					; 0xA055: PRINT	MSG 0x00A2, END
		ScriptID    $56,$1	; Sale confirmation: Run text script at	offset 0x028768
					; 0xE056: PRINT	MSG 0x00A3, MSGBOX CLEARED, END
		ScriptID    $57,$2	; Not enough money:  Run text script at	offset 0x02876A
					; 0xE057: PRINT	MSG 0x00A4, MSGBOX CLEARED, END
		ScriptID    $58,$3	; Sale declined:     Run text script at	offset 0x02876C
					; 0xE058: PRINT	MSG 0x00A5, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

ShopPrice_05:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $64,$0	; Run text script at offset 0x028784
					; 0xE064: PRINT	MSG 0x00B1, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

Shop_05:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $65,$0	; Sale prompt:	     Run text script at	offset 0x028786
					; 0xA065: PRINT	MSG 0x00B2, END
		ScriptID    $66,$1	; Sale confirmation: Run text script at	offset 0x028788
					; 0xE066: PRINT	MSG 0x00B3, MSGBOX CLEARED, END
		ScriptID    $67,$2	; Not enough money:  Run text script at	offset 0x02878A
					; 0xE067: PRINT	MSG 0x00B4, MSGBOX CLEARED, END
		ScriptID    $68,$3	; Sale declined:     Run text script at	offset 0x02878C
					; 0xE068: PRINT	MSG 0x00B5, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

ShopPrice_06:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptJump  ShopPrice_06_1,$0 ;	Jump to	address	0x026D48
; ---------------------------------------------------------------------------

Shop_06:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $6E,$0	; Sale prompt:	     Run text script at	offset 0x028798
					; 0xA06E: PRINT	MSG 0x00BB, END
		ScriptID    $6F,$1	; Sale confirmation: Run text script at	offset 0x02879A
					; 0xE06F: PRINT	MSG 0x00BC, MSGBOX CLEARED, END
		ScriptID    $70,$2	; Not enough money:  Run text script at	offset 0x02879C
					; 0xE070: PRINT	MSG 0x00BD, MSGBOX CLEARED, END
		ScriptID    $71,$3	; Sale declined:     Run text script at	offset 0x02879E
					; 0xE071: PRINT	MSG 0x00BE, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

ShopPrice_06_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $153		; Bit 3	of flag	0x02A
		ScriptID    $6C,$1	; Flag set:   Run text script at offset	0x028794
					; 0xE06C: PRINT	MSG 0x00B9, MSGBOX CLEARED, END
		ScriptID    $6D,$2	; Flag clear: Run text script at offset	0x028796
					; 0xE06D: PRINT	MSG 0x00BA, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopPrice_07:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptJump  ShopPrice_07_1,$0 ;	Jump to	address	0x026D8A
; ---------------------------------------------------------------------------

Shop_07:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptJump  ShopSalePrompt_07,$0 ; Sale	prompt:	      Jump to address 0x026D96
		ScriptJump  ShopSaleConfirm_07,$1 ; Sale confirmation: Jump to address 0x026DA2
		ScriptJump  ShopNoMoney_07,$2 ;	Not enough money:  Jump	to address 0x026DAE
		ScriptJump  ShopSaleDeclined_07,$3 ; Sale declined:	Jump to	address	0x026DBA
; ---------------------------------------------------------------------------

ShopEnter_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $88,$1	; Flag set:   Run text script at offset	0x0287CC
					; 0xE088: PRINT	MSG 0x00D5, MSGBOX CLEARED, END
		ScriptID    $7E,$2	; Flag clear: Run text script at offset	0x0287B8
					; 0xE07E: PRINT	MSG 0x00CB, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopLeave_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $89,$1	; Flag set:   Run text script at offset	0x0287CE
					; 0xE089: PRINT	MSG 0x00D6, MSGBOX CLEARED, END
		ScriptID    $7F,$2	; Flag clear: Run text script at offset	0x0287BA
					; 0xE07F: PRINT	MSG 0x00CC, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSteal_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $8F,$1	; Flag set:   Run text script at offset	0x0287DA
					; 0xE08F: PRINT	MSG 0x00DC, MSGBOX CLEARED, END
		ScriptID    $85,$2	; Flag clear: Run text script at offset	0x0287C6
					; 0xE085: PRINT	MSG 0x00D2, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopPrice_07_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $8A,$1	; Flag set:   Run text script at offset	0x0287D0
					; 0xE08A: PRINT	MSG 0x00D7, MSGBOX CLEARED, END
		ScriptID    $80,$2	; Flag clear: Run text script at offset	0x0287BC
					; 0xE080: PRINT	MSG 0x00CD, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSalePrompt_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $8B,$1	; Flag set:   Run text script at offset	0x0287D2
					; 0xA08B: PRINT	MSG 0x00D8, END
		ScriptID    $81,$2	; Flag clear: Run text script at offset	0x0287BE
					; 0xA081: PRINT	MSG 0x00CE, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSaleConfirm_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $8C,$1	; Flag set:   Run text script at offset	0x0287D4
					; 0xE08C: PRINT	MSG 0x00D9, MSGBOX CLEARED, END
		ScriptID    $82,$2	; Flag clear: Run text script at offset	0x0287C0
					; 0xE082: PRINT	MSG 0x00CF, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopNoMoney_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $8D,$1	; Flag set:   Run text script at offset	0x0287D6
					; 0xE08D: PRINT	MSG 0x00DA, MSGBOX CLEARED, END
		ScriptID    $83,$2	; Flag clear: Run text script at offset	0x0287C2
					; 0xE083: PRINT	MSG 0x00D0, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSaleDeclined_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $8E,$1	; Flag set:   Run text script at offset	0x0287D8
					; 0xE08E: PRINT	MSG 0x00DB, MSGBOX CLEARED, END
		ScriptID    $84,$2	; Flag clear: Run text script at offset	0x0287C4
					; 0xE084: PRINT	MSG 0x00D1, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopMap_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $90,$1	; Flag set:   Run text script at offset	0x0287DC
					; 0xE090: PRINT	MSG 0x00DD, MSGBOX CLEARED, END
		ScriptID    $86,$2	; Flag clear: Run text script at offset	0x0287C8
					; 0xE086: PRINT	MSG 0x00D3, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopConfirmMap_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $91,$1	; Flag set:   Run text script at offset	0x0287DE
					; 0xA091: PRINT	MSG 0x00DE, END
		ScriptID    $87,$2	; Flag clear: Run text script at offset	0x0287CA
					; 0xA087: PRINT	MSG 0x00D4, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

HandleIdentifyRecordBook:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $24,$0	; Normal priest:   Run text script at offset 0x028704
					; 0xE024: PRINT	MSG 0x0071, MSGBOX CLEARED, END
		ScriptID    $9D,$1	; Skeleton priest: Run text script at offset 0x0287F6
					; 0xE09D: PRINT	MSG 0x00EA, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

RequestGameSaveMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $25,$0	; Normal priest:   Run text script at offset 0x028706
					; 0xA025: PRINT	MSG 0x0072, END
		ScriptID    $9E,$1	; Skeleton priest: Run text script at offset 0x0287F8
					; 0xA09E: PRINT	MSG 0x00EB, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

InitiateGameSaveMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $26,$0	; Normal priest:   Run text script at offset 0x028708
					; 0xA026: PRINT	MSG 0x0073, END
		ScriptID    $9F,$1	; Skeleton priest: Run text script at offset 0x0287FA
					; 0xA09F: PRINT	MSG 0x00EC, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

GameSaveCompleteMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $27,$0	; Normal priest:   Run text script at offset 0x02870A
					; 0xA027: PRINT	MSG 0x0074, END
		ScriptID    $A0,$1	; Skeleton priest: Run text script at offset 0x0287FC
					; 0xA0A0: PRINT	MSG 0x00ED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

GameSaveRefusedMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $28,$0	; Normal priest:   Run text script at offset 0x02870C
					; 0xA028: PRINT	MSG 0x0075, END
		ScriptID    $A1,$1	; Skeleton priest: Run text script at offset 0x0287FE
					; 0xA0A1: PRINT	MSG 0x00EE, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

RequestGameContinueMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $29,$0	; Normal priest:   Run text script at offset 0x02870E
					; 0xA029: PRINT	MSG 0x0076, END
		ScriptID    $A2,$1	; Skeleton priest: Run text script at offset 0x028800
					; 0xA0A2: PRINT	MSG 0x00EF, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ConfirmGameContinueMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2A,$0	; Normal priest:   Run text script at offset 0x028710
					; 0xE02A: PRINT	MSG 0x0077, MSGBOX CLEARED, END
		ScriptID    $A3,$1	; Skeleton priest: Run text script at offset 0x028802
					; 0xE0A3: PRINT	MSG 0x00F0, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ConfirmGameStopMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2B,$0	; Normal priest:   Run text script at offset 0x028712
					; 0xE02B: PRINT	MSG 0x0078, MSGBOX CLEARED, END
		ScriptID    $A4,$1	; Skeleton priest: Run text script at offset 0x028804
					; 0xE0A4: PRINT	MSG 0x00F1, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

HandleRecordBookTheft:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $14,$0	; Normal priest:   Run text script at offset 0x0286E4
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END
		ScriptID    $9C,$1	; Skeleton priest: Run text script at offset 0x0287F4
					; 0xE09C: PRINT	MSG 0x00E9, MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
