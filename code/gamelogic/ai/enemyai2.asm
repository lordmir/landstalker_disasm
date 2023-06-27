
; =============== S U B	R O U T	I N E =======================================


sub_1AC474:					  ; CODE XREF: ROM:001AC0ECp
						  ; ROM:001AC3D0p ...
		movem.w	d0-d1,-(sp)
		jsr	(sub_103B2).l
		bcs.w	loc_1AC4FC
		move.w	(a5),d0
		move.b	$00000004(a5),d1
		andi.b	#$C0,d1
		beq.s	loc_1AC49C
		cmpi.b	#$80,d1
		bcs.s	loc_1AC4A0
		beq.s	loc_1AC4A6
		subi.w	#$0100,d0
		bra.s	loc_1AC4A8
; ---------------------------------------------------------------------------

loc_1AC49C:					  ; CODE XREF: sub_1AC474+18j
		subq.b	#$01,d0
		bra.s	loc_1AC4A8
; ---------------------------------------------------------------------------

loc_1AC4A0:					  ; CODE XREF: sub_1AC474+1Ej
		addi.w	#$0100,d0
		bra.s	loc_1AC4A8
; ---------------------------------------------------------------------------

loc_1AC4A6:					  ; CODE XREF: sub_1AC474+20j
		addq.b	#$01,d0

loc_1AC4A8:					  ; CODE XREF: sub_1AC474+26j
						  ; sub_1AC474+2Aj ...
		move.w	d0,(a1)
		move.b	d1,$00000004(a1)
		movem.w	(sp)+,d0-d1
		ext.w	d0
		move.b	locret_1AC504+1(pc,d0.w),d2
		move.w	d1,$0000003C(a1)
		move.w	$00000012(a5),d3
		addi.w	#$0010,d3
		move.w	d3,$00000012(a1)
		move.w	$00000002(a5),$00000002(a1)
		move.w	#$64C0,$00000006(a1)
		move.w	#$021C,$00000034(a1)
		move.b	#$04,$00000009(a1)
		jsr	(sub_103B8).l
		bset	#$00,$00000038(a1)
		bset	#$07,$0000000C(a1)
		bset	#$07,$0000004C(a1)
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1AC4FC:					  ; CODE XREF: sub_1AC474+Aj
		movem.w	(sp)+,d0-d1
		ori	#$01,ccr

locret_1AC504:					  ; DATA XREF: sub_1AC474+40r
		rts
; End of function sub_1AC474

; ---------------------------------------------------------------------------
		dc.b SPR_SMLFIREBALL
		dc.b SPR_NOLEAXEPROJECTILE
		dc.b SPR_ZAKBOOMERANG
		dc.b $FF
; ---------------------------------------------------------------------------

EnemyAI_Reaper2_B:				  ; CODE XREF: ROM:001A8642j
		bra.s	loc_1AC552
; ---------------------------------------------------------------------------

EnemyAI_Reaper2_A:				  ; CODE XREF: ROM:001A863Ej
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AC524
		move.b	$00000037(a5),d0
		beq.s	loc_1AC52A
		cmpi.b	#$10,d0
		beq.s	loc_1AC556
		bra.w	loc_1AC642
; ---------------------------------------------------------------------------

loc_1AC524:					  ; CODE XREF: ROM:001AC512j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AC52A:					  ; CODE XREF: ROM:001AC518j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0100,d5
		move.w	#$0100,d6
		move.w	#$0100,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AC552
		rts
; ---------------------------------------------------------------------------

loc_1AC552:					  ; CODE XREF: ROM:EnemyAI_Reaper2_Bj
						  ; ROM:001AC54Ej ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AC556:					  ; CODE XREF: ROM:001AC51Ej
		tst.b	(byte_FF1142).l
		bne.s	loc_1AC5B6
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$2D,$0000004D(a5)
		bcs.s	loc_1AC5A2
		clr.b	$0000004D(a5)
		bsr.s	sub_1AC5BA
		bcs.s	loc_1AC59C
		ori.b	#$40,$0000000C(a5)
		move.w	#$0100,$00000012(a5)
		move.w	#$0120,$00000054(a5)
		bsr.s	sub_1AC5EA
		bcs.s	loc_1AC59C
		bsr.w	sub_1AC614

loc_1AC59C:					  ; CODE XREF: ROM:001AC580j
						  ; ROM:001AC596j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AC5A2:					  ; CODE XREF: ROM:001AC578j
		ori.b	#$40,$0000000C(a5)
		move.w	#$0100,$00000012(a5)
		move.w	#$0120,$00000054(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AC5B6:					  ; CODE XREF: ROM:001AC55Cj
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AC5BA:					  ; CODE XREF: ROM:001AC57Ep
		move.w	#$0060,d5
		move.w	#$FFB8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AC5E6
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AC5E6:					  ; CODE XREF: sub_1AC5BA+10j
		tst.b	d0
		rts
; End of function sub_1AC5BA


; =============== S U B	R O U T	I N E =======================================


sub_1AC5EA:					  ; CODE XREF: ROM:001AC594p
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$012C,d7
		bhi.s	loc_1AC610
		move.b	#$21,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AC610:					  ; CODE XREF: sub_1AC5EA+Ej
		tst.b	d0
		rts
; End of function sub_1AC5EA


; =============== S U B	R O U T	I N E =======================================


sub_1AC614:					  ; CODE XREF: ROM:001AC598p
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$012C,d7
		bhi.s	loc_1AC63E
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AC63E:					  ; CODE XREF: sub_1AC614+Ej
		tst.b	d0
		rts
; End of function sub_1AC614

; ---------------------------------------------------------------------------

loc_1AC642:					  ; CODE XREF: ROM:001AC520j
		clr.b	$0000000D(a5)
		andi.b	#$0F,d0
		beq.w	loc_1AC752
		cmpi.b	#$01,d0
		beq.s	loc_1AC668
		cmpi.b	#$02,d0
		beq.w	loc_1AC67C
		cmpi.b	#$03,d0
		beq.w	loc_1AC67C
		bra.w	loc_1AC67C
; ---------------------------------------------------------------------------

loc_1AC668:					  ; CODE XREF: ROM:001AC652j
		move.l	(a5),d0
		movem.l	d0,-(sp)
		move.b	(Player_RotationAndSize).l,d0
		eori.b	#$80,d0
		clr.b	d1
		bra.s	loc_1AC68C
; ---------------------------------------------------------------------------

loc_1AC67C:					  ; CODE XREF: ROM:001AC658j
						  ; ROM:001AC660j ...
		move.l	(a5),d0
		movem.l	d0,-(sp)
		move.b	(Player_RotationAndSize).l,d0
		move.b	#$80,d1

loc_1AC68C:					  ; CODE XREF: ROM:001AC67Aj
		movem.w	d1,-(sp)
		move.w	(Player_CentreX).l,d1
		move.w	(Player_CentreY).l,d2
		andi.b	#$C0,d0
		beq.s	loc_1AC6B0
		cmpi.b	#$80,d0
		beq.s	loc_1AC6B6
		bhi.s	loc_1AC6BC
		addi.w	#$0068,d1
		bra.s	loc_1AC6C0
; ---------------------------------------------------------------------------

loc_1AC6B0:					  ; CODE XREF: ROM:001AC6A0j
		subi.w	#$0068,d2
		bra.s	loc_1AC6C0
; ---------------------------------------------------------------------------

loc_1AC6B6:					  ; CODE XREF: ROM:001AC6A6j
		addi.w	#$0068,d2
		bra.s	loc_1AC6C0
; ---------------------------------------------------------------------------

loc_1AC6BC:					  ; CODE XREF: ROM:001AC6A8j
		subi.w	#$0068,d1

loc_1AC6C0:					  ; CODE XREF: ROM:001AC6AEj
						  ; ROM:001AC6B4j ...
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
		bcc.s	loc_1AC722
		movem.w	(sp)+,d1
		movem.l	(sp)+,d0
		move.l	d0,(a5)
		movea.l	a5,a1
		move.w	#$0100,$00000012(a5)
		move.w	#$0120,$00000054(a5)
		jsr	(sub_1A8AE6).l
		bra.w	loc_1AC552
; ---------------------------------------------------------------------------

loc_1AC722:					  ; CODE XREF: ROM:001AC6FEj
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

loc_1AC752:					  ; CODE XREF: ROM:001AC64Aj
		andi.b	#$BF,$0000000C(a5)
		clr.w	d0
		move.b	$00000039(a5),d0
		move.w	d0,$00000012(a5)
		addi.w	#$001F,d0
		move.w	d0,$00000054(a5)
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$01,$0000004D(a5)
		bne.s	loc_1AC78C
		move.w	#$0100,$0000002C(a5)
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1AC78C:					  ; CODE XREF: ROM:001AC774j
		cmpi.b	#$02,$0000004D(a5)
		bne.w	loc_1AC79E
		move.b	#$01,d0
		bra.w	LoadProjectilePalette
; ---------------------------------------------------------------------------

loc_1AC79E:					  ; CODE XREF: ROM:001AC792j
		cmpi.b	#$2D,$0000004D(a5)
		bhi.w	loc_1AC7C4
		bcs.w	locret_1AC7D4
		move.w	#$0200,$0000002C(a5)
		move.b	#$01,d0
		move.w	#$0500,d1
		bsr.w	sub_1AC474
		bcs.w	loc_1AC7D6
		rts
; ---------------------------------------------------------------------------

loc_1AC7C4:					  ; CODE XREF: ROM:001AC7A4j
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$46,$0000004D(a5)
		beq.w	loc_1AC7D6

locret_1AC7D4:					  ; CODE XREF: ROM:001AC7A8j
		rts
; ---------------------------------------------------------------------------

loc_1AC7D6:					  ; CODE XREF: ROM:001AC7BEj
						  ; ROM:001AC7D0j
		clr.b	$0000004D(a5)
		bra.w	loc_1AC552
; ---------------------------------------------------------------------------

EnemyAI_Reaper3_B:				  ; CODE XREF: ROM:001A864Aj
		bra.s	loc_1AC826
; ---------------------------------------------------------------------------

EnemyAI_Reaper3_A:				  ; CODE XREF: ROM:001A8646j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AC7F8
		move.b	$00000037(a5),d0
		beq.s	loc_1AC7FE
		cmpi.b	#$10,d0
		beq.s	loc_1AC82A
		bra.w	loc_1AC916
; ---------------------------------------------------------------------------

loc_1AC7F8:					  ; CODE XREF: ROM:001AC7E6j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AC7FE:					  ; CODE XREF: ROM:001AC7ECj
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0100,d5
		move.w	#$0100,d6
		move.w	#$0100,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AC826
		rts
; ---------------------------------------------------------------------------

loc_1AC826:					  ; CODE XREF: ROM:EnemyAI_Reaper3_Bj
						  ; ROM:001AC822j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AC82A:					  ; CODE XREF: ROM:001AC7F2j
		tst.b	(byte_FF1142).l
		bne.s	loc_1AC88A
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$1E,$0000004D(a5)
		bcs.s	loc_1AC876
		clr.b	$0000004D(a5)
		bsr.s	sub_1AC88E
		bcs.s	loc_1AC870
		ori.b	#$40,$0000000C(a5)
		move.w	#$0100,$00000012(a5)
		move.w	#$0120,$00000054(a5)
		bsr.s	sub_1AC8BE
		bcs.s	loc_1AC870
		bsr.w	sub_1AC8E8

loc_1AC870:					  ; CODE XREF: ROM:001AC854j
						  ; ROM:001AC86Aj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AC876:					  ; CODE XREF: ROM:001AC84Cj
		ori.b	#$40,$0000000C(a5)
		move.w	#$0100,$00000012(a5)
		move.w	#$0120,$00000054(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AC88A:					  ; CODE XREF: ROM:001AC830j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AC88E:					  ; CODE XREF: ROM:001AC852p
		move.w	#$0060,d5
		move.w	#$FFB8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AC8BA
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AC8BA:					  ; CODE XREF: sub_1AC88E+10j
		tst.b	d0
		rts
; End of function sub_1AC88E


; =============== S U B	R O U T	I N E =======================================


sub_1AC8BE:					  ; CODE XREF: ROM:001AC868p
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0190,d7
		bhi.s	loc_1AC8E4
		move.b	#$21,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AC8E4:					  ; CODE XREF: sub_1AC8BE+Ej
		tst.b	d0
		rts
; End of function sub_1AC8BE


; =============== S U B	R O U T	I N E =======================================


sub_1AC8E8:					  ; CODE XREF: ROM:001AC86Cp
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0190,d7
		bhi.s	loc_1AC912
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AC912:					  ; CODE XREF: sub_1AC8E8+Ej
		tst.b	d0
		rts
; End of function sub_1AC8E8

; ---------------------------------------------------------------------------

loc_1AC916:					  ; CODE XREF: ROM:001AC7F4j
		clr.b	$0000000D(a5)
		andi.b	#$0F,d0
		beq.w	loc_1ACA26
		cmpi.b	#$01,d0
		beq.s	loc_1AC93C
		cmpi.b	#$02,d0
		beq.w	loc_1AC950
		cmpi.b	#$03,d0
		beq.w	loc_1AC950
		bra.w	loc_1AC950
; ---------------------------------------------------------------------------

loc_1AC93C:					  ; CODE XREF: ROM:001AC926j
		move.l	(a5),d0
		movem.l	d0,-(sp)
		move.b	(Player_RotationAndSize).l,d0
		eori.b	#$80,d0
		clr.b	d1
		bra.s	loc_1AC960
; ---------------------------------------------------------------------------

loc_1AC950:					  ; CODE XREF: ROM:001AC92Cj
						  ; ROM:001AC934j ...
		move.l	(a5),d0
		movem.l	d0,-(sp)
		move.b	(Player_RotationAndSize).l,d0
		move.b	#$80,d1

loc_1AC960:					  ; CODE XREF: ROM:001AC94Ej
		movem.w	d1,-(sp)
		move.w	(Player_CentreX).l,d1
		move.w	(Player_CentreY).l,d2
		andi.b	#$C0,d0
		beq.s	loc_1AC984
		cmpi.b	#$80,d0
		beq.s	loc_1AC98A
		bhi.s	loc_1AC990
		addi.w	#$0068,d1
		bra.s	loc_1AC994
; ---------------------------------------------------------------------------

loc_1AC984:					  ; CODE XREF: ROM:001AC974j
		subi.w	#$0068,d2
		bra.s	loc_1AC994
; ---------------------------------------------------------------------------

loc_1AC98A:					  ; CODE XREF: ROM:001AC97Aj
		addi.w	#$0068,d2
		bra.s	loc_1AC994
; ---------------------------------------------------------------------------

loc_1AC990:					  ; CODE XREF: ROM:001AC97Cj
		subi.w	#$0068,d1

loc_1AC994:					  ; CODE XREF: ROM:001AC982j
						  ; ROM:001AC988j ...
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
		bcc.s	loc_1AC9F6
		movem.w	(sp)+,d1
		movem.l	(sp)+,d0
		move.l	d0,(a5)
		movea.l	a5,a1
		move.w	#$0100,$00000012(a5)
		move.w	#$0120,$00000054(a5)
		jsr	(sub_1A8AE6).l
		bra.w	loc_1AC826
; ---------------------------------------------------------------------------

loc_1AC9F6:					  ; CODE XREF: ROM:001AC9D2j
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

