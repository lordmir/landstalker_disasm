
; Tree-warp arrival rooms (tree-warp theme but not a big-tree room):
; once the warp network is open, hide every killable hostile so the
; arrival clearing is safe. Indestructible obstacles (CombatFlags
; bit 0) are kept.
ContinueTreeWarpCheck:
		btst	#$07,(g_AdditionalFlags+4).l
		beq.w	_Done
		lea	(Sprite1_X).l,a5
		moveq	#$0E,d7

_twSpriteLoop:
		tst.b	(a5)
		bmi.w	_Done
		tst.b	InteractFlags(a5)
		bpl.s	_twNext
		btst	#$00,CombatFlags(a5)
		bne.s	_twNext
		jsr	(j_HideSprite).l

_twNext:
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,_twSpriteLoop

_Next24:
		cmpi.w	#ROOM_VERLA_MINE_BOSS_2,(g_CurrentRoom).l	  ; Verla mine exit tunnel entrance
		bne.s	_Next25			  ; Witches' Hut
		btst	#$07,(g_AdditionalFlags+6).l
		beq.w	_Done
		move.b	#$00,d0
		ext.w	d0
		lsl.w	#$07,d0
		bclr	#$00,StateFlags(a5,d0.w)
		bra.w	_Done

_Next25:
		cmpi.w	#ROOM_WITCHES_HUT,(g_CurrentRoom).l	  ; Witches' Hut
		bne.s	_Next26			  ; Chicken race
		btst	#$06,(g_AdditionalFlags+7).l
		beq.w	_Done
		move.b	#$02,d0
		ext.w	d0
		lsl.w	#$07,d0
		bclr	#$00,StateFlags(a5,d0.w)
		bra.w	_Done

_Next26:
		cmpi.w	#ROOM_MERCATOR_CHICKEN_RACE,(g_CurrentRoom).l	  ; Chicken race
		bne.w	_Next27			  ; Cave logs entrance
; The racers (sprites 2-5) spawn as enemies; normally they are
; turned into harmless chickens here. Debug: holding A+C+START on
; pad 2 skips the conversion, racing real enemies instead.
		move.b	(g_Controller2State).l,d0
		cmpi.b	#$E0,d0			  ; A+C+START on player	2
		beq.w	_Done
		lea	(Sprite1_X).l,a0
		move.b	#SpriteB_Chicken,(SPRITE_SIZE+SpriteGraphic)(a0)
		move.b	#SpriteB_Chicken,(SPRITE_SIZE*2+SpriteGraphic)(a0)
		move.b	#SpriteB_Chicken,(SPRITE_SIZE*3+SpriteGraphic)(a0)
		move.b	#SpriteB_Chicken,(SPRITE_SIZE*4+SpriteGraphic)(a0)
		move.b	#$0F,(SPRITE_SIZE+SpriteType)(a0)
		move.b	#$0F,(SPRITE_SIZE*2+SpriteType)(a0)
		move.b	#$0F,(SPRITE_SIZE*3+SpriteType)(a0)
		move.b	#$0F,(SPRITE_SIZE*4+SpriteType)(a0)
		ori.b	#$60,(SPRITE_SIZE+TileSource)(a0)
		ori.b	#$60,(SPRITE_SIZE*2+TileSource)(a0)
		ori.b	#$60,(SPRITE_SIZE*3+TileSource)(a0)
		ori.b	#$60,(SPRITE_SIZE*4+TileSource)(a0)
		bset	#$07,(SPRITE_SIZE+RenderFlags)(a0)
		bset	#$07,(SPRITE_SIZE*2+RenderFlags)(a0)
		bset	#$07,(SPRITE_SIZE*3+RenderFlags)(a0)
		bset	#$07,(SPRITE_SIZE*4+RenderFlags)(a0)
		move.b	#$0B,(SPRITE_SIZE+Height)(a0)
		move.b	#$0B,(SPRITE_SIZE*2+Height)(a0)
		move.b	#$0B,(SPRITE_SIZE*3+Height)(a0)
		move.b	#$0B,(SPRITE_SIZE*4+Height)(a0)
		move.b	#$C8,(SPRITE_SIZE+RotationAndSize)(a0)
		move.b	#$C8,(SPRITE_SIZE*2+RotationAndSize)(a0)
		move.b	#$C8,(SPRITE_SIZE*3+RotationAndSize)(a0)
		move.b	#$C8,(SPRITE_SIZE*4+RotationAndSize)(a0)
		bra.w	_Done

_Next27:
		cmpi.w	#ROOM_LABRYNTH_LOGS_ENTRANCE,(g_CurrentRoom).l	  ; Cave logs entrance
		bne.w	_Next28			  ; Castle dungeon entrance
		btst	#$04,(g_AdditionalFlags+9).l
		beq.w	_Done
		move.b	#$00,d0
		move.w	#$1718,d1
		bsr.w	MoveSprite
		move.w	#$0003,d1
		bsr.w	SetSpriteFacing
		bra.w	_Done

_Next28:
		cmpi.w	#ROOM_CASTLE_DUNGEON_ENTRANCE,(g_CurrentRoom).l	  ; Castle dungeon entrance
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

_Next29:
		cmpi.w	#ROOM_LABRYNTH_RAFT2,(g_CurrentRoom).l
		bne.w	_Next30			  ; Cave Spinner
		btst	#$01,(g_AdditionalFlags+$B).l
		beq.w	_Done
		bclr	#$00,(Sprite1_StateFlags).l
		bra.w	_Done

_Next30:
		cmpi.w	#ROOM_LABRYNTH_SPINNER,(g_CurrentRoom).l	  ; Cave Spinner
		bne.w	_Next31			  ; Cave Ifrit
		btst	#$00,(g_AdditionalFlags+$18).l
		beq.w	_Done
		bclr	#$00,(Sprite2_StateFlags).l
		bra.w	_Done

_Next31:
		cmpi.w	#ROOM_LABRYNTH_IFRIT,(g_CurrentRoom).l	  ; Cave Ifrit
		bne.w	_Next32			  ; Cave Miro
		btst	#$05,(g_AdditionalFlags+$18).l
		beq.w	_Done
		bclr	#$00,(Sprite1_StateFlags).l
		bra.w	_Done

_Next32:
		cmpi.w	#ROOM_LABRYNTH_MIRO,(g_CurrentRoom).l	  ; Cave Miro
		bne.w	_Next33			  ; Mir's tower first room
		btst	#$02,(g_AdditionalFlags+$18).l
		beq.w	_Done
		bclr	#$00,(Sprite1_StateFlags).l
		bra.w	_Done

_Next33:
		cmpi.w	#ROOM_MIRS_TOWER_ENTRANCE,(g_CurrentRoom).l	  ; Mir's tower first room
		bne.w	_Next34			  ; Mercator Harbour
		cmpi.w	#$00FE,(g_ControllerPlayback).l
		bne.w	_Done
		clr.w	(g_ControllerPlayback).l
		bra.w	_Done

_Next34:
		cmpi.w	#ROOM_MERCATOR_HARBOUR_AFTER_MIR,(g_CurrentRoom).l	  ; Mercator Harbour
		bne.s	_Next35
		btst	#$05,(g_Flags+$14).l
		beq.w	_Done
		move.b	#$08,d0
		move.w	#$1E1A,d1
		bsr.w	MoveSprite
		move.w	#$0010,d1
		bsr.w	SetSpriteZ
		bra.w	_Done

_Next35:
		nop

EndCustomRoomAction:
_Done:
		rts

		modend
