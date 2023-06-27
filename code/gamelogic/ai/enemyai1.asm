; ---------------------------------------------------------------------------

EnemyAI_Orc1_B:					  ; CODE XREF: ROM:001A84AAj
		bra.s	loc_1A4CD6
; ---------------------------------------------------------------------------

EnemyAI_Orc1_A:					  ; CODE XREF: ROM:loc_1A84A6j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A4CA8
		move.b	$00000037(a5),d0
		beq.s	loc_1A4CAE
		cmpi.b	#$10,d0
		beq.s	loc_1A4CDA
		bra.w	loc_1A4E52
; ---------------------------------------------------------------------------

loc_1A4CA8:					  ; CODE XREF: ROM:001A4C96j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A4CAE:					  ; CODE XREF: ROM:001A4C9Cj
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A4CD6
		rts
; ---------------------------------------------------------------------------

loc_1A4CD6:					  ; CODE XREF: ROM:EnemyAI_Orc1_Bj
						  ; ROM:001A4CD2j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A4CDA:					  ; CODE XREF: ROM:001A4CA2j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A4D0A
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A4D0E
		bcs.s	loc_1A4D04
		bsr.s	sub_1A4D5C
		bcs.s	loc_1A4D04
		bsr.w	sub_1A4DAA
		bcs.s	loc_1A4D04
		bsr.w	sub_1A4DF8

loc_1A4D04:					  ; CODE XREF: ROM:001A4CF4j
						  ; ROM:001A4CF8j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A4D0A:					  ; CODE XREF: ROM:001A4CE0j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A4D0E:					  ; CODE XREF: ROM:001A4CF2p
		move.w	#$0050,d5
		move.w	#$0050,d6
		move.w	#$0050,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A4D58
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A4D58
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1A4D58
		move.b	#$20,$00000037(a5)
		move.w	#$000E,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A4D58:					  ; CODE XREF: sub_1A4D0E+10j
						  ; sub_1A4D0E+22j ...
		tst.b	d0
		rts
; End of function sub_1A4D0E


; =============== S U B	R O U T	I N E =======================================


sub_1A4D5C:					  ; CODE XREF: ROM:001A4CF6p
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A4DA6
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A4DA6
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1A4DA6
		move.b	#$21,$00000037(a5)
		move.w	#$0007,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A4DA6:					  ; CODE XREF: sub_1A4D5C+10j
						  ; sub_1A4D5C+22j ...
		tst.b	d0
		rts
; End of function sub_1A4D5C


; =============== S U B	R O U T	I N E =======================================


sub_1A4DAA:					  ; CODE XREF: ROM:001A4CFAp
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A4DF4
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A4DF4
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1A4DF4
		move.b	#$22,$00000037(a5)
		move.w	#$0008,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A4DF4:					  ; CODE XREF: sub_1A4DAA+10j
						  ; sub_1A4DAA+22j ...
		tst.b	d0
		rts
; End of function sub_1A4DAA


; =============== S U B	R O U T	I N E =======================================


sub_1A4DF8:					  ; CODE XREF: ROM:001A4D00p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A4E4E
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bcc.s	loc_1A4E34
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A4E34:					  ; CODE XREF: sub_1A4DF8+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0009,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A4E4E:					  ; CODE XREF: sub_1A4DF8+10j
		tst.b	d0
		rts
; End of function sub_1A4DF8

; ---------------------------------------------------------------------------

loc_1A4E52:					  ; CODE XREF: ROM:001A4CA4j
		andi.b	#$0F,d0
		beq.s	loc_1A4E6C
		cmpi.b	#$01,d0
		beq.s	loc_1A4E78
		cmpi.b	#$02,d0
		beq.s	loc_1A4E78
		cmpi.b	#$03,d0
		beq.s	loc_1A4E7E
		bra.s	loc_1A4E7E
; ---------------------------------------------------------------------------

loc_1A4E6C:					  ; CODE XREF: ROM:001A4E56j
		move.b	$0000002D(a5),d0
		andi.b	#$30,d0
		beq.w	loc_1A4CD6

loc_1A4E78:					  ; CODE XREF: ROM:001A4E5Cj
						  ; ROM:001A4E62j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A4E7E:					  ; CODE XREF: ROM:001A4E68j
						  ; ROM:001A4E6Aj
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	locret_1A4EB2
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1A4EB2
		beq.w	loc_1A4CD6

locret_1A4EB2:					  ; CODE XREF: ROM:001A4E8Ej
						  ; ROM:001A4EACj
		rts
; ---------------------------------------------------------------------------

EnemyAI_Orc2_B:					  ; CODE XREF: ROM:001A84B2j
		bra.s	loc_1A4EFC
; ---------------------------------------------------------------------------

EnemyAI_Orc2_A:					  ; CODE XREF: ROM:001A84AEj
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A4ECE
		move.b	$00000037(a5),d0
		beq.s	loc_1A4ED4
		cmpi.b	#$10,d0
		beq.s	loc_1A4F00
		bra.w	loc_1A5078
; ---------------------------------------------------------------------------

loc_1A4ECE:					  ; CODE XREF: ROM:001A4EBCj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A4ED4:					  ; CODE XREF: ROM:001A4EC2j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A4EFC
		rts
; ---------------------------------------------------------------------------

loc_1A4EFC:					  ; CODE XREF: ROM:EnemyAI_Orc2_Bj
						  ; ROM:001A4EF8j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A4F00:					  ; CODE XREF: ROM:001A4EC8j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A4F30
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A4F34
		bcs.s	loc_1A4F2A
		bsr.s	sub_1A4F82
		bcs.s	loc_1A4F2A
		bsr.w	sub_1A4FD0
		bcs.s	loc_1A4F2A
		bsr.w	sub_1A501E

loc_1A4F2A:					  ; CODE XREF: ROM:001A4F1Aj
						  ; ROM:001A4F1Ej ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A4F30:					  ; CODE XREF: ROM:001A4F06j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A4F34:					  ; CODE XREF: ROM:001A4F18p
		move.w	#$0050,d5
		move.w	#$0050,d6
		move.w	#$0050,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A4F7E
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A4F7E
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0008,d7
		bhi.s	loc_1A4F7E
		move.b	#$20,$00000037(a5)
		move.w	#$000E,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A4F7E:					  ; CODE XREF: sub_1A4F34+10j
						  ; sub_1A4F34+22j ...
		tst.b	d0
		rts
; End of function sub_1A4F34


; =============== S U B	R O U T	I N E =======================================


sub_1A4F82:					  ; CODE XREF: ROM:001A4F1Cp
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A4FCC
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A4FCC
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1A4FCC
		move.b	#$21,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A4FCC:					  ; CODE XREF: sub_1A4F82+10j
						  ; sub_1A4F82+22j ...
		tst.b	d0
		rts
; End of function sub_1A4F82


; =============== S U B	R O U T	I N E =======================================


sub_1A4FD0:					  ; CODE XREF: ROM:001A4F20p
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A501A
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A501A
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1A501A
		move.b	#$22,$00000037(a5)
		move.w	#$0008,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A501A:					  ; CODE XREF: sub_1A4FD0+10j
						  ; sub_1A4FD0+22j ...
		tst.b	d0
		rts
; End of function sub_1A4FD0


; =============== S U B	R O U T	I N E =======================================


sub_1A501E:					  ; CODE XREF: ROM:001A4F26p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A5074
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$003C,d7
		bcc.s	loc_1A505A
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A505A:					  ; CODE XREF: sub_1A501E+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A5074:					  ; CODE XREF: sub_1A501E+10j
		tst.b	d0
		rts
; End of function sub_1A501E

; ---------------------------------------------------------------------------

loc_1A5078:					  ; CODE XREF: ROM:001A4ECAj
		andi.b	#$0F,d0
		beq.s	loc_1A5092
		cmpi.b	#$01,d0
		beq.s	loc_1A50E0
		cmpi.b	#$02,d0
		beq.s	loc_1A50A4
		cmpi.b	#$03,d0
		beq.s	loc_1A50AA
		bra.s	loc_1A50E0
; ---------------------------------------------------------------------------

loc_1A5092:					  ; CODE XREF: ROM:001A507Cj
		move.b	$0000002D(a5),d0
		andi.b	#$30,d0
		beq.w	loc_1A4EFC
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A50A4:					  ; CODE XREF: ROM:001A5088j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A50AA:					  ; CODE XREF: ROM:001A508Ej
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	locret_1A50DE
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1A50DE
		beq.w	loc_1A4EFC

locret_1A50DE:					  ; CODE XREF: ROM:001A50BAj
						  ; ROM:001A50D8j
		rts
; ---------------------------------------------------------------------------

loc_1A50E0:					  ; CODE XREF: ROM:001A5082j
						  ; ROM:001A5090j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1A5114
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	loc_1A5114
		beq.w	loc_1A4EFC

loc_1A5114:					  ; CODE XREF: ROM:001A50F0j
						  ; ROM:001A510Ej
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

EnemyAI_Orc3_B:					  ; CODE XREF: ROM:001A84BAj
		bra.s	loc_1A5162
; ---------------------------------------------------------------------------

EnemyAI_Orc3_A:					  ; CODE XREF: ROM:001A84B6j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A5134
		move.b	$00000037(a5),d0
		beq.s	loc_1A513A
		cmpi.b	#$10,d0
		beq.s	loc_1A5166
		bra.w	loc_1A52DE
; ---------------------------------------------------------------------------

loc_1A5134:					  ; CODE XREF: ROM:001A5122j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A513A:					  ; CODE XREF: ROM:001A5128j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0040,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A5162
		rts
; ---------------------------------------------------------------------------

loc_1A5162:					  ; CODE XREF: ROM:EnemyAI_Orc3_Bj
						  ; ROM:001A515Ej ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A5166:					  ; CODE XREF: ROM:001A512Ej
		tst.b	(byte_FF1142).l
		bne.s	loc_1A5196
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A519A
		bcs.s	loc_1A5190
		bsr.s	sub_1A51E8
		bcs.s	loc_1A5190
		bsr.w	sub_1A5236
		bcs.s	loc_1A5190
		bsr.w	sub_1A5284

loc_1A5190:					  ; CODE XREF: ROM:001A5180j
						  ; ROM:001A5184j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A5196:					  ; CODE XREF: ROM:001A516Cj
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A519A:					  ; CODE XREF: ROM:001A517Ep
		move.w	#$0050,d5
		move.w	#$0050,d6
		move.w	#$0050,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A51E4
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A51E4
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0008,d7
		bhi.s	loc_1A51E4
		move.b	#$20,$00000037(a5)
		move.w	#$000E,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A51E4:					  ; CODE XREF: sub_1A519A+10j
						  ; sub_1A519A+22j ...
		tst.b	d0
		rts
; End of function sub_1A519A


; =============== S U B	R O U T	I N E =======================================


sub_1A51E8:					  ; CODE XREF: ROM:001A5182p
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A5232
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A5232
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1A5232
		move.b	#$21,$00000037(a5)
		move.w	#$0012,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A5232:					  ; CODE XREF: sub_1A51E8+10j
						  ; sub_1A51E8+22j ...
		tst.b	d0
		rts
; End of function sub_1A51E8


; =============== S U B	R O U T	I N E =======================================


sub_1A5236:					  ; CODE XREF: ROM:001A5186p
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A5280
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A5280
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1A5280
		move.b	#$22,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A5280:					  ; CODE XREF: sub_1A5236+10j
						  ; sub_1A5236+22j ...
		tst.b	d0
		rts
; End of function sub_1A5236


; =============== S U B	R O U T	I N E =======================================


sub_1A5284:					  ; CODE XREF: ROM:001A518Cp
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A52DA
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bcc.s	loc_1A52C0
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A52C0:					  ; CODE XREF: sub_1A5284+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0012,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A52DA:					  ; CODE XREF: sub_1A5284+10j
		tst.b	d0
		rts
; End of function sub_1A5284

; ---------------------------------------------------------------------------

loc_1A52DE:					  ; CODE XREF: ROM:001A5130j
		andi.b	#$0F,d0
		beq.s	loc_1A52F8
		cmpi.b	#$01,d0
		beq.s	loc_1A5340
		cmpi.b	#$02,d0
		beq.s	loc_1A5340
		cmpi.b	#$03,d0
		beq.s	loc_1A530A
		bra.s	loc_1A5340
; ---------------------------------------------------------------------------

loc_1A52F8:					  ; CODE XREF: ROM:001A52E2j
		move.b	$0000002D(a5),d0
		andi.b	#$30,d0
		beq.w	loc_1A5162
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A530A:					  ; CODE XREF: ROM:001A52F4j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	locret_1A533E
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1A533E
		beq.w	loc_1A5162

locret_1A533E:					  ; CODE XREF: ROM:001A531Aj
						  ; ROM:001A5338j
		rts
; ---------------------------------------------------------------------------

loc_1A5340:					  ; CODE XREF: ROM:001A52E8j
						  ; ROM:001A52EEj ...
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1A5374
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	loc_1A5374
		beq.w	loc_1A5162

loc_1A5374:					  ; CODE XREF: ROM:001A5350j
						  ; ROM:001A536Ej
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

EnemyAI_Worm1_B:				  ; CODE XREF: ROM:001A84C2j
		bra.s	loc_1A53C8
; ---------------------------------------------------------------------------

EnemyAI_Worm1_A:				  ; CODE XREF: ROM:001A84BEj
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A5394
		move.b	$00000037(a5),d0
		beq.s	loc_1A539A
		cmpi.b	#$10,d0
		beq.s	loc_1A53E0
		bra.w	loc_1A558A
; ---------------------------------------------------------------------------

loc_1A5394:					  ; CODE XREF: ROM:001A5382j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A539A:					  ; CODE XREF: ROM:001A5388j
		move.w	$00000012(a5),$00000054(a5)
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A53C8
		rts
; ---------------------------------------------------------------------------

loc_1A53C8:					  ; CODE XREF: ROM:EnemyAI_Worm1_Bj
						  ; ROM:001A53C4j ...
		move.w	#$0005,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A53E0:					  ; CODE XREF: ROM:001A538Ej
		tst.b	(byte_FF1142).l
		bne.s	loc_1A5414
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A5424
		bcs.s	loc_1A540E
		bsr.w	sub_1A548A
		bcs.w	loc_1A558A
		bsr.w	sub_1A54F4
		bcs.s	loc_1A540E
		bsr.w	sub_1A5550

loc_1A540E:					  ; CODE XREF: ROM:001A53FAj
						  ; ROM:001A5408j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A5414:					  ; CODE XREF: ROM:001A53E6j
		move.w	#$0005,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	LoadSpecialAI
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A5424:					  ; CODE XREF: ROM:001A53F8p