loc_1ACA26:					  ; CODE XREF: ROM:001AC91Ej
		andi.b	#$BF,$0000000C(a5)
		clr.w	d0
		move.b	$00000039(a5),d0
		move.w	d0,$00000012(a5)
		addi.w	#$001F,d0
		move.w	d0,$00000054(a5)
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$01,$0000004D(a5)
		bne.s	loc_1ACA60
		move.w	#$0100,$0000002C(a5)
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1ACA60:					  ; CODE XREF: ROM:001ACA48j
		cmpi.b	#$02,$0000004D(a5)
		bne.w	loc_1ACA72
		move.b	#$01,d0
		bra.w	LoadProjectilePalette
; ---------------------------------------------------------------------------

loc_1ACA72:					  ; CODE XREF: ROM:001ACA66j
		cmpi.b	#$2D,$0000004D(a5)
		bhi.w	loc_1ACA98
		bcs.w	locret_1ACAA8
		move.w	#$0200,$0000002C(a5)
		move.b	#$01,d0
		move.w	#$0800,d1
		bsr.w	sub_1AC474
		bcs.w	loc_1ACAAA
		rts
; ---------------------------------------------------------------------------

loc_1ACA98:					  ; CODE XREF: ROM:001ACA78j
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$46,$0000004D(a5)
		beq.w	loc_1ACAAA

locret_1ACAA8:					  ; CODE XREF: ROM:001ACA7Cj
		rts
; ---------------------------------------------------------------------------

loc_1ACAAA:					  ; CODE XREF: ROM:001ACA92j
						  ; ROM:001ACAA4j
		clr.b	$0000004D(a5)
		bra.w	loc_1AC826
; ---------------------------------------------------------------------------

EnemyAI_Duke_B:					  ; CODE XREF: ROM:001A8602j
		bra.s	loc_1ACB06
; ---------------------------------------------------------------------------

EnemyAI_Duke_A:					  ; CODE XREF: ROM:001A85FEj
		bset	#$06,$00000038(a5)
		btst	#$01,$0000000C(a5)
		bne.s	loc_1ACAD2
		move.b	$00000037(a5),d0
		beq.s	loc_1ACADE
		cmpi.b	#$10,d0
		beq.s	loc_1ACB24
		bra.w	loc_1ACC7A
; ---------------------------------------------------------------------------

loc_1ACAD2:					  ; CODE XREF: ROM:001ACAC0j
		bclr	#$00,$00000038(a5)
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ACADE:					  ; CODE XREF: ROM:001ACAC6j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1ACB06
		rts
; ---------------------------------------------------------------------------

loc_1ACB06:					  ; CODE XREF: ROM:EnemyAI_Duke_Bj
						  ; ROM:001ACB02j ...
		bclr	#$00,$00000038(a5)
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ACB24:					  ; CODE XREF: ROM:001ACACCj
		tst.b	(byte_FF1142).l
		bne.s	loc_1ACB54
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1ACB64
		bcs.s	loc_1ACB4E
		bsr.s	sub_1ACBA0
		bcs.s	loc_1ACB4E
		bsr.w	sub_1ACBE0
		bcs.s	loc_1ACB4E
		bsr.w	sub_1ACC20

loc_1ACB4E:					  ; CODE XREF: ROM:001ACB3Ej
						  ; ROM:001ACB42j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ACB54:					  ; CODE XREF: ROM:001ACB2Aj
		move.w	#$0006,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	LoadSpecialAI
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1ACB64:					  ; CODE XREF: ROM:001ACB3Cp
		move.w	#$0070,d5
		move.w	#$FFB0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ACB9C
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0056,d7
		bhi.s	loc_1ACB9C
		move.b	#$20,$00000037(a5)
		move.w	#$001A,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACB9C:					  ; CODE XREF: sub_1ACB64+10j
						  ; sub_1ACB64+20j
		tst.b	d0
		rts
; End of function sub_1ACB64


; =============== S U B	R O U T	I N E =======================================


sub_1ACBA0:					  ; CODE XREF: ROM:001ACB40p
		move.w	#$0050,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ACBDC
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$007D,d7
		bhi.s	loc_1ACBDC
		move.b	#$21,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACBDC:					  ; CODE XREF: sub_1ACBA0+10j
						  ; sub_1ACBA0+20j
		tst.b	d0
		rts
; End of function sub_1ACBA0


; =============== S U B	R O U T	I N E =======================================


sub_1ACBE0:					  ; CODE XREF: ROM:001ACB44p
		move.w	#$0030,d5
		move.w	#$FFE0,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ACC1C
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$002B,d7
		bhi.s	loc_1ACC1C
		move.b	#$22,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACC1C:					  ; CODE XREF: sub_1ACBE0+10j
						  ; sub_1ACBE0+20j
		tst.b	d0
		rts
; End of function sub_1ACBE0


; =============== S U B	R O U T	I N E =======================================


sub_1ACC20:					  ; CODE XREF: ROM:001ACB4Ap
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ACC76
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bcc.s	loc_1ACC5C
		move.b	#$23,$00000037(a5)
		move.w	#$0012,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACC5C:					  ; CODE XREF: sub_1ACC20+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACC76:					  ; CODE XREF: sub_1ACC20+10j
		tst.b	d0
		rts
; End of function sub_1ACC20

; ---------------------------------------------------------------------------

loc_1ACC7A:					  ; CODE XREF: ROM:001ACACEj
		andi.b	#$0F,d0
		beq.s	loc_1ACC9A
		cmpi.b	#$01,d0
		beq.s	loc_1ACCBE
		cmpi.b	#$02,d0
		beq.w	loc_1ACCE0
		cmpi.b	#$03,d0
		beq.w	loc_1ACC9A
		bra.w	*+4
; ---------------------------------------------------------------------------

loc_1ACC9A:					  ; CODE XREF: ROM:001ACC7Ej
						  ; ROM:001ACC92j ...
		cmpi.b	#$18,$0000002A(a5)
		bcc.s	loc_1ACCB8
		move.w	#$0100,$0000002C(a5)
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C

loc_1ACCB8:					  ; CODE XREF: ROM:001ACCA0j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ACCBE:					  ; CODE XREF: ROM:001ACC84j
		bset	#$00,$00000038(a5)
		move.w	#$0200,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$28,$0000000D(a5)
		bcc.w	loc_1ACB06
		rts
; ---------------------------------------------------------------------------

loc_1ACCDA:					  ; CODE XREF: ROM:001ACD00j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ACCE0:					  ; CODE XREF: ROM:001ACC8Aj
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1ACCDA
		bra.w	loc_1ACB06
; ---------------------------------------------------------------------------

EnemyAI_Zak_B_0:				  ; CODE XREF: ROM:001A8622j
		bra.s	loc_1ACD4E
; ---------------------------------------------------------------------------

EnemyAI_Zak_A_0:				  ; CODE XREF: ROM:001A861Ej
		btst	#$01,$0000000C(a5)
		bne.s	loc_1ACD20
		move.b	$00000037(a5),d0
		beq.s	loc_1ACD26
		cmpi.b	#$10,d0
		beq.s	loc_1ACD5E
		bra.w	loc_1ACEFC
; ---------------------------------------------------------------------------

loc_1ACD20:					  ; CODE XREF: ROM:001ACD0Ej
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ACD26:					  ; CODE XREF: ROM:001ACD14j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0040,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	sub_1ACD54
		rts
; ---------------------------------------------------------------------------

loc_1ACD4E:					  ; CODE XREF: ROM:EnemyAI_Zak_B_0j
		bsr.s	sub_1ACD54
		bra.w	loc_1ACE0C

; =============== S U B	R O U T	I N E =======================================


sub_1ACD54:					  ; CODE XREF: ROM:001ACD4Aj
						  ; ROM:loc_1ACD4Ep ...

; FUNCTION CHUNK AT 001A8AB6 SIZE 00000018 BYTES

		bset	#$08,$00000020(a5)
		bra.w	loc_1A8AB6
; End of function sub_1ACD54

; ---------------------------------------------------------------------------

loc_1ACD5E:					  ; CODE XREF: ROM:001ACD1Aj
		tst.b	(byte_FF1142).l
		bne.s	loc_1ACD94
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1ACD98
		bcs.s	loc_1ACD8E
		bsr.s	sub_1ACDD8
		bcs.s	loc_1ACD8E
		bsr.w	sub_1ACE2A
		bcs.s	loc_1ACD8E
		bsr.w	sub_1ACE66
		bcs.s	loc_1ACD8E
		bsr.w	sub_1ACEA2

loc_1ACD8E:					  ; CODE XREF: ROM:001ACD78j
						  ; ROM:001ACD7Cj ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ACD94:					  ; CODE XREF: ROM:001ACD64j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1ACD98:					  ; CODE XREF: ROM:001ACD76p
		move.w	#$0080,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ACDD4
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0010,d7
		bhi.s	loc_1ACDD4
		move.b	#$25,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACDD4:					  ; CODE XREF: sub_1ACD98+10j
						  ; sub_1ACD98+20j
		tst.b	d0
		rts
; End of function sub_1ACD98


; =============== S U B	R O U T	I N E =======================================


sub_1ACDD8:					  ; CODE XREF: ROM:001ACD7Ap
		move.w	#$0070,d5
		move.w	#$0070,d6
		move.w	#$0070,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ACE26
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1ACE26
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0010,d7
		bhi.s	loc_1ACE26

loc_1ACE0C:					  ; CODE XREF: ROM:001ACD50j
		move.b	#$20,$00000037(a5)
		move.w	#$0004,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACE26:					  ; CODE XREF: sub_1ACDD8+10j
						  ; sub_1ACDD8+22j ...
		tst.b	d0
		rts
; End of function sub_1ACDD8


; =============== S U B	R O U T	I N E =======================================


sub_1ACE2A:					  ; CODE XREF: ROM:001ACD7Ep
		move.w	#$0060,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ACE62
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1ACE62
		move.b	#$21,$00000037(a5)
		move.w	#$0012,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACE62:					  ; CODE XREF: sub_1ACE2A+10j
						  ; sub_1ACE2A+20j
		tst.b	d0
		rts
; End of function sub_1ACE2A


; =============== S U B	R O U T	I N E =======================================


sub_1ACE66:					  ; CODE XREF: ROM:001ACD84p
		move.w	#$0040,d5
		move.w	#$0020,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ACE9E
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1ACE9E
		move.b	#$22,$00000037(a5)
		move.w	#$0011,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACE9E:					  ; CODE XREF: sub_1ACE66+10j
						  ; sub_1ACE66+20j
		tst.b	d0
		rts
; End of function sub_1ACE66


; =============== S U B	R O U T	I N E =======================================


sub_1ACEA2:					  ; CODE XREF: ROM:001ACD8Ap
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ACEF8
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bcc.s	loc_1ACEDE
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACEDE:					  ; CODE XREF: sub_1ACEA2+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0012,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ACEF8:					  ; CODE XREF: sub_1ACEA2+10j
		tst.b	d0
		rts
; End of function sub_1ACEA2

; ---------------------------------------------------------------------------

loc_1ACEFC:					  ; CODE XREF: ROM:001ACD1Cj
		andi.b	#$0F,d0
		beq.s	loc_1ACF26
		cmpi.b	#$01,d0
		beq.w	loc_1AD014
		cmpi.b	#$02,d0
		beq.w	loc_1AD014
		cmpi.b	#$03,d0
		beq.w	loc_1ACFDE
		cmpi.b	#$04,d0
		beq.w	loc_1AD014
		bra.w	loc_1AD04E
; ---------------------------------------------------------------------------

loc_1ACF26:					  ; CODE XREF: ROM:001ACF00j
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$1F,$0000004D(a5)
		bhi.s	loc_1ACF6A
		bset	#$07,$00000020(a5)
		addi.w	#$0004,$00000012(a5)
		addi.w	#$0004,$00000054(a5)
		move.b	$0000004D(a5),d0
		andi.w	#$000E,d0
		lsl.w	#$07,d0
		move.w	d0,$0000002C(a5)
		bsr.w	sub_1AC010
		andi.b	#$3F,$00000004(a5)
		or.b	d2,$00000004(a5)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Slash1
; ---------------------------------------------------------------------------
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ACF6A:					  ; CODE XREF: ROM:001ACF30j
		bclr	#$07,$00000020(a5)
		cmpi.b	#$20,$0000004D(a5)
		bne.s	loc_1ACF98
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Fall
; ---------------------------------------------------------------------------
		move.w	#$0002,d6
		jsr	(j_GenerateRandomNumber).l
		move.w	#$0040,d0
		tst.b	d7
		beq.s	loc_1ACF92
		move.w	#$0058,d0

