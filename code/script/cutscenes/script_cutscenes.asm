; ---------------------------------------------------------------------------

XS_001B:
		move.w	#$0021,d0
		bsr.w	TestFlagBit
		bne.s	loc_2736E
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $5A9,$0		  ; Prompt:	  Run text script at offset 0x028348
						  ; 0x1BE9: LOAD SPECIAL CHARACTER Friday (0x01)
						  ; 0xA513: PRINT MSG 0x0560, END: "{5B}Are you	going to{57}the	thieves' hideout?{58}"
		ScriptID    $5AB,$1		  ; Answer 'yes': Run text script at offset 0x02834C
						  ; 0xE514: PRINT MSG 0x0561, MSGBOX CLEARED, END: "{5B}Let's go!{5E}"
		ScriptID    $5AC,$2		  ; Answer 'no':  Run text script at offset 0x02834E
						  ; 0xE515: PRINT MSG 0x0562, MSGBOX CLEARED, END: "{5B}Why not?{57}It could be	fun!{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_27378
; ---------------------------------------------------------------------------

loc_2736E:					  ; CODE XREF: ROM:00027360j
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $5AD,$0		  ; Prompt:	  Run text script at offset 0x028350
						  ; 0x1BE9: LOAD SPECIAL CHARACTER Friday (0x01)
						  ; 0xA516: PRINT MSG 0x0563, END: "{5B}Are you	going to{57}the	thieves' hideout?{58}"
		ScriptID    $5AF,$1		  ; Answer 'yes': Run text script at offset 0x028354
						  ; 0xE517: PRINT MSG 0x0564, MSGBOX CLEARED, END: "{5B}Let's go!{5E}"
		ScriptID    $5B0,$2		  ; Answer 'no':  Run text script at offset 0x028356
						  ; 0xE518: PRINT MSG 0x0565, MSGBOX CLEARED, END: "{5B}Right.{57}We don't have to go.{5E}"
; ---------------------------------------------------------------------------

locret_27378:					  ; CODE XREF: ROM:0002736Cj
		rts
; ---------------------------------------------------------------------------

XS_001C:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $5B1,$0		  ; Prompt:	  Run text script at offset 0x028358
						  ; 0x1BE9: LOAD SPECIAL CHARACTER Friday (0x01)
						  ; 0xA519: PRINT MSG 0x0566, END: "{5B}Are you	going back{57}to town?{58}"
		ScriptID    $5B3,$1		  ; Answer 'yes': Run text script at offset 0x02835C
						  ; 0xE51A: PRINT MSG 0x0567, MSGBOX CLEARED, END: "{5B}OK!  Let's go!{5E}"
		ScriptID    $5B4,$2		  ; Answer 'no':  Run text script at offset 0x02835E
						  ; 0xE51B: PRINT MSG 0x0568, MSGBOX CLEARED, END: "{5B}We have	a lot left{57}to do here.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_002A:					  ; Trap00Handler
		trap	#$00
; ---------------------------------------------------------------------------
		dc.w SND_NigelDie
; ---------------------------------------------------------------------------
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $5F9,$0		  ; Run	text script at offset 0x0283E8
						  ; 0x0027: LOAD 0x0027	INTO 0xFF1196 (Litho-graph)
						  ; 0x853E: PRINT MSG 0x058B: "Nigel handed over the {5F}.{5E}"
						  ; 0x182E: LOAD CHARACTER SCRIPT Kayla	(0x002E)
						  ; 0xE53F: PRINT MSG 0x058C, MSGBOX CLEARED, END: "{5B}Hahahahaha!  Good boy!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_002E:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $60A,$0		  ; Run	text script at offset 0x02840A
						  ; 0x181D: LOAD CHARACTER SCRIPT Purin	(0x001D)
						  ; 0x8548: PRINT MSG 0x0595: "{5B}Hello.  I'm Purin.{57}I'm twelve.  Madame Yard is my{57}mom.  Wanna play?{62}"
						  ; 0xA549: PRINT MSG 0x0596, END: "{5B}I like you!{57}Would you be my boyfriend?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		rts
; ---------------------------------------------------------------------------

XS_0036:
		move.w	#$0023,d0
		bsr.w	TestFlagBit
		bne.s	loc_273AE

loc_273A4:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $253,$0		  ; Run	text script at offset 0x027C9C
						  ; 0x18AA: LOAD CHARACTER SCRIPT * (0x00AA)
						  ; 0xE223: PRINT MSG 0x0270, MSGBOX CLEARED, END: "{5B}If ya ain't got a{57}safe-conduct pass, ya ain't{57}gettin' in these gates!{5E}"
; ---------------------------------------------------------------------------

loc_273A8:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $257,$0		  ; Run	text script at offset 0x027CA4
						  ; 0x18AB: LOAD CHARACTER SCRIPT * (0x00AB)
						  ; 0xE226: PRINT MSG 0x0273, MSGBOX CLEARED, END: "{5B}My legs	are sore from{57}standing here all day long.{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_273E6
; ---------------------------------------------------------------------------

loc_273AE:					  ; CODE XREF: ROM:000273A2j
		move.l	d0,-(sp)

loc_273B0:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $61E,$0		  ; Run	text script at offset 0x028432
						  ; 0x18AA: LOAD CHARACTER SCRIPT * (0x00AA)
						  ; 0x8553: PRINT MSG 0x05A0: "{5B}You can come	in now,{57}but...{62}"
						  ; 0x8554: PRINT MSG 0x05A1: "{5B}you can't pass this gate{57}for free!   Heh, heh, heh...{62}"
						  ; 0x8555: PRINT MSG 0x05A2: "{5B}Listen.  I'm a little{57}strapped for cash, and{57}baby needs a new pair{62}"
						  ; 0x8556: PRINT MSG 0x05A3: "{5B}of shoes...{62}"
						  ; 0x10C8: LOAD 200 INTO NUMERIC VARIABLE
						  ; 0xA557: PRINT MSG 0x05A4, END: "{5B}Heh heh...I'll letcha in{57}for {5A} golds.  Whaddaya say?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	loc_273E0
		move.l	(g_PrintNumericDwordValue).l,d0
		jsr	(j_RemoveGold).l
		bcc.s	loc_273DA
		jsr	(j_GetGold).l
		jsr	(j_RemoveGold).l

loc_273D4:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $628,$0		  ; Run	text script at offset 0x028446
						  ; 0xE55B: PRINT MSG 0x05A8, MSGBOX CLEARED, END: "{5B}...Is that all?{57}OK, go ahead!{5E}"
; ---------------------------------------------------------------------------
		bra.s	loc_273DE
; ---------------------------------------------------------------------------

loc_273DA:					  ; CODE XREF: ROM:000273C6j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $625,$0		  ; Run	text script at offset 0x028440
						  ; 0x8558: PRINT MSG 0x05A5: "{5B}Hey,	thanks!	 You must be{57}rich!  Hey, tell you what...{57}if you want to double{62}"
						  ; 0x8559: PRINT MSG 0x05A6: "{5B}your	money, there's a place{57}called Greenpea's in town.{57}You may gain, or you may lose.{62}"
						  ; 0xE55A: PRINT MSG 0x05A7, MSGBOX CLEARED, END: "{5B}It all depends on your luck!{5E}"
; ---------------------------------------------------------------------------

loc_273DE:					  ; CODE XREF: ROM:000273D8j
		bra.s	loc_273E4
; ---------------------------------------------------------------------------

loc_273E0:					  ; CODE XREF: ROM:000273B8j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $629,$0		  ; Run	text script at offset 0x028448
						  ; 0xE55C: PRINT MSG 0x05A9, MSGBOX CLEARED, END: "{5B}What a miser!{57}OK, go	ahead!{5E}"
; ---------------------------------------------------------------------------

loc_273E4:					  ; CODE XREF: ROM:loc_273DEj
		move.l	(sp)+,d0

locret_273E6:					  ; CODE XREF: ROM:000273ACj
		rts
; ---------------------------------------------------------------------------

XS_0037:
		move.l	d0,-(sp)

loc_273EA:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $62A,$0		  ; Run	text script at offset 0x02844A
						  ; 0x1BF6: LOAD SPECIAL CHARACTER Fahl	(0x0E)
						  ; 0x855D: PRINT MSG 0x05AA: "{5B}I'm a master of{57}martial arts!  I can give you{57}a lesson if you want.{62}"
						  ; 0xA55E: PRINT MSG 0x05AB, END: "{5B}Will you challenge me?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	loc_27436

