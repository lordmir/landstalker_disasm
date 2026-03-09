; ---------------------------------------------------------------------------

ShopPrice_01:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $2A,$0	; Vowel:  Run text script at offset 0x02796E
					; 0xE02A: PRINT	MSG 0x0078, MSGBOX CLEARED, END: "{6A}L'{6E}{66}co�te {69} Ors.{6D}"
		ScriptID    $2B,$1	; Fem:	  Run text script at offset 0x027970
					; 0xE02B: PRINT	MSG 0x0079, MSGBOX CLEARED, END: "{6A}La {6E}{66}co�te {69} Ors.{6D}"
		ScriptID    $2C,$2	; Masc:	  Run text script at offset 0x027972
					; 0xE02C: PRINT	MSG 0x007A, MSGBOX CLEARED, END: "{6A}Le {6E}{66}co�te {69} Ors.{6D}"
		ScriptID    $2D,$3	; Plural: Run text script at offset 0x027974
					; 0xE02D: PRINT	MSG 0x007B, MSGBOX CLEARED, END: "{6A}Les {6E}{66}co�te	{69} Ors.{6D}"
		ScriptID    $2E,$4	; None:	  Run text script at offset 0x027976
					; 0xE02E: PRINT	MSG 0x007C, MSGBOX CLEARED, END: "{6A}{6E}{66}co�te {69} Ors.{6D}"
; ---------------------------------------------------------------------------

Shop_01:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2F,$0	; Sale prompt:	     Run text script at	offset 0x027978
					; 0xA02F: PRINT	MSG 0x007D, END: "{6A}Cela fera{66}{69}	Ors, d'accord?{66}{67}"
		ScriptID    $30,$1	; Sale confirmation: Run text script at	offset 0x02797A
					; 0xE030: PRINT	MSG 0x007E, MSGBOX CLEARED, END: "{6A}Merci infiniment.{6D}"
		ScriptID    $52,$2	; Not enough money:  Run text script at	offset 0x0279BE
					; 0xE052: PRINT	MSG 0x00A0, MSGBOX CLEARED, END: "{6A}Dommage!{66}Il vous manque quelques Ors.{6D}"
		ScriptID    $34,$3	; Sale declined:     Run text script at	offset 0x027982
					; 0xE034: PRINT	MSG 0x0082, MSGBOX CLEARED, END: "{6A}Vous avez{66}chang� d'avis?{6D}"
; ---------------------------------------------------------------------------

ShopPrice_02:
		bsr.w	DisplayItemPriceMessage
		ScriptID    $3D,$0	; Vowel:  Run text script at offset 0x027994
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{6A}Notre meilleur {6E}.{66}Qualit� sup�rieure!{6D}"
		ScriptID    $3D,$1	; Fem:	  Run text script at offset 0x027994
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{6A}Notre meilleur {6E}.{66}Qualit� sup�rieure!{6D}"
		ScriptID    $3D,$2	; Masc:	  Run text script at offset 0x027994
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{6A}Notre meilleur {6E}.{66}Qualit� sup�rieure!{6D}"
		ScriptID    $3D,$3	; Plural: Run text script at offset 0x027994
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{6A}Notre meilleur {6E}.{66}Qualit� sup�rieure!{6D}"
		ScriptID    $3D,$4	; None:	  Run text script at offset 0x027994
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{6A}Notre meilleur {6E}.{66}Qualit� sup�rieure!{6D}"

Shop_02:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2F,$0	; Sale prompt:	     Run text script at	offset 0x027978
					; 0xA02F: PRINT	MSG 0x007D, END: "{6A}Cela fera{66}{69}	Ors, d'accord?{66}{67}"
		ScriptID    $30,$1	; Sale confirmation: Run text script at	offset 0x02797A
					; 0xE030: PRINT	MSG 0x007E, MSGBOX CLEARED, END: "{6A}Merci infiniment.{6D}"
		ScriptID    $52,$2	; Not enough money:  Run text script at	offset 0x0279BE
					; 0xE052: PRINT	MSG 0x00A0, MSGBOX CLEARED, END: "{6A}Dommage!{66}Il vous manque quelques Ors.{6D}"
		ScriptID    $34,$3	; Sale declined:     Run text script at	offset 0x027982
					; 0xE034: PRINT	MSG 0x0082, MSGBOX CLEARED, END: "{6A}Vous avez{66}chang� d'avis?{6D}"
