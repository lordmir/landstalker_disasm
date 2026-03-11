; ---------------------------------------------------------------------------

ShopPrice_01:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $9,$0	; Run text script at offset 0x027730
					; 0xE009: PRINT	MSG 0x0056, MSGBOX CLEARED, END: "{5B}:	Oh, yeah, {5F}.{57}It'll cost you {5A} golds.{57}You like it?{5E}"
; ---------------------------------------------------------------------------

Shop_01:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $A,$0	; Sale prompt:	     Run text script at	offset 0x027732
					; 0xA00A: PRINT	MSG 0x0057, END: "{5B}:	{5A} golds...{57}you wanna buy?{58}"
		ScriptID    $B,$1	; Sale confirmation: Run text script at	offset 0x027734
					; 0xE00B: PRINT	MSG 0x0058, MSGBOX CLEARED, END: "{5B}:	Thank you!{57}Don't waste it.{5E}"
		ScriptID    $C,$2	; Not enough money:  Run text script at	offset 0x027736
					; 0xE00C: PRINT	MSG 0x0059, MSGBOX CLEARED, END: "{5B}:	You can't afford that now.{57}Make more golds somewhere!{5E}"
		ScriptID    $D,$3	; Sale declined:     Run text script at	offset 0x027738
					; 0xE00D: PRINT	MSG 0x005A, MSGBOX CLEARED, END: "{5B}:	Are you	just browsing?{5E}"
; ---------------------------------------------------------------------------

ShopPrice_02:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $40,$0	; Run text script at offset 0x02779E
					; 0xE040: PRINT	MSG 0x008D, MSGBOX CLEARED, END: "{5B}:	You want {5F}?{5E}"
; ---------------------------------------------------------------------------

Shop_02:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $41,$0	; Sale prompt:	     Run text script at	offset 0x0277A0
					; 0xA041: PRINT	MSG 0x008E, END: "{5B}:	That'll cost you{57}{5A} golds.  Still want it?{58}"
		ScriptID    $42,$1	; Sale confirmation: Run text script at	offset 0x0277A2
					; 0xE042: PRINT	MSG 0x008F, MSGBOX CLEARED, END: "{5B}:	Thanks a lot!{5E}"
		ScriptID    $43,$2	; Not enough money:  Run text script at	offset 0x0277A4
					; 0xE043: PRINT	MSG 0x0090, MSGBOX CLEARED, END: "{5B}:	Ah...{57}too expensive for you...{5E}"
		ScriptID    $44,$3	; Sale declined:     Run text script at	offset 0x0277A6
					; 0xE044: PRINT	MSG 0x0091, MSGBOX CLEARED, END: "{5B}:	Ah...{57}so you	don't really want it...{5E}"
; ---------------------------------------------------------------------------

ShopPrice_03:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $50,$0	; Run text script at offset 0x0277BE
					; 0xE050: PRINT	MSG 0x009D, MSGBOX CLEARED, END: "{5B}:	{5F} costs{57}{5A} golds.{5E}"
; ---------------------------------------------------------------------------

Shop_03:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $51,$0	; Sale prompt:	     Run text script at	offset 0x0277C0
					; 0xA051: PRINT	MSG 0x009E, END: "{5B}:	That'll be {5A} golds, OK?{58}"
		ScriptID    $52,$1	; Sale confirmation: Run text script at	offset 0x0277C2
					; 0xE052: PRINT	MSG 0x009F, MSGBOX CLEARED, END: "{5B}:	Thank you, thank you.{5E}"
		ScriptID    $53,$2	; Not enough money:  Run text script at	offset 0x0277C4
					; 0xE053: PRINT	MSG 0x00A0, MSGBOX CLEARED, END: "{5B}:	You need more golds{57}than that!{5E}"
		ScriptID    $54,$3	; Sale declined:     Run text script at	offset 0x0277C6
					; 0xE054: PRINT	MSG 0x00A1, MSGBOX CLEARED, END: "{5B}:	You don't know the value{57}of this....{5E}"
; ---------------------------------------------------------------------------

ShopPrice_04:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $58,$0	; Run text script at offset 0x0277CE
					; 0xE058: PRINT	MSG 0x00A5, MSGBOX CLEARED, END: "{5B}:	Ah...a smart shopper.{57}It's very popular these days.{57}I recommend it!{5E}"
; ---------------------------------------------------------------------------