loc_273F4:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $62D,$0		  ; Run	text script at offset 0x028450
						  ; 0x1014: LOAD 20 INTO NUMERIC VARIABLE
						  ; 0xA55F: PRINT MSG 0x05AC, END: "{5B}Now, pay me{57}{5A} golds, OK?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	loc_27436
		move.l	(g_PrintNumericDwordValue).l,d0
		jsr	(j_RemoveGold).l
		bcc.s	loc_27418

loc_2740C:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $62F,$0		  ; Run	text script at offset 0x028454
						  ; 0xE560: PRINT MSG 0x05AD, MSGBOX CLEARED, END: "{5B}I'm sorry, but it's{57}my job.  I can't do it if you{57}don't have enough money.{5E}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	loc_27432
; ---------------------------------------------------------------------------

loc_27418:					  ; CODE XREF: ROM:0002740Aj
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $631,$0		  ; Run	text script at offset 0x028458
						  ; 0xA562: PRINT MSG 0x05AF, END: "{5B}Do you want to hear{57}the rules?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	loc_27428

loc_27422:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
word_27424:	ScriptID    $632,$0		  ; Run	text script at offset 0x02845A
						  ; 0x8563: PRINT MSG 0x05B0: "{5B}I'll change into various{57}monsters who will attack you{57}one after the other.{62}"
						  ; 0x8564: PRINT MSG 0x05B1: "{5B}I'll evaluate your{57}skill by the number of{57}monsters you defeat{62}"
						  ; 0x8565: PRINT MSG 0x05B2: "{5B}without getting hit.{57}Once	you get	hit, it's over.{62}"
						  ; 0x8566: PRINT MSG 0x05B3: "{5B}Your	reward will be based on{57}the number of monsters you kill.{57}Got it?{62}"
						  ; 0xE567: PRINT MSG 0x05B4, MSGBOX CLEARED, END: "{5B}Now, ready...{59}set...{59}GO!{5E}"
; ---------------------------------------------------------------------------
		bra.s	loc_2742C
; ---------------------------------------------------------------------------

loc_27428:					  ; CODE XREF: ROM:00027420j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $637,$0		  ; Run	text script at offset 0x028464
						  ; 0xE568: PRINT MSG 0x05B5, MSGBOX CLEARED, END: "{5B}Now, ready...{59}set..{59}GO!{5E}"
; ---------------------------------------------------------------------------

loc_2742C:					  ; CODE XREF: ROM:00027426j
		st	(g_YesNoPromptResult).l

loc_27432:					  ; CODE XREF: ROM:00027416j
						  ; ROM:0002743Aj
		move.l	(sp)+,d0
		rts
; ---------------------------------------------------------------------------

loc_27436:					  ; CODE XREF: ROM:000273F2j
						  ; ROM:000273FCj
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $630,$0		  ; Run	text script at offset 0x028456
						  ; 0xE561: PRINT MSG 0x05AE, MSGBOX CLEARED, END: "{5B}Take care of yourself!{5E}"
; ---------------------------------------------------------------------------
		bra.s	loc_27432
; ---------------------------------------------------------------------------

XS_0038:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $638,$0		  ; Prompt:	  Run text script at offset 0x028466
						  ; 0x1BF6: LOAD SPECIAL CHARACTER Fahl	(0x0E)
						  ; 0x8569: PRINT MSG 0x05B6: "{5B}Well	done!  You're quite{57}talented.  Still, you must{57}become much stronger!{62}"
						  ; 0x1019: LOAD 25 INTO NUMERIC VARIABLE
						  ; 0x856A: PRINT MSG 0x05B7: "{5B}I'll give you {5A} golds{57}if you stop now.{62}"
						  ; 0xA56B: PRINT MSG 0x05B8, END: "{5B}Will you go on?{57}{58}"
		ScriptJump  ClearTextbox_0,$1	  ; Answer 'yes': Jump to address 0x028FB8
		ScriptID    $63D,$2		  ; Answer 'no':  Run text script at offset 0x028470
						  ; 0x856C: PRINT MSG 0x05B9: "{5B}{5A}	golds.	Take them!{62}"
						  ; 0x17E9: RECEIVE [NUMERIC_VAR] GOLDS
						  ; 0x1BF6: LOAD SPECIAL CHARACTER Fahl	(0x0E)
						  ; 0xE56D: PRINT MSG 0x05BA, MSGBOX CLEARED, END: "{5B}You may	come anytime!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0039:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $641,$0		  ; Prompt:	  Run text script at offset 0x028478
						  ; 0x1BF6: LOAD SPECIAL CHARACTER Fahl	(0x0E)
						  ; 0x856E: PRINT MSG 0x05BB: "{5B}You may be stronger{57}than the soldiers guarding{57}the castle...{62}"
						  ; 0x1032: LOAD 50 INTO NUMERIC VARIABLE
						  ; 0x856F: PRINT MSG 0x05BC: "{5B}I'll give you {5A} golds{57}if you stop now.{62}"
						  ; 0xA570: PRINT MSG 0x05BD, END: "{5B}Want to	continue?{57}{58}"
		ScriptJump  ClearTextbox_0,$1	  ; Answer 'yes': Jump to address 0x028FB8
		ScriptID    $63D,$2		  ; Answer 'no':  Run text script at offset 0x028470
						  ; 0x856C: PRINT MSG 0x05B9: "{5B}{5A}	golds.	Take them!{62}"
						  ; 0x17E9: RECEIVE [NUMERIC_VAR] GOLDS
						  ; 0x1BF6: LOAD SPECIAL CHARACTER Fahl	(0x0E)
						  ; 0xE56D: PRINT MSG 0x05BA, MSGBOX CLEARED, END: "{5B}You may	come anytime!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003A:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $646,$0		  ; Prompt:	  Run text script at offset 0x028482
						  ; 0x1BF6: LOAD SPECIAL CHARACTER Fahl	(0x0E)
						  ; 0x8571: PRINT MSG 0x05BE: "{5B}Excellent!!{57}You don't need anymore{57}training!{62}"
						  ; 0x1064: LOAD 100 INTO NUMERIC VARIABLE
						  ; 0xA572: PRINT MSG 0x05BF, END: "{5B}Take {5A} golds!{57}Still want to continue?{58}"
		ScriptJump  ClearTextbox_0,$1	  ; Answer 'yes': Jump to address 0x028FB8
		ScriptID    $63D,$2		  ; Answer 'no':  Run text script at offset 0x028470
						  ; 0x856C: PRINT MSG 0x05B9: "{5B}{5A}	golds.	Take them!{62}"
						  ; 0x17E9: RECEIVE [NUMERIC_VAR] GOLDS
						  ; 0x1BF6: LOAD SPECIAL CHARACTER Fahl	(0x0E)
						  ; 0xE56D: PRINT MSG 0x05BA, MSGBOX CLEARED, END: "{5B}You may	come anytime!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003B:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $64A,$0		  ; Prompt:	  Run text script at offset 0x02848A
						  ; 0x1BF6: LOAD SPECIAL CHARACTER Fahl	(0x0E)
						  ; 0x8573: PRINT MSG 0x05C0: "{5B}I give up!  You're the{57}strongest man I've ever met!{62}"
						  ; 0x10C8: LOAD 200 INTO NUMERIC VARIABLE
						  ; 0xA574: PRINT MSG 0x05C1, END: "{5B}Please...take the{57}{5A} golds.  Want to go on?{58}"
		ScriptJump  ClearTextbox_0,$1	  ; Answer 'yes': Jump to address 0x028FB8
		ScriptID    $63D,$2		  ; Answer 'no':  Run text script at offset 0x028470
						  ; 0x856C: PRINT MSG 0x05B9: "{5B}{5A}	golds.	Take them!{62}"
						  ; 0x17E9: RECEIVE [NUMERIC_VAR] GOLDS
						  ; 0x1BF6: LOAD SPECIAL CHARACTER Fahl	(0x0E)
						  ; 0xE56D: PRINT MSG 0x05BA, MSGBOX CLEARED, END: "{5B}You may	come anytime!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003C:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $64E,$0		  ; Prompt:	  Run text script at offset 0x028492
						  ; 0x1BF6: LOAD SPECIAL CHARACTER Fahl	(0x0E)
						  ; 0x8575: PRINT MSG 0x05C2: "{5B}P....{59}please...{59}{57}I'm almost...{57}worn out...{62}"
						  ; 0x1190: LOAD 400 INTO NUMERIC VARIABLE
						  ; 0xA576: PRINT MSG 0x05C3, END: "{5B}Take the {5A} golds...{57}...You STILL want to go on?{58}"
		ScriptJump  ClearTextbox_0,$1	  ; Answer 'yes': Jump to address 0x028FB8
		ScriptID    $63D,$2		  ; Answer 'no':  Run text script at offset 0x028470
						  ; 0x856C: PRINT MSG 0x05B9: "{5B}{5A}	golds.	Take them!{62}"
						  ; 0x17E9: RECEIVE [NUMERIC_VAR] GOLDS
						  ; 0x1BF6: LOAD SPECIAL CHARACTER Fahl	(0x0E)
						  ; 0xE56D: PRINT MSG 0x05BA, MSGBOX CLEARED, END: "{5B}You may	come anytime!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003F:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
