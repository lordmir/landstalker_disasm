; ---------------------------------------------------------------------------

loc_1A06C:					  ; CODE XREF: sub_19FB0+A6j
		btst	#$07,(g_AdditionalFlags+4).l
		beq.w	_Done
		lea	(Sprite1_X).l,a5
		moveq	#$0000000E,d7

loc_1A080:					  ; CODE XREF: sub_19FB0+EEj
		tst.b	(a5)
		bmi.w	_Done
		tst.b	$0000000C(a5)
		bpl.s	loc_1A09A
		btst	#$00,$00000038(a5)
		bne.s	loc_1A09A
		jsr	(j_HideSprite).l

loc_1A09A:					  ; CODE XREF: sub_19FB0+DAj
						  ; sub_19FB0+E2j
		lea	$00000080(a5),a5
		dbf	d7,loc_1A080

_Next24:					  ; CODE XREF: sub_19FB0+8Cj
		cmpi.w	#$00F2,(g_RmNum1).l	  ; Verla mine exit tunnel entrance
		bne.s	_Next25			  ; Witches' Hut
		btst	#$07,(g_AdditionalFlags+6).l
		beq.w	_Done
		move.b	#$00,d0
		ext.w	d0
		lsl.w	#$07,d0
		bclr	#$00,$00000008(a5,d0.w)
		bra.w	_Done
; ---------------------------------------------------------------------------

_Next25:					  ; CODE XREF: sub_19FB0+FAj
		cmpi.w	#$01E0,(g_RmNum1).l	  ; Witches' Hut
		bne.s	_Next26			  ; Chicken race
		btst	#$06,(g_AdditionalFlags+7).l
		beq.w	_Done
		move.b	#$02,d0
		ext.w	d0
		lsl.w	#$07,d0
		bclr	#$00,$00000008(a5,d0.w)
		bra.w	_Done
; ---------------------------------------------------------------------------

_Next26:					  ; CODE XREF: sub_19FB0+122j
		cmpi.w	#$0299,(g_RmNum1).l	  ; Chicken race
		bne.w	_Next27			  ; Cave logs entrance
		move.b	(g_Controller2State).l,d0
		cmpi.b	#$E0,d0			  ; A+C+START on player	2
		beq.w	_Done			  ; Convert chickens to	enemies
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
		bra.w	_Done
; ---------------------------------------------------------------------------

_Next27:					  ; CODE XREF: sub_19FB0+14Aj
		cmpi.w	#$019E,(g_RmNum1).l	  ; Cave logs entrance
		bne.w	_Next28			  ; Castle dungeon entrance
		btst	#$04,(g_AdditionalFlags+9).l
		beq.w	_Done
		move.b	#$00,d0
		move.w	#$1718,d1
		bsr.w	MoveSprite
		move.w	#$0003,d1
		bsr.w	sub_1A356
		bra.w	_Done
; ---------------------------------------------------------------------------

_Next28:					  ; CODE XREF: sub_19FB0+1FEj
		cmpi.w	#$0024,(g_RmNum1).l	  ; Castle dungeon entrance
		bne.w	_Next29
		btst	#$05,(g_AdditionalFlags).l
		beq.w	_Done
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
		bra.w	_Done
; ---------------------------------------------------------------------------

_Next29:					  ; CODE XREF: sub_19FB0+22Ej
		cmpi.w	#$0199,(g_RmNum1).l
		bne.w	_Next30			  ; Cave Spinner
		btst	#$01,(g_AdditionalFlags+$B).l
		beq.w	_Done
		bclr	#$00,(Sprite1_Flags1).l
		bra.w	_Done
; ---------------------------------------------------------------------------

_Next30:					  ; CODE XREF: sub_19FB0+27Ej
		cmpi.w	#$019A,(g_RmNum1).l	  ; Cave Spinner
		bne.w	_Next31			  ; Cave Ifrit
		btst	#$00,(g_AdditionalFlags+$18).l
		beq.w	_Done
		bclr	#$00,(Sprite2_Flags1).l
		bra.w	_Done
; ---------------------------------------------------------------------------

_Next31:					  ; CODE XREF: sub_19FB0+2A2j
		cmpi.w	#$0194,(g_RmNum1).l	  ; Cave Ifrit
		bne.w	_Next32			  ; Cave Miro
		btst	#$05,(g_AdditionalFlags+$18).l
		beq.w	_Done
		bclr	#$00,(Sprite1_Flags1).l
		bra.w	_Done
; ---------------------------------------------------------------------------

_Next32:					  ; CODE XREF: sub_19FB0+2C6j
		cmpi.w	#$01A1,(g_RmNum1).l	  ; Cave Miro
		bne.w	_Next33			  ; Mir's tower first room
		btst	#$02,(g_AdditionalFlags+$18).l
		beq.w	_Done
		bclr	#$00,(Sprite1_Flags1).l
		bra.w	_Done
; ---------------------------------------------------------------------------

_Next33:					  ; CODE XREF: sub_19FB0+2EAj
		cmpi.w	#$02EF,(g_RmNum1).l	  ; Mir's tower first room
		bne.w	_Next34			  ; Mercator Harbour
		cmpi.w	#$00FE,(g_ControllerPlayback).l
		bne.w	_Done
		clr.w	(g_ControllerPlayback).l
		bra.w	_Done
; ---------------------------------------------------------------------------

_Next34:					  ; CODE XREF: sub_19FB0+30Ej
		cmpi.w	#$0283,(g_RmNum1).l	  ; Mercator Harbour
		bne.s	_Next35
		btst	#$05,(g_Flags+$14).l
		beq.w	_Done
		move.b	#$08,d0
		move.w	#$1E1A,d1
		bsr.w	MoveSprite
		move.w	#$0010,d1
		bsr.w	SetSpriteZ
		bra.w	_Done
; ---------------------------------------------------------------------------

_Next35:					  ; CODE XREF: sub_19FB0+330j
		nop

EndCustomRoomAction:				  ; CODE XREF: DoCustomRoomActions+2Ej
						  ; DoCustomRoomActions+42j ...
_Done:
		rts
; End of function sub_19FB0

		modend
