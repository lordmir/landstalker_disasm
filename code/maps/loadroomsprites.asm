
; =============== S U B	R O U T	I N E =======================================


InitSprites:					  ; DATA XREF: sub_10388t
		bsr.s	ClearSpriteTable
		bsr.s	InitialiseSprites
		bsr.w	CheckFlags
		bsr.w	sub_19A40
		jsr	(j_InitSpritePalettes).l
		rts
; End of function InitSprites


; =============== S U B	R O U T	I N E =======================================


ClearSpriteTable:				  ; CODE XREF: InitSpritesp
		lea	(Sprite1_X).l,a1
		move.w	#$077F,d7

loc_19532:					  ; CODE XREF: ClearSpriteTable+Cj
		clr.b	(a1)+
		dbf	d7,loc_19532
		rts
; End of function ClearSpriteTable


; =============== S U B	R O U T	I N E =======================================


InitialiseSprites:				  ; CODE XREF: InitSprites+2p

; FUNCTION CHUNK AT 0001972A SIZE 00000072 BYTES
; FUNCTION CHUNK AT 0001983E SIZE 00000122 BYTES
; FUNCTION CHUNK AT 000199E6 SIZE 0000005A BYTES

		lea	RoomSpriteTableOffset(pc),a0
		nop
		lea	(Sprite1_X).l,a1
		clr.b	(byte_FF1838).l
		clr.b	(g_chestCount).l
		move.w	(g_RmNum1).l,d7
		add.w	d7,d7
		move.w	(a0,d7.w),d2
		beq.w	loc_19A3A		  ; No sprites
		subq.w	#$01,d2
		lea	(RoomSpriteTable).l,a2
		adda.l	d2,a2

loc_1956C:					  ; CODE XREF: InitialiseSprites+4FCj
		move.b	(a2)+,d0		  ; d0 = data[0]
						  ; A2 = &data[1]
		cmpi.b	#$FF,d0
		beq.w	loc_19A3A		  ; End	of table for room
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
		move.b	-$00000001(a2),d0	  ; a2 = &data[3]
						  ; d0 = data[2]
		andi.w	#$0007,d0
		movem.w	(sp)+,d0
		bne.s	loc_195CE
		lsr.b	#$05,d3
		or.b	d3,d0

loc_195CE:					  ; CODE XREF: InitialiseSprites+8Ej
		lsr.b	#$03,d2
		andi.b	#$01,d2
		or.b	d2,d0
		move.b	d0,Flags2(a1)
		move.b	-$00000001(a2),d0	  ; a2 = &data[3]
						  ; d0 = data[2]
		andi.w	#$0007,d0
		move.b	#$01,Unk0A(a1)
		move.b	SpeedLUT(pc,d0.w),Speed(a1)
		bra.s	loc_195F6		  ; a2 = &data[3]
; ---------------------------------------------------------------------------
SpeedLUT:					  ; DATA XREF: InitialiseSprites+AEr
		dc.b $00,$01,$02,$04,$08,$00
; ---------------------------------------------------------------------------

loc_195F6:					  ; CODE XREF: InitialiseSprites+B4j
		tst.b	(a2)			  ; a2 = &data[3]
		bpl.s	loc_19606		  ; a2 = &data[3]
		addq.b	#$08,SubX(a1)
		andi.b	#$0F,SubX(a1)
		addq.b	#$01,X(a1)

loc_19606:					  ; CODE XREF: InitialiseSprites+BEj
		btst	#$06,(a2)		  ; a2 = &data[3]
		beq.s	loc_1961A		  ; spritedata[0x71] = data[3]
						  ; a2 = &data[4]
		addq.b	#$08,SubY(a1)
		andi.b	#$0F,SubY(a1)
		addq.b	#$01,Y(a1)

loc_1961A:					  ; CODE XREF: InitialiseSprites+D0j
		move.b	(a2)+,TileCopySource(a1)  ; spritedata[0x71] = data[3]
						  ; a2 = &data[4]
		move.w	(a2)+,d0		  ; d0 = data[4..5]
						  ; a2 = &data[6]
		andi.w	#$FCFF,d0
		clr.l	BehaviourLUTPtr(a1)
		move.w	d0,Dialogue(a1)
		andi.w	#$00FF,d0		  ; data[5] (sprite type)
		cmpi.b	#$C0,d0			  ; Test if sprite is an item
		bcs.w	loc_1972A		  ; Not	an item
		move.b	d0,SpriteGraphic(a1)
		subi.b	#$C0,d0
		move.b	d0,GoldOrChestContents(a1)
		cmpi.b	#ITM_LIFESTOCK,d0	  ; Is item a lifestock?
		bne.s	loc_1967E		  ; D1 - remaining items left
		cmpi.w	#$62FF,(Player_MaxHealth).l
		bcc.s	loc_19678
		jsr	(j_CheckIfLifestockSold).l
		bcc.s	loc_19676
		tst.w	(DebugModeEnable).w
		bmi.s	loc_196C0
		move.w	#$001D,d7