word_2747A:	ScriptID    $65E,$0		  ; Run	text script at offset 0x0284B2
						  ; 0x181B: LOAD CHARACTER SCRIPT Owner	(0x001B)
						  ; 0x857C: PRINT MSG 0x05C9: "{5B}Welcome to Greenpea's!{57}Step right up!  Have some{57}fun!  Make some money!{62}"
						  ; 0x1032: LOAD 50 INTO NUMERIC VARIABLE
						  ; 0xA57D: PRINT MSG 0x05CA, END: "{5B}{5A} golds for one play.{57}Okay?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	loc_27488

loc_27482:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $665,$0		  ; Run	text script at offset 0x0284C0
						  ; 0xE580: PRINT MSG 0x05CD, MSGBOX CLEARED, END: "{5B}Are you	nuts?{57}Don't you like gambling?{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_274BC
; ---------------------------------------------------------------------------

loc_27488:					  ; CODE XREF: ROM:00027480j
		move.l	(g_PrintNumericDwordValue).l,d0
		jsr	(j_RemoveGold).l
		bcc.s	loc_274A2

loc_27496:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $664,$0		  ; Run	text script at offset 0x0284BE
						  ; 0xE57F: PRINT MSG 0x05CC, MSGBOX CLEARED, END: "{5B}Oops!{57}Come again when{57}you	have more money!{5E}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	locret_274BC
; ---------------------------------------------------------------------------

loc_274A2:					  ; CODE XREF: ROM:00027494j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $662,$0		  ; Run	text script at offset 0x0284BA
						  ; 0x181B: LOAD CHARACTER SCRIPT Owner	(0x001B)
						  ; 0xA57E: PRINT MSG 0x05CB, END: "{5B}Thanks!	 Do you	need to{57}know	how to play?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	loc_274B2

loc_274AC:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $666,$0		  ; Run	text script at offset 0x0284C2
						  ; 0x8581: PRINT MSG 0x05CE: "{5B}Throw the ball over{57}the counter so it lands on{57}the moving plates.{62}"
						  ; 0x8582: PRINT MSG 0x05CF: "{5B}The faster the plate	your{57}ball lands on, the more{57}money you win!  400,	100, 50.{62}"
						  ; 0x8583: PRINT MSG 0x05D0: "{5B}If the ball slides off,{57}you lose!	 You have only{57}one throw.{62}"
						  ; 0xE584: PRINT MSG 0x05D1, MSGBOX CLEARED, END: "{5B}Are you	ready?{57}Okay!	 Then, let's go!{5E}"
; ---------------------------------------------------------------------------
		bra.s	loc_274B6
; ---------------------------------------------------------------------------

loc_274B2:					  ; CODE XREF: ROM:000274AAj
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $66A,$0		  ; Run	text script at offset 0x0284CA
						  ; 0xE585: PRINT MSG 0x05D2, MSGBOX CLEARED, END: "{5B}Now, let's try!{5E}"
; ---------------------------------------------------------------------------

loc_274B6:					  ; CODE XREF: ROM:000274B0j
		st	(g_YesNoPromptResult).l

locret_274BC:					  ; CODE XREF: ROM:00027486j
						  ; ROM:000274A0j
		rts
; ---------------------------------------------------------------------------

XS_0042:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $672,$0		  ; Run	text script at offset 0x0284DA
						  ; 0x18D0: LOAD CHARACTER SCRIPT * (0x00D0)
						  ; 0x858A: PRINT MSG 0x05D7: "{5B}You look so powerful.{57}If I promise to pay	you,{62}"
						  ; 0xA58B: PRINT MSG 0x05D8, END: "{5B}would you do me	a favor?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	loc_274CE

loc_274C8:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $675,$0		  ; Run	text script at offset 0x0284E0
						  ; 0x18D0: LOAD CHARACTER SCRIPT * (0x00D0)
						  ; 0x858C: PRINT MSG 0x05D9: "{5B}The room upstairs is{57}a mess.  Would you put the{57}jars on the shelves neatly?{62}"
						  ; 0xE58D: PRINT MSG 0x05DA, MSGBOX CLEARED, END: "{5B}Collecting jars	is{57}my husband's hobby....{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_274D2
; ---------------------------------------------------------------------------

loc_274CE:					  ; CODE XREF: ROM:000274C6j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $678,$0		  ; Run	text script at offset 0x0284E6
						  ; 0x18D0: LOAD CHARACTER SCRIPT * (0x00D0)
						  ; 0xE58E: PRINT MSG 0x05DB, MSGBOX CLEARED, END: "{5B}Fine!{57}I'll do it myself.{5E}"
; ---------------------------------------------------------------------------

locret_274D2:					  ; CODE XREF: ROM:000274CCj
		rts
; ---------------------------------------------------------------------------

XS_0043:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $67A,$0		  ; Run	text script at offset 0x0284EA
						  ; 0x140F: SET	BIT 7 OF FLAG 0x001
						  ; 0x18D0: LOAD CHARACTER SCRIPT * (0x00D0)
						  ; 0x858F: PRINT MSG 0x05DC: "{5B}Thank you very much.{57}Here's your reward...{62}"
						  ; 0x1002: LOAD 2 INTO	NUMERIC	VARIABLE
						  ; 0x17E9: RECEIVE [NUMERIC_VAR] GOLDS
						  ; 0x18D0: LOAD CHARACTER SCRIPT * (0x00D0)
						  ; 0xE590: PRINT MSG 0x05DD, MSGBOX CLEARED, END: "{5B}Please help me again.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0046:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $68D,$0		  ; Run	text script at offset 0x028510
						  ; 0x181E: LOAD CHARACTER SCRIPT Arthur (0x001E)
						  ; 0xA598: PRINT MSG 0x05E5, END: "{5B}This is	for you!{62}"
; ---------------------------------------------------------------------------
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicChestOpen
; ---------------------------------------------------------------------------
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $68F,$0		  ; Run	text script at offset 0x028514
						  ; 0x181E: LOAD CHARACTER SCRIPT Arthur (0x001E)
						  ; 0x10FA: LOAD 250 INTO NUMERIC VARIABLE
						  ; 0xA599: PRINT MSG 0x05E6, END: "Arthur's henchman{57}got {5A} golds.{62}"
; ---------------------------------------------------------------------------
		jsr	(j_RestoreBGM).l
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $692,$0		  ; Run	text script at offset 0x02851A
						  ; 0x181E: LOAD CHARACTER SCRIPT Arthur (0x001E)
						  ; 0x859A: PRINT MSG 0x05E7: "{5B}If the duke calls for me,{57}make up	some excuse and{57}manage it as	you see	fit.{62}"
						  ; 0x18E9: LOAD CHARACTER SCRIPT * (0x00E9)
						  ; 0xE59B: PRINT MSG 0x05E8, MSGBOX CLEARED, END: "{5B}Understood!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0048:					  ; Any	status effect
		moveq	#$0000000F,d0
		bsr.w	TestPlayerStatus
		beq.s	loc_27506

loc_274FA:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $69F,$0		  ; Run	text script at offset 0x028534
						  ; 0x1813: LOAD CHARACTER SCRIPT Teller (0x0013)
						  ; 0xE5A1: PRINT MSG 0x05EE, MSGBOX CLEARED, END: "{5B}I can't cast a spell on{57}you now.  Go to the church{57}and get cured first.{5E}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	locret_27510
; ---------------------------------------------------------------------------

loc_27506:					  ; CODE XREF: ROM:000274F8j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $698,$0		  ; Run	text script at offset 0x028526
						  ; 0x141C: SET	BIT 4 OF FLAG 0x003
						  ; 0x1813: LOAD CHARACTER SCRIPT Teller (0x0013)
						  ; 0x859D: PRINT MSG 0x05EA: "{5B}I know, I know.{57}The kids your age	are all{57}dying to get	in!{62}"
						  ; 0xE59E: PRINT MSG 0x05EB, MSGBOX CLEARED, END: "{5B}Your wish is my	command{57}{64}Hammina,	hammena, hammana...{57}{64}Punworg Kool	yob siht Ekam!{5E}"