; ---------------------------------------------------------------------------

ShopPrice_03:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $2A,$0	; Vowel:  Run text script at offset 0x02796E
					; 0xE02A: PRINT	MSG 0x0078, MSGBOX CLEARED, END: "{6A}L'{6E}{66}co�te {69} Ors.{6D}"
		ScriptID    $2B,$1	; Fem:	  Run text script at offset 0x027970
					; 0xE02B: PRINT	MSG 0x0079, MSGBOX CLEARED, END: "{6A}La {6E}{66}co�te {69} Ors.{6D}"
		ScriptID    $2C,$2	; Masc:	  Run text script at offset 0x027972
					; 0xE02C: PRINT	MSG 0x007A, MSGBOX CLEARED, END: "{6A}Le {6E}{66}co�te {69} Ors.{6D}"
		ScriptID    $2D,$3	; Plural: Run text script at offset 0x027974
					; 0xE02D: PRINT	MSG 0x007B, MSGBOX CLEARED, END: "{6A}Les {6E}{66}co�te	{69} Ors.{6D}"
		ScriptID    $2E,$4	; None:	  Run text script at offset 0x027976
					; 0xE02E: PRINT	MSG 0x007C, MSGBOX CLEARED, END: "{6A}{6E}{66}co�te {69} Ors.{6D}"
; ---------------------------------------------------------------------------

Shop_03:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2F,$0	; Sale prompt:	     Run text script at	offset 0x027978
					; 0xA02F: PRINT	MSG 0x007D, END: "{6A}Cela fera{66}{69}	Ors, d'accord?{66}{67}"
		ScriptID    $30,$1	; Sale confirmation: Run text script at	offset 0x02797A
					; 0xE030: PRINT	MSG 0x007E, MSGBOX CLEARED, END: "{6A}Merci infiniment.{6D}"
		ScriptID    $52,$2	; Not enough money:  Run text script at	offset 0x0279BE
					; 0xE052: PRINT	MSG 0x00A0, MSGBOX CLEARED, END: "{6A}Dommage!{66}Il vous manque quelques Ors.{6D}"
		ScriptID    $34,$3	; Sale declined:     Run text script at	offset 0x027982
					; 0xE034: PRINT	MSG 0x0082, MSGBOX CLEARED, END: "{6A}Vous avez{66}chang� d'avis?{6D}"
; ---------------------------------------------------------------------------

ShopPrice_04:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $33,$0	; Vowel:  Run text script at offset 0x027980
					; 0xE033: PRINT	MSG 0x0081, MSGBOX CLEARED, END: "{6A}Vous avez	l'oeil{66}pour la qualit�, je vois.{66}Je vous le recommende!{6D}"
		ScriptID    $33,$1	; Fem:	  Run text script at offset 0x027980
					; 0xE033: PRINT	MSG 0x0081, MSGBOX CLEARED, END: "{6A}Vous avez	l'oeil{66}pour la qualit�, je vois.{66}Je vous le recommende!{6D}"
		ScriptID    $33,$2	; Masc:	  Run text script at offset 0x027980
					; 0xE033: PRINT	MSG 0x0081, MSGBOX CLEARED, END: "{6A}Vous avez	l'oeil{66}pour la qualit�, je vois.{66}Je vous le recommende!{6D}"
		ScriptID    $33,$3	; Plural: Run text script at offset 0x027980
					; 0xE033: PRINT	MSG 0x0081, MSGBOX CLEARED, END: "{6A}Vous avez	l'oeil{66}pour la qualit�, je vois.{66}Je vous le recommende!{6D}"
		ScriptID    $33,$4	; None:	  Run text script at offset 0x027980
					; 0xE033: PRINT	MSG 0x0081, MSGBOX CLEARED, END: "{6A}Vous avez	l'oeil{66}pour la qualit�, je vois.{66}Je vous le recommende!{6D}"
; ---------------------------------------------------------------------------

