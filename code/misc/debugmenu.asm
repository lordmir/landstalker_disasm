DebugMenus	module
; The debug menu, reached by talking to an NPC (PlayerTalk) while
; pad 2 holds Down and DebugModeEnable is clear. Each menu is a
; 5-entry table of word offsets driven by JmpToDebugActionTableEntry:
;   +0 open (draw), +2 enter/activate, +4 exit, +6 increment,
;   +8 decrement
; with d1 = cursor and d2 = last cursor index. Controls: Left/Right
; move the cursor (redrawing via g_DebugMenuFlags bit 0), C/A/Start
; activate, B leaves (handlers set g_DebugMenuFlags bit 1 to close).

; Top level: "DEBUG MENU" with the four submenu names.
DebugMenu:
		movem.l	d0-a6,-(sp)
		lea	DebugMenuActionTable(pc),a0
		clr.w	d1
		move.w	#$0003,d2
		bsr.w	JmpToDebugActionTableEntry
		movem.l	(sp)+,d0-a6
		rts

DebugMenuActionTable:
		dc.w DebugMenuOpen-DebugMenuActionTable
		dc.w DebugMenuEnter-DebugMenuActionTable
		dc.w DebugMenuExit-DebugMenuActionTable
		dc.w IncrementVar-DebugMenuActionTable
		dc.w DecrementVar-DebugMenuActionTable

DebugMenuOpen:
		bsr.w	OpenTextbox
		move.w	#$001D,d0		  ; "DEBUG MENU"
		bsr.w	DisplayText
		move.w	d1,d0
		asl.w	#$02,d0
		move.w	DebugMenuStringTable(pc,d0.w),d0
		bsr.w	DisplayText		  ; submenu name
		rts

DebugMenuEnter:
		move.w	d1,d0
		asl.w	#$02,d0
		move.w	DebugMenuJmpTable(pc,d0.w),d0
		jsr	DebugMenuStringTable(pc,d0.w)	  ; run the submenu
		rts

DebugMenuExit:
		bsr.w	ClearTextbox
		bset	#$01,(g_DebugMenuFlags).l
		rts

; Interleaved {string id, routine offset} pairs; both indexed with
; cursor*4, and the offsets are relative to DebugMenuStringTable.
DebugMenuStringTable:
		dc.w $0021			  ; "MAP MENU"
DebugMenuJmpTable:
		dc.w MapMenu-DebugMenuStringTable
		dc.w $003C			  ; "FLAG MENU"
		dc.w FlagMenu-DebugMenuStringTable
		dc.w $001F			  ; "SOUND MENU"
		dc.w SoundMenu-DebugMenuStringTable
		dc.w $001E			  ; "MUSIC MENU"
		dc.w MusicMenu-DebugMenuStringTable

; Sound test: pick an entry from SfxList, C/A/Start plays it.
SoundMenu:
		movem.l	d0-a6,-(sp)
		trap	#$00			  ; Trap00Handler
		dc.w SND_FadeOut
		lea	SoundMenuActionJmptable(pc),a0
		clr.w	d1
		move.w	#$002E,d2
		bsr.w	JmpToDebugActionTableEntry
		movem.l	(sp)+,d0-a6
		rts

SoundMenuActionJmptable:
		dc.w SoundMenuOpen-SoundMenuActionJmptable
		dc.w SoundMenuEnter-SoundMenuActionJmptable
		dc.w SoundMenuExit-SoundMenuActionJmptable
		dc.w IncrementVar-SoundMenuActionJmptable
		dc.w DecrementVar-SoundMenuActionJmptable

SoundMenuOpen:
		bsr.w	OpenTextbox
		move.w	#$001F,d0		  ; "SOUND MENU"
		bsr.w	DisplayText
		clr.l	(g_PrintNumericDwordValue).l
		move.b	SfxList(pc,d1.w),(g_PrintNumericByteValue).l
		addq.w	#$01,d0			  ; $20: prints the numeric id
		bsr.w	DisplayText
		rts

SoundMenuEnter:
		clr.w	d0
		move.b	SfxList(pc,d1.w),d0
		trap	#$00			  ; Trap00Handler
		dc.w SND_LoadFromD0
		rts

SoundMenuExit:
		bsr.w	ClearTextbox
		bset	#$01,(g_DebugMenuFlags).l
		rts

SfxList:	dc.b SND_SkeletonTalk
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