; ---------------------------------------------------------------------------
		st	(g_YesNoPromptResult).l

locret_27510:					  ; CODE XREF: ROM:00027504j
		rts
; ---------------------------------------------------------------------------

XS_005D:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $00DB			  ; Bit	3 of flag 0x01B
		ScriptID    $6F0,$1		  ; Flag set:	Run text script	at offset 0x0285D6
						  ; 0x1493: SET	BIT 3 OF FLAG 0x012
						  ; 0x85D7: PRINT MSG 0x0624: "{5B}Please don't{57}tell a soul about Julie...{62}"
						  ; 0x85D8: PRINT MSG 0x0625: "{5B}By the way,{57}I think it's time{57}to go to the party.{62}"
						  ; 0xE5D9: PRINT MSG 0x0626, MSGBOX CLEARED, END: "{5B}Why dost thou not go to{57}the banquet room?{5E}"
		ScriptID    $6EF,$2		  ; Flag clear:	Run text script	at offset 0x0285D4
						  ; 0xE5D6: PRINT MSG 0x0623, MSGBOX CLEARED, END: "{5B}Please don't tell{57}a soul about Julie...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_005E:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $6F4,$0		  ; Prompt:	  Run text script at offset 0x0285DE
						  ; 0x182E: LOAD CHARACTER SCRIPT Kayla	(0x002E)
						  ; 0x85DA: PRINT MSG 0x0627: "{5B}Hahahahaha!{57}Nice to meet you again!{57}Hahahahahahaha!{62}"
						  ; 0xA5DB: PRINT MSG 0x0628, END: "{5B}I've been waiting for{57}you!  Now, come here!{58}"
		ScriptJump  ClearTextbox_0,$1	  ; Answer 'yes': Jump to address 0x028FB8
		ScriptID    $6FE,$2		  ; Answer 'no':  Run text script at offset 0x0285F2
						  ; 0x182E: LOAD CHARACTER SCRIPT Kayla	(0x002E)
						  ; 0x85E0: PRINT MSG 0x062D: "{5B}You refused me!{57}I've never been{57}refused before!{62}"
						  ; 0xE5E1: PRINT MSG 0x062E, MSGBOX CLEARED, END: "{5B}Ink!  Wally!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0064:					  ; CODE XREF: ROM:00027532j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $706,$0		  ; Run	text script at offset 0x028602
						  ; 0x1BF1: LOAD SPECIAL CHARACTER Duke	(0x09)
						  ; 0x85E5: PRINT MSG 0x0632: "{5B}As you know,	an evil{57}magician lives in the tower{62}"
						  ; 0x85E6: PRINT MSG 0x0633: "{5B}Just	outside	of town.{57}He's a terrible nuisance{57}to me, and to this town.{62}"
						  ; 0x85E7: PRINT MSG 0x0634: "{5B}The name of this wizard{57}is Mir.  Ever since he{57}settled	in that	tower,{62}"
						  ; 0x85E8: PRINT MSG 0x0635: "{5B}we've been afraid for{57}our very lives...We've done{57}everything he asked.{62}"
						  ; 0x85E9: PRINT MSG 0x0636: "{5B}I sometimes thought{57}of sending soldiers to the{57}tower...but his	strong magic{62}"
						  ; 0x85EA: PRINT MSG 0x0637: "{5B}might have harmed{57}the innocent citizens{57}of Mercator.{62}"
						  ; 0x85EB: PRINT MSG 0x0638: "{5B}So I've been giving{57}him all the golds he wants.{62}"
						  ; 0x85EC: PRINT MSG 0x0639: "{5B}But I will stand for	it{57}no longer!{62}"
						  ; 0x85ED: PRINT MSG 0x063A: "{5B}...Oh, I...beg your pardon!{57}Perhaps I rambled on a bit...{62}"
						  ; 0xA5EE: PRINT MSG 0x063B, END: "{5B}Shall I	say
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	XS_0064

loc_27534:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $711,$0		  ; Run	text script at offset 0x028618
						  ; 0x1BF1: LOAD SPECIAL CHARACTER Duke	(0x09)
						  ; 0x85EF: PRINT MSG 0x063C: "{5B}I think it's time we defeated{57}this Mir.  The peaceful town{57}of Mercator will{62}"
						  ; 0x85F0: PRINT MSG 0x063D: "{5B}never know true peace{57}as long as he lives.{62}"
						  ; 0x85F1: PRINT MSG 0x063E: "{5B}So, I sent for you.{57}I'd like YOU to defeat Mir!{57}Of course, I'm prepared{62}"
						  ; 0x85F2: PRINT MSG 0x063F: "{5B}to offer you	a rich{57}reward.  It so happens I have{57}in my possession the{62}"
						  ; 0x85F3: PRINT MSG 0x0640: "{5B}Golan Emerald, one of the{57}national treasures of{57}this fair land.{62}"
						  ; 0x85F4: PRINT MSG 0x0641: "{5B}Dexter... Zak...and Nigel,{57}you'll be heroes throughout{57}this proud nation{62}"
						  ; 0xE5F5: PRINT MSG 0x0642, MSGBOX CLEARED, END: "{5B}for all	time!  May the{57}goddess help you three!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0069:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $72B,$0		  ; Prompt:	  Run text script at offset 0x02864C
						  ; 0x1BE9: LOAD SPECIAL CHARACTER Friday (0x01)
						  ; 0xA602: PRINT MSG 0x064F, END: "{5B}Nigel, are you going{57}to bed for the night?{58}"
		ScriptJump  ClearTextbox_0,$1	  ; Answer 'yes': Jump to address 0x028FB8
		ScriptID    $72D,$2		  ; Answer 'no':  Run text script at offset 0x028650
						  ; 0x1BE9: LOAD SPECIAL CHARACTER Friday (0x01)
						  ; 0xE603: PRINT MSG 0x0650, MSGBOX CLEARED, END: "{5B}Let's go{57}explore the castle, then.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0073:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $74C,$0		  ; Run	text script at offset 0x02868E
						  ; 0x1064: LOAD 100 INTO NUMERIC VARIABLE
						  ; 0x18F4: LOAD CHARACTER SCRIPT * (0x00F4)
						  ; 0xA615: PRINT MSG 0x0662, END: "{5B}Would you invest{57}{5A} golds in me?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	loc_2756A
		move.l	(g_PrintNumericDwordValue).l,d0
		jsr	(j_RemoveGold).l
		bcs.s	loc_2756A

loc_2755E:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $750,$0		  ; Run	text script at offset 0x028696
						  ; 0x14D2: SET	BIT 2 OF FLAG 0x01A
						  ; 0xE617: PRINT MSG 0x0664, MSGBOX CLEARED, END: "{5B}Thanks,	kid!{57}Wait here, I'll double{57}your money in a jiffy!{5E}"
; ---------------------------------------------------------------------------
		st	(g_YesNoPromptResult).l

locret_27568:					  ; CODE XREF: ROM:00027574j
		rts
; ---------------------------------------------------------------------------

loc_2756A:					  ; CODE XREF: ROM:0002754Ej
						  ; ROM:0002755Cj
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $74F,$0		  ; Run	text script at offset 0x028694
						  ; 0xE616: PRINT MSG 0x0663, MSGBOX CLEARED, END: "{5B}Aren't you interested{57}in the money game?{5E}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	locret_27568
; ---------------------------------------------------------------------------

XS_0075:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $0153			  ; Bit	3 of flag 0x02A
		ScriptID    $755,$1		  ; Flag set:	Run text script	at offset 0x0286A0
						  ; 0x18F1: LOAD CHARACTER SCRIPT * (0x00F1)
						  ; 0xA619: PRINT MSG 0x0666, END: "{5B}Hey, a buyer!{57}You want medicines?{57}Sure, we've got 'em all!{62}"
		ScriptID    $757,$2		  ; Flag clear:	Run text script	at offset 0x0286A4
						  ; 0x18F1: LOAD CHARACTER SCRIPT * (0x00F1)
						  ; 0xA61A: PRINT MSG 0x0667, END: "{5B}Hey, a buyer!{57}You want variety goods?{57}Sure, we've got lots!{62}"
; ---------------------------------------------------------------------------

