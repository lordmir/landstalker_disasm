; ---------------------------------------------------------------------------

XS_001B:
		move.w	#$21,d0	; '!'
		bsr.w	TestFlagBit
		bne.s	XS_001B_0
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $59D,$0	; Prompt:	Run text script	at offset 0x028258
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0xA508: PRINT	MSG 0x0555, END: "{5B}:	Are you	going to{57}the	thieves' hideout?{58}"
		ScriptID    $59F,$1	; Answer 'yes': Run text script at offset 0x02825C
					; 0xE509: PRINT	MSG 0x0556, MSGBOX CLEARED, END: "{5B}:	Let's go!{5E}"
		ScriptID    $5A0,$2	; Answer 'no':  Run text script at offset 0x02825E
					; 0xE50A: PRINT	MSG 0x0557, MSGBOX CLEARED, END: "{5B}:	Why not?{57}It could be	fun!{5E}"
; ---------------------------------------------------------------------------
		bra.s	XS_001B_1
; ---------------------------------------------------------------------------

XS_001B_0:				; CODE XREF: ROM:00027288j
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $5A1,$0	; Prompt:	Run text script	at offset 0x028260
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0xA50B: PRINT	MSG 0x0558, END: "{5B}:	Are you	going to{57}the	thieves' hideout?{58}"
		ScriptID    $5A3,$1	; Answer 'yes': Run text script at offset 0x028264
					; 0xE50C: PRINT	MSG 0x0559, MSGBOX CLEARED, END: "{5B}:	Let's go!{5E}"
		ScriptID    $5A4,$2	; Answer 'no':  Run text script at offset 0x028266
					; 0xE50D: PRINT	MSG 0x055A, MSGBOX CLEARED, END: "{5B}:	Right.{57}We don't have to go.{5E}"
; ---------------------------------------------------------------------------

XS_001B_1:				; CODE XREF: ROM:00027294j
		rts
; ---------------------------------------------------------------------------

XS_001C:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $5A5,$0	; Prompt:	Run text script	at offset 0x028268
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0xA50E: PRINT	MSG 0x055B, END: "{5B}:	Are you	going back{57}to town?{58}"
		ScriptID    $5A7,$1	; Answer 'yes': Run text script at offset 0x02826C
					; 0xE50F: PRINT	MSG 0x055C, MSGBOX CLEARED, END: "{5B}:	OK!  Let's go!{5E}"
		ScriptID    $5A8,$2	; Answer 'no':  Run text script at offset 0x02826E
					; 0xE510: PRINT	MSG 0x055D, MSGBOX CLEARED, END: "{5B}:	We have	a lot left{57}to do here.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_002A:
		trap	#0
; ---------------------------------------------------------------------------
		dc.w SND_NigelDie
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5ED,$0	; Run text script at offset 0x0282F8
					; 0x0027: LOAD 0x0027 INTO 0xFF1196 (Litho{69}graph)
					; 0x8533: PRINT	MSG 0x0580: "Nigel handed over the {5F}.{5E}"
					; 0x182E: LOAD CHARACTER SCRIPT	Kayla (0x002E)
					; 0xE534: PRINT	MSG 0x0581, MSGBOX CLEARED, END: "{5B}:	Hahahahaha!  Good boy!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_002E:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5FE,$0	; Run text script at offset 0x02831A
					; 0x181D: LOAD CHARACTER SCRIPT	Purin (0x001D)
					; 0x853D: PRINT	MSG 0x058A: "{5B}: Hello.  I'm Purin.{57}I'm twelve.  Madame Yard is my{57}mom.  Wanna play?{62}"
					; 0xA53E: PRINT	MSG 0x058B, END: "{5B}:	I like you!{57}Would you be my boyfriend?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		rts
; ---------------------------------------------------------------------------

XS_0036:
		move.w	#$23,d0	; '#'
		bsr.w	TestFlagBit
		bne.s	XS_0036_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $24B,$0	; Run text script at offset 0x027BB4
					; 0x18AA: LOAD CHARACTER SCRIPT	* (0x00AA)
					; 0xE21B: PRINT	MSG 0x0268, MSGBOX CLEARED, END: "{5B}:	If ya ain't got a{57}safe-conduct pass, ya ain't{57}gettin' in these gates!{5E}"
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $24F,$0	; Run text script at offset 0x027BBC
					; 0x18AB: LOAD CHARACTER SCRIPT	* (0x00AB)
					; 0xE21E: PRINT	MSG 0x026B, MSGBOX CLEARED, END: "{5B}:	My legs	are sore from{57}standing here all day long.{5E}"
; ---------------------------------------------------------------------------
		bra.s	XS_0036_5
; ---------------------------------------------------------------------------

XS_0036_0:				; CODE XREF: ROM:000272CAj
		move.l	d0,-(sp)
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $612,$0	; Run text script at offset 0x028342
					; 0x18AA: LOAD CHARACTER SCRIPT	* (0x00AA)
					; 0x8548: PRINT	MSG 0x0595: "{5B}: You can come	in now,{57}but...{62}"
					; 0x8549: PRINT	MSG 0x0596: "{5B}: you can't pass this gate{57}for free!   Heh, heh, heh...{62}"
					; 0x854A: PRINT	MSG 0x0597: "{5B}: Listen.  I'm a little{57}strapped for cash, and{57}baby needs a new pair{62}"
					; 0x854B: PRINT	MSG 0x0598: "{5B}: of shoes...{62}"
					; 0x10C8: LOAD 200 INTO	NUMERIC	VARIABLE
					; 0xA54C: PRINT	MSG 0x0599, END: "{5B}:	Heh heh...I'll letcha in{57}for {5A} golds.  Whaddaya say?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0036_3
		move.l	(g_PrintNumericDwordValue).l,d0
		jsr	(j_RemoveGold).l
		bcc.s	XS_0036_1
		jsr	(j_GetGold).l
		jsr	(j_RemoveGold).l
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $61C,$0	; Run text script at offset 0x028356
					; 0xE550: PRINT	MSG 0x059D, MSGBOX CLEARED, END: "{5B}:	...Is that all?{57}OK, go ahead!{5E}"
; ---------------------------------------------------------------------------
		bra.s	XS_0036_2
; ---------------------------------------------------------------------------

XS_0036_1:				; CODE XREF: ROM:000272EEj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $619,$0	; Run text script at offset 0x028350
					; 0x854D: PRINT	MSG 0x059A: "{5B}: Hey,	thanks!	 You must be{57}rich!  Hey, tell you what...{57}if you want to double{62}"
					; 0x854E: PRINT	MSG 0x059B: "{5B}: your	money, there's a place{57}called Greenpea's in town.{57}You may gain, or you may lose.{62}"
					; 0xE54F: PRINT	MSG 0x059C, MSGBOX CLEARED, END: "{5B}:	It all depends on your luck!{5E}"
; ---------------------------------------------------------------------------

XS_0036_2:				; CODE XREF: ROM:00027300j
		bra.s	XS_0036_4
; ---------------------------------------------------------------------------

XS_0036_3:				; CODE XREF: ROM:000272E0j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $61D,$0	; Run text script at offset 0x028358
					; 0xE551: PRINT	MSG 0x059E, MSGBOX CLEARED, END: "{5B}:	What a miser!{57}OK, go	ahead!{5E}"
; ---------------------------------------------------------------------------

XS_0036_4:				; CODE XREF: ROM:XS_0036_2j
		move.l	(sp)+,d0

XS_0036_5:				; CODE XREF: ROM:000272D4j
		rts
; ---------------------------------------------------------------------------

