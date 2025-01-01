; ---------------------------------------------------------------------------

EnemyAI_Mir_B:					  ; CODE XREF: ROM:001A85EAj
		bra.s	EnemyAI_Mir
; ---------------------------------------------------------------------------

EnemyAI_Mir_A:					  ; CODE XREF: ROM:001A85E6j
		bset	#$00,Flags2(a5)
		bclr	#$01,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		btst	#$01,Flags2(a5)
		bne.w	loc_1ABFF2
		move.b	ChestIndex(a5),d0
		cmpi.b	#$10,d0
		bne.w	loc_1AC04E
		bra.s	loc_1ABF72
; ---------------------------------------------------------------------------

EnemyAI_Mir:					  ; CODE XREF: ROM:EnemyAI_Mir_Bj
						  ; ROM:001AC104j ...
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1ABF72:					  ; CODE XREF: ROM:001ABF58j
		bsr.w	sub_1AC010
		move.b	d2,d1
		movea.l	a5,a1
		bclr	#$00,Flags2(a5)
		jsr	(j_SetSpriteRotationAnimFlags).l
		bset	#$07,Unk48(a5)
		clr.b	Unk0A(a5)
		move.w	(Player_CentreX).l,d0
		subi.w	#$0070,d0
		move.w	CentreX(a5),d1
		sub.w	d0,d1
		cmpi.w	#$00E0,d1
		bcc.s	loc_1ABFF8
		move.w	(Player_CentreY).l,d0
		subi.w	#$0070,d0
		move.w	CentreY(a5),d2
		sub.w	d0,d2
		cmpi.w	#$00E0,d2
		bcc.s	loc_1ABFF8
		move.w	(Player_CentreX).l,d0
		subi.w	#$0060,d0
		move.w	CentreX(a5),d1
		sub.w	d0,d1
		cmpi.w	#$00C0,d1
		bcc.s	loc_1AC004
		move.w	(Player_CentreY).l,d0
		subi.w	#$0060,d0
		move.w	CentreY(a5),d2
		sub.w	d0,d2
		cmpi.w	#$00C0,d2
		bcc.s	loc_1AC004
		move.w	#$0266,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour

loc_1ABFF2:					  ; CODE XREF: ROM:001ABF48j
						  ; ROM:001AC002j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1ABFF8:					  ; CODE XREF: ROM:001ABFA4j
						  ; ROM:001ABFBAj
		move.w	#$0267,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bra.s	loc_1ABFF2
; ---------------------------------------------------------------------------

loc_1AC004:					  ; CODE XREF: ROM:001ABFD0j
						  ; ROM:001ABFE6j
		clr.b	Unk4D(a5)
		move.b	#$20,ChestIndex(a5)
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1AC010:					  ; CODE XREF: ROM:loc_1ABF72p
						  ; ROM:001AC054p ...
		move.w	CentreX(a5),d0
		sub.w	(Player_CentreX).l,d0
		move.w	CentreY(a5),d1
		sub.w	(Player_CentreY).l,d1
		movem.w	d0-d1,-(sp)
		add.w	d0,d1
		bpl.s	loc_1AC03E
		movem.w	(sp)+,d0-d1
		move.b	#$80,d2
		sub.w	d1,d0
		bpl.s	locret_1AC04C
		move.b	#$40,d2
		bra.s	locret_1AC04C
; ---------------------------------------------------------------------------

loc_1AC03E:					  ; CODE XREF: sub_1AC010+1Aj
		movem.w	(sp)+,d0-d1
		move.b	#$C0,d2
		sub.w	d1,d0
		bpl.s	locret_1AC04C
		clr.b	d2

locret_1AC04C:					  ; CODE XREF: sub_1AC010+26j
						  ; sub_1AC010+2Cj ...
		rts
; End of function sub_1AC010

; ---------------------------------------------------------------------------

loc_1AC04E:					  ; CODE XREF: ROM:001ABF54j
		bset	#$07,Unk48(a5)
		bsr.w	sub_1AC010
		move.b	d2,d1
		movea.l	a5,a1
		bclr	#$00,Flags2(a5)
		jsr	(j_SetSpriteRotationAnimFlags).l
		bset	#$00,Flags2(a5)
		andi.w	#$0004,AnimationIndex(a5)
		addi.w	#$0008,AnimationIndex(a5)
		move.b	#$01,Unk0A(a5)
		andi.b	#$BF,Flags2(a5)
		addq.b	#$01,Unk4D(a5)
		move.w	#$0000,AnimationFrame(a5)
		move.w	#$0100,QueuedAction(a5)
		cmpi.b	#$01,Unk4D(a5)
		bne.s	loc_1AC0AE
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1AC0AE:					  ; CODE XREF: ROM:001AC09Cj
		cmpi.b	#$02,Unk4D(a5)
		bne.w	loc_1AC0C0
		move.b	#$01,d0
		bra.w	LoadProjectilePalette
; ---------------------------------------------------------------------------

loc_1AC0C0:					  ; CODE XREF: ROM:001AC0B4j
		cmpi.b	#$0F,Unk4D(a5)
		bhi.w	loc_1AC108
		bcs.w	locret_1AC11E
		bsr.w	sub_1AC010
		move.b	RotationAndSize(a5),d0
		movem.w	d0,-(sp)
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d2,RotationAndSize(a5)
		move.b	#$01,d0
		move.w	#$0300,d1
		bsr.w	sub_1AC474
		bcs.s	loc_1AC0FC
		movem.w	(sp)+,d0
		move.b	d0,RotationAndSize(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AC0FC:					  ; CODE XREF: ROM:001AC0F0j
		movem.w	(sp)+,d0
		move.b	d0,RotationAndSize(a5)
		bra.w	EnemyAI_Mir
; ---------------------------------------------------------------------------

loc_1AC108:					  ; CODE XREF: ROM:001AC0C6j
		move.w	#$0004,AnimationFrame(a5)
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$1E,Unk4D(a5)
		beq.w	EnemyAI_Mir

locret_1AC11E:					  ; CODE XREF: ROM:001AC0CAj
		rts
