
; =============== S U B	R O U T	I N E =======================================


SpawnSmallProjectile:				  ; CODE XREF: ROM:001AC0ECp
						  ; ROM:001AC3D0p ...
		movem.w	d0-d1,-(sp)
		jsr	(sub_103B2).l
		bcs.w	loc_1AC4FC
		move.w	X(a5),d0
		move.b	RotationAndSize(a5),d1
		andi.b	#$C0,d1
		beq.s	loc_1AC49C
		cmpi.b	#$80,d1
		bcs.s	loc_1AC4A0
		beq.s	loc_1AC4A6
		subi.w	#$0100,d0
		bra.s	loc_1AC4A8
; ---------------------------------------------------------------------------

loc_1AC49C:					  ; CODE XREF: SpawnSmallProjectile+18j
		subq.b	#$01,d0
		bra.s	loc_1AC4A8
; ---------------------------------------------------------------------------

loc_1AC4A0:					  ; CODE XREF: SpawnSmallProjectile+1Ej
		addi.w	#$0100,d0
		bra.s	loc_1AC4A8
; ---------------------------------------------------------------------------

loc_1AC4A6:					  ; CODE XREF: SpawnSmallProjectile+20j
		addq.b	#$01,d0

loc_1AC4A8:					  ; CODE XREF: SpawnSmallProjectile+26j
						  ; SpawnSmallProjectile+2Aj ...
		move.w	d0,(a1)
		move.b	d1,RotationAndSize(a1)
		movem.w	(sp)+,d0-d1
		ext.w	d0
		move.b	locret_1AC504+1(pc,d0.w),d2
		move.w	d1,AttackStrength(a1)
		move.w	Z(a5),d3
		addi.w	#$0010,d3
		move.w	d3,Z(a1)
		move.w	SubX(a5),SubX(a1)
		move.w	#$64C0,TileSource(a1)
		move.w	#$021C,BehaviourLUTIndex(a1)
		move.b	#$04,Speed(a1)
		jsr	(sub_103B8).l
		bset	#$00,Flags4(a1)		  ; Bit	0 = Invincible / Solid
		bset	#$07,Flags2(a1)
		bset	#$07,InitFlags2(a1)
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_1AC4FC:					  ; CODE XREF: SpawnSmallProjectile+Aj
		movem.w	(sp)+,d0-d1
		ori	#$01,ccr

locret_1AC504:					  ; DATA XREF: SpawnSmallProjectile+40r
		rts
; End of function SpawnSmallProjectile

; ---------------------------------------------------------------------------
		dc.b SPR_SMLFIREBALL
		dc.b SPR_NOLEAXEPROJECTILE
		dc.b SPR_ZAKBOOMERANG
		dc.b $FF
