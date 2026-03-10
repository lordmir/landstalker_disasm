; ---------------------------------------------------------------------------

ShopPrice_01:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $2A,$0	; Neuter: Run text script at offset 0x02764E
					; 0xE02A: PRINT	MSG 0x0078, MSGBOX CLEARED, END: "{47}DAS {4B}{43}KOSTET {46} TALER.{4A}"
		ScriptID    $2B,$1	; Fem:	  Run text script at offset 0x027650
					; 0xE02B: PRINT	MSG 0x0079, MSGBOX CLEARED, END: "{47}DIE {4B}{43}KOSTET {46} TALER.{4A}"
		ScriptID    $2C,$2	; Masc:	  Run text script at offset 0x027652
					; 0xE02C: PRINT	MSG 0x007A, MSGBOX CLEARED, END: "{47}DER {4B}{43}KOSTET {46} TALER.{4A}"
		ScriptID    $2B,$3	; Plural: Run text script at offset 0x027650
					; 0xE02B: PRINT	MSG 0x0079, MSGBOX CLEARED, END: "{47}DIE {4B}{43}KOSTET {46} TALER.{4A}"
		ScriptID    $2D,$4	; None:	  Run text script at offset 0x027654
					; 0xE02D: PRINT	MSG 0x007B, MSGBOX CLEARED, END: "{47}{4B}{43}KOSTET {46} TALER.{4A}"
; ---------------------------------------------------------------------------

Shop_01:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2E,$0	; Sale prompt:	     Run text script at	offset 0x027656
					; 0xA02E: PRINT	MSG 0x007C, END: "{47}DAS MACHT{43}{46}	TALER, OKAY?{44}"
		ScriptID    $2F,$1	; Sale confirmation: Run text script at	offset 0x027658
					; 0xE02F: PRINT	MSG 0x007D, MSGBOX CLEARED, END: "{47}DANKE,{43}VIELEN DANK.{4A}"
		ScriptID    $52,$2	; Not enough money:  Run text script at	offset 0x02769E
					; 0xE052: PRINT	MSG 0x00A0, MSGBOX CLEARED, END: "{47}OH!{43}DA	BRAUCHST DU ABER MEHR GELD.{4A}"
		ScriptID    $33,$3	; Sale declined:     Run text script at	offset 0x027660
					; 0xE033: PRINT	MSG 0x0081, MSGBOX CLEARED, END: "{47}HAST DU{43}ES DIR	ANDERS ÜBERLEGT?{4A}"
; ---------------------------------------------------------------------------

ShopPrice_02:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $3C,$0	; Neuter: Run text script at offset 0x027672
					; 0xE03C: PRINT	MSG 0x008A, MSGBOX CLEARED, END: "{47}UNSER BESTES{43}{4B}.{43}SEHR GUTE QUALITÄT.{4A}"
		ScriptID    $3D,$1	; Fem:	  Run text script at offset 0x027674
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{47}UNSER BESTE{43}{4B}.{43}SEHR GUTE	QUALITÄT.{4A}"
		ScriptID    $3E,$2	; Masc:	  Run text script at offset 0x027676
					; 0xE03E: PRINT	MSG 0x008C, MSGBOX CLEARED, END: "{47}UNSER BESTER{43}{4B}.{43}SEHR GUTE QUALITÄT.{4A}"
		ScriptID    $3D,$3	; Plural: Run text script at offset 0x027674
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{47}UNSER BESTE{43}{4B}.{43}SEHR GUTE	QUALITÄT.{4A}"
		ScriptID    $2D,$4	; None:	  Run text script at offset 0x027654
					; 0xE02D: PRINT	MSG 0x007B, MSGBOX CLEARED, END: "{47}{4B}{43}KOSTET {46} TALER.{4A}"
; ---------------------------------------------------------------------------