XS_0037:
		move.l	d0,-(sp)
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $61E,$0	; Run text script at offset 0x02835A
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0x8552: PRINT	MSG 0x059F: "{5B}: I'm a master of{57}martial arts!  I can give you{57}a lesson if you want.{62}"
					; 0xA553: PRINT	MSG 0x05A0, END: "{5B}:	Will you challenge me?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0037_4
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $621,$0	; Run text script at offset 0x028360
					; 0x1014: LOAD 20 INTO NUMERIC VARIABLE
					; 0xA554: PRINT	MSG 0x05A1, END: "{5B}:	Now, pay me{57}{5A} golds, OK?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0037_4
		move.l	(g_PrintNumericDwordValue).l,d0
		jsr	(j_RemoveGold).l
		bcc.s	XS_0037_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $623,$0	; Run text script at offset 0x028364
					; 0xE555: PRINT	MSG 0x05A2, MSGBOX CLEARED, END: "{5B}:	I'm sorry, but it's{57}my job.  I can't do it if you{57}don't have enough money.{5E}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	XS_0037_3
; ---------------------------------------------------------------------------

XS_0037_0:				; CODE XREF: ROM:00027332j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $625,$0	; Run text script at offset 0x028368
					; 0xA557: PRINT	MSG 0x05A4, END: "{5B}:	Do you want to hear{57}the rules?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0037_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $626,$0	; Run text script at offset 0x02836A
					; 0x8558: PRINT	MSG 0x05A5: "{5B}: I'll change into various{57}monsters who will attack you{57}one after the other.{62}"
					; 0x8559: PRINT	MSG 0x05A6: "{5B}: I'll evaluate your{57}skill by the numbers of the{57}monsters you defeat without{62}"
					; 0x855A: PRINT	MSG 0x05A7: "{5B}: getting hit.	 Once you{57}get a hit,	it's over.  Your{57}reward will be given based{62}"
					; 0xE55B: PRINT	MSG 0x05A8, MSGBOX CLEARED, END: "{5B}:	on the number of{57}monsters you kill.	Got it?{57}Now,	ready...set...GO!{5E}"
; ---------------------------------------------------------------------------
		bra.s	XS_0037_2
; ---------------------------------------------------------------------------

XS_0037_1:				; CODE XREF: ROM:00027348j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $62A,$0	; Run text script at offset 0x028372
					; 0xE55C: PRINT	MSG 0x05A9, MSGBOX CLEARED, END: "{5B}:	Now, ready...set..GO!{5E}"
; ---------------------------------------------------------------------------

XS_0037_2:				; CODE XREF: ROM:0002734Ej
		st	(g_YesNoPromptResult).l

XS_0037_3:				; CODE XREF: ROM:0002733Ej
					; ROM:00027362j
		move.l	(sp)+,d0
		rts
; ---------------------------------------------------------------------------

XS_0037_4:				; CODE XREF: ROM:0002731Aj
					; ROM:00027324j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $624,$0	; Run text script at offset 0x028366
					; 0xE556: PRINT	MSG 0x05A3, MSGBOX CLEARED, END: "{5B}:	Take care of youself!{5E}"
; ---------------------------------------------------------------------------
		bra.s	XS_0037_3
; ---------------------------------------------------------------------------

XS_0038:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $62B,$0	; Prompt:	Run text script	at offset 0x028374
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0x855D: PRINT	MSG 0x05AA: "{5B}: Well	done!  You're quite{57}talented.  Still, you must{57}become much stronger!{62}"
					; 0x1019: LOAD 25 INTO NUMERIC VARIABLE
					; 0xA55E: PRINT	MSG 0x05AB, END: "{5B}:	I give you {5A}	golds if{57}you	stop now.  Will	you go on?{58}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028EAA
		ScriptID    $62F,$2	; Answer 'no':  Run text script at offset 0x02837C
					; 0x855F: PRINT	MSG 0x05AC: "{5B}: {5A}	golds.	Take them!{62}"
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0xE560: PRINT	MSG 0x05AD, MSGBOX CLEARED, END: "{5B}:	You may	come anytime!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0039:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $633,$0	; Prompt:	Run text script	at offset 0x028384
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0x8561: PRINT	MSG 0x05AE: "{5B}: You may be stronger{57}than the soldiers guarding{57}the castle...{62}"
					; 0x1032: LOAD 50 INTO NUMERIC VARIABLE
					; 0x8562: PRINT	MSG 0x05AF: "{5B}: I'll give you {5A} golds{57}if you stop now.{62}"
					; 0xA563: PRINT	MSG 0x05B0, END: "{5B}:	Want to	continue?{58}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028EAA
		ScriptID    $62F,$2	; Answer 'no':  Run text script at offset 0x02837C
					; 0x855F: PRINT	MSG 0x05AC: "{5B}: {5A}	golds.	Take them!{62}"
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0xE560: PRINT	MSG 0x05AD, MSGBOX CLEARED, END: "{5B}:	You may	come anytime!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003A:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $638,$0	; Prompt:	Run text script	at offset 0x02838E
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0x8564: PRINT	MSG 0x05B1: "{5B}: Excellent!!{57}You don't need any more{57}training!{62}"
					; 0x1064: LOAD 100 INTO	NUMERIC	VARIABLE
					; 0xA565: PRINT	MSG 0x05B2, END: "{5B}:	Take {5A} golds!{5C}till want to continue?{58}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028EAA
		ScriptID    $62F,$2	; Answer 'no':  Run text script at offset 0x02837C
					; 0x855F: PRINT	MSG 0x05AC: "{5B}: {5A}	golds.	Take them!{62}"
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0xE560: PRINT	MSG 0x05AD, MSGBOX CLEARED, END: "{5B}:	You may	come anytime!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003B:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $63C,$0	; Prompt:	Run text script	at offset 0x028396
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0x8566: PRINT	MSG 0x05B3: "{5B}: I give up!  You're the{57}strongest man I've ever met!{62}"
					; 0x10C8: LOAD 200 INTO	NUMERIC	VARIABLE
					; 0xA567: PRINT	MSG 0x05B4, END: "{5B}:	Please...take the{57}{5A} golds.  Want to go on?{58}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028EAA
		ScriptID    $62F,$2	; Answer 'no':  Run text script at offset 0x02837C
					; 0x855F: PRINT	MSG 0x05AC: "{5B}: {5A}	golds.	Take them!{62}"
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0xE560: PRINT	MSG 0x05AD, MSGBOX CLEARED, END: "{5B}:	You may	come anytime!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003C:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $640,$0	; Prompt:	Run text script	at offset 0x02839E
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0x8568: PRINT	MSG 0x05B5: "{5B}: P....please...{57}I'm almost...{57}worn out...{62}"
					; 0x1190: LOAD 400 INTO	NUMERIC	VARIABLE
					; 0xA569: PRINT	MSG 0x05B6, END: "{5B}:	Take {5A} golds...{57}...You STILL want	to go on?{58}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028EAA
		ScriptID    $62F,$2	; Answer 'no':  Run text script at offset 0x02837C
					; 0x855F: PRINT	MSG 0x05AC: "{5B}: {5A}	golds.	Take them!{62}"
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0xE560: PRINT	MSG 0x05AD, MSGBOX CLEARED, END: "{5B}:	You may	come anytime!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003F:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $650,$0	; Run text script at offset 0x0283BE
					; 0x181B: LOAD CHARACTER SCRIPT	Owner (0x001B)
					; 0x856F: PRINT	MSG 0x05BC: "{5B}: Welcome to Greenpea's!{57}Step right up!  Have some{57}fun!  Make some money!{62}"
					; 0x1032: LOAD 50 INTO NUMERIC VARIABLE
					; 0xA570: PRINT	MSG 0x05BD, END: "{5B}:{5A} golds for one play.{57}Okay?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	XS_003F_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $657,$0	; Run text script at offset 0x0283CC
					; 0xE573: PRINT	MSG 0x05C0, MSGBOX CLEARED, END: "{5B}:	Are you	nuts?{57}Don't you like gambling?{5E}"
; ---------------------------------------------------------------------------
		bra.s	XS_003F_4
; ---------------------------------------------------------------------------