loc_19666:					  ; CODE XREF: InitialiseSprites+136j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordHit
; ---------------------------------------------------------------------------
		jsr	(j_WaitUntilVBlank).l
		dbf	d7,loc_19666
		bra.s	loc_196C0
; ---------------------------------------------------------------------------

loc_19676:					  ; CODE XREF: InitialiseSprites+120j
		beq.s	loc_196C0

loc_19678:					  ; CODE XREF: InitialiseSprites+118j
		move.b	#$7F,X(a1)		  ; Move lifestock offscreen if	sold or	at max health
		bra.s	loc_196C0
; ---------------------------------------------------------------------------

loc_1967E:					  ; CODE XREF: InitialiseSprites+10Ej
		jsr	(j_GetRemainingItemAllowedCount).l ; D1	- remaining items left
		movem.l	d2/a0,-(sp)
		lea	(Sprite1_X).l,a0
		clr.b	d2			  ; D2 - number	of items visible in room
		cmpi.w	#$01A5,(g_RmNum1).l	  ; Staircase to King Nole
		beq.s	loc_196BC		  ; Skip to allow animation for	Gola items

loc_1969A:					  ; CODE XREF: InitialiseSprites+178j
		cmpa.l	a0,a1			  ; Loop over all sprites populated in sprite table so far
		beq.s	loc_196B4		  ; Test if item presence could	cause overflow
		cmp.b	GoldOrChestContents(a0),d0 ; Check Item	ID is a	match
		bne.s	loc_196AE		  ; Get	next sprite from table
		cmpi.b	#SpriteB_Item,SpriteGraphic(a0)	; Check	sprite is an item
		bne.s	loc_196AE		  ; Get	next sprite from table
		addq.b	#$01,d2			  ; Increment matching item count

loc_196AE:					  ; CODE XREF: InitialiseSprites+168j
						  ; InitialiseSprites+170j
		lea	SPRITE_SIZE(a0),a0	  ; Get	next sprite from table
		bra.s	loc_1969A		  ; Loop over all sprites populated in sprite table so far
; ---------------------------------------------------------------------------

loc_196B4:					  ; CODE XREF: InitialiseSprites+162j
		cmp.b	d2,d1			  ; Test if item presence could	cause overflow
		bhi.s	loc_196BC
		move.b	#$7F,(a1)		  ; Move item offscreen	(too many)

loc_196BC:					  ; CODE XREF: InitialiseSprites+15Ej
						  ; InitialiseSprites+17Cj
		movem.l	(sp)+,d2/a0

loc_196C0:					  ; CODE XREF: InitialiseSprites+126j
						  ; InitialiseSprites+13Aj ...
		clr.w	d2
		move.b	-$00000002(a2),d2	  ; a2 = &data[6]
						  ; d2 = data[4]
		andi.b	#$03,d2
		lsl.w	#$08,d2
		move.b	$00000001(a2),d2	  ; a2 = &data[6]
						  ; d2 = data[7]
		bne.s	loc_196D6
		move.w	#$0002,d2

loc_196D6:					  ; CODE XREF: InitialiseSprites+196j
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
		move.b	-$00000006(a2),d0	  ; a2 = &data[6]
						  ; d0 = data[0]
		andi.b	#$40,d0
		lsr.b	#$03,d0
		andi.b	#$F7,$00000006(a1)
		or.b	d0,$00000006(a1)
		bra.s	loc_1973C		  ; Rejoin from	item sequence
; End of function InitialiseSprites


; =============== S U B	R O U T	I N E =======================================


LookupSpriteGfxIndex:				  ; CODE XREF: ROM:00012C84p
						  ; ROM:00012D36p ...
		lea	SpriteGfxIdxLookup(pc),a0

