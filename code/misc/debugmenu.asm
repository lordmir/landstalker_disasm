
; =============== S U B	R O U T	I N E =======================================


DebugMenu:					  ; CODE XREF: PlayerTalk+1Cp
		movem.l	d0-a6,-(sp)
		lea	DebugMenuActionTable(pc),a0
		clr.w	d1
		move.w	#$0003,d2
		bsr.w	JmpToDebugActionTableEntry
		movem.l	(sp)+,d0-a6
		rts
; End of function DebugMenu

; ---------------------------------------------------------------------------
DebugMenuActionTable:dc.w DebugMenuOpen-DebugMenuActionTable ; DATA XREF: DebugMenu+4t
						  ; ROM:DebugMenuActionTableo ...
		dc.w DebugMenuEnter-DebugMenuActionTable
		dc.w DebugMenuExit-DebugMenuActionTable
		dc.w IncrementVar-DebugMenuActionTable
		dc.w DecrementVar-DebugMenuActionTable
; ---------------------------------------------------------------------------

DebugMenuOpen:					  ; DATA XREF: ROM:DebugMenuActionTableo
		bsr.w	OpenTextbox
		move.w	#$001D,d0		  ; "DEBUG MENU"
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		move.w	d1,d0
		asl.w	#$02,d0
		move.w	DebugMenuStringTable(pc,d0.w),d0 ; "MAP	MENU"
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		rts
; ---------------------------------------------------------------------------

DebugMenuEnter:					  ; DATA XREF: ROM:DebugMenuActionTableo
		move.w	d1,d0
		asl.w	#$02,d0
		move.w	DebugMenuJmpTable(pc,d0.w),d0
		jsr	DebugMenuStringTable(pc,d0.w) ;	"MAP MENU"
		rts
; ---------------------------------------------------------------------------

DebugMenuExit:					  ; DATA XREF: ROM:DebugMenuActionTableo
		bsr.w	ClearTextbox_0
		bset	#$01,(byte_FF1917).l
		rts
; ---------------------------------------------------------------------------
DebugMenuStringTable:dc.w $0021			  ; CODE XREF: ROM:0002A486p
						  ; DATA XREF: ROM:0002A474r ...
						  ; "MAP MENU"
DebugMenuJmpTable:dc.w MapMenu-DebugMenuStringTable ; DATA XREF: ROM:0002A482r
		dc.w $003C			  ; "FLAG MENU"
		dc.w FlagMenu-DebugMenuStringTable
		dc.w $001F			  ; "SOUND MENU"
		dc.w SoundMenu-DebugMenuStringTable
		dc.w $001E			  ; "MUSIC MENU"
		dc.w MusicMenu-DebugMenuStringTable
; ---------------------------------------------------------------------------

SoundMenu:					  ; DATA XREF: ROM:0002A4A4o
		movem.l	d0-a6,-(sp)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_FadeOut
; ---------------------------------------------------------------------------
		lea	SoundMenuActionJmptable(pc),a0
		clr.w	d1
		move.w	#$002E,d2
		bsr.w	JmpToDebugActionTableEntry
		movem.l	(sp)+,d0-a6
		rts
; ---------------------------------------------------------------------------
SoundMenuActionJmptable:dc.w SoundMenuOpen-SoundMenuActionJmptable
						  ; DATA XREF: ROM:0002A4B2t
						  ; ROM:SoundMenuActionJmptableo ...
		dc.w SoundMenuEnter-SoundMenuActionJmptable
		dc.w SoundMenuExit-SoundMenuActionJmptable
		dc.w IncrementVar-SoundMenuActionJmptable
		dc.w DecrementVar-SoundMenuActionJmptable
; ---------------------------------------------------------------------------

SoundMenuOpen:					  ; DATA XREF: ROM:SoundMenuActionJmptableo
		bsr.w	OpenTextbox
		move.w	#$001F,d0
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		clr.l	(g_PrintNumericDwordValue).l
		move.b	SfxList(pc,d1.w),(g_PrintNumericByteValue).l
		addq.w	#$01,d0
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		rts
; ---------------------------------------------------------------------------

SoundMenuEnter:					  ; DATA XREF: ROM:SoundMenuActionJmptableo
		clr.w	d0
		move.b	SfxList(pc,d1.w),d0
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_LoadFromD0
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

SoundMenuExit:					  ; DATA XREF: ROM:SoundMenuActionJmptableo
		bsr.w	ClearTextbox_0
		bset	#$01,(byte_FF1917).l
		rts
