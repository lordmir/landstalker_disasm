LoadRoomSprites	module
; Room load: populates the 15 sprite slots from the room's sprite
; table, applies the persistent-flag fixups (hidden sprites, opened
; doors, pressed switches, cut trees) and computes the derived
; position fields.
InitSprites:
		bsr.s	ClearSpriteTable
		bsr.s	InitialiseSprites
		bsr.w	CheckFlags
		bsr.w	InitSpritePositions
		jsr	(j_InitSpritePalettes).l
		rts


ClearSpriteTable:
		lea	(Sprite1_X).l,a1
		move.w	#$077F,d7

_clrLoop:
		clr.b	(a1)+
		dbf	d7,_clrLoop
		rts


; Decodes the room's RoomSpriteTable entries (8 bytes per sprite,
; $FF-terminated) into sprite slots from Sprite1 up:
;   byte 0: X cell (low 6 bits) | facing (top 2)
;   byte 1: Y cell (low 6 bits) | tile bank (top 2)
;   byte 2: hostile/interact flag bits | speed index (low 3)
;   byte 3: bit 7/6 = half-cell X/Y offset, rest = tile copy source
;   bytes 4-5: dialogue word; low byte = sprite type, and types
;     >= $C0 are items (type - $C0 = item id)
;   byte 6: Z * 16 (bit 6 = +8), bits 4/5/7 = state/fall flags
;   byte 7 (+ byte 4 top 2 bits): behaviour index (0 = default 2)
; Items get special handling: a Life Stock is removed if already
; bought or health is maxed (a missing LifestockSoldFlags entry
; triggers a 30-beep debug alarm), and other items are removed when
; the room already shows the inventory-allowed count (except in the
; Nole staircase room, letting the Gola items animate). Chests look
; up their contents; already-opened ones show the open lid and $FF
; contents - except in the Crypt bogus chest room, whose flag is
; re-cleared so the trap chest keeps coming back. Sprites with
; behaviour 1 get their BehavParam staggered by g_BehavPhaseStagger
; so they don't animate in sync; motionless sprites are marked fixed
; (FallRate bit 7); hostiles get their stats from EnemyStats.
; Finally the Init* mirror fields are captured for respawning.
InitialiseSprites:
		lea	RoomSpriteTableOffset(pc),a0
		nop
		lea	(Sprite1_X).l,a1
		clr.b	(g_BehavPhaseStagger).l
		clr.b	(g_chestCount).l
		move.w	(g_CurrentRoom).l,d7
		add.w	d7,d7
		move.w	(a0,d7.w),d2
		beq.w	_endTable		  ; No sprites
		subq.w	#$01,d2
		lea	(RoomSpriteTable).l,a2
		adda.l	d2,a2

_nextSprite:
		move.b	(a2)+,d0		  ; d0 = data[0]
						  ; A2 = &data[1]
		cmpi.b	#$FF,d0
		beq.w	_endTable		  ; End	of table for room
		move.b	d0,d1
		andi.b	#$3F,d0
		move.b	d0,X(a1)
		move.b	(a2)+,d2		  ; d2 = data[1]
						  ; a2 = &data[2]
		move.b	d2,d3
		andi.b	#$3F,d2
		move.b	d2,Y(a1)
		move.w	#$0808,SubX(a1)
		andi.b	#$C0,d1
		move.b	d1,RotationAndSize(a1)
		andi.w	#$00C0,d3
		lsl.w	#$07,d3
		move.w	d3,TileSource(a1)
		move.b	(a2)+,d0		  ; d0 = data[2]
						  ; a2 = &data[3]
		move.b	d0,d3
		andi.b	#$80,d0
		lsr.b	#$01,d3
		move.b	d3,d2
		andi.b	#$34,d3
		or.b	d3,d0
		andi.b	#$20,d3
		movem.w	d0,-(sp)
		move.b	-1(a2),d0	  ; a2 = &data[3]
						  ; d0 = data[2]
		andi.w	#$0007,d0
		movem.w	(sp)+,d0
		bne.s	_setInteract
		lsr.b	#$05,d3
		or.b	d3,d0

_setInteract:
		lsr.b	#$03,d2
		andi.b	#$01,d2
		or.b	d2,d0
		move.b	d0,InteractFlags(a1)
		move.b	-1(a2),d0	  ; a2 = &data[3]
						  ; d0 = data[2]
		andi.w	#$0007,d0
		move.b	#$01,AnimCtrl(a1)
		move.b	SpeedLUT(pc,d0.w),Speed(a1)
		bra.s	_chkHalfX		  ; a2 = &data[3]