XS_003F_0:				; CODE XREF: ROM:000273A8j
		move.l	(g_PrintNumericDwordValue).l,d0
		jsr	(j_RemoveGold).l
		bcc.s	XS_003F_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $656,$0	; Run text script at offset 0x0283CA
					; 0xE572: PRINT	MSG 0x05BF, MSGBOX CLEARED, END: "{5B}:	Oops!{57}Come again when{57}you	have more money!{5E}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	XS_003F_4
; ---------------------------------------------------------------------------

XS_003F_1:				; CODE XREF: ROM:000273BCj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $654,$0	; Run text script at offset 0x0283C6
					; 0x181B: LOAD CHARACTER SCRIPT	Owner (0x001B)
					; 0xA571: PRINT	MSG 0x05BE, END: "{5B}:	Thanks!	 Do you	need to{57}know	how to play?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_003F_2
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $658,$0	; Run text script at offset 0x0283CE
					; 0x8574: PRINT	MSG 0x05C1: "{5B}: Throw the ball over{57}the counter so it lands on{57}the moving plates.{62}"
					; 0x8575: PRINT	MSG 0x05C2: "{5B}: The faster the plate	your{57}ball lands on, the more{57}money you win!  400,	100, 50.{62}"
					; 0x8576: PRINT	MSG 0x05C3: "{5B}: If the ball slides off,{57}you lose!	 You have only{57}one throw.{62}"
					; 0xE577: PRINT	MSG 0x05C4, MSGBOX CLEARED, END: "{5B}:	Are you	ready?{57}Okay!	 Then, let's go!{5E}"
; ---------------------------------------------------------------------------
		bra.s	XS_003F_3
; ---------------------------------------------------------------------------

XS_003F_2:				; CODE XREF: ROM:000273D2j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $65C,$0	; Run text script at offset 0x0283D6
					; 0xE578: PRINT	MSG 0x05C5, MSGBOX CLEARED, END: "{5B}:	Now, let's try!{5E}"
; ---------------------------------------------------------------------------

XS_003F_3:				; CODE XREF: ROM:000273D8j
		st	(g_YesNoPromptResult).l

XS_003F_4:				; CODE XREF: ROM:000273AEj
					; ROM:000273C8j
		rts
; ---------------------------------------------------------------------------

XS_0042:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $664,$0	; Run text script at offset 0x0283E6
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0x857D: PRINT	MSG 0x05CA: "{5B}: You look so powerful.{57}If I promise to pay	you,{62}"
					; 0xA57E: PRINT	MSG 0x05CB, END: "{5B}:	would you do me	a favor?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0042_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $667,$0	; Run text script at offset 0x0283EC
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0x857F: PRINT	MSG 0x05CC: "{5B}: The room upstairs is{57}a mess.  Would you put the{57}jars on the shelves neatly?{62}"
					; 0xE580: PRINT	MSG 0x05CD, MSGBOX CLEARED, END: "{5B}:	Collecting jars	is{57}my husband's hobby....{5E}"
; ---------------------------------------------------------------------------
		bra.s	XS_0042_1
; ---------------------------------------------------------------------------

XS_0042_0:				; CODE XREF: ROM:000273EEj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $66A,$0	; Run text script at offset 0x0283F2
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0xE581: PRINT	MSG 0x05CE, MSGBOX CLEARED, END: "{5B}:	Fine!{57}I'll do it myself.{5E}"
; ---------------------------------------------------------------------------

XS_0042_1:				; CODE XREF: ROM:000273F4j
		rts
; ---------------------------------------------------------------------------

XS_0043:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $66C,$0	; Run text script at offset 0x0283F6
					; 0x140F: SET BIT 7 OF FLAG 0x001
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0x8582: PRINT	MSG 0x05CF: "{5B}: Thank you very much.{57}Here's your reward...{62}"
					; 0x1001: LOAD 1 INTO NUMERIC VARIABLE
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0xE583: PRINT	MSG 0x05D0, MSGBOX CLEARED, END: "{5B}:	Please help me again.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0046:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $67F,$0	; Run text script at offset 0x02841C
					; 0x181E: LOAD CHARACTER SCRIPT	Arthur (0x001E)
					; 0xA58B: PRINT	MSG 0x05D8, END: "{5B}:	This is	for you!{62}"
; ---------------------------------------------------------------------------
		trap	#0
; ---------------------------------------------------------------------------
		dc.w SND_MusicChestOpen
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $681,$0	; Run text script at offset 0x028420
					; 0x181E: LOAD CHARACTER SCRIPT	Arthur (0x001E)
					; 0x10FA: LOAD 250 INTO	NUMERIC	VARIABLE
					; 0xA58C: PRINT	MSG 0x05D9, END: "Arthur's henchman{57}got {5A} golds.{62}"
; ---------------------------------------------------------------------------
		jsr	(j_RestoreBGM).l
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $684,$0	; Run text script at offset 0x028426
					; 0x181E: LOAD CHARACTER SCRIPT	Arthur (0x001E)
					; 0x858D: PRINT	MSG 0x05DA: "{5B}: If the duke calls for me,{57}make up	some excuse and{57}manage it as	you see	fit.{62}"
					; 0x18E9: LOAD CHARACTER SCRIPT	* (0x00E9)
					; 0xE58E: PRINT	MSG 0x05DB, MSGBOX CLEARED, END: "{5B}:	Understood!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0048:
		moveq	#$F,d0
		bsr.w	TestPlayerStatus
		beq.s	XS_0048_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $691,$0	; Run text script at offset 0x028440
					; 0x1813: LOAD CHARACTER SCRIPT	Teller (0x0013)
					; 0xE594: PRINT	MSG 0x05E1, MSGBOX CLEARED, END: "{5B}:	I can't cast a spell on{57}you now.  Go to the church{57}and get cured first.{5E}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	XS_0048_1
; ---------------------------------------------------------------------------

XS_0048_0:				; CODE XREF: ROM:00027420j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $68A,$0	; Run text script at offset 0x028432
					; 0x141C: SET BIT 4 OF FLAG 0x003
					; 0x1813: LOAD CHARACTER SCRIPT	Teller (0x0013)
					; 0x8590: PRINT	MSG 0x05DD: "{5B}: I know, I know.{57}The kids your age	are all{57}dying to get	in!{62}"
					; 0xE591: PRINT	MSG 0x05DE, MSGBOX CLEARED, END: "{5B}:	Your wish is my	command{57}{64}Hammina,	hammena, hammana...{57}{64}Punworg Kool	yob siht Ekam!{5E}"
; ---------------------------------------------------------------------------
		st	(g_YesNoPromptResult).l

XS_0048_1:				; CODE XREF: ROM:0002742Cj
		rts
; ---------------------------------------------------------------------------