loc_27580:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $759,$0		  ; Run	text script at offset 0x0286A8
						  ; 0xE61B: PRINT MSG 0x0668, MSGBOX CLEARED, END: "{5B}We've got all kinds{57}of items, and of good{57}quality, too!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0076:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $75A,$0		  ; Prompt:	  Run text script at offset 0x0286AA
						  ; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
						  ; 0x861C: PRINT MSG 0x0669: "{5B}Heh heh heh...{57}Here comes	another	victim...{57}Are you going to enter{62}"
						  ; 0xA61D: PRINT MSG 0x066A, END: "{5B}this Hall of the Undead{57}at all costs?{58}"
		ScriptID    $75D,$1		  ; Answer 'yes': Run text script at offset 0x0286B0
						  ; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
						  ; 0x861E: PRINT MSG 0x066B: "{5B}Brave boy!{57}You have to solve{57}eight riddles in eight rooms.{62}"
						  ; 0x861F: PRINT MSG 0x066C: "{5B}If you correctly solve{57}the riddle	for the	room,{57}the torch will	go out.{62}"
						  ; 0x8620: PRINT MSG 0x066D: "{5B}You can go to the{57}other side of the river	when{57}all eight riddles are solved.{62}"
						  ; 0xE621: PRINT MSG 0x066E, MSGBOX CLEARED, END: "{5B}But, if	you fail...{57}heh heh heh...it'll be{57}the end of your life...{5E}"
		ScriptID    $762,$2		  ; Answer 'no':  Run text script at offset 0x0286BA
						  ; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
						  ; 0xE622: PRINT MSG 0x066F, MSGBOX CLEARED, END: "{5B}Go away!{57}Don't ever come here again!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0077:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $764,$0		  ; Prompt:	  Run text script at offset 0x0286BE
						  ; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
						  ; 0x8623: PRINT MSG 0x0670: "{5B}Heh heh heh...{57}there are still more riddles{57}to	solve over there...{62}"
						  ; 0xA624: PRINT MSG 0x0671, END: "{5B}Do you really want{57}to go across the river?{58}"
		ScriptID    $768,$1		  ; Answer 'yes': Run text script at offset 0x0286C6
						  ; 0xE626: PRINT MSG 0x0673, MSGBOX CLEARED, END: "{5B}OK...heh heh...{57}I'll take you to...{57}Gehenna!!{5E}"
		ScriptID    $767,$2		  ; Answer 'no':  Run text script at offset 0x0286C4
						  ; 0xE625: PRINT MSG 0x0672, MSGBOX CLEARED, END: "{5B}Heh heh	heh...Indeed.{57}You had better	go back...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0079:
		move.w	#ITM_ARMLET,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	loc_275B4

loc_275A8:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $76A,$0		  ; Prompt:	  Run text script at offset 0x0286CA
						  ; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
						  ; 0x8628: PRINT MSG 0x0675: "{5B}...Impossible...{57}How is it you came back alive?{62}"
						  ; 0xA629: PRINT MSG 0x0676, END: "{5B}...Are you going{57}back to town?{58}"
		ScriptID    $76E,$1		  ; Answer 'yes': Run text script at offset 0x0286D2
						  ; 0xE62B: PRINT MSG 0x0678, MSGBOX CLEARED, END: "{5B}...C'mon...{5E}"
		ScriptID    $76D,$2		  ; Answer 'no':  Run text script at offset 0x0286D0
						  ; 0xE62A: PRINT MSG 0x0677, MSGBOX CLEARED, END: "{5B}Do as you like.{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_275BE
; ---------------------------------------------------------------------------

loc_275B4:					  ; CODE XREF: ROM:000275A6j
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $770,$0		  ; Prompt:	  Run text script at offset 0x0286D6
						  ; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
						  ; 0x862D: PRINT MSG 0x067A: "{5B}Heh heh heh...{57}Welcome back from the pit...{62}"
						  ; 0xA62E: PRINT MSG 0x067B, END: "{5B}Are you	going back?{58}"
		ScriptID    $774,$1		  ; Answer 'yes': Run text script at offset 0x0286DE
						  ; 0xE630: PRINT MSG 0x067D, MSGBOX CLEARED, END: "{5B}Heh heh	heh...{5E}"
		ScriptID    $773,$2		  ; Answer 'no':  Run text script at offset 0x0286DC
						  ; 0xE62F: PRINT MSG 0x067C, MSGBOX CLEARED, END: "{5B}Do as you like.{5E}"
; ---------------------------------------------------------------------------

locret_275BE:					  ; CODE XREF: ROM:000275B2j
		rts
; ---------------------------------------------------------------------------

XS_007A:
		move.w	#ITM_ARMLET,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	loc_275D0

loc_275CA:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $76F,$0		  ; Run	text script at offset 0x0286D4
						  ; 0xE62C: PRINT MSG 0x0679, MSGBOX CLEARED, END: "{5B}I can see there's{57}something about you...{57}I don't know what it is...{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_275D4
; ---------------------------------------------------------------------------

loc_275D0:					  ; CODE XREF: ROM:000275C8j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $775,$0		  ; Run	text script at offset 0x0286E0
						  ; 0xE631: PRINT MSG 0x067E, MSGBOX CLEARED, END: "{5B}Heh heh...come back{57}anytime you like...the undead{57}are always waiting...{5E}"
; ---------------------------------------------------------------------------

locret_275D4:					  ; CODE XREF: ROM:000275CEj
		rts
; ---------------------------------------------------------------------------

XS_007D:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $779,$0		  ; Prompt:	  Run text script at offset 0x0286E8
						  ; 0x1834: LOAD CHARACTER SCRIPT Mir (0x0034)
						  ; 0xA634: PRINT MSG 0x0681, END: "{5B}Are you	going in{57}at all costs?{58}"
		ScriptJump  ClearTextbox_0,$1	  ; Answer 'yes': Jump to address 0x028FB8
		ScriptID    $77B,$2		  ; Answer 'no':  Run text script at offset 0x0286EC
						  ; 0x1834: LOAD CHARACTER SCRIPT Mir (0x0034)
						  ; 0xE635: PRINT MSG 0x0682, MSGBOX CLEARED, END: "{5B}Go back	now.{57}Never step foot	in this{57}tower again.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_007E:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $77D,$0		  ; Prompt:	  Run text script at offset 0x0286F0
						  ; 0x1834: LOAD CHARACTER SCRIPT Mir (0x0034)
						  ; 0xA636: PRINT MSG 0x0683, END: "{5B}Anything I can do for you?{58}"
		ScriptJump  ClearTextbox_0,$1	  ; Answer 'yes': Jump to address 0x028FB8
		ScriptID    $77F,$2		  ; Answer 'no':  Run text script at offset 0x0286F4
						  ; 0x1834: LOAD CHARACTER SCRIPT Mir (0x0034)
						  ; 0xE637: PRINT MSG 0x0684, MSGBOX CLEARED, END: "{5B}Go back	right now!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_007F:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $781,$0		  ; Prompt:	  Run text script at offset 0x0286F8
						  ; 0x1834: LOAD CHARACTER SCRIPT Mir (0x0034)
						  ; 0xA638: PRINT MSG 0x0685, END: "{5B}Do you dare come in?{58}"
		ScriptID    $783,$1		  ; Answer 'yes': Run text script at offset 0x0286FC
						  ; 0x1834: LOAD CHARACTER SCRIPT Mir (0x0034)
						  ; 0xE639: PRINT MSG 0x0686, MSGBOX CLEARED, END: "{5B}I think	you had	better{57}go back...{5E}"
		ScriptID    $785,$2		  ; Answer 'no':  Run text script at offset 0x028700
						  ; 0x1834: LOAD CHARACTER SCRIPT Mir (0x0034)
						  ; 0xE63A: PRINT MSG 0x0687, MSGBOX CLEARED, END: "{5B}Ha ha ha ha ha!...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0089:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $7B4,$0		  ; Run	text script at offset 0x02875E
						  ; 0x1834: LOAD CHARACTER SCRIPT Mir (0x0034)
						  ; 0xA657: PRINT MSG 0x06A4, END: "{5B}I'm going to send you{57}directly to the ground, OK?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bsr.w	ClearTextbox_0
		rts
; ---------------------------------------------------------------------------

XS_0091:					  ; Trap00Handler
		trap	#$00
; ---------------------------------------------------------------------------
		dc.w SND_NigelDie