Shop_02:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2E,$0	; Sale prompt:	     Run text script at	offset 0x027656
					; 0xA02E: PRINT	MSG 0x007C, END: "{47}DAS MACHT{43}{46}	TALER, OKAY?{44}"
		ScriptID    $2F,$1	; Sale confirmation: Run text script at	offset 0x027658
					; 0xE02F: PRINT	MSG 0x007D, MSGBOX CLEARED, END: "{47}DANKE,{43}VIELEN DANK.{4A}"
		ScriptID    $52,$2	; Not enough money:  Run text script at	offset 0x02769E
					; 0xE052: PRINT	MSG 0x00A0, MSGBOX CLEARED, END: "{47}OH!{43}DA	BRAUCHST DU ABER MEHR GELD.{4A}"
		ScriptID    $33,$3	; Sale declined:     Run text script at	offset 0x027660
					; 0xE033: PRINT	MSG 0x0081, MSGBOX CLEARED, END: "{47}HAST DU{43}ES DIR	ANDERS ÜBERLEGT?{4A}"
; ---------------------------------------------------------------------------

ShopPrice_03:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $2A,$0	; Neuter: Run text script at offset 0x02764E
					; 0xE02A: PRINT	MSG 0x0078, MSGBOX CLEARED, END: "{47}DAS {4B}{43}KOSTET {46} TALER.{4A}"
		ScriptID    $2B,$1	; Fem:	  Run text script at offset 0x027650
					; 0xE02B: PRINT	MSG 0x0079, MSGBOX CLEARED, END: "{47}DIE {4B}{43}KOSTET {46} TALER.{4A}"
		ScriptID    $2C,$2	; Masc:	  Run text script at offset 0x027652
					; 0xE02C: PRINT	MSG 0x007A, MSGBOX CLEARED, END: "{47}DER {4B}{43}KOSTET {46} TALER.{4A}"
		ScriptID    $2B,$3	; Plural: Run text script at offset 0x027650
					; 0xE02B: PRINT	MSG 0x0079, MSGBOX CLEARED, END: "{47}DIE {4B}{43}KOSTET {46} TALER.{4A}"
		ScriptID    $2D,$4	; None:	  Run text script at offset 0x027654
					; 0xE02D: PRINT	MSG 0x007B, MSGBOX CLEARED, END: "{47}{4B}{43}KOSTET {46} TALER.{4A}"
; ---------------------------------------------------------------------------

Shop_03:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2E,$0	; Sale prompt:	     Run text script at	offset 0x027656
					; 0xA02E: PRINT	MSG 0x007C, END: "{47}DAS MACHT{43}{46}	TALER, OKAY?{44}"
		ScriptID    $2F,$1	; Sale confirmation: Run text script at	offset 0x027658
					; 0xE02F: PRINT	MSG 0x007D, MSGBOX CLEARED, END: "{47}DANKE,{43}VIELEN DANK.{4A}"
		ScriptID    $52,$2	; Not enough money:  Run text script at	offset 0x02769E
					; 0xE052: PRINT	MSG 0x00A0, MSGBOX CLEARED, END: "{47}OH!{43}DA	BRAUCHST DU ABER MEHR GELD.{4A}"
		ScriptID    $33,$3	; Sale declined:     Run text script at	offset 0x027660
					; 0xE033: PRINT	MSG 0x0081, MSGBOX CLEARED, END: "{47}HAST DU{43}ES DIR	ANDERS ÜBERLEGT?{4A}"
; ---------------------------------------------------------------------------

ShopPrice_04:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $32,$0	; Neuter: Run text script at offset 0x02765E
					; 0xE032: PRINT	MSG 0x0080, MSGBOX CLEARED, END: "{47}AH...GUTE	WAHL.{43}DAS WIRD GERNE	GENOMMEN.{43}ICH KANN ES NUR EMPFEHLEN!{4A}"
		ScriptID    $32,$1	; Fem:	  Run text script at offset 0x02765E
					; 0xE032: PRINT	MSG 0x0080, MSGBOX CLEARED, END: "{47}AH...GUTE	WAHL.{43}DAS WIRD GERNE	GENOMMEN.{43}ICH KANN ES NUR EMPFEHLEN!{4A}"
		ScriptID    $32,$2	; Masc:	  Run text script at offset 0x02765E
					; 0xE032: PRINT	MSG 0x0080, MSGBOX CLEARED, END: "{47}AH...GUTE	WAHL.{43}DAS WIRD GERNE	GENOMMEN.{43}ICH KANN ES NUR EMPFEHLEN!{4A}"
		ScriptID    $32,$3	; Plural: Run text script at offset 0x02765E
					; 0xE032: PRINT	MSG 0x0080, MSGBOX CLEARED, END: "{47}AH...GUTE	WAHL.{43}DAS WIRD GERNE	GENOMMEN.{43}ICH KANN ES NUR EMPFEHLEN!{4A}"
		ScriptID    $32,$4	; None:	  Run text script at offset 0x02765E
					; 0xE032: PRINT	MSG 0x0080, MSGBOX CLEARED, END: "{47}AH...GUTE	WAHL.{43}DAS WIRD GERNE	GENOMMEN.{43}ICH KANN ES NUR EMPFEHLEN!{4A}"
