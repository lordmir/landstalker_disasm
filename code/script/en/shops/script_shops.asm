; ---------------------------------------------------------------------------

ShopPrice_01:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $3,$0		  ; Run	text script at offset 0x0277FC
						  ; 0xE003: PRINT MSG 0x0050, MSGBOX CLEARED, END: "{5B}Oh, yeah, {5F}.{57}It'll cost you {5A} golds.{57}You like it?{5E}"
; ---------------------------------------------------------------------------

Shop_01:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $4,$0		  ; Sale prompt:       Run text	script at offset 0x0277FE
						  ; 0xA004: PRINT MSG 0x0051, END: "{5B}{5A} golds...{57}you wanna buy?{58}"
		ScriptID    $5,$1		  ; Sale confirmation: Run text	script at offset 0x027800
						  ; 0xE005: PRINT MSG 0x0052, MSGBOX CLEARED, END: "{5B}Thank you!{57}Don't waste it.{5E}"
		ScriptID    $6,$2		  ; Not	enough money:  Run text	script at offset 0x027802
						  ; 0xE006: PRINT MSG 0x0053, MSGBOX CLEARED, END: "{5B}You can't afford that now.{57}Make more golds somewhere!{5E}"
		ScriptID    $7,$3		  ; Sale declined:     Run text	script at offset 0x027804
						  ; 0xE007: PRINT MSG 0x0054, MSGBOX CLEARED, END: "{5B}Are you	just browsing?{5E}"
; ---------------------------------------------------------------------------

ShopPrice_02:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $3C,$0		  ; Run	text script at offset 0x02786E
						  ; 0xE03C: PRINT MSG 0x0089, MSGBOX CLEARED, END: "{5B}You want {5F}?{5E}"
; ---------------------------------------------------------------------------

Shop_02:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $3D,$0		  ; Sale prompt:       Run text	script at offset 0x027870
						  ; 0xA03D: PRINT MSG 0x008A, END: "{5B}That'll cost you{57}{5A} golds.  Still want it?{58}"
		ScriptID    $3E,$1		  ; Sale confirmation: Run text	script at offset 0x027872
						  ; 0xE03E: PRINT MSG 0x008B, MSGBOX CLEARED, END: "{5B}Thanks a lot!{5E}"
		ScriptID    $3F,$2		  ; Not	enough money:  Run text	script at offset 0x027874
						  ; 0xE03F: PRINT MSG 0x008C, MSGBOX CLEARED, END: "{5B}Ah...{57}too expensive for you!{5E}"
		ScriptID    $40,$3		  ; Sale declined:     Run text	script at offset 0x027876
						  ; 0xE040: PRINT MSG 0x008D, MSGBOX CLEARED, END: "{5B}Ah...{57}so you	don't really want it.{5E}"
; ---------------------------------------------------------------------------

ShopPrice_03:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $4C,$0		  ; Run	text script at offset 0x02788E
						  ; 0xE04C: PRINT MSG 0x0099, MSGBOX CLEARED, END: "{5B}{5F} costs{57}{5A} golds.{5E}"
; ---------------------------------------------------------------------------

Shop_03:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $4D,$0		  ; Sale prompt:       Run text	script at offset 0x027890
						  ; 0xA04D: PRINT MSG 0x009A, END: "{5B}That'll be {5A} golds, OK?{57}{58}"
		ScriptID    $4E,$1		  ; Sale confirmation: Run text	script at offset 0x027892
						  ; 0xE04E: PRINT MSG 0x009B, MSGBOX CLEARED, END: "{5B}Thank you, thank you.{5E}"
		ScriptID    $4F,$2		  ; Not	enough money:  Run text	script at offset 0x027894
						  ; 0xE04F: PRINT MSG 0x009C, MSGBOX CLEARED, END: "{5B}You need more{57}golds than that!{5E}"
		ScriptID    $50,$3		  ; Sale declined:     Run text	script at offset 0x027896
						  ; 0xE050: PRINT MSG 0x009D, MSGBOX CLEARED, END: "{5B}You don't know{57}what you're missing....{5E}"
; ---------------------------------------------------------------------------