; ---------------------------------------------------------------------------
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $7D7,$0		  ; Run	text script at offset 0x0287A4
						  ; 0x866D: PRINT MSG 0x06BA: "The red and purple jewels{57}were taken away from Nigel!{62}"
						  ; 0x1BF1: LOAD SPECIAL CHARACTER Duke	(0x09)
						  ; 0xE66E: PRINT MSG 0x06BB, MSGBOX CLEARED, END: "{5B}Mr. Nigel!  Have a{57}good time	with that{57}silly old cow!  Ha	ha ha!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00A5:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $826,$0		  ; Run	text script at offset 0x028842
						  ; 0x1BE9: LOAD SPECIAL CHARACTER Friday (0x01)
						  ; 0x86A5: PRINT MSG 0x06F2: "{5B}Look, Nigel!{57}This	dog is badly hurt!{62}"
						  ; 0x86A6: PRINT MSG 0x06F3: "{5B}Poor	dog!{57}I'll cast a spell on you{57}to make you better.  Nigel!{62}"
						  ; 0x0400: LOAD 0x0000	INTO 0xFF1198 (EkeEke)
						  ; 0xA6A7: PRINT MSG 0x06F4, END: "{5B}Give me	an {5F}!{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	loc_27630

loc_2761C:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $834,$0		  ; Run	text script at offset 0x02885E
						  ; 0x1BE9: LOAD SPECIAL CHARACTER Friday (0x01)
						  ; 0xA6AD: PRINT MSG 0x06FA, END: "{5B}But...he's nearly{57}dead!  Please!{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	loc_27630
		bsr.s	sub_2763A
		beq.s	locret_27638

loc_2762A:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $836,$0		  ; Run	text script at offset 0x028862
						  ; 0x1BE9: LOAD SPECIAL CHARACTER Friday (0x01)
						  ; 0xE6AE: PRINT MSG 0x06FB, MSGBOX CLEARED, END: "{5B}I hate you!!{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_27638
; ---------------------------------------------------------------------------

loc_27630:					  ; CODE XREF: ROM:0002761Aj
						  ; ROM:00027624j
		bsr.s	sub_2763A
		beq.s	locret_27638

loc_27634:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $82B,$0		  ; Run	text script at offset 0x02884C
						  ; 0x1BE9: LOAD SPECIAL CHARACTER Friday (0x01)
						  ; 0xE6A8: PRINT MSG 0x06F5, MSGBOX CLEARED, END: "{5B}Thanks!{57}It's all right, poor dog!{5E}"
; ---------------------------------------------------------------------------

locret_27638:					  ; CODE XREF: ROM:00027628j
						  ; ROM:0002762Ej ...
		rts

; =============== S U B	R O U T	I N E =======================================


sub_2763A:					  ; CODE XREF: ROM:00027626p
						  ; ROM:loc_27630p
		move.w	(word_FF1198).l,d0
		bsr.w	CheckIfItemIsOwned
		bne.s	locret_27650

loc_27646:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $838,$0		  ; Run	text script at offset 0x028866
						  ; 0x1BE9: LOAD SPECIAL CHARACTER Friday (0x01)
						  ; 0x0400: LOAD 0x0000	INTO 0xFF1198 (EkeEke)
						  ; 0xE6AF: PRINT MSG 0x06FC, MSGBOX CLEARED, END: "{5B}You don't have any {5F}?{57}Quickly!  Get some and{57}hurry back so I can cure him.{5E}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l

locret_27650:					  ; CODE XREF: sub_2763A+Aj
		rts
; End of function sub_2763A


; =============== S U B	R O U T	I N E =======================================


XS_00AC:
		movem.l	d0/d6-a0,-(sp)
		lea	word_27672(pc),a0
		moveq	#$00000004,d6
		jsr	(j_GenerateRandomNumber).l
		add.w	d7,d7
		move.w	(a0,d7.w),d0
		bsr.w	RunTextCmd
		movem.l	(sp)+,d0/d6-a0

locret_27670:
		rts
; End of function XS_00AC

; ---------------------------------------------------------------------------
word_27672:	ScriptID    $852,$0		  ; DATA XREF: XS_00AC+4t
						  ; Mayor (0x00) : Run text script at offset 0x02889A
						  ; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
						  ; 0xE6BB: PRINT MSG 0x0708, MSGBOX CLEARED, END: "{5B}Oh!!{57}Don't frighten me like that!{5E}"
		ScriptID    $854,$1		  ; Fara (0x01)	: Run text script at offset 0x02889E
						  ; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
						  ; 0xE6BC: PRINT MSG 0x0709, MSGBOX CLEARED, END: "{5B}The view from here is{57}splendid, huh?{57}'Bye, now!{5E}"
		ScriptID    $856,$2		  ; Hahna (0x02) : Run text script at offset 0x0288A2
						  ; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
						  ; 0xE6BD: PRINT MSG 0x070A, MSGBOX CLEARED, END: "{5B}Tag!{57}You're it!!{5E}"
		ScriptID    $858,$3		  ; Pockets (0x03) : Run text script at	offset 0x0288A6
						  ; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
						  ; 0xE6BE: PRINT MSG 0x070B, MSGBOX CLEARED, END: "{5B}You're very lucky!{57}That's it!{5E}"
; ---------------------------------------------------------------------------

XS_00AD:
		movem.l	d0/d6-a0,-(sp)
		lea	word_2769A(pc),a0
		moveq	#$00000004,d6
		jsr	(j_GenerateRandomNumber).l
		add.w	d7,d7
		move.w	(a0,d7.w),d0
		bsr.w	RunTextCmd
		movem.l	(sp)+,d0/d6-a0

locret_27698:
		rts
; ---------------------------------------------------------------------------
word_2769A:	ScriptID    $85A,$0		  ; DATA XREF: ROM:0002767Et
						  ; Mayor (0x00) : Run text script at offset 0x0288AA
						  ; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
						  ; 0xE6BF: PRINT MSG 0x070C, MSGBOX CLEARED, END: "{5B}Woah!  That made me dizzy!{5E}"
		ScriptID    $85C,$1		  ; Fara (0x01)	: Run text script at offset 0x0288AE
						  ; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
						  ; 0xE6C0: PRINT MSG 0x070D, MSGBOX CLEARED, END: "{5B}Listen carefully!{57}Dne daed a	si siht!{5E}"
		ScriptID    $85E,$2		  ; Hahna (0x02) : Run text script at offset 0x0288B2
						  ; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
						  ; 0xE6C1: PRINT MSG 0x070E, MSGBOX CLEARED, END: "{5B}Just a little further,{57}and you'll find...{59}a...{57}dead end!  Hahahah!{5E}"
		ScriptID    $860,$3		  ; Pockets (0x03) : Run text script at	offset 0x0288B6
						  ; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
						  ; 0xE6C2: PRINT MSG 0x070F, MSGBOX CLEARED, END: "{5B}You don't need me?{57}{59}Bye-bye!{5E}"
; ---------------------------------------------------------------------------

XS_00B2:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $86A,$5		  ; Run	text script at offset 0x0288CA
						  ; 0xE6C8: PRINT MSG 0x0715, MSGBOX CLEARED, END: "{5B}Got it?	 'Bye!{5E}"
; ---------------------------------------------------------------------------
		move.w	#ITM_RESTORATION,d0
		bsr.w	GetRemainingItemAllowedCount
		beq.s	loc_276B6

loc_276B0:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $873,$0		  ; Run	text script at offset 0x0288DC
						  ; 0x86CF: PRINT MSG 0x071C: "{5B}I'll give you this.{57}I can't see it, but it{57}sure looks good.{62}"
						  ; 0x002E: LOAD 0x002E	INTO 0xFF1196 (Restora-tion)
						  ; 0x17E8: RECEIVE ITEM [0xFF1196]
						  ; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
						  ; 0xE6D0: PRINT MSG 0x071D, MSGBOX CLEARED, END: "{5B}I enjoyed talking{57}with you!	I can't see you,{57}but you're still my friend.{5E}"
; ---------------------------------------------------------------------------
		bra.s	locret_276BA
; ---------------------------------------------------------------------------

loc_276B6:					  ; CODE XREF: ROM:000276AEj
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $878,$0		  ; Run	text script at offset 0x0288E6
						  ; 0xE6D1: PRINT MSG 0x071E, MSGBOX CLEARED, END: "{5B}Good luck!{57}I	can't see you, but{57}good luck!{5E}"
; ---------------------------------------------------------------------------

locret_276BA:					  ; CODE XREF: ROM:000276B4j
		rts
; ---------------------------------------------------------------------------

XS_00B3:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $879,$0		  ; Run	text script at offset 0x0288E8
						  ; 0x1BE9: LOAD SPECIAL CHARACTER Friday (0x01)
						  ; 0x041E: LOAD 0x001E	INTO 0xFF1198 (Sun Stone)
						  ; 0x86D2: PRINT MSG 0x071F: "{5B}Nigel, look!{57}I can see something shining{57}over there! The {5F}!{62}"
						  ; 0x1BE8: LOAD SPECIAL CHARACTER Nigel (0x00)
						  ; 0xE6D3: PRINT MSG 0x0720, MSGBOX CLEARED, END: "{5B}But we can't{57}get through those trees...{5E}"
