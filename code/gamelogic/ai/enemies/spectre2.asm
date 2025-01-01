; ---------------------------------------------------------------------------

EnemyAI_Spectre2_B:				  ; CODE XREF: ROM:001A865Aj
		bra.s	EnemyAI_Spectre2
; ---------------------------------------------------------------------------

EnemyAI_Spectre2_A:				  ; CODE XREF: ROM:001A8656j
		bset	#$07,FallRate(a5)
		btst	#$01,Flags2(a5)
		bne.s	loc_1AD5AA
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AD5B0
		cmpi.b	#$10,d0
		beq.s	loc_1AD5DC
		bra.w	loc_1AD74C
; ---------------------------------------------------------------------------

loc_1AD5AA:					  ; CODE XREF: ROM:001AD598j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AD5B0:					  ; CODE XREF: ROM:001AD59Ej
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Spectre2
		rts
; ---------------------------------------------------------------------------

EnemyAI_Spectre2:				  ; CODE XREF: ROM:EnemyAI_Spectre2_Bj
						  ; ROM:001AD5D4j ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AD5DC:					  ; CODE XREF: ROM:001AD5A4j
		tst.b	(byte_FF1142).l
		bne.s	loc_1AD628
		btst	#$06,Flags2(a5)
		beq.s	loc_1AD600
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$1E,Unk4D(a5)
		bcs.s	loc_1AD622
		subq.b	#$01,Unk4D(a5)
		bsr.w	sub_1AD72A

loc_1AD600:					  ; CODE XREF: ROM:001AD5EAj
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1AD62C
		bcs.s	loc_1AD622
		bsr.s	sub_1AD66E
		bcs.s	loc_1AD622
		bsr.w	sub_1AD6A0
		bcs.s	loc_1AD622
		bsr.w	sub_1AD6E6

loc_1AD622:					  ; CODE XREF: ROM:001AD5F6j
						  ; ROM:001AD612j ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AD628:					  ; CODE XREF: ROM:001AD5E2j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AD62C:					  ; CODE XREF: ROM:001AD610p
		move.w	#$0070,d5
		move.w	#$0030,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD66A
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	loc_1AD66A
		bset	#$06,Flags2(a5)
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD66A:					  ; CODE XREF: sub_1AD62C+10j
						  ; sub_1AD62C+20j
		tst.b	d0
		rts
; End of function sub_1AD62C


; =============== S U B	R O U T	I N E =======================================


sub_1AD66E:					  ; CODE XREF: ROM:001AD614p
		move.w	#$0060,d5
		move.w	#$0000,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD69C
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00006,d7
		bhi.s	loc_1AD69C
		bsr.w	sub_1AD72A
		bcc.s	loc_1AD69C
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD69C:					  ; CODE XREF: sub_1AD66E+10j
						  ; sub_1AD66E+20j ...
		tst.b	d0
		rts
; End of function sub_1AD66E


; =============== S U B	R O U T	I N E =======================================


sub_1AD6A0:					  ; CODE XREF: ROM:001AD618p
		move.w	#$0060,d5
		move.w	#$0048,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD6E2
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00016,d7
		bhi.s	loc_1AD6E2
		bsr.w	sub_1AD72A
		bcc.s	loc_1AD6E2
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD6E2:					  ; CODE XREF: sub_1AD6A0+10j
						  ; sub_1AD6A0+20j ...
		tst.b	d0
		rts
; End of function sub_1AD6A0


; =============== S U B	R O U T	I N E =======================================


sub_1AD6E6:					  ; CODE XREF: ROM:001AD61Ep
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD726
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00080,d7
		bcc.s	loc_1AD726
		bsr.s	sub_1AD72A
		bcc.s	loc_1AD726
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD726:					  ; CODE XREF: sub_1AD6E6+10j
						  ; sub_1AD6E6+20j ...
		tst.b	d0
		rts
; End of function sub_1AD6E6


; =============== S U B	R O U T	I N E =======================================


sub_1AD72A:					  ; CODE XREF: ROM:001AD5FCp
						  ; sub_1AD66E+22p ...
		btst	#$06,Flags2(a5)
		beq.s	loc_1AD740
		move.w	#$000F,d1
		bsr.w	sub_1AE944
		bcs.s	loc_1AD740
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1AD740:					  ; CODE XREF: sub_1AD72A+6j
						  ; sub_1AD72A+10j
		bclr	#$06,Flags2(a5)
		ori	#$01,ccr
		rts
; End of function sub_1AD72A

; ---------------------------------------------------------------------------

loc_1AD74C:					  ; CODE XREF: ROM:001AD5A6j
		andi.b	#$0F,d0
		beq.s	loc_1AD766
		cmpi.b	#$01,d0
		beq.s	loc_1AD766
		cmpi.b	#$02,d0
		beq.s	loc_1AD766
		cmpi.b	#$03,d0
		beq.s	loc_1AD7DA
		bra.s	loc_1AD7DA
; ---------------------------------------------------------------------------

loc_1AD766:					  ; CODE XREF: ROM:001AD750j
						  ; ROM:001AD756j ...
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$01,Unk4D(a5)
		bne.s	loc_1AD788
		move.w	#$0300,QueuedAction(a5)
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1AD788:					  ; CODE XREF: ROM:001AD770j
		cmpi.b	#$02,Unk4D(a5)
		bne.w	loc_1AD79A
		move.b	#$01,d0
		bra.w	LoadProjectilePalette
; ---------------------------------------------------------------------------

loc_1AD79A:					  ; CODE XREF: ROM:001AD78Ej
		cmpi.b	#$2D,Unk4D(a5)
		bhi.w	loc_1AD7C0
		bcs.w	locret_1AD7D0
		move.w	#$0200,QueuedAction(a5)
		move.b	#$01,d0
		move.w	#$0500,d1
		bsr.w	SpawnSmallProjectile
		bcs.w	loc_1AD7D2
		rts
; ---------------------------------------------------------------------------

loc_1AD7C0:					  ; CODE XREF: ROM:001AD7A0j
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$46,Unk4D(a5)
		beq.w	loc_1AD7D2

locret_1AD7D0:					  ; CODE XREF: ROM:001AD7A4j
		rts
; ---------------------------------------------------------------------------

loc_1AD7D2:					  ; CODE XREF: ROM:001AD7BAj
						  ; ROM:001AD7CCj
		clr.b	Unk4D(a5)
		bra.w	EnemyAI_Spectre2
; ---------------------------------------------------------------------------

loc_1AD7DA:					  ; CODE XREF: ROM:001AD762j
						  ; ROM:001AD764j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	locret_1AD80E
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1AD80E
		beq.w	EnemyAI_Spectre2

locret_1AD80E:					  ; CODE XREF: ROM:001AD7EAj
						  ; ROM:001AD808j
		rts