loc_1971A:					  ; CODE XREF: LookupSpriteGfxIndex+Cj
		cmp.b	$00000001(a0),d0
		beq.s	loc_19724
		addq.l	#$02,a0
		bra.s	loc_1971A
; ---------------------------------------------------------------------------

loc_19724:					  ; CODE XREF: LookupSpriteGfxIndex+8j
		move.b	(a0),SpriteGraphic(a1)
		rts
; End of function LookupSpriteGfxIndex

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR InitialiseSprites

loc_1972A:					  ; CODE XREF: InitialiseSprites+FAj
		bsr.s	LookupSpriteGfxIndex
		movem.w	d1,-(sp)
		jsr	(LookupSpriteAnimFlags).l
		movem.w	(sp)+,d1		  ; d1 = rotation ?
		bsr.s	SetSpriteRotationAnimFlags

loc_1973C:					  ; CODE XREF: InitialiseSprites+1DAj
		clr.w	d0			  ; Rejoin from	item sequence
		move.b	SpriteGraphic(a1),d0
		cmpi.b	#SpriteB_Chest,d0
		bne.w	loc_19842		  ; d2 - width/length
						  ; d3 - height
		movem.w	d0,-(sp)
		jsr	(j_LookupChestContents).l
		move.b	#$01,Flags2(a1)
		jsr	(j_CheckIfChestOpened).l
		beq.w	loc_1983E
		cmpi.w	#$0291,(g_RmNum1).l	  ; Crypt Bogus	Chest Room
		bne.w	loc_19778
		bclr	d1,(a0,d0.w)
		bra.w	loc_1983E
; ---------------------------------------------------------------------------

loc_19778:					  ; CODE XREF: InitialiseSprites+232j
		move.b	#$FF,GoldOrChestContents(a1)
		move.w	#$000C,AnimationFrame(a1)
		move.b	#$08,d2
		move.b	#$18,d3
		movem.w	(sp)+,d0
		or.b	d2,RotationAndSize(a1)
		move.b	d3,Height(a1)
		bra.w	loc_19844
; END OF FUNCTION CHUNK	FOR InitialiseSprites

; =============== S U B	R O U T	I N E =======================================


SetSpriteRotationAnimFlags:			  ; CODE XREF: sub_12CAE+Cp
						  ; sub_12FE6+32p ...
		clr.b	d2
		move.b	d1,d0
		addi.b	#$40,d1
		andi.b	#$80,d1
		beq.s	loc_197B6		  ; branch if d0 = 0xC0	or 0x40
		btst	#$00,Flags2(a1)		  ; Check bit0 of spr[0xC]
		bne.s	loc_197B6		  ; Only true for Zak
		move.b	#$04,d2

loc_197B6:					  ; CODE XREF: SetSpriteRotationAnimFlags+Cj
						  ; SetSpriteRotationAnimFlags+14j
		cmpi.b	#$03,AnimFlags(a1)	  ; Only true for Zak
		bne.s	loc_197C0
		addq.b	#$08,d2

loc_197C0:					  ; CODE XREF: SetSpriteRotationAnimFlags+20j
		cmpi.b	#SpriteB_Mimic,SpriteGraphic(a1)
		bne.s	loc_197E0
		clr.w	AnimationFrame(a1)

loc_197CC:					  ; CODE XREF: SetSpriteRotationAnimFlags+52j
		move.w	#$0018,AnimationIndex(a1)
		move.b	#$10,ChestIndex(a1)
		move.b	#$40,Flags4(a1)		  ; Bit	0 = Invincible / Solid
		rts
; ---------------------------------------------------------------------------

loc_197E0:					  ; CODE XREF: SetSpriteRotationAnimFlags+2Aj
		cmpi.b	#SpriteB_Mushroom,SpriteGraphic(a1)
		bne.s	loc_197F0
		move.w	#$000C,AnimationFrame(a1)
		bra.s	loc_197CC
; ---------------------------------------------------------------------------

loc_197F0:					  ; CODE XREF: SetSpriteRotationAnimFlags+4Aj
		ext.w	d2
		move.w	d2,AnimationIndex(a1)
		clr.w	AnimationFrame(a1)
		btst	#$04,AnimFlags(a1)
		bne.s	locret_19812
		andi.b	#$40,d0
		lsr.b	#$03,d0
		andi.b	#$F7,TileSource(a1)
		or.b	d0,TileSource(a1)

locret_19812:					  ; CODE XREF: SetSpriteRotationAnimFlags+64j
		rts
