; ---------------------------------------------------------------------------

XS_001B:
		move.w	#$21,d0	; '!'
		bsr.w	TestFlagBit
		bne.s	XS_001B_0
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $41C,$0	; Prompt:	Run text script	at offset 0x027E32
					; 0x1BE9: LOAD SPECIAL CHARACTER FLORA (0x01)
					; 0xA385: PRINT	MSG 0x03D3, END: "{47}GEHST DU ZUM{43}VERSTECK DER DIEBE?{44}"
		ScriptID    $41E,$1	; Answer 'yes': Run text script at offset 0x027E36
					; 0xE386: PRINT	MSG 0x03D4, MSGBOX CLEARED, END: "{47}NA, DANN LOS!{4A}"
		ScriptID    $41F,$2	; Answer 'no':  Run text script at offset 0x027E38
					; 0xE387: PRINT	MSG 0x03D5, MSGBOX CLEARED, END: "{47}WARUM NICHT?{43}WÄRE BESTIMMT SEHR LUSTIG!{4A}"
; ---------------------------------------------------------------------------
		bra.s	XS_001B_1
; ---------------------------------------------------------------------------

XS_001B_0:				; CODE XREF: ROM:00027164j
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $420,$0	; Prompt:	Run text script	at offset 0x027E3A
					; 0x1BE9: LOAD SPECIAL CHARACTER FLORA (0x01)
					; 0xA388: PRINT	MSG 0x03D6, END: "{47}GEHST DU ZUM{43}VERSTECK DER DIEBE?{44}"
		ScriptID    $422,$1	; Answer 'yes': Run text script at offset 0x027E3E
					; 0xE389: PRINT	MSG 0x03D7, MSGBOX CLEARED, END: "{47}NA, DANN LOS!{4A}"
		ScriptID    $423,$2	; Answer 'no':  Run text script at offset 0x027E40
					; 0xE38A: PRINT	MSG 0x03D8, MSGBOX CLEARED, END: "{47}STIMMT.{43}WIR MÜSSEN JA AUCH NICHT{43}GEHEN.{4A}"
; ---------------------------------------------------------------------------

XS_001B_1:				; CODE XREF: ROM:00027170j
		rts
; ---------------------------------------------------------------------------

XS_001C:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $424,$0	; Prompt:	Run text script	at offset 0x027E42
					; 0x1BE9: LOAD SPECIAL CHARACTER FLORA (0x01)
					; 0xA38B: PRINT	MSG 0x03D9, END: "{47}GEHST DU{43}ZURÜCK IN DIE	STADT?{44}"
		ScriptID    $426,$1	; Answer 'yes': Run text script at offset 0x027E46
					; 0xE38C: PRINT	MSG 0x03DA, MSGBOX CLEARED, END: "{47}GUT! AUF GEHT'S!{4A}"
		ScriptID    $427,$2	; Answer 'no':  Run text script at offset 0x027E48
					; 0xE38D: PRINT	MSG 0x03DB, MSGBOX CLEARED, END: "{47}WIR MÜSSEN HIER{43}NOCH EINE MENGE ERLEDIGEN.{4A}"
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
		ScriptID    $467,$0	; Run text script at offset 0x027EC8
					; 0x0027: LOAD 0x0027 INTO 0xFF1196 (STEIN{55}TAFEL)
					; 0x83AB: PRINT	MSG 0x03F9: "NIELS ÜBERGIBT{43}DIE {4B}.{4A}"
					; 0x182E: LOAD CHARACTER SCRIPT	KAYLA (0x002E)
					; 0xE3AC: PRINT	MSG 0x03FA, MSGBOX CLEARED, END: "{47}HAHAHAHAHA!{43}GUT, MEIN JUNGE!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_002E:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $475,$0	; Run text script at offset 0x027EE4
					; 0x181D: LOAD CHARACTER SCRIPT	PURIN (0x001D)
					; 0xA3B2: PRINT	MSG 0x0400, END: "{47}HALLO. ICH BIN{43}PURIN. ICH BIN ZWÖLF. MADAME{43}YARD IST MEINE MAMA.{4E}{47}WILLST DU MIT{43}MIR SPIELEN?{4E}{47}DU GEFÄLLST MIR!{43}WILLST DU MEIN FREUND SEIN?{44}"
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
		ScriptID    $1A6,$0	; Run text script at offset 0x027946
					; 0x18AA: LOAD CHARACTER SCRIPT	* (0x00AA)
					; 0xE176: PRINT	MSG 0x01C4, MSGBOX CLEARED, END: "{47}WENN SE KEIN'{43}GELEITBRIEF HA'M, KÖNN' SE{43}HIER NICH' REIN!{4A}"
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1AA,$0	; Run text script at offset 0x02794E
					; 0x18AB: LOAD CHARACTER SCRIPT	* (0x00AB)
					; 0xE179: PRINT	MSG 0x01C7, MSGBOX CLEARED, END: "{47}MEINE BEINE TUN{43}SCHON WEH VOM HERUMSTEHEN{43}DEN GANZEN TAG.{4A}"
; ---------------------------------------------------------------------------
		bra.s	XS_0036_5
; ---------------------------------------------------------------------------

XS_0036_0:				; CODE XREF: ROM:000271A6j
		move.l	d0,-(sp)
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $487,$0	; Run text script at offset 0x027F08
					; 0x18AA: LOAD CHARACTER SCRIPT	* (0x00AA)
					; 0x83BB: PRINT	MSG 0x0409: "{47}DU KANNST JETZT{43}HINEIN, ABER...{4E}{47}DU KANNST NICHT{43}KOSTENLOS	DURCH DIESES TOR!{43}HEH, HEH, HEH...{4E}{47}HÖR ZU. BEI MIR{43}IST ZUR	ZEIT ZIEMLICH EBBE IM{43}PORTEMONNAIE, UND DAS BABY{4E}{47}BRAUCHT SCHON{43}WIEDER NEUE	SCHUHE.{4E}"
					; 0x10C8: LOAD 200 INTO	NUMERIC	VARIABLE
					; 0xA3BC: PRINT	MSG 0x040A, END: "{47}HE HE...ICH LASS{43}DICH FÜR {46}	TALER REIN. NA?{44}"
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
		ScriptID    $48C,$0	; Run text script at offset 0x027F12
					; 0xE3BE: PRINT	MSG 0x040C, MSGBOX CLEARED, END: "{47}...WAS, MEHR{43}NICHT? NA, DANN GEH!{4A}"
; ---------------------------------------------------------------------------
		bra.s	XS_0036_2
; ---------------------------------------------------------------------------

XS_0036_1:				; CODE XREF: ROM:000271CAj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $48B,$0	; Run text script at offset 0x027F10
					; 0xE3BD: PRINT	MSG 0x040B, MSGBOX CLEARED, END: "{47}OH, DANKE!{43}DU MUSST JA	REICH SEIN! UND{43}NOCH	WAS...WENN DU DEIN GELD{4E}{47}VERDOPPELN{43}WILLST, GEH ZU GRIHNPIES IN DIE{43}STADT. DORT KANNST DU GEWINNEN{4E}{47}ODER ALLES{43}VERLIEREN. DAS GLÜCK{43}ENTSCHEIDET!{4A}"
; ---------------------------------------------------------------------------

XS_0036_2:				; CODE XREF: ROM:000271DCj
		bra.s	XS_0036_4
; ---------------------------------------------------------------------------

XS_0036_3:				; CODE XREF: ROM:000271BCj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $48D,$0	; Run text script at offset 0x027F14
					; 0xE3BF: PRINT	MSG 0x040D, MSGBOX CLEARED, END: "{47}GEIZHALS!{43}NA GUT!{4A}"
; ---------------------------------------------------------------------------

XS_0036_4:				; CODE XREF: ROM:XS_0036_2j
		move.l	(sp)+,d0

XS_0036_5:				; CODE XREF: ROM:000271B0j
		rts
; ---------------------------------------------------------------------------