; ---------------------------------------------------------------------------

Shop_04:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2E,$0	; Sale prompt:	     Run text script at	offset 0x027656
					; 0xA02E: PRINT	MSG 0x007C, END: "{47}DAS MACHT{43}{46}	TALER, OKAY?{44}"
		ScriptID    $2F,$1	; Sale confirmation: Run text script at	offset 0x027658
					; 0xE02F: PRINT	MSG 0x007D, MSGBOX CLEARED, END: "{47}DANKE,{43}VIELEN DANK.{4A}"
		ScriptID    $52,$2	; Not enough money:  Run text script at	offset 0x02769E
					; 0xE052: PRINT	MSG 0x00A0, MSGBOX CLEARED, END: "{47}OH!{43}DA	BRAUCHST DU ABER MEHR GELD.{4A}"
		ScriptID    $33,$3	; Sale declined:     Run text script at	offset 0x027660
					; 0xE033: PRINT	MSG 0x0081, MSGBOX CLEARED, END: "{47}HAST DU{43}ES DIR	ANDERS ÜBERLEGT?{4A}"
; ---------------------------------------------------------------------------

ShopPrice_05:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $2A,$0	; Neuter: Run text script at offset 0x02764E
					; 0xE02A: PRINT	MSG 0x0078, MSGBOX CLEARED, END: "{47}DAS {4B}{43}KOSTET {46} TALER.{4A}"
		ScriptID    $2B,$1	; Fem:	  Run text script at offset 0x027650
					; 0xE02B: PRINT	MSG 0x0079, MSGBOX CLEARED, END: "{47}DIE {4B}{43}KOSTET {46} TALER.{4A}"
		ScriptID    $2C,$2	; Masc:	  Run text script at offset 0x027652
					; 0xE02C: PRINT	MSG 0x007A, MSGBOX CLEARED, END: "{47}DER {4B}{43}KOSTET {46} TALER.{4A}"
		ScriptID    $2B,$3	; Plural: Run text script at offset 0x027650
					; 0xE02B: PRINT	MSG 0x0079, MSGBOX CLEARED, END: "{47}DIE {4B}{43}KOSTET {46} TALER.{4A}"
		ScriptID    $2D,$4	; None:	  Run text script at offset 0x027654
					; 0xE02D: PRINT	MSG 0x007B, MSGBOX CLEARED, END: "{47}{4B}{43}KOSTET {46} TALER.{4A}"
; ---------------------------------------------------------------------------

Shop_05:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2E,$0	; Sale prompt:	     Run text script at	offset 0x027656
					; 0xA02E: PRINT	MSG 0x007C, END: "{47}DAS MACHT{43}{46}	TALER, OKAY?{44}"
		ScriptID    $2F,$1	; Sale confirmation: Run text script at	offset 0x027658
					; 0xE02F: PRINT	MSG 0x007D, MSGBOX CLEARED, END: "{47}DANKE,{43}VIELEN DANK.{4A}"
		ScriptID    $52,$2	; Not enough money:  Run text script at	offset 0x02769E
					; 0xE052: PRINT	MSG 0x00A0, MSGBOX CLEARED, END: "{47}OH!{43}DA	BRAUCHST DU ABER MEHR GELD.{4A}"
		ScriptID    $33,$3	; Sale declined:     Run text script at	offset 0x027660
					; 0xE033: PRINT	MSG 0x0081, MSGBOX CLEARED, END: "{47}HAST DU{43}ES DIR	ANDERS ÜBERLEGT?{4A}"
