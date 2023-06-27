; ---------------------------------------------------------------------------

ItemUseGarlic:					  ; CODE XREF: ROM:0000864Aj
		cmpi.w	#$02F6,(g_RmNum1).l
		bne.w	ReturnFailure
		cmpi.b	#$11,(Player_Y).l
		bhi.w	ReturnFailure
		bra.w	loc_8BB2
; ---------------------------------------------------------------------------

ItemUseAntiparalyze:				  ; CODE XREF: ROM:00008650j
		jsr	(j_GetPlayerStatus).l
		btst	#STATUS_PARALYSIS,d0
		beq.w	ReturnFailure
		bsr.w	ConsumeItem
		move.b	#STATUS_PARALYSIS,d0
		jsr	(j_ClearPlayerStatus).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_HealthRecover2
; ---------------------------------------------------------------------------
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------
		move.b	#$01,(Player_Unk0A).l
		move.b	#SpriteB_Dog,(Player_SpriteGraphic).l
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

ItemUseEinsteinWhistle:				  ; CODE XREF: ROM:00008656j
		cmpi.w	#$0234,(g_RmNum1).l
		bne.w	ReturnFailure
		move.b	(Player_X).l,d0
		subi.b	#$2F,d0
		cmpi.b	#$04,d0
		bcc.w	ReturnFailure
		move.b	(Player_Y).l,d0
		subi.b	#$1E,d0
		cmpi.b	#$04,d0
		bcc.w	ReturnFailure
		btst	#$00,(g_Vars+6).l
		bne.w	ReturnFailure
		bra.w	loc_8BB2
; ---------------------------------------------------------------------------

ItemUseSpellbook:				  ; CODE XREF: ROM:0000865Cj
		bsr.w	ConsumeItem
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

ItemUseLithograph:				  ; CODE XREF: ROM:00008662j
		bra.w	ReturnFailure
; ---------------------------------------------------------------------------

ItemUsePawnTicket:				  ; CODE XREF: ROM:00008668j
		bset	#$07,(g_Vars+$19).l
		bne.w	ReturnFailure

loc_88DE:					  ; CODE XREF: ROM:00008928j
		move.w	(Player_CurrentHealth).l,d0
		subi.w	#$0100,d0
		bcs.w	loc_892A
		bne.s	loc_88F2
		move.w	#$00FF,d0

loc_88F2:					  ; CODE XREF: ROM:000088ECj
		move.w	d0,(Player_CurrentHealth).l
		move.w	#$000A,d0
		jsr	(j_AddGold).l
		jsr	(j_RefreshMaxHealthHUD).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		jsr	(j_EnableDMAQueueProcessing).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_HealthRecover1
; ---------------------------------------------------------------------------
		move.w	#00010,d0
		jsr	(j_Sleep).l
		bra.s	loc_88DE
; ---------------------------------------------------------------------------

loc_892A:					  ; CODE XREF: ROM:000088E8j
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

ItemUseGolasEye:				  ; CODE XREF: ROM:0000866Ej
		cmpi.w	#$01E6,(g_RmNum1).l
		bne.w	ReturnFailure
		move.b	(Player_X).l,d0
		subi.b	#$37,d0
		cmpi.b	#$03,d0
		bcc.w	ReturnFailure
		move.b	(Player_Y).l,d0
		subi.b	#$2B,d0
		cmpi.b	#$05,d0
		bcc.w	ReturnFailure
		cmpi.b	#$20,(Player_FloorHeight).l
		bne.w	ReturnFailure
		btst	#$06,(g_Vars+$A).l
		bne.w	ReturnFailure
		bra.w	loc_8BB2
; ---------------------------------------------------------------------------

ItemUseDeathStatue:				  ; CODE XREF: ROM:00008674j
		move.w	#$001C,d0
		jsr	(j_PrintString).l
		move.w	#$0014,d6
		bsr.w	GenerateRandomNumber
		cmpi.b	#$08,d7
		bcs.s	loc_899A
		cmpi.b	#$0C,d7
		bcs.s	loc_89A8
		bra.s	loc_89C6
; ---------------------------------------------------------------------------

loc_899A:					  ; CODE XREF: ROM:00008990j
		andi.b	#$03,d7
		move.w	d7,d0
		jsr	(j_AddStatusEffect).l
		bra.s	loc_89D8
