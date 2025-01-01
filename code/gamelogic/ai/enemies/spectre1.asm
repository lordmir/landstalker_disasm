; ---------------------------------------------------------------------------

EnemyAI_Spectre1_B:				  ; CODE XREF: ROM:001A8652j
		bra.s	EnemyAI_Spectre1
; ---------------------------------------------------------------------------

EnemyAI_Spectre1_A:				  ; CODE XREF: ROM:001A864Ej
		bset	#$07,FallRate(a5)
		btst	#$01,Flags2(a5)
		bne.s	loc_1AD324
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AD32A
		cmpi.b	#$10,d0
		beq.s	loc_1AD356
		bra.w	loc_1AD4C6
; ---------------------------------------------------------------------------

loc_1AD324:					  ; CODE XREF: ROM:001AD312j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AD32A:					  ; CODE XREF: ROM:001AD318j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Spectre1
		rts
; ---------------------------------------------------------------------------

EnemyAI_Spectre1:				  ; CODE XREF: ROM:EnemyAI_Spectre1_Bj
						  ; ROM:001AD34Ej ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AD356:					  ; CODE XREF: ROM:001AD31Ej
		tst.b	(byte_FF1142).l
		bne.s	loc_1AD3A2
		btst	#$06,Flags2(a5)
		beq.s	loc_1AD37A
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$1E,Unk4D(a5)
		bcs.s	loc_1AD39C
		subq.b	#$01,Unk4D(a5)
		bsr.w	sub_1AD4A4

loc_1AD37A:					  ; CODE XREF: ROM:001AD364j
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1AD3A6
		bcs.s	loc_1AD39C
		bsr.s	sub_1AD3E8
		bcs.s	loc_1AD39C
		bsr.w	sub_1AD41A
		bcs.s	loc_1AD39C
		bsr.w	sub_1AD460

loc_1AD39C:					  ; CODE XREF: ROM:001AD370j
						  ; ROM:001AD38Cj ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AD3A2:					  ; CODE XREF: ROM:001AD35Cj
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AD3A6:					  ; CODE XREF: ROM:001AD38Ap
		move.w	#$0070,d5
		move.w	#$0030,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD3E4
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#$0008,d7
		bhi.s	loc_1AD3E4
		bset	#$06,Flags2(a5)
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD3E4:					  ; CODE XREF: sub_1AD3A6+10j
						  ; sub_1AD3A6+20j
		tst.b	d0
		rts
; End of function sub_1AD3A6


; =============== S U B	R O U T	I N E =======================================


sub_1AD3E8:					  ; CODE XREF: ROM:001AD38Ep
		move.w	#$0060,d5
		move.w	#$0000,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD416
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00006,d7
		bhi.s	loc_1AD416
		bsr.w	sub_1AD4A4
		bcc.s	loc_1AD416
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD416:					  ; CODE XREF: sub_1AD3E8+10j
						  ; sub_1AD3E8+20j ...
		tst.b	d0
		rts
; End of function sub_1AD3E8


; =============== S U B	R O U T	I N E =======================================


sub_1AD41A:					  ; CODE XREF: ROM:001AD392p
		move.w	#$0060,d5
		move.w	#$0048,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD45C
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	loc_1AD45C
		bsr.w	sub_1AD4A4
		bcc.s	loc_1AD45C
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD45C:					  ; CODE XREF: sub_1AD41A+10j
						  ; sub_1AD41A+20j ...
		tst.b	d0
		rts
; End of function sub_1AD41A


; =============== S U B	R O U T	I N E =======================================


sub_1AD460:					  ; CODE XREF: ROM:001AD398p
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD4A0
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00080,d7
		bcc.s	loc_1AD4A0
		bsr.s	sub_1AD4A4
		bcc.s	loc_1AD4A0
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD4A0:					  ; CODE XREF: sub_1AD460+10j
						  ; sub_1AD460+20j ...
		tst.b	d0
		rts
; End of function sub_1AD460


; =============== S U B	R O U T	I N E =======================================


sub_1AD4A4:					  ; CODE XREF: ROM:001AD376p
						  ; sub_1AD3E8+22p ...
		btst	#$06,Flags2(a5)
		beq.s	loc_1AD4BA
		move.w	#$000F,d1
		bsr.w	sub_1AE944
		bcs.s	loc_1AD4BA
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1AD4BA:					  ; CODE XREF: sub_1AD4A4+6j
						  ; sub_1AD4A4+10j
		bclr	#$06,Flags2(a5)
		ori	#$01,ccr
		rts
; End of function sub_1AD4A4

; ---------------------------------------------------------------------------

loc_1AD4C6:					  ; CODE XREF: ROM:001AD320j
		andi.b	#$0F,d0
		beq.s	loc_1AD4E0
		cmpi.b	#$01,d0
		beq.s	loc_1AD4E0
		cmpi.b	#$02,d0
		beq.s	loc_1AD4E0
		cmpi.b	#$03,d0
		beq.s	loc_1AD554
		bra.s	loc_1AD554
; ---------------------------------------------------------------------------

loc_1AD4E0:					  ; CODE XREF: ROM:001AD4CAj
						  ; ROM:001AD4D0j ...
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$01,Unk4D(a5)
		bne.s	loc_1AD502
		move.w	#$0300,QueuedAction(a5)
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1AD502:					  ; CODE XREF: ROM:001AD4EAj
		cmpi.b	#$02,Unk4D(a5)
		bne.w	loc_1AD514
		move.b	#$01,d0
		bra.w	LoadProjectilePalette
; ---------------------------------------------------------------------------

loc_1AD514:					  ; CODE XREF: ROM:001AD508j
		cmpi.b	#$2D,Unk4D(a5)
		bhi.w	loc_1AD53A
		bcs.w	locret_1AD54A
		move.w	#$0200,QueuedAction(a5)
		move.b	#$01,d0
		move.w	#$0300,d1
		bsr.w	sub_1AC474
		bcs.w	loc_1AD54C
		rts
; ---------------------------------------------------------------------------

loc_1AD53A:					  ; CODE XREF: ROM:001AD51Aj
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$46,Unk4D(a5)
		beq.w	loc_1AD54C

locret_1AD54A:					  ; CODE XREF: ROM:001AD51Ej
		rts
; ---------------------------------------------------------------------------

loc_1AD54C:					  ; CODE XREF: ROM:001AD534j
						  ; ROM:001AD546j
		clr.b	Unk4D(a5)
		bra.w	EnemyAI_Spectre1
; ---------------------------------------------------------------------------

loc_1AD554:					  ; CODE XREF: ROM:001AD4DCj
						  ; ROM:001AD4DEj
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	locret_1AD588
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1AD588
		beq.w	EnemyAI_Spectre1

locret_1AD588:					  ; CODE XREF: ROM:001AD564j
						  ; ROM:001AD582j
		rts
