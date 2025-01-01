; ---------------------------------------------------------------------------

EnemyAI_Harpy3_B:				  ; CODE XREF: ROM:001A867Aj
		bra.s	EnemyAI_Harpy3
; ---------------------------------------------------------------------------

EnemyAI_Harpy3_A:				  ; CODE XREF: ROM:001A8676j
		btst	#$01,Flags2(a5)
		bne.s	loc_1ADF20
		move.b	ChestIndex(a5),d0
		beq.s	loc_1ADF26
		cmpi.b	#$10,d0
		beq.s	loc_1ADF64
		bra.w	loc_1AE0DC
; ---------------------------------------------------------------------------

loc_1ADF20:					  ; CODE XREF: ROM:001ADF0Ej
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ADF26:					  ; CODE XREF: ROM:001ADF14j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		rts
; ---------------------------------------------------------------------------

EnemyAI_Harpy3:					  ; CODE XREF: ROM:EnemyAI_Harpy3_Bj
						  ; ROM:001AE0FEj ...
		move.w	#$0004,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ADF64:					  ; CODE XREF: ROM:001ADF1Aj
		tst.b	(byte_FF1142).l
		bne.s	loc_1ADF94
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1ADF98
		bcs.s	loc_1ADF8E
		bsr.s	sub_1ADFE6
		bcs.s	loc_1ADF8E
		bsr.w	sub_1AE034
		bcs.s	loc_1ADF8E
		bsr.w	sub_1AE082

loc_1ADF8E:					  ; CODE XREF: ROM:001ADF7Ej
						  ; ROM:001ADF82j ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ADF94:					  ; CODE XREF: ROM:001ADF6Aj
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1ADF98:					  ; CODE XREF: ROM:001ADF7Cp
		move.w	#$0050,d5
		move.w	#$0050,d6
		move.w	#$0050,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1ADFE2
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1ADFE2
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1ADFE2
		move.b	#$20,ChestIndex(a5)
		move.w	#$000E,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1ADFE2:					  ; CODE XREF: sub_1ADF98+10j
						  ; sub_1ADF98+22j ...
		tst.b	d0
		rts
; End of function sub_1ADF98


; =============== S U B	R O U T	I N E =======================================


sub_1ADFE6:					  ; CODE XREF: ROM:001ADF80p
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AE030
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AE030
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	loc_1AE030
		move.b	#$21,ChestIndex(a5)
		move.w	#$0007,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AE030:					  ; CODE XREF: sub_1ADFE6+10j
						  ; sub_1ADFE6+22j ...
		tst.b	d0
		rts
; End of function sub_1ADFE6


; =============== S U B	R O U T	I N E =======================================


sub_1AE034:					  ; CODE XREF: ROM:001ADF84p
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AE07E
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1AE07E
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1AE07E
		move.b	#$22,ChestIndex(a5)
		move.w	#$0008,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AE07E:					  ; CODE XREF: sub_1AE034+10j
						  ; sub_1AE034+22j ...
		tst.b	d0
		rts
; End of function sub_1AE034


; =============== S U B	R O U T	I N E =======================================


sub_1AE082:					  ; CODE XREF: ROM:001ADF8Ap
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AE0D8
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	loc_1AE0BE
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AE0BE:					  ; CODE XREF: sub_1AE082+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0009,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AE0D8:					  ; CODE XREF: sub_1AE082+10j
		tst.b	d0
		rts
; End of function sub_1AE082

; ---------------------------------------------------------------------------

loc_1AE0DC:					  ; CODE XREF: ROM:001ADF1Cj
		andi.b	#$0F,d0
		beq.s	loc_1AE0F6
		cmpi.b	#$01,d0
		beq.s	loc_1AE102
		cmpi.b	#$02,d0
		beq.s	loc_1AE102
		cmpi.b	#$03,d0
		beq.s	loc_1AE108
		bra.s	loc_1AE108
; ---------------------------------------------------------------------------

loc_1AE0F6:					  ; CODE XREF: ROM:001AE0E0j
		move.b	Action1(a5),d0
		andi.b	#$30,d0
		beq.w	EnemyAI_Harpy3

loc_1AE102:					  ; CODE XREF: ROM:001AE0E6j
						  ; ROM:001AE0ECj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AE108:					  ; CODE XREF: ROM:001AE0F2j
						  ; ROM:001AE0F4j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	locret_1AE13C
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1AE13C
		beq.w	EnemyAI_Harpy3

locret_1AE13C:					  ; CODE XREF: ROM:001AE118j
						  ; ROM:001AE136j
		rts