loc_1ACF92:					  ; CODE XREF: ROM:001ACF8Cj
		move.w	d0,$00000062(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ACF98:					  ; CODE XREF: ROM:001ACF76j
		subq.b	#$01,$0000004D(a5)
		bclr	#$07,$00000020(a5)
		move.b	$0000002D(a5),d0
		andi.b	#$30,d0
		beq.w	loc_1ACFD6
		move.w	(Player_Z).l,d0
		add.w	$00000062(a5),d0
		cmp.w	$00000012(a5),d0
		bcc.s	loc_1ACFCE
		move.l	(Player_X).l,(a5)
		movea.l	a5,a1
		jsr	(sub_1A8AE6).l
		rts
; ---------------------------------------------------------------------------

loc_1ACFCE:					  ; CODE XREF: ROM:001ACFBCj
		move.w	#$0300,$0000002C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ACFD6:					  ; CODE XREF: ROM:001ACFAAj
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_LadderClimb
; ---------------------------------------------------------------------------
		bra.w	sub_1ACD54
; ---------------------------------------------------------------------------

loc_1ACFDE:					  ; CODE XREF: ROM:001ACF16j
		move.w	#$0200,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	locret_1AD012
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0300,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1AD012
		beq.w	sub_1ACD54

locret_1AD012:					  ; CODE XREF: ROM:001ACFEEj
						  ; ROM:001AD00Cj
		rts
; ---------------------------------------------------------------------------

loc_1AD014:					  ; CODE XREF: ROM:001ACF06j
						  ; ROM:001ACF0Ej ...
		move.w	#$0200,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	loc_1AD048
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0300,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	loc_1AD048
		beq.w	sub_1ACD54

loc_1AD048:					  ; CODE XREF: ROM:001AD024j
						  ; ROM:001AD042j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AD04E:					  ; CODE XREF: ROM:001ACF22j
		move.w	#$0200,$0000002C(a5)
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$0F,$0000004D(a5)
		bcs.s	locret_1AD09C
		bhi.s	loc_1AD09E
		move.w	#$0300,$0000002C(a5)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Slash2
; ---------------------------------------------------------------------------
		move.b	#$03,d0
		move.w	#$1400,d1
		bsr.w	sub_1AC474
		bcs.w	locret_1AD09C
		move.w	#$44C0,$00000006(a1)
		move.b	#$04,$00000009(a1)
		move.w	#$036A,$00000034(a1)
		movem.l	a5,-(sp)
		movea.l	a1,a5
		bsr.w	j_j_LoadSpriteBehaviour
		movem.l	(sp)+,a5

locret_1AD09C:					  ; CODE XREF: ROM:001AD05Ej
						  ; ROM:001AD078j
		rts
; ---------------------------------------------------------------------------

loc_1AD09E:					  ; CODE XREF: ROM:001AD060j
		move.w	#$0300,$0000002C(a5)
		cmpi.b	#$3C,$0000004D(a5)
		beq.w	sub_1ACD54
		rts
; ---------------------------------------------------------------------------

EnemyAI_Golem1_B_0:				  ; CODE XREF: ROM:001A862Aj
		bra.s	loc_1AD0F8
; ---------------------------------------------------------------------------

EnemyAI_Golem1_A_0:				  ; CODE XREF: ROM:001A8626j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AD0CA
		move.b	$00000037(a5),d0
		beq.s	loc_1AD0D0
		cmpi.b	#$10,d0
		beq.s	loc_1AD0FC
		bra.w	loc_1AD194
; ---------------------------------------------------------------------------

loc_1AD0CA:					  ; CODE XREF: ROM:001AD0B8j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AD0D0:					  ; CODE XREF: ROM:001AD0BEj
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0040,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AD0F8
		rts
; ---------------------------------------------------------------------------

loc_1AD0F8:					  ; CODE XREF: ROM:EnemyAI_Golem1_B_0j
						  ; ROM:001AD0F4j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AD0FC:					  ; CODE XREF: ROM:001AD0C4j
		tst.b	(byte_FF1142).l
		bne.s	loc_1AD120
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1AD124
		bcs.s	loc_1AD11A
		bsr.s	sub_1AD164

loc_1AD11A:					  ; CODE XREF: ROM:001AD116j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AD120:					  ; CODE XREF: ROM:001AD102j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AD124:					  ; CODE XREF: ROM:001AD114p
		move.w	#$0050,d5
		move.w	#$FFD8,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD160
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bcc.s	loc_1AD160
		move.b	#$22,$00000037(a5)
		move.w	#$0013,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD160:					  ; CODE XREF: sub_1AD124+10j
						  ; sub_1AD124+20j
		tst.b	d0
		rts
; End of function sub_1AD124


; =============== S U B	R O U T	I N E =======================================


sub_1AD164:					  ; CODE XREF: ROM:001AD118p
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD190
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD190:					  ; CODE XREF: sub_1AD164+10j
		tst.b	d0
		rts
; End of function sub_1AD164

; ---------------------------------------------------------------------------

loc_1AD194:					  ; CODE XREF: ROM:001AD0C6j
		andi.b	#$0F,d0
		cmpi.b	#$03,d0
		bcs.s	loc_1AD1D4
		move.w	#$0300,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	locret_1AD1D2
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1AD1D2
		beq.w	loc_1AD0F8

locret_1AD1D2:					  ; CODE XREF: ROM:001AD1AEj
						  ; ROM:001AD1CCj
		rts
; ---------------------------------------------------------------------------

loc_1AD1D4:					  ; CODE XREF: ROM:001AD19Cj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

EnemyAI_Golem2_B_0:				  ; CODE XREF: ROM:001A8632j
						  ; ROM:001A863Aj
		bra.s	loc_1AD222
; ---------------------------------------------------------------------------

EnemyAI_Golem2_A_0:				  ; CODE XREF: ROM:001A862Ej
						  ; ROM:001A8636j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AD1F4
		move.b	$00000037(a5),d0
		beq.s	loc_1AD1FA
		cmpi.b	#$10,d0
		beq.s	loc_1AD226
		bra.w	loc_1AD2BE
; ---------------------------------------------------------------------------

loc_1AD1F4:					  ; CODE XREF: ROM:001AD1E2j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AD1FA:					  ; CODE XREF: ROM:001AD1E8j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0040,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AD222
		rts
; ---------------------------------------------------------------------------

loc_1AD222:					  ; CODE XREF: ROM:EnemyAI_Golem2_B_0j
						  ; ROM:001AD21Ej ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AD226:					  ; CODE XREF: ROM:001AD1EEj
		tst.b	(byte_FF1142).l
		bne.s	loc_1AD24A
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1AD24E
		bcs.s	loc_1AD244
		bsr.s	sub_1AD28E

loc_1AD244:					  ; CODE XREF: ROM:001AD240j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AD24A:					  ; CODE XREF: ROM:001AD22Cj
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AD24E:					  ; CODE XREF: ROM:001AD23Ep
		move.w	#$0060,d5
		move.w	#$FFC0,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD28A
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bcc.s	loc_1AD28A
		move.b	#$22,$00000037(a5)
		move.w	#$001A,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD28A:					  ; CODE XREF: sub_1AD24E+10j
						  ; sub_1AD24E+20j
		tst.b	d0
		rts
; End of function sub_1AD24E


; =============== S U B	R O U T	I N E =======================================


sub_1AD28E:					  ; CODE XREF: ROM:001AD242p
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD2BA
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD2BA:					  ; CODE XREF: sub_1AD28E+10j
		tst.b	d0
		rts
; End of function sub_1AD28E

; ---------------------------------------------------------------------------

loc_1AD2BE:					  ; CODE XREF: ROM:001AD1F0j
		andi.b	#$0F,d0
		cmpi.b	#$03,d0
		bcs.s	loc_1AD2FE
		move.w	#$0300,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	locret_1AD2FC
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1AD2FC
		beq.w	loc_1AD222

locret_1AD2FC:					  ; CODE XREF: ROM:001AD2D8j
						  ; ROM:001AD2F6j
		rts
; ---------------------------------------------------------------------------

loc_1AD2FE:					  ; CODE XREF: ROM:001AD2C6j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

EnemyAI_Spectre1_B:				  ; CODE XREF: ROM:001A8652j
		bra.s	loc_1AD352
; ---------------------------------------------------------------------------

EnemyAI_Spectre1_A:				  ; CODE XREF: ROM:001A864Ej
		bset	#$07,$00000020(a5)
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AD324
		move.b	$00000037(a5),d0
		beq.s	loc_1AD32A
		cmpi.b	#$10,d0
		beq.s	loc_1AD356
		bra.w	loc_1AD4C6
; ---------------------------------------------------------------------------

loc_1AD324:					  ; CODE XREF: ROM:001AD312j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AD32A:					  ; CODE XREF: ROM:001AD318j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AD352
		rts
; ---------------------------------------------------------------------------

loc_1AD352:					  ; CODE XREF: ROM:EnemyAI_Spectre1_Bj
						  ; ROM:001AD34Ej ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AD356:					  ; CODE XREF: ROM:001AD31Ej
		tst.b	(byte_FF1142).l
		bne.s	loc_1AD3A2
		btst	#$06,$0000000C(a5)
		beq.s	loc_1AD37A
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$1E,$0000004D(a5)
		bcs.s	loc_1AD39C
		subq.b	#$01,$0000004D(a5)
		bsr.w	sub_1AD4A4

loc_1AD37A:					  ; CODE XREF: ROM:001AD364j
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1AD3A6
		bcs.s	loc_1AD39C
		bsr.s	sub_1AD3E8
		bcs.s	loc_1AD39C
		bsr.w	sub_1AD41A
		bcs.s	loc_1AD39C
		bsr.w	sub_1AD460

loc_1AD39C:					  ; CODE XREF: ROM:001AD370j
						  ; ROM:001AD38Cj ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AD3A2:					  ; CODE XREF: ROM:001AD35Cj
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AD3A6:					  ; CODE XREF: ROM:001AD38Ap
		move.w	#$0070,d5
		move.w	#$0030,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD3E4
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0008,d7
		bhi.s	loc_1AD3E4
		bset	#$06,$0000000C(a5)
		move.w	#$0100,$00000012(a5)
		move.w	#$0120,$00000054(a5)
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD3E4:					  ; CODE XREF: sub_1AD3A6+10j
						  ; sub_1AD3A6+20j
		tst.b	d0
		rts
; End of function sub_1AD3A6


; =============== S U B	R O U T	I N E =======================================


sub_1AD3E8:					  ; CODE XREF: ROM:001AD38Ep
		move.w	#$0060,d5
		move.w	#$0000,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD416
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0006,d7
		bhi.s	loc_1AD416
		bsr.w	sub_1AD4A4
		bcc.s	loc_1AD416
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD416:					  ; CODE XREF: sub_1AD3E8+10j
						  ; sub_1AD3E8+20j ...
		tst.b	d0
		rts
; End of function sub_1AD3E8


; =============== S U B	R O U T	I N E =======================================


sub_1AD41A:					  ; CODE XREF: ROM:001AD392p
		move.w	#$0060,d5
		move.w	#$0048,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD45C
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1AD45C
		bsr.w	sub_1AD4A4
		bcc.s	loc_1AD45C
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD45C:					  ; CODE XREF: sub_1AD41A+10j
						  ; sub_1AD41A+20j ...
		tst.b	d0
		rts
; End of function sub_1AD41A


; =============== S U B	R O U T	I N E =======================================


sub_1AD460:					  ; CODE XREF: ROM:001AD398p
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD4A0
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0050,d7
		bcc.s	loc_1AD4A0
		bsr.s	sub_1AD4A4
		bcc.s	loc_1AD4A0
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD4A0:					  ; CODE XREF: sub_1AD460+10j
						  ; sub_1AD460+20j ...
		tst.b	d0
		rts
; End of function sub_1AD460


; =============== S U B	R O U T	I N E =======================================


sub_1AD4A4:					  ; CODE XREF: ROM:001AD376p
						  ; sub_1AD3E8+22p ...
		btst	#$06,$0000000C(a5)
		beq.s	loc_1AD4BA
		move.w	#$000F,d1
		bsr.w	sub_1AE944
		bcs.s	loc_1AD4BA
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1AD4BA:					  ; CODE XREF: sub_1AD4A4+6j
						  ; sub_1AD4A4+10j
		bclr	#$06,$0000000C(a5)
		ori	#$01,ccr
		rts
; End of function sub_1AD4A4

; ---------------------------------------------------------------------------

loc_1AD4C6:					  ; CODE XREF: ROM:001AD320j
		andi.b	#$0F,d0
		beq.s	loc_1AD4E0
		cmpi.b	#$01,d0
		beq.s	loc_1AD4E0
		cmpi.b	#$02,d0
		beq.s	loc_1AD4E0
		cmpi.b	#$03,d0
		beq.s	loc_1AD554
		bra.s	loc_1AD554
; ---------------------------------------------------------------------------

loc_1AD4E0:					  ; CODE XREF: ROM:001AD4CAj
						  ; ROM:001AD4D0j ...
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$01,$0000004D(a5)
		bne.s	loc_1AD502
		move.w	#$0300,$0000002C(a5)
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1AD502:					  ; CODE XREF: ROM:001AD4EAj
		cmpi.b	#$02,$0000004D(a5)
		bne.w	loc_1AD514
		move.b	#$01,d0
		bra.w	LoadProjectilePalette
; ---------------------------------------------------------------------------

loc_1AD514:					  ; CODE XREF: ROM:001AD508j
		cmpi.b	#$2D,$0000004D(a5)
		bhi.w	loc_1AD53A
		bcs.w	locret_1AD54A
		move.w	#$0200,$0000002C(a5)
		move.b	#$01,d0
		move.w	#$0300,d1
		bsr.w	sub_1AC474
		bcs.w	loc_1AD54C
		rts
; ---------------------------------------------------------------------------

loc_1AD53A:					  ; CODE XREF: ROM:001AD51Aj
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$46,$0000004D(a5)
		beq.w	loc_1AD54C

locret_1AD54A:					  ; CODE XREF: ROM:001AD51Ej
		rts
; ---------------------------------------------------------------------------

loc_1AD54C:					  ; CODE XREF: ROM:001AD534j
						  ; ROM:001AD546j
		clr.b	$0000004D(a5)
		bra.w	loc_1AD352
; ---------------------------------------------------------------------------

loc_1AD554:					  ; CODE XREF: ROM:001AD4DCj
						  ; ROM:001AD4DEj
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	locret_1AD588
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1AD588
		beq.w	loc_1AD352

locret_1AD588:					  ; CODE XREF: ROM:001AD564j
						  ; ROM:001AD582j
		rts
; ---------------------------------------------------------------------------

EnemyAI_Spectre2_B:				  ; CODE XREF: ROM:001A865Aj
		bra.s	loc_1AD5D8
; ---------------------------------------------------------------------------

EnemyAI_Spectre2_A:				  ; CODE XREF: ROM:001A8656j
		bset	#$07,$00000020(a5)
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AD5AA
		move.b	$00000037(a5),d0
		beq.s	loc_1AD5B0
		cmpi.b	#$10,d0
		beq.s	loc_1AD5DC
		bra.w	loc_1AD74C
; ---------------------------------------------------------------------------

loc_1AD5AA:					  ; CODE XREF: ROM:001AD598j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AD5B0:					  ; CODE XREF: ROM:001AD59Ej
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AD5D8
		rts
; ---------------------------------------------------------------------------

loc_1AD5D8:					  ; CODE XREF: ROM:EnemyAI_Spectre2_Bj
						  ; ROM:001AD5D4j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AD5DC:					  ; CODE XREF: ROM:001AD5A4j
		tst.b	(byte_FF1142).l
		bne.s	loc_1AD628
		btst	#$06,$0000000C(a5)
		beq.s	loc_1AD600
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$1E,$0000004D(a5)
		bcs.s	loc_1AD622
		subq.b	#$01,$0000004D(a5)
		bsr.w	sub_1AD72A

loc_1AD600:					  ; CODE XREF: ROM:001AD5EAj
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1AD62C
		bcs.s	loc_1AD622
		bsr.s	sub_1AD66E
		bcs.s	loc_1AD622
		bsr.w	sub_1AD6A0
		bcs.s	loc_1AD622
		bsr.w	sub_1AD6E6

loc_1AD622:					  ; CODE XREF: ROM:001AD5F6j
						  ; ROM:001AD612j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AD628:					  ; CODE XREF: ROM:001AD5E2j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AD62C:					  ; CODE XREF: ROM:001AD610p
		move.w	#$0070,d5
		move.w	#$0030,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD66A
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1AD66A
		bset	#$06,$0000000C(a5)
		move.w	#$0100,$00000012(a5)
		move.w	#$0120,$00000054(a5)
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD66A:					  ; CODE XREF: sub_1AD62C+10j
						  ; sub_1AD62C+20j
		tst.b	d0
		rts
; End of function sub_1AD62C


; =============== S U B	R O U T	I N E =======================================


sub_1AD66E:					  ; CODE XREF: ROM:001AD614p
		move.w	#$0060,d5
		move.w	#$0000,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD69C
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0006,d7
		bhi.s	loc_1AD69C
		bsr.w	sub_1AD72A
		bcc.s	loc_1AD69C
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD69C:					  ; CODE XREF: sub_1AD66E+10j
						  ; sub_1AD66E+20j ...
		tst.b	d0
		rts
; End of function sub_1AD66E


; =============== S U B	R O U T	I N E =======================================


sub_1AD6A0:					  ; CODE XREF: ROM:001AD618p
		move.w	#$0060,d5
		move.w	#$0048,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD6E2
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0010,d7
		bhi.s	loc_1AD6E2
		bsr.w	sub_1AD72A
		bcc.s	loc_1AD6E2
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD6E2:					  ; CODE XREF: sub_1AD6A0+10j
						  ; sub_1AD6A0+20j ...
		tst.b	d0
		rts
; End of function sub_1AD6A0


; =============== S U B	R O U T	I N E =======================================


sub_1AD6E6:					  ; CODE XREF: ROM:001AD61Ep
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD726
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0050,d7
		bcc.s	loc_1AD726
		bsr.s	sub_1AD72A
		bcc.s	loc_1AD726
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD726:					  ; CODE XREF: sub_1AD6E6+10j
						  ; sub_1AD6E6+20j ...
		tst.b	d0
		rts
; End of function sub_1AD6E6


; =============== S U B	R O U T	I N E =======================================


sub_1AD72A:					  ; CODE XREF: ROM:001AD5FCp
						  ; sub_1AD66E+22p ...
		btst	#$06,$0000000C(a5)
		beq.s	loc_1AD740
		move.w	#$000F,d1
		bsr.w	sub_1AE944
		bcs.s	loc_1AD740
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1AD740:					  ; CODE XREF: sub_1AD72A+6j
						  ; sub_1AD72A+10j
		bclr	#$06,$0000000C(a5)
		ori	#$01,ccr
		rts
; End of function sub_1AD72A

; ---------------------------------------------------------------------------

loc_1AD74C:					  ; CODE XREF: ROM:001AD5A6j
		andi.b	#$0F,d0
		beq.s	loc_1AD766
		cmpi.b	#$01,d0
		beq.s	loc_1AD766
		cmpi.b	#$02,d0
		beq.s	loc_1AD766
		cmpi.b	#$03,d0
		beq.s	loc_1AD7DA
		bra.s	loc_1AD7DA
; ---------------------------------------------------------------------------

loc_1AD766:					  ; CODE XREF: ROM:001AD750j
						  ; ROM:001AD756j ...
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$01,$0000004D(a5)
		bne.s	loc_1AD788
		move.w	#$0300,$0000002C(a5)
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1AD788:					  ; CODE XREF: ROM:001AD770j
		cmpi.b	#$02,$0000004D(a5)
		bne.w	loc_1AD79A
		move.b	#$01,d0
		bra.w	LoadProjectilePalette
; ---------------------------------------------------------------------------

loc_1AD79A:					  ; CODE XREF: ROM:001AD78Ej
		cmpi.b	#$2D,$0000004D(a5)
		bhi.w	loc_1AD7C0
		bcs.w	locret_1AD7D0
		move.w	#$0200,$0000002C(a5)
		move.b	#$01,d0
		move.w	#$0500,d1
		bsr.w	sub_1AC474
		bcs.w	loc_1AD7D2
		rts
; ---------------------------------------------------------------------------

loc_1AD7C0:					  ; CODE XREF: ROM:001AD7A0j
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$46,$0000004D(a5)
		beq.w	loc_1AD7D2

locret_1AD7D0:					  ; CODE XREF: ROM:001AD7A4j
		rts
; ---------------------------------------------------------------------------

loc_1AD7D2:					  ; CODE XREF: ROM:001AD7BAj
						  ; ROM:001AD7CCj
		clr.b	$0000004D(a5)
		bra.w	loc_1AD5D8
; ---------------------------------------------------------------------------

loc_1AD7DA:					  ; CODE XREF: ROM:001AD762j
						  ; ROM:001AD764j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	locret_1AD80E
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1AD80E
		beq.w	loc_1AD5D8

locret_1AD80E:					  ; CODE XREF: ROM:001AD7EAj
						  ; ROM:001AD808j
		rts
; ---------------------------------------------------------------------------

EnemyAI_Spectre3_B:				  ; CODE XREF: ROM:001A8662j
		bra.s	loc_1AD85E
; ---------------------------------------------------------------------------

EnemyAI_Spectre3_A:				  ; CODE XREF: ROM:001A865Ej
		bset	#$07,$00000020(a5)
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AD830
		move.b	$00000037(a5),d0
		beq.s	loc_1AD836
		cmpi.b	#$10,d0
		beq.s	loc_1AD862
		bra.w	loc_1AD9D2
; ---------------------------------------------------------------------------

loc_1AD830:					  ; CODE XREF: ROM:001AD81Ej
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AD836:					  ; CODE XREF: ROM:001AD824j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AD85E
		rts
; ---------------------------------------------------------------------------

loc_1AD85E:					  ; CODE XREF: ROM:EnemyAI_Spectre3_Bj
						  ; ROM:001AD85Aj ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AD862:					  ; CODE XREF: ROM:001AD82Aj
		tst.b	(byte_FF1142).l
		bne.s	loc_1AD8AE
		btst	#$06,$0000000C(a5)
		beq.s	loc_1AD886
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$1E,$0000004D(a5)
		bcs.s	loc_1AD8A8
		subq.b	#$01,$0000004D(a5)
		bsr.w	sub_1AD9B0

loc_1AD886:					  ; CODE XREF: ROM:001AD870j
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1AD8B2
		bcs.s	loc_1AD8A8
		bsr.s	sub_1AD8F4
		bcs.s	loc_1AD8A8
		bsr.w	sub_1AD926
		bcs.s	loc_1AD8A8
		bsr.w	sub_1AD96C

loc_1AD8A8:					  ; CODE XREF: ROM:001AD87Cj
						  ; ROM:001AD898j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AD8AE:					  ; CODE XREF: ROM:001AD868j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AD8B2:					  ; CODE XREF: ROM:001AD896p
		move.w	#$0070,d5
		move.w	#$0030,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD8F0
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0020,d7
		bhi.s	loc_1AD8F0
		bset	#$06,$0000000C(a5)
		move.w	#$0100,$00000012(a5)
		move.w	#$0120,$00000054(a5)
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD8F0:					  ; CODE XREF: sub_1AD8B2+10j
						  ; sub_1AD8B2+20j
		tst.b	d0
		rts
; End of function sub_1AD8B2


; =============== S U B	R O U T	I N E =======================================


sub_1AD8F4:					  ; CODE XREF: ROM:001AD89Ap
		move.w	#$0060,d5
		move.w	#$0000,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD922
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0006,d7
		bhi.s	loc_1AD922
		bsr.w	sub_1AD9B0
		bcc.s	loc_1AD922
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD922:					  ; CODE XREF: sub_1AD8F4+10j
						  ; sub_1AD8F4+20j ...
		tst.b	d0
		rts
; End of function sub_1AD8F4


; =============== S U B	R O U T	I N E =======================================


sub_1AD926:					  ; CODE XREF: ROM:001AD89Ep
		move.w	#$0060,d5
		move.w	#$0048,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD968
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0019,d7
		bhi.s	loc_1AD968
		bsr.w	sub_1AD9B0
		bcc.s	loc_1AD968
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD968:					  ; CODE XREF: sub_1AD926+10j
						  ; sub_1AD926+20j ...
		tst.b	d0
		rts
; End of function sub_1AD926


; =============== S U B	R O U T	I N E =======================================


sub_1AD96C:					  ; CODE XREF: ROM:001AD8A4p
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD9AC
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0050,d7
		bcc.s	loc_1AD9AC
		bsr.s	sub_1AD9B0
		bcc.s	loc_1AD9AC
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD9AC:					  ; CODE XREF: sub_1AD96C+10j
						  ; sub_1AD96C+20j ...
		tst.b	d0
		rts
; End of function sub_1AD96C


; =============== S U B	R O U T	I N E =======================================


sub_1AD9B0:					  ; CODE XREF: ROM:001AD882p
						  ; sub_1AD8F4+22p ...
		btst	#$06,$0000000C(a5)
		beq.s	loc_1AD9C6
		move.w	#$000F,d1
		bsr.w	sub_1AE944
		bcs.s	loc_1AD9C6
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1AD9C6:					  ; CODE XREF: sub_1AD9B0+6j
						  ; sub_1AD9B0+10j
		bclr	#$06,$0000000C(a5)
		ori	#$01,ccr
		rts
; End of function sub_1AD9B0

; ---------------------------------------------------------------------------

loc_1AD9D2:					  ; CODE XREF: ROM:001AD82Cj
		andi.b	#$0F,d0
		beq.s	loc_1AD9EC
		cmpi.b	#$01,d0
		beq.s	loc_1AD9EC
		cmpi.b	#$02,d0
		beq.s	loc_1AD9EC
		cmpi.b	#$03,d0
		beq.s	loc_1ADA60
		bra.s	loc_1ADA60
; ---------------------------------------------------------------------------

loc_1AD9EC:					  ; CODE XREF: ROM:001AD9D6j
						  ; ROM:001AD9DCj ...
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$01,$0000004D(a5)
		bne.s	loc_1ADA0E
		move.w	#$0300,$0000002C(a5)
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1ADA0E:					  ; CODE XREF: ROM:001AD9F6j
		cmpi.b	#$02,$0000004D(a5)
		bne.w	loc_1ADA20
		move.b	#$01,d0
		bra.w	LoadProjectilePalette
; ---------------------------------------------------------------------------

loc_1ADA20:					  ; CODE XREF: ROM:001ADA14j
		cmpi.b	#$2D,$0000004D(a5)
		bhi.w	loc_1ADA46
		bcs.w	locret_1ADA56
		move.w	#$0200,$0000002C(a5)
		move.b	#$01,d0
		move.w	#$0700,d1
		bsr.w	sub_1AC474
		bcs.w	loc_1ADA58
		rts
; ---------------------------------------------------------------------------

loc_1ADA46:					  ; CODE XREF: ROM:001ADA26j
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$46,$0000004D(a5)
		beq.w	loc_1ADA58

locret_1ADA56:					  ; CODE XREF: ROM:001ADA2Aj
		rts
; ---------------------------------------------------------------------------

loc_1ADA58:					  ; CODE XREF: ROM:001ADA40j
						  ; ROM:001ADA52j
		clr.b	$0000004D(a5)
		bra.w	loc_1AD85E
; ---------------------------------------------------------------------------

loc_1ADA60:					  ; CODE XREF: ROM:001AD9E8j
						  ; ROM:001AD9EAj
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	locret_1ADA94
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1ADA94
		beq.w	loc_1AD85E

locret_1ADA94:					  ; CODE XREF: ROM:001ADA70j
						  ; ROM:001ADA8Ej
		rts
; ---------------------------------------------------------------------------

EnemyAI_Bird1_B:				  ; CODE XREF: ROM:001A866Aj
		bra.s	loc_1ADADC
; ---------------------------------------------------------------------------

EnemyAI_Bird1_A:				  ; CODE XREF: ROM:001A8666j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1ADAB0
		move.b	$00000037(a5),d0
		beq.s	loc_1ADAB6
		cmpi.b	#$10,d0
		beq.s	loc_1ADAF4
		bra.w	loc_1ADC6C
; ---------------------------------------------------------------------------

loc_1ADAB0:					  ; CODE XREF: ROM:001ADA9Ej
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ADAB6:					  ; CODE XREF: ROM:001ADAA4j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		rts
; ---------------------------------------------------------------------------

loc_1ADADC:					  ; CODE XREF: ROM:EnemyAI_Bird1_Bj
						  ; ROM:001ADC8Ej ...
		move.w	#$0004,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ADAF4:					  ; CODE XREF: ROM:001ADAAAj
		tst.b	(byte_FF1142).l
		bne.s	loc_1ADB24
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1ADB28
		bcs.s	loc_1ADB1E
		bsr.s	sub_1ADB76
		bcs.s	loc_1ADB1E
		bsr.w	sub_1ADBC4
		bcs.s	loc_1ADB1E
		bsr.w	sub_1ADC12

loc_1ADB1E:					  ; CODE XREF: ROM:001ADB0Ej
						  ; ROM:001ADB12j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ADB24:					  ; CODE XREF: ROM:001ADAFAj
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1ADB28:					  ; CODE XREF: ROM:001ADB0Cp
		move.w	#$0050,d5
		move.w	#$0050,d6
		move.w	#$0050,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ADB72
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1ADB72
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1ADB72
		move.b	#$20,$00000037(a5)
		move.w	#$000E,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADB72:					  ; CODE XREF: sub_1ADB28+10j
						  ; sub_1ADB28+22j ...
		tst.b	d0
		rts
; End of function sub_1ADB28


; =============== S U B	R O U T	I N E =======================================


sub_1ADB76:					  ; CODE XREF: ROM:001ADB10p
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ADBC0
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1ADBC0
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1ADBC0
		move.b	#$21,$00000037(a5)
		move.w	#$0007,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADBC0:					  ; CODE XREF: sub_1ADB76+10j
						  ; sub_1ADB76+22j ...
		tst.b	d0
		rts
; End of function sub_1ADB76


; =============== S U B	R O U T	I N E =======================================


sub_1ADBC4:					  ; CODE XREF: ROM:001ADB14p
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ADC0E
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1ADC0E
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1ADC0E
		move.b	#$22,$00000037(a5)
		move.w	#$0008,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADC0E:					  ; CODE XREF: sub_1ADBC4+10j
						  ; sub_1ADBC4+22j ...
		tst.b	d0
		rts
; End of function sub_1ADBC4


; =============== S U B	R O U T	I N E =======================================


sub_1ADC12:					  ; CODE XREF: ROM:001ADB1Ap
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ADC68
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bcc.s	loc_1ADC4E
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADC4E:					  ; CODE XREF: sub_1ADC12+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0009,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADC68:					  ; CODE XREF: sub_1ADC12+10j
		tst.b	d0
		rts
; End of function sub_1ADC12

; ---------------------------------------------------------------------------

loc_1ADC6C:					  ; CODE XREF: ROM:001ADAACj
		andi.b	#$0F,d0
		beq.s	loc_1ADC86
		cmpi.b	#$01,d0
		beq.s	loc_1ADC92
		cmpi.b	#$02,d0
		beq.s	loc_1ADC92
		cmpi.b	#$03,d0
		beq.s	loc_1ADC98
		bra.s	loc_1ADC98
; ---------------------------------------------------------------------------

loc_1ADC86:					  ; CODE XREF: ROM:001ADC70j
		move.b	$0000002D(a5),d0
		andi.b	#$30,d0
		beq.w	loc_1ADADC

loc_1ADC92:					  ; CODE XREF: ROM:001ADC76j
						  ; ROM:001ADC7Cj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ADC98:					  ; CODE XREF: ROM:001ADC82j
						  ; ROM:001ADC84j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	locret_1ADCCC
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1ADCCC
		beq.w	loc_1ADADC

locret_1ADCCC:					  ; CODE XREF: ROM:001ADCA8j
						  ; ROM:001ADCC6j
		rts
; ---------------------------------------------------------------------------

EnemyAI_Bird2_B:				  ; CODE XREF: ROM:001A8672j
		bra.s	loc_1ADD14
; ---------------------------------------------------------------------------

EnemyAI_Bird2_A:				  ; CODE XREF: ROM:001A866Ej
		btst	#$01,$0000000C(a5)
		bne.s	loc_1ADCE8
		move.b	$00000037(a5),d0
		beq.s	loc_1ADCEE
		cmpi.b	#$10,d0
		beq.s	loc_1ADD2C
		bra.w	loc_1ADEA4
; ---------------------------------------------------------------------------

loc_1ADCE8:					  ; CODE XREF: ROM:001ADCD6j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ADCEE:					  ; CODE XREF: ROM:001ADCDCj
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		rts
; ---------------------------------------------------------------------------

loc_1ADD14:					  ; CODE XREF: ROM:EnemyAI_Bird2_Bj
						  ; ROM:001ADEC6j ...
		move.w	#$0004,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ADD2C:					  ; CODE XREF: ROM:001ADCE2j
		tst.b	(byte_FF1142).l
		bne.s	loc_1ADD5C
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1ADD60
		bcs.s	loc_1ADD56
		bsr.s	sub_1ADDAE
		bcs.s	loc_1ADD56
		bsr.w	sub_1ADDFC
		bcs.s	loc_1ADD56
		bsr.w	sub_1ADE4A

loc_1ADD56:					  ; CODE XREF: ROM:001ADD46j
						  ; ROM:001ADD4Aj ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ADD5C:					  ; CODE XREF: ROM:001ADD32j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1ADD60:					  ; CODE XREF: ROM:001ADD44p
		move.w	#$0050,d5
		move.w	#$0050,d6
		move.w	#$0050,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ADDAA
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1ADDAA
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1ADDAA
		move.b	#$20,$00000037(a5)
		move.w	#$000E,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADDAA:					  ; CODE XREF: sub_1ADD60+10j
						  ; sub_1ADD60+22j ...
		tst.b	d0
		rts
; End of function sub_1ADD60


; =============== S U B	R O U T	I N E =======================================


sub_1ADDAE:					  ; CODE XREF: ROM:001ADD48p
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ADDF8
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1ADDF8
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1ADDF8
		move.b	#$21,$00000037(a5)
		move.w	#$0007,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADDF8:					  ; CODE XREF: sub_1ADDAE+10j
						  ; sub_1ADDAE+22j ...
		tst.b	d0
		rts
; End of function sub_1ADDAE


; =============== S U B	R O U T	I N E =======================================


sub_1ADDFC:					  ; CODE XREF: ROM:001ADD4Cp
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ADE46
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1ADE46
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1ADE46
		move.b	#$22,$00000037(a5)
		move.w	#$0008,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADE46:					  ; CODE XREF: sub_1ADDFC+10j
						  ; sub_1ADDFC+22j ...
		tst.b	d0
		rts
; End of function sub_1ADDFC


; =============== S U B	R O U T	I N E =======================================


sub_1ADE4A:					  ; CODE XREF: ROM:001ADD52p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ADEA0
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bcc.s	loc_1ADE86
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADE86:					  ; CODE XREF: sub_1ADE4A+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0009,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADEA0:					  ; CODE XREF: sub_1ADE4A+10j
		tst.b	d0
		rts
; End of function sub_1ADE4A

; ---------------------------------------------------------------------------

loc_1ADEA4:					  ; CODE XREF: ROM:001ADCE4j
		andi.b	#$0F,d0
		beq.s	loc_1ADEBE
		cmpi.b	#$01,d0
		beq.s	loc_1ADECA
		cmpi.b	#$02,d0
		beq.s	loc_1ADECA
		cmpi.b	#$03,d0
		beq.s	loc_1ADED0
		bra.s	loc_1ADED0
; ---------------------------------------------------------------------------

loc_1ADEBE:					  ; CODE XREF: ROM:001ADEA8j
		move.b	$0000002D(a5),d0
		andi.b	#$30,d0
		beq.w	loc_1ADD14

loc_1ADECA:					  ; CODE XREF: ROM:001ADEAEj
						  ; ROM:001ADEB4j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ADED0:					  ; CODE XREF: ROM:001ADEBAj
						  ; ROM:001ADEBCj
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	locret_1ADF04
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1ADF04
		beq.w	loc_1ADD14

locret_1ADF04:					  ; CODE XREF: ROM:001ADEE0j
						  ; ROM:001ADEFEj
		rts
; ---------------------------------------------------------------------------

EnemyAI_Bird3_B:				  ; CODE XREF: ROM:001A867Aj
		bra.s	loc_1ADF4C
; ---------------------------------------------------------------------------

EnemyAI_Bird3_A:				  ; CODE XREF: ROM:001A8676j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1ADF20
		move.b	$00000037(a5),d0
		beq.s	loc_1ADF26
		cmpi.b	#$10,d0
		beq.s	loc_1ADF64
		bra.w	loc_1AE0DC
; ---------------------------------------------------------------------------

loc_1ADF20:					  ; CODE XREF: ROM:001ADF0Ej
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ADF26:					  ; CODE XREF: ROM:001ADF14j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		rts
; ---------------------------------------------------------------------------

loc_1ADF4C:					  ; CODE XREF: ROM:EnemyAI_Bird3_Bj
						  ; ROM:001AE0FEj ...
		move.w	#$0004,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ADF64:					  ; CODE XREF: ROM:001ADF1Aj
		tst.b	(byte_FF1142).l
		bne.s	loc_1ADF94
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1ADF98
		bcs.s	loc_1ADF8E
		bsr.s	sub_1ADFE6
		bcs.s	loc_1ADF8E
		bsr.w	sub_1AE034
		bcs.s	loc_1ADF8E
		bsr.w	sub_1AE082

loc_1ADF8E:					  ; CODE XREF: ROM:001ADF7Ej
						  ; ROM:001ADF82j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1ADF94:					  ; CODE XREF: ROM:001ADF6Aj
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1ADF98:					  ; CODE XREF: ROM:001ADF7Cp
		move.w	#$0050,d5
		move.w	#$0050,d6
		move.w	#$0050,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ADFE2
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1ADFE2
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1ADFE2
		move.b	#$20,$00000037(a5)
		move.w	#$000E,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADFE2:					  ; CODE XREF: sub_1ADF98+10j
						  ; sub_1ADF98+22j ...
		tst.b	d0
		rts
; End of function sub_1ADF98


; =============== S U B	R O U T	I N E =======================================


sub_1ADFE6:					  ; CODE XREF: ROM:001ADF80p
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AE030
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AE030
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1AE030
		move.b	#$21,$00000037(a5)
		move.w	#$0007,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AE030:					  ; CODE XREF: sub_1ADFE6+10j
						  ; sub_1ADFE6+22j ...
		tst.b	d0
		rts
; End of function sub_1ADFE6


; =============== S U B	R O U T	I N E =======================================


sub_1AE034:					  ; CODE XREF: ROM:001ADF84p
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AE07E
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AE07E
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1AE07E
		move.b	#$22,$00000037(a5)
		move.w	#$0008,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AE07E:					  ; CODE XREF: sub_1AE034+10j
						  ; sub_1AE034+22j ...
		tst.b	d0
		rts
; End of function sub_1AE034


; =============== S U B	R O U T	I N E =======================================


sub_1AE082:					  ; CODE XREF: ROM:001ADF8Ap
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AE0D8
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bcc.s	loc_1AE0BE
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AE0BE:					  ; CODE XREF: sub_1AE082+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0009,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AE0D8:					  ; CODE XREF: sub_1AE082+10j
		tst.b	d0
		rts
; End of function sub_1AE082

; ---------------------------------------------------------------------------

loc_1AE0DC:					  ; CODE XREF: ROM:001ADF1Cj
		andi.b	#$0F,d0
		beq.s	loc_1AE0F6
		cmpi.b	#$01,d0
		beq.s	loc_1AE102
		cmpi.b	#$02,d0
		beq.s	loc_1AE102
		cmpi.b	#$03,d0
		beq.s	loc_1AE108
		bra.s	loc_1AE108
; ---------------------------------------------------------------------------

loc_1AE0F6:					  ; CODE XREF: ROM:001AE0E0j
		move.b	$0000002D(a5),d0
		andi.b	#$30,d0
		beq.w	loc_1ADF4C

loc_1AE102:					  ; CODE XREF: ROM:001AE0E6j
						  ; ROM:001AE0ECj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AE108:					  ; CODE XREF: ROM:001AE0F2j
						  ; ROM:001AE0F4j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$0F,$0000000D(a5)
		bcs.s	locret_1AE13C
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$1E,$0000000D(a5)
		bcs.s	locret_1AE13C
		beq.w	loc_1ADF4C

locret_1AE13C:					  ; CODE XREF: ROM:001AE118j
						  ; ROM:001AE136j
		rts
; ---------------------------------------------------------------------------

EnemyAI_Spinner_B:				  ; CODE XREF: ROM:001A8682j
						  ; ROM:001A86CAj
		bra.s	loc_1AE15C
; ---------------------------------------------------------------------------

EnemyAI_Spinner_A:				  ; CODE XREF: ROM:001A867Ej
						  ; ROM:001A86C6j
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AE156
		move.b	$00000037(a5),d0
		cmpi.b	#$10,d0
		beq.s	loc_1AE180
		bra.w	loc_1AE2DC
; ---------------------------------------------------------------------------

loc_1AE156:					  ; CODE XREF: ROM:001AE146j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AE15C:					  ; CODE XREF: ROM:EnemyAI_Spinner_Bj
						  ; ROM:001AE394j
		bclr	#$06,$00000038(a5)
		bclr	#$00,$00000038(a5)
		move.w	#$0180,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AE180:					  ; CODE XREF: ROM:001AE150j
		bclr	#$00,$00000038(a5)
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1AE1B4
		bcs.s	loc_1AE1AE
		bsr.s	sub_1AE1F4
		bcs.s	loc_1AE1AE
		bsr.w	sub_1AE234
		bcs.s	loc_1AE1AE
		bsr.w	sub_1AE274
		bcs.s	loc_1AE1AE
		bsr.w	sub_1AE2A0

loc_1AE1AE:					  ; CODE XREF: ROM:001AE198j
						  ; ROM:001AE19Cj ...
		bsr.w	LoadSpecialAI
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1AE1B4:					  ; CODE XREF: ROM:001AE196p
		move.w	#$00A0,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AE1F0
		move.b	$00000004(a5),d0
		andi.b	#$C0,d0
		cmpi.b	#$40,d0
		cmpi.b	#$80,d0
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AE1F0:					  ; CODE XREF: sub_1AE1B4+10j
		tst.b	d0
		rts
; End of function sub_1AE1B4


; =============== S U B	R O U T	I N E =======================================


sub_1AE1F4:					  ; CODE XREF: ROM:001AE19Ap
		move.w	#$0050,d5
		move.w	#$FFE0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AE230
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0019,d7
		bhi.s	loc_1AE230
		move.b	#$21,$00000037(a5)
		move.w	#$001A,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AE230:					  ; CODE XREF: sub_1AE1F4+10j
						  ; sub_1AE1F4+20j
		tst.b	d0
		rts
; End of function sub_1AE1F4


; =============== S U B	R O U T	I N E =======================================


sub_1AE234:					  ; CODE XREF: ROM:001AE19Ep
		move.w	#$0030,d5
		move.w	#$FFE0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AE270
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0010,d7
		bhi.s	loc_1AE270
		move.b	#$22,$00000037(a5)
		move.w	#$0012,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AE270:					  ; CODE XREF: sub_1AE234+10j
						  ; sub_1AE234+20j
		tst.b	d0
		rts
; End of function sub_1AE234


; =============== S U B	R O U T	I N E =======================================


sub_1AE274:					  ; CODE XREF: ROM:001AE1A4p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AE2D8
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; End of function sub_1AE274


; =============== S U B	R O U T	I N E =======================================


sub_1AE2A0:					  ; CODE XREF: ROM:001AE1AAp
		move.w	#$0040,d5
		move.w	#$FFF0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AE2D8
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
		beq.s	loc_1AE2D8
		move.b	#$24,$00000037(a5)
		move.w	#$017F,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AE2D8:					  ; CODE XREF: sub_1AE274+10j
						  ; sub_1AE2A0+10j ...
		tst.b	d0
		rts
; End of function sub_1AE2A0

; ---------------------------------------------------------------------------

loc_1AE2DC:					  ; CODE XREF: ROM:001AE152j
		andi.b	#$0F,d0
		beq.s	loc_1AE2F8
		cmpi.b	#$01,d0
		beq.s	loc_1AE33C
		cmpi.b	#$02,d0
		beq.s	loc_1AE33C
		cmpi.b	#$03,d0
		beq.s	loc_1AE33C
		bra.w	loc_1AE398
; ---------------------------------------------------------------------------

loc_1AE2F8:					  ; CODE XREF: ROM:001AE2E0j
		cmpi.b	#$14,$0000004D(a5)
		bhi.s	loc_1AE336
		move.w	#$0500,$0000002C(a5)
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$0A,$0000004D(a5)
		bcs.s	loc_1AE336
		move.w	#$0600,$0000002C(a5)
		cmpi.b	#$14,$0000004D(a5)
		bcs.s	loc_1AE336
		bset	#$06,$00000038(a5)
		bset	#$00,$00000038(a5)
		move.w	#$0320,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour

loc_1AE336:					  ; CODE XREF: ROM:001AE2FEj
						  ; ROM:001AE310j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AE33C:					  ; CODE XREF: ROM:001AE2E6j
						  ; ROM:001AE2ECj ...
		bset	#$00,$00000038(a5)
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$05,$0000004D(a5)
		bcs.s	loc_1AE398
		bne.s	loc_1AE35A
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordSwing
; ---------------------------------------------------------------------------

loc_1AE35A:					  ; CODE XREF: ROM:001AE354j
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$0A,$0000004D(a5)
		bcs.s	loc_1AE398
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0300,$0000002C(a5)
		cmpi.b	#$0F,$0000004D(a5)
		bcs.s	loc_1AE398
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$14,$0000004D(a5)
		bcs.s	loc_1AE398
		beq.w	loc_1AE15C

loc_1AE398:					  ; CODE XREF: ROM:001AE2F4j
						  ; ROM:001AE352j ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

EnemyAI_Ifrit_B:				  ; CODE XREF: ROM:001A8692j
		bra.s	loc_1AE3C2
; ---------------------------------------------------------------------------

EnemyAI_Ifrit_A:				  ; CODE XREF: ROM:001A868Ej
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AE3B8
		move.b	$00000037(a5),d0
		beq.s	loc_1AE3C2
		cmpi.b	#$10,d0
		beq.s	loc_1AE3EC
		bra.w	loc_1AE562
; ---------------------------------------------------------------------------

loc_1AE3B8:					  ; CODE XREF: ROM:001AE3A6j
		clr.b	$00000009(a5)
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AE3C2:					  ; CODE XREF: ROM:EnemyAI_Ifrit_Bj
						  ; ROM:001AE3ACj
		bsr.s	sub_1AE3C8
		bra.w	loc_1AE4D4

; =============== S U B	R O U T	I N E =======================================


sub_1AE3C8:					  ; CODE XREF: ROM:loc_1AE3C2p
						  ; ROM:001AE602j ...
		bclr	#$06,$00000038(a5)
		bclr	#$00,$00000038(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		rts
; End of function sub_1AE3C8

; ---------------------------------------------------------------------------

loc_1AE3EC:					  ; CODE XREF: ROM:001AE3B2j
		bclr	#$00,$00000038(a5)
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.s	sub_1AE41C
		bcs.s	loc_1AE416
		bsr.w	sub_1AE4C4
		bcs.s	loc_1AE416
		bsr.w	sub_1AE4F8
		bcs.s	loc_1AE416
		bsr.w	sub_1AE524

loc_1AE416:					  ; CODE XREF: ROM:001AE404j
						  ; ROM:001AE40Aj ...
		bsr.w	LoadSpecialAI
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1AE41C:					  ; CODE XREF: ROM:001AE402p
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000A,d7
		bhi.w	loc_1AE4C0
		move.b	$00000004(a5),d0
		andi.b	#$C0,d0
		cmpi.w	#$1B1D,(a5)
		beq.s	loc_1AE45C
		cmpi.w	#$221D,(a5)
		beq.s	loc_1AE472
		cmpi.w	#$1B24,(a5)
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
		move.b	#$21,$00000037(a5)
		move.w	d1,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		bset	#$00,$00000038(a5)
		bset	#$06,$00000038(a5)
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
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0014,d7
		bhi.s	loc_1AE4F4

loc_1AE4D4:					  ; CODE XREF: ROM:001AE3C4j
		move.b	#$22,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		bset	#$00,$00000038(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AE4F4:					  ; CODE XREF: sub_1AE4C4+Ej
		tst.b	d0
		rts
; End of function sub_1AE4C4


; =============== S U B	R O U T	I N E =======================================


sub_1AE4F8:					  ; CODE XREF: ROM:001AE40Cp
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$004B,d7
		bcc.s	sub_1AE524
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
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
		move.b	#$24,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
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
		andi.b	#$3F,$00000004(a5)
		or.b	d2,$00000004(a5)
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
		bset	#$00,$00000038(a5)
		bset	#$06,$00000038(a5)
		move.w	#$0300,$0000002C(a5)
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$05,$0000004D(a5)
		bcs.w	loc_1AE606
		cmpi.b	#$0F,$0000004D(a5)
		bne.s	loc_1AE5BC
		move.w	#$0500,$0000002C(a5)
		addi.w	#$0010,$00000012(a5)
		bra.w	loc_1AE606
; ---------------------------------------------------------------------------

loc_1AE5BC:					  ; CODE XREF: ROM:001AE5AAj
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$10,$0000004D(a5)
		bcs.w	loc_1AE606
		clr.w	$0000002C(a5)
		cmpi.b	#$1D,$0000004D(a5)
		bcs.w	loc_1AE606
		bne.s	loc_1AE5E2
		subi.w	#$0010,$00000012(a5)

loc_1AE5E2:					  ; CODE XREF: ROM:001AE5DAj
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$22,$0000004D(a5)
		bcs.w	loc_1AE606
		move.w	#$0300,$0000002C(a5)
		cmpi.b	#$27,$0000004D(a5)
		bcs.w	loc_1AE606
		bra.w	sub_1AE3C8
; ---------------------------------------------------------------------------

loc_1AE606:					  ; CODE XREF: ROM:001AE5A0j
						  ; ROM:001AE5B8j ...
		bsr.w	LoadSpecialAI
		bclr	#$07,$0000000A(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AE612:					  ; CODE XREF: ROM:001AE572j
		bset	#$00,$00000038(a5)
		move.w	#$0600,$0000002C(a5)
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$05,$0000004D(a5)
		bcs.w	locret_1AE6A2
		move.w	#$0700,$0000002C(a5)
		cmpi.b	#$0F,$0000004D(a5)
		bcs.s	locret_1AE6A2
		bhi.s	loc_1AE67A
		bset	#$06,$0000000C(a5)
		move.w	#$0004,d6
		jsr	(j_GenerateRandomNumber).l
		add.b	d7,d7
		move.w	IfritCoordinates(pc,d7.w),d6
		cmp.w	X(a5),d6
		bne.s	loc_1AE660
		addq.b	#$02,d7
		andi.b	#$06,d7
		move.w	IfritCoordinates(pc,d7.w),d6

loc_1AE660:					  ; CODE XREF: ROM:001AE654j
		move.w	d6,(a5)
		move.w	#$0808,$00000002(a5)
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
		cmpi.b	#$14,$0000004D(a5)
		bcs.s	locret_1AE6A2
		bhi.s	loc_1AE690
		bsr.w	sub_1AE550
		bclr	#$06,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AE690:					  ; CODE XREF: ROM:001AE682j
		move.w	#$0600,$0000002C(a5)
		cmpi.b	#$1E,$0000004D(a5)
		bcs.s	locret_1AE6A2
		beq.w	sub_1AE3C8

locret_1AE6A2:					  ; CODE XREF: ROM:001AE628j
						  ; ROM:001AE638j ...
		rts
; ---------------------------------------------------------------------------

loc_1AE6A4:					  ; CODE XREF: ROM:001AE57Aj
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$01,$0000004D(a5)
		bne.s	loc_1AE6C6
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1AE6C6:					  ; CODE XREF: ROM:001AE6B4j
		cmpi.b	#$02,$0000004D(a5)
		bne.w	loc_1AE6D8
		move.b	#$01,d0
		bra.w	LoadProjectilePalette
; ---------------------------------------------------------------------------

loc_1AE6D8:					  ; CODE XREF: ROM:001AE6CCj
		cmpi.b	#$0A,$0000004D(a5)
		bhi.w	loc_1AE6FA
		bcs.w	locret_1AE70A
		move.w	#$0200,$0000002C(a5)
		move.w	#$0345,d6
		bsr.w	sub_1AE792
		bcs.w	loc_1AE70C
		rts
; ---------------------------------------------------------------------------

loc_1AE6FA:					  ; CODE XREF: ROM:001AE6DEj
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$14,$0000004D(a5)
		beq.w	loc_1AE70C

locret_1AE70A:					  ; CODE XREF: ROM:001AE6E2j
		rts
; ---------------------------------------------------------------------------

loc_1AE70C:					  ; CODE XREF: ROM:001AE6F4j
						  ; ROM:001AE706j
		clr.b	$0000004D(a5)
		bra.w	sub_1AE3C8
; ---------------------------------------------------------------------------

loc_1AE714:					  ; CODE XREF: ROM:001AE57Ej
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$01,$0000004D(a5)
		bne.s	loc_1AE736
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1AE736:					  ; CODE XREF: ROM:001AE724j
		cmpi.b	#$02,$0000004D(a5)
		bne.w	loc_1AE748
		move.b	#$01,d0
		bra.w	LoadProjectilePalette
; ---------------------------------------------------------------------------

loc_1AE748:					  ; CODE XREF: ROM:001AE73Cj
		cmpi.b	#$10,$0000004D(a5)
		bhi.w	loc_1AE778
		bcs.w	locret_1AE788
		move.w	#$0200,$0000002C(a5)
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
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$20,$0000004D(a5)
		beq.w	loc_1AE78A

locret_1AE788:					  ; CODE XREF: ROM:001AE752j
		rts
; ---------------------------------------------------------------------------

loc_1AE78A:					  ; CODE XREF: ROM:001AE762j
						  ; ROM:001AE76Cj ...
		clr.b	$0000004D(a5)
		bra.w	sub_1AE3C8

; =============== S U B	R O U T	I N E =======================================


sub_1AE792:					  ; CODE XREF: ROM:001AE6F0p
						  ; ROM:001AE760p ...
		move.b	$00000004(a5),d2
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
		move.w	d0,(a1)
		move.b	d1,$00000004(a1)
		move.b	#$A1,d2
		move.w	#$0F00,$0000003C(a1)
		move.w	$00000012(a5),d3
		addi.w	#$0020,d3
		move.w	d3,$00000012(a1)
		move.w	$00000002(a5),$00000002(a1)
		move.w	#$24B4,$00000006(a1)
		move.w	d6,$00000034(a1)
		move.b	#$04,$00000009(a1)
		move.b	#$80,$00000020(a1)
		jsr	(sub_103B8).l
		bset	#$00,$00000038(a1)
		bset	#$07,$0000000C(a1)
		bset	#$07,$0000004C(a1)
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1AE876:					  ; CODE XREF: sub_1AE792+1Aj
		ori	#$01,ccr
		rts
; End of function sub_1AE792

; ---------------------------------------------------------------------------

EnemyAI_Nole_B:					  ; CODE XREF: ROM:001A86A2j
		bra.s	loc_1AE8C4
; ---------------------------------------------------------------------------

EnemyAI_Nole_A:					  ; CODE XREF: ROM:001A869Ej
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AE896
		move.b	$00000037(a5),d0
		beq.s	loc_1AE89C
		cmpi.b	#$10,d0
		beq.s	loc_1AE8CE
		bra.w	loc_1AEAE4
; ---------------------------------------------------------------------------

loc_1AE896:					  ; CODE XREF: ROM:001AE884j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AE89C:					  ; CODE XREF: ROM:001AE88Aj
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	sub_1AE8CA
		rts
; ---------------------------------------------------------------------------

loc_1AE8C4:					  ; CODE XREF: ROM:EnemyAI_Nole_Bj
		bsr.s	sub_1AE8CA
		bra.w	loc_1AE9FE

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_1AE8CA:					  ; CODE XREF: ROM:001AE8C0j
						  ; ROM:loc_1AE8C4p ...
		bra.w	loc_1A8AB6
; End of function sub_1AE8CA

; ---------------------------------------------------------------------------

loc_1AE8CE:					  ; CODE XREF: ROM:001AE890j
		btst	#$06,$0000000C(a5)
		beq.s	loc_1AE8E6
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$1E,$0000004D(a5)
		bcs.s	loc_1AE912
		subq.b	#$01,$0000004D(a5)

loc_1AE8E6:					  ; CODE XREF: ROM:001AE8D4j
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.w	sub_1AE91C
		bcs.s	loc_1AE912
		bsr.w	sub_1AE9EE
		bcs.s	loc_1AE912
		bsr.w	sub_1AEA1C
		bcs.s	loc_1AE912
		bsr.w	sub_1AEA64
		bcs.s	loc_1AE912
		bsr.w	sub_1AEAAC

loc_1AE912:					  ; CODE XREF: ROM:001AE8E0j
						  ; ROM:001AE8FAj ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AE91C:					  ; CODE XREF: ROM:001AE8F6p

; FUNCTION CHUNK AT 001AE9D4 SIZE 0000001A BYTES

		btst	#$06,$0000000C(a5)
		beq.w	loc_1AE9CA
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$001E,d7
		bhi.w	loc_1AE9CA
		move.w	#$001F,d1
		bsr.s	sub_1AE944
		bcs.w	loc_1AE9D4
		rts
; End of function sub_1AE91C


; =============== S U B	R O U T	I N E =======================================


sub_1AE944:					  ; CODE XREF: sub_1AD4A4+Cp
						  ; sub_1AD72A+Cp ...
		movem.w	d1,-(sp)
		move.w	#$0007,d6
		jsr	(j_GenerateRandomNumber).l
		addi.b	#$03,d7
		move.w	d7,d5
		move.w	#$0002,d6
		jsr	(j_GenerateRandomNumber).l
		tst.b	d7
		beq.s	loc_1AE968
		neg.b	d5

loc_1AE968:					  ; CODE XREF: sub_1AE944+20j
		move.w	#$0002,d6
		jsr	(j_GenerateRandomNumber).l
		tst.b	d7
		beq.s	loc_1AE988
		add.b	(Player_X).l,d5
		move.b	d5,(a5)
		move.b	(Player_Y).l,$00000001(a5)
		bra.s	loc_1AE998
; ---------------------------------------------------------------------------

loc_1AE988:					  ; CODE XREF: sub_1AE944+30j
		add.b	(Player_Y).l,d5
		move.b	d5,$00000001(a5)
		move.b	(Player_X).l,(a5)

loc_1AE998:					  ; CODE XREF: sub_1AE944+42j
		movea.l	a5,a1
		jsr	(sub_1A8AE6).l
		move.w	(Player_Z).l,d0
		move.w	d0,$00000012(a5)
		movem.w	(sp)+,d1
		add.w	d1,d0
		move.w	d0,$00000054(a5)
		movea.l	a5,a1
		jsr	(sub_3BC).l
		bcc.s	loc_1AE9CE
		move.w	#$0100,$00000012(a5)
		move.w	#$0120,$00000054(a5)

loc_1AE9CA:					  ; CODE XREF: sub_1AE91C+6j
						  ; sub_1AE91C+18j
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1AE9CE:					  ; CODE XREF: sub_1AE944+78j
		ori	#$01,ccr
		rts
; End of function sub_1AE944

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1AE91C

loc_1AE9D4:					  ; CODE XREF: sub_1AE91C+22j
		move.b	#$25,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; END OF FUNCTION CHUNK	FOR sub_1AE91C

; =============== S U B	R O U T	I N E =======================================


sub_1AE9EE:					  ; CODE XREF: ROM:001AE8FCp
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0001,d7
		bhi.s	loc_1AEA18

loc_1AE9FE:					  ; CODE XREF: ROM:001AE8C6j
		move.b	#$20,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AEA18:					  ; CODE XREF: sub_1AE9EE+Ej
		tst.b	d0
		rts
; End of function sub_1AE9EE


; =============== S U B	R O U T	I N E =======================================


sub_1AEA1C:					  ; CODE XREF: ROM:001AE902p
		btst	#$06,$0000000C(a5)
		bne.s	loc_1AEA60
		move.w	#$00A0,d5
		move.w	#$FFD8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AEA60
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$012C,d7
		bhi.s	loc_1AEA60
		move.b	#$21,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AEA60:					  ; CODE XREF: sub_1AEA1C+6j
						  ; sub_1AEA1C+18j ...
		tst.b	d0
		rts
; End of function sub_1AEA1C


; =============== S U B	R O U T	I N E =======================================


sub_1AEA64:					  ; CODE XREF: ROM:001AE908p
		btst	#$06,$0000000C(a5)
		bne.s	loc_1AEAA8
		move.w	#$0048,d5
		move.w	#$0030,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AEAA8
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0019,d7
		bhi.s	loc_1AEAA8
		move.b	#$22,$00000037(a5)
		move.w	#$0012,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AEAA8:					  ; CODE XREF: sub_1AEA64+6j
						  ; sub_1AEA64+18j ...
		tst.b	d0
		rts
; End of function sub_1AEA64


; =============== S U B	R O U T	I N E =======================================


sub_1AEAAC:					  ; CODE XREF: ROM:001AE90Ep
		btst	#$06,$0000000C(a5)
		bne.s	loc_1AEAE0
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AEAE0
		move.b	#$23,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AEAE0:					  ; CODE XREF: sub_1AEAAC+6j
						  ; sub_1AEAAC+18j
		tst.b	d0
		rts
; End of function sub_1AEAAC

; ---------------------------------------------------------------------------

loc_1AEAE4:					  ; CODE XREF: ROM:001AE892j
		andi.b	#$0F,d0
		beq.s	loc_1AEB0C
		cmpi.b	#$01,d0
		beq.w	loc_1AEB8C
		cmpi.b	#$02,d0
		beq.w	loc_1AEBFC
		cmpi.b	#$03,d0
		beq.w	loc_1AEBFC
		cmpi.b	#$04,d0
		beq.w	loc_1AEBFC
		bra.s	loc_1AEB54
; ---------------------------------------------------------------------------

loc_1AEB0C:					  ; CODE XREF: ROM:001AEAE8j
		bset	#$00,$00000038(a5)
		move.w	#$0500,$0000002C(a5)
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$04,$0000004D(a5)
		bcs.s	locret_1AEB52
		move.w	#$0600,$0000002C(a5)
		cmpi.b	#$08,$0000004D(a5)
		bcs.s	locret_1AEB52
		bset	#$06,$0000000C(a5)
		move.w	#$0100,$00000012(a5)
		move.w	#$0120,$00000054(a5)
		bset	#$07,$00000020(a5)
		clr.b	$0000004D(a5)
		bra.w	sub_1AE8CA
; ---------------------------------------------------------------------------

locret_1AEB52:					  ; CODE XREF: ROM:001AEB22j
						  ; ROM:001AEB30j
		rts
; ---------------------------------------------------------------------------

loc_1AEB54:					  ; CODE XREF: ROM:001AEB0Aj
		bclr	#$06,$0000000C(a5)
		move.w	#$0600,$0000002C(a5)
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$04,$0000004D(a5)
		bcs.s	locret_1AEB8A
		move.w	#$0500,$0000002C(a5)
		cmpi.b	#$08,$0000004D(a5)
		bcs.s	locret_1AEB8A
		bclr	#$00,$00000038(a5)
		bclr	#$07,$00000020(a5)
		bra.w	sub_1AE8CA
; ---------------------------------------------------------------------------

locret_1AEB8A:					  ; CODE XREF: ROM:001AEB6Aj
						  ; ROM:001AEB78j
		rts
; ---------------------------------------------------------------------------

loc_1AEB8C:					  ; CODE XREF: ROM:001AEAEEj
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$08,$0000004D(a5)
		bcs.s	locret_1AEBF2
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$10,$0000004D(a5)
		bcs.s	locret_1AEBF2
		move.w	#$0300,$0000002C(a5)
		cmpi.b	#$18,$0000004D(a5)
		bhi.w	loc_1AEBE2
		bcs.w	locret_1AEBF2
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_GhostAbsorbHP
; ---------------------------------------------------------------------------
		move.b	#$02,d0
		move.w	#$1E00,d1
		bsr.w	sub_1AC474
		bcs.w	loc_1AEBF4
		move.w	#$24C0,$00000006(a1)
		move.b	#$08,$00000009(a1)
		rts
; ---------------------------------------------------------------------------

loc_1AEBE2:					  ; CODE XREF: ROM:001AEBB8j
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$20,$0000004D(a5)
		beq.w	loc_1AEBF4

locret_1AEBF2:					  ; CODE XREF: ROM:001AEB9Cj
						  ; ROM:001AEBAAj ...
		rts
; ---------------------------------------------------------------------------

loc_1AEBF4:					  ; CODE XREF: ROM:001AEBD0j
						  ; ROM:001AEBEEj
		clr.b	$0000004D(a5)
		bra.w	sub_1AE8CA
; ---------------------------------------------------------------------------

loc_1AEBFC:					  ; CODE XREF: ROM:001AEAF6j
						  ; ROM:001AEAFEj ...
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000000D(a5)
		cmpi.b	#$08,$0000000D(a5)
		bcs.s	loc_1AEC52
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$10,$0000000D(a5)
		bcs.s	loc_1AEC52
		bhi.s	loc_1AEC22
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordSwing
; ---------------------------------------------------------------------------

loc_1AEC22:					  ; CODE XREF: ROM:001AEC1Cj
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0300,$0000002C(a5)
		cmpi.b	#$18,$0000000D(a5)
		bcs.s	loc_1AEC52
		move.w	#$0400,$0000002C(a5)
		cmpi.b	#$20,$0000000D(a5)
		bcs.s	loc_1AEC52
		beq.w	sub_1AE8CA

loc_1AEC52:					  ; CODE XREF: ROM:001AEC0Cj
						  ; ROM:001AEC1Aj ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

EnemyAI_StoneWarrior_B:				  ; CODE XREF: ROM:001A86AAj
						  ; ROM:001A86D2j
		bra.s	loc_1AECA0
; ---------------------------------------------------------------------------

EnemyAI_StoneWarrior_A:				  ; CODE XREF: ROM:001A86A6j
						  ; ROM:001A86CEj
		btst	#$01,$0000000C(a5)
		bne.s	loc_1AEC72
		move.b	$00000037(a5),d0
		beq.s	loc_1AEC78
		cmpi.b	#$10,d0
		beq.s	loc_1AECB0
		bra.w	loc_1AED88
; ---------------------------------------------------------------------------

loc_1AEC72:					  ; CODE XREF: ROM:001AEC60j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AEC78:					  ; CODE XREF: ROM:001AEC66j
		bsr.w	LoadSpecialAI
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	sub_1AECAC
		rts
; ---------------------------------------------------------------------------

loc_1AECA0:					  ; CODE XREF: ROM:EnemyAI_StoneWarrior_Bj
		bsr.s	sub_1AECAC
		eori.b	#$80,$00000004(a5)
		bra.w	loc_1AED50

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_1AECAC:					  ; CODE XREF: ROM:001AEC9Cj
						  ; ROM:loc_1AECA0p ...
		bra.w	loc_1A8AB6
; End of function sub_1AECAC

; ---------------------------------------------------------------------------

loc_1AECB0:					  ; CODE XREF: ROM:001AEC6Cj
		tst.b	(byte_FF1142).l
		bne.s	loc_1AECD8
		move.w	$00000014(a5),(word_FF1800).l
		move.w	$00000016(a5),(dword_FF1804).l
		bsr.w	sub_1AECDC
		bcs.s	loc_1AECD2
		bsr.w	sub_1AED2E

loc_1AECD2:					  ; CODE XREF: ROM:001AECCCj
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AECD8:					  ; CODE XREF: ROM:001AECB6j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AECDC:					  ; CODE XREF: ROM:001AECC8p
		move.w	#$0080,d5
		move.w	#$0080,d6
		move.w	#$0080,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AED2A
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AED2A
		move.w	#$03E8,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0006,d7
		bhi.s	loc_1AED2A
		move.b	#$24,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AED2A:					  ; CODE XREF: sub_1AECDC+10j
						  ; sub_1AECDC+22j ...
		tst.b	d0
		rts
; End of function sub_1AECDC


; =============== S U B	R O U T	I N E =======================================


sub_1AED2E:					  ; CODE XREF: ROM:001AECCEp
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AED84
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bcc.s	loc_1AED6A

loc_1AED50:					  ; CODE XREF: ROM:001AECA8j
		move.b	#$23,$00000037(a5)
		move.w	#$000E,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AED6A:					  ; CODE XREF: sub_1AED2E+20j
		move.b	#$24,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AED84:					  ; CODE XREF: sub_1AED2E+10j
		tst.b	d0
		rts
; End of function sub_1AED2E

; ---------------------------------------------------------------------------

loc_1AED88:					  ; CODE XREF: ROM:001AEC6Ej
		andi.b	#$0F,d0
		beq.s	loc_1AEDA2
		cmpi.b	#$01,d0
		beq.s	loc_1AEDAE
		cmpi.b	#$02,d0
		beq.s	loc_1AEDAE
		cmpi.b	#$03,d0
		beq.s	loc_1AEDB4
		bra.s	loc_1AEDF0
; ---------------------------------------------------------------------------

loc_1AEDA2:					  ; CODE XREF: ROM:001AED8Cj
		move.b	$0000002D(a5),d0
		andi.b	#$30,d0
		beq.w	sub_1AECAC

loc_1AEDAE:					  ; CODE XREF: ROM:001AED92j
						  ; ROM:001AED98j
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AEDB4:					  ; CODE XREF: ROM:001AED9Ej
		bclr	#$00,$00000038(a5)
		move.b	$0000002D(a5),d0
		andi.b	#$30,d0
		beq.w	loc_1AEDD2
		bset	#$00,$00000038(a5)
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AEDD2:					  ; CODE XREF: ROM:001AEDC2j
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$01,$0000004D(a5)
		bne.s	loc_1AEDEA
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_DoorLock
; ---------------------------------------------------------------------------
		move.w	#$0400,$0000002C(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AEDEA:					  ; CODE XREF: ROM:001AEDDCj
		bsr.s	sub_1AEE66
		bra.w	sub_1AECAC
; ---------------------------------------------------------------------------

loc_1AEDF0:					  ; CODE XREF: ROM:001AEDA0j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$0F,$0000004D(a5)
		bcs.w	locret_1AEED6
		move.w	#$0200,$0000002C(a5)
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$1E,$0000004D(a5)
		bcs.w	locret_1AEED6
		bne.s	loc_1AEE1E
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_DoorLock
; ---------------------------------------------------------------------------

loc_1AEE1E:					  ; CODE XREF: ROM:001AEE18j
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0300,$0000002C(a5)
		cmpi.b	#$20,$0000004D(a5)
		bne.w	loc_1AEEC4
		bsr.w	sub_1AEE66
		move.b	(Player_Z+1).l,d0
		cmp.b	(Player_FloorHeight).l,d0
		bne.s	loc_1AEE62
		tst.b	(byte_FF1142).l
		bne.s	loc_1AEE62
		move.b	#$08,d0
		jsr	(j_PlaybackInput).l

loc_1AEE62:					  ; CODE XREF: ROM:001AEE4Ej
						  ; ROM:001AEE56j
		tst.b	d0
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1AEE66:					  ; CODE XREF: ROM:loc_1AEDEAp
						  ; ROM:001AEE3Ep ...
		moveq	#$00000007,d7
		move.w	#$0009,d0

loc_1AEE6C:					  ; CODE XREF: sub_1AEE66+58j
		movem.w	d7,-(sp)
		move.w	#$0007,d6

loc_1AEE74:					  ; CODE XREF: sub_1AEE66+4Ej
		movem.w	d0/d6,-(sp)
		movem.w	d0,-(sp)
		add.w	d0,(g_VSRAMData).l
		add.w	d0,(g_VSRAMData+2).l
		jsr	(j_QueueVSRAMUpdate).l
		jsr	(j_FlushDMACopyQueue).l
		movem.w	(sp)+,d0
		sub.w	d0,(g_VSRAMData).l
		sub.w	d0,(g_VSRAMData+2).l
		jsr	(j_QueueVSRAMUpdate).l
		jsr	(j_FlushDMACopyQueue).l
		movem.w	(sp)+,d0/d6
		dbf	d6,loc_1AEE74
		subq.w	#$01,d0
		movem.w	(sp)+,d7
		dbf	d7,loc_1AEE6C
		rts
; End of function sub_1AEE66

; ---------------------------------------------------------------------------

loc_1AEEC4:					  ; CODE XREF: ROM:001AEE3Aj
		cmpi.b	#$2D,$0000004D(a5)
		bcs.s	locret_1AEED6
		bra.w	sub_1AECAC
; ---------------------------------------------------------------------------
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

locret_1AEED6:					  ; CODE XREF: ROM:001AEE00j
						  ; ROM:001AEE14j ...
		rts
; ---------------------------------------------------------------------------

EnemyAI_Gola_B:					  ; CODE XREF: ROM:001A869Aj
		bra.s	loc_1AEEFE
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1A4414

EnemyAI_Gola_A:					  ; CODE XREF: ROM:001A8696j
						  ; DATA XREF: sub_1A4414+8t
		move.b	#$02,Speed(a5)
		btst	#$01,Flags2(a5)
		bne.s	loc_1AEEF8
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AEF4C
		cmpi.b	#$10,d0
		beq.s	loc_1AEF4C
		bra.w	loc_1AF1FC
; ---------------------------------------------------------------------------

loc_1AEEF8:					  ; CODE XREF: sub_1A4414+AAD2j
		bsr.w	LoadSpecialAI
		rts
; END OF FUNCTION CHUNK	FOR sub_1A4414
; ---------------------------------------------------------------------------

loc_1AEEFE:					  ; CODE XREF: ROM:EnemyAI_Gola_Bj
		bsr.s	sub_1AEF04
		bra.w	loc_1AF1BA

; =============== S U B	R O U T	I N E =======================================


sub_1AEF04:					  ; CODE XREF: ROM:loc_1AEEFEp
						  ; sub_1A4414+ACCAj ...
		bclr	#$06,$00000038(a5)
		bclr	#$00,$00000038(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,$00000037(a5)
		bclr	#$01,$0000000C(a5)
		move.l	#$C0000000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_DATA_REG).l
		move.l	#$C01E0000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_DATA_REG).l
		rts
; End of function sub_1AEF04

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1A4414

loc_1AEF4C:					  ; CODE XREF: sub_1A4414+AAD8j
						  ; sub_1A4414+AADEj
		bsr.w	sub_1AEF72
		bcs.s	loc_1AEF6C
		bsr.w	sub_1AF01A
		bcs.s	loc_1AEF6C
		bsr.s	sub_1AEFAC
		bcs.s	loc_1AEF6C
		bsr.w	sub_1AF052
		bcs.s	loc_1AEF6C
		bsr.w	sub_1AF084
		bcs.s	locret_1AEF70
		bsr.w	sub_1AF18A

loc_1AEF6C:					  ; CODE XREF: sub_1A4414+AB3Cj
						  ; sub_1A4414+AB42j ...
		bsr.w	LoadSpecialAI

locret_1AEF70:					  ; CODE XREF: sub_1A4414+AB52j
		rts
; END OF FUNCTION CHUNK	FOR sub_1A4414

; =============== S U B	R O U T	I N E =======================================


sub_1AEF72:					  ; CODE XREF: sub_1A4414:loc_1AEF4Cp
		cmpi.w	#$0064,$00000012(a5)
		bcc.w	loc_1AF0BA
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bcc.w	loc_1AF0BA
		move.b	#$27,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Slash1
; ---------------------------------------------------------------------------
		ori	#$01,ccr
		rts
; End of function sub_1AEF72


; =============== S U B	R O U T	I N E =======================================


sub_1AEFAC:					  ; CODE XREF: sub_1A4414+AB44p

; FUNCTION CHUNK AT 001AF0BE SIZE 0000001A BYTES

		cmpi.w	#$00F0,$00000012(a5)
		bcs.s	loc_1AF016
		move.w	#$0002,d6
		jsr	(j_GenerateRandomNumber).l
		tst.b	d7
		beq.s	loc_1AEFE2
		move.b	(Player_X).l,(a5)
		move.b	#$16,$00000001(a5)
		andi.b	#$3F,$00000004(a5)
		ori.b	#$80,$00000004(a5)
		bclr	#$03,$00000006(a5)
		bra.s	loc_1AF000
; ---------------------------------------------------------------------------

loc_1AEFE2:					  ; CODE XREF: sub_1AEFAC+14j
		move.b	#$19,(a5)
		move.b	(Player_Y).l,$00000001(a5)
		andi.b	#$3F,$00000004(a5)
		ori.b	#$40,$00000004(a5)
		bset	#$03,$00000006(a5)

loc_1AF000:					  ; CODE XREF: sub_1AEFAC+34j
		bset	#$07,$00000048(a5)
		clr.w	$00000002(a5)
		movea.l	a5,a1
		jsr	(sub_1A8AE6).l
		bra.w	loc_1AF0BE
; ---------------------------------------------------------------------------

loc_1AF016:					  ; CODE XREF: sub_1AEFAC+6j
		tst.b	d0
		rts
; End of function sub_1AEFAC


; =============== S U B	R O U T	I N E =======================================


sub_1AF01A:					  ; CODE XREF: sub_1A4414+AB3Ep
		cmpi.w	#$0094,$00000012(a5)
		bcs.s	loc_1AF04E
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$001E,d7
		bhi.w	loc_1AF04E
		move.b	#$21,$00000037(a5)
		move.w	#$0000,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AF04E:					  ; CODE XREF: sub_1AF01A+6j
						  ; sub_1AF01A+16j
		tst.b	d0
		rts
; End of function sub_1AF01A


; =============== S U B	R O U T	I N E =======================================


sub_1AF052:					  ; CODE XREF: sub_1A4414+AB48p
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000A,d7
		bhi.s	loc_1AF080
		move.w	#$0383,$00000034(a5)

loc_1AF068:					  ; CODE XREF: sub_1A4414+AF5Aj
		move.b	#$22,$00000037(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Fireball1
; ---------------------------------------------------------------------------
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AF080:					  ; CODE XREF: sub_1AF052+Ej
		tst.b	d0
		rts
; End of function sub_1AF052


; =============== S U B	R O U T	I N E =======================================


sub_1AF084:					  ; CODE XREF: sub_1A4414+AB4Ep
		cmpi.w	#$0064,$00000012(a5)
		bcc.s	loc_1AF0BA
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0055,d7
		bcc.s	loc_1AF0BA
		move.b	#$23,$00000037(a5)
		move.w	#$0363,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Slash1
; ---------------------------------------------------------------------------
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AF0BA:					  ; CODE XREF: sub_1AEF72+6j
						  ; sub_1AEF72+18j ...
		tst.b	d0
		rts
; End of function sub_1AF084

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1AEFAC

loc_1AF0BE:					  ; CODE XREF: sub_1AEFAC+66j
		move.b	#$24,$00000037(a5)
		move.w	#$0361,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; END OF FUNCTION CHUNK	FOR sub_1AEFAC
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1A4414

loc_1AF0D8:					  ; CODE XREF: sub_1A4414+AE84j
		tst.w	(g_ControllerPlayback).l
		beq.w	sub_1AEF04
		move.l	(a5),d0
		movem.l	d0,-(sp)
		move.w	(Player_CentreX).l,d0
		move.w	(Player_CentreY).l,d1
		move.w	#$0002,d6
		jsr	(j_GenerateRandomNumber).l
		tst.b	d7
		beq.s	loc_1AF10C
		subi.w	#$0038,d0
		move.b	#$40,d2
		bra.s	loc_1AF114
; ---------------------------------------------------------------------------

loc_1AF10C:					  ; CODE XREF: sub_1A4414+ACECj
		subi.w	#$0038,d1
		move.b	#$80,d2

loc_1AF114:					  ; CODE XREF: sub_1A4414+ACF6j
		move.w	d0,d3
		andi.b	#$F0,d0
		lsr.w	#$04,d0
		move.b	d0,(a5)
		andi.b	#$0F,d3
		move.b	d3,$00000002(a5)
		move.w	d1,d3
		andi.b	#$F0,d1
		lsr.w	#$04,d1
		move.b	d1,$00000001(a5)
		andi.b	#$0F,d3
		move.b	d3,$00000003(a5)
		andi.b	#$3F,$00000004(a5)
		or.b	d2,$00000004(a5)
		bset	#$07,$00000048(a5)
		bset	#$07,$0000000A(a5)
		movea.l	a5,a1
		jsr	(sub_1A8AE6).l
		movem.l	(sp)+,d0
		bcs.s	loc_1AF184
		move.b	#$26,$00000037(a5)
		move.w	#$0361,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		subi.w	#$0020,$00000012(a5)
		subi.w	#$0020,$00000054(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AF184:					  ; CODE XREF: sub_1A4414+AD48j
		move.l	d0,(a5)
		tst.b	d0
		rts
; END OF FUNCTION CHUNK	FOR sub_1A4414

; =============== S U B	R O U T	I N E =======================================


sub_1AF18A:					  ; CODE XREF: sub_1A4414+AB54p
		cmpi.w	#$0064,$00000012(a5)
		bcc.s	loc_1AF1E6
		move.w	#$0019,d6
		jsr	(j_GenerateRandomNumber).l
		move.b	(Player_X).l,d6
		subi.b	#$18,d6
		add.b	(Player_Y).l,d6
		subi.b	#$15,d6
		move.b	#$18,d5
		sub.b	d6,d5
		cmp.b	d5,d7
		bcc.s	loc_1AF1E6

loc_1AF1BA:					  ; CODE XREF: ROM:001AEF00j
		move.l	#$C0000000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_DATA_REG).l
		move.b	#$25,$00000037(a5)
		move.w	#$0362,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000004D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AF1E6:					  ; CODE XREF: sub_1AF18A+6j
						  ; sub_1AF18A+2Ej
		tst.b	d0
		rts
; End of function sub_1AF18A

; ---------------------------------------------------------------------------
		bsr.w	sub_1AC010
		move.b	d2,d1
		andi.b	#$3F,$00000004(a5)
		or.b	d2,$00000004(a5)
		rts
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1A4414

loc_1AF1FC:					  ; CODE XREF: sub_1A4414+AAE0j
		andi.b	#$0F,d0
		beq.s	locret_1AF234
		cmpi.b	#$01,d0
		beq.s	loc_1AF236
		cmpi.b	#$02,d0
		beq.w	loc_1AF29E
		cmpi.b	#$03,d0
		beq.w	loc_1AF372
		cmpi.b	#$04,d0
		beq.w	loc_1AF34E
		cmpi.b	#$05,d0
		beq.w	loc_1AF34E
		cmpi.b	#$06,d0
		beq.w	loc_1AF35C
		bra.w	loc_1AF4FE
; ---------------------------------------------------------------------------

locret_1AF234:					  ; CODE XREF: sub_1A4414+ADECj
		rts
; ---------------------------------------------------------------------------

loc_1AF236:					  ; CODE XREF: sub_1A4414+ADF2j
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$01,$0000004D(a5)
		beq.w	loc_1AF27A
		cmpi.b	#$10,$0000004D(a5)
		bne.w	loc_1AF292
		move.b	(Player_Z+1).l,d0
		cmp.b	(Player_FloorHeight).l,d0
		bne.s	loc_1AF26E
		tst.b	(byte_FF1142).l
		bne.s	loc_1AF26E
		move.b	#$08,d0
		jsr	(j_PlaybackInput).l

loc_1AF26E:					  ; CODE XREF: sub_1A4414+AE46j
						  ; sub_1A4414+AE4Ej
		move.b	#$10,d0
		bsr.s	sub_1AF27E
		bsr.w	sub_1AEE66
		rts
; ---------------------------------------------------------------------------

loc_1AF27A:					  ; CODE XREF: sub_1A4414+AE2Cj
		move.b	#$08,d0
; END OF FUNCTION CHUNK	FOR sub_1A4414

; =============== S U B	R O U T	I N E =======================================


sub_1AF27E:					  ; CODE XREF: sub_1A4414+AE5Ep
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Thud
; ---------------------------------------------------------------------------
		movem.l	a5,-(sp)
		jsr	(sub_40A).l
		movem.l	(sp)+,a5
		rts
; End of function sub_1AF27E

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1A4414

loc_1AF292:					  ; CODE XREF: sub_1A4414+AE36j
		cmpi.b	#$11,$0000004D(a5)
		beq.w	loc_1AF0D8
		rts
; ---------------------------------------------------------------------------

loc_1AF29E:					  ; CODE XREF: sub_1A4414+ADF8j
		move.w	#$0200,$0000002C(a5)
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$01,$0000004D(a5)
		bne.s	loc_1AF2F4
		lea	($00009880).l,a2
		move.b	#$01,d0
		jsr	(j_LoadMagicSwordEffect).l
		move.b	#$01,d0
		bsr.w	LoadProjectilePalette
		bsr.w	LoadPal3Low
		move.l	#$C0000000,(VDP_CTRL_REG).l
		move.w	#$000E,(VDP_DATA_REG).l
		move.l	#$C01E0000,(VDP_CTRL_REG).l
		move.w	#$000E,(VDP_DATA_REG).l
		bra.w	loc_1AF348
; ---------------------------------------------------------------------------

loc_1AF2F4:					  ; CODE XREF: sub_1A4414+AE9Aj
		cmpi.b	#$02,$0000004D(a5)
		bne.w	loc_1AF332
		move.b	#$01,d0
		bsr.w	LoadProjectilePalette
		bsr.w	LoadPal3Low
		move.l	#$C0000000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_DATA_REG).l
		move.l	#$C01E0000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_DATA_REG).l
		bra.w	loc_1AF348
; ---------------------------------------------------------------------------

loc_1AF332:					  ; CODE XREF: sub_1A4414+AEE6j
		cmpi.b	#$03,$0000004D(a5)
		bne.w	loc_1AF348
		move.w	#$0368,d6
		bsr.w	sub_1AF448
		clr.b	$0000004D(a5)

loc_1AF348:					  ; CODE XREF: sub_1A4414+AEDCj
						  ; sub_1A4414+AF1Aj ...
		bsr.w	LoadSpecialAI
		rts
; ---------------------------------------------------------------------------

loc_1AF34E:					  ; CODE XREF: sub_1A4414+AE08j
						  ; sub_1A4414+AE10j
		bsr.w	LoadSpecialAI
		tst.b	$0000002B(a5)
		beq.w	sub_1AEF04
		rts
; ---------------------------------------------------------------------------

loc_1AF35C:					  ; CODE XREF: sub_1A4414+AE18j
		bsr.w	LoadSpecialAI
		tst.b	$0000002B(a5)
		beq.s	loc_1AF368
		rts
; ---------------------------------------------------------------------------

loc_1AF368:					  ; CODE XREF: sub_1A4414+AF50j
		move.w	#$0384,$00000034(a5)
		bra.w	loc_1AF068
; ---------------------------------------------------------------------------

loc_1AF372:					  ; CODE XREF: sub_1A4414+AE00j
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$01,$0000004D(a5)
		bne.s	loc_1AF398
		lea	($00009880).l,a2
		move.b	#$01,d0
		jsr	(j_LoadMagicSwordEffect).l
		bra.w	loc_1AF3E4
; ---------------------------------------------------------------------------

loc_1AF398:					  ; CODE XREF: sub_1A4414+AF6Ej
		cmpi.b	#$02,$0000004D(a5)
		bne.w	loc_1AF3B2
		move.b	#$01,d0
		bsr.w	LoadProjectilePalette
		bsr.w	LoadPal3Low
		bra.w	loc_1AF3E4
; ---------------------------------------------------------------------------

loc_1AF3B2:					  ; CODE XREF: sub_1A4414+AF8Aj
		cmpi.b	#$0A,$0000004D(a5)
		bhi.w	loc_1AF3D4
		bcs.w	loc_1AF3E4
		move.w	#$0200,$0000002C(a5)
		move.w	#$0345,d6
		bsr.w	sub_1AF448
		bcs.w	loc_1AF43A
		bra.s	loc_1AF3E4
; ---------------------------------------------------------------------------

loc_1AF3D4:					  ; CODE XREF: sub_1A4414+AFA4j
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$14,$0000004D(a5)
		beq.w	loc_1AF43A

loc_1AF3E4:					  ; CODE XREF: sub_1A4414+AF80j
						  ; sub_1A4414+AF9Aj ...
		move.b	$00000004(a5),d0
		movem.w	d0,-(sp)
		andi.b	#$C0,d0
		cmpi.b	#$80,d0
		beq.s	loc_1AF40E
		move.b	#$00,d1
		move.b	$00000001(a5),d0
		cmp.b	(Player_Y).l,d0
		beq.s	loc_1AF430
		bhi.s	loc_1AF422
		move.b	#$80,d1
		bra.s	loc_1AF422
; ---------------------------------------------------------------------------

loc_1AF40E:					  ; CODE XREF: sub_1A4414+AFE0j
		move.b	#$C0,d1
		move.b	(a5),d0
		cmp.b	(Player_X).l,d0
		beq.s	loc_1AF430
		bhi.s	loc_1AF422
		move.b	#$40,d1

loc_1AF422:					  ; CODE XREF: sub_1A4414+AFF2j
						  ; sub_1A4414+AFF8j ...
		andi.b	#$3F,$00000004(a5)
		or.b	d1,$00000004(a5)
		bsr.w	LoadSpecialAI

loc_1AF430:					  ; CODE XREF: sub_1A4414+AFF0j
						  ; sub_1A4414+B006j
		movem.w	(sp)+,d0
		move.b	d0,$00000004(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AF43A:					  ; CODE XREF: sub_1A4414+AFBAj
						  ; sub_1A4414+AFCCj
		bclr	#$00,$0000000C(a5)
		clr.b	$0000004D(a5)
		bra.w	sub_1AEF04
; END OF FUNCTION CHUNK	FOR sub_1A4414

; =============== S U B	R O U T	I N E =======================================


sub_1AF448:					  ; CODE XREF: sub_1A4414+AF2Cp
						  ; sub_1A4414+AFB6p ...
		move.b	$00000004(a5),d2
		movem.w	d6,-(sp)
		movem.w	d2,-(sp)
		jsr	(sub_103B2).l
		movem.w	(sp)+,d1
		movem.w	(sp)+,d6
		bcs.w	loc_1AF4F8
		move.w	$00000014(a5),d2
		move.w	$00000016(a5),d3
		andi.b	#$C0,d1
		beq.s	loc_1AF482
		cmpi.b	#$80,d1
		bcs.s	loc_1AF488
		beq.s	loc_1AF48E
		subi.w	#$001A,d2
		bra.s	loc_1AF492
; ---------------------------------------------------------------------------

loc_1AF482:					  ; CODE XREF: sub_1AF448+2Aj
		subi.w	#$001A,d3
		bra.s	loc_1AF492
; ---------------------------------------------------------------------------

loc_1AF488:					  ; CODE XREF: sub_1AF448+30j
		addi.w	#$001A,d2
		bra.s	loc_1AF492
; ---------------------------------------------------------------------------

loc_1AF48E:					  ; CODE XREF: sub_1AF448+32j
		addi.w	#$001A,d3

loc_1AF492:					  ; CODE XREF: sub_1AF448+38j
						  ; sub_1AF448+3Ej ...
		move.w	d2,d0
		andi.b	#$0F,d0
		move.b	d0,$00000002(a1)
		lsr.w	#$04,d2
		move.b	d2,(a1)
		move.w	d3,d0
		andi.b	#$0F,d0
		move.b	d0,$00000003(a1)
		lsr.w	#$04,d3
		move.b	d3,$00000001(a1)
		move.b	d1,$00000004(a1)
		move.b	#$AC,d2
		move.w	#$1400,$0000003C(a1)
		move.w	$00000012(a5),d3
		move.w	d3,$00000012(a1)
		move.w	#$64B4,$00000006(a1)
		move.w	d6,$00000034(a1)
		move.b	#$04,$00000009(a1)
		move.b	#$80,$00000020(a1)
		jsr	(sub_103B8).l
		bset	#$00,$00000038(a1)
		bset	#$07,$0000000C(a1)
		bset	#$07,$0000004C(a1)
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1AF4F8:					  ; CODE XREF: sub_1AF448+1Aj
		ori	#$01,ccr
		rts
; End of function sub_1AF448

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1A4414

loc_1AF4FE:					  ; CODE XREF: sub_1A4414+AE1Cj
		move.w	#$0100,$0000002C(a5)
		addq.b	#$01,$0000004D(a5)
		cmpi.b	#$01,$0000004D(a5)
		bne.s	loc_1AF520
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1AF520:					  ; CODE XREF: sub_1A4414+B0FAj
		cmpi.b	#$02,$0000004D(a5)
		bne.w	loc_1AF536
		move.b	#$01,d0
		bsr.w	LoadProjectilePalette
		bra.w	LoadPal3Low
; ---------------------------------------------------------------------------

loc_1AF536:					  ; CODE XREF: sub_1A4414+B112j
		cmpi.b	#$10,$0000004D(a5)
		bhi.w	loc_1AF56C
		bcs.w	locret_1AF57C
		move.w	#$0200,$0000002C(a5)
		move.w	#$0345,d6
		bsr.w	sub_1AF448
		bcs.w	loc_1AF57E
		move.w	#$0346,d6
		bsr.w	sub_1AF448
		bcs.w	loc_1AF57E
		move.w	#$0347,d6
		bsr.w	sub_1AF448
		rts
; ---------------------------------------------------------------------------

loc_1AF56C:					  ; CODE XREF: sub_1A4414+B128j
		move.w	#$0200,$0000002C(a5)
		cmpi.b	#$20,$0000004D(a5)
		beq.w	loc_1AF57E

locret_1AF57C:					  ; CODE XREF: sub_1A4414+B12Cj
		rts
; ---------------------------------------------------------------------------

loc_1AF57E:					  ; CODE XREF: sub_1A4414+B13Ej
						  ; sub_1A4414+B14Aj ...
		clr.b	$0000004D(a5)
		bra.w	sub_1AEF04
; END OF FUNCTION CHUNK	FOR sub_1A4414

; =============== S U B	R O U T	I N E =======================================


LoadPal3Low:					  ; CODE XREF: sub_1A4414+AEB4p
						  ; sub_1A4414+AEF2p ...
		move.l	#$C0640000,(VDP_CTRL_REG).l ; CRAM 0x64	(Palette 3, Entry 4)
		move.w	(ProjectilePalette2,pc),d1
		nop
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal3Base+4).l
		move.w	d1,(g_Pal3Active+4).l
		move.w	((ProjectilePalette2+2),pc),d1
		nop
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal3Base+6).l
		move.w	d1,(g_Pal3Active+6).l
		move.w	((ProjectilePalette2+4),pc),d1
		nop
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal3Base+8).l
		move.w	d1,(g_Pal3Active+8).l
		move.w	((ProjectilePalette2+6),pc),d1
		nop
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal3Base+$A).l
		move.w	d1,(g_Pal3Active+$A).l
		rts
; End of function LoadPal3Low

; ---------------------------------------------------------------------------