; ---------------------------------------------------------------------------
SfxList:	dc.b SND_SkeletonTalk		  ; DATA XREF: ROM:0002A4E2r
						  ; ROM:0002A4F4r
		dc.b SND_CursorMove
		dc.b SND_CursorSelect
		dc.b SND_ErrorBuzz
		dc.b SND_SpeakerPitch7
		dc.b SND_SpeakerPitch6
		dc.b SND_SpeakerPitch5
		dc.b SND_SpeakerPitch4
		dc.b SND_SpeakerPitch3
		dc.b SND_SpeakerPitch2
		dc.b SND_SpeakerPitch1
		dc.b SND_SpeakerPitch0
		dc.b SND_WarpPad
		dc.b SND_SwordSwing
		dc.b SND_SwordHit
		dc.b SND_Jump
		dc.b SND_Fall
		dc.b SND_Door
		dc.b SND_Throw
		dc.b SND_EnemyNoise
		dc.b SND_DoorLock
		dc.b SND_Rumble
		dc.b SND_HealthRecover2
		dc.b SND_DogTransform
		dc.b SND_GhostAbsorbHP
		dc.b SND_JumpLand
		dc.b SND_LadderClimb
		dc.b SND_Throw1
		dc.b SND_Rebound
		dc.b SND_NigelHit1
		dc.b SND_NigelDropObj2
		dc.b SND_NigelDropObj1
		dc.b SND_NigelHit2
		dc.b SND_NigelDie
		dc.b SND_EnemyDie1
		dc.b SND_EnemyHit1
		dc.b SND_MenuOpen
		dc.b SND_HealthRecover1
		dc.b SND_PickupMoney
		dc.b SND_KazaltWarp
		dc.b SND_Switch
		dc.b SND_Explosion
		dc.b SND_Thud
		dc.b SND_EnemyDie2
		dc.b SND_EnemyHit2
		dc.b SND_Fireball1
		dc.b SND_Fireball2
		dc.b $FF
; ---------------------------------------------------------------------------

MusicMenu:					  ; DATA XREF: ROM:0002A4A8o
		movem.l	d0-a6,-(sp)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_FadeOut
; ---------------------------------------------------------------------------
		lea	MusicMenuActionJmptable(pc),a0
		clr.w	d1
		move.w	#$0027,d2
		bsr.w	JmpToDebugActionTableEntry
		movem.l	(sp)+,d0-a6
		rts
; ---------------------------------------------------------------------------
MusicMenuActionJmptable:dc.w MusicMenuLoad-MusicMenuActionJmptable
						  ; DATA XREF: ROM:0002A544t
						  ; ROM:MusicMenuActionJmptableo ...
		dc.w MusicMenuPlay-MusicMenuActionJmptable
		dc.w MusicMenuExit-MusicMenuActionJmptable
		dc.w IncrementVar-MusicMenuActionJmptable
		dc.w DecrementVar-MusicMenuActionJmptable
; ---------------------------------------------------------------------------

MusicMenuLoad:					  ; DATA XREF: ROM:MusicMenuActionJmptableo
		bsr.w	OpenTextbox
		move.w	#$001E,d0		  ; "MUSIC MENU"
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		clr.l	(g_PrintNumericDwordValue).l
		move.b	MusicList(pc,d1.w),(g_PrintNumericByteValue).l
		move.w	#$0020,d0		  ; PRINT NUMERIC ID
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		rts
; ---------------------------------------------------------------------------

MusicMenuPlay:					  ; DATA XREF: ROM:MusicMenuActionJmptableo
		clr.w	d0
		move.b	MusicList(pc,d1.w),d0
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w $FFFF
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

MusicMenuExit:					  ; DATA XREF: ROM:MusicMenuActionJmptableo
		bsr.w	ClearTextbox_0
		bset	#$01,(byte_FF1917).l
		rts
