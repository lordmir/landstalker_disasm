; ---------------------------------------------------------------------------

EnemyAI_Gola_B:					  ; CODE XREF: ROM:001A869Aj
		bra.s	EnemyAI_Gola
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR j_InitSpritePalettes

EnemyAI_Gola_A:					  ; CODE XREF: ROM:001A8696j
						  ; DATA XREF: j_InitSpritePalettes+8t
		move.b	#$02,Speed(a5)
		btst	#$01,Flags2(a5)
		bne.s	loc_1AEEF8
		move.b	ChestIndex(a5),d0
		beq.s	loc_1AEF4C
		cmpi.b	#$10,d0
		beq.s	loc_1AEF4C
		bra.w	loc_1AF1FC
; ---------------------------------------------------------------------------

loc_1AEEF8:					  ; CODE XREF: j_InitSpritePalettes+AAD2j
		bsr.w	j_j_OnTick
		rts
; END OF FUNCTION CHUNK	FOR j_InitSpritePalettes
; ---------------------------------------------------------------------------

EnemyAI_Gola:					  ; CODE XREF: ROM:EnemyAI_Gola_Bj
		bsr.s	sub_1AEF04
		bra.w	loc_1AF1BA

; =============== S U B	R O U T	I N E =======================================


sub_1AEF04:					  ; CODE XREF: ROM:EnemyAI_Golap
						  ; j_InitSpritePalettes+ACCAj	...
		bclr	#$06,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bclr	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,ChestIndex(a5)
		bclr	#$01,Flags2(a5)
		move.l	#$C0000000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_DATA_REG).l
		move.l	#$C01E0000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_DATA_REG).l
		rts
; End of function sub_1AEF04

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR j_InitSpritePalettes

loc_1AEF4C:					  ; CODE XREF: j_InitSpritePalettes+AAD8j
						  ; j_InitSpritePalettes+AADEj
		bsr.w	sub_1AEF72
		bcs.s	loc_1AEF6C
		bsr.w	sub_1AF01A
		bcs.s	loc_1AEF6C
		bsr.s	sub_1AEFAC
		bcs.s	loc_1AEF6C
		bsr.w	sub_1AF052
		bcs.s	loc_1AEF6C
		bsr.w	sub_1AF084
		bcs.s	locret_1AEF70
		bsr.w	sub_1AF18A

loc_1AEF6C:					  ; CODE XREF: j_InitSpritePalettes+AB3Cj
						  ; j_InitSpritePalettes+AB42j	...
		bsr.w	j_j_OnTick

locret_1AEF70:					  ; CODE XREF: j_InitSpritePalettes+AB52j
		rts
; END OF FUNCTION CHUNK	FOR j_InitSpritePalettes

; =============== S U B	R O U T	I N E =======================================


sub_1AEF72:					  ; CODE XREF: j_InitSpritePalettes:loc_1AEF4Cp
		cmpi.w	#$0064,Z(a5)
		bcc.w	loc_1AF0BA
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bcc.w	loc_1AF0BA
		move.b	#$27,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Slash1
; ---------------------------------------------------------------------------
		ori	#$01,ccr
		rts
; End of function sub_1AEF72


; =============== S U B	R O U T	I N E =======================================


sub_1AEFAC:					  ; CODE XREF: j_InitSpritePalettes+AB44p

; FUNCTION CHUNK AT 001AF0BE SIZE 0000001A BYTES

		cmpi.w	#$00F0,Z(a5)
		bcs.s	loc_1AF016
		move.w	#$0002,d6
		jsr	(j_GenerateRandomNumber).l
		tst.b	d7
		beq.s	loc_1AEFE2
		move.b	(Player_X).l,(a5)
		move.b	#$16,Y(a5)
		andi.b	#$3F,RotationAndSize(a5)
		ori.b	#$80,RotationAndSize(a5)
		bclr	#$03,TileSource(a5)
		bra.s	loc_1AF000
; ---------------------------------------------------------------------------

loc_1AEFE2:					  ; CODE XREF: sub_1AEFAC+14j
		move.b	#$19,X(a5)
		move.b	(Player_Y).l,Y(a5)
		andi.b	#$3F,RotationAndSize(a5)
		ori.b	#$40,RotationAndSize(a5)
		bset	#$03,TileSource(a5)

loc_1AF000:					  ; CODE XREF: sub_1AEFAC+34j
		bset	#$07,Unk48(a5)
		clr.w	SubX(a5)
		movea.l	a5,a1
		jsr	(sub_1A8AE6).l
		bra.w	loc_1AF0BE
; ---------------------------------------------------------------------------

