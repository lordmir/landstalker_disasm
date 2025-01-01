; ---------------------------------------------------------------------------

EnemyAI_Ifrit_B:				  ; CODE XREF: ROM:001A8692j
		bra.s	EnemyAI_Ifrit
; ---------------------------------------------------------------------------

EnemyAI_Ifrit_A:				  ; CODE XREF: ROM:001A868Ej
		btst	#$01,Flags2(a5)
		bne.s	loc_1AE3B8
		move.b	ChestIndex(a5),d0
		beq.s	EnemyAI_Ifrit
		cmpi.b	#$10,d0
		beq.s	loc_1AE3EC
		bra.w	loc_1AE562
; ---------------------------------------------------------------------------

loc_1AE3B8:					  ; CODE XREF: ROM:001AE3A6j
		clr.b	Speed(a5)
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

EnemyAI_Ifrit:					  ; CODE XREF: ROM:EnemyAI_Ifrit_Bj
						  ; ROM:001AE3ACj
		bsr.s	sub_1AE3C8
		bra.w	loc_1AE4D4

; =============== S U B	R O U T	I N E =======================================


sub_1AE3C8:					  ; CODE XREF: ROM:EnemyAI_Ifritp
						  ; ROM:001AE602j ...
		bclr	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bclr	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; End of function sub_1AE3C8

; ---------------------------------------------------------------------------

loc_1AE3EC:					  ; CODE XREF: ROM:001AE3B2j
		bclr	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1AE41C
		bcs.s	loc_1AE416
		bsr.w	sub_1AE4C4
		bcs.s	loc_1AE416
		bsr.w	sub_1AE4F8
		bcs.s	loc_1AE416
		bsr.w	sub_1AE524

loc_1AE416:					  ; CODE XREF: ROM:001AE404j
						  ; ROM:001AE40Aj ...
		bsr.w	j_j_OnTick
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1AE41C:					  ; CODE XREF: ROM:001AE402p
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00010,d7
		bhi.w	loc_1AE4C0
		move.b	RotationAndSize(a5),d0
		andi.b	#$C0,d0
		cmpi.w	#$1B1D,X(a5)
		beq.s	loc_1AE45C
		cmpi.w	#$221D,X(a5)
		beq.s	loc_1AE472
		cmpi.w	#$1B24,X(a5)
		beq.s	loc_1AE488
		move.w	#$034A,d1
		tst.b	d0
		beq.s	loc_1AE49C
		move.w	#$034D,d1
		cmpi.b	#$C0,d0
		beq.s	loc_1AE49C
		bra.s	loc_1AE4C0
; ---------------------------------------------------------------------------

loc_1AE45C:					  ; CODE XREF: sub_1AE41C+1Ej
		move.w	#$034B,d1
		cmpi.b	#$40,d0
		beq.s	loc_1AE49C
		move.w	#$034C,d1
		cmpi.b	#$80,d0
		beq.s	loc_1AE49C
		bra.s	loc_1AE4C0
; ---------------------------------------------------------------------------

loc_1AE472:					  ; CODE XREF: sub_1AE41C+24j
		move.w	#$034C,d1
		cmpi.b	#$80,d0
		beq.s	loc_1AE49C
		move.w	#$034D,d1
		cmpi.b	#$C0,d0
		beq.s	loc_1AE49C
		bra.s	loc_1AE4C0
; ---------------------------------------------------------------------------

loc_1AE488:					  ; CODE XREF: sub_1AE41C+2Aj
		move.w	#$034B,d1
		cmpi.b	#$40,d0
		beq.s	loc_1AE49C
		move.w	#$034A,d1
		tst.b	d0
		beq.s	loc_1AE49C
		bra.s	loc_1AE4C0
; ---------------------------------------------------------------------------

loc_1AE49C:					  ; CODE XREF: sub_1AE41C+32j
						  ; sub_1AE41C+3Cj ...
		move.b	#$21,ChestIndex(a5)
		move.w	d1,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		bset	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bset	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AE4C0:					  ; CODE XREF: sub_1AE41C+Ej
						  ; sub_1AE41C+3Ej ...
		tst.b	d0
		rts