Shop_04:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2F,$0	; Sale prompt:	     Run text script at	offset 0x027978
					; 0xA02F: PRINT	MSG 0x007D, END: "{6A}Cela fera{66}{69}	Ors, d'accord?{66}{67}"
		ScriptID    $30,$1	; Sale confirmation: Run text script at	offset 0x02797A
					; 0xE030: PRINT	MSG 0x007E, MSGBOX CLEARED, END: "{6A}Merci infiniment.{6D}"
		ScriptID    $52,$2	; Not enough money:  Run text script at	offset 0x0279BE
					; 0xE052: PRINT	MSG 0x00A0, MSGBOX CLEARED, END: "{6A}Dommage!{66}Il vous manque quelques Ors.{6D}"
		ScriptID    $34,$3	; Sale declined:     Run text script at	offset 0x027982
					; 0xE034: PRINT	MSG 0x0082, MSGBOX CLEARED, END: "{6A}Vous avez{66}chang� d'avis?{6D}"
; ---------------------------------------------------------------------------

ShopPrice_05:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
        ScriptID    $2A,$0      ; Vowel:  Run text script at offset 0x02796E
                                ; 0xE02A: PRINT MSG 0x0078, MSGBOX CLEARED, END: "{6A}L'{6E}{66}coûte {69} Ors.{6D}"
        ScriptID    $2B,$1      ; Fem:    Run text script at offset 0x027970
                                ; 0xE02B: PRINT MSG 0x0079, MSGBOX CLEARED, END: "{6A}La {6E}{66}coûte {69} Ors.{6D}"
        ScriptID    $2C,$2      ; Masc:   Run text script at offset 0x027972
                                ; 0xE02C: PRINT MSG 0x007A, MSGBOX CLEARED, END: "{6A}Le {6E}{66}coûte {69} Ors.{6D}"
        ScriptID    $2D,$3      ; Plural: Run text script at offset 0x027974
                                ; 0xE02D: PRINT MSG 0x007B, MSGBOX CLEARED, END: "{6A}Les {6E}{66}coûte {69} Ors.{6D}"
        ScriptID    $2E,$4      ; None:   Run text script at offset 0x027976
                                ; 0xE02E: PRINT MSG 0x007C, MSGBOX CLEARED, END: "{6A}{6E}{66}coûte {69} Ors.{6D}"
; ---------------------------------------------------------------------------

Shop_05:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2F,$0	; Sale prompt:	     Run text script at	offset 0x027978
					; 0xA02F: PRINT	MSG 0x007D, END: "{6A}Cela fera{66}{69}	Ors, d'accord?{66}{67}"
		ScriptID    $30,$1	; Sale confirmation: Run text script at	offset 0x02797A
					; 0xE030: PRINT	MSG 0x007E, MSGBOX CLEARED, END: "{6A}Merci infiniment.{6D}"
		ScriptID    $52,$2	; Not enough money:  Run text script at	offset 0x0279BE
					; 0xE052: PRINT	MSG 0x00A0, MSGBOX CLEARED, END: "{6A}Dommage!{66}Il vous manque quelques Ors.{6D}"
		ScriptID    $34,$3	; Sale declined:     Run text script at	offset 0x027982
					; 0xE034: PRINT	MSG 0x0082, MSGBOX CLEARED, END: "{6A}Vous avez{66}chang� d'avis?{6D}"
; ---------------------------------------------------------------------------

ShopPrice_06:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $3D,$0	; Vowel:  Run text script at offset 0x027994
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{6A}Notre meilleur {6E}.{66}Qualit� sup�rieure!{6D}"
word_25F66:	ScriptID    $3D,$1	; Fem:	  Run text script at offset 0x027994
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{6A}Notre meilleur {6E}.{66}Qualit� sup�rieure!{6D}"
		ScriptID    $3D,$2	; Masc:	  Run text script at offset 0x027994
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{6A}Notre meilleur {6E}.{66}Qualit� sup�rieure!{6D}"
		ScriptID    $3D,$3	; Plural: Run text script at offset 0x027994
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{6A}Notre meilleur {6E}.{66}Qualit� sup�rieure!{6D}"
		ScriptID    $3D,$4	; None:	  Run text script at offset 0x027994
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{6A}Notre meilleur {6E}.{66}Qualit� sup�rieure!{6D}"
; ---------------------------------------------------------------------------

Shop_06:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2F,$0	; Sale prompt:	     Run text script at	offset 0x027978
					; 0xA02F: PRINT	MSG 0x007D, END: "{6A}Cela fera{66}{69}	Ors, d'accord?{66}{67}"
		ScriptID    $3E,$1	; Sale confirmation: Run text script at	offset 0x027996
					; 0xE03E: PRINT	MSG 0x008C, MSGBOX CLEARED, END: "{6A}Merci, Ryle.{66}Ce sera bien utile,{66}c'est moi qui vous le dis!{6D}"
