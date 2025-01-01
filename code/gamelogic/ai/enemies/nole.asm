; ---------------------------------------------------------------------------

EnemyAI_Nole_B:					  ; CODE XREF: ROM:001A86A2j
		bra.s	EnemyAI_Nole
; ---------------------------------------------------------------------------

EnemyAI_Nole_A:					  ; CODE XREF: ROM:001A869Ej
		btst	#$01,Flags2(a5)
		bne.s	loc_1AE896
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AE89C
		cmpi.b	#$10,d0
		beq.s	loc_1AE8CE
		bra.w	loc_1AEAE4
; ---------------------------------------------------------------------------

loc_1AE896:					  ; CODE XREF: ROM:001AE884j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AE89C:					  ; CODE XREF: ROM:001AE88Aj
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		move.w	#$0060,d5
		move.w	#$0020,d6
		move.w	#$0030,d7
		bsr.w	sub_1A8964
		bcs.s	sub_1AE8CA
		rts
; ---------------------------------------------------------------------------

EnemyAI_Nole:					  ; CODE XREF: ROM:EnemyAI_Nole_Bj
		bsr.s	sub_1AE8CA
		bra.w	loc_1AE9FE

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

sub_1AE8CA:					  ; CODE XREF: ROM:001AE8C0j
						  ; ROM:EnemyAI_Nolep ...
		bra.w	loc_1A8AB6
; End of function sub_1AE8CA

; ---------------------------------------------------------------------------

loc_1AE8CE:					  ; CODE XREF: ROM:001AE890j
		btst	#$06,Flags2(a5)
		beq.s	loc_1AE8E6
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$1E,Unk4D(a5)
		bcs.s	loc_1AE912
		subq.b	#$01,Unk4D(a5)

loc_1AE8E6:					  ; CODE XREF: ROM:001AE8D4j
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.w	sub_1AE91C
		bcs.s	loc_1AE912
		bsr.w	sub_1AE9EE
		bcs.s	loc_1AE912
		bsr.w	sub_1AEA1C
		bcs.s	loc_1AE912
		bsr.w	sub_1AEA64
		bcs.s	loc_1AE912
		bsr.w	sub_1AEAAC

loc_1AE912:					  ; CODE XREF: ROM:001AE8E0j
						  ; ROM:001AE8FAj ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------
		bra.w	loc_1A8AA6

; =============== S U B	R O U T	I N E =======================================


sub_1AE91C:					  ; CODE XREF: ROM:001AE8F6p

; FUNCTION CHUNK AT 001AE9D4 SIZE 0000001A BYTES

		btst	#$06,Flags2(a5)
		beq.w	loc_1AE9CA
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00030,d7
		bhi.w	loc_1AE9CA
		move.w	#$001F,d1
		bsr.s	sub_1AE944
		bcs.w	loc_1AE9D4
		rts
; End of function sub_1AE91C


; =============== S U B	R O U T	I N E =======================================


sub_1AE944:					  ; CODE XREF: sub_1AD4A4+Cp
						  ; sub_1AD72A+Cp ...
		movem.w	d1,-(sp)
		move.w	#00007,d6
		jsr	(j_GenerateRandomNumber).l
		addi.b	#$03,d7
		move.w	d7,d5
		move.w	#00002,d6
		jsr	(j_GenerateRandomNumber).l
		tst.b	d7
		beq.s	loc_1AE968
		neg.b	d5

loc_1AE968:					  ; CODE XREF: sub_1AE944+20j
		move.w	#00002,d6
		jsr	(j_GenerateRandomNumber).l
		tst.b	d7
		beq.s	loc_1AE988
		add.b	(Player_X).l,d5
		move.b	d5,X(a5)
		move.b	(Player_Y).l,Y(a5)
		bra.s	loc_1AE998
; ---------------------------------------------------------------------------

loc_1AE988:					  ; CODE XREF: sub_1AE944+30j
		add.b	(Player_Y).l,d5
		move.b	d5,Y(a5)
		move.b	(Player_X).l,X(a5)

loc_1AE998:					  ; CODE XREF: sub_1AE944+42j
		movea.l	a5,a1
		jsr	(sub_1A8AE6).l
		move.w	(Player_Z).l,d0
		move.w	d0,Z(a5)
		movem.w	(sp)+,d1
		add.w	d1,d0
		move.w	d0,HitBoxZEnd(a5)
		movea.l	a5,a1
		jsr	(sub_3BC).l
		bcc.s	loc_1AE9CE
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)

loc_1AE9CA:					  ; CODE XREF: sub_1AE91C+6j
						  ; sub_1AE91C+18j
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1AE9CE:					  ; CODE XREF: sub_1AE944+78j
		ori	#$01,ccr
		rts
; End of function sub_1AE944

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1AE91C

loc_1AE9D4:					  ; CODE XREF: sub_1AE91C+22j
		move.b	#$25,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; END OF FUNCTION CHUNK	FOR sub_1AE91C

; =============== S U B	R O U T	I N E =======================================


sub_1AE9EE:					  ; CODE XREF: ROM:001AE8FCp
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00001,d7
		bhi.s	loc_1AEA18

loc_1AE9FE:					  ; CODE XREF: ROM:001AE8C6j
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AEA18:					  ; CODE XREF: sub_1AE9EE+Ej
		tst.b	d0
		rts
; End of function sub_1AE9EE


; =============== S U B	R O U T	I N E =======================================


