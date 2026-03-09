; ---------------------------------------------------------------------------

XS_001B:
		move.w	#$21,d0	; '!'
		bsr.w	TestFlagBit
		bne.s	XS_001B_0
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $418,$0	; Prompt:	Run text script	at offset 0x02814A
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0xA382: PRINT	MSG 0x03D0, END: "{6A}Tu vas chez les{66}voleurs?{67}"
		ScriptID    $41A,$1	; Answer 'yes': Run text script at offset 0x02814E
					; 0xE383: PRINT	MSG 0x03D1, MSGBOX CLEARED, END: "{6A}Allons-y!{6D}"
		ScriptID    $41B,$2	; Answer 'no':  Run text script at offset 0x028150
					; 0xE384: PRINT	MSG 0x03D2, MSGBOX CLEARED, END: "{6A}Pourquoi pas?{66}Ce sera amusant!{6D}"
; ---------------------------------------------------------------------------
		bra.s	XS_001B_1
; ---------------------------------------------------------------------------

XS_001B_0:				; CODE XREF: ROM:00027484j
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $41C,$0	; Prompt:	Run text script	at offset 0x028152
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0xA385: PRINT	MSG 0x03D3, END: "{6A}Tu vas chez les{66}voleurs?{67}"
		ScriptID    $41E,$1	; Answer 'yes': Run text script at offset 0x028156
					; 0xE386: PRINT	MSG 0x03D4, MSGBOX CLEARED, END: "{6A}Allons-y!{6D}"
		ScriptID    $41F,$2	; Answer 'no':  Run text script at offset 0x028158
					; 0xE387: PRINT	MSG 0x03D5, MSGBOX CLEARED, END: "{6A}C'est vrai!  On{66}n'est pas obligé d'y aller!{6D}"
; ---------------------------------------------------------------------------

XS_001B_1:				; CODE XREF: ROM:00027490j
		rts
; ---------------------------------------------------------------------------

XS_001C:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $420,$0	; Prompt:	Run text script	at offset 0x02815A
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0xA388: PRINT	MSG 0x03D6, END: "{6A}Tu retournes en ville?{67}"
		ScriptID    $422,$1	; Answer 'yes': Run text script at offset 0x02815E
					; 0xE389: PRINT	MSG 0x03D7, MSGBOX CLEARED, END: "{6A}D'accord.  Allons-y!{6D}"
		ScriptID    $423,$2	; Answer 'no':  Run text script at offset 0x028160
					; 0xE38A: PRINT	MSG 0x03D8, MSGBOX CLEARED, END: "{6A}Il nous reste des	choses{66}à faire ici.{6D}"
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
		ScriptID    $463,$0	; Run text script at offset 0x0281E0
					; 0x0027: LOAD 0x0027 INTO 0xFF1196 (Estampe)
					; 0x83A8: PRINT	MSG 0x03F6: "Ryle donne	l'{6E}.{6D}"
					; 0x182E: LOAD CHARACTER SCRIPT	Kayla (0x002E)
					; 0xE3A9: PRINT	MSG 0x03F7, MSGBOX CLEARED, END: "{6A}Voilà un garçon bien sage!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_002E:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $471,$0	; Run text script at offset 0x0281FC
					; 0x181D: LOAD CHARACTER SCRIPT	Purin (0x001D)
					; 0xA3AF: PRINT	MSG 0x03FD, END: "{6A}Salut.  Je m'appelle{66}Holly.  J'ai douze ans.  Mme{66}Yard est ma maman.  On joue?{71}{6A}Je t'aime bien!{66}Tu veux devenir mon{66}petit ami?{67}"
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
		ScriptID    $1A5,$0	; Run text script at offset 0x027C64
					; 0x18AA: LOAD CHARACTER SCRIPT	* (0x00AA)
					; 0xE175: PRINT	MSG 0x01C3, MSGBOX CLEARED, END: "{6A}Sans sauf-conduit,{66}vous n'enterez pas!{6D}"
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1A9,$0	; Run text script at offset 0x027C6C
					; 0x18AB: LOAD CHARACTER SCRIPT	* (0x00AB)
					; 0xE178: PRINT	MSG 0x01C6, MSGBOX CLEARED, END: "{6A}Je ne sens plus mes{66}pauvres jambes!  Ca fait des{66}heures que	je suis	debout...{6D}"
; ---------------------------------------------------------------------------
		bra.s	XS_0036_5
; ---------------------------------------------------------------------------

XS_0036_0:				; CODE XREF: ROM:000274C6j
		move.l	d0,-(sp)
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $483,$0	; Run text script at offset 0x028220
					; 0x18AA: LOAD CHARACTER SCRIPT	* (0x00AA)
					; 0x83B8: PRINT	MSG 0x0406: "{6A}Vous pouvez entrer, mais{71}{6A}pas question de passer{66}ce portail gratuitement!{71}{6A}Ecoutez, je suis à sec,{66}question fric, et	il faut	des{71}godasses	pour le	marmot...{71}{6A}Vous voyez le topo?...{71}"
					; 0x10C8: LOAD 200 INTO	NUMERIC	VARIABLE
					; 0xA3B9: PRINT	MSG 0x0407, END: "{6A}Hé hé, je	vous laisse{66}passer pour {69}	Ors, d'acc?{67}"
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
        ScriptID    $488,$0     ; Run text script at offset 0x02822A
                                ; 0xE3BB: PRINT MSG 0x0409, MSGBOX CLEARED, END: "{6A}C'est tout!{66}Bon, vous pouvez y aller!{6D}"
; ---------------------------------------------------------------------------
		bra.s	XS_0036_2

XS_0036_1:				; CODE XREF: ROM:000274EAj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $487,$0	; Run text script at offset 0x028228
					; 0xE3BA: PRINT	MSG 0x0408, MSGBOX CLEARED, END: "{6A}Merci!  Vous êtes	plein{66}aux as!  Hé, ça vous dirait{66}de gagner un paquet de blé?{71}{6A}Faut	aller chez Petit Pois!{66}C'est en ville.  Avec un peu de{66}veine, vous ramasserez de quoi{71}{6A}vous payer du bon temps!{6D}"
; ---------------------------------------------------------------------------
XS_0036_2:
		bra.s	XS_0036_4
; ---------------------------------------------------------------------------

XS_0036_3:				; CODE XREF: ROM:000274DCj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $489,$0	; Run text script at offset 0x02822C
					; 0xE3BC: PRINT	MSG 0x040A, MSGBOX CLEARED, END: "{6A}Misanthrope, va!{66}Allez, vous pouvez passer.{6D}"
; ---------------------------------------------------------------------------

XS_0036_4:				; CODE XREF: ROM:00027502j
		move.l	(sp)+,d0

XS_0036_5:				; CODE XREF: ROM:000274D0j
		rts
; ---------------------------------------------------------------------------