SpeedLUT:
		dc.b $00,$01,$02,$04,$08,$00

_chkHalfX:
		tst.b	(a2)			  ; a2 = &data[3]
		bpl.s	_chkHalfY		  ; a2 = &data[3]
		addq.b	#$08,SubX(a1)
		andi.b	#$0F,SubX(a1)
		addq.b	#$01,X(a1)

_chkHalfY:
		btst	#$06,(a2)		  ; a2 = &data[3]
		beq.s	_readType		  ; spritedata[0x71] = data[3]
						  ; a2 = &data[4]
		addq.b	#$08,SubY(a1)
		andi.b	#$0F,SubY(a1)
		addq.b	#$01,Y(a1)

_readType:
		move.b	(a2)+,TileCopySource(a1)  ; spritedata[0x71] = data[3]
						  ; a2 = &data[4]
		move.w	(a2)+,d0		  ; d0 = data[4..5]
						  ; a2 = &data[6]
		andi.w	#$FCFF,d0
		clr.l	BehaviourLUTPtr(a1)
		move.w	d0,Dialogue(a1)
		andi.w	#$00FF,d0		  ; data[5] (sprite type)
		cmpi.b	#$C0,d0			  ; Test if sprite is an item
		bcs.w	_npcSprite		  ; Not	an item
		move.b	d0,SpriteGraphic(a1)
		subi.b	#$C0,d0
		move.b	d0,GoldOrChestContents(a1)
		cmpi.b	#ITM_LIFESTOCK,d0	  ; Is item a lifestock?
		bne.s	_chkItemLimit		  ; D1 - remaining items left
		cmpi.w	#$62FF,(Player_MaxHealth).l
		bcc.s	_hideLifestock
		jsr	(j_CheckIfLifestockSold).l
		bcc.s	_lsSoldChk
		tst.w	(DebugModeEnable).w
		bmi.s	_setBehaviour
		move.w	#$001D,d7

_lsBeepLoop:
		trap	#$00			  ; Trap00Handler
		dc.w SND_SwordHit
		jsr	(j_WaitUntilVBlank).l
		dbf	d7,_lsBeepLoop
		bra.s	_setBehaviour

_lsSoldChk:
		beq.s	_setBehaviour

_hideLifestock:
		move.b	#$7F,X(a1)		  ; Move lifestock offscreen if	sold or	at max health
		bra.s	_setBehaviour

_chkItemLimit:
		jsr	(j_GetRemainingItemAllowedCount).l ; D1	- remaining items left
		movem.l	d2/a0,-(sp)
		lea	(Sprite1_X).l,a0
		clr.b	d2			  ; D2 - number	of items visible in room
		cmpi.w	#ROOM_PALACE_STAIRCASE,(g_CurrentRoom).l	  ; Staircase to King Nole
		beq.s	_itemCounted		  ; Skip to allow animation for	Gola items

_countItems:
		cmpa.l	a0,a1			  ; Loop over all sprites populated in sprite table so far
		beq.s	_chkOverflow		  ; Test if item presence could	cause overflow
		cmp.b	GoldOrChestContents(a0),d0 ; Check Item	ID is a	match
		bne.s	_nextItem		  ; Get	next sprite from table
		cmpi.b	#SpriteB_Item,SpriteGraphic(a0)	; Check	sprite is an item
		bne.s	_nextItem		  ; Get	next sprite from table
		addq.b	#$01,d2			  ; Increment matching item count

_nextItem:
		lea	SPRITE_SIZE(a0),a0	  ; Get	next sprite from table
		bra.s	_countItems		  ; Loop over all sprites populated in sprite table so far

_chkOverflow:
		cmp.b	d2,d1			  ; Test if item presence could	cause overflow
		bhi.s	_itemCounted
		move.b	#$7F,(a1)		  ; Move item offscreen	(too many)

_itemCounted:
		movem.l	(sp)+,d2/a0

_setBehaviour:
		clr.w	d2
		move.b	-2(a2),d2	  ; a2 = &data[6]
						  ; d2 = data[4]
		andi.b	#$03,d2
		lsl.w	#$08,d2
		move.b	1(a2),d2	  ; a2 = &data[6]
						  ; d2 = data[7]
		bne.s	_setItemAnim
		move.w	#$0002,d2

