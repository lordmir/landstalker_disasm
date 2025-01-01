; ---------------------------------------------------------------------------

EnemyAI_Reaper1_B:				  ; CODE XREF: ROM:001A85F2j
		bra.s	EnemyAI_Reaper1
; ---------------------------------------------------------------------------

EnemyAI_Reaper1_A:				  ; CODE XREF: ROM:001A85EEj
		btst	#$01,Flags2(a5)
		bne.s	loc_1AC13A
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AC140
		cmpi.b	#$10,d0
		beq.s	loc_1AC16C
		bra.w	loc_1AC258
; ---------------------------------------------------------------------------

loc_1AC13A:					  ; CODE XREF: ROM:001AC128j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AC140:					  ; CODE XREF: ROM:001AC12Ej
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0100,d5
		move.w	#$0100,d6
		move.w	#$0100,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Reaper1
		rts
; ---------------------------------------------------------------------------

EnemyAI_Reaper1:				  ; CODE XREF: ROM:EnemyAI_Reaper1_Bj
						  ; ROM:001AC164j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AC16C:					  ; CODE XREF: ROM:001AC134j
		tst.b	(byte_FF1142).l
		bne.s	loc_1AC1CC
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$3C,Unk4D(a5)
		bcs.s	loc_1AC1B8
		clr.b	Unk4D(a5)
		bsr.s	sub_1AC1D0
		bcs.s	loc_1AC1B2
		ori.b	#$40,Flags2(a5)
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)
		bsr.s	sub_1AC200
		bcs.s	loc_1AC1B2
		bsr.w	sub_1AC22A

loc_1AC1B2:					  ; CODE XREF: ROM:001AC196j
						  ; ROM:001AC1ACj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AC1B8:					  ; CODE XREF: ROM:001AC18Ej
		ori.b	#$40,Flags2(a5)
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)
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
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AC1FC:					  ; CODE XREF: sub_1AC1D0+10j
		tst.b	d0
		rts
; End of function sub_1AC1D0


; =============== S U B	R O U T	I N E =======================================


sub_1AC200:					  ; CODE XREF: ROM:001AC1AAp
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00200,d7
		bhi.s	loc_1AC226
		move.b	#$21,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
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
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00200,d7
		bhi.s	loc_1AC254
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AC254:					  ; CODE XREF: sub_1AC22A+Ej
		tst.b	d0
		rts
; End of function sub_1AC22A

; ---------------------------------------------------------------------------

loc_1AC258:					  ; CODE XREF: ROM:001AC136j
		clr.b	Unk0D(a5)
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
		bcc.s	loc_1AC338
		movem.w	(sp)+,d1
		movem.l	(sp)+,d0
		move.l	d0,(a5)
		movea.l	a5,a1
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)
		jsr	(sub_1A8AE6).l
		bra.w	EnemyAI_Reaper1
; ---------------------------------------------------------------------------

loc_1AC338:					  ; CODE XREF: ROM:001AC314j
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

loc_1AC368:					  ; CODE XREF: ROM:001AC260j
		andi.b	#$BF,Flags2(a5)
		clr.w	d0
		move.b	FloorHeight(a5),d0
		move.w	d0,Z(a5)
		addi.w	#$001F,d0
		move.w	d0,HitBoxZEnd(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$01,Unk4D(a5)
		bne.s	loc_1AC3A2
		move.w	#$0100,QueuedAction(a5)
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1AC3A2:					  ; CODE XREF: ROM:001AC38Aj
		cmpi.b	#$02,Unk4D(a5)
		bne.w	loc_1AC3B4
		move.b	#$01,d0
		bra.w	LoadProjectilePalette
; ---------------------------------------------------------------------------

loc_1AC3B4:					  ; CODE XREF: ROM:001AC3A8j
		cmpi.b	#$2D,Unk4D(a5)
		bhi.w	loc_1AC3DA
		bcs.w	locret_1AC3EA
		move.w	#$0200,QueuedAction(a5)
		move.b	#$01,d0
		move.w	#$0300,d1
		bsr.w	sub_1AC474
		bcs.w	loc_1AC3EC
		rts
; ---------------------------------------------------------------------------

loc_1AC3DA:					  ; CODE XREF: ROM:001AC3BAj
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$46,Unk4D(a5)
		beq.w	loc_1AC3EC

locret_1AC3EA:					  ; CODE XREF: ROM:001AC3BEj
		rts
; ---------------------------------------------------------------------------

loc_1AC3EC:					  ; CODE XREF: ROM:001AC3D4j
						  ; ROM:001AC3E6j
		clr.b	Unk4D(a5)
		bra.w	EnemyAI_Reaper1
