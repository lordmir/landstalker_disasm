GameLogic3	module
; Jump input: B starts a jump, arming JumpRate and playing the jump
; sound, then runs the rise; an in-progress jump just continues
; rising. Blocked mid pickup/throw animation (0 < g_CarryPhase < $17)
; but allowed while carrying steadily.
HandleJump:
		move.b	(Player_JumpRate).l,d0
		andi.w	#$001F,d0
		bne.s	_jumpRise
		move.b	(g_CarryPhase).l,d2
		beq.s	_tryJump
		cmpi.b	#$17,d2
		bcs.s	_jumpDone

_tryJump:
		tst.b	(g_JumpButtonLatch).l
		bne.w	_jumpDone
		move.b	(g_Controller1State).l,d2
		andi.b	#CTRLBF_B,d2
		beq.s	_jumpDone
		move.b	#CTRLBF_B,(g_JumpButtonLatch).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_Jump

_jumpRise:
		lea	(Player_X).l,a5


; One tick of jump ascent for entity a5: rise by JumpAcceleration
; [frame], limited by GetClearanceAbove; after $0C frames (or on
; hitting a ceiling) the jump ends and gravity takes over (FallRate
; bit 7 armed while rising).
HandleJumpRise:
		bsr.w	GetClearanceAbove
		move.b	JumpAcceleration(pc,d0.w),d1
		ext.w	d1
		cmp.w	d5,d1
		bhi.s	_jumpApex
		add.w	d1,Z(a5)
		add.w	d1,HitBoxZEnd(a5)
		andi.b	#$E0,JumpRate(a5)
		addq.b	#$01,d0
		cmpi.b	#$0C,d0
		bcs.s	_storeJumpRate

_jumpApex:
		andi.w	#$60E0,FallRate(a5)
		rts

_storeJumpRate:
		or.b	d0,JumpRate(a5)
		ori.b	#$80,FallRate(a5)

_jumpDone:
		rts

JumpAcceleration:dc.b $04, $04,	$03, $03, $03, $02, $02, $02
		dc.b $02, $01, $01, $01, $01, $01, $01,	$01


; Per-frame sprite pipeline: points the self-modifying JumpInstr2
; vector at the per-frame handler (_frameLoadSprite), then resets the
; VDP sprite tail, projects all sprites, depth-sorts the draw list and
; rebuilds frames/pieces for sprites that need it.
LoadSprites:
		move.l	(_jmpFrameSprite,pc),(JumpInstr2).l
		move.w	((_jmpFrameSprite+4),pc),(JumpInstr2+4).l
		bsr.s	ResetVdpSprites
		bsr.w	ProjectAllSprites
		bsr.w	SortSpritesByDepth
		bsr.w	LoadSpriteFrames
		rts


_jmpFrameSprite:
		jmp	(_frameLoadSprite).l


; Room load: rebuilds the draw list as 0..15 in slot order, points the
; vectors at the room-load handler (_roomLoadSprite, which assigns
; fresh VRAM tile addresses), and loads every sprite's tiles via the
; DMA queue.
InitRoomSpriteGfx:
		move.l	(_jmpQueueDMAOp,pc),(JmpInstr1).l
		move.w	((_jmpQueueDMAOp+4),pc),(JmpInstr1+4).l
		move.l	(_jmpRoomSprite,pc),(JumpInstr2).l
		move.w	((_jmpRoomSprite+4),pc),(JumpInstr2+4).l
		bsr.s	ResetVdpSprites
		lea	(Player_X).l,a0
		lea	(g_SpriteDrawList).l,a1
		clr.w	d0
		moveq	#$F,d7

_initListLoop:
		move.w	d0,(a1)+
		addi.w	#$0080,d0
		lea	SPRITE_SIZE(a0),a0
		tst.b	(a0)
		dbmi	d7,_initListLoop
		move.w	#$FFFF,(a1)
		bsr.w	_loadAllSpriteFrames
		move.l	(_jmpQueueDMAOp,pc),(JmpInstr1).l
		move.w	((_jmpQueueDMAOp+4),pc),(JmpInstr1+4).l
		rts


_jmpRoomSprite:
		jmp	(_roomLoadSprite).l


; Clears the tail of the VDP sprite table (sprites 16+ keep only their
; link bytes) and resets the draw list to empty ($FFFF).
ResetVdpSprites:
		lea	(g_VDPSpr16_Y).l,a2
		moveq	#$7,d7
		moveq	#$0,d0
		move.l	#$FF,d1

_clearVdpLoop:
		and.l	d1,(a2)+
		move.l	d0,(a2)+
		and.l	d1,(a2)+
		move.l	d0,(a2)+
		and.l	d1,(a2)+
		move.l	d0,(a2)+
		and.l	d1,(a2)+
		move.l	d0,(a2)+
		and.l	d1,(a2)+
		move.l	d0,(a2)+
		and.l	d1,(a2)+
		move.l	d0,(a2)+
		and.l	d1,(a2)+
		move.l	d0,(a2)+
		and.l	d1,(a2)+
		move.l	d0,(a2)+
		dbf	d7,_clearVdpLoop
		lea	(g_SpriteDrawList).l,a2
		moveq	#$FFFFFFFF,d0
		move.l	d0,(a2)+
		move.l	d0,(a2)+
		move.l	d0,(a2)+
		move.l	d0,(a2)+
		move.l	d0,(a2)+
		move.l	d0,(a2)+
		move.l	d0,(a2)+
		move.l	d0,(a2)+
		rts


; Projects the player then every active sprite to screen coordinates,
; appending visible ones to the draw list (saving PrevScreenX first).
ProjectAllSprites:
		lea	(g_SpriteDrawList).l,a2
		lea	(Player_X).l,a6
		clr.w	d6
		movea.w	#$0000,a5
		move.w	#$0100,d4
		move.w	#$0200,d5
		bsr.w	ProjectSpriteToScreen
		move.w	(g_VScrollParity).l,d3
		eori.w	#$0001,d3
		movea.w	d3,a5
		lea	(Sprite1_X).l,a6
		move.w	#SPRITE_SIZE,d6
		moveq	#$E,d7