word_25F76:	ScriptID    $52,$2	; Not enough money:  Run text script at	offset 0x0279BE
					; 0xE052: PRINT	MSG 0x00A0, MSGBOX CLEARED, END: "{6A}Dommage!{66}Il vous manque quelques Ors.{6D}"
		ScriptID    $3F,$3	; Sale declined:     Run text script at	offset 0x027998
					; 0xE03F: PRINT	MSG 0x008D, MSGBOX CLEARED, END: "{6A}J'en suis d�sol� ...{6D}"
; ---------------------------------------------------------------------------

ShopPrice_07:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptJump  Shop_07_ItemPriceV,$0 ; Vowel:  Jump to address 0x025FB8
		ScriptJump  Shop_07_ItemPriceF,$1 ; Fem:    Jump to address 0x025FC4
		ScriptJump  Shop_07_ItemPriceM,$2 ; Masc:   Jump to address 0x025FD0
		ScriptJump  Shop_07_ItemPriceP,$3 ; Plural: Jump to address 0x025FDC
		ScriptJump  Shop_07_ItemPriceX,$4 ; None:   Jump to address 0x025FE8
; ---------------------------------------------------------------------------

Shop_07:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptJump  ShopSalePrompt_07,$0 ; Sale	prompt:	      Jump to address 0x025FF4
		ScriptJump  ShopSaleConfirm_07,$1 ; Sale confirmation: Jump to address 0x026000
		ScriptJump  ShopNoMoney_07,$2 ;	Not enough money:  Jump	to address 0x02600C
		ScriptJump  ShopSaleDeclined_07,$3 ; Sale declined:	Jump to	address	0x026018
; ---------------------------------------------------------------------------

ShopEnter_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $51,$1	; Flag set:   Run text script at offset	0x0279BC
					; 0xE051: PRINT	MSG 0x009F, MSGBOX CLEARED, END: "{6A}Bonjour, l'ami!{66}Je peux vous aider?{6D}"
		ScriptID    $43,$2	; Flag clear: Run text script at offset	0x0279A0
					; 0xE043: PRINT	MSG 0x0091, MSGBOX CLEARED, END: "{6A}...kof...kof...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopLeave_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $29,$1	; Flag set:   Run text script at offset	0x02796C
					; 0xE029: PRINT	MSG 0x0077, MSGBOX CLEARED, END: "{6A}Merci!  A	bient�t!{6D}"
		ScriptID    $44,$2	; Flag clear: Run text script at offset	0x0279A2
					; 0xE044: PRINT	MSG 0x0092, MSGBOX CLEARED, END: "{6A}...Au revoir...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSteal_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $31,$1	; Flag set:   Run text script at offset	0x02797C
					; 0xE031: PRINT	MSG 0x007F, MSGBOX CLEARED, END: "{6A}Oh�!  Vous, l�!!{6D}"
		ScriptID    $4E,$2	; Flag clear: Run text script at offset	0x0279B6
					; 0xE04E: PRINT	MSG 0x009C, MSGBOX CLEARED, END: "{6A}Halte!...{66}...kof, kof...  AU VOLEUR!...{66}...kof, kof....kof...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

Shop_07_ItemPriceV:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $3D,$1	; Flag set:   Run text script at offset	0x027994
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{6A}Notre meilleur {6E}.{66}Qualit� sup�rieure!{6D}"
		ScriptID    $45,$2	; Flag clear: Run text script at offset	0x0279A4
					; 0xE045: PRINT	MSG 0x0093, MSGBOX CLEARED, END: "{6A}...L'{6E}...kof...{66}...{69} Ors...  kof, kof!...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

Shop_07_ItemPriceF:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $3D,$1	; Flag set:   Run text script at offset	0x027994
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{6A}Notre meilleur {6E}.{66}Qualit� sup�rieure!{6D}"
		ScriptID    $46,$2	; Flag clear: Run text script at offset	0x0279A6
					; 0xE046: PRINT	MSG 0x0094, MSGBOX CLEARED, END: "{6A}...La {6E}...kof...{66}...{69} Ors...  kof, kof!...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

Shop_07_ItemPriceM:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $3D,$1	; Flag set:   Run text script at offset	0x027994
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{6A}Notre meilleur {6E}.{66}Qualit� sup�rieure!{6D}"
		ScriptID    $47,$2	; Flag clear: Run text script at offset	0x0279A8
					; 0xE047: PRINT	MSG 0x0095, MSGBOX CLEARED, END: "{6A}...Le {6E}...kof...{66}...{69} Ors...  kof, kof!...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

