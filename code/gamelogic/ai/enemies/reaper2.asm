; ---------------------------------------------------------------------------

EnemyAI_Reaper2_B:				  ; CODE XREF: ROM:001A8642j
		bra.s	EnemyAI_Reaper2
; ---------------------------------------------------------------------------

EnemyAI_Reaper2_A:				  ; CODE XREF: ROM:001A863Ej
		btst	#$01,Flags2(a5)
		bne.s	loc_1AC524
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AC52A
		cmpi.b	#$10,d0
		beq.s	loc_1AC556
		bra.w	loc_1AC642
; ---------------------------------------------------------------------------

loc_1AC524:					  ; CODE XREF: ROM:001AC512j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AC52A:					  ; CODE XREF: ROM:001AC518j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0100,d5
		move.w	#$0100,d6
		move.w	#$0100,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Reaper2
		rts
; ---------------------------------------------------------------------------

EnemyAI_Reaper2:				  ; CODE XREF: ROM:EnemyAI_Reaper2_Bj
						  ; ROM:001AC54Ej ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AC556:					  ; CODE XREF: ROM:001AC51Ej
		tst.b	(byte_FF1142).l
		bne.s	loc_1AC5B6
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$2D,Unk4D(a5)
		bcs.s	loc_1AC5A2
		clr.b	Unk4D(a5)
		bsr.s	sub_1AC5BA
		bcs.s	loc_1AC59C
		ori.b	#$40,Flags2(a5)
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)
		bsr.s	sub_1AC5EA
		bcs.s	loc_1AC59C
		bsr.w	sub_1AC614

loc_1AC59C:					  ; CODE XREF: ROM:001AC580j
						  ; ROM:001AC596j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AC5A2:					  ; CODE XREF: ROM:001AC578j
		ori.b	#$40,Flags2(a5)
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)
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
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AC5E6:					  ; CODE XREF: sub_1AC5BA+10j
		tst.b	d0
		rts
; End of function sub_1AC5BA


; =============== S U B	R O U T	I N E =======================================


sub_1AC5EA:					  ; CODE XREF: ROM:001AC594p
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00300,d7
		bhi.s	loc_1AC610
		move.b	#$21,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
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
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00300,d7
		bhi.s	loc_1AC63E
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AC63E:					  ; CODE XREF: sub_1AC614+Ej
		tst.b	d0
		rts
; End of function sub_1AC614

; ---------------------------------------------------------------------------

loc_1AC642:					  ; CODE XREF: ROM:001AC520j
		clr.b	Unk0D(a5)
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
		move.l	X(a5),d0
		movem.l	d0,-(sp)
		move.b	(Player_RotationAndSize).l,d0
		eori.b	#$80,d0
		clr.b	d1
		bra.s	loc_1AC68C
; ---------------------------------------------------------------------------

loc_1AC67C:					  ; CODE XREF: ROM:001AC658j
						  ; ROM:001AC660j ...
		move.l	X(a5),d0
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
		bcc.s	loc_1AC722
		movem.w	(sp)+,d1
		movem.l	(sp)+,d0
		move.l	d0,(a5)
		movea.l	a5,a1
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)
		jsr	(sub_1A8AE6).l
		bra.w	EnemyAI_Reaper2
; ---------------------------------------------------------------------------

loc_1AC722:					  ; CODE XREF: ROM:001AC6FEj
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

loc_1AC752:					  ; CODE XREF: ROM:001AC64Aj
		andi.b	#$BF,Flags2(a5)
		clr.w	d0
		move.b	FloorHeight(a5),d0
		move.w	d0,Z(a5)
		addi.w	#$001F,d0
		move.w	d0,HitBoxZEnd(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$01,Unk4D(a5)
		bne.s	loc_1AC78C
		move.w	#$0100,QueuedAction(a5)
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1AC78C:					  ; CODE XREF: ROM:001AC774j
		cmpi.b	#$02,Unk4D(a5)
		bne.w	loc_1AC79E
		move.b	#$01,d0
		bra.w	LoadProjectilePalette
; ---------------------------------------------------------------------------

loc_1AC79E:					  ; CODE XREF: ROM:001AC792j
		cmpi.b	#$2D,Unk4D(a5)
		bhi.w	loc_1AC7C4
		bcs.w	locret_1AC7D4
		move.w	#$0200,QueuedAction(a5)
		move.b	#$01,d0
		move.w	#$0500,d1
		bsr.w	SpawnSmallProjectile
		bcs.w	loc_1AC7D6
		rts
; ---------------------------------------------------------------------------

loc_1AC7C4:					  ; CODE XREF: ROM:001AC7A4j
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$46,Unk4D(a5)
		beq.w	loc_1AC7D6

locret_1AC7D4:					  ; CODE XREF: ROM:001AC7A8j
		rts
; ---------------------------------------------------------------------------

loc_1AC7D6:					  ; CODE XREF: ROM:001AC7BEj
						  ; ROM:001AC7D0j
		clr.b	Unk4D(a5)
		bra.w	EnemyAI_Reaper2