_projLoop:
		tst.b	(a6)
		bmi.s	_projDone
		move.l	ScreenX(a6),PrevScreenX(a6)
		bsr.w	ProjectSpriteToScreen
		addi.w	#SPRITE_SIZE,d6
		lea	SPRITE_SIZE(a6),a6
		dbf	d7,_projLoop

_projDone:
		rts


; Isometric projection for sprite a6: ScreenX = (X-Z)-(Y-Z)-camera
; +$120, ScreenY = sum/2+$E8 (vertical parity-adjusted), culled
; against the view window; also computes the DrawOrder depth key.
; Hidden or carried sprites get ScreenX cleared and drop out of the
; list unless their gfx-reload bit (RenderFlags bit 7) is pending.
ProjectSpriteToScreen:
		btst	#$06,InteractFlags(a6)
		bne.w	_offScreen
		btst	#$00,StateFlags(a6)
		bne.w	_offScreen
		move.w	Z(a6),d2
		move.w	CentreX(a6),d0
		sub.w	d2,d0
		move.w	CentreY(a6),d1
		sub.w	d2,d1
		sub.w	(g_CameraFineX).l,d0
		sub.w	(g_CameraFineY).l,d1
		move.w	d0,d2
		move.w	d1,d3
		add.w	d1,d0
		add.w	d4,d0
		cmp.w	d5,d0
		bcc.s	_offScreen
		sub.w	d3,d2
		add.w	d4,d2
		cmp.w	d5,d2
		bcc.s	_offScreen
		sub.w	d4,d2
		addi.w	#$0120,d2
		cmpi.w	#$0060,d2
		bcs.s	_offScreen
		cmpi.w	#$01E0,d2
		bcc.s	_offScreen
		sub.w	d4,d0
		add.w	a5,d0
		lsr.w	#$01,d0
		addi.w	#$00E8,d0
		andi.w	#$07FF,d0
		cmpi.w	#$0080,d0
		bcs.s	_offScreen
		cmpi.w	#$01E0,d0
		bcc.s	_offScreen
		move.w	d2,ScreenX(a6)
		move.w	d0,ScreenY(a6)
		move.w	d6,(a2)+
		move.w	HitBoxXStart(a6),d0
		add.w	HitBoxYStart(a6),d0
		lsr.w	#$01,d0
		clr.w	d1
		move.b	Height(a6),d1
		add.w	d1,d0
		add.w	Z(a6),d0
		add.w	HitBoxZEnd(a6),d0
		move.w	d0,DrawOrder(a6)
		rts

_offScreen:
		clr.l	ScreenX(a6)
		bclr	#$07,RenderFlags(a6)
		beq.s	_clrAnimBit
		move.w	d6,(a2)+
		rts

_clrAnimBit:
		bclr	#$07,AnimCtrl(a6)
		rts


LoadSpriteFrames:
		bsr.s	InitSpriteLoad

_frameLoop:
		move.w	(a3)+,d0
		bmi.s	_framesDone
		lea	(Player_X).l,a1
		adda.w	d0,a1
		btst	#$00,StateFlags(a1)
		bne.s	_frameNext
		bsr.s	LoadSpriteFrame

_frameNext:
		dbf	d7,_frameLoop

_framesDone:
		rts


; Common setup for the frame-load loops: a2 = VDP sprite tail, a3 =
; draw list, a4 = sprite gfx pointers, d2 = first free VRAM tile.
InitSpriteLoad:
		lea	(g_VDPSpr16_Y).l,a2
		lea	(g_SpriteDrawList).l,a3
		lea	(SpriteGfxPtrPtr).l,a4
		move.w	#$03A8,d2		  ; VDP	RAM Begin
		moveq	#$F,d7		  ; EntityCount
		clr.b	d6
		rts


; Looks up sprite a1's current animation frame data and calls the
; JumpInstr2 handler (per-frame or room-load variant).
LoadSpriteFrame:
		movea.l	(a4),a0
		moveq	#$0,d0
		move.b	SpriteGraphic(a1),d0
		lsl.w	#$02,d0
		move.w	$6(a4,d0.w),d1
		move.w	$4(a4,d0.w),d0
		lsl.w	#$02,d0
		adda.l	d0,a0
		move.w	AnimationIndex(a1),d0
		movea.l	(a0,d0.w),a0
		move.w	AnimationFrame(a1),d0
		movea.l	(a0,d0.w),a0
		movem.l	d7/a1/a3,-(sp)
		jsr	(JumpInstr2).l
		movem.l	(sp)+,d7/a1/a3
		rts


_loadAllSpriteFrames:
		bsr.s	InitSpriteLoad

_allLoop:
		move.w	(a3)+,d0
		bmi.s	_allDone
		lea	(Player_X).l,a1
		adda.w	d0,a1
		bsr.s	LoadSpriteFrame
		dbf	d7,_allLoop

_allDone:
		rts


_roomLoadSprite:
		andi.w	#$F800,TileSource(a1)
		btst	#$04,TileCopySource(a1)	  ; Use	tile data loaded for another sprite
		beq.s	_newVram
		move.b	TileCopySource(a1),d1
		andi.w	#$000F,d1		  ; Sprite index to load from
		addq.b	#$01,d1
		lsl.w	#$07,d1
		lea	(Player_X).l,a3
		move.w	TileSource(a3,d1.w),d1
		andi.w	#$07FF,d1
		or.w	d1,TileSource(a1)
		bra.s	_loadTiles