; ---------------------------------------------------------------------------
MusicList:	dc.b SND_MusicTown		  ; DATA XREF: ROM:0002A574r
						  ; ROM:0002A588r
		dc.b SND_MusicDungeon
		dc.b SND_MusicCave
		dc.b SND_MusicFanfare1
		dc.b SND_MusicChestOpen
		dc.b SND_MusicInnRest
		dc.b SND_MusicSaveGame
		dc.b SND_MusicStatusHeal
		dc.b SND_MusicPoisoned
		dc.b SND_MusicCrypt
		dc.b SND_MusicDukeFanfare
		dc.b SND_MusicFanfare2
		dc.b SND_MusicDogWhistle
		dc.b SND_MusicHarbour
		dc.b SND_MusicFridayAppear
		dc.b SND_MusicTitle
		dc.b SND_MusicIntro
		dc.b SND_MusicOverworld2
		dc.b SND_MusicOverworld1
		dc.b SND_MusicEmptyTown
		dc.b SND_MusicTwinkleVillage
		dc.b SND_MusicKayla
		dc.b SND_MusicEnding
		dc.b SND_MusicTreeWarp
		dc.b SND_MusicDukeChase
		dc.b SND_MusicChurch
		dc.b SND_MusicFinalRoom
		dc.b SND_MusicEvilVillage
		dc.b SND_MusicHappyVillage
		dc.b SND_MusicPalace1
		dc.b SND_MusicPalace2
		dc.b SND_MusicMap
		dc.b SND_MusicFridayCutscene
		dc.b SND_MusicFinalBoss
		dc.b SND_MusicKazalt
		dc.b SND_MusicLabrynth
		dc.b SND_MusicPiano
		dc.b SND_MusicFinalCutscene
		dc.b SND_MusicSpellbook
		dc.b SND_MusicBoss
; ---------------------------------------------------------------------------

MapMenu:					  ; DATA XREF: ROM:DebugMenuJmpTableo
		movem.l	d0-a6,-(sp)
		lea	MapMenuActionJmpTable(pc),a0
		clr.w	d1
		move.w	#$0019,d2
		bsr.w	JmpToDebugActionTableEntry
		movem.l	(sp)+,d0-a6
		rts
; ---------------------------------------------------------------------------
MapMenuActionJmpTable:dc.w MapMenuOpen-MapMenuActionJmpTable ; DATA XREF: ROM:0002A5CCt
						  ; ROM:MapMenuActionJmpTableo	...
		dc.w MapMenuEnter-MapMenuActionJmpTable
		dc.w MapMenuExit-MapMenuActionJmpTable
		dc.w IncrementVar-MapMenuActionJmpTable
		dc.w DecrementVar-MapMenuActionJmpTable
; ---------------------------------------------------------------------------

MapMenuOpen:					  ; DATA XREF: ROM:MapMenuActionJmpTableo
		move.l	d1,-(sp)
		bsr.w	OpenTextbox
		move.w	#$0021,d0		  ; "MAP MENU"
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		add.w	d1,d0
		addq.w	#$01,d0
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		move.l	(sp)+,d1
		rts
; ---------------------------------------------------------------------------

MapMenuEnter:					  ; DATA XREF: ROM:MapMenuActionJmpTableo
		movem.l	d0-a6,-(sp)
		bsr.w	ClearTextbox_0
		bset	#$01,(byte_FF1917).l
		asl.w	#$02,d1
		lea	MapList(pc,d1.w),a0
		move.w	(a0)+,d0
		move.w	(a0)+,(Player_X).l
		move.w	d0,(RmNum2).l
		jsr	(j_CheckForRoomTransition).l
		move.w	d0,(g_RmNum1).l
		jsr	(sub_3E6).l
		clr.b	d0
		jsr	(j_LoadRoom_0).l
		jsr	(sub_3E0).l
		movem.l	(sp)+,d0-a6
		rts
; ---------------------------------------------------------------------------

MapMenuExit:					  ; DATA XREF: ROM:MapMenuActionJmpTableo
		bsr.w	ClearTextbox_0
		bset	#$01,(byte_FF1917).l
		rts