; ---------------------------------------------------------------------------

loc_89A8:					  ; CODE XREF: ROM:00008996j
		move.w	#$FFFF,d0
		lea	(Player_X).l,a5
		jsr	(j_AddHealth).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		bra.s	loc_89D8
; ---------------------------------------------------------------------------

loc_89C6:					  ; CODE XREF: ROM:00008998j
		subi.w	#$000C,d7
		move.b	DeathStatueItemBonus(pc,d7.w),d0
		move.b	#$09,d1
		jsr	(sub_22ED4).l

loc_89D8:					  ; CODE XREF: ROM:000089A6j
						  ; ROM:000089C4j
		bsr.w	ConsumeItem
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------
DeathStatueItemBonus:dc.b ITM_EKEEKE
		dc.b ITM_GOLDENSTATUE
		dc.b ITM_GAIASTATUE
		dc.b ITM_DAHL
		dc.b ITM_DETOXGRASS
		dc.b ITM_MINDREPAIR
		dc.b ITM_RESTORATION
		dc.b ITM_CASINOTICKET
		dcb.b 2,ITM_EKEEKE
; ---------------------------------------------------------------------------

ItemUseDahl:					  ; CODE XREF: ROM:0000867Aj
		move.w	#$FFFF,d0
		lea	(Player_X).l,a5
		jsr	(j_AddHealth).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		bsr.w	ConsumeItem
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_HealthRecover2
; ---------------------------------------------------------------------------
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

ItemUseRestoration:				  ; CODE XREF: ROM:00008680j
		jsr	(j_GetPlayerStatus).l
		andi.b	#$07,d0
		beq.w	ReturnFailure
		move.b	#$00,d0
		jsr	(j_ClearPlayerStatus).l
		move.b	#$01,d0
		jsr	(j_ClearPlayerStatus).l
		move.b	#$02,d0
		jsr	(j_ClearPlayerStatus).l
		bsr.w	ConsumeItem
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_HealthRecover2
; ---------------------------------------------------------------------------
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

ItemUseLogs:					  ; CODE XREF: ROM:00008686j
		cmpi.w	#$0196,(g_RmNum1).l
		bne.s	loc_8A7A
		move.w	(Player_X).l,d0
		andi.w	#$FEFE,d0
		cmpi.w	#$2C2E,d0
		bne.w	ReturnFailure
		bset	#$00,(g_Vars+$B).l
		bne.w	ReturnFailure
		bsr.w	ConsumeItem
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

loc_8A7A:					  ; CODE XREF: ROM:00008A52j
		cmpi.w	#$0199,(g_RmNum1).l
		bne.w	ReturnFailure
		move.b	(Player_X).l,d0
		andi.b	#$FE,d0
		cmpi.w	#$0014,d0
		bne.w	ReturnFailure
		move.b	(Player_Y).l,d0
		subq.b	#$01,d0
		andi.b	#$FE,d0
		cmpi.w	#$0010,d0
		bne.w	ReturnFailure
		bset	#$01,(g_Vars+$B).l
		bne.w	ReturnFailure
		bsr.w	ConsumeItem
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

ItemUseOracleStone:				  ; CODE XREF: ROM:0000868Cj
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

ItemUseIdolStone:				  ; CODE XREF: ROM:00008692j
		btst	#$06,(g_Flags).l
		bne.w	ReturnFailure
		cmpi.w	#$01B1,(g_RmNum1).l
		bne.w	ReturnFailure
		cmpi.b	#$0F,(Player_X).l
		bhi.w	ReturnFailure
		cmpi.b	#$19,(Player_Y).l
		bcs.w	ReturnFailure
		cmpi.b	#$1B,(Player_Y).l
		bhi.w	ReturnFailure
		bra.w	loc_8BB2
; ---------------------------------------------------------------------------

ItemUseKey:					  ; CODE XREF: ROM:00008698j
		move.b	(Player_GroundType).l,d0
		andi.b	#$3F,d0
		cmpi.b	#FLOOR_LOCKED_DOOR,d0
		bcs.w	ReturnFailure
		cmpi.b	#$1D,d0
		bcs.s	loc_8B34
		cmpi.b	#FLOOR_LOCKED_DOOR_SE,d0
		beq.s	loc_8B2A
		cmpi.b	#FLOOR_LOCKED_DOOR_SW,d0
		bne.w	ReturnFailure