loc_1AF016:					  ; CODE XREF: sub_1AEFAC+6j
		tst.b	d0
		rts
; End of function sub_1AEFAC


; =============== S U B	R O U T	I N E =======================================


sub_1AF01A:					  ; CODE XREF: j_InitSpritePalettes+AB3Ep
		cmpi.w	#$0094,Z(a5)
		bcs.s	loc_1AF04E
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00030,d7
		bhi.w	loc_1AF04E
		move.b	#$21,ChestIndex(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AF04E:					  ; CODE XREF: sub_1AF01A+6j
						  ; sub_1AF01A+16j
		tst.b	d0
		rts
; End of function sub_1AF01A


; =============== S U B	R O U T	I N E =======================================


sub_1AF052:					  ; CODE XREF: j_InitSpritePalettes+AB48p
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00010,d7
		bhi.s	loc_1AF080
		move.w	#$0383,BehaviourLUTIndex(a5)

loc_1AF068:					  ; CODE XREF: j_InitSpritePalettes+AF5Aj
		move.b	#$22,ChestIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Fireball1
; ---------------------------------------------------------------------------
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AF080:					  ; CODE XREF: sub_1AF052+Ej
		tst.b	d0
		rts
; End of function sub_1AF052


; =============== S U B	R O U T	I N E =======================================


sub_1AF084:					  ; CODE XREF: j_InitSpritePalettes+AB4Ep
		cmpi.w	#$0064,Z(a5)
		bcc.s	loc_1AF0BA
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00085,d7
		bcc.s	loc_1AF0BA
		move.b	#$23,ChestIndex(a5)
		move.w	#$0363,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Slash1
; ---------------------------------------------------------------------------
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AF0BA:					  ; CODE XREF: sub_1AEF72+6j
						  ; sub_1AEF72+18j ...
		tst.b	d0
		rts
; End of function sub_1AF084

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1AEFAC

loc_1AF0BE:					  ; CODE XREF: sub_1AEFAC+66j
		move.b	#$24,ChestIndex(a5)
		move.w	#$0361,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; END OF FUNCTION CHUNK	FOR sub_1AEFAC
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR j_InitSpritePalettes

loc_1AF0D8:					  ; CODE XREF: j_InitSpritePalettes+AE84j
		tst.w	(g_ControllerPlayback).l
		beq.w	sub_1AEF04
		move.l	(a5),d0
		movem.l	d0,-(sp)
		move.w	(Player_CentreX).l,d0
		move.w	(Player_CentreY).l,d1
		move.w	#$0002,d6
		jsr	(j_GenerateRandomNumber).l
		tst.b	d7
		beq.s	loc_1AF10C
		subi.w	#$0038,d0
		move.b	#$40,d2
		bra.s	loc_1AF114
; ---------------------------------------------------------------------------

loc_1AF10C:					  ; CODE XREF: j_InitSpritePalettes+ACECj
		subi.w	#$0038,d1
		move.b	#$80,d2

loc_1AF114:					  ; CODE XREF: j_InitSpritePalettes+ACF6j
		move.w	d0,d3
		andi.b	#$F0,d0
		lsr.w	#$04,d0
		move.b	d0,X(a5)
		andi.b	#$0F,d3
		move.b	d3,SubX(a5)
		move.w	d1,d3
		andi.b	#$F0,d1
		lsr.w	#$04,d1
		move.b	d1,Y(a5)
		andi.b	#$0F,d3
		move.b	d3,SubY(a5)
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d2,RotationAndSize(a5)
		bset	#$07,Unk48(a5)
		bset	#$07,Unk0A(a5)
		movea.l	a5,a1
		jsr	(sub_1A8AE6).l
		movem.l	(sp)+,d0
		bcs.s	loc_1AF184
		move.b	#$26,ChestIndex(a5)
		move.w	#$0361,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		subi.w	#$0020,Z(a5)
		subi.w	#$0020,HitBoxZEnd(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AF184:					  ; CODE XREF: j_InitSpritePalettes+AD48j
		move.l	d0,(a5)
		tst.b	d0
		rts
; END OF FUNCTION CHUNK	FOR j_InitSpritePalettes

; =============== S U B	R O U T	I N E =======================================


sub_1AF18A:					  ; CODE XREF: j_InitSpritePalettes+AB54p
		cmpi.w	#$0064,Z(a5)
		bcc.s	loc_1AF1E6
		move.w	#00025,d6
		jsr	(j_GenerateRandomNumber).l
		move.b	(Player_X).l,d6
		subi.b	#$18,d6
		add.b	(Player_Y).l,d6
		subi.b	#$15,d6
		move.b	#$18,d5
		sub.b	d6,d5
		cmp.b	d5,d7
		bcc.s	loc_1AF1E6

