; ---------------------------------------------------------------------------

EnemyAI_Reaper3_B:				  ; CODE XREF: ROM:001A864Aj
		bra.s	EnemyAI_Reaper3
; ---------------------------------------------------------------------------

EnemyAI_Reaper3_A:				  ; CODE XREF: ROM:001A8646j
		btst	#$01,Flags2(a5)
		bne.s	loc_1AC7F8
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AC7FE
		cmpi.b	#$10,d0
		beq.s	loc_1AC82A
		bra.w	loc_1AC916
; ---------------------------------------------------------------------------

loc_1AC7F8:					  ; CODE XREF: ROM:001AC7E6j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AC7FE:					  ; CODE XREF: ROM:001AC7ECj
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0100,d5
		move.w	#$0100,d6
		move.w	#$0100,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Reaper3
		rts
; ---------------------------------------------------------------------------

EnemyAI_Reaper3:				  ; CODE XREF: ROM:EnemyAI_Reaper3_Bj
						  ; ROM:001AC822j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AC82A:					  ; CODE XREF: ROM:001AC7F2j
		tst.b	(byte_FF1142).l
		bne.s	loc_1AC88A
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$1E,Unk4D(a5)
		bcs.s	loc_1AC876
		clr.b	Unk4D(a5)
		bsr.s	sub_1AC88E
		bcs.s	loc_1AC870
		ori.b	#$40,Flags2(a5)
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)
		bsr.s	sub_1AC8BE
		bcs.s	loc_1AC870
		bsr.w	sub_1AC8E8

loc_1AC870:					  ; CODE XREF: ROM:001AC854j
						  ; ROM:001AC86Aj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AC876:					  ; CODE XREF: ROM:001AC84Cj
		ori.b	#$40,Flags2(a5)
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)
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
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AC8BA:					  ; CODE XREF: sub_1AC88E+10j
		tst.b	d0
		rts
; End of function sub_1AC88E


; =============== S U B	R O U T	I N E =======================================


sub_1AC8BE:					  ; CODE XREF: ROM:001AC868p
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00400,d7
		bhi.s	loc_1AC8E4
		move.b	#$21,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
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
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00400,d7
		bhi.s	loc_1AC912
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AC912:					  ; CODE XREF: sub_1AC8E8+Ej
		tst.b	d0
		rts
; End of function sub_1AC8E8

; ---------------------------------------------------------------------------

loc_1AC916:					  ; CODE XREF: ROM:001AC7F4j
		clr.b	Unk0D(a5)
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
		move.b	d1,X(a5)
		andi.b	#$0F,d0
		move.b	d0,SubX(a5)
		move.w	d2,d0
		lsr.w	#$04,d2
		move.b	d2,Y(a5)
		andi.b	#$0F,d0
		move.b	d0,SubY(a5)
		clr.w	d0
		move.b	FloorHeight(a5),d0
		move.w	d0,Z(a5)
		addi.w	#$001F,d0
		move.w	d0,HitBoxZEnd(a5)
		movea.l	a5,a1
		jsr	(sub_1A8AE6).l
		jsr	(sub_3BC).l
		bcc.s	loc_1AC9F6
		movem.w	(sp)+,d1
		movem.l	(sp)+,d0
		move.l	d0,(a5)
		movea.l	a5,a1
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)
		jsr	(sub_1A8AE6).l
		bra.w	EnemyAI_Reaper3
; ---------------------------------------------------------------------------

loc_1AC9F6:					  ; CODE XREF: ROM:001AC9D2j
		movem.w	(sp)+,d1
		bset	#$05,Action1(a5)
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		eor.b	d1,d0
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d0,RotationAndSize(a5)
		movem.l	(sp)+,d0
		move.b	#$20,ChestIndex(a5)
		clr.b	Unk4D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ACA26:					  ; CODE XREF: ROM:001AC91Ej
		andi.b	#$BF,Flags2(a5)
		clr.w	d0
		move.b	FloorHeight(a5),d0
		move.w	d0,Z(a5)
		addi.w	#$001F,d0
		move.w	d0,HitBoxZEnd(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$01,Unk4D(a5)
		bne.s	loc_1ACA60
		move.w	#$0100,QueuedAction(a5)
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1ACA60:					  ; CODE XREF: ROM:001ACA48j
		cmpi.b	#$02,Unk4D(a5)
		bne.w	loc_1ACA72
		move.b	#$01,d0
		bra.w	LoadProjectilePalette
; ---------------------------------------------------------------------------

loc_1ACA72:					  ; CODE XREF: ROM:001ACA66j
		cmpi.b	#$2D,Unk4D(a5)
		bhi.w	loc_1ACA98
		bcs.w	locret_1ACAA8
		move.w	#$0200,QueuedAction(a5)
		move.b	#$01,d0
		move.w	#$0800,d1
		bsr.w	sub_1AC474
		bcs.w	loc_1ACAAA
		rts
; ---------------------------------------------------------------------------

loc_1ACA98:					  ; CODE XREF: ROM:001ACA78j
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$46,Unk4D(a5)
		beq.w	loc_1ACAAA

locret_1ACAA8:					  ; CODE XREF: ROM:001ACA7Cj
		rts
; ---------------------------------------------------------------------------

loc_1ACAAA:					  ; CODE XREF: ROM:001ACA92j
						  ; ROM:001ACAA4j
		clr.b	Unk4D(a5)
		bra.w	EnemyAI_Reaper3