; ---------------------------------------------------------------------------

ShopPrice_06:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $3C,$0	; Neuter: Run text script at offset 0x027672
					; 0xE03C: PRINT	MSG 0x008A, MSGBOX CLEARED, END: "{47}UNSER BESTES{43}{4B}.{43}SEHR GUTE QUALITÄT.{4A}"
		ScriptID    $3D,$1	; Fem:	  Run text script at offset 0x027674
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{47}UNSER BESTE{43}{4B}.{43}SEHR GUTE	QUALITÄT.{4A}"
		ScriptID    $3E,$2	; Masc:	  Run text script at offset 0x027676
					; 0xE03E: PRINT	MSG 0x008C, MSGBOX CLEARED, END: "{47}UNSER BESTER{43}{4B}.{43}SEHR GUTE QUALITÄT.{4A}"
		ScriptID    $3D,$3	; Plural: Run text script at offset 0x027674
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{47}UNSER BESTE{43}{4B}.{43}SEHR GUTE	QUALITÄT.{4A}"
		ScriptID    $2D,$4	; None:	  Run text script at offset 0x027654
					; 0xE02D: PRINT	MSG 0x007B, MSGBOX CLEARED, END: "{47}{4B}{43}KOSTET {46} TALER.{4A}"
; ---------------------------------------------------------------------------

Shop_06:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2E,$0	; Sale prompt:	     Run text script at	offset 0x027656
					; 0xA02E: PRINT	MSG 0x007C, END: "{47}DAS MACHT{43}{46}	TALER, OKAY?{44}"
		ScriptID    $3F,$1	; Sale confirmation: Run text script at	offset 0x027678
					; 0xE03F: PRINT	MSG 0x008D, MSGBOX CLEARED, END: "{47}VIELEN DANK,{43}NIELS. DU	KANNST ES BESTIMMT{43}GUT GEBRAUCHEN!{4A}"
		ScriptID    $52,$2	; Not enough money:  Run text script at	offset 0x02769E
					; 0xE052: PRINT	MSG 0x00A0, MSGBOX CLEARED, END: "{47}OH!{43}DA	BRAUCHST DU ABER MEHR GELD.{4A}"
		ScriptID    $40,$3	; Sale declined:     Run text script at	offset 0x02767A
					; 0xE040: PRINT	MSG 0x008E, MSGBOX CLEARED, END: "{47}ES TUT MIR{43}WIRKLICH LEID....{4A}"
; ---------------------------------------------------------------------------

ShopPrice_07:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptJump  Shop_07_ItemPriceN,$0 ; Neuter: Jump to address 0x025C98
		ScriptJump  Shop_07_ItemPriceF,$1 ; Fem:    Jump to address 0x025CA4
		ScriptJump  Shop_07_ItemPriceM,$2 ; Masc:   Jump to address 0x025CB0
		ScriptJump  Shop_07_ItemPriceP,$3 ; Plural: Jump to address 0x025CBC
		ScriptJump  Shop_07_ItemPriceX,$4 ; None:   Jump to address 0x025CC8
; ---------------------------------------------------------------------------

Shop_07:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptJump  ShopSalePrompt_07,$0 ; Sale	prompt:	      Jump to address 0x025CD4
		ScriptJump  ShopSaleConfirm_07,$1 ; Sale confirmation: Jump to address 0x025CE0
		ScriptJump  ShopNoMoney_07,$2 ;	Not enough money:  Jump	to address 0x025CEC
		ScriptJump  ShopSaleDeclined_07,$3 ; Sale declined:	Jump to	address	0x025CF8
; ---------------------------------------------------------------------------

