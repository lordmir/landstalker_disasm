; ---------------------------------------------------------------------------

EB_NULL:					  ; CODE XREF: OnTick+Cj
		rts
; ---------------------------------------------------------------------------

ProcessNextCmdImmediately_1:			  ; CODE XREF: OnTick+608j
						  ; OnTick+6FEj ...
		moveq	#$00000001,d0
		bsr.s	LoadNextCmd
		bra.w	ProcessNextCmd
; ---------------------------------------------------------------------------

ProcessNextCmdImmediately_2:			  ; CODE XREF: OnTick+21Cj
						  ; OnTick:loc_18356j ...
		moveq	#$00000002,d0
		bsr.s	LoadNextCmd
		bra.w	ProcessNextCmd
; End of function OnTick


; =============== S U B	R O U T	I N E =======================================


LoadNextCmd:					  ; CODE XREF: OnTick+1BEp
						  ; OnTick+1C6p ...
		movea.l	BehaviourLUTPtr(a5),a6
		adda.l	d0,a6
		move.l	a6,BehaviourLUTPtr(a5)
		move.b	(a6)+,BehavCmd(a5)
		move.b	(a6),BehavParam(a5)
		rts
; End of function LoadNextCmd

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR OnTick

EB_Pause:					  ; CODE XREF: OnTick:loc_17918j
		subq.b	#$01,$0000002A(a5)
		bne.s	locret_17AE8
		moveq	#$00000002,d0
		bsr.s	LoadNextCmd

locret_17AE8:					  ; CODE XREF: OnTick+1E4j
		rts
; ---------------------------------------------------------------------------

EB_MoveRandomTime:				  ; CODE XREF: OnTick+C2j
		clr.w	d6
		move.b	BehavParam(a5),d6
		jsr	(j_GenerateRandomNumber).l
		movea.l	BehaviourLUTPtr(a5),a6
		clr.w	d6
		move.b	$00000002(a6),d6
		sub.w	d7,d6
		addq.b	#$01,d6
		move.b	d6,BehavParam(a5)
		addq.l	#$01,BehaviourLUTPtr(a5)
		move.b	#$01,BehavCmd(a5)

EB_MoveTimed:					  ; CODE XREF: OnTick+1Ej
		bsr.s	sub_17B50
		subq.b	#$01,BehavParam(a5)
		bne.s	locret_17B1E
		bra.w	ProcessNextCmdImmediately_2
; ---------------------------------------------------------------------------

locret_17B1E:					  ; CODE XREF: OnTick+21Aj
		rts
; ---------------------------------------------------------------------------

EB_MoveRelative:				  ; CODE XREF: OnTick+5Ej
		bsr.s	sub_17B50
		bcs.s	locret_17B2E
		subq.b	#$01,BehavParam(a5)
		bne.s	locret_17B2E
		moveq	#$00000002,d0
		bsr.s	LoadNextCmd

locret_17B2E:					  ; CODE XREF: OnTick+224j
						  ; OnTick+22Aj
		rts
; ---------------------------------------------------------------------------

EB_MoveNoClip:					  ; CODE XREF: OnTick+156j
		bsr.s	sub_17B40
		bcs.s	locret_17B3E
		subq.b	#$01,BehavParam(a5)
		bne.s	locret_17B3E
		moveq	#$00000002,d0
		bsr.s	LoadNextCmd

locret_17B3E:					  ; CODE XREF: OnTick+234j
						  ; OnTick+23Aj
		rts
; END OF FUNCTION CHUNK	FOR OnTick

; =============== S U B	R O U T	I N E =======================================


sub_17B40:					  ; CODE XREF: OnTick:EB_MoveNoClipp
		bset	#$06,Unk48(a5)
		bsr.s	loc_17B56
		bclr	#$06,Unk48(a5)
		rts
; End of function sub_17B40


; =============== S U B	R O U T	I N E =======================================


sub_17B50:					  ; CODE XREF: OnTick:EB_MoveTimedp
						  ; OnTick:EB_MoveRelativep ...
		bclr	#$06,Unk48(a5)

loc_17B56:					  ; CODE XREF: sub_17B40+6p
		move.b	RotationAndSize(a5),d0
		andi.b	#$C0,d0
		beq.s	loc_17B70
		cmpi.b	#$80,d0
		bhi.w	loc_17E1E
		beq.w	loc_17D62
		bcs.w	loc_17CAA
; End of function sub_17B50

; START	OF FUNCTION CHUNK FOR sub_1914C

loc_17B70:					  ; CODE XREF: sub_17B50+Ej
						  ; sub_1914C+Ej
		move.w	HitBoxYStart(a5),d1
		move.w	Flags1(a5),d0
		andi.w	#$000F,d0
		sub.w	d0,HitBoxYStart(a5)
		sub.w	d0,HitBoxYEnd(a5)
		btst	#$06,Unk48(a5)
		bne.w	loc_17BDA
		move.w	HitBoxYStart(a5),d0
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.s	loc_17BCA
		movea.l	a5,a0
		jsr	(sub_380).l
		bcc.s	loc_17BCA
		clr.b	d7
		move.b	d0,d1
		bra.s	loc_17BB4
; ---------------------------------------------------------------------------

loc_17BAE:					  ; CODE XREF: sub_1914C-1574j
		bsr.w	sub_17C2C
		bcs.s	loc_17BDA

