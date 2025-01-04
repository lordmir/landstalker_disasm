; ---------------------------------------------------------------------------

HandleAttack:					  ; DATA XREF: j_HandleAttackt
		lea	(Player_X).l,a0
		move.w	#$4000,d0
		and.w	d0,(SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(2*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(3*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(4*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(5*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(6*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(7*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(8*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(9*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(10*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(11*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(12*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(13*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(14*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(15*SPRITE_SIZE+QueuedAction)(a0)
		lea	SPRITE_SIZE(a0),a5
		moveq	#$0000000E,d7
		bclr	#$00,(byte_FF1157).l
		bne.w	loc_15CB4
		move.w	QueuedAction(a0),d0
		andi.w	#$0700,d0
		cmpi.w	#$0200,d0
		bcs.w	locret_16378
		lea	word_15D0C(pc),a1
		cmpi.w	#$0200,d0
		beq.s	loc_15CC0
		lea	word_15D1C(pc),a1
		cmpi.w	#$0300,d0
		bne.s	loc_15CC0
		lea	word_15D14(pc),a1
		cmpi.b	#$02,(g_SwordCharge).l
		bne.s	loc_15CC0
		cmpi.b	#$0B,(byte_FF113F).l
		bne.s	loc_15CC0
		bra.w	loc_1616E
; ---------------------------------------------------------------------------

loc_15CB4:					  ; CODE XREF: ROM:00015C70j
		move.b	#$04,(g_SwordCharge).l
		bra.w	loc_160B6
; ---------------------------------------------------------------------------

loc_15CC0:					  ; CODE XREF: ROM:00015C8Cj
						  ; ROM:00015C96j ...
		lea	word_15D14(pc),a1
		cmpi.b	#$04,(g_SwordCharge).l
		bne.s	loc_15CDC
		cmpi.b	#$0B,(byte_FF113F).l
		bne.s	loc_15CDC
		bra.w	loc_160B6
; ---------------------------------------------------------------------------

loc_15CDC:					  ; CODE XREF: ROM:00015CCCj
						  ; ROM:00015CD6j
		move.w	CentreY(a0),d1
		move.w	d1,d2
		move.w	CentreX(a0),d3
		move.w	d3,d4
		move.w	Z(a0),d6
		lea	SPRITE_SIZE(a0),a5
		moveq	#$0000000E,d7
		move.b	RotationAndSize(a0),d5
		andi.b	#$C0,d5
		beq.w	loc_15DE6
		cmpi.b	#$80,d5
		beq.w	loc_15EA8
		bcs.w	loc_15F6A
		bra.s	loc_15D24
; ---------------------------------------------------------------------------
word_15D0C:	dc.w $0018,$0010,$0000,$0000	  ; DATA XREF: ROM:00015C84t
word_15D14:	dc.w $0020,$0010,$0010,$FFF8	  ; DATA XREF: ROM:00015C98t
						  ; ROM:loc_15CC0t
word_15D1C:	dc.w $0018,$0000,$0010,$0000	  ; DATA XREF: ROM:00015C8Et
; ---------------------------------------------------------------------------

loc_15D24:					  ; CODE XREF: ROM:00015D0Aj
		sub.w	$00000004(a1),d1
		add.w	$00000002(a1),d2
		add.w	$00000006(a1),d3
		sub.w	(a1),d4

loc_15D32:					  ; CODE XREF: ROM:00015DE0j
		move.b	(a5),d5
		bmi.w	locret_15DE4
		cmpi.b	#$7F,d5
		beq.w	loc_15DDC
		move.b	Flags2(a5),d0
		andi.b	#$82,d0
		cmpi.b	#$80,d0
		bne.w	loc_15DDC
		cmp.w	HitBoxYStart(a5),d2
		bcs.w	loc_15DDC
		cmp.w	HitBoxYEnd(a5),d1
		bhi.s	loc_15DDC
		cmp.w	HitBoxXStart(a5),d3
		bcs.s	loc_15DDC
		cmp.w	HitBoxXEnd(a5),d4
		bhi.s	loc_15DDC
		cmp.w	HitBoxZEnd(a5),d6
		bcc.s	loc_15DDC
		addi.w	#$001F,d6
		cmp.w	Z(a5),d6
		bcc.s	loc_15D80		  ; Invincible / Solid

loc_15D7A:					  ; CODE XREF: ROM:00015D94j
		subi.w	#$001F,d6
		bra.s	loc_15DDC
; ---------------------------------------------------------------------------

loc_15D80:					  ; CODE XREF: ROM:00015D78j
		btst	#$00,Flags4(a5)		  ; Invincible / Solid
		beq.s	loc_15D96
		bset	#$03,(g_AdditionalFlags+8).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordHit
; ---------------------------------------------------------------------------
		bra.s	loc_15D7A
; ---------------------------------------------------------------------------

loc_15D96:					  ; CODE XREF: ROM:00015D86j
		move.w	Defence(a5),d0
		bsr.w	CalculatePlayerDamageOutput
		sub.w	d0,CurrentHealth(a5)
		bhi.s	loc_15DAA
		bsr.w	sub_16134
		bra.s	loc_15DDC
; ---------------------------------------------------------------------------

loc_15DAA:					  ; CODE XREF: ROM:00015DA2j
		bsr.w	sub_1602A
		move.w	#Unk0D,BehaviourLUTIndex(a5)
		cmpi.b	#SpriteB_GhostGen,SpriteGraphic(a5)
		bne.s	loc_15DC4
		move.w	#$0268,BehaviourLUTIndex(a5)
		bra.s	loc_15DD2
; ---------------------------------------------------------------------------

loc_15DC4:					  ; CODE XREF: ROM:00015DBAj
		cmpi.b	#$04,SpriteGraphic(a5)
		bne.s	loc_15DD2
		move.w	#$0364,BehaviourLUTIndex(a5)

loc_15DD2:					  ; CODE XREF: ROM:00015DC2j
						  ; ROM:00015DCAj
		jsr	(j_LoadSpriteBehaviour).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_EnemyHit1
; ---------------------------------------------------------------------------

loc_15DDC:					  ; CODE XREF: ROM:00015D3Cj
						  ; ROM:00015D4Cj ...
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,loc_15D32

locret_15DE4:					  ; CODE XREF: ROM:00015D34j
		rts
; ---------------------------------------------------------------------------

loc_15DE6:					  ; CODE XREF: ROM:00015CFAj
		add.w	$00000006(a1),d1
		sub.w	(a1),d2
		sub.w	$00000004(a1),d3
		add.w	$00000002(a1),d4

loc_15DF4:					  ; CODE XREF: ROM:00015EA2j
		move.b	(a5),d5
		bmi.w	locret_15EA6
		cmpi.b	#$7F,d5
		beq.w	loc_15E9E
		move.b	$0000000C(a5),d0
		andi.b	#$82,d0
		cmpi.b	#$80,d0
		bne.w	loc_15E9E
		cmp.w	$0000001E(a5),d2
		bhi.w	loc_15E9E
		cmp.w	$0000001C(a5),d1
		bcs.s	loc_15E9E
		cmp.w	$0000001A(a5),d3
		bhi.s	loc_15E9E
		cmp.w	$00000018(a5),d4
		bcs.s	loc_15E9E
		cmp.w	$00000054(a5),d6
		bcc.s	loc_15E9E
		addi.w	#$001F,d6
		cmp.w	$00000012(a5),d6
		bcc.s	loc_15E42

loc_15E3C:					  ; CODE XREF: ROM:00015E56j
		subi.w	#$001F,d6
		bra.s	loc_15E9E
; ---------------------------------------------------------------------------

loc_15E42:					  ; CODE XREF: ROM:00015E3Aj
		btst	#$00,$00000038(a5)
		beq.s	loc_15E58
		bset	#$03,(g_AdditionalFlags+8).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordHit
; ---------------------------------------------------------------------------
		bra.s	loc_15E3C
; ---------------------------------------------------------------------------

loc_15E58:					  ; CODE XREF: ROM:00015E48j
		move.w	$0000007C(a5),d0
		bsr.w	CalculatePlayerDamageOutput
		sub.w	d0,$0000003E(a5)
		bhi.s	loc_15E6C
		bsr.w	sub_16134
		bra.s	loc_15E9E
; ---------------------------------------------------------------------------

loc_15E6C:					  ; CODE XREF: ROM:00015E64j
		bsr.w	sub_1602A
		move.w	#$000A,$00000034(a5)
		cmpi.b	#$11,$0000000B(a5)
		bne.s	loc_15E86
		move.w	#$0268,$00000034(a5)
		bra.s	loc_15E94
; ---------------------------------------------------------------------------

loc_15E86:					  ; CODE XREF: ROM:00015E7Cj
		cmpi.b	#$04,$0000000B(a5)
		bne.s	loc_15E94
		move.w	#$0364,$00000034(a5)

loc_15E94:					  ; CODE XREF: ROM:00015E84j
						  ; ROM:00015E8Cj
		jsr	(j_LoadSpriteBehaviour).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_EnemyHit1
; ---------------------------------------------------------------------------

loc_15E9E:					  ; CODE XREF: ROM:00015DFEj
						  ; ROM:00015E0Ej ...
		lea	$00000080(a5),a5
		dbf	d7,loc_15DF4

locret_15EA6:					  ; CODE XREF: ROM:00015DF6j
		rts
; ---------------------------------------------------------------------------

loc_15EA8:					  ; CODE XREF: ROM:00015D02j
		sub.w	$00000006(a1),d1
		add.w	(a1),d2
		sub.w	$00000004(a1),d3
		add.w	$00000002(a1),d4

loc_15EB6:					  ; CODE XREF: ROM:00015F64j
		move.b	(a5),d5
		bmi.w	locret_15F68
		cmpi.b	#$7F,d5
		beq.w	loc_15F60
		move.b	$0000000C(a5),d0
		andi.b	#$82,d0
		cmpi.b	#$80,d0
		bne.w	loc_15F60
		cmp.w	$0000001C(a5),d2
		bcs.w	loc_15F60
		cmp.w	$0000001E(a5),d1
		bhi.s	loc_15F60
		cmp.w	$0000001A(a5),d3
		bhi.s	loc_15F60
		cmp.w	$00000018(a5),d4
		bcs.s	loc_15F60
		cmp.w	$00000054(a5),d6
		bcc.s	loc_15F60
		addi.w	#$001F,d6
		cmp.w	$00000012(a5),d6
		bcc.s	loc_15F04

loc_15EFE:					  ; CODE XREF: ROM:00015F18j
		subi.w	#$001F,d6
		bra.s	loc_15F60
; ---------------------------------------------------------------------------

loc_15F04:					  ; CODE XREF: ROM:00015EFCj
		btst	#$00,$00000038(a5)
		beq.s	loc_15F1A
		bset	#$03,(g_AdditionalFlags+8).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordHit
; ---------------------------------------------------------------------------
		bra.s	loc_15EFE
; ---------------------------------------------------------------------------

loc_15F1A:					  ; CODE XREF: ROM:00015F0Aj
		move.w	$0000007C(a5),d0
		bsr.w	CalculatePlayerDamageOutput
		sub.w	d0,$0000003E(a5)
		bhi.s	loc_15F2E
		bsr.w	sub_16134
		bra.s	loc_15F60
; ---------------------------------------------------------------------------

loc_15F2E:					  ; CODE XREF: ROM:00015F26j
		bsr.w	sub_1602A
		move.w	#$000C,$00000034(a5)
		cmpi.b	#$11,$0000000B(a5)
		bne.s	loc_15F48
		move.w	#$0268,$00000034(a5)
		bra.s	loc_15F56
; ---------------------------------------------------------------------------

loc_15F48:					  ; CODE XREF: ROM:00015F3Ej
		cmpi.b	#$04,$0000000B(a5)
		bne.s	loc_15F56
		move.w	#$0364,$00000034(a5)

loc_15F56:					  ; CODE XREF: ROM:00015F46j
						  ; ROM:00015F4Ej
		jsr	(j_LoadSpriteBehaviour).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_EnemyHit1
; ---------------------------------------------------------------------------

loc_15F60:					  ; CODE XREF: ROM:00015EC0j
						  ; ROM:00015ED0j ...
		lea	$00000080(a5),a5
		dbf	d7,loc_15EB6

locret_15F68:					  ; CODE XREF: ROM:00015EB8j
		rts
; ---------------------------------------------------------------------------

loc_15F6A:					  ; CODE XREF: ROM:00015D06j
		sub.w	$00000004(a1),d1
		add.w	$00000002(a1),d2
		sub.w	$00000006(a1),d3
		add.w	(a1),d4

loc_15F78:					  ; CODE XREF: ROM:00016024j
		move.b	(a5),d5
		bmi.w	locret_16028
		cmpi.b	#$7F,d5
		beq.w	loc_16020
		move.b	$0000000C(a5),d0
		andi.b	#$82,d0
		cmpi.b	#$80,d0
		bne.w	loc_16020
		cmp.w	$0000001C(a5),d2
		bcs.w	loc_16020
		cmp.w	$0000001E(a5),d1
		bhi.s	loc_16020
		cmp.w	$0000001A(a5),d3
		bhi.s	loc_16020
		cmp.w	$00000018(a5),d4
		bcs.s	loc_16020
		cmp.w	$00000054(a5),d6
		bcc.s	loc_16020
		addi.w	#$001F,d6
		cmp.w	$00000012(a5),d6
		bcc.s	loc_15FC6

loc_15FC0:					  ; CODE XREF: ROM:00015FDAj
		subi.w	#$001F,d6
		bra.s	loc_16020
; ---------------------------------------------------------------------------

loc_15FC6:					  ; CODE XREF: ROM:00015FBEj
		btst	#$00,$00000038(a5)
		beq.s	loc_15FDC
		bset	#$03,(g_AdditionalFlags+8).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordHit
; ---------------------------------------------------------------------------
		bra.s	loc_15FC0
; ---------------------------------------------------------------------------

loc_15FDC:					  ; CODE XREF: ROM:00015FCCj
		move.w	$0000007C(a5),d0
		bsr.w	CalculatePlayerDamageOutput
		sub.w	d0,$0000003E(a5)
		bhi.s	loc_15FF0
		bsr.w	sub_16134
		bra.s	loc_16020
; ---------------------------------------------------------------------------

loc_15FF0:					  ; CODE XREF: ROM:00015FE8j
		bsr.s	sub_1602A
		move.w	#$000B,$00000034(a5)
		cmpi.b	#$11,$0000000B(a5)
		bne.s	loc_16008
		move.w	#$0268,$00000034(a5)
		bra.s	loc_16016
; ---------------------------------------------------------------------------

loc_16008:					  ; CODE XREF: ROM:00015FFEj
		cmpi.b	#$04,$0000000B(a5)
		bne.s	loc_16016
		move.w	#$0364,$00000034(a5)

loc_16016:					  ; CODE XREF: ROM:00016006j
						  ; ROM:0001600Ej
		jsr	(j_LoadSpriteBehaviour).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_EnemyHit1
; ---------------------------------------------------------------------------

loc_16020:					  ; CODE XREF: ROM:00015F82j
						  ; ROM:00015F92j ...
		lea	$00000080(a5),a5
		dbf	d7,loc_15F78

locret_16028:					  ; CODE XREF: ROM:00015F7Aj
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1602A:					  ; CODE XREF: ROM:loc_15DAAp
						  ; ROM:loc_15E6Cp ...
		bset	#$05,QueuedAction(a5)
		clr.b	ChestIndex(a5)
		bset	#$01,Flags2(a5)
		andi.b	#$F8,Unk48(a5)
		move.b	(g_SwordCharge).l,d0
		beq.s	locret_16074
		cmpi.b	#$01,d0
		bne.s	loc_16056
		bset	#$00,Unk48(a5)
		bra.s	locret_16074
; ---------------------------------------------------------------------------

loc_16056:					  ; CODE XREF: sub_1602A+22j
		cmpi.b	#$03,d0
		bne.s	loc_16064
		bset	#$02,Unk48(a5)
		bra.s	locret_16074
; ---------------------------------------------------------------------------

loc_16064:					  ; CODE XREF: sub_1602A+30j
		cmpi.b	#$02,d0
		bne.s	loc_16072
		bset	#$01,Unk48(a5)
		bra.s	locret_16074
; ---------------------------------------------------------------------------

loc_16072:					  ; CODE XREF: sub_1602A+3Ej
		nop

locret_16074:					  ; CODE XREF: sub_1602A+1Cj
						  ; sub_1602A+2Aj ...
		rts
; End of function sub_1602A


; =============== S U B	R O U T	I N E =======================================


sub_16076:					  ; DATA XREF: sub_103C4t
		lea	(Sprite1_X).l,a5
		moveq	#$0000000E,d7

loc_1607E:					  ; CODE XREF: sub_16076+32j
		move.b	(a5),d5
		bmi.s	loc_160AC
		cmpi.b	#$7F,d5
		beq.s	loc_160A4
		move.b	Flags2(a5),d0
		andi.b	#$82,d0
		cmpi.b	#$80,d0
		bne.s	loc_160A4
		cmpi.w	#$0001,InitFlags4_DropProbability(a5)
		bne.s	loc_160B0
		tst.b	GoldOrChestContents(a5)
		bne.s	loc_160B0

loc_160A4:					  ; CODE XREF: sub_16076+10j
						  ; sub_16076+1Ej
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,loc_1607E

loc_160AC:					  ; CODE XREF: sub_16076+Aj
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_160B0:					  ; CODE XREF: sub_16076+26j
						  ; sub_16076+2Cj
		ori	#$01,ccr
		rts
; End of function sub_16076

; ---------------------------------------------------------------------------

loc_160B6:					  ; CODE XREF: ROM:00015CBCj
						  ; ROM:00015CD8j
		clr.b	d6

loc_160B8:					  ; CODE XREF: ROM:0001611Aj
		move.b	(a5),d5
		bmi.w	loc_1611E		  ; Lava Room
		cmpi.b	#$7F,d5
		beq.s	loc_16116
		move.b	$0000000C(a5),d0
		andi.b	#$82,d0
		cmpi.b	#$80,d0
		bne.s	loc_16116
		cmpi.w	#$0001,$00000078(a5)
		bne.s	loc_160E0
		tst.b	$00000036(a5)
		beq.s	loc_16116

loc_160E0:					  ; CODE XREF: ROM:000160D8j
		tst.l	$0000000E(a5)
		beq.s	loc_16112
		btst	#$00,$00000038(a5)
		bne.s	loc_16112
		move.w	$0000007C(a5),d0
		bsr.w	CalculatePlayerDamageOutput
		sub.w	d0,$0000003E(a5)
		bhi.s	loc_16102
		bsr.w	sub_16134
		bra.s	loc_16112
; ---------------------------------------------------------------------------

loc_16102:					  ; CODE XREF: ROM:000160FAj
		bsr.w	sub_1602A
		move.w	#$00E3,BehaviourLUTIndex(a5)
		jsr	(j_LoadSpriteBehaviour).l

loc_16112:					  ; CODE XREF: ROM:000160E4j
						  ; ROM:000160ECj ...
		move.b	#$01,d6

loc_16116:					  ; CODE XREF: ROM:000160C2j
						  ; ROM:000160D0j ...
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,loc_160B8

loc_1611E:					  ; CODE XREF: ROM:000160BAj
		cmpi.w	#$020A,(g_RmNum1).l	  ; Lava Room
		beq.s	loc_1612C
		tst.b	d6
		beq.s	locret_16132

loc_1612C:					  ; CODE XREF: ROM:00016126j
		bsr.w	GaiaEffect
		rts
; ---------------------------------------------------------------------------

locret_16132:					  ; CODE XREF: ROM:0001612Aj
		rts

; =============== S U B	R O U T	I N E =======================================


sub_16134:					  ; CODE XREF: ROM:00015DA4p
						  ; ROM:00015E66p ...
		andi.b	#$7F,Flags2(a5)
		clr.w	BehavParam(a5)
		bset	#$02,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		clr.b	Unk4D(a5)
		cmpi.b	#SPR_MUMMY3,SpriteType(a5)
		bne.s	locret_1616C
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcs.s	locret_1616C
		move.b	#$01,Unk4D(a5)
		andi.b	#$7F,InitFlags2(a5)

locret_1616C:					  ; CODE XREF: sub_16134+1Aj
						  ; sub_16134+2Aj
		rts
; End of function sub_16134

; ---------------------------------------------------------------------------

loc_1616E:					  ; CODE XREF: ROM:00015CB0j
		bsr.w	sub_161E8
		tst.b	d6
		beq.w	locret_161E6
		jsr	(sub_19288).l
		bcs.w	locret_161E6
		move.w	(Player_X).l,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		beq.s	loc_161A2
		cmpi.b	#$80,d1
		bcs.s	loc_161A6
		beq.s	loc_161AC
		subi.w	#$0200,d0
		bra.s	loc_161AE
; ---------------------------------------------------------------------------

loc_161A2:					  ; CODE XREF: ROM:00016192j
		subq.b	#$02,d0
		bra.s	loc_161AE
; ---------------------------------------------------------------------------

loc_161A6:					  ; CODE XREF: ROM:00016198j
		addi.w	#$0200,d0
		bra.s	loc_161AE
; ---------------------------------------------------------------------------

loc_161AC:					  ; CODE XREF: ROM:0001619Aj
		addq.b	#$02,d0

loc_161AE:					  ; CODE XREF: ROM:000161A0j
						  ; ROM:000161A4j ...
		move.w	d0,(a1)
		move.b	d1,$00000004(a1)
		move.b	#$78,d2
		move.w	(Player_Z).l,d3
		addi.w	#$0010,d3
		move.w	d3,$00000012(a1)
		move.w	(Player_SubX).l,$00000002(a1)
		move.w	#$47C0,$00000006(a1)
		move.w	#$013C,$00000034(a1)
		move.b	#$04,$00000009(a1)
		jsr	(sub_192B6).l

locret_161E6:					  ; CODE XREF: ROM:00016174j
						  ; ROM:0001617Ej
		rts

; =============== S U B	R O U T	I N E =======================================


sub_161E8:					  ; CODE XREF: ROM:loc_1616Ep
		clr.b	d6

loc_161EA:					  ; CODE XREF: sub_161E8+32j
		move.b	(a5),d5
		bmi.w	locret_1621E
		cmpi.b	#$7F,d5
		beq.s	loc_16216
		move.b	Flags2(a5),d0
		andi.b	#$82,d0
		cmpi.b	#$80,d0
		bne.s	loc_16216
		cmpi.w	#$0001,InitFlags4_DropProbability(a5)
		bne.s	loc_16212
		tst.b	GoldOrChestContents(a5)
		beq.s	loc_16216

loc_16212:					  ; CODE XREF: sub_161E8+22j
		move.b	#$01,d6

loc_16216:					  ; CODE XREF: sub_161E8+Cj
						  ; sub_161E8+1Aj ...
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,loc_161EA

locret_1621E:					  ; CODE XREF: sub_161E8+4j
		rts
; End of function sub_161E8


; =============== S U B	R O U T	I N E =======================================


sub_16220:					  ; DATA XREF: sub_10358t

; FUNCTION CHUNK AT 0001638E SIZE 00000092 BYTES

		lea	(Sprite1_X).l,a5
		moveq	#$0000000E,d7

loc_16228:					  ; CODE XREF: sub_16220+22j
		tst.w	(a5)
		bmi.s	locret_16246
		bclr	#$02,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		beq.s	loc_1623E
		tst.b	Unk4D(a5)
		bne.w	loc_1638E
		bsr.s	loc_16248

loc_1623E:					  ; CODE XREF: sub_16220+12j
						  ; sub_16220+1F2j ...
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,loc_16228

locret_16246:					  ; CODE XREF: sub_16220+Aj
		rts
; End of function sub_16220

; ---------------------------------------------------------------------------

loc_16248:					  ; CODE XREF: sub_16220+1Cp
		tst.b	(g_Flags+5).l
		bmi.w	loc_1637A
		move.w	InitFlags4_DropProbability(a5),d6
		cmpi.w	#$0001,d6
		bne.s	loc_16284
		tst.b	GoldOrChestContents(a5)
		bne.s	loc_16284
		btst	#$00,(g_Flags+3).l
		beq.s	loc_16276
		bsr.w	sub_1A56A

loc_16270:					  ; CODE XREF: ROM:000162DCj
		jmp	(j_HideSprite).l
; ---------------------------------------------------------------------------

loc_16276:					  ; CODE XREF: ROM:0001626Aj
		bset	#$07,Flags2(a5)
		move.w	#$0100,CurrentHealth(a5)
		rts
; ---------------------------------------------------------------------------

loc_16284:					  ; CODE XREF: ROM:0001625Aj
						  ; ROM:00016260j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_EnemyDie1
; ---------------------------------------------------------------------------
		tst.w	d6
		beq.s	loc_162D8
		jsr	(j_GenerateRandomNumber).l
		tst.w	d7
		bne.s	loc_162D8
		lea	(Sprite1_X).l,a0
		moveq	#$0000000E,d7

loc_1629E:					  ; CODE XREF: ROM:000162B4j
		move.b	(a0),d0
		bmi.s	loc_162B8
		cmpi.b	#$7F,d0
		beq.s	loc_162B0
		cmpi.b	#SpriteB_ItemBox,SpriteGraphic(a0)
		beq.s	loc_162D8

loc_162B0:					  ; CODE XREF: ROM:000162A6j
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,loc_1629E

loc_162B8:					  ; CODE XREF: ROM:000162A0j
		move.b	ItemDrop(a5),d0
		jsr	(j_GetRemainingItemAllowedCount).l
		tst.w	d1
		beq.s	loc_162D8
		move.w	#$0060,Dialogue(a5)
		move.b	#SpriteB_ItemBox,SpriteGraphic(a5)
		clr.b	GoldOrChestContents(a5)
		bra.s	loc_162EC
; ---------------------------------------------------------------------------

loc_162D8:					  ; CODE XREF: ROM:0001628Aj
						  ; ROM:00016294j ...
		tst.b	GoldOrChestContents(a5)
		beq.w	loc_16270
		move.w	#$000A,Dialogue(a5)
		move.b	#SpriteB_Moneybag,SpriteGraphic(a5)

loc_162EC:					  ; CODE XREF: ROM:000162D6j
		move.w	#$002D,BehavParam(a5)
		cmpi.b	#$10,Height(a5)
		bcc.s	loc_16308

loc_162FA:					  ; CODE XREF: ROM:00016314j
		move.w	Z(a5),d0
		addi.w	#Unk0F,d0
		move.w	d0,HitBoxZEnd(a5)
		bra.s	loc_1631A
; ---------------------------------------------------------------------------

loc_16308:					  ; CODE XREF: ROM:000162F8j
		move.w	HitBoxZEnd(a5),d0
		subi.w	#$000F,d0
		cmp.b	FloorHeight(a5),d0
		bcs.s	loc_162FA
		move.w	d0,Z(a5)

loc_1631A:					  ; CODE XREF: ROM:00016306j
		move.b	#$08,RotationAndSize(a5)
		move.b	#$10,Height(a5)
		clr.l	BehaviourLUTPtr(a5)
		clr.w	CurrentHealth(a5)
		clr.b	Flags4(a5)		  ; Bit	0 = Invincible / Solid
		clr.w	FallRate(a5)
		andi.b	#$7F,Flags2(a5)
		andi.b	#$3F,RotationAndSize(a5)
		bset	#$07,Unk0A(a5)
		bset	#$07,Unk48(a5)
		andi.b	#$9F,TileSource(a5)
		ori.b	#$40,TileSource(a5)
		clr.w	AnimationIndex(a5)
		clr.w	AnimationFrame(a5)
		bset	#$00,Flags2(a5)
		bclr	#$06,Flags2(a5)
		movea.l	a5,a1
		bsr.w	LookupSpriteAnimFlags
		bsr.w	sub_19AC8

locret_16378:					  ; CODE XREF: ROM:00015C80j
		rts
; ---------------------------------------------------------------------------

loc_1637A:					  ; CODE XREF: ROM:0001624Ej
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_EnemyDie1
; ---------------------------------------------------------------------------
		andi.b	#$7F,Flags2(a5)
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_16220

loc_1638E:					  ; CODE XREF: sub_16220+18j
		move.w	#$0300,QueuedAction(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$08,Unk4D(a5)
		bcs.w	loc_16416
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$10,Unk4D(a5)
		bcs.w	loc_16416
		move.w	#$0500,QueuedAction(a5)
		cmpi.b	#$20,Unk4D(a5)
		bcs.w	loc_16416
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$28,Unk4D(a5)
		bcs.w	loc_16416
		move.w	#$0300,QueuedAction(a5)
		cmpi.b	#$30,Unk4D(a5)
		bcs.w	loc_16416
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$38,Unk4D(a5)
		bcs.w	loc_16416
		ori.b	#$80,Flags2(a5)
		ori.b	#$80,InitFlags2(a5)
		move.w	MaxHealth(a5),CurrentHealth(a5)
		movem.w	d7,-(sp)
		jsr	(sub_1A440C).l
		movem.w	(sp)+,d7
		bra.w	loc_1623E
; ---------------------------------------------------------------------------

loc_16416:					  ; CODE XREF: sub_16220+17Ej
						  ; sub_16220+18Ej ...
		bset	#$02,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bra.w	loc_1623E
; END OF FUNCTION CHUNK	FOR sub_16220

; =============== S U B	R O U T	I N E =======================================


sub_16420:					  ; DATA XREF: sub_1034Ct

; FUNCTION CHUNK AT 00016512 SIZE 0000006C BYTES

		tst.b	(g_PlayerAnimation).l
		bne.w	locret_164E4
		tst.b	(byte_FF1142).l
		bne.w	loc_16512
		move.b	(byte_FF1143).l,d1
		beq.w	locret_164E4
		movem.w	d1,-(sp)
		lea	(Player_X).l,a5
		bsr.w	CalculateEnemyDamageOutput
		bsr.w	RemoveHealth
		movem.w	(sp)+,d1
		tst.w	CurrentHealth(a5)
		beq.w	PlayerDeath
		btst	#STATUS_PARALYSIS,(g_PlayerStatus).l
		beq.s	loc_1648A
		move.b	(g_ParalysisCheckCount).l,d0
		addq.b	#$02,(g_ParalysisCheckCount).l
		ext.w	d0
		move.w	ParalysisClearChance(pc,d0.w),d6
		jsr	(j_GenerateRandomNumber).l
		tst.w	d7
		bne.s	loc_1648A
		move.b	#STATUS_PARALYSIS,d0
		bsr.w	ClearPlayerStatus

loc_1648A:					  ; CODE XREF: sub_16420+44j
						  ; sub_16420+60j
		tst.b	d1
		bmi.s	loc_164B0
		andi.b	#$03,d1
		eori.b	#$02,d1
		andi.b	#$3F,(Player_RotationAndSize).l
		move.b	d1,d0
		lsl.b	#$06,d0
		or.b	d0,(Player_RotationAndSize).l
		bra.s	loc_164B8
; ---------------------------------------------------------------------------
ParalysisClearChance:				  ; DATA XREF: sub_16420+54r
		dc.w $0003
		dc.w $0002
		dc.w $0001
; ---------------------------------------------------------------------------

loc_164B0:					  ; CODE XREF: sub_16420+6Cj
		move.b	(Player_RotationAndSize).l,d1
		lsr.b	#$06,d1

loc_164B8:					  ; CODE XREF: sub_16420+88j
		ext.w	d1
		move.b	DamageRecoilCmd(pc,d1.w),d0
		bsr.w	PlaybackInput
		move.b	#$01,(byte_FF1142).l
		bset	#$05,(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_NigelHit1
; ---------------------------------------------------------------------------
		bset	#$01,(Player_Flags2).l
		clr.b	(byte_FF1143).l

locret_164E4:					  ; CODE XREF: sub_16420+6j
						  ; sub_16420+1Aj
		rts
; End of function sub_16420

; ---------------------------------------------------------------------------
DamageRecoilCmd:dc.b $07, $05, $06, $04		  ; DATA XREF: sub_16420+9Ar
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_16602

PlayerDeath:					  ; CODE XREF: sub_16420+38j
						  ; sub_16602+58j
						  ; DATA XREF: ...
		clr.b	(byte_FF1142).l
		clr.b	(byte_FF1143).l
		move.b	#$01,(g_PlayerAnimation).l
		move.b	#$08,d0
		bsr.w	PlaybackInput
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_NigelDie
; ---------------------------------------------------------------------------
		clr.b	(g_PlayerStatus).l
; END OF FUNCTION CHUNK	FOR sub_16602
		rts
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_16420

loc_16512:					  ; CODE XREF: sub_16420+10j
		clr.b	(byte_FF1143).l
		addq.b	#$01,(byte_FF1142).l
		cmpi.b	#$02,(byte_FF1142).l
		bne.s	loc_16532
		bset	#$00,(Player_Flags2).l
		rts
; ---------------------------------------------------------------------------

loc_16532:					  ; CODE XREF: sub_16420+106j
		cmpi.b	#$10,(byte_FF1142).l
		bcs.s	locret_1657C
		bne.s	loc_16550
		andi.b	#$F8,(Player_Unk48).l
		bclr	#$00,(Player_Flags2).l
		rts
; ---------------------------------------------------------------------------

loc_16550:					  ; CODE XREF: sub_16420+11Cj
		cmpi.b	#$40,(byte_FF1142).l
		bne.s	loc_16568
		clr.b	(byte_FF1142).l
		bclr	#$01,(Player_Flags2).l

loc_16568:					  ; CODE XREF: sub_16420+138j
		move.b	(Player_Unk48).l,d0
		andi.b	#$07,d0
		bne.s	locret_1657C
		bchg	#$06,(Player_Flags2).l

locret_1657C:					  ; CODE XREF: sub_16420+11Aj
						  ; sub_16420+152j
		rts
; END OF FUNCTION CHUNK	FOR sub_16420

; =============== S U B	R O U T	I N E =======================================


CalculatePlayerDamageOutput:			  ; CODE XREF: ROM:00015D9Ap
						  ; ROM:00015E5Cp ...
		movem.w	d1/d6-d7,-(sp)
		move.w	d0,d1
		move.w	(Player_MaxHealth).l,d0
		lsr.w	#$02,d0
		sub.w	d1,d0
		bmi.s	loc_16596
		cmpi.w	#$0100,d0
		bcc.s	loc_1659A

loc_16596:					  ; CODE XREF: CalculatePlayerDamageOutput+10j
		move.w	#$0100,d0

loc_1659A:					  ; CODE XREF: CalculatePlayerDamageOutput+16j
		move.w	d0,d1
		lsr.w	#$08,d0
		move.w	#$0060,d6
		jsr	(j_GenerateRandomNumber).l
		mulu.w	d7,d0
		add.w	d1,d0
		move.b	(g_SwordCharge).l,d1
		beq.s	loc_165C2
		ext.w	d1
		add.b	d1,d1
		move.w	(MagicSwordBoost-2)(pc,d1.w),d1
		mulu.w	d1,d0
		divu.w	#$0100,d0

loc_165C2:					  ; CODE XREF: CalculatePlayerDamageOutput+34j
		movem.w	(sp)+,d1/d6-d7
		rts
; End of function CalculatePlayerDamageOutput

; ---------------------------------------------------------------------------
MagicSwordBoost:dc.w $01C0, $0180, $0200, $0140	  ; DATA XREF: CalculatePlayerDamageOutput+3At

; =============== S U B	R O U T	I N E =======================================


CalculateEnemyDamageOutput:			  ; CODE XREF: sub_16420+28p
		movem.w	d1/d6-d7,-(sp)
		moveq	#$00000000,d0
		move.w	(Player_AttackStrength).l,d0
		beq.w	loc_165FC
		move.w	(Player_Defence).l,d1
		mulu.w	d1,d0
		lsr.l	#$08,d0
		move.w	d0,d1
		lsr.w	#$08,d0
		move.w	#$0060,d6
		jsr	(j_GenerateRandomNumber).l
		mulu.w	d7,d0
		add.w	d1,d0

loc_165FC:					  ; CODE XREF: CalculateEnemyDamageOutput+Cj
		movem.w	(sp)+,d1/d6-d7
		rts
; End of function CalculateEnemyDamageOutput


; =============== S U B	R O U T	I N E =======================================


sub_16602:					  ; DATA XREF: sub_10380t

; FUNCTION CHUNK AT 000164EA SIZE 00000026 BYTES

		cmpi.b	#$01,(Player_Unk0A).l
		beq.w	locret_166DE
		move.b	(g_PlayerStatus).l,d0
		andi.b	#$11,d0
		cmpi.b	#STATUS_CONFUSION,d0
		bne.s	loc_1667C
		move.b	(Player_Action+1).l,d0	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		andi.b	#$0F,d0
		beq.s	loc_1667C
		cmpi.b	#$01,(g_PlayerSpeed+1).l
		beq.s	loc_1667C
		move.b	(byte_FF1148).l,d0
		addq.b	#$01,(byte_FF1148).l
		andi.b	#$7F,d0
		bne.s	loc_1667C
		move.w	#$0100,d0
		lea	(Player_X).l,a5
		bsr.w	RemoveHealth
		tst.w	(Player_CurrentHealth).l
		beq.w	PlayerDeath
		lea	(g_Pal0Active).l,a0
		moveq	#$0000000F,d7

loc_16666:					  ; CODE XREF: sub_16602+68j
		move.w	#$0EEE,(a0)+
		dbf	d7,loc_16666
		jsr	(j_QueueFullPaletteDMA).l
		subq.b	#$01,(byte_FF1149).l
		beq.s	loc_166E0

loc_1667C:					  ; CODE XREF: sub_16602+1Aj
						  ; sub_16602+26j ...
		btst	#STATUS_PARALYSIS,(g_PlayerStatus).l
		beq.s	loc_16696
		subq.w	#$01,(word_FF12E2).l
		bne.s	loc_16696
		move.b	#STATUS_PARALYSIS,d0
		bsr.w	ClearPlayerStatus

loc_16696:					  ; CODE XREF: sub_16602+82j
						  ; sub_16602+8Aj
		cmpi.b	#ITM_HEALINGBOOTS,(g_EquippedBoots).l
		bne.s	locret_166DE
		move.b	(g_PlayerStatus).l,d0
		andi.b	#$10,d0
		bne.s	locret_166DE
		move.b	(Player_Action+1).l,d0	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		andi.b	#$0F,d0
		beq.s	locret_166DE
		cmpi.b	#$01,(g_PlayerSpeed+1).l
		beq.s	locret_166DE
		move.b	(g_StepCounter).l,d0
		addq.b	#$01,(g_StepCounter).l
		bne.s	locret_166DE
		move.w	#$0100,d0
		lea	(Player_X).l,a5
		bsr.w	AddHealth

locret_166DE:					  ; CODE XREF: sub_16602+8j
						  ; sub_16602+9Cj ...
		rts
; ---------------------------------------------------------------------------

loc_166E0:					  ; CODE XREF: sub_16602+78j
		clr.b	d0
		bsr.w	ClearPlayerStatus
		bra.s	loc_1667C
; End of function sub_16602


; =============== S U B	R O U T	I N E =======================================


sub_166E8:					  ; DATA XREF: sub_10384t
		tst.w	(g_Pal0Active).l
		beq.s	locret_16710
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		moveq	#$0000000F,d7

loc_166FE:					  ; CODE XREF: sub_166E8+18j
		move.w	(a0)+,(a1)+
		dbf	d7,loc_166FE
		jsr	(j_QueueFullPaletteDMA).l
		jsr	(j_FlushDMACopyQueue).l

locret_16710:					  ; CODE XREF: sub_166E8+6j
		rts
; End of function sub_166E8


; =============== S U B	R O U T	I N E =======================================


GaiaEffect:					  ; CODE XREF: ROM:loc_1612Cp
		move.b	(g_EquippedSword).l,d0
		movem.w	d0,-(sp)
		move.b	#ITM_GAIASWORD,(g_EquippedSword).l
		jsr	(j_LoadMagicSwordGfx).l
		jsr	(j_UpdateEquipPal).l
		jsr	(j_CopyBasePalleteToActivePalette).l
		move.w	(g_VSRAMData).l,d0
		move.w	(g_VSRAMData+2).l,d1
		movem.w	d0-d1,-(sp)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Rumble
; ---------------------------------------------------------------------------
		bsr.s	sub_16794
		move.b	#$10,(g_VDPSpr15_Link).l
		move.b	#$4F,(g_VDPSpr78_Link).l
		movem.w	(sp)+,d0-d1
		move.w	d0,(g_VSRAMData).l
		move.w	d1,(g_VSRAMData+2).l
		jsr	(j_QueueVSRAMUpdate).l
		movem.w	(sp)+,d0
		move.b	d0,(g_EquippedSword).l
		jsr	(j_LoadMagicSwordGfx).l
		jsr	(j_UpdateEquipPal).l
		jsr	(j_CopyBasePalleteToActivePalette).l
		jmp	(j_FlushDMACopyQueue).l
; End of function GaiaEffect


; =============== S U B	R O U T	I N E =======================================


sub_16794:					  ; CODE XREF: GaiaEffect+38p
		lea	(g_VDPSpr16_Y).l,a0
		move.b	#$10,d3
		move.w	#$003E,d7

loc_167A2:					  ; CODE XREF: sub_16794+16j
		tst.w	(a0)
		beq.s	loc_167B0
		addq.b	#$01,d3
		addq.w	#$08,a0
		dbf	d7,loc_167A2
		rts
; ---------------------------------------------------------------------------

loc_167B0:					  ; CODE XREF: sub_16794+10j
		cmpi.b	#$28,d7
		bcs.s	loc_167BA
		move.b	#$28,d7

loc_167BA:					  ; CODE XREF: sub_16794+20j
		move.b	d3,(g_VDPSpr15_Link).l
		bsr.s	sub_167D6

loc_167C2:					  ; CODE XREF: sub_16794+40j
		bsr.w	sub_16848
		bsr.w	sub_1685E
		jsr	(j_FlushDMACopyQueue).l
		bsr.w	sub_168F4
		bra.s	loc_167C2
; End of function sub_16794


; =============== S U B	R O U T	I N E =======================================


sub_167D6:					  ; CODE XREF: sub_16794+2Cp
		movea.l	a0,a1
		move.w	d7,d6
		move.w	#$C78C,d0
		clr.b	d1
		move.w	#$0004,d4
		clr.b	d5
		movem.w	d6-d7,-(sp)

loc_167EA:					  ; CODE XREF: sub_167D6+5Cj
		movem.w	d7,-(sp)
		move.w	#$00E0,d6
		jsr	(j_GenerateRandomNumber).l
		subi.w	#$0060,d7
		move.w	d7,(a0)
		move.b	#$0F,$00000002(a0)
		move.w	d0,$00000004(a0)
		move.w	#$0140,d6
		jsr	(j_GenerateRandomNumber).l
		addi.w	#$0080,d7
		move.w	d7,$00000006(a0)
		addi.w	#$0010,d0
		addq.b	#$01,d1
		cmpi.b	#$03,d1
		bcs.s	loc_1682C
		clr.b	d1
		subi.w	#$0030,d0

loc_1682C:					  ; CODE XREF: sub_167D6+4Ej
		addq.w	#$08,a0
		movem.w	(sp)+,d7
		dbf	d7,loc_167EA
		movem.w	(sp)+,d6-d7
		move.w	#$0001,-$00000008(a0)
		move.b	#$10,-$00000005(a0)
		rts
; End of function sub_167D6


; =============== S U B	R O U T	I N E =======================================


sub_16848:					  ; CODE XREF: sub_16794:loc_167C2p
		add.w	d4,(g_VSRAMData).l
		add.w	d4,(g_VSRAMData+2).l
		jsr	(j_QueueVSRAMUpdate).l
		neg.w	d4
		rts
; End of function sub_16848


; =============== S U B	R O U T	I N E =======================================


sub_1685E:					  ; CODE XREF: sub_16794+32p
		movea.l	a1,a0
		move.w	d6,d7
		clr.b	d0

loc_16864:					  ; CODE XREF: sub_1685E+6Aj
		tst.l	$00000004(a0)
		beq.s	loc_168C6
		move.w	#$0007,d1
		cmpi.w	#$C78C,$00000004(a0)
		beq.s	loc_16886
		move.w	#$0005,d1
		cmpi.w	#$C79C,$00000004(a0)
		beq.s	loc_16886
		move.w	#$0003,d1

loc_16886:					  ; CODE XREF: sub_1685E+16j
						  ; sub_1685E+22j
		add.w	d1,(a0)
		tst.w	(a0)
		bmi.s	loc_168C6
		cmpi.w	#$0138,(a0)
		bcs.s	loc_168C6
		cmpi.b	#$02,d5
		bne.s	loc_168A8
		clr.w	(a0)
		clr.b	$00000002(a0)
		clr.w	$00000004(a0)
		clr.w	$00000006(a0)
		bra.s	loc_168C6
; ---------------------------------------------------------------------------

loc_168A8:					  ; CODE XREF: sub_1685E+38j
		move.w	#$0088,(a0)
		movem.w	d6-d7,-(sp)
		move.w	#$0140,d6
		jsr	(j_GenerateRandomNumber).l
		addi.w	#$0080,d7
		move.w	d7,$00000006(a0)
		movem.w	(sp)+,d6-d7

loc_168C6:					  ; CODE XREF: sub_1685E+Aj
						  ; sub_1685E+2Cj ...
		addq.w	#$08,a0
		dbf	d7,loc_16864
		cmpi.w	#$00F8,-$00000008(a0)
		bcs.s	locret_168F2
		move.w	#$0001,-$00000008(a0)
		addq.b	#$01,d5
		cmpi.b	#$02,d5
		bcs.s	locret_168F2
		clr.w	-$00000008(a0)
		clr.b	-$00000006(a0)
		clr.w	-$00000004(a0)
		clr.w	-$00000002(a0)

locret_168F2:					  ; CODE XREF: sub_1685E+74j
						  ; sub_1685E+82j
		rts
; End of function sub_1685E


; =============== S U B	R O U T	I N E =======================================


sub_168F4:					  ; CODE XREF: sub_16794+3Cp
		movea.l	a1,a0
		move.w	d6,d7

loc_168F8:					  ; CODE XREF: sub_168F4+Cj
		tst.w	$00000004(a0)
		bne.s	locret_16908
		addq.w	#$08,a0
		dbf	d7,loc_168F8
		movem.l	(sp)+,a0

locret_16908:					  ; CODE XREF: sub_168F4+8j
		rts
; End of function sub_168F4