; Music test: pick an entry from MusicList, C/A/Start plays it.
MusicMenu:
		movem.l	d0-a6,-(sp)
		trap	#$00			  ; Trap00Handler
		dc.w SND_FadeOut
		lea	MusicMenuActionJmptable(pc),a0
		clr.w	d1
		move.w	#$0027,d2
		bsr.w	JmpToDebugActionTableEntry
		movem.l	(sp)+,d0-a6
		rts

MusicMenuActionJmptable:
		dc.w MusicMenuLoad-MusicMenuActionJmptable
		dc.w MusicMenuPlay-MusicMenuActionJmptable
		dc.w MusicMenuExit-MusicMenuActionJmptable
		dc.w IncrementVar-MusicMenuActionJmptable
		dc.w DecrementVar-MusicMenuActionJmptable

MusicMenuLoad:
		bsr.w	OpenTextbox
		move.w	#$001E,d0		  ; "MUSIC MENU"
		bsr.w	DisplayText
		clr.l	(g_PrintNumericDwordValue).l
		move.b	MusicList(pc,d1.w),(g_PrintNumericByteValue).l
		move.w	#$0020,d0		  ; prints the numeric id
		bsr.w	DisplayText
		rts

MusicMenuPlay:
		clr.w	d0
		move.b	MusicList(pc,d1.w),d0
		trap	#$00			  ; Trap00Handler
		dc.w $FFFF			  ; = SND_LoadFromD0
		rts

MusicMenuExit:
		bsr.w	ClearTextbox
		bset	#$01,(g_DebugMenuFlags).l
		rts

MusicList:	dc.b SND_MusicTown
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

; Map warp: pick a location, C/A/Start warps there.
MapMenu:
		movem.l	d0-a6,-(sp)
		lea	MapMenuActionJmpTable(pc),a0
		clr.w	d1
		move.w	#$0019,d2
		bsr.w	JmpToDebugActionTableEntry
		movem.l	(sp)+,d0-a6
		rts

MapMenuActionJmpTable:
		dc.w MapMenuOpen-MapMenuActionJmpTable
		dc.w MapMenuEnter-MapMenuActionJmpTable
		dc.w MapMenuExit-MapMenuActionJmpTable
		dc.w IncrementVar-MapMenuActionJmpTable
		dc.w DecrementVar-MapMenuActionJmpTable

MapMenuOpen:
		move.l	d1,-(sp)
		bsr.w	OpenTextbox
		move.w	#$0021,d0		  ; "MAP MENU"
		bsr.w	DisplayText
		add.w	d1,d0			  ; $22+: location names
		addq.w	#$01,d0
		bsr.w	DisplayText
		move.l	(sp)+,d1
		rts

; Warps to MapList[cursor]: {room, packed player X/Y}.
MapMenuEnter:
		movem.l	d0-a6,-(sp)
		bsr.w	ClearTextbox
		bset	#$01,(g_DebugMenuFlags).l
		asl.w	#$02,d1
		lea	MapList(pc,d1.w),a0
		move.w	(a0)+,d0
		move.w	(a0)+,(Player_X).l
		move.w	d0,(g_OriginalRoom).l
		jsr	(j_CheckForRoomTransition).l
		move.w	d0,(g_CurrentRoom).l
		jsr	(j_FadeOutToDarkness).l
		clr.b	d0
		jsr	(j_LoadRoom_0).l
		jsr	(j_InitRoomDisplayAndFadeIn).l
		movem.l	(sp)+,d0-a6
		rts

MapMenuExit:
		bsr.w	ClearTextbox
		bset	#$01,(g_DebugMenuFlags).l
		rts

MapList:	dc.w $0250, $2130		  ; MASSAN
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

; Story-progress warp: pick a chapter, C/A/Start resets all flags
; and replays the progression up to that point.
FlagMenu:
		movem.l	d0-a6,-(sp)
		lea	FlagMenuActionJmpTable(pc),a0
		clr.w	d1
	if ((REGION=FR)!(REGION=DE))
		move.w	#$0010,d2
	else
		move.w	#$000F,d2
	endif
		bsr.w	JmpToDebugActionTableEntry
		movem.l	(sp)+,d0-a6
		rts

FlagMenuActionJmpTable:
		dc.w FlagMenuOpen-FlagMenuActionJmpTable
		dc.w FlagMenuEnter-FlagMenuActionJmpTable
		dc.w FlagMenuExit-FlagMenuActionJmpTable
		dc.w IncrementVar-FlagMenuActionJmpTable
		dc.w DecrementVar-FlagMenuActionJmpTable