XS_0037:
		move.l	d0,-(sp)
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $48A,$0	; Run text script at offset 0x02822E
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0xA3BD: PRINT	MSG 0x040B, END: "{6A}Je suis passé maître{66}dans les arts martiaux!{66}Je peux vous donner une leçon.{71}{6A}Vous me défiez?{67}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0037_4
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $48C,$0	; Run text script at offset 0x028232
					; 0x1014: LOAD 20 INTO NUMERIC VARIABLE
					; 0xA3BE: PRINT	MSG 0x040C, END: "{6A}Donnez-moi{66}{69} Ors, d'accord?{67}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0037_4
		move.l	(g_PrintNumericDwordValue).l,d0
		jsr	j_RemoveGold
		bcc.s	XS_0037_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $48E,$0	; Run text script at offset 0x028236
					; 0xE3BF: PRINT	MSG 0x040D, MSGBOX CLEARED, END: "{6A}Je regrette, mais{66}c'est mon travail.{71}{6A}Je ne peux pas le faire{66}si vous n'avez pas d'argent.{6D}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	XS_0037_3
; ---------------------------------------------------------------------------

XS_0037_0:				; CODE XREF: ROM:0002752Ej
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $490,$0	; Run text script at offset 0x02823A
					; 0xA3C1: PRINT	MSG 0x040F, END: "{6A}Vous voulez que je{66}vous explique les règles?{67}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0037_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $491,$0	; Run text script at offset 0x02823C
					; 0xE3C2: PRINT	MSG 0x0410, MSGBOX CLEARED, END: "{6A}Je me transformerai en{66}une série de monstres qui{66}vous attaqueront{71}{6A}l'un après l'autre.{71}{6A}Je jugerai votre niveau
					;                                                 {66}selon le nombre de monstres{66}que vous aurez tués sans{71}{6A}vous faire toucher!{71}{6A}Dès que vous êtes{66}touché, c'est terminé.  Votre{66}récompense dépendra du{71}{6A}nombre de monstres{66}tués.  Vous avez compris?{71}{6A}Attention...{68}A vos marques...{66}Prêt?...Partez!{71}"
; ---------------------------------------------------------------------------
		bra.s	XS_0037_2
; ---------------------------------------------------------------------------

XS_0037_1:				; CODE XREF: ROM:00027544j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $492,$0	; Run text script at offset 0x02823E
					; 0xE3C3: PRINT	MSG 0x0411, MSGBOX CLEARED, END: "{6A}Attention...{68}A	vos marques...{66}Prêt?...Partez!{6D}"
; ---------------------------------------------------------------------------

XS_0037_2:				; CODE XREF: ROM:0002754Aj
		st	(g_YesNoPromptResult).l

XS_0037_3:				; CODE XREF: ROM:0002753Aj
					; ROM:0002755Ej
		move.l	(sp)+,d0
		rts
; ---------------------------------------------------------------------------

XS_0037_4:				; CODE XREF: ROM:00027516j
					; ROM:00027520j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $48F,$0	; Run text script at offset 0x028238
					; 0xE3C0: PRINT	MSG 0x040E, MSGBOX CLEARED, END: "{6A}Soyez prudent!{6D}"
; ---------------------------------------------------------------------------
		bra.s	XS_0037_3
; ---------------------------------------------------------------------------

XS_0038:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $493,$0	; Prompt:	Run text script	at offset 0x028240
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0x83C4: PRINT	MSG 0x0412: "{6A}Bravo!	 Quel talent!{66}Mais il vous manque encore{66}beaucoup	de force!{71}"
					; 0x1019: LOAD 25 INTO NUMERIC VARIABLE
					; 0xA3C5: PRINT	MSG 0x0413, END: "{6A}Je vous donne {69} Ors{66}si vous	arrêtez	maintenant.{71}{6A}Vous	continuez?{66}{67}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028B8E
		ScriptID    $497,$2	; Answer 'no':  Run text script at offset 0x028248
					; 0x83C6: PRINT	MSG 0x0414: "{6A}{69} Ors.  Prenez!{71}"
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0xE3C7: PRINT	MSG 0x0415, MSGBOX CLEARED, END: "{6A}Passez quand vous{66}en avez envie!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0039:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $49B,$0	; Prompt:	Run text script	at offset 0x028250
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0x83C8: PRINT	MSG 0x0416: "{6A}Vous avez peut-être{66}plus de	force encore que{66}les	gardes du château...{71}"
					; 0x1032: LOAD 50 INTO NUMERIC VARIABLE
					; 0xA3C9: PRINT	MSG 0x0417, END: "{6A}Je vous donne {69} Ors{66}si vous	arrêtez	maintenant.{71}{6A}Vous	voulez continuer?{67}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028B8E
		ScriptID    $497,$2	; Answer 'no':  Run text script at offset 0x028248
					; 0x83C6: PRINT	MSG 0x0414: "{6A}{69} Ors.  Prenez!{71}"
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0xE3C7: PRINT	MSG 0x0415, MSGBOX CLEARED, END: "{6A}Passez quand vous{66}en avez envie!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003A:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $49F,$0	; Prompt:	Run text script	at offset 0x028258
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0x83CA: PRINT	MSG 0x0418: "{6A}Parfait!{66}Vous n'avez plus besoin{66}d'entraînement!{71}"
					; 0x1064: LOAD 100 INTO	NUMERIC	VARIABLE
					; 0xA3CB: PRINT	MSG 0x0419, END: "{6A}Prenez {69} Ors!{66}Vous voulez continuer?{67}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028B8E
		ScriptID    $497,$2	; Answer 'no':  Run text script at offset 0x028248
					; 0x83C6: PRINT	MSG 0x0414: "{6A}{69} Ors.  Prenez!{71}"
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0xE3C7: PRINT	MSG 0x0415, MSGBOX CLEARED, END: "{6A}Passez quand vous{66}en avez envie!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003B:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $4A3,$0	; Prompt:	Run text script	at offset 0x028260
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0x83CC: PRINT	MSG 0x041A: "{6A}J'abandonne la partie!{66}Jamais je n'ai vu quelqu'un d'aussi{66}fort que vous!{71}"
					; 0x10C8: LOAD 200 INTO	NUMERIC	VARIABLE
					; 0xA3CD: PRINT	MSG 0x041B, END: "{6A}Je vous en prie...{66}Prenez les {69} Ors.{66}Vous désirez continuer?{67}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028B8E
		ScriptID    $497,$2	; Answer 'no':  Run text script at offset 0x028248
					; 0x83C6: PRINT	MSG 0x0414: "{6A}{69} Ors.  Prenez!{71}"
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0xE3C7: PRINT	MSG 0x0415, MSGBOX CLEARED, END: "{6A}Passez quand vous{66}en avez envie!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003C:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $4A7,$0	; Prompt:	Run text script	at offset 0x028268
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0x83CE: PRINT	MSG 0x041C: "{6A}S'il....{68}vous plaît...{68}{66}Je n'en...  peux ...plus!!...{66}Epuisé!!....{71}"
					; 0x1190: LOAD 400 INTO	NUMERIC	VARIABLE
					; 0xA3CF: PRINT	MSG 0x041D, END: "{6A}Prenez {69} Ors...{66}Vous voulez	vraiment{66}continuer?	Encore??{67}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028B8E
		ScriptID    $497,$2	; Answer 'no':  Run text script at offset 0x028248
					; 0x83C6: PRINT	MSG 0x0414: "{6A}{69} Ors.  Prenez!{71}"
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0xE3C7: PRINT	MSG 0x0415, MSGBOX CLEARED, END: "{6A}Passez quand vous{66}en avez envie!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_003F:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4B6,$0	; Run text script at offset 0x028286
					; 0x181B: LOAD CHARACTER SCRIPT	Marchand (0x001B)
					; 0x83D4: PRINT	MSG 0x0422: "{6A}Bienvenue chez	Petet Pois!{66}Approchez!  Amusez-vous!{66}Mettez-vous en plein	les poches!{71}"
					; 0x1032: LOAD 50 INTO NUMERIC VARIABLE
					; 0xA3D5: PRINT	MSG 0x0423, END: "{6A}{69} Ors pour jouer{66}une fois.	D'accord?{67}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	XS_003F_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4BD,$0	; Run text script at offset 0x028294
					; 0xE3D8: PRINT	MSG 0x0426, MSGBOX CLEARED, END: "{6A}Vous êtes	fou?{66}Vous n'aimez pas le jeu?{6D}"
