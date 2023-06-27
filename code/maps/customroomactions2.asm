; ---------------------------------------------------------------------------

loc_1A06C:					  ; CODE XREF: sub_19FB0+A6j
		btst	#$07,(g_Vars+4).l
		beq.w	locret_1A308
		lea	(Sprite1_X).l,a5
		moveq	#$0000000E,d7

loc_1A080:					  ; CODE XREF: sub_19FB0+EEj
		tst.b	(a5)
		bmi.w	locret_1A308
		tst.b	$0000000C(a5)
		bpl.s	loc_1A09A
		btst	#$00,$00000038(a5)
		bne.s	loc_1A09A
		jsr	(j_HideSprite).l

loc_1A09A:					  ; CODE XREF: sub_19FB0+DAj
						  ; sub_19FB0+E2j
		lea	$00000080(a5),a5
		dbf	d7,loc_1A080

loc_1A0A2:					  ; CODE XREF: sub_19FB0+8Cj
		cmpi.w	#$00F2,(g_RmNum1).l	  ; Verla mine exit tunnel entrance
		bne.s	loc_1A0CA		  ; Witches' Hut
		btst	#$07,(g_Vars+6).l
		beq.w	locret_1A308
		move.b	#$00,d0
		ext.w	d0
		lsl.w	#$07,d0
		bclr	#$00,$00000008(a5,d0.w)
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_1A0CA:					  ; CODE XREF: sub_19FB0+FAj
		cmpi.w	#$01E0,(g_RmNum1).l	  ; Witches' Hut
		bne.s	loc_1A0F2		  ; Chicken race
		btst	#$06,(g_Vars+7).l
		beq.w	locret_1A308
		move.b	#$02,d0
		ext.w	d0
		lsl.w	#$07,d0
		bclr	#$00,$00000008(a5,d0.w)
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_1A0F2:					  ; CODE XREF: sub_19FB0+122j
		cmpi.w	#$0299,(g_RmNum1).l	  ; Chicken race
		bne.w	loc_1A1A6		  ; Cave logs entrance
		move.b	(g_Controller2State).l,d0
		cmpi.b	#$E0,d0			  ; A+C+START on player	2
		beq.w	locret_1A308		  ; Convert chickens to	enemies
		lea	(Sprite1_X).l,a0
		move.b	#SpriteB_Chicken,Sprite2_SpriteGraphic-Sprite1_X(a0)
		move.b	#SpriteB_Chicken,$0000010B(a0)
		move.b	#SpriteB_Chicken,$0000018B(a0)
		move.b	#SpriteB_Chicken,$0000020B(a0)
		move.b	#$0F,$000000BB(a0)
		move.b	#$0F,$0000013B(a0)
		move.b	#$0F,$000001BB(a0)
		move.b	#$0F,$0000023B(a0)
		ori.b	#$60,$00000086(a0)
		ori.b	#$60,$00000106(a0)
		ori.b	#$60,$00000186(a0)
		ori.b	#$60,$00000206(a0)
		bset	#$07,$000000C8(a0)
		bset	#$07,$00000148(a0)
		bset	#$07,$000001C8(a0)
		bset	#$07,$00000248(a0)
		move.b	#$0B,$00000085(a0)
		move.b	#$0B,$00000105(a0)
		move.b	#$0B,$00000185(a0)
		move.b	#$0B,$00000205(a0)
		move.b	#$C8,$00000084(a0)
		move.b	#$C8,$00000104(a0)
		move.b	#$C8,$00000184(a0)
		move.b	#$C8,$00000204(a0)
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_1A1A6:					  ; CODE XREF: sub_19FB0+14Aj
		cmpi.w	#$019E,(g_RmNum1).l	  ; Cave logs entrance
		bne.w	loc_1A1D6		  ; Castle dungeon entrance
		btst	#$04,(g_Vars+9).l
		beq.w	locret_1A308
		move.b	#$00,d0
		move.w	#$1718,d1
		bsr.w	MoveSprite
		move.w	#$0003,d1
		bsr.w	sub_1A356
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_1A1D6:					  ; CODE XREF: sub_19FB0+1FEj
		cmpi.w	#$0024,(g_RmNum1).l	  ; Castle dungeon entrance
		bne.w	loc_1A226
		btst	#$05,(g_Vars).l
		beq.w	locret_1A308
		move.b	#$02,d0
		move.w	#$131A,d1
		bsr.w	MoveSprite
		move.w	#$0000,d1
		bsr.w	SetSpriteZ
		move.b	#$01,d0
		move.w	#$101A,d1
		bsr.w	MoveSprite
		move.w	#$0000,d1
		bsr.w	SetSpriteZ
		move.b	#$00,d0
		move.w	#$111B,d1
		bsr.w	MoveSprite
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_1A226:					  ; CODE XREF: sub_19FB0+22Ej
		cmpi.w	#$0199,(g_RmNum1).l
		bne.w	loc_1A24A		  ; Cave Spinner
		btst	#$01,(g_Vars+$B).l
		beq.w	locret_1A308
		bclr	#$00,(Sprite1_Flags1).l
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_1A24A:					  ; CODE XREF: sub_19FB0+27Ej
		cmpi.w	#$019A,(g_RmNum1).l	  ; Cave Spinner
		bne.w	loc_1A26E		  ; Cave Ifrit
		btst	#$00,(g_Vars+$18).l
		beq.w	locret_1A308
		bclr	#$00,(Sprite2_Flags1).l
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_1A26E:					  ; CODE XREF: sub_19FB0+2A2j
		cmpi.w	#$0194,(g_RmNum1).l	  ; Cave Ifrit
		bne.w	loc_1A292		  ; Cave Miro
		btst	#$05,(g_Vars+$18).l
		beq.w	locret_1A308
		bclr	#$00,(Sprite1_Flags1).l
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_1A292:					  ; CODE XREF: sub_19FB0+2C6j
		cmpi.w	#$01A1,(g_RmNum1).l	  ; Cave Miro
		bne.w	loc_1A2B6		  ; Mir's tower first room
		btst	#$02,(g_Vars+$18).l
		beq.w	locret_1A308
		bclr	#$00,(Sprite1_Flags1).l
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_1A2B6:					  ; CODE XREF: sub_19FB0+2EAj
		cmpi.w	#$02EF,(g_RmNum1).l	  ; Mir's tower first room
		bne.w	loc_1A2D8		  ; Mercator Harbour
		cmpi.w	#$00FE,(g_ControllerPlayback).l
		bne.w	locret_1A308
		clr.w	(g_ControllerPlayback).l
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_1A2D8:					  ; CODE XREF: sub_19FB0+30Ej
		cmpi.w	#$0283,(g_RmNum1).l	  ; Mercator Harbour
		bne.s	loc_1A306
		btst	#$05,(g_Flags+$14).l
		beq.w	locret_1A308
		move.b	#$08,d0
		move.w	#$1E1A,d1
		bsr.w	MoveSprite
		move.w	#$0010,d1
		bsr.w	SetSpriteZ
		bra.w	locret_1A308
; ---------------------------------------------------------------------------

loc_1A306:					  ; CODE XREF: sub_19FB0+330j
		nop

locret_1A308:					  ; CODE XREF: DoCustomRoomActions+2Ej
						  ; DoCustomRoomActions+42j ...
		rts
; End of function sub_19FB0