_setItemAnim:
		move.w	d2,BehaviourLUTIndex(a1)
		move.b	d0,d2			  ; d0 - item ID
		andi.b	#$07,d0
		lsl.b	#$02,d0
		ext.w	d0
		move.w	d0,AnimationFrame(a1)	  ; bottom 3 bits of item ID
		andi.b	#$38,d2
		lsr.b	#$01,d2
		ext.w	d2
		move.w	d2,AnimationIndex(a1)
		move.b	#SpriteB_Item,SpriteGraphic(a1)
		jsr	(LookupSpriteAnimFlags).l
		move.b	-6(a2),d0	  ; a2 = &data[6]
						  ; d0 = data[0]
		andi.b	#$40,d0
		lsr.b	#$03,d0
		andi.b	#$F7,6(a1)
		or.b	d0,6(a1)
		bra.s	_chkChest		  ; Rejoin from	item sequence


; Sets the sprite's graphic index from its type via
; SpriteGfxIdxLookup ({graphic, type} byte pairs).
LookupSpriteGfxIndex:
		lea	SpriteGfxIdxLookup(pc),a0

_sgScan:
		cmp.b	1(a0),d0
		beq.s	_sgFound
		addq.l	#$02,a0
		bra.s	_sgScan

_sgFound:
		move.b	(a0),SpriteGraphic(a1)
		rts


_npcSprite:
		bsr.s	LookupSpriteGfxIndex
		movem.w	d1,-(sp)
		jsr	(LookupSpriteAnimFlags).l
		movem.w	(sp)+,d1		  ; d1 = rotation ?
		bsr.s	SetSpriteRotationAnimFlags

_chkChest:
		clr.w	d0			  ; Rejoin from	item sequence
		move.b	SpriteGraphic(a1),d0
		cmpi.b	#SpriteB_Chest,d0
		bne.w	_setDims		  ; d2 - width/length
						  ; d3 - height
		movem.w	d0,-(sp)
		jsr	(j_LookupChestContents).l
		move.b	#$01,InteractFlags(a1)
		jsr	(j_CheckIfChestOpened).l
		beq.w	_popD0
		cmpi.w	#ROOM_CRYPT_6_LARSON_E,(g_CurrentRoom).l	  ; Crypt Bogus	Chest Room
		bne.w	_initChest
		bclr	d1,(a0,d0.w)
		bra.w	_popD0

_initChest:
		move.b	#$FF,GoldOrChestContents(a1)
		move.w	#$000C,AnimationFrame(a1)
		move.b	#$08,d2
		move.b	#$18,d3
		movem.w	(sp)+,d0
		or.b	d2,RotationAndSize(a1)
		move.b	d3,Height(a1)
		bra.w	_centreWide


; Sets the initial animation for facing d1: SE/SW (facing the
; camera) select animation 4 unless InteractFlags bit 0 overrides,
; AnimFlags 3 adds 8, and the horizontal-flip tile bit follows
; facing unless AnimFlags bit 4 is set. Mimics and mushrooms
; instead load their disguised ambush pose (animation $18, AIState
; $10, CombatFlags $40).
SetSpriteRotationAnimFlags:
		clr.b	d2
		move.b	d1,d0
		addi.b	#$40,d1
		andi.b	#$80,d1
		beq.s	_chkAnim3		  ; branch if d0 = 0xC0	or 0x40
		btst	#$00,InteractFlags(a1)		  ; Check bit0 of spr[0xC]
		bne.s	_chkAnim3		  ; Only true for Zak
		move.b	#$04,d2

_chkAnim3:
		cmpi.b	#$03,AnimFlags(a1)	  ; Only true for Zak
		bne.s	_chkMimic
		addq.b	#$08,d2

_chkMimic:
		cmpi.b	#SpriteB_Mimic,SpriteGraphic(a1)
		bne.s	_chkMushroom
		clr.w	AnimationFrame(a1)

_initAmbush:
		move.w	#$0018,AnimationIndex(a1)
		move.b	#$10,AIState(a1)
		move.b	#$40,CombatFlags(a1)
		rts

_chkMushroom:
		cmpi.b	#SpriteB_Mushroom,SpriteGraphic(a1)
		bne.s	_setAnim
		move.w	#$000C,AnimationFrame(a1)
		bra.s	_initAmbush