; ---------------------------------------------------------------------------
		bra.s	XS_003F_4
; ---------------------------------------------------------------------------

XS_003F_0:				; CODE XREF: ROM:000275A4j
		move.l	(g_PrintNumericDwordValue).l,d0
		jsr	j_RemoveGold
		bcc.s	XS_003F_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4BC,$0	; Run text script at offset 0x028292
					; 0xE3D7: PRINT	MSG 0x0425, MSGBOX CLEARED, END: "{6A}Aïe!  C'est pas de chance!{66}Revenez quand vous aurez{66}plein d'argent !!{6D}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	XS_003F_4
; ---------------------------------------------------------------------------

XS_003F_1:				; CODE XREF: ROM:000275B8j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4BA,$0	; Run text script at offset 0x02828E
					; 0x181B: LOAD CHARACTER SCRIPT	Marchand (0x001B)
					; 0xA3D6: PRINT	MSG 0x0424, END: "{6A}Merci.  Vous voulez{66}savoir comment on joue?{67}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_003F_2
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4BE,$0	; Run text script at offset 0x028296
					; 0xE3D9: PRINT	MSG 0x0427, MSGBOX CLEARED, END: "{6A}Jetez la balle par dessus{66}le comptoir,	sur les	plateaux{66}qui	se déplacent...{71}{6A}Le montant des gains{66}dépend de la vitesse{71}{6A}du plateau sur
					;                                                 {66}lequel la balle se	pose!{66}400, 100, 50.{71}{6A}Si la balle glisse et{66}s'en va, vous avez perdu!  Vous{66}n'avez droit qu'à un seul coup.{71}{6A}Vous êtes prêt?{66}Bien, alors...Allons-y!{6D}"
; ---------------------------------------------------------------------------
		bra.s	XS_003F_3
; ---------------------------------------------------------------------------

XS_003F_2:				; CODE XREF: ROM:000275CEj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4BF,$0	; Run text script at offset 0x028298
					; 0xE3DA: PRINT	MSG 0x0428, MSGBOX CLEARED, END: "{6A}Maintenant, essayons!{6D}"
; ---------------------------------------------------------------------------

XS_003F_3:				; CODE XREF: ROM:000275D4j
		st	(g_YesNoPromptResult).l

XS_003F_4:				; CODE XREF: ROM:000275AAj
					; ROM:000275C4j
		rts
; ---------------------------------------------------------------------------

XS_0042:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4C7,$0	; Run text script at offset 0x0282A8
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0xA3DF: PRINT	MSG 0x042D, END: "{6A}Vous avez	l'air si fort!{66}Si je vous paie,{71}{6A}vous voudrez bien me{66}"{6A}rendre un service?{67}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0042_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4C9,$0	; Run text script at offset 0x0282AC
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0xE3E0: PRINT	MSG 0x042E, MSGBOX CLEARED, END: "{6A}La pièce en haut est{66}dans un état épouvantable.{66}Pouvez-vous	ranger les{71}{6A}jarres sur les étagères?{71}{6A}Mon mari collectionne{66}les jarres...{6D}"
; ---------------------------------------------------------------------------
		bra.s	XS_0042_1
; ---------------------------------------------------------------------------

XS_0042_0:				; CODE XREF: ROM:000275EAj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4CB,$0	; Run text script at offset 0x0282B0
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0xE3E1: PRINT	MSG 0x042F, MSGBOX CLEARED, END: "{6A}Très bien!{66}Je le ferai	moi-même!{6D}"
; ---------------------------------------------------------------------------

XS_0042_1:				; CODE XREF: ROM:000275F0j
		rts
; ---------------------------------------------------------------------------

XS_0043:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4CD,$0	; Run text script at offset 0x0282B4
					; 0x140F: SET BIT 7 OF FLAG 0x001
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0x83E2: PRINT	MSG 0x0430: "{6A}Merci!{66}Voici la récompense...{71}"
					; 0x1002: LOAD 2 INTO NUMERIC VARIABLE
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0xE3E3: PRINT	MSG 0x0431, MSGBOX CLEARED, END: "{6A}Aidez-moi	de nouveau.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0046:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4DE,$0	; Run text script at offset 0x0282D6
					; 0x181E: LOAD CHARACTER SCRIPT	Arthur (0x001E)
					; 0xA3E9: PRINT	MSG 0x0437, END: "{6A}Ceci est pour toi!{71}"
; ---------------------------------------------------------------------------
		trap	#0
; ---------------------------------------------------------------------------
		dc.w SND_MusicChestOpen
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4E0,$0	; Run text script at offset 0x0282DA
					; 0x181E: LOAD CHARACTER SCRIPT	Arthur (0x001E)
					; 0x10FA: LOAD 250 INTO	NUMERIC	VARIABLE
					; 0xA3EA: PRINT	MSG 0x0438, END: "{6A}Le serviteur d'Arthur{66}gagne {69} Ors.{71}"
; ---------------------------------------------------------------------------
		jsr	(j_RestoreBGM).l
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4E3,$0	; Run text script at offset 0x0282E0
					; 0x181E: LOAD CHARACTER SCRIPT	Arthur (0x001E)
					; 0x83EB: PRINT	MSG 0x0439: "{6A}Si le duc m'appelle,{66}invente une excuse, et{66}puis débrouille-toi...{71}"
					; 0x18E9: LOAD CHARACTER SCRIPT	* (0x00E9)
					; 0xE3EC: PRINT	MSG 0x043A, MSGBOX CLEARED, END: "{6A}Compris!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0048:
		moveq	#$F,d0
		bsr.w	TestPlayerStatus
		beq.s	loc_2762A
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4EE,$0	; Run text script at offset 0x0282F6
					; 0x1813: LOAD CHARACTER SCRIPT	Caissiere (0x0013)
					; 0xE3F0: PRINT	MSG 0x043E, MSGBOX CLEARED, END: "{6A}Je ne peux pas vous{66}jeter un sort maintenant.{66}Aller	vous faire soigner à{71}{6A}l'église d'abord.{6D}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	locret_27634
; ---------------------------------------------------------------------------

