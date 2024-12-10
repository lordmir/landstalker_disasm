		dc.w $0254			  ; DATA XREF: sub_24A98+2At
						  ; sub_24D0C+At
						  ; Massan Shop
		dc.b $10			  ; Items/services normal price
		dc.b $08			  ; Lifestock half price
		ScriptID    $1,$2		  ; Run	text script at offset 0x0277F8
						  ; 0xE001: PRINT MSG 0x004E, MSGBOX CLEARED, END: "{5B}May I help you?{5E}"
		ScriptID    $2,$3		  ; Run	text script at offset 0x0277FA
						  ; 0xE002: PRINT MSG 0x004F, MSGBOX CLEARED, END: "{5B}Thanks,	mister!{5E}"
		ScriptJump  ShopPrice_01,$4	  ; Jump to address 0x025E16
		ScriptJump  Shop_01,$5		  ; Jump to address 0x025E1C
		ScriptID    $8,$6		  ; Run	text script at offset 0x027806
						  ; 0xE008: PRINT MSG 0x0055, MSGBOX CLEARED, END: "{5B}Hey!  Stop, thief!!{5E}"
		dc.w $0255			  ; Massan Church
		dc.b $10			  ; Items/services normal price
		dc.b $10			  ; Lifestock normal price
		ScriptID    $C,$9		  ; Run	text script at offset 0x02780E
						  ; 0xE00C: PRINT MSG 0x0059, MSGBOX CLEARED, END: "{5B}Welcome	to our church.{5E}"
		ScriptID    $D,$A		  ; Run	text script at offset 0x027810
						  ; 0xE00D: PRINT MSG 0x005A, MSGBOX CLEARED, END: "{5B}Be careful.{57}May the goddess bless you!{5E}"
		ScriptJump  CS_NULL,$B		  ; Jump to address 0x027220
		ScriptJump  CS_NULL,$C		  ; Jump to address 0x027220
		ScriptID    $E,$D		  ; Run	text script at offset 0x027812
						  ; 0xE00E: PRINT MSG 0x005B, MSGBOX CLEARED, END: "{5B}Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		dc.w $0256			  ; Massan Inn
		dc.b $08			  ; Items/services half	price
		dc.b $10			  ; Lifestock normal price
		ScriptID    $9,$10		  ; Run	text script at offset 0x027808
						  ; 0xE009: PRINT MSG 0x0056, MSGBOX CLEARED, END: "{5B}Hi!{57}Do you wanna stay?{5E}"
		ScriptID    $A,$11		  ; Run	text script at offset 0x02780A
						  ; 0xE00A: PRINT MSG 0x0057, MSGBOX CLEARED, END: "{5B}Take it	easy!{5E}"
		ScriptJump  CS_NULL,$12		  ; Jump to address 0x027220
		ScriptJump  CS_NULL,$13		  ; Jump to address 0x027220
		ScriptID    $B,$14		  ; Run	text script at offset 0x02780C
						  ; 0xE00B: PRINT MSG 0x0058, MSGBOX CLEARED, END: "{5B}No, no.{57}You cannot take our{57}equipment with you!{5E}"
		dc.w $025F			  ; Gumi Church
		dc.b $10			  ; Items/services normal price
		dc.b $10			  ; Lifestock normal price
		ScriptID    $C,$17		  ; Run	text script at offset 0x02780E
						  ; 0xE00C: PRINT MSG 0x0059, MSGBOX CLEARED, END: "{5B}Welcome	to our church.{5E}"
		ScriptID    $D,$18		  ; Run	text script at offset 0x027810
						  ; 0xE00D: PRINT MSG 0x005A, MSGBOX CLEARED, END: "{5B}Be careful.{57}May the goddess bless you!{5E}"
		ScriptJump  CS_NULL,$19		  ; Jump to address 0x027220
		ScriptJump  CS_NULL,$1A		  ; Jump to address 0x027220
		ScriptID    $E,$1B		  ; Run	text script at offset 0x027812
						  ; 0xE00E: PRINT MSG 0x005B, MSGBOX CLEARED, END: "{5B}Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		dc.w $0260			  ; Gumi Inn
		dc.b $10			  ; Items/Services normal price
		dc.b $0B			  ; Lifestock 11/16 normal price
		ScriptID    $3A,$1E		  ; Run	text script at offset 0x02786A
						  ; 0xE03A: PRINT MSG 0x0087, MSGBOX CLEARED, END: "{5B}Howdy, stranger!{57}Are	you going to stay?{5E}"
		ScriptID    $3B,$1F		  ; Run	text script at offset 0x02786C
						  ; 0xE03B: PRINT MSG 0x0088, MSGBOX CLEARED, END: "{5B}Thank you, sir.{5E}"
		ScriptJump  ShopPrice_02,$20	  ; Jump to address 0x025E28
		ScriptJump  Shop_02,$21		  ; Jump to address 0x025E2E
		ScriptID    $41,$22		  ; Run	text script at offset 0x027878
						  ; 0xE041: PRINT MSG 0x008E, MSGBOX CLEARED, END: "{5B}What are you doing!{5E}"
		dc.w $0267			  ; Ryuma Shop
		dc.b $10			  ; Items/services normal price
		dc.b $10			  ; Lifestock normal price
		ScriptID    $4A,$25		  ; Run	text script at offset 0x02788A
						  ; 0xE04A: PRINT MSG 0x0097, MSGBOX CLEARED, END: "{5B}I've been running this{57}shop for thirty years,{57}now.{5E}"
		ScriptID    $4B,$26		  ; Run	text script at offset 0x02788C
						  ; 0xE04B: PRINT MSG 0x0098, MSGBOX CLEARED, END: "{5B}Thanks!	 Come again!{5E}"
		ScriptJump  ShopPrice_03,$27	  ; Jump to address 0x025E3A
		ScriptJump  Shop_03,$28		  ; Jump to address 0x025E40
		ScriptID    $51,$29		  ; Run	text script at offset 0x027898
						  ; 0xE051: PRINT MSG 0x009E, MSGBOX CLEARED, END: "{5B}Hey, you!  Hey!!{5E}"
		dc.w $0265			  ; Ryuma Church
		dc.b $10			  ; Items/services normal price
		dc.b $10			  ; Lifestock normal price
		ScriptID    $C,$2C		  ; Run	text script at offset 0x02780E
						  ; 0xE00C: PRINT MSG 0x0059, MSGBOX CLEARED, END: "{5B}Welcome	to our church.{5E}"
		ScriptID    $D,$2D		  ; Run	text script at offset 0x027810
						  ; 0xE00D: PRINT MSG 0x005A, MSGBOX CLEARED, END: "{5B}Be careful.{57}May the goddess bless you!{5E}"
		ScriptJump  CS_NULL,$2E		  ; Jump to address 0x027220
		ScriptJump  CS_NULL,$2F		  ; Jump to address 0x027220
		ScriptID    $E,$30		  ; Run	text script at offset 0x027812
						  ; 0xE00E: PRINT MSG 0x005B, MSGBOX CLEARED, END: "{5B}Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		dc.w $026F			  ; Ryuma Inn
		dc.b $10			  ; Items/services normal price
		dc.b $10			  ; Lifestock normal price
		ScriptID    $52,$33		  ; Run	text script at offset 0x02789A
						  ; 0xE052: PRINT MSG 0x009F, MSGBOX CLEARED, END: "{5B}Welcome!{57}You	can take a rest, and{57}even buy supplies here!{5E}"
		ScriptID    $53,$34		  ; Run	text script at offset 0x02789C
						  ; 0xE053: PRINT MSG 0x00A0, MSGBOX CLEARED, END: "{5B}Are you	leaving?{57}Good luck!{5E}"
		ScriptJump  ShopPrice_04,$35	  ; Jump to address 0x025E4C
		ScriptJump  Shop_04,$36		  ; Jump to address 0x025E52
		ScriptID    $59,$37		  ; Run	text script at offset 0x0278A8
						  ; 0xE059: PRINT MSG 0x00A6, MSGBOX CLEARED, END: "{5B}Hey!{57}You have to pay	for that!!{5E}"
		dc.w $02A6			  ; Mercator Shop 1
		dc.b $18			  ; Items/services 1.5x	normal price
		dc.b $10			  ; Lifestock normal price
		ScriptID    $62,$3A		  ; Run	text script at offset 0x0278BA
						  ; 0xE062: PRINT MSG 0x00AF, MSGBOX CLEARED, END: "{5B}Mercator Discount Shop!!{57}30%	off!!  40% off!!  C'mon!{57}You want it, I got it!!{5E}"
		ScriptID    $63,$3B		  ; Run	text script at offset 0x0278BC
						  ; 0xE063: PRINT MSG 0x00B0, MSGBOX CLEARED, END: "{5B}Thank you, boy!{57}Come	again!{5E}"
		ScriptJump  ShopPrice_05,$3C	  ; Jump to address 0x025E5E
		ScriptJump  Shop_05,$3D		  ; Jump to address 0x025E64
		ScriptID    $69,$3E		  ; Run	text script at offset 0x0278C8
						  ; 0xE069: PRINT MSG 0x00B6, MSGBOX CLEARED, END: "{5B}Just a minute!{57}It's cheap, but it ain't free!{57}{5E}"
		dc.w $02B7			  ; Mercator Shop 2
		dc.b $10			  ; Items/services normal price
		dc.b $10			  ; Lifestock normal price
		ScriptID    $6A,$41		  ; Run	text script at offset 0x0278CA
						  ; 0x806A: PRINT MSG 0x00B7: "{5B}Nigel!  What	would you like?{62}"
						  ; 0xE06B: PRINT MSG 0x00B8, MSGBOX CLEARED, END: "{5B}Whatever you want, just{57}name	it, and	I'll{57}lower the price for you.{5E}"
		ScriptID    $6C,$42		  ; Run	text script at offset 0x0278CE
						  ; 0xE06C: PRINT MSG 0x00B9, MSGBOX CLEARED, END: "{5B}Please stop by again, Nigel.{5E}"
		ScriptJump  ShopPrice_06,$43	  ; Jump to address 0x025E70
		ScriptJump  Shop_06,$44		  ; Jump to address 0x025E76
		ScriptID    $73,$45		  ; Run	text script at offset 0x0278DC
						  ; 0xE073: PRINT MSG 0x00C0, MSGBOX CLEARED, END: "{5B}Wait a minute, Nigel!{57}Put that back!{5E}"
		dc.w $0281			  ; Mercator Harbour
		dc.b $0C			  ; Items/Services 3/4 normal price
		dc.b $10			  ; Lifestock normal price
		ScriptJump  CS_NULL,$48		  ; Jump to address 0x027220
		ScriptJump  CS_NULL,$49		  ; Jump to address 0x027220
		ScriptJump  ShopPrice_01,$4A	  ; Jump to address 0x025E16
		ScriptJump  Shop_01,$4B		  ; Jump to address 0x025E1C
		ScriptID    $8,$4C		  ; Run	text script at offset 0x027806
						  ; 0xE008: PRINT MSG 0x0055, MSGBOX CLEARED, END: "{5B}Hey!  Stop, thief!!{5E}"
		dc.w $02BB			  ; Mercator Church
		dc.b $10			  ; Items/services normal price
		dc.b $10			  ; Lifestock normal price
		ScriptID    $C,$4F		  ; Run	text script at offset 0x02780E
						  ; 0xE00C: PRINT MSG 0x0059, MSGBOX CLEARED, END: "{5B}Welcome	to our church.{5E}"
		ScriptID    $D,$50		  ; Run	text script at offset 0x027810
						  ; 0xE00D: PRINT MSG 0x005A, MSGBOX CLEARED, END: "{5B}Be careful.{57}May the goddess bless you!{5E}"
		ScriptJump  CS_NULL,$51		  ; Jump to address 0x027220
		ScriptJump  CS_NULL,$52		  ; Jump to address 0x027220
		ScriptID    $E,$53		  ; Run	text script at offset 0x027812
						  ; 0xE00E: PRINT MSG 0x005B, MSGBOX CLEARED, END: "{5B}Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		dc.w $02BD			  ; Mercator Hotel
		dc.b $20			  ; Items/services 2x normal price
		dc.b $10			  ; Lifestock normal price
		ScriptID    $74,$56		  ; Run	text script at offset 0x0278DE
						  ; 0xE074: PRINT MSG 0x00C1, MSGBOX CLEARED, END: "{5B}Hello, sir.{57}Welcome to my hotel.{5E}"
		ScriptID    $75,$57		  ; Run	text script at offset 0x0278E0
						  ; 0xE075: PRINT MSG 0x00C2, MSGBOX CLEARED, END: "{5B}I hope you have{57}a nice trip.{5E}"
		ScriptJump  CS_NULL,$58		  ; Jump to address 0x027220
		ScriptJump  CS_NULL,$59		  ; Jump to address 0x027220
		ScriptID    $76,$5A		  ; Run	text script at offset 0x0278E2
						  ; 0xE076: PRINT MSG 0x00C3, MSGBOX CLEARED, END: "{5B}No, no!{57}It's not a gift.{5E}"
		dc.w $02CF			  ; Verla Shop
		dc.b $10			  ; Items/services normal price
		dc.b $18			  ; Lifestock 1.5x normal price
		ScriptJump  ShopEnter_07,$5D	  ; Jump to address 0x025EA0
		ScriptJump  ShopLeave_07,$5E	  ; Jump to address 0x025EAC
		ScriptJump  ShopPrice_07,$5F	  ; Jump to address 0x025E8E
		ScriptJump  Shop_07,$60		  ; Jump to address 0x025E94
		ScriptJump  ShopSteal_07,$61	  ; Jump to address 0x025EB8
		dc.w $02D1			  ; Verla Church
		dc.b $10			  ; Items/services normal price
		dc.b $10			  ; Lifestock normal price
		ScriptID    $C,$64		  ; Run	text script at offset 0x02780E
						  ; 0xE00C: PRINT MSG 0x0059, MSGBOX CLEARED, END: "{5B}Welcome	to our church.{5E}"
		ScriptID    $D,$65		  ; Run	text script at offset 0x027810
						  ; 0xE00D: PRINT MSG 0x005A, MSGBOX CLEARED, END: "{5B}Be careful.{57}May the goddess bless you!{5E}"
		ScriptJump  CS_NULL,$66		  ; Jump to address 0x027220
		ScriptJump  CS_NULL,$67		  ; Jump to address 0x027220
		ScriptID    $E,$68		  ; Run	text script at offset 0x027812
						  ; 0xE00E: PRINT MSG 0x005B, MSGBOX CLEARED, END: "{5B}Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		dc.w $02DD			  ; Destel Shop
		dc.b $10			  ; Items/services normal price
		dc.b $20			  ; Lifestock 2x normal	price
		ScriptID    $96,$6B		  ; Run	text script at offset 0x027922
						  ; 0xE096: PRINT MSG 0x00E3, MSGBOX CLEARED, END: "{5B}Welcome	to Kindly's Shop!{5E}"
		ScriptID    $97,$6C		  ; Run	text script at offset 0x027924
						  ; 0xE097: PRINT MSG 0x00E4, MSGBOX CLEARED, END: "{5B}Bye!  See you again.{5E}"
		ScriptJump  ShopPrice_03,$6D	  ; Jump to address 0x025E3A
		ScriptJump  Shop_03,$6E		  ; Jump to address 0x025E40
		ScriptID    $98,$6F		  ; Run	text script at offset 0x027926
						  ; 0xE098: PRINT MSG 0x00E5, MSGBOX CLEARED, END: "{5B}Hey!  What are you doing?{57}Did your parents teach you{57}to be a thief?{5E}"
		dc.w $02E0			  ; Destel Church
		dc.b $10			  ; Items/services normal price
		dc.b $10			  ; Lifestock normal price
		ScriptID    $C,$72		  ; Run	text script at offset 0x02780E
						  ; 0xE00C: PRINT MSG 0x0059, MSGBOX CLEARED, END: "{5B}Welcome	to our church.{5E}"
		ScriptID    $D,$73		  ; Run	text script at offset 0x027810
						  ; 0xE00D: PRINT MSG 0x005A, MSGBOX CLEARED, END: "{5B}Be careful.{57}May the goddess bless you!{5E}"
		ScriptJump  CS_NULL,$74		  ; Jump to address 0x027220
		ScriptJump  CS_NULL,$75		  ; Jump to address 0x027220
		ScriptID    $E,$76		  ; Run	text script at offset 0x027812
						  ; 0xE00E: PRINT MSG 0x005B, MSGBOX CLEARED, END: "{5B}Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		dc.w $02D9			  ; Destel Inn
		dc.b $10			  ; Items/services normal price
		dc.b $10			  ; Lifestock normal price
		ScriptID    $99,$79		  ; Run	text script at offset 0x027928
						  ; 0xE099: PRINT MSG 0x00E6, MSGBOX CLEARED, END: "{5B}You're welcome to{57}stay so long as you don't{57}behave violently.{5E}"
		ScriptID    $53,$7A		  ; Run	text script at offset 0x02789C
						  ; 0xE053: PRINT MSG 0x00A0, MSGBOX CLEARED, END: "{5B}Are you	leaving?{57}Good luck!{5E}"
		ScriptJump  ShopPrice_04,$7B	  ; Jump to address 0x025E4C
		ScriptJump  Shop_04,$7C		  ; Jump to address 0x025E52
		ScriptID    $59,$7D		  ; Run	text script at offset 0x0278A8
						  ; 0xE059: PRINT MSG 0x00A6, MSGBOX CLEARED, END: "{5B}Hey!{57}You have to pay	for that!!{5E}"
		dc.w $02EB			  ; Kazalt Shop
		dc.b $10			  ; Items/services normal price
		dc.b $40			  ; Lifestock 4x normal	price
		ScriptID    $9A,$80		  ; Run	text script at offset 0x02792A
						  ; 0x809A: PRINT MSG 0x00E7: "{5B}Who's this coming{57}to my Underground Shop?{62}"
						  ; 0xE09B: PRINT MSG 0x00E8, MSGBOX CLEARED, END: "{5B}I haven't had a{57}customer in ages!{5E}"
		ScriptID    $9C,$81		  ; Run	text script at offset 0x02792E
						  ; 0xE09C: PRINT MSG 0x00E9, MSGBOX CLEARED, END: "{5B}Do come	again.{57}You're the only customer{57}I've had in 200 years!{5E}"
		ScriptJump  ShopPrice_01,$82	  ; Jump to address 0x025E16
		ScriptJump  Shop_01,$83		  ; Jump to address 0x025E1C
		ScriptID    $9D,$84		  ; Run	text script at offset 0x027930
						  ; 0xE09D: PRINT MSG 0x00EA, MSGBOX CLEARED, END: "{5B}Scoundrel!{57}In 200 years, I have never{57}seen such rudeness!{5E}"
		dc.w $02ED			  ; Kazalt Church
		dc.b $10			  ; Items/services normal price
		dc.b $10			  ; Lifestock normal price
		ScriptID    $C,$87		  ; Run	text script at offset 0x02780E
						  ; 0xE00C: PRINT MSG 0x0059, MSGBOX CLEARED, END: "{5B}Welcome	to our church.{5E}"
		ScriptID    $D,$88		  ; Run	text script at offset 0x027810
						  ; 0xE00D: PRINT MSG 0x005A, MSGBOX CLEARED, END: "{5B}Be careful.{57}May the goddess bless you!{5E}"
		ScriptJump  CS_NULL,$89		  ; Jump to address 0x027220
		ScriptJump  CS_NULL,$8A		  ; Jump to address 0x027220
		ScriptID    $E,$8B		  ; Run	text script at offset 0x027812
						  ; 0xE00E: PRINT MSG 0x005B, MSGBOX CLEARED, END: "{5B}Stop!{57}That belongs to the goddess.{57}Deuce take you!{5E}"
		dc.w $02E9			  ; Kazalt Inn
		dc.b $10			  ; Items/services normal price
		dc.b $10			  ; Lifestock normal price
		ScriptID    $9E,$8E		  ; Run	text script at offset 0x027932
						  ; 0xE09E: PRINT MSG 0x00EB, MSGBOX CLEARED, END: "{5B}May I help you?{57}Would you like to stay?{57}Our beds are all ready.{5E}"
		ScriptID    $A,$8F		  ; Run	text script at offset 0x02780A
						  ; 0xE00A: PRINT MSG 0x0057, MSGBOX CLEARED, END: "{5B}Take it	easy!{5E}"
		ScriptJump  CS_NULL,$90		  ; Jump to address 0x027220
		ScriptJump  CS_NULL,$91		  ; Jump to address 0x027220
		ScriptID    $9F,$92		  ; Run	text script at offset 0x027934
						  ; 0xE09F: PRINT MSG 0x00EC, MSGBOX CLEARED, END: "{5B}Say!  That's ours!{57}Stop right there!{5E}"
		dc.w $0307			  ; Mir's Tower - Save Room
		dc.b $10			  ; Items/services normal price
		dc.b $10			  ; Lifestock normal price
		ScriptJump  CS_NULL,$95		  ; Jump to address 0x027220
		ScriptJump  CS_NULL,$96		  ; Jump to address 0x027220
		ScriptJump  CS_NULL,$97		  ; Jump to address 0x027220
		ScriptJump  CS_NULL,$98		  ; Jump to address 0x027220
		ScriptID    $A1,$99		  ; Run	text script at offset 0x027938
						  ; 0xE0A1: PRINT MSG 0x00EE, MSGBOX CLEARED, END: "{5B}Noooo....{57}Don't take it awaaaaaaay......{5E}"
		dc.w $0029			  ; Mercator castle dungeon - removed save room
		dc.b $10			  ; Items/Livestock normal price
		dc.b $10			  ; Lifestock normal price
		ScriptID    $AA,$9C		  ; Run	text script at offset 0x02794A
						  ; 0xE0AA: PRINT MSG 0x00F7, MSGBOX CLEARED, END: "{5B}Oh, a guessssst......{57}to my grave....{5E}"
		ScriptID    $AB,$9D		  ; Run	text script at offset 0x02794C
						  ; 0xE0AB: PRINT MSG 0x00F8, MSGBOX CLEARED, END: "{5B}I'll be.....waiting........{5E}"
		ScriptJump  CS_NULL,$9E		  ; Jump to address 0x027220
		ScriptJump  CS_NULL,$9F		  ; Jump to address 0x027220
		ScriptID    $A1,$A0		  ; Run	text script at offset 0x027938
						  ; 0xE0A1: PRINT MSG 0x00EE, MSGBOX CLEARED, END: "{5B}Noooo....{57}Don't take it awaaaaaaay......{5E}"
		dc.w $0294			  ; Mercator Wholesaler
		dc.b $10			  ; Items/services normal price
		dc.b $10			  ; Lifestock normal price
		ScriptID    $943,$A3		  ; Run	text script at offset 0x028A7C
						  ; 0xE74D: PRINT MSG 0x079A, MSGBOX CLEARED, END: "{5B}Specially selected{57}goods are	waiting	for you!{57}Just for you!{5E}"
		ScriptJump  ShopLeave_08,$A4	  ; Jump to address 0x025146
		ScriptJump  ShopPrice_08,$A5	  ; Jump to address 0x025160
		ScriptJump  Shop_08,$A6		  ; Jump to address 0x025178
		ScriptID    $94A,$A7		  ; Run	text script at offset 0x028A8A
						  ; 0xE754: PRINT MSG 0x07A1, MSGBOX CLEARED, END: "{5B}No kidding!{5E}"
		dc.w $0205			  ; Kelketo waterfall shop
		dc.b $10			  ; Items/services normal price
		dc.b $10			  ; Lifestock normal price
		ScriptID    $AC,$AA		  ; Run	text script at offset 0x02794E
						  ; 0xE0AC: PRINT MSG 0x00F9, MSGBOX CLEARED, END: "{5B}Welcome	to{57}Kelketo Waterfall	Item Shop!{5E}"
		ScriptID    $AD,$AB		  ; Run	text script at offset 0x027950
						  ; 0xE0AD: PRINT MSG 0x00FA, MSGBOX CLEARED, END: "{5B}Kelketo	Falls is{57}great for sightseeing.{57}Please come again!{5E}"
		ScriptJump  ShopPrice_04,$AC	  ; Jump to address 0x025E4C
		ScriptJump  Shop_04,$AD		  ; Jump to address 0x025E52
		ScriptID    $AE,$AE		  ; Run	text script at offset 0x027952
						  ; 0xE0AE: PRINT MSG 0x00FB, MSGBOX CLEARED, END: "{5B}Wha--!	Are you	a thief?{5E}"
		dc.w $020E			  ; Greedly's shop
		dc.b $13			  ; Items/services 19/16x normal price
		dc.b $30			  ; Lifestock 3x normal	price
		ScriptID    $AF,$B1		  ; Run	text script at offset 0x027954
						  ; 0xE0AF: PRINT MSG 0x00FC, MSGBOX CLEARED, END: "{5B}Kindly's brother?{57}That's me!  Welcome to{57}Greedly's Item Shop!{5E}"
		ScriptID    $97,$B2		  ; Run	text script at offset 0x027924
						  ; 0xE097: PRINT MSG 0x00E4, MSGBOX CLEARED, END: "{5B}Bye!  See you again.{5E}"
		ScriptJump  ShopPrice_03,$B3	  ; Jump to address 0x025E3A
		ScriptJump  Shop_03,$B4		  ; Jump to address 0x025E40
		ScriptID    $98,$B5		  ; Run	text script at offset 0x027926
						  ; 0xE098: PRINT MSG 0x00E5, MSGBOX CLEARED, END: "{5B}Hey!  What are you doing?{57}Did your parents teach you{57}to be a thief?{5E}"
		dc.w $0131			  ; Lake Shrine	save room
		dc.b $10			  ; Items/services normal price
		dc.b $10			  ; Lifestock normal price
		ScriptID    $AA,$B8		  ; Run	text script at offset 0x02794A
						  ; 0xE0AA: PRINT MSG 0x00F7, MSGBOX CLEARED, END: "{5B}Oh, a guessssst......{57}to my grave....{5E}"
		ScriptID    $AB,$B9		  ; Run	text script at offset 0x02794C
						  ; 0xE0AB: PRINT MSG 0x00F8, MSGBOX CLEARED, END: "{5B}I'll be.....waiting........{5E}"
		ScriptJump  CS_NULL,$BA		  ; Jump to address 0x027220
		ScriptJump  CS_NULL,$BB		  ; Jump to address 0x027220
		ScriptID    $A1,$BC		  ; Run	text script at offset 0x027938
						  ; 0xE0A1: PRINT MSG 0x00EE, MSGBOX CLEARED, END: "{5B}Noooo....{57}Don't take it awaaaaaaay......{5E}"
		dc.w $0188			  ; Labrynth save room
		dc.b $10			  ; Items/services normal price
		dc.b $10			  ; Lifestock normal price
		ScriptJump  CS_NULL,$BF		  ; Jump to address 0x027220
		ScriptJump  CS_NULL,$C0		  ; Jump to address 0x027220
		ScriptJump  CS_NULL,$C1		  ; Jump to address 0x027220
		ScriptJump  CS_NULL,$C2		  ; Jump to address 0x027220
		ScriptID    $A1,$C3		  ; Run	text script at offset 0x027938
						  ; 0xE0A1: PRINT MSG 0x00EE, MSGBOX CLEARED, END: "{5B}Noooo....{57}Don't take it awaaaaaaay......{5E}"
		dc.w $FFFF