; End of function SetSpriteRotationAnimFlags


; =============== S U B	R O U T	I N E =======================================


GetSpriteDims:					  ; CODE XREF: sub_12CAEp
						  ; sub_192B6+26p ...
		move.b	#$08,d2
		move.b	#$10,d3
		lea	SpriteDimensionsLookup(pc),a0

loc_19820:					  ; CODE XREF: GetSpriteDims+1Aj
		move.b	(a0)+,d1
		cmpi.b	#$FF,d1
		beq.s	loc_19834
		cmp.b	d0,d1
		beq.s	loc_19830
		addq.l	#$02,a0
		bra.s	loc_19820
; ---------------------------------------------------------------------------

loc_19830:					  ; CODE XREF: GetSpriteDims+16j
		move.b	(a0)+,d2
		move.b	(a0),d3

loc_19834:					  ; CODE XREF: GetSpriteDims+12j
		or.b	d2,RotationAndSize(a1)
		move.b	d3,Height(a1)
		rts
; End of function GetSpriteDims

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR InitialiseSprites

loc_1983E:					  ; CODE XREF: InitialiseSprites+226j
						  ; InitialiseSprites+23Aj
		movem.w	(sp)+,d0

loc_19842:					  ; CODE XREF: InitialiseSprites+20Cj
		bsr.s	GetSpriteDims		  ; d2 - width/length
						  ; d3 - height

loc_19844:					  ; CODE XREF: InitialiseSprites+25Ej
		cmpi.b	#$0C,d2
		bcs.s	loc_19874		  ; If width > 0x0C
		addq.b	#$08,SubX(a1)		  ; Readjust co-ords by	1/2 unit to centre sprite
		cmpi.b	#$10,SubX(a1)
		bcs.s	loc_1985E
		andi.b	#$0F,SubX(a1)
		addq.b	#$01,(a1)

loc_1985E:					  ; CODE XREF: InitialiseSprites+31Aj
		addq.b	#$08,SubY(a1)
		cmpi.b	#$10,SubY(a1)
		bcs.s	loc_19874
		andi.b	#$0F,SubY(a1)
		addq.b	#$01,Y(a1)

loc_19874:					  ; CODE XREF: InitialiseSprites+30Ej
						  ; InitialiseSprites+32Ej
		clr.w	d0
		move.b	(a2)+,d0		  ; d0 = bytes[6]
						  ; a2 = &bytes[7]
		move.b	d0,d1
		move.b	d0,FallRate(a1)
		andi.w	#$8000,FallRate(a1)
		lsl.b	#$04,d0
		move.w	d0,Z(a1)
		btst	#$06,d1
		beq.s	loc_19894
		addq.w	#$08,Z(a1)

loc_19894:					  ; CODE XREF: InitialiseSprites+354j
		move.b	d1,d0
		andi.b	#$10,d1
		move.b	d1,Flags1(a1)
		andi.b	#$20,d0
		lsr.b	#$05,d0
		or.b	d0,Flags1(a1)
		clr.w	d0
		move.b	-$00000003(a2),d0	  ; a2 = &bytes[7]
						  ; d0 = byte[4]
		andi.b	#$03,d0
		lsl.w	#$08,d0
		move.b	(a2)+,d0		  ; a2 = &bytes[8]
						  ; d0 = bytes[7]
		tst.w	BehaviourLUTIndex(a1)
		bne.s	loc_198C0
		move.w	d0,BehaviourLUTIndex(a1)

loc_198C0:					  ; CODE XREF: InitialiseSprites+380j
		clr.w	QueuedAction(a1)
		clr.w	PrevAction(a1)
		move.b	#$FF,Unk6D(a1)
		cmpi.b	#SpriteB_Ghost,SpriteGraphic(a1)
		bne.s	loc_198E0
		move.w	#$0008,AnimationIndex(a1)
		clr.w	PrevAction(a1)

loc_198E0:					  ; CODE XREF: InitialiseSprites+39Aj
		tst.b	Speed(a1)
		bne.s	loc_198FA
		tst.w	BehavParam(a1)
		bne.s	loc_198FA
		btst	#$05,Flags2(a1)
		bne.s	loc_198FA
		bset	#$07,FallRate(a1)

