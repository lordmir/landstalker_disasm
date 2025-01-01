; ---------------------------------------------------------------------------

EnemyAI_Skeleton3_B:				  ; CODE XREF: ROM:001A857Aj
		bra.s	EnemyAI_Skeleton3
; ---------------------------------------------------------------------------

EnemyAI_Skeleton3_A:				  ; CODE XREF: ROM:001A8576j
		btst	#$01,Flags2(a5)
		bne.s	loc_1A989E
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A98AA
		cmpi.b	#$10,d0
		beq.s	loc_1A98F0
		bra.w	loc_1A9A46
; ---------------------------------------------------------------------------

loc_1A989E:					  ; CODE XREF: ROM:001A988Cj
		bclr	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A98AA:					  ; CODE XREF: ROM:001A9892j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Skeleton3
		rts
; ---------------------------------------------------------------------------

EnemyAI_Skeleton3:				  ; CODE XREF: ROM:EnemyAI_Skeleton3_Bj
						  ; ROM:001A98CEj ...
		bclr	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A98F0:					  ; CODE XREF: ROM:001A9898j
		tst.b	(byte_FF1142).l
		bne.s	loc_1A9920
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A9930
		bcs.s	loc_1A991A
		bsr.s	sub_1A996C
		bcs.s	loc_1A991A
		bsr.w	sub_1A99AC
		bcs.s	loc_1A991A
		bsr.w	sub_1A99EC

loc_1A991A:					  ; CODE XREF: ROM:001A990Aj
						  ; ROM:001A990Ej ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A9920:					  ; CODE XREF: ROM:001A98F6j
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A9930:					  ; CODE XREF: ROM:001A9908p
		move.w	#$0070,d5
		move.w	#$FFB0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A9968
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00086,d7
		bhi.s	loc_1A9968
		move.b	#$20,ChestIndex(a5)
		move.w	#$001A,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9968:					  ; CODE XREF: sub_1A9930+10j
						  ; sub_1A9930+20j
		tst.b	d0
		rts
; End of function sub_1A9930


; =============== S U B	R O U T	I N E =======================================


sub_1A996C:					  ; CODE XREF: ROM:001A990Cp
		move.w	#$0050,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A99A8
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00125,d7
		bhi.s	loc_1A99A8
		move.b	#$21,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A99A8:					  ; CODE XREF: sub_1A996C+10j
						  ; sub_1A996C+20j
		tst.b	d0
		rts
; End of function sub_1A996C


; =============== S U B	R O U T	I N E =======================================


sub_1A99AC:					  ; CODE XREF: ROM:001A9910p
		move.w	#$0030,d5
		move.w	#$FFE0,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A99E8
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00043,d7
		bhi.s	loc_1A99E8
		move.b	#$22,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A99E8:					  ; CODE XREF: sub_1A99AC+10j
						  ; sub_1A99AC+20j
		tst.b	d0
		rts
; End of function sub_1A99AC


; =============== S U B	R O U T	I N E =======================================


sub_1A99EC:					  ; CODE XREF: ROM:001A9916p
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A9A42
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.s	loc_1A9A28
		move.b	#$23,ChestIndex(a5)
		move.w	#$0012,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9A28:					  ; CODE XREF: sub_1A99EC+20j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9A42:					  ; CODE XREF: sub_1A99EC+10j
		tst.b	d0
		rts
; End of function sub_1A99EC

; ---------------------------------------------------------------------------

loc_1A9A46:					  ; CODE XREF: ROM:001A989Aj
		andi.b	#$0F,d0
		beq.s	loc_1A9A66
		cmpi.b	#$01,d0
		beq.s	loc_1A9A8A
		cmpi.b	#$02,d0
		beq.w	loc_1A9AE0
		cmpi.b	#$03,d0
		beq.w	loc_1A9AA6
		bra.w	loc_1A9AA6
; ---------------------------------------------------------------------------

loc_1A9A66:					  ; CODE XREF: ROM:001A9A4Aj
		cmpi.b	#$18,BehavParam(a5)
		bcc.s	loc_1A9A84
		move.w	#$0300,QueuedAction(a5)
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C

loc_1A9A84:					  ; CODE XREF: ROM:001A9A6Cj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A9A8A:					  ; CODE XREF: ROM:001A9A50j
		bset	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0400,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$28,Unk0D(a5)
		bcc.w	EnemyAI_Skeleton3
		rts
; ---------------------------------------------------------------------------

loc_1A9AA6:					  ; CODE XREF: ROM:001A9A5Ej
						  ; ROM:001A9A62j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1A9ADA
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	loc_1A9ADA
		beq.w	EnemyAI_Skeleton3

loc_1A9ADA:					  ; CODE XREF: ROM:001A9AB6j
						  ; ROM:001A9AD4j ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A9AE0:					  ; CODE XREF: ROM:001A9A56j
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0300,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	loc_1A9ADA
		bra.w	EnemyAI_Skeleton3