loc_2762A:				; CODE XREF: ROM:0002761Cj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4E9,$0	; Run text script at offset 0x0282EC
					; 0x141C: SET BIT 4 OF FLAG 0x003
					; 0x1813: LOAD CHARACTER SCRIPT	Caissiere (0x0013)
					; 0xE3EE: PRINT	MSG 0x043C, MSGBOX CLEARED, END: "{6A}Je sais, je sais.{66}Les jeunes de votre age{66}veulent tous y entrer!{71}{6A}Aussitôt dit...{66}{73}Hamina, hamena, hamana...{66}{73}Enuej sniom	ria'l tia li'uq!{6D}"
; ---------------------------------------------------------------------------
		st	(g_YesNoPromptResult).l

locret_27634:				; CODE XREF: ROM:00027628j
		rts
; ---------------------------------------------------------------------------

XS_005D:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $DB		; Bit 3	of flag	0x01B
		ScriptID    $526,$1	; Flag set:   Run text script at offset	0x028366
					; 0x1493: SET BIT 3 OF FLAG 0x012
					; 0xE40D: PRINT	MSG 0x045B, MSGBOX CLEARED, END: "{6A}A	propos,	je crois{66}qu'il est l'heure de vous{66}présenter à la fête.{71}{6A}Vous n'avez qu'à {66}passer à la salle des{66}banquets.{6D}"
		ScriptID    $525,$2	; Flag clear: Run text script at offset	0x028364
					; 0xE40C: PRINT	MSG 0x045A, MSGBOX CLEARED, END: "{6A}S'il vous plaît, ne parlez{66}à personne pour Julie...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_005E:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $528,$0	; Prompt:	Run text script	at offset 0x02836A
					; 0x182E: LOAD CHARACTER SCRIPT	Kayla (0x002E)
					; 0xA40E: PRINT	MSG 0x045C, END: "{6A}Hahahahahaha!{66}Quel plaisir de te revoir!{66}Hahahahahaha...  Haha!{71}{6A}Je t'attendais!{66}A présent, viens par ici!{67}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028B8E
		ScriptID    $530,$2	; Answer 'no':  Run text script at offset 0x02837A
					; 0x182E: LOAD CHARACTER SCRIPT	Kayla (0x002E)
					; 0xE412: PRINT	MSG 0x0460, MSGBOX CLEARED, END: "{6A}Tu m'as repoussée!{66}Jamais on ne m'a repoussée!{66}Quelle audace!{71}{6A}Ink!  Wally!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0064:				; CODE XREF: ROM:00027656j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $536,$0	; Run text script at offset 0x028386
					; 0x1BF1: LOAD SPECIAL CHARACTER Duke (0x09)
					; 0x8415: PRINT	MSG 0x0463: "{6A}Comme vous le savez,{66}un sorcier maléfique vit{71}{6A}dans la tour à	la sortie{66}de	la ville.  Il me fait du{66}tort, à moi	et à cette ville!{71}{6A}Ce magicien se	nomme{66}Mir, et depuis	qu'il s'est{66}installé dans la tour,{71}{6A}nous tremblons de peur!{66}Et nous avons respecté ses
					;                            {66}moindres désirs...{71}{6A}Plusieurs fois, j'ai été{66}sur le point d'envoyer des{66}soldats à la tour, mais sa{71}"
					; 0xA416: PRINT	MSG 0x0464, END: "{6A}puissante	magie aurait{66}pu blesser ou tuer des {66}habitants de	la ville innocents.{71}{6A}Ainsi, je lui donne tout{66}l'or qu'il exige.  Mais...{71}{6A}Nous n'en pouvons plus!{66}Cette situation a assez duré!{71}{6A}...  Oh, je vous demande{66}pardon...  Je m'emporte!...
					;                                 {66}Voulez-vous que j'explique{71}{6A}toute cette affaire{66}encore une fois?{67}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	XS_0064
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $539,$0	; Run text script at offset 0x02838C
					; 0x1BF1: LOAD SPECIAL CHARACTER Duke (0x09)
					; 0xE417: PRINT	MSG 0x0465, MSGBOX CLEARED, END: "{6A}Il est temps que Mir{66}pprenne une leçon!  La{66}ville de Mercator ne{71}{6A}connaîtra pas la paix{66}tant qu'il restera en vie!{71}{6A}Je vous ai fait venir{66}car vous êtes à même de{66}le détruire!  Naturellement,{71}{6A}un tel travail mérite{66}une belle récompense...  Je
					;                                                 {66}possède l'émeraude de Golan,{71}{6A}l'un des grands trésors{66}de notre pays.{71}{6A}Dexter, Zak, Ryle...{66}Vous serez les héros de tout{66}un peuple pour l'éternité!{71}{6A}Que la déesse vous aide!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0069:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $547,$0	; Prompt:	Run text script	at offset 0x0283A8
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0xA41E: PRINT	MSG 0x046C, END: "{6A}Ryle, tu te{66}couches pour la nuit?{67}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028B8E
		ScriptID    $549,$2	; Answer 'no':  Run text script at offset 0x0283AC
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0xE41F: PRINT	MSG 0x046D, MSGBOX CLEARED, END: "{6A}Allons explorer{66}le château!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0073:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $563,$0	; Run text script at offset 0x0283E0
					; 0x1064: LOAD 100 INTO	NUMERIC	VARIABLE
					; 0x18F4: LOAD CHARACTER SCRIPT	* (0x00F4)
					; 0xA42C: PRINT	MSG 0x047A, END: "{6A}Veux-tu investir{66}{69} Ors pour	moi?{67}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0073_1
		move.l	(g_PrintNumericDwordValue).l,d0
		jsr	j_RemoveGold
		bcs.s	XS_0073_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $567,$0	; Run text script at offset 0x0283E8
					; 0x14D2: SET BIT 2 OF FLAG 0x01A
					; 0xE42E: PRINT	MSG 0x047C, MSGBOX CLEARED, END: "{6A}Merci, petit!  Attends!{66}Je m'en vais doubler ta{66}mise!  Ce sera vite fait!{6D}"
; ---------------------------------------------------------------------------
		st	(g_YesNoPromptResult).l

XS_0073_0:				; CODE XREF: ROM:00027698j
		rts
; ---------------------------------------------------------------------------

XS_0073_1:				; CODE XREF: ROM:00027672j
					; ROM:00027680j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $566,$0	; Run text script at offset 0x0283E6
					; 0xE42D: PRINT	MSG 0x047B, MSGBOX CLEARED, END: "{6A}Le jeu de	l'argent{66}ne te tente pas?{6D}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l
		bra.s	XS_0073_0
; ---------------------------------------------------------------------------