Shop_04:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $59,$0	; Sale prompt:	     Run text script at	offset 0x0277D0
					; 0xA059: PRINT	MSG 0x00A6, END: "{5B}:	You want this?{57}{5A} golds, stranger.{58}"
		ScriptID    $5A,$1	; Sale confirmation: Run text script at	offset 0x0277D2
					; 0xE05A: PRINT	MSG 0x00A7, MSGBOX CLEARED, END: "{5B}:	Thank you.{57}Use it in	good health.{5E}"
		ScriptID    $5B,$2	; Not enough money:  Run text script at	offset 0x0277D4
					; 0xE05B: PRINT	MSG 0x00A8, MSGBOX CLEARED, END: "{5B}:	Are you	kidding	me?{57}You don't have enough golds.{5E}"
		ScriptID    $5C,$3	; Sale declined:     Run text script at	offset 0x0277D6
					; 0xE05C: PRINT	MSG 0x00A9, MSGBOX CLEARED, END: "{5B}:	Did you{57}change your mind?{5E}"
; ---------------------------------------------------------------------------

ShopPrice_05:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $68,$0	; Run text script at offset 0x0277EE
					; 0xE068: PRINT	MSG 0x00B5, MSGBOX CLEARED, END: "{5B}:	{5F} costs{5A} golds.{57}Cheap!{5E}"
; ---------------------------------------------------------------------------

Shop_05:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $69,$0	; Sale prompt:	     Run text script at	offset 0x0277F0
					; 0xA069: PRINT	MSG 0x00B6, END: "{5B}:	{5A} golds.{57}Shall I wrap it up for you?{58}"
		ScriptID    $6A,$1	; Sale confirmation: Run text script at	offset 0x0277F2
					; 0xE06A: PRINT	MSG 0x00B7, MSGBOX CLEARED, END: "{5B}:	I really thank you!{5E}"
		ScriptID    $6B,$2	; Not enough money:  Run text script at	offset 0x0277F4
					; 0xE06B: PRINT	MSG 0x00B8, MSGBOX CLEARED, END: "{5B}:	Oh, my!!{57}It would seem monsieur{57}needs more golds.{5E}"
		ScriptID    $6C,$3	; Sale declined:     Run text script at	offset 0x0277F6
					; 0xE06C: PRINT	MSG 0x00B9, MSGBOX CLEARED, END: "{5B}:	You don't like it?{57}Perhaps something else{57} for monsieur?{5E}"
; ---------------------------------------------------------------------------

ShopPrice_06:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptJump  ShopPrice_06_1,$0 ;	Jump to	address	0x025DAA
; ---------------------------------------------------------------------------

Shop_06:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $72,$0	; Sale prompt:	     Run text script at	offset 0x027802
					; 0xA072: PRINT	MSG 0x00BF, END: "{5B}:	For you, just {5A} golds{57}for	one {5F}, okay?{58}"
		ScriptID    $73,$1	; Sale confirmation: Run text script at	offset 0x027804
					; 0xE073: PRINT	MSG 0x00C0, MSGBOX CLEARED, END: "{5B}:	Thank you.{57}Sure comes in handy,{57}doesn't it?{5E}"
		ScriptID    $74,$2	; Not enough money:  Run text script at	offset 0x027806
					; 0xE074: PRINT	MSG 0x00C1, MSGBOX CLEARED, END: "{5B}:	Still too expensive?{57}But that's the lowest{57}I can go!{5E}"
		ScriptID    $75,$3	; Sale declined:     Run text script at	offset 0x027808
					; 0xE075: PRINT	MSG 0x00C2, MSGBOX CLEARED, END: "{5B}:	I'm so sorry....{5E}"
; ---------------------------------------------------------------------------

ShopPrice_06_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $153		; Bit 3	of flag	0x02A
		ScriptID    $70,$1	; Flag set:   Run text script at offset	0x0277FE
					; 0xE070: PRINT	MSG 0x00BD, MSGBOX CLEARED, END: "{5B}:	Our finest {5F}.{57}Good quality.{5E}"
		ScriptID    $71,$2	; Flag clear: Run text script at offset	0x027800
					; 0xE071: PRINT	MSG 0x00BE, MSGBOX CLEARED, END: "{5B}:	It's {5F}.{57}It works well.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopPrice_07:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptJump  ShopPrice_07_1,$0 ;	Jump to	address	0x025DEC
; ---------------------------------------------------------------------------

Shop_07:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptJump  ShopSalePrompt_07,$0 ; Sale	prompt:	      Jump to address 0x025DF8
		ScriptJump  ShopSaleConfirm_07,$1 ; Sale confirmation: Jump to address 0x025E04
		ScriptJump  ShopNoMoney_07,$2 ;	Not enough money:  Jump	to address 0x025E10
		ScriptJump  ShopSaleDeclined_07,$3 ; Sale declined:	Jump to	address	0x025E1C