XS_0037:
		move.l	d0,-(sp)
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $48E,$0	; Run text script at offset 0x027F16
					; 0x1BF6: LOAD SPECIAL CHARACTER FAHL (0x0E)
					; 0xA3C0: PRINT	MSG 0x040E, END: "{47}ICH BIN MEISTER{43}DER KRIEGSKUNST! ICH GEBE DIR{43}UNTERRICHT, WENN DU WILLST.{4E}{47}FORDERST DU{43}MICH HERAUS?{44}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0037_4
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $490,$0	; Run text script at offset 0x027F1A
					; 0x1014: LOAD 20 INTO NUMERIC VARIABLE
					; 0xA3C1: PRINT	MSG 0x040F, END: "{47}DANN ZAHL	MIR{43}{46} TALER,{43}EINVERSTANDEN?{44}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0037_4
		move.l	(g_PrintNumericDwordValue).l,d0
		jsr	(j_RemoveGold).l
		bcc.s	XS_0037_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $492,$0	; Run text script at offset 0x027F1E
					; 0xE3C2: PRINT	MSG 0x0410, MSGBOX CLEARED, END: "{47}TUT MIR LEID,{43}ABER ICH	LEBE DAVON. ICH	KANN{43}DICH NICHT KOSTENLOS{4E}{47}UNTERRICHTEN.{4A}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	XS_0037_3
; ---------------------------------------------------------------------------

XS_0037_0:				; CODE XREF: ROM:0002720Ej
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $494,$0	; Run text script at offset 0x027F22
					; 0xA3C4: PRINT	MSG 0x0412, END: "{47}SOLL ICH DIR{43}DIE REGELN ERKLÄREN?{44}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0037_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $495,$0	; Run text script at offset 0x027F24
					; 0xE3C5: PRINT	MSG 0x0413, MSGBOX CLEARED, END: "{47}ICH WERDE	MICH{43}IN UNTERSCHIEDLICHSTE MONSTER{43}VERWANDELN, DIE DICH DER REIHE{4E}{47}NACH ANGREIFEN{43}WERDEN.{4E}{47}ICH BEURTEILE{43}DEINE FÄHIGKEITEN NACH	DER ZAHL
					;                                                 {43}VON	MONSTERN, DIE DU BESIEGT{4E}{47}HAST,OHNE{43}GETROFFEN ZU WERDEN.{4E}{47}WENN DU GETROF-{43}FEN	WIRST, HAST DU VERLOREN.{43}DEINE BELOHNUNG HÄNGT AB VON{4E}{47}DER ANZAHL DER{43}MONSTER, DIE DU GETÖTET HAST.{43}VERSTANDEN?{4E}{47}OKAY,{43}ACHTUNG...{45}FERTIG...{45}LOS!{4A}"
; ---------------------------------------------------------------------------
		bra.s	XS_0037_2
; ---------------------------------------------------------------------------

XS_0037_1:				; CODE XREF: ROM:00027224j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $496,$0	; Run text script at offset 0x027F26
					; 0xE3C6: PRINT	MSG 0x0414, MSGBOX CLEARED, END: "{47}OKAY,{43}ACHTUNG...{45}FERTIG...{45}LOS!{4A}"
; ---------------------------------------------------------------------------

XS_0037_2:				; CODE XREF: ROM:0002722Aj
		st	(g_YesNoPromptResult).l

XS_0037_3:				; CODE XREF: ROM:0002721Aj
					; ROM:0002723Ej
		move.l	(sp)+,d0
		rts
; ---------------------------------------------------------------------------

XS_0037_4:				; CODE XREF: ROM:000271F6j
					; ROM:00027200j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $493,$0	; Run text script at offset 0x027F20
					; 0xE3C3: PRINT	MSG 0x0411, MSGBOX CLEARED, END: "{47}NA, DANN{43}MACH'S GUT!{4A}"
; ---------------------------------------------------------------------------
		bra.s	XS_0037_3
; ---------------------------------------------------------------------------

XS_0038:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $497,$0	; Prompt:	Run text script	at offset 0x027F28
					; 0x1BF6: LOAD SPECIAL CHARACTER FAHL (0x0E)
					; 0x83C7: PRINT	MSG 0x0415: "{47}NICHT SCHLECHT!{43}DU BIST RECHT TALENTIERT. ABER{43}DU MUSST NOCH BESSER WERDEN!{4E}"
					; 0x1019: LOAD 25 INTO NUMERIC VARIABLE
					; 0xA3C8: PRINT	MSG 0x0416, END: "{47}ICH GEBE DIR{43}{46} TALER, WENN DU JETZT{43}AUFHÖRST.{4E}{47}WILLST DU{43}WEITERMACHEN?{44}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028874
		ScriptID    $49B,$2	; Answer 'no':  Run text script at offset 0x027F30
					; 0x83C9: PRINT	MSG 0x0417: "{47}{46} TALER. BITTE!{4E}"
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER FAHL (0x0E)
					; 0xE3CA: PRINT	MSG 0x0418, MSGBOX CLEARED, END: "{47}DU KANNST{43}JEDERZEIT KOMMEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0039:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $49F,$0	; Prompt:	Run text script	at offset 0x027F38
					; 0x1BF6: LOAD SPECIAL CHARACTER FAHL (0x0E)
					; 0x83CB: PRINT	MSG 0x0419: "{47}VIELLEICHT BIST{43}DU STÄRKER ALS DIE SOLDATEN,{43}DIE	DAS SCHLOSS BEWACHEN...{4E}"
					; 0x1032: LOAD 50 INTO NUMERIC VARIABLE
					; 0xA3CC: PRINT	MSG 0x041A, END: "{47}ICH GEBE DIR{43}{46}TALER, WENN DU JETZT{43}AUFHÖRST.{4E}{47}MÖCHTEST DU{43}WEITERMACHEN?{44}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028874
		ScriptID    $49B,$2	; Answer 'no':  Run text script at offset 0x027F30
					; 0x83C9: PRINT	MSG 0x0417: "{47}{46} TALER. BITTE!{4E}"
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER FAHL (0x0E)
					; 0xE3CA: PRINT	MSG 0x0418, MSGBOX CLEARED, END: "{47}DU KANNST{43}JEDERZEIT KOMMEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003A:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $4A3,$0	; Prompt:	Run text script	at offset 0x027F40
					; 0x1BF6: LOAD SPECIAL CHARACTER FAHL (0x0E)
					; 0x83CD: PRINT	MSG 0x041B: "{47}AUSGEZEICHNET!!{43}DU BRAUCHST	KEINEN{43}UNTERRICHT MEHR!{4E}"
					; 0x1064: LOAD 100 INTO	NUMERIC	VARIABLE
					; 0xA3CE: PRINT	MSG 0x041C, END: "{47}NIMM DIE{43}{46} TALER! WILLST DU{43}IMMER NOCH WEITERMACHEN?{44}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028874
		ScriptID    $49B,$2	; Answer 'no':  Run text script at offset 0x027F30
					; 0x83C9: PRINT	MSG 0x0417: "{47}{46} TALER. BITTE!{4E}"
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER FAHL (0x0E)
					; 0xE3CA: PRINT	MSG 0x0418, MSGBOX CLEARED, END: "{47}DU KANNST{43}JEDERZEIT KOMMEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003B:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $4A7,$0	; Prompt:	Run text script	at offset 0x027F48
					; 0x1BF6: LOAD SPECIAL CHARACTER FAHL (0x0E)
					; 0x83CF: PRINT	MSG 0x041D: "{47}ICH GEBE AUF!{43}DU BIST DER STÄRKSTE,	DEN ICH{43}JE GETROFFEN	HABE!{4E}"
					; 0x10C8: LOAD 200 INTO	NUMERIC	VARIABLE
					; 0xA3D0: PRINT	MSG 0x041E, END: "{47}BITTE...NIMM DIE{43}{46} TALER. WILLST DU{43}WEITERMACHEN?{44}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028874
		ScriptID    $49B,$2	; Answer 'no':  Run text script at offset 0x027F30
					; 0x83C9: PRINT	MSG 0x0417: "{47}{46} TALER. BITTE!{4E}"
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER FAHL (0x0E)
					; 0xE3CA: PRINT	MSG 0x0418, MSGBOX CLEARED, END: "{47}DU KANNST{43}JEDERZEIT KOMMEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003C:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $4AB,$0	; Prompt:	Run text script	at offset 0x027F50
					; 0x1BF6: LOAD SPECIAL CHARACTER FAHL (0x0E)
					; 0x83D1: PRINT	MSG 0x041F: "{47}B....{45}BITTE...{45}{43}ICH KANN GLEICH...{43}NICHT MEHR...{4E}"
					; 0x1190: LOAD 400 INTO	NUMERIC	VARIABLE
					; 0xA3D2: PRINT	MSG 0x0420, END: "{47}NIMM DIE{43}{46} TALER...WILLST DU ETWA{43}IMMER NOCH WEITERMACHEN?{44}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028874
		ScriptID    $49B,$2	; Answer 'no':  Run text script at offset 0x027F30
					; 0x83C9: PRINT	MSG 0x0417: "{47}{46} TALER. BITTE!{4E}"
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER FAHL (0x0E)
					; 0xE3CA: PRINT	MSG 0x0418, MSGBOX CLEARED, END: "{47}DU KANNST{43}JEDERZEIT KOMMEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003F:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4BA,$0	; Run text script at offset 0x027F6E
					; 0x181B: LOAD CHARACTER SCRIPT	BESITZER (0x001B)
					; 0x83D7: PRINT	MSG 0x0425: "{47}WILLKOMMEN BEI{43}GRIHNPIES! TRITT EIN! AMÜSIER{43}DICH! GEWINN ETWAS GELD!{4E}"
					; 0x1032: LOAD 50 INTO NUMERIC VARIABLE
					; 0xA3D8: PRINT	MSG 0x0426, END: "{47}{46} TALER{43}FÜR	EIN SPIEL. OKAY?{44}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	XS_003F_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4C1,$0	; Run text script at offset 0x027F7C
					; 0xE3DB: PRINT	MSG 0x0429, MSGBOX CLEARED, END: "{47}BIST DU VERRÜCKT?{43}SPIELST DU NICHT GERN?{4A}"