XS_0075:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $153		; Bit 3	of flag	0x02A
		ScriptID    $56C,$1	; Flag set:   Run text script at offset	0x0283F2
					; 0x18F1: LOAD CHARACTER SCRIPT	* (0x00F1)
					; 0xA430: PRINT	MSG 0x047E, END: "{6A}Tiens, un	acheteur!{66}Vous voulez des médicaments?{66}On	les a tous!{71}"
		ScriptID    $56E,$2	; Flag clear: Run text script at offset	0x0283F6
					; 0x18F1: LOAD CHARACTER SCRIPT	* (0x00F1)
					; 0xA431: PRINT	MSG 0x047F, END: "{6A}Tiens, un	acheteur!{66}Vous voulez des articles{66}en tous genres...  On les a!{71}"
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $570,$0	; Run text script at offset 0x0283FA
					; 0xE432: PRINT	MSG 0x0480, MSGBOX CLEARED, END: "{6A}On a toute sorte{66}d'articles...  Et de bonne{66}qualité.  Pas de camelote!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0076:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $571,$0	; Prompt:	Run text script	at offset 0x0283FC
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0xA433: PRINT	MSG 0x0481, END: "{6A}Heh heh heh heh...{66}Voici une victime de plus!{71}{6A}Tu tiens à entrer{66}à tout prix dans la{66}Chambre des Morts-vivants?{67}"
		ScriptID    $573,$1	; Answer 'yes': Run text script at offset 0x028400
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0xE434: PRINT	MSG 0x0482, MSGBOX CLEARED, END: "{6A}Il est courageux!{66}Il faudra résoudre huit{66}énigmes dans huit	salles.{71}{6A}Si tu trouves la{66}solution pour une salle,{66}la torche s'éteindra!{71}{6A}Tu pourras traverser
					;                                                 {66}le fleuve quand tu auras{66}fourni la solution de{71}{6A}chaque énigme!{71}{6A}En cas d'échec...{66}heh heh heh, ta vie{66}prendra fin...{6D}"
		ScriptID    $575,$2	; Answer 'no':  Run text script at offset 0x028404
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0xE435: PRINT	MSG 0x0483, MSGBOX CLEARED, END: "{6A}Va-t'en!{66}Ne reviens plus jamais!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0077:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $577,$0	; Prompt:	Run text script	at offset 0x028408
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0xA436: PRINT	MSG 0x0484, END: "{6A}Hehe heh heh...{66}Il reste encore des énigmes{66}là-bas...{71}{6A}Tu désires vraiment{66}traverser le fleuve?{67}"
		ScriptID    $57A,$1	; Answer 'yes': Run text script at offset 0x02840E
					; 0xE438: PRINT	MSG 0x0486, MSGBOX CLEARED, END: "{6A}Très bien...  Heh	heh...{66}Je t'emmène à...{66}Gehenna!!{6D}"
		ScriptID    $579,$2	; Answer 'no':  Run text script at offset 0x02840C
					; 0xE437: PRINT	MSG 0x0485, MSGBOX CLEARED, END: "{6A}Heh heh heh...  En effet.{66}Vaut	mieux faire demi-tour!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0079:
		move.w	#ITM_ARMLET,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	XS_0079_0
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $57C,$0	; Prompt:	Run text script	at offset 0x028412
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0xA43A: PRINT	MSG 0x0488, END: "{6A}...  Impossible!...{66}Tu	es en vie?!{71}{6A}...	Tu rentres{66}en ville?{67}"
		ScriptID    $57F,$1	; Answer 'yes': Run text script at offset 0x028418
					; 0xE43C: PRINT	MSG 0x048A, MSGBOX CLEARED, END: "{6A}...  Allons...{6D}"
		ScriptID    $57E,$2	; Answer 'no':  Run text script at offset 0x028416
					; 0xE43B: PRINT	MSG 0x0489, MSGBOX CLEARED, END: "{6A}Fais comme tu veux.{6D}"
; ---------------------------------------------------------------------------
		bra.s	XS_0079_1
; ---------------------------------------------------------------------------

XS_0079_0:				; CODE XREF: ROM:000276CAj
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $581,$0	; Prompt:	Run text script	at offset 0x02841C
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0xA43E: PRINT	MSG 0x048C, END: "{6A}Heh heh heh...{66}L'enfer t'a plu...{71}{6A}Tu y retournes?{67}"
		ScriptID    $584,$1	; Answer 'yes': Run text script at offset 0x028422
					; 0xE440: PRINT	MSG 0x048E, MSGBOX CLEARED, END: "{6A}Heh heh heh...{6D}"
		ScriptID    $583,$2	; Answer 'no':  Run text script at offset 0x028420
					; 0xE43F: PRINT	MSG 0x048D, MSGBOX CLEARED, END: "{6A}Fais comme tu veux.{6D}"
; ---------------------------------------------------------------------------

XS_0079_1:				; CODE XREF: ROM:000276D6j
		rts
; ---------------------------------------------------------------------------

XS_007A:
		move.w	#ITM_ARMLET,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	XS_007A_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $580,$0	; Run text script at offset 0x02841A
					; 0xE43D: PRINT	MSG 0x048B, MSGBOX CLEARED, END: "{6A}Il y a bien quelque{66}chose chez	toi...	Mais je{66}ne vois pas ce que c'est...{6D}"
; ---------------------------------------------------------------------------
		bra.s	XS_007A_1
; ---------------------------------------------------------------------------

XS_007A_0:				; CODE XREF: ROM:000276ECj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $585,$0	; Run text script at offset 0x028424
					; 0xE441: PRINT	MSG 0x048F, MSGBOX CLEARED, END: "{6A}Heh heh...  Reviens{66}quand tus veux!  Les{66}morts-vivants attendent{71}{6A}toujours...{6D}"
; ---------------------------------------------------------------------------

XS_007A_1:				; CODE XREF: ROM:000276F2j
		rts
; ---------------------------------------------------------------------------

