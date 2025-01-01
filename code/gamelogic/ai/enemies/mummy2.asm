; ---------------------------------------------------------------------------

EnemyAI_Mummy2_B:				  ; CODE XREF: ROM:001A8542j
		bra.s	EnemyAI_Mummy2
; ---------------------------------------------------------------------------

EnemyAI_Mummy2_A:				  ; CODE XREF: ROM:001A853Ej
		btst	#$01,Flags2(a5)
		bne.s	loc_1A7E14
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A7E1A
		cmpi.b	#$10,d0
		beq.s	loc_1A7E7A
		bra.w	loc_1A7FD8
; ---------------------------------------------------------------------------

loc_1A7E14:					  ; CODE XREF: ROM:001A7E02j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A7E1A:					  ; CODE XREF: ROM:001A7E08j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0070,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Mummy2
		rts
; ---------------------------------------------------------------------------

EnemyAI_Mummy2:					  ; CODE XREF: ROM:EnemyAI_Mummy2_Bj
						  ; ROM:001A7E3Ej ...
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		clr.b	Unk0D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A7E5E:					  ; CODE XREF: ROM:001A80EEj
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$24,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		clr.b	Unk0D(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A7E7A:					  ; CODE XREF: ROM:001A7E0Ej
		tst.b	(byte_FF1142).l
		bne.s	loc_1A7EAA
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A7EBA
		bcs.s	loc_1A7EA4
		bsr.s	sub_1A7EF6
		bcs.s	loc_1A7EA4
		bsr.w	sub_1A7F32
		bcs.s	loc_1A7EA4
		bsr.w	sub_1A7F6E

loc_1A7EA4:					  ; CODE XREF: ROM:001A7E94j
						  ; ROM:001A7E98j ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A7EAA:					  ; CODE XREF: ROM:001A7E80j
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A7EBA:					  ; CODE XREF: ROM:001A7E92p
		move.w	#$0050,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7EF2
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	loc_1A7EF2
		move.b	#$20,ChestIndex(a5)
		move.w	#$0013,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7EF2:					  ; CODE XREF: sub_1A7EBA+10j
						  ; sub_1A7EBA+20j
		tst.b	d0
		rts
; End of function sub_1A7EBA


; =============== S U B	R O U T	I N E =======================================


sub_1A7EF6:					  ; CODE XREF: ROM:001A7E96p
		move.w	#$0048,d5
		move.w	#$FFC8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7F2E
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	loc_1A7F2E
		move.b	#$21,ChestIndex(a5)
		move.w	#$0014,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7F2E:					  ; CODE XREF: sub_1A7EF6+10j
						  ; sub_1A7EF6+20j
		tst.b	d0
		rts
; End of function sub_1A7EF6


; =============== S U B	R O U T	I N E =======================================


sub_1A7F32:					  ; CODE XREF: ROM:001A7E9Ap
		move.w	#$0038,d5
		move.w	#$FFD8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7F6A
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00030,d7
		bhi.s	loc_1A7F6A
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7F6A:					  ; CODE XREF: sub_1A7F32+10j
						  ; sub_1A7F32+20j
		tst.b	d0
		rts
; End of function sub_1A7F32


; =============== S U B	R O U T	I N E =======================================


sub_1A7F6E:					  ; CODE XREF: ROM:001A7EA0p
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A7FD4
		move.w	HitBoxZEnd(a5),d0
		sub.w	(Player_Z).l,d0
		cmpi.w	#$0021,d0
		bhi.s	loc_1A7FD4
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00060,d7
		bcc.s	loc_1A7FBA
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7FBA:					  ; CODE XREF: sub_1A7F6E+30j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7FD4:					  ; CODE XREF: sub_1A7F6E+10j
						  ; sub_1A7F6E+20j
		tst.b	d0
		rts
; End of function sub_1A7F6E

; ---------------------------------------------------------------------------

loc_1A7FD8:					  ; CODE XREF: ROM:001A7E10j
		andi.b	#$0F,d0
		beq.s	loc_1A7FF8
		cmpi.b	#$01,d0
		beq.s	loc_1A7FF8
		cmpi.b	#$02,d0
		beq.w	loc_1A7FFE
		cmpi.b	#$03,d0
		beq.w	loc_1A80FE
		bra.w	loc_1A8082
; ---------------------------------------------------------------------------

loc_1A7FF8:					  ; CODE XREF: ROM:001A7FDCj
						  ; ROM:001A7FE2j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A7FFE:					  ; CODE XREF: ROM:001A7FE8j
		move.w	#$0300,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$08,Unk0D(a5)
		bcs.s	locret_1A8080
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$10,Unk0D(a5)
		bcs.s	locret_1A8080
		move.w	#$0500,QueuedAction(a5)
		cmpi.b	#$18,Unk0D(a5)
		bcs.s	locret_1A8080
		cmpi.b	#$19,Unk0D(a5)
		bcc.s	loc_1A805C
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcc.w	loc_1A807C
		addq.b	#$01,Unk0D(a5)

loc_1A805C:					  ; CODE XREF: ROM:001A8032j
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$20,Unk0D(a5)
		bcs.s	locret_1A8080
		move.w	#$0300,QueuedAction(a5)
		cmpi.b	#$28,Unk0D(a5)
		bcs.s	locret_1A8080
		bra.w	EnemyAI_Mummy2
; ---------------------------------------------------------------------------

loc_1A807C:					  ; CODE XREF: ROM:001A8054j
		subq.b	#$01,Unk0D(a5)

locret_1A8080:					  ; CODE XREF: ROM:001A800Ej
						  ; ROM:001A801Cj ...
		rts
; ---------------------------------------------------------------------------

loc_1A8082:					  ; CODE XREF: ROM:001A7FF4j
		tst.b	(byte_FF1145).l
		bne.w	EnemyAI_Mummy2
		tst.b	(byte_FF1142).l
		bne.w	loc_1A80A2
		move.b	#$01,(byte_FF1142).l
		bra.w	*+4
; ---------------------------------------------------------------------------

loc_1A80A2:					  ; CODE XREF: ROM:001A8092j
						  ; ROM:001A809Ej
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0015,d5
		move.w	#$0009,d6
		move.w	#$0009,d7
		bsr.w	sub_1A8964
		bcc.w	EnemyAI_Mummy2
		move.b	Unk0D(a5),d0
		addq.b	#$01,Unk0D(a5)
		tst.b	d0
		bne.s	loc_1A80EA
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Throw
; ---------------------------------------------------------------------------
		lea	(Player_X).l,a5
		move.w	#$0040,d0
		bsr.w	j_j_RemoveHealth
		tst.w	CurrentHealth(a5)
		beq.s	loc_1A80F4

loc_1A80EA:					  ; CODE XREF: ROM:001A80D0j
		cmpi.b	#$28,d0
		bcc.w	loc_1A7E5E
		rts
; ---------------------------------------------------------------------------

loc_1A80F4:					  ; CODE XREF: ROM:001A80E8j
		bclr	#$06,Flags2(a5)
		bra.w	loc_1A8AEC
; ---------------------------------------------------------------------------

loc_1A80FE:					  ; CODE XREF: ROM:001A7FF0j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.w	locret_1A8132
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0011,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcc.w	EnemyAI_Mummy2

locret_1A8132:					  ; CODE XREF: ROM:001A810Ej
		rts