loc_17BB4:					  ; CODE XREF: sub_1914C-15A0j
		move.w	Flags1(a5),d0
		andi.w	#$000F,d0
		add.w	d0,HitBoxYStart(a5)
		add.w	d0,HitBoxYEnd(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_17BCA:					  ; CODE XREF: sub_1914C-15B0j
						  ; sub_1914C-15A6j
		move.l	a5,d0
		subi.l	#Player_X,d0
		jsr	(j_CollisionDetect).l
		bcs.s	loc_17BAE

loc_17BDA:					  ; CODE XREF: sub_1914C-15C2j
						  ; sub_1914C-159Aj
		move.w	CentreY(a5),d0
		move.w	d0,d1
		move.w	Flags1(a5),d2
		andi.w	#$000F,d2
		sub.w	d2,d0
		move.w	d0,CentreY(a5)
		andi.b	#$0F,d0
		move.b	d0,SubY(a5)
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.s	loc_17C14
		subq.b	#$01,Y(a5)
		subi.w	#$0094,HeightmapOffset(a5)
		movea.w	HeightmapOffset(a5),a6
		move.w	(a6),GroundHeight(a5)

loc_17C14:					  ; CODE XREF: sub_1914C-154Cj
		btst	#$03,QueuedAction(a5)
		bne.s	loc_17C28
		bset	#$00,Action1(a5)
		bset	#$00,Unk6D(a5)

loc_17C28:					  ; CODE XREF: sub_1914C-1532j
		tst.b	d0
		rts
; END OF FUNCTION CHUNK	FOR sub_1914C

; =============== S U B	R O U T	I N E =======================================


sub_17C2C:					  ; CODE XREF: sub_1914C:loc_17BAEp
						  ; sub_1914C:loc_17CE8p ...
		tst.b	Flags2(a5)
		bpl.s	loc_17C94
		cmpa.l	#Player_X,a0
		bne.s	loc_17C82
		tst.b	(byte_FF1142).l
		bne.s	loc_17C7A
		move.b	RotationAndSize(a5),d7
		lsr.b	#$06,d7
		ori.b	#$40,d7
		move.b	d7,(byte_FF1143).l
		move.w	AttackStrength(a5),(Player_AttackStrength).l
		cmpi.b	#SPR_SMLFIREBALL,SpriteType(a5)
		beq.s	loc_17C72
		cmpi.b	#SPR_IFRITFIREBALL,SpriteType(a5)
		beq.s	loc_17C72
		cmpi.b	#SPR_GOLAFIREBALL,SpriteType(a5)
		bne.s	loc_17C7A

loc_17C72:					  ; CODE XREF: sub_17C2C+34j
						  ; sub_17C2C+3Cj
		bset	#$00,(Player_Unk48).l

loc_17C7A:					  ; CODE XREF: sub_17C2C+14j
						  ; sub_17C2C+44j ...
		move.b	#$FF,d7
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_17C82:					  ; CODE XREF: sub_17C2C+Cj
		cmpi.b	#SPR_GOLAFIREBALL,SpriteType(a5)
		bne.s	loc_17C7A
		cmpi.b	#SPR_GOLAFIREBALL,SpriteType(a0)
		bne.s	loc_17C7A
		bra.s	loc_17CA4
; ---------------------------------------------------------------------------

loc_17C94:					  ; CODE XREF: sub_17C2C+4j
		cmpa.l	#Player_X,a0
		bne.s	loc_17C7A
		cmpi.b	#$5C,BehavCmd(a5)
		bne.s	loc_17C7A

loc_17CA4:					  ; CODE XREF: sub_17C2C+66j
		ori	#$01,ccr
		rts
; End of function sub_17C2C

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1914C

loc_17CAA:					  ; CODE XREF: sub_17B50+1Cj
						  ; sub_1914C+2Cj
		move.w	$0000001A(a5),d1
		move.w	$00000008(a5),d0
		andi.w	#$000F,d0
		add.w	d0,$00000018(a5)
		add.w	d0,$0000001A(a5)
		btst	#$06,$00000048(a5)
		bne.w	loc_17D14
		move.w	$0000001A(a5),d0
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bls.s	loc_17D04
		movea.l	a5,a0
		jsr	(sub_386).l
		bcc.s	loc_17D04
		clr.b	d7
		move.b	d0,d1
		bra.s	loc_17CEE
; ---------------------------------------------------------------------------

loc_17CE8:					  ; CODE XREF: sub_1914C-143Aj
		bsr.w	sub_17C2C
		bcs.s	loc_17D14

loc_17CEE:					  ; CODE XREF: sub_1914C-1466j
		move.w	$00000008(a5),d0
		andi.w	#$000F,d0
		sub.w	d0,$00000018(a5)
		sub.w	d0,$0000001A(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_17D04:					  ; CODE XREF: sub_1914C-1476j
						  ; sub_1914C-146Cj
		move.l	a5,d0
		subi.l	#Player_X,d0
		jsr	(j_CollisionDetect).l
		bcs.s	loc_17CE8

loc_17D14:					  ; CODE XREF: sub_1914C-1488j
						  ; sub_1914C-1460j
		move.w	$00000014(a5),d0
		move.w	d0,d1
		move.w	$00000008(a5),d2
		andi.w	#$000F,d2
		add.w	d2,d0
		move.w	d0,$00000014(a5)
		andi.b	#$0F,d0
		move.b	d0,$00000002(a5)
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d1,d0
		bcc.s	loc_17D4A
		addq.b	#$01,(a5)
		addq.w	#$02,$00000028(a5)
		movea.w	$00000028(a5),a6
		move.w	(a6),$00000022(a5)

loc_17D4A:					  ; CODE XREF: sub_1914C-1412j
		btst	#$03,$0000002C(a5)
		bne.s	loc_17D5E
		bset	#$03,$0000002D(a5)
		bset	#$03,$0000006D(a5)

loc_17D5E:					  ; CODE XREF: sub_1914C-13FCj
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_17D62:					  ; CODE XREF: sub_17B50+18j
						  ; sub_1914C+18j
		move.w	$0000001E(a5),d1
		move.w	$00000008(a5),d0
		andi.w	#$000F,d0
		add.w	d0,$0000001C(a5)
		add.w	d0,$0000001E(a5)
		btst	#$06,$00000048(a5)
		bne.w	loc_17DCC
		move.w	$0000001E(a5),d0
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bls.s	loc_17DBC
		movea.l	a5,a0
		jsr	(sub_38C).l
		bcc.s	loc_17DBC
		clr.b	d7
		move.b	d0,d1
		bra.s	loc_17DA6
; ---------------------------------------------------------------------------

loc_17DA0:					  ; CODE XREF: sub_1914C-1382j
		bsr.w	sub_17C2C
		bcs.s	loc_17DCC

loc_17DA6:					  ; CODE XREF: sub_1914C-13AEj
		move.w	$00000008(a5),d0
		andi.w	#$000F,d0
		sub.w	d0,$0000001C(a5)
		sub.w	d0,$0000001E(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_17DBC:					  ; CODE XREF: sub_1914C-13BEj
						  ; sub_1914C-13B4j
		move.l	a5,d0
		subi.l	#Player_X,d0
		jsr	(j_CollisionDetect).l
		bcs.s	loc_17DA0

loc_17DCC:					  ; CODE XREF: sub_1914C-13D0j
						  ; sub_1914C-13A8j
		move.w	$00000016(a5),d0
		move.w	d0,d1
		move.w	$00000008(a5),d2
		andi.w	#$000F,d2
		add.w	d2,d0
		move.w	d0,$00000016(a5)
		andi.b	#$0F,d0
		move.b	d0,$00000003(a5)
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d1,d0
		bcc.s	loc_17E06
		addq.b	#$01,$00000001(a5)
		addi.w	#$0094,$00000028(a5)
		movea.w	$00000028(a5),a6
		move.w	(a6),$00000022(a5)

loc_17E06:					  ; CODE XREF: sub_1914C-135Aj
		btst	#$03,$0000002C(a5)
		bne.s	loc_17E1A
		bset	#$01,$0000002D(a5)
		bset	#$01,$0000006D(a5)

loc_17E1A:					  ; CODE XREF: sub_1914C-1340j
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_17E1E:					  ; CODE XREF: sub_17B50+14j
						  ; sub_1914C+22j
		move.w	$00000018(a5),d1
		move.w	$00000008(a5),d0
		andi.w	#$000F,d0
		sub.w	d0,$00000018(a5)
		sub.w	d0,$0000001A(a5)
		btst	#$06,$00000048(a5)
		bne.s	loc_17E86
		move.w	$00000018(a5),d0
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.s	loc_17E76
		movea.l	a5,a0
		jsr	(sub_392).l
		bcc.s	loc_17E76
		clr.b	d7
		move.b	d0,d1
		bra.s	loc_17E60
; ---------------------------------------------------------------------------

loc_17E5A:					  ; CODE XREF: sub_1914C-12C8j
		bsr.w	sub_17C2C
		bcs.s	loc_17E86

loc_17E60:					  ; CODE XREF: sub_1914C-12F4j
		move.w	$00000008(a5),d0
		andi.w	#$000F,d0
		add.w	d0,$00000018(a5)
		add.w	d0,$0000001A(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_17E76:					  ; CODE XREF: sub_1914C-1304j
						  ; sub_1914C-12FAj
		move.l	a5,d0
		subi.l	#Player_X,d0
		jsr	(j_CollisionDetect).l
		bcs.s	loc_17E5A

loc_17E86:					  ; CODE XREF: sub_1914C-1314j
						  ; sub_1914C-12EEj
		move.w	$00000014(a5),d0
		move.w	d0,d1
		move.w	$00000008(a5),d2
		andi.w	#$000F,d2
		sub.w	d2,d0
		move.w	d0,$00000014(a5)
		andi.b	#$0F,d0
		move.b	d0,$00000002(a5)
		andi.b	#$08,d0
		andi.b	#$08,d1
		cmp.b	d0,d1
		bcc.s	loc_17EBC
		subq.b	#$01,(a5)
		subq.w	#$02,$00000028(a5)
		movea.w	$00000028(a5),a6
		move.w	(a6),$00000022(a5)

loc_17EBC:					  ; CODE XREF: sub_1914C-12A0j
		btst	#$03,$0000002C(a5)
		bne.s	loc_17ED0
		bset	#$02,$0000002D(a5)
		bset	#$02,$0000006D(a5)

loc_17ED0:					  ; CODE XREF: sub_1914C-128Aj
		tst.b	d0
		rts
; END OF FUNCTION CHUNK	FOR sub_1914C
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR OnTick

EB_TurnCWImmediate:				  ; CODE XREF: OnTick+7Aj
		bsr.s	EB_TurnCW
		bra.w	ProcessNextCmd
; ---------------------------------------------------------------------------

EB_TurnCCWImmediate:				  ; CODE XREF: OnTick+7Ej
		bsr.s	EB_TurnCCW
		bra.w	ProcessNextCmd
; ---------------------------------------------------------------------------

EB_TurnNEImmediate:				  ; CODE XREF: OnTick+82j
		bsr.s	EB_TurnNE
		bra.w	ProcessNextCmd
; ---------------------------------------------------------------------------

EB_TurnSEImmediate:				  ; CODE XREF: OnTick+86j
		bsr.s	EB_TurnSE
		bra.w	ProcessNextCmd
; ---------------------------------------------------------------------------

EB_TurnSWImmediate:				  ; CODE XREF: OnTick+8Aj
		bsr.s	EB_TurnSW
		bra.w	ProcessNextCmd
; ---------------------------------------------------------------------------

EB_TurnNWImmediate:				  ; CODE XREF: OnTick+8Ej
		bsr.s	EB_TurnNW
		bra.w	ProcessNextCmd
; END OF FUNCTION CHUNK	FOR OnTick

; =============== S U B	R O U T	I N E =======================================


sub_17EF8:					  ; CODE XREF: EB_TurnCW+2j
						  ; EB_TurnCCW+2j ...
		btst	#$00,Flags2(a5)
		bne.s	locret_17F02
		bsr.s	sub_17F0A

locret_17F02:					  ; CODE XREF: sub_17EF8+6j
		rts
; End of function sub_17EF8

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR OnTick

EB_UpdateSpriteFacing:				  ; CODE XREF: OnTick+17Aj
		bsr.s	sub_17F0A
		bra.w	ProcessNextCmdImmediately_1
; END OF FUNCTION CHUNK	FOR OnTick

; =============== S U B	R O U T	I N E =======================================


sub_17F0A:					  ; CODE XREF: sub_17EF8+8p
						  ; OnTick:EB_UpdateSpriteFacingp ...
		move.b	$00000004(a5),d1
		andi.b	#$C0,d1
		movea.l	a5,a1
		bsr.w	SetSpriteRotationAnimFlags
		ori.b	#$80,$0000000A(a5)
		ori.b	#$80,$00000048(a5)
		rts
; End of function sub_17F0A


; =============== S U B	R O U T	I N E =======================================


EB_TurnCW:					  ; CODE XREF: OnTick+22j
						  ; OnTick:EB_TurnCWImmediatep
		bsr.s	EB_SetDirCW
		bra.s	sub_17EF8
; End of function EB_TurnCW


; =============== S U B	R O U T	I N E =======================================


EB_TurnCCW:					  ; CODE XREF: OnTick+26j
						  ; OnTick:EB_TurnCCWImmediatep
		bsr.s	EB_SetDirCCW
		bra.s	sub_17EF8
; End of function EB_TurnCCW


; =============== S U B	R O U T	I N E =======================================


EB_TurnNE:					  ; CODE XREF: OnTick+2Aj
						  ; OnTick:EB_TurnNEImmediatep	...
		bsr.s	EB_SetDirNE
		bra.s	sub_17EF8
; End of function EB_TurnNE


; =============== S U B	R O U T	I N E =======================================


EB_TurnSE:					  ; CODE XREF: OnTick+2Ej
						  ; OnTick:EB_TurnSEImmediatep
		bsr.s	EB_SetDirSE
		bra.s	sub_17EF8
; End of function EB_TurnSE


; =============== S U B	R O U T	I N E =======================================


EB_TurnSW:					  ; CODE XREF: OnTick+32j
						  ; OnTick:EB_TurnSWImmediatep	...
		bsr.s	EB_SetDirSW
		bra.s	sub_17EF8
; End of function EB_TurnSW


; =============== S U B	R O U T	I N E =======================================


EB_TurnNW:					  ; CODE XREF: OnTick+36j
						  ; OnTick:EB_TurnNWImmediatep
		bsr.s	EB_SetDirNW
		bra.s	sub_17EF8
; End of function EB_TurnNW


; =============== S U B	R O U T	I N E =======================================


EB_SetDirCW:					  ; CODE XREF: OnTick+3Aj
						  ; EB_TurnCWp
		move.b	$00000004(a5),d0
		andi.b	#$3F,$00000004(a5)
		addi.b	#$40,d0
		andi.b	#$C0,d0
		or.b	d0,$00000004(a5)
		moveq	#$00000001,d0
		bra.w	LoadNextCmd
; End of function EB_SetDirCW


; =============== S U B	R O U T	I N E =======================================


EB_SetDirCCW:					  ; CODE XREF: OnTick+3Ej
						  ; EB_TurnCCWp
		move.b	$00000004(a5),d0
		andi.b	#$3F,$00000004(a5)
		subi.b	#$40,d0
		andi.b	#$C0,d0
		or.b	d0,$00000004(a5)
		moveq	#$00000001,d0
		bra.w	LoadNextCmd
; End of function EB_SetDirCCW


; =============== S U B	R O U T	I N E =======================================


EB_SetDirNE:					  ; CODE XREF: OnTick+42j
						  ; EB_TurnNEp
		andi.b	#$3F,$00000004(a5)
		moveq	#$00000001,d0
		bra.w	LoadNextCmd
; End of function EB_SetDirNE


; =============== S U B	R O U T	I N E =======================================


EB_SetDirSE:					  ; CODE XREF: OnTick+46j
						  ; EB_TurnSEp
		andi.b	#$3F,$00000004(a5)
		ori.b	#$40,$00000004(a5)
		moveq	#$00000001,d0
		bra.w	LoadNextCmd
; End of function EB_SetDirSE


; =============== S U B	R O U T	I N E =======================================


EB_SetDirSW:					  ; CODE XREF: OnTick+4Aj
						  ; EB_TurnSWp
		andi.b	#$3F,$00000004(a5)
		ori.b	#$80,$00000004(a5)
		moveq	#$00000001,d0
		bra.w	LoadNextCmd
; End of function EB_SetDirSW


; =============== S U B	R O U T	I N E =======================================


EB_SetDirNW:					  ; CODE XREF: OnTick+4Ej
						  ; EB_TurnNWp
		ori.b	#$C0,$00000004(a5)
		moveq	#$00000001,d0
		bra.w	LoadNextCmd
; End of function EB_SetDirNW

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR OnTick

EB_TurnRandomImmediate:				  ; CODE XREF: OnTick+76j
		bsr.s	EB_TurnRandom
		bra.w	ProcessNextCmd
; END OF FUNCTION CHUNK	FOR OnTick

; =============== S U B	R O U T	I N E =======================================


EB_TurnRandom:					  ; CODE XREF: OnTick+6Aj
						  ; OnTick:EB_TurnRandomImmediatep
		bsr.s	EB_SetDirRandom
		bra.w	sub_17EF8
; End of function EB_TurnRandom


; =============== S U B	R O U T	I N E =======================================


EB_SetDirRandom:				  ; CODE XREF: OnTick+6Ej
						  ; EB_TurnRandomp
		move.w	#$0100,d6
		jsr	(j_GenerateRandomNumber).l
		andi.b	#$C0,d7
		andi.b	#$3F,$00000004(a5)
		or.b	d7,$00000004(a5)
		moveq	#$00000001,d0
		bra.w	LoadNextCmd
; End of function EB_SetDirRandom

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR OnTick

EB_SetDir180Immediate:				  ; CODE XREF: OnTick+AEj
		bsr.s	EB_Turn180
		bra.w	ProcessNextCmd
; END OF FUNCTION CHUNK	FOR OnTick

; =============== S U B	R O U T	I N E =======================================


EB_Turn180:					  ; CODE XREF: OnTick+A6j
						  ; OnTick:EB_SetDir180Immediatep
		bsr.s	EB_SetDir180
		bsr.w	sub_17EF8
		rts
; End of function EB_Turn180


; =============== S U B	R O U T	I N E =======================================


EB_SetDir180:					  ; CODE XREF: OnTick+AAj
						  ; EB_Turn180p
		eori.b	#$80,$00000004(a5)
		moveq	#$00000001,d0
		bra.w	LoadNextCmd
; End of function EB_SetDir180

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR OnTick

EB_MakeVisible:					  ; CODE XREF: OnTick+52j
		andi.b	#$BF,$0000000C(a5)
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

EB_MakeInvisible:				  ; CODE XREF: OnTick+56j
		ori.b	#$40,$0000000C(a5)
		bra.w	ProcessNextCmdImmediately_1
; END OF FUNCTION CHUNK	FOR OnTick
; ---------------------------------------------------------------------------
SpeedTable:	dc.b $08,$04,$04,$04,$04,$04,$04,$04,$02,$02 ; DATA XREF: OnTick+786r
		dc.b $02,$02,$02,$02,$02,$02,$02,$02,$01,$01
		dc.b $01,$01,$01,$08,$08,$08,$08,$04,$04,$04
		dc.b $04,$04,$04,$04,$04,$04,$04,$04,$04,$04
		dc.b $02,$02,$02,$02,$02,$02,$02,$02,$02,$02
		dc.b $02,$02,$02,$01,$01,$01,$01,$FF
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR OnTick

EB_B10:						  ; CODE XREF: OnTick+5Aj
						  ; OnTick+D6j
		move.b	BehavParam(a5),d0
		addq.b	#$01,BehavParam(a5)
		cmpi.b	#$03,d0
		bcs.s	loc_1805E
		cmpi.b	#$17,d0
		bcs.s	loc_18082
		cmpi.b	#$1A,d0
		bcc.s	loc_18082

loc_1805E:					  ; CODE XREF: OnTick+752j
		btst	#$05,(Player_Action+1).l  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		beq.s	loc_18082
		move.w	(Player_HitBoxZEnd).l,d1
		addq.w	#$01,d1
		move.w	d1,Z(a5)
		clr.w	d7
		move.b	Height(a5),d7
		add.w	d7,d1
		subq.w	#$01,d1
		move.w	d1,HitBoxZEnd(a5)

loc_18082:					  ; CODE XREF: OnTick+758j
						  ; OnTick+75Ej ...
		ext.w	d0
		move.b	SpeedTable(pc,d0.w),d0
		move.b	d0,Speed(a5)
		bsr.w	sub_17B50
		bcc.w	loc_18128
		trap	#$00			  ; Trap00Handler
; END OF FUNCTION CHUNK	FOR OnTick
; ---------------------------------------------------------------------------
		dc.w SND_SpeakerPitch1
; ---------------------------------------------------------------------------
		tst.b	d7
		beq.s	loc_18108
		move.b	$0000000C(a0),d0
		andi.b	#$82,d0
		cmpi.b	#$80,d0
		bne.s	loc_18108
		btst	#$00,$00000038(a0)
		bne.s	loc_18108
		cmpi.w	#$0001,$00000078(a0)
		bne.s	loc_180C0
		tst.b	$00000036(a0)
		beq.s	loc_18108

loc_180C0:					  ; CODE XREF: ROM:000180B8j
		movem.l	a5,-(sp)
		move.b	$00000004(a5),d0
		andi.w	#$00C0,d0
		rol.b	#$02,d0
		addi.b	#$0A,d0
		cmpa.l	a0,a5
		bcs.s	loc_180DC
		bchg	#$06,$0000000C(a0)

loc_180DC:					  ; CODE XREF: ROM:000180D4j
		movea.l	a0,a5
		move.w	d0,$00000034(a5)
		jsr	(j_LoadSpriteBehaviour).l
		move.w	$0000007C(a5),d0
		bsr.w	CalculatePlayerDamageOutput
		sub.w	d0,$0000003E(a5)
		bhi.s	loc_180FC
		bsr.w	sub_16134
		bra.s	loc_18104
; ---------------------------------------------------------------------------

loc_180FC:					  ; CODE XREF: ROM:000180F4j
		bsr.w	sub_1602A
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_EnemyHit1
; ---------------------------------------------------------------------------

loc_18104:					  ; CODE XREF: ROM:000180FAj
		movem.l	(sp)+,a5

loc_18108:					  ; CODE XREF: ROM:0001809Aj
						  ; ROM:000180A8j ...
		cmpi.b	#SpriteB_Vase,SpriteGraphic(a5)
		bne.s	loc_18122
		bclr	#$05,Flags2(a5)
		move.w	#$0055,BehavParam(a5)
		clr.b	Speed(a5)
		rts
; ---------------------------------------------------------------------------

loc_18122:					  ; CODE XREF: ROM:0001810Ej
		eori.b	#$80,$00000004(a5)
; START	OF FUNCTION CHUNK FOR OnTick

loc_18128:					  ; CODE XREF: OnTick+792j
		cmpi.b	#$20,$0000002A(a5)
		bcc.s	loc_1819C
		cmpi.b	#$17,$0000002A(a5)
		bcc.s	loc_18140
		cmpi.b	#$09,$0000002A(a5)
		bcc.s	loc_1819C

loc_18140:					  ; CODE XREF: OnTick+838j
						  ; OnTick+8A8j
		cmpi.b	#$39,$0000002A(a5)
		bcc.s	loc_18150
		cmpi.b	#$17,$0000002A(a5)
		bne.s	locret_1819A

loc_18150:					  ; CODE XREF: OnTick+848j
						  ; OnTick+8A6j
		cmpi.b	#$10,$00000069(a5)
		beq.s	loc_1818A
		cmpi.b	#$16,$00000069(a5)
		beq.s	loc_1818A
		cmpi.b	#$2F,$00000069(a5)
		beq.s	loc_18190
		cmpi.b	#$32,$00000069(a5)
		beq.s	loc_1818A
		move.l	$0000005E(a5),$00000032(a5)
		move.b	$00000067(a5),$0000002A(a5)
		move.b	$00000069(a5),$0000002B(a5)
		move.b	$00000049(a5),$00000009(a5)
		rts
; ---------------------------------------------------------------------------

loc_1818A:					  ; CODE XREF: OnTick+858j
						  ; OnTick+860j ...
		clr.w	$0000002A(a5)
		bra.s	loc_18196
; ---------------------------------------------------------------------------

loc_18190:					  ; CODE XREF: OnTick+868j
		move.w	#$002E,$0000002A(a5)

loc_18196:					  ; CODE XREF: OnTick+890j
		clr.b	$00000009(a5)

locret_1819A:					  ; CODE XREF: OnTick+850j
		rts
; ---------------------------------------------------------------------------

loc_1819C:					  ; CODE XREF: OnTick+830j
						  ; OnTick+840j
		move.b	$0000002F(a5),d0
		andi.b	#$30,d0
		beq.s	loc_18150
		bra.s	loc_18140
; ---------------------------------------------------------------------------

EB_B16:						  ; CODE XREF: OnTick+72j
						  ; OnTick+E2j
		move.b	$0000002A(a5),d0
		addq.b	#$01,$0000002A(a5)
		tst.b	d0
		beq.s	loc_181C0
		bmi.s	locret_1820C
		move.b	$0000002F(a5),d0
		andi.b	#$30,d0
		beq.s	loc_181C6

loc_181C0:					  ; CODE XREF: OnTick+8B4j
		bsr.w	sub_17B50
		bcc.s	locret_1820C

loc_181C6:					  ; CODE XREF: OnTick+8C0j
		cmpi.b	#$10,$00000069(a5)
		beq.s	loc_18208
		cmpi.b	#$16,$00000069(a5)
		beq.s	loc_18208
		cmpi.b	#$2F,$00000069(a5)
		beq.s	loc_18208
		cmpi.b	#$32,$00000069(a5)
		beq.s	loc_18200
		move.l	$0000005E(a5),$00000032(a5)
		move.b	$00000067(a5),$0000002A(a5)
		move.b	$00000069(a5),$0000002B(a5)
		move.b	$00000049(a5),$00000009(a5)
		rts
; ---------------------------------------------------------------------------

loc_18200:					  ; CODE XREF: OnTick+8E6j
		move.w	#$002E,$0000002A(a5)
		rts
; ---------------------------------------------------------------------------

loc_18208:					  ; CODE XREF: OnTick+8CEj
						  ; OnTick+8D6j ...
		clr.w	$0000002A(a5)

locret_1820C:					  ; CODE XREF: OnTick+8B6j
						  ; OnTick+8C6j
		rts
; ---------------------------------------------------------------------------

EB_MoveUntilCollision:				  ; CODE XREF: OnTick+66j
		bsr.w	sub_17B50
		bcc.s	locret_18218
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

locret_18218:					  ; CODE XREF: OnTick+914j
		rts
; ---------------------------------------------------------------------------

EB_GoToInstruction:				  ; CODE XREF: OnTick+62j
		move.b	$0000002A(a5),d0
		ext.w	d0
		ext.l	d0
		bsr.w	LoadNextCmd
		bra.w	ProcessNextCmd
; ---------------------------------------------------------------------------

EB_Freeze:					  ; CODE XREF: OnTick+92j
		move.b	#$00,$00000009(a5)
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

EB_SetSpeed1:					  ; CODE XREF: OnTick+96j
		move.b	#$01,Speed(a5)
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

EB_SetSpeed2:					  ; CODE XREF: OnTick+9Aj
		move.b	#$02,Speed(a5)
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

EB_SetSpeed3:					  ; CODE XREF: OnTick+9Ej
		move.b	#$04,Speed(a5)
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

EB_SetSpeed4:					  ; CODE XREF: OnTick+A2j
		move.b	#$08,Speed(a5)
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

EB_B33:						  ; CODE XREF: OnTick+E6j
		subq.b	#$01,$0000002A(a5)
		beq.w	loc_18356
		move.w	$00000014(a5),d0
		move.w	$00000016(a5),d1
		sub.w	(Player_CentreX).l,d0
		beq.s	loc_18284
		bpl.s	loc_1827E
		neg.w	d0
		move.b	#$C0,d2
		bra.s	loc_18288
; ---------------------------------------------------------------------------

loc_1827E:					  ; CODE XREF: OnTick+976j
		move.b	#$40,d2
		bra.s	loc_18288
; ---------------------------------------------------------------------------

loc_18284:					  ; CODE XREF: OnTick+974j
		move.b	#$FF,d2

loc_18288:					  ; CODE XREF: OnTick+97Ej
						  ; OnTick+984j
		sub.w	(Player_CentreY).l,d1
		beq.s	loc_1829E
		bpl.s	loc_18298
		neg.w	d1
		clr.b	d3
		bra.s	loc_182A2
; ---------------------------------------------------------------------------

loc_18298:					  ; CODE XREF: OnTick+992j
		move.b	#$80,d3
		bra.s	loc_182A2
; ---------------------------------------------------------------------------

loc_1829E:					  ; CODE XREF: OnTick+990j
		move.b	#$FF,d3

loc_182A2:					  ; CODE XREF: OnTick+998j
						  ; OnTick+99Ej
		bra.w	loc_183C2
; ---------------------------------------------------------------------------

EB_SetTargetPosition:				  ; CODE XREF: OnTick+186j
		movea.l	BehaviourLUTPtr(a5),a6
		move.b	$00000001(a6),TargetX(a5)
		move.b	$00000002(a6),TargetY(a5)
		move.b	$00000003(a6),TargetSubX(a5)
		move.b	$00000004(a6),TargetSubY(a5)
		moveq	#$00000005,d0
		bsr.w	LoadNextCmd
		bra.w	ProcessNextCmd
; ---------------------------------------------------------------------------

EB_MoveToTargetPosition:			  ; CODE XREF: OnTick+18Aj
		move.w	TargetX(a5),d2
		move.w	TargetSubX(a5),d3
		move.w	CentreX(a5),d0
		move.w	CentreY(a5),d1
		andi.w	#$FFFC,d0
		andi.w	#$FFFC,d1
		andi.w	#$FFFC,d2
		andi.w	#$FFFC,d3
		cmp.w	d0,d2
		bne.s	loc_182F6
		cmp.w	d1,d3
		beq.w	ProcessNextCmdImmediately_1

loc_182F6:					  ; CODE XREF: OnTick+9F0j
		sub.w	d2,d0
		beq.s	loc_1830A
		bpl.s	loc_18304
		neg.w	d0
		move.b	#$40,d2
		bra.s	loc_1830E
; ---------------------------------------------------------------------------

loc_18304:					  ; CODE XREF: OnTick+9FCj
		move.b	#$C0,d2
		bra.s	loc_1830E
; ---------------------------------------------------------------------------

loc_1830A:					  ; CODE XREF: OnTick+9FAj
		move.b	#$FF,d2

loc_1830E:					  ; CODE XREF: OnTick+A04j
						  ; OnTick+A0Aj
		sub.w	d3,d1
		beq.s	loc_18320
		bpl.s	loc_1831C
		neg.w	d1
		move.b	#$80,d3
		bra.s	loc_18324
; ---------------------------------------------------------------------------

loc_1831C:					  ; CODE XREF: OnTick+A14j
		clr.b	d3
		bra.s	loc_18324
; ---------------------------------------------------------------------------

loc_18320:					  ; CODE XREF: OnTick+A12j
		move.b	#$FF,d3

loc_18324:					  ; CODE XREF: OnTick+A1Cj
						  ; OnTick+A20j
		move.b	$00000004(a5),d4
		andi.b	#$C0,d4
		beq.w	loc_1858C
		cmpi.b	#$80,d4
		bcs.w	loc_183EA
		beq.w	loc_1859E
		bra.w	loc_183D8
; ---------------------------------------------------------------------------

EB_FollowPlayerNoJump:				  ; CODE XREF: OnTick+CAj
		subq.b	#$01,BehavParam(a5)
		beq.s	loc_18356
		bsr.s	sub_18360
		bclr	#$07,JumpRate(a5)
		rts
; ---------------------------------------------------------------------------

EB_FollowPlayerWithJump:			  ; CODE XREF: OnTick+B2j
		subq.b	#$01,BehavParam(a5)
		bne.s	sub_18360

loc_18356:					  ; CODE XREF: OnTick+962j
						  ; OnTick+A46j
		bra.w	ProcessNextCmdImmediately_2
; ---------------------------------------------------------------------------

loc_1835A:					  ; CODE XREF: sub_18360+12Aj
						  ; sub_18360+2DEj
		moveq	#$00000002,d0
		bra.w	LoadNextCmd
; END OF FUNCTION CHUNK	FOR OnTick

; =============== S U B	R O U T	I N E =======================================


sub_18360:					  ; CODE XREF: OnTick+A48p
						  ; OnTick+A56j
		move.w	(Player_CentreX).l,d2
		move.w	(Player_CentreY).l,d3
		move.w	$00000014(a5),d0
		move.w	$00000016(a5),d1
		sub.w	d2,d0
		beq.s	loc_18388
		bpl.s	loc_18382
		neg.w	d0
		move.b	#$40,d2
		bra.s	loc_1838C
; ---------------------------------------------------------------------------

loc_18382:					  ; CODE XREF: sub_18360+18j
		move.b	#$C0,d2
		bra.s	loc_1838C
; ---------------------------------------------------------------------------

loc_18388:					  ; CODE XREF: sub_18360+16j
		move.b	#$FF,d2

loc_1838C:					  ; CODE XREF: sub_18360+20j
						  ; sub_18360+26j
		sub.w	d3,d1
		beq.s	loc_1839E
		bpl.s	loc_1839A
		neg.w	d1
		move.b	#$80,d3
		bra.s	loc_183A2
; ---------------------------------------------------------------------------

loc_1839A:					  ; CODE XREF: sub_18360+30j
		clr.b	d3
		bra.s	loc_183A2
; ---------------------------------------------------------------------------

loc_1839E:					  ; CODE XREF: sub_18360+2Ej
		move.b	#$FF,d3

loc_183A2:					  ; CODE XREF: sub_18360+38j
						  ; sub_18360+3Cj
		cmpi.b	#$0F,d0
		bhi.s	loc_183C2
		cmpi.b	#$0F,d1
		bhi.s	loc_183C2
		cmpi.b	#$FF,d2
		beq.s	loc_183B8
		eori.b	#$80,d2

loc_183B8:					  ; CODE XREF: sub_18360+52j
		cmpi.b	#$FF,d3
		beq.s	loc_183C2
		eori.b	#$80,d3

loc_183C2:					  ; CODE XREF: OnTick:loc_182A2j
						  ; sub_18360+46j ...
		move.b	$00000004(a5),d4
		andi.b	#$C0,d4
		beq.w	loc_1858C
		cmpi.b	#$80,d4
		bcs.s	loc_183EA
		beq.w	loc_1859E

loc_183D8:					  ; CODE XREF: OnTick+A3Ej
		cmpi.b	#$C0,d2
		beq.s	loc_183FC
		cmpi.b	#$40,d2
		beq.w	loc_18522
		bra.w	loc_18486
; ---------------------------------------------------------------------------

loc_183EA:					  ; CODE XREF: OnTick+A36j
						  ; sub_18360+72j
		cmpi.b	#$40,d2
		beq.s	loc_183FC
		cmpi.b	#$C0,d2
		beq.w	loc_18522
		bra.w	loc_18486
; ---------------------------------------------------------------------------

loc_183FC:					  ; CODE XREF: sub_18360+7Cj
						  ; sub_18360+8Ej
		bsr.w	sub_18748
		bcc.w	locret_18746
		tst.b	d7
		beq.s	loc_18418
		move.w	$00000054(a0),d7
		sub.w	$00000012(a5),d7
		cmpi.w	#$0010,d7
		bhi.s	loc_18440
		bra.s	loc_18428
; ---------------------------------------------------------------------------

loc_18418:					  ; CODE XREF: sub_18360+A6j
		andi.w	#$004F,d1
		move.w	$00000012(a5),d0
		lsr.w	#$04,d0
		addq.w	#$01,d0
		sub.w	d0,d1
		bne.s	loc_18440

loc_18428:					  ; CODE XREF: sub_18360+B6j
		btst	#$04,$0000002D(a5)
		bne.s	loc_18440
		btst	#$05,$0000002D(a5)
		bne.s	locret_1843E
		bset	#$07,$00000021(a5)

locret_1843E:					  ; CODE XREF: sub_18360+D6j
		rts
; ---------------------------------------------------------------------------

loc_18440:					  ; CODE XREF: sub_18360+B4j
						  ; sub_18360+C6j ...
		andi.b	#$80,d3
		andi.b	#$3F,$00000004(a5)
		or.b	d3,$00000004(a5)
		bsr.w	sub_18748
		bcc.w	locret_18746
		eori.b	#$80,d3
		andi.b	#$3F,$00000004(a5)
		andi.b	#$C0,d3
		or.b	d3,$00000004(a5)
		bsr.w	sub_18748
		bcc.w	locret_18746
		eori.b	#$80,d2
		andi.b	#$C0,d2
		andi.b	#$3F,$00000004(a5)
		or.b	d2,$00000004(a5)
		bra.w	sub_18748
; ---------------------------------------------------------------------------

loc_18486:					  ; CODE XREF: sub_18360+86j
						  ; sub_18360+98j
		cmpi.b	#$FF,d3
		beq.w	loc_1835A
		andi.b	#$3F,$00000004(a5)
		or.b	d3,$00000004(a5)
		bsr.w	sub_18748
		bcc.w	locret_18746
		tst.b	d7
		beq.s	loc_184B4
		move.w	$00000054(a0),d7
		sub.w	$00000012(a5),d7
		cmpi.w	#$0010,d7
		bhi.s	loc_184DC
		bra.s	loc_184C4
; ---------------------------------------------------------------------------

loc_184B4:					  ; CODE XREF: sub_18360+142j
		andi.w	#$004F,d1
		move.w	$00000012(a5),d0
		lsr.w	#$04,d0
		addq.w	#$01,d0
		sub.w	d0,d1
		bne.s	loc_184DC

loc_184C4:					  ; CODE XREF: sub_18360+152j
		btst	#$04,$0000002D(a5)
		bne.s	loc_184DC
		btst	#$05,$0000002D(a5)
		bne.s	locret_184DA
		bset	#$07,$00000021(a5)

locret_184DA:					  ; CODE XREF: sub_18360+172j
		rts
; ---------------------------------------------------------------------------

loc_184DC:					  ; CODE XREF: sub_18360+150j
						  ; sub_18360+162j ...
		andi.b	#$3F,$00000004(a5)
		or.b	d4,$00000004(a5)
		bsr.w	sub_18748
		bcc.w	locret_18746
		andi.b	#$3F,$00000004(a5)
		andi.b	#$C0,d3
		or.b	d3,$00000004(a5)
		eori.b	#$80,$00000004(a5)
		bsr.w	sub_18748
		bcc.w	locret_18746
		andi.b	#$3F,$00000004(a5)
		andi.b	#$C0,d4
		or.b	d4,$00000004(a5)
		eori.b	#$80,$00000004(a5)
		bra.w	sub_18748
; ---------------------------------------------------------------------------

loc_18522:					  ; CODE XREF: sub_18360+82j
						  ; sub_18360+94j
		cmpi.b	#$FF,d3
		bne.s	loc_18534
		move.b	(byte_FF0F9D).l,d3
		ror.b	#$02,d3
		andi.b	#$C0,d3

loc_18534:					  ; CODE XREF: sub_18360+1C6j
		andi.b	#$80,d3
		andi.b	#$3F,$00000004(a5)
		or.b	d3,$00000004(a5)
		bsr.w	sub_18748
		bcc.w	locret_18746
		andi.b	#$3F,$00000004(a5)
		andi.b	#$C0,d4
		or.b	d4,$00000004(a5)
		bsr.w	sub_18748
		bcc.w	locret_18746
		andi.b	#$3F,$00000004(a5)
		or.b	d4,$00000004(a5)
		eori.b	#$80,$00000004(a5)
		bsr.w	sub_18748
		bcc.w	locret_18746
		andi.b	#$3F,$00000004(a5)
		or.b	d3,$00000004(a5)
		eori.b	#$80,$00000004(a5)
		bra.w	sub_18748
; ---------------------------------------------------------------------------

loc_1858C:					  ; CODE XREF: OnTick+A2Ej
						  ; sub_18360+6Aj
		cmpi.b	#$00,d3
		beq.s	loc_185B0
		cmpi.b	#$80,d3
		beq.w	loc_186D6
		bra.w	loc_1863A
; ---------------------------------------------------------------------------

loc_1859E:					  ; CODE XREF: OnTick+A3Aj
						  ; sub_18360+74j
		cmpi.b	#$80,d3
		beq.s	loc_185B0
		cmpi.b	#$00,d3
		beq.w	loc_186D6
		bra.w	loc_1863A
; ---------------------------------------------------------------------------

loc_185B0:					  ; CODE XREF: sub_18360+230j
						  ; sub_18360+242j
		bsr.w	sub_18748
		bcc.w	locret_18746
		tst.b	d7
		beq.s	loc_185CC
		move.w	$00000054(a0),d7
		sub.w	$00000012(a5),d7
		cmpi.w	#$0010,d7
		bhi.s	loc_185F4
		bra.s	loc_185DC
; ---------------------------------------------------------------------------

loc_185CC:					  ; CODE XREF: sub_18360+25Aj
		andi.w	#$004F,d1
		move.w	$00000012(a5),d0
		lsr.w	#$04,d0
		addq.w	#$01,d0
		sub.w	d0,d1
		bne.s	loc_185F4

loc_185DC:					  ; CODE XREF: sub_18360+26Aj
		btst	#$04,$0000002D(a5)
		bne.s	loc_185F4
		btst	#$05,$0000002D(a5)
		bne.s	locret_185F2
		bset	#$07,$00000021(a5)

locret_185F2:					  ; CODE XREF: sub_18360+28Aj
		rts
; ---------------------------------------------------------------------------

loc_185F4:					  ; CODE XREF: sub_18360+268j
						  ; sub_18360+27Aj ...
		ori.b	#$40,d2
		andi.b	#$C0,d2
		andi.b	#$3F,$00000004(a5)
		or.b	d2,$00000004(a5)
		bsr.w	sub_18748
		bcc.w	locret_18746
		eori.b	#$80,d2
		andi.b	#$3F,$00000004(a5)
		or.b	d2,$00000004(a5)
		bsr.w	sub_18748
		bcc.w	locret_18746
		eori.b	#$80,d3
		andi.b	#$C0,d3
		andi.b	#$3F,$00000004(a5)
		or.b	d3,$00000004(a5)
		bra.w	sub_18748
; ---------------------------------------------------------------------------

loc_1863A:					  ; CODE XREF: sub_18360+23Aj
						  ; sub_18360+24Cj
		cmpi.b	#$FF,d2
		beq.w	loc_1835A
		andi.b	#$3F,$00000004(a5)
		or.b	d2,$00000004(a5)
		bsr.w	sub_18748
		bcc.w	locret_18746
		tst.b	d7
		beq.s	loc_18668
		move.w	$00000054(a0),d7
		sub.w	$00000012(a5),d7
		cmpi.w	#$0010,d7
		bhi.s	loc_18690
		bra.s	loc_18678
; ---------------------------------------------------------------------------

loc_18668:					  ; CODE XREF: sub_18360+2F6j
		andi.w	#$004F,d1
		move.w	$00000012(a5),d0
		lsr.w	#$04,d0
		addq.w	#$01,d0
		sub.w	d0,d1
		bne.s	loc_18690

loc_18678:					  ; CODE XREF: sub_18360+306j
		btst	#$04,$0000002D(a5)
		bne.s	loc_18690
		btst	#$05,$0000002D(a5)
		bne.s	locret_1868E
		bset	#$07,$00000021(a5)

locret_1868E:					  ; CODE XREF: sub_18360+326j
		rts
; ---------------------------------------------------------------------------

loc_18690:					  ; CODE XREF: sub_18360+304j
						  ; sub_18360+316j ...
		andi.b	#$3F,$00000004(a5)
		or.b	d4,$00000004(a5)
		bsr.w	sub_18748
		bcc.w	locret_18746
		andi.b	#$3F,$00000004(a5)
		andi.b	#$C0,d2
		or.b	d2,$00000004(a5)
		eori.b	#$80,$00000004(a5)
		bsr.w	sub_18748
		bcc.w	locret_18746
		andi.b	#$3F,$00000004(a5)
		andi.b	#$C0,d4
		or.b	d4,$00000004(a5)
		eori.b	#$80,$00000004(a5)
		bra.w	sub_18748
; ---------------------------------------------------------------------------

loc_186D6:					  ; CODE XREF: sub_18360+236j
						  ; sub_18360+248j
		cmpi.b	#$FF,d2
		bne.s	loc_186E8
		move.b	(byte_FF0F9D).l,d2
		ror.b	#$02,d2
		andi.b	#$C0,d2

loc_186E8:					  ; CODE XREF: sub_18360+37Aj
		ori.b	#$40,d2
		andi.b	#$3F,$00000004(a5)
		andi.b	#$C0,d2
		or.b	d2,$00000004(a5)
		bsr.w	sub_18748
		bcc.s	locret_18746
		andi.b	#$3F,$00000004(a5)
		andi.b	#$C0,d4
		or.b	d4,$00000004(a5)
		bsr.w	sub_18748
		bcc.s	locret_18746
		andi.b	#$3F,$00000004(a5)
		andi.b	#$C0,d4
		or.b	d4,$00000004(a5)
		eori.b	#$80,$00000004(a5)
		bsr.w	sub_18748
		bcc.s	locret_18746
		andi.b	#$3F,$00000004(a5)
		andi.b	#$C0,d2
		or.b	d2,$00000004(a5)
		eori.b	#$80,$00000004(a5)
		bra.w	sub_18748
; ---------------------------------------------------------------------------

locret_18746:					  ; CODE XREF: sub_18360+A0j
						  ; sub_18360+F2j ...
		rts
; End of function sub_18360


; =============== S U B	R O U T	I N E =======================================


sub_18748:					  ; CODE XREF: sub_18360:loc_183FCp
						  ; sub_18360+EEp ...
		movem.w	d2-d4,-(sp)
		bsr.w	sub_17B50
		movem.w	(sp)+,d2-d4
		rts
; End of function sub_18748

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR OnTick

EB_Jump:					  ; CODE XREF: OnTick+B6j
		bset	#$07,JumpRate(a5)
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

EB_EnableRotation:				  ; CODE XREF: OnTick+BAj
		bclr	#$00,Flags2(a5)
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

EB_DisableRotation:				  ; CODE XREF: OnTick+BEj
		bset	#$00,Flags2(a5)
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

EB_B2D:						  ; CODE XREF: OnTick+CEj
		tst.b	$0000000A(a5)
		bmi.w	locret_188C2
		move.w	$00000014(a5),d0
		move.w	d0,d2
		subi.w	#$0010,d0
		addi.w	#$0010,d2
		move.w	$00000016(a5),d1
		move.w	d1,d3
		subi.w	#$0010,d1
		addi.w	#$0010,d3
		move.w	$00000054(a5),d4
		addq.w	#$01,d4
		move.w	$00000012(a5),d5
		lea	(Player_X).l,a0
		moveq	#$0000000F,d7

loc_187AA:					  ; CODE XREF: OnTick+F7Aj
		cmp.w	$00000014(a0),d0
		bhi.w	loc_18872
		cmp.w	$00000014(a0),d2
		bcs.w	loc_18872
		cmp.w	$00000016(a0),d1
		bhi.w	loc_18872
		cmp.w	$00000016(a0),d3
		bcs.w	loc_18872
		cmp.w	$00000012(a0),d4
		bcs.w	loc_18872
		cmp.w	$00000054(a0),d5
		bhi.w	loc_18872
		cmpa.l	a0,a5
		beq.w	loc_18872
		tst.b	$0000000C(a0)
		bmi.s	loc_187F0
		cmpa.l	#Player_X,a0
		bne.w	loc_18872

loc_187F0:					  ; CODE XREF: OnTick+EE6j
		clr.w	d0
		move.b	$00000036(a5),d0
		bne.s	loc_18850
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_HealthRecover1
; ---------------------------------------------------------------------------
		cmpa.l	#Player_X,a0
		bne.w	loc_188BC
		move.b	ItemDrop(a5),d0
		jsr	(j_GetItemQtyAndMaxQty).l
		addq.b	#$01,d1
		bne.s	loc_18816
		addq.b	#$01,d1

loc_18816:					  ; CODE XREF: OnTick+F14j
		jsr	(j_GetItem).l
		ext.w	d0
		move.w	d0,(word_FF1196).l
		bne.s	loc_18832
		bsr.w	UpdateEkeEkeHUD
		bsr.w	MarkHUDForUpdate
		bsr.w	RefreshHUD

loc_18832:					  ; CODE XREF: OnTick+F26j
		jsr	(j_FlushDMACopyQueue).l
		jsr	(sub_22EE8).l
		move.w	#$0013,d0
		jsr	(j_PrintString).l
		jsr	(j_SetUpTextDisplay).l
		bra.s	loc_188BC
; ---------------------------------------------------------------------------

loc_18850:					  ; CODE XREF: OnTick+EF8j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_PickupMoney
; ---------------------------------------------------------------------------
		cmpa.l	#Player_X,a0
		beq.s	loc_1886A
		add.b	d0,$00000036(a0)
		bcc.s	loc_188BC
		move.b	#$FF,$00000036(a0)
		bra.s	loc_188BC
; ---------------------------------------------------------------------------

loc_1886A:					  ; CODE XREF: OnTick+F5Cj
		jsr	(j_AddGold).l
		bra.s	loc_188BC
; ---------------------------------------------------------------------------

loc_18872:					  ; CODE XREF: OnTick+EB0j
						  ; OnTick+EB8j ...
		lea	$00000080(a0),a0
		tst.b	(a0)
		dbmi	d7,loc_187AA
		addq.w	#$01,$0000003E(a5)
		move.w	$0000003E(a5),d0
		cmpi.w	#$00F0,d0
		bcs.s	locret_188C2
		bclr	#$06,$0000000C(a5)
		move.w	d0,d1
		andi.b	#$03,d1
		bne.s	loc_1889E
		bset	#$06,$0000000C(a5)

loc_1889E:					  ; CODE XREF: OnTick+F98j
		cmpi.w	#$0168,d0
		bcs.s	loc_188B6
		move.w	d0,d1
		andi.b	#$01,d1
		ror.b	#$02,d1
		andi.b	#$BF,$0000000C(a5)
		or.b	d1,$0000000C(a5)

loc_188B6:					  ; CODE XREF: OnTick+FA4j
		cmpi.w	#00420,d0
		bcs.s	locret_188C2

loc_188BC:					  ; CODE XREF: OnTick+F04j
						  ; OnTick+F50j ...
		jsr	(j_MoveSpriteOffscreen).l

locret_188C2:					  ; CODE XREF: OnTick+E7Aj
						  ; OnTick+F8Aj ...
		rts
; ---------------------------------------------------------------------------

EB_ShopItem:					  ; CODE XREF: OnTick+D2j
		btst	#$06,$00000008(a5)
		beq.s	loc_1891E
		move.b	(Player_Unk2F).l,d0
		andi.b	#$C0,d0
		cmpi.b	#$C0,d0
		bne.s	locret_1891C
		bset	#$03,$00000008(a5)
		bne.s	locret_1891C
		move.b	$00000036(a5),(byte_FF1903).l
		jsr	(sub_22EAC).l
		tst.b	(byte_FF1903).l
		bpl.s	loc_18914
		jsr	(j_MoveSpriteOffscreen).l
		subi.w	#$0010,(Player_HitBoxZEnd).l
		clr.b	(byte_FF1133).l
		clr.w	(g_CarriedEntity).l

loc_18914:					  ; CODE XREF: OnTick+FFAj
		move.b	#$60,(g_SwordButtonMask).l

locret_1891C:					  ; CODE XREF: OnTick+FDCj
						  ; OnTick+FE4j ...
		rts
; ---------------------------------------------------------------------------

loc_1891E:					  ; CODE XREF: OnTick+FCCj
		bclr	#$03,$00000008(a5)
		move.b	$00000023(a5),d0
		andi.b	#$3F,d0
		cmpi.b	#$0E,d0
		bne.s	loc_1896E
		btst	#$04,$0000002D(a5)
		bne.s	loc_1896E
		clr.w	d0
		move.b	$00000022(a5),d0
		lsl.b	#$04,d0
		cmp.w	$00000012(a5),d0
		bne.s	loc_1896E
		bset	#$07,$00000038(a5)
		bne.s	locret_1891C
		move.b	$00000036(a5),(byte_FF1903).l
		jsr	(sub_22EB0).l
		tst.b	(byte_FF1903).l
		bpl.s	locret_1896C
		jsr	(j_MoveSpriteOffscreen).l

locret_1896C:					  ; CODE XREF: OnTick+1066j
		rts
; ---------------------------------------------------------------------------

loc_1896E:					  ; CODE XREF: OnTick+1032j
						  ; OnTick+103Aj ...
		bclr	#$07,$00000038(a5)
		rts
; ---------------------------------------------------------------------------

MoveUpRelative:					  ; CODE XREF: OnTick+DAj
		bsr.s	sub_1899E
		bsr.s	sub_189F0
		bcs.s	sub_1898E

loc_1897C:					  ; CODE XREF: OnTick+10C4j
		bset	#$05,$0000002D(a5)

loc_18982:					  ; CODE XREF: OnTick+10C8j
		subq.b	#$01,$0000002A(a5)
		bne.s	locret_1899C
		moveq	#$00000002,d0
		bra.w	LoadNextCmd
; END OF FUNCTION CHUNK	FOR OnTick

; =============== S U B	R O U T	I N E =======================================


sub_1898E:					  ; CODE XREF: OnTick+107Cj
						  ; OnTick+10C6p ...
		clr.w	d0
		move.b	$00000009(a5),d0
		sub.w	d0,$00000012(a5)
		sub.w	d0,$00000054(a5)

locret_1899C:					  ; CODE XREF: OnTick+1088j
						  ; OnTick+1186j
		rts
; End of function sub_1898E


; =============== S U B	R O U T	I N E =======================================


sub_1899E:					  ; CODE XREF: OnTick:MoveUpRelativep
						  ; OnTick:EB_MoveUpTimedp ...
		clr.w	d0
		move.b	$00000009(a5),d0
		beq.s	loc_189B8
		add.w	d0,$00000054(a5)
		add.w	d0,$00000012(a5)
		bcc.s	locret_189B6
		bchg	#$06,$0000000C(a5)

locret_189B6:					  ; CODE XREF: sub_1899E+10j
		rts
; ---------------------------------------------------------------------------

loc_189B8:					  ; CODE XREF: sub_1899E+6j
		movem.l	(sp)+,d0
		rts
; End of function sub_1899E

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR OnTick

EB_MoveUpTimed:					  ; CODE XREF: OnTick+102j
		bsr.s	sub_1899E
		bsr.s	sub_189F0
		bcc.s	loc_1897C
		bsr.s	sub_1898E
		bra.s	loc_18982
; ---------------------------------------------------------------------------

MoveDownRelative:				  ; CODE XREF: OnTick+DEj
		bsr.s	sub_18A38
		bsr.s	sub_189F0
		bcs.s	sub_189E0

loc_189CE:					  ; CODE XREF: OnTick+115Ej
		bset	#$04,$0000002D(a5)

loc_189D4:					  ; CODE XREF: OnTick+1166j
		subq.b	#$01,$0000002A(a5)
		bne.s	locret_189EE
		moveq	#$00000002,d0
		bra.w	LoadNextCmd
; END OF FUNCTION CHUNK	FOR OnTick

; =============== S U B	R O U T	I N E =======================================


sub_189E0:					  ; CODE XREF: OnTick+10CEj
						  ; OnTick+1162p ...
		clr.w	d0
		move.b	$00000009(a5),d0
		add.w	d0,Z(a5)
		add.w	d0,$00000054(a5)

locret_189EE:					  ; CODE XREF: OnTick+10DAj
						  ; OnTick+11ACj
		rts
; End of function sub_189E0


; =============== S U B	R O U T	I N E =======================================


sub_189F0:					  ; CODE XREF: OnTick+107Ap
						  ; OnTick+10C2p ...
		move.l	a5,d0
		subi.l	#Player_X,d0
		jsr	(j_CollisionDetect).l
		bcc.s	loc_18A34
		tst.b	$0000000C(a5)
		bpl.s	loc_18A1E
		cmpa.l	#Player_X,a0
		bne.s	loc_18A24
		move.b	#$80,(byte_FF1143).l
		move.w	$0000003C(a5),(Player_AttackStrength).l

loc_18A1E:					  ; CODE XREF: sub_189F0+14j
						  ; sub_189F0+3Aj ...
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_18A24:					  ; CODE XREF: sub_189F0+1Cj
		cmpi.b	#$AC,$0000003B(a5)
		bne.s	loc_18A1E
		cmpi.b	#$AC,$0000003B(a0)
		bne.s	loc_18A1E

loc_18A34:					  ; CODE XREF: sub_189F0+Ej
		tst.b	d0
		rts
; End of function sub_189F0


; =============== S U B	R O U T	I N E =======================================


sub_18A38:					  ; CODE XREF: OnTick:MoveDownRelativep
						  ; OnTick:EB_MoveDownTimedp ...
		clr.w	d0
		move.b	$00000009(a5),d0
		beq.s	loc_18A52
		sub.w	d0,$00000054(a5)
		sub.w	d0,$00000012(a5)
		bcc.s	locret_18A50
		bchg	#$06,$0000000C(a5)

locret_18A50:					  ; CODE XREF: sub_18A38+10j
		rts
; ---------------------------------------------------------------------------

loc_18A52:					  ; CODE XREF: sub_18A38+6j
		movem.l	(sp)+,d0
		rts
; End of function sub_18A38

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR OnTick

EB_MoveDownTimed:				  ; CODE XREF: OnTick+106j
		bsr.s	sub_18A38
		bsr.s	sub_189F0
		bcc.w	loc_189CE
		bsr.w	sub_189E0
		bra.w	loc_189D4
; ---------------------------------------------------------------------------

EB_MoveUpAbsolute:				  ; CODE XREF: OnTick+10Aj
		bsr.w	sub_1899E
		bsr.s	sub_189F0
		bcs.w	sub_1898E
		bset	#$05,$0000002D(a5)
		move.w	$00000012(a5),d0
		clr.w	d1
		move.b	$0000002A(a5),d1
		cmp.w	d1,d0
		bcs.w	locret_1899C
		moveq	#$00000002,d0
		bra.w	LoadNextCmd
; ---------------------------------------------------------------------------

EB_MoveDownAbsolute:				  ; CODE XREF: OnTick+10Ej
		bsr.s	sub_18A38
		bsr.w	sub_189F0
		bcs.w	sub_189E0
		bset	#$04,$0000002D(a5)
		move.w	$00000012(a5),d0
		clr.w	d1
		move.b	$0000002A(a5),d1
		cmp.w	d1,d0
		bhi.w	locret_189EE
		moveq	#$00000002,d0
		bra.w	LoadNextCmd
; ---------------------------------------------------------------------------

EB_NudgeUp:					  ; CODE XREF: OnTick+116j
		bsr.w	sub_1899E
		bsr.w	sub_189F0
		bcc.s	loc_18AC8
		bsr.w	sub_1898E
		moveq	#$00000001,d0
		bra.w	LoadNextCmd
; ---------------------------------------------------------------------------

loc_18AC8:					  ; CODE XREF: OnTick+11BEj
		bset	#$05,$0000002D(a5)
		rts
; ---------------------------------------------------------------------------

EB_MoveDownUntilCollision:			  ; CODE XREF: OnTick+11Aj
		bsr.s	sub_18ADC
		bcc.s	locret_18ADA
		moveq	#$00000001,d0
		bra.w	LoadNextCmd
; ---------------------------------------------------------------------------

locret_18ADA:					  ; CODE XREF: OnTick+11D4j
		rts
; END OF FUNCTION CHUNK	FOR OnTick

; =============== S U B	R O U T	I N E =======================================


sub_18ADC:					  ; CODE XREF: OnTick:EB_MoveDownUntilCollisionp
						  ; OnTick+16A8p
		movea.l	a5,a0
		move.w	$00000012(a0),d7
		jsr	(sub_3C8).l
		clr.w	d0
		move.b	$00000009(a5),d0
		sub.w	d0,$00000054(a5)
		sub.w	d0,$00000012(a5)
		bcs.s	loc_18B06
		movem.w	d4,-(sp)
		jsr	sub_189F0(pc)
		bcc.s	loc_18B10
		movem.w	(sp)+,d4

loc_18B06:					  ; CODE XREF: sub_18ADC+1Aj
						  ; sub_18ADC+3Cj
		bsr.w	sub_189E0
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_18B10:					  ; CODE XREF: sub_18ADC+24j
		movem.w	(sp)+,d4
		cmp.w	$00000012(a5),d4
		bhi.s	loc_18B06
		bset	#$04,$0000002D(a5)
		tst.b	d0
		rts
; End of function sub_18ADC

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR OnTick

EB_PlaybackInput:				  ; CODE XREF: OnTick+EAj
		move.b	$0000002A(a5),d0
		jsr	(PlaybackInput).l
		bra.w	ProcessNextCmdImmediately_2
; ---------------------------------------------------------------------------

EB_ResetPlayback:				  ; CODE XREF: OnTick+EEj
		clr.w	(g_ControllerPlayback).l
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

EB_Pause4s:					  ; CODE XREF: OnTick+F6j
		move.b	#$09,d0
		jsr	(PlaybackInput).l
		clr.w	(Player_Action).l	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

EB_WaitForCondition:				  ; CODE XREF: OnTick+F2j
		move.b	BehavParam(a5),d0
		jsr	(ProcessTriggerAction).l
		bcc.s	locret_18B60
		bra.w	ProcessNextCmdImmediately_2
; ---------------------------------------------------------------------------

locret_18B60:					  ; CODE XREF: OnTick+125Cj
		rts
; ---------------------------------------------------------------------------

EB_EnableGravity:				  ; CODE XREF: OnTick+FAj
		bclr	#$07,FallRate(a5)
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

EB_DisableGravity:				  ; CODE XREF: OnTick+FEj
		bset	#$07,FallRate(a5)
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

EB_SetFlag:					  ; CODE XREF: OnTick+11Ej
		bsr.s	sub_18B86
		bset	d7,(a6,d6.w)

loc_18B7C:					  ; CODE XREF: OnTick+12A4j
						  ; OnTick+12ACj ...
		moveq	#$00000003,d0
		bsr.w	LoadNextCmd
		bra.w	ProcessNextCmd
; END OF FUNCTION CHUNK	FOR OnTick

; =============== S U B	R O U T	I N E =======================================


sub_18B86:					  ; CODE XREF: OnTick:EB_SetFlagp
						  ; OnTick:EB_ClearFlagp ...
		clr.w	d6
		move.b	$0000002A(a5),d6
		movea.l	$00000032(a5),a6
		move.b	$00000002(a6),d7
		lea	(g_Flags).l,a6
		rts
; End of function sub_18B86

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR OnTick

EB_ClearFlag:					  ; CODE XREF: OnTick+126j
		bsr.s	sub_18B86
		bclr	d7,(a6,d6.w)
		bra.s	loc_18B7C
; ---------------------------------------------------------------------------

EB_WaitForFlagSet:				  ; CODE XREF: OnTick+122j
		bsr.s	sub_18B86
		btst	d7,(a6,d6.w)
		bne.s	loc_18B7C
		rts
; ---------------------------------------------------------------------------

EB_WaitForFlagClear:				  ; CODE XREF: OnTick+132j
		bsr.s	sub_18B86
		btst	d7,(a6,d6.w)
		beq.s	loc_18B7C
		rts
; ---------------------------------------------------------------------------

EB_Hide:					  ; CODE XREF: OnTick+12Aj
		bset	#$00,$00000008(a5)
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

EB_ShowWhenCollisionClear:			  ; CODE XREF: OnTick+12Ej
		move.l	a5,d0
		subi.l	#Player_X,d0
		jsr	(j_CheckForCollision).l
		bcs.s	locret_18BDC
		bclr	#$00,$00000008(a5)
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

locret_18BDC:					  ; CODE XREF: OnTick+12D2j
		rts
; ---------------------------------------------------------------------------

EB_B47:						  ; CODE XREF: OnTick+136j
		clr.w	d0
		move.b	$0000002A(a5),d0
		lsl.w	#$07,d0
		lea	(Sprite1_X).l,a6
		tst.b	$0000000C(a6,d0.w)
		bmi.s	locret_18BF6
		bra.w	ProcessNextCmdImmediately_2
; ---------------------------------------------------------------------------

locret_18BF6:					  ; CODE XREF: OnTick+12F2j
		rts
; ---------------------------------------------------------------------------

EB_SetEntityAction:				  ; CODE XREF: OnTick+13Aj
		clr.w	d0
		move.b	$0000002A(a5),d0
		movea.l	$00000032(a5),a6
		move.b	$00000002(a6),d7
		lsl.w	#$07,d0
		lea	(Sprite1_X).l,a6
		move.b	d7,Speed(a6,d0.w)
		moveq	#$00000003,d0
		bsr.w	LoadNextCmd
		bra.w	ProcessNextCmd
; ---------------------------------------------------------------------------

EB_ActivateSwitch:				  ; CODE XREF: OnTick+13Ej
		bsr.w	EB_TurnSW
		bsr.w	sub_17F0A
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Switch
; ---------------------------------------------------------------------------
		bra.w	ProcessNextCmd
; ---------------------------------------------------------------------------

EB_ResetSwitch:					  ; CODE XREF: OnTick+142j
		bsr.w	EB_TurnNE
		bsr.w	sub_17F0A
		bra.w	ProcessNextCmd
; ---------------------------------------------------------------------------

EB_MoveToXYPosImmediate:			  ; CODE XREF: OnTick+146j
		move.b	$0000002A(a5),(a5)
		movea.l	$00000032(a5),a6
		move.b	$00000002(a6),$00000001(a5)
		movea.l	a5,a1
		jsr	(sub_19AC8).l
		moveq	#$00000003,d0
		bsr.w	LoadNextCmd
		bra.w	ProcessNextCmd
; ---------------------------------------------------------------------------

EB_MoveToZPosImmediate:				  ; CODE XREF: OnTick+14Aj
		clr.w	d0
		move.b	$0000002A(a5),d0
		move.w	d0,$00000012(a5)
		movea.l	a5,a1
		bsr.w	sub_19AC8
		bra.w	ProcessNextCmdImmediately_2
; ---------------------------------------------------------------------------

EB_ResetToInitParams:				  ; CODE XREF: OnTick+14Ej
		move.w	InitX(a5),X(a5)
		move.w	InitSubX(a5),SubX(a5)
		move.w	InitRotAndSize(a5),RotationAndSize(a5)
		andi.b	#$1F,TileSource(a5)
		move.b	InitTileSource(a5),d0
		or.b	d0,TileSource(a5)
		move.w	InitUnk0A(a5),Unk0A(a5)
		move.b	InitFlags2(a5),Flags2(a5)
		move.w	InitZ(a5),Z(a5)
		move.b	InitGoldOrChestCont(a5),GoldOrChestContents(a5)
		move.b	Unk68(a5),Flags4(a5)	  ; Bit	0 = Invincible / Solid
		move.w	InitDialogue(a5),Dialogue(a5)
		move.w	MaxHealth(a5),CurrentHealth(a5)
		clr.b	ChestIndex(a5)
		movea.l	a5,a1
		jsr	(LookupSpriteAnimFlags).l
		jsr	(sub_19AC8).l
		jsr	(sub_3BC).l
		bcc.s	loc_18CD6
		bset	#$00,Flags1(a5)
		rts
; ---------------------------------------------------------------------------

loc_18CD6:					  ; CODE XREF: OnTick+13CEj
		bclr	#$00,Flags1(a5)
		clr.w	QueuedAction(a5)
		move.w	#$FFFF,PrevAction(a5)
		clr.w	AnimationFrame(a5)
		clr.w	AnimationIndex(a5)
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

EB_StartHiCutscene:				  ; CODE XREF: OnTick+1AAj
		move.w	#$0100,d0
		move.b	BehavParam(a5),d0
		bra.s	loc_18D02
; ---------------------------------------------------------------------------

EB_TriggerCutscene:				  ; CODE XREF: OnTick+152j
		clr.w	d0
		move.b	BehavParam(a5),d0

loc_18D02:					  ; CODE XREF: OnTick+13FCj
		movem.l	a5,-(sp)
		bsr.w	ProcessDialogueScriptAction
		movem.l	(sp)+,a5
		bra.w	ProcessNextCmdImmediately_2
; ---------------------------------------------------------------------------

EB_RotatePlayer:				  ; CODE XREF: OnTick+15Aj
		move.b	BehavParam(a5),d0
		lsl.b	#$06,d0
		lea	(Player_X).l,a0
		andi.b	#$3F,RotationAndSize(a0)
		or.b	d0,RotationAndSize(a0)
		ori.b	#$80,Unk0A(a0)
		movem.l	a5,-(sp)
		jsr	(sub_3FE).l
		jsr	(j_LoadSprites).l
		movem.l	(sp)+,a5
		bra.w	ProcessNextCmdImmediately_2
; ---------------------------------------------------------------------------

EB_MakeHostile:					  ; CODE XREF: OnTick+15Ej
		bset	#$07,Flags2(a5)
		bset	#$07,InitFlags2(a5)
		movea.l	a5,a1
		bsr.w	GetEnemyStats		  ; sprite type
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

EB_MakeNonHostile:				  ; CODE XREF: OnTick+162j
		bclr	#$07,Flags2(a5)
		bclr	#$07,InitFlags2(a5)
		bra.w	ProcessNextCmdImmediately_1
; END OF FUNCTION CHUNK	FOR OnTick

; =============== S U B	R O U T	I N E =======================================

; Attributes: thunk

j_j_HideSprite:					  ; CODE XREF: OnTick+112j
						  ; OnTick+1592p ...
		jmp	(j_HideSprite).l
; End of function j_j_HideSprite

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR OnTick

EB_LoadSpecialAI:				  ; CODE XREF: OnTick+C6j
		jmp	(sub_1A440C).l
; ---------------------------------------------------------------------------

EB_EnableWalkBackwards:				  ; CODE XREF: OnTick+166j
		bclr	#$01,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

EB_DisableWalkBackwards:			  ; CODE XREF: OnTick+16Aj
		bset	#$01,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bra.w	ProcessNextCmdImmediately_1
; ---------------------------------------------------------------------------

EB_SpecialAnimation:				  ; CODE XREF: OnTick+16Ej
		move.b	BehavParam(a5),d0
		addq.b	#$01,BehavParam(a5)
		tst.b	d0
		bne.s	loc_18DAE
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Thud
; ---------------------------------------------------------------------------
		move.w	#$0008,AnimationIndex(a5)
		clr.w	AnimationFrame(a5)
		bset	#$07,Unk48(a5)
		rts
; ---------------------------------------------------------------------------

loc_18DAE:					  ; CODE XREF: OnTick+1498j
		cmpi.b	#$0A,d0
		bne.s	loc_18DC8
		move.w	#$0008,AnimationIndex(a5)
		move.w	#$0004,AnimationFrame(a5)
		bset	#$07,Unk48(a5)
		rts
; ---------------------------------------------------------------------------

loc_18DC8:					  ; CODE XREF: OnTick+14B4j
		cmpi.b	#$14,d0
		bcs.s	locret_18E02
		bne.s	loc_18DF0
		move.w	#$0008,AnimationIndex(a5)
		move.w	#$0008,AnimationFrame(a5)
		bset	#$07,Unk48(a5)
		subi.w	#$000C,HitBoxZEnd(a5)
		subi.b	#$0C,Height(a5)
		rts
; ---------------------------------------------------------------------------

loc_18DF0:					  ; CODE XREF: OnTick+14D0j
		bchg	#$06,Flags2(a5)
		cmpi.b	#$1E,d0
		bcs.s	locret_18E02
		jmp	(j_HideSprite).l
; ---------------------------------------------------------------------------

locret_18E02:					  ; CODE XREF: OnTick+14CEj
						  ; OnTick+14FCj
		rts
; ---------------------------------------------------------------------------

EB_MoveUpToInitPos:				  ; CODE XREF: OnTick+172j
		bsr.w	sub_1899E
		bsr.w	sub_189F0
		bcs.w	loc_18E28
		bset	#$05,Action1(a5)
		move.w	Z(a5),d0
		cmp.w	InitZ(a5),d0
		bcs.w	locret_18E36
		moveq	#$00000001,d0
		bra.w	LoadNextCmd
; ---------------------------------------------------------------------------

loc_18E28:					  ; CODE XREF: OnTick+150Ej
		clr.w	d0
		move.b	Speed(a5),d0
		add.w	d0,Z(a5)
		add.w	d0,HitBoxZEnd(a5)

locret_18E36:					  ; CODE XREF: OnTick+1520j
		rts
; ---------------------------------------------------------------------------

EB_TriggerTileSwap:				  ; CODE XREF: OnTick+176j
		movem.l	a5,-(sp)
		move.b	BehavParam(a5),d0
		lsl.b	#$03,d0
		jsr	(j_DoTileSwap).l
		jsr	(j_EnableDMAQueueProcessing).l
		movem.l	(sp)+,a5
		bra.w	ProcessNextCmdImmediately_2
; ---------------------------------------------------------------------------

EB_PrintText:					  ; CODE XREF: OnTick+17Ej
		jsr	(j_ReloadTextbox).l
		move.b	BehavParam(a5),d0
		lsl.w	#$08,d0
		movea.l	BehaviourLUTPtr(a5),a6
		move.b	SubX(a6),d0
		jsr	(j_PrintString_0).l
		moveq	#$00000003,d0
		bsr.w	LoadNextCmd
		bra.w	ProcessNextCmd
; ---------------------------------------------------------------------------

EB_B5A:						  ; CODE XREF: OnTick+182j
		bsr.w	sub_17B50
		bcs.s	loc_18E8C
		subq.b	#$01,BehavParam(a5)
		bne.s	locret_18E8A
		bra.w	ProcessNextCmdImmediately_2
; ---------------------------------------------------------------------------

locret_18E8A:					  ; CODE XREF: OnTick+1586j
		rts
; ---------------------------------------------------------------------------

loc_18E8C:					  ; CODE XREF: OnTick+1580j
		movem.l	d7-a0,-(sp)
		bsr.w	j_j_HideSprite
		movem.l	(sp)+,d7-a0
		tst.b	d7
		bpl.s	locret_18EDC
		movea.l	a0,a5
		btst	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bne.s	locret_18EDC
		move.b	Flags2(a5),d0
		andi.b	#$82,d0
		cmpi.b	#$80,d0
		bne.s	locret_18EDC
		move.w	Defence(a5),d0
		bsr.w	CalculatePlayerDamageOutput
		sub.w	d0,CurrentHealth(a5)
		bhi.s	loc_18EC8
		bsr.w	sub_16134
		bra.s	locret_18EDC
; ---------------------------------------------------------------------------

loc_18EC8:					  ; CODE XREF: OnTick+15C2j
		bsr.w	sub_1602A
		move.w	#$013E,BehaviourLUTIndex(a5)
		jsr	(j_LoadSpriteBehaviour).l
		trap	#$00			  ; Trap00Handler
; END OF FUNCTION CHUNK	FOR OnTick
; ---------------------------------------------------------------------------
		dc.w SND_EnemyHit1
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR OnTick

locret_18EDC:					  ; CODE XREF: OnTick+159Cj
						  ; OnTick+15A6j ...
		rts
; ---------------------------------------------------------------------------

EB_B63:						  ; CODE XREF: OnTick+1A6j
		bsr.w	sub_17B50
		bcs.s	loc_18EF0

loc_18EE4:					  ; CODE XREF: OnTick+15FEj
		subq.b	#$01,BehavParam(a5)
		bne.s	locret_18EEE
		bra.w	ProcessNextCmdImmediately_2
; ---------------------------------------------------------------------------

locret_18EEE:					  ; CODE XREF: OnTick+15EAj
		rts
; ---------------------------------------------------------------------------

loc_18EF0:					  ; CODE XREF: OnTick+15E4j
						  ; OnTick+1640j
		tst.b	d7
		beq.s	loc_18EFE
		move.b	SpriteType(a5),d0
		cmp.b	SpriteType(a0),d0
		beq.s	loc_18EE4

loc_18EFE:					  ; CODE XREF: OnTick+15F4j
		movem.l	d7-a0,-(sp)
		bsr.w	j_j_HideSprite
		movem.l	(sp)+,d7-a0
		rts
; END OF FUNCTION CHUNK	FOR OnTick
; ---------------------------------------------------------------------------
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR OnTick

EB_B65:						  ; CODE XREF: OnTick+1AEj
		bsr.w	sub_17B50
		bcs.s	loc_18F2E

loc_18F18:					  ; CODE XREF: OnTick+163Cj
		bsr.s	sub_18F40
		bsr.w	sub_17B50
		bcs.s	loc_18F2E
		bsr.s	sub_18F58
		subq.b	#$01,BehavParam(a5)
		bne.s	locret_18F2C
		bra.w	ProcessNextCmdImmediately_2
; ---------------------------------------------------------------------------

locret_18F2C:					  ; CODE XREF: OnTick+1628j
		rts
; ---------------------------------------------------------------------------

loc_18F2E:					  ; CODE XREF: OnTick+1618j
						  ; OnTick+1620j ...
		tst.b	d7
		beq.s	loc_18F3C
		move.b	SpriteType(a5),d0
		cmp.b	SpriteType(a0),d0
		beq.s	loc_18F18

loc_18F3C:					  ; CODE XREF: OnTick+1632j
		bsr.s	sub_18F58
		bra.s	loc_18EF0
; END OF FUNCTION CHUNK	FOR OnTick

; =============== S U B	R O U T	I N E =======================================


sub_18F40:					  ; CODE XREF: OnTick:loc_18F18p
						  ; OnTick+1680p ...
		move.b	RotationAndSize(a5),d0
		addi.b	#$40,d0
		andi.b	#$C0,d0
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d0,RotationAndSize(a5)
		rts
; End of function sub_18F40


; =============== S U B	R O U T	I N E =======================================


sub_18F58:					  ; CODE XREF: OnTick+1622p
						  ; OnTick:loc_18F3Cp ...
		move.b	RotationAndSize(a5),d0
		subi.b	#$40,d0
		andi.b	#$C0,d0
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d0,RotationAndSize(a5)
		rts
; End of function sub_18F58

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR OnTick

EB_B66:						  ; CODE XREF: OnTick+1B2j
		bsr.w	sub_17B50
		bcs.s	loc_18F8C

loc_18F76:					  ; CODE XREF: OnTick+169Aj
		bsr.s	sub_18F58
		bsr.w	sub_17B50
		bcs.s	loc_18F8C
		bsr.s	sub_18F40
		subq.b	#$01,BehavParam(a5)
		bne.s	locret_18F8A
		bra.w	ProcessNextCmdImmediately_2
; ---------------------------------------------------------------------------

locret_18F8A:					  ; CODE XREF: OnTick+1686j
		rts
; ---------------------------------------------------------------------------

loc_18F8C:					  ; CODE XREF: OnTick+1676j
						  ; OnTick+167Ej
		tst.b	d7
		beq.s	loc_18F9A
		move.b	SpriteType(a5),d0
		cmp.b	SpriteType(a0),d0
		beq.s	loc_18F76

loc_18F9A:					  ; CODE XREF: OnTick+1690j
		bsr.s	sub_18F40
		bra.s	loc_18F2E
; ---------------------------------------------------------------------------

EB_B67:						  ; CODE XREF: OnTick+1B6j
		bsr.w	sub_17B50
		bcs.w	loc_18FB2
		bsr.w	sub_18ADC
		bcs.w	loc_18FC0
		rts
; ---------------------------------------------------------------------------

locret_18FB0:					  ; CODE XREF: OnTick+16C0j
		rts
; ---------------------------------------------------------------------------

loc_18FB2:					  ; CODE XREF: OnTick+16A4j
		tst.b	d7
		beq.s	loc_18FC0
		move.b	SpriteType(a5),d0
		cmp.b	SpriteType(a0),d0
		beq.s	locret_18FB0

loc_18FC0:					  ; CODE XREF: OnTick+16ACj
						  ; OnTick+16B6j
		movem.l	d7-a0,-(sp)
		bsr.w	j_j_HideSprite
		movem.l	(sp)+,d7-a0
		rts
; END OF FUNCTION CHUNK	FOR OnTick
; ---------------------------------------------------------------------------
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR OnTick

EB_RepeatBegin:					  ; CODE XREF: OnTick+18Ej
		move.b	BehavParam(a5),d0
		beq.s	loc_18FDE
		move.b	d0,RepeatCount(a5)

loc_18FDE:					  ; CODE XREF: OnTick+16DAj
		movea.l	BehaviourLUTPtr(a5),a0
		addq.l	#$02,a0
		move.l	a0,RepeatPtr(a5)
		bra.w	ProcessNextCmdImmediately_2
; ---------------------------------------------------------------------------

EB_B5E:						  ; CODE XREF: OnTick+192j
		subq.b	#$01,RepeatCount(a5)
		beq.w	ProcessNextCmdImmediately_1
		move.l	RepeatPtr(a5),BehaviourLUTPtr(a5)
		moveq	#$00000000,d0
		bsr.w	LoadNextCmd
		bra.w	ProcessNextCmd
; ---------------------------------------------------------------------------

EB_DecayFlash:					  ; CODE XREF: OnTick+196j
						  ; OnTick+1778j ...
		addq.b	#$01,BehavParam(a5)
		lea	byte_19030(pc),a0

loc_1900C:					  ; CODE XREF: OnTick+171Aj
		move.b	(a0)+,d0
		cmpi.b	#$FF,d0
		beq.s	locret_1902E
		cmp.b	BehavParam(a5),d0
		bne.s	loc_1900C
		bchg	#$06,Flags2(a5)
		cmpi.b	#$FF,$00000001(a0)
		bne.s	locret_1902E
		moveq	#$00000002,d0
		bra.w	LoadNextCmd
; ---------------------------------------------------------------------------

locret_1902E:					  ; CODE XREF: OnTick+1714j
						  ; OnTick+1728j
		rts
; END OF FUNCTION CHUNK	FOR OnTick
; ---------------------------------------------------------------------------
byte_19030:	dc.b $08,$09,$10,$11,$17,$18,$1D,$1E,$22,$23,$26,$27,$29,$2A,$2B
						  ; DATA XREF: OnTick+170At
		dc.b $2D,$2E,$31,$32,$36,$37,$3C,$3D,$43,$44,$4B,$4C,$54,$FF,$FF
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR OnTick

EB_FlashSpinAppear:				  ; CODE XREF: OnTick+19Aj
		move.b	BehavParam(a5),d0
		move.b	#$00,d1
		cmpi.b	#$2C,d0
		bcs.s	loc_19074
		move.b	#$01,d1
		cmpi.b	#$3C,d0
		bcs.s	loc_19074
		move.b	#$03,d1
		cmpi.b	#$46,d0
		bcs.s	loc_19074
		move.b	#$07,d1

loc_19074:					  ; CODE XREF: OnTick+175Cj
						  ; OnTick+1766j ...
		and.b	d1,d0
		bne.w	EB_DecayFlash
		move.b	RotationAndSize(a5),d1
		addi.b	#$40,d1
		andi.b	#$C0,d1
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d1,RotationAndSize(a5)
		movea.l	a5,a1
		bsr.w	SetSpriteRotationAnimFlags
		bset	#$07,Unk48(a5)
		bra.w	EB_DecayFlash
; ---------------------------------------------------------------------------

EB_FlashSpinDisappear:				  ; CODE XREF: OnTick+19Ej
		move.b	BehavParam(a5),d0
		move.b	#$07,d1
		cmpi.b	#$2C,d0
		bcs.s	loc_19074
		move.b	#$03,d1
		cmpi.b	#$3C,d0
		bcs.s	loc_19074
		move.b	#$01,d1
		cmpi.b	#$46,d0
		bcs.s	loc_19074
		move.b	#$00,d1
		bra.s	loc_19074
; ---------------------------------------------------------------------------

EB_PlaySound:					  ; CODE XREF: OnTick+1A2j
		move.b	BehavParam(a5),d0
		trap	#$00			  ; Trap00Handler
; END OF FUNCTION CHUNK	FOR OnTick
; ---------------------------------------------------------------------------
		dc.w SND_LoadFromD0
; ---------------------------------------------------------------------------
		bra.w	ProcessNextCmdImmediately_2

; =============== S U B	R O U T	I N E =======================================


sub_190D4:					  ; DATA XREF: sub_103D8t
		lea	(Sprite1_X).l,a5
		moveq	#$0000000E,d7

loc_190DC:					  ; CODE XREF: sub_190D4+3Aj
		move.b	(a5),d0
		bmi.s	locret_19112
		cmpi.b	#$7F,d0
		beq.s	loc_1910A
		bset	#$03,QueuedAction(a5)
		movem.l	d7/a5,-(sp)
		movem.l	a5,-(sp)
		bsr.w	sub_19114
		movem.l	(sp)+,a5
		bsr.w	sub_1917E
		movem.l	(sp)+,d7/a5
		bclr	#$03,QueuedAction(a5)

loc_1910A:					  ; CODE XREF: sub_190D4+10j
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,loc_190DC

locret_19112:					  ; CODE XREF: sub_190D4+Aj
		rts
; End of function sub_190D4


; =============== S U B	R O U T	I N E =======================================


sub_19114:					  ; CODE XREF: sub_190D4+20p
		bsr.w	sub_19206
		move.w	SpriteUnderneath(a5),d0	  ; Sprite under current sprite
		bmi.s	locret_1917C
		btst	#$02,Flags2(a5)		  ; Frictionless
		bne.s	locret_1917C
		lea	(Player_X).l,a0
		adda.w	d0,a0			  ; Sprite underneath
		move.b	Speed(a0),d0		  ; Speed
		andi.b	#$0F,d0
		beq.s	locret_1917C		  ; Non-zero speed to continue
		move.b	Speed(a5),d1
		movem.w	d1,-(sp)
		bsr.s	sub_1914C
		movem.w	(sp)+,d1
		move.b	d1,Speed(a5)
		rts
; End of function sub_19114


; =============== S U B	R O U T	I N E =======================================


sub_1914C:					  ; CODE XREF: sub_19114+2Cp

; FUNCTION CHUNK AT 00017B70 SIZE 000000BC BYTES
; FUNCTION CHUNK AT 00017CAA SIZE 0000022A BYTES

		move.b	d0,Speed(a5)
		move.b	Action1(a0),d1		  ; Direction of travel
		move.b	#$09,d0
		lsr.b	#$01,d1
		bcs.w	loc_17B70
		move.b	#$06,d0
		lsr.b	#$01,d1
		bcs.w	loc_17D62
		move.b	#$05,d0
		lsr.b	#$01,d1
		bcs.w	loc_17E1E
		move.b	#$0A,d0
		lsr.b	#$01,d1
		bcs.w	loc_17CAA

locret_1917C:					  ; CODE XREF: sub_19114+8j
						  ; sub_19114+10j ...
		rts
; End of function sub_1914C


; =============== S U B	R O U T	I N E =======================================


sub_1917E:					  ; CODE XREF: sub_190D4+28p
		move.w	SpriteUnderneath(a5),d0
		bmi.s	locret_191B2
		btst	#$06,Flags1(a5)
		bne.s	locret_191B2
		lea	(Player_X).l,a0
		adda.w	d0,a0
		btst	#$05,Action1(a0)
		beq.s	locret_191B2
		move.w	HitBoxZEnd(a0),d7
		sub.w	Z(a5),d7
		addq.w	#$01,d7
		beq.s	locret_191B2
		add.w	d7,Z(a5)
		add.w	d7,HitBoxZEnd(a5)
		rts
; ---------------------------------------------------------------------------

locret_191B2:					  ; CODE XREF: sub_1917E+4j
						  ; sub_1917E+Cj ...
		rts
; End of function sub_1917E


; =============== S U B	R O U T	I N E =======================================


sub_191B4:					  ; CODE XREF: OnTickp
		move.w	GroundHeight(a5),d0
		andi.b	#$3F,d0
		cmpi.b	#FLOOR_PIT,d0
		bne.s	locret_191D6
		tst.b	FallRate(a5)
		bmi.s	locret_191D6
		clr.w	d0
		move.b	GroundHeight(a5),d0
		lsl.b	#$04,d0
		cmp.w	Z(a5),d0
		beq.s	loc_191D8

locret_191D6:					  ; CODE XREF: sub_191B4+Cj
						  ; sub_191B4+12j
		rts
; ---------------------------------------------------------------------------

loc_191D8:					  ; CODE XREF: sub_191B4+20j
		jsr	(j_MoveSpriteOffscreen).l
		movem.l	(sp)+,d0
		rts
; End of function sub_191B4


; =============== S U B	R O U T	I N E =======================================


sub_191E4:					  ; DATA XREF: sub_103D2t
		movea.l	a0,a5
		move.b	JumpRate(a5),d0
		andi.w	#$001F,d0
		bne.s	loc_191F8
		bclr	#$07,JumpRate(a5)
		beq.s	locret_19204

loc_191F8:					  ; CODE XREF: sub_191E4+Aj
		bset	#$05,Action1(a5)
		jsr	(sub_3AA).l

locret_19204:					  ; CODE XREF: sub_191E4+12j
		rts
; End of function sub_191E4


; =============== S U B	R O U T	I N E =======================================


sub_19206:					  ; CODE XREF: OnTick+4p
						  ; sub_19114p
		btst	#$06,Flags1(a5)
		beq.s	loc_19276
		move.w	(Player_HitBoxZEnd).l,d0
		move.w	d0,HitBoxZEnd(a5)
		clr.w	d1
		move.b	Height(a5),d1
		sub.w	d1,d0
		addq.w	#$01,d0
		move.w	d0,Z(a5)
		cmpi.b	#$61,SpriteGraphic(a5)
		beq.s	loc_19242
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d0,RotationAndSize(a5)

loc_19242:					  ; CODE XREF: sub_19206+26j
		move.l	(Player_X).l,(a5)
		move.l	(Player_CentreX).l,CentreX(a5)
		move.l	(Player_HitBoxXStart).l,HitBoxXStart(a5)
		move.l	(Player_HitBoxYStart).l,HitBoxYStart(a5)
		move.w	(Player_GroundHeight).l,GroundHeight(a5)
		move.w	(Player_HeightmapOffset).l,HeightmapOffset(a5)
		clr.w	SpriteUnderneath(a5)
		rts
; ---------------------------------------------------------------------------

loc_19276:					  ; CODE XREF: sub_19206+6j
		btst	#$05,Flags1(a5)
		beq.s	locret_19286
		move.w	(Player_SpriteUnderneath).l,SpriteUnderneath(a5)

locret_19286:					  ; CODE XREF: sub_19206+76j
		rts
; End of function sub_19206


; =============== S U B	R O U T	I N E =======================================


sub_19288:					  ; DATA XREF: sub_103B2t
						  ; ROM:00016178t
		lea	(Sprite1_X).l,a1
		move.w	#$000E,d7

loc_19292:					  ; CODE XREF: sub_19288+20j
		move.w	(a1),d0
		bmi.s	loc_192B2
		cmpi.w	#$7F7F,d0
		bne.s	loc_192A4
		btst	#$00,Flags1(a1)
		bne.s	loc_192B2

loc_192A4:					  ; CODE XREF: sub_19288+12j
		lea	SPRITE_SIZE(a1),a1
		dbf	d7,loc_19292
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_192B2:					  ; CODE XREF: sub_19288+Cj
						  ; sub_19288+1Aj
		tst.b	d0
		rts
; End of function sub_19288


; =============== S U B	R O U T	I N E =======================================


sub_192B6:					  ; DATA XREF: sub_103B8t
						  ; ROM:000161E0t
		movem.l	a1/a5,-(sp)
		clr.b	Flags1(a1)
		clr.b	Flags2(a1)
		move.b	#$01,Unk0A(a1)
		move.b	d2,d0
		move.b	d0,SpriteType(a1)
		bsr.w	LookupSpriteGfxIndex
		jsr	(LookupSpriteAnimFlags).l
		move.b	SpriteGraphic(a1),d0
		bsr.w	GetSpriteDims
		movem.l	a1,-(sp)
		bsr.w	sub_19AC8
		movem.l	(sp)+,a1
		move.b	RotationAndSize(a1),d1
		bsr.w	SetSpriteRotationAnimFlags
		bset	#$07,Unk48(a1)
		tst.w	SPRITE_SIZE(a1)
		bne.s	loc_19306
		move.w	#$FFFF,SPRITE_SIZE(a1)

loc_19306:					  ; CODE XREF: sub_192B6+48j
		movea.l	a1,a5
		jsr	(j_LoadSpriteBehaviour).l
		movem.l	(sp)+,a1/a5
		rts
; End of function sub_192B6

; ---------------------------------------------------------------------------