; ---------------------------------------------------------------------------

ShopEnter_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $8C,$1	; Flag set:   Run text script at offset	0x027836
					; 0xE08C: PRINT	MSG 0x00D9, MSGBOX CLEARED, END: "{5B}:	Hey, welcome!  What's up?{5E}"
		ScriptID    $82,$2	; Flag clear: Run text script at offset	0x027822
					; 0xE082: PRINT	MSG 0x00CF, MSGBOX CLEARED, END: "{5B}:	...cough...cough...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopLeave_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $8D,$1	; Flag set:   Run text script at offset	0x027838
					; 0xE08D: PRINT	MSG 0x00DA, MSGBOX CLEARED, END: "{5B}:	See you	later!{5E}"
		ScriptID    $83,$2	; Flag clear: Run text script at offset	0x027824
					; 0xE083: PRINT	MSG 0x00D0, MSGBOX CLEARED, END: "{5B}:	...bye-bye...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSteal_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $93,$1	; Flag set:   Run text script at offset	0x027844
					; 0xE093: PRINT	MSG 0x00E0, MSGBOX CLEARED, END: "{5B}:	Well...{57}I cannot give it to you{57}for free.{5E}"
		ScriptID    $89,$2	; Flag clear: Run text script at offset	0x027830
					; 0xE089: PRINT	MSG 0x00D6, MSGBOX CLEARED, END: "{5B}:	Stop!...{57}...cough, cough...thief!...{57}...cough, cough, cough...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopPrice_07_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $8E,$1	; Flag set:   Run text script at offset	0x02783A
					; 0xE08E: PRINT	MSG 0x00DB, MSGBOX CLEARED, END: "{5B}:	It's our best {5F}.{57}Pretty useful, I'd say!{5E}"
		ScriptID    $84,$2	; Flag clear: Run text script at offset	0x027826
					; 0xE084: PRINT	MSG 0x00D1, MSGBOX CLEARED, END: "{5B}:	...{5F}...cough...{57}...{5A} golds...cough...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSalePrompt_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $8F,$1	; Flag set:   Run text script at offset	0x02783C
					; 0xA08F: PRINT	MSG 0x00DC, END: "{5B}:	You saved us!{57}Special price,	just {5A} golds!{58}"
		ScriptID    $85,$2	; Flag clear: Run text script at offset	0x027828
					; 0xA085: PRINT	MSG 0x00D2, END: "{5B}:	...you...buy it?...cough...{58}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSaleConfirm_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $90,$1	; Flag set:   Run text script at offset	0x02783E
					; 0xE090: PRINT	MSG 0x00DD, MSGBOX CLEARED, END: "{5B}:	Thanks,	hero!{5E}"
		ScriptID    $86,$2	; Flag clear: Run text script at offset	0x02782A
					; 0xE086: PRINT	MSG 0x00D3, MSGBOX CLEARED, END: "{5B}:	...cough...cough...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopNoMoney_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $91,$1	; Flag set:   Run text script at offset	0x027840
					; 0xE091: PRINT	MSG 0x00DE, MSGBOX CLEARED, END: "{5B}:	Oops!{57}Need a	few more golds.{5E}"
		ScriptID    $87,$2	; Flag clear: Run text script at offset	0x02782C
					; 0xE087: PRINT	MSG 0x00D4, MSGBOX CLEARED, END: "{5B}:	...need...cough, cough...{57}more golds...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSaleDeclined_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $92,$1	; Flag set:   Run text script at offset	0x027842
					; 0xE092: PRINT	MSG 0x00DF, MSGBOX CLEARED, END: "{5B}:	So, you	don't need it.{57}OK, OK.{5E}"
		ScriptID    $88,$2	; Flag clear: Run text script at offset	0x02782E
					; 0xE088: PRINT	MSG 0x00D5, MSGBOX CLEARED, END: "{5B}:	Oh, yeah?...cough...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopMap_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $94,$1	; Flag set:   Run text script at offset	0x027846
					; 0xE094: PRINT	MSG 0x00E1, MSGBOX CLEARED, END: "{5B}:	It's the {5F}!{5E}"
		ScriptID    $8A,$2	; Flag clear: Run text script at offset	0x027832
					; 0xE08A: PRINT	MSG 0x00D7, MSGBOX CLEARED, END: "{5B}:	...cough...{5F}.{57}....want to...see?...cough...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopConfirmMap_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $140		; Bit 0	of flag	0x028
		ScriptID    $95,$1	; Flag set:   Run text script at offset	0x027848
					; 0xA095: PRINT	MSG 0x00E2, END: "{5B}:	Take as	long as	you want!{58}"
		ScriptID    $8B,$2	; Flag clear: Run text script at offset	0x027834
					; 0xA08B: PRINT	MSG 0x00D8, END: "{5B}:	...please...look...cough!{58}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

