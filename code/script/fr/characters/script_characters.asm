; ---------------------------------------------------------------------------

CS_0143:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $AB,$0	; Prompt:	Run text script	at offset 0x027A70
					; 0x1834: LOAD CHARACTER SCRIPT	Mir (0x0034)
					; 0xA09A: PRINT	MSG 0x00E8, END: "{6A}Faites demi-tour et{66}vous aurez	quelquechose dont{66}vous rêvez	depuis	toujours.{71}{6A}C'est d'accord?{67}"
		ScriptID    $AD,$1	; Answer 'yes': Run text script at offset 0x027A74
					; 0x75C7: SET BIT 7 OF FLAG 0x038, MSGBOX CLEARED, END
		ScriptJump  ClearTextbox,$2 ; Answer 'no':  Jump to address 0x028B8E
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0000:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $B7,$1	; Run text script at offset 0x027A88
					; 0xE0A4: PRINT	MSG 0x00F2, MSGBOX CLEARED, END: "{6A}Les trésors du roi Nole?{66}...Ah, oui!  Je...euh...{68}{66}...n'en ai aucune idée...{6D}"
					;
		dc.w 1			; Params 00, 01
		ScriptID    $B8,$3	; Run text script at offset 0x027A8A
					; 0xE0A5: PRINT	MSG 0x00F3, MSGBOX CLEARED, END: "{6A}Le pont a	été détruit!{66}Les jeunes projettent{66}d'attaquer Gumi.{6D}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $B9,$5	; Run text script at offset 0x027A8C
					; 0xE0A6: PRINT	MSG 0x00F4, MSGBOX CLEARED, END: "{6A}...je vous en prie!...{66}...Sauvez ma Fara!...{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $BA,$7	; Run text script at offset 0x027A8E
					; 0x1422: SET BIT 2 OF FLAG 0x004
					; 0x80A7: PRINT	MSG 0x00F5: "{6A}Ryle!{66}Tous mes remerciements...{66}Pour tout ce que	vous avez fait.{6D}{6A}Un proverbe dit,{66}'Rien ne vaut les étincelles{66}pour exprimer la reconnaissance.'
					;                            {71}{6A}Les habitants de Massan{66}vous sont reconnaissants, Ryle.{66}Acceptez ce modeste joyau!{71}"
					; 0x0028: LOAD 0x0028 INTO 0xFF1196 (Joyau{79}Rouge)
					; 0x17E8: RECEIVE ITEM [0xFF1196]
					; 0x1800: LOAD CHARACTER SCRIPT	Maire (0x0000)
					; 0xE0A8: PRINT	MSG 0x00F6, MSGBOX CLEARED, END: "{6A}Ne nous oubliez pas.{6D}"
					;
		dc.w 5			; Params 00, 05
		ScriptID    $BF,$9	; Run text script at offset 0x027A98
					; 0xE0A8: PRINT	MSG 0x00F6, MSGBOX CLEARED, END: "{6A}Ne nous oubliez pas.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0001:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $C0,$1	; Run text script at offset 0x027A9A
					; 0xE0A9: PRINT	MSG 0x00F7, MSGBOX CLEARED, END: "{6A}Vous allez bien?{66}Faites attention!{6D}"
					;
		dc.w 1			; Params 00, 01
		ScriptID    $C1,$3	; Run text script at offset 0x027A9C
					; 0xE0AA: PRINT	MSG 0x00F8, MSGBOX CLEARED, END: "{6A}On dit que Gumi{66}est hanté par un esprit{66}maléfique!{6D}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $C2,$5	; Run text script at offset 0x027A9E
					; 0xE0AB: PRINT	MSG 0x00F9, MSGBOX CLEARED, END: "{6A}Je vais bien.{66}Il faut d'abord s'occuper{6D}de ces monstres!!{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $C3,$7	; Run text script at offset 0x027AA0
					; 0xE0AC: PRINT	MSG 0x00FA, MSGBOX CLEARED, END: "{6A}Oh, Ryle...(soupir)...{66}Vous n'avez pas eu peur face{66}à ces horrible rois Orcs!{6D}{6A}Si seulement j'avais{66}comme dot le joyau rouge de{66}mon père!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $C4,$1	; Run text script at offset 0x027AA2
					; 0xE0AD: PRINT	MSG 0x00FB, MSGBOX CLEARED, END: "{6A}Il faut apprendre	le{66}respect à	ces sauvages de	Gumi{66}Si j'étais un peu plus jeune!!{6D}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $C5,$3	; Run text script at offset 0x027AA4
					; 0xE0AE: PRINT	MSG 0x00FC, MSGBOX CLEARED, END: "{6A}Ca suffit, j'en ai assez!{66}Je vais y aller!!{6D}"
					;
		dc.w 3			; Params 00, 03
		ScriptID    $C6,$5	; Run text script at offset 0x027AA6
					; 0xE0AF: PRINT	MSG 0x00FD, MSGBOX CLEARED, END: "{6A}Ils ont emmené Fara{66}à l'intérieur du lieu saint!{71}{6A}Nous avons essayé{66}d'y entrer, mais pas moyen...{66}d'ouvrir la porte!{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $C7,$7	; Run text script at offset 0x027AA8
					; 0xE0B0: PRINT	MSG 0x00FE, MSGBOX CLEARED, END: "{6A}Je vois à	présent	que{66}j'avais tort..Les habitants de{66}Gumi sont nos frères et soeurs{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $C8,$1	; Run text script at offset 0x027AAA
					; 0xE0B1: PRINT	MSG 0x00FF, MSGBOX CLEARED, END: "{6A}Attention	à ce que vous{66}dites..Mon mari est en	colère!{6D}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $C9,$3	; Run text script at offset 0x027AAC
					; 0xE0B2: PRINT	MSG 0x0100, MSGBOX CLEARED, END: "{6A}Mon mari et mon fils sont{66}partis.Leur colère est grande!{71}{6A}Je suis si inquiète!{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $CA,$5	; Run text script at offset 0x027AAE
					; 0xE0B3: PRINT	MSG 0x0101, MSGBOX CLEARED, END: "{6A}Merci, Ryle.{66}Massan et	Gumi ont pu{66}s'entendre, grâce à vous.{71}{6A}Notre village retrouvera{66}la douceur de la paix!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0002:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptJump  CS_0002_0,$1 ; Jump	to address 0x02612A
					;
		dc.w 2			; Params 00, 02
		ScriptID    $CE,$3	; Run text script at offset 0x027AB6
					; 0xE0B7: PRINT	MSG 0x0105, MSGBOX CLEARED, END: "{6A}Je suis peut-être	jeune,{66}mais j'ai quand même envie{66}de me battre contre eux!{6D}"
					;
		dc.w 3			; Params 00, 03
		ScriptID    $CF,$5	; Run text script at offset 0x027AB8
					; 0xE0B8: PRINT	MSG 0x0106, MSGBOX CLEARED, END: "{6A}...  snif.....snif...{66}..J'ai peur!..Papa les a suivi{66}dans le lieu saint...{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $D0,$7	; Run text script at offset 0x027ABA
					; 0xE0B9: PRINT	MSG 0x0107, MSGBOX CLEARED, END: "{6A}Maman a l'air{66}si heureuse!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0002_0:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $CB,$0	; Prompt:	Run text script	at offset 0x027AB0
					; 0xA0B4: PRINT	MSG 0x0102, END: "{6A}Avez-vous	rencontré{66}quelqu'un qui ne nous{66}ressemble pas?{67}"
		ScriptID    $CC,$1	; Answer 'yes': Run text script at offset 0x027AB2
					; 0xE0B5: PRINT	MSG 0x0103, MSGBOX CLEARED, END: "{6A}Ah oui?{6D}"
		ScriptID    $CD,$2	; Answer 'no':  Run text script at offset 0x027AB4
					; 0xE0B6: PRINT	MSG 0x0104, MSGBOX CLEARED, END: "{6A}Vous êtes	prévenus!{71}{6A}Ils sont de la	tribu de Gumi,{66}et ils n'aiment pas ceux qui{66}viennent de Massan.{71}{6A}N'allez pas au sud...{66}vous seriez mal reçu!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_007D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $D1,$1	; Run text script at offset 0x027ABC
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0xE0BA: PRINT	MSG 0x0108, MSGBOX CLEARED, END: "{6A}Semez les	graines	et{66}regardez-les POUSSER!{71}{6A}Bientôt, vous récolterez ce{66}que vous avez	SEME!{71}{6A}Transportez la récolte{66}en ville	un beau	JOUR!  Vous{66}serez riche et vous DIREZ!...{71}{6A}C'est la CHANSON{66}DU PAYSAN.{71}{6A}Mes ventes seront{66}énormes quand je la chanterai{66}au marché de Mercator.{6D}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $D3,$3	; Run text script at offset 0x027AC0
					; 0xE0BB: PRINT	MSG 0x0109, MSGBOX CLEARED, END: "{6A}Nous mettons au point{66}notre plan de campagne!{66}Ne nous dérangez pas!{6D}"
					;
		dc.w 3			; Params 00, 03
		ScriptID    $D4,$5	; Run text script at offset 0x027AC2
					; 0xE0BC: PRINT	MSG 0x010A, MSGBOX CLEARED, END: "{6A}Ils se sont servi	d'une{66}chose bien bizarre pour{66}ouvrir cette porte...{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $D5,$7	; Run text script at offset 0x027AC4
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0xE0BD: PRINT	MSG 0x010B, MSGBOX CLEARED, END: "{6A}Ecoutez, Ryle!  J'ai{66}écrit une nouvelle chanson:{66}LES TROIS GARS DE MASSAN.{71}{6A}'Trois gars avancent,{66}et ils n'ont pas peur.{66}Trois gars...' C'est bien, non?{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $D7,$9	; Run text script at offset 0x027AC8
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0x80BE: PRINT	MSG 0x010C: "{6A}Ba-pa-da-da{66}POUSSER!  Bientôt vous{66}récolterez ce	que bi-bop-a-di{71}{6A}Ah, c'est vous, Ryle!{71}"
					; 0x0400: LOAD 0x0000 INTO 0xFF1198 (EkeEke)
					; 0xE0BF: PRINT	MSG 0x010D, MSGBOX CLEARED, END: "{6A}Je voudrais vous{66}remercier...	Vous m'avez{66}bien aidé l'autre jour.{71}{6A}Pourquoi ne pas{66}acheter le {6E}{66}à la ferme directement?{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $DB,$1	; Run text script at offset 0x027AD0
					; 0xE0C0: PRINT	MSG 0x010E, MSGBOX CLEARED, END: "{6A}J'ai entendu dire{66}que les guerriers Gumi{66}se retrouvent souvent{71}{6A}du côté du pont.{66}Enfin, c'est ce qu'on dit...{6D}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $DC,$3	; Run text script at offset 0x027AD2
					; 0xE0C1: PRINT	MSG 0x010F, MSGBOX CLEARED, END: "{6A}Il s'est précipité{66}dehors, avec le voisin d'à côté{66}Il était vraiment furieux!{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $DD,$5	; Run text script at offset 0x027AD4
					; 0xE0C2: PRINT	MSG 0x0110, MSGBOX CLEARED, END: "{6A}Ryle et Friday!{66}Vous allez bien?{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_007F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $DE,$1	; Run text script at offset 0x027AD6
					; 0xE0C3: PRINT	MSG 0x0111, MSGBOX CLEARED, END: "{6A}Je vis ici depuis{66}ma petite enfance.{71}{6A}A une époque, Massan{66}et	Gumi s'entendaient bien.{71}{6A}L'origine de leur amitié?{66}Personne ne...{68}j'ai une idée!{71}{6A}Allez voir{66}le Vieillard au Lieu Saint{71}{6A}des Chutes.  Peut-être{66}qu'il sait, lui!{6D}"
					;
		dc.w 1			; Params 00, 01
		ScriptID    $DF,$3	; Run text script at offset 0x027AD8
					; 0xE0C4: PRINT	MSG 0x0112, MSGBOX CLEARED, END: "{6A}C'est surement un sort{66}maléfique!  Le mal est partout!{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $E0,$5	; Run text script at offset 0x027ADA
					; 0xE0C5: PRINT	MSG 0x0113, MSGBOX CLEARED, END: "{6A}Enfin, Massan et{66}Gumi retrouveront leur bonheur{66}d'antan, comme villages frères!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0080:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $E1,$1	; Run text script at offset 0x027ADC
					; 0xE0C6: PRINT	MSG 0x0114, MSGBOX CLEARED, END: "{6A}Il vous faudra{66}rendre visite au Sage du Lieu{66}Saint des Chutes.  Attention, ..{71}{6A}c'est un original!{6D}"
					;
		dc.w 1			; Params 00, 01
		ScriptID    $E2,$3	; Run text script at offset 0x027ADE
					; 0xE0C7: PRINT	MSG 0x0115, MSGBOX CLEARED, END: "{6A}Gulps!...{68}{66}ca fait peur...{6D}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $E3,$5	; Run text script at offset 0x027AE0
					; 0xE0C8: PRINT	MSG 0x0116, MSGBOX CLEARED, END: "{6A}Snif!...	snif...{66}Elle	va revenir, Fara?{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $E4,$7	; Run text script at offset 0x027AE2
					; 0xE0C9: PRINT	MSG 0x0117, MSGBOX CLEARED, END: "{6A}Vous avez	réussi!{66}En vérité, il ne faut jamais{66}juger un dahl par sa	couleur!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0003:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptJump  CS_0003_0,$1 ; Jump	to address 0x0261A8
					;
		dc.w 3			; Params 00, 03
		ScriptJump  CS_0003_1,$3 ; Jump	to address 0x0261B4
					;
		dc.w 4			; Params 00, 04
		ScriptID    $EA,$5	; Run text script at offset 0x027AEE
					; 0xE0CF: PRINT	MSG 0x011D, MSGBOX CLEARED, END: "{6A}Il va falloir qu'on{66}dégage ces débris, si on veut{66}arriver à Mercator.{6D}"
					;
		dc.w 7			; Params 00, 07
		ScriptJump  CS_0003_2,$7 ; Jump	to address 0x0261C0
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $ED,$9	; Run text script at offset 0x027AF4
					; 0xE0D2: PRINT	MSG 0x0120, MSGBOX CLEARED, END: "{6A}Comme on se retrouve!{66}Tout va bien?{66}Moi?  Oh, comme	ci, comme ça.{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $EE,$B	; Run text script at offset 0x027AF6
					; 0xE0D3: PRINT	MSG 0x0121, MSGBOX CLEARED, END: "{6A}Hé, jeune	homme!{66}C'est moi!{71}{6A}Pauvre de moi!{66}J'ai été pris dans un drôle{66}de piège...  Et me voilà!{71}{6A}Eh, bien...  J'ai connu{66}pas mal de prisons, mais{66}jamais je n'ai aterri dans un{71}{6A}trou aussi infect!{71}{6A}C'est insupportable!!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0003_0:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $E5,$0	; Prompt:	Run text script	at offset 0x027AE4
					; 0xA0CA: PRINT	MSG 0x0118, END: "{6A}Vous êtes	chercheur de{66}trésors?  Inutile de le	nier{66}je l'ai flairé tout de suite!{71}{6A}Vous avez parlé au sage{66}du Lieu Saint des Chutes?{67}"
		ScriptID    $E6,$1	; Answer 'yes': Run text script at offset 0x027AE6
					; 0xE0CB: PRINT	MSG 0x0119, MSGBOX CLEARED, END: "{6A}Ah, oui?	Comme ça{66}vous êtes voleur ET	menteur!{6D}"
		ScriptID    $E7,$2	; Answer 'no':  Run text script at offset 0x027AE8
					; 0xE0CC: PRINT	MSG 0x011A, MSGBOX CLEARED, END: "{6A}Ha, ha, ha!  Vous{66}manquez d'expérience, petit!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0003_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C1		; Bit 1	of flag	0x018
		ScriptID    $E8,$1	; Flag clear: Run text script at offset	0x027AEA
					; 0xE0CD: PRINT	MSG 0x011B, MSGBOX CLEARED, END: "{6A}Eh bien!	Ca me{66}fait plaisir de vous revoir!{71}{6A}L'éboulement?  Ah oui.{66}Eh bien, on dirait qu'on a{66}épuisé nos réserves de chance!{71}{6A}Le village était{66}abandonné, alors j'ai cherché{71}{6A}des objets de valeur,{66}mais il n'y avait rien.{71}
					;                                                 {6A}Je n'ai trouvé qu'une{66}statue étrange{66}chez le maire.{71}{6A}Puis, il y avait quelques{66}Ors qui trainaient, mais{66}je n'ai rien pris{71}{6A}Non, mais...{6D}"
		ScriptID    $E9,$2	; Flag set:   Run text script at offset	0x027AEC
					; 0xE0CE: PRINT	MSG 0x011C, MSGBOX CLEARED, END: "{6A}Vous ne pouvez pas{66}m'en vouloir, hein?{71}{6A}Je sais qu'on se comprend{66}Vous aussi, vous êtes voleur!{66}Ha, ha, ha!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0003_2:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DA		; Bit 2	of flag	0x01B
		ScriptID    $EB,$1	; Flag clear: Run text script at offset	0x027AF0
					; 0x80D0: PRINT	MSG 0x011E: "{6A}Encore	vous!{66}Moi?  Je suis venu chercher{66}les trésors, mais{71}{6A}j'avais sommeil...{71}"
					; 0xE0D1: PRINT	MSG 0x011F, MSGBOX CLEARED, END: "{6A}On dit que les arbres{66}sont les	meilleurs amis du{66}chasseur de trésor...{71}{6A}Je me	demande{66}ce que ça veut dire...{6D}"
		ScriptID    $EC,$2	; Flag set:   Run text script at offset	0x027AF2
					; 0xE0D1: PRINT	MSG 0x011F, MSGBOX CLEARED, END: "{6A}On dit que les arbres{66}sont les	meilleurs amis du{66}chasseur de trésor...{71}{6A}Je me	demande{66}ce que ça veut dire...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0081:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $EF,$1	; Run text script at offset 0x027AF8
					; 0xE0D4: PRINT	MSG 0x0122, MSGBOX CLEARED, END: "{6A}On a pas mal de{66}clients louches ces jours-ci...{66}Euh...  Vous aussi,	vous êtes{71}{6A}un client, c'est vrai...{6D}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $F0,$3	; Run text script at offset 0x027AFA
					; 0xE0D5: PRINT	MSG 0x0123, MSGBOX CLEARED, END: "{6A}Cet homme	étrange{66}s'est envolé comme le vent...{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $F1,$5	; Run text script at offset 0x027AFC
					; 0xE0D6: PRINT	MSG 0x0124, MSGBOX CLEARED, END: "{6A}C'est vous, le{66}jeune héros, n'est-ce pas?{66}Eh bien, tout ami de Fara...{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0082:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptJump  CS_0082_0,$1 ; Jump	to address 0x0261F4
					;
		dc.w 2			; Params 00, 02
		ScriptID    $F4,$3	; Run text script at offset 0x027B02
					; 0xE0D8: PRINT	MSG 0x0126, MSGBOX CLEARED, END: "{6A}Ryle!  Friday!{66}Fara a besoin de notre aide.{66}Mais j'ai si peur que je{71}{6A}n'arrive pas à bouger!{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $F5,$5	; Run text script at offset 0x027B04
					; 0xE0D9: PRINT	MSG 0x0127, MSGBOX CLEARED, END: "{6A}Friday!  Ca fait du{66}bien de vous revoir!{6D}"
					;
		dc.w 5			; Params 00, 05
		ScriptID    $F6,$7	; Run text script at offset 0x027B06
					; 0xE0DA: PRINT	MSG 0x0128, MSGBOX CLEARED, END: "{6A}J'espère qu'on se{66}reverra bientôt, Friday!{66}Oh, et vous aussi, Ryle...{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0082_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C0		; Bit 0	of flag	0x018
		ScriptID    $F2,$1	; Flag clear: Run text script at offset	0x027AFE
					; 0x7C10: LOAD CUSTOM ACTION 0x10 (0x10000003F CSA_0010), MSGBOX CLEARED, END
		ScriptID    $F3,$2	; Flag set:   Run text script at offset	0x027B00
					; 0xE0D7: PRINT	MSG 0x0125, MSGBOX CLEARED, END: "{6A}Mademoiselle Friday{66}va	bien?{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0083:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $F7,$1	; Run text script at offset 0x027B08
					; 0xE0DB: PRINT	MSG 0x0129, MSGBOX CLEARED, END: "{6A}A	l'ouest de Gumi,  la{66}route fait une fourche.{66}Il y a deux chemins.{71}{6A}Le chemin de droite{66}mène à la ville de Mercator.{71}{6A}Celui de gauche va à Ryuma,{66}qui est célèbre pour son phare{6D}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $F8,$3	; Run text script at offset 0x027B0A
					; 0xE0DC: PRINT	MSG 0x012A, MSGBOX CLEARED, END: "{6A}Fara sera	offerte{66}en sacrifice	à leurs	dieux{66}maléfiques!  Aidez-la!!{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $F7,$5	; Run text script at offset 0x027B08
					; 0xE0DB: PRINT	MSG 0x0129, MSGBOX CLEARED, END: "{6A}A	l'ouest de Gumi,  la{66}route fait une fourche.{66}Il y a deux chemins.{71}{6A}Le chemin de droite{66}mène à la ville de Mercator.{71}{6A}Celui de gauche va à Ryuma,{66}qui est célèbre pour son phare{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0084:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $F9,$1	; Run text script at offset 0x027B0C
					; 0xE0DD: PRINT	MSG 0x012B, MSGBOX CLEARED, END: "{6A}Gumi est le village{66}tout de suite au sud.{66}Il abrite	une tribu atroce!!{6D}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $FA,$3	; Run text script at offset 0x027B0E
					; 0xE0DE: PRINT	MSG 0x012C, MSGBOX CLEARED, END: "{6A}Je dois rester ici{66}pour défendre le village.  {66}C'est mon devoir.{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $FB,$5	; Run text script at offset 0x027B10
					; 0xE0DF: PRINT	MSG 0x012D, MSGBOX CLEARED, END: "{6A}N'oubliez pas ceci...{66}La voie la plus rapide{66}a de nombreux virages.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0085:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptJump  loc_26236,$1 ; Jump	to address 0x026236
					;
		dc.w 2			; Params 00, 02
		ScriptID    $FF,$3	; Run text script at offset 0x027B18
					; 0xE0E3: PRINT	MSG 0x0131, MSGBOX CLEARED, END: "{6A}Fara a été enlevée{66}parce qu'elle est la plus{66}jolie...  Oh, non!{71}{6A}Ca veut dire que{66}la victime suivante, c'est moi!{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $100,$5	; Run text script at offset 0x027B1A
					; 0xE0E4: PRINT	MSG 0x0132, MSGBOX CLEARED, END: "{6A}On m'a raconté vos ex-{66}ploits.  Mais rien n'aurait été{66}possible sans EkeEke!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_26236:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $FC,$0	; Prompt:	Run text script	at offset 0x027B12
					; 0xA0E0: PRINT	MSG 0x012E, END: "{6A}Bonjour.	Je peux{66}vous	donner un tuyau	sur{66}une particularité de cette île{71}{6A}Vous en avez{66}entendu parler?{67}"
		ScriptID    $FD,$1	; Answer 'yes': Run text script at offset 0x027B14
					; 0xE0E1: PRINT	MSG 0x012F, MSGBOX CLEARED, END: "{6A}Ah bon?{66}Je vois.{6D}"
		ScriptID    $FE,$2	; Answer 'no':  Run text script at offset 0x027B16
					; 0xE0E2: PRINT	MSG 0x0130, MSGBOX CLEARED, END: "{6A}C'est un fortifiant{66}nommé EkeEke.  Il contient{66}une forte dose de la vitamine{71}{6A}Ekenol.{66}Ca s'achète partout.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0004:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $101,$1	; Run text script at offset 0x027B1C
					; 0xE0E5: PRINT	MSG 0x0133, MSGBOX CLEARED, END: "{6A}Oua oua!{6D}"
					;
		dc.w $201		; Params 02, 01
		ScriptID    $102,$3	; Run text script at offset 0x027B1E
					; 0x153C: SET BIT 4 OF FLAG 0x027
					; 0xE0E6: PRINT	MSG 0x0134, MSGBOX CLEARED, END: "{6A}Oh!  Vous	me comprenez?  Je{66}suis...enfin, j'étais une fille{66}jusqu'au jour où la sorcière,{71}{6A}Helga, qui vit dans{66}la forêt à l'est de Mercator,{66}m'a transformée en chienne.{71}{6A}Mon amoureux, Marty,{66}est également sous son{66}pouvoir.  Il est devenu son{71}{6A}animal de compagnie!
					;                                                 {66}Oh, comme il me manque!{66}Mais c'est sans espoir!  Helga{71}{6A}dit que nous ne pourrons{66}jamais retrouver une forme{66}humaine si nous nous voyons{71}sous cet aspect.{71}{6A}Ce sort ne sera jamais{66}levé, tant que Helga restera{66}en vie...  Howaouuuu!...{6D}"
					;
		dc.w $203		; Params 02, 03
		ScriptJump  CS_0004_0,$5 ; Jump	to address 0x026254
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0004_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E2		; Bit 2	of flag	0x01C
		ScriptID    $104,$1	; Flag clear: Run text script at offset	0x027B22
					; 0xE0E7: PRINT	MSG 0x0135, MSGBOX CLEARED, END: "{6A}Mille mercis!{6D}Cette maison sera dorénavant{66}notre foyer, à Marty et moi.{6D}"
		ScriptID    $105,$2	; Flag set:   Run text script at offset	0x027B24
					; 0xE0E8: PRINT	MSG 0x0136, MSGBOX CLEARED, END: "{6A}Je suis vrai...  Oua oua!{66}Oh, non!  C'est trop affreux!{66}On se transforme de nouveau!{71}{6A}Quel cauchemar!{66}Ha, ha, ha!  Je plaisante!{66}Bonne chance!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0086:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $106,$0	; Run text script at offset 0x027B26
					; 0xE0E9: PRINT	MSG 0x0137, MSGBOX CLEARED, END: "{6A}Coc-coc-a-coc{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0087:
		trap	#1
		ScriptID    $107,$0	; Run text script at offset 0x027B28
					; 0xE0EA: PRINT	MSG 0x0138, MSGBOX CLEARED, END: "{6A}Coc-co-co-coc{6D}"
		rts
; ---------------------------------------------------------------------------

