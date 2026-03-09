		dc.b $25		; DATA XREF: sub_24BE8+8t
		dc.b $14
		dc.w $260
		ScriptID    $1F,$2	; Run text script at offset 0x027958
					; 0xE01F: PRINT	MSG 0x006D, MSGBOX CLEARED, END: "{6A}{69} Ors la nuit.{66}Placez-le sur le comptoir{66}si vous	voulez rester.{6D}"
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x0250F0
		ScriptID    $4,$4	; Run text script at offset 0x027922
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{6A}Mais non!{66}Vous	ne pouvez pas{66}emporter notre	matériel!{6D}"
		ScriptID    $40,$5	; Run text script at offset 0x02799A
					; 0xA040: PRINT	MSG 0x008E, END: "{6A}{69} Ors la nuit.{66}Ca marche?{66}{67}"
		ScriptID    $35,$6	; Run text script at offset 0x027984
					; 0xE035: PRINT	MSG 0x0083, MSGBOX CLEARED, END: "{6A}Merci bien.{66}Votre chambre est en haut.{6D}"
		ScriptID    $36,$7	; Run text script at offset 0x027986
					; 0xE036: PRINT	MSG 0x0084, MSGBOX CLEARED, END: "{6A}Revenez quand{66}vous voulez vous	reposer.{6D}"
		ScriptID    $41,$8	; Run text script at offset 0x02799C
					; 0xE041: PRINT	MSG 0x008F, MSGBOX CLEARED, END: "{6A}C'est pas de chance!{66}Revenez quand vous serez{66}un peu plus riche!{6D}"
		ScriptID    $20,$9	; Run text script at offset 0x02795A
					; 0xE020: PRINT	MSG 0x006E, MSGBOX CLEARED, END: "{6A}C'est dommage...{6D}"
		dc.b $26
		dc.b $C
		dc.w $260
		ScriptID    $27,$2	; Run text script at offset 0x027968
					; 0xE027: PRINT	MSG 0x0075, MSGBOX CLEARED, END: "{6A}Posez-le sur le comptoir{66}si vous voulez y jeter un oeil.{6D}"
		ScriptJump  HandleMap,$3 ; Jump	to address 0x02515E
		ScriptID    $4,$4	; Run text script at offset 0x027922
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{6A}Mais non!{66}Vous	ne pouvez pas{66}emporter notre	matériel!{6D}"
		ScriptID    $38,$5	; Run text script at offset 0x02798A
					; 0xA038: PRINT	MSG 0x0086, END: "{6A}Vous voulez voir{66}le {6E}?{67}"
		dc.b $25
		dc.b $14
		dc.w $26F
		ScriptID    $1F,$2	; Run text script at offset 0x027958
					; 0xE01F: PRINT	MSG 0x006D, MSGBOX CLEARED, END: "{6A}{69} Ors la nuit.{66}Placez-le sur le comptoir{66}si vous	voulez rester.{6D}"
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x0250F0
		ScriptID    $4,$4	; Run text script at offset 0x027922
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{6A}Mais non!{66}Vous	ne pouvez pas{66}emporter notre	matériel!{6D}"
		ScriptID    $40,$5	; Run text script at offset 0x02799A
					; 0xA040: PRINT	MSG 0x008E, END: "{6A}{69} Ors la nuit.{66}Ca marche?{66}{67}"
		ScriptID    $35,$6	; Run text script at offset 0x027984
					; 0xE035: PRINT	MSG 0x0083, MSGBOX CLEARED, END: "{6A}Merci bien.{66}Votre chambre est en haut.{6D}"
		ScriptID    $36,$7	; Run text script at offset 0x027986
					; 0xE036: PRINT	MSG 0x0084, MSGBOX CLEARED, END: "{6A}Revenez quand{66}vous voulez vous	reposer.{6D}"
		ScriptID    $41,$8	; Run text script at offset 0x02799C
					; 0xE041: PRINT	MSG 0x008F, MSGBOX CLEARED, END: "{6A}C'est pas de chance!{66}Revenez quand vous serez{66}un peu plus riche!{6D}"
		ScriptID    $20,$9	; Run text script at offset 0x02795A
					; 0xE020: PRINT	MSG 0x006E, MSGBOX CLEARED, END: "{6A}C'est dommage...{6D}"
		dc.b $26
		dc.b $C
		dc.w $26F
		ScriptID    $37,$2	; Run text script at offset 0x027988
					; 0xE037: PRINT	MSG 0x0085, MSGBOX CLEARED, END: "{6A}C'est le {6E}.{66}Apportez-le au comptoir.{6D}"
		ScriptJump  HandleMap,$3 ; Jump	to address 0x02515E
		ScriptID    $4,$4	; Run text script at offset 0x027922
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{6A}Mais non!{66}Vous	ne pouvez pas{66}emporter notre	matériel!{6D}"
		ScriptID    $38,$5	; Run text script at offset 0x02798A
					; 0xA038: PRINT	MSG 0x0086, END: "{6A}Vous voulez voir{66}le {6E}?{67}"
		dc.b $25
		dc.b $14
		dc.w $2BD
		ScriptID    $1F,$2	; Run text script at offset 0x027958
					; 0xE01F: PRINT	MSG 0x006D, MSGBOX CLEARED, END: "{6A}{69} Ors la nuit.{66}Placez-le sur le comptoir{66}si vous	voulez rester.{6D}"
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x0250F0
		ScriptID    $4,$4	; Run text script at offset 0x027922
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{6A}Mais non!{66}Vous	ne pouvez pas{66}emporter notre	matériel!{6D}"
		ScriptID    $40,$5	; Run text script at offset 0x02799A
					; 0xA040: PRINT	MSG 0x008E, END: "{6A}{69} Ors la nuit.{66}Ca marche?{66}{67}"
		ScriptID    $35,$6	; Run text script at offset 0x027984
					; 0xE035: PRINT	MSG 0x0083, MSGBOX CLEARED, END: "{6A}Merci bien.{66}Votre chambre est en haut.{6D}"
		ScriptID    $36,$7	; Run text script at offset 0x027986
					; 0xE036: PRINT	MSG 0x0084, MSGBOX CLEARED, END: "{6A}Revenez quand{66}vous voulez vous	reposer.{6D}"
		ScriptID    $41,$8	; Run text script at offset 0x02799C
					; 0xE041: PRINT	MSG 0x008F, MSGBOX CLEARED, END: "{6A}C'est pas de chance!{66}Revenez quand vous serez{66}un peu plus riche!{6D}"
		ScriptID    $20,$9	; Run text script at offset 0x02795A
					; 0xE020: PRINT	MSG 0x006E, MSGBOX CLEARED, END: "{6A}C'est dommage...{6D}"
		dc.b $26
		dc.b $C
		dc.w $2BD
		ScriptID    $37,$2	; Run text script at offset 0x027988
					; 0xE037: PRINT	MSG 0x0085, MSGBOX CLEARED, END: "{6A}C'est le {6E}.{66}Apportez-le au comptoir.{6D}"
		ScriptJump  HandleMap,$3 ; Jump	to address 0x02515E
		ScriptID    $4,$4	; Run text script at offset 0x027922
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{6A}Mais non!{66}Vous	ne pouvez pas{66}emporter notre	matériel!{6D}"
		ScriptID    $42,$5	; Run text script at offset 0x02799E
					; 0xA042: PRINT	MSG 0x0090, END: "{6A}Tenez.{66}Laissez-moi vous montrer.{67}"
		dc.b $26
		dc.b $C
		dc.w $2CF
		ScriptJump  ShopMap_07,$2 ; Jump to address 0x026024
		ScriptJump  HandleMap,$3 ; Jump	to address 0x02515E
		ScriptJump  ShopSteal_07,$4 ; Jump to address 0x025FAC
		ScriptJump  ShopConfirmMap_07,$5 ; Jump	to address 0x026030
		dc.b $24
		dc.b $A
		dc.w $2E0
		ScriptID    $21,$2	; Run text script at offset 0x02795C
					; 0xE021: PRINT	MSG 0x006F, MSGBOX CLEARED, END: "{6A}Attention, mon petit!{66}Ce livre	est dangereux,{66}rempli de sorts imprévisibles!{6D}"
		ScriptJump  HandleSpellbook,$3 ; Jump to address 0x0251AC
		ScriptID    $26,$4	; Run text script at offset 0x027966
					; 0xE026: PRINT	MSG 0x0074, MSGBOX CLEARED, END: "{6A}Non, non!{66}Ne l'emmenez pas dehors!{66}Il est beaucoup trop puissant!{6D}"
		dc.b $25
		dc.b $14
		dc.w $2D9
		ScriptID    $1F,$2	; Run text script at offset 0x027958
					; 0xE01F: PRINT	MSG 0x006D, MSGBOX CLEARED, END: "{6A}{69} Ors la nuit.{66}Placez-le sur le comptoir{66}si vous	voulez rester.{6D}"
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x0250F0
		ScriptID    $4,$4	; Run text script at offset 0x027922
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{6A}Mais non!{66}Vous	ne pouvez pas{66}emporter notre	matériel!{6D}"
		ScriptID    $40,$5	; Run text script at offset 0x02799A
					; 0xA040: PRINT	MSG 0x008E, END: "{6A}{69} Ors la nuit.{66}Ca marche?{66}{67}"
		ScriptID    $35,$6	; Run text script at offset 0x027984
					; 0xE035: PRINT	MSG 0x0083, MSGBOX CLEARED, END: "{6A}Merci bien.{66}Votre chambre est en haut.{6D}"
		ScriptID    $36,$7	; Run text script at offset 0x027986
					; 0xE036: PRINT	MSG 0x0084, MSGBOX CLEARED, END: "{6A}Revenez quand{66}vous voulez vous	reposer.{6D}"
		ScriptID    $41,$8	; Run text script at offset 0x02799C
					; 0xE041: PRINT	MSG 0x008F, MSGBOX CLEARED, END: "{6A}C'est pas de chance!{66}Revenez quand vous serez{66}un peu plus riche!{6D}"
		ScriptID    $20,$9	; Run text script at offset 0x02795A
					; 0xE020: PRINT	MSG 0x006E, MSGBOX CLEARED, END: "{6A}C'est dommage...{6D}"
		dc.b $26
		dc.b $C
		dc.w $2D9
		ScriptID    $37,$2	; Run text script at offset 0x027988
					; 0xE037: PRINT	MSG 0x0085, MSGBOX CLEARED, END: "{6A}C'est le {6E}.{66}Apportez-le au comptoir.{6D}"
		ScriptJump  HandleMap,$3 ; Jump	to address 0x02515E
		ScriptID    $4,$4	; Run text script at offset 0x027922
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{6A}Mais non!{66}Vous	ne pouvez pas{66}emporter notre	matériel!{6D}"
		ScriptID    $38,$5	; Run text script at offset 0x02798A
					; 0xA038: PRINT	MSG 0x0086, END: "{6A}Vous voulez voir{66}le {6E}?{67}"
		dc.b $25
		dc.b $14
		dc.w $2E9
		ScriptID    $1F,$2	; Run text script at offset 0x027958
					; 0xE01F: PRINT	MSG 0x006D, MSGBOX CLEARED, END: "{6A}{69} Ors la nuit.{66}Placez-le sur le comptoir{66}si vous	voulez rester.{6D}"
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x0250F0
		ScriptID    $4,$4	; Run text script at offset 0x027922
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{6A}Mais non!{66}Vous	ne pouvez pas{66}emporter notre	matériel!{6D}"
		ScriptID    $40,$5	; Run text script at offset 0x02799A
					; 0xA040: PRINT	MSG 0x008E, END: "{6A}{69} Ors la nuit.{66}Ca marche?{66}{67}"
		ScriptID    $35,$6	; Run text script at offset 0x027984
					; 0xE035: PRINT	MSG 0x0083, MSGBOX CLEARED, END: "{6A}Merci bien.{66}Votre chambre est en haut.{6D}"
		ScriptID    $36,$7	; Run text script at offset 0x027986
					; 0xE036: PRINT	MSG 0x0084, MSGBOX CLEARED, END: "{6A}Revenez quand{66}vous voulez vous	reposer.{6D}"
		ScriptID    $41,$8	; Run text script at offset 0x02799C
					; 0xE041: PRINT	MSG 0x008F, MSGBOX CLEARED, END: "{6A}C'est pas de chance!{66}Revenez quand vous serez{66}un peu plus riche!{6D}"
		ScriptID    $20,$9	; Run text script at offset 0x02795A
					; 0xE020: PRINT	MSG 0x006E, MSGBOX CLEARED, END: "{6A}C'est dommage...{6D}"
		dc.b 0
		dc.b 6
		dc.w $307
		ScriptJump  GainItem,$2	; Jump to address 0x034B66
		dc.b $12
		dc.b 6
		dc.w $307
		ScriptJump  GainItem,$2	; Jump to address 0x034B66
		dc.b $21
		dc.b $18
		dc.w $FFFF
		ScriptID    $8,$2	; Run text script at offset 0x02792A
					; 0xE008: PRINT	MSG 0x0056, MSGBOX CLEARED, END: "{6A}C'est un {6E}.{6D}"
		ScriptJump  HandleStatusCure,$3	; Jump to address 0x02500C
		ScriptID    $7,$4	; Run text script at offset 0x027928
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{6A}Arrêtez!{66}Cela appartient à la déesse.{66}Soyez	maudit!{6D}"
		ScriptID    $9,$5	; Run text script at offset 0x02792C
					; 0xA009: PRINT	MSG 0x0057, END: "{6A}Il vous faut une cure{66}de désintoxication?{71}{6A}Faites une{66}contribution de	{69} Ors.  {67}"
		ScriptID    $A,$6	; Run text script at offset 0x02792E
					; 0xE00A: PRINT	MSG 0x0058, MSGBOX CLEARED, END: "{6A}Tous mes remerciements.{66}A présent, ne bougez plus.{66}Ca ne vous fera pas mal...{6D}"
		ScriptID    $B,$7	; Run text script at offset 0x027930
					; 0xE00B: PRINT	MSG 0x0059, MSGBOX CLEARED, END: "{6A}Voilà.  Votre organisme{66}s'est débarrassé du poison.{66}A l'avenir, soyez prudent!{6D}"
		ScriptID    $C,$8	; Run text script at offset 0x027932
					; 0xE00C: PRINT	MSG 0x005A, MSGBOX CLEARED, END: "{6A}Vous ne pouvez pas{66}faire une contribution?{71}{6A}Alors, je ne	peux pas{66}vous aider.	 Ce sera pour une{66}autre fois	peut-être...{6D}"
		ScriptID    $D,$9	; Run text script at offset 0x027934
					; 0xE00D: PRINT	MSG 0x005B, MSGBOX CLEARED, END: "{6A}Je crains	alors que{66}vous ne soyez plus	longtemps{66}de	ce monde.{71}{6A}Que la	déesse ait{66}pitié de votre âme.{6D}"
		ScriptID    $E,$A	; Run text script at offset 0x027936
					; 0xE00E: PRINT	MSG 0x005C, MSGBOX CLEARED, END: "{6A}Hmmm...  {66}Pas de poison...  Pas besoin{66}de désintoxication!{6D}"
		dc.w $100
		dc.b $22
		dc.b $18
		dc.w $FFFF
		ScriptID    $F,$2	; Run text script at offset 0x027938
					; 0xE00F: PRINT	MSG 0x005D, MSGBOX CLEARED, END: "{6A}C'est un{66}{6E}.{66}Il décrit des malédictions.{6D}"
		ScriptJump  HandleStatusCure,$3	; Jump to address 0x02500C
		ScriptID    $7,$4	; Run text script at offset 0x027928
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{6A}Arrêtez!{66}Cela appartient à la déesse.{66}Soyez	maudit!{6D}"
		ScriptID    $10,$5	; Run text script at offset 0x02793A
					; 0xA010: PRINT	MSG 0x005E, END: "{6A}Avez-vous	de quoi{66}contribuer {69} Ors afin{71}{6A}d'ôter la malédiction?{67}"
		ScriptID    $A,$6	; Run text script at offset 0x02792E
					; 0xE00A: PRINT	MSG 0x0058, MSGBOX CLEARED, END: "{6A}Tous mes remerciements.{66}A présent, ne bougez plus.{66}Ca ne vous fera pas mal...{6D}"
		ScriptID    $11,$7	; Run text script at offset 0x02793C
					; 0xE011: PRINT	MSG 0x005F, MSGBOX CLEARED, END: "{6A}Et hop!{66}La malédiction	est levée!{6D}"
		ScriptID    $C,$8	; Run text script at offset 0x027932
					; 0xE00C: PRINT	MSG 0x005A, MSGBOX CLEARED, END: "{6A}Vous ne pouvez pas{66}faire une contribution?{71}{6A}Alors, je ne	peux pas{66}vous aider.	 Ce sera pour une{66}autre fois	peut-être...{6D}"
		ScriptID    $D,$9	; Run text script at offset 0x027934
					; 0xE00D: PRINT	MSG 0x005B, MSGBOX CLEARED, END: "{6A}Je crains	alors que{66}vous ne soyez plus	longtemps{66}de	ce monde.{71}{6A}Que la	déesse ait{66}pitié de votre âme.{6D}"
		ScriptID    $12,$A	; Run text script at offset 0x02793E
					; 0xE012: PRINT	MSG 0x0060, MSGBOX CLEARED, END: "{6A}J'aurais tant voulu{66}vous aider, mais...{71}{6A}Aucune malédiction{66}ne pèse sur vous!{6D}"
		dc.w $800
		dc.b $11
		dc.b $18
		dc.w $FFFF
		ScriptID    $13,$2	; Run text script at offset 0x027940
					; 0xE013: PRINT	MSG 0x0061, MSGBOX CLEARED, END: "{6A}C'est un {6E}.{66}C'est indispensable dans le{66}traitement des hallucinations.{6D}"
		ScriptJump  HandleStatusCure,$3	; Jump to address 0x02500C
		ScriptID    $7,$4	; Run text script at offset 0x027928
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{6A}Arrêtez!{66}Cela appartient à la déesse.{66}Soyez	maudit!{6D}"
		ScriptID    $14,$5	; Run text script at offset 0x027942
					; 0xA014: PRINT	MSG 0x0062, END: "{6A}Avez-vous	de quoi{66}contribuer {69} Ors afin{71}{6A}de bénéficier{66}du traitement?{67}"
		ScriptID    $A,$6	; Run text script at offset 0x02792E
					; 0xE00A: PRINT	MSG 0x0058, MSGBOX CLEARED, END: "{6A}Tous mes remerciements.{66}A présent, ne bougez plus.{66}Ca ne vous fera pas mal...{6D}"
		ScriptID    $15,$7	; Run text script at offset 0x027944
					; 0xE015: PRINT	MSG 0x0063, MSGBOX CLEARED, END: "{6A}Ca y est!{66}Vos hallucinations{66}se sont évanouies!{6D}"
		ScriptID    $C,$8	; Run text script at offset 0x027932
					; 0xE00C: PRINT	MSG 0x005A, MSGBOX CLEARED, END: "{6A}Vous ne pouvez pas{66}faire une contribution?{71}{6A}Alors, je ne	peux pas{66}vous aider.	 Ce sera pour une{66}autre fois	peut-être...{6D}"
		ScriptID    $D,$9	; Run text script at offset 0x027934
					; 0xE00D: PRINT	MSG 0x005B, MSGBOX CLEARED, END: "{6A}Je crains	alors que{66}vous ne soyez plus	longtemps{66}de	ce monde.{71}{6A}Que la	déesse ait{66}pitié de votre âme.{6D}"
		ScriptID    $16,$A	; Run text script at offset 0x027946
					; 0xE016: PRINT	MSG 0x0064, MSGBOX CLEARED, END: "{6A}Comment!?{66}Mais	vous ne	souffrez pas{66}d'hallucinations actuellement!{6D}"
		dc.w $200
		dc.b $23
		dc.b $18
		dc.w $FFFF
		ScriptJump  HandleIdentifyRecordBook,$2	; Jump to address 0x02603C
		ScriptJump  HandleRecordBookUse,$3 ; Jump to address 0x02508C
		ScriptJump  HandleRecordBookTheft,$4 ; Jump to address 0x02607C
		ScriptJump  RequestGameSaveMsg,$5 ; Jump to address 0x026044
		ScriptJump  InitiateGameSaveMsg,$6 ; Jump to address 0x02604C
		ScriptJump  GameSaveCompleteMsg,$7 ; Jump to address 0x026054
		ScriptJump  GameSaveRefusedMsg,$8 ; Jump to address 0x02605C
		ScriptJump  RequestGameContinueMsg,$9 ;	Jump to	address	0x026064
		ScriptJump  ConfirmGameContinueMsg,$A ;	Jump to	address	0x02606C
		ScriptJump  ConfirmGameStopMsg,$B ; Jump to address 0x026074
		dc.b $25
		dc.b $14
		dc.w $FFFF
		ScriptID    $1F,$2	; Run text script at offset 0x027958
					; 0xE01F: PRINT	MSG 0x006D, MSGBOX CLEARED, END: "{6A}{69} Ors la nuit.{66}Placez-le sur le comptoir{66}si vous	voulez rester.{6D}"
		ScriptJump  HandleInnStay,$3 ; Jump to address 0x0250F0
		ScriptID    $4,$4	; Run text script at offset 0x027922
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{6A}Mais non!{66}Vous	ne pouvez pas{66}emporter notre	matériel!{6D}"
		ScriptID    $40,$5	; Run text script at offset 0x02799A
					; 0xA040: PRINT	MSG 0x008E, END: "{6A}{69} Ors la nuit.{66}Ca marche?{66}{67}"
		ScriptID    $35,$6	; Run text script at offset 0x027984
					; 0xE035: PRINT	MSG 0x0083, MSGBOX CLEARED, END: "{6A}Merci bien.{66}Votre chambre est en haut.{6D}"
		ScriptID    $36,$7	; Run text script at offset 0x027986
					; 0xE036: PRINT	MSG 0x0084, MSGBOX CLEARED, END: "{6A}Revenez quand{66}vous voulez vous	reposer.{6D}"
		ScriptID    $41,$8	; Run text script at offset 0x02799C
					; 0xE041: PRINT	MSG 0x008F, MSGBOX CLEARED, END: "{6A}C'est pas de chance!{66}Revenez quand vous serez{66}un peu plus riche!{6D}"
		ScriptID    $20,$9	; Run text script at offset 0x02795A
					; 0xE020: PRINT	MSG 0x006E, MSGBOX CLEARED, END: "{6A}C'est dommage...{6D}"
		dc.b $26
		dc.b $C
		dc.w $FFFF
		ScriptID    $37,$2	; Run text script at offset 0x027988
					; 0xE037: PRINT	MSG 0x0085, MSGBOX CLEARED, END: "{6A}C'est le {6E}.{66}Apportez-le au comptoir.{6D}"
		ScriptJump  HandleMap,$3 ; Jump	to address 0x02515E
		ScriptID    $4,$4	; Run text script at offset 0x027922
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{6A}Mais non!{66}Vous	ne pouvez pas{66}emporter notre	matériel!{6D}"
		ScriptID    $38,$5	; Run text script at offset 0x02798A
					; 0xA038: PRINT	MSG 0x0086, END: "{6A}Vous voulez voir{66}le {6E}?{67}"
		dc.w $FFFF