loc_1AF1BA:					  ; CODE XREF: ROM:001AEF00j
		move.l	#$C0000000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_DATA_REG).l
		move.b	#$25,ChestIndex(a5)
		move.w	#$0362,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	Unk4D(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1AF1E6:					  ; CODE XREF: sub_1AF18A+6j
						  ; sub_1AF18A+2Ej
		tst.b	d0
		rts
; End of function sub_1AF18A

; ---------------------------------------------------------------------------
		bsr.w	sub_1AC010
		move.b	d2,d1
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d2,RotationAndSize(a5)
		rts
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR j_InitSpritePalettes

loc_1AF1FC:					  ; CODE XREF: j_InitSpritePalettes+AAE0j
		andi.b	#$0F,d0
		beq.s	locret_1AF234
		cmpi.b	#$01,d0
		beq.s	loc_1AF236
		cmpi.b	#$02,d0
		beq.w	loc_1AF29E
		cmpi.b	#$03,d0
		beq.w	loc_1AF372
		cmpi.b	#$04,d0
		beq.w	loc_1AF34E
		cmpi.b	#$05,d0
		beq.w	loc_1AF34E
		cmpi.b	#$06,d0
		beq.w	loc_1AF35C
		bra.w	loc_1AF4FE
; ---------------------------------------------------------------------------

locret_1AF234:					  ; CODE XREF: j_InitSpritePalettes+ADECj
		rts
; ---------------------------------------------------------------------------

loc_1AF236:					  ; CODE XREF: j_InitSpritePalettes+ADF2j
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$01,Unk4D(a5)
		beq.w	loc_1AF27A
		cmpi.b	#$10,Unk4D(a5)
		bne.w	loc_1AF292
		move.b	(Player_Z+1).l,d0
		cmp.b	(Player_FloorHeight).l,d0
		bne.s	loc_1AF26E
		tst.b	(byte_FF1142).l
		bne.s	loc_1AF26E
		move.b	#$08,d0
		jsr	(j_PlaybackInput).l

loc_1AF26E:					  ; CODE XREF: j_InitSpritePalettes+AE46j
						  ; j_InitSpritePalettes+AE4Ej
		move.b	#$10,d0
		bsr.s	sub_1AF27E
		bsr.w	sub_1AEE66
		rts
; ---------------------------------------------------------------------------

loc_1AF27A:					  ; CODE XREF: j_InitSpritePalettes+AE2Cj
		move.b	#$08,d0
; END OF FUNCTION CHUNK	FOR j_InitSpritePalettes

; =============== S U B	R O U T	I N E =======================================


sub_1AF27E:					  ; CODE XREF: j_InitSpritePalettes+AE5Ep
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Thud
; ---------------------------------------------------------------------------
		movem.l	a5,-(sp)
		jsr	(j_DoTileSwap).l
		movem.l	(sp)+,a5
		rts
; End of function sub_1AF27E

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR j_InitSpritePalettes

loc_1AF292:					  ; CODE XREF: j_InitSpritePalettes+AE36j
		cmpi.b	#$11,Unk4D(a5)
		beq.w	loc_1AF0D8
		rts
; ---------------------------------------------------------------------------

loc_1AF29E:					  ; CODE XREF: j_InitSpritePalettes+ADF8j
		move.w	#$0200,QueuedAction(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$01,Unk4D(a5)
		bne.s	loc_1AF2F4
		lea	($00009880).l,a2
		move.b	#$01,d0
		jsr	(j_LoadMagicSwordEffect).l
		move.b	#$01,d0
		bsr.w	LoadProjectilePalette
		bsr.w	LoadPal3Low
		move.l	#$C0000000,(VDP_CTRL_REG).l
		move.w	#$000E,(VDP_DATA_REG).l
		move.l	#$C01E0000,(VDP_CTRL_REG).l
		move.w	#$000E,(VDP_DATA_REG).l
		bra.w	loc_1AF348
; ---------------------------------------------------------------------------

loc_1AF2F4:					  ; CODE XREF: j_InitSpritePalettes+AE9Aj
		cmpi.b	#$02,Unk4D(a5)
		bne.w	loc_1AF332
		move.b	#$01,d0
		bsr.w	LoadProjectilePalette
		bsr.w	LoadPal3Low
		move.l	#$C0000000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_DATA_REG).l
		move.l	#$C01E0000,(VDP_CTRL_REG).l
		move.w	#$0000,(VDP_DATA_REG).l
		bra.w	loc_1AF348
; ---------------------------------------------------------------------------

