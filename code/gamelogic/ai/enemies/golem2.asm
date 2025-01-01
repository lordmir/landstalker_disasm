; ---------------------------------------------------------------------------

EnemyAI_Golem2_B:				  ; CODE XREF: ROM:001A8632j
						  ; ROM:001A863Aj
		bra.s	EnemyAI_Golem2
; ---------------------------------------------------------------------------

EnemyAI_Golem2_A:				  ; CODE XREF: ROM:001A862Ej
						  ; ROM:001A8636j
		btst	#$01,Flags2(a5)
		bne.s	loc_1AD1F4
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AD1FA
		cmpi.b	#$10,d0
		beq.s	loc_1AD226
		bra.w	loc_1AD2BE
; ---------------------------------------------------------------------------

loc_1AD1F4:					  ; CODE XREF: ROM:001AD1E2j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AD1FA:					  ; CODE XREF: ROM:001AD1E8j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0040,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Golem2
		rts
; ---------------------------------------------------------------------------

EnemyAI_Golem2:					  ; CODE XREF: ROM:EnemyAI_Golem2_Bj
						  ; ROM:001AD21Ej ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AD226:					  ; CODE XREF: ROM:001AD1EEj
		tst.b	(byte_FF1142).l
		bne.s	loc_1AD24A
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1AD24E
		bcs.s	loc_1AD244
		bsr.s	sub_1AD28E

loc_1AD244:					  ; CODE XREF: ROM:001AD240j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AD24A:					  ; CODE XREF: ROM:001AD22Cj
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AD24E:					  ; CODE XREF: ROM:001AD23Ep
		move.w	#$0060,d5
		move.w	#$FFC0,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD28A
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	loc_1AD28A
		move.b	#$22,ChestIndex(a5)
		move.w	#$001A,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD28A:					  ; CODE XREF: sub_1AD24E+10j
						  ; sub_1AD24E+20j
		tst.b	d0
		rts
; End of function sub_1AD24E


; =============== S U B	R O U T	I N E =======================================


sub_1AD28E:					  ; CODE XREF: ROM:001AD242p
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD2BA
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD2BA:					  ; CODE XREF: sub_1AD28E+10j
		tst.b	d0
		rts
; End of function sub_1AD28E

; ---------------------------------------------------------------------------

loc_1AD2BE:					  ; CODE XREF: ROM:001AD1F0j
		andi.b	#$0F,d0
		cmpi.b	#$03,d0
		bcs.s	loc_1AD2FE
		move.w	#$0300,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	locret_1AD2FC
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1AD2FC
		beq.w	EnemyAI_Golem2

locret_1AD2FC:					  ; CODE XREF: ROM:001AD2D8j
						  ; ROM:001AD2F6j
		rts
; ---------------------------------------------------------------------------

loc_1AD2FE:					  ; CODE XREF: ROM:001AD2C6j
		bsr.w	j_j_OnTick
		rts
