; ---------------------------------------------------------------------------

EnemyAI_Spinner_B:				  ; CODE XREF: ROM:001A8682j
						  ; ROM:001A86CAj
		bra.s	EnemyAI_Spinner
; ---------------------------------------------------------------------------

EnemyAI_Spinner_A:				  ; CODE XREF: ROM:001A867Ej
						  ; ROM:001A86C6j
		btst	#$01,Flags2(a5)
		bne.s	loc_1AE156
		move.b	ChestIndex(a5),d0
		cmpi.b	#$10,d0
		beq.s	loc_1AE180
		bra.w	loc_1AE2DC
; ---------------------------------------------------------------------------

loc_1AE156:					  ; CODE XREF: ROM:001AE146j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

EnemyAI_Spinner:				  ; CODE XREF: ROM:EnemyAI_Spinner_Bj
						  ; ROM:001AE394j
		bclr	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bclr	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0180,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AE180:					  ; CODE XREF: ROM:001AE150j
		bclr	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	CentreX(a5),(word_FF1800).l
		move.w	CentreY(a5),(dword_FF1804).l
		bsr.s	sub_1AE1B4
		bcs.s	loc_1AE1AE
		bsr.s	sub_1AE1F4
		bcs.s	loc_1AE1AE
		bsr.w	sub_1AE234
		bcs.s	loc_1AE1AE
		bsr.w	sub_1AE274
		bcs.s	loc_1AE1AE
		bsr.w	sub_1AE2A0

loc_1AE1AE:					  ; CODE XREF: ROM:001AE198j
						  ; ROM:001AE19Cj ...
		bsr.w	j_j_OnTick
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1AE1B4:					  ; CODE XREF: ROM:001AE196p
		move.w	#$00A0,d5
		move.w	#$FFC0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AE1F0
		move.b	RotationAndSize(a5),d0
		andi.b	#$C0,d0
		cmpi.b	#$40,d0
		cmpi.b	#$80,d0
		move.b	#$20,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AE1F0:					  ; CODE XREF: sub_1AE1B4+10j
		tst.b	d0
		rts
; End of function sub_1AE1B4


; =============== S U B	R O U T	I N E =======================================


sub_1AE1F4:					  ; CODE XREF: ROM:001AE19Ap
		move.w	#$0050,d5
		move.w	#$FFE0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AE230
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	loc_1AE230
		move.b	#$21,ChestIndex(a5)
		move.w	#$001A,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AE230:					  ; CODE XREF: sub_1AE1F4+10j
						  ; sub_1AE1F4+20j
		tst.b	d0
		rts
; End of function sub_1AE1F4


; =============== S U B	R O U T	I N E =======================================


sub_1AE234:					  ; CODE XREF: ROM:001AE19Ep
		move.w	#$0030,d5
		move.w	#$FFE0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AE270
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00016,d7
		bhi.s	loc_1AE270
		move.b	#$22,ChestIndex(a5)
		move.w	#$0012,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AE270:					  ; CODE XREF: sub_1AE234+10j
						  ; sub_1AE234+20j
		tst.b	d0
		rts
; End of function sub_1AE234


; =============== S U B	R O U T	I N E =======================================


sub_1AE274:					  ; CODE XREF: ROM:001AE1A4p
		move.w	#$0020,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AE2D8
		move.b	#$23,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; End of function sub_1AE274


; =============== S U B	R O U T	I N E =======================================


sub_1AE2A0:					  ; CODE XREF: ROM:001AE1AAp
		move.w	#$0040,d5
		move.w	#$FFF0,d6
		move.w	#$0010,d7
		bsr.w	sub_1A8964
		bcc.s	loc_1AE2D8
		move.b	(Player_Action).l,d0	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		andi.b	#$07,d0
		beq.s	loc_1AE2D8
		move.b	#$24,ChestIndex(a5)
		move.w	#$017F,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AE2D8:					  ; CODE XREF: sub_1AE274+10j
						  ; sub_1AE2A0+10j ...
		tst.b	d0
		rts
; End of function sub_1AE2A0

; ---------------------------------------------------------------------------

loc_1AE2DC:					  ; CODE XREF: ROM:001AE152j
		andi.b	#$0F,d0
		beq.s	loc_1AE2F8
		cmpi.b	#$01,d0
		beq.s	loc_1AE33C
		cmpi.b	#$02,d0
		beq.s	loc_1AE33C
		cmpi.b	#$03,d0
		beq.s	loc_1AE33C
		bra.w	loc_1AE398
; ---------------------------------------------------------------------------

loc_1AE2F8:					  ; CODE XREF: ROM:001AE2E0j
		cmpi.b	#$14,Unk4D(a5)
		bhi.s	loc_1AE336
		move.w	#$0500,QueuedAction(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$0A,Unk4D(a5)
		bcs.s	loc_1AE336
		move.w	#$0600,QueuedAction(a5)
		cmpi.b	#$14,Unk4D(a5)
		bcs.s	loc_1AE336
		bset	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bset	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0320,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour

loc_1AE336:					  ; CODE XREF: ROM:001AE2FEj
						  ; ROM:001AE310j ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AE33C:					  ; CODE XREF: ROM:001AE2E6j
						  ; ROM:001AE2ECj ...
		bset	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$05,Unk4D(a5)
		bcs.s	loc_1AE398
		bne.s	loc_1AE35A
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordSwing
; ---------------------------------------------------------------------------

loc_1AE35A:					  ; CODE XREF: ROM:001AE354j
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$0A,Unk4D(a5)
		bcs.s	loc_1AE398
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	sub_1A880C
		move.w	#$0300,QueuedAction(a5)
		cmpi.b	#$0F,Unk4D(a5)
		bcs.s	loc_1AE398
		move.w	#$0400,QueuedAction(a5)
		cmpi.b	#$14,Unk4D(a5)
		bcs.s	loc_1AE398
		beq.w	EnemyAI_Spinner

loc_1AE398:					  ; CODE XREF: ROM:001AE2F4j
						  ; ROM:001AE352j ...
		bsr.w	j_j_OnTick
		rts