loc_1AF332:					  ; CODE XREF: j_InitSpritePalettes+AEE6j
		cmpi.b	#$03,Unk4D(a5)
		bne.w	loc_1AF348
		move.w	#$0368,d6
		bsr.w	sub_1AF448
		clr.b	Unk4D(a5)

loc_1AF348:					  ; CODE XREF: j_InitSpritePalettes+AEDCj
						  ; j_InitSpritePalettes+AF1Aj	...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1AF34E:					  ; CODE XREF: j_InitSpritePalettes+AE08j
						  ; j_InitSpritePalettes+AE10j
		bsr.w	j_j_OnTick
		tst.b	BehavCmd(a5)
		beq.w	sub_1AEF04
		rts
; ---------------------------------------------------------------------------

loc_1AF35C:					  ; CODE XREF: j_InitSpritePalettes+AE18j
		bsr.w	j_j_OnTick
		tst.b	BehavCmd(a5)
		beq.s	loc_1AF368
		rts
; ---------------------------------------------------------------------------

loc_1AF368:					  ; CODE XREF: j_InitSpritePalettes+AF50j
		move.w	#$0384,BehaviourLUTIndex(a5)
		bra.w	loc_1AF068
; ---------------------------------------------------------------------------

loc_1AF372:					  ; CODE XREF: j_InitSpritePalettes+AE00j
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$01,Unk4D(a5)
		bne.s	loc_1AF398
		lea	($00009880).l,a2
		move.b	#$01,d0
		jsr	(j_LoadMagicSwordEffect).l
		bra.w	loc_1AF3E4
; ---------------------------------------------------------------------------

loc_1AF398:					  ; CODE XREF: j_InitSpritePalettes+AF6Ej
		cmpi.b	#$02,Unk4D(a5)
		bne.w	loc_1AF3B2
		move.b	#$01,d0
		bsr.w	LoadProjectilePalette
		bsr.w	LoadPal3Low
		bra.w	loc_1AF3E4
; ---------------------------------------------------------------------------

loc_1AF3B2:					  ; CODE XREF: j_InitSpritePalettes+AF8Aj
		cmpi.b	#$0A,Unk4D(a5)
		bhi.w	loc_1AF3D4
		bcs.w	loc_1AF3E4
		move.w	#$0200,QueuedAction(a5)
		move.w	#$0345,d6
		bsr.w	sub_1AF448
		bcs.w	loc_1AF43A
		bra.s	loc_1AF3E4
; ---------------------------------------------------------------------------

loc_1AF3D4:					  ; CODE XREF: j_InitSpritePalettes+AFA4j
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$14,Unk4D(a5)
		beq.w	loc_1AF43A

loc_1AF3E4:					  ; CODE XREF: j_InitSpritePalettes+AF80j
						  ; j_InitSpritePalettes+AF9Aj	...
		move.b	RotationAndSize(a5),d0
		movem.w	d0,-(sp)
		andi.b	#$C0,d0
		cmpi.b	#$80,d0
		beq.s	loc_1AF40E
		move.b	#$00,d1
		move.b	Y(a5),d0
		cmp.b	(Player_Y).l,d0
		beq.s	loc_1AF430
		bhi.s	loc_1AF422
		move.b	#$80,d1
		bra.s	loc_1AF422
; ---------------------------------------------------------------------------

loc_1AF40E:					  ; CODE XREF: j_InitSpritePalettes+AFE0j
		move.b	#$C0,d1
		move.b	(a5),d0
		cmp.b	(Player_X).l,d0
		beq.s	loc_1AF430
		bhi.s	loc_1AF422
		move.b	#$40,d1

loc_1AF422:					  ; CODE XREF: j_InitSpritePalettes+AFF2j
						  ; j_InitSpritePalettes+AFF8j	...
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d1,RotationAndSize(a5)
		bsr.w	j_j_OnTick

loc_1AF430:					  ; CODE XREF: j_InitSpritePalettes+AFF0j
						  ; j_InitSpritePalettes+B006j
		movem.w	(sp)+,d0
		move.b	d0,RotationAndSize(a5)
		rts
; ---------------------------------------------------------------------------

loc_1AF43A:					  ; CODE XREF: j_InitSpritePalettes+AFBAj
						  ; j_InitSpritePalettes+AFCCj
		bclr	#$00,Flags2(a5)
		clr.b	Unk4D(a5)
		bra.w	sub_1AEF04
; END OF FUNCTION CHUNK	FOR j_InitSpritePalettes

; =============== S U B	R O U T	I N E =======================================


