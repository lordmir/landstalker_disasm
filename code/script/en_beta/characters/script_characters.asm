; ---------------------------------------------------------------------------

CS_0143:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $102,$0	; Prompt:	Run text script	at offset 0x027922
					; 0x1834: LOAD CHARACTER SCRIPT	Mir (0x0034)
					; 0xA0F1: PRINT	MSG 0x013E, END: "{5B}:	Go back	now, and you'll{57}be given something good, OK?{58}"
		ScriptID    $104,$1	; Answer 'yes': Run text script at offset 0x027926
					; 0x75C7: SET BIT 7 OF FLAG 0x038, MSGBOX CLEARED, END
		ScriptJump  ClearTextbox,$2 ; Answer 'no':  Jump to address 0x028EAA
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0000:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $10E,$1	; Run text script at offset 0x02793A
					; 0xE0FB: PRINT	MSG 0x0148, MSGBOX CLEARED, END: "{5B}:	The treasures of King Nole?{57}....Oh, yeah!  I...{59}{57}...er...have no idea.....{5E}"
					;
		dc.w 1			; Params 00, 01
		ScriptID    $10F,$3	; Run text script at offset 0x02793C
					; 0xE0FC: PRINT	MSG 0x0149, MSGBOX CLEARED, END: "{5B}:	The bridge has been smashed!{57}The youngsters are planning{57}to make a raid on Gumi.{5E}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $110,$5	; Run text script at offset 0x02793E
					; 0xE0FD: PRINT	MSG 0x014A, MSGBOX CLEARED, END: "{5B}:	...oh, please....{57}please save my Fara!.....{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $111,$7	; Run text script at offset 0x027940
					; 0x1422: SET BIT 2 OF FLAG 0x004
					; 0x80FE: PRINT	MSG 0x014B: "{5B}: Nigel!{57}I humbly thank you...!{57}Thanks for everything!{62}"
					; 0x80FF: PRINT	MSG 0x014C: "{5B}: Like	the saying says,{57}"sparkles are the best way to{57}express one's gratitude."{62}"
					; 0x8100: PRINT	MSG 0x014D: "{5B}: The people of Massan{57}are extremely thankful.{57}Please take this jewel, Nigel!{62}"
					; 0x0028: LOAD 0x0028 INTO 0xFF1196 (Red{6A}Jewel)
					; 0x17E8: RECEIVE ITEM [0xFF1196]
					; 0x1800: LOAD CHARACTER SCRIPT	Mayor (0x0000)
					; 0xE101: PRINT	MSG 0x014E, MSGBOX CLEARED, END: "{5B}:	Don't forget about us.{5E}"
					;
		dc.w 5			; Params 00, 05
		ScriptID    $118,$9	; Run text script at offset 0x02794E
					; 0xE101: PRINT	MSG 0x014E, MSGBOX CLEARED, END: "{5B}:	Don't forget about us.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0001:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $119,$1	; Run text script at offset 0x027950
					; 0xE102: PRINT	MSG 0x014F, MSGBOX CLEARED, END: "{5B}:	Are you	OK?{57}Take care!{5E}"
					;
		dc.w 1			; Params 00, 01
		ScriptID    $11A,$3	; Run text script at offset 0x027952
					; 0xE103: PRINT	MSG 0x0150, MSGBOX CLEARED, END: "{5B}:	There is a rumor that{57}Gumi is possessed{57}by an evil spirit.{5E}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $11B,$5	; Run text script at offset 0x027954
					; 0xE104: PRINT	MSG 0x0151, MSGBOX CLEARED, END: "{5B}:	I'm all right.{57}Get those monsters first!!{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $11C,$7	; Run text script at offset 0x027956
					; 0x8105: PRINT	MSG 0x0152: "{5B}: Oh, Nigel...sigh...{57}You looked so	brave fighting{57}the Orc Kings...{62}"
					; 0xE106: PRINT	MSG 0x0153, MSGBOX CLEARED, END: "{5B}:	If only	my father's{57}red jewel were our dowry!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $11E,$1	; Run text script at offset 0x02795A
					; 0xE107: PRINT	MSG 0x0154, MSGBOX CLEARED, END: "{5B}:	Somebody's gotta put{57}those Gumi savages in their{57}place!  If only I were younger....{5E}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $11F,$3	; Run text script at offset 0x02795C
					; 0xE108: PRINT	MSG 0x0155, MSGBOX CLEARED, END: "{5B}:	That's it!  That's the last{57}straw!!  I'll do it!!{5E}"
					;
		dc.w 3			; Params 00, 03
		ScriptID    $120,$5	; Run text script at offset 0x02795E
					; 0x8109: PRINT	MSG 0x0156: "{5B}: They	took Fara{57}into the shrine.  We tried	to{57}go in, but....{62}"
					; 0xE10A: PRINT	MSG 0x0157, MSGBOX CLEARED, END: "{5B}:	the door wouldn't open.{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $122,$7	; Run text script at offset 0x027962
					; 0xE10B: PRINT	MSG 0x0158, MSGBOX CLEARED, END: "{5B}:	I can see now that I was{57}wrong....The tribesmen of{57}Gumi are our brothers{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $123,$1	; Run text script at offset 0x027964
					; 0xE10C: PRINT	MSG 0x0159, MSGBOX CLEARED, END: "{5B}:	Be careful what	you say....{57}my husband is enraged!{5E}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $124,$3	; Run text script at offset 0x027966
					; 0x810D: PRINT	MSG 0x015A: "{5B}: My husband and son{57}stormed out of	the room....{62}"
					; 0xE10E: PRINT	MSG 0x015B, MSGBOX CLEARED, END: "{5B}:	I'm so worried...{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $126,$5	; Run text script at offset 0x02796A
					; 0x810F: PRINT	MSG 0x015C: "{5B}: Thank you, Nigel.{57}Now that Massan	and Gumi{57}are	friends	once more,{62}"
					; 0xE110: PRINT	MSG 0x015D, MSGBOX CLEARED, END: "{5B}:	peace and harmony{57}will be restored{57}to our	village!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0002:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptJump  CS_0002_0,$1 ; Jump	to address 0x025F2E
					;
		dc.w 2			; Params 00, 02
		ScriptID    $12C,$3	; Run text script at offset 0x027976
					; 0xE115: PRINT	MSG 0x0162, MSGBOX CLEARED, END: "{5B}:	I may be just a	kid, but{57}I'm courageous enough{57}to go and beat them!{5E}"
					;
		dc.w 3			; Params 00, 03
		ScriptID    $12D,$5	; Run text script at offset 0x027978
					; 0xE116: PRINT	MSG 0x0163, MSGBOX CLEARED, END: "{5B}:	....sob!...sob!....{57}...I'm so scared...!  Papa{57}followed them to the shrine...{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $12E,$7	; Run text script at offset 0x02797A
					; 0xE117: PRINT	MSG 0x0164, MSGBOX CLEARED, END: "{5B}:	Doesn't Mom look{57}happy, now?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0002_0:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $128,$0	; Prompt:	Run text script	at offset 0x02796E
					; 0xA111: PRINT	MSG 0x015E, END: "{5B}:	Have you met anyone who{57}looks different from	us?{58}"
		ScriptID    $129,$1	; Answer 'yes': Run text script at offset 0x027970
					; 0xE112: PRINT	MSG 0x015F, MSGBOX CLEARED, END: "{5B}:	Oh, yeah?{5E}"
		ScriptID    $12A,$2	; Answer 'no':  Run text script at offset 0x027972
					; 0x8113: PRINT	MSG 0x0160: "{5B}: They're Gumi tribesmen.{57}They don't like us in Massan.{62}"
					; 0xE114: PRINT	MSG 0x0161, MSGBOX CLEARED, END: "{5B}:	Don't go south...you'll{57}get a raw deal!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_007D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $12F,$1	; Run text script at offset 0x02797C
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0x8118: PRINT	MSG 0x0165: "{5B}: "Plant the seeds and{57}watch them GROW!{57}Soon you'll reap what you have{62}"
					; 0x8119: PRINT	MSG 0x0166: "{5B}: SOWN!  Take the crops to{57}town one	DAY!  You'll be{57}rich and then you'll SAY!..."{62}"
					; 0x811A: PRINT	MSG 0x0167: "{5B}: This	is the FARMER'S SONG.{57}My crop sales will boom{57}when I sing it{62}"
					; 0xE11B: PRINT	MSG 0x0168, MSGBOX CLEARED, END: "{5B}:	at the market in Mercator.{5E}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $134,$3	; Run text script at offset 0x027986
					; 0xE11C: PRINT	MSG 0x0169, MSGBOX CLEARED, END: "{5B}:	We're elaborating a{57}plan, now.  Don't disturb us!{5E}"
					;
		dc.w 3			; Params 00, 03
		ScriptID    $135,$5	; Run text script at offset 0x027988
					; 0xE11D: PRINT	MSG 0x016A, MSGBOX CLEARED, END: "{5B}:	They used something strange{57}to open that door...{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $136,$7	; Run text script at offset 0x02798A
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0x811E: PRINT	MSG 0x016B: "{5B}: Listen, Nigel!  I wrote a{57}new song.  It's called{57}THREE GUYS FROM MASSAN:{62}"
					; 0xE11F: PRINT	MSG 0x016C, MSGBOX CLEARED, END: "{5B}:	"Three guys bravely go,	go,{57}GO!  Three guys boldly.....{57}nice song, huh?{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $139,$9	; Run text script at offset 0x027990
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0x8120: PRINT	MSG 0x016D: "{5B}: Ba-pa-da-da,	dee-da{57}GROW!	 Soon you'll reap{57}ba-dee-da-DO!{62}"
					; 0x8121: PRINT	MSG 0x016E: "{5B}:  Oh!	 It's you, Nigel!{62}"
					; 0x0400: LOAD 0x0000 INTO 0xFF1198 (EkeEke)
					; 0xE122: PRINT	MSG 0x016F, MSGBOX CLEARED, END: "{5B}:	Thanks for your	help the other{57}day.	Why don't you buy{57}{5F} directly from the farm!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $13E,$1	; Run text script at offset 0x02799A
					; 0x8123: PRINT	MSG 0x0170: "{5B}: I heard it through the{57}EkeEke vine that Gumi warriors{56}re often	seen around the{62}"
					; 0xE124: PRINT	MSG 0x0171, MSGBOX CLEARED, END: "{5B}:	bridge these days...at least,{57}that's what they say.....{5E}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $140,$3	; Run text script at offset 0x02799E
					; 0xE125: PRINT	MSG 0x0172, MSGBOX CLEARED, END: "{5B}:	He...he	rushed out of here{57}with the guy next	door.{57}He was	really enraged!!{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $141,$5	; Run text script at offset 0x0279A0
					; 0xE126: PRINT	MSG 0x0173, MSGBOX CLEARED, END: "{5B}:	Hi, Nigel and Friday!{57}How have you been?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $142,$1	; Run text script at offset 0x0279A2
					; 0x8127: PRINT	MSG 0x0174: "{5B}: I've lived here since I was{57}a child...Massan and Gumi were{57}very good friends long ago.{62}"
					; 0x8128: PRINT	MSG 0x0175: "{5B}: What	started	the feud?{57}Nobody really....I	know!{57}Go see	the Old	Man at the{62}"
					; 0xE129: PRINT	MSG 0x0176, MSGBOX CLEARED, END: "{5B}:	Waterfall Shrine....maybe{57}he	can tell you!{5E}"
					;
		dc.w 1			; Params 00, 01
		ScriptID    $145,$3	; Run text script at offset 0x0279A8
					; 0xE12A: PRINT	MSG 0x0177, MSGBOX CLEARED, END: "{5B}:	It must	be an evil curse!{57}....evil haunts us	all!!...{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $146,$5	; Run text script at offset 0x0279AA
					; 0xE12B: PRINT	MSG 0x0178, MSGBOX CLEARED, END: "{5B}:	At last, Massan	and Gumi{57}will attain	their former{57}greatness as sister villages!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0080:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $147,$1	; Run text script at offset 0x0279AC
					; 0x812C: PRINT	MSG 0x0179: "{5B}: You must go see{57}the Waterfall Shrine Sage.{62}"
					; 0xE12D: PRINT	MSG 0x017A, MSGBOX CLEARED, END: "{5B}:	Careful, though...he's{57}eccentric!{5E}"
					;
		dc.w 1			; Params 00, 01
		ScriptID    $149,$3	; Run text script at offset 0x0279B0
					; 0xE12E: PRINT	MSG 0x017B, MSGBOX CLEARED, END: "{5B}:	Brrrrr......{57}...scary!{5E}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $14A,$5	; Run text script at offset 0x0279B2
					; 0xE12F: PRINT	MSG 0x017C, MSGBOX CLEARED, END: "{5B}:	Sob!.....sob!...{57}Is Fara c-coming b-back?....{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $14B,$7	; Run text script at offset 0x0279B4
					; 0xE130: PRINT	MSG 0x017D, MSGBOX CLEARED, END: "{5B}:	You did	it!  Do	you know{57}the	saying "DON'T JUDGE A{57}DAHL BY ITS COLOR"?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0003:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptJump  CS_0003_0,$1 ; Jump	to address 0x025FAC
					;
		dc.w 3			; Params 00, 03
		ScriptJump  CS_0003_1,$3 ; Jump	to address 0x025FB8
					;
		dc.w 4			; Params 00, 04
		ScriptID    $156,$5	; Run text script at offset 0x0279CA
					; 0xE13B: PRINT	MSG 0x0188, MSGBOX CLEARED, END: "{5B}:	We have	to move	this{57}debris to get to Mercator.{5E}"
					;
		dc.w 7			; Params 00, 07
		ScriptJump  CS_0003_2,$7 ; Jump	to address 0x025FC4
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $15B,$9	; Run text script at offset 0x0279D4
					; 0xE140: PRINT	MSG 0x018D, MSGBOX CLEARED, END: "{5B}:	What a coincidence!{57}How are things going?{57}Me?  Hmmm...so-so!{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $15C,$B	; Run text script at offset 0x0279D6
					; 0x8141: PRINT	MSG 0x018E: "{5B}: Hey,	young man!  It's me!{62}"
					; 0x8142: PRINT	MSG 0x018F: "{5B}: Oh, woe is me!{57}I was caught in a strange trap{57}and...here I am.{62}"
					; 0x8143: PRINT	MSG 0x0190: "{5B}: Well, I've been put in{57}many a jail in my time, but{57}never one that{62}"
					; 0xE144: PRINT	MSG 0x0191, MSGBOX CLEARED, END: "{5B}:	stank like this!{57}I can't stand it!!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0003_0:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $14C,$0	; Prompt:	Run text script	at offset 0x0279B6
					; 0x8131: PRINT	MSG 0x017E: "{5B}: You ARE a treasure hunter!{57}Ha, don't even try to hide it!{57}I sensed it at once!{62}"
					; 0xA132: PRINT	MSG 0x017F, END: "{5B}:	Have you met the{57}sage at the	Waterfall Shrine?{58}"
		ScriptID    $14E,$1	; Answer 'yes': Run text script at offset 0x0279BA
					; 0xE133: PRINT	MSG 0x0180, MSGBOX CLEARED, END: "{5B}:	Oh, really?  Huh!{57}So	you're a thief AND a liar!{5E}"
		ScriptID    $14F,$2	; Answer 'no':  Run text script at offset 0x0279BC
					; 0xE134: PRINT	MSG 0x0181, MSGBOX CLEARED, END: "{5B}:	Ha, ha,	ha!{57}You need	more experience,{57}kid!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0003_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C1		; Bit 1	of flag	0x018
		ScriptID    $150,$1	; Flag clear: Run text script at offset	0x0279BE
					; 0x8135: PRINT	MSG 0x0182: "{5B}: Good	heavens!  Nice to meet{57}you again, young boy!	 We seem{57}to have run	out of luck...{62}"
					; 0x8136: PRINT	MSG 0x0183: "{5B}: See the landslide?{62}"
					; 0x8137: PRINT	MSG 0x0184: "{5B}: The village was empty, so I{57}searched for some valuables,{57}but there was	nothing	to take.{62}"
					; 0x8138: PRINT	MSG 0x0185: "{5B}: I could only	find a dirty statue{57}at the mayor's house.{57}There were also some golds{62}"
					; 0xE139: PRINT	MSG 0x0186, MSGBOX CLEARED, END: "{5B}:	lying around, but of course{57}I didn't touch them.....NOT!!!{5E}"
		ScriptID    $155,$2	; Flag set:   Run text script at offset	0x0279C8
					; 0xE13A: PRINT	MSG 0x0187, MSGBOX CLEARED, END: "{5B}:	You can't blame me, can you?{57}I know you're the same.{57}You're a thief, too. Ha, ha!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0003_2:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DA		; Bit 2	of flag	0x01B
		ScriptID    $157,$1	; Flag clear: Run text script at offset	0x0279CC
					; 0x813C: PRINT	MSG 0x0189: "{5B}: You again!{57}Me?  Ah, I came here{62}"
					; 0x813D: PRINT	MSG 0x018A: "{5B}: in search of	the treasures,{57}but grew sleepy....{62}"
					; 0x813E: PRINT	MSG 0x018B: "{5B}: They	say the	trees{57}can be	a treasure hunter's{57}best friend...I wonder{62}"
					; 0xE13F: PRINT	MSG 0x018C, MSGBOX CLEARED, END: "{5B}:	what that means?.....{5E}"
		ScriptID    $159,$2	; Flag set:   Run text script at offset	0x0279D0
					; 0x813E: PRINT	MSG 0x018B: "{5B}: They	say the	trees{57}can be	a treasure hunter's{57}best friend...I wonder{62}"
					; 0xE13F: PRINT	MSG 0x018C, MSGBOX CLEARED, END: "{5B}:	what that means?.....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0081:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $160,$1	; Run text script at offset 0x0279DE
					; 0xE145: PRINT	MSG 0x0192, MSGBOX CLEARED, END: "{5B}:	We have	many suspicious{57}guests these	days...oh!{57}You ARE a	guest here!{5E}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $161,$3	; Run text script at offset 0x0279E0
					; 0xE146: PRINT	MSG 0x0193, MSGBOX CLEARED, END: "{5B}:	That strange man flew off{57}like the wind.....{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $162,$5	; Run text script at offset 0x0279E2
					; 0xE147: PRINT	MSG 0x0194, MSGBOX CLEARED, END: "{5B}:	You're that hero-boy,{57}aren't you?  Well, any friend{57}of Fara's.....{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0082:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptJump  CS_0082_0,$1 ; Jump	to address 0x025FF8
					;
		dc.w 2			; Params 00, 02
		ScriptID    $165,$3	; Run text script at offset 0x0279E8
					; 0xE149: PRINT	MSG 0x0196, MSGBOX CLEARED, END: "{5B}:	Nigel!	Friday!	 Fara needs{57}our help!....but	I'm{57}too scared to move...!!{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $166,$5	; Run text script at offset 0x0279EA
					; 0xE14A: PRINT	MSG 0x0197, MSGBOX CLEARED, END: "{5B}:	Friday!	 Am I ever glad{57}to see you!{5E}"
					;
		dc.w 5			; Params 00, 05
		ScriptID    $167,$7	; Run text script at offset 0x0279EC
					; 0xE14B: PRINT	MSG 0x0198, MSGBOX CLEARED, END: "{5B}:	Friday!	 I look	forward{57}to seeing you again!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0082_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C0		; Bit 0	of flag	0x018
		ScriptID    $163,$1	; Flag clear: Run text script at offset	0x0279E4
					; 0x7C10: LOAD CUSTOM ACTION 0x10 (0x10000003F CSA_0010), MSGBOX CLEARED, END
		ScriptID    $164,$2	; Flag set:   Run text script at offset	0x0279E6
					; 0xE148: PRINT	MSG 0x0195, MSGBOX CLEARED, END: "{5B}:	Is...is	Miss Friday all	right?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0083:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $168,$1	; Run text script at offset 0x0279EE
					; 0x814C: PRINT	MSG 0x0199: "{5B}: On the west side of Gumi,{57}the road branches off into{57}two paths	at the sea.{62}"
					; 0x814D: PRINT	MSG 0x019A: "{5B}: The right path leads	to the{57}big town, Mercator.{62}"
					; 0xE14E: PRINT	MSG 0x019B, MSGBOX CLEARED, END: "{5B}:	The left leads to Ryuma,{57}which is famous for	its{57}lighthouse.{5E}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $16B,$3	; Run text script at offset 0x0279F4
					; 0xE14F: PRINT	MSG 0x019C, MSGBOX CLEARED, END: "{5B}:	They will sacrifice{57}Fara to their evil gods!{57}Won't you help?!!{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $168,$5	; Run text script at offset 0x0279EE
					; 0x814C: PRINT	MSG 0x0199: "{5B}: On the west side of Gumi,{57}the road branches off into{57}two paths	at the sea.{62}"
					; 0x814D: PRINT	MSG 0x019A: "{5B}: The right path leads	to the{57}big town, Mercator.{62}"
					; 0xE14E: PRINT	MSG 0x019B, MSGBOX CLEARED, END: "{5B}:	The left leads to Ryuma,{57}which is famous for	its{57}lighthouse.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0084:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $16C,$1	; Run text script at offset 0x0279F6
					; 0xE150: PRINT	MSG 0x019D, MSGBOX CLEARED, END: "{5B}:	Gumi is	the village{57}just south of us.  They're{57}an atrocious tribe.{5E}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $16D,$3	; Run text script at offset 0x0279F8
					; 0xE151: PRINT	MSG 0x019E, MSGBOX CLEARED, END: "{5B}:	I have to stay here and{57}defend this village.{57}It's my responsibility.{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $16E,$5	; Run text script at offset 0x0279FA
					; 0xE152: PRINT	MSG 0x019F, MSGBOX CLEARED, END: "{5B}:	Remember, Nigel...the{57}straightest path has{57}many curves.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0085:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptJump  CS_0085_0,$1 ; Jump	to address 0x02603A
					;
		dc.w 2			; Params 00, 02
		ScriptID    $174,$3	; Run text script at offset 0x027A06
					; 0x8158: PRINT	MSG 0x01A5: "{5B}: Fara	was kidnapped because{57}she's the cutest among us.{57}Oh, my goodness!{62}"
					; 0xE159: PRINT	MSG 0x01A6, MSGBOX CLEARED, END: "{5B}:	That means I'm next!{57}What should I do!{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $176,$5	; Run text script at offset 0x027A0A
					; 0xE15A: PRINT	MSG 0x01A7, MSGBOX CLEARED, END: "{5B}:	I heard	about your exploits!{57}I know,	I know.	 It's all{57}thanks to EkeEke, right?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0085_0:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $16F,$0	; Prompt:	Run text script	at offset 0x0279FC
					; 0x8153: PRINT	MSG 0x01A0: "{5B}: Hi!	I can give you a{57}helpful hint about a specialty{62}"
					; 0xA154: PRINT	MSG 0x01A1, END: "{5B}:	of this	island.	 Do you{57}know	about it?{58}"
		ScriptID    $171,$1	; Answer 'yes': Run text script at offset 0x027A00
					; 0xE155: PRINT	MSG 0x01A2, MSGBOX CLEARED, END: "{5B}:	You do?{57}Oh.{5E}"
		ScriptID    $172,$2	; Answer 'no':  Run text script at offset 0x027A02
					; 0x8156: PRINT	MSG 0x01A3: "{5B}: It's a restorative called{57}EkeEke.  It contains a{57}megadose of the Ekenol{62}"
					; 0xE157: PRINT	MSG 0x01A4, MSGBOX CLEARED, END: "{5B}:	vitamin.  You can buy it{57}anywhere.  Got it?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0004:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $177,$1	; Run text script at offset 0x027A0C
					; 0xE15B: PRINT	MSG 0x01A8, MSGBOX CLEARED, END: "{5B}:	Arf, arf!{5E}"
					;
		dc.w $201		; Params 02, 01
		ScriptID    $178,$3	; Run text script at offset 0x027A0E
					; 0x153C: SET BIT 4 OF FLAG 0x027
					; 0x815C: PRINT	MSG 0x01A9: "{5B}: Oh!	You can	understand me?{57} I'm a girl, or...well,{57}at least I was until{62}"
					; 0x815D: PRINT	MSG 0x01AA: "{5B}: Helga, a witch in the{57}woods east of Mercator,{57}changed me into a dog.{62}"
					; 0x815E: PRINT	MSG 0x01AB: "{5B}: Marty, my sweetheart, is also{57}under her spell.  She's{57}made him into her pet!{62}"
					; 0x815F: PRINT	MSG 0x01AC: "{5B}: Oh, how my heart longs to{57}see him...sigh.....but I{57}can't.  Helga told us{62}"
					; 0x8160: PRINT	MSG 0x01AD: "{5B}: we can never	return to our{57}human forms if	we meet{57}each	other in these figures...{62}"
					; 0xE161: PRINT	MSG 0x01AE, MSGBOX CLEARED, END: "{5B}:	The curse on us	will never{57}be lifted	unless Helga{57}dies....howoooo!....{5E}"
					;
		dc.w $203		; Params 02, 03
		ScriptJump  CS_0004_0,$5 ; Jump	to address 0x026058
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0004_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E2		; Bit 2	of flag	0x01C
		ScriptID    $17F,$1	; Flag clear: Run text script at offset	0x027A1C
					; 0xE162: PRINT	MSG 0x01AF, MSGBOX CLEARED, END: "{5B}:	Thank you, thank you!{57}Marty and I will make this{57}house our home, now.{5E}"
		ScriptID    $180,$2	; Flag set:   Run text script at offset	0x027A1E
					; 0x8163: PRINT	MSG 0x01B0: "{5B}: I really....yarf!  Arf arf!{57}Oh, no!  What's happening?{57}Marty and I are{62}"
					; 0xE164: PRINT	MSG 0x01B1, MSGBOX CLEARED, END: "{5B}:	changing back again...{57}Ha, ha, ha!  Just kidding!{57}Good luck!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0086:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $182,$0	; Run text script at offset 0x027A22
					; 0xE165: PRINT	MSG 0x01B2, MSGBOX CLEARED, END: "{5B}:	Cock-cock-a-cock{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0087:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $183,$0	; Run text script at offset 0x027A24
					; 0xE166: PRINT	MSG 0x01B3, MSGBOX CLEARED, END: "{5B}:	Cock-co-co-cock{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0005:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $184,$0	; Run text script at offset 0x027A26
					; 0xE167: PRINT	MSG 0x01B4, MSGBOX CLEARED, END: "{5B}:	If you see something{57}you want, bring	it to the{57}counter and set it	down.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0006:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $185,$0	; Run text script at offset 0x027A28
					; 0x8168: PRINT	MSG 0x01B5: "{5B}: It's my duty to make{57}records and perform healings.{57}What do you want?{62}"
					; 0xE169: PRINT	MSG 0x01B6, MSGBOX CLEARED, END: "{5B}:	Bring any book to me.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0088:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $187,$1	; Run text script at offset 0x027A2C
					; 0xE16A: PRINT	MSG 0x01B7, MSGBOX CLEARED, END: "{5B}:	Is there really	a goddess?{5E}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $188,$3	; Run text script at offset 0x027A2E
					; 0xE16B: PRINT	MSG 0x01B8, MSGBOX CLEARED, END: "{5B}:	If there really	is a goddess,{57}why did she let them take{57}Fara?....boo-hoo-hoo!....{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $189,$5	; Run text script at offset 0x027A30
					; 0xE16C: PRINT	MSG 0x01B9, MSGBOX CLEARED, END: "{5B}:	Now I know there's a goddess!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0007:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $18A,$0	; Run text script at offset 0x027A32
					; 0x0425: LOAD 0x0025 INTO 0xFF1198 (Hotel{6A}Register)
					; 0x0826: LOAD 0x0026 INTO 0xFF119A (Island{6A}Map)
					; 0xE16D: PRINT	MSG 0x01BA, MSGBOX CLEARED, END: "{5B}:	Take the note and{57}put it on the counter{57}if you want to stay.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0089:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 1			; Params 00, 01
		ScriptID    $18D,$1	; Run text script at offset 0x027A38
					; 0xE16E: PRINT	MSG 0x01BB, MSGBOX CLEARED, END: "{5B}:	I...I...I've run out of{57}patience!{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $18E,$3	; Run text script at offset 0x027A3A
					; 0xE16F: PRINT	MSG 0x01BC, MSGBOX CLEARED, END: "{5B}:	I've never met such{57}a courageous man.{57}I really respect you!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0008:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 1			; Params 00, 01
		ScriptID    $18F,$1	; Run text script at offset 0x027A3C
					; 0x1400: SET BIT 0 OF FLAG 0x000
					; 0x7C08: LOAD CUSTOM ACTION 0x08 (0x10000001F CSA_0008), MSGBOX CLEARED, END
					;
		dc.w 2			; Params 00, 02
		ScriptJump  CS_0008_0,$3 ; Jump	to address 0x0260D0
					;
		dc.w 3			; Params 00, 03
		ScriptID    $192,$5	; Run text script at offset 0x027A42
					; 0x8171: PRINT	MSG 0x01BE: "{5B}: Is it true that Fara{57}has been kidnapped?{57}Unbelievable...{62}"
					; 0x8172: PRINT	MSG 0x01BF: "{5B}: I think the Gumi tribe is{57}controlled by the Orcs!{57}Fara	must be	in danger...{62}"
					; 0xE173: PRINT	MSG 0x01C0, MSGBOX CLEARED, END: "{5B}:	Go to the Marsh	Shrine{57}and save Fara.{57}Please hurry, Nigel!{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $195,$7	; Run text script at offset 0x027A48
					; 0x8174: PRINT	MSG 0x01C1: "{5B}: Good, good...{57}The	two tribes will	get close{57}to	each other from	now on.{62}"
					; 0x8175: PRINT	MSG 0x01C2: "{5B}: About King Nole...I just{57}found out that he did exist{57}in very ancient times.{62}"
					; 0xE176: PRINT	MSG 0x01C3, MSGBOX CLEARED, END: "{5B}:	That's all I can find in my{57}books.  Hopefully, you can{57}find out more in Mercator.....{5E}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $198,$9	; Run text script at offset 0x027A4E
					; 0x8177: PRINT	MSG 0x01C4: "{5B}: Hmm,	lithograph, eh?...{57}The jewels must belong{57}to King	Nole.{62}"
					; 0x8178: PRINT	MSG 0x01C5: "{5B}: According to	my records,{57}there are five jewels in	all.{57}If the jewels are real.....{62}"
					; 0xE179: PRINT	MSG 0x01C6, MSGBOX CLEARED, END: "{5B}:	Interesting...{57}Come see me again.{5E}"
					;
		dc.w 9			; Params 00, 09
		ScriptID    $19B,$B	; Run text script at offset 0x027A54
					; 0xE17A: PRINT	MSG 0x01C7, MSGBOX CLEARED, END: "{5B}:	Mercator is a big town.{57}You'll have fun there, but...{57}beware of the duke!!...{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $19C,$D	; Run text script at offset 0x027A56
					; 0xE17B: PRINT	MSG 0x01C8, MSGBOX CLEARED, END: "{5B}:	What?  You're going off{57}to defeat Lord Mir?  Hmmmm...{57}Well, if you must, but ....{62}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $19E,$F	; Run text script at offset 0x027A5A
					; 0x817D: PRINT	MSG 0x01CA: "{5B}: Oh, you actually saw{57}Lord	Mir?  Is he all	right?...{57}Great!{62}"
					; 0xE17E: PRINT	MSG 0x01CB, MSGBOX CLEARED, END: "{5B}:	You can	fully trust him.{57}Believe whatever he	tells you!{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1A0,$11	; Run text script at offset 0x027A5E
					; 0x817F: PRINT	MSG 0x01CC: "{5B}: So, the duke	finally	broke{57}his cover...now everyone will{57}know he's looking for the{62}"
					; 0x8180: PRINT	MSG 0x01CD: "{5B}: treasures of	King Nole.{62}"
					; 0x8181: PRINT	MSG 0x01CE: "{5B}: Perhaps your	coming here{57}convinced him there was{57}some truth to	the legends{62}"
					; 0xE182: PRINT	MSG 0x01CF, MSGBOX CLEARED, END: "{5B}:	after all.....{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1A4,$13	; Run text script at offset 0x027A66
					; 0x8183: PRINT	MSG 0x01D0: "{5B}: He has abandoned the	town.{57}He would do anything to{57}find the legendary treasures.{62}"
					; 0x8184: PRINT	MSG 0x01D1: "{5B}: Nigel!  Don't let him get{57}the treasures!  You must{57}stop his foul ambition!{5E}"
					; 0xE185: PRINT	MSG 0x01D2, MSGBOX CLEARED, END: "{5B}:	If the duke finds those{57}treasures.....it'll be the{57}end of the world!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0008_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $12		; Bit 2	of flag	0x002
		ScriptID    $192,$1	; Flag set:   Run text script at offset	0x027A42
					; 0x8171: PRINT	MSG 0x01BE: "{5B}: Is it true that Fara{57}has been kidnapped?{57}Unbelievable...{62}"
					; 0x8172: PRINT	MSG 0x01BF: "{5B}: I think the Gumi tribe is{57}controlled by the Orcs!{57}Fara	must be	in danger...{62}"
					; 0xE173: PRINT	MSG 0x01C0, MSGBOX CLEARED, END: "{5B}:	Go to the Marsh	Shrine{57}and save Fara.{57}Please hurry, Nigel!{5E}"
		ScriptID    $191,$2	; Flag clear: Run text script at offset	0x027A40
					; 0xE170: PRINT	MSG 0x01BD, MSGBOX CLEARED, END: "{5B}:	I'm still studying{57}the old documents.{57}Could you give me more time?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_008B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 2			; Params 00, 02
		ScriptID    $1A7,$1	; Run text script at offset 0x027A6C
					; 0xE186: PRINT	MSG 0x01D3, MSGBOX CLEARED, END: "{5B}:	Who are	you?{57}Get out	of here, stranger!{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $1A8,$3	; Run text script at offset 0x027A6E
					; 0xE187: PRINT	MSG 0x01D4, MSGBOX CLEARED, END: "{5B}:	W-we're sorry.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_008C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 2			; Params 00, 02
		ScriptID    $1A9,$1	; Run text script at offset 0x027A70
					; 0xE188: PRINT	MSG 0x01D5, MSGBOX CLEARED, END: "{5B}:	Sorry.{57}Sacred rite.{57}No visitors allowed!{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $1AA,$3	; Run text script at offset 0x027A72
					; 0xE189: PRINT	MSG 0x01D6, MSGBOX CLEARED, END: "{5B}:	Welcome	to the{57}village of Gumi.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_008D:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1AB,$0	; Run text script at offset 0x027A74
					; 0x818A: PRINT	MSG 0x01D7: "{5B}: Did you know	that we	were{57}controlled by the monsters{57}they call	the Orc	Kings?{62}"
					; 0xE18B: PRINT	MSG 0x01D8, MSGBOX CLEARED, END: "{5B}:	Actually, I don't remember{57}a thing.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0009:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C2		; Bit 2	of flag	0x018
		ScriptID    $1AD,$1	; Flag clear: Run text script at offset	0x027A78
					; 0x818C: PRINT	MSG 0x01D9: "{5B}: I'm ashamed of myself...{57}We let the monsters control{57}us and profane our most{62}"
					; 0xE18D: PRINT	MSG 0x01DA, MSGBOX CLEARED, END: "{5B}:	sacred shrine.	I want to{57}apologize to Massan, too.{57}Will they ever forgive us?{5E}"
		ScriptID    $1AF,$2	; Flag set:   Run text script at offset	0x027A7C
					; 0xE18E: PRINT	MSG 0x01DB, MSGBOX CLEARED, END: "{5B}:	We're going to cooperate{57}with Massan from now on.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_000A:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1B0,$0	; Run text script at offset 0x027A7E
					; 0xE18F: PRINT	MSG 0x01DC, MSGBOX CLEARED, END: "{5B}:	Thank you!{57}Thanks.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_008E:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1B1,$0	; Run text script at offset 0x027A80
					; 0xE190: PRINT	MSG 0x01DD, MSGBOX CLEARED, END: "{5B}:	Don't be too hard on us.{57}We're really very sorry.....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_008F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 3			; Params 00, 03
		ScriptID    $1B2,$1	; Run text script at offset 0x027A82
					; 0xE191: PRINT	MSG 0x01DE, MSGBOX CLEARED, END: "{5B}:	Get out	of here!{57}Get	out!{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $1B3,$3	; Run text script at offset 0x027A84
					; 0xE192: PRINT	MSG 0x01DF, MSGBOX CLEARED, END: "{5B}:	Was I rude before?  Sorry...{57}Remember...you'll get ahead{57}if you put others first.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0090:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1B4,$0	; Run text script at offset 0x027A86
					; 0xE193: PRINT	MSG 0x01E0, MSGBOX CLEARED, END: "{5B}:	They say a witch lives{57}near Mercator.{57}I hear she's very old.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0091:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 3			; Params 00, 03
		ScriptID    $1B5,$1	; Run text script at offset 0x027A88
					; 0xE194: PRINT	MSG 0x01E1, MSGBOX CLEARED, END: "{5B}:	Go away!{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $1B6,$3	; Run text script at offset 0x027A8A
					; 0xE195: PRINT	MSG 0x01E2, MSGBOX CLEARED, END: "{5B}:	Mercator?{57}Exit this village and{57}head west.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0092:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 4			; Params 00, 04
		ScriptID    $1B7,$1	; Run text script at offset 0x027A8C
					; 0xE196: PRINT	MSG 0x01E3, MSGBOX CLEARED, END: "{5B}:	I can't go to Mercator{57}because of the landslide.{5E}"
					;
		dc.w 5			; Params 00, 05
		ScriptID    $1B8,$3	; Run text script at offset 0x027A8E
					; 0xE197: PRINT	MSG 0x01E4, MSGBOX CLEARED, END: "{5B}:	The road to Mercator{57}is open	at last!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0093:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 4			; Params 00, 04
		ScriptID    $1B9,$1	; Run text script at offset 0x027A90
					; 0x8198: PRINT	MSG 0x01E5: "{5B}: Just	a minute!{57}We're the emergency repair{57}experts.  This'll only take{62}"
					; 0xE199: PRINT	MSG 0x01E6, MSGBOX CLEARED, END: "{5B}:	a second...{5E}"
					;
		dc.w 5			; Params 00, 05
		ScriptJump  CS_0093_0,$3 ; Jump	to address 0x026154
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0093_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C3		; Bit 3	of flag	0x018
		ScriptID    $1BB,$1	; Flag clear: Run text script at offset	0x027A94
					; 0x7C0D: LOAD CUSTOM ACTION 0x0D (0x100000033 CSA_000D), MSGBOX CLEARED, END
		ScriptID    $1BC,$2	; Flag set:   Run text script at offset	0x027A96
					; 0xE19A: PRINT	MSG 0x01E7, MSGBOX CLEARED, END: "{5B}:	I'm too tired to speak.{57}...Oh, yes, of course!{57}You can go through, now.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0094:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 2			; Params 00, 02
		ScriptID    $1BD,$1	; Run text script at offset 0x027A98
					; 0xE19B: PRINT	MSG 0x01E8, MSGBOX CLEARED, END: "{5B}:	Bow-wow!{5E}"
					;
		dc.w $19		; Params 00, 19
		ScriptID    $1BE,$3	; Run text script at offset 0x027A9A
					; 0xE19C: PRINT	MSG 0x01E9, MSGBOX CLEARED, END: "{5B}:	I like all the folks{57}in this	village.  Bow-wow!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0095:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1BF,$0	; Run text script at offset 0x027A9C
					; 0xE19D: PRINT	MSG 0x01EA, MSGBOX CLEARED, END: "{5B}:	Coooooock...cock...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_000B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 3			; Params 00, 03
		ScriptID    $1C0,$1	; Run text script at offset 0x027A9E
					; 0xE19E: PRINT	MSG 0x01EB, MSGBOX CLEARED, END: "{5B}:	I couldn't go to the{57}shrine with them...{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $1C1,$3	; Run text script at offset 0x027AA0
					; 0xE19F: PRINT	MSG 0x01EC, MSGBOX CLEARED, END: "{5B}:	Is it true that	you are{57}unbelievably	strong?{57}Stay	as long	as you like.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_000C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 3			; Params 00, 03
		ScriptID    $1C2,$1	; Run text script at offset 0x027AA2
					; 0xE1A0: PRINT	MSG 0x01ED, MSGBOX CLEARED, END: "{5B}:	It's hard to inspire{57}others to good deeds when{57}so many evils beset us.....{5E}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $1C3,$3	; Run text script at offset 0x027AA4
					; 0xE1A1: PRINT	MSG 0x01EE, MSGBOX CLEARED, END: "{5B}:	They were possessed?...{57}Oh, my goodness!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0096:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 4			; Params 00, 04
		ScriptID    $1C4,$1	; Run text script at offset 0x027AA6
					; 0x81A2: PRINT	MSG 0x01EF: "{5B}: We had a big	earthquake{57}a	few days ago.{57}Natural disasters seem	almost{62}"
					; 0xE1A3: PRINT	MSG 0x01F0, MSGBOX CLEARED, END: "{5B}:	commonplace nowadays....{5E}"
					;
		dc.w 5			; Params 00, 05
		ScriptJump  CS_0096_0,$3 ; Jump	to address 0x02619E
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0096_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C3		; Bit 3	of flag	0x018
		ScriptID    $1C6,$1	; Flag clear: Run text script at offset	0x027AAA
					; 0x7C0D: LOAD CUSTOM ACTION 0x0D (0x100000033 CSA_000D), MSGBOX CLEARED, END
		ScriptID    $1C7,$2	; Flag set:   Run text script at offset	0x027AAC
					; 0xE1A4: PRINT	MSG 0x01F1, MSGBOX CLEARED, END: "{5B}:	Ahhh...that was	refreshing!{57}Have a nice trip!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0097:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1C8,$1	; Run text script at offset 0x027AAE
					; 0xE1A5: PRINT	MSG 0x01F2, MSGBOX CLEARED, END: "{5B}:	Hi, this is Ryuma.{5E}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1C9,$3	; Run text script at offset 0x027AB0
					; 0xE1A6: PRINT	MSG 0x01F3, MSGBOX CLEARED, END: "{5B}:	We welcome you...{5E}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1CA,$5	; Run text script at offset 0x027AB2
					; 0xE1A7: PRINT	MSG 0x01F4, MSGBOX CLEARED, END: "{5B}:	They say you're a hero,{57}young man!{5E}"
					;
		dc.w $A			; Params 00, 0A
		ScriptID    $1CB,$7	; Run text script at offset 0x027AB4
					; 0xE1A8: PRINT	MSG 0x01F5, MSGBOX CLEARED, END: "{5B}:	I saw some blond beauty{57}leaving town	with{57}two laughing monsters.....{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1CC,$9	; Run text script at offset 0x027AB6
					; 0xE1A9: PRINT	MSG 0x01F6, MSGBOX CLEARED, END: "{5B}:	We suffer many calamities{57}these days.  The lighthouse{57}was	vandalized this	time.{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1C8,$B	; Run text script at offset 0x027AAE
					; 0xE1A5: PRINT	MSG 0x01F2, MSGBOX CLEARED, END: "{5B}:	Hi, this is Ryuma.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0098:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1CD,$1	; Run text script at offset 0x027AB8
					; 0xE1AA: PRINT	MSG 0x01F7, MSGBOX CLEARED, END: "{5B}:	I bet I	could run those{57}thieves out of town...{59}...{57}if I were old enough.{5E}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1CE,$3	; Run text script at offset 0x027ABA
					; 0xE1AB: PRINT	MSG 0x01F8, MSGBOX CLEARED, END: "{5B}:	Father...{5E}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1CF,$5	; Run text script at offset 0x027ABC
					; 0xE1AC: PRINT	MSG 0x01F9, MSGBOX CLEARED, END: "{5B}:	Why did	you go{57}without me?{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1D0,$7	; Run text script at offset 0x027ABE
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0xE1AD: PRINT	MSG 0x01FA, MSGBOX CLEARED, END: "{5B}:	I know you can get the{57}{5F},	'cuz I'm going{57}with you this time!{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1CF,$9	; Run text script at offset 0x027ABC
					; 0xE1AC: PRINT	MSG 0x01F9, MSGBOX CLEARED, END: "{5B}:	Why did	you go{57}without me?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0099:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1D2,$1	; Run text script at offset 0x027AC2
					; 0x81AE: PRINT	MSG 0x01FB: "{5B}: Ryuma is an old town.{57}Believe it or not, this town{57}was	much bigger than Mercator{62}"
					; 0xE1AF: PRINT	MSG 0x01FC, MSGBOX CLEARED, END: "{5B}:	a long,	long time ago.{5E}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1D4,$3	; Run text script at offset 0x027AC6
					; 0xE1B0: PRINT	MSG 0x01FD, MSGBOX CLEARED, END: "{5B}:	I heard	that Mercator is{57}governed by	Duke Mercator now.{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1D5,$5	; Run text script at offset 0x027AC8
					; 0xE1B1: PRINT	MSG 0x01FE, MSGBOX CLEARED, END: "{5B}:	Was Duke Mercator{57}really such a rogue?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1D6,$1	; Run text script at offset 0x027ACA
					; 0x81B2: PRINT	MSG 0x01FF: "{5B}: You came here to look for{57}the treasures, too?{62}"
					; 0xE1B3: PRINT	MSG 0x0200, MSGBOX CLEARED, END: "{5B}:	If it's true,{57}I want to have a share.{5E}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1D8,$3	; Run text script at offset 0x027ACE
					; 0xE1B4: PRINT	MSG 0x0201, MSGBOX CLEARED, END: "{5B}:	Don't forget to give me{57}a share when you find{57}the treasures!  Ho, ho!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_000D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1D9,$1	; Run text script at offset 0x027AD0
					; 0xE1B5: PRINT	MSG 0x0202, MSGBOX CLEARED, END: "{5B}:	Sales are off this month{57}because of the thieves!{5E}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1DA,$3	; Run text script at offset 0x027AD2
					; 0x81B6: PRINT	MSG 0x0203: "{5B}: Leave this place and{57}go back to your home!!{57}You won't regret taking{62}"
					; 0xE1B7: PRINT	MSG 0x0204, MSGBOX CLEARED, END: "{5B}:	my advice.....{5E}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1DC,$5	; Run text script at offset 0x027AD6
					; 0xE1B8: PRINT	MSG 0x0205, MSGBOX CLEARED, END: "{5B}:	Thank you, Nigel.{57}You're the town's very own{57}saviour!{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1DD,$7	; Run text script at offset 0x027AD8
					; 0x81B9: PRINT	MSG 0x0206: "{5B}: Hello, Nigel.  Seems	we{57}just have	one problem{57}after another.{62}"
					; 0xE1BA: PRINT	MSG 0x0207, MSGBOX CLEARED, END: "{5B}:	Have you seen the{57}lighthouse	yet?  Nobody can{57}reach us without the light.{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1DC,$9	; Run text script at offset 0x027AD6
					; 0xE1B8: PRINT	MSG 0x0205, MSGBOX CLEARED, END: "{5B}:	Thank you, Nigel.{57}You're the town's very own{57}saviour!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1DF,$1	; Run text script at offset 0x027ADC
					; 0xE1BB: PRINT	MSG 0x0208, MSGBOX CLEARED, END: "{5B}:	Lately,	this is	a{57}dangerous place!  A gang of{57}thieves has	come to	this town.{5E}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1E0,$3	; Run text script at offset 0x027ADE
					; 0xE1BC: PRINT	MSG 0x0209, MSGBOX CLEARED, END: "{5B}:	I'm packin' my bags!{57}Who wants to live with{57}thieves?{5E}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1E1,$5	; Run text script at offset 0x027AE0
					; 0xE1BD: PRINT	MSG 0x020A, MSGBOX CLEARED, END: "{5B}:	Now that the thieves are{57}gone, I think I'll stay here{57}for a while....'Bye now!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1E2,$1	; Run text script at offset 0x027AE2
					; 0xE1BE: PRINT	MSG 0x020B, MSGBOX CLEARED, END: "{5B}:	Oh, are	you a visitor?{57}We get so few	these days{57}thanks to	the thieves.{5E}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1E3,$3	; Run text script at offset 0x027AE4
					; 0xE1BF: PRINT	MSG 0x020C, MSGBOX CLEARED, END: "{5B}:	Horrible!!...{5E}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1E4,$5	; Run text script at offset 0x027AE6
					; 0xE1C0: PRINT	MSG 0x020D, MSGBOX CLEARED, END: "{5B}:	I look forward to{57}seeing you	again.{57}No, really...I mean it!{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1E5,$7	; Run text script at offset 0x027AE8
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0x81C1: PRINT	MSG 0x020E: "{5B}: The {5F} was	stolen by{57}the apprentice of the{57}lighthouse keeper!{62}"
					; 0xE1C2: PRINT	MSG 0x020F, MSGBOX CLEARED, END: "{5B}:	Did you	know?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009D:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1E8,$0	; Run text script at offset 0x027AEE
					; 0xE1C3: PRINT	MSG 0x0210, MSGBOX CLEARED, END: "{5B}:	The shop owner has gone.{57}Where am I supposed	to get{57}Ekenol now?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_000E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1E9,$1	; Run text script at offset 0x027AF0
					; 0xE1C4: PRINT	MSG 0x0211, MSGBOX CLEARED, END: "{5B}:	They're thieves, but{57}they are still human beings.{57}I must convert them!{5E}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1EA,$3	; Run text script at offset 0x027AF2
					; 0xE1C5: PRINT	MSG 0x0212, MSGBOX CLEARED, END: "{5B}:	They must be devils!!...{5E}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1EB,$5	; Run text script at offset 0x027AF4
					; 0xE1C6: PRINT	MSG 0x0213, MSGBOX CLEARED, END: "{5B}:	Were they monsters?{57}Really?{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1EC,$7	; Run text script at offset 0x027AF6
					; 0xE1C7: PRINT	MSG 0x0214, MSGBOX CLEARED, END: "{5B}:	People are unhappy now.{57}But I'm sure they'll{57}find happiness someday.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1ED,$1	; Run text script at offset 0x027AF8
					; 0xE1C8: PRINT	MSG 0x0215, MSGBOX CLEARED, END: "{5B}:	We live	in fear	of the{57}thieves infesting the	cave{57}on the promontory.{5E}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1EE,$3	; Run text script at offset 0x027AFA
					; 0xE1C9: PRINT	MSG 0x0216, MSGBOX CLEARED, END: "{5B}:	Please save our	town...{5E}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1EF,$5	; Run text script at offset 0x027AFC
					; 0xE1CA: PRINT	MSG 0x0217, MSGBOX CLEARED, END: "{5B}:	You defeated the thieves{57}all	by yourself?{57}Unbelievable!!{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1F0,$7	; Run text script at offset 0x027AFE
					; 0xE1CB: PRINT	MSG 0x0218, MSGBOX CLEARED, END: "{5B}:	Please restore the light{57}to our lighthouse soon!!{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1F1,$9	; Run text script at offset 0x027B00
					; 0xE1CC: PRINT	MSG 0x0219, MSGBOX CLEARED, END: "{5B}:	You've been most helpful{57}to this town.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1F2,$1	; Run text script at offset 0x027B02
					; 0x81CD: PRINT	MSG 0x021A: "{5B}: They're quick to take flight.{57}Chickens!!K0"
					; 0xE1CE: PRINT	MSG 0x021B, MSGBOX CLEARED, END: "{5B}:	Mercator soldiers drove	them{57}back to	the promontory,{57}but they escaped.{5E}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1F4,$3	; Run text script at offset 0x027B06
					; 0xE1CF: PRINT	MSG 0x021C, MSGBOX CLEARED, END: "{5B}:	Won't someone please make{57}those thieves go away?!{5E}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1F5,$5	; Run text script at offset 0x027B08
					; 0xE1D0: PRINT	MSG 0x021D, MSGBOX CLEARED, END: "{5B}:	You're great!{57}How did you ever brave the{5A}epths of that cave alone?{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1F6,$7	; Run text script at offset 0x027B0A
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0xE1D1: PRINT	MSG 0x021E, MSGBOX CLEARED, END: "{5B}:	To get the {5F}	is{57}almost impossible!  Tell me{57}who can do	it!{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1F8,$9	; Run text script at offset 0x027B0E
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0xE1D2: PRINT	MSG 0x021F, MSGBOX CLEARED, END: "{5B}:	What!{57}You found the {5F}!{57}Incredible!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_000F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 8			; Params 00, 08
		ScriptID    $1FA,$1	; Run text script at offset 0x027B12
					; 0x81D3: PRINT	MSG 0x0220: "{5B}: I thank you from the{57}bottom of my	heart!	When you{57}find the treasures.....{62}"
					; 0x81D4: PRINT	MSG 0x0221: "{5B}: please buy every item{57}in the shop!  Ha ha	ha ha!{57}Sorry...just a little{62}"
					; 0xE1D5: PRINT	MSG 0x0222, MSGBOX CLEARED, END: "{5B}:	salesman humor!{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1FD,$3	; Run text script at offset 0x027B18
					; 0x81D6: PRINT	MSG 0x0223: "{5B}: The people of Mercator{57}are also troubled by this{57}business with	the lighthouse,{62}"
					; 0x81D7: PRINT	MSG 0x0224: "{5B}: aren't they?  They're saying{57}the Duke has gone off{57}somewhere...do you think he{62}"
					; 0xE1D8: PRINT	MSG 0x0225, MSGBOX CLEARED, END: "{5B}:	went to	find a Sun Stone, too?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $200,$1	; Run text script at offset 0x027B1E
					; 0xE1D9: PRINT	MSG 0x0226, MSGBOX CLEARED, END: "{5B}:	...mumble...{57}my son is out now...{5E}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $201,$3	; Run text script at offset 0x027B20
					; 0xE1DA: PRINT	MSG 0x0227, MSGBOX CLEARED, END: "{5B}:	...mumble...{57}please avenge my son!{57}...please...!{5E}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $202,$5	; Run text script at offset 0x027B22
					; 0xE1DB: PRINT	MSG 0x0228, MSGBOX CLEARED, END: "{5B}:	...mumble...mumble...{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $203,$7	; Run text script at offset 0x027B24
					; 0x81DC: PRINT	MSG 0x0229: "{5B}: ...mumble...I wonder{57}if she's okay...{57}over in Mercator...{62}"
					; 0xE1DD: PRINT	MSG 0x022A, MSGBOX CLEARED, END: "{5B}:	...is her husband still...{57}collecting jars?...mumble...{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $205,$1	; Run text script at offset 0x027B28
					; 0xE1DE: PRINT	MSG 0x022B, MSGBOX CLEARED, END: "{5B}:	My dad is out right now.{57}He said he's gotta{57}do something important.{5E}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $206,$3	; Run text script at offset 0x027B2A
					; 0xE1DF: PRINT	MSG 0x022C, MSGBOX CLEARED, END: "{5B}:	Father always told me...{57}..that seamen never	cry...{57}....choke!...sob...{5E}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $207,$5	; Run text script at offset 0x027B2C
					; 0xE1E0: PRINT	MSG 0x022D, MSGBOX CLEARED, END: "{5B}:	Ha ha!!	 Papa came back!{57}He's very strong, isn't he?{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $208,$7	; Run text script at offset 0x027B2E
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0x81E1: PRINT	MSG 0x022E: "{5B}: Don't blame my dad!{57}He was more shocked than{57}anybody when that apprentice{62}"
					; 0xE1E2: PRINT	MSG 0x022F, MSGBOX CLEARED, END: "{5B}:	guy stole the Sun Stone.{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $20B,$9	; Run text script at offset 0x027B34
					; 0xE1E3: PRINT	MSG 0x0230, MSGBOX CLEARED, END: "{5B}:	You're way cool!{57}Next to my dad, you're{57}the greatest!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A2:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 8			; Params 00, 08
		ScriptJump  CS_00A2_0,$1 ; Jump	to address 0x0262E4
					;
		dc.w $18		; Params 00, 18
		ScriptID    $210,$3	; Run text script at offset 0x027B3E
					; 0x81E8: PRINT	MSG 0x0235: "{5B}: My runaway assistant{57}came	back suddenly...{62}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0xE1E9: PRINT	MSG 0x0236, MSGBOX CLEARED, END: "{5B}:	and took off with{57}the {5F}....{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $8AA,$5	; Run text script at offset 0x028872
					; 0xE6E4: PRINT	MSG 0x0731, MSGBOX CLEARED, END: "{5B}:	I locked it up{57}so we	won't have to go{57}through that again!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A2_0:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $20C,$0	; Prompt:	Run text script	at offset 0x027B36
					; 0x81E4: PRINT	MSG 0x0231: "{5B}: Nigel, good timing!	My{57}apprentice has disappeared{57}in all this	confusion.{62}"
					; 0xA1E5: PRINT	MSG 0x0232, END: "{5B}:	Why don't you work here{57}in his place?{58}"
		ScriptID    $20E,$1	; Answer 'yes': Run text script at offset 0x027B3A
					; 0xE1E6: PRINT	MSG 0x0233, MSGBOX CLEARED, END: "{5B}:	Hahahahaha!{57}Just kidding!  What a{57}good-natured boy you are!{5E}"
		ScriptID    $20F,$2	; Answer 'no':  Run text script at offset 0x027B3C
					; 0xE1E7: PRINT	MSG 0x0234, MSGBOX CLEARED, END: "{5B}:	That's okay!  The people of{57}Ryuma need your help more{57}than I do.  You're a good boy!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0010:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $213,$1	; Run text script at offset 0x027B44
					; 0x81EA: PRINT	MSG 0x0237: "{5B}: The master isn't here now,{57}but maybe I can explain{57}how it works.{62}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0x81EB: PRINT	MSG 0x0238: "{5B}: This	lighthouse uses	a{57}Sun Stone,	the brightest stone{57}in all the land,	to{62}"
					; 0xE1EC: PRINT	MSG 0x0239, MSGBOX CLEARED, END: "{5B}:	guide ships safely{57}to the harbor.{5E}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $217,$3	; Run text script at offset 0x027B4C
					; 0xE1ED: PRINT	MSG 0x023A, MSGBOX CLEARED, END: "{5B}:	M-my...master was killed{57}by the thieves...{57}What should I do???{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $218,$5	; Run text script at offset 0x027B4E
					; 0xE1EE: PRINT	MSG 0x023B, MSGBOX CLEARED, END: "{5B}:	Owwwwww....I'm sorry!...{57}wouldn'ta done it if I knew it{57}was part of the duke's plot!{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $219,$7	; Run text script at offset 0x027B50
					; 0xE1EF: PRINT	MSG 0x023C, MSGBOX CLEARED, END: "{5B}:	Owwwoooo.....!!!{57}please let me go...{57}I'm really sorry...{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $21A,$9	; Run text script at offset 0x027B52
					; 0xE1F0: PRINT	MSG 0x023D, MSGBOX CLEARED, END: "{5B}:	I'm a new person now!{57}I'll work hard under Arthur{57}to right my wicked ways!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A3:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $21B,$1	; Run text script at offset 0x027B54
					; 0x81F1: PRINT	MSG 0x023E: "{5B}: The thieves must be{57}looking for the same{57}treasures you	are.{62}"
					; 0xE1F2: PRINT	MSG 0x023F, MSGBOX CLEARED, END: "{5B}:	There must be a	clue{57}somewhere in the cave!{5E}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $21D,$3	; Run text script at offset 0x027B58
					; 0x81F3: PRINT	MSG 0x0240: "{5B}: You found the lithograph there?{57}Great!  It must be a clue!{57}Let	me see it!{62}"
					; 0xE1F4: PRINT	MSG 0x0241, MSGBOX CLEARED, END: "{5B}:	What?!{57}It was snatched away?{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $21F,$5	; Run text script at offset 0x027B5C
					; 0x81F5: PRINT	MSG 0x0242: "{5B}: Duke	Mercator abandoned his{57}town for the treasures...{62}"
					; 0xE1F6: PRINT	MSG 0x0243, MSGBOX CLEARED, END: "{5B}:	I guess	that means{57}the legendary treasures{57}really	exist!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A4:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $221,$1	; Run text script at offset 0x027B60
					; 0xE1F7: PRINT	MSG 0x0244, MSGBOX CLEARED, END: "{5B}:	Would you mind going out now?{57}We're in a meeting.{5E}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $222,$3	; Run text script at offset 0x027B62
					; 0x81F8: PRINT	MSG 0x0245: "{5B}: So you heard	us...{57}Well, the mayor went to try to{57}bargain with	the thieves...{62}"
					; 0xE1F9: PRINT	MSG 0x0246, MSGBOX CLEARED, END: "{5B}:	but he never came back.{57}What	happened?{5E}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $224,$5	; Run text script at offset 0x027B66
					; 0xE1FA: PRINT	MSG 0x0247, MSGBOX CLEARED, END: "{5B}:	You saved the town!{57}I can't believe you did it{57}alone!{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $225,$7	; Run text script at offset 0x027B68
					; 0x81FB: PRINT	MSG 0x0248: "{5B}: Greenmaze is	also known{57}as the "Forest of	the Lost."{62}"
					; 0x81FC: PRINT	MSG 0x0249: "{5B}: It is said that once	you{57}step into the woods...{59}...{57}you never come back out.{62}"
					; 0xE1FD: PRINT	MSG 0x024A, MSGBOX CLEARED, END: "{5B}:	It's so dangerous that{57}Duke Mercator fobids us{57}to go in.{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $224,$9	; Run text script at offset 0x027B66
					; 0xE1FA: PRINT	MSG 0x0247, MSGBOX CLEARED, END: "{5B}:	You saved the town!{57}I can't believe you did it{57}alone!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $228,$1	; Run text script at offset 0x027B6E
					; 0xE1FE: PRINT	MSG 0x024B, MSGBOX CLEARED, END: "{5B}:	The mayor is out...{5E}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $229,$3	; Run text script at offset 0x027B70
					; 0xE1FF: PRINT	MSG 0x024C, MSGBOX CLEARED, END: "{5B}:	It's all over for this town{57}if the mayor is killed...{5E}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $22A,$5	; Run text script at offset 0x027B72
					; 0xE200: PRINT	MSG 0x024D, MSGBOX CLEARED, END: "{5B}:	It's unanimous!  You're the{57}honorary citizen of Ryuma!{5E}"
					;
		dc.w $A			; Params 00, 0A
		ScriptID    $22B,$7	; Run text script at offset 0x027B74
					; 0xE201: PRINT	MSG 0x024E, MSGBOX CLEARED, END: "{5B}:	What will you do{57}with the treasures?{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $22C,$9	; Run text script at offset 0x027B76
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0x8202: PRINT	MSG 0x024F: "{5B}: Oh, it's our honorary citizen!{57}We're having a meeting{57}to decide who's going{62}"
					; 0xE203: PRINT	MSG 0x0250, MSGBOX CLEARED, END: "{5B}:	to get the {5F}.{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $22B,$B	; Run text script at offset 0x027B74
					; 0xE201: PRINT	MSG 0x024E, MSGBOX CLEARED, END: "{5B}:	What will you do{57}with the treasures?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $22F,$1	; Run text script at offset 0x027B7C
					; 0xE204: PRINT	MSG 0x0251, MSGBOX CLEARED, END: "{5B}:	Go take	a look around town,{57}young man!{5E}"
					;
		dc.w 6			; Params 00, 06
		ScriptJump  CS_00A6_0,$3 ; Jump	to address 0x026372
					;
		dc.w 7			; Params 00, 07
		ScriptID    $234,$5	; Run text script at offset 0x027B86
					; 0xE208: PRINT	MSG 0x0255, MSGBOX CLEARED, END: "{5B}:	Their hideout is in{57}the cave	on the promontory.{57}You can get there	by raft.{5E}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $238,$7	; Run text script at offset 0x027B8E
					; 0xE20C: PRINT	MSG 0x0259, MSGBOX CLEARED, END: "{5B}:	I knew you were	really{57}something all	along!{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $239,$9	; Run text script at offset 0x027B90
					; 0x820D: PRINT	MSG 0x025A: "{5B}: It's quite difficult, but...{57}if anyone can solve Greenmaze,{57}it's you, Nigel.{62}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0x820E: PRINT	MSG 0x025B: "{5B}: To get to the Sun Stone,{57}you'll need a good sense of{57}balance and excellent{62}"
					; 0x820F: PRINT	MSG 0x025C: "{5B}: jumping skills.{5E}"
					; 0xE210: PRINT	MSG 0x025D, MSGBOX CLEARED, END: "{5B}:	Aren't you afraid of{57}thieves?  Go home!{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $238,$B	; Run text script at offset 0x027B8E
					; 0xE20C: PRINT	MSG 0x0259, MSGBOX CLEARED, END: "{5B}:	I knew you were	really{57}something all	along!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A6_0:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $230,$0	; Prompt:	Run text script	at offset 0x027B7E
					; 0x8205: PRINT	MSG 0x0252: "{5B}: Young man, you've caught us{57}at a bad time.  I don't know{57}how to put this, but....{62}"
					; 0xA206: PRINT	MSG 0x0253, END: "{5B}:	we've got a problem.{57}Would you do us a favor?{58}"
		ScriptID    $232,$1	; Answer 'yes': Run text script at offset 0x027B82
					; 0x8207: PRINT	MSG 0x0254: "{5B}: Quick response!{57}Are you sure?{57}OK!{62}"
					; 0x1420: SET BIT 0 OF FLAG 0x004
					; 0xE208: PRINT	MSG 0x0255, MSGBOX CLEARED, END: "{5B}:	Their hideout is in{57}the cave	on the promontory.{57}You can get there	by raft.{5E}"
		ScriptJump  CS_00A6_1,$2 ; Answer 'no':  Jump to address 0x02637E
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00A6_1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $235,$0	; Prompt:	Run text script	at offset 0x027B88
					; 0x8209: PRINT	MSG 0x0256: "{5B}: You're right,  I should tell you{57}what I want first.{57}I want you to go to their{62}"
					; 0xA20A: PRINT	MSG 0x0257, END: "{5B}:	hideout	and wipe them out.{57}Will you do it?{58}"
		ScriptID    $233,$1	; Answer 'yes': Run text script at offset 0x027B84
					; 0x1420: SET BIT 0 OF FLAG 0x004
					; 0xE208: PRINT	MSG 0x0255, MSGBOX CLEARED, END: "{5B}:	Their hideout is in{57}the cave	on the promontory.{57}You can get there	by raft.{5E}"
		ScriptID    $237,$2	; Answer 'no':  Run text script at offset 0x027B8C
					; 0xE20B: PRINT	MSG 0x0258, MSGBOX CLEARED, END: "{5B}:	I'm disappointed in you,{57}boy...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00A7:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $23D,$0	; Run text script at offset 0x027B98
					; 0xE210: PRINT	MSG 0x025D, MSGBOX CLEARED, END: "{5B}:	Aren't you afraid of{57}thieves?  Go home!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00A8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $23E,$1	; Run text script at offset 0x027B9A
					; 0x7C14: LOAD CUSTOM ACTION 0x14 (0x10000004F CSA_0014), MSGBOX CLEARED, END
					;
		dc.w 6			; Params 00, 06
		ScriptID    $23F,$3	; Run text script at offset 0x027B9C
					; 0xE211: PRINT	MSG 0x025E, MSGBOX CLEARED, END: "{5B}:	I'm hiding 'cause{57}I'm afraid of the thieves.{5E}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $240,$5	; Run text script at offset 0x027B9E
					; 0xE212: PRINT	MSG 0x025F, MSGBOX CLEARED, END: "{5B}:	I'm still frightened...{57}Are they gone yet?{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $241,$7	; Run text script at offset 0x027BA0
					; 0xE213: PRINT	MSG 0x0260, MSGBOX CLEARED, END: "{5B}:	Another	betrayal!{57}I can't trust anyone anymore!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $242,$1	; Run text script at offset 0x027BA2
					; 0xE214: PRINT	MSG 0x0261, MSGBOX CLEARED, END: "{5B}:	Bow-wow!{5E}"
					;
		dc.w $19		; Params 00, 19
		ScriptID    $243,$3	; Run text script at offset 0x027BA4
					; 0xE215: PRINT	MSG 0x0262, MSGBOX CLEARED, END: "{5B}:	Hmmmmm...I live	here because{57}I love the tang	of the sea.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0011:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 8			; Params 00, 08
		ScriptID    $244,$1	; Run text script at offset 0x027BA6
					; 0x7C21: LOAD CUSTOM ACTION 0x21 (0x100000083 CSA_0021), MSGBOX CLEARED, END
					;
		dc.w 9			; Params 00, 09
		ScriptID    $245,$3	; Run text script at offset 0x027BA8
					; 0x0433: LOAD 0x0033 INTO 0xFF1198 (Safety{6A}Pass)
					; 0xE216: PRINT	MSG 0x0263, MSGBOX CLEARED, END: "{5B}:	You can	get into Mercator{57}with the {5F}.{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $247,$5	; Run text script at offset 0x027BAC
					; 0xE217: PRINT	MSG 0x0264, MSGBOX CLEARED, END: "{5B}:	I think	we need{57}an exorcism or something.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_008A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $248,$1	; Run text script at offset 0x027BAE
					; 0xE218: PRINT	MSG 0x0265, MSGBOX CLEARED, END: "{5B}:	It's strange...{57}Where is the mayor?{57}.What's happening to this town?{5E}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $249,$3	; Run text script at offset 0x027BB0
					; 0xE219: PRINT	MSG 0x0266, MSGBOX CLEARED, END: "{5B}:	What on	earth{57}do those thieves want?{5E}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $24A,$5	; Run text script at offset 0x027BB2
					; 0xE21A: PRINT	MSG 0x0267, MSGBOX CLEARED, END: "{5B}:	A strange blond	woman just{57}snatched my safe-conduct pass!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $24B,$1	; Run text script at offset 0x027BB4
					; 0x18AA: LOAD CHARACTER SCRIPT	* (0x00AA)
					; 0xE21B: PRINT	MSG 0x0268, MSGBOX CLEARED, END: "{5B}:	If ya ain't got a{57}safe-conduct pass, ya ain't{57}gettin' in these gates!{5E}"
					;
		dc.w 9			; Params 00, 09
		ScriptID    $24D,$3	; Run text script at offset 0x027BB8
					; 0xE21C: PRINT	MSG 0x0269, MSGBOX CLEARED, END: "{5B}:	This is	Mercator, where{57}money's the most important{57}thing in the world!{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $24E,$5	; Run text script at offset 0x027BBA
					; 0xE21D: PRINT	MSG 0x026A, MSGBOX CLEARED, END: "{5B}:	Heheheh....{57}Sorry 'bout that.  I'll make{57}it up to you someday.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $24F,$1	; Run text script at offset 0x027BBC
					; 0x18AB: LOAD CHARACTER SCRIPT	* (0x00AB)
					; 0xE21E: PRINT	MSG 0x026B, MSGBOX CLEARED, END: "{5B}:	My legs	are sore from{57}standing here all day long.{5E}"
					;
		dc.w 9			; Params 00, 09
		ScriptID    $251,$3	; Run text script at offset 0x027BC0
					; 0xE21F: PRINT	MSG 0x026C, MSGBOX CLEARED, END: "{5B}:	Mercator is a historic town.{57} We welcome you.{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $252,$5	; Run text script at offset 0x027BC2
					; 0xE220: PRINT	MSG 0x026D, MSGBOX CLEARED, END: "{5B}:	Hello, Nigel!{57}How you doing?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0012:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $253,$0	; Run text script at offset 0x027BC4
					; 0xE221: PRINT	MSG 0x026E, MSGBOX CLEARED, END: "{5B}:	Mercator is a{57}beautiful town, great for{57}sightseeing and entertainment.{62}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00AC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $254,$1	; Run text script at offset 0x027BC6
					; 0xE222: PRINT	MSG 0x026F, MSGBOX CLEARED, END: "{5B}:	I've just arrived from the{57}continent.  Gosh, what{57}a big town!{5E}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $255,$3	; Run text script at offset 0x027BC8
					; 0xE223: PRINT	MSG 0x0270, MSGBOX CLEARED, END: "{5B}:	I heard	that Madame{57}Yard's is a great place to rid{57}oneself of stress!{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $256,$5	; Run text script at offset 0x027BCA
					; 0xE224: PRINT	MSG 0x0271, MSGBOX CLEARED, END: "{5B}:	Wowie!!	 Mercator is{57}wonderful!  I LIKE it!{57}I want to stay here forever!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $257,$1	; Run text script at offset 0x027BCC
					; 0xE225: PRINT	MSG 0x0272, MSGBOX CLEARED, END: "{5B}:	The prices are way too high{57}in this town.  I'm gonna need{57}a lot more money...{5E}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $258,$3	; Run text script at offset 0x027BCE
					; 0xE226: PRINT	MSG 0x0273, MSGBOX CLEARED, END: "{5B}:	You're new in town, right?{5E}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $259,$5	; Run text script at offset 0x027BD0
					; 0xE227: PRINT	MSG 0x0274, MSGBOX CLEARED, END: "{5B}:	I spent	all my money!{57}I have	to go home, but	I can't{57}afford the trip back!{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $25A,$7	; Run text script at offset 0x027BD2
					; 0x8228: PRINT	MSG 0x0275: "{5B}: This	young fool was the{57}lighthouse keeper's assistant.{57}His master fully trusted him,{62}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0xE229: PRINT	MSG 0x0276, MSGBOX CLEARED, END: "{5B}:	but he stole the {5F}!{57}He betrayed his master!{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $25D,$9	; Run text script at offset 0x027BD8
					; 0xE22A: PRINT	MSG 0x0277, MSGBOX CLEARED, END: "{5B}:	Young men nowadays lack{57}grit!  They are always taking{57}the	short view of things!{5E}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $25E,$B	; Run text script at offset 0x027BDA
					; 0xE22B: PRINT	MSG 0x0278, MSGBOX CLEARED, END: "{5B}:	We are discussing{57}the future	of Mercator.{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $25F,$D	; Run text script at offset 0x027BDC
					; 0xE22C: PRINT	MSG 0x0279, MSGBOX CLEARED, END: "{5B}:	I can't believe it!  I spent{57}over 1000 golds on that{57}stupid chicken race!!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $260,$1	; Run text script at offset 0x027BDE
					; 0xE22D: PRINT	MSG 0x027A, MSGBOX CLEARED, END: "{5B}:	We almost never	get to{57}go inside the	castle...{5E}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $261,$3	; Run text script at offset 0x027BE0
					; 0xE22E: PRINT	MSG 0x027B, MSGBOX CLEARED, END: "{5B}:	The duke is now	receiving{57}applications for mercenaries.{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $262,$5	; Run text script at offset 0x027BE2
					; 0xE22F: PRINT	MSG 0x027C, MSGBOX CLEARED, END: "{5B}:	YOU were invited to the{57}castle?  You	must be	strong!{57}Can I have your autograph?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0013:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $263,$1	; Run text script at offset 0x027BE4
					; 0xE230: PRINT	MSG 0x027D, MSGBOX CLEARED, END: "{5B}:	No, no,	don't disturb me!{57}This requires my utmost{57}concentration...{5E}"
					;
		dc.w $D			; Params 00, 0D
		ScriptID    $264,$3	; Run text script at offset 0x027BE6
					; 0x7C3D: LOAD CUSTOM ACTION 0x3D (0x1000000F3 CSA_003D), MSGBOX CLEARED, END
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $265,$5	; Run text script at offset 0x027BE8
					; 0xE231: PRINT	MSG 0x027E, MSGBOX CLEARED, END: "{5B}:	What's wrong with you?{57}Go ahead!  Just open the{57}door and go in!{5E}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $266,$7	; Run text script at offset 0x027BEA
					; 0xE232: PRINT	MSG 0x027F, MSGBOX CLEARED, END: "{5B}:	How was	it?  Not quite{57}what you thought, was	it?{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $267,$9	; Run text script at offset 0x027BEC
					; 0xE233: PRINT	MSG 0x0280, MSGBOX CLEARED, END: "{5B}:	I said,	do not disturb me!{57}Hammana, hammena,	hammina...{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptJump  CS_0013_0,$B ; Jump	to address 0x02646A
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $26F,$D	; Run text script at offset 0x027BFC
					; 0x8238: PRINT	MSG 0x0285: "{5B}: Please don't disturb me, or{57}I will be forced to turn you{57}into a dog!!{62}"
					; 0xE239: PRINT	MSG 0x0286, MSGBOX CLEARED, END: "{5B}:	Now, where was I?.....{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0013_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $132		; Bit 2	of flag	0x026
		ScriptID    $26D,$1	; Flag set:   Run text script at offset	0x027BF8
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0xE237: PRINT	MSG 0x0284, MSGBOX CLEARED, END: "{5B}:	You got	the {5F}!{57}My	crystal	ball never lies....{5E}"
		ScriptID    $268,$2	; Flag clear: Run text script at offset	0x027BEE
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0x081E: LOAD 0x001E INTO 0xFF119A (Sun{6A}Stone)
					; 0x8234: PRINT	MSG 0x0281: "{5B}: The {5F}!  I	can see	it!{57}Now go and get it!{62}"
					; 0x8235: PRINT	MSG 0x0282: "{5B}: Then	the lighthouse{57}will be restored!{62}"
					; 0xE236: PRINT	MSG 0x0283, MSGBOX CLEARED, END: "{5B}:	I think	you're smart enough{57}to get through Greenmaze{57}on your own.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00AF:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $271,$1	; Run text script at offset 0x027C00
					; 0xE23A: PRINT	MSG 0x0287, MSGBOX CLEARED, END: "{5B}:	I want to be young again.....{5E}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $272,$3	; Run text script at offset 0x027C02
					; 0xE23B: PRINT	MSG 0x0288, MSGBOX CLEARED, END: "{5B}:	Hi, cutie!{57}Am I pretty?{57}Am I young? La-la-la!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $273,$1	; Run text script at offset 0x027C04
					; 0xE23C: PRINT	MSG 0x0289, MSGBOX CLEARED, END: "{5B}:	If my mom really becomes{57}young, I can boast to all my{57}friends!{5E}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $274,$3	; Run text script at offset 0x027C06
					; 0xE23D: PRINT	MSG 0x028A, MSGBOX CLEARED, END: "{5B}:	I'm happy to see my mom{57}young again, but...{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $275,$1	; Run text script at offset 0x027C08
					; 0xE23E: PRINT	MSG 0x028B, MSGBOX CLEARED, END: "{5B}:	Monsters on this island{57}are rare.  They fetch a{57}good price on the	continent.{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $276,$3	; Run text script at offset 0x027C0A
					; 0xE23F: PRINT	MSG 0x028C, MSGBOX CLEARED, END: "{5B}:	I got a	ton of golds for{57}the	monsters!  I'm going to{57}Greenpea's Playhouse.{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $277,$5	; Run text script at offset 0x027C0C
					; 0x8240: PRINT	MSG 0x028D: "{5B}: I caught the	three most{57}wanted criminals on this{57}island!  They'll bring in{62}"
					; 0xE241: PRINT	MSG 0x028E, MSGBOX CLEARED, END: "{5B}:	a good price!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B2:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $279,$0	; Run text script at offset 0x027C10
					; 0x1BEE: LOAD SPECIAL CHARACTER * (0x06)
					; 0xE242: PRINT	MSG 0x028F, MSGBOX CLEARED, END: "{5B}:	...grrrrrrrrr...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B3:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $27B,$0	; Run text script at offset 0x027C14
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0xE243: PRINT	MSG 0x0290, MSGBOX CLEARED, END: "{5B}:	....whoooOOOOoooo!!!......{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B4:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $27D,$0	; Run text script at offset 0x027C18
					; 0x1BEE: LOAD SPECIAL CHARACTER * (0x06)
					; 0xE244: PRINT	MSG 0x0291, MSGBOX CLEARED, END: "{5B}:	YAAARRRG!!.....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B5:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $27F,$0	; Run text script at offset 0x027C1C
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0xE245: PRINT	MSG 0x0292, MSGBOX CLEARED, END: "{5B}:	Hissssss!!!.....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $281,$1	; Run text script at offset 0x027C20
					; 0x8246: PRINT	MSG 0x0293: "{5B}: Duke	Mercator is a man of{57}fine character.	 This{57}comfortable life we lead{62}"
					; 0xE247: PRINT	MSG 0x0294, MSGBOX CLEARED, END: "{5B}:	is all because of him.{57}Hurrah for Duke Mercator!{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $283,$3	; Run text script at offset 0x027C24
					; 0xE248: PRINT	MSG 0x0295, MSGBOX CLEARED, END: "{5B}:	W-{59}wh-{59}what?{57}Duke Mercator deserted us?{57}I don't believe it!{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $284,$5	; Run text script at offset 0x027C26
					; 0xE249: PRINT	MSG 0x0296, MSGBOX CLEARED, END: "{5B}:	Hurrah for General Arthur!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $285,$1	; Run text script at offset 0x027C28
					; 0x824A: PRINT	MSG 0x0297: "{5B}: I heard that	an evil	magician{57}to the south of us is a source{57}of great distress	to the Duke.{62}"
					; 0x824B: PRINT	MSG 0x0298: "{5B}: He must be using his	magic{57}powers	to threaten the	Duke{57}into giving him	money.{62}"
					; 0xE24C: PRINT	MSG 0x0299, MSGBOX CLEARED, END: "{5B}:	That's why we have to{57}pay a heavy tax...isn't it?{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $288,$3	; Run text script at offset 0x027C2E
					; 0xE24D: PRINT	MSG 0x029A, MSGBOX CLEARED, END: "{5B}:	Did you	defeat Mir?  Really?{57}Then why the long face?{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $289,$5	; Run text script at offset 0x027C30
					; 0xE24E: PRINT	MSG 0x029B, MSGBOX CLEARED, END: "{5B}:	Where will we be{57}without Duke Mercator?{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $28A,$7	; Run text script at offset 0x027C32
					; 0xE24F: PRINT	MSG 0x029C, MSGBOX CLEARED, END: "{5B}:	General	Arthur lowered{57}the tax rate.{57}He's quite a guy!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $28B,$1	; Run text script at offset 0x027C34
					; 0x8250: PRINT	MSG 0x029D: "{5B}: Welcome to Mr. Ludwig'.{57}If you came for a{57}music lesson,{62}"
					; 0xE251: PRINT	MSG 0x029E, MSGBOX CLEARED, END: "{5B}:	Mr. Ludwig is out.....{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $28D,$3	; Run text script at offset 0x027C38
					; 0xE252: PRINT	MSG 0x029F, MSGBOX CLEARED, END: "{5B}:	Ludwig is not here!{57}I'm afraid It'll be some time{57}before he returns.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $28E,$1	; Run text script at offset 0x027C3A
					; 0x8253: PRINT	MSG 0x02A0: "{5B}: Did you come	here to	listen{57}to him play, too?  I came{57}all the way from	the continent{62}"
					; 0xE254: PRINT	MSG 0x02A1, MSGBOX CLEARED, END: "{5B}:	just to	hear our very own{57}national treasure play...{57}where	is he?{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $290,$3	; Run text script at offset 0x027C3E
					; 0xE255: PRINT	MSG 0x02A2, MSGBOX CLEARED, END: "{5B}:	What a pity!  I	was looking{57}forward to listening to that{57}beautiful sound of his.{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $291,$5	; Run text script at offset 0x027C40
					; 0x8256: PRINT	MSG 0x02A3: "{5B}: I'm going back to the{57}continent.  There's no sense{57}in waiting any longer{62}"
					; 0x8257: PRINT	MSG 0x02A4: "{5B}: for this Ludwig character.{57}What?	The lighthouse is{57}out of order?{62}"
					; 0xE258: PRINT	MSG 0x02A5, MSGBOX CLEARED, END: "{5B}:	Gee!{57}Of all the rotten luck!!!{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $294,$7	; Run text script at offset 0x027C46
					; 0xE259: PRINT	MSG 0x02A6, MSGBOX CLEARED, END: "{5B}:	I'm going back home.{57}Looks like I'll never get to{57}hear him play, now.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0014:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $295,$0	; Run text script at offset 0x027C48
					; 0xE25A: PRINT	MSG 0x02A7, MSGBOX CLEARED, END: "{5B}:	Hurry, hurry!!{57}Step right up!{57}We're almost out of stock!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00BA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $296,$1	; Run text script at offset 0x027C4A
					; 0xE25B: PRINT	MSG 0x02A8, MSGBOX CLEARED, END: "{5B}:	There's none cheaper!{57}Low-price guarantee...{57}...every day!!{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $297,$3	; Run text script at offset 0x027C4C
					; 0x825C: PRINT	MSG 0x02A9: "{5B}: This	shop is	famous{57}even on the continent.  I have{57}a huge shopping list for{62}"
					; 0xE25D: PRINT	MSG 0x02AA, MSGBOX CLEARED, END: "{5B}:	all my friends.....{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00BB:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $299,$0	; Run text script at offset 0x027C50
					; 0xE25E: PRINT	MSG 0x02AB, MSGBOX CLEARED, END: "{5B}:	This shop is always crowded{57}because it's cheaper than{57}that other shop over there.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00BC:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $29A,$0	; Run text script at offset 0x027C52
					; 0xE25F: PRINT	MSG 0x02AC, MSGBOX CLEARED, END: "{5B}:	What a fool!{57}I bought too many!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0015:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $29B,$1	; Run text script at offset 0x027C54
					; 0xE260: PRINT	MSG 0x02AD, MSGBOX CLEARED, END: "{5B}:	If you're not a registered{57}member, don't waste my time.{57}Scram!  Beat it!!{5E}"
					;
		dc.w $C			; Params 00, 0C
		ScriptID    $29C,$3	; Run text script at offset 0x027C56
					; 0xE261: PRINT	MSG 0x02AE, MSGBOX CLEARED, END: "{5B}:	You again!{57}I	said members only!{57}Now, out!	 Out!{5E}"
					;
		dc.w $E			; Params 00, 0E
		ScriptJump  CS_0015_0,$5 ; Jump	to address 0x02653E
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $29F,$7	; Run text script at offset 0x027C5C
					; 0xE263: PRINT	MSG 0x02B0, MSGBOX CLEARED, END: "{5B}:	What a stubborn	kid!{57}Do you want to make me angry?{57}Get out of here!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0015_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $1A		; Bit 2	of flag	0x003
		ScriptID    $29E,$1	; Flag set:   Run text script at offset	0x027C5A
					; 0xE262: PRINT	MSG 0x02AF, MSGBOX CLEARED, END: "{5B}:	Please...go on upstairs.{5E}"
		ScriptID    $29D,$2	; Flag clear: Run text script at offset	0x027C58
					; 0x7C3E: LOAD CUSTOM ACTION 0x3E (0x1000000F7 CSA_003E), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0016:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_0016_0,$1 ; Jump	to address 0x026560
					;
		dc.w $C			; Params 00, 0C
		ScriptJump  CS_0016_2,$3 ; Jump	to address 0x026578
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $2A4,$5	; Run text script at offset 0x027C66
					; 0xE267: PRINT	MSG 0x02B4, MSGBOX CLEARED, END: "{5B}:	Hello, kind sir.  To become{57}a member	at Madame Yard's,{57}please ask at the counter.{5E}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $2A5,$7	; Run text script at offset 0x027C68
					; 0xE268: PRINT	MSG 0x02B5, MSGBOX CLEARED, END: "{5B}:	Say hello to Miss Shorty--{57}er, I mean, Miss Friday!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0016_0:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2A0,$0	; Run text script at offset 0x027C5E
					; 0x14C6: SET BIT 6 OF FLAG 0x018
					; 0x8264: PRINT	MSG 0x02B1: "{5B}: You're too young for{57}Madame Yard's.  I'm sorry.{62}"
					; 0xE265: PRINT	MSG 0x02B2, MSGBOX CLEARED, END: "{5B}:	Please come again{57}when you've grown up.{5E}"
; ---------------------------------------------------------------------------
		move.w	#$C8,d0	; '�'

loc_26568:				; CODE XREF: ROM:00026A2Aj
		bsr.w	TestFlagBit
		beq.s	CS_0016_1
		move.w	#$2C,d0	; ','
		bsr.w	SetFlagBit

CS_0016_1:				; CODE XREF: ROM:0002656Cj
		rts
; ---------------------------------------------------------------------------

CS_0016_2:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $1E		; Bit 6	of flag	0x003
		ScriptID    $2A5,$1	; Flag set:   Run text script at offset	0x027C68
					; 0xE268: PRINT	MSG 0x02B5, MSGBOX CLEARED, END: "{5B}:	Say hello to Miss Shorty--{57}er, I mean, Miss Friday!{5E}"
		ScriptID    $2A3,$2	; Flag clear: Run text script at offset	0x027C64
					; 0xE266: PRINT	MSG 0x02B3, MSGBOX CLEARED, END: "{5B}:	Curious	boy!{57}You know, curiosity is a{57}necessity for greatness.....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0017:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2A6,$1	; Run text script at offset 0x027C6A
					; 0xE269: PRINT	MSG 0x02B6, MSGBOX CLEARED, END: "{5B}:	Non-members can't{57}go upstairs.  Sorry.{5E}"
					;
		dc.w $C			; Params 00, 0C
		ScriptID    $2A7,$3	; Run text script at offset 0x027C6C
					; 0x142E: SET BIT 6 OF FLAG 0x005
					; 0x826A: PRINT	MSG 0x02B7: "{5B}: OK, listen carefully.{57}This is a popular trick{57}among the young boys...{62}"
					; 0xE26B: PRINT	MSG 0x02B8, MSGBOX CLEARED, END: "{5B}:	Go and see the Fortuneteller.{57}I'm sure you'll be{57}pleasantly surprised!{5E}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $2AA,$5	; Run text script at offset 0x027C72
					; 0xE26C: PRINT	MSG 0x02B9, MSGBOX CLEARED, END: "{5B}:	Welcome	to Madame Yard's!{57}She's the very best!!{5E}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $2AB,$7	; Run text script at offset 0x027C74
					; 0x826D: PRINT	MSG 0x02BA: "{5B}: Hardships are essential{57}for you to mature.{62}"
					; 0xE26E: PRINT	MSG 0x02BB, MSGBOX CLEARED, END: "{5B}:	There really are no{57}easy solutions.....{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00BD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2AD,$1	; Run text script at offset 0x027C78
					; 0x826F: PRINT	MSG 0x02BC: "{5B}: Quite expensive, but	I feel{57}much better!	I've got to go{57}home now and...{62}"
					; 0xE270: PRINT	MSG 0x02BD, MSGBOX CLEARED, END: "{5B}:	practice what I	learned...{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2AF,$3	; Run text script at offset 0x027C7C
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0xE271: PRINT	MSG 0x02BE, MSGBOX CLEARED, END: "{5B}:	Duke Mercator asked him{57}to steal the	{5F} for{57}six	golds!	Six!!{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2B1,$5	; Run text script at offset 0x027C80
					; 0xE272: PRINT	MSG 0x02BF, MSGBOX CLEARED, END: "{5B}:	I've just about dislocated{57}my jaw from talking so much.{5E}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $2B2,$7	; Run text script at offset 0x027C82
					; 0xE273: PRINT	MSG 0x02C0, MSGBOX CLEARED, END: "{5B}:	I want them to lower{57}our taxes!{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2B3,$9	; Run text script at offset 0x027C84
					; 0xE274: PRINT	MSG 0x02C1, MSGBOX CLEARED, END: "{5B}:	My favorite game is{57}roulette!  Let's go win{57}a bundle on it!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00BE:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2B4,$0	; Run text script at offset 0x027C86
					; 0xE275: PRINT	MSG 0x02C2, MSGBOX CLEARED, END: "{5B}:	Me?  Yes, I'm a{57}member, but I don't wear{57}my tutu when I'm off.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00BF:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2B5,$0	; Run text script at offset 0x027C88
					; 0x8276: PRINT	MSG 0x02C3: "{5B}: I've been waiting all week{57}for a session with{57}Madame Yard!{62}"
					; 0xE277: PRINT	MSG 0x02C4, MSGBOX CLEARED, END: "{5B}:	If only	I could	afford to{57}come here more often.....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_00C0_0,$1 ; Jump	to address 0x0265DA
					;
		dc.w $101		; Params 01, 01
		ScriptJump  CS_00C0_1,$3 ; Jump	to address 0x0265E6
					;
		dc.w $102		; Params 01, 02
		ScriptID    $2D0,$5	; Run text script at offset 0x027CBE
					; 0xE28D: PRINT	MSG 0x02DA, MSGBOX CLEARED, END: "{5B}:	Did you	go to the market?{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_00C0_8,$7 ; Jump	to address 0x02662E
					;
		dc.w $103		; Params 01, 03
		ScriptJump  CS_00C0_7,$9 ; Jump	to address 0x026622
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C0_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C7		; Bit 7	of flag	0x018
		ScriptID    $2B7,$1	; Flag clear: Run text script at offset	0x027C8C
					; 0x8278: PRINT	MSG 0x02C5: "{5B}: ...sigh....The shop is{57}closed now.  But you can{57}see that.....{62}"
					; 0x8279: PRINT	MSG 0x02C6: "{5B}: As you know,	there's another{57}shop just across the way.{57}Both of us sell{62}"
					; 0x827A: PRINT	MSG 0x02C7: "{5B}: the same items, but they{57}sell them much cheaper.{57}I'm thinking of changing{62}"
					; 0x827B: PRINT	MSG 0x02C8: "{5B}: my job, but I don't know what{57}kind of shop I'd be most{57}suitable for.....{62}"
					; 0xE27C: PRINT	MSG 0x02C9, MSGBOX CLEARED, END: "{5B}:	I don't even want to{57}get out of bed, I'm{57}such a failure!.....{5E}"
		ScriptID    $2BC,$2	; Flag set:   Run text script at offset	0x027C96
					; 0xE27D: PRINT	MSG 0x02CA, MSGBOX CLEARED, END: "{5B}:	I want to open a new shop...{57}...sigh...what should I	do?...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C0_1:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2BD,$0	; Run text script at offset 0x027C98
					; 0x827E: PRINT	MSG 0x02CB: "{5B}: Nigel, how have you been?{57}I've been thinking hard about{57}starting over,{62}"
					; 0x827F: PRINT	MSG 0x02CC: "{5B}: making a new	life....and I{57}finally made up my mind{57}to change my job!{62}"
					; 0xA280: PRINT	MSG 0x02CD, END: "{5B}:	Would you give me{57}your opinion?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	CS_00C0_2
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2C0,$0	; Run text script at offset 0x027C9E
					; 0xE281: PRINT	MSG 0x02CE, MSGBOX CLEARED, END: "{5B}:	Yeah, I	know that you're{57}busy.  Visit me later when{57}you have nothing better to do.{5E}"
; ---------------------------------------------------------------------------
		bra.s	CS_00C0_6
; ---------------------------------------------------------------------------

CS_00C0_2:				; CODE XREF: ROM:000265EEj
					; ROM:0002661Aj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2C1,$0	; Run text script at offset 0x027CA0
					; 0xA282: PRINT	MSG 0x02CF, END: "{5B}:	How about a drugstore?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	CS_00C0_3
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2C6,$0	; Run text script at offset 0x027CAA
					; 0x1553: SET BIT 3 OF FLAG 0x02A
					; 0xA287: PRINT	MSG 0x02D4, END: "{5B}:	You agree?  Great!!{57}It looks	like I'm a drugstore{57}owner from now on!{62}"
; ---------------------------------------------------------------------------
		bra.s	CS_00C0_5
; ---------------------------------------------------------------------------

CS_00C0_3:				; CODE XREF: ROM:000265FEj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2C2,$0	; Run text script at offset 0x027CA2
					; 0xA283: PRINT	MSG 0x02D0, END: "{5B}:	Hmmm....okay, then,{57}how about a variety shop?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	CS_00C0_4
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2C8,$0	; Run text script at offset 0x027CAE
					; 0xA288: PRINT	MSG 0x02D5, END: "{5B}:	You agree?  Then it's{57}settled!  I'm a variety shop{57}owner from now on!{62}"
; ---------------------------------------------------------------------------
		bra.s	CS_00C0_5
; ---------------------------------------------------------------------------

CS_00C0_4:				; CODE XREF: ROM:0002660Ej
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2C3,$0	; Run text script at offset 0x027CA4
					; 0x8284: PRINT	MSG 0x02D1: "{5B}: Well, I've got the list of{57}possibilities narrowed down{57}to these two.  So......{62}"
					; 0x8285: PRINT	MSG 0x02D2: "{5B}: choose between the two.{57}I'll follow your advice.{62}"
					; 0xA286: PRINT	MSG 0x02D3, END: "{5B}:	Now, let's try once more.{62}"
; ---------------------------------------------------------------------------
		bra.s	CS_00C0_2
; ---------------------------------------------------------------------------

CS_00C0_5:				; CODE XREF: ROM:00026604j
					; ROM:00026614j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2C9,$0	; Run text script at offset 0x027CB0
					; 0x1552: SET BIT 2 OF FLAG 0x02A
					; 0x8289: PRINT	MSG 0x02D6: "{5B}: By the way, would you{57}do me a favor?{57}I'd like you to go to the{62}"
					; 0x828A: PRINT	MSG 0x02D7: "{5B}: wholesale market at the{57}Mercator port warehouse.{57}It opens when	the ship from{62}"
					; 0x828B: PRINT	MSG 0x02D8: "{5B}: the continent docks here.{57}Please go to the market	and{57}pick up the goods for me.{62}"
					; 0x828C: PRINT	MSG 0x02D9: "{5B}: I'll stay here and fix things{57}up.  Bring this with you.{57}It's a Buyers' Guild card.{62}"
					; 0x0019: LOAD 0x0019 INTO 0xFF1196 (Buyer{6A}Card)
					; 0x77E8: RECEIVE ITEM [0xFF1196], MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

CS_00C0_6:				; CODE XREF: ROM:000265F4j
		rts
; ---------------------------------------------------------------------------

CS_00C0_7:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DD		; Bit 5	of flag	0x01B
		ScriptID    $2D1,$1	; Flag clear: Run text script at offset	0x027CC0
					; 0x828E: PRINT	MSG 0x02DB: "{5B}: I received the goods, and I'm{57}doing quite well these days!{62}"
					; 0x828F: PRINT	MSG 0x02DC: "{5B}: I'm happy with my new{57}shop!  This is the turning{57}point of my life!{62}"
					; 0x8290: PRINT	MSG 0x02DD: "{5B}: I owe it all	to you,	Nigel!{62}"
					; 0x8291: PRINT	MSG 0x02DE: "{5B}: In return, I'd like to offer you{57}my bargain basement prices!{62}"
					; 0xE292: PRINT	MSG 0x02DF, MSGBOX CLEARED, END: "{5B}:	Drop by	anytime!{5E}"
		ScriptID    $2D6,$2	; Flag set:   Run text script at offset	0x027CCA
					; 0xE293: PRINT	MSG 0x02E0, MSGBOX CLEARED, END: "{5B}:	We have	a large	stock{57}of unusual things!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C0_8:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $152		; Bit 2	of flag	0x02A
		ScriptID    $2D7,$1	; Flag set:   Run text script at offset	0x027CCC
					; 0x8294: PRINT	MSG 0x02E1: "{5B}: Was the market already{57}closed?  That's okay.{57}They'll open it up again.{62}"
					; 0xE295: PRINT	MSG 0x02E2, MSGBOX CLEARED, END: "{5B}:	I'll just stay here and{57}get things ready so I can{57}go for myself next month.{5E}"
		ScriptJump  CS_00C0_0,$2 ; Flag	clear: Jump to address 0x0365DA
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2D9,$1	; Run text script at offset 0x027CD0
					; 0xE296: PRINT	MSG 0x02E3, MSGBOX CLEARED, END: "{5B}:	Dad should have	checked{57}around town before{57}opening this shop...{5E}"
					;
		dc.w $101		; Params 01, 01
		ScriptID    $2DA,$3	; Run text script at offset 0x027CD2
					; 0xE297: PRINT	MSG 0x02E4, MSGBOX CLEARED, END: "{5B}:	My dad is thinking of{57}changing his job.{5E}"
					;
		dc.w $102		; Params 01, 02
		ScriptJump  CS_00C1_0,$5 ; Jump	to address 0x026654
					;
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_00C1_1,$7 ; Jump	to address 0x026660
					;
		dc.w $103		; Params 01, 03
		ScriptID    $2DD,$9	; Run text script at offset 0x027CD8
					; 0x829A: PRINT	MSG 0x02E7: "{5B}: Dad is back on his feet, and{57}I'm keeping him on his toes!{57}We'll have a whole chain of{62}"
					; 0xE29B: PRINT	MSG 0x02E8, MSGBOX CLEARED, END: "{5B}:	stores someday!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C1_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $153		; Bit 3	of flag	0x02A
		ScriptID    $2DB,$1	; Flag set:   Run text script at offset	0x027CD4
					; 0xE298: PRINT	MSG 0x02E5, MSGBOX CLEARED, END: "{5B}:	I'm a drugstore owner's son{57}from now on!  Wow!{5E}"
		ScriptID    $2DC,$2	; Flag clear: Run text script at offset	0x027CD6
					; 0xE299: PRINT	MSG 0x02E6, MSGBOX CLEARED, END: "{5B}:	I'm a variety shop owner's{57}son from now on! Wow!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C1_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $152		; Bit 2	of flag	0x02A
		ScriptID    $2DD,$1	; Flag set:   Run text script at offset	0x027CD8
					; 0x829A: PRINT	MSG 0x02E7: "{5B}: Dad is back on his feet, and{57}I'm keeping him on his toes!{57}We'll have a whole chain of{62}"
					; 0xE29B: PRINT	MSG 0x02E8, MSGBOX CLEARED, END: "{5B}:	stores someday!{5E}"
		ScriptID    $2D9,$2	; Flag clear: Run text script at offset	0x027CD0
					; 0xE296: PRINT	MSG 0x02E3, MSGBOX CLEARED, END: "{5B}:	Dad should have	checked{57}around town before{57}opening this shop...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0018:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $E4		; Bit 4	of flag	0x01C
		ScriptID    $64B,$1	; Flag set:   Run text script at offset	0x0283B4
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0xE56C: PRINT	MSG 0x05B9, MSGBOX CLEARED, END: "{5B}:	Imagine!  A little kid...{57}I need a vacation!{5E}"
		ScriptID    $2DF,$2	; Flag clear: Run text script at offset	0x027CDC
					; 0x7C30: LOAD CUSTOM ACTION 0x30 (0x1000000BF CSA_0030), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C2:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2E1,$1	; Run text script at offset 0x027CE0
					; 0x829D: PRINT	MSG 0x02EA: "{5B}: It's quite embarrassing!  My son{57}goes to Madame.....Lard's{57}or something almost everyday!{62}"
					; 0xE29E: PRINT	MSG 0x02EB, MSGBOX CLEARED, END: "{5B}:	I just can't understand him!{57}Is it such a great place?{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2E3,$3	; Run text script at offset 0x027CE4
					; 0x829F: PRINT	MSG 0x02EC: "{5B}: Mir lives in	that old tower,{57}but I hear he was in	town{57}long before the	duke.{62}"
					; 0xE2A0: PRINT	MSG 0x02ED, MSGBOX CLEARED, END: "{5B}:	Apparently, the	duke expelled{57}him from Mercator because of{57}some hideous crime.....{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $2E5,$5	; Run text script at offset 0x027CE8
					; 0x82A1: PRINT	MSG 0x02EE: "{5B}: Mir lives in	that old tower,{57}but I hear he was in	town{57}long before the	duke.{62}"
					; 0x82A2: PRINT	MSG 0x02EF: "{5B}: Apparently, the duke	expelled him{57}frome Mercator because of{57}some hideous crime.....{62}"
					; 0xE2A3: PRINT	MSG 0x02F0, MSGBOX CLEARED, END: "{5B}:	Oh, I don't know if it's{57}true or not.  I just{57}heard it from a friend.{62}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2E8,$7	; Run text script at offset 0x027CEE
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0xE2A4: PRINT	MSG 0x02F1, MSGBOX CLEARED, END: "{5B}:	The {5F} is a{57}precious ore.	It's only found{57}in the depths of Greenmaze.{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2EA,$9	; Run text script at offset 0x027CF2
					; 0xE2A5: PRINT	MSG 0x02F2, MSGBOX CLEARED, END: "{5B}:	I haven't heard a thing{58}rom my relatives in Verla{57}for a while, now.....{5E}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $2EB,$B	; Run text script at offset 0x027CF4
					; 0xE2A6: PRINT	MSG 0x02F3, MSGBOX CLEARED, END: "{5B}:	I heard	that Duke Mercator{57}brought nothing but trouble{57}to	Verla as well.{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2EC,$D	; Run text script at offset 0x027CF6
					; 0xE2A7: PRINT	MSG 0x02F4, MSGBOX CLEARED, END: "{5B}:	If General Arthur had been{57}killed, Mercator would be{57}a ghost town, now!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C3:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2ED,$1	; Run text script at offset 0x027CF8
					; 0xE2A8: PRINT	MSG 0x02F5, MSGBOX CLEARED, END: "{5B}:	I disagree with	him.{57}I think	Madame Yard's{57}is a nice place.{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2EE,$3	; Run text script at offset 0x027CFA
					; 0xE2A9: PRINT	MSG 0x02F6, MSGBOX CLEARED, END: "{5B}:	It's impossible to enter{57}Mir's tower because of{57}the barrier at the door...{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $2EF,$5	; Run text script at offset 0x027CFC
					; 0xE2AA: PRINT	MSG 0x02F7, MSGBOX CLEARED, END: "{5B}:	...Oh, it's you...{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2F0,$7	; Run text script at offset 0x027CFE
					; 0x82AB: PRINT	MSG 0x02F8: "{5B}: Greenmaze is	to the north{57}of the castle.	Many tourists{57}are reported missing there{62}"
					; 0xE2AC: PRINT	MSG 0x02F9, MSGBOX CLEARED, END: "{5B}:	each year, so the duke{57}prohibited all entry{57}into Greenmaze.{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2F2,$9	; Run text script at offset 0x027D02
					; 0xE2AD: PRINT	MSG 0x02FA, MSGBOX CLEARED, END: "{5B}:	Duke Mercator is crazy with{57}greed over those	treasures.{57}Are they really so valuable?{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2F3,$B	; Run text script at offset 0x027D04
					; 0xE2AE: PRINT	MSG 0x02FB, MSGBOX CLEARED, END: "{5B}:	I'm quite satisfied with{57}General Arthur's{57}administration.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C4:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2F4,$1	; Run text script at offset 0x027D06
					; 0x82AF: PRINT	MSG 0x02FC: "{5B}: I saw a great beauty{57}walking along the street.{57}Her two	attendants were...{62}"
					; 0xE2B0: PRINT	MSG 0x02FD, MSGBOX CLEARED, END: "{5B}:	....can	you guess?{57}They were	monsters!{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2F6,$3	; Run text script at offset 0x027D0A
					; 0xE2B1: PRINT	MSG 0x02FE, MSGBOX CLEARED, END: "{5B}:	Are you	going to defeat{57}the magician	in the tower?{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $2F7,$5	; Run text script at offset 0x027D0C
					; 0xE2B2: PRINT	MSG 0x02FF, MSGBOX CLEARED, END: "{5B}:	Wow!{57}You came back alive!{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2F8,$7	; Run text script at offset 0x027D0E
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0xE2B3: PRINT	MSG 0x0300, MSGBOX CLEARED, END: "{5B}:	But the	lighthouse cannot{57}exist without the {5F}!{57}Who would do such a thing?{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2FA,$9	; Run text script at offset 0x027D12
					; 0x82B4: PRINT	MSG 0x0301: "{5B}: If the tunnel between Verla{57}and Mercator could be{57}re-opened, Verla would be just{62}"
					; 0x82B5: PRINT	MSG 0x0302: "{5B}: a step away.	 But a recent{57}earthquake blocked up the{57}tunnel.  So you can only{62}"
					; 0xE2B6: PRINT	MSG 0x0303, MSGBOX CLEARED, END: "{5B}:	get to Verla by	sea, now.....{5E}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $2FD,$B	; Run text script at offset 0x027D18
					; 0xE2B7: PRINT	MSG 0x0304, MSGBOX CLEARED, END: "{5B}:	One of my relatives{57}runs a shop in Verla.{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2FE,$D	; Run text script at offset 0x027D1A
					; 0xE2B8: PRINT	MSG 0x0305, MSGBOX CLEARED, END: "{5B}:	General	Arthur struggled{57}with the Duke to the last.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0019:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2FF,$1	; Run text script at offset 0x027D1C
					; 0x82B9: PRINT	MSG 0x0306: "{5B}: Would you like a fruit drink?{57}How	about my Dahl Delight?{62}"
					; 0xE2BA: PRINT	MSG 0x0307, MSGBOX CLEARED, END: "{5B}:	It's the choice of a{57}new generation!{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $301,$3	; Run text script at offset 0x027D20
					; 0x82BB: PRINT	MSG 0x0308: "{5B}: Duke	Mercator is now{57}recruiting mercenaries to{57}mount an attack	against	Mir.{62}"
					; 0xE2BC: PRINT	MSG 0x0309, MSGBOX CLEARED, END: "{5B}:	They're having a victory{57}celebration in advance.{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $303,$5	; Run text script at offset 0x027D24
					; 0xE2BD: PRINT	MSG 0x030A, MSGBOX CLEARED, END: "{5B}:	Nigel!{57}Is it	true you defeated Mir?{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $304,$7	; Run text script at offset 0x027D26
					; 0x82BE: PRINT	MSG 0x030B: "{5B}: Duke	Mercator ran out on{57}the town!  What a surprise!{62}"
					; 0xE2BF: PRINT	MSG 0x030C, MSGBOX CLEARED, END: "{5B}:	What are we going to do	now?{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  CS_0019_0,$9 ; Jump	to address 0x0266F4
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0019_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $14A		; Bit 2	of flag	0x029
		ScriptID    $9E0,$1	; Flag set:   Run text script at offset	0x028ADE
					; 0x1819: LOAD CHARACTER SCRIPT	Owner (0x0019)
					; 0xE7A7: PRINT	MSG 0x07F4, MSGBOX CLEARED, END: "{5B}:	Sorry...looks like{57}the system's out of order!{57}Ha ha ha!{5E}"
		ScriptID    $306,$2	; Flag clear: Run text script at offset	0x027D2A
					; 0x82C0: PRINT	MSG 0x030D: "{5B}: I've remodeled!{57}You can order from upstairs{57}and not even get out of bed!{62}"
					; 0xE2C1: PRINT	MSG 0x030E, MSGBOX CLEARED, END: "{5B}:	Go upstairs and{57}order something.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_001A_0,$1 ; Jump	to address 0x02670E
					;
		dc.w $14		; Params 00, 14
		ScriptID    $30F,$3	; Run text script at offset 0x027D3C
					; 0x82C9: PRINT	MSG 0x0316: "{5B}: I felt a bit	sick, so I{57}came out here.  Princess{57}Rolia?  Well,	she's...{62}"
					; 0x82CA: PRINT	MSG 0x0317: "{5B}: ...particular...yes,	particular!{57}Actually, she's{57}very hard to deal with.{62}"
					; 0xE2CB: PRINT	MSG 0x0318, MSGBOX CLEARED, END: "{5B}:	Perhaps	her fussiness{57}irritated the Duke so much{57}he sent her back	home.....{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001A_0:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $308,$0	; Run text script at offset 0x027D2E
					; 0x82C2: PRINT	MSG 0x030F: "{5B}: Where is she?...sigh!...{57}...where	is she now...{57}oh!  Are you a	tourist?{62}"
					; 0xA2C3: PRINT	MSG 0x0310, END: "{5B}:	Will you hear my story?{58}"
; ---------------------------------------------------------------------------

CS_001A_1:				; CODE XREF: ROM:00026722j
		bsr.w	GetYesNoAnswer
		bcc.s	CS_001A_2
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $30A,$0	; Run text script at offset 0x027D32
					; 0x82C4: PRINT	MSG 0x0311: "{5B}: Needless to say, I'm Ludwig,{57}the world-famous composer{57}from the continent.{62}"
					; 0x82C5: PRINT	MSG 0x0312: "{5B}: Princess Rolia came here{57}to study	under me, but then...{62}"
					; 0x82C6: PRINT	MSG 0x0313: "{5B}: she just vanished!!{57}I'm afraid my lessons weren't{57}good enough for her...{62}"
					; 0xE2C7: PRINT	MSG 0x0314, MSGBOX CLEARED, END: "{5B}:	She might at least say{57}good-bye before leaving...{57}Sigh!...how cute she was....{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_26724
; ---------------------------------------------------------------------------

CS_001A_2:				; CODE XREF: ROM:00026716j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $30E,$0	; Run text script at offset 0x027D3A
					; 0xA2C8: PRINT	MSG 0x0315, END: "{5B}:	Oh, please listen....{58}"
; ---------------------------------------------------------------------------
		bra.s	CS_001A_1
; ---------------------------------------------------------------------------

locret_26724:				; CODE XREF: ROM:0002671Cj
		rts
; ---------------------------------------------------------------------------

CS_00C5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $312,$1	; Run text script at offset 0x027D42
					; 0xE2CC: PRINT	MSG 0x0319, MSGBOX CLEARED, END: "{5B}:	That Ludwig is a bit of	a sap!{57}I think he's out of his head{57}over this princess babe....{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $313,$3	; Run text script at offset 0x027D44
					; 0x82CD: PRINT	MSG 0x031A: "{5B}: Ludwig?  After returning{57}from the	castle,	he guzzled{62}"
					; 0xE2CE: PRINT	MSG 0x031B, MSGBOX CLEARED, END: "{5B}:	six Diet Dahls.	 Six!  Then{57}he became unruly, so I{57}had to	throw him out.{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $315,$5	; Run text script at offset 0x027D48
					; 0x82CF: PRINT	MSG 0x031C: "{5B}: How sensitive that Ludwig is!{57}He seemed so shocked when{57}I asked him to	leave.{62}"
					; 0x82D0: PRINT	MSG 0x031D: "{5B}: Now he's gone off{57}somewhere, probably to{57}lick his wounds.....{62}"
					; 0xE2D1: PRINT	MSG 0x031E, MSGBOX CLEARED, END: "{5B}:	These artist types sure{57}are hard to understand.{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $318,$7	; Run text script at offset 0x027D4E
					; 0xE2D2: PRINT	MSG 0x031F, MSGBOX CLEARED, END: "{5B}:	General	Arthur's alive!{57}Happy, happy!  Joy!  Joy!{57}Let's party!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $319,$1	; Run text script at offset 0x027D50
					; 0xE2D3: PRINT	MSG 0x0320, MSGBOX CLEARED, END: "{5B}:	Huzzah!	 Huzzah!  Let's hear{57}it for lower taxes!  Look out,{57}Mir, I'm comin' to getcha!{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $31A,$3	; Run text script at offset 0x027D52
					; 0x82D4: PRINT	MSG 0x0321: "{5B}: TOGA!  TOGA!	 TOGA!{57}Hey, you!  Barkeep!  Another{57}round	of Dahl	Delights!{62}"
					; 0xE2D5: PRINT	MSG 0x0322, MSGBOX CLEARED, END: "{5B}:	Are the	taxes lowered yet?{57}Did they get that	Mir guy?{57}Who	cares?	Let's party!!{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $31C,$5	; Run text script at offset 0x027D56
					; 0xE2D6: PRINT	MSG 0x0323, MSGBOX CLEARED, END: "{5B}:	Have you been to the{57}casino yet?  It's exciting!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $31D,$1	; Run text script at offset 0x027D58
					; 0x82D7: PRINT	MSG 0x0324: "{5B}: The men in this town{57}seem	to be falling{57}head over heels{62}"
					; 0xE2D8: PRINT	MSG 0x0325, MSGBOX CLEARED, END: "{5B}:	for some new cutie{57}from the continent.....{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $31F,$3	; Run text script at offset 0x027D5C
					; 0xE2D9: PRINT	MSG 0x0326, MSGBOX CLEARED, END: "{5B}:	Welcome	back, hero!{57}...but...why so troubled?{57}Anything wrong?{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $320,$5	; Run text script at offset 0x027D5E
					; 0x82DA: PRINT	MSG 0x0327: "{5B}: Is the rumor	about the{57}Duke true?	 If so,	he must{57}really be a wicked man!{62}"
					; 0xE2DB: PRINT	MSG 0x0328, MSGBOX CLEARED, END: "{5B}:	He was always smiling and{57}pretending	to serve the town.{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $322,$7	; Run text script at offset 0x027D62
					; 0xE2DC: PRINT	MSG 0x0329, MSGBOX CLEARED, END: "{5B}:	General	Arthur and his{57}new casino are the{57}talk of	the town now.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $323,$1	; Run text script at offset 0x027D64
					; 0xE2DD: PRINT	MSG 0x032A, MSGBOX CLEARED, END: "{5B}:	Take it	from me, kid!{57}Never,	never, NEVER give{57}your heart	to a girl!!{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $324,$3	; Run text script at offset 0x027D66
					; 0xE2DE: PRINT	MSG 0x032B, MSGBOX CLEARED, END: "{5B}:	Ah, Princess......{57}Zzzzzzzz.....{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  CS_00C8_0,$5 ; Jump	to address 0x026776
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C8_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $14A		; Bit 2	of flag	0x029
		ScriptID    $9DE,$1	; Flag set:   Run text script at offset	0x028ADA
					; 0x18C8: LOAD CHARACTER SCRIPT	* (0x00C8)
					; 0xE7A6: PRINT	MSG 0x07F3, MSGBOX CLEARED, END: "{5B}:	One more Ekenol	Punch!{57}{59}{59}...oops...{57}won't come up...{62}"
		ScriptID    $325,$2	; Flag clear: Run text script at offset	0x027D68
					; 0x7D2B: LOAD CUSTOM ACTION 0x12B (0x1000004AB	CSA_012B), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_00C9_0,$1 ; Jump	to address 0x026790
					;
		dc.w $14		; Params 00, 14
		ScriptID    $328,$3	; Run text script at offset 0x027D6E
					; 0xE2E1: PRINT	MSG 0x032E, MSGBOX CLEARED, END: "{5B}:	Zzzzz...{57}Julie.....{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C9_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $28		; Bit 0	of flag	0x005
		ScriptID    $327,$1	; Flag set:   Run text script at offset	0x027D6C
					; 0xE2E0: PRINT	MSG 0x032D, MSGBOX CLEARED, END: "{5B}:	Not only do I feel sick{57}to my stomach, I think{57}I sprained	my ankle.....!{5E}"
		ScriptID    $326,$2	; Flag clear: Run text script at offset	0x027D6A
					; 0xE2DF: PRINT	MSG 0x032C, MSGBOX CLEARED, END: "{5B}:	I...feel sick...{57}to my stomach......{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00CA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $329,$1	; Run text script at offset 0x027D70
					; 0x82E2: PRINT	MSG 0x032F: "{5B}: Duke	Mercator is originally{57}from the continent, so he{57}often invites guests from his{62}"
					; 0x82E3: PRINT	MSG 0x0330: "{5B}: homeland.  Just recently, a{57}noble	girl named Rolia came{62}"
					; 0xE2E4: PRINT	MSG 0x0331, MSGBOX CLEARED, END: "{5B}:	to study piano.	 I haven't{57}seen her around, lately, so{57}maybe she went home.....{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $32C,$3	; Run text script at offset 0x027D76
					; 0x82E5: PRINT	MSG 0x0332: "{5B}: I heard about you!  You're{57}one of those mercenary{57}fellas who're going off to{62}"
					; 0xE2E6: PRINT	MSG 0x0333, MSGBOX CLEARED, END: "{5B}:	defeat Mir and restore the{57}peace!  We're expecting much{57}from you!  Waste that wizard!{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $32E,$5	; Run text script at offset 0x027D7A
					; 0xE2E7: PRINT	MSG 0x0334, MSGBOX CLEARED, END: "{5B}:	Hey, hero!  How'd the{57}fight against Mir go?{57}Are you OK?{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $32F,$7	; Run text script at offset 0x027D7C
					; 0x82E8: PRINT	MSG 0x0335: "{5B}: If the terrible rumor{57}about the Duke is true, it{57}must be a lie	that it	was Mir{62}"
					; 0xE2E9: PRINT	MSG 0x0336, MSGBOX CLEARED, END: "{5B}:	who caused the heavy tax.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $331,$1	; Run text script at offset 0x027D80
					; 0x82EA: PRINT	MSG 0x0337: "{5B}: Our family has been serving{57}the castle for generations.{57}Now my	son is a cook, and{62}"
					; 0xE2EB: PRINT	MSG 0x0338, MSGBOX CLEARED, END: "{5B}:	my daughter is a maid.{57}They work for	Duke Mercator.{57}You envy them, right?{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $333,$3	; Run text script at offset 0x027D84
					; 0x82EC: PRINT	MSG 0x0339: "{5B}: My son told me that{57}you're going to the tower.{57}They say the tower{62}"
					; 0xE2ED: PRINT	MSG 0x033A, MSGBOX CLEARED, END: "{5B}:	is full	of traps and snares.{57}Please be careful!....{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $335,$5	; Run text script at offset 0x027D88
					; 0xE2EE: PRINT	MSG 0x033B, MSGBOX CLEARED, END: "{5B}:	Oh, Nigel!{57}You came back from the tower!{57}Amazing!{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $336,$7	; Run text script at offset 0x027D8A
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0x82EF: PRINT	MSG 0x033C: "{5B}: What	a fool!{57}Do you know the{57}importance of the{57}{5F}?{62}"
					; 0xE2F0: PRINT	MSG 0x033D, MSGBOX CLEARED, END: "{5B}:	Go to Greenmaze	and{57}find the	{5F}{57}by yourself!{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $339,$9	; Run text script at offset 0x027D90
					; 0xE2F1: PRINT	MSG 0x033E, MSGBOX CLEARED, END: "{5B}:	Finally	he's seen the light!{57}We've been preaching to him{57}for six hours!{5E}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptJump  CS_00CB_0,$B ; Jump	to address 0x0267D4
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $33E,$D	; Run text script at offset 0x027D9A
					; 0xE2F6: PRINT	MSG 0x0343, MSGBOX CLEARED, END: "{5B}:	That Arthur is quite an{57}able	statesman!  He opened{57}a casino to help lower	taxes!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CB_0:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $33A,$0	; Prompt:	Run text script	at offset 0x027D92
					; 0xA2F2: PRINT	MSG 0x033F, END: "{5B}:	Have you heard about{57}General	Arthur?{58}"
		ScriptID    $33C,$1	; Answer 'yes': Run text script at offset 0x027D96
					; 0x82F4: PRINT	MSG 0x0341: "{5B}: He was seriously injured...{57}Now he's under{57}strict medical care.{62}"
					; 0xE2F5: PRINT	MSG 0x0342, MSGBOX CLEARED, END: "{5B}:	I think	General	Arthur is{57}worthy of becoming{57}Mercator's next ruler.{5E}"
		ScriptID    $33B,$2	; Answer 'no':  Run text script at offset 0x027D94
					; 0x82F3: PRINT	MSG 0x0340: "{5B}: He's in charge of the{57}castle guard, now.  He's still{57}worried about the Duke's plot.{62}"
					; 0x82F4: PRINT	MSG 0x0341: "{5B}: He was seriously injured...{57}Now he's under{57}strict medical care.{62}"
					; 0xE2F5: PRINT	MSG 0x0342, MSGBOX CLEARED, END: "{5B}:	I think	General	Arthur is{57}worthy of becoming{57}Mercator's next ruler.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00CC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $33F,$1	; Run text script at offset 0x027D9C
					; 0xE2F7: PRINT	MSG 0x0344, MSGBOX CLEARED, END: "{5B}:	Heh, heh, heh...You'd better{57}leave....this place isn't for{57}sightseers.....heh, heh, heh...{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptJump  CS_00CC_0,$3 ; Jump	to address 0x0267F2
					;
		dc.w $15		; Params 00, 15
		ScriptID    $344,$5	; Run text script at offset 0x027DA6
					; 0xE2FC: PRINT	MSG 0x0349, MSGBOX CLEARED, END: "{5B}:	Heh heh, it was{57}good	practice for you,{57}wasn't it?...heh heh...{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CC_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $A2		; Bit 2	of flag	0x014
		ScriptID    $343,$1	; Flag set:   Run text script at offset	0x027DA4
					; 0xE2FB: PRINT	MSG 0x0348, MSGBOX CLEARED, END: "{5B}:	Both in	this world and{57}the one below...heh heh heh...{57}you	have to	use your brain.{5E}"
		ScriptID    $340,$2	; Flag clear: Run text script at offset	0x027D9E
					; 0x82F8: PRINT	MSG 0x0345: "{5B}: Ah, welcome...to the{57}Mercator Champion Motel!{57}Heros check in, but they{62}"
					; 0x82F9: PRINT	MSG 0x0346: "{5B}: don't check out!.....{62}"
					; 0xE2FA: PRINT	MSG 0x0347, MSGBOX CLEARED, END: "{5B}:	Well, heh heh...there it is,{57}the underground	crypt.{57}What're you waiting for?...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001B:
		cmpi.w	#1600,(g_AdditionalFlags+$1C).l
		blt.s	CS_001B_0
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w 8			; Bit 0	of flag	0x001
		ScriptID    $663,$1	; Flag set:   Run text script at offset	0x0283E4
					; 0xE57C: PRINT	MSG 0x05C9, MSGBOX CLEARED, END: "{5B}:	Please!	 Go away...{57}Don't come back!{57}I beg you...{5E}"
		ScriptID    $661,$2	; Flag clear: Run text script at offset	0x0283E0
					; 0x1408: SET BIT 0 OF FLAG 0x001
					; 0xE57B: PRINT	MSG 0x05C8, MSGBOX CLEARED, END: "{5B}:	No-no-no!  Please...{57}get out!  You're some kind{57}of con-artist, aren't you?{5E}"
; ---------------------------------------------------------------------------
		bra.s	CS_001B_1
; ---------------------------------------------------------------------------

CS_001B_0:				; CODE XREF: ROM:00026806j
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w 8			; Bit 0	of flag	0x001
		ScriptID    $346,$1	; Flag set:   Run text script at offset	0x027DAA
					; 0x82FD: PRINT	MSG 0x034A: "{5B}: Stand in front of the{57}counter, jump and throw{62}"
					; 0xE2FE: PRINT	MSG 0x034B, MSGBOX CLEARED, END: "{5B}:	It may be a little difficult,{57}but you'll get the hang of it!{5E}"
		ScriptID    $345,$2	; Flag clear: Run text script at offset	0x027DA8
					; 0x7C34: LOAD CUSTOM ACTION 0x34 (0x1000000CF CSA_0034), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

CS_001B_1:				; CODE XREF: ROM:00026812j
		rts
; ---------------------------------------------------------------------------

CS_00CD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $348,$1	; Run text script at offset 0x027DAE
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0xE2FF: PRINT	MSG 0x034C, MSGBOX CLEARED, END: "{5B}:	Ba-pa-da-da, dee-da{57}GROW!  Soon you'll reap{57}ba-dee-da-do.....{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $34A,$3	; Run text script at offset 0x027DB2
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0xE300: PRINT	MSG 0x034D, MSGBOX CLEARED, END: "{5B}:	Mom likes to sing!{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $34C,$5	; Run text script at offset 0x027DB6
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0x8301: PRINT	MSG 0x034E: "{5B}: Weigh anchors, weigh, yo-ho,{57}Waves breaking, weigh yo-ho{57}Hey-hey!  I'll teach mom{62}"
					; 0xE302: PRINT	MSG 0x034F, MSGBOX CLEARED, END: "{5B}:	a new song!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $34F,$1	; Run text script at offset 0x027DBC
					; 0xE303: PRINT	MSG 0x0350, MSGBOX CLEARED, END: "{5B}:	I don't know who's been{57}teaching him, but my son{57}likes to sing strange songs...{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $350,$3	; Run text script at offset 0x027DBE
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0xE304: PRINT	MSG 0x0351, MSGBOX CLEARED, END: "{5B}:	Ba-pa-da-da, dee-da{57}GROW!  Soon you'll reap{57}ba-dee-da-do......I like it!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CF:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $352,$1	; Run text script at offset 0x027DC2
					; 0xE305: PRINT	MSG 0x0352, MSGBOX CLEARED, END: "{5B}:	I'm a guard at the castle,{57}but I'm off duty today!{57}I'm going to Greenpea's!{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $353,$3	; Run text script at offset 0x027DC4
					; 0xE306: PRINT	MSG 0x0353, MSGBOX CLEARED, END: "{5B}:	It's said that the{57}underground monsters are much{57}more cunning than us!{5E}"
					;
		dc.w $16		; Params 00, 16
		ScriptID    $354,$5	; Run text script at offset 0x027DC6
					; 0xE307: PRINT	MSG 0x0354, MSGBOX CLEARED, END: "{5B}:	We wish	you good luck!{57}While	you're at it{59}...{59}...can you{57}get the taxes lowered?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D0:
		move.w	#$1B,d0
		bsr.w	TestFlagBit
		beq.s	CS_00D0_2
		move.w	#$F,d0
		bsr.w	TestFlagBit
		bne.s	CS_00D0_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $673,$0	; Run text script at offset 0x028404
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0x8584: PRINT	MSG 0x05D1: "{5B}: Collecting jars is his hobby.{57}Scattering jars and	making{57}somebody put them back{62}"
					; 0xE585: PRINT	MSG 0x05D2, MSGBOX CLEARED, END: "{5B}:	is my hobby.{5E}"
; ---------------------------------------------------------------------------
		bra.s	CS_00D0_1
; ---------------------------------------------------------------------------

CS_00D0_0:				; CODE XREF: ROM:00026864j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $671,$0	; Run text script at offset 0x028400
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0xE583: PRINT	MSG 0x05D0, MSGBOX CLEARED, END: "{5B}:	Please help me again.{5E}"
; ---------------------------------------------------------------------------

CS_00D0_1:				; CODE XREF: ROM:0002686Aj
		bra.s	CS_00D0_4
; ---------------------------------------------------------------------------

CS_00D0_2:				; CODE XREF: ROM:0002685Aj
		move.w	#$1A,d0
		bsr.w	TestFlagBit
		bne.s	CS_00D0_3
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $355,$0	; Run text script at offset 0x027DC8
					; 0x7C38: LOAD CUSTOM ACTION 0x38 (0x1000000DF CSA_0038), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	CS_00D0_4
; ---------------------------------------------------------------------------

CS_00D0_3:				; CODE XREF: ROM:0002687Aj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $676,$0	; Run text script at offset 0x02840A
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0xE586: PRINT	MSG 0x05D3, MSGBOX CLEARED, END: "{5B}:	I have a bad back.{57}Those jars are just{57}too heavy for me...{5E}"
; ---------------------------------------------------------------------------

CS_00D0_4:				; CODE XREF: ROM:CS_00D0_1j
					; ROM:00026880j
		rts
; ---------------------------------------------------------------------------

CS_00D1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $356,$1	; Run text script at offset 0x027DCA
					; 0x8308: PRINT	MSG 0x0355: "{5B}: I used to work at{57}the castle in my younger days.{62}"
					; 0x8309: PRINT	MSG 0x0356: "{5B}: We almost never get invited{57}to the castle.  But I	carry{57}with me the memory{62}"
					; 0xE30A: PRINT	MSG 0x0357, MSGBOX CLEARED, END: "{5B}:	of its elegance...{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $359,$3	; Run text script at offset 0x027DD0
					; 0xE30B: PRINT	MSG 0x0358, MSGBOX CLEARED, END: "{5B}:	The ship arrived from the{57}continent!	 Let's go to the{57}monthly market!{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $35A,$5	; Run text script at offset 0x027DD2
					; 0x830C: PRINT	MSG 0x0359: "{5B}: Y'know, the rumor must be{57}true.  When my husband went{57}to Ryuma, he saw a young man{62}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0x830D: PRINT	MSG 0x035A: "{5B}: casting the {5F} away.{57}It	was the	lighthouse keeper's{57}apprentice.  He questioned{62}"
					; 0x830E: PRINT	MSG 0x035B: "{5B}: the boy and found that{57}Duke Mercator duped him into{57}stealing the Sun Stone!{62}"
					; 0x830F: PRINT	MSG 0x035C: "{5B}: On hearing that, my husband{57}came back in a hurry,	but{57}the duke	had already gone...{5E}"
					; 0xE310: PRINT	MSG 0x035D, MSGBOX CLEARED, END: "{5B}:	The interrogation is still{57}going on upstairs.{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $35F,$7	; Run text script at offset 0x027DDC
					; 0xE310: PRINT	MSG 0x035D, MSGBOX CLEARED, END: "{5B}:	The interrogation is still{57}going on upstairs.{5E}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $360,$9	; Run text script at offset 0x027DDE
					; 0x8311: PRINT	MSG 0x035E: "{5B}: They're still upstairs,{57}trying to set that young man{57}straight.  We have to prepare{62}"
					; 0xE312: PRINT	MSG 0x035F, MSGBOX CLEARED, END: "{5B}:	for the	future.....{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $362,$B	; Run text script at offset 0x027DE2
					; 0xE313: PRINT	MSG 0x0360, MSGBOX CLEARED, END: "{5B}:	Remember the lighthouse{57}apprentice?	He's working{57}under General Arthur, now!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D2:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $363,$1	; Run text script at offset 0x027DE4
					; 0x8314: PRINT	MSG 0x0361: "{5B}: My friend works at the{57}castle, see,  and he says{57}there's a labyrinth in the{62}"
					; 0xE315: PRINT	MSG 0x0362, MSGBOX CLEARED, END: "{5B}:	basement.  And that's not all!{57}It's fulla creepy monsters,{57}too!  Yuckk!  Disgusting!{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $365,$3	; Run text script at offset 0x027DE8
					; 0x8316: PRINT	MSG 0x0363: "{5B}: My friend also said that{57}rogues and criminals are{57}being held prisoner in the{62}"
					; 0xE317: PRINT	MSG 0x0364, MSGBOX CLEARED, END: "{5B}:	castle's underground prisons!!{57}Whaddaya think of that?!{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $367,$5	; Run text script at offset 0x027DEC
					; 0x8318: PRINT	MSG 0x0365: "{5B}: Pop and the others are{57}upstairs grilling the{57}apprentice.  He's the one who{62}"
					; 0xE319: PRINT	MSG 0x0366, MSGBOX CLEARED, END: "{5B}:	broke into the lighthouse.{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $369,$7	; Run text script at offset 0x027DF0
					; 0xE31A: PRINT	MSG 0x0367, MSGBOX CLEARED, END: "{5B}:	Yeah, they're still upstairs.{57}I think he's had enough.....{5E}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $36A,$9	; Run text script at offset 0x027DF2
					; 0xE31B: PRINT	MSG 0x0368, MSGBOX CLEARED, END: "{5B}:	Somebody must take over{57}at the castle to keep order{57}in this town!{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $36B,$B	; Run text script at offset 0x027DF4
					; 0xE31C: PRINT	MSG 0x0369, MSGBOX CLEARED, END: "{5B}:	My dad and his friends{57}are upstairs discussing{57}the new casino.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001C:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $36C,$0	; Run text script at offset 0x027DF6
					; 0xE31D: PRINT	MSG 0x036A, MSGBOX CLEARED, END: "{5B}:	A traditional town,{57}Mercator.  You have to behave{57}properly here.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00D3:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $36D,$0	; Run text script at offset 0x027DF8
					; 0xE31E: PRINT	MSG 0x036B, MSGBOX CLEARED, END: "{5B}:	I hope the evil	magician{57}is defeated	soon...and{57}our taxes	get lowered.....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00D4:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $36E,$0	; Run text script at offset 0x027DFA
					; 0x831F: PRINT	MSG 0x036C: "{5B}: Duke	Mercator is a kind{57}and friendly man.	 He came{57}downtown the other day and{62}"
					; 0xE320: PRINT	MSG 0x036D, MSGBOX CLEARED, END: "{5B}:	spoke to each of us in{57}person.  I was{57}deeply impressed.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00D5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $370,$1	; Run text script at offset 0x027DFE
					; 0xE321: PRINT	MSG 0x036E, MSGBOX CLEARED, END: "{5B}:	Duke Mercator is{57}WONderful!	He looks so{57}gentle, mild, and refined.{5E}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $371,$3	; Run text script at offset 0x027E00
					; 0x8322: PRINT	MSG 0x036F: "{5B}: Duke	Mercator is{57}WONderful!  He looks so{57}gentle, mild,	and refined.{62}"
					; 0xE323: PRINT	MSG 0x0370, MSGBOX CLEARED, END: "{5B}:	Hello, sir!{57}Don't you look nice.....{5E}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $370,$5	; Run text script at offset 0x027DFE
					; 0xE321: PRINT	MSG 0x036E, MSGBOX CLEARED, END: "{5B}:	Duke Mercator is{57}WONderful!	He looks so{57}gentle, mild, and refined.{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $373,$7	; Run text script at offset 0x027E04
					; 0xE324: PRINT	MSG 0x0371, MSGBOX CLEARED, END: "{5B}:	Well?  How was it?{57}You saw Duke Mercator, right?{57}I envy you!{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $374,$9	; Run text script at offset 0x027E06
					; 0xE325: PRINT	MSG 0x0372, MSGBOX CLEARED, END: "{5B}:	Well?  How'd it go?{57}You saw Mir, right?  Was he{57}as strong as they say?{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $375,$B	; Run text script at offset 0x027E08
					; 0x8326: PRINT	MSG 0x0373: "{5B}: What?  Duke Mercator	was{57}really a	wicked man?...Oh,{57}I saw him going to	port{62}"
					; 0xE327: PRINT	MSG 0x0374, MSGBOX CLEARED, END: "{5B}:	with his soldiers{57}just a little while ago...{57}What's going on?{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $377,$D	; Run text script at offset 0x027E0C
					; 0xE328: PRINT	MSG 0x0375, MSGBOX CLEARED, END: "{5B}:	The duke was really one	of{57}the bad guys?  I should have{57}listened to you before.....{57}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $378,$F	; Run text script at offset 0x027E0E
					; 0x8329: PRINT	MSG 0x0376: "{5B}: We're getting used to{57}life without Duke Mercator.{57}What on earth could he be{62}"
					; 0xE32A: PRINT	MSG 0x0377, MSGBOX CLEARED, END: "{5B}:	doing now?  What?  He's{57}still looking for the{57}treasures?  Hmmm.....!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $37A,$1	; Run text script at offset 0x027E12
					; 0xE32B: PRINT	MSG 0x0378, MSGBOX CLEARED, END: "{5B}:	This fortuneteller is famous{57}around here.  She can cast an{57}awesome spell on us!{5E}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $37B,$3	; Run text script at offset 0x027E14
					; 0x832C: PRINT	MSG 0x0379: "{5B}: Heh heh...I know, I know.{57}You asked her to cast a	spell{57}upon you, didn't you?{62}"
					; 0xE32D: PRINT	MSG 0x037A, MSGBOX CLEARED, END: "{5B}:	Well, go ahead!	 Madame{57}Yard's is just across the way.{5E}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $37A,$5	; Run text script at offset 0x027E12
					; 0xE32B: PRINT	MSG 0x0378, MSGBOX CLEARED, END: "{5B}:	This fortuneteller is famous{57}around here.  She can cast an{57}awesome spell on us!{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $37D,$7	; Run text script at offset 0x027E18
					; 0xE32E: PRINT	MSG 0x037B, MSGBOX CLEARED, END: "{5B}:	Her sorcery is so famous that{57}many people come all the way{57}from the mainland to see her.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $37E,$1	; Run text script at offset 0x027E1A
					; 0xE32F: PRINT	MSG 0x037C, MSGBOX CLEARED, END: "{5B}:	How come a doghouse occupies{57}the best place in the town?{57}I just don't understand!{5E}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $37F,$3	; Run text script at offset 0x027E1C
					; 0xE330: PRINT	MSG 0x037D, MSGBOX CLEARED, END: "{5B}:	Well, I	want to	buy this{57}estate, but...is this dog{57}going to sell,	or what?{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $380,$5	; Run text script at offset 0x027E1E
					; 0xE331: PRINT	MSG 0x037E, MSGBOX CLEARED, END: "{5B}:	Who actually owns this{57}estate, anyway?...{57}Duke Mercator, perhaps?.....{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $381,$7	; Run text script at offset 0x027E20
					; 0xE332: PRINT	MSG 0x037F, MSGBOX CLEARED, END: "{5B}:	Did you	know the duke{57}has fled?  Where will we be{57}without	him?{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $382,$9	; Run text script at offset 0x027E22
					; 0x8333: PRINT	MSG 0x0380: "{5B}: See the sign?{62}"
					; 0xE334: PRINT	MSG 0x0381, MSGBOX CLEARED, END: "{5B}:	Now's my chance...{57}I've got the best plot of land{57}in all of Mercator!{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $384,$B	; Run text script at offset 0x027E26
					; 0xE335: PRINT	MSG 0x0382, MSGBOX CLEARED, END: "{5B}:	Rats!  I've got the land,{57}but...now I have no money{57}to build a house on it!.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $385,$1	; Run text script at offset 0x027E28
					; 0xE336: PRINT	MSG 0x0383, MSGBOX CLEARED, END: "{5B}:	Mercator Harbor	is to the{57}south.  We	have a regular{57}liner	from the continent.{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $386,$3	; Run text script at offset 0x027E2A
					; 0xE337: PRINT	MSG 0x0384, MSGBOX CLEARED, END: "{5B}:	Our supply of goods will{57}flourish when the ship{57}arrives.{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $387,$5	; Run text script at offset 0x027E2C
					; 0xE338: PRINT	MSG 0x0385, MSGBOX CLEARED, END: "{5B}:	Good heavens!  The ship{57}can't leave because of the{57}trouble with the lighthouse!{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $388,$7	; Run text script at offset 0x027E2E
					; 0x8339: PRINT	MSG 0x0386: "{5B}: Good	heavens!  The ship{57}can't leave because of the{57}trouble with the lighthouse!{62}"
					; 0xE33A: PRINT	MSG 0x0387, MSGBOX CLEARED, END: "{5B}:	Good heavens, the.....oh!{57}You fixed it?{57}Great!{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $38A,$9	; Run text script at offset 0x027E32
					; 0xE33B: PRINT	MSG 0x0388, MSGBOX CLEARED, END: "{5B}:	Did you	hear about the new{57}casino that opened recently?{57}It's an exciting place!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D9:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $38B,$0	; Run text script at offset 0x027E34
					; 0xE33C: PRINT	MSG 0x0389, MSGBOX CLEARED, END: "{5B}:	I often	watch the officers{57}of the castle go in and out.{57}What do they do inside...?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00DA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $38C,$1	; Run text script at offset 0x027E36
					; 0xE33D: PRINT	MSG 0x038A, MSGBOX CLEARED, END: "{5B}:	When I grow up,	I'll be a{57}member of the Royal Guard{57}and serve Duke Mercator.{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $38D,$3	; Run text script at offset 0x027E38
					; 0xE33E: PRINT	MSG 0x038B, MSGBOX CLEARED, END: "{5B}:	Are you	really going{57}to the Tower of	Mir?  Are you{57}tired of living, or what?!!{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $38E,$5	; Run text script at offset 0x027E3A
					; 0xE33F: PRINT	MSG 0x038C, MSGBOX CLEARED, END: "{5B}:	Welcome	back!{57}We thought you	were dead!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00DB:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $38F,$0	; Run text script at offset 0x027E3C
					; 0xE340: PRINT	MSG 0x038D, MSGBOX CLEARED, END: "{5B}:	I'm watching for invaders{57}from the tower.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00DC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $390,$1	; Run text script at offset 0x027E3E
					; 0xE341: PRINT	MSG 0x038E, MSGBOX CLEARED, END: "{5B}:	Bow-wow!  Bow-wow!{5E}"
					;
		dc.w $19		; Params 00, 19
		ScriptID    $391,$3	; Run text script at offset 0x027E40
					; 0xE342: PRINT	MSG 0x038F, MSGBOX CLEARED, END: "{5B}:	I didn't mean to take{57}the best spot in town!.....{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_001D_0,$1 ; Jump	to address 0x026994
					;
		dc.w $C			; Params 00, 0C
		ScriptID    $394,$3	; Run text script at offset 0x027E46
					; 0xE344: PRINT	MSG 0x0391, MSGBOX CLEARED, END: "{5B}:	Mom's work is almost{57}over for the day.{5E}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $395,$5	; Run text script at offset 0x027E48
					; 0xE345: PRINT	MSG 0x0392, MSGBOX CLEARED, END: "{5B}:	Madame Yard is my mom.{57}She'll be closing up for the{57}day, soon.  I bet she's tired!{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $396,$7	; Run text script at offset 0x027E4A
					; 0x8346: PRINT	MSG 0x0393: "{5B}: Mom and I are going to the{57}continent to open up a	new{57}franchise.  Please stop by!{62}"
					; 0xE347: PRINT	MSG 0x0394, MSGBOX CLEARED, END: "{5B}:	What?  Oh, you can{57}see what our business is{57}when you come!{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $398,$9	; Run text script at offset 0x027E4E
					; 0xE348: PRINT	MSG 0x0395, MSGBOX CLEARED, END: "{5B}:	Please fix the lighthouse{57}for my mom	and me!{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $399,$B	; Run text script at offset 0x027E50
					; 0xE349: PRINT	MSG 0x0396, MSGBOX CLEARED, END: "{5B}:	I've never been to the{57}continent before.  I was born{57}and raised on this island.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001D_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $2A		; Bit 2	of flag	0x005
		ScriptID    $393,$1	; Flag set:   Run text script at offset	0x027E44
					; 0xE343: PRINT	MSG 0x0390, MSGBOX CLEARED, END: "{5B}:	I can tell you're a{57}real ladykiller...{5E}"
		ScriptID    $392,$2	; Flag clear: Run text script at offset	0x027E42
					; 0x7C2F: LOAD CUSTOM ACTION 0x2F (0x1000000BB CSA_002F), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00DD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $39A,$1	; Run text script at offset 0x027E52
					; 0x834A: PRINT	MSG 0x0397: "{5B}: I was robbed!{57}That Greenpea's...{57}Absolutely robbed!{62}"
					; 0xE34B: PRINT	MSG 0x0398, MSGBOX CLEARED, END: "{5B}:	I'm a corpse!  My wife'll kill{57}me!  How'm I gonna...I know!{57}I'll say I lost my wallet.....{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $39C,$3	; Run text script at offset 0x027E56
					; 0xE34C: PRINT	MSG 0x0399, MSGBOX CLEARED, END: "{5B}:	I want to enjoy	life{57}once again!  I'll ask her to{57}cast a spell on me!{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $39D,$5	; Run text script at offset 0x027E58
					; 0xE34D: PRINT	MSG 0x039A, MSGBOX CLEARED, END: "{5B}:	I'm young!{57}I'm young again!{57}Hurray!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00DE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $39E,$1	; Run text script at offset 0x027E5A
					; 0xE34E: PRINT	MSG 0x039B, MSGBOX CLEARED, END: "{5B}:	Oh, Fahl my love,{57}When will you see me?{57}I'm always thinking of you.{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $39F,$3	; Run text script at offset 0x027E5C
					; 0xE34F: PRINT	MSG 0x039C, MSGBOX CLEARED, END: "{5B}:	See?  See!{57}What is that girl	doing in{57}his	room!  I can't stand it!{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $3A0,$5	; Run text script at offset 0x027E5E
					; 0x8350: PRINT	MSG 0x039D: "{5B}: Hear	that?  Fahl has	been{57}talking	with that girl{57}all night long...!{62}"
					; 0xE351: PRINT	MSG 0x039E, MSGBOX CLEARED, END: "{5B}:	I'm getting jealous...!{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $3A2,$7	; Run text script at offset 0x027E62
					; 0xE352: PRINT	MSG 0x039F, MSGBOX CLEARED, END: "{5B}:	I think	it's time I{57}gave him up...{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00DF:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3A3,$0	; Run text script at offset 0x027E64
					; 0x8353: PRINT	MSG 0x03A0: "{5B}: Mr. Fahl has	many fans.{57}I'll admit he's strong and{57}tough, but......{62}"
					; 0xE354: PRINT	MSG 0x03A1, MSGBOX CLEARED, END: "{5B}:	he's so old!  Why do{57}the girls all go for him?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $3A5,$1	; Run text script at offset 0x027E68
					; 0xE355: PRINT	MSG 0x03A2, MSGBOX CLEARED, END: "{5B}:	I'm not sure when the{57}next ship comes.....{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $3A6,$3	; Run text script at offset 0x027E6A
					; 0xE356: PRINT	MSG 0x03A3, MSGBOX CLEARED, END: "{5B}:	I just heard some horrible{57}screams....are my	ears{57}playing	tricks on me?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $3A7,$1	; Run text script at offset 0x027E6C
					; 0x8357: PRINT	MSG 0x03A4: "{5B}: To tell the truth,{57}I'm a soldier from the castle.{57}It's my duty to stand guard{62}"
					; 0xE358: PRINT	MSG 0x03A5, MSGBOX CLEARED, END: "{5B}:	here in	disguise.{57}I'm proud of this job!{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $3A9,$3	; Run text script at offset 0x027E70
					; 0xE359: PRINT	MSG 0x03A6, MSGBOX CLEARED, END: "{5B}:	You're going to the{57}tower too?{57}How bold you guys are!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E2:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $3AA,$1	; Run text script at offset 0x027E72
					; 0x835A: PRINT	MSG 0x03A7: "{5B}: I don't know why, but{57}chills run up and down my{57}spine every time I'm{62}"
					; 0xE35B: PRINT	MSG 0x03A8, MSGBOX CLEARED, END: "{5B}:	near this place....Brrr!{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $3AC,$3	; Run text script at offset 0x027E76
					; 0xE35C: PRINT	MSG 0x03A9, MSGBOX CLEARED, END: "{5B}:	Zak and	Dexter?{57}They	went down to the{57}crypt some time ago.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E3:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3AD,$0	; Run text script at offset 0x027E78
					; 0x835D: PRINT	MSG 0x03AA: "{5B}: Hi!	You're another{57}treasure hunter, aren't you?{57}We seem to get a lot of them{62}"
					; 0xE35E: PRINT	MSG 0x03AB, MSGBOX CLEARED, END: "{5B}:	here lately.....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E4:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3AF,$0	; Run text script at offset 0x027E7C
					; 0xE35F: PRINT	MSG 0x03AC, MSGBOX CLEARED, END: "{5B}:	Wh...Who are you!{57}I'm busy.  Dont bother me!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_00E5_0,$1 ; Jump	to address 0x026A22
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $3B2,$3	; Run text script at offset 0x027E82
					; 0xE361: PRINT	MSG 0x03AE, MSGBOX CLEARED, END: "{5B}:	Mr. Nigel!  General Arthur{57}told us to let you go in.{57}Please go ahead.{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $3B3,$5	; Run text script at offset 0x027E84
					; 0xE362: PRINT	MSG 0x03AF, MSGBOX CLEARED, END: "{5B}:	I'd like to come along and{57}help, but standing here is{57}an important duty!{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptJump  CS_00E5_1,$7 ; Jump	to address 0x026A2E
					;
		dc.w $18		; Params 00, 18
		ScriptID    $3B7,$9	; Run text script at offset 0x027E8C
					; 0xE364: PRINT	MSG 0x03B1, MSGBOX CLEARED, END: "{5B}:	Standing here like this{57}has been my dream!{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $3B8,$B	; Run text script at offset 0x027E8E
					; 0xE365: PRINT	MSG 0x03B2, MSGBOX CLEARED, END: "{5B}:	Welcome	to the castle{57}of Arthur!  Anybody can go{57}through this gate!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E5_0:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3B0,$0	; Run text script at offset 0x027E7E
					; 0x14C8: SET BIT 0 OF FLAG 0x019
					; 0xE360: PRINT	MSG 0x03AD, MSGBOX CLEARED, END: "{5B}:	This is	the castle of{57}Mercator.{57}I	cannot allow you inside.{5E}"
; ---------------------------------------------------------------------------

loc_26A26:				; CODE XREF: ROM:00026A5Cj
		move.w	#$C6,d0	; '�'
		bra.w	loc_26568
; ---------------------------------------------------------------------------

CS_00E5_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DC		; Bit 4	of flag	0x01B
		ScriptID    $3B4,$1	; Flag clear: Run text script at offset	0x027E86
					; 0x7CEF: LOAD CUSTOM ACTION 0xEF (0x1000003BB CSA_00EF), MSGBOX CLEARED, END
		ScriptID    $3B6,$2	; Flag set:   Run text script at offset	0x027E8A
					; 0xE363: PRINT	MSG 0x03B0, MSGBOX CLEARED, END: "{5B}:	Company--salute!{57}Do come in!	 Duke Mercator{57}is waiting for you!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_00E6_0,$1 ; Jump	to address 0x026A58
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $3BC,$3	; Run text script at offset 0x027E96
					; 0xE368: PRINT	MSG 0x03B5, MSGBOX CLEARED, END: "{5B}:	Are you	Nigel?	Hmmm...{57}...younger than I thought...{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $3BD,$5	; Run text script at offset 0x027E98
					; 0x8369: PRINT	MSG 0x03B6: "{5B}: Going off to	defeat Mir, eh?{57}Hope	your mama's got{57}something black to wear!{62}"
					; 0xE36A: PRINT	MSG 0x03B7, MSGBOX CLEARED, END: "{5B}:	Hahahahaha!!{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptJump  CS_00E6_1,$7 ; Jump	to address 0x026A5E
					;
		dc.w $18		; Params 00, 18
		ScriptID    $3C0,$9	; Run text script at offset 0x027E9E
					; 0xE36C: PRINT	MSG 0x03B9, MSGBOX CLEARED, END: "{5B}:	You!  Halt!{57}...Heh heh, just	kidding!{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $3C1,$B	; Run text script at offset 0x027EA0
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0xE36D: PRINT	MSG 0x03BA, MSGBOX CLEARED, END: "{5B}:	We are the first{57}kid-gatekeepers of{57}this castle.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E6_0:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3B9,$0	; Run text script at offset 0x027E90
					; 0x14C8: SET BIT 0 OF FLAG 0x019
					; 0x8366: PRINT	MSG 0x03B3: "{5B}: You have not	been invited{57}by Duke	Mercator, have you?{62}"
					; 0xE367: PRINT	MSG 0x03B4, MSGBOX CLEARED, END: "{5B}:	This is	not a place for{57}dirty little	kids like you!{57}Get out of here!{5E}"
; ---------------------------------------------------------------------------
		bra.s	loc_26A26
; ---------------------------------------------------------------------------

CS_00E6_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DC		; Bit 4	of flag	0x01B
		ScriptID    $3B4,$1	; Flag clear: Run text script at offset	0x027E86
					; 0x7CEF: LOAD CUSTOM ACTION 0xEF (0x1000003BB CSA_00EF), MSGBOX CLEARED, END
		ScriptID    $3BF,$2	; Flag set:   Run text script at offset	0x027E9C
					; 0xE36B: PRINT	MSG 0x03B8, MSGBOX CLEARED, END: "{5B}:	Nigel!	You're alive!! I'm{57}impressed!  Duke Mercator will{57}praise you for your boldness!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E7:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3C3,$0	; Run text script at offset 0x027EA4
					; 0xE36E: PRINT	MSG 0x03BB, MSGBOX CLEARED, END: "{5B}:	Co-cock-o-o-oooo...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E8:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $28		; Bit 0	of flag	0x005
		ScriptID    $3C5,$1	; Flag set:   Run text script at offset	0x027EA8
					; 0xE36F: PRINT	MSG 0x03BC, MSGBOX CLEARED, END: "{5B}:	Why do men act like fools{57}when they fall in love?!{5E}"
		ScriptID    $3C4,$2	; Flag clear: Run text script at offset	0x027EA6
					; 0x7C29: LOAD CUSTOM ACTION 0x29 (0x1000000A3 CSA_0029), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptJump  CS_001E_0,$1 ; Jump	to address 0x026A9A
					;
		dc.w $12		; Params 00, 12
		ScriptID    $495,$3	; Run text script at offset 0x028048
					; 0x8431: PRINT	MSG 0x047E: "{5B}: I think the party{57}is ready now.{62}"
					; 0xE432: PRINT	MSG 0x047F, MSGBOX CLEARED, END: "{5B}:	Why dost thou not go{57}to the banquet room?{5E}"
					;
		dc.w $13		; Params 00, 13
		ScriptJump  CS_001E_2,$5 ; Jump	to address 0x026AB2
					;
		dc.w $14		; Params 00, 14
		ScriptJump  CS_001E_3,$7 ; Jump	to address 0x026ABE
					;
		dc.w $18		; Params 00, 18
		ScriptJump  CS_001E_4,$9 ; Jump	to address 0x026ACA
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  CS_001E_5,$B ; Jump	to address 0x026AD6
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001E_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CE		; Bit 6	of flag	0x019
		ScriptID    $492,$1	; Flag clear: Run text script at offset	0x028042
					; 0x7C51: LOAD CUSTOM ACTION 0x51 (0x100000143 CSA_0051), MSGBOX CLEARED, END
		ScriptJump  CS_001E_1,$2 ; Flag	set:   Jump to address 0x026AA6
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $DB		; Bit 3	of flag	0x01B
		ScriptID    $494,$1	; Flag set:   Run text script at offset	0x028046
					; 0x1493: SET BIT 3 OF FLAG 0x012
					; 0x8431: PRINT	MSG 0x047E: "{5B}: I think the party{57}is ready now.{62}"
					; 0xE432: PRINT	MSG 0x047F, MSGBOX CLEARED, END: "{5B}:	Why dost thou not go{57}to the banquet room?{5E}"
		ScriptID    $493,$2	; Flag clear: Run text script at offset	0x028044
					; 0xE430: PRINT	MSG 0x047D, MSGBOX CLEARED, END: "{5B}:	Sir Nigel, welcome to{57}the castle.  Enjoy thy	stay!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_2:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CF		; Bit 7	of flag	0x019
		ScriptID    $497,$1	; Flag clear: Run text script at offset	0x02804C
					; 0x8433: PRINT	MSG 0x0480: "{5B}: Art thou really going to{57}the tower?  'Tis a very{57}dangerous place!{62}"
					; 0x8434: PRINT	MSG 0x0481: "{5B}: Didst thou know there{57}is a magic barrier at the{57}entrance to the tower?{62}"
					; 0x8435: PRINT	MSG 0x0482: "{5B}: My investigations revealed{57}that an armlet	is necessary{57}to break the barier{62}"
					; 0x8436: PRINT	MSG 0x0483: "{5B}: 'Tis somewhere in the{57}underground crypt next to the{57}church.  I keep sending{62}"
					; 0x8437: PRINT	MSG 0x0484: "{5B}: my best scouts in there,{57}but somehow they	never{57}seem to return...I think{62}"
					; 0xE438: PRINT	MSG 0x0485, MSGBOX CLEARED, END: "{5B}:	there must be traps or{57}some such protecting the{57}armlet.{5E}"
		ScriptID    $49D,$2	; Flag set:   Run text script at offset	0x028058
					; 0xE439: PRINT	MSG 0x0486, MSGBOX CLEARED, END: "{5B}:	Sir Nigel!{57}Get the armlet and{57}defeat Mir for the Duke!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_3:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D1		; Bit 1	of flag	0x01A
		ScriptID    $49E,$1	; Flag clear: Run text script at offset	0x02805A
					; 0x843A: PRINT	MSG 0x0487: "{5B}: Dexter and Zak came through{57}here a little	while ago.  They{57}asked me how to break the{62}"
					; 0x843B: PRINT	MSG 0x0488: "{5B}: barrier, and	left for{57}the	crypt.	Sir Nigel,{57}I	must warn you that{62}"
					; 0x843C: PRINT	MSG 0x0489: "{5B}: the monsters	down there{57}are very intelligent.  Perhaps{57}Mir cast a spell on them.{62}"
					; 0x843D: PRINT	MSG 0x048A: "{5B}: Remember- thou can'st{57}find the armlet if thou dost{57}rely on thy sword alone.{62}"
					; 0xE43E: PRINT	MSG 0x048B, MSGBOX CLEARED, END: "{5B}:	Take care of thyself!{5E}"
		ScriptID    $4A2,$2	; Flag set:   Run text script at offset	0x028062
					; 0xE43E: PRINT	MSG 0x048B, MSGBOX CLEARED, END: "{5B}:	Take care of thyself!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_4:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D5		; Bit 5	of flag	0x01A
		ScriptID    $4A3,$1	; Flag clear: Run text script at offset	0x028064
					; 0x7CB5: LOAD CUSTOM ACTION 0xB5 (0x1000002D3 CSA_00B5), MSGBOX CLEARED, END
		ScriptID    $4A4,$2	; Flag set:   Run text script at offset	0x028066
					; 0xE43F: PRINT	MSG 0x048C, MSGBOX CLEARED, END: "{5B}:	...go...upstairs{57}and... cut the... armor{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_5:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DE		; Bit 6	of flag	0x01B
		ScriptID    $4A5,$1	; Flag clear: Run text script at offset	0x028068
					; 0x8440: PRINT	MSG 0x048D: "{5B}: Nice	to see thee again.{57}As thou dost see,	I'm{57}completely healed now.{62}"
					; 0x8441: PRINT	MSG 0x048E: "{5B}: I'll do my best to make{57}Mercator a good home for its{57}people.{62}"
					; 0x8442: PRINT	MSG 0x048F: "{5B}: I've been thinking about{57}the relationship between{57}politics and the militia for{62}"
					; 0x8443: PRINT	MSG 0x0490: "{5B}: a long time,	now.  Julie{57}and I have often	discussed{57}it, and I'm now convinced that{62}"
					; 0x8444: PRINT	MSG 0x0491: "{5B}: I can make this town{57}prosper without a{57}military force!{62}"
					; 0x8445: PRINT	MSG 0x0492: "{5B}: So, I built a casino	in{57}the town well to help lower{57}the taxes.{62}"
					; 0x8446: PRINT	MSG 0x0493: "{5B}: Please drop by{57}if	thou dost have the time.{62}"
					; 0x0016: LOAD 0x0016 INTO 0xFF1196 (Casino{6A}Ticket)
					; 0x17E8: RECEIVE ITEM [0xFF1196]
					; 0xE447: PRINT	MSG 0x0494, MSGBOX CLEARED, END: "{5B}:	Visit me anytime!{57}Take care of thyself!{5E}"
		ScriptJump  CS_001E_6,$2 ; Flag	set:   Jump to address 0x026AE2
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_6:
		move.w	#ITM_CASINOTICKET,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	CS_001E_7
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4AE,$0	; Run text script at offset 0x02807A
					; 0xE447: PRINT	MSG 0x0494, MSGBOX CLEARED, END: "{5B}:	Visit me anytime!{57}Take care of thyself!{5E}"
; ---------------------------------------------------------------------------
		bra.s	CS_001E_8
; ---------------------------------------------------------------------------

CS_001E_7:				; CODE XREF: ROM:00026AEAj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4AF,$0	; Run text script at offset 0x02807C
					; 0x8448: PRINT	MSG 0x0495: "{5B}: Hello again,	Sir Nigel.{57}Do you want this?{62}"
					; 0x0016: LOAD 0x0016 INTO 0xFF1196 (Casino{6A}Ticket)
					; 0x77E8: RECEIVE ITEM [0xFF1196], MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

CS_001E_8:				; CODE XREF: ROM:00026AF0j
		rts
; ---------------------------------------------------------------------------

CS_00EA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $A			; Params 00, 0A
		ScriptID    $3C6,$1	; Run text script at offset 0x027EAA
					; 0x7C39: LOAD CUSTOM ACTION 0x39 (0x1000000E3 CSA_0039), MSGBOX CLEARED, END
					;
		dc.w $C			; Params 00, 0C
		ScriptID    $689,$3	; Run text script at offset 0x028430
					; 0xE58F: PRINT	MSG 0x05DC, MSGBOX CLEARED, END: "{5B}:	I've never seen such{57}dishonesty in all my life!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $3C7,$1	; Run text script at offset 0x027EAC
					; 0xE370: PRINT	MSG 0x03BD, MSGBOX CLEARED, END: "{5B}:	I made my fortune here,{57}so I'm going back to{57}the continent.{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $3C8,$3	; Run text script at offset 0x027EAE
					; 0xE371: PRINT	MSG 0x03BE, MSGBOX CLEARED, END: "{5B}:	What bad timing!{57}I'm all ready, but the{57}ship can't leave!...{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $3C9,$5	; Run text script at offset 0x027EB0
					; 0xE372: PRINT	MSG 0x03BF, MSGBOX CLEARED, END: "{5B}:	I think	the money I saved{57}here will be enough for me{57}to start my own business.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00EB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $3CA,$1	; Run text script at offset 0x027EB2
					; 0xE373: PRINT	MSG 0x03C0, MSGBOX CLEARED, END: "{5B}:	I love the sea...{57}A brisk, salty breeze{57}makes me happy...{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $3CB,$3	; Run text script at offset 0x027EB4
					; 0x8374: PRINT	MSG 0x03C1: "{5B}: Duke	Mercator boarded the{57}ship with armored soldiers{57}I've never seen before!{62}"
					; 0xE375: PRINT	MSG 0x03C2, MSGBOX CLEARED, END: "{5B}:	After they left,{57}the	lighthouse suddenly{57}went out...{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $3CD,$5	; Run text script at offset 0x027EB8
					; 0x8376: PRINT	MSG 0x03C3: "{5B}: We were all so relieved to{57}see the lighthouse lit	again.{62}"
					; 0xE377: PRINT	MSG 0x03C4, MSGBOX CLEARED, END: "{5B}:	Oh!{57}You found the sunstone?{57}Really?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00EC:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3CF,$0	; Run text script at offset 0x027EBC
					; 0xE378: PRINT	MSG 0x03C5, MSGBOX CLEARED, END: "{5B}:	We can see many{57}unusual things when the ship{57}from	the continent arrives!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00ED:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3D0,$0	; Run text script at offset 0x027EBE
					; 0xE379: PRINT	MSG 0x03C6, MSGBOX CLEARED, END: "{5B}:	Have you seen the{57}princess staying in the{57}castle?	 She's so cute!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00EE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $3D1,$1	; Run text script at offset 0x027EC0
					; 0xE37A: PRINT	MSG 0x03C7, MSGBOX CLEARED, END: "{5B}:	I finished unloading!{57}We'll go on a spree at{57}Greenpea's tonight!{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $3D2,$3	; Run text script at offset 0x027EC2
					; 0xE37B: PRINT	MSG 0x03C8, MSGBOX CLEARED, END: "{5B}:	As long	as the lighthouse{57}is	broken,	the ship cannot{57}leave!{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $3D3,$5	; Run text script at offset 0x027EC4
					; 0x7CD2: LOAD CUSTOM ACTION 0xD2 (0x100000347 CSA_00D2), MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00EF:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $3D4,$1	; Run text script at offset 0x027EC6
					; 0x837C: PRINT	MSG 0x03C9: "{5B}: I come here once a{57}month with imported goods.{57}We sailors rely entirely	on{62}"
					; 0xE37D: PRINT	MSG 0x03CA, MSGBOX CLEARED, END: "{5B}:	the lighthouse of Ryuma{57}because the island is{57}enveloped in a dense fog.{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $3D6,$3	; Run text script at offset 0x027ECA
					; 0xE37E: PRINT	MSG 0x03CB, MSGBOX CLEARED, END: "{5B}:	The lighthouse is{57}out of order!  How	will I{57}steer	my ship!{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $3D7,$5	; Run text script at offset 0x027ECC
					; 0xE37F: PRINT	MSG 0x03CC, MSGBOX CLEARED, END: "{5B}:	The ship for Verla{57}will be leaving port soon!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $3D8,$1	; Run text script at offset 0x027ECE
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0x8380: PRINT	MSG 0x03CD: "{5B}: Weigh anchor, weigh yo-ho!{57}Waves breaking, weigh yo-ho!{57}Hey-ho, let's go!{62}"
					; 0xE381: PRINT	MSG 0x03CE, MSGBOX CLEARED, END: "{5B}:	This is	the new	number{57}one song of the week on{57}the continent now!	 Know it?{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $3DB,$3	; Run text script at offset 0x027ED4
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0x8382: PRINT	MSG 0x03CF: "{5B}: Weigh anchor, weigh yo-ho!{57}We're stuck here, way to go!{57}Hey, yo-ho, let me go!{62}"
					; 0xE383: PRINT	MSG 0x03D0, MSGBOX CLEARED, END: "{5B}:	This is	no time	for singing!{57}The situation's critical!{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $3DE,$5	; Run text script at offset 0x027EDA
					; 0xE384: PRINT	MSG 0x03D1, MSGBOX CLEARED, END: "{5B}:	The taxes here are{57}killing me!  Cut 'em short,{57}I say...end of story!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_00F1_1,$1 ; Jump	to address 0x026B8E
					;
		dc.w $101		; Params 01, 01
		ScriptID    $3DF,$3	; Run text script at offset 0x027EDC
					; 0xE385: PRINT	MSG 0x03D2, MSGBOX CLEARED, END: "{5B}:	Sorry!	This warehouse{57}is for traders only.{5E}"
					;
		dc.w $102		; Params 01, 02
		ScriptJump  CS_00F1_0,$5 ; Jump	to address 0x026B82
					;
		dc.w $103		; Params 01, 03
		ScriptID    $3E2,$7	; Run text script at offset 0x027EE2
					; 0xE387: PRINT	MSG 0x03D4, MSGBOX CLEARED, END: "{5B}:	See you	next month!{57}Have a good day!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F1_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $A5		; Bit 5	of flag	0x014
		ScriptID    $3E1,$1	; Flag set:   Run text script at offset	0x027EE0
					; 0xE386: PRINT	MSG 0x03D3, MSGBOX CLEARED, END: "{5B}:	Do come	in and look around{57}the warehouse!  You're sure{57}to find something you like!{5E}"
		ScriptID    $3E0,$2	; Flag clear: Run text script at offset	0x027EDE
					; 0x7C6D: LOAD CUSTOM ACTION 0x6D (0x1000001B3 CSA_006D), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F1_1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $3E3,$0	; Prompt:	Run text script	at offset 0x027EE4
					; 0xA388: PRINT	MSG 0x03D5, END: "{5B}:	Have you heard about{57}General	Arthur?{58}"
		ScriptID    $3E4,$1	; Answer 'yes': Run text script at offset 0x027EE6
					; 0x8389: PRINT	MSG 0x03D6: "{5B}: He was seriously{57}injured!	 Now he's under{57}strict medical care.{62}"
					; 0xE38A: PRINT	MSG 0x03D7, MSGBOX CLEARED, END: "{5B}:	I think	General	Arthur{57}will make a great ruler!{5E}"
		ScriptID    $3E6,$2	; Answer 'no':  Run text script at offset 0x027EEA
					; 0x838B: PRINT	MSG 0x03D8: "{5B}: He's in charge of the Royal{57}Guard, now.  His main concern{57}is foiling the duke's plans...{62}"
					; 0x838C: PRINT	MSG 0x03D9: "{5B}: He was seriously injured!{57}Now he's under strict{57}medical care.{62}"
					; 0xE38D: PRINT	MSG 0x03DA, MSGBOX CLEARED, END: "{5B}:	I think	General	Arthur{57}will make a great ruler!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F2:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3E9,$0	; Run text script at offset 0x027EF0
					; 0xE38E: PRINT	MSG 0x03DB, MSGBOX CLEARED, END: "{5B}:	Do you think those who{57}buy 100 EkeEke at a time{57}are stupid?  So do I!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F3:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $3F3,$1	; Run text script at offset 0x027F04
					; 0xE396: PRINT	MSG 0x03E3, MSGBOX CLEARED, END: "{5B}:	To get the armlet is{57}to prove oneself worthy{57}to enter the	tower!{5E}"
					;
		dc.w $16		; Params 00, 16
		ScriptID    $3F4,$3	; Run text script at offset 0x027F06
					; 0x8397: PRINT	MSG 0x03E4: "{5B}: Is that the armlet?{57}You really did it?  Gee...!!{57}If you were{62}"
					; 0xE398: PRINT	MSG 0x03E5, MSGBOX CLEARED, END: "{5B}:	strong and smart enough	to{57}get the armlet, Mir should be{57}no problem for you...{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F4:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $A4		; Bit 4	of flag	0x014
		ScriptJump  CS_00F4_0,$1 ; Flag	set:   Jump to address 0x026BBA
		ScriptID    $3EA,$2	; Flag clear: Run text script at offset	0x027EF2
					; 0x7C6A: LOAD CUSTOM ACTION 0x6A (0x1000001A7 CSA_006A), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F4_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $D2		; Bit 2	of flag	0x01A
		ScriptID    $3EC,$1	; Flag set:   Run text script at offset	0x027EF6
					; 0xE390: PRINT	MSG 0x03DD, MSGBOX CLEARED, END: "{5B}:	Greenpea is the	name{57}of the owner here.{5E}"
		ScriptID    $3EB,$2	; Flag clear: Run text script at offset	0x027EF4
					; 0xE38F: PRINT	MSG 0x03DC, MSGBOX CLEARED, END: "{5B}:	Gambling is like a drug!{57}Once you get started, you{57}can never get enough!...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $3ED,$1	; Run text script at offset 0x027EF8
					; 0xE391: PRINT	MSG 0x03DE, MSGBOX CLEARED, END: "{5B}:	I'm the ship's captain.  I'm{57}just like anyone else on land,{57}but on the sea, I'm king!...{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $3EE,$3	; Run text script at offset 0x027EFA
					; 0xE392: PRINT	MSG 0x03DF, MSGBOX CLEARED, END: "{5B}:	When the lighthouse is fixed,{57}I can go back to being	a{57}captain again.{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $3EF,$5	; Run text script at offset 0x027EFC
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0xE393: PRINT	MSG 0x03E0, MSGBOX CLEARED, END: "{5B}:	Ahoy, matey!  Didja hear?{57}The lighthouse is fixed!  I'm{57}a captain again!  Ha ha!!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F6:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3F1,$0	; Run text script at offset 0x027F00
					; 0x8394: PRINT	MSG 0x03E1: "{5B}: This	skeleton killed	many{57}friends	of mine!  This is{57}my	revenge!{62}"
					; 0xE395: PRINT	MSG 0x03E2, MSGBOX CLEARED, END: "{5B}:	If he were out of that cell,{57}I'd be no match for him!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0020:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2E0,$0	; Run text script at offset 0x027CDE
					; 0xE29C: PRINT	MSG 0x02E9, MSGBOX CLEARED, END: "{5B}:	How do you do?	I'm June,{57}Fahl's fair girlfriend.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $3F6,$1	; Run text script at offset 0x027F0A
					; 0xE399: PRINT	MSG 0x03E6, MSGBOX CLEARED, END: "{5B}:	The goods you purchased{57}will	be sent	directly to your{57}shop with the bill.	 Thanks!{5E}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_00F7_0,$3 ; Jump	to address 0x026BF2
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F7_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $D9		; Bit 1	of flag	0x01B
		ScriptID    $8B9,$1	; Flag set:   Run text script at offset	0x028890
					; 0x18F7: LOAD CHARACTER SCRIPT	* (0x00F7)
					; 0x86EE: PRINT	MSG 0x073B: "{5B}: Nigel, are you OK?{57}Are you land lubber?{57}Don't throw up on my{62}"
					; 0xE6EF: PRINT	MSG 0x073C, MSGBOX CLEARED, END: "{5B}:	nice, new deck!{5E}"
		ScriptID    $3F7,$2	; Flag clear: Run text script at offset	0x027F0C
					; 0x7CD1: LOAD CUSTOM ACTION 0xD1 (0x100000343 CSA_00D1), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F8:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3F8,$0	; Run text script at offset 0x027F0E
					; 0xE39A: PRINT	MSG 0x03E7, MSGBOX CLEARED, END: "{5B}:	This is	Duke Mercator's{57}private pier.{57}You can't go in.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $F			; Params 00, 0F
		ScriptID    $3F9,$1	; Run text script at offset 0x027F10
					; 0xE39B: PRINT	MSG 0x03E8, MSGBOX CLEARED, END: "{5B}:	Welcome	to{57}the castle of Mercator!{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptJump  CS_00F9_0,$3 ; Jump	to address 0x026C22
					;
		dc.w $17		; Params 00, 17
		ScriptID    $3FD,$5	; Run text script at offset 0x027F18
					; 0xE39F: PRINT	MSG 0x03EC, MSGBOX CLEARED, END: "{5B}:	Nigel!	Welcome	back!{57}Thank heavens the goddess{57}accepted my prayer!{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptJump  CS_00F9_1,$7 ; Jump	to address 0x026C2E
					;
		dc.w $19		; Params 00, 19
		ScriptID    $401,$9	; Run text script at offset 0x027F20
					; 0xE3A3: PRINT	MSG 0x03F0, MSGBOX CLEARED, END: "{5B}:	All the	other soldiers have{57}gone somewhere with the Duke.{57}I'm the only one remaining...{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $402,$B	; Run text script at offset 0x027F22
					; 0x83A4: PRINT	MSG 0x03F1: "{5B}: I am	not fit	to be a	soldier.{57}I'll assist General Arthur{57}in his duties from now on.{62}"
					; 0xE3A5: PRINT	MSG 0x03F2, MSGBOX CLEARED, END: "{5B}:	Take care of yourself!{62}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F9_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D4		; Bit 4	of flag	0x01A
		ScriptID    $3FA,$1	; Flag clear: Run text script at offset	0x027F12
					; 0x839C: PRINT	MSG 0x03E9: "{5B}: Nigel!  I have great{57}respect for you!{57}You're my ideal!!{62}"
					; 0xE39D: PRINT	MSG 0x03EA, MSGBOX CLEARED, END: "{5B}:	Please,	please come{57}back safe and sound!{57}Good luck...!{5E}"
		ScriptID    $3FC,$2	; Flag set:   Run text script at offset	0x027F16
					; 0xE39E: PRINT	MSG 0x03EB, MSGBOX CLEARED, END: "{5B}:	Please come back{57}safe and sound!{57}I'll pray for you!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F9_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E8		; Bit 0	of flag	0x01D
		ScriptID    $3FE,$1	; Flag clear: Run text script at offset	0x027F1A
					; 0x83A0: PRINT	MSG 0x03ED: "{5B}: Nigel!{57}I thought you were...{57}the Duke and some	strange{62}"
					; 0xE3A1: PRINT	MSG 0x03EE, MSGBOX CLEARED, END: "{5B}:	armored	soldiers suddenly...{5E}"
		ScriptID    $400,$2	; Flag set:   Run text script at offset	0x027F1E
					; 0xE3A2: PRINT	MSG 0x03EF, MSGBOX CLEARED, END: "{5B}:	Terrible...!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00FA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $F			; Params 00, 0F
		ScriptID    $404,$1	; Run text script at offset 0x027F26
					; 0x83A6: PRINT	MSG 0x03F3: "{5B}: Beautiful courtyard,	huh?{57}The gardener must be highly{57}skilled to keep it so nice...{62}"
					; 0xE3A7: PRINT	MSG 0x03F4, MSGBOX CLEARED, END: "{5B}:	Would you like to see him?{57}Surprise!!...it's me,{57}heh, heh, heh...{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $406,$3	; Run text script at offset 0x027F2A
					; 0x83A8: PRINT	MSG 0x03F5: "{5B}: Why did the Orc King{57}cross the road?{62}"
					; 0xE3A9: PRINT	MSG 0x03F6, MSGBOX CLEARED, END: "{5B}:	Because	he wanted to{57}eat the	chicken{57}on the other	side.  Ha!{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $408,$5	; Run text script at offset 0x027F2E
					; 0xE3AA: PRINT	MSG 0x03F7, MSGBOX CLEARED, END: "{5B}:	Now the	taxes will be{57}lowered and I can get{57}a better salary...I hope.{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $409,$7	; Run text script at offset 0x027F30
					; 0x83AB: PRINT	MSG 0x03F8: "{5B}: Strange!{57}Giant monsters like soldiers{57}were following Duke Mercator!{62}"
					; 0xE3AC: PRINT	MSG 0x03F9, MSGBOX CLEARED, END: "{5B}:	How strange!.....{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $40B,$9	; Run text script at offset 0x027F34
					; 0xE3AD: PRINT	MSG 0x03FA, MSGBOX CLEARED, END: "{5B}:	I don't care who owns the{57}castle.  I'll always be the{57}gardener of this courtyard...{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $F			; Params 00, 0F
		ScriptID    $40E,$1	; Run text script at offset 0x027F3A
					; 0xE3B0: PRINT	MSG 0x03FD, MSGBOX CLEARED, END: "{5B}:	Oh, this is the	kitchen	door!{57}A distinguished guest like you{57}should use the front	door....{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $40F,$3	; Run text script at offset 0x027F3C
					; 0x83B1: PRINT	MSG 0x03FE: "{5B}: La-la-la...la-la...{57}Why am I so happy?  Well,{57}when I was cleaning the garden,{62}"
					; 0xE3B2: PRINT	MSG 0x03FF, MSGBOX CLEARED, END: "{5B}:	I saw a	beautiful hair{57}ornament fall	to the ground, a{57}very expensive one!	 Lucky me!{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $411,$5	; Run text script at offset 0x027F40
					; 0xE3B3: PRINT	MSG 0x0400, MSGBOX CLEARED, END: "{5B}:	This door is not fit for{57}a hero!  Would you please{57}use the front door?{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $412,$7	; Run text script at offset 0x027F42
					; 0x83B4: PRINT	MSG 0x0401: "{5B}: Strange armored soldiers{57}suddenly	rushed into the{57}castle!  General Arthur is{62}"
					; 0xE3B5: PRINT	MSG 0x0402, MSGBOX CLEARED, END: "{5B}:	fighting against them alone!{57}Please save him!  HURRY!!{5E}"
					;
		dc.w $19		; Params 00, 19
		ScriptID    $414,$9	; Run text script at offset 0x027F46
					; 0xE3B6: PRINT	MSG 0x0403, MSGBOX CLEARED, END: "{5B}:	Where has the Duke gone?{57}What is he going to	do?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $415,$1	; Run text script at offset 0x027F48
					; 0xE3B7: PRINT	MSG 0x0404, MSGBOX CLEARED, END: "{5B}:	The party will be{57}ready soon.  Please feel free{57}to look around the castle.{5E}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $416,$3	; Run text script at offset 0x027F4A
					; 0xE3B8: PRINT	MSG 0x0405, MSGBOX CLEARED, END: "{5B}:	Mr. Nigel, the party is	ready.{57}It's being held in the banquet{57}room on the second floor.{5E}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $417,$5	; Run text script at offset 0x027F4C
					; 0x83B9: PRINT	MSG 0x0406: "{5B}: You can't go out now{57}It's getting dark.{62}"
					; 0xE3BA: PRINT	MSG 0x0407, MSGBOX CLEARED, END: "{5B}:	It's for your safety.{57}Please take a rest in your{57}room for the night.{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $419,$7	; Run text script at offset 0x027F50
					; 0xE3BB: PRINT	MSG 0x0408, MSGBOX CLEARED, END: "{5B}:	Mir is a plague	to the duke{57}and the town.  Please defeat{57}him for us!{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $41A,$9	; Run text script at offset 0x027F52
					; 0xE3BC: PRINT	MSG 0x0409, MSGBOX CLEARED, END: "{5B}:	I'm glad to see you again!{57}Please go up and see the Duke.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $41B,$1	; Run text script at offset 0x027F54
					; 0xE3BD: PRINT	MSG 0x040A, MSGBOX CLEARED, END: "{5B}:	You cannot go out today.{5E}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $41C,$3	; Run text script at offset 0x027F56
					; 0xE3BE: PRINT	MSG 0x040B, MSGBOX CLEARED, END: "{5B}:	Everything is ready!{57}Would you go on	up{57}to the banquet room?{5E}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $41D,$5	; Run text script at offset 0x027F58
					; 0xE3BF: PRINT	MSG 0x040C, MSGBOX CLEARED, END: "{5B}:	You can't go out today.{57}Please rest quietly in{57}your room.{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $41E,$7	; Run text script at offset 0x027F5A
					; 0xE3C0: PRINT	MSG 0x040D, MSGBOX CLEARED, END: "{5B}:	We're counting on you{57}to return safe and sound!{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $41F,$9	; Run text script at offset 0x027F5C
					; 0xE3C1: PRINT	MSG 0x040E, MSGBOX CLEARED, END: "{5B}:	Duke Mercator is{57}waiting for	you!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $420,$1	; Run text script at offset 0x027F5E
					; 0xE3C2: PRINT	MSG 0x040F, MSGBOX CLEARED, END: "{5B}:	Training rooms for{57}the soldiers from	here.{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptJump  CS_00FE_0,$3 ; Jump	to address 0x026CB0
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FE_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $A1		; Bit 1	of flag	0x014
		ScriptID    $421,$1	; Flag set:   Run text script at offset	0x027F60
					; 0x83C3: PRINT	MSG 0x0410: "{5B}: Excuse us, sir!{57}The new employees	often{57}behave	rudely to the guests...{62}"
					; 0xE3C4: PRINT	MSG 0x0411, MSGBOX CLEARED, END: "{5B}:	I must humbly apologize{57}on their behalf.....please{57}forgive us.{5E}"
		ScriptID    $420,$2	; Flag clear: Run text script at offset	0x027F5E
					; 0xE3C2: PRINT	MSG 0x040F, MSGBOX CLEARED, END: "{5B}:	Training rooms for{57}the soldiers from	here.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00FF:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CB		; Bit 3	of flag	0x019
		ScriptID    $423,$1	; Flag clear: Run text script at offset	0x027F64
					; 0x83C5: PRINT	MSG 0x0412: "{5B}: Working here,I get to{57}see	the nobility from{57}various countries.{62}"
					; 0x83C6: PRINT	MSG 0x0413: "{5B}: Just	recently, I had	a chance{57}to meet Princess Rolia from{57}Maple.  She was really cute!{62}"
					; 0xE3C7: PRINT	MSG 0x0414, MSGBOX CLEARED, END: "{5B}:	But since then...{57}...nothing!{5E}"
		ScriptID    $426,$2	; Flag set:   Run text script at offset	0x027F6A
					; 0xE3C8: PRINT	MSG 0x0415, MSGBOX CLEARED, END: "{5B}:	We are told not	to speak{57}with the guests...{57}Please excuse	me.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0100:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptJump  CS_0100_0,$1 ; Jump	to address 0x026CD6
					;
		dc.w $12		; Params 00, 12
		ScriptID    $42B,$3	; Run text script at offset 0x027F74
					; 0x83CD: PRINT	MSG 0x041A: "{5B}: What	a surprise!{57}Mr. Zak,	the Dragonute, said{57}that he would buy this one!{62}"
					; 0xE3CE: PRINT	MSG 0x041B, MSGBOX CLEARED, END: "{5B}:	Is bounty hunting such a{57}good job?  Hmmmmm.....{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0100_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CC		; Bit 4	of flag	0x019
		ScriptID    $427,$1	; Flag clear: Run text script at offset	0x027F6C
					; 0x83C9: PRINT	MSG 0x0416: "{5B}: The paintings and ornaments{57}in this castle are{57}well known for their{62}"
					; 0x83CA: PRINT	MSG 0x0417: "{5B}: historic value.  Incidentally,{57}this picture is by	the famous{57}Van Dough.  If you{62}"
					; 0xE3CB: PRINT	MSG 0x0418, MSGBOX CLEARED, END: "{5B}:	really want it,	I'm sure{57}the duke would sell it to you.{57}Only 50,000 golds...cheap!{5E}"
		ScriptID    $42A,$2	; Flag set:   Run text script at offset	0x027F72
					; 0xE3CC: PRINT	MSG 0x0419, MSGBOX CLEARED, END: "{5B}:	Collecting art{57}is the duke's hobby.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0101:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $42D,$1	; Run text script at offset 0x027F78
					; 0xE3CF: PRINT	MSG 0x041C, MSGBOX CLEARED, END: "{5B}:	This mansion is	so large,{57}it	takes me one whole day{57}to clean the walls...{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $42E,$3	; Run text script at offset 0x027F7A
					; 0xE3D0: PRINT	MSG 0x041D, MSGBOX CLEARED, END: "{5B}:	Cleaning the walls is{57}very hard work.{57}So,	I'm taking the day off!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0102:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $10		; Params 00, 10
		ScriptID    $42F,$1	; Run text script at offset 0x027F7C
					; 0x7C50: LOAD CUSTOM ACTION 0x50 (0x10000013F CSA_0050), MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $430,$3	; Run text script at offset 0x027F7E
					; 0x83D1: PRINT	MSG 0x041E: "{5B}: Mr. Dexter?	No, I don't{57}know where he is now{57}He was gone by the time I{62}"
					; 0xE3D2: PRINT	MSG 0x041F, MSGBOX CLEARED, END: "{5B}:	came to	clean his room.....{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0103:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $432,$0	; Run text script at offset 0x027F82
					; 0xE3D3: PRINT	MSG 0x0420, MSGBOX CLEARED, END: "{5B}:	That's your maid over there.{57}She'll show you to your room.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0021:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $10		; Params 00, 10
		ScriptJump  CS_0021_0,$1 ; Jump	to address 0x026D12
					;
		dc.w $13		; Params 00, 13
		ScriptID    $437,$3	; Run text script at offset 0x027F8C
					; 0x83D8: PRINT	MSG 0x0425: "{5B}: There is a barrier at{57}the	door to	Mir's tower.{57}I think General Arthur{62}"
					; 0xE3D9: PRINT	MSG 0x0426, MSGBOX CLEARED, END: "{5B}:	discovered a way to break it.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0021_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CA		; Bit 2	of flag	0x019
		ScriptID    $433,$1	; Flag clear: Run text script at offset	0x027F84
					; 0x83D4: PRINT	MSG 0x0421: "{5B}: An evil magician is{57}tormenting Duke Mercator.{57}The duke	has been avoiding{62}"
					; 0x83D5: PRINT	MSG 0x0422: "{5B}: a direct confrontation out of{57}consideration for the{57}townspeople, but...{62}"
					; 0x83D6: PRINT	MSG 0x0423: "{5B}: you'll hear more about it{57}at the dinner party.{62}"
					; 0xE3D7: PRINT	MSG 0x0424, MSGBOX CLEARED, END: "{5B}:	You need some rest now.{5E}"
		ScriptID    $436,$2	; Flag set:   Run text script at offset	0x027F8A
					; 0xE3D7: PRINT	MSG 0x0424, MSGBOX CLEARED, END: "{5B}:	You need some rest now.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0104:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $447,$1	; Run text script at offset 0x027FAC
					; 0xE3E7: PRINT	MSG 0x0434, MSGBOX CLEARED, END: "{5B}:	I'm proud of my job!{5E}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $448,$3	; Run text script at offset 0x027FAE
					; 0xE3E8: PRINT	MSG 0x0435, MSGBOX CLEARED, END: "{5B}:	Mr. Nigel, would you{57}please go to the banquet room?{5E}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $449,$5	; Run text script at offset 0x027FB0
					; 0xE3E9: PRINT	MSG 0x0436, MSGBOX CLEARED, END: "{5B}:	I'm proud of my job!{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $44A,$7	; Run text script at offset 0x027FB2
					; 0xE3EA: PRINT	MSG 0x0437, MSGBOX CLEARED, END: "{5B}:	Good morning, Mr. Nigel!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0105:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $44B,$1	; Run text script at offset 0x027FB4
					; 0xE3EB: PRINT	MSG 0x0438, MSGBOX CLEARED, END: "{5B}:	We have	to take	care of{57}VIPs	everyday. It sometimes{57}wears	my nerves thin.{5E}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $44C,$3	; Run text script at offset 0x027FB6
					; 0xE3EC: PRINT	MSG 0x0439, MSGBOX CLEARED, END: "{5B}:	Have fun at the	party!{5E}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $44D,$5	; Run text script at offset 0x027FB8
					; 0xE3ED: PRINT	MSG 0x043A, MSGBOX CLEARED, END: "{5B}:	We have	to take	care of{57}VIPs	everyday.  It can really{57}frazzle my nerves...{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $44E,$7	; Run text script at offset 0x027FBA
					; 0xE3EE: PRINT	MSG 0x043B, MSGBOX CLEARED, END: "{5B}:	Mr. Zak	and Mr.	Dexter{57}took off early this morning.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0106:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $44F,$1	; Run text script at offset 0x027FBC
					; 0xE3EF: PRINT	MSG 0x043C, MSGBOX CLEARED, END: "{5B}:	I'm sorry, but we're busy{57}preparing for the party now.{5E}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $450,$3	; Run text script at offset 0x027FBE
					; 0xE3F0: PRINT	MSG 0x043D, MSGBOX CLEARED, END: "{5B}:	Everyone is waiting.{57}Please come in.{5E}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $451,$5	; Run text script at offset 0x027FC0
					; 0xE3F1: PRINT	MSG 0x043E, MSGBOX CLEARED, END: "{5B}:	I'm sorry, but Duke Mercator{57}has gone to bed.  He's not{57}feeling very well tonight...{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $452,$7	; Run text script at offset 0x027FC2
					; 0xE3F2: PRINT	MSG 0x043F, MSGBOX CLEARED, END: "{5B}:	Mr. Zak	left{57}quite a	while back.....{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0107:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $453,$1	; Run text script at offset 0x027FC4
					; 0xE3F3: PRINT	MSG 0x0440, MSGBOX CLEARED, END: "{5B}:	Arf, arf...{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $454,$3	; Run text script at offset 0x027FC6
					; 0xE3F4: PRINT	MSG 0x0441, MSGBOX CLEARED, END: "{5B}:	Bow-wow!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0108:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $455,$1	; Run text script at offset 0x027FC8
					; 0xE3F5: PRINT	MSG 0x0442, MSGBOX CLEARED, END: "{5B}:	I'm a member of the duke's{57}Royal Guard.  I'm guarding{57}the duke with my life!{5E}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $456,$3	; Run text script at offset 0x027FCA
					; 0xE3F6: PRINT	MSG 0x0443, MSGBOX CLEARED, END: "{5B}:	The duke is a gentleman,{57}but	a little nervous.{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $457,$5	; Run text script at offset 0x027FCC
					; 0xE3F7: PRINT	MSG 0x0444, MSGBOX CLEARED, END: "{5B}:	It is said that	nobody{57}ever left that tower alive.{57}Please	be careful!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0109:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $458,$1	; Run text script at offset 0x027FCE
					; 0xE3F8: PRINT	MSG 0x0445, MSGBOX CLEARED, END: "{5B}:	I'm the duke's maid.{57}If you need anything, please{57}call one of the other maids.{5E}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $459,$3	; Run text script at offset 0x027FD0
					; 0xE3F9: PRINT	MSG 0x0446, MSGBOX CLEARED, END: "{5B}:	It's time for the dinner{57}party.  The banquet room is{57}on the second floor.{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $45A,$5	; Run text script at offset 0x027FD2
					; 0xE3FA: PRINT	MSG 0x0447, MSGBOX CLEARED, END: "{5B}:	Duke Mercator is{57}out	now.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $45B,$1	; Run text script at offset 0x027FD4
					; 0xE3FB: PRINT	MSG 0x0448, MSGBOX CLEARED, END: "{5B}:	This is	the library.{57}I'm happiest when I'm{57}surrounded by a lot of books.{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $45C,$3	; Run text script at offset 0x027FD6
					; 0xE3FC: PRINT	MSG 0x0449, MSGBOX CLEARED, END: "{5B}:	It's almost impossible{57}to get into Mir's tower.{57}That barrier cannot be broken.{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $45D,$5	; Run text script at offset 0x027FD8
					; 0x83FD: PRINT	MSG 0x044A: "{5B}: I was surprised to see{57}two horrible monsters{57}following	some great beauty {62}"
					; 0xE3FE: PRINT	MSG 0x044B, MSGBOX CLEARED, END: "{5B}:	out of the basement!{57}Who were they?	And{57}what were they doing there?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $45F,$1	; Run text script at offset 0x027FDC
					; 0x83FF: PRINT	MSG 0x044C: "{5B}: Hey boy!  Are you a rookie?{57}We have a banquet tonight,{57}so shake a leg!{62}"
					; 0xE400: PRINT	MSG 0x044D, MSGBOX CLEARED, END: "{5B}:	Oh!...are you a	guest?{57}Oops!...er, um...{57}...excuse me, sir!{5E}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $461,$3	; Run text script at offset 0x027FE0
					; 0xE401: PRINT	MSG 0x044E, MSGBOX CLEARED, END: "{5B}:	I'm worn out!{57}Catering a banquet is no{57}picnic!{5E}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $462,$5	; Run text script at offset 0x027FE2
					; 0xE402: PRINT	MSG 0x044F, MSGBOX CLEARED, END: "{5B}:	Hiccup!...wooops...{57}Er, this	cooking	sherry needs{57}more salt!...hiccup!...{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $463,$1	; Run text script at offset 0x027FE4
					; 0x8403: PRINT	MSG 0x0450: "{5B}: How selfish she is!{57}She told me, "I'm on a diet.{57}Serve me a special menu{62}"
					; 0xE404: PRINT	MSG 0x0451, MSGBOX CLEARED, END: "{5B}:	with no	meat, no fish!"{57}I really don't like her!  But{57}a guest is a guest...{5E}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $465,$3	; Run text script at offset 0x027FE8
					; 0x8405: PRINT	MSG 0x0452: "{5B}: I don't like her!{57}She leaves the room untidy,{57}and her bathroom's always{62}"
					; 0xE406: PRINT	MSG 0x0453, MSGBOX CLEARED, END: "{5B}:	sloppy!	 I've never{57}seen such an ill-bred woman!{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $467,$5	; Run text script at offset 0x027FEC
					; 0xE407: PRINT	MSG 0x0454, MSGBOX CLEARED, END: "{5B}:	We are not allowed to{57}speak with the	guests.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $468,$1	; Run text script at offset 0x027FEE
					; 0x8408: PRINT	MSG 0x0455: "{5B}: We get to eat the leftovers{57}after	the banquet.{62}"
					; 0xE409: PRINT	MSG 0x0456, MSGBOX CLEARED, END: "{5B}:	It's our only pleasure{57}in this job.{5E}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $46A,$3	; Run text script at offset 0x027FF2
					; 0xE40A: PRINT	MSG 0x0457, MSGBOX CLEARED, END: "{5B}:	A lot of leftovers in there?{57}Oh, happy day!{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $46B,$5	; Run text script at offset 0x027FF4
					; 0x840B: PRINT	MSG 0x0458: "{5B}: I'm full!{57}Did you see that roast beef?{62}"
					; 0xE40C: PRINT	MSG 0x0459, MSGBOX CLEARED, END: "{5B}:	I ate too much!	 Never again!{57}By the	way, do	you know when{57}the next banquet is?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptJump  CS_010E_0,$1 ; Jump	to address 0x026DEC
					;
		dc.w $12		; Params 00, 12
		ScriptID    $470,$3	; Run text script at offset 0x027FFE
					; 0xE410: PRINT	MSG 0x045D, MSGBOX CLEARED, END: "{5B}:	I've been on break since{57}ten this morning!{57}Heh heh heh...{5E}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $471,$5	; Run text script at offset 0x028000
					; 0xE411: PRINT	MSG 0x045E, MSGBOX CLEARED, END: "{5B}:	What?  The party's over?{57}Ahhh....breaktime!!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010E_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CD		; Bit 5	of flag	0x019
		ScriptID    $46D,$1	; Flag clear: Run text script at offset	0x027FF8
					; 0x840D: PRINT	MSG 0x045A: "{5B}: Ulp!	 I'm sorry!  I'm...{57}Oh...who are you?{57}I thought you were my boss!{62}"
					; 0xE40E: PRINT	MSG 0x045B, MSGBOX CLEARED, END: "{5B}:	He's always scolding me...{5E}"
		ScriptID    $46F,$2	; Flag set:   Run text script at offset	0x027FFC
					; 0xE40F: PRINT	MSG 0x045C, MSGBOX CLEARED, END: "{5B}:	I'm just taking my break now.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_010F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $472,$1	; Run text script at offset 0x028002
					; 0xE412: PRINT	MSG 0x045F, MSGBOX CLEARED, END: "{5B}:	This stew must be{57}extremely delicious!  It's{57}been cooking for three days!{5E}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $473,$3	; Run text script at offset 0x028004
					; 0xE413: PRINT	MSG 0x0460, MSGBOX CLEARED, END: "{5B}:	Banquets are a good{57}opportunity to show off{57}my abilities as a cook!{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $474,$5	; Run text script at offset 0x028006
					; 0x8414: PRINT	MSG 0x0461: "{5B}: I was very disappointed{57}to see that almost no one{57}cleaned his plate!{62}"
					; 0xE415: PRINT	MSG 0x0462, MSGBOX CLEARED, END: "{5B}:	What happened in there?{5E}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $476,$7	; Run text script at offset 0x02800A
					; 0xE416: PRINT	MSG 0x0463, MSGBOX CLEARED, END: "{5B}:	When is	the duke{57}coming back?  I have to{57}plan his	dinner menu.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0110:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $477,$1	; Run text script at offset 0x02800C
					; 0x8417: PRINT	MSG 0x0464: "{5B}: We're serving fried{57}Gamoor lobsters and scallops!{57}Seafood is{62}"
					; 0xE418: PRINT	MSG 0x0465, MSGBOX CLEARED, END: "{5B}:	one of the duke's favorites.{5E}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $479,$3	; Run text script at offset 0x028010
					; 0x8419: PRINT	MSG 0x0466: "{5B}: How was dinner?{57}The menu was really special,{57}wasn't it?{62}"
					; 0xE41A: PRINT	MSG 0x0467, MSGBOX CLEARED, END: "{5B}:	I wish I had gone to the{57}banquet with you...What?{57}You didn't eat!  How come?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0111:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $47B,$1	; Run text script at offset 0x028014
					; 0xE41B: PRINT	MSG 0x0468, MSGBOX CLEARED, END: "{5B}:	Mr. Zak	eats only raw meat?{57}I had no	idea!...{5E}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $47C,$3	; Run text script at offset 0x028016
					; 0xE41C: PRINT	MSG 0x0469, MSGBOX CLEARED, END: "{5B}:	Did Mr.	Zak like the{57}fried lobsters?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0112:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptJump  CS_0112_0,$1 ; Jump	to address 0x026E3C
					;
		dc.w $12		; Params 00, 12
		ScriptID    $481,$3	; Run text script at offset 0x028020
					; 0xE41F: PRINT	MSG 0x046C, MSGBOX CLEARED, END: "{5B}:	Please come to the{57}banquet room.  It's on the{57}second floor.{5E}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $482,$5	; Run text script at offset 0x028022
					; 0xE420: PRINT	MSG 0x046D, MSGBOX CLEARED, END: "{5B}:	You cannot leave{57}just yet....{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0112_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $CE		; Bit 6	of flag	0x019
		ScriptID    $47F,$1	; Flag set:   Run text script at offset	0x02801C
					; 0x1493: SET BIT 3 OF FLAG 0x012
					; 0xE41E: PRINT	MSG 0x046B, MSGBOX CLEARED, END: "{5B}:	Mr. Nigel!  The	party is{57}ready now.	Would you please{57}come to the	banquet	room?{5E}"
		ScriptID    $47D,$2	; Flag clear: Run text script at offset	0x028018
					; 0x14DB: SET BIT 3 OF FLAG 0x01B
					; 0xE41D: PRINT	MSG 0x046A, MSGBOX CLEARED, END: "{5B}:	Have you looked	around{57}the castle?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0113:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $483,$0	; Run text script at offset 0x028024
					; 0x8421: PRINT	MSG 0x046E: "{5B}: Long	ago, there was{57}a huge war on	the continent.{57}King Nole used this island{62}"
					; 0x8422: PRINT	MSG 0x046F: "{5B}: as a	base.  When the	war{57}was over, the fortresses	and{57}labyrinths were simply{62}"
					; 0xE423: PRINT	MSG 0x0470, MSGBOX CLEARED, END: "{5B}:	abandoned...many of them{57}stand to this day!M"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0114:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $486,$0	; Run text script at offset 0x02802A
					; 0x8424: PRINT	MSG 0x0471: "{5B}: The Dark Wizard of{57}the tower is very cunning!{57}The tower itself	is like	a{62}"
					; 0xE425: PRINT	MSG 0x0472, MSGBOX CLEARED, END: "{5B}:	storied	maze.  There is{57}also	a barrier to protect the{57}wizard from	outsiders...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0115:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $488,$0	; Run text script at offset 0x02802E
					; 0xE426: PRINT	MSG 0x0473, MSGBOX CLEARED, END: "{5B}:	I got a	bonus today!{57}Want to	go to Greenpea's and{57}watch me double it?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0116:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $489,$1	; Run text script at offset 0x028030
					; 0x8427: PRINT	MSG 0x0474: "{5B}: Oh, I'm sorry!{57}We thought you were one of our{57}soldiers!  Did we scare you?{62}"
					; 0xE428: PRINT	MSG 0x0475, MSGBOX CLEARED, END: "{5B}:	We have	to study{57}new	tactics	everyday!{5E}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $48B,$3	; Run text script at offset 0x028034
					; 0xE429: PRINT	MSG 0x0476, MSGBOX CLEARED, END: "{5B}:	The other soldiers are{57}making the rounds outside.{5E}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $48C,$5	; Run text script at offset 0x028036
					; 0x842A: PRINT	MSG 0x0477: "{5B}: Everyone's out training.{57}Me?  Well, uh...umm...{62}"
					; 0xE42B: PRINT	MSG 0x0478, MSGBOX CLEARED, END: "{5B}:	I-I'm minding the store{57}while they're gone!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0117:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $48E,$0	; Run text script at offset 0x02803A
					; 0xE42C: PRINT	MSG 0x0479, MSGBOX CLEARED, END: "{5B}:	This is	the newest formation!{57}How do	you like it?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0118:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $48F,$0	; Run text script at offset 0x02803C
					; 0xE42D: PRINT	MSG 0x047A, MSGBOX CLEARED, END: "{5B}:	We modeled it after the{57}movement of some monsters{57}we saw in a cave.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0119:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $490,$0	; Run text script at offset 0x02803E
					; 0xE42E: PRINT	MSG 0x047B, MSGBOX CLEARED, END: "{5B}:	Don't interrupt!{57}It's just training, but I still{57}have to concentrate!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011A:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $491,$0	; Run text script at offset 0x028040
					; 0xE42F: PRINT	MSG 0x047C, MSGBOX CLEARED, END: "{5B}:	Out of the way,	kid!{57}This is	serious.  I've got{57}60 golds riding on this fight!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011B:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $40C,$0	; Run text script at offset 0x027F36
					; 0xE3AE: PRINT	MSG 0x03FB, MSGBOX CLEARED, END: "{5B}:	Cock-a-doodle-dooooo!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011C:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $40D,$0	; Run text script at offset 0x027F38
					; 0xE3AF: PRINT	MSG 0x03FC, MSGBOX CLEARED, END: "{5B}:	Cock-a-cock-a-co....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011D:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4B2,$0	; Run text script at offset 0x028082
					; 0xE449: PRINT	MSG 0x0496, MSGBOX CLEARED, END: "{5B}:	This room is reserved{57}for special guests.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0022:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $17		; Params 00, 17
		ScriptID    $4C2,$1	; Run text script at offset 0x0280A2
					; 0x7CA5: LOAD CUSTOM ACTION 0xA5 (0x100000293 CSA_00A5), MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $80B,$3	; Run text script at offset 0x028734
					; 0xE68D: PRINT	MSG 0x06DA, MSGBOX CLEARED, END: "{5B}:	Please get the princess{57}back	from Duke Mercator!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_011E:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D0		; Bit 0	of flag	0x01A
		ScriptID    $4C3,$1	; Flag clear: Run text script at offset	0x0280A4
					; 0x8458: PRINT	MSG 0x04A5: "{5B}: Wandering about in this{57}basement has completely{57}tired us out!	Please go on{62}"
					; 0xE459: PRINT	MSG 0x04A6, MSGBOX CLEARED, END: "{5B}:	ahead and save the princess.{57}The duke has taken Miss	Rolia{57}prisoner...please find	her!{5E}"
		ScriptID    $4C4,$2	; Flag set:   Run text script at offset	0x0280A6
					; 0xE459: PRINT	MSG 0x04A6, MSGBOX CLEARED, END: "{5B}:	ahead and save the princess.{57}The duke has taken Miss	Rolia{57}prisoner...please find	her!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $4E4,$1	; Run text script at offset 0x0280E6
					; 0x8472: PRINT	MSG 0x04BF: "{5B}: Are you a tourist?{57}You'd better go back.  All{57}the townspeople were{62}"
					; 0x8473: PRINT	MSG 0x04C0: "{5B}: suddenly taken to the{57}mountains by strange soldiers.{57}I	was fishing by the sea{62}"
					; 0xE474: PRINT	MSG 0x04C1, MSGBOX CLEARED, END: "{5B}:	at the time...{57}All that's left are a priest{57}and a sick old man...{5E}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $4E7,$3	; Run text script at offset 0x0280EC
					; 0xE475: PRINT	MSG 0x04C2, MSGBOX CLEARED, END: "{5B}:	I heard	 you rescued{57}the people of this town!{57}Bravo!  Well done!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0023:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $4E8,$1	; Run text script at offset 0x0280EE
					; 0xE476: PRINT	MSG 0x04C3, MSGBOX CLEARED, END: "{5B}:	...cough...cough...{5E}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $4E9,$3	; Run text script at offset 0x0280F0
					; 0xE477: PRINT	MSG 0x04C4, MSGBOX CLEARED, END: "{5B}:	It's a miracle!  My health{57}suddenly came back to see them{57}all returned safe and sound!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0024:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $4EA,$1	; Run text script at offset 0x0280F2
					; 0xE478: PRINT	MSG 0x04C5, MSGBOX CLEARED, END: "{5B}:	Why did	Duke Mercator{57}take all the people away?..{5E}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $4EB,$3	; Run text script at offset 0x0280F4
					; 0xE479: PRINT	MSG 0x04C6, MSGBOX CLEARED, END: "{5B}:	I'm happy now that{57}everything's back to normal...{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0120:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0120_0,$1 ; Jump	to address 0x026EE8
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $4F1,$3	; Run text script at offset 0x028100
					; 0xE47F: PRINT	MSG 0x04CC, MSGBOX CLEARED, END: "{5B}:	Whew!  What a relief!{57}No more digging!  Now I can{57}go back	to my old job.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0120_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $135		; Bit 5	of flag	0x026
		ScriptID    $4ED,$1	; Flag set:   Run text script at offset	0x0280F8
					; 0x847B: PRINT	MSG 0x04C8: "{5B}: We're all from Verla.{57}Duke Mercator forced us to{57}dig this mine.{62}"
					; 0x847C: PRINT	MSG 0x04C9: "{5B}: Our families	were also{57}taken captive by his{57}soldiers...please save them!{62}"
					; 0x847D: PRINT	MSG 0x04CA: "{5B}: This	mine consists of three{57}forked tunnels.  You'll find{62}"
					; 0xE47E: PRINT	MSG 0x04CB, MSGBOX CLEARED, END: "{5B}:	our friends caught somewhere{57}in the other two tunnels.{57}Please help us!{5E}"
		ScriptID    $4EC,$2	; Flag clear: Run text script at offset	0x0280F6
					; 0xE47A: PRINT	MSG 0x04C7, MSGBOX CLEARED, END: "{5B}:	Get the	monster, please!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0121:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0121_0,$1 ; Jump	to address 0x026F02
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $4F5,$3	; Run text script at offset 0x028108
					; 0xE483: PRINT	MSG 0x04D0, MSGBOX CLEARED, END: "{5B}:	Why did	Duke Mercator{57}do such a terrible thing?{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0121_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $135		; Bit 5	of flag	0x026
		ScriptID    $4F3,$1	; Flag set:   Run text script at offset	0x028104
					; 0x8481: PRINT	MSG 0x04CE: "{5B}: Duke	Mercator suddenly{57}appeared in town and{57}ordered his henchmen{57}to	bring us here.{62}"
					; 0xE482: PRINT	MSG 0x04CF, MSGBOX CLEARED, END: "{5B}:	And I thought he was{57}such a gentleman...{5E}"
		ScriptID    $4F2,$2	; Flag clear: Run text script at offset	0x028102
					; 0xE480: PRINT	MSG 0x04CD, MSGBOX CLEARED, END: "{5B}:	EEEEEEK!!!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0122:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0122_0,$1 ; Jump	to address 0x026F1C
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $4F8,$3	; Run text script at offset 0x02810E
					; 0xE486: PRINT	MSG 0x04D3, MSGBOX CLEARED, END: "{5B}:	I shall	never forget the{57}fear I felt	in the mines{57}for as long as I live.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0122_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $135		; Bit 5	of flag	0x026
		ScriptID    $4F7,$1	; Flag set:   Run text script at offset	0x02810C
					; 0xE485: PRINT	MSG 0x04D2, MSGBOX CLEARED, END: "{5B}:	I was so scared!{5E}"
		ScriptID    $4F6,$2	; Flag clear: Run text script at offset	0x02810A
					; 0xE484: PRINT	MSG 0x04D1, MSGBOX CLEARED, END: "{5B}:	H-help!{57}S-somebody help!!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0123:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0123_0,$1 ; Jump	to address 0x026F36
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $4FC,$3	; Run text script at offset 0x028116
					; 0x848A: PRINT	MSG 0x04D7: "{5B}: The duke and	his soldiers{57}left for Destel.  The dwarves{57}in that village are all{62}"
					; 0x848B: PRINT	MSG 0x04D8: "{5B}: peaceful and	good-natured.{57}They have no weapons to{57}protect themselves.{62}"
					; 0xE48C: PRINT	MSG 0x04D9, MSGBOX CLEARED, END: "{5B}:	I'm afraid it'll be{57}a slaughter...{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0123_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $136		; Bit 6	of flag	0x026
		ScriptID    $4FA,$1	; Flag set:   Run text script at offset	0x028112
					; 0x8488: PRINT	MSG 0x04D5: "{5B}: What	was the	duke{57}looking	for in this{57}mine, anyway?K0"
					; 0xE489: PRINT	MSG 0x04D6, MSGBOX CLEARED, END: "{5B}:	He kept	us digging{57}morning, noon, and night!{5E}"
		ScriptID    $4F9,$2	; Flag clear: Run text script at offset	0x028110
					; 0xE487: PRINT	MSG 0x04D4, MSGBOX CLEARED, END: "{5B}:	We're OK! Kill him!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0124:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $4FF,$1	; Run text script at offset 0x02811C
					; 0xE48D: PRINT	MSG 0x04DA, MSGBOX CLEARED, END: "{5B}:	Go!  GO!!....{5E}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $500,$3	; Run text script at offset 0x02811E
					; 0x848E: PRINT	MSG 0x04DB: "{5B}: What's Duke Mercator{57}doing now...?{62}"
					; 0xE48F: PRINT	MSG 0x04DC, MSGBOX CLEARED, END: "{5B}:	Nigel!	I really think{57}you're the only guy{57}who can defeat the duke!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0125:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0125_0,$1 ; Jump	to address 0x026F5E
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $504,$3	; Run text script at offset 0x028126
					; 0x8492: PRINT	MSG 0x04DF: "{5B}: I know the mayor of Destel.{57}He comes here	often to{57}buy	fish.  He's a good man.{62}"
					; 0xE493: PRINT	MSG 0x04E0, MSGBOX CLEARED, END: "{5B}:	He said	they live{57}peacefully	there, growing{57}lovely, scented flowers...{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0125_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $136		; Bit 6	of flag	0x026
		ScriptID    $503,$1	; Flag set:   Run text script at offset	0x028124
					; 0xE491: PRINT	MSG 0x04DE, MSGBOX CLEARED, END: "{5B}:	The duke must have{57}sold us out for the treasures.{5E}"
		ScriptID    $502,$2	; Flag clear: Run text script at offset	0x028122
					; 0xE490: PRINT	MSG 0x04DD, MSGBOX CLEARED, END: "{5B}:	Hold out!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0126:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0126_0,$1 ; Jump	to address 0x026F78
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $50A,$3	; Run text script at offset 0x028132
					; 0x8498: PRINT	MSG 0x04E5: "{5B}: The tunnel between Mercator{57}and Verla is finally open.{57}K0"
					; 0x8499: PRINT	MSG 0x04E6: "{5B}: I can go to Greenpea's everyday!{62}"
					; 0xE49A: PRINT	MSG 0x04E7, MSGBOX CLEARED, END: "{5B}:	Being kept in that dark	and{57}cramped tunnel for so long{57}really stressed me	out!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0126_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $137		; Bit 7	of flag	0x026
		ScriptID    $507,$1	; Flag set:   Run text script at offset	0x02812C
					; 0x8495: PRINT	MSG 0x04E2: "{5B}: There is a small village on{57}the west side	of this	mine.{57}I saw Duke Mercator marching{57}with his soldiers along the{62}"
					; 0x8496: PRINT	MSG 0x04E3: "{5B}: the road that leads to the{57}village.  Do you know{57}anything about it?{62}"
					; 0xE497: PRINT	MSG 0x04E4, MSGBOX CLEARED, END: "{5B}:	What's going on?{5E}"
		ScriptID    $506,$2	; Flag clear: Run text script at offset	0x02812A
					; 0xE494: PRINT	MSG 0x04E1, MSGBOX CLEARED, END: "{5B}:	He'll kill us!!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0127:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0127_0,$1 ; Jump	to address 0x026F92
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $50F,$3	; Run text script at offset 0x02813C
					; 0x7CDF: LOAD CUSTOM ACTION 0xDF (0x10000037B CSA_00DF), MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0127_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $137		; Bit 7	of flag	0x026
		ScriptID    $50E,$1	; Flag set:   Run text script at offset	0x02813A
					; 0xE49C: PRINT	MSG 0x04E9, MSGBOX CLEARED, END: "{5B}:	Thank you very much.{57}You looked so cool{57}when you were fighting!{5E}"
		ScriptID    $50D,$2	; Flag clear: Run text script at offset	0x028138
					; 0xE49B: PRINT	MSG 0x04E8, MSGBOX CLEARED, END: "{5B}:	eeeeEEEEK!!!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0128:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0128_0,$1 ; Jump	to address 0x026FAC
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $513,$3	; Run text script at offset 0x028144
					; 0xE4A0: PRINT	MSG 0x04ED, MSGBOX CLEARED, END: "{5B}:	I found	the sword, but{57}I didn't tell the duke{57}about it!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0128_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $137		; Bit 7	of flag	0x026
		ScriptJump  CS_0128_1,$1 ; Flag	set:   Jump to address 0x026FB8
		ScriptID    $510,$2	; Flag clear: Run text script at offset	0x02813E
					; 0xE49D: PRINT	MSG 0x04EA, MSGBOX CLEARED, END: "{5B}:	Don't look at ME...{57}GET 'im!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0128_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $13D		; Bit 5	of flag	0x027
		ScriptID    $8D1,$1	; Flag set:   Run text script at offset	0x0288C0
					; 0x1928: LOAD CHARACTER SCRIPT	* (0x0128)
					; 0xE6FF: PRINT	MSG 0x074C, MSGBOX CLEARED, END: "{5B}:	See!{57}It will	be opened soon!{5E}"
		ScriptID    $511,$2	; Flag clear: Run text script at offset	0x028140
					; 0x849E: PRINT	MSG 0x04EB: "{5B}: I overhead the duke's men{57}say the digging was over{57}because they found{62}"
					; 0xE49F: PRINT	MSG 0x04EC, MSGBOX CLEARED, END: "{5B}:	what they were looking for.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0129:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $514,$1	; Run text script at offset 0x028146
					; 0xE4A1: PRINT	MSG 0x04EE, MSGBOX CLEARED, END: "{5B}:	Dig!  Dig!{5E}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $515,$3	; Run text script at offset 0x028148
					; 0x84A2: PRINT	MSG 0x04EF: "{5B}: I had my suspicions{57}all along that this was no{57}ordinary mine.{62}"
					; 0xE4A3: PRINT	MSG 0x04F0, MSGBOX CLEARED, END: "{5B}:	But who	would have{57}guessed that a legendary{57}treasure was hidden there!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_012A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $517,$1	; Run text script at offset 0x02814C
					; 0xE4A4: PRINT	MSG 0x04F1, MSGBOX CLEARED, END: "{5B}:	I have to keep at it.{57}Our lives are depending{57}on this...{5E}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $518,$3	; Run text script at offset 0x02814E
					; 0x84A5: PRINT	MSG 0x04F2: "{5B}: That	tunnel in the mine{57}is the only way{57}to go to Destel.{62}"
					; 0xE4A6: PRINT	MSG 0x04F3, MSGBOX CLEARED, END: "{5B}:	The sword?  We happened{57}to find it when we were{57}digging the tunnel.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_012B:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $51A,$0	; Run text script at offset 0x028152
					; 0xE4A7: PRINT	MSG 0x04F4, MSGBOX CLEARED, END: "{5B}:	I can't trust humans{57}anymore!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_012C:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $51B,$0	; Run text script at offset 0x028154
					; 0xE4A8: PRINT	MSG 0x04F5, MSGBOX CLEARED, END: "{5B}:	My house was ransacked{57}by many big soldiers!!...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0025:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1B		; Params 00, 1B
		ScriptID    $51C,$1	; Run text script at offset 0x028156
					; 0x84A9: PRINT	MSG 0x04F6: "{5B}: Why are humans so rude?!{57}They came from out of nowhere{57}and trampled down our{62}"
					; 0x84AA: PRINT	MSG 0x04F7: "{5B}: flower beds...{57}If	they wanted the	jewel,{57}they should have asked me...{62}"
					; 0x84AB: PRINT	MSG 0x04F8: "{5B}: Jewel?  someone named{57}Mercator found it and{57}took it away.{62}"
					; 0x84AC: PRINT	MSG 0x04F9: "{5B}: Why does he want such a{57}worthless	thing?	Flowers	and{57}seeds are prettier...and	they{62}"
					; 0xE4AD: PRINT	MSG 0x04FA, MSGBOX CLEARED, END: "{5B}:	smell good, too!{5E}"
					;
		dc.w $1C		; Params 00, 1C
		ScriptID    $521,$3	; Run text script at offset 0x028160
					; 0x84AE: PRINT	MSG 0x04FB: "{5B}: I was at the	inn, talking{57}about the ancient cave under{57}this village, when some{62}"
					; 0xE4AF: PRINT	MSG 0x04FC, MSGBOX CLEARED, END: "{5B}:	tourist	suddenly rushed	down{57}here, broke the	seal, and{57}disappeared down the cave...{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_012D:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $523,$0	; Run text script at offset 0x028164
					; 0xE4B0: PRINT	MSG 0x04FD, MSGBOX CLEARED, END: "{5B}:	I've never seen such{57}rudeness in all my life!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_012E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1B		; Params 00, 1B
		ScriptID    $524,$1	; Run text script at offset 0x028166
					; 0x84B1: PRINT	MSG 0x04FE: "{5B}: I don't like the hectic{57}pace of life in crowded towns,{57}so I live here quietly{62}"
					; 0x84B2: PRINT	MSG 0x04FF: "{5B}: with	the dwarves.{62}"
					; 0xE4B3: PRINT	MSG 0x0500, MSGBOX CLEARED, END: "{5B}:	I think	humans are wicked.{5E}"
					;
		dc.w $1C		; Params 00, 1C
		ScriptID    $527,$3	; Run text script at offset 0x02816C
					; 0x84B4: PRINT	MSG 0x0501: "{5B}: Once	I went down and{57}tried to look into the cave,{57}but it was impossible.{62}"
					; 0xE4B5: PRINT	MSG 0x0502, MSGBOX CLEARED, END: "{5B}:	I don't think you can do it.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0026:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $529,$0	; Run text script at offset 0x028170
					; 0xE4B6: PRINT	MSG 0x0503, MSGBOX CLEARED, END: "{5B}:	We just	want to	live{57}in peace...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0027:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $52A,$0	; Run text script at offset 0x028172
					; 0xE4B7: PRINT	MSG 0x0504, MSGBOX CLEARED, END: "{5B}:	Dwarves	are quite pious.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_012F:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $52B,$0	; Run text script at offset 0x028174
					; 0xE4B8: PRINT	MSG 0x0505, MSGBOX CLEARED, END: "{5B}:	I was scared!{57}The soldiers were{57}twice as tall as me!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0028:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $52C,$0	; Run text script at offset 0x028176
					; 0x84B9: PRINT	MSG 0x0506: "{5B}: Kindly's Item Shop!{62}"
					; 0xE4BA: PRINT	MSG 0x0507, MSGBOX CLEARED, END: "{5B}:	I'm kind!{57}My brother is not...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0130:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $52E,$0	; Run text script at offset 0x02817A
					; 0xE4BB: PRINT	MSG 0x0508, MSGBOX CLEARED, END: "{5B}:	Welcome	to the{57}village of Destel.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0131:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1B		; Params 00, 1B
		ScriptID    $52F,$1	; Run text script at offset 0x02817C
					; 0xE4BC: PRINT	MSG 0x0509, MSGBOX CLEARED, END: "{5B}:	This well is the entrance{57}to	an ancient cave	where{57}monsters dwell.{5E}"
					;
		dc.w $1C		; Params 00, 1C
		ScriptID    $530,$3	; Run text script at offset 0x02817E
					; 0xE4BD: PRINT	MSG 0x050A, MSGBOX CLEARED, END: "{5B}:	Sometimes, late	at night{57}you	can hear something{57}roaring in this well...{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0132:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $531,$0	; Run text script at offset 0x028180
					; 0x84BE: PRINT	MSG 0x050B: "{5B}: My flowerbed	was{57}ruined.....{57}What were	they looking for?{62}"
					; 0xE4BF: PRINT	MSG 0x050C, MSGBOX CLEARED, END: "{5B}:	I don't think I have{57}anything they'd want.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0133:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $533,$0	; Run text script at offset 0x028184
					; 0x84C0: PRINT	MSG 0x050D: "{5B}: Big,	hulking	soldiers rushed{57}into	my house and demanded{57}to know where the jewel was!{62}"
					; 0xE4C1: PRINT	MSG 0x050E, MSGBOX CLEARED, END: "{5B}:	What were they talking{57}about?  I have nothing{57}but	flower seeds.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0134:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1B		; Params 00, 1B
		ScriptID    $535,$1	; Run text script at offset 0x028188
					; 0x84C2: PRINT	MSG 0x050F: "{5B}: Duke	Mercator suddenly{57}appeared and bought every{57}last raft I had!{62}"
					; 0xE4C3: PRINT	MSG 0x0510, MSGBOX CLEARED, END: "{5B}:	He paid	me a whole{57}6	golds for them!	 He said{57}he was going to the	shrine.{5E}"
					;
		dc.w $1C		; Params 00, 1C
		ScriptID    $537,$3	; Run text script at offset 0x02818C
					; 0x84C4: PRINT	MSG 0x0511: "{5B}: Sorry!  All sold out...{57}You can still get	to the{57}shrine through the cave under{62}"
					; 0xE4C5: PRINT	MSG 0x0512, MSGBOX CLEARED, END: "{5B}:	Destel,	but...{57}it's pretty dangerous.{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0029:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $539,$0	; Run text script at offset 0x028190
					; 0xE4C6: PRINT	MSG 0x0513, MSGBOX CLEARED, END: "{5B}:	Beautiful waterfall, huh?{57}The people	of Destel take good{57}care to keep the	water clean.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002A:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $53A,$0	; Run text script at offset 0x028192
					; 0xE4C7: PRINT	MSG 0x0514, MSGBOX CLEARED, END: "{5B}:	I make a good living here{57}off the treasure hunters{57}who visit this	lake.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002B:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $53B,$0	; Run text script at offset 0x028194
					; 0x84C8: PRINT	MSG 0x0515: "{5B}: Hi, stranger.  You are{57}the first visitor we've had{57}in 300 years.{62}"
					; 0xE4C9: PRINT	MSG 0x0516, MSGBOX CLEARED, END: "{5B}:	Another	dictator has risen{57}to power on the surface?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0135:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $53D,$0	; Run text script at offset 0x028198
					; 0x84CA: PRINT	MSG 0x0517: "{5B}: King	Nole gave us eternal{57}youth in reward	for building{57}his underground	palace.{62}"
					; 0xE4CB: PRINT	MSG 0x0518, MSGBOX CLEARED, END: "{5B}:	I like the calm	life here.{57}I	don't want to go back{57}to the surface...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0136:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $53F,$0	; Run text script at offset 0x02819C
					; 0x84CC: PRINT	MSG 0x0519: "{5B}: You have to go through{57}a huge and	complex	labyrinth{57}to	get to the palace.{62}"
					; 0x84CD: PRINT	MSG 0x051A: "{5B}: The maze was	designed{57}by King Nole himself.  It's{57}impossible even for us{62}"
					; 0xE4CE: PRINT	MSG 0x051B, MSGBOX CLEARED, END: "{5B}:	to go through.	What a{57}greedy man he	was!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002C:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $542,$0	; Run text script at offset 0x0281A2
					; 0x84CF: PRINT	MSG 0x051C: "{5B}: There is no priest here,{57}but I've meditated on{62}"
					; 0xE4D0: PRINT	MSG 0x051D, MSGBOX CLEARED, END: "{5B}:	the goddess for	300 years,{57}so I am the substitute.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0137:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $544,$0	; Run text script at offset 0x0281A6
					; 0x84D1: PRINT	MSG 0x051E: "{5B}: I worked for	King Nole{57}so	I could	have eternal life.{57}But now I	just idle{62}"
					; 0xE4D2: PRINT	MSG 0x051F, MSGBOX CLEARED, END: "{5B}:	my time	away.....{57}sigh!...Got any comic books?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0138:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $546,$0	; Run text script at offset 0x0281AA
					; 0x84D3: PRINT	MSG 0x0520: "{5B}: There are three monsters{57}in the labyrinth	called{57}"Gehenna's Gatekeepers."{62}"
					; 0xE4D4: PRINT	MSG 0x0521, MSGBOX CLEARED, END: "{5B}:	You have to defeat them{57}to open the gateway{57}to the palace.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002D:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $548,$0	; Run text script at offset 0x0281AE
					; 0xE4D5: PRINT	MSG 0x0522, MSGBOX CLEARED, END: "{5B}:	Hi!  The original owner	of{57}this shop	left one day 200{57}years ago and never	returned.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0139:
		move.w	#$A,d0
		bsr.w	TestFlagBit
		beq.s	CS_0139_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $9ED,$0	; Run text script at offset 0x028AF8
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE7AF: PRINT	MSG 0x07FC, MSGBOX CLEARED, END: "{5B}:	See you	again!{5E}"
; ---------------------------------------------------------------------------
		bra.s	CS_0139_2
; ---------------------------------------------------------------------------

CS_0139_0:				; CODE XREF: ROM:00027092j
		move.w	#8,d0
		bsr.w	TestFlagBit
		beq.s	CS_0139_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $9E6,$0	; Run text script at offset 0x028AEA
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE7AB: PRINT	MSG 0x07F8, MSGBOX CLEARED, END: "{5B}:	Good luck!{5E}"
; ---------------------------------------------------------------------------
		bra.s	CS_0139_2
; ---------------------------------------------------------------------------

CS_0139_1:				; CODE XREF: ROM:000270A2j
		move.w	#$132,(g_Character).l

CS_0139_2:				; CODE XREF: ROM:00027098j
					; ROM:000270A8j
		rts
; ---------------------------------------------------------------------------

CS_013A:
		move.w	#$A,d0
		bsr.w	TestFlagBit
		beq.s	CS_013A_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $9ED,$0	; Run text script at offset 0x028AF8
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE7AF: PRINT	MSG 0x07FC, MSGBOX CLEARED, END: "{5B}:	See you	again!{5E}"
; ---------------------------------------------------------------------------
		bra.s	CS_013A_2
; ---------------------------------------------------------------------------

CS_013A_0:				; CODE XREF: ROM:000270BCj
		move.w	#8,d0
		bsr.w	TestFlagBit
		beq.s	CS_013A_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $9E6,$0	; Run text script at offset 0x028AEA
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE7AB: PRINT	MSG 0x07F8, MSGBOX CLEARED, END: "{5B}:	Good luck!{5E}"
; ---------------------------------------------------------------------------
		bra.s	CS_013A_2
; ---------------------------------------------------------------------------

CS_013A_1:				; CODE XREF: ROM:000270CCj
		move.w	#$159,(g_Character).l

CS_013A_2:				; CODE XREF: ROM:000270C2j
					; ROM:000270D2j
		rts
; ---------------------------------------------------------------------------

CS_013B:
		move.w	#$A,d0
		bsr.w	TestFlagBit
		beq.s	CS_013B_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $9ED,$0	; Run text script at offset 0x028AF8
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE7AF: PRINT	MSG 0x07FC, MSGBOX CLEARED, END: "{5B}:	See you	again!{5E}"
; ---------------------------------------------------------------------------
		bra.s	CS_013B_2
; ---------------------------------------------------------------------------

CS_013B_0:				; CODE XREF: ROM:000270E6j
		move.w	#8,d0
		bsr.w	TestFlagBit
		beq.s	CS_013B_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $9E6,$0	; Run text script at offset 0x028AEA
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE7AB: PRINT	MSG 0x07F8, MSGBOX CLEARED, END: "{5B}:	Good luck!{5E}"
; ---------------------------------------------------------------------------
		bra.s	CS_013B_2
; ---------------------------------------------------------------------------

CS_013B_1:				; CODE XREF: ROM:000270F6j
		move.w	#$135,(g_Character).l

CS_013B_2:				; CODE XREF: ROM:000270ECj
					; ROM:000270FCj
		rts
; ---------------------------------------------------------------------------

CS_013C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $9FE,$1	; Run text script at offset 0x028B1A
					; 0xE7BB: PRINT	MSG 0x0808, MSGBOX CLEARED, END: "{5B}:	I'm sorry.{57}This is a private area.{57}No admittance!{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  CS_013C_0,$3 ; Jump	to address 0x027116
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_013C_0:
		move.w	#$14B,d0
		bsr.w	TestFlagBit
		bne.s	CS_013C_1
		move.w	#$137,(g_Character).l
		bra.s	CS_013C_2
; ---------------------------------------------------------------------------

CS_013C_1:				; CODE XREF: ROM:0002711Ej
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $A02,$0	; Run text script at offset 0x028B22
					; 0x193C: LOAD CHARACTER SCRIPT	* (0x013C)
					; 0xE7BD: PRINT	MSG 0x080A, MSGBOX CLEARED, END: "{5B}:	Welcome	to{57}the Casino Arthurlier!{57}Have fun!{5E}"
; ---------------------------------------------------------------------------

CS_013C_2:				; CODE XREF: ROM:00027128j
		rts
; ---------------------------------------------------------------------------

CS_013D:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E5		; Bit 5	of flag	0x01C
		ScriptID    $A50,$1	; Flag clear: Run text script at offset	0x028BBE
					; 0x1BF3: LOAD SPECIAL CHARACTER Pixie (0x0B)
					; 0x87E9: PRINT	MSG 0x0836: "{5B}: Oh, Friday!{57}To think I have not seen you{57}for 256 years!{62}"
					; 0x87EA: PRINT	MSG 0x0837: "{5B}: Do you remember that{57}terrible war	with King Nole?{57}Wasn't that{57}the worst experience?{62}"
					; 0x87EB: PRINT	MSG 0x0838: "{5B}: What?  YOU'RE{57}looking for the treasures{57}of King Nole?{62}"
					; 0x87EC: PRINT	MSG 0x0839: "{5B}: Be careful!{57}He's dead, but...{62}"
					; 0xE7ED: PRINT	MSG 0x083A, MSGBOX CLEARED, END: "{5B}:	he would surely	rise{57}from the grave to protect{57}his treasures...{5E}"
		ScriptID    $A56,$2	; Flag set:   Run text script at offset	0x028BCA
					; 0x1BF3: LOAD SPECIAL CHARACTER Pixie (0x0B)
					; 0xE7EE: PRINT	MSG 0x083B, MSGBOX CLEARED, END: "{5B}:	Your boyfriend{57}is cute, huh?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_013E:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E6		; Bit 6	of flag	0x01C
		ScriptID    $A58,$1	; Flag clear: Run text script at offset	0x028BCE
					; 0x1BF4: LOAD SPECIAL CHARACTER Trixie	(0x0C)
					; 0x87EF: PRINT	MSG 0x083C: "{5B}: Friday, it's you!{57}Well, you're with a{57}boy as usual.{62}"
					; 0x87F0: PRINT	MSG 0x083D: "{5B}: ...let's see...hmmm...{59}{57}...Hey, he's really cute!!{57}Where did you find him?{62}"
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0x87F1: PRINT	MSG 0x083E: "{5B}: Trixie!{57}He saved my life!{57}He's my...!{62}"
					; 0x1BF4: LOAD SPECIAL CHARACTER Trixie	(0x0C)
					; 0xE7F2: PRINT	MSG 0x083F, MSGBOX CLEARED, END: "{5B}:	OK, OK!{57}I'm sorry!{5E}"
		ScriptID    $A5F,$2	; Flag set:   Run text script at offset	0x028BDC
					; 0x1BF4: LOAD SPECIAL CHARACTER Trixie	(0x0C)
					; 0xE7F3: PRINT	MSG 0x0840, MSGBOX CLEARED, END: "{5B}:	You like boys, right?{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_NULL:
		rts
; ---------------------------------------------------------------------------

CS_002E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $17		; Params 00, 17
		ScriptID    $4B3,$1	; Run text script at offset 0x028084
					; 0xE44A: PRINT	MSG 0x0497, MSGBOX CLEARED, END: "{5B}:	Hey!  How did you{57}escape?!!	I'm not through{57}with you yet!!{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  CS_002E_0,$3 ; Jump	to address 0x027158
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_002E_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E7		; Bit 7	of flag	0x01C
		ScriptID    $4B4,$1	; Flag clear: Run text script at offset	0x028086
					; 0x844B: PRINT	MSG 0x0498: "{5B}: Arrrrgh!  All I wanted was{57}a few,	measly treasures!  Now{57}We're dead broke!{62}"
					; 0x844C: PRINT	MSG 0x0499: "{5B}: This	is another fine	mess{57}you've gotten me into!!{62}"
					; 0x844D: PRINT	MSG 0x049A: "{5B}: The way we could afford{57}to go back to the	continent{57}was on the	prison ship,{62}"
					; 0x844E: PRINT	MSG 0x049B: "{5B}: so I	had them arrest	me!{57}But, phew!  What	a stink!{57}I can't stand it in here!{62}"
					; 0xE44F: PRINT	MSG 0x049C, MSGBOX CLEARED, END: "{5B}:	Stinky...slimy...YUK!!{57}Jailor!{57}Gimme a better room!!{5E}"
		ScriptID    $4B9,$2	; Flag set:   Run text script at offset	0x028090
					; 0xE450: PRINT	MSG 0x049D, MSGBOX CLEARED, END: "{5B}:	I won't forget you{57}for this, Nigel!!  I swear one{57}day I'll pay you back!!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $12		; Params 00, 12
		ScriptID    $4BA,$1	; Run text script at offset 0x028092
					; 0xE451: PRINT	MSG 0x049E, MSGBOX CLEARED, END: "{5B}:	...burp!...{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $4BB,$3	; Run text script at offset 0x028094
					; 0xE452: PRINT	MSG 0x049F, MSGBOX CLEARED, END: "{5B}:	Give me	those treasures!{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $4BC,$5	; Run text script at offset 0x028096
					; 0xE453: PRINT	MSG 0x04A0, MSGBOX CLEARED, END: "{5B}:	Stiiiiinky...{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0030:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $12		; Params 00, 12
		ScriptID    $4BD,$1	; Run text script at offset 0x028098
					; 0xE454: PRINT	MSG 0x04A1, MSGBOX CLEARED, END: "{5B}:	...BURRRRP!!...{5E}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $7CE,$3	; Run text script at offset 0x0286BA
					; 0xE661: PRINT	MSG 0x06AE, MSGBOX CLEARED, END: "{5B}:	Help meeee!{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $4BE,$5	; Run text script at offset 0x02809A
					; 0xE455: PRINT	MSG 0x04A2, MSGBOX CLEARED, END: "{5B}:	Slimeeeee...{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0031:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4BF,$0	; Run text script at offset 0x02809C
					; 0x1831: LOAD CHARACTER SCRIPT	Duke (0x0031)
					; 0x8456: PRINT	MSG 0x04A3: "{5B}: All right, already!	Such{57}superior swordsmanship...{57}I was wrong, you convinced	me!{62}"
					; 0xE457: PRINT	MSG 0x04A4, MSGBOX CLEARED, END: "{5B}:	Go ahead, take the treasures.{57}They're all yours, if you'll{57}just stop hitting me!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0032:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $10		; Params 00, 10
		ScriptJump  CS_0032_0,$1 ; Jump	to address 0x0271A4
					;
		dc.w $11		; Params 00, 11
		ScriptID    $43F,$3	; Run text script at offset 0x027F9C
					; 0xE3E0: PRINT	MSG 0x042D, MSGBOX CLEARED, END: "{5B}:	A dinner party!{57}Do they serve any of	my{57}favorites, like raw meat?{5E}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $440,$5	; Run text script at offset 0x027F9E
					; 0x83E1: PRINT	MSG 0x042E: "{5B}: You may tag along{57}behind me tomorrow{57}if you want.{62}"
					; 0xE3E2: PRINT	MSG 0x042F, MSGBOX CLEARED, END: "{5B}:	It must	be kind	of a{57}burden to be so	puny!{5E}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $442,$7	; Run text script at offset 0x027FA2
					; 0x7CFA: LOAD CUSTOM ACTION 0xFA (0x1000003E7 CSA_00FA), MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0032_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C9		; Bit 1	of flag	0x019
		ScriptJump  CS_0032_1,$1 ; Flag	clear: Jump to address 0x0271B0
		ScriptID    $43E,$2	; Flag set:   Run text script at offset	0x027F9A
					; 0xE3DF: PRINT	MSG 0x042C, MSGBOX CLEARED, END: "{5B}:	This gorgeous castle is{57}well	worth exploring.....{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0032_1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $439,$0	; Prompt:	Run text script	at offset 0x027F90
					; 0x83DA: PRINT	MSG 0x0427: "{5B}: Nigel, hmm...I'm sure I've{57}heard that name before....{57}Of course!  You're the one who{62}"
					; 0xA3DB: PRINT	MSG 0x0428, END: "{5B}:	stole the Statue of{57}Jypta, aren't you?{58}"
		ScriptID    $43B,$1	; Answer 'yes': Run text script at offset 0x027F94
					; 0xE3DC: PRINT	MSG 0x0429, MSGBOX CLEARED, END: "{5B}:	I knew it!  But	don't{57}worry...your secret's safe{57}with me.....{62}"
		ScriptID    $43C,$2	; Answer 'no':  Run text script at offset 0x027F96
					; 0x83DD: PRINT	MSG 0x042A: "{5B}: Yes,	you are!{57}A veteran bounty hunter can{57}easily tell his fellow thief!{62}"
					; 0xE3DE: PRINT	MSG 0x042B, MSGBOX CLEARED, END: "{5B}:	But don't worry!  The{57}5000 Gold reward for your{57}head is peanuts to me!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0033:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $10		; Params 00, 10
		ScriptID    $443,$1	; Run text script at offset 0x027FA4
					; 0xE3E3: PRINT	MSG 0x0430, MSGBOX CLEARED, END: "{5B}:	Duke Mercator was a{57}famous swordsman	in Gamoor.{57}I	look up	to him.{5E}"
					;
		dc.w $11		; Params 00, 11
		ScriptID    $444,$3	; Run text script at offset 0x027FA6
					; 0x83E4: PRINT	MSG 0x0431: "{5B}: To be invited by the	duke{57}is a great honor!  I waited{57}over 20 years to	get{62}"
					; 0xE3E5: PRINT	MSG 0x0432, MSGBOX CLEARED, END: "{5B}:	this chance...but you look{57}very young!  How old are you?{5E}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $446,$5	; Run text script at offset 0x027FAA
					; 0xE3E6: PRINT	MSG 0x0433, MSGBOX CLEARED, END: "{5B}:	I would	give my	life to	be{57}of any service to	him!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0034:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $16		; Params 00, 16
		ScriptID    $4C6,$1	; Run text script at offset 0x0280AA
					; 0xE45A: PRINT	MSG 0x04A7, MSGBOX CLEARED, END: "{5B}:	You came here just{57}following	his words...{57}How innocent you are...!{5E}"
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
		dc.w $18		; Params 00, 18
		ScriptID    $4D8,$1	; Run text script at offset 0x0280CE
					; 0xE468: PRINT	MSG 0x04B5, MSGBOX CLEARED, END: "{5B}:	Bow-wow{5E}"
					;
		dc.w $19		; Params 00, 19
		ScriptID    $4D9,$3	; Run text script at offset 0x0280D0
					; 0xE469: PRINT	MSG 0x04B6, MSGBOX CLEARED, END: "{5B}:	I shall	never forget{57}your kindness!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0038:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $18		; Params 00, 18
		ScriptID    $4DA,$1	; Run text script at offset 0x0280D2
					; 0x7CC6: LOAD CUSTOM ACTION 0xC6 (0x100000317 CSA_00C6), MSGBOX CLEARED, END
					;
		dc.w $19		; Params 00, 19
		ScriptID    $83E,$3	; Run text script at offset 0x02879A
					; 0xE6A8: PRINT	MSG 0x06F5, MSGBOX CLEARED, END: "{5B}:	Visit me anytime!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0039:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DF		; Bit 7	of flag	0x01B
		ScriptID    $894,$1	; Flag clear: Run text script at offset	0x028846
					; 0x86D7: PRINT	MSG 0x0724: "{5B}: My name is Assala.{57}I was once a famous{57}swordsman.{62}"
					; 0x86D8: PRINT	MSG 0x0725: "{5B}: I used to work at the{57}castle, but	retired.  I didn't{57}like town life.{62}"
					; 0x86D9: PRINT	MSG 0x0726: "{5B}: Are you a treasure{57}hunter?  Then you must	need{57}a better sword than that...{62}"
					; 0x0001: LOAD 0x0001 INTO 0xFF1196 (Magic{6A}Sword)
					; 0x17E8: RECEIVE ITEM [0xFF1196]
					; 0x1839: LOAD CHARACTER SCRIPT	Kado (0x0039)
					; 0x86DA: PRINT	MSG 0x0727: "{5B}: It has a special{57}power.  When the	sword is{57}fully charged, a magic{62}"
					; 0x86DB: PRINT	MSG 0x0728: "{5B}: flame will burn any{57}enemy	it touches!{62}"
					; 0xE6DC: PRINT	MSG 0x0729, MSGBOX CLEARED, END: "{5B}:	I think	you can{57}appreciate the value{57}of the sword.{62}"
		ScriptJump  CS_0039_0,$2 ; Flag	set:   Jump to address 0x027204
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0039_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E3		; Bit 3	of flag	0x01C
		ScriptID    $89D,$1	; Flag clear: Run text script at offset	0x028858
					; 0x86DD: PRINT	MSG 0x072A: "{5B}: How do you like it?{62}"
					; 0x86DE: PRINT	MSG 0x072B: "{5B}: There are other magic{57}swords somewhere on{57}this	island.{62}"
					; 0x0403: LOAD 0x0003 INTO 0xFF1198 (Thunder{6A}Sword)
					; 0x0802: LOAD 0x0002 INTO 0xFF119A (Sword of{6A}Ice)
					; 0x86DF: PRINT	MSG 0x072C: "{5B}: They	are called{57}{5F} and {5F}...{62}"
					; 0xE6E0: PRINT	MSG 0x072D, MSGBOX CLEARED, END: "{5B}:	Also, I	don't know if it's{57}true, but there's supposed{57}to be a legendary Gaia Sword!{5E}"
		ScriptID    $89C,$2	; Flag set:   Run text script at offset	0x028856
					; 0xE6DC: PRINT	MSG 0x0729, MSGBOX CLEARED, END: "{5B}:	I think	you can{57}appreciate the value{57}of the sword.{62}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_003A:
		move.w	#ITM_SUNSTONE,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	CS_003A_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4D5,$0	; Run text script at offset 0x0280C8
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0x8466: PRINT	MSG 0x04B3: "{5B}: You've  found the {5F}!{62}"
					; 0xE467: PRINT	MSG 0x04B4, MSGBOX CLEARED, END: "{5B}:	Perhaps	you know this{57}forest	better than me!	 Will{57}you take my place?{5E}"
; ---------------------------------------------------------------------------
		bra.s	CS_003A_1
; ---------------------------------------------------------------------------

CS_003A_0:				; CODE XREF: ROM:00027218j
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D7		; Bit 7	of flag	0x01A
		ScriptID    $4C7,$1	; Flag clear: Run text script at offset	0x0280AC
					; 0x845B: PRINT	MSG 0x04A8: "{5B}: My name is Old Gol.{57}I'm the keeper of Greenmaze.{57}My father was{62}"
					; 0x845C: PRINT	MSG 0x04A9: "{5B}: once	a keeper, too.{57}What can I do	for you?{62}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0x081E: LOAD 0x001E INTO 0xFF119A (Sun{6A}Stone)
					; 0x845D: PRINT	MSG 0x04AA: "{5B}:{5F},	hmmmm...{57}Yes, it's hidden in the depths{57}of this forest, but...{62}"
					; 0x845E: PRINT	MSG 0x04AB: "{5B}: The naughty little gnomes{57}that live here have{57}changed the routes{62}"
					; 0xA45F: PRINT	MSG 0x04AC, END: "{5B}:	Do you need tips about{57}walking in the woods?{58}"
		ScriptID    $4CD,$2	; Flag set:   Run text script at offset	0x0280B8
					; 0xA45F: PRINT	MSG 0x04AC, END: "{5B}:	Do you need tips about{57}walking in the woods?{58}"
; ---------------------------------------------------------------------------
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptJump  CS_NULL,$0	; Prompt:	Jump to	address	0x037148
		ScriptID    $4CE,$1	; Answer 'yes': Run text script at offset 0x0280BA
					; 0x8460: PRINT	MSG 0x04AD: "{5B}: First, don't look at the{57}bottom of the trees.  If{57}you see a gap between{62}"
					; 0x8461: PRINT	MSG 0x04AE: "{5B}: the tops of two lines of{57}trees, it might be a route.{57}If you get stuck there,{62}"
					; 0x8462: PRINT	MSG 0x04AF: "{5B}: try jumping up.  There{57}might be a	hidden step or{57}obstacle in front of you{62}"
					; 0x8463: PRINT	MSG 0x04B0: "{5B}: Also, there are many{57}underpasses.	 Some are{57}shortcuts,	and some are not.{62}"
					; 0x8464: PRINT	MSG 0x04B1: "{5B}: You should memorize the{57}surroundings before going{57}down	the underpass.{62}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0xE465: PRINT	MSG 0x04B2, MSGBOX CLEARED, END: "{5B}:	The {5F} is in{57}the northeast	sector of{57}this forest.{5E}"
		ScriptID    $4D3,$2	; Answer 'no':  Run text script at offset 0x0280C4
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0xE465: PRINT	MSG 0x04B2, MSGBOX CLEARED, END: "{5B}:	The {5F} is in{57}the northeast	sector of{57}this forest.{5E}"
; ---------------------------------------------------------------------------

CS_003A_1:				; CODE XREF: ROM:0002721Ej
		rts
; ---------------------------------------------------------------------------

CS_013F:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4C5,$0	; Run text script at offset 0x0280A8
					; 0x7C81: LOAD CUSTOM ACTION 0x81 (0x100000203 CSA_0081), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0140:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4DB,$0	; Run text script at offset 0x0280D4
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0x846A: PRINT	MSG 0x04B7: "{5B}: Hi, nice to meet you.{57}I can't see you, but you look{57}fine.  Something to eat?{62}"
					; 0x846B: PRINT	MSG 0x04B8: "{5B}: I can't see you, but{57}you look happy.  Visit me{57}anytime you like.{62}"
					; 0xE46C: PRINT	MSG 0x04B9, MSGBOX CLEARED, END: "{5B}:	I can't see you, but{57}you look brave.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_003B:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4DF,$0	; Run text script at offset 0x0280DC
					; 0xE46D: PRINT	MSG 0x04BA, MSGBOX CLEARED, END: "{5B}:	Good afternoon.{57}Make	yourself at home.{57}Ho	ho ho...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_003C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $4E0,$1	; Run text script at offset 0x0280DE
					; 0xE46E: PRINT	MSG 0x04BB, MSGBOX CLEARED, END: "{5B}:	Arf!  Arf!{57}Bow-wow-wow!M"
					;
		dc.w $201		; Params 02, 01
		ScriptID    $4E3,$3	; Run text script at offset 0x0280E4
					; 0xE471: PRINT	MSG 0x04BE, MSGBOX CLEARED, END: "{5B}:	I want to see Bell!{57}I want to see Bell!{5E}"
					;
		dc.w $202		; Params 02, 02
		ScriptID    $4E1,$5	; Run text script at offset 0x0280E0
					; 0xE46F: PRINT	MSG 0x04BC, MSGBOX CLEARED, END: "{5B}:	We cannot return to{57}our original forms until	that{57}miserable witch	is defeated.{5E}"
					;
		dc.w $203		; Params 02, 03
		ScriptID    $4E2,$7	; Run text script at offset 0x0280E2
					; 0xE470: PRINT	MSG 0x04BD, MSGBOX CLEARED, END: "{5B}:	Thanks again for{57}all	you've done!{5E}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0141:
		move.w	#$138,(g_Character).l
		rts
; ---------------------------------------------------------------------------

CS_0142:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $14D		; Bit 5	of flag	0x029
		ScriptJump  CS_0142_0,$1 ; Flag	set:   Jump to address 0x027274
		ScriptID    $A13,$2	; Flag clear: Run text script at offset	0x028B44
					; 0x14E0: SET BIT 0 OF FLAG 0x01C
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0x87C5: PRINT	MSG 0x0812: "{5B}: You need a raft.{57}If you want to go down the{57}river, find my son	and{62}"
					; 0x042F: LOAD 0x002F INTO 0xFF1198 (Logs)
					; 0xE7C6: PRINT	MSG 0x0813, MSGBOX CLEARED, END: "{5B}:	get some {5F}.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0142_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $15B		; Bit 3	of flag	0x02B
		ScriptID    $A1B,$1	; Flag set:   Run text script at offset	0x028B54
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE7C8: PRINT	MSG 0x0815, MSGBOX CLEARED, END: "{5B}:	Take care of yourself!{5E}"
		ScriptID    $A18,$2	; Flag clear: Run text script at offset	0x028B4E
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0x042F: LOAD 0x002F INTO 0xFF1198 (Logs)
					; 0xE7C7: PRINT	MSG 0x0814, MSGBOX CLEARED, END: "{5B}:	You can	go ahead{57}with the {5F}!{57}Good luck!{5E}"
; ---------------------------------------------------------------------------
		rts
