; ---------------------------------------------------------------------------

EnemyAI_Bubble1_B:				  ; CODE XREF: ROM:001A85CAj
		bra.s	EnemyAI_Bubble1
; ---------------------------------------------------------------------------

EnemyAI_Bubble1_A:				  ; CODE XREF: ROM:001A85C6j
		btst	#$01,Flags2(a5)
		bne.s	loc_1AB9B4
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AB9BA
		cmpi.b	#$10,d0
		beq.s	loc_1ABA0C

loc_1AB9B4:					  ; CODE XREF: ROM:001AB9A6j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AB9BA:					  ; CODE XREF: ROM:001AB9ACj
		tst.w	BehavParam(a5)
		bne.s	loc_1AB9E2
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.b	#$01,d7
		bcs.s	loc_1AB9D8
		cmpi.b	#$02,d7
		bcs.s	loc_1AB9E8
		rts
; ---------------------------------------------------------------------------

loc_1AB9D8:					  ; CODE XREF: ROM:001AB9CEj
		move.w	#$0020,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour

loc_1AB9E2:					  ; CODE XREF: ROM:001AB9BEj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AB9E8:					  ; CODE XREF: ROM:001AB9D4j
		move.b	#$10,ChestIndex(a5)
		clr.b	Unk0D(a5)
		rts
; ---------------------------------------------------------------------------

EnemyAI_Bubble1:				  ; CODE XREF: ROM:EnemyAI_Bubble1_Bj
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$00,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABA0C:					  ; CODE XREF: ROM:001AB9B2j
		addq.b	#$01,Unk0D(a5)
		move.b	Unk0D(a5),d0
		andi.w	#$0004,d0
		lsl.w	#$06,d0
		addi.w	#$0300,d0
		move.w	d0,QueuedAction(a5)
		cmpi.b	#$40,Unk0D(a5)
		bcs.s	locret_1ABA38
		clr.w	QueuedAction(a5)
		move.w	#$FFFF,PrevAction(a5)
		clr.b	ChestIndex(a5)

locret_1ABA38:					  ; CODE XREF: ROM:001ABA28j
		rts