XS_005D:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $DB		; Bit 3	of flag	0x01B
		ScriptID    $6E2,$1	; Flag set:   Run text script at offset	0x0284E2
					; 0x1493: SET BIT 3 OF FLAG 0x012
					; 0x85CA: PRINT	MSG 0x0617: "{5B}: Please don't{57}tell a soul about Julie...{62}"
					; 0x85CB: PRINT	MSG 0x0618: "{5B}: By the way,{57}I think it's time{57}to go to the party.{62}"
					; 0xE5CC: PRINT	MSG 0x0619, MSGBOX CLEARED, END: "{5B}:	Why dost thou not go to{57}the banquet rooom?{5E}"
		ScriptID    $6E1,$2	; Flag clear: Run text script at offset	0x0284E0
					; 0xE5C9: PRINT	MSG 0x0616, MSGBOX CLEARED, END: "{5B}:	Please don't tell{57}a soul about Julie...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_005E:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $6E6,$0	; Prompt:	Run text script	at offset 0x0284EA
					; 0x182E: LOAD CHARACTER SCRIPT	Kayla (0x002E)
					; 0x85CD: PRINT	MSG 0x061A: "{5B}: Hahahahaha!{57}Nice to meet you again!{57}Hahahahahahaha!{62}"
					; 0xA5CE: PRINT	MSG 0x061B, END: "{5B}:	I've been waiting for{57}you!  Now, come here!{58}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028EAA
		ScriptID    $6F0,$2	; Answer 'no':  Run text script at offset 0x0284FE
					; 0x182E: LOAD CHARACTER SCRIPT	Kayla (0x002E)
					; 0x85D3: PRINT	MSG 0x0620: "{5B}: You refused me!{57}I've never been{57}refused before!{62}"
					; 0xE5D4: PRINT	MSG 0x0621, MSGBOX CLEARED, END: "{5B}:	Ink!  Wally!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0064:				; CODE XREF: ROM:0002745Aj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $6F7,$0	; Run text script at offset 0x02850C
					; 0x1BF1: LOAD SPECIAL CHARACTER Duke (0x09)
					; 0x85D7: PRINT	MSG 0x0624: "{5B}: As you know,	an evil{57}magician lives in the tower{62}"
					; 0x85D8: PRINT	MSG 0x0625: "{5B}: Just	outside	of town.{57}He's a terrible nuisance{57}to me, and to this town.{62}"
					; 0x85D9: PRINT	MSG 0x0626: "{5B}: The name of this wizard{57}is Mir.  Ever since he{57}settled	in that	tower,{62}"
					; 0x85DA: PRINT	MSG 0x0627: "{5B}: we've been afraid for{57}our very lives...We've done{57}everything he asked.{62}"
					; 0x85DB: PRINT	MSG 0x0628: "{5B}: I sometimes thought{57}of sending soldiers to the{57}tower...but his	strong magic{62}"
					; 0x85DC: PRINT	MSG 0x0629: "{5B}: might have harmed{57}the innocent citizens{57}of Mercator.{62}"
					; 0x85DD: PRINT	MSG 0x062A: "{5B}: So I've been giving{57}him all the golds he wants.{62}"
					; 0x85DE: PRINT	MSG 0x062B: "{5B}: But I will stand for	it{57}no longer!{62}"
					; 0xA5DF: PRINT	MSG 0x062C, END: "{5B}:	...Oh, I...beg your pardon!{57}Perhaps I rambled on a bit...{57}Shall I	say it again?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	XS_0064
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $701,$0	; Run text script at offset 0x028520
					; 0x1BF1: LOAD SPECIAL CHARACTER Duke (0x09)
					; 0x85E0: PRINT	MSG 0x062D: "{5B}: I think it's time we defeated{57}this Mir.  The peaceful town{57}of Mercator will{62}"
					; 0x85E1: PRINT	MSG 0x062E: "{5B}: never know true peace{57}as long as he lives.{62}"
					; 0x85E2: PRINT	MSG 0x062F: "{5B}: So, I sent for you.{57}I'd like YOU to defeat Mir!{57}Of course, I'm prepared{62}"
					; 0x85E3: PRINT	MSG 0x0630: "{5B}: to offer you	a rich{57}reward.  It so happens I have{57}in my possession the{62}"
					; 0x85E4: PRINT	MSG 0x0631: "{5B}: Golan Emerald, one of the{57}national treasures of{57}this fair land.{62}"
					; 0x85E5: PRINT	MSG 0x0632: "{5B}: Dexter... Zak...and Nigel,{57}you'll be heroes throughout{57}this proud nation{62}"
					; 0xE5E6: PRINT	MSG 0x0633, MSGBOX CLEARED, END: "{5B}:	for all	time!  May the{57}goddess help you three!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0069:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $71B,$0	; Prompt:	Run text script	at offset 0x028554
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0xA5F3: PRINT	MSG 0x0640, END: "{5B}:	Nigel, are you going{57}to bed for the night?{58}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028EAA
		ScriptID    $71D,$2	; Answer 'no':  Run text script at offset 0x028558
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0xE5F4: PRINT	MSG 0x0641, MSGBOX CLEARED, END: "{5B}:	Let's go{57}explore the castle, then.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0073:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $73C,$0	; Run text script at offset 0x028596
					; 0x1064: LOAD 100 INTO	NUMERIC	VARIABLE
					; 0x18F4: LOAD CHARACTER SCRIPT	* (0x00F4)
					; 0xA606: PRINT	MSG 0x0653, END: "{5B}:	Would you invest{57}{5A} golds in me?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0073_1
		move.l	(g_PrintNumericDwordValue).l,d0
		jsr	(j_RemoveGold).l
		bcs.s	XS_0073_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $740,$0	; Run text script at offset 0x02859E
					; 0x14D2: SET BIT 2 OF FLAG 0x01A
					; 0xE608: PRINT	MSG 0x0655, MSGBOX CLEARED, END: "{5B}:	Thanks,	kid!{57}Wait here,{57}I'll double your money{57}in a jiffy!{5E}"
; ---------------------------------------------------------------------------
		st	(g_YesNoPromptResult).l

XS_0073_0:				; CODE XREF: ROM:0002749Cj
		rts
; ---------------------------------------------------------------------------

XS_0073_1:				; CODE XREF: ROM:00027476j
					; ROM:00027484j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $73F,$0	; Run text script at offset 0x02859C
					; 0xE607: PRINT	MSG 0x0654, MSGBOX CLEARED, END: "{5B}:	Aren't you interested{57}in the money game?{5E}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	XS_0073_0
; ---------------------------------------------------------------------------

XS_0075:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $153		; Bit 3	of flag	0x02A
		ScriptID    $745,$1	; Flag set:   Run text script at offset	0x0285A8
					; 0x18F1: LOAD CHARACTER SCRIPT	* (0x00F1)
					; 0xA60A: PRINT	MSG 0x0657, END: "{5B}:	Hey, a buyer!{57}You want medicines?{57}Sure, we've got 'em all!{62}"
		ScriptID    $747,$2	; Flag clear: Run text script at offset	0x0285AC
					; 0x18F1: LOAD CHARACTER SCRIPT	* (0x00F1)
					; 0xA60B: PRINT	MSG 0x0658, END: "{5B}:	Hey, a buyer!{57}You want variety goods?{57}Sure, we've got lots!{62}"
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $749,$0	; Run text script at offset 0x0285B0
					; 0xE60C: PRINT	MSG 0x0659, MSGBOX CLEARED, END: "{5B}:	We've got all kinds{57}of items, and of good{57}quality, too!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0076:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $74A,$0	; Prompt:	Run text script	at offset 0x0285B2
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0x860D: PRINT	MSG 0x065A: "{5B}: Heh heh heh...{57}Here comes	another	victim...{62}"
					; 0xA60E: PRINT	MSG 0x065B, END: "{5B}:	Are you	going to enter{57}this Hall of the Undead{57}at	all costs?{58}"
		ScriptID    $74D,$1	; Answer 'yes': Run text script at offset 0x0285B8
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0x860F: PRINT	MSG 0x065C: "{5B}: Brave boy!{57}You have to solve{57}eight riddles in eight rooms.{62}"
					; 0x8610: PRINT	MSG 0x065D: "{5B}: If you correctly solve{57}the riddle	for the	room,{57}the torch will	go out.{62}"
					; 0x8611: PRINT	MSG 0x065E: "{5B}: You can go to the{57}other side of the river	when{57}all eight riddles are solved.{62}"
					; 0xE612: PRINT	MSG 0x065F, MSGBOX CLEARED, END: "{5B}:	But, if	you fail...{57}heh heh heh...it'll be{57}the end of your life...{5E}"
		ScriptID    $752,$2	; Answer 'no':  Run text script at offset 0x0285C2
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0xE613: PRINT	MSG 0x0660, MSGBOX CLEARED, END: "{5B}:	Go away!{57}Don't ever come here again!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0077:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $754,$0	; Prompt:	Run text script	at offset 0x0285C6
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0x8614: PRINT	MSG 0x0661: "{5B}: Heh heh heh...{57}there are still more riddles{57}to	solve over there...{62}"
					; 0xA615: PRINT	MSG 0x0662, END: "{5B}:	Do you really want{57}to go across the river?{58}"
		ScriptID    $758,$1	; Answer 'yes': Run text script at offset 0x0285CE
					; 0xE617: PRINT	MSG 0x0664, MSGBOX CLEARED, END: "{5B}:	OK...heh heh...{57}I'll take you to...{57}Gehenna!!{5E}"
		ScriptID    $757,$2	; Answer 'no':  Run text script at offset 0x0285CC
					; 0xE616: PRINT	MSG 0x0663, MSGBOX CLEARED, END: "{5B}:	Heh heh	heh...Indeed.{57}You had better	go back...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0079:
		move.w	#ITM_ARMLET,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	XS_0079_0
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $75A,$0	; Prompt:	Run text script	at offset 0x0285D2
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0x8619: PRINT	MSG 0x0666: "{5B}: ...Impossible...{57}How is it you came back alive?{62}"
					; 0xA61A: PRINT	MSG 0x0667, END: "{5B}:	...Are you going{57}back to town?{58}"
		ScriptID    $75E,$1	; Answer 'yes': Run text script at offset 0x0285DA
					; 0xE61C: PRINT	MSG 0x0669, MSGBOX CLEARED, END: "{5B}:	...C'mon...{5E}"
		ScriptID    $75D,$2	; Answer 'no':  Run text script at offset 0x0285D8
					; 0xE61B: PRINT	MSG 0x0668, MSGBOX CLEARED, END: "{5B}:	Do as you like.{5E}"