; ---------------------------------------------------------------------------
		bra.s	XS_003F_4
; ---------------------------------------------------------------------------

XS_003F_0:				; CODE XREF: ROM:00027284j
		move.l	(g_PrintNumericDwordValue).l,d0
		jsr	j_RemoveGold
		bcc.s	XS_003F_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4C0,$0	; Run text script at offset 0x027F7A
					; 0xE3DA: PRINT	MSG 0x0428, MSGBOX CLEARED, END: "{47}OH! KOMM NOCH{43}MAL WIEDER, WENN	DU MEHR{43}GELD	HAST!{4A}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	XS_003F_4
; ---------------------------------------------------------------------------

XS_003F_1:				; CODE XREF: ROM:00027298j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4BE,$0	; Run text script at offset 0x027F76
					; 0x181B: LOAD CHARACTER SCRIPT	BESITZER (0x001B)
					; 0xA3D9: PRINT	MSG 0x0427, END: "{47}DANKE! SOLL ICH{43}DIR DIE REGELN	ERKLÄREN?{44}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_003F_2
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4C2,$0	; Run text script at offset 0x027F7E
					; 0xE3DC: PRINT	MSG 0x042A, MSGBOX CLEARED, END: "{47}WIRF DEN BALL{43}ÜBER DEN	TRESEN,	DASS ER	AUF{43}EINEM DREHTELLER	LANDET.{4E}{47}JE SCHNELLER{43}DER TELLER SICH DREHT, AUF DEM{43}DER BALL LANDET,{4E}{47}DESTO HÖHER{43}DEIN GEWINN!  400, 100,	50.{4E}{47}WENN	DER BALL{43}HERUNTERROLLT, HAST	DU VERLO-{43}REN. DU HAST NUR EINEN WURF.{4E}{47}FERTIG?{43}OKAY! DANN LOS!{4A}"
; ---------------------------------------------------------------------------
		bra.s	XS_003F_3
; ---------------------------------------------------------------------------

XS_003F_2:				; CODE XREF: ROM:000272AEj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4C3,$0	; Run text script at offset 0x027F80
					; 0xE3DD: PRINT	MSG 0x042B, MSGBOX CLEARED, END: "{47}VERSUCHS DOCH{43}MAL!{4A}"
; ---------------------------------------------------------------------------

XS_003F_3:				; CODE XREF: ROM:000272B4j
		st	(g_YesNoPromptResult).l

XS_003F_4:				; CODE XREF: ROM:0002728Aj
					; ROM:000272A4j
		rts
; ---------------------------------------------------------------------------

XS_0042:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4CB,$0	; Run text script at offset 0x027F90
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0xA3E2: PRINT	MSG 0x0430, END: "{47}DU SIEHST	SO{43}STARK AUS. WENN ICH DIR{43}VERSPRECHE, DICH ZU BEZAHLEN,{4E}{47}WÜRDEST DU MIR{43}EINEN GEFALLEN TUN?{44}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0042_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4CD,$0	; Run text script at offset 0x027F94
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0xE3E3: PRINT	MSG 0x0431, MSGBOX CLEARED, END: "{47}DAS ZIMMER DA{43}OBEN IST	UNORDENTLICH. WÜRDEST{43}DU DIESE VASEN	INS REGAL{4E}{47}ZURÜCK	STELLEN?{4E}{47}VASEN SAMMELN{43}IST DAS HOBBY VON MEINEM MANN.{4A}"
; ---------------------------------------------------------------------------
		bra.s	XS_0042_1
; ---------------------------------------------------------------------------

XS_0042_0:				; CODE XREF: ROM:000272CAj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4CF,$0	; Run text script at offset 0x027F98
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0xE3E4: PRINT	MSG 0x0432, MSGBOX CLEARED, END: "{47}OKAY!{43}ICH KANN	ES AUCH	SELBER TUN.{4A}"
; ---------------------------------------------------------------------------

XS_0042_1:				; CODE XREF: ROM:000272D0j
		rts
; ---------------------------------------------------------------------------

XS_0043:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4D1,$0	; Run text script at offset 0x027F9C
					; 0x140F: SET BIT 7 OF FLAG 0x001
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0x83E5: PRINT	MSG 0x0433: "{47}VIELEN	DANK.{43}HIER IST DEINE	BELOHNUNG...{4E}"
					; 0x1002: LOAD 2 INTO NUMERIC VARIABLE
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0xE3E6: PRINT	MSG 0x0434, MSGBOX CLEARED, END: "{47}BITTE HILF MIR{43}NOCH EINMAL.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0046:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4E2,$0	; Run text script at offset 0x027FBE
					; 0x181E: LOAD CHARACTER SCRIPT	ARTHUR (0x001E)
					; 0xA3EC: PRINT	MSG 0x043A, END: "{47}DAS IST FÜR{43}DICH!{4E}"
; ---------------------------------------------------------------------------
		trap	#0
; ---------------------------------------------------------------------------
		dc.w SND_MusicChestOpen
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4E4,$0	; Run text script at offset 0x027FC2
					; 0x181E: LOAD CHARACTER SCRIPT	ARTHUR (0x001E)
					; 0x10FA: LOAD 250 INTO	NUMERIC	VARIABLE
					; 0xA3ED: PRINT	MSG 0x043B, END: "ARTHURS HAND-{43}LANGER HABEN	{46} TALER{43}BEKOMMEN.{4E}"
; ---------------------------------------------------------------------------
		jsr	(j_RestoreBGM).l
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4E7,$0	; Run text script at offset 0x027FC8
					; 0x181E: LOAD CHARACTER SCRIPT	ARTHUR (0x001E)
					; 0x83EE: PRINT	MSG 0x043C: "{47}WENN DER HERZOG{43}MICH RUFT, DENK DIR	EINE{43}ENTSCHULDIGUNG AUS{4E}{47}UND MACH ES{43}KLAR FÜR MICH.{4E}"
					; 0x18E9: LOAD CHARACTER SCRIPT	* (0x00E9)
					; 0xE3EF: PRINT	MSG 0x043D, MSGBOX CLEARED, END: "{47}VERSTANDEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0048:
		moveq	#$F,d0
		bsr.w	TestPlayerStatus
		beq.s	XS_0048_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4F2,$0	; Run text script at offset 0x027FDE
					; 0x1813: LOAD CHARACTER SCRIPT	WAHRSAGER (0x0013)
					; 0xE3F3: PRINT	MSG 0x0441, MSGBOX CLEARED, END: "{47}ICH KANN DICH{43}JETZT NICHT VERZAUBERN. DU{43}MUSST ERST	DIE BEICHTE ABLEGEN.{4A}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	XS_0048_1
; ---------------------------------------------------------------------------

XS_0048_0:				; CODE XREF: ROM:000272FCj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4ED,$0	; Run text script at offset 0x027FD4
					; 0x141C: SET BIT 4 OF FLAG 0x003
					; 0x1813: LOAD CHARACTER SCRIPT	WAHRSAGER (0x0013)
					; 0xE3F1: PRINT	MSG 0x043F, MSGBOX CLEARED, END: "{47}ICH WEISS.{43}KINDER IN DEINEM ALTER KÖNNEN ES{43}KAUM ERWARTEN, HEREINZUKOMMEN!{4E}{47}DEIN WUNSCH SEI{43}MIR BEFEHL!{43}{50}HAMMINA, HAMMENA, HAMMANA...!{4A}"
