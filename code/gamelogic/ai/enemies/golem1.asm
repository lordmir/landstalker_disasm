; ---------------------------------------------------------------------------

EnemyAI_Golem1_B:				  ; CODE XREF: ROM:001A862Aj
		bra.s	EnemyAI_Golem1
; ---------------------------------------------------------------------------

EnemyAI_Golem1_A:				  ; CODE XREF: ROM:001A8626j
		btst	#$01,Flags2(a5)
		bne.s	loc_1AD0CA
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AD0D0
		cmpi.b	#$10,d0
		beq.s	loc_1AD0FC
		bra.w	loc_1AD194
; ---------------------------------------------------------------------------

loc_1AD0CA:					  ; CODE XREF: ROM:001AD0B8j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AD0D0:					  ; CODE XREF: ROM:001AD0BEj
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0040,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Golem1
		rts
; ---------------------------------------------------------------------------

EnemyAI_Golem1:					  ; CODE XREF: ROM:EnemyAI_Golem1_Bj
						  ; ROM:001AD0F4j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AD0FC:					  ; CODE XREF: ROM:001AD0C4j
		tst.b	(byte_FF1142).l
		bne.s	loc_1AD120
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1AD124
		bcs.s	loc_1AD11A
		bsr.s	sub_1AD164

loc_1AD11A:					  ; CODE XREF: ROM:001AD116j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AD120:					  ; CODE XREF: ROM:001AD102j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AD124:					  ; CODE XREF: ROM:001AD114p
		move.w	#$0050,d5
		move.w	#$FFD8,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD160
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bcc.s	loc_1AD160
		move.b	#$22,ChestIndex(a5)
		move.w	#$0013,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD160:					  ; CODE XREF: sub_1AD124+10j
						  ; sub_1AD124+20j
		tst.b	d0
		rts
; End of function sub_1AD124


; =============== S U B	R O U T	I N E =======================================


sub_1AD164:					  ; CODE XREF: ROM:001AD118p
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD190
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD190:					  ; CODE XREF: sub_1AD164+10j
		tst.b	d0
		rts
; End of function sub_1AD164

; ---------------------------------------------------------------------------

loc_1AD194:					  ; CODE XREF: ROM:001AD0C6j
		andi.b	#$0F,d0
		cmpi.b	#$03,d0
		bcs.s	loc_1AD1D4
		move.w	#$0300,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	locret_1AD1D2
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1AD1D2
		beq.w	EnemyAI_Golem1

locret_1AD1D2:					  ; CODE XREF: ROM:001AD1AEj
						  ; ROM:001AD1CCj
		rts
; ---------------------------------------------------------------------------

loc_1AD1D4:					  ; CODE XREF: ROM:001AD19Cj
		bsr.w	j_j_OnTick
		rts
