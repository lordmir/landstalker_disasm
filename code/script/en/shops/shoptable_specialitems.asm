		dc.b ITM_HOTELREGISTER	  ; DATA XREF: sub_24B48+8t
		dc.b $14
		dc.w $0260			  ; Gumi Inn - register
		ScriptID    $42,$2		  ; Run	text script at offset 0x02787A
						  ; 0xE042: PRINT MSG 0x008F, MSGBOX CLEARED, END: "{5B}{5A} for a single room.{57}Just	bring it to me,{57}and I'll sign you in.{5E}"
		ScriptJump  HandleInnStay,$3	  ; Jump to address 0x025044
		ScriptID    $41,$4		  ; Run	text script at offset 0x027878
						  ; 0xE041: PRINT MSG 0x008E, MSGBOX CLEARED, END: "{5B}What are you doing!{5E}"
		ScriptID    $43,$5		  ; Run	text script at offset 0x02787C
						  ; 0xA043: PRINT MSG 0x0090, END: "{5B}{5A} golds, friend.{57}Will you	be spending the	night?{58}"
		ScriptID    $44,$6		  ; Run	text script at offset 0x02787E
						  ; 0xE044: PRINT MSG 0x0091, MSGBOX CLEARED, END: "{5B}Your room is ready, sir.{5E}"
		ScriptID    $45,$7		  ; Run	text script at offset 0x027880
						  ; 0xE045: PRINT MSG 0x0092, MSGBOX CLEARED, END: "{5B}There!{57}Now, don't you feel better?{57}Have a nice day!{5E}"
		ScriptID    $46,$8		  ; Run	text script at offset 0x027882
						  ; 0xE046: PRINT MSG 0x0093, MSGBOX CLEARED, END: "{5B}Sorry, but that's my{57}rock-bottom rate.{5E}"
		ScriptID    $47,$9		  ; Run	text script at offset 0x027884
						  ; 0xE047: PRINT MSG 0x0094, MSGBOX CLEARED, END: "{5B}What....?{5E}"
		dc.b ITM_ISLANDMAP
		dc.b $0C
		dc.w $0260			  ; Gumi Inn - map
		ScriptID    $48,$2		  ; Run	text script at offset 0x027886
						  ; 0xE048: PRINT MSG 0x0095, MSGBOX CLEARED, END: "{5B}Bring it to the	counter{57}if you want to take a look.{5E}"
		ScriptJump  HandleMap,$3	  ; Jump to address 0x0250B2
		ScriptID    $41,$4		  ; Run	text script at offset 0x027878
						  ; 0xE041: PRINT MSG 0x008E, MSGBOX CLEARED, END: "{5B}What are you doing!{5E}"
		ScriptID    $49,$5		  ; Run	text script at offset 0x027888
						  ; 0xA049: PRINT MSG 0x0096, END: "{5B}I'll show you the{57}{5F}, OK?{58}"
		dc.b ITM_HOTELREGISTER
		dc.b $14
		dc.w $026F			  ; Ryuma inn -	register
		ScriptID    $5A,$2		  ; Run	text script at offset 0x0278AA
						  ; 0xE05A: PRINT MSG 0x00A7, MSGBOX CLEARED, END: "{5B}It's our {5F}.{57}{5A} golds for one night.{57}Please put it on the counter.{5E}"
		ScriptJump  HandleInnStay,$3	  ; Jump to address 0x025044
		ScriptID    $59,$4		  ; Run	text script at offset 0x0278A8
						  ; 0xE059: PRINT MSG 0x00A6, MSGBOX CLEARED, END: "{5B}Hey!{57}You have to pay	for that!!{5E}"
		ScriptID    $5B,$5		  ; Run	text script at offset 0x0278AC
						  ; 0xA05B: PRINT MSG 0x00A8, END: "{5B}One night's lodging?{57}{5A} golds, please.{58}"
		ScriptID    $5C,$6		  ; Run	text script at offset 0x0278AE
						  ; 0xE05C: PRINT MSG 0x00A9, MSGBOX CLEARED, END: "{5B}Thank you, sir.{57}Your	bed is ready.{5E}"
		ScriptID    $5D,$7		  ; Run	text script at offset 0x0278B0
						  ; 0xE05D: PRINT MSG 0x00AA, MSGBOX CLEARED, END: "{5B}Did you	sleep well?{57}Good-bye.{5E}"
		ScriptID    $5E,$8		  ; Run	text script at offset 0x0278B2
						  ; 0xE05E: PRINT MSG 0x00AB, MSGBOX CLEARED, END: "{5B}I'm afraid you don't{57}have enough golds.  So sorry.{5E}"
		ScriptID    $5F,$9		  ; Run	text script at offset 0x0278B4
						  ; 0xE05F: PRINT MSG 0x00AC, MSGBOX CLEARED, END: "{5B}Well, if you should{57}change your mind....{5E}"
		dc.b ITM_ISLANDMAP
		dc.b $0C
		dc.w $026F			  ; Ryuma inn -	map
		ScriptID    $60,$2		  ; Run	text script at offset 0x0278B6
						  ; 0xE060: PRINT MSG 0x00AD, MSGBOX CLEARED, END: "{5B}It's the {5F}.{57}Bring it to the counter.{5E}"
		ScriptJump  HandleMap,$3	  ; Jump to address 0x0250B2
		ScriptID    $59,$4		  ; Run	text script at offset 0x0278A8
						  ; 0xE059: PRINT MSG 0x00A6, MSGBOX CLEARED, END: "{5B}Hey!{57}You have to pay	for that!!{5E}"
		ScriptID    $61,$5		  ; Run	text script at offset 0x0278B8
						  ; 0xA061: PRINT MSG 0x00AE, END: "{5B}You want to see{57}the {5F}?{58}"
		dc.b ITM_HOTELREGISTER
		dc.b $14
		dc.w $02BD			  ; Mercator inn - Register
		ScriptID    $77,$2		  ; Run	text script at offset 0x0278E4
						  ; 0xE077: PRINT MSG 0x00C4, MSGBOX CLEARED, END: "{5B}Please come to the{57}counter.	It'll be {5A} golds{57}to spend the night.{5E}"
		ScriptJump  HandleInnStay,$3	  ; Jump to address 0x025044
		ScriptID    $76,$4		  ; Run	text script at offset 0x0278E2
						  ; 0xE076: PRINT MSG 0x00C3, MSGBOX CLEARED, END: "{5B}No, no!{57}It's not a gift.{5E}"
		ScriptID    $78,$5		  ; Run	text script at offset 0x0278E6
						  ; 0xA078: PRINT MSG 0x00C5, END: "{5B}{5A} golds to stay.  OK?{57}{58}"
		ScriptID    $79,$6		  ; Run	text script at offset 0x0278E8
						  ; 0xE079: PRINT MSG 0x00C6, MSGBOX CLEARED, END: "{5B}Thank you, sir.{57}You just rest a spell, now.{5E}"
		ScriptID    $7A,$7		  ; Run	text script at offset 0x0278EA
						  ; 0xE07A: PRINT MSG 0x00C7, MSGBOX CLEARED, END: "{5B}Oh, you	look{57}a lot better.  See you!{5E}"
		ScriptID    $7B,$8		  ; Run	text script at offset 0x0278EC
						  ; 0xE07B: PRINT MSG 0x00C8, MSGBOX CLEARED, END: "{5B}Oops!...{57}please come	again when you{57}have more golds.{5E}"
		ScriptID    $7C,$9		  ; Run	text script at offset 0x0278EE
						  ; 0xE07C: PRINT MSG 0x00C9, MSGBOX CLEARED, END: "{5B}Don't you need a rest?{57}Please come again soon...{5E}"
		dc.b ITM_ISLANDMAP
		dc.b $0C
		dc.w $02BD			  ; Mercator inn - map
		ScriptID    $7D,$2		  ; Run	text script at offset 0x0278F0
						  ; 0xE07D: PRINT MSG 0x00CA, MSGBOX CLEARED, END: "{5B}Do you want to see{57}the {5F}?{5E}"
		ScriptJump  HandleMap,$3	  ; Jump to address 0x0250B2
		ScriptID    $76,$4		  ; Run	text script at offset 0x0278E2
						  ; 0xE076: PRINT MSG 0x00C3, MSGBOX CLEARED, END: "{5B}No, no!{57}It's not a gift.{5E}"
		ScriptID    $7E,$5		  ; Run	text script at offset 0x0278F2
						  ; 0xA07E: PRINT MSG 0x00CB, END: "{5B}Here.{57}Let me	show you.{58}"
		dc.b ITM_ISLANDMAP
		dc.b $0C
		dc.w $02CF			  ; Verla shop - map
		ScriptJump  ShopMap_07,$2	  ; Jump to address 0x025F00
		ScriptJump  HandleMap,$3	  ; Jump to address 0x0250B2
		ScriptJump  ShopSteal_07,$4	  ; Jump to address 0x025EB8
		ScriptJump  ShopConfirmMap_07,$5  ; Jump to address 0x025F0C
		dc.b ITM_SPELLBOOK
		dc.b $0A
		dc.w $02E0			  ; Destel church - spellbook
		ScriptID    $33,$2		  ; Run	text script at offset 0x02785C
						  ; 0xE033: PRINT MSG 0x0080, MSGBOX CLEARED, END: "{5B}Careful, my child!{57}That book	is dangerous,{57}full of unpredictable spells!{5E}"
		ScriptJump  HandleSpellbook,$3	  ; Jump to address 0x025100
		ScriptID    $39,$4		  ; Run	text script at offset 0x027868
						  ; 0xE039: PRINT MSG 0x0086, MSGBOX CLEARED, END: "{5B}No, no!	 Don't take it{57}outside!  The world is not{57}ready for its magical powers!{5E}"
		dc.b ITM_HOTELREGISTER
		dc.b $14
		dc.w $02D9			  ; Destel inn - register
		ScriptID    $5A,$2		  ; Run	text script at offset 0x0278AA
						  ; 0xE05A: PRINT MSG 0x00A7, MSGBOX CLEARED, END: "{5B}It's our {5F}.{57}{5A} golds for one night.{57}Please put it on the counter.{5E}"
		ScriptJump  HandleInnStay,$3	  ; Jump to address 0x025044
		ScriptID    $59,$4		  ; Run	text script at offset 0x0278A8
						  ; 0xE059: PRINT MSG 0x00A6, MSGBOX CLEARED, END: "{5B}Hey!{57}You have to pay	for that!!{5E}"
		ScriptID    $5B,$5		  ; Run	text script at offset 0x0278AC
						  ; 0xA05B: PRINT MSG 0x00A8, END: "{5B}One night's lodging?{57}{5A} golds, please.{58}"
		ScriptID    $5C,$6		  ; Run	text script at offset 0x0278AE
						  ; 0xE05C: PRINT MSG 0x00A9, MSGBOX CLEARED, END: "{5B}Thank you, sir.{57}Your	bed is ready.{5E}"
		ScriptID    $5D,$7		  ; Run	text script at offset 0x0278B0
						  ; 0xE05D: PRINT MSG 0x00AA, MSGBOX CLEARED, END: "{5B}Did you	sleep well?{57}Good-bye.{5E}"
		ScriptID    $5E,$8		  ; Run	text script at offset 0x0278B2
						  ; 0xE05E: PRINT MSG 0x00AB, MSGBOX CLEARED, END: "{5B}I'm afraid you don't{57}have enough golds.  So sorry.{5E}"
		ScriptID    $5F,$9		  ; Run	text script at offset 0x0278B4
						  ; 0xE05F: PRINT MSG 0x00AC, MSGBOX CLEARED, END: "{5B}Well, if you should{57}change your mind....{5E}"
		dc.b ITM_ISLANDMAP
		dc.b $0C
		dc.w $02D9			  ; Destel inn - map
		ScriptID    $60,$2		  ; Run	text script at offset 0x0278B6
						  ; 0xE060: PRINT MSG 0x00AD, MSGBOX CLEARED, END: "{5B}It's the {5F}.{57}Bring it to the counter.{5E}"
		ScriptJump  HandleMap,$3	  ; Jump to address 0x0250B2
		ScriptID    $59,$4		  ; Run	text script at offset 0x0278A8
						  ; 0xE059: PRINT MSG 0x00A6, MSGBOX CLEARED, END: "{5B}Hey!{57}You have to pay	for that!!{5E}"
		ScriptID    $61,$5		  ; Run	text script at offset 0x0278B8
						  ; 0xA061: PRINT MSG 0x00AE, END: "{5B}You want to see{57}the {5F}?{58}"
		dc.b ITM_HOTELREGISTER
		dc.b $14
		dc.w $02E9			  ; Kazalt inn - register
		ScriptID    $2B,$2		  ; Run	text script at offset 0x02784C
						  ; 0xE02B: PRINT MSG 0x0078, MSGBOX CLEARED, END: "{5B}{5A} golds for a night.{57}Please put it on the	counter{57}if you want to stay.{5E}"
		ScriptJump  HandleInnStay,$3	  ; Jump to address 0x025044
		ScriptID    $9F,$4		  ; Run	text script at offset 0x027934
						  ; 0xE09F: PRINT MSG 0x00EC, MSGBOX CLEARED, END: "{5B}Say!  That's ours!{57}Stop right there!{5E}"
		ScriptID    $2C,$5		  ; Run	text script at offset 0x02784E
						  ; 0xA02C: PRINT MSG 0x0079, END: "{5B}{5A} golds.{57}Will you	stay?{58}"
		ScriptID    $A0,$6		  ; Run	text script at offset 0x027936
						  ; 0xE0A0: PRINT MSG 0x00ED, MSGBOX CLEARED, END: "{5B}Thank you, kind	sir.{57}Please go in.{5E}"
		ScriptID    $2E,$7		  ; Run	text script at offset 0x027852
						  ; 0xE02E: PRINT MSG 0x007B, MSGBOX CLEARED, END: "{5B}Come back anytime{57}you need a	rest.{5E}"
		ScriptID    $2F,$8		  ; Run	text script at offset 0x027854
						  ; 0xE02F: PRINT MSG 0x007C, MSGBOX CLEARED, END: "{5B}You don't have{57}enough golds, do you?{5E}"
		ScriptID    $30,$9		  ; Run	text script at offset 0x027856
						  ; 0xE030: PRINT MSG 0x007D, MSGBOX CLEARED, END: "{5B}What a pity....{5E}"
		dc.b ITM_EKEEKE
		dc.b $06
		dc.w $0307			  ; Mir's tower - priest room
		ScriptJump  GainItem,$2		  ; Jump to address 0x034AD0
		dc.b ITM_DETOXGRASS
		dc.b $06
		dc.w $0307			  ; Mir's tower - priest room
		ScriptJump  GainItem,$2		  ; Jump to address 0x034AD0
		dc.b ITM_DETOXBOOK
		dc.b $18
		dc.w $FFFF			  ; Generic - Detox book
		ScriptID    $F,$2		  ; Run	text script at offset 0x027814
						  ; 0xE00F: PRINT MSG 0x005C, MSGBOX CLEARED, END: "{5B}That's a {5F}.{5E}"
		ScriptJump  HandleStatusCure,$3	  ; Jump to address 0x024F60
		ScriptID    $E,$4		  ; Run	text script at offset 0x027812
						  ; 0xE00E: PRINT MSG 0x005B, MSGBOX CLEARED, END: "{5B}Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		ScriptID    $10,$5		  ; Run	text script at offset 0x027816
						  ; 0x8010: PRINT MSG 0x005D: "{5B}Need	detoxification?{62}"
						  ; 0xA011: PRINT MSG 0x005E, END: "{5B}Make a contribution{57}of {5A} golds.{58}"
		ScriptID    $12,$6		  ; Run	text script at offset 0x02781A
						  ; 0xE012: PRINT MSG 0x005F, MSGBOX CLEARED, END: "{5B}My humble thanks.{57}Now, just hold still.{57}This won't hurt a bit....{5E}"
		ScriptID    $13,$7		  ; Run	text script at offset 0x02781C
						  ; 0x8013: PRINT MSG 0x0060: "{5B}Done.{57}The	poison has left{57}your	body.{62}"
						  ; 0xE014: PRINT MSG 0x0061, MSGBOX CLEARED, END: "{5B}Now, let's be more careful,{57}shall we?{5E}"
		ScriptID    $15,$8		  ; Run	text script at offset 0x027820
						  ; 0xE015: PRINT MSG 0x0062, MSGBOX CLEARED, END: "{5B}Can't make a contribution?{57}Sorry, but I can do nothing.{57}You had better come again...{5E}"
		ScriptID    $16,$9		  ; Run	text script at offset 0x027822
						  ; 0x8016: PRINT MSG 0x0063: "{5B}Then	I am afraid{57}you are not much	longer{57}for this world{62}"
						  ; 0xE017: PRINT MSG 0x0064, MSGBOX CLEARED, END: "{5B}May the	goddess{57}have	mercy on thee...{5E}"
		ScriptID    $18,$A		  ; Run	text script at offset 0x027826
						  ; 0xE018: PRINT MSG 0x0065, MSGBOX CLEARED, END: "{5B}Hmmm{59}.{59}.{59}.{57}No poison...{57}No detoxification needed!{5E}"
		dc.b $01			  ; Jump to address 0x024D40
		dc.b $00
		dc.b ITM_ANTICURSE
		dc.b $18
		dc.w $FFFF			  ; Generic - Anticurse
		ScriptID    $19,$2		  ; Run	text script at offset 0x027828
						  ; 0xE019: PRINT MSG 0x0066, MSGBOX CLEARED, END: "{5B}That's an {5F} Book.{57}It describes various curses.{5E}"
		ScriptJump  HandleStatusCure,$3	  ; Jump to address 0x024F60
		ScriptID    $E,$4		  ; Run	text script at offset 0x027812
						  ; 0xE00E: PRINT MSG 0x005B, MSGBOX CLEARED, END: "{5B}Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		ScriptID    $1A,$5		  ; Run	text script at offset 0x02782A
						  ; 0x801A: PRINT MSG 0x0067: "{5B}Can you afford a{57}contribution of {5A} golds{62}"
						  ; 0xA01B: PRINT MSG 0x0068, END: "{5B}to cure	the curse?{58}"
		ScriptID    $12,$6		  ; Run	text script at offset 0x02781A
						  ; 0xE012: PRINT MSG 0x005F, MSGBOX CLEARED, END: "{5B}My humble thanks.{57}Now, just hold still.{57}This won't hurt a bit....{5E}"
		ScriptID    $1C,$7		  ; Run	text script at offset 0x02782E
						  ; 0xE01C: PRINT MSG 0x0069, MSGBOX CLEARED, END: "{5B}Ta-da!{57}The curse has	been lifted.{5E}"
		ScriptID    $15,$8		  ; Run	text script at offset 0x027820
						  ; 0xE015: PRINT MSG 0x0062, MSGBOX CLEARED, END: "{5B}Can't make a contribution?{57}Sorry, but I can do nothing.{57}You had better come again...{5E}"
		ScriptID    $16,$9		  ; Run	text script at offset 0x027822
						  ; 0x8016: PRINT MSG 0x0063: "{5B}Then	I am afraid{57}you are not much	longer{57}for this world{62}"
						  ; 0xE017: PRINT MSG 0x0064, MSGBOX CLEARED, END: "{5B}May the	goddess{57}have	mercy on thee...{5E}"
		ScriptID    $1D,$A		  ; Run	text script at offset 0x027830
						  ; 0xE01D: PRINT MSG 0x006A, MSGBOX CLEARED, END: "{5B}I really want{57}to help you{59}.{59}.{59}.{57}but you're not cursed.{5E}"
		dc.b $08			  ; Jump to address 0x025458
		dc.b $00
		dc.b ITM_AWAKENINGBOOK
		dc.b $18
		dc.w $FFFF			  ; Generic - Awakening	book
		ScriptID    $1E,$2		  ; Run	text script at offset 0x027832
						  ; 0xE01E: PRINT MSG 0x006B, MSGBOX CLEARED, END: "{5B}That's an {5F}.{57}It's essential in curing{57}hallucinations.{5E}"
		ScriptJump  HandleStatusCure,$3	  ; Jump to address 0x024F60
		ScriptID    $E,$4		  ; Run	text script at offset 0x027812
						  ; 0xE00E: PRINT MSG 0x005B, MSGBOX CLEARED, END: "{5B}Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		ScriptID    $1F,$5		  ; Run	text script at offset 0x027834
						  ; 0x801F: PRINT MSG 0x006C: "{5B}Can you afford a{57}contribution of {5A} golds{62}"
						  ; 0xA020: PRINT MSG 0x006D, END: "{5B}for the	cure?{58}"
		ScriptID    $12,$6		  ; Run	text script at offset 0x02781A
						  ; 0xE012: PRINT MSG 0x005F, MSGBOX CLEARED, END: "{5B}My humble thanks.{57}Now, just hold still.{57}This won't hurt a bit....{5E}"
		ScriptID    $21,$7		  ; Run	text script at offset 0x027838
						  ; 0xE021: PRINT MSG 0x006E, MSGBOX CLEARED, END: "{5B}Ahh...that's better!{57}Your hallucinations are gone.{5E}"
		ScriptID    $15,$8		  ; Run	text script at offset 0x027820
						  ; 0xE015: PRINT MSG 0x0062, MSGBOX CLEARED, END: "{5B}Can't make a contribution?{57}Sorry, but I can do nothing.{57}You had better come again...{5E}"
		ScriptID    $16,$9		  ; Run	text script at offset 0x027822
						  ; 0x8016: PRINT MSG 0x0063: "{5B}Then	I am afraid{57}you are not much	longer{57}for this world{62}"
						  ; 0xE017: PRINT MSG 0x0064, MSGBOX CLEARED, END: "{5B}May the	goddess{57}have	mercy on thee...{5E}"
		ScriptID    $22,$A		  ; Run	text script at offset 0x02783A
						  ; 0xE022: PRINT MSG 0x006F, MSGBOX CLEARED, END: "{5B}W-what...?{57}But you're not{57}hallucinating now!{5E}"
		dc.b $02			  ; Jump to address 0x024E70
		dc.b $00
		dc.b ITM_RECORDBOOK
		dc.b $18
		dc.w $FFFF			  ; Generic - Record book
		ScriptJump  HandleIdentifyRecordBook,$2	; Jump to address 0x025F18
		ScriptJump  HandleRecordBookUse,$3 ; Jump to address 0x024FE0
		ScriptJump  HandleRecordBookTheft,$4 ; Jump to address 0x025F58
		ScriptJump  RequestGameSaveMsg,$5 ; Jump to address 0x025F20
		ScriptJump  InitiateGameSaveMsg,$6 ; Jump to address 0x025F28
		ScriptJump  GameSaveCompleteMsg,$7 ; Jump to address 0x025F30
		ScriptJump  GameSaveRefusedMsg,$8 ; Jump to address 0x025F38
		ScriptJump  RequestGameContinueMsg,$9 ;	Jump to	address	0x025F40
		ScriptJump  ConfirmGameContinueMsg,$A ;	Jump to	address	0x025F48
		ScriptJump  ConfirmGameStopMsg,$B ; Jump to address 0x025F50
		dc.b ITM_HOTELREGISTER
		dc.b $14
		dc.w $FFFF			  ; Generic - Hotel Register
		ScriptID    $2B,$2		  ; Run	text script at offset 0x02784C
						  ; 0xE02B: PRINT MSG 0x0078, MSGBOX CLEARED, END: "{5B}{5A} golds for a night.{57}Please put it on the	counter{57}if you want to stay.{5E}"
		ScriptJump  HandleInnStay,$3	  ; Jump to address 0x025044
		ScriptID    $B,$4		  ; Run	text script at offset 0x02780C
						  ; 0xE00B: PRINT MSG 0x0058, MSGBOX CLEARED, END: "{5B}No, no.{57}You cannot take our{57}equipment with you!{5E}"
		ScriptID    $2C,$5		  ; Run	text script at offset 0x02784E
						  ; 0xA02C: PRINT MSG 0x0079, END: "{5B}{5A} golds.{57}Will you	stay?{58}"
		ScriptID    $2D,$6		  ; Run	text script at offset 0x027850
						  ; 0xE02D: PRINT MSG 0x007A, MSGBOX CLEARED, END: "{5B}Thank you.{57}Your room	is upstairs.{5E}"
		ScriptID    $2E,$7		  ; Run	text script at offset 0x027852
						  ; 0xE02E: PRINT MSG 0x007B, MSGBOX CLEARED, END: "{5B}Come back anytime{57}you need a	rest.{5E}"
		ScriptID    $2F,$8		  ; Run	text script at offset 0x027854
						  ; 0xE02F: PRINT MSG 0x007C, MSGBOX CLEARED, END: "{5B}You don't have{57}enough golds, do you?{5E}"
		ScriptID    $30,$9		  ; Run	text script at offset 0x027856
						  ; 0xE030: PRINT MSG 0x007D, MSGBOX CLEARED, END: "{5B}What a pity....{5E}"
		dc.b ITM_ISLANDMAP
		dc.b $0C
		dc.w $FFFF			  ; Generic - Island Map
		ScriptID    $31,$2		  ; Run	text script at offset 0x027858
						  ; 0xE031: PRINT MSG 0x007E, MSGBOX CLEARED, END: "{5B}It's the {5F}.{57}Put it on the counter{57}if you want to take a look.{5E}"
		ScriptJump  HandleMap,$3	  ; Jump to address 0x0250B2
		ScriptID    $B,$4		  ; Run	text script at offset 0x02780C
						  ; 0xE00B: PRINT MSG 0x0058, MSGBOX CLEARED, END: "{5B}No, no.{57}You cannot take our{57}equipment with you!{5E}"
		ScriptID    $32,$5		  ; Run	text script at offset 0x02785A
						  ; 0xA032: PRINT MSG 0x007F, END: "{5B}You want to see	the{57}{5F}, right?{58}"
		dc.w $FFFF
