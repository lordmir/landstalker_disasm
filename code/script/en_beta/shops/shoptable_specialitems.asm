		dc.b $25		; DATA XREF: sub_24A70+8o
		dc.b $14
		dc.w $260
		ScriptID    $46,$2	; Run text script at offset 0x0277AA
					; 0xE046: PRINT	MSG 0x0093, MSGBOX CLEARED, END: "{5B}:	{5A} golds to stay.{57}Put it on the counter.{5E}"
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x024F6C
		ScriptID    $45,$4	; Run text script at offset 0x0277A8
					; 0xE045: PRINT	MSG 0x0092, MSGBOX CLEARED, END: "{5B}:	What are you doing!{5E}"
		ScriptID    $47,$5	; Run text script at offset 0x0277AC
					; 0xA047: PRINT	MSG 0x0094, END: "{5B}:	{5A} golds.{57}Will you	be spending the	night?{58}"
		ScriptID    $48,$6	; Run text script at offset 0x0277AE
					; 0xE048: PRINT	MSG 0x0095, MSGBOX CLEARED, END: "{5B}:	Your room is ready, sir.{5E}"
		ScriptID    $49,$7	; Run text script at offset 0x0277B0
					; 0xE049: PRINT	MSG 0x0096, MSGBOX CLEARED, END: "{5B}:	Oh, you	look{57}so much	better!{57}Have	a nice day.{5E}"
		ScriptID    $4A,$8	; Run text script at offset 0x0277B2
					; 0xE04A: PRINT	MSG 0x0097, MSGBOX CLEARED, END: "{5B}:	That's my{57}rock-bottom price.{5E}"
		ScriptID    $4B,$9	; Run text script at offset 0x0277B4
					; 0xE04B: PRINT	MSG 0x0098, MSGBOX CLEARED, END: "{5B}:	What....?{5E}"
		dc.b $26
		dc.b $C
		dc.w $260
		ScriptID    $4C,$2	; Run text script at offset 0x0277B6
					; 0xE04C: PRINT	MSG 0x0099, MSGBOX CLEARED, END: "{5B}:	Bring it to the	counter{57}if you want to take a look.{5E}"
		ScriptJump  HandleMap,$3 ; Jump	to address 0x024FDA
		ScriptID    $45,$4	; Run text script at offset 0x0277A8
					; 0xE045: PRINT	MSG 0x0092, MSGBOX CLEARED, END: "{5B}:	What are you doing!{5E}"
		ScriptID    $4D,$5	; Run text script at offset 0x0277B8
					; 0xA04D: PRINT	MSG 0x009A, END: "{5B}:	I'll show you the{57}{5F}, OK?{58}"
		dc.b $25
		dc.b $14
		dc.w $26F
		ScriptID    $5E,$2	; Run text script at offset 0x0277DA
					; 0xE05E: PRINT	MSG 0x00AB, MSGBOX CLEARED, END: "{5B}:	It's our {5F}.{57}{5A} golds for one night.{57}Please put it on the counter.{5E}"
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x024F6C
		ScriptID    $5D,$4	; Run text script at offset 0x0277D8
					; 0xE05D: PRINT	MSG 0x00AA, MSGBOX CLEARED, END: "{5B}:	Hey!{57}You have to pay	for that!!{5E}"
		ScriptID    $5F,$5	; Run text script at offset 0x0277DC
					; 0xA05F: PRINT	MSG 0x00AC, END: "{5B}:	One night's lodging?{57}{5A} golds, please.{58}"
		ScriptID    $60,$6	; Run text script at offset 0x0277DE
					; 0xE060: PRINT	MSG 0x00AD, MSGBOX CLEARED, END: "{5B}:	Thank you, sir.{57}Your	bed is ready.{5E}"
		ScriptID    $61,$7	; Run text script at offset 0x0277E0
					; 0xE061: PRINT	MSG 0x00AE, MSGBOX CLEARED, END: "{5B}:	Did you	sleep well?{57}Good-bye.{5E}"
		ScriptID    $62,$8	; Run text script at offset 0x0277E2
					; 0xE062: PRINT	MSG 0x00AF, MSGBOX CLEARED, END: "{5B}:	I'm afraid you don't{57}have enough golds.  So sorry.{5E}"
		ScriptID    $63,$9	; Run text script at offset 0x0277E4
					; 0xE063: PRINT	MSG 0x00B0, MSGBOX CLEARED, END: "{5B}:	We welcome you anytime.{5E}"
		dc.b $26
		dc.b $C
		dc.w $26F
		ScriptID    $64,$2	; Run text script at offset 0x0277E6
					; 0xE064: PRINT	MSG 0x00B1, MSGBOX CLEARED, END: "{5B}:	It's the {5F}.{57}Bring it to the counter.{5E}"
		ScriptJump  HandleMap,$3 ; Jump	to address 0x024FDA
		ScriptID    $5D,$4	; Run text script at offset 0x0277D8
					; 0xE05D: PRINT	MSG 0x00AA, MSGBOX CLEARED, END: "{5B}:	Hey!{57}You have to pay	for that!!{5E}"
		ScriptID    $65,$5	; Run text script at offset 0x0277E8
					; 0xA065: PRINT	MSG 0x00B2, END: "{5B}:	You want to see{57}the {5F}?{58}"
		dc.b $25
		dc.b $14
		dc.w $2BD
		ScriptID    $7A,$2	; Run text script at offset 0x027812
					; 0xE07A: PRINT	MSG 0x00C7, MSGBOX CLEARED, END: "{5B}:	Please come to the{57}counter.	It'll be{57}{5A} golds to spend the night.{5E}"
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x024F6C
		ScriptID    $79,$4	; Run text script at offset 0x027810
					; 0xE079: PRINT	MSG 0x00C6, MSGBOX CLEARED, END: "{5B}:	No, no!{57}It's not a gift.{5E}"
		ScriptID    $7B,$5	; Run text script at offset 0x027814
					; 0xA07B: PRINT	MSG 0x00C8, END: "{5B}:	{5A} golds to stay.{57}OK?{58}"
		ScriptID    $7C,$6	; Run text script at offset 0x027816
					; 0xE07C: PRINT	MSG 0x00C9, MSGBOX CLEARED, END: "{5B}:	Thank you, sir.{57}You just rest a spell, now.{5E}"
		ScriptID    $7D,$7	; Run text script at offset 0x027818
					; 0xE07D: PRINT	MSG 0x00CA, MSGBOX CLEARED, END: "{5B}:	Oh, you	look{57}a lot better.  See you!{5E}"
		ScriptID    $7E,$8	; Run text script at offset 0x02781A
					; 0xE07E: PRINT	MSG 0x00CB, MSGBOX CLEARED, END: "{5B}:	Oops!...{57}please come	again when you{57}have more golds.{5E}"
		ScriptID    $7F,$9	; Run text script at offset 0x02781C
					; 0xE07F: PRINT	MSG 0x00CC, MSGBOX CLEARED, END: "{5B}:	Don't you need a rest?{57}Please come again{57}real soon...{5E}"
		dc.b $26
		dc.b $C
		dc.w $2BD
		ScriptID    $80,$2	; Run text script at offset 0x02781E
					; 0xE080: PRINT	MSG 0x00CD, MSGBOX CLEARED, END: "{5B}:	Do you want to see{57}the {5F}?{5E}"
		ScriptJump  HandleMap,$3 ; Jump	to address 0x024FDA
		ScriptID    $79,$4	; Run text script at offset 0x027810
					; 0xE079: PRINT	MSG 0x00C6, MSGBOX CLEARED, END: "{5B}:	No, no!{57}It's not a gift.{5E}"
		ScriptID    $81,$5	; Run text script at offset 0x027820
					; 0xA081: PRINT	MSG 0x00CE, END: "{5B}:	Let me show you.{58}"
		dc.b $26
		dc.b $C
		dc.w $2CF
		ScriptJump  ShopMap_07,$2 ; Jump to address 0x025E28
		ScriptJump  HandleMap,$3 ; Jump	to address 0x024FDA
		ScriptJump  ShopSteal_07,$4 ; Jump to address 0x025DE0
		ScriptJump  ShopConfirmMap_07,$5 ; Jump	to address 0x025E34
		dc.b $24
		dc.b $A
		dc.w $2E0
		ScriptID    $38,$2	; Run text script at offset 0x02778E
					; 0xE038: PRINT	MSG 0x0085, MSGBOX CLEARED, END: "{5B}:	Careful, my child!{57}That book's dangerous,{57}full of unpredictable spells!{5E}"
		ScriptJump  HandleSpellbook,$3 ; Jump to address 0x025028
		ScriptID    $3D,$4	; Run text script at offset 0x027798
					; 0xE03D: PRINT	MSG 0x008A, MSGBOX CLEARED, END: "{5B}:	No, no!	 Don't take it{57}outside!  The world is not{57}ready for its magical powers!{5E}"
		dc.b $25
		dc.b $14
		dc.w $2D9
		ScriptID    $5E,$2	; Run text script at offset 0x0277DA
					; 0xE05E: PRINT	MSG 0x00AB, MSGBOX CLEARED, END: "{5B}:	It's our {5F}.{57}{5A} golds for one night.{57}Please put it on the counter.{5E}"
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x024F6C
		ScriptID    $5D,$4	; Run text script at offset 0x0277D8
					; 0xE05D: PRINT	MSG 0x00AA, MSGBOX CLEARED, END: "{5B}:	Hey!{57}You have to pay	for that!!{5E}"
		ScriptID    $5F,$5	; Run text script at offset 0x0277DC
					; 0xA05F: PRINT	MSG 0x00AC, END: "{5B}:	One night's lodging?{57}{5A} golds, please.{58}"
		ScriptID    $60,$6	; Run text script at offset 0x0277DE
					; 0xE060: PRINT	MSG 0x00AD, MSGBOX CLEARED, END: "{5B}:	Thank you, sir.{57}Your	bed is ready.{5E}"
		ScriptID    $61,$7	; Run text script at offset 0x0277E0
					; 0xE061: PRINT	MSG 0x00AE, MSGBOX CLEARED, END: "{5B}:	Did you	sleep well?{57}Good-bye.{5E}"
		ScriptID    $62,$8	; Run text script at offset 0x0277E2
					; 0xE062: PRINT	MSG 0x00AF, MSGBOX CLEARED, END: "{5B}:	I'm afraid you don't{57}have enough golds.  So sorry.{5E}"
		ScriptID    $63,$9	; Run text script at offset 0x0277E4
					; 0xE063: PRINT	MSG 0x00B0, MSGBOX CLEARED, END: "{5B}:	We welcome you anytime.{5E}"
		dc.b $26
		dc.b $C
		dc.w $2D9
		ScriptID    $64,$2	; Run text script at offset 0x0277E6
					; 0xE064: PRINT	MSG 0x00B1, MSGBOX CLEARED, END: "{5B}:	It's the {5F}.{57}Bring it to the counter.{5E}"
		ScriptJump  HandleMap,$3 ; Jump	to address 0x024FDA
		ScriptID    $5D,$4	; Run text script at offset 0x0277D8
					; 0xE05D: PRINT	MSG 0x00AA, MSGBOX CLEARED, END: "{5B}:	Hey!{57}You have to pay	for that!!{5E}"
		ScriptID    $65,$5	; Run text script at offset 0x0277E8
					; 0xA065: PRINT	MSG 0x00B2, END: "{5B}:	You want to see{57}the {5F}?{58}"
		dc.b $25
		dc.b $14
		dc.w $2E9
		ScriptID    $30,$2	; Run text script at offset 0x02777E
					; 0xE030: PRINT	MSG 0x007D, MSGBOX CLEARED, END: "{5B}:	{5A} golds for a night.{57}Please put it on the	counter{57}if you want to stay.{5E}"
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x024F6C
		ScriptID    $9F,$4	; Run text script at offset 0x02785C
					; 0xE09F: PRINT	MSG 0x00EC, MSGBOX CLEARED, END: "{5B}:	Say!{57}That's ours!{57}Stop right there!{5E}"
		ScriptID    $31,$5	; Run text script at offset 0x027780
					; 0xA031: PRINT	MSG 0x007E, END: "{5B}:	{5A} golds.{57}Will you	stay?{58}"
		ScriptID    $A0,$6	; Run text script at offset 0x02785E
					; 0xE0A0: PRINT	MSG 0x00ED, MSGBOX CLEARED, END: "{5B}:	Thank you, kind	sir.{57}Please go in.{5E}"
		ScriptID    $33,$7	; Run text script at offset 0x027784
					; 0xE033: PRINT	MSG 0x0080, MSGBOX CLEARED, END: "{5B}:	Come back anytime{57}you need a	rest.{5E}"
		ScriptID    $34,$8	; Run text script at offset 0x027786
					; 0xE034: PRINT	MSG 0x0081, MSGBOX CLEARED, END: "{5B}:	You don't have{57}enough golds, do you?{5E}"
		ScriptID    $35,$9	; Run text script at offset 0x027788
					; 0xE035: PRINT	MSG 0x0082, MSGBOX CLEARED, END: "{5B}:	What a pity....{5E}"
		dc.b 0
		dc.b 6
		dc.w $307
		ScriptJump  GainItem,$2	; Jump to address 0x0349F8
		dc.b $12
		dc.b 6
		dc.w $307
		ScriptJump  GainItem,$2	; Jump to address 0x0349F8
		dc.b $21
		dc.b $18
		dc.w $FFFF
		ScriptID    $15,$2	; Run text script at offset 0x027748
					; 0xE015: PRINT	MSG 0x0062, MSGBOX CLEARED, END: "{5B}:	That's our {5F}.{5E}"
		ScriptJump  HandleStatusCure,$3	; Jump to address 0x024E88
		ScriptID    $14,$4	; Run text script at offset 0x027746
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END: "{5B}:	Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		ScriptID    $16,$5	; Run text script at offset 0x02774A
					; 0x8016: PRINT	MSG 0x0063: "{5B}: Need	detoxication?{62}"
					; 0xA017: PRINT	MSG 0x0064, END: "{5B}:	Make a contribution{57}of {5A} golds.{58}"
		ScriptID    $18,$6	; Run text script at offset 0x02774E
					; 0xE018: PRINT	MSG 0x0065, MSGBOX CLEARED, END: "{5B}:	Good.  Now...{57}go with the mercy{57}of the goddess.{5E}"
		ScriptID    $19,$7	; Run text script at offset 0x027750
					; 0xE019: PRINT	MSG 0x0066, MSGBOX CLEARED, END: "{5B}:	OK.  The poison{57}has left your body.{5E}"
		ScriptID    $1A,$8	; Run text script at offset 0x027752
					; 0x801A: PRINT	MSG 0x0067: "{5B}: Can't make a{57}contribution?  Sorry, but{57}I can do nothing.{62}"
					; 0xE01B: PRINT	MSG 0x0068, MSGBOX CLEARED, END: "{5B}:	You had	better come again...{5E}"
		ScriptID    $1C,$9	; Run text script at offset 0x027756
					; 0xE01C: PRINT	MSG 0x0069, MSGBOX CLEARED, END: "{5B}:	Are you	OK?{57}Well...don't act rashly.{5E}"
		ScriptID    $1D,$A	; Run text script at offset 0x027758
					; 0xE01D: PRINT	MSG 0x006A, MSGBOX CLEARED, END: "{5B}:	Well,{57}you are not poisoned.{57}No detoxication needed.{5E}"
		dc.w $100
		dc.b $22
		dc.b $18
		dc.w $FFFF
		ScriptID    $1E,$2	; Run text script at offset 0x02775A
					; 0xE01E: PRINT	MSG 0x006B, MSGBOX CLEARED, END: "{5B}:	That's an {5F}.{57}It describes various curses.{5E}"
		ScriptJump  HandleStatusCure,$3	; Jump to address 0x024E88
		ScriptID    $14,$4	; Run text script at offset 0x027746
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END: "{5B}:	Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		ScriptID    $1F,$5	; Run text script at offset 0x02775C
					; 0x801F: PRINT	MSG 0x006C: "{5B}: Can you afford a{57}contribution of {5A} golds{62}"
					; 0xA020: PRINT	MSG 0x006D, END: "{5B}:	to cure	the curse?{58}"
		ScriptID    $18,$6	; Run text script at offset 0x02774E
					; 0xE018: PRINT	MSG 0x0065, MSGBOX CLEARED, END: "{5B}:	Good.  Now...{57}go with the mercy{57}of the goddess.{5E}"
		ScriptID    $21,$7	; Run text script at offset 0x027760
					; 0xE021: PRINT	MSG 0x006E, MSGBOX CLEARED, END: "{5B}:	All done!{57}The curse has been	lifted.{5E}"
		ScriptID    $1A,$8	; Run text script at offset 0x027752
					; 0x801A: PRINT	MSG 0x0067: "{5B}: Can't make a{57}contribution?  Sorry, but{57}I can do nothing.{62}"
					; 0xE01B: PRINT	MSG 0x0068, MSGBOX CLEARED, END: "{5B}:	You had	better come again...{5E}"
		ScriptID    $1C,$9	; Run text script at offset 0x027756
					; 0xE01C: PRINT	MSG 0x0069, MSGBOX CLEARED, END: "{5B}:	Are you	OK?{57}Well...don't act rashly.{5E}"
		ScriptID    $22,$A	; Run text script at offset 0x027762
					; 0xE022: PRINT	MSG 0x006F, MSGBOX CLEARED, END: "{5B}:	I really want to{57}help you...{57}but you're not cursed.{5E}"
		dc.w $800
		dc.b $11
		dc.b $18
		dc.w $FFFF
		ScriptID    $23,$2	; Run text script at offset 0x027764
					; 0xE023: PRINT	MSG 0x0070, MSGBOX CLEARED, END: "{5B}:	That's an {5F}.{57}It's essential in curing{57}hallucinations.{5E}"
		ScriptJump  HandleStatusCure,$3	; Jump to address 0x024E88
		ScriptID    $14,$4	; Run text script at offset 0x027746
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END: "{5B}:	Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		ScriptID    $24,$5	; Run text script at offset 0x027766
					; 0x8024: PRINT	MSG 0x0071: "{5B}: Can you afford{57}a contribution of {5A} golds{62}"
					; 0xA025: PRINT	MSG 0x0072, END: "{5B}:	for the	cure?{58}"
		ScriptID    $18,$6	; Run text script at offset 0x02774E
					; 0xE018: PRINT	MSG 0x0065, MSGBOX CLEARED, END: "{5B}:	Good.  Now...{57}go with the mercy{57}of the goddess.{5E}"
		ScriptID    $26,$7	; Run text script at offset 0x02776A
					; 0xE026: PRINT	MSG 0x0073, MSGBOX CLEARED, END: "{5B}:	That's better!{57}Your hallucinations are gone.{5E}"
		ScriptID    $1A,$8	; Run text script at offset 0x027752
					; 0x801A: PRINT	MSG 0x0067: "{5B}: Can't make a{57}contribution?  Sorry, but{57}I can do nothing.{62}"
					; 0xE01B: PRINT	MSG 0x0068, MSGBOX CLEARED, END: "{5B}:	You had	better come again...{5E}"
		ScriptID    $1C,$9	; Run text script at offset 0x027756
					; 0xE01C: PRINT	MSG 0x0069, MSGBOX CLEARED, END: "{5B}:	Are you	OK?{57}Well...don't act rashly.{5E}"
		ScriptID    $27,$A	; Run text script at offset 0x02776C
					; 0xE027: PRINT	MSG 0x0074, MSGBOX CLEARED, END: "{5B}:	W-what?...but{57}you're not hallucinating now!{5E}"
		dc.w $200
		dc.b $23
		dc.b $18
		dc.w $FFFF
		ScriptJump  HandleIdentifyRecordBook,$2	; Jump to address 0x025E40
		ScriptJump  HandleRecordBookUse,$3 ; Jump to address 0x024F08
		ScriptJump  HandleRecordBookTheft,$4 ; Jump to address 0x025E80
		ScriptJump  RequestGameSaveMsg,$5 ; Jump to address 0x025E48
		ScriptJump  InitiateGameSaveMsg,$6 ; Jump to address 0x025E50
		ScriptJump  GameSaveCompleteMsg,$7 ; Jump to address 0x025E58
		ScriptJump  GameSaveRefusedMsg,$8 ; Jump to address 0x025E60
		ScriptJump  RequestGameContinueMsg,$9 ;	Jump to	address	0x025E68
		ScriptJump  ConfirmGameContinueMsg,$A ;	Jump to	address	0x025E70
		ScriptJump  ConfirmGameStopMsg,$B ; Jump to address 0x025E78
		dc.b $25
		dc.b $14
		dc.w $FFFF
		ScriptID    $30,$2	; Run text script at offset 0x02777E
					; 0xE030: PRINT	MSG 0x007D, MSGBOX CLEARED, END: "{5B}:	{5A} golds for a night.{57}Please put it on the	counter{57}if you want to stay.{5E}"
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x024F6C
		ScriptID    $11,$4	; Run text script at offset 0x027740
					; 0xE011: PRINT	MSG 0x005E, MSGBOX CLEARED, END: "{5B}:	No, no.{57}You cannot take our{57}equipment with you!{5E}"
		ScriptID    $31,$5	; Run text script at offset 0x027780
					; 0xA031: PRINT	MSG 0x007E, END: "{5B}:	{5A} golds.{57}Will you	stay?{58}"
		ScriptID    $32,$6	; Run text script at offset 0x027782
					; 0xE032: PRINT	MSG 0x007F, MSGBOX CLEARED, END: "{5B}:	Thank you.{57}Your room	is upstairs.{5E}"
		ScriptID    $33,$7	; Run text script at offset 0x027784
					; 0xE033: PRINT	MSG 0x0080, MSGBOX CLEARED, END: "{5B}:	Come back anytime{57}you need a	rest.{5E}"
		ScriptID    $34,$8	; Run text script at offset 0x027786
					; 0xE034: PRINT	MSG 0x0081, MSGBOX CLEARED, END: "{5B}:	You don't have{57}enough golds, do you?{5E}"
		ScriptID    $35,$9	; Run text script at offset 0x027788
					; 0xE035: PRINT	MSG 0x0082, MSGBOX CLEARED, END: "{5B}:	What a pity....{5E}"
		dc.b $26
		dc.b $C
		dc.w $FFFF
		ScriptID    $36,$2	; Run text script at offset 0x02778A
					; 0xE036: PRINT	MSG 0x0083, MSGBOX CLEARED, END: "{5B}:	It's the {5F}.{57}Put it on the counter{57}if you want to take a look.{5E}"
		ScriptJump  HandleMap,$3 ; Jump	to address 0x024FDA
		ScriptID    $11,$4	; Run text script at offset 0x027740
					; 0xE011: PRINT	MSG 0x005E, MSGBOX CLEARED, END: "{5B}:	No, no.{57}You cannot take our{57}equipment with you!{5E}"
		ScriptID    $37,$5	; Run text script at offset 0x02778C
					; 0xA037: PRINT	MSG 0x0084, END: "{5B}:	You want to see	the{57}{5F}, right?{58}"
		dc.w $FFFF