; ---------------------------------------------------------------------------
		bra.s	XS_0079_1
; ---------------------------------------------------------------------------

XS_0079_0:				; CODE XREF: ROM:000274CEj
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $760,$0	; Prompt:	Run text script	at offset 0x0285DE
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0x861E: PRINT	MSG 0x066B: "{5B}: Heh heh heh...{57}Welcome back from the pit...{62}"
					; 0xA61F: PRINT	MSG 0x066C, END: "{5B}:	Are you	going back?{58}"
		ScriptID    $764,$1	; Answer 'yes': Run text script at offset 0x0285E6
					; 0xE621: PRINT	MSG 0x066E, MSGBOX CLEARED, END: "{5B}:	Heh heh	heh...{5E}"
		ScriptID    $763,$2	; Answer 'no':  Run text script at offset 0x0285E4
					; 0xE620: PRINT	MSG 0x066D, MSGBOX CLEARED, END: "{5B}:	Do as you like.{5E}"
; ---------------------------------------------------------------------------

XS_0079_1:				; CODE XREF: ROM:000274DAj
		rts
; ---------------------------------------------------------------------------

XS_007A:
		move.w	#ITM_ARMLET,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	XS_007A_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $75F,$0	; Run text script at offset 0x0285DC
					; 0xE61D: PRINT	MSG 0x066A, MSGBOX CLEARED, END: "{5B}:	I can see there's{57}something about you...{57}I don't know what it is...{5E}"
; ---------------------------------------------------------------------------
		bra.s	XS_007A_1
; ---------------------------------------------------------------------------

XS_007A_0:				; CODE XREF: ROM:000274F0j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $765,$0	; Run text script at offset 0x0285E8
					; 0xE622: PRINT	MSG 0x066F, MSGBOX CLEARED, END: "{5B}:	Heh heh...come back{57}anytime you like...the undead{57}are always waiting...{5E}"
; ---------------------------------------------------------------------------

XS_007A_1:				; CODE XREF: ROM:000274F6j
		rts
; ---------------------------------------------------------------------------

XS_007D:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $769,$0	; Prompt:	Run text script	at offset 0x0285F0
					; 0x1834: LOAD CHARACTER SCRIPT	Mir (0x0034)
					; 0xA625: PRINT	MSG 0x0672, END: "{5B}:	Are you	going in{57}at all costs?{58}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028EAA
		ScriptID    $76B,$2	; Answer 'no':  Run text script at offset 0x0285F4
					; 0x1834: LOAD CHARACTER SCRIPT	Mir (0x0034)
					; 0xE626: PRINT	MSG 0x0673, MSGBOX CLEARED, END: "{5B}:	Go back	now.{57}Never step foot	in this{57}tower again.{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_007E:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $76D,$0	; Prompt:	Run text script	at offset 0x0285F8
					; 0x1834: LOAD CHARACTER SCRIPT	Mir (0x0034)
					; 0xA627: PRINT	MSG 0x0674, END: "{5B}:	Anything I can do for you?{58}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028EAA
		ScriptID    $76F,$2	; Answer 'no':  Run text script at offset 0x0285FC
					; 0x1834: LOAD CHARACTER SCRIPT	Mir (0x0034)
					; 0xE628: PRINT	MSG 0x0675, MSGBOX CLEARED, END: "{5B}:	Go back	right now!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_007F:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $771,$0	; Prompt:	Run text script	at offset 0x028600
					; 0x1834: LOAD CHARACTER SCRIPT	Mir (0x0034)
					; 0xA629: PRINT	MSG 0x0676, END: "{5B}:	Do you dare come in?{58}"
		ScriptID    $773,$1	; Answer 'yes': Run text script at offset 0x028604
					; 0x1834: LOAD CHARACTER SCRIPT	Mir (0x0034)
					; 0xE62A: PRINT	MSG 0x0677, MSGBOX CLEARED, END: "{5B}:	I think	you had	better{57}go back...{5E}"
		ScriptID    $775,$2	; Answer 'no':  Run text script at offset 0x028608
					; 0x1834: LOAD CHARACTER SCRIPT	Mir (0x0034)
					; 0xE62B: PRINT	MSG 0x0678, MSGBOX CLEARED, END: "{5B}:	Ha ha ha ha ha!...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0089:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $7A3,$0	; Run text script at offset 0x028664
					; 0x1834: LOAD CHARACTER SCRIPT	Mir (0x0034)
					; 0xA647: PRINT	MSG 0x0694, END: "{5B}:	I'm going to send you{57}directly to the ground, OK?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bsr.w	ClearTextbox
		rts
; ---------------------------------------------------------------------------

XS_0091:
		trap	#0
; ---------------------------------------------------------------------------
		dc.w SND_NigelDie
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $7C6,$0	; Run text script at offset 0x0286AA
					; 0x865D: PRINT	MSG 0x06AA: "The red and purple	jewels{57}were taken away from Nigel!{62}"
					; 0x1BF1: LOAD SPECIAL CHARACTER Duke (0x09)
					; 0xE65E: PRINT	MSG 0x06AB, MSGBOX CLEARED, END: "{5B}:	Mr. Nigel!  Have a{57}good time	with that{57}silly old cow!  Ha	ha ha!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00A5:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $813,$0	; Run text script at offset 0x028744
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0x8693: PRINT	MSG 0x06E0: "{5B}: Look, Nigel!{57}This	dog is badly hurt!{62}"
					; 0x8694: PRINT	MSG 0x06E1: "{5B}: Poor	dog!{57}I'll cast a spell on you{57}to make you better.  Nigel!{62}"
					; 0x0400: LOAD 0x0000 INTO 0xFF1198 (EkeEke)
					; 0xA695: PRINT	MSG 0x06E2, END: "{5B}:	Give me	an {5F}!{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	XS_00A5_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $821,$0	; Run text script at offset 0x028760
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0xA69B: PRINT	MSG 0x06E8, END: "{5B}:	But...he's nearly{57}dead!  Please!{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	XS_00A5_0
		bsr.s	XS_00A5_2
		beq.s	XS_00A5_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $823,$0	; Run text script at offset 0x028764
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0xE69C: PRINT	MSG 0x06E9, MSGBOX CLEARED, END: "{5B}:	I hate you!!{5E}"
; ---------------------------------------------------------------------------
		bra.s	XS_00A5_1
; ---------------------------------------------------------------------------

XS_00A5_0:				; CODE XREF: ROM:00027542j
					; ROM:0002754Cj
		bsr.s	XS_00A5_2
		beq.s	XS_00A5_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $818,$0	; Run text script at offset 0x02874E
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0xE696: PRINT	MSG 0x06E3, MSGBOX CLEARED, END: "{5B}:	Thanks!{57}It's all right, poor dog!{5E}"
; ---------------------------------------------------------------------------