ShopPrice_04:					  ; ID 0xC, Script 0x1,	Speaker	SpriteB_Nigel (0x00)
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $54,$0		  ; Run	text script at offset 0x02789E
						  ; 0xE054: PRINT MSG 0x00A1, MSGBOX CLEARED, END: "{5B}Ah...a smart shopper.{57}It's very popular these days.{57}I recommend it!{5E}"
; ---------------------------------------------------------------------------

Shop_04:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $52,$3		  ; Sale declined:     Run text	script at offset 0x02789A
						  ; 0xE052: PRINT MSG 0x009F, MSGBOX CLEARED, END: "{5B}Welcome!{57}You	can take a rest, and{57}even buy supplies here!{5E}"
		ScriptID    $56,$1		  ; Sale confirmation: Run text	script at offset 0x0278A2
						  ; 0xE056: PRINT MSG 0x00A3, MSGBOX CLEARED, END: "{5B}Thank you.{57}Use it in	good health.{5E}"
		ScriptID    $57,$2		  ; Not	enough money:  Run text	script at offset 0x0278A4
						  ; 0xE057: PRINT MSG 0x00A4, MSGBOX CLEARED, END: "{5B}Are you	kidding	me?{57}You don't have enough golds.{5E}"
		ScriptID    $58,$3		  ; Sale declined:     Run text	script at offset 0x0278A6
						  ; 0xE058: PRINT MSG 0x00A5, MSGBOX CLEARED, END: "{5B}Did you{57}change your mind?{5E}"
; ---------------------------------------------------------------------------

ShopPrice_05:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptID    $64,$0		  ; Run	text script at offset 0x0278BE
						  ; 0xE064: PRINT MSG 0x00B1, MSGBOX CLEARED, END: "{5B}{5F} costs{57}{5A} golds.  Cheap!{5E}"
; ---------------------------------------------------------------------------

Shop_05:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $65,$0		  ; Sale prompt:       Run text	script at offset 0x0278C0
						  ; 0xA065: PRINT MSG 0x00B2, END: "{5B}That will be {5A} golds.{57}Shall I wrap it up for you?{58}"
		ScriptID    $66,$1		  ; Sale confirmation: Run text	script at offset 0x0278C2
						  ; 0xE066: PRINT MSG 0x00B3, MSGBOX CLEARED, END: "{5B}I really thank you!{5E}"
		ScriptID    $67,$2		  ; Not	enough money:  Run text	script at offset 0x0278C4
						  ; 0xE067: PRINT MSG 0x00B4, MSGBOX CLEARED, END: "{5B}Oh, my!!{57}It would seem monsieur{57}needs more golds.{5E}"
		ScriptID    $68,$3		  ; Sale declined:     Run text	script at offset 0x0278C6
						  ; 0xE068: PRINT MSG 0x00B5, MSGBOX CLEARED, END: "{5B}You don't like it?{57}Perhaps something else{57}for monsieur?{5E}"
; ---------------------------------------------------------------------------

ShopPrice_06:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptJump  ShopPrice_06_1,$0	  ; Jump to address 0x025E82
; ---------------------------------------------------------------------------

Shop_06:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptID    $6F,$0		  ; Sale prompt:       Run text	script at offset 0x0278D4
						  ; 0xA06F: PRINT MSG 0x00BC, END: "{5B}For you, just {5A} golds for{57}one {5F}.  Okay?{58}"
		ScriptID    $70,$1		  ; Sale confirmation: Run text	script at offset 0x0278D6
						  ; 0xE070: PRINT MSG 0x00BD, MSGBOX CLEARED, END: "{5B}Thank you, Nigel.{57}It'll come in handy,{57}I assure you!{5E}"
		ScriptID    $71,$2		  ; Not	enough money:  Run text	script at offset 0x0278D8
						  ; 0xE071: PRINT MSG 0x00BE, MSGBOX CLEARED, END: "{5B}Still too expensive?{57}But that's the{57}lowest I can go!{5E}"
		ScriptID    $72,$3		  ; Sale declined:     Run text	script at offset 0x0278DA
						  ; 0xE072: PRINT MSG 0x00BF, MSGBOX CLEARED, END: "{5B}I'm so sorry....{5E}"
; ---------------------------------------------------------------------------