ShopEnter_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $51,$1	; Flag set:   Run text script at offset	0x02769C
					; 0xE051: PRINT	MSG 0x009F, MSGBOX CLEARED, END: "{47}HALLO, HALLO!{43}WIE GEHT'S?{4A}"
		ScriptID    $44,$2	; Flag clear: Run text script at offset	0x027682
					; 0xE044: PRINT	MSG 0x0092, MSGBOX CLEARED, END: "{47}...HUST...HUST...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopLeave_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $29,$1	; Flag set:   Run text script at offset	0x02764C
					; 0xE029: PRINT	MSG 0x0077, MSGBOX CLEARED, END: "{47}DANKE!{43}KOMM MAL WIEDER	VORBEI!{4A}"
		ScriptID    $45,$2	; Flag clear: Run text script at offset	0x027684
					; 0xE045: PRINT	MSG 0x0093, MSGBOX CLEARED, END: "{47}...TSCHÜSS..{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSteal_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $30,$1	; Flag set:   Run text script at offset	0x02765A
					; 0xE030: PRINT	MSG 0x007E, MSGBOX CLEARED, END: "{47}HE, DU DA! HE!!{4A}"
		ScriptID    $4E,$2	; Flag clear: Run text script at offset	0x027696
					; 0xE04E: PRINT	MSG 0x009C, MSGBOX CLEARED, END: "{47}HALT!...{43}...HUST, HUST...DIEB!...{43}...HUST, HUST, HUST...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

Shop_07_ItemPriceN:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $3C,$1	; Flag set:   Run text script at offset	0x027672
					; 0xE03C: PRINT	MSG 0x008A, MSGBOX CLEARED, END: "{47}UNSER BESTES{43}{4B}.{43}SEHR GUTE QUALITÄT.{4A}"
		ScriptID    $46,$2	; Flag clear: Run text script at offset	0x027686
					; 0xE046: PRINT	MSG 0x0094, MSGBOX CLEARED, END: "{47}...DAS {4B}{43}...HUST...{46} TALER...{43}...HUST, HUST!...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

Shop_07_ItemPriceF:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $3D,$1	; Flag set:   Run text script at offset	0x027674
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{47}UNSER BESTE{43}{4B}.{43}SEHR GUTE	QUALITÄT.{4A}"
		ScriptID    $47,$2	; Flag clear: Run text script at offset	0x027688
					; 0xE047: PRINT	MSG 0x0095, MSGBOX CLEARED, END: "{47}...DIE {4B}{43}...HUST...{46} TALER...{43}...HUST, HUST!...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

Shop_07_ItemPriceM:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $3E,$1	; Flag set:   Run text script at offset	0x027676
					; 0xE03E: PRINT	MSG 0x008C, MSGBOX CLEARED, END: "{47}UNSER BESTER{43}{4B}.{43}SEHR GUTE QUALITÄT.{4A}"
		ScriptID    $48,$2	; Flag clear: Run text script at offset	0x02768A
					; 0xE048: PRINT	MSG 0x0096, MSGBOX CLEARED, END: "{47}...DER {4B}{43}...HUST...{46} TALER...{43}...HUST, HUST!...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

Shop_07_ItemPriceP:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $3D,$1	; Flag set:   Run text script at offset	0x027674
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{47}UNSER BESTE{43}{4B}.{43}SEHR GUTE	QUALITÄT.{4A}"
		ScriptID    $47,$2	; Flag clear: Run text script at offset	0x027688
					; 0xE047: PRINT	MSG 0x0095, MSGBOX CLEARED, END: "{47}...DIE {4B}{43}...HUST...{46} TALER...{43}...HUST, HUST!...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

