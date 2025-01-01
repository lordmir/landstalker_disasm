; ---------------------------------------------------------------------------

EnemyAI_Unicorn3_B:				  ; CODE XREF: ROM:001A8562j
		bra.s	EnemyAI_Unicorn3
; ---------------------------------------------------------------------------

EnemyAI_Unicorn3_A:				  ; CODE XREF: ROM:001A855Ej
		bclr	#$01,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		btst	#$01,Flags2(a5)
		bne.s	loc_1A9092
		move.b	ChestIndex(a5),d0
		beq.s	loc_1A9098
		cmpi.b	#$10,d0
		beq.s	loc_1A90DE
		bra.w	loc_1A924A
; ---------------------------------------------------------------------------

loc_1A9092:					  ; CODE XREF: ROM:001A9080j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A9098:					  ; CODE XREF: ROM:001A9086j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0030,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Unicorn3
		rts

; =============== S U B	R O U T	I N E =======================================


EnemyAI_Unicorn3:				  ; CODE XREF: ROM:EnemyAI_Unicorn3_Bj
						  ; ROM:001A90BCj ...
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		bclr	#$01,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		rts
; End of function EnemyAI_Unicorn3

; ---------------------------------------------------------------------------

loc_1A90DE:					  ; CODE XREF: ROM:001A908Cj
		tst.b	(byte_FF1142).l
		bne.s	loc_1A910A
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1A911A
		bcs.s	loc_1A9104
		bsr.w	sub_1A919E
		bcs.s	loc_1A9104
		bsr.w	sub_1A921E

loc_1A9104:					  ; CODE XREF: ROM:001A90F8j
						  ; ROM:001A90FEj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A910A:					  ; CODE XREF: ROM:001A90E4j
		move.w	#$0006,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A911A:					  ; CODE XREF: ROM:001A90F6p
		move.w	#$0040,d5
		move.w	#$0040,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A919A
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	loc_1A919A
		move.b	RotationAndSize(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.s	loc_1A9196
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00030,d7
		bls.w	loc_1A9180
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9180:					  ; CODE XREF: sub_1A911A+4Cj
						  ; ROM:001A92DCj
		move.b	#$21,ChestIndex(a5)
		move.w	#$0018,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9196:					  ; CODE XREF: sub_1A911A+3Cj
		bsr.w	EnemyAI_Unicorn3

loc_1A919A:					  ; CODE XREF: sub_1A911A+10j
						  ; sub_1A911A+22j
		tst.b	d0
		rts
; End of function sub_1A911A


; =============== S U B	R O U T	I N E =======================================


sub_1A919E:					  ; CODE XREF: ROM:001A90FAp
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A9204
		move.b	RotationAndSize(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.s	loc_1A9204
		move.b	(Player_AnimAction).l,d0
		andi.b	#$07,d0
		beq.w	loc_1A9208
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0050,d7
		bhi.s	loc_1A9204
		bset	#$01,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.b	#$22,ChestIndex(a5)
		move.w	#$0017,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9204:					  ; CODE XREF: sub_1A919E+10j
						  ; sub_1A919E+2Aj ...
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1A9208:					  ; CODE XREF: sub_1A919E+36j
		move.b	#$23,ChestIndex(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; End of function sub_1A919E


; =============== S U B	R O U T	I N E =======================================


sub_1A921E:					  ; CODE XREF: ROM:001A9100p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1A9246
		move.b	#$24,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A9246:					  ; CODE XREF: sub_1A921E+10j
		tst.b	d0
		rts
; End of function sub_1A921E

; ---------------------------------------------------------------------------

loc_1A924A:					  ; CODE XREF: ROM:001A908Ej
		andi.b	#$0F,d0
		beq.s	loc_1A926C
		cmpi.b	#$01,d0
		beq.w	loc_1A92F4
		cmpi.b	#$02,d0
		beq.w	loc_1A9326
		cmpi.b	#$03,d0
		beq.w	loc_1A92FA
		bra.w	loc_1A92FA
; ---------------------------------------------------------------------------

loc_1A926C:					  ; CODE XREF: ROM:001A924Ej
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0040,d5
		move.w	#$0040,d6
		move.w	#$0040,d7
		bsr.w	sub_1A8964
		bcc.w	EnemyAI_Unicorn3
		move.w	#$0030,d5
		move.w	#$0030,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.w	EnemyAI_Unicorn3
		move.b	RotationAndSize(a5),d0
		andi.b	#$C0,d0
		eori.b	#$80,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		cmp.b	d0,d1
		bne.w	EnemyAI_Unicorn3
		addq.b	#$01,Unk0D(a5)
		move.b	Unk0D(a5),d0
		andi.b	#$0F,d0
		bne.s	loc_1A92E0
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00030,d7
		bcs.w	loc_1A9180

loc_1A92E0:					  ; CODE XREF: ROM:001A92CCj
		move.b	Unk0D(a5),d0
		andi.w	#$0010,d0
		lsl.w	#$04,d0
		addi.w	#$0200,d0
		move.w	d0,QueuedAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A92F4:					  ; CODE XREF: ROM:001A9254j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A92FA:					  ; CODE XREF: ROM:001A9264j
						  ; ROM:001A9268j
		addq.b	#$01,Unk0D(a5)
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0100,QueuedAction(a5)
		cmpi.b	#$10,Unk0D(a5)
		bcs.s	loc_1A9320
		bra.w	EnemyAI_Unicorn3
; ---------------------------------------------------------------------------

loc_1A9320:					  ; CODE XREF: ROM:001A931Aj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A9326:					  ; CODE XREF: ROM:001A925Cj
		bset	#$01,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bsr.w	j_j_OnTick
		rts