; ---------------------------------------------------------------------------
		moveq	#ITM_EINSTEINWHISTLE,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	loc_276D0
		bsr.w	ClearTextbox_0
		st	d0
		bra.s	loc_276D6
; ---------------------------------------------------------------------------

loc_276D0:					  ; CODE XREF: ROM:000276C6j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $888,$0		  ; Run	text script at offset 0x028906
						  ; 0x1BE9: LOAD SPECIAL CHARACTER Friday (0x01)
						  ; 0xE6D9: PRINT MSG 0x0726, MSGBOX CLEARED, END: "{5B}Maybe we should{57}start over from the{57}very beginning...{5E}"
; ---------------------------------------------------------------------------
		clr.b	d0

loc_276D6:					  ; CODE XREF: ROM:000276CEj
		move.b	d0,(g_YesNoPromptResult).l
		rts
; ---------------------------------------------------------------------------

XS_00C1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $8C5,$0		  ; Prompt:	  Run text script at offset 0x028980
						  ; 0x18F7: LOAD CHARACTER SCRIPT * (0x00F7)
						  ; 0x86FB: PRINT MSG 0x0748: "{5B}The ship will soon set sail{57}for Verla!  You can get on{57}for free because you{62}"
						  ; 0xA6FC: PRINT MSG 0x0749, END: "{5B}fixed the lighthouse!{57}Getting on now?{58}"
		ScriptID    $8C8,$1		  ; Answer 'yes': Run text script at offset 0x028986
						  ; 0x14D9: SET	BIT 1 OF FLAG 0x01B
						  ; 0xE6FD: PRINT MSG 0x074A, MSGBOX CLEARED, END: "{5B}Get on board!{57}We're leaving soon!{5E}"
		ScriptID    $8CB,$2		  ; Answer 'no':  Run text script at offset 0x02898C
						  ; 0xE6FF: PRINT MSG 0x074C, MSGBOX CLEARED, END: "{5B}OK, I'll{57}wait a while for you...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00E5:					  ; Trap00Handler
		trap	#$00
; ---------------------------------------------------------------------------
		dc.w SND_MusicDukeChase
; ---------------------------------------------------------------------------

loc_276EE:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $94D,$0		  ; Run	text script at offset 0x028A90
						  ; 0x1BF1: LOAD SPECIAL CHARACTER Duke	(0x09)
						  ; 0x8756: PRINT MSG 0x07A3: "{5B}You again!{62}"
						  ; 0xE757: PRINT MSG 0x07A4, MSGBOX CLEARED, END: "{5B}I think	it's time{57}to stop playing tag with you!{57}Come here!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00E9:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $95B,$0		  ; Run	text script at offset 0x028AAC
						  ; 0x1836: LOAD CHARACTER SCRIPT Lara (0x0036)
						  ; 0x875F: PRINT MSG 0x07AC: "{5B}Eeeeeeeee!{57}Noooooooooooo!{62}"
						  ; 0xA760: PRINT MSG 0x07AD, END: "{5B}...O-OK...{57}you...win...!{62}"
; ---------------------------------------------------------------------------
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_FadeOut
; ---------------------------------------------------------------------------
		bsr.w	Sleep_0
; ---------------------------------------------------------------------------
		dc.w 00059
; ---------------------------------------------------------------------------
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicMap
; ---------------------------------------------------------------------------

loc_27706:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $95E,$0		  ; Run	text script at offset 0x028AB2
						  ; 0x1836: LOAD CHARACTER SCRIPT Lara (0x0036)
						  ; 0x8761: PRINT MSG 0x07AE: "{5B}Oh, guardian{59} of the{57}darkness...{59}When the five{57}stones gather{59}	here...{62}"
						  ; 0xE762: PRINT MSG 0x07AF, MSGBOX CLEARED, END: "{5B}show to	me...the{57}secret passage!{57}{59}In-nah{59} Gad'da{59} da{59} V'idda!{5E}"
; ---------------------------------------------------------------------------
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_FadeOut
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00EB:
		bsr.w	RestoreBGM_1

loc_27714:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $963,$0		  ; Run	text script at offset 0x028ABC
						  ; 0x1836: LOAD CHARACTER SCRIPT Lara (0x0036)
						  ; 0x8764: PRINT MSG 0x07B1: "{5B}Oh, my prince!{57}I just knew you'd{57}come to save me...!{62}"
						  ; 0xE765: PRINT MSG 0x07B2, MSGBOX CLEARED, END: "{5B}You are	my prince!{57}Oh, it's just like a fairy tale{57}come true!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00F0:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $977,$0		  ; Run	text script at offset 0x028AE4
						  ; 0x1836: LOAD CHARACTER SCRIPT Lara (0x0036)
						  ; 0x8772: PRINT MSG 0x07BF: "{5B}Stay	out of this, Moralis!{57}I can handle this mini-witch{57}by myself!{62}"
						  ; 0x1822: LOAD CHARACTER SCRIPT Moralis (0x0022)
						  ; 0xA773: PRINT MSG 0x07C0, END: "{5B}Princess!!{57}Mr. Nigel	and Miss Friday{57}saved your life!{62}"
; ---------------------------------------------------------------------------
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicFinalCutscene
; ---------------------------------------------------------------------------

loc_27722:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $97B,$0		  ; Run	text script at offset 0x028AEC
						  ; 0x1836: LOAD CHARACTER SCRIPT Lara (0x0036)
						  ; 0x8774: PRINT MSG 0x07C1: "{5B}...{59}yeah{59}...I'm sorry...{57}but...{59}but...{59}I was so scared!...{62}"
						  ; 0x8775: PRINT MSG 0x07C2: "{5B}...sob...{57}every day I dropped something{57}down from the tower, but{62}"
						  ; 0x8776: PRINT MSG 0x07C3: "{5B}nobody came!{57}Nobody noticed a thing!{57}...I was scared!{62}"
						  ; 0x1822: LOAD CHARACTER SCRIPT Moralis (0x0022)
						  ; 0x8777: PRINT MSG 0x07C4: "{5B}...OK, OK...{57}Let's go back home,{57}Princess Lara.{62}"
						  ; 0x1836: LOAD CHARACTER SCRIPT Lara (0x0036)
						  ; 0xE778: PRINT MSG 0x07C5, MSGBOX CLEARED, END: "{5B}...Boo,	hoo, hoo!...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00F2:
		bsr.w	RestoreBGM_1

loc_2772C:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $986,$0		  ; Run	text script at offset 0x028B02
						  ; 0x1BE9: LOAD SPECIAL CHARACTER Friday (0x01)
						  ; 0x877B: PRINT MSG 0x07C8: "{5B}Poor	girl...{57}I think she must've cracked{57}being alone in that{62}"
						  ; 0x877C: PRINT MSG 0x07C9: "{5B}tower for so	long...{57}Imagine her calling you{57}"my prince!"  The	nerve!{62}"
						  ; 0xE77D: PRINT MSG 0x07CA, MSGBOX CLEARED, END: "{5B}Anyway...let's go!{57}We have to catch up with{57}Duke Mercator!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00FE:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $9AC,$0		  ; Run	text script at offset 0x028B4E
						  ; 0x1805: LOAD CHARACTER SCRIPT Owner	(0x0005)
						  ; 0xA793: PRINT MSG 0x07E0, END: "Nigel got 2000 golds!"
; ---------------------------------------------------------------------------

loc_27736:
		bsr.w	Sleep_0
; ---------------------------------------------------------------------------
		dc.w 00119
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0122:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $9F7,$0		  ; Run	text script at offset 0x028BE4
						  ; 0x1939: LOAD CHARACTER SCRIPT * (0x0139)
						  ; 0x87BC: PRINT MSG 0x0809: "{5B}Welcome!{57}Let's play Roulette!{62}"
						  ; 0x87BD: PRINT MSG 0x080A: "{5B}The game starts when	you{57}get on the big ball!  If	the{57}ball stops on a red plate,{62}"
						  ; 0x87BE: PRINT MSG 0x080B: "{5B}you'll get 200 golds!{57}50 golds for one play!{62}"
						  ; 0xA7BF: PRINT MSG 0x080C, END: "{5B}Try your luck?{58}"
; ---------------------------------------------------------------------------
		moveq	#0000000050,d0

loc_27744:					  ; CODE XREF: ROM:00027780j
						  ; ROM:00027788j
		bsr.w	GetYesNoAnswer
		bcc.s	loc_27764
		jsr	(j_RemoveGold).l
		bcs.s	loc_27758