Shop_07_ItemPriceX:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $2D,$1	; Flag set:   Run text script at offset	0x027654
					; 0xE02D: PRINT	MSG 0x007B, MSGBOX CLEARED, END: "{47}{4B}{43}KOSTET {46} TALER.{4A}"
		ScriptID    $49,$2	; Flag clear: Run text script at offset	0x02768C
					; 0xE049: PRINT	MSG 0x0097, MSGBOX CLEARED, END: "{47}...{4B}{43}...HUST...{46}	TALER...{43}...HUST, HUST!...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSalePrompt_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $2E,$1	; Flag set:   Run text script at offset	0x027656
					; 0xA02E: PRINT	MSG 0x007C, END: "{47}DAS MACHT{43}{46}	TALER, OKAY?{44}"
		ScriptID    $4A,$2	; Flag clear: Run text script at offset	0x02768E
					; 0xA04A: PRINT	MSG 0x0098, END: "{47}...WILLST	DU{43}...ES KAUFEN?{43}...HUST...{44}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSaleConfirm_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $2F,$1	; Flag set:   Run text script at offset	0x027658
					; 0xE02F: PRINT	MSG 0x007D, MSGBOX CLEARED, END: "{47}DANKE,{43}VIELEN DANK.{4A}"
		ScriptID    $4B,$2	; Flag clear: Run text script at offset	0x027690
					; 0xE04B: PRINT	MSG 0x0099, MSGBOX CLEARED, END: "{47}...AHH{45}.{45}.{45}.{4E}{47}...AHH{45}.{45}.{45}.{47}HATSCHII!!!...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopNoMoney_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $52,$1	; Flag set:   Run text script at offset	0x02769E
					; 0xE052: PRINT	MSG 0x00A0, MSGBOX CLEARED, END: "{47}OH!{43}DA	BRAUCHST DU ABER MEHR GELD.{4A}"
		ScriptID    $4C,$2	; Flag clear: Run text script at offset	0x027692
					; 0xE04C: PRINT	MSG 0x009A, MSGBOX CLEARED, END: "{47}...DU BRAUCHST{43}...HUST, HUST...DU BRAUCHST{43}MEHR...HUST...GELD!...HUST,...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSaleDeclined_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $33,$1	; Flag set:   Run text script at offset	0x027660
					; 0xE033: PRINT	MSG 0x0081, MSGBOX CLEARED, END: "{47}HAST DU{43}ES DIR	ANDERS ÜBERLEGT?{4A}"
		ScriptID    $4D,$2	; Flag clear: Run text script at offset	0x027694
					; 0xE04D: PRINT	MSG 0x009B, MSGBOX CLEARED, END: "{47}NEIN?...{43}...HUST...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopMap_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $36,$1	; Flag set:   Run text script at offset	0x027666
					; 0xE036: PRINT	MSG 0x0084, MSGBOX CLEARED, END: "{47}DAS IST{43}DIE {4B}.{43}BRING SIE	ZUM TRESEN.{4A}"
		ScriptID    $4F,$2	; Flag clear: Run text script at offset	0x027698
					; 0xE04F: PRINT	MSG 0x009D, MSGBOX CLEARED, END: "{47}...HUST...{43}{4B}.....WILLST DU{43}SIE...MAL SEHEN?...HUST...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopConfirmMap_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $53,$1	; Flag set:   Run text script at offset	0x0276A0
					; 0xA053: PRINT	MSG 0x00A1, END: "{47}MÖCHTEST DU{43}SIE MAL SEHEN?{44}"
		ScriptID    $50,$2	; Flag clear: Run text script at offset	0x02769A
					; 0xA050: PRINT	MSG 0x009E, END: "{47}...SIEH...MAL{43}BITTE...HUST!{44}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

HandleIdentifyRecordBook:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $17,$0	; Normal priest:   Run text script at offset 0x027628
					; 0xE017: PRINT	MSG 0x0065, MSGBOX CLEARED, END: "{47}DIES IST EIN{43}{4B}.{4A}"
		ScriptID    $5A,$1	; Skeleton priest: Run text script at offset 0x0276AE
					; 0xE05A: PRINT	MSG 0x00A8, MSGBOX CLEARED, END: "{47}DASS...{43}ISSST...DASS...{43}{4B}...........{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

RequestGameSaveMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $18,$0	; Normal priest:   Run text script at offset 0x02762A
					; 0xA018: PRINT	MSG 0x0066, END: "{47}DU KANNST	HIER{43}DEINE TATEN AUFZEICHNEN	LASSEN.{43}SOLL	ICH SIE	FESTHALTEN?{44}"
		ScriptID    $5B,$1	; Skeleton priest: Run text script at offset 0x0276B0
					; 0xA05B: PRINT	MSG 0x00A9, END: "{47}SOLL ICH DEINE{43}TATEN......FESTHALLLLTT......?{44}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

InitiateGameSaveMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $19,$0	; Normal priest:   Run text script at offset 0x02762C
					; 0xA019: PRINT	MSG 0x0067, END: "{47}GUT, LASS	MICH{43}DEINE HELDENTATEN{43}IN	DIESEM BUCH FESTHALTEN.{4E}"
		ScriptID    $5C,$1	; Skeleton priest: Run text script at offset 0x0276B2
					; 0xA05C: PRINT	MSG 0x00AA, END: "{47}DAS WÄR'S......{4E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

GameSaveCompleteMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $1A,$0	; Normal priest:   Run text script at offset 0x02762E
					; 0xA01A: PRINT	MSG 0x0068, END: "{47}FERTIG! DEINE{43}MUTIGEN TATEN WERDEN WIR	IMMER{43}IN UNSEREN HERZEN BEHALTEN.{4E}"
		ScriptID    $5D,$1	; Skeleton priest: Run text script at offset 0x0276B4
					; 0xA05D: PRINT	MSG 0x00AB, END: "{47}ES ISSSST..{43}...VOORBEEIIIII.....{4E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

GameSaveRefusedMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $1B,$0	; Normal priest:   Run text script at offset 0x027630
					; 0xA01B: PRINT	MSG 0x0069, END: "{47}WIRKLICH?{43}KENNST DU DAS SPRICHWORT{43}"ERST DENKEN, DANN LENKEN"?{4E}"
		ScriptID    $5E,$1	; Skeleton priest: Run text script at offset 0x0276B6
					; 0xA05E: PRINT	MSG 0x00AC, END: "{47}AH, OH......{4E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

RequestGameContinueMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $1C,$0	; Normal priest:   Run text script at offset 0x027632
					; 0xA01C: PRINT	MSG 0x006A, END: "{47}SETZT DU DEIN{43}ABENTEUER FORT?{44}"
		ScriptID    $5F,$1	; Skeleton priest: Run text script at offset 0x0276B8
					; 0xA05F: PRINT	MSG 0x00AD, END: "{47}WEITER...{43}MACHEN......?{44}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ConfirmGameContinueMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $1D,$0	; Normal priest:   Run text script at offset 0x027634
					; 0xE01D: PRINT	MSG 0x006B, MSGBOX CLEARED, END: "{47}VIEL GLÜCK!{43}DIE GÖTTIN	WIRD MIT DIR SEIN.{4A}"
		ScriptID    $60,$1	; Skeleton priest: Run text script at offset 0x0276BA
					; 0xE060: PRINT	MSG 0x00AE, MSGBOX CLEARED, END: "{47}VIIEEL GLÜÜCK..{43}MÖGE DIE GÖTTINNNNNNN.......{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ConfirmGameStopMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $1E,$0	; Normal priest:   Run text script at offset 0x027636
					; 0xE01E: PRINT	MSG 0x006C, MSGBOX CLEARED, END: "{47}RUH' DICH ERSTMAL{43}AUS. DIE GÖTTIN SEGNE DICH{43}BEI DEINEM NÄCHSTEN ABENTEUER!{4A}"
		ScriptID    $61,$1	; Skeleton priest: Run text script at offset 0x0276BC
					; 0xE061: PRINT	MSG 0x00AF, MSGBOX CLEARED, END: "{47}RUH....{43}DICH AUSSSSSSSS....{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

HandleRecordBookTheft:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $7,$0	; Normal priest:   Run text script at offset 0x027608
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{47}HALT!{43}DAS GEHÖRT DER GÖTTIN.{43}ZUM TEUFEL MIT	DIR!{4A}"
		ScriptID    $59,$1	; Skeleton priest: Run text script at offset 0x0276AC
					; 0xE059: PRINT	MSG 0x00A7, MSGBOX CLEARED, END: "{47}NEEIIIINNN....{43}NICHT MITNEEEHHMEEN ......{4A}"
; ---------------------------------------------------------------------------
		rts
