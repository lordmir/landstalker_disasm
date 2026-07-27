DialogueActionsHelpers	module

; Friday's spell pose, then wait for her flight path to finish
; (FridayWait: until she perches or flaps in place).
FridayCastSpell:
		move.b	#FRIDAY_SPELL,(g_FridayAnimation2).l

FridayWait:
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#FRIDAY_PERCH,(g_FridayAnimation1).l
		beq.s	_fridayRts
		cmpi.b	#FRIDAY_FLAP,(g_FridayAnimation1).l
		bne.s	FridayWait

_fridayRts:
		rts

; Sets both current and original room to d0.
SetRoomNumber:
		move.w	d0,(g_CurrentRoom).l
		move.w	d0,(g_OriginalRoom).l
		rts

; Swaps the on-screen appearance of sprites d0+1 and d1+1: their VDP
; piece buffers (g_Sprite1VdpPieces + n*$40) and the struct fields
; that drive rendering (RotationAndSize, TileSource, AnimCtrl,
; AnimationIndex/Frame, SpriteType and the Pad6E/AnimFlags word).
SwapSpriteAppearance:
		ext.w	d0
		ext.w	d1
		lsl.w	#$06,d0
		lsl.w	#$06,d1
		movem.w	d0-d1,-(sp)
		lea	(g_Sprite1VdpPieces).l,a0
		lea	(g_Sprite1VdpPieces).l,a1
		adda.w	d0,a0
		adda.w	d1,a1
		move.w	#$001F,d7

_ssaVdpSwap:
		move.w	(a0),d2
		move.w	(a1),(a0)+
		move.w	d2,(a1)+
		dbf	d7,_ssaVdpSwap
		movem.w	(sp)+,d0-d1
		add.w	d0,d0
		add.w	d1,d1
		lea	(Sprite1_X).l,a0
		lea	(Sprite1_X).l,a1
		adda.w	d0,a0
		adda.w	d1,a1
		move.w	RotationAndSize(a0),d0
		move.w	RotationAndSize(a1),RotationAndSize(a0)
		move.w	d0,RotationAndSize(a1)
		move.w	TileSource(a0),d0
		move.w	TileSource(a1),TileSource(a0)
		move.w	d0,TileSource(a1)
		move.w	AnimCtrl(a0),d0
		move.w	AnimCtrl(a1),AnimCtrl(a0)
		move.w	d0,AnimCtrl(a1)
		move.l	AnimationIndex(a0),d0
		move.l	AnimationIndex(a1),AnimationIndex(a0)
		move.l	d0,AnimationIndex(a1)
		move.b	SpriteType(a0),d0
		move.b	SpriteType(a1),SpriteType(a0)
		move.b	d0,SpriteType(a1)
		move.w	Pad6E(a0),d0
		move.w	Pad6E(a1),Pad6E(a0)
		move.w	d0,Pad6E(a1)
		rts

; The player receives King Nole's treasure: quake, equip the Magic
; Sword look, then a shower of gold coins over the shaking screen
; until the last coin expires (_coinsEndCheck pops out of the loop).
EndingSequence:
		bsr.s	_endingQuake
		bsr.w	_equipMagicSword
		bsr.w	_initCoins
		move.w	#$0200,(g_Scratch1804).l
		move.w	#$0200,(g_CoinPalStep).l
		move.w	#$0E00,(g_CoinPalWrap).l

_endLoop:
		bsr.w	_quakeStep
		bsr.w	_updateCoins
	if ENABLE_GOLD_COUNT
		move.w	#00013,d0
	if REFRESH_GOLD_CTR
		jsr	(AddGold).l
		jsr	(j_QueuePartialHUDTilemapDMA).l
	endif
	endif
		jsr	(j_FlushDMACopyQueue).l
		bsr.w	_coinsEndCheck
		bra.w	_endLoop

; Returns to the ending loop while any coin sprite is alive; when
; all are gone, pops the return address to exit EndingSequence.
_coinsEndCheck:
		movea.l	a1,a0
		move.w	d6,d7

_cecScan:
		tst.w	RotationAndSize(a0)
		bne.s	_cecRts
		addq.w	#$08,a0
		dbf	d7,_cecScan
		movem.l	(sp)+,a0

_cecRts:
		rts