XS_00A5_1:				; CODE XREF: ROM:00027550j
					; ROM:00027556j ...
		rts

; =============== S U B	R O U T	I N E =======================================


XS_00A5_2:				; CODE XREF: ROM:0002754Ep
					; ROM:XS_00A5_0p
		move.w	(word_FF1198).l,d0
		bsr.w	CheckIfItemIsOwned
		bne.s	XS_00A5_3
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $825,$0	; Run text script at offset 0x028768
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0x0400: LOAD 0x0000 INTO 0xFF1198 (EkeEke)
					; 0xE69D: PRINT	MSG 0x06EA, MSGBOX CLEARED, END: "{5B}:	You don't have any {5F}?{57}Quickly!  Get some and{57}hurry back so I can cure him.{5E}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l

XS_00A5_3:				; CODE XREF: XS_00A5_2+Aj
		rts
; End of function XS_00A5_2

; ---------------------------------------------------------------------------

XS_00AC:
		movem.l	d0/d6-a0,-(sp)
		lea	XS_00AC_Options(pc),a0
		moveq	#4,d6
		jsr	(j_GenerateRandomNumber).l
		add.w	d7,d7
		move.w	(a0,d7.w),d0
		bsr.w	RunTextCmd
		movem.l	(sp)+,d0/d6-a0
		rts
; ---------------------------------------------------------------------------
XS_00AC_Options:ScriptID    $83F,$0	; DATA XREF: ROM:0002757Et
					; Run text script at offset 0x02879C
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE6A9: PRINT	MSG 0x06F6, MSGBOX CLEARED, END: "{5B}:	Oh!!{57}Don't frighten me like that!{5E}"
		ScriptID    $841,$1	; Run text script at offset 0x0287A0
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE6AA: PRINT	MSG 0x06F7, MSGBOX CLEARED, END: "{5B}:	The view from here is{57}splendid, huh?{57}'Bye, now!{5E}"
		ScriptID    $843,$2	; Run text script at offset 0x0287A4
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE6AB: PRINT	MSG 0x06F8, MSGBOX CLEARED, END: "{5B}:	Tag!{57}You're it!!{5E}"
		ScriptID    $845,$3	; Run text script at offset 0x0287A8
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE6AC: PRINT	MSG 0x06F9, MSGBOX CLEARED, END: "{5B}:	You're very lucky!{57}That's it!{5E}"
; ---------------------------------------------------------------------------

XS_00AD:
		movem.l	d0/d6-a0,-(sp)
		lea	XS_00AD_Options(pc),a0
		moveq	#4,d6
		jsr	(j_GenerateRandomNumber).l
		add.w	d7,d7
		move.w	(a0,d7.w),d0
		bsr.w	RunTextCmd
		movem.l	(sp)+,d0/d6-a0
		rts
; ---------------------------------------------------------------------------
XS_00AD_Options:ScriptID    $847,$0	; DATA XREF: ROM:000275A6t
					; Run text script at offset 0x0287AC
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE6AD: PRINT	MSG 0x06FA, MSGBOX CLEARED, END: "{5B}:	Woah!  That made me dizzy!{5E}"
		ScriptID    $849,$1	; Run text script at offset 0x0287B0
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE6AE: PRINT	MSG 0x06FB, MSGBOX CLEARED, END: "{5B}:	Listen carefully!{57}Dne daed a	si siht!{5E}"
		ScriptID    $84B,$2	; Run text script at offset 0x0287B4
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE6AF: PRINT	MSG 0x06FC, MSGBOX CLEARED, END: "{5B}:	Just a little further,{57}and you'll find...{59}a...{57}dead end!  Hahahah!{5E}"
		ScriptID    $84D,$3	; Run text script at offset 0x0287B8
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE6B0: PRINT	MSG 0x06FD, MSGBOX CLEARED, END: "{5B}:	You don't need me?{57}{59}Bye-bye!{5E}"
; ---------------------------------------------------------------------------

XS_00B2:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $85C,$0	; Run text script at offset 0x0287D6
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0x86BA: PRINT	MSG 0x0707: "{5B}: I can't see you, but{57}I'm glad to meet you.{62}"
					; 0x86BB: PRINT	MSG 0x0708: "{5B}: I'm having my lunch.{57}I can't see it, but it looks{57}good.  Would you like some?{62}"
					; 0xA6BC: PRINT	MSG 0x0709, END: "{5B}:	You're in hurry?{62}"
; ---------------------------------------------------------------------------
		move.w	#ITM_RESTORATION,d0
		bsr.w	GetRemainingItemAllowedCount
		beq.s	XS_00B2_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $860,$0	; Run text script at offset 0x0287DE
					; 0x86BD: PRINT	MSG 0x070A: "{5B}: I'll give you this.{57}I can't see it, but it{57}sure looks good.{62}"
					; 0x002E: LOAD 0x002E INTO 0xFF1196 (Restora{69}tion)
					; 0x17E8: RECEIVE ITEM [0xFF1196]
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE6BE: PRINT	MSG 0x070B, MSGBOX CLEARED, END: "{5B}:	I enjoyed talking{57}with you!	I can't see you,{57}but you're still my friend.{5E}"
; ---------------------------------------------------------------------------
		bra.s	XS_00B2_1
; ---------------------------------------------------------------------------

XS_00B2_0:				; CODE XREF: ROM:000275D6j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $865,$0	; Run text script at offset 0x0287E8
					; 0xE6BF: PRINT	MSG 0x070C, MSGBOX CLEARED, END: "{5B}:	Good luck!{57}I	can't see you, but{57}good luck!M"
; ---------------------------------------------------------------------------

XS_00B2_1:				; CODE XREF: ROM:000275DCj
		rts
; ---------------------------------------------------------------------------

XS_00B3:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $866,$0	; Run text script at offset 0x0287EA
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Sun{6A}Stone)
					; 0x86C0: PRINT	MSG 0x070D: "{5B}: Nigel, look!{57}I can see something shining{57}over there! The {5F}!{62}"
					; 0x1BE8: LOAD SPECIAL CHARACTER Nigel (0x00)
					; 0xE6C1: PRINT	MSG 0x070E, MSGBOX CLEARED, END: "{5B}:	But we can't{57}get through those trees...{5E}"
; ---------------------------------------------------------------------------
		moveq	#ITM_EINSTEINWHISTLE,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	XS_00B3_0
		bsr.w	ClearTextbox
		st	d0
		bra.s	XS_00B3_1
; ---------------------------------------------------------------------------

XS_00B3_0:				; CODE XREF: ROM:000275EEj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $875,$0	; Run text script at offset 0x028808
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0xE6C7: PRINT	MSG 0x0714, MSGBOX CLEARED, END: "{5B}:	Maybe we should{57}start over from the{57}very beginning...{5E}"
; ---------------------------------------------------------------------------
		clr.b	d0

XS_00B3_1:				; CODE XREF: ROM:000275F6j
		move.b	d0,(g_YesNoPromptResult).l
		rts
; ---------------------------------------------------------------------------

XS_00C1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $8B2,$0	; Prompt:	Run text script	at offset 0x028882
					; 0x18F7: LOAD CHARACTER SCRIPT	* (0x00F7)
					; 0x86E9: PRINT	MSG 0x0736: "{5B}: The ship will soon set sail{57}for Verla!  You can get on{57}for free because you{62}"
					; 0xA6EA: PRINT	MSG 0x0737, END: "{5B}:	fixed the lighthouse!{57}Getting on now?{58}"
		ScriptID    $8B5,$1	; Answer 'yes': Run text script at offset 0x028888
					; 0x14D9: SET BIT 1 OF FLAG 0x01B
					; 0xE6EB: PRINT	MSG 0x0738, MSGBOX CLEARED, END: "{5B}:	Get on board!{57}We're leaving soon!{5E}"
		ScriptID    $8B8,$2	; Answer 'no':  Run text script at offset 0x02888E
					; 0xE6ED: PRINT	MSG 0x073A, MSGBOX CLEARED, END: "{5B}:	OK, I'll{57}wait a while for you...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00E5:				; Trap0
		trap	#0
