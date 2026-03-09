		dc.w $254
		dc.b $10
		dc.b 8
		ScriptID    $1,$2	; Run text script at offset 0x02791C
					; 0xE001: PRINT	MSG 0x004F, MSGBOX CLEARED, END: "{6A}Puis-je vous être{66}utile?{6D}"
		ScriptID    $29,$3	; Run text script at offset 0x02796C
					; 0xE029: PRINT	MSG 0x0077, MSGBOX CLEARED, END: "{6A}Merci!  A	bientôt!{6D}"
		ScriptJump  ShopPrice_01,$4 ; Jump to address 0x025EDE
		ScriptJump  Shop_01,$5	; Jump to address 0x025EEC
		ScriptID    $31,$6	; Run text script at offset 0x02797C
					; 0xE031: PRINT	MSG 0x007F, MSGBOX CLEARED, END: "{6A}Ohé!  Vous, là!!{6D}"
		dc.w $255
		dc.b $10
		dc.b $10
		ScriptID    $5,$9	; Run text script at offset 0x027924
					; 0xE005: PRINT	MSG 0x0053, MSGBOX CLEARED, END: "{6A}Bienvenue	à{66}notre église.{6D}"
		ScriptID    $6,$A	; Run text script at offset 0x027926
					; 0xE006: PRINT	MSG 0x0054, MSGBOX CLEARED, END: "{6A}Faites attention.{66}Que la déesse vous bénisse!{6D}"
		ScriptJump  CS_NULL,$B	; Jump to address 0x027344
		ScriptJump  CS_NULL,$C	; Jump to address 0x027344
		ScriptID    $7,$D	; Run text script at offset 0x027928
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{6A}Arrêtez!{66}Cela appartient à la déesse.{66}Soyez	maudit!{6D}"
		dc.w $256
		dc.b 8
		dc.b $10
		ScriptID    $2,$10	; Run text script at offset 0x02791E
					; 0xE002: PRINT	MSG 0x0050, MSGBOX CLEARED, END: "{6A}Bonjour!{66}Vous voulez rester?{6D}"
		ScriptID    $3,$11	; Run text script at offset 0x027920
					; 0xE003: PRINT	MSG 0x0051, MSGBOX CLEARED, END: "{6A}A	la prochaine!{6D}"
		ScriptJump  CS_NULL,$12	; Jump to address 0x027344
		ScriptJump  CS_NULL,$13	; Jump to address 0x027344
		ScriptID    $4,$14	; Run text script at offset 0x027922
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{6A}Mais non!{66}Vous	ne pouvez pas{66}emporter notre	matériel!{6D}"
		dc.w $25F
		dc.b $10
		dc.b $10
		ScriptID    $5,$17	; Run text script at offset 0x027924
					; 0xE005: PRINT	MSG 0x0053, MSGBOX CLEARED, END: "{6A}Bienvenue	à{66}notre église.{6D}"
		ScriptID    $6,$18	; Run text script at offset 0x027926
					; 0xE006: PRINT	MSG 0x0054, MSGBOX CLEARED, END: "{6A}Faites attention.{66}Que la déesse vous bénisse!{6D}"
		ScriptJump  CS_NULL,$19	; Jump to address 0x027344
		ScriptJump  CS_NULL,$1A	; Jump to address 0x027344
		ScriptID    $7,$1B	; Run text script at offset 0x027928
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{6A}Arrêtez!{66}Cela appartient à la déesse.{66}Soyez	maudit!{6D}"
		dc.w $260
		dc.b $10
		dc.b $B
		ScriptID    $2,$1E	; Run text script at offset 0x02791E
					; 0xE002: PRINT	MSG 0x0050, MSGBOX CLEARED, END: "{6A}Bonjour!{66}Vous voulez rester?{6D}"
		ScriptID    $3,$1F	; Run text script at offset 0x027920
					; 0xE003: PRINT	MSG 0x0051, MSGBOX CLEARED, END: "{6A}A	la prochaine!{6D}"
		ScriptJump  ShopPrice_02,$20 ; Jump to address 0x025EF8
		ScriptJump  Shop_02,$21	; Jump to address 0x025F06
		ScriptID    $4,$22	; Run text script at offset 0x027922
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{6A}Mais non!{66}Vous	ne pouvez pas{66}emporter notre	matériel!{6D}"
		dc.w $267
		dc.b $10
		dc.b $10
		ScriptID    $28,$25	; Run text script at offset 0x02796A
					; 0xE028: PRINT	MSG 0x0076, MSGBOX CLEARED, END: "{6A}Cela fait{66}trente ans que je gère{66}cette boutique.{6D}"
		ScriptID    $29,$26	; Run text script at offset 0x02796C
					; 0xE029: PRINT	MSG 0x0077, MSGBOX CLEARED, END: "{6A}Merci!  A	bientôt!{6D}"
		ScriptJump  ShopPrice_03,$27 ; Jump to address 0x025F12
		ScriptJump  Shop_03,$28	; Jump to address 0x025F20
		ScriptID    $31,$29	; Run text script at offset 0x02797C
					; 0xE031: PRINT	MSG 0x007F, MSGBOX CLEARED, END: "{6A}Ohé!  Vous, là!!{6D}"
		dc.w $265
		dc.b $10
		dc.b $10
		ScriptID    $5,$2C	; Run text script at offset 0x027924
					; 0xE005: PRINT	MSG 0x0053, MSGBOX CLEARED, END: "{6A}Bienvenue	à{66}notre église.{6D}"
		ScriptID    $6,$2D	; Run text script at offset 0x027926
					; 0xE006: PRINT	MSG 0x0054, MSGBOX CLEARED, END: "{6A}Faites attention.{66}Que la déesse vous bénisse!{6D}"
		ScriptJump  CS_NULL,$2E	; Jump to address 0x027344
		ScriptJump  CS_NULL,$2F	; Jump to address 0x027344
		ScriptID    $7,$30	; Run text script at offset 0x027928
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{6A}Arrêtez!{66}Cela appartient à la déesse.{66}Soyez	maudit!{6D}"
		dc.w $26F
		dc.b $10
		dc.b $10
		ScriptID    $32,$33	; Run text script at offset 0x02797E
					; 0xE032: PRINT	MSG 0x0080, MSGBOX CLEARED, END: "{6A}Vous pouvez vous{66}reposer ici.	Vous pouvez même{66}vous ravitailler!{6D}"
		ScriptID    $3,$34	; Run text script at offset 0x027920
					; 0xE003: PRINT	MSG 0x0051, MSGBOX CLEARED, END: "{6A}A	la prochaine!{6D}"
		ScriptJump  ShopPrice_04,$35 ; Jump to address 0x025F2C
		ScriptJump  Shop_04,$36	; Jump to address 0x025F3A
		ScriptID    $4,$37	; Run text script at offset 0x027922
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{6A}Mais non!{66}Vous	ne pouvez pas{66}emporter notre	matériel!{6D}"
		dc.w $2A6
		dc.b $18
		dc.b $10
		ScriptID    $39,$3A	; Run text script at offset 0x02798C
					; 0xE039: PRINT	MSG 0x0087, MSGBOX CLEARED, END: "{6A}Je suis le Numéro	1{66}du	Discount.  -30%.  -40%.{66}Ce que vous voulez, je l'ai!!{6D}"
		ScriptID    $29,$3B	; Run text script at offset 0x02796C
					; 0xE029: PRINT	MSG 0x0077, MSGBOX CLEARED, END: "{6A}Merci!  A	bientôt!{6D}"
		ScriptJump  ShopPrice_05,$3C ; Jump to address 0x025F46
		ScriptJump  Shop_05,$3D	; Jump to address 0x025F54
		ScriptID    $3A,$3E	; Run text script at offset 0x02798E
					; 0xE03A: PRINT	MSG 0x0088, MSGBOX CLEARED, END: "{6A}Minute!{6D}Il faut payer!{66}{6D}"
		dc.w $2B7
		dc.b $10
		dc.b $10
		ScriptID    $3B,$41	; Run text script at offset 0x027990
					; 0xE03B: PRINT	MSG 0x0089, MSGBOX CLEARED, END: "{6A}Ryle!  Que vous faut-il?{71}{6A}Dites-moi	ce qu'il{66}vous faut et je baisserai le{66}prix, rien que pour vous.{6D}"
		ScriptID    $3C,$42	; Run text script at offset 0x027992
					; 0xE03C: PRINT	MSG 0x008A, MSGBOX CLEARED, END: "{6A}Repassez bientôt,	Ryle.{6D}"
		ScriptJump  ShopPrice_06,$43 ; Jump to address 0x025F60
		ScriptJump  Shop_06,$44	; Jump to address 0x025F6E
		ScriptID    $31,$45	; Run text script at offset 0x02797C
					; 0xE031: PRINT	MSG 0x007F, MSGBOX CLEARED, END: "{6A}Ohé!  Vous, là!!{6D}"
		dc.w $281
		dc.b $C
		dc.b $10
		ScriptJump  CS_NULL,$48	; Jump to address 0x027344
		ScriptJump  CS_NULL,$49	; Jump to address 0x027344
		ScriptJump  ShopPrice_01,$4A ; Jump to address 0x025EDE
		ScriptJump  Shop_01,$4B	; Jump to address 0x025EEC
		ScriptID    $31,$4C	; Run text script at offset 0x02797C
					; 0xE031: PRINT	MSG 0x007F, MSGBOX CLEARED, END: "{6A}Ohé!  Vous, là!!{6D}"
		dc.w $2BB
		dc.b $10
		dc.b $10
		ScriptID    $5,$4F	; Run text script at offset 0x027924
					; 0xE005: PRINT	MSG 0x0053, MSGBOX CLEARED, END: "{6A}Bienvenue	à{66}notre église.{6D}"
		ScriptID    $6,$50	; Run text script at offset 0x027926
					; 0xE006: PRINT	MSG 0x0054, MSGBOX CLEARED, END: "{6A}Faites attention.{66}Que la déesse vous bénisse!{6D}"
		ScriptJump  CS_NULL,$51	; Jump to address 0x027344
		ScriptJump  CS_NULL,$52	; Jump to address 0x027344
		ScriptID    $7,$53	; Run text script at offset 0x027928
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{6A}Arrêtez!{66}Cela appartient à la déesse.{66}Soyez	maudit!{6D}"
		dc.w $2BD
		dc.b $20
		dc.b $10
		ScriptID    $2,$56	; Run text script at offset 0x02791E
					; 0xE002: PRINT	MSG 0x0050, MSGBOX CLEARED, END: "{6A}Bonjour!{66}Vous voulez rester?{6D}"
		ScriptID    $3,$57	; Run text script at offset 0x027920
					; 0xE003: PRINT	MSG 0x0051, MSGBOX CLEARED, END: "{6A}A	la prochaine!{6D}"
		ScriptJump  CS_NULL,$58	; Jump to address 0x027344
		ScriptJump  CS_NULL,$59	; Jump to address 0x027344
		ScriptID    $4,$5A	; Run text script at offset 0x027922
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{6A}Mais non!{66}Vous	ne pouvez pas{66}emporter notre	matériel!{6D}"
		dc.w $2CF
		dc.b $10
		dc.b $18
		ScriptJump  ShopEnter_07,$5D ; Jump to address 0x025F94
		ScriptJump  ShopLeave_07,$5E ; Jump to address 0x025FA0
		ScriptJump  ShopPrice_07,$5F ; Jump to address 0x025F7A
		ScriptJump  Shop_07,$60	; Jump to address 0x025F88
		ScriptJump  ShopSteal_07,$61 ; Jump to address 0x025FAC
		dc.w $2D1
		dc.b $10
		dc.b $10
		ScriptID    $5,$64	; Run text script at offset 0x027924
					; 0xE005: PRINT	MSG 0x0053, MSGBOX CLEARED, END: "{6A}Bienvenue	à{66}notre église.{6D}"
		ScriptID    $6,$65	; Run text script at offset 0x027926
					; 0xE006: PRINT	MSG 0x0054, MSGBOX CLEARED, END: "{6A}Faites attention.{66}Que la déesse vous bénisse!{6D}"
		ScriptJump  CS_NULL,$66	; Jump to address 0x027344
		ScriptJump  CS_NULL,$67	; Jump to address 0x027344
		ScriptID    $7,$68	; Run text script at offset 0x027928
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{6A}Arrêtez!{66}Cela appartient à la déesse.{66}Soyez	maudit!{6D}"
		dc.w $2DD
		dc.b $10
		dc.b $20
		ScriptID    $54,$6B	; Run text script at offset 0x0279C2
					; 0xE054: PRINT	MSG 0x00A2, MSGBOX CLEARED, END: "{6A}Bienvenue	chez Kindly!{6D}"
		ScriptID    $29,$6C	; Run text script at offset 0x02796C
					; 0xE029: PRINT	MSG 0x0077, MSGBOX CLEARED, END: "{6A}Merci!  A	bientôt!{6D}"
		ScriptJump  ShopPrice_03,$6D ; Jump to address 0x025F12
		ScriptJump  Shop_03,$6E	; Jump to address 0x025F20
		ScriptID    $31,$6F	; Run text script at offset 0x02797C
					; 0xE031: PRINT	MSG 0x007F, MSGBOX CLEARED, END: "{6A}Ohé!  Vous, là!!{6D}"
		dc.w $2E0
		dc.b $10
		dc.b $10
		ScriptID    $5,$72	; Run text script at offset 0x027924
					; 0xE005: PRINT	MSG 0x0053, MSGBOX CLEARED, END: "{6A}Bienvenue	à{66}notre église.{6D}"
		ScriptID    $6,$73	; Run text script at offset 0x027926
					; 0xE006: PRINT	MSG 0x0054, MSGBOX CLEARED, END: "{6A}Faites attention.{66}Que la déesse vous bénisse!{6D}"
		ScriptJump  CS_NULL,$74	; Jump to address 0x027344
		ScriptJump  CS_NULL,$75	; Jump to address 0x027344
		ScriptID    $7,$76	; Run text script at offset 0x027928
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{6A}Arrêtez!{66}Cela appartient à la déesse.{66}Soyez	maudit!{6D}"
		dc.w $2D9
		dc.b $10
		dc.b $10
		ScriptID    $55,$79	; Run text script at offset 0x0279C4
					; 0xE055: PRINT	MSG 0x00A3, MSGBOX CLEARED, END: "{6A}Vous êtes	libre de{66}rester chez	moi.  Seulement,{66}je ne veux pas de violence!{6D}"
		ScriptID    $3,$7A	; Run text script at offset 0x027920
					; 0xE003: PRINT	MSG 0x0051, MSGBOX CLEARED, END: "{6A}A	la prochaine!{6D}"
		ScriptJump  ShopPrice_04,$7B ; Jump to address 0x025F2C
		ScriptJump  Shop_04,$7C	; Jump to address 0x025F3A
		ScriptID    $4,$7D	; Run text script at offset 0x027922
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{6A}Mais non!{66}Vous	ne pouvez pas{66}emporter notre	matériel!{6D}"
		dc.w $2EB
		dc.b $10
		dc.b $40
		ScriptID    $56,$80	; Run text script at offset 0x0279C6
					; 0xE056: PRINT	MSG 0x00A4, MSGBOX CLEARED, END: "{6A}Je me demande{66}qui pénètre dans	ma boutique{71}{6A}Je n'ai pas vu de client{66}depuis des lustres!{6D}"
		ScriptID    $57,$81	; Run text script at offset 0x0279C8
					; 0xE057: PRINT	MSG 0x00A5, MSGBOX CLEARED, END: "{6A}Revenez me voir!{66}Vous êtes mon	unique client{66}en 200	ans!{6D}"
		ScriptJump  ShopPrice_01,$82 ; Jump to address 0x025EDE
		ScriptJump  Shop_01,$83	; Jump to address 0x025EEC
		ScriptID    $58,$84	; Run text script at offset 0x0279CA
					; 0xE058: PRINT	MSG 0x00A6, MSGBOX CLEARED, END: "{6A}Vaurien!{66}J'ai rarement vu une{66}crapule de ton espèce!{6D}"
		dc.w $2ED
		dc.b $10
		dc.b $10
		ScriptID    $5,$87	; Run text script at offset 0x027924
					; 0xE005: PRINT	MSG 0x0053, MSGBOX CLEARED, END: "{6A}Bienvenue	à{66}notre église.{6D}"
		ScriptID    $6,$88	; Run text script at offset 0x027926
					; 0xE006: PRINT	MSG 0x0054, MSGBOX CLEARED, END: "{6A}Faites attention.{66}Que la déesse vous bénisse!{6D}"
		ScriptJump  CS_NULL,$89	; Jump to address 0x027344
		ScriptJump  CS_NULL,$8A	; Jump to address 0x027344
		ScriptID    $7,$8B	; Run text script at offset 0x027928
					; 0xE007: PRINT	MSG 0x0055, MSGBOX CLEARED, END: "{6A}Arrêtez!{66}Cela appartient à la déesse.{66}Soyez	maudit!{6D}"
		dc.w $2E9
		dc.b $10
		dc.b $10
		ScriptID    $2,$8E	; Run text script at offset 0x02791E
					; 0xE002: PRINT	MSG 0x0050, MSGBOX CLEARED, END: "{6A}Bonjour!{66}Vous voulez rester?{6D}"
		ScriptID    $3,$8F	; Run text script at offset 0x027920
					; 0xE003: PRINT	MSG 0x0051, MSGBOX CLEARED, END: "{6A}A	la prochaine!{6D}"
		ScriptJump  CS_NULL,$90	; Jump to address 0x027344
		ScriptJump  CS_NULL,$91	; Jump to address 0x027344
		ScriptID    $4,$92	; Run text script at offset 0x027922
					; 0xE004: PRINT	MSG 0x0052, MSGBOX CLEARED, END: "{6A}Mais non!{66}Vous	ne pouvez pas{66}emporter notre	matériel!{6D}"
		dc.w $307
		dc.b $10
		dc.b $10
		ScriptJump  CS_NULL,$95	; Jump to address 0x027344
		ScriptJump  CS_NULL,$96	; Jump to address 0x027344
		ScriptJump  CS_NULL,$97	; Jump to address 0x027344
		ScriptJump  CS_NULL,$98	; Jump to address 0x027344
		ScriptID    $59,$99	; Run text script at offset 0x0279CC
					; 0xE059: PRINT	MSG 0x00A7, MSGBOX CLEARED, END: "{6A}Nooooon....{66}Ne	l'emportez pas!{6D}"
		dc.w $29
		dc.b $10
		dc.b $10
		ScriptID    $62,$9C	; Run text script at offset 0x0279DE
					; 0xE062: PRINT	MSG 0x00B0, MSGBOX CLEARED, END: "{6A}Ainsi, on	me rend{66}une petite visite....{66}dans ma tombe!{6D}"
		ScriptID    $63,$9D	; Run text script at offset 0x0279E0
					; 0xE063: PRINT	MSG 0x00B1, MSGBOX CLEARED, END: "{6A}J'attendrai.....{6D}"
		ScriptJump  CS_NULL,$9E	; Jump to address 0x027344
		ScriptJump  CS_NULL,$9F	; Jump to address 0x027344
		ScriptID    $59,$A0	; Run text script at offset 0x0279CC
					; 0xE059: PRINT	MSG 0x00A7, MSGBOX CLEARED, END: "{6A}Nooooon....{66}Ne	l'emportez pas!{6D}"
		dc.w $294
		dc.b $10
		dc.b $10
		ScriptID    $6E6,$A3	; Run text script at offset 0x0286E6
					; 0xE4F0: PRINT	MSG 0x053E, MSGBOX CLEARED, END: "{6A}Des articles, choisis{66}avec un soin particulier,{66}vous attendent!{6D}"
		ScriptJump  ShopLeave_08,$A4 ; Jump to address 0x0251F2
		ScriptJump  ShopPrice_08,$A5 ; Jump to address 0x02520C
		ScriptJump  Shop_08,$A6	; Jump to address 0x025240
		ScriptID    $31,$A7	; Run text script at offset 0x02797C
					; 0xE031: PRINT	MSG 0x007F, MSGBOX CLEARED, END: "{6A}Ohé!  Vous, là!!{6D}"
		dc.w $205
		dc.b $10
		dc.b $10
		ScriptID    $64,$AA	; Run text script at offset 0x0279E2
					; 0xE064: PRINT	MSG 0x00B2, MSGBOX CLEARED, END: "{6A}Bienvenue	à{66}la	boutique de souvenirs des{66}Chutes de Kelketo.{6D}"
		ScriptID    $65,$AB	; Run text script at offset 0x0279E4
					; 0xE065: PRINT	MSG 0x00B3, MSGBOX CLEARED, END: "{6A}Les Chutes de Kelketo,{66}c'est un très beau spectacle!{66}Revenez vite!{6D}"
		ScriptJump  ShopPrice_04,$AC ; Jump to address 0x025F2C
		ScriptJump  Shop_04,$AD	; Jump to address 0x025F3A
		ScriptID    $66,$AE	; Run text script at offset 0x0279E6
					; 0xE066: PRINT	MSG 0x00B4, MSGBOX CLEARED, END: "{6A}Mais...!	Vous n'êtes{66}qu'un voleur!!{6D}"
		dc.w $20E
		dc.b $13
		dc.b $30
		ScriptID    $67,$B1	; Run text script at offset 0x0279E8
					; 0xE067: PRINT	MSG 0x00B5, MSGBOX CLEARED, END: "{6A}Le frère de Kindly?{66}Oui, c'est moi!  Bienvenue{66}chez Greedly!{6D}"
		ScriptID    $29,$B2	; Run text script at offset 0x02796C
					; 0xE029: PRINT	MSG 0x0077, MSGBOX CLEARED, END: "{6A}Merci!  A	bientôt!{6D}"
		ScriptJump  ShopPrice_03,$B3 ; Jump to address 0x025F12
		ScriptJump  Shop_03,$B4	; Jump to address 0x025F20
		ScriptID    $31,$B5	; Run text script at offset 0x02797C
					; 0xE031: PRINT	MSG 0x007F, MSGBOX CLEARED, END: "{6A}Ohé!  Vous, là!!{6D}"
		dc.w $131
		dc.b $10
		dc.b $10
		ScriptID    $62,$B8	; Run text script at offset 0x0279DE
					; 0xE062: PRINT	MSG 0x00B0, MSGBOX CLEARED, END: "{6A}Ainsi, on	me rend{66}une petite visite....{66}dans ma tombe!{6D}"
		ScriptID    $63,$B9	; Run text script at offset 0x0279E0
					; 0xE063: PRINT	MSG 0x00B1, MSGBOX CLEARED, END: "{6A}J'attendrai.....{6D}"
		ScriptJump  CS_NULL,$BA	; Jump to address 0x027344
		ScriptJump  CS_NULL,$BB	; Jump to address 0x027344
		ScriptID    $59,$BC	; Run text script at offset 0x0279CC
					; 0xE059: PRINT	MSG 0x00A7, MSGBOX CLEARED, END: "{6A}Nooooon....{66}Ne	l'emportez pas!{6D}"
		dc.w $188
		dc.b $10
		dc.b $10
		ScriptJump  CS_NULL,$BF	; Jump to address 0x027344
		ScriptJump  CS_NULL,$C0	; Jump to address 0x027344
		ScriptJump  CS_NULL,$C1	; Jump to address 0x027344
		ScriptJump  CS_NULL,$C2	; Jump to address 0x027344
		ScriptID    $59,$C3	; Run text script at offset 0x0279CC
					; 0xE059: PRINT	MSG 0x00A7, MSGBOX CLEARED, END: "{6A}Nooooon....{66}Ne	l'emportez pas!{6D}"
		dc.w $FFFF