; Eight rumbles of screen shake with growing amplitude
; (g_Scratch1800 = current shake step).
_endingQuake:
		moveq	#$00000007,d7
		move.w	#$0001,(g_Scratch1800).l

_eqRumble:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Rumble
; ---------------------------------------------------------------------------
		movem.w	d7,-(sp)
		move.w	#$0027,d6

_eqShake:
		bsr.s	_quakeStep
		jsr	(j_WaitUntilVBlank).l
		dbf	d6,_eqShake
		cmpi.w	#$0004,(g_Scratch1800).l
		bcc.s	_eqNext
		addq.w	#$01,(g_Scratch1800).l

_eqNext:
		movem.w	(sp)+,d7
		dbf	d7,_eqRumble
		rts

; One shake tick: oscillate both VSRAM scroll values.
_quakeStep:
		movem.l	d0-a6,-(sp)
		move.w	(g_Scratch1800).l,d0
		add.w	d0,(g_VSRAMData).l
		add.w	d0,(g_VSRAMData+2).l
		neg.w	d0
		move.w	d0,(g_Scratch1800).l
		jsr	(j_QueueVSRAMUpdate).l
		jsr	(j_EnableDMAQueueProcessing).l
		movem.l	(sp)+,d0-a6
		rts

; Show the Magic Sword equipped for the finale.
_equipMagicSword:
		move.b	#$05,(g_EquippedSword).l
		jsr	(j_LoadMagicSwordGfx).l
		jsr	(j_UpdateEquipPal).l
		jsr	(j_CopyBasePaletteToActivePalette).l
		rts

; Builds VDP sprites for the falling coins after the last in-use
; slot: random X/Y around the screen, three tile variants.
_initCoins:
		lea	(g_VDPSpr16_Y).l,a0
		move.b	#$10,d3
		move.w	#$003E,d7

_icScan:
		tst.w	(a0)
		beq.s	_icClamp
		addq.b	#$01,d3
		addq.w	#$08,a0
		dbf	d7,_icScan

_icClamp:
		cmpi.b	#$28,d7
		bcs.s	_icLink
		move.b	#$28,d7

_icLink:
		move.b	d3,(g_VDPSpr15_Link).l
		movea.l	a0,a1
		move.w	d7,d6
		move.w	#$C78C,d0
		clr.b	d1
		move.w	#$0004,d4
		clr.b	d5
		movem.w	d6-d7,-(sp)

_icSpawn:
		movem.w	d7,-(sp)
		move.w	#$00E0,d6
		jsr	(j_GenerateRandomNumber).l
		subi.w	#$0060,d7
		move.w	d7,(a0)
		move.b	#$0F,$00000002(a0)
		move.w	d0,$00000004(a0)
		move.w	#$0140,d6
		jsr	(j_GenerateRandomNumber).l
		addi.w	#$0080,d7
		move.w	d7,$00000006(a0)
		addi.w	#$0010,d0
		addq.b	#$01,d1
		cmpi.b	#$03,d1
		bcs.s	_icNext
		clr.b	d1
		subi.w	#$0030,d0

_icNext:
		addq.w	#$08,a0
		movem.w	(sp)+,d7
		dbf	d7,_icSpawn
		movem.w	(sp)+,d6-d7
		move.w	#$0001,-$00000008(a0)
		move.b	#$10,-$00000005(a0)
		rts

; ---------------------------------------------------------------------------

; Per-frame coin update: each coin falls at a speed set by its tile
; variant, expired ones respawn at the top at a random X with random
; chimes, and every $F8 frames the phase (d5) advances: palette
; cycling from phase 3, everything cleared from phase $C.
_updateCoins:
		movea.l	a1,a0
		move.w	d6,d7
		clr.b	d0

_ucLoop:
		tst.l	$00000004(a0)
		beq.w	_ucNext
		move.w	#$0007,d1
		cmpi.w	#$C78C,$00000004(a0)
		beq.s	_ucMove
		move.w	#$0005,d1
		cmpi.w	#$C79C,$00000004(a0)
		beq.s	_ucMove
		move.w	#$0003,d1

_ucMove:
		add.w	d1,(a0)
		tst.w	(a0)
		bmi.s	_ucNext
		cmpi.w	#$0138,(a0)
		bcs.s	_ucNext
		cmpi.b	#$0C,d5
		bne.s	_ucRespawn
		clr.w	(a0)
		clr.b	$00000002(a0)
		clr.w	$00000004(a0)
		clr.w	$00000006(a0)
		bra.s	_ucNext