ShopPrice_06_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0153			  ; Bit	3 of flag 0x02A
		ScriptID    $6D,$1		  ; Flag set:	Run text script	at offset 0x0278D0
						  ; 0xE06D: PRINT MSG 0x00BA, MSGBOX CLEARED, END: "{5B}Our finest {5F}.{57}Good quality.{5E}"
		ScriptID    $6E,$2		  ; Flag clear:	Run text script	at offset 0x0278D2
						  ; 0xE06E: PRINT MSG 0x00BB, MSGBOX CLEARED, END: "{5B}Our finest {5F}.{57}It works well.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopPrice_07:
		bsr.w	DisplayItemPriceMessage
; ---------------------------------------------------------------------------
		ScriptJump  ShopPrice_07_1,$0	  ; Jump to address 0x025EC4
; ---------------------------------------------------------------------------

Shop_07:
		bsr.w	HandleShopInterraction
; ---------------------------------------------------------------------------
		ScriptJump  ShopSalePrompt_07,$0  ; Sale prompt:       Jump to address 0x025ED0
		ScriptJump  ShopSaleConfirm_07,$1 ; Sale confirmation: Jump to address 0x025EDC
		ScriptJump  ShopNoMoney_07,$2	  ; Not	enough money:  Jump to address 0x025EE8
		ScriptJump  ShopSaleDeclined_07,$3 ; Sale declined:	Jump to	address	0x025EF4
; ---------------------------------------------------------------------------

ShopEnter_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0140			  ; Bit	0 of flag 0x028
		ScriptID    $8C,$1		  ; Flag set:	Run text script	at offset 0x02790E
						  ; 0xE08C: PRINT MSG 0x00D9, MSGBOX CLEARED, END: "{5B}Hey, welcome!  What's up?{5E}"
		ScriptID    $7F,$2		  ; Flag clear:	Run text script	at offset 0x0278F4
						  ; 0x807F: PRINT MSG 0x00CC: "{5B}...ahh{59}.{59}.{59}.{62}"
						  ; 0x8080: PRINT MSG 0x00CD: "{5B}...AHH{59}.{59}.{59}.{62}"
						  ; 0xE081: PRINT MSG 0x00CE, MSGBOX CLEARED, END: "{5B}ACHOOO!!!...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopLeave_07:					  ; ID 0xC, Script 0x1,	Speaker	SpriteB_Nigel (0x00)
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0140			  ; Bit	0 of flag 0x028
		ScriptID    $8D,$1		  ; Flag set:	Run text script	at offset 0x027910
						  ; 0xE08D: PRINT MSG 0x00DA, MSGBOX CLEARED, END: "{5B}See you	later!{5E}"
		ScriptID    $82,$2		  ; Flag clear:	Run text script	at offset 0x0278FA
						  ; 0xE082: PRINT MSG 0x00CF, MSGBOX CLEARED, END: "{5B}...'bye-bye...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSteal_07:					  ; ID 0xC, Script 0x1,	Speaker	SpriteB_Nigel (0x00)
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0140			  ; Bit	0 of flag 0x028
		ScriptID    $93,$1		  ; Flag set:	Run text script	at offset 0x02791C
						  ; 0xE093: PRINT MSG 0x00E0, MSGBOX CLEARED, END: "{5B}Well, I	cannot just{57}give it to you for free,{57}Nigel.  I mean, really!{5E}"
		ScriptID    $89,$2		  ; Flag clear:	Run text script	at offset 0x027908
						  ; 0xE089: PRINT MSG 0x00D6, MSGBOX CLEARED, END: "{5B}Stop!...{57}...cough, cough...THIEF!...{57}...cough, cough, cough...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopPrice_07_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0140			  ; Bit	0 of flag 0x028
		ScriptID    $8E,$1		  ; Flag set:	Run text script	at offset 0x027912
						  ; 0xE08E: PRINT MSG 0x00DB, MSGBOX CLEARED, END: "{5B}It's our best {5F}.{57}Pretty useful, I'd say!{5E}"
		ScriptID    $83,$2		  ; Flag clear:	Run text script	at offset 0x0278FC
						  ; 0xE083: PRINT MSG 0x00D0, MSGBOX CLEARED, END: "{5B}...{5F}...cough...{57}...{5A} golds...cough, cough!...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSalePrompt_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0140			  ; Bit	0 of flag 0x028
		ScriptID    $8F,$1		  ; Flag set:	Run text script	at offset 0x027914
						  ; 0xA08F: PRINT MSG 0x00DC, END: "{5B}You saved us!{57}Special price,	just {5A} golds!{58}"
		ScriptID    $84,$2		  ; Flag clear:	Run text script	at offset 0x0278FE
						  ; 0xA084: PRINT MSG 0x00D1, END: "{5B}...you...buy it?...cough...{58}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSaleConfirm_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0140			  ; Bit	0 of flag 0x028
		ScriptID    $90,$1		  ; Flag set:	Run text script	at offset 0x027916
						  ; 0xE090: PRINT MSG 0x00DD, MSGBOX CLEARED, END: "{5B}Thanks,	hero!{5E}"
		ScriptID    $85,$2		  ; Flag clear:	Run text script	at offset 0x027900
						  ; 0xE085: PRINT MSG 0x00D2, MSGBOX CLEARED, END: "{5B}...you won't...cough, cough{57}...regret...cough, cough!...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopNoMoney_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0140			  ; Bit	0 of flag 0x028
		ScriptID    $91,$1		  ; Flag set:	Run text script	at offset 0x027918
						  ; 0xE091: PRINT MSG 0x00DE, MSGBOX CLEARED, END: "{5B}Oops!{57}Need a	few more golds.{5E}"
		ScriptID    $86,$2		  ; Flag clear:	Run text script	at offset 0x027902
						  ; 0x8086: PRINT MSG 0x00D3: "{5B}...need...cough, cough...{57}...need	more...cough, cough...{57}...need more golds!...{62}"
						  ; 0xE087: PRINT MSG 0x00D4, MSGBOX CLEARED, END: "{5B}...cough, cough, cough...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopSaleDeclined_07:				  ; ID 0xC, Script 0x1,	Speaker	SpriteB_Nigel (0x00)
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0140			  ; Bit	0 of flag 0x028
		ScriptID    $92,$1		  ; Flag set:	Run text script	at offset 0x02791A
						  ; 0xE092: PRINT MSG 0x00DF, MSGBOX CLEARED, END: "{5B}So, you	don't need it.{57}OK, OK.{5E}"
		ScriptID    $88,$2		  ; Flag clear:	Run text script	at offset 0x027906
						  ; 0xE088: PRINT MSG 0x00D5, MSGBOX CLEARED, END: "{5B}No?...cough...{5E}"
