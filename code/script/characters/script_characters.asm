; ---------------------------------------------------------------------------

CS_0143:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $102,$0		  ; Prompt:	  Run text script at offset 0x0279FA
						  ; 0x1834: LOAD CHARACTER SCRIPT Mir (0x0034)
						  ; 0xA0F1: PRINT MSG 0x013E, END: "{5B}Go back	now, and you'll{57}be given something good, OK?{58}"
		ScriptID    $104,$1		  ; Answer 'yes': Run text script at offset 0x0279FE
						  ; 0x75C7: SET	BIT 7 OF FLAG 0x038, MSGBOX CLEARED, END
		ScriptJump  ClearTextbox_0,$2	  ; Answer 'no':  Jump to address 0x028FB8
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0000:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0000			  ; Params 00, 00
		ScriptID    $10E,$1		  ; Run	text script at offset 0x027A12
						  ; 0xE0FB: PRINT MSG 0x0148, MSGBOX CLEARED, END: "{5B}The treasures of King Nole?{57}Oh, yeah!  I...{59}er...{59}{57}have no idea!{5E}"
						  ;
		dc.w $0001			  ; Params 00, 01
		ScriptID    $10F,$3		  ; Run	text script at offset 0x027A14
						  ; 0xE0FC: PRINT MSG 0x0149, MSGBOX CLEARED, END: "{5B}The bridge has been smashed!{57}The youngsters are planning{57}to make a raid on Gumi.{5E}"
						  ;
		dc.w $0002			  ; Params 00, 02
		ScriptID    $110,$5		  ; Run	text script at offset 0x027A16
						  ; 0xE0FD: PRINT MSG 0x014A, MSGBOX CLEARED, END: "{5B}...oh, please....{57}please save my Fara!.....{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $111,$7		  ; Run	text script at offset 0x027A18
						  ; 0x1422: SET	BIT 2 OF FLAG 0x004
						  ; 0x80FE: PRINT MSG 0x014B: "{5B}Nigel!{57}I humbly thank you...{57}Thanks for everything!{62}"
						  ; 0x80FF: PRINT MSG 0x014C: "{5B}Like	the saying goes,{57}"sparkles are the best way to{57}express one's gratitude."{62}"
						  ; 0x8100: PRINT MSG 0x014D: "{5B}The people of Massan{57}are extremely thankful.{57}Please take this jewel, Nigel!{62}"
						  ; 0x0028: LOAD 0x0028	INTO 0xFF1196 (Red Jewel)
						  ; 0x17E8: RECEIVE ITEM [0xFF1196]
						  ; 0x1800: LOAD CHARACTER SCRIPT Mayor	(0x0000)
						  ; 0xE101: PRINT MSG 0x014E, MSGBOX CLEARED, END: "{5B}Don't forget about us.{5E}"
						  ;
		dc.w $0005			  ; Params 00, 05
		ScriptID    $118,$9		  ; Run	text script at offset 0x027A26
						  ; 0xE101: PRINT MSG 0x014E, MSGBOX CLEARED, END: "{5B}Don't forget about us.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0001:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0000			  ; Params 00, 00
		ScriptID    $119,$1		  ; Run	text script at offset 0x027A28
						  ; 0xE102: PRINT MSG 0x014F, MSGBOX CLEARED, END: "{5B}Are you	OK?  Take care!{5E}"
						  ;
		dc.w $0001			  ; Params 00, 01
		ScriptID    $11A,$3		  ; Run	text script at offset 0x027A2A
						  ; 0xE103: PRINT MSG 0x0150, MSGBOX CLEARED, END: "{5B}There is a rumor that{57}Gumi is possessed{57}by an evil spirit.{5E}"
						  ;
		dc.w $0002			  ; Params 00, 02
		ScriptID    $11B,$5		  ; Run	text script at offset 0x027A2C
						  ; 0xE104: PRINT MSG 0x0151, MSGBOX CLEARED, END: "{5B}I'm all right.{57}Get those monsters first!!{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $11C,$7		  ; Run	text script at offset 0x027A2E
						  ; 0x8105: PRINT MSG 0x0152: "{5B}Oh, Nigel...sigh...{57}You looked so	brave{57}fighting the Orc Kings...{62}"
						  ; 0xE106: PRINT MSG 0x0153, MSGBOX CLEARED, END: "{5B}If only	my father's{57}red jewel were our dowry!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0000			  ; Params 00, 00
		ScriptID    $11E,$1		  ; Run	text script at offset 0x027A32
						  ; 0xE107: PRINT MSG 0x0154, MSGBOX CLEARED, END: "{5B}Somebody's gotta put{57}those Gumi savages in their{57}place!  If only I were younger....{5E}"
						  ;
		dc.w $0002			  ; Params 00, 02
		ScriptID    $11F,$3		  ; Run	text script at offset 0x027A34
						  ; 0xE108: PRINT MSG 0x0155, MSGBOX CLEARED, END: "{5B}That's it!  That's the last{57}straw!!  I'll do it!!{5E}"
						  ;
		dc.w $0003			  ; Params 00, 03
		ScriptID    $120,$5		  ; Run	text script at offset 0x027A36
						  ; 0x8109: PRINT MSG 0x0156: "{5B}They	took Fara{57}into the shrine.{57}We tried to go	in, but....{62}"
						  ; 0xE10A: PRINT MSG 0x0157, MSGBOX CLEARED, END: "{5B}the door wouldn't open.{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $122,$7		  ; Run	text script at offset 0x027A3A
						  ; 0xE10B: PRINT MSG 0x0158, MSGBOX CLEARED, END: "{5B}I can see now that I was{57}wrong....the tribesmen of{57}Gumi are our brothers.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0000			  ; Params 00, 00
		ScriptID    $123,$1		  ; Run	text script at offset 0x027A3C
						  ; 0xE10C: PRINT MSG 0x0159, MSGBOX CLEARED, END: "{5B}Be careful what	you say....{57}my husband is enraged!{5E}"
						  ;
		dc.w $0002			  ; Params 00, 02
		ScriptID    $124,$3		  ; Run	text script at offset 0x027A3E
						  ; 0x810D: PRINT MSG 0x015A: "{5B}My husband and son{57}stormed out of	the room....{62}"
						  ; 0xE10E: PRINT MSG 0x015B, MSGBOX CLEARED, END: "{5B}I'm so worried!{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $126,$5		  ; Run	text script at offset 0x027A42
						  ; 0x810F: PRINT MSG 0x015C: "{5B}Thank you, Nigel.{57}Now that Massan	and Gumi{57}are	friends	once more,{62}"
						  ; 0xE110: PRINT MSG 0x015D, MSGBOX CLEARED, END: "{5B}peace and harmony will be{57}restored to our village!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0002:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0000			  ; Params 00, 00
		ScriptJump  loc_26006,$1	  ; Jump to address 0x026006
						  ;
		dc.w $0002			  ; Params 00, 02
		ScriptID    $12D,$3		  ; Run	text script at offset 0x027A50
						  ; 0xE116: PRINT MSG 0x0163, MSGBOX CLEARED, END: "{5B}I may be just a	kid,{57}but I'm courageous enough{57}to go and beat them!{5E}"
						  ;
		dc.w $0003			  ; Params 00, 03
		ScriptID    $12E,$5		  ; Run	text script at offset 0x027A52
						  ; 0xE117: PRINT MSG 0x0164, MSGBOX CLEARED, END: "{5B}....sob!...sob!....{57}I'm so scared...!  Papa{57}followed them to the shrine...{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $12F,$7		  ; Run	text script at offset 0x027A54
						  ; 0xE118: PRINT MSG 0x0165, MSGBOX CLEARED, END: "{5B}Doesn't Mom look happy, now?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26006:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $128,$0		  ; Prompt:	  Run text script at offset 0x027A46
						  ; 0xA111: PRINT MSG 0x015E, END: "{5B}Have you met anyone who{57}looks different from	us?{58}"
		ScriptID    $129,$1		  ; Answer 'yes': Run text script at offset 0x027A48
						  ; 0xE112: PRINT MSG 0x015F, MSGBOX CLEARED, END: "{5B}Oh, yeah?{5E}"
		ScriptID    $12A,$2		  ; Answer 'no':  Run text script at offset 0x027A4A
						  ; 0x8113: PRINT MSG 0x0160: "{5B}Well, be warned!{62}"
						  ; 0x8114: PRINT MSG 0x0161: "{5B}They're Gumi tribesmen,{57}and they don't like us{57}in Massan.{62}"
						  ; 0xE115: PRINT MSG 0x0162, MSGBOX CLEARED, END: "{5B}Don't go south...you'll{57}get a raw deal!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_007D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0000			  ; Params 00, 00
		ScriptID    $130,$1		  ; Run	text script at offset 0x027A56
						  ; 0x17EA: PLAY MUSIC TRACK 36
						  ; 0x8119: PRINT MSG 0x0166: "{5B}"Plant the seeds and{57}watch them GROW!{62}"
						  ; 0x811A: PRINT MSG 0x0167: "{5B}Soon	you'll reap what{57}you have SOWN!{62}"
						  ; 0x811B: PRINT MSG 0x0168: "{5B}Take	the crops to{57}town one DAY!{62}"
						  ; 0x811C: PRINT MSG 0x0169: "{5B}You'll be rich, and{57}then you'll SAY!..."{57}This is the FARMER'S SONG.{62}"
						  ; 0xE11D: PRINT MSG 0x016A, MSGBOX CLEARED, END: "{5B}My crop	sales will boom{57}when	I sing it at the market{57}in Mercator.{5E}"
						  ;
		dc.w $0002			  ; Params 00, 02
		ScriptID    $136,$3		  ; Run	text script at offset 0x027A62
						  ; 0xE11E: PRINT MSG 0x016B, MSGBOX CLEARED, END: "{5B}We're elaborating a{57}plan, now.  Don't disturb us!{5E}"
						  ;
		dc.w $0003			  ; Params 00, 03
		ScriptID    $137,$5		  ; Run	text script at offset 0x027A64
						  ; 0xE11F: PRINT MSG 0x016C, MSGBOX CLEARED, END: "{5B}They used something strange{57}to open that door...{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $138,$7		  ; Run	text script at offset 0x027A66
						  ; 0x17EA: PLAY MUSIC TRACK 36
						  ; 0x8120: PRINT MSG 0x016D: "{5B}Listen, Nigel!  I wrote a{57}new song.  It's called{57}THREE GUYS FROM MASSAN:{62}"
						  ; 0xE121: PRINT MSG 0x016E, MSGBOX CLEARED, END: "{5B}"Three guys bravely go,	go,{57}GO!  Three guys boldly.....{57}nice song, huh?{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $13B,$9		  ; Run	text script at offset 0x027A6C
						  ; 0x17EA: PLAY MUSIC TRACK 36
						  ; 0x8122: PRINT MSG 0x016F: "{5B}Ba-pa-da-da,	dee-da{57}GROW!	 Soon you'll reap{57}ba-dee-da-DO!{62}"
						  ; 0x8123: PRINT MSG 0x0170: "{5B}Oh!	It's you, Nigel!{62}"
						  ; 0x0400: LOAD 0x0000	INTO 0xFF1198 (EkeEke)
						  ; 0xE124: PRINT MSG 0x0171, MSGBOX CLEARED, END: "{5B}Thanks for your	help the other{57}day.	Why don't you buy{57}{5F} directly from the farm!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0000			  ; Params 00, 00
		ScriptID    $140,$1		  ; Run	text script at offset 0x027A76
						  ; 0x8125: PRINT MSG 0x0172: "{5B}I heard it through the{57}EkeEke vine that Gumi warriors{57}are often seen around the{62}"
						  ; 0xE126: PRINT MSG 0x0173, MSGBOX CLEARED, END: "{5B}bridge these days...at least,{57}that's what they say.....{5E}"
						  ;
		dc.w $0002			  ; Params 00, 02
		ScriptID    $142,$3		  ; Run	text script at offset 0x027A7A
						  ; 0xE127: PRINT MSG 0x0174, MSGBOX CLEARED, END: "{5B}He...he	rushed out of here{57}with the guy next	door.{57}He was	really enraged!!{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $143,$5		  ; Run	text script at offset 0x027A7C
						  ; 0xE128: PRINT MSG 0x0175, MSGBOX CLEARED, END: "{5B}Hi, Nigel and Friday!{57}How have you been?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0000			  ; Params 00, 00
		ScriptID    $144,$1		  ; Run	text script at offset 0x027A7E
						  ; 0x8129: PRINT MSG 0x0176: "{5B}I've lived here since I was a{57}child...Massan and Gumi were{57}very good friends long ago.{62}"
						  ; 0x812A: PRINT MSG 0x0177: "{5B}What	started	the feud?{57}Nobody really...{59}I know!{62}"
						  ; 0xE12B: PRINT MSG 0x0178, MSGBOX CLEARED, END: "{5B}Go see the Old Man{57}at the Waterfall Shrine.{57}Maybe	he can tell you!{5E}"
						  ;
		dc.w $0001			  ; Params 00, 01
		ScriptID    $147,$3		  ; Run	text script at offset 0x027A84
						  ; 0xE12C: PRINT MSG 0x0179, MSGBOX CLEARED, END: "{5B}It must	be an evil curse!{57}Evil haunts us all...{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $148,$5		  ; Run	text script at offset 0x027A86
						  ; 0xE12D: PRINT MSG 0x017A, MSGBOX CLEARED, END: "{5B}At last, Massan	and Gumi{57}will attain	their former{57}greatness as sister villages!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0080:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0000			  ; Params 00, 00
		ScriptID    $149,$1		  ; Run	text script at offset 0x027A88
						  ; 0x812E: PRINT MSG 0x017B: "{5B}You must go see the{57}Waterfall Shrine Sage.{62}"
						  ; 0xE12F: PRINT MSG 0x017C, MSGBOX CLEARED, END: "{5B}Careful, though...he's{57}eccentric!{5E}"
						  ;
		dc.w $0001			  ; Params 00, 01
		ScriptID    $14B,$3		  ; Run	text script at offset 0x027A8C
						  ; 0xE130: PRINT MSG 0x017D, MSGBOX CLEARED, END: "{5B}Brrrrr...{59}...{59}scary!{5E}"
						  ;
		dc.w $0002			  ; Params 00, 02
		ScriptID    $14C,$5		  ; Run	text script at offset 0x027A8E
						  ; 0xE131: PRINT MSG 0x017E, MSGBOX CLEARED, END: "{5B}Sob!.....sob!...{57}Is Fara c-coming back?....{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $14D,$7		  ; Run	text script at offset 0x027A90
						  ; 0xE132: PRINT MSG 0x017F, MSGBOX CLEARED, END: "{5B}You did	it!  Do	you know{57}the	saying "DON'T JUDGE A{57}DAHL BY ITS COLOR"?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0003:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0000			  ; Params 00, 00
		ScriptJump  loc_26084,$1	  ; Jump to address 0x026084
						  ;
		dc.w $0003			  ; Params 00, 03
		ScriptJump  loc_26090,$3	  ; Jump to address 0x026090
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $15B,$5		  ; Run	text script at offset 0x027AAC
						  ; 0xE140: PRINT MSG 0x018D, MSGBOX CLEARED, END: "{5B}We have	to move	this{57}debris to get to Mercator.{5E}"
						  ;
		dc.w $0007			  ; Params 00, 07
		ScriptJump  loc_2609C,$7	  ; Jump to address 0x02609C
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $160,$9		  ; Run	text script at offset 0x027AB6
						  ; 0xE145: PRINT MSG 0x0192, MSGBOX CLEARED, END: "{5B}What a coincidence!{57}How are things going?{57}Me?  Hmmm...so-so!{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $161,$B		  ; Run	text script at offset 0x027AB8
						  ; 0x8146: PRINT MSG 0x0193: "{5B}Hey,	young man!{57}It's me!{62}"
						  ; 0x8147: PRINT MSG 0x0194: "{5B}Oh, woe is me!{57}I was caught in a strange{57}trap,	and...here I am.{62}"
						  ; 0x8148: PRINT MSG 0x0195: "{5B}Well, I've been put in{57}many a jail in my time,{57}but never one that{62}"
						  ; 0xE149: PRINT MSG 0x0196, MSGBOX CLEARED, END: "{5B}stank like this!{57}I can't stand it!!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26084:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $14E,$0		  ; Prompt:	  Run text script at offset 0x027A92
						  ; 0x8133: PRINT MSG 0x0180: "{5B}You're a treasure hunter,{57}aren'tcha?{62}"
						  ; 0x8134: PRINT MSG 0x0181: "{5B}Ha, don't even{57}try to hide it!{57}I sensed it at once!{62}"
						  ; 0xA135: PRINT MSG 0x0182, END: "{5B}Have you met the sage{57}at the	Waterfall Shrine?{58}"
		ScriptID    $151,$1		  ; Answer 'yes': Run text script at offset 0x027A98
						  ; 0xE136: PRINT MSG 0x0183, MSGBOX CLEARED, END: "{5B}Oh, really?  Huh!{57}So	you're a thief AND a liar!{5E}"
		ScriptID    $152,$2		  ; Answer 'no':  Run text script at offset 0x027A9A
						  ; 0xE137: PRINT MSG 0x0184, MSGBOX CLEARED, END: "{5B}Ha, ha,	ha!{57}You need	more experience, kid!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_26090:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00C1			  ; Bit	1 of flag 0x018
		ScriptID    $153,$1		  ; Flag clear:	Run text script	at offset 0x027A9C
						  ; 0x8138: PRINT MSG 0x0185: "{5B}Good	heavens!  Nice to{57}meet you again, young boy!{62}"
						  ; 0x8139: PRINT MSG 0x0186: "{5B}Oh, the landslide?{57}Yes, well...we	seem to	have{57}run out	of luck!{62}"
						  ; 0x813A: PRINT MSG 0x0187: "{5B}The village was empty, so{57}I searched for some valuables,{57}but there was	nothing	to take.{62}"
						  ; 0x813B: PRINT MSG 0x0188: "{5B}All I found was{57}some old statue at the{57}mayor's house.{62}"
						  ; 0x813C: PRINT MSG 0x0189: "{5B}There were also some{57}golds lying around,{57}but of course	I didn't{62}"
						  ; 0xE13D: PRINT MSG 0x018A, MSGBOX CLEARED, END: "{5B}touch them...{59}...{59}NOT!!!{5E}"
		ScriptID    $159,$2		  ; Flag set:	Run text script	at offset 0x027AA8
						  ; 0x813E: PRINT MSG 0x018B: "{5B}You can't blame me,{57}can you?{62}"
						  ; 0xE13F: PRINT MSG 0x018C, MSGBOX CLEARED, END: "{5B}I know you're the same.{57}You're a thief, too. Ha, ha!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_2609C:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00DA			  ; Bit	2 of flag 0x01B
		ScriptID    $15C,$1		  ; Flag clear:	Run text script	at offset 0x027AAE
						  ; 0x8141: PRINT MSG 0x018E: "{5B}You again!{62}"
						  ; 0x8142: PRINT MSG 0x018F: "{5B}Me?	Ah, I came here{57}in search of	the treasures,{57}but grew sleepy....{62}"
						  ; 0x8143: PRINT MSG 0x0190: "{5B}They	say the	trees{57}can be	a treasure hunter's{57}best friend...{62}"
						  ; 0xE144: PRINT MSG 0x0191, MSGBOX CLEARED, END: "{5B}I wonder{57}what that means?.....{5E}"
		ScriptID    $15E,$2		  ; Flag set:	Run text script	at offset 0x027AB2
						  ; 0x8143: PRINT MSG 0x0190: "{5B}They	say the	trees{57}can be	a treasure hunter's{57}best friend...{62}"
						  ; 0xE144: PRINT MSG 0x0191, MSGBOX CLEARED, END: "{5B}I wonder{57}what that means?.....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0081:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0000			  ; Params 00, 00
		ScriptID    $165,$1		  ; Run	text script at offset 0x027AC0
						  ; 0xE14A: PRINT MSG 0x0197, MSGBOX CLEARED, END: "{5B}We have	many suspicious{57}guests these	days...oh!{57}You ARE a	guest here!{5E}"
						  ;
		dc.w $0002			  ; Params 00, 02
		ScriptID    $166,$3		  ; Run	text script at offset 0x027AC2
						  ; 0xE14B: PRINT MSG 0x0198, MSGBOX CLEARED, END: "{5B}That strange man flew off{57}like the wind.....{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $167,$5		  ; Run	text script at offset 0x027AC4
						  ; 0xE14C: PRINT MSG 0x0199, MSGBOX CLEARED, END: "{5B}You're that hero-boy,{57}aren't you?  Well, any friend{57}of Fara's.....{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0082:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0000			  ; Params 00, 00
		ScriptJump  loc_260D0,$1	  ; Jump to address 0x0260D0
						  ;
		dc.w $0002			  ; Params 00, 02
		ScriptID    $16A,$3		  ; Run	text script at offset 0x027ACA
						  ; 0xE14E: PRINT MSG 0x019B, MSGBOX CLEARED, END: "{5B}Nigel!	Friday!	 Fara needs{57}our help....but I'm{57}too scared to move!!{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $16B,$5		  ; Run	text script at offset 0x027ACC
						  ; 0xE14F: PRINT MSG 0x019C, MSGBOX CLEARED, END: "{5B}Friday!	 Am I ever glad{57}to see you!{5E}"
						  ;
		dc.w $0005			  ; Params 00, 05
		ScriptID    $16C,$7		  ; Run	text script at offset 0x027ACE
						  ; 0xE150: PRINT MSG 0x019D, MSGBOX CLEARED, END: "{5B}I look forward to{57}seeing you	again, Friday{57}Oh, and you, too, Nigel...{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_260D0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00C0			  ; Bit	0 of flag 0x018
		ScriptID    $168,$1		  ; Flag clear:	Run text script	at offset 0x027AC6
						  ; 0x7C10: LOAD CUSTOM	ACTION 0x10 (0x01213C CSA_0010), MSGBOX	CLEARED, END
		ScriptID    $169,$2		  ; Flag set:	Run text script	at offset 0x027AC8
						  ; 0xE14D: PRINT MSG 0x019A, MSGBOX CLEARED, END: "{5B}Is...is	Miss Friday all	right?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0083:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0000			  ; Params 00, 00
		ScriptID    $16D,$1		  ; Run	text script at offset 0x027AD0
						  ; 0x8151: PRINT MSG 0x019E: "{5B}On the west side of Gumi,{57}the road branches off into{57}two paths	at the sea.{62}"
						  ; 0x8152: PRINT MSG 0x019F: "{5B}The right path leads	to the{57}big town, Mercator.{62}"
						  ; 0xE153: PRINT MSG 0x01A0, MSGBOX CLEARED, END: "{5B}The left leads to Ryuma,{57}which is famous for	its{57}lighthouse.{5E}"
						  ;
		dc.w $0002			  ; Params 00, 02
		ScriptID    $170,$3		  ; Run	text script at offset 0x027AD6
						  ; 0xE154: PRINT MSG 0x01A1, MSGBOX CLEARED, END: "{5B}They will sacrifice Fara{57}to their evil gods!{57}Won't you help?{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $16D,$5		  ; Run	text script at offset 0x027AD0
						  ; 0x8151: PRINT MSG 0x019E: "{5B}On the west side of Gumi,{57}the road branches off into{57}two paths	at the sea.{62}"
						  ; 0x8152: PRINT MSG 0x019F: "{5B}The right path leads	to the{57}big town, Mercator.{62}"
						  ; 0xE153: PRINT MSG 0x01A0, MSGBOX CLEARED, END: "{5B}The left leads to Ryuma,{57}which is famous for	its{57}lighthouse.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0084:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0000			  ; Params 00, 00
		ScriptID    $171,$1		  ; Run	text script at offset 0x027AD8
						  ; 0xE155: PRINT MSG 0x01A2, MSGBOX CLEARED, END: "{5B}Gumi is	the village{57}just south of us.  They're{57}an atrocious tribe.{5E}"
						  ;
		dc.w $0002			  ; Params 00, 02
		ScriptID    $172,$3		  ; Run	text script at offset 0x027ADA
						  ; 0xE156: PRINT MSG 0x01A3, MSGBOX CLEARED, END: "{5B}I have to stay here and{57}defend this village.{57}It's my responsibility.{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $173,$5		  ; Run	text script at offset 0x027ADC
						  ; 0xE157: PRINT MSG 0x01A4, MSGBOX CLEARED, END: "{5B}Remember, Nigel...{57}the straightest path has{57}many curves.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0085:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0000			  ; Params 00, 00
		ScriptJump  loc_26112,$1	  ; Jump to address 0x026112
						  ;
		dc.w $0002			  ; Params 00, 02
		ScriptID    $179,$3		  ; Run	text script at offset 0x027AE8
						  ; 0x815D: PRINT MSG 0x01AA: "{5B}Fara	was kidnapped because{57}she's the cutest among us.{57}Oh, my goodness!{62}"
						  ; 0xE15E: PRINT MSG 0x01AB, MSGBOX CLEARED, END: "{5B}That means I'm next!{57}What should I do!{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $17B,$5		  ; Run	text script at offset 0x027AEC
						  ; 0xE15F: PRINT MSG 0x01AC, MSGBOX CLEARED, END: "{5B}I heard	about your exploits!{57}I know,	I know.	 It's all{57}thanks to EkeEke, right?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26112:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $174,$0		  ; Prompt:	  Run text script at offset 0x027ADE
						  ; 0x8158: PRINT MSG 0x01A5: "{5B}Hi!	I can give you a{57}helpful hint about a{57}specialty of this island.{62}"
						  ; 0xA159: PRINT MSG 0x01A6, END: "{5B}Do you know about it?{58}"
		ScriptID    $176,$1		  ; Answer 'yes': Run text script at offset 0x027AE2
						  ; 0xE15A: PRINT MSG 0x01A7, MSGBOX CLEARED, END: "{5B}You do?	 Oh.{5E}"
		ScriptID    $177,$2		  ; Answer 'no':  Run text script at offset 0x027AE4
						  ; 0x815B: PRINT MSG 0x01A8: "{5B}It's a restorative called{57}EkeEke.  It contains a megadose{57}of the Ekenol vitamin.{62}"
						  ; 0xE15C: PRINT MSG 0x01A9, MSGBOX CLEARED, END: "{5B}You can	buy it anywhere.{57}Got	it?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0004:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0000			  ; Params 00, 00
		ScriptID    $17C,$1		  ; Run	text script at offset 0x027AEE
						  ; 0xE160: PRINT MSG 0x01AD, MSGBOX CLEARED, END: "{5B}Arf, arf!{5E}"
						  ;
		dc.w $0201			  ; Params 02, 01
		ScriptID    $17D,$3		  ; Run	text script at offset 0x027AF0
						  ; 0x153C: SET	BIT 4 OF FLAG 0x027
						  ; 0x8161: PRINT MSG 0x01AE: "{5B}Oh!	You can	understand me?{57}I'm a girl, or...well,{57}at least I was until{62}"
						  ; 0x8162: PRINT MSG 0x01AF: "{5B}Helga, a witch in the{57}woods east of Mercator,{57}changed me into a dog.{62}"
						  ; 0x8163: PRINT MSG 0x01B0: "{5B}Marty, my sweetheart, is{57}also under her spell.  She's{57}made him into her pet!{62}"
						  ; 0x8164: PRINT MSG 0x01B1: "{5B}Oh, how my heart longs to{57}see him...sigh.....but I{57}can't.  Helga told us{62}"
						  ; 0x8165: PRINT MSG 0x01B2: "{5B}we can never	return to our{57}human forms if	we meet{57}each	other in these figures...{62}"
						  ; 0xE166: PRINT MSG 0x01B3, MSGBOX CLEARED, END: "{5B}The curse on us	will never{57}be lifted	unless Helga{57}dies....howoooo!....{5E}"
						  ;
		dc.w $0203			  ; Params 02, 03
		ScriptJump  loc_26130,$5	  ; Jump to address 0x026130
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26130:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00E2			  ; Bit	2 of flag 0x01C
		ScriptID    $184,$1		  ; Flag clear:	Run text script	at offset 0x027AFE
						  ; 0xE167: PRINT MSG 0x01B4, MSGBOX CLEARED, END: "{5B}Thank you, thank you!{57}Marty and I will make this{57}house our home, now.{5E}"
		ScriptID    $185,$2		  ; Flag set:	Run text script	at offset 0x027B00
						  ; 0x8168: PRINT MSG 0x01B5: "{5B}I really....yarf!  Arf arf!{62}"
						  ; 0x8169: PRINT MSG 0x01B6: "{5B}Oh, no!  What's happening?{57}Marty and I are{57}changing back again...{62}"
						  ; 0xE16A: PRINT MSG 0x01B7, MSGBOX CLEARED, END: "{5B}Ha, ha,	ha!  Just kidding!{57}Good luck!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0086:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $188,$0		  ; Run	text script at offset 0x027B06
						  ; 0xE16B: PRINT MSG 0x01B8, MSGBOX CLEARED, END: "{5B}Cock-cock-a-cock{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0087:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $189,$0		  ; Run	text script at offset 0x027B08
						  ; 0xE16C: PRINT MSG 0x01B9, MSGBOX CLEARED, END: "{5B}Cock-co-co-cock{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0005:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $18A,$0		  ; Run	text script at offset 0x027B0A
						  ; 0xE16D: PRINT MSG 0x01BA, MSGBOX CLEARED, END: "{5B}If you see something{57}you want, bring	it to the{57}counter and set it	down.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0006:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $18B,$0		  ; Run	text script at offset 0x027B0C
						  ; 0x816E: PRINT MSG 0x01BB: "{5B}It's my duty to make{57}records and perform healings.{57}What do you want?{62}"
						  ; 0xE16F: PRINT MSG 0x01BC, MSGBOX CLEARED, END: "{5B}Bring any book to me.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0088:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0000			  ; Params 00, 00
		ScriptID    $18D,$1		  ; Run	text script at offset 0x027B10
						  ; 0xE170: PRINT MSG 0x01BD, MSGBOX CLEARED, END: "{5B}Is there really	a goddess?{5E}"
						  ;
		dc.w $0002			  ; Params 00, 02
		ScriptID    $18E,$3		  ; Run	text script at offset 0x027B12
						  ; 0xE171: PRINT MSG 0x01BE, MSGBOX CLEARED, END: "{5B}If there really	is a{57}goddess, why did she let them{57}take Fara?....boo-hoo-hoo!....{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $18F,$5		  ; Run	text script at offset 0x027B14
						  ; 0xE172: PRINT MSG 0x01BF, MSGBOX CLEARED, END: "{5B}Now I know there's a goddess!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0007:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $190,$0		  ; Run	text script at offset 0x027B16
						  ; 0x0425: LOAD 0x0025	INTO 0xFF1198 (Hotel Register)
						  ; 0x0826: LOAD 0x0026	INTO 0xFF119A (Island Map)
						  ; 0xE173: PRINT MSG 0x01C0, MSGBOX CLEARED, END: "{5B}Take the note and{57}put it on the counter{57}if you want to stay.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0089:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0001			  ; Params 00, 01
		ScriptID    $193,$1		  ; Run	text script at offset 0x027B1C
						  ; 0xE174: PRINT MSG 0x01C1, MSGBOX CLEARED, END: "{5B}Ooooo!	I'm so angry!{57}Wait'll the mayor hears{57}about THIS!!{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $194,$3		  ; Run	text script at offset 0x027B1E
						  ; 0xE175: PRINT MSG 0x01C2, MSGBOX CLEARED, END: "{5B}I've never met such a{57}courageous man.{57}I really respect you!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0008:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0001			  ; Params 00, 01
		ScriptID    $195,$1		  ; Run	text script at offset 0x027B20
						  ; 0x1400: SET	BIT 0 OF FLAG 0x000
						  ; 0x7C08: LOAD CUSTOM	ACTION 0x08 (0x01211C CSA_0008), MSGBOX	CLEARED, END
						  ;
		dc.w $0002			  ; Params 00, 02
		ScriptJump  loc_261A8,$3	  ; Jump to address 0x0261A8
						  ;
		dc.w $0003			  ; Params 00, 03
		ScriptID    $198,$5		  ; Run	text script at offset 0x027B26
						  ; 0x8177: PRINT MSG 0x01C4: "{5B}Is it true that Fara{57}has been kidnapped?{57}Unbelievable...{62}"
						  ; 0x8178: PRINT MSG 0x01C5: "{5B}I think the Gumi tribe is{57}controlled by the Orcs!{57}Fara	must be	in danger...{62}"
						  ; 0xE179: PRINT MSG 0x01C6, MSGBOX CLEARED, END: "{5B}Go to the Marsh	Shrine{57}and save Fara.{57}Please hurry, Nigel!{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $19B,$7		  ; Run	text script at offset 0x027B2C
						  ; 0x817A: PRINT MSG 0x01C7: "{5B}Good, good...{57}The	two tribes will	get close{57}to	each other from	now on.{62}"
						  ; 0x817B: PRINT MSG 0x01C8: "{5B}About King Nole...I just{57}found out that he did exist{57}in very ancient times.{62}"
						  ; 0xE17C: PRINT MSG 0x01C9, MSGBOX CLEARED, END: "{5B}That's all I can find{57}in my books.  Hopefully, you can{57}find out more in Mercator.....{5E}"
						  ;
		dc.w $0008			  ; Params 00, 08
		ScriptID    $19E,$9		  ; Run	text script at offset 0x027B32
						  ; 0x817D: PRINT MSG 0x01CA: "{5B}Hmm,	lithograph, eh?...{57}The jewels must belong{57}to King	Nole.{62}"
						  ; 0x817E: PRINT MSG 0x01CB: "{5B}According to	my records,{57}there are five jewels in	all.{57}If the jewels are real.....{62}"
						  ; 0xE17F: PRINT MSG 0x01CC, MSGBOX CLEARED, END: "{5B}Interesting...{57}Come see me again.{5E}"
						  ;
		dc.w $0009			  ; Params 00, 09
		ScriptID    $1A1,$B		  ; Run	text script at offset 0x027B38
						  ; 0xE180: PRINT MSG 0x01CD, MSGBOX CLEARED, END: "{5B}Mercator is a big town.{57}You'll have fun there, but...{57}beware of the duke!!...{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $1A2,$D		  ; Run	text script at offset 0x027B3A
						  ; 0x8181: PRINT MSG 0x01CE: "{5B}What?  You're going off{57}to defeat Lord Mir?  Hmmmm...{57}Well, if you must, but....{62}"
						  ; 0xE182: PRINT MSG 0x01CF, MSGBOX CLEARED, END: "{5B}I still	believe	he's innocent.{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $1A4,$F		  ; Run	text script at offset 0x027B3E
						  ; 0x8183: PRINT MSG 0x01D0: "{5B}Oh, you actually saw{57}Lord	Mir?  Is he all	right?...{57}Great!{62}"
						  ; 0xE184: PRINT MSG 0x01D1, MSGBOX CLEARED, END: "{5B}You can	fully trust him.{57}Believe whatever he	tells you!{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $1A6,$11		  ; Run	text script at offset 0x027B42
						  ; 0x8185: PRINT MSG 0x01D2: "{5B}So, the duke	finally{57}broke his cover...now everyone{57}will know he's looking for the{62}"
						  ; 0x8186: PRINT MSG 0x01D3: "{5B}treasures of	King Nole.{62}"
						  ; 0x8187: PRINT MSG 0x01D4: "{5B}Perhaps your	coming{57}here convinced him there was{57}some truth to	the legends{62}"
						  ; 0xE188: PRINT MSG 0x01D5, MSGBOX CLEARED, END: "{5B}after all.....{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $1AA,$13		  ; Run	text script at offset 0x027B4A
						  ; 0x8189: PRINT MSG 0x01D6: "{5B}He has abandoned{57}the town.{62}"
						  ; 0x818A: PRINT MSG 0x01D7: "{5B}He would do{57}anything to find the{57}legendary treasures.{62}"
						  ; 0x818B: PRINT MSG 0x01D8: "{5B}Nigel!  Don't let him get{57}the treasures!  You must{57}stop his foul ambition!{62}"
						  ; 0xE18C: PRINT MSG 0x01D9, MSGBOX CLEARED, END: "{5B}If the duke finds those{57}treasures.....it'll be the{57}end of the world!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_261A8:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0012			  ; Bit	2 of flag 0x002
		ScriptID    $198,$1		  ; Flag set:	Run text script	at offset 0x027B26
						  ; 0x8177: PRINT MSG 0x01C4: "{5B}Is it true that Fara{57}has been kidnapped?{57}Unbelievable...{62}"
						  ; 0x8178: PRINT MSG 0x01C5: "{5B}I think the Gumi tribe is{57}controlled by the Orcs!{57}Fara	must be	in danger...{62}"
						  ; 0xE179: PRINT MSG 0x01C6, MSGBOX CLEARED, END: "{5B}Go to the Marsh	Shrine{57}and save Fara.{57}Please hurry, Nigel!{5E}"
		ScriptID    $197,$2		  ; Flag clear:	Run text script	at offset 0x027B24
						  ; 0xE176: PRINT MSG 0x01C3, MSGBOX CLEARED, END: "{5B}I'm still studying{57}the old documents.{57}Could you give me more time?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_008B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0002			  ; Params 00, 02
		ScriptID    $1AE,$1		  ; Run	text script at offset 0x027B52
						  ; 0xE18D: PRINT MSG 0x01DA, MSGBOX CLEARED, END: "{5B}Who are	you?{57}Get out	of here, stranger!{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $1AF,$3		  ; Run	text script at offset 0x027B54
						  ; 0xE18E: PRINT MSG 0x01DB, MSGBOX CLEARED, END: "{5B}W-we're sorry.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_008C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0002			  ; Params 00, 02
		ScriptID    $1B0,$1		  ; Run	text script at offset 0x027B56
						  ; 0xE18F: PRINT MSG 0x01DC, MSGBOX CLEARED, END: "{5B}Sorry.{57}Sacred rite.{57}No visitors allowed!{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $1B1,$3		  ; Run	text script at offset 0x027B58
						  ; 0xE190: PRINT MSG 0x01DD, MSGBOX CLEARED, END: "{5B}Welcome	to the{57}village of Gumi.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_008D:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $1B2,$0		  ; Run	text script at offset 0x027B5A
						  ; 0x8191: PRINT MSG 0x01DE: "{5B}Did you know	that we	were{57}controlled by the monsters{57}they call	the Orc	Kings?{62}"
						  ; 0xE192: PRINT MSG 0x01DF, MSGBOX CLEARED, END: "{5B}Actually, I don't remember{57}a thing.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0009:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00C2			  ; Bit	2 of flag 0x018
		ScriptID    $1B4,$1		  ; Flag clear:	Run text script	at offset 0x027B5E
						  ; 0x8193: PRINT MSG 0x01E0: "{5B}I'm ashamed of myself...{57}We let the monsters control{57}us and profane our most{62}"
						  ; 0xE194: PRINT MSG 0x01E1, MSGBOX CLEARED, END: "{5B}sacred shrine.	I want to{57}apologize to Massan, too.{57}Will they ever forgive us?{5E}"
		ScriptID    $1B6,$2		  ; Flag set:	Run text script	at offset 0x027B62
						  ; 0xE195: PRINT MSG 0x01E2, MSGBOX CLEARED, END: "{5B}We're going to cooperate{57}with Massan from now on.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_000A:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $1B7,$0		  ; Run	text script at offset 0x027B64
						  ; 0xE196: PRINT MSG 0x01E3, MSGBOX CLEARED, END: "{5B}Thank you!  Thanks.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_008E:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $1B8,$0		  ; Run	text script at offset 0x027B66
						  ; 0xE197: PRINT MSG 0x01E4, MSGBOX CLEARED, END: "{5B}Don't be too hard on us.{57}We're really very sorry.....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_008F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0003			  ; Params 00, 03
		ScriptID    $1B9,$1		  ; Run	text script at offset 0x027B68
						  ; 0xE198: PRINT MSG 0x01E5, MSGBOX CLEARED, END: "{5B}Get out	of here!{57}Get	out!{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $1BA,$3		  ; Run	text script at offset 0x027B6A
						  ; 0xE199: PRINT MSG 0x01E6, MSGBOX CLEARED, END: "{5B}Was I rude before?  Sorry...{57}Remember--you'll get ahead{57}if you put others first.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0090:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $1BB,$0		  ; Run	text script at offset 0x027B6C
						  ; 0xE19A: PRINT MSG 0x01E7, MSGBOX CLEARED, END: "{5B}They say a witch lives{57}near Mercator.  I hear she's{57}very old.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0091:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0003			  ; Params 00, 03
		ScriptID    $1BC,$1		  ; Run	text script at offset 0x027B6E
						  ; 0xE19B: PRINT MSG 0x01E8, MSGBOX CLEARED, END: "{5B}Go away!{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $1BD,$3		  ; Run	text script at offset 0x027B70
						  ; 0xE19C: PRINT MSG 0x01E9, MSGBOX CLEARED, END: "{5B}Mercator?{57}Exit this village and{57}head west.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0092:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0004			  ; Params 00, 04
		ScriptID    $1BE,$1		  ; Run	text script at offset 0x027B72
						  ; 0xE19D: PRINT MSG 0x01EA, MSGBOX CLEARED, END: "{5B}I can't go to Mercator{57}because of the landslide.{5E}"
						  ;
		dc.w $0005			  ; Params 00, 05
		ScriptID    $1BF,$3		  ; Run	text script at offset 0x027B74
						  ; 0xE19E: PRINT MSG 0x01EB, MSGBOX CLEARED, END: "{5B}The road to Mercator{57}is open	at last!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0093:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0004			  ; Params 00, 04
		ScriptID    $1C0,$1		  ; Run	text script at offset 0x027B76
						  ; 0x819F: PRINT MSG 0x01EC: "{5B}Just	a minute!{57}We're the emergency repair{57}experts.  This'll only take{62}"
						  ; 0xE1A0: PRINT MSG 0x01ED, MSGBOX CLEARED, END: "{5B}a second...{5E}"
						  ;
		dc.w $0005			  ; Params 00, 05
		ScriptJump  loc_2622C,$3	  ; Jump to address 0x02622C
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_2622C:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00C3			  ; Bit	3 of flag 0x018
		ScriptID    $1C2,$1		  ; Flag clear:	Run text script	at offset 0x027B7A
						  ; 0x7C0D: LOAD CUSTOM	ACTION 0x0D (0x012130 CSA_000D), MSGBOX	CLEARED, END
		ScriptID    $1C3,$2		  ; Flag set:	Run text script	at offset 0x027B7C
						  ; 0xE1A1: PRINT MSG 0x01EE, MSGBOX CLEARED, END: "{5B}I'm too tired to speak.{57}...Oh, yes, of course!{57}You can go through, now.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0094:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0002			  ; Params 00, 02
		ScriptID    $1C4,$1		  ; Run	text script at offset 0x027B7E
						  ; 0xE1A2: PRINT MSG 0x01EF, MSGBOX CLEARED, END: "{5B}Bow-wow!{5E}"
						  ;
		dc.w $0019			  ; Params 00, 19
		ScriptID    $1C5,$3		  ; Run	text script at offset 0x027B80
						  ; 0xE1A3: PRINT MSG 0x01F0, MSGBOX CLEARED, END: "{5B}I like all the folks{57}in this	village.  Bow-wow!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0095:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $1C6,$0		  ; Run	text script at offset 0x027B82
						  ; 0xE1A4: PRINT MSG 0x01F1, MSGBOX CLEARED, END: "{5B}Coooooock...cock...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_000B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0003			  ; Params 00, 03
		ScriptID    $1C7,$1		  ; Run	text script at offset 0x027B84
						  ; 0xE1A5: PRINT MSG 0x01F2, MSGBOX CLEARED, END: "{5B}I couldn't go to the{57}shrine with them...{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $1C8,$3		  ; Run	text script at offset 0x027B86
						  ; 0x81A6: PRINT MSG 0x01F3: "{5B}Is it true that you are{57}unbelievably strong?{62}"
						  ; 0xE1A7: PRINT MSG 0x01F4, MSGBOX CLEARED, END: "{5B}In that	case, stay as{57}long as you like.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_000C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0003			  ; Params 00, 03
		ScriptID    $1CA,$1		  ; Run	text script at offset 0x027B8A
						  ; 0xE1A8: PRINT MSG 0x01F5, MSGBOX CLEARED, END: "{5B}It's hard to inspire{57}others to good deeds when{57}so many evils beset us.....{5E}"
						  ;
		dc.w $0004			  ; Params 00, 04
		ScriptID    $1CB,$3		  ; Run	text script at offset 0x027B8C
						  ; 0xE1A9: PRINT MSG 0x01F6, MSGBOX CLEARED, END: "{5B}They were possessed?...{57}Oh, my goodness!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0096:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0004			  ; Params 00, 04
		ScriptID    $1CC,$1		  ; Run	text script at offset 0x027B8E
						  ; 0x81AA: PRINT MSG 0x01F7: "{5B}We had a big	earthquake{57}a	few days ago.{57}Natural disasters seem	almost{62}"
						  ; 0xE1AB: PRINT MSG 0x01F8, MSGBOX CLEARED, END: "{5B}commonplace nowadays....{5E}"
						  ;
		dc.w $0005			  ; Params 00, 05
		ScriptJump  loc_26276,$3	  ; Jump to address 0x026276
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26276:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00C3			  ; Bit	3 of flag 0x018
		ScriptID    $1CE,$1		  ; Flag clear:	Run text script	at offset 0x027B92
						  ; 0x7C0D: LOAD CUSTOM	ACTION 0x0D (0x012130 CSA_000D), MSGBOX	CLEARED, END
		ScriptID    $1CF,$2		  ; Flag set:	Run text script	at offset 0x027B94
						  ; 0xE1AC: PRINT MSG 0x01F9, MSGBOX CLEARED, END: "{5B}Ahhh...that was	refreshing!{57}Have a nice trip!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0097:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $1D0,$1		  ; Run	text script at offset 0x027B96
						  ; 0xE1AD: PRINT MSG 0x01FA, MSGBOX CLEARED, END: "{5B}Hi, this is Ryuma.{5E}"
						  ;
		dc.w $0006			  ; Params 00, 06
		ScriptID    $1D1,$3		  ; Run	text script at offset 0x027B98
						  ; 0xE1AE: PRINT MSG 0x01FB, MSGBOX CLEARED, END: "{5B}Isn't there a hero{57}somewhere who can{57}help us...?{5E}"
						  ;
		dc.w $0008			  ; Params 00, 08
		ScriptID    $1D2,$5		  ; Run	text script at offset 0x027B9A
						  ; 0xE1AF: PRINT MSG 0x01FC, MSGBOX CLEARED, END: "{5B}They say you're a{57}hero, young man!{5E}"
						  ;
		dc.w $000A			  ; Params 00, 0A
		ScriptID    $1D3,$7		  ; Run	text script at offset 0x027B9C
						  ; 0xE1B0: PRINT MSG 0x01FD, MSGBOX CLEARED, END: "{5B}I saw some blond beauty{57}leaving town	with{57}two laughing monsters.....{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $1D4,$9		  ; Run	text script at offset 0x027B9E
						  ; 0xE1B1: PRINT MSG 0x01FE, MSGBOX CLEARED, END: "{5B}We suffer many calamities{57}these days.  The lighthouse{57}was	vandalized this	time.{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $1D0,$B		  ; Run	text script at offset 0x027B96
						  ; 0xE1AD: PRINT MSG 0x01FA, MSGBOX CLEARED, END: "{5B}Hi, this is Ryuma.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0098:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $1D5,$1		  ; Run	text script at offset 0x027BA0
						  ; 0xE1B2: PRINT MSG 0x01FF, MSGBOX CLEARED, END: "{5B}I bet I	could run those{57}thieves out of town{59}.{59}.{59}.{57}if I were older.{5E}"
						  ;
		dc.w $0006			  ; Params 00, 06
		ScriptID    $1D6,$3		  ; Run	text script at offset 0x027BA2
						  ; 0xE1B3: PRINT MSG 0x0200, MSGBOX CLEARED, END: "{5B}Father...{5E}"
						  ;
		dc.w $0008			  ; Params 00, 08
		ScriptID    $1D7,$5		  ; Run	text script at offset 0x027BA4
						  ; 0xE1B4: PRINT MSG 0x0201, MSGBOX CLEARED, END: "{5B}Why did	you go{57}without me?{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $1D8,$7		  ; Run	text script at offset 0x027BA6
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0xE1B5: PRINT MSG 0x0202, MSGBOX CLEARED, END: "{5B}I know you can get the{57}{5F},	'cuz I'm going{57}with you this time!{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $1D7,$9		  ; Run	text script at offset 0x027BA4
						  ; 0xE1B4: PRINT MSG 0x0201, MSGBOX CLEARED, END: "{5B}Why did	you go{57}without me?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0099:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $1DA,$1		  ; Run	text script at offset 0x027BAA
						  ; 0x81B6: PRINT MSG 0x0203: "{5B}Ryuma is an old town.{62}"
						  ; 0xE1B7: PRINT MSG 0x0204, MSGBOX CLEARED, END: "{5B}Believe	it or not, this	town{57}was much bigger	than Mercator{57}a long, long time ago.{5E}"
						  ;
		dc.w $0008			  ; Params 00, 08
		ScriptID    $1DC,$3		  ; Run	text script at offset 0x027BAE
						  ; 0xE1B8: PRINT MSG 0x0205, MSGBOX CLEARED, END: "{5B}I heard	that Mercator is{57}governed by	Duke Mercator now.{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $1DD,$5		  ; Run	text script at offset 0x027BB0
						  ; 0xE1B9: PRINT MSG 0x0206, MSGBOX CLEARED, END: "{5B}Was Duke Mercator{57}really such a rogue?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $1DE,$1		  ; Run	text script at offset 0x027BB2
						  ; 0x81BA: PRINT MSG 0x0207: "{5B}You came here to look{57}for	the treasures, too?{62}"
						  ; 0xE1BB: PRINT MSG 0x0208, MSGBOX CLEARED, END: "{5B}If it's true,{57}I want to have a share.{5E}"
						  ;
		dc.w $0008			  ; Params 00, 08
		ScriptID    $1E0,$3		  ; Run	text script at offset 0x027BB6
						  ; 0xE1BC: PRINT MSG 0x0209, MSGBOX CLEARED, END: "{5B}Don't forget to give me{57}a share when you find{57}the treasures!  Ho, ho!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_000D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $1E1,$1		  ; Run	text script at offset 0x027BB8
						  ; 0xE1BD: PRINT MSG 0x020A, MSGBOX CLEARED, END: "{5B}Sales are off this{57}month because of the thieves!{5E}"
						  ;
		dc.w $0006			  ; Params 00, 06
		ScriptID    $1E2,$3		  ; Run	text script at offset 0x027BBA
						  ; 0x81BE: PRINT MSG 0x020B: "{5B}Leave this place and{57}go back to your home!!{62}"
						  ; 0xE1BF: PRINT MSG 0x020C, MSGBOX CLEARED, END: "{5B}You won't regret taking{57}my advice.....{5E}"
						  ;
		dc.w $0008			  ; Params 00, 08
		ScriptID    $1E4,$5		  ; Run	text script at offset 0x027BBE
						  ; 0xE1C0: PRINT MSG 0x020D, MSGBOX CLEARED, END: "{5B}Thank you, Nigel.{57}You're the town's very own{57}saviour!{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $1E5,$7		  ; Run	text script at offset 0x027BC0
						  ; 0x81C1: PRINT MSG 0x020E: "{5B}Hello, Nigel.{57}Seems we just have one{57}problem after another.{62}"
						  ; 0xE1C2: PRINT MSG 0x020F, MSGBOX CLEARED, END: "{5B}Have you seen the{57}lighthouse	yet?  Nobody can{57}reach us without the light.{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $1E4,$9		  ; Run	text script at offset 0x027BBE
						  ; 0xE1C0: PRINT MSG 0x020D, MSGBOX CLEARED, END: "{5B}Thank you, Nigel.{57}You're the town's very own{57}saviour!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $1E7,$1		  ; Run	text script at offset 0x027BC4
						  ; 0xE1C3: PRINT MSG 0x0210, MSGBOX CLEARED, END: "{5B}Lately,	this is	a{57}dangerous place!  A gang of{57}thieves has	come to	this town.{5E}"
						  ;
		dc.w $0006			  ; Params 00, 06
		ScriptID    $1E8,$3		  ; Run	text script at offset 0x027BC6
						  ; 0xE1C4: PRINT MSG 0x0211, MSGBOX CLEARED, END: "{5B}I'm packin' my bags!{57}Who wants to live with{57}thieves?{5E}"
						  ;
		dc.w $0008			  ; Params 00, 08
		ScriptID    $1E9,$5		  ; Run	text script at offset 0x027BC8
						  ; 0xE1C5: PRINT MSG 0x0212, MSGBOX CLEARED, END: "{5B}Now that the thieves are{57}gone, I think I'll stay here{57}for a while....'Bye now!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $1EA,$1		  ; Run	text script at offset 0x027BCA
						  ; 0xE1C6: PRINT MSG 0x0213, MSGBOX CLEARED, END: "{5B}Oh, are	you a visitor?{57}We get so few	these days{57}thanks to	the thieves.{5E}"
						  ;
		dc.w $0006			  ; Params 00, 06
		ScriptID    $1EB,$3		  ; Run	text script at offset 0x027BCC
						  ; 0xE1C7: PRINT MSG 0x0214, MSGBOX CLEARED, END: "{5B}Horrible!!...{5E}"
						  ;
		dc.w $0008			  ; Params 00, 08
		ScriptID    $1EC,$5		  ; Run	text script at offset 0x027BCE
						  ; 0xE1C8: PRINT MSG 0x0215, MSGBOX CLEARED, END: "{5B}I look forward to{57}seeing you	again.{57}No, really...I mean it!{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $1ED,$7		  ; Run	text script at offset 0x027BD0
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0x81C9: PRINT MSG 0x0216: "{5B}The {5F} was	stolen{57}by the apprentice of{57}the lighthouse keeper!{62}"
						  ; 0xE1CA: PRINT MSG 0x0217, MSGBOX CLEARED, END: "{5B}Did you	know?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009D:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $1F0,$0		  ; Run	text script at offset 0x027BD6
						  ; 0xE1CB: PRINT MSG 0x0218, MSGBOX CLEARED, END: "{5B}The shop owner has gone.{57}Where am I supposed	to get{57}herbs	and such now?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_000E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $1F1,$1		  ; Run	text script at offset 0x027BD8
						  ; 0xE1CC: PRINT MSG 0x0219, MSGBOX CLEARED, END: "{5B}They're thieves, but{57}they are still human beings.{57}I must convert them!{5E}"
						  ;
		dc.w $0006			  ; Params 00, 06
		ScriptID    $1F2,$3		  ; Run	text script at offset 0x027BDA
						  ; 0xE1CD: PRINT MSG 0x021A, MSGBOX CLEARED, END: "{5B}They must be devils!!...{5E}"
						  ;
		dc.w $0008			  ; Params 00, 08
		ScriptID    $1F3,$5		  ; Run	text script at offset 0x027BDC
						  ; 0xE1CE: PRINT MSG 0x021B, MSGBOX CLEARED, END: "{5B}Were they monsters?{57}Really?{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $1F4,$7		  ; Run	text script at offset 0x027BDE
						  ; 0xE1CF: PRINT MSG 0x021C, MSGBOX CLEARED, END: "{5B}People are unhappy now.{57}But I'm sure they'll{57}find happiness someday.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $1F5,$1		  ; Run	text script at offset 0x027BE0
						  ; 0xE1D0: PRINT MSG 0x021D, MSGBOX CLEARED, END: "{5B}We live	in fear	of the{57}thieves who infest the cave{57}on the	promontory.{5E}"
						  ;
		dc.w $0006			  ; Params 00, 06
		ScriptID    $1F6,$3		  ; Run	text script at offset 0x027BE2
						  ; 0xE1D1: PRINT MSG 0x021E, MSGBOX CLEARED, END: "{5B}Please save our	town...{5E}"
						  ;
		dc.w $0008			  ; Params 00, 08
		ScriptID    $1F7,$5		  ; Run	text script at offset 0x027BE4
						  ; 0xE1D2: PRINT MSG 0x021F, MSGBOX CLEARED, END: "{5B}You defeated the{57}thieves all	by yourself?{57}Unbelievable!!{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $1F8,$7		  ; Run	text script at offset 0x027BE6
						  ; 0xE1D3: PRINT MSG 0x0220, MSGBOX CLEARED, END: "{5B}Please restore the light{57}to our lighthouse soon!!{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $1F9,$9		  ; Run	text script at offset 0x027BE8
						  ; 0xE1D4: PRINT MSG 0x0221, MSGBOX CLEARED, END: "{5B}You've been most helpful{57}to this town.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $1FA,$1		  ; Run	text script at offset 0x027BEA
						  ; 0x81D5: PRINT MSG 0x0222: "{5B}They're quick to take flight.{57}Chickens!!{62}"
						  ; 0xE1D6: PRINT MSG 0x0223, MSGBOX CLEARED, END: "{5B}Mercator soldiers drove	them{57}back to	the promontory,{57}but they escaped.{5E}"
						  ;
		dc.w $0006			  ; Params 00, 06
		ScriptID    $1FC,$3		  ; Run	text script at offset 0x027BEE
						  ; 0xE1D7: PRINT MSG 0x0224, MSGBOX CLEARED, END: "{5B}Won't someone please make{57}those thieves go away?!{5E}"
						  ;
		dc.w $0008			  ; Params 00, 08
		ScriptID    $1FD,$5		  ; Run	text script at offset 0x027BF0
						  ; 0xE1D8: PRINT MSG 0x0225, MSGBOX CLEARED, END: "{5B}You're great!{57}How did you ever brave the{57}depths of that cave alone?{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $1FE,$7		  ; Run	text script at offset 0x027BF2
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0xE1D9: PRINT MSG 0x0226, MSGBOX CLEARED, END: "{5B}To get the {5F}	is{57}almost impossible!  Tell me{57}who can do	it!{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $200,$9		  ; Run	text script at offset 0x027BF6
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0xE1DA: PRINT MSG 0x0227, MSGBOX CLEARED, END: "{5B}What!{57}You found the {5F}!{57}Incredible!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_000F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0008			  ; Params 00, 08
		ScriptID    $202,$1		  ; Run	text script at offset 0x027BFA
						  ; 0x81DB: PRINT MSG 0x0228: "{5B}I thank you from the{57}bottom of my	heart!	When you{57}find the treasures.....{62}"
						  ; 0x81DC: PRINT MSG 0x0229: "{5B}please buy every item{57}in the shop!  Ha ha	ha ha!{62}"
						  ; 0xE1DD: PRINT MSG 0x022A, MSGBOX CLEARED, END: "{5B}Sorry...just a little{57}salesman humor!{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $205,$3		  ; Run	text script at offset 0x027C00
						  ; 0x81DE: PRINT MSG 0x022B: "{5B}The people of Mercator{57}are also troubled by this{57}business with	the lighthouse,{62}"
						  ; 0x81DF: PRINT MSG 0x022C: "{5B}aren't they?{57}They're saying the Duke{57}has gone off somewhere...{62}"
						  ; 0xE1E0: PRINT MSG 0x022D, MSGBOX CLEARED, END: "{5B}Do you think he{57}went	to find	a{57}Sun Stone,	too?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $208,$1		  ; Run	text script at offset 0x027C06
						  ; 0xE1E1: PRINT MSG 0x022E, MSGBOX CLEARED, END: "{5B}...mumble...{57}my son is out now...{5E}"
						  ;
		dc.w $0006			  ; Params 00, 06
		ScriptID    $209,$3		  ; Run	text script at offset 0x027C08
						  ; 0xE1E2: PRINT MSG 0x022F, MSGBOX CLEARED, END: "{5B}...mumble...{57}please avenge my son!{57}...please...!{5E}"
						  ;
		dc.w $0008			  ; Params 00, 08
		ScriptID    $20A,$5		  ; Run	text script at offset 0x027C0A
						  ; 0xE1E3: PRINT MSG 0x0230, MSGBOX CLEARED, END: "{5B}...mumble...mumble...{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $20B,$7		  ; Run	text script at offset 0x027C0C
						  ; 0x81E4: PRINT MSG 0x0231: "{5B}...mumble...I wonder{57}if she's okay...{57}over in Mercator...{62}"
						  ; 0xE1E5: PRINT MSG 0x0232, MSGBOX CLEARED, END: "{5B}...is her husband still...{57}collecting jars?...mumble...{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $20D,$1		  ; Run	text script at offset 0x027C10
						  ; 0xE1E6: PRINT MSG 0x0233, MSGBOX CLEARED, END: "{5B}My dad is out right now.{57}He said he's gotta{57}do something important.{5E}"
						  ;
		dc.w $0006			  ; Params 00, 06
		ScriptID    $20E,$3		  ; Run	text script at offset 0x027C12
						  ; 0xE1E7: PRINT MSG 0x0234, MSGBOX CLEARED, END: "{5B}Father always told me...{57}..that seamen never	cry...{57}....choke!...sob...{5E}"
						  ;
		dc.w $0008			  ; Params 00, 08
		ScriptID    $20F,$5		  ; Run	text script at offset 0x027C14
						  ; 0xE1E8: PRINT MSG 0x0235, MSGBOX CLEARED, END: "{5B}Ha ha!!	 Papa came back!{57}He's very strong, isn't he?{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $210,$7		  ; Run	text script at offset 0x027C16
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0x81E9: PRINT MSG 0x0236: "{5B}Don't blame my dad!{62}"
						  ; 0xE1EA: PRINT MSG 0x0237, MSGBOX CLEARED, END: "{5B}He was more shocked than{57}anybody when that apprentice{57}guy	stole the Sun Stone.{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $213,$9		  ; Run	text script at offset 0x027C1C
						  ; 0xE1EB: PRINT MSG 0x0238, MSGBOX CLEARED, END: "{5B}You're way cool!{57}Next to my dad, you're{57}the greatest!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A2:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0008			  ; Params 00, 08
		ScriptJump  loc_263BC,$1	  ; Jump to address 0x0263BC
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $218,$3		  ; Run	text script at offset 0x027C26
						  ; 0x81F0: PRINT MSG 0x023D: "{5B}My runaway assistant{57}came	back suddenly...{62}"
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0xE1F1: PRINT MSG 0x023E, MSGBOX CLEARED, END: "{5B}and took off with{57}the {5F}....{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $8BD,$5		  ; Run	text script at offset 0x028970
						  ; 0xE6F6: PRINT MSG 0x0743, MSGBOX CLEARED, END: "{5B}I locked it up{57}so we	won't have to go{57}through that again!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_263BC:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $214,$0		  ; Prompt:	  Run text script at offset 0x027C1E
						  ; 0x81EC: PRINT MSG 0x0239: "{5B}Nigel, good timing!	My{57}apprentice has disappeared{57}in all this	confusion.{62}"
						  ; 0xA1ED: PRINT MSG 0x023A, END: "{5B}Why don't you work here{57}in his place?{58}"
		ScriptID    $216,$1		  ; Answer 'yes': Run text script at offset 0x027C22
						  ; 0xE1EE: PRINT MSG 0x023B, MSGBOX CLEARED, END: "{5B}Hahahahaha!{57}Just kidding!  What a{57}good-natured boy you are!{5E}"
		ScriptID    $217,$2		  ; Answer 'no':  Run text script at offset 0x027C24
						  ; 0xE1EF: PRINT MSG 0x023C, MSGBOX CLEARED, END: "{5B}That's okay!  The people of{57}Ryuma need your help more{57}than I do.  You're a good boy!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0010:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $21B,$1		  ; Run	text script at offset 0x027C2C
						  ; 0x81F2: PRINT MSG 0x023F: "{5B}The master isn't here now,{57}but maybe I can explain{57}how it works.{62}"
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0x81F3: PRINT MSG 0x0240: "{5B}This	lighthouse uses	a{57}Sun Stone,	the brightest stone{57}in all the land,	to guide ships{62}"
						  ; 0xE1F4: PRINT MSG 0x0241, MSGBOX CLEARED, END: "{5B}safely to the harbor.{5E}"
						  ;
		dc.w $0006			  ; Params 00, 06
		ScriptID    $21F,$3		  ; Run	text script at offset 0x027C34
						  ; 0xE1F5: PRINT MSG 0x0242, MSGBOX CLEARED, END: "{5B}M-my...master was{57}killed by the thieves...{57}What should I do???{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $220,$5		  ; Run	text script at offset 0x027C36
						  ; 0xE1F6: PRINT MSG 0x0243, MSGBOX CLEARED, END: "{5B}Owwwwww....I'm sorry!...{57}l wouldn'ta done it if I knew{57}it was part of the duke's plot!{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $221,$7		  ; Run	text script at offset 0x027C38
						  ; 0xE1F7: PRINT MSG 0x0244, MSGBOX CLEARED, END: "{5B}Owwwoooo.....!!!{57}Please let me go...{57}I'm really sorry...{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $222,$9		  ; Run	text script at offset 0x027C3A
						  ; 0xE1F8: PRINT MSG 0x0245, MSGBOX CLEARED, END: "{5B}I'm a new person now!{57}I'll work hard under Arthur{57}to right my wicked ways!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A3:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $223,$1		  ; Run	text script at offset 0x027C3C
						  ; 0x81F9: PRINT MSG 0x0246: "{5B}The thieves must be{57}looking for the same{57}treasures you	are.{62}"
						  ; 0xE1FA: PRINT MSG 0x0247, MSGBOX CLEARED, END: "{5B}There must be a	clue{57}somewhere in the cave!{5E}"
						  ;
		dc.w $0008			  ; Params 00, 08
		ScriptID    $225,$3		  ; Run	text script at offset 0x027C40
						  ; 0x81FB: PRINT MSG 0x0248: "{5B}You found the lithograph there?{57}Great!  It must be a clue!{57}Let	me see it!{62}"
						  ; 0xE1FC: PRINT MSG 0x0249, MSGBOX CLEARED, END: "{5B}What?!{57}It was snatched away?{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $227,$5		  ; Run	text script at offset 0x027C44
						  ; 0x81FD: PRINT MSG 0x024A: "{5B}Duke	Mercator abandoned his{57}town for the treasures...{62}"
						  ; 0xE1FE: PRINT MSG 0x024B, MSGBOX CLEARED, END: "{5B}I guess	that means{57}the legendary treasures{57}really	exist!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A4:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $229,$1		  ; Run	text script at offset 0x027C48
						  ; 0xE1FF: PRINT MSG 0x024C, MSGBOX CLEARED, END: "{5B}Would you mind going out now?{57}We're in a meeting.{5E}"
						  ;
		dc.w $0006			  ; Params 00, 06
		ScriptID    $22A,$3		  ; Run	text script at offset 0x027C4A
						  ; 0x8200: PRINT MSG 0x024D: "{5B}So you heard	us...{57}Well, the mayor went to try to{57}bargain with	the thieves...{62}"
						  ; 0xE201: PRINT MSG 0x024E, MSGBOX CLEARED, END: "{5B}but he never came back.{57}What	happened?{5E}"
						  ;
		dc.w $0008			  ; Params 00, 08
		ScriptID    $22C,$5		  ; Run	text script at offset 0x027C4E
						  ; 0xE202: PRINT MSG 0x024F, MSGBOX CLEARED, END: "{5B}You saved the town!{57}I can't believe you did it{57}alone!{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $22D,$7		  ; Run	text script at offset 0x027C50
						  ; 0x8203: PRINT MSG 0x0250: "{5B}Greenmaze is	also known{57}as the "Forest of	the Lost."{62}"
						  ; 0x8204: PRINT MSG 0x0251: "{5B}It is said that once	you{57}step into the woods...{59}...{57}you never come back out.{62}"
						  ; 0xE205: PRINT MSG 0x0252, MSGBOX CLEARED, END: "{5B}It's so dangerous that{57}Duke Mercator forbids us{57}to go in.{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $22C,$9		  ; Run	text script at offset 0x027C4E
						  ; 0xE202: PRINT MSG 0x024F, MSGBOX CLEARED, END: "{5B}You saved the town!{57}I can't believe you did it{57}alone!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $230,$1		  ; Run	text script at offset 0x027C56
						  ; 0xE206: PRINT MSG 0x0253, MSGBOX CLEARED, END: "{5B}The mayor is out...{5E}"
						  ;
		dc.w $0006			  ; Params 00, 06
		ScriptID    $231,$3		  ; Run	text script at offset 0x027C58
						  ; 0xE207: PRINT MSG 0x0254, MSGBOX CLEARED, END: "{5B}It's all over for this town{57}if the mayor is killed...{5E}"
						  ;
		dc.w $0008			  ; Params 00, 08
		ScriptID    $232,$5		  ; Run	text script at offset 0x027C5A
						  ; 0xE208: PRINT MSG 0x0255, MSGBOX CLEARED, END: "{5B}It's unanimous!  You're the{57}honorary citizen of Ryuma!{5E}"
						  ;
		dc.w $000A			  ; Params 00, 0A
		ScriptID    $233,$7		  ; Run	text script at offset 0x027C5C
						  ; 0xE209: PRINT MSG 0x0256, MSGBOX CLEARED, END: "{5B}What will you do{57}with the treasures?{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $234,$9		  ; Run	text script at offset 0x027C5E
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0x820A: PRINT MSG 0x0257: "{5B}Oh, it's our honorary citizen!{57}We're having a meeting{57}to decide who's going{62}"
						  ; 0xE20B: PRINT MSG 0x0258, MSGBOX CLEARED, END: "{5B}to get the {5F}.{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $233,$B		  ; Run	text script at offset 0x027C5C
						  ; 0xE209: PRINT MSG 0x0256, MSGBOX CLEARED, END: "{5B}What will you do{57}with the treasures?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $237,$1		  ; Run	text script at offset 0x027C64
						  ; 0xE20C: PRINT MSG 0x0259, MSGBOX CLEARED, END: "{5B}Go take	a look around town,{57}young man!{5E}"
						  ;
		dc.w $0006			  ; Params 00, 06
		ScriptJump  loc_2644A,$3	  ; Jump to address 0x02644A
						  ;
		dc.w $0007			  ; Params 00, 07
		ScriptID    $23C,$5		  ; Run	text script at offset 0x027C6E
						  ; 0xE210: PRINT MSG 0x025D, MSGBOX CLEARED, END: "{5B}Their hideout is in{57}the cave	on the promontory.{57}You can get there	by raft.{5E}"
						  ;
		dc.w $0008			  ; Params 00, 08
		ScriptID    $240,$7		  ; Run	text script at offset 0x027C76
						  ; 0xE214: PRINT MSG 0x0261, MSGBOX CLEARED, END: "{5B}I knew you were	really{57}something all	along!{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $241,$9		  ; Run	text script at offset 0x027C78
						  ; 0x8215: PRINT MSG 0x0262: "{5B}It's quite difficult, but...{57}if anyone can solve Greenmaze,{57}it's you, Nigel.{62}"
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0x8216: PRINT MSG 0x0263: "{5B}To get to the Sun Stone,{57}you'll need a good sense of{57}balance and excellent{62}"
						  ; 0xE217: PRINT MSG 0x0264, MSGBOX CLEARED, END: "{5B}jumping	skills.{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $240,$B		  ; Run	text script at offset 0x027C76
						  ; 0xE214: PRINT MSG 0x0261, MSGBOX CLEARED, END: "{5B}I knew you were	really{57}something all	along!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_2644A:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $238,$0		  ; Prompt:	  Run text script at offset 0x027C66
						  ; 0x820D: PRINT MSG 0x025A: "{5B}Young man, you've caught us{57}at a bad time.  I don't know{57}how to put this, but....{62}"
						  ; 0xA20E: PRINT MSG 0x025B, END: "{5B}we've got a problem.{57}Would you do us a favor?{58}"
		ScriptID    $23A,$1		  ; Answer 'yes': Run text script at offset 0x027C6A
						  ; 0x820F: PRINT MSG 0x025C: "{5B}Quick response!{57}Are you sure?{57}OK!{62}"
						  ; 0x1420: SET	BIT 0 OF FLAG 0x004
						  ; 0xE210: PRINT MSG 0x025D, MSGBOX CLEARED, END: "{5B}Their hideout is in{57}the cave	on the promontory.{57}You can get there	by raft.{5E}"
		ScriptJump  loc_26456,$2	  ; Answer 'no':  Jump to address 0x026456
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_26456:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $23D,$0		  ; Prompt:	  Run text script at offset 0x027C70
						  ; 0x8211: PRINT MSG 0x025E: "{5B}You're right,  I should tell you{57}what I want first.{57}I want you to go to their{62}"
						  ; 0xA212: PRINT MSG 0x025F, END: "{5B}hideout	and wipe them out.{57}Will you do it?{58}"
		ScriptID    $23B,$1		  ; Answer 'yes': Run text script at offset 0x027C6C
						  ; 0x1420: SET	BIT 0 OF FLAG 0x004
						  ; 0xE210: PRINT MSG 0x025D, MSGBOX CLEARED, END: "{5B}Their hideout is in{57}the cave	on the promontory.{57}You can get there	by raft.{5E}"
		ScriptID    $23F,$2		  ; Answer 'no':  Run text script at offset 0x027C74
						  ; 0xE213: PRINT MSG 0x0260, MSGBOX CLEARED, END: "{5B}I'm disappointed in you,{57}boy...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00A7:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $245,$0		  ; Run	text script at offset 0x027C80
						  ; 0xE218: PRINT MSG 0x0265, MSGBOX CLEARED, END: "{5B}Aren't you afraid of{57}thieves?  Go home!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00A8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $246,$1		  ; Run	text script at offset 0x027C82
						  ; 0x7C14: LOAD CUSTOM	ACTION 0x14 (0x01214C CSA_0014), MSGBOX	CLEARED, END
						  ;
		dc.w $0006			  ; Params 00, 06
		ScriptID    $247,$3		  ; Run	text script at offset 0x027C84
						  ; 0xE219: PRINT MSG 0x0266, MSGBOX CLEARED, END: "{5B}I'm hiding 'cause{57}I'm afraid of the thieves.{5E}"
						  ;
		dc.w $0008			  ; Params 00, 08
		ScriptID    $248,$5		  ; Run	text script at offset 0x027C86
						  ; 0xE21A: PRINT MSG 0x0267, MSGBOX CLEARED, END: "{5B}I'm still frightened...{57}Are they gone yet?{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $249,$7		  ; Run	text script at offset 0x027C88
						  ; 0xE21B: PRINT MSG 0x0268, MSGBOX CLEARED, END: "{5B}Another	betrayal!{57}I can't trust anyone anymore!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $24A,$1		  ; Run	text script at offset 0x027C8A
						  ; 0xE21C: PRINT MSG 0x0269, MSGBOX CLEARED, END: "{5B}Bow-wow!{5E}"
						  ;
		dc.w $0019			  ; Params 00, 19
		ScriptID    $24B,$3		  ; Run	text script at offset 0x027C8C
						  ; 0xE21D: PRINT MSG 0x026A, MSGBOX CLEARED, END: "{5B}Hmmmmm...I live	here because{57}I love the tang	of the sea.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0011:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0008			  ; Params 00, 08
		ScriptID    $24C,$1		  ; Run	text script at offset 0x027C8E
						  ; 0x7C21: LOAD CUSTOM	ACTION 0x21 (0x012180 CSA_0021), MSGBOX	CLEARED, END
						  ;
		dc.w $0009			  ; Params 00, 09
		ScriptID    $24D,$3		  ; Run	text script at offset 0x027C90
						  ; 0x0433: LOAD 0x0033	INTO 0xFF1198 (Safety Pass)
						  ; 0xE21E: PRINT MSG 0x026B, MSGBOX CLEARED, END: "{5B}You can	get into Mercator{57}with the {5F}.{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $24F,$5		  ; Run	text script at offset 0x027C94
						  ; 0xE21F: PRINT MSG 0x026C, MSGBOX CLEARED, END: "{5B}I think	we need{57}an exorcism or something.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_008A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $250,$1		  ; Run	text script at offset 0x027C96
						  ; 0xE220: PRINT MSG 0x026D, MSGBOX CLEARED, END: "{5B}It's strange...{57}Where is the mayor?{57}What's happening to this town?{5E}"
						  ;
		dc.w $0006			  ; Params 00, 06
		ScriptID    $251,$3		  ; Run	text script at offset 0x027C98
						  ; 0xE221: PRINT MSG 0x026E, MSGBOX CLEARED, END: "{5B}What on	earth{57}do those thieves want?{5E}"
						  ;
		dc.w $0008			  ; Params 00, 08
		ScriptID    $252,$5		  ; Run	text script at offset 0x027C9A
						  ; 0xE222: PRINT MSG 0x026F, MSGBOX CLEARED, END: "{5B}A strange blond	woman just{57}snatched my safe-conduct pass!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $253,$1		  ; Run	text script at offset 0x027C9C
						  ; 0x18AA: LOAD CHARACTER SCRIPT * (0x00AA)
						  ; 0xE223: PRINT MSG 0x0270, MSGBOX CLEARED, END: "{5B}If ya ain't got a{57}safe-conduct pass, ya ain't{57}gettin' in these gates!{5E}"
						  ;
		dc.w $0009			  ; Params 00, 09
		ScriptID    $255,$3		  ; Run	text script at offset 0x027CA0
						  ; 0xE224: PRINT MSG 0x0271, MSGBOX CLEARED, END: "{5B}This is	Mercator, where{57}money's the most important{57}thing in the world!{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $256,$5		  ; Run	text script at offset 0x027CA2
						  ; 0xE225: PRINT MSG 0x0272, MSGBOX CLEARED, END: "{5B}Heheheh....{57}Sorry 'bout that.  I'll make{57}it up to you someday.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $257,$1		  ; Run	text script at offset 0x027CA4
						  ; 0x18AB: LOAD CHARACTER SCRIPT * (0x00AB)
						  ; 0xE226: PRINT MSG 0x0273, MSGBOX CLEARED, END: "{5B}My legs	are sore from{57}standing here all day long.{5E}"
						  ;
		dc.w $0009			  ; Params 00, 09
		ScriptID    $259,$3		  ; Run	text script at offset 0x027CA8
						  ; 0xE227: PRINT MSG 0x0274, MSGBOX CLEARED, END: "{5B}Mercator is a historic town.{57}We welcome you.{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $25A,$5		  ; Run	text script at offset 0x027CAA
						  ; 0xE228: PRINT MSG 0x0275, MSGBOX CLEARED, END: "{5B}Hello, Nigel!{57}How you doing?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0012:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $25B,$0		  ; Run	text script at offset 0x027CAC
						  ; 0xE229: PRINT MSG 0x0276, MSGBOX CLEARED, END: "{5B}Mercator is a{57}beautiful town, great for{57}sightseeing and entertainment.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00AC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $25C,$1		  ; Run	text script at offset 0x027CAE
						  ; 0xE22A: PRINT MSG 0x0277, MSGBOX CLEARED, END: "{5B}I've just arrived from the{57}continent.  Gosh, what{57}a big town!{5E}"
						  ;
		dc.w $000E			  ; Params 00, 0E
		ScriptID    $25D,$3		  ; Run	text script at offset 0x027CB0
						  ; 0xE22B: PRINT MSG 0x0278, MSGBOX CLEARED, END: "{5B}I heard	that Madame{57}Yard's is a great place to{57}rid oneself of stress!{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $25E,$5		  ; Run	text script at offset 0x027CB2
						  ; 0xE22C: PRINT MSG 0x0279, MSGBOX CLEARED, END: "{5B}Wowie!!	 Mercator is{57}wonderful!  I LIKE it!{57}I want to stay here forever!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $25F,$1		  ; Run	text script at offset 0x027CB4
						  ; 0xE22D: PRINT MSG 0x027A, MSGBOX CLEARED, END: "{5B}The prices are way too high{57}in this town.  I'm gonna need{57}a lot more money...{5E}"
						  ;
		dc.w $000E			  ; Params 00, 0E
		ScriptID    $260,$3		  ; Run	text script at offset 0x027CB6
						  ; 0xE22E: PRINT MSG 0x027B, MSGBOX CLEARED, END: "{5B}You're new in town, right?{5E}"
						  ;
		dc.w $000F			  ; Params 00, 0F
		ScriptID    $261,$5		  ; Run	text script at offset 0x027CB8
						  ; 0xE22F: PRINT MSG 0x027C, MSGBOX CLEARED, END: "{5B}I spent	all my money!{57}I have	to go home, but	I can't{57}afford the trip back!{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $262,$7		  ; Run	text script at offset 0x027CBA
						  ; 0x8230: PRINT MSG 0x027D: "{5B}This	young fool was the{57}lighthouse keeper's assistant.{57}His master fully trusted him,{62}"
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0xE231: PRINT MSG 0x027E, MSGBOX CLEARED, END: "{5B}but he stole the {5F}!{57}He betrayed his master!{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $265,$9		  ; Run	text script at offset 0x027CC0
						  ; 0xE232: PRINT MSG 0x027F, MSGBOX CLEARED, END: "{5B}Young men nowadays lack{57}grit!  They are always taking{57}the	short view of things!{5E}"
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $266,$B		  ; Run	text script at offset 0x027CC2
						  ; 0xE233: PRINT MSG 0x0280, MSGBOX CLEARED, END: "{5B}We are discussing{57}the future	of Mercator.{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $267,$D		  ; Run	text script at offset 0x027CC4
						  ; 0xE234: PRINT MSG 0x0281, MSGBOX CLEARED, END: "{5B}I can't believe it!  I spent{57}over 1000 golds on that{57}stupid chicken race!!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $268,$1		  ; Run	text script at offset 0x027CC6
						  ; 0xE235: PRINT MSG 0x0282, MSGBOX CLEARED, END: "{5B}We almost never	get to{57}go inside the	castle...{5E}"
						  ;
		dc.w $000E			  ; Params 00, 0E
		ScriptID    $269,$3		  ; Run	text script at offset 0x027CC8
						  ; 0xE236: PRINT MSG 0x0283, MSGBOX CLEARED, END: "{5B}The duke is now	receiving{57}applications for mercenaries.{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $26A,$5		  ; Run	text script at offset 0x027CCA
						  ; 0xE237: PRINT MSG 0x0284, MSGBOX CLEARED, END: "{5B}YOU were invited to the{57}castle?  You	must be	strong!{57}Can I have your autograph?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0013:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $26B,$1		  ; Run	text script at offset 0x027CCC
						  ; 0xE238: PRINT MSG 0x0285, MSGBOX CLEARED, END: "{5B}No, no,	don't disturb me!{57}This requires my utmost{57}concentration...{5E}"
						  ;
		dc.w $000D			  ; Params 00, 0D
		ScriptID    $26C,$3		  ; Run	text script at offset 0x027CCE
						  ; 0x7C3D: LOAD CUSTOM	ACTION 0x3D (0x0121F0 CSA_003D), MSGBOX	CLEARED, END
						  ;
		dc.w $000E			  ; Params 00, 0E
		ScriptID    $26D,$5		  ; Run	text script at offset 0x027CD0
						  ; 0xE239: PRINT MSG 0x0286, MSGBOX CLEARED, END: "{5B}What's wrong with you?{57}Go ahead!  Just open the{57}door and go in!{5E}"
						  ;
		dc.w $000F			  ; Params 00, 0F
		ScriptID    $26E,$7		  ; Run	text script at offset 0x027CD2
						  ; 0xE23A: PRINT MSG 0x0287, MSGBOX CLEARED, END: "{5B}How was	it?  Not quite{57}what you thought, was	it?{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $26F,$9		  ; Run	text script at offset 0x027CD4
						  ; 0xE23B: PRINT MSG 0x0288, MSGBOX CLEARED, END: "{5B}I said,	do not disturb me!{57}Hammana, hammena,	hammina...{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptJump  loc_26542,$B	  ; Jump to address 0x026542
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $276,$D		  ; Run	text script at offset 0x027CE2
						  ; 0x8240: PRINT MSG 0x028D: "{5B}Please don't disturb{57}me, or I will be forced to{57}turn you into a dog!!{62}"
						  ; 0xE241: PRINT MSG 0x028E, MSGBOX CLEARED, END: "{5B}Now, where was I?.....{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26542:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0132			  ; Bit	2 of flag 0x026
		ScriptID    $274,$1		  ; Flag set:	Run text script	at offset 0x027CDE
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0xE23F: PRINT MSG 0x028C, MSGBOX CLEARED, END: "{5B}You got	the {5F}!{57}My	crystal	ball never lies....{5E}"
		ScriptID    $270,$2		  ; Flag clear:	Run text script	at offset 0x027CD6
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0x823C: PRINT MSG 0x0289: "{5B}The {5F}!{57}I can see it!{57}Now go	and get	it!{62}"
						  ; 0x823D: PRINT MSG 0x028A: "{5B}Then	the lighthouse{57}will be restored!{62}"
						  ; 0xE23E: PRINT MSG 0x028B, MSGBOX CLEARED, END: "{5B}I think	you're smart{57}enough to get through{57}Greenmaze on your own.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00AF:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $278,$1		  ; Run	text script at offset 0x027CE6
						  ; 0xE242: PRINT MSG 0x028F, MSGBOX CLEARED, END: "{5B}I want to be young again.....{5E}"
						  ;
		dc.w $000F			  ; Params 00, 0F
		ScriptID    $279,$3		  ; Run	text script at offset 0x027CE8
						  ; 0xE243: PRINT MSG 0x0290, MSGBOX CLEARED, END: "{5B}Hi, cutie!{57}Am I pretty?{57}Am I young? La-la-la!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $27A,$1		  ; Run	text script at offset 0x027CEA
						  ; 0xE244: PRINT MSG 0x0291, MSGBOX CLEARED, END: "{5B}If my mom really becomes{57}young, I can boast to all my{57}friends!{5E}"
						  ;
		dc.w $000F			  ; Params 00, 0F
		ScriptID    $27B,$3		  ; Run	text script at offset 0x027CEC
						  ; 0xE245: PRINT MSG 0x0292, MSGBOX CLEARED, END: "{5B}I'm happy to see my mom{57}young again, but...{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $27C,$1		  ; Run	text script at offset 0x027CEE
						  ; 0xE246: PRINT MSG 0x0293, MSGBOX CLEARED, END: "{5B}Monsters on this island{57}are rare.  They fetch a{57}good price on the	continent.{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $27D,$3		  ; Run	text script at offset 0x027CF0
						  ; 0xE247: PRINT MSG 0x0294, MSGBOX CLEARED, END: "{5B}I got a	ton of golds for{57}the	monsters!  I'm going to{57}Greenpea's Playhouse.{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $27E,$5		  ; Run	text script at offset 0x027CF2
						  ; 0x8248: PRINT MSG 0x0295: "{5B}I caught the	three most{57}wanted criminals on this{57}island!  They'll bring in{62}"
						  ; 0xE249: PRINT MSG 0x0296, MSGBOX CLEARED, END: "{5B}a good price!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B2:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $280,$0		  ; Run	text script at offset 0x027CF6
						  ; 0x1BEE: LOAD SPECIAL CHARACTER * (0x06)
						  ; 0xE24A: PRINT MSG 0x0297, MSGBOX CLEARED, END: "{5B}...grrrrrrrrr...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B3:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $282,$0		  ; Run	text script at offset 0x027CFA
						  ; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
						  ; 0xE24B: PRINT MSG 0x0298, MSGBOX CLEARED, END: "{5B}....whoooOOOOoooo!!!......{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B4:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $284,$0		  ; Run	text script at offset 0x027CFE
						  ; 0x1BEE: LOAD SPECIAL CHARACTER * (0x06)
						  ; 0xE24C: PRINT MSG 0x0299, MSGBOX CLEARED, END: "{5B}YAAARRRG!!.....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B5:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $286,$0		  ; Run	text script at offset 0x027D02
						  ; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
						  ; 0xE24D: PRINT MSG 0x029A, MSGBOX CLEARED, END: "{5B}Hissssss!!!.....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $288,$1		  ; Run	text script at offset 0x027D06
						  ; 0x824E: PRINT MSG 0x029B: "{5B}Duke	Mercator is a man of{57}fine character.	 This{57}comfortable life we lead{62}"
						  ; 0xE24F: PRINT MSG 0x029C, MSGBOX CLEARED, END: "{5B}is all because of him.{57}Hurrah for Duke Mercator!{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $28A,$3		  ; Run	text script at offset 0x027D0A
						  ; 0xE250: PRINT MSG 0x029D, MSGBOX CLEARED, END: "{5B}W-wh-what?{57}Duke Mercator deserted us?{57}I don't believe it!{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $28B,$5		  ; Run	text script at offset 0x027D0C
						  ; 0xE251: PRINT MSG 0x029E, MSGBOX CLEARED, END: "{5B}Hurrah for General Arthur!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $28C,$1		  ; Run	text script at offset 0x027D0E
						  ; 0x8252: PRINT MSG 0x029F: "{5B}I heard that	an evil	magician{57}to the south of us is a source{57}of great distress	to the Duke.{62}"
						  ; 0x8253: PRINT MSG 0x02A0: "{5B}He must be using his	magic{57}powers	to threaten the	Duke{57}into giving him	money.{62}"
						  ; 0xE254: PRINT MSG 0x02A1, MSGBOX CLEARED, END: "{5B}That's why we have to{57}pay a heavy tax...isn't it?{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $28F,$3		  ; Run	text script at offset 0x027D14
						  ; 0xE255: PRINT MSG 0x02A2, MSGBOX CLEARED, END: "{5B}Did you	defeat Mir?  Really?{57}Then why the long face?{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $290,$5		  ; Run	text script at offset 0x027D16
						  ; 0xE256: PRINT MSG 0x02A3, MSGBOX CLEARED, END: "{5B}Where will we be{57}without Duke Mercator?{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $291,$7		  ; Run	text script at offset 0x027D18
						  ; 0xE257: PRINT MSG 0x02A4, MSGBOX CLEARED, END: "{5B}General	Arthur lowered{57}the tax rate.{57}He's quite a guy!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $292,$1		  ; Run	text script at offset 0x027D1A
						  ; 0x8258: PRINT MSG 0x02A5: "{5B}Welcome to Mr. Ludwig's.{57}If you came for a{57}music lesson,{62}"
						  ; 0xE259: PRINT MSG 0x02A6, MSGBOX CLEARED, END: "{5B}Mr. Ludwig is out.....{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $294,$3		  ; Run	text script at offset 0x027D1E
						  ; 0xE25A: PRINT MSG 0x02A7, MSGBOX CLEARED, END: "{5B}Ludwig is not here!{57}I'm afraid It'll be some time{57}before he returns.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $295,$1		  ; Run	text script at offset 0x027D20
						  ; 0x825B: PRINT MSG 0x02A8: "{5B}Did you come	here to	listen{57}to him play, too?  I came{57}all the way from	the continent{62}"
						  ; 0xE25C: PRINT MSG 0x02A9, MSGBOX CLEARED, END: "{5B}just to	hear our very own{57}national treasure play...{57}where	is he?{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $297,$3		  ; Run	text script at offset 0x027D24
						  ; 0xE25D: PRINT MSG 0x02AA, MSGBOX CLEARED, END: "{5B}What a pity!  I	was looking{57}forward to listening to that{57}beautiful sound of his.{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $298,$5		  ; Run	text script at offset 0x027D26
						  ; 0x825E: PRINT MSG 0x02AB: "{5B}I'm going back to the{57}continent.  There's no sense{57}in waiting any longer{62}"
						  ; 0x825F: PRINT MSG 0x02AC: "{5B}for this Ludwig character.{57}What?	The lighthouse is{57}out of order?{62}"
						  ; 0xE260: PRINT MSG 0x02AD, MSGBOX CLEARED, END: "{5B}Gee!{57}Of all the rotten luck!!!{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $29B,$7		  ; Run	text script at offset 0x027D2C
						  ; 0xE261: PRINT MSG 0x02AE, MSGBOX CLEARED, END: "{5B}I'm going back home.{57}Looks like I'll never get to{57}hear him play, now.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0014:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $29C,$0		  ; Run	text script at offset 0x027D2E
						  ; 0xE262: PRINT MSG 0x02AF, MSGBOX CLEARED, END: "{5B}Hurry, hurry!!{57}Step right up!{57}We're almost out of stock!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00BA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $29D,$1		  ; Run	text script at offset 0x027D30
						  ; 0xE263: PRINT MSG 0x02B0, MSGBOX CLEARED, END: "{5B}There's none cheaper!{57}Low-price guarantee...{57}...every day!!{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $29E,$3		  ; Run	text script at offset 0x027D32
						  ; 0x8264: PRINT MSG 0x02B1: "{5B}This	shop is	famous{57}even on the continent.  I have{57}a huge shopping list for{62}"
						  ; 0xE265: PRINT MSG 0x02B2, MSGBOX CLEARED, END: "{5B}all my friends.....{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00BB:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $2A0,$0		  ; Run	text script at offset 0x027D36
						  ; 0xE266: PRINT MSG 0x02B3, MSGBOX CLEARED, END: "{5B}This shop is always crowded{57}because it's cheaper than{57}that other shop over there.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00BC:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $2A1,$0		  ; Run	text script at offset 0x027D38
						  ; 0xE267: PRINT MSG 0x02B4, MSGBOX CLEARED, END: "{5B}What a fool!{57}I bought too many!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0015:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $2A2,$1		  ; Run	text script at offset 0x027D3A
						  ; 0xE268: PRINT MSG 0x02B5, MSGBOX CLEARED, END: "{5B}If you're not a registered{57}member, don't waste my time.{57}Scram!  Beat it!!{5E}"
						  ;
		dc.w $000C			  ; Params 00, 0C
		ScriptID    $2A3,$3		  ; Run	text script at offset 0x027D3C
						  ; 0xE269: PRINT MSG 0x02B6, MSGBOX CLEARED, END: "{5B}You again!{57}I	said members only!{57}Now, out!	 Out!{5E}"
						  ;
		dc.w $000E			  ; Params 00, 0E
		ScriptJump  loc_26616,$5	  ; Jump to address 0x026616
						  ;
		dc.w $000F			  ; Params 00, 0F
		ScriptID    $2A6,$7		  ; Run	text script at offset 0x027D42
						  ; 0xE26B: PRINT MSG 0x02B8, MSGBOX CLEARED, END: "{5B}What a stubborn	kid!{57}Do you want to make me angry?{57}Get out of here!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26616:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $001A			  ; Bit	2 of flag 0x003
		ScriptID    $2A5,$1		  ; Flag set:	Run text script	at offset 0x027D40
						  ; 0xE26A: PRINT MSG 0x02B7, MSGBOX CLEARED, END: "{5B}Please...go on upstairs.{5E}"
		ScriptID    $2A4,$2		  ; Flag clear:	Run text script	at offset 0x027D3E
						  ; 0x7C3E: LOAD CUSTOM	ACTION 0x3E (0x0121F4 CSA_003E), MSGBOX	CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0016:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptJump  loc_26638,$1	  ; Jump to address 0x026638
						  ;
		dc.w $000C			  ; Params 00, 0C
		ScriptJump  loc_26650,$3	  ; Jump to address 0x026650
						  ;
		dc.w $000E			  ; Params 00, 0E
		ScriptID    $2AB,$5		  ; Run	text script at offset 0x027D4C
						  ; 0xE26F: PRINT MSG 0x02BC, MSGBOX CLEARED, END: "{5B}Hello, kind sir.  To become{57}a member	at Madame Yard's,{57}please ask at the counter.{5E}"
						  ;
		dc.w $000F			  ; Params 00, 0F
		ScriptID    $2AC,$7		  ; Run	text script at offset 0x027D4E
						  ; 0xE270: PRINT MSG 0x02BD, MSGBOX CLEARED, END: "{5B}Say hello to Miss Shorty--{57}er, I mean, Miss Friday!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26638:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $2A7,$0		  ; Run	text script at offset 0x027D44
						  ; 0x14C6: SET	BIT 6 OF FLAG 0x018
						  ; 0x826C: PRINT MSG 0x02B9: "{5B}You're too young for{57}Madame Yard's.  I'm sorry.{62}"
						  ; 0xE26D: PRINT MSG 0x02BA, MSGBOX CLEARED, END: "{5B}Please come again{57}when you've grown up.{5E}"
; ---------------------------------------------------------------------------
		move.w	#$00C8,d0

loc_26640:					  ; CODE XREF: ROM:00026B02j
		bsr.w	TestFlagBit
		beq.s	locret_2664E
		move.w	#$002C,d0
		bsr.w	SetFlagBit

locret_2664E:					  ; CODE XREF: ROM:00026644j
		rts
; ---------------------------------------------------------------------------

loc_26650:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $001E			  ; Bit	6 of flag 0x003
		ScriptID    $2AC,$1		  ; Flag set:	Run text script	at offset 0x027D4E
						  ; 0xE270: PRINT MSG 0x02BD, MSGBOX CLEARED, END: "{5B}Say hello to Miss Shorty--{57}er, I mean, Miss Friday!{5E}"
		ScriptID    $2AA,$2		  ; Flag clear:	Run text script	at offset 0x027D4A
						  ; 0xE26E: PRINT MSG 0x02BB, MSGBOX CLEARED, END: "{5B}Curious	boy!{57}You know, curiosity is a{57}necessity for greatness.....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0017:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $2AD,$1		  ; Run	text script at offset 0x027D50
						  ; 0xE271: PRINT MSG 0x02BE, MSGBOX CLEARED, END: "{5B}Non-members can't{57}go upstairs.  Sorry.{5E}"
						  ;
		dc.w $000C			  ; Params 00, 0C
		ScriptID    $2AE,$3		  ; Run	text script at offset 0x027D52
						  ; 0x142E: SET	BIT 6 OF FLAG 0x005
						  ; 0x8272: PRINT MSG 0x02BF: "{5B}OK, listen carefully.{57}This is a popular trick{57}among the young boys...{62}"
						  ; 0xE273: PRINT MSG 0x02C0, MSGBOX CLEARED, END: "{5B}Go and see the Fortuneteller.{57}I'm sure you'll be{57}pleasantly surprised!{5E}"
						  ;
		dc.w $000E			  ; Params 00, 0E
		ScriptID    $2B1,$5		  ; Run	text script at offset 0x027D58
						  ; 0xE274: PRINT MSG 0x02C1, MSGBOX CLEARED, END: "{5B}Welcome	to Madame Yard's!{57}She's the very best!!{5E}"
						  ;
		dc.w $000F			  ; Params 00, 0F
		ScriptID    $2B2,$7		  ; Run	text script at offset 0x027D5A
						  ; 0x8275: PRINT MSG 0x02C2: "{5B}Hardships are essential{57}for you to mature.{62}"
						  ; 0xE276: PRINT MSG 0x02C3, MSGBOX CLEARED, END: "{5B}There really are no{57}easy solutions.....{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00BD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
word_26676:	dc.w $0009			  ; Params 00, 09
		ScriptID    $2B4,$1		  ; Run	text script at offset 0x027D5E
						  ; 0x8277: PRINT MSG 0x02C4: "{5B}Quite expensive, but	I feel{57}much better!	I've got to go{57}home now and...{62}"
						  ; 0xE278: PRINT MSG 0x02C5, MSGBOX CLEARED, END: "{5B}practice what I	learned...{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $2B6,$3		  ; Run	text script at offset 0x027D62
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0xE279: PRINT MSG 0x02C6, MSGBOX CLEARED, END: "{5B}Duke Mercator asked him{57}to steal the	{5F} for{57}six	golds!	Six!!{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $2B8,$5		  ; Run	text script at offset 0x027D66
						  ; 0xE27A: PRINT MSG 0x02C7, MSGBOX CLEARED, END: "{5B}I've just about dislocated{57}my jaw from talking so much.{5E}"
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $2B9,$7		  ; Run	text script at offset 0x027D68
						  ; 0xE27B: PRINT MSG 0x02C8, MSGBOX CLEARED, END: "{5B}I want them to lower{57}our taxes!{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $2BA,$9		  ; Run	text script at offset 0x027D6A
						  ; 0xE27C: PRINT MSG 0x02C9, MSGBOX CLEARED, END: "{5B}My favorite game is{57}roulette!  Let's go win{57}a bundle on it!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00BE:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $2BB,$0		  ; Run	text script at offset 0x027D6C
						  ; 0xE27D: PRINT MSG 0x02CA, MSGBOX CLEARED, END: "{5B}Me?  Yes, I'm a{57}member, but I don't wear{57}my tutu when I'm off.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00BF:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $2BC,$0		  ; Run	text script at offset 0x027D6E
						  ; 0x827E: PRINT MSG 0x02CB: "{5B}I've been waiting all week{57}for a session with{57}Madame Yard!{62}"
						  ; 0xE27F: PRINT MSG 0x02CC, MSGBOX CLEARED, END: "{5B}If only	I could	afford to{57}come here more often.....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptJump  loc_266B2,$1	  ; Jump to address 0x0266B2
						  ;
		dc.w $0101			  ; Params 01, 01
		ScriptJump  loc_266BE,$3	  ; Jump to address 0x0266BE
						  ;
		dc.w $0102			  ; Params 01, 02
		ScriptID    $2D7,$5		  ; Run	text script at offset 0x027DA4
						  ; 0xE295: PRINT MSG 0x02E2, MSGBOX CLEARED, END: "{5B}Did you	go to the market?{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptJump  loc_26706,$7	  ; Jump to address 0x026706
						  ;
		dc.w $0103			  ; Params 01, 03
		ScriptJump  loc_266FA,$9	  ; Jump to address 0x0266FA
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_266B2:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00C7			  ; Bit	7 of flag 0x018
		ScriptID    $2BE,$1		  ; Flag set:	Run text script	at offset 0x027D72
						  ; 0x8280: PRINT MSG 0x02CD: "{5B}...sigh....The shop is{57}closed now.  But you can{57}see that.....{62}"
						  ; 0x8281: PRINT MSG 0x02CE: "{5B}As you know,	there's another{57}shop just across the way.{57}Both of us sell{62}"
						  ; 0x8282: PRINT MSG 0x02CF: "{5B}the same items, but they{57}sell them much cheaper.{57}I'm thinking of changing{62}"
						  ; 0x8283: PRINT MSG 0x02D0: "{5B}my job, but I don't know what{57}kind of shop I'd be most{57}suitable for.....{62}"
						  ; 0xE284: PRINT MSG 0x02D1, MSGBOX CLEARED, END: "{5B}I don't even want to{57}get out of bed, I'm{57}such a failure!.....{5E}"
		ScriptID    $2C3,$2		  ; Flag clear:	Run text script	at offset 0x027D7C
						  ; 0xE285: PRINT MSG 0x02D2, MSGBOX CLEARED, END: "{5B}I want to open a new shop...{57}...sigh...what should I	do?...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_266BE:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $2C4,$0		  ; Run	text script at offset 0x027D7E
						  ; 0x8286: PRINT MSG 0x02D3: "{5B}Nigel, how have you been?{57}I've been thinking hard about{57}starting over,{62}"
						  ; 0x8287: PRINT MSG 0x02D4: "{5B}making a new	life....and I{57}finally made up my mind{57}to change my job!{62}"
						  ; 0xA288: PRINT MSG 0x02D5, END: "{5B}Would you give me{57}your opinion?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	loc_266CE

loc_266C8:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $2C7,$0		  ; Run	text script at offset 0x027D84
						  ; 0xE289: PRINT MSG 0x02D6, MSGBOX CLEARED, END: "{5B}Yeah, I	know that you're{57}busy.  Visit me later when{57}you have nothing better to do.{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_266F8
; ---------------------------------------------------------------------------

loc_266CE:					  ; CODE XREF: ROM:000266C6j
						  ; ROM:000266F2j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $2C8,$0		  ; Run	text script at offset 0x027D86
						  ; 0xA28A: PRINT MSG 0x02D7, END: "{5B}How about a drugstore?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	loc_266DE
		trap	#$01			  ; Trap01Handler
		move.b	$00000016(sp,d6.w),(a3)

loc_266DE:					  ; CODE XREF: ROM:000266D6j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $2C9,$0		  ; Run	text script at offset 0x027D88
						  ; 0xA28B: PRINT MSG 0x02D8, END: "{5B}Hmmm....okay, then,{57}how about a variety shop?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	loc_266EE

loc_266E8:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $2CF,$0		  ; Run	text script at offset 0x027D94
						  ; 0xA290: PRINT MSG 0x02DD, END: "{5B}You agree?  Then it's{57}settled!  I'm a variety shop{57}owner from now on!{62}"
; ---------------------------------------------------------------------------
		bra.s	loc_266F4
; ---------------------------------------------------------------------------

loc_266EE:					  ; CODE XREF: ROM:000266E6j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $2CA,$0		  ; Run	text script at offset 0x027D8A
						  ; 0x828C: PRINT MSG 0x02D9: "{5B}Well, I've got the list of{57}possibilities narrowed down{57}to these two.  So......{62}"
						  ; 0x828D: PRINT MSG 0x02DA: "{5B}choose between the two.{57}I'll follow your advice.{62}"
						  ; 0xA28E: PRINT MSG 0x02DB, END: "{5B}Now, let's try once more.{62}"
; ---------------------------------------------------------------------------
		bra.s	loc_266CE
; ---------------------------------------------------------------------------

loc_266F4:					  ; CODE XREF: ROM:000266ECj
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $2D0,$0		  ; Run	text script at offset 0x027D96
						  ; 0x1552: SET	BIT 2 OF FLAG 0x02A
						  ; 0x8291: PRINT MSG 0x02DE: "{5B}By the way, would you{57}do me a favor?{57}I'd like you to go to the{62}"
						  ; 0x8292: PRINT MSG 0x02DF: "{5B}wholesale market at the{57}Mercator port warehouse.{57}It opens when	the ship from{62}"
						  ; 0x8293: PRINT MSG 0x02E0: "{5B}the continent docks here.{57}Please go to the market	and{57}pick up the goods for me.{62}"
						  ; 0x8294: PRINT MSG 0x02E1: "{5B}I'll stay here and fix things{57}up.  Bring this with you.{57}It's a Buyers' Guild card.{62}"
						  ; 0x0019: LOAD 0x0019	INTO 0xFF1196 (Buyer Card)
						  ; 0x77E8: RECEIVE ITEM [0xFF1196], MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

locret_266F8:					  ; CODE XREF: ROM:000266CCj
		rts
; ---------------------------------------------------------------------------

loc_266FA:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00DD			  ; Bit	5 of flag 0x01B
		ScriptID    $2D8,$1		  ; Flag clear:	Run text script	at offset 0x027DA6
						  ; 0x8296: PRINT MSG 0x02E3: "{5B}I received the goods, and I'm{57}doing quite well these days!{62}"
						  ; 0x8297: PRINT MSG 0x02E4: "{5B}I'm happy with my new{57}shop!  This is the turning{57}point of my life!{62}"
						  ; 0x8298: PRINT MSG 0x02E5: "{5B}I owe it all	to you,	Nigel!{62}"
						  ; 0x8299: PRINT MSG 0x02E6: "{5B}In return, I'd like to offer you{57}my bargain basement prices!{62}"
						  ; 0xE29A: PRINT MSG 0x02E7, MSGBOX CLEARED, END: "{5B}Drop by	anytime!{5E}"
		ScriptID    $2DD,$2		  ; Flag set:	Run text script	at offset 0x027DB0
						  ; 0xE29B: PRINT MSG 0x02E8, MSGBOX CLEARED, END: "{5B}We have	a large	stock{57}of unusual things!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_26706:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0152			  ; Bit	2 of flag 0x02A
		ScriptID    $2DE,$1		  ; Flag set:	Run text script	at offset 0x027DB2
						  ; 0x829C: PRINT MSG 0x02E9: "{5B}Was the market already{57}closed?  That's okay.{57}They'll open it up again.{62}"
						  ; 0xE29D: PRINT MSG 0x02EA, MSGBOX CLEARED, END: "{5B}I'll just stay here and{57}get things ready so I can{57}go for myself next month.{5E}"
		ScriptJump  loc_266B2,$2	  ; Flag clear:	Jump to	address	0x0366B2
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $2E0,$1		  ; Run	text script at offset 0x027DB6
						  ; 0xE29E: PRINT MSG 0x02EB, MSGBOX CLEARED, END: "{5B}Dad should have	checked{57}around town before{57}opening this shop...{5E}"
						  ;
		dc.w $0101			  ; Params 01, 01
		ScriptID    $2E1,$3		  ; Run	text script at offset 0x027DB8
						  ; 0xE29F: PRINT MSG 0x02EC, MSGBOX CLEARED, END: "{5B}My dad is thinking of{57}changing his job.{5E}"
						  ;
		dc.w $0102			  ; Params 01, 02
		ScriptJump  loc_2672C,$5	  ; Jump to address 0x02672C
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptJump  loc_26738,$7	  ; Jump to address 0x026738
						  ;
		dc.w $0103			  ; Params 01, 03
		ScriptID    $2E4,$9		  ; Run	text script at offset 0x027DBE
						  ; 0xE2A2: PRINT MSG 0x02EF, MSGBOX CLEARED, END: "{5B}My dad is a great shopkeeper.{57}I love	him.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_2672C:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0153			  ; Bit	3 of flag 0x02A
		ScriptID    $2E2,$1		  ; Flag set:	Run text script	at offset 0x027DBA
						  ; 0xE2A0: PRINT MSG 0x02ED, MSGBOX CLEARED, END: "{5B}I'm a drugstore owner's son{57}from now on!  Wow!{5E}"
		ScriptID    $2E3,$2		  ; Flag clear:	Run text script	at offset 0x027DBC
						  ; 0xE2A1: PRINT MSG 0x02EE, MSGBOX CLEARED, END: "{5B}I'm a variety shop owner's{57}son from now on! Wow!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_26738:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0152			  ; Bit	2 of flag 0x02A
		ScriptID    $2E4,$1		  ; Flag set:	Run text script	at offset 0x027DBE
						  ; 0xE2A2: PRINT MSG 0x02EF, MSGBOX CLEARED, END: "{5B}My dad is a great shopkeeper.{57}I love	him.{5E}"
		ScriptID    $2E0,$2		  ; Flag clear:	Run text script	at offset 0x027DB6
						  ; 0xE29E: PRINT MSG 0x02EB, MSGBOX CLEARED, END: "{5B}Dad should have	checked{57}around town before{57}opening this shop...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0018:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $00E4			  ; Bit	4 of flag 0x01C
		ScriptID    $659,$1		  ; Flag set:	Run text script	at offset 0x0284A8
						  ; 0x1BF6: LOAD SPECIAL CHARACTER Fahl	(0x0E)
						  ; 0xE579: PRINT MSG 0x05C6, MSGBOX CLEARED, END: "{5B}Imagine!  A little kid...{57}I need a vacation!{5E}"
		ScriptID    $2E5,$2		  ; Flag clear:	Run text script	at offset 0x027DC0
						  ; 0x7C30: LOAD CUSTOM	ACTION 0x30 (0x0121BC CSA_0030), MSGBOX	CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C2:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $2E7,$1		  ; Run	text script at offset 0x027DC4
						  ; 0x82A4: PRINT MSG 0x02F1: "{5B}It's quite embarrassing!  My son{57}goes to Madame.....Lard's{57}or something almost everyday!{62}"
						  ; 0xE2A5: PRINT MSG 0x02F2, MSGBOX CLEARED, END: "{5B}I just can't understand him!{57}Is it such a great place?{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $2E9,$3		  ; Run	text script at offset 0x027DC8
						  ; 0x82A6: PRINT MSG 0x02F3: "{5B}Mir lives in	that old tower,{57}but I hear he was in	town{57}long before the	duke.{62}"
						  ; 0xE2A7: PRINT MSG 0x02F4, MSGBOX CLEARED, END: "{5B}Apparently, the	duke expelled{57}him from Mercator because of{57}some hideous crime.....{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $2EB,$5		  ; Run	text script at offset 0x027DCC
						  ; 0x82A8: PRINT MSG 0x02F5: "{5B}Mir lives in	that old tower,{57}but I hear he was in	town{57}long before the	duke.{62}"
						  ; 0x82A9: PRINT MSG 0x02F6: "{5B}Apparently, the duke	expelled him{57}frome Mercator because of{57}some hideous crime.....{62}"
						  ; 0xE2AA: PRINT MSG 0x02F7, MSGBOX CLEARED, END: "{5B}Oh, I don't know if it's{57}true or not.  I just{57}heard it from a friend.{62}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $2EE,$7		  ; Run	text script at offset 0x027DD2
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0xE2AB: PRINT MSG 0x02F8, MSGBOX CLEARED, END: "{5B}The {5F} is a{57}precious ore.	It's only found{57}in the depths of Greenmaze.{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $2F0,$9		  ; Run	text script at offset 0x027DD6
						  ; 0xE2AC: PRINT MSG 0x02F9, MSGBOX CLEARED, END: "{5B}I haven't heard a thing{58}rom my relatives in Verla{57}for a while, now.....{5E}"
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $2F1,$B		  ; Run	text script at offset 0x027DD8
						  ; 0xE2AD: PRINT MSG 0x02FA, MSGBOX CLEARED, END: "{5B}I heard	that Duke Mercator{57}brought nothing but trouble{57}to	Verla as well.{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $2F2,$D		  ; Run	text script at offset 0x027DDA
						  ; 0xE2AE: PRINT MSG 0x02FB, MSGBOX CLEARED, END: "{5B}If General Arthur had been{57}killed, Mercator would be{57}a ghost town, now!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C3:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $2F3,$1		  ; Run	text script at offset 0x027DDC
						  ; 0xE2AF: PRINT MSG 0x02FC, MSGBOX CLEARED, END: "{5B}I disagree with	him.{57}I think	Madame Yard's{57}is a nice place.{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $2F4,$3		  ; Run	text script at offset 0x027DDE
						  ; 0xE2B0: PRINT MSG 0x02FD, MSGBOX CLEARED, END: "{5B}It's impossible to enter{57}Mir's tower because of{57}the barrier at the door...{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $2F5,$5		  ; Run	text script at offset 0x027DE0
						  ; 0xE2B1: PRINT MSG 0x02FE, MSGBOX CLEARED, END: "{5B}...Oh, it's you...{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $2F6,$7		  ; Run	text script at offset 0x027DE2
						  ; 0x82B2: PRINT MSG 0x02FF: "{5B}Greenmaze is	to the north{57}of the castle.	Many tourists{57}are reported missing there{62}"
						  ; 0xE2B3: PRINT MSG 0x0300, MSGBOX CLEARED, END: "{5B}each year, so the duke{57}prohibited all entry{57}into Greenmaze.{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $2F8,$9		  ; Run	text script at offset 0x027DE6
						  ; 0xE2B4: PRINT MSG 0x0301, MSGBOX CLEARED, END: "{5B}Duke Mercator is crazy with{57}greed over those	treasures.{57}Are they really so valuable?{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $2F9,$B		  ; Run	text script at offset 0x027DE8
						  ; 0xE2B5: PRINT MSG 0x0302, MSGBOX CLEARED, END: "{5B}I'm quite satisfied with{57}General Arthur's{57}administration.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C4:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $2FA,$1		  ; Run	text script at offset 0x027DEA
						  ; 0x82B6: PRINT MSG 0x0303: "{5B}I saw a great beauty{57}walking along the street.{57}Her two	attendants were...{62}"
						  ; 0xE2B7: PRINT MSG 0x0304, MSGBOX CLEARED, END: "{5B}....can	you guess?{57}They were	monsters!{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $2FC,$3		  ; Run	text script at offset 0x027DEE
						  ; 0xE2B8: PRINT MSG 0x0305, MSGBOX CLEARED, END: "{5B}Are you	going to defeat{57}the magician	in the tower?{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $2FD,$5		  ; Run	text script at offset 0x027DF0
						  ; 0xE2B9: PRINT MSG 0x0306, MSGBOX CLEARED, END: "{5B}Wow!{57}You came back alive!{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $2FE,$7		  ; Run	text script at offset 0x027DF2
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0xE2BA: PRINT MSG 0x0307, MSGBOX CLEARED, END: "{5B}But the	lighthouse cannot{57}exist without the {5F}!{57}Who would do such a thing?{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $300,$9		  ; Run	text script at offset 0x027DF6
						  ; 0x82BB: PRINT MSG 0x0308: "{5B}If the tunnel between Verla{57}and Mercator could be{57}re-opened, Verla would be just{62}"
						  ; 0x82BC: PRINT MSG 0x0309: "{5B}a step away.	 But a recent{57}earthquake blocked up the{57}tunnel.  So you can only{62}"
						  ; 0xE2BD: PRINT MSG 0x030A, MSGBOX CLEARED, END: "{5B}get to Verla by	sea, now.....{5E}"
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $303,$B		  ; Run	text script at offset 0x027DFC
						  ; 0xE2BE: PRINT MSG 0x030B, MSGBOX CLEARED, END: "{5B}One of my relatives{57}runs a shop in Verla.{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $304,$D		  ; Run	text script at offset 0x027DFE
						  ; 0xE2BF: PRINT MSG 0x030C, MSGBOX CLEARED, END: "{5B}General	Arthur struggled{57}with the Duke to the last.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0019:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $305,$1		  ; Run	text script at offset 0x027E00
						  ; 0x82C0: PRINT MSG 0x030D: "{5B}Would you like a fruit drink?{57}How	about my Dahl Delight?{62}"
						  ; 0xE2C1: PRINT MSG 0x030E, MSGBOX CLEARED, END: "{5B}It's the choice of a{57}new generation!{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $307,$3		  ; Run	text script at offset 0x027E04
						  ; 0x82C2: PRINT MSG 0x030F: "{5B}Duke	Mercator is now{57}recruiting mercenaries to{57}mount an attack	against	Mir.{62}"
						  ; 0xE2C3: PRINT MSG 0x0310, MSGBOX CLEARED, END: "{5B}They're having a victory{57}celebration in advance.{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $309,$5		  ; Run	text script at offset 0x027E08
						  ; 0xE2C4: PRINT MSG 0x0311, MSGBOX CLEARED, END: "{5B}Nigel!{57}Is it	true you defeated Mir?{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $30A,$7		  ; Run	text script at offset 0x027E0A
						  ; 0x82C5: PRINT MSG 0x0312: "{5B}Duke	Mercator ran out on{57}the town!  What a surprise!{62}"
						  ; 0xE2C6: PRINT MSG 0x0313, MSGBOX CLEARED, END: "{5B}What are we going to do{57}now?{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptJump  loc_267CC,$9	  ; Jump to address 0x0267CC
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_267CC:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $014A			  ; Bit	2 of flag 0x029
		ScriptID    $9F5,$1		  ; Flag set:	Run text script	at offset 0x028BE0
						  ; 0x1819: LOAD CHARACTER SCRIPT Owner	(0x0019)
						  ; 0xE7BB: PRINT MSG 0x0808, MSGBOX CLEARED, END: "{5B}Sorry...looks like{57}the system's out of order!{57}Ha ha ha!{5E}"
		ScriptID    $30C,$2		  ; Flag clear:	Run text script	at offset 0x027E0E
						  ; 0x82C7: PRINT MSG 0x0314: "{5B}I've remodeled!{57}You can order from upstairs{57}and not even get out of bed!{62}"
						  ; 0xE2C8: PRINT MSG 0x0315, MSGBOX CLEARED, END: "{5B}Go upstairs and{57}order something.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptJump  loc_267E6,$1	  ; Jump to address 0x0267E6
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $315,$3		  ; Run	text script at offset 0x027E20
						  ; 0x82D0: PRINT MSG 0x031D: "{5B}I felt a bit	sick, so I{57}came out here.  Princess{57}Lara?	 Well, she's...{62}"
						  ; 0x82D1: PRINT MSG 0x031E: "{5B}Particular...yes, particular!{57}Actually, she's{57}very hard to deal with.{62}"
						  ; 0xE2D2: PRINT MSG 0x031F, MSGBOX CLEARED, END: "{5B}Perhaps	her fussiness{57}irritated the Duke so much{57}he sent her back	home.....{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_267E6:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $30E,$0		  ; Run	text script at offset 0x027E12
						  ; 0x82C9: PRINT MSG 0x0316: "{5B}Where is she?...sigh!...{57}...where	is she now...{57}oh!  Are you a	tourist?{62}"
						  ; 0xA2CA: PRINT MSG 0x0317, END: "{5B}Will you hear my story?{58}"
; ---------------------------------------------------------------------------

loc_267EA:					  ; CODE XREF: ROM:000267FAj
		bsr.w	GetYesNoAnswer		  ; Params 61, 00
		bcc.s	loc_267F6		  ; Params 64, 06

loc_267F0:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $310,$0		  ; Run	text script at offset 0x027E16
						  ; 0x82CB: PRINT MSG 0x0318: "{5B}Needless to say, I'm Ludwig,{57}the world-famous composer{57}from the continent.{62}"
						  ; 0x82CC: PRINT MSG 0x0319: "{5B}Princess Lara came here{57}to study under me, but then...{62}"
						  ; 0x82CD: PRINT MSG 0x031A: "{5B}she just vanished!!{57}I'm afraid my lessons weren't{57}good enough for her...{62}"
						  ; 0xE2CE: PRINT MSG 0x031B, MSGBOX CLEARED, END: "{5B}She might at least say{57}good-bye before leaving...{57}Sigh!...how cute she was....{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_267FC
; ---------------------------------------------------------------------------

loc_267F6:					  ; CODE XREF: ROM:000267EEj
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $314,$0		  ; Run	text script at offset 0x027E1E
						  ; 0xA2CF: PRINT MSG 0x031C, END: "{5B}Oh, please listen....{58}"
; ---------------------------------------------------------------------------
		bra.s	loc_267EA
; ---------------------------------------------------------------------------

locret_267FC:					  ; CODE XREF: ROM:000267F4j
		rts
; ---------------------------------------------------------------------------

CS_00C5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $318,$1		  ; Run	text script at offset 0x027E26
						  ; 0xE2D3: PRINT MSG 0x0320, MSGBOX CLEARED, END: "{5B}That Ludwig is a bit of	a sap!{57}I think he's out of his head{57}over this princess babe....{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $319,$3		  ; Run	text script at offset 0x027E28
						  ; 0x82D4: PRINT MSG 0x0321: "{5B}Ludwig?  After returning{57}from the	castle,	he guzzled{62}"
						  ; 0xE2D5: PRINT MSG 0x0322, MSGBOX CLEARED, END: "{5B}six Diet Dahls.	 Six!  Then{57}he became unruly, so I{57}had to	throw him out.{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $31B,$5		  ; Run	text script at offset 0x027E2C
						  ; 0x82D6: PRINT MSG 0x0323: "{5B}How sensitive that Ludwig is!{57}He seemed so shocked when{57}I asked him to	leave.{62}"
						  ; 0x82D7: PRINT MSG 0x0324: "{5B}Now he's gone off{57}somewhere, probably to{57}lick his wounds.....{62}"
						  ; 0xE2D8: PRINT MSG 0x0325, MSGBOX CLEARED, END: "{5B}These artist types sure{57}are hard to understand.{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $31E,$7		  ; Run	text script at offset 0x027E32
						  ; 0xE2D9: PRINT MSG 0x0326, MSGBOX CLEARED, END: "{5B}General	Arthur's alive!{57}Happy, happy!  Joy!  Joy!{57}Let's party!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $31F,$1		  ; Run	text script at offset 0x027E34
						  ; 0xE2DA: PRINT MSG 0x0327, MSGBOX CLEARED, END: "{5B}Huzzah!	 Huzzah!  Let's hear{57}it for lower taxes!  Look out,{57}Mir, I'm comin' to getcha!{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $320,$3		  ; Run	text script at offset 0x027E36
						  ; 0x82DB: PRINT MSG 0x0328: "{5B}TOGA!  TOGA!	 TOGA!{57}Hey, you!  Barkeep!  Another{57}round	of Dahl	Delights!{62}"
						  ; 0xE2DC: PRINT MSG 0x0329, MSGBOX CLEARED, END: "{5B}Are the	taxes lowered yet?{57}Did they get that	Mir guy?{57}Who	cares?	Let's party!!{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $322,$5		  ; Run	text script at offset 0x027E3A
						  ; 0xE2DD: PRINT MSG 0x032A, MSGBOX CLEARED, END: "{5B}Have you been to the{57}casino yet?  It's exciting!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $323,$1		  ; Run	text script at offset 0x027E3C
						  ; 0x82DE: PRINT MSG 0x032B: "{5B}The men in this town{57}seem	to be falling{57}head over heels{62}"
						  ; 0xE2DF: PRINT MSG 0x032C, MSGBOX CLEARED, END: "{5B}for some new cutie{57}from the continent.....{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $325,$3		  ; Run	text script at offset 0x027E40
						  ; 0xE2E0: PRINT MSG 0x032D, MSGBOX CLEARED, END: "{5B}Welcome	back, hero!{57}...but...why so troubled?{57}Anything wrong?{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $326,$5		  ; Run	text script at offset 0x027E42
						  ; 0x82E1: PRINT MSG 0x032E: "{5B}Is the rumor	about the{57}Duke true?	 If so,	he must{57}really be a wicked man!{62}"
						  ; 0xE2E2: PRINT MSG 0x032F, MSGBOX CLEARED, END: "{5B}He was always smiling and{57}pretending	to serve the town.{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $328,$7		  ; Run	text script at offset 0x027E46
						  ; 0xE2E3: PRINT MSG 0x0330, MSGBOX CLEARED, END: "{5B}General	Arthur and his{57}new casino are the{57}talk of	the town now.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $329,$1		  ; Run	text script at offset 0x027E48
						  ; 0xE2E4: PRINT MSG 0x0331, MSGBOX CLEARED, END: "{5B}Take it	from me, kid!{57}Never,	never, NEVER give{57}your heart	to a girl!!{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $32A,$3		  ; Run	text script at offset 0x027E4A
						  ; 0xE2E5: PRINT MSG 0x0332, MSGBOX CLEARED, END: "{5B}Ah, Princess......{57}Zzzzzzzz.....{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptJump  loc_2684E,$5	  ; Jump to address 0x02684E
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_2684E:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $014A			  ; Bit	2 of flag 0x029
		ScriptID    $9F3,$1		  ; Flag set:	Run text script	at offset 0x028BDC
						  ; 0x18C8: LOAD CHARACTER SCRIPT * (0x00C8)
						  ; 0xE7BA: PRINT MSG 0x0807, MSGBOX CLEARED, END: "{5B}One more Ekenol	Punch!{57}{59}{59}...oops...{57}won't come up...{62}"
		ScriptID    $32B,$2		  ; Flag clear:	Run text script	at offset 0x027E4C
						  ; 0x7D2B: LOAD CUSTOM	ACTION 0x12B (0x0125A8 CSA_012B), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptJump  loc_26868,$1	  ; Jump to address 0x026868
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $32E,$3		  ; Run	text script at offset 0x027E52
						  ; 0xE2E8: PRINT MSG 0x0335, MSGBOX CLEARED, END: "{5B}Zzzzz...{57}Julie.....{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26868:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0028			  ; Bit	0 of flag 0x005
		ScriptID    $32D,$1		  ; Flag set:	Run text script	at offset 0x027E50
						  ; 0xE2E7: PRINT MSG 0x0334, MSGBOX CLEARED, END: "{5B}Not only do I feel sick{57}to my stomach, I think{57}I sprained	my ankle.....!{5E}"
		ScriptID    $32C,$2		  ; Flag clear:	Run text script	at offset 0x027E4E
						  ; 0xE2E6: PRINT MSG 0x0333, MSGBOX CLEARED, END: "{5B}I...feel sick...{57}to my stomach......{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00CA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $32F,$1		  ; Run	text script at offset 0x027E54
						  ; 0x82E9: PRINT MSG 0x0336: "{5B}Duke	Mercator is originally{57}from the continent, so he{57}often invites guests from his{62}"
						  ; 0x82EA: PRINT MSG 0x0337: "{5B}homeland.  Just recently, a{57}noble	girl named Lara	came{62}"
						  ; 0xE2EB: PRINT MSG 0x0338, MSGBOX CLEARED, END: "{5B}to study piano.	 I haven't{57}seen her around, lately, so{57}maybe she went home.....{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $332,$3		  ; Run	text script at offset 0x027E5A
						  ; 0x82EC: PRINT MSG 0x0339: "{5B}I heard about you!  You're{57}one of those mercenary{57}fellas who're going off to{62}"
						  ; 0xE2ED: PRINT MSG 0x033A, MSGBOX CLEARED, END: "{5B}defeat Mir and restore the{57}peace!  We're expecting much{57}from you!  Waste that wizard!{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $334,$5		  ; Run	text script at offset 0x027E5E
						  ; 0xE2EE: PRINT MSG 0x033B, MSGBOX CLEARED, END: "{5B}Hey, hero!  How'd the{57}fight against Mir go?{57}Are you OK?{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $335,$7		  ; Run	text script at offset 0x027E60
						  ; 0x82EF: PRINT MSG 0x033C: "{5B}If the terrible rumor{57}about the Duke is true, it{57}must be a lie	that it	was Mir{62}"
						  ; 0xE2F0: PRINT MSG 0x033D, MSGBOX CLEARED, END: "{5B}who caused the heavy tax.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $337,$1		  ; Run	text script at offset 0x027E64
						  ; 0x82F1: PRINT MSG 0x033E: "{5B}Our family has been serving{57}the castle for generations.{57}Now my	son is a cook, and{62}"
						  ; 0xE2F2: PRINT MSG 0x033F, MSGBOX CLEARED, END: "{5B}my daughter is a maid.{57}They work for	Duke Mercator.{57}You envy them, right?{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $339,$3		  ; Run	text script at offset 0x027E68
						  ; 0x82F3: PRINT MSG 0x0340: "{5B}My son told me that{57}you're going to the tower.{57}They say the tower{62}"
						  ; 0xE2F4: PRINT MSG 0x0341, MSGBOX CLEARED, END: "{5B}is full	of traps and snares.{57}Please be careful!....{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $33B,$5		  ; Run	text script at offset 0x027E6C
						  ; 0xE2F5: PRINT MSG 0x0342, MSGBOX CLEARED, END: "{5B}Oh, Nigel!{57}You came back from the tower!{57}Amazing!{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $33C,$7		  ; Run	text script at offset 0x027E6E
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0x82F6: PRINT MSG 0x0343: "{5B}What	a fool!{62}"
						  ; 0x82F7: PRINT MSG 0x0344: "{5B}Do you know the{57}importance of the{57}{5F}?{62}"
						  ; 0xE2F8: PRINT MSG 0x0345, MSGBOX CLEARED, END: "{5B}Go to Greenmaze	and{57}find the	{5F}{57}by yourself!{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $340,$9		  ; Run	text script at offset 0x027E76
						  ; 0xE2F9: PRINT MSG 0x0346, MSGBOX CLEARED, END: "{5B}Finally	he's seen the light!{57}We've been preaching to him{57}for six hours!{5E}"
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptJump  loc_268AC,$B	  ; Jump to address 0x0268AC
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $345,$D		  ; Run	text script at offset 0x027E80
						  ; 0xE2FE: PRINT MSG 0x034B, MSGBOX CLEARED, END: "{5B}That Arthur is quite an{57}able	statesman!  He opened{57}a casino to help lower	taxes!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_268AC:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $341,$0		  ; Prompt:	  Run text script at offset 0x027E78
						  ; 0xA2FA: PRINT MSG 0x0347, END: "{5B}Have you heard about{57}General	Arthur?{58}"
		ScriptID    $343,$1		  ; Answer 'yes': Run text script at offset 0x027E7C
						  ; 0x82FC: PRINT MSG 0x0349: "{5B}He was seriously injured...{57}Now he's under{57}strict medical care.{62}"
						  ; 0xE2FD: PRINT MSG 0x034A, MSGBOX CLEARED, END: "{5B}I think	General	Arthur is{57}worthy of becoming{57}Mercator's next ruler.{5E}"
		ScriptID    $342,$2		  ; Answer 'no':  Run text script at offset 0x027E7A
						  ; 0x82FB: PRINT MSG 0x0348: "{5B}He's in charge of the{57}castle guard, now.  He's still{57}worried about the Duke's plot.{62}"
						  ; 0x82FC: PRINT MSG 0x0349: "{5B}He was seriously injured...{57}Now he's under{57}strict medical care.{62}"
						  ; 0xE2FD: PRINT MSG 0x034A, MSGBOX CLEARED, END: "{5B}I think	General	Arthur is{57}worthy of becoming{57}Mercator's next ruler.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00CC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $346,$1		  ; Run	text script at offset 0x027E82
						  ; 0xE2FF: PRINT MSG 0x034C, MSGBOX CLEARED, END: "{5B}Heh, heh, heh...You'd better{57}leave....this place isn't for{57}sightseers.....heh, heh, heh...{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptJump  loc_268CA,$3	  ; Jump to address 0x0268CA
						  ;
		dc.w $0015			  ; Params 00, 15
		ScriptID    $34B,$5		  ; Run	text script at offset 0x027E8C
						  ; 0xE304: PRINT MSG 0x0351, MSGBOX CLEARED, END: "{5B}Heh heh, it was{57}good	practice for you,{57}wasn't it?...heh heh...{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_268CA:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $00A2			  ; Bit	2 of flag 0x014
		ScriptID    $34A,$1		  ; Flag set:	Run text script	at offset 0x027E8A
						  ; 0xE303: PRINT MSG 0x0350, MSGBOX CLEARED, END: "{5B}Both in	this world and{57}the one below...heh heh heh...{57}you	have to	use your brain.{5E}"
		ScriptID    $347,$2		  ; Flag clear:	Run text script	at offset 0x027E84
						  ; 0x8300: PRINT MSG 0x034D: "{5B}Ah, welcome...to the{57}Mercator Champion Motel!{57}Heros check in, but they{62}"
						  ; 0x8301: PRINT MSG 0x034E: "{5B}don't check out!.....{62}"
						  ; 0xE302: PRINT MSG 0x034F, MSGBOX CLEARED, END: "{5B}Well, heh heh...there it is,{57}the underground	crypt.{57}What're you waiting for?...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001B:					  ; Money won from Greenpea
		cmpi.w	#01600,(g_Vars+$1C).l
		blt.s	loc_268EC

loc_268E0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0008			  ; Bit	0 of flag 0x001
		ScriptID    $671,$1		  ; Flag set:	Run text script	at offset 0x0284D8
						  ; 0xE589: PRINT MSG 0x05D6, MSGBOX CLEARED, END: "{5B}Please!	 Go away...{57}Don't come back!{57}I beg you...{5E}"
		ScriptID    $66F,$2		  ; Flag clear:	Run text script	at offset 0x0284D4
						  ; 0x1408: SET	BIT 0 OF FLAG 0x001
						  ; 0xE588: PRINT MSG 0x05D5, MSGBOX CLEARED, END: "{5B}No-no-no!  Please...{57}get out!  You're some kind{57}of con-artist, aren't you?{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_268F6
; ---------------------------------------------------------------------------

loc_268EC:					  ; CODE XREF: ROM:000268DEj
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0008			  ; Bit	0 of flag 0x001
		ScriptID    $34D,$1		  ; Flag set:	Run text script	at offset 0x027E90
						  ; 0x8305: PRINT MSG 0x0352: "{5B}Stand in front of the{57}counter, jump and throw{62}"
						  ; 0xE306: PRINT MSG 0x0353, MSGBOX CLEARED, END: "{5B}It may be a little difficult,{57}but you'll get the hang of it!{5E}"
		ScriptID    $34C,$2		  ; Flag clear:	Run text script	at offset 0x027E8E
						  ; 0x7C34: LOAD CUSTOM	ACTION 0x34 (0x0121CC CSA_0034), MSGBOX	CLEARED, END
; ---------------------------------------------------------------------------

locret_268F6:					  ; CODE XREF: ROM:000268EAj
		rts
; ---------------------------------------------------------------------------

CS_00CD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $34F,$1		  ; Run	text script at offset 0x027E94
						  ; 0x17EA: PLAY MUSIC TRACK 36
						  ; 0xE307: PRINT MSG 0x0354, MSGBOX CLEARED, END: "{5B}Ba-pa-da-da, dee-da{57}GROW!  Soon you'll reap{57}ba-dee-da-do.....{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $351,$3		  ; Run	text script at offset 0x027E98
						  ; 0x17EA: PLAY MUSIC TRACK 36
						  ; 0xE308: PRINT MSG 0x0355, MSGBOX CLEARED, END: "{5B}Mom likes to sing!{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $353,$5		  ; Run	text script at offset 0x027E9C
						  ; 0x17EB: PLAY MUSIC TRACK 14
						  ; 0x8309: PRINT MSG 0x0356: "{5B}Weigh anchors, weigh, yo-ho,{57}Waves breaking, weigh yo-ho{57}Hey-hey!  I'll teach mom{62}"
						  ; 0xE30A: PRINT MSG 0x0357, MSGBOX CLEARED, END: "{5B}a new song!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $356,$1		  ; Run	text script at offset 0x027EA2
						  ; 0xE30B: PRINT MSG 0x0358, MSGBOX CLEARED, END: "{5B}I don't know who's been{57}teaching him, but my son{57}likes to sing strange songs...{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $357,$3		  ; Run	text script at offset 0x027EA4
						  ; 0x17EA: PLAY MUSIC TRACK 36
						  ; 0xE30C: PRINT MSG 0x0359, MSGBOX CLEARED, END: "{5B}Ba-pa-da-da, dee-da{57}GROW!  Soon you'll reap{57}ba-dee-da-do......I like it!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CF:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $359,$1		  ; Run	text script at offset 0x027EA8
						  ; 0xE30D: PRINT MSG 0x035A, MSGBOX CLEARED, END: "{5B}I'm a guard at the castle,{57}but I'm off duty today!{57}I'm going to Greenpea's!{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $35A,$3		  ; Run	text script at offset 0x027EAA
						  ; 0xE30E: PRINT MSG 0x035B, MSGBOX CLEARED, END: "{5B}It's said that the{57}underground monsters are much{57}more cunning than us!{5E}"
						  ;
		dc.w $0016			  ; Params 00, 16
		ScriptID    $35B,$5		  ; Run	text script at offset 0x027EAC
						  ; 0xE30F: PRINT MSG 0x035C, MSGBOX CLEARED, END: "{5B}We wish	you good luck!{57}While	you're at it{59}...{59}...can you{57}get the taxes lowered?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D0:
		move.w	#$001B,d0
		bsr.w	TestFlagBit
		beq.s	loc_2694A
		move.w	#$000F,d0
		bsr.w	TestFlagBit
		bne.s	loc_26944

loc_2693E:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $681,$0		  ; Run	text script at offset 0x0284F8
						  ; 0x18D0: LOAD CHARACTER SCRIPT * (0x00D0)
						  ; 0x8591: PRINT MSG 0x05DE: "{5B}Collecting jars is his hobby.{57}Scattering jars and	making{57}somebody put them back{62}"
						  ; 0xE592: PRINT MSG 0x05DF, MSGBOX CLEARED, END: "{5B}is my hobby.{5E}"
; ---------------------------------------------------------------------------
		bra.s	loc_26948
; ---------------------------------------------------------------------------

loc_26944:					  ; CODE XREF: ROM:0002693Cj
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $67F,$0		  ; Run	text script at offset 0x0284F4
						  ; 0x18D0: LOAD CHARACTER SCRIPT * (0x00D0)
						  ; 0xE590: PRINT MSG 0x05DD, MSGBOX CLEARED, END: "{5B}Please help me again.{5E}"
; ---------------------------------------------------------------------------

loc_26948:					  ; CODE XREF: ROM:00026942j
		bra.s	locret_2695E
; ---------------------------------------------------------------------------

loc_2694A:					  ; CODE XREF: ROM:00026932j
		move.w	#$001A,d0
		bsr.w	TestFlagBit
		bne.s	loc_2695A

loc_26954:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $35C,$0		  ; Run	text script at offset 0x027EAE
						  ; 0x7C38: LOAD CUSTOM	ACTION 0x38 (0x0121DC CSA_0038), MSGBOX	CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	locret_2695E
; ---------------------------------------------------------------------------

loc_2695A:					  ; CODE XREF: ROM:00026952j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $684,$0		  ; Run	text script at offset 0x0284FE
						  ; 0x18D0: LOAD CHARACTER SCRIPT * (0x00D0)
						  ; 0xE593: PRINT MSG 0x05E0, MSGBOX CLEARED, END: "{5B}I have a bad back.{57}Those jars are just{57}too heavy for me...{5E}"
; ---------------------------------------------------------------------------

locret_2695E:					  ; CODE XREF: ROM:loc_26948j
						  ; ROM:00026958j
		rts
; ---------------------------------------------------------------------------

CS_00D1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $35D,$1		  ; Run	text script at offset 0x027EB0
						  ; 0x8310: PRINT MSG 0x035D: "{5B}I used to work at{57}the castle in my younger days.{62}"
						  ; 0x8311: PRINT MSG 0x035E: "{5B}We almost never get invited{57}to the castle.  But I	carry{57}with me the memory{62}"
						  ; 0xE312: PRINT MSG 0x035F, MSGBOX CLEARED, END: "{5B}of its elegance...{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $360,$3		  ; Run	text script at offset 0x027EB6
						  ; 0xE313: PRINT MSG 0x0360, MSGBOX CLEARED, END: "{5B}The ship arrived from the{57}continent!	 Let's go to the{57}monthly market!{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $361,$5		  ; Run	text script at offset 0x027EB8
						  ; 0x8314: PRINT MSG 0x0361: "{5B}Y'know, the rumor must be{57}true.  When my husband went{57}to Ryuma, he saw a young man{62}"
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0x8315: PRINT MSG 0x0362: "{5B}casting the {5F} away.{57}It	was the	lighthouse keeper's{57}apprentice.  He questioned{62}"
						  ; 0x8316: PRINT MSG 0x0363: "{5B}the boy and found that{57}Duke Mercator duped him into{57}stealing the Sun Stone!{62}"
						  ; 0xE317: PRINT MSG 0x0364, MSGBOX CLEARED, END: "{5B}On hearing that, my husband{57}came back in a hurry, but{57}the	duke had already gone...{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $366,$7		  ; Run	text script at offset 0x027EC2
						  ; 0xE318: PRINT MSG 0x0365, MSGBOX CLEARED, END: "{5B}The interrogation is still{57}going on upstairs.{5E}"
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $367,$9		  ; Run	text script at offset 0x027EC4
						  ; 0x8319: PRINT MSG 0x0366: "{5B}They're still upstairs,{57}trying to set that young man{57}straight.  We have to prepare{62}"
						  ; 0xE31A: PRINT MSG 0x0367, MSGBOX CLEARED, END: "{5B}for the	future.....{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $369,$B		  ; Run	text script at offset 0x027EC8
						  ; 0xE31B: PRINT MSG 0x0368, MSGBOX CLEARED, END: "{5B}Remember the lighthouse{57}apprentice?	He's working{57}under General Arthur, now!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D2:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $36A,$1		  ; Run	text script at offset 0x027ECA
						  ; 0x831C: PRINT MSG 0x0369: "{5B}My friend works at the{57}castle, see,  and he says{57}there's a labyrinth in the{62}"
						  ; 0xE31D: PRINT MSG 0x036A, MSGBOX CLEARED, END: "{5B}basement.  And that's not all!{57}It's fulla creepy monsters,{57}too!  Yuckk!  Disgusting!{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $36C,$3		  ; Run	text script at offset 0x027ECE
						  ; 0x831E: PRINT MSG 0x036B: "{5B}My friend also said that{57}rogues and criminals are{57}being held prisoner in the{62}"
						  ; 0xE31F: PRINT MSG 0x036C, MSGBOX CLEARED, END: "{5B}castle's underground prisons!!{57}Whaddaya think of that?!{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $36E,$5		  ; Run	text script at offset 0x027ED2
						  ; 0x8320: PRINT MSG 0x036D: "{5B}Pop and the others are{57}upstairs grilling the{57}apprentice.  He's the one who{62}"
						  ; 0xE321: PRINT MSG 0x036E, MSGBOX CLEARED, END: "{5B}broke into the lighthouse.{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $370,$7		  ; Run	text script at offset 0x027ED6
						  ; 0xE322: PRINT MSG 0x036F, MSGBOX CLEARED, END: "{5B}Yeah, they're still upstairs.{57}I think he's had enough.....{5E}"
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $371,$9		  ; Run	text script at offset 0x027ED8
						  ; 0xE323: PRINT MSG 0x0370, MSGBOX CLEARED, END: "{5B}Somebody must take over{57}at the castle to keep order{57}in this town!{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $372,$B		  ; Run	text script at offset 0x027EDA
						  ; 0xE324: PRINT MSG 0x0371, MSGBOX CLEARED, END: "{5B}My dad and his friends{57}are upstairs discussing{57}the new casino.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001C:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $373,$0		  ; Run	text script at offset 0x027EDC
						  ; 0xE325: PRINT MSG 0x0372, MSGBOX CLEARED, END: "{5B}A traditional town,{57}Mercator.  You have to behave{57}properly here.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00D3:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $374,$0		  ; Run	text script at offset 0x027EDE
						  ; 0xE326: PRINT MSG 0x0373, MSGBOX CLEARED, END: "{5B}I hope the evil	magician{57}is defeated	soon...and{57}our taxes	get lowered.....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00D4:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $375,$0		  ; Run	text script at offset 0x027EE0
						  ; 0x8327: PRINT MSG 0x0374: "{5B}Duke	Mercator is a kind{57}and friendly man.	 He came{57}downtown the other day and{62}"
						  ; 0xE328: PRINT MSG 0x0375, MSGBOX CLEARED, END: "{5B}spoke to each of us in{57}person.  I was{57}deeply impressed.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00D5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $377,$1		  ; Run	text script at offset 0x027EE4
						  ; 0xE329: PRINT MSG 0x0376, MSGBOX CLEARED, END: "{5B}Duke Mercator is{57}WONderful!	He looks so{57}gentle, mild, and refined.{5E}"
						  ;
		dc.w $000E			  ; Params 00, 0E
		ScriptID    $378,$3		  ; Run	text script at offset 0x027EE6
						  ; 0x832A: PRINT MSG 0x0377: "{5B}Duke	Mercator is{57}WONderful!  He looks so{57}gentle, mild,	and refined.{62}"
						  ; 0xE32B: PRINT MSG 0x0378, MSGBOX CLEARED, END: "{5B}Hello, sir!{57}Don't you look nice.....{5E}"
						  ;
		dc.w $000F			  ; Params 00, 0F
		ScriptID    $377,$5		  ; Run	text script at offset 0x027EE4
						  ; 0xE329: PRINT MSG 0x0376, MSGBOX CLEARED, END: "{5B}Duke Mercator is{57}WONderful!	He looks so{57}gentle, mild, and refined.{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $37A,$7		  ; Run	text script at offset 0x027EEA
						  ; 0xE32C: PRINT MSG 0x0379, MSGBOX CLEARED, END: "{5B}Well?  How was it?{57}You saw Duke Mercator, right?{57}I envy you!{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $37B,$9		  ; Run	text script at offset 0x027EEC
						  ; 0xE32D: PRINT MSG 0x037A, MSGBOX CLEARED, END: "{5B}Well?  How'd it go?{57}You saw Mir, right?  Was he{57}as strong as they say?{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $37C,$B		  ; Run	text script at offset 0x027EEE
						  ; 0x832E: PRINT MSG 0x037B: "{5B}What?  Duke Mercator	was{57}really a	wicked man?...Oh,{57}I saw him going to	port{62}"
						  ; 0xE32F: PRINT MSG 0x037C, MSGBOX CLEARED, END: "{5B}with his soldiers{57}just a little while ago...{57}What's going on?{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $37E,$D		  ; Run	text script at offset 0x027EF2
						  ; 0xE330: PRINT MSG 0x037D, MSGBOX CLEARED, END: "{5B}The duke was really one	of{57}the bad guys?  I should have{57}listened to you before.....{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $37F,$F		  ; Run	text script at offset 0x027EF4
						  ; 0x8331: PRINT MSG 0x037E: "{5B}We're getting used to{57}life without Duke Mercator.{57}What on earth could he be{62}"
						  ; 0xE332: PRINT MSG 0x037F, MSGBOX CLEARED, END: "{5B}doing now?  What?  He's{57}still looking for the{57}treasures?  Hmmm.....!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $381,$1		  ; Run	text script at offset 0x027EF8
						  ; 0xE333: PRINT MSG 0x0380, MSGBOX CLEARED, END: "{5B}This fortuneteller is famous{57}around here.  She can cast an{57}awesome spell on us!{5E}"
						  ;
		dc.w $000E			  ; Params 00, 0E
		ScriptID    $382,$3		  ; Run	text script at offset 0x027EFA
						  ; 0x8334: PRINT MSG 0x0381: "{5B}Heh heh...I know, I know.{57}You asked her to cast a	spell{57}upon you, didn't you?{62}"
						  ; 0xE335: PRINT MSG 0x0382, MSGBOX CLEARED, END: "{5B}Well, go ahead!	 Madame{57}Yard's is just across the way.{5E}"
						  ;
		dc.w $000F			  ; Params 00, 0F
		ScriptID    $381,$5		  ; Run	text script at offset 0x027EF8
						  ; 0xE333: PRINT MSG 0x0380, MSGBOX CLEARED, END: "{5B}This fortuneteller is famous{57}around here.  She can cast an{57}awesome spell on us!{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $384,$7		  ; Run	text script at offset 0x027EFE
						  ; 0xE336: PRINT MSG 0x0383, MSGBOX CLEARED, END: "{5B}Her sorcery is so famous that{57}many people come all the way{57}from the mainland to see her.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $385,$1		  ; Run	text script at offset 0x027F00
						  ; 0xE337: PRINT MSG 0x0384, MSGBOX CLEARED, END: "{5B}How come a doghouse occupies{57}the best place in the town?{57}I just don't understand!{5E}"
						  ;
		dc.w $000E			  ; Params 00, 0E
		ScriptID    $386,$3		  ; Run	text script at offset 0x027F02
						  ; 0xE338: PRINT MSG 0x0385, MSGBOX CLEARED, END: "{5B}Well, I	want to	buy this{57}estate, but...is this dog{57}going to sell,	or what?{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $387,$5		  ; Run	text script at offset 0x027F04
						  ; 0xE339: PRINT MSG 0x0386, MSGBOX CLEARED, END: "{5B}Who actually owns this{57}estate, anyway?...{57}Duke Mercator, perhaps?.....{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $388,$7		  ; Run	text script at offset 0x027F06
						  ; 0xE33A: PRINT MSG 0x0387, MSGBOX CLEARED, END: "{5B}Did you	know the duke{57}has fled?  Where will we be{57}without	him?{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $389,$9		  ; Run	text script at offset 0x027F08
						  ; 0x833B: PRINT MSG 0x0388: "{5B}See the sign?{62}"
						  ; 0xE33C: PRINT MSG 0x0389, MSGBOX CLEARED, END: "{5B}Now's my chance...{57}I've got the best plot of land{57}in all of Mercator!{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $38B,$B		  ; Run	text script at offset 0x027F0C
						  ; 0xE33D: PRINT MSG 0x038A, MSGBOX CLEARED, END: "{5B}Rats!  I've got the land,{57}but...now I have no money{57}to build a house on it!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $38C,$1		  ; Run	text script at offset 0x027F0E
						  ; 0xE33E: PRINT MSG 0x038B, MSGBOX CLEARED, END: "{5B}Mercator Harbor	is to the{57}south.  We	have a regular{57}liner	from the continent.{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $38D,$3		  ; Run	text script at offset 0x027F10
						  ; 0xE33F: PRINT MSG 0x038C, MSGBOX CLEARED, END: "{5B}Our supply of goods will{57}flourish when the ship{57}arrives.{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $38E,$5		  ; Run	text script at offset 0x027F12
						  ; 0xE340: PRINT MSG 0x038D, MSGBOX CLEARED, END: "{5B}Good heavens!  The ship{57}can't leave because of the{57}trouble with the lighthouse!{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $38F,$7		  ; Run	text script at offset 0x027F14
						  ; 0x8341: PRINT MSG 0x038E: "{5B}Good	heavens!  The ship{57}can't leave because of the{57}trouble with the lighthouse!{62}"
						  ; 0xE342: PRINT MSG 0x038F, MSGBOX CLEARED, END: "{5B}Good heavens, the.....oh!{57}You fixed it?{57}Great!{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $391,$9		  ; Run	text script at offset 0x027F18
						  ; 0xE343: PRINT MSG 0x0390, MSGBOX CLEARED, END: "{5B}Did you	hear about the new{57}casino that opened recently?{57}It's an exciting place!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D9:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $392,$0		  ; Run	text script at offset 0x027F1A
						  ; 0xE344: PRINT MSG 0x0391, MSGBOX CLEARED, END: "{5B}I often	watch the officers{57}of the castle go in and out.{57}What do they do inside...?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00DA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $393,$1		  ; Run	text script at offset 0x027F1C
						  ; 0xE345: PRINT MSG 0x0392, MSGBOX CLEARED, END: "{5B}When I grow up,	I'll be a{57}member of the Royal Guard{57}and serve Duke Mercator.{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $394,$3		  ; Run	text script at offset 0x027F1E
						  ; 0xE346: PRINT MSG 0x0393, MSGBOX CLEARED, END: "{5B}Are you	really going{57}to the Tower of	Mir?  Are you{57}tired of living, or what?!!{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $395,$5		  ; Run	text script at offset 0x027F20
						  ; 0xE347: PRINT MSG 0x0394, MSGBOX CLEARED, END: "{5B}Welcome	back!{57}We thought you	were dead!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00DB:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $396,$0		  ; Run	text script at offset 0x027F22
						  ; 0xE348: PRINT MSG 0x0395, MSGBOX CLEARED, END: "{5B}I'm watching for invaders{57}from the tower.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00DC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $397,$1		  ; Run	text script at offset 0x027F24
						  ; 0xE349: PRINT MSG 0x0396, MSGBOX CLEARED, END: "{5B}Bow-wow!  Bow-wow!{5E}"
						  ;
		dc.w $0019			  ; Params 00, 19
		ScriptID    $398,$3		  ; Run	text script at offset 0x027F26
						  ; 0xE34A: PRINT MSG 0x0397, MSGBOX CLEARED, END: "{5B}I didn't mean to take{57}the best spot in town!.....{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptJump  loc_26A6C,$1	  ; Jump to address 0x026A6C
						  ;
		dc.w $000C			  ; Params 00, 0C
		ScriptID    $39B,$3		  ; Run	text script at offset 0x027F2C
						  ; 0xE34C: PRINT MSG 0x0399, MSGBOX CLEARED, END: "{5B}Mom's work is almost{57}over for the day.{5E}"
						  ;
		dc.w $000E			  ; Params 00, 0E
		ScriptID    $39C,$5		  ; Run	text script at offset 0x027F2E
						  ; 0xE34D: PRINT MSG 0x039A, MSGBOX CLEARED, END: "{5B}Madame Yard is my mom.{57}She'll be closing up for the{57}day, soon.  I bet she's tired!{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $39D,$7		  ; Run	text script at offset 0x027F30
						  ; 0x834E: PRINT MSG 0x039B: "{5B}Mom and I are going to the{57}continent to open up a	new{57}franchise.  Please stop by!{62}"
						  ; 0xE34F: PRINT MSG 0x039C, MSGBOX CLEARED, END: "{5B}What?  Oh, you can{57}see what our business is{57}when you come!{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $39F,$9		  ; Run	text script at offset 0x027F34
						  ; 0xE350: PRINT MSG 0x039D, MSGBOX CLEARED, END: "{5B}Please fix the lighthouse{57}for my mom	and me!{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $3A0,$B		  ; Run	text script at offset 0x027F36
						  ; 0xE351: PRINT MSG 0x039E, MSGBOX CLEARED, END: "{5B}I've never been to the{57}continent before.  I was born{57}and raised on this island.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26A6C:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $002A			  ; Bit	2 of flag 0x005
		ScriptID    $39A,$1		  ; Flag set:	Run text script	at offset 0x027F2A
						  ; 0xE34B: PRINT MSG 0x0398, MSGBOX CLEARED, END: "{5B}I can tell you're a{57}real ladykiller...{5E}"
		ScriptID    $399,$2		  ; Flag clear:	Run text script	at offset 0x027F28
						  ; 0x7C2F: LOAD CUSTOM	ACTION 0x2F (0x0121B8 CSA_002F), MSGBOX	CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00DD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $3A1,$1		  ; Run	text script at offset 0x027F38
						  ; 0x8352: PRINT MSG 0x039F: "{5B}I was robbed!{57}That Greenpea's...{57}Absolutely robbed!{62}"
						  ; 0xE353: PRINT MSG 0x03A0, MSGBOX CLEARED, END: "{5B}I'm a corpse!  My wife'll kill{57}me!  How'm I gonna...I know!{57}I'll say I lost my wallet.....{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $3A3,$3		  ; Run	text script at offset 0x027F3C
						  ; 0xE354: PRINT MSG 0x03A1, MSGBOX CLEARED, END: "{5B}I want to enjoy	life{57}once again!  I'll ask her to{57}cast a spell on me!{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $3A4,$5		  ; Run	text script at offset 0x027F3E
						  ; 0xE355: PRINT MSG 0x03A2, MSGBOX CLEARED, END: "{5B}I'm young!{57}I'm young again!{57}Hurray!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00DE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $3A5,$1		  ; Run	text script at offset 0x027F40
						  ; 0xE356: PRINT MSG 0x03A3, MSGBOX CLEARED, END: "{5B}Oh, Fahl my love,{57}When will you see me?{57}I'm always thinking of you.{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $3A6,$3		  ; Run	text script at offset 0x027F42
						  ; 0xE357: PRINT MSG 0x03A4, MSGBOX CLEARED, END: "{5B}See?  See!{57}What is that girl	doing in{57}his	room!  I can't stand it!{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $3A7,$5		  ; Run	text script at offset 0x027F44
						  ; 0x8358: PRINT MSG 0x03A5: "{5B}Hear	that?  Fahl has	been{57}talking	with that girl{57}all night long...!{62}"
						  ; 0xE359: PRINT MSG 0x03A6, MSGBOX CLEARED, END: "{5B}I'm getting jealous...!{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $3A9,$7		  ; Run	text script at offset 0x027F48
						  ; 0xE35A: PRINT MSG 0x03A7, MSGBOX CLEARED, END: "{5B}I think	it's time I{57}gave him up...{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00DF:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $3AA,$0		  ; Run	text script at offset 0x027F4A
						  ; 0x835B: PRINT MSG 0x03A8: "{5B}Mr. Fahl has	many fans.{57}I'll admit he's strong and{57}tough, but......{62}"
						  ; 0xE35C: PRINT MSG 0x03A9, MSGBOX CLEARED, END: "{5B}he's so old!  Why do{57}the girls all go for him?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $3AC,$1		  ; Run	text script at offset 0x027F4E
						  ; 0xE35D: PRINT MSG 0x03AA, MSGBOX CLEARED, END: "{5B}I'm not sure when the{57}next ship comes.....{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $3AD,$3		  ; Run	text script at offset 0x027F50
						  ; 0xE35E: PRINT MSG 0x03AB, MSGBOX CLEARED, END: "{5B}I just heard some horrible{57}screams....are my	ears{57}playing	tricks on me?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $3AE,$1		  ; Run	text script at offset 0x027F52
						  ; 0x835F: PRINT MSG 0x03AC: "{5B}To tell the truth,{57}I'm a soldier from the castle.{57}It's my duty to stand guard{62}"
						  ; 0xE360: PRINT MSG 0x03AD, MSGBOX CLEARED, END: "{5B}here in	disguise.{57}I'm proud of this job!{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $3B0,$3		  ; Run	text script at offset 0x027F56
						  ; 0xE361: PRINT MSG 0x03AE, MSGBOX CLEARED, END: "{5B}You're going to the{57}tower too?{57}How bold you guys are!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E2:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $3B1,$1		  ; Run	text script at offset 0x027F58
						  ; 0x8362: PRINT MSG 0x03AF: "{5B}I don't know why, but{57}chills run up and down my{57}spine every time I'm{62}"
						  ; 0xE363: PRINT MSG 0x03B0, MSGBOX CLEARED, END: "{5B}near this place....Brrr!{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $3B3,$3		  ; Run	text script at offset 0x027F5C
						  ; 0xE364: PRINT MSG 0x03B1, MSGBOX CLEARED, END: "{5B}Zak and	Dexter?{57}They	went down to the{57}crypt some time ago.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E3:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $3B4,$0		  ; Run	text script at offset 0x027F5E
						  ; 0x8365: PRINT MSG 0x03B2: "{5B}Hi!	You're another{57}treasure hunter, aren't you?{57}We seem to get a lot of them{62}"
						  ; 0xE366: PRINT MSG 0x03B3, MSGBOX CLEARED, END: "{5B}here lately.....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E4:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $3B6,$0		  ; Run	text script at offset 0x027F62
						  ; 0xE367: PRINT MSG 0x03B4, MSGBOX CLEARED, END: "{5B}Wh...Who are you!{57}I'm busy.  Dont bother me!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptJump  loc_26AFA,$1	  ; Jump to address 0x026AFA
						  ;
		dc.w $000F			  ; Params 00, 0F
		ScriptID    $3B9,$3		  ; Run	text script at offset 0x027F68
						  ; 0xE369: PRINT MSG 0x03B6, MSGBOX CLEARED, END: "{5B}Mr. Nigel!  General Arthur{57}told us to let you go in.{57}Please go ahead.{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $3BA,$5		  ; Run	text script at offset 0x027F6A
						  ; 0xE36A: PRINT MSG 0x03B7, MSGBOX CLEARED, END: "{5B}I'd like to come along and{57}help, but standing here is{57}an important duty!{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptJump  loc_26B06,$7	  ; Jump to address 0x026B06
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $3BE,$9		  ; Run	text script at offset 0x027F72
						  ; 0xE36C: PRINT MSG 0x03B9, MSGBOX CLEARED, END: "{5B}Standing here like this{57}has been my dream!{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $3BF,$B		  ; Run	text script at offset 0x027F74
						  ; 0xE36D: PRINT MSG 0x03BA, MSGBOX CLEARED, END: "{5B}Welcome	to the castle{57}of Arthur!  Anybody can go{57}through this gate!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26AFA:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $3B7,$0		  ; Run	text script at offset 0x027F64
						  ; 0x14C8: SET	BIT 0 OF FLAG 0x019
						  ; 0xE368: PRINT MSG 0x03B5, MSGBOX CLEARED, END: "{5B}This is	the castle of{57}Mercator.{57}I	cannot allow you inside.{5E}"
; ---------------------------------------------------------------------------

loc_26AFE:					  ; CODE XREF: ROM:00026B34j
		move.w	#$00C6,d0
		bra.w	loc_26640
; ---------------------------------------------------------------------------

loc_26B06:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00DC			  ; Bit	4 of flag 0x01B
		ScriptID    $3BB,$1		  ; Flag clear:	Run text script	at offset 0x027F6C
						  ; 0x7CEF: LOAD CUSTOM	ACTION 0xEF (0x0124B8 CSA_00EF), MSGBOX	CLEARED, END
		ScriptID    $3BD,$2		  ; Flag set:	Run text script	at offset 0x027F70
						  ; 0xE36B: PRINT MSG 0x03B8, MSGBOX CLEARED, END: "{5B}Company--salute!{57}Do come in!	 Duke Mercator{57}is waiting for you!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptJump  loc_26B30,$1	  ; Jump to address 0x026B30
						  ;
		dc.w $000F			  ; Params 00, 0F
		ScriptID    $3C3,$3		  ; Run	text script at offset 0x027F7C
						  ; 0xE370: PRINT MSG 0x03BD, MSGBOX CLEARED, END: "{5B}Are you	Nigel?	Hmmm...{57}...younger than I thought...{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $3C4,$5		  ; Run	text script at offset 0x027F7E
						  ; 0x8371: PRINT MSG 0x03BE: "{5B}Going off to	defeat Mir, eh?{57}Hope	your mama's got{57}something black to wear!{62}"
						  ; 0xE372: PRINT MSG 0x03BF, MSGBOX CLEARED, END: "{5B}Hahahahaha!!{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptJump  loc_26B36,$7	  ; Jump to address 0x026B36
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $3C7,$9		  ; Run	text script at offset 0x027F84
						  ; 0xE374: PRINT MSG 0x03C1, MSGBOX CLEARED, END: "{5B}You!  Halt!{57}...Heh heh, just	kidding!{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $3C8,$B		  ; Run	text script at offset 0x027F86
						  ; 0x17EB: PLAY MUSIC TRACK 14
						  ; 0xE375: PRINT MSG 0x03C2, MSGBOX CLEARED, END: "{5B}We are the first{57}kid-gatekeepers of{57}this castle.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26B30:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $3C0,$0		  ; Run	text script at offset 0x027F76
						  ; 0x14C8: SET	BIT 0 OF FLAG 0x019
						  ; 0x836E: PRINT MSG 0x03BB: "{5B}You have not	been invited{57}by Duke	Mercator, have you?{62}"
						  ; 0xE36F: PRINT MSG 0x03BC, MSGBOX CLEARED, END: "{5B}This is	not a place for{57}dirty little	kids like you!{57}Get out of here!{5E}"
; ---------------------------------------------------------------------------
		bra.s	loc_26AFE
; ---------------------------------------------------------------------------

loc_26B36:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00DC			  ; Bit	4 of flag 0x01B
		ScriptID    $3BB,$1		  ; Flag clear:	Run text script	at offset 0x027F6C
						  ; 0x7CEF: LOAD CUSTOM	ACTION 0xEF (0x0124B8 CSA_00EF), MSGBOX	CLEARED, END
		ScriptID    $3C6,$2		  ; Flag set:	Run text script	at offset 0x027F82
						  ; 0xE373: PRINT MSG 0x03C0, MSGBOX CLEARED, END: "{5B}Nigel!	You're alive!! I'm{57}impressed!  Duke Mercator will{57}praise you for your boldness!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E7:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $3CA,$0		  ; Run	text script at offset 0x027F8A
						  ; 0xE376: PRINT MSG 0x03C3, MSGBOX CLEARED, END: "{5B}Co-cock-o-o-oooo...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E8:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0028			  ; Bit	0 of flag 0x005
		ScriptID    $3CC,$1		  ; Flag set:	Run text script	at offset 0x027F8E
						  ; 0xE377: PRINT MSG 0x03C4, MSGBOX CLEARED, END: "{5B}Why do men act like fools{57}when they fall in love?!{5E}"
		ScriptID    $3CB,$2		  ; Flag clear:	Run text script	at offset 0x027F8C
						  ; 0x7C29: LOAD CUSTOM	ACTION 0x29 (0x0121A0 CSA_0029), MSGBOX	CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptJump  loc_26B72,$1	  ; Jump to address 0x026B72
						  ;
		dc.w $0012			  ; Params 00, 12
		ScriptID    $49D,$3		  ; Run	text script at offset 0x028130
						  ; 0x8439: PRINT MSG 0x0486: "{5B}I think the party{57}is ready now.{62}"
						  ; 0xE43A: PRINT MSG 0x0487, MSGBOX CLEARED, END: "{5B}Why dost thou not go{57}to the banquet room?{5E}"
						  ;
		dc.w $0013			  ; Params 00, 13
		ScriptJump  loc_26B8A,$5	  ; Jump to address 0x026B8A
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptJump  loc_26B96,$7	  ; Jump to address 0x026B96
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptJump  loc_26BA2,$9	  ; Jump to address 0x026BA2
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptJump  loc_26BAE,$B	  ; Jump to address 0x026BAE
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26B72:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00CE			  ; Bit	6 of flag 0x019
		ScriptID    $49A,$1		  ; Flag clear:	Run text script	at offset 0x02812A
						  ; 0x7C51: LOAD CUSTOM	ACTION 0x51 (0x012240 CSA_0051), MSGBOX	CLEARED, END
		ScriptJump  loc_26B7E,$2	  ; Flag set:	Jump to	address	0x026B7E
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_26B7E:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $00DB			  ; Bit	3 of flag 0x01B
		ScriptID    $49C,$1		  ; Flag set:	Run text script	at offset 0x02812E
						  ; 0x1493: SET	BIT 3 OF FLAG 0x012
						  ; 0x8439: PRINT MSG 0x0486: "{5B}I think the party{57}is ready now.{62}"
						  ; 0xE43A: PRINT MSG 0x0487, MSGBOX CLEARED, END: "{5B}Why dost thou not go{57}to the banquet room?{5E}"
		ScriptID    $49B,$2		  ; Flag clear:	Run text script	at offset 0x02812C
						  ; 0xE438: PRINT MSG 0x0485, MSGBOX CLEARED, END: "{5B}Sir Nigel, welcome to{57}the castle.  Enjoy thy	stay!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_26B8A:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00CF			  ; Bit	7 of flag 0x019
		ScriptID    $49F,$1		  ; Flag clear:	Run text script	at offset 0x028134
						  ; 0x843B: PRINT MSG 0x0488: "{5B}Art thou really going to{57}the tower?  'Tis a very{57}dangerous place!{62}"
						  ; 0x843C: PRINT MSG 0x0489: "{5B}Didst thou know there{57}is a magic barrier at the{57}entrance to the tower?{62}"
						  ; 0x843D: PRINT MSG 0x048A: "{5B}My investigations revealed{57}that an armlet	is necessary{57}to break the barrier{62}"
						  ; 0x843E: PRINT MSG 0x048B: "{5B}'Tis somewhere in the{57}underground crypt next to the{57}church.  I keep sending{62}"
						  ; 0x843F: PRINT MSG 0x048C: "{5B}my best scouts in there,{57}but somehow they	never{57}seem to return...I think{62}"
						  ; 0xE440: PRINT MSG 0x048D, MSGBOX CLEARED, END: "{5B}there must be traps or{57}some such protecting the{57}armlet.{5E}"
		ScriptID    $4A5,$2		  ; Flag set:	Run text script	at offset 0x028140
						  ; 0xE441: PRINT MSG 0x048E, MSGBOX CLEARED, END: "{5B}Sir Nigel!{57}Get the armlet and{57}defeat Mir for the Duke!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_26B96:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00D1			  ; Bit	1 of flag 0x01A
		ScriptID    $4A6,$1		  ; Flag clear:	Run text script	at offset 0x028142
						  ; 0x8442: PRINT MSG 0x048F: "{5B}Dexter and Zak came through{57}here a little	while ago.  They{57}asked me how to break the{62}"
						  ; 0x8443: PRINT MSG 0x0490: "{5B}barrier, and	left for{57}the	crypt.	Sir Nigel,{57}I	must warn you that{62}"
						  ; 0x8444: PRINT MSG 0x0491: "{5B}the monsters	down there{57}are very intelligent.  Perhaps{57}Mir cast a spell on them.{62}"
						  ; 0x8445: PRINT MSG 0x0492: "{5B}Remember- thou can'st{57}find the armlet if thou dost{57}rely on thy sword alone.{62}"
						  ; 0xE446: PRINT MSG 0x0493, MSGBOX CLEARED, END: "{5B}Take care of thyself!{5E}"
		ScriptID    $4AA,$2		  ; Flag set:	Run text script	at offset 0x02814A
						  ; 0xE446: PRINT MSG 0x0493, MSGBOX CLEARED, END: "{5B}Take care of thyself!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_26BA2:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00D5			  ; Bit	5 of flag 0x01A
		ScriptID    $4AB,$1		  ; Flag clear:	Run text script	at offset 0x02814C
						  ; 0x7CB5: LOAD CUSTOM	ACTION 0xB5 (0x0123D0 CSA_00B5), MSGBOX	CLEARED, END
		ScriptID    $4AC,$2		  ; Flag set:	Run text script	at offset 0x02814E
						  ; 0xE447: PRINT MSG 0x0494, MSGBOX CLEARED, END: "{5B}...go...upstairs{57}and... cut the... armor{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_26BAE:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00DE			  ; Bit	6 of flag 0x01B
		ScriptID    $4AD,$1		  ; Flag clear:	Run text script	at offset 0x028150
						  ; 0x8448: PRINT MSG 0x0495: "{5B}Nice	to see thee again.{57}As thou dost see,	I'm{57}completely healed now.{62}"
						  ; 0x8449: PRINT MSG 0x0496: "{5B}I'll do my best to make{57}Mercator a good home for its{57}people.{62}"
						  ; 0x844A: PRINT MSG 0x0497: "{5B}I've been thinking about{57}the relationship between{57}politics and the militia for{62}"
						  ; 0x844B: PRINT MSG 0x0498: "{5B}a long time,	now.  Julie{57}and I have often	discussed{57}it, and I'm now convinced that{62}"
						  ; 0x844C: PRINT MSG 0x0499: "{5B}I can make this town{57}prosper without a{57}military force!{62}"
						  ; 0x844D: PRINT MSG 0x049A: "{5B}So, I built a casino	in{57}the town well to help lower{57}the taxes.{62}"
						  ; 0x844E: PRINT MSG 0x049B: "{5B}Please drop by{57}if	thou dost have the time.{62}"
						  ; 0x0016: LOAD 0x0016	INTO 0xFF1196 (Casino Ticket)
						  ; 0x17E8: RECEIVE ITEM [0xFF1196]
						  ; 0x181E: LOAD CHARACTER SCRIPT Arthur (0x001E)
						  ; 0xE44F: PRINT MSG 0x049C, MSGBOX CLEARED, END: "{5B}Visit me anytime!{57}Take care of thyself!{5E}"
		ScriptJump  loc_26BBA,$2	  ; Flag set:	Jump to	address	0x026BBA
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_26BBA:
		move.w	#ITM_CASINOTICKET,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	loc_26BCA

loc_26BC4:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $4B6,$0		  ; Run	text script at offset 0x028162
						  ; 0x181E: LOAD CHARACTER SCRIPT Arthur (0x001E)
						  ; 0xE44F: PRINT MSG 0x049C, MSGBOX CLEARED, END: "{5B}Visit me anytime!{57}Take care of thyself!{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_26BCE
; ---------------------------------------------------------------------------

loc_26BCA:					  ; CODE XREF: ROM:00026BC2j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $4B8,$0		  ; Run	text script at offset 0x028166
						  ; 0x8450: PRINT MSG 0x049D: "{5B}Hello again,	Sir Nigel.{57}Do you want this?{62}"
						  ; 0x0016: LOAD 0x0016	INTO 0xFF1196 (Casino Ticket)
						  ; 0x77E8: RECEIVE ITEM [0xFF1196], MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

locret_26BCE:					  ; CODE XREF: ROM:00026BC8j
		rts
; ---------------------------------------------------------------------------

CS_00EA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $000A			  ; Params 00, 0A
		ScriptID    $3CD,$1		  ; Run	text script at offset 0x027F90
						  ; 0x7C39: LOAD CUSTOM	ACTION 0x39 (0x0121E0 CSA_0039), MSGBOX	CLEARED, END
						  ;
		dc.w $000C			  ; Params 00, 0C
		ScriptID    $697,$3		  ; Run	text script at offset 0x028524
						  ; 0xE59C: PRINT MSG 0x05E9, MSGBOX CLEARED, END: "{5B}I've never seen such{57}dishonesty in all my life!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0014			  ; Params 00, 14
		ScriptID    $3CE,$1		  ; Run	text script at offset 0x027F92
						  ; 0xE378: PRINT MSG 0x03C5, MSGBOX CLEARED, END: "{5B}I made my fortune here,{57}so I'm going back to{57}the continent.{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $3CF,$3		  ; Run	text script at offset 0x027F94
						  ; 0xE379: PRINT MSG 0x03C6, MSGBOX CLEARED, END: "{5B}What bad timing!{57}I'm all ready, but the{57}ship can't leave!...{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $3D0,$5		  ; Run	text script at offset 0x027F96
						  ; 0xE37A: PRINT MSG 0x03C7, MSGBOX CLEARED, END: "{5B}I think	the money I saved{57}here will be enough for me{57}to start my own business.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00EB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $3D1,$1		  ; Run	text script at offset 0x027F98
						  ; 0xE37B: PRINT MSG 0x03C8, MSGBOX CLEARED, END: "{5B}I love the sea...{57}A brisk, salty breeze{57}makes me happy...{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $3D2,$3		  ; Run	text script at offset 0x027F9A
						  ; 0x837C: PRINT MSG 0x03C9: "{5B}Duke	Mercator boarded the{57}ship with armored soldiers{57}I've never seen before!{62}"
						  ; 0xE37D: PRINT MSG 0x03CA, MSGBOX CLEARED, END: "{5B}After they left,{57}the	lighthouse suddenly{57}went out...{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $3D4,$5		  ; Run	text script at offset 0x027F9E
						  ; 0x837E: PRINT MSG 0x03CB: "{5B}We were all so relieved to{57}see the lighthouse lit	again.{62}"
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0xE37F: PRINT MSG 0x03CC, MSGBOX CLEARED, END: "{5B}Oh!{57}You found the {5F}?{57}Really?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00EC:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $3D7,$0		  ; Run	text script at offset 0x027FA4
						  ; 0xE380: PRINT MSG 0x03CD, MSGBOX CLEARED, END: "{5B}We can see many{57}unusual things when the ship{57}from	the continent arrives!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00ED:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $3D8,$0		  ; Run	text script at offset 0x027FA6
						  ; 0xE381: PRINT MSG 0x03CE, MSGBOX CLEARED, END: "{5B}Have you seen the{57}princess staying in the{57}castle?	 She's so cute!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00EE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0014			  ; Params 00, 14
		ScriptID    $3D9,$1		  ; Run	text script at offset 0x027FA8
						  ; 0xE382: PRINT MSG 0x03CF, MSGBOX CLEARED, END: "{5B}I finished unloading!{57}We'll go on a spree at{57}Greenpea's tonight!{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $3DA,$3		  ; Run	text script at offset 0x027FAA
						  ; 0xE383: PRINT MSG 0x03D0, MSGBOX CLEARED, END: "{5B}As long	as the lighthouse{57}is	broken,	the ship cannot{57}leave!{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $3DB,$5		  ; Run	text script at offset 0x027FAC
						  ; 0x7CD2: LOAD CUSTOM	ACTION 0xD2 (0x012444 CSA_00D2), MSGBOX	CLEARED, END
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00EF:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0014			  ; Params 00, 14
		ScriptID    $3DC,$1		  ; Run	text script at offset 0x027FAE
						  ; 0x8384: PRINT MSG 0x03D1: "{5B}I come here once a{57}month with imported goods.{57}We sailors rely entirely	on{62}"
						  ; 0xE385: PRINT MSG 0x03D2, MSGBOX CLEARED, END: "{5B}the lighthouse of Ryuma{57}because the island is{57}enveloped in a dense fog.{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $3DE,$3		  ; Run	text script at offset 0x027FB2
						  ; 0xE386: PRINT MSG 0x03D3, MSGBOX CLEARED, END: "{5B}The lighthouse is{57}out of order!  How	will I{57}steer	my ship!{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $3DF,$5		  ; Run	text script at offset 0x027FB4
						  ; 0xE387: PRINT MSG 0x03D4, MSGBOX CLEARED, END: "{5B}The ship for Verla{57}will be leaving port soon!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0014			  ; Params 00, 14
		ScriptID    $3E0,$1		  ; Run	text script at offset 0x027FB6
						  ; 0x17EB: PLAY MUSIC TRACK 14
						  ; 0x8388: PRINT MSG 0x03D5: "{5B}Weigh anchor, weigh yo-ho!{57}Waves breaking, weigh yo-ho!{57}Hey-ho, let's go!{62}"
						  ; 0xE389: PRINT MSG 0x03D6, MSGBOX CLEARED, END: "{5B}This is	the new	number{57}one song of the week on{57}the continent now!	 Know it?{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $3E3,$3		  ; Run	text script at offset 0x027FBC
						  ; 0x17EB: PLAY MUSIC TRACK 14
						  ; 0x838A: PRINT MSG 0x03D7: "{5B}Weigh anchor, weigh yo-ho!{57}We're stuck here, way to go!{57}Hey, yo-ho, let me go!{62}"
						  ; 0xE38B: PRINT MSG 0x03D8, MSGBOX CLEARED, END: "{5B}This is	no time	for singing!{57}The situation's critical!{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $3E6,$5		  ; Run	text script at offset 0x027FC2
						  ; 0xE38C: PRINT MSG 0x03D9, MSGBOX CLEARED, END: "{5B}The taxes here are{57}killing me!  Cut 'em short,{57}I say...end of story!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $001A			  ; Params 00, 1A
		ScriptJump  loc_26C66,$1	  ; Jump to address 0x026C66
						  ;
		dc.w $0101			  ; Params 01, 01
		ScriptID    $3E7,$3		  ; Run	text script at offset 0x027FC4
						  ; 0xE38D: PRINT MSG 0x03DA, MSGBOX CLEARED, END: "{5B}Sorry!	This warehouse{57}is for traders only.{5E}"
						  ;
		dc.w $0102			  ; Params 01, 02
		ScriptJump  loc_26C5A,$5	  ; Jump to address 0x026C5A
						  ;
		dc.w $0103			  ; Params 01, 03
		ScriptID    $3EA,$7		  ; Run	text script at offset 0x027FCA
						  ; 0xE38F: PRINT MSG 0x03DC, MSGBOX CLEARED, END: "{5B}See you	next month!{57}Have a good day!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26C5A:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $00A5			  ; Bit	5 of flag 0x014
		ScriptID    $3E9,$1		  ; Flag clear:	Run text script	at offset 0x027FC8
						  ; 0xE38E: PRINT MSG 0x03DB, MSGBOX CLEARED, END: "{5B}Do come	in and look around{57}the warehouse!  You're sure{57}to find something you like!{5E}"
		ScriptID    $3E8,$2		  ; Flag set:	Run text script	at offset 0x027FC6
						  ; 0x7C6D: LOAD CUSTOM	ACTION 0x6D (0x0122B0 CSA_006D), MSGBOX	CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_26C66:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $3EB,$0		  ; Prompt:	  Run text script at offset 0x027FCC
						  ; 0xA390: PRINT MSG 0x03DD, END: "{5B}Have you heard about{57}General	Arthur?{58}"
		ScriptID    $3EC,$1		  ; Answer 'yes': Run text script at offset 0x027FCE
						  ; 0x8391: PRINT MSG 0x03DE: "{5B}He was seriously{57}injured!	 Now he's under{57}strict medical care.{62}"
						  ; 0xE392: PRINT MSG 0x03DF, MSGBOX CLEARED, END: "{5B}I think	General	Arthur{57}will make a great ruler!{5E}"
		ScriptID    $3EE,$2		  ; Answer 'no':  Run text script at offset 0x027FD2
						  ; 0x8393: PRINT MSG 0x03E0: "{5B}He's in charge of the Royal{57}Guard, now.  His main concern{57}is foiling the duke's plans...{62}"
						  ; 0x8394: PRINT MSG 0x03E1: "{5B}He was seriously injured!{57}Now he's under strict{57}medical care.{62}"
						  ; 0xE395: PRINT MSG 0x03E2, MSGBOX CLEARED, END: "{5B}I think	General	Arthur{57}will make a great ruler!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F2:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $3F1,$0		  ; Run	text script at offset 0x027FD8
						  ; 0xE396: PRINT MSG 0x03E3, MSGBOX CLEARED, END: "{5B}Do you think those who{57}buy 100 EkeEke at a time{57}are stupid?  So do I!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F3:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0014			  ; Params 00, 14
		ScriptID    $3FB,$1		  ; Run	text script at offset 0x027FEC
						  ; 0xE39E: PRINT MSG 0x03EB, MSGBOX CLEARED, END: "{5B}To get the armlet is{57}to prove oneself worthy{57}to enter the	tower!{5E}"
						  ;
		dc.w $0016			  ; Params 00, 16
		ScriptID    $3FC,$3		  ; Run	text script at offset 0x027FEE
						  ; 0x839F: PRINT MSG 0x03EC: "{5B}Is that the armlet?{57}You really did it?  Gee...!!{57}If you were{62}"
						  ; 0xE3A0: PRINT MSG 0x03ED, MSGBOX CLEARED, END: "{5B}strong and smart enough	to{57}get the armlet, Mir should be{57}no problem for you...{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F4:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $00A4			  ; Bit	4 of flag 0x014
		ScriptJump  loc_26C92,$1	  ; Flag set:	Jump to	address	0x026C92
		ScriptID    $3F2,$2		  ; Flag clear:	Run text script	at offset 0x027FDA
						  ; 0x7C6A: LOAD CUSTOM	ACTION 0x6A (0x0122A4 CSA_006A), MSGBOX	CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_26C92:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $00D2			  ; Bit	2 of flag 0x01A
		ScriptID    $3F4,$1		  ; Flag set:	Run text script	at offset 0x027FDE
						  ; 0xE398: PRINT MSG 0x03E5, MSGBOX CLEARED, END: "{5B}Greenpea is the	name{57}of the owner here.{5E}"
		ScriptID    $3F3,$2		  ; Flag clear:	Run text script	at offset 0x027FDC
						  ; 0xE397: PRINT MSG 0x03E4, MSGBOX CLEARED, END: "{5B}Gambling is like a drug!{57}Once you get started, you{57}can never get enough!...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0014			  ; Params 00, 14
		ScriptID    $3F5,$1		  ; Run	text script at offset 0x027FE0
						  ; 0xE399: PRINT MSG 0x03E6, MSGBOX CLEARED, END: "{5B}I'm the ship's captain.  I'm{57}just like anyone else on land,{57}but on the sea, I'm king!...{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $3F6,$3		  ; Run	text script at offset 0x027FE2
						  ; 0xE39A: PRINT MSG 0x03E7, MSGBOX CLEARED, END: "{5B}When the lighthouse is fixed,{57}I can go back to being	a{57}captain again.{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $3F7,$5		  ; Run	text script at offset 0x027FE4
						  ; 0x17EB: PLAY MUSIC TRACK 14
						  ; 0xE39B: PRINT MSG 0x03E8, MSGBOX CLEARED, END: "{5B}Ahoy, matey!  Didja hear?{57}The lighthouse is fixed!  I'm{57}a captain again!  Ha ha!!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F6:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $3F9,$0		  ; Run	text script at offset 0x027FE8
						  ; 0x839C: PRINT MSG 0x03E9: "{5B}This	skeleton killed	many{57}friends	of mine!  This is{57}my	revenge!{62}"
						  ; 0xE39D: PRINT MSG 0x03EA, MSGBOX CLEARED, END: "{5B}If he were out of that cell,{57}I'd be no match for him!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0020:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $2E6,$0		  ; Run	text script at offset 0x027DC2
						  ; 0xE2A3: PRINT MSG 0x02F0, MSGBOX CLEARED, END: "{5B}How do you do?	I'm June,{57}Fahl's fair girlfriend.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0014			  ; Params 00, 14
		ScriptID    $3FE,$1		  ; Run	text script at offset 0x027FF2
						  ; 0xE3A1: PRINT MSG 0x03EE, MSGBOX CLEARED, END: "{5B}The goods you purchased{57}will	be sent	directly to your{57}shop with the bill.	 Thanks!{5E}"
						  ;
		dc.w $001A			  ; Params 00, 1A
		ScriptJump  loc_26CCA,$3	  ; Jump to address 0x026CCA
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26CCA:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $00D9			  ; Bit	1 of flag 0x01B
		ScriptID    $8CC,$1		  ; Flag set:	Run text script	at offset 0x02898E
						  ; 0x18F7: LOAD CHARACTER SCRIPT * (0x00F7)
						  ; 0x8700: PRINT MSG 0x074D: "{5B}Nigel, are you OK?{57}Are you a landlubber?{57}Don't throw up on my{62}"
						  ; 0xE701: PRINT MSG 0x074E, MSGBOX CLEARED, END: "{5B}nice, new deck!{5E}"
		ScriptID    $3FF,$2		  ; Flag clear:	Run text script	at offset 0x027FF4
						  ; 0x7CD1: LOAD CUSTOM	ACTION 0xD1 (0x012440 CSA_00D1), MSGBOX	CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F8:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $400,$0		  ; Run	text script at offset 0x027FF6
						  ; 0xE3A2: PRINT MSG 0x03EF, MSGBOX CLEARED, END: "{5B}This is	Duke Mercator's{57}private pier.{57}You can't go in.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $000F			  ; Params 00, 0F
		ScriptID    $401,$1		  ; Run	text script at offset 0x027FF8
						  ; 0xE3A3: PRINT MSG 0x03F0, MSGBOX CLEARED, END: "{5B}Welcome	to{57}the castle of Mercator!{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptJump  loc_26CFA,$3	  ; Jump to address 0x026CFA
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $405,$5		  ; Run	text script at offset 0x028000
						  ; 0xE3A7: PRINT MSG 0x03F4, MSGBOX CLEARED, END: "{5B}Nigel!	Welcome	back!{57}Thank heavens the goddess{57}accepted my prayer!{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptJump  loc_26D06,$7	  ; Jump to address 0x026D06
						  ;
		dc.w $0019			  ; Params 00, 19
		ScriptID    $409,$9		  ; Run	text script at offset 0x028008
						  ; 0xE3AB: PRINT MSG 0x03F8, MSGBOX CLEARED, END: "{5B}All the	other soldiers have{57}gone somewhere with the Duke.{57}I'm the only one remaining...{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $40A,$B		  ; Run	text script at offset 0x02800A
						  ; 0x83AC: PRINT MSG 0x03F9: "{5B}I am	not fit	to be a	soldier.{57}I'll assist General Arthur{57}in his duties from now on.{62}"
						  ; 0xE3AD: PRINT MSG 0x03FA, MSGBOX CLEARED, END: "{5B}Take care of yourself!{62}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26CFA:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00D4			  ; Bit	4 of flag 0x01A
		ScriptID    $402,$1		  ; Flag clear:	Run text script	at offset 0x027FFA
						  ; 0x83A4: PRINT MSG 0x03F1: "{5B}Nigel!  I have great{57}respect for you!{57}You're my ideal!!{62}"
						  ; 0xE3A5: PRINT MSG 0x03F2, MSGBOX CLEARED, END: "{5B}Please,	please come{57}back safe and sound!{57}Good luck...!{5E}"
		ScriptID    $404,$2		  ; Flag set:	Run text script	at offset 0x027FFE
						  ; 0xE3A6: PRINT MSG 0x03F3, MSGBOX CLEARED, END: "{5B}Please come back{57}safe and sound!{57}I'll pray for you!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_26D06:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00E8			  ; Bit	0 of flag 0x01D
		ScriptID    $406,$1		  ; Flag clear:	Run text script	at offset 0x028002
						  ; 0x83A8: PRINT MSG 0x03F5: "{5B}Nigel!{57}I thought you were...{57}the Duke and some	strange{62}"
						  ; 0xE3A9: PRINT MSG 0x03F6, MSGBOX CLEARED, END: "{5B}armored	soldiers suddenly...{5E}"
		ScriptID    $408,$2		  ; Flag set:	Run text script	at offset 0x028006
						  ; 0xE3AA: PRINT MSG 0x03F7, MSGBOX CLEARED, END: "{5B}Terrible...!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00FA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $000F			  ; Params 00, 0F
		ScriptID    $40C,$1		  ; Run	text script at offset 0x02800E
						  ; 0x83AE: PRINT MSG 0x03FB: "{5B}Beautiful courtyard,	huh?{57}The gardener must be highly{57}skilled to keep it so nice...{62}"
						  ; 0xE3AF: PRINT MSG 0x03FC, MSGBOX CLEARED, END: "{5B}Would you like to see him?{57}Surprise!!...it's me,{57}heh, heh, heh...{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $40E,$3		  ; Run	text script at offset 0x028012
						  ; 0x83B0: PRINT MSG 0x03FD: "{5B}Why did the Orc King{57}cross the road?{62}"
						  ; 0xE3B1: PRINT MSG 0x03FE, MSGBOX CLEARED, END: "{5B}Because	he wanted to{57}eat the	chicken{57}on the other	side.  Ha!{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $410,$5		  ; Run	text script at offset 0x028016
						  ; 0xE3B2: PRINT MSG 0x03FF, MSGBOX CLEARED, END: "{5B}Now the	taxes will be{57}lowered and I can get{57}a better salary...I hope.{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $411,$7		  ; Run	text script at offset 0x028018
						  ; 0x83B3: PRINT MSG 0x0400: "{5B}Strange!{57}Giant monsters like soldiers{57}were following Duke Mercator!{62}"
						  ; 0xE3B4: PRINT MSG 0x0401, MSGBOX CLEARED, END: "{5B}How strange!.....{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $413,$9		  ; Run	text script at offset 0x02801C
						  ; 0xE3B5: PRINT MSG 0x0402, MSGBOX CLEARED, END: "{5B}I don't care who owns the{57}castle.  I'll always be the{57}gardener of this courtyard...{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $000F			  ; Params 00, 0F
		ScriptID    $416,$1		  ; Run	text script at offset 0x028022
						  ; 0xE3B8: PRINT MSG 0x0405, MSGBOX CLEARED, END: "{5B}Oh, this is the	kitchen	door!{57}A distinguished guest like you{57}should use the front	door....{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $417,$3		  ; Run	text script at offset 0x028024
						  ; 0x83B9: PRINT MSG 0x0406: "{5B}La-la-la...la-la...{57}Why am I so happy?  Well,{57}when I was cleaning the garden,{62}"
						  ; 0xE3BA: PRINT MSG 0x0407, MSGBOX CLEARED, END: "{5B}I saw a	beautiful hair{57}ornament fall	to the ground, a{57}very expensive one!	 Lucky me!{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $419,$5		  ; Run	text script at offset 0x028028
						  ; 0xE3BB: PRINT MSG 0x0408, MSGBOX CLEARED, END: "{5B}This door is not fit for{57}a hero!  Would you please{57}use the front door?{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $41A,$7		  ; Run	text script at offset 0x02802A
						  ; 0x83BC: PRINT MSG 0x0409: "{5B}Strange armored soldiers{57}suddenly	rushed into the{57}castle!  General Arthur is{62}"
						  ; 0xE3BD: PRINT MSG 0x040A, MSGBOX CLEARED, END: "{5B}fighting against them alone!{57}Please save him!  HURRY!!{5E}"
						  ;
		dc.w $0019			  ; Params 00, 19
		ScriptID    $41C,$9		  ; Run	text script at offset 0x02802E
						  ; 0xE3BE: PRINT MSG 0x040B, MSGBOX CLEARED, END: "{5B}Where has the Duke gone?{57}What is he going to	do?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptID    $41D,$1		  ; Run	text script at offset 0x028030
						  ; 0xE3BF: PRINT MSG 0x040C, MSGBOX CLEARED, END: "{5B}The party will be{57}ready soon.  Please feel free{57}to look around the castle.{5E}"
						  ;
		dc.w $0012			  ; Params 00, 12
		ScriptID    $41E,$3		  ; Run	text script at offset 0x028032
						  ; 0xE3C0: PRINT MSG 0x040D, MSGBOX CLEARED, END: "{5B}Mr. Nigel, the party is	ready.{57}It's being held in the banquet{57}room on the second floor.{5E}"
						  ;
		dc.w $0013			  ; Params 00, 13
		ScriptID    $41F,$5		  ; Run	text script at offset 0x028034
						  ; 0x83C1: PRINT MSG 0x040E: "{5B}You can't go out now{57}It's getting dark.{62}"
						  ; 0xE3C2: PRINT MSG 0x040F, MSGBOX CLEARED, END: "{5B}It's for your safety.{57}Please take a rest in your{57}room for the night.{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $421,$7		  ; Run	text script at offset 0x028038
						  ; 0xE3C3: PRINT MSG 0x0410, MSGBOX CLEARED, END: "{5B}Mir is a plague	to the duke{57}and the town.  Please defeat{57}him for us!{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $422,$9		  ; Run	text script at offset 0x02803A
						  ; 0xE3C4: PRINT MSG 0x0411, MSGBOX CLEARED, END: "{5B}I'm glad to see you again!{57}Please go up and see the Duke.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptID    $423,$1		  ; Run	text script at offset 0x02803C
						  ; 0xE3C5: PRINT MSG 0x0412, MSGBOX CLEARED, END: "{5B}You cannot go out today.{5E}"
						  ;
		dc.w $0012			  ; Params 00, 12
		ScriptID    $424,$3		  ; Run	text script at offset 0x02803E
						  ; 0xE3C6: PRINT MSG 0x0413, MSGBOX CLEARED, END: "{5B}Everything is ready!{57}Would you go on	up{57}to the banquet room?{5E}"
						  ;
		dc.w $0013			  ; Params 00, 13
		ScriptID    $425,$5		  ; Run	text script at offset 0x028040
						  ; 0xE3C7: PRINT MSG 0x0414, MSGBOX CLEARED, END: "{5B}You can't go out today.{57}Please rest quietly in{57}your room.{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $426,$7		  ; Run	text script at offset 0x028042
						  ; 0xE3C8: PRINT MSG 0x0415, MSGBOX CLEARED, END: "{5B}We're counting on you{57}to return safe and sound!{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $427,$9		  ; Run	text script at offset 0x028044
						  ; 0xE3C9: PRINT MSG 0x0416, MSGBOX CLEARED, END: "{5B}Duke Mercator is{57}waiting for	you!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptID    $428,$1		  ; Run	text script at offset 0x028046
						  ; 0xE3CA: PRINT MSG 0x0417, MSGBOX CLEARED, END: "{5B}Training rooms for{57}the soldiers from	here.{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptJump  loc_26D88,$3	  ; Jump to address 0x026D88
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26D88:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $00A1			  ; Bit	1 of flag 0x014
		ScriptID    $429,$1		  ; Flag set:	Run text script	at offset 0x028048
						  ; 0x83CB: PRINT MSG 0x0418: "{5B}Excuse us, sir!{57}The new employees	often{57}behave	rudely to the guests...{62}"
						  ; 0xE3CC: PRINT MSG 0x0419, MSGBOX CLEARED, END: "{5B}I must humbly apologize{57}on their behalf.....please{57}forgive us.{5E}"
		ScriptID    $428,$2		  ; Flag clear:	Run text script	at offset 0x028046
						  ; 0xE3CA: PRINT MSG 0x0417, MSGBOX CLEARED, END: "{5B}Training rooms for{57}the soldiers from	here.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00FF:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00CB			  ; Bit	3 of flag 0x019
		ScriptID    $42B,$1		  ; Flag clear:	Run text script	at offset 0x02804C
						  ; 0x83CD: PRINT MSG 0x041A: "{5B}Working here, I get to{57}see the nobility from{57}various countries.{62}"
						  ; 0x83CE: PRINT MSG 0x041B: "{5B}Just	recently, I had	a chance{57}to meet Princess Lara from{57}Maple.  She was really cute!{62}"
						  ; 0xE3CF: PRINT MSG 0x041C, MSGBOX CLEARED, END: "{5B}But since then...{57}...nothing!{5E}"
		ScriptID    $42E,$2		  ; Flag set:	Run text script	at offset 0x028052
						  ; 0xE3D0: PRINT MSG 0x041D, MSGBOX CLEARED, END: "{5B}We are told not	to speak{57}with the guests...{57}Please excuse	me.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0100:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptJump  loc_26DAE,$1	  ; Jump to address 0x026DAE
						  ;
		dc.w $0012			  ; Params 00, 12
		ScriptID    $433,$3		  ; Run	text script at offset 0x02805C
						  ; 0x83D5: PRINT MSG 0x0422: "{5B}What	a surprise!{57}Mr. Zak,	the Dragonute, said{57}that he would buy this one!{62}"
						  ; 0xE3D6: PRINT MSG 0x0423, MSGBOX CLEARED, END: "{5B}Is bounty hunting such a{57}good job?  Hmmmmm.....{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26DAE:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00CC			  ; Bit	4 of flag 0x019
		ScriptID    $42F,$1		  ; Flag clear:	Run text script	at offset 0x028054
						  ; 0x83D1: PRINT MSG 0x041E: "{5B}The paintings and ornaments{57}in this castle are{57}well known for their{62}"
						  ; 0x83D2: PRINT MSG 0x041F: "{5B}historic value.  Incidentally,{57}this picture is by	the famous{57}Van Dough.  If you{62}"
						  ; 0xE3D3: PRINT MSG 0x0420, MSGBOX CLEARED, END: "{5B}really want it,	I'm sure{57}the duke would sell it to you.{57}Only 50,000 golds...cheap!{5E}"
		ScriptID    $432,$2		  ; Flag set:	Run text script	at offset 0x02805A
						  ; 0xE3D4: PRINT MSG 0x0421, MSGBOX CLEARED, END: "{5B}Collecting art{57}is the duke's hobby.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0101:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptID    $435,$1		  ; Run	text script at offset 0x028060
						  ; 0xE3D7: PRINT MSG 0x0424, MSGBOX CLEARED, END: "{5B}This mansion is	so large,{57}it	takes me one whole day{57}to clean the walls...{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $436,$3		  ; Run	text script at offset 0x028062
						  ; 0xE3D8: PRINT MSG 0x0425, MSGBOX CLEARED, END: "{5B}Cleaning the walls is{57}very hard work.{57}So,	I'm taking the day off!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0102:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0010			  ; Params 00, 10
		ScriptID    $437,$1		  ; Run	text script at offset 0x028064
						  ; 0x7C50: LOAD CUSTOM	ACTION 0x50 (0x01223C CSA_0050), MSGBOX	CLEARED, END
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $438,$3		  ; Run	text script at offset 0x028066
						  ; 0x83D9: PRINT MSG 0x0426: "{5B}Mr. Dexter?	No, I don't{57}know where he is now{57}He was gone by the time I{62}"
						  ; 0xE3DA: PRINT MSG 0x0427, MSGBOX CLEARED, END: "{5B}came to	clean his room.....{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0103:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $43A,$0		  ; Run	text script at offset 0x02806A
						  ; 0xE3DB: PRINT MSG 0x0428, MSGBOX CLEARED, END: "{5B}That's your maid over there.{57}She'll show you to your room.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0021:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0010			  ; Params 00, 10
		ScriptJump  loc_26DEA,$1	  ; Jump to address 0x026DEA
						  ;
		dc.w $0013			  ; Params 00, 13
		ScriptID    $43F,$3		  ; Run	text script at offset 0x028074
						  ; 0x83E0: PRINT MSG 0x042D: "{5B}There is a barrier at{57}the	door to	Mir's tower.{57}I think General Arthur{62}"
						  ; 0xE3E1: PRINT MSG 0x042E, MSGBOX CLEARED, END: "{5B}discovered a way to break{57}it.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26DEA:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00CA			  ; Bit	2 of flag 0x019
		ScriptID    $43B,$1		  ; Flag clear:	Run text script	at offset 0x02806C
						  ; 0x83DC: PRINT MSG 0x0429: "{5B}An evil magician is{57}tormenting Duke Mercator.{57}The duke	has been avoiding{62}"
						  ; 0x83DD: PRINT MSG 0x042A: "{5B}a direct confrontation{57}out of consideration for the{57}townspeople, but...{62}"
						  ; 0x83DE: PRINT MSG 0x042B: "{5B}you'll hear more about it{57}at the dinner party.{62}"
						  ; 0xE3DF: PRINT MSG 0x042C, MSGBOX CLEARED, END: "{5B}You need some rest now.{5E}"
		ScriptID    $43E,$2		  ; Flag set:	Run text script	at offset 0x028072
						  ; 0xE3DF: PRINT MSG 0x042C, MSGBOX CLEARED, END: "{5B}You need some rest now.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0104:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptID    $44F,$1		  ; Run	text script at offset 0x028094
						  ; 0xE3EF: PRINT MSG 0x043C, MSGBOX CLEARED, END: "{5B}I'm proud of my job!{5E}"
						  ;
		dc.w $0012			  ; Params 00, 12
		ScriptID    $450,$3		  ; Run	text script at offset 0x028096
						  ; 0xE3F0: PRINT MSG 0x043D, MSGBOX CLEARED, END: "{5B}Mr. Nigel, would you{57}please go to the banquet room?{5E}"
						  ;
		dc.w $0013			  ; Params 00, 13
		ScriptID    $451,$5		  ; Run	text script at offset 0x028098
						  ; 0xE3F1: PRINT MSG 0x043E, MSGBOX CLEARED, END: "{5B}I'm proud of my job!{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $452,$7		  ; Run	text script at offset 0x02809A
						  ; 0xE3F2: PRINT MSG 0x043F, MSGBOX CLEARED, END: "{5B}Good morning, Mr. Nigel!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0105:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptID    $453,$1		  ; Run	text script at offset 0x02809C
						  ; 0xE3F3: PRINT MSG 0x0440, MSGBOX CLEARED, END: "{5B}We have	to take	care of{57}VIPs	everyday. It sometimes{57}wears	my nerves thin.{5E}"
						  ;
		dc.w $0012			  ; Params 00, 12
		ScriptID    $454,$3		  ; Run	text script at offset 0x02809E
						  ; 0xE3F4: PRINT MSG 0x0441, MSGBOX CLEARED, END: "{5B}Have fun at the	party!{5E}"
						  ;
		dc.w $0013			  ; Params 00, 13
		ScriptID    $455,$5		  ; Run	text script at offset 0x0280A0
						  ; 0xE3F5: PRINT MSG 0x0442, MSGBOX CLEARED, END: "{5B}We have	to take	care of{57}VIPs	everyday.  It can really{57}frazzle my nerves...{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $456,$7		  ; Run	text script at offset 0x0280A2
						  ; 0xE3F6: PRINT MSG 0x0443, MSGBOX CLEARED, END: "{5B}Mr. Zak	and Mr.	Dexter{57}took off early this morning.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0106:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptID    $457,$1		  ; Run	text script at offset 0x0280A4
						  ; 0xE3F7: PRINT MSG 0x0444, MSGBOX CLEARED, END: "{5B}I'm sorry, but we're busy{57}preparing for the party now.{5E}"
						  ;
		dc.w $0012			  ; Params 00, 12
		ScriptID    $458,$3		  ; Run	text script at offset 0x0280A6
						  ; 0xE3F8: PRINT MSG 0x0445, MSGBOX CLEARED, END: "{5B}Everyone is waiting.{57}Please come in.{5E}"
						  ;
		dc.w $0013			  ; Params 00, 13
		ScriptID    $459,$5		  ; Run	text script at offset 0x0280A8
						  ; 0xE3F9: PRINT MSG 0x0446, MSGBOX CLEARED, END: "{5B}I'm sorry, but Duke Mercator{57}has gone to bed.  He's not{57}feeling very well tonight...{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $45A,$7		  ; Run	text script at offset 0x0280AA
						  ; 0xE3FA: PRINT MSG 0x0447, MSGBOX CLEARED, END: "{5B}Mr. Zak	left{57}quite a	while back.....{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0107:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptID    $45B,$1		  ; Run	text script at offset 0x0280AC
						  ; 0xE3FB: PRINT MSG 0x0448, MSGBOX CLEARED, END: "{5B}Arf, arf...{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $45C,$3		  ; Run	text script at offset 0x0280AE
						  ; 0xE3FC: PRINT MSG 0x0449, MSGBOX CLEARED, END: "{5B}Bow-wow!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0108:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptID    $45D,$1		  ; Run	text script at offset 0x0280B0
						  ; 0xE3FD: PRINT MSG 0x044A, MSGBOX CLEARED, END: "{5B}I'm a member of the duke's{57}Royal Guard.  I'm guarding{57}the duke with my life!{5E}"
						  ;
		dc.w $0012			  ; Params 00, 12
		ScriptID    $45E,$3		  ; Run	text script at offset 0x0280B2
						  ; 0xE3FE: PRINT MSG 0x044B, MSGBOX CLEARED, END: "{5B}The duke is a gentleman,{57}but	a little nervous.{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $45F,$5		  ; Run	text script at offset 0x0280B4
						  ; 0xE3FF: PRINT MSG 0x044C, MSGBOX CLEARED, END: "{5B}It is said that	nobody{57}ever left that tower alive.{57}Please	be careful!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0109:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptID    $460,$1		  ; Run	text script at offset 0x0280B6
						  ; 0xE400: PRINT MSG 0x044D, MSGBOX CLEARED, END: "{5B}I'm the duke's maid.{57}If you need anything, please{57}call one of the other maids.{5E}"
						  ;
		dc.w $0012			  ; Params 00, 12
		ScriptID    $461,$3		  ; Run	text script at offset 0x0280B8
						  ; 0xE401: PRINT MSG 0x044E, MSGBOX CLEARED, END: "{5B}It's time for the dinner{57}party.  The banquet room is{57}on the second floor.{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $462,$5		  ; Run	text script at offset 0x0280BA
						  ; 0xE402: PRINT MSG 0x044F, MSGBOX CLEARED, END: "{5B}Duke Mercator is{57}out	now.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptID    $463,$1		  ; Run	text script at offset 0x0280BC
						  ; 0xE403: PRINT MSG 0x0450, MSGBOX CLEARED, END: "{5B}This is	the library.{57}I'm happiest when I'm{57}surrounded by a lot of books.{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $464,$3		  ; Run	text script at offset 0x0280BE
						  ; 0xE404: PRINT MSG 0x0451, MSGBOX CLEARED, END: "{5B}It's almost impossible{57}to get into Mir's tower.{57}That barrier cannot be broken.{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $465,$5		  ; Run	text script at offset 0x0280C0
						  ; 0x8405: PRINT MSG 0x0452: "{5B}I was surprised to see{57}two horrible monsters{57}following	some great beauty {62}"
						  ; 0xE406: PRINT MSG 0x0453, MSGBOX CLEARED, END: "{5B}out of the basement!{57}Who were they?	And{57}what were they doing there?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptID    $467,$1		  ; Run	text script at offset 0x0280C4
						  ; 0x8407: PRINT MSG 0x0454: "{5B}Hey boy!  Are you a rookie?{57}We have a banquet tonight,{57}so shake a leg!{62}"
						  ; 0xE408: PRINT MSG 0x0455, MSGBOX CLEARED, END: "{5B}Oh!...are you a	guest?{57}Oops!...er, um...{57}...excuse me, sir!{5E}"
						  ;
		dc.w $0012			  ; Params 00, 12
		ScriptID    $469,$3		  ; Run	text script at offset 0x0280C8
						  ; 0xE409: PRINT MSG 0x0456, MSGBOX CLEARED, END: "{5B}I'm worn out!{57}Catering a banquet is no{57}picnic!{5E}"
						  ;
		dc.w $0013			  ; Params 00, 13
		ScriptID    $46A,$5		  ; Run	text script at offset 0x0280CA
						  ; 0xE40A: PRINT MSG 0x0457, MSGBOX CLEARED, END: "{5B}Hiccup!...wooops...{57}Er, this	cooking	sherry needs{57}more salt!...hiccup!...{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptID    $46B,$1		  ; Run	text script at offset 0x0280CC
						  ; 0x840B: PRINT MSG 0x0458: "{5B}How selfish she is!{57}She told me, "I'm on a diet.{57}Serve me a special menu{62}"
						  ; 0xE40C: PRINT MSG 0x0459, MSGBOX CLEARED, END: "{5B}with no	meat, no fish!"{57}I really don't like her!  But{57}a guest is a guest...{5E}"
						  ;
		dc.w $0013			  ; Params 00, 13
		ScriptID    $46D,$3		  ; Run	text script at offset 0x0280D0
						  ; 0x840D: PRINT MSG 0x045A: "{5B}I don't like her!{57}She leaves the room untidy,{57}and her bathroom's always{62}"
						  ; 0xE40E: PRINT MSG 0x045B, MSGBOX CLEARED, END: "{5B}sloppy!	 I've never{57}seen such an ill-bred woman!{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $46F,$5		  ; Run	text script at offset 0x0280D4
						  ; 0xE40F: PRINT MSG 0x045C, MSGBOX CLEARED, END: "{5B}We are not allowed to{57}speak with the	guests.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptID    $470,$1		  ; Run	text script at offset 0x0280D6
						  ; 0x8410: PRINT MSG 0x045D: "{5B}We get to eat the leftovers{57}after	the banquet.{62}"
						  ; 0xE411: PRINT MSG 0x045E, MSGBOX CLEARED, END: "{5B}It's our only pleasure{57}in this job.{5E}"
						  ;
		dc.w $0013			  ; Params 00, 13
		ScriptID    $472,$3		  ; Run	text script at offset 0x0280DA
						  ; 0xE412: PRINT MSG 0x045F, MSGBOX CLEARED, END: "{5B}A lot of leftovers in there?{57}Oh, happy day!{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $473,$5		  ; Run	text script at offset 0x0280DC
						  ; 0x8413: PRINT MSG 0x0460: "{5B}I'm full!{57}Did you see that roast beef?{62}"
						  ; 0xE414: PRINT MSG 0x0461, MSGBOX CLEARED, END: "{5B}I ate too much!	 Never again!{57}By the	way, do	you know when{57}the next banquet is?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptJump  loc_26EC4,$1	  ; Jump to address 0x026EC4
						  ;
		dc.w $0012			  ; Params 00, 12
		ScriptID    $478,$3		  ; Run	text script at offset 0x0280E6
						  ; 0xE418: PRINT MSG 0x0465, MSGBOX CLEARED, END: "{5B}I've been on break since{57}ten this morning!{57}Heh heh heh...{5E}"
						  ;
		dc.w $0013			  ; Params 00, 13
		ScriptID    $479,$5		  ; Run	text script at offset 0x0280E8
						  ; 0xE419: PRINT MSG 0x0466, MSGBOX CLEARED, END: "{5B}What?  The party's over?{57}Ahhh....breaktime!!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26EC4:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00CD			  ; Bit	5 of flag 0x019
		ScriptID    $475,$1		  ; Flag clear:	Run text script	at offset 0x0280E0
						  ; 0x8415: PRINT MSG 0x0462: "{5B}Ulp!	 I'm sorry!  I'm...{57}Oh...who are you?{57}I thought you were my boss!{62}"
						  ; 0xE416: PRINT MSG 0x0463, MSGBOX CLEARED, END: "{5B}He's always scolding me...{5E}"
		ScriptID    $477,$2		  ; Flag set:	Run text script	at offset 0x0280E4
						  ; 0xE417: PRINT MSG 0x0464, MSGBOX CLEARED, END: "{5B}I'm just taking my break now.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_010F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptID    $47A,$1		  ; Run	text script at offset 0x0280EA
						  ; 0xE41A: PRINT MSG 0x0467, MSGBOX CLEARED, END: "{5B}This stew must be{57}extremely delicious!  It's{57}been cooking for three days!{5E}"
						  ;
		dc.w $0013			  ; Params 00, 13
		ScriptID    $47B,$3		  ; Run	text script at offset 0x0280EC
						  ; 0xE41B: PRINT MSG 0x0468, MSGBOX CLEARED, END: "{5B}Banquets are a good{57}opportunity to show off{57}my abilities as a cook!{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $47C,$5		  ; Run	text script at offset 0x0280EE
						  ; 0x841C: PRINT MSG 0x0469: "{5B}I was very disappointed{57}to see that almost no one{57}cleaned his plate!{62}"
						  ; 0xE41D: PRINT MSG 0x046A, MSGBOX CLEARED, END: "{5B}What happened in there?{5E}"
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $47E,$7		  ; Run	text script at offset 0x0280F2
						  ; 0xE41E: PRINT MSG 0x046B, MSGBOX CLEARED, END: "{5B}When is	the duke{57}coming back?  I have to{57}plan his	dinner menu.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0110:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptID    $47F,$1		  ; Run	text script at offset 0x0280F4
						  ; 0x841F: PRINT MSG 0x046C: "{5B}We're serving fried{57}Gamoor lobsters and scallops!{57}Seafood is{62}"
						  ; 0xE420: PRINT MSG 0x046D, MSGBOX CLEARED, END: "{5B}one of the duke's favorites.{5E}"
						  ;
		dc.w $0013			  ; Params 00, 13
		ScriptID    $481,$3		  ; Run	text script at offset 0x0280F8
						  ; 0x8421: PRINT MSG 0x046E: "{5B}How was dinner?{57}The menu was really special,{57}wasn't it?{62}"
						  ; 0xE422: PRINT MSG 0x046F, MSGBOX CLEARED, END: "{5B}I wish I had gone to the{57}banquet with you...What?{57}You didn't eat!  How come?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0111:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptID    $483,$1		  ; Run	text script at offset 0x0280FC
						  ; 0xE423: PRINT MSG 0x0470, MSGBOX CLEARED, END: "{5B}Mr. Zak	eats only raw meat?{57}I had no	idea!...{5E}"
						  ;
		dc.w $0013			  ; Params 00, 13
		ScriptID    $484,$3		  ; Run	text script at offset 0x0280FE
						  ; 0xE424: PRINT MSG 0x0471, MSGBOX CLEARED, END: "{5B}Did Mr.	Zak like the{57}fried lobsters?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0112:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptJump  loc_26F14,$1	  ; Jump to address 0x026F14
						  ;
		dc.w $0012			  ; Params 00, 12
		ScriptID    $489,$3		  ; Run	text script at offset 0x028108
						  ; 0xE427: PRINT MSG 0x0474, MSGBOX CLEARED, END: "{5B}Please come to the{57}banquet room.  It's on the{57}second floor.{5E}"
						  ;
		dc.w $0013			  ; Params 00, 13
		ScriptID    $48A,$5		  ; Run	text script at offset 0x02810A
						  ; 0xE428: PRINT MSG 0x0475, MSGBOX CLEARED, END: "{5B}You cannot leave{57}just yet....{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26F14:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $00CE			  ; Bit	6 of flag 0x019
		ScriptID    $487,$1		  ; Flag set:	Run text script	at offset 0x028104
						  ; 0x1493: SET	BIT 3 OF FLAG 0x012
						  ; 0xE426: PRINT MSG 0x0473, MSGBOX CLEARED, END: "{5B}Mr. Nigel!  The	party is{57}ready now.	Would you please{57}come to the	banquet	room?{5E}"
		ScriptID    $485,$2		  ; Flag clear:	Run text script	at offset 0x028100
						  ; 0x14DB: SET	BIT 3 OF FLAG 0x01B
						  ; 0xE425: PRINT MSG 0x0472, MSGBOX CLEARED, END: "{5B}Have you looked	around{57}the castle?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0113:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $48B,$0		  ; Run	text script at offset 0x02810C
						  ; 0x8429: PRINT MSG 0x0476: "{5B}Long	ago, there was{57}a huge war on	the continent.{57}King Nole used this island{62}"
						  ; 0x842A: PRINT MSG 0x0477: "{5B}as a	base.  When the	war{57}was over, the fortresses	and{57}labyrinths were simply{62}"
						  ; 0xE42B: PRINT MSG 0x0478, MSGBOX CLEARED, END: "{5B}abandoned...many of them{57}stand to this day!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0114:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $48E,$0		  ; Run	text script at offset 0x028112
						  ; 0x842C: PRINT MSG 0x0479: "{5B}The Dark Wizard of{57}the tower is very cunning!{57}The tower itself	is like	a{62}"
						  ; 0xE42D: PRINT MSG 0x047A, MSGBOX CLEARED, END: "{5B}storied	maze.  There is{57}also	a barrier to protect the{57}wizard from	outsiders...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0115:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $490,$0		  ; Run	text script at offset 0x028116
						  ; 0xE42E: PRINT MSG 0x047B, MSGBOX CLEARED, END: "{5B}I got a	bonus today!{57}Want to	go to Greenpea's and{57}watch me double it?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0116:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0011			  ; Params 00, 11
		ScriptID    $491,$1		  ; Run	text script at offset 0x028118
						  ; 0x842F: PRINT MSG 0x047C: "{5B}Oh, I'm sorry!{57}We thought you were one of our{57}soldiers!  Did we scare you?{62}"
						  ; 0xE430: PRINT MSG 0x047D, MSGBOX CLEARED, END: "{5B}We have	to study{57}new	tactics	everyday!{5E}"
						  ;
		dc.w $0013			  ; Params 00, 13
		ScriptID    $493,$3		  ; Run	text script at offset 0x02811C
						  ; 0xE431: PRINT MSG 0x047E, MSGBOX CLEARED, END: "{5B}The other soldiers are{57}making the rounds outside.{5E}"
						  ;
		dc.w $0014			  ; Params 00, 14
		ScriptID    $494,$5		  ; Run	text script at offset 0x02811E
						  ; 0x8432: PRINT MSG 0x047F: "{5B}Everyone's out training.{57}Me?  Well, uh...umm...{62}"
						  ; 0xE433: PRINT MSG 0x0480, MSGBOX CLEARED, END: "{5B}I-I'm minding the store{57}while they're gone!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0117:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $496,$0		  ; Run	text script at offset 0x028122
						  ; 0xE434: PRINT MSG 0x0481, MSGBOX CLEARED, END: "{5B}This is	the newest formation!{57}How do	you like it?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0118:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $497,$0		  ; Run	text script at offset 0x028124
						  ; 0xE435: PRINT MSG 0x0482, MSGBOX CLEARED, END: "{5B}We modeled it after the{57}movement of some monsters{57}we saw in a cave.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0119:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $498,$0		  ; Run	text script at offset 0x028126
						  ; 0xE436: PRINT MSG 0x0483, MSGBOX CLEARED, END: "{5B}Don't interrupt!{57}It's just training, but I still{57}have to concentrate!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011A:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $499,$0		  ; Run	text script at offset 0x028128
						  ; 0xE437: PRINT MSG 0x0484, MSGBOX CLEARED, END: "{5B}Out of the way,	kid!{57}This is	serious.  I've got{57}60 golds riding on this fight!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011B:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $414,$0		  ; Run	text script at offset 0x02801E
						  ; 0xE3B6: PRINT MSG 0x0403, MSGBOX CLEARED, END: "{5B}Cock-a-doodle-dooooo!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011C:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $415,$0		  ; Run	text script at offset 0x028020
						  ; 0xE3B7: PRINT MSG 0x0404, MSGBOX CLEARED, END: "{5B}Cock-a-cock-a-co....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011D:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $4BB,$0		  ; Run	text script at offset 0x02816C
						  ; 0xE451: PRINT MSG 0x049E, MSGBOX CLEARED, END: "{5B}This room is reserved{57}for special guests.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0022:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0017			  ; Params 00, 17
		ScriptID    $4CB,$1		  ; Run	text script at offset 0x02818C
						  ; 0x7CA5: LOAD CUSTOM	ACTION 0xA5 (0x012390 CSA_00A5), MSGBOX	CLEARED, END
						  ;
		dc.w $0018			  ; Params 00, 18
		ScriptID    $81E,$3		  ; Run	text script at offset 0x028832
						  ; 0xE69F: PRINT MSG 0x06EC, MSGBOX CLEARED, END: "{5B}Please get the princess{57}back	from Duke Mercator!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_011E:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00D0			  ; Bit	0 of flag 0x01A
		ScriptID    $4CC,$1		  ; Flag clear:	Run text script	at offset 0x02818E
						  ; 0x8460: PRINT MSG 0x04AD: "{5B}Wandering about in this{57}basement has completely{57}tired us out!	Please go on{62}"
						  ; 0xE461: PRINT MSG 0x04AE, MSGBOX CLEARED, END: "{5B}ahead and save the princess.{57}The duke has taken Miss	Lara{57}prisoner...please find her!{5E}"
		ScriptID    $4CD,$2		  ; Flag set:	Run text script	at offset 0x028190
						  ; 0xE461: PRINT MSG 0x04AE, MSGBOX CLEARED, END: "{5B}ahead and save the princess.{57}The duke has taken Miss	Lara{57}prisoner...please find her!{5E}"
; ---------------------------------------------------------------------------
		ScriptID    $22FF,$3
; ---------------------------------------------------------------------------

CS_011F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $4ED,$1		  ; Run	text script at offset 0x0281D0
						  ; 0x847A: PRINT MSG 0x04C7: "{5B}Are you a tourist?{57}You'd better go back.  All{57}the townspeople were{62}"
						  ; 0x847B: PRINT MSG 0x04C8: "{5B}suddenly taken to the{57}mountains by strange soldiers.{57}I	was fishing by the sea{62}"
						  ; 0xE47C: PRINT MSG 0x04C9, MSGBOX CLEARED, END: "{5B}at the time...{57}All that's left are a priest{57}and a sick old man...{5E}"
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $4F0,$3		  ; Run	text script at offset 0x0281D6
						  ; 0xE47D: PRINT MSG 0x04CA, MSGBOX CLEARED, END: "{5B}I heard	 you rescued{57}the people of this town!{57}Bravo!  Well done!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0023:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $4F1,$1		  ; Run	text script at offset 0x0281D8
						  ; 0xE47E: PRINT MSG 0x04CB, MSGBOX CLEARED, END: "{5B}...cough...cough...{5E}"
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $4F2,$3		  ; Run	text script at offset 0x0281DA
						  ; 0xE47F: PRINT MSG 0x04CC, MSGBOX CLEARED, END: "{5B}It's a miracle!  My health{57}suddenly came back to see them{57}all returned safe and sound!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0024:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $4F3,$1		  ; Run	text script at offset 0x0281DC
						  ; 0xE480: PRINT MSG 0x04CD, MSGBOX CLEARED, END: "{5B}Why did	Duke Mercator{57}take all the people away?..{5E}"
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $4F4,$3		  ; Run	text script at offset 0x0281DE
						  ; 0xE481: PRINT MSG 0x04CE, MSGBOX CLEARED, END: "{5B}I'm happy now that{57}everything's back to normal...{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0120:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $001A			  ; Params 00, 1A
		ScriptJump  loc_26FC0,$1	  ; Jump to address 0x026FC0
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $4FA,$3		  ; Run	text script at offset 0x0281EA
						  ; 0xE487: PRINT MSG 0x04D4, MSGBOX CLEARED, END: "{5B}Whew!  What a relief!{57}No more digging!  Now I can{57}go back	to my old job.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26FC0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0135			  ; Bit	5 of flag 0x026
		ScriptID    $4F6,$1		  ; Flag set:	Run text script	at offset 0x0281E2
						  ; 0x8483: PRINT MSG 0x04D0: "{5B}We're all from Verla.{57}Duke Mercator forced us to{57}dig this mine.{62}"
						  ; 0x8484: PRINT MSG 0x04D1: "{5B}Our families	were also{57}taken captive by his{57}soldiers...please save them!{62}"
						  ; 0x8485: PRINT MSG 0x04D2: "{5B}This	mine consists of three{57}forked tunnels.  You'll find{62}"
						  ; 0xE486: PRINT MSG 0x04D3, MSGBOX CLEARED, END: "{5B}our friends caught somewhere{57}in the other two tunnels.{57}Please help us!{5E}"
		ScriptID    $4F5,$2		  ; Flag clear:	Run text script	at offset 0x0281E0
						  ; 0xE482: PRINT MSG 0x04CF, MSGBOX CLEARED, END: "{5B}Get the	monster, please!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0121:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $001A			  ; Params 00, 1A
		ScriptJump  loc_26FDA,$1	  ; Jump to address 0x026FDA
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $4FE,$3		  ; Run	text script at offset 0x0281F2
						  ; 0xE48B: PRINT MSG 0x04D8, MSGBOX CLEARED, END: "{5B}Why did	Duke Mercator{57}do such a terrible thing?{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26FDA:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0135			  ; Bit	5 of flag 0x026
		ScriptID    $4FC,$1		  ; Flag set:	Run text script	at offset 0x0281EE
						  ; 0x8489: PRINT MSG 0x04D6: "{5B}Duke	Mercator suddenly{57}appeared in town and{57}ordered his henchmen{62}"
						  ; 0xE48A: PRINT MSG 0x04D7, MSGBOX CLEARED, END: "{5B}to bring us here.{57}And I thought he was{57}such a gentleman...{5E}"
		ScriptID    $4FB,$2		  ; Flag clear:	Run text script	at offset 0x0281EC
						  ; 0xE488: PRINT MSG 0x04D5, MSGBOX CLEARED, END: "{5B}EEEEEEK!!!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0122:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $001A			  ; Params 00, 1A
		ScriptJump  loc_26FF4,$1	  ; Jump to address 0x026FF4
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $501,$3		  ; Run	text script at offset 0x0281F8
						  ; 0xE48E: PRINT MSG 0x04DB, MSGBOX CLEARED, END: "{5B}I shall	never forget the{57}fear I felt	in the mines{57}for as long as I live.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26FF4:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0135			  ; Bit	5 of flag 0x026
		ScriptID    $500,$1		  ; Flag set:	Run text script	at offset 0x0281F6
						  ; 0xE48D: PRINT MSG 0x04DA, MSGBOX CLEARED, END: "{5B}I was so scared!{5E}"
		ScriptID    $4FF,$2		  ; Flag clear:	Run text script	at offset 0x0281F4
						  ; 0xE48C: PRINT MSG 0x04D9, MSGBOX CLEARED, END: "{5B}H-help!{57}S-somebody help!!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0123:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $001A			  ; Params 00, 1A
		ScriptJump  loc_2700E,$1	  ; Jump to address 0x02700E
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $505,$3		  ; Run	text script at offset 0x028200
						  ; 0x8492: PRINT MSG 0x04DF: "{5B}The duke and	his soldiers{57}left for Destel.  The dwarves{57}in that village are all{62}"
						  ; 0x8493: PRINT MSG 0x04E0: "{5B}peaceful and	good-natured.{57}They have no weapons to{57}protect themselves.{62}"
						  ; 0xE494: PRINT MSG 0x04E1, MSGBOX CLEARED, END: "{5B}I'm afraid it'll be{57}a slaughter...{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_2700E:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0136			  ; Bit	6 of flag 0x026
		ScriptID    $503,$1		  ; Flag set:	Run text script	at offset 0x0281FC
						  ; 0x8490: PRINT MSG 0x04DD: "{5B}What	was the	duke{57}looking	for in this{57}mine, anyway?{62}"
						  ; 0xE491: PRINT MSG 0x04DE, MSGBOX CLEARED, END: "{5B}He kept	us digging{57}morning, noon, and night!{5E}"
		ScriptID    $502,$2		  ; Flag clear:	Run text script	at offset 0x0281FA
						  ; 0xE48F: PRINT MSG 0x04DC, MSGBOX CLEARED, END: "{5B}We're OK! Kill him!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0124:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $508,$1		  ; Run	text script at offset 0x028206
						  ; 0xE495: PRINT MSG 0x04E2, MSGBOX CLEARED, END: "{5B}Go!  GO!!....{5E}"
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $509,$3		  ; Run	text script at offset 0x028208
						  ; 0x8496: PRINT MSG 0x04E3: "{5B}What's Duke Mercator{57}doing now...?{62}"
						  ; 0xE497: PRINT MSG 0x04E4, MSGBOX CLEARED, END: "{5B}Nigel!	I really think{57}you're the only guy{57}who can defeat the duke!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0125:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $001A			  ; Params 00, 1A
		ScriptJump  loc_27036,$1	  ; Jump to address 0x027036
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $50D,$3		  ; Run	text script at offset 0x028210
						  ; 0x849A: PRINT MSG 0x04E7: "{5B}I know the mayor of Destel.{57}He comes here	often to{57}buy	fish.  He's a good man.{62}"
						  ; 0xE49B: PRINT MSG 0x04E8, MSGBOX CLEARED, END: "{5B}He said	they live{57}peacefully	there, growing{57}lovely, scented flowers...{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_27036:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0136			  ; Bit	6 of flag 0x026
		ScriptID    $50C,$1		  ; Flag set:	Run text script	at offset 0x02820E
						  ; 0xE499: PRINT MSG 0x04E6, MSGBOX CLEARED, END: "{5B}The duke must have{57}sold us out for the treasures.{5E}"
		ScriptID    $50B,$2		  ; Flag clear:	Run text script	at offset 0x02820C
						  ; 0xE498: PRINT MSG 0x04E5, MSGBOX CLEARED, END: "{5B}Hold out!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0126:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $001A			  ; Params 00, 1A
		ScriptJump  loc_27050,$1	  ; Jump to address 0x027050
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $513,$3		  ; Run	text script at offset 0x02821C
						  ; 0x84A0: PRINT MSG 0x04ED: "{5B}The tunnel between{57}Mercator and Verla is{57}finally open.{62}"
						  ; 0x84A1: PRINT MSG 0x04EE: "{5B}I can go to{57}Greenpea's everyday!{62}"
						  ; 0xE4A2: PRINT MSG 0x04EF, MSGBOX CLEARED, END: "{5B}Being kept in that dark	and{57}cramped tunnel for so long{57}really stressed me	out!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_27050:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0137			  ; Bit	7 of flag 0x026
		ScriptID    $510,$1		  ; Flag set:	Run text script	at offset 0x028216
						  ; 0x849D: PRINT MSG 0x04EA: "{5B}There is a small village on{57}the west side	of this	mine.{57}I saw Duke Mercator marching{62}"
						  ; 0x849E: PRINT MSG 0x04EB: "{5B}with	his soldiers along{57}the road that leads to{57}the village.{62}"
						  ; 0xE49F: PRINT MSG 0x04EC, MSGBOX CLEARED, END: "{5B}Do you know anything{57}about it?{57}What's going on?{5E}"
		ScriptID    $50F,$2		  ; Flag clear:	Run text script	at offset 0x028214
						  ; 0xE49C: PRINT MSG 0x04E9, MSGBOX CLEARED, END: "{5B}He'll kill us!!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0127:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $001A			  ; Params 00, 1A
		ScriptJump  loc_2706A,$1	  ; Jump to address 0x02706A
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $518,$3		  ; Run	text script at offset 0x028226
						  ; 0x7CDF: LOAD CUSTOM	ACTION 0xDF (0x012478 CSA_00DF), MSGBOX	CLEARED, END
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_2706A:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0137			  ; Bit	7 of flag 0x026
		ScriptID    $517,$1		  ; Flag set:	Run text script	at offset 0x028224
						  ; 0xE4A4: PRINT MSG 0x04F1, MSGBOX CLEARED, END: "{5B}Thank you very much.{57}You looked so cool{57}when you were fighting!{5E}"
		ScriptID    $516,$2		  ; Flag clear:	Run text script	at offset 0x028222
						  ; 0xE4A3: PRINT MSG 0x04F0, MSGBOX CLEARED, END: "{5B}eeeeEEEEK!!!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0128:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $001A			  ; Params 00, 1A
		ScriptJump  loc_27084,$1	  ; Jump to address 0x027084
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $51C,$3		  ; Run	text script at offset 0x02822E
						  ; 0xE4A8: PRINT MSG 0x04F5, MSGBOX CLEARED, END: "{5B}I found	the sword, but{57}I didn't tell the duke{57}about it!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_27084:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0137			  ; Bit	7 of flag 0x026
		ScriptJump  loc_27090,$1	  ; Flag set:	Jump to	address	0x027090
		ScriptID    $519,$2		  ; Flag clear:	Run text script	at offset 0x028228
						  ; 0xE4A5: PRINT MSG 0x04F2, MSGBOX CLEARED, END: "{5B}Don't look at ME...{57}GET 'im!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_27090:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $013D			  ; Bit	5 of flag 0x027
		ScriptID    $8E4,$1		  ; Flag set:	Run text script	at offset 0x0289BE
						  ; 0x1928: LOAD CHARACTER SCRIPT * (0x0128)
						  ; 0xE711: PRINT MSG 0x075E, MSGBOX CLEARED, END: "{5B}See!{57}It will	be opened soon!{5E}"
		ScriptID    $51A,$2		  ; Flag clear:	Run text script	at offset 0x02822A
						  ; 0x84A6: PRINT MSG 0x04F3: "{5B}I overheard the duke's men{57}say the digging was over{57}because they found{62}"
						  ; 0xE4A7: PRINT MSG 0x04F4, MSGBOX CLEARED, END: "{5B}what they were looking for.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0129:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $51D,$1		  ; Run	text script at offset 0x028230
						  ; 0xE4A9: PRINT MSG 0x04F6, MSGBOX CLEARED, END: "{5B}Dig!  Dig!{5E}"
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $51E,$3		  ; Run	text script at offset 0x028232
						  ; 0x84AA: PRINT MSG 0x04F7: "{5B}I had my suspicions{57}all along that this was no{57}ordinary mine.{62}"
						  ; 0xE4AB: PRINT MSG 0x04F8, MSGBOX CLEARED, END: "{5B}But who	would have{57}guessed that a legendary{57}treasure was hidden there!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_012A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $001A			  ; Params 00, 1A
		ScriptID    $520,$1		  ; Run	text script at offset 0x028236
						  ; 0xE4AC: PRINT MSG 0x04F9, MSGBOX CLEARED, END: "{5B}I have to keep at it.{57}Our lives are depending{57}on this...{5E}"
						  ;
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $521,$3		  ; Run	text script at offset 0x028238
						  ; 0x84AD: PRINT MSG 0x04FA: "{5B}That	tunnel in the mine{57}is the only way{57}to go to Destel.{62}"
						  ; 0xE4AE: PRINT MSG 0x04FB, MSGBOX CLEARED, END: "{5B}The sword?  We happened{57}to find it when we were{57}digging the tunnel.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_012B:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $523,$0		  ; Run	text script at offset 0x02823C
						  ; 0xE4AF: PRINT MSG 0x04FC, MSGBOX CLEARED, END: "{5B}I can't trust humans{57}anymore!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_012C:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $524,$0		  ; Run	text script at offset 0x02823E
						  ; 0xE4B0: PRINT MSG 0x04FD, MSGBOX CLEARED, END: "{5B}My house was ransacked{57}by many big soldiers!!...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0025:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $525,$1		  ; Run	text script at offset 0x028240
						  ; 0x84B1: PRINT MSG 0x04FE: "{5B}Why are humans so rude?!{57}They came from out of nowhere{57}and trampled down our{62}"
						  ; 0x84B2: PRINT MSG 0x04FF: "{5B}flower beds...{57}If	they wanted the	jewel,{57}they should have asked me...{62}"
						  ; 0x84B3: PRINT MSG 0x0500: "{5B}Jewel?  someone named{57}Mercator found it and{57}took it away.{62}"
						  ; 0x84B4: PRINT MSG 0x0501: "{5B}Why does he want such a{57}worthless	thing?	Flowers	and{57}seeds are prettier...and	they{62}"
						  ; 0xE4B5: PRINT MSG 0x0502, MSGBOX CLEARED, END: "{5B}smell good, too!{5E}"
						  ;
		dc.w $001C			  ; Params 00, 1C
		ScriptID    $52A,$3		  ; Run	text script at offset 0x02824A
						  ; 0x84B6: PRINT MSG 0x0503: "{5B}I was at the	inn, talking{57}about the ancient cave under{57}this village, when some{62}"
						  ; 0xE4B7: PRINT MSG 0x0504, MSGBOX CLEARED, END: "{5B}tourist	suddenly rushed	down{57}here, broke the	seal, and{57}disappeared down the cave...{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_012D:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $52C,$0		  ; Run	text script at offset 0x02824E
						  ; 0xE4B8: PRINT MSG 0x0505, MSGBOX CLEARED, END: "{5B}I've never seen such{57}rudeness in all my life!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_012E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $52D,$1		  ; Run	text script at offset 0x028250
						  ; 0x84B9: PRINT MSG 0x0506: "{5B}I don't like the hectic{57}pace of life in crowded towns,{57}so I live here quietly{62}"
						  ; 0x84BA: PRINT MSG 0x0507: "{5B}with	the dwarves.{62}"
						  ; 0xE4BB: PRINT MSG 0x0508, MSGBOX CLEARED, END: "{5B}I think	humans are wicked.{5E}"
						  ;
		dc.w $001C			  ; Params 00, 1C
		ScriptID    $530,$3		  ; Run	text script at offset 0x028256
						  ; 0x84BC: PRINT MSG 0x0509: "{5B}Once	I went down and{57}tried to look into the cave,{57}but it was impossible.{62}"
						  ; 0xE4BD: PRINT MSG 0x050A, MSGBOX CLEARED, END: "{5B}I don't think you can do it.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0026:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $532,$0		  ; Run	text script at offset 0x02825A
						  ; 0xE4BE: PRINT MSG 0x050B, MSGBOX CLEARED, END: "{5B}We just	want to	live{57}in peace...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0027:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $533,$0		  ; Run	text script at offset 0x02825C
						  ; 0xE4BF: PRINT MSG 0x050C, MSGBOX CLEARED, END: "{5B}Dwarves	are quite pious.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_012F:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $534,$0		  ; Run	text script at offset 0x02825E
						  ; 0xE4C0: PRINT MSG 0x050D, MSGBOX CLEARED, END: "{5B}I was scared!{57}The soldiers were{57}twice as tall as me!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0028:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $535,$0		  ; Run	text script at offset 0x028260
						  ; 0x84C1: PRINT MSG 0x050E: "{5B}Kindly's Item Shop!{62}"
						  ; 0xE4C2: PRINT MSG 0x050F, MSGBOX CLEARED, END: "{5B}I'm kind!{57}My brother is not...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0130:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $537,$0		  ; Run	text script at offset 0x028264
						  ; 0xE4C3: PRINT MSG 0x0510, MSGBOX CLEARED, END: "{5B}Welcome	to the{57}village of Destel.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0131:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $538,$1		  ; Run	text script at offset 0x028266
						  ; 0xE4C4: PRINT MSG 0x0511, MSGBOX CLEARED, END: "{5B}This well is the entrance{57}to	an ancient cave	where{57}monsters dwell.{5E}"
						  ;
		dc.w $001C			  ; Params 00, 1C
		ScriptID    $539,$3		  ; Run	text script at offset 0x028268
						  ; 0xE4C5: PRINT MSG 0x0512, MSGBOX CLEARED, END: "{5B}Sometimes, late	at night{57}you	can hear something{57}roaring in this well...{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0132:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $53A,$0		  ; Run	text script at offset 0x02826A
						  ; 0x84C6: PRINT MSG 0x0513: "{5B}My flowerbed	was{57}ruined.....{57}What were	they looking for?{62}"
						  ; 0xE4C7: PRINT MSG 0x0514, MSGBOX CLEARED, END: "{5B}I don't think I have{57}anything they'd want.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0133:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $53C,$0		  ; Run	text script at offset 0x02826E
						  ; 0x84C8: PRINT MSG 0x0515: "{5B}Big,	hulking	soldiers rushed{57}into	my house and demanded{57}to know where the jewel was!{62}"
						  ; 0xE4C9: PRINT MSG 0x0516, MSGBOX CLEARED, END: "{5B}What were they talking{57}about?  I have nothing{57}but	flower seeds.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0134:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $001B			  ; Params 00, 1B
		ScriptID    $53E,$1		  ; Run	text script at offset 0x028272
						  ; 0x84CA: PRINT MSG 0x0517: "{5B}Duke	Mercator suddenly{57}appeared and bought every{57}last raft I had!{62}"
						  ; 0xE4CB: PRINT MSG 0x0518, MSGBOX CLEARED, END: "{5B}He paid	me a whole{57}6	golds for them!	 He said{57}he was going to the	shrine.{5E}"
						  ;
		dc.w $001C			  ; Params 00, 1C
		ScriptID    $540,$3		  ; Run	text script at offset 0x028276
						  ; 0x84CC: PRINT MSG 0x0519: "{5B}Sorry!  All sold out...{57}You can still get	to the{57}shrine through the cave under{62}"
						  ; 0xE4CD: PRINT MSG 0x051A, MSGBOX CLEARED, END: "{5B}Destel,	but...{57}it's pretty dangerous.{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0029:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $542,$0		  ; Run	text script at offset 0x02827A
						  ; 0xE4CE: PRINT MSG 0x051B, MSGBOX CLEARED, END: "{5B}Beautiful waterfall, huh?{57}The people	of Destel take good{57}care to keep the	water clean.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002A:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $543,$0		  ; Run	text script at offset 0x02827C
						  ; 0xE4CF: PRINT MSG 0x051C, MSGBOX CLEARED, END: "{5B}I make a good living here{57}off the treasure hunters{57}who visit this	lake.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002B:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $544,$0		  ; Run	text script at offset 0x02827E
						  ; 0x84D0: PRINT MSG 0x051D: "{5B}Hi, stranger.  You are{57}the first visitor we've had{57}in 300 years.{62}"
						  ; 0xE4D1: PRINT MSG 0x051E, MSGBOX CLEARED, END: "{5B}Wh-what?  Another{57}dictator has risen	to power{57}on the surface?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0135:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $546,$0		  ; Run	text script at offset 0x028282
						  ; 0x84D2: PRINT MSG 0x051F: "{5B}King	Nole gave us eternal{57}youth in reward	for building{57}his underground	palace.{62}"
						  ; 0xE4D3: PRINT MSG 0x0520, MSGBOX CLEARED, END: "{5B}I like the calm	life here.{57}I	don't want to go back{57}to the surface...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0136:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $548,$0		  ; Run	text script at offset 0x028286
						  ; 0x84D4: PRINT MSG 0x0521: "{5B}You have to go through{57}a huge and	complex	labyrinth{57}to	get to the palace.{62}"
						  ; 0x84D5: PRINT MSG 0x0522: "{5B}The maze was	designed{57}by King Nole himself.{62}"
						  ; 0x84D6: PRINT MSG 0x0523: "{5B}It's impossible even{57}for us to go through.{62}"
						  ; 0xE4D7: PRINT MSG 0x0524, MSGBOX CLEARED, END: "{5B}What a greedy man he was!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002C:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $54C,$0		  ; Run	text script at offset 0x02828E
						  ; 0x84D8: PRINT MSG 0x0525: "{5B}There is no priest here,{57}but I've meditated on{57}the goddess for 300 years,{62}"
						  ; 0xE4D9: PRINT MSG 0x0526, MSGBOX CLEARED, END: "{5B}so I am	the substitute.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0137:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $54E,$0		  ; Run	text script at offset 0x028292
						  ; 0x84DA: PRINT MSG 0x0527: "{5B}I worked for	King Nole{57}so	I could	have eternal life.{62}"
						  ; 0x84DB: PRINT MSG 0x0528: "{5B}But now I just idle my{57}time away{59}...{59}...{59}sigh!...{62}"
						  ; 0xE4DC: PRINT MSG 0x0529, MSGBOX CLEARED, END: "{5B}Got any	comic books?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0138:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $551,$0		  ; Run	text script at offset 0x028298
						  ; 0x84DD: PRINT MSG 0x052A: "{5B}There are three monsters{57}in the labyrinth	called{57}"Gehenna's Gatekeepers."{62}"
						  ; 0xE4DE: PRINT MSG 0x052B, MSGBOX CLEARED, END: "{5B}You have to defeat them{57}to open the gateway{57}to the palace.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002D:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $553,$0		  ; Run	text script at offset 0x02829C
						  ; 0xE4DF: PRINT MSG 0x052C, MSGBOX CLEARED, END: "{5B}Hi!  The original owner	of{57}this shop	left one day 200{57}years ago and never	returned.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0139:
		move.w	#$000A,d0
		bsr.w	TestFlagBit
		beq.s	loc_27172

loc_2716C:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $A03,$0		  ; Run	text script at offset 0x028BFC
						  ; 0x1939: LOAD CHARACTER SCRIPT * (0x0139)
						  ; 0xE7C4: PRINT MSG 0x0811, MSGBOX CLEARED, END: "{5B}See you	again!{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_2718A
; ---------------------------------------------------------------------------

loc_27172:					  ; CODE XREF: ROM:0002716Aj
		move.w	#$0008,d0
		bsr.w	TestFlagBit
		beq.s	loc_27182

loc_2717C:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $9FC,$0		  ; Run	text script at offset 0x028BEE
						  ; 0x1939: LOAD CHARACTER SCRIPT * (0x0139)
						  ; 0xE7C0: PRINT MSG 0x080D, MSGBOX CLEARED, END: "{5B}Good luck!{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_2718A
; ---------------------------------------------------------------------------

loc_27182:					  ; CODE XREF: ROM:0002717Aj
		move.w	#$0132,(g_Character).l

locret_2718A:					  ; CODE XREF: ROM:00027170j
						  ; ROM:00027180j
		rts
; ---------------------------------------------------------------------------

CS_013A:
		move.w	#$000A,d0
		bsr.w	TestFlagBit
		beq.s	loc_2719C

loc_27196:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $A03,$0		  ; Run	text script at offset 0x028BFC
						  ; 0x1939: LOAD CHARACTER SCRIPT * (0x0139)
						  ; 0xE7C4: PRINT MSG 0x0811, MSGBOX CLEARED, END: "{5B}See you	again!{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_271B4
; ---------------------------------------------------------------------------

loc_2719C:					  ; CODE XREF: ROM:00027194j
		move.w	#$0008,d0
		bsr.w	TestFlagBit
		beq.s	loc_271AC

loc_271A6:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $9FC,$0		  ; Run	text script at offset 0x028BEE
						  ; 0x1939: LOAD CHARACTER SCRIPT * (0x0139)
						  ; 0xE7C0: PRINT MSG 0x080D, MSGBOX CLEARED, END: "{5B}Good luck!{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_271B4
; ---------------------------------------------------------------------------

loc_271AC:					  ; CODE XREF: ROM:000271A4j
		move.w	#$0159,(g_Character).l

locret_271B4:					  ; CODE XREF: ROM:0002719Aj
						  ; ROM:000271AAj
		rts
; ---------------------------------------------------------------------------

CS_013B:
		move.w	#$000A,d0
		bsr.w	TestFlagBit
		beq.s	loc_271C6

loc_271C0:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $A03,$0		  ; Run	text script at offset 0x028BFC
						  ; 0x1939: LOAD CHARACTER SCRIPT * (0x0139)
						  ; 0xE7C4: PRINT MSG 0x0811, MSGBOX CLEARED, END: "{5B}See you	again!{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_271DE
; ---------------------------------------------------------------------------

loc_271C6:					  ; CODE XREF: ROM:000271BEj
		move.w	#$0008,d0
		bsr.w	TestFlagBit
		beq.s	loc_271D6

loc_271D0:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $9FC,$0		  ; Run	text script at offset 0x028BEE
						  ; 0x1939: LOAD CHARACTER SCRIPT * (0x0139)
						  ; 0xE7C0: PRINT MSG 0x080D, MSGBOX CLEARED, END: "{5B}Good luck!{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_271DE
; ---------------------------------------------------------------------------

loc_271D6:					  ; CODE XREF: ROM:000271CEj
		move.w	#$0135,(g_Character).l

locret_271DE:					  ; CODE XREF: ROM:000271C4j
						  ; ROM:000271D4j
		rts
; ---------------------------------------------------------------------------

CS_013C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0009			  ; Params 00, 09
		ScriptID    $A14,$1		  ; Run	text script at offset 0x028C1E
						  ; 0xE7D0: PRINT MSG 0x081D, MSGBOX CLEARED, END: "{5B}I'm sorry.{57}This is a private area.{57}No admittance!{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptJump  loc_271EE,$3	  ; Jump to address 0x0271EE
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_271EE:
		move.w	#$014B,d0
		bsr.w	TestFlagBit
		bne.s	loc_27202
		move.w	#$0137,(g_Character).l
		bra.s	locret_27206
; ---------------------------------------------------------------------------

loc_27202:					  ; CODE XREF: ROM:000271F6j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $A19,$0		  ; Run	text script at offset 0x028C28
						  ; 0x193C: LOAD CHARACTER SCRIPT * (0x013C)
						  ; 0xE7D3: PRINT MSG 0x0820, MSGBOX CLEARED, END: "{5B}Welcome	to{57}the Casino Arthurlier!{57}Have fun!{5E}"
; ---------------------------------------------------------------------------

locret_27206:					  ; CODE XREF: ROM:00027200j
		rts
; ---------------------------------------------------------------------------

CS_013D:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
word_2720C:	dc.w $00E5			  ; Bit	5 of flag 0x01C
		ScriptID    $A67,$1		  ; Flag clear:	Run text script	at offset 0x028CC4
						  ; 0x1BF3: LOAD SPECIAL CHARACTER Pixie (0x0B)
						  ; 0x87FF: PRINT MSG 0x084C: "{5B}Oh, Friday!{57}To think I have not seen you{57}for 256 years!{62}"
						  ; 0x8800: PRINT MSG 0x084D: "{5B}Do you remember that{57}terrible war	with King Nole?{62}"
						  ; 0x8801: PRINT MSG 0x084E: "{5B}Wasn't that{57}the worst experience?{62}"
						  ; 0x8802: PRINT MSG 0x084F: "{5B}What?  YOU'RE{57}looking for the treasures{57}of King Nole?{62}"
						  ; 0x8803: PRINT MSG 0x0850: "{5B}Be careful!{57}He's dead, but...{62}"
						  ; 0xE804: PRINT MSG 0x0851, MSGBOX CLEARED, END: "{5B}he would surely	rise{57}from the grave to protect{57}his treasures...{5E}"
		ScriptID    $A6E,$2		  ; Flag set:	Run text script	at offset 0x028CD2
						  ; 0x1BF3: LOAD SPECIAL CHARACTER Pixie (0x0B)
						  ; 0xE805: PRINT MSG 0x0852, MSGBOX CLEARED, END: "{5B}Your boyfriend{57}is cute, huh?{5E}"
; ---------------------------------------------------------------------------
		rts				  ; Run	text script at offset 0x02C080
						  ; 0xA354: PRINT MSG 0x03A1: "{5B}I want to enjoy life{57}once	again!	I'll ask her to{57}cast a spell on me!{5E}"
						  ;
; ---------------------------------------------------------------------------

CS_013E:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00E6			  ; Bit	6 of flag 0x01C
		ScriptID    $A70,$1		  ; Flag clear:	Run text script	at offset 0x028CD6
						  ; 0x1BF4: LOAD SPECIAL CHARACTER Trixie (0x0C)
						  ; 0x8806: PRINT MSG 0x0853: "{5B}Friday, it's you!{57}Well, you're with a{57}boy as usual.{62}"
						  ; 0x8807: PRINT MSG 0x0854: "{5B}...let's see...hmmm...{59}{57}...Hey, he's really cute!!{57}Where did you find him?{62}"
						  ; 0x1BE9: LOAD SPECIAL CHARACTER Friday (0x01)
						  ; 0x8808: PRINT MSG 0x0855: "{5B}Trixie!{57}He saved my life!{57}He's my...!{62}"
						  ; 0x1BF4: LOAD SPECIAL CHARACTER Trixie (0x0C)
						  ; 0xE809: PRINT MSG 0x0856, MSGBOX CLEARED, END: "{5B}OK, OK!{57}I'm sorry!{5E}"
		ScriptID    $A77,$2		  ; Flag set:	Run text script	at offset 0x028CE4
						  ; 0x1BF4: LOAD SPECIAL CHARACTER Trixie (0x0C)
						  ; 0xE80A: PRINT MSG 0x0857, MSGBOX CLEARED, END: "{5B}You like boys, right?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_NULL:
		rts
; ---------------------------------------------------------------------------

CS_002E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0017			  ; Params 00, 17
		ScriptID    $4BC,$1		  ; Run	text script at offset 0x02816E
						  ; 0xE452: PRINT MSG 0x049F, MSGBOX CLEARED, END: "{5B}Hey!  How did you{57}escape?!!	I'm not through{57}with you yet!!{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptJump  loc_27230,$3	  ; Jump to address 0x027230
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_27230:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00E7			  ; Bit	7 of flag 0x01C
		ScriptID    $4BD,$1		  ; Flag clear:	Run text script	at offset 0x028170
						  ; 0x8453: PRINT MSG 0x04A0: "{5B}Arrrrgh!  All I wanted was{57}a few,	measly treasures!  Now{57}We're dead broke!{62}"
						  ; 0x8454: PRINT MSG 0x04A1: "{5B}This	is another fine	mess{57}you've gotten me into!!{62}"
						  ; 0x8455: PRINT MSG 0x04A2: "{5B}The way we could afford{57}to go back to the	continent{57}was on the	prison ship,{62}"
						  ; 0x8456: PRINT MSG 0x04A3: "{5B}so I	had them arrest	me!{57}But, phew!  What	a stink!{57}I can't stand it in here!{62}"
						  ; 0xE457: PRINT MSG 0x04A4, MSGBOX CLEARED, END: "{5B}Stinky...slimy...YUK!!{57}Jailor!{57}Gimme a better room!!{5E}"
		ScriptID    $4C2,$2		  ; Flag set:	Run text script	at offset 0x02817A
						  ; 0xE458: PRINT MSG 0x04A5, MSGBOX CLEARED, END: "{5B}I won't forget you{57}for this, Nigel!!  I swear one{57}day I'll pay you back!!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0012			  ; Params 00, 12
		ScriptID    $4C3,$1		  ; Run	text script at offset 0x02817C
						  ; 0xE459: PRINT MSG 0x04A6, MSGBOX CLEARED, END: "{5B}...burp!...{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $4C4,$3		  ; Run	text script at offset 0x02817E
						  ; 0xE45A: PRINT MSG 0x04A7, MSGBOX CLEARED, END: "{5B}Give me	those treasures!{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $4C5,$5		  ; Run	text script at offset 0x028180
						  ; 0xE45B: PRINT MSG 0x04A8, MSGBOX CLEARED, END: "{5B}Stiiiiinky...{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0030:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0012			  ; Params 00, 12
		ScriptID    $4C6,$1		  ; Run	text script at offset 0x028182
						  ; 0xE45C: PRINT MSG 0x04A9, MSGBOX CLEARED, END: "{5B}...BURRRRP!!...{5E}"
						  ;
		dc.w $0017			  ; Params 00, 17
		ScriptID    $7DF,$3		  ; Run	text script at offset 0x0287B4
						  ; 0xE671: PRINT MSG 0x06BE, MSGBOX CLEARED, END: "{5B}Help meeee!{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $4C7,$5		  ; Run	text script at offset 0x028184
						  ; 0xE45D: PRINT MSG 0x04AA, MSGBOX CLEARED, END: "{5B}Slimeeeee...{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0031:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $4C8,$0		  ; Run	text script at offset 0x028186
						  ; 0x1831: LOAD CHARACTER SCRIPT Duke (0x0031)
						  ; 0x845E: PRINT MSG 0x04AB: "{5B}All right, already!	Such{57}superior swordsmanship...{57}I was wrong, you convinced	me!{62}"
						  ; 0xE45F: PRINT MSG 0x04AC, MSGBOX CLEARED, END: "{5B}Go ahead, take the treasures.{57}They're all yours, if you'll{57}just stop hitting me!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0032:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0010			  ; Params 00, 10
		ScriptJump  loc_2727C,$1	  ; Jump to address 0x02727C
						  ;
		dc.w $0011			  ; Params 00, 11
		ScriptID    $447,$3		  ; Run	text script at offset 0x028084
						  ; 0xE3E8: PRINT MSG 0x0435, MSGBOX CLEARED, END: "{5B}A dinner party!{57}Do they serve any of	my{57}favorites, like raw meat?{5E}"
						  ;
		dc.w $0013			  ; Params 00, 13
		ScriptID    $448,$5		  ; Run	text script at offset 0x028086
						  ; 0x83E9: PRINT MSG 0x0436: "{5B}You may tag along{57}behind me tomorrow{57}if you want.{62}"
						  ; 0xE3EA: PRINT MSG 0x0437, MSGBOX CLEARED, END: "{5B}It must	be kind	of a{57}burden to be so	puny!{5E}"
						  ;
		dc.w $001D			  ; Params 00, 1D
		ScriptID    $44A,$7		  ; Run	text script at offset 0x02808A
						  ; 0x7CFA: LOAD CUSTOM	ACTION 0xFA (0x0124E4 CSA_00FA), MSGBOX	CLEARED, END
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_2727C:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00C9			  ; Bit	1 of flag 0x019
		ScriptJump  loc_27288,$1	  ; Flag clear:	Jump to	address	0x027288
		ScriptID    $446,$2		  ; Flag set:	Run text script	at offset 0x028082
						  ; 0xE3E7: PRINT MSG 0x0434, MSGBOX CLEARED, END: "{5B}This gorgeous castle is{57}well	worth exploring.....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_27288:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $441,$0		  ; Prompt:	  Run text script at offset 0x028078
						  ; 0x83E2: PRINT MSG 0x042F: "{5B}Nigel, hmm...I'm sure I've{57}heard that name before....{57}Of course!  You're the one who{62}"
						  ; 0xA3E3: PRINT MSG 0x0430, END: "{5B}stole the Statue of{57}Jypta, aren't you?{58}"
		ScriptID    $443,$1		  ; Answer 'yes': Run text script at offset 0x02807C
						  ; 0xE3E4: PRINT MSG 0x0431, MSGBOX CLEARED, END: "{5B}I knew it!  But	don't{57}worry...your secret's safe{57}with me.....{62}"
		ScriptID    $444,$2		  ; Answer 'no':  Run text script at offset 0x02807E
						  ; 0x83E5: PRINT MSG 0x0432: "{5B}Yes,	you are!{57}A veteran bounty hunter can{57}easily tell his fellow thief!{62}"
						  ; 0xE3E6: PRINT MSG 0x0433, MSGBOX CLEARED, END: "{5B}But don't worry!  The{57}5000 Gold reward for your{57}head is peanuts to me!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0033:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0010			  ; Params 00, 10
		ScriptID    $44B,$1		  ; Run	text script at offset 0x02808C
						  ; 0xE3EB: PRINT MSG 0x0438, MSGBOX CLEARED, END: "{5B}Duke Mercator was a{57}famous swordsman	in Gamoor.{57}I	look up	to him.{5E}"
						  ;
		dc.w $0011			  ; Params 00, 11
		ScriptID    $44C,$3		  ; Run	text script at offset 0x02808E
						  ; 0x83EC: PRINT MSG 0x0439: "{5B}To be invited by the	duke{57}is a great honor!  I waited{57}over 20 years to	get{62}"
						  ; 0xE3ED: PRINT MSG 0x043A, MSGBOX CLEARED, END: "{5B}this chance...but you look{57}very young!  How old are you?{5E}"
						  ;
		dc.w $0013			  ; Params 00, 13
		ScriptID    $44E,$5		  ; Run	text script at offset 0x028092
						  ; 0xE3EE: PRINT MSG 0x043B, MSGBOX CLEARED, END: "{5B}I would	give my	life to	be{57}of any service to	him!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0034:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0016			  ; Params 00, 16
		ScriptID    $4CF,$1		  ; Run	text script at offset 0x028194
						  ; 0xE462: PRINT MSG 0x04AF, MSGBOX CLEARED, END: "{5B}You came here just{57}following	his words...{57}How innocent you are...!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0035:
		rts
; ---------------------------------------------------------------------------

CS_0036:
		rts
; ---------------------------------------------------------------------------

CS_0037:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0018			  ; Params 00, 18
		ScriptID    $4E1,$1		  ; Run	text script at offset 0x0281B8
						  ; 0xE470: PRINT MSG 0x04BD, MSGBOX CLEARED, END: "{5B}Bow-wow{5E}"
						  ;
		dc.w $0019			  ; Params 00, 19
		ScriptID    $4E2,$3		  ; Run	text script at offset 0x0281BA
						  ; 0xE471: PRINT MSG 0x04BE, MSGBOX CLEARED, END: "{5B}I shall	never forget{57}your kindness!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0038:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0018			  ; Params 00, 18
		ScriptID    $4E3,$1		  ; Run	text script at offset 0x0281BC
						  ; 0x7CC6: LOAD CUSTOM	ACTION 0xC6 (0x012414 CSA_00C6), MSGBOX	CLEARED, END
						  ;
		dc.w $0019			  ; Params 00, 19
		ScriptID    $851,$3		  ; Run	text script at offset 0x028898
						  ; 0xE6BA: PRINT MSG 0x0707, MSGBOX CLEARED, END: "{5B}Visit me anytime!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0039:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00DF			  ; Bit	7 of flag 0x01B
		ScriptID    $8A7,$1		  ; Flag set:	Run text script	at offset 0x028944
						  ; 0x86E9: PRINT MSG 0x0736: "{5B}My name is Kado.{57}I was once a famous{57}swordsman.{62}"
						  ; 0x86EA: PRINT MSG 0x0737: "{5B}I used to work at the{57}castle, but	retired.  I didn't{57}like town life.{62}"
						  ; 0x86EB: PRINT MSG 0x0738: "{5B}Are you a treasure{57}hunter?  Then you must	need{57}a better sword than that...{62}"
						  ; 0x0001: LOAD 0x0001	INTO 0xFF1196 (Magic Sword)
						  ; 0x17E8: RECEIVE ITEM [0xFF1196]
						  ; 0x1839: LOAD CHARACTER SCRIPT Kado (0x0039)
						  ; 0x86EC: PRINT MSG 0x0739: "{5B}It has a special power.{62}"
						  ; 0x86ED: PRINT MSG 0x073A: "{5B}When	the sword is fully{57}charged, a magic flame will{57}burn any enemy it touches!{62}"
						  ; 0xE6EE: PRINT MSG 0x073B, MSGBOX CLEARED, END: "{5B}I think	you can{57}appreciate the value{57}of the sword.{62}"
		ScriptJump  loc_272DC,$2	  ; Flag clear:	Jump to	address	0x0272DC
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_272DC:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00E3			  ; Bit	3 of flag 0x01C
		ScriptID    $8B0,$1		  ; Flag set:	Run text script	at offset 0x028956
						  ; 0x86EF: PRINT MSG 0x073C: "{5B}How do you like it?{62}"
						  ; 0x86F0: PRINT MSG 0x073D: "{5B}There are other magic{57}swords somewhere on{57}this	island.{62}"
						  ; 0x0403: LOAD 0x0003	INTO 0xFF1198 (Thunder Sword)
						  ; 0x0802: LOAD 0x0002	INTO 0xFF119A (Sword of	Ice)
						  ; 0x86F1: PRINT MSG 0x073E: "{5B}They	are called{57}{5F} and {5F}...{62}"
						  ; 0xE6F2: PRINT MSG 0x073F, MSGBOX CLEARED, END: "{5B}Also, I	don't know if it's{57}true, but there's supposed{57}to be a legendary Gaia Sword!{5E}"
		ScriptID    $8AF,$2		  ; Flag clear:	Run text script	at offset 0x028954
						  ; 0xE6EE: PRINT MSG 0x073B, MSGBOX CLEARED, END: "{5B}I think	you can{57}appreciate the value{57}of the sword.{62}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_003A:
		move.w	#ITM_SUNSTONE,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	loc_272F8
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $4DE,$0		  ; Run	text script at offset 0x0281B2
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0x846E: PRINT MSG 0x04BB: "{5B}You've found the {5F}!{62}"
						  ; 0xE46F: PRINT MSG 0x04BC, MSGBOX CLEARED, END: "{5B}Perhaps	you know this{57}forest	better than me!	 Will{57}you take my place?{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_2730C
; ---------------------------------------------------------------------------

loc_272F8:					  ; CODE XREF: ROM:000272F0j
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $00D7			  ; Bit	7 of flag 0x01A
		ScriptID    $4D0,$1		  ; Flag set:	Run text script	at offset 0x028196
						  ; 0x8463: PRINT MSG 0x04B0: "{5B}My name is Old Gol.{57}I'm the keeper of Greenmaze.{57}My father was{62}"
						  ; 0x8464: PRINT MSG 0x04B1: "{5B}once	a keeper, too.{57}What can I do	for you?{62}"
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0x081E: LOAD 0x001E	INTO 0xFF119A (Sun Stone)
						  ; 0x8465: PRINT MSG 0x04B2: "{5B}{5F}, hmmmm...{57}Yes, it's hidden in the depths{57}of this forest, but...{62}"
						  ; 0x8466: PRINT MSG 0x04B3: "{5B}The naughty little gnomes{57}that live here have{57}changed the routes{62}"
						  ; 0xA467: PRINT MSG 0x04B4, END: "{5B}Do you need tips about{57}walking in the woods?{58}"
		ScriptID    $4D6,$2		  ; Flag clear:	Run text script	at offset 0x0281A2
						  ; 0xA467: PRINT MSG 0x04B4, END: "{5B}Do you need tips about{57}walking in the woods?{58}"
; ---------------------------------------------------------------------------
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptJump  CS_NULL,$0		  ; Prompt:	  Jump to address 0x037220
		ScriptID    $4D7,$1		  ; Answer 'yes': Run text script at offset 0x0281A4
						  ; 0x8468: PRINT MSG 0x04B5: "{5B}First, don't look at the{57}bottom of the trees.  If{57}you see a gap between{62}"
						  ; 0x8469: PRINT MSG 0x04B6: "{5B}the tops of two lines of{57}trees, it might be a route.{57}If you get stuck there,{62}"
						  ; 0x846A: PRINT MSG 0x04B7: "{5B}try jumping up.  There{57}might be a	hidden step or{57}obstacle in front of you{62}"
						  ; 0x846B: PRINT MSG 0x04B8: "{5B}Also, there are many{57}underpasses.	 Some are{57}shortcuts,	and some are not.{62}"
						  ; 0x846C: PRINT MSG 0x04B9: "{5B}You should memorize the{57}surroundings before going{57}down	the underpass.{62}"
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0xE46D: PRINT MSG 0x04BA, MSGBOX CLEARED, END: "{5B}The {5F} is in{57}the northeast	sector of{57}this forest.{5E}"
		ScriptID    $4DC,$2		  ; Answer 'no':  Run text script at offset 0x0281AE
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0xE46D: PRINT MSG 0x04BA, MSGBOX CLEARED, END: "{5B}The {5F} is in{57}the northeast	sector of{57}this forest.{5E}"
; ---------------------------------------------------------------------------

locret_2730C:					  ; CODE XREF: ROM:000272F6j
		rts
; ---------------------------------------------------------------------------

CS_013F:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $4CE,$0		  ; Run	text script at offset 0x028192
						  ; 0x7C81: LOAD CUSTOM	ACTION 0x81 (0x012300 CSA_0081), MSGBOX	CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0140:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $4E4,$0		  ; Run	text script at offset 0x0281BE
						  ; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
						  ; 0x8472: PRINT MSG 0x04BF: "{5B}Hi, nice to meet you.{57}I can't see you, but you look{57}fine.  Something to eat?{62}"
						  ; 0x8473: PRINT MSG 0x04C0: "{5B}I can't see you, but{57}you look happy.  Visit me{57}anytime you like.{62}"
						  ; 0xE474: PRINT MSG 0x04C1, MSGBOX CLEARED, END: "{5B}I can't see you, but{57}you look brave.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_003B:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $4E8,$0		  ; Run	text script at offset 0x0281C6
						  ; 0xE475: PRINT MSG 0x04C2, MSGBOX CLEARED, END: "{5B}Good afternoon.{57}Make	yourself at home.{57}Ho	ho ho...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_003C:					  ; DATA XREF: ROM:00027326t
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $0005			  ; Params 00, 05
		ScriptID    $4E9,$1		  ; Run	text script at offset 0x0281C8
						  ; 0xE476: PRINT MSG 0x04C3, MSGBOX CLEARED, END: "{5B}Arf!  Arf!{57}Bow-wow-wow!{5E}"
						  ;
		dc.w $0201			  ; Params 02, 01
		ScriptID    $4EC,$3		  ; Run	text script at offset 0x0281CE
						  ; 0xE479: PRINT MSG 0x04C6, MSGBOX CLEARED, END: "{5B}I want to see Bell!{57}I want to see Bell!{5E}"
						  ;
		dc.w $0202			  ; Params 02, 02
		ScriptID    $4EA,$5		  ; Run	text script at offset 0x0281CA
						  ; 0xE477: PRINT MSG 0x04C4, MSGBOX CLEARED, END: "{5B}We cannot return to{57}our original forms until	that{57}miserable witch	is defeated.{5E}"
						  ;
		dc.w $0203			  ; Params 02, 03
		ScriptID    $4EB,$7		  ; Run	text script at offset 0x0281CC
						  ; 0xE478: PRINT MSG 0x04C5, MSGBOX CLEARED, END: "{5B}Thanks again for{57}all	you've done!{5E}"
						  ;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0141:					  ; CS_0138
		move.w	#$0138,(g_Character).l
		rts
; ---------------------------------------------------------------------------

CS_0142:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $014D			  ; Bit	5 of flag 0x029
		ScriptJump  loc_2734C,$1	  ; Flag set:	Jump to	address	0x02734C
		ScriptID    $A2A,$2		  ; Flag clear:	Run text script	at offset 0x028C4A
						  ; 0x14E0: SET	BIT 0 OF FLAG 0x01C
						  ; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
						  ; 0x87DB: PRINT MSG 0x0828: "{5B}You need a raft.{57}If you want to go down the{57}river, find my son	and{62}"
						  ; 0x042F: LOAD 0x002F	INTO 0xFF1198 (Logs)
						  ; 0xE7DC: PRINT MSG 0x0829, MSGBOX CLEARED, END: "{5B}get some {5F}.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

loc_2734C:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $015B			  ; Bit	3 of flag 0x02B
		ScriptID    $A32,$1		  ; Flag set:	Run text script	at offset 0x028C5A
						  ; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
						  ; 0xE7DE: PRINT MSG 0x082B, MSGBOX CLEARED, END: "{5B}Take care of yourself!{5E}"
		ScriptID    $A2F,$2		  ; Flag clear:	Run text script	at offset 0x028C54
						  ; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
						  ; 0x042F: LOAD 0x002F	INTO 0xFF1198 (Logs)
						  ; 0xE7DD: PRINT MSG 0x082A, MSGBOX CLEARED, END: "{5B}You can	go ahead{57}with the {5F}!{57}Good luck!{5E}"
; ---------------------------------------------------------------------------
		rts