; FUNCTION CHUNK AT 001A5486 SIZE 00000004 BYTES

		move.b	$0000002F(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1A5486
		btst	#$06,$00000038(a5)
		bne.s	loc_1A5486
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A5486
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A5486
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$001F,d7
		bhi.s	loc_1A5486
; End of function sub_1A5424


; =============== S U B	R O U T	I N E =======================================


sub_1A546C:					  ; CODE XREF: sub_1A548A+46j
						  ; sub_1A54F4+3Aj ...
		move.b	#$20,$00000037(a5)
		move.w	#$0013,$00000034(a5)
		clr.b	$0000000D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; End of function sub_1A546C

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1A5424

loc_1A5486:					  ; CODE XREF: sub_1A5424+8j
						  ; sub_1A5424+12j ...
		tst.b	d0
		rts
; END OF FUNCTION CHUNK	FOR sub_1A5424

; =============== S U B	R O U T	I N E =======================================


sub_1A548A:					  ; CODE XREF: ROM:001A53FCp
		move.b	$0000002F(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1A54F0
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A54F0
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A54F0
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$001F,d7
		bhi.s	loc_1A54F0
		btst	#$06,$00000038(a5)
		beq.s	sub_1A546C
		move.b	#$21,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		clr.b	$0000000D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$01,d0
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A54F0:					  ; CODE XREF: sub_1A548A+8j
						  ; sub_1A548A+1Cj ...
		tst.b	d0
		rts
; End of function sub_1A548A


; =============== S U B	R O U T	I N E =======================================


sub_1A54F4:					  ; CODE XREF: ROM:001A5404p
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A554C
		move.w	#$0018,d5
		move.w	#$0018,d6
		move.w	#$0018,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A554C
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1A554C
		btst	#$06,$00000038(a5)
		beq.w	sub_1A546C
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A554C:					  ; CODE XREF: sub_1A54F4+10j
						  ; sub_1A54F4+22j ...
		tst.b	d0
		rts
; End of function sub_1A54F4


; =============== S U B	R O U T	I N E =======================================


sub_1A5550:					  ; CODE XREF: ROM:001A540Ap
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A5586
		btst	#$06,$00000038(a5)
		beq.w	sub_1A546C
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A5586:					  ; CODE XREF: sub_1A5550+10j
		tst.b	d0
		rts
; End of function sub_1A5550

; ---------------------------------------------------------------------------

loc_1A558A:					  ; CODE XREF: ROM:001A5390j
						  ; ROM:001A5400j
		andi.b	#$0F,d0
		beq.s	loc_1A55A8
		cmpi.b	#$01,d0
		beq.w	loc_1A5638
		cmpi.b	#$02,d0
		beq.w	loc_1A56BA
		cmpi.b	#$03,d0
		bra.w	loc_1A56BA
; ---------------------------------------------------------------------------

loc_1A55A8:					  ; CODE XREF: ROM:001A558Ej
						  ; ROM:001A56C6j
		tst.b	$0000000D(a5)
		bne.s	loc_1A55CE
		move.b	#$18,d0
		subq.b	#$01,d0
		add.b	d0,$00000055(a5)
		jsr	(sub_3BC).l
		bcc.s	loc_1A55C8
		move.w	$00000012(a5),$00000054(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A55C8:					  ; CODE XREF: ROM:001A55BEj
		bset	#$06,$00000038(a5)

loc_1A55CE:					  ; CODE XREF: ROM:001A55ACj
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$01,$0000000D(a5)
		bne.s	loc_1A55E8
		move.b	#$FF,$0000002D(a5)
		move.w	#$0040,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A55E8:					  ; CODE XREF: ROM:001A55D8j
		cmpi.b	#$0A,$0000000D(a5)
		bne.s	loc_1A55FE
		move.b	#$FF,$0000002D(a5)
		move.w	#$0080,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A55FE:					  ; CODE XREF: ROM:001A55EEj
		cmpi.b	#$14,$0000000D(a5)
		bne.s	loc_1A5614
		move.b	#$FF,$0000002D(a5)
		move.w	#$00C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5614:					  ; CODE XREF: ROM:001A5604j
		cmpi.b	#$1E,$0000000D(a5)
		bne.s	loc_1A562A
		move.b	#$FF,$0000002D(a5)
		move.w	#$0100,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A562A:					  ; CODE XREF: ROM:001A561Aj
		cmpi.b	#$32,$0000000D(a5)
		bne.w	locret_1A56B8
		bra.w	loc_1A53C8
; ---------------------------------------------------------------------------

loc_1A5638:					  ; CODE XREF: ROM:001A5594j
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$01,$0000000D(a5)
		bne.s	loc_1A5658
		bclr	#$06,$00000038(a5)
		move.b	#$FF,$0000002D(a5)
		move.w	#$0100,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5658:					  ; CODE XREF: ROM:001A5642j
		cmpi.b	#$0A,$0000000D(a5)
		bne.s	loc_1A566E
		move.b	#$FF,$0000002D(a5)
		move.w	#$00C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A566E:					  ; CODE XREF: ROM:001A565Ej
		cmpi.b	#$14,$0000000D(a5)
		bne.s	loc_1A5684
		move.b	#$FF,$0000002D(a5)
		move.w	#$0140,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5684:					  ; CODE XREF: ROM:001A5674j
		cmpi.b	#$1E,$0000000D(a5)
		bne.s	loc_1A569A
		move.b	#$FF,$0000002D(a5)
		move.w	#$0180,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A569A:					  ; CODE XREF: ROM:001A568Aj
		cmpi.b	#$28,$0000000D(a5)
		bne.s	locret_1A56B8
		move.b	#$FF,$0000002D(a5)
		move.w	#$0020,$0000002E(a5)
		move.w	$00000012(a5),$00000054(a5)
		bra.w	loc_1A53C8
; ---------------------------------------------------------------------------

locret_1A56B8:					  ; CODE XREF: ROM:001A5630j
						  ; ROM:001A56A0j
		rts
; ---------------------------------------------------------------------------

loc_1A56BA:					  ; CODE XREF: ROM:001A559Cj
						  ; ROM:001A55A4j
		btst	#$06,$00000038(a5)
		bne.s	loc_1A56CA
		bsr.w	sub_1A546C
		bra.w	loc_1A55A8
; ---------------------------------------------------------------------------

loc_1A56CA:					  ; CODE XREF: ROM:001A56C0j
		move.w	#$0300,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	locret_1A570C
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1A570C
		clr.w	$0000002C(a5)
		clr.w	$0000002E(a5)
		bset	#$06,$00000038(a5)
		bra.w	loc_1A53C8
; ---------------------------------------------------------------------------

locret_1A570C:					  ; CODE XREF: ROM:001A56DAj
						  ; ROM:001A56F8j
		rts
; ---------------------------------------------------------------------------

EnemyAI_Worm2_B:				  ; CODE XREF: ROM:001A84CAj
		bra.s	loc_1A575C
; ---------------------------------------------------------------------------

EnemyAI_Worm2_A:				  ; CODE XREF: ROM:001A84C6j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A5728
		move.b	$00000037(a5),d0
		beq.s	loc_1A572E
		cmpi.b	#$10,d0
		beq.s	loc_1A5774
		bra.w	loc_1A591E
; ---------------------------------------------------------------------------

loc_1A5728:					  ; CODE XREF: ROM:001A5716j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A572E:					  ; CODE XREF: ROM:001A571Cj
		move.w	$00000012(a5),$00000054(a5)
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A575C
		rts
; ---------------------------------------------------------------------------

loc_1A575C:					  ; CODE XREF: ROM:EnemyAI_Worm2_Bj
						  ; ROM:001A5758j ...
		move.w	#$0005,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5774:					  ; CODE XREF: ROM:001A5722j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A57A8
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A57B8
		bcs.s	loc_1A57A2
		bsr.w	sub_1A581E
		bcs.w	loc_1A591E
		bsr.w	sub_1A5888
		bcs.s	loc_1A57A2
		bsr.w	sub_1A58E4

loc_1A57A2:					  ; CODE XREF: ROM:001A578Ej
						  ; ROM:001A579Cj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A57A8:					  ; CODE XREF: ROM:001A577Aj
		move.w	#$0005,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	LoadSpecialAI
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A57B8:					  ; CODE XREF: ROM:001A578Cp

; FUNCTION CHUNK AT 001A581A SIZE 00000004 BYTES

		move.b	$0000002F(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1A581A
		btst	#$06,$00000038(a5)
		bne.s	loc_1A581A
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A581A
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A581A
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$001F,d7
		bhi.s	loc_1A581A
; End of function sub_1A57B8


; =============== S U B	R O U T	I N E =======================================


sub_1A5800:					  ; CODE XREF: sub_1A581E+46j
						  ; sub_1A5888+3Aj ...
		move.b	#$20,$00000037(a5)
		move.w	#$0013,$00000034(a5)
		clr.b	$0000000D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; End of function sub_1A5800

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1A57B8

loc_1A581A:					  ; CODE XREF: sub_1A57B8+8j
						  ; sub_1A57B8+12j ...
		tst.b	d0
		rts
; END OF FUNCTION CHUNK	FOR sub_1A57B8

; =============== S U B	R O U T	I N E =======================================


sub_1A581E:					  ; CODE XREF: ROM:001A5790p
		move.b	$0000002F(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1A5884
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A5884
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A5884
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$002B,d7
		bhi.s	loc_1A5884
		btst	#$06,$00000038(a5)
		beq.s	sub_1A5800
		move.b	#$21,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		clr.b	$0000000D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$01,d0
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A5884:					  ; CODE XREF: sub_1A581E+8j
						  ; sub_1A581E+1Cj ...
		tst.b	d0
		rts
; End of function sub_1A581E


; =============== S U B	R O U T	I N E =======================================


sub_1A5888:					  ; CODE XREF: ROM:001A5798p
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A58E0
		move.w	#$0018,d5
		move.w	#$0018,d6
		move.w	#$0018,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A58E0
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$001F,d7
		bhi.s	loc_1A58E0
		btst	#$06,$00000038(a5)
		beq.w	sub_1A5800
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A58E0:					  ; CODE XREF: sub_1A5888+10j
						  ; sub_1A5888+22j ...
		tst.b	d0
		rts
; End of function sub_1A5888


; =============== S U B	R O U T	I N E =======================================


sub_1A58E4:					  ; CODE XREF: ROM:001A579Ep
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A591A
		btst	#$06,$00000038(a5)
		beq.w	sub_1A5800
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A591A:					  ; CODE XREF: sub_1A58E4+10j
		tst.b	d0
		rts
; End of function sub_1A58E4

; ---------------------------------------------------------------------------

loc_1A591E:					  ; CODE XREF: ROM:001A5724j
						  ; ROM:001A5794j
		andi.b	#$0F,d0
		beq.s	loc_1A593C
		cmpi.b	#$01,d0
		beq.w	loc_1A59CC
		cmpi.b	#$02,d0
		beq.w	loc_1A5A4E
		cmpi.b	#$03,d0
		bra.w	loc_1A5AC8
; ---------------------------------------------------------------------------

loc_1A593C:					  ; CODE XREF: ROM:001A5922j
						  ; ROM:001A5A5Aj ...
		tst.b	$0000000D(a5)
		bne.s	loc_1A5962
		move.b	#$18,d0
		subq.b	#$01,d0
		add.b	d0,$00000055(a5)
		jsr	(sub_3BC).l
		bcc.s	loc_1A595C
		move.w	$00000012(a5),$00000054(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A595C:					  ; CODE XREF: ROM:001A5952j
		bset	#$06,$00000038(a5)

loc_1A5962:					  ; CODE XREF: ROM:001A5940j
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$01,$0000000D(a5)
		bne.s	loc_1A597C
		move.b	#$FF,$0000002D(a5)
		move.w	#$0040,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A597C:					  ; CODE XREF: ROM:001A596Cj
		cmpi.b	#$0A,$0000000D(a5)
		bne.s	loc_1A5992
		move.b	#$FF,$0000002D(a5)
		move.w	#$0080,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5992:					  ; CODE XREF: ROM:001A5982j
		cmpi.b	#$14,$0000000D(a5)
		bne.s	loc_1A59A8
		move.b	#$FF,$0000002D(a5)
		move.w	#$00C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A59A8:					  ; CODE XREF: ROM:001A5998j
		cmpi.b	#$1E,$0000000D(a5)
		bne.s	loc_1A59BE
		move.b	#$FF,$0000002D(a5)
		move.w	#$0100,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A59BE:					  ; CODE XREF: ROM:001A59AEj
		cmpi.b	#$32,$0000000D(a5)
		bne.w	locret_1A5A4C
		bra.w	loc_1A575C
; ---------------------------------------------------------------------------

loc_1A59CC:					  ; CODE XREF: ROM:001A5928j
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$01,$0000000D(a5)
		bne.s	loc_1A59EC
		bclr	#$06,$00000038(a5)
		move.b	#$FF,$0000002D(a5)
		move.w	#$0100,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A59EC:					  ; CODE XREF: ROM:001A59D6j
		cmpi.b	#$0A,$0000000D(a5)
		bne.s	loc_1A5A02
		move.b	#$FF,$0000002D(a5)
		move.w	#$00C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5A02:					  ; CODE XREF: ROM:001A59F2j
		cmpi.b	#$14,$0000000D(a5)
		bne.s	loc_1A5A18
		move.b	#$FF,$0000002D(a5)
		move.w	#$0140,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5A18:					  ; CODE XREF: ROM:001A5A08j
		cmpi.b	#$1E,$0000000D(a5)
		bne.s	loc_1A5A2E
		move.b	#$FF,$0000002D(a5)
		move.w	#$0180,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5A2E:					  ; CODE XREF: ROM:001A5A1Ej
		cmpi.b	#$28,$0000000D(a5)
		bne.s	locret_1A5A4C
		move.b	#$FF,$0000002D(a5)
		move.w	#$0020,$0000002E(a5)
		move.w	$00000012(a5),$00000054(a5)
		bra.w	loc_1A575C
; ---------------------------------------------------------------------------

locret_1A5A4C:					  ; CODE XREF: ROM:001A59C4j
						  ; ROM:001A5A34j
		rts
; ---------------------------------------------------------------------------

loc_1A5A4E:					  ; CODE XREF: ROM:001A5930j
		btst	#$06,$00000038(a5)
		bne.s	loc_1A5A5E
		bsr.w	sub_1A5800
		bra.w	loc_1A593C
; ---------------------------------------------------------------------------

loc_1A5A5E:					  ; CODE XREF: ROM:001A5A54j
		move.w	#$0300,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0C,$0000000D(a5)
		bcs.w	locret_1A5B1A
		move.w	#$0500,$0000002C(a5)
		move.w	#$0018,d1
		move.w	#$0000,d2
		move.w	#$0008,d3
		bsr.w	sub_1A880C
		bcc.s	loc_1A5AAC
		cmpi.b	#$0C,$0000000D(a5)
		bne.s	loc_1A5AAC
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.b	#$28,d7
		bcc.s	locret_1A5AC6
		move.b	#STATUS_POISON,d0
		bsr.w	j_j_AddStatusEffect
		bra.s	locret_1A5AC6
; ---------------------------------------------------------------------------

loc_1A5AAC:					  ; CODE XREF: ROM:001A5A88j
						  ; ROM:001A5A90j
		cmpi.b	#$18,$0000000D(a5)
		bcs.s	locret_1A5AC6
		move.w	#$0600,$0000002C(a5)
		cmpi.b	#$20,$0000000D(a5)
		bcs.s	locret_1A5AC6
		bra.w	loc_1A5B08
; ---------------------------------------------------------------------------

locret_1A5AC6:					  ; CODE XREF: ROM:001A5AA0j
						  ; ROM:001A5AAAj ...
		rts
; ---------------------------------------------------------------------------

loc_1A5AC8:					  ; CODE XREF: ROM:001A5938j
		btst	#$06,$00000038(a5)
		bne.s	loc_1A5AD8
		bsr.w	sub_1A5800
		bra.w	loc_1A593C
; ---------------------------------------------------------------------------

loc_1A5AD8:					  ; CODE XREF: ROM:001A5ACEj
		move.w	#$0300,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	locret_1A5B1A
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1A5B1A

loc_1A5B08:					  ; CODE XREF: ROM:001A5AC2j
		clr.w	$0000002C(a5)
		clr.w	$0000002E(a5)
		bset	#$06,$00000038(a5)
		bra.w	loc_1A575C
; ---------------------------------------------------------------------------

locret_1A5B1A:					  ; CODE XREF: ROM:001A5A6Ej
						  ; ROM:001A5AE8j ...
		rts
; ---------------------------------------------------------------------------

EnemyAI_Worm3_B:				  ; CODE XREF: ROM:001A84D2j
		bra.s	loc_1A5B6A
; ---------------------------------------------------------------------------

EnemyAI_Worm3_A:				  ; CODE XREF: ROM:001A84CEj
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A5B36
		move.b	$00000037(a5),d0
		beq.s	loc_1A5B3C
		cmpi.b	#$10,d0
		beq.s	loc_1A5B82
		bra.w	loc_1A5D2C
; ---------------------------------------------------------------------------

loc_1A5B36:					  ; CODE XREF: ROM:001A5B24j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A5B3C:					  ; CODE XREF: ROM:001A5B2Aj
		move.w	$00000012(a5),$00000054(a5)
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A5B6A
		rts
; ---------------------------------------------------------------------------

loc_1A5B6A:					  ; CODE XREF: ROM:EnemyAI_Worm3_Bj
						  ; ROM:001A5B66j ...
		move.w	#$0005,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5B82:					  ; CODE XREF: ROM:001A5B30j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A5BB6
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A5BC6
		bcs.s	loc_1A5BB0
		bsr.w	sub_1A5C2C
		bcs.w	loc_1A5D2C
		bsr.w	sub_1A5C96
		bcs.s	loc_1A5BB0
		bsr.w	sub_1A5CF2

loc_1A5BB0:					  ; CODE XREF: ROM:001A5B9Cj
						  ; ROM:001A5BAAj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A5BB6:					  ; CODE XREF: ROM:001A5B88j
		move.w	#$0005,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	LoadSpecialAI
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A5BC6:					  ; CODE XREF: ROM:001A5B9Ap

; FUNCTION CHUNK AT 001A5C28 SIZE 00000004 BYTES

		move.b	$0000002F(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1A5C28
		btst	#$06,$00000038(a5)
		bne.s	loc_1A5C28
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A5C28
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A5C28
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0025,d7
		bhi.s	loc_1A5C28
; End of function sub_1A5BC6


; =============== S U B	R O U T	I N E =======================================


sub_1A5C0E:					  ; CODE XREF: sub_1A5C2C+46j
						  ; sub_1A5C96+3Aj ...
		move.b	#$20,$00000037(a5)
		move.w	#$0013,$00000034(a5)
		clr.b	$0000000D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; End of function sub_1A5C0E

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1A5BC6

loc_1A5C28:					  ; CODE XREF: sub_1A5BC6+8j
						  ; sub_1A5BC6+12j ...
		tst.b	d0
		rts
; END OF FUNCTION CHUNK	FOR sub_1A5BC6

; =============== S U B	R O U T	I N E =======================================


sub_1A5C2C:					  ; CODE XREF: ROM:001A5B9Ep
		move.b	$0000002F(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1A5C92
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A5C92
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A5C92
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bhi.s	loc_1A5C92
		btst	#$06,$00000038(a5)
		beq.s	sub_1A5C0E
		move.b	#$21,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		clr.b	$0000000D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$01,d0
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A5C92:					  ; CODE XREF: sub_1A5C2C+8j
						  ; sub_1A5C2C+1Cj ...
		tst.b	d0
		rts
; End of function sub_1A5C2C


; =============== S U B	R O U T	I N E =======================================


sub_1A5C96:					  ; CODE XREF: ROM:001A5BA6p
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A5CEE
		move.w	#$0018,d5
		move.w	#$0018,d6
		move.w	#$0018,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A5CEE
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0025,d7
		bhi.s	loc_1A5CEE
		btst	#$06,$00000038(a5)
		beq.w	sub_1A5C0E
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A5CEE:					  ; CODE XREF: sub_1A5C96+10j
						  ; sub_1A5C96+22j ...
		tst.b	d0
		rts
; End of function sub_1A5C96


; =============== S U B	R O U T	I N E =======================================


sub_1A5CF2:					  ; CODE XREF: ROM:001A5BACp
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A5D28
		btst	#$06,$00000038(a5)
		beq.w	sub_1A5C0E
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A5D28:					  ; CODE XREF: sub_1A5CF2+10j
		tst.b	d0
		rts
; End of function sub_1A5CF2

; ---------------------------------------------------------------------------

loc_1A5D2C:					  ; CODE XREF: ROM:001A5B32j
						  ; ROM:001A5BA2j
		andi.b	#$0F,d0
		beq.s	loc_1A5D4A
		cmpi.b	#$01,d0
		beq.w	loc_1A5DDA
		cmpi.b	#$02,d0
		beq.w	loc_1A5E5C
		cmpi.b	#$03,d0
		bra.w	loc_1A5EE4
; ---------------------------------------------------------------------------

loc_1A5D4A:					  ; CODE XREF: ROM:001A5D30j
						  ; ROM:001A5E68j ...
		tst.b	$0000000D(a5)
		bne.s	loc_1A5D70
		move.b	#$18,d0
		subq.b	#$01,d0
		add.b	d0,$00000055(a5)
		jsr	(sub_3BC).l
		bcc.s	loc_1A5D6A
		move.w	$00000012(a5),$00000054(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5D6A:					  ; CODE XREF: ROM:001A5D60j
		bset	#$06,$00000038(a5)

loc_1A5D70:					  ; CODE XREF: ROM:001A5D4Ej
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$01,$0000000D(a5)
		bne.s	loc_1A5D8A
		move.b	#$FF,$0000002D(a5)
		move.w	#$0040,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5D8A:					  ; CODE XREF: ROM:001A5D7Aj
		cmpi.b	#$0A,$0000000D(a5)
		bne.s	loc_1A5DA0
		move.b	#$FF,$0000002D(a5)
		move.w	#$0080,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5DA0:					  ; CODE XREF: ROM:001A5D90j
		cmpi.b	#$14,$0000000D(a5)
		bne.s	loc_1A5DB6
		move.b	#$FF,$0000002D(a5)
		move.w	#$00C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5DB6:					  ; CODE XREF: ROM:001A5DA6j
		cmpi.b	#$1E,$0000000D(a5)
		bne.s	loc_1A5DCC
		move.b	#$FF,$0000002D(a5)
		move.w	#$0100,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5DCC:					  ; CODE XREF: ROM:001A5DBCj
		cmpi.b	#$32,$0000000D(a5)
		bne.w	locret_1A5E5A
		bra.w	loc_1A5B6A
; ---------------------------------------------------------------------------

loc_1A5DDA:					  ; CODE XREF: ROM:001A5D36j
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$01,$0000000D(a5)
		bne.s	loc_1A5DFA
		bclr	#$06,$00000038(a5)
		move.b	#$FF,$0000002D(a5)
		move.w	#$0100,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5DFA:					  ; CODE XREF: ROM:001A5DE4j
		cmpi.b	#$0A,$0000000D(a5)
		bne.s	loc_1A5E10
		move.b	#$FF,$0000002D(a5)
		move.w	#$00C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5E10:					  ; CODE XREF: ROM:001A5E00j
		cmpi.b	#$14,$0000000D(a5)
		bne.s	loc_1A5E26
		move.b	#$FF,$0000002D(a5)
		move.w	#$0140,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5E26:					  ; CODE XREF: ROM:001A5E16j
		cmpi.b	#$1E,$0000000D(a5)
		bne.s	loc_1A5E3C
		move.b	#$FF,$0000002D(a5)
		move.w	#$0180,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5E3C:					  ; CODE XREF: ROM:001A5E2Cj
		cmpi.b	#$28,$0000000D(a5)
		bne.s	locret_1A5E5A
		move.b	#$FF,$0000002D(a5)
		move.w	#$0020,$0000002E(a5)
		move.w	$00000012(a5),$00000054(a5)
		bra.w	loc_1A5B6A
; ---------------------------------------------------------------------------

locret_1A5E5A:					  ; CODE XREF: ROM:001A5DD2j
						  ; ROM:001A5E42j
		rts
; ---------------------------------------------------------------------------

loc_1A5E5C:					  ; CODE XREF: ROM:001A5D3Ej
		btst	#$06,$00000038(a5)
		bne.s	loc_1A5E6C
		bsr.w	sub_1A5C0E
		bra.w	loc_1A5D4A
; ---------------------------------------------------------------------------

loc_1A5E6C:					  ; CODE XREF: ROM:001A5E62j
		move.w	#$0300,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0C,$0000000D(a5)
		bcs.w	locret_1A5F36
		move.w	#$0500,$0000002C(a5)
		move.w	#$0020,d1
		move.w	#$0000,d2
		move.w	#$0008,d3
		bsr.w	sub_1A880C
		bcc.s	loc_1A5EC8
		cmpi.b	#$0C,$0000000D(a5)
		bne.s	loc_1A5EC8
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		move.b	#$00,d0
		cmpi.b	#$0A,d7
		bcs.s	loc_1A5EC2
		move.b	#$02,d0
		cmpi.b	#$0A,d7
		bcs.s	loc_1A5EC2
		move.b	#STATUS_CONFUSION,d0

loc_1A5EC2:					  ; CODE XREF: ROM:001A5EB2j
						  ; ROM:001A5EBCj
		bsr.w	j_j_AddStatusEffect
		bra.s	locret_1A5EE2
; ---------------------------------------------------------------------------

loc_1A5EC8:					  ; CODE XREF: ROM:001A5E96j
						  ; ROM:001A5E9Ej
		cmpi.b	#$18,$0000000D(a5)
		bcs.s	locret_1A5EE2
		move.w	#$0600,$0000002C(a5)
		cmpi.b	#$20,$0000000D(a5)
		bcs.s	locret_1A5EE2
		bra.w	loc_1A5F24
; ---------------------------------------------------------------------------

locret_1A5EE2:					  ; CODE XREF: ROM:001A5EC6j
						  ; ROM:001A5ECEj ...
		rts
; ---------------------------------------------------------------------------

loc_1A5EE4:					  ; CODE XREF: ROM:001A5D46j
		btst	#$06,$00000038(a5)
		bne.s	loc_1A5EF4
		bsr.w	sub_1A5C0E
		bra.w	loc_1A5D4A
; ---------------------------------------------------------------------------

loc_1A5EF4:					  ; CODE XREF: ROM:001A5EEAj
		move.w	#$0300,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	locret_1A5F36
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1A5F36

loc_1A5F24:					  ; CODE XREF: ROM:001A5EDEj
		clr.w	$0000002C(a5)
		clr.w	$0000002E(a5)
		bset	#$06,$00000038(a5)
		bra.w	loc_1A5B6A
; ---------------------------------------------------------------------------

locret_1A5F36:					  ; CODE XREF: ROM:001A5E7Cj
						  ; ROM:001A5F04j ...
		rts
; ---------------------------------------------------------------------------

EnemyAI_Ninja1_B:				  ; CODE XREF: ROM:001A84DAj
		bra.s	loc_1A5F80
; ---------------------------------------------------------------------------

EnemyAI_Ninja1_A:				  ; CODE XREF: ROM:001A84D6j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A5F52
		move.b	$00000037(a5),d0
		beq.s	loc_1A5F58
		cmpi.b	#$10,d0
		beq.s	loc_1A5F84
		bra.w	loc_1A60DC
; ---------------------------------------------------------------------------

loc_1A5F52:					  ; CODE XREF: ROM:001A5F40j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A5F58:					  ; CODE XREF: ROM:001A5F46j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A5F80
		rts
; ---------------------------------------------------------------------------

loc_1A5F80:					  ; CODE XREF: ROM:EnemyAI_Ninja1_Bj
						  ; ROM:001A5F7Cj ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A5F84:					  ; CODE XREF: ROM:001A5F4Cj
		tst.b	(byte_FF1142).l
		bne.s	loc_1A5FB4
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A5FB8
		bcs.s	loc_1A5FAE
		bsr.s	sub_1A5FF8
		bcs.s	loc_1A5FAE
		bsr.w	sub_1A6034
		bcs.s	loc_1A5FAE
		bsr.w	sub_1A6082

loc_1A5FAE:					  ; CODE XREF: ROM:001A5F9Ej
						  ; ROM:001A5FA2j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A5FB4:					  ; CODE XREF: ROM:001A5F8Aj
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A5FB8:					  ; CODE XREF: ROM:001A5F9Cp
		move.w	#$0040,d5
		move.w	#$FFC8,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A5FF4
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0025,d7
		bhi.s	loc_1A5FF4
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A5FF4:					  ; CODE XREF: sub_1A5FB8+10j
						  ; sub_1A5FB8+20j
		tst.b	d0
		rts
; End of function sub_1A5FB8


; =============== S U B	R O U T	I N E =======================================


sub_1A5FF8:					  ; CODE XREF: ROM:001A5FA0p
		move.w	#$0038,d5
		move.w	#$FFD0,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6030
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1A6030
		move.b	#$21,$00000037(a5)
		move.w	#$0008,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6030:					  ; CODE XREF: sub_1A5FF8+10j
						  ; sub_1A5FF8+20j
		tst.b	d0
		rts
; End of function sub_1A5FF8


; =============== S U B	R O U T	I N E =======================================


sub_1A6034:					  ; CODE XREF: ROM:001A5FA4p
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A607E
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A607E
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1A607E
		move.b	#$22,$00000037(a5)
		move.w	#$0012,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A607E:					  ; CODE XREF: sub_1A6034+10j
						  ; sub_1A6034+22j ...
		tst.b	d0
		rts
; End of function sub_1A6034


; =============== S U B	R O U T	I N E =======================================


sub_1A6082:					  ; CODE XREF: ROM:001A5FAAp
		move.w	#$0016,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A60D8
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0028,d7
		bcc.s	loc_1A60BE
		move.b	#$23,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A60BE:					  ; CODE XREF: sub_1A6082+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A60D8:					  ; CODE XREF: sub_1A6082+10j
		tst.b	d0
		rts
; End of function sub_1A6082

; ---------------------------------------------------------------------------

loc_1A60DC:					  ; CODE XREF: ROM:001A5F4Ej
		andi.b	#$0F,d0
		beq.s	loc_1A60FA
		cmpi.b	#$01,d0
		beq.s	loc_1A6152
		cmpi.b	#$02,d0
		beq.s	loc_1A6158
		cmpi.b	#$03,d0
		beq.w	loc_1A6158
		bra.w	loc_1A6158
; ---------------------------------------------------------------------------

loc_1A60FA:					  ; CODE XREF: ROM:001A60E0j
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0040,d5
		move.w	#$FFC8,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1A5F80
		addq.b	#$01,$0000000D(a5)
		move.b	$0000000D(a5),d0
		cmpi.b	#$80,d0
		beq.w	loc_1A5F80
		andi.b	#$0F,d0
		cmpi.b	#$01,d0
		bne.s	locret_1A6150
		move.b	#$FF,$0000002D(a5)
		move.b	$0000000D(a5),d0
		andi.w	#$0010,d0
		addi.b	#$10,d0
		lsl.b	#$02,d0
		move.w	d0,$0000002E(a5)

locret_1A6150:					  ; CODE XREF: ROM:001A6136j
		rts
; ---------------------------------------------------------------------------

loc_1A6152:					  ; CODE XREF: ROM:001A60E6j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A6158:					  ; CODE XREF: ROM:001A60ECj
						  ; ROM:001A60F2j ...
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1A618C
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	loc_1A618C
		beq.w	loc_1A5F80

loc_1A618C:					  ; CODE XREF: ROM:001A6168j
						  ; ROM:001A6186j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

EnemyAI_Ninja2_B:				  ; CODE XREF: ROM:001A84E2j
		bra.s	loc_1A61DA
; ---------------------------------------------------------------------------

EnemyAI_Ninja2_A:				  ; CODE XREF: ROM:001A84DEj
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A61AC
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A61B2
		cmpi.b	#$10,d0
		beq.s	loc_1A61DE
		bra.w	loc_1A633A
; ---------------------------------------------------------------------------

loc_1A61AC:					  ; CODE XREF: ROM:001A619Aj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A61B2:					  ; CODE XREF: ROM:001A61A0j
		bsr.w	LoadSpecialAI
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A61DA
		rts
; ---------------------------------------------------------------------------

loc_1A61DA:					  ; CODE XREF: ROM:EnemyAI_Ninja2_Bj
						  ; ROM:001A61D6j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A61DE:					  ; CODE XREF: ROM:001A61A6j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A620E
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A6212
		bcs.s	loc_1A6208
		bsr.s	sub_1A6252
		bcs.s	loc_1A6208
		bsr.w	sub_1A628E
		bcs.s	loc_1A6208
		bsr.w	sub_1A62E0

loc_1A6208:					  ; CODE XREF: ROM:001A61F8j
						  ; ROM:001A61FCj ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A620E:					  ; CODE XREF: ROM:001A61E4j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A6212:					  ; CODE XREF: ROM:001A61F6p
		move.w	#$0040,d5
		move.w	#$FFC8,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A624E
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0025,d7
		bhi.s	loc_1A624E
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A624E:					  ; CODE XREF: sub_1A6212+10j
						  ; sub_1A6212+20j
		tst.b	d0
		rts
; End of function sub_1A6212


; =============== S U B	R O U T	I N E =======================================


sub_1A6252:					  ; CODE XREF: ROM:001A61FAp
		move.w	#$0038,d5
		move.w	#$FFD0,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A628A
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1A628A
		move.b	#$21,$00000037(a5)
		move.w	#$0008,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A628A:					  ; CODE XREF: sub_1A6252+10j
						  ; sub_1A6252+20j
		tst.b	d0
		rts
; End of function sub_1A6252


; =============== S U B	R O U T	I N E =======================================


sub_1A628E:					  ; CODE XREF: ROM:001A61FEp
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A62DC
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A62DC
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1A62DC
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A62DC:					  ; CODE XREF: sub_1A628E+10j
						  ; sub_1A628E+22j ...
		tst.b	d0
		rts
; End of function sub_1A628E


; =============== S U B	R O U T	I N E =======================================


sub_1A62E0:					  ; CODE XREF: ROM:001A6204p
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6336
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bcc.s	loc_1A631C
		move.b	#$23,$00000037(a5)
		move.w	#$0012,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A631C:					  ; CODE XREF: sub_1A62E0+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6336:					  ; CODE XREF: sub_1A62E0+10j
		tst.b	d0
		rts
; End of function sub_1A62E0

; ---------------------------------------------------------------------------

loc_1A633A:					  ; CODE XREF: ROM:001A61A8j
		andi.b	#$0F,d0
		beq.s	loc_1A6358
		cmpi.b	#$01,d0
		beq.s	loc_1A63B0
		cmpi.b	#$02,d0
		beq.s	loc_1A63B6
		cmpi.b	#$03,d0
		beq.w	loc_1A645C
		bra.w	loc_1A645C
; ---------------------------------------------------------------------------

loc_1A6358:					  ; CODE XREF: ROM:001A633Ej
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0040,d5
		move.w	#$FFC8,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1A61DA
		addq.b	#$01,$0000000D(a5)
		move.b	$0000000D(a5),d0
		cmpi.b	#$80,d0
		beq.w	loc_1A61DA
		andi.b	#$0F,d0
		cmpi.b	#$01,d0
		bne.s	locret_1A63AE
		move.b	#$FF,$0000002D(a5)
		move.b	$0000000D(a5),d0
		andi.w	#$0010,d0
		addi.b	#$10,d0
		lsl.b	#$02,d0
		move.w	d0,$0000002E(a5)

locret_1A63AE:					  ; CODE XREF: ROM:001A6394j
		rts
; ---------------------------------------------------------------------------

loc_1A63B0:					  ; CODE XREF: ROM:001A6344j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A63B6:					  ; CODE XREF: ROM:001A634Aj
		move.l	(a5),d0
		movem.l	d0,-(sp)
		move.w	(Player_CentreX).l,d1
		move.w	(Player_CentreY).l,d2
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		beq.s	loc_1A63E2
		cmpi.b	#$80,d0
		beq.s	loc_1A63E8
		bhi.s	loc_1A63EE
		addi.w	#$0018,d1
		bra.s	loc_1A63F2
; ---------------------------------------------------------------------------

loc_1A63E2:					  ; CODE XREF: ROM:001A63D2j
		subi.w	#$0018,d2
		bra.s	loc_1A63F2
; ---------------------------------------------------------------------------

loc_1A63E8:					  ; CODE XREF: ROM:001A63D8j
		addi.w	#$0018,d2
		bra.s	loc_1A63F2
; ---------------------------------------------------------------------------

loc_1A63EE:					  ; CODE XREF: ROM:001A63DAj
		subi.w	#$0018,d1

loc_1A63F2:					  ; CODE XREF: ROM:001A63E0j
						  ; ROM:001A63E6j ...
		move.w	d1,d0
		lsr.w	#$04,d1
		move.b	d1,(a5)
		andi.b	#$0F,d0
		move.b	d0,$00000002(a5)
		move.w	d2,d0
		lsr.w	#$04,d2
		move.b	d2,$00000001(a5)
		andi.b	#$0F,d0
		move.b	d0,$00000003(a5)
		movea.l	a5,a1
		jsr	(sub_1A8AE6).l
		jsr	(sub_3BC).l
		bcc.s	loc_1A6432
		movem.l	(sp)+,d0
		move.l	d0,(a5)
		movea.l	a5,a1
		jsr	(sub_1A8AE6).l
		bra.w	loc_1A61DA
; ---------------------------------------------------------------------------

loc_1A6432:					  ; CODE XREF: ROM:001A641Ej
		bset	#$05,$0000002D(a5)
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		andi.b	#$3F,$00000004(a5)
		or.b	d0,$00000004(a5)
		movem.l	(sp)+,d0
		move.b	#$23,$00000037(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A645C:					  ; CODE XREF: ROM:001A6350j
						  ; ROM:001A6354j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1A6490
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	loc_1A6490
		beq.w	loc_1A61DA

loc_1A6490:					  ; CODE XREF: ROM:001A646Cj
						  ; ROM:001A648Aj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

EnemyAI_Ninja3_B:				  ; CODE XREF: ROM:001A84EAj
		bra.s	loc_1A64DE
; ---------------------------------------------------------------------------

EnemyAI_Ninja3_A:				  ; CODE XREF: ROM:001A84E6j
		btst	#$01,Flags2(a5)
		bne.s	loc_1A64B0
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A64B6
		cmpi.b	#$10,d0
		beq.s	loc_1A64E2
		bra.w	loc_1A662C
; ---------------------------------------------------------------------------

loc_1A64B0:					  ; CODE XREF: ROM:001A649Ej
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A64B6:					  ; CODE XREF: ROM:001A64A4j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A64DE
		rts
; ---------------------------------------------------------------------------

loc_1A64DE:					  ; CODE XREF: ROM:EnemyAI_Ninja3_Bj
						  ; ROM:001A64DAj ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A64E2:					  ; CODE XREF: ROM:001A64AAj
		tst.b	(byte_FF1142).l
		bne.s	loc_1A6512
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A6516
		bcs.s	loc_1A650C
		bsr.s	sub_1A6556
		bcs.s	loc_1A650C
		bsr.w	sub_1A6592
		bcs.s	loc_1A650C
		bsr.w	sub_1A65D2

loc_1A650C:					  ; CODE XREF: ROM:001A64FCj
						  ; ROM:001A6500j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A6512:					  ; CODE XREF: ROM:001A64E8j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A6516:					  ; CODE XREF: ROM:001A64FAp
		move.w	#$0040,d5
		move.w	#$FFC8,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6552
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0019,d7
		bhi.s	loc_1A6552
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6552:					  ; CODE XREF: sub_1A6516+10j
						  ; sub_1A6516+20j
		tst.b	d0
		rts
; End of function sub_1A6516


; =============== S U B	R O U T	I N E =======================================


sub_1A6556:					  ; CODE XREF: ROM:001A64FEp
		move.w	#$0038,d5
		move.w	#$FFD0,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A658E
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1A658E
		move.b	#$21,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A658E:					  ; CODE XREF: sub_1A6556+10j
						  ; sub_1A6556+20j
		tst.b	d0
		rts
; End of function sub_1A6556


; =============== S U B	R O U T	I N E =======================================


sub_1A6592:					  ; CODE XREF: ROM:001A6502p
		move.w	#$0038,d5
		move.w	#$FFD0,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A65CE
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1A65CE
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A65CE:					  ; CODE XREF: sub_1A6592+10j
						  ; sub_1A6592+20j
		tst.b	d0
		rts
; End of function sub_1A6592


; =============== S U B	R O U T	I N E =======================================


sub_1A65D2:					  ; CODE XREF: ROM:001A6508p
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6628
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0046,d7
		bcc.s	loc_1A660E
		move.b	#$23,$00000037(a5)
		move.w	#$0012,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A660E:					  ; CODE XREF: sub_1A65D2+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6628:					  ; CODE XREF: sub_1A65D2+10j
		tst.b	d0
		rts
; End of function sub_1A65D2

; ---------------------------------------------------------------------------

loc_1A662C:					  ; CODE XREF: ROM:001A64ACj
		andi.b	#$0F,d0
		beq.s	loc_1A664A
		cmpi.b	#$01,d0
		beq.s	loc_1A66A2
		cmpi.b	#$02,d0
		beq.s	loc_1A66B6
		cmpi.b	#$03,d0
		beq.w	loc_1A676A
		bra.w	loc_1A676A
; ---------------------------------------------------------------------------

loc_1A664A:					  ; CODE XREF: ROM:001A6630j
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0040,d5
		move.w	#$FFC8,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1A64DE
		addq.b	#$01,$0000000D(a5)
		move.b	$0000000D(a5),d0
		cmpi.b	#$80,d0
		beq.w	loc_1A64DE
		andi.b	#$0F,d0
		cmpi.b	#$01,d0
		bne.s	locret_1A66A0
		move.b	#$FF,$0000002D(a5)
		move.b	$0000000D(a5),d0
		andi.w	#$0010,d0
		addi.b	#$10,d0
		lsl.b	#$02,d0
		move.w	d0,$0000002E(a5)

locret_1A66A0:					  ; CODE XREF: ROM:001A6686j
		rts
; ---------------------------------------------------------------------------

loc_1A66A2:					  ; CODE XREF: ROM:001A6636j
		move.l	(a5),d0
		movem.l	d0,-(sp)
		move.b	(Player_RotationAndSize).l,d0
		eori.b	#$80,d0
		clr.b	d1
		bra.s	loc_1A66C6
; ---------------------------------------------------------------------------

loc_1A66B6:					  ; CODE XREF: ROM:001A663Cj
		move.l	(a5),d0
		movem.l	d0,-(sp)
		move.b	(Player_RotationAndSize).l,d0
		move.b	#$80,d1

loc_1A66C6:					  ; CODE XREF: ROM:001A66B4j
		movem.w	d1,-(sp)
		move.w	(Player_CentreX).l,d1
		move.w	(Player_CentreY).l,d2
		andi.b	#$C0,d0
		beq.s	loc_1A66EA
		cmpi.b	#$80,d0
		beq.s	loc_1A66F0
		bhi.s	loc_1A66F6
		addi.w	#$0018,d1
		bra.s	loc_1A66FA
; ---------------------------------------------------------------------------

loc_1A66EA:					  ; CODE XREF: ROM:001A66DAj
		subi.w	#$0018,d2
		bra.s	loc_1A66FA
; ---------------------------------------------------------------------------

loc_1A66F0:					  ; CODE XREF: ROM:001A66E0j
		addi.w	#$0018,d2
		bra.s	loc_1A66FA
; ---------------------------------------------------------------------------

loc_1A66F6:					  ; CODE XREF: ROM:001A66E2j
		subi.w	#$0018,d1

loc_1A66FA:					  ; CODE XREF: ROM:001A66E8j
						  ; ROM:001A66EEj ...
		move.w	d1,d0
		lsr.w	#$04,d1
		move.b	d1,(a5)
		andi.b	#$0F,d0
		move.b	d0,$00000002(a5)
		move.w	d2,d0
		lsr.w	#$04,d2
		move.b	d2,$00000001(a5)
		andi.b	#$0F,d0
		move.b	d0,$00000003(a5)
		movea.l	a5,a1
		jsr	(sub_1A8AE6).l
		jsr	(sub_3BC).l
		bcc.s	loc_1A673E
		movem.w	(sp)+,d1
		movem.l	(sp)+,d0
		move.l	d0,(a5)
		movea.l	a5,a1
		jsr	(sub_1A8AE6).l
		bra.w	loc_1A64DE
; ---------------------------------------------------------------------------

loc_1A673E:					  ; CODE XREF: ROM:001A6726j
		movem.w	(sp)+,d1
		bset	#$05,$0000002D(a5)
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		eor.b	d1,d0
		andi.b	#$3F,$00000004(a5)
		or.b	d0,$00000004(a5)
		movem.l	(sp)+,d0
		move.b	#$23,$00000037(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A676A:					  ; CODE XREF: ROM:001A6642j
						  ; ROM:001A6646j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1A679E
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	loc_1A679E
		beq.w	loc_1A64DE

loc_1A679E:					  ; CODE XREF: ROM:001A677Aj
						  ; ROM:001A6798j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

EnemyAI_Lizard1_B:				  ; CODE XREF: ROM:001A84F2j
		bra.s	loc_1A67EC
; ---------------------------------------------------------------------------

EnemyAI_Lizard1_A:				  ; CODE XREF: ROM:001A84EEj
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A67BE
		move.b	$00000037(a5),d0
		beq.s	loc_1A67C4
		cmpi.b	#$10,d0
		beq.s	loc_1A67F0
		bra.w	loc_1A6932
; ---------------------------------------------------------------------------

loc_1A67BE:					  ; CODE XREF: ROM:001A67ACj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A67C4:					  ; CODE XREF: ROM:001A67B2j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A67EC
		rts
; ---------------------------------------------------------------------------

loc_1A67EC:					  ; CODE XREF: ROM:EnemyAI_Lizard1_Bj
						  ; ROM:001A67E8j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A67F0:					  ; CODE XREF: ROM:001A67B8j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A6820
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A6824
		bcs.s	loc_1A681A
		bsr.s	sub_1A6860
		bcs.s	loc_1A681A
		bsr.w	sub_1A689C
		bcs.s	loc_1A681A
		bsr.w	sub_1A68D8

loc_1A681A:					  ; CODE XREF: ROM:001A680Aj
						  ; ROM:001A680Ej ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A6820:					  ; CODE XREF: ROM:001A67F6j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A6824:					  ; CODE XREF: ROM:001A6808p
		move.w	#$0048,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A685C
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1A685C
		move.b	#$20,$00000037(a5)
		move.w	#$0013,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A685C:					  ; CODE XREF: sub_1A6824+10j
						  ; sub_1A6824+20j
		tst.b	d0
		rts
; End of function sub_1A6824


; =============== S U B	R O U T	I N E =======================================


sub_1A6860:					  ; CODE XREF: ROM:001A680Cp
		move.w	#$0050,d5
		move.w	#$FFC8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6898
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0019,d7
		bhi.s	loc_1A6898
		move.b	#$21,$00000037(a5)
		move.w	#$000E,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6898:					  ; CODE XREF: sub_1A6860+10j
						  ; sub_1A6860+20j
		tst.b	d0
		rts
; End of function sub_1A6860


; =============== S U B	R O U T	I N E =======================================


sub_1A689C:					  ; CODE XREF: ROM:001A6810p
		move.w	#$0040,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A68D4
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1A68D4
		move.b	#$22,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A68D4:					  ; CODE XREF: sub_1A689C+10j
						  ; sub_1A689C+20j
		tst.b	d0
		rts
; End of function sub_1A689C


; =============== S U B	R O U T	I N E =======================================


sub_1A68D8:					  ; CODE XREF: ROM:001A6816p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A692E
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$003C,d7
		bcc.s	loc_1A6914
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6914:					  ; CODE XREF: sub_1A68D8+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A692E:					  ; CODE XREF: sub_1A68D8+10j
		tst.b	d0
		rts
; End of function sub_1A68D8

; ---------------------------------------------------------------------------

loc_1A6932:					  ; CODE XREF: ROM:001A67BAj
		andi.b	#$0F,d0
		beq.s	loc_1A694E
		cmpi.b	#$01,d0
		beq.s	loc_1A6954
		cmpi.b	#$02,d0
		beq.s	loc_1A6966
		cmpi.b	#$03,d0
		beq.s	loc_1A69A0
		bra.w	loc_1A69D6
; ---------------------------------------------------------------------------

loc_1A694E:					  ; CODE XREF: ROM:001A6936j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A6954:					  ; CODE XREF: ROM:001A693Cj
		move.b	$0000002D(a5),d0
		andi.b	#$30,d0
		beq.w	loc_1A67EC
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A6966:					  ; CODE XREF: ROM:001A6942j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1A699A
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	loc_1A699A
		bra.w	loc_1A67EC
; ---------------------------------------------------------------------------

loc_1A699A:					  ; CODE XREF: ROM:001A6976j
						  ; ROM:001A6994j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A69A0:					  ; CODE XREF: ROM:001A6948j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	locret_1A69D4
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1A69D4
		bra.w	loc_1A67EC
; ---------------------------------------------------------------------------

locret_1A69D4:					  ; CODE XREF: ROM:001A69B0j
						  ; ROM:001A69CEj
		rts
; ---------------------------------------------------------------------------

loc_1A69D6:					  ; CODE XREF: ROM:001A694Aj
		move.w	#$0300,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	locret_1A6A0A
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1A6A0A
		bra.w	loc_1A67EC
; ---------------------------------------------------------------------------

locret_1A6A0A:					  ; CODE XREF: ROM:001A69E6j
						  ; ROM:001A6A04j
		rts
; ---------------------------------------------------------------------------

EnemyAI_Lizard2_B:				  ; CODE XREF: ROM:001A84FAj
		bra.s	loc_1A6A54
; ---------------------------------------------------------------------------

EnemyAI_Lizard2_A:				  ; CODE XREF: ROM:001A84F6j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A6A26
		move.b	$00000037(a5),d0
		beq.s	loc_1A6A2C
		cmpi.b	#$10,d0
		beq.s	loc_1A6A58
		bra.w	loc_1A6B9A
; ---------------------------------------------------------------------------

loc_1A6A26:					  ; CODE XREF: ROM:001A6A14j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A6A2C:					  ; CODE XREF: ROM:001A6A1Aj
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A6A54
		rts
; ---------------------------------------------------------------------------

loc_1A6A54:					  ; CODE XREF: ROM:EnemyAI_Lizard2_Bj
						  ; ROM:001A6A50j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A6A58:					  ; CODE XREF: ROM:001A6A20j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A6A88
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A6A8C
		bcs.s	loc_1A6A82
		bsr.s	sub_1A6AC8
		bcs.s	loc_1A6A82
		bsr.w	sub_1A6B04
		bcs.s	loc_1A6A82
		bsr.w	sub_1A6B40

loc_1A6A82:					  ; CODE XREF: ROM:001A6A72j
						  ; ROM:001A6A76j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A6A88:					  ; CODE XREF: ROM:001A6A5Ej
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A6A8C:					  ; CODE XREF: ROM:001A6A70p
		move.w	#$0048,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6AC4
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0006,d7
		bhi.s	loc_1A6AC4
		move.b	#$20,$00000037(a5)
		move.w	#$0013,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6AC4:					  ; CODE XREF: sub_1A6A8C+10j
						  ; sub_1A6A8C+20j
		tst.b	d0
		rts
; End of function sub_1A6A8C


; =============== S U B	R O U T	I N E =======================================


sub_1A6AC8:					  ; CODE XREF: ROM:001A6A74p
		move.w	#$0050,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6B00
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1A6B00
		move.b	#$21,$00000037(a5)
		move.w	#$0014,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6B00:					  ; CODE XREF: sub_1A6AC8+10j
						  ; sub_1A6AC8+20j
		tst.b	d0
		rts
; End of function sub_1A6AC8


; =============== S U B	R O U T	I N E =======================================


sub_1A6B04:					  ; CODE XREF: ROM:001A6A78p
		move.w	#$0040,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6B3C
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0019,d7
		bhi.s	loc_1A6B3C
		move.b	#$22,$00000037(a5)
		move.w	#$000E,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6B3C:					  ; CODE XREF: sub_1A6B04+10j
						  ; sub_1A6B04+20j
		tst.b	d0
		rts
; End of function sub_1A6B04


; =============== S U B	R O U T	I N E =======================================


sub_1A6B40:					  ; CODE XREF: ROM:001A6A7Ep
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6B96
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bcc.s	loc_1A6B7C
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6B7C:					  ; CODE XREF: sub_1A6B40+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6B96:					  ; CODE XREF: sub_1A6B40+10j
		tst.b	d0
		rts
; End of function sub_1A6B40

; ---------------------------------------------------------------------------

loc_1A6B9A:					  ; CODE XREF: ROM:001A6A22j
		andi.b	#$0F,d0
		beq.s	loc_1A6BB6
		cmpi.b	#$01,d0
		beq.s	loc_1A6BBC
		cmpi.b	#$02,d0
		beq.s	loc_1A6BC2
		cmpi.b	#$03,d0
		beq.s	loc_1A6BFC
		bra.w	loc_1A6BC2
; ---------------------------------------------------------------------------

loc_1A6BB6:					  ; CODE XREF: ROM:001A6B9Ej
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A6BBC:					  ; CODE XREF: ROM:001A6BA4j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A6BC2:					  ; CODE XREF: ROM:001A6BAAj
						  ; ROM:001A6BB2j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1A6BF6
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	loc_1A6BF6
		bra.w	loc_1A6A54
; ---------------------------------------------------------------------------

loc_1A6BF6:					  ; CODE XREF: ROM:001A6BD2j
						  ; ROM:001A6BF0j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A6BFC:					  ; CODE XREF: ROM:001A6BB0j
		move.w	#$0300,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	locret_1A6C30
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1A6C30
		bra.w	loc_1A6A54
; ---------------------------------------------------------------------------

locret_1A6C30:					  ; CODE XREF: ROM:001A6C0Cj
						  ; ROM:001A6C2Aj
		rts
; ---------------------------------------------------------------------------

EnemyAI_Lizard3_B:				  ; CODE XREF: ROM:001A8502j
		bra.s	loc_1A6C7A
; ---------------------------------------------------------------------------

EnemyAI_Lizard3_A:				  ; CODE XREF: ROM:001A84FEj
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A6C4C
		move.b	$00000037(a5),d0
		beq.s	loc_1A6C52
		cmpi.b	#$10,d0
		beq.s	loc_1A6C7E
		bra.w	loc_1A6DC0
; ---------------------------------------------------------------------------

loc_1A6C4C:					  ; CODE XREF: ROM:001A6C3Aj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A6C52:					  ; CODE XREF: ROM:001A6C40j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A6C7A
		rts
; ---------------------------------------------------------------------------

loc_1A6C7A:					  ; CODE XREF: ROM:EnemyAI_Lizard3_Bj
						  ; ROM:001A6C76j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A6C7E:					  ; CODE XREF: ROM:001A6C46j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A6CAE
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A6CB2
		bcs.s	loc_1A6CA8
		bsr.s	sub_1A6CEE
		bcs.s	loc_1A6CA8
		bsr.w	sub_1A6D2A
		bcs.s	loc_1A6CA8
		bsr.w	sub_1A6D66

loc_1A6CA8:					  ; CODE XREF: ROM:001A6C98j
						  ; ROM:001A6C9Cj ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A6CAE:					  ; CODE XREF: ROM:001A6C84j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A6CB2:					  ; CODE XREF: ROM:001A6C96p
		move.w	#$0050,d5
		move.w	#$FFD0,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6CEA
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bhi.s	loc_1A6CEA
		move.b	#$20,$00000037(a5)
		move.w	#$0015,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6CEA:					  ; CODE XREF: sub_1A6CB2+10j
						  ; sub_1A6CB2+20j
		tst.b	d0
		rts
; End of function sub_1A6CB2


; =============== S U B	R O U T	I N E =======================================


sub_1A6CEE:					  ; CODE XREF: ROM:001A6C9Ap
		move.w	#$0040,d5
		move.w	#$FFD0,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6D26
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$001F,d7
		bhi.s	loc_1A6D26
		move.b	#$21,$00000037(a5)
		move.w	#$000E,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6D26:					  ; CODE XREF: sub_1A6CEE+10j
						  ; sub_1A6CEE+20j
		tst.b	d0
		rts
; End of function sub_1A6CEE


; =============== S U B	R O U T	I N E =======================================


sub_1A6D2A:					  ; CODE XREF: ROM:001A6C9Ep
		move.w	#$0040,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6D62
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$001F,d7
		bhi.s	loc_1A6D62
		move.b	#$22,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6D62:					  ; CODE XREF: sub_1A6D2A+10j
						  ; sub_1A6D2A+20j
		tst.b	d0
		rts
; End of function sub_1A6D2A


; =============== S U B	R O U T	I N E =======================================


sub_1A6D66:					  ; CODE XREF: ROM:001A6CA4p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6DBC
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0028,d7
		bcc.s	loc_1A6DA2
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6DA2:					  ; CODE XREF: sub_1A6D66+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6DBC:					  ; CODE XREF: sub_1A6D66+10j
		tst.b	d0
		rts
; End of function sub_1A6D66

; ---------------------------------------------------------------------------

loc_1A6DC0:					  ; CODE XREF: ROM:001A6C48j
		andi.b	#$0F,d0
		beq.s	loc_1A6DDE
		cmpi.b	#$01,d0
		beq.s	loc_1A6E2C
		cmpi.b	#$02,d0
		beq.s	loc_1A6E02
		cmpi.b	#$03,d0
		beq.w	loc_1A6E66
		bra.w	loc_1A6E2C
; ---------------------------------------------------------------------------

loc_1A6DDE:					  ; CODE XREF: ROM:001A6DC4j
		cmpi.b	#$08,$0000002A(a5)
		bcc.s	loc_1A6DFC
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)

loc_1A6DFC:					  ; CODE XREF: ROM:001A6DE4j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A6E02:					  ; CODE XREF: ROM:001A6DD0j
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$19,$0000000D(a5)
		bcc.w	loc_1A6C7A
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A6E2C:					  ; CODE XREF: ROM:001A6DCAj
						  ; ROM:001A6DDAj
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1A6E60
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	loc_1A6E60
		bra.w	loc_1A6C7A
; ---------------------------------------------------------------------------

loc_1A6E60:					  ; CODE XREF: ROM:001A6E3Cj
						  ; ROM:001A6E5Aj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A6E66:					  ; CODE XREF: ROM:001A6DD6j
		move.w	#$0300,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	locret_1A6E9A
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1A6E9A
		bra.w	loc_1A6C7A
; ---------------------------------------------------------------------------

locret_1A6E9A:					  ; CODE XREF: ROM:001A6E76j
						  ; ROM:001A6E94j
		rts
; ---------------------------------------------------------------------------

EnemyAI_Knight1_B:				  ; CODE XREF: ROM:001A850Aj
		bra.s	loc_1A6EE4
; ---------------------------------------------------------------------------

EnemyAI_Knight1_A:				  ; CODE XREF: ROM:001A8506j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A6EB6
		move.b	$00000037(a5),d0
		beq.s	loc_1A6EBC
		cmpi.b	#$10,d0
		beq.s	loc_1A6EE8
		bra.w	loc_1A703A
; ---------------------------------------------------------------------------

loc_1A6EB6:					  ; CODE XREF: ROM:001A6EA4j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A6EBC:					  ; CODE XREF: ROM:001A6EAAj
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0010,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A6EE4
		rts
; ---------------------------------------------------------------------------

loc_1A6EE4:					  ; CODE XREF: ROM:EnemyAI_Knight1_Bj
						  ; ROM:001A6EE0j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A6EE8:					  ; CODE XREF: ROM:001A6EB0j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A6F18
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A6F1C
		bcs.s	loc_1A6F12
		bsr.s	sub_1A6F58
		bcs.s	loc_1A6F12
		bsr.w	sub_1A6F94
		bcs.s	loc_1A6F12
		bsr.w	sub_1A6FE0

loc_1A6F12:					  ; CODE XREF: ROM:001A6F02j
						  ; ROM:001A6F06j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A6F18:					  ; CODE XREF: ROM:001A6EEEj
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A6F1C:					  ; CODE XREF: ROM:001A6F00p
		move.w	#$0048,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6F54
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0025,d7
		bhi.s	loc_1A6F54
		move.b	#$20,$00000037(a5)
		move.w	#$0013,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6F54:					  ; CODE XREF: sub_1A6F1C+10j
						  ; sub_1A6F1C+20j
		tst.b	d0
		rts
; End of function sub_1A6F1C


; =============== S U B	R O U T	I N E =======================================


sub_1A6F58:					  ; CODE XREF: ROM:001A6F04p
		move.w	#$0038,d5
		move.w	#$FFD0,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6F90
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0019,d7
		bhi.s	loc_1A6F90
		move.b	#$21,$00000037(a5)
		move.w	#$0008,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6F90:					  ; CODE XREF: sub_1A6F58+10j
						  ; sub_1A6F58+20j
		tst.b	d0
		rts
; End of function sub_1A6F58


; =============== S U B	R O U T	I N E =======================================


sub_1A6F94:					  ; CODE XREF: ROM:001A6F08p
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6FDC
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0096,d7
		bhi.s	loc_1A6FDC
		move.b	(Player_Action).l,d0	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6, Bit7 - Pick up / Put down
						  ; Bit8-Bit10 - Sword swing
						  ; Bit12 - Ladder Climb
		andi.b	#$07,d0
		beq.s	loc_1A6FDC
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6FDC:					  ; CODE XREF: sub_1A6F94+10j
						  ; sub_1A6F94+20j ...
		tst.b	d0
		rts
; End of function sub_1A6F94


; =============== S U B	R O U T	I N E =======================================


sub_1A6FE0:					  ; CODE XREF: ROM:001A6F0Ep
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7036
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$001E,d7
		bcc.s	loc_1A701C
		move.b	#$23,$00000037(a5)
		move.w	#$0009,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A701C:					  ; CODE XREF: sub_1A6FE0+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7036:					  ; CODE XREF: sub_1A6FE0+10j
		tst.b	d0
		rts
; End of function sub_1A6FE0

; ---------------------------------------------------------------------------

loc_1A703A:					  ; CODE XREF: ROM:001A6EB2j
		andi.b	#$0F,d0
		beq.s	loc_1A7056
		cmpi.b	#$01,d0
		beq.s	loc_1A7056
		cmpi.b	#$02,d0
		beq.s	loc_1A705C
		cmpi.b	#$03,d0
		beq.s	loc_1A708E
		bra.w	loc_1A708E
; ---------------------------------------------------------------------------

loc_1A7056:					  ; CODE XREF: ROM:001A703Ej
						  ; ROM:001A7044j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A705C:					  ; CODE XREF: ROM:001A704Aj
		move.w	#$0300,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$05,$0000000D(a5)
		bcs.s	loc_1A7086
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$17,$0000000D(a5)
		bcs.s	loc_1A7086
		bclr	#$00,$00000038(a5)
		bra.w	loc_1A6EE4
; ---------------------------------------------------------------------------

loc_1A7086:					  ; CODE XREF: ROM:001A706Cj
						  ; ROM:001A707Aj
		bset	#$00,$00000038(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A708E:					  ; CODE XREF: ROM:001A7050j
						  ; ROM:001A7052j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1A70C2
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	loc_1A70C2
		bra.w	loc_1A6EE4
; ---------------------------------------------------------------------------

loc_1A70C2:					  ; CODE XREF: ROM:001A709Ej
						  ; ROM:001A70BCj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

EnemyAI_Knight2_B:				  ; CODE XREF: ROM:001A8512j
		bra.s	loc_1A7110
; ---------------------------------------------------------------------------

EnemyAI_Knight2_A:				  ; CODE XREF: ROM:001A850Ej
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A70E2
		move.b	$00000037(a5),d0
		beq.s	loc_1A70E8
		cmpi.b	#$10,d0
		beq.s	loc_1A7114
		bra.w	loc_1A7266
; ---------------------------------------------------------------------------

loc_1A70E2:					  ; CODE XREF: ROM:001A70D0j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A70E8:					  ; CODE XREF: ROM:001A70D6j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0010,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A7110
		rts
; ---------------------------------------------------------------------------

loc_1A7110:					  ; CODE XREF: ROM:EnemyAI_Knight2_Bj
						  ; ROM:001A710Cj ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A7114:					  ; CODE XREF: ROM:001A70DCj
		tst.b	(byte_FF1142).l
		bne.s	loc_1A7144
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A7148
		bcs.s	loc_1A713E
		bsr.s	sub_1A7184
		bcs.s	loc_1A713E
		bsr.w	sub_1A71C0
		bcs.s	loc_1A713E
		bsr.w	sub_1A720C

loc_1A713E:					  ; CODE XREF: ROM:001A712Ej
						  ; ROM:001A7132j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A7144:					  ; CODE XREF: ROM:001A711Aj
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A7148:					  ; CODE XREF: ROM:001A712Cp
		move.w	#$0048,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7180
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0019,d7
		bhi.s	loc_1A7180
		move.b	#$20,$00000037(a5)
		move.w	#$0013,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7180:					  ; CODE XREF: sub_1A7148+10j
						  ; sub_1A7148+20j
		tst.b	d0
		rts
; End of function sub_1A7148


; =============== S U B	R O U T	I N E =======================================


sub_1A7184:					  ; CODE XREF: ROM:001A7130p
		move.w	#$0030,d5
		move.w	#$FFE8,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A71BC
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0019,d7
		bhi.s	loc_1A71BC
		move.b	#$21,$00000037(a5)
		move.w	#$0012,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A71BC:					  ; CODE XREF: sub_1A7184+10j
						  ; sub_1A7184+20j
		tst.b	d0
		rts
; End of function sub_1A7184


; =============== S U B	R O U T	I N E =======================================


sub_1A71C0:					  ; CODE XREF: ROM:001A7134p
		move.w	#$0030,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7208
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0096,d7
		bhi.s	loc_1A7208
		move.b	(Player_Action).l,d0	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6, Bit7 - Pick up / Put down
						  ; Bit8-Bit10 - Sword swing
						  ; Bit12 - Ladder Climb
		andi.b	#$07,d0
		beq.s	loc_1A7208
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7208:					  ; CODE XREF: sub_1A71C0+10j
						  ; sub_1A71C0+20j ...
		tst.b	d0
		rts
; End of function sub_1A71C0


; =============== S U B	R O U T	I N E =======================================


sub_1A720C:					  ; CODE XREF: ROM:001A713Ap
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7262
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0014,d7
		bcc.s	loc_1A7248
		move.b	#$23,$00000037(a5)
		move.w	#$0009,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7248:					  ; CODE XREF: sub_1A720C+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7262:					  ; CODE XREF: sub_1A720C+10j
		tst.b	d0
		rts
; End of function sub_1A720C

; ---------------------------------------------------------------------------

loc_1A7266:					  ; CODE XREF: ROM:001A70DEj
		andi.b	#$0F,d0
		beq.s	loc_1A7282
		cmpi.b	#$01,d0
		beq.s	loc_1A72BA
		cmpi.b	#$02,d0
		beq.s	loc_1A7288
		cmpi.b	#$03,d0
		beq.s	loc_1A72BA
		bra.w	loc_1A72BA
; ---------------------------------------------------------------------------

loc_1A7282:					  ; CODE XREF: ROM:001A726Aj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A7288:					  ; CODE XREF: ROM:001A7276j
		move.w	#$0300,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$05,$0000000D(a5)
		bcs.s	loc_1A72B2
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$17,$0000000D(a5)
		bcs.s	loc_1A72B2
		bclr	#$00,$00000038(a5)
		bra.w	loc_1A7110
; ---------------------------------------------------------------------------

loc_1A72B2:					  ; CODE XREF: ROM:001A7298j
						  ; ROM:001A72A6j
		bset	#$00,$00000038(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A72BA:					  ; CODE XREF: ROM:001A7270j
						  ; ROM:001A727Cj ...
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1A72EE
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	loc_1A72EE
		bra.w	loc_1A7110
; ---------------------------------------------------------------------------

loc_1A72EE:					  ; CODE XREF: ROM:001A72CAj
						  ; ROM:001A72E8j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

EnemyAI_Knight3_B:				  ; CODE XREF: ROM:001A851Aj
		bra.s	loc_1A733C
; ---------------------------------------------------------------------------

EnemyAI_Knight3_A:				  ; CODE XREF: ROM:001A8516j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A730E
		move.b	$00000037(a5),d0
		beq.s	loc_1A7314
		cmpi.b	#$10,d0
		beq.s	loc_1A7340
		bra.w	loc_1A7490
; ---------------------------------------------------------------------------

loc_1A730E:					  ; CODE XREF: ROM:001A72FCj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A7314:					  ; CODE XREF: ROM:001A7302j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0010,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A733C
		rts
; ---------------------------------------------------------------------------

loc_1A733C:					  ; CODE XREF: ROM:EnemyAI_Knight3_Bj
						  ; ROM:001A7338j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A7340:					  ; CODE XREF: ROM:001A7308j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A7370
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A7374
		bcs.s	loc_1A736A
		bsr.s	sub_1A73B0
		bcs.s	loc_1A736A
		bsr.w	sub_1A73F6
		bcs.s	loc_1A736A
		bsr.w	sub_1A7436

loc_1A736A:					  ; CODE XREF: ROM:001A735Aj
						  ; ROM:001A735Ej ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A7370:					  ; CODE XREF: ROM:001A7346j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A7374:					  ; CODE XREF: ROM:001A7358p
		move.w	#$0040,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A73AC
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1A73AC
		move.b	#$20,$00000037(a5)
		move.w	#$0012,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A73AC:					  ; CODE XREF: sub_1A7374+10j
						  ; sub_1A7374+20j
		tst.b	d0
		rts
; End of function sub_1A7374


; =============== S U B	R O U T	I N E =======================================


sub_1A73B0:					  ; CODE XREF: ROM:001A735Cp
		move.w	#$0038,d5
		move.w	#$FFE0,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A73F2
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		move.b	(Player_Action).l,d0	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6, Bit7 - Pick up / Put down
						  ; Bit8-Bit10 - Sword swing
						  ; Bit12 - Ladder Climb
		andi.b	#$07,d0
		beq.s	loc_1A73F2
		move.b	#$21,$00000037(a5)
		move.w	#$0012,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A73F2:					  ; CODE XREF: sub_1A73B0+10j
						  ; sub_1A73B0+2Aj
		tst.b	d0
		rts
; End of function sub_1A73B0


; =============== S U B	R O U T	I N E =======================================


sub_1A73F6:					  ; CODE XREF: ROM:001A7360p
		move.w	#$0030,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7432
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$004B,d7
		bhi.s	loc_1A7432
		move.b	#$22,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7432:					  ; CODE XREF: sub_1A73F6+10j
						  ; sub_1A73F6+20j
		tst.b	d0
		rts
; End of function sub_1A73F6


; =============== S U B	R O U T	I N E =======================================


sub_1A7436:					  ; CODE XREF: ROM:001A7366p
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A748C
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000A,d7
		bcc.s	loc_1A7472
		move.b	#$23,$00000037(a5)
		move.w	#$0009,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7472:					  ; CODE XREF: sub_1A7436+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A748C:					  ; CODE XREF: sub_1A7436+10j
		tst.b	d0
		rts
; End of function sub_1A7436

; ---------------------------------------------------------------------------

loc_1A7490:					  ; CODE XREF: ROM:001A730Aj
		andi.b	#$0F,d0
		beq.s	loc_1A74E2
		cmpi.b	#$01,d0
		beq.s	loc_1A74AC
		cmpi.b	#$02,d0
		beq.s	loc_1A74E2
		cmpi.b	#$03,d0
		beq.s	loc_1A74E2
		bra.w	loc_1A74E2
; ---------------------------------------------------------------------------

loc_1A74AC:					  ; CODE XREF: ROM:001A749Aj
		move.w	#$0300,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$05,$0000000D(a5)
		bcs.s	loc_1A74D6
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$17,$0000000D(a5)
		bcs.s	loc_1A74D6
		bclr	#$00,$00000038(a5)
		bra.w	loc_1A733C
; ---------------------------------------------------------------------------

loc_1A74D6:					  ; CODE XREF: ROM:001A74BCj
						  ; ROM:001A74CAj
		bset	#$00,$00000038(a5)
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A74E2:					  ; CODE XREF: ROM:001A7494j
						  ; ROM:001A74A0j ...
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1A7516
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	loc_1A7516
		bra.w	loc_1A733C
; ---------------------------------------------------------------------------

loc_1A7516:					  ; CODE XREF: ROM:001A74F2j
						  ; ROM:001A7510j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

EnemyAI_Ghost1_B:				  ; CODE XREF: ROM:001A8522j
		bra.s	loc_1A753E
; ---------------------------------------------------------------------------

EnemyAI_Ghost1_A:				  ; CODE XREF: ROM:001A851Ej
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A7536
		move.b	$00000037(a5),d0
		beq.s	loc_1A753C
		cmpi.b	#$10,d0
		beq.s	loc_1A757C
		bra.w	loc_1A75E4
; ---------------------------------------------------------------------------

loc_1A7536:					  ; CODE XREF: ROM:001A7524j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A753C:					  ; CODE XREF: ROM:001A752Aj
		bra.s	loc_1A7544
; ---------------------------------------------------------------------------

loc_1A753E:					  ; CODE XREF: ROM:EnemyAI_Ghost1_Bj
						  ; ROM:001A75F0j ...
		tst.b	$0000000A(a5)
		bpl.s	loc_1A7560

loc_1A7544:					  ; CODE XREF: ROM:loc_1A753Cj
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$20,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		clr.b	$0000000D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A7560:					  ; CODE XREF: ROM:001A7542j
						  ; ROM:001A767Cj ...
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		clr.b	Unk0D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A757C:					  ; CODE XREF: ROM:001A7530j
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.w	sub_1A7596
		bsr.w	LoadSpecialAI
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A7596:					  ; CODE XREF: ROM:001A758Cp
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A75E0
		move.w	$00000054(a5),d0
		sub.w	(Player_Z).l,d0
		cmpi.w	#$0020,d0
		bcc.s	loc_1A75E0
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		move.b	#$21,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A75E0:					  ; CODE XREF: sub_1A7596+10j
						  ; sub_1A7596+20j
		tst.b	d0
		rts
; End of function sub_1A7596

; ---------------------------------------------------------------------------

loc_1A75E4:					  ; CODE XREF: ROM:001A7532j
		andi.b	#$0F,d0
		beq.s	loc_1A75F4
		cmpi.b	#$01,d0
		beq.s	loc_1A7642
		bra.w	loc_1A753E
; ---------------------------------------------------------------------------

loc_1A75F4:					  ; CODE XREF: ROM:001A75E8j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$08,$0000000D(a5)
		bcs.s	locret_1A7640
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$10,$0000000D(a5)
		bcs.s	locret_1A7640
		move.w	#$0300,$0000002C(a5)
		cmpi.b	#$18,$0000000D(a5)
		bcs.s	locret_1A7640
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$20,$0000000D(a5)
		bcs.s	locret_1A7640
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)

locret_1A7640:					  ; CODE XREF: ROM:001A7604j
						  ; ROM:001A7612j ...
		rts
; ---------------------------------------------------------------------------

loc_1A7642:					  ; CODE XREF: ROM:001A75EEj
		tst.b	(byte_FF1145).l
		bne.w	loc_1A753E
		tst.b	(byte_FF1142).l
		bne.s	loc_1A765C
		move.b	#$01,(byte_FF1142).l

loc_1A765C:					  ; CODE XREF: ROM:001A7652j
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1A7560
		move.b	$0000004D(a5),d0
		addq.b	#$01,$0000004D(a5)
		tst.b	d0
		bne.s	loc_1A76A4
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_GhostAbsorbHP
; ---------------------------------------------------------------------------
		lea	(Player_X).l,a5
		move.w	#$0080,d0
		bsr.w	j_j_RemoveHealth
		tst.w	CurrentHealth(a5)
		beq.s	loc_1A76AE

loc_1A76A4:					  ; CODE XREF: ROM:001A768Aj
		cmpi.b	#$3C,d0
		bcc.w	loc_1A7560
		rts
; ---------------------------------------------------------------------------

loc_1A76AE:					  ; CODE XREF: ROM:001A76A2j
		bclr	#$06,$0000000C(a5)
		bra.w	loc_1A8AEC
; ---------------------------------------------------------------------------

EnemyAI_Ghost2_B:				  ; CODE XREF: ROM:001A852Aj
		bra.s	loc_1A76DA
; ---------------------------------------------------------------------------

EnemyAI_Ghost2_A:				  ; CODE XREF: ROM:001A8526j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A76D2
		move.b	$00000037(a5),d0
		beq.s	loc_1A76D8
		cmpi.b	#$10,d0
		beq.s	loc_1A7718
		bra.w	loc_1A77A0
; ---------------------------------------------------------------------------

loc_1A76D2:					  ; CODE XREF: ROM:001A76C0j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A76D8:					  ; CODE XREF: ROM:001A76C6j
		bra.s	loc_1A76E0
; ---------------------------------------------------------------------------

loc_1A76DA:					  ; CODE XREF: ROM:EnemyAI_Ghost2_Bj
						  ; ROM:001A77B4j ...
		tst.b	$0000000A(a5)
		bpl.s	loc_1A76FC

loc_1A76E0:					  ; CODE XREF: ROM:loc_1A76D8j
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$20,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		clr.b	$0000000D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A76FC:					  ; CODE XREF: ROM:001A76DEj
						  ; ROM:001A7846j ...
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		clr.b	$0000000D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A7718:					  ; CODE XREF: ROM:001A76CCj
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.w	sub_1A7732
		bsr.w	LoadSpecialAI
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A7732:					  ; CODE XREF: ROM:001A7728p
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A779C
		move.w	$00000054(a5),d0
		sub.w	(Player_Z).l,d0
		cmpi.w	#$0020,d0
		bcc.s	loc_1A779C
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$005A,d7
		bcc.s	loc_1A7782
		move.b	#$21,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7782:					  ; CODE XREF: sub_1A7732+30j
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A779C:					  ; CODE XREF: sub_1A7732+10j
						  ; sub_1A7732+20j
		tst.b	d0
		rts
; End of function sub_1A7732

; ---------------------------------------------------------------------------

loc_1A77A0:					  ; CODE XREF: ROM:001A76CEj
		andi.b	#$0F,d0
		beq.s	loc_1A77B8
		cmpi.b	#$01,d0
		beq.s	loc_1A7806
		cmpi.b	#$02,d0
		beq.w	loc_1A7882
		bra.w	loc_1A76DA
; ---------------------------------------------------------------------------

loc_1A77B8:					  ; CODE XREF: ROM:001A77A4j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$08,$0000000D(a5)
		bcs.s	locret_1A7804
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$10,$0000000D(a5)
		bcs.s	locret_1A7804
		move.w	#$0300,$0000002C(a5)
		cmpi.b	#$18,$0000000D(a5)
		bcs.s	locret_1A7804
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$20,$0000000D(a5)
		bcs.s	locret_1A7804
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)

locret_1A7804:					  ; CODE XREF: ROM:001A77C8j
						  ; ROM:001A77D6j ...
		rts
; ---------------------------------------------------------------------------

loc_1A7806:					  ; CODE XREF: ROM:001A77AAj
		tst.b	(byte_FF1145).l
		bne.w	loc_1A76DA
		tst.b	(byte_FF1142).l
		bne.w	loc_1A7826
		move.b	#$01,(byte_FF1142).l
		bra.w	*+4
; ---------------------------------------------------------------------------

loc_1A7826:					  ; CODE XREF: ROM:001A7816j
						  ; ROM:001A7822j
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0019,d5
		move.w	#$0009,d6
		move.w	#$0009,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1A76FC
		move.b	$0000004D(a5),d0
		addq.b	#$01,$0000004D(a5)
		tst.b	d0
		bne.s	loc_1A786E
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_GhostAbsorbHP
; ---------------------------------------------------------------------------
		lea	(Player_X).l,a5
		move.w	#$0100,d0
		bsr.w	j_j_RemoveHealth
		tst.w	CurrentHealth(a5)
		beq.s	loc_1A7878

loc_1A786E:					  ; CODE XREF: ROM:001A7854j
		cmpi.b	#$3C,d0
		bcc.w	loc_1A76FC
		rts
; ---------------------------------------------------------------------------

loc_1A7878:					  ; CODE XREF: ROM:001A786Cj
		bclr	#$06,$0000000C(a5)
		bra.w	loc_1A8AEC
; ---------------------------------------------------------------------------

loc_1A7882:					  ; CODE XREF: ROM:001A77B0j
		move.w	#$0029,d1
		move.w	#$0029,d2
		move.w	#$0019,d3
		bsr.w	sub_1A880C
		move.w	#$0500,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcc.w	loc_1A78B4
		cmpi.b	#$02,$0000000D(a5)
		bne.s	locret_1A78B2
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_EnemyDie1
; ---------------------------------------------------------------------------

locret_1A78B2:					  ; CODE XREF: ROM:001A78ACj
		rts
; ---------------------------------------------------------------------------

loc_1A78B4:					  ; CODE XREF: ROM:001A78A2j
		bsr.w	MoveSpriteOffscreen
		bra.w	loc_1A76DA
; ---------------------------------------------------------------------------

EnemyAI_Ghost3_B:				  ; CODE XREF: ROM:001A8532j
		bra.s	loc_1A78DE
; ---------------------------------------------------------------------------

EnemyAI_Ghost3_A:				  ; CODE XREF: ROM:001A852Ej
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A78D6
		move.b	$00000037(a5),d0
		beq.s	loc_1A78DC
		cmpi.b	#$10,d0
		beq.s	loc_1A791C
		bra.w	loc_1A79A4
; ---------------------------------------------------------------------------

loc_1A78D6:					  ; CODE XREF: ROM:001A78C4j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A78DC:					  ; CODE XREF: ROM:001A78CAj
		bra.s	loc_1A78E4
; ---------------------------------------------------------------------------

loc_1A78DE:					  ; CODE XREF: ROM:EnemyAI_Ghost3_Bj
						  ; ROM:001A79B8j ...
		tst.b	$0000000A(a5)
		bpl.s	loc_1A7900

loc_1A78E4:					  ; CODE XREF: ROM:loc_1A78DCj
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$20,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		clr.b	$0000000D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A7900:					  ; CODE XREF: ROM:001A78E2j
						  ; ROM:001A7A4Aj ...
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		clr.b	$0000000D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A791C:					  ; CODE XREF: ROM:001A78D0j
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.w	sub_1A7936
		bsr.w	LoadSpecialAI
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A7936:					  ; CODE XREF: ROM:001A792Cp
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A79A0
		move.w	$00000054(a5),d0
		sub.w	(Player_Z).l,d0
		cmpi.w	#$0020,d0
		bcc.s	loc_1A79A0
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0050,d7
		bcc.s	loc_1A7986
		move.b	#$21,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7986:					  ; CODE XREF: sub_1A7936+30j
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A79A0:					  ; CODE XREF: sub_1A7936+10j
						  ; sub_1A7936+20j
		tst.b	d0
		rts
; End of function sub_1A7936

; ---------------------------------------------------------------------------

loc_1A79A4:					  ; CODE XREF: ROM:001A78D2j
		andi.b	#$0F,d0
		beq.s	loc_1A79BC
		cmpi.b	#$01,d0
		beq.s	loc_1A7A0A
		cmpi.b	#$02,d0
		beq.w	loc_1A7A86
		bra.w	loc_1A78DE
; ---------------------------------------------------------------------------

loc_1A79BC:					  ; CODE XREF: ROM:001A79A8j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$08,$0000000D(a5)
		bcs.s	locret_1A7A08
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$10,$0000000D(a5)
		bcs.s	locret_1A7A08
		move.w	#$0300,$0000002C(a5)
		cmpi.b	#$18,$0000000D(a5)
		bcs.s	locret_1A7A08
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$20,$0000000D(a5)
		bcs.s	locret_1A7A08
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)

locret_1A7A08:					  ; CODE XREF: ROM:001A79CCj
						  ; ROM:001A79DAj ...
		rts
; ---------------------------------------------------------------------------

loc_1A7A0A:					  ; CODE XREF: ROM:001A79AEj
		tst.b	(byte_FF1145).l
		bne.w	loc_1A78DE
		tst.b	(byte_FF1142).l
		bne.w	loc_1A7A2A
		move.b	#$01,(byte_FF1142).l
		bra.w	*+4
; ---------------------------------------------------------------------------

loc_1A7A2A:					  ; CODE XREF: ROM:001A7A1Aj
						  ; ROM:001A7A26j
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0019,d5
		move.w	#$0009,d6
		move.w	#$0009,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1A7900
		move.b	$0000004D(a5),d0
		addq.b	#$01,$0000004D(a5)
		tst.b	d0
		bne.s	loc_1A7A72
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_GhostAbsorbHP
; ---------------------------------------------------------------------------
		lea	(Player_X).l,a5
		move.w	#$0200,d0
		bsr.w	j_j_RemoveHealth
		tst.w	$0000003E(a5)
		beq.s	loc_1A7A7C

loc_1A7A72:					  ; CODE XREF: ROM:001A7A58j
		cmpi.b	#$3C,d0
		bcc.w	loc_1A7900
		rts
; ---------------------------------------------------------------------------

loc_1A7A7C:					  ; CODE XREF: ROM:001A7A70j
		bclr	#$06,$0000000C(a5)
		bra.w	loc_1A8AEC
; ---------------------------------------------------------------------------

loc_1A7A86:					  ; CODE XREF: ROM:001A79B4j
		move.w	#$0029,d1
		move.w	#$0029,d2
		move.w	#$0019,d3
		bsr.w	sub_1A880C
		move.w	#$0500,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcc.w	loc_1A7AB8
		cmpi.b	#$02,$0000000D(a5)
		bne.s	locret_1A7AB6
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_EnemyDie1
; ---------------------------------------------------------------------------

locret_1A7AB6:					  ; CODE XREF: ROM:001A7AB0j
		rts
; ---------------------------------------------------------------------------

loc_1A7AB8:					  ; CODE XREF: ROM:001A7AA6j
		bsr.w	MoveSpriteOffscreen
		bra.w	loc_1A78DE
; ---------------------------------------------------------------------------

EnemyAI_Mummy1_B:				  ; CODE XREF: ROM:001A853Aj
		bra.s	loc_1A7B08
; ---------------------------------------------------------------------------

EnemyAI_Mummy1_A:				  ; CODE XREF: ROM:001A8536j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A7ADA
		move.b	$00000037(a5),d0
		beq.s	loc_1A7AE0
		cmpi.b	#$10,d0
		beq.s	loc_1A7B40
		bra.w	loc_1A7C9E
; ---------------------------------------------------------------------------

loc_1A7ADA:					  ; CODE XREF: ROM:001A7AC8j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A7AE0:					  ; CODE XREF: ROM:001A7ACEj
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0070,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A7B08
		rts
; ---------------------------------------------------------------------------

loc_1A7B08:					  ; CODE XREF: ROM:EnemyAI_Mummy1_Bj
						  ; ROM:001A7B04j ...
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		clr.b	$0000000D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A7B24:					  ; CODE XREF: ROM:001A7DB4j
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$24,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		clr.b	$0000000D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A7B40:					  ; CODE XREF: ROM:001A7AD4j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A7B70
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A7B80
		bcs.s	loc_1A7B6A
		bsr.s	sub_1A7BBC
		bcs.s	loc_1A7B6A
		bsr.w	sub_1A7BF8
		bcs.s	loc_1A7B6A
		bsr.w	sub_1A7C34

loc_1A7B6A:					  ; CODE XREF: ROM:001A7B5Aj
						  ; ROM:001A7B5Ej ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A7B70:					  ; CODE XREF: ROM:001A7B46j
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	LoadSpecialAI
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A7B80:					  ; CODE XREF: ROM:001A7B58p
		move.w	#$0050,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7BB8
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1A7BB8
		move.b	#$20,$00000037(a5)
		move.w	#$0013,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7BB8:					  ; CODE XREF: sub_1A7B80+10j
						  ; sub_1A7B80+20j
		tst.b	d0
		rts
; End of function sub_1A7B80


; =============== S U B	R O U T	I N E =======================================


sub_1A7BBC:					  ; CODE XREF: ROM:001A7B5Cp
		move.w	#$0048,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7BF4
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1A7BF4
		move.b	#$21,$00000037(a5)
		move.w	#$0008,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7BF4:					  ; CODE XREF: sub_1A7BBC+10j
						  ; sub_1A7BBC+20j
		tst.b	d0
		rts
; End of function sub_1A7BBC


; =============== S U B	R O U T	I N E =======================================


sub_1A7BF8:					  ; CODE XREF: ROM:001A7B60p
		move.w	#$0038,d5
		move.w	#$FFD8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7C30
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0014,d7
		bhi.s	loc_1A7C30
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7C30:					  ; CODE XREF: sub_1A7BF8+10j
						  ; sub_1A7BF8+20j
		tst.b	d0
		rts
; End of function sub_1A7BF8


; =============== S U B	R O U T	I N E =======================================


sub_1A7C34:					  ; CODE XREF: ROM:001A7B66p
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7C9A
		move.w	$00000054(a5),d0
		sub.w	(Player_Z).l,d0
		cmpi.w	#$0021,d0
		bhi.s	loc_1A7C9A
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0050,d7
		bcc.s	loc_1A7C80
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7C80:					  ; CODE XREF: sub_1A7C34+30j
		move.b	#$24,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7C9A:					  ; CODE XREF: sub_1A7C34+10j
						  ; sub_1A7C34+20j
		tst.b	d0
		rts
; End of function sub_1A7C34

; ---------------------------------------------------------------------------

loc_1A7C9E:					  ; CODE XREF: ROM:001A7AD6j
		andi.b	#$0F,d0
		beq.s	loc_1A7CBE
		cmpi.b	#$01,d0
		beq.s	loc_1A7CBE
		cmpi.b	#$02,d0
		beq.w	loc_1A7CC4
		cmpi.b	#$03,d0
		beq.w	loc_1A7DC4
		bra.w	loc_1A7D48
; ---------------------------------------------------------------------------

loc_1A7CBE:					  ; CODE XREF: ROM:001A7CA2j
						  ; ROM:001A7CA8j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A7CC4:					  ; CODE XREF: ROM:001A7CAEj
		move.w	#$0300,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$08,$0000000D(a5)
		bcs.s	locret_1A7D46
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$10,$0000000D(a5)
		bcs.s	locret_1A7D46
		move.w	#$0500,$0000002C(a5)
		cmpi.b	#$18,$0000000D(a5)
		bcs.s	locret_1A7D46
		cmpi.b	#$19,$0000000D(a5)
		bcc.s	loc_1A7D22
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1A7D42
		addq.b	#$01,$0000000D(a5)

loc_1A7D22:					  ; CODE XREF: ROM:001A7CF8j
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$20,$0000000D(a5)
		bcs.s	locret_1A7D46
		move.w	#$0300,$0000002C(a5)
		cmpi.b	#$28,$0000000D(a5)
		bcs.s	locret_1A7D46
		bra.w	loc_1A7B08
; ---------------------------------------------------------------------------

loc_1A7D42:					  ; CODE XREF: ROM:001A7D1Aj
		subq.b	#$01,$0000000D(a5)

locret_1A7D46:					  ; CODE XREF: ROM:001A7CD4j
						  ; ROM:001A7CE2j ...
		rts
; ---------------------------------------------------------------------------

loc_1A7D48:					  ; CODE XREF: ROM:001A7CBAj
		tst.b	(byte_FF1145).l
		bne.w	loc_1A7B08
		tst.b	(byte_FF1142).l
		bne.w	loc_1A7D68
		move.b	#$01,(byte_FF1142).l
		bra.w	*+4
; ---------------------------------------------------------------------------

loc_1A7D68:					  ; CODE XREF: ROM:001A7D58j
						  ; ROM:001A7D64j
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0015,d5
		move.w	#$0009,d6
		move.w	#$0009,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1A7B08
		move.b	$0000000D(a5),d0
		addq.b	#$01,$0000000D(a5)
		tst.b	d0
		bne.s	loc_1A7DB0
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Throw
; ---------------------------------------------------------------------------
		lea	(Player_X).l,a5
		move.w	#$0040,d0
		bsr.w	j_j_RemoveHealth
		tst.w	$0000003E(a5)
		beq.s	loc_1A7DBA

loc_1A7DB0:					  ; CODE XREF: ROM:001A7D96j
		cmpi.b	#$28,d0
		bcc.w	loc_1A7B24
		rts
; ---------------------------------------------------------------------------

loc_1A7DBA:					  ; CODE XREF: ROM:001A7DAEj
		bclr	#$06,$0000000C(a5)
		bra.w	loc_1A8AEC
; ---------------------------------------------------------------------------

loc_1A7DC4:					  ; CODE XREF: ROM:001A7CB6j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.w	locret_1A7DF8
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0011,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcc.w	loc_1A7B08

locret_1A7DF8:					  ; CODE XREF: ROM:001A7DD4j
		rts
; ---------------------------------------------------------------------------

EnemyAI_Mummy2_B:				  ; CODE XREF: ROM:001A8542j
		bra.s	loc_1A7E42
; ---------------------------------------------------------------------------

EnemyAI_Mummy2_A:				  ; CODE XREF: ROM:001A853Ej
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A7E14
		move.b	$00000037(a5),d0
		beq.s	loc_1A7E1A
		cmpi.b	#$10,d0
		beq.s	loc_1A7E7A
		bra.w	loc_1A7FD8
; ---------------------------------------------------------------------------

loc_1A7E14:					  ; CODE XREF: ROM:001A7E02j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A7E1A:					  ; CODE XREF: ROM:001A7E08j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0070,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A7E42
		rts
; ---------------------------------------------------------------------------

loc_1A7E42:					  ; CODE XREF: ROM:EnemyAI_Mummy2_Bj
						  ; ROM:001A7E3Ej ...
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		clr.b	$0000000D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A7E5E:					  ; CODE XREF: ROM:001A80EEj
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$24,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		clr.b	$0000000D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A7E7A:					  ; CODE XREF: ROM:001A7E0Ej
		tst.b	(byte_FF1142).l
		bne.s	loc_1A7EAA
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A7EBA
		bcs.s	loc_1A7EA4
		bsr.s	sub_1A7EF6
		bcs.s	loc_1A7EA4
		bsr.w	sub_1A7F32
		bcs.s	loc_1A7EA4
		bsr.w	sub_1A7F6E

loc_1A7EA4:					  ; CODE XREF: ROM:001A7E94j
						  ; ROM:001A7E98j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A7EAA:					  ; CODE XREF: ROM:001A7E80j
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	LoadSpecialAI
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A7EBA:					  ; CODE XREF: ROM:001A7E92p
		move.w	#$0050,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7EF2
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1A7EF2
		move.b	#$20,$00000037(a5)
		move.w	#$0013,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7EF2:					  ; CODE XREF: sub_1A7EBA+10j
						  ; sub_1A7EBA+20j
		tst.b	d0
		rts
; End of function sub_1A7EBA


; =============== S U B	R O U T	I N E =======================================


sub_1A7EF6:					  ; CODE XREF: ROM:001A7E96p
		move.w	#$0048,d5
		move.w	#$FFC8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7F2E
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0019,d7
		bhi.s	loc_1A7F2E
		move.b	#$21,$00000037(a5)
		move.w	#$0014,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7F2E:					  ; CODE XREF: sub_1A7EF6+10j
						  ; sub_1A7EF6+20j
		tst.b	d0
		rts
; End of function sub_1A7EF6


; =============== S U B	R O U T	I N E =======================================


sub_1A7F32:					  ; CODE XREF: ROM:001A7E9Ap
		move.w	#$0038,d5
		move.w	#$FFD8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7F6A
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$001E,d7
		bhi.s	loc_1A7F6A
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7F6A:					  ; CODE XREF: sub_1A7F32+10j
						  ; sub_1A7F32+20j
		tst.b	d0
		rts
; End of function sub_1A7F32


; =============== S U B	R O U T	I N E =======================================


sub_1A7F6E:					  ; CODE XREF: ROM:001A7EA0p
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7FD4
		move.w	$00000054(a5),d0
		sub.w	(Player_Z).l,d0
		cmpi.w	#$0021,d0
		bhi.s	loc_1A7FD4
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$003C,d7
		bcc.s	loc_1A7FBA
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7FBA:					  ; CODE XREF: sub_1A7F6E+30j
		move.b	#$24,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7FD4:					  ; CODE XREF: sub_1A7F6E+10j
						  ; sub_1A7F6E+20j
		tst.b	d0
		rts
; End of function sub_1A7F6E

; ---------------------------------------------------------------------------

loc_1A7FD8:					  ; CODE XREF: ROM:001A7E10j
		andi.b	#$0F,d0
		beq.s	loc_1A7FF8
		cmpi.b	#$01,d0
		beq.s	loc_1A7FF8
		cmpi.b	#$02,d0
		beq.w	loc_1A7FFE
		cmpi.b	#$03,d0
		beq.w	loc_1A80FE
		bra.w	loc_1A8082
; ---------------------------------------------------------------------------

loc_1A7FF8:					  ; CODE XREF: ROM:001A7FDCj
						  ; ROM:001A7FE2j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A7FFE:					  ; CODE XREF: ROM:001A7FE8j
		move.w	#$0300,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$08,$0000000D(a5)
		bcs.s	locret_1A8080
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$10,$0000000D(a5)
		bcs.s	locret_1A8080
		move.w	#$0500,$0000002C(a5)
		cmpi.b	#$18,$0000000D(a5)
		bcs.s	locret_1A8080
		cmpi.b	#$19,$0000000D(a5)
		bcc.s	loc_1A805C
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1A807C
		addq.b	#$01,$0000000D(a5)

loc_1A805C:					  ; CODE XREF: ROM:001A8032j
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$20,$0000000D(a5)
		bcs.s	locret_1A8080
		move.w	#$0300,$0000002C(a5)
		cmpi.b	#$28,$0000000D(a5)
		bcs.s	locret_1A8080
		bra.w	loc_1A7E42
; ---------------------------------------------------------------------------

loc_1A807C:					  ; CODE XREF: ROM:001A8054j
		subq.b	#$01,$0000000D(a5)

locret_1A8080:					  ; CODE XREF: ROM:001A800Ej
						  ; ROM:001A801Cj ...
		rts
; ---------------------------------------------------------------------------

loc_1A8082:					  ; CODE XREF: ROM:001A7FF4j
		tst.b	(byte_FF1145).l
		bne.w	loc_1A7E42
		tst.b	(byte_FF1142).l
		bne.w	loc_1A80A2
		move.b	#$01,(byte_FF1142).l
		bra.w	*+4
; ---------------------------------------------------------------------------

loc_1A80A2:					  ; CODE XREF: ROM:001A8092j
						  ; ROM:001A809Ej
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0015,d5
		move.w	#$0009,d6
		move.w	#$0009,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1A7E42
		move.b	$0000000D(a5),d0
		addq.b	#$01,$0000000D(a5)
		tst.b	d0
		bne.s	loc_1A80EA
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Throw
; ---------------------------------------------------------------------------
		lea	(Player_X).l,a5
		move.w	#$0040,d0
		bsr.w	j_j_RemoveHealth
		tst.w	$0000003E(a5)
		beq.s	loc_1A80F4

loc_1A80EA:					  ; CODE XREF: ROM:001A80D0j
		cmpi.b	#$28,d0
		bcc.w	loc_1A7E5E
		rts
; ---------------------------------------------------------------------------

loc_1A80F4:					  ; CODE XREF: ROM:001A80E8j
		bclr	#$06,$0000000C(a5)
		bra.w	loc_1A8AEC
; ---------------------------------------------------------------------------

loc_1A80FE:					  ; CODE XREF: ROM:001A7FF0j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.w	locret_1A8132
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0011,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcc.w	loc_1A7E42

locret_1A8132:					  ; CODE XREF: ROM:001A810Ej
		rts
; ---------------------------------------------------------------------------

EnemyAI_Mummy3_B:				  ; CODE XREF: ROM:001A854Aj
		bra.s	loc_1A817C
; ---------------------------------------------------------------------------

EnemyAI_Mummy3_A:				  ; CODE XREF: ROM:001A8546j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A814E
		move.b	$00000037(a5),d0
		beq.s	loc_1A8154
		cmpi.b	#$10,d0
		beq.s	loc_1A81B4
		bra.w	loc_1A830E
; ---------------------------------------------------------------------------

loc_1A814E:					  ; CODE XREF: ROM:001A813Cj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A8154:					  ; CODE XREF: ROM:001A8142j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0070,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A817C
		rts
; ---------------------------------------------------------------------------

loc_1A817C:					  ; CODE XREF: ROM:EnemyAI_Mummy3_Bj
						  ; ROM:001A8178j ...
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		clr.b	$0000000D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A8198:					  ; CODE XREF: ROM:001A83A0j
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$24,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		clr.b	$0000000D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A81B4:					  ; CODE XREF: ROM:001A8148j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A81E0
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A822C
		bcs.s	loc_1A81DA
		bsr.w	sub_1A8268
		bcs.s	loc_1A81DA
		bsr.w	sub_1A82A4

loc_1A81DA:					  ; CODE XREF: ROM:001A81CEj
						  ; ROM:001A81D4j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A81E0:					  ; CODE XREF: ROM:001A81BAj
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------
		move.w	#$0050,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A8228
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1A8228
		move.b	#$20,$00000037(a5)
		move.w	#$0013,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8228:					  ; CODE XREF: ROM:001A8200j
						  ; ROM:001A8210j
		tst.b	d0
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A822C:					  ; CODE XREF: ROM:001A81CCp
		move.w	#$0050,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A8264
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$001F,d7
		bhi.s	loc_1A8264
		move.b	#$21,$00000037(a5)
		move.w	#$0016,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8264:					  ; CODE XREF: sub_1A822C+10j
						  ; sub_1A822C+20j
		tst.b	d0
		rts
; End of function sub_1A822C


; =============== S U B	R O U T	I N E =======================================


sub_1A8268:					  ; CODE XREF: ROM:001A81D0p
		move.w	#$0048,d5
		move.w	#$FFC8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A82A0
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1A82A0
		move.b	#$22,$00000037(a5)
		move.w	#$0014,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A82A0:					  ; CODE XREF: sub_1A8268+10j
						  ; sub_1A8268+20j
		tst.b	d0
		rts
; End of function sub_1A8268


; =============== S U B	R O U T	I N E =======================================


sub_1A82A4:					  ; CODE XREF: ROM:001A81D6p
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A830A
		move.w	$00000054(a5),d0
		sub.w	(Player_Z).l,d0
		cmpi.w	#$0021,d0
		bhi.s	loc_1A830A
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0028,d7
		bcc.s	loc_1A82F0
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A82F0:					  ; CODE XREF: sub_1A82A4+30j
		move.b	#$24,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A830A:					  ; CODE XREF: sub_1A82A4+10j
						  ; sub_1A82A4+20j
		tst.b	d0
		rts
; End of function sub_1A82A4

; ---------------------------------------------------------------------------

loc_1A830E:					  ; CODE XREF: ROM:001A814Aj
		andi.b	#$0F,d0
		beq.s	loc_1A832E
		cmpi.b	#$01,d0
		beq.s	loc_1A832E
		cmpi.b	#$02,d0
		beq.w	loc_1A832E
		cmpi.b	#$03,d0
		beq.w	loc_1A83B0
		bra.w	loc_1A8334
; ---------------------------------------------------------------------------

loc_1A832E:					  ; CODE XREF: ROM:001A8312j
						  ; ROM:001A8318j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A8334:					  ; CODE XREF: ROM:001A832Aj
		tst.b	(byte_FF1145).l
		bne.w	loc_1A817C
		tst.b	(byte_FF1142).l
		bne.w	loc_1A8354
		move.b	#$01,(byte_FF1142).l
		bra.w	*+4
; ---------------------------------------------------------------------------

loc_1A8354:					  ; CODE XREF: ROM:001A8344j
						  ; ROM:001A8350j
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0015,d5
		move.w	#$0009,d6
		move.w	#$0009,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1A817C
		move.b	$0000000D(a5),d0
		addq.b	#$01,$0000000D(a5)
		tst.b	d0
		bne.s	loc_1A839C
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Throw
; ---------------------------------------------------------------------------
		lea	(Player_X).l,a5
		move.w	#$0040,d0
		bsr.w	j_j_RemoveHealth
		tst.w	$0000003E(a5)
		beq.s	loc_1A83A6

loc_1A839C:					  ; CODE XREF: ROM:001A8382j
		cmpi.b	#$28,d0
		bcc.w	loc_1A8198
		rts
; ---------------------------------------------------------------------------

loc_1A83A6:					  ; CODE XREF: ROM:001A839Aj
		bclr	#$06,$0000000C(a5)
		bra.w	loc_1A8AEC
; ---------------------------------------------------------------------------

loc_1A83B0:					  ; CODE XREF: ROM:001A8326j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.w	locret_1A83E4
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0011,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcc.w	loc_1A817C

locret_1A83E4:					  ; CODE XREF: ROM:001A83C0j
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A83E6:					  ; DATA XREF: sub_1A4404t

; FUNCTION CHUNK AT 001A870E SIZE 00000098 BYTES
; FUNCTION CHUNK AT 001A87D2 SIZE 0000003A BYTES

		cmpi.b	#$7F,(a5)
		beq.w	loc_1A870E
		clr.w	d1
; End of function sub_1A83E6


; =============== S U B	R O U T	I N E =======================================


sub_1A83F0:					  ; CODE XREF: sub_1A86D6+4p
		move.w	Dialogue(a5),d0
		andi.w	#$03FF,d0
		lea	EnemyTable(pc),a0

loc_1A83FC:					  ; CODE XREF: sub_1A83F0+16j
		cmp.w	(a0),d0
		beq.s	loc_1A840E
		addq.w	#$08,d1
		cmpi.w	#$FFFF,(a0)+
		bne.s	loc_1A83FC
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A840E:					  ; CODE XREF: sub_1A83F0+Ej
		lea	loc_1A84A6(pc),a0
		nop
		jmp	(a0,d1.w)
; End of function sub_1A83F0

; ---------------------------------------------------------------------------
EnemyTable:	dc.w SPR_ORC1			  ; DATA XREF: sub_1A83F0+8t
						  ; ROM:EnemyTable+2o ...
		dc.w SPR_ORC2
		dc.w SPR_ORC3
		dc.w SPR_WORM1
		dc.w SPR_WORM2
		dc.w SPR_WORM3
		dc.w SPR_NINJA1
		dc.w SPR_NINJA2
		dc.w SPR_NINJA3
		dc.w SPR_LIZARD1
		dc.w SPR_LIZARD2
		dc.w SPR_LIZARD3
		dc.w SPR_KNIGHT1
		dc.w SPR_KNIGHT2
		dc.w SPR_KNIGHT3
		dc.w SPR_GHOST1
		dc.w SPR_GHOST2
		dc.w SPR_GHOST3
		dc.w SPR_MUMMY1
		dc.w SPR_MUMMY2
		dc.w SPR_MUMMY3
		dc.w SPR_UNICORN1
		dc.w SPR_UNICORN2
		dc.w SPR_UNICORN3
		dc.w SPR_SKELETON1
		dc.w SPR_SKELETON2
		dc.w SPR_SKELETON3
		dc.w SPR_MIMIC1
		dc.w SPR_MIMIC2
		dc.w SPR_MIMIC3
		dc.w SPR_MUSHROOM1
		dc.w SPR_MUSHROOM2
		dc.w SPR_MUSHROOM3
		dc.w SPR_GIANT1
		dc.w SPR_GIANT2
		dc.w SPR_GIANT3
		dc.w SPR_BUBBLE1
		dc.w SPR_BUBBLE2
		dc.w SPR_BUBBLE3
		dc.w SPR_NIGEL
		dc.w SPR_MIR
		dc.w SPR_REAPER1
		dc.w SPR_SMLFIREBALL
		dc.w SPR_DUKE
		dc.w SPR_GHOSTGEN1
		dc.w SPR_GHOSTGEN2
		dc.w SPR_GHOSTGEN3
		dc.w SPR_ZAK
		dc.w SPR_GOLEM1
		dc.w SPR_GOLEM2
		dc.w SPR_GOLEM3
		dc.w SPR_REAPER2
		dc.w SPR_UNUSEDREAPER3
		dc.w SPR_SPECTRE1
		dc.w SPR_SPECTRE2
		dc.w SPR_SPECTRE3
		dc.w SPR_UNUSEDBIRD1
		dc.w SPR_UNUSEDBIRD2
		dc.w SPR_UNUSEDBIRD3
		dc.w SPR_SPINNER1
		dc.w SPR_MIRO
		dc.w SPR_IFRIT
		dc.w SPR_GOLA
		dc.w SPR_NOLE
		dc.w SPR_STONEWARRIOR1
		dc.w SPR_BUBBLE4
		dc.w SPR_BUBBLE5
		dc.w SPR_BUBBLE6
		dc.w SPR_SPINNER2
		dc.w SPR_STONEWARRIOR2
		dc.w $FFFF
; ---------------------------------------------------------------------------

loc_1A84A6:					  ; DATA XREF: sub_1A83F0:loc_1A840Et
		bra.w	EnemyAI_Orc1_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Orc1_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Orc2_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Orc2_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Orc3_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Orc3_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Worm1_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Worm1_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Worm2_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Worm2_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Worm3_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Worm3_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Ninja1_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Ninja1_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Ninja2_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Ninja2_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Ninja3_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Ninja3_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Lizard1_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Lizard1_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Lizard2_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Lizard2_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Lizard3_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Lizard3_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Knight1_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Knight1_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Knight2_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Knight2_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Knight3_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Knight3_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Ghost1_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Ghost1_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Ghost2_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Ghost2_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Ghost3_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Ghost3_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mummy1_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mummy1_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mummy2_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mummy2_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mummy3_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mummy3_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Unicorn1_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Unicorn1_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Unicorn2_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Unicorn2_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Unicorn3_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Unicorn3_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Skeleton1_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Skeleton1_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Skeleton2_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Skeleton2_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Skeleton3_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Skeleton3_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mimic1_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mimic1_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mimic2_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mimic2_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mimic3_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mimic3_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mushroom1_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mushroom1_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mushroom2_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mushroom2_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mushroom3_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mushroom3_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Giant1_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Giant1_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Giant2_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Giant2_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Giant3_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Giant3_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Bubble1_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Bubble1_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Bubble2_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Bubble2_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Bubble3_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Bubble3_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Miro_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Miro_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mir_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Mir_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Reaper1_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Reaper1_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_SmallFireball_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_SmallFireball_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Duke_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Duke_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_GhostGen_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_GhostGen_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_GhostGen_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_GhostGen_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_GhostGen_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_GhostGen_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Zak_A_0
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Zak_B_0
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Golem1_A_0
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Golem1_B_0
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Golem2_A_0
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Golem2_B_0
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Golem2_A_0	  ; Golem3
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Golem2_B_0
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Reaper2_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Reaper2_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Reaper3_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Reaper3_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Spectre1_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Spectre1_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Spectre2_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Spectre2_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Spectre3_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Spectre3_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Bird1_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Bird1_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Bird2_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Bird2_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Bird3_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Bird3_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Spinner_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Spinner_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Miro_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Miro_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Ifrit_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Ifrit_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Gola_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Gola_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Nole_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Nole_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_StoneWarrior_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_StoneWarrior_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Bubble3_A	  ; Bubble4
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Bubble3_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Bubble3_A	  ; Bubble5
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Bubble3_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Bubble3_A	  ; Bubble6
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Bubble3_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Spinner_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_Spinner_B
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_StoneWarrior_A
; ---------------------------------------------------------------------------
		bra.w	EnemyAI_StoneWarrior_B

; =============== S U B	R O U T	I N E =======================================


sub_1A86D6:					  ; CODE XREF: sub_1A83E6+414p
						  ; DATA XREF: sub_1A440Ct
		move.w	#$0004,d1
		bsr.w	sub_1A83F0
		bra.w	LoadSpecialAI
; End of function sub_1A86D6

; ---------------------------------------------------------------------------

EnemyAI_SmallFireball_B:			  ; CODE XREF: ROM:001A85FAj
		nop

EnemyAI_SmallFireball_A:			  ; CODE XREF: ROM:001A85F6j
		bset	#$00,$00000038(a5)
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

EnemyAI_GhostGen_B:				  ; CODE XREF: ROM:001A860Aj
						  ; ROM:001A8612j ...
		bra.s	loc_1A86FC
; ---------------------------------------------------------------------------

EnemyAI_GhostGen_A:				  ; CODE XREF: ROM:001A8606j
						  ; ROM:001A860Ej ...
		clr.b	$00000009(a5)
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A86FC:					  ; CODE XREF: ROM:EnemyAI_GhostGen_Bj
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1A83E6

loc_1A870E:					  ; CODE XREF: sub_1A83E6+4j
		cmpi.b	#$18,$0000004B(a5)
		beq.s	loc_1A8718

locret_1A8716:					  ; CODE XREF: sub_1A83E6+33Aj
						  ; sub_1A83E6+34Ej
		rts
; ---------------------------------------------------------------------------

loc_1A8718:					  ; CODE XREF: sub_1A83E6+32Ej
		lea	(Sprite1_X).l,a0

loc_1A871E:					  ; CODE XREF: sub_1A83E6+348j
		move.w	(a0),d0
		bmi.s	locret_1A8716
		cmpi.b	#$11,$0000000B(a0)
		beq.s	loc_1A8730
		lea	$00000080(a0),a0
		bra.s	loc_1A871E
; ---------------------------------------------------------------------------

loc_1A8730:					  ; CODE XREF: sub_1A83E6+342j
		cmpi.b	#$7F,d0
		beq.s	locret_1A8716
		move.w	$00000040(a5),(a5)
		move.w	$00000042(a5),$00000002(a5)
		move.w	$00000044(a5),$00000004(a5)
		andi.b	#$1F,$00000006(a5)
		move.b	$00000046(a5),d0
		or.b	d0,$00000006(a5)
		move.w	$0000004A(a5),$0000000A(a5)
		move.b	$0000004C(a5),$0000000C(a5)
		move.w	$00000052(a5),$00000012(a5)
		move.w	$0000006A(a5),$0000002A(a5)
		move.l	$00000072(a5),$00000032(a5)
		move.b	$00000076(a5),$00000036(a5)
		move.w	$0000007A(a5),$0000003A(a5)
		move.w	$0000007E(a5),$0000003E(a5)
		bclr	#$00,$00000008(a5)
		clr.b	$00000037(a5)
		clr.b	$00000038(a5)
		movea.l	a5,a1
		jsr	(j_LookupSpriteUnknownVal6F).l
		bsr.w	sub_1A8AE6
		jsr	(sub_3BC).l
		bcc.s	loc_1A87D2
; END OF FUNCTION CHUNK	FOR sub_1A83E6

; =============== S U B	R O U T	I N E =======================================


MoveSpriteOffscreen:				  ; CODE XREF: ROM:loc_1A78B4p
						  ; ROM:loc_1A7AB8p ...
		move.b	#$7F,(a5)
		move.b	#$7F,$00000001(a5)
		move.b	#$7F,$00000014(a5)
		move.b	#$7F,$00000016(a5)
		move.b	#$7F,$00000018(a5)
		move.b	#$7F,$0000001A(a5)
		rts
; End of function MoveSpriteOffscreen


; =============== S U B	R O U T	I N E =======================================


HideSprite:					  ; DATA XREF: j_HideSpritet
		ori.b	#$01,$00000008(a5)
		bra.s	MoveSpriteOffscreen
; End of function HideSprite

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1A83E6

loc_1A87D2:					  ; CODE XREF: sub_1A83E6+3BEj
		clr.w	$0000002C(a5)
		move.w	#$FFFF,$0000002E(a5)
		clr.w	$00000026(a5)
		ori.b	#$80,$0000000A(a5)
		cmpi.b	#$18,$0000000B(a5)
		bne.s	loc_1A8800
		move.w	#$0008,$00000024(a5)
		bset	#$07,$00000048(a5)
		bsr.w	sub_1A86D6
		rts
; ---------------------------------------------------------------------------

loc_1A8800:					  ; CODE XREF: sub_1A83E6+406j
		bset	#$07,$00000048(a5)
		clr.w	$00000024(a5)
		rts
; END OF FUNCTION CHUNK	FOR sub_1A83E6

; =============== S U B	R O U T	I N E =======================================


sub_1A880C:					  ; CODE XREF: ROM:001A4E9Cp
						  ; ROM:001A50C8p ...
		bsr.s	sub_1A8824
		bcc.s	locret_1A8822
		move.b	d0,(byte_FF1143).l
		move.w	AttackStrength(a5),(Player_AttackStrength).l
		ori	#$01,ccr

locret_1A8822:					  ; CODE XREF: sub_1A880C+2j
		rts
; End of function sub_1A880C


; =============== S U B	R O U T	I N E =======================================


sub_1A8824:					  ; CODE XREF: sub_1A880Cp
		move.w	d3,d4
		move.w	$00000012(a5),d5
		move.w	$00000054(a5),d6
		lea	(Player_X).l,a1
		move.b	$00000004(a5),d7
		andi.b	#$C0,d7
		beq.s	loc_1A8890
		cmpi.b	#$80,d7
		beq.w	loc_1A88D8
		bcs.w	loc_1A891E
		neg.w	d1
		add.w	$00000014(a5),d1
		add.w	$00000014(a5),d2
		neg.w	d3
		add.w	$00000016(a5),d3
		add.w	$00000016(a5),d4
		cmp.w	$0000001A(a1),d1
		bhi.s	loc_1A888C
		cmp.w	$00000018(a1),d2
		bcs.s	loc_1A888C
		cmp.w	$0000001E(a1),d3
		bhi.s	loc_1A888C
		cmp.w	$0000001C(a1),d4
		bcs.s	loc_1A888C
		cmp.w	$00000054(a1),d5
		bhi.s	loc_1A888C
		cmp.w	$00000012(a1),d6
		bcs.s	loc_1A888C
		move.b	#$43,d0
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A888C:					  ; CODE XREF: sub_1A8824+3Ej
						  ; sub_1A8824+44j ...
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1A8890:					  ; CODE XREF: sub_1A8824+18j
		neg.w	d1
		add.w	$00000016(a5),d1
		add.w	$00000016(a5),d2
		add.w	$00000014(a5),d3
		neg.w	d4
		add.w	$00000014(a5),d4
		cmp.w	$0000001E(a1),d1
		bhi.s	loc_1A88D4
		cmp.w	$0000001C(a1),d2
		bcs.s	loc_1A88D4
		cmp.w	$00000018(a1),d3
		bcs.w	loc_1A88D4
		cmp.w	$0000001A(a1),d4
		bhi.s	loc_1A88D4
		cmp.w	$00000054(a1),d5
		bhi.s	loc_1A88D4
		cmp.w	$00000012(a1),d6
		bcs.s	loc_1A88D4
		move.b	#$40,d0
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A88D4:					  ; CODE XREF: sub_1A8824+84j
						  ; sub_1A8824+8Aj ...
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1A88D8:					  ; CODE XREF: sub_1A8824+1Ej
		add.w	$00000016(a5),d1
		neg.w	d2
		add.w	$00000016(a5),d2
		neg.w	d3
		add.w	$00000014(a5),d3
		add.w	$00000014(a5),d4
		cmp.w	$0000001C(a1),d1
		bcs.s	loc_1A891A
		cmp.w	$0000001E(a1),d2
		bhi.s	loc_1A891A
		cmp.w	$0000001A(a1),d3
		bhi.s	loc_1A891A
		cmp.w	$00000018(a1),d4
		bcs.s	loc_1A891A
		cmp.w	$00000054(a1),d5
		bhi.s	loc_1A891A
		cmp.w	$00000012(a1),d6
		bcs.s	loc_1A891A
		move.b	#$42,d0
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A891A:					  ; CODE XREF: sub_1A8824+CCj
						  ; sub_1A8824+D2j ...
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1A891E:					  ; CODE XREF: sub_1A8824+22j
		add.w	$00000014(a5),d1
		neg.w	d2
		add.w	$00000014(a5),d2
		add.w	$00000016(a5),d3
		neg.w	d4
		add.w	$00000016(a5),d4
		cmp.w	$00000018(a1),d1
		bcs.s	loc_1A8960
		cmp.w	$0000001A(a1),d2
		bhi.s	loc_1A8960
		cmp.w	$0000001C(a1),d3
		bcs.s	loc_1A8960
		cmp.w	$0000001E(a1),d4
		bhi.s	loc_1A8960
		cmp.w	$00000054(a1),d5
		bhi.s	loc_1A8960
		cmp.w	$00000012(a1),d6
		bcs.s	loc_1A8960
		move.b	#$41,d0
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8960:					  ; CODE XREF: sub_1A8824+112j
						  ; sub_1A8824+118j ...
		tst.b	d0
		rts
; End of function sub_1A8824


; =============== S U B	R O U T	I N E =======================================


sub_1A8964:					  ; CODE XREF: ROM:001A4CCEp
						  ; sub_1A4D0E+Cp ...
		move.b	$00000004(a5),d0
		andi.b	#$C0,d0
		beq.s	loc_1A89C8
		cmpi.b	#$80,d0
		bcs.w	loc_1A8A16
		beq.w	loc_1A8A5C
		move.w	(word_FF1800).l,d1
		sub.w	d5,d1
		cmp.w	(Player_CentreX).l,d1
		bhi.w	loc_1A8AA2
		move.w	(word_FF1800).l,d1
		add.w	d6,d1
		cmp.w	(Player_CentreX).l,d1
		bcs.w	loc_1A8AA2
		move.w	(dword_FF1804).l,d2
		sub.w	d7,d2
		cmp.w	(Player_CentreY).l,d2
		bhi.w	loc_1A8AA2
		move.w	(dword_FF1804).l,d2
		add.w	d7,d2
		cmp.w	(Player_CentreY).l,d2
		bcs.w	loc_1A8AA2
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A89C8:					  ; CODE XREF: sub_1A8964+8j
		move.w	(word_FF1800).l,d1
		sub.w	d7,d1
		cmp.w	(Player_CentreX).l,d1
		bhi.w	loc_1A8AA2
		move.w	(word_FF1800).l,d1
		add.w	d7,d1
		cmp.w	(Player_CentreX).l,d1
		bcs.w	loc_1A8AA2
		move.w	(dword_FF1804).l,d2
		sub.w	d5,d2
		cmp.w	(Player_CentreY).l,d2
		bhi.w	loc_1A8AA2
		move.w	(dword_FF1804).l,d2
		add.w	d6,d2
		cmp.w	(Player_CentreY).l,d2
		bcs.w	loc_1A8AA2
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8A16:					  ; CODE XREF: sub_1A8964+Ej
		move.w	(word_FF1800).l,d1
		add.w	d5,d1
		cmp.w	(Player_CentreX).l,d1
		bcs.s	loc_1A8AA2
		move.w	(word_FF1800).l,d1
		sub.w	d6,d1
		cmp.w	(Player_CentreX).l,d1
		bhi.s	loc_1A8AA2
		move.w	(dword_FF1804).l,d2
		sub.w	d7,d2
		cmp.w	(Player_CentreY).l,d2
		bhi.s	loc_1A8AA2
		move.w	(dword_FF1804).l,d2
		add.w	d7,d2
		cmp.w	(Player_CentreY).l,d2
		bcs.s	loc_1A8AA2
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8A5C:					  ; CODE XREF: sub_1A8964+12j
		move.w	(word_FF1800).l,d1
		sub.w	d7,d1
		cmp.w	(Player_CentreX).l,d1
		bhi.s	loc_1A8AA2
		move.w	(word_FF1800).l,d1
		add.w	d7,d1
		cmp.w	(Player_CentreX).l,d1
		bcs.s	loc_1A8AA2
		move.w	(dword_FF1804).l,d2
		add.w	d5,d2
		cmp.w	(Player_CentreY).l,d2
		bcs.s	loc_1A8AA2
		move.w	(dword_FF1804).l,d2
		sub.w	d6,d2
		cmp.w	(Player_CentreY).l,d2
		bhi.s	loc_1A8AA2
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8AA2:					  ; CODE XREF: sub_1A8964+24j
						  ; sub_1A8964+36j ...
		tst.b	d0
		rts
; End of function sub_1A8964

; ---------------------------------------------------------------------------

loc_1A8AA6:					  ; CODE XREF: ROM:loc_1A4D0Aj
						  ; ROM:loc_1A4F30j ...
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1ACD54

loc_1A8AB6:					  ; CODE XREF: ROM:loc_1A4CD6j
						  ; ROM:loc_1A4EFCj ...
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; END OF FUNCTION CHUNK	FOR sub_1ACD54

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_j_RemoveHealth:				  ; CODE XREF: ROM:001A769Ap
						  ; ROM:001A7864p ...
		jmp	(j_RemoveHealth).l
; End of function j_j_RemoveHealth


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_j_AddStatusEffect:				  ; CODE XREF: ROM:001A5AA6p
						  ; ROM:loc_1A5EC2p ...
		jmp	(j_AddStatusEffect).l
; End of function j_j_AddStatusEffect


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

LoadSpecialAI:					  ; CODE XREF: ROM:loc_1A4CA8p
						  ; ROM:loc_1A4CAEp ...
		jmp	(sub_1039C).l
; End of function LoadSpecialAI


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_j_LoadSpriteBehaviour:			  ; CODE XREF: sub_1A4D0E+40p
						  ; sub_1A4D5C+40p ...
		jmp	(j_LoadSpriteBehaviour).l
; End of function j_j_LoadSpriteBehaviour


; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_1A8AE6:					  ; CODE XREF: sub_1A83E6+3B4p
						  ; DATA XREF: ROM:001A6412t ...
		jmp	(sub_1038E).l
; End of function sub_1A8AE6

; ---------------------------------------------------------------------------

loc_1A8AEC:					  ; CODE XREF: ROM:001A76B4j
						  ; ROM:001A787Ej ...
		jmp	(loc_10394).l
; ---------------------------------------------------------------------------

EnemyAI_Unicorn1_B:				  ; CODE XREF: ROM:001A8552j
		bra.s	sub_1A8B40
; ---------------------------------------------------------------------------

EnemyAI_Unicorn1_A:				  ; CODE XREF: ROM:001A854Ej
		bclr	#$01,$00000038(a5)
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A8B12
		move.b	$00000037(a5),d0
		beq.s	loc_1A8B18
		cmpi.b	#$10,d0
		beq.s	loc_1A8B5E
		bra.w	loc_1A8CCA
; ---------------------------------------------------------------------------

loc_1A8B12:					  ; CODE XREF: ROM:001A8B00j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A8B18:					  ; CODE XREF: ROM:001A8B06j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	sub_1A8B40
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A8B40:					  ; CODE XREF: ROM:EnemyAI_Unicorn1_Bj
						  ; ROM:001A8B3Cj ...
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		bclr	#$01,$00000038(a5)
		rts
; End of function sub_1A8B40

; ---------------------------------------------------------------------------

loc_1A8B5E:					  ; CODE XREF: ROM:001A8B0Cj
		tst.b	(byte_FF1142).l
		bne.s	loc_1A8B8A
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A8B9A
		bcs.s	loc_1A8B84
		bsr.w	sub_1A8C1E
		bcs.s	loc_1A8B84
		bsr.w	sub_1A8C9E

loc_1A8B84:					  ; CODE XREF: ROM:001A8B78j
						  ; ROM:001A8B7Ej
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A8B8A:					  ; CODE XREF: ROM:001A8B64j
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	LoadSpecialAI
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A8B9A:					  ; CODE XREF: ROM:001A8B76p
		move.w	#$0040,d5
		move.w	#$0040,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A8C1A
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A8C1A
		move.b	$00000004(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.s	loc_1A8C16
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0050,d7
		bls.w	loc_1A8C00
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8C00:					  ; CODE XREF: sub_1A8B9A+4Cj
						  ; ROM:001A8D5Cj
		move.b	#$21,$00000037(a5)
		move.w	#$0018,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8C16:					  ; CODE XREF: sub_1A8B9A+3Cj
		bsr.w	sub_1A8B40

loc_1A8C1A:					  ; CODE XREF: sub_1A8B9A+10j
						  ; sub_1A8B9A+22j
		tst.b	d0
		rts
; End of function sub_1A8B9A


; =============== S U B	R O U T	I N E =======================================


sub_1A8C1E:					  ; CODE XREF: ROM:001A8B7Ap
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A8C84
		move.b	$00000004(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.s	loc_1A8C84
		move.b	(Player_AnimAction).l,d0
		andi.b	#$07,d0
		beq.w	loc_1A8C88
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$001E,d7
		bhi.s	loc_1A8C84
		bset	#$01,$00000038(a5)
		move.b	#$22,$00000037(a5)
		move.w	#$0017,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8C84:					  ; CODE XREF: sub_1A8C1E+10j
						  ; sub_1A8C1E+2Aj ...
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1A8C88:					  ; CODE XREF: sub_1A8C1E+36j
		move.b	#$23,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; End of function sub_1A8C1E


; =============== S U B	R O U T	I N E =======================================


sub_1A8C9E:					  ; CODE XREF: ROM:001A8B80p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A8CC6
		move.b	#$24,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8CC6:					  ; CODE XREF: sub_1A8C9E+10j
		tst.b	d0
		rts
; End of function sub_1A8C9E

; ---------------------------------------------------------------------------

loc_1A8CCA:					  ; CODE XREF: ROM:001A8B0Ej
		andi.b	#$0F,d0
		beq.s	loc_1A8CEC
		cmpi.b	#$01,d0
		beq.w	loc_1A8D74
		cmpi.b	#$02,d0
		beq.w	loc_1A8DA6
		cmpi.b	#$03,d0
		beq.w	loc_1A8D7A
		bra.w	loc_1A8D7A
; ---------------------------------------------------------------------------

loc_1A8CEC:					  ; CODE XREF: ROM:001A8CCEj
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0040,d5
		move.w	#$0040,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcc.w	sub_1A8B40
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.w	sub_1A8B40
		move.b	$00000004(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.w	sub_1A8B40
		addq.b	#$01,$0000000D(a5)
		move.b	$0000000D(a5),d0
		andi.b	#$0F,d0
		bne.s	loc_1A8D60
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0050,d7
		bcs.w	loc_1A8C00

loc_1A8D60:					  ; CODE XREF: ROM:001A8D4Cj
		move.b	$0000000D(a5),d0
		andi.w	#$0010,d0
		lsl.w	#$04,d0
		addi.w	#$0300,d0
		move.w	d0,$0000002C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A8D74:					  ; CODE XREF: ROM:001A8CD4j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A8D7A:					  ; CODE XREF: ROM:001A8CE4j
						  ; ROM:001A8CE8j
		addq.b	#$01,$0000000D(a5)
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0100,$0000002C(a5)
		cmpi.b	#$10,$0000000D(a5)
		bcs.s	loc_1A8DA0
		bra.w	sub_1A8B40
; ---------------------------------------------------------------------------

loc_1A8DA0:					  ; CODE XREF: ROM:001A8D9Aj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A8DA6:					  ; CODE XREF: ROM:001A8CDCj
		bset	#$01,$00000038(a5)
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

EnemyAI_Unicorn2_B:				  ; CODE XREF: ROM:001A855Aj
		bra.s	sub_1A8E00
; ---------------------------------------------------------------------------

EnemyAI_Unicorn2_A:				  ; CODE XREF: ROM:001A8556j
		bclr	#$01,$00000038(a5)
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A8DD2
		move.b	$00000037(a5),d0
		beq.s	loc_1A8DD8
		cmpi.b	#$10,d0
		beq.s	loc_1A8E1E
		bra.w	loc_1A8F8A
; ---------------------------------------------------------------------------

loc_1A8DD2:					  ; CODE XREF: ROM:001A8DC0j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A8DD8:					  ; CODE XREF: ROM:001A8DC6j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	sub_1A8E00
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A8E00:					  ; CODE XREF: ROM:EnemyAI_Unicorn2_Bj
						  ; ROM:001A8DFCj ...
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		bclr	#$01,$00000038(a5)
		rts
; End of function sub_1A8E00

; ---------------------------------------------------------------------------

loc_1A8E1E:					  ; CODE XREF: ROM:001A8DCCj
		tst.b	(byte_FF1142).l
		bne.s	loc_1A8E4A
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A8E5A
		bcs.s	loc_1A8E44
		bsr.w	sub_1A8EDE
		bcs.s	loc_1A8E44
		bsr.w	sub_1A8F5E

loc_1A8E44:					  ; CODE XREF: ROM:001A8E38j
						  ; ROM:001A8E3Ej
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A8E4A:					  ; CODE XREF: ROM:001A8E24j
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	LoadSpecialAI
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A8E5A:					  ; CODE XREF: ROM:001A8E36p
		move.w	#$0040,d5
		move.w	#$0040,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A8EDA
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A8EDA
		move.b	$00000004(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.s	loc_1A8ED6
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bls.w	loc_1A8EC0
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8EC0:					  ; CODE XREF: sub_1A8E5A+4Cj
						  ; ROM:001A901Cj
		move.b	#$21,$00000037(a5)
		move.w	#$0018,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8ED6:					  ; CODE XREF: sub_1A8E5A+3Cj
		bsr.w	sub_1A8E00

loc_1A8EDA:					  ; CODE XREF: sub_1A8E5A+10j
						  ; sub_1A8E5A+22j
		tst.b	d0
		rts
; End of function sub_1A8E5A


; =============== S U B	R O U T	I N E =======================================


sub_1A8EDE:					  ; CODE XREF: ROM:001A8E3Ap
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A8F44
		move.b	$00000004(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.s	loc_1A8F44
		move.b	(Player_AnimAction).l,d0
		andi.b	#$07,d0
		beq.w	loc_1A8F48
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bhi.s	loc_1A8F44
		bset	#$01,$00000038(a5)
		move.b	#$22,$00000037(a5)
		move.w	#$0017,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8F44:					  ; CODE XREF: sub_1A8EDE+10j
						  ; sub_1A8EDE+2Aj ...
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1A8F48:					  ; CODE XREF: sub_1A8EDE+36j
		move.b	#$23,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; End of function sub_1A8EDE


; =============== S U B	R O U T	I N E =======================================


sub_1A8F5E:					  ; CODE XREF: ROM:001A8E40p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A8F86
		move.b	#$24,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8F86:					  ; CODE XREF: sub_1A8F5E+10j
		tst.b	d0
		rts
; End of function sub_1A8F5E

; ---------------------------------------------------------------------------

loc_1A8F8A:					  ; CODE XREF: ROM:001A8DCEj
		andi.b	#$0F,d0
		beq.s	loc_1A8FAC
		cmpi.b	#$01,d0
		beq.w	loc_1A9034
		cmpi.b	#$02,d0
		beq.w	loc_1A9066
		cmpi.b	#$03,d0
		beq.w	loc_1A903A
		bra.w	loc_1A903A
; ---------------------------------------------------------------------------

loc_1A8FAC:					  ; CODE XREF: ROM:001A8F8Ej
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0040,d5
		move.w	#$0040,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcc.w	sub_1A8E00
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.w	sub_1A8E00
		move.b	$00000004(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.w	sub_1A8E00
		addq.b	#$01,$0000000D(a5)
		move.b	$0000000D(a5),d0
		andi.b	#$0F,d0
		bne.s	loc_1A9020
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bcs.w	loc_1A8EC0

loc_1A9020:					  ; CODE XREF: ROM:001A900Cj
		move.b	$0000000D(a5),d0
		andi.w	#$0010,d0
		lsl.w	#$04,d0
		addi.w	#$0300,d0
		move.w	d0,$0000002C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9034:					  ; CODE XREF: ROM:001A8F94j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A903A:					  ; CODE XREF: ROM:001A8FA4j
						  ; ROM:001A8FA8j
		addq.b	#$01,$0000000D(a5)
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0100,$0000002C(a5)
		cmpi.b	#$10,$0000000D(a5)
		bcs.s	loc_1A9060
		bra.w	sub_1A8E00
; ---------------------------------------------------------------------------

loc_1A9060:					  ; CODE XREF: ROM:001A905Aj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A9066:					  ; CODE XREF: ROM:001A8F9Cj
		bset	#$01,$00000038(a5)
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

EnemyAI_Unicorn3_B:				  ; CODE XREF: ROM:001A8562j
		bra.s	sub_1A90C0
; ---------------------------------------------------------------------------

EnemyAI_Unicorn3_A:				  ; CODE XREF: ROM:001A855Ej
		bclr	#$01,$00000038(a5)
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A9092
		move.b	$00000037(a5),d0
		beq.s	loc_1A9098
		cmpi.b	#$10,d0
		beq.s	loc_1A90DE
		bra.w	loc_1A924A
; ---------------------------------------------------------------------------

loc_1A9092:					  ; CODE XREF: ROM:001A9080j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A9098:					  ; CODE XREF: ROM:001A9086j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	sub_1A90C0
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A90C0:					  ; CODE XREF: ROM:EnemyAI_Unicorn3_Bj
						  ; ROM:001A90BCj ...
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		bclr	#$01,$00000038(a5)
		rts
; End of function sub_1A90C0

; ---------------------------------------------------------------------------

loc_1A90DE:					  ; CODE XREF: ROM:001A908Cj
		tst.b	(byte_FF1142).l
		bne.s	loc_1A910A
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A911A
		bcs.s	loc_1A9104
		bsr.w	sub_1A919E
		bcs.s	loc_1A9104
		bsr.w	sub_1A921E

loc_1A9104:					  ; CODE XREF: ROM:001A90F8j
						  ; ROM:001A90FEj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A910A:					  ; CODE XREF: ROM:001A90E4j
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	LoadSpecialAI
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A911A:					  ; CODE XREF: ROM:001A90F6p
		move.w	#$0040,d5
		move.w	#$0040,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A919A
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A919A
		move.b	$00000004(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.s	loc_1A9196
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$001E,d7
		bls.w	loc_1A9180
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9180:					  ; CODE XREF: sub_1A911A+4Cj
						  ; ROM:001A92DCj
		move.b	#$21,$00000037(a5)
		move.w	#$0018,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9196:					  ; CODE XREF: sub_1A911A+3Cj
		bsr.w	sub_1A90C0

loc_1A919A:					  ; CODE XREF: sub_1A911A+10j
						  ; sub_1A911A+22j
		tst.b	d0
		rts
; End of function sub_1A911A


; =============== S U B	R O U T	I N E =======================================


sub_1A919E:					  ; CODE XREF: ROM:001A90FAp
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A9204
		move.b	$00000004(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.s	loc_1A9204
		move.b	(Player_AnimAction).l,d0
		andi.b	#$07,d0
		beq.w	loc_1A9208
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0050,d7
		bhi.s	loc_1A9204
		bset	#$01,$00000038(a5)
		move.b	#$22,$00000037(a5)
		move.w	#$0017,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9204:					  ; CODE XREF: sub_1A919E+10j
						  ; sub_1A919E+2Aj ...
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1A9208:					  ; CODE XREF: sub_1A919E+36j
		move.b	#$23,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; End of function sub_1A919E


; =============== S U B	R O U T	I N E =======================================


sub_1A921E:					  ; CODE XREF: ROM:001A9100p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A9246
		move.b	#$24,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9246:					  ; CODE XREF: sub_1A921E+10j
		tst.b	d0
		rts
; End of function sub_1A921E

; ---------------------------------------------------------------------------

loc_1A924A:					  ; CODE XREF: ROM:001A908Ej
		andi.b	#$0F,d0
		beq.s	loc_1A926C
		cmpi.b	#$01,d0
		beq.w	loc_1A92F4
		cmpi.b	#$02,d0
		beq.w	loc_1A9326
		cmpi.b	#$03,d0
		beq.w	loc_1A92FA
		bra.w	loc_1A92FA
; ---------------------------------------------------------------------------

loc_1A926C:					  ; CODE XREF: ROM:001A924Ej
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0040,d5
		move.w	#$0040,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcc.w	sub_1A90C0
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.w	sub_1A90C0
		move.b	$00000004(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.w	sub_1A90C0
		addq.b	#$01,$0000000D(a5)
		move.b	$0000000D(a5),d0
		andi.b	#$0F,d0
		bne.s	loc_1A92E0
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$001E,d7
		bcs.w	loc_1A9180

loc_1A92E0:					  ; CODE XREF: ROM:001A92CCj
		move.b	$0000000D(a5),d0
		andi.w	#$0010,d0
		lsl.w	#$04,d0
		addi.w	#$0200,d0
		move.w	d0,$0000002C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A92F4:					  ; CODE XREF: ROM:001A9254j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A92FA:					  ; CODE XREF: ROM:001A9264j
						  ; ROM:001A9268j
		addq.b	#$01,$0000000D(a5)
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0100,$0000002C(a5)
		cmpi.b	#$10,$0000000D(a5)
		bcs.s	loc_1A9320
		bra.w	sub_1A90C0
; ---------------------------------------------------------------------------

loc_1A9320:					  ; CODE XREF: ROM:001A931Aj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A9326:					  ; CODE XREF: ROM:001A925Cj
		bset	#$01,$00000038(a5)
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

EnemyAI_Skeleton1_B:				  ; CODE XREF: ROM:001A856Aj
		bra.s	loc_1A937A
; ---------------------------------------------------------------------------

EnemyAI_Skeleton1_A:				  ; CODE XREF: ROM:001A8566j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A934C
		move.b	$00000037(a5),d0
		beq.s	loc_1A9352
		cmpi.b	#$10,d0
		beq.s	loc_1A9392
		bra.w	loc_1A94E8
; ---------------------------------------------------------------------------

loc_1A934C:					  ; CODE XREF: ROM:001A933Aj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A9352:					  ; CODE XREF: ROM:001A9340j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A937A
		rts
; ---------------------------------------------------------------------------

loc_1A937A:					  ; CODE XREF: ROM:EnemyAI_Skeleton1_Bj
						  ; ROM:001A9376j ...
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9392:					  ; CODE XREF: ROM:001A9346j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A93C2
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A93D2
		bcs.s	loc_1A93BC
		bsr.s	sub_1A940E
		bcs.s	loc_1A93BC
		bsr.w	sub_1A944E
		bcs.s	loc_1A93BC
		bsr.w	sub_1A948E

loc_1A93BC:					  ; CODE XREF: ROM:001A93ACj
						  ; ROM:001A93B0j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A93C2:					  ; CODE XREF: ROM:001A9398j
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	LoadSpecialAI
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A93D2:					  ; CODE XREF: ROM:001A93AAp
		move.w	#$0090,d5
		move.w	#$FFA0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A940A
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0024,d7
		bhi.s	loc_1A940A
		move.b	#$20,$00000037(a5)
		move.w	#$0014,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A940A:					  ; CODE XREF: sub_1A93D2+10j
						  ; sub_1A93D2+20j
		tst.b	d0
		rts
; End of function sub_1A93D2


; =============== S U B	R O U T	I N E =======================================


sub_1A940E:					  ; CODE XREF: ROM:001A93AEp
		move.w	#$0040,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A944A
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0024,d7
		bhi.s	loc_1A944A
		move.b	#$21,$00000037(a5)
		move.w	#$000E,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A944A:					  ; CODE XREF: sub_1A940E+10j
						  ; sub_1A940E+20j
		tst.b	d0
		rts
; End of function sub_1A940E


; =============== S U B	R O U T	I N E =======================================


sub_1A944E:					  ; CODE XREF: ROM:001A93B2p
		move.w	#$0048,d5
		move.w	#$FFD8,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A948A
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0024,d7
		bhi.s	loc_1A948A
		move.b	#$22,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A948A:					  ; CODE XREF: sub_1A944E+10j
						  ; sub_1A944E+20j
		tst.b	d0
		rts
; End of function sub_1A944E


; =============== S U B	R O U T	I N E =======================================


sub_1A948E:					  ; CODE XREF: ROM:001A93B8p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A94E4
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$003C,d7
		bcc.s	loc_1A94CA
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A94CA:					  ; CODE XREF: sub_1A948E+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0009,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A94E4:					  ; CODE XREF: sub_1A948E+10j
		tst.b	d0
		rts
; End of function sub_1A948E

; ---------------------------------------------------------------------------

loc_1A94E8:					  ; CODE XREF: ROM:001A9348j
		andi.b	#$0F,d0
		beq.s	loc_1A9506
		cmpi.b	#$01,d0
		beq.s	loc_1A950C
		cmpi.b	#$02,d0
		beq.s	loc_1A9546
		cmpi.b	#$03,d0
		beq.w	loc_1A950C
		bra.w	loc_1A950C
; ---------------------------------------------------------------------------

loc_1A9506:					  ; CODE XREF: ROM:001A94ECj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A950C:					  ; CODE XREF: ROM:001A94F2j
						  ; ROM:001A94FEj ...
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1A9540
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	loc_1A9540
		beq.w	loc_1A937A

loc_1A9540:					  ; CODE XREF: ROM:001A951Cj
						  ; ROM:001A953Aj ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A9546:					  ; CODE XREF: ROM:001A94F8j
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0300,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1A9540
		bra.w	loc_1A937A
; ---------------------------------------------------------------------------
		jsr	(sub_103B2).l
		bcs.w	loc_1A95D4
		move.w	(a5),d0
		move.b	$00000004(a5),d1
		andi.b	#$C0,d1
		eori.b	#$80,d1
		beq.s	loc_1A9594
		cmpi.b	#$80,d1
		bcs.s	loc_1A9598
		beq.s	loc_1A959E
		subi.w	#$0200,d0
		bra.s	loc_1A95A0
; ---------------------------------------------------------------------------

loc_1A9594:					  ; CODE XREF: ROM:001A9584j
		subq.b	#$02,d0
		bra.s	loc_1A95A0
; ---------------------------------------------------------------------------

loc_1A9598:					  ; CODE XREF: ROM:001A958Aj
		addi.w	#$0200,d0
		bra.s	loc_1A95A0
; ---------------------------------------------------------------------------

loc_1A959E:					  ; CODE XREF: ROM:001A958Cj
		addq.b	#$02,d0

loc_1A95A0:					  ; CODE XREF: ROM:001A9592j
						  ; ROM:001A9596j ...
		move.w	d0,(a1)
		move.b	d1,$00000004(a1)
		move.b	#$78,d2
		move.w	$00000012(a5),d3
		addi.w	#$0010,d3
		move.w	d3,$00000012(a1)
		move.w	$00000002(a5),$00000002(a1)
		move.w	#$47C0,$00000006(a1)
		move.w	#$013C,$00000034(a1)
		move.b	#$04,$00000009(a1)
		jsr	(sub_103B8).l

loc_1A95D4:					  ; CODE XREF: ROM:001A9572j
		bra.w	loc_1A937A
; ---------------------------------------------------------------------------

EnemyAI_Skeleton2_B:				  ; CODE XREF: ROM:001A8572j
		bra.s	loc_1A9626
; ---------------------------------------------------------------------------

EnemyAI_Skeleton2_A:				  ; CODE XREF: ROM:001A856Ej
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A95F2
		move.b	$00000037(a5),d0
		beq.s	loc_1A95FE
		cmpi.b	#$10,d0
		beq.s	loc_1A9644
		bra.w	loc_1A97B4
; ---------------------------------------------------------------------------

loc_1A95F2:					  ; CODE XREF: ROM:001A95E0j
		bclr	#$00,$00000038(a5)
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A95FE:					  ; CODE XREF: ROM:001A95E6j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A9626
		rts
; ---------------------------------------------------------------------------

loc_1A9626:					  ; CODE XREF: ROM:EnemyAI_Skeleton2_Bj
						  ; ROM:001A9622j ...
		bclr	#$00,$00000038(a5)
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9644:					  ; CODE XREF: ROM:001A95ECj
		tst.b	(byte_FF1142).l
		bne.s	loc_1A9674
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A9684
		bcs.s	loc_1A966E
		bsr.s	sub_1A96C0
		bcs.s	loc_1A966E
		bsr.w	sub_1A971A
		bcs.s	loc_1A966E
		bsr.w	sub_1A975A

loc_1A966E:					  ; CODE XREF: ROM:001A965Ej
						  ; ROM:001A9662j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A9674:					  ; CODE XREF: ROM:001A964Aj
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	LoadSpecialAI
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A9684:					  ; CODE XREF: ROM:001A965Cp
		move.w	#$0070,d5
		move.w	#$FFB0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A96BC
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$003E,d7
		bhi.s	loc_1A96BC
		move.b	#$20,$00000037(a5)
		move.w	#$0019,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A96BC:					  ; CODE XREF: sub_1A9684+10j
						  ; sub_1A9684+20j
		tst.b	d0
		rts
; End of function sub_1A9684


; =============== S U B	R O U T	I N E =======================================


sub_1A96C0:					  ; CODE XREF: ROM:001A9660p
		move.w	#$0050,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A9716
		move.b	$00000004(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.s	loc_1A9716
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$003C,d7
		bhi.s	loc_1A9716
		move.b	#$21,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9716:					  ; CODE XREF: sub_1A96C0+10j
						  ; sub_1A96C0+2Aj ...
		tst.b	d0
		rts
; End of function sub_1A96C0


; =============== S U B	R O U T	I N E =======================================


sub_1A971A:					  ; CODE XREF: ROM:001A9664p
		move.w	#$0030,d5
		move.w	#$FFE0,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A9756
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1A9756
		move.b	#$22,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9756:					  ; CODE XREF: sub_1A971A+10j
						  ; sub_1A971A+20j
		tst.b	d0
		rts
; End of function sub_1A971A


; =============== S U B	R O U T	I N E =======================================


sub_1A975A:					  ; CODE XREF: ROM:001A966Ap
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A97B0
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0028,d7
		bcc.s	loc_1A9796
		move.b	#$23,$00000037(a5)
		move.w	#$0012,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9796:					  ; CODE XREF: sub_1A975A+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A97B0:					  ; CODE XREF: sub_1A975A+10j
		tst.b	d0
		rts
; End of function sub_1A975A

; ---------------------------------------------------------------------------

loc_1A97B4:					  ; CODE XREF: ROM:001A95EEj
		andi.b	#$0F,d0
		beq.s	loc_1A97D4
		cmpi.b	#$01,d0
		beq.s	loc_1A9808
		cmpi.b	#$02,d0
		beq.w	loc_1A985E
		cmpi.b	#$03,d0
		beq.w	loc_1A9824
		bra.w	loc_1A9824
; ---------------------------------------------------------------------------

loc_1A97D4:					  ; CODE XREF: ROM:001A97B8j
		btst	#$05,$0000002D(a5)
		beq.s	loc_1A97E4
		move.w	#$0100,$0000002C(a5)
		bra.s	loc_1A9802
; ---------------------------------------------------------------------------

loc_1A97E4:					  ; CODE XREF: ROM:001A97DAj
		btst	#$04,$0000002D(a5)
		beq.s	loc_1A9802
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)

loc_1A9802:					  ; CODE XREF: ROM:001A97E2j
						  ; ROM:001A97EAj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A9808:					  ; CODE XREF: ROM:001A97BEj
		bset	#$00,$00000038(a5)
		move.w	#$0400,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$28,$0000000D(a5)
		bcc.w	loc_1A9626
		rts
; ---------------------------------------------------------------------------

loc_1A9824:					  ; CODE XREF: ROM:001A97CCj
						  ; ROM:001A97D0j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1A9858
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	loc_1A9858
		beq.w	loc_1A9626

loc_1A9858:					  ; CODE XREF: ROM:001A9834j
						  ; ROM:001A9852j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A985E:					  ; CODE XREF: ROM:001A97C4j
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0300,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1A9858
		bra.w	loc_1A9626
; ---------------------------------------------------------------------------

EnemyAI_Skeleton3_B:				  ; CODE XREF: ROM:001A857Aj
		bra.s	loc_1A98D2
; ---------------------------------------------------------------------------

EnemyAI_Skeleton3_A:				  ; CODE XREF: ROM:001A8576j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A989E
		move.b	$00000037(a5),d0
		beq.s	loc_1A98AA
		cmpi.b	#$10,d0
		beq.s	loc_1A98F0
		bra.w	loc_1A9A46
; ---------------------------------------------------------------------------

loc_1A989E:					  ; CODE XREF: ROM:001A988Cj
		bclr	#$00,$00000038(a5)
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A98AA:					  ; CODE XREF: ROM:001A9892j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A98D2
		rts
; ---------------------------------------------------------------------------

loc_1A98D2:					  ; CODE XREF: ROM:EnemyAI_Skeleton3_Bj
						  ; ROM:001A98CEj ...
		bclr	#$00,$00000038(a5)
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A98F0:					  ; CODE XREF: ROM:001A9898j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A9920
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A9930
		bcs.s	loc_1A991A
		bsr.s	sub_1A996C
		bcs.s	loc_1A991A
		bsr.w	sub_1A99AC
		bcs.s	loc_1A991A
		bsr.w	sub_1A99EC

loc_1A991A:					  ; CODE XREF: ROM:001A990Aj
						  ; ROM:001A990Ej ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A9920:					  ; CODE XREF: ROM:001A98F6j
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	LoadSpecialAI
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A9930:					  ; CODE XREF: ROM:001A9908p
		move.w	#$0070,d5
		move.w	#$FFB0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A9968
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0056,d7
		bhi.s	loc_1A9968
		move.b	#$20,$00000037(a5)
		move.w	#$001A,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9968:					  ; CODE XREF: sub_1A9930+10j
						  ; sub_1A9930+20j
		tst.b	d0
		rts
; End of function sub_1A9930


; =============== S U B	R O U T	I N E =======================================


sub_1A996C:					  ; CODE XREF: ROM:001A990Cp
		move.w	#$0050,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A99A8
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$007D,d7
		bhi.s	loc_1A99A8
		move.b	#$21,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A99A8:					  ; CODE XREF: sub_1A996C+10j
						  ; sub_1A996C+20j
		tst.b	d0
		rts
; End of function sub_1A996C


; =============== S U B	R O U T	I N E =======================================


sub_1A99AC:					  ; CODE XREF: ROM:001A9910p
		move.w	#$0030,d5
		move.w	#$FFE0,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A99E8
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$002B,d7
		bhi.s	loc_1A99E8
		move.b	#$22,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A99E8:					  ; CODE XREF: sub_1A99AC+10j
						  ; sub_1A99AC+20j
		tst.b	d0
		rts
; End of function sub_1A99AC


; =============== S U B	R O U T	I N E =======================================


sub_1A99EC:					  ; CODE XREF: ROM:001A9916p
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A9A42
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bcc.s	loc_1A9A28
		move.b	#$23,$00000037(a5)
		move.w	#$0012,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9A28:					  ; CODE XREF: sub_1A99EC+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9A42:					  ; CODE XREF: sub_1A99EC+10j
		tst.b	d0
		rts
; End of function sub_1A99EC

; ---------------------------------------------------------------------------

loc_1A9A46:					  ; CODE XREF: ROM:001A989Aj
		andi.b	#$0F,d0
		beq.s	loc_1A9A66
		cmpi.b	#$01,d0
		beq.s	loc_1A9A8A
		cmpi.b	#$02,d0
		beq.w	loc_1A9AE0
		cmpi.b	#$03,d0
		beq.w	loc_1A9AA6
		bra.w	loc_1A9AA6
; ---------------------------------------------------------------------------

loc_1A9A66:					  ; CODE XREF: ROM:001A9A4Aj
		cmpi.b	#$18,$0000002A(a5)
		bcc.s	loc_1A9A84
		move.w	#$0300,$0000002C(a5)
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C

loc_1A9A84:					  ; CODE XREF: ROM:001A9A6Cj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A9A8A:					  ; CODE XREF: ROM:001A9A50j
		bset	#$00,$00000038(a5)
		move.w	#$0400,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$28,$0000000D(a5)
		bcc.w	loc_1A98D2
		rts
; ---------------------------------------------------------------------------

loc_1A9AA6:					  ; CODE XREF: ROM:001A9A5Ej
						  ; ROM:001A9A62j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1A9ADA
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	loc_1A9ADA
		beq.w	loc_1A98D2

loc_1A9ADA:					  ; CODE XREF: ROM:001A9AB6j
						  ; ROM:001A9AD4j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A9AE0:					  ; CODE XREF: ROM:001A9A56j
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0300,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1A9ADA
		bra.w	loc_1A98D2
; ---------------------------------------------------------------------------

EnemyAI_Mimic1_B:				  ; CODE XREF: ROM:001A8582j
		bra.s	loc_1A9B4E
; ---------------------------------------------------------------------------

EnemyAI_Mimic1_A:				  ; CODE XREF: ROM:001A857Ej
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A9B20
		move.b	$00000037(a5),d0
		beq.s	loc_1A9B26
		cmpi.b	#$10,d0
		beq.s	loc_1A9B6C
		bra.w	loc_1A9CD4
; ---------------------------------------------------------------------------

loc_1A9B20:					  ; CODE XREF: ROM:001A9B0Ej
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A9B26:					  ; CODE XREF: ROM:001A9B14j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A9B4E
		rts
; ---------------------------------------------------------------------------

loc_1A9B4E:					  ; CODE XREF: ROM:EnemyAI_Mimic1_Bj
						  ; ROM:001A9B4Aj ...
		bclr	#$06,$00000038(a5)
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9B6C:					  ; CODE XREF: ROM:001A9B1Aj
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A9B9E
		bcs.s	loc_1A9B90
		bsr.w	sub_1A9BF6
		bcs.s	loc_1A9B90
		bsr.w	sub_1A9C3E
		bcs.s	loc_1A9B90
		bsr.w	sub_1A9C88

loc_1A9B90:					  ; CODE XREF: ROM:001A9B7Ej
						  ; ROM:001A9B84j ...
		btst	#$06,$00000038(a5)
		bne.s	locret_1A9B9C
		bsr.w	LoadSpecialAI

locret_1A9B9C:					  ; CODE XREF: ROM:001A9B96j
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A9B9E:					  ; CODE XREF: ROM:001A9B7Cp
		move.b	$0000002F(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1A9BF2
		btst	#$06,$00000038(a5)
		bne.s	loc_1A9BF2
		move.w	#$0080,d5
		move.w	#$0080,d6
		move.w	#$0080,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A9BF2
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0002,d7
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		clr.b	$0000000D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bset	#$06,$00000038(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9BF2:					  ; CODE XREF: sub_1A9B9E+8j
						  ; sub_1A9B9E+12j ...
		tst.b	d0
		rts
; End of function sub_1A9B9E


; =============== S U B	R O U T	I N E =======================================


sub_1A9BF6:					  ; CODE XREF: ROM:001A9B80p
		btst	#$06,$00000038(a5)
		bne.s	loc_1A9C3A
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A9C3A
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0190,d7
		bhi.s	loc_1A9C3A
		move.b	#$21,$00000037(a5)
		move.w	#$001B,$00000034(a5)
		clr.b	$0000000D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9C3A:					  ; CODE XREF: sub_1A9BF6+6j
						  ; sub_1A9BF6+18j ...
		tst.b	d0
		rts
; End of function sub_1A9BF6


; =============== S U B	R O U T	I N E =======================================


sub_1A9C3E:					  ; CODE XREF: ROM:001A9B86p
		move.b	$0000002F(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1A9C84
		btst	#$06,$00000038(a5)
		beq.s	loc_1A9C84
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A9C84
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		bclr	#$06,$00000038(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9C84:					  ; CODE XREF: sub_1A9C3E+8j
						  ; sub_1A9C3E+12j ...
		tst.b	d0
		rts
; End of function sub_1A9C3E


; =============== S U B	R O U T	I N E =======================================


sub_1A9C88:					  ; CODE XREF: ROM:001A9B8Cp
		btst	#$06,$00000038(a5)
		bne.s	loc_1A9CD0
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A9CD0
		move.b	$00000055(a5),d0
		subi.b	#$10,d0
		sub.b	(Player_HitBoxZEnd+1).l,d0
		cmpi.b	#$20,d0
		bcc.s	loc_1A9CD0
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9CD0:					  ; CODE XREF: sub_1A9C88+6j
						  ; sub_1A9C88+18j ...
		tst.b	d0
		rts
; End of function sub_1A9C88

; ---------------------------------------------------------------------------

loc_1A9CD4:					  ; CODE XREF: ROM:001A9B1Cj
		andi.b	#$0F,d0
		beq.s	loc_1A9CF6
		cmpi.b	#$01,d0
		beq.w	locret_1A9DA0
		cmpi.b	#$02,d0
		beq.w	loc_1A9DA2
		cmpi.b	#$03,d0
		beq.w	loc_1A9E4A
		bra.w	loc_1A9E4A
; ---------------------------------------------------------------------------

loc_1A9CF6:					  ; CODE XREF: ROM:001A9CD8j
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$01,$0000000D(a5)
		bne.s	loc_1A9D10
		move.b	#$FF,$0000002D(a5)
		move.w	#$01C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9D10:					  ; CODE XREF: ROM:001A9D00j
		cmpi.b	#$08,$0000000D(a5)
		bne.s	loc_1A9D26
		move.b	#$FF,$0000002D(a5)
		move.w	#$0180,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9D26:					  ; CODE XREF: ROM:001A9D16j
		cmpi.b	#$10,$0000000D(a5)
		bne.s	loc_1A9D3C
		move.b	#$FF,$0000002D(a5)
		move.w	#$0140,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9D3C:					  ; CODE XREF: ROM:001A9D2Cj
		cmpi.b	#$18,$0000000D(a5)
		bne.s	loc_1A9D52
		move.b	#$FF,$0000002D(a5)
		move.w	#$0100,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9D52:					  ; CODE XREF: ROM:001A9D42j
		cmpi.b	#$20,$0000000D(a5)
		bne.w	loc_1A9D6A
		move.b	#$FF,$0000002D(a5)
		move.w	#$00C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9D6A:					  ; CODE XREF: ROM:001A9D58j
		cmpi.b	#$28,$0000000D(a5)
		bne.w	loc_1A9D82
		move.b	#$FF,$0000002D(a5)
		move.w	#$0080,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9D82:					  ; CODE XREF: ROM:001A9D70j
		cmpi.b	#$30,$0000000D(a5)
		bne.w	locret_1A9D9E
		move.b	#$FF,$0000002D(a5)
		move.w	#$0040,$0000002E(a5)
		move.b	#$10,$00000037(a5)

locret_1A9D9E:					  ; CODE XREF: ROM:001A9D88j
		rts
; ---------------------------------------------------------------------------

locret_1A9DA0:					  ; CODE XREF: ROM:001A9CDEj
		rts
; ---------------------------------------------------------------------------

loc_1A9DA2:					  ; CODE XREF: ROM:001A9CE6j
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$01,$0000000D(a5)
		bne.s	loc_1A9DBC
		move.b	#$FF,$0000002D(a5)
		move.w	#$0040,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9DBC:					  ; CODE XREF: ROM:001A9DACj
		cmpi.b	#$08,$0000000D(a5)
		bne.s	loc_1A9DD2
		move.b	#$FF,$0000002D(a5)
		move.w	#$0080,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9DD2:					  ; CODE XREF: ROM:001A9DC2j
		cmpi.b	#$10,$0000000D(a5)
		bne.s	loc_1A9DE8
		move.b	#$FF,$0000002D(a5)
		move.w	#$00C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9DE8:					  ; CODE XREF: ROM:001A9DD8j
		cmpi.b	#$18,$0000000D(a5)
		bne.s	loc_1A9DFE
		move.b	#$FF,$0000002D(a5)
		move.w	#$0100,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9DFE:					  ; CODE XREF: ROM:001A9DEEj
		cmpi.b	#$20,$0000000D(a5)
		bne.w	loc_1A9E16
		move.b	#$FF,$0000002D(a5)
		move.w	#$0140,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9E16:					  ; CODE XREF: ROM:001A9E04j
		cmpi.b	#$28,$0000000D(a5)
		bne.w	loc_1A9E2E
		move.b	#$FF,$0000002D(a5)
		move.w	#$0180,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9E2E:					  ; CODE XREF: ROM:001A9E1Cj
		cmpi.b	#$30,$0000000D(a5)
		bne.w	locret_1A9E48
		move.b	#$FF,$0000002D(a5)
		move.w	#$01C0,$0000002E(a5)
		bra.w	loc_1A9B4E
; ---------------------------------------------------------------------------

locret_1A9E48:					  ; CODE XREF: ROM:001A9E34j
		rts
; ---------------------------------------------------------------------------

loc_1A9E4A:					  ; CODE XREF: ROM:001A9CEEj
						  ; ROM:001A9CF2j
		move.w	#$0100,$0000002C(a5)
		move.w	$00000012(a5),d0
		move.w	$00000054(a5),d1
		movem.w	d0-d1,-(sp)
		move.w	(Player_HitBoxZEnd).l,d0
		addi.w	#$0011,d0
		move.w	d0,$00000054(a5)
		clr.w	d1
		move.b	$00000005(a5),d1
		sub.w	d1,d0
		addq.w	#$01,d0
		move.w	d0,$00000012(a5)
		jsr	(sub_3BC).l
		bcc.s	loc_1A9E90
		movem.w	(sp)+,d0-d1
		move.w	d0,$00000012(a5)
		move.w	d1,$00000054(a5)
		bra.w	loc_1A9B4E
; ---------------------------------------------------------------------------

loc_1A9E90:					  ; CODE XREF: ROM:001A9E7Ej
		movem.w	(sp)+,d0-d1
		tst.b	(byte_FF1145).l
		bne.w	loc_1A9B4E
		tst.b	(byte_FF1142).l
		bne.s	loc_1A9EAE
		move.b	#$01,(byte_FF1142).l

loc_1A9EAE:					  ; CODE XREF: ROM:001A9EA4j
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1A9B4E
		move.b	$0000000D(a5),d0
		addq.b	#$01,$0000000D(a5)
		tst.b	d0
		bne.s	loc_1A9EF6
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Throw
; ---------------------------------------------------------------------------
		lea	(Player_X).l,a5
		move.w	#$0100,d0
		bsr.w	j_j_RemoveHealth
		tst.w	$0000003E(a5)
		beq.s	loc_1A9F04

loc_1A9EF6:					  ; CODE XREF: ROM:001A9EDCj
		cmpi.b	#$1E,d0
		bcs.w	locret_1A9F02
		clr.b	$0000000D(a5)

locret_1A9F02:					  ; CODE XREF: ROM:001A9EFAj
		rts
; ---------------------------------------------------------------------------

loc_1A9F04:					  ; CODE XREF: ROM:001A9EF4j
		bclr	#$06,$0000000C(a5)
		bra.w	loc_1A8AEC
; ---------------------------------------------------------------------------

EnemyAI_Mimic2_B:				  ; CODE XREF: ROM:001A858Aj
		bra.s	loc_1A9F56
; ---------------------------------------------------------------------------

EnemyAI_Mimic2_A:				  ; CODE XREF: ROM:001A8586j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1A9F28
		move.b	$00000037(a5),d0
		beq.s	loc_1A9F2E
		cmpi.b	#$10,d0
		beq.s	loc_1A9F74
		bra.w	loc_1AA104
; ---------------------------------------------------------------------------

loc_1A9F28:					  ; CODE XREF: ROM:001A9F16j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1A9F2E:					  ; CODE XREF: ROM:001A9F1Cj
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A9F56
		rts
; ---------------------------------------------------------------------------

loc_1A9F56:					  ; CODE XREF: ROM:EnemyAI_Mimic2_Bj
						  ; ROM:001A9F52j ...
		bclr	#$06,$00000038(a5)
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9F74:					  ; CODE XREF: ROM:001A9F22j
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1A9FA6
		bcs.s	loc_1A9F98
		bsr.w	sub_1AA000
		bcs.s	loc_1A9F98
		bsr.w	sub_1AA048
		bcs.s	loc_1A9F98
		bsr.w	sub_1AA092

loc_1A9F98:					  ; CODE XREF: ROM:001A9F86j
						  ; ROM:001A9F8Cj ...
		btst	#$06,$00000038(a5)
		bne.s	locret_1A9FA4
		bsr.w	LoadSpecialAI

locret_1A9FA4:					  ; CODE XREF: ROM:001A9F9Ej
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A9FA6:					  ; CODE XREF: ROM:001A9F84p
		move.b	$0000002F(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1A9FFC
		btst	#$06,$00000038(a5)
		bne.s	loc_1A9FFC
		move.w	#$0080,d5
		move.w	#$0080,d6
		move.w	#$0080,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A9FFC
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0002,d7
		bhi.s	loc_1A9FFC
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		clr.b	$0000000D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bset	#$06,$00000038(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9FFC:					  ; CODE XREF: sub_1A9FA6+8j
						  ; sub_1A9FA6+12j ...
		tst.b	d0
		rts
; End of function sub_1A9FA6


; =============== S U B	R O U T	I N E =======================================


sub_1AA000:					  ; CODE XREF: ROM:001A9F88p
		btst	#$06,$00000038(a5)
		bne.s	loc_1AA044
		move.w	#$0050,d5
		move.w	#$0000,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA044
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0028,d7
		bhi.s	loc_1AA044
		move.b	#$21,$00000037(a5)
		move.w	#$001C,$00000034(a5)
		clr.b	$0000000D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA044:					  ; CODE XREF: sub_1AA000+6j
						  ; sub_1AA000+18j ...
		tst.b	d0
		rts
; End of function sub_1AA000


; =============== S U B	R O U T	I N E =======================================


sub_1AA048:					  ; CODE XREF: ROM:001A9F8Ep
		move.b	$0000002F(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1AA08E
		btst	#$06,$00000038(a5)
		beq.s	loc_1AA08E
		move.w	#$0050,d5
		move.w	#$0050,d6
		move.w	#$0050,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA08E
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		bclr	#$06,$00000038(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA08E:					  ; CODE XREF: sub_1AA048+8j
						  ; sub_1AA048+12j ...
		tst.b	d0
		rts
; End of function sub_1AA048


; =============== S U B	R O U T	I N E =======================================


sub_1AA092:					  ; CODE XREF: ROM:001A9F94p
		btst	#$06,$00000038(a5)
		bne.s	loc_1AA100
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA100
		move.b	$00000055(a5),d0
		subi.b	#$10,d0
		sub.b	(Player_HitBoxZEnd+1).l,d0
		cmpi.b	#$20,d0
		bcc.s	loc_1AA100
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000A,d7
		bhi.s	loc_1AA0EA
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA0EA:					  ; CODE XREF: sub_1AA092+3Cj
		move.b	#$24,$00000037(a5)
		move.w	#$001D,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA100:					  ; CODE XREF: sub_1AA092+6j
						  ; sub_1AA092+18j ...
		tst.b	d0
		rts
; End of function sub_1AA092

; ---------------------------------------------------------------------------

loc_1AA104:					  ; CODE XREF: ROM:001A9F24j
		andi.b	#$0F,d0
		beq.s	loc_1AA126
		cmpi.b	#$01,d0
		beq.w	loc_1AA1D0
		cmpi.b	#$02,d0
		beq.w	loc_1AA1D6
		cmpi.b	#$03,d0
		beq.w	loc_1AA27E
		bra.w	loc_1AA1D0
; ---------------------------------------------------------------------------

loc_1AA126:					  ; CODE XREF: ROM:001AA108j
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$01,$0000000D(a5)
		bne.s	loc_1AA140
		move.b	#$FF,$0000002D(a5)
		move.w	#$01C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA140:					  ; CODE XREF: ROM:001AA130j
		cmpi.b	#$07,$0000000D(a5)
		bne.s	loc_1AA156
		move.b	#$FF,$0000002D(a5)
		move.w	#$0180,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA156:					  ; CODE XREF: ROM:001AA146j
		cmpi.b	#$0E,$0000000D(a5)
		bne.s	loc_1AA16C
		move.b	#$FF,$0000002D(a5)
		move.w	#$0140,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA16C:					  ; CODE XREF: ROM:001AA15Cj
		cmpi.b	#$15,$0000000D(a5)
		bne.s	loc_1AA182
		move.b	#$FF,$0000002D(a5)
		move.w	#$0100,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA182:					  ; CODE XREF: ROM:001AA172j
		cmpi.b	#$1C,$0000000D(a5)
		bne.w	loc_1AA19A
		move.b	#$FF,$0000002D(a5)
		move.w	#$00C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA19A:					  ; CODE XREF: ROM:001AA188j
		cmpi.b	#$23,$0000000D(a5)
		bne.w	loc_1AA1B2
		move.b	#$FF,$0000002D(a5)
		move.w	#$0080,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA1B2:					  ; CODE XREF: ROM:001AA1A0j
		cmpi.b	#$2A,$0000000D(a5)
		bne.w	locret_1AA1CE
		move.b	#$FF,$0000002D(a5)
		move.w	#$0040,$0000002E(a5)
		move.b	#$10,$00000037(a5)

locret_1AA1CE:					  ; CODE XREF: ROM:001AA1B8j
		rts
; ---------------------------------------------------------------------------

loc_1AA1D0:					  ; CODE XREF: ROM:001AA10Ej
						  ; ROM:001AA122j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AA1D6:					  ; CODE XREF: ROM:001AA116j
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$01,$0000000D(a5)
		bne.s	loc_1AA1F0
		move.b	#$FF,$0000002D(a5)
		move.w	#$0040,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA1F0:					  ; CODE XREF: ROM:001AA1E0j
		cmpi.b	#$07,$0000000D(a5)
		bne.s	loc_1AA206
		move.b	#$FF,$0000002D(a5)
		move.w	#$0080,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA206:					  ; CODE XREF: ROM:001AA1F6j
		cmpi.b	#$0E,$0000000D(a5)
		bne.s	loc_1AA21C
		move.b	#$FF,$0000002D(a5)
		move.w	#$00C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA21C:					  ; CODE XREF: ROM:001AA20Cj
		cmpi.b	#$15,$0000000D(a5)
		bne.s	loc_1AA232
		move.b	#$FF,$0000002D(a5)
		move.w	#$0100,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA232:					  ; CODE XREF: ROM:001AA222j
		cmpi.b	#$1C,$0000000D(a5)
		bne.w	loc_1AA24A
		move.b	#$FF,$0000002D(a5)
		move.w	#$0140,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA24A:					  ; CODE XREF: ROM:001AA238j
		cmpi.b	#$23,$0000000D(a5)
		bne.w	loc_1AA262
		move.b	#$FF,$0000002D(a5)
		move.w	#$0180,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA262:					  ; CODE XREF: ROM:001AA250j
		cmpi.b	#$2A,$0000000D(a5)
		bne.w	locret_1AA27C
		move.b	#$FF,$0000002D(a5)
		move.w	#$01C0,$0000002E(a5)
		bra.w	loc_1A9F56
; ---------------------------------------------------------------------------

locret_1AA27C:					  ; CODE XREF: ROM:001AA268j
		rts
; ---------------------------------------------------------------------------

loc_1AA27E:					  ; CODE XREF: ROM:001AA11Ej
		move.w	#$0100,$0000002C(a5)
		move.w	$00000012(a5),d0
		move.w	$00000054(a5),d1
		movem.w	d0-d1,-(sp)
		move.w	(Player_HitBoxZEnd).l,d0
		addi.w	#$0011,d0
		move.w	d0,$00000054(a5)
		clr.w	d1
		move.b	$00000005(a5),d1
		sub.w	d1,d0
		addq.w	#$01,d0
		move.w	d0,$00000012(a5)
		jsr	(sub_3BC).l
		bcc.s	loc_1AA2C4
		movem.w	(sp)+,d0-d1
		move.w	d0,$00000012(a5)
		move.w	d1,$00000054(a5)
		bra.w	loc_1A9F56
; ---------------------------------------------------------------------------

loc_1AA2C4:					  ; CODE XREF: ROM:001AA2B2j
		movem.w	(sp)+,d0-d1
		tst.b	(byte_FF1145).l
		bne.w	loc_1A9F56
		tst.b	(byte_FF1142).l
		bne.s	loc_1AA2E2
		move.b	#$01,(byte_FF1142).l

loc_1AA2E2:					  ; CODE XREF: ROM:001AA2D8j
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1A9F56
		move.b	$0000000D(a5),d0
		addq.b	#$01,$0000000D(a5)
		tst.b	d0
		bne.s	loc_1AA32C
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Throw
; ---------------------------------------------------------------------------
		lea	(Player_X).l,a5
		move.w	#$0200,d0
		jsr	(j_j_RemoveHealth).l
		tst.w	CurrentHealth(a5)
		beq.s	loc_1AA33A

loc_1AA32C:					  ; CODE XREF: ROM:001AA310j
		cmpi.b	#$1E,d0
		bcs.w	locret_1AA338
		clr.b	$0000000D(a5)

locret_1AA338:					  ; CODE XREF: ROM:001AA330j
		rts
; ---------------------------------------------------------------------------

loc_1AA33A:					  ; CODE XREF: ROM:001AA32Aj
		bclr	#$06,$0000000C(a5)
		bra.w	loc_1A8AEC
; ---------------------------------------------------------------------------

EnemyAI_Mimic3_B:				  ; CODE XREF: ROM:001A8592j
		bra.s	loc_1AA38C
; ---------------------------------------------------------------------------

EnemyAI_Mimic3_A:				  ; CODE XREF: ROM:001A858Ej
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AA35E
		move.b	$00000037(a5),d0
		beq.s	loc_1AA364
		cmpi.b	#$10,d0
		beq.s	loc_1AA3AA
		bra.w	loc_1AA53A
; ---------------------------------------------------------------------------

loc_1AA35E:					  ; CODE XREF: ROM:001AA34Cj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AA364:					  ; CODE XREF: ROM:001AA352j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AA38C
		rts
; ---------------------------------------------------------------------------

loc_1AA38C:					  ; CODE XREF: ROM:EnemyAI_Mimic3_Bj
						  ; ROM:001AA388j ...
		bclr	#$06,$00000038(a5)
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA3AA:					  ; CODE XREF: ROM:001AA358j
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1AA3DC
		bcs.s	loc_1AA3CE
		bsr.w	sub_1AA436
		bcs.s	loc_1AA3CE
		bsr.w	sub_1AA47E
		bcs.s	loc_1AA3CE
		bsr.w	sub_1AA4C8

loc_1AA3CE:					  ; CODE XREF: ROM:001AA3BCj
						  ; ROM:001AA3C2j ...
		btst	#$06,$00000038(a5)
		bne.s	locret_1AA3DA
		bsr.w	LoadSpecialAI

locret_1AA3DA:					  ; CODE XREF: ROM:001AA3D4j
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1AA3DC:					  ; CODE XREF: ROM:001AA3BAp
		move.b	$0000002F(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1AA432
		btst	#$06,$00000038(a5)
		bne.s	loc_1AA432
		move.w	#$0080,d5
		move.w	#$0080,d6
		move.w	#$0080,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AA432
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0014,d7
		bhi.s	loc_1AA432
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		clr.b	$0000000D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bset	#$06,$00000038(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA432:					  ; CODE XREF: sub_1AA3DC+8j
						  ; sub_1AA3DC+12j ...
		tst.b	d0
		rts
; End of function sub_1AA3DC


; =============== S U B	R O U T	I N E =======================================


sub_1AA436:					  ; CODE XREF: ROM:001AA3BEp
		btst	#$06,$00000038(a5)
		bne.s	loc_1AA47A
		move.w	#$0050,d5
		move.w	#$0000,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA47A
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0050,d7
		bhi.s	loc_1AA47A
		move.b	#$21,$00000037(a5)
		move.w	#$001D,$00000034(a5)
		clr.b	$0000000D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA47A:					  ; CODE XREF: sub_1AA436+6j
						  ; sub_1AA436+18j ...
		tst.b	d0
		rts
; End of function sub_1AA436


; =============== S U B	R O U T	I N E =======================================


sub_1AA47E:					  ; CODE XREF: ROM:001AA3C4p
		move.b	$0000002F(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1AA4C4
		btst	#$06,$00000038(a5)
		beq.s	loc_1AA4C4
		move.w	#$0050,d5
		move.w	#$0050,d6
		move.w	#$0050,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA4C4
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		bclr	#$06,$00000038(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA4C4:					  ; CODE XREF: sub_1AA47E+8j
						  ; sub_1AA47E+12j ...
		tst.b	d0
		rts
; End of function sub_1AA47E


; =============== S U B	R O U T	I N E =======================================


sub_1AA4C8:					  ; CODE XREF: ROM:001AA3CAp
		btst	#$06,$00000038(a5)
		bne.s	loc_1AA536
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA536
		move.b	$00000055(a5),d0
		subi.b	#$10,d0
		sub.b	(Player_HitBoxZEnd+1).l,d0
		cmpi.b	#$20,d0
		bcc.s	loc_1AA536
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0005,d7
		bhi.s	loc_1AA520
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA520:					  ; CODE XREF: sub_1AA4C8+3Cj
		move.b	#$24,$00000037(a5)
		move.w	#$001E,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA536:					  ; CODE XREF: sub_1AA4C8+6j
						  ; sub_1AA4C8+18j ...
		tst.b	d0
		rts
; End of function sub_1AA4C8

; ---------------------------------------------------------------------------

loc_1AA53A:					  ; CODE XREF: ROM:001AA35Aj
		andi.b	#$0F,d0
		beq.s	loc_1AA55C
		cmpi.b	#$01,d0
		beq.w	loc_1AA606
		cmpi.b	#$02,d0
		beq.w	loc_1AA60C
		cmpi.b	#$03,d0
		beq.w	loc_1AA6B4
		bra.w	loc_1AA606
; ---------------------------------------------------------------------------

loc_1AA55C:					  ; CODE XREF: ROM:001AA53Ej
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$01,$0000000D(a5)
		bne.s	loc_1AA576
		move.b	#$FF,$0000002D(a5)
		move.w	#$01C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA576:					  ; CODE XREF: ROM:001AA566j
		cmpi.b	#$05,$0000000D(a5)
		bne.s	loc_1AA58C
		move.b	#$FF,$0000002D(a5)
		move.w	#$0180,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA58C:					  ; CODE XREF: ROM:001AA57Cj
		cmpi.b	#$0A,$0000000D(a5)
		bne.s	loc_1AA5A2
		move.b	#$FF,$0000002D(a5)
		move.w	#$0140,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA5A2:					  ; CODE XREF: ROM:001AA592j
		cmpi.b	#$0F,$0000000D(a5)
		bne.s	loc_1AA5B8
		move.b	#$FF,$0000002D(a5)
		move.w	#$0100,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA5B8:					  ; CODE XREF: ROM:001AA5A8j
		cmpi.b	#$14,$0000000D(a5)
		bne.w	loc_1AA5D0
		move.b	#$FF,$0000002D(a5)
		move.w	#$00C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA5D0:					  ; CODE XREF: ROM:001AA5BEj
		cmpi.b	#$19,$0000000D(a5)
		bne.w	loc_1AA5E8
		move.b	#$FF,$0000002D(a5)
		move.w	#$0080,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA5E8:					  ; CODE XREF: ROM:001AA5D6j
		cmpi.b	#$1E,$0000000D(a5)
		bne.w	locret_1AA604
		move.b	#$FF,$0000002D(a5)
		move.w	#$0040,$0000002E(a5)
		move.b	#$10,$00000037(a5)

locret_1AA604:					  ; CODE XREF: ROM:001AA5EEj
		rts
; ---------------------------------------------------------------------------

loc_1AA606:					  ; CODE XREF: ROM:001AA544j
						  ; ROM:001AA558j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AA60C:					  ; CODE XREF: ROM:001AA54Cj
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$01,$0000000D(a5)
		bne.s	loc_1AA626
		move.b	#$FF,$0000002D(a5)
		move.w	#$0040,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA626:					  ; CODE XREF: ROM:001AA616j
		cmpi.b	#$05,$0000000D(a5)
		bne.s	loc_1AA63C
		move.b	#$FF,$0000002D(a5)
		move.w	#$0080,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA63C:					  ; CODE XREF: ROM:001AA62Cj
		cmpi.b	#$0A,$0000000D(a5)
		bne.s	loc_1AA652
		move.b	#$FF,$0000002D(a5)
		move.w	#$00C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA652:					  ; CODE XREF: ROM:001AA642j
		cmpi.b	#$0F,$0000000D(a5)
		bne.s	loc_1AA668
		move.b	#$FF,$0000002D(a5)
		move.w	#$0100,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA668:					  ; CODE XREF: ROM:001AA658j
		cmpi.b	#$14,$0000000D(a5)
		bne.w	loc_1AA680
		move.b	#$FF,$0000002D(a5)
		move.w	#$0140,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA680:					  ; CODE XREF: ROM:001AA66Ej
		cmpi.b	#$19,$0000000D(a5)
		bne.w	loc_1AA698
		move.b	#$FF,$0000002D(a5)
		move.w	#$0180,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA698:					  ; CODE XREF: ROM:001AA686j
		cmpi.b	#$1E,$0000000D(a5)
		bne.w	locret_1AA6B2
		move.b	#$FF,$0000002D(a5)
		move.w	#$01C0,$0000002E(a5)
		bra.w	loc_1AA38C
; ---------------------------------------------------------------------------

locret_1AA6B2:					  ; CODE XREF: ROM:001AA69Ej
		rts
; ---------------------------------------------------------------------------

loc_1AA6B4:					  ; CODE XREF: ROM:001AA554j
		move.w	#$0100,$0000002C(a5)
		move.w	$00000012(a5),d0
		move.w	$00000054(a5),d1
		movem.w	d0-d1,-(sp)
		move.b	(Player_HitBoxZEnd).l,d0
		addi.w	#$0011,d0
		move.w	d0,$00000054(a5)
		clr.w	d1
		move.b	$00000005(a5),d1
		sub.w	d1,d0
		addq.w	#$01,d0
		move.w	d0,$00000012(a5)
		jsr	(sub_3BC).l
		bcc.s	loc_1AA6FA
		movem.w	(sp)+,d0-d1
		move.w	d0,$00000012(a5)
		move.w	d1,$00000054(a5)
		bra.w	loc_1AA38C
; ---------------------------------------------------------------------------

loc_1AA6FA:					  ; CODE XREF: ROM:001AA6E8j
		movem.w	(sp)+,d0-d1
		tst.b	(byte_FF1145).l
		bne.w	loc_1AA38C
		tst.b	(byte_FF1142).l
		bne.s	loc_1AA718
		move.b	#$01,(byte_FF1142).l

loc_1AA718:					  ; CODE XREF: ROM:001AA70Ej
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0010,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1AA38C
		move.b	$0000000D(a5),d0
		addq.b	#$01,$0000000D(a5)
		tst.b	d0
		bne.s	loc_1AA762
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Throw
; ---------------------------------------------------------------------------
		lea	(Player_X).l,a5
		move.w	#$0300,d0
		jsr	(j_j_RemoveHealth).l
		tst.w	$0000003E(a5)
		beq.s	loc_1AA770

loc_1AA762:					  ; CODE XREF: ROM:001AA746j
		cmpi.b	#$0A,d0
		bcs.w	locret_1AA76E
		clr.b	$0000000D(a5)

locret_1AA76E:					  ; CODE XREF: ROM:001AA766j
		rts
; ---------------------------------------------------------------------------

loc_1AA770:					  ; CODE XREF: ROM:001AA760j
		bclr	#$06,$0000000C(a5)
		bra.w	loc_1A8AEC
; ---------------------------------------------------------------------------

EnemyAI_Mushroom1_B:				  ; CODE XREF: ROM:001A859Aj
		bra.s	loc_1AA7C2
; ---------------------------------------------------------------------------

EnemyAI_Mushroom1_A:				  ; CODE XREF: ROM:001A8596j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AA794
		move.b	$00000037(a5),d0
		beq.s	loc_1AA79A
		cmpi.b	#$10,d0
		beq.s	loc_1AA7E0
		bra.w	loc_1AA9B6
; ---------------------------------------------------------------------------

loc_1AA794:					  ; CODE XREF: ROM:001AA782j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AA79A:					  ; CODE XREF: ROM:001AA788j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AA7C2
		rts
; ---------------------------------------------------------------------------

loc_1AA7C2:					  ; CODE XREF: ROM:EnemyAI_Mushroom1_Bj
						  ; ROM:001AA7BEj ...
		bclr	#$06,$00000038(a5)
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA7E0:					  ; CODE XREF: ROM:001AA78Ej
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1AA812
		bcs.s	loc_1AA804
		bsr.w	sub_1AA8C4
		bcs.s	loc_1AA804
		bsr.w	sub_1AA90C
		bcs.s	loc_1AA804
		bsr.w	sub_1AA954

loc_1AA804:					  ; CODE XREF: ROM:001AA7F2j
						  ; ROM:001AA7F8j ...
		btst	#$06,$00000038(a5)
		bne.s	locret_1AA810
		bsr.w	LoadSpecialAI

locret_1AA810:					  ; CODE XREF: ROM:001AA80Aj
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1AA812:					  ; CODE XREF: ROM:001AA7F0p
		move.b	$0000002F(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1AA8C0
		btst	#$06,$00000038(a5)
		bne.s	loc_1AA882
		move.w	#$0040,d5
		move.w	#$0040,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1AA8C0
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AA8C0
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0019,d7
		bhi.s	loc_1AA8C0
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		clr.b	$0000000D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bset	#$06,$00000038(a5)
		move.w	$00000012(a5),$00000054(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA882:					  ; CODE XREF: sub_1AA812+12j
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA8C0
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0019,d7
		bhi.s	loc_1AA8C0
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$1F,$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA8C0:					  ; CODE XREF: sub_1AA812+8j
						  ; sub_1AA812+24j ...
		tst.b	d0
		rts
; End of function sub_1AA812


; =============== S U B	R O U T	I N E =======================================


sub_1AA8C4:					  ; CODE XREF: ROM:001AA7F4p
		btst	#$06,$00000038(a5)
		bne.s	loc_1AA908
		move.w	#$0038,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA908
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0019,d7
		bhi.s	loc_1AA908
		move.b	#$21,$00000037(a5)
		move.w	#$0013,$00000034(a5)
		clr.b	$0000000D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA908:					  ; CODE XREF: sub_1AA8C4+6j
						  ; sub_1AA8C4+18j ...
		tst.b	d0
		rts
; End of function sub_1AA8C4


; =============== S U B	R O U T	I N E =======================================


sub_1AA90C:					  ; CODE XREF: ROM:001AA7FAp
		btst	#$06,$00000038(a5)
		bne.s	loc_1AA950
		move.w	#$0020,d5
		move.w	#$FFE8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA950
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bhi.s	loc_1AA950
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA950:					  ; CODE XREF: sub_1AA90C+6j
						  ; sub_1AA90C+18j ...
		tst.b	d0
		rts
; End of function sub_1AA90C


; =============== S U B	R O U T	I N E =======================================


sub_1AA954:					  ; CODE XREF: ROM:001AA800p
		btst	#$06,$00000038(a5)
		bne.s	loc_1AA9B2
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AA9B2
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bcc.s	loc_1AA998
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA998:					  ; CODE XREF: sub_1AA954+28j
		move.b	#$24,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AA9B2:					  ; CODE XREF: sub_1AA954+6j
						  ; sub_1AA954+18j
		tst.b	d0
		rts
; End of function sub_1AA954

; ---------------------------------------------------------------------------

loc_1AA9B6:					  ; CODE XREF: ROM:001AA790j
		andi.b	#$0F,d0
		beq.s	loc_1AA9D8
		cmpi.b	#$01,d0
		beq.w	loc_1AAAA2
		cmpi.b	#$02,d0
		beq.w	loc_1AAAA8
		cmpi.b	#$03,d0
		beq.w	loc_1AAAE4
		bra.w	loc_1AAAA2
; ---------------------------------------------------------------------------

loc_1AA9D8:					  ; CODE XREF: ROM:001AA9BAj
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$01,$0000000D(a5)
		bne.s	loc_1AA9F2
		move.b	#$FF,$0000002D(a5)
		move.w	#$0040,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AA9F2:					  ; CODE XREF: ROM:001AA9E2j
		cmpi.b	#$08,$0000000D(a5)
		bne.s	loc_1AAA08
		move.b	#$FF,$0000002D(a5)
		move.w	#$0080,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAA08:					  ; CODE XREF: ROM:001AA9F8j
		cmpi.b	#$10,$0000000D(a5)
		bne.s	loc_1AAA1E
		move.b	#$FF,$0000002D(a5)
		move.w	#$00C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAA1E:					  ; CODE XREF: ROM:001AAA0Ej
		cmpi.b	#$18,$0000000D(a5)
		bne.s	loc_1AAA3A
		move.b	#$FF,$0000002D(a5)
		move.w	#$0100,$0000002E(a5)
		move.b	#$10,$00000037(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAA3A:					  ; CODE XREF: ROM:001AAA24j
		cmpi.b	#$20,$0000000D(a5)
		bne.w	loc_1AAA72
		clr.w	d0
		move.b	#$20,d0
		subq.b	#$01,d0
		add.w	d0,$00000054(a5)
		jsr	(sub_3BC).l
		bcc.s	loc_1AAA64
		move.w	$00000012(a5),$00000054(a5)
		subq.b	#$01,$0000000D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAA64:					  ; CODE XREF: ROM:001AAA56j
		move.b	#$FF,$0000002D(a5)
		move.w	#$00C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAA72:					  ; CODE XREF: ROM:001AAA40j
		cmpi.b	#$28,$0000000D(a5)
		bne.s	loc_1AAA88
		move.b	#$FF,$0000002D(a5)
		move.w	#$0080,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAA88:					  ; CODE XREF: ROM:001AAA78j
		cmpi.b	#$30,$0000000D(a5)
		bne.s	locret_1AAAA0
		move.w	#$0040,$0000002E(a5)
		bclr	#$06,$00000038(a5)
		bra.w	loc_1AA7C2
; ---------------------------------------------------------------------------

locret_1AAAA0:					  ; CODE XREF: ROM:001AAA8Ej
		rts
; ---------------------------------------------------------------------------

loc_1AAAA2:					  ; CODE XREF: ROM:001AA9C0j
						  ; ROM:001AA9D4j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AAAA8:					  ; CODE XREF: ROM:001AA9C8j
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$01,$0000000D(a5)
		bne.s	loc_1AAAC4
		move.w	#$0049,d1
		move.w	#$0049,d2
		move.w	#$0049,d3
		bsr.w	sub_1A880C

loc_1AAAC4:					  ; CODE XREF: ROM:001AAAB2j
		move.b	$0000000D(a5),d0
		andi.w	#$0004,d0
		lsl.w	#$06,d0
		addi.w	#$0300,d0
		move.w	d0,$0000002C(a5)
		cmpi.b	#$20,$0000000D(a5)
		bcs.s	locret_1AAAE2
		bra.w	loc_1AA7C2
; ---------------------------------------------------------------------------

locret_1AAAE2:					  ; CODE XREF: ROM:001AAADCj
		rts
; ---------------------------------------------------------------------------

loc_1AAAE4:					  ; CODE XREF: ROM:001AA9D0j
		addq.b	#$01,$0000000D(a5)
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.b	$0000000D(a5),d0
		andi.w	#$0004,d0
		lsl.w	#$06,d0
		addi.w	#$0100,d0
		move.w	d0,$0000002C(a5)
		cmpi.b	#$20,$0000000D(a5)
		bcs.s	locret_1AAB16
		bra.w	loc_1AA7C2
; ---------------------------------------------------------------------------

locret_1AAB16:					  ; CODE XREF: ROM:001AAB10j
		rts
; ---------------------------------------------------------------------------

EnemyAI_Mushroom2_B:				  ; CODE XREF: ROM:001A85A2j
		bra.s	loc_1AAB60
; ---------------------------------------------------------------------------

EnemyAI_Mushroom2_A:				  ; CODE XREF: ROM:001A859Ej
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AAB32
		move.b	$00000037(a5),d0
		beq.s	loc_1AAB38
		cmpi.b	#$10,d0
		beq.s	loc_1AAB7E
		bra.w	loc_1AAD42
; ---------------------------------------------------------------------------

loc_1AAB32:					  ; CODE XREF: ROM:001AAB20j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AAB38:					  ; CODE XREF: ROM:001AAB26j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AAB60
		rts
; ---------------------------------------------------------------------------

loc_1AAB60:					  ; CODE XREF: ROM:EnemyAI_Mushroom2_Bj
						  ; ROM:001AAB5Cj ...
		bclr	#$06,$00000038(a5)
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAB7E:					  ; CODE XREF: ROM:001AAB2Cj
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1AABB0
		bcs.s	loc_1AABA2
		bsr.w	sub_1AAC50
		bcs.s	loc_1AABA2
		bsr.w	sub_1AAC98
		bcs.s	loc_1AABA2
		bsr.w	sub_1AACE0

loc_1AABA2:					  ; CODE XREF: ROM:001AAB90j
						  ; ROM:001AAB96j ...
		btst	#$06,$00000038(a5)
		bne.s	locret_1AABAE
		bsr.w	LoadSpecialAI

locret_1AABAE:					  ; CODE XREF: ROM:001AABA8j
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1AABB0:					  ; CODE XREF: ROM:001AAB8Ep
		move.b	$0000002D(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1AAC4C
		btst	#$06,$00000038(a5)
		bne.s	loc_1AAC0E
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1AAC4C
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1AAC4C
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		clr.b	$0000000D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bset	#$06,$00000038(a5)
		move.w	$00000012(a5),$00000054(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AAC0E:					  ; CODE XREF: sub_1AABB0+12j
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AAC4C
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1AAC4C
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$1F,$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AAC4C:					  ; CODE XREF: sub_1AABB0+8j
						  ; sub_1AABB0+24j ...
		tst.b	d0
		rts
; End of function sub_1AABB0


; =============== S U B	R O U T	I N E =======================================


sub_1AAC50:					  ; CODE XREF: ROM:001AAB92p
		btst	#$06,$00000038(a5)
		bne.s	loc_1AAC94
		move.w	#$0038,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AAC94
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1AAC94
		move.b	#$21,$00000037(a5)
		move.w	#$0013,$00000034(a5)
		clr.b	$0000000D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AAC94:					  ; CODE XREF: sub_1AAC50+6j
						  ; sub_1AAC50+18j ...
		tst.b	d0
		rts
; End of function sub_1AAC50


; =============== S U B	R O U T	I N E =======================================


sub_1AAC98:					  ; CODE XREF: ROM:001AAB98p
		btst	#$06,$00000038(a5)
		bne.s	loc_1AACDC
		move.w	#$0020,d5
		move.w	#$FFE8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AACDC
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$003E,d7
		bhi.s	loc_1AACDC
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AACDC:					  ; CODE XREF: sub_1AAC98+6j
						  ; sub_1AAC98+18j ...
		tst.b	d0
		rts
; End of function sub_1AAC98


; =============== S U B	R O U T	I N E =======================================


sub_1AACE0:					  ; CODE XREF: ROM:001AAB9Ep
		btst	#$06,$00000038(a5)
		bne.s	loc_1AAD3E
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AAD3E
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$003C,d7
		bcc.s	loc_1AAD24
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AAD24:					  ; CODE XREF: sub_1AACE0+28j
		move.b	#$24,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AAD3E:					  ; CODE XREF: sub_1AACE0+6j
						  ; sub_1AACE0+18j
		tst.b	d0
		rts
; End of function sub_1AACE0

; ---------------------------------------------------------------------------

loc_1AAD42:					  ; CODE XREF: ROM:001AAB2Ej
		andi.b	#$0F,d0
		beq.s	loc_1AAD64
		cmpi.b	#$01,d0
		beq.w	loc_1AAE2C
		cmpi.b	#$02,d0
		beq.w	loc_1AAE32
		cmpi.b	#$03,d0
		beq.w	loc_1AAE84
		bra.w	loc_1AAE2C
; ---------------------------------------------------------------------------

loc_1AAD64:					  ; CODE XREF: ROM:001AAD46j
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$01,$0000000D(a5)
		bne.s	loc_1AAD7E
		move.b	#$FF,$0000002D(a5)
		move.w	#$0040,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAD7E:					  ; CODE XREF: ROM:001AAD6Ej
		cmpi.b	#$08,$0000000D(a5)
		bne.s	loc_1AAD94
		move.b	#$FF,$0000002D(a5)
		move.w	#$0080,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAD94:					  ; CODE XREF: ROM:001AAD84j
		cmpi.b	#$10,$0000000D(a5)
		bne.s	loc_1AADAA
		move.b	#$FF,$0000002D(a5)
		move.w	#$00C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AADAA:					  ; CODE XREF: ROM:001AAD9Aj
		cmpi.b	#$18,$0000000D(a5)
		bne.s	loc_1AADC0
		move.b	#$FF,$0000002D(a5)
		move.w	#$0100,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AADC0:					  ; CODE XREF: ROM:001AADB0j
		cmpi.b	#$20,$0000000D(a5)
		bne.s	loc_1AADF6
		clr.w	d0
		move.b	#$20,d0
		subq.b	#$01,d0
		add.w	d0,$00000054(a5)
		jsr	(sub_3BC).l
		bcc.s	loc_1AADE8
		move.w	$00000012(a5),$00000054(a5)
		subq.b	#$01,$0000000D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AADE8:					  ; CODE XREF: ROM:001AADDAj
		move.b	#$FF,$0000002D(a5)
		move.w	#$00C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AADF6:					  ; CODE XREF: ROM:001AADC6j
		cmpi.b	#$28,$0000000D(a5)
		bne.s	loc_1AAE0C
		move.b	#$FF,$0000002D(a5)
		move.w	#$0080,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAE0C:					  ; CODE XREF: ROM:001AADFCj
		cmpi.b	#$30,$0000000D(a5)
		bne.s	locret_1AAE2A
		move.b	#$FF,$0000002D(a5)
		move.w	#$0040,$0000002E(a5)
		bclr	#$06,$00000038(a5)
		bra.w	loc_1AAB60
; ---------------------------------------------------------------------------

locret_1AAE2A:					  ; CODE XREF: ROM:001AAE12j
		rts
; ---------------------------------------------------------------------------

loc_1AAE2C:					  ; CODE XREF: ROM:001AAD4Cj
						  ; ROM:001AAD60j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AAE32:					  ; CODE XREF: ROM:001AAD54j
		addq.b	#$01,$0000000D(a5)
		move.b	$0000000D(a5),d0
		andi.w	#$0004,d0
		lsl.w	#$06,d0
		addi.w	#$0300,d0
		move.w	d0,$0000002C(a5)
		cmpi.b	#$20,$0000000D(a5)
		bcs.w	locret_1AAE82
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		move.b	#STATUS_POISON,d0
		cmpi.b	#$28,d7
		bcs.s	loc_1AAE7A
		move.w	#$0049,d1
		move.w	#$0049,d2
		move.w	#$0049,d3
		bsr.w	sub_1A880C
		bra.w	loc_1AAB60
; ---------------------------------------------------------------------------

loc_1AAE7A:					  ; CODE XREF: ROM:001AAE64j
		bsr.w	j_j_AddStatusEffect
		bra.w	loc_1AAB60
; ---------------------------------------------------------------------------

locret_1AAE82:					  ; CODE XREF: ROM:001AAE4Ej
		rts
; ---------------------------------------------------------------------------

loc_1AAE84:					  ; CODE XREF: ROM:001AAD5Cj
		addq.b	#$01,$0000000D(a5)
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.b	$0000000D(a5),d0
		andi.w	#$0004,d0
		lsl.w	#$06,d0
		addi.w	#$0100,d0
		move.w	d0,$0000002C(a5)
		cmpi.b	#$20,$0000000D(a5)
		bcs.s	locret_1AAEB6
		bra.w	loc_1AAB60
; ---------------------------------------------------------------------------

locret_1AAEB6:					  ; CODE XREF: ROM:001AAEB0j
		rts
; ---------------------------------------------------------------------------

EnemyAI_Mushroom3_B:				  ; CODE XREF: ROM:001A85AAj
		bra.s	loc_1AAF00
; ---------------------------------------------------------------------------

EnemyAI_Mushroom3_A:				  ; CODE XREF: ROM:001A85A6j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AAED2
		move.b	$00000037(a5),d0
		beq.s	loc_1AAED8
		cmpi.b	#$10,d0
		beq.s	loc_1AAF1E
		bra.w	loc_1AB0E2
; ---------------------------------------------------------------------------

loc_1AAED2:					  ; CODE XREF: ROM:001AAEC0j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AAED8:					  ; CODE XREF: ROM:001AAEC6j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AAF00
		rts
; ---------------------------------------------------------------------------

loc_1AAF00:					  ; CODE XREF: ROM:EnemyAI_Mushroom3_Bj
						  ; ROM:001AAEFCj ...
		bclr	#$06,$00000038(a5)
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AAF1E:					  ; CODE XREF: ROM:001AAECCj
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1AAF50
		bcs.s	loc_1AAF42
		bsr.w	sub_1AAFF0
		bcs.s	loc_1AAF42
		bsr.w	sub_1AB038
		bcs.s	loc_1AAF42
		bsr.w	sub_1AB080

loc_1AAF42:					  ; CODE XREF: ROM:001AAF30j
						  ; ROM:001AAF36j ...
		btst	#$06,$00000038(a5)
		bne.s	locret_1AAF4E
		bsr.w	LoadSpecialAI

locret_1AAF4E:					  ; CODE XREF: ROM:001AAF48j
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1AAF50:					  ; CODE XREF: ROM:001AAF2Ep
		move.b	$0000002F(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1AAFEC
		btst	#$06,$00000038(a5)
		bne.s	loc_1AAFAE
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1AAFEC
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0025,d7
		bhi.s	loc_1AAFEC
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		clr.b	$0000000D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bset	#$06,$00000038(a5)
		move.w	$00000012(a5),$00000054(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AAFAE:					  ; CODE XREF: sub_1AAF50+12j
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AAFEC
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0025,d7
		bhi.s	loc_1AAFEC
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$1F,$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AAFEC:					  ; CODE XREF: sub_1AAF50+8j
						  ; sub_1AAF50+24j ...
		tst.b	d0
		rts
; End of function sub_1AAF50


; =============== S U B	R O U T	I N E =======================================


sub_1AAFF0:					  ; CODE XREF: ROM:001AAF32p
		btst	#$06,$00000038(a5)
		bne.s	loc_1AB034
		move.w	#$0038,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB034
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1AB034
		move.b	#$21,$00000037(a5)
		move.w	#$0013,$00000034(a5)
		clr.b	$0000000D(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB034:					  ; CODE XREF: sub_1AAFF0+6j
						  ; sub_1AAFF0+18j ...
		tst.b	d0
		rts
; End of function sub_1AAFF0


; =============== S U B	R O U T	I N E =======================================


sub_1AB038:					  ; CODE XREF: ROM:001AAF38p
		btst	#$06,$00000038(a5)
		bne.s	loc_1AB07C
		move.w	#$0020,d5
		move.w	#$FFE8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB07C
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0057,d7
		bhi.s	loc_1AB07C
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB07C:					  ; CODE XREF: sub_1AB038+6j
						  ; sub_1AB038+18j ...
		tst.b	d0
		rts
; End of function sub_1AB038


; =============== S U B	R O U T	I N E =======================================


sub_1AB080:					  ; CODE XREF: ROM:001AAF3Ep
		btst	#$06,$00000038(a5)
		bne.s	loc_1AB0DE
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB0DE
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0046,d7
		bcc.s	loc_1AB0C4
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB0C4:					  ; CODE XREF: sub_1AB080+28j
		move.b	#$24,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB0DE:					  ; CODE XREF: sub_1AB080+6j
						  ; sub_1AB080+18j
		tst.b	d0
		rts
; End of function sub_1AB080

; ---------------------------------------------------------------------------

loc_1AB0E2:					  ; CODE XREF: ROM:001AAECEj
		andi.b	#$0F,d0
		beq.s	loc_1AB104
		cmpi.b	#$01,d0
		beq.w	loc_1AB1CC
		cmpi.b	#$02,d0
		beq.w	loc_1AB1D2
		cmpi.b	#$03,d0
		beq.w	loc_1AB22E
		bra.w	loc_1AB1CC
; ---------------------------------------------------------------------------

loc_1AB104:					  ; CODE XREF: ROM:001AB0E6j
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$01,$0000000D(a5)
		bne.s	loc_1AB11E
		move.b	#$FF,$0000002D(a5)
		move.w	#$0040,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AB11E:					  ; CODE XREF: ROM:001AB10Ej
		cmpi.b	#$08,$0000000D(a5)
		bne.s	loc_1AB134
		move.b	#$FF,$0000002D(a5)
		move.w	#$0080,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AB134:					  ; CODE XREF: ROM:001AB124j
		cmpi.b	#$10,$0000000D(a5)
		bne.s	loc_1AB14A
		move.b	#$FF,$0000002D(a5)
		move.w	#$00C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AB14A:					  ; CODE XREF: ROM:001AB13Aj
		cmpi.b	#$18,$0000000D(a5)
		bne.s	loc_1AB160
		move.b	#$FF,$0000002D(a5)
		move.w	#$0100,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AB160:					  ; CODE XREF: ROM:001AB150j
		cmpi.b	#$20,$0000000D(a5)
		bne.s	loc_1AB196
		clr.w	d0
		move.b	#$20,d0
		subq.b	#$01,d0
		add.w	d0,$00000054(a5)
		jsr	(sub_3BC).l
		bcc.s	loc_1AB188
		move.w	$00000012(a5),$00000054(a5)
		subq.b	#$01,$0000000D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AB188:					  ; CODE XREF: ROM:001AB17Aj
		move.b	#$FF,$0000002D(a5)
		move.w	#$00C0,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AB196:					  ; CODE XREF: ROM:001AB166j
		cmpi.b	#$28,$0000000D(a5)
		bne.s	loc_1AB1AC
		move.b	#$FF,$0000002D(a5)
		move.w	#$0080,$0000002E(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AB1AC:					  ; CODE XREF: ROM:001AB19Cj
		cmpi.b	#$30,$0000000D(a5)
		bne.s	locret_1AB1CA
		move.b	#$FF,$0000002D(a5)
		move.w	#$0040,$0000002E(a5)
		bclr	#$06,$00000038(a5)
		bra.w	loc_1AAF00
; ---------------------------------------------------------------------------

locret_1AB1CA:					  ; CODE XREF: ROM:001AB1B2j
		rts
; ---------------------------------------------------------------------------

loc_1AB1CC:					  ; CODE XREF: ROM:001AB0ECj
						  ; ROM:001AB100j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AB1D2:					  ; CODE XREF: ROM:001AB0F4j
		addq.b	#$01,$0000000D(a5)
		move.b	$0000000D(a5),d0
		andi.w	#$0004,d0
		lsl.w	#$06,d0
		addi.w	#$0300,d0
		move.w	d0,$0000002C(a5)
		cmpi.b	#$20,$0000000D(a5)
		bcs.s	locret_1AB22C
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		move.b	#STATUS_POISON,d0
		cmpi.b	#030,d7
		bcs.s	loc_1AB224
		move.b	#STATUS_PARALYSIS,d0
		cmpi.b	#050,d7
		bcs.s	loc_1AB224
		move.b	#STATUS_CONFUSION,d0
		cmpi.b	#065,d7
		bcs.s	loc_1AB224
		move.b	#STATUS_CURSE,d0
		cmpi.b	#070,d7
		bcc.w	loc_1AAF00

loc_1AB224:					  ; CODE XREF: ROM:001AB202j
						  ; ROM:001AB20Cj ...
		bsr.w	j_j_AddStatusEffect
		bra.w	loc_1AAF00
; ---------------------------------------------------------------------------

locret_1AB22C:					  ; CODE XREF: ROM:001AB1EEj
		rts
; ---------------------------------------------------------------------------

loc_1AB22E:					  ; CODE XREF: ROM:001AB0FCj
		addq.b	#$01,$0000000D(a5)
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.b	$0000000D(a5),d0
		andi.w	#$0004,d0
		lsl.w	#$06,d0
		addi.w	#$0100,d0
		move.w	d0,$0000002C(a5)
		cmpi.b	#$20,$0000000D(a5)
		bcs.s	locret_1AB260
		bra.w	loc_1AAF00
; ---------------------------------------------------------------------------

locret_1AB260:					  ; CODE XREF: ROM:001AB25Aj
		rts
; ---------------------------------------------------------------------------

EnemyAI_Giant1_B:				  ; CODE XREF: ROM:001A85B2j
		bra.s	loc_1AB2AA
; ---------------------------------------------------------------------------

EnemyAI_Giant1_A:				  ; CODE XREF: ROM:001A85AEj
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AB27C
		move.b	$00000037(a5),d0
		beq.s	loc_1AB282
		cmpi.b	#$10,d0
		beq.s	loc_1AB2AE
		bra.w	loc_1AB3F0
; ---------------------------------------------------------------------------

loc_1AB27C:					  ; CODE XREF: ROM:001AB26Aj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AB282:					  ; CODE XREF: ROM:001AB270j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AB2AA
		rts
; ---------------------------------------------------------------------------

loc_1AB2AA:					  ; CODE XREF: ROM:EnemyAI_Giant1_Bj
						  ; ROM:001AB2A6j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AB2AE:					  ; CODE XREF: ROM:001AB276j
		tst.b	(byte_FF1142).l
		bne.s	loc_1AB2DE
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1AB2E2
		bcs.s	loc_1AB2D8
		bsr.s	sub_1AB31E
		bcs.s	loc_1AB2D8
		bsr.w	sub_1AB35A
		bcs.s	loc_1AB2D8
		bsr.w	sub_1AB396

loc_1AB2D8:					  ; CODE XREF: ROM:001AB2C8j
						  ; ROM:001AB2CCj ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AB2DE:					  ; CODE XREF: ROM:001AB2B4j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AB2E2:					  ; CODE XREF: ROM:001AB2C6p
		move.w	#$0050,d5
		move.w	#$FFB8,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB31A
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0019,d7
		bhi.s	loc_1AB31A
		move.b	#$20,$00000037(a5)
		move.w	#$0013,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB31A:					  ; CODE XREF: sub_1AB2E2+10j
						  ; sub_1AB2E2+20j
		tst.b	d0
		rts
; End of function sub_1AB2E2


; =============== S U B	R O U T	I N E =======================================


sub_1AB31E:					  ; CODE XREF: ROM:001AB2CAp
		move.w	#$0058,d5
		move.w	#$FFC0,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB356
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0008,d7
		bhi.s	loc_1AB356
		move.b	#$21,$00000037(a5)
		move.w	#$000E,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB356:					  ; CODE XREF: sub_1AB31E+10j
						  ; sub_1AB31E+20j
		tst.b	d0
		rts
; End of function sub_1AB31E


; =============== S U B	R O U T	I N E =======================================


sub_1AB35A:					  ; CODE XREF: ROM:001AB2CEp
		move.w	#$0038,d5
		move.w	#$FFE0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB392
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0004,d7
		bhi.s	loc_1AB392
		move.b	#$22,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB392:					  ; CODE XREF: sub_1AB35A+10j
						  ; sub_1AB35A+20j
		tst.b	d0
		rts
; End of function sub_1AB35A


; =============== S U B	R O U T	I N E =======================================


sub_1AB396:					  ; CODE XREF: ROM:001AB2D4p
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB3EC
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0046,d7
		bcc.s	loc_1AB3D2
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB3D2:					  ; CODE XREF: sub_1AB396+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB3EC:					  ; CODE XREF: sub_1AB396+10j
		tst.b	d0
		rts
; End of function sub_1AB396

; ---------------------------------------------------------------------------

loc_1AB3F0:					  ; CODE XREF: ROM:001AB278j
		andi.b	#$0F,d0
		beq.s	loc_1AB40C
		cmpi.b	#$01,d0
		beq.s	loc_1AB418
		cmpi.b	#$02,d0
		beq.s	loc_1AB42A
		cmpi.b	#$03,d0
		beq.s	loc_1AB42A
		bra.w	loc_1AB464
; ---------------------------------------------------------------------------

loc_1AB40C:					  ; CODE XREF: ROM:001AB3F4j
		move.w	#$0100,$0000002C(a5)
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AB418:					  ; CODE XREF: ROM:001AB3FAj
		move.b	$0000002D(a5),d0
		andi.b	#$30,d0
		beq.w	loc_1AB2AA
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AB42A:					  ; CODE XREF: ROM:001AB400j
						  ; ROM:001AB406j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1AB45E
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	loc_1AB45E
		bra.w	loc_1AB2AA
; ---------------------------------------------------------------------------

loc_1AB45E:					  ; CODE XREF: ROM:001AB43Aj
						  ; ROM:001AB458j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AB464:					  ; CODE XREF: ROM:001AB408j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1AB498
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$2D,$0000000D(a5)
		bcs.s	locret_1AB498
		bra.w	loc_1AB2AA
; ---------------------------------------------------------------------------

locret_1AB498:					  ; CODE XREF: ROM:001AB474j
						  ; ROM:001AB492j
		rts
; ---------------------------------------------------------------------------

EnemyAI_Giant2_B:				  ; CODE XREF: ROM:001A85BAj
		bra.s	loc_1AB4E2
; ---------------------------------------------------------------------------

EnemyAI_Giant2_A:				  ; CODE XREF: ROM:001A85B6j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AB4B4
		move.b	$00000037(a5),d0
		beq.s	loc_1AB4BA
		cmpi.b	#$10,d0
		beq.s	loc_1AB4E6
		bra.w	loc_1AB628
; ---------------------------------------------------------------------------

loc_1AB4B4:					  ; CODE XREF: ROM:001AB4A2j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AB4BA:					  ; CODE XREF: ROM:001AB4A8j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AB4E2
		rts
; ---------------------------------------------------------------------------

loc_1AB4E2:					  ; CODE XREF: ROM:EnemyAI_Giant2_Bj
						  ; ROM:001AB4DEj ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AB4E6:					  ; CODE XREF: ROM:001AB4AEj
		tst.b	(byte_FF1142).l
		bne.s	loc_1AB516
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1AB51A
		bcs.s	loc_1AB510
		bsr.s	sub_1AB556
		bcs.s	loc_1AB510
		bsr.w	sub_1AB592
		bcs.s	loc_1AB510
		bsr.w	sub_1AB5CE

loc_1AB510:					  ; CODE XREF: ROM:001AB500j
						  ; ROM:001AB504j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AB516:					  ; CODE XREF: ROM:001AB4ECj
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AB51A:					  ; CODE XREF: ROM:001AB4FEp
		move.w	#$0060,d5
		move.w	#$FFB8,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB552
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0008,d7
		bhi.s	loc_1AB552
		move.b	#$20,$00000037(a5)
		move.w	#$0014,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB552:					  ; CODE XREF: sub_1AB51A+10j
						  ; sub_1AB51A+20j
		tst.b	d0
		rts
; End of function sub_1AB51A


; =============== S U B	R O U T	I N E =======================================


sub_1AB556:					  ; CODE XREF: ROM:001AB502p
		move.w	#$0058,d5
		move.w	#$FFC0,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB58E
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1AB58E
		move.b	#$21,$00000037(a5)
		move.w	#$000E,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB58E:					  ; CODE XREF: sub_1AB556+10j
						  ; sub_1AB556+20j
		tst.b	d0
		rts
; End of function sub_1AB556


; =============== S U B	R O U T	I N E =======================================


sub_1AB592:					  ; CODE XREF: ROM:001AB506p
		move.w	#$0038,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB5CA
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0003,d7
		bhi.s	loc_1AB5CA
		move.b	#$22,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB5CA:					  ; CODE XREF: sub_1AB592+10j
						  ; sub_1AB592+20j
		tst.b	d0
		rts
; End of function sub_1AB592


; =============== S U B	R O U T	I N E =======================================


sub_1AB5CE:					  ; CODE XREF: ROM:001AB50Cp
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB624
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0028,d7
		bcc.s	loc_1AB60A
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB60A:					  ; CODE XREF: sub_1AB5CE+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB624:					  ; CODE XREF: sub_1AB5CE+10j
		tst.b	d0
		rts
; End of function sub_1AB5CE

; ---------------------------------------------------------------------------

loc_1AB628:					  ; CODE XREF: ROM:001AB4B0j
		andi.b	#$0F,d0
		beq.s	loc_1AB644
		cmpi.b	#$01,d0
		beq.s	loc_1AB64A
		cmpi.b	#$02,d0
		beq.s	loc_1AB65C
		cmpi.b	#$03,d0
		beq.s	loc_1AB696
		bra.w	loc_1AB6CC
; ---------------------------------------------------------------------------

loc_1AB644:					  ; CODE XREF: ROM:001AB62Cj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AB64A:					  ; CODE XREF: ROM:001AB632j
		move.b	$0000002D(a5),d0
		andi.b	#$30,d0
		beq.w	loc_1AB4E2
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AB65C:					  ; CODE XREF: ROM:001AB638j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1AB690
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	loc_1AB690
		bra.w	loc_1AB4E2
; ---------------------------------------------------------------------------

loc_1AB690:					  ; CODE XREF: ROM:001AB66Cj
						  ; ROM:001AB68Aj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AB696:					  ; CODE XREF: ROM:001AB63Ej
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1AB6CA
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$2D,$0000000D(a5)
		bcs.s	locret_1AB6CA
		bra.w	loc_1AB4E2
; ---------------------------------------------------------------------------

locret_1AB6CA:					  ; CODE XREF: ROM:001AB6A6j
						  ; ROM:001AB6C4j
		rts
; ---------------------------------------------------------------------------

loc_1AB6CC:					  ; CODE XREF: ROM:001AB640j
		addq.b	#$01,$0000000D(a5)
		move.b	$0000000D(a5),d0
		andi.w	#$0008,d0
		lsl.w	#$05,d0
		addi.w	#$0100,d0
		move.w	d0,$0000002C(a5)
		cmpi.w	#$0100,d0
		beq.s	loc_1AB6F8
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C

loc_1AB6F8:					  ; CODE XREF: ROM:001AB6E6j
		cmpi.b	#$60,$0000000D(a5)
		bcc.w	loc_1AB4E2
		rts
; ---------------------------------------------------------------------------

EnemyAI_Giant3_B:				  ; CODE XREF: ROM:001A85C2j
		bra.s	loc_1AB74C
; ---------------------------------------------------------------------------

EnemyAI_Giant3_A:				  ; CODE XREF: ROM:001A85BEj
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AB71E
		move.b	$00000037(a5),d0
		beq.s	loc_1AB724
		cmpi.b	#$10,d0
		beq.s	loc_1AB750
		bra.w	loc_1AB892
; ---------------------------------------------------------------------------

loc_1AB71E:					  ; CODE XREF: ROM:001AB70Cj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AB724:					  ; CODE XREF: ROM:001AB712j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AB74C
		rts
; ---------------------------------------------------------------------------

loc_1AB74C:					  ; CODE XREF: ROM:EnemyAI_Giant3_Bj
						  ; ROM:001AB748j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AB750:					  ; CODE XREF: ROM:001AB718j
		tst.b	(byte_FF1142).l
		bne.s	loc_1AB780
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1AB784
		bcs.s	loc_1AB77A
		bsr.s	sub_1AB7C0
		bcs.s	loc_1AB77A
		bsr.w	sub_1AB7FC
		bcs.s	loc_1AB77A
		bsr.w	sub_1AB838

loc_1AB77A:					  ; CODE XREF: ROM:001AB76Aj
						  ; ROM:001AB76Ej ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AB780:					  ; CODE XREF: ROM:001AB756j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AB784:					  ; CODE XREF: ROM:001AB768p
		move.w	#$0058,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB7BC
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0008,d7
		bhi.s	loc_1AB7BC
		move.b	#$20,$00000037(a5)
		move.w	#$001F,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB7BC:					  ; CODE XREF: sub_1AB784+10j
						  ; sub_1AB784+20j
		tst.b	d0
		rts
; End of function sub_1AB784


; =============== S U B	R O U T	I N E =======================================


sub_1AB7C0:					  ; CODE XREF: ROM:001AB76Cp
		move.w	#$0048,d5
		move.w	#$FFC8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB7F8
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1AB7F8
		move.b	#$21,$00000037(a5)
		move.w	#$000E,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB7F8:					  ; CODE XREF: sub_1AB7C0+10j
						  ; sub_1AB7C0+20j
		tst.b	d0
		rts
; End of function sub_1AB7C0


; =============== S U B	R O U T	I N E =======================================


sub_1AB7FC:					  ; CODE XREF: ROM:001AB770p
		move.w	#$0038,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB834
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0005,d7
		bhi.s	loc_1AB834
		move.b	#$22,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB834:					  ; CODE XREF: sub_1AB7FC+10j
						  ; sub_1AB7FC+20j
		tst.b	d0
		rts
; End of function sub_1AB7FC


; =============== S U B	R O U T	I N E =======================================


sub_1AB838:					  ; CODE XREF: ROM:001AB776p
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AB88E
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bcc.s	loc_1AB874
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB874:					  ; CODE XREF: sub_1AB838+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB88E:					  ; CODE XREF: sub_1AB838+10j
		tst.b	d0
		rts
; End of function sub_1AB838

; ---------------------------------------------------------------------------

loc_1AB892:					  ; CODE XREF: ROM:001AB71Aj
		andi.b	#$0F,d0
		beq.s	loc_1AB8B0
		cmpi.b	#$01,d0
		beq.s	loc_1AB8B6
		cmpi.b	#$02,d0
		beq.s	loc_1AB8F6
		cmpi.b	#$03,d0
		beq.w	loc_1AB930
		bra.w	loc_1AB966
; ---------------------------------------------------------------------------

loc_1AB8B0:					  ; CODE XREF: ROM:001AB896j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AB8B6:					  ; CODE XREF: ROM:001AB89Cj
		move.b	$0000002D(a5),d1
		move.b	d1,d2
		move.w	#$0100,$0000002C(a5)
		andi.b	#$20,d1
		bne.s	loc_1AB8F0
		movem.w	d2,-(sp)
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		movem.w	(sp)+,d2
		move.w	#$0200,$0000002C(a5)
		andi.b	#$10,d2
		bne.s	loc_1AB8F0
		bra.w	loc_1AB74C
; ---------------------------------------------------------------------------

loc_1AB8F0:					  ; CODE XREF: ROM:001AB8C6j
						  ; ROM:001AB8EAj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AB8F6:					  ; CODE XREF: ROM:001AB8A2j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1AB92A
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	loc_1AB92A
		bra.w	loc_1AB74C
; ---------------------------------------------------------------------------

loc_1AB92A:					  ; CODE XREF: ROM:001AB906j
						  ; ROM:001AB924j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AB930:					  ; CODE XREF: ROM:001AB8A8j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1AB964
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$2D,$0000000D(a5)
		bcs.s	locret_1AB964
		bra.w	loc_1AB74C
; ---------------------------------------------------------------------------

locret_1AB964:					  ; CODE XREF: ROM:001AB940j
						  ; ROM:001AB95Ej
		rts
; ---------------------------------------------------------------------------

loc_1AB966:					  ; CODE XREF: ROM:001AB8ACj
		addq.b	#$01,$0000000D(a5)
		move.b	$0000000D(a5),d0
		andi.w	#$0008,d0
		lsl.w	#$05,d0
		addi.w	#$0100,d0
		move.w	d0,$0000002C(a5)
		cmpi.w	#$0100,d0
		beq.s	loc_1AB992
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C

loc_1AB992:					  ; CODE XREF: ROM:001AB980j
		cmpi.b	#$60,$0000000D(a5)
		bcc.w	loc_1AB74C
		rts
; ---------------------------------------------------------------------------

EnemyAI_Bubble1_B:				  ; CODE XREF: ROM:001A85CAj
		bra.s	loc_1AB9F4
; ---------------------------------------------------------------------------

EnemyAI_Bubble1_A:				  ; CODE XREF: ROM:001A85C6j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AB9B4
		move.b	$00000037(a5),d0
		beq.s	loc_1AB9BA
		cmpi.b	#$10,d0
		beq.s	loc_1ABA0C

loc_1AB9B4:					  ; CODE XREF: ROM:001AB9A6j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AB9BA:					  ; CODE XREF: ROM:001AB9ACj
		tst.w	$0000002A(a5)
		bne.s	loc_1AB9E2
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.b	#$01,d7
		bcs.s	loc_1AB9D8
		cmpi.b	#$02,d7
		bcs.s	loc_1AB9E8
		rts
; ---------------------------------------------------------------------------

loc_1AB9D8:					  ; CODE XREF: ROM:001AB9CEj
		move.w	#$0020,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour

loc_1AB9E2:					  ; CODE XREF: ROM:001AB9BEj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AB9E8:					  ; CODE XREF: ROM:001AB9D4j
		move.b	#$10,$00000037(a5)
		clr.b	$0000000D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AB9F4:					  ; CODE XREF: ROM:EnemyAI_Bubble1_Bj
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$00,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABA0C:					  ; CODE XREF: ROM:001AB9B2j
		addq.b	#$01,$0000000D(a5)
		move.b	$0000000D(a5),d0
		andi.w	#$0004,d0
		lsl.w	#$06,d0
		addi.w	#$0300,d0
		move.w	d0,$0000002C(a5)
		cmpi.b	#$40,$0000000D(a5)
		bcs.s	locret_1ABA38
		clr.w	$0000002C(a5)
		move.w	#$FFFF,$0000002E(a5)
		clr.b	$00000037(a5)

locret_1ABA38:					  ; CODE XREF: ROM:001ABA28j
		rts
; ---------------------------------------------------------------------------

EnemyAI_Bubble2_B:				  ; CODE XREF: ROM:001A85D2j
		bra.s	loc_1ABA58
; ---------------------------------------------------------------------------

EnemyAI_Bubble2_A:				  ; CODE XREF: ROM:001A85CEj
		btst	#$01,$0000000C(a5)
		bne.s	loc_1ABA52
		move.b	$00000037(a5),d0
		beq.s	loc_1ABA70
		cmpi.b	#$10,d0
		beq.w	loc_1ABAE8

loc_1ABA52:					  ; CODE XREF: ROM:001ABA42j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ABA58:					  ; CODE XREF: ROM:EnemyAI_Bubble2_Bj
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$00,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABA70:					  ; CODE XREF: ROM:001ABA48j
		tst.w	$0000002A(a5)
		bne.s	loc_1ABAAE
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.b	#$01,d7
		bcs.s	loc_1ABA8E
		cmpi.b	#$02,d7
		bcs.s	loc_1ABAC4
		rts
; ---------------------------------------------------------------------------

loc_1ABA8E:					  ; CODE XREF: ROM:001ABA84j
		move.b	#$22,d0
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.b	#$50,d7
		bcs.s	loc_1ABAA6
		move.b	#$21,d0

loc_1ABAA6:					  ; CODE XREF: ROM:001ABAA0j
		move.w	d0,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour

loc_1ABAAE:					  ; CODE XREF: ROM:001ABA74j
		btst	#$05,$0000002D(a5)
		bne.s	loc_1ABAD0
		btst	#$04,$0000002D(a5)
		bne.s	loc_1ABADC
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ABAC4:					  ; CODE XREF: ROM:001ABA8Aj
		move.b	#$10,$00000037(a5)
		clr.b	$0000000D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABAD0:					  ; CODE XREF: ROM:001ABAB4j
		bsr.w	LoadSpecialAI
		move.w	#$0100,$0000002C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABADC:					  ; CODE XREF: ROM:001ABABCj
		bsr.w	LoadSpecialAI
		move.w	#$0200,$0000002C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABAE8:					  ; CODE XREF: ROM:001ABA4Ej
		addq.b	#$01,$0000000D(a5)
		move.b	$0000000D(a5),d0
		andi.w	#$0004,d0
		lsl.w	#$06,d0
		addi.w	#$0300,d0
		move.w	d0,$0000002C(a5)
		cmpi.b	#$40,$0000000D(a5)
		bcs.s	locret_1ABB14
		clr.w	$0000002C(a5)
		move.w	#$FFFF,$0000002E(a5)
		clr.b	$00000037(a5)

locret_1ABB14:					  ; CODE XREF: ROM:001ABB04j
		rts
; ---------------------------------------------------------------------------

EnemyAI_Bubble3_B:				  ; CODE XREF: ROM:001A85DAj
						  ; ROM:001A86B2j ...
		bra.s	loc_1ABB34
; ---------------------------------------------------------------------------

EnemyAI_Bubble3_A:				  ; CODE XREF: ROM:001A85D6j
						  ; ROM:001A86AEj ...
		btst	#$01,$0000000C(a5)
		bne.s	loc_1ABB2E
		move.b	$00000037(a5),d0
		beq.s	loc_1ABB4C
		cmpi.b	#$10,d0
		beq.w	loc_1ABBE6

loc_1ABB2E:					  ; CODE XREF: ROM:001ABB1Ej
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ABB34:					  ; CODE XREF: ROM:EnemyAI_Bubble3_Bj
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$00,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABB4C:					  ; CODE XREF: ROM:001ABB24j
		tst.w	$0000002A(a5)
		bne.s	loc_1ABBAC
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0040,d5
		move.w	#$0040,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1ABB8C
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.b	#$01,d7
		bcs.s	loc_1ABB8C
		cmpi.b	#$02,d7
		bcs.s	loc_1ABBC2
		rts
; ---------------------------------------------------------------------------

loc_1ABB8C:					  ; CODE XREF: ROM:001ABB72j
						  ; ROM:001ABB82j
		move.b	#$22,d0
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.b	#$50,d7
		bcs.s	loc_1ABBA4
		move.b	#$21,d0

loc_1ABBA4:					  ; CODE XREF: ROM:001ABB9Ej
		move.w	d0,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour

loc_1ABBAC:					  ; CODE XREF: ROM:001ABB50j
		btst	#$05,$0000002D(a5)
		bne.s	loc_1ABBCE
		btst	#$04,$0000002D(a5)
		bne.s	loc_1ABBDA
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ABBC2:					  ; CODE XREF: ROM:001ABB88j
		move.b	#$10,$00000037(a5)
		clr.b	$0000000D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABBCE:					  ; CODE XREF: ROM:001ABBB2j
		bsr.w	LoadSpecialAI
		move.w	#$0100,$0000002C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABBDA:					  ; CODE XREF: ROM:001ABBBAj
		bsr.w	LoadSpecialAI
		move.w	#$0200,$0000002C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABBE6:					  ; CODE XREF: ROM:001ABB2Aj
		addq.b	#$01,$0000000D(a5)
		move.b	$0000000D(a5),d0
		andi.w	#$0004,d0
		lsl.w	#$06,d0
		addi.w	#$0300,d0
		move.w	d0,$0000002C(a5)
		cmpi.b	#$40,$0000000D(a5)
		bcs.s	locret_1ABC12
		clr.w	$0000002C(a5)
		move.w	#$FFFF,$0000002E(a5)
		clr.b	$00000037(a5)

locret_1ABC12:					  ; CODE XREF: ROM:001ABC02j
		rts
; ---------------------------------------------------------------------------

EnemyAI_Miro_B:					  ; CODE XREF: ROM:001A85E2j
						  ; ROM:001A868Aj
		bra.s	loc_1ABC34
; ---------------------------------------------------------------------------

EnemyAI_Miro_A:					  ; CODE XREF: ROM:001A85DEj
						  ; ROM:001A8686j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1ABC2E
		move.b	$00000037(a5),d0
		beq.s	loc_1ABC34
		cmpi.b	#$10,d0
		beq.s	loc_1ABC4C
		bra.w	loc_1ABE36
; ---------------------------------------------------------------------------

loc_1ABC2E:					  ; CODE XREF: ROM:001ABC1Cj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ABC34:					  ; CODE XREF: ROM:EnemyAI_Miro_Bj
						  ; ROM:001ABC22j ...
		move.w	#$0180,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABC4C:					  ; CODE XREF: ROM:001ABC28j
		tst.b	(byte_FF1142).l
		bne.s	loc_1ABC8A
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1ABC8E
		bcs.s	loc_1ABC84
		bsr.s	sub_1ABCCE
		bcs.s	loc_1ABC84
		bsr.w	sub_1ABD0E
		bcs.s	loc_1ABC84
		bsr.w	sub_1ABD4E
		bcs.s	loc_1ABC84
		bsr.w	sub_1ABD9A
		bcs.w	loc_1ABC84
		bsr.w	sub_1ABDDA

loc_1ABC84:					  ; CODE XREF: ROM:001ABC66j
						  ; ROM:001ABC6Aj ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ABC8A:					  ; CODE XREF: ROM:001ABC52j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1ABC8E:					  ; CODE XREF: ROM:001ABC64p
		move.w	#$0070,d5
		move.w	#$FFB0,d6
		move.w	#$0018,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ABCCA
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0009,d7
		bhi.s	loc_1ABCCA
		move.b	#$20,$00000037(a5)
		move.w	#$0019,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ABCCA:					  ; CODE XREF: sub_1ABC8E+10j
						  ; sub_1ABC8E+20j
		tst.b	d0
		rts
; End of function sub_1ABC8E


; =============== S U B	R O U T	I N E =======================================


sub_1ABCCE:					  ; CODE XREF: ROM:001ABC68p
		move.w	#$0040,d5
		move.w	#$FFD8,d6
		move.w	#$0018,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ABD0A
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0019,d7
		bhi.s	loc_1ABD0A
		move.b	#$21,$00000037(a5)
		move.w	#$0012,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ABD0A:					  ; CODE XREF: sub_1ABCCE+10j
						  ; sub_1ABCCE+20j
		tst.b	d0
		rts
; End of function sub_1ABCCE


; =============== S U B	R O U T	I N E =======================================


sub_1ABD0E:					  ; CODE XREF: ROM:001ABC6Cp
		move.w	#$0050,d5
		move.w	#$FFC0,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ABD4A
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1ABD4A
		move.b	#$22,$00000037(a5)
		move.w	#$0007,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ABD4A:					  ; CODE XREF: sub_1ABD0E+10j
						  ; sub_1ABD0E+20j
		tst.b	d0
		rts
; End of function sub_1ABD0E


; =============== S U B	R O U T	I N E =======================================


sub_1ABD4E:					  ; CODE XREF: ROM:001ABC72p
		move.w	#$0040,d5
		move.w	#$FFF0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ABD96
		move.b	(Player_Action).l,d0	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6, Bit7 - Pick up / Put down
						  ; Bit8-Bit10 - Sword swing
						  ; Bit12 - Ladder Climb
		andi.b	#$07,d0
		beq.s	loc_1ABD96
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$005A,d7
		bhi.s	loc_1ABD96
		move.b	#$23,$00000037(a5)
		move.w	#$017F,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ABD96:					  ; CODE XREF: sub_1ABD4E+10j
						  ; sub_1ABD4E+1Cj ...
		tst.b	d0
		rts
; End of function sub_1ABD4E


; =============== S U B	R O U T	I N E =======================================


sub_1ABD9A:					  ; CODE XREF: ROM:001ABC78p
		move.w	#$0038,d5
		move.w	#$0000,d6
		move.w	#$0018,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ABDD6
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0007,d7
		bhi.s	loc_1ABDD6
		move.b	#$24,$00000037(a5)
		move.w	#$0007,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ABDD6:					  ; CODE XREF: sub_1ABD9A+10j
						  ; sub_1ABD9A+20j
		tst.b	d0
		rts
; End of function sub_1ABD9A


; =============== S U B	R O U T	I N E =======================================


sub_1ABDDA:					  ; CODE XREF: ROM:001ABC80p
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0018,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ABE32
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0046,d7
		bcc.s	loc_1ABE18
		bra.s	loc_1ABE18
; ---------------------------------------------------------------------------
		move.b	#$25,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ABE18:					  ; CODE XREF: sub_1ABDDA+20j
						  ; sub_1ABDDA+22j
		move.b	#$26,$00000037(a5)
		move.w	#$0181,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ABE32:					  ; CODE XREF: sub_1ABDDA+10j
		tst.b	d0
		rts
; End of function sub_1ABDDA

; ---------------------------------------------------------------------------

loc_1ABE36:					  ; CODE XREF: ROM:001ABC2Aj
		andi.b	#$0F,d0
		beq.w	loc_1ABEC0
		cmpi.b	#$01,d0
		beq.s	loc_1ABEC0
		cmpi.b	#$02,d0
		beq.w	loc_1ABED4
		cmpi.b	#$03,d0
		beq.w	loc_1ABED4
		cmpi.b	#$04,d0
		beq.s	sub_1ABE66
		cmpi.b	#$05,d0
		beq.s	loc_1ABEDA
		bra.w	loc_1ABEE6
; ---------------------------------------------------------------------------
		nop

; =============== S U B	R O U T	I N E =======================================


sub_1ABE66:					  ; CODE XREF: ROM:001ABE58j
						  ; ROM:001ABEC4j ...
		move.w	#$0100,Action(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$04,Unk4D(a5)
		bcs.s	loc_1ABEBA
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$000D,d3
		bsr.w	sub_1A880C
		move.w	#$0200,Action(a5)
		cmpi.b	#$08,Unk4D(a5)
		bcs.s	loc_1ABEBA
		move.w	#$0300,Action(a5)
		cmpi.b	#$0C,Unk4D(a5)
		bcs.s	loc_1ABEBA
		move.w	#$0400,Action(a5)
		cmpi.b	#$10,Unk4D(a5)
		bcs.s	loc_1ABEBA
		clr.w	Action(a5)
		clr.b	Unk4D(a5)

loc_1ABEBA:					  ; CODE XREF: sub_1ABE66+10j
						  ; sub_1ABE66+2Ej ...
		bsr.w	LoadSpecialAI
		rts
; End of function sub_1ABE66

; ---------------------------------------------------------------------------

loc_1ABEC0:					  ; CODE XREF: ROM:001ABE3Aj
						  ; ROM:001ABE42j
		tst.b	$0000004D(a5)
		bne.s	sub_1ABE66
		btst	#$04,$0000002D(a5)
		bne.s	sub_1ABE66
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ABED4:					  ; CODE XREF: ROM:001ABE48j
						  ; ROM:001ABE50j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ABEDA:					  ; CODE XREF: ROM:001ABE5Ej
		bsr.s	sub_1ABE66
		tst.w	$0000002C(a5)
		beq.w	loc_1ABC34
		rts
; ---------------------------------------------------------------------------

loc_1ABEE6:					  ; CODE XREF: ROM:001ABE60j
		tst.b	$0000002B(a5)
		bne.w	loc_1ABF26
		tst.b	$0000004D(a5)
		bne.w	sub_1ABE66
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0018,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1ABC34
		tst.b	(byte_FF1142).l
		beq.w	sub_1ABE66
		rts
; ---------------------------------------------------------------------------

loc_1ABF26:					  ; CODE XREF: ROM:001ABEEAj
		clr.w	$0000002C(a5)
		clr.b	$0000004D(a5)
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

EnemyAI_Mir_B:					  ; CODE XREF: ROM:001A85EAj
		bra.s	loc_1ABF5A
; ---------------------------------------------------------------------------

EnemyAI_Mir_A:					  ; CODE XREF: ROM:001A85E6j
		bset	#$00,$0000000C(a5)
		bclr	#$01,$00000038(a5)
		btst	#$01,$0000000C(a5)
		bne.w	loc_1ABFF2
		move.b	$00000037(a5),d0
		cmpi.b	#$10,d0
		bne.w	loc_1AC04E
		bra.s	loc_1ABF72
; ---------------------------------------------------------------------------

loc_1ABF5A:					  ; CODE XREF: ROM:EnemyAI_Mir_Bj
						  ; ROM:001AC104j ...
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABF72:					  ; CODE XREF: ROM:001ABF58j
		bsr.w	sub_1AC010
		move.b	d2,d1
		movea.l	a5,a1
		bclr	#$00,$0000000C(a5)
		jsr	(j_SetSpriteRotationAnimFlags).l
		bset	#$07,$00000048(a5)
		clr.b	$0000000A(a5)
		move.w	(Player_CentreX).l,d0
		subi.w	#$0070,d0
		move.w	$00000014(a5),d1
		sub.w	d0,d1
		cmpi.w	#$00E0,d1
		bcc.s	loc_1ABFF8
		move.w	(Player_CentreY).l,d0
		subi.w	#$0070,d0
		move.w	$00000016(a5),d2
		sub.w	d0,d2
		cmpi.w	#$00E0,d2
		bcc.s	loc_1ABFF8
		move.w	(Player_CentreX).l,d0
		subi.w	#$0060,d0
		move.w	$00000014(a5),d1
		sub.w	d0,d1
		cmpi.w	#$00C0,d1
		bcc.s	loc_1AC004
		move.w	(Player_CentreY).l,d0
		subi.w	#$0060,d0
		move.w	$00000016(a5),d2
		sub.w	d0,d2
		cmpi.w	#$00C0,d2
		bcc.s	loc_1AC004
		move.w	#$0266,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour

loc_1ABFF2:					  ; CODE XREF: ROM:001ABF48j
						  ; ROM:001AC002j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ABFF8:					  ; CODE XREF: ROM:001ABFA4j
						  ; ROM:001ABFBAj
		move.w	#$0267,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bra.s	loc_1ABFF2
; ---------------------------------------------------------------------------

loc_1AC004:					  ; CODE XREF: ROM:001ABFD0j
						  ; ROM:001ABFE6j
		clr.b	$0000004D(a5)
		move.b	#$20,$00000037(a5)
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1AC010:					  ; CODE XREF: ROM:loc_1ABF72p
						  ; ROM:001AC054p ...
		move.w	$00000014(a5),d0
		sub.w	(Player_CentreX).l,d0
		move.w	$00000016(a5),d1
		sub.w	(Player_CentreY).l,d1
		movem.w	d0-d1,-(sp)
		add.w	d0,d1
		bpl.s	loc_1AC03E
		movem.w	(sp)+,d0-d1
		move.b	#$80,d2
		sub.w	d1,d0
		bpl.s	locret_1AC04C
		move.b	#$40,d2
		bra.s	locret_1AC04C
; ---------------------------------------------------------------------------

loc_1AC03E:					  ; CODE XREF: sub_1AC010+1Aj
		movem.w	(sp)+,d0-d1
		move.b	#$C0,d2
		sub.w	d1,d0
		bpl.s	locret_1AC04C
		clr.b	d2

locret_1AC04C:					  ; CODE XREF: sub_1AC010+26j
						  ; sub_1AC010+2Cj ...
		rts
; End of function sub_1AC010

; ---------------------------------------------------------------------------

loc_1AC04E:					  ; CODE XREF: ROM:001ABF54j
		bset	#$07,$00000048(a5)
		bsr.w	sub_1AC010
		move.b	d2,d1
		movea.l	a5,a1
		bclr	#$00,$0000000C(a5)
		jsr	(j_SetSpriteRotationAnimFlags).l
		bset	#$00,$0000000C(a5)
		andi.w	#$0004,$00000024(a5)
		addi.w	#$0008,$00000024(a5)
		move.b	#$01,$0000000A(a5)
		andi.b	#$BF,$0000000C(a5)
		addq.b	#$01,$0000004D(a5)
		move.w	#$0000,$00000026(a5)
		move.w	#$0100,$0000002C(a5)
		cmpi.b	#$01,$0000004D(a5)
		bne.s	loc_1AC0AE
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1AC0AE:					  ; CODE XREF: ROM:001AC09Cj
		cmpi.b	#$02,$0000004D(a5)
		bne.w	loc_1AC0C0
		move.b	#$01,d0
		bra.w	LoadProjectilePalette
; ---------------------------------------------------------------------------

loc_1AC0C0:					  ; CODE XREF: ROM:001AC0B4j
		cmpi.b	#$0F,$0000004D(a5)
		bhi.w	loc_1AC108
		bcs.w	locret_1AC11E
		bsr.w	sub_1AC010
		move.b	$00000004(a5),d0
		movem.w	d0,-(sp)
		andi.b	#$3F,$00000004(a5)
		or.b	d2,$00000004(a5)
		move.b	#$01,d0
		move.w	#$0300,d1
		bsr.w	sub_1AC474
		bcs.s	loc_1AC0FC
		movem.w	(sp)+,d0
		move.b	d0,$00000004(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AC0FC:					  ; CODE XREF: ROM:001AC0F0j
		movem.w	(sp)+,d0
		move.b	d0,$00000004(a5)
		bra.w	loc_1ABF5A
; ---------------------------------------------------------------------------

loc_1AC108:					  ; CODE XREF: ROM:001AC0C6j
		move.w	#$0004,$00000026(a5)
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000004D(a5)
		beq.w	loc_1ABF5A

locret_1AC11E:					  ; CODE XREF: ROM:001AC0CAj
		rts
; ---------------------------------------------------------------------------

EnemyAI_Reaper1_B:				  ; CODE XREF: ROM:001A85F2j
		bra.s	loc_1AC168
; ---------------------------------------------------------------------------

EnemyAI_Reaper1_A:				  ; CODE XREF: ROM:001A85EEj
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AC13A
		move.b	$00000037(a5),d0
		beq.s	loc_1AC140
		cmpi.b	#$10,d0
		beq.s	loc_1AC16C
		bra.w	loc_1AC258
; ---------------------------------------------------------------------------

loc_1AC13A:					  ; CODE XREF: ROM:001AC128j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AC140:					  ; CODE XREF: ROM:001AC12Ej
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0100,d5
		move.w	#$0100,d6
		move.w	#$0100,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AC168
		rts
; ---------------------------------------------------------------------------

loc_1AC168:					  ; CODE XREF: ROM:EnemyAI_Reaper1_Bj
						  ; ROM:001AC164j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AC16C:					  ; CODE XREF: ROM:001AC134j
		tst.b	(byte_FF1142).l
		bne.s	loc_1AC1CC
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$3C,$0000004D(a5)
		bcs.s	loc_1AC1B8
		clr.b	$0000004D(a5)
		bsr.s	sub_1AC1D0
		bcs.s	loc_1AC1B2
		ori.b	#$40,$0000000C(a5)
		move.w	#$0100,$00000012(a5)
		move.w	#$0120,$00000054(a5)
		bsr.s	sub_1AC200
		bcs.s	loc_1AC1B2
		bsr.w	sub_1AC22A

loc_1AC1B2:					  ; CODE XREF: ROM:001AC196j
						  ; ROM:001AC1ACj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AC1B8:					  ; CODE XREF: ROM:001AC18Ej
		ori.b	#$40,$0000000C(a5)
		move.w	#$0100,$00000012(a5)
		move.w	#$0120,$00000054(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AC1CC:					  ; CODE XREF: ROM:001AC172j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AC1D0:					  ; CODE XREF: ROM:001AC194p
		move.w	#$0060,d5
		move.w	#$FFB8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AC1FC
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AC1FC:					  ; CODE XREF: sub_1AC1D0+10j
		tst.b	d0
		rts
; End of function sub_1AC1D0


; =============== S U B	R O U T	I N E =======================================


sub_1AC200:					  ; CODE XREF: ROM:001AC1AAp
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$00C8,d7
		bhi.s	loc_1AC226
		move.b	#$21,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AC226:					  ; CODE XREF: sub_1AC200+Ej
		tst.b	d0
		rts
; End of function sub_1AC200


; =============== S U B	R O U T	I N E =======================================


sub_1AC22A:					  ; CODE XREF: ROM:001AC1AEp
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$00C8,d7
		bhi.s	loc_1AC254
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AC254:					  ; CODE XREF: sub_1AC22A+Ej
		tst.b	d0
		rts
; End of function sub_1AC22A

; ---------------------------------------------------------------------------

loc_1AC258:					  ; CODE XREF: ROM:001AC136j
		clr.b	$0000000D(a5)
		andi.b	#$0F,d0
		beq.w	loc_1AC368
		cmpi.b	#$01,d0
		beq.s	loc_1AC27E
		cmpi.b	#$02,d0
		beq.w	loc_1AC292
		cmpi.b	#$03,d0
		beq.w	loc_1AC292
		bra.w	loc_1AC292
; ---------------------------------------------------------------------------

loc_1AC27E:					  ; CODE XREF: ROM:001AC268j
		move.l	(a5),d0
		movem.l	d0,-(sp)
		move.b	(Player_RotationAndSize).l,d0
		eori.b	#$80,d0
		clr.b	d1
		bra.s	loc_1AC2A2
; ---------------------------------------------------------------------------

loc_1AC292:					  ; CODE XREF: ROM:001AC26Ej
						  ; ROM:001AC276j ...
		move.l	(a5),d0
		movem.l	d0,-(sp)
		move.b	(Player_RotationAndSize).l,d0
		move.b	#$80,d1

loc_1AC2A2:					  ; CODE XREF: ROM:001AC290j
		movem.w	d1,-(sp)
		move.w	(Player_CentreX).l,d1
		move.w	(Player_CentreY).l,d2
		andi.b	#$C0,d0
		beq.s	loc_1AC2C6
		cmpi.b	#$80,d0
		beq.s	loc_1AC2CC
		bhi.s	loc_1AC2D2
		addi.w	#$0068,d1
		bra.s	loc_1AC2D6
; ---------------------------------------------------------------------------

loc_1AC2C6:					  ; CODE XREF: ROM:001AC2B6j
		subi.w	#$0068,d2
		bra.s	loc_1AC2D6
; ---------------------------------------------------------------------------

loc_1AC2CC:					  ; CODE XREF: ROM:001AC2BCj
		addi.w	#$0068,d2
		bra.s	loc_1AC2D6
; ---------------------------------------------------------------------------

loc_1AC2D2:					  ; CODE XREF: ROM:001AC2BEj
		subi.w	#$0068,d1

loc_1AC2D6:					  ; CODE XREF: ROM:001AC2C4j
						  ; ROM:001AC2CAj ...
		move.w	d1,d0
		lsr.w	#$04,d1
		move.b	d1,(a5)
		andi.b	#$0F,d0
		move.b	d0,$00000002(a5)
		move.w	d2,d0
		lsr.w	#$04,d2
		move.b	d2,$00000001(a5)
		andi.b	#$0F,d0
		move.b	d0,$00000003(a5)
		clr.w	d0
		move.b	$00000039(a5),d0
		move.w	d0,$00000012(a5)
		addi.w	#$001F,d0
		move.w	d0,$00000054(a5)
		movea.l	a5,a1
		jsr	(sub_1A8AE6).l
		jsr	(sub_3BC).l
		bcc.s	loc_1AC338
		movem.w	(sp)+,d1
		movem.l	(sp)+,d0
		move.l	d0,(a5)
		movea.l	a5,a1
		move.w	#$0100,$00000012(a5)
		move.w	#$0120,$00000054(a5)
		jsr	(sub_1A8AE6).l
		bra.w	loc_1AC168
; ---------------------------------------------------------------------------

loc_1AC338:					  ; CODE XREF: ROM:001AC314j
		movem.w	(sp)+,d1
		bset	#$05,$0000002D(a5)
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		eor.b	d1,d0
		andi.b	#$3F,$00000004(a5)
		or.b	d0,$00000004(a5)
		movem.l	(sp)+,d0
		move.b	#$20,$00000037(a5)
		clr.b	$0000004D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AC368:					  ; CODE XREF: ROM:001AC260j
		andi.b	#$BF,$0000000C(a5)
		clr.w	d0
		move.b	$00000039(a5),d0
		move.w	d0,$00000012(a5)
		addi.w	#$001F,d0
		move.w	d0,$00000054(a5)
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$01,$0000004D(a5)
		bne.s	loc_1AC3A2
		move.w	#$0100,$0000002C(a5)
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1AC3A2:					  ; CODE XREF: ROM:001AC38Aj
		cmpi.b	#$02,$0000004D(a5)
		bne.w	loc_1AC3B4
		move.b	#$01,d0
		bra.w	LoadProjectilePalette
; ---------------------------------------------------------------------------

loc_1AC3B4:					  ; CODE XREF: ROM:001AC3A8j
		cmpi.b	#$2D,$0000004D(a5)
		bhi.w	loc_1AC3DA
		bcs.w	locret_1AC3EA
		move.w	#$0200,$0000002C(a5)
		move.b	#$01,d0
		move.w	#$0300,d1
		bsr.w	sub_1AC474
		bcs.w	loc_1AC3EC
		rts
; ---------------------------------------------------------------------------

loc_1AC3DA:					  ; CODE XREF: ROM:001AC3BAj
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$46,$0000004D(a5)
		beq.w	loc_1AC3EC

locret_1AC3EA:					  ; CODE XREF: ROM:001AC3BEj
		rts
; ---------------------------------------------------------------------------

loc_1AC3EC:					  ; CODE XREF: ROM:001AC3D4j
						  ; ROM:001AC3E6j
		clr.b	$0000004D(a5)
		bra.w	loc_1AC168

; =============== S U B	R O U T	I N E =======================================


LoadProjectilePalette:				  ; CODE XREF: ROM:001AC0BCj
						  ; ROM:001AC3B0j ...
		subq.b	#$01,d0
		ext.w	d0
		lsl.b	#$02,d0
		move.l	#$C0700000,(VDP_CTRL_REG).l ; Palette address 0x70 : Pal 3, index 8
		move.w	ProjectilePalette1(pc,d0.w),d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal3Base+$10).l
		move.w	d1,(g_Pal3Active+$10).l
		move.w	ProjectilePalette1+2(pc,d0.w),d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal3Base+$12).l
		move.w	d1,(g_Pal3Active+$12).l
		move.l	#$C03A0000,(VDP_CTRL_REG).l
		move.w	ProjectilePalette1(pc,d0.w),d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal1Base+$1A).l
		move.w	d1,(g_Pal1Active+$1A).l
		move.w	ProjectilePalette1+2(pc,d0.w),d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal1Base+$1C).l
		move.w	d1,(g_Pal1Active+$1C).l
		rts
; End of function LoadProjectilePalette

; ---------------------------------------------------------------------------