loc_198FA:					  ; CODE XREF: InitialiseSprites+3AAj
						  ; InitialiseSprites+3B0j ...
		move.w	#$FFFF,SpriteUnderneath(a1)
		movea.l	a1,a5
		move.w	BehaviourLUTIndex(a1),d0
		movem.l	d0/a1,-(sp)
		jsr	(j_LoadSpriteBehaviour).l
		movem.l	(sp)+,d0/a1
		cmpi.w	#$0001,d0
		bne.s	loc_19932
		move.b	(byte_FF1838).l,d0
		sub.b	d0,BehavParam(a1)
		addq.b	#$03,(byte_FF1838).l
		andi.b	#$0F,(byte_FF1838).l

loc_19932:					  ; CODE XREF: InitialiseSprites+3DEj
		cmpi.b	#SpriteB_Chest,SpriteGraphic(a1)
		beq.s	loc_1994E
		cmpi.b	#SpriteB_Mimic,SpriteGraphic(a1)
		beq.s	loc_19952
		cmpi.b	#SpriteB_Mushroom,SpriteGraphic(a1)
		beq.s	loc_19952
		clr.b	ChestIndex(a1)

loc_1994E:					  ; CODE XREF: InitialiseSprites+3FEj
		clr.b	Flags4(a1)		  ; Bit	0 = Invincible / Solid

loc_19952:					  ; CODE XREF: InitialiseSprites+406j
						  ; InitialiseSprites+40Ej
		tst.b	Flags2(a1)
		bpl.w	loc_199E6
		bsr.s	GetEnemyStats		  ; sprite type
		bra.w	loc_199E6
; END OF FUNCTION CHUNK	FOR InitialiseSprites

; =============== S U B	R O U T	I N E =======================================

; sprite type

GetEnemyStats:					  ; CODE XREF: ROM:00012C8Cp
						  ; OnTick+1456p ...
		move.b	SpriteType(a1),d0
		lea	EnemyStats(pc),a0

loc_19968:					  ; CODE XREF: GetEnemyStats+74j
		cmpi.b	#$FF,(a0)
		beq.s	locret_199D0
		cmp.b	(a0),d0
		bne.s	loc_199D2
		move.b	$00000001(a0),CurrentHealth(a1)	; Health
		cmpi.b	#$FF,CurrentHealth(a1)	  ; 0xFF - indestructable
		bne.s	loc_19986
		bset	#$00,Flags4(a1)		  ; Bit	0 = Invincible / Solid

loc_19986:					  ; CODE XREF: GetEnemyStats+1Ej
		clr.b	CurrentSubHealth(a1)
		clr.w	d0
		move.b	$00000002(a0),d0	  ; Defence
		lsl.w	#$07,d0
		move.w	d0,Defence(a1)
		move.b	$00000003(a0),GoldOrChestContents(a1) ;	Gold Drop
		move.b	$00000004(a0),d0	  ; Attack
		move.b	d0,d1
		andi.b	#$7F,d0
		lsl.w	#$08,d0
		move.w	d0,AttackStrength(a1)
		andi.b	#$80,d1
		lsr.b	#$04,d1			  ; High bit of	attack is used in item drop chance
		move.b	$00000005(a0),d0
		move.b	d0,d2
		andi.b	#$C0,d0			  ; High 2 bits	of item	drop used to calculate chance
						  ; (DEF & 0x80) >> 5 |	(IDROP & 0xC0) >> 6
		lsr.b	#$05,d0
		or.b	d1,d0
		ext.w	d0
		move.w	ItemDropProbabilityLookup(pc,d0.w),InitFlags4_DropProbability(a1) ; 1/64
		andi.b	#$3F,d2
		move.b	d2,ItemDrop(a1)

locret_199D0:					  ; CODE XREF: GetEnemyStats+Cj
		rts
; ---------------------------------------------------------------------------

loc_199D2:					  ; CODE XREF: GetEnemyStats+10j
		addq.l	#$06,a0
		bra.s	loc_19968
; End of function GetEnemyStats

; ---------------------------------------------------------------------------
ItemDropProbabilityLookup:dc.w $0040		  ; DATA XREF: GetEnemyStats+62r
						  ; 1/64
		dc.w $0080			  ; 1/128
		dc.w $0100			  ; 1/256
		dc.w $0200			  ; 1/512
		dc.w $0400			  ; 1/1024
		dc.w $0800			  ; 1/2048
		dc.w $0000			  ; None
		dc.w $0001			  ; Guaranteed
; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR InitialiseSprites