_newVram:
		or.w	d2,TileSource(a1)
		cmpa.l	#Player_X,a1
		bne.s	_bumpVram
		addi.w	#$002C,d2
		bra.s	_loadTiles

_bumpVram:
		add.w	d1,d2

_loadTiles:
		movem.w	d2/d6,-(sp)
		movem.l	a1-a2,-(sp)
		bsr.w	BuildSpritePieces
		bsr.w	LoadSpriteTiles
		movem.l	(sp)+,a1-a2
		tst.b	d0
		beq.s	_buildEntry
		bset	#$00,InteractFlags(a1)

_buildEntry:
		bsr.w	BuildVdpSpriteEntry
		movem.w	(sp)+,d2/d6
		cmpi.w	#$03FF,d2		  ; Flush every	87 tiles
		bcs.s	_chkOverflow
		bset	#$03,d6
		bne.s	_chkFlush2
		bsr.w	FlushDMACopyQueue
		bra.s	_chkOverflow

_chkFlush2:
		cmpi.w	#$0456,d2
		bcs.s	_chkOverflow
		bset	#$01,d6
		bne.s	_chkFlush3
		bsr.w	FlushDMACopyQueue
		bra.s	_chkOverflow

_chkFlush3:
		cmpi.w	#$04AD,d2
		bcs.s	_chkOverflow
		bset	#$02,d6
		bne.s	_chkOverflow
		bsr.w	FlushDMACopyQueue

_chkOverflow:
		tst.w	(DebugModeEnable).w
		bmi.s	_rlsDone
		cmpi.w	#$04F4,d2
		bcs.s	_rlsDone
		moveq	#$A,d7

_overflowBeep:
		trap	#$00			  ; Trap00Handler
		dc.w SND_Throw
		move.w	#$0003,d0
		bsr.w	Sleep			  ; Sleeps for d0 frames
		dbf	d7,_overflowBeep

_rlsDone:
		rts

_jmpDoDMACopy:
		jmp	(DoDMACopy).l		  ; d0 = DMA Length
						  ; a0 = DMA Source
						  ; a1 = DMA Destination

_frameLoadSprite:
		bclr	#$07,RenderFlags(a1)
		beq.s	_chkAnimReload
		bclr	#$07,AnimCtrl(a1)
		bra.s	_reload

_chkAnimReload:
		bclr	#$07,AnimCtrl(a1)
		beq.s	_noReload

_reload:
		movem.l	a0-a2,-(sp)
		bsr.w	BuildSpritePieces
		bsr.w	LoadSpriteTiles
		movem.l	(sp)+,a0-a2
		bsr.s	BuildVdpSpriteEntry
		rts

_noReload:
		bsr.s	_buildIfMoved
		rts

_jmpQueueDMAOp:
		jmp	(QueueDMAOp).l		  ; d0 - DMA Length
						  ; a0 - DMA Source
						  ; a1 - DMA Copy


; Emits sprite a1's VDP sprite entries from its piece buffer, OR-ing
; in the behind-wall priority bit. The _buildIfMoved entry reuses the
; stored priority when the sprite neither moved nor animated. Also
; emits the status-effect icon over the player's head (tile $4514 via
; LoadStatusGfx) and the charged-sword hit flash overlay (tiles
; $24C4/$478C + flicker) for sprites hit by Magic/Ice/Thunder.
BuildVdpSpriteEntry:
		movem.l	a3-a6,-(sp)
		bra.s	_rebuild

_buildIfMoved:
		movem.l	a3-a6,-(sp)
		bclr	#ACTBH_REFRESH,QueuedAction(a1)
		bne.s	_rebuild
		btst	#$06,StateFlags(a1)
		bne.s	_rebuild
		move.w	SpriteUnderneath(a1),d0
		bmi.s	_chkAnimAction
		lea	(Player_X).l,a6
		adda.w	d0,a6
		move.b	Speed(a6),d0
		andi.b	#$0F,d0
		bne.s	_rebuild

_chkAnimAction:
		move.b	AnimAction1(a1),d0
		andi.b	#$3F,d0
		beq.w	_keepPriority

_rebuild:
		bsr.w	UpdateSpritePriority
		bra.s	_chkStatusIcon

_keepPriority:
		tst.l	PrevScreenX(a1)
		beq.s	_rebuild
		move.l	a1,d7
		subi.l	#Player_X,d7
		lsr.w	#$01,d7
		movea.l	d7,a3
		adda.l	#g_VdpSpritePieces,a3
		move.w	$4(a3),d0
		andi.w	#$8000,d0

_chkStatusIcon:
		cmpa.l	#Player_X,a1
		bne.s	_chkHitOverlay
		move.b	(g_PlayerStatus).l,d1
		andi.b	#$0F,d1
		beq.s	_chkHitOverlay
		movem.l	d0/a1-a3,-(sp)
		jsr	(j_LoadStatusGfx).l
		movem.l	(sp)+,d0/a1-a3
		move.w	ScreenY(a1),d1
		subi.w	#$0040,d1
		move.w	d1,(a2)+
		move.w	#$0F00,d1
		andi.w	#$00FF,(a2)
		or.w	d1,(a2)+
		move.w	#$4514,d1
		or.w	d0,d1
		move.w	d1,(a2)+
		move.w	ScreenX(a1),d1
		subi.w	#$0010,d1
		move.w	d1,(a2)+

_chkHitOverlay:
		btst	#$01,InteractFlags(a1)
		beq.s	_emitPieces
		move.b	RenderFlags(a1),d3
		andi.b	#$07,d3
		beq.s	_emitPieces
		move.w	#$24C4,d3
		cmpa.l	#Player_X,a1
		beq.s	_overlayFlicker
		move.w	#$478C,d3

_overlayFlicker:
		btst	#$00,(g_VBlankCounterLow).l
		beq.s	_emitOverlay
		addi.w	#$0018,d3