; ---------------------------------------------------------------------------
		dc.w SND_MusicDukeChase
; ---------------------------------------------------------------------------
		trap	#1		; Trap1
; ---------------------------------------------------------------------------
		ScriptID    $93A,$0	; Run text script at offset 0x028992
					; 0x1BF1: LOAD SPECIAL CHARACTER Duke (0x09)
					; 0x8744: PRINT	MSG 0x0791: "{5B}: You again!{62}"
					; 0xE745: PRINT	MSG 0x0792, MSGBOX CLEARED, END: "{5B}:	I think	it's time{57}to stop playing tag with you!{57}Come here!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00E9:				; Trap1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $948,$0	; Run text script at offset 0x0289AE
					; 0x1836: LOAD CHARACTER SCRIPT	Lara (0x0036)
					; 0x874D: PRINT	MSG 0x079A: "{5B}: Eeeeeeeee!{57}Noooooooooooo!{62}"
					; 0xA74E: PRINT	MSG 0x079B, END: "{5B}:	...O-OK...{57}you...win...!{62}"
; ---------------------------------------------------------------------------
		trap	#0		; Trap0
; ---------------------------------------------------------------------------
		dc.w SND_FadeOut
; ---------------------------------------------------------------------------
		bsr.w	Sleep_0
; ---------------------------------------------------------------------------
		dc.w 59
; ---------------------------------------------------------------------------
		trap	#0		; Trap0
; ---------------------------------------------------------------------------
		dc.w SND_MusicMap
; ---------------------------------------------------------------------------
		trap	#1		; Trap1
; ---------------------------------------------------------------------------
		ScriptID    $94B,$0	; Run text script at offset 0x0289B4
					; 0x1836: LOAD CHARACTER SCRIPT	Lara (0x0036)
					; 0x874F: PRINT	MSG 0x079C: "{5B}: Oh, guardian{59}of the{57}darkness...{59}When the five{57}stones gather{59} here...{62}"
					; 0xE750: PRINT	MSG 0x079D, MSGBOX CLEARED, END: "{5B}:	show to	me...the{57}secret passage!{57}{59}In-nah{59} Gad'da{59} da{59} V'idda!{5E}"
; ---------------------------------------------------------------------------
		trap	#0		; Trap0
; ---------------------------------------------------------------------------
		dc.w SND_FadeOut
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00EB:
		bsr.w	RestoreBGM_1
		trap	#1		; Trap1
; ---------------------------------------------------------------------------
		ScriptID    $950,$0	; Run text script at offset 0x0289BE
					; 0x1836: LOAD CHARACTER SCRIPT	Lara (0x0036)
					; 0x8752: PRINT	MSG 0x079F: "{5B}: Oh, my prince!{57}I just knew you'd{57}come to save me...!{62}"
					; 0xE753: PRINT	MSG 0x07A0, MSGBOX CLEARED, END: "{5B}:	You are	my prince!{57}Oh, it's just like a fairy tale{57}come true!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00F0:				; Trap1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $964,$0	; Run text script at offset 0x0289E6
					; 0x1836: LOAD CHARACTER SCRIPT	Lara (0x0036)
					; 0x8760: PRINT	MSG 0x07AD: "{5B}: Stay	out of this, Moralis!{57}I can handle this mini-witch{57}by myself!{62}"
					; 0x1822: LOAD CHARACTER SCRIPT	Moralis	(0x0022)
					; 0xA761: PRINT	MSG 0x07AE, END: "{5B}:	Princess!!{57}Mr. Nigel	and Miss Friday{57}saved your life!{62}"
; ---------------------------------------------------------------------------
		trap	#0		; Trap0
; ---------------------------------------------------------------------------
		dc.w SND_MusicFinalCutscene
; ---------------------------------------------------------------------------
		trap	#1		; Trap1
; ---------------------------------------------------------------------------
		ScriptID    $968,$0	; Run text script at offset 0x0289EE
					; 0x1836: LOAD CHARACTER SCRIPT	Lara (0x0036)
					; 0x8762: PRINT	MSG 0x07AF: "{5B}: ...{59}yeah{59}...I'm sorry...{57}but...{59}but...{59}I was so scared!...{62}"
					; 0x8763: PRINT	MSG 0x07B0: "{5B}: ...sob...{57}every day I dropped something{57}down from the tower, but{62}"
					; 0x8764: PRINT	MSG 0x07B1: "{5B}: nobody came!{57}Nobody noticed a thing!{57}...I was scared!{62}"
					; 0x1822: LOAD CHARACTER SCRIPT	Moralis	(0x0022)
					; 0x8765: PRINT	MSG 0x07B2: "{5B}: ...OK, OK...{57}Let's go back home,{57}Princess Rolia.{62}"
					; 0x1836: LOAD CHARACTER SCRIPT	Lara (0x0036)
					; 0xE766: PRINT	MSG 0x07B3, MSGBOX CLEARED, END: "{5B}:	...Boo,	hoo, hoo!...{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00F2:
		bsr.w	RestoreBGM_1
		trap	#1		; Trap1
; ---------------------------------------------------------------------------
		ScriptID    $973,$0	; Run text script at offset 0x028A04
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0x8769: PRINT	MSG 0x07B6: "{5B}: Poor	girl...{57}I think she must've cracked{57}being alone in that{62}"
					; 0x876A: PRINT	MSG 0x07B7: "{5B}: tower for so	long...{57}Imagine her calling you{57}"my prince!"  The	nerve!{62}"
					; 0xE76B: PRINT	MSG 0x07B8, MSGBOX CLEARED, END: "{5B}:	Anyway...let's go!{57}We have to catch up with{57}Duke Mercator!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00FE:				; Trap1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $999,$0	; Run text script at offset 0x028A50
					; 0x1805: LOAD CHARACTER SCRIPT	Owner (0x0005)
					; 0xA781: PRINT	MSG 0x07CE, END: "Nigel	got{57}2000 golds!"
; ---------------------------------------------------------------------------
		bsr.w	Sleep_0
; ---------------------------------------------------------------------------
		dc.w 119
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0122:				; Trap1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $9E2,$0	; Run text script at offset 0x028AE2
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0x87A8: PRINT	MSG 0x07F5: "{5B}: Welcome!{57}Let's play Roulette!{62}"
					; 0x87A9: PRINT	MSG 0x07F6: "{5B}: The game starts when	you{57}get on the big ball!  If	the{57}ball stops on a red plate,{62}"
					; 0xA7AA: PRINT	MSG 0x07F7, END: "{5B}:	you'll get 200 golds!{57}50 golds for one play!{57}Try your luck?{58}"
; ---------------------------------------------------------------------------
		moveq	#50,d0

XS_0122_0:				; CODE XREF: ROM:000276A8j
					; ROM:000276B0j
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0122_3
		jsr	(j_RemoveGold).l
		bcs.s	XS_0122_1
		trap	#1		; Trap1
; ---------------------------------------------------------------------------
		ScriptID    $9E6,$0	; Run text script at offset 0x028AEA
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE7AB: PRINT	MSG 0x07F8, MSGBOX CLEARED, END: "{5B}:	Good luck!{5E}"
; ---------------------------------------------------------------------------
		bra.s	XS_0122_2
; ---------------------------------------------------------------------------

XS_0122_1:				; CODE XREF: ROM:00027678j
		trap	#1		; Trap1
; ---------------------------------------------------------------------------
		ScriptID    $9E8,$0	; Run text script at offset 0x028AEE
					; 0xE7AC: PRINT	MSG 0x07F9, MSGBOX CLEARED, END: "{5B}:	Sorry...I can't{57}lower the price!{5E}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l

XS_0122_2:				; CODE XREF: ROM:0002767Ej
		bra.s	XS_0122_4
; ---------------------------------------------------------------------------

