; ---------------------------------------------------------------------------

EnemyAI_Giant2_B:				  ; CODE XREF: ROM:001A85BAj
		bra.s	EnemyAI_Giant2
; ---------------------------------------------------------------------------

EnemyAI_Giant2_A:				  ; CODE XREF: ROM:001A85B6j
		btst	#$01,Flags2(a5)
		bne.s	loc_1AB4B4
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AB4BA
		cmpi.b	#$10,d0
		beq.s	loc_1AB4E6
		bra.w	loc_1AB628
; ---------------------------------------------------------------------------

loc_1AB4B4:					  ; CODE XREF: ROM:001AB4A2j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AB4BA:					  ; CODE XREF: ROM:001AB4A8j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Giant2
		rts
; ---------------------------------------------------------------------------

EnemyAI_Giant2:					  ; CODE XREF: ROM:EnemyAI_Giant2_Bj
						  ; ROM:001AB4DEj ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AB4E6:					  ; CODE XREF: ROM:001AB4AEj
		tst.b	(byte_FF1142).l
		bne.s	loc_1AB516
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1AB51A
		bcs.s	loc_1AB510
		bsr.s	sub_1AB556
		bcs.s	loc_1AB510
		bsr.w	sub_1AB592
		bcs.s	loc_1AB510
		bsr.w	sub_1AB5CE

loc_1AB510:					  ; CODE XREF: ROM:001AB500j
						  ; ROM:001AB504j ...
		bsr.w	j_j_OnTick
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
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00008,d7
		bhi.s	loc_1AB552
		move.b	#$20,ChestIndex(a5)
		move.w	#$0014,BehaviourLUTIndex(a5)
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
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$000C,d7
		bhi.s	loc_1AB58E
		move.b	#$21,ChestIndex(a5)
		move.w	#$000E,BehaviourLUTIndex(a5)
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
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00003,d7
		bhi.s	loc_1AB5CA
		move.b	#$22,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
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
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00040,d7
		bcc.s	loc_1AB60A
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AB60A:					  ; CODE XREF: sub_1AB5CE+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
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
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AB64A:					  ; CODE XREF: ROM:001AB632j
		move.b	Action1(a5),d0
		andi.b	#$30,d0
		beq.w	EnemyAI_Giant2
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AB65C:					  ; CODE XREF: ROM:001AB638j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1AB690
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	loc_1AB690
		bra.w	EnemyAI_Giant2
; ---------------------------------------------------------------------------

loc_1AB690:					  ; CODE XREF: ROM:001AB66Cj
						  ; ROM:001AB68Aj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AB696:					  ; CODE XREF: ROM:001AB63Ej
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1AB6CA
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$2D,Unk0D(a5)
		bcs.s	locret_1AB6CA
		bra.w	EnemyAI_Giant2
; ---------------------------------------------------------------------------

locret_1AB6CA:					  ; CODE XREF: ROM:001AB6A6j
						  ; ROM:001AB6C4j
		rts
; ---------------------------------------------------------------------------

loc_1AB6CC:					  ; CODE XREF: ROM:001AB640j
		addq.b	#$01,Unk0D(a5)
		move.b	Unk0D(a5),d0
		andi.w	#$0008,d0
		lsl.w	#$05,d0
		addi.w	#$0100,d0
		move.w	d0,QueuedAction(a5)
		cmpi.w	#$0100,d0
		beq.s	loc_1AB6F8
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C

loc_1AB6F8:					  ; CODE XREF: ROM:001AB6E6j
		cmpi.b	#$60,Unk0D(a5)
		bcc.w	EnemyAI_Giant2
		rts