_setAnim:
		ext.w	d2
		move.w	d2,AnimationIndex(a1)
		clr.w	AnimationFrame(a1)
		btst	#$04,AnimFlags(a1)
		bne.s	_rotDone
		andi.b	#$40,d0
		lsr.b	#$03,d0
		andi.b	#$F7,TileSource(a1)
		or.b	d0,TileSource(a1)

_rotDone:
		rts


; Applies sprite type d0's size (into RotationAndSize) and height,
; from SpriteDimensionsLookup ({type, size, height}, $FF-terminated;
; default 8/$10).
GetSpriteDims:
		move.b	#$08,d2
		move.b	#$10,d3
		lea	SpriteDimensionsLookup(pc),a0

_dimScan:
		move.b	(a0)+,d1
		cmpi.b	#$FF,d1
		beq.s	_dimApply
		cmp.b	d0,d1
		beq.s	_dimFound
		addq.l	#$02,a0
		bra.s	_dimScan

_dimFound:
		move.b	(a0)+,d2
		move.b	(a0),d3

_dimApply:
		or.b	d2,RotationAndSize(a1)
		move.b	d3,Height(a1)
		rts


_popD0:
		movem.w	(sp)+,d0

_setDims:
		bsr.s	GetSpriteDims		  ; d2 - width/length
						  ; d3 - height

_centreWide:
		cmpi.b	#$0C,d2
		bcs.s	_readZ		  ; If width > 0x0C
		addq.b	#$08,SubX(a1)		  ; Readjust co-ords by	1/2 unit to centre sprite
		cmpi.b	#$10,SubX(a1)
		bcs.s	_centreY
		andi.b	#$0F,SubX(a1)
		addq.b	#$01,(a1)

_centreY:
		addq.b	#$08,SubY(a1)
		cmpi.b	#$10,SubY(a1)
		bcs.s	_readZ
		andi.b	#$0F,SubY(a1)
		addq.b	#$01,Y(a1)

_readZ:
		clr.w	d0
		move.b	(a2)+,d0		  ; d0 = bytes[6]
						  ; a2 = &bytes[7]
		move.b	d0,d1
		move.b	d0,FallRate(a1)
		andi.w	#$8000,FallRate(a1)
		lsl.b	#$04,d0
		move.w	d0,Z(a1)
		btst	#$06,d1
		beq.s	_setStateFlags
		addq.w	#$08,Z(a1)

_setStateFlags:
		move.b	d1,d0
		andi.b	#$10,d1
		move.b	d1,StateFlags(a1)
		andi.b	#$20,d0
		lsr.b	#$05,d0
		or.b	d0,StateFlags(a1)
		clr.w	d0
		move.b	-3(a2),d0	  ; a2 = &bytes[7]
						  ; d0 = byte[4]
		andi.b	#$03,d0
		lsl.w	#$08,d0
		move.b	(a2)+,d0		  ; a2 = &bytes[8]
						  ; d0 = bytes[7]
		tst.w	BehaviourLUTIndex(a1)
		bne.s	_clrActions
		move.w	d0,BehaviourLUTIndex(a1)

_clrActions:
		clr.w	QueuedAction(a1)
		clr.w	PrevAction(a1)
		move.b	#$FF,MovedDirFlags(a1)
		cmpi.b	#SpriteB_Ghost,SpriteGraphic(a1)
		bne.s	_chkStatic
		move.w	#$0008,AnimationIndex(a1)
		clr.w	PrevAction(a1)

_chkStatic:
		tst.b	Speed(a1)
		bne.s	_loadBehaviour
		tst.w	BehavParam(a1)
		bne.s	_loadBehaviour
		btst	#$05,InteractFlags(a1)
		bne.s	_loadBehaviour
		bset	#$07,FallRate(a1)

_loadBehaviour:
		move.w	#$FFFF,SpriteUnderneath(a1)
		movea.l	a1,a5
		move.w	BehaviourLUTIndex(a1),d0
		movem.l	d0/a1,-(sp)
		jsr	(j_LoadSpriteBehaviour).l
		movem.l	(sp)+,d0/a1
		cmpi.w	#$0001,d0
		bne.s	_chkEnemyType
		move.b	(g_BehavPhaseStagger).l,d0
		sub.b	d0,BehavParam(a1)
		addq.b	#$03,(g_BehavPhaseStagger).l
		andi.b	#$0F,(g_BehavPhaseStagger).l