_emitOverlay:
		or.w	d0,d3
		move.w	ScreenY(a1),d2
		subi.w	#$0028,d2
		move.w	d2,(a2)+
		move.b	#$0F,(a2)
		addq.w	#$02,a2
		move.w	d3,(a2)+
		move.w	ScreenX(a1),d1
		subi.w	#$0010,d1
		move.w	d1,(a2)+
		move.w	ScreenY(a1),d2
		subi.w	#$0008,d2
		move.w	d2,(a2)+
		move.b	#$0D,(a2)
		addq.w	#$02,a2
		addi.w	#$0010,d3
		move.w	d3,(a2)+
		move.w	d1,(a2)+
		movem.l	(sp)+,a3-a6
		rts

_emitPieces:
		moveq	#$7,d7

_pieceLoop:
		move.w	(a3)+,d1
		cmpi.w	#$FFFF,d1
		beq.s	_piecesDone
		add.w	$10(a1),d1
		move.w	d1,(a2)+
		move.w	(a3)+,d1
		andi.w	#$0F00,d1
		andi.w	#$00FF,(a2)
		or.w	d1,(a2)+
		move.w	(a3)+,d1
		andi.w	#$7FFF,d1
		or.w	d0,d1
		move.w	d1,(a2)+
		move.w	(a3)+,d1
		add.w	$E(a1),d1
		move.w	d1,(a2)+
		dbf	d7,_pieceLoop

_piecesDone:
		movem.l	(sp)+,a3-a6
		rts


; Decides whether sprite a1 is hidden behind foreground wall tiles:
; walks the heightmap diagonally toward the camera from the sprite's
; cell, comparing wall heights against its Z; if nothing occludes it
; within 12 rows, sets bit 15 (VDP priority) on its piece entries.
UpdateSpritePriority:
		clr.w	d0
		move.w	Z(a1),d1
		lsr.w	#$04,d1
		movea.w	HeightmapOffset(a1),a3
		movea.w	a3,a4
		movea.w	a3,a5
		addq.w	#$02,a3
		lea	$94(a5),a5
		lea	$96(a4),a4
		move.b	SubX(a1),d2
		move.b	SubY(a1),d3
		move.b	RotationAndSize(a1),d4
		andi.b	#$3E,d4
		cmpi.b	#$08,d4
		bls.s	_pickDiag
		subq.b	#$08,d4
		add.b	d4,d2
		cmpi.b	#$10,d2
		bcs.s	_cellAdjY
		addq.w	#$02,a3
		addq.w	#$02,a4
		addq.w	#$02,a5

_cellAdjY:
		add.b	d4,d3
		cmpi.b	#$10,d3
		bcs.s	_wrapSubs
		lea	$94(a3),a3
		lea	$94(a4),a4
		lea	$94(a5),a5

_wrapSubs:
		andi.b	#$0F,d2
		andi.b	#$0F,d3

_pickDiag:
		cmp.b	d3,d2
		beq.s	_diagMid
		bcs.s	_diagY
		movea.w	a3,a6
		cmpi.b	#$08,d2
		bne.s	_diagX
		cmpi.b	#$07,d3
		beq.s	_stepInit

_diagX:
		suba.w	#$0094,a6
		bra.s	_stepInit

_diagY:
		movea.w	a5,a6
		cmpi.b	#$08,d3
		bne.s	_diagY2
		cmpi.b	#$07,d2
		beq.s	_stepInit

_diagY2:
		subq.w	#$02,a6
		bra.s	_stepInit

_diagMid:
		movea.w	a4,a6

_stepInit:
		clr.b	d4
		cmpi.b	#$08,d2
		bls.s	_stepY
		moveq	#$1,d4
		lea	$96(a3),a3
		lea	$96(a6),a6

_stepY:
		cmpi.b	#$08,d3
		bls.s	_scanInit
		lea	$96(a5),a5
		lea	$96(a6),a6
		tst.b	d4
		beq.s	_scanInit
		lea	$96(a4),a4
		suba.w	#$0096,a6

_scanInit:
		moveq	#$B,d7
		move.b	#$0F,d5

_scanLoop:
		move.b	(a3),d4
		and.b	d5,d4
		cmp.b	d1,d4
		bhi.s	_setPriority
		move.b	(a4),d4
		and.b	d5,d4
		cmp.b	d1,d4
		bhi.s	_setPriority
		move.b	(a5),d4
		and.b	d5,d4
		cmp.b	d1,d4
		bhi.s	_setPriority
		move.b	(a6),d4
		and.b	d5,d4
		cmp.b	d1,d4
		bhi.s	_setPriority
		addq.b	#$01,d1
		lea	$96(a3),a3
		lea	$96(a4),a4
		lea	$96(a5),a5
		lea	$96(a6),a6
		dbf	d7,_scanLoop
		move.w	#$8000,d0

_setPriority:
		move.l	a1,d7
		subi.l	#Player_X,d7
		lsr.w	#$01,d7
		movea.l	d7,a3
		adda.l	#g_VdpSpritePieces,a3
		andi.w	#$7FFF,$4(a3)
		or.w	d0,$4(a3)
		rts


_badFramePtrHang:
		nop
		nop
		bra.s	_badFramePtrHang


; Rebuilds sprite a1's piece buffer from the frame definition in a0
; (guarding against a bad frame pointer with an intentional hang) and
; loads its tiles; d6 bit 3 = horizontal flip.
BuildSpritePieces:


		cmpa.l	#$60000000,a0
		bhi.s	_badFramePtrHang
		move.l	a1,d1
		subi.l	#Player_X,d1
		lsr.w	#$01,d1
		movea.l	d1,a3
		adda.l	#g_VdpSpritePieces,a3
		move.w	TileSource(a1),d0
		move.b	TileSource(a1),d6
		andi.b	#$08,d6
		bsr.s	LoadObjectVDPSprites
		move.w	#$FFFF,(a3)
		rts


