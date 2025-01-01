; ---------------------------------------------------------------------------

EnemyAI_Lizard2_B:				  ; CODE XREF: ROM:001A84FAj
		bra.s	EnemyAI_Lizard2
; ---------------------------------------------------------------------------

EnemyAI_Lizard2_A:				  ; CODE XREF: ROM:001A84F6j
		btst	#$01,Flags2(a5)
		bne.s	loc_1A6A26
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A6A2C
		cmpi.b	#$10,d0
		beq.s	loc_1A6A58
		bra.w	loc_1A6B9A
; ---------------------------------------------------------------------------

loc_1A6A26:					  ; CODE XREF: ROM:001A6A14j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A6A2C:					  ; CODE XREF: ROM:001A6A1Aj
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Lizard2
		rts
; ---------------------------------------------------------------------------

EnemyAI_Lizard2:				  ; CODE XREF: ROM:EnemyAI_Lizard2_Bj
						  ; ROM:001A6A50j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A6A58:					  ; CODE XREF: ROM:001A6A20j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A6A88
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A6A8C
		bcs.s	loc_1A6A82
		bsr.s	sub_1A6AC8
		bcs.s	loc_1A6A82
		bsr.w	sub_1A6B04
		bcs.s	loc_1A6A82
		bsr.w	sub_1A6B40

loc_1A6A82:					  ; CODE XREF: ROM:001A6A72j
						  ; ROM:001A6A76j ...
		bsr.w	j_j_OnTick
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
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0006,d7
		bhi.s	loc_1A6AC4
		move.b	#$20,ChestIndex(a5)
		move.w	#$0013,BehaviourLUTIndex(a5)
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
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	loc_1A6B00
		move.b	#$21,ChestIndex(a5)
		move.w	#$0014,BehaviourLUTIndex(a5)
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
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	loc_1A6B3C
		move.b	#$22,ChestIndex(a5)
		move.w	#$000E,BehaviourLUTIndex(a5)
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
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	loc_1A6B7C
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6B7C:					  ; CODE XREF: sub_1A6B40+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
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
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A6BBC:					  ; CODE XREF: ROM:001A6BA4j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A6BC2:					  ; CODE XREF: ROM:001A6BAAj
						  ; ROM:001A6BB2j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1A6BF6
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	loc_1A6BF6
		bra.w	EnemyAI_Lizard2
; ---------------------------------------------------------------------------

loc_1A6BF6:					  ; CODE XREF: ROM:001A6BD2j
						  ; ROM:001A6BF0j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A6BFC:					  ; CODE XREF: ROM:001A6BB0j
		move.w	#$0300,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	locret_1A6C30
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1A6C30
		bra.w	EnemyAI_Lizard2
; ---------------------------------------------------------------------------

locret_1A6C30:					  ; CODE XREF: ROM:001A6C0Cj
						  ; ROM:001A6C2Aj
		rts