; ---------------------------------------------------------------------------
MapList:	dc.w $0250, $2130		  ; DATA XREF: ROM:0002A616o
		dc.w $00B4, $261D		  ; WTRFLL-BASIN
		dc.w $0259, $2D13		  ; GUMI
		dc.w $01B1, $0E1B		  ; MARSHSHRINE1
		dc.w $001C, $121F		  ; MARSHSHRINE2
		dc.w $0262, $1913		  ; RYUMA
		dc.w $00BF, $1511		  ; THIEVES1
		dc.w $00E2, $1C17		  ; THIEVES2
		dc.w $0279, $2F2C		  ; MERCATOR
		dc.w $001F, $2A2D		  ; CASTLE MRCTR
		dc.w $01DB, $151B		  ; MIR	TOWER1
		dc.w $030F, $121F		  ; MIR	TOWER2
		dc.w $02C7, $1F31		  ; VERLA
		dc.w $02D6, $3B3B		  ; DESTEL
		dc.w $02E1, $1424		  ; KAZALT
		dc.w $015E, $1611		  ; LAKE SHRINE
		dc.w $0215, $221D		  ; TREE
		dc.w $007A, $2636		  ; UNDER PALACE
		dc.w $0233, $2727		  ; WOODS DANCE
		dc.w $0230, $262E		  ; WOODS 1
		dc.w $0232, $2F29		  ; WOODS 2
		dc.w $0237, $2224		  ; WOODS 34
		dc.w $0230, $3016		  ; WOODMAN
		dc.w $0237, $293C		  ; WOODS KALA
		dc.w $0240, $1A2E		  ; WOODS CENTER
		dc.w $0234, $281E		  ; SUN	STONE
; ---------------------------------------------------------------------------

FlagMenu:					  ; DATA XREF: ROM:0002A4A0o
		movem.l	d0-a6,-(sp)
		lea	FlagMenuActionJmpTable(pc),a0
		clr.w	d1
		move.w	#$000F,d2
		bsr.w	JmpToDebugActionTableEntry

loc_2A6D6:					  ; DATA XREF: ROM:FlagMenuActionJmpTable+2o
						  ; ROM:FlagMenuActionJmpTable+4o ...
		movem.l	(sp)+,d0-a6
		rts
; ---------------------------------------------------------------------------
FlagMenuActionJmpTable:dc.w FlagMenuOpen-FlagMenuActionJmpTable	; DATA XREF: ROM:0002A6C8t
						  ; ROM:FlagMenuActionJmpTableo ...
		dc.w FlagMenuEnter-FlagMenuActionJmpTable
		dc.w FlagMenuExit-FlagMenuActionJmpTable
		dc.w IncrementVar-FlagMenuActionJmpTable
		dc.w DecrementVar-FlagMenuActionJmpTable
; ---------------------------------------------------------------------------

FlagMenuOpen:					  ; DATA XREF: ROM:FlagMenuActionJmpTableo
		move.l	d1,-(sp)
		bsr.w	OpenTextbox
		move.w	#$003C,d0
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		add.w	d1,d0
		addq.w	#$01,d0
		bsr.w	DisplayText		  ; Prints the compressed string identified by d0
		move.l	(sp)+,d1
		rts
; ---------------------------------------------------------------------------

FlagMenuEnter:					  ; DATA XREF: ROM:FlagMenuActionJmpTableo
		movem.l	d0-a6,-(sp)
		bsr.w	ClearTextbox_0
		bset	#$01,(byte_FF1917).l
		lea	(g_Flags).l,a0
		moveq	#$00000007,d0

loc_2A718:					  ; CODE XREF: ROM:0002A71Aj
		clr.l	(a0)+
		dbf	d0,loc_2A718
		lea	FlagsToSet(pc),a0
		add.w	d1,d1
		move.w	FlagMenuOpts(pc,d1.w),d1
		blt.s	loc_2A734

loc_2A72A:					  ; CODE XREF: ROM:0002A732j
		move.w	(a0)+,d0
		bsr.w	SetFlagBit
		cmp.w	d1,d0
		bne.s	loc_2A72A

loc_2A734:					  ; CODE XREF: ROM:0002A728j
		jsr	(j_CheckForRoomTransition).l
		jsr	(sub_3E6).l
		clr.b	d0
		jsr	(j_LoadRoom_0).l
		jsr	(sub_3E0).l
		movem.l	(sp)+,d0-a6
		rts
; ---------------------------------------------------------------------------

FlagMenuExit:					  ; DATA XREF: ROM:FlagMenuActionJmpTableo
		bsr.w	ClearTextbox_0
		bset	#$01,(byte_FF1917).l
		rts