; Parses up to 8 piece definitions from a0 into the piece buffer a3:
; per piece {Y offset, size, X offset}, allocating VRAM tiles in d0
; sequentially (VDPSpriteTileCount per size), mirroring X when d6
; bit 3 is set.
LoadObjectVDPSprites:
		movem.w	d0,-(sp)
		clr.w	d1

_pieceParse:
		move.b	(a0)+,d3
		add.b	d3,d3
		move.b	d3,d4
		andi.b	#$F8,d3
		ext.w	d3
		move.w	d3,(a3)+
		add.b	d4,d4
		andi.b	#$0C,d4
		move.b	(a0)+,d3
		move.b	d3,d5
		add.b	d3,d3
		andi.b	#$F8,d3
		ext.w	d3
		andi.w	#$0003,d5
		or.b	d4,d5
		move.b	d5,(a3)
		btst	#$03,d6
		beq.s	_storePiece
		neg.w	d3
		addq.b	#$04,d4
		add.b	d4,d4
		ext.w	d4
		sub.w	d4,d3

_storePiece:
		andi.w	#$8000,$2(a3)
		or.w	d0,$2(a3)
		or.b	d6,$2(a3)
		move.b	VDPSpriteTileCount(pc,d5.w),d5 ; Sprite	Width/Height to	num tiles
		ext.w	d5
		add.w	d5,d0
		move.w	d3,$4(a3)
		addq.w	#$06,a3
		addq.b	#$01,d1
		cmpi.b	#$08,d1
		bcc.s	_parseDone
		tst.b	-$1(a0)
		bpl.s	_pieceParse

_parseDone:
		movem.w	(sp)+,d0
		rts

VDPSpriteTileCount:dc.b	$01, $02, $03, $04
		dc.b $02, $04, $06, $08
		dc.b $03, $06, $09, $0C
		dc.b $04, $08, $0C, $10


LoadSpriteGfx:
		move.l	(_jmpQueueDMAOp,pc),(JmpInstr1).l
		move.w	((_jmpQueueDMAOp+4),pc),(JmpInstr1+4).l
		lea	(SpriteGfxPtrPtr).l,a4
		movea.l	(a4),a0
		lsl.w	#$02,d0			  ; Sprite
		move.w	$4(a4,d0.w),d0
		lsl.w	#$02,d0
		adda.l	d0,a0
		movea.l	(a0,d2.w),a0		  ; Animation
		movea.l	(a0,d3.w),a0		  ; Frame
		movem.w	d1,-(sp)
		move.w	d1,d0
		movem.l	d4-d5/a3,-(sp)
		bsr.w	LoadObjectVDPSprites
		movea.l	a3,a6
		movem.l	(sp)+,d4-d5/a3

_offsetPieces:
		add.w	d4,$6(a3)
		add.w	d5,(a3)
		addq.w	#$08,a3
		cmpa.l	a6,a3
		bcs.s	_offsetPieces
		movem.w	(sp)+,d0
		bra.s	LoadSpriteTiles


; Loads an item icon: d0 = 6-bit code (high 3 bits = animation, low 3
; = frame) of sprite graphic $23 (the item icon sheet), VRAM slot d1.
LoadItemIconGfx:
		bsr.s	_decodeItemIcon


; Loads tiles only (no pieces) for sprite d0 animation d2 frame d3
; into VRAM slot d1, through the DMA queue.
LoadSpriteTilesQueued:


		move.l	(_jmpQueueDMAOp,pc),(JmpInstr1).l
		move.w	((_jmpQueueDMAOp+4),pc),(JmpInstr1+4).l
		bra.s	_spriteTileLookup


_decodeItemIcon:
		move.b	d0,d2
		andi.b	#$07,d0
		lsl.b	#$02,d0
		ext.w	d0
		move.w	d0,d3
		andi.b	#$38,d2
		lsr.b	#$01,d2
		ext.w	d2
		move.l	#$23,d0
		rts

		bsr.s	_decodeItemIcon
		move.l	(_jmpDoDMACopy,pc),(JmpInstr1).l
		move.w	((_jmpDoDMACopy+4),pc),(JmpInstr1+4).l

_spriteTileLookup:
		lea	(SpriteGfxPtrPtr).l,a4
		movea.l	(a4),a0
		lsl.w	#$02,d0
		move.w	$4(a4,d0.w),d0
		lsl.w	#$02,d0
		adda.l	d0,a0
		movea.l	(a0,d2.w),a0
		movea.l	(a0,d3.w),a0

_skipPieceDefs:
		addq.l	#$01,a0
		tst.b	(a0)+
		bpl.s	_skipPieceDefs
		move.w	d1,d0


; Streams a frame's tile list into VRAM at slot d0: per entry either
; a raw run (DMA from ROM), a zero-fill run, or an LZ77-compressed
; block; terminates on the end flag ($4000).
LoadSpriteTiles:
		movea.l	a0,a6
		lsl.w	#$05,d0
		movea.w	d0,a1

_tileLoop:
		move.b	(a6)+,d0
		lsl.w	#$08,d0
		move.b	(a6)+,d0
		move.w	d0,d7
		bmi.s	_zeroFill
		andi.w	#$2000,d7
		bne.s	_compressed
		move.w	d0,d7
		andi.w	#$0FFF,d0
		movea.l	a6,a0
		jsr	(JmpInstr1).l
		movea.l	a0,a6
		andi.w	#$4000,d7
		beq.s	_tileLoop
		clr.b	d0
		rts

_zeroFill:
		lea	Zeros(pc),a0
		andi.w	#$0FFF,d0
		jsr	(JmpInstr1).l
		andi.w	#$4000,d7
		beq.s	_tileLoop
		clr.b	d0
		rts

