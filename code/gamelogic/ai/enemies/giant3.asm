; ---------------------------------------------------------------------------

EnemyAI_Giant3_B:				  ; CODE XREF: ROM:001A85C2j
		bra.s	EnemyAI_Giant3
; ---------------------------------------------------------------------------

EnemyAI_Giant3_A:				  ; CODE XREF: ROM:001A85BEj
		btst	#$01,Flags2(a5)
		bne.s	loc_1AB71E
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AB724
		cmpi.b	#$10,d0
		beq.s	loc_1AB750
		bra.w	loc_1AB892
; ---------------------------------------------------------------------------

loc_1AB71E:					  ; CODE XREF: ROM:001AB70Cj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AB724:					  ; CODE XREF: ROM:001AB712j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Giant3
		rts
; ---------------------------------------------------------------------------

EnemyAI_Giant3:					  ; CODE XREF: ROM:EnemyAI_Giant3_Bj
						  ; ROM:001AB748j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AB750:					  ; CODE XREF: ROM:001AB718j
		tst.b	(byte_FF1142).l
		bne.s	loc_1AB780
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1AB784
		bcs.s	loc_1AB77A
		bsr.s	sub_1AB7C0
		bcs.s	loc_1AB77A
		bsr.w	sub_1AB7FC
		bcs.s	loc_1AB77A
		bsr.w	sub_1AB838

loc_1AB77A:					  ; CODE XREF: ROM:001AB76Aj
						  ; ROM:001AB76Ej ...
		bsr.w	j_j_OnTick
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
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0008,d7
		bhi.s	loc_1AB7BC
		move.b	#$20,ChestIndex(a5)
		move.w	#$001F,BehaviourLUTIndex(a5)
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
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	loc_1AB7F8
		move.b	#$21,ChestIndex(a5)
		move.w	#$000E,BehaviourLUTIndex(a5)
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
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00005,d7
		bhi.s	loc_1AB834
		move.b	#$22,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
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
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	loc_1AB874
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB874:					  ; CODE XREF: sub_1AB838+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
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
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AB8B6:					  ; CODE XREF: ROM:001AB89Cj
		move.b	Action1(a5),d1
		move.b	d1,d2
		move.w	#$0100,QueuedAction(a5)
		andi.b	#$20,d1
		bne.s	loc_1AB8F0
		movem.w	d2,-(sp)
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		movem.w	(sp)+,d2
		move.w	#$0200,QueuedAction(a5)
		andi.b	#$10,d2
		bne.s	loc_1AB8F0
		bra.w	EnemyAI_Giant3
; ---------------------------------------------------------------------------

loc_1AB8F0:					  ; CODE XREF: ROM:001AB8C6j
						  ; ROM:001AB8EAj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AB8F6:					  ; CODE XREF: ROM:001AB8A2j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1AB92A
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	loc_1AB92A
		bra.w	EnemyAI_Giant3
; ---------------------------------------------------------------------------

loc_1AB92A:					  ; CODE XREF: ROM:001AB906j
						  ; ROM:001AB924j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AB930:					  ; CODE XREF: ROM:001AB8A8j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1AB964
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$2D,Unk0D(a5)
		bcs.s	locret_1AB964
		bra.w	EnemyAI_Giant3
; ---------------------------------------------------------------------------

locret_1AB964:					  ; CODE XREF: ROM:001AB940j
						  ; ROM:001AB95Ej
		rts
; ---------------------------------------------------------------------------

loc_1AB966:					  ; CODE XREF: ROM:001AB8ACj
		addq.b	#$01,Unk0D(a5)
		move.b	Unk0D(a5),d0
		andi.w	#$0008,d0
		lsl.w	#$05,d0
		addi.w	#$0100,d0
		move.w	d0,QueuedAction(a5)
		cmpi.w	#$0100,d0
		beq.s	loc_1AB992
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C

loc_1AB992:					  ; CODE XREF: ROM:001AB980j
		cmpi.b	#$60,Unk0D(a5)
		bcc.w	EnemyAI_Giant3
		rts
