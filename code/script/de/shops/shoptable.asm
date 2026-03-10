		dc.w $254
		dc.b $10
		dc.b 8
		ScriptID    $1,$2	; Run text script at offset 0x0275FC
					; 0xE001: PRINT	MSG 0x004F, MSGBOX CLEARED, END: "{47}KANN ICH{43}DIR HELFEN?{4A}"
		ScriptID    $29,$3	; Run text script at offset 0x02764C
					; 0xE029: PRINT	MSG 0x0077, MSGBOX CLEARED, END: "{47}DANKE!{43}KOMM MAL WIEDER	VORBEI!{4A}"
		ScriptJump  ShopPrice_01,$4 ; Jump to address 0x025BBE
		ScriptJump  Shop_01,$5	; Jump to address 0x025BCC
		ScriptID    $30,$6	; Run text script at offset 0x02765A
					; 0xE030: PRINT	MSG 0x007E, MSGBOX CLEARED, END: "{47}HE, DU DA! HE!!{4A}"
		dc.w $255
		dc.b $10
		dc.b $10
		ScriptID    $5,$9	; Run text script at offset 0x027604
					; 0xE005: PRINT	MSG 0x0053, MSGBOX CLEARED, END: "{47}WILLKOMMEN{43}IN UNSERER KIRCHE.{4A}"
		ScriptID    $6,$A	; Run text script at offset 0x027606
					; 0xE006: PRINT	MSG 0x0054, MSGBOX CLEARED, END: "{47}SEI VORSICHTIG.{43}GOTT SEGNE DICH!{4A}"
		ScriptJump  CS_NULL,$B	; Jump to address 0x027024
		ScriptJump  CS_NULL,$C	; Jump to address 0x027024
		ScriptID    $7,$D	; Run text script at offset 0x027608
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{47}HALT!{43}DAS GEHÖRT DER GÖTTIN.{43}ZUM TEUFEL MIT	DIR!{4A}"
		dc.w $256
		dc.b 8
		dc.b $10
		ScriptID    $2,$10	; Run text script at offset 0x0275FE
					; 0xE002: PRINT	MSG 0x0050, MSGBOX CLEARED, END: "{47}HALLO!{43}MÖCHTEST DU ÜBERNACHTEN?{4A}"
		ScriptID    $3,$11	; Run text script at offset 0x027600
					; 0xE003: PRINT	MSG 0x0051, MSGBOX CLEARED, END: "{47}MACH'S GUT!{4A}"
		ScriptJump  CS_NULL,$12	; Jump to address 0x027024
		ScriptJump  CS_NULL,$13	; Jump to address 0x027024
		ScriptID    $4,$14	; Run text script at offset 0x027602
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{47}WARTE MAL!{43}DAS	MUSST DU BEZAHLEN!!{4A}"
		dc.w $25F
		dc.b $10
		dc.b $10
		ScriptID    $5,$17	; Run text script at offset 0x027604
					; 0xE005: PRINT	MSG 0x0053, MSGBOX CLEARED, END: "{47}WILLKOMMEN{43}IN UNSERER KIRCHE.{4A}"
		ScriptID    $6,$18	; Run text script at offset 0x027606
					; 0xE006: PRINT	MSG 0x0054, MSGBOX CLEARED, END: "{47}SEI VORSICHTIG.{43}GOTT SEGNE DICH!{4A}"
		ScriptJump  CS_NULL,$19	; Jump to address 0x027024
		ScriptJump  CS_NULL,$1A	; Jump to address 0x027024
		ScriptID    $7,$1B	; Run text script at offset 0x027608
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{47}HALT!{43}DAS GEHÖRT DER GÖTTIN.{43}ZUM TEUFEL MIT	DIR!{4A}"
		dc.w $260
		dc.b $10
		dc.b $B
		ScriptID    $2,$1E	; Run text script at offset 0x0275FE
					; 0xE002: PRINT	MSG 0x0050, MSGBOX CLEARED, END: "{47}HALLO!{43}MÖCHTEST DU ÜBERNACHTEN?{4A}"
		ScriptID    $3,$1F	; Run text script at offset 0x027600
					; 0xE003: PRINT	MSG 0x0051, MSGBOX CLEARED, END: "{47}MACH'S GUT!{4A}"
		ScriptJump  ShopPrice_02,$20 ; Jump to address 0x025BD8
		ScriptJump  Shop_02,$21	; Jump to address 0x025BE6
		ScriptID    $4,$22	; Run text script at offset 0x027602
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{47}WARTE MAL!{43}DAS	MUSST DU BEZAHLEN!!{4A}"
		dc.w $267
		dc.b $10
		dc.b $10
		ScriptID    $28,$25	; Run text script at offset 0x02764A
					; 0xE028: PRINT	MSG 0x0076, MSGBOX CLEARED, END: "{47}ICH HABE{43}DIESEN LADEN JETZT SEIT{43}DREISSIG JAHREN.{4A}"
		ScriptID    $29,$26	; Run text script at offset 0x02764C
					; 0xE029: PRINT	MSG 0x0077, MSGBOX CLEARED, END: "{47}DANKE!{43}KOMM MAL WIEDER	VORBEI!{4A}"
		ScriptJump  ShopPrice_03,$27 ; Jump to address 0x025BF2
		ScriptJump  Shop_03,$28	; Jump to address 0x025C00
		ScriptID    $30,$29	; Run text script at offset 0x02765A
					; 0xE030: PRINT	MSG 0x007E, MSGBOX CLEARED, END: "{47}HE, DU DA! HE!!{4A}"
		dc.w $265
		dc.b $10
		dc.b $10
		ScriptID    $5,$2C	; Run text script at offset 0x027604
					; 0xE005: PRINT	MSG 0x0053, MSGBOX CLEARED, END: "{47}WILLKOMMEN{43}IN UNSERER KIRCHE.{4A}"
		ScriptID    $6,$2D	; Run text script at offset 0x027606
					; 0xE006: PRINT	MSG 0x0054, MSGBOX CLEARED, END: "{47}SEI VORSICHTIG.{43}GOTT SEGNE DICH!{4A}"
		ScriptJump  CS_NULL,$2E	; Jump to address 0x027024
		ScriptJump  CS_NULL,$2F	; Jump to address 0x027024
		ScriptID    $7,$30	; Run text script at offset 0x027608
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{47}HALT!{43}DAS GEHÖRT DER GÖTTIN.{43}ZUM TEUFEL MIT	DIR!{4A}"
		dc.w $26F
		dc.b $10
		dc.b $10
		ScriptID    $31,$33	; Run text script at offset 0x02765C
					; 0xE031: PRINT	MSG 0x007F, MSGBOX CLEARED, END: "{47}HERZLICH WILL-{43}KOMMEN!	DU KANNST DICH HIER{43}AUSRUHEN	UND VORRÄTE KAUFEN!{4A}"
		ScriptID    $3,$34	; Run text script at offset 0x027600
					; 0xE003: PRINT	MSG 0x0051, MSGBOX CLEARED, END: "{47}MACH'S GUT!{4A}"
		ScriptJump  ShopPrice_04,$35 ; Jump to address 0x025C0C
		ScriptJump  Shop_04,$36	; Jump to address 0x025C1A
		ScriptID    $4,$37	; Run text script at offset 0x027602
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{47}WARTE MAL!{43}DAS	MUSST DU BEZAHLEN!!{4A}"
		dc.w $2A6
		dc.b $18
		dc.b $10
		ScriptID    $38,$3A	; Run text script at offset 0x02766A
					; 0xE038: PRINT	MSG 0x0086, MSGBOX CLEARED, END: "{47}MERKATOR{43}SUPERMARKT!!{43}30% RABATT!! 40% RABATT!!{4A}{47}ICH HABE ALLES,{43}WAS IHR WOLLT!!{4A}"
		ScriptID    $29,$3B	; Run text script at offset 0x02764C
					; 0xE029: PRINT	MSG 0x0077, MSGBOX CLEARED, END: "{47}DANKE!{43}KOMM MAL WIEDER	VORBEI!{4A}"
		ScriptJump  ShopPrice_05,$3C ; Jump to address 0x025C26
		ScriptJump  Shop_05,$3D	; Jump to address 0x025C34
		ScriptID    $39,$3E	; Run text script at offset 0x02766C
					; 0xE039: PRINT	MSG 0x0087, MSGBOX CLEARED, END: "{47}EINEN MOMENT!{43}ES IST BILLIG,{43}ABER NICHT KOSTENLOS!{4A}"
		dc.w $2B7
		dc.b $10
		dc.b $10
		ScriptID    $3A,$41	; Run text script at offset 0x02766E
					; 0xE03A: PRINT	MSG 0x0088, MSGBOX CLEARED, END: "{47}NIELS!{43}WAS HÄTTEST DU GERNE?{4E}{47}ALLES, WAS{43}DU HABEN MÖCHTEST, KANN{43}ICH DIR BILLIGER VERKAUFEN.{4A}"
		ScriptID    $3B,$42	; Run text script at offset 0x027670
					; 0xE03B: PRINT	MSG 0x0089, MSGBOX CLEARED, END: "{47}SCHAU MAL{43}WIEDER REIN,	NIELS.{4A}"
		ScriptJump  ShopPrice_06,$43 ; Jump to address 0x025C40
		ScriptJump  Shop_06,$44 ; Jump to address 0x025C4E
		ScriptID    $30,$45	; Run text script at offset 0x02765A
					; 0xE030: PRINT	MSG 0x007E, MSGBOX CLEARED, END: "{47}HE, DU DA! HE!!{4A}"
		dc.w $281
		dc.b $C
		dc.b $10
		ScriptJump  CS_NULL,$48	; Jump to address 0x027024
		ScriptJump  CS_NULL,$49	; Jump to address 0x027024
		ScriptJump  ShopPrice_01,$4A ; Jump to address 0x025BBE
		ScriptJump  Shop_01,$4B	; Jump to address 0x025BCC
		ScriptID    $30,$4C	; Run text script at offset 0x02765A
					; 0xE030: PRINT	MSG 0x007E, MSGBOX CLEARED, END: "{47}HE, DU DA! HE!!{4A}"
		dc.w $2BB
		dc.b $10
		dc.b $10
		ScriptID    $5,$4F	; Run text script at offset 0x027604
					; 0xE005: PRINT	MSG 0x0053, MSGBOX CLEARED, END: "{47}WILLKOMMEN{43}IN UNSERER KIRCHE.{4A}"
		ScriptID    $6,$50	; Run text script at offset 0x027606
					; 0xE006: PRINT	MSG 0x0054, MSGBOX CLEARED, END: "{47}SEI VORSICHTIG.{43}GOTT SEGNE DICH!{4A}"
		ScriptJump  CS_NULL,$51	; Jump to address 0x027024
		ScriptJump  CS_NULL,$52	; Jump to address 0x027024
		ScriptID    $7,$53	; Run text script at offset 0x027608
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{47}HALT!{43}DAS GEHÖRT DER GÖTTIN.{43}ZUM TEUFEL MIT	DIR!{4A}"
		dc.w $2BD
		dc.b $20
		dc.b $10
		ScriptID    $2,$56	; Run text script at offset 0x0275FE
					; 0xE002: PRINT	MSG 0x0050, MSGBOX CLEARED, END: "{47}HALLO!{43}MÖCHTEST DU ÜBERNACHTEN?{4A}"
		ScriptID    $3,$57	; Run text script at offset 0x027600
					; 0xE003: PRINT	MSG 0x0051, MSGBOX CLEARED, END: "{47}MACH'S GUT!{4A}"
		ScriptJump  CS_NULL,$58	; Jump to address 0x027024
		ScriptJump  CS_NULL,$59	; Jump to address 0x027024
		ScriptID    $4,$5A	; Run text script at offset 0x027602
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{47}WARTE MAL!{43}DAS	MUSST DU BEZAHLEN!!{4A}"
		dc.w $2CF
		dc.b $10
		dc.b $18
		ScriptJump  ShopEnter_07,$5D ; Jump to address 0x025C74
		ScriptJump  ShopLeave_07,$5E ; Jump to address 0x025C80
		ScriptJump  ShopPrice_07,$5F ; Jump to address 0x025C5A
		ScriptJump  Shop_07,$60	; Jump to address 0x025C68
		ScriptJump  ShopSteal_07,$61 ; Jump to address 0x025C8C
		dc.w $2D1
		dc.b $10
		dc.b $10
		ScriptID    $5,$64	; Run text script at offset 0x027604
					; 0xE005: PRINT	MSG 0x0053, MSGBOX CLEARED, END: "{47}WILLKOMMEN{43}IN UNSERER KIRCHE.{4A}"
		ScriptID    $6,$65	; Run text script at offset 0x027606
					; 0xE006: PRINT	MSG 0x0054, MSGBOX CLEARED, END: "{47}SEI VORSICHTIG.{43}GOTT SEGNE DICH!{4A}"
		ScriptJump  CS_NULL,$66	; Jump to address 0x027024
		ScriptJump  CS_NULL,$67	; Jump to address 0x027024
		ScriptID    $7,$68	; Run text script at offset 0x027608
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{47}HALT!{43}DAS GEHÖRT DER GÖTTIN.{43}ZUM TEUFEL MIT	DIR!{4A}"
		dc.w $2DD
		dc.b $10
		dc.b $20
		ScriptID    $54,$6B	; Run text script at offset 0x0276A2
					; 0xE054: PRINT	MSG 0x00A2, MSGBOX CLEARED, END: "{47}TRITT EIN{43}IN FREUNDLICHS LADEN!{4A}"
		ScriptID    $29,$6C	; Run text script at offset 0x02764C
					; 0xE029: PRINT	MSG 0x0077, MSGBOX CLEARED, END: "{47}DANKE!{43}KOMM MAL WIEDER	VORBEI!{4A}"
		ScriptJump  ShopPrice_03,$6D ; Jump to address 0x025BF2
		ScriptJump  Shop_03,$6E	; Jump to address 0x025C00
		ScriptID    $30,$6F	; Run text script at offset 0x02765A
					; 0xE030: PRINT	MSG 0x007E, MSGBOX CLEARED, END: "{47}HE, DU DA! HE!!{4A}"
		dc.w $2E0
		dc.b $10
		dc.b $10
		ScriptID    $5,$72	; Run text script at offset 0x027604
					; 0xE005: PRINT	MSG 0x0053, MSGBOX CLEARED, END: "{47}WILLKOMMEN{43}IN UNSERER KIRCHE.{4A}"
		ScriptID    $6,$73	; Run text script at offset 0x027606
					; 0xE006: PRINT	MSG 0x0054, MSGBOX CLEARED, END: "{47}SEI VORSICHTIG.{43}GOTT SEGNE DICH!{4A}"
		ScriptJump  CS_NULL,$74	; Jump to address 0x027024
		ScriptJump  CS_NULL,$75	; Jump to address 0x027024
		ScriptID    $7,$76	; Run text script at offset 0x027608
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{47}HALT!{43}DAS GEHÖRT DER GÖTTIN.{43}ZUM TEUFEL MIT	DIR!{4A}"
		dc.w $2D9
		dc.b $10
		dc.b $10
		ScriptID    $55,$79	; Run text script at offset 0x0276A4
					; 0xE055: PRINT	MSG 0x00A3, MSGBOX CLEARED, END: "{47}DU KANNST	GERNE{43}BLEIBEN, SOLANGE DU WILLST,{43}WENN DU	ANSTÄNDIG BIST.{4A}"
		ScriptID    $3,$7A	; Run text script at offset 0x027600
					; 0xE003: PRINT	MSG 0x0051, MSGBOX CLEARED, END: "{47}MACH'S GUT!{4A}"
		ScriptJump  ShopPrice_04,$7B ; Jump to address 0x025C0C
		ScriptJump  Shop_04,$7C	; Jump to address 0x025C1A
		ScriptID    $4,$7D	; Run text script at offset 0x027602
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{47}WARTE MAL!{43}DAS	MUSST DU BEZAHLEN!!{4A}"
		dc.w $2EB
		dc.b $10
		dc.b $40
		ScriptID    $56,$80	; Run text script at offset 0x0276A6
					; 0xE056: PRINT	MSG 0x00A4, MSGBOX CLEARED, END: "{47}WER BETRITT{43}DA	MEINEN UNTERIRDISCHEN LADEN?{4E}{47}ZU MIR IST EWIG{43}KEIN KUNDE GEKOMMEN!{4A}"
		ScriptID    $57,$81	; Run text script at offset 0x0276A8
					; 0xE057: PRINT	MSG 0x00A5, MSGBOX CLEARED, END: "{47}KOMM BITTE NOCH EINMAL.{43}DU BIST DER EINZIGE KUNDE,{43}DEN ICH IN 200 JAHREN HATTE!{4A}"
		ScriptJump  ShopPrice_01,$82 ; Jump to address 0x025BBE
		ScriptJump  Shop_01,$83	; Jump to address 0x025BCC
		ScriptID    $58,$84	; Run text script at offset 0x0276AA
					; 0xE058: PRINT	MSG 0x00A6, MSGBOX CLEARED, END: "{47}SCHUFT! ICH HABE{4B}N 200	JAHREN KEIN SOLCH{43}UNGEHÖRIGES BENEHMEN GESEHEN!{4A}"
		dc.w $2ED
		dc.b $10
		dc.b $10
		ScriptID    $5,$87	; Run text script at offset 0x027604
					; 0xE005: PRINT	MSG 0x0053, MSGBOX CLEARED, END: "{47}WILLKOMMEN{43}IN UNSERER KIRCHE.{4A}"
		ScriptID    $6,$88	; Run text script at offset 0x027606
					; 0xE006: PRINT	MSG 0x0054, MSGBOX CLEARED, END: "{47}SEI VORSICHTIG.{43}GOTT SEGNE DICH!{4A}"
		ScriptJump  CS_NULL,$89	; Jump to address 0x027024
		ScriptJump  CS_NULL,$8A	; Jump to address 0x027024
		ScriptID    $7,$8B	; Run text script at offset 0x027608
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{47}HALT!{43}DAS GEHÖRT DER GÖTTIN.{43}ZUM TEUFEL MIT	DIR!{4A}"
		dc.w $2E9
		dc.b $10
		dc.b $10
		ScriptID    $2,$8E	; Run text script at offset 0x0275FE
					; 0xE002: PRINT	MSG 0x0050, MSGBOX CLEARED, END: "{47}HALLO!{43}MÖCHTEST DU ÜBERNACHTEN?{4A}"
		ScriptID    $3,$8F	; Run text script at offset 0x027600
					; 0xE003: PRINT	MSG 0x0051, MSGBOX CLEARED, END: "{47}MACH'S GUT!{4A}"
		ScriptJump  CS_NULL,$90	; Jump to address 0x027024
		ScriptJump  CS_NULL,$91	; Jump to address 0x027024
		ScriptID    $4,$92	; Run text script at offset 0x027602
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{47}WARTE MAL!{43}DAS	MUSST DU BEZAHLEN!!{4A}"
		dc.w $307
		dc.b $10
		dc.b $10
		ScriptJump  CS_NULL,$95	; Jump to address 0x027024
		ScriptJump  CS_NULL,$96	; Jump to address 0x027024
		ScriptJump  CS_NULL,$97	; Jump to address 0x027024
		ScriptJump  CS_NULL,$98	; Jump to address 0x027024
		ScriptID    $59,$99	; Run text script at offset 0x0276AC
					; 0xE059: PRINT	MSG 0x00A7, MSGBOX CLEARED, END: "{47}NEEIIIINNN....{43}NICHT MITNEEEHHMEEN ......{4A}"
		dc.w $29
		dc.b $10
		dc.b $10
		ScriptID    $62,$9C	; Run text script at offset 0x0276BE
					; 0xE062: PRINT	MSG 0x00B0, MSGBOX CLEARED, END: "{47}OH,{43}EIN GASSSSST......{43}AN MEINEM GRAB....{4A}"
		ScriptID    $63,$9D	; Run text script at offset 0x0276C0
					; 0xE063: PRINT	MSG 0x00B1, MSGBOX CLEARED, END: "{47}ICH WEERDE{43}.....WARTEN........{4A}"
		ScriptJump  CS_NULL,$9E	; Jump to address 0x027024
		ScriptJump  CS_NULL,$9F	; Jump to address 0x027024
		ScriptID    $59,$A0	; Run text script at offset 0x0276AC
					; 0xE059: PRINT	MSG 0x00A7, MSGBOX CLEARED, END: "{47}NEEIIIINNN....{43}NICHT MITNEEEHHMEEN ......{4A}"
		dc.w $294
		dc.b $10
		dc.b $10
		ScriptID    $6EA,$A3	; Run text script at offset 0x0283CE
					; 0xE4F3: PRINT	MSG 0x0541, MSGBOX CLEARED, END: "{47}BESONDERS	AUS-{43}GEWÄHLTE WAREN WARTEN EXTRA{43}AUF DICH! NUR AUF DICH!{4A}"
		ScriptJump  ShopLeave_08,$A4 ; Jump to address 0x024ED2
		ScriptJump  ShopPrice_08,$A5 ; Jump to address 0x024EEC
		ScriptJump  Shop_08,$A6	; Jump to address 0x024F20
		ScriptID    $30,$A7	; Run text script at offset 0x02765A
					; 0xE030: PRINT	MSG 0x007E, MSGBOX CLEARED, END: "{47}HE, DU DA! HE!!{4A}"
		dc.w $205
		dc.b $10
		dc.b $10
		ScriptID    $64,$AA	; Run text script at offset 0x0276C2
					; 0xE064: PRINT	MSG 0x00B2, MSGBOX CLEARED, END: "{47}WILLKOMMEN IM{43}KELKETO-WASSERFALL-LADEN!{4A}"
		ScriptID    $65,$AB	; Run text script at offset 0x0276C4
					; 0xE065: PRINT	MSG 0x00B3, MSGBOX CLEARED, END: "{47}DIE KELKETO-{43}WASSERFÄLLE SIND SCHÖN ZU{43}BESICHTIGEN.	KOMM NOCH EINMAL!{4A}"
		ScriptJump  ShopPrice_04,$AC ; Jump to address 0x025C0C
		ScriptJump  Shop_04,$AD	; Jump to address 0x025C1A
		ScriptID    $66,$AE	; Run text script at offset 0x0276C6
					; 0xE066: PRINT	MSG 0x00B4, MSGBOX CLEARED, END: "{47}WA...!{43} BIST DU ETWA EIN DIEB?{4A}"
		dc.w $20E
		dc.b $13
		dc.b $30
		ScriptID    $67,$B1	; Run text script at offset 0x0276C8
					; 0xE067: PRINT	MSG 0x00B5, MSGBOX CLEARED, END: "{47}FREUNDLICHS{43}BRUDER? DAS BIN ICH!{43}WILLKOMMEN	IN GIERIGS LADEN!{4A}"
		ScriptID    $29,$B2	; Run text script at offset 0x02764C
					; 0xE029: PRINT	MSG 0x0077, MSGBOX CLEARED, END: "{47}DANKE!{43}KOMM MAL WIEDER	VORBEI!{4A}"
		ScriptJump  ShopPrice_03,$B3 ; Jump to address 0x025BF2
		ScriptJump  Shop_03,$B4	; Jump to address 0x025C00
		ScriptID    $30,$B5	; Run text script at offset 0x02765A
					; 0xE030: PRINT	MSG 0x007E, MSGBOX CLEARED, END: "{47}HE, DU DA! HE!!{4A}"
		dc.w $131
		dc.b $10
		dc.b $10
		ScriptID    $62,$B8	; Run text script at offset 0x0276BE
					; 0xE062: PRINT	MSG 0x00B0, MSGBOX CLEARED, END: "{47}OH,{43}EIN GASSSSST......{43}AN MEINEM GRAB....{4A}"
		ScriptID    $63,$B9	; Run text script at offset 0x0276C0
					; 0xE063: PRINT	MSG 0x00B1, MSGBOX CLEARED, END: "{47}ICH WEERDE{43}.....WARTEN........{4A}"
		ScriptJump  CS_NULL,$BA	; Jump to address 0x027024
		ScriptJump  CS_NULL,$BB	; Jump to address 0x027024
		ScriptID    $59,$BC	; Run text script at offset 0x0276AC
					; 0xE059: PRINT	MSG 0x00A7, MSGBOX CLEARED, END: "{47}NEEIIIINNN....{43}NICHT MITNEEEHHMEEN ......{4A}"
		dc.w $188
		dc.b $10
		dc.b $10
		ScriptJump  CS_NULL,$BF	; Jump to address 0x027024
		ScriptJump  CS_NULL,$C0	; Jump to address 0x027024
		ScriptJump  CS_NULL,$C1	; Jump to address 0x027024
		ScriptJump  CS_NULL,$C2	; Jump to address 0x027024
		ScriptID    $59,$C3	; Run text script at offset 0x0276AC
					; 0xE059: PRINT	MSG 0x00A7, MSGBOX CLEARED, END: "{47}NEEIIIINNN....{43}NICHT MITNEEEHHMEEN ......{4A}"
		dc.w $FFFF
