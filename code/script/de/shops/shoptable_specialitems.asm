		dc.b $25
		dc.b $14
		dc.w $260
		ScriptID    $1F,$2	; Run text script at offset 0x027638
					; 0xE01F: PRINT	MSG 0x006D, MSGBOX CLEARED, END: "{47}{46} TALER PRO{43}NACHT. LEG SIE BITTE AUF DEN{43}TRESEN,	WENN DU	BLEIBEN	WILLST.{4A}"
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x024DD0
		ScriptID    $4,$4	; Run text script at offset 0x027602
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{47}WARTE MAL!{43}DAS	MUSST DU BEZAHLEN!!{4A}"
		ScriptID    $41,$5	; Run text script at offset 0x02767C
					; 0xA041: PRINT	MSG 0x008F, END: "{47}{46} TALER FÜR{43}EINE ÜBERNACHTUNG.{43}OKAY?{44}"
		ScriptID    $34,$6	; Run text script at offset 0x027662
					; 0xE034: PRINT	MSG 0x0082, MSGBOX CLEARED, END: "{47}VIELEN DANK.{43}DEIN BETT	IST FERTIG.{4A}"
		ScriptID    $35,$7	; Run text script at offset 0x027664
					; 0xE035: PRINT	MSG 0x0083, MSGBOX CLEARED, END: "{47}HAST DU GUT{43}GESCHLAFEN?{43}AUF	WIEDERSEHEN.{4A}"
		ScriptID    $42,$8	; Run text script at offset 0x02767E
					; 0xE042: PRINT	MSG 0x0090, MSGBOX CLEARED, END: "{47}OH!...{43}KOMM NOCH MAL,{43}WENN DU MEHR GELD HAST.{4A}"
		ScriptID    $20,$9	; Run text script at offset 0x02763A
					; 0xE020: PRINT	MSG 0x006E, MSGBOX CLEARED, END: "{47}SCHADE....{4A}"
		dc.b $26
		dc.b $C
		dc.w $260
		ScriptID    $27,$2	; Run text script at offset 0x027648
					; 0xE027: PRINT	MSG 0x0075, MSGBOX CLEARED, END: "{47}BRING ES ZUM{43}TRESEN, WENN DU EINEN BLICK{43}DARAUF WERFEN MÖCHTEST.{4A}"
		ScriptJump  HandleMap,$3 ; Jump	to address 0x024E3E
		ScriptID    $4,$4	; Run text script at offset 0x027602
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{47}WARTE MAL!{43}DAS	MUSST DU BEZAHLEN!!{4A}"
		ScriptID    $37,$5	; Run text script at offset 0x027668
					; 0xA037: PRINT	MSG 0x0085, END: "{47}ICH WERDE	DIR{43}DIE {4B}	ZEIGEN,{43}OKAY?{44}"
		dc.b $25
		dc.b $14
		dc.w $26F
		ScriptID    $1F,$2	; Run text script at offset 0x027638
					; 0xE01F: PRINT	MSG 0x006D, MSGBOX CLEARED, END: "{47}{46} TALER PRO{43}NACHT. LEG SIE BITTE AUF DEN{43}TRESEN,	WENN DU	BLEIBEN	WILLST.{4A}"
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x024DD0
		ScriptID    $4,$4	; Run text script at offset 0x027602
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{47}WARTE MAL!{43}DAS	MUSST DU BEZAHLEN!!{4A}"
		ScriptID    $41,$5	; Run text script at offset 0x02767C
					; 0xA041: PRINT	MSG 0x008F, END: "{47}{46} TALER FÜR{43}EINE ÜBERNACHTUNG.{43}OKAY?{44}"
		ScriptID    $34,$6	; Run text script at offset 0x027662
					; 0xE034: PRINT	MSG 0x0082, MSGBOX CLEARED, END: "{47}VIELEN DANK.{43}DEIN BETT	IST FERTIG.{4A}"
		ScriptID    $35,$7	; Run text script at offset 0x027664
					; 0xE035: PRINT	MSG 0x0083, MSGBOX CLEARED, END: "{47}HAST DU GUT{43}GESCHLAFEN?{43}AUF	WIEDERSEHEN.{4A}"
		ScriptID    $42,$8	; Run text script at offset 0x02767E
					; 0xE042: PRINT	MSG 0x0090, MSGBOX CLEARED, END: "{47}OH!...{43}KOMM NOCH MAL,{43}WENN DU MEHR GELD HAST.{4A}"
		ScriptID    $20,$9	; Run text script at offset 0x02763A
					; 0xE020: PRINT	MSG 0x006E, MSGBOX CLEARED, END: "{47}SCHADE....{4A}"
		dc.b $26
		dc.b $C
		dc.w $26F
		ScriptID    $36,$2	; Run text script at offset 0x027666
					; 0xE036: PRINT	MSG 0x0084, MSGBOX CLEARED, END: "{47}DAS IST{43}DIE {4B}.{43}BRING SIE	ZUM TRESEN.{4A}"
		ScriptJump  HandleMap,$3 ; Jump	to address 0x024E3E
		ScriptID    $4,$4	; Run text script at offset 0x027602
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{47}WARTE MAL!{43}DAS	MUSST DU BEZAHLEN!!{4A}"
		ScriptID    $37,$5	; Run text script at offset 0x027668
					; 0xA037: PRINT	MSG 0x0085, END: "{47}ICH WERDE	DIR{43}DIE {4B}	ZEIGEN,{43}OKAY?{44}"
		dc.b $25
		dc.b $14
		dc.w $2BD
		ScriptID    $1F,$2	; Run text script at offset 0x027638
					; 0xE01F: PRINT	MSG 0x006D, MSGBOX CLEARED, END: "{47}{46} TALER PRO{43}NACHT. LEG SIE BITTE AUF DEN{43}TRESEN,	WENN DU	BLEIBEN	WILLST.{4A}"
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x024DD0
		ScriptID    $4,$4	; Run text script at offset 0x027602
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{47}WARTE MAL!{43}DAS	MUSST DU BEZAHLEN!!{4A}"
		ScriptID    $41,$5	; Run text script at offset 0x02767C
					; 0xA041: PRINT	MSG 0x008F, END: "{47}{46} TALER FÜR{43}EINE ÜBERNACHTUNG.{43}OKAY?{44}"
		ScriptID    $34,$6	; Run text script at offset 0x027662
					; 0xE034: PRINT	MSG 0x0082, MSGBOX CLEARED, END: "{47}VIELEN DANK.{43}DEIN BETT	IST FERTIG.{4A}"
		ScriptID    $35,$7	; Run text script at offset 0x027664
					; 0xE035: PRINT	MSG 0x0083, MSGBOX CLEARED, END: "{47}HAST DU GUT{43}GESCHLAFEN?{43}AUF	WIEDERSEHEN.{4A}"
		ScriptID    $42,$8	; Run text script at offset 0x02767E
					; 0xE042: PRINT	MSG 0x0090, MSGBOX CLEARED, END: "{47}OH!...{43}KOMM NOCH MAL,{43}WENN DU MEHR GELD HAST.{4A}"
		ScriptID    $20,$9	; Run text script at offset 0x02763A
					; 0xE020: PRINT	MSG 0x006E, MSGBOX CLEARED, END: "{47}SCHADE....{4A}"
		dc.b $26
		dc.b $C
		dc.w $2BD
		ScriptID    $36,$2	; Run text script at offset 0x027666
					; 0xE036: PRINT	MSG 0x0084, MSGBOX CLEARED, END: "{47}DAS IST{43}DIE {4B}.{43}BRING SIE	ZUM TRESEN.{4A}"
		ScriptJump  HandleMap,$3 ; Jump	to address 0x024E3E
		ScriptID    $4,$4	; Run text script at offset 0x027602
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{47}WARTE MAL!{43}DAS	MUSST DU BEZAHLEN!!{4A}"
		ScriptID    $43,$5	; Run text script at offset 0x027680
					; 0xA043: PRINT	MSG 0x0091, END: "{47}HIER .{43}ICH ZEIGE SIE DIR.{44}"
		dc.b $26
		dc.b $C
		dc.w $2CF
		ScriptJump  ShopMap_07,$2 ; Jump to address 0x025D04
		ScriptJump  HandleMap,$3 ; Jump	to address 0x024E3E
		ScriptJump  ShopSteal_07,$4 ; Jump to address 0x025C8C
		ScriptJump  ShopConfirmMap_07,$5 ; Jump	to address 0x025D10
		dc.b $24
		dc.b $A
		dc.w $2E0
		ScriptID    $21,$2	; Run text script at offset 0x02763C
					; 0xE021: PRINT	MSG 0x006F, MSGBOX CLEARED, END: "{47}VORSICHT,	MEIN{43}KIND! DAS BUCH IST VOLL	VON{43}UNBERECHENBAREN ZAUBERSPRÜCHEN!{4A}"
		ScriptJump  HandleSpellbook,$3 ; Jump to address 0x024E8C
		ScriptID    $26,$4	; Run text script at offset 0x027646
					; 0xE026: PRINT	MSG 0x0074, MSGBOX CLEARED, END: "{47}OH NEIN! DU{43}DARFST ES NICHT MITNEHMEN!{4A}{47}DIE WELT	IST FÜR{43}SEINE ZAUBERKRÄFTE NOCH{43}NICHT BEREIT!{4A}"
		dc.b $25
		dc.b $14
		dc.w $2D9
		ScriptID    $1F,$2	; Run text script at offset 0x027638
					; 0xE01F: PRINT	MSG 0x006D, MSGBOX CLEARED, END: "{47}{46} TALER PRO{43}NACHT. LEG SIE BITTE AUF DEN{43}TRESEN,	WENN DU	BLEIBEN	WILLST.{4A}"
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x024DD0
		ScriptID    $4,$4	; Run text script at offset 0x027602
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{47}WARTE MAL!{43}DAS	MUSST DU BEZAHLEN!!{4A}"
		ScriptID    $41,$5	; Run text script at offset 0x02767C
					; 0xA041: PRINT	MSG 0x008F, END: "{47}{46} TALER FÜR{43}EINE ÜBERNACHTUNG.{43}OKAY?{44}"
		ScriptID    $34,$6	; Run text script at offset 0x027662
					; 0xE034: PRINT	MSG 0x0082, MSGBOX CLEARED, END: "{47}VIELEN DANK.{43}DEIN BETT	IST FERTIG.{4A}"
		ScriptID    $35,$7	; Run text script at offset 0x027664
					; 0xE035: PRINT	MSG 0x0083, MSGBOX CLEARED, END: "{47}HAST DU GUT{43}GESCHLAFEN?{43}AUF	WIEDERSEHEN.{4A}"
		ScriptID    $42,$8	; Run text script at offset 0x02767E
					; 0xE042: PRINT	MSG 0x0090, MSGBOX CLEARED, END: "{47}OH!...{43}KOMM NOCH MAL,{43}WENN DU MEHR GELD HAST.{4A}"
		ScriptID    $20,$9	; Run text script at offset 0x02763A
					; 0xE020: PRINT	MSG 0x006E, MSGBOX CLEARED, END: "{47}SCHADE....{4A}"
		dc.b $26
		dc.b $C
		dc.w $2D9
		ScriptID    $36,$2	; Run text script at offset 0x027666
					; 0xE036: PRINT	MSG 0x0084, MSGBOX CLEARED, END: "{47}DAS IST{43}DIE {4B}.{43}BRING SIE	ZUM TRESEN.{4A}"
		ScriptJump  HandleMap,$3 ; Jump	to address 0x024E3E
		ScriptID    $4,$4	; Run text script at offset 0x027602
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{47}WARTE MAL!{43}DAS	MUSST DU BEZAHLEN!!{4A}"
		ScriptID    $37,$5	; Run text script at offset 0x027668
					; 0xA037: PRINT	MSG 0x0085, END: "{47}ICH WERDE	DIR{43}DIE {4B}	ZEIGEN,{43}OKAY?{44}"
		dc.b $25
		dc.b $14
		dc.w $2E9
		ScriptID    $1F,$2	; Run text script at offset 0x027638
					; 0xE01F: PRINT	MSG 0x006D, MSGBOX CLEARED, END: "{47}{46} TALER PRO{43}NACHT. LEG SIE BITTE AUF DEN{43}TRESEN,	WENN DU	BLEIBEN	WILLST.{4A}"
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x024DD0
		ScriptID    $4,$4	; Run text script at offset 0x027602
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{47}WARTE MAL!{43}DAS	MUSST DU BEZAHLEN!!{4A}"
		ScriptID    $41,$5	; Run text script at offset 0x02767C
					; 0xA041: PRINT	MSG 0x008F, END: "{47}{46} TALER FÜR{43}EINE ÜBERNACHTUNG.{43}OKAY?{44}"
		ScriptID    $34,$6	; Run text script at offset 0x027662
					; 0xE034: PRINT	MSG 0x0082, MSGBOX CLEARED, END: "{47}VIELEN DANK.{43}DEIN BETT	IST FERTIG.{4A}"
		ScriptID    $35,$7	; Run text script at offset 0x027664
					; 0xE035: PRINT	MSG 0x0083, MSGBOX CLEARED, END: "{47}HAST DU GUT{43}GESCHLAFEN?{43}AUF	WIEDERSEHEN.{4A}"
		ScriptID    $42,$8	; Run text script at offset 0x02767E
					; 0xE042: PRINT	MSG 0x0090, MSGBOX CLEARED, END: "{47}OH!...{43}KOMM NOCH MAL,{43}WENN DU MEHR GELD HAST.{4A}"
		ScriptID    $20,$9	; Run text script at offset 0x02763A
					; 0xE020: PRINT	MSG 0x006E, MSGBOX CLEARED, END: "{47}SCHADE....{4A}"
		dc.b 0
		dc.b 6
		dc.w $307
		ScriptJump  GainItem,$2	; Jump to address 0x034846
		dc.b $12
		dc.b 6
		dc.w $307
		ScriptJump  GainItem,$2	; Jump to address 0x034846
		dc.b $21
		dc.b $18
		dc.w $FFFF
		ScriptID    $8,$2	; Run text script at offset 0x02760A
					; 0xE008: PRINT	MSG 0x0056, MSGBOX CLEARED, END: "{47}DIES IST{43}EIN {4B}.{4A}"
		ScriptJump  HandleStatusCure,$3	; Jump to address 0x024CEC
		ScriptID    $7,$4	; Run text script at offset 0x027608
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{47}HALT!{43}DAS GEHÖRT DER GÖTTIN.{43}ZUM TEUFEL MIT	DIR!{4A}"
		ScriptID    $9,$5	; Run text script at offset 0x02760C
					; 0xA009: PRINT	MSG 0x0057, END: "{47}BIST DU{43}VERGIFTET?{4E}{47}DAS KOSTET DICH{43}{46} TALER.{44}"
		ScriptID    $A,$6	; Run text script at offset 0x02760E
					; 0xE00A: PRINT	MSG 0x0058, MSGBOX CLEARED, END: "{47}MEINEN ERGEBEN-{43}STEN DANK. HALT JETZT STILL.{43}ES WIRD EIN BISSCHEN WEHTUN....{4A}"
		ScriptID    $B,$7	; Run text script at offset 0x027610
					; 0xE00B: PRINT	MSG 0x0059, MSGBOX CLEARED, END: "{47}FERTIG. DAS GIFT{43}IST AUS DEINEM KÖRPER	HERAUS.{43}PASS	DEMNÄCHST BESSER AUF!{4A}"
		ScriptID    $C,$8	; Run text script at offset 0x027612
					; 0xE00C: PRINT	MSG 0x005A, MSGBOX CLEARED, END: "{47}DU HAST KEIN{43}GELD? DANN KANN ICH NICHTS FÜR{43}DICH TUN.{4A}{47}DU MUSST{43}NOCHMAL KOMMEN...{4A}"
		ScriptID    $D,$9	; Run text script at offset 0x027614
					; 0xE00D: PRINT	MSG 0x005B, MSGBOX CLEARED, END: "{47}ICH FÜRCHTE,{43}DU KANNST	IN DIESER WELT{43}NICHT	LÄNGER LEBEN.{4E}{47}MÖGE DIE GÖTTIN{43}SICH DEINER ERBARMEN...{4A}"
		ScriptID    $E,$A	; Run text script at offset 0x027616
					; 0xE00E: PRINT	MSG 0x005C, MSGBOX CLEARED, END: "{47}HMMM{45}.{45}.{45}.{43}KEIN GIFT...{43}DU	BIST KERNGESUND!{4A}"
		dc.w $100
		dc.b $22
		dc.b $18
		dc.w $FFFF
		ScriptID    $F,$2	; Run text script at offset 0x027618
					; 0xE00F: PRINT	MSG 0x005D, MSGBOX CLEARED, END: "{47}DIES IST EIN{43}{4B}. ES ENTHÄLT{43}VERSCHIEDENE ZAUBERSPRÜCHE.{4A}"
		ScriptJump  HandleStatusCure,$3	; Jump to address 0x024CEC
		ScriptID    $7,$4	; Run text script at offset 0x027608
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{47}HALT!{43}DAS GEHÖRT DER GÖTTIN.{43}ZUM TEUFEL MIT	DIR!{4A}"
		ScriptID    $10,$5	; Run text script at offset 0x02761A
					; 0xA010: PRINT	MSG 0x005E, END: "{47}KANNST DU{43}{46}	TALER ZAHLEN,{43}UM DEN	FLUCH AUFZUHEBEN?{44}"
		ScriptID    $A,$6	; Run text script at offset 0x02760E
					; 0xE00A: PRINT	MSG 0x0058, MSGBOX CLEARED, END: "{47}MEINEN ERGEBEN-{43}STEN DANK. HALT JETZT STILL.{43}ES WIRD EIN BISSCHEN WEHTUN....{4A}"
		ScriptID    $11,$7	; Run text script at offset 0x02761C
					; 0xE011: PRINT	MSG 0x005F, MSGBOX CLEARED, END: "{47}TA-DA!{43}DER FLUCH IST AUFGEHOBEN.{4A}"
		ScriptID    $C,$8	; Run text script at offset 0x027612
					; 0xE00C: PRINT	MSG 0x005A, MSGBOX CLEARED, END: "{47}DU HAST KEIN{43}GELD? DANN KANN ICH NICHTS FÜR{43}DICH TUN.{4A}{47}DU MUSST{43}NOCHMAL KOMMEN...{4A}"
		ScriptID    $D,$9	; Run text script at offset 0x027614
					; 0xE00D: PRINT	MSG 0x005B, MSGBOX CLEARED, END: "{47}ICH FÜRCHTE,{43}DU KANNST	IN DIESER WELT{43}NICHT	LÄNGER LEBEN.{4E}{47}MÖGE DIE GÖTTIN{43}SICH DEINER ERBARMEN...{4A}"
		ScriptID    $12,$A	; Run text script at offset 0x02761E
					; 0xE012: PRINT	MSG 0x0060, MSGBOX CLEARED, END: "{47}ICH MÖCHTE DIR{43}GERNE HELFEN,{45}.{45}.{45}.{43}ABER AUF DIR LASTET KEIN FLUCH.{4A}"
		dc.w $800
		dc.b $11
		dc.b $18
		dc.w $FFFF
		ScriptID    $13,$2	; Run text script at offset 0x027620
					; 0xE013: PRINT	MSG 0x0061, MSGBOX CLEARED, END: "{47}DIES IST EIN{43}{4B}. ES IST NÖTIG,{43}UM	HALLUZINATIONEN	ZU HEILEN.{4A}"
		ScriptJump  HandleStatusCure,$3	; Jump to address 0x024CEC
		ScriptID    $7,$4	; Run text script at offset 0x027608
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{47}HALT!{43}DAS GEHÖRT DER GÖTTIN.{43}ZUM TEUFEL MIT	DIR!{4A}"
		ScriptID    $14,$5	; Run text script at offset 0x027622
					; 0xA014: PRINT	MSG 0x0062, END: "{47}KANNST DU{43}{46}	TALER FÜR DEN{43}FLUCH ZAHLEN?{44}"
		ScriptID    $A,$6	; Run text script at offset 0x02760E
					; 0xE00A: PRINT	MSG 0x0058, MSGBOX CLEARED, END: "{47}MEINEN ERGEBEN-{43}STEN DANK. HALT JETZT STILL.{43}ES WIRD EIN BISSCHEN WEHTUN....{4A}"
		ScriptID    $15,$7	; Run text script at offset 0x027624
					; 0xE015: PRINT	MSG 0x0063, MSGBOX CLEARED, END: "{47}AHA...{43}JETZT IST ES BESSER!{43}DEINE HALLUZINATIONEN SIND WEG.{4A}"
		ScriptID    $C,$8	; Run text script at offset 0x027612
					; 0xE00C: PRINT	MSG 0x005A, MSGBOX CLEARED, END: "{47}DU HAST KEIN{43}GELD? DANN KANN ICH NICHTS FÜR{43}DICH TUN.{4A}{47}DU MUSST{43}NOCHMAL KOMMEN...{4A}"
		ScriptID    $D,$9	; Run text script at offset 0x027614
					; 0xE00D: PRINT	MSG 0x005B, MSGBOX CLEARED, END: "{47}ICH FÜRCHTE,{43}DU KANNST	IN DIESER WELT{43}NICHT	LÄNGER LEBEN.{4E}{47}MÖGE DIE GÖTTIN{43}SICH DEINER ERBARMEN...{4A}"
		ScriptID    $16,$A	; Run text script at offset 0x027626
					; 0xE016: PRINT	MSG 0x0064, MSGBOX CLEARED, END: "{47}W-WAS...?{43}ABER	DU HALLUZINIERST{43}DOCH JETZT GAR NICHT!{4A}"
		dc.w $200
		dc.b $23
		dc.b $18
		dc.w $FFFF
		ScriptJump  HandleIdentifyRecordBook,$2	; Jump to address 0x025D1C
		ScriptJump  HandleRecordBookUse,$3 ; Jump to address 0x024D6C
		ScriptJump  HandleRecordBookTheft,$4 ; Jump to address 0x025D5C
		ScriptJump  RequestGameSaveMsg,$5 ; Jump to address 0x025D24
		ScriptJump  InitiateGameSaveMsg,$6 ; Jump to address 0x025D2C
		ScriptJump  GameSaveCompleteMsg,$7 ; Jump to address 0x025D34
		ScriptJump  GameSaveRefusedMsg,$8 ; Jump to address 0x025D3C
		ScriptJump  RequestGameContinueMsg,$9 ;	Jump to	address	0x025D44
		ScriptJump  ConfirmGameContinueMsg,$A ;	Jump to	address	0x025D4C
		ScriptJump  ConfirmGameStopMsg,$B ; Jump to address 0x025D54
		dc.b $25
		dc.b $14
		dc.w $FFFF
		ScriptID    $1F,$2	; Run text script at offset 0x027638
					; 0xE01F: PRINT	MSG 0x006D, MSGBOX CLEARED, END: "{47}{46} TALER PRO{43}NACHT. LEG SIE BITTE AUF DEN{43}TRESEN,	WENN DU	BLEIBEN	WILLST.{4A}"
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x024DD0
		ScriptID    $4,$4	; Run text script at offset 0x027602
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{47}WARTE MAL!{43}DAS	MUSST DU BEZAHLEN!!{4A}"
		ScriptID    $41,$5	; Run text script at offset 0x02767C
					; 0xA041: PRINT	MSG 0x008F, END: "{47}{46} TALER FÜR{43}EINE ÜBERNACHTUNG.{43}OKAY?{44}"
		ScriptID    $34,$6	; Run text script at offset 0x027662
					; 0xE034: PRINT	MSG 0x0082, MSGBOX CLEARED, END: "{47}VIELEN DANK.{43}DEIN BETT	IST FERTIG.{4A}"
		ScriptID    $35,$7	; Run text script at offset 0x027664
					; 0xE035: PRINT	MSG 0x0083, MSGBOX CLEARED, END: "{47}HAST DU GUT{43}GESCHLAFEN?{43}AUF	WIEDERSEHEN.{4A}"
		ScriptID    $42,$8	; Run text script at offset 0x02767E
					; 0xE042: PRINT	MSG 0x0090, MSGBOX CLEARED, END: "{47}OH!...{43}KOMM NOCH MAL,{43}WENN DU MEHR GELD HAST.{4A}"
		ScriptID    $20,$9	; Run text script at offset 0x02763A
					; 0xE020: PRINT	MSG 0x006E, MSGBOX CLEARED, END: "{47}SCHADE....{4A}"
		dc.b $26
		dc.b $C
		dc.w $FFFF
		ScriptID    $36,$2	; Run text script at offset 0x027666
					; 0xE036: PRINT	MSG 0x0084, MSGBOX CLEARED, END: "{47}DAS IST{43}DIE {4B}.{43}BRING SIE	ZUM TRESEN.{4A}"
		ScriptJump  HandleMap,$3 ; Jump	to address 0x024E3E
		ScriptID    $4,$4	; Run text script at offset 0x027602
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{47}WARTE MAL!{43}DAS	MUSST DU BEZAHLEN!!{4A}"
		ScriptID    $37,$5	; Run text script at offset 0x027668
					; 0xA037: PRINT	MSG 0x0085, END: "{47}ICH WERDE	DIR{43}DIE {4B}	ZEIGEN,{43}OKAY?{44}"
		dc.w $FFFF