; ---------------------------------------------------------------------------
		rts				  ; ID 0x9, Script 0x6,	Speaker	 (0x75)
; ---------------------------------------------------------------------------

ShopMap_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0140			  ; Bit	0 of flag 0x028
		ScriptID    $94,$1		  ; Flag set:	Run text script	at offset 0x02791E
						  ; 0xE094: PRINT MSG 0x00E1, MSGBOX CLEARED, END: "{5B}It's the {5F}!{5E}"
		ScriptID    $8A,$2		  ; Flag clear:	Run text script	at offset 0x02790A
						  ; 0xE08A: PRINT MSG 0x00D7, MSGBOX CLEARED, END: "{5B}...cough...{5F}.{57}....want to...see?...cough...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ShopConfirmMap_07:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0140			  ; Bit	0 of flag 0x028
		ScriptID    $95,$1		  ; Flag set:	Run text script	at offset 0x027920
						  ; 0xA095: PRINT MSG 0x00E2, END: "{5B}Have a look?{57}{58}"
		ScriptID    $8B,$2		  ; Flag clear:	Run text script	at offset 0x02790C
						  ; 0xA08B: PRINT MSG 0x00D8, END: "{5B}...please...look...cough!{57}{58}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

HandleIdentifyRecordBook:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $23,$0		  ; Normal priest:   Run text script at	offset 0x02783C
						  ; 0xE023: PRINT MSG 0x0070, MSGBOX CLEARED, END: "{5B}That's a {5F}.{5E}"
		ScriptID    $A2,$1		  ; Skeleton priest: Run text script at	offset 0x02793A
						  ; 0xE0A2: PRINT MSG 0x00EF, MSGBOX CLEARED, END: "{5B}It'sssss.......{57}{5F}...........{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

RequestGameSaveMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $24,$0		  ; Normal priest:   Run text script at	offset 0x02783E
						  ; 0xA024: PRINT MSG 0x0071, END: "{5B}You can	record for free.{57}Keep a record now?{58}"
		ScriptID    $A3,$1		  ; Skeleton priest: Run text script at	offset 0x02793C
						  ; 0xA0A3: PRINT MSG 0x00F0, END: "{5B}May I keep your......{57}recoooooooord........?{58}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

InitiateGameSaveMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $25,$0		  ; Normal priest:   Run text script at	offset 0x027840
						  ; 0xA025: PRINT MSG 0x0072, END: "{5B}All right, then	let me{57}make a record	of your{57}adventure in	this book.{62}"
		ScriptID    $A4,$1		  ; Skeleton priest: Run text script at	offset 0x02793E
						  ; 0xA0A4: PRINT MSG 0x00F1, END: "{5B}I got it.............{62}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

GameSaveCompleteMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $26,$0		  ; Normal priest:   Run text script at	offset 0x027842
						  ; 0xA026: PRINT MSG 0x0073, END: "{5B}Finished!{57}Your brave	deeds shall{57}remain in our hearts forever.{62}"
		ScriptID    $A5,$1		  ; Skeleton priest: Run text script at	offset 0x027940
						  ; 0xA0A5: PRINT MSG 0x00F2, END: "{5B}It'ssss...oooover.......{62}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

GameSaveRefusedMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $27,$0		  ; Normal priest:   Run text script at	offset 0x027844
						  ; 0xA027: PRINT MSG 0x0074, END: "{5B}Really?	 Do you{57}know	the saying,{57}"Look before you	leap"?{62}"
		ScriptID    $A6,$1		  ; Skeleton priest: Run text script at	offset 0x027942
						  ; 0xA0A6: PRINT MSG 0x00F3, END: "{5B}Uh, oh......{62}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

RequestGameContinueMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $28,$0		  ; Normal priest:   Run text script at	offset 0x027846
						  ; 0xA028: PRINT MSG 0x0075, END: "{5B}Are you	going to{57}continue your adventure?{58}"
		ScriptID    $A7,$1		  ; Skeleton priest: Run text script at	offset 0x027944
						  ; 0xA0A7: PRINT MSG 0x00F4, END: "{5B}Still go....on......?{58}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ConfirmGameContinueMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $29,$0		  ; Normal priest:   Run text script at	offset 0x027848
						  ; 0xE029: PRINT MSG 0x0076, MSGBOX CLEARED, END: "{5B}Good Luck!{57}The goddess is watching you.{5E}"
		ScriptID    $A8,$1		  ; Skeleton priest: Run text script at	offset 0x027946
						  ; 0xE0A8: PRINT MSG 0x00F5, MSGBOX CLEARED, END: "{5B}Goooood	luck....{57}May	goddesssss.......{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

ConfirmGameStopMsg:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $2A,$0		  ; Normal priest:   Run text script at	offset 0x02784A
						  ; 0xE02A: PRINT MSG 0x0077, MSGBOX CLEARED, END: "{5B}Now, take a rest.{57}May the goddess bless you{57}in your next adventure!{5E}"
		ScriptID    $A9,$1		  ; Skeleton priest: Run text script at	offset 0x027948
						  ; 0xE0A9: PRINT MSG 0x00F6, MSGBOX CLEARED, END: "{5B}Now....take a ressssst....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

HandleRecordBookTheft:
		bsr.s	HandleChurchInterraction
; ---------------------------------------------------------------------------
		ScriptID    $E,$0		  ; Normal priest:   Run text script at	offset 0x027812
						  ; 0xE00E: PRINT MSG 0x005B, MSGBOX CLEARED, END: "{5B}Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		ScriptID    $A1,$1		  ; Skeleton priest: Run text script at	offset 0x027938
						  ; 0xE0A1: PRINT MSG 0x00EE, MSGBOX CLEARED, END: "{5B}Noooo....{57}Don't take it awaaaaaaay......{5E}"
; ---------------------------------------------------------------------------
		rts