loc_8B2A:					  ; CODE XREF: ROM:00008B20j
		jsr	(sub_103BE).l
		bcc.w	ReturnFailure

loc_8B34:					  ; CODE XREF: ROM:00008B1Aj
		bsr.s	ConsumeItem
		bra.w	loc_8BB2
; ---------------------------------------------------------------------------

ItemUseBell:					  ; CODE XREF: ROM:0000869Ej
		bsr.s	CheckForLifestock
		bcc.w	ReturnFailure
		bra.w	ReturnSuccess

; =============== S U B	R O U T	I N E =======================================


CheckForLifestock:				  ; CODE XREF: sub_620A+49Cp
						  ; ROM:ItemUseBellp
		lea	(Sprite1_X).l,a0
		moveq	#$0000000E,d7

loc_8B4C:					  ; CODE XREF: CheckForLifestock+38j
		tst.w	(a0)
		bmi.s	loc_8B8C
		cmpi.b	#$7F,(a0)
		beq.s	loc_8B78
		cmpi.b	#SpriteB_Item,SpriteGraphic(a0)
		bne.s	loc_8B68
		cmpi.b	#ITM_LIFESTOCK,GoldOrChestContents(a0)
		beq.s	loc_8B82
		bra.s	loc_8B78
; ---------------------------------------------------------------------------

loc_8B68:					  ; CODE XREF: CheckForLifestock+18j
		cmpi.b	#SpriteB_Chest,SpriteGraphic(a0)
		bne.s	loc_8B78
		cmpi.b	#ITM_LIFESTOCK,GoldOrChestContents(a0)
		beq.s	loc_8B82

loc_8B78:					  ; CODE XREF: CheckForLifestock+10j
						  ; CheckForLifestock+22j ...
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,loc_8B4C
		bra.s	loc_8B8C
; ---------------------------------------------------------------------------

loc_8B82:					  ; CODE XREF: CheckForLifestock+20j
						  ; CheckForLifestock+32j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_HealthRecover1
; ---------------------------------------------------------------------------
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_8B8C:					  ; CODE XREF: CheckForLifestock+Aj
						  ; CheckForLifestock+3Cj
		tst.b	d0
		rts
; End of function CheckForLifestock

; ---------------------------------------------------------------------------

ItemUseShortcake:				  ; CODE XREF: ROM:000086A4j
		bsr.w	ConsumeItem
		bra.w	loc_8BB2

; =============== S U B	R O U T	I N E =======================================


ConsumeItem:					  ; CODE XREF: ROM:000086DCp
						  ; ROM:00008726p ...
		move.b	(byte_FF1152).l,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		subq.w	#$01,d1
		jsr	(j_CheckAndConsumeItem).l
		bsr.w	sub_D4AE
		rts
; End of function ConsumeItem

; ---------------------------------------------------------------------------

loc_8BB2:					  ; CODE XREF: ROM:0000884Aj
						  ; ROM:000088C2j ...
		bset	#$07,(byte_FF1152).l

ReturnSuccess:					  ; CODE XREF: ROM:000086F6j
						  ; ROM:00008736j ...
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

ReturnFailure:					  ; CODE XREF: ROM:00008722j
						  ; ROM:0000875Ej ...
		bsr.w	PrintNothingHappenedString
		tst.b	d0
		rts

; =============== S U B	R O U T	I N E =======================================


sub_8BC8:					  ; CODE XREF: CheckForMenuOpen+13Cp
		move.b	(byte_FF1152).l,d0
		lea	PostUseItemTable(pc),a0

loc_8BD2:					  ; CODE XREF: sub_8BC8+1Aj
		move.b	0000000004(a0),d2
		cmpi.b	#$FF,d2
		beq.s	locret_8BE6
		cmp.b	d0,d2
		beq.s	loc_8BE4
		addq.l	#$06,a0
		bra.s	loc_8BD2
; ---------------------------------------------------------------------------

loc_8BE4:					  ; CODE XREF: sub_8BC8+16j
		jmp	(a0)
; ---------------------------------------------------------------------------

locret_8BE6:					  ; CODE XREF: sub_8BC8+12j
		rts