; End of function sub_1AE41C


; =============== S U B	R O U T	I N E =======================================


sub_1AE4C4:					  ; CODE XREF: ROM:001AE406p
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00020,d7
		bhi.s	loc_1AE4F4

loc_1AE4D4:					  ; CODE XREF: ROM:001AE3C4j
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		bset	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AE4F4:					  ; CODE XREF: sub_1AE4C4+Ej
		tst.b	d0
		rts
; End of function sub_1AE4C4


; =============== S U B	R O U T	I N E =======================================


sub_1AE4F8:					  ; CODE XREF: ROM:001AE40Cp
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00075,d7
		bcc.s	sub_1AE524
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		bsr.s	sub_1AE550
		ori	#$01,ccr
		rts
; End of function sub_1AE4F8


; =============== S U B	R O U T	I N E =======================================


sub_1AE524:					  ; CODE XREF: ROM:001AE412p
						  ; sub_1AE4F8+Ej
		move.w	#$0040,d5
		move.w	#$FFF0,d6
		move.w	#$0010,d7
		move.b	#$24,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		bsr.s	sub_1AE550
		ori	#$01,ccr
		rts
; End of function sub_1AE524

; ---------------------------------------------------------------------------
		tst.b	d0
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1AE550:					  ; CODE XREF: sub_1AE4F8+24p
						  ; sub_1AE524+20p ...
		bsr.w	sub_1AC010
		move.b	d2,d1
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d2,RotationAndSize(a5)
		rts
; End of function sub_1AE550

; ---------------------------------------------------------------------------

loc_1AE562:					  ; CODE XREF: ROM:001AE3B4j
		andi.b	#$0F,d0
		beq.s	locret_1AE582
		cmpi.b	#$01,d0
		beq.s	loc_1AE584
		cmpi.b	#$02,d0
		beq.w	loc_1AE612
		cmpi.b	#$03,d0
		beq.w	loc_1AE6A4
		bra.w	loc_1AE714
; ---------------------------------------------------------------------------

locret_1AE582:					  ; CODE XREF: ROM:001AE566j
		rts
; ---------------------------------------------------------------------------

