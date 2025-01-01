; ---------------------------------------------------------------------------

EnemyAI_Bubble2_B:				  ; CODE XREF: ROM:001A85D2j
		bra.s	EnemyAI_Bubble2
; ---------------------------------------------------------------------------

EnemyAI_Bubble2_A:				  ; CODE XREF: ROM:001A85CEj
		btst	#$01,Flags2(a5)
		bne.s	loc_1ABA52
		move.b	ChestIndex(a5),d0
		beq.s	loc_1ABA70
		cmpi.b	#$10,d0
		beq.w	loc_1ABAE8

loc_1ABA52:					  ; CODE XREF: ROM:001ABA42j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

EnemyAI_Bubble2:				  ; CODE XREF: ROM:EnemyAI_Bubble2_Bj
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$00,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABA70:					  ; CODE XREF: ROM:001ABA48j
		tst.w	BehavParam(a5)
		bne.s	loc_1ABAAE
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.b	#$01,d7
		bcs.s	loc_1ABA8E
		cmpi.b	#$02,d7
		bcs.s	loc_1ABAC4
		rts
; ---------------------------------------------------------------------------

loc_1ABA8E:					  ; CODE XREF: ROM:001ABA84j
		move.b	#$22,d0
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.b	#080,d7
		bcs.s	loc_1ABAA6
		move.b	#$21,d0

loc_1ABAA6:					  ; CODE XREF: ROM:001ABAA0j
		move.w	d0,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour

loc_1ABAAE:					  ; CODE XREF: ROM:001ABA74j
		btst	#$05,Action1(a5)
		bne.s	loc_1ABAD0
		btst	#$04,Action1(a5)
		bne.s	loc_1ABADC
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ABAC4:					  ; CODE XREF: ROM:001ABA8Aj
		move.b	#$10,ChestIndex(a5)
		clr.b	Unk0D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABAD0:					  ; CODE XREF: ROM:001ABAB4j
		bsr.w	j_j_OnTick
		move.w	#$0100,QueuedAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABADC:					  ; CODE XREF: ROM:001ABABCj
		bsr.w	j_j_OnTick
		move.w	#$0200,QueuedAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABAE8:					  ; CODE XREF: ROM:001ABA4Ej
		addq.b	#$01,Unk0D(a5)
		move.b	Unk0D(a5),d0
		andi.w	#$0004,d0
		lsl.w	#$06,d0
		addi.w	#$0300,d0
		move.w	d0,QueuedAction(a5)
		cmpi.b	#$40,Unk0D(a5)
		bcs.s	locret_1ABB14
		clr.w	QueuedAction(a5)
		move.w	#$FFFF,PrevAction(a5)
		clr.b	ChestIndex(a5)

locret_1ABB14:					  ; CODE XREF: ROM:001ABB04j
		rts