_chkEnemyType:
		cmpi.b	#SpriteB_Chest,SpriteGraphic(a1)
		beq.s	_clrCombat
		cmpi.b	#SpriteB_Mimic,SpriteGraphic(a1)
		beq.s	_chkHostile
		cmpi.b	#SpriteB_Mushroom,SpriteGraphic(a1)
		beq.s	_chkHostile
		clr.b	AIState(a1)

_clrCombat:
		clr.b	CombatFlags(a1)

_chkHostile:
		tst.b	InteractFlags(a1)
		bpl.w	_saveInitState
		bsr.s	GetEnemyStats		  ; sprite type
		bra.w	_saveInitState


; Loads combat stats for enemy a1 from its EnemyStats entry (6 bytes:
; {type, health ($FF = indestructible, sets CombatFlags bit 0),
; defence (*128), gold drop, attack, item drop}). The drop chance
; packs attack bit 7 with the item byte's top two bits into an index
; into ItemDropProbabilityLookup; the item byte's low 6 bits are the
; dropped item id.
GetEnemyStats:
		move.b	SpriteType(a1),d0
		lea	EnemyStats(pc),a0

_esScan:
		cmpi.b	#$FF,(a0)
		beq.s	_esDone
		cmp.b	(a0),d0
		bne.s	_esNext
		move.b	1(a0),CurrentHealth(a1)	; Health
		cmpi.b	#$FF,CurrentHealth(a1)	  ; 0xFF - indestructable
		bne.s	_esStats
		bset	#$00,CombatFlags(a1)

_esStats:
		clr.b	CurrentSubHealth(a1)
		clr.w	d0
		move.b	2(a0),d0	  ; Defence
		lsl.w	#$07,d0
		move.w	d0,Defence(a1)
		move.b	3(a0),GoldOrChestContents(a1) ;	Gold Drop
		move.b	4(a0),d0	  ; Attack
		move.b	d0,d1
		andi.b	#$7F,d0
		lsl.w	#$08,d0
		move.w	d0,AttackStrength(a1)
		andi.b	#$80,d1
		lsr.b	#$04,d1			  ; High bit of	attack is used in item drop chance
		move.b	5(a0),d0
		move.b	d0,d2
		andi.b	#$C0,d0			  ; High 2 bits	of item	drop used to calculate chance
						  ; (DEF & 0x80) >> 5 |	(IDROP & 0xC0) >> 6
		lsr.b	#$05,d0
		or.b	d1,d0
		ext.w	d0
		move.w	ItemDropProbabilityLookup(pc,d0.w),ItemDropProbability(a1) ; 1/64
		andi.b	#$3F,d2
		move.b	d2,ItemDrop(a1)

_esDone:
		rts

_esNext:
		addq.l	#$06,a0
		bra.s	_esScan

ItemDropProbabilityLookup:
		dc.w $0040        ; 1/64
		dc.w $0080        ; 1/128
		dc.w $0100        ; 1/256
		dc.w $0200        ; 1/512
		dc.w $0400        ; 1/1024
		dc.w $0800        ; 1/2048
		dc.w $0000        ; None
		dc.w $0001        ; Guaranteed

_saveInitState:
		move.w	X(a1),InitX(a1)
		move.w	SubX(a1),InitSubX(a1)
		move.w	RotationAndSize(a1),InitRotAndSize(a1)
		move.b	TileSource(a1),InitTileSource(a1)
		move.w	AnimCtrl(a1),InitAnimCtrl(a1)
		move.b	InteractFlags(a1),InitInteractFlags(a1)
		move.w	Z(a1),InitZ(a1)
		move.w	BehavParam(a1),InitBehavParam(a1)
		move.l	BehaviourLUTPtr(a1),InitBehaviourLUTPtr(a1)
		move.b	GoldOrChestContents(a1),InitGoldOrChestCont(a1)
		move.b	CombatFlags(a1),InitCombatFlags(a1)
		move.w	Dialogue(a1),InitDialogue(a1)
		move.w	CurrentHealth(a1),MaxHealth(a1)
		lea	SPRITE_SIZE(a1),a1
		bra.w	_nextSprite		  ; d0 = data[0]
						  ; A2 = &data[1]

_endTable:
		move.w	#$FFFF,(a1)
		rts