_compressed:
		movea.l	a6,a0
		movea.l	a1,a2
		lea	(g_Buffer).l,a1
		movem.l	a3,-(sp)
		bsr.w	LoadCompressedGfx	  ; a0 - compressed graphics source
						  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination
		movem.l	(sp)+,a3
		moveq	#$FFFFFFFF,d0
		rts

Zeros:		dcb.w $F0,$0000


; Depth-sorts the draw list. The straight DrawOrder insertion sort
; below is unreachable (skipped by the bra) - replaced by the overlap
; sort + rider fix-up.
SortSpritesByDepth:
		bra.w	_sortMain
		lea	(Player_X).l,a0
		lea	(g_SpriteDrawList).l,a2

_oldSortLoop:
		movea.l	a2,a3
		tst.w	(a3)+
		move.w	(a2),d2
		bmi.s	_oldSortDone

_oldSortInner:
		move.w	(a3),d3
		bmi.s	_oldSortNext
		move.w	DrawOrder(a0,d2.w),d0
		cmp.w	DrawOrder(a0,d3.w),d0
		bhi.s	_oldSortSkip
		move.w	(a2),d0
		move.w	(a3),(a2)
		move.w	d0,(a3)+
		move.w	(a2),d2
		bra.s	_oldSortInner

_oldSortSkip:
		tst.w	(a3)+
		bra.s	_oldSortInner

_oldSortNext:
		tst.w	(a2)+
		bra.s	_oldSortLoop

_oldSortDone:
		rts

_sortMain:
		bsr.s	_overlapOrderFix
		bsr.s	_riderOrderFix
		rts


; Bubble pass: when two sprites' hitboxes overlap in X/Y, the one with
; lower Z must draw first; swaps draw-list entries until settled.
_overlapOrderFix:
		lea	(Player_X).l,a0
		lea	(g_SpriteDrawList).l,a2
		moveq	#$E,d7

_ooLoop:
		movem.w	d7,-(sp)
		movea.l	a2,a3
		tst.w	(a3)+
		move.w	(a2),d2
		move.w	(a3),d3

_ooInner:
		tst.w	d2
		bmi.s	_ooSwap
		tst.w	d3
		bmi.s	_ooSkip
		tst.w	(a0,d3.w)
		bmi.s	_ooNextOuter
		move.w	HitBoxXStart(a0,d2.w),d0
		cmp.w	HitBoxXEnd(a0,d3.w),d0
		bcc.s	_ooSkip
		move.w	HitBoxYStart(a0,d2.w),d0
		cmp.w	HitBoxYEnd(a0,d3.w),d0
		bcc.s	_ooSkip
		move.w	HitBoxXEnd(a0,d2.w),d0
		cmp.w	HitBoxXStart(a0,d3.w),d0
		bls.s	_ooSwap
		move.w	HitBoxYEnd(a0,d2.w),d0
		cmp.w	HitBoxYStart(a0,d3.w),d0
		bls.s	_ooSwap
		move.w	Z(a0,d2.w),d0
		cmp.w	Z(a0,d3.w),d0
		bcs.s	_ooSwap

_ooSkip:
		tst.w	(a3)+

_ooNextInner:
		move.w	(a3),d3
		dbf	d7,_ooInner

_ooNextOuter:
		movem.w	(sp)+,d7
		tst.w	(a2)+
		move.w	(a2),d2
		dbf	d7,_ooLoop
		rts

_ooSwap:
		move.w	(a2),d0
		move.w	(a3),(a2)
		move.w	d0,(a3)+
		move.w	(a2),d2
		bra.s	_ooNextInner


; Ensures anything standing on another sprite draws after it: moves
; the platform's list entry in front of its rider.
_riderOrderFix:
		lea	(g_SpriteDrawList).l,a3
		lea	(Player_X).l,a1

_roLoop:
		movea.l	a3,a0
		tst.w	(a3)+
		move.w	(a0)+,d0
		movea.l	a0,a2

_roScan:
		move.w	(a0)+,d1
		bmi.s	_roNext
		cmp.w	SpriteUnderneath(a1,d1.w),d0
		bne.s	_roScan

_roShift:
		move.w	(a2)+,-$4(a2)
		cmpa.l	a2,a0
		bne.s	_roShift
		move.w	d0,-$2(a2)
		move.w	-$2(a3),d0
		tst.w	SpriteUnderneath(a1,d0.w)
		bpl.s	_roBack
		movea.l	a3,a2
		bra.s	_roShift

_roBack:
		tst.w	-(a3)

_roNext:
		tst.w	(a3)
		bpl.s	_roLoop
		rts


DecompressAndQueueGfxCopy:
		movem.l	a2,-(sp)
		movea.l	a1,a2
		bsr.w	DecompressLZ77Gfx
		move.l	a1,d0
		sub.l	a2,d0
		lsr.w	#$01,d0
		movea.l	a2,a0
		movem.l	(sp)+,a1
		bra.w	QueueDMAOp		  ; d0 - DMA Length
						  ; a1 - DMA Copy


; a0 - compressed graphics source
; a1 - decompressed graphics buffer
; a2 - VDP tile	graphics destination

LoadCompressedGfx:
		movem.l	a2,-(sp)
		movea.l	a1,a2
		bsr.w	DecompressLZ77Gfx
		move.l	a1,d0
		sub.l	a2,d0
		lsr.w	#$01,d0
		move.w	#$0002,d1
		movea.l	a2,a0
		movem.l	(sp)+,a1
		bra.w	DoDMACopy		  ; d0 = DMA Length
						  ; a1 = DMA Destination


; LZ77 decompressor: control byte selects literal bytes vs back
; references ({offset, length} pairs, 2-18 bytes via the jump into the
; copy ladder). Terminated by a zero offset word.
DecompressLZ77Gfx:
		moveq	#$F,d4