sub_1AEA1C:					  ; CODE XREF: ROM:001AE902p
		btst	#$06,Flags2(a5)
		bne.s	loc_1AEA60
		move.w	#$00A0,d5
		move.w	#$FFD8,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AEA60
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00300,d7
		bhi.s	loc_1AEA60
		move.b	#$21,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AEA60:					  ; CODE XREF: sub_1AEA1C+6j
						  ; sub_1AEA1C+18j ...
		tst.b	d0
		rts
; End of function sub_1AEA1C


; =============== S U B	R O U T	I N E =======================================


sub_1AEA64:					  ; CODE XREF: ROM:001AE908p
		btst	#$06,Flags2(a5)
		bne.s	loc_1AEAA8
		move.w	#$0048,d5
		move.w	#$0030,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AEAA8
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	loc_1AEAA8
		move.b	#$22,ChestIndex(a5)
		move.w	#$0012,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AEAA8:					  ; CODE XREF: sub_1AEA64+6j
						  ; sub_1AEA64+18j ...
		tst.b	d0
		rts
; End of function sub_1AEA64


; =============== S U B	R O U T	I N E =======================================


sub_1AEAAC:					  ; CODE XREF: ROM:001AE90Ep
		btst	#$06,Flags2(a5)
		bne.s	loc_1AEAE0
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AEAE0
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk0D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AEAE0:					  ; CODE XREF: sub_1AEAAC+6j
						  ; sub_1AEAAC+18j
		tst.b	d0
		rts
; End of function sub_1AEAAC

; ---------------------------------------------------------------------------

loc_1AEAE4:					  ; CODE XREF: ROM:001AE892j
		andi.b	#$0F,d0
		beq.s	loc_1AEB0C
		cmpi.b	#$01,d0
		beq.w	loc_1AEB8C
		cmpi.b	#$02,d0
		beq.w	loc_1AEBFC
		cmpi.b	#$03,d0
		beq.w	loc_1AEBFC
		cmpi.b	#$04,d0
		beq.w	loc_1AEBFC
		bra.s	loc_1AEB54
; ---------------------------------------------------------------------------

loc_1AEB0C:					  ; CODE XREF: ROM:001AEAE8j
		bset	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0500,QueuedAction(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$04,Unk4D(a5)
		bcs.s	locret_1AEB52
		move.w	#$0600,QueuedAction(a5)
		cmpi.b	#$08,Unk4D(a5)
		bcs.s	locret_1AEB52
		bset	#$06,Flags2(a5)
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)
		bset	#$07,FallRate(a5)
		clr.b	Unk4D(a5)
		bra.w	sub_1AE8CA
; ---------------------------------------------------------------------------

locret_1AEB52:					  ; CODE XREF: ROM:001AEB22j
						  ; ROM:001AEB30j
		rts
; ---------------------------------------------------------------------------

loc_1AEB54:					  ; CODE XREF: ROM:001AEB0Aj
		bclr	#$06,Flags2(a5)
		move.w	#$0600,QueuedAction(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$04,Unk4D(a5)
		bcs.s	locret_1AEB8A
		move.w	#$0500,QueuedAction(a5)
		cmpi.b	#$08,Unk4D(a5)
		bcs.s	locret_1AEB8A
		bclr	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bclr	#$07,FallRate(a5)
		bra.w	sub_1AE8CA
; ---------------------------------------------------------------------------

locret_1AEB8A:					  ; CODE XREF: ROM:001AEB6Aj
						  ; ROM:001AEB78j
		rts
; ---------------------------------------------------------------------------

loc_1AEB8C:					  ; CODE XREF: ROM:001AEAEEj
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$08,Unk4D(a5)
		bcs.s	locret_1AEBF2
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$10,Unk4D(a5)
		bcs.s	locret_1AEBF2
		move.w	#$0300,QueuedAction(a5)
		cmpi.b	#$18,Unk4D(a5)
		bhi.w	loc_1AEBE2
		bcs.w	locret_1AEBF2
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_GhostAbsorbHP
; ---------------------------------------------------------------------------
		move.b	#$02,d0
		move.w	#$1E00,d1
		bsr.w	SpawnSmallProjectile
		bcs.w	loc_1AEBF4
		move.w	#$24C0,TileSource(a1)
		move.b	#$08,Speed(a1)
		rts
; ---------------------------------------------------------------------------

loc_1AEBE2:					  ; CODE XREF: ROM:001AEBB8j
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$20,Unk4D(a5)
		beq.w	loc_1AEBF4

locret_1AEBF2:					  ; CODE XREF: ROM:001AEB9Cj
						  ; ROM:001AEBAAj ...
		rts
; ---------------------------------------------------------------------------

loc_1AEBF4:					  ; CODE XREF: ROM:001AEBD0j
						  ; ROM:001AEBEEj
		clr.b	Unk4D(a5)
		bra.w	sub_1AE8CA
; ---------------------------------------------------------------------------

loc_1AEBFC:					  ; CODE XREF: ROM:001AEAF6j
						  ; ROM:001AEAFEj ...
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk0D(a5)
		cmpi.b	#$08,Unk0D(a5)
		bcs.s	loc_1AEC52
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$10,Unk0D(a5)
		bcs.s	loc_1AEC52
		bhi.s	loc_1AEC22
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordSwing
; ---------------------------------------------------------------------------

loc_1AEC22:					  ; CODE XREF: ROM:001AEC1Cj
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0300,QueuedAction(a5)
		cmpi.b	#$18,Unk0D(a5)
		bcs.s	loc_1AEC52
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$20,Unk0D(a5)
		bcs.s	loc_1AEC52
		beq.w	sub_1AE8CA

loc_1AEC52:					  ; CODE XREF: ROM:001AEC0Cj
						  ; ROM:001AEC1Aj ...
		bsr.w	j_j_OnTick
		rts