; ---------------------------------------------------------------------------
		st	(g_YesNoPromptResult).l

XS_0048_1:				; CODE XREF: ROM:00027308j
		rts
; ---------------------------------------------------------------------------

XS_005D:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $DB		; Bit 3	of flag	0x01B
		ScriptID    $529,$1	; Flag set:   Run text script at offset	0x02804C
					; 0x1493: SET BIT 3 OF FLAG 0x012
					; 0xE40F: PRINT	MSG 0x045D, MSGBOX CLEARED, END: "{47}BITTE ERZÄHL{43}KEINER MENSCHENSEELE{43}VON JULIA...{4E}{47}ACH JA,{43}ICH DENKE,	ES IST AN DER ZEIT,{43}ZUR PARTY ZU GEHEN.{4E}{47}WARUM	GEHT{43}DER HERR NICHT IN DEN{43}BANKETT-SAAL?{4A}"
		ScriptID    $528,$2	; Flag clear: Run text script at offset	0x02804A
					; 0xE40E: PRINT	MSG 0x045C, MSGBOX CLEARED, END: "{47}BITTE ERZÄHL{43}KEINER MENSCHENSEELE{43}VON JULIA...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_005E:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $52B,$0	; Prompt:	Run text script	at offset 0x028050
					; 0x182E: LOAD CHARACTER SCRIPT	KAYLA (0x002E)
					; 0xA410: PRINT	MSG 0x045E, END: "{47}HAHAHAHAHA!{43}SO	SCHNELL	SIEHT MAN SICH{43}WIEDER! HAHAHAHAHA!{4E}{47}ICH HABE SCHON{43}AUF DICH	GEWARTET! NUN KOMM!{44}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028874
		ScriptID    $533,$2	; Answer 'no':  Run text script at offset 0x028060
					; 0x182E: LOAD CHARACTER SCRIPT	KAYLA (0x002E)
					; 0xE414: PRINT	MSG 0x0462, MSGBOX CLEARED, END: "{47}DU HAST MICH{43}ZURÜCKGESTOSSEN! ICH BIN NOCH{43}NIE ZURÜCKGEWIESEN WORDEN!{4E}{47}INK!  WALLY!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0064:				; CODE XREF: ROM:00027336j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $539,$0	; Run text script at offset 0x02806C
					; 0x1BF1: LOAD SPECIAL CHARACTER DUX (0x09)
					; 0x8417: PRINT	MSG 0x0465: "{47}WIE DU	WEISST,{43}LEBT	EIN BÖSER ZAUBERER IM{43}TURM VOR DER STADT.{4E}{47}ER IST MIR UND{43}DER GANZEN STADT EIN{43}GROSSER DORN IM AUGE.{4E}{47}ER HEISST MIR.{43}SEITDEM ER	SICH IM	TURM{43}NIEDERGELASSEN HAT, HABEN WIR{4E}{47}ALLE ANGST	UM{43}UNSER LEBEN...WIR	MACHEN ALLES{43}FÜR IHN. ICH HABE SCHON	OFT{4E}{47}DARAN GEDACHT,{43}SOLDATEN IN DEN TURM ZU{43}SCHICKEN, ABER MIT SEINER{4E}"
					; 0xA418: PRINT	MSG 0x0466, END: "{47}ZAUBERKRAFT{43}KÖNNTE ER SICH AN DEN UNSCHUL-{43}DIGEN BÜRGERN MERKATORS RÄCHEN.{4E}{47}DESHALB HABE{43}ICH IHM IMMER SOVIEL GELD{43}GEGEBEN, WIE	ER WOLLTE.{4E}{47}ABER JETZT{43}HABE ICH DIE NASE VOLL!{4E}{47}...ENTSCHULDI-{43}GUNG...! ICH HABE EIN BISSCHEN{43}WEIT	AUSGEHOLT...{4E}{47}NOCHMAL VON	VORN?{44}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	XS_0064
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $53C,$0	; Run text script at offset 0x028072
					; 0x1BF1: LOAD SPECIAL CHARACTER DUX (0x09)
					; 0xE419: PRINT	MSG 0x0467, MSGBOX CLEARED, END: "{47}ES IST JETZT AN{43}DER ZEIT, DASS	WIR MIR	BESIEGEN.{43}ES	WIRD NIE FRIEDEN IN MERKATOR{4E}{47}EINKEHREN,{43}SOLANGE ER LEBT.{4E}{47}DESWEGEN{43}BRAUCHE ICH EUCH.	ICH MÖCHTE,{43}DASS IHR	MIR BESIEGT! ICH WERDE{4E}{47}EUCH NATÜRLICH{43}REICHLICH BELOHNEN. ZUFÄLLIG
					;                                                 {43}HABE ICH DEN SMARAGD VON{4E}{47}GOLA IN	MEINEM{43}BESITZ, EINER	DER NATIONAL-{43}SCHÄTZE DIESES	LANDES.{4E}{47}DEXTER... ZACK{43}...UND	NIELS, IHR WERDET FÜR{43}IMMER DIE HELDEN DER NATION{4E}{47}SEIN! MÖGE DIE{43}GÖTTIN EUCH BESCHÜTZEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0069:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $54A,$0	; Prompt:	Run text script	at offset 0x02808E
					; 0x1BE9: LOAD SPECIAL CHARACTER FLORA (0x01)
					; 0xA420: PRINT	MSG 0x046E, END: "{47}NIELS,{43}GEHST DU JETZT SCHLAFEN?{44}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028874
		ScriptID    $54C,$2	; Answer 'no':  Run text script at offset 0x028092
					; 0x1BE9: LOAD SPECIAL CHARACTER FLORA (0x01)
					; 0xE421: PRINT	MSG 0x046F, MSGBOX CLEARED, END: "{47}LASS UNS EIN{43}BISSCHEN DAS SCHLOSS ERKUNDEN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0073:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $566,$0	; Run text script at offset 0x0280C6
					; 0x1064: LOAD 100 INTO	NUMERIC	VARIABLE
					; 0x18F4: LOAD CHARACTER SCRIPT	* (0x00F4)
					; 0xA42E: PRINT	MSG 0x047C, END: "{47}WÜRDEST DU{43}{46} TALER BEI MIR INVESTIEREN?{44}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0073_1
		move.l	(g_PrintNumericDwordValue).l,d0
		jsr	(j_RemoveGold).l
		bcs.s	XS_0073_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $56A,$0	; Run text script at offset 0x0280CE
					; 0x14D2: SET BIT 2 OF FLAG 0x01A
					; 0xE430: PRINT	MSG 0x047E, MSGBOX CLEARED, END: "{47}ICH DANKE	DIR!{43}WARTE HIER, UND	ICH VERDOPPLE{43}DIR SOFORT DEIN GELD!{4A}"
; ---------------------------------------------------------------------------
		st	(g_YesNoPromptResult).l

XS_0073_0:				; CODE XREF: ROM:00027378j
		rts
; ---------------------------------------------------------------------------

XS_0073_1:				; CODE XREF: ROM:00027352j
					; ROM:00027360j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $569,$0	; Run text script at offset 0x0280CC
					; 0xE42F: PRINT	MSG 0x047D, MSGBOX CLEARED, END: "{47}BIST DU NICHT{43}AN GELDSPIELEN INTERESSIERT?{4A}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	XS_0073_0
; ---------------------------------------------------------------------------

