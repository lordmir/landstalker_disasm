; ---------------------------------------------------------------------------

CS_0143:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $AB,$0	; Prompt:	Run text script	at offset 0x027750
					; 0x1834: LOAD CHARACTER SCRIPT	MIR (0x0034)
					; 0xA09A: PRINT	MSG 0x00E8, END: "{47}GEH NUN ZURÜCK,{43}UND DU	WIRST ETWAS{43}SCHÖNES BEKOMMEN, OKAY?{44}"
		ScriptID    $AD,$1	; Answer 'yes': Run text script at offset 0x027754
					; 0x75C7: SET BIT 7 OF FLAG 0x038, MSGBOX CLEARED, END
		ScriptJump  ClearTextbox,$2 ; Answer 'no':  Jump to address 0x028874
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0000:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $B7,$1	; Run text script at offset 0x027768
					; 0xE0A4: PRINT	MSG 0x00F2, MSGBOX CLEARED, END: "{47}DER SCHATZ VON{43}KÖNIG NOLO?....ACH JA...{45}{43}...ÄH...KEINE AHNUNG.....{4A}"
					;
		dc.w 1			; Params 00, 01
		ScriptID    $B8,$3	; Run text script at offset 0x02776A
					; 0xE0A5: PRINT	MSG 0x00F3, MSGBOX CLEARED, END: "{47}DIE BRÜCKE IST{43}EINGESTÜRZT! JUGENDLICHE WOLLEN{43}EINEN ÜBERFALL AUF GUMI MACHEN.{4A}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $B9,$5	; Run text script at offset 0x02776C
					; 0xE0A6: PRINT	MSG 0x00F4, MSGBOX CLEARED, END: "{47}...OH, BITTE...{43}BITTE RETTE MEINE FARA!.....{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $BA,$7	; Run text script at offset 0x02776E
					; 0x1422: SET BIT 2 OF FLAG 0x004
					; 0x80A7: PRINT	MSG 0x00F5: "{47}NIELS!{43}ICH DANKE DIR VIELMALS...{43}DANKE NOCHMAL FÜR ALLES!{4E}{47}WIE SAGT MAN?{43}"GLITZERND UND	FUNKELND SOLLST{43}DU DEINE DANKBARKEIT	ZEIGEN!"{4E}{47}DIE LEUTE AUS{43}MASSAN	SIND SEHR DANKBAR.{43}NIMM BITTE DIESEN	JUWEL, NIELS!{4E}"
					; 0x0028: LOAD 0x0028 INTO 0xFF1196 (ROTES{56}JUWEL)
					; 0x17E8: RECEIVE ITEM [0xFF1196]
					; 0x1800: LOAD CHARACTER SCRIPT	BÜRGERMEISTER (0x0000)
					; 0xE0A8: PRINT	MSG 0x00F6, MSGBOX CLEARED, END: "{47}UND VERGISS UNS NICHT.{4A}"
					;
		dc.w 5			; Params 00, 05
		ScriptID    $BF,$9	; Run text script at offset 0x027778
					; 0xE0A8: PRINT	MSG 0x00F6, MSGBOX CLEARED, END: "{47}UND VERGISS UNS NICHT.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0001:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $C0,$1	; Run text script at offset 0x02777A
					; 0xE0A9: PRINT	MSG 0x00F7, MSGBOX CLEARED, END: "{47}GEHT ES DIR GUT?{43}PASS AUF DICH	AUF!{4A}"
					;
		dc.w 1			; Params 00, 01
		ScriptID    $C1,$3	; Run text script at offset 0x02777C
					; 0xE0AA: PRINT	MSG 0x00F8, MSGBOX CLEARED, END: "{47}ES GIBT DA EIN{43}GERÜCHT, DASS GUMI VON EINER{43}BÖSEN MACHT BESESSEN IST.{4A}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $C2,$5	; Run text script at offset 0x02777E
					; 0xE0AB: PRINT	MSG 0x00F9, MSGBOX CLEARED, END: "{47}MIR GEHT'S GUT.{43}WIR SOLLTEN ZUERST DIESE{43}MONSTER FANGEN!!{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $C3,$7	; Run text script at offset 0x027780
					; 0xE0AC: PRINT	MSG 0x00FA, MSGBOX CLEARED, END: "{47}ACH, NIELS...{43}(SEUFZ).	DU SAHST SO MUTIG AUS,{4A}{47}ALS DU GEGEN{43}DIE ORK-KÖNIGE GEKÄMPFT HAST...{4E}{47}WENN DOCH NUR{43}DAS ROTE JUWEL MEINES VATERS{43}UNSERE MITGIFT WÄRE!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $C4,$1	; Run text script at offset 0x027782
					; 0xE0AD: PRINT	MSG 0x00FB, MSGBOX CLEARED, END: "{47}JEMAND MUSS{43}DIESEN BARBAREN AUS GUMI{43}EINEN DÄMPFER AUFSETZEN!{4E}{47}WÄRE ICH DOCH{43}NUR JÜNGER....{4A}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $C5,$3	; Run text script at offset 0x027784
					; 0xE0AE: PRINT	MSG 0x00FC, MSGBOX CLEARED, END: "{47}SO!{43}JETZT REICHT'S!!{43} ICH WERDE ES TUN!!{4A}"
					;
		dc.w 3			; Params 00, 03
		ScriptID    $C6,$5	; Run text script at offset 0x027786
					; 0xE0AF: PRINT	MSG 0x00FD, MSGBOX CLEARED, END: "{47}SIE HABEN	FARA IN	DEN{43}SCHREIN MITGENOMMEN. WIR	HABEN{43}VERSUCHT, HINEINZUKOMMEN,{4E}{47}ABER...{43}DIE TÜR LIESS SICH	NICHT ÖFFNEN.{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $C7,$7	; Run text script at offset 0x027788
					; 0xE0B0: PRINT	MSG 0x00FE, MSGBOX CLEARED, END: "{47}ICH WEISS	JETZT,{43} DASS	ICH MICH GEIRRT	HABE....{4E}{47}DIE STAMMES-{43}ANGEHÖRIGEN VON	GUMI{43}SIND UNSERE BRÜDER.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $C8,$1	; Run text script at offset 0x02778A
					; 0xE0B1: PRINT	MSG 0x00FF, MSGBOX CLEARED, END: "{47}VORSICHT,	WAS DU{43}SAGST... MEIN	MANN IST WÜTEND!{4A}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $C9,$3	; Run text script at offset 0x02778C
					; 0xE0B2: PRINT	MSG 0x0100, MSGBOX CLEARED, END: "{47}MEIN MANN{43}UND MEIN SOHN{43}STÜRMTEN AUS DEM RAUM....{4E}{47}ICH HABE MIR{43}SOLCHE SORGEN GEMACHT!{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $CA,$5	; Run text script at offset 0x02778E
					; 0xE0B3: PRINT	MSG 0x0101, MSGBOX CLEARED, END: "{47}ICH DANKE	DIR,{43}NIELS. JETZT SIND MASSAN UND{43}GUMI WIEDER BEFREUNDET,{4E}{47}UND ES WIRD{43}HARMONIE UND FRIEDEN IN{43}UNSEREM DORF GEBEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0002:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptJump  CS_0002_0,$1 ; Jump	to address 0x025E0A
					;
		dc.w 2			; Params 00, 02
		ScriptID    $CE,$3	; Run text script at offset 0x027796
					; 0xE0B7: PRINT	MSG 0x0105, MSGBOX CLEARED, END: "{47}ICH MAG ZWAR{43}NOCH EIN KIND SEIN, ABER ICH{43}BIN MUTIG	GENUG, UM LOSZUGEHEN{4A}{47}UND	SIE{43}ZU SCHLAGEN!{4A}"
					;
		dc.w 3			; Params 00, 03
		ScriptID    $CF,$5	; Run text script at offset 0x027798
					; 0xE0B8: PRINT	MSG 0x0106, MSGBOX CLEARED, END: "{47}....SCHLUCHZ!...{43}...ICH HAB' SOLCHE ANGST...!{43}PAPA IST IHNEN{4E}{47}BIS ZUM{43}SCHREIN GEFOLGT...{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $D0,$7	; Run text script at offset 0x02779A
					; 0xE0B9: PRINT	MSG 0x0107, MSGBOX CLEARED, END: "{47}SIEHT MAMA{43}JETZT NICHT	GLÜCKLICH AUS?{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0002_0:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $CB,$0	; Prompt:	Run text script	at offset 0x027790
					; 0xA0B4: PRINT	MSG 0x0102, END: "{47}HAST DU JEMANDEN{43}GESEHEN, DER ANDERS AUSSIEHT?{44}"
		ScriptID    $CC,$1	; Answer 'yes': Run text script at offset 0x027792
					; 0xE0B5: PRINT	MSG 0x0103, MSGBOX CLEARED, END: "{47}ACH JA?{4A}"
		ScriptID    $CD,$2	; Answer 'no':  Run text script at offset 0x027794
					; 0xE0B6: PRINT	MSG 0x0104, MSGBOX CLEARED, END: "{47}PASS ABER	AUF!{43}SIE SIND VOM STAMME DER	GUMI,{4A}{47}UND SIE WOLLEN NICHT,{43}DASS WIR IN MASSAN SIND.{4E}{47}GEH NICHT{43}RICHTUNG SÜDEN...DORT WIRST{43}DU VIEL PECH HABEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_007D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $D1,$1	; Run text script at offset 0x02779C
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0xE0BA: PRINT	MSG 0x0108, MSGBOX CLEARED, END: "{47}"SÄE DIE SAMEN{43}AUS UND	SIEH,{43}WIE SIE WACHSEN!{4E}{47}BALD WIRST DU ERNTEN,{43}WAS DU GESÄT HAST!{4E}{47}EINES TAGES{43}WIRST DU DIE	ERNTE IN DIE STADT{43}BRINGEN! DU WIRST	REICH SEIN,{4E}{47}UND DANN{43}WIRST DU	SAGEN!..."{4E}{47}DAS IST EIN{43}BAUERNLIED. MEINE ERNTE WIRD{43}SICH BESSER VERKAUFEN,{4E}{47}WENN ICH	ES AUF{43}DEM MARKT IN MERKATOR	SINGE.{4A}{47}AUF DEM MARKT{43}IN MERKATOR.{4A}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $D3,$3	; Run text script at offset 0x0277A0
					; 0xE0BB: PRINT	MSG 0x0109, MSGBOX CLEARED, END: "{47}WIR ARBEITEN{43}GERADE EINEN PLAN	AUS.{43}STÖR UNS BITTE NICHT!{4A}"
					;
		dc.w 3			; Params 00, 03
		ScriptID    $D4,$5	; Run text script at offset 0x0277A2
					; 0xE0BC: PRINT	MSG 0x010A, MSGBOX CLEARED, END: "{47}SIE HABEN	ETWAS{43}GANZ SELTSAMES	BENUTZT,{43}UM DIE TÜR ZU ÖFFNEN...{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $D5,$7	; Run text script at offset 0x0277A4
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0xE0BD: PRINT	MSG 0x010B, MSGBOX CLEARED, END: "{47}HÖR ZU, NIELS!{43}ICH HABE EIN NEUES LIED{43}GESCHRIEBEN.{4A}{47}ES HEISST:{43}DREI JUNGEN AUS MASSAN:{4A}{47}"DREI JUNGEN{43}ZIEHEN MUTIG, MUTIG	LOS!{43}DREI JUNGEN ZIEHEN KÜHN....{4A}{47}HÖRT	SICH{43}GUT AN,	ODER?{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $D7,$9	; Run text script at offset 0x0277A8
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0x80BE: PRINT	MSG 0x010C: "{47}SCHUBI	DUBI, DU{43}WACHSEN! BALD WIRST	DU ERNTEN{43}SCHUBI, DUBI DA!{4E}{47}AH!{43}DU BIST ES,	NIELS!{4E}"
					; 0x0400: LOAD 0x0000 INTO 0xFF1198 (EKE-EKE)
					; 0xE0BF: PRINT	MSG 0x010D, MSGBOX CLEARED, END: "{47}DANKE, DASS DU{43}MIR NEULICH GEHOLFEN HAST.{43}KAUF DOCH	DIREKT BEI MIR!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $DB,$1	; Run text script at offset 0x0277B0
					; 0xE0C0: PRINT	MSG 0x010E, MSGBOX CLEARED, END: "{47}ICH HABE{43}MUNKELN GEHÖRT, DASS IN DER{43}NÄHE DER BRÜCKE IMMER ÖFTER{4E}{47}GUMI-KRIEGER GESEHEN WURDEN...{4A}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $DC,$3	; Run text script at offset 0x0277B2
					; 0xE0C1: PRINT	MSG 0x010F, MSGBOX CLEARED, END: "{47}ER...ER IST{43}PLÖTZLICH MIT UNSEREM{43}NACHBARN LOSGERANNT.{4A}{47}ER WAR{43}WIRKLICH WÜTEND!!{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $DD,$5	; Run text script at offset 0x0277B4
					; 0xE0C2: PRINT	MSG 0x0110, MSGBOX CLEARED, END: "{47}HALLO, NIELS{43}UND FLORA! WIE IST ES{43}EUCH ERGANGEN?{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $DE,$1	; Run text script at offset 0x0277B6
					; 0xE0C3: PRINT	MSG 0x0111, MSGBOX CLEARED, END: "{47}ICH WOHNE	HIER{43}SCHON IMMER...MASSAN UND{43}GUMI WAREN EINST BEFREUNDET.{4E}{47}WIE DIE	FEHDE{43}ANFING? DAS WEISS KEINER...{45}DOCH ICH WEISS WAS!{43}FRAG DEN	ALTEN MANN BEIM{4E}{47}WASSERFALL-{43}SCHREIN. VIELLEICHT KANN DER ES{43}DIR ERZÄHLEN!{4A}"
					;
		dc.w 1			; Params 00, 01
		ScriptID    $DF,$3	; Run text script at offset 0x0277B8
					; 0xE0C4: PRINT	MSG 0x0112, MSGBOX CLEARED, END: "{47}ES MUSS EIN{43}BÖSER FLUCH SEIN! ...DAS BÖSE{43}VERFOLGT UNS ALLE...{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $E0,$5	; Run text script at offset 0x0277BA
					; 0xE0C5: PRINT	MSG 0x0113, MSGBOX CLEARED, END: "{47}ENDLICH WERDEN{43}MASSAN UND GUMI	IHRE EINSTIGE{43}GRÖßE ALS{4E}{47}NACHBARDÖRFER{43}WIEDERERLANGEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0080:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $E1,$1	; Run text script at offset 0x0277BC
					; 0xE0C6: PRINT	MSG 0x0114, MSGBOX CLEARED, END: "{47}DU MUSST ZU DEM{43}WEISEN	VOM WASSERFALL-SCHREIN{43} GEHEN. ABER VORSICHT...{4A}{47}ER IST ZIEMLICH{43}KAUZIG!{4A}"
					;
		dc.w 1			; Params 00, 01
		ScriptID    $E2,$3	; Run text script at offset 0x0277BE
					; 0xE0C7: PRINT	MSG 0x0115, MSGBOX CLEARED, END: "{47}UUUUUH...{45}...{45}SCHAURIG!{4A}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $E3,$5	; Run text script at offset 0x0277C0
					; 0xE0C8: PRINT	MSG 0x0116, MSGBOX CLEARED, END: "{47}SCHLUCHZ!{43}...SCHLUCHZ!...{43}K-KOMMT FARA ZURÜCK?...{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $E4,$7	; Run text script at offset 0x0277C2
					; 0xE0C9: PRINT	MSG 0x0117, MSGBOX CLEARED, END: "{47}DU HAST ES{43}GESCHAFFT! KENNST DU DAS{43}SPRICHWORT: "BEURTEILT EIN DAHL{4A}{47}NICHT NACH{43}SEINER FARBE"?{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0003:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptJump  CS_0003_0,$1 ; Jump	to address 0x025E88
					;
		dc.w 3			; Params 00, 03
		ScriptJump  CS_0003_1,$3 ; Jump	to address 0x025E94
					;
		dc.w 4			; Params 00, 04
		ScriptID    $EA,$5	; Run text script at offset 0x0277CE
					; 0xE0CF: PRINT	MSG 0x011D, MSGBOX CLEARED, END: "{47}WIR MÜSSEN DIE{43}TRÜMMER	BEISEITE SCHAFFEN,{43}UM NACH MERKATOR ZU KOMMEN.{4A}"
					;
		dc.w 7			; Params 00, 07
		ScriptJump  CS_0003_2,$7 ; Jump	to address 0x025EA0
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $ED,$9	; Run text script at offset 0x0277D4
					; 0xE0D2: PRINT	MSG 0x0120, MSGBOX CLEARED, END: "{47}WAS FÜR EIN ZUFALL!{43}WIE LÄUFT'S SO?{43}ICH? HMMM...NAJA!{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $EE,$B	; Run text script at offset 0x0277D6
					; 0xE0D3: PRINT	MSG 0x0121, MSGBOX CLEARED, END: "{47}HE, JUNGER{43}MANN! ICH BIN'S!{4E}{47}OH, WEHE MIR!{43}ICH WAR IN EINER SELTSAMEN{43}FALLE GEFANGEN UND...DA BIN ICH.{4E}{47}NUN JA, ICH{43}BIN IN MEINEM LEBEN SCHON{43}IN MANCHEM GEFÄNGNIS GEWESEN,{4A}{47}ABER KEINES{43}HAT SO GESTUNKEN WIE DIESES!{4E}{47}ICH HALT'S{43}NICHT AUS!!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0003_0:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $E5,$0	; Prompt:	Run text script	at offset 0x0277C4
					; 0xA0CA: PRINT	MSG 0x0118, END: "{47}DU BIST EIN{43}SCHATZSUCHER, NICH' WAHR?{43} HA, TU NICHT SO!{4A}{47}ICH HAB'S DOCH{43} GLEICH GEMERKT!{4E}{47}HAST DU DEN{43}WEISEN VOM WASSERFALL-SCHREIN{4A}{47}GESEHEN?{44}"
		ScriptID    $E6,$1	; Answer 'yes': Run text script at offset 0x0277C6
					; 0xE0CB: PRINT	MSG 0x0119, MSGBOX CLEARED, END: "{47}ACH, WIRKLICH?{43}HA! DU BIST ALSO EIN DIEB UND{43}EIN LÜGNER!{4A}"
		ScriptID    $E7,$2	; Answer 'no':  Run text script at offset 0x0277C8
					; 0xE0CC: PRINT	MSG 0x011A, MSGBOX CLEARED, END: "{47}HA-HA-HA!{43}DU MUSST WOHL NOCH'N BISSCHEN{43}ÜBEN, KINDCHEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0003_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C1		; Bit 1	of flag	0x018
		ScriptID    $E8,$1	; Flag clear: Run text script at offset	0x0277CA
					; 0xE0CD: PRINT	MSG 0x011B, MSGBOX CLEARED, END: "{47}GÜTIGER HIMMEL!{43}SCHÖN,	DICH WIEDERZUSEHEN,{43}JUNGER MANN!{4E}{47}OH, DER ERD-{43}RUTSCH? TJA,	NUN...WIR HABEN{43}WOHL	KEIN GLÜCK MEHR!{4E}{47}DAS DORF WAR{43}WIE AUSGESTORBEN UND DANN HABE{43}ICH NACH WERTVOLLEM GESUCHT,{4A}{47}HABE ABER{43}NICHTS GEFUNDEN.{4E}{47}ALLES, WAS ICH
					;                                                 {43} GEFUNDEN HABE, WAR EINE{43}SCHMUTZIGE STATUE IM HAUS{4A}{47}DES BÜRGERMEISTERS.{4E}{47}AUSSERDEM LAG{43}NOCH ETWAS GELD HERUM, ABER{43}ICH HABE ES LIEGEN	LASSEN...{45}...{45}ODER DOCH NICHT?!{4A}"
		ScriptID    $E9,$2	; Flag set:   Run text script at offset	0x0277CC
					; 0xE0CE: PRINT	MSG 0x011C, MSGBOX CLEARED, END: "{47}DU KANNST	MIR{43}NICHT DIE SCHULD	GEBEN, ODER?{4E}{47}ICH	KENNE{43}DEINESGLEICHEN. DU BIST AUCH{43}EIN DIEB. HA- HA!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0003_2:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DA		; Bit 2	of flag	0x01B
		ScriptID    $EB,$1	; Flag clear: Run text script at offset	0x0277D0
					; 0x80D0: PRINT	MSG 0x011E: "{47}DU SCHON WIEDER!{43}ICH? ACH JA, ICH BIN HIERHER{43}GEKOMMEN AUF DER SUCHE{4A}{47}NACH	DEM{43}SCHATZ, BIN DANN	ABER MÜDE{43}GEWORDEN...{4E}"
					; 0xE0D1: PRINT	MSG 0x011F, MSGBOX CLEARED, END: "{47}MAN SAGT,	DASS{43}BÄUME DIE BESTEN FREUNDE EINES{43}SCHATZSUCHERS	SEIN KÖNNEN...{4E}{47}ICH FRAGE	MICH,{43}WAS DAS BEDEUTET?.....{4A}"
		ScriptID    $EC,$2	; Flag set:   Run text script at offset	0x0277D2
					; 0xE0D1: PRINT	MSG 0x011F, MSGBOX CLEARED, END: "{47}MAN SAGT,	DASS{43}BÄUME DIE BESTEN FREUNDE EINES{43}SCHATZSUCHERS	SEIN KÖNNEN...{4E}{47}ICH FRAGE	MICH,{43}WAS DAS BEDEUTET?.....{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0081:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $EF,$1	; Run text script at offset 0x0277D8
					; 0xE0D4: PRINT	MSG 0x0122, MSGBOX CLEARED, END: "{47}WIR HABEN	ZUR{43}ZEIT VIELE VERDÄCHTIGE GÄSTE{43}HIER...OH! DU BIST JA AUCH GAST!{4A}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $F0,$3	; Run text script at offset 0x0277DA
					; 0xE0D5: PRINT	MSG 0x0123, MSGBOX CLEARED, END: "{47}DIESER SELTSAME{43}MANN VERSCHWAND WIE{43}DER WIND.....{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $F1,$5	; Run text script at offset 0x0277DC
					; 0xE0D6: PRINT	MSG 0x0124, MSGBOX CLEARED, END: "{47}BIST DU NICHT{43}UNSER HELDENJUNGE? TJA, JEDER{43}VON FARAS FREUNDEN.....{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0082:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptJump  CS_0082_0,$1 ; Jump	to address 0x025ED4
					;
		dc.w 2			; Params 00, 02
		ScriptID    $F4,$3	; Run text script at offset 0x0277E2
					; 0xE0D8: PRINT	MSG 0x0126, MSGBOX CLEARED, END: "{47}NIELS! FLORA!{43}FARA BRAUCHT UNSERE HILFE....{43}ABER ICH HABE ANGST!!{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $F5,$5	; Run text script at offset 0x0277E4
					; 0xE0D9: PRINT	MSG 0x0127, MSGBOX CLEARED, END: "{47}FLORA! DU{43}GLAUBST GAR NICHT, WIE ICH MICH{43}IMMER FREUE, DICH	ZU SEHEN!{4A}"
					;
		dc.w 5			; Params 00, 05
		ScriptID    $F6,$7	; Run text script at offset 0x0277E6
					; 0xE0DA: PRINT	MSG 0x0128, MSGBOX CLEARED, END: "{47}HOFFENTLICH{43}KOMMST DU BALD WIEDER, FLORA!{43}ACH JA, DU AUCH, NIELS...{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0082_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C0		; Bit 0	of flag	0x018
		ScriptID    $F2,$1	; Flag clear: Run text script at offset	0x0277DE
					; 0x7C10: LOAD CUSTOM ACTION 0x10 (0x10000003F CSA_0010), MSGBOX CLEARED, END
		ScriptID    $F3,$2	; Flag set:   Run text script at offset	0x0277E0
					; 0xE0D7: PRINT	MSG 0x0125, MSGBOX CLEARED, END: "{47}IST...IST	MIT{43}FRÄULEIN	FLORA ALLES IN ORDUNG?{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0083:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $F7,$1	; Run text script at offset 0x0277E8
					; 0xE0DB: PRINT	MSG 0x0129, MSGBOX CLEARED, END: "{47}IM WESTEN	VON GUMI{43}GABELT SICH	DIE STRASSE UND{43}FÜHRT AUF ZWEI WEGEN	ZUM MEER.{4E}{47}DER RECHTE WEG{43}FÜHRT ZUR GROSSEN STADT MERKATOR.{4E}{47}DIE	LINKE FÜHRT{43}NACH RYUMA, WO EIN BERÜHMTER{43}LEUCHTTURM STEHT.{4A}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $F8,$3	; Run text script at offset 0x0277EA
					; 0xE0DC: PRINT	MSG 0x012A, MSGBOX CLEARED, END: "{47}SIE WERDEN FARA{43}IHREN BÖSEN GÖTTERN OPFERN!{43}WILLST DU IHR NICHT HELFEN?{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $F7,$5	; Run text script at offset 0x0277E8
					; 0xE0DB: PRINT	MSG 0x0129, MSGBOX CLEARED, END: "{47}IM WESTEN	VON GUMI{43}GABELT SICH	DIE STRASSE UND{43}FÜHRT AUF ZWEI WEGEN	ZUM MEER.{4E}{47}DER RECHTE WEG{43}FÜHRT ZUR GROSSEN STADT MERKATOR.{4E}{47}DIE	LINKE FÜHRT{43}NACH RYUMA, WO EIN BERÜHMTER{43}LEUCHTTURM STEHT.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0084:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $F9,$1	; Run text script at offset 0x0277EC
					; 0xE0DD: PRINT	MSG 0x012B, MSGBOX CLEARED, END: "{47}GUMI IST DAS{43}DORF DIREKT SÜDLICH VON UNS.{43}EIN SCHEUSSLICHES	VÖLKCHEN...{4A}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $FA,$3	; Run text script at offset 0x0277EE
					; 0xE0DE: PRINT	MSG 0x012C, MSGBOX CLEARED, END: "{47}ICH MUSS HIER-{43}BLEIBEN	UND DAS	DORF VERTEI-{43}DIGEN. DAS IST MEINE AUFGABE.{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $FB,$5	; Run text script at offset 0x0277F0
					; 0xE0DF: PRINT	MSG 0x012D, MSGBOX CLEARED, END: "{47}DENK DARAN,{43}NIELS...AUCH DER GERADESTE{43}WEG HAT KURVEN.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0085:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptJump  CS_0085_0,$1 ; Jump	to address 0x025F16
					;
		dc.w 2			; Params 00, 02
		ScriptID    $FF,$3	; Run text script at offset 0x0277F8
					; 0xE0E3: PRINT	MSG 0x0131, MSGBOX CLEARED, END: "{47}FARA WURDE GEKIDNAPPT,{43}WEIL SIE DIE HÜBSCHESTE{43}VON UNS IST.	ACH JE!{4E}{47}DAS HEISST,{43}ICH BIN DIE NÄCHSTE!{43}WAS SOLL ICH NUR MACHEN!{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $100,$5	; Run text script at offset 0x0277FA
					; 0xE0E4: PRINT	MSG 0x0132, MSGBOX CLEARED, END: "{47}ICH HABE VON{43}DEINEN HELDENTATEN GEHÖRT!{43}ICH	WEISS,{4A}{47}DAS HAST DU NUR{43}EKE-EKE ZU VERDANKEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0085_0:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $FC,$0	; Prompt:	Run text script	at offset 0x0277F2
					; 0xA0E0: PRINT	MSG 0x012E, END: "{47}HALLO!  ICH{43}KANN DIR ETWAS ÜBER DIESE{43}INSEL	VERRATEN.{4A}{47}HAST DU{43}SCHON DAVON	GEHÖRT?{44}"
		ScriptID    $FD,$1	; Answer 'yes': Run text script at offset 0x0277F4
					; 0xE0E1: PRINT	MSG 0x012F, MSGBOX CLEARED, END: "{47}JA?{43}OH.{4A}"
		ScriptID    $FE,$2	; Answer 'no':  Run text script at offset 0x0277F6
					; 0xE0E2: PRINT	MSG 0x0130, MSGBOX CLEARED, END: "{47}ES HANDELT{43}SICH UM EIN	STÄRKUNGSMITTEL,{43}DAS	EKE-EKE	HEISST.{4A}{47}ES ENTHÄLT{43}EINE MEGADOSIS DES	VITAMINS{43}EKENOL. KANN MAN ÜBERALL KAUFEN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0004:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $101,$1	; Run text script at offset 0x0277FC
					; 0xE0E5: PRINT	MSG 0x0133, MSGBOX CLEARED, END: "{47}WUFF, WUFF!{4A}"
					;
		dc.w $201		; Params 02, 01
		ScriptID    $102,$3	; Run text script at offset 0x0277FE
					; 0x153C: SET BIT 4 OF FLAG 0x027
					; 0xE0E6: PRINT	MSG 0x0134, MSGBOX CLEARED, END: "{47}OH! DU VERSTEHST MICH?{43}ICH BIN	EIN MÄDCHEN, ODER{43}BESSER GESAGT, ICH	WAR ES,{4E}{47}BIS HELGA,{43}EINE HEXE AUS DEM WALD ÖSTLICH{43}VON MERKATOR, MICH IN{4E}{47}EINEN HUND{43}VERWANDELT HAT.{4E}{47}MARTY,	MEIN{43}LIEBLING, IST AUCH VON IHR
					;                                                 {43}VERZAUBERT WORDEN. SIE HAT IHN{4E}{47}ZU IHREM{43}SCHOSSHUND GEMACHT!{4E}{47}WIE SEHR ICH{43}MICH	NACH IHM SEHNE (SEUFZ)!{43}HELGA HAT UNS ERZÄHLT,{4E}{47}WIR KÖNNEN NIE{43}WIEDER IN MENSCHEN VERWANDELT{43}WERDEN, WENN WIR UNS{4E}{47}IN UNSERER{43}JETZIGEN GESTALT ZU GESICHT{43}BEKOMMEN...{4E}{47}DER FLUCH AUF UNS{43}WIRD NIE VERLÖSCHEN{3F} NUR,{43}WENN HELGA	STIRBT-BUHUU!...{4A}"
					;
		dc.w $203		; Params 02, 03
		ScriptJump  CS_0004_0,$5 ; Jump	to address 0x025F34
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0004_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E2		; Bit 2	of flag	0x01C
		ScriptID    $104,$1	; Flag clear: Run text script at offset	0x027802
					; 0xE0E7: PRINT	MSG 0x0135, MSGBOX CLEARED, END: "{47}DANKE, DANKE!{43}MARTY UND ICH WERDEN UNS	JETZT{43}HIER HÄUSLICH EINRICHTEN.{4A}"
		ScriptID    $105,$2	; Flag set:   Run text script at offset	0x027804
					; 0xE0E8: PRINT	MSG 0x0136, MSGBOX CLEARED, END: "{47}ICH WÜRDE	GERNE{43}....WUFF!  WUFF WUFF! OH!{43}WAS IST DAS? MARTY UND ICH{4E}{47}WERDEN WIEDER{43}ZURÜCKVERWANDELT...HA-HA-HA!{43}NUR EIN SCHERZ! VIEL GLÜCK!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0086:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $106,$0	; Run text script at offset 0x027806
					; 0xE0E9: PRINT	MSG 0x0137, MSGBOX CLEARED, END: "{47}GACK-{43}GAAAAACK!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0087:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $107,$0	; Run text script at offset 0x027808
					; 0xE0EA: PRINT	MSG 0x0138, MSGBOX CLEARED, END: "{47}GACK-{43}GAAAAACK!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0005:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $108,$0	; Run text script at offset 0x02780A
					; 0xE0EB: PRINT	MSG 0x0139, MSGBOX CLEARED, END: "{47}WENN DU ETWAS{43}SIEHST, DAS DU GERNE HABEN{43}WILLST, LEG ES AUF	DEN TRESEN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0006:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $109,$0	; Run text script at offset 0x02780C
					; 0xE0EC: PRINT	MSG 0x013A, MSGBOX CLEARED, END: "{47}ES IST MEINE{43}AUFGABE, AUFZEICHNUNGEN ZU{43}MACHEN UND ZU HEILEN.{4E}{47}WIE KANN ICH DIR HELFEN?{4E}{47}BRING MIR{43}IRGENDEIN	BUCH.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0088:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $10A,$1	; Run text script at offset 0x02780E
					; 0xE0ED: PRINT	MSG 0x013B, MSGBOX CLEARED, END: "{47}GIBT ES TATSÄCHLICH EINE GÖTTIN?{4A}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $10B,$3	; Run text script at offset 0x027810
					; 0xE0EE: PRINT	MSG 0x013C, MSGBOX CLEARED, END: "{47}WENN ES EINE GÖTTIN GIBT,{43}WARUM HAT SIE ZUGELASSEN, DASS{43}FARA GEKIDNAPPT WIRD?...BUHUU!{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $10C,$5	; Run text script at offset 0x027812
					; 0xE0EF: PRINT	MSG 0x013D, MSGBOX CLEARED, END: "{47}JETZT BIN	ICH SICHER, DASS ES EINE GÖTTIN	GIBT!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0007:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $10D,$0	; Run text script at offset 0x027814
					; 0x0425: LOAD 0x0025 INTO 0xFF1198 (HOTELVER{55}ZEICHNIS)
					; 0x0826: LOAD 0x0026 INTO 0xFF119A (INSEL{55}KARTE)
					; 0xE0F0: PRINT	MSG 0x013E, MSGBOX CLEARED, END: "{47}NIMM DAS BUCH{43}UND LEG ES AUF DEN TRESEN,{43}WENN DU BLEIBEN WILLST.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0089:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 1			; Params 00, 01
		ScriptID    $110,$1	; Run text script at offset 0x02781A
					; 0xE0F1: PRINT	MSG 0x013F, MSGBOX CLEARED, END: "{47}OOOH!  ICH BIN{43}SO WÜTEND! WARTE NUR BIS DAS{43}DER BÜRGERMEISTER HÖRT!!{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $111,$3	; Run text script at offset 0x02781C
					; 0xE0F2: PRINT	MSG 0x0140, MSGBOX CLEARED, END: "{47}ICH HABE NOCH{43}NIE EINEN SO MUTIGEN MANN{43}GETROFFEN. ALLE ACHTUNG!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0008:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 1			; Params 00, 01
		ScriptID    $112,$1	; Run text script at offset 0x02781E
					; 0x1400: SET BIT 0 OF FLAG 0x000
					; 0x7C08: LOAD CUSTOM ACTION 0x08 (0x10000001F CSA_0008), MSGBOX CLEARED, END
					;
		dc.w 2			; Params 00, 02
		ScriptJump  CS_0008_0,$3 ; Jump	to address 0x025FAC
					;
		dc.w 3			; Params 00, 03
		ScriptID    $115,$5	; Run text script at offset 0x027824
					; 0xE0F4: PRINT	MSG 0x0142, MSGBOX CLEARED, END: "{47}STIMMT ES, DASS{43}FARA GEKIDNAPPT WURDE?{43}UNGLAUBLICH...{4E}{47}ICH GLAUBE, DER{43}STAMM DER GUMI WIRD	VON DEN{43}ORKS	BEHERRSCHT!{4E}{47}FARA	IST BESTIMMT{43}IN GROSSER GEFAHR...{4E}{47}GEH	ZUM SUMPF-{43}SCHREIN UND RETTE	FARA.{43}BEEIL DICH BITTE, NIELS!{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $116,$7	; Run text script at offset 0x027826
					; 0xE0F5: PRINT	MSG 0x0143, MSGBOX CLEARED, END: "{47}GUT, GUT...{43}DIE BEIDEN	STÄMME WERDEN SICH{43}WIEDER NÄHER KOMMEN.{4E}{47}ÜBER KÖNIG NOLO{43}...HABE ICH HERAUSGEFUNDEN,{43}DASS ER TATSÄCHLICH{4E}{47}VOR SEHR	LANGER{43} ZEIT	GELEBT HAT.{4E}{47}DAS IST ALLES,{43}WAS ICH IN	MEINEN BÜCHERN{43}FINDEN KONNTE.{4E}{47}HOFFENTLICH{43}KANNST DU IN MERKATOR MEHR{43}HERAUSFINDEN.....{4A}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $117,$9	; Run text script at offset 0x027828
					; 0xE0F6: PRINT	MSG 0x0144, MSGBOX CLEARED, END: "{47}NA, IS' WOHL{43}'NE STEINTAFEL?...DIE JUWELEN{43}MÜSSEN KÖNIG NOLO GEHÖREN.{4E}{47}NACH DEN AUFZEICH-{43}NUNGEN GIBT ES INSGESAMT FÜNF{43}JUWELEN. FALLS SIE ECHT SIND...{4E}{47}INTERESSANT...{43}KOMM NOCHMAL VORBEI.{4A}"
					;
		dc.w 9			; Params 00, 09
		ScriptID    $118,$B	; Run text script at offset 0x02782A
					; 0xE0F7: PRINT	MSG 0x0145, MSGBOX CLEARED, END: "{47}MERKATOR IST{43}EINE GROSSE STADT. DU WIRST DICH{43}DORT AMÜSIEREN, ABER...{4E}{47}VORSICHT!{43}VOR DEM HERZOG!!...{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $119,$D	; Run text script at offset 0x02782C
					; 0xE0F8: PRINT	MSG 0x0146, MSGBOX CLEARED, END: "{47}WAS? DU ZIEHST LOS,{43}LORD MIR ZU BESIEGEN? HMM.{43}NAJA, WENN DU MEINST	....{4E}{47}ICH	GLAUBE{43}IMMER	NOCH, DASS ER{43}UNSCHULDIG IST.{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $11A,$F	; Run text script at offset 0x02782E
					; 0xE0F9: PRINT	MSG 0x0147, MSGBOX CLEARED, END: "{47}OH, DU HAST{43}LORD MIR LEIBHAFTIG GESEHEN?{43}GEHT ES IHM GUT?...GROSSARTIG!{4E}{47}DU KANNST IHM{43}VERTRAUEN.GLAUB' IHM ALLES,{43}WAS ER DIR ERZÄHLT!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $11B,$11	; Run text script at offset 0x027830
					; 0xE0FA: PRINT	MSG 0x0148, MSGBOX CLEARED, END: "{47}SO, NUN IST DER{43}HERZOG	ENDLICH	AUS DER	DECKUNG{43}GEKOMMEN...JETZT WEISS JEDER,{4E}{47}DASS ER	NACH{43}DEM SCHATZ VON KÖNIG NOLO{43}SUCHT.{4E}{47}VIELLEICHT{43}WURDE ER DADURCH, DASS	DU{43}HERGEKOMMEN BIST,	ÜBERZEUGT,{4E}{47}DASS AN DEM{43}GANZEN	ETWAS DRAN SEIN	MUSS{4E}{47}NACH ALLDEM...{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $11C,$13	; Run text script at offset 0x027832
					; 0xE0FB: PRINT	MSG 0x0149, MSGBOX CLEARED, END: "{47}ER HAT DIE STADT{43}VERLASSEN. ER	WÜRDE ALLES TUN,{43}UM DEN LEGENDÄREN SCHATZ{4E}{47}ZU FINDEN.{4E}{47}NIELS! DU	MUSST{43}VERHINDERN, DASS ER DEN SCHATZ{43}BEKOMMT! DU MUSST IHN VON{4E}{47}SEINEM ÜBLEN{43}VORHABEN ABBRINGEN!{4A}{47}WENN DER	HERZOG{43}DEN SCHATZ FINDET...IST DAS{43}UNSER UNTERGANG!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0008_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $12		; Bit 2	of flag	0x002
		ScriptID    $115,$1	; Flag set:   Run text script at offset	0x027824
					; 0xE0F4: PRINT	MSG 0x0142, MSGBOX CLEARED, END: "{47}STIMMT ES, DASS{43}FARA GEKIDNAPPT WURDE?{43}UNGLAUBLICH...{4E}{47}ICH GLAUBE, DER{43}STAMM DER GUMI WIRD	VON DEN{43}ORKS	BEHERRSCHT!{4E}{47}FARA	IST BESTIMMT{43}IN GROSSER GEFAHR...{4E}{47}GEH	ZUM SUMPF-{43}SCHREIN UND RETTE	FARA.{43}BEEIL DICH BITTE, NIELS!{4A}"
		ScriptID    $114,$2	; Flag clear: Run text script at offset	0x027822
					; 0xE0F3: PRINT	MSG 0x0141, MSGBOX CLEARED, END: "{47}ICH LESE IMMER{43}NOCH IN	DEN ALTEN BÜCHERN.{43}GIB MIR NOCH ETWAS ZEIT.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_008B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 2			; Params 00, 02
		ScriptID    $11D,$1	; Run text script at offset 0x027834
					; 0xE0FC: PRINT	MSG 0x014A, MSGBOX CLEARED, END: "{47}WER BIST DU?{43}VERSCHWINDE, FREMDER!{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $11E,$3	; Run text script at offset 0x027836
					; 0xE0FD: PRINT	MSG 0x014B, MSGBOX CLEARED, END: "{47}E-ES TUT{43}UNS LEID.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_008C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 2			; Params 00, 02
		ScriptID    $11F,$1	; Run text script at offset 0x027838
					; 0xE0FE: PRINT	MSG 0x014C, MSGBOX CLEARED, END: "{47}ENTSCHULDIGUNG.{43}HEILIGER RITUS.{43}KEINE ZUSCHAUER ERLAUBT!{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $120,$3	; Run text script at offset 0x02783A
					; 0xE0FF: PRINT	MSG 0x014D, MSGBOX CLEARED, END: "{47}WILLKOMMEN{43}IN DER STADT GUMI.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_008D:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $121,$0	; Run text script at offset 0x02783C
					; 0xE100: PRINT	MSG 0x014E, MSGBOX CLEARED, END: "{47}WUSSTEST DU,{43}DASS WIR VON MONSTERN BEHERRSCHT{43}WURDEN{3F} DEN ORK-KÖNIGEN?{4E}{47}EIGENTLICH	KANN{43}ICH MICH AN NICHTS ERINNERN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0009:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C2		; Bit 2	of flag	0x018
		ScriptID    $122,$1	; Flag clear: Run text script at offset	0x02783E
					; 0xE101: PRINT	MSG 0x014F, MSGBOX CLEARED, END: "{47}ICH SCHÄME MICH{43}MEINER...WIR LIESSEN DIE MONSTER{43}UNS BEHERRSCHEN UND UNSEREN{4E}{47}HEILIGSTEN{43}SCHREIN ENTWEIHEN. ICH WILL MICH{43}AUCH IN MASSAN ENTSCHULDIGEN.{4E}{47}WERDEN SIE{43}UNS JEMALS	VERGEBEN?{4A}"
		ScriptID    $123,$2	; Flag set:   Run text script at offset	0x027840
					; 0xE102: PRINT	MSG 0x0150, MSGBOX CLEARED, END: "{47}WIR WERDEN VON{43}JETZT AN MIT MASSAN{43}ZUSAMMENARBEITEN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_000A:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $124,$0	; Run text script at offset 0x027842
					; 0xE103: PRINT	MSG 0x0151, MSGBOX CLEARED, END: "{47}DANKE VIELMALS!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_008E:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $125,$0	; Run text script at offset 0x027844
					; 0xE104: PRINT	MSG 0x0152, MSGBOX CLEARED, END: "{47}SEI NICHT	SO{43}STRENG MIT UNS. ES TUT UNS{43}EHRLICH LEID.....{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_008F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 3			; Params 00, 03
		ScriptID    $126,$1	; Run text script at offset 0x027846
					; 0xE105: PRINT	MSG 0x0153, MSGBOX CLEARED, END: "{47}VERSCHWINDE!{43}RAUS!{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $127,$3	; Run text script at offset 0x027848
					; 0xE106: PRINT	MSG 0x0154, MSGBOX CLEARED, END: "{47}WAR ICH JEMALS{43}SO UNHÖFLICH? TUT MIR LEID...{43}DENK DRAN...DU	KOMMST WEITER,{4E}{47}WENN DU ANDEREN{43}DEN VORTRITT LÄSST.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0090:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $128,$0	; Run text script at offset 0x02784A
					; 0xE107: PRINT	MSG 0x0155, MSGBOX CLEARED, END: "{47}MAN SAGT,	DASS{43}IN DER NÄHE VON	MERKATOR EINE{43}HEXE LEBT. SOLL SEHR ALT SEIN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0091:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 3			; Params 00, 03
		ScriptID    $129,$1	; Run text script at offset 0x02784C
					; 0xE108: PRINT	MSG 0x0156, MSGBOX CLEARED, END: "{47}GEH JETZT!{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $12A,$3	; Run text script at offset 0x02784E
					; 0xE109: PRINT	MSG 0x0157, MSGBOX CLEARED, END: "{47}MERKATOR?{43}WENN	DU AUS DEM ORT KOMMST,{43}GEH IMMER RICHTUNG WESTEN.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0092:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 4			; Params 00, 04
		ScriptID    $12B,$1	; Run text script at offset 0x027850
					; 0xE10A: PRINT	MSG 0x0158, MSGBOX CLEARED, END: "{47}ICH KANN WEGEN{43}DES ERDRUTSCHES	NICHT NACH{43} MERKATOR	GEHEN.{4A}"
					;
		dc.w 5			; Params 00, 05
		ScriptID    $12C,$3	; Run text script at offset 0x027852
					; 0xE10B: PRINT	MSG 0x0159, MSGBOX CLEARED, END: "{47}ZUMINDEST	IST{43}DIE STRASSE NACH	MERKATOR OFFEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0093:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 4			; Params 00, 04
		ScriptID    $12D,$1	; Run text script at offset 0x027854
					; 0xE10C: PRINT	MSG 0x015A, MSGBOX CLEARED, END: "{47}EINEN MOMENT!{43}WIR SIND	DIE, DIE IM NOTFALL{43}ALLES REPARIEREN. ES DAUERT{4E}{47}NUR EINE{43}SEKUNDE...{4A}"
					;
		dc.w 5			; Params 00, 05
		ScriptJump  CS_0093_0,$3 ; Jump	to address 0x026030
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0093_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C3		; Bit 3	of flag	0x018
		ScriptID    $12E,$1	; Flag clear: Run text script at offset	0x027856
					; 0x7C0D: LOAD CUSTOM ACTION 0x0D (0x100000033 CSA_000D), MSGBOX CLEARED, END
		ScriptID    $12F,$2	; Flag set:   Run text script at offset	0x027858
					; 0xE10D: PRINT	MSG 0x015B, MSGBOX CLEARED, END: "{47}ICH BIN ZU MÜDE{43}ZUM SPRECHEN...ACH JA,	KLAR!{43}JETZT KANNST DU DURCHGEHEN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0094:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 2			; Params 00, 02
		ScriptID    $130,$1	; Run text script at offset 0x02785A
					; 0xE10E: PRINT	MSG 0x015C, MSGBOX CLEARED, END: "{47}WAU-WAU!{4A}"
					;
		dc.w $19		; Params 00, 19
		ScriptID    $131,$3	; Run text script at offset 0x02785C
					; 0xE10F: PRINT	MSG 0x015D, MSGBOX CLEARED, END: "{47}ICH MAG DIE{43}LEUTE IN DIESEM DORF.{43}WAU-WAU!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0095:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $132,$0	; Run text script at offset 0x02785E
					; 0xE110: PRINT	MSG 0x015E, MSGBOX CLEARED, END: "{47}GACK-{43}GAAAAACK...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_000B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 3			; Params 00, 03
		ScriptID    $133,$1	; Run text script at offset 0x027860
					; 0xE111: PRINT	MSG 0x015F, MSGBOX CLEARED, END: "{47}ICH KONNTE NICHT{43}MIT IHNEN ZUM	SCHREIN{43}GEHEN...{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $134,$3	; Run text script at offset 0x027862
					; 0xE112: PRINT	MSG 0x0160, MSGBOX CLEARED, END: "{47}STIMMT ES, DASS{43}DU UNGLAUBLICH	STARK BIST?{4E}{47}IN DIESEM FALL{43}KANNST DU BLEIBEN,{43}SOLANGE DU WILLST.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_000C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 3			; Params 00, 03
		ScriptID    $135,$1	; Run text script at offset 0x027864
					; 0xE113: PRINT	MSG 0x0161, MSGBOX CLEARED, END: "{47}ES IST SO{43}SCHWER, ANDERE ZU GUTEN TATEN{43}ZU BEWEGEN,	WENN SO	VIELE{4E}{47}BÖSE MÄCHTE{43}UM UNS HERUM SIND.....{4A}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $136,$3	; Run text script at offset 0x027866
					; 0xE114: PRINT	MSG 0x0162, MSGBOX CLEARED, END: "{47}SIE WAREN{43}BESESSEN?...	ACH, DU	MEINE GÜTE!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0096:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 4			; Params 00, 04
		ScriptID    $137,$1	; Run text script at offset 0x027868
					; 0xE115: PRINT	MSG 0x0163, MSGBOX CLEARED, END: "{47}WIR HATTEN VOR{43}EIN PAAR TAGEN EIN SCHWERES{43}ERDBEBEN. NATURKATASTROPHEN{4E}{47}SCHEINEN{43}HEUTZUTAGE GANZ NORMAL ZU{43}SEIN....{4A}"
					;
		dc.w 5			; Params 00, 05
		ScriptJump  CS_0096_0,$3 ; Jump	to address 0x02607A
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0096_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C3		; Bit 3	of flag	0x018
		ScriptID    $138,$1	; Flag clear: Run text script at offset	0x02786A
					; 0x7C0D: LOAD CUSTOM ACTION 0x0D (0x100000033 CSA_000D), MSGBOX CLEARED, END
		ScriptID    $139,$2	; Flag set:   Run text script at offset	0x02786C
					; 0xE116: PRINT	MSG 0x0164, MSGBOX CLEARED, END: "{47}AHHH...DAS{43}ERFRISCHT!	GUTE REISE!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0097:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $13A,$1	; Run text script at offset 0x02786E
					; 0xE117: PRINT	MSG 0x0165, MSGBOX CLEARED, END: "{47}HALLO, DAS{43}IST	RYUMA.{4A}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $13B,$3	; Run text script at offset 0x027870
					; 0xE118: PRINT	MSG 0x0166, MSGBOX CLEARED, END: "{47}WIR HEISSEN{43}DICH WILLKOMMEN...{4A}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $13C,$5	; Run text script at offset 0x027872
					; 0xE119: PRINT	MSG 0x0167, MSGBOX CLEARED, END: "{47}MAN SAGT,{43}DU BIST EIN HELD,{43}JUNGER MANN!{4A}"
					;
		dc.w $A			; Params 00, 0A
		ScriptID    $13D,$7	; Run text script at offset 0x027874
					; 0xE11A: PRINT	MSG 0x0168, MSGBOX CLEARED, END: "{47}ICH HABE EINE{43}BLONDE SCHÖNHEIT	DIE STADT MIT{43}ZWEI MONSTERN VERLASSEN SEHEN...{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $13E,$9	; Run text script at offset 0x027876
					; 0xE11B: PRINT	MSG 0x0169, MSGBOX CLEARED, END: "{47}WIR ERLEIDEN{43}VIELE SCHICKSALSSCHLÄGE.{43}DIESMAL WURDE	DER LEUCHTTURM{4E}{47}BÖSWILLIG{43}ZERSTÖRT.{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $13A,$B	; Run text script at offset 0x02786E
					; 0xE117: PRINT	MSG 0x0165, MSGBOX CLEARED, END: "{47}HALLO, DAS{43}IST	RYUMA.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0098:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $13F,$1	; Run text script at offset 0x027878
					; 0xE11C: PRINT	MSG 0x016A, MSGBOX CLEARED, END: "{47}ICH WETTE, ICH{43}KÖNNTE DIESE DIEBE AUS DER{43}STADT JAGEN,{45}.{45}.{45}.{43}WENN ICH ÄLTER WÄRE.{4A}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $140,$3	; Run text script at offset 0x02787A
					; 0xE11D: PRINT	MSG 0x016B, MSGBOX CLEARED, END: "{47}VATER...{4A}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $141,$5	; Run text script at offset 0x02787C
					; 0xE11E: PRINT	MSG 0x016C, MSGBOX CLEARED, END: "{47}WARUM BIST{43}DU OHNE MICH GEGANGEN?{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $142,$7	; Run text script at offset 0x02787E
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE11F: PRINT	MSG 0x016D, MSGBOX CLEARED, END: "{47}ICH BIN MIR{43}SICHER, DU	KANNST DEN{43}{4B} BEKOMMEN,{4E}{47}SCHLIESSLICH{43}GEHE ICH MIT DIR!{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $141,$9	; Run text script at offset 0x02787C
					; 0xE11E: PRINT	MSG 0x016C, MSGBOX CLEARED, END: "{47}WARUM BIST{43}DU OHNE MICH GEGANGEN?{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0099:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $144,$1	; Run text script at offset 0x027882
					; 0xE120: PRINT	MSG 0x016E, MSGBOX CLEARED, END: "{47}RYUMA IST{43}EINE	ALTE STADT.{4E}{47}OB DU ES GLAUBST{43}ODER NICHT, DIESE STADT{43}WAR VOR LANGER, LANGER ZEIT{4E}{47}VIEL GRÖSSER ALS MERKATOR.{4A}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $145,$3	; Run text script at offset 0x027884
					; 0xE121: PRINT	MSG 0x016F, MSGBOX CLEARED, END: "{47}ICH HABE GEHÖRT,{43}DASS MERKATOR	NUN VOM{43}HERZOG REGIERT WIRD.{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $146,$5	; Run text script at offset 0x027886
					; 0xE122: PRINT	MSG 0x0170, MSGBOX CLEARED, END: "{47}WAR HERZOG{43}MERKATOR WIRKLICH SO EIN{43}GAUNER?{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $147,$1	; Run text script at offset 0x027888
					; 0xE123: PRINT	MSG 0x0171, MSGBOX CLEARED, END: "{47}BIST DU AUCH{43}HIERHER GEKOMMEN,	UM NACH{43}DEM SCHATZ ZU SUCHEN?{4E}{47}WENN DAS SO IST,{43}MÖCHTE ICH AUCH EINEN{43}ANTEIL HABEN.{4A}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $148,$3	; Run text script at offset 0x02788A
					; 0xE124: PRINT	MSG 0x0172, MSGBOX CLEARED, END: "{47}VERGISS JA NICHT,{43}MIR MEINEN ANTEIL ABZUGEBEN,{43}WENN	DU DEN SCHATZ FINDEST!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_000D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $149,$1	; Run text script at offset 0x02788C
					; 0xE125: PRINT	MSG 0x0173, MSGBOX CLEARED, END: "{47}DIESEN MONAT{43}GIBT ES KEINE SONDERANGEBOTE,{43}WEIL ALLES GESTOHLEN WURDE!{4A}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $14A,$3	; Run text script at offset 0x02788E
					; 0xE126: PRINT	MSG 0x0174, MSGBOX CLEARED, END: "{47}KEHR WIEDER UM{43}UND GEH	NACH HAUSE!! DU	WIRST{43}NOCH AN MEINEN	RAT DENKEN.....{4A}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $14B,$5	; Run text script at offset 0x027890
					; 0xE127: PRINT	MSG 0x0175, MSGBOX CLEARED, END: "{47}VIELEN DANK,{43}NIELS. DU	HAST DIE STADT{43}GERETTET!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $14C,$7	; Run text script at offset 0x027892
					; 0xE128: PRINT	MSG 0x0176, MSGBOX CLEARED, END: "{47}HALLO NIELS.{43}SIEHT SO AUS, ALS	HÄTTEN WIR{43}EIN PROBLEM NACH DEM ANDEREN.{4E}{47}HAST	DU DEN{43}LEUCHTTURM GESEHEN? NIEMAND{43}FINDET	HER OHNE SEIN LICHT.{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $14B,$9	; Run text script at offset 0x027890
					; 0xE127: PRINT	MSG 0x0175, MSGBOX CLEARED, END: "{47}VIELEN DANK,{43}NIELS. DU	HAST DIE STADT{43}GERETTET!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $14D,$1	; Run text script at offset 0x027894
					; 0xE129: PRINT	MSG 0x0177, MSGBOX CLEARED, END: "{47}IN LETZTER ZEIT{43}IST ES	HIER SEHR GEFÄHRLICH{43}GEWORDEN! EINE BANDE VON{4E}{47}DIEBEN MACHT{43}DIE STADT UNSICHER.{4A}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $14E,$3	; Run text script at offset 0x027896
					; 0xE12A: PRINT	MSG 0x0178, MSGBOX CLEARED, END: "{47}ICH PACKE	MEINE{43}SACHEN! WER MÖCHTE SCHON MIT{43}DIEBEN	LEBEN?{4A}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $14F,$5	; Run text script at offset 0x027898
					; 0xE12B: PRINT	MSG 0x0179, MSGBOX CLEARED, END: "{47}JETZT, DA	DIE{43}DIEBE WEG SIND, WERDE ICH WOHL{43}ERST EINMAL HIERBLEIBEN ....{4E}{47}TSCHÜSS DANN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $150,$1	; Run text script at offset 0x02789A
					; 0xE12C: PRINT	MSG 0x017A, MSGBOX CLEARED, END: "{47}OH, BIST DU EIN{43}BESUCHER? HEUTE KOMMEN	NUR{43}NOCH WENIGE, WEGEN DER DIEBE.{4A}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $151,$3	; Run text script at offset 0x02789C
					; 0xE12D: PRINT	MSG 0x017B, MSGBOX CLEARED, END: "{47}SCHRECKLICH!!...{4A}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $152,$5	; Run text script at offset 0x02789E
					; 0xE12E: PRINT	MSG 0x017C, MSGBOX CLEARED, END: "{47}HOFFENTLICH{43}KOMMST DU BALD WIEDER.{43}NEIN...ICH HOFFE	ES WIRKLICH!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $153,$7	; Run text script at offset 0x0278A0
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE12F: PRINT	MSG 0x017D, MSGBOX CLEARED, END: "{47}DER {4B}{43}WURDE	VOM VOM	LEHRLING DES{43}LEUCHTTURMWÄRTERS GESTOHLEN!{4E}{47}WUSSTEST DU	DAS?{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009D:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $155,$0	; Run text script at offset 0x0278A4
					; 0xE130: PRINT	MSG 0x017E, MSGBOX CLEARED, END: "{47}DER LADENBESITZER{43}IST NICHT MEHR DA. WO BEKOMME{43}ICH	DENN JETZT EKENOL?{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_000E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $156,$1	; Run text script at offset 0x0278A6
					; 0xE131: PRINT	MSG 0x017F, MSGBOX CLEARED, END: "{47}ES SIND DIEBE, ABER{43}SIE SIND TROTZDEM MENSCHEN.{43}ICH	MUSS SIE BEKEHREN!{4A}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $157,$3	; Run text script at offset 0x0278A8
					; 0xE132: PRINT	MSG 0x0180, MSGBOX CLEARED, END: "{47}DAS MÜSSEN{43}TEUFEL SEIN!!...{4A}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $158,$5	; Run text script at offset 0x0278AA
					; 0xE133: PRINT	MSG 0x0181, MSGBOX CLEARED, END: "{47}WAREN SIE{43}MONSTER? WIRKLICH?{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $159,$7	; Run text script at offset 0x0278AC
					; 0xE134: PRINT	MSG 0x0182, MSGBOX CLEARED, END: "{47}DIE LEUTE	SIND{43}JETZT SO UNZUFRIEDEN. ABER SIE{43}WERDEN BESTIMMT GLÜCKLICH.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $15A,$1	; Run text script at offset 0x0278AE
					; 0xE135: PRINT	MSG 0x0183, MSGBOX CLEARED, END: "{47}WIR LEBEN	IN{43}STÄNDIGER	ANGST VOR DEN DIEBEN,{43}DIE DIE HÖHLE VOR DEN BERGEN{4E}{47}HEIMGESUCHT{43}HABEN.{4A}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $15B,$3	; Run text script at offset 0x0278B0
					; 0xE136: PRINT	MSG 0x0184, MSGBOX CLEARED, END: "{47}BITTE RETTE{43}UNSERE STADT...{4A}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $15C,$5	; Run text script at offset 0x0278B2
					; 0xE137: PRINT	MSG 0x0185, MSGBOX CLEARED, END: "{47}DU HAST DIE{43}DIEBE GANZ	ALLEINE	BESIEGT?{43}UNGLAUBLICH!!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $15D,$7	; Run text script at offset 0x0278B4
					; 0xE138: PRINT	MSG 0x0186, MSGBOX CLEARED, END: "{47}BITTE KÜMMERE{43}DICH DARUM, DASS	UNSER LEUCHT-{43}TURM BALD WIEDER LEUCHTET!!{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $15E,$9	; Run text script at offset 0x0278B6
					; 0xE139: PRINT	MSG 0x0187, MSGBOX CLEARED, END: "{47}DU HAST DIESER{43}STADT SEHR GEHOLFEN.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $15F,$1	; Run text script at offset 0x0278B8
					; 0xE13A: PRINT	MSG 0x0188, MSGBOX CLEARED, END: "{47}DIE WAREN	GANZ{43}SCHNELL	WIEDER WEG.{43}ANGSTHASEN!!{4E}{47}SOLDATEN AUS{43}MERKATOR HABEN SIE INS VOR-{43}GEBIRGE ZURÜCKGETRIEBEN,{4E}{47}ABER SIE SIND{43}ENTKOMMEN.{4A}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $160,$3	; Run text script at offset 0x0278BA
					; 0xE13B: PRINT	MSG 0x0189, MSGBOX CLEARED, END: "{47}KANN NICHT{43}ENDLICH JEMAND DIE DIEBE{43}VERTREIBEN?!{4A}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $161,$5	; Run text script at offset 0x0278BC
					; 0xE13C: PRINT	MSG 0x018A, MSGBOX CLEARED, END: "{47}DU BIST TOLL!{43}WIE HAST	DU NUR DEN GEFAHREN{43}DER HÖHLE ALLEINE GETROTZT?{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $162,$7	; Run text script at offset 0x0278BE
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE13D: PRINT	MSG 0x018B, MSGBOX CLEARED, END: "{47}DEN {4B}{43}ZU BEKOMMEN, IST FAST{43}UNMÖGLICH! SAG MIR, WER MIR{4E}{47}DABEI HELFEN{43}KÖNNTE!{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $164,$9	; Run text script at offset 0x0278C2
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE13E: PRINT	MSG 0x018C, MSGBOX CLEARED, END: "{47}WAS!{43}DU HAST DEN {4B}{43}GEFUNDEN! WAHNSINN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_000F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 8			; Params 00, 08
		ScriptID    $166,$1	; Run text script at offset 0x0278C6
					; 0xE13F: PRINT	MSG 0x018D, MSGBOX CLEARED, END: "{47}ICH DANKE	DIR VON{43}GANZEM HERZEN! WENN DU{43}DEN SCHATZ	FINDEN SOLLTEST.....{4E}{47}KAUFE DOCH MEINEN{43}LADEN LEER!  HA-HA-HA-	HA!{43}ENTSCHULDIGUNG...{4E}{47}...NUR EIN KAUFMANNSSCHERZ!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $167,$3	; Run text script at offset 0x0278C8
					; 0xE140: PRINT	MSG 0x018E, MSGBOX CLEARED, END: "{47}DIE LEUTE	VON MERKATOR{43}SIND WEGEN DES LEUCHTTURMS{43}ETWAS DURCHEINANDER, ODER?{4E}{47}MAN ERZÄHLT, DER{43}HERZOG WÄRE	EINFACH{43}FORTGEGANGEN...{4E}{47}GLAUBST DU, ER IST{43}LOSGEZOGEN, UM AUCH EINEN{43}SONNENSTEIN ZU FINDEN?{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $168,$1	; Run text script at offset 0x0278CA
					; 0xE141: PRINT	MSG 0x018F, MSGBOX CLEARED, END: "{47}...MURMEL...{43}MEIN SOHN	IST JETZT WEG...{4A}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $169,$3	; Run text script at offset 0x0278CC
					; 0xE142: PRINT	MSG 0x0190, MSGBOX CLEARED, END: "{47}...MURMEL...{43}BITTE RÄCHE MEINEN SOHN!{43}...BITTE...!{4A}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $16A,$5	; Run text script at offset 0x0278CE
					; 0xE143: PRINT	MSG 0x0191, MSGBOX CLEARED, END: "{47}...MURMEL...{43}MURMEL...{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $16B,$7	; Run text script at offset 0x0278D0
					; 0xE144: PRINT	MSG 0x0192, MSGBOX CLEARED, END: "{47}...MURMEL...{43}ICH FRAGE	MICH, OB ES IHR	GUT{43}GEHT...DA IN MERKATOR...{4E}{47}...OB IHR MANN{43}IMMER NOCH...VASEN SAMMELT?{43}...MURMEL...{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $16C,$1	; Run text script at offset 0x0278D2
					; 0xE145: PRINT	MSG 0x0193, MSGBOX CLEARED, END: "{47}MEIN VATER IST{43}GERADE NICHT ZU	HAUSE.{43}HAT GESAGT, ES WÄR' WICHTIG.{4A}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $16D,$3	; Run text script at offset 0x0278D4
					; 0xE146: PRINT	MSG 0x0194, MSGBOX CLEARED, END: "{47}VATER HAT	IMMER{43}ZU MIR	GESAGT...DASS SEEFAHRER{43}NIE WEINEN...SCHLUCHZ...{4A}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $16E,$5	; Run text script at offset 0x0278D6
					; 0xE147: PRINT	MSG 0x0195, MSGBOX CLEARED, END: "{47}HAHA! KOMM{43}ZURÜCK, PAPA! ER IST SEHR{43}STARK,	NICH'?{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $16F,$7	; Run text script at offset 0x0278D8
					; 0x8148: PRINT	MSG 0x0196: "{47}MACH NICHT MEINEN{43}PAPA DAFÜR VERANTWORTLICH!{43}ER WAR AM MEISTEN SCHOCKIERT,{4E}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE149: PRINT	MSG 0x0197, MSGBOX CLEARED, END: "{47}ALS DIESER{43}BÖSE LEHRLING DEN {4B}{43}GESTOHLEN	HAT.{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $172,$9	; Run text script at offset 0x0278DE
					; 0xE14A: PRINT	MSG 0x0198, MSGBOX CLEARED, END: "{47}DU BIST TOTAL{43}COOL! NACH MEINEM VATER{43}BIST DU DER GRÖSSTE!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A2:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 8			; Params 00, 08
		ScriptJump  CS_00A2_0,$1 ; Jump	to address 0x0261C0
					;
		dc.w $18		; Params 00, 18
		ScriptID    $176,$3	; Run text script at offset 0x0278E6
					; 0x814E: PRINT	MSG 0x019C: "{47}MEIN AUSREISSER-{43}LEHRLING IST PLÖTZLICH{43}WIEDER AUFGETAUCHT...{4E}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE14F: PRINT	MSG 0x019D, MSGBOX CLEARED, END: "{47}UND HAT SICH{43}MIT DEM {4B}{43}AUS DEM STAUB GEMACHT....{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $68D,$5	; Run text script at offset 0x028314
					; 0xE4C5: PRINT	MSG 0x0513, MSGBOX CLEARED, END: "{47}ICH HABE IHN{43}ABGESCHLOSSEN, DAMIT UNS DAS{43}NICHT NOCH EINMAL	PASSIERT!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A2_0:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $173,$0	; Prompt:	Run text script	at offset 0x0278E0
					; 0xA14B: PRINT	MSG 0x0199, END: "{47}NIELS, WIE GUT,{43}DASS DU KOMMST! MEIN LEHRLING{43}IST IN DIESEM	GANZEN{4E}{47}DURCHEINANDER{43}VERSCHWUNDEN. WARUM ÜBERNIMMST{43}DU NICHT SEINEN JOB?{44}"
		ScriptID    $174,$1	; Answer 'yes': Run text script at offset 0x0278E2
					; 0xE14C: PRINT	MSG 0x019A, MSGBOX CLEARED, END: "{47}HAHAHAHAHA!{43}NUR EIN SCHERZ! WAS FÜR EIN{43}GUTMÜTIGER JUNGE DU	DOCH BIST!{4A}"
		ScriptID    $175,$2	; Answer 'no':  Run text script at offset 0x0278E4
					; 0xE14D: PRINT	MSG 0x019B, MSGBOX CLEARED, END: "{47}IST SCHON	OKAY!{43}DIE LEUTE VON RYUMA BRAUCHEN{43}DEINE HILFE NÖTIGER.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0010:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $179,$1	; Run text script at offset 0x0278EC
					; 0x8150: PRINT	MSG 0x019E: "{47}DER MEISTER IST{43}NICHT DA, ABER VIELLEICHT KANN{43}ICH ERKLÄREN, WIE	ES GEHT.{4E}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE151: PRINT	MSG 0x019F, MSGBOX CLEARED, END: "{47}DIESER LEUCHTTURM{43}BENUTZT EINEN SONNENSTEIN,{43}DEN HELLSTEN STEIN{4E}{47}IM GANZEN LAND,{43}UM SCHIFFE SICHER	ZUM HAFEN{43}ZU	LEITEN.{4A}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $17C,$3	; Run text script at offset 0x0278F2
					; 0xE152: PRINT	MSG 0x01A0, MSGBOX CLEARED, END: "{47}M-MEIN ...{43}MEISTER WURDE VON DEN DIEBEN{43}GETÖTET...WAS SOLLTE ICH TUN?{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $17D,$5	; Run text script at offset 0x0278F4
					; 0xE153: PRINT	MSG 0x01A1, MSGBOX CLEARED, END: "{47}OOOH NEIN...{43}ES TUT MIR SO LEID!... ICH{43}HÄTT'S NICHT GETAN, WENN ICH{4E}{47}GEWUSST HÄTTE,{43}DASS ES EIN TEIL VON HERZOG{43}MERKATORS VERSCHWÖRUNG WAR!{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $17E,$7	; Run text script at offset 0x0278F6
					; 0xE154: PRINT	MSG 0x01A2, MSGBOX CLEARED, END: "{47}OOOOH.....!!!{43}BITTE LASS MICH GEHEN...{43}ES TUT MIR WIRKLICH SO LEID...{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $17F,$9	; Run text script at offset 0x0278F8
					; 0xE155: PRINT	MSG 0x01A3, MSGBOX CLEARED, END: "{47}ICH HABE MICH{43}VÖLLIG GEÄNDERT!	ICH ARBEITE{43}HART BEI	ARTHUR,	UM MEINE{4E}{47}SÜNDEN WIEDER-{43}GUTZUMACHEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A3:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $180,$1	; Run text script at offset 0x0278FA
					; 0xE156: PRINT	MSG 0x01A4, MSGBOX CLEARED, END: "{47}DIE DIEBE{43}SCHEINEN NACH DEMSELBEN{43}SCHATZ WIE DU ZU SUCHEN.{4E}{47}IN DER HÖHLE{43}MUSS ES IRGENDWO EINEN HINWEIS{43}GEBEN!{4A}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $181,$3	; Run text script at offset 0x0278FC
					; 0xE157: PRINT	MSG 0x01A5, MSGBOX CLEARED, END: "{47}HAST DU DIE{43}STEINTAFEL	DA GEFUNDEN? TOLL!{43}DAS MUSS EIN HINWEIS SEIN!{4E}{47}LASS MICH MAL{43}SEHEN!{4E}{47}WAS?!{43}SIE WURDE GESTOHLEN?{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $182,$5	; Run text script at offset 0x0278FE
					; 0xE158: PRINT	MSG 0x01A6, MSGBOX CLEARED, END: "{47}HERZOG MERKATOR{43}HAT SEINE EIGENE STADT{43}FÜR DEN SCHATZ VERLASSEN...{4E}{47}ICH VERMUTE, DAS{43}BEDEUTET, DASS DER LEGENDÄRE{43}SCHATZ TATSÄCHLICH EXISTIERT!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A4:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $183,$1	; Run text script at offset 0x027900
					; 0xE159: PRINT	MSG 0x01A7, MSGBOX CLEARED, END: "{47}MACHT ES DIR{43}ETWAS AUS, HINAUSZUGEHEN?	WIR{43}BEFINDEN	UNS IN EINER SITZUNG.{4A}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $184,$3	; Run text script at offset 0x027902
					; 0xE15A: PRINT	MSG 0x01A8, MSGBOX CLEARED, END: "{47}SO, DU HAST{43}ALSO MITGEHÖRT... TJA, DER{43}BÜRGERMEISTER HAT VERSUCHT,{4E}{47}SICH MIT DEN{43}DIEBEN ZU	EINIGEN...{4E}{47}ABER ER IST{43}NICHT MEHR ZURÜCKGEKOMMEN.{43}WAS IST PASSIERT?{4A}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $185,$5	; Run text script at offset 0x027904
					; 0xE15B: PRINT	MSG 0x01A9, MSGBOX CLEARED, END: "{47}DU HAST DIE{43}STADT GERETTET! ICH KANN KAUM{43}GLAUBEN, DASS DU DAS GANZ	ALLEIN{4E}{47}GESCHAFFT{43}HAST!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $186,$7	; Run text script at offset 0x027906
					; 0xE15C: PRINT	MSG 0x01AA, MSGBOX CLEARED, END: "{47}DAS GRÜNE{43}LABYRINTH WIRD AUCH "WALD DER{43}VERLORENEN"	GENANNT.{4E}{47}MAN SAGT, WENN DU{43}EINMAL DEN	WALD BETRITTST...{45}{43}..KOMMST DU NIE WIEDER	HERAUS.{4E}{47}ER IST SO GE-{43}FÄHRLICH, DASS HERZOG MERKATOR{43}VERBOTEN HAT,	HINEINZUGEHEN.{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $185,$9	; Run text script at offset 0x027904
					; 0xE15B: PRINT	MSG 0x01A9, MSGBOX CLEARED, END: "{47}DU HAST DIE{43}STADT GERETTET! ICH KANN KAUM{43}GLAUBEN, DASS DU DAS GANZ	ALLEIN{4E}{47}GESCHAFFT{43}HAST!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $187,$1	; Run text script at offset 0x027908
					; 0xE15D: PRINT	MSG 0x01AB, MSGBOX CLEARED, END: "{47}DER BÜRGER-{43}MEISTER IST GERADE	NICHT DA...{4A}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $188,$3	; Run text script at offset 0x02790A
					; 0xE15E: PRINT	MSG 0x01AC, MSGBOX CLEARED, END: "{47}WIR SIND{43}VERLOREN, WENN DER{43}BÜRGERMEISTER UMKOMMT...{4A}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $189,$5	; Run text script at offset 0x02790C
					; 0xE15F: PRINT	MSG 0x01AD, MSGBOX CLEARED, END: "{47}EINSTIMMIG{43}BESCHLOSSEN! DU BIST{43}EHRENBÜRGER	DER STADT RYUMA!{4A}"
					;
		dc.w $A			; Params 00, 0A
		ScriptID    $18A,$7	; Run text script at offset 0x02790E
					; 0xE160: PRINT	MSG 0x01AE, MSGBOX CLEARED, END: "{47}WAS WIRST	DU{43}MIT DEM SCHATZ MACHEN?{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $18B,$9	; Run text script at offset 0x027910
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE161: PRINT	MSG 0x01AF, MSGBOX CLEARED, END: "{47}OH, UNSER{43}EHRENBÜRGER!	WIR HABEN GERADE{43}EINE SITZUNG, IN DER WIR{4E}{47}ENTSCHEIDEN,{43}WER	DEN {4B}{43}HOLEN MUSS.{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $18A,$B	; Run text script at offset 0x02790E
					; 0xE160: PRINT	MSG 0x01AE, MSGBOX CLEARED, END: "{47}WAS WIRST	DU{43}MIT DEM SCHATZ MACHEN?{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $18D,$1	; Run text script at offset 0x027914
					; 0xE162: PRINT	MSG 0x01B0, MSGBOX CLEARED, END: "{47}SIEH DIR DOCH{43}DIE STADT EIN WENIG AN,{43}JUNGER MANN!{4A}"
					;
		dc.w 6			; Params 00, 06
		ScriptJump  CS_00A6_0,$3 ; Jump	to address 0x02624E
					;
		dc.w 7			; Params 00, 07
		ScriptID    $191,$5	; Run text script at offset 0x02791C
					; 0xE165: PRINT	MSG 0x01B3, MSGBOX CLEARED, END: "{47}IHR VERSTECK IST{43}IN DER HÖHLE IM VORGEBIRGE.{43}DU KOMMST MIT EINEM FLOSS HIN.{4A}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $194,$7	; Run text script at offset 0x027922
					; 0xE168: PRINT	MSG 0x01B6, MSGBOX CLEARED, END: "{47}ICH WUSSTE DIE{43}GANZE ZEIT, DASS MAN SICH{43}AUF DICH VERLASSEN	KANN!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $195,$9	; Run text script at offset 0x027924
					; 0x8169: PRINT	MSG 0x01B7: "{47}DAS GRÜNE{43}LABYRINTH	IST SEHR SCHWER{43}ZU ÜBERWINDEN, ABER...{4E}{47}WENN ES JEMAND{43}SCHAFFEN KANN, DANN DU,{43} NIELS.{4E}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE16A: PRINT	MSG 0x01B8, MSGBOX CLEARED, END: "{47}UM DEN SONNEN-{43}STEIN ZU BEKOMMEN, BRAUCHST DU{43}EINEN	GUTEN GLEICHGEWICHTSSINN{4E}{47}UND EINE{43}HERVORRAGENDE SPRUNGKRAFT.{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $194,$B	; Run text script at offset 0x027922
					; 0xE168: PRINT	MSG 0x01B6, MSGBOX CLEARED, END: "{47}ICH WUSSTE DIE{43}GANZE ZEIT, DASS MAN SICH{43}AUF DICH VERLASSEN	KANN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A6_0:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $18E,$0	; Prompt:	Run text script	at offset 0x027916
					; 0xA163: PRINT	MSG 0x01B1, END: "{47}JUNGER MANN, DU{43}HAST UNS SEHR UNGÜNSTIG{43}ERWISCHT. ICH WEISS	NICHT,{4E}{47}WIE ICH ES{43}AUSDRÜCKEN SOLL, ABER....{43}WIR HABEN DA EIN PROBLEM.{4E}{47}WÜRDEST DU{43}UNS EINEN GEFALLEN TUN?{44}"
		ScriptID    $18F,$1	; Answer 'yes': Run text script at offset 0x027918
					; 0x8164: PRINT	MSG 0x01B2: "{47}SCHNELLER{43}ENTSCHLUSS! BIST DU SICHER?{43}NUN GUT!{4E}"
					; 0x1420: SET BIT 0 OF FLAG 0x004
					; 0xE165: PRINT	MSG 0x01B3, MSGBOX CLEARED, END: "{47}IHR VERSTECK IST{43}IN DER HÖHLE IM VORGEBIRGE.{43}DU KOMMST MIT EINEM FLOSS HIN.{4A}"
		ScriptJump  CS_00A6_1,$2 ; Answer 'no':  Jump to address 0x02625A
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00A6_1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $192,$0	; Prompt:	Run text script	at offset 0x02791E
					; 0xA166: PRINT	MSG 0x01B4, END: "{47}DU HAST RECHT,{43}ICH SOLLTE DIR ERST ERZÄHLEN,{43}UM WAS	ES GEHT.{4E}{47}ICH MÖCHTE,{43}DASS DU ZU IHREM	VERSTECK{43}GEHST UND SIE{4E}{47}DIR VORNIMMST.{43}WILLST DU DAS TUN?{44}"
		ScriptID    $190,$1	; Answer 'yes': Run text script at offset 0x02791A
					; 0x1420: SET BIT 0 OF FLAG 0x004
					; 0xE165: PRINT	MSG 0x01B3, MSGBOX CLEARED, END: "{47}IHR VERSTECK IST{43}IN DER HÖHLE IM VORGEBIRGE.{43}DU KOMMST MIT EINEM FLOSS HIN.{4A}"
		ScriptID    $193,$2	; Answer 'no':  Run text script at offset 0x027920
					; 0xE167: PRINT	MSG 0x01B5, MSGBOX CLEARED, END: "{47}ICH BIN{43}ENTTÄUSCHT VON	DIR,{43}MEIN JUNGE...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00A7:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $198,$0	; Run text script at offset 0x02792A
					; 0xE16B: PRINT	MSG 0x01B9, MSGBOX CLEARED, END: "{47}HAST DU KEINE{43}ANGST VOR DEN DIEBEN?{43}LASS ES	LIEBER!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00A8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $199,$1	; Run text script at offset 0x02792C
					; 0x7C14: LOAD CUSTOM ACTION 0x14 (0x10000004F CSA_0014), MSGBOX CLEARED, END
					;
		dc.w 6			; Params 00, 06
		ScriptID    $19A,$3	; Run text script at offset 0x02792E
					; 0xE16C: PRINT	MSG 0x01BA, MSGBOX CLEARED, END: "{47}ICH VERSTECKE{43}MICH, WEIL ICH ANGST VOR	DEN{43}DIEBEN HABE.{4A}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $19B,$5	; Run text script at offset 0x027930
					; 0xE16D: PRINT	MSG 0x01BB, MSGBOX CLEARED, END: "{47}ICH FÜRCHTE{43}MICH IMMER	NOCH...{43}SIND	SIE SCHON WEG?{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $19C,$7	; Run text script at offset 0x027932
					; 0xE16E: PRINT	MSG 0x01BC, MSGBOX CLEARED, END: "{47}NOCH EIN{43}VERRAT! ICH KANN NIEMANDEM{43}MEHR TRAUEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $19D,$1	; Run text script at offset 0x027934
					; 0xE16F: PRINT	MSG 0x01BD, MSGBOX CLEARED, END: "{47}JAA-UUL!{4A}"
					;
		dc.w $19		; Params 00, 19
		ScriptID    $19E,$3	; Run text script at offset 0x027936
					; 0xE170: PRINT	MSG 0x01BE, MSGBOX CLEARED, END: "{47}HMMMMM...{43}ICH LEBE HIER, WEIL ICH DEN{43}SEETANG SO LIEBE.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0011:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 8			; Params 00, 08
		ScriptID    $19F,$1	; Run text script at offset 0x027938
					; 0x7C21: LOAD CUSTOM ACTION 0x21 (0x100000083 CSA_0021), MSGBOX CLEARED, END
					;
		dc.w 9			; Params 00, 09
		ScriptID    $1A0,$3	; Run text script at offset 0x02793A
					; 0x0433: LOAD 0x0033 INTO 0xFF1198 (SICHER{55}HEITSPASS)
					; 0xE171: PRINT	MSG 0x01BF, MSGBOX CLEARED, END: "{47}DU KANNST{43}MIT DEM {4B}{43}NACH	MERKATOR HINEIN.{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1A2,$5	; Run text script at offset 0x02793E
					; 0xE172: PRINT	MSG 0x01C0, MSGBOX CLEARED, END: "{47}ICH GLAUBE,{43}WIR BRAUCHEN EINE{43}TEUFELSAUSTREIBUNG ODER SOWAS.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_008A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1A3,$1	; Run text script at offset 0x027940
					; 0xE173: PRINT	MSG 0x01C1, MSGBOX CLEARED, END: "{47}DAS IST JA{43}SELTSAM... WO IST DER{43}BÜRGERMEISTER? WAS	PASSIERT{4E}{47}MIT DIESER{43}STADT?{4A}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1A4,$3	; Run text script at offset 0x027942
					; 0xE174: PRINT	MSG 0x01C2, MSGBOX CLEARED, END: "{47}WAS IN ALLER{43}WELT WOLLEN DIESE	DIEBE{43}EIGENTLICH?{4A}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1A5,$5	; Run text script at offset 0x027944
					; 0xE175: PRINT	MSG 0x01C3, MSGBOX CLEARED, END: "{47}EINE SELTSAME{43}BLONDINE	HAT MIR	GERADE MEINEN{43}GELEITBRIEF WEGGENOMMEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1A6,$1	; Run text script at offset 0x027946
					; 0x18AA: LOAD CHARACTER SCRIPT	* (0x00AA)
					; 0xE176: PRINT	MSG 0x01C4, MSGBOX CLEARED, END: "{47}WENN SE KEIN'{43}GELEITBRIEF HA'M, KÖNN' SE{43}HIER NICH' REIN!{4A}"
					;
		dc.w 9			; Params 00, 09
		ScriptID    $1A8,$3	; Run text script at offset 0x02794A
					; 0xE177: PRINT	MSG 0x01C5, MSGBOX CLEARED, END: "{47}DAS IST ALSO{43}MERKATOR,	DIE STADT{43}DES GELDES!{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $1A9,$5	; Run text script at offset 0x02794C
					; 0xE178: PRINT	MSG 0x01C6, MSGBOX CLEARED, END: "{47}HEHEHEH....{43}'TSCHULDIGUNG. ICH WERDE MICH{43}MAL REVANCHIEREN.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1AA,$1	; Run text script at offset 0x02794E
					; 0x18AB: LOAD CHARACTER SCRIPT	* (0x00AB)
					; 0xE179: PRINT	MSG 0x01C7, MSGBOX CLEARED, END: "{47}MEINE BEINE TUN{43}SCHON WEH VOM HERUMSTEHEN{43}DEN GANZEN TAG.{4A}"
					;
		dc.w 9			; Params 00, 09
		ScriptID    $1AC,$3	; Run text script at offset 0x027952
					; 0xE17A: PRINT	MSG 0x01C8, MSGBOX CLEARED, END: "{47}MERKATOR IST{43}EINE STADT MIT GESCHICHTE.{43}WIR	HEISSEN	DICH WILLKOMMEN.{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $1AD,$5	; Run text script at offset 0x027954
					; 0xE17B: PRINT	MSG 0x01C9, MSGBOX CLEARED, END: "{47}HALLO, NIELS!{43}WIE GEHT	ES DIR?{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0012:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1AE,$0	; Run text script at offset 0x027956
					; 0xE17C: PRINT	MSG 0x01CA, MSGBOX CLEARED, END: "{47}MERKATOR IST{43}EINE SCHÖNE STADT, WO MAN	VIEL{43}BESICHTIGEN UND	ERLEBEN	KANN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00AC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1AF,$1	; Run text script at offset 0x027958
					; 0xE17D: PRINT	MSG 0x01CB, MSGBOX CLEARED, END: "{47}ICH BIN GERADE{43}VOM FESTLAND GEKOMMEN. WAS FÜR{43}EINE RIESIGE STADT!{4A}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $1B0,$3	; Run text script at offset 0x02795A
					; 0xE17E: PRINT	MSG 0x01CC, MSGBOX CLEARED, END: "{47}ICH HABE{43}GEHÖRT, DASS MAN SICH	BEI MA-{43}DAME	YARD GUT ENTSPANNEN KANN!{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $1B1,$5	; Run text script at offset 0x02795C
					; 0xE17F: PRINT	MSG 0x01CD, MSGBOX CLEARED, END: "{47}WAHNSINN!!!!{43}MERKATOR IST JA SUPER! TOLL!{43}HIER MÖCHTE ICH BLEIBEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1B2,$1	; Run text script at offset 0x02795E
					; 0xE180: PRINT	MSG 0x01CE, MSGBOX CLEARED, END: "{47}DIE PREISE IN{43}DIESER STADT SIND VIEL ZU HOCH.{43}ICH BRAUCHE WOHL MEHR	GELD...{4A}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $1B3,$3	; Run text script at offset 0x027960
					; 0xE181: PRINT	MSG 0x01CF, MSGBOX CLEARED, END: "{47}DU BIST NEU{43}IN	DER STADT, ODER?{4A}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $1B4,$5	; Run text script at offset 0x027962
					; 0xE182: PRINT	MSG 0x01D0, MSGBOX CLEARED, END: "{47}ICH HABE MEIN{43}GANZES GELD AUSGEGEBEN. ICH{43}MÜSSTE WIEDER NACH HAUSE,{4E}{47}ABER ICH	KANN{43}DIE REISE NICHT	BEZAHLEN!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1B5,$7	; Run text script at offset 0x027964
					; 0x8183: PRINT	MSG 0x01D1: "{47}DIESER	JUNGE{43}DUMMKOPF WAR DER ASSISTENT VOM{43}LEUCHTTURMWÄRTER. ER	HATTE{4E}{47}DAS VOLLE{43}VERTRAUEN SEINES MEISTERS,{4E}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE184: PRINT	MSG 0x01D2, MSGBOX CLEARED, END: "{47}ABER ER HAT DEN{43}{4B} GESTOHLEN! ER{43}HAT SEINEN MEISTER BETROGEN!{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1B8,$9	; Run text script at offset 0x02796A
					; 0xE185: PRINT	MSG 0x01D3, MSGBOX CLEARED, END: "{47}DIE JUNGEN{43}MÄNNER VON HEUTE HABEN KEINEN{43}SCHNEID MEHR!{4E}{47}SIE HANDELN{43}ALLE VIEL ZU KURZSICHTIG!{4A}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $1B9,$B	; Run text script at offset 0x02796C
					; 0xE186: PRINT	MSG 0x01D4, MSGBOX CLEARED, END: "{47}WIR REDEN{43}GERADE ÜBER DIE ZUKUNFT VON{43}MERKATOR.{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $1BA,$D	; Run text script at offset 0x02796E
					; 0xE187: PRINT	MSG 0x01D5, MSGBOX CLEARED, END: "{47}ICH GLAUB' ES{43}JA NICHT! ICH HABE ÜBER 1000{43}TALER FÜR DIESES DUMME{4E}{47}HÜHNERWETTRENNEN{43}AUSGEGEBEN!!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1BB,$1	; Run text script at offset 0x027970
					; 0xE188: PRINT	MSG 0x01D6, MSGBOX CLEARED, END: "{47}WIR KOMMEN{43}FAST NIE IN	DAS SCHLOSS...{4A}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $1BC,$3	; Run text script at offset 0x027972
					; 0xE189: PRINT	MSG 0x01D7, MSGBOX CLEARED, END: "{47}DER HERZOG{43}HEUERT GERADE SÖLDNER AN.{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $1BD,$5	; Run text script at offset 0x027974
					; 0xE18A: PRINT	MSG 0x01D8, MSGBOX CLEARED, END: "{47}DU BIST IN DAS{43}SCHLOSS	EINGELADEN WORDEN? DU{43}MUSST SEHR EINFLUSSREICH SEIN!{4E}{47}KANN ICH	DEIN{43}AUTOGRAMM HABEN?{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0013:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1BE,$1	; Run text script at offset 0x027976
					; 0xE18B: PRINT	MSG 0x01D9, MSGBOX CLEARED, END: "{47}BITTE... STÖR{43}MICH JETZT NICHT. DAS HIER ER-{43}FORDERT HÖCHSTE KONZENTRATION...{4A}"
					;
		dc.w $D			; Params 00, 0D
		ScriptID    $1BF,$3	; Run text script at offset 0x027978
					; 0x7C3D: LOAD CUSTOM ACTION 0x3D (0x1000000F3 CSA_003D), MSGBOX CLEARED, END
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $1C0,$5	; Run text script at offset 0x02797A
					; 0xE18C: PRINT	MSG 0x01DA, MSGBOX CLEARED, END: "{47}WAS IST LOS?{43}GEH WEITER! MACH EINFACH DIE{43}TÜR AUF UND GEH HINEIN!{4A}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $1C1,$7	; Run text script at offset 0x02797C
					; 0xE18D: PRINT	MSG 0x01DB, MSGBOX CLEARED, END: "{47}WIE WAR'S?{43}NICHT GANZ SO, WIE DU ES{43}DIR VORGESTELLT HAST, ODER?{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $1C2,$9	; Run text script at offset 0x02797E
					; 0xE18E: PRINT	MSG 0x01DC, MSGBOX CLEARED, END: "{47}ICH HABE GESAGT,{43}DU SOLLST MICH NICHT STÖREN!{43}HAMMANA, HAMMENA, HAMMINA...{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptJump  CS_0013_0,$B ; Jump	to address 0x026346
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1C7,$D	; Run text script at offset 0x027988
					; 0xE191: PRINT	MSG 0x01DF, MSGBOX CLEARED, END: "{47}BITTE STÖR MICH{43}NICHT{3F} SONST MUSS ICH DICH{43}LEIDER IN EINEN HUND{4E}{47}VERWANDELN!!{43}WO WAR ICH{43}DENN JETZT?.....{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0013_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $132		; Bit 2	of flag	0x026
		ScriptID    $1C5,$1	; Flag set:   Run text script at offset	0x027984
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE190: PRINT	MSG 0x01DE, MSGBOX CLEARED, END: "{47}DU HAST DEN{43}{4B}! MEINE KRISTALL-{43}KUGEL SAGT IMMER DIE WAHRHEIT!{4A}"
		ScriptID    $1C3,$2	; Flag clear: Run text script at offset	0x027980
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE18F: PRINT	MSG 0x01DD, MSGBOX CLEARED, END: "{47}DER {4B}!{43}ICH KANN IHN	SEHEN!{43}GEH UND HOL IHN!{4E}{47}DANN{43}FUNKTIONIERT DER LEUCHTTURM{43}WIEDER!{4E}{47}ICH GLAUBE, DU{43}BIST KLUG GENUG, UM DAS GRÜNE{43}LABYRINTH ALLEIN ZU SCHAFFEN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00AF:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1C8,$1	; Run text script at offset 0x02798A
					; 0xE192: PRINT	MSG 0x01E0, MSGBOX CLEARED, END: "{47}ICH WÄRE{43}GERNE	NOCHMAL	JUNG.....{4A}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $1C9,$3	; Run text script at offset 0x02798C
					; 0xE193: PRINT	MSG 0x01E1, MSGBOX CLEARED, END: "{47}HE, SCHÄTZCHEN!{43}SEH' ICH GUT AUS?{43}BIN ICH JUNG? LA-LA- LA!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1CA,$1	; Run text script at offset 0x02798E
					; 0xE194: PRINT	MSG 0x01E2, MSGBOX CLEARED, END: "{47}WENN MEINE{43}MUTTER WIRKLICH JUNG WIRD, KANN{43}ICH BEI MEINEN FREUNDEN PRAHLEN!{4A}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $1CB,$3	; Run text script at offset 0x027990
					; 0xE195: PRINT	MSG 0x01E3, MSGBOX CLEARED, END: "{47}ES IST JA	SCHÖN,{43}MEINE	MUTTER WIEDER JUNG ZU{43}SEHEN,	ABER...{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1CC,$1	; Run text script at offset 0x027992
					; 0xE196: PRINT	MSG 0x01E4, MSGBOX CLEARED, END: "{47}ES GIBT HIER{43}KAUM MONSTER. SIE	ERZIELEN EINEN{43}GUTEN	PREIS AUF DEM FESTLAND.{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1CD,$3	; Run text script at offset 0x027994
					; 0xE197: PRINT	MSG 0x01E5, MSGBOX CLEARED, END: "{47}ICH HABE EINE{43}TONNE TALER FÜR DIE MONSTER{43}BEKOMMEN!{4E}{47}UND JETZT GEHE{43}ICH ZU	GRIHNPIES' SPIELHAUS.{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $1CE,$5	; Run text script at offset 0x027996
					; 0xE198: PRINT	MSG 0x01E6, MSGBOX CLEARED, END: "{47}ICH HABE DIE{43}DREI GESUCHTESTEN	KRIMINELLEN{43}DIESER INSEL GEFANGEN!{4E}{47}DIE BRINGEN{43}GUTES GELD!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B2:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1CF,$0	; Run text script at offset 0x027998
					; 0x1BEE: LOAD SPECIAL CHARACTER * (0x06)
					; 0xE199: PRINT	MSG 0x01E7, MSGBOX CLEARED, END: "{47}...GRRRRRRRR...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B3:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1D1,$0	; Run text script at offset 0x02799C
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0xE19A: PRINT	MSG 0x01E8, MSGBOX CLEARED, END: "{47}...WUUUUUU!!!...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B4:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1D3,$0	; Run text script at offset 0x0279A0
					; 0x1BEE: LOAD SPECIAL CHARACTER * (0x06)
					; 0xE19B: PRINT	MSG 0x01E9, MSGBOX CLEARED, END: "{47}AAARRRG!!.....{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B5:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1D5,$0	; Run text script at offset 0x0279A4
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0xE19C: PRINT	MSG 0x01EA, MSGBOX CLEARED, END: "{47}HISSSS!!!.....{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1D7,$1	; Run text script at offset 0x0279A8
					; 0xE19D: PRINT	MSG 0x01EB, MSGBOX CLEARED, END: "{47}HERZOG MERKATOR{43}IST EIN FEINER	MENSCH.	IHM{43}HABEN WIR ES ZU VERDANKEN,{4E}{47}DASS ES UNS SO{43}GUT GEHT. EIN HURRA AUF{43}HERZOG MERKATOR!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1D8,$3	; Run text script at offset 0x0279AA
					; 0xE19E: PRINT	MSG 0x01EC, MSGBOX CLEARED, END: "{47}W-{45}W-{45}WAS?{43}HERZOG MERKATOR HAT UNS IM{43}STICH GELASSEN?{4E}{47}DAS GLAUBE{43}ICH NICHT!{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $1D9,$5	; Run text script at offset 0x0279AC
					; 0xE19F: PRINT	MSG 0x01ED, MSGBOX CLEARED, END: "{47}EIN HURRA{43}AUF GENERAL ARTHUR!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1DA,$1	; Run text script at offset 0x0279AE
					; 0xE1A0: PRINT	MSG 0x01EE, MSGBOX CLEARED, END: "{47}ICH HABE{43}GEHÖRT, DASS EIN BÖSER{43}ZAUBERER SÜDLICH DER STADT{4E}{47}DER GRUND{43}UNSERES KUMMERS{43}MIT DEM HERZOG SEIN SOLL.{4E}{47}SCHEINBAR BENUTZT{43}ER SEINE ZAUBERKRAFT, DAMIT{43}DER HERZOG IHM GELD GIBT.{4E}{47}DARUM ZAHLEN{43}WIR	SO HOHE	STEUERN...,{43}NICHT WAHR?{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $1DB,$3	; Run text script at offset 0x0279B0
					; 0xE1A1: PRINT	MSG 0x01EF, MSGBOX CLEARED, END: "{47}HAST DU MIR{43}BESIEGT? WIRKLICH?	ABER WARUM{43}MACHST DU	SO'N LANGES GESICHT?{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1DC,$5	; Run text script at offset 0x0279B2
					; 0xE1A2: PRINT	MSG 0x01F0, MSGBOX CLEARED, END: "{47}WAS FANGEN WIR{43}BLOSS OHNE HERZOG MERKATOR AN?{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $1DD,$7	; Run text script at offset 0x0279B4
					; 0xE1A3: PRINT	MSG 0x01F1, MSGBOX CLEARED, END: "{47}GENERAL ARTHUR{43}HAT DIE	STEUERN	GESENKT.{43}PRIMA KERL!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1DE,$1	; Run text script at offset 0x0279B6
					; 0xE1A4: PRINT	MSG 0x01F2, MSGBOX CLEARED, END: "{47}WILLKOMMEN BEI{43}HERRN LUDWIG. WENN DU WEGEN{43}MUSIKSTUNDEN GEKOMMEN BIST,{4E}{47}HERR LUDWIG{43}IST NICHT DA.....{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $1DF,$3	; Run text script at offset 0x0279B8
					; 0xE1A5: PRINT	MSG 0x01F3, MSGBOX CLEARED, END: "{47}LUDWIG IST NICHT{43}HIER!	ICH FÜRCHTE, ER	WIRD{43}EINE GANZE WEILE WEG SEIN.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1E0,$1	; Run text script at offset 0x0279BA
					; 0xE1A6: PRINT	MSG 0x01F4, MSGBOX CLEARED, END: "{47}BIST DU AUCH{43}HERGEKOMMEN, UM IHN SPIELEN ZU{43}HÖREN? ICH BIN EXTRA VOM FEST-{4E}{47}LAND ANGEREIST,{43}NUR UM	UNSEREN	HELDEN SPIELEN{43}ZU HÖREN... WO IST ER	DENN?{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $1E1,$3	; Run text script at offset 0x0279BC
					; 0xE1A7: PRINT	MSG 0x01F5, MSGBOX CLEARED, END: "{47}WIE SCHADE! ICH{43}HABE MICH SO DARAUF GEFREUT,{43}SEINE SCHÖNE MUSIK ZU HÖREN.{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1E2,$5	; Run text script at offset 0x0279BE
					; 0xE1A8: PRINT	MSG 0x01F6, MSGBOX CLEARED, END: "{47}ICH REISE	ZURÜCK{43}AUF'S FESTLAND. ES IST SINN-{43}LOS, LÄNGER DARAUF ZU WARTEN,{4E}{47}DASS LUDWIG{43}WIEDERKOMMT. WAS? DER LEUCHT-{43}TURM LEUCHTET NICHT MEHR?{4E}{47}SO WAS ABER{43}AUCH! WAS FÜR EIN PECH!!!{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1E3,$7	; Run text script at offset 0x0279C0
					; 0xE1A9: PRINT	MSG 0x01F7, MSGBOX CLEARED, END: "{47}ICH GEHE JETZT{43}NACH HAUSE. SIEHT SO AUS, ALS{43}OB ICH	IHN NIE	HÖREN WERDE.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0014:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1E4,$0	; Run text script at offset 0x0279C2
					; 0xE1AA: PRINT	MSG 0x01F8, MSGBOX CLEARED, END: "{47}LOS, BEEILUNG!!{43}KOMM HIER HOCH!{43}WIR	HABEN FAST NICHTS MEHR!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00BA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1E5,$1	; Run text script at offset 0x0279C4
					; 0xE1AB: PRINT	MSG 0x01F9, MSGBOX CLEARED, END: "{47}ES GIBT NICHTS{43}BILLIGERES! NIEDRIG-PREIS-{43}GARANTIE...JEDEN TAG!!{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $1E6,$3	; Run text script at offset 0x0279C6
					; 0xE1AC: PRINT	MSG 0x01FA, MSGBOX CLEARED, END: "{47}DIESER LADEN{43}IST SOGAR	AUF DEM	FESTLAND{43}BERÜHMT. ICH HABE EINE LANGE{4E}{47}EINKAUFSLISTE{43}VON ALL' MEINEN FREUNDEN.....{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00BB:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1E7,$0	; Run text script at offset 0x0279C8
					; 0xE1AD: PRINT	MSG 0x01FB, MSGBOX CLEARED, END: "{47}DIESER LADEN IST{43}IMMER	VOLL, WEIL ER BILLIGER{43}IST, ALS DER DA DRÜBEN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00BC:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1E8,$0	; Run text script at offset 0x0279CA
					; 0xE1AE: PRINT	MSG 0x01FC, MSGBOX CLEARED, END: "{47}ACH, WIE BLÖD.{43}ICH HABE ZUVIEL	GEKAUFT!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0015:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1E9,$1	; Run text script at offset 0x0279CC
					; 0xE1AF: PRINT	MSG 0x01FD, MSGBOX CLEARED, END: "{47}WENN DU NICHT{43}MITGLIED	BIST, VERSCHWENDE{43}NICHT MEINE ZEIT. ZISCH AB!!{4A}"
					;
		dc.w $C			; Params 00, 0C
		ScriptID    $1EA,$3	; Run text script at offset 0x0279CE
					; 0xE1B0: PRINT	MSG 0x01FE, MSGBOX CLEARED, END: "{47}DU SCHON WIEDER!{43}ICH HABE GESAGT, NUR FÜR{43}MITGLIEDER! UND JETZT RAUS!!{4A}"
					;
		dc.w $E			; Params 00, 0E
		ScriptJump  CS_0015_0,$5 ; Jump	to address 0x02641A
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $1ED,$7	; Run text script at offset 0x0279D4
					; 0xE1B2: PRINT	MSG 0x0200, MSGBOX CLEARED, END: "{47}DU BIST ABER{43}HARTNÄCKIG! WILLST DU MICH{43}ÄRGERN? LOS, VERSCHWINDE!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0015_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $1A		; Bit 2	of flag	0x003
		ScriptID    $1EC,$1	; Flag set:   Run text script at offset	0x0279D2
					; 0xE1B1: PRINT	MSG 0x01FF, MSGBOX CLEARED, END: "{47}BITTE SCHÖN...{43}NACH OBEN.{4A}"
		ScriptID    $1EB,$2	; Flag clear: Run text script at offset	0x0279D0
					; 0x7C3E: LOAD CUSTOM ACTION 0x3E (0x1000000F7 CSA_003E), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0016:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_0016_0,$1 ; Jump	to address 0x02643C
					;
		dc.w $C			; Params 00, 0C
		ScriptJump  CS_0016_3,$3 ; Jump	to address 0x026454
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $1F1,$5	; Run text script at offset 0x0279DC
					; 0xE1B5: PRINT	MSG 0x0203, MSGBOX CLEARED, END: "{47}ALSO: UM BEI MA-{43}DAME YARD MITGLIED ZU	WERDEN,{43}WENDE DICH AN DIE REZEPTION.{4A}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $1F2,$7	; Run text script at offset 0x0279DE
					; 0xE1B6: PRINT	MSG 0x0204, MSGBOX CLEARED, END: "{47}SAG FRÄULEIN{43}KURZ - ÄH, ICH MEINE,{43}FRÄULEIN	FLORA GUTEN TAG!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0016_0:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1EE,$0	; Run text script at offset 0x0279D6
					; 0x14C6: SET BIT 6 OF FLAG 0x018
					; 0xE1B3: PRINT	MSG 0x0201, MSGBOX CLEARED, END: "{47}DU BIST ZU JUNG,{43}UM BEI MADAME	YARD 'REINZU-{43}KOMMEN. TUT MIR LEID.{4E}{47}KOMM NOCHMAL{43}WIEDER, WENN DU ERWACHSEN{43}BIST.{4A}"
; ---------------------------------------------------------------------------
		move.w	#$C8,d0	; '╚'

CS_0016_1:				; CODE XREF: ROM:00026906j
		bsr.w	TestFlagBit
		beq.s	CS_0016_2
		move.w	#$2C,d0	; ','
		bsr.w	SetFlagBit

CS_0016_2:				; CODE XREF: ROM:00026448j
		rts
; ---------------------------------------------------------------------------

CS_0016_3:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $1E		; Bit 6	of flag	0x003
		ScriptID    $1F2,$1	; Flag set:   Run text script at offset	0x0279DE
					; 0xE1B6: PRINT	MSG 0x0204, MSGBOX CLEARED, END: "{47}SAG FRÄULEIN{43}KURZ - ÄH, ICH MEINE,{43}FRÄULEIN	FLORA GUTEN TAG!{4A}"
		ScriptID    $1F0,$2	; Flag clear: Run text script at offset	0x0279DA
					; 0xE1B4: PRINT	MSG 0x0202, MSGBOX CLEARED, END: "{47}NEUGIERIGER{43}JUNGE! WEISST DU, NEUGIER IST{43}WICHTIG FÜR GEISTIGE GRÖSSE...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0017:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1F3,$1	; Run text script at offset 0x0279E0
					; 0xE1B7: PRINT	MSG 0x0205, MSGBOX CLEARED, END: "{47}NUR MITGLIEDER{43}DÜRFEN NACH OBEN GEHEN.{43}TUT MIR LEID.{4A}"
					;
		dc.w $C			; Params 00, 0C
		ScriptID    $1F4,$3	; Run text script at offset 0x0279E2
					; 0x142E: SET BIT 6 OF FLAG 0x005
					; 0xE1B8: PRINT	MSG 0x0206, MSGBOX CLEARED, END: "{47}OKAY, HÖR	GUT{43}ZU. DAS IST EIN ALTER TRICK{43}UNTER JUNGEN ...{4E}{47}GEH UND FRAG{43}DEN WAHRSAGER. DU	WIRST{43}ANGENEHM ÜBERRASCHT SEIN!{4A}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $1F6,$5	; Run text script at offset 0x0279E6
					; 0xE1B9: PRINT	MSG 0x0207, MSGBOX CLEARED, END: "{47}WILLKOMMEN{43}BEI	MADAME YARD!{43}SIE IST	DIE ALLERBESTE!!{4A}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $1F7,$7	; Run text script at offset 0x0279E8
					; 0xE1BA: PRINT	MSG 0x0208, MSGBOX CLEARED, END: "{47}ENTBEHRUNGEN{43}MACHEN DICH REIF.{4E}{47}ES GIBT WIRKLICH{43}KEINE EINFACHEN LÖSUNGEN.....{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00BD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1F8,$1	; Run text script at offset 0x0279EA
					; 0xE1BB: PRINT	MSG 0x0209, MSGBOX CLEARED, END: "{47}ZIEMLICH TEUER,{43}ABER ICH FÜHLE	MICH SCHON VIEL{43}BESSER! JETZT MUSS ICH NACH{4E}{47}HAUSE UND...{43}ANWENDEN,	WAS ICH	GELERNT{43}HABE.{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1F9,$3	; Run text script at offset 0x0279EC
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE1BC: PRINT	MSG 0x020A, MSGBOX CLEARED, END: "{47}HERZOG MERKATOR{43}HAT IHN GEBETEN, DEN{43}{4B}{4E}{47}FÜR SECHS{43}TALER	ZU STEHLEN!{4E}{47}SECHS!!{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1FB,$5	; Run text script at offset 0x0279F0
					; 0xE1BD: PRINT	MSG 0x020B, MSGBOX CLEARED, END: "{47}ICH HABE MIR{43}GERADE VOM VIELEN	REDEN DEN{43}KIEFER AUSGERENKT.{4A}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $1FC,$7	; Run text script at offset 0x0279F2
					; 0xE1BE: PRINT	MSG 0x020C, MSGBOX CLEARED, END: "{47}ICH MÖCHTE,{43}DASS SIE DIE STEUERN SENKEN!{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $1FD,$9	; Run text script at offset 0x0279F4
					; 0xE1BF: PRINT	MSG 0x020D, MSGBOX CLEARED, END: "{47}AM LIEBSTEN{43}SPIELE ICH	ROULETTE! GEHEN{43}WIR DAS DICKE GELD GEWINNEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00BE:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1FE,$0	; Run text script at offset 0x0279F6
					; 0xE1C0: PRINT	MSG 0x020E, MSGBOX CLEARED, END: "{47}ICH? JA, ICH{43}BIN MITGLIED, ABER ICH TRAGE{43}MEIN RÖCKCHEN NICHT IMMER.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00BF:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1FF,$0	; Run text script at offset 0x0279F8
					; 0xE1C1: PRINT	MSG 0x020F, MSGBOX CLEARED, END: "{47}ICH HABE DIE{43}GANZE WOCHE AUF EINE STUNDE{43}BEI MADAME	YARD GEWARTET!{4E}{47}WENN ICH ES{43}MIR DOCH NUR LEISTEN KÖNNTE,{43}ÖFTER HERZUKOMMEN...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_00C0_0,$1 ; Jump	to address 0x0264B6
					;
		dc.w $101		; Params 01, 01
		ScriptJump  CS_00C0_1,$3 ; Jump	to address 0x0264C2
					;
		dc.w $102		; Params 01, 02
		ScriptID    $20E,$5	; Run text script at offset 0x027A16
					; 0xE1CC: PRINT	MSG 0x021A, MSGBOX CLEARED, END: "{47}BIST DU BEIM{43}GROSSHANDEL GEWESEN?{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_00C0_8,$7 ; Jump	to address 0x02650A
					;
		dc.w $103		; Params 01, 03
		ScriptJump  CS_00C0_7,$9 ; Jump	to address 0x0264FE
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C0_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C7		; Bit 7	of flag	0x018
		ScriptID    $200,$1	; Flag clear: Run text script at offset	0x0279FA
					; 0xE1C2: PRINT	MSG 0x0210, MSGBOX CLEARED, END: "{47}...SEUFZ...{43}DER LADEN IST JETZT ZU. ABER{43}DU	KANNST SEHEN, DASS.....{4E}{47}WIE DU WEISST,{43}GIBT ES NOCH EINEN LADEN AUF{43}DER ANDEREN STRASSENSEITE.{4E}{47}WIR VERKAUFEN{43}DIESELBEN WAREN, DER ANDERE
					;                                                 {43}IST ABER VIEL BILLIGER. ICH{4E}{47}ÜBERLEGE,	OB{43}ICH MEINEN JOB WECHSLE, ABER{43}ICH WEISS	NICHT, WELCHES{4E}{47}GESCHÄFT AM{43}BESTEN LAUFEN WÜRDE.....{4E}{47}ICH MÖCHTE{43}MORGENS AM LIEBSTEN GAR NICHT{43}AUFSTEHEN{3F}{4E}{47}ICH BIN SO{43}EINE NIETE!.....{4A}"
		ScriptID    $201,$2	; Flag set:   Run text script at offset	0x0279FC
					; 0xE1C3: PRINT	MSG 0x0211, MSGBOX CLEARED, END: "{47}ICH MÖCHTE{43}EINEN NEUEN	LADEN AUFMACHEN...{43}SEUFZ...NUR WAS FÜR EINEN?...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C0_1:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $202,$0	; Run text script at offset 0x0279FE
					; 0xA1C4: PRINT	MSG 0x0212, END: "{47}NIELS, WIE GEHT{43}ES DIR? ICH DENKE IMMER NOCH{43}DARÜBER NACH,{4E}{47}NOCHMAL VON{43}VORNE ANZUFANGEN,{4E}{47}MEIN LEBEN{43}ZU ÄNDERN....UND ICH HABE MICH{43}ENDLICH DAZU DURCHGERUNGEN,{4E}{47}MEINEN	BERUF{43}ZU WECHSELN.{4E}{47}WIRST DU{43}MICH BERATEN?{44}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	CS_00C0_2
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $203,$0	; Run text script at offset 0x027A00
					; 0xE1C5: PRINT	MSG 0x0213, MSGBOX CLEARED, END: "{47}JA, ICH WEISS,{43}DASS DU	SEHR BESCHÄFTIGT BIST.{43}BESUCH MICH NOCHMAL,{4E}{47}WENN DU{43}NICHTS	BESSERES ZU TUN	HAST.{4A}"
; ---------------------------------------------------------------------------
		bra.s	CS_00C0_6
; ---------------------------------------------------------------------------

CS_00C0_2:				; CODE XREF: ROM:000264CAj
					; ROM:000264F6j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $204,$0	; Run text script at offset 0x027A02
					; 0xA1C6: PRINT	MSG 0x0214, END: "{47}WIE WÄR'S{43}MIT EINER APOTHEKE?{44}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	CS_00C0_3
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $207,$0	; Run text script at offset 0x027A08
					; 0x1553: SET BIT 3 OF FLAG 0x02A
					; 0xA1C9: PRINT	MSG 0x0217, END: "{47}DU STIMMST ZU?{43}TOLL! JETZT BIN	ICH WOHL{43}APOTHEKER!{4E}"
; ---------------------------------------------------------------------------
		bra.s	CS_00C0_5
; ---------------------------------------------------------------------------

CS_00C0_3:				; CODE XREF: ROM:000264DAj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $205,$0	; Run text script at offset 0x027A04
					; 0xA1C7: PRINT	MSG 0x0215, END: "{47}HMMM....GUT,{43}ODER EIN KRAMLADEN?{44}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	CS_00C0_4
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $209,$0	; Run text script at offset 0x027A0C
					; 0xA1CA: PRINT	MSG 0x0218, END: "{47}DU STIMMST ZU?{43}DANN ABGEMACHT!	ICH BIN	AB{43}JETZT KRÄMER!{4E}"
; ---------------------------------------------------------------------------
		bra.s	CS_00C0_5
; ---------------------------------------------------------------------------

CS_00C0_4:				; CODE XREF: ROM:000264EAj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $206,$0	; Run text script at offset 0x027A06
					; 0xA1C8: PRINT	MSG 0x0216, END: "{47}TJA, ICH HABE{43}NUR DIESE BEIDEN	MÖGLICH-{43}KEITEN. ALSO......{4E}{47}SUCH DIR EINE{43}AUS. ICH	WERDE DEINEN RAT{43}BEFOLGEN.{4E}{47}DANN FANGEN{43}WIR	NOCHMAL	VON VORNE AN.{4E}"
; ---------------------------------------------------------------------------
		bra.s	CS_00C0_2
; ---------------------------------------------------------------------------

CS_00C0_5:				; CODE XREF: ROM:000264E0j
					; ROM:000264F0j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $20A,$0	; Run text script at offset 0x027A0E
					; 0x1552: SET BIT 2 OF FLAG 0x02A
					; 0x81CB: PRINT	MSG 0x0219: "{47}ACH, KÖNNTEST{43}DU MIR NOCH EINEN GEFALLEN TUN?{43}ICH MÖCHTE	GERNE, DASS DU ZUM{4E}{47}GROSSHANDEL IM{43}WARENHAUS VOM HAFEN	VON{43}MERKATOR	GEHST. ER MACHT	AUF,{4E}{47}WENN DAS SCHIFF{43}VOM FESTLAND HIER ANLEGT.{43}BITTE GEH ZUM GROSSHANDEL{4E}{47}UND HOL DIE{43}WAREN FÜR MICH. ICH	BLEIBE HIER{43}UND MACHE ALLES KLAR.{4E}{47}NIMM DIES HIER{43}MIT. ES IST EINE KARTE{43}DER KÄUFER- GILDE.{4E}"
					; 0x0019: LOAD 0x0019 INTO 0xFF1196 (KÄUFER{55}KARTE)
					; 0x77E8: RECEIVE ITEM [0xFF1196], MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

CS_00C0_6:				; CODE XREF: ROM:000264D0j
		rts
; ---------------------------------------------------------------------------

CS_00C0_7:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DD		; Bit 5	of flag	0x01B
		ScriptID    $20F,$1	; Flag clear: Run text script at offset	0x027A18
					; 0xE1CD: PRINT	MSG 0x021B, MSGBOX CLEARED, END: "{47}ICH HABE DIE{43}WAREN BEKOMMEN, UND ES LÄUFT{43}SCHON GANZ GUT!{4E}{47}ICH BIN RICHTIG{43}GLÜCKLICH MIT MEINEM NEUEN{43}LADEN! DAS IST EIN WENDEPUNKT{4E}{47}IN MEINEM LEBEN!{43}DAS HABE	ICH ALLES DIR{43}ZU VERDANKEN, NIELS!{4E}{47}ALS DANK BIETE{43}ICH DIR ALLES ZU{43}NIEDRIGSTPREISEN AN!{4E}{47}SCHAU BALD{43}WIEDER VORBEI!{4A}"
		ScriptID    $210,$2	; Flag set:   Run text script at offset	0x027A1A
					; 0xE1CE: PRINT	MSG 0x021C, MSGBOX CLEARED, END: "{47}WIR HABEN	EIN{43}GROSSES ANGEBOT AN{43}UNGEWÖHNLICHEN DINGEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C0_8:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $152		; Bit 2	of flag	0x02A
		ScriptID    $211,$1	; Flag set:   Run text script at offset	0x027A1C
					; 0xE1CF: PRINT	MSG 0x021D, MSGBOX CLEARED, END: "{47}HATTE DER	GROSS-{43}MARKT	SCHON ZU? IST SCHON GUT.{43}ER MACHT JA	WIEDER AUF.{4E}{47}ICH BLEIBE ERST{43}EINMAL HIER UND ORGANISIERE{43}ALLES, DASS ICH NÄCHSTEN MONAT{4E}{47}SELBER GEHEN{43}KANN.{4A}"
		ScriptJump  CS_00C0_0,$2 ; Flag	clear: Jump to address 0x0364B6
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $212,$1	; Run text script at offset 0x027A1E
					; 0xE1D0: PRINT	MSG 0x021E, MSGBOX CLEARED, END: "{47}PAPA HÄTTE SICH{43}ERST IN DER STADT UMSEHEN{43}SOLLEN, BEVOR{4E}{47}ER EINEN{43}LADEN AUFMACHT...{4A}"
					;
		dc.w $101		; Params 01, 01
		ScriptID    $213,$3	; Run text script at offset 0x027A20
					; 0xE1D1: PRINT	MSG 0x021F, MSGBOX CLEARED, END: "{47}MEIN VATER DENKT{43}DARÜBER NACH,	SEINEN{43}BERUF	ZU WECHSELN.{4A}"
					;
		dc.w $102		; Params 01, 02
		ScriptJump  CS_00C1_0,$5 ; Jump	to address 0x026530
					;
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_00C1_1,$7 ; Jump	to address 0x02653C
					;
		dc.w $103		; Params 01, 03
		ScriptID    $216,$9	; Run text script at offset 0x027A26
					; 0xE1D4: PRINT	MSG 0x0222, MSGBOX CLEARED, END: "{47}JETZT GEHT ES{43}PAPA WIEDER BESSER, UND ICH{43}SORGE DAFÜR, DASS	ES SO BLEIBT!{4E}{47}EINES TAGES{43} WERDEN WIR	EINE GANZE{43}LADENKETTE HABEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C1_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $153		; Bit 3	of flag	0x02A
		ScriptID    $214,$1	; Flag set:   Run text script at offset	0x027A22
					; 0xE1D2: PRINT	MSG 0x0220, MSGBOX CLEARED, END: "{47}AB JETZT BIN ICH{43}DER SOHN DES APOTHEKERS! IRRE!{4A}"
		ScriptID    $215,$2	; Flag clear: Run text script at offset	0x027A24
					; 0xE1D3: PRINT	MSG 0x0221, MSGBOX CLEARED, END: "{47}AB JETZT BIN ICH{43}DER SOHN DES KRÄMERS!	IRRE!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C1_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $152		; Bit 2	of flag	0x02A
		ScriptID    $216,$1	; Flag set:   Run text script at offset	0x027A26
					; 0xE1D4: PRINT	MSG 0x0222, MSGBOX CLEARED, END: "{47}JETZT GEHT ES{43}PAPA WIEDER BESSER, UND ICH{43}SORGE DAFÜR, DASS	ES SO BLEIBT!{4E}{47}EINES TAGES{43} WERDEN WIR	EINE GANZE{43}LADENKETTE HABEN!{4A}"
		ScriptID    $212,$2	; Flag clear: Run text script at offset	0x027A1E
					; 0xE1D0: PRINT	MSG 0x021E, MSGBOX CLEARED, END: "{47}PAPA HÄTTE SICH{43}ERST IN DER STADT UMSEHEN{43}SOLLEN, BEVOR{4E}{47}ER EINEN{43}LADEN AUFMACHT...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0018:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $E4		; Bit 4	of flag	0x01C
		ScriptID    $4B6,$1	; Flag set:   Run text script at offset	0x027F66
					; 0x1BF6: LOAD SPECIAL CHARACTER FAHL (0x0E)
					; 0xE3D5: PRINT	MSG 0x0423, MSGBOX CLEARED, END: "{47}WAHNSINN!{43}SO EIN KLEINER KERL...JETZT{43}BRAUCHE ICH ERST EINMAL URLAUB!{4A}"
		ScriptID    $217,$2	; Flag clear: Run text script at offset	0x027A28
					; 0x7C30: LOAD CUSTOM ACTION 0x30 (0x1000000BF CSA_0030), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C2:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $219,$1	; Run text script at offset 0x027A2C
					; 0xE1D6: PRINT	MSG 0x0224, MSGBOX CLEARED, END: "{47}WIE PEINLICH!{43}MEIN SOHN GEHT FAST JEDEN TAG{43}ZU MADAME... LARD ODER SO!{4E}{47}ICH KANN IHN{43}EINFACH NICHT	VERSTEHEN!{43}IST ES WIRKLICH SO TOLL DA?{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $21A,$3	; Run text script at offset 0x027A2E
					; 0xE1D7: PRINT	MSG 0x0225, MSGBOX CLEARED, END: "{47}MIR LEBT IN{43}DIESEM ALTEN TURM,	ABER ICH{43}HABE GEHÖRT, ER WAR	LANGE VOR{4E}{47}DEM HERZOG IN{43}MERKATOR. ANSCHEINEND	HAT IHN{43}DER HERZOG WEGEN EINES{4E}{47}GRAUSIGEN{43}VERBRECHENS{43}DER STADT VERWIESEN...{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $21B,$5	; Run text script at offset 0x027A30
					; 0xE1D8: PRINT	MSG 0x0226, MSGBOX CLEARED, END: "{47}MIR LEBT IN{43}DIESEM ALTEN TURM,	ABER ICH{43}HABE GEHÖRT, ER WAR	LANGE VOR{4E}{47}DEM HERZOG IN{43}MERKATOR. ANSCHEINEND	HAT IHN{43}DER HERZOG WEGEN EINES{4E}{47}GRAUSIGEN{43}VERBRECHENS{43}DER STADT VERWIESEN...{4E}{47}ICH WEISS ALLER-{43}DINGS NICHT, OB DAS WAHR	IST.{43}EIN FREUND HAT ES MIR ERZÄHLT.{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $21C,$7	; Run text script at offset 0x027A32
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE1D9: PRINT	MSG 0x0227, MSGBOX CLEARED, END: "{47}DER {4B}{43}IST AUS WERTVOLLEM ERZ.{43}ES	KOMMT NUR IN INNERN{4E}{47}DES GRÜNEN{43}LABYRINTHS VOR.{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $21E,$9	; Run text script at offset 0x027A36
					; 0xE1DA: PRINT	MSG 0x0228, MSGBOX CLEARED, END: "{47}ICH HABE SCHON{43}LANGE NICHTS MEHR VON MEINEN{43}VERWANDTEN AUS VERLA GEHÖRT...{4A}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $21F,$B	; Run text script at offset 0x027A38
					; 0xE1DB: PRINT	MSG 0x0229, MSGBOX CLEARED, END: "{47}ICH HABE GEHÖRT,{43}DASS HERZOG MERKATOR AUCH NACH{43}VERLA NUR ÄRGER GEBRACHT HAT.{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $220,$D	; Run text script at offset 0x027A3A
					; 0xE1DC: PRINT	MSG 0x022A, MSGBOX CLEARED, END: "{47}WENN GENERAL{43}ARTHUR GETÖTET WORDEN WÄRE,{43}WÄRE MERKATOR JETZT{4E}{47}EINE{43}GEISTERSTADT!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C3:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $221,$1	; Run text script at offset 0x027A3C
					; 0xE1DD: PRINT	MSG 0x022B, MSGBOX CLEARED, END: "{47}DA BIN ICH{43}ANDERER MEINUNG. ICH FINDE ES{43}NETT BEI MADAME YARD.{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $222,$3	; Run text script at offset 0x027A3E
					; 0xE1DE: PRINT	MSG 0x022C, MSGBOX CLEARED, END: "{47}ES IST WEGEN{43}DER SPERRE VOR DER TÜR UNMÖG-{43}LICH, IN	MIRS TURM ZU KOMMEN...{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $223,$5	; Run text script at offset 0x027A40
					; 0xE1DF: PRINT	MSG 0x022D, MSGBOX CLEARED, END: "{47}...ACH,{43}DU BIST'S...{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $224,$7	; Run text script at offset 0x027A42
					; 0xE1E0: PRINT	MSG 0x022E, MSGBOX CLEARED, END: "{47}DAS GRÜNE{43}LABYRINTH IST NÖRDLICH VON DER{43}BURG. JEDES JAHR VERSCHWINDEN{4E}{47}VIELE	TOURISTEN{43}DARIN, UND	DESHALB	HAT DER{43}HERZOG DAS GRÜNE LABYRINTH{4E}{4A}: GANZ{43}GESCHLOSSEN.{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $225,$9	; Run text script at offset 0x027A44
					; 0xE1E1: PRINT	MSG 0x022F, MSGBOX CLEARED, END: "{47}HERZOG MERKATOR{43}IST GANZ VERRÜCKT NACH	DIESEM{43}SCHATZ. IST ER WIRKLICH{4E}{47}SO GROSS?{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $226,$B	; Run text script at offset 0x027A46
					; 0xE1E2: PRINT	MSG 0x0230, MSGBOX CLEARED, END: "{47}ICH BIN GANZ{43}ZUFRIEDEN	MIT DER	VERWALTUNG{43}VON GENERAL ARTHUR.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C4:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $227,$1	; Run text script at offset 0x027A48
					; 0xE1E3: PRINT	MSG 0x0231, MSGBOX CLEARED, END: "{47}ICH HABE EINE{43}SCHÖNHEIT DIE STRASSE ENTLANG{43}GEHEN SEHEN. SIE WURDE{4E}{47}BEWACHT{43}VON...	RATE MAL!{43}MONSTERN!{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $228,$3	; Run text script at offset 0x027A4A
					; 0xE1E4: PRINT	MSG 0x0232, MSGBOX CLEARED, END: "{47}WILLST DU	DEN{43}ZAUBERER	IM TURM	BESIEGEN?{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $229,$5	; Run text script at offset 0x027A4C
					; 0xE1E5: PRINT	MSG 0x0233, MSGBOX CLEARED, END: "{47}WAHNSINN!{43}DU BIST LEBENDIG ZURÜCK-{43}GEKOMMEN!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $22A,$7	; Run text script at offset 0x027A4E
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE1E6: PRINT	MSG 0x0234, MSGBOX CLEARED, END: "{47}ABER DER{43}LEUCHTTURM IST OHNE DEN{43}{4B} NUTZLOS!{4E}{47}WER WÜRDE DENN{43}SO ETWAS MACHEN?{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $22C,$9	; Run text script at offset 0x027A52
					; 0xE1E7: PRINT	MSG 0x0235, MSGBOX CLEARED, END: "{47}WENN DER TUNNEL{43}ZWISCHEN VERLA	UND MERKATOR{43}WIEDER GEÖFFNET	WÜRDE, WÄRE{4E}{47}VERLA NUR NOCH{43}EINEN KATZENSPRUNG	ENTFERNT.{43}ABER KÜRZLICH HAT EIN ERDBEBEN{4E}{47}DEN TUNNEL{43}ZUGESCHÜTTET. JETZT KOMMT MAN{43}NUR NOCH ÜBERS MEER NACH VERLA.{4A}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $22D,$B	; Run text script at offset 0x027A54
					; 0xE1E8: PRINT	MSG 0x0236, MSGBOX CLEARED, END: "{47}EINER MEINER{43}VERWANDTEN HAT EIN GESCHÄFT{43}IN	VERLA.{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $22E,$D	; Run text script at offset 0x027A56
					; 0xE1E9: PRINT	MSG 0x0237, MSGBOX CLEARED, END: "{47}GENERAL ARTHUR{43}HAT MIT	DEM HERZOG BIS ZUM{43}LETZTEN GEKÄMPFT.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0019:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $22F,$1	; Run text script at offset 0x027A58
					; 0xE1EA: PRINT	MSG 0x0238, MSGBOX CLEARED, END: "{47}MÖCHTEST DU EIN{43}FRUCHTGETRÄNK?	WIE WÄR'S MIT{43}DAHL?{4E}{47}ES IST DAS{43}GETRÄNK DER NEUEN GENERATION!{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $230,$3	; Run text script at offset 0x027A5A
					; 0xE1EB: PRINT	MSG 0x0239, MSGBOX CLEARED, END: "{47}HERZOG MERKATOR{43}WIRBT JETZT SÖLDNER AN, UM{43}EINEN ANGRIFF AUF MIR{4E}{47}VORZUBEREITEN.{43}SIE FEIERN JETZT SCHON{43}IHREN SIEG.{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $231,$5	; Run text script at offset 0x027A5C
					; 0xE1EC: PRINT	MSG 0x023A, MSGBOX CLEARED, END: "{47}NIELS!{43}STIMMT ES, DASS	DU MIR{43}BESIEGT HAST?{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $232,$7	; Run text script at offset 0x027A5E
					; 0xE1ED: PRINT	MSG 0x023B, MSGBOX CLEARED, END: "{47}HERZOG MERKATOR{43}HAT DIE STADT IM STICH	GE-{43}LASSEN! DAS HÄTTEN WIR NICHT{4E}{47}GEDACHT.{43}WAS MACHEN WIR JETZT?{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  CS_0019_0,$9 ; Jump	to address 0x0265D0
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0019_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $14A		; Bit 2	of flag	0x029
		ScriptID    $77B,$1	; Flag set:   Run text script at offset	0x0284F0
					; 0x1819: LOAD CHARACTER SCRIPT	BESITZER (0x0019)
					; 0xE540: PRINT	MSG 0x058E, MSGBOX CLEARED, END: "{47}TUT MIR LEID...{43}SIEHT SO AUS, ALS OB DA NICHTS{43}MEHR	'RAUSKOMMT! HA HA HA!{4A}"
		ScriptID    $233,$2	; Flag clear: Run text script at offset	0x027A60
					; 0xE1EE: PRINT	MSG 0x023C, MSGBOX CLEARED, END: "{47}ICH HABE UM-{43}GERÄUMT. DU KANNST JETZT VON{43}OBEN AUS DEM BETT	BESTELLEN.{4E}{47}GEH MAL NACH{43}OBEN UND BESTELL WAS.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_001A_0,$1 ; Jump	to address 0x0265EA
					;
		dc.w $14		; Params 00, 14
		ScriptID    $237,$3	; Run text script at offset 0x027A68
					; 0xE1F2: PRINT	MSG 0x0240, MSGBOX CLEARED, END: "{47}ICH HABE MICH{43}UNWOHL GEFÜHLT UND SO BIN ICH{43}HIERHER	GEKOMMEN.  PRINZESSIN{4E}{47}LARA? TJA,	SIE{43}IST...ETWAS GANZ	BESONDERES!{43}EIGENTLICH IST SIE SCHWIERIG.{4E}{47}VIELLEICHT HAT{43}IHRE UMTRIEBIGKEIT DEN HERZOG{43}SO NERVÖS GEMACHT,{4E}{47}DASS ER SIE{43}WIEDER NACH HAUSE GESCHICKT{43}HAT.....{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001A_0:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $234,$0	; Run text script at offset 0x027A62
					; 0xA1EF: PRINT	MSG 0x023D, END: "{47}WO IST SIE BLOSS?{43}SEUFZ!...WO IST SIE DENN JETZT{43}...OH! BIST DU EIN	TOURIST?{4E}{47}MÖCHTEST DU{43}MEINE GESCHICHTE	HÖREN?{44}"
; ---------------------------------------------------------------------------

CS_001A_1:				; CODE XREF: ROM:000265FEj
		bsr.w	GetYesNoAnswer
		bcc.s	CS_001A_2
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $235,$0	; Run text script at offset 0x027A64
					; 0xE1F0: PRINT	MSG 0x023E, MSGBOX CLEARED, END: "{47}ES IST ÜBER-{43}FLÜSSIG ZU SAGEN,	DASS ICH{43}LUDWIG, DER	WELTBERÜHMTE{4E}{47}KOMPONIST VOM{43}FESTLAND BIN. PRINZESSIN LARA{43}KAM HER, UM BEI MIR ZU LERNEN,{4E}{47}ABER DANN IST{43}SIE EINFACH VERSCHWUNDEN!!{43}ICH FÜRCHTE,	DER UNTERRICHT{4E}{47}WAR IHR NICHT{43}GUT GENUG. SIE HÄTTE SICH{43}WENIGSTENS VERABSCHIEDEN{4E}{47}KÖNNEN...{43}SEUFZ!	...SIE WAR SO HÜBSCH...{4A}"
; ---------------------------------------------------------------------------
		bra.s	CS_001A_3
; ---------------------------------------------------------------------------

CS_001A_2:				; CODE XREF: ROM:000265F2j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $236,$0	; Run text script at offset 0x027A66
					; 0xA1F1: PRINT	MSG 0x023F, END: "{47}OH,{43}BITTE HÖR MIR ZU....{44}"
; ---------------------------------------------------------------------------
		bra.s	CS_001A_1
; ---------------------------------------------------------------------------

CS_001A_3:				; CODE XREF: ROM:000265F8j
		rts
; ---------------------------------------------------------------------------

CS_00C5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $238,$1	; Run text script at offset 0x027A6A
					; 0xE1F3: PRINT	MSG 0x0241, MSGBOX CLEARED, END: "{47}DIESER LUDWIG{43}IST SO EIN TROTTEL! ICH GLAUBE,{43}ER IST GANZ DURCHEINANDER{4E}{47}WEGEN{43}DIESER PRINZESSIN....{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $239,$3	; Run text script at offset 0x027A6C
					; 0xE1F4: PRINT	MSG 0x0242, MSGBOX CLEARED, END: "{47}LUDWIG?{43}NACHDEM ER VOM	SCHLOSS	ZURÜCK-{43}GEKOMMEN IST, HAT ER	SECHS{4E}{47}DAHLS WEG-{43}GEPUTZT. SECHS!  DANN HAT ER{43}SICH	SO DANEBENBENOMMEN,{4E}{47}DASS	ICH IHN{43}'RAUSWERFEN MUSSTE.{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $23A,$5	; Run text script at offset 0x027A6E
					; 0xE1F5: PRINT	MSG 0x0243, MSGBOX CLEARED, END: "{47}DIESER LUDWIG{43}IST SO SENSIBEL!	ER SAH GANZ{43}GESCHOCKT AUS, ALS ICH IHN{4E}{47}GEBETEN HABE,{43}ZU GEHEN.{4E}{47}JETZT IST ER{43}VERSCHWUNDEN, WAHRSCHEINLICH,{43}UM SICH AUSZUKURIEREN.....{4E}{47}DIESE KÜNSTLER{43}SIND SCHON NICHT LEICHT{43}ZU VERSTEHEN.{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $23B,$7	; Run text script at offset 0x027A70
					; 0xE1F6: PRINT	MSG 0x0244, MSGBOX CLEARED, END: "{47}GENERAL ARTHUR{43}LEBT! HURRA! HURRA!{43}DAS MUSS	GEFEIERT WERDEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $23C,$1	; Run text script at offset 0x027A72
					; 0xE1F7: PRINT	MSG 0x0245, MSGBOX CLEARED, END: "{47}HEISSA! HUSSA!{43}WIR WOLLEN NIEDRIGERE STEUERN!{43}PASS AUF MIR,	ICH KRIEG' DICH!{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $23D,$3	; Run text script at offset 0x027A74
					; 0xE1F8: PRINT	MSG 0x0246, MSGBOX CLEARED, END: "{47}TOGA! TOGA!{43}TOGA! HE, DU! OBER! NOCH EINE{43}LAGE DAHL!{4E}{47}SIND DIE STEUERN{43}SCHON GESENKT WORDEN? HABEN{43}SIE DEN TYP AUS MIR BEKOMMEN?{4E}{47}NA, WAS	SOLL'S!{43}LASST UNS FEIERN!!{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $23E,$5	; Run text script at offset 0x027A76
					; 0xE1F9: PRINT	MSG 0x0247, MSGBOX CLEARED, END: "{47}BIST DU SCHON{43}IM KASINO GEWESEN!?{43}TOTAL AUFREGEND!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $23F,$1	; Run text script at offset 0x027A78
					; 0xE1FA: PRINT	MSG 0x0248, MSGBOX CLEARED, END: "{47}DIE MÄNNER HIER{43}IN DER	STADT SCHEINEN SICH{43}HALS ÜBER KOPF IN IRGENDEIN{4E}{47}NEUES	MÄDCHEN{43}VOM FESTLAND	VERLIEBT{43}ZU HABEN...{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $240,$3	; Run text script at offset 0x027A7A
					; 0xE1FB: PRINT	MSG 0x0249, MSGBOX CLEARED, END: "{47}WILLKOMMEN{43}DAHEIM, HELD!...ABER...WARUM{43}SO BESORGT?	STIMMT WAS NICHT?{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $241,$5	; Run text script at offset 0x027A7C
					; 0xE1FC: PRINT	MSG 0x024A, MSGBOX CLEARED, END: "{47}IST DAS GERÜCHT{43}ÜBER DEN HERZOG WAHR? WENN JA,{43}DANN	MUSS ER	WIRKLICH EIN{4E}{47}NIEDERTRÄCHTIGER{43}MENSCH SEIN! ER	WAR IMMER{43}FREUNDLICH	UND HAT	VORGEGEBEN,{4E}{47}ALLES FÜR DIE{43}STADT ZU TUN.{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $242,$7	; Run text script at offset 0x027A7E
					; 0xE1FD: PRINT	MSG 0x024B, MSGBOX CLEARED, END: "{47}GENERAL ARTHUR{43}UND SEIN NEUES KASINO SIND{43}ZUR ZEIT DAS STADTGESPRÄCH.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $243,$1	; Run text script at offset 0x027A80
					; 0xE1FE: PRINT	MSG 0x024C, MSGBOX CLEARED, END: "{47}GLAUB MIR, MEIN{43}KIND! NIEMALS DARFST DU DEIN{43}HERZ EINEM MÄDCHEN GEBEN!!{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $244,$3	; Run text script at offset 0x027A82
					; 0xE1FF: PRINT	MSG 0x024D, MSGBOX CLEARED, END: "{47}AH, PRINZESS{43} ...SSSSSSSS....{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  CS_00C8_0,$5 ; Jump	to address 0x026652
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C8_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $14A		; Bit 2	of flag	0x029
		ScriptID    $779,$1	; Flag set:   Run text script at offset	0x0284EC
					; 0x18C8: LOAD CHARACTER SCRIPT	* (0x00C8)
					; 0xE53F: PRINT	MSG 0x058D, MSGBOX CLEARED, END: "{47}NOCH EIN EKENOL{43}PUNSCH!{43}{45}{45}...OH...{43}IST NICHT MEHR DRIN...{4A}"
		ScriptID    $245,$2	; Flag clear: Run text script at offset	0x027A84
					; 0x7D2B: LOAD CUSTOM ACTION 0x12B (0x1000004AB	CSA_012B), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_00C9_0,$1 ; Jump	to address 0x02666C
					;
		dc.w $14		; Params 00, 14
		ScriptID    $248,$3	; Run text script at offset 0x027A8A
					; 0xE202: PRINT	MSG 0x0250, MSGBOX CLEARED, END: "{47}SSSSSS...{43}JULIE.....{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C9_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $28		; Bit 0	of flag	0x005
		ScriptID    $247,$1	; Flag set:   Run text script at offset	0x027A88
					; 0xE201: PRINT	MSG 0x024F, MSGBOX CLEARED, END: "{47}ICH HABE NICHT{43}NUR MAGENSCHMERZEN, SONDERN{43}ICH GLAUBE, ICH HABE MIR	AUCH{43}{47}DEN	KNÖCHEL{43}VERSTAUCHT.....!{4A}"
		ScriptID    $246,$2	; Flag clear: Run text script at offset	0x027A86
					; 0xE200: PRINT	MSG 0x024E, MSGBOX CLEARED, END: "{47}ICH...HABE...{43}MAGENSCHMERZEN......{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00CA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $249,$1	; Run text script at offset 0x027A8C
					; 0xE203: PRINT	MSG 0x0251, MSGBOX CLEARED, END: "{47}HERZOG MERKATOR{43}KOMMT URSPRÜNGLICH VOM{43}FESTLAND UND	HAT DESWEGEN OFT{4E}{47}GÄSTE VON DORT.{43}ERST	KÜRZLICH KAM EIN ADLIGES{43}MÄDCHEN NAMENS LARA,{4E}{47}UM KLAVIER-{43}UNTERRICHT ZU NEHMEN. ICH HABE{43}SIE LÄNGER NICHT GESEHEN{3F}{4E}{47}VIELLEICHT	IST{43}SIE AUCH	WIEDER{43}NACH HAUSE GEFAHREN...{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $24A,$3	; Run text script at offset 0x027A8E
					; 0xE204: PRINT	MSG 0x0252, MSGBOX CLEARED, END: "{47}ICH HABE SCHON{43}VON DIR	GEHÖRT!	DU BIST	EINER{43}VON DIESEN SÖLDNERN, DIE LOS-{4E}{47}ZIEHEN SOLLEN,{43}UM MIR ZU BESIEGEN UND WIEDER{43}FRIEDEN ZU BRINGEN.{4E}{47}ENTTÄUSCHT UNS{43}NICHT! LEGT DIESEN ZAUBERER{43}ENDLICH UM!{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $24B,$5	; Run text script at offset 0x027A90
					; 0xE205: PRINT	MSG 0x0253, MSGBOX CLEARED, END: "{47}HE, DU HELD!{43}WIE HAT SICH'S GEGEN MIR{43}GEKÄMPFT? ALLES IN ORDNUNG?{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $24C,$7	; Run text script at offset 0x027A92
					; 0xE206: PRINT	MSG 0x0254, MSGBOX CLEARED, END: "{47}WENN ALL DIE{43}GERÜCHTE ÜBER DEN	HERZOG{43}WAHR SIND, DANN WAR ES EINE{4E}{47}LÜGE, DASS	MIR{43}IHN GEZWUNGEN HABEN SOLL, DIE{43}STEUERN	ZU ERHÖHEN.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $24D,$1	; Run text script at offset 0x027A94
					; 0xE207: PRINT	MSG 0x0255, MSGBOX CLEARED, END: "{47}UNSERE FAMILIE{43}DIENT SEIT GENERATIONEN	IN DER{43}BURG.	MEIN SOHN IST KOCH UND{4E}{47}MEINE TOCHTER{43}DIENSTMÄDCHEN. SIE ARBEITEN{43}FÜR HERZOG MERKATOR.{4E}{47}DA BIST DU{43}NEIDISCH, WAS?{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $24E,$3	; Run text script at offset 0x027A96
					; 0xE208: PRINT	MSG 0x0256, MSGBOX CLEARED, END: "{47}MEIN SOHN	HAT{43}MIR ERZÄHLT, DASS DU IN DEN{43}TURM WILLST. MAN SAGT, DER{4E}{47}TURM SEI VOLL{43}VON ALLEN MÖGLICHEN FALLEN.{43}SEI BITTE VORSICHTIG!....{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $24F,$5	; Run text script at offset 0x027A98
					; 0xE209: PRINT	MSG 0x0257, MSGBOX CLEARED, END: "{47}OH, NIELS!{43}DU BIST VOM	TURM ZURÜCK!{43}ERSTAUNLICH!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $250,$7	; Run text script at offset 0x027A9A
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE20A: PRINT	MSG 0x0258, MSGBOX CLEARED, END: "{47}WAS FÜR'N DEPP!{43}IST DIR BEWUSST, WIE WICHTIG{43}DER {4B} IST?{4E}{47}GEH INS GRÜNE{43}LABYRINTH UND FINDE DEN{43}{4B} ALLEIN!{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $252,$9	; Run text script at offset 0x027A9E
					; 0xE20B: PRINT	MSG 0x0259, MSGBOX CLEARED, END: "{47}ENDLICH HAT ER{43}DAS LICHT GESEHEN! WIR BETEN{43}SEIT SECHS STUNDEN FÜR IHN!{4A}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptJump  CS_00CB_0,$B ; Jump	to address 0x0266B0
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $256,$D	; Run text script at offset 0x027AA6
					; 0xE20F: PRINT	MSG 0x025D, MSGBOX CLEARED, END: "{47}DIESER ARTHUR{43}GIBT EINEN FÄHIGEN STAATSMANN{43}AB! ER HAT DAS KASINO{4E}{47}ERÖFFNET,{43}UM SO	DIE STEUERN ZU SENKEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CB_0:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $253,$0	; Prompt:	Run text script	at offset 0x027AA0
					; 0xA20C: PRINT	MSG 0x025A, END: "{47}HAST DU SCHON{43}VON GENERAL ARTHUR GEHÖRT?{44}"
		ScriptID    $255,$1	; Answer 'yes': Run text script at offset 0x027AA4
					; 0xE20E: PRINT	MSG 0x025C, MSGBOX CLEARED, END: "{47}ER WURDE SCHWER{43}VERLETZT...JETZT MUSS ER ERST{43}EINMAL WIEDER	GESUND WERDEN.{4E}{47}ICH DENKE,{43}GENERAL ARTHUR HÄTTE ES{43}VERDIENT, MERKATORS NÄCHSTER{4E}{47}HERRSCHER{43}ZU WERDEN.{4A}"
		ScriptID    $254,$2	; Answer 'no':  Run text script at offset 0x027AA2
					; 0x820D: PRINT	MSG 0x025B: "{47}ER BEWACHT JETZT{43}DAS SCHLOSS. ER MACHT SICH{43}ABER	IMMER NOCH SORGEN UM{4E}{47}DES	HERZOGS{43}VERSCHWÖRUNG.{4E}"
					; 0xE20E: PRINT	MSG 0x025C, MSGBOX CLEARED, END: "{47}ER WURDE SCHWER{43}VERLETZT...JETZT MUSS ER ERST{43}EINMAL WIEDER	GESUND WERDEN.{4E}{47}ICH DENKE,{43}GENERAL ARTHUR HÄTTE ES{43}VERDIENT, MERKATORS NÄCHSTER{4E}{47}HERRSCHER{43}ZU WERDEN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00CC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $257,$1	; Run text script at offset 0x027AA8
					; 0xE210: PRINT	MSG 0x025E, MSGBOX CLEARED, END: "{47}HI, HI, HI...GEH{43}LIEBER WIEDER...DIESER ORT IST{43}NICHTS FÜR TOURISTEN...HI, HI..{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptJump  CS_00CC_0,$3 ; Jump	to address 0x0266CE
					;
		dc.w $15		; Params 00, 15
		ScriptID    $25A,$5	; Run text script at offset 0x027AAE
					; 0xE213: PRINT	MSG 0x0261, MSGBOX CLEARED, END: "{47}HI, HI, WAR DIR{43}EINE GUTE LEHRE, WAS?{43}HI, HI...{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CC_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $A2		; Bit 2	of flag	0x014
		ScriptID    $259,$1	; Flag set:   Run text script at offset	0x027AAC
					; 0xE212: PRINT	MSG 0x0260, MSGBOX CLEARED, END: "{47}IN DER WELT HIER{43}OBEN UND DA UNTEN...HI, HI...{43}MUSST DU DEINEN KOPF	BENUTZEN.{4A}"
		ScriptID    $258,$2	; Flag clear: Run text script at offset	0x027AAA
					; 0xE211: PRINT	MSG 0x025F, MSGBOX CLEARED, END: "{47}AH, WILLKOMMEN{43}...IM MERKATOR CHAMPION	MOTEL!{43}HELDEN GEHEN HINEIN, ABER{4E}{47}NICHT WIEDER{43}HERAUS!.....{4E}{47}NUN JA, HI HI..{43}...DA	IST ES,	DAS UNTERIRDISCHE{43}GRAB. WORAUF WARTEST DU NOCH?{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001B:
		cmpi.w	#01600,(g_AdditionalFlags+$1C).l
		blt.s	CS_001B_0
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w 8			; Bit 0	of flag	0x001
		ScriptID    $4CA,$1	; Flag set:   Run text script at offset	0x027F8E
					; 0xE3E1: PRINT	MSG 0x042F, MSGBOX CLEARED, END: "{47}BITTE! GEH{43}WIEDER...KOMM NICHT	NOCH MAL!{43}ICH FLEHE DICH AN...{4A}"
		ScriptID    $4C8,$2	; Flag clear: Run text script at offset	0x027F8A
					; 0x1408: SET BIT 0 OF FLAG 0x001
					; 0xE3E0: PRINT	MSG 0x042E, MSGBOX CLEARED, END: "{47}NEIN-NEIN-NEIN!{43}BITTE...RAUS HIER! DU BIST DOCH{43}SO EIN PROFI-SPIELER, ODER?{4A}"
; ---------------------------------------------------------------------------
		bra.s	CS_001B_1
; ---------------------------------------------------------------------------

CS_001B_0:				; CODE XREF: ROM:000266E2j
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w 8			; Bit 0	of flag	0x001
		ScriptID    $25C,$1	; Flag set:   Run text script at offset	0x027AB2
					; 0xE214: PRINT	MSG 0x0262, MSGBOX CLEARED, END: "{47}STELL DICH VOR{43}DEN TRESEN, HÜPF UND WIRF.{4E}{47}IST VIELLEICHT{43}EIN	BISSCHEN SCHWER, ABER DU{43}WIRST SCHON	ZURECHTKOMMEN.{4A}"
		ScriptID    $25B,$2	; Flag clear: Run text script at offset	0x027AB0
					; 0x7C34: LOAD CUSTOM ACTION 0x34 (0x1000000CF CSA_0034), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

CS_001B_1:				; CODE XREF: ROM:000266EEj
		rts
; ---------------------------------------------------------------------------

CS_00CD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $25D,$1	; Run text script at offset 0x027AB4
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0xE215: PRINT	MSG 0x0263, MSGBOX CLEARED, END: "{47}DA-TA-DI-DA,{43}DI-DO WACHSEN!  BALD WIRST DU{43}ERNTEN, DA- TI-DO.....{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $25F,$3	; Run text script at offset 0x027AB8
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0xE216: PRINT	MSG 0x0264, MSGBOX CLEARED, END: "{47}MAMA SINGT{43}GERNE!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $261,$5	; Run text script at offset 0x027ABC
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0xE217: PRINT	MSG 0x0265, MSGBOX CLEARED, END: "{47}ANKER LICHTEN,{43}LICHTEN, JA-HA,	WELLEN BRECHEN,{43}LICHTEN JA-HA. HEY-HEY!{4E}{47}ICH WERDE MAMA{43}EIN	NEUES LIED BEIBRINGEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $263,$1	; Run text script at offset 0x027AC0
					; 0xE218: PRINT	MSG 0x0266, MSGBOX CLEARED, END: "{47}ICH WEISS	NICHT,{43}WER IHM DAS BEIGEBRACHT HAT,{43}ABER MEIN SOHN SINGT GERNE{4E}{47}SELTSAME{43}LIEDER...{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $264,$3	; Run text script at offset 0x027AC2
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0xE219: PRINT	MSG 0x0267, MSGBOX CLEARED, END: "{47}BA-PA-DI-DA,{43}DA-DEI WACHSEN! BALD WIRST DU{43}ERNTEN BA- PA-DA, DAS IST GUT!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CF:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $266,$1	; Run text script at offset 0x027AC6
					; 0xE21A: PRINT	MSG 0x0268, MSGBOX CLEARED, END: "{47}ICH BIN WÄRTER{43}IM SCHLOSS, HABE ABER HEUTE{43}KEINEN DIENST! ICH GEHE{4E}{47}ZU GRIHNPIES!{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $267,$3	; Run text script at offset 0x027AC8
					; 0xE21B: PRINT	MSG 0x0269, MSGBOX CLEARED, END: "{47}MAN SAGT,	DASS{43}DIE UNTERIRDISCHEN MONSTER{43}VIEL SCHLAUER SIND ALS WIR!{4A}"
					;
		dc.w $16		; Params 00, 16
		ScriptID    $268,$5	; Run text script at offset 0x027ACA
					; 0xE21C: PRINT	MSG 0x026A, MSGBOX CLEARED, END: "{47}WIR WÜNSCHEN DIR{43}VIEL GLÜCK! WENN DU SCHON DABEI{43}BIST{45}...{45}...KANNST DU DICH AUCH{4E}{47}DARUM	KÜMMERN,{43}DASS DIE STEUERN GESENKT{43}WERDEN?{4A}"
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
		ScriptID    $4D8,$0	; Run text script at offset 0x027FAA
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0xE3E7: PRINT	MSG 0x0435, MSGBOX CLEARED, END: "{47}SEIN HOBBY IST{43}ES, VASEN ZU SAMMELN. MEIN{43}HOBBY IST	ES, SIE	DURCHEIN-{4E}{47}ANDERZUWERFEN{43}UND JEMANDEN ZU BITTEN,{43}SIE ZURÜCKZUSTELLEN.{4A}"
; ---------------------------------------------------------------------------
		bra.s	CS_00D0_1
; ---------------------------------------------------------------------------

CS_00D0_0:				; CODE XREF: ROM:00026740j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4D6,$0	; Run text script at offset 0x027FA6
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0xE3E6: PRINT	MSG 0x0434, MSGBOX CLEARED, END: "{47}BITTE HILF MIR{43}NOCH EINMAL.{4A}"
; ---------------------------------------------------------------------------

CS_00D0_1:				; CODE XREF: ROM:00026746j
		bra.s	CS_00D0_4
; ---------------------------------------------------------------------------

CS_00D0_2:				; CODE XREF: ROM:00026736j
		move.w	#$1A,d0
		bsr.w	TestFlagBit
		bne.s	CS_00D0_3
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $269,$0	; Run text script at offset 0x027ACC
					; 0x7C38: LOAD CUSTOM ACTION 0x38 (0x1000000DF CSA_0038), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	CS_00D0_4
; ---------------------------------------------------------------------------

CS_00D0_3:				; CODE XREF: ROM:00026756j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4DA,$0	; Run text script at offset 0x027FAE
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0xE3E8: PRINT	MSG 0x0436, MSGBOX CLEARED, END: "{47}MEIN RÜCKEN{43}SCHMERZT. DIE VASEN SIND{43}EINFACH ZU SCHWER FÜR MICH...{4A}"
; ---------------------------------------------------------------------------

CS_00D0_4:				; CODE XREF: ROM:CS_00D0_1j
					; ROM:0002675Cj
		rts
; ---------------------------------------------------------------------------

CS_00D1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $26A,$1	; Run text script at offset 0x027ACE
					; 0xE21D: PRINT	MSG 0x026B, MSGBOX CLEARED, END: "{47}IN JUNGEN	JAHREN{43}HABE ICH IM SCHLOSS GEARBEITET.{4E}{47}WIR WERDEN FAST{43}NIE	IN DAS SCHLOSS EINGELADEN.{43}ABER ICH ERINNERE	MICH AN{4E}{47}SEINE{43}ELEGANZ...{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $26B,$3	; Run text script at offset 0x027AD0
					; 0xE21E: PRINT	MSG 0x026C, MSGBOX CLEARED, END: "{47}DAS SCHIFF VOM{43}FESTLAND HAT ANGELEGT! LASST{43}UNS ZUM	MONATS-MARKT GEHEN!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $26C,$5	; Run text script at offset 0x027AD2
					; 0x821F: PRINT	MSG 0x026D: "{47}ICH GLAUB', AN{43}DEM GERÜCHT IS' WAS DRAN. ALS{43}MEIN MANN NACH RYUMA GEGANGEN{4E}{47}IST, HAT ER{43}EINEN JUNGEN MANN GESEHEN,{4E}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0x8220: PRINT	MSG 0x026E: "{47}DER DEN{43}{4B} WEGGEWORFEN HAT.{43}ES	WAR DER	LEHRLING VOM{4E}{47}LEUCHTTURMWÄRTER.{43}ER HAT	DEN JUNGEN GEFRAGT UND{43}HERAUSGEFUNDEN, DASS HERZOG{4E}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE221: PRINT	MSG 0x026F, MSGBOX CLEARED, END: "{47}MERKATOR IHN{43}DAZU ÜBERREDET HAT, DEN{43}{4B} ZU STEHLEN!{4E}{47}ALS MEIN MANN{43}DAS HÖRTE, RANNTE ER ZURÜCK,{43}ABER DER HERZOG WAR SCHON WEG...{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $271,$7	; Run text script at offset 0x027ADC
					; 0xE222: PRINT	MSG 0x0270, MSGBOX CLEARED, END: "{47}DA OBEN WIRD{43}IMMER NOCH VERHÖRT.{4A}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $272,$9	; Run text script at offset 0x027ADE
					; 0xE223: PRINT	MSG 0x0271, MSGBOX CLEARED, END: "{47}SIE SIND IMMER{43}NOCH OBEN UND WASCHEN DEM{43}JUNGEN MANN DEN KOPF.{4E}{47}WIR MÜSSEN UNS{43}AUF	DIE ZUKUNFT VORBEREITEN...{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $273,$B	; Run text script at offset 0x027AE0
					; 0xE224: PRINT	MSG 0x0272, MSGBOX CLEARED, END: "{47}KANNST DU	DICH{43}NOCH AN	DEN LEHRLING VOM{43}LEUCHTTURM ERINNERN?{4E}{47}DER ARBEITET{43}JETZT FÜR GENERAL ARTHUR!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D2:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $274,$1	; Run text script at offset 0x027AE2
					; 0xE225: PRINT	MSG 0x0273, MSGBOX CLEARED, END: "{47}WEISST DU, MEIN{43}FREUND	ARBEITET IM SCHLOSS, UND{43}ER SAGT, DASS ES IM	KELLER EIN{4E}{47}LABYRINTH GIBT.{43}UND DAS IST NOCH NICHT ALLES!{43}ES WIMMELT NUR SO	VON EKLIGEN{4E}{47}MONSTERN!{43}IIIIH! WIE WIDERLICH!{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $275,$3	; Run text script at offset 0x027AE4
					; 0xE226: PRINT	MSG 0x0274, MSGBOX CLEARED, END: "{47}MEIN FREUND{43}SAGT AUCH,	DASS SCHURKEN UND{43}VERBRECHER	IN DEN VERLIESEN{4E}{47}DES SCHLOSSES{43}GEFANGENGEHALTEN WERDEN!!{43}WIE FIND'ST DU DAS?!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $276,$5	; Run text script at offset 0x027AE6
					; 0xE227: PRINT	MSG 0x0275, MSGBOX CLEARED, END: "{47}PAPA UND DIE{43}ANDEREN SIND NOCH	OBEN UND{43}QUETSCHEN DEN LEHRLING AUS.{4E}{47}ER IST DAMALS{43}IN DEN LEUCHTTURM EINGEBROCHEN.{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $277,$7	; Run text script at offset 0x027AE8
					; 0xE228: PRINT	MSG 0x0276, MSGBOX CLEARED, END: "{47}JA, DIE SIND{43}IMMER NOCH OBEN. ICH GLAUBE,{43}ER HAT BALD GENUG...{4A}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $278,$9	; Run text script at offset 0x027AEA
					; 0xE229: PRINT	MSG 0x0277, MSGBOX CLEARED, END: "{47}JEMAND MUSS DA{43}OBEN IM	SCHLOSS	DIE HERRSCHAFT{43}ÜBER DIE STADT ÜBERNEHMEN!{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $279,$B	; Run text script at offset 0x027AEC
					; 0xE22A: PRINT	MSG 0x0278, MSGBOX CLEARED, END: "{47}MEIN VATER UND{43}SEINE FREUNDE SIND OBEN	UND{43}REDEN ÜBER DAS NEUE KASINO.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001C:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $27A,$0	; Run text script at offset 0x027AEE
					; 0xE22B: PRINT	MSG 0x0279, MSGBOX CLEARED, END: "{47}MERKATOR IST{43}EINE STADT MIT TRADITION.{43}HIER	MUSS MAN SICH{4E}{47}ANSTÄNDIG BENEHMEN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00D3:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $27B,$0	; Run text script at offset 0x027AF0
					; 0xE22C: PRINT	MSG 0x027A, MSGBOX CLEARED, END: "{47}ICH HOFFE,{43}DER	BÖSE ZAUBERER WIRD BALD{43}BESIEGT...UND WIR MÜSSEN NICHT{4E}{47}SO VIELE{43}STEUERN ZAHLEN.....{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00D4:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $27C,$0	; Run text script at offset 0x027AF2
					; 0xE22D: PRINT	MSG 0x027B, MSGBOX CLEARED, END: "{47}HERZOG MERKATOR{43}IST EIN NETTER	MANN. ER KAM{43}NEULICH	IN DIE STADT UND{4E}{47}HAT MIT	JEDEM{43}PERSÖNLICH GEREDET. ICH WAR{43}ZIEMLICH BEEINDRUCKT.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00D5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $27D,$1	; Run text script at offset 0x027AF4
					; 0xE22E: PRINT	MSG 0x027C, MSGBOX CLEARED, END: "{47}HERZOG MERKATOR{43}IST EINSAME SPITZE! ER	SIEHT{43}SO GÜTIG UND KULTIVIERT AUS.{4A}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $27E,$3	; Run text script at offset 0x027AF6
					; 0xE22F: PRINT	MSG 0x027D, MSGBOX CLEARED, END: "{47}HERZOG MERKATOR{43}IST EINSAME SPITZE! ER	SIEHT{43}SO GÜTIG UND KULTIVIERT AUS.{4E}{47}GUTEN TAG,{43}MEIN	HERR! DU SIEHST{43}NETT	AUS...{4A}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $27D,$5	; Run text script at offset 0x027AF4
					; 0xE22E: PRINT	MSG 0x027C, MSGBOX CLEARED, END: "{47}HERZOG MERKATOR{43}IST EINSAME SPITZE! ER	SIEHT{43}SO GÜTIG UND KULTIVIERT AUS.{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $27F,$7	; Run text script at offset 0x027AF8
					; 0xE230: PRINT	MSG 0x027E, MSGBOX CLEARED, END: "{47}NUN? WIE WAR{43}ES? DU HAST HERZOG MERKATOR{43}GESEHEN, NICHT WAHR?{4E}{47}ICH BENEIDE{43}DICH!{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $280,$9	; Run text script at offset 0x027AFA
					; 0xE231: PRINT	MSG 0x027F, MSGBOX CLEARED, END: "{47}NUN? WIE WAR'S?{43}DU HAST MIR GESEHEN, ODER?{43}SAH ER SO STARK AUS,{4E}{47}WIE MAN IMMER{43}ERZÄHLT?{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $281,$B	; Run text script at offset 0x027AFC
					; 0xE232: PRINT	MSG 0x0280, MSGBOX CLEARED, END: "{47}WAS? HERZOG{43}MERKATOR WAR WIRKLICH EIN{43}SCHLECHTER MENSCH?...OH, ICH{4E}{47}HABE GESEHEN,{43}WIE ER VOR EINER	WEILE MIT{43}SEINEN SOLDATEN  ZUM HAFEN{4E}{47}GING.{43}WAS MAG	DA LOS SEIN?{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $282,$D	; Run text script at offset 0x027AFE
					; 0xE233: PRINT	MSG 0x0281, MSGBOX CLEARED, END: "{47}DER HERZOG WAR{43}WIRKLICH EINER VON DEN BÖSEN?{43}ICH HABE DIR NICHT GEGLAUBT...{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $283,$F	; Run text script at offset 0x027B00
					; 0xE234: PRINT	MSG 0x0282, MSGBOX CLEARED, END: "{47}WIR GEWÖHNEN{43}UNS AN DAS LEBEN OHNE HERZOG{43}MERKATOR.	WAS IN DER WELT{4E}{47}KÖNNTE ER JETZT{43}VORHABEN? WAS? ER SUCHT IMMER{43}NOCH	DEN SCHATZ? HMMM.....!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $284,$1	; Run text script at offset 0x027B02
					; 0xE235: PRINT	MSG 0x0283, MSGBOX CLEARED, END: "{47}DIESE WAHR-{43}SAGERIN IST SEHR BERÜHMT HIER.{43}SIE KANN	UNS TOLL VERZAUBERN!{4A}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $285,$3	; Run text script at offset 0x027B04
					; 0xE236: PRINT	MSG 0x0284, MSGBOX CLEARED, END: "{47}HE HE...ICH{43}WEISS. DU HAST SIE	GEBETEN,{43}DICH ZU VERZAUBERN,	ODER?{4E}{47}GEH NUR WEITER!{43}MADAME YARD IST	AUF DER{43}ANDEREN STRASSENSEITE.{4A}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $284,$5	; Run text script at offset 0x027B02
					; 0xE235: PRINT	MSG 0x0283, MSGBOX CLEARED, END: "{47}DIESE WAHR-{43}SAGERIN IST SEHR BERÜHMT HIER.{43}SIE KANN	UNS TOLL VERZAUBERN!{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $286,$7	; Run text script at offset 0x027B06
					; 0xE237: PRINT	MSG 0x0285, MSGBOX CLEARED, END: "{47}IHRE ZAUBEREIEN{43}SIND SO BERÜHMT, DASS VIELE{43}LEUTE VON WEIT HERKOMMEN,{4E}{47}UM SIE	ZU{43}SEHEN.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $287,$1	; Run text script at offset 0x027B08
					; 0xE238: PRINT	MSG 0x0286, MSGBOX CLEARED, END: "{47}WIE KOMMT	ES,{43}DASS SO EINE BUDE IN DER	BESTEN{43}GEGEND DER STADT STEHT?{4E}{47}DAS VERSTEHE{43}ICH NICHT!{4A}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $288,$3	; Run text script at offset 0x027B0A
					; 0xE239: PRINT	MSG 0x0287, MSGBOX CLEARED, END: "{47}TJA, ICH WOLLTE{43}DIESES	GRUNDSTÜCK KAUFEN, ABER{43}WILL	DER KERL JETZT VERKAUFEN{4E}{47}ODER NICHT?{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $289,$5	; Run text script at offset 0x027B0C
					; 0xE23A: PRINT	MSG 0x0288, MSGBOX CLEARED, END: "{47}WEM GEHÖRT{43}DIESES GRUNDSTÜCK EIGENTLICH?{43}HERZOG MERKATOR VIELLEICHT?...{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $28A,$7	; Run text script at offset 0x027B0E
					; 0xE23B: PRINT	MSG 0x0289, MSGBOX CLEARED, END: "{47}WUSSTEST DU,{43}DASS DER HERZOG GEFLOHEN IST?{43}WAS WIRD	NUN AUS	UNS?{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $28B,$9	; Run text script at offset 0x027B10
					; 0xE23C: PRINT	MSG 0x028A, MSGBOX CLEARED, END: "{47}SIEHST DU{43} DAS	SCHILD?{4E}{47}DAS IST DIE GE-{43}LEGENHEIT...ICH HABE DAS BESTE{43}GRUNDSTÜCK VON GANZ	MERKATOR!{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $28C,$B	; Run text script at offset 0x027B12
					; 0xE23D: PRINT	MSG 0x028B, MSGBOX CLEARED, END: "{47}MIST! JETZT HABE{43}ICH DAS GRUNDSTÜCK, ABER KEIN{43}GELD, UM BAUEN ZU KÖNNEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $28D,$1	; Run text script at offset 0x027B14
					; 0xE23E: PRINT	MSG 0x028C, MSGBOX CLEARED, END: "{47}DER HAFEN	VON{43}MERKATOR	LIEGT IM SÜDEN.	DORT{43}LEGT REGELMÄSSIG EIN LINIEN-{4E}{47}SCHIFF{43}VOM FESTLAND AN.{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $28E,$3	; Run text script at offset 0x027B16
					; 0xE23F: PRINT	MSG 0x028D, MSGBOX CLEARED, END: "{47}UNSER WAREN-{43}UMSCHLAG FLORIERT, WENN DAS{43}SCHIFF ANKOMMT.{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $28F,$5	; Run text script at offset 0x027B18
					; 0xE240: PRINT	MSG 0x028E, MSGBOX CLEARED, END: "{47}DU LIEBE GÜTE!{43}DAS SCHIFF KANN	WEGEN DER{43}SCHWIERIGKEITEN MIT DEM{4E}{47}LEUCHTTURM{43}GAR NICHT AUSLAUFEN!{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $290,$7	; Run text script at offset 0x027B1A
					; 0xE241: PRINT	MSG 0x028F, MSGBOX CLEARED, END: "{47}DU LIEBE GÜTE!{43}DAS SCHIFF KANN	WEGEN DER{43}SCHWIERIGKEITEN MIT DEM{4E}{47}LEUCHTTURM{43}GAR NICHT AUSLAUFEN!{4E}{47}DU LIEBE GÜTE,{43}DAS...OH! DU HAST ES IN	ORDNUNG{43}GEBRACHT? TOLL!{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $291,$9	; Run text script at offset 0x027B1C
					; 0xE242: PRINT	MSG 0x0290, MSGBOX CLEARED, END: "{47}HAST DU SCHON{43}VON DEM NEUEN KASINO GEHÖRT,{43}DAS KÜRZLICH ERÖFFNET WURDE?{4E}{47}DA IST RICHTIG{43}WAS LOS!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D9:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $292,$0	; Run text script at offset 0x027B1E
					; 0xE243: PRINT	MSG 0x0291, MSGBOX CLEARED, END: "{47}ICH BEOBACHTE{43}OFT DIE OFFIZIERE, WIE SIE IM{43}SCHLOSS	EIN- UND AUSGEHEN.{4E}{47}WAS MACHEN{43}DIE BLOSS DA DRINNEN...?{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00DA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $293,$1	; Run text script at offset 0x027B20
					; 0xE244: PRINT	MSG 0x0292, MSGBOX CLEARED, END: "{47}WENN ICH{43}ERWACHSEN BIN, WERDE ICH ZUR{43}KÖNIGLICHEN WACHE GEHEN UND{4E}{47}DEM HERZOG{43}MERKATOR DIENEN.{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $294,$3	; Run text script at offset 0x027B22
					; 0xE245: PRINT	MSG 0x0293, MSGBOX CLEARED, END: "{47}GEHST DU{43}WIRKLICH ZUM TURM VON	MIR?{43}BIST DU	LEBENSMÜDE?!!{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $295,$5	; Run text script at offset 0x027B24
					; 0xE246: PRINT	MSG 0x0294, MSGBOX CLEARED, END: "{47}WILLKOMMEN ZU{43}HAUSE! WIR DACHTEN SCHON,{43}DU WÄRST TOT!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00DB:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $296,$0	; Run text script at offset 0x027B26
					; 0xE247: PRINT	MSG 0x0295, MSGBOX CLEARED, END: "{47}ICH HALTE	VOM{43}TURM AUS	AUSSCHAU{43}NACH EINDRINGLINGEN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00DC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $297,$1	; Run text script at offset 0x027B28
					; 0xE248: PRINT	MSG 0x0296, MSGBOX CLEARED, END: "{47}WAU-WAU!{43}WAU-WAU!{4A}"
					;
		dc.w $19		; Params 00, 19
		ScriptID    $298,$3	; Run text script at offset 0x027B2A
					; 0xE249: PRINT	MSG 0x0297, MSGBOX CLEARED, END: "{47}ICH WOLLTE NICHT{43}DEN BESTEN BAUPLATZ{43}DER STADT!.....{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_001D_0,$1 ; Jump	to address 0x026870
					;
		dc.w $C			; Params 00, 0C
		ScriptID    $29B,$3	; Run text script at offset 0x027B30
					; 0xE24B: PRINT	MSG 0x0299, MSGBOX CLEARED, END: "{47}MAMA HAT{43}GLEICH FEIERABEND FÜR	HEUTE.{4A}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $29C,$5	; Run text script at offset 0x027B32
					; 0xE24C: PRINT	MSG 0x029A, MSGBOX CLEARED, END: "{47}MADAME YARD{43}IST MEINE MUTTER. SIE SCHLIESST{43}BESTIMMT GLEICH	AB.{4E}{47}ICH WETTE,{43}SIE IST HUNDEMÜDE!{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $29D,$7	; Run text script at offset 0x027B34
					; 0xE24D: PRINT	MSG 0x029B, MSGBOX CLEARED, END: "{47}MAMA UND ICH{43}GEHEN AUFS FESTLAND, UM EIN{43}NEUES GESCHÄFT ZU ERÖFFNEN.{4E}{47}KOMM DOCH{43}AUCH VORBEI!{43}WAS...?{4E}{47}OH,	WAS FÜR	EIN{43}GESCHÄFT	DAS IST, KANNST	DU{43}SEHEN, WENN DU VORBEIKOMMST!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $29E,$9	; Run text script at offset 0x027B36
					; 0xE24E: PRINT	MSG 0x029C, MSGBOX CLEARED, END: "{47}BITTE REPARIER{43}DEN LEUCHTTURM FÜR MEINE{43}MUTTER UND MICH!{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $29F,$B	; Run text script at offset 0x027B38
					; 0xE24F: PRINT	MSG 0x029D, MSGBOX CLEARED, END: "{47}ICH BIN NOCH{43}NIE AUF DEM FESTLAND GEWESEN.{43}ICH BIN SEIT MEINER GEBURT{4E}{47}AUF DIESER INSEL.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001D_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $2A		; Bit 2	of flag	0x005
		ScriptID    $29A,$1	; Flag set:   Run text script at offset	0x027B2E
					; 0xE24A: PRINT	MSG 0x0298, MSGBOX CLEARED, END: "{47}ICH SEHE,{43}DASS	DU EIN RICHTIGER{43}HERZENSBRECHER BIST...{4A}"
		ScriptID    $299,$2	; Flag clear: Run text script at offset	0x027B2C
					; 0x7C2F: LOAD CUSTOM ACTION 0x2F (0x1000000BB CSA_002F), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00DD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2A0,$1	; Run text script at offset 0x027B3A
					; 0xE250: PRINT	MSG 0x029E, MSGBOX CLEARED, END: "{47}ICH BIN{43}BESTOHLEN WORDEN! DIESES{43}GRIHNPIES...TOTAL AUSGERAUBT!{4E}{47}ICH BIN SO GUT{43}WIE	TOT! MEINE FRAU	BRINGT MICH{43}UM! WAS MACH' ICH BLOSS...{4E} ICH WEISS!{43}{47}ICH ERZÄHLE IHR,{43}ICH HÄTTE MEIN PORTEMONNAIE{43}VERLOREN...{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2A1,$3	; Run text script at offset 0x027B3C
					; 0xE251: PRINT	MSG 0x029F, MSGBOX CLEARED, END: "{47}ICH MÖCHTE DAS{43}LEBEN NOCH EINMAL GENIESSEN!{43}SIE SOLL MICH VERZAUBERN!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2A2,$5	; Run text script at offset 0x027B3E
					; 0xE252: PRINT	MSG 0x02A0, MSGBOX CLEARED, END: "{47}ICH BIN JUNG!{43}ICH BIN JUNG!{43}HURRA!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00DE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2A3,$1	; Run text script at offset 0x027B40
					; 0xE253: PRINT	MSG 0x02A1, MSGBOX CLEARED, END: "{47}OH, FAHL,	MEIN{43}LIEBSTER. WANN SEHEN WIR UNS{43}WIEDER?	ICH DENKE NUR AN DICH.{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2A4,$3	; Run text script at offset 0x027B42
					; 0xE254: PRINT	MSG 0x02A2, MSGBOX CLEARED, END: "{47}SCHAU! WAS{43}MACHT DIESES MÄDCHEN IN SEINEM{43}ZIMMER!{4E}{47}DAS DARF DOCH{43}NICHT WAHR SEIN!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2A5,$5	; Run text script at offset 0x027B44
					; 0xE255: PRINT	MSG 0x02A3, MSGBOX CLEARED, END: "{47}HÖRST DU DAS?{43}FAHL HAT	SICH DIE GANZE NACHT{43}MIT DIESEM MÄDCHEN UNTERHALTEN!{4E}{47}DAS MACHT MICH{43}RICHTIG EIFERSÜCHTIG...!{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2A6,$7	; Run text script at offset 0x027B46
					; 0xE256: PRINT	MSG 0x02A4, MSGBOX CLEARED, END: "{47}ICH GLAUBE, ES{43}IST AN DER ZEIT, IHN{43}AUFZUGEBEN...{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00DF:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2A7,$0	; Run text script at offset 0x027B48
					; 0xE257: PRINT	MSG 0x02A5, MSGBOX CLEARED, END: "{47}HERR FAHL	HAT{43}VIELE FREUNDE. ICH GEBE ZU,{43}ER IST SEHR STARK, ABER...{4E}{47}ER IST SCHON{43}SO ALT!	 WAS FINDEN NUR	ALL DIE{43}MÄDCHEN AN IHM?{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2A8,$1	; Run text script at offset 0x027B4A
					; 0xE258: PRINT	MSG 0x02A6, MSGBOX CLEARED, END: "{47}ICH BIN MIR{43}NICHT SICHER, WANN	DAS{43}NÄCHSTE SCHIFF KOMMT...{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2A9,$3	; Run text script at offset 0x027B4C
					; 0xE259: PRINT	MSG 0x02A7, MSGBOX CLEARED, END: "{47}ICH HABE GERADE{43}FURCHTBARE SCHREIE GEHÖRT{43}...ODER HABE ICH MICH VERHÖRT?{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2AA,$1	; Run text script at offset 0x027B4E
					; 0xE25A: PRINT	MSG 0x02A8, MSGBOX CLEARED, END: "{47}EHRLICH GESAGT,{43}BIN ICH SOLDAT	VOM SCHLOSS.{43}ICH MUSS HIER WACHE HALTEN,{4E}{47}OHNE	ERKANNT	ZU{43}WERDEN. ICH BIN STOLZ AUF{43}MEINEN JOB!{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2AB,$3	; Run text script at offset 0x027B50
					; 0xE25B: PRINT	MSG 0x02A9, MSGBOX CLEARED, END: "{47}GEHST DU AUCH{43}ZUM TURM? IHR SEID ABER KÜHN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E2:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2AC,$1	; Run text script at offset 0x027B52
					; 0xE25C: PRINT	MSG 0x02AA, MSGBOX CLEARED, END: "{47}ICH WEISS	NICHT{43}WARUM,	ABER JEDESMAL, WENN ICH{43}HIERHER KOMME, LÄUFT	ES MIR{4E}{47}EISKALT DEN{43}RÜCKEN HINUNTER....BRRR!{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2AD,$3	; Run text script at offset 0x027B54
					; 0xE25D: PRINT	MSG 0x02AB, MSGBOX CLEARED, END: "{47}ZACK UND DEXTER?{43}DIE SIND VOR EINIGER ZEIT IN DAS{43}UNTERIRDISCHE GRAB GEGANGEN.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E3:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2AE,$0	; Run text script at offset 0x027B56
					; 0xE25E: PRINT	MSG 0x02AC, MSGBOX CLEARED, END: "{47}HALLO! NOCH EIN{43}SCHATZSUCHER, ODER? IN	LETZTER{43}ZEIT	VERMEHREN DIE SICH{4E}{47}WIE VON{43}SELBST.....{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E4:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2AF,$0	; Run text script at offset 0x027B58
					; 0xE25F: PRINT	MSG 0x02AD, MSGBOX CLEARED, END: "{47}W...WER BIST DU!{43}ICH BIN BESCHÄFTIGT.{43}BELÄSTIGE MICH NICHT!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_00E5_0,$1 ; Jump	to address 0x0268FE
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $2B2,$3	; Run text script at offset 0x027B5E
					; 0xE261: PRINT	MSG 0x02AF, MSGBOX CLEARED, END: "{47}HERR NIELS!{43}GENERAL ARTHUR HAT	UNS GEBETEN,{43}DICH HINEINZULASSEN. GEH NUR.{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2B3,$5	; Run text script at offset 0x027B60
					; 0xE262: PRINT	MSG 0x02B0, MSGBOX CLEARED, END: "{47}ICH WÜRDE	JA{43}GERNE MITKOMMEN UND DIR HELFEN,{43}ABER ICH MUSS HIERBLEIBEN!{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptJump  CS_00E5_2,$7 ; Jump	to address 0x02690A
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2B7,$9	; Run text script at offset 0x027B68
					; 0xE264: PRINT	MSG 0x02B2, MSGBOX CLEARED, END: "{47}ICH HABE IMMER{43}SCHON DAVON GETRÄUMT,{43}HIER STEHEN ZU	DÜRFEN!{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2B8,$B	; Run text script at offset 0x027B6A
					; 0xE265: PRINT	MSG 0x02B3, MSGBOX CLEARED, END: "{47}WILLKOMMEN IM{43}SCHLOSS VON ARTHUR! JEDER{43}KANN DURCH DIESES TOR GEHEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E5_0:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2B0,$0	; Run text script at offset 0x027B5A
					; 0x14C8: SET BIT 0 OF FLAG 0x019
					; 0xE260: PRINT	MSG 0x02AE, MSGBOX CLEARED, END: "{47}DAS IST DAS{43}SCHLOSS VON MERKATOR.{43}ABER DU KANNST NICHT HINEIN.{4A}"
; ---------------------------------------------------------------------------

CS_00E5_1:				; CODE XREF: ROM:00026938j
		move.w	#$C6,d0	; '╞'
		bra.w	CS_0016_1
; ---------------------------------------------------------------------------

CS_00E5_2:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DC		; Bit 4	of flag	0x01B
		ScriptID    $2B4,$1	; Flag clear: Run text script at offset	0x027B62
					; 0x7CEF: LOAD CUSTOM ACTION 0xEF (0x1000003BB CSA_00EF), MSGBOX CLEARED, END
		ScriptID    $2B6,$2	; Flag set:   Run text script at offset	0x027B66
					; 0xE263: PRINT	MSG 0x02B1, MSGBOX CLEARED, END: "{47}KOMPANIIIIE--{43}ACH-TUUUNG! KOMM	DOCH 'REIN!{43}HERZOG MERKATOR WARTET SCHON!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_00E6_0,$1 ; Jump	to address 0x026934
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $2BB,$3	; Run text script at offset 0x027B70
					; 0xE267: PRINT	MSG 0x02B5, MSGBOX CLEARED, END: "{47}DU BIST NIELS?{43}HMMM...{43}...JÜNGER, ALS ICH DACHTE...{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2BC,$5	; Run text script at offset 0x027B72
					; 0xE268: PRINT	MSG 0x02B6, MSGBOX CLEARED, END: "{47}AUF DEM WEG,{43}MIR ZU BESIEGEN, WAS?{43}HOFFENTLICH HAT DEINE MAMA{4E}{47}SCHWARZE{43}TRAUERKLEIDUNG!  HAHAHAHAHA!!{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptJump  CS_00E6_1,$7 ; Jump	to address 0x02693A
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2BE,$9	; Run text script at offset 0x027B76
					; 0xE26A: PRINT	MSG 0x02B8, MSGBOX CLEARED, END: "{47}DU DA! HALT!{43}...HI HI,	WAR NUR	EIN SCHERZ!{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2BF,$B	; Run text script at offset 0x027B78
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0xE26B: PRINT	MSG 0x02B9, MSGBOX CLEARED, END: "{47}WIR SIND DIE{43}ERSTEN KINDER-TORHÜTER DIESES{43}SCHLOSSES.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E6_0:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2B9,$0	; Run text script at offset 0x027B6C
					; 0x14C8: SET BIT 0 OF FLAG 0x019
					; 0xE266: PRINT	MSG 0x02B4, MSGBOX CLEARED, END: "{47}DU BIST DOCH{43}NICHT VON	HERZOG MERKATOR{43}EINGELADEN WORDEN, ODER?{4E}{47}DAS HIER IST{43}NICHT DER ORT FÜR SCHMUTZIGE{43}KLEINE KINDER WIE DICH! ZIEH	AB!{4A}"
; ---------------------------------------------------------------------------
		bra.s	CS_00E5_1
; ---------------------------------------------------------------------------

CS_00E6_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DC		; Bit 4	of flag	0x01B
		ScriptID    $2B4,$1	; Flag clear: Run text script at offset	0x027B62
					; 0x7CEF: LOAD CUSTOM ACTION 0xEF (0x1000003BB CSA_00EF), MSGBOX CLEARED, END
		ScriptID    $2BD,$2	; Flag set:   Run text script at offset	0x027B74
					; 0xE269: PRINT	MSG 0x02B7, MSGBOX CLEARED, END: "{47}NIELS! DU	LEBST!!{43}ICH BIN BEEINDRUCKT!	HERZOG{43}MERKATOR WIRD	DICH DAFÜR LOBEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E7:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2C1,$0	; Run text script at offset 0x027B7C
					; 0xE26C: PRINT	MSG 0x02BA, MSGBOX CLEARED, END: "{47}KI-KE-RI-KI...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E8:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $28		; Bit 0	of flag	0x005
		ScriptID    $2C3,$1	; Flag set:   Run text script at offset	0x027B80
					; 0xE26D: PRINT	MSG 0x02BB, MSGBOX CLEARED, END: "{47}WARUM WERDEN{43}MÄNNER NUR SO ALBERN,{43}WENN SIE	VERLIEBT SIND?!{4A}"
		ScriptID    $2C2,$2	; Flag clear: Run text script at offset	0x027B7E
					; 0x7C29: LOAD CUSTOM ACTION 0x29 (0x1000000A3 CSA_0029), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptJump  CS_001E_0,$1 ; Jump	to address 0x026976
					;
		dc.w $12		; Params 00, 12
		ScriptID    $365,$3	; Run text script at offset 0x027CC4
					; 0xE300: PRINT	MSG 0x034E, MSGBOX CLEARED, END: "{47}ICH DENKE,{43}DIE	PARTY GEHT JETZT LOS.{4E}{47}WARUM WOLLET{43}IHR NICHT IN DEN BANKETT-SAAL{43}GEHEN?{4A}"
					;
		dc.w $13		; Params 00, 13
		ScriptJump  CS_001E_2,$5 ; Jump	to address 0x02698E
					;
		dc.w $14		; Params 00, 14
		ScriptJump  CS_001E_3,$7 ; Jump	to address 0x02699A
					;
		dc.w $18		; Params 00, 18
		ScriptJump  CS_001E_4,$9 ; Jump	to address 0x0269A6
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  CS_001E_5,$B ; Jump	to address 0x0269B2
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001E_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CE		; Bit 6	of flag	0x019
		ScriptID    $362,$1	; Flag clear: Run text script at offset	0x027CBE
					; 0x7C51: LOAD CUSTOM ACTION 0x51 (0x100000143 CSA_0051), MSGBOX CLEARED, END
		ScriptJump  CS_001E_1,$2 ; Flag	set:   Jump to address 0x026982
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $DB		; Bit 3	of flag	0x01B
		ScriptID    $364,$1	; Flag set:   Run text script at offset	0x027CC2
					; 0x1493: SET BIT 3 OF FLAG 0x012
					; 0xE300: PRINT	MSG 0x034E, MSGBOX CLEARED, END: "{47}ICH DENKE,{43}DIE	PARTY GEHT JETZT LOS.{4E}{47}WARUM WOLLET{43}IHR NICHT IN DEN BANKETT-SAAL{43}GEHEN?{4A}"
		ScriptID    $363,$2	; Flag clear: Run text script at offset	0x027CC0
					; 0xE2FF: PRINT	MSG 0x034D, MSGBOX CLEARED, END: "{47}HERR NIELS,{43}WILLKOMMEN	IM SCHLOSS.{43}SCHÖNEN AUFENTHALT HIER!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_2:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CF		; Bit 7	of flag	0x019
		ScriptID    $366,$1	; Flag clear: Run text script at offset	0x027CC6
					; 0xE301: PRINT	MSG 0x034F, MSGBOX CLEARED, END: "{47}WOLLET IHR IN{43}DER TAT ZUM TURM	GEHEN? DORT{43}IST ES SEHR GEFÄHRLICH!{4E}{47}WAR EUCH{43}BEWUSST, DASS	VOR DEM	TURM{43}EINE ZAUBER- SPERRE IST?{4E}{47}MEINE NACH-
					;                                                 {43}FORSCHUNGEN HABEN ERGEBEN,{43}DASS MAN DEN ARMREIF BRAUCHT,{4E}{47}UM DIE SPERRE{43}ZU DURCHBRECHEN.{4E}{47}IST IRGENDWO{43}IM UNTERIRDISCHEN GRAB NEBEN{43}DER KIRCHE. ICH SCHICKE IMMER{4E}{47}MEINE BESTEN{43}SPÄHER DORTHIN,	ABER ES	KOMMT{43}NIE EINER ZURÜCK...ICH	GLAUBE,{4E}{47}DA MÜSSEN FALLEN{43}SEIN, DAMIT KEINER AN DEN{43}ARMREIF	HERANKOMMT.{4A}"
		ScriptID    $367,$2	; Flag set:   Run text script at offset	0x027CC8
					; 0xE302: PRINT	MSG 0x0350, MSGBOX CLEARED, END: "{47}HERR NIELS!{43}HOL DEN ARMREIF UND{43}BESIEG MIR FÜR DEN HERZOG!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_3:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D1		; Bit 1	of flag	0x01A
		ScriptID    $368,$1	; Flag clear: Run text script at offset	0x027CCA
					; 0x8303: PRINT	MSG 0x0351: "{47}DEXTER	UND ZACK{43}SIND VOR EINER WEILE HIER{43}DURCHGEKOMMEN.	SIE{4E}{47}HABEN MICH{43}GEFRAGT, WIE MAN DIE SPERRE{43}DURCHBRICHT{4E}{47}UND SIND IN{43}RICHTUNG GRAB	GEGANGEN. HERR{43}NIELS, ICH MUSS DICH WARNEN,{4E}{47}DIE MONSTER DA{43}UNTEN SIND SEHR	INTELLIGENT.
					;                            {43}VIELLEICHT HAT MIR SIE{4E}{47}VERZAUBERT.{4E}{47}SEID EUCH DER{43}TATSACHE BEWUSST, DASS IHR DEN{43}ARMREIF NIEMALS FINDEN WERDET,{4E}{47}WENN IHR ALLEIN{43}AUF DAS SCHWERT EUCH VERLASST.{4E}"
					; 0xE304: PRINT	MSG 0x0352, MSGBOX CLEARED, END: "{47}HÜTET EUCH VOR{43}GAR SCHRECKLICHEN GEFAHREN!{4A}"
		ScriptID    $369,$2	; Flag set:   Run text script at offset	0x027CCC
					; 0xE304: PRINT	MSG 0x0352, MSGBOX CLEARED, END: "{47}HÜTET EUCH VOR{43}GAR SCHRECKLICHEN GEFAHREN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_4:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D5		; Bit 5	of flag	0x01A
		ScriptID    $36A,$1	; Flag clear: Run text script at offset	0x027CCE
					; 0x7CB5: LOAD CUSTOM ACTION 0xB5 (0x1000002D3 CSA_00B5), MSGBOX CLEARED, END
		ScriptID    $36B,$2	; Flag set:   Run text script at offset	0x027CD0
					; 0xE305: PRINT	MSG 0x0353, MSGBOX CLEARED, END: "{47}...GEH NACH...{43}OBEN UND ... ZERSTÖR DIE...{43}RÜSTUNG...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_5:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DE		; Bit 6	of flag	0x01B
		ScriptID    $36C,$1	; Flag clear: Run text script at offset	0x027CD2
					; 0x8306: PRINT	MSG 0x0354: "{47}WELCH FREUDE,{43}EUCH WIEDERZUSEHEN. SEHT NUR,{43}WIE ICH WIEDER GENESEN BIN.{4E}{47}ICH WERDE	MEIN{43}BESTES TUN, UM MERKATOR	WIEDER{43}LEBENSWERT ZU	MACHEN.{4E}{47}ICH HABE	LANGE{43}ÜBER DAS VERHÄLTNIS ZWISCHEN{43}POLITIK UND MILITÄR{4E}{47}NACHGEDACHT.
					;                            {43}JULIA UND ICH HABEN	OFT DARÜBER{43}DISKUTIERT, UND ICH BIN ÜBER-{4E}{47}ZEUGT, DASS	ICH{43}DIE STADT AUCH OHNE MILITÄRGE-{43}WALT AUFBLÜHEN	LASSEN KANN!{4E}{47}DESHALB HABE{43}ICH	EIN KASINO ERÖFFNET, UM	SO{43}DIE STEUERN SENKEN ZU KÖNNEN.{4E}{47}BITTE KOMMT{43}VORBEI, SO IHR ZEIT FINDET.{4E}"
					; 0x0016: LOAD 0x0016 INTO 0xFF1196 (KASINO{55}TICKET)
					; 0x17E8: RECEIVE ITEM [0xFF1196]
					; 0x181E: LOAD CHARACTER SCRIPT	ARTHUR (0x001E)
					; 0xE307: PRINT	MSG 0x0355, MSGBOX CLEARED, END: "{47}BESUCHT MICH{43}JEDERZEIT! SCHÜTZT EUER{43}ANTLITZ!{4A}"
		ScriptJump  CS_001E_6,$2 ; Flag	set:   Jump to address 0x0269BE
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_6:
		move.w	#ITM_CASINOTICKET,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	CS_001E_7
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $36F,$0	; Run text script at offset 0x027CD8
					; 0x181E: LOAD CHARACTER SCRIPT	ARTHUR (0x001E)
					; 0xE307: PRINT	MSG 0x0355, MSGBOX CLEARED, END: "{47}BESUCHT MICH{43}JEDERZEIT! SCHÜTZT EUER{43}ANTLITZ!{4A}"
; ---------------------------------------------------------------------------
		bra.s	CS_001E_8
; ---------------------------------------------------------------------------

CS_001E_7:				; CODE XREF: ROM:000269C6j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $371,$0	; Run text script at offset 0x027CDC
					; 0x8308: PRINT	MSG 0x0356: "{47}GUTEN TAG,{43}NIELS. MÖCHTEST DU DAS HABEN?{4E}"
					; 0x0016: LOAD 0x0016 INTO 0xFF1196 (KASINO{55}TICKET)
					; 0x77E8: RECEIVE ITEM [0xFF1196], MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

CS_001E_8:				; CODE XREF: ROM:000269CCj
		rts
; ---------------------------------------------------------------------------

CS_00EA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $A			; Params 00, 0A
		ScriptID    $2C4,$1	; Run text script at offset 0x027B82
					; 0x7C39: LOAD CUSTOM ACTION 0x39 (0x1000000E3 CSA_0039), MSGBOX CLEARED, END
					;
		dc.w $C			; Params 00, 0C
		ScriptID    $4EC,$3	; Run text script at offset 0x027FD2
					; 0xE3F0: PRINT	MSG 0x043E, MSGBOX CLEARED, END: "{47}ICH HABE NOCH{43}NIE SOVIEL UNEHRLICHKEIT	IN{43}MEINEM LEBEN GESEHEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $2C5,$1	; Run text script at offset 0x027B84
					; 0xE26E: PRINT	MSG 0x02BC, MSGBOX CLEARED, END: "{47}ICH BIN HIER{43}REICH GEWORDEN UND GEHE{43}JETZT ZURÜCK AUF'S FESTLAND.{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2C6,$3	; Run text script at offset 0x027B86
					; 0xE26F: PRINT	MSG 0x02BD, MSGBOX CLEARED, END: "{47}WIE UNGÜNSTIG!{43}ICH BIN	FERTIG,	ABER DAS{43}SCHIFF KANN	NICHT AUSLAUFEN!...{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2C7,$5	; Run text script at offset 0x027B88
					; 0xE270: PRINT	MSG 0x02BE, MSGBOX CLEARED, END: "{47}ICH DENKE,{43}DASS DAS GELD, DAS ICH HIER{43}GESPART HABE, REICHT,{4E}{47}UM MEIN{43}EIGENES GESCHÄFT AUFZUMACHEN.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00EB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2C8,$1	; Run text script at offset 0x027B8A
					; 0xE271: PRINT	MSG 0x02BF, MSGBOX CLEARED, END: "{47}ICH LIEBE	DAS{43}MEER. DIE FRISCHE, SALZIGE BRISE{43}MACHT MICH SCHON GLÜCKLICH.{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2C9,$3	; Run text script at offset 0x027B8C
					; 0xE272: PRINT	MSG 0x02C0, MSGBOX CLEARED, END: "{47}HERZOG MERKATOR{43}IST MIT BEWAFFNETEN SOLDATEN,{43}DIE ICH NOCH NIE GESEHEN HABE,{4E}{47}AN BORD	DES{43}SCHIFFES	GEGANGEN! NACHDEM SIE{43}WEG WAREN, GING PLÖTZLICH{4E}{47}DAS LICHT IM{43}LEUCHTTURM AUS...{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2CA,$5	; Run text script at offset 0x027B8E
					; 0x8273: PRINT	MSG 0x02C1: "{47}WIR WAREN ALLE{43}SO ERLEICHTERT, ALS WIEDER{43}LICHT IM LEUCHTTURM WAR.{4E}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE274: PRINT	MSG 0x02C2, MSGBOX CLEARED, END: "{47}OH! DU HAST{43}DEN {4B} GEFUNDEN?{43}TATSÄCHLICH?{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00EC:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2CD,$0	; Run text script at offset 0x027B94
					; 0xE275: PRINT	MSG 0x02C3, MSGBOX CLEARED, END: "{47}ES GIBT VIEL{43}UNGEWÖHNLICHES ZU	SEHEN, WENN{43}DAS SCHIFF VOM FESTLAND ANLEGT!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00ED:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2CE,$0	; Run text script at offset 0x027B96
					; 0xE276: PRINT	MSG 0x02C4, MSGBOX CLEARED, END: "{47}HAST DU DIE{43}PRINZESSIN	IM SCHLOSS GESEHEN?{43}SIE IST SOOO HÜBSCH!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00EE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $2CF,$1	; Run text script at offset 0x027B98
					; 0xE277: PRINT	MSG 0x02C5, MSGBOX CLEARED, END: "{47}ICH BIN FERTIG{43}MIT DEM	AUSLADEN!{43}UND HEUTE ABEND{4E}{47}MACHEN WIR BEI{43}GRIHNPIES	EINEN DRAUF!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2D0,$3	; Run text script at offset 0x027B9A
					; 0xE278: PRINT	MSG 0x02C6, MSGBOX CLEARED, END: "{47}SOLANGE DER{43}LEUCHTTURM	NICHT LEUCHTET,	KANN{43}KEIN SCHIFF AUSLAUFEN!{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2D1,$5	; Run text script at offset 0x027B9C
					; 0x7CD2: LOAD CUSTOM ACTION 0xD2 (0x100000347 CSA_00D2), MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00EF:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $2D2,$1	; Run text script at offset 0x027B9E
					; 0xE279: PRINT	MSG 0x02C7, MSGBOX CLEARED, END: "{47}ICH KOMME	EINMAL{43}IM MONAT MIT IMPORTWAREN HER.{43}WIR SEELEUTE	SIND GÄNZLICH VOM{4E}{47}LEUCHTTURM VON{43}RYUMA ABHÄNGIG, WEIL	SICH DIE{43}INSEL STÄNDIG IM NEBEL BEFINDET.{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2D3,$3	; Run text script at offset 0x027BA0
					; 0xE27A: PRINT	MSG 0x02C8, MSGBOX CLEARED, END: "{47}DER LEUCHTTURM{43}IST KAPUTT! WIE	SOLL ICH DENN{43}JETZT MEIN SCHIFF STEUERN?{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2D4,$5	; Run text script at offset 0x027BA2
					; 0xE27B: PRINT	MSG 0x02C9, MSGBOX CLEARED, END: "{47}DAS SCHIFF{43}NACH VERLA WIRD BALD DEN{43}HAFEN VERLASSEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $2D5,$1	; Run text script at offset 0x027BA4
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0xE27C: PRINT	MSG 0x02CA, MSGBOX CLEARED, END: "{47}ANKER LICHTEN,{43}LICHTEN	JA-HA! WELLEN BRECHEN,{43}LICHTEN JA-HA! WIR FAAAHREN!{4E}{47}DAS IST DER{43}NEUE NUMMER-EINS-HIT DER WOCHE{43}AUF DEM FESTLAND. SCHON GEHÖRT?{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2D7,$3	; Run text script at offset 0x027BA8
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0xE27D: PRINT	MSG 0x02CB, MSGBOX CLEARED, END: "{47}ANKER LICHTEN,{43}LICHTEN	JA-HA! WIR SITZEN FEST,{43}MÜSSEN WEITER! HEY, JA-HA,{4E}{47}LASS UNS{43}FAAAAHREN!{4E}{47}DEIN	SINGSANG{43}PASST JETZT	NICHT!{43}DIE SITUATION	IST SEHR ERNST!{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2D9,$5	; Run text script at offset 0x027BAC
					; 0xE27E: PRINT	MSG 0x02CC, MSGBOX CLEARED, END: "{47}DIE STEUERN HIER{43}SIND FURCHTBAR HOCH! SETZ SIE{43}'RUNTER, SAG ICH DIR...BASTA!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_00F1_1,$1 ; Jump	to address 0x026A6A
					;
		dc.w $101		; Params 01, 01
		ScriptID    $2DA,$3	; Run text script at offset 0x027BAE
					; 0xE27F: PRINT	MSG 0x02CD, MSGBOX CLEARED, END: "{47}TUT MIR LEID!{43}DIESES WARENHAUS	IST{43}NUR FÜR HÄNDLER.{4A}"
					;
		dc.w $102		; Params 01, 02
		ScriptJump  CS_00F1_0,$5 ; Jump	to address 0x026A5E
					;
		dc.w $103		; Params 01, 03
		ScriptID    $2DD,$7	; Run text script at offset 0x027BB4
					; 0xE281: PRINT	MSG 0x02CF, MSGBOX CLEARED, END: "{47}BIS ZUM{43}NÄCHSTEN MONAT! TSCHÜSS!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F1_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $A5		; Bit 5	of flag	0x014
		ScriptID    $2DC,$1	; Flag set:   Run text script at offset	0x027BB2
					; 0xE280: PRINT	MSG 0x02CE, MSGBOX CLEARED, END: "{47}KOMM DOCH	'REIN{43}UND SIEH DICH IM WARENHAUS{43}ETWAS UM! DU FINDEST{4E}{47}BESTIMMT ETWAS,{43}DAS DIR GEFÄLLT!{4A}"
		ScriptID    $2DB,$2	; Flag clear: Run text script at offset	0x027BB0
					; 0x7C6D: LOAD CUSTOM ACTION 0x6D (0x1000001B3 CSA_006D), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F1_1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $2DE,$0	; Prompt:	Run text script	at offset 0x027BB6
					; 0xA282: PRINT	MSG 0x02D0, END: "{47}HAST DU SCHON{43}VON GENERAL ARTHUR GEHÖRT?{44}"
		ScriptID    $2DF,$1	; Answer 'yes': Run text script at offset 0x027BB8
					; 0xE283: PRINT	MSG 0x02D1, MSGBOX CLEARED, END: "{47}ER WURDE SCHWER{43}VERLETZT! ES WIRD LANGE DAUERN,{43}BIS	ER WIEDER GESUND IST.{4E}{47}ICH DENKE,{43}GENERAL ARTHUR WIRD EINEN{43}GUTEN HERRSCHER	ABGEBEN!{4A}"
		ScriptID    $2E0,$2	; Answer 'no':  Run text script at offset 0x027BBA
					; 0xE284: PRINT	MSG 0x02D2, MSGBOX CLEARED, END: "{47}ER HAT JETZT DIE{43}KÖNIGLICHE WACHE UNTER SICH.{43}HAUPTSÄCHLICH	WILL ER	DIE PLÄNE{4E}{47}DES HERZOGS{43}DURCHKREUZEN...{4E}{47}ER WURDE	SCHWER{43}VERLETZT! ES WIRD LANGE DAUERN,{43}BIS ER WIEDER GESUND IST.{4E}{47}ICH DENKE,{43}GENERAL ARTHUR WIRD	EINEN{43}GUTEN HERRSCHER ABGEBEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F2:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2E1,$0	; Run text script at offset 0x027BBC
					; 0xE285: PRINT	MSG 0x02D3, MSGBOX CLEARED, END: "{47}FINDEST DU{43}NICHT AUCH,	DASS LEUTE, DIE	100{43}EKE-EKE AUF EINMAL KAUFEN,{4E}{47}BEKLOPPT{43}SEIN MÜSSEN?{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F3:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $2EA,$1	; Run text script at offset 0x027BCE
					; 0xE28C: PRINT	MSG 0x02DA, MSGBOX CLEARED, END: "{47}DEN ARMREIF{43}ZU	BEKOMMEN, IST DER BEWEIS,{43}DASS MAN WÜRDIG IST,{4E}{47}DEN TURM ZU{43}BETRETEN!{4A}"
					;
		dc.w $16		; Params 00, 16
		ScriptID    $2EB,$3	; Run text script at offset 0x027BD0
					; 0xE28D: PRINT	MSG 0x02DB, MSGBOX CLEARED, END: "{47}IST DAS DER{43}ARMREIF? DU HAST ES WIRKLICH{43}GESCHAFFT?	ALLE ACHTUNG...!!{4E}{47}WENN DU DEN{43}ARMREIF	BEKOMMEN KONNTEST,{43}SOLLTE MIR KEIN PROBLEM SEIN.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F4:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $A4		; Bit 4	of flag	0x014
		ScriptJump  CS_00F4_0,$1 ; Flag	set:   Jump to address 0x026A96
		ScriptID    $2E2,$2	; Flag clear: Run text script at offset	0x027BBE
					; 0x7C6A: LOAD CUSTOM ACTION 0x6A (0x1000001A7 CSA_006A), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F4_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $D2		; Bit 2	of flag	0x01A
		ScriptID    $2E4,$1	; Flag set:   Run text script at offset	0x027BC2
					; 0xE287: PRINT	MSG 0x02D5, MSGBOX CLEARED, END: "{47}GRIHNPIES	IST{43}DER NAME	DES BESITZERS HIER.{4A}"
		ScriptID    $2E3,$2	; Flag clear: Run text script at offset	0x027BC0
					; 0xE286: PRINT	MSG 0x02D4, MSGBOX CLEARED, END: "{47}GLÜCKSSPIELE{43}SIND WIE EINE DROGE! WENN	DU{43}EINMAL ANGEFANGEN	HAST,{4E}{47}KANNST DU{43}NICHT	MEHR AUFHÖREN!...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $2E5,$1	; Run text script at offset 0x027BC4
					; 0xE288: PRINT	MSG 0x02D6, MSGBOX CLEARED, END: "{47}ICH BIN DER{43}KAPITÄN DES SCHIFFES. AN LAND{43}BIN ICH EIN GANZ NORMALER{4E}{47}MENSCH, ABER{43}AUF SEE BIN ICH DER KÖNIG!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2E6,$3	; Run text script at offset 0x027BC6
					; 0xE289: PRINT	MSG 0x02D7, MSGBOX CLEARED, END: "{47}WENN DER LEUCHT-{43}TURM WIEDER FUNKTIONIERT, KANN{43}ICH	WIEDER AN BORD GEHEN.{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2E7,$5	; Run text script at offset 0x027BC8
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0xE28A: PRINT	MSG 0x02D8, MSGBOX CLEARED, END: "{47}AHOI, MATROSE!{43}SCHON GEHÖRT? DER LEUCHTTURM{43}GEHT WIEDER! ICH BIN WIEDER{4E}{47}KAPITÄN! HA HA!!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F6:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2E9,$0	; Run text script at offset 0x027BCC
					; 0xE28B: PRINT	MSG 0x02D9, MSGBOX CLEARED, END: "{47}DIESES SKELETT{43}HAT VIELE MEINER FREUNDE UMGE-{43}BRACHT! DAS IST MEINE	RACHE!{4E}{47}WENN ER AUS{43}SEINER ZELLE HERAUSKÄME, KÖNNTE{43}ICH ES NICHT MIT IHM AUFNEHMEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0020:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $218,$0	; Run text script at offset 0x027A2A
					; 0xE1D5: PRINT	MSG 0x0223, MSGBOX CLEARED, END: "{47}WIE GEHT ES{43}DIR? ICH BIN JUNA,{43}FAHLS FREUNDIN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $2EC,$1	; Run text script at offset 0x027BD2
					; 0xE28E: PRINT	MSG 0x02DC, MSGBOX CLEARED, END: "{47}DIE WAREN, DIE{43}DU GEKAUFT HAST, WERDEN	MIT DER{43}RECHNUNG DIREKT ZU DEINEM{4E}{47}LADEN{43}GESCHICKT.	VIELEN DANK!{4A}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_00F7_0,$3 ; Jump	to address 0x026ACE
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F7_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $D9		; Bit 1	of flag	0x01B
		ScriptID    $69A,$1	; Flag set:   Run text script at offset	0x02832E
					; 0x18F7: LOAD CHARACTER SCRIPT	* (0x00F7)
					; 0xE4CD: PRINT	MSG 0x051B, MSGBOX CLEARED, END: "{47}NIELS, ALLES{43}IN ORDNUNG? BIST DU EINE{43}LANDRATTE? ÜBERGIB DICH NICHT{4E}{47}AUF MEINEM{43}SCHÖNEN, NEUEN DECK!{4A}"
		ScriptID    $2ED,$2	; Flag clear: Run text script at offset	0x027BD4
					; 0x7CD1: LOAD CUSTOM ACTION 0xD1 (0x100000343 CSA_00D1), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F8:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2EE,$0	; Run text script at offset 0x027BD6
					; 0xE28F: PRINT	MSG 0x02DD, MSGBOX CLEARED, END: "{47}DAS IST{43}HERZOG	MERKATORS PRIVAT-PIER.{43}DA KANNST DU NICHT DRAUF.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $F			; Params 00, 0F
		ScriptID    $2EF,$1	; Run text script at offset 0x027BD8
					; 0xE290: PRINT	MSG 0x02DE, MSGBOX CLEARED, END: "{47}WILLKOMMEN{43}IM SCHLOSS VON MERKATOR!{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptJump  CS_00F9_0,$3 ; Jump	to address 0x026AFE
					;
		dc.w $17		; Params 00, 17
		ScriptID    $2F2,$5	; Run text script at offset 0x027BDE
					; 0xE293: PRINT	MSG 0x02E1, MSGBOX CLEARED, END: "{47}NIELS!{43}WILLKOMMEN ZU HAUSE! DEM HIMMEL{43}SEI DANK{3F}{4E}{47}DIE GÖTTIN HAT{43}MEIN GEBET ERHÖRT!{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptJump  CS_00F9_1,$7 ; Jump	to address 0x026B0A
					;
		dc.w $19		; Params 00, 19
		ScriptID    $2F5,$9	; Run text script at offset 0x027BE4
					; 0xE296: PRINT	MSG 0x02E4, MSGBOX CLEARED, END: "{47}ALL DIE ANDEREN{43}SOLDATEN SIND MIT DEM HERZOG{43}IRGENDWOHIN MARSCHIERT.{4E}{47}ICH BIN	ALS{43}EINZIGER	HIER GEBLIEBEN...{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2F6,$B	; Run text script at offset 0x027BE6
					; 0xE297: PRINT	MSG 0x02E5, MSGBOX CLEARED, END: "{47}ICH BIN NICHT{43}ALS SOLDAT GEEIGNET. ICH	WERDE{43}NUN GENERAL ARTHUR HELFEN.{4E}{47}PASS	AUF{43}DICH AUF!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F9_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D4		; Bit 4	of flag	0x01A
		ScriptID    $2F0,$1	; Flag clear: Run text script at offset	0x027BDA
					; 0xE291: PRINT	MSG 0x02DF, MSGBOX CLEARED, END: "{47}NIELS!{43}HUT AB VOR DIR!{43}DU BIST MEIN	VORBILD!!{4E}{47}BITTE,	BITTE,{43}KOMM GESUND UND HEIL WIEDER!{43}VIEL GLÜCK...!{4A}"
		ScriptID    $2F1,$2	; Flag set:   Run text script at offset	0x027BDC
					; 0xE292: PRINT	MSG 0x02E0, MSGBOX CLEARED, END: "{47}BITTE KOMM GESUND{43}UND HEIL ZURÜCK!{43}ICH WERDE FÜR DICH BETEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F9_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E8		; Bit 0	of flag	0x01D
		ScriptID    $2F3,$1	; Flag clear: Run text script at offset	0x027BE0
					; 0xE294: PRINT	MSG 0x02E2, MSGBOX CLEARED, END: "{47}NIELS!{43}ICH DACHTE, DU WÄRST...{43}DER HERZOG UND SEINE	SELTSAMEN{4E}{47}SOLDATEN{43}HABEN PLÖTZLICH...{4A}"
		ScriptID    $2F4,$2	; Flag set:   Run text script at offset	0x027BE2
					; 0xE295: PRINT	MSG 0x02E3, MSGBOX CLEARED, END: "{47}SCHRECKLICH...!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00FA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $F			; Params 00, 0F
		ScriptID    $2F7,$1	; Run text script at offset 0x027BE8
					; 0xE298: PRINT	MSG 0x02E6, MSGBOX CLEARED, END: "{47}SCHÖNER{43}SCHLOSSGARTEN,	NICHT? DER{43}GÄRTNER MUSS SEHR	GUT SEIN.{4E}{47}MÖCHTEST DU IHN{43}GERNE SEHEN? ÜBERRASCHUNG!!{43}...ICH BIN'S, HI, HI, HI...{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2F8,$3	; Run text script at offset 0x027BEA
					; 0xE299: PRINT	MSG 0x02E7, MSGBOX CLEARED, END: "{47}WARUM GEHT DER{43}ORK-KÖNIG ÜBER DIE STRASSE?{4E}{47}WEIL	ER DIE{43}HÜHNCHEN AUF DER ANDEREN{43}SEITE ESSEN WOLLTE. HA!{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $2F9,$5	; Run text script at offset 0x027BEC
					; 0xE29A: PRINT	MSG 0x02E8, MSGBOX CLEARED, END: "{47}JETZT WERDEN DIE{43}STEUERN GESENKT UND ICH KANN{43}HOFFENTLICH MEHR GELD	BEKOMMEN.{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2FA,$7	; Run text script at offset 0x027BEE
					; 0xE29B: PRINT	MSG 0x02E9, MSGBOX CLEARED, END: "{47}MERKWÜRDIG!{43}RIESIGE MONSTER, DIE AUSSAHEN{43}WIE SOLDATEN, FOLGTEN DEM{4E}{47}HERZOG!{43}WIE SELTSAM!.....{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2FB,$9	; Run text script at offset 0x027BF0
					; 0xE29C: PRINT	MSG 0x02EA, MSGBOX CLEARED, END: "{47}ES INTERESSIERT{43}MICH NICHT, WER IM SCHLOSS{43}WOHNT.{4E}{47}ICH PFLEGE{43}NUR DEN GARTEN...{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $F			; Params 00, 0F
		ScriptID    $2FE,$1	; Run text script at offset 0x027BF6
					; 0xE29F: PRINT	MSG 0x02ED, MSGBOX CLEARED, END: "{47}MOMENT,{43}DAS HIER IST DIE KÜCHENTÜR!{43}EIN DISTINGUIERTER BESUCHER{4E}{47}WIE SIE SOLLTE{43}DIE HAUSTÜR BENUTZEN....{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2FF,$3	; Run text script at offset 0x027BF8
					; 0xE2A0: PRINT	MSG 0x02EE, MSGBOX CLEARED, END: "{47}LA-LA-LA...{43}WARUM ICH SO GLÜCKLICH BIN?{43}ICH	HABE IM	GARTEN GEARBEITET{4E}{47}UND GESEHEN,{43}WIE EIN WUNDERSCHÖNER HAAR-{43}SCHMUCK	ZU BODEN GEFALLEN IST{3F}{4E}{47}EIN SEHR{43}TEURER! ICH GLÜCKSPILZ!{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $300,$5	; Run text script at offset 0x027BFA
					; 0xE2A1: PRINT	MSG 0x02EF, MSGBOX CLEARED, END: "{47}HELDEN TRETEN{43}NICHT DURCH DIESE TÜR EIN!{43}BENUTZ BITTE DIE HAUSTÜR?{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $301,$7	; Run text script at offset 0x027BFC
					; 0xE2A2: PRINT	MSG 0x02F0, MSGBOX CLEARED, END: "{47}SELTSAME SOL-{43}DATEN SIND PLÖTZLICH INS	SCHLOSS{43}GESTÜRMT! GENERAL ARTHUR{4E}{47}KÄMPFT ALLEINE{43}GEGEN SIE!	BITTE RETTE IHN!{43}BEEIL DICH!{4A}"
					;
		dc.w $19		; Params 00, 19
		ScriptID    $302,$9	; Run text script at offset 0x027BFE
					; 0xE2A3: PRINT	MSG 0x02F1, MSGBOX CLEARED, END: "{47}WO IST DER{43}HERZOG HIN?	WAS HAT	ER VOR?{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $303,$1	; Run text script at offset 0x027C00
					; 0xE2A4: PRINT	MSG 0x02F2, MSGBOX CLEARED, END: "{47}DIE PARTY	FÄNGT{43}GLEICH	AN. DU KANNST DICH GERN{43}NOCH	ETWAS IM SCHLOSS UMSEHEN.{4A}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $304,$3	; Run text script at offset 0x027C02
					; 0xE2A5: PRINT	MSG 0x02F3, MSGBOX CLEARED, END: "{47}HERR NIELS, DIE{43}PARTY FÄNGT AN. SIE IST IM{43}BANKETT-	SAAL IM	ZWEITEN	STOCK.{4A}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $305,$5	; Run text script at offset 0x027C04
					; 0xE2A6: PRINT	MSG 0x02F4, MSGBOX CLEARED, END: "{47}DU KANNST	JETZT{43}NICHT GEHEN. ES WIRD SCHON{43}DUNKEL.{4E}{47}ES IST ZU	DEINER{43}EIGENEN SICHERHEIT. BITTE RUH{43}DICH	ÜBER NACHT AUS.{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $306,$7	; Run text script at offset 0x027C06
					; 0xE2A7: PRINT	MSG 0x02F5, MSGBOX CLEARED, END: "{47}MIR IST EINE LAST{43}FÜR DEN HERZOG UND DIE STADT.{43}BITTE BESIEG IHN ENDLICH!{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $307,$9	; Run text script at offset 0x027C08
					; 0xE2A8: PRINT	MSG 0x02F6, MSGBOX CLEARED, END: "{47}ICH BIN FROH,{43}DICH WIEDERZUSEHEN! BITTE GEH{43}NACH OBEN,{4E}{47}DER HERZOG{43}MÖCHTE DICH SPRECHEN.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $308,$1	; Run text script at offset 0x027C0A
					; 0xE2A9: PRINT	MSG 0x02F7, MSGBOX CLEARED, END: "{47}DU KANNST{43}HEUTE NICHT AUSGEHEN.{4A}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $309,$3	; Run text script at offset 0x027C0C
					; 0xE2AA: PRINT	MSG 0x02F8, MSGBOX CLEARED, END: "{47}ES IST AN-{43}GERICHTET! GEH BITTE IN DEN{43}BANKETT- SAAL!{4A}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $30A,$5	; Run text script at offset 0x027C0E
					; 0xE2AB: PRINT	MSG 0x02F9, MSGBOX CLEARED, END: "{47}DU KANNST	HEUTE{43}NICHT AUSGEHEN. RUH DICH BITTE{43}IN DEINEM ZIMMER AUS.{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $30B,$7	; Run text script at offset 0x027C10
					; 0xE2AC: PRINT	MSG 0x02FA, MSGBOX CLEARED, END: "{47}WIR ZÄHLEN AUF{43}DICH, DASS DU GESUND UND HEIL{43}ZURÜCKKOMMST!{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $30C,$9	; Run text script at offset 0x027C12
					; 0xE2AD: PRINT	MSG 0x02FB, MSGBOX CLEARED, END: "{47}HERZOG MERKATOR{43}WARTET	AUF DICH!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $30D,$1	; Run text script at offset 0x027C14
					; 0xE2AE: PRINT	MSG 0x02FC, MSGBOX CLEARED, END: "{47}ÜBUNGSRÄUME{43}FÜR DIE SOLDATEN VON HIER.{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptJump  CS_00FE_0,$3 ; Jump	to address 0x026B8C
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FE_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $A1		; Bit 1	of flag	0x014
		ScriptID    $30E,$1	; Flag set:   Run text script at offset	0x027C16
					; 0xE2AF: PRINT	MSG 0x02FD, MSGBOX CLEARED, END: "{47}ENTSCHULDIGE!{43}DIE NEUEN ANGESTELLTEN SIND{43}OFT UNHÖFLICH ZU DEN GÄSTEN...{4E}{47}ICH	MUSS MICH{43}FÜR SIE ENTSCHULDIGEN...{43}BITTE VERZEIH UNS.{4A}"
		ScriptID    $30D,$2	; Flag clear: Run text script at offset	0x027C14
					; 0xE2AE: PRINT	MSG 0x02FC, MSGBOX CLEARED, END: "{47}ÜBUNGSRÄUME{43}FÜR DIE SOLDATEN VON HIER.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00FF:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CB		; Bit 3	of flag	0x019
		ScriptID    $30F,$1	; Flag clear: Run text script at offset	0x027C18
					; 0xE2B0: PRINT	MSG 0x02FE, MSGBOX CLEARED, END: "{47}WENN MAN HIER{43}ARBEITET, SIEHT MAN ADEL	AUS{43}ALLEN MÖGLICHEN LÄNDERN.{4E}{47}ERST NEULICH{43}HABE ICH	PRINZESSIN LARA	VON{43}AHORN KENNENGELERNT{4E}{47}SIE WAR{43}WIRKLICH GOLDIG!{4E}{47}ABER SEITDEM...{43}...NICHTS MEHR!{4A}"
		ScriptID    $310,$2	; Flag set:   Run text script at offset	0x027C1A
					; 0xE2B1: PRINT	MSG 0x02FF, MSGBOX CLEARED, END: "{47}WIR DÜRFEN NICHT{43}MIT DEN GÄSTEN REDEN...{43}BITTE ENTSCHULDIGE	MICH.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0100:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptJump  CS_0100_0,$1 ; Jump	to address 0x026BB2
					;
		dc.w $12		; Params 00, 12
		ScriptID    $313,$3	; Run text script at offset 0x027C20
					; 0xE2B4: PRINT	MSG 0x0302, MSGBOX CLEARED, END: "{47}WAS FÜR EINE{43}ÜBERRASCHUNG! HERR ZACK, DER{43}DRAGONER,	WILL ES	KAUFEN!{4E}{47}HAT MAN ALS{43}KOPFGELDJÄGER EINEN GUTEN	JOB?{43}HMMMMM.....{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0100_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CC		; Bit 4	of flag	0x019
		ScriptID    $311,$1	; Flag clear: Run text script at offset	0x027C1C
					; 0xE2B2: PRINT	MSG 0x0300, MSGBOX CLEARED, END: "{47}DIE GEMÄLDE{43}UND ORNAMENTE IN DIESEM SCHLOSS{43}SIND FÜR IHREN HISTORISCHEN{4E}{47}WERT	BEKANNT.{43}ZUFÄLLIGERWEISE IST	DIESES BILD{43}VON DEM BERÜHMTEN VAN DOCH.{4E}{47}DER HERZOG{43}WÜRDE ES DIR SICHER VERKAUFEN,{43}WENN DU ES GERNE HÄTTEST.{4E}{47}NUR 50,000{43}TALER...ÄUSSERST BILLIG!{4A}"
		ScriptID    $312,$2	; Flag set:   Run text script at offset	0x027C1E
					; 0xE2B3: PRINT	MSG 0x0301, MSGBOX CLEARED, END: "{47}DER HERZOG{43}IST	LEIDENSCHAFTLICHER{43}KUNSTSAMMLER.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0101:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $314,$1	; Run text script at offset 0x027C22
					; 0xE2B5: PRINT	MSG 0x0303, MSGBOX CLEARED, END: "{47}DIESE VILLA IST{43}SO GROSS, DASS	ES ÜBER	EINEN TAG{43}DAUERT, DIE WÄNDE ZU REINIGEN.{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $315,$3	; Run text script at offset 0x027C24
					; 0xE2B6: PRINT	MSG 0x0304, MSGBOX CLEARED, END: "{47}DIE WÄNDE{43}REINIGEN IST	HARTE ARBEIT, UND{43}SO	NEHME ICH MIR DEN TAG FREI!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0102:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $10		; Params 00, 10
		ScriptID    $316,$1	; Run text script at offset 0x027C26
					; 0x7C50: LOAD CUSTOM ACTION 0x50 (0x10000013F CSA_0050), MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $317,$3	; Run text script at offset 0x027C28
					; 0xE2B7: PRINT	MSG 0x0305, MSGBOX CLEARED, END: "{47}HERR DEXTER?{43}NEIN, KEINE AHNUNG, WO ER	SEIN{43}KÖNNTE.	ER WAR SCHON WEG, ALS{4E}{47}ICH SEIN{43}ZIMMER	SAUBER GEMACHT HABE...{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0103:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $318,$0	; Run text script at offset 0x027C2A
					; 0xE2B8: PRINT	MSG 0x0306, MSGBOX CLEARED, END: "{47}DIES IST DEIN{43}DIENSTMÄDCHEN. SIE WIRD DIR{43}DEIN ZIMMER ZEIGEN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0021:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $10		; Params 00, 10
		ScriptJump  CS_0021_0,$1 ; Jump	to address 0x026BEE
					;
		dc.w $13		; Params 00, 13
		ScriptID    $31B,$3	; Run text script at offset 0x027C30
					; 0xE2BB: PRINT	MSG 0x0309, MSGBOX CLEARED, END: "{47}ES GIBT EINE{43}SPERRE AN	DER TÜR	ZU MIRS	TURM.{43}ICH GLAUBE, GENERAL ARTHUR{4E}{47}KENNT EINE{43}MÖGLICHKEIT, TROTZDEM{43}HINEINZUKOMMEN.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0021_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CA		; Bit 2	of flag	0x019
		ScriptID    $319,$1	; Flag clear: Run text script at offset	0x027C2C
					; 0x82B9: PRINT	MSG 0x0307: "{47}EIN BÖSER{43}ZAUBERER QUÄLT DEN HERZOG.{43}DER	HERZOG HAT BIS JETZT{4E}{47}AUS	RÜCKSICHT{43}AUF DIE LEUTE DER STADT EINE{43}DIREKTE KONFRONTATION{4E}{47}VERMIEDEN...{43}ABER DU WIRST	MEHR DARÜBER{43}BEIM DINNER ERFAHREN.{4E}"
					; 0xE2BA: PRINT	MSG 0x0308, MSGBOX CLEARED, END: "{47}DU BRAUCHST{43}JETZT ETWAS RUHE.{4A}"
		ScriptID    $31A,$2	; Flag set:   Run text script at offset	0x027C2E
					; 0xE2BA: PRINT	MSG 0x0308, MSGBOX CLEARED, END: "{47}DU BRAUCHST{43}JETZT ETWAS RUHE.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0104:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $326,$1	; Run text script at offset 0x027C46
					; 0xE2C5: PRINT	MSG 0x0313, MSGBOX CLEARED, END: "{47}ICH BIN{43}STOLZ AUF MEINEN JOB!{4A}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $327,$3	; Run text script at offset 0x027C48
					; 0xE2C6: PRINT	MSG 0x0314, MSGBOX CLEARED, END: "{47}HERR NIELS,{43}WÜRDEST DU	BITTE IN DEN{43}BANKETT-SAAL GEHEN?{4A}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $328,$5	; Run text script at offset 0x027C4A
					; 0xE2C7: PRINT	MSG 0x0315, MSGBOX CLEARED, END: "{47}ICH BIN STOLZ{43}AUF MEINEN JOB!{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $329,$7	; Run text script at offset 0x027C4C
					; 0xE2C8: PRINT	MSG 0x0316, MSGBOX CLEARED, END: "{47}GUTEN MORGEN,{43}HERR NIELS!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0105:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $32A,$1	; Run text script at offset 0x027C4E
					; 0xE2C9: PRINT	MSG 0x0317, MSGBOX CLEARED, END: "{47}WIR MÜSSEN{43}UNS	JEDEN TAG UM VIPS KÜMMERN.{43}MANCHMAL NERVT DAS GANZ SCHÖN.{4A}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $32B,$3	; Run text script at offset 0x027C50
					; 0xE2CA: PRINT	MSG 0x0318, MSGBOX CLEARED, END: "{47}VIEL SPASS{43}BEI	DER PARTY!{4A}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $32C,$5	; Run text script at offset 0x027C52
					; 0xE2CB: PRINT	MSG 0x0319, MSGBOX CLEARED, END: "{47}WIR MÜSSEN{43}UNS	JEDEN TAG UM VIPS KÜMMERN.{43}DAS ZERRT	AN MEINEN NERVEN...{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $32D,$7	; Run text script at offset 0x027C54
					; 0xE2CC: PRINT	MSG 0x031A, MSGBOX CLEARED, END: "{47}HERR ZACK	UND{43}HERR DEXTER SIND	SCHON GANZ{43}FRÜH HEUTE MORGEN	LOS.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0106:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $32E,$1	; Run text script at offset 0x027C56
					; 0xE2CD: PRINT	MSG 0x031B, MSGBOX CLEARED, END: "{47}TUT MIR LEID,{43}ABER WIR	SIND MIT VORBEREITUNGEN{43}FÜR DIE PARTY BESCHÄFTIGT.{4A}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $32F,$3	; Run text script at offset 0x027C58
					; 0xE2CE: PRINT	MSG 0x031C, MSGBOX CLEARED, END: "{47}ALLE WARTEN{43}SCHON. KOMM HEREIN.{4A}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $330,$5	; Run text script at offset 0x027C5A
					; 0xE2CF: PRINT	MSG 0x031D, MSGBOX CLEARED, END: "{47}TUT MIR LEID,{43}ABER HERZOG MERKATOR IST	SCHON{43}ZU BETT GEGANGEN.{4E}{47}ER FÜHLT SICH{43}HEUTE ABEND NICHT GUT...{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $331,$7	; Run text script at offset 0x027C5C
					; 0xE2D0: PRINT	MSG 0x031E, MSGBOX CLEARED, END: "{47}HERR ZACK	IST{43}SCHON EIN WEILCHEN WEG...{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0107:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $332,$1	; Run text script at offset 0x027C5E
					; 0xE2D1: PRINT	MSG 0x031F, MSGBOX CLEARED, END: "{47}KLÄFF, KLÄFF...{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $333,$3	; Run text script at offset 0x027C60
					; 0xE2D2: PRINT	MSG 0x0320, MSGBOX CLEARED, END: "{47}WAU-WAU!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0108:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $334,$1	; Run text script at offset 0x027C62
					; 0xE2D3: PRINT	MSG 0x0321, MSGBOX CLEARED, END: "{47}ICH GEHÖRE ZUR{43}KÖNIGLICHEN WACHE DES HERZOGS.{43}ICH SCHÜTZE IHN{4E}{47}MIT MEINEM LEBEN!{4A}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $335,$3	; Run text script at offset 0x027C64
					; 0xE2D4: PRINT	MSG 0x0322, MSGBOX CLEARED, END: "{47}DER HERZOG{43}IST	EIN FEINER HERR,{43}NUR	EIN WENIG NERVÖS.{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $336,$5	; Run text script at offset 0x027C66
					; 0xE2D5: PRINT	MSG 0x0323, MSGBOX CLEARED, END: "{47}MAN SAGT,	DASS{43}NOCH KEINER DEN	TURM LEBENDIG{43}VERLASSEN HAT.	SEI VORSICHTIG!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0109:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $337,$1	; Run text script at offset 0x027C68
					; 0xE2D6: PRINT	MSG 0x0324, MSGBOX CLEARED, END: "{47}ICH BIN DAS{43}DIENSTMÄDCHEN DES HERZOGS.{43}FALLS DU ETWAS BRAUCHST,{4E}{47}RUF BITTE EINS{43}DER ANDEREN MÄDCHEN.{4A}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $338,$3	; Run text script at offset 0x027C6A
					; 0xE2D7: PRINT	MSG 0x0325, MSGBOX CLEARED, END: "{47}ES IST ZEIT FÜR{43}DAS DINNER. DER BANKETT-SAAL{43}IST IM	ZWEITEN	STOCK.{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $339,$5	; Run text script at offset 0x027C6C
					; 0xE2D8: PRINT	MSG 0x0326, MSGBOX CLEARED, END: "{47}HERZOG MERKATOR{43}IST MOMENTAN NICHT DA.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $33A,$1	; Run text script at offset 0x027C6E
					; 0xE2D9: PRINT	MSG 0x0327, MSGBOX CLEARED, END: "{47}DAS IST DIE{43}BIBLIOTHEK. ICH BIN GLÜCKLICH,{43}WENN ICH	BÜCHER UM MICH HABE.{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $33B,$3	; Run text script at offset 0x027C70
					; 0xE2DA: PRINT	MSG 0x0328, MSGBOX CLEARED, END: "{47}ES IST FAST UN-{43}MÖGLICH, MIRS TURM ZU BETRETEN.{43}DIE	SPERRE IST NICHT ZU ÖFFNEN.{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $33C,$5	; Run text script at offset 0x027C72
					; 0xE2DB: PRINT	MSG 0x0329, MSGBOX CLEARED, END: "{47}ICH WAR ÜBER-{43}RASCHT, ZU SEHEN, DASS ZWEI{43}SCHRECKLICHE MONSTER EINER{4E}{47}SCHÖNHEIT AUS{43}DEM KELLER GEFOLGT SIND!{43}WER WAR DAS?{4E}{47}WAS HABEN{43}DIE DA GEMACHT?{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $33D,$1	; Run text script at offset 0x027C74
					; 0xE2DC: PRINT	MSG 0x032A, MSGBOX CLEARED, END: "{47}HE, JÜNGELCHEN!{43}BIST DU NEU HIER? WIR HABEN{43}EIN BANKETT HIER, ALSO RAUS!{4E}{47}OH!...BIST DU{43}GAST? ÄH!...ÄH, ÄHM...{43}...ICH BITTE UM VERZEIHUNG!{4A}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $33E,$3	; Run text script at offset 0x027C76
					; 0xE2DD: PRINT	MSG 0x032B, MSGBOX CLEARED, END: "{47}ICH BIN GANZ{43}FERTIG! EIN BANKETT ZU ORGANI-{43}SIEREN IST KEIN	ZUCKERSCHLECKEN!{4A}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $33F,$5	; Run text script at offset 0x027C78
					; 0xE2DE: PRINT	MSG 0x032C, MSGBOX CLEARED, END: "{47}HICKS!...UUPS!{43}ÄH, DIESER SHERRY BRAUCHT{43}NOCH ETWAS	SALZ!...(HICKS!)...{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $340,$1	; Run text script at offset 0x027C7A
					; 0xE2DF: PRINT	MSG 0x032D, MSGBOX CLEARED, END: "{47}WIE ARROGANT{43}SIE IST! SIE HAT MIR GESAGT:{43}"ICH MACHE GERADE	EINE DIÄT.{4E}{47}BRINGEN SIE{43}MIR EIN SPEZIELLES MENÜ OHNE{43}FLEISCH UND FISCH!"{4E}{47}ICH	KANN SIE{43}NICHT AUSSTEHEN!{43}ABER GAST IST GAST...{4A}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $341,$3	; Run text script at offset 0x027C7C
					; 0xE2E0: PRINT	MSG 0x032E, MSGBOX CLEARED, END: "{47}ICH MAG SIE{43}NICHT! SIE	HINTERLÄSST IHR{43}ZIMMER UNAUFGERÄUMT,	UND IHR{4E}{47}BADEZIMMER{43}IST IMMER TOTAL NASS. WAS FÜR{43}EINE SCHLECHT ERZOGENE FRAU!{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $342,$5	; Run text script at offset 0x027C7E
					; 0xE2E1: PRINT	MSG 0x032F, MSGBOX CLEARED, END: "{47}WIR SIND{43}ANGEHALTEN, NICHT MIT	DEN{43}	GÄSTEN ZU REDEN.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $343,$1	; Run text script at offset 0x027C80
					; 0xE2E2: PRINT	MSG 0x0330, MSGBOX CLEARED, END: "{47}WIR BEKOMMEN{43}DIE RESTE	NACH DEM BANKETT{43}ZU ESSEN.{4E}{47}DAS IST{43}UNSERE EINZIGE FREUDE IN{43}DIESEM JOB.{4A}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $344,$3	; Run text script at offset 0x027C82
					; 0xE2E3: PRINT	MSG 0x0331, MSGBOX CLEARED, END: "{47}GIBT'S NOCH{43}VIELE RESTE DA DRINNEN?{43}OH, GLÜCK GEHABT!{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $345,$5	; Run text script at offset 0x027C84
					; 0xE2E4: PRINT	MSG 0x0332, MSGBOX CLEARED, END: "{47}ICH BIN SO SATT!{43}HAST DU DAS ROAST BEEF DA{43}GESEHEN?	ICH HABE{4E}{47}VIEL ZU	VIEL{43}GEGESSEN! NIE WIEDER! ÄH,...{43}WANN IST DAS NÄCHSTE BANKETT?{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptJump  CS_010E_0,$1 ; Jump	to address 0x026CC8
					;
		dc.w $12		; Params 00, 12
		ScriptID    $348,$3	; Run text script at offset 0x027C8A
					; 0xE2E7: PRINT	MSG 0x0335, MSGBOX CLEARED, END: "{47}ICH MACHE{43}SCHON SEIT HEUTE MORGEN{43}EINE PAUSE! HI HI	HI...{4A}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $349,$5	; Run text script at offset 0x027C8C
					; 0xE2E8: PRINT	MSG 0x0336, MSGBOX CLEARED, END: "{47}WAS?{43}DIE PARTY	IST VORBEI? AHHH....{43}PAUSE!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010E_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CD		; Bit 5	of flag	0x019
		ScriptID    $346,$1	; Flag clear: Run text script at offset	0x027C86
					; 0xE2E5: PRINT	MSG 0x0333, MSGBOX CLEARED, END: "{47}HUCH!{43}ENTSCHULDIGUNG! ICH BIN...OH{43}...WER BIST DENN	DU?{4E}{47}ICH DACHTE,{43}DU WÄREST MEIN BOSS.{43}ER SCHIMPFT IMMER MIT	MIR...{4A}"
		ScriptID    $347,$2	; Flag set:   Run text script at offset	0x027C88
					; 0xE2E6: PRINT	MSG 0x0334, MSGBOX CLEARED, END: "{47}ICH MACHE{43}JETZT EINE PAUSE.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_010F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $34A,$1	; Run text script at offset 0x027C8E
					; 0xE2E9: PRINT	MSG 0x0337, MSGBOX CLEARED, END: "{47}DIESER EINTOPF{43}MUSS SEHR GUT SEIN! ER HAT{43}DREI TAGE	GEKÖCHELT!{4A}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $34B,$3	; Run text script at offset 0x027C90
					; 0xE2EA: PRINT	MSG 0x0338, MSGBOX CLEARED, END: "{47}BANKETTE SIND{43}EINE GUTE GELEGENHEIT, MEINE{43}FÄHIGKEITEN ALS KOCH ZU ZEIGEN!{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $34C,$5	; Run text script at offset 0x027C92
					; 0xE2EB: PRINT	MSG 0x0339, MSGBOX CLEARED, END: "{47}ICH WAR SEHR{43}ENTTÄUSCHT, WEIL FAST NIEMAND{43}SEINEN TELLER LEERGEGESSEN HAT!{4E}{47}WAS IST{43}DA DRINNEN LOS?{4A}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $34D,$7	; Run text script at offset 0x027C94
					; 0xE2EC: PRINT	MSG 0x033A, MSGBOX CLEARED, END: "{47}WANN KOMMT{43}DERHERZOG ZURÜCK? ICH MUSS{43}DIE SPEISENFOLGE PLANEN.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0110:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $34E,$1	; Run text script at offset 0x027C96
					; 0xE2ED: PRINT	MSG 0x033B, MSGBOX CLEARED, END: "{47}WIR HABEN{43}GEBACKENE GAMOOR-HUMMER UND{43}MUSCHELN! FISCH GEHÖRT{4E}{47}ZU DEN{43}LIEBLINGSSPEISEN DES HERZOGS.{4A}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $34F,$3	; Run text script at offset 0x027C98
					; 0xE2EE: PRINT	MSG 0x033C, MSGBOX CLEARED, END: "{47}WIE WAR DAS{43}DINNER? DAS MENÜ WAR AUS-{43}GEZEICHNET, NICHT WAHR?{4E}{47}ICH WÄRE SO{43}GERNE MIT DIR ZU DEM BANKETT{43}GEGANGEN...WAS?{4E}{47}DU HAST NICHTS{43}GEGESSEN! WARUM NICHT?{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0111:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $350,$1	; Run text script at offset 0x027C9A
					; 0xE2EF: PRINT	MSG 0x033D, MSGBOX CLEARED, END: "{47}HERR ZACK	ISST{43}NUR ROHES FLEISCH?{43}DAS WUSSTE ICH NICHT!...{4A}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $351,$3	; Run text script at offset 0x027C9C
					; 0xE2F0: PRINT	MSG 0x033E, MSGBOX CLEARED, END: "{47}HABEN HERRN{43}ZACK DIE GEBACKENEN{43}HUMMER GESCHMECKT?{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0112:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptJump  CS_0112_0,$1 ; Jump	to address 0x026D18
					;
		dc.w $12		; Params 00, 12
		ScriptID    $356,$3	; Run text script at offset 0x027CA6
					; 0xE2F3: PRINT	MSG 0x0341, MSGBOX CLEARED, END: "{47}BITTE GEH	IN DEN{43}BANKETT-SAAL.	ER BEFINDET SICH{43}IM ZWEITEN STOCK.{4A}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $357,$5	; Run text script at offset 0x027CA8
					; 0xE2F4: PRINT	MSG 0x0342, MSGBOX CLEARED, END: "{47}DU KANNST{43}DOCH	JETZT NOCH NICHT GEHEN...{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0112_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $CE		; Bit 6	of flag	0x019
		ScriptID    $354,$1	; Flag set:   Run text script at offset	0x027CA2
					; 0x1493: SET BIT 3 OF FLAG 0x012
					; 0xE2F2: PRINT	MSG 0x0340, MSGBOX CLEARED, END: "{47}HERR NIELS! DIE{43}PARTY FÄNGT JETZT AN. GEHST{43}DU BITTE IN DEN	BANKETT-SAAL?{4A}"
		ScriptID    $352,$2	; Flag clear: Run text script at offset	0x027C9E
					; 0x14DB: SET BIT 3 OF FLAG 0x01B
					; 0xE2F1: PRINT	MSG 0x033F, MSGBOX CLEARED, END: "{47}HAST DU DICH{43}IM SCHLOSS UMGESEHEN?{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0113:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $358,$0	; Run text script at offset 0x027CAA
					; 0xE2F5: PRINT	MSG 0x0343, MSGBOX CLEARED, END: "{47}VOR LANGER ZEIT{43}TOBTE EIN KRIEG AUF DEM FEST-{43}LAND.	KÖNIG NOLO HAT DIESE{4E}{47}INSEL ALS STÜTZ-{43}PUNKT BENUTZT. ALS DER KRIEG{43}ZU ENDE	WAR, WURDEN DIE{4E}{47}FESTUNGEN UND{43}LABYRINTHE EINFACH VERLASSEN,{43}WOVON VIELE NOCH HEUTE	STEHEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0114:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $359,$0	; Run text script at offset 0x027CAC
					; 0xE2F6: PRINT	MSG 0x0344, MSGBOX CLEARED, END: "{47}DER BÖSE ZAUBE-{43}RER IM	TURM IST SEHR SCHLAU!{43}DER TURM SELBER SIEHT WIE EIN{4E}{47}MEHRSTÖCKIGES{43}LABYRINTH AUS. UND EINE SPERRE{43}SCHÜTZT IHN VOR EINDRINGLINGEN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0115:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $35A,$0	; Run text script at offset 0x027CAE
					; 0xE2F7: PRINT	MSG 0x0345, MSGBOX CLEARED, END: "{47}ICH HABE HEUTE{43}EXTRA-GELD BEKOMMEN! WILLST DU{43}MIT ZU GRIHNPIES GEHEN UND{4E}{47}ZUSEHEN,{43}WIE ICH	ES VERDOPPELN WERDE?{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0116:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $35B,$1	; Run text script at offset 0x027CB0
					; 0xE2F8: PRINT	MSG 0x0346, MSGBOX CLEARED, END: "{47}OH, DAS TUT{43}MIR LEID! WIR DACHTEN, DU WÄRST{43}EINER UNSERER SOLDATEN!{4E}{47}HABEN WIR DICH{43}ERSCHRECKT?{4E}{47}WIR	MÜSSEN{43}JEDEN	TAG NEUE TAKTIKEN{43}LERNEN!{4A}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $35C,$3	; Run text script at offset 0x027CB2
					; 0xE2F9: PRINT	MSG 0x0347, MSGBOX CLEARED, END: "{47}DIE ANDEREN{43}SOLDATEN DREHEN DRAUSSEN IHRE{43}RUNDEN.{4A}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $35D,$5	; Run text script at offset 0x027CB4
					; 0xE2FA: PRINT	MSG 0x0348, MSGBOX CLEARED, END: "{47}ALLE SIND{43}DRAUSSEN BEIM TRAINING. ICH?{43}TJA,	NUN, ÄH...ÄHM..{4E}{47}I-ICH PASSE{43}AUF DEN LADEN AUF,{43}WÄHREND DIE	ANDEREN	WEG SIND!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0117:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $35E,$0	; Run text script at offset 0x027CB6
					; 0xE2FB: PRINT	MSG 0x0349, MSGBOX CLEARED, END: "{47}DAS IST DIE{43}NEUESTE FORMATION!{43}WIE GEFÄLLT SIE DIR?{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0118:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $35F,$0	; Run text script at offset 0x027CB8
					; 0xE2FC: PRINT	MSG 0x034A, MSGBOX CLEARED, END: "{47}WIR HABEN	SIE{43}DEN BEWEGUNGEN DER MONSTER,{43}DIE WIR IN DER HÖHLE{4E}{47}GESEHEN{43} HABEN, NACHGEBILDET.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0119:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $360,$0	; Run text script at offset 0x027CBA
					; 0xE2FD: PRINT	MSG 0x034B, MSGBOX CLEARED, END: "{47}STÖR JETZT{43}NICHT! ES IST ZWAR NUR EINE{43}ÜBUNG, ERFORDERT ABER{4E}{47}TROTZDEM{43}KONZENTRATION!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011A:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $361,$0	; Run text script at offset 0x027CBC
					; 0xE2FE: PRINT	MSG 0x034C, MSGBOX CLEARED, END: "{47}AUS DEM WEG,{43}KINDCHEN!	DAS HIER IST ERNST.{43}FÜR MICH	STEHEN 60 TALER{4E}{47}BEI DIESEM{43}KAMPF AUF DEM SPIEL.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011B:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2FC,$0	; Run text script at offset 0x027BF2
					; 0xE29D: PRINT	MSG 0x02EB, MSGBOX CLEARED, END: "{47}KI-KE-RI-KI!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011C:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2FD,$0	; Run text script at offset 0x027BF4
					; 0xE29E: PRINT	MSG 0x02EC, MSGBOX CLEARED, END: "{47}GACK-GACK{43}GAAAAACK....{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011D:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $374,$0	; Run text script at offset 0x027CE2
					; 0xE309: PRINT	MSG 0x0357, MSGBOX CLEARED, END: "{47}DIESES ZIMMER{43}IST FÜR BESONDERE GÄSTE{43}RESERVIERT.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0022:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $17		; Params 00, 17
		ScriptID    $37F,$1	; Run text script at offset 0x027CF8
					; 0x7CA5: LOAD CUSTOM ACTION 0xA5 (0x100000293 CSA_00A5), MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $601,$3	; Run text script at offset 0x0281FC
					; 0xE481: PRINT	MSG 0x04CF, MSGBOX CLEARED, END: "{47}BITTE HOLE DIE{43}PRINZESSIN VOM HERZOG MERKATOR{43}ZURÜCK!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_011E:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D0		; Bit 0	of flag	0x01A
		ScriptID    $380,$1	; Flag clear: Run text script at offset	0x027CFA
					; 0x8313: PRINT	MSG 0x0361: "{47}DAS HERUMLAUFEN{43}IN DIESEM KELLER HAT UNS VÖLLIG{43}MÜDE GEMACHT! BITTE GEH WEITER{4E}"
					; 0xE314: PRINT	MSG 0x0362, MSGBOX CLEARED, END: "{47}UND RETTE	DIE{43}PRINZESSIN. DER HERZOG HÄLT{43}FRÄULEIN LARA GEFANGEN...{4E}{47}...DU MUSST{43}SIE FINDEN!{4A}"
		ScriptID    $381,$2	; Flag set:   Run text script at offset	0x027CFC
					; 0xE314: PRINT	MSG 0x0362, MSGBOX CLEARED, END: "{47}UND RETTE	DIE{43}PRINZESSIN. DER HERZOG HÄLT{43}FRÄULEIN LARA GEFANGEN...{4E}{47}...DU MUSST{43}SIE FINDEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $398,$1	; Run text script at offset 0x027D2A
					; 0xE324: PRINT	MSG 0x0372, MSGBOX CLEARED, END: "{47}BIST DU TOURIST?{43}GEH LIEBER WIEDER ZURÜCK. ALL{43}DIE LEUTE AUS DER STADT{4E}{47}WURDEN PLÖTZLICH{43}VON SELTSAMEN SOLDATEN IN	DIE{43}BERGE MITGENOMMEN. ICH HABE{4E}{47}DAMALS IM MEER{43}GEANGELT. DIE EINZIGEN, DIE{4E}{47}ÜBRIG SIND,{43}SIND EIN PRIESTER	UND EIN{43}ALTER, KRANKER MANN...{4A}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $399,$3	; Run text script at offset 0x027D2C
					; 0xE325: PRINT	MSG 0x0373, MSGBOX CLEARED, END: "{47}ICH HABE GEHÖRT,{43}DU HAST DIE LEUTE DIESER STADT{43}GERETTET! BRAVO! GUT GEMACHT!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0023:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $39A,$1	; Run text script at offset 0x027D2E
					; 0xE326: PRINT	MSG 0x0374, MSGBOX CLEARED, END: "{47}...HUST...HUST...{4A}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $39B,$3	; Run text script at offset 0x027D30
					; 0xE327: PRINT	MSG 0x0375, MSGBOX CLEARED, END: "{47}DAS MUSS EIN{43}WUNDER SEIN!  ICH	WAR PLÖTZLICH{43}GESUND	UND SAH, WIE SIE ALLE{4E}{47}HEIL UND SICHER{43}ZURÜCKKAMEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0024:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $39C,$1	; Run text script at offset 0x027D32
					; 0xE328: PRINT	MSG 0x0376, MSGBOX CLEARED, END: "{47}WARUM HAT{43}HERZOG MERKATOR ALL DIE LEUTE{43}MITGENOMMEN?...{4A}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $39D,$3	; Run text script at offset 0x027D34
					; 0xE329: PRINT	MSG 0x0377, MSGBOX CLEARED, END: "{47}ICH BIN FROH,{43}DASS ALLES WIEDER{43}WIE	FRÜHER IST...{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0120:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  loc_26DC4,$1 ; Jump	to address 0x026DC4
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3A0,$3	; Run text script at offset 0x027D3A
					; 0xE32C: PRINT	MSG 0x037A, MSGBOX CLEARED, END: "{47}ENDLICH! DIE{43}ERLÖSUNG!	NIE MEHR GRABEN{43}MÜSSEN!{4E}{47}JETZT	KANN{43}ICH WIEDER MEINE ALTE{43}ARBEIT	TUN.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26DC4:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $135		; Bit 5	of flag	0x026
		ScriptID    $39F,$1	; Flag set:   Run text script at offset	0x027D38
					; 0xE32B: PRINT	MSG 0x0379, MSGBOX CLEARED, END: "{47}WIR SIND ALLE{43}AUS VERLA. DER HERZOG ZWANG{43}UNS, DIESE MINE ZU GRABEN.{4E}{47}UNSERE FAMILIEN{43}WURDEN AUCH VON SEINEN{43}SOLDATEN GEFANGEN GENOMMEN...{4E}{47}...BITTE{43}RETTE SIE!{4E}{47}DIESE MINE{43}BESTEHT AUS DREI SICH GABELNDEN{43}TUNNELN. DU WIRST UNSERE{4E}{47}FREUNDE IN{43}DEN ANDEREN TUNNELN FINDEN.{43}BITTE HILF UNS!{4A}"
		ScriptID    $39E,$2	; Flag clear: Run text script at offset	0x027D36
					; 0xE32A: PRINT	MSG 0x0378, MSGBOX CLEARED, END: "{47}KNÖPF DIR{43}DIE MONSTER VOR, BITTE!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0121:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0121_0,$1 ; Jump	to address 0x026DDE
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3A3,$3	; Run text script at offset 0x027D40
					; 0xE32F: PRINT	MSG 0x037D, MSGBOX CLEARED, END: "{47}WARUM HAT{43}HERZOG MERKATOR NUR SO ETWAS{43}SCHRECKLICHES GETAN?{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0121_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $135		; Bit 5	of flag	0x026
		ScriptID    $3A2,$1	; Flag set:   Run text script at offset	0x027D3E
					; 0xE32E: PRINT	MSG 0x037C, MSGBOX CLEARED, END: "{47}HERZOG MERKATOR{43}TAUCHTE PLÖTZLICH IN DER STADT{43}AUF UND{4E}{47}BEFAHL SEINEN{43}HANDLANGERN,	UNS HIERHER{43}ZU BRINGEN.{4E}{47}UND ICH DACHTE,{43}ER	WÄRE EIN GENTLEMAN...{4A}"
		ScriptID    $3A1,$2	; Flag clear: Run text script at offset	0x027D3C
					; 0xE32D: PRINT	MSG 0x037B, MSGBOX CLEARED, END: "{47}IIIIIIHHHHH!!!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0122:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0122_0,$1 ; Jump	to address 0x026DF8
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3A6,$3	; Run text script at offset 0x027D46
					; 0xE332: PRINT	MSG 0x0380, MSGBOX CLEARED, END: "{47}ICH WERDE	NIE{43}DIE ANGST VERGESSEN,{43}DIE ICH IN DEN MINEN HATTE.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0122_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $135		; Bit 5	of flag	0x026
		ScriptID    $3A5,$1	; Flag set:   Run text script at offset	0x027D44
					; 0xE331: PRINT	MSG 0x037F, MSGBOX CLEARED, END: "{47}ICH BIN HALB{43}GESTORBEN	VOR ANGST!{4A}"
		ScriptID    $3A4,$2	; Flag clear: Run text script at offset	0x027D42
					; 0xE330: PRINT	MSG 0x037E, MSGBOX CLEARED, END: "{47}H-HILFE!{43}Z-ZU HILFE!!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0123:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0123_0,$1 ; Jump	to address 0x026E12
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3A9,$3	; Run text script at offset 0x027D4C
					; 0xE335: PRINT	MSG 0x0383, MSGBOX CLEARED, END: "{47}DER HERZOG UND{43}SEINE SOLDATEN SIND NACH DESTEL{43}AUFGEBROCHEN. DIE ZWERGE IN{4E}{47}DER STADT	SIND{43}ALLE FRIEDLICH UND GUTMÜTIG.{43}SIE HABEN NOCH NICHT EINMAL{4E}{47}WAFFEN, UM SICH{43}SELBST ZU	VERTEIDIGEN. ICH{43}FÜRCHTE, DAS GIBT EIN GEMETZEL.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0123_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $136		; Bit 6	of flag	0x026
		ScriptID    $3A8,$1	; Flag set:   Run text script at offset	0x027D4A
					; 0xE334: PRINT	MSG 0x0382, MSGBOX CLEARED, END: "{47}WAS HAT{43}DER HERZOG EIGENTLICH IN DEN{43}MINEN GESUCHT?{4E}{47}WIR MUSSTEN{43}DEN LIEBEN LANGEN	TAG GRABEN,{43}GRABEN UND GRABEN!{4A}"
		ScriptID    $3A7,$2	; Flag clear: Run text script at offset	0x027D48
					; 0xE333: PRINT	MSG 0x0381, MSGBOX CLEARED, END: "{47}UNS GEHT ES{43}GUT! TÖTE IHN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0124:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $3AA,$1	; Run text script at offset 0x027D4E
					; 0xE336: PRINT	MSG 0x0384, MSGBOX CLEARED, END: "{47}GEH!{43}GEH!!....{4A}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3AB,$3	; Run text script at offset 0x027D50
					; 0xE337: PRINT	MSG 0x0385, MSGBOX CLEARED, END: "{47}WAS HAT HERZOG{43}MERKATOR JETZT VOR...?{4E}{47}NIELS! ICH{43}GLAUBE TATSÄCHLICH,	DASS DU{43}DER EINZIGE BIST,{4E}{47}DER	DEN HERZOG{43}BESIEGEN KANN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0125:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0125_0,$1 ; Jump	to address 0x026E3A
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3AE,$3	; Run text script at offset 0x027D56
					; 0xE33A: PRINT	MSG 0x0388, MSGBOX CLEARED, END: "{47}ICH KENNE	DEN{43}BÜRGERMEISTER VON DESTEL. ER{43}KOMMT OFT, UM FISCH ZU KAUFEN.{4E}{47}ER	IST EIN{43}GUTER MENSCH.{4E}{47}ER SAGTE, DASS{43}SIE DORT FRIEDLICH LEBEN,{43}DUFTENDE	BLUMEN ZÜCHTEN...{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0125_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $136		; Bit 6	of flag	0x026
		ScriptID    $3AD,$1	; Flag set:   Run text script at offset	0x027D54
					; 0xE339: PRINT	MSG 0x0387, MSGBOX CLEARED, END: "{47}DER HERZOG{43}MUSS UNS FÜR DEN SCHATZ{43}VERKAUFT	HABEN.{4A}"
		ScriptID    $3AC,$2	; Flag clear: Run text script at offset	0x027D52
					; 0xE338: PRINT	MSG 0x0386, MSGBOX CLEARED, END: "{47}HALT DURCH!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0126:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0126_0,$1 ; Jump	to address 0x026E54
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3B1,$3	; Run text script at offset 0x027D5C
					; 0xE33D: PRINT	MSG 0x038B, MSGBOX CLEARED, END: "{47}DER TUNNEL{43}ZWISCHEN MERKATOR UND VERLA{43}IST ENDLICH WIEDER OFFEN.{4E}{47}ICH	KANN JEDEN{43}TAG ZU GRIHNPIES GEHEN!{4E}{47}ES	GING MIR{43}RICHTIG AN DIE NIEREN, SO{43}LANGE IN DIESEM DUNKLEN{4E}{47}UND ENGEN{43}TUNNEL ZU SEIN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0126_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $137		; Bit 7	of flag	0x026
		ScriptID    $3B0,$1	; Flag set:   Run text script at offset	0x027D5A
					; 0xE33C: PRINT	MSG 0x038A, MSGBOX CLEARED, END: "{47}AUF DER WEST-{43}SEITE DER MINE IST EIN KLEINES{43}DORF. ICH HABE	GESEHEN, WIE{4E}{47}HERZOG MERKATOR{43}MIT SEINEN SOLDATEN DIE STRASSE{43}ZU DIESEM DORF{4E}{47}ENTLANG-{43}MARSCHIERT IST. WEISST DU{43}IRGEND	ETWAS DARÜBER?{4E}{47}WAS IST LOS?{4A}"
		ScriptID    $3AF,$2	; Flag clear: Run text script at offset	0x027D58
					; 0xE33B: PRINT	MSG 0x0389, MSGBOX CLEARED, END: "{47}ER WIRD UNS{43}UMBRINGEN!!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0127:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0127_0,$1 ; Jump	to address 0x026E6E
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3B4,$3	; Run text script at offset 0x027D62
					; 0x7CDF: LOAD CUSTOM ACTION 0xDF (0x10000037B CSA_00DF), MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0127_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $137		; Bit 7	of flag	0x026
		ScriptID    $3B3,$1	; Flag set:   Run text script at offset	0x027D60
					; 0xE33F: PRINT	MSG 0x038D, MSGBOX CLEARED, END: "{47}VIELEN DANK.{43}DU HAST SO TOLL AUSGESEHEN,{43}ALS DU GEKÄMPFT HAST!{4A}"
		ScriptID    $3B2,$2	; Flag clear: Run text script at offset	0x027D5E
					; 0xE33E: PRINT	MSG 0x038C, MSGBOX CLEARED, END: "{47}IIIIIIIHHHH!!!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0128:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0128_0,$1 ; Jump	to address 0x026E88
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3B7,$3	; Run text script at offset 0x027D68
					; 0xE342: PRINT	MSG 0x0390, MSGBOX CLEARED, END: "{47}ICH HABE DAS{43}SCHWERT GEFUNDEN,	ABER ICH HABE{43}ES DEM	HERZOG NICHT ERZÄHLT!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0128_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $137		; Bit 7	of flag	0x026
		ScriptJump  CS_0128_1,$1 ; Flag	set:   Jump to address 0x026E94
		ScriptID    $3B5,$2	; Flag clear: Run text script at offset	0x027D64
					; 0xE340: PRINT	MSG 0x038E, MSGBOX CLEARED, END: "{47}DU SOLLST	NICHT{43}MICH ANSEHEN,...{43}DU	SOLLST DIR IHN SCHNAPPEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0128_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $13D		; Bit 5	of flag	0x027
		ScriptID    $6A8,$1	; Flag set:   Run text script at offset	0x02834A
					; 0x1928: LOAD CHARACTER SCRIPT	* (0x0128)
					; 0xE4D4: PRINT	MSG 0x0522, MSGBOX CLEARED, END: "{47}SIEH!{43}ER WIRD BALD ERÖFFNET!{4A}"
		ScriptID    $3B6,$2	; Flag clear: Run text script at offset	0x027D66
					; 0xE341: PRINT	MSG 0x038F, MSGBOX CLEARED, END: "{47}ICH HABE{43}ZUFÄLLIG MITBEKOMMEN,	WIE DIE{43}MÄNNER VOM HERZOG SAGTEN, DASS{4E}{47}DIE GRABEREI{43}EIN ENDE HÄTTE,{43}WEIL SIE GEFUNDEN HÄTTEN,{4E}{47}WONACH SIE{43}GESUCHT HATTEN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0129:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $3B8,$1	; Run text script at offset 0x027D6A
					; 0xE343: PRINT	MSG 0x0391, MSGBOX CLEARED, END: "{47}WEITERGRABEN!{4A}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3B9,$3	; Run text script at offset 0x027D6C
					; 0xE344: PRINT	MSG 0x0392, MSGBOX CLEARED, END: "{47}ICH HATTE	DIE{43}GANZE ZEIT DAS GEFÜHL, DASS ES{43}SICH NICHT UM EINE{4E}{47}NORMALE MINE{43}HANDELT.{4E}{47}ABER	WER HÄTTE{43}SCHON VERMUTET, DASS DORT EIN{43}LEGENDÄRER SCHATZ	SEIN KÖNNTE!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_012A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $3BA,$1	; Run text script at offset 0x027D6E
					; 0xE345: PRINT	MSG 0x0393, MSGBOX CLEARED, END: "{47}ICH MUSS{43}WEITERMACHEN.	UNSER ALLER{43}LEBEN HÄNGT DAVON AB...{4A}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3BB,$3	; Run text script at offset 0x027D70
					; 0xE346: PRINT	MSG 0x0394, MSGBOX CLEARED, END: "{47}DER TUNNEL IN{43}DER MINE	IST DIE	EINZIGE{43}MÖGLICHKEIT,	NACH DESTEL ZU{4E}{47}KOMMEN.{43}DAS SCHWERT? WIR HABEN	ES{43}ZUFÄLLIG GEFUNDEN, ALS WIR IN{4E}{47}DEM TUNNEL{43}GEGRABEN HABEN.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_012B:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3BC,$0	; Run text script at offset 0x027D72
					; 0xE347: PRINT	MSG 0x0395, MSGBOX CLEARED, END: "{47}ICH KANN DEN{43}MENSCHEN NICHT MEHR VERTRAUEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_012C:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3BD,$0	; Run text script at offset 0x027D74
					; 0xE348: PRINT	MSG 0x0396, MSGBOX CLEARED, END: "{47}MEIN HAUS{43}WURDE VON SOLDATEN GEPLÜNDERT!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0025:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1B		; Params 00, 1B
		ScriptID    $3BE,$1	; Run text script at offset 0x027D76
					; 0xE349: PRINT	MSG 0x0397, MSGBOX CLEARED, END: "{47}WARUM SIND DIE{43}MENSCHEN NUR SO	SCHLECHT{43}ZUEINANDER?! SIE KAMEN AUS{4E}{47}DEM NICHTS{43}UND	TRAMPELTEN MEINE{4E}{47}BLUMENBEETE
					;                                                 {43}NIEDER...WENN SIE DAS JUWEL{43}GESUCHT HÄTTEN,{4E}{47}HÄTTEN SIE{43}MICH	FRAGEN SOLLEN...{4E}{47}JUWEL? JEMAND{43}DER MERKATOR HEISST, HAT ES{43}GEFUNDEN UND MITGENOMMEN.{4E}{47}WARUM WILL ER{43}SO EIN WERTLOSES DING? BLUMEN{43}SIND	VIEL HÜBSCHER ...UND SIE{4E}{47}DUFTEN AUCH{43}NOCH GUT!{4A}"
					;
		dc.w $1C		; Params 00, 1C
		ScriptID    $3BF,$3	; Run text script at offset 0x027D78
					; 0xE34A: PRINT	MSG 0x0398, MSGBOX CLEARED, END: "{47}ICH WAR GERADE{43}IN DER HERBERGE	UND HABE MICH{43}ÜBER DIE ALTE HÖHLE UNTER{4E}{47}DIESER STADT{43}UNTERHALTEN, ALS PLÖTZLICH SO{43}EIN TOURIST HEREINGESTÜRZT KAM,{4E}{47}DIE VERPLOMBTE{43}TÜR	AUFBRACH UND IN	DER{43}HÖHLE VERSCHWAND...{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_012D:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3C0,$0	; Run text script at offset 0x027D7A
					; 0xE34B: PRINT	MSG 0x0399, MSGBOX CLEARED, END: "{47}ICH HABE IN{43}MEINEM GANZEN LEBEN NOCH NIE{43}SO	ETWAS UNGEHOBELTES GESEHEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_012E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1B		; Params 00, 1B
		ScriptID    $3C1,$1	; Run text script at offset 0x027D7C
					; 0xE34C: PRINT	MSG 0x039A, MSGBOX CLEARED, END: "{47}ICH MAG DIE{43}HEKTIK IN DEN GROSSEN STÄDTEN{43}NICHT, DESWEGEN LEBE ICH{4E}{47}HIER GANZ	RUHIG{43}MIT DEN ZWERGEN.{4E}{47}ICH GLAUBE,{43}DASS DIE MENSCHEN ALLE{43}BÖSE SIND.{4A}"
					;
		dc.w $1C		; Params 00, 1C
		ScriptID    $3C2,$3	; Run text script at offset 0x027D7E
					; 0xE34D: PRINT	MSG 0x039B, MSGBOX CLEARED, END: "{47}EINMAL BIN ICH{43}HINUNTERGEGANGEN UND HABE{43}VERSUCHT, IN DIE HÖHLE ZU{4E}{47}SCHAUEN, ABER{43}ES WAR UNMÖGLICH.{4E}{47}ICH GLAUBE NICHT,{43}DASS DU ES	SCHAFFEN KANNST.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0026:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3C3,$0	; Run text script at offset 0x027D80
					; 0xE34E: PRINT	MSG 0x039C, MSGBOX CLEARED, END: "{47}WIR MÖCHTEN{43}EINFACH IN	FRIEDEN	LEBEN...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0027:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3C4,$0	; Run text script at offset 0x027D82
					; 0xE34F: PRINT	MSG 0x039D, MSGBOX CLEARED, END: "{47}ZWERGE SIND{43}ZIEMLICH FROMM.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_012F:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3C5,$0	; Run text script at offset 0x027D84
					; 0xE350: PRINT	MSG 0x039E, MSGBOX CLEARED, END: "{47}ICH HATTE	GROSSE{43}ANGST! DIE SOLDATEN WAREN{43}DOPPELT SO GROSS	WIE ICH!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0028:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3C6,$0	; Run text script at offset 0x027D86
					; 0xE351: PRINT	MSG 0x039F, MSGBOX CLEARED, END: "{47}FREUNDLICHS{43}KRAMLADEN!{4E}{47}ICH BIN IMMER{43}NETT! MEIN BRUDER NICHT...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0130:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3C7,$0	; Run text script at offset 0x027D88
					; 0xE352: PRINT	MSG 0x03A0, MSGBOX CLEARED, END: "{47}WILLKOMMEN{43}IN DER STADT DESTEL.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0131:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1B		; Params 00, 1B
		ScriptID    $3C8,$1	; Run text script at offset 0x027D8A
					; 0xE353: PRINT	MSG 0x03A1, MSGBOX CLEARED, END: "{47}DIESER SCHACHT{43}IST DER	EINGANG	ZU DER ALTEN,{43}VON MONSTERN BEWOHNTEN	HÖHLE.{4A}"
					;
		dc.w $1C		; Params 00, 1C
		ScriptID    $3C9,$3	; Run text script at offset 0x027D8C
					; 0xE354: PRINT	MSG 0x03A2, MSGBOX CLEARED, END: "{47}MANCHMAL,	SPÄT{43}NACHTS,	KANN MAN EIN GROLLEN{43}IN DIESEM SCHACHT HÖREN...{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0132:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3CA,$0	; Run text script at offset 0x027D8E
					; 0xE355: PRINT	MSG 0x03A3, MSGBOX CLEARED, END: "{47}MEIN BLUMENBEET{43}IST GANZ ZERTRAMPELT.....{43}WAS HABEN	SIE BLOSS GESUCHT?{4E}{47}ICH GLAUBE NICHT,{43}DASS SIE	ETWAS BESTIMMTES{43}GESUCHT HABEN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0133:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3CB,$0	; Run text script at offset 0x027D90
					; 0xE356: PRINT	MSG 0x03A4, MSGBOX CLEARED, END: "{47}RIESIGE SOLDATEN{43}DRANGEN IN MEIN HAUS EIN UND{43}WOLLTEN DAS JUWEL HABEN!{4E}{47}WAS MEINTEN{43}DIE ÜBERHAUPT?	ICH HABE NICHTS{43}ALS BLUMENSAMEN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0134:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1B		; Params 00, 1B
		ScriptID    $3CC,$1	; Run text script at offset 0x027D92
					; 0xE357: PRINT	MSG 0x03A5, MSGBOX CLEARED, END: "{47}HERZOG MERKATOR{43}KAM PLÖTZLICH UND HAT MEINE{43}LETZTEN	FLÖSSE GEKAUFT!{4E}{47}ER HAT MIR{43}GANZE 6 TALER DAFÜR GEZAHLT!{43}ER	SAGTE, ER GINGE	ZUM SCHREIN.{4A}"
					;
		dc.w $1C		; Params 00, 1C
		ScriptID    $3CD,$3	; Run text script at offset 0x027D94
					; 0xE358: PRINT	MSG 0x03A6, MSGBOX CLEARED, END: "{47}TUT MIR LEID!{43}ALLES AUSVERKAUFT...DU KANNST{43}AUCH DURCH DIE HÖHLE{4E}{47}UNTER DESTEL{43}ZUM	SCHREIN	KOMMEN,{43}ABER	ES IST GEFÄHRLICH.{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0029:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3CE,$0	; Run text script at offset 0x027D96
					; 0xE359: PRINT	MSG 0x03A7, MSGBOX CLEARED, END: "{47}SCHÖNER WASSER-{43}FALL, WAS? DIE	LEUTE VON{43}DESTEL KÜMMERN SICH{4E}{47}AUCH DARUM,{43}DASS DAS	WASSER SAUBER BLEIBT.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002A:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3CF,$0	; Run text script at offset 0x027D98
					; 0xE35A: PRINT	MSG 0x03A8, MSGBOX CLEARED, END: "{47}ICH KANN GUT{43}VON DEN SCHATZSUCHERN LEBEN,{43}DIE DIESEN SEE BESUCHEN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002B:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3D0,$0	; Run text script at offset 0x027D9A
					; 0xE35B: PRINT	MSG 0x03A9, MSGBOX CLEARED, END: "{47}HE, FREMDER.{43}DU BIST DER ERSTE	BESUCHER{43}SEIT 300 JAHREN.{4E}{47}W-WAS?{43}IST DA OBEN NOCH EIN DIKTATOR{43}AN DIE MACHT GEKOMMEN?{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0135:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3D1,$0	; Run text script at offset 0x027D9C
					; 0xE35C: PRINT	MSG 0x03AA, MSGBOX CLEARED, END: "{47}KÖNIG NOLO HAT{43}UNS DAFÜR, DASS	WIR SEINEN{43}UNTERIRDISCHEN PALAST GEBAUT{4E}{47}HABEN, EWIGE{43}JUGEND GESCHENKT.{4E}{47}ICH MAG DAS{43}RUHIGE LEBEN HIER. ICH MÖCHTE{43}NICHT MEHR ÜBER DER ERDE LEBEN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0136:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3D2,$0	; Run text script at offset 0x027D9E
					; 0xE35D: PRINT	MSG 0x03AB, MSGBOX CLEARED, END: "{47}DU MUSST DURCH{43}EIN GROSSES UND	VERSCHLUNGENES{43}LABYRINTH, UM	IN DEN PALAST{4E}{47}ZU	KOMMEN.{4E}{47}KÖNIG NOLO HAT{43}DAS LABYRINTH SELBST ENTWORFEN.{43}SOGAR FÜR UNS IST ES UNMÖGLICH,{4E}{47}DURCHZUKOMMEN.{4E}{47}WAS WAR ER DOCH{43}FÜR	EIN GIERIGER MANN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002C:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3D3,$0	; Run text script at offset 0x027DA0
					; 0xE35E: PRINT	MSG 0x03AC, MSGBOX CLEARED, END: "{47}ES GIBT KEINEN{43}PRIESTER HIER, ABER ICH	HABE{43}300 JAHRE LANG ÜBER DIE	GÖTTIN{4E}{47}MEDITIERT	UND{43}BIN EIN GUTER ERSATZ.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0137:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3D4,$0	; Run text script at offset 0x027DA2
					; 0xE35F: PRINT	MSG 0x03AD, MSGBOX CLEARED, END: "{47}ICH HABE FÜR{43}KÖNIG NOLO GEARBEITET UND{43}KÖNNTE AUCH EWIG LEBEN.{4E}{47}ABER ZUR ZEIT{43}SITZE ICH NUR MEINE ZEIT AB{45}...{45}...{45}(SEUFZ!)...{4E}{47}HAST	DU{43}COMIC-HEFTE?{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0138:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3D5,$0	; Run text script at offset 0x027DA4
					; 0xE360: PRINT	MSG 0x03AE, MSGBOX CLEARED, END: "{47}ES GIBT DREI{43}MONSTER IN DIESEM	LABYRINTH{43}HIER, DIE "GEHENNAS TORHÜTER"{4E}{47}GENANNT WERDEN.{4E}{47}DU MUSST SIE{43}BESIEGEN, UM DAS TOR ZUM{43}PALAST ÖFFNEN ZU KÖNNEN.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002D:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3D6,$0	; Run text script at offset 0x027DA6
					; 0xE361: PRINT	MSG 0x03AF, MSGBOX CLEARED, END: "{47}HALLO! DER{43}BESITZER DIESES LADENS IST VOR{43}ETWA 200 JAHREN FORTGEGANGEN{4E}{47}UND NICHT MEHR{43} ZURÜCKGEKEHRT.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0139:
		move.w	#$A,d0
		bsr.w	TestFlagBit
		beq.s	CS_0139_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $786,$0	; Run text script at offset 0x028506
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE546: PRINT	MSG 0x0594, MSGBOX CLEARED, END: "{47}BIS BALD!{4A}"
; ---------------------------------------------------------------------------
		bra.s	CS_0139_2
; ---------------------------------------------------------------------------

CS_0139_0:				; CODE XREF: ROM:00026F6Ej
		move.w	#8,d0
		bsr.w	TestFlagBit
		beq.s	CS_0139_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $77F,$0	; Run text script at offset 0x0284F8
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE542: PRINT	MSG 0x0590, MSGBOX CLEARED, END: "{47}VIEL GLÜCK!{4A}"
; ---------------------------------------------------------------------------
		bra.s	CS_0139_2
; ---------------------------------------------------------------------------

CS_0139_1:				; CODE XREF: ROM:00026F7Ej
		move.w	#$132,(g_Character).l

CS_0139_2:				; CODE XREF: ROM:00026F74j
					; ROM:00026F84j
		rts
; ---------------------------------------------------------------------------

CS_013A:
		move.w	#$A,d0
		bsr.w	TestFlagBit
		beq.s	CS_013A_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $786,$0	; Run text script at offset 0x028506
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE546: PRINT	MSG 0x0594, MSGBOX CLEARED, END: "{47}BIS BALD!{4A}"
; ---------------------------------------------------------------------------
		bra.s	CS_013A_2
; ---------------------------------------------------------------------------

CS_013A_0:				; CODE XREF: ROM:00026F98j
		move.w	#8,d0
		bsr.w	TestFlagBit
		beq.s	CS_013A_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $77F,$0	; Run text script at offset 0x0284F8
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE542: PRINT	MSG 0x0590, MSGBOX CLEARED, END: "{47}VIEL GLÜCK!{4A}"
; ---------------------------------------------------------------------------
		bra.s	CS_013A_2
; ---------------------------------------------------------------------------

CS_013A_1:				; CODE XREF: ROM:00026FA8j
		move.w	#$159,(g_Character).l

CS_013A_2:				; CODE XREF: ROM:00026F9Ej
					; ROM:00026FAEj
		rts
; ---------------------------------------------------------------------------

CS_013B:
		move.w	#$A,d0
		bsr.w	TestFlagBit
		beq.s	CS_013B_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $786,$0	; Run text script at offset 0x028506
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE546: PRINT	MSG 0x0594, MSGBOX CLEARED, END: "{47}BIS BALD!{4A}"
; ---------------------------------------------------------------------------
		bra.s	CS_013B_2
; ---------------------------------------------------------------------------

CS_013B_0:				; CODE XREF: ROM:00026FC2j
		move.w	#8,d0
		bsr.w	TestFlagBit
		beq.s	CS_013B_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $77F,$0	; Run text script at offset 0x0284F8
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE542: PRINT	MSG 0x0590, MSGBOX CLEARED, END: "{47}VIEL GLÜCK!{4A}"
; ---------------------------------------------------------------------------
		bra.s	CS_013B_2
; ---------------------------------------------------------------------------

CS_013B_1:				; CODE XREF: ROM:00026FD2j
		move.w	#$135,(g_Character).l

CS_013B_2:				; CODE XREF: ROM:00026FC8j
					; ROM:00026FD8j
		rts
; ---------------------------------------------------------------------------

CS_013C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $790,$1	; Run text script at offset 0x02851A
					; 0xE54B: PRINT	MSG 0x0599, MSGBOX CLEARED, END: "{47}TUT MIR LEID.{43}DIES HIER IST PRIVAT.{43}KEIN ZUTRITT!{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  CS_013C_0,$3 ; Jump	to address 0x026FF2
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

CS_013C_1:				; CODE XREF: ROM:00026FFAj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $794,$0	; Run text script at offset 0x028522
					; 0x193C: LOAD CHARACTER SCRIPT	* (0x013C)
					; 0xE54D: PRINT	MSG 0x059B, MSGBOX CLEARED, END: "{47}WILLKOMMEN IM{43}ARTHURISCHEN KASINO!{43}AMÜSIER DICH GUT!{4A}"
; ---------------------------------------------------------------------------

CS_013C_2:				; CODE XREF: ROM:00027004j
		rts
; ---------------------------------------------------------------------------

CS_013D:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E5		; Bit 5	of flag	0x01C
		ScriptID    $7D5,$1	; Flag clear: Run text script at offset	0x0285A4
					; 0x1BF3: LOAD SPECIAL CHARACTER PIXIE (0x0B)
					; 0xE56C: PRINT	MSG 0x05BA, MSGBOX CLEARED, END: "{47}OH, FLORA!{43}DENK BLOSS,	WIR HABEN UNS{43}256 JAHRE NICHT GESEHEN!{4E}{47}ERINNERST DU{43}DICH AN DIESEN	SCHRECKLICHEN{43}KRIEG MIT KÖNIG NOLO?{4E}{47}WAS? DU SUCHST{43}NACH DEM SCHATZ	VON{43}KÖNIG NOLO?{4E}{47}SEI VORSICHTIG!{43}ER	IST ZWAR TOT,ABER...{4E}{47}ER WÜRDE SICHER{43}AUS SEINEM GRAB KLETTERN,{43}UM SEINEN SCHATZ ZU	SCHÜTZEN.{4A}"
		ScriptID    $7D7,$2	; Flag set:   Run text script at offset	0x0285A8
					; 0x1BF3: LOAD SPECIAL CHARACTER PIXIE (0x0B)
					; 0xE56D: PRINT	MSG 0x05BB, MSGBOX CLEARED, END: "{47}DEIN FREUND{43}IST HÜBSCH, NICHT WAHR?{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_013E:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E6		; Bit 6	of flag	0x01C
		ScriptID    $7D9,$1	; Flag clear: Run text script at offset	0x0285AC
					; 0x1BF4: LOAD SPECIAL CHARACTER TRIXIE	(0x0C)
					; 0x856E: PRINT	MSG 0x05BC: "{47}FLORA,	DU BIST{43}ES! DU BIST WIE IMMER{43}MIT	EINEM JUNGEN UNTERWEGS.{4E}{47}...LASS MAL{43}SEHEN...HMMM...{45}...DER	SIEHT JA{43}HÜBSCH AUS!	WO HAST	DU DEN HER?{4E}"
					; 0x1BE9: LOAD SPECIAL CHARACTER FLORA (0x01)
					; 0x856F: PRINT	MSG 0x05BD: "{47}TRIXIE!{43}ER HAT MIR DAS LEBEN GERETTET!{43}ER IST MEIN...!{4E}"
					; 0x1BF4: LOAD SPECIAL CHARACTER TRIXIE	(0x0C)
					; 0xE570: PRINT	MSG 0x05BE, MSGBOX CLEARED, END: "{47}IST JA SCHON{43}GUT! ENTSCHULDIGUNG!{4A}"
		ScriptID    $7DF,$2	; Flag set:   Run text script at offset	0x0285B8
					; 0x1BF4: LOAD SPECIAL CHARACTER TRIXIE	(0x0C)
					; 0xE571: PRINT	MSG 0x05BF, MSGBOX CLEARED, END: "{47}DU MAGST JUNGEN{43}GERNE,	NICHT WAHR?{4A}"
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
		ScriptID    $375,$1	; Run text script at offset 0x027CE4
					; 0xE30A: PRINT	MSG 0x0358, MSGBOX CLEARED, END: "{47}HE! WIE BIST DU{43}ENTKOMMEN?!!  ICH BIN NOCH{43}NICHT FERTIG MIT	DIR!!{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  CS_002E_0,$3 ; Jump	to address 0x027034
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_002E_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E7		; Bit 7	of flag	0x01C
		ScriptID    $376,$1	; Flag clear: Run text script at offset	0x027CE6
					; 0xE30B: PRINT	MSG 0x0359, MSGBOX CLEARED, END: "{47}AHH! WIR WOLLTEN{43}DOCH NUR DEN KLEINEN,	POPLIGEN{43}SCHATZ! JETZT SIND WIR PLEITE!{4E}{47}NOCH SO EIN{43}MIST, IN DEN DU MICH HINEIN-{43}GEZOGEN HAST!!{4E}{47}DIE EINZIGE{43}MÖGLICHKEIT, ZURÜCK AUFS FEST-
					;                                                 {43}LAND ZU	KOMMEN,	DIE WIR	UNS{4E}{47}LEISTEN{43}KONNTEN, WAR AUF DEM{43}GEFÄNGNISSCHIFF,{4E}{47}ALSO MUSSTE ICH{43}DARUM BITTEN, GEFANGENGENOMMEN{43}ZU WERDEN! BÄH! WAS FÜR EIN{4E}{47}GESTANK!{43}DAS WAR JA NICHT AUSZUHALTEN!{4E}{47}STINKIG...{43}SCHMIERIG...WÜRG!!	WÄRTER!{43}ICH MÖCHTE EINE BESSERE ZELLE!{4A}"
		ScriptID    $377,$2	; Flag set:   Run text script at offset	0x027CE8
					; 0xE30C: PRINT	MSG 0x035A, MSGBOX CLEARED, END: "{47}DAS VERGESSE{43}ICH DIR NIEMALS, NIELS!! EINES{43}TAGES RÄCHE ICH	MICH!!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $12		; Params 00, 12
		ScriptID    $378,$1	; Run text script at offset 0x027CEA
					; 0xE30D: PRINT	MSG 0x035B, MSGBOX CLEARED, END: "{47}...RÜLPS!...{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $379,$3	; Run text script at offset 0x027CEC
					; 0xE30E: PRINT	MSG 0x035C, MSGBOX CLEARED, END: "{47}GIB MIR DEN{43}SCHATZ!{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $37A,$5	; Run text script at offset 0x027CEE
					; 0xE30F: PRINT	MSG 0x035D, MSGBOX CLEARED, END: "{47}STIIIIINKER...{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0030:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $12		; Params 00, 12
		ScriptID    $37B,$1	; Run text script at offset 0x027CF0
					; 0xE310: PRINT	MSG 0x035E, MSGBOX CLEARED, END: "{47}...RÜLLLPS!!...{4A}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $5DD,$3	; Run text script at offset 0x0281B4
					; 0xE46E: PRINT	MSG 0x04BC, MSGBOX CLEARED, END: "{47}HIIILFEEEEE!{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $37C,$5	; Run text script at offset 0x027CF2
					; 0xE311: PRINT	MSG 0x035F, MSGBOX CLEARED, END: "{47}SCHLEIIIIMER...{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0031:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $37D,$0	; Run text script at offset 0x027CF4
					; 0x1831: LOAD CHARACTER SCRIPT	DUX (0x0031)
					; 0xE312: PRINT	MSG 0x0360, MSGBOX CLEARED, END: "{47}OKAY, OKAY!{43}ERSTKLASSIGES FECHTEN...{43}ICH HABE MICH GEIRRT.{4E}{47}DU HAST MICH{43}ÜBERZEUGT!{4E}{47}GEH NUR	UND{43}NIMM DEN	SCHATZ.	HÖR BLOSS{43}AUF, MICH ZU SCHLAGEN!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0032:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $10		; Params 00, 10
		ScriptJump  CS_0032_0,$1 ; Jump	to address 0x027080
					;
		dc.w $11		; Params 00, 11
		ScriptID    $320,$3	; Run text script at offset 0x027C3A
					; 0xE2C0: PRINT	MSG 0x030E, MSGBOX CLEARED, END: "{47}EIN GALA-DINNER!{43}SERVIERT MAN AUCH MEINE LIEB-{43}LINGSSPEISE:	ROHES FLEISCH?{4A}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $321,$5	; Run text script at offset 0x027C3C
					; 0xE2C1: PRINT	MSG 0x030F, MSGBOX CLEARED, END: "{47}WENN DU GERN{43}MÖCHTEST,	KANNST DU DICH MIR{43}MORGEN ANSCHLIESSEN.{4E}{47}DAS MUSS JA{43}LÄSTIG	SEIN, WENN MAN{43}SO KLEIN IST!{4A}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $322,$7	; Run text script at offset 0x027C3E
					; 0x7CFA: LOAD CUSTOM ACTION 0xFA (0x1000003E7 CSA_00FA), MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0032_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C9		; Bit 1	of flag	0x019
		ScriptJump  CS_0032_1,$1 ; Flag	clear: Jump to address 0x02708C
		ScriptID    $31F,$2	; Flag set:   Run text script at offset	0x027C38
					; 0xE2BF: PRINT	MSG 0x030D, MSGBOX CLEARED, END: "{47}DIESES TRAUM-{43}HAFTE SCHLOSS SOLLTE ERKUNDET{43}WERDEN...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0032_1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $31C,$0	; Prompt:	Run text script	at offset 0x027C32
					; 0xA2BC: PRINT	MSG 0x030A, END: "{47}NIELS, HMM...{43}ICH MEINE, ICH HÄTTE DEN	NAMEN{43}SCHON EINMAL GEHÖRT....{4E}{47}ABER NATÜRLICH!{43}DU BIST DER,	DER DIE	STATUE{4E}{47}VON JYPTA{43}GESTOHLEN HAT, ODER?{44}"
		ScriptID    $31D,$1	; Answer 'yes': Run text script at offset 0x027C34
					; 0xE2BD: PRINT	MSG 0x030B, MSGBOX CLEARED, END: "{47}ICH HAB'S{43}GEWUSST! ABER KEINE SORGE...{43}DEIN GEHEIMNIS IST BEI MIR GUT{4E}{47}AUFGEHOBEN.{4A}"
		ScriptID    $31E,$2	; Answer 'no':  Run text script at offset 0x027C36
					; 0xE2BE: PRINT	MSG 0x030C, MSGBOX CLEARED, END: "{47}NA KLAR!{43}EIN ALTER KOPFGELDJÄGER ERKENNT{43}SEINEN DIEBESKOLLEGEN SOFORT!{4E}{47}KEINE	SORGE!{43}DIE 5000 TALER AUF DEINEN KOPF{43}SIND KINDERKRAM FÜR	MICH!{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0033:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $10		; Params 00, 10
		ScriptID    $323,$1	; Run text script at offset 0x027C40
					; 0xE2C2: PRINT	MSG 0x0310, MSGBOX CLEARED, END: "{47}HERZOG MERKATOR{43}WAR EIN BERÜHMTER FECHTER IN{43}GAMOOR. ICH BEWUNDERE IHN.{4A}"
					;
		dc.w $11		; Params 00, 11
		ScriptID    $324,$3	; Run text script at offset 0x027C42
					; 0xE2C3: PRINT	MSG 0x0311, MSGBOX CLEARED, END: "{47}ES IST EINE{43}EHRE, VOM HERZOG EINGELADEN ZU{43}WERDEN! ICH HABE	ÜBER 20	JAHRE{4E}{47}DARAUF GEWARTET{43}...ABER	DU SIEHST NOCH SEHR{43}JUNG AUS! WIE ALT BIST DU?{4A}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $325,$5	; Run text script at offset 0x027C44
					; 0xE2C4: PRINT	MSG 0x0312, MSGBOX CLEARED, END: "{47}ICH WÜRDE	IHM{43}FÜR MEIN	LEBEN GERNE DIENEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0034:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $16		; Params 00, 16
		ScriptID    $383,$1	; Run text script at offset 0x027D00
					; 0xE315: PRINT	MSG 0x0363, MSGBOX CLEARED, END: "{47}DU HAST IHM{43}GEGLAUBT UND BIST EINFACH{43}HERGEKOMMEN...{4E}{47}...WIE{43}AHNUNGSLOS DU	DOCH BIST...!{4A}"
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
		ScriptID    $38E,$1	; Run text script at offset 0x027D16
					; 0xE31C: PRINT	MSG 0x036A, MSGBOX CLEARED, END: "{47}WAU-WAU{4A}"
					;
		dc.w $19		; Params 00, 19
		ScriptID    $38F,$3	; Run text script at offset 0x027D18
					; 0xE31D: PRINT	MSG 0x036B, MSGBOX CLEARED, END: "{47}ICH WERDE	DEINE{43}FREUNDLICHKEIT	NIE VERGESSEN!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0038:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $18		; Params 00, 18
		ScriptID    $390,$1	; Run text script at offset 0x027D1A
					; 0x7CC6: LOAD CUSTOM ACTION 0xC6 (0x100000317 CSA_00C6), MSGBOX CLEARED, END
					;
		dc.w $19		; Params 00, 19
		ScriptID    $62E,$3	; Run text script at offset 0x028256
					; 0xE496: PRINT	MSG 0x04E4, MSGBOX CLEARED, END: "{47}BESUCH MICH{43}MAL WIEDER!{4A}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0039:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DF		; Bit 7	of flag	0x01B
		ScriptID    $67C,$1	; Flag clear: Run text script at offset	0x0282F2
					; 0x84BD: PRINT	MSG 0x050B: "{47}ICH HEISSE{43}KADO. ICH WAR EINMAL EIN{43}BERÜHMTER FECHTER.{4E}{47}DAMALS ARBEITETE{43}ICH IM	SCHLOSS, BIN ABER JETZT{43}IM RUHESTAND.{4E}{47}ICH MAG	DAS{43}STADTLEBEN NICHT.{4E}{47}BIST DU	EIN{43}SCHATZSUCHER? DANN BRAUCHST DU{43}ABER EIN BESSERES SCHWERT{4E}{47}ALS DIES DA...{4E}"
					; 0x0001: LOAD 0x0001 INTO 0xFF1196 (ZAUBER{55}SCHWERT)
					; 0x17E8: RECEIVE ITEM [0xFF1196]
					; 0x1839: LOAD CHARACTER SCRIPT	KADO (0x0039)
					; 0x84BE: PRINT	MSG 0x050C: "{47}ES HAT	EINE{43}SPEZIELLE FÄHIGKEIT. WENN ES{43}VOLL AUFGELADEN	IST, VERBRENNT{4E}{47}EINE MAGISCHE{43}FLAMME JEDEN FEIND,{43}DEN ES BERÜHRT!{4E}"
					; 0xE4BF: PRINT	MSG 0x050D, MSGBOX CLEARED, END: "{47}ICH DENKE, DU{43}WEISST SEHR GUT,	WAS DU AN DEM{43}SCHWERT HAST.{4A}"
		ScriptJump  CS_0039_0,$2 ; Flag	set:   Jump to address 0x0270E0
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0039_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E3		; Bit 3	of flag	0x01C
		ScriptID    $682,$1	; Flag clear: Run text script at offset	0x0282FE
					; 0x84C0: PRINT	MSG 0x050E: "{47}WIE GEFÄLLT{43}ES DIR?{4E}{47}IRGENDWO{43}AUF DIESER INSEL GIBT ES NOCH{43}WEITERE ZAUBERSCHWERTER.{4E}"
					; 0x0403: LOAD 0x0003 INTO 0xFF1198 (DONNER{55}SCHWERT)
					; 0x0802: LOAD 0x0002 INTO 0xFF119A (EIS{55}SCHWERT)
					; 0xE4C1: PRINT	MSG 0x050F, MSGBOX CLEARED, END: "{47}SIE WERDEN{43}{4B} UND{43}{4B} GENANNT ...{4E}{47}ES SOLL	JA{43}NOCH DAS LEGENDÄRE SCHWERT{43}DER	GAIA GEBEN!{4A}"
		ScriptID    $681,$2	; Flag set:   Run text script at offset	0x0282FC
					; 0xE4BF: PRINT	MSG 0x050D, MSGBOX CLEARED, END: "{47}ICH DENKE, DU{43}WEISST SEHR GUT,	WAS DU AN DEM{43}SCHWERT HAST.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_003A:
		move.w	#ITM_SUNSTONE,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	CS_003A_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $38C,$0	; Run text script at offset 0x027D12
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE31B: PRINT	MSG 0x0369, MSGBOX CLEARED, END: "{47}DU HAST DEN{43}{4B}{43}GEFUNDEN!{4E}{47}VIELLEICHT KENNST{43}DU DEN WALD BESSER ALS ICH!{4E}{47}WILLST DU{43}MEINE STELLE	EINNEHMEN?{4A}"
; ---------------------------------------------------------------------------
		bra.s	CS_003A_1
; ---------------------------------------------------------------------------

CS_003A_0:				; CODE XREF: ROM:000270F4j
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D7		; Bit 7	of flag	0x01A
		ScriptID    $384,$1	; Flag clear: Run text script at offset	0x027D02
					; 0x8316: PRINT	MSG 0x0364: "{47}ICH BIN DER{43}ALTE GOL. ICH BIN  WÄCHTER DES{43}GRÜNEN LABYRINTHS.{4E}{47}MEIN VATER WAR{43}AUCH SCHON WÄCHTER.{43}WAS KANN ICH FÜR DICH TUN?{4E}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0x081E: LOAD 0x001E INTO 0xFF119A (SONNEN{55}STEIN)
					; 0x8317: PRINT	MSG 0x0365: "{47}DER {4B},{43}HMM...TJA, DER IST GANZ TIEF IN{43}DIESEM	WALD VERSTECKT,	ABER...{4E}{47}DIE HÄSSLICHEN,{43}KLEINEN ZWERGE, DIE HIER LEBEN,{43}HABEN IHRE	ROUTEN GEÄNDERT.{4E}"
					; 0xA318: PRINT	MSG 0x0366, END: "{47}BRAUCHST DU{43}TIPS, WIE MAN IM WALD VORWÄRTS{43}KOMMT?{44}"
		ScriptID    $388,$2	; Flag set:   Run text script at offset	0x027D0A
					; 0xA318: PRINT	MSG 0x0366, END: "{47}BRAUCHST DU{43}TIPS, WIE MAN IM WALD VORWÄRTS{43}KOMMT?{44}"
; ---------------------------------------------------------------------------
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptJump  CS_NULL,$0	; Prompt:	Jump to	address	0x037024
		ScriptID    $389,$1	; Answer 'yes': Run text script at offset 0x027D0C
					; 0x8319: PRINT	MSG 0x0367: "{47}ERSTENS, SCHAU{43}NIE AUF DIE BAUMWURZELN. WENN{43}DU EINE LÜCKE ZWISCHEN DEN{4E}{47}KRONEN VON ZWEI{43}BAUMREIHEN SIEHST, KÖNNTE DAS{43}EINE ROUTE SEIN. SOLLTEST DU{4E}{47}DORT NICHT WEITER-{43}
					;                            KOMMEN, VERSUCH, HOCHZUHÜPFEN.{43}VOR DIR KÖNNTE EINE VERSTECKTE{4E}{47}STUFE ODER EIN{43}HINDERNIS	SEIN. ES GIBT AUCH{43}UNTERFÜHRUNGEN. MANCHE DAVON{4E}{47}SIND AB-{43}KÜRZUNGEN, ANDERE	HINGEGEN{43}UMWEGE.{4E}{47}DU SOLLTEST DIR{43}DIE UMGEBUNG EINPRÄGEN, BEVOR{43}DU IN EINE UNTERFÜHRUNG GEHST.{4E}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE31A: PRINT	MSG 0x0368, MSGBOX CLEARED, END: "{47}DER {4B}{43}IST IM NORDÖSTLICHEN SEKTOR{43}DIESES	WALDES.{4A}"
		ScriptID    $38A,$2	; Answer 'no':  Run text script at offset 0x027D0E
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (SONNEN{55}STEIN)
					; 0xE31A: PRINT	MSG 0x0368, MSGBOX CLEARED, END: "{47}DER {4B}{43}IST IM NORDÖSTLICHEN SEKTOR{43}DIESES	WALDES.{4A}"
; ---------------------------------------------------------------------------

CS_003A_1:				; CODE XREF: ROM:000270FAj
		rts
; ---------------------------------------------------------------------------

CS_013F:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $382,$0	; Run text script at offset 0x027CFE
					; 0x7C81: LOAD CUSTOM ACTION 0x81 (0x100000203 CSA_0081), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0140:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $391,$0	; Run text script at offset 0x027D1C
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE31E: PRINT	MSG 0x036C, MSGBOX CLEARED, END: "{47}HALLO, FREUT{43}MICH, DICH KENNENZULERNEN.{43}ICH	KANN DICH NICHT	SEHEN, ABER{4E}{47}DU SIEHST{43}GUT AUS. MÖCHTEST DU ETWAS{43}ESSEN?{4E}{47}ICH	KANN DICH{43}NICHT SEHEN, ABER DU SIEHST{43}GLÜCKLICH AUS. BESUCH MICH MAL{4E}{47}WIEDER, WENN{43}DU LUST HAST.{4E}{47}ICH KANN	DICH{43}NICHT SEHEN, ABER DU SIEHST{43}MUTIG AUS.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_003B:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $393,$0	; Run text script at offset 0x027D20
					; 0xE31F: PRINT	MSG 0x036D, MSGBOX CLEARED, END: "{47}GUTEN TAG.{43}MACH ES DIR	BEQUEM.{43}HO HO HO...{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_003C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $394,$1	; Run text script at offset 0x027D22
					; 0xE320: PRINT	MSG 0x036E, MSGBOX CLEARED, END: "{47}WUFF!  WUFF!{43}WAU-WAU-WAU!{4A}"
					;
		dc.w $201		; Params 02, 01
		ScriptID    $397,$3	; Run text script at offset 0x027D28
					; 0xE323: PRINT	MSG 0x0371, MSGBOX CLEARED, END: "{47}ICH MÖCHTE BELL{43}SEHEN!	ICH MÖCHTE BELL	SEHEN!{4A}"
					;
		dc.w $202		; Params 02, 02
		ScriptID    $395,$5	; Run text script at offset 0x027D24
					; 0xE321: PRINT	MSG 0x036F, MSGBOX CLEARED, END: "{47}WIR KÖNNEN NUR{43}ZURÜCKVERWANDELT WERDEN, WENN{43}DIE BÖSE HEXE BESIEGT WIRD.{4A}"
					;
		dc.w $203		; Params 02, 03
		ScriptID    $396,$7	; Run text script at offset 0x027D26
					; 0xE322: PRINT	MSG 0x0370, MSGBOX CLEARED, END: "{47}DANKE NOCHMALS{43}FÜR ALLES, WAS DU GETAN	HAST!{4A}"
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
		ScriptJump  CS_0142_0,$1 ; Flag	set:   Jump to address 0x027150
		ScriptID    $7A4,$2	; Flag clear: Run text script at offset	0x028542
					; 0x14E0: SET BIT 0 OF FLAG 0x01C
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0x8554: PRINT	MSG 0x05A2: "{47}DU BRAUCHST EIN{43}FLOSS. WENN	DU DEN FLUSS HINUN-{43}TER MÖCHTEST, SUCH MEINEN SOHN{4E}"
					; 0x042F: LOAD 0x002F INTO 0xFF1198 (HOLZ)
					; 0xE555: PRINT	MSG 0x05A3, MSGBOX CLEARED, END: "{47}UND BESORG{43}DIR	ETWAS {4B}.{4A}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0142_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $15B		; Bit 3	of flag	0x02B
		ScriptID    $7AC,$1	; Flag set:   Run text script at offset	0x028552
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE557: PRINT	MSG 0x05A5, MSGBOX CLEARED, END: "{47}PASS GUT AUF{43}DICH AUF!{4A}"
		ScriptID    $7A9,$2	; Flag clear: Run text script at offset	0x02854C
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0x042F: LOAD 0x002F INTO 0xFF1198 (HOLZ)
					; 0xE556: PRINT	MSG 0x05A4, MSGBOX CLEARED, END: "{47}DU KANNST	MIT{43}DEM {4B}{43}LOSLEGEN! VIEL GLÜCK!{4A}"
; ---------------------------------------------------------------------------
		rts
