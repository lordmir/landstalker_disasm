		dc.w $254
		dc.b $10
		dc.b 8
		ScriptID    $7,$2	; Run text script at offset 0x02772C
					; 0xE007: PRINT	MSG 0x0054, MSGBOX CLEARED, END: "{5B}:	May I help you?{5E}"
		ScriptID    $8,$3	; Run text script at offset 0x02772E
					; 0xE008: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{5B}:	Thanks,	mister!{5E}"
		ScriptJump  ShopPrice_01,$4 ; Jump to address 0x025D3E
		ScriptJump  Shop_01,$5	; Jump to address 0x025D44
		ScriptID    $E,$6	; Run text script at offset 0x02773A
					; 0xE00E: PRINT	MSG 0x005B, MSGBOX CLEARED, END: "{5B}:	Hey!  Stop, thief!!{5E}"
		dc.w $255
		dc.b $10
		dc.b $10
		ScriptID    $12,$9	; Run text script at offset 0x027742
					; 0xE012: PRINT	MSG 0x005F, MSGBOX CLEARED, END: "{5B}:	Welcome	to our church.{5E}"
		ScriptID    $13,$A	; Run text script at offset 0x027744
					; 0xE013: PRINT	MSG 0x0060, MSGBOX CLEARED, END: "{5B}:	Be careful.{57}May the goddess bless you!{5E}"
		ScriptJump  CS_NULL,$B	; Jump to address 0x027148
		ScriptJump  CS_NULL,$C	; Jump to address 0x027148
		ScriptID    $14,$D	; Run text script at offset 0x027746
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END: "{5B}:	Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		dc.w $256
		dc.b 8
		dc.b $10
		ScriptID    $F,$10	; Run text script at offset 0x02773C
					; 0xE00F: PRINT	MSG 0x005C, MSGBOX CLEARED, END: "{5B}:	Hi!{57}Do you wanna stay?{5E}"
		ScriptID    $10,$11	; Run text script at offset 0x02773E
					; 0xE010: PRINT	MSG 0x005D, MSGBOX CLEARED, END: "{5B}:	Take it	easy!{5E}"
		ScriptJump  CS_NULL,$12	; Jump to address 0x027148
		ScriptJump  CS_NULL,$13	; Jump to address 0x027148
		ScriptID    $11,$14	; Run text script at offset 0x027740
					; 0xE011: PRINT	MSG 0x005E, MSGBOX CLEARED, END: "{5B}:	No, no.{57}You cannot take our{57}equipment with you!{5E}"
		dc.w $25F
		dc.b $10
		dc.b $10
		ScriptID    $12,$17	; Run text script at offset 0x027742
					; 0xE012: PRINT	MSG 0x005F, MSGBOX CLEARED, END: "{5B}:	Welcome	to our church.{5E}"
		ScriptID    $13,$18	; Run text script at offset 0x027744
					; 0xE013: PRINT	MSG 0x0060, MSGBOX CLEARED, END: "{5B}:	Be careful.{57}May the goddess bless you!{5E}"
		ScriptJump  CS_NULL,$19	; Jump to address 0x027148
		ScriptJump  CS_NULL,$1A	; Jump to address 0x027148
		ScriptID    $14,$1B	; Run text script at offset 0x027746
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END: "{5B}:	Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		dc.w $260
		dc.b $10
		dc.b $B
		ScriptID    $3E,$1E	; Run text script at offset 0x02779A
					; 0xE03E: PRINT	MSG 0x008B, MSGBOX CLEARED, END: "{5B}:	Howdy!{57}Are you going	to stay?{5E}"
		ScriptID    $3F,$1F	; Run text script at offset 0x02779C
					; 0xE03F: PRINT	MSG 0x008C, MSGBOX CLEARED, END: "{5B}:	Thank you, sir.{5E}"
		ScriptJump  ShopPrice_02,$20 ; Jump to address 0x025D50
		ScriptJump  Shop_02,$21	; Jump to address 0x025D56
		ScriptID    $45,$22	; Run text script at offset 0x0277A8
					; 0xE045: PRINT	MSG 0x0092, MSGBOX CLEARED, END: "{5B}:	What are you doing!{5E}"
		dc.w $267
		dc.b $10
		dc.b $10
		ScriptID    $4E,$25	; Run text script at offset 0x0277BA
					; 0xE04E: PRINT	MSG 0x009B, MSGBOX CLEARED, END: "{5B}:	I've been running this shop{57}for 30 years now.{5E}"
		ScriptID    $4F,$26	; Run text script at offset 0x0277BC
					; 0xE04F: PRINT	MSG 0x009C, MSGBOX CLEARED, END: "{5B}:	Thanks!	 Come again!{5E}"
		ScriptJump  ShopPrice_03,$27 ; Jump to address 0x025D62
		ScriptJump  Shop_03,$28	; Jump to address 0x025D68
		ScriptID    $55,$29	; Run text script at offset 0x0277C8
					; 0xE055: PRINT	MSG 0x00A2, MSGBOX CLEARED, END: "{5B}:	Hey, you!  Hey!{5E}"
		dc.w $265
		dc.b $10
		dc.b $10
		ScriptID    $12,$2C	; Run text script at offset 0x027742
					; 0xE012: PRINT	MSG 0x005F, MSGBOX CLEARED, END: "{5B}:	Welcome	to our church.{5E}"
		ScriptID    $13,$2D	; Run text script at offset 0x027744
					; 0xE013: PRINT	MSG 0x0060, MSGBOX CLEARED, END: "{5B}:	Be careful.{57}May the goddess bless you!{5E}"
		ScriptJump  CS_NULL,$2E	; Jump to address 0x027148
		ScriptJump  CS_NULL,$2F	; Jump to address 0x027148
		ScriptID    $14,$30	; Run text script at offset 0x027746
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END: "{5B}:	Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		dc.w $26F
		dc.b $10
		dc.b $10
		ScriptID    $56,$33	; Run text script at offset 0x0277CA
					; 0xE056: PRINT	MSG 0x00A3, MSGBOX CLEARED, END: "{5B}:	Hello, stranger.{57}You	can take a rest, and{57}even buy souvenirs here!{5E}"
		ScriptID    $57,$34	; Run text script at offset 0x0277CC
					; 0xE057: PRINT	MSG 0x00A4, MSGBOX CLEARED, END: "{5B}:	Are you	leaving?{57}Good luck!{5E}"
		ScriptJump  ShopPrice_04,$35 ; Jump to address 0x025D74
		ScriptJump  Shop_04,$36	; Jump to address 0x025D7A
		ScriptID    $5D,$37	; Run text script at offset 0x0277D8
					; 0xE05D: PRINT	MSG 0x00AA, MSGBOX CLEARED, END: "{5B}:	Hey!{57}You have to pay	for that!!{5E}"
		dc.w $2A6
		dc.b $18
		dc.b $10
		ScriptID    $66,$3A	; Run text script at offset 0x0277EA
					; 0xE066: PRINT	MSG 0x00B3, MSGBOX CLEARED, END: "{5B}:	Mercator Discount Shop!!{57}30%	off!!  40% off!!  C'mon!{57}You want it, I got it!!{5E}"
		ScriptID    $67,$3B	; Run text script at offset 0x0277EC
					; 0xE067: PRINT	MSG 0x00B4, MSGBOX CLEARED, END: "{5B}:	Thank you, boy!{57}Come	again!{5E}"
		ScriptJump  ShopPrice_05,$3C ; Jump to address 0x025D86
		ScriptJump  Shop_05,$3D	; Jump to address 0x025D8C
		ScriptID    $6D,$3E	; Run text script at offset 0x0277F8
					; 0xE06D: PRINT	MSG 0x00BA, MSGBOX CLEARED, END: "{5B}:	Just a minute!{57}It's cheap, but it ain't free!{57}{5E}"
		dc.w $2B7
		dc.b $10
		dc.b $10
		ScriptID    $6E,$41	; Run text script at offset 0x0277FA
					; 0xE06E: PRINT	MSG 0x00BB, MSGBOX CLEARED, END: "{5B}:	Nigel!	What do	you want?{57}I'll lower the price for you.{5E}"
		ScriptID    $6F,$42	; Run text script at offset 0x0277FC
					; 0xE06F: PRINT	MSG 0x00BC, MSGBOX CLEARED, END: "{5B}:	Please stop by again, Nigel.{5E}"
		ScriptJump  ShopPrice_06,$43 ; Jump to address 0x025D98
		ScriptJump  Shop_06,$44	; Jump to address 0x025D9E
		ScriptID    $76,$45	; Run text script at offset 0x02780A
					; 0xE076: PRINT	MSG 0x00C3, MSGBOX CLEARED, END: "{5B}:	Wait a minute, Nigel!{57}Put that back!{5E}"
		dc.w $281
		dc.b $C
		dc.b $10
		ScriptJump  CS_NULL,$48	; Jump to address 0x027148
		ScriptJump  CS_NULL,$49	; Jump to address 0x027148
		ScriptJump  ShopPrice_01,$4A ; Jump to address 0x025D3E
		ScriptJump  Shop_01,$4B	; Jump to address 0x025D44
		ScriptID    $E,$4C	; Run text script at offset 0x02773A
					; 0xE00E: PRINT	MSG 0x005B, MSGBOX CLEARED, END: "{5B}:	Hey!  Stop, thief!!{5E}"
		dc.w $2BB
		dc.b $10
		dc.b $10
		ScriptID    $12,$4F	; Run text script at offset 0x027742
					; 0xE012: PRINT	MSG 0x005F, MSGBOX CLEARED, END: "{5B}:	Welcome	to our church.{5E}"
		ScriptID    $13,$50	; Run text script at offset 0x027744
					; 0xE013: PRINT	MSG 0x0060, MSGBOX CLEARED, END: "{5B}:	Be careful.{57}May the goddess bless you!{5E}"
		ScriptJump  CS_NULL,$51	; Jump to address 0x027148
		ScriptJump  CS_NULL,$52	; Jump to address 0x027148
		ScriptID    $14,$53	; Run text script at offset 0x027746
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END: "{5B}:	Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		dc.w $2BD
		dc.b $20
		dc.b $10
		ScriptID    $77,$56	; Run text script at offset 0x02780C
					; 0xE077: PRINT	MSG 0x00C4, MSGBOX CLEARED, END: "{5B}:	Hello, sir.{57}Welcome to my hotel.{5E}"
		ScriptID    $78,$57	; Run text script at offset 0x02780E
					; 0xE078: PRINT	MSG 0x00C5, MSGBOX CLEARED, END: "{5B}:	I hope you have{57}a nice trip.{5E}"
		ScriptJump  CS_NULL,$58	; Jump to address 0x027148
		ScriptJump  CS_NULL,$59	; Jump to address 0x027148
		ScriptID    $79,$5A	; Run text script at offset 0x027810
					; 0xE079: PRINT	MSG 0x00C6, MSGBOX CLEARED, END: "{5B}:	No, no!{57}It's not a gift.{5E}"
		dc.w $2CF
		dc.b $10
		dc.b $18
		ScriptJump  ShopEnter_07,$5D ; Jump to address 0x025DC8
		ScriptJump  ShopLeave_07,$5E ; Jump to address 0x025DD4
		ScriptJump  ShopPrice_07,$5F ; Jump to address 0x025DB6
		ScriptJump  Shop_07,$60	; Jump to address 0x025DBC
		ScriptJump  ShopSteal_07,$61 ; Jump to address 0x025DE0
		dc.w $2D1
		dc.b $10
		dc.b $10
		ScriptID    $12,$64	; Run text script at offset 0x027742
					; 0xE012: PRINT	MSG 0x005F, MSGBOX CLEARED, END: "{5B}:	Welcome	to our church.{5E}"
		ScriptID    $13,$65	; Run text script at offset 0x027744
					; 0xE013: PRINT	MSG 0x0060, MSGBOX CLEARED, END: "{5B}:	Be careful.{57}May the goddess bless you!{5E}"
		ScriptJump  CS_NULL,$66	; Jump to address 0x027148
		ScriptJump  CS_NULL,$67	; Jump to address 0x027148
		ScriptID    $14,$68	; Run text script at offset 0x027746
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END: "{5B}:	Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		dc.w $2DD
		dc.b $10
		dc.b $20
		ScriptID    $96,$6B	; Run text script at offset 0x02784A
					; 0xE096: PRINT	MSG 0x00E3, MSGBOX CLEARED, END: "{5B}:	Kindly's Shop!{57}Welcome, boy!{5E}"
		ScriptID    $97,$6C	; Run text script at offset 0x02784C
					; 0xE097: PRINT	MSG 0x00E4, MSGBOX CLEARED, END: "{5B}:	Bye!  See you again.{5E}"
		ScriptJump  ShopPrice_03,$6D ; Jump to address 0x025D62
		ScriptJump  Shop_03,$6E	; Jump to address 0x025D68
		ScriptID    $98,$6F	; Run text script at offset 0x02784E
					; 0xE098: PRINT	MSG 0x00E5, MSGBOX CLEARED, END: "{5B}:	Hey!  What are you doing?{57}Did your parents teach you{57}to be a thief?{5E}"
		dc.w $2E0
		dc.b $10
		dc.b $10
		ScriptID    $12,$72	; Run text script at offset 0x027742
					; 0xE012: PRINT	MSG 0x005F, MSGBOX CLEARED, END: "{5B}:	Welcome	to our church.{5E}"
		ScriptID    $13,$73	; Run text script at offset 0x027744
					; 0xE013: PRINT	MSG 0x0060, MSGBOX CLEARED, END: "{5B}:	Be careful.{57}May the goddess bless you!{5E}"
		ScriptJump  CS_NULL,$74	; Jump to address 0x027148
		ScriptJump  CS_NULL,$75	; Jump to address 0x027148
		ScriptID    $14,$76	; Run text script at offset 0x027746
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END: "{5B}:	Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		dc.w $2D9
		dc.b $10
		dc.b $10
		ScriptID    $99,$79	; Run text script at offset 0x027850
					; 0xE099: PRINT	MSG 0x00E6, MSGBOX CLEARED, END: "{5B}:	You're welcome to stay{57}as long as you don't{57}behave violently.{5E}"
		ScriptID    $57,$7A	; Run text script at offset 0x0277CC
					; 0xE057: PRINT	MSG 0x00A4, MSGBOX CLEARED, END: "{5B}:	Are you	leaving?{57}Good luck!{5E}"
		ScriptJump  ShopPrice_04,$7B ; Jump to address 0x025D74
		ScriptJump  Shop_04,$7C	; Jump to address 0x025D7A
		ScriptID    $5D,$7D	; Run text script at offset 0x0277D8
					; 0xE05D: PRINT	MSG 0x00AA, MSGBOX CLEARED, END: "{5B}:	Hey!{57}You have to pay	for that!!{5E}"
		dc.w $2EB
		dc.b $10
		dc.b $40
		ScriptID    $9A,$80	; Run text script at offset 0x027852
					; 0x809A: PRINT	MSG 0x00E7: "{5B}: Who's this coming{57}to my Underground Shop?{62}"
					; 0xE09B: PRINT	MSG 0x00E8, MSGBOX CLEARED, END: "{5B}:	I haven't had a{57}customer in ages!{5E}"
		ScriptID    $9C,$81	; Run text script at offset 0x027856
					; 0xE09C: PRINT	MSG 0x00E9, MSGBOX CLEARED, END: "{5B}:	Do come	again.{57}You're my only customer{57}for the last 200 years.{5E}"
		ScriptJump  ShopPrice_01,$82 ; Jump to address 0x025D3E
		ScriptJump  Shop_01,$83	; Jump to address 0x025D44
		ScriptID    $9D,$84	; Run text script at offset 0x027858
					; 0xE09D: PRINT	MSG 0x00EA, MSGBOX CLEARED, END: "{5B}:	Scoundrel!{57}In 200 years, I have never{57}seen such rudeness!{5E}"
		dc.w $2ED
		dc.b $10
		dc.b $10
		ScriptID    $12,$87	; Run text script at offset 0x027742
					; 0xE012: PRINT	MSG 0x005F, MSGBOX CLEARED, END: "{5B}:	Welcome	to our church.{5E}"
		ScriptID    $13,$88	; Run text script at offset 0x027744
					; 0xE013: PRINT	MSG 0x0060, MSGBOX CLEARED, END: "{5B}:	Be careful.{57}May the goddess bless you!{5E}"
		ScriptJump  CS_NULL,$89	; Jump to address 0x027148
		ScriptJump  CS_NULL,$8A	; Jump to address 0x027148
		ScriptID    $14,$8B	; Run text script at offset 0x027746
					; 0xE014: PRINT	MSG 0x0061, MSGBOX CLEARED, END: "{5B}:	Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		dc.w $2E9
		dc.b $10
		dc.b $10
		ScriptID    $9E,$8E	; Run text script at offset 0x02785A
					; 0xE09E: PRINT	MSG 0x00EB, MSGBOX CLEARED, END: "{5B}:	May I help you?{57}Would you like to stay?{57}Our beds are all ready.{5E}"
		ScriptID    $10,$8F	; Run text script at offset 0x02773E
					; 0xE010: PRINT	MSG 0x005D, MSGBOX CLEARED, END: "{5B}:	Take it	easy!{5E}"
		ScriptJump  CS_NULL,$90	; Jump to address 0x027148
		ScriptJump  CS_NULL,$91	; Jump to address 0x027148
		ScriptID    $9F,$92	; Run text script at offset 0x02785C
					; 0xE09F: PRINT	MSG 0x00EC, MSGBOX CLEARED, END: "{5B}:	Say!{57}That's ours!{57}Stop right there!{5E}"
		dc.w $307
		dc.b $10
		dc.b $10
		ScriptJump  CS_NULL,$95	; Jump to address 0x027148
		ScriptJump  CS_NULL,$96	; Jump to address 0x027148
		ScriptJump  CS_NULL,$97	; Jump to address 0x027148
		ScriptJump  CS_NULL,$98	; Jump to address 0x027148
		ScriptID    $A1,$99	; Run text script at offset 0x027860
					; 0xE0A1: PRINT	MSG 0x00EE, MSGBOX CLEARED, END: "{5B}:	Noooo....{57}Don't take it awaaaaaaay......{5E}"
		dc.w $29
		dc.b $10
		dc.b $10
		ScriptID    $AA,$9C	; Run text script at offset 0x027872
					; 0xE0AA: PRINT	MSG 0x00F7, MSGBOX CLEARED, END: "{5B}:	Oh, a guessssst......{57}to my grave....{5E}"
		ScriptID    $AB,$9D	; Run text script at offset 0x027874
					; 0xE0AB: PRINT	MSG 0x00F8, MSGBOX CLEARED, END: "{5B}:	I'll be.....waiting........{5E}"
		ScriptJump  CS_NULL,$9E	; Jump to address 0x027148
		ScriptJump  CS_NULL,$9F	; Jump to address 0x027148
		ScriptID    $A1,$A0	; Run text script at offset 0x027860
					; 0xE0A1: PRINT	MSG 0x00EE, MSGBOX CLEARED, END: "{5B}:	Noooo....{57}Don't take it awaaaaaaay......{5E}"
		dc.w $294
		dc.b $10
		dc.b $10
		ScriptID    $930,$A3	; Run text script at offset 0x02897E
					; 0xE73B: PRINT	MSG 0x0788, MSGBOX CLEARED, END: "{5B}:	Specially selected{57}goods are	waiting	for you!{57}Just for you!{5E}"
		ScriptJump  ShopLeave_08,$A4 ; Jump to address 0x02506E
		ScriptJump  ShopPrice_08,$A5 ; Jump to address 0x025088
		ScriptJump  Shop_08,$A6	; Jump to address 0x0250A0
		ScriptID    $937,$A7	; Run text script at offset 0x02898C
					; 0xE742: PRINT	MSG 0x078F, MSGBOX CLEARED, END: "{5B}:	No kidding!{5E}"
		dc.w $205
		dc.b $10
		dc.b $10
		ScriptID    $AC,$AA	; Run text script at offset 0x027876
					; 0xE0AC: PRINT	MSG 0x00F9, MSGBOX CLEARED, END: "{5B}:	Welcome	to{57}Kelketo Waterfall	Item Shop!{5E}"
		ScriptID    $AD,$AB	; Run text script at offset 0x027878
					; 0xE0AD: PRINT	MSG 0x00FA, MSGBOX CLEARED, END: "{5B}:	Kelketo	Falls is{57}great for sightseeing.{57}Please come again!{5E}"
		ScriptJump  ShopPrice_04,$AC ; Jump to address 0x025D74
		ScriptJump  Shop_04,$AD	; Jump to address 0x025D7A
		ScriptID    $AE,$AE	; Run text script at offset 0x02787A
					; 0xE0AE: PRINT	MSG 0x00FB, MSGBOX CLEARED, END: "{5B}:	Wha--!	Are you	a thief?{5E}"
		dc.w $20E
		dc.b $13
		dc.b $30
		ScriptID    $AF,$B1	; Run text script at offset 0x02787C
					; 0xE0AF: PRINT	MSG 0x00FC, MSGBOX CLEARED, END: "{5B}:	Kindly's brother?{57}That's me!  Welcome to{57}Greedly's Item Shop!{5E}"
		ScriptID    $97,$B2	; Run text script at offset 0x02784C
					; 0xE097: PRINT	MSG 0x00E4, MSGBOX CLEARED, END: "{5B}:	Bye!  See you again.{5E}"
		ScriptJump  ShopPrice_03,$B3 ; Jump to address 0x025D62
		ScriptJump  Shop_03,$B4	; Jump to address 0x025D68
		ScriptID    $98,$B5	; Run text script at offset 0x02784E
					; 0xE098: PRINT	MSG 0x00E5, MSGBOX CLEARED, END: "{5B}:	Hey!  What are you doing?{57}Did your parents teach you{57}to be a thief?{5E}"
		dc.w $131
		dc.b $10
		dc.b $10
		ScriptID    $AA,$B8	; Run text script at offset 0x027872
					; 0xE0AA: PRINT	MSG 0x00F7, MSGBOX CLEARED, END: "{5B}:	Oh, a guessssst......{57}to my grave....{5E}"
		ScriptID    $AB,$B9	; Run text script at offset 0x027874
					; 0xE0AB: PRINT	MSG 0x00F8, MSGBOX CLEARED, END: "{5B}:	I'll be.....waiting........{5E}"
		ScriptJump  CS_NULL,$BA	; Jump to address 0x027148
		ScriptJump  CS_NULL,$BB	; Jump to address 0x027148
		ScriptID    $A1,$BC	; Run text script at offset 0x027860
					; 0xE0A1: PRINT	MSG 0x00EE, MSGBOX CLEARED, END: "{5B}:	Noooo....{57}Don't take it awaaaaaaay......{5E}"
		dc.w $188
		dc.b $10
		dc.b $10
		ScriptJump  CS_NULL,$BF	; Jump to address 0x027148
		ScriptJump  CS_NULL,$C0	; Jump to address 0x027148
		ScriptJump  CS_NULL,$C1	; Jump to address 0x027148
		ScriptJump  CS_NULL,$C2	; Jump to address 0x027148
		ScriptID    $A1,$C3	; Run text script at offset 0x027860
					; 0xE0A1: PRINT	MSG 0x00EE, MSGBOX CLEARED, END: "{5B}:	Noooo....{57}Don't take it awaaaaaaay......{5E}"
		dc.w $FFFF