; Computes the derived position fields for the player and all 15
; sprites, then removes respawning ghosts whose spawn position fails
; validation. (The in-loop player Z fix-up path is unreachable: the
; player is skipped before the validation step.)
InitSpritePositions:
		lea	(Player_X).l,a1
		move.w	#$000F,d7

_ispLoop:
		move.b	(a1),d0
		bmi.s	_ispDone
		movem.w	d7,-(sp)
		cmpi.b	#$7F,d0
		beq.s	_ispNext
		movem.l	a1,-(sp)
		movem.l	a1,-(sp)
		bsr.s	CalcSpriteHitbox
		movem.l	(sp)+,a1
		cmpa.l	#Player_X,a1
		beq.s	_ispPop
		btst	#$00,StateFlags(a1)
		bne.s	_ispPop
		movea.l	a1,a5
		jsr	(j_ValidateSpritePosition).l
		bcc.s	_ispPop
		cmpa.l	#Player_X,a1
		bne.s	_chkGhost
		movem.l	(sp)+,a1
		move.w	HitBoxZEnd(a1),d1
		addq.w	#$01,d1
		move.w	d1,(Player_Z).l
		add.b	(Player_Height).l,d1
		subq.b	#$01,d1
		move.w	d1,(Player_HitBoxZEnd).l
		bra.s	_ispNext

_chkGhost:
		cmpi.b	#SpriteB_Ghost,InitSpriteGraphic(a1)
		bne.s	_ispPop
		jsr	(j_MoveSpriteOffscreen).l

_ispPop:
		movem.l	(sp)+,a1

_ispNext:
		movem.w	(sp)+,d7
		lea	SPRITE_SIZE(a1),a1
		dbf	d7,_ispLoop

_ispDone:
		rts


; Recomputes sprite a1's derived fields from its cell position:
; pixel centres (cell*16 + sub), heightmap offset (Y*148 + X*2) and
; ground height, the X/Y hitbox from the size bits of
; RotationAndSize, and HitBoxZEnd = Z + Height - 1 (mushrooms use
; bare Z).
CalcSpriteHitbox:
		move.b	X(a1),d0
		ext.w	d0
		move.w	d0,d2
		lsl.w	#$04,d0
		add.b	SubX(a1),d0
		move.b	Y(a1),d1
		ext.w	d1
		move.w	d1,d3
		lsl.w	#$04,d1
		add.b	SubY(a1),d1
		jsr	(j_MultiplyD3By148).l
		add.w	d2,d3
		add.w	d2,d3
		addi.l	#g_HeightMap,d3
		move.w	d3,HeightmapOffset(a1)
		movea.l	d3,a0
		move.w	(a0),GroundHeight(a1)
		move.b	RotationAndSize(a1),d2
		andi.w	#$003E,d2
		clr.w	d3
		move.b	Height(a1),d3
		adda.w	#$0012,a1
		add.w	(a1)+,d3
		subq.w	#$01,d3
		cmpi.b	#SpriteB_Mushroom,(SpriteGraphic-CentreX)(a1)
		bne.s	_setZEnd		  ; 0052
		move.w	(Z-CentreX)(a1),d3	  ; 10

_setZEnd:
		move.w	d3,(HitBoxZEnd-CentreX)(a1) ; 0052
		move.w	d0,(a1)+		  ; CentreX
		move.w	d1,(a1)+		  ; CentreY
		sub.w	d2,d0
		addq.w	#$01,d0
		move.w	d0,(a1)+		  ; HitBoxXStart
		add.w	d2,d0
		add.w	d2,d0
		subq.w	#$02,d0
		move.w	d0,(a1)+		  ; HitBoxXEnd
		sub.w	d2,d1
		addq.w	#$01,d1
		move.w	d1,(a1)+		  ; HitBoxYStart
		add.w	d2,d1
		add.w	d2,d1
		subq.w	#$02,d1
		move.w	d1,(a1)+		  ; HitBoxYEnd
		rts


CheckFlags:
		lea	(Sprite1_X).l,a5
		bsr.s	DoCustomRoomActions	  ; Mercator North
		bsr.w	CheckRoomFlagsToHideSprites
		bsr.w	CheckFlagsToHideMultipleSprites
		bsr.w	CheckLockedDoorSpriteFlags
		bsr.w	CheckPermanentSwitchFlags
		bsr.w	CheckSacredTreeFlags
		rts

		modend