XS_007D:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $589,$0	; Prompt:	Run text script	at offset 0x02842C
					; 0x1834: LOAD CHARACTER SCRIPT	Mir (0x0034)
					; 0xA444: PRINT	MSG 0x0492, END: "{6A}Vous y entrez, quel{66}qu'en soit le prix à payer?{67}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028B8E
		ScriptID    $58B,$2	; Answer 'no':  Run text script at offset 0x028430
					; 0x1834: LOAD CHARACTER SCRIPT	Mir (0x0034)
					; 0xE445: PRINT	MSG 0x0493, MSGBOX CLEARED, END: "{6A}Partez maintenant!{66}Ne remettez	plus le{66}pied	dans cette tour!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_007E:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $58D,$0	; Prompt:	Run text script	at offset 0x028434
					; 0x1834: LOAD CHARACTER SCRIPT	Mir (0x0034)
					; 0xA446: PRINT	MSG 0x0494, END: "{6A}Je peux vous être	utile?{67}"
		ScriptJump  ClearTextbox,$1 ; Answer 'yes': Jump to address 0x028B8E
		ScriptID    $58F,$2	; Answer 'no':  Run text script at offset 0x028438
					; 0x1834: LOAD CHARACTER SCRIPT	Mir (0x0034)
					; 0xE447: PRINT	MSG 0x0495, MSGBOX CLEARED, END: "{6A}Faites demi-tour{66}tout de suite!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_007F:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $591,$0	; Prompt:	Run text script	at offset 0x02843C
					; 0x1834: LOAD CHARACTER SCRIPT	Mir (0x0034)
					; 0xA448: PRINT	MSG 0x0496, END: "{6A}Osez-vous	pénétrer{66}à l'intérieur?{67}"
		ScriptID    $593,$1	; Answer 'yes': Run text script at offset 0x028440
					; 0x1834: LOAD CHARACTER SCRIPT	Mir (0x0034)
					; 0xE449: PRINT	MSG 0x0497, MSGBOX CLEARED, END: "{6A}A	votre place je{66}ferais demi-tour...{6D}"
		ScriptID    $595,$2	; Answer 'no':  Run text script at offset 0x028444
					; 0x1834: LOAD CHARACTER SCRIPT	Mir (0x0034)
					; 0xE44A: PRINT	MSG 0x0498, MSGBOX CLEARED, END: "{6A}Ha ha ha ha ha ha...!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0089:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $5B8,$0	; Run text script at offset 0x02848A
					; 0x1834: LOAD CHARACTER SCRIPT	Mir (0x0034)
					; 0xA45B: PRINT	MSG 0x04A9, END: "{6A}Je vous envoie{66}directment au sol, d'accord?{67}"
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
		ScriptID    $5D2,$0	; Run text script at offset 0x0284BE
					; 0x8468: PRINT	MSG 0x04B6: "{6A}Les joyaux rouges et{66}pourpres furent enlevés à Ryle!{71}"
					; 0x1BF1: LOAD SPECIAL CHARACTER Duke (0x09)
					; 0xE469: PRINT	MSG 0x04B7, MSGBOX CLEARED, END: "{6A}M.  Ryle,	je vous{66}souhaite bien du plaisir{66}auprès de la vieille chèvre!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00A5:
		trap	#1
		bset	d6,-(sp)
		bsr.w	GetYesNoAnswer
		bcs.s	XS_00A5_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $60E,$0	; Run text script at offset 0x028536
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0xA487: PRINT	MSG 0x04D5, END: "{6A}Mais...il	vit à peine!{66}S'il te plaît!{67}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	XS_00A5_0
		bsr.s	XS_00A5_2
		beq.s	XS_00A5_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $610,$0	; Run text script at offset 0x02853A
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0xE488: PRINT	MSG 0x04D6, MSGBOX CLEARED, END: "{6A}Je te déteste!!{6D}"
; ---------------------------------------------------------------------------
		bra.s	XS_00A5_1
; ---------------------------------------------------------------------------

XS_00A5_0:				; CODE XREF: ROM:0002773Ej
					; ROM:00027748j
		bsr.s	XS_00A5_2
		beq.s	XS_00A5_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $606,$0	; Run text script at offset 0x028526
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0xE483: PRINT	MSG 0x04D1, MSGBOX CLEARED, END: "{6A}Merci!{66}Ca va aller, petit chien...{6D}"
; ---------------------------------------------------------------------------

XS_00A5_1:				; CODE XREF: ROM:0002774Cj
					; ROM:00027752j ...
		rts

; =============== S U B	R O U T	I N E =======================================


XS_00A5_2:				; CODE XREF: ROM:0002774Ap
					; ROM:XS_00A5_0p
		move.w	(word_FF1198).l,d0
		bsr.w	CheckIfItemIsOwned
		bne.s	XS_00A5_3
		trap	#1
		bset	d6,(a3)
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
XS_00AC_Options:ScriptID    $62B,$0	; DATA XREF: ROM:0002777Ao
					; Run text script at offset 0x028570
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE494: PRINT	MSG 0x04E2, MSGBOX CLEARED, END: "{6A}Oh!!  Vous m'avez fait{66}une de ces peurs!{6D}"
		ScriptID    $62D,$1	; Run text script at offset 0x028574
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE495: PRINT	MSG 0x04E3, MSGBOX CLEARED, END: "{6A}La vue d'ici est{66}superbe, n'est-ce pas?{66}A bientôt!{6D}"
		ScriptID    $62F,$2	; Run text script at offset 0x028578
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE496: PRINT	MSG 0x04E4, MSGBOX CLEARED, END: "{6A}On joue au chat?{66}Et le	chat, c'est vous!{6D}"
		ScriptID    $631,$3	; Run text script at offset 0x02857C
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE497: PRINT	MSG 0x04E5, MSGBOX CLEARED, END: "{6A}Vous avez	beaucoup{66}de chance...  C'est ça!{6D}"
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
XS_00AD_Options:ScriptID    $633,$0	; DATA XREF: ROM:000277A2o
					; Run text script at offset 0x028580
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE498: PRINT	MSG 0x04E6, MSGBOX CLEARED, END: "{6A}Oooh!  J'ai le vertige!!!{6D}"
		ScriptID    $635,$1	; Run text script at offset 0x028584
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE499: PRINT	MSG 0x04E7, MSGBOX CLEARED, END: "{6A}Ecoutez attentivement!{66}Essapmi	enu tse	icec!{6D}"
		ScriptID    $637,$2	; Run text script at offset 0x028588
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE49A: PRINT	MSG 0x04E8, MSGBOX CLEARED, END: "{6A}Juste un peu plus	loin,{66}vous trouverez...{68}une{66}voie sans issue!  Hahahaha!{6D}"
		ScriptID    $639,$3	; Run text script at offset 0x02858C
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE49B: PRINT	MSG 0x04E9, MSGBOX CLEARED, END: "{6A}Vous n'avez pas besoin{66}de moi?  {68}...  Au revoir!{6D}"
; ---------------------------------------------------------------------------

XS_00B2:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $643,$0	; Run text script at offset 0x0285A0
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xA4A0: PRINT	MSG 0x04EE, END: "{6A}Je ne vous vois pas,{66}mais je suis content de faire{66}votre connaissance.{71}{6A}Je prends mon	déjeuner.{66}Je	ne le vois pas,	mais ça	a{66}l'air bon.  Vous en voulez?{71}{6A}Vous êtes pressé?{71}"
; ---------------------------------------------------------------------------
		move.w	#ITM_RESTORATION,d0
		bsr.w	GetRemainingItemAllowedCount
		beq.s	XS_00B2_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $645,$0	; Run text script at offset 0x0285A4
					; 0x84A1: PRINT	MSG 0x04EF: "{6A}Je vous donne ceci.{66}Je ne le vois pas, mais{66}il est beau à regarder.{71}"
					; 0x002E: LOAD 0x002E INTO 0xFF1196 (Restau{78}ration)
					; 0x17E8: RECEIVE ITEM [0xFF1196]
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE4A2: PRINT	MSG 0x04F0, MSGBOX CLEARED, END: "{6A}Ca m'a fait plaisir de{66}bavarder avec vous.  Je{66}ne vous vois pas, mais{71}{6A}vous êtes mon ami.{6D}"
; ---------------------------------------------------------------------------
		bra.s	XS_00B2_1
; ---------------------------------------------------------------------------

XS_00B2_0:				; CODE XREF: ROM:000277D2j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $64A,$0	; Run text script at offset 0x0285AE
					; 0xE4A3: PRINT	MSG 0x04F1, MSGBOX CLEARED, END: "{6A}Bonne chance!  Je	ne{66}vous vois	pas, mais{66}bonne chance!{6D}"
; ---------------------------------------------------------------------------

XS_00B2_1:				; CODE XREF: ROM:000277D8j
		rts
; ---------------------------------------------------------------------------