_nextCtrl:
		moveq	#$7,d3
		move.b	(a0)+,d0
		bmi.s	_literal

_backRef:
		clr.w	d1
		move.b	(a0)+,d1
		move.w	d1,d2
		and.b	d4,d1
		add.b	d1,d1
		lsl.w	#$04,d2
		move.b	(a0)+,d2
		tst.w	d2
		beq.s	_lzDone
		movea.l	a1,a3
		suba.w	d2,a3
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		jmp	_copyRun(pc,d1.w)

_copyRun:
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		move.b	(a3)+,(a1)+
		add.b	d0,d0
		dbmi	d3,_backRef
		dbpl	d3,_literal
		bra.s	_nextCtrl

_literal:
		move.b	(a0)+,(a1)+
		add.b	d0,d0
		dbpl	d3,_literal
		dbmi	d3,_backRef
		bra.s	_nextCtrl

_lzDone:
		rts


; Queues a VDP copy that blanks the on-screen block at map coords
; d0/d1 (used by doors); no-op if the block is off screen.
QueueClearMapBlock:
		movem.l	d0-d1/a0,-(sp)
		bsr.w	_screenBlockIndex
		bcs.s	_qcbDone
		lea	(VDPCopyBlockCmds).l,a1
		lsl.w	#$03,d5
		adda.w	d5,a1
		movea.l	(g_ScreenBufferPtr).l,a0
		move.w	(a1),(a0)+
		clr.l	(a0)+
		move.w	(a1),(a0)+
		clr.l	(a0)+
		addq.l	#$04,a1
		move.w	(a1),(a0)+
		clr.l	(a0)+
		move.w	(a1),(a0)+
		clr.l	(a0)+
		move.l	a0,(g_ScreenBufferPtr).l
		addq.b	#$01,(g_PendingBlockCopies).l

_qcbDone:
		movem.l	(sp)+,d0-d1/a0
		rts


; Applies a tile swap definition (a0): stashes the pending-copy count
; (FIX_TS_GLITCH resets it to avoid re-flushing stale entries), swaps
; the visible screen blocks, then patches the heightmap and both map
; block layers.
DoTileSwap:
		move.b	(g_PendingBlockCopies).l,(g_SavedBlockCopies).l
	if FIX_TS_GLITCH
		clr.b	(g_PendingBlockCopies).l
	endif
		movem.w	d0,-(sp)
		bsr.w	LoadTileSwap
		bsr.w	GetMapOffsets
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		move.b	(a0)+,d6
		move.b	(a0)+,d7
		ext.w	d0
		ext.w	d1
		ext.w	d6
		ext.w	d7
		movem.l	a0,-(sp)
		bsr.s	_swapScreenBlocks
		movem.l	(sp)+,a0
		bsr.w	HMTileSwap
		movem.w	(sp)+,d0
		bsr.w	MapTileSwap
		move.b	(g_SavedBlockCopies).l,(g_PendingBlockCopies).l
		rts


; Copies the swapped blocks that are currently on screen to the VDP,
; in one of three orientations selected by byte 9 of the definition:
; 0 = flat X*Y area, 1 = NE-facing wall, 2 = NW-facing wall.
_swapScreenBlocks:
		cmpi.b	#$01,$9(a0)
		beq.s	_wallXInit
		bhi.w	_wallYInit
		move.w	d0,d2
		move.w	d1,d3

_flatRowLoop:
		movem.l	d0/d2/d6/a1-a2,-(sp)

_flatCellLoop:
		bsr.w	_screenBlockIndex
		bcs.s	_flatNext
		movem.w	d0-d1/d5,-(sp)
		move.w	d2,d0
		move.w	d3,d1
		bsr.w	_screenBlockIndex
		movem.w	(sp)+,d0-d1/d4
		bcs.s	_flatNext
		bsr.w	_queueSwapBlockPair

_flatNext:
		addq.w	#$02,a1
		addq.w	#$02,a2
		addq.b	#$01,d0
		addq.b	#$01,d2
		dbf	d6,_flatCellLoop
		movem.l	(sp)+,d0/d2/d6/a1-a2
		lea	$94(a1),a1
		lea	$94(a2),a2
		addq.b	#$01,d1
		addq.b	#$01,d3
		dbf	d7,_flatRowLoop
		rts

_wallXInit:
		move.w	d0,d2
		move.w	d1,d3
		addq.w	#$01,d0
		addq.w	#$02,a1

_wallXRowLoop:
		movem.l	d0/d2/d6/a1-a2,-(sp)

_wallXCellLoop:
		bsr.w	_screenBlockIndex
		bcs.s	_wallXNext
		movem.w	d0-d1/d5,-(sp)
		move.w	d2,d0
		move.w	d3,d1
		bsr.w	_screenBlockIndex
		movem.w	(sp)+,d0-d1/d4
		bcs.s	_wallXNext
		bsr.w	_queueSwapBlockPair

_wallXNext:
		addq.w	#$02,a1
		addq.w	#$02,a2
		addq.b	#$01,d0
		addq.b	#$01,d2
		dbf	d6,_wallXCellLoop
		movem.l	(sp)+,d0/d2/d6/a1-a2
		lea	$96(a1),a1
		lea	$96(a2),a2
		addq.b	#$01,d0
		addq.b	#$01,d2
		addq.b	#$01,d1
		addq.b	#$01,d3
		dbf	d7,_wallXRowLoop
		rts

_wallYInit:
		move.w	d0,d2
		move.w	d1,d3
		addq.w	#$01,d3
		lea	$94(a2),a2

_wallYRowLoop:
		movem.l	d1/d3/d6/a1-a2,-(sp)