FlagMenuOpen:
		move.l	d1,-(sp)
		bsr.w	OpenTextbox
		move.w	#$003C,d0		  ; "FLAG MENU"
		bsr.w	DisplayText
		add.w	d1,d0			  ; $3D+: chapter names
		addq.w	#$01,d0
		bsr.w	DisplayText
		move.l	(sp)+,d1
		rts

; Clears all 32 bytes of g_Flags, then sets each flag in FlagsToSet
; up to and including the option's terminator from FlagMenuOpts
; ($FFFF = fresh game, set nothing), and reloads the room.
FlagMenuEnter:
		movem.l	d0-a6,-(sp)
		bsr.w	ClearTextbox
		bset	#$01,(g_DebugMenuFlags).l
		lea	(g_Flags).l,a0
		moveq	#$00000007,d0

_fmClear:
		clr.l	(a0)+
		dbf	d0,_fmClear
		lea	FlagsToSet(pc),a0
		add.w	d1,d1
		move.w	FlagMenuOpts(pc,d1.w),d1
		blt.s	_fmWarp

_fmSetFlags:
		move.w	(a0)+,d0
		bsr.w	SetFlagBit
		cmp.w	d1,d0
		bne.s	_fmSetFlags

_fmWarp:
		jsr	(j_CheckForRoomTransition).l
		jsr	(j_FadeOutToDarkness).l
		clr.b	d0
		jsr	(j_LoadRoom_0).l
		jsr	(j_InitRoomDisplayAndFadeIn).l
		movem.l	(sp)+,d0-a6
		rts

FlagMenuExit:
		bsr.w	ClearTextbox
		bset	#$01,(g_DebugMenuFlags).l
		rts

; Per-option terminator flag (the comments give the chapter name and
; string id).
FlagMenuOpts:	dc.w $FFFF
		dc.w $0014			  ; 4  GUMI
		dc.w $0022			  ; 6  RYUMA
	if ((REGION=FR)!(REGION=DE))
		dc.w $0021            ; 9  LITHOGRAPH
	endif
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
FlagsToSet:	dc.w $0007, $0010, $0011, $0000
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

; Menu framework: draw via entry +0, then loop - redraw when
; g_DebugMenuFlags bit 0 is set, run the action _pollInput returns,
; stop once a handler sets g_DebugMenuFlags bit 1.
JmpToDebugActionTableEntry:
		move.w	(a0),d0
		jsr	(a0,d0.w)
		clr.b	(g_DebugMenuButtons).l
		clr.b	(g_DebugMenuFlags).l

_menuLoop:
		btst	#$00,(g_DebugMenuFlags).l
		beq.s	_noRedraw
		move.w	(a0),d0
		jsr	(a0,d0.w)
		bclr	#$00,(g_DebugMenuFlags).l

_noRedraw:
		bsr.w	_pollInput
		beq.s	_chkExit
		move.w	(a0,d0.w),d0
		jsr	(a0,d0.w)

_chkExit:
		btst	#$01,(g_DebugMenuFlags).l
		beq.s	_menuLoop
		rts

; Cursor movement handlers: wrap within 0..d2 and request a redraw.
DecrementVar:
		subq.w	#$01,d1
		bge.s	_decMark
		move.w	d2,d1

_decMark:
		bset	#$00,(g_DebugMenuFlags).l
		rts

IncrementVar:
		addq.w	#$01,d1
		cmp.w	d2,d1
		ble.s	_incMark
		clr.w	d1

_incMark:
		bset	#$00,(g_DebugMenuFlags).l
		rts

; Waits a frame and edge-detects pad 1: d0 = action table offset for
; the highest newly pressed button (0 = none) via _buttonActions.
_pollInput:
		movem.l	d1-a6,-(sp)
		jsr	(j_WaitUntilVBlank).l
		jsr	(j_UpdateControllerInputs).l
		move.b	(g_Controller1State).l,d1
		move.b	(g_DebugMenuButtons).l,d2
		move.b	d1,(g_DebugMenuButtons).l
		move.b	d1,d3
		eor.b	d2,d1
		and.b	d3,d1			  ; d1 = newly pressed buttons
		beq.s	_pollDone
		moveq	#$00000007,d0

_findBit:
		btst	d0,d1
		dbne	d0,_findBit
		move.b	_buttonActions(pc,d0.w),d0

_pollDone:
		movem.l	(sp)+,d1-a6
		rts

; Indexed by button bit (Up, Down, Left, Right, B, C, A, Start):
; table offset 2 = enter, 4 = exit, 6 = increment, 8 = decrement.
_buttonActions:	dc.b $00, $00, $08, $06, $04, $02, $02,	$02

		modend