XS_0075:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $153		; Bit 3	of flag	0x02A
		ScriptID    $56F,$1	; Flag set:   Run text script at offset	0x0280D8
					; 0x18F1: LOAD CHARACTER SCRIPT	* (0x00F1)
					; 0xA432: PRINT	MSG 0x0480, END: "{47}HE, EIN KÄUFER!{43}BRAUCHST DU MEDIZIN?{43}KLAR, HABEN WIR ALLES DA!{4E}"
		ScriptID    $571,$2	; Flag clear: Run text script at offset	0x0280DC
					; 0x18F1: LOAD CHARACTER SCRIPT	* (0x00F1)
					; 0xA433: PRINT	MSG 0x0481, END: "{47}HE, EIN KÄUFER!{43}MÖCHTEST DU SCHNICKSCHNACK{43}KAUFEN? WIR HABEN ALLES!{4E}"
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $573,$0	; Run text script at offset 0x0280E0
					; 0xE434: PRINT	MSG 0x0482, MSGBOX CLEARED, END: "{47}WIR HABEN	WAREN{43}ALLER ART VON BESTER QUALITÄT!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0076:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $574,$0	; Prompt:	Run text script	at offset 0x0280E2
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0xA435: PRINT	MSG 0x0483, END: "{47}HE HE HE...{43}HIER KOMMT	NOCH EIN OPFER...{4E}{47}WILLST	DU IN DIE{43}HALLE DER UNTOTEN EINTRETEN?{44}"
		ScriptID    $576,$1	; Answer 'yes': Run text script at offset 0x0280E6
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0xE436: PRINT	MSG 0x0484, MSGBOX CLEARED, END: "{47}MUTIG, MEIN{43}JUNGE! DU MUSST ACHT RÄTSEL IN{43}ACHT RÄUMEN LÖSEN.{4E}{47}WENN DU DAS{43}RÄTSEL GELÖST HAST, GEHT IN{43}DIESEM RAUM DIE FACKEL AUS.{4E}{47}DU KOMMST AUF{43}DIE ANDERE SEITE DES	FLUSSES,{43}WENN ALLE RÄTSEL GELÖST SIND.{4E}{47}SCHAFFST DU ES{43}ABER	NICHT...HE HE HE..., HAST{43}DU	DEIN LEBEN VERWIRKT...{4A}"
		ScriptID    $578,$2	; Answer 'no':  Run text script at offset 0x0280EA
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0xE437: PRINT	MSG 0x0485, MSGBOX CLEARED, END: "{47}FORT MIT DIR!{43}KOMM NIE	WIEDER!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0077:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $57A,$0	; Prompt:	Run text script	at offset 0x0280EE
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0xA438: PRINT	MSG 0x0486, END: "{47}HE HE HE...{43}DA	DRÜBEN GIBT ES NOCH{43}MEHR RÄTSEL ZU LÖSEN...{4E}{47}MÖCHTEST DU{43}WIRKLICH AUF DIE ANDERE{43}SEITE DES FLUSSES?{44}"
		ScriptID    $57D,$1	; Answer 'yes': Run text script at offset 0x0280F4
					; 0xE43A: PRINT	MSG 0x0488, MSGBOX CLEARED, END: "{47}OKAY...HE	HE...{43}ICH BRINGE DICH NACH...{43}GEHENNA!!{4A}"
		ScriptID    $57C,$2	; Answer 'no':  Run text script at offset 0x0280F2
					; 0xE439: PRINT	MSG 0x0487, MSGBOX CLEARED, END: "{47}HE HE HE...{43}IN	DER TAT.{43}DU SOLLTEST	LIEBER UMKEHREN...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0079:
		move.w	#ITM_ARMLET,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	XS_0079_0
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $57F,$0	; Prompt:	Run text script	at offset 0x0280F8
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0xA43C: PRINT	MSG 0x048A, END: "{47}...ICH TRAUE{43}MEINEN AUGEN NICHT...{43}DU LEBST	NOCH???{4E}{47}...GEHST	DU{43}ZURÜCK IN	DIE STADT?{44}"
		ScriptID    $582,$1	; Answer 'yes': Run text script at offset 0x0280FE
					; 0xE43E: PRINT	MSG 0x048C, MSGBOX CLEARED, END: "{47}...NA,{43}DANN LOS...{4A}"
		ScriptID    $581,$2	; Answer 'no':  Run text script at offset 0x0280FC
					; 0xE43D: PRINT	MSG 0x048B, MSGBOX CLEARED, END: "{47}MACH,{43}WAS DIR GEFÄLLT.{4A}"
; ---------------------------------------------------------------------------
		bra.s	XS_0079_1
; ---------------------------------------------------------------------------

XS_0079_0:				; CODE XREF: ROM:000273AAj
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $584,$0	; Prompt:	Run text script	at offset 0x028102
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0xA440: PRINT	MSG 0x048E, END: "{47}HE HE HE...{43}WILLKOMMEN	HIER OBEN...{4E}{47}GEHST DU ZURÜCK?{44}"
		ScriptID    $587,$1	; Answer 'yes': Run text script at offset 0x028108
					; 0xE442: PRINT	MSG 0x0490, MSGBOX CLEARED, END: "{47}HE HE HE...{4A}"
		ScriptID    $586,$2	; Answer 'no':  Run text script at offset 0x028106
					; 0xE441: PRINT	MSG 0x048F, MSGBOX CLEARED, END: "{47}TU,{43}WAS DIR GEFÄLLT.{4A}"
; ---------------------------------------------------------------------------

XS_0079_1:				; CODE XREF: ROM:000273B6j
		rts
; ---------------------------------------------------------------------------

XS_007A:
		move.w	#ITM_ARMLET,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	XS_007A_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $583,$0	; Run text script at offset 0x028100
					; 0xE43F: PRINT	MSG 0x048D, MSGBOX CLEARED, END: "{47}IRGENDETWAS{43}STIMMT NICHT MIT DIR...{43}ICH WEISS NICHT, WAS ES	IST...{4A}"
; ---------------------------------------------------------------------------
		bra.s	XS_007A_1
; ---------------------------------------------------------------------------

XS_007A_0:				; CODE XREF: ROM:000273CCj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $588,$0	; Run text script at offset 0x02810A
					; 0xE443: PRINT	MSG 0x0491, MSGBOX CLEARED, END: "{47}HEH HEH...{43}DU KANNST IMMER ZURÜCKKOMMEN{43}...DIE UNTOTEN WARTEN ...{4A}"
; ---------------------------------------------------------------------------

XS_007A_1:				; CODE XREF: ROM:000273D2j
		rts
; ---------------------------------------------------------------------------

XS_007D:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $58C,$0	; Prompt:	Run text script	at offset 0x028112
					; 0x1834: LOAD CHARACTER SCRIPT	MIR (0x0034)
					; 0xA446: PRINT	MSG 0x0494, END: "{47}GEHST DU UM{43}JEDEN PREIS HINEIN?{44}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028874
		ScriptID    $58E,$2	; Answer 'no':  Run text script at offset 0x028116
					; 0x1834: LOAD CHARACTER SCRIPT	MIR (0x0034)
					; 0xE447: PRINT	MSG 0x0495, MSGBOX CLEARED, END: "{47}GEH ZURÜCK.{43}SETZ NIE WIEDER EINEN FUSS{43}IN DIESEN TURM.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_007E:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $590,$0	; Prompt:	Run text script	at offset 0x02811A
					; 0x1834: LOAD CHARACTER SCRIPT	MIR (0x0034)
					; 0xA448: PRINT	MSG 0x0496, END: "{47}KANN ICH WAS{43}FÜR DICH TUN?{44}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028874
		ScriptID    $592,$2	; Answer 'no':  Run text script at offset 0x02811E
					; 0x1834: LOAD CHARACTER SCRIPT	MIR (0x0034)
					; 0xE449: PRINT	MSG 0x0497, MSGBOX CLEARED, END: "{47}GEH SOFORT{43}ZURÜCK!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_007F:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $594,$0	; Prompt:	Run text script	at offset 0x028122
					; 0x1834: LOAD CHARACTER SCRIPT	MIR (0x0034)
					; 0xA44A: PRINT	MSG 0x0498, END: "{47}WAGST DU ES,{43}HEREINZUKOMMEN?{44}"
		ScriptID    $596,$1	; Answer 'yes': Run text script at offset 0x028126
					; 0x1834: LOAD CHARACTER SCRIPT	MIR (0x0034)
					; 0xE44B: PRINT	MSG 0x0499, MSGBOX CLEARED, END: "{47}ICH DENKE, DU{43}SOLLTEST	LIEBER ZURÜCKGEHEN...{4A}"
		ScriptID    $598,$2	; Answer 'no':  Run text script at offset 0x02812A
					; 0x1834: LOAD CHARACTER SCRIPT	MIR (0x0034)
					; 0xE44C: PRINT	MSG 0x049A, MSGBOX CLEARED, END: "{47}HA HA HA HA!...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0089:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5BB,$0	; Run text script at offset 0x028170
					; 0x1834: LOAD CHARACTER SCRIPT	MIR (0x0034)
					; 0xA45D: PRINT	MSG 0x04AB, END: "{47}ICH LASSE	EUCH{43}DIREKT AM BODEN	RAUS, OKAY?{44}"
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
		ScriptID    $5D5,$0	; Run text script at offset 0x0281A4
					; 0x846A: PRINT	MSG 0x04B8: "DAS ROTE UND DAS{43}LILA JUWEL WURDEN HERRN NIELS{43}ABGENOMMEN!{4E}"
					; 0x1BF1: LOAD SPECIAL CHARACTER DUX (0x09)
					; 0xE46B: PRINT	MSG 0x04B9, MSGBOX CLEARED, END: "{47}HERR NIELS!{43}VIEL SPASS	MIT DIESER ALBERNEN{43}KUH! HAHAHA!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00A5:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $606,$0	; Run text script at offset 0x028206
					; 0x1BE9: LOAD SPECIAL CHARACTER FLORA (0x01)
					; 0x8484: PRINT	MSG 0x04D2: "{47}SIEH NUR, NIELS!{43}DIESER HUND IST VERLETZT!{4E}{47}ARMER HUND!{43}ICH WERDE DICH VERZAUBERN,{43}DANN	GEHT'S DIR BESSER. NIELS!{4E}"
					; 0x0400: LOAD 0x0000 INTO 0xFF1198 (EKE-EKE)
					; 0xA485: PRINT	MSG 0x04D3, END: "{47}GIB MIR{43}ETWAS {4B}!{44}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	XS_00A5_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $612,$0	; Run text script at offset 0x02821E
					; 0x1BE9: LOAD SPECIAL CHARACTER FLORA (0x01)
					; 0xA48A: PRINT	MSG 0x04D8, END: "{47}ABER...ER{43}STIRBT GLEICH! BITTE!{44}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	XS_00A5_0
		bsr.s	XS_00A5_2
		beq.s	XS_00A5_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $614,$0	; Run text script at offset 0x028222
					; 0x1BE9: LOAD SPECIAL CHARACTER FLORA (0x01)
					; 0xE48B: PRINT	MSG 0x04D9, MSGBOX CLEARED, END: "{47}ICH HASSE	DICH!!{4A}"