; End of function sub_8BC8

; ---------------------------------------------------------------------------

PostUseGarlic:					  ; CODE XREF: ROM:PostUseItemTablej
		bset	#$00,(g_Flags+$17).l
		rts
; ---------------------------------------------------------------------------

PostUseEinsteinWhistle:				  ; CODE XREF: ROM:000086B6j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicDogWhistle
; ---------------------------------------------------------------------------
		move.w	#$0167,d0
		jsr	(j_Sleep).l
		move.l	(Player_X).l,d0
		movem.l	d0,-(sp)
		move.w	#$0230,(g_RmNum1).l	  ; Wood cutter	area
		move.w	#$1732,(Player_X).l
		bset	#$06,(Player_Flags2).l
		bset	#$00,(g_Vars+6).l
		bsr.w	loc_620E
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicDogWhistle
; ---------------------------------------------------------------------------
		move.w	#$00B7,d0
		jsr	(FlushDMACopyQueue).l
		jsr	(j_PlayCutsceneScript).l
		move.w	#$0234,(g_RmNum1).l	  ; Sunstone
		movem.l	(sp)+,d0
		move.l	d0,(Player_X).l
		bclr	#$06,(Player_Flags2).l
		bclr	#$00,(g_Vars+6).l
		bsr.w	loc_620E
		move.b	(g_BGM).l,d0
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_LoadFromD0
; ---------------------------------------------------------------------------
		bset	#$00,(g_Vars+6).l
		rts
; ---------------------------------------------------------------------------

PostUseGolasEye:				  ; CODE XREF: ROM:000086BCj
		bset	#$06,(g_Vars+$A).l
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

PostUseIdolStone:				  ; CODE XREF: ROM:000086C2j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Rumble
; ---------------------------------------------------------------------------
		move.b	#$08,d0
		bsr.w	sub_4B52
		move.w	#$001E,d0
		jsr	(Sleep).l		  ; Sleeps for d0 frames
		move.b	#$10,d0
		bsr.w	sub_4B52
		bset	#$06,(g_Flags).l
		rts
; ---------------------------------------------------------------------------

PostUseKey:					  ; CODE XREF: ROM:000086C8j
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_DoorLock
; ---------------------------------------------------------------------------
		move.b	(Player_GroundType).l,d2
		andi.b	#$3F,d2
		cmpi.b	#FLOOR_LOCKED_DOOR_SE,d2
		beq.s	loc_8CEE
		cmpi.b	#FLOOR_LOCKED_DOOR_SW,d2
		beq.s	loc_8CEE
		subi.b	#FLOOR_LOCKED_DOOR,d2
		bsr.w	sub_4FA8
		move.l	#$00FF0000,d0
		move.w	(Player_HeightmapOffset).l,d0
		movea.l	d0,a0
		move.w	(a0),(Player_GroundHeight).l
		rts
; ---------------------------------------------------------------------------

loc_8CEE:					  ; CODE XREF: ROM:00008CC8j
						  ; ROM:00008CCEj
		jsr	(sub_103A4).l
		rts
; ---------------------------------------------------------------------------

PostUseShortcake:				  ; CODE XREF: ROM:000086CEj
		move.w	#$0002,d6
		bsr.w	GenerateRandomNumber
		tst.b	d7
		beq.s	loc_8D44
		move.w	#$0153,d0
		jsr	(j_FlushDMACopyQueue).l
		jsr	(j_PlayCutsceneScript).l
		move.b	#$00,d0
		move.b	#$09,d1
		jsr	(sub_22ED4).l
		move.w	#$FFFF,d0
		lea	(Player_X).l,a5
		jsr	(j_AddHealth).l
		jsr	(j_UpdateEkeEkeHUD).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		rts
; ---------------------------------------------------------------------------

loc_8D44:					  ; CODE XREF: ROM:00008D00j
		move.w	#$0152,d0
		jsr	(j_FlushDMACopyQueue).l
		jsr	(j_PlayCutsceneScript).l
		move.w	#$00FF,(Player_CurrentHealth).l
		jsr	(j_RefreshMaxHealthHUD).l
		move.b	#$00,d0
		move.b	#$00,d1
		jsr	(sub_22ED4).l
		jsr	(j_UpdateEkeEkeHUD).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		rts
