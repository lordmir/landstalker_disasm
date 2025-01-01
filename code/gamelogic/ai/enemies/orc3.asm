; ---------------------------------------------------------------------------

EnemyAI_Orc3_B:					  ; CODE XREF: ROM:001A84BAj
		bra.s	EnemyAI_Orc3
; ---------------------------------------------------------------------------

EnemyAI_Orc3_A:					  ; CODE XREF: ROM:001A84B6j
		btst	#$01,Flags2(a5)
		bne.s	loc_1A5134
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A513A
		cmpi.b	#$10,d0
		beq.s	loc_1A5166
		bra.w	loc_1A52DE
; ---------------------------------------------------------------------------

loc_1A5134:					  ; CODE XREF: ROM:001A5122j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A513A:					  ; CODE XREF: ROM:001A5128j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0040,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Orc3
		rts
; ---------------------------------------------------------------------------

EnemyAI_Orc3:					  ; CODE XREF: ROM:EnemyAI_Orc3_Bj
						  ; ROM:001A515Ej ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1A5166:					  ; CODE XREF: ROM:001A512Ej
		tst.b	(byte_FF1142).l
		bne.s	loc_1A5196
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A519A
		bcs.s	loc_1A5190
		bsr.s	sub_1A51E8
		bcs.s	loc_1A5190
		bsr.w	sub_1A5236
		bcs.s	loc_1A5190
		bsr.w	sub_1A5284

loc_1A5190:					  ; CODE XREF: ROM:001A5180j
						  ; ROM:001A5184j ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A5196:					  ; CODE XREF: ROM:001A516Cj
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1A519A:					  ; CODE XREF: ROM:001A517Ep
		move.w	#$0050,d5
		move.w	#$0050,d6
		move.w	#$0050,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A51E4
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A51E4
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00008,d7
		bhi.s	loc_1A51E4
		move.b	#$20,ChestIndex(a5)
		move.w	#$000E,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A51E4:					  ; CODE XREF: sub_1A519A+10j
						  ; sub_1A519A+22j ...
		tst.b	d0
		rts
; End of function sub_1A519A


; =============== S U B	R O U T	I N E =======================================


sub_1A51E8:					  ; CODE XREF: ROM:001A5182p
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A5232
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A5232
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1A5232
		move.b	#$21,ChestIndex(a5)
		move.w	#$0012,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A5232:					  ; CODE XREF: sub_1A51E8+10j
						  ; sub_1A51E8+22j ...
		tst.b	d0
		rts
; End of function sub_1A51E8


; =============== S U B	R O U T	I N E =======================================


sub_1A5236:					  ; CODE XREF: ROM:001A5186p
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A5280
		move.w	#$0020,d5
		move.w	#$0020,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A5280
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1A5280
		move.b	#$22,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A5280:					  ; CODE XREF: sub_1A5236+10j
						  ; sub_1A5236+22j ...
		tst.b	d0
		rts
; End of function sub_1A5236


; =============== S U B	R O U T	I N E =======================================


sub_1A5284:					  ; CODE XREF: ROM:001A518Cp
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A52DA
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0032,d7
		bcc.s	loc_1A52C0
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A52C0:					  ; CODE XREF: sub_1A5284+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0012,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	$0000000D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A52DA:					  ; CODE XREF: sub_1A5284+10j
		tst.b	d0
		rts
; End of function sub_1A5284

; ---------------------------------------------------------------------------

loc_1A52DE:					  ; CODE XREF: ROM:001A5130j
		andi.b	#$0F,d0
		beq.s	loc_1A52F8
		cmpi.b	#$01,d0
		beq.s	loc_1A5340
		cmpi.b	#$02,d0
		beq.s	loc_1A5340
		cmpi.b	#$03,d0
		beq.s	loc_1A530A
		bra.s	loc_1A5340
; ---------------------------------------------------------------------------

loc_1A52F8:					  ; CODE XREF: ROM:001A52E2j
		move.b	Action1(a5),d0
		andi.b	#$30,d0
		beq.w	EnemyAI_Orc3
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A530A:					  ; CODE XREF: ROM:001A52F4j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	locret_1A533E
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1A533E
		beq.w	EnemyAI_Orc3

locret_1A533E:					  ; CODE XREF: ROM:001A531Aj
						  ; ROM:001A5338j
		rts
; ---------------------------------------------------------------------------

loc_1A5340:					  ; CODE XREF: ROM:001A52E8j
						  ; ROM:001A52EEj ...
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1A5374
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	loc_1A5374
		beq.w	EnemyAI_Orc3

loc_1A5374:					  ; CODE XREF: ROM:001A5350j
						  ; ROM:001A536Ej
		bsr.w	j_j_OnTick
		rts