XS_00B3:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $64B,$0	; Run text script at offset 0x0285B0
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0x84A4: PRINT	MSG 0x04F2: "{6A}Ryle, regarde là-bas!{66}Il y a quelque chose qui{66}brille.  Le {6E}!{71}"
					; 0x1BE8: LOAD SPECIAL CHARACTER Ryle (0x00)
					; 0xE4A5: PRINT	MSG 0x04F3, MSGBOX CLEARED, END: "{6A}Mais on ne peut pas{66}traverser ces arbres...{6D}"
; ---------------------------------------------------------------------------
		moveq	#ITM_EINSTEINWHISTLE,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	XS_00B3_0
		bsr.w	ClearTextbox
		st	d0
		bra.s	XS_00B3_1
; ---------------------------------------------------------------------------

XS_00B3_0:				; CODE XREF: ROM:000277EAj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $65A,$0	; Run text script at offset 0x0285CE
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0xE4AB: PRINT	MSG 0x04F9, MSGBOX CLEARED, END: "{6A}On ferait	peut-être{66}mieux de recommencer{66}dès le début...{6D}"
; ---------------------------------------------------------------------------
		clr.b	d0

XS_00B3_1:				; CODE XREF: ROM:000277F2j
		move.b	d0,(g_YesNoPromptResult).l
		rts
; ---------------------------------------------------------------------------

XS_00C1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $690,$0	; Prompt:	Run text script	at offset 0x02863A
					; 0x18F7: LOAD CHARACTER SCRIPT	* (0x00F7)
					; 0xA4C6: PRINT	MSG 0x0514, END: "{6A}Le navire	partira	pour{66}Verla!	Pour vous, le voyage{66}sera gratuit...	 C'est pour{71}{6A}vous remercier pour{66}le phare.  Vous montez à{66}bord tout de suite?{67}"
		ScriptID    $692,$1	; Answer 'yes': Run text script at offset 0x02863E
					; 0x14D9: SET BIT 1 OF FLAG 0x01B
					; 0xE4C7: PRINT	MSG 0x0515, MSGBOX CLEARED, END: "{6A}Montez à bord!{66}On va bientôt prendre la mer!{6D}"
		ScriptID    $695,$2	; Answer 'no':  Run text script at offset 0x028644
					; 0xE4C9: PRINT	MSG 0x0517, MSGBOX CLEARED, END: "{6A}D'accord, je vous{66}attendrai un peu...{6D}"
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
		ScriptID    $6EF,$0	; Run text script at offset 0x0286F8
					; 0x1BF1: LOAD SPECIAL CHARACTER Duke (0x09)
					; 0xE4F8: PRINT	MSG 0x0546, MSGBOX CLEARED, END: "{6A}Encore vous!{71}{6A}On a assez joué au chat{66}et	à la souris, non?{66}Venez par ici!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00E9:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $6F9,$0	; Run text script at offset 0x02870C
					; 0x1836: LOAD CHARACTER SCRIPT	Lara (0x0036)
					; 0xA4FD: PRINT	MSG 0x054B, END: "{6A}Eeeeeeeeeee!{66}Pas ça!!!!!!!!{71}{6A}C'est entendu...{66}Je ferai ce que vous voulez.{71}"
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
		ScriptID    $6FB,$0	; Run text script at offset 0x028710
					; 0x1836: LOAD CHARACTER SCRIPT	Lara (0x0036)
					; 0xE4FE: PRINT	MSG 0x054C, MSGBOX CLEARED, END: "{6A}Oh, gardien{68} de la nuit,{66}{68} Lorsque les cinq pierres{66}se rassembleront{68}ici...{71}{6A}vous me	montrerez le...{66}passage secret!!{66}{68}In-nah{68} Gad'da{68}da{68} V'idda!"
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
		ScriptID    $6FF,$0	; Run text script at offset 0x028718
					; 0x1836: LOAD CHARACTER SCRIPT	Lara (0x0036)
					; 0xE500: PRINT	MSG 0x054E, MSGBOX CLEARED, END: "{6A}Oh, mon prince!{66}Je savais que tu{66}viendrais me sauver!{71}{6A}Tu es mon prince!{66}C'est comme un conte de{66}fées qui se réalise!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00F0:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $70B,$0	; Run text script at offset 0x028730
					; 0x1836: LOAD CHARACTER SCRIPT	Lara (0x0036)
					; 0x8506: PRINT	MSG 0x0554: "{6A}Restez	en dehors de ça,{66}Moralis!  Je vais m'occuper{66}toute seule de cette insolente!{71}"
					; 0x1822: LOAD CHARACTER SCRIPT	Moralis	(0x0022)
					; 0xA507: PRINT	MSG 0x0555, END: "{6A}Princesse!!{66}M.	 Ryle et Mademoiselle{66}Friday	vous ont délivrée!{71}"
; ---------------------------------------------------------------------------
		trap	#0
; ---------------------------------------------------------------------------
		dc.w SND_MusicFinalCutscene
; ---------------------------------------------------------------------------
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $70F,$0	; Run text script at offset 0x028738
					; 0x1836: LOAD CHARACTER SCRIPT	Lara (0x0036)
					; 0x8508: PRINT	MSG 0x0556: "{6A}...{68}C'est vrai{68}...  Je{66}vous demande pardon.{71}{6A}..  snif..J'avais si peur.{66}Tous les jours, je laissais{66}tomber un objet du haut de{71}{6A}la tour, mais personne{66}ne le remarquait!{66}...  C'était épouvantable!{71}"
					; 0x1822: LOAD CHARACTER SCRIPT	Moralis	(0x0022)
					; 0x8509: PRINT	MSG 0x0557: "{6A}Voilà,	c'est fini...{66}Rentrons chez nous,{66}princesse Lara.{71}"
					; 0x1836: LOAD CHARACTER SCRIPT	Lara (0x0036)
					; 0xE50A: PRINT	MSG 0x0558, MSGBOX CLEARED, END: "{6A}...  snif...!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00F2:
		bsr.w	RestoreBGM_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $717,$0	; Run text script at offset 0x028748
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0xE50C: PRINT	MSG 0x055A, MSGBOX CLEARED, END: "{6A}Pauvre petite...{66}Ca a dû lui ramollir le{66}cerveau, d'être enfermée{71}{6A}si longtemps...{66}Elle te traite de prince!{66}La pauvre...{71}{6A}Assez rigolé!  Il va{66}falloir repartir à la{66}poursuite du duc!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_00FE:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $732,$0	; Run text script at offset 0x02877E
					; 0x1805: LOAD CHARACTER SCRIPT	Marchand (0x0005)
					; 0xA519: PRINT	MSG 0x0567, END: "{6A}Ryle reçut 2000 Ors!"
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
		ScriptID    $77A,$0	; Run text script at offset 0x02880E
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xA53F: PRINT	MSG 0x058D, END: "{6A}Mettez-vous à l'aise!{66}Jouons à la roulette!{71}{6A}Le jeu démarre quand{66}vous vous placez sur le grand{66}ballon.  Si la balle s'arrête{71}{6A}sur une dalle rouge, vous{66}gagnez 200 Ors.  Jouez une fois{66}coûte 50 Ors.  Vous jouez?{67}"
; ---------------------------------------------------------------------------
		moveq	#50,d0

