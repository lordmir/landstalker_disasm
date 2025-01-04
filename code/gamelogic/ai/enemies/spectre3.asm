; ---------------------------------------------------------------------------

EnemyAI_Spectre3_B:				  ; CODE XREF: ROM:001A8662j
		bra.s	EnemyAI_Spectre3
; ---------------------------------------------------------------------------

EnemyAI_Spectre3_A:				  ; CODE XREF: ROM:001A865Ej
		bset	#$07,FallRate(a5)
		btst	#$01,Flags2(a5)
		bne.s	loc_1AD830
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AD836
		cmpi.b	#$10,d0
		beq.s	loc_1AD862
		bra.w	loc_1AD9D2
; ---------------------------------------------------------------------------

loc_1AD830:					  ; CODE XREF: ROM:001AD81Ej
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AD836:					  ; CODE XREF: ROM:001AD824j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	EnemyAI_Spectre3
		rts
; ---------------------------------------------------------------------------

EnemyAI_Spectre3:				  ; CODE XREF: ROM:EnemyAI_Spectre3_Bj
						  ; ROM:001AD85Aj ...
		bra.w	loc_1A8AB6
; ---------------------------------------------------------------------------

loc_1AD862:					  ; CODE XREF: ROM:001AD82Aj
		tst.b	(byte_FF1142).l
		bne.s	loc_1AD8AE
		btst	#$06,Flags2(a5)
		beq.s	loc_1AD886
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$1E,Unk4D(a5)
		bcs.s	loc_1AD8A8
		subq.b	#$01,Unk4D(a5)
		bsr.w	sub_1AD9B0

loc_1AD886:					  ; CODE XREF: ROM:001AD870j
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1AD8B2
		bcs.s	loc_1AD8A8
		bsr.s	sub_1AD8F4
		bcs.s	loc_1AD8A8
		bsr.w	sub_1AD926
		bcs.s	loc_1AD8A8
		bsr.w	sub_1AD96C

loc_1AD8A8:					  ; CODE XREF: ROM:001AD87Cj
						  ; ROM:001AD898j ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AD8AE:					  ; CODE XREF: ROM:001AD868j
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AD8B2:					  ; CODE XREF: ROM:001AD896p
		move.w	#$0070,d5
		move.w	#$0030,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD8F0
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00032,d7
		bhi.s	loc_1AD8F0
		bset	#$06,Flags2(a5)
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD8F0:					  ; CODE XREF: sub_1AD8B2+10j
						  ; sub_1AD8B2+20j
		tst.b	d0
		rts
; End of function sub_1AD8B2


; =============== S U B	R O U T	I N E =======================================


sub_1AD8F4:					  ; CODE XREF: ROM:001AD89Ap
		move.w	#$0060,d5
		move.w	#$0000,d6
		move.w	#$0020,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD922
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00006,d7
		bhi.s	loc_1AD922
		bsr.w	sub_1AD9B0
		bcc.s	loc_1AD922
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD922:					  ; CODE XREF: sub_1AD8F4+10j
						  ; sub_1AD8F4+20j ...
		tst.b	d0
		rts
; End of function sub_1AD8F4


; =============== S U B	R O U T	I N E =======================================


sub_1AD926:					  ; CODE XREF: ROM:001AD89Ep
		move.w	#$0060,d5
		move.w	#$0048,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD968
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	loc_1AD968
		bsr.w	sub_1AD9B0
		bcc.s	loc_1AD968
		move.b	#$22,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD968:					  ; CODE XREF: sub_1AD926+10j
						  ; sub_1AD926+20j ...
		tst.b	d0
		rts
; End of function sub_1AD926


; =============== S U B	R O U T	I N E =======================================


sub_1AD96C:					  ; CODE XREF: ROM:001AD8A4p
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AD9AC
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00080,d7
		bcc.s	loc_1AD9AC
		bsr.s	sub_1AD9B0
		bcc.s	loc_1AD9AC
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AD9AC:					  ; CODE XREF: sub_1AD96C+10j
						  ; sub_1AD96C+20j ...
		tst.b	d0
		rts
; End of function sub_1AD96C


; =============== S U B	R O U T	I N E =======================================


sub_1AD9B0:					  ; CODE XREF: ROM:001AD882p
						  ; sub_1AD8F4+22p ...
		btst	#$06,Flags2(a5)
		beq.s	loc_1AD9C6
		move.w	#$000F,d1
		bsr.w	sub_1AE944
		bcs.s	loc_1AD9C6
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1AD9C6:					  ; CODE XREF: sub_1AD9B0+6j
						  ; sub_1AD9B0+10j
		bclr	#$06,Flags2(a5)
		ori	#$01,ccr
		rts
; End of function sub_1AD9B0

; ---------------------------------------------------------------------------

loc_1AD9D2:					  ; CODE XREF: ROM:001AD82Cj
		andi.b	#$0F,d0
		beq.s	loc_1AD9EC
		cmpi.b	#$01,d0
		beq.s	loc_1AD9EC
		cmpi.b	#$02,d0
		beq.s	loc_1AD9EC
		cmpi.b	#$03,d0
		beq.s	loc_1ADA60
		bra.s	loc_1ADA60
; ---------------------------------------------------------------------------

loc_1AD9EC:					  ; CODE XREF: ROM:001AD9D6j
						  ; ROM:001AD9DCj ...
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$01,Unk4D(a5)
		bne.s	loc_1ADA0E
		move.w	#$0300,QueuedAction(a5)
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1ADA0E:					  ; CODE XREF: ROM:001AD9F6j
		cmpi.b	#$02,Unk4D(a5)
		bne.w	loc_1ADA20
		move.b	#$01,d0
		bra.w	LoadProjectilePalette
; ---------------------------------------------------------------------------

loc_1ADA20:					  ; CODE XREF: ROM:001ADA14j
		cmpi.b	#$2D,Unk4D(a5)
		bhi.w	loc_1ADA46
		bcs.w	locret_1ADA56
		move.w	#$0200,QueuedAction(a5)
		move.b	#$01,d0
		move.w	#$0700,d1
		bsr.w	SpawnSmallProjectile
		bcs.w	loc_1ADA58
		rts
; ---------------------------------------------------------------------------

loc_1ADA46:					  ; CODE XREF: ROM:001ADA26j
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$46,Unk4D(a5)
		beq.w	loc_1ADA58

locret_1ADA56:					  ; CODE XREF: ROM:001ADA2Aj
		rts
; ---------------------------------------------------------------------------

loc_1ADA58:					  ; CODE XREF: ROM:001ADA40j
						  ; ROM:001ADA52j
		clr.b	Unk4D(a5)
		bra.w	EnemyAI_Spectre3
; ---------------------------------------------------------------------------

loc_1ADA60:					  ; CODE XREF: ROM:001AD9E8j
						  ; ROM:001AD9EAj
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$0F,Unk0D(a5)
		bcs.s	locret_1ADA94
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk0D(a5)
		bcs.s	locret_1ADA94
		beq.w	EnemyAI_Spectre3

locret_1ADA94:					  ; CODE XREF: ROM:001ADA70j
						  ; ROM:001ADA8Ej
		rts
