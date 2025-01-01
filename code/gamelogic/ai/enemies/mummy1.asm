; ---------------------------------------------------------------------------

EnemyAI_Mummy1_B:				  ; CODE XREF: ROM:001A853Aj
		bra.s	EnemyAI_Mummy1
; ---------------------------------------------------------------------------

EnemyAI_Mummy1_A:				  ; CODE XREF: ROM:001A8536j
		btst	#$01,Flags2(a5)
		bne.s	loc_1A7ADA
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A7AE0
		cmpi.b	#$10,d0
		beq.s	loc_1A7B40
		bra.w	loc_1A7C9E
; ---------------------------------------------------------------------------

loc_1A7ADA:					  ; CODE XREF: ROM:001A7AC8j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A7AE0:					  ; CODE XREF: ROM:001A7ACEj
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0070,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Mummy1
		rts
; ---------------------------------------------------------------------------

EnemyAI_Mummy1:					  ; CODE XREF: ROM:EnemyAI_Mummy1_Bj
						  ; ROM:001A7B04j ...
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		clr.b	Unk0D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A7B24:					  ; CODE XREF: ROM:001A7DB4j
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$24,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		clr.b	Unk0D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A7B40:					  ; CODE XREF: ROM:001A7AD4j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A7B70
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A7B80
		bcs.s	loc_1A7B6A
		bsr.s	sub_1A7BBC
		bcs.s	loc_1A7B6A
		bsr.w	sub_1A7BF8
		bcs.s	loc_1A7B6A
		bsr.w	sub_1A7C34

loc_1A7B6A:					  ; CODE XREF: ROM:001A7B5Aj
						  ; ROM:001A7B5Ej ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A7B70:					  ; CODE XREF: ROM:001A7B46j
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A7B80:					  ; CODE XREF: ROM:001A7B58p
		move.w	#$0050,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7BB8
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0012,d7
		bhi.s	loc_1A7BB8
		move.b	#$20,ChestIndex(a5)
		move.w	#$0013,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7BB8:					  ; CODE XREF: sub_1A7B80+10j
						  ; sub_1A7B80+20j
		tst.b	d0
		rts
; End of function sub_1A7B80


; =============== S U B	R O U T	I N E =======================================


sub_1A7BBC:					  ; CODE XREF: ROM:001A7B5Cp
		move.w	#$0048,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7BF4
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1A7BF4
		move.b	#$21,ChestIndex(a5)
		move.w	#$0008,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7BF4:					  ; CODE XREF: sub_1A7BBC+10j
						  ; sub_1A7BBC+20j
		tst.b	d0
		rts
; End of function sub_1A7BBC


; =============== S U B	R O U T	I N E =======================================


sub_1A7BF8:					  ; CODE XREF: ROM:001A7B60p
		move.w	#$0038,d5
		move.w	#$FFD8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7C30
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00020,d7
		bhi.s	loc_1A7C30
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7C30:					  ; CODE XREF: sub_1A7BF8+10j
						  ; sub_1A7BF8+20j
		tst.b	d0
		rts
; End of function sub_1A7BF8


; =============== S U B	R O U T	I N E =======================================


sub_1A7C34:					  ; CODE XREF: ROM:001A7B66p
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7C9A
		move.w	HitBoxZEnd(a5),d0
		sub.w	(Player_Z).l,d0
		cmpi.w	#$0021,d0
		bhi.s	loc_1A7C9A
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00080,d7
		bcc.s	loc_1A7C80
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7C80:					  ; CODE XREF: sub_1A7C34+30j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7C9A:					  ; CODE XREF: sub_1A7C34+10j
						  ; sub_1A7C34+20j
		tst.b	d0
		rts
; End of function sub_1A7C34

; ---------------------------------------------------------------------------

loc_1A7C9E:					  ; CODE XREF: ROM:001A7AD6j
		andi.b	#$0F,d0
		beq.s	loc_1A7CBE
		cmpi.b	#$01,d0
		beq.s	loc_1A7CBE
		cmpi.b	#$02,d0
		beq.w	loc_1A7CC4
		cmpi.b	#$03,d0
		beq.w	loc_1A7DC4
		bra.w	loc_1A7D48
; ---------------------------------------------------------------------------

loc_1A7CBE:					  ; CODE XREF: ROM:001A7CA2j
						  ; ROM:001A7CA8j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A7CC4:					  ; CODE XREF: ROM:001A7CAEj
		move.w	#$0300,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$08,Unk0D(a5)
		bcs.s	locret_1A7D46
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$10,Unk0D(a5)
		bcs.s	locret_1A7D46
		move.w	#$0500,QueuedAction(a5)
		cmpi.b	#$18,Unk0D(a5)
		bcs.s	locret_1A7D46
		cmpi.b	#$19,Unk0D(a5)
		bcc.s	loc_1A7D22
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1A7D42
		addq.b	#$01,Unk0D(a5)

loc_1A7D22:					  ; CODE XREF: ROM:001A7CF8j
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$20,Unk0D(a5)
		bcs.s	locret_1A7D46
		move.w	#$0300,QueuedAction(a5)
		cmpi.b	#$28,Unk0D(a5)
		bcs.s	locret_1A7D46
		bra.w	EnemyAI_Mummy1
; ---------------------------------------------------------------------------

loc_1A7D42:					  ; CODE XREF: ROM:001A7D1Aj
		subq.b	#$01,Unk0D(a5)

locret_1A7D46:					  ; CODE XREF: ROM:001A7CD4j
						  ; ROM:001A7CE2j ...
		rts
; ---------------------------------------------------------------------------

loc_1A7D48:					  ; CODE XREF: ROM:001A7CBAj
		tst.b	(byte_FF1145).l
		bne.w	EnemyAI_Mummy1
		tst.b	(byte_FF1142).l
		bne.w	loc_1A7D68
		move.b	#$01,(byte_FF1142).l
		bra.w	*+4
; ---------------------------------------------------------------------------

loc_1A7D68:					  ; CODE XREF: ROM:001A7D58j
						  ; ROM:001A7D64j
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0015,d5
		move.w	#$0009,d6
		move.w	#$0009,d7
		bsr.w	sub_1A8964
		bcc.w	EnemyAI_Mummy1
		move.b	Unk0D(a5),d0
		addq.b	#$01,Unk0D(a5)
		tst.b	d0
		bne.s	loc_1A7DB0
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Throw
; ---------------------------------------------------------------------------
		lea	(Player_X).l,a5
		move.w	#$0040,d0
		bsr.w	j_j_RemoveHealth
		tst.w	CurrentHealth(a5)
		beq.s	loc_1A7DBA

loc_1A7DB0:					  ; CODE XREF: ROM:001A7D96j
		cmpi.b	#$28,d0
		bcc.w	loc_1A7B24
		rts
; ---------------------------------------------------------------------------

loc_1A7DBA:					  ; CODE XREF: ROM:001A7DAEj
		bclr	#$06,Flags2(a5)
		bra.w	loc_1A8AEC
; ---------------------------------------------------------------------------

loc_1A7DC4:					  ; CODE XREF: ROM:001A7CB6j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.w	locret_1A7DF8
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0011,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcc.w	EnemyAI_Mummy1

locret_1A7DF8:					  ; CODE XREF: ROM:001A7DD4j
		rts