Shop_07_ItemPriceP:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $3D,$1	; Flag set:   Run text script at offset	0x027994
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{6A}Notre meilleur {6E}.{66}Qualit� sup�rieure!{6D}"
		ScriptID    $48,$2	; Flag clear: Run text script at offset	0x0279AA
					; 0xE048: PRINT	MSG 0x0096, MSGBOX CLEARED, END: "{6A}...Les {6E}...kof...{66}...{69} Ors...  kof, kof!...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

Shop_07_ItemPriceX:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $3D,$1	; Flag set:   Run text script at offset	0x027994
					; 0xE03D: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{6A}Notre meilleur {6E}.{66}Qualit� sup�rieure!{6D}"
		ScriptID    $49,$2	; Flag clear: Run text script at offset	0x0279AC
					; 0xE049: PRINT	MSG 0x0097, MSGBOX CLEARED, END: "{6A}...{6E}...kof...{66}...{69} Ors...  kof, kof!...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSalePrompt_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $2F,$1	; Flag set:   Run text script at offset	0x027978
					; 0xA02F: PRINT	MSG 0x007D, END: "{6A}Cela fera{66}{69}	Ors, d'accord?{66}{67}"
		ScriptID    $4A,$2	; Flag clear: Run text script at offset	0x0279AE
					; 0xA04A: PRINT	MSG 0x0098, END: "{6A}...Vous l'achetez?...kof{67}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSaleConfirm_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $30,$1	; Flag set:   Run text script at offset	0x02797A
					; 0xE030: PRINT	MSG 0x007E, MSGBOX CLEARED, END: "{6A}Merci infiniment.{6D}"
		ScriptID    $4B,$2	; Flag clear: Run text script at offset	0x0279B0
					; 0xE04B: PRINT	MSG 0x0099, MSGBOX CLEARED, END: "{6A}...ahh...{71}{6A}...AHH...{71}{6A}.ATCHOUM!!!...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopNoMoney_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $52,$1	; Flag set:   Run text script at offset	0x0279BE
					; 0xE052: PRINT	MSG 0x00A0, MSGBOX CLEARED, END: "{6A}Dommage!{66}Il vous manque quelques Ors.{6D}"
		ScriptID    $4C,$2	; Flag clear: Run text script at offset	0x0279B2
					; 0xE04C: PRINT	MSG 0x009A, MSGBOX CLEARED, END: "{6A}..me faut...kof kof...{66}...Il me faut...kof...plus..{66}...  plus d'Ors!...  {71}{6A}...kof kof...kof...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSaleDeclined_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $34,$1	; Flag set:   Run text script at offset	0x027982
					; 0xE034: PRINT	MSG 0x0082, MSGBOX CLEARED, END: "{6A}Vous avez{66}chang� d'avis?{6D}"
		ScriptID    $4D,$2	; Flag clear: Run text script at offset	0x0279B4
					; 0xE04D: PRINT	MSG 0x009B, MSGBOX CLEARED, END: "{6A}Non?...  kof...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopMap_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $37,$1	; Flag set:   Run text script at offset	0x027988
					; 0xE037: PRINT	MSG 0x0085, MSGBOX CLEARED, END: "{6A}C'est le {6E}.{66}Apportez-le au comptoir.{6D}"
		ScriptID    $4F,$2	; Flag clear: Run text script at offset	0x0279B8
					; 0xE04F: PRINT	MSG 0x009D, MSGBOX CLEARED, END: "{6A}...kof...{6E}.{66}...Vous	voulez voir?...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopConfirmMap_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $53,$1	; Flag set:   Run text script at offset	0x0279C0
					; 0xA053: PRINT	MSG 0x00A1, END: "{6A}Vous voulez{66}regarder, peut-�tre?{67}"
		ScriptID    $50,$2	; Flag clear: Run text script at offset	0x0279BA
					; 0xA050: PRINT	MSG 0x009E, END: "{6A}...Je vous en prie...{66}...regardez...  kof...  regardez...{67}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