XS_0122_3:				; CODE XREF: ROM:00027670j
		trap	#1		; Trap1
; ---------------------------------------------------------------------------
		ScriptID    $9E9,$0	; Run text script at offset 0x028AF0
					; 0xE7AD: PRINT	MSG 0x07FA, MSGBOX CLEARED, END: "{5B}:	Ohhhh...so close!{5E}"
; ---------------------------------------------------------------------------

XS_0122_4:				; CODE XREF: ROM:XS_0122_2j
		rts
; ---------------------------------------------------------------------------

XS_0123:
		move.l	#200,(g_PrintNumericDwordValue).l

XS_0127:				; CODE XREF: ROM:000276BCj
		trap	#1		; Trap1
; ---------------------------------------------------------------------------
		ScriptID    $9EA,$0	; Run text script at offset 0x028AF2
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0x87AE: PRINT	MSG 0x07FB: "{5B}: Congratulations!{57}Here ya go!{62}"
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE7AF: PRINT	MSG 0x07FC, MSGBOX CLEARED, END: "{5B}:	See you	again!{5E}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0125:				; Trap1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $9F1,$0	; Run text script at offset 0x028B00
					; 0x193A: LOAD CHARACTER SCRIPT	* (0x013A)
					; 0x87B1: PRINT	MSG 0x07FE: "{5B}: Hello!  Let's play{57}Chicken Toss!{57}Try to catch as many{62}"
					; 0x87B2: PRINT	MSG 0x07FF: "{5B}: chickens as you can and{57}throw them into the pen{57}before	the time runs out!{62}"
					; 0x87B3: PRINT	MSG 0x0800: "{5B}: Room	record is {5A}.{57}You'll get 5 golds{57}per chicken.{62}"
					; 0x87B4: PRINT	MSG 0x0801: "{5B}: The game starts when	you{57}get on the red square.{62}"
					; 0xA7B5: PRINT	MSG 0x0802, END: "{5B}:	20 golds for one turn.{57}Wanna	try?{58}"
; ---------------------------------------------------------------------------
		moveq	#20,d0
		bra.s	XS_0122_0
; ---------------------------------------------------------------------------

XS_0128:				; Trap1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $9F9,$0	; Run text script at offset 0x028B10
					; 0x193B: LOAD CHARACTER SCRIPT	* (0x013B)
					; 0x87B7: PRINT	MSG 0x0804: "{5B}: Welcome to the{57}Chicken Race!{62}"
					; 0x87B8: PRINT	MSG 0x0805: "{5B}: Ride	one of the four{57}chickens...If your chicken{57}comes in first, you'll get{62}"
					; 0x87B9: PRINT	MSG 0x0806: "{5B}: 200 golds.{62}"
					; 0xA7BA: PRINT	MSG 0x0807, END: "{5B}:	50 golds for one race.{57}Give it a try?{58}"
; ---------------------------------------------------------------------------
		moveq	#50,d0
		bra.s	XS_0122_0
; ---------------------------------------------------------------------------

XS_0129:
		move.l	#200,(g_PrintNumericDwordValue).l
		bra.s	XS_0127
; ---------------------------------------------------------------------------

XS_012A:
		moveq	#ITM_CASINOTICKET,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	XS_012A_2
		trap	#1		; Trap1
; ---------------------------------------------------------------------------
		ScriptID    $9FF,$0	; Run text script at offset 0x028B1C
					; 0x193C: LOAD CHARACTER SCRIPT	* (0x013C)
					; 0x0416: LOAD 0x0016 INTO 0xFF1198 (Casino{6A}Ticket)
					; 0xA7BC: PRINT	MSG 0x0809, END: "{5B}:	Oh!  I see you have a{57}casino	ticket.{57}Care	to come	in?{58}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_012A_0
		bsr.w	CheckAndConsumeItem
		trap	#1		; Trap1
; ---------------------------------------------------------------------------
		ScriptID    $A02,$0	; Run text script at offset 0x028B22
					; 0x193C: LOAD CHARACTER SCRIPT	* (0x013C)
					; 0xE7BD: PRINT	MSG 0x080A, MSGBOX CLEARED, END: "{5B}:	Welcome	to{57}the Casino Arthurlier!{57}Have fun!{5E}"
; ---------------------------------------------------------------------------
		bra.s	XS_012A_1
; ---------------------------------------------------------------------------

XS_012A_0:				; CODE XREF: ROM:000276CEj
		trap	#1		; Trap1
; ---------------------------------------------------------------------------
		ScriptID    $A04,$0	; Run text script at offset 0x028B26
					; 0x193C: LOAD CHARACTER SCRIPT	* (0x013C)
					; 0xE7BE: PRINT	MSG 0x080B, MSGBOX CLEARED, END: "{5B}:	See you!{5E}"
; ---------------------------------------------------------------------------

XS_012A_1:				; CODE XREF: ROM:000276D8j
		bra.s	XS_012A_3
; ---------------------------------------------------------------------------

XS_012A_2:				; CODE XREF: ROM:000276C4j
		trap	#1		; Trap1
; ---------------------------------------------------------------------------
		ScriptID    $A06,$0	; Run text script at offset 0x028B2A
					; 0x193C: LOAD CHARACTER SCRIPT	* (0x013C)
					; 0x0416: LOAD 0x0016 INTO 0xFF1198 (Casino{6A}Ticket)
					; 0xE7BF: PRINT	MSG 0x080C, MSGBOX CLEARED, END: "{5B}:	Sorry.	You can't come in{57}unless you have a{57}{5F}!{5E}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l

XS_012A_3:				; CODE XREF: ROM:XS_012A_1j
		rts
; ---------------------------------------------------------------------------

XS_012B:
		clr.b	(g_YesNoPromptResult).l
		move.w	#$E0,d0	; 'à'
		bsr.w	TestFlagBit
		beq.s	XS_012B_2
		move.w	#$E1,d0	; 'á'
		bsr.w	TestFlagBit
		beq.s	XS_012B_0
		trap	#1		; Trap1
; ---------------------------------------------------------------------------
		ScriptID    $A0F,$0	; Run text script at offset 0x028B3C
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE7C3: PRINT	MSG 0x0810, MSGBOX CLEARED, END: "{5B}:	I wish we could	grow{57}more trees underground...{5E}"
; ---------------------------------------------------------------------------
		bra.s	XS_012B_1
; ---------------------------------------------------------------------------

XS_012B_0:				; CODE XREF: ROM:00027704j
		st	(g_YesNoPromptResult).l
		trap	#1		; Trap1
; ---------------------------------------------------------------------------
		ScriptID    $A0C,$0	; Run text script at offset 0x028B36
					; 0x14E1: SET BIT 1 OF FLAG 0x01C
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE7C2: PRINT	MSG 0x080F, MSGBOX CLEARED, END: "{5B}:	You met	my father, right?{57}In	that case, go on up and{57}cut the tree	to make	a raft!{5E}"
; ---------------------------------------------------------------------------

XS_012B_1:				; CODE XREF: ROM:0002770Aj
		bra.s	XS_012B_3
; ---------------------------------------------------------------------------

XS_012B_2:				; CODE XREF: ROM:000276FAj
		trap	#1		; Trap1
; ---------------------------------------------------------------------------
		ScriptID    $A09,$0	; Run text script at offset 0x028B30
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0x87C0: PRINT	MSG 0x080D: "{5B}: There's one lone tree{57}standing up above.  Trees{57}are very rare here, so{62}"
					; 0x87C1: PRINT	MSG 0x080E: "{5B}: I'm standing guard!{5E}"
					; 0x14E1: SET BIT 1 OF FLAG 0x01C
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE7C2: PRINT	MSG 0x080F, MSGBOX CLEARED, END: "{5B}:	You met	my father, right?{57}In	that case, go on up and{57}cut the tree	to make	a raft!{5E}"
; ---------------------------------------------------------------------------

XS_012B_3:				; CODE XREF: ROM:XS_012B_1j
		rts
; ---------------------------------------------------------------------------