loc_199E6:					  ; CODE XREF: InitialiseSprites+41Cj
						  ; InitialiseSprites+422j
		move.w	X(a1),InitX(a1)
		move.w	SubX(a1),InitSubX(a1)
		move.w	RotationAndSize(a1),InitRotAndSize(a1)
		move.b	TileSource(a1),InitTileSource(a1)
		move.w	Unk0A(a1),InitUnk0A(a1)
		move.b	Flags2(a1),InitFlags2(a1)
		move.w	Z(a1),InitZ(a1)
		move.w	BehavParam(a1),Unk6A(a1)
		move.l	BehaviourLUTPtr(a1),InitBehaviourLUTPtr(a1)
		move.b	GoldOrChestContents(a1),InitGoldOrChestCont(a1)
		move.b	Flags4(a1),Unk68(a1)	  ; Bit	0 = Invincible / Solid
		move.w	Dialogue(a1),InitDialogue(a1)
		move.w	CurrentHealth(a1),MaxHealth(a1)
		lea	SPRITE_SIZE(a1),a1
		bra.w	loc_1956C		  ; d0 = data[0]
						  ; A2 = &data[1]
; ---------------------------------------------------------------------------

loc_19A3A:					  ; CODE XREF: InitialiseSprites+24j
						  ; InitialiseSprites+38j
		move.w	#$FFFF,(a1)
		rts
; END OF FUNCTION CHUNK	FOR InitialiseSprites

; =============== S U B	R O U T	I N E =======================================


sub_19A40:					  ; CODE XREF: InitSprites+8p
		lea	(Player_X).l,a1
		move.w	#$000F,d7

loc_19A4A:					  ; CODE XREF: sub_19A40+82j
		move.b	(a1),d0
		bmi.s	locret_19AC6
		movem.w	d7,-(sp)
		cmpi.b	#$7F,d0
		beq.s	loc_19ABA
		movem.l	a1,-(sp)
		movem.l	a1,-(sp)
		bsr.s	sub_19AC8
		movem.l	(sp)+,a1
		cmpa.l	#Player_X,a1
		beq.s	loc_19AB6
		btst	#$00,Flags1(a1)
		bne.s	loc_19AB6
		movea.l	a1,a5
		jsr	(sub_3BC).l
		bcc.s	loc_19AB6
		cmpa.l	#Player_X,a1
		bne.s	loc_19AA8
		movem.l	(sp)+,a1
		move.w	HitBoxZEnd(a1),d1
		addq.w	#$01,d1
		move.w	d1,(Player_Z).l
		add.b	(Player_Height).l,d1
		subq.b	#$01,d1
		move.w	d1,(Player_HitBoxZEnd).l
		bra.s	loc_19ABA
; ---------------------------------------------------------------------------

loc_19AA8:					  ; CODE XREF: sub_19A40+46j
		cmpi.b	#SpriteB_Ghost,InitSpriteGraphic(a1)
		bne.s	loc_19AB6
		jsr	(j_MoveSpriteOffscreen).l

loc_19AB6:					  ; CODE XREF: sub_19A40+2Cj
						  ; sub_19A40+34j ...
		movem.l	(sp)+,a1

loc_19ABA:					  ; CODE XREF: sub_19A40+16j
						  ; sub_19A40+66j
		movem.w	(sp)+,d7
		lea	SPRITE_SIZE(a1),a1
		dbf	d7,loc_19A4A

locret_19AC6:					  ; CODE XREF: sub_19A40+Cj
		rts
; End of function sub_19A40


; =============== S U B	R O U T	I N E =======================================


sub_19AC8:					  ; CODE XREF: ROM:00016374p
						  ; OnTick+1366p ...
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
		bne.s	loc_19B1E		  ; 0052
		move.w	(Z-CentreX)(a1),d3	  ; 10

loc_19B1E:					  ; CODE XREF: sub_19AC8+50j
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
; End of function sub_19AC8


; =============== S U B	R O U T	I N E =======================================


CheckFlags:					  ; CODE XREF: InitSprites+4p
		lea	(Sprite1_X).l,a5
		bsr.s	DoCustomRoomActions	  ; Mercator North
		bsr.w	CheckRoomFlagsToHideSprites
		bsr.w	CheckFlagsToHideMultipleSprites
		bsr.w	CheckLockedDoorSpriteFlags
		bsr.w	CheckPermanentSwitchFlags
		bsr.w	CheckSacredTreeFlags
		rts
; End of function CheckFlags

