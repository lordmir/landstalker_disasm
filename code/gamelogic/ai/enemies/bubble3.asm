; ---------------------------------------------------------------------------

EnemyAI_Bubble3_B:				  ; CODE XREF: ROM:001A85DAj
						  ; ROM:001A86B2j ...
		bra.s	EnemyAI_Bubble3
; ---------------------------------------------------------------------------

EnemyAI_Bubble3_A:				  ; CODE XREF: ROM:001A85D6j
						  ; ROM:001A86AEj ...
		btst	#$01,Flags2(a5)
		bne.s	loc_1ABB2E
		move.b	ChestIndex(a5),d0
		beq.s	loc_1ABB4C
		cmpi.b	#$10,d0
		beq.w	loc_1ABBE6

loc_1ABB2E:					  ; CODE XREF: ROM:001ABB1Ej
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

EnemyAI_Bubble3:				  ; CODE XREF: ROM:EnemyAI_Bubble3_Bj
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$00,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABB4C:					  ; CODE XREF: ROM:001ABB24j
		tst.w	BehavParam(a5)
		bne.s	loc_1ABBAC
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0040,d5
		move.w	#$0040,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1ABB8C
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.b	#$01,d7
		bcs.s	loc_1ABB8C
		cmpi.b	#$02,d7
		bcs.s	loc_1ABBC2
		rts
; ---------------------------------------------------------------------------

loc_1ABB8C:					  ; CODE XREF: ROM:001ABB72j
						  ; ROM:001ABB82j
		move.b	#$22,d0
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.b	#080,d7
		bcs.s	loc_1ABBA4
		move.b	#$21,d0

loc_1ABBA4:					  ; CODE XREF: ROM:001ABB9Ej
		move.w	d0,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour

loc_1ABBAC:					  ; CODE XREF: ROM:001ABB50j
		btst	#$05,Action1(a5)
		bne.s	loc_1ABBCE
		btst	#$04,Action1(a5)
		bne.s	loc_1ABBDA
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ABBC2:					  ; CODE XREF: ROM:001ABB88j
		move.b	#$10,ChestIndex(a5)
		clr.b	Unk0D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABBCE:					  ; CODE XREF: ROM:001ABBB2j
		bsr.w	j_j_OnTick
		move.w	#$0100,QueuedAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABBDA:					  ; CODE XREF: ROM:001ABBBAj
		bsr.w	j_j_OnTick
		move.w	#$0200,QueuedAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABBE6:					  ; CODE XREF: ROM:001ABB2Aj
		addq.b	#$01,Unk0D(a5)
		move.b	Unk0D(a5),d0
		andi.w	#$0004,d0
		lsl.w	#$06,d0
		addi.w	#$0300,d0
		move.w	d0,QueuedAction(a5)
		cmpi.b	#$40,Unk0D(a5)
		bcs.s	locret_1ABC12
		clr.w	QueuedAction(a5)
		move.w	#$FFFF,PrevAction(a5)
		clr.b	ChestIndex(a5)

locret_1ABC12:					  ; CODE XREF: ROM:001ABC02j
		rts