sub_1AF448:					  ; CODE XREF: j_InitSpritePalettes+AF2Cp
						  ; j_InitSpritePalettes+AFB6p	...
		move.b	RotationAndSize(a5),d2
		movem.w	d6,-(sp)
		movem.w	d2,-(sp)
		jsr	(sub_103B2).l
		movem.w	(sp)+,d1
		movem.w	(sp)+,d6
		bcs.w	loc_1AF4F8
		move.w	CentreX(a5),d2
		move.w	CentreY(a5),d3
		andi.b	#$C0,d1
		beq.s	loc_1AF482
		cmpi.b	#$80,d1
		bcs.s	loc_1AF488
		beq.s	loc_1AF48E
		subi.w	#$001A,d2
		bra.s	loc_1AF492
; ---------------------------------------------------------------------------

loc_1AF482:					  ; CODE XREF: sub_1AF448+2Aj
		subi.w	#$001A,d3
		bra.s	loc_1AF492
; ---------------------------------------------------------------------------

loc_1AF488:					  ; CODE XREF: sub_1AF448+30j
		addi.w	#$001A,d2
		bra.s	loc_1AF492
; ---------------------------------------------------------------------------

loc_1AF48E:					  ; CODE XREF: sub_1AF448+32j
		addi.w	#$001A,d3

loc_1AF492:					  ; CODE XREF: sub_1AF448+38j
						  ; sub_1AF448+3Ej ...
		move.w	d2,d0
		andi.b	#$0F,d0
		move.b	d0,SubX(a1)
		lsr.w	#$04,d2
		move.b	d2,(a1)
		move.w	d3,d0
		andi.b	#$0F,d0
		move.b	d0,SubY(a1)
		lsr.w	#$04,d3
		move.b	d3,Y(a1)
		move.b	d1,RotationAndSize(a1)
		move.b	#SPR_GOLAFIREBALL,d2
		move.w	#$1400,AttackStrength(a1)
		move.w	Z(a5),d3
		move.w	d3,Z(a1)
		move.w	#$64B4,TileSource(a1)
		move.w	d6,BehaviourLUTIndex(a1)
		move.b	#$04,Speed(a1)
		move.b	#$80,FallRate(a1)
		jsr	(sub_103B8).l
		bset	#$00,Flags4(a1)		  ; Bit	0 = Invincible / Solid
		bset	#$07,Flags2(a1)
		bset	#$07,InitFlags2(a1)
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1AF4F8:					  ; CODE XREF: sub_1AF448+1Aj
		ori	#$01,ccr
		rts
; End of function sub_1AF448

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR j_InitSpritePalettes

loc_1AF4FE:					  ; CODE XREF: j_InitSpritePalettes+AE1Cj
		move.w	#$0100,QueuedAction(a5)
		addq.b	#$01,Unk4D(a5)
		cmpi.b	#$01,Unk4D(a5)
		bne.s	loc_1AF520
		lea	($00009880).l,a2
		move.b	#$01,d0
		jmp	(j_LoadMagicSwordEffect).l
; ---------------------------------------------------------------------------

loc_1AF520:					  ; CODE XREF: j_InitSpritePalettes+B0FAj
		cmpi.b	#$02,Unk4D(a5)
		bne.w	loc_1AF536
		move.b	#$01,d0
		bsr.w	LoadProjectilePalette
		bra.w	LoadPal3Low
; ---------------------------------------------------------------------------

loc_1AF536:					  ; CODE XREF: j_InitSpritePalettes+B112j
		cmpi.b	#$10,Unk4D(a5)
		bhi.w	loc_1AF56C
		bcs.w	locret_1AF57C
		move.w	#$0200,QueuedAction(a5)
		move.w	#$0345,d6
		bsr.w	sub_1AF448
		bcs.w	loc_1AF57E
		move.w	#$0346,d6
		bsr.w	sub_1AF448
		bcs.w	loc_1AF57E
		move.w	#$0347,d6
		bsr.w	sub_1AF448
		rts
; ---------------------------------------------------------------------------

loc_1AF56C:					  ; CODE XREF: j_InitSpritePalettes+B128j
		move.w	#$0200,QueuedAction(a5)
		cmpi.b	#$20,Unk4D(a5)
		beq.w	loc_1AF57E

locret_1AF57C:					  ; CODE XREF: j_InitSpritePalettes+B12Cj
		rts
; ---------------------------------------------------------------------------

loc_1AF57E:					  ; CODE XREF: j_InitSpritePalettes+B13Ej
						  ; j_InitSpritePalettes+B14Aj	...
		clr.b	Unk4D(a5)
		bra.w	sub_1AEF04
; END OF FUNCTION CHUNK	FOR j_InitSpritePalettes