; ---------------------------------------------------------------------------
		bra.s	XS_00A5_1
; ---------------------------------------------------------------------------

XS_00A5_0:				; CODE XREF: ROM:0002741Ej
					; ROM:00027428j
		bsr.s	XS_00A5_2
		beq.s	XS_00A5_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $60A,$0	; Run text script at offset 0x02820E
					; 0x1BE9: LOAD SPECIAL CHARACTER FLORA (0x01)
					; 0xE486: PRINT	MSG 0x04D4, MSGBOX CLEARED, END: "{47}DANKE!{43}SCHON VORBEI, ARMER HUND!{4A}"
; ---------------------------------------------------------------------------

XS_00A5_1:				; CODE XREF: ROM:0002742Cj
					; ROM:00027432j ...
		rts

; =============== S U B	R O U T	I N E =======================================


XS_00A5_2:				; CODE XREF: ROM:0002742Ap
					; ROM:XS_00A5_0p
		move.w	(word_FF1198).l,d0
		bsr.w	CheckIfItemIsOwned
		bne.s	XS_00A5_3
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $616,$0	; Run text script at offset 0x028226
					; 0x1BE9: LOAD SPECIAL CHARACTER FLORA (0x01)
					; 0x0400: LOAD 0x0000 INTO 0xFF1198 (EKE-EKE)
					; 0xE48C: PRINT	MSG 0x04DA, MSGBOX CLEARED, END: "{47}HAST DU KEIN{43}{4B}? HOL	ES UND BEEIL{43}DICH, DAMIT ICH	IHN RETTEN KANN.{4A}"
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
XS_00AC_Options:ScriptID    $62F,$0	; DATA XREF: ROM:0002745Ao
					; Run text script at offset 0x028258
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE497: PRINT	MSG 0x04E5, MSGBOX CLEARED, END: "{47}OH!!{43}ERSCHRICK	MICH DOCH NICHT	SO!{4A}"
		ScriptID    $631,$1	; Run text script at offset 0x02825C
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE498: PRINT	MSG 0x04E6, MSGBOX CLEARED, END: "{47}DIE AUSSICHT{43}VON HIER IST SCHÖN, WAS?{43}BIS BALD!{4A}"
		ScriptID    $633,$2	; Run text script at offset 0x028260
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE499: PRINT	MSG 0x04E7, MSGBOX CLEARED, END: "{47}TIPP-TIPP!{43}DU BIST'S!!{4A}"
		ScriptID    $635,$3	; Run text script at offset 0x028264
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE49A: PRINT	MSG 0x04E8, MSGBOX CLEARED, END: "{47}DU HAST GLÜCK{43}GEHABT! DAS IST ES!{4A}"
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
XS_00AD_Options:ScriptID    $637,$0	; DATA XREF: ROM:00027482o
					; Run text script at offset 0x028268
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE49B: PRINT	MSG 0x04E9, MSGBOX CLEARED, END: "{47}HUI! MIR IST{43}GANZ SCHWINDELIG!{4A}"
		ScriptID    $639,$1	; Run text script at offset 0x02826C
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE49C: PRINT	MSG 0x04EA, MSGBOX CLEARED, END: "{47}HÖR GUT ZU!{43}DNE DAED A	SI SIHT!{4A}"
		ScriptID    $63B,$2	; Run text script at offset 0x028270
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE49D: PRINT	MSG 0x04EB, MSGBOX CLEARED, END: "{47}NOCH EIN{43}BISSCHEN WEITER, UND DU FINDEST{43}...{45}EINE...SACKGASSE!  HAHAHAH!{4A}"
		ScriptID    $63D,$3	; Run text script at offset 0x028274
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE49E: PRINT	MSG 0x04EC, MSGBOX CLEARED, END: "{47}DU BRAUCHST{43}MICH NICHT?{43}{45}TSCHÜSS!{4A}"
; ---------------------------------------------------------------------------

XS_00B2:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $647,$0	; Run text script at offset 0x028288
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xA4A3: PRINT	MSG 0x04F1, END: "{47}ICH KANN DICH{43}NICHT SEHEN, ABER ES FREUT{43}MICH, DICH	KENNENZULERNEN.{4E}{47}ICH ESSE	GERADE{43}ZU MITTAG. ICH KANN ES NICHT{43}SEHEN, ABER ES SIEHT GUT AUS.{4E}{47}MÖCHTEST	DU{43}AUCH ETWAS?...BIST DU IN EILE?{4E}"
; ---------------------------------------------------------------------------
		move.w	#ITM_RESTORATION,d0
		bsr.w	GetRemainingItemAllowedCount
		beq.s	XS_00B2_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $649,$0	; Run text script at offset 0x02828C
					; 0x84A4: PRINT	MSG 0x04F2: "{47}ICH GEBE DIR{43}DAS HIER. ICH KANN ES ZWAR{43}NICHT SEHEN, ABER ES SIEHT{4E}{47}BESTIMMT{43}GUT AUS.{4E}"
					; 0x002E: LOAD 0x002E INTO 0xFF1196 (RESTAU{55}RATION)
					; 0x17E8: RECEIVE ITEM [0xFF1196]
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE4A5: PRINT	MSG 0x04F3, MSGBOX CLEARED, END: "{47}WAR SCHÖN, SICH{43}MIT DIR ZU UNTERHALTEN! ICH{43}KANN DICH NICHT	SEHEN,{4E}{47}ABER DU BIST{43}TROTZDEM MEIN FREUND.{4A}"
; ---------------------------------------------------------------------------
		bra.s	XS_00B2_1
; ---------------------------------------------------------------------------

XS_00B2_0:				; CODE XREF: ROM:000274B2j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $64E,$0	; Run text script at offset 0x028296
					; 0xE4A6: PRINT	MSG 0x04F4, MSGBOX CLEARED, END: "{47}VIEL GLÜCK!{43}ICH KANN DICH NICHT SEHEN,{43}ABER	VIEL GLÜCK!{4A}"
; ---------------------------------------------------------------------------

XS_00B2_1:				; CODE XREF: ROM:000274B8j
		rts
; ---------------------------------------------------------------------------

XS_00B3:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $64F,$0	; Run text script at offset 0x028298
					; 0x1BE9: LOAD SPECIAL CHARACTER FLORA (0x01)
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0x84A7: PRINT	MSG 0x04F5: "{47}NIELS,	SIEH MAL!{43}DORT DRÜBEN GLÄNZT	ETWAS!{43}DER {4B}!{4E}"
					; 0x1BE8: LOAD SPECIAL CHARACTER NIELS (0x00)
					; 0xE4A8: PRINT	MSG 0x04F6, MSGBOX CLEARED, END: "{47}ABER WIR KOMMEN{43}NICHT DURCH DIESE BÄUME...{4A}"
