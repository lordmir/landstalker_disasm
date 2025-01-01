; ---------------------------------------------------------------------------

EnemyAI_Unicorn2_B:				  ; CODE XREF: ROM:001A855Aj
		bra.s	EnemyAI_Unicorn2
; ---------------------------------------------------------------------------

EnemyAI_Unicorn2_A:				  ; CODE XREF: ROM:001A8556j
		bclr	#$01,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		btst	#$01,Flags2(a5)
		bne.s	loc_1A8DD2
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A8DD8
		cmpi.b	#$10,d0
		beq.s	loc_1A8E1E
		bra.w	loc_1A8F8A
; ---------------------------------------------------------------------------

loc_1A8DD2:					  ; CODE XREF: ROM:001A8DC0j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A8DD8:					  ; CODE XREF: ROM:001A8DC6j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Unicorn2
		rts

; =============== S U B	R O U T	I N E =======================================


EnemyAI_Unicorn2:				  ; CODE XREF: ROM:EnemyAI_Unicorn2_Bj
						  ; ROM:001A8DFCj ...
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		bclr	#$01,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		rts
; End of function EnemyAI_Unicorn2

; ---------------------------------------------------------------------------

loc_1A8E1E:					  ; CODE XREF: ROM:001A8DCCj
		tst.b	(byte_FF1142).l
		bne.s	loc_1A8E4A
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A8E5A
		bcs.s	loc_1A8E44
		bsr.w	sub_1A8EDE
		bcs.s	loc_1A8E44
		bsr.w	sub_1A8F5E

loc_1A8E44:					  ; CODE XREF: ROM:001A8E38j
						  ; ROM:001A8E3Ej
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A8E4A:					  ; CODE XREF: ROM:001A8E24j
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A8E5A:					  ; CODE XREF: ROM:001A8E36p
		move.w	#$0040,d5
		move.w	#$0040,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A8EDA
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A8EDA
		move.b	RotationAndSize(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.s	loc_1A8ED6
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bls.w	loc_1A8EC0
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8EC0:					  ; CODE XREF: sub_1A8E5A+4Cj
						  ; ROM:001A901Cj
		move.b	#$21,ChestIndex(a5)
		move.w	#$0018,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8ED6:					  ; CODE XREF: sub_1A8E5A+3Cj
		bsr.w	EnemyAI_Unicorn2

loc_1A8EDA:					  ; CODE XREF: sub_1A8E5A+10j
						  ; sub_1A8E5A+22j
		tst.b	d0
		rts
; End of function sub_1A8E5A


; =============== S U B	R O U T	I N E =======================================


sub_1A8EDE:					  ; CODE XREF: ROM:001A8E3Ap
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A8F44
		move.b	RotationAndSize(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.s	loc_1A8F44
		move.b	(Player_AnimAction).l,d0
		andi.b	#$07,d0
		beq.w	loc_1A8F48
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bhi.s	loc_1A8F44
		bset	#$01,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.b	#$22,ChestIndex(a5)
		move.w	#$0017,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8F44:					  ; CODE XREF: sub_1A8EDE+10j
						  ; sub_1A8EDE+2Aj ...
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1A8F48:					  ; CODE XREF: sub_1A8EDE+36j
		move.b	#$23,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; End of function sub_1A8EDE


; =============== S U B	R O U T	I N E =======================================


sub_1A8F5E:					  ; CODE XREF: ROM:001A8E40p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A8F86
		move.b	#$24,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A8F86:					  ; CODE XREF: sub_1A8F5E+10j
		tst.b	d0
		rts
; End of function sub_1A8F5E

; ---------------------------------------------------------------------------

loc_1A8F8A:					  ; CODE XREF: ROM:001A8DCEj
		andi.b	#$0F,d0
		beq.s	loc_1A8FAC
		cmpi.b	#$01,d0
		beq.w	loc_1A9034
		cmpi.b	#$02,d0
		beq.w	loc_1A9066
		cmpi.b	#$03,d0
		beq.w	loc_1A903A
		bra.w	loc_1A903A
; ---------------------------------------------------------------------------

loc_1A8FAC:					  ; CODE XREF: ROM:001A8F8Ej
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0040,d5
		move.w	#$0040,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcc.w	EnemyAI_Unicorn2
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.w	EnemyAI_Unicorn2
		move.b	RotationAndSize(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.w	EnemyAI_Unicorn2
		addq.b	#$01,Unk0D(a5)
		move.b	Unk0D(a5),d0
		andi.b	#$0F,d0
		bne.s	loc_1A9020
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcs.w	loc_1A8EC0

loc_1A9020:					  ; CODE XREF: ROM:001A900Cj
		move.b	Unk0D(a5),d0
		andi.w	#$0010,d0
		lsl.w	#$04,d0
		addi.w	#$0300,d0
		move.w	d0,QueuedAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A9034:					  ; CODE XREF: ROM:001A8F94j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A903A:					  ; CODE XREF: ROM:001A8FA4j
						  ; ROM:001A8FA8j
		addq.b	#$01,Unk0D(a5)
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0100,QueuedAction(a5)
		cmpi.b	#$10,Unk0D(a5)
		bcs.s	loc_1A9060
		bra.w	EnemyAI_Unicorn2
; ---------------------------------------------------------------------------

loc_1A9060:					  ; CODE XREF: ROM:001A905Aj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A9066:					  ; CODE XREF: ROM:001A8F9Cj
		bset	#$01,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bsr.w	j_j_OnTick
		rts