loc_27868:				; CODE XREF: ROM:000278A4j
					; ROM:000278ACj
		bsr.w	GetYesNoAnswer
		bcc.s	XS_0122_2
		jsr	j_RemoveGold
		bcs.s	XS_0122_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $77C,$0	; Run text script at offset 0x028812
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE540: PRINT	MSG 0x058E, MSGBOX CLEARED, END: "{6A}Bonne chance!{6D}"
; ---------------------------------------------------------------------------
		bra.s	XS_0122_1
; ---------------------------------------------------------------------------

XS_0122_0:				; CODE XREF: ROM:00027874j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $77E,$0	; Run text script at offset 0x028816
					; 0xE541: PRINT	MSG 0x058F, MSGBOX CLEARED, END: "{6A}Je regrette...Je ne peux{66}pas baisser le tarif!{6D}"
; ---------------------------------------------------------------------------
		clr.b	(g_YesNoPromptResult).l

XS_0122_1:				; CODE XREF: ROM:0002787Aj
		bra.s	XS_0122_3
; ---------------------------------------------------------------------------

XS_0122_2:				; CODE XREF: ROM:0002786Cj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $77F,$0	; Run text script at offset 0x028818
					; 0xE542: PRINT	MSG 0x0590, MSGBOX CLEARED, END: "{6A}Aaah, dommage!{6D}"
; ---------------------------------------------------------------------------

XS_0122_3:				; CODE XREF: ROM:XS_0122_1j
		rts
; ---------------------------------------------------------------------------

XS_0123:
		move.l	#200,(g_PrintNumericDwordValue).l

XS_0127:				; CODE XREF: ROM:000278B8j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $780,$0	; Run text script at offset 0x02881A
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0x8543: PRINT	MSG 0x0591: "{6A}Félicitations!{66}Tenez!{71}"
					; 0x17E9: RECEIVE [NUMERIC_VAR]	GOLDS
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE544: PRINT	MSG 0x0592, MSGBOX CLEARED, END: "{6A}A	bientôt!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

XS_0125:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $787,$0	; Run text script at offset 0x028828
					; 0x193A: LOAD CHARACTER SCRIPT	* (0x013A)
					; 0xA546: PRINT	MSG 0x0594, END: "{6A}Jouons à 'Lancer-le-{66}poulet'!  Essayez d'attraper{66}un maximum de poulets,{71}{6A}puis lancez-les dans{66}l'enclos avant la fin du{66}temps réglementaire!{71}{6A}Le record de cette salle
					;                                 {66}est {69}.{71}{6A}Vous toucherez 5 Ors{66}par poulet!{71}{6A}Le jeu démarre quand{66}vous vous placez sur le{66}carré rouge.{71}{6A}Un tour coûte 20 Ors.{66}Vous voulez essayer?{67}"
; ---------------------------------------------------------------------------
		moveq	#$14,d0
		bra.s	loc_27868
; ---------------------------------------------------------------------------

XS_0128:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $78B,$0	; Run text script at offset 0x028830
					; 0x193B: LOAD CHARACTER SCRIPT	* (0x013B)
					; 0xA548: PRINT	MSG 0x0596, END: "{6A}Voici la course de{66}poulets!{71}{6A}Montez sur un des quatre{66}poulets...  Si le vôtre{66}l'emporte, vous recevrez{71}{6A}200 Ors.{71}{6A}Participer à une course{66}coûte 50 Ors.  Vous voulez{66}tenter votre chance?{67}"
; ---------------------------------------------------------------------------
		moveq	#50,d0
		bra.s	loc_27868
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
		ScriptID    $78E,$0	; Run text script at offset 0x028836
					; 0x193C: LOAD CHARACTER SCRIPT	* (0x013C)
					; 0x0416: LOAD 0x0016 INTO 0xFF1198 (Ticket{79}Casino)
					; 0xA54A: PRINT	MSG 0x0598, END: "{6A}Oh, mais vous avez un{66}ticket de casino!{66}Vous voulez	entrer?{67}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	XS_012A_0
		bsr.w	CheckAndConsumeItem
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $791,$0	; Run text script at offset 0x02883C
					; 0x193C: LOAD CHARACTER SCRIPT	* (0x013C)
					; 0xE54B: PRINT	MSG 0x0599, MSGBOX CLEARED, END: "{6A}Bienvenue	au Casino{66}d'Arthur!{66}Amusez-vous bien!{6D}"
; ---------------------------------------------------------------------------
		bra.s	XS_012A_1
; ---------------------------------------------------------------------------

XS_012A_0:				; CODE XREF: ROM:000278CAj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $793,$0	; Run text script at offset 0x028840
					; 0x193C: LOAD CHARACTER SCRIPT	* (0x013C)
					; 0xE54C: PRINT	MSG 0x059A, MSGBOX CLEARED, END: "{6A}A	très bientôt!{6D}"
; ---------------------------------------------------------------------------

XS_012A_1:				; CODE XREF: ROM:000278D4j
		bra.s	XS_012A_3
; ---------------------------------------------------------------------------

XS_012A_2:				; CODE XREF: ROM:000278C0j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $795,$0	; Run text script at offset 0x028844
					; 0x193C: LOAD CHARACTER SCRIPT	* (0x013C)
					; 0x0416: LOAD 0x0016 INTO 0xFF1198 (Ticket{79}Casino)
					; 0xE54D: PRINT	MSG 0x059B, MSGBOX CLEARED, END: "{6A}Je regrette!{66}Vous ne pouvez pas entrer{66}sans	{6E}!{6D}"
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
		ScriptID    $79D,$0	; Run text script at offset 0x028854
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE550: PRINT	MSG 0x059E, MSGBOX CLEARED, END: "{6A}Si seulement on{66}pouvait faire pousser plus{66}d'arbres sous terre!{6D}"
; ---------------------------------------------------------------------------
		bra.s	XS_012B_1
; ---------------------------------------------------------------------------

XS_012B_0:				; CODE XREF: ROM:00027900j
		st	(g_YesNoPromptResult).l
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $79A,$0	; Run text script at offset 0x02884E
					; 0x14E1: SET BIT 1 OF FLAG 0x01C
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE54F: PRINT	MSG 0x059D, MSGBOX CLEARED, END: "{6A}Vous connaissez mon père,{66}je crois.  Dans ce cas, montez{66}couper l'arbre.  Vous en ferez{71}{6A}un radeau!{6D}"
; ---------------------------------------------------------------------------

XS_012B_1:				; CODE XREF: ROM:00027906j
		bra.s	XS_012B_3
; ---------------------------------------------------------------------------

XS_012B_2:				; CODE XREF: ROM:000278F6j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $798,$0	; Run text script at offset 0x02884A
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE54E: PRINT	MSG 0x059C, MSGBOX CLEARED, END: "{6A}Il y a un	seul arbre{66}debout au-dessus.	 Les arbres{66}sont rares par ici, alors{71}{6A}je monte la garde!{6D}"
; ---------------------------------------------------------------------------

XS_012B_3:				; CODE XREF: ROM:XS_012B_1j
		rts
; ---------------------------------------------------------------------------