_wallYCellLoop:
		bsr.w	_screenBlockIndex
		bcs.s	_wallYNext
		movem.w	d0-d1/d5,-(sp)
		move.w	d2,d0
		move.w	d3,d1
		bsr.w	_screenBlockIndex
		movem.w	(sp)+,d0-d1/d4
		bcs.s	_wallYNext
		bsr.w	_queueSwapBlockPair

_wallYNext:
		lea	$94(a1),a1
		lea	$94(a2),a2
		addq.b	#$01,d1
		addq.b	#$01,d3
		dbf	d6,_wallYCellLoop
		movem.l	(sp)+,d1/d3/d6/a1-a2
		lea	$96(a1),a1
		lea	$96(a2),a2
		addq.b	#$01,d0
		addq.b	#$01,d2
		addq.b	#$01,d1
		addq.b	#$01,d3
		dbf	d7,_wallYRowLoop
		rts


_queueSwapBlockPair:
		movem.l	d2-d5/a1-a3,-(sp)
		move.w	(a1),d2
		move.w	(a2),d3
		lsl.w	#$03,d2
		lsl.w	#$03,d3
		lea	(VDPCopyBlockCmds).l,a1
		lsl.w	#$03,d4
		adda.w	d4,a1
		lea	(VDPCopyBlockCmds).l,a3
		lsl.w	#$03,d5
		adda.w	d5,a3
		movea.l	(g_ScreenBufferPtr).l,a0
		lea	(g_Blockset).l,a2
		move.w	(a1),(a0)+
		move.l	(a2,d2.w),(a0)+
		addq.w	#$04,a1
		move.w	$2(a3),(a0)+
		move.l	(a2,d3.w),(a0)+
		addq.w	#$06,a3
		move.w	(a1),(a0)+
		move.l	$4(a2,d2.w),(a0)+
		addq.w	#$04,a1
		move.w	(a3),(a0)+
		move.l	$4(a2,d3.w),(a0)+
		addq.w	#$04,a3
		move.l	a0,(g_ScreenBufferPtr).l
		addq.b	#$01,(g_SavedBlockCopies).l
		movem.l	(sp)+,d2-d5/a1-a3
		rts


; Converts map block coords d0/d1 to a VRAM block-table index in d5,
; walking g_BlockTableIndex with the same wrap rules as the camera;
; carry set if outside the +/-$C on-screen diamond.
_screenBlockIndex:
		movem.w	d0-d1/d6-d7,-(sp)
		move.w	(g_BlockTableIndex).l,d5
		move.b	(g_PlayerXFlattened).l,d6
		move.b	(g_PlayerYFlattened).l,d7
		ext.w	d6
		ext.w	d7
		sub.w	d6,d0
		sub.w	d7,d1
		move.w	d0,d6
		move.w	d1,d7
		add.w	d6,d7
		addi.w	#$000C,d7
		cmpi.w	#$0018,d7
		bcc.w	_sbOffScreen
		move.w	d0,d6
		move.w	d1,d7
		sub.w	d7,d6
		addi.w	#$000C,d6
		cmpi.w	#$0018,d6
		bcc.w	_sbOffScreen
		tst.w	d0
		beq.s	_sbY
		bpl.s	_sbXPos
		neg.w	d0
		subq.w	#$01,d0

_sbXNegLoop:
		subq.w	#$01,d5
		move.w	d5,d6
		andi.w	#$001F,d6
		cmpi.w	#$001F,d6
		bne.s	_sbXNegNext
		addi.w	#$0020,d5

_sbXNegNext:
		dbf	d0,_sbXNegLoop
		bra.s	_sbY

_sbXPos:
		subq.w	#$01,d0

_sbXPosLoop:
		addq.w	#$01,d5
		move.w	d5,d6
		andi.w	#$001F,d6
		bne.s	_sbXPosNext
		subi.w	#$0020,d5

_sbXPosNext:
		dbf	d0,_sbXPosLoop

_sbY:
		tst.w	d1
		beq.s	_sbOnScreen
		bpl.s	_sbYPos
		neg.w	d1
		subq.w	#$01,d1

_sbYNegLoop:
		subi.w	#$0020,d5
		bpl.s	_sbYNegNext
		addi.w	#$0210,d5
		cmpi.w	#$0200,d5
		bcs.s	_sbYNegNext
		subi.w	#$0020,d5

_sbYNegNext:
		dbf	d1,_sbYNegLoop
		bra.s	_sbOnScreen

_sbYPos:
		subq.w	#$01,d1

_sbYPosLoop:
		addi.w	#$0020,d5
		cmpi.w	#$0200,d5
		bcs.s	_sbYPosNext
		subi.w	#$0210,d5
		bpl.s	_sbYPosNext
		addi.w	#$0020,d5

_sbYPosNext:
		dbf	d1,_sbYPosLoop

_sbOnScreen:
		movem.w	(sp)+,d0-d1/d6-d7
		tst.b	d0
		rts

_sbOffScreen:
		movem.w	(sp)+,d0-d1/d6-d7
		ori	#$01,ccr
		rts


GetMapOffsets:
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		ext.w	d0
		ext.w	d1
		bsr.s	GetMapCoordOffset	  ; d0 = X
						  ; d1 = Y
		lea	(g_ForegroundBlocks).l,a1
		lea	(g_BackgroundBlocks).l,a2
		adda.w	d1,a1
		adda.w	d1,a2
		rts


GetHeightmapCoordOffset:
		move.b	(a0)+,d0
		move.b	(a0)+,d1
		ext.w	d0
		ext.w	d1
		bsr.s	GetMapCoordOffset	  ; d0 = X
						  ; d1 = Y
		lea	(g_HeightMap).l,a1
		adda.w	d1,a1
		rts


; d0 = X
; d1 = Y

; d1 = byte offset of map cell (d0,d1): Y*148 + X*2.
GetMapCoordOffset:
		bsr.w	MultiplyD1By148
		add.w	d0,d1
		add.w	d0,d1
		rts

		modend