; ---------------------------------------------------------------------------
FlagMenuOpts:	dc.w $FFFF			  ; DATA XREF: ROM:0002A724r
		dc.w $0014			  ; 4  GUMI
		dc.w $0022			  ; 6  RYUMA
		dc.w $0023			  ; 10 MERCATOR
		dc.w $001D			  ; 16 CASTLE MRCTR
		dc.w $0093			  ; 19 CASTLE BANQUET
		dc.w $00A0			  ; 21 CATACOMB
		dc.w $00B3			  ; 22 THE OTHER SIDE
		dc.w $00A6			  ; 23 MIR TOWER
		dc.w $00BF			  ; 24 UNDER JAIL
		dc.w $0105			  ; 25 GREENMAZE
		dc.w $0131			  ; 27 VERLA
		dc.w $0140			  ; 28 DESTEL
		dc.w $0150			  ; 29 LAKE SHRINE
		dc.w $0155			  ; 30 MOUNTAINS
		dc.w $0156			  ; 31 CAVE AT THE TOP
FlagsToSet:	dc.w $0007, $0010, $0011, $0000	  ; DATA XREF: ROM:0002A71Et
		dc.w $0014, $0006, $0015, $0016
		dc.w $0022, $0017, $0020, $0021
		dc.w $0023, $002C, $002D, $002E
		dc.w $0027, $001D, $0091, $0092
		dc.w $0093, $0094, $00A0, $00A8
		dc.w $00A9, $00AA, $00AB, $00AC
		dc.w $00AD, $00AE, $00AF, $00B3
		dc.w $00A6, $00B4, $00BF, $0105
		dc.w $0124, $0131, $0140, $0150
		dc.w $0018, $0155, $0156, $FFFF

; =============== S U B	R O U T	I N E =======================================


JmpToDebugActionTableEntry:			  ; CODE XREF: DebugMenu+Ep
						  ; ROM:0002A4BCp ...
		move.w	(a0),d0
		jsr	(a0,d0.w)
		clr.b	(byte_FF1916).l
		clr.b	(byte_FF1917).l

loc_2A7EC:					  ; CODE XREF: JmpToDebugActionTableEntry+40j
		btst	#$00,(byte_FF1917).l
		beq.s	loc_2A804
		move.w	(a0),d0
		jsr	(a0,d0.w)
		bclr	#$00,(byte_FF1917).l

loc_2A804:					  ; CODE XREF: JmpToDebugActionTableEntry+1Aj
		bsr.w	sub_2A840
		beq.s	loc_2A812
		move.w	(a0,d0.w),d0
		jsr	(a0,d0.w)

loc_2A812:					  ; CODE XREF: JmpToDebugActionTableEntry+2Ej
		btst	#$01,(byte_FF1917).l
		beq.s	loc_2A7EC
		rts
; End of function JmpToDebugActionTableEntry


; =============== S U B	R O U T	I N E =======================================


DecrementVar:					  ; DATA XREF: ROM:DebugMenuActionTableo
						  ; ROM:SoundMenuActionJmptableo ...
		subq.w	#$01,d1
		bge.s	loc_2A824
		move.w	d2,d1

loc_2A824:					  ; CODE XREF: DecrementVar+2j
		bset	#$00,(byte_FF1917).l
		rts
; End of function DecrementVar


; =============== S U B	R O U T	I N E =======================================


IncrementVar:					  ; DATA XREF: ROM:DebugMenuActionTableo
						  ; ROM:SoundMenuActionJmptableo ...
		addq.w	#$01,d1
		cmp.w	d2,d1
		ble.s	loc_2A836
		clr.w	d1

loc_2A836:					  ; CODE XREF: IncrementVar+4j
		bset	#$00,(byte_FF1917).l
		rts
; End of function IncrementVar


; =============== S U B	R O U T	I N E =======================================


sub_2A840:					  ; CODE XREF: JmpToDebugActionTableEntry:loc_2A804p
		movem.l	d1-a6,-(sp)
		jsr	(j_WaitUntilVBlank).l
		jsr	(j_WaitForZ80).l
		move.b	(g_Controller1State).l,d1
		move.b	(byte_FF1916).l,d2
		move.b	d1,(byte_FF1916).l
		move.b	d1,d3
		eor.b	d2,d1
		and.b	d3,d1
		beq.s	loc_2A876
		moveq	#$00000007,d0

loc_2A86C:					  ; CODE XREF: sub_2A840+2Ej
		btst	d0,d1
		dbne	d0,loc_2A86C
		move.b	byte_2A87C(pc,d0.w),d0

loc_2A876:					  ; CODE XREF: sub_2A840+28j
		movem.l	(sp)+,d1-a6
		rts
; End of function sub_2A840

; ---------------------------------------------------------------------------
byte_2A87C:	dc.b $00, $00, $08, $06, $04, $02, $02,	$02; 0 ; DATA XREF: sub_2A840+32r