CS_0005:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $108,$0	; Run text script at offset 0x027B2A
					; 0xE0EB: PRINT	MSG 0x0139, MSGBOX CLEARED, END: "{6A}Si vous voulez{66}quelque	chose, prenez-le{66}et posez-le	sur le comptoir.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0006:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $109,$0	; Run text script at offset 0x027B2C
					; 0xE0EC: PRINT	MSG 0x013A, MSGBOX CLEARED, END: "{6A}C'est mon travail de{66}faire des enregistrements et{66}de soigner.  Que voulez-vous?{71}{6A}Apportez-moi{66}n'importe quel livre.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0088:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 0			; Params 00, 00
		ScriptID    $10A,$1	; Run text script at offset 0x027B2E
					; 0xE0ED: PRINT	MSG 0x013B, MSGBOX CLEARED, END: "{6A}Y	a-t-il vraiment{66}une déesse?{6D}"
					;
		dc.w 2			; Params 00, 02
		ScriptID    $10B,$3	; Run text script at offset 0x027B30
					; 0xE0EE: PRINT	MSG 0x013C, MSGBOX CLEARED, END: "{6A}S'il y a vraiment une{66}déesse, alors pourquoi les a-{66}t-elle laissé enlever Fara?{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $10C,$5	; Run text script at offset 0x027B32
					; 0xE0EF: PRINT	MSG 0x013D, MSGBOX CLEARED, END: "{6A}A	présent, je sais{66}que	la déesse existe!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0007:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $10D,$0	; Run text script at offset 0x027B34
					; 0x0425: LOAD 0x0025 INTO 0xFF1198 (Registre{79}d'H?ƒ??tel)
					; 0x0826: LOAD 0x0026 INTO 0xFF119A (Plan{79}de	l'Ile)
					; 0xE0F0: PRINT	MSG 0x013E, MSGBOX CLEARED, END: "{6A}Prenez le	mot{66}et laissez-le sur le comptoir{66}si vous	désirez	rester.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0089:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 1			; Params 00, 01
		ScriptID    $110,$1	; Run text script at offset 0x027B3A
					; 0xE0F1: PRINT	MSG 0x013F, MSGBOX CLEARED, END: "{6A}Mais, je suis en colère,{66}moi!	Ca ne va pas faire plaisir{66}au maire,	vous allez voir!{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $111,$3	; Run text script at offset 0x027B3C
					; 0xE0F2: PRINT	MSG 0x0140, MSGBOX CLEARED, END: "{6A}Jamais je	n'ai connu{66}un homme aussi courageux!{66}Je vous admire tellement!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0008:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 1			; Params 00, 01
		ScriptID    $112,$1	; Run text script at offset 0x027B3E
					; 0x1400: SET BIT 0 OF FLAG 0x000
					; 0x7C08: LOAD CUSTOM ACTION 0x08 (0x10000001F CSA_0008), MSGBOX CLEARED, END
					;
		dc.w 2			; Params 00, 02
		ScriptJump  CS_0008_0,$3 ; Jump	to address 0x0262CC
					;
		dc.w 3			; Params 00, 03
		ScriptID    $115,$5	; Run text script at offset 0x027B44
					; 0xE0F4: PRINT	MSG 0x0142, MSGBOX CLEARED, END: "{6A}J'ai entendu dire que{66}Fara a été enlevée!{66}Est-ce vrai?  Incroyable!!{71}{6A}Je crois que la tribu{66}des Gumi est sous les{66}ordres des Orcs!  Pauvre Fara..{71}{6A}Allez au Lieu Saint du{66}Marais pour sauver Fara.{66}Faites vite, Ryle!{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $116,$7	; Run text script at offset 0x027B46
					; 0xE0F5: PRINT	MSG 0x0143, MSGBOX CLEARED, END: "{6A}C'est parfait...{66}Les deux tribus pourront{66}vivre en harmonie.{71}{6A}A propos du roi Nole...{66}J'ai appris qu'il a existé{66}à une époque lointaine{71}{6A}C'est tout ce que j'ai{66}trouvé dans mes livres.  Vous{66}en apprendrez davantage à{71}Mercator, peut-être.{6D}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $117,$9	; Run text script at offset 0x027B48
					; 0xE0F6: PRINT	MSG 0x0144, MSGBOX CLEARED, END: "{6A}Une estampe, c'est ça?{66}les joyaux doivent appartenir{66}au roi Nole.{71}{6A}Selon mes archives,{66}il y a cinq joyaux en tout.{66}Si les joyaux existent...{71}{6A}C'est fascinant...{66}Revenez me voir.{6D}"
					;
		dc.w 9			; Params 00, 09
		ScriptID    $118,$B	; Run text script at offset 0x027B4A
					; 0xE0F7: PRINT	MSG 0x0145, MSGBOX CLEARED, END: "{6A}Mercator est une grande{66}ville où on s'amuse bien.  Mais{66}méfiez-vous du duc!!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $119,$D	; Run text script at offset 0x027B4C
					; 0xE0F8: PRINT	MSG 0x0146, MSGBOX CLEARED, END: "{6A}Comment?	Vous partez{66}pour infliger une défaite à{66}Lord Mir?	 D'accord, si vous y{71}{6A}tenez.  Mais je persiste{66}à croire qu'il est innocent.{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $11A,$F	; Run text script at offset 0x027B4E
					; 0xE0F9: PRINT	MSG 0x0147, MSGBOX CLEARED, END: "{6A}Vous avez	vraiment vu{66}Lord Mir?  Il va	bien?...{66}C'est une excellente nouvelle!{71}{6A}Vous pouvez lui faire{66}une confiance absolue!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $11B,$11	; Run text script at offset 0x027B50
					; 0xE0FA: PRINT	MSG 0x0148, MSGBOX CLEARED, END: "{6A}Ainsi, le	duc a montré{66}ses intentions...  Tous	sauront{66}qu'il est à la recherche des{71}{6A}trésors du roi Nole.{71}{6A}Peut-être qu'en venant{66}ici, vous l'avez persuadé de{66}la vérité de toutes{71}{6A}ces vieilles légendes...{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $11C,$13	; Run text script at offset 0x027B52
					; 0xE0FB: PRINT	MSG 0x0149, MSGBOX CLEARED, END: "{6A}Il a abandonné la	ville.{66}Il ferait n'importe quoi{66}pour mettre la main sur les{71}{6A}trésors légendaires.{71}{6A}Ne le laissez pas{66}s'emparer des trésors!  Vous{66}devez l'arrêter à tout prix!{71}{6A}Si le duc met la main{66}sur ces trésors, alors ce sera{66}la fin du monde!!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0008_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $12		; Bit 2	of flag	0x002
		ScriptID    $115,$1	; Flag clear: Run text script at offset	0x027B44
					; 0xE0F4: PRINT	MSG 0x0142, MSGBOX CLEARED, END: "{6A}J'ai entendu dire que{66}Fara a été enlevée!{66}Est-ce vrai?  Incroyable!!{71}{6A}Je crois que la tribu{66}des Gumi est sous les{66}ordres des Orcs!  Pauvre Fara..{71}{6A}Allez au Lieu Saint du{66}Marais pour sauver Fara.{66}Faites vite, Ryle!{6D}"
		ScriptID    $114,$2	; Flag set:   Run text script at offset	0x027B42
					; 0xE0F3: PRINT	MSG 0x0141, MSGBOX CLEARED, END: "{6A}J'étudie encore{66}les vieux documents.{66}J'ai besoin de temps.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_008B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 2			; Params 00, 02
		ScriptID    $11D,$1	; Run text script at offset 0x027B54
					; 0xE0FC: PRINT	MSG 0x014A, MSGBOX CLEARED, END: "{6A}Qui êtes-vous?{66}Sortez d'ici, étranger!{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $11E,$3	; Run text script at offset 0x027B56
					; 0xE0FD: PRINT	MSG 0x014B, MSGBOX CLEARED, END: "{6A}E-excusez-nous.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_008C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 2			; Params 00, 02
		ScriptID    $11F,$1	; Run text script at offset 0x027B58
					; 0xE0FE: PRINT	MSG 0x014C, MSGBOX CLEARED, END: "{6A}Mille regrets.{66}Rite sacré.{66}Pas de visiteurs!{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $120,$3	; Run text script at offset 0x027B5A
					; 0xE0FF: PRINT	MSG 0x014D, MSGBOX CLEARED, END: "{6A}Bienvenue	au{66}village de Gumi.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_008D:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $121,$0	; Run text script at offset 0x027B5C
					; 0xE100: PRINT	MSG 0x014E, MSGBOX CLEARED, END: "{6A}Saviez-vous que nous{66}étions sous l'emprise des{66}monstrueux Rois Orcs?{71}{6A}A vrai dire, je ne me{66}souviens de rien.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0009:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C2		; Bit 2	of flag	0x018
		ScriptID    $122,$1	; Flag clear: Run text script at offset	0x027B5E
					; 0xE101: PRINT	MSG 0x014F, MSGBOX CLEARED, END: "{6A}J'ai honte...{66}Nous nous sommes laissés{66}diriger par ces monstres qui{71}{6A}ont profané notre plus{66}précieux lieu sacré.  Est-ce{66}que les habitants de Massan{71}nous pardonneront un jour?{6D}"
		ScriptID    $123,$2	; Flag set:   Run text script at offset	0x027B60
					; 0xE102: PRINT	MSG 0x0150, MSGBOX CLEARED, END: "{6A}Nous allons vivre	et{66}travailler main dans la main{66}avec les habitants de Massan.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_000A:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $124,$0	; Run text script at offset 0x027B62
					; 0xE103: PRINT	MSG 0x0151, MSGBOX CLEARED, END: "{6A}Merci.  Merci encore.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_008E:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $125,$0	; Run text script at offset 0x027B64
					; 0xE104: PRINT	MSG 0x0152, MSGBOX CLEARED, END: "{6A}Ne nous jugez pas{66}trop	sévèrement.  Nous{66}regrettons	profondement.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_008F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 3			; Params 00, 03
		ScriptID    $126,$1	; Run text script at offset 0x027B66
					; 0xE105: PRINT	MSG 0x0153, MSGBOX CLEARED, END: "{6A}Hors d'ici!  Dehors!{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $127,$3	; Run text script at offset 0x027B68
					; 0xE106: PRINT	MSG 0x0154, MSGBOX CLEARED, END: "{6A}J'ai été grossier?Pardon!{66}Attention!  Vous irez loin si{66}vous pensez d'abord aux autres{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0090:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $128,$0	; Run text script at offset 0x027B6A
					; 0xE107: PRINT	MSG 0x0155, MSGBOX CLEARED, END: "{6A}On dit qu'il y a une{66}sorcière qui vit du côté de{66}Mercator.Elle serait très agée{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0091:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 3			; Params 00, 03
		ScriptID    $129,$1	; Run text script at offset 0x027B6C
					; 0xE108: PRINT	MSG 0x0156, MSGBOX CLEARED, END: "{6A}Allez-vous en!{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $12A,$3	; Run text script at offset 0x027B6E
					; 0xE109: PRINT	MSG 0x0157, MSGBOX CLEARED, END: "{6A}A	Mercator?{66}Sortez du village,	puis{66}allez vers l'ouest.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0092:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 4			; Params 00, 04
		ScriptID    $12B,$1	; Run text script at offset 0x027B70
					; 0xE10A: PRINT	MSG 0x0158, MSGBOX CLEARED, END: "{6A}Je ne peux pas aller{66}à	Mercator à cause de{66}l'éboulement.{6D}"
					;
		dc.w 5			; Params 00, 05
		ScriptID    $12C,$3	; Run text script at offset 0x027B72
					; 0xE10B: PRINT	MSG 0x0159, MSGBOX CLEARED, END: "{6A}La route vers Mercator{66}est enfin ouverte!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0093:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 4			; Params 00, 04
		ScriptID    $12D,$1	; Run text script at offset 0x027B74
					; 0xE10C: PRINT	MSG 0x015A, MSGBOX CLEARED, END: "{6A}Attendez un instant!{66}Nous sommes les spécialistes{66}chargés des réparations.{71}{6A}Ce ne sera pas long...{6D}"
					;
		dc.w 5			; Params 00, 05
		ScriptJump  CS_0093_0,$3 ; Jump	to address 0x026350
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0093_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C3		; Bit 3	of flag	0x018
		ScriptID    $12E,$1	; Flag clear: Run text script at offset	0x027B76
					; 0x7C0D: LOAD CUSTOM ACTION 0x0D (0x100000033 CSA_000D), MSGBOX CLEARED, END
		ScriptID    $12F,$2	; Flag set:   Run text script at offset	0x027B78
					; 0xE10D: PRINT	MSG 0x015B, MSGBOX CLEARED, END: "{6A}Je suis trop épuisé pour{66}parler!..Ah oui, bien	entendu!{66}Vous pouvez	passer à présent!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0094:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 2			; Params 00, 02
		ScriptID    $130,$1	; Run text script at offset 0x027B7A
					; 0xE10E: PRINT	MSG 0x015C, MSGBOX CLEARED, END: "{6A}Oua oua!{6D}"
					;
		dc.w $19		; Params 00, 19
		ScriptID    $131,$3	; Run text script at offset 0x027B7C
					; 0xE10F: PRINT	MSG 0x015D, MSGBOX CLEARED, END: "{6A}J'aime bien tous les{66}gens de ce village.  Oua oua!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0095:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $132,$0	; Run text script at offset 0x027B7E
					; 0xE110: PRINT	MSG 0x015E, MSGBOX CLEARED, END: "{6A}Coooot...Cot..{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_000B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 3			; Params 00, 03
		ScriptID    $133,$1	; Run text script at offset 0x027B80
					; 0xE111: PRINT	MSG 0x015F, MSGBOX CLEARED, END: "{6A}Je ne pouvais pas{66}les accompagner au Lieu Saint.{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $134,$3	; Run text script at offset 0x027B82
					; 0xE112: PRINT	MSG 0x0160, MSGBOX CLEARED, END: "{6A}C'est vrai que vous{66}êtes incroyablement fort?{71}{6A}Dans ce cas, restez{66}tant que vous voudrez.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_000C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 3			; Params 00, 03
		ScriptID    $135,$1	; Run text script at offset 0x027B84
					; 0xE113: PRINT	MSG 0x0161, MSGBOX CLEARED, END: "{6A}Il est difficile d'ins-{66}pirer les autres quand le mal{66}nous poursuit sans relâche!{6D}"
					;
		dc.w 4			; Params 00, 04
		ScriptID    $136,$3	; Run text script at offset 0x027B86
					; 0xE114: PRINT	MSG 0x0162, MSGBOX CLEARED, END: "{6A}Ils étaient possédés?{66}C'est abominable!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0096:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 4			; Params 00, 04
		ScriptID    $137,$1	; Run text script at offset 0x027B88
					; 0xE115: PRINT	MSG 0x0163, MSGBOX CLEARED, END: "{6A}Nous avons subi un grand{66}tremblement de terre il y a{66}quelques jours.  On dirait{71}{6A}qu'il y a de plus en{66}plus de désastres naturels...{6D}"
					;
		dc.w 5			; Params 00, 05
		ScriptJump  CS_0096_0,$3 ; Jump	to address 0x02639A
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0096_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C3		; Bit 3	of flag	0x018
		ScriptID    $138,$1	; Flag clear: Run text script at offset	0x027B8A
					; 0x7C0D: LOAD CUSTOM ACTION 0x0D (0x100000033 CSA_000D), MSGBOX CLEARED, END
		ScriptID    $139,$2	; Flag set:   Run text script at offset	0x027B8C
					; 0xE116: PRINT	MSG 0x0164, MSGBOX CLEARED, END: "{6A}Ahhh....	Ca fait	du bien!{66}Bon	voyage!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0097:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $13A,$1	; Run text script at offset 0x027B8E
					; 0xE117: PRINT	MSG 0x0165, MSGBOX CLEARED, END: "{6A}Bonjour.	Voici Ryuma.{6D}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $13B,$3	; Run text script at offset 0x027B90
					; 0xE118: PRINT	MSG 0x0166, MSGBOX CLEARED, END: "{6A}Bienvenue!{6D}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $13C,$5	; Run text script at offset 0x027B92
					; 0xE119: PRINT	MSG 0x0167, MSGBOX CLEARED, END: "{6A}On prétend que vous{66}êtes un héros, jeune homme!{6D}"
					;
		dc.w $A			; Params 00, 0A
		ScriptID    $13D,$7	; Run text script at offset 0x027B94
					; 0xE11A: PRINT	MSG 0x0168, MSGBOX CLEARED, END: "{6A}J'ai vu une belle blonde{66}quitter la ville en compagnie{66}de deux monstres ricanants...{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $13E,$9	; Run text script at offset 0x027B96
					; 0xE11B: PRINT	MSG 0x0169, MSGBOX CLEARED, END: "{6A}Sur nous s'abattent les{66}catastrophes ces jours-ci.{66}Cette fois, c'est le phare{71}{6A}qu'on a attaqué.{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $13A,$B	; Run text script at offset 0x027B8E
					; 0xE117: PRINT	MSG 0x0165, MSGBOX CLEARED, END: "{6A}Bonjour.	Voici Ryuma.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0098:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $13F,$1	; Run text script at offset 0x027B98
					; 0xE11C: PRINT	MSG 0x016A, MSGBOX CLEARED, END: "{6A}Je pourrais les{66}chasser, ces voleurs...{66}si j'étais un peu plus agé.{6D}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $140,$3	; Run text script at offset 0x027B9A
					; 0xE11D: PRINT	MSG 0x016B, MSGBOX CLEARED, END: "{6A}Père...{6D}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $141,$5	; Run text script at offset 0x027B9C
					; 0xE11E: PRINT	MSG 0x016C, MSGBOX CLEARED, END: "{6A}Pourquoi êtes-vous{66}parti sans moi?{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $142,$7	; Run text script at offset 0x027B9E
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE11F: PRINT	MSG 0x016D, MSGBOX CLEARED, END: "{6A}Je sais que vous{66}pouvez récupérer le{66}{6E}, puisque je{71}{6A}vous accompagne{66}cette fois-ci!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $141,$9	; Run text script at offset 0x027B9C
					; 0xE11E: PRINT	MSG 0x016C, MSGBOX CLEARED, END: "{6A}Pourquoi êtes-vous{66}parti sans moi?{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0099:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $144,$1	; Run text script at offset 0x027BA2
					; 0xE120: PRINT	MSG 0x016E, MSGBOX CLEARED, END: "{6A}Ryuma est	une cité ancien.{71}{6A}Croyez-moi ou non,{66}cette ville était	plus grande{66}que Mercator, à une époque.{6D}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $145,$3	; Run text script at offset 0x027BA4
					; 0xE121: PRINT	MSG 0x016F, MSGBOX CLEARED, END: "{6A}J'ai entendu dire que{66}Mercator est gouverné par{66}le duc de Mercator maintenant.{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $146,$5	; Run text script at offset 0x027BA6
					; 0xE122: PRINT	MSG 0x0170, MSGBOX CLEARED, END: "{6A}C'était vraiment une{66}crapule, ce duc de Mercator?{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $147,$1	; Run text script at offset 0x027BA8
					; 0xE123: PRINT	MSG 0x0171, MSGBOX CLEARED, END: "{6A}Vous cherchez les	trésors,{66}vous aussi?{71}{6A}Si c'est le cas, je{66}voudrais avoir ma part!{6D}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $148,$3	; Run text script at offset 0x027BAA
					; 0xE124: PRINT	MSG 0x0172, MSGBOX CLEARED, END: "{6A}Pensez à me donner{66}une	part quand vous	trouverez{66}les trésors!  Ha ha ha!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_000D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $149,$1	; Run text script at offset 0x027BAC
					; 0xE125: PRINT	MSG 0x0173, MSGBOX CLEARED, END: "{6A}Les ventes ont baissé ce{66}mois-ci, à cause des voleurs!{6D}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $14A,$3	; Run text script at offset 0x027BAE
					; 0xE126: PRINT	MSG 0x0174, MSGBOX CLEARED, END: "{6A}Partez d'ici et{66}rentrez chez vous!  Vous verrez{66}que mon conseil est sage.{6D}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $14B,$5	; Run text script at offset 0x027BB0
					; 0xE127: PRINT	MSG 0x0175, MSGBOX CLEARED, END: "{6A}Merci, Ryle.{66}Vous êtes	le sauveur{66}de la ville!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $14C,$7	; Run text script at offset 0x027BB2
					; 0xE128: PRINT	MSG 0x0176, MSGBOX CLEARED, END: "{6A}Bonjour, Ryle.  On{66}dirait que nos problèmes{66}n'auront jamais de fin.{71}{6A}Avez-vous vu le{66}?phare?  Personne ne peut{66}venir sans sa lumière.{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $14B,$9	; Run text script at offset 0x027BB0
					; 0xE127: PRINT	MSG 0x0175, MSGBOX CLEARED, END: "{6A}Merci, Ryle.{66}Vous êtes	le sauveur{66}de la ville!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $14D,$1	; Run text script at offset 0x027BB4
					; 0xE129: PRINT	MSG 0x0177, MSGBOX CLEARED, END: "{6A}Depuis peu, c'est{66}devenu dangereux par ici.{66}Il y a une bande de voleurs.{6D}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $14E,$3	; Run text script at offset 0x027BB6
					; 0xE12A: PRINT	MSG 0x0178, MSGBOX CLEARED, END: "{6A}Je fais ma valise!{66}Qui	voudrait vivre avec ces{66}voleurs dans	la région?{6D}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $14F,$5	; Run text script at offset 0x027BB8
					; 0xE12B: PRINT	MSG 0x0179, MSGBOX CLEARED, END: "{6A}Comme les	voleurs	ne{66}sont plus	là, je crois que je{66}vais rester un peu.  Au revoir!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $150,$1	; Run text script at offset 0x027BBA
					; 0xE12C: PRINT	MSG 0x017A, MSGBOX CLEARED, END: "{6A}Vous êtes	un visiteur?{66}Nous en	voyons si peu ces{66}temps-ci, à cause des voleurs.{6D}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $151,$3	; Run text script at offset 0x027BBC
					; 0xE12D: PRINT	MSG 0x017B, MSGBOX CLEARED, END: "{6A}Horrible!!...{6D}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $152,$5	; Run text script at offset 0x027BBE
					; 0xE12E: PRINT	MSG 0x017C, MSGBOX CLEARED, END: "{6A}J'espère vous revoir.{66}Et je suis sincère!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $153,$7	; Run text script at offset 0x027BC0
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE12F: PRINT	MSG 0x017D, MSGBOX CLEARED, END: "{6A}C'est l'apprenti{66}du phare qui a{66}volé le {6E}{71}{6A}Vous le saviez?{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009D:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $155,$0	; Run text script at offset 0x027BC4
					; 0xE130: PRINT	MSG 0x017E, MSGBOX CLEARED, END: "{6A}Le commerçant est	{66}parti.  Où vais-je trouver de{66}l'Ekenol à présent?{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_000E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $156,$1	; Run text script at offset 0x027BC6
					; 0xE131: PRINT	MSG 0x017F, MSGBOX CLEARED, END: "{6A}Ce sont des voleurs,{66}mais des êtres humains aussi!{66}Je dois les convertir!{6D}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $157,$3	; Run text script at offset 0x027BC8
					; 0xE132: PRINT	MSG 0x0180, MSGBOX CLEARED, END: "{6A}Ce sont des démons!!{6D}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $158,$5	; Run text script at offset 0x027BCA
					; 0xE133: PRINT	MSG 0x0181, MSGBOX CLEARED, END: "{6A}C'était des monstres?{66}Vraiment?{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $159,$7	; Run text script at offset 0x027BCC
					; 0xE134: PRINT	MSG 0x0182, MSGBOX CLEARED, END: "{6A}Les gens sont tristes.{66}Mais un	jour, je le sais, ils{66}retrouveront la joie!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $15A,$1	; Run text script at offset 0x027BCE
					; 0xE135: PRINT	MSG 0x0183, MSGBOX CLEARED, END: "{6A}Nous avons peur que{66}les voleurs investissent la{6D}grotte sur le promontoire.{6D}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $15B,$3	; Run text script at offset 0x027BD0
					; 0xE136: PRINT	MSG 0x0184, MSGBOX CLEARED, END: "{6A}Sauvez notre ville!{6D}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $15C,$5	; Run text script at offset 0x027BD2
					; 0xE137: PRINT	MSG 0x0185, MSGBOX CLEARED, END: "{6A}Vous avez	battu les{66}voleurs tout seul?{66}C'est incroyable!!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $15D,$7	; Run text script at offset 0x027BD4
					; 0xE138: PRINT	MSG 0x0186, MSGBOX CLEARED, END: "{6A}Ramenez la lumière{66}à notre phare, vite!!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $15E,$9	; Run text script at offset 0x027BD6
					; 0xE139: PRINT	MSG 0x0187, MSGBOX CLEARED, END: "{6A}Vous avez	été{66}d'un grand secours!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_009F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $15F,$1	; Run text script at offset 0x027BD8
					; 0xE13A: PRINT	MSG 0x0188, MSGBOX CLEARED, END: "{6A}Ils s'enfuient vite!{66}Bande de poltrons!{71}{6A}Les soldats de{66}Mercator les ont repoussés{66}jusqu'au phare, mais ils ont pu{71}{6A}s'échapper.{6D}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $160,$3	; Run text script at offset 0x027BDA
					; 0xE13B: PRINT	MSG 0x0189, MSGBOX CLEARED, END: "{6A}Que quelqu'un nous{66}libère de ces voleurs!{6D}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $161,$5	; Run text script at offset 0x027BDC
					; 0xE13C: PRINT	MSG 0x018A, MSGBOX CLEARED, END: "{6A}vous êtes	formidable!!{66}Vous avez pénétré seul dans{66}cette grotte...	Quel courage!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $162,$7	; Run text script at offset 0x027BDE
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE13D: PRINT	MSG 0x018B, MSGBOX CLEARED, END: "{6A}Atteindre	le {6E}{66}est quasi impossible!{66}Dites-moi qui peut le faire!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $164,$9	; Run text script at offset 0x027BE2
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE13E: PRINT	MSG 0x018C, MSGBOX CLEARED, END: "{6A}Comment!{66}Vous avez trouvé le {6E}!{66}C'est magnifique!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_000F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 8			; Params 00, 08
		ScriptID    $166,$1	; Run text script at offset 0x027BE6
					; 0xE13F: PRINT	MSG 0x018D, MSGBOX CLEARED, END: "{6A}Je vous remercie.{66}Quand vous aurez trouvé{66}les trésors...{71}{6A}Venez acheter tout{66}ce que j'ai dans le magasin!{66}Hé hé hé.  Pardonnez-moi,{71}{6A}je plaisante!  Nous{66}autres commerçants, on{66}adore rire, vous comprenez!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $167,$3	; Run text script at offset 0x027BE8
					; 0xE140: PRINT	MSG 0x018E, MSGBOX CLEARED, END: "{6A}On dirait	que cette{66}histoire de phare inquiète{66}les gens de Mercator	aussi.{71}{6A}On dit que le duc	est{66}parti, on ne sait pas où.{71}{6A}Vous croyez qu'il est{66}parti à la recherche d'une{66}Pierre Solaire, lui aussi?{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $168,$1	; Run text script at offset 0x027BEA
					; 0xE141: PRINT	MSG 0x018F, MSGBOX CLEARED, END: "{6A}...mmmmmm...{66}Mon fils est sorti...{6D}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $169,$3	; Run text script at offset 0x027BEC
					; 0xE142: PRINT	MSG 0x0190, MSGBOX CLEARED, END: "{6A}...  mmmmmm...{66}Vengez mon fils!{66}...	 Je vous en prie!...{6D}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $16A,$5	; Run text script at offset 0x027BEE
					; 0xE143: PRINT	MSG 0x0191, MSGBOX CLEARED, END: "{6A}...mmmm...mmmm...{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $16B,$7	; Run text script at offset 0x027BF0
					; 0xE144: PRINT	MSG 0x0192, MSGBOX CLEARED, END: "{6A}...mmm..	je me demande{66}si elle va bien...{66}à Mercator...{71}{6A}...	 Est-ce	que son	mari{66}cherche	toujours des pots?...{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $16C,$1	; Run text script at offset 0x027BF2
					; 0xE145: PRINT	MSG 0x0193, MSGBOX CLEARED, END: "{6A}Mon père est sorti.  Il{66}disait	qu'il avait une chose{66}importante à faire.{6D}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $16D,$3	; Run text script at offset 0x027BF4
					; 0xE146: PRINT	MSG 0x0194, MSGBOX CLEARED, END: "{6A}Mon père me disait{66}toujours que les marins ne{66}pleurent jamais...  snif...{6D}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $16E,$5	; Run text script at offset 0x027BF6
					; 0xE147: PRINT	MSG 0x0195, MSGBOX CLEARED, END: "{6A}Papa est revenu!{66}C'est bien lui le plus fort!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $16F,$7	; Run text script at offset 0x027BF8
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE148: PRINT	MSG 0x0196, MSGBOX CLEARED, END: "{6A}Faut pas en vouloir{66}à mon papa.  Lui aussi a été{66}surpris quand l'apprenti a{71}{6A}volé la Pierre Solaire.{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $171,$9	; Run text script at offset 0x027BFC
					; 0xE149: PRINT	MSG 0x0197, MSGBOX CLEARED, END: "{6A}Vous êtes	super!{66}Presque aussi	bien que{66}mon	papa!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A2:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 8			; Params 00, 08
		ScriptJump  CS_00A2_0,$1 ; Jump	to address 0x0264E0
					;
		dc.w $18		; Params 00, 18
		ScriptID    $175,$3	; Run text script at offset 0x027C04
					; 0x814D: PRINT	MSG 0x019B: "{6A}Mon assistant manquant{66}est subitement revenu...{71}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE14E: PRINT	MSG 0x019C, MSGBOX CLEARED, END: "{6A}Puis, il est parti{66}de nouveau,	avec{66}la {6E}...{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $689,$5	; Run text script at offset 0x02862C
					; 0xE4C2: PRINT	MSG 0x0510, MSGBOX CLEARED, END: "{6A}Je l'ai fermé à clef...{66}Comme ça, on n'aura plus{66}d'histoires!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A2_0:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $172,$0	; Prompt:	Run text script	at offset 0x027BFE
					; 0xA14A: PRINT	MSG 0x0198, END: "{6A}Ryle!  Vous tombez{66}bien!  Mon apprenti	a disparu.{71}{6A}Pourquoi vous	ne{66}prendriez	pas sa place?{67}"
		ScriptID    $173,$1	; Answer 'yes': Run text script at offset 0x027C00
					; 0xE14B: PRINT	MSG 0x0199, MSGBOX CLEARED, END: "{6A}Ha ha ha ha ha{66}Je plaisante, évidemment!{66}Comme vous	êtes sympathique!{6D}"
		ScriptID    $174,$2	; Answer 'no':  Run text script at offset 0x027C02
					; 0xE14C: PRINT	MSG 0x019A, MSGBOX CLEARED, END: "{6A}C'est normal.  Les gens{66}de Ryuma ont besoin de vous.{66}Vous êtes un brave garçon!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0010:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $178,$1	; Run text script at offset 0x027C0A
					; 0x814F: PRINT	MSG 0x019D: "{6A}Le maître est sorti.{66}Mais je peux vous expliquer{66}le fonctionnement du phare.{71}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE150: PRINT	MSG 0x019E, MSGBOX CLEARED, END: "{6A}Pour guider les navires{66}jusqu'au port, le phare{66}utilise une Pierre Solaire...{71}{6A}Il n'y a pas de{66}pierre plus lumineuse!{6D}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $17B,$3	; Run text script at offset 0x027C10
					; 0xE151: PRINT	MSG 0x019F, MSGBOX CLEARED, END: "{6A}Les voleurs ont{66}tué mon maître...{66}Que dois-je faire?{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $17C,$5	; Run text script at offset 0x027C12
					; 0xE152: PRINT	MSG 0x01A0, MSGBOX CLEARED, END: "{6A}Aïe!  Je suis désolé!Je ne{66}l'aurais pas fait si j'avais{66}su que ça faisait partie{71}des projets du duc!!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $17D,$7	; Run text script at offset 0x027C14
					; 0xE153: PRINT	MSG 0x01A1, MSGBOX CLEARED, END: "{6A}Aïe!{66}S'il vous plaît, laissez-moi{66}partir.  Je regrette!...{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $17E,$9	; Run text script at offset 0x027C16
					; 0xE154: PRINT	MSG 0x01A2, MSGBOX CLEARED, END: "{6A}J'ai appris ma leçon!{66}Je travaillerai bien sous{66}les ordres d'Arthur!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A3:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $17F,$1	; Run text script at offset 0x027C18
					; 0xE155: PRINT	MSG 0x01A3, MSGBOX CLEARED, END: "{6A}Les voleurs doivent{66}chercher les mêmes	trésors{66}que vous!{71}{6A}Il doit y avoir un indice{66}dans la grotte!{6D}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $180,$3	; Run text script at offset 0x027C1A
					; 0xE156: PRINT	MSG 0x01A4, MSGBOX CLEARED, END: "{6A}Vous avez	trouvé{66}l'estampe ici?  Ce doit être un{66}indice.  Faites-moi voir ça!{71}{6A}Comment!?{66}On l'a subtilisée?{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $181,$5	; Run text script at offset 0x027C1C
					; 0xE157: PRINT	MSG 0x01A5, MSGBOX CLEARED, END: "{6A}Le duc de	Mercator{66}a abandonné	sa ville pour{66}chercher les trésors...{71}{6A}Cela voudrait dire que{66}ces trésors légendaires{66}existent réellement!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A4:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $182,$1	; Run text script at offset 0x027C1E
					; 0xE158: PRINT	MSG 0x01A6, MSGBOX CLEARED, END: "{6A}Veuillez sortir...{66}Nous sommes	en réunion.{6D}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $183,$3	; Run text script at offset 0x027C20
					; 0xE159: PRINT	MSG 0x01A7, MSGBOX CLEARED, END: "{6A}Ainsi vous nous avez{66}entendu!?	 Le maire est parti{66}négocier	avec les voleurs...{71}{6A}Il n'est jamais revenu!{66}Que s'est-il passé?{6D}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $184,$5	; Run text script at offset 0x027C22
					; 0xE15A: PRINT	MSG 0x01A8, MSGBOX CLEARED, END: "{6A}Vous avez	sauvé la ville!{66}C'est à peine croyable{66}que vous avez agi tout seul!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $185,$7	; Run text script at offset 0x027C24
					; 0xE15B: PRINT	MSG 0x01A9, MSGBOX CLEARED, END: "{6A}Le Labyrinthe Vert a un autre{66}nom...  La Forêt	des Egarés!{71}{6A}Selon la légende, celui{66}qui y met	le pied...{66}y	reste à	tout jamais!!{71}{6A}C'est si dangereux que le{66}duc de Mercator nous interdit{66}d'y aller!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $184,$9	; Run text script at offset 0x027C22
					; 0xE15A: PRINT	MSG 0x01A8, MSGBOX CLEARED, END: "{6A}Vous avez	sauvé la ville!{66}C'est à peine croyable{66}que vous avez agi tout seul!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $186,$1	; Run text script at offset 0x027C26
					; 0xE15C: PRINT	MSG 0x01AA, MSGBOX CLEARED, END: "{6A}Le maire n'est pas là.{6D}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $187,$3	; Run text script at offset 0x027C28
					; 0xE15D: PRINT	MSG 0x01AB, MSGBOX CLEARED, END: "{6A}Si le maire se fait tuer,{66}alors la ville est perdue!{6D}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $188,$5	; Run text script at offset 0x027C2A
					; 0xE15E: PRINT	MSG 0x01AC, MSGBOX CLEARED, END: "{6A}C'est unanime!  Vous êtes{66}élu Citoyen Honoraire de Ryuma{6D}"
					;
		dc.w $A			; Params 00, 0A
		ScriptID    $189,$7	; Run text script at offset 0x027C2C
					; 0xE15F: PRINT	MSG 0x01AD, MSGBOX CLEARED, END: "{6A}Que ferez-vous{66}de tous	ces trésors?{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $18A,$9	; Run text script at offset 0x027C2E
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE160: PRINT	MSG 0x01AE, MSGBOX CLEARED, END: "{6A}Mais c'est notre!{66}Citoyen Honoraire!  Nous{66}faisons une réunion pour{71}{6A}décider à qui doit{66} revenir le {6E}.{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $189,$B	; Run text script at offset 0x027C2C
					; 0xE15F: PRINT	MSG 0x01AD, MSGBOX CLEARED, END: "{6A}Que ferez-vous{66}de tous	ces trésors?{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $18C,$1	; Run text script at offset 0x027C32
					; 0xE161: PRINT	MSG 0x01AF, MSGBOX CLEARED, END: "{6A}Allez faire un tour{66}en	ville, jeune homme!{6D}"
					;
		dc.w 6			; Params 00, 06
		ScriptJump  CS_00A6_0,$3 ; Jump	to address 0x02656E
					;
		dc.w 7			; Params 00, 07
		ScriptID    $190,$5	; Run text script at offset 0x027C3A
					; 0xE164: PRINT	MSG 0x01B2, MSGBOX CLEARED, END: "{6A}Leur cachette, c'est la{66}grotte sur le promontoire.{66}Vous pouvez y accéder{71}en radeau.{6D}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $193,$7	; Run text script at offset 0x027C40
					; 0xE167: PRINT	MSG 0x01B5, MSGBOX CLEARED, END: "{6A}J'avais flairé votre{66}valeur depuis le début!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $194,$9	; Run text script at offset 0x027C42
					; 0x8168: PRINT	MSG 0x01B6: "{6A}Ce n'est pas facile,{66}mais vous êtes le seul à{66}pouvoir résoudre l'énigme{71}{6A}du Labyrinthe Vert.{71}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE169: PRINT	MSG 0x01B7, MSGBOX CLEARED, END: "{6A}Pour atteindre la{66}Pierre Solaire, il vous faudra{66}le	sens de	l'orientation, et il{71}{6A}vaut mieux savoir{66}bien sauter!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $193,$B	; Run text script at offset 0x027C40
					; 0xE167: PRINT	MSG 0x01B5, MSGBOX CLEARED, END: "{6A}J'avais flairé votre{66}valeur depuis le début!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A6_0:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $18D,$0	; Prompt:	Run text script	at offset 0x027C34
					; 0xA162: PRINT	MSG 0x01B0, END: "{6A}Jeune homme, nous{66}avons un problème de	taille...{66}Comment dire...{71}{6A}Seriez-vous	disposé{66}à nous aider?{67}"
		ScriptID    $18E,$1	; Answer 'yes': Run text script at offset 0x027C36
					; 0x8163: PRINT	MSG 0x01B1: "{6A}Une réponse rapide!{66}Vous en	êtes sûr?{66}Très bien!{71}"
					; 0x1420: SET BIT 0 OF FLAG 0x004
					; 0xE164: PRINT	MSG 0x01B2, MSGBOX CLEARED, END: "{6A}Leur cachette, c'est la{66}grotte sur le promontoire.{66}Vous pouvez y accéder{71}en radeau.{6D}"
		ScriptJump  CS_00A6_1,$2 ; Answer 'no':  Jump to address 0x02657A
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00A6_1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $191,$0	; Prompt:	Run text script	at offset 0x027C3C
					; 0xA165: PRINT	MSG 0x01B3, END: "{6A}C'est juste.  Je{66}devrais d'abord vous dire{66}ce que j'attends de vous...{71}{6A}Vous devez allez à{66}leur cachette, puis les{66}vaincre.  Le ferez-vous?{67}"
		ScriptID    $18F,$1	; Answer 'yes': Run text script at offset 0x027C38
					; 0x1420: SET BIT 0 OF FLAG 0x004
					; 0xE164: PRINT	MSG 0x01B2, MSGBOX CLEARED, END: "{6A}Leur cachette, c'est la{66}grotte sur le promontoire.{66}Vous pouvez y accéder{71}en radeau.{6D}"
		ScriptID    $192,$2	; Answer 'no':  Run text script at offset 0x027C3E
					; 0xE166: PRINT	MSG 0x01B4, MSGBOX CLEARED, END: "{6A}Vous me decevez.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00A7:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $197,$0	; Run text script at offset 0x027C48
					; 0xE16A: PRINT	MSG 0x01B8, MSGBOX CLEARED, END: "{6A}Vous n'avez pas peur{66}des voleurs?  Rentrez{66}chez vous!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00A8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $198,$1	; Run text script at offset 0x027C4A
					; 0x7C14: LOAD CUSTOM ACTION 0x14 (0x10000004F CSA_0014), MSGBOX CLEARED, END
					;
		dc.w 6			; Params 00, 06
		ScriptID    $199,$3	; Run text script at offset 0x027C4C
					; 0xE16B: PRINT	MSG 0x01B9, MSGBOX CLEARED, END: "{6A}Je me cache parce{66}que j'ai peur des voleurs!{6D}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $19A,$5	; Run text script at offset 0x027C4E
					; 0xE16C: PRINT	MSG 0x01BA, MSGBOX CLEARED, END: "{6A}J'ai encore peur...{66}Ils sont partis?{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $19B,$7	; Run text script at offset 0x027C50
					; 0xE16D: PRINT	MSG 0x01BB, MSGBOX CLEARED, END: "{6A}Une trahison de plus!{66}Je ne peux plus faire{66}confiance à qui	que ce soit!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00A9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $19C,$1	; Run text script at offset 0x027C52
					; 0xE16E: PRINT	MSG 0x01BC, MSGBOX CLEARED, END: "{6A}Ouah ouah!{6D}"
					;
		dc.w $19		; Params 00, 19
		ScriptID    $19D,$3	; Run text script at offset 0x027C54
					; 0xE16F: PRINT	MSG 0x01BD, MSGBOX CLEARED, END: "{6A}Hmm....  Je vis ici{66}parce que j'aime l'odeur{66}de la mer!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0011:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 8			; Params 00, 08
		ScriptID    $19E,$1	; Run text script at offset 0x027C56
					; 0x7C21: LOAD CUSTOM ACTION 0x21 (0x100000083 CSA_0021), MSGBOX CLEARED, END
					;
		dc.w 9			; Params 00, 09
		ScriptID    $19F,$3	; Run text script at offset 0x027C58
					; 0x0433: LOAD 0x0033 INTO 0xFF1198 (Laissez{79}Passer)
					; 0xE170: PRINT	MSG 0x01BE, MSGBOX CLEARED, END: "{6A}Vous pourrez rentrer dans	Mercator{66}avec le {6E}.{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1A1,$5	; Run text script at offset 0x027C5C
					; 0xE171: PRINT	MSG 0x01BF, MSGBOX CLEARED, END: "{6A}Je pense que nous	avons besoin {66}d'une sorte d'exorcisme.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_008A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1A2,$1	; Run text script at offset 0x027C5E
					; 0xE172: PRINT	MSG 0x01C0, MSGBOX CLEARED, END: "{6A}C'est bizzarre...{66}Où est le maire?{66}Qu'arrive-t'il à cette ville?{6D}"
					;
		dc.w 6			; Params 00, 06
		ScriptID    $1A3,$3	; Run text script at offset 0x027C60
					; 0xE173: PRINT	MSG 0x01C1, MSGBOX CLEARED, END: "{6A}Que Diable veulent{66}ces	voleurs?{6D}"
					;
		dc.w 8			; Params 00, 08
		ScriptID    $1A4,$5	; Run text script at offset 0x027C62
					; 0xE174: PRINT	MSG 0x01C2, MSGBOX CLEARED, END: "{6A}Une jeune	fille blonde vient{66}de me voler mon laissez-passer!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1A5,$1	; Run text script at offset 0x027C64
					; 0x18AA: LOAD CHARACTER SCRIPT	* (0x00AA)
					; 0xE175: PRINT	MSG 0x01C3, MSGBOX CLEARED, END: "{6A}Sans sauf-conduit,{66}vous n'enterez pas!{6D}"
					;
		dc.w 9			; Params 00, 09
		ScriptID    $1A7,$3	; Run text script at offset 0x027C68
					; 0xE176: PRINT	MSG 0x01C4, MSGBOX CLEARED, END: "{6A}Voici Mercator, où{66}l'argent est de loin la chose{66}la plus importante!{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $1A8,$5	; Run text script at offset 0x027C6A
					; 0xE177: PRINT	MSG 0x01C5, MSGBOX CLEARED, END: "{6A}Hé hé hé hé...{66}Désolé!	 Vous serez{66}récompensé un jour!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $1A9,$1	; Run text script at offset 0x027C6C
					; 0x18AB: LOAD CHARACTER SCRIPT	* (0x00AB)
					; 0xE178: PRINT	MSG 0x01C6, MSGBOX CLEARED, END: "{6A}Je ne sens plus mes{66}pauvres jambes!  Ca fait des{66}heures que	je suis	debout...{6D}"
					;
		dc.w 9			; Params 00, 09
		ScriptID    $1AB,$3	; Run text script at offset 0x027C70
					; 0xE179: PRINT	MSG 0x01C7, MSGBOX CLEARED, END: "{6A}Mercator est une ville{66}historique.  Bienvenue{66}parmi	nous!{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $1AC,$5	; Run text script at offset 0x027C72
					; 0xE17A: PRINT	MSG 0x01C8, MSGBOX CLEARED, END: "{6A}Bonjour, Ryle!{66}Comment	allez-vous?{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0012:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1AD,$0	; Run text script at offset 0x027C74
					; 0xE17B: PRINT	MSG 0x01C9, MSGBOX CLEARED, END: "{6A}Mercator est une belle{66}ville avec énormément de{66}choses à voir et à faire.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00AC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1AE,$1	; Run text script at offset 0x027C76
					; 0xE17C: PRINT	MSG 0x01CA, MSGBOX CLEARED, END: "{6A}J'arrive du continent.{66}Comme la ville est grande!{6D}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $1AF,$3	; Run text script at offset 0x027C78
					; 0xE17D: PRINT	MSG 0x01CB, MSGBOX CLEARED, END: "{6A}J'ai entendu dire qu'on{66}passe de bons moments chez{66}Madame Yard...{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $1B0,$5	; Run text script at offset 0x027C7A
					; 0xE17E: PRINT	MSG 0x01CC, MSGBOX CLEARED, END: "{6A}Waou!  Mercator est{66}génial!  J'adore!  Je ne veux{66}plus jamais repartir!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1B1,$1	; Run text script at offset 0x027C7C
					; 0xE17F: PRINT	MSG 0x01CD, MSGBOX CLEARED, END: "{6A}Les prix sont trop{66}élevés dans	cette ville!  Il{66}va me falloir pas mal d'argent!{6D}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $1B2,$3	; Run text script at offset 0x027C7E
					; 0xE180: PRINT	MSG 0x01CE, MSGBOX CLEARED, END: "{6A}Vous êtes	nouveau{66}en ville, pas vrai?{6D}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $1B3,$5	; Run text script at offset 0x027C80
					; 0xE181: PRINT	MSG 0x01CF, MSGBOX CLEARED, END: "{6A}J'ai dépensé tout mon{66}argent!  Il faut que je rentre{66}chez moi, mais je n'ai pas de{71}{6A}quoi payer le voyage!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1B4,$7	; Run text script at offset 0x027C82
					; 0x8182: PRINT	MSG 0x01D0: "{6A}Ce jeune voyou	était{66}l'assistant du gardien de{66}phare.  Son maitre lui faisait{71}{6A}une confiance absolue!!{71}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE183: PRINT	MSG 0x01D1, MSGBOX CLEARED, END: "{6A}Mais il a	volé{66}la {6E}!  Le traître!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1B7,$9	; Run text script at offset 0x027C88
					; 0xE184: PRINT	MSG 0x01D2, MSGBOX CLEARED, END: "{6A}Les jeunes de nos	jours{66}n'ont plus cran!  Ils ne vivent{66}que pour l'instant prèsent!{6D}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $1B8,$B	; Run text script at offset 0x027C8A
					; 0xE185: PRINT	MSG 0x01D3, MSGBOX CLEARED, END: "{6A}Nous parlons de{66}l'avenir de Mercator.{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $1B9,$D	; Run text script at offset 0x027C8C
					; 0xE186: PRINT	MSG 0x01D4, MSGBOX CLEARED, END: "{6A}C'est incroyable!{66}J'ai perdu 1000 Ors sur{66}cette course de poulets!!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00AE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1BA,$1	; Run text script at offset 0x027C8E
					; 0xE187: PRINT	MSG 0x01D5, MSGBOX CLEARED, END: "{6A}On n'a que rarement le{66}droit d'entrer dans le château{6D}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $1BB,$3	; Run text script at offset 0x027C90
					; 0xE188: PRINT	MSG 0x01D6, MSGBOX CLEARED, END: "{6A}Actuellement, le duc{66}embauche les meilleurs{66}mercenaires.{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $1BC,$5	; Run text script at offset 0x027C92
					; 0xE189: PRINT	MSG 0x01D7, MSGBOX CLEARED, END: "{6A}On vous a	invité au{66}château?  C'est que vous{66}devez être un costaud!{71}{6A}Je peux avoir{66}votre autographe?{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0013:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1BD,$1	; Run text script at offset 0x027C94
					; 0xE18A: PRINT	MSG 0x01D8, MSGBOX CLEARED, END: "{6A}Ne me dérangez{66}surtout	pas!  Je dois me{66}concentrer absolument...{6D}"
					;
		dc.w $D			; Params 00, 0D
		ScriptID    $1BE,$3	; Run text script at offset 0x027C96
					; 0x7C3D: LOAD CUSTOM ACTION 0x3D (0x1000000F3 CSA_003D), MSGBOX CLEARED, END
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $1BF,$5	; Run text script at offset 0x027C98
					; 0xE18B: PRINT	MSG 0x01D9, MSGBOX CLEARED, END: "{6A}Qu'avez-vous?{66}Allez!  Ouvrez la porte et{66}entrez!{6D}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $1C0,$7	; Run text script at offset 0x027C9A
					; 0xE18C: PRINT	MSG 0x01DA, MSGBOX CLEARED, END: "{6A}C'était comment?{66}Pas comme vous{66}l'imaginiez, pas vrai,{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $1C1,$9	; Run text script at offset 0x027C9C
					; 0xE18D: PRINT	MSG 0x01DB, MSGBOX CLEARED, END: "{6A}J'ai dit qu'on ne doit{66}pas me déranger!{66}Hammana, hammena, hammina...{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptJump  CS_0013_0,$B ; Jump	to address 0x026666
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1C6,$D	; Run text script at offset 0x027CA6
					; 0xE190: PRINT	MSG 0x01DE, MSGBOX CLEARED, END: "{6A}Je vous prie de ne pas{66}me déranger, sinon je serai {66}forcé de vous transformer{71}{6A}en chien!{66}Bon...  Où en étais-je?...{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0013_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $132		; Bit 2	of flag	0x026
		ScriptID    $1C4,$1	; Flag set:   Run text script at offset	0x027CA2
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE18F: PRINT	MSG 0x01DD, MSGBOX CLEARED, END: "{6A}Vous avez	la {6E}!{66}Ma boule de	cristal{66}ne ment jamais...{6D}"
		ScriptID    $1C2,$2	; Flag clear: Run text script at offset	0x027C9E
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE18E: PRINT	MSG 0x01DC, MSGBOX CLEARED, END: "{6A}La {6E}!	Je la vois!{66}Allez le	chercher!{71}{6A}Ainsi le phare{66}marchera de nouveau!{71}{6A}Je vous crois assez{66}malin pour traverser{66}Le Labyrinthe Vert tout seul.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00AF:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1C7,$1	; Run text script at offset 0x027CA8
					; 0xE191: PRINT	MSG 0x01DF, MSGBOX CLEARED, END: "{6A}Je veux retrouver{66}ma jeunesse!{6D}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $1C8,$3	; Run text script at offset 0x027CAA
					; 0xE192: PRINT	MSG 0x01E0, MSGBOX CLEARED, END: "{6A}Bonjour, beau gosse!{66}Suis-je mignonne?{66}Suis-je jeune?  La-la-la!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1C9,$1	; Run text script at offset 0x027CAC
					; 0xE193: PRINT	MSG 0x01E1, MSGBOX CLEARED, END: "{6A}Si maman retrouve	sa{66}jeunesse,	j'en serai pas{66}mal fier!{6D}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $1CA,$3	; Run text script at offset 0x027CAE
					; 0xE194: PRINT	MSG 0x01E2, MSGBOX CLEARED, END: "{6A}Ca me fait plaisir{66}de voir maman si jeune, mais..{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1CB,$1	; Run text script at offset 0x027CB0
					; 0xE195: PRINT	MSG 0x01E3, MSGBOX CLEARED, END: "{6A}Il y a peu de monstres{66}sur cette île.Ca rapporte bien{66}sur le continent.{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1CC,$3	; Run text script at offset 0x027CB2
					; 0xE196: PRINT	MSG 0x01E4, MSGBOX CLEARED, END: "{6A}J'ai touché une{66}montagne d'Ors pour les{66}monstres.  Je vais à la{71}{6A}Maison de Jeu{66}de Petit Pois.{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $1CD,$5	; Run text script at offset 0x027CB4
					; 0xE197: PRINT	MSG 0x01E5, MSGBOX CLEARED, END: "{6A}J'ai arrêté les trois{66}bandits les plus recherchés{66}de cette île!  Je vais toucher{71}{6A}un bon paquet!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B2:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1CE,$0	; Run text script at offset 0x027CB6
					; 0x1BEE: LOAD SPECIAL CHARACTER * (0x06)
					; 0xE198: PRINT	MSG 0x01E6, MSGBOX CLEARED, END: "{6A}...  Grrrrr...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B3:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1D0,$0	; Run text script at offset 0x027CBA
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0xE199: PRINT	MSG 0x01E7, MSGBOX CLEARED, END: "{6A}....whooooOOOOOoooo!!!..{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B4:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1D2,$0	; Run text script at offset 0x027CBE
					; 0x1BEE: LOAD SPECIAL CHARACTER * (0x06)
					; 0xE19A: PRINT	MSG 0x01E8, MSGBOX CLEARED, END: "{6A}YAAAARRRG!!....{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B5:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1D4,$0	; Run text script at offset 0x027CC2
					; 0x1BEF: LOAD SPECIAL CHARACTER * (0x07)
					; 0xE19B: PRINT	MSG 0x01E9, MSGBOX CLEARED, END: "{6A}Hissssssss!!!.....{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00B6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1D6,$1	; Run text script at offset 0x027CC6
					; 0xE19C: PRINT	MSG 0x01EA, MSGBOX CLEARED, END: "{6A}Le duc de	Mercator{66}est	un homme bien.	Si nous{66}vivons si bien, c'est grâce{71}{6A}à lui.  Vive Mercator!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1D7,$3	; Run text script at offset 0x027CC8
					; 0xE19D: PRINT	MSG 0x01EB, MSGBOX CLEARED, END: "{6A}C-comment?...{66}le duc de Mercator nous a{66}abandonné?	Impossible!{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $1D8,$5	; Run text script at offset 0x027CCA
					; 0xE19E: PRINT	MSG 0x01EC, MSGBOX CLEARED, END: "{6A}Vive le Général Arthur!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1D9,$1	; Run text script at offset 0x027CCC
					; 0xE19F: PRINT	MSG 0x01ED, MSGBOX CLEARED, END: "{6A}On dit qu'un sorcier{66}qui vit vers le sud pose de{66}gros problèmes au duc.{71}{6A}Il doit se servir de{66}ses pouvoirs pour extorquer{66}de l'argent au duc.{71}{6A}Voilà pourquoi on{66}est si lourdement imposé!{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $1DA,$3	; Run text script at offset 0x027CCE
					; 0xE1A0: PRINT	MSG 0x01EE, MSGBOX CLEARED, END: "{6A}Vous avez	battu Mir?{66}Alors, pourquoi être triste?{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1DB,$5	; Run text script at offset 0x027CD0
					; 0xE1A1: PRINT	MSG 0x01EF, MSGBOX CLEARED, END: "{6A}Que deviendrons-nous{66}sans le duc de Mercator?{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $1DC,$7	; Run text script at offset 0x027CD2
					; 0xE1A2: PRINT	MSG 0x01F0, MSGBOX CLEARED, END: "{6A}Le Général Arthur	a{66}baissé les	impôts.{66}C'est un type bien!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1DD,$1	; Run text script at offset 0x027CD4
					; 0xE1A3: PRINT	MSG 0x01F1, MSGBOX CLEARED, END: "{6A}Bienvenue	chez Ludwig.{66}Si c'est pour une leçon{66}de musique,{71}{6A}Monsieur Ludwig{66}est sorti...{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $1DE,$3	; Run text script at offset 0x027CD6
					; 0xE1A4: PRINT	MSG 0x01F2, MSGBOX CLEARED, END: "{6A}Ludwig n'est pas là!{66}Et il ne sera pas de retour{66}avant un bon bout de temps.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00B9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1DF,$1	; Run text script at offset 0x027CD8
					; 0xE1A5: PRINT	MSG 0x01F3, MSGBOX CLEARED, END: "{6A}Vous venez pour{66}l'écouter jouer, vous aussi?{66}J'ai fait le voyage depuis le{71}{6A}continent, pour l'entendre.{66}Où est-il?{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $1E0,$3	; Run text script at offset 0x027CDA
					; 0xE1A6: PRINT	MSG 0x01F4, MSGBOX CLEARED, END: "{6A}Dommage!	J'aurais{66}tant aimé entendre ces sons{66}que lui seul sait produire!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1E1,$5	; Run text script at offset 0x027CDC
					; 0xE1A7: PRINT	MSG 0x01F5, MSGBOX CLEARED, END: "{6A}Je retourne sur le{66}continent.	Inutile	d'attendre{66}plus longtemps{71}{6A}ce Ludwig.{66}Comment?  Le phare{66}est en panne?{71}{6A}Zut et zut!  C'est{66}pas de chance!!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1E2,$7	; Run text script at offset 0x027CDE
					; 0xE1A8: PRINT	MSG 0x01F6, MSGBOX CLEARED, END: "{6A}Je rentre	chez moi.{66}Jamais je ne l'entendrai!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0014:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1E3,$0	; Run text script at offset 0x027CE0
					; 0xE1A9: PRINT	MSG 0x01F7, MSGBOX CLEARED, END: "{6A}Dépêchons!{66}Approchez!{66}Il ne	m'en reste plus beaucoup!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00BA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1E4,$1	; Run text script at offset 0x027CE2
					; 0xE1AA: PRINT	MSG 0x01F8, MSGBOX CLEARED, END: "{6A}Il n'y a pas moins cher!{66}Les prix sont au plus bas!{66}Tous les jours!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $1E5,$3	; Run text script at offset 0x027CE4
					; 0xE1AB: PRINT	MSG 0x01F9, MSGBOX CLEARED, END: "{6A}Cette boutique est{66}connue, même sur le	continent.{66}Tous mes amis m'ont demandé{71}{6A}de leur acheter quelque{66}chose.  J'ai une énorme liste!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00BB:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1E6,$0	; Run text script at offset 0x027CE6
					; 0xE1AC: PRINT	MSG 0x01FA, MSGBOX CLEARED, END: "{6A}Il y a toujours foule{66}dans cette boutique, car{66}elle	est moins chère	que{71}{6A}l'autre là-bas.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00BC:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1E7,$0	; Run text script at offset 0x027CE8
					; 0xE1AD: PRINT	MSG 0x01FB, MSGBOX CLEARED, END: "{6A}Quel idiot!{66}J'en ai acheté trop!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0015:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1E8,$1	; Run text script at offset 0x027CEA
					; 0xE1AE: PRINT	MSG 0x01FC, MSGBOX CLEARED, END: "{6A}Si vous n'êtes pas{66}membre, allez-vous en!{6D}"
					;
		dc.w $C			; Params 00, 0C
		ScriptID    $1E9,$3	; Run text script at offset 0x027CEC
					; 0xE1AF: PRINT	MSG 0x01FD, MSGBOX CLEARED, END: "{6A}Encore vous!{66}Que les membres, j'ai dit!{66}De l'air!{6D}"
					;
		dc.w $E			; Params 00, 0E
		ScriptJump  CS_0015_0,$5 ; Jump	to address 0x02673A
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $1EC,$7	; Run text script at offset 0x027CF2
					; 0xE1B1: PRINT	MSG 0x01FF, MSGBOX CLEARED, END: "{6A}Quelle tête de mule!{66}Je vais me facher, moi!{66}Hors de ma vue!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0015_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $1A		; Bit 2	of flag	0x003
		ScriptID    $1EB,$1	; Flag set:   Run text script at offset	0x027CF0
					; 0xE1B0: PRINT	MSG 0x01FE, MSGBOX CLEARED, END: "{6A}Je vous en prie...{66}Montez!{6D}"
		ScriptID    $1EA,$2	; Flag clear: Run text script at offset	0x027CEE
					; 0x7C3E: LOAD CUSTOM ACTION 0x3E (0x1000000F7 CSA_003E), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0016:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_0016_0,$1 ; Jump	to address 0x02675C
					;
		dc.w $C			; Params 00, 0C
		ScriptJump  CS_0016_3,$3 ; Jump	to address 0x026774
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $1F0,$5	; Run text script at offset 0x027CFA
					; 0xE1B4: PRINT	MSG 0x0202, MSGBOX CLEARED, END: "{6A}Bonjour, Mosieur.{66}Pour	devenir	membre chez{66}Madame Yard, adressez-vous{71}{6A}au comptoir.{6D}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $1F1,$7	; Run text script at offset 0x027CFC
					; 0xE1B5: PRINT	MSG 0x0203, MSGBOX CLEARED, END: "{6A}Dites bonjour à{66}Mademoiselle Tout Petit...{66}Euh, je veux dire Friday!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0016_0:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1ED,$0	; Run text script at offset 0x027CF4
					; 0x14C6: SET BIT 6 OF FLAG 0x018
					; 0xE1B2: PRINT	MSG 0x0200, MSGBOX CLEARED, END: "{6A}Vous êtes	trop jeune{66}pour entrer chez Madame{66}Yard, je regrette.{71}{6A}Revenez dans{66}quelques années.{6D}"
; ---------------------------------------------------------------------------
		move.w	#$C8,d0	; '╚'

CS_0016_1:				; CODE XREF: ROM:00026C26j
		bsr.w	TestFlagBit
		beq.s	CS_0016_2
		move.w	#$2C,d0	; ','
		bsr.w	SetFlagBit

CS_0016_2:				; CODE XREF: ROM:00026768j
		rts
; ---------------------------------------------------------------------------

CS_0016_3:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $1E		; Bit 6	of flag	0x003
		ScriptID    $1F1,$1	; Flag set:   Run text script at offset	0x027CFC
					; 0xE1B5: PRINT	MSG 0x0203, MSGBOX CLEARED, END: "{6A}Dites bonjour à{66}Mademoiselle Tout Petit...{66}Euh, je veux dire Friday!{6D}"
		ScriptID    $1EF,$2	; Flag clear: Run text script at offset	0x027CF8
					; 0xE1B3: PRINT	MSG 0x0201, MSGBOX CLEARED, END: "{6A}Quel curieux!{66}Vous savez, la curiosité{66}est une grande qualité!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0017:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1F2,$1	; Run text script at offset 0x027CFE
					; 0xE1B6: PRINT	MSG 0x0204, MSGBOX CLEARED, END: "{6A}Seuls les	membres{66}peuvent monter.  Je regrette.{6D}"
					;
		dc.w $C			; Params 00, 0C
		ScriptID    $1F3,$3	; Run text script at offset 0x027D00
					; 0x142E: SET BIT 6 OF FLAG 0x005
					; 0xE1B7: PRINT	MSG 0x0205, MSGBOX CLEARED, END: "{6A}Ecoutez bien.{66}Voici une ruse que les{66}jeunes	garçons	aiment bien...{71}{6A}Allez voir la diseuse de{66}bonne	aventure.  Vous	aurez{66}une bonne surprise!{6D}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $1F5,$5	; Run text script at offset 0x027D04
					; 0xE1B8: PRINT	MSG 0x0206, MSGBOX CLEARED, END: "{6A}Bienvenue	chez{66}Madame Yard.  C'est elle,{66}la meilleure!{6D}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $1F6,$7	; Run text script at offset 0x027D06
					; 0xE1B9: PRINT	MSG 0x0207, MSGBOX CLEARED, END: "{6A}Les difficultés{66}forgent le caractère!{71}{6A}Il n'y a vraiment pas{66}de solutions faciles!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00BD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $1F7,$1	; Run text script at offset 0x027D08
					; 0xE1BA: PRINT	MSG 0x0208, MSGBOX CLEARED, END: "{6A}Un peu cher, mais{66}je me sens bien mieux!  Je{66}dois rentrer chez moi et...{71}{6A}mettre en pratique{66}ce que j'ai appris...{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $1F8,$3	; Run text script at offset 0x027D0A
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE1BB: PRINT	MSG 0x0209, MSGBOX CLEARED, END: "{6A}Le duc de	Mercator lui{66}a proposé six Ors à condition{66}qu'il vole la {6E}!  Six!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $1FA,$5	; Run text script at offset 0x027D0E
					; 0xE1BC: PRINT	MSG 0x020A, MSGBOX CLEARED, END: "{6A}Ma pauvre	machoire!{66}j'ai trop parlé.{6D}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $1FB,$7	; Run text script at offset 0x027D10
					; 0xE1BD: PRINT	MSG 0x020B, MSGBOX CLEARED, END: "{6A}Je veux qu'ils baissent{66}nos impôts!{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $1FC,$9	; Run text script at offset 0x027D12
					; 0xE1BE: PRINT	MSG 0x020C, MSGBOX CLEARED, END: "{6A}Mon jeu préféré, c'est{66}la roulette!  Allons gagner{66}beaucoup d'Ors!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00BE:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1FD,$0	; Run text script at offset 0x027D14
					; 0xE1BF: PRINT	MSG 0x020D, MSGBOX CLEARED, END: "{6A}Moi?  Oui, je suis{66}membre, mais je ne porte pas{66}de tutu en dehors du travail.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00BF:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $1FE,$0	; Run text script at offset 0x027D16
					; 0xE1C0: PRINT	MSG 0x020E, MSGBOX CLEARED, END: "{6A}Ca fait une semaine que{66}j'attends une séance avec{66}Madame Yard!{71}{6A}Si seulement je{66}pouvais venir plus souvent...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_00C0_0,$1 ; Jump	to address 0x0267D6
					;
		dc.w $101		; Params 01, 01
		ScriptJump  CS_00C0_1,$3 ; Jump	to address 0x0267E2
					;
		dc.w $102		; Params 01, 02
		ScriptID    $20D,$5	; Run text script at offset 0x027D34
					; 0xE1CB: PRINT	MSG 0x0219, MSGBOX CLEARED, END: "{6A}Vous avez	été au marché?{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_00C0_8,$7 ; Jump	to address 0x02682A
					;
		dc.w $103		; Params 01, 03
		ScriptJump  CS_00C0_7,$9 ; Jump	to address 0x02681E
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C0_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C7		; Bit 7	of flag	0x018
		ScriptID    $1FF,$1	; Flag clear: Run text script at offset	0x027D18
					; 0xE1C1: PRINT	MSG 0x020F, MSGBOX CLEARED, END: "{6A}...  Soupir...{66}Comme vous le voyez,{66}Le magasin est fermé...{71}{6A}Vous savez qu'il{66}y en a un autre, juste en{66}face.  Ils vendent les mêmes{71}{6A}articles que moi...{66}
					;                                                 seulement, eux, ils les{66}vendent pour  moins cher!{71}{6A}Je pense changer de{66}métier, mais quel genre de{66}boutique me conviendrait?{71}{6A}Ah la la...  Des fois, je{66}me sens si minable que je n'ai{66}même pas envie de me lever!{6D}"
		ScriptID    $200,$2	; Flag set:   Run text script at offset	0x027D1A
					; 0xE1C2: PRINT	MSG 0x0210, MSGBOX CLEARED, END: "{6A}Je voudrait ouvrir un{66}nouveau magasin...  Soupir...{66}Que faire?...  Ah la la...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C0_1:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $201,$0	; Run text script at offset 0x027D1C
					; 0xA1C3: PRINT	MSG 0x0211, END: "{6A}Ryle!  Comment ça	va?{66}Je pense	refaire	ma vie,	vous{66}savez...  tourner la page.{71}{6A}J'ai pris ma décision.{66}Je vais changer{66}de métier!  Et j'aimerais{71}{6A}que vous me donniez{66}votre avis.  D'accord?{67}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcs.s	CS_00C0_2
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $202,$0	; Run text script at offset 0x027D1E
					; 0xE1C4: PRINT	MSG 0x0212, MSGBOX CLEARED, END: "{6A}Oui, oui,	je sais	bien.{66}Vous avez un tas de choses{66}à faire.	 Revenez plus tard!{6D}"
; ---------------------------------------------------------------------------
		bra.s	CS_00C0_6
; ---------------------------------------------------------------------------

CS_00C0_2:				; CODE XREF: ROM:000267EAj
					; ROM:00026816j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $203,$0	; Run text script at offset 0x027D20
					; 0xA1C5: PRINT	MSG 0x0213, END: "{6A}Que diriez-vous d'un{66}drugstore?{67}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	CS_00C0_3
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $206,$0	; Run text script at offset 0x027D26
					; 0x1553: SET BIT 3 OF FLAG 0x02A
					; 0xA1C8: PRINT	MSG 0x0216, END: "{6A}Vous êtes	d'accord!  Bien!{66}Me voilà voué à une{66}carrière de drugstoriste!{71}"
; ---------------------------------------------------------------------------
		bra.s	CS_00C0_5
; ---------------------------------------------------------------------------

CS_00C0_3:				; CODE XREF: ROM:000267FAj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $204,$0	; Run text script at offset 0x027D22
					; 0xA1C6: PRINT	MSG 0x0214, END: "{6A}Hmm...  Très bien.  Et si{66}j'ouvrais un magasin général?{67}"
; ---------------------------------------------------------------------------
		bsr.w	GetYesNoAnswer
		bcc.s	CS_00C0_4
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $208,$0	; Run text script at offset 0x027D2A
					; 0xA1C9: PRINT	MSG 0x0217, END: "{6A}Vous êtes	d'accord?{66}Je suis donc propriétaire{66}d'un magasin général!{71}"
; ---------------------------------------------------------------------------
		bra.s	CS_00C0_5
; ---------------------------------------------------------------------------

CS_00C0_4:				; CODE XREF: ROM:0002680Aj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $205,$0	; Run text script at offset 0x027D24
					; 0xA1C7: PRINT	MSG 0x0215, END: "{6A}Mes choix	se précisent...{66}Il y	a 2 possibilités, mais je{66}n'arrive pas à me décider...{71}{6A}Faites le choix, vous.{66}Je suivrai votre conseil.{71}{6A}Bon, essayons encore!{71}"
; ---------------------------------------------------------------------------
		bra.s	CS_00C0_2
; ---------------------------------------------------------------------------

CS_00C0_5:				; CODE XREF: ROM:00026800j
					; ROM:00026810j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $209,$0	; Run text script at offset 0x027D2C
					; 0x1552: SET BIT 2 OF FLAG 0x02A
					; 0x81CA: PRINT	MSG 0x0218: "{6A}A propos, pouvez-vous{66}me rendre un petit service?{66}Il s'agit d'aller au marché{71}{6A}de gros à l'entrepôt du{66}port de Mercator.  Il s'ouvre{66}chaque fois que le navire{71}{6A}vient du continent.  Si{66}vous voulez bien vous y rendre{66}et chercher mes marchandises.{71}{6A}Moi, je reste ici pour{66}tout préparer.  Prenez ceci...{66}C'est une carte de membre{71}{6A}de la Guilde des Acheteurs.{71}"
					; 0x0019: LOAD 0x0019 INTO 0xFF1196 (Carte{79}Acheteur)
					; 0x77E8: RECEIVE ITEM [0xFF1196], MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

CS_00C0_6:				; CODE XREF: ROM:000267F0j
		rts
; ---------------------------------------------------------------------------

CS_00C0_7:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DD		; Bit 5	of flag	0x01B
		ScriptID    $20E,$1	; Flag clear: Run text script at offset	0x027D36
					; 0xE1CC: PRINT	MSG 0x021A, MSGBOX CLEARED, END: "{6A}J'ai eu les marchandises{66}et je m'en sors assez bien!{71}{6A}Mon nouveau magasin{66}me convient, c'est un grand{66}tournant dans ma vie!{71}{6A}Et c'est grâce à vous!{71}{6A}Chez moi, vous paierez{66}toujours le prix le plus bas!{71}{6A}Passez quand vous{66}le voulez!{6D}"
		ScriptID    $20F,$2	; Flag set:   Run text script at offset	0x027D38
					; 0xE1CD: PRINT	MSG 0x021B, MSGBOX CLEARED, END: "{6A}Nous avons beaucoup{66}de	choses intéressantes!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C0_8:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $152		; Bit 2	of flag	0x02A
		ScriptID    $210,$1	; Flag set:   Run text script at offset	0x027D3A
					; 0xE1CE: PRINT	MSG 0x021C, MSGBOX CLEARED, END: "{6A}Le marché	était déjà{66}fermé?  Ce n'est pas bien grave{66}Vous avez fait de votre mieux.{71}{6A}Je vais tout mettre en{66}ordre, puis j'irai au marché{66}moi-même, le mois prochain.{6D}"
		ScriptJump  CS_00C0_0,$2 ; Flag	clear: Jump to address 0x0367D6
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $211,$1	; Run text script at offset 0x027D3C
					; 0xE1CF: PRINT	MSG 0x021D, MSGBOX CLEARED, END: "{6A}Papa aurait dû vérifier{66}en ville, avant d'ouvrir{66}ce magasin...{6D}"
					;
		dc.w $101		; Params 01, 01
		ScriptID    $212,$3	; Run text script at offset 0x027D3E
					; 0xE1D0: PRINT	MSG 0x021E, MSGBOX CLEARED, END: "{6A}Mon père pense{66}changer	de métier.{6D}"
					;
		dc.w $102		; Params 01, 02
		ScriptJump  CS_00C1_0,$5 ; Jump	to address 0x026850
					;
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_00C1_1,$7 ; Jump	to address 0x02685C
					;
		dc.w $103		; Params 01, 03
		ScriptID    $215,$9	; Run text script at offset 0x027D44
					; 0xE1D3: PRINT	MSG 0x0221, MSGBOX CLEARED, END: "{6A}Papa est de nouveau dans{66}le coup, et je le surveille!{66}On va	finir par ouvrir{71}{6A}une chaîne de magasins!!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C1_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $153		; Bit 3	of flag	0x02A
		ScriptID    $213,$1	; Flag set:   Run text script at offset	0x027D40
					; 0xE1D1: PRINT	MSG 0x021F, MSGBOX CLEARED, END: "{6A}A	partir de maintenant,{66}je suis fils de propriétaire{66}de drugstore!	Quelle classe!{6D}"
		ScriptID    $214,$2	; Flag clear: Run text script at offset	0x027D42
					; 0xE1D2: PRINT	MSG 0x0220, MSGBOX CLEARED, END: "{6A}A	partir de maintenant,{66}je suis fils de propriétaire{66}de magasin général!  Super!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C1_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $152		; Bit 2	of flag	0x02A
		ScriptID    $215,$1	; Flag set:   Run text script at offset	0x027D44
					; 0xE1D3: PRINT	MSG 0x0221, MSGBOX CLEARED, END: "{6A}Papa est de nouveau dans{66}le coup, et je le surveille!{66}On va	finir par ouvrir{71}{6A}une chaîne de magasins!!{6D}"
		ScriptID    $211,$2	; Flag clear: Run text script at offset	0x027D3C
					; 0xE1CF: PRINT	MSG 0x021D, MSGBOX CLEARED, END: "{6A}Papa aurait dû vérifier{66}en ville, avant d'ouvrir{66}ce magasin...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0018:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $E4		; Bit 4	of flag	0x01C
		ScriptID    $4B2,$1	; Flag set:   Run text script at offset	0x02827E
					; 0x1BF6: LOAD SPECIAL CHARACTER Fahl (0x0E)
					; 0xE3D2: PRINT	MSG 0x0420, MSGBOX CLEARED, END: "{6A}Incroyable!  Un gamin...{66}Il n'y a plus de valeurs...{6D}"
		ScriptID    $216,$2	; Flag clear: Run text script at offset	0x027D46
					; 0x7C30: LOAD CUSTOM ACTION 0x30 (0x1000000BF CSA_0030), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C2:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $218,$1	; Run text script at offset 0x027D4A
					; 0xE1D5: PRINT	MSG 0x0223, MSGBOX CLEARED, END: "{6A}C'est un peu gênant!{66}Mon fils fréquente la maison{66}de Madame...  Yard quasi{71}{6A}quotidiennement!  Je n'en{66}comprends pas la raison...  {66}C'est si amusant comme lieu?{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $219,$3	; Run text script at offset 0x027D4C
					; 0xE1D6: PRINT	MSG 0x0224, MSGBOX CLEARED, END: "{6A}Mir habite cette vieille{66}tour,	mais on	dit qu'il était{66}en ville bien avant le duc.{71}{6A}Il paraît que le duc l'a{66}chassé de Mercator à cause{66}d'un crime immonde!{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $21A,$5	; Run text script at offset 0x027D4E
					; 0xE1D7: PRINT	MSG 0x0225, MSGBOX CLEARED, END: "{6A}Mir habite cette vieille{66}tour,	mais on	dit qu'il était{66}en ville bien avant le duc.{71}{6A}Il paraît que le duc l'a{66}chassé de Mercator à cause{66}d'un crime immonde!{71}{6A}Je ne sais pas si c'est{66}la vérité.  Je me contente de{66}répéter les dires d'un ami.{71}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $21B,$7	; Run text script at offset 0x027D50
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE1D8: PRINT	MSG 0x0226, MSGBOX CLEARED, END: "{6A}La {6E} est{66}un	précieux minerai,{71}{6A}qu'on ne trouve qu'au{66}coeur du Le Labyrinthe Vert.{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $21D,$9	; Run text script at offset 0x027D54
					; 0xE1D9: PRINT	MSG 0x0227, MSGBOX CLEARED, END: "{6A}Je n'ai pas du tout{66}de nouvelles de ma famille à{66}Verla depuis un certain temps.{6D}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $21E,$B	; Run text script at offset 0x027D56
					; 0xE1DA: PRINT	MSG 0x0228, MSGBOX CLEARED, END: "{6A}On dit que le duc	de{66}Mercator n'a provoqué que{66}des malheurs à Verla aussi.{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $21F,$D	; Run text script at offset 0x027D58
					; 0xE1DB: PRINT	MSG 0x0229, MSGBOX CLEARED, END: "{6A}Si le Général Arthur{66}avait trouvé la mort,{71}{6A}Mercator ne serait{66}plus qu'une ville fantôme!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C3:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $220,$1	; Run text script at offset 0x027D5A
					; 0xE1DC: PRINT	MSG 0x022A, MSGBOX CLEARED, END: "{6A}Je ne suis pas d'accord{66}avec lui.  Je trouve que c'est{66}charmant chez Madame Yard.{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $221,$3	; Run text script at offset 0x027D5C
					; 0xE1DD: PRINT	MSG 0x022B, MSGBOX CLEARED, END: "{6A}Pas moyen	de pénétrer{66}dans la tour de Mir, à cause{66}de la barrière à	la porte...{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $222,$5	; Run text script at offset 0x027D5E
					; 0xE1DE: PRINT	MSG 0x022C, MSGBOX CLEARED, END: "{6A}...  Ah, c'est vous...{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $223,$7	; Run text script at offset 0x027D60
					; 0xE1DF: PRINT	MSG 0x022D, MSGBOX CLEARED, END: "{6A}Le Labyrinthe Vert est au	nord du{66}château.  Nombre de touristes{66}n'en sont jamais revenus!{71}{6A}Le duc a donc pris la{66}décision d'interdire à tous{66}de pénétrer dans Le Labyrinthe Vert!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $224,$9	; Run text script at offset 0x027D62
					; 0xE1E0: PRINT	MSG 0x022E, MSGBOX CLEARED, END: "{6A}Le duc de	Mercator ferait{66}n'importe quoi pour avoir ces{66}trésors.  Sont-ils si fabuleux?{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $225,$B	; Run text script at offset 0x027D64
					; 0xE1E1: PRINT	MSG 0x022F, MSGBOX CLEARED, END: "{6A}Le gouvernement du{66}Général Arthur me convient.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C4:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $226,$1	; Run text script at offset 0x027D66
					; 0xE1E2: PRINT	MSG 0x0230, MSGBOX CLEARED, END: "{6A}J'ai vu une fille superbe{66}qui descendait la rue.  Ses{66}deux serviteurs étaient...{71}{6A}Vous ne devinerez{66}jamais...C'était des monstres!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $227,$3	; Run text script at offset 0x027D68
					; 0xE1E3: PRINT	MSG 0x0231, MSGBOX CLEARED, END: "{6A}Allez-vous battre	le{66}magicien de la tour?{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $228,$5	; Run text script at offset 0x027D6A
					; 0xE1E4: PRINT	MSG 0x0232, MSGBOX CLEARED, END: "{6A}Waou!!{66}Vous en	êtes sorti vivant!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $229,$7	; Run text script at offset 0x027D6C
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE1E5: PRINT	MSG 0x0233, MSGBOX CLEARED, END: "{6A}Mais il n'y a pas de{66}phare sans la {6E}!{66}Qui commettrait un tel acte?{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $22B,$9	; Run text script at offset 0x027D70
					; 0xE1E6: PRINT	MSG 0x0234, MSGBOX CLEARED, END: "{6A}Si on pouvait de{66}nouveau emprunter le tunnel{66}entre Verla et	Mercator, alors{71}{6A}Verla serait tout proche.{66}Mais il a été bloqué lors d'un{66}récent tremblement de terre.{71}{6A}On ne peut aller à Verla{66}que par la mer à présent...{6D}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $22C,$B	; Run text script at offset 0x027D72
					; 0xE1E7: PRINT	MSG 0x0235, MSGBOX CLEARED, END: "{6A}Quelqu'un de ma{66}famille tient un commerce{66}à Verla.{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $22D,$D	; Run text script at offset 0x027D74
					; 0xE1E8: PRINT	MSG 0x0236, MSGBOX CLEARED, END: "{6A}Le Général Arthur	a lutté{66}contre le duc jusqu'à la fin.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0019:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $22E,$1	; Run text script at offset 0x027D76
					; 0xE1E9: PRINT	MSG 0x0237, MSGBOX CLEARED, END: "{6A}Voulez-vous une boisson{66}fruitée?  Un délice au	dahl?{71}{6A}Soyez différent,{66}pensez	Dahl!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $22F,$3	; Run text script at offset 0x027D78
					; 0xE1EA: PRINT	MSG 0x0238, MSGBOX CLEARED, END: "{6A}Le duc de	Mercator{66}embauche des mercenaires{66}pour lancer une	attaque	contre{71}{6A}Mir.  Ils	fêtent la{66}victoire avec un peu d'avance!{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $230,$5	; Run text script at offset 0x027D7A
					; 0xE1EB: PRINT	MSG 0x0239, MSGBOX CLEARED, END: "{6A}Ryle!{66}Vous avez vraiment battu	Mir?{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $231,$7	; Run text script at offset 0x027D7C
					; 0xE1EC: PRINT	MSG 0x023A, MSGBOX CLEARED, END: "{6A}Le duc de	Mercator a{66}abandonné	la ville.  Quelle{71}{6A}surprise!  Que	faire?{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  CS_0019_0,$9 ; Jump	to address 0x0268F0
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0019_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $14A		; Bit 2	of flag	0x029
		ScriptID    $778,$1	; Flag set:   Run text script at offset	0x02880A
					; 0x1819: LOAD CHARACTER SCRIPT	Marchand (0x0019)
					; 0xE53E: PRINT	MSG 0x058C, MSGBOX CLEARED, END: "{6A}Désolé, l'appareil doit{66}être en panne!{66}Ha ha ha!{6D}"
		ScriptID    $232,$2	; Flag clear: Run text script at offset	0x027D7E
					; 0xE1ED: PRINT	MSG 0x023B, MSGBOX CLEARED, END: "{6A}J'ai tout refait{66}Vous pouvez commander d'en{66}haut sans quitter votre lit!{71}{6A}Montez à l'étage et{66}commandez quelque chose.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_001A_0,$1 ; Jump	to address 0x02690A
					;
		dc.w $14		; Params 00, 14
		ScriptID    $236,$3	; Run text script at offset 0x027D86
					; 0xE1F1: PRINT	MSG 0x023F, MSGBOX CLEARED, END: "{6A}Je ne me sentais{66}pas bien, je suis donc sorti.{66}La princesse	Lara?  Elle est..{71}{6A}particulière, je dirais.{66}En	fait, c'est quelqu'un de...{66}difficile, pourrait-on dire.{71}{6A}Il se peut que son{66}caractère ait irrité le duc au{66}point de le persuader de la{71}renvoyer chez elle.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001A_0:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $233,$0	; Run text script at offset 0x027D80
					; 0xA1EE: PRINT	MSG 0x023C, END: "{6A}Où est-elle?...  Soupir!{66}..  Où peut-elle bien	être?...{66}Oh,	vous êtes un touriste?{71}{6A}Vous voulez connaitre{66}mon histoire?{67}"
; ---------------------------------------------------------------------------

CS_001A_1:				; CODE XREF: ROM:0002691Ej
		bsr.w	GetYesNoAnswer
		bcc.s	CS_001A_2
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $234,$0	; Run text script at offset 0x027D82
					; 0xE1EF: PRINT	MSG 0x023D, MSGBOX CLEARED, END: "{6A}je suis Ludwig,{66}naturellement.	 Le compositeur{66}venu	du continent.{71}{6A}La	princesse Lara{66}étudiait ici avec moi, mais{71}{6A}elle a disparu!  Comme ça!{66}Mes leçons n'ont pas dû lui{66}convenir, voyez-vous.{71}{6A}Elle aurait pu dire un{66}mot d'adieu en partant...{66}Quelle ravissante créature!{6D}"
; ---------------------------------------------------------------------------
		bra.s	CS_001A_3
; ---------------------------------------------------------------------------

CS_001A_2:				; CODE XREF: ROM:00026912j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $235,$0	; Run text script at offset 0x027D84
					; 0xA1F0: PRINT	MSG 0x023E, END: "{6A}Faites moi le plaisir{66}d'écouter...{67}"
; ---------------------------------------------------------------------------
		bra.s	CS_001A_1
; ---------------------------------------------------------------------------

CS_001A_3:				; CODE XREF: ROM:00026918j
		rts
; ---------------------------------------------------------------------------

CS_00C5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $237,$1	; Run text script at offset 0x027D88
					; 0xE1F2: PRINT	MSG 0x0240, MSGBOX CLEARED, END: "{6A}Ce Ludwig, il est	si mou!{66}Je parie qu'il est amoureux de{66}la petite princesse!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $238,$3	; Run text script at offset 0x027D8A
					; 0xE1F3: PRINT	MSG 0x0241, MSGBOX CLEARED, END: "{6A}Ludwig?  En rentrant du{66}château, il a bu 6 Dahl Light!{71}{6A}Six!  Puis il est devenu{66}un peu turbulent, alors j'ai{66}dû le faire expulser.{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $239,$5	; Run text script at offset 0x027D8C
					; 0xE1F4: PRINT	MSG 0x0242, MSGBOX CLEARED, END: "{6A}Comme il est susceptible,{66}ce Ludwig!  Il est devenu blême{66}quand je lui ai dit de partir.{71}{6A}Il a dû se cacher{66}quelque part, pour bouder!{71}{6A}Ah, ces artistes!{66}Jamais je n'arriverai à{66}les comprendre!{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $23A,$7	; Run text script at offset 0x027D8E
					; 0xE1F5: PRINT	MSG 0x0243, MSGBOX CLEARED, END: "{6A}Le Général Arthur	est{66}en vie!	Hourra!	 Vive Arthur!{66}Faisons la fête!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $23B,$1	; Run text script at offset 0x027D90
					; 0xE1F6: PRINT	MSG 0x0244, MSGBOX CLEARED, END: "{6A}Ce qu'il nous faut...{66}C'est moins d'impôts!!  Mir,{66}ça va êtreta fête!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $23C,$3	; Run text script at offset 0x027D92
					; 0xE1F7: PRINT	MSG 0x0245, MSGBOX CLEARED, END: "{6A}TOGA!  TOGA!  TOGA!{66}Hé, barman!  Un cocktail au{66}Dahl pour tout le monde!{71}{6A}Alors, ils ont été{66}baissés, ces impôts?	Et Mir?{66}Ils l'ont eu?  On s'en fiche!{71}{6A}Buvons un coup!{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $23D,$5	; Run text script at offset 0x027D94
					; 0xE1F8: PRINT	MSG 0x0246, MSGBOX CLEARED, END: "{6A}Vous avez	été au{66}casino?  Ca vaut le détour!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $23E,$1	; Run text script at offset 0x027D96
					; 0xE1F9: PRINT	MSG 0x0247, MSGBOX CLEARED, END: "{6A}Les hommes dans{66}cette ville sont très attirés{66}par une bande	de filles qui{71}{6A}est arrivée du{66}continent...{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $23F,$3	; Run text script at offset 0x027D98
					; 0xE1FA: PRINT	MSG 0x0248, MSGBOX CLEARED, END: "{6A}Et voilà le héros!{66}Mais ça n'a pas l'air d'aller!{66}Il y a un problème?{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $240,$5	; Run text script at offset 0x027D9A
					; 0xE1FB: PRINT	MSG 0x0249, MSGBOX CLEARED, END: "C'est vrai, ce qu'on{66}raconte à propos du duc?{66}Ce doit être un monstre!{71}{6A}Et lui qui souriait{66}en faisant croire qu'il{66}servait la ville!{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $241,$7	; Run text script at offset 0x027D9C
					; 0xE1FC: PRINT	MSG 0x024A, MSGBOX CLEARED, END: "{6A}On ne parle plus que{66}du Général Arthur	et de{66}son nouveau casino.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $242,$1	; Run text script at offset 0x027D9E
					; 0xE1FD: PRINT	MSG 0x024B, MSGBOX CLEARED, END: "{6A}Croyez- moi, petit...{66}Il ne faut JAMAIS{66}tomber amoureux!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $243,$3	; Run text script at offset 0x027DA0
					; 0xE1FE: PRINT	MSG 0x024C, MSGBOX CLEARED, END: "{6A}Ah, ma princesse...{66}Zzzzz.....{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  CS_00C8_0,$5 ; Jump	to address 0x026972
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C8_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $14A		; Bit 2	of flag	0x029
		ScriptID    $776,$1	; Flag set:   Run text script at offset	0x028806
					; 0x18C8: LOAD CHARACTER SCRIPT	* (0x00C8)
					; 0xE53D: PRINT	MSG 0x058B, MSGBOX CLEARED, END: "{6A}Un cocktail Ekenol!{66}{68}{68}{68}...ouh	là...{66}Veut pas monter...{71}"
		ScriptID    $244,$2	; Flag clear: Run text script at offset	0x027DA2
					; 0x7D2B: LOAD CUSTOM ACTION 0x12B (0x1000004AB	CSA_012B), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00C9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_00C9_0,$1 ; Jump	to address 0x02698C
					;
		dc.w $14		; Params 00, 14
		ScriptID    $247,$3	; Run text script at offset 0x027DA8
					; 0xE201: PRINT	MSG 0x024F, MSGBOX CLEARED, END: "{6A}Zzzzzzzz..{66}Julie...{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00C9_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $28		; Bit 0	of flag	0x005
		ScriptID    $246,$1	; Flag set:   Run text script at offset	0x027DA6
					; 0xE200: PRINT	MSG 0x024E, MSGBOX CLEARED, END: "{6A}J'ai envie de vomir...{66}Et en plus, j'ai dû me{66}tordre la cheville...{6D}"
		ScriptID    $245,$2	; Flag clear: Run text script at offset	0x027DA4
					; 0xE1FF: PRINT	MSG 0x024D, MSGBOX CLEARED, END: "{6A}Je....  suis....	malade...{66}comme...  un ...chien...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00CA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $248,$1	; Run text script at offset 0x027DAA
					; 0xE202: PRINT	MSG 0x0250, MSGBOX CLEARED, END: "{6A}Le Duc de	Mercator{66}est	originaire du continent,{66}il reçoit souvent des invités{71}{6A}de son	pays natal.{66}Il n'y a pas très longtemps,{71}{6A}une jeune aristocrate{66}nommée Lara est venue étudier{66}le piano.  Je ne l'ai pas{71}{6A}remarquée ces derniers{66}jours.  Elle a dû rentrer{66}chez elle.{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $249,$3	; Run text script at offset 0x027DAC
					; 0xE203: PRINT	MSG 0x0251, MSGBOX CLEARED, END: "{6A}Vous êtes	un de ces{66}mercenaires, non?	Vous{66}allez vous occuper de Mir,{71}{6A}puis rétablir	la paix...{66}On compte	sur vous.{66}Débarrassez-nous de lui!{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $24A,$5	; Run text script at offset 0x027DAE
					; 0xE204: PRINT	MSG 0x0252, MSGBOX CLEARED, END: "{6A}Alors, le	héros!{66}Et ce	combat contre Mir?{66}Vous allez bien?{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $24B,$7	; Run text script at offset 0x027DB0
					; 0xE205: PRINT	MSG 0x0253, MSGBOX CLEARED, END: "{6A}Si toutes	les choses{66}terribles	qu'on raconte sur{66}le duc sont vraies, alors...{71}{6A}Ce n'est peut-être{66}pas Mir qui est reponsable{66}de ces impôts trop lourds!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $24C,$1	; Run text script at offset 0x027DB2
					; 0xE206: PRINT	MSG 0x0254, MSGBOX CLEARED, END: "Notre	famille	sert le{66}château depuis des{66}générations.  Mon fils	y{71}{6A}travaille dans	les{66}cuisines	et ma fille est{66}bonne.  Tous	deux sont{71}{6A}fiers de servir le duc.{66}Et vous les	enviez!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $24D,$3	; Run text script at offset 0x027DB4
					; 0xE207: PRINT	MSG 0x0255, MSGBOX CLEARED, END: "{6A}Mon fils m'a dit que{66}vous allez à la tour.{66}On dit que la tour recêle{71}{6A}des pièges sans{66}nombre!  Faites attention!{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $24E,$5	; Run text script at offset 0x027DB6
					; 0xE208: PRINT	MSG 0x0256, MSGBOX CLEARED, END: "{6A}Oh, Ryle!{66}Vous	êtes revenu en vie!{66}C'est étonnant!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $24F,$7	; Run text script at offset 0x027DB8
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE209: PRINT	MSG 0x0257, MSGBOX CLEARED, END: "{6A}Quel crétin!  Avez-vous{66}idée de l'importance de la{66}{6E}?{71}{6A}Allez au{66}Labyrinthe Vert et trouvez la{66}{6E} tout seul!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $251,$9	; Run text script at offset 0x027DBC
					; 0xE20A: PRINT	MSG 0x0258, MSGBOX CLEARED, END: "{6A}Enfin il a vu la{66}lumière!  Cela fait six{66}heures que	nous essayons{71}{6A}de	lui montrer{66}le chemin!{6D}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptJump  CS_00CB_0,$B ; Jump	to address 0x0269D0
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $255,$D	; Run text script at offset 0x027DC4
					; 0xE20E: PRINT	MSG 0x025C, MSGBOX CLEARED, END: "{6A}Cet Arthur sait ce qu'il{66}fait!  Il a lancé un{66}casino pour pouvoir{71}{6A}baisser les impôts!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CB_0:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $252,$0	; Prompt:	Run text script	at offset 0x027DBE
					; 0xA20B: PRINT	MSG 0x0259, END: "{6A}Vous avez	entendu{66}pour	le Général Arthur?{67}"
		ScriptID    $254,$1	; Answer 'yes': Run text script at offset 0x027DC2
					; 0xE20D: PRINT	MSG 0x025B, MSGBOX CLEARED, END: "{6A}Il a été grièvement{66}blessé.  Il est sous une{66}étroite surveillance{71}{6A}médicale.	Je pense{66}qu'il ferait un excellent{66}chef de Mercator.{6D}"
		ScriptID    $253,$2	; Answer 'no':  Run text script at offset 0x027DC0
					; 0x820C: PRINT	MSG 0x025A: "{6A}C'est lui qui commande{66}la garde du château à{66}présent.  Le complot du{71}{6A}duc le préoccupe.{71}"
					; 0xE20D: PRINT	MSG 0x025B, MSGBOX CLEARED, END: "{6A}Il a été grièvement{66}blessé.  Il est sous une{66}étroite surveillance{71}{6A}médicale.	Je pense{66}qu'il ferait un excellent{66}chef de Mercator.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00CC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $256,$1	; Run text script at offset 0x027DC6
					; 0xE20F: PRINT	MSG 0x025D, MSGBOX CLEARED, END: "{6A}Hé hé.  Vous feriez mieux{66}de partir...	 Cet endroit n'est{66}pas pour les touristes.  Hé hé.{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptJump  CS_00CC_0,$3 ; Jump	to address 0x0269EE
					;
		dc.w $15		; Params 00, 15
		ScriptID    $259,$5	; Run text script at offset 0x027DCC
					; 0xE212: PRINT	MSG 0x0260, MSGBOX CLEARED, END: "{6A}Hé hé.  Ca vous a	permis{66}de garder la forme, hein?{66}Hé hé hé....{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CC_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $A2		; Bit 2	of flag	0x014
		ScriptID    $258,$1	; Flag set:   Run text script at offset	0x027DCA
					; 0xE211: PRINT	MSG 0x025F, MSGBOX CLEARED, END: "{6A}Il faut se servir	de son{66}cerveau...  hé hé...	Qu'il{66}s'agisse de ce monde ou{71}de l'autre, en bas!{6D}"
		ScriptID    $257,$2	; Flag clear: Run text script at offset	0x027DC8
					; 0xE210: PRINT	MSG 0x025E, MSGBOX CLEARED, END: "{6A}Ah!  Bienvenue au	Motel{66}des Champions!{66}Les héros descendent{71}{6A}chez nous, mais ils{71}{6A}ne repartent pas!{66}Voilà la	crypte souterraine!{66}Vous attendez quoi?  Allez...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001B:
		cmpi.w	#$640,(g_AdditionalFlags+$1C).l
		blt.s	CS_001B_0
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w 8			; Bit 0	of flag	0x001
		ScriptID    $4C6,$1	; Flag set:   Run text script at offset	0x0282A6
					; 0xE3DE: PRINT	MSG 0x042C, MSGBOX CLEARED, END: "{6A}Je vous en prie, partez!{66}Ne revenez pas!{66}Je	vous en	supplie!...{6D}"
		ScriptID    $4C4,$2	; Flag clear: Run text script at offset	0x0282A2
					; 0x1408: SET BIT 0 OF FLAG 0x001
					; 0xE3DD: PRINT	MSG 0x042B, MSGBOX CLEARED, END: "{6A}Non-non-non!  S'il vous{66}plaît...  Partez!  Vous êtes{66}un tricheur, vous, hein?{6D}"
; ---------------------------------------------------------------------------
		bra.s	CS_001B_1
; ---------------------------------------------------------------------------

CS_001B_0:				; CODE XREF: ROM:00026A02j
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w 8			; Bit 0	of flag	0x001
		ScriptID    $25B,$1	; Flag set:   Run text script at offset	0x027DD0
					; 0xE213: PRINT	MSG 0x0261, MSGBOX CLEARED, END: "{6A}Placez-vous devant le{66}comptoir, Sautez, puis{71}{6A}lancez!  Patience...{66}Vous aurez	bientôt	le coup{66}de main!{6D}"
		ScriptID    $25A,$2	; Flag clear: Run text script at offset	0x027DCE
					; 0x7C34: LOAD CUSTOM ACTION 0x34 (0x1000000CF CSA_0034), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

CS_001B_1:				; CODE XREF: ROM:00026A0Ej
		rts
; ---------------------------------------------------------------------------

CS_00CD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $25C,$1	; Run text script at offset 0x027DD2
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0xE214: PRINT	MSG 0x0262, MSGBOX CLEARED, END: "{6A}Ba-pa-da-da, di-da{66}POUSSER!  Bientôt vous{66}récolterez da-da-di-da...{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $25E,$3	; Run text script at offset 0x027DD6
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0xE215: PRINT	MSG 0x0263, MSGBOX CLEARED, END: "{6A}Maman adore chanter!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $260,$5	; Run text script at offset 0x027DDA
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0xE216: PRINT	MSG 0x0264, MSGBOX CLEARED, END: "{6A}Levons l'ancre, yo-ho,{66}Voilà les flots, yo-ho!{66}J'apprendrai une nouvelle{71}{6A}chanson à maman!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $262,$1	; Run text script at offset 0x027DDE
					; 0xE217: PRINT	MSG 0x0265, MSGBOX CLEARED, END: "{6A}Je ne sais pas qui {66}enseigne ces drôles de{66}chansons	à mon fils...{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $263,$3	; Run text script at offset 0x027DE0
					; 0x17EA: PLAY MUSIC TRACK 36
					; 0xE218: PRINT	MSG 0x0266, MSGBOX CLEARED, END: "{6A}Ba-pa-da-da, di-da{66}POUSSER!  Bientôt vous{66}la-la...	J'aime bien, moi!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00CF:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $265,$1	; Run text script at offset 0x027DE4
					; 0xE219: PRINT	MSG 0x0267, MSGBOX CLEARED, END: "{6A}Je suis garde au{66}château, mais	j'ai quartier{66}libre.  Je vais chez Petit Pois.{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $266,$3	; Run text script at offset 0x027DE6
					; 0xE21A: PRINT	MSG 0x0268, MSGBOX CLEARED, END: "{6A}On dit que les{66}monstres des souterrains{66}sont plus malins que nous!{6D}"
					;
		dc.w $16		; Params 00, 16
		ScriptID    $267,$5	; Run text script at offset 0x027DE8
					; 0xE21B: PRINT	MSG 0x0269, MSGBOX CLEARED, END: "{6A}Bonne chance!  Et	tant que{66}vous y êtes...Vous{66}pourriez pas faire baisser{71}{6A}les	impôts?{6D}"
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
		ScriptID    $4D4,$0	; Run text script at offset 0x0282C2
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0xE3E4: PRINT	MSG 0x0432, MSGBOX CLEARED, END: "{6A}Son passe-temps, c'est{66}collectionner les jarres.{66}Mon passe-temps à moi,{71}{6A}c'est de les poser{66}partout, puis de trouver{66}quelqu'un pour les{71}{6A}remettre en place.{6D}"
; ---------------------------------------------------------------------------
		bra.s	CS_00D0_1
; ---------------------------------------------------------------------------

CS_00D0_0:				; CODE XREF: ROM:00026A60j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4D2,$0	; Run text script at offset 0x0282BE
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0xE3E3: PRINT	MSG 0x0431, MSGBOX CLEARED, END: "{6A}Aidez-moi	de nouveau.{6D}"
; ---------------------------------------------------------------------------

CS_00D0_1:				; CODE XREF: ROM:00026A66j
		bra.s	CS_00D0_4
; ---------------------------------------------------------------------------

CS_00D0_2:				; CODE XREF: ROM:00026A56j
		move.w	#$1A,d0
		bsr.w	TestFlagBit
		bne.s	CS_00D0_3
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $268,$0	; Run text script at offset 0x027DEA
					; 0x7C38: LOAD CUSTOM ACTION 0x38 (0x1000000DF CSA_0038), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		bra.s	CS_00D0_4
; ---------------------------------------------------------------------------

CS_00D0_3:				; CODE XREF: ROM:00026A76j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $4D6,$0	; Run text script at offset 0x0282C6
					; 0x18D0: LOAD CHARACTER SCRIPT	* (0x00D0)
					; 0xE3E5: PRINT	MSG 0x0433, MSGBOX CLEARED, END: "{6A}J'ai mal au dos, moi.{66}Ces jarres sont bien{66}trop lourdes pour moi!{6D}"
; ---------------------------------------------------------------------------

CS_00D0_4:				; CODE XREF: ROM:CS_00D0_1j
					; ROM:00026A7Cj
		rts
; ---------------------------------------------------------------------------

CS_00D1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $269,$1	; Run text script at offset 0x027DEC
					; 0xE21C: PRINT	MSG 0x026A, MSGBOX CLEARED, END: "{6A}Quand j'étais plus jeune,{66}je travaillais au château.{71}{6A}On ne nous invite{66}que très rarement au château{66}mais je garde le souvenir{71}{6A}de toute cette élégance!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $26A,$3	; Run text script at offset 0x027DEE
					; 0xE21D: PRINT	MSG 0x026B, MSGBOX CLEARED, END: "{6A}Le navire	est arrivé{66}du continent!  Allons{66}au marché mensuel!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $26B,$5	; Run text script at offset 0x027DF0
					; 0x821E: PRINT	MSG 0x026C: "{6A}Cette rumeur doit être{66}vraie, vous savez...	 Quand{66}mon mari était à Ryuma,{71}{6A}il a vu un jeune qui{71}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE21F: PRINT	MSG 0x026D, MSGBOX CLEARED, END: "{6A}jettait la {6E}.{66}C'était l'apprenti du gardien{66}du phare.  Il a parlé au jeune{71}{6A}homme et d'après lui,{66}le duc de Mercator l'aurait{66}persuadé de voler la Pierre{71}{6A}Solaire!  Là dessus,{66}mon mari est rentré dare-dare{66}mais le duc était loin déjà!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $26E,$7	; Run text script at offset 0x027DF6
					; 0xE220: PRINT	MSG 0x026E, MSGBOX CLEARED, END: "{6A}L'audition se{66}poursuit en haut.{6D}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $26F,$9	; Run text script at offset 0x027DF8
					; 0xE221: PRINT	MSG 0x026F, MSGBOX CLEARED, END: "{6A}Ils sont encore en haut.{66}Ils essaient de remettre ce{66}jeune homme sur le bon{71}{6A}chemin...{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $270,$B	; Run text script at offset 0x027DFA
					; 0xE222: PRINT	MSG 0x0270, MSGBOX CLEARED, END: "{6A}Vous vous	souvenez{66}de l'apprenti-gardien de{66}phare?  Il travaille sous les{71}{6A}ordres du Général Arthur{66}à présent!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D2:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $271,$1	; Run text script at offset 0x027DFC
					; 0xE223: PRINT	MSG 0x0271, MSGBOX CLEARED, END: "{6A}Mon ami travaille	au{66}château, comprenez, et il	dit{66}qu'il y a un labyrinthe au{71}{6A}sous-sol.  Et ce n'est pas{66}tout!  Il y plein de monstres!{66}C'est horrible!  Beurk!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $272,$3	; Run text script at offset 0x027DFE
					; 0xE224: PRINT	MSG 0x0272, MSGBOX CLEARED, END: "{6A}Mon copain dit aussi que{66}les cachots souterrains sont{66}remplis de coupe-gorges et{71}{6A}de bandits!	 Qu'est-ce{66}que vous pensez de ça?!!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $273,$5	; Run text script at offset 0x027E00
					; 0xE225: PRINT	MSG 0x0273, MSGBOX CLEARED, END: "{6A}Papa et les autres sont{66}en haut.  Ils interrogent{66}l'apprenti.C'est lui qui a{71}{6A}pénétré par effraction{66}dans le phare.{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $274,$7	; Run text script at offset 0x027E02
					; 0xE226: PRINT	MSG 0x0274, MSGBOX CLEARED, END: "{6A}Oui, ils sont toujours{66}là-haut.  Je crois qu'il a eu{66}son compte!{6D}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $275,$9	; Run text script at offset 0x027E04
					; 0xE227: PRINT	MSG 0x0275, MSGBOX CLEARED, END: "{6A}Quelqu'un doit prendre{66}en charge le maintien de{66}l'ordre dans cette ville!{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $276,$B	; Run text script at offset 0x027E06
					; 0xE228: PRINT	MSG 0x0276, MSGBOX CLEARED, END: "{6A}Mon père et ses amis{66}discutent	du nouveau casino.{66}Ils sont en haut.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001C:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $277,$0	; Run text script at offset 0x027E08
					; 0xE229: PRINT	MSG 0x0277, MSGBOX CLEARED, END: "{6A}Mercator est une ville{66}où on tient aux	traditions.{66}Il faut vous comporter{71}{6A}convenablement.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00D3:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $278,$0	; Run text script at offset 0x027E0A
					; 0xE22A: PRINT	MSG 0x0278, MSGBOX CLEARED, END: "{6A}Pourvu que ce maudit{66}sorcier soit vaincu bientôt!{66}Et qu'on baisse les impôts!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00D4:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $279,$0	; Run text script at offset 0x027E0C
					; 0xE22B: PRINT	MSG 0x0279, MSGBOX CLEARED, END: "{6A}Le duc de	Mercator est{66}un homme charmant et bon.  Il{66}est venu en ville l'autre jour{71}{6A}et il nous a dit à chacun{66}quelques mots gentils.  Moi,{66}j'ai trouvé ça très bien!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00D5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $27A,$1	; Run text script at offset 0x027E0E
					; 0xE22C: PRINT	MSG 0x027A, MSGBOX CLEARED, END: "{6A}Le duc de	Mercator est{66}formidable!  Quel bel homme!{66}Quel raffinement!  Quelle allure!{71}{6A}Bonjour, Monsieur!{66}Comme vous êtes beau...{6D}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $27A,$3	; Run text script at offset 0x027E0E
					; 0xE22C: PRINT	MSG 0x027A, MSGBOX CLEARED, END: "{6A}Le duc de	Mercator est{66}formidable!  Quel bel homme!{66}Quel raffinement!  Quelle allure!{71}{6A}Bonjour, Monsieur!{66}Comme vous êtes beau...{6D}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $27A,$5	; Run text script at offset 0x027E0E
					; 0xE22C: PRINT	MSG 0x027A, MSGBOX CLEARED, END: "{6A}Le duc de	Mercator est{66}formidable!  Quel bel homme!{66}Quel raffinement!  Quelle allure!{71}{6A}Bonjour, Monsieur!{66}Comme vous êtes beau...{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $27B,$7	; Run text script at offset 0x027E10
					; 0xE22D: PRINT	MSG 0x027B, MSGBOX CLEARED, END: "{6A}Eh bien, c'était comment?{66}Vous avez vu le duc, c'est ça?ous en avez de la chance!{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $27C,$9	; Run text script at offset 0x027E12
					; 0xE22E: PRINT	MSG 0x027C, MSGBOX CLEARED, END: "{6A}Ca s'est bien passé?{66}Vous avez vu Mir, c'est ça?{66}Il était vraiment costaud?{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $27D,$B	; Run text script at offset 0x027E14
					; 0xE22F: PRINT	MSG 0x027D, MSGBOX CLEARED, END: "{6A}Quoi?  Le	duc était un{66}homme méchant?...  Oh, Je l'ai{66}vu aller vers le port,{71}{6A}avec ses soldats,{71}Il n'y a pas longtemps...{66}Qu'est-ce qui se passe?{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $27E,$D	; Run text script at offset 0x027E16
					; 0xE230: PRINT	MSG 0x027E, MSGBOX CLEARED, END: "{6A}Le duc, c'était un{66}méchant?  J'aurais dû vous{66}écouter avant...{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $27F,$F	; Run text script at offset 0x027E18
					; 0xE231: PRINT	MSG 0x027F, MSGBOX CLEARED, END: "{6A}On s'habitue à vivre sans{66}le duc de Mercator.  Je me{66}demande ce qu'il fait ces{71}{6A}jours-ci...  Comment?!{66}Il cherche toujours les{66}trésors?  Hmmm...!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $280,$1	; Run text script at offset 0x027E1A
					; 0xE232: PRINT	MSG 0x0280, MSGBOX CLEARED, END: "{6A}Cette diseuse de bonne{66}aventure est célèbre par ici.{66}Elle peut lancer un sort{71}{6A}puissant sur nous!{6D}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $281,$3	; Run text script at offset 0x027E1C
					; 0xE233: PRINT	MSG 0x0281, MSGBOX CLEARED, END: "{6A}Hé hé.  Je sais, je sais.{66}Vous	lui avez demandé de{66}vous jeter un sort, non?{71}{6A}Eh bien,	allez-y!  La{66}maison de Madame Yard{66}est juste en face!{6D}"
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $280,$5	; Run text script at offset 0x027E1A
					; 0xE232: PRINT	MSG 0x0280, MSGBOX CLEARED, END: "{6A}Cette diseuse de bonne{66}aventure est célèbre par ici.{66}Elle peut lancer un sort{71}{6A}puissant sur nous!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $282,$7	; Run text script at offset 0x027E1E
					; 0xE234: PRINT	MSG 0x0282, MSGBOX CLEARED, END: "{6A}Sa magie est si respectée{66}qu'on vient même du{66}continent pour la consulter.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $283,$1	; Run text script at offset 0x027E20
					; 0xE235: PRINT	MSG 0x0283, MSGBOX CLEARED, END: "{6A}Comment se fait-il qu'une{66}niche occupe le meilleur ter-{66}rain de la ville?  C'est fou!{6D}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $284,$3	; Run text script at offset 0x027E22
					; 0xE236: PRINT	MSG 0x0284, MSGBOX CLEARED, END: "{6A}Je voudrais acheter ce{66}terrain, mais est-ce que...{66}ce chien	veut vendre?{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $285,$5	; Run text script at offset 0x027E24
					; 0xE237: PRINT	MSG 0x0285, MSGBOX CLEARED, END: "{6A}A	qui est	ce terrain,{66}en fait?	 Au duc	de{66}Mercator,	peut-être?{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $286,$7	; Run text script at offset 0x027E26
					; 0xE238: PRINT	MSG 0x0286, MSGBOX CLEARED, END: "{6A}Savez-vous que le	duc{66}s'est enfui?  Qu'est-ce que{66}nous allons faire sans lui?{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $287,$9	; Run text script at offset 0x027E28
					; 0xE239: PRINT	MSG 0x0287, MSGBOX CLEARED, END: "{6A}Vous voyez le panneau?{71}{6A}Voilà l'occasion que{66}j'attendais!  J'ai le meilleur{66}emplacement dans toute{71}la ville de Mercator!{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $288,$B	; Run text script at offset 0x027E2A
					; 0xE23A: PRINT	MSG 0x0288, MSGBOX CLEARED, END: "{6A}Zut!  J'ai le terrain,{66}Mais je n'ai plus d'argent{66}pour y bâtir une maison!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D8:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $289,$1	; Run text script at offset 0x027E2C
					; 0xE23B: PRINT	MSG 0x0289, MSGBOX CLEARED, END: "{6A}Le port de Mercator{66}est au sud.  Un bateau vient{66}régulièrement du continent.{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $28A,$3	; Run text script at offset 0x027E2E
					; 0xE23C: PRINT	MSG 0x028A, MSGBOX CLEARED, END: "{6A}Nous aurons toutes les{66}marchandises qu'il nous faut,{66}dès que le bateau arrivera!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $28B,$5	; Run text script at offset 0x027E30
					; 0xE23D: PRINT	MSG 0x028B, MSGBOX CLEARED, END: "{6A}Bonté divine!  Le	bateau{66}ne peut pas partir à cause de	la panne du phare!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $28C,$7	; Run text script at offset 0x027E32
					; 0xE23E: PRINT	MSG 0x028C, MSGBOX CLEARED, END: "{6A}Bonté divine!  Le	bateau{66}ne peut pas partir à cause de	la panne du phare!{71}{6A}Bonté	divine!	 le...	Oh!{66}Vous l'avez réparé?{66}Excellent{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $28D,$9	; Run text script at offset 0x027E34
					; 0xE23F: PRINT	MSG 0x028D, MSGBOX CLEARED, END: "{6A}Vous avez	entendu	parler{66}du nouveau casino?  Il paraît{66}qu'on s'y amuse follement!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00D9:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $28E,$0	; Run text script at offset 0x027E36
					; 0xE240: PRINT	MSG 0x028E, MSGBOX CLEARED, END: "{6A}Souvent je regarde les{66}officiers entrer et sortir.{66}Qu'est-ce qu'ils font{71}à l'intérieur?{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00DA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $28F,$1	; Run text script at offset 0x027E38
					; 0xE241: PRINT	MSG 0x028F, MSGBOX CLEARED, END: "{6A}Quand je serai grand,{66}je porterai l'uniforme de la{66}Garde Royale et je servirai{71}le duc de Mercator!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $290,$3	; Run text script at offset 0x027E3A
					; 0xE242: PRINT	MSG 0x0290, MSGBOX CLEARED, END: "{6A}Vous allez vraiment{66}à la tour de Mir?	Vous êtes{66}fatigué de	la vie,	ou quoi?!{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $291,$5	; Run text script at offset 0x027E3C
					; 0xE243: PRINT	MSG 0x0291, MSGBOX CLEARED, END: "{6A}Vous voilà de retour!{66}On vous croyait mort!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00DB:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $292,$0	; Run text script at offset 0x027E3E
					; 0xE244: PRINT	MSG 0x0292, MSGBOX CLEARED, END: "{6A}Je surveille la tour{66}contre d'éventuels attaquants.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00DC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $293,$1	; Run text script at offset 0x027E40
					; 0xE245: PRINT	MSG 0x0293, MSGBOX CLEARED, END: "{6A}Ouaf!  Ouaf!{6D}"
					;
		dc.w $19		; Params 00, 19
		ScriptID    $294,$3	; Run text script at offset 0x027E42
					; 0xE246: PRINT	MSG 0x0294, MSGBOX CLEARED, END: "{6A}Ce n'était pas mon{66}intention de prendre le{66}meilleur terrain de la ville!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_001D_0,$1 ; Jump	to address 0x026B90
					;
		dc.w $C			; Params 00, 0C
		ScriptID    $297,$3	; Run text script at offset 0x027E48
					; 0xE248: PRINT	MSG 0x0296, MSGBOX CLEARED, END: "{6A}Maman a bientôt fini{66}son travail pour aujourd'hui.{6D}"
					;
		dc.w $E			; Params 00, 0E
		ScriptID    $298,$5	; Run text script at offset 0x027E4A
					; 0xE249: PRINT	MSG 0x0297, MSGBOX CLEARED, END: "{6A}Madame Yard est ma mère.{66}Elle na va pas tarder	à fermer{66}Elle est certainement épuisée!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $299,$7	; Run text script at offset 0x027E4C
					; 0xE24A: PRINT	MSG 0x0298, MSGBOX CLEARED, END: "{6A}Maman et moi, nous{66}allons sur le continent pour{66}ouvrir un nouvel institut.{71}{6A}Venez nous voir!{71}{6A}Mais vous	verrez en quoi{66}consiste notre métier	quand{66}vous serez à l'intérieur!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $29A,$9	; Run text script at offset 0x027E4E
					; 0xE24B: PRINT	MSG 0x0299, MSGBOX CLEARED, END: "{6A}Réparez le phare,{66}pour	moi et ma maman!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $29B,$B	; Run text script at offset 0x027E50
					; 0xE24C: PRINT	MSG 0x029A, MSGBOX CLEARED, END: "{6A}Je n'ai pas encore été{66}sur le continent.  Je ne{66}connais que cette île.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001D_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $2A		; Bit 2	of flag	0x005
		ScriptID    $296,$1	; Flag set:   Run text script at offset	0x027E46
					; 0xE247: PRINT	MSG 0x0295, MSGBOX CLEARED, END: "{6A}Vous devez faire{66}beaucoup de conquêtes{66}chez	ces dames!{6D}"
		ScriptID    $295,$2	; Flag clear: Run text script at offset	0x027E44
					; 0x7C2F: LOAD CUSTOM ACTION 0x2F (0x1000000BB CSA_002F), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00DD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $29C,$1	; Run text script at offset 0x027E52
					; 0xE24D: PRINT	MSG 0x029B, MSGBOX CLEARED, END: "{6A}On m'a arnaqué!{66}Chez Petit Pois...{66}On m'a volé!{71}{6A}Ma femme va{66}m'étriper!  Qu'est-ce...  Je{66}sais!...  Je dirai que j'ai{71}{6A}perdu mon portefeuille!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $29D,$3	; Run text script at offset 0x027E54
					; 0xE24E: PRINT	MSG 0x029C, MSGBOX CLEARED, END: "{6A}Je vais goûter de	nouveau{66}aux plaisirs	de la vie!  Je lui{66}demanderai de me jeter un	sort{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $29E,$5	; Run text script at offset 0x027E56
					; 0xE24F: PRINT	MSG 0x029D, MSGBOX CLEARED, END: "{6A}Je suis jeune!{66}J'ai retrouvé ma jeunesse!{66}C'est merveilleux!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00DE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $29F,$1	; Run text script at offset 0x027E58
					; 0xE250: PRINT	MSG 0x029E, MSGBOX CLEARED, END: "{6A}Oh, Fahl mon amour!{66}Quand me verras-tu?{66}Je pense si	fort à toi!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2A0,$3	; Run text script at offset 0x027E5A
					; 0xE251: PRINT	MSG 0x029F, MSGBOX CLEARED, END: "{6A}Regardez!	 C'est affreux!{66}Qu'est-ce qu'elle fait, cette{66}fille, dans sa chambre à lui?!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2A1,$5	; Run text script at offset 0x027E5C
					; 0xE252: PRINT	MSG 0x02A0, MSGBOX CLEARED, END: "{6A}Vous entendez?  Fahl{66}a	passé la nuit à	parler{66}avec cette fille!{71}{6A}Je suis jalouse!{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2A2,$7	; Run text script at offset 0x027E5E
					; 0xE253: PRINT	MSG 0x02A1, MSGBOX CLEARED, END: "{6A}Je ferais	mieux de{66}l'oublier, ce type!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00DF:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2A3,$0	; Run text script at offset 0x027E60
					; 0xE254: PRINT	MSG 0x02A2, MSGBOX CLEARED, END: "{6A}Monsieur Fahl a pas mal{66}d'admiratrices.  D'accord,{66}il est grand et fort, mais...{71}{6A}Il est si vieux!{66}Pourquoi y a t il toutes ces{66}filles qui lui courent après?{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2A4,$1	; Run text script at offset 0x027E62
					; 0xE255: PRINT	MSG 0x02A3, MSGBOX CLEARED, END: "{6A}Je ne sais pas quand{66}il y aura	un autre bateau...{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2A5,$3	; Run text script at offset 0x027E64
					; 0xE256: PRINT	MSG 0x02A4, MSGBOX CLEARED, END: "{6A}Je viens d'entendre des{66}cris épouvantables...  Mes{66}oreilles me jouent des tours?{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2A6,$1	; Run text script at offset 0x027E66
					; 0xE257: PRINT	MSG 0x02A5, MSGBOX CLEARED, END: "{6A}A	vrai dire, je suis{66}militaire, au château.  Mon{66}devoir, c'est de monter{71}{6A}la garde ici, déguisé.{66}Je suis fier de faire{66}ce travail!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2A7,$3	; Run text script at offset 0x027E68
					; 0xE258: PRINT	MSG 0x02A6, MSGBOX CLEARED, END: "{6A}Vous aussi, vous allez{66}à la tour?  Vous êtes{66}courageux, les	gars!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E2:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2A8,$1	; Run text script at offset 0x027E6A
					; 0xE259: PRINT	MSG 0x02A7, MSGBOX CLEARED, END: "{6A}Je ne sais pas pourquoi,{66}mais cet endroit me fait{66}froid dans le dos...{71}{6A}Brrrrrr!.......{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2A9,$3	; Run text script at offset 0x027E6C
					; 0xE25A: PRINT	MSG 0x02A8, MSGBOX CLEARED, END: "{6A}Zak et Dexter?  Ca fait{66}un bout de temps qu'ils sont{66}descendus dans la crypte.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E3:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2AA,$0	; Run text script at offset 0x027E6E
					; 0xE25B: PRINT	MSG 0x02A9, MSGBOX CLEARED, END: "{6A}Bonjour!	Vous aussi,{66}vous êtes chasseur de{66}trésor?	 On en voit{71}{6A}énormément{66}ces temps-ci!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E4:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2AB,$0	; Run text script at offset 0x027E70
					; 0xE25C: PRINT	MSG 0x02AA, MSGBOX CLEARED, END: "{6A}Qu-qui êtes-vous?!{66}Je suis occupé!  Ne	me{66}dérangez pas!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_00E5_0,$1 ; Jump	to address 0x026C1E
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $2AE,$3	; Run text script at offset 0x027E76
					; 0xE25E: PRINT	MSG 0x02AC, MSGBOX CLEARED, END: "{6A}Monsieur Ryle!  Le Général{66}Arthur nous	a dit de vous{66}laisser entrer.  Allez-y!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2AF,$5	; Run text script at offset 0x027E78
					; 0xE25F: PRINT	MSG 0x02AD, MSGBOX CLEARED, END: "{6A}J'aimerais venir vous{66}aider, mais me tenir ici,{66}c'est un travail crucial!!{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptJump  CS_00E5_1,$7 ; Jump	to address 0x026C2A
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2B3,$9	; Run text script at offset 0x027E80
					; 0xE261: PRINT	MSG 0x02AF, MSGBOX CLEARED, END: "{6A}Me tenir ainsi...	 Ca{66}a toujours été mon rêve!{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2B4,$B	; Run text script at offset 0x027E82
					; 0xE262: PRINT	MSG 0x02B0, MSGBOX CLEARED, END: "{6A}Bienvenue	au château{66}d'Arthur!  Tout le monde{66}peut passer par ce portail!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E5_0:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2AC,$0	; Run text script at offset 0x027E72
					; 0x14C8: SET BIT 0 OF FLAG 0x019
					; 0xE25D: PRINT	MSG 0x02AB, MSGBOX CLEARED, END: "{6A}Ici c'est le château de{66}Mercator.  Je ne peux pas{66}vous laisser entrer.{6D}"
; ---------------------------------------------------------------------------

loc_26C22:				; CODE XREF: ROM:00026C58j
		move.w	#$C6,d0	; '╞'
		bra.w	CS_0016_1
; ---------------------------------------------------------------------------

CS_00E5_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DC		; Bit 4	of flag	0x01B
		ScriptID    $2B0,$1	; Flag clear: Run text script at offset	0x027E7A
					; 0x7CEF: LOAD CUSTOM ACTION 0xEF (0x1000003BB CSA_00EF), MSGBOX CLEARED, END
		ScriptID    $2B2,$2	; Flag set:   Run text script at offset	0x027E7E
					; 0xE260: PRINT	MSG 0x02AE, MSGBOX CLEARED, END: "{6A}Section -- Garde à vous!{66}Entrez!  le duc de Mercator{66}vous attend.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E6:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptJump  CS_00E6_0,$1 ; Jump	to address 0x026C54
					;
		dc.w $F			; Params 00, 0F
		ScriptID    $2B7,$3	; Run text script at offset 0x027E88
					; 0xE264: PRINT	MSG 0x02B2, MSGBOX CLEARED, END: "{6A}C'est vous, Ryle?  Hmm.{66}J'attendais quelqu'un de...{66}plus agé...{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2B8,$5	; Run text script at offset 0x027E8A
					; 0xE265: PRINT	MSG 0x02B3, MSGBOX CLEARED, END: "{6A}Vous partez donner une{66}à Mir, c'est ça?  Elle va{66}bientôt porter du noir,{71}{6A}vot' maman!  Ha ha!{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptJump  CS_00E6_1,$7 ; Jump	to address 0x026C5A
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2BA,$9	; Run text script at offset 0x027E8E
					; 0xE267: PRINT	MSG 0x02B5, MSGBOX CLEARED, END: "{6A}Vous!  Pas un pas	de plus!{66}Ha ha, je plaisantais!{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2BB,$B	; Run text script at offset 0x027E90
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0xE268: PRINT	MSG 0x02B6, MSGBOX CLEARED, END: "{6A}Nous sommes les{66}premiers enfants-gardes{66}de ce château!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00E6_0:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2B5,$0	; Run text script at offset 0x027E84
					; 0x14C8: SET BIT 0 OF FLAG 0x019
					; 0xE263: PRINT	MSG 0x02B1, MSGBOX CLEARED, END: "{6A}Le duc de	Mercator ne{66}vous a pas invité, pas vrai?{71}{6A}Ce n'est pas un endroit{66}pour les gamins comme vous!{66}Allez!  Du vent!{6D}"
; ---------------------------------------------------------------------------
		bra.s	loc_26C22
; ---------------------------------------------------------------------------

CS_00E6_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DC		; Bit 4	of flag	0x01B
		ScriptID    $2B0,$1	; Flag clear: Run text script at offset	0x027E7A
					; 0x7CEF: LOAD CUSTOM ACTION 0xEF (0x1000003BB CSA_00EF), MSGBOX CLEARED, END
		ScriptID    $2B9,$2	; Flag set:   Run text script at offset	0x027E8C
					; 0xE266: PRINT	MSG 0x02B4, MSGBOX CLEARED, END: "{6A}Ryle, vous êtes en vie!{66}Chapeau!  Le duc voudra{66}certainement vous{71}{6A}remercier!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E7:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2BD,$0	; Run text script at offset 0x027E94
					; 0xE269: PRINT	MSG 0x02B7, MSGBOX CLEARED, END: "{6A}Co-cori-coooOOOoo..{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00E8:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $28		; Bit 0	of flag	0x005
		ScriptID    $2BF,$1	; Flag set:   Run text script at offset	0x027E98
					; 0xE26A: PRINT	MSG 0x02B8, MSGBOX CLEARED, END: "{6A}Pourquoi les hommes{66}agissent-ils comme	des{66}imbéciles quand ils sont{71}{6A}amoureux?{6D}"
		ScriptID    $2BE,$2	; Flag clear: Run text script at offset	0x027E96
					; 0x7C29: LOAD CUSTOM ACTION 0x29 (0x1000000A3 CSA_0029), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptJump  CS_001E_0,$1 ; Jump	to address 0x026C96
					;
		dc.w $12		; Params 00, 12
		ScriptID    $361,$3	; Run text script at offset 0x027FDC
					; 0xE2FD: PRINT	MSG 0x034B, MSGBOX CLEARED, END: "{6A}Je pense que la fête{66}va commencer.{71}{6A}Peut-être que vous{66}aimeriez passer à la{66}salle des banquets...{6D}"
					;
		dc.w $13		; Params 00, 13
		ScriptJump  CS_001E_2,$5 ; Jump	to address 0x026CAE
					;
		dc.w $14		; Params 00, 14
		ScriptJump  CS_001E_3,$7 ; Jump	to address 0x026CBA
					;
		dc.w $18		; Params 00, 18
		ScriptJump  CS_001E_4,$9 ; Jump	to address 0x026CC6
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  CS_001E_5,$B ; Jump	to address 0x026CD2
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001E_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CE		; Bit 6	of flag	0x019
		ScriptID    $35E,$1	; Flag clear: Run text script at offset	0x027FD6
					; 0x7C51: LOAD CUSTOM ACTION 0x51 (0x100000143 CSA_0051), MSGBOX CLEARED, END
		ScriptJump  CS_001E_1,$2 ; Flag	set:   Jump to address 0x026CA2
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $DB		; Bit 3	of flag	0x01B
		ScriptID    $360,$1	; Flag set:   Run text script at offset	0x027FDA
					; 0x1493: SET BIT 3 OF FLAG 0x012
					; 0xE2FD: PRINT	MSG 0x034B, MSGBOX CLEARED, END: "{6A}Je pense que la fête{66}va commencer.{71}{6A}Peut-être que vous{66}aimeriez passer à la{66}salle des banquets...{6D}"
		ScriptID    $35F,$2	; Flag clear: Run text script at offset	0x027FD8
					; 0xE2FC: PRINT	MSG 0x034A, MSGBOX CLEARED, END: "{6A}Monsieur Ryle!  Soyez le{66}bienvenu au château!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_2:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CF		; Bit 7	of flag	0x019
		ScriptID    $362,$1	; Flag clear: Run text script at offset	0x027FDE
					; 0xE2FE: PRINT	MSG 0x034C, MSGBOX CLEARED, END: "{6A}Vous allez à la tour!?{66}C'est un endroit fort{66}dangereux!{71}{6A}Vous savez qu'il y a{66}une barrière magique à{66}l'entrée de la tour?{71}{6A}Mes recherches m'ont{66}appris qu'il faut un certain{66}bracelet pour briser cette{71}{6A}barrière.  Le bracelet se
					;                                                 {66}trouverait dans la crypte{66}souterraine, près de l'église.{71}{6A}J'y envoie mes meilleurs{66}hommes, mais ils ne reviennent{66}jamais!  le bracelet doit être{71}{6A}protégé par des pièges!{6D}"
		ScriptID    $363,$2	; Flag set:   Run text script at offset	0x027FE0
					; 0xE2FF: PRINT	MSG 0x034D, MSGBOX CLEARED, END: "{6A}Monsieur Ryle!{66}Vous devez récupérer ce{66}bracelet et battre Mir!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_3:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D1		; Bit 1	of flag	0x01A
		ScriptID    $364,$1	; Flag clear: Run text script at offset	0x027FE2
					; 0x8300: PRINT	MSG 0x034E: "{6A}Dexter	et Zak sont{66}passés par ici il y a peu{66}de temps.  Il m'ont demandé{71}{6A}comment détruire la{66}barrière, puis ils sont allés{66}vers la crypte.  Je dois{71}{6A}vous prévenir, Ryle,{66}les monstres d'en-dessous{66}sont intelligents!!  Mir a pu{71}{6A}leur jeter un sort...{66}Souvenez-vous, pour{66}gagner le bracelet, l'épée{71}{6A}ne suffira pas!{71}"
					; 0xE301: PRINT	MSG 0x034F, MSGBOX CLEARED, END: "{6A}Pas d'imprudence!{6D}"
		ScriptID    $365,$2	; Flag set:   Run text script at offset	0x027FE4
					; 0xE301: PRINT	MSG 0x034F, MSGBOX CLEARED, END: "{6A}Pas d'imprudence!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_4:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D5		; Bit 5	of flag	0x01A
		ScriptID    $366,$1	; Flag clear: Run text script at offset	0x027FE6
					; 0x7CB5: LOAD CUSTOM ACTION 0xB5 (0x1000002D3 CSA_00B5), MSGBOX CLEARED, END
		ScriptID    $367,$2	; Flag set:   Run text script at offset	0x027FE8
					; 0xE302: PRINT	MSG 0x0350, MSGBOX CLEARED, END: "{6A}...Montez	à l'étage...Et..{66}...  Cassez l'armure.....{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_5:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DE		; Bit 6	of flag	0x01B
		ScriptID    $368,$1	; Flag clear: Run text script at offset	0x027FEA
					; 0x8303: PRINT	MSG 0x0351: "{6A}Content de vous revoir!{66}Comme vous le voyez,{66}Je suis complètement guéri.{71}{6A}je ferai	de mon mieux{66}pour que Mercator soit une{66}ville digne de ses habitants!{71}{6A}Depuis un certain temps{66}je pense aux rapports qu'il{66}y a entre la politique et{71}{6A}la milice...J'en ai parlé{66}avec Julie, et je suis persuadé{66}
					;                            que cette vile peut connaître{71}{6A}la prospérité sans se{66}reposer sur une force{66}militaire!...  Ainsi,{71}{6A}j'ai fait construire un{66}casino dans le puits de la{66}ville, pour pouvoir diminuer{71}{6A}les impôts.  Allez-y, si{66}vous avez un peu de temps.{71}"
					; 0x0016: LOAD 0x0016 INTO 0xFF1196 (Ticket{79}Casino)
					; 0x17E8: RECEIVE ITEM [0xFF1196]
					; 0x181E: LOAD CHARACTER SCRIPT	Arthur (0x001E)
					; 0xE304: PRINT	MSG 0x0352, MSGBOX CLEARED, END: "{6A}Venez me voir quand vous{66}voulez!  Soyez prudent!{6D}"
		ScriptJump  CS_001E_6,$2 ; Flag	set:   Jump to address 0x026CDE
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_001E_6:
		move.w	#ITM_CASINOTICKET,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	CS_001E_7
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $36B,$0	; Run text script at offset 0x027FF0
					; 0x181E: LOAD CHARACTER SCRIPT	Arthur (0x001E)
					; 0xE304: PRINT	MSG 0x0352, MSGBOX CLEARED, END: "{6A}Venez me voir quand vous{66}voulez!  Soyez prudent!{6D}"
; ---------------------------------------------------------------------------
		bra.s	CS_001E_8
; ---------------------------------------------------------------------------

CS_001E_7:				; CODE XREF: ROM:00026CE6j
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $36D,$0	; Run text script at offset 0x027FF4
					; 0x8305: PRINT	MSG 0x0353: "{6A}Bonjour, Monsieur Ryle!{66}Voulez-vous	ceci?{71}"
					; 0x0016: LOAD 0x0016 INTO 0xFF1196 (Ticket{79}Casino)
					; 0x77E8: RECEIVE ITEM [0xFF1196], MSGBOX CLEARED, END
; ---------------------------------------------------------------------------

CS_001E_8:				; CODE XREF: ROM:00026CECj
		rts
; ---------------------------------------------------------------------------

CS_00EA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $A			; Params 00, 0A
		ScriptID    $2C0,$1	; Run text script at offset 0x027E9A
					; 0x7C39: LOAD CUSTOM ACTION 0x39 (0x1000000E3 CSA_0039), MSGBOX CLEARED, END
					;
		dc.w $C			; Params 00, 0C
		ScriptID    $4E8,$3	; Run text script at offset 0x0282EA
					; 0xE3ED: PRINT	MSG 0x043B, MSGBOX CLEARED, END: "{6A}Pas très honnête,{66}tout	ça...{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_001F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $2C1,$1	; Run text script at offset 0x027E9C
					; 0xE26B: PRINT	MSG 0x02B9, MSGBOX CLEARED, END: "{6A}J'ai amassé ma fortune{66}ici, et maintenant je{66}retourne sur le continent.{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2C2,$3	; Run text script at offset 0x027E9E
					; 0xE26C: PRINT	MSG 0x02BA, MSGBOX CLEARED, END: "{6A}J'ai mal choisi mon{66}moment...  Moi, je suis prêt{66}mais le bateau est coincé!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2C3,$5	; Run text script at offset 0x027EA0
					; 0xE26D: PRINT	MSG 0x02BB, MSGBOX CLEARED, END: "{6A}L'argent que j'ai mis{66}de côté ici me permettra{66}de lancer ma propre affaire.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00EB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $2C4,$1	; Run text script at offset 0x027EA2
					; 0xE26E: PRINT	MSG 0x02BC, MSGBOX CLEARED, END: "{6A}J'adore la mer!...{66}Un vent salé{66}me rend heureux!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2C5,$3	; Run text script at offset 0x027EA4
					; 0xE26F: PRINT	MSG 0x02BD, MSGBOX CLEARED, END: "{6A}Le duc de	Mercator est{66}monté à	bord avec une bande{66}de soldats que je n'avais{71}{6A}jamais vu!  Et dès qu'ils{66}avaient quitté le port, le{66}phare s'est éteint!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2C6,$5	; Run text script at offset 0x027EA6
					; 0x8270: PRINT	MSG 0x02BE: "{6A}Quel soulagement!{66}Voir le phare de nouveau{66}en marche, ça	fait du	bien!{71}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE271: PRINT	MSG 0x02BF, MSGBOX CLEARED, END: "{6A}Vous avez	trouvé{66}la {6E}?  Vraiment?{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00EC:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2C9,$0	; Run text script at offset 0x027EAC
					; 0xE272: PRINT	MSG 0x02C0, MSGBOX CLEARED, END: "{6A}On verra des choses{66}merveilleuses quand le{66}navire du continent{71}accostera!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00ED:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2CA,$0	; Run text script at offset 0x027EAE
					; 0xE273: PRINT	MSG 0x02C1, MSGBOX CLEARED, END: "{6A}Vous avez	vu la{66}princesse qui est descendue{66}à l'hôtel?  Elle est mignonne!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00EE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $2CB,$1	; Run text script at offset 0x027EB0
					; 0xE274: PRINT	MSG 0x02C2, MSGBOX CLEARED, END: "{6A}J'ai fini de décharger!{66}On ira faire la fête chez{66}Petit Pois ce soir.{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2CC,$3	; Run text script at offset 0x027EB2
					; 0xE275: PRINT	MSG 0x02C3, MSGBOX CLEARED, END: "{6A}Tant que le phare{6D}restera sans	lumière, le{66}navire restera dans le port!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2CD,$5	; Run text script at offset 0x027EB4
					; 0x7CD2: LOAD CUSTOM ACTION 0xD2 (0x100000347 CSA_00D2), MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00EF:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $2CE,$1	; Run text script at offset 0x027EB6
					; 0xE276: PRINT	MSG 0x02C4, MSGBOX CLEARED, END: "{6A}Je viens une fois	par{66}mois livrer des marchandises.{66}Nous autres marins, on a{71}{6A}besoin du phare	de{66}Ryuma, car l'île est{66}dans un brouillard épais.{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2CF,$3	; Run text script at offset 0x027EB8
					; 0xE277: PRINT	MSG 0x02C5, MSGBOX CLEARED, END: "{6A}Le phare est en panne!{66}Impossible de piloter!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2D0,$5	; Run text script at offset 0x027EBA
					; 0xE278: PRINT	MSG 0x02C6, MSGBOX CLEARED, END: "{6A}Le navire	va bientôt{66}quitter le port en direction{66}de Verla.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F0:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $2D1,$1	; Run text script at offset 0x027EBC
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0xE279: PRINT	MSG 0x02C7, MSGBOX CLEARED, END: "{6A}Levons l'ancre, yo-ho!{66}Voilà les flots, yo-ho!{66}Partons...  la-la...{71}{6A}Vous connaissez{66}cette chanson?  C'est le{66}numéro un de la semaine{71}{6A}sur le continent...{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2D3,$3	; Run text script at offset 0x027EC0
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0xE27A: PRINT	MSG 0x02C8, MSGBOX CLEARED, END: "{6A}Levons l'ancre, yo-ho!{66}On est coincé, yo-ho!{66}Je veux m'en aller, yo-ho!{71}{6A}Au lieu de chanter{66}on ferait mieux de pleurer!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2D5,$5	; Run text script at offset 0x027EC4
					; 0xE27B: PRINT	MSG 0x02C9, MSGBOX CLEARED, END: "{6A}Les impôts me saignent{66}à blanc.  Il faut les baisser!{66}Ce n'est pas compliqué!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F1:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_00F1_1,$1 ; Jump	to address 0x026D8A
					;
		dc.w $101		; Params 01, 01
		ScriptID    $2D6,$3	; Run text script at offset 0x027EC6
					; 0xE27C: PRINT	MSG 0x02CA, MSGBOX CLEARED, END: "{6A}Désolé.  Cet entrepôt{66}est réservé aux commerçants.{6D}"
					;
		dc.w $102		; Params 01, 02
		ScriptJump  CS_00F1_0,$5 ; Jump	to address 0x026D7E
					;
		dc.w $103		; Params 01, 03
		ScriptID    $2D9,$7	; Run text script at offset 0x027ECC
					; 0xE27E: PRINT	MSG 0x02CC, MSGBOX CLEARED, END: "{6A}A	la prochaine,{66}dans un mois!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F1_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $A5		; Bit 5	of flag	0x014
		ScriptID    $2D8,$1	; Flag set:   Run text script at offset	0x027ECA
					; 0xE27D: PRINT	MSG 0x02CB, MSGBOX CLEARED, END: "{6A}Entrez!  Promenez-vous{66}dans l'entrepôt.  Nous avons{66}toutes sortes de choses!{6D}"
		ScriptID    $2D7,$2	; Flag clear: Run text script at offset	0x027EC8
					; 0x7C6D: LOAD CUSTOM ACTION 0x6D (0x1000001B3 CSA_006D), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F1_1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $2DA,$0	; Prompt:	Run text script	at offset 0x027ECE
					; 0xA27F: PRINT	MSG 0x02CD, END: "{6A}Vous avez	entendu	pour{66}le Général Arthur?{67}"
		ScriptID    $2DB,$1	; Answer 'yes': Run text script at offset 0x027ED0
					; 0xE280: PRINT	MSG 0x02CE, MSGBOX CLEARED, END: "{6A}Il a été grièvement{66}blessé.  Il est sous{66}surveillance médicale{71}{6A}très stricte!	 je pense{66}qu'il ferait un très bon chef!{6D}"
		ScriptID    $2DC,$2	; Answer 'no':  Run text script at offset 0x027ED2
					; 0xE281: PRINT	MSG 0x02CF, MSGBOX CLEARED, END: "{6A}Il commande la Garde{66}Royale.  Son premier devoir{66}est de déjouer le complot{71}{6A}du duc!  Arthur a	été{66}blessé.	Il est sous une{66}stricte surveillance	médicale!{71}{6A}Je crois que le Général{66}Arthur fera	un excellent chef!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F2:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2DD,$0	; Run text script at offset 0x027ED4
					; 0xE282: PRINT	MSG 0x02D0, MSGBOX CLEARED, END: "{6A}Pensez-vous vous que ceux{66}qui achètent	100 EkeEke à la{66}fois	sont bêtes?  Moi aussi!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F3:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $2E6,$1	; Run text script at offset 0x027EE6
					; 0xE289: PRINT	MSG 0x02D7, MSGBOX CLEARED, END: "{6A}Récupérer	ce bracelet,{66}c'est la preuve qu'on est{66}digne d'entrer dans la tour!{6D}"
					;
		dc.w $16		; Params 00, 16
		ScriptID    $2E7,$3	; Run text script at offset 0x027EE8
					; 0xE28A: PRINT	MSG 0x02D8, MSGBOX CLEARED, END: "{6A}C'est le bracelet, alors?{66}Comme ça, vous avez bien{66}réussi!  Eh bien, dans ce cas,{71}{6A}vous êtes assez fort et{66}malin pour vous débarrasser{66}de Mir!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F4:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $A4		; Bit 4	of flag	0x014
		ScriptJump  CS_00F4_0,$1 ; Flag	set:   Jump to address 0x026DB6
		ScriptID    $2DE,$2	; Flag clear: Run text script at offset	0x027ED6
					; 0x7C6A: LOAD CUSTOM ACTION 0x6A (0x1000001A7 CSA_006A), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F4_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $D2		; Bit 2	of flag	0x01A
		ScriptID    $2E0,$1	; Flag set:   Run text script at offset	0x027EDA
					; 0xE284: PRINT	MSG 0x02D2, MSGBOX CLEARED, END: "{6A}Le propriétaire ici{66}se	nomme Petit Pois.{6D}"
		ScriptID    $2DF,$2	; Flag clear: Run text script at offset	0x027ED8
					; 0xE283: PRINT	MSG 0x02D1, MSGBOX CLEARED, END: "{6A}Le jeu, c'est comme une{66}drogue!  On y goûte, puis{66}on est vite accroché!...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F5:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $2E1,$1	; Run text script at offset 0x027EDC
					; 0xE285: PRINT	MSG 0x02D3, MSGBOX CLEARED, END: "{6A}Je suis le capitaine du{66}vaisseau.  A terre, je	suis{66}comme n'importe qui...  Mais{71}{6A}en mer, je suis le roi!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2E2,$3	; Run text script at offset 0x027EDE
					; 0xE286: PRINT	MSG 0x02D4, MSGBOX CLEARED, END: "{6A}Quand le phare sera{66}réparé, je	pourrai	reprendre{66}ma	vie de capitaine...{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptID    $2E3,$5	; Run text script at offset 0x027EE0
					; 0x17EB: PLAY MUSIC TRACK 14
					; 0xE287: PRINT	MSG 0x02D5, MSGBOX CLEARED, END: "{6A}Ohé, l'ami!  Vous êtes au{66}courant?  Le phare a été{66}réparé.  Je suis de nouveau{71}{6A}capitaine!  Ho ho ho!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F6:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2E5,$0	; Run text script at offset 0x027EE4
					; 0xE288: PRINT	MSG 0x02D6, MSGBOX CLEARED, END: "{6A}Ce squelette a tué bon{66}nombre de mes amis...{66}Je les	venge!{71}{6A}S'il n'était pas dans{66}cette cellule, je ne pourrais{66}jamais le battre!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0020:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $217,$0	; Run text script at offset 0x027D48
					; 0xE1D4: PRINT	MSG 0x0222, MSGBOX CLEARED, END: "{6A}Bonjour.	Je m'appelle{66}June.  Je suis l'amie de Fahl.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F7:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $14		; Params 00, 14
		ScriptID    $2E8,$1	; Run text script at offset 0x027EEA
					; 0xE28B: PRINT	MSG 0x02D9, MSGBOX CLEARED, END: "{6A}Vos achats, ainsi	que la{66}facture, seront expédiés à{66}votre magasin.	Merci!{6D}"
					;
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_00F7_0,$3 ; Jump	to address 0x026DEE
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F7_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $D9		; Bit 1	of flag	0x01B
		ScriptID    $696,$1	; Flag set:   Run text script at offset	0x028646
					; 0x18F7: LOAD CHARACTER SCRIPT	* (0x00F7)
					; 0xE4CA: PRINT	MSG 0x0518, MSGBOX CLEARED, END: "{6A}Ryle, ça va?  Vous{66}n'avez pas le pied marin?{66}Ne vomissez pas sur mon{71}{6A}beau pont tout propre!{6D}"
		ScriptID    $2E9,$2	; Flag clear: Run text script at offset	0x027EEC
					; 0x7CD1: LOAD CUSTOM ACTION 0xD1 (0x100000343 CSA_00D1), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F8:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2EA,$0	; Run text script at offset 0x027EEE
					; 0xE28C: PRINT	MSG 0x02DA, MSGBOX CLEARED, END: "{6A}Ici, c'est l'embarcadère{66}privé du duc de Mercator.{66}L'accès vous en est interdit.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F9:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $F			; Params 00, 0F
		ScriptID    $2EB,$1	; Run text script at offset 0x027EF0
					; 0xE28D: PRINT	MSG 0x02DB, MSGBOX CLEARED, END: "{6A}Bienvenue	au château{66}de Mercator!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptJump  CS_00F9_0,$3 ; Jump	to address 0x026E1E
					;
		dc.w $17		; Params 00, 17
		ScriptID    $2EE,$5	; Run text script at offset 0x027EF6
					; 0xE290: PRINT	MSG 0x02DE, MSGBOX CLEARED, END: "{6A}Ryle!  Vous êtes de{66}retour!  La déesse	a{66}entendu ma	prière!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptJump  CS_00F9_1,$7 ; Jump	to address 0x026E2A
					;
		dc.w $19		; Params 00, 19
		ScriptID    $2F1,$9	; Run text script at offset 0x027EFC
					; 0xE293: PRINT	MSG 0x02E1, MSGBOX CLEARED, END: "{6A}Tous les autres soldats{66}sont partis avec le duc, je ne{66}sais	pas où...{71}{6A}Il ne reste que moi...{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2F2,$B	; Run text script at offset 0x027EFE
					; 0xE294: PRINT	MSG 0x02E2, MSGBOX CLEARED, END: "{6A}Je ne suis pas fait pour{66}être soldat.	Dorénavant,{66}J'aiderai le Général Arthur.{71}{6A}Soyez prudent!{71}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00F9_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D4		; Bit 4	of flag	0x01A
		ScriptID    $2EC,$1	; Flag clear: Run text script at offset	0x027EF2
					; 0xE28E: PRINT	MSG 0x02DC, MSGBOX CLEARED, END: "{6A}Ryle!  Je	vous{66}admire beaucoup!  Vous{66}êtes mon idole!{71}{6A}Je vous le{66}demande...  Revenez{66}sain et sauf!  Je	prierai!{6D}"
		ScriptID    $2ED,$2	; Flag set:   Run text script at offset	0x027EF4
					; 0xE28F: PRINT	MSG 0x02DD, MSGBOX CLEARED, END: "{6A}Revenez sain {66}et sauf!{66}Je prierai pour vous!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00F9_1:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E8		; Bit 0	of flag	0x01D
		ScriptID    $2EF,$1	; Flag clear: Run text script at offset	0x027EF8
					; 0xE291: PRINT	MSG 0x02DF, MSGBOX CLEARED, END: "{6A}Ryle!{66}Je vous croyais...{66}Le	duc, en	compagnie{71}{6A}d'une bande de{66}soldats bizarres en armure,{66}a soudain...{6D}"
		ScriptID    $2F0,$2	; Flag set:   Run text script at offset	0x027EFA
					; 0xE292: PRINT	MSG 0x02E0, MSGBOX CLEARED, END: "{6A}Affreux...!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00FA:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $F			; Params 00, 0F
		ScriptID    $2F3,$1	; Run text script at offset 0x027F00
					; 0xE295: PRINT	MSG 0x02E3, MSGBOX CLEARED, END: "{6A}Elle est belle, la cour,{66}non?	Le jardinier doit être{66}drôlement doué...{71}{6A}Ca vous plairait de{66}faire	sa connaissance?{66}Eh bien, c'est moi!  Hé hé.{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2F4,$3	; Run text script at offset 0x027F02
					; 0xE296: PRINT	MSG 0x02E4, MSGBOX CLEARED, END: "{6A}Pourquoi le roi Orc{66}a-t-il traversé la	route?{71}{6A}Pour manger le poulet{66}d'en face!  C'est marrant,{66}non?  Hé hé.{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $2F5,$5	; Run text script at offset 0x027F04
					; 0xE297: PRINT	MSG 0x02E5, MSGBOX CLEARED, END: "{6A}Maintenant ils vont {66}baisser les impôts et{66}peut-être même que{71}{6A}j'aurai droit à une{66}augmentation, hein?{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2F6,$7	; Run text script at offset 0x027F06
					; 0xE298: PRINT	MSG 0x02E6, MSGBOX CLEARED, END: "{6A}Bizarre!	Il y avait{66}des monstres, comme des{66}soldats, qui suivaient	le duc!{71}{6A}C'est pas normal, ça!{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $2F7,$9	; Run text script at offset 0x027F08
					; 0xE299: PRINT	MSG 0x02E7, MSGBOX CLEARED, END: "{6A}Peu m'importe à qui{66}appartient le château...  Moi,{66}je serai toujours jardinier{71}{6A}de cette cour...{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FB:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $F			; Params 00, 0F
		ScriptID    $2FA,$1	; Run text script at offset 0x027F0E
					; 0xE29C: PRINT	MSG 0x02EA, MSGBOX CLEARED, END: "{6A}Mais c'est la porte de{66}la cuisine, ça!  Un invité de{66}marque tel que vous se{71}{6A}doit de passer par la{66}grande porte d'entrée!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $2FB,$3	; Run text script at offset 0x027F10
					; 0xE29D: PRINT	MSG 0x02EB, MSGBOX CLEARED, END: "{6A}La-la-la-lère...{66}Pourquoi suis-je heureux?{66}Je nettoyais dans le jardin,{71}{6A}et j'ai vu ce beau peigne{66}à cheveux sur le sol!{66}Trés précieux! Quelle chance!!{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $2FC,$5	; Run text script at offset 0x027F12
					; 0xE29E: PRINT	MSG 0x02EC, MSGBOX CLEARED, END: "{6A}Cette porte n'est pas{66}digne d'un héros!  Que{66}Monsieur se donne la peine{71}{6A}d'entrer par la grande{66}porte de devant!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $2FD,$7	; Run text script at offset 0x027F14
					; 0xE29F: PRINT	MSG 0x02ED, MSGBOX CLEARED, END: "{6A}Des soldats étranges en{66}armure	ont pénétré dans{66}le château...  le Général{71}{6A}Arthur les	combat{66}seul!	 Aidez-le...  VITE!!{6D}"
					;
		dc.w $19		; Params 00, 19
		ScriptID    $2FE,$9	; Run text script at offset 0x027F16
					; 0xE2A0: PRINT	MSG 0x02EE, MSGBOX CLEARED, END: "{6A}Où le duc	est-il parti?{66}Que va-t-il faire?{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FC:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $2FF,$1	; Run text script at offset 0x027F18
					; 0xE2A1: PRINT	MSG 0x02EF, MSGBOX CLEARED, END: "{6A}La fête commencera{66}dans très peu de temps.{66}Visitez le château, si{71}{6A}vous le désirez...{6D}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $300,$3	; Run text script at offset 0x027F1A
					; 0xE2A2: PRINT	MSG 0x02F0, MSGBOX CLEARED, END: "{6A}M.  Ryle,	la Fête	va{66}commencer	dans la	salle{66}des banquets, au premier.{6D}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $301,$5	; Run text script at offset 0x027F1C
					; 0xE2A3: PRINT	MSG 0x02F1, MSGBOX CLEARED, END: "{6A}Vous ne pouvez pas{66}sortir...  Il commence à{71}{6A}faire nuit!	 Pour votre{66}sécurité, veuillez vous{66}reposer dans votre chambre.{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $302,$7	; Run text script at offset 0x027F1E
					; 0xE2A4: PRINT	MSG 0x02F2, MSGBOX CLEARED, END: "{6A}Mir pose des problémes{66}au duc et à cette ville{66}Liquidez-le pour nous!{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $303,$9	; Run text script at offset 0x027F20
					; 0xE2A5: PRINT	MSG 0x02F3, MSGBOX CLEARED, END: "{6A}Content de vous revoir!{66}Veuillez monter voir le duc.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FD:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $304,$1	; Run text script at offset 0x027F22
					; 0xE2A6: PRINT	MSG 0x02F4, MSGBOX CLEARED, END: "{6A}Vous ne pouvez pas{66}sortir aujourd'hui.{6D}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $305,$3	; Run text script at offset 0x027F24
					; 0xE2A7: PRINT	MSG 0x02F5, MSGBOX CLEARED, END: "{6A}Tout est prêt!{66}Veuillez monter	à la{66}salle des banquets.{6D}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $306,$5	; Run text script at offset 0x027F26
					; 0xE2A8: PRINT	MSG 0x02F6, MSGBOX CLEARED, END: "{6A}Vous ne pouvez pas sortir{66}aujourd'hui.  Veuillez{66}garder votre chambre.{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $307,$7	; Run text script at offset 0x027F28
					; 0xE2A9: PRINT	MSG 0x02F7, MSGBOX CLEARED, END: "{6A}Revenez sain et sauf!{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $308,$9	; Run text script at offset 0x027F2A
					; 0xE2AA: PRINT	MSG 0x02F8, MSGBOX CLEARED, END: "{6A}Le duc de	Mercator{66}vous attend...{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FE:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $309,$1	; Run text script at offset 0x027F2C
					; 0xE2AB: PRINT	MSG 0x02F9, MSGBOX CLEARED, END: "{6A}Des salles{66}d'entraînement pour{66}les soldats.{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptJump  CS_00FE_0,$3 ; Jump	to address 0x026EAC
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_00FE_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $A1		; Bit 1	of flag	0x014
		ScriptID    $30A,$1	; Flag set:   Run text script at offset	0x027F2E
					; 0xE2AC: PRINT	MSG 0x02FA, MSGBOX CLEARED, END: "{6A}Pardonnez-nous,{66}Monsieur!  Les	nouveaux{66}employés manquent parfois{71}{6A}de	respect	envers{66}leurs	supérieurs...{6D}"
		ScriptID    $309,$2	; Flag clear: Run text script at offset	0x027F2C
					; 0xE2AB: PRINT	MSG 0x02F9, MSGBOX CLEARED, END: "{6A}Des salles{66}d'entraînement pour{66}les soldats.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_00FF:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CB		; Bit 3	of flag	0x019
		ScriptID    $30B,$1	; Flag clear: Run text script at offset	0x027F30
					; 0xE2AD: PRINT	MSG 0x02FB, MSGBOX CLEARED, END: "{6A}Travailler ici me{66}permet de voir l'aristocratie{66}de plusieurs pays...{71}{6A}Récemment, j'ai vu{66}la belle princesse Lara de{66}Maple...  Quelle grâce!{71}{6A}Mais, depuis...{66}...  Rien!{6D}"
		ScriptID    $30C,$2	; Flag set:   Run text script at offset	0x027F32
					; 0xE2AE: PRINT	MSG 0x02FC, MSGBOX CLEARED, END: "{6A}Nous ne devons pas{66}parler avec	les invités.{66}Excusez-moi...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0100:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptJump  CS_0100_0,$1 ; Jump	to address 0x026ED2
					;
		dc.w $12		; Params 00, 12
		ScriptID    $30F,$3	; Run text script at offset 0x027F38
					; 0xE2B1: PRINT	MSG 0x02FF, MSGBOX CLEARED, END: "{6A}Quelle surprise!	M.  Zak,{66}le droguiste, disait qu'il{66}désirait acheter celui-ci!{71}{6A}Un chasseur de{66}primes, ça gagne bien{66}sa vie, on dirait...{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0100_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CC		; Bit 4	of flag	0x019
		ScriptID    $30D,$1	; Flag clear: Run text script at offset	0x027F34
					; 0xE2AF: PRINT	MSG 0x02FD, MSGBOX CLEARED, END: "{6A}Les tableaux et les{66}objets dans ce château ont{66}une grande valeur{71}{6A}historique!	 Ce{66}tableau est de Van Dogh.{66}Si vous y tenez absolument,{71}{6A}je suis persuadé que{66}le duc vos le laisserait pour,{66}disons,	50 000 Ors.{6D}"
		ScriptID    $30E,$2	; Flag set:   Run text script at offset	0x027F36
					; 0xE2B0: PRINT	MSG 0x02FE, MSGBOX CLEARED, END: "{6A}Le duc est un{66}grand collectioneur!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0101:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $310,$1	; Run text script at offset 0x027F3A
					; 0xE2B2: PRINT	MSG 0x0300, MSGBOX CLEARED, END: "{6A}Ce manoir	est si vaste,{66}il me faut une	journéé{66}entière pour	laver les murs.{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $311,$3	; Run text script at offset 0x027F3C
					; 0xE2B3: PRINT	MSG 0x0301, MSGBOX CLEARED, END: "{6A}Laver les	murs, c'est un{66}travail épuisant, croyez-moi.{66}Voilà pourquoi je vais me{71}reposer aujourd'hui!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0102:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $10		; Params 00, 10
		ScriptID    $312,$1	; Run text script at offset 0x027F3E
					; 0x7C50: LOAD CUSTOM ACTION 0x50 (0x10000013F CSA_0050), MSGBOX CLEARED, END
					;
		dc.w $14		; Params 00, 14
		ScriptID    $313,$3	; Run text script at offset 0x027F40
					; 0xE2B4: PRINT	MSG 0x0302, MSGBOX CLEARED, END: "{6A}M.  Dexter?  Non,	je ne{66}sais pas où il	se trouve.{66}Il était déjà parti quand	je{71}{6A}suis arrivée pour{66}nettoyer	sa chambre.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0103:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $314,$0	; Run text script at offset 0x027F42
					; 0xE2B5: PRINT	MSG 0x0303, MSGBOX CLEARED, END: "{6A}Voilà notre servante!{66}Elle vous indiquera votre{66}chambre.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0021:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $10		; Params 00, 10
		ScriptJump  CS_0021_0,$1 ; Jump	to address 0x026F0E
					;
		dc.w $13		; Params 00, 13
		ScriptID    $317,$3	; Run text script at offset 0x027F48
					; 0xE2B8: PRINT	MSG 0x0306, MSGBOX CLEARED, END: "{6A}Une barrière bloque tout{66}accès	à la tour de Mir.{66}Je	pense que le général{71}{6A}Arthur a trouvé un{66}moyen	pour passer!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0021_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CA		; Bit 2	of flag	0x019
		ScriptID    $315,$1	; Flag clear: Run text script at offset	0x027F44
					; 0x82B6: PRINT	MSG 0x0304: "{6A}Un sorcier maléfique{66}tourmente le duc de{66}Mercator.  Le duc évite	la{71}{6A}confrontation	directe,{66}pour épargner le peuple,{66}mais on	vous en	parlera{71}{6A}lors du dîner.{71}"
					; 0xE2B7: PRINT	MSG 0x0305, MSGBOX CLEARED, END: "{6A}Il faut vous reposer.{6D}"
		ScriptID    $316,$2	; Flag set:   Run text script at offset	0x027F46
					; 0xE2B7: PRINT	MSG 0x0305, MSGBOX CLEARED, END: "{6A}Il faut vous reposer.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0104:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $322,$1	; Run text script at offset 0x027F5E
					; 0xE2C2: PRINT	MSG 0x0310, MSGBOX CLEARED, END: "{6A}Je suis fier de mon{66}travail!{6D}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $323,$3	; Run text script at offset 0x027F60
					; 0xE2C3: PRINT	MSG 0x0311, MSGBOX CLEARED, END: "{6A}Ryle, veuillez aller{66}à	la salle des banquets...{6D}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $324,$5	; Run text script at offset 0x027F62
					; 0xE2C4: PRINT	MSG 0x0312, MSGBOX CLEARED, END: "{6A}Je suis fier de mon{66}travail!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $325,$7	; Run text script at offset 0x027F64
					; 0xE2C5: PRINT	MSG 0x0313, MSGBOX CLEARED, END: "{6A}Bonjour, M.  Ryle!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0105:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $326,$1	; Run text script at offset 0x027F66
					; 0xE2C6: PRINT	MSG 0x0314, MSGBOX CLEARED, END: "{6A}On s'occupe souvent de{66}personnages importants.{66}Ca m'énerve à force.{6D}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $327,$3	; Run text script at offset 0x027F68
					; 0xE2C7: PRINT	MSG 0x0315, MSGBOX CLEARED, END: "{6A}Amusez-vous à la fête!{6D}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $328,$5	; Run text script at offset 0x027F6A
					; 0xE2C8: PRINT	MSG 0x0316, MSGBOX CLEARED, END: "{6A}On s'occupe tous les{66}jours de personnes importantes{66}Ca me tape sur les nerfs...{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $329,$7	; Run text script at offset 0x027F6C
					; 0xE2C9: PRINT	MSG 0x0317, MSGBOX CLEARED, END: "{6A}M.  Zak et M.  Dexter sont{66}partis tôt ce matin.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0106:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $32A,$1	; Run text script at offset 0x027F6E
					; 0xE2CA: PRINT	MSG 0x0318, MSGBOX CLEARED, END: "{6A}Désolé, mais nous	sommes{66}occupés à préparer la	fête.{6D}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $32B,$3	; Run text script at offset 0x027F70
					; 0xE2CB: PRINT	MSG 0x0319, MSGBOX CLEARED, END: "{6A}Tout le monde attend.{66}Entrez.{6D}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $32C,$5	; Run text script at offset 0x027F72
					; 0xE2CC: PRINT	MSG 0x031A, MSGBOX CLEARED, END: "{6A}Je regrette, mais	le{66}duc de Mercator s'est{66}couché.  Il ne se sentait{71}{6A}pas très bien...{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $32D,$7	; Run text script at offset 0x027F74
					; 0xE2CD: PRINT	MSG 0x031B, MSGBOX CLEARED, END: "{6A}M.  Zak est parti{66}il y	a un certain temps...{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0107:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $32E,$1	; Run text script at offset 0x027F76
					; 0xE2CE: PRINT	MSG 0x031C, MSGBOX CLEARED, END: "{6A}Ouah!  Ouah!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $32F,$3	; Run text script at offset 0x027F78
					; 0xE2CF: PRINT	MSG 0x031D, MSGBOX CLEARED, END: "{6A}Ouaf!  Ouaf!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0108:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $330,$1	; Run text script at offset 0x027F7A
					; 0xE2D0: PRINT	MSG 0x031E, MSGBOX CLEARED, END: "{6A}Je suis de la Garde{66}Royale du duc.  Je	protége{66}le duc au péril de ma vie!{6D}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $331,$3	; Run text script at offset 0x027F7C
					; 0xE2D1: PRINT	MSG 0x031F, MSGBOX CLEARED, END: "{6A}Le duc est un gentleman,{66}mais un peu inquiet...{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $332,$5	; Run text script at offset 0x027F7E
					; 0xE2D2: PRINT	MSG 0x0320, MSGBOX CLEARED, END: "{6A}On dit que personne{66}n'est sorti vivant de la tour!{6D}Faites très attention!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0109:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $333,$1	; Run text script at offset 0x027F80
					; 0xE2D3: PRINT	MSG 0x0321, MSGBOX CLEARED, END: "{6A}Je suis la bonne du duc.{66}S'il vous faut quelque chose,{66}appelez une autre servante.{6D}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $334,$3	; Run text script at offset 0x027F82
					; 0xE2D4: PRINT	MSG 0x0322, MSGBOX CLEARED, END: "{6A}Il est l'heure du dîner.{66}La salle des banquets{66}se trouve au premier.{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $335,$5	; Run text script at offset 0x027F84
					; 0xE2D5: PRINT	MSG 0x0323, MSGBOX CLEARED, END: "{6A}Le duc de	Mercator est{66}sorti pour l'instant.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $336,$1	; Run text script at offset 0x027F86
					; 0xE2D6: PRINT	MSG 0x0324, MSGBOX CLEARED, END: "{6A}Voici la bibliothèque.{66}Je ne suis vraiment{66}heureux que lorsque{71}{6A}je suis entouré de{66}livres!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $337,$3	; Run text script at offset 0x027F88
					; 0xE2D7: PRINT	MSG 0x0325, MSGBOX CLEARED, END: "{6A}Il est quasi impossible{66}de pénétrer dans la tour{66}de	Mir.  La barrière est{71}{6A}infranchissable!{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $338,$5	; Run text script at offset 0x027F8A
					; 0xE2D8: PRINT	MSG 0x0326, MSGBOX CLEARED, END: "{6A}J'ai été surpris de voir{66}deux monstres répugnants{66}qui suivaient une belle fille{71}{6A}sortant d'un{66}sous-sol.  Qui étaient-ils?  {66}Que faisaient-ils là-bas?{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010B:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $339,$1	; Run text script at offset 0x027F8C
					; 0xE2D9: PRINT	MSG 0x0327, MSGBOX CLEARED, END: "{6A}Hé, petit!  Vous débutez?{66}On a	un banquet ce soir!{66}alors, remuez-vous!{71}{6A}Oh, vous êtes	un{66}invité!...  Aïe aïe...  euh...{66}Je vous	demande	pardon.{6D}"
					;
		dc.w $12		; Params 00, 12
		ScriptID    $33A,$3	; Run text script at offset 0x027F8E
					; 0xE2DA: PRINT	MSG 0x0328, MSGBOX CLEARED, END: "{6A}Je suis épuisé!{66}Servir	un banquet, c'est{66}pas de la tarte!{6D}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $33B,$5	; Run text script at offset 0x027F90
					; 0xE2DB: PRINT	MSG 0x0329, MSGBOX CLEARED, END: "{6A}Hips!...	Ouh la la...{66}Ce vin,	il lui manque...{66}Euh...  hips...  rien!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $33C,$1	; Run text script at offset 0x027F92
					; 0xE2DC: PRINT	MSG 0x032A, MSGBOX CLEARED, END: "{6A}Elle ne pense qu'à elle!{66}Elle m'a dit 'Je suis au{66}régime, alors attention...{71}{6A}Pas de viande, ni de{66}poisson!' Je ne l'aime pas!{66}Mais, c'est une invitée...{6D}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $33D,$3	; Run text script at offset 0x027F94
					; 0xE2DD: PRINT	MSG 0x032B, MSGBOX CLEARED, END: "{6A}Elle m'énerve, celle-là!{66}Elle laisse sa chambre dans{66}un état épouvantable!{71}{6A}Et la salle de bains!!{66}Jamais je n'ai vu une chipie{66}pareille!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $33E,$5	; Run text script at offset 0x027F96
					; 0xE2DE: PRINT	MSG 0x032C, MSGBOX CLEARED, END: "{6A}Il nous est interdit de{66}parler	aux invités.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010D:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $33F,$1	; Run text script at offset 0x027F98
					; 0xE2DF: PRINT	MSG 0x032D, MSGBOX CLEARED, END: "{6A}Nous, on a droit aux{66}restes, une fois le banquet{66}fini.{71}{6A}C'est notre seul petit{66}plaisir dans ce travail...{6D}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $340,$3	; Run text script at offset 0x027F9A
					; 0xE2E0: PRINT	MSG 0x032E, MSGBOX CLEARED, END: "{6A}Y	a des restes là-dedans?{66}Voilà une bonne nouvelle!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $341,$5	; Run text script at offset 0x027F9C
					; 0xE2E1: PRINT	MSG 0x032F, MSGBOX CLEARED, END: "{6A}Je suis repu!{66}Vous avez vu ce rosbif?{71}{6A}J'ai trop mangé, là.{66}Plus jamais ça!  Il y a un{66}un autre banquet de prévu?{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptJump  CS_010E_0,$1 ; Jump	to address 0x026FE8
					;
		dc.w $12		; Params 00, 12
		ScriptID    $344,$3	; Run text script at offset 0x027FA2
					; 0xE2E4: PRINT	MSG 0x0332, MSGBOX CLEARED, END: "{6A}Je fais la pause depuis{66}dix heures ce matin!{66}Hé hé hé hé....{6D}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $345,$5	; Run text script at offset 0x027FA4
					; 0xE2E5: PRINT	MSG 0x0333, MSGBOX CLEARED, END: "{6A}Comment?	La fête	est{66}finie?  Aaah, la	pause!!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_010E_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $CD		; Bit 5	of flag	0x019
		ScriptID    $342,$1	; Flag clear: Run text script at offset	0x027F9E
					; 0xE2E2: PRINT	MSG 0x0330, MSGBOX CLEARED, END: "{6A}Oh, pardon!  Je suis...{66}Mais qui êtes-vous?  je{66}vous avais pris pour{71}{6A}mon patron.  Il{66}n'arrête pas de me{66}gronder...{6D}"
		ScriptID    $343,$2	; Flag set:   Run text script at offset	0x027FA0
					; 0xE2E3: PRINT	MSG 0x0331, MSGBOX CLEARED, END: "{6A}Je fais la pause,	là...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_010F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $346,$1	; Run text script at offset 0x027FA6
					; 0xE2E6: PRINT	MSG 0x0334, MSGBOX CLEARED, END: "{6A}Ce ragoût	doit être{66}fameux!  Ca fait trois jours{66}qu'il mijote!{6D}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $347,$3	; Run text script at offset 0x027FA8
					; 0xE2E7: PRINT	MSG 0x0335, MSGBOX CLEARED, END: "{6A}Les banquets me donnent{66}l'occasion de montrer mes{66}dons de cuisinier!{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $348,$5	; Run text script at offset 0x027FAA
					; 0xE2E8: PRINT	MSG 0x0336, MSGBOX CLEARED, END: "{6A}Je suis déçu de voir{66}que peu de gens ont{66}terminé leur assiette!{71}{6A}Que s'est-il passé{66}là-dedans?{6D}"
					;
		dc.w $18		; Params 00, 18
		ScriptID    $349,$7	; Run text script at offset 0x027FAC
					; 0xE2E9: PRINT	MSG 0x0337, MSGBOX CLEARED, END: "{6A}Quand est-ce que le duc{66}va revenir?  Je dois mettre{66}au point le menu du dîner!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0110:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $34A,$1	; Run text script at offset 0x027FAE
					; 0xE2EA: PRINT	MSG 0x0338, MSGBOX CLEARED, END: "{6A}Nous servons des{66}homards de Gamoor frits,{66}ainsi que	des coquilles{71}{6A}Saint-Jacques.  Le{66}duc a un faible pour	les{66}fruits de mer!{6D}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $34B,$3	; Run text script at offset 0x027FB0
					; 0xE2EB: PRINT	MSG 0x0339, MSGBOX CLEARED, END: "{6A}Comment était ce dîner?{66}Le menu était superbe,	hein?{71}{6A}Comme j'aurais aimé{66}y être...  Comment!  Vous{66}n'avez rien mangé??{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0111:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $34C,$1	; Run text script at offset 0x027FB2
					; 0xE2EC: PRINT	MSG 0x033A, MSGBOX CLEARED, END: "{6A}M.  Zak ne mange que de{66}la viande crue?  Je ne	le{66}savais pas!...{6D}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $34D,$3	; Run text script at offset 0x027FB4
					; 0xE2ED: PRINT	MSG 0x033B, MSGBOX CLEARED, END: "{6A}M.  Zak a	aimé les{66}homards frits?{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0112:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptJump  CS_0112_0,$1 ; Jump	to address 0x027038
					;
		dc.w $12		; Params 00, 12
		ScriptID    $352,$3	; Run text script at offset 0x027FBE
					; 0xE2F0: PRINT	MSG 0x033E, MSGBOX CLEARED, END: "{6A}Veuillez passer à	la{66}salle de banquets.  C'est au{66}premier étage.{6D}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $353,$5	; Run text script at offset 0x027FC0
					; 0xE2F1: PRINT	MSG 0x033F, MSGBOX CLEARED, END: "{6A}Vous ne pouvez pas{66}partir pour	l'instant...{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0112_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $CE		; Bit 6	of flag	0x019
		ScriptID    $350,$1	; Flag set:   Run text script at offset	0x027FBA
					; 0x1493: SET BIT 3 OF FLAG 0x012
					; 0xE2EF: PRINT	MSG 0x033D, MSGBOX CLEARED, END: "{6A}M.  Ryle!	 La fête {66}commence.	Veuillez passer{66}à la	salle des banquets.{6D}"
		ScriptID    $34E,$2	; Flag clear: Run text script at offset	0x027FB6
					; 0x14DB: SET BIT 3 OF FLAG 0x01B
					; 0xE2EE: PRINT	MSG 0x033C, MSGBOX CLEARED, END: "{6A}Vous avez	inspecté{66}le château?{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0113:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $354,$0	; Run text script at offset 0x027FC2
					; 0xE2F2: PRINT	MSG 0x0340, MSGBOX CLEARED, END: "{6A}Il y a très longtemps,{66}lors d'une guerre sur le{66}continent, le roi Nole se{71}{6A}servait de cette île{66}comme base.  Après la{66}guerre, les forteresses et{71}{6A}les labyrinthes ont été{66}abandonnés.  Mais beaucoup{66}d'entre eux existent encore!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0114:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $355,$0	; Run text script at offset 0x027FC4
					; 0xE2F3: PRINT	MSG 0x0341, MSGBOX CLEARED, END: "{6A}Le Sorcier Sombre	de la{66}tour est rusé...  La tour est{66}un labyrinthe	à étages!{71}{6A}Il y a	également une{66}barrière pour empêcher{66}à tout intrus d'y entrer!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0115:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $356,$0	; Run text script at offset 0x027FC6
					; 0xE2F4: PRINT	MSG 0x0342, MSGBOX CLEARED, END: "{6A}J'ai touché une prime!{66}Vous voulez m'accompagner{66}chez Petit Pois?  Je vais jouer!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0116:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $11		; Params 00, 11
		ScriptID    $357,$1	; Run text script at offset 0x027FC8
					; 0xE2F5: PRINT	MSG 0x0343, MSGBOX CLEARED, END: "{6A}Oh, pardon!{66}On	vous avait pris	pour{66}un de nos soldats!  On vous{71}{6A}a fait peur?	 Nous{66}devons	étudier	de nouvelles{66}tactiques tous les jours!{6D}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $358,$3	; Run text script at offset 0x027FCA
					; 0xE2F6: PRINT	MSG 0x0344, MSGBOX CLEARED, END: "{6A}Les autres soldats{66}font leur ronde dehors.{6D}"
					;
		dc.w $14		; Params 00, 14
		ScriptID    $359,$5	; Run text script at offset 0x027FCC
					; 0xE2F7: PRINT	MSG 0x0345, MSGBOX CLEARED, END: "{6A}Tout le monde est	à{66}à l'entraînement.  Moi?{71}{6A}Je...  euh...  surveille!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0117:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $35A,$0	; Run text script at offset 0x027FCE
					; 0xE2F8: PRINT	MSG 0x0346, MSGBOX CLEARED, END: "{6A}C'est la plus récente{66}formation!  Vous l'aimez?{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0118:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $35B,$0	; Run text script at offset 0x027FD0
					; 0xE2F9: PRINT	MSG 0x0347, MSGBOX CLEARED, END: "{6A}Nous nous	sommes{66}inspirés du déplacement{66}de	quelques monstres qu'on{71}{6A}a vus dans un grotte.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0119:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $35C,$0	; Run text script at offset 0x027FD2
					; 0xE2FA: PRINT	MSG 0x0348, MSGBOX CLEARED, END: "{6A}N'intervenez pas!{66}Ce n'est que de{66}l'entraînement, mais je{71}{6A}dois quand même{66}me concentrer!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011A:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $35D,$0	; Run text script at offset 0x027FD4
					; 0xE2FB: PRINT	MSG 0x0349, MSGBOX CLEARED, END: "{6A}Dégagez, petit!{66}C'est du sérieux!  J'ai{66}60 Ors engagés dans{71}{6A}cette bagarre!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011B:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2F8,$0	; Run text script at offset 0x027F0A
					; 0xE29A: PRINT	MSG 0x02E8, MSGBOX CLEARED, END: "{6A}Co-coricoooo!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011C:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $2F9,$0	; Run text script at offset 0x027F0C
					; 0xE29B: PRINT	MSG 0x02E9, MSGBOX CLEARED, END: "{6A}Co-co- ri-co-co!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011D:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $370,$0	; Run text script at offset 0x027FFA
					; 0xE306: PRINT	MSG 0x0354, MSGBOX CLEARED, END: "{6A}Cette chambre est	réser-{66}vée à	certains invités...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0022:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $17	; Params 00, 17
		ScriptID    $37B,$1	; Run text script at offset 0x028010
					; 0x7CA5: LOAD CUSTOM ACTION 0xA5 (0x100000293 CSA_00A5), MSGBOX CLEARED, END
					;
		dc.w $18		; Params 00, 18
		ScriptID    $5FD,$3	; Run text script at offset 0x028514
					; 0xE47E: PRINT	MSG 0x04CC, MSGBOX CLEARED, END: "{6A}Je vous le demande...{66}Libérez la princesse!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_011E:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D0		; Bit 0	of flag	0x01A
		ScriptID    $37C,$1	; Flag clear: Run text script at offset	0x028012
					; 0x8310: PRINT	MSG 0x035E: "{6A}Traîner dans ce sous-sol{66}m'a complètement épuisé!{66}Continuez, vous...{71}"
					; 0xE311: PRINT	MSG 0x035F, MSGBOX CLEARED, END: "{6A}Vous devez sauver	la{66}princesse.  Le duc tient Lara{66}prisonnière...  Trouvez-la!{6D}"
		ScriptID    $37D,$2	; Flag set:   Run text script at offset	0x028014
					; 0xE311: PRINT	MSG 0x035F, MSGBOX CLEARED, END: "{6A}Vous devez sauver	la{66}princesse.  Le duc tient Lara{66}prisonnière...  Trouvez-la!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_011F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $394,$1	; Run text script at offset 0x028042
					; 0xE321: PRINT	MSG 0x036F, MSGBOX CLEARED, END: "{6A}Vous êtes	un touriste?{66}Ne restez pas dans le coin!{66}Tous les	citadins ont été{71}{6A}Des soldats étranges{66}ont obligé tous..les citadins{66}à partir vers les montagnes.{6D}{6A}Je	pêchait	au bord{66}de la mer à ce moment-là.{71}{6A}Il ne neste	plus{66}que moi, un prêtre et un{66}vieillard malade...{6D}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $395,$3	; Run text script at offset 0x028044
					; 0xE322: PRINT	MSG 0x0370, MSGBOX CLEARED, END: "{6A}J'ai entendu dire que{66}vous avez sauvé les gens de{66}la ville!  Bravo!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0023:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $396,$1	; Run text script at offset 0x028046
					; 0xE323: PRINT	MSG 0x0371, MSGBOX CLEARED, END: "{6A}Keu...kof...euhnnn...kof.{6D}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $397,$3	; Run text script at offset 0x028048
					; 0xE324: PRINT	MSG 0x0372, MSGBOX CLEARED, END: "{6A}C'est un miracle!  J'e{66}suis guéri!  C'est le fait de{66}les voir tous sains et saufs!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0024:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $398,$1	; Run text script at offset 0x02804A
					; 0xE325: PRINT	MSG 0x0373, MSGBOX CLEARED, END: "{6A}Pourquoi le duc a-t-il{66}emmnné tout le monde?{6D}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $399,$3	; Run text script at offset 0x02804C
					; 0xE326: PRINT	MSG 0x0374, MSGBOX CLEARED, END: "{6A}Ca me fait du bien que{66}tout soit rentré dans l'ordre!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0120:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  loc_270E4,$1 ; Jump	to address 0x0270E4
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $39C,$3	; Run text script at offset 0x028052
					; 0xE329: PRINT	MSG 0x0377, MSGBOX CLEARED, END: "{6A}Ouf!  Il était temps...{66}Je ne creuserai plus jamais!{66}Je vais reprendre mon ancien{71}{6A}travail.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_270E4:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $135		; Bit 5	of flag	0x026
		ScriptID    $39B,$1	; Flag set:   Run text script at offset	0x028050
					; 0xE328: PRINT	MSG 0x0376, MSGBOX CLEARED, END: "{6A}Nous sommes tous de{66}Verla.  Le	duc de Mercator{66}nous	a obligés à creuser{71}{6A}cette maudite mine!{66}Nos familles sont entre les{66}mains des soldats...  Il faut{71}{6A}les sauver!  Cette mine{66}se divise en trois tunnels...{71}{6A}Vous trouverez nos{66}amis quelquepart dans les{66}deux autres tunnels.{71}{6A}Aidez-nous!{6D}"
		ScriptID    $39A,$2	; Flag clear: Run text script at offset	0x02804E
					; 0xE327: PRINT	MSG 0x0375, MSGBOX CLEARED, END: "{6A}Arrêtez ce monstre!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0121:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0121_0,$1 ; Jump	to address 0x0270FE
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $39F,$3	; Run text script at offset 0x028058
					; 0xE32C: PRINT	MSG 0x037A, MSGBOX CLEARED, END: "{6A}Pourquoi le duc a-t-il{66}fait une chose pareille?{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0121_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $135		; Bit 5	of flag	0x026
		ScriptID    $39E,$1	; Flag set:   Run text script at offset	0x028056
					; 0xE32B: PRINT	MSG 0x0379, MSGBOX CLEARED, END: "{6A}Le duc de	Mercator est{66}arrivé sans prévenir,{66}en ville, puis	il a donné{71}{6A}l'ordre à ses soldats{71}{6A}de nous amener ici...{66}Et moi qui croyais que c'était{66}un monsieur bien!!{6D}"
		ScriptID    $39D,$2	; Flag clear: Run text script at offset	0x028054
					; 0xE32A: PRINT	MSG 0x0378, MSGBOX CLEARED, END: "{6A}EEEEEEEEK!!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0122:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0122_0,$1 ; Jump	to address 0x027118
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3A2,$3	; Run text script at offset 0x02805E
					; 0xE32F: PRINT	MSG 0x037D, MSGBOX CLEARED, END: "{6A}Jamais je	n'oublierai{66}la peur que j'avais{66}dans les mines!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0122_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $135		; Bit 5	of flag	0x026
		ScriptID    $3A1,$1	; Flag set:   Run text script at offset	0x02805C
					; 0xE32E: PRINT	MSG 0x037C, MSGBOX CLEARED, END: "{6A}J'avais si peur!{6D}"
		ScriptID    $3A0,$2	; Flag clear: Run text script at offset	0x02805A
					; 0xE32D: PRINT	MSG 0x037B, MSGBOX CLEARED, END: "{6A}A	l'aide!{66}Au secours!  A moi!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0123:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0123_0,$1 ; Jump	to address 0x027132
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3A5,$3	; Run text script at offset 0x028064
					; 0xE332: PRINT	MSG 0x0380, MSGBOX CLEARED, END: "{6A}Le duc est parti pour{66}Destel avec ses soldats.	 Les{66}nains de là-bas	sont doux et{71}{6A}paisibles...  Ils n'ont{66}même pas d'armes pour{66}se protéger.{71}{6A}Ca va être un{66}massacre!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0123_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $136		; Bit 6	of flag	0x026
		ScriptID    $3A4,$1	; Flag set:   Run text script at offset	0x028062
					; 0xE331: PRINT	MSG 0x037F, MSGBOX CLEARED, END: "{6A}Qu'est-ce que le duc{66}cherchait dans cette mine,{66}au juste?{71}{6A}Il nous faisait{66}travailler du matin au soir...{6D}"
		ScriptID    $3A3,$2	; Flag clear: Run text script at offset	0x028060
					; 0xE330: PRINT	MSG 0x037E, MSGBOX CLEARED, END: "{6A}Nous, ça va...  Tuez-le!!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0124:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $3A6,$1	; Run text script at offset 0x028066
					; 0xE333: PRINT	MSG 0x0381, MSGBOX CLEARED, END: "{6A}Allez!  ALLEZ!!...{6D}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3A7,$3	; Run text script at offset 0x028068
					; 0xE334: PRINT	MSG 0x0382, MSGBOX CLEARED, END: "{6A}Que fait le duc{66}à l'heure actuelle?{71}{6A}Ryle!  je crois que{66}vous seul pourrez mettre{66}un terme aux agissements{71}{6A}de ce misérable duc!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0125:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0125_0,$1 ; Jump	to address 0x02715A
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3AA,$3	; Run text script at offset 0x02806E
					; 0xE337: PRINT	MSG 0x0385, MSGBOX CLEARED, END: "{6A}Je connais le maire de{66}Destel.	 Il vient souvent{66}acheter son poisson ici.{71}{6A}C'est un homme bon.  Il{66}m'a dit qu'ils vivent là-bas{66}tranquillement...  Ils{71}{6A}cultivent des fleurs.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0125_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $136		; Bit 6	of flag	0x026
		ScriptID    $3A9,$1	; Flag set:   Run text script at offset	0x02806C
					; 0xE336: PRINT	MSG 0x0384, MSGBOX CLEARED, END: "{6A}Le duc a dû nous trahir{66}pour avoir les	trésors!{6D}"
		ScriptID    $3A8,$2	; Flag clear: Run text script at offset	0x02806A
					; 0xE335: PRINT	MSG 0x0383, MSGBOX CLEARED, END: "{6A}Tenez bon!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0126:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0126_0,$1 ; Jump	to address 0x027174
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3AD,$3	; Run text script at offset 0x028074
					; 0xE33A: PRINT	MSG 0x0388, MSGBOX CLEARED, END: "{6A}Le tunnel	de Mercator à{66}Verla est enfin ouvert!{66}Je pourrai aller chez{71}{6A}Petit Pois tous les jours!{71}{6A}Etre	enfermé	dans ce{66}tunnel pendant si longtemps,{66}ça m'a vraiment fait craqué!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0126_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $137		; Bit 7	of flag	0x026
		ScriptID    $3AC,$1	; Flag set:   Run text script at offset	0x028072
					; 0xE339: PRINT	MSG 0x0387, MSGBOX CLEARED, END: "{6A}Il y a un	petit village{66}du côté ouest de cette{66}mine.  J'ai vu le duc sur{71}{6A}la route du village, à la{71}{6A}tête de ses soldats.  Je{66}me demande ce qui se passe.{71}{6A}Vous en savez{66}quelque chose?{6D}"
		ScriptID    $3AB,$2	; Flag clear: Run text script at offset	0x028070
					; 0xE338: PRINT	MSG 0x0386, MSGBOX CLEARED, END: "{6A}Il nous tuera!!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0127:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0127_0,$1 ; Jump	to address 0x02718E
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3B0,$3	; Run text script at offset 0x02807A
					; 0x7CDF: LOAD CUSTOM ACTION 0xDF (0x10000037B CSA_00DF), MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0127_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $137		; Bit 7	of flag	0x026
		ScriptID    $3AF,$1	; Flag set:   Run text script at offset	0x028078
					; 0xE33C: PRINT	MSG 0x038A, MSGBOX CLEARED, END: "{6A}Merci!{66}Vous étiez vraiment beau{66}quand vous vous battiez!{6D}"
		ScriptID    $3AE,$2	; Flag clear: Run text script at offset	0x028076
					; 0xE33B: PRINT	MSG 0x0389, MSGBOX CLEARED, END: "{6A}eeeeeeEEEEEEK!!!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0128:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptJump  CS_0128_0,$1 ; Jump	to address 0x0271A8
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3B3,$3	; Run text script at offset 0x028080
					; 0xE33F: PRINT	MSG 0x038D, MSGBOX CLEARED, END: "{6A}J'ai trouvé l'épée mais{66}je n'en ai pas parlé au duc!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0128_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $137		; Bit 7	of flag	0x026
		ScriptJump  CS_0128_1,$1 ; Flag	set:   Jump to address 0x0271B4
		ScriptID    $3B1,$2	; Flag clear: Run text script at offset	0x02807C
					; 0xE33D: PRINT	MSG 0x038B, MSGBOX CLEARED, END: "{6A}Ne me regardez pas{66}comme ça.  Attrapez-le!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0128_1:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $13D		; Bit 5	of flag	0x027
		ScriptID    $6A4,$1	; Flag set:   Run text script at offset	0x028662
					; 0x1928: LOAD CHARACTER SCRIPT	* (0x0128)
					; 0xE4D1: PRINT	MSG 0x051F, MSGBOX CLEARED, END: "{6A}Voyez!{66}Ce sera	bientôt	ouvert!{6D}"
		ScriptID    $3B2,$2	; Flag clear: Run text script at offset	0x02807E
					; 0xE33E: PRINT	MSG 0x038C, MSGBOX CLEARED, END: "{6A}J'ai entendu les hommes{66}du duc dire qu'on n'allait{66}plus creuser puisqu'ils{71}{6A}avaient trouvé ce{66}"{6A}qu'ils cherchaient...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0129:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $3B4,$1	; Run text script at offset 0x028082
					; 0xE340: PRINT	MSG 0x038E, MSGBOX CLEARED, END: "{6A}Creusez!	creusez!{6D}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3B5,$3	; Run text script at offset 0x028084
					; 0xE341: PRINT	MSG 0x038F, MSGBOX CLEARED, END: "{6A}Je me disais bien	que{66}ce n'était pas une mine{66}comme les autres...{71}{6A}Mais qui aurait pû{66}deviner qu'il y avait un{66}trésor légendaire!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_012A:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1A		; Params 00, 1A
		ScriptID    $3B6,$1	; Run text script at offset 0x028086
					; 0xE342: PRINT	MSG 0x0390, MSGBOX CLEARED, END: "{6A}Je dois continuer!{66}Nos	vies en	dépendent!{6D}"
					;
		dc.w $1B		; Params 00, 1B
		ScriptID    $3B7,$3	; Run text script at offset 0x028088
					; 0xE343: PRINT	MSG 0x0391, MSGBOX CLEARED, END: "{6A}Ce tunnel	dans la	mine,{66}c'est le seul chemin qui{66}mène à Destel.{71}{6A}L'épée?  On l'a trouvée{66}par hasard en creusant.{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_012B:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3B8,$0	; Run text script at offset 0x02808A
					; 0xE344: PRINT	MSG 0x0392, MSGBOX CLEARED, END: "{6A}Je ne peux plus faire{66}confiance aux humains!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_012C:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3B9,$0	; Run text script at offset 0x02808C
					; 0xE345: PRINT	MSG 0x0393, MSGBOX CLEARED, END: "{6A}Ma maison	a été pillée{66}par une	horde de soldats.{66}Ils étaient très grands!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0025:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1B		; Params 00, 1B
		ScriptID    $3BA,$1	; Run text script at offset 0x02808E
					; 0xE346: PRINT	MSG 0x0394, MSGBOX CLEARED, END: "{6A}Pourquoi les humains{66}sont-ils si grossiers?  Ils{66}arrivent comme ça,	puis ils{71}{6A}écrasent toutes	les{66}fleurs!	S'il voulaient le joyau{66}il suffisait de me demander!{71}{6A}Le joyau?  Un nommé{66}Mercator l'a trouvé et l'a{66}emporté avec lui.{71}{6A}Pourquoi tient-il à une{66}chose sans valeur?  Les{66}fleurs sont tellement plus{71}{6A}belles et parfumées!{6D}"
					;
		dc.w $1C		; Params 00, 1C
		ScriptID    $3BB,$3	; Run text script at offset 0x028090
					; 0xE347: PRINT	MSG 0x0395, MSGBOX CLEARED, END: "{6A}J'étais à l'auberge, en{66}train de parler de la grotte{66}sous le village, quand un{71}{6A}touriste s'est précipité{66}ici, a brisé le sceau, puis{66}s'est enfoncé dans la grotte!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_012D:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3BC,$0	; Run text script at offset 0x028092
					; 0xE348: PRINT	MSG 0x0396, MSGBOX CLEARED, END: "{6A}Jamais de	ma vie je n'ai{66}vu une telle grossièreté!!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_012E:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1B		; Params 00, 1B
		ScriptID    $3BD,$1	; Run text script at offset 0x028094
					; 0xE349: PRINT	MSG 0x0397, MSGBOX CLEARED, END: "{6A}Je n'aime pas la vie{66}trépidante de la ville...{66}C'est pourquoi je vis{71}{6A}ici avec les nains.{71}{6A}Les hommes sont{66}méchants!{6D}"
					;
		dc.w $1C		; Params 00, 1C
		ScriptID    $3BE,$3	; Run text script at offset 0x028096
					; 0xE34A: PRINT	MSG 0x0398, MSGBOX CLEARED, END: "{6A}Je suis descendu une fois{66}pour	essayer	de voir	dans{66}la grotte.  Cétait impossible.{71}{6A}Je crois que vous{66}n'y arriverez pas!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0026:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3BF,$0	; Run text script at offset 0x028098
					; 0xE34B: PRINT	MSG 0x0399, MSGBOX CLEARED, END: "{6A}Nous désirons vivre{66}en	paix, c'est tout.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0027:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3C0,$0	; Run text script at offset 0x02809A
					; 0xE34C: PRINT	MSG 0x039A, MSGBOX CLEARED, END: "{6A}Les nains	sont assez{66}pieux.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_012F:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3C1,$0	; Run text script at offset 0x02809C
					; 0xE34D: PRINT	MSG 0x039B, MSGBOX CLEARED, END: "{6A}J'avais peur!  Les soldats{66}étaient deux fois plus{66}grands que moi!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0028:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3C2,$0	; Run text script at offset 0x02809E
					; 0xE34E: PRINT	MSG 0x039C, MSGBOX CLEARED, END: "{6A}La Boutique de Souvenirs{66}de Kindly.{71}{6A}Je suis gentil, moi!{66}Pas	comme mon frère!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0130:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3C3,$0	; Run text script at offset 0x0280A0
					; 0xE34F: PRINT	MSG 0x039D, MSGBOX CLEARED, END: "{6A}Bienvenue	au village{66}de Destel.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0131:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1B		; Params 00, 1B
		ScriptID    $3C4,$1	; Run text script at offset 0x0280A2
					; 0xE350: PRINT	MSG 0x039E, MSGBOX CLEARED, END: "{6A}Ce puits est l'entrée{66}d'une grotte où vivent des{66}monstres!{6D}"
					;
		dc.w $1C		; Params 00, 1C
		ScriptID    $3C5,$3	; Run text script at offset 0x0280A4
					; 0xE351: PRINT	MSG 0x039F, MSGBOX CLEARED, END: "{6A}Parfois, tard dans la{66}nuit, on	entend des{66}rugissements venant du puits!!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0132:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3C6,$0	; Run text script at offset 0x0280A6
					; 0xE352: PRINT	MSG 0x03A0, MSGBOX CLEARED, END: "{6A}Ma plate-bande a été{66}ruinée!  Que cherchaient-ils?{71}{6A}Je ne possède rien{66}qu'ils puissent vouloir!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0133:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3C7,$0	; Run text script at offset 0x0280A8
					; 0xE353: PRINT	MSG 0x03A1, MSGBOX CLEARED, END: "{6A}Des soldats énormes sont{66}entrés chez moi et ils{66}voulaient le joyau!{71}{6A}Moi, je n'ai que mes{66}graines!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0134:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $1B		; Params 00, 1B
		ScriptID    $3C8,$1	; Run text script at offset 0x0280AA
					; 0xE354: PRINT	MSG 0x03A2, MSGBOX CLEARED, END: "{6A}Le duc de	Mercator est{66}arrivé à l'improviste, et il a{66}acheté tous mes radeaux!{71}{6A}Il m'a payé 60 Ors!  Il{66}disait qu'il allait au{66}Lieu Saint.{6D}"
					;
		dc.w $1C		; Params 00, 1C
		ScriptID    $3C9,$3	; Run text script at offset 0x0280AC
					; 0xE355: PRINT	MSG 0x03A3, MSGBOX CLEARED, END: "{6A}Désolé, je n'en ai plus!{66}Vous pouvez atteindre le{66}Lieu Saint en passant par{71}{6A}la grotte sous Destel,{66}mais, ...  C'est dangereux...{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0029:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3CA,$0	; Run text script at offset 0x0280AE
					; 0xE356: PRINT	MSG 0x03A4, MSGBOX CLEARED, END: "{6A}Une belle	cascade, hein?{66}Les gens de Destel font tout{66}pour que l'eau reste propre.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002A:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3CB,$0	; Run text script at offset 0x0280B0
					; 0xE357: PRINT	MSG 0x03A5, MSGBOX CLEARED, END: "{6A}Je gagne bien ma vie grâce{66}aux	chasseurs de trésors qui{66}viennent au	lac.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002B:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3CC,$0	; Run text script at offset 0x0280B2
					; 0xE358: PRINT	MSG 0x03A6, MSGBOX CLEARED, END: "{6A}Vous êtes	notre premier{66}visiteur depuis 300 ans!{71}{6A}Comment, Un nouveau{66}dictateur a pris le pouvoir{66}en haut?...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0135:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3CD,$0	; Run text script at offset 0x0280B4
					; 0xE359: PRINT	MSG 0x03A7, MSGBOX CLEARED, END: "{6A}Le roi Nole nous a{66}accordé la jeunesse	éternelle{66}en	échange	de la construction{71}{6A}de son palais	souterrain.{71}{6A}J'aime la vie calme{66}d'ici.  Cela ne me dit rien de{66}remonter à la surface...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0136:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3CE,$0	; Run text script at offset 0x0280B6
					; 0xE35A: PRINT	MSG 0x03A8, MSGBOX CLEARED, END: "{6A}Il faut traverser	un{66}labyrinthe énorme	et compliqué{66}avant d'arriver au palais.{71}{6A}Le labyrinthe a été{66}conçu par le roi Nole.  Même{66}nous, on ne sait pas{71}{6A}le traverser!{71}{6A}C'était un sacré egoïste!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002C:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3CF,$0	; Run text script at offset 0x0280B8
					; 0xE35B: PRINT	MSG 0x03A9, MSGBOX CLEARED, END: "{6A}Ici, il n'y a pas de vrai{66}prêtre, mais j'ai longuement{66}médité au sujet de la déesse.{71}{6A}Ainsi, je remplis la{66}fonction de prêtre.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0137:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3D0,$0	; Run text script at offset 0x0280BA
					; 0xE35C: PRINT	MSG 0x03AA, MSGBOX CLEARED, END: "{6A}J'ai travaillé pour le{66}roi Nole afin d'avoir la vie{66}éternelle...  Mais je...{71}{6A}...  m'ennuie...{71}{6A}...  Vous n'auriez pas une{66}B.D.  à me prêter?...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0138:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3D1,$0	; Run text script at offset 0x0280BC
					; 0xE35D: PRINT	MSG 0x03AB, MSGBOX CLEARED, END: "{6A}Dans le labyrinthe, il y{66}a trois monstres, les{66}'Gardiens de Gehenna'.{71}{6A}Pour ouvrir le portail{66}du palais, il faut d'abord{66}vous débarrasser d'eux!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002D:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $3D2,$0	; Run text script at offset 0x0280BE
					; 0xE35E: PRINT	MSG 0x03AC, MSGBOX CLEARED, END: "{6A}Le premier propriétaire{66}de cette boutique est parti il{66}y a 200 ans.On ne l'a pas revu{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0139:
		move.w	#$A,d0
		bsr.w	TestFlagBit
		beq.s	CS_0139_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $783,$0	; Run text script at offset 0x028820
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE544: PRINT	MSG 0x0592, MSGBOX CLEARED, END: "{6A}A	bientôt!{6D}"
; ---------------------------------------------------------------------------
		bra.s	CS_0139_2
; ---------------------------------------------------------------------------

CS_0139_0:				; CODE XREF: ROM:0002728Ej
		move.w	#8,d0
		bsr.w	TestFlagBit
		beq.s	CS_0139_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $77C,$0	; Run text script at offset 0x028812
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE540: PRINT	MSG 0x058E, MSGBOX CLEARED, END: "{6A}Bonne chance!{6D}"
; ---------------------------------------------------------------------------
		bra.s	CS_0139_2
; ---------------------------------------------------------------------------

CS_0139_1:				; CODE XREF: ROM:0002729Ej
		move.w	#$132,(g_Character).l

CS_0139_2:				; CODE XREF: ROM:00027294j
					; ROM:000272A4j
		rts
; ---------------------------------------------------------------------------

CS_013A:
		move.w	#$A,d0
		bsr.w	TestFlagBit
		beq.s	CS_013A_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $783,$0	; Run text script at offset 0x028820
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE544: PRINT	MSG 0x0592, MSGBOX CLEARED, END: "{6A}A	bientôt!{6D}"
; ---------------------------------------------------------------------------
		bra.s	CS_013A_2
; ---------------------------------------------------------------------------

CS_013A_0:				; CODE XREF: ROM:000272B8j
		move.w	#8,d0
		bsr.w	TestFlagBit
		beq.s	CS_013A_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $77C,$0	; Run text script at offset 0x028812
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE540: PRINT	MSG 0x058E, MSGBOX CLEARED, END: "{6A}Bonne chance!{6D}"
; ---------------------------------------------------------------------------
		bra.s	CS_013A_2
; ---------------------------------------------------------------------------

CS_013A_1:				; CODE XREF: ROM:000272C8j
		move.w	#$159,(g_Character).l

CS_013A_2:				; CODE XREF: ROM:000272BEj
					; ROM:000272CEj
		rts
; ---------------------------------------------------------------------------

CS_013B:
		move.w	#$A,d0
		bsr.w	TestFlagBit
		beq.s	CS_013B_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $783,$0	; Run text script at offset 0x028820
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE544: PRINT	MSG 0x0592, MSGBOX CLEARED, END: "{6A}A	bientôt!{6D}"
; ---------------------------------------------------------------------------
		bra.s	CS_013B_2
; ---------------------------------------------------------------------------

CS_013B_0:				; CODE XREF: ROM:000272E2j
		move.w	#8,d0
		bsr.w	TestFlagBit
		beq.s	CS_013B_1
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $77C,$0	; Run text script at offset 0x028812
					; 0x1939: LOAD CHARACTER SCRIPT	* (0x0139)
					; 0xE540: PRINT	MSG 0x058E, MSGBOX CLEARED, END: "{6A}Bonne chance!{6D}"
; ---------------------------------------------------------------------------
		bra.s	CS_013B_2
; ---------------------------------------------------------------------------

CS_013B_1:				; CODE XREF: ROM:000272F2j
		move.w	#$135,(g_Character).l

CS_013B_2:				; CODE XREF: ROM:000272E8j
					; ROM:000272F8j
		rts
; ---------------------------------------------------------------------------

CS_013C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 9			; Params 00, 09
		ScriptID    $78D,$1	; Run text script at offset 0x028834
					; 0xE549: PRINT	MSG 0x0597, MSGBOX CLEARED, END: "{6A}Désolé.{66}C'est privé par ici.{66}Vous ne pouvez par entrer!{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  CS_013C_0,$3 ; Jump	to address 0x027312
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

CS_013C_1:				; CODE XREF: ROM:0002731Aj
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $791,$0	; Run text script at offset 0x02883C
					; 0x193C: LOAD CHARACTER SCRIPT	* (0x013C)
					; 0xE54B: PRINT	MSG 0x0599, MSGBOX CLEARED, END: "{6A}Bienvenue	au Casino{66}d'Arthur!{66}Amusez-vous bien!{6D}"
; ---------------------------------------------------------------------------

CS_013C_2:				; CODE XREF: ROM:00027324j
		rts
; ---------------------------------------------------------------------------

CS_013D:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E5		; Bit 5	of flag	0x01C
		ScriptID    $7D2,$1	; Flag clear: Run text script at offset	0x0288BE
					; 0x1BF3: LOAD SPECIAL CHARACTER Pixie (0x0B)
					; 0xE56A: PRINT	MSG 0x05B8, MSGBOX CLEARED, END: "{6A}Friday!{66}Ca doit faire 256 ans!{71}{6A}Tu te souviens{66}de cette affreuse guerre avec{66}le roi Nole?	Horrible, hein?{71}{6A}Comment?!  ...  VOUS êtes{66}à la recherche des trésors{66}du roi Nole?!{71}{6A}Faites attention!{66}Il est mort, mais...{71}{6A}il quitterait sûrement{66}sa tombe pour	protéger ses{66}trésors!"
		ScriptID    $7D4,$2	; Flag set:   Run text script at offset	0x0288C2
					; 0x1BF3: LOAD SPECIAL CHARACTER Pixie (0x0B)
					; 0xE56B: PRINT	MSG 0x05B9, MSGBOX CLEARED, END: "{6A}Il n'est pas mal,{66}ton fiancé!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_013E:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E6		; Bit 6	of flag	0x01C
		ScriptID    $7D6,$1	; Flag clear: Run text script at offset	0x0288C6
					; 0x1BF4: LOAD SPECIAL CHARACTER Trixie	(0x0C)
					; 0x856C: PRINT	MSG 0x05BA: "{6A}Friday, c'est toi!{66}Encore un nouveau{66}petit ami!{71}{6A}Voyons ça...hmmm{68}{66}...Plutôt beau, ce petit!{66}Où l'as-tu trouvé?{71}"
					; 0x1BE9: LOAD SPECIAL CHARACTER Friday	(0x01)
					; 0x856D: PRINT	MSG 0x05BB: "{6A}Trixie!{66}Il m'a sauvé la vie!{66}C'est mon...!{71}"
					; 0x1BF4: LOAD SPECIAL CHARACTER Trixie	(0x0C)
					; 0xE56E: PRINT	MSG 0x05BC, MSGBOX CLEARED, END: "{6A}Bien, bien!{66}Je	m'excuse!{6D}"
		ScriptID    $7DC,$2	; Flag set:   Run text script at offset	0x0288D2
					; 0x1BF4: LOAD SPECIAL CHARACTER Trixie	(0x0C)
					; 0xE56F: PRINT	MSG 0x05BD, MSGBOX CLEARED, END: "{6A}Tu aimes les{66}garçons, hein?{6D}"
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
		ScriptID    $371,$1	; Run text script at offset 0x027FFC
					; 0xE307: PRINT	MSG 0x0355, MSGBOX CLEARED, END: "{6A}Mais, comment avez-vous{66}réussi	à vous échapper?  Je{66}n'ai pas encore réglé{71}{6A}votre cas!{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptJump  loc_27354,$3 ; Jump	to address 0x027354
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_27354:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E7		; Bit 7	of flag	0x01C
		ScriptID    $372,$1	; Flag clear: Run text script at offset	0x027FFE
					; 0xE308: PRINT	MSG 0x0356, MSGBOX CLEARED, END: "{6A}Arrgh!  Je ne voulais que{66}quelques petits trésors de{66}rien du tout!	Et voilà qu'on{71}{6A}est complètement fauché!{66}Pourquoi je me laisse toujours{66}
					;                                                 embarquer dans ces bêtises?{71}{6A}On n'avait pas de quoi{66}payer le voyage vers le{66}continent.  J'ai eu donc l'idée{71}{6A}de me faire arrêter, pour{66}pouvoir voyager sur le bateau{66}des prisonniers...Mais ça sent{71}{6A}trop mauvais!!  CA PUE!!{66}Gardien!  J'exige qu'on me mette{66}dans une cellule propre!{6D}"
		ScriptID    $373,$2	; Flag set:   Run text script at offset	0x028000
					; 0xE309: PRINT	MSG 0x0357, MSGBOX CLEARED, END: "{6A}Je n'oublierai pas votre{66}geste, Ryle.  Un jour,{66}je vous le rendrai!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_002F:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $12		; Params 00, 12
		ScriptID    $374,$1	; Run text script at offset 0x028002
					; 0xE30A: PRINT	MSG 0x0358, MSGBOX CLEARED, END: "{6A}...  Burps!...{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $375,$3	; Run text script at offset 0x028004
					; 0xE30B: PRINT	MSG 0x0359, MSGBOX CLEARED, END: "{6A}Donnez-moi ces trésors!{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $376,$5	; Run text script at offset 0x028006
					; 0xE30C: PRINT	MSG 0x035A, MSGBOX CLEARED, END: "{6A}Trop mauvais!...{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0030:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $12		; Params 00, 12
		ScriptID    $377,$1	; Run text script at offset 0x028008
					; 0xE30D: PRINT	MSG 0x035B, MSGBOX CLEARED, END: "{6A}...BURRRRP!!...{6D}"
					;
		dc.w $17		; Params 00, 17
		ScriptID    $5DA,$3	; Run text script at offset 0x0284CE
					; 0xE46C: PRINT	MSG 0x04BA, MSGBOX CLEARED, END: "{6A}Aaaah...	Aidez-Moi!{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $378,$5	; Run text script at offset 0x02800A
					; 0xE30E: PRINT	MSG 0x035C, MSGBOX CLEARED, END: "{6A}Ca pue!...{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0031:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $379,$0	; Run text script at offset 0x02800C
					; 0x1831: LOAD CHARACTER SCRIPT	Duc (0x0031)
					; 0xE30F: PRINT	MSG 0x035D, MSGBOX CLEARED, END: "{6A}D'accord, d'accord!{66}Quel escrimeur!{66}Vous m'avez convaincu!{71}{6A}Je vous en prie,{66}prenez tous les trésors,{66}mais laissez-moi tranquille!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0032:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $10		; Params 00, 10
		ScriptJump  CS_0032_0,$1 ; Jump	to address 0x0273A0
					;
		dc.w $11		; Params 00, 11
		ScriptID    $31C,$3	; Run text script at offset 0x027F52
					; 0xE2BD: PRINT	MSG 0x030B, MSGBOX CLEARED, END: "{6A}Un dîner!{66}On sert mes plats préférés?{66}De la	viande crue, oui?{6D}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $31D,$5	; Run text script at offset 0x027F54
					; 0xE2BE: PRINT	MSG 0x030C, MSGBOX CLEARED, END: "{6A}Vous pourrez me suivre{66}demain,	si vous	voulez.{66}Cela	ne doit	pas être{71}{6A}facile tous les{66}jours pour un minus{66}comme	vous!{6D}"
					;
		dc.w $1D		; Params 00, 1D
		ScriptID    $31E,$7	; Run text script at offset 0x027F56
					; 0x7CFA: LOAD CUSTOM ACTION 0xFA (0x1000003E7 CSA_00FA), MSGBOX CLEARED, END
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0032_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $C9		; Bit 1	of flag	0x019
		ScriptJump  CS_0032_1,$1 ; Flag	clear: Jump to address 0x0273AC
		ScriptID    $31B,$2	; Flag set:   Run text script at offset	0x027F50
					; 0xE2BC: PRINT	MSG 0x030A, MSGBOX CLEARED, END: "{6A}Ce fabuleux château vaut{66}le deétour....{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0032_1:
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptID    $318,$0	; Prompt:	Run text script	at offset 0x027F4A
					; 0xA2B9: PRINT	MSG 0x0307, END: "{6A}Ryle, hmm, Je sais que{66}j'ai entendu ce nom...{66}Mais bon sang de bien sûr!{71}{6A}C'est vous qui avez{66}piqué la statue de Jypta?{67}"
		ScriptID    $319,$1	; Answer 'yes': Run text script at offset 0x027F4C
					; 0xE2BA: PRINT	MSG 0x0308, MSGBOX CLEARED, END: "{6A}J'en étais sûr!  Mais ne{66}vous inquiètez pas...  Je ne{66}dirai rien à personne!{71}"
		ScriptID    $31A,$2	; Answer 'no':  Run text script at offset 0x027F4E
					; 0xE2BB: PRINT	MSG 0x0309, MSGBOX CLEARED, END: "{6A}Mais si!	mais si!  Un{66}chasseur de prime, ça sait{66}flairer un voleur!{71}{6A}Mais ne	vous faites{66}pas de bile...  Les 5000	Ors{66}de récompense pour celui{71}{6A}qui vous	ramène,	ça vaut{66}pas le coup qu'on se fatigue!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0033:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $10		; Params 00, 10
		ScriptID    $31F,$1	; Run text script at offset 0x027F58
					; 0xE2BF: PRINT	MSG 0x030D, MSGBOX CLEARED, END: "{6A}Le duc de	Mercator était{66}une fine lame	à Gamoor.{66}Je	l'admire énormément!{6D}"
					;
		dc.w $11		; Params 00, 11
		ScriptID    $320,$3	; Run text script at offset 0x027F5A
					; 0xE2C0: PRINT	MSG 0x030E, MSGBOX CLEARED, END: "{6A}C'est un grand honneur{66}d'être l'invité du duc!  Cela{66}fait 20 ans que j'attends...{71}{6A}Mais, dites-moi...{66}Vous avez quel âge, vous?{6D}"
					;
		dc.w $13		; Params 00, 13
		ScriptID    $321,$5	; Run text script at offset 0x027F5C
					; 0xE2C1: PRINT	MSG 0x030F, MSGBOX CLEARED, END: "{6A}Je donnerais ma vie{66}pour lui être utile!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0034:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $16		; Params 00, 16
		ScriptID    $37F,$1	; Run text script at offset 0x028018
					; 0xE312: PRINT	MSG 0x0360, MSGBOX CLEARED, END: "{6A}Vous avez	suivi ses{66}instructions!  Comme{66}vous êtes naïf!{6D}"
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
		ScriptID    $38A,$1	; Run text script at offset 0x02802E
					; 0xE319: PRINT	MSG 0x0367, MSGBOX CLEARED, END: "{6A}Ouaf!  Ouaf!{6D}"
					;
		dc.w $19		; Params 00, 19
		ScriptID    $38B,$3	; Run text script at offset 0x028030
					; 0xE31A: PRINT	MSG 0x0368, MSGBOX CLEARED, END: "{6A}Jamais je	n'oublierai{66}votre bonté!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0038:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w $18		; Params 00, 18
		ScriptID    $38C,$1	; Run text script at offset 0x028032
					; 0x7CC6: LOAD CUSTOM ACTION 0xC6 (0x100000317 CSA_00C6), MSGBOX CLEARED, END
					;
		dc.w $19		; Params 00, 19
		ScriptID    $62A,$3	; Run text script at offset 0x02856E
					; 0xE493: PRINT	MSG 0x04E1, MSGBOX CLEARED, END: "{6A}Venez me voir quand{66}quand vous	voulez!{6D}"
					;
		dc.w $FFFF
; ---------------------------------------------------------------------------

CS_0039:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $DF		; Bit 7	of flag	0x01B
		ScriptID    $678,$1	; Flag clear: Run text script at offset	0x02860A
					; 0x84BA: PRINT	MSG 0x0508: "{6A}Je m'appelle Assala.{66}Autrefois j'étais connu{66}comme fine lame...{71}{6A}Je travaillais au{66}château mais j'ai pris ma{66}retraite.  Je n'aime pas{71}{6A}la ville...{71}{6A}Vous étes chasseur de{66}trésor?  Mmm...  Il vous{66}faudra une meilleur épée!{71}"
					; 0x0001: LOAD 0x0001 INTO 0xFF1196 (Epe?ƒ??{79}Magique)
					; 0x17E8: RECEIVE ITEM [0xFF1196]
					; 0x1839: LOAD CHARACTER SCRIPT	Kado (0x0039)
					; 0x84BB: PRINT	MSG 0x0509: "{6A}Elle a	un pouvoir{66}particulier!  Quand l'épée{66}est pleinement chargée,{71}{6A}une flamme magique{66}brûlera tout ennemi{66}qu'elle touchera!{71}"
					; 0xE4BC: PRINT	MSG 0x050A, MSGBOX CLEARED, END: "{6A}Vous apprécierez sans{66}doute l'immense valeur{66}de cette lame!{6D}"
		ScriptJump  CS_0039_0,$2 ; Flag	set:   Jump to address 0x027400
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0039_0:
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $E3		; Bit 3	of flag	0x01C
		ScriptID    $67E,$1	; Flag clear: Run text script at offset	0x028616
					; 0x84BD: PRINT	MSG 0x050B: "{6A}Qu'en pensez-vous?{71}{6A}Il y a d'autres épées{66}magiques quelque part{66}sur cette île...{71}"
					; 0x0403: LOAD 0x0003 INTO 0xFF1198 (Epe?ƒ??{79}Tonnerre)
					; 0x0802: LOAD 0x0002 INTO 0xFF119A (Epe?ƒ??{79}de Glace)
					; 0xE4BE: PRINT	MSG 0x050C, MSGBOX CLEARED, END: "{6A}Elles ont	pour nom{66}{6E} et {6E}...{71}{6A}On parle aussi, mais{66}ce n'est peut-être qu'une{66}légende, d'une épée Gaia!!{6D}"
		ScriptID    $67D,$2	; Flag set:   Run text script at offset	0x028614
					; 0xE4BC: PRINT	MSG 0x050A, MSGBOX CLEARED, END: "{6A}Vous apprécierez sans{66}doute l'immense valeur{66}de cette lame!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_003A:
		move.w	#ITM_SUNSTONE,d0
		bsr.w	CheckIfItemIsOwned
		beq.s	CS_003A_0
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $388,$0	; Run text script at offset 0x02802A
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE318: PRINT	MSG 0x0366, MSGBOX CLEARED, END: "{6A}Vous avez	trouvé la{66}{6E}!{71}{6A}On dirait que	vous{66}connaissez cette forêt{66}mieux	que moi.  Vous{71}{6A}voulez ma	place?{6D}"
; ---------------------------------------------------------------------------
		bra.s	CS_003A_1
; ---------------------------------------------------------------------------

CS_003A_0:				; CODE XREF: ROM:00027414j
		bsr.w	SetFlagBitOnTalking
; ---------------------------------------------------------------------------
		dc.w $D7		; Bit 7	of flag	0x01A
		ScriptID    $380,$1	; Flag clear: Run text script at offset	0x02801A
					; 0x8313: PRINT	MSG 0x0361: "{6A}On m'appelle Gol.{66}Je suis le gardien du{66}Labyrinthe Vert, tout comme{71}{6A}l'était mon père...{66}"{6A}Que puis-je pour vous?{71}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0x081E: LOAD 0x001E INTO 0xFF119A (Pierre{79}Solaire)
					; 0x8314: PRINT	MSG 0x0362: "{6A}{66}a I, hmmm...{66}Oui, c'est caché dans les{66}profondeurs de cette forêt..{71}{6A}Mais ces vauriens de{66}gnomes, qui vivent par ici,{66}ont modifié tous les chemins!{71}"
					; 0xA315: PRINT	MSG 0x0363, END: "{6A}Vous désirez des conseils{66}pour	votre promenade	dans{66}la forêt?{67}"
		ScriptID    $384,$2	; Flag set:   Run text script at offset	0x028022
					; 0xA315: PRINT	MSG 0x0363, END: "{6A}Vous désirez des conseils{66}pour	votre promenade	dans{66}la forêt?{67}"
; ---------------------------------------------------------------------------
		bsr.w	HandleYesNoPrompt
; ---------------------------------------------------------------------------
		ScriptJump  CS_NULL,$0	; Prompt:	Jump to	address	0x037344
		ScriptID    $385,$1	; Answer 'yes': Run text script at offset 0x028024
					; 0x8316: PRINT	MSG 0x0364: "{6A}Tout d'abord, ne regardez{66}pas les pieds des arbres!{66}Si vous remarquez un vide{71}{6A}entre les cimes de deux{66}rangées d'arbres, c'est{66}peut-être un chemin.  Si vous{71}
					;                            {6A}êtes coincé, essayez de{66}sauter en hauteur...  Il y{66}aura peut-être une marche{71}{6A}ou autre chose.  En plus,{66}il y a pas mal de passages{66}souterrains, dont certains{71}{6A}sont des raccourcis...{66}Mais ce n'est pas tous!{66}Ainsi, il vaut mieux{71}{6A}mémoriser le décor avant{66}de descendre sous terre!{71}"
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE317: PRINT	MSG 0x0365, MSGBOX CLEARED, END: "{6A}La {6E} se{66}trouve dans	le secteur{66}Nord-Est de cette	forêt.{6D}"
		ScriptID    $386,$2	; Answer 'no':  Run text script at offset 0x028026
					; 0x041E: LOAD 0x001E INTO 0xFF1198 (Pierre{79}Solaire)
					; 0xE317: PRINT	MSG 0x0365, MSGBOX CLEARED, END: "{6A}La {6E} se{66}trouve dans	le secteur{66}Nord-Est de cette	forêt.{6D}"
; ---------------------------------------------------------------------------

CS_003A_1:				; CODE XREF: ROM:0002741Aj
		rts
; ---------------------------------------------------------------------------

CS_013F:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $37E,$0	; Run text script at offset 0x028016
					; 0x7C81: LOAD CUSTOM ACTION 0x81 (0x100000203 CSA_0081), MSGBOX CLEARED, END
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0140:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $38D,$0	; Run text script at offset 0x028034
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE31B: PRINT	MSG 0x0369, MSGBOX CLEARED, END: "{6A}Je ne vous vois pas,{66}mais vous	avez bonne mine.{66}Vous désirez manger?{71}{6A}Je ne vous vois	pas,{66}mais vous avez l'air heureux.{66}Venez quand vous voulez.{71}{6A}Je ne vous vois pas,{66}mais vous avez fière allure!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_003B:
		trap	#1
; ---------------------------------------------------------------------------
		ScriptID    $38F,$0	; Run text script at offset 0x028038
					; 0xE31C: PRINT	MSG 0x036A, MSGBOX CLEARED, END: "{6A}Bonjour.{66}Faites comme chez vous!{66}Ho	ho ho...{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_003C:
		bsr.w	HandleProgressDependentDialogue
; ---------------------------------------------------------------------------
		dc.w 5			; Params 00, 05
		ScriptID    $390,$1	; Run text script at offset 0x02803A
					; 0xE31D: PRINT	MSG 0x036B, MSGBOX CLEARED, END: "{6A}Oua!  Oua!{66}Ouaf!  Ouaf!{6D}"
					;
		dc.w $201		; Params 02, 01
		ScriptID    $393,$3	; Run text script at offset 0x028040
					; 0xE320: PRINT	MSG 0x036E, MSGBOX CLEARED, END: "{6A}Je veux voir Bell!{66}Je veux voir Bell!{6D}"
					;
		dc.w $202		; Params 02, 02
		ScriptID    $391,$5	; Run text script at offset 0x02803C
					; 0xE31E: PRINT	MSG 0x036C, MSGBOX CLEARED, END: "{6A}On ne pourra retrouver{66}nos formes d'origine tant{66}que cette sorcière n'aura{71}{6A}pas été défaite!{6D}"
					;
		dc.w $203		; Params 02, 03
		ScriptID    $392,$7	; Run text script at offset 0x02803E
					; 0xE31F: PRINT	MSG 0x036D, MSGBOX CLEARED, END: "{6A}Encore merci pour{66}tout	ce que vous avez fait!{6D}"
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
		ScriptJump  CS_0142_0,$1 ; Flag	set:   Jump to address 0x027470
		ScriptID    $7A1,$2	; Flag clear: Run text script at offset	0x02885C
					; 0x14E0: SET BIT 0 OF FLAG 0x01C
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0x8552: PRINT	MSG 0x05A0: "{6A}Il vous faut un radeau.{66}Si vous voulez descendre la{66}rivière, allez voir mon fils{71}"
					; 0x042F: LOAD 0x002F INTO 0xFF1198 (B?ƒ?»ches)
					; 0xE553: PRINT	MSG 0x05A1, MSGBOX CLEARED, END: "{6A}et prenez	du {6E}.{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CS_0142_0:
		bsr.w	CheckFlagAndDisplayMessage
; ---------------------------------------------------------------------------
		dc.w $15B		; Bit 3	of flag	0x02B
		ScriptID    $7A9,$1	; Flag set:   Run text script at offset	0x02886C
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0xE555: PRINT	MSG 0x05A3, MSGBOX CLEARED, END: "{6A}Faites attention à vous!{6D}"
		ScriptID    $7A6,$2	; Flag clear: Run text script at offset	0x028866
					; 0x1BED: LOAD SPECIAL CHARACTER * (0x05)
					; 0x042F: LOAD 0x002F INTO 0xFF1198 (B?ƒ?»ches)
					; 0xE554: PRINT	MSG 0x05A2, MSGBOX CLEARED, END: "{6A}Allez-y pour le{66}{6E}!{66}Bonne	chance!{6D}"
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------
