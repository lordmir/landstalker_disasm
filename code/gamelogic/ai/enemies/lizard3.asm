; ---------------------------------------------------------------------------

EnemyAI_Lizard3_B:				  ; CODE XREF: ROM:001A8502j
		bra.s	EnemyAI_Lizard3
; ---------------------------------------------------------------------------

EnemyAI_Lizard3_A:				  ; CODE XREF: ROM:001A84FEj
		btst	#$01,Flags2(a5)
		bne.s	loc_1A6C4C
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A6C52
		cmpi.b	#$10,d0
		beq.s	loc_1A6C7E
		bra.w	loc_1A6DC0
; ---------------------------------------------------------------------------

loc_1A6C4C:					  ; CODE XREF: ROM:001A6C3Aj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A6C52:					  ; CODE XREF: ROM:001A6C40j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Lizard3
		rts
; ---------------------------------------------------------------------------

EnemyAI_Lizard3:				  ; CODE XREF: ROM:EnemyAI_Lizard3_Bj
						  ; ROM:001A6C76j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A6C7E:					  ; CODE XREF: ROM:001A6C46j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A6CAE
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A6CB2
		bcs.s	loc_1A6CA8
		bsr.s	sub_1A6CEE
		bcs.s	loc_1A6CA8
		bsr.w	sub_1A6D2A
		bcs.s	loc_1A6CA8
		bsr.w	sub_1A6D66

loc_1A6CA8:					  ; CODE XREF: ROM:001A6C98j
						  ; ROM:001A6C9Cj ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A6CAE:					  ; CODE XREF: ROM:001A6C84j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A6CB2:					  ; CODE XREF: ROM:001A6C96p
		move.w	#$0050,d5
		move.w	#$FFD0,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6CEA
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bhi.s	loc_1A6CEA
		move.b	#$20,ChestIndex(a5)
		move.w	#$0015,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6CEA:					  ; CODE XREF: sub_1A6CB2+10j
						  ; sub_1A6CB2+20j
		tst.b	d0
		rts
; End of function sub_1A6CB2


; =============== S U B	R O U T	I N E =======================================


sub_1A6CEE:					  ; CODE XREF: ROM:001A6C9Ap
		move.w	#$0040,d5
		move.w	#$FFD0,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6D26
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00031,d7
		bhi.s	loc_1A6D26
		move.b	#$21,ChestIndex(a5)
		move.w	#$000E,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6D26:					  ; CODE XREF: sub_1A6CEE+10j
						  ; sub_1A6CEE+20j
		tst.b	d0
		rts
; End of function sub_1A6CEE


; =============== S U B	R O U T	I N E =======================================


sub_1A6D2A:					  ; CODE XREF: ROM:001A6C9Ep
		move.w	#$0040,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6D62
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00031,d7
		bhi.s	loc_1A6D62
		move.b	#$22,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6D62:					  ; CODE XREF: sub_1A6D2A+10j
						  ; sub_1A6D2A+20j
		tst.b	d0
		rts
; End of function sub_1A6D2A


; =============== S U B	R O U T	I N E =======================================


sub_1A6D66:					  ; CODE XREF: ROM:001A6CA4p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A6DBC
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00040,d7
		bcc.s	loc_1A6DA2
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6DA2:					  ; CODE XREF: sub_1A6D66+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A6DBC:					  ; CODE XREF: sub_1A6D66+10j
		tst.b	d0
		rts
; End of function sub_1A6D66

; ---------------------------------------------------------------------------

loc_1A6DC0:					  ; CODE XREF: ROM:001A6C48j
		andi.b	#$0F,d0
		beq.s	loc_1A6DDE
		cmpi.b	#$01,d0
		beq.s	loc_1A6E2C
		cmpi.b	#$02,d0
		beq.s	loc_1A6E02
		cmpi.b	#$03,d0
		beq.w	loc_1A6E66
		bra.w	loc_1A6E2C
; ---------------------------------------------------------------------------

loc_1A6DDE:					  ; CODE XREF: ROM:001A6DC4j
		cmpi.b	#$08,BehavParam(a5)
		bcc.s	loc_1A6DFC
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)

loc_1A6DFC:					  ; CODE XREF: ROM:001A6DE4j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A6E02:					  ; CODE XREF: ROM:001A6DD0j
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$19,Unk0D(a5)
		bcc.w	EnemyAI_Lizard3
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A6E2C:					  ; CODE XREF: ROM:001A6DCAj
						  ; ROM:001A6DDAj
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1A6E60
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	loc_1A6E60
		bra.w	EnemyAI_Lizard3
; ---------------------------------------------------------------------------

loc_1A6E60:					  ; CODE XREF: ROM:001A6E3Cj
						  ; ROM:001A6E5Aj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A6E66:					  ; CODE XREF: ROM:001A6DD6j
		move.w	#$0300,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	locret_1A6E9A
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1A6E9A
		bra.w	EnemyAI_Lizard3
; ---------------------------------------------------------------------------

locret_1A6E9A:					  ; CODE XREF: ROM:001A6E76j
						  ; ROM:001A6E94j
		rts