loc_1AE584:					  ; CODE XREF: ROM:001AE56Cj
		bset	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bset	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0300,QueuedAction(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$05,Unk4D(a5)
		bcs.w	loc_1AE606
		cmpi.b	#$0F,Unk4D(a5)
		bne.s	loc_1AE5BC
		move.w	#$0500,QueuedAction(a5)
		addi.w	#$0010,Z(a5)
		bra.w	loc_1AE606
; ---------------------------------------------------------------------------

loc_1AE5BC:					  ; CODE XREF: ROM:001AE5AAj
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$10,Unk4D(a5)
		bcs.w	loc_1AE606
		clr.w	QueuedAction(a5)
		cmpi.b	#$1D,Unk4D(a5)
		bcs.w	loc_1AE606
		bne.s	loc_1AE5E2
		subi.w	#$0010,Z(a5)

loc_1AE5E2:					  ; CODE XREF: ROM:001AE5DAj
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$22,Unk4D(a5)
		bcs.w	loc_1AE606
		move.w	#$0300,QueuedAction(a5)
		cmpi.b	#$27,Unk4D(a5)
		bcs.w	loc_1AE606
		bra.w	sub_1AE3C8
; ---------------------------------------------------------------------------

loc_1AE606:					  ; CODE XREF: ROM:001AE5A0j
						  ; ROM:001AE5B8j ...
		bsr.w	j_j_OnTick
		bclr	#$07,Unk0A(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AE612:					  ; CODE XREF: ROM:001AE572j
		bset	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0600,QueuedAction(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$05,Unk4D(a5)
		bcs.w	locret_1AE6A2
		move.w	#$0700,QueuedAction(a5)
		cmpi.b	#$0F,Unk4D(a5)
		bcs.s	locret_1AE6A2
		bhi.s	loc_1AE67A
		bset	#$06,Flags2(a5)
		move.w	#00004,d6
		jsr	(j_GenerateRandomNumber).l
		add.b	d7,d7
		move.w	IfritCoordinates(pc,d7.w),d6
		cmp.w	X(a5),d6
		bne.s	loc_1AE660
		addq.b	#$02,d7
		andi.b	#$06,d7
		move.w	IfritCoordinates(pc,d7.w),d6

loc_1AE660:					  ; CODE XREF: ROM:001AE654j
		move.w	d6,X(a5)
		move.w	#$0808,SubX(a5)
		movea.l	a5,a1
		jsr	(sub_1A8AE6).l
		rts
; ---------------------------------------------------------------------------
IfritCoordinates:dc.w $1B1D			  ; DATA XREF: ROM:001AE64Er
						  ; ROM:001AE65Cr
		dc.w $221D
		dc.w $1B24
		dc.w $2224
; ---------------------------------------------------------------------------

loc_1AE67A:					  ; CODE XREF: ROM:001AE63Aj
		cmpi.b	#$14,Unk4D(a5)
		bcs.s	locret_1AE6A2
		bhi.s	loc_1AE690
		bsr.w	sub_1AE550
		bclr	#$06,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AE690:					  ; CODE XREF: ROM:001AE682j
		move.w	#$0600,QueuedAction(a5)
		cmpi.b	#$1E,Unk4D(a5)
		bcs.s	locret_1AE6A2
		beq.w	sub_1AE3C8

locret_1AE6A2:					  ; CODE XREF: ROM:001AE628j
						  ; ROM:001AE638j ...
		rts
; ---------------------------------------------------------------------------

loc_1AE6A4:					  ; CODE XREF: ROM:001AE57Aj
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$01,Unk4D(a5)
		bne.s	loc_1AE6C6
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1AE6C6:					  ; CODE XREF: ROM:001AE6B4j
		cmpi.b	#$02,Unk4D(a5)
		bne.w	loc_1AE6D8
		move.b	#$01,d0
		bra.w	LoadProjectilePalette
; ---------------------------------------------------------------------------

loc_1AE6D8:					  ; CODE XREF: ROM:001AE6CCj
		cmpi.b	#$0A,Unk4D(a5)
		bhi.w	loc_1AE6FA
		bcs.w	locret_1AE70A
		move.w	#$0200,QueuedAction(a5)
		move.w	#$0345,d6
		bsr.w	sub_1AE792
		bcs.w	loc_1AE70C
		rts
; ---------------------------------------------------------------------------

loc_1AE6FA:					  ; CODE XREF: ROM:001AE6DEj
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$14,Unk4D(a5)
		beq.w	loc_1AE70C

locret_1AE70A:					  ; CODE XREF: ROM:001AE6E2j
		rts
; ---------------------------------------------------------------------------

loc_1AE70C:					  ; CODE XREF: ROM:001AE6F4j
						  ; ROM:001AE706j
		clr.b	Unk4D(a5)
		bra.w	sub_1AE3C8
; ---------------------------------------------------------------------------

loc_1AE714:					  ; CODE XREF: ROM:001AE57Ej
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$01,Unk4D(a5)
		bne.s	loc_1AE736
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1AE736:					  ; CODE XREF: ROM:001AE724j
		cmpi.b	#$02,Unk4D(a5)
		bne.w	loc_1AE748
		move.b	#$01,d0
		bra.w	LoadProjectilePalette
; ---------------------------------------------------------------------------

loc_1AE748:					  ; CODE XREF: ROM:001AE73Cj
		cmpi.b	#$10,Unk4D(a5)
		bhi.w	loc_1AE778
		bcs.w	locret_1AE788
		move.w	#$0200,QueuedAction(a5)
		move.w	#$0345,d6
		bsr.s	sub_1AE792
		bcs.w	loc_1AE78A
		move.w	#$0346,d6
		bsr.s	sub_1AE792
		bcs.w	loc_1AE78A
		move.w	#$0347,d6
		bsr.s	sub_1AE792
		rts
; ---------------------------------------------------------------------------

loc_1AE778:					  ; CODE XREF: ROM:001AE74Ej
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$20,Unk4D(a5)
		beq.w	loc_1AE78A

locret_1AE788:					  ; CODE XREF: ROM:001AE752j
		rts
; ---------------------------------------------------------------------------

loc_1AE78A:					  ; CODE XREF: ROM:001AE762j
						  ; ROM:001AE76Cj ...
		clr.b	Unk4D(a5)
		bra.w	sub_1AE3C8

; =============== S U B	R O U T	I N E =======================================


sub_1AE792:					  ; CODE XREF: ROM:001AE6F0p
						  ; ROM:001AE760p ...
		move.b	RotationAndSize(a5),d2
		movem.w	d6,-(sp)
		movem.w	d2,-(sp)
		jsr	(sub_103B2).l
		movem.w	(sp)+,d1
		movem.w	(sp)+,d6
		bcs.w	loc_1AE876
		move.w	(a5),d0
		andi.b	#$C0,d1
		beq.s	loc_1AE7DA
		cmpi.b	#$80,d1
		bcs.s	loc_1AE7F2
		beq.s	loc_1AE80C
		subi.w	#$0100,d0
		cmpi.w	#$0345,d6
		beq.s	loc_1AE822
		subi.w	#$0001,d0
		cmpi.w	#$0346,d6
		beq.s	loc_1AE822
		addi.w	#$0002,d0
		bra.s	loc_1AE822
; ---------------------------------------------------------------------------

loc_1AE7DA:					  ; CODE XREF: sub_1AE792+24j
		subq.b	#$01,d0
		cmpi.w	#$0345,d6
		beq.s	loc_1AE822
		addi.w	#$0100,d0
		cmpi.w	#$0346,d6
		beq.s	loc_1AE822
		subi.w	#$0200,d0
		bra.s	loc_1AE822
; ---------------------------------------------------------------------------

loc_1AE7F2:					  ; CODE XREF: sub_1AE792+2Aj
		addi.w	#$0100,d0
		cmpi.w	#$0345,d6
		beq.s	loc_1AE822
		addi.w	#$0001,d0
		cmpi.w	#$0346,d6
		beq.s	loc_1AE822
		subi.w	#$0002,d0
		bra.s	loc_1AE822
; ---------------------------------------------------------------------------

loc_1AE80C:					  ; CODE XREF: sub_1AE792+2Cj
		addq.b	#$01,d0
		cmpi.w	#$0345,d6
		beq.s	loc_1AE822
		subi.w	#$0100,d0
		cmpi.w	#$0346,d6
		beq.s	loc_1AE822
		addi.w	#$0200,d0

loc_1AE822:					  ; CODE XREF: sub_1AE792+36j
						  ; sub_1AE792+40j ...
		move.w	d0,X(a1)
		move.b	d1,RotationAndSize(a1)
		move.b	#SPR_IFRITFIREBALL,d2
		move.w	#$0F00,AttackStrength(a1)
		move.w	Z(a5),d3
		addi.w	#$0020,d3
		move.w	d3,Z(a1)
		move.w	SubX(a5),SubX(a1)
		move.w	#$24B4,TileSource(a1)
		move.w	d6,BehaviourLUTIndex(a1)
		move.b	#$04,Speed(a1)
		move.b	#$80,FallRate(a1)
		jsr	(sub_103B8).l
		bset	#$00,Flags4(a1)		  ; Bit	0 = Invincible / Solid
		bset	#$07,Flags2(a1)
		bset	#$07,InitFlags2(a1)
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1AE876:					  ; CODE XREF: sub_1AE792+1Aj
		ori	#$01,ccr
		rts
; End of function sub_1AE792