; ---------------------------------------------------------------------------

_ucRespawn:
		move.w	#$0088,(a0)
		movem.w	d6-d7,-(sp)
		move.w	#$0140,d6
		jsr	(j_GenerateRandomNumber).l
		addi.w	#$0080,d7
		move.w	d7,$00000006(a0)
		btst	#$02,d7
		bne.s	_ucRumble
		movem.w	d0,-(sp)
		move.b	#SND_HealthRecover1,d0
		andi.b	#$03,d7
		beq.s	_ucSound
		move.b	#SND_CursorMove,d0
		cmpi.b	#$01,d7
		beq.s	_ucSound
		move.b	#SND_CursorSelect,d0
		cmpi.b	#$02,d7
		beq.s	_ucSound
		move.b	#SND_SwordHit,d0

_ucSound:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_LoadFromD0
; ---------------------------------------------------------------------------
		movem.w	(sp)+,d0
		bra.s	_ucPop
; ---------------------------------------------------------------------------

_ucRumble:
		btst	#$03,d7
		bne.s	_ucPop
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Rumble
; ---------------------------------------------------------------------------

_ucPop:
		movem.w	(sp)+,d6-d7

_ucNext:
		addq.w	#$08,a0
		dbf	d7,_ucLoop
		cmpi.w	#$00F8,-$00000008(a0)
		bcs.s	_ucRts
		move.w	#$0001,-$00000008(a0)
		addq.b	#$01,d5
		cmpi.b	#$03,d5
		bcs.s	_ucChkEnd
		cmpi.b	#$0A,d5
		bcc.s	_ucChkEnd
		bsr.s	_coinPalCycle

_ucChkEnd:
		cmpi.b	#$0C,d5
		bcs.s	_ucRts
		clr.w	-$00000008(a0)
		clr.b	-$00000006(a0)
		clr.w	-$00000004(a0)
		clr.w	-$00000002(a0)

_ucRts:
		rts

; Register-preserving wrapper around _coinPalApply.
_coinPalCycle:
		movem.l	d0-a6,-(sp)
		bsr.s	_coinPalApply
		movem.l	(sp)+,d0-a6
		rts

; One palette-cycle step: push every colour through _coinPalColour
; with phase g_Scratch1804 (step g_CoinPalStep, overflow replacement
; g_CoinPalWrap).
_coinPalApply:
		move.w	(g_Scratch1804).l,d3
		move.w	(g_CoinPalStep).l,d4
		move.w	(g_CoinPalWrap).l,d7
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		move.w	#$003F,d5

_cpaLoop:
		move.w	(a0)+,d0
		bsr.s	_coinPalColour
		move.w	d0,(a1)+
		dbf	d5,_cpaLoop
		jsr	(j_QueueFullPaletteDMA).l
		add.w	d4,d3
		move.w	d3,(g_Scratch1804).l
		move.w	d4,(g_CoinPalStep).l
		move.w	d7,(g_CoinPalWrap).l
		rts

; Adds the phase to each BGR channel, replacing any channel that
; overflows with the (per-channel shifted) wrap colour.
_coinPalColour:
		move.w	d0,d1
		andi.w	#$0E00,d1
		add.w	d3,d1
		andi.w	#$1E00,d1
		cmpi.w	#$1000,d1
		bcs.s	_cpcGreen
		move.w	d7,d1

_cpcGreen:
		lsr.w	#$04,d3
		lsr.w	#$04,d7
		move.w	d0,d2
		andi.w	#$00E0,d2
		add.w	d3,d2
		andi.w	#$01E0,d2
		cmpi.w	#$0100,d2
		bcs.s	_cpcRed
		move.w	d7,d2

_cpcRed:
		lsr.w	#$04,d3
		lsr.w	#$04,d7
		andi.w	#$000E,d0
		add.w	d3,d0
		andi.w	#$001E,d0
		cmpi.w	#$0010,d0
		bcs.s	_cpcOut
		move.w	d7,d0

_cpcOut:
		lsl.w	#$08,d3
		lsl.w	#$08,d7
		or.w	d2,d0
		or.w	d1,d0
		rts

	modend