loc_27752:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $9FC,$0		  ; Run	text script at offset 0x028BEE
						  ; 0x1939: LOAD CHARACTER SCRIPT * (0x0139)
						  ; 0xE7C0: PRINT MSG 0x080D, MSGBOX CLEARED, END: "{5B}Good luck!{5E}"
; ---------------------------------------------------------------------------
		bra.s	loc_27762
; ---------------------------------------------------------------------------

loc_27758:					  ; CODE XREF: ROM:00027750j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $9FE,$0		  ; Run	text script at offset 0x028BF2
						  ; 0xE7C1: PRINT MSG 0x080E, MSGBOX CLEARED, END: "{5B}Sorry...I can't{57}lower the price!{5E}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l

loc_27762:					  ; CODE XREF: ROM:00027756j
		bra.s	locret_27768
; ---------------------------------------------------------------------------

loc_27764:					  ; CODE XREF: ROM:00027748j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $9FF,$0		  ; Run	text script at offset 0x028BF4
						  ; 0xE7C2: PRINT MSG 0x080F, MSGBOX CLEARED, END: "{5B}Ohhhh...so close!{5E}"
; ---------------------------------------------------------------------------

locret_27768:					  ; CODE XREF: ROM:loc_27762j
		rts
; ---------------------------------------------------------------------------

XS_0123:
		move.l	#$000000C8,(g_PrintNumericDwordValue).l

XS_0127:					  ; CODE XREF: ROM:00027794j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $A00,$0		  ; Run	text script at offset 0x028BF6
						  ; 0x1939: LOAD CHARACTER SCRIPT * (0x0139)
						  ; 0x87C3: PRINT MSG 0x0810: "{5B}Congratulations!{57}Here ya go!{62}"
						  ; 0x17E9: RECEIVE [NUMERIC_VAR] GOLDS
						  ; 0x1939: LOAD CHARACTER SCRIPT * (0x0139)
						  ; 0xE7C4: PRINT MSG 0x0811, MSGBOX CLEARED, END: "{5B}See you	again!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0125:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $A07,$0		  ; Run	text script at offset 0x028C04
						  ; 0x193A: LOAD CHARACTER SCRIPT * (0x013A)
						  ; 0x87C6: PRINT MSG 0x0813: "{5B}Hello!  Let's play{57}Chicken Toss!{57}Try to catch as many{62}"
						  ; 0x87C7: PRINT MSG 0x0814: "{5B}chickens as you can and{57}throw them into the pen{57}before	the time runs out!{62}"
						  ; 0x87C8: PRINT MSG 0x0815: "{5B}Room	record is {5A}.{57}You'll get 5 golds{57}per chicken.{62}"
						  ; 0x87C9: PRINT MSG 0x0816: "{5B}The game starts when	you{57}get on the red square.{62}"
						  ; 0xA7CA: PRINT MSG 0x0817, END: "{5B}20 golds for one turn.{57}Wanna	try?{58}"
; ---------------------------------------------------------------------------
		moveq	#0000000020,d0
		bra.s	loc_27744
; ---------------------------------------------------------------------------

XS_0128:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $A0F,$0		  ; Run	text script at offset 0x028C14
						  ; 0x193B: LOAD CHARACTER SCRIPT * (0x013B)
						  ; 0x87CC: PRINT MSG 0x0819: "{5B}Welcome to the{57}Chicken Race!{62}"
						  ; 0x87CD: PRINT MSG 0x081A: "{5B}Ride	one of the four{57}chickens...If your chicken{57}comes in first, you'll get{62}"
						  ; 0x87CE: PRINT MSG 0x081B: "{5B}200 golds.{62}"
						  ; 0xA7CF: PRINT MSG 0x081C, END: "{5B}50 golds for one race.{57}Give it a try?{58}"
; ---------------------------------------------------------------------------
		moveq	#0000000050,d0
		bra.s	loc_27744
; ---------------------------------------------------------------------------

XS_0129:
		move.l	#0000000200,(g_PrintNumericDwordValue).l
		bra.s	XS_0127
; ---------------------------------------------------------------------------

XS_012A:
		moveq	#ITM_CASINOTICKET,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	loc_277B8

loc_2779E:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $A15,$0		  ; Run	text script at offset 0x028C20
						  ; 0x193C: LOAD CHARACTER SCRIPT * (0x013C)
						  ; 0x0416: LOAD 0x0016	INTO 0xFF1198 (Casino Ticket)
						  ; 0x87D1: PRINT MSG 0x081E: "{5B}Oh!	I see you have a{57}casino ticket.{62}"
						  ; 0xA7D2: PRINT MSG 0x081F, END: "{5B}Care to	come in?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	loc_277B2
		bsr.w	CheckAndConsumeItem

loc_277AC:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $A19,$0		  ; Run	text script at offset 0x028C28
						  ; 0x193C: LOAD CHARACTER SCRIPT * (0x013C)
						  ; 0xE7D3: PRINT MSG 0x0820, MSGBOX CLEARED, END: "{5B}Welcome	to{57}the Casino Arthurlier!{57}Have fun!{5E}"
; ---------------------------------------------------------------------------
		bra.s	loc_277B6
; ---------------------------------------------------------------------------

loc_277B2:					  ; CODE XREF: ROM:000277A6j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $A1B,$0		  ; Run	text script at offset 0x028C2C
						  ; 0x193C: LOAD CHARACTER SCRIPT * (0x013C)
						  ; 0xE7D4: PRINT MSG 0x0821, MSGBOX CLEARED, END: "{5B}See you!{5E}"
; ---------------------------------------------------------------------------

loc_277B6:					  ; CODE XREF: ROM:000277B0j
		bra.s	locret_277C2
; ---------------------------------------------------------------------------

loc_277B8:					  ; CODE XREF: ROM:0002779Cj
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $A1D,$0		  ; Run	text script at offset 0x028C30
						  ; 0x193C: LOAD CHARACTER SCRIPT * (0x013C)
						  ; 0x0416: LOAD 0x0016	INTO 0xFF1198 (Casino Ticket)
						  ; 0xE7D5: PRINT MSG 0x0822, MSGBOX CLEARED, END: "{5B}Sorry.	You can't come in{57}unless you have a{57}{5F}!{5E}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l

locret_277C2:					  ; CODE XREF: ROM:loc_277B6j
		rts
; ---------------------------------------------------------------------------

XS_012B:
		clr.b	(g_YesNoPromptResult).l
		move.w	#$00E0,d0
		bsr.w	TestFlagBit
		beq.s	loc_277F0
		move.w	#$00E1,d0
		bsr.w	TestFlagBit
		beq.s	loc_277E4

loc_277DE:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $A26,$0		  ; Run	text script at offset 0x028C42
						  ; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
						  ; 0xE7D9: PRINT MSG 0x0826, MSGBOX CLEARED, END: "{5B}I wish we could	grow{57}more trees underground...{5E}"
; ---------------------------------------------------------------------------
		bra.s	loc_277EE
; ---------------------------------------------------------------------------

loc_277E4:					  ; CODE XREF: ROM:000277DCj
		st	(g_YesNoPromptResult).l

loc_277EA:					  ; Trap01Handler
		trap	#$01
; ---------------------------------------------------------------------------
		ScriptID    $A23,$0		  ; Run	text script at offset 0x028C3C
						  ; 0x14E1: SET	BIT 1 OF FLAG 0x01C
						  ; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
						  ; 0xE7D8: PRINT MSG 0x0825, MSGBOX CLEARED, END: "{5B}You met	my father, right?{57}In	that case, go on up and{57}cut the tree	to make	a raft!{5E}"
; ---------------------------------------------------------------------------

loc_277EE:					  ; CODE XREF: ROM:000277E2j
		bra.s	locret_277F4
; ---------------------------------------------------------------------------

loc_277F0:					  ; CODE XREF: ROM:000277D2j
		trap	#$01			  ; Trap01Handler
; ---------------------------------------------------------------------------
		ScriptID    $A20,$0		  ; Run	text script at offset 0x028C36
						  ; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
						  ; 0x87D6: PRINT MSG 0x0823: "{5B}There's one lone tree{57}standing up above.  Trees{57}are very rare here, so{62}"
						  ; 0xE7D7: PRINT MSG 0x0824, MSGBOX CLEARED, END: "{5B}I'm standing guard!{5E}"
; ---------------------------------------------------------------------------

locret_277F4:					  ; CODE XREF: ROM:loc_277EEj
		rts
; ---------------------------------------------------------------------------
