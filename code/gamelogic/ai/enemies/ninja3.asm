; ---------------------------------------------------------------------------

EnemyAI_Ninja3_B:				  ; CODE XREF: ROM:001A84EAj
		bra.s	EnemyAI_Ninja3
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
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A64B6:					  ; CODE XREF: ROM:001A64A4j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Ninja3
		rts
; ---------------------------------------------------------------------------

EnemyAI_Ninja3:					  ; CODE XREF: ROM:EnemyAI_Ninja3_Bj
						  ; ROM:001A64DAj ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A64E2:					  ; CODE XREF: ROM:001A64AAj
		tst.b	(byte_FF1142).l
		bne.s	loc_1A6512
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A6516
		bcs.s	loc_1A650C
		bsr.s	sub_1A6556
		bcs.s	loc_1A650C
		bsr.w	sub_1A6592
		bcs.s	loc_1A650C
		bsr.w	sub_1A65D2

loc_1A650C:					  ; CODE XREF: ROM:001A64FCj
						  ; ROM:001A6500j ...
		bsr.w	j_j_OnTick
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
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	loc_1A6552
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
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
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	loc_1A658E
		move.b	#$21,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
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
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	loc_1A65CE
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
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
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00070,d7
		bcc.s	loc_1A660E
		move.b	#$23,ChestIndex(a5)
		move.w	#$0012,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A660E:					  ; CODE XREF: sub_1A65D2+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
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
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0040,d5
		move.w	#$FFC8,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.w	EnemyAI_Ninja3
		addq.b	#$01,Unk0D(a5)
		move.b	Unk0D(a5),d0
		cmpi.b	#$80,d0
		beq.w	EnemyAI_Ninja3
		andi.b	#$0F,d0
		cmpi.b	#$01,d0
		bne.s	locret_1A66A0
		move.b	#$FF,Action1(a5)
		move.b	Unk0D(a5),d0
		andi.w	#$0010,d0
		addi.b	#$10,d0
		lsl.b	#$02,d0
		move.w	d0,PrevAction(a5)

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
		move.b	d1,X(a5)
		andi.b	#$0F,d0
		move.b	d0,SubX(a5)
		move.w	d2,d0
		lsr.w	#$04,d2
		move.b	d2,Y(a5)
		andi.b	#$0F,d0
		move.b	d0,SubY(a5)
		movea.l	a5,a1
		jsr	(sub_1A8AE6).l
		jsr	(sub_3BC).l
		bcc.s	loc_1A673E
		movem.w	(sp)+,d1
		movem.l	(sp)+,d0
		move.l	d0,(a5)
		movea.l	a5,a1
		jsr	(sub_1A8AE6).l
		bra.w	EnemyAI_Ninja3
; ---------------------------------------------------------------------------

loc_1A673E:					  ; CODE XREF: ROM:001A6726j
		movem.w	(sp)+,d1
		bset	#$05,Action1(a5)
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		eor.b	d1,d0
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d0,RotationAndSize(a5)
		movem.l	(sp)+,d0
		move.b	#$23,ChestIndex(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A676A:					  ; CODE XREF: ROM:001A6642j
						  ; ROM:001A6646j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1A679E
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	loc_1A679E
		beq.w	EnemyAI_Ninja3

loc_1A679E:					  ; CODE XREF: ROM:001A677Aj
						  ; ROM:001A6798j
		bsr.w	j_j_OnTick
		rts
