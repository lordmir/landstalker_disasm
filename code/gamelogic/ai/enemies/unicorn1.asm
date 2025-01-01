; ---------------------------------------------------------------------------

EnemyAI_Unicorn1_B:				  ; CODE XREF: ROM:001A8552j
		bra.s	EnemyAI_Unicorn1
; ---------------------------------------------------------------------------

EnemyAI_Unicorn1_A:				  ; CODE XREF: ROM:001A854Ej
		bclr	#$01,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		btst	#$01,Flags2(a5)
		bne.s	loc_1A8B12
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A8B18
		cmpi.b	#$10,d0
		beq.s	loc_1A8B5E
		bra.w	loc_1A8CCA
; ---------------------------------------------------------------------------

loc_1A8B12:					  ; CODE XREF: ROM:001A8B00j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A8B18:					  ; CODE XREF: ROM:001A8B06j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Unicorn1
		rts

; =============== S U B	R O U T	I N E =======================================


EnemyAI_Unicorn1:				  ; CODE XREF: ROM:EnemyAI_Unicorn1_Bj
						  ; ROM:001A8B3Cj ...
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		bclr	#$01,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		rts
; End of function EnemyAI_Unicorn1

; ---------------------------------------------------------------------------

loc_1A8B5E:					  ; CODE XREF: ROM:001A8B0Cj
		tst.b	(byte_FF1142).l
		bne.s	loc_1A8B8A
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A8B9A
		bcs.s	loc_1A8B84
		bsr.w	sub_1A8C1E
		bcs.s	loc_1A8B84
		bsr.w	sub_1A8C9E

loc_1A8B84:					  ; CODE XREF: ROM:001A8B78j
						  ; ROM:001A8B7Ej
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A8B8A:					  ; CODE XREF: ROM:001A8B64j
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A8B9A:					  ; CODE XREF: ROM:001A8B76p
		move.w	#$0040,d5
		move.w	#$0040,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A8C1A
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A8C1A
		move.b	RotationAndSize(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.s	loc_1A8C16
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00080,d7
		bls.w	loc_1A8C00
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8C00:					  ; CODE XREF: sub_1A8B9A+4Cj
						  ; ROM:001A8D5Cj
		move.b	#$21,ChestIndex(a5)
		move.w	#$0018,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8C16:					  ; CODE XREF: sub_1A8B9A+3Cj
		bsr.w	EnemyAI_Unicorn1

loc_1A8C1A:					  ; CODE XREF: sub_1A8B9A+10j
						  ; sub_1A8B9A+22j
		tst.b	d0
		rts
; End of function sub_1A8B9A


; =============== S U B	R O U T	I N E =======================================


sub_1A8C1E:					  ; CODE XREF: ROM:001A8B7Ap
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A8C84
		move.b	RotationAndSize(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.s	loc_1A8C84
		move.b	(Player_AnimAction).l,d0
		andi.b	#$07,d0
		beq.w	loc_1A8C88
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00030,d7
		bhi.s	loc_1A8C84
		bset	#$01,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.b	#$22,ChestIndex(a5)
		move.w	#$0017,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8C84:					  ; CODE XREF: sub_1A8C1E+10j
						  ; sub_1A8C1E+2Aj ...
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1A8C88:					  ; CODE XREF: sub_1A8C1E+36j
		move.b	#$23,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; End of function sub_1A8C1E


; =============== S U B	R O U T	I N E =======================================


sub_1A8C9E:					  ; CODE XREF: ROM:001A8B80p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A8CC6
		move.b	#$24,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8CC6:					  ; CODE XREF: sub_1A8C9E+10j
		tst.b	d0
		rts
; End of function sub_1A8C9E

; ---------------------------------------------------------------------------

loc_1A8CCA:					  ; CODE XREF: ROM:001A8B0Ej
		andi.b	#$0F,d0
		beq.s	loc_1A8CEC
		cmpi.b	#$01,d0
		beq.w	loc_1A8D74
		cmpi.b	#$02,d0
		beq.w	loc_1A8DA6
		cmpi.b	#$03,d0
		beq.w	loc_1A8D7A
		bra.w	loc_1A8D7A
; ---------------------------------------------------------------------------

loc_1A8CEC:					  ; CODE XREF: ROM:001A8CCEj
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0040,d5
		move.w	#$0040,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcc.w	EnemyAI_Unicorn1
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.w	EnemyAI_Unicorn1
		move.b	RotationAndSize(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.w	EnemyAI_Unicorn1
		addq.b	#$01,Unk0D(a5)
		move.b	Unk0D(a5),d0
		andi.b	#$0F,d0
		bne.s	loc_1A8D60
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00080,d7
		bcs.w	loc_1A8C00

loc_1A8D60:					  ; CODE XREF: ROM:001A8D4Cj
		move.b	Unk0D(a5),d0
		andi.w	#$0010,d0
		lsl.w	#$04,d0
		addi.w	#$0300,d0
		move.w	d0,QueuedAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A8D74:					  ; CODE XREF: ROM:001A8CD4j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A8D7A:					  ; CODE XREF: ROM:001A8CE4j
						  ; ROM:001A8CE8j
		addq.b	#$01,Unk0D(a5)
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0100,QueuedAction(a5)
		cmpi.b	#$10,Unk0D(a5)
		bcs.s	loc_1A8DA0
		bra.w	EnemyAI_Unicorn1
; ---------------------------------------------------------------------------

loc_1A8DA0:					  ; CODE XREF: ROM:001A8D9Aj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A8DA6:					  ; CODE XREF: ROM:001A8CDCj
		bset	#$01,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bsr.w	j_j_OnTick
		rts