HandleIdentifyRecordBook:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $28,$0	; Normal priest:   Run text script at offset 0x02776E
					; 0xE028: PRINT	MSG 0x0075, MSGBOX CLEARED, END: "{5B}:	That's a {5F}.{5E}"
		ScriptID    $A2,$1	; Skeleton priest: Run text script at offset 0x027862
					; 0xE0A2: PRINT	MSG 0x00EF, MSGBOX CLEARED, END: "{5B}:	It'sssss.......{57}{5F}...........{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

RequestGameSaveMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $29,$0	; Normal priest:   Run text script at offset 0x027770
					; 0xA029: PRINT	MSG 0x0076, END: "{5B}:	You can	record for free.{57}Keep a record now?{58}"
		ScriptID    $A3,$1	; Skeleton priest: Run text script at offset 0x027864
					; 0xA0A3: PRINT	MSG 0x00F0, END: "{5B}:	May I keep your......{57}recoooooooord........?{58}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

InitiateGameSaveMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2A,$0	; Normal priest:   Run text script at offset 0x027772
					; 0xA02A: PRINT	MSG 0x0077, END: "{5B}:	All right, then	let me{57}make a record	of your{57}adventure in	this book.{62}"
		ScriptID    $A4,$1	; Skeleton priest: Run text script at offset 0x027866
					; 0xA0A4: PRINT	MSG 0x00F1, END: "{5B}:	I got it.............{62}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

GameSaveCompleteMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2B,$0	; Normal priest:   Run text script at offset 0x027774
					; 0xA02B: PRINT	MSG 0x0078, END: "{5B}:	Finished!{57}Your brave	deeds shall{57}remain in our hearts forever.{62}"
		ScriptID    $A5,$1	; Skeleton priest: Run text script at offset 0x027868
					; 0xA0A5: PRINT	MSG 0x00F2, END: "{5B}:	It'ssss...oooover.......{62}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

GameSaveRefusedMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2C,$0	; Normal priest:   Run text script at offset 0x027776
					; 0xA02C: PRINT	MSG 0x0079, END: "{5B}:	Really?	 Do you{57}know	the saying{57}"Look before you leap"?{62}"
		ScriptID    $A6,$1	; Skeleton priest: Run text script at offset 0x02786A
					; 0xA0A6: PRINT	MSG 0x00F3, END: "{5B}:	Uh, oh......{62}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

RequestGameContinueMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2D,$0	; Normal priest:   Run text script at offset 0x027778
					; 0xA02D: PRINT	MSG 0x007A, END: "{5B}:	Are you	going to{57}continue your adventure?{58}"
		ScriptID    $A7,$1	; Skeleton priest: Run text script at offset 0x02786C
					; 0xA0A7: PRINT	MSG 0x00F4, END: "{5B}:	Still go....on......?{58}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ConfirmGameContinueMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2E,$0	; Normal priest:   Run text script at offset 0x02777A
					; 0xE02E: PRINT	MSG 0x007B, MSGBOX CLEARED, END: "{5B}:	Good Luck!{57}The goddess is{57}watching you.{5E}"
		ScriptID    $A8,$1	; Skeleton priest: Run text script at offset 0x02786E
					; 0xE0A8: PRINT	MSG 0x00F5, MSGBOX CLEARED, END: "{5B}:	Goooood	luck....{57}May	goddesssss.......{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ConfirmGameStopMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2F,$0	; Normal priest:   Run text script at offset 0x02777C
					; 0xE02F: PRINT	MSG 0x007C, MSGBOX CLEARED, END: "{5B}:	Now, take a rest.{57}May the goddess bless you{57}in your next adventure!{5E}"
		ScriptID    $A9,$1	; Skeleton priest: Run text script at offset 0x027870
					; 0xE0A9: PRINT	MSG 0x00F6, MSGBOX CLEARED, END: "{5B}:	Now....take a ressssst....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

HandleRecordBookTheft:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $14,$0	; Normal priest:   Run text script at offset 0x027746
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END: "{5B}:	Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		ScriptID    $A1,$1	; Skeleton priest: Run text script at offset 0x027860
					; 0xE0A1: PRINT	MSG 0x00EE, MSGBOX CLEARED, END: "{5B}:	Noooo....{57}Don't take it awaaaaaaay......{5E}"
; ---------------------------------------------------------------------------
		rts