; ---------------------------------------------------------------------------
		moveq	#ITM_EINSTEINWHISTLE,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	XS_00B3_0
		bsr.w	ClearTextbox
		st	d0
		bra.s	XS_00B3_1
; ---------------------------------------------------------------------------

XS_00B3_0:				; CODE XREF: ROM:000274CAj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $65E,$0	; Run text script at offset 0x0282B6
					; 0x1BE9: LOAD SPECIAL CHARACTER FLORA (0x01)
					; 0xE4AE: PRINT	MSG 0x04FC, MSGBOX CLEARED, END: "{47}VIELLEICHT{43}SOLLTEN WIR	NOCHMAL	GANZ VON{43}VORNE ANFANGEN...{4A}"
; ---------------------------------------------------------------------------
		clr.b	d0

XS_00B3_1:				; CODE XREF: ROM:000274D2j
		move.b	d0,(g_YesNoPromptResult).l
		rts
; ---------------------------------------------------------------------------

XS_00C1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $694,$0	; Prompt:	Run text script	at offset 0x028322
					; 0x18F7: LOAD CHARACTER SCRIPT	* (0x00F7)
					; 0xA4C9: PRINT	MSG 0x0517, END: "{47}DAS SCHIFF HISST{43}BALD DIE SEGEL, UM NACH VERLA{43}ZU FAHREN! DU KANNST	UMSONST{4E}{47}MIT, WEIL DU{43}DEN LEUCHTTURM REPARIERT	HAST!{4E}{47}FÄHRST DU{43}NUN MIT?{44}"
		ScriptID    $696,$1	; Answer 'yes': Run text script at offset 0x028326
					; 0x14D9: SET BIT 1 OF FLAG 0x01B
					; 0xE4CA: PRINT	MSG 0x0518, MSGBOX CLEARED, END: "{47}NA DANN{43}AN BORD! WIR LEGEN GLEICH AB!{4A}"
		ScriptID    $699,$2	; Answer 'no':  Run text script at offset 0x02832C
					; 0xE4CC: PRINT	MSG 0x051A, MSGBOX CLEARED, END: "{47}GUT, ICH{43}WARTE	NOCH EINEN MOMENT{43}AUF DICH...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00E5:
		trap	#0
; ---------------------------------------------------------------------------
		dc.w SND_MusicDukeChase
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $6F2,$0	; Run text script at offset 0x0283DE
					; 0x1BF1: LOAD SPECIAL CHARACTER DUX (0x09)
					; 0xE4FA: PRINT	MSG 0x0548, MSGBOX CLEARED, END: "{47}DU SCHON WIEDER!{4E}{47}JETZT IST{43}SCHLUSS MIT DEM VERSTECKSPIEL!{43}KOMM HER!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00E9:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $6FC,$0	; Run text script at offset 0x0283F2
					; 0x1836: LOAD CHARACTER SCRIPT	LARA (0x0036)
					; 0xA4FF: PRINT	MSG 0x054D, END: "{47}IIIIIIIIIIIHHHH!{43}NEEEEIIIIIIIINNN!{4E}{47}...OKAY...{43}DU HAST...GEWONNEN...!{4E}"
; ---------------------------------------------------------------------------
		trap	#0
; ---------------------------------------------------------------------------
		dc.w SND_FadeOut
; ---------------------------------------------------------------------------
		bsr.w	Sleep_0
; ---------------------------------------------------------------------------
		dc.w 59
; ---------------------------------------------------------------------------
		trap	#0
; ---------------------------------------------------------------------------
		dc.w SND_MusicMap
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $6FE,$0	; Run text script at offset 0x0283F6
					; 0x1836: LOAD CHARACTER SCRIPT	LARA (0x0036)
					; 0xE500: PRINT	MSG 0x054E, MSGBOX CLEARED, END: "{47}OH, WÄCHTER {45}DER{43}FINSTERNIS...{45}WENN DIE FÜNF{43}STEINE BEISAMMEN{45} SIND...{4E}{47}ZEIG	MIR...DEN{43}GEHEIMGANG!{43}{45}IN-NAH{45} GAD'DA{45} DA{45} V'IDDA!{4A}"
; ---------------------------------------------------------------------------
		trap	#0
; ---------------------------------------------------------------------------
		dc.w SND_FadeOut
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00EB:
		bsr.w	RestoreBGM_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $702,$0	; Run text script at offset 0x0283FE
					; 0x1836: LOAD CHARACTER SCRIPT	LARA (0x0036)
					; 0xE502: PRINT	MSG 0x0550, MSGBOX CLEARED, END: "{47}OH, MEIN PRINZ!{43}ICH WUSSTE, DASS DU KOMMEN{43}UND MICH	RETTEN WÜRDEST...!{4E}{47}DU BIST MEIN{43}PRINZ! OH, ES	IST, ALS OB EIN{43}MÄRCHEN WAHR	WIRD!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00F0:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $70E,$0	; Run text script at offset 0x028416
					; 0x1836: LOAD CHARACTER SCRIPT	LARA (0x0036)
					; 0x8508: PRINT	MSG 0x0556: "{47}HALT DU DICH DA{43}'RAUS, MORALIS! ICH WERDE MIT{43}DIESER MINIHEXE ALLEIN FERTIG!{4E}"
					; 0x1822: LOAD CHARACTER SCRIPT	MORALIS	(0x0022)
					; 0xA509: PRINT	MSG 0x0557, END: "{47}PRINZESSIN!!{43}HERR NIELS UND FRÄULEIN FLORA{43}HABEN DIR DAS LEBEN GERETTET!{4E}"
; ---------------------------------------------------------------------------
		trap	#0
; ---------------------------------------------------------------------------
		dc.w SND_MusicFinalCutscene
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $712,$0	; Run text script at offset 0x02841E
					; 0x1836: LOAD CHARACTER SCRIPT	LARA (0x0036)
					; 0x850A: PRINT	MSG 0x0558: "{47}...{45}JAA{45}...ES TUT{43}MIR	LEID...ABER...{45}ABER...{43}{45}ICH HATTE SOLCHE ANGST!...{4E}{47}...SCHLUCHZ...{43}ICH HABE JEDEN TAG	ETWAS AUS{43}DEM TURM FALLEN LASSEN, ABER{4E}{47}NIEMAND KAM!{43}NIEMAND HAT ETWAS GEMERKT!{43}...ICH HATTE SOLCHE ANGST!{4E}"
					; 0x1822: LOAD CHARACTER SCRIPT	MORALIS	(0x0022)
					; 0x850B: PRINT	MSG 0x0559: "{47}...OKAY, OKAY...{43}GEHEN WIR NACH HAUSE,{43}PRINZESSIN LARA.{4E}"
					; 0x1836: LOAD CHARACTER SCRIPT	LARA (0x0036)
					; 0xE50C: PRINT	MSG 0x055A, MSGBOX CLEARED, END: "{47}...BUHU-HU-HU!...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00F2:
		bsr.w	RestoreBGM_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $71A,$0	; Run text script at offset 0x02842E
					; 0x1BE9: LOAD SPECIAL CHARACTER FLORA (0x01)
					; 0xE50E: PRINT	MSG 0x055C, MSGBOX CLEARED, END: "{47}DAS ARME{43}MÄDCHEN...SIE	MUSS JA	VOR EIN-{43}SAMKEIT VERRÜCKT GEWORDEN SEIN{4E}{47}IN DIESEM TURM...{43}DASS SIE	DICH "MEIN PRINZ"{43}GENANNT HAT! DIE HAT NERVEN!{4E}{47}NAJA...GEHEN{43}WIR! WIR MÜSSEN{43}HERZOG MERKATOR EINHOLEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00FE:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $735,$0	; Run text script at offset 0x028464
					; 0x1805: LOAD CHARACTER SCRIPT	BESITZER (0x0005)
					; 0xA51B: PRINT	MSG 0x0569, END: "NIELS	HAT{43}2000 TALER BEKOMMEN!"
; ---------------------------------------------------------------------------
		bsr.w	Sleep_0