HandleIdentifyRecordBook:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $17,$0	; Normal priest:   Run text script at offset 0x027948
					; 0xE017: PRINT	MSG 0x0065, MSGBOX CLEARED, END: "{6A}C'est un {6E}.{6D}"
		ScriptID    $5A,$1	; Skeleton priest: Run text script at offset 0x0279CE
					; 0xE05A: PRINT	MSG 0x00A8, MSGBOX CLEARED, END: "{6A}C'est........{66}{6E}............{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

RequestGameSaveMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $18,$0	; Normal priest:   Run text script at offset 0x02794A
					; 0xA018: PRINT	MSG 0x0066, END: "{6A}L'enregistrement{66}est gratuit.{71}{6A}Enregistrer{66}maintenant?{67}"
		ScriptID    $5B,$1	; Skeleton priest: Run text script at offset 0x0279D0
					; 0xA05B: PRINT	MSG 0x00A9, END: "{6A}Puis-je garder...{66}votre enregistrement....?{67}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

InitiateGameSaveMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $19,$0	; Normal priest:   Run text script at offset 0x02794C
					; 0xA019: PRINT	MSG 0x0067, END: "{6A}Bien.  Dans ce cas,{66}permettez-moi d'enregistrer{66}vos aventures dans ce livre.{71}"
		ScriptID    $5C,$1	; Skeleton priest: Run text script at offset 0x0279D2
					; 0xA05C: PRINT	MSG 0x00AA, END: "{6A}Je l'ai........{71}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

GameSaveCompleteMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $1A,$0	; Normal priest:   Run text script at offset 0x02794E
					; 0xA01A: PRINT	MSG 0x0068, END: "{6A}C'est fait!  Vos exploits{66}resteront grav�s pour{66}toujours dans nos coeurs.{71}"
		ScriptID    $5D,$1	; Skeleton priest: Run text script at offset 0x0279D4
					; 0xA05D: PRINT	MSG 0x00AB, END: "{6A}C'est...  termin���...{71}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

GameSaveRefusedMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $1B,$0	; Normal priest:   Run text script at offset 0x027950
					; 0xA01B: PRINT	MSG 0x0069, END: "{6A}Vous en �tes s�r?{66}Vous	savez ce que l'on dit...{66}'Mieux vaut pr�venir...'{71}"
		ScriptID    $5E,$1	; Skeleton priest: Run text script at offset 0x0279D6
					; 0xA05E: PRINT	MSG 0x00AC, END: "{6A}A�e......{71}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

RequestGameContinueMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $1C,$0	; Normal priest:   Run text script at offset 0x027952
					; 0xA01C: PRINT	MSG 0x006A, END: "{6A}D�sirez-vous{66}continuer	votre aventure?{67}"
		ScriptID    $5F,$1	; Skeleton priest: Run text script at offset 0x0279D8
					; 0xA05F: PRINT	MSG 0x00AD, END: "{6A}On...  continue.....?{67}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ConfirmGameContinueMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $1D,$0	; Normal priest:   Run text script at offset 0x027954
					; 0xE01D: PRINT	MSG 0x006B, MSGBOX CLEARED, END: "{6A}Bonne chance!{66}La d�esse veille	sur vous.{6D}"
		ScriptID    $60,$1	; Skeleton priest: Run text script at offset 0x0279DA
					; 0xE060: PRINT	MSG 0x00AE, MSGBOX CLEARED, END: "{6A}Bonne chance...{66}Puisssse la D�esssse...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ConfirmGameStopMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $1E,$0	; Normal priest:   Run text script at offset 0x027956
					; 0xE01E: PRINT	MSG 0x006C, MSGBOX CLEARED, END: "{6A}Reposez-vous bien!{66}Que	la d�esse soit avec vous{66}lors de toutes vos aventures!{6D}"
		ScriptID    $61,$1	; Skeleton priest: Run text script at offset 0x0279DC
					; 0xE061: PRINT	MSG 0x00AF, MSGBOX CLEARED, END: "{6A}Reposez-vous....{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

HandleRecordBookTheft:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $7,$0	; Normal priest:   Run text script at offset 0x027928
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{6A}Arr�tez!{66}Cela appartient � la d�esse.{66}Soyez	maudit!{6D}"
		ScriptID    $59,$1	; Skeleton priest: Run text script at offset 0x0279CC
					; 0xE059: PRINT	MSG 0x00A7, MSGBOX CLEARED, END: "{6A}Nooooon....{66}Ne	l'emportez pas!{6D}"
; ---------------------------------------------------------------------------
		rts