; ---------------------------------------------------------------------------
		dc.w 119
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0122:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $77D,$0	; Run text script at offset 0x0284F4
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xA541: PRINT	MSG 0x058F, END: "{47}WILLKOMMEN!{43}LASS UNS ROULETTE SPIELEN!{4E}{47}DAS SPIEL FÄNGT{43}AN, WENN DU DIE GROSSE KUGEL{43}BEKOMMST! WENN DIE KUGEL AUF{4E}{47}ROT LANDET,{43}BEKOMMST DU 200 TALER! 50 TALER{43}FÜR EIN	SPIEL! WILLST DU{4E}{47}DEIN GLÜCK{43}VERSUCHEN?{44}"
; ---------------------------------------------------------------------------
		moveq	#50,d0

XS_0122_0:				; CODE XREF: ROM:00027584j
					; ROM:0002758Cj
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0122_3
		jsr	(j_RemoveGold).l
		bcs.s	XS_0122_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $77F,$0	; Run text script at offset 0x0284F8
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE542: PRINT	MSG 0x0590, MSGBOX CLEARED, END: "{47}VIEL GLÜCK!{4A}"
; ---------------------------------------------------------------------------
		bra.s	XS_0122_2
; ---------------------------------------------------------------------------

XS_0122_1:				; CODE XREF: ROM:00027554j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $781,$0	; Run text script at offset 0x0284FC
					; 0xE543: PRINT	MSG 0x0591, MSGBOX CLEARED, END: "{47}TUT MIR LEID...{43}ICH KANN'S NICHT BILLIGER{43}MACHEN!{4A}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l

XS_0122_2:				; CODE XREF: ROM:0002755Aj
		bra.s	XS_0122_4
; ---------------------------------------------------------------------------

XS_0122_3:				; CODE XREF: ROM:0002754Cj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $782,$0	; Run text script at offset 0x0284FE
					; 0xE544: PRINT	MSG 0x0592, MSGBOX CLEARED, END: "{47}OHHHH...{43}BEINAHE!{4A}"
; ---------------------------------------------------------------------------

XS_0122_4:				; CODE XREF: ROM:XS_0122_2j
		rts
; ---------------------------------------------------------------------------

XS_0123:
		move.l	#200,(g_PrintNumericDwordValue).l

XS_0127:				; CODE XREF: ROM:00027598j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $783,$0	; Run text script at offset 0x028500
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0x8545: PRINT	MSG 0x0593: "{47}MEINEN{43}GLÜCKWUNSCH!	BITTE SEHR!{4E}"
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE546: PRINT	MSG 0x0594, MSGBOX CLEARED, END: "{47}BIS BALD!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0125:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $78A,$0	; Run text script at offset 0x02850E
					; 0x193A: LOAD CHARACTER SCRIPT	* (0x013A)
					; 0xA548: PRINT	MSG 0x0596, END: "{47}HALLO! LASS UNS{43}HÜHNERWURF SPIELEN!{43}VERSUCH, SO VIELE HÜHNCHEN{4E}{47}ZU FANGEN, WIE{43}MÖGLICH, UND WIRF SIE IN DEN{43}PFERCH, BEVOR DIE ZEIT UM IST!{4E}{47}DER REKORD{43}HIER IST {46}. DU BEKOMMST{43}5	TALER PRO HÜHNCHEN.{4E}{47}DAS SPIEL{43}BEGINNT, WENN DU AUF DEM{43}ROTEN KÄSTCHEN STEHST.{4E}{47}20 TALER FÜR{43}EINE RUNDE. WILLST DU	MAL?{44}"
; ---------------------------------------------------------------------------
		moveq	#20,d0
		bra.s	XS_0122_0
; ---------------------------------------------------------------------------

XS_0128:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $78E,$0	; Run text script at offset 0x028516
					; 0x193B: LOAD CHARACTER SCRIPT	* (0x013B)
					; 0xA54A: PRINT	MSG 0x0598, END: "{47}WILLKOMMEN{43}BEIM HÜHNER-RENNEN!{4E}{47}SETZT AUF EINS{43}DER VIER HÜHNER...WENN	DEINS{43}ZUERST	INS ZIEL KOMMT,{4E}{47}ERHÄLST DU{43}200 TALER.{4E}{47}50 TALER	FÜR{43}EIN RENNEN. MÖCHTEST{43}DU'S MAL PROBIEREN?{44}"
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
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $791,$0	; Run text script at offset 0x02851C
					; 0x193C: LOAD CHARACTER SCRIPT	* (0x013C)
					; 0x0416: LOAD 0x0016 INTO 0xFF1198 (KASINO{55}TICKET)
					; 0xA54C: PRINT	MSG 0x059A, END: "{47}OH! ICH SEHE,{43}DU HAST EIN KASINOTICKET.{43}WILLST DU 'REIN?{44}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_012A_0
		bsr.w	CheckAndConsumeItem
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $794,$0	; Run text script at offset 0x028522
					; 0x193C: LOAD CHARACTER SCRIPT	* (0x013C)
					; 0xE54D: PRINT	MSG 0x059B, MSGBOX CLEARED, END: "{47}WILLKOMMEN IM{43}ARTHURISCHEN KASINO!{43}AMÜSIER DICH GUT!{4A}"
; ---------------------------------------------------------------------------
		bra.s	XS_012A_1
; ---------------------------------------------------------------------------

XS_012A_0:				; CODE XREF: ROM:000275AAj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $796,$0	; Run text script at offset 0x028526
					; 0x193C: LOAD CHARACTER SCRIPT	* (0x013C)
					; 0xE54E: PRINT	MSG 0x059C, MSGBOX CLEARED, END: "{47}BIS BALD!{4A}"
; ---------------------------------------------------------------------------

XS_012A_1:				; CODE XREF: ROM:000275B4j
		bra.s	XS_012A_3
; ---------------------------------------------------------------------------

XS_012A_2:				; CODE XREF: ROM:000275A0j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $798,$0	; Run text script at offset 0x02852A
					; 0x193C: LOAD CHARACTER SCRIPT	* (0x013C)
					; 0x0416: LOAD 0x0016 INTO 0xFF1198 (KASINO{55}TICKET)
					; 0xE54F: PRINT	MSG 0x059D, MSGBOX CLEARED, END: "{47}TUT MIR LEID.{43}OHNE {4B} KOMMST{43}DU HIER LEIDER NICHT	REIN!{4A}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l

XS_012A_3:				; CODE XREF: ROM:XS_012A_1j
		rts
; ---------------------------------------------------------------------------

XS_012B:
		clr.b	(g_YesNoPromptResult).l
		move.w	#$E0,d0	; 'α'
		bsr.w	TestFlagBit
		beq.s	XS_012B_2
		move.w	#$E1,d0	; 'ß'
		bsr.w	TestFlagBit
		beq.s	XS_012B_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $7A0,$0	; Run text script at offset 0x02853A
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE552: PRINT	MSG 0x05A0, MSGBOX CLEARED, END: "{47}ICH WÜNSCHTE,{43}WIR KÖNNTEN MEHR	BÄUME{43}UNTERIRDISCH ZÜCHTEN...{4A}"
; ---------------------------------------------------------------------------
		bra.s	XS_012B_1
; ---------------------------------------------------------------------------

XS_012B_0:				; CODE XREF: ROM:000275E0j
		st	(g_YesNoPromptResult).l
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $79D,$0	; Run text script at offset 0x028534
					; 0x14E1: SET BIT 1 OF FLAG 0x01C
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE551: PRINT	MSG 0x059F, MSGBOX CLEARED, END: "{47}DU HAST MEINEN{43}VATER GETROFFEN, ODER? WENN DAS{43}SO IST, GEH HOCH UND	SÄG{4E}{47}DEN BAUM{43}AB, UM EIN FLOSS	ZU BAUEN!{4A}"
; ---------------------------------------------------------------------------

XS_012B_1:				; CODE XREF: ROM:000275E6j
		bra.s	XS_012B_3
; ---------------------------------------------------------------------------

XS_012B_2:				; CODE XREF: ROM:000275D6j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $79B,$0	; Run text script at offset 0x028530
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE550: PRINT	MSG 0x059E, MSGBOX CLEARED, END: "{47}DA OBEN RAGT{43}EIN EINZELNER BAUM HERVOR.{43}BÄUME SIND HIER SEHR SELTEN,{4E}{47}UND DESWEGEN{43}STEHE ICH HIER WACHE!{4A}"
; ---------------------------------------------------------------------------

XS_012B_3:				; CODE XREF: ROM:XS_012B_1j
		rts
; ---------------------------------------------------------------------------
