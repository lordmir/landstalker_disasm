DialogueActions	module
; The cutscene actions (CSA_xxxx): one handler per dialogue-script
; action id, dispatched by ProcessDialogueScriptAction
; (dialogueactionjumptable.asm). Behaviour scripts start them via
; EB_StartLoCutscene (ids $00-$FF) and EB_StartHiCutscene ($100-$15A),
; and the game logic calls them directly around special animations;
; a5 = the entity the script is running on.
;
; Most actions just run a cutscene dialogue script
; (LoadCutsceneDialogue - the inline comments name the script) and
; often branch on the answer to its Yes/No prompt
; (g_YesNoPromptResult). Actions that warp to another room end with
; four `movem.l (sp)+` pops: they unwind the registers their callers
; saved and return straight to the game loop, abandoning the script.
;
; g_Flags+1 is the cutscene scratch byte: bit 0 is the usual "player
; said yes / it happened" signal back to the behaviour script, and
; bits 6-7 pass a facing direction between actions.

; Replays the current room BGM (g_BGM).
_restartBGM:
		move.b	(g_BGM).l,d0
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_LoadFromD0
; ---------------------------------------------------------------------------
		rts

; Runs cutscene dialogue script d0 (an index into the cutscene
; ScriptID table; the inline comments carry the id and address).
LoadCutsceneDialogue:
		jsr	(j_FlushDMACopyQueue).l
		jsr	(j_PlayCutsceneScript).l
		rts

CSA_0000:
		move.b	#$01,(g_PlayerAnimation).l
		rts

; ---------------------------------------------------------------------------

CSA_0001:
		move.w	#$0009,d0		  ; Cutscene 0x009: 0x025440
		bra.s	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0002:
		move.w	#$000A,d0		  ; Cutscene 0x00A: 0x025442
		bra.s	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0003:
		move.w	#$000D,d0		  ; Cutscene 0x00D: 0x025448
		bra.s	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0004:
		bsr.w	CSA_015A
		move.w	#$000E,d0		  ; Cutscene 0x00E: 0x02544A
		bsr.s	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_0005:
		bsr.w	CSA_015A
		move.w	#$000F,d0		  ; Cutscene 0x00F: 0x02544C
		bra.s	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0006:
		move.w	#$0010,d0		  ; Cutscene 0x010: 0x02544E
		bra.s	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Warp to the current room's transition variant and abandon the
; script: the trailing movem pops unwind the four callers' saved
; registers and return straight to the game loop (a pattern shared
; by every room-warping action below).
CSA_0007:
		move.w	(g_CurrentRoom).l,d0
		jsr	(j_CheckForRoomTransition).l
		move.w	d0,(g_CurrentRoom).l
		jsr	(j_WarpToRoom).l
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation2).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_0008:
		move.b	#FRIDAY_FLY_UP,(g_FridayAnimation1).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l
		move.w	#$000B,d0		  ; Cutscene 0x00B: 0x025444
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_HOVER,(g_FridayAnimation2).l
		move.w	#$000C,d0		  ; Cutscene 0x00C: 0x025446
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation2).l
		rts
; ---------------------------------------------------------------------------

; Massan dance: swap sprite 1's appearance with sprite 7's, play the
; scene, then face the talker NE and finish.
CSA_0009:
		movem.l	a5,-(sp)
		move.b	#$00,d0
		move.b	#$06,d1
		bsr.w	SwapSpriteAppearance
		jsr	(j_LoadSprites).l
		jsr	(j_QueueScrollUpdates).l
		jsr	(j_EnableVRAMCopyQueueProcessing).l
		jsr	(j_EnableDMAQueueProcessing).l
		move.w	#$0012,d0		  ; Cutscene 0x012: 0x025452
		bsr.w	LoadCutsceneDialogue
		movem.l	(sp)+,a5
		movea.l	a5,a0
		andi.b	#$3F,RotationAndSize(a0)
		bsr.w	ForceIdleFrame
		jsr	(j_LoadSprites).l
		move.w	#$0013,d0		  ; Cutscene 0x013: 0x025454
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Swap the calling sprite's appearance with the sprite six slots on.
CSA_000A:
		move.l	a5,d0
		subi.l	#Player_X,d0
		lsr.w	#$07,d0
		subi.b	#$01,d0
		move.b	d0,d1
		addi.b	#$06,d1
		bsr.w	SwapSpriteAppearance
		jsr	(j_LoadSprites).l
		jsr	(j_QueueScrollUpdates).l
		jsr	(j_EnableVRAMCopyQueueProcessing).l
		jmp	(j_EnableDMAQueueProcessing).l
; ---------------------------------------------------------------------------

CSA_000B:
		move.w	#$0014,d0		  ; Cutscene 0x014: 0x025456
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_000C:
		move.w	#$0015,d0		  ; Cutscene 0x015: 0x025458
		bsr.w	LoadCutsceneDialogue
		move.b	#$0C,d0
		move.b	#$0D,d1
		bsr.w	SwapSpriteAppearance
		jsr	(j_LoadSprites).l
		jsr	(j_QueueScrollUpdates).l
		jsr	(j_EnableVRAMCopyQueueProcessing).l
		jmp	(j_EnableDMAQueueProcessing).l
; ---------------------------------------------------------------------------

CSA_000D:
		move.w	#$0016,d0		  ; Cutscene 0x016: 0x02545A
		bsr.w	LoadCutsceneDialogue
		move.b	#$09,d0
		bsr.w	PlaybackInput
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

CSA_000E:
		move.w	#$0017,d0		  ; Cutscene 0x017: 0x02545C
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_000F:
		move.w	#$0018,d0		  ; Cutscene 0x018: 0x02545E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Friday freed from the thieves: dance scene - sprite 1 spins through
; 40 quarter-turns.
CSA_0010:
		move.w	#$0006,d0		  ; Cutscene 0x006: 0x02543A
		bsr.w	LoadCutsceneDialogue
		bsr.w	CSA_015A
		move.w	#$0007,d0		  ; Cutscene 0x007: 0x02543C
		bsr.w	LoadCutsceneDialogue
		bsr.w	_fridayCastSpell
		move.w	#00039,d7

_c0010Spin:
		movem.w	d7,-(sp)
		lea	(Sprite1_X).l,a0
		move.b	Sprite1_RotationAndSize-Sprite1_X(a0),d0
		addi.b	#$40,d0
		andi.b	#$C0,d0
		andi.b	#$3F,$00000004(a0)
		or.b	d0,$00000004(a0)
		bsr.w	ForceIdleFrame
		jsr	(j_LoadSprites).l
		jsr	(j_WaitUntilVBlank).l
		movem.w	(sp)+,d7
		dbf	d7,_c0010Spin
		move.w	#$0008,d0		  ; Cutscene 0x008: 0x02543E
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation2).l
		rts
; ---------------------------------------------------------------------------

CSA_0011:
		move.b	#FRIDAY_FLY_UP,(g_FridayAnimation1).l
		move.b	#FRIDAY_HOVER,(g_FridayAnimation2).l
		move.w	#$0000,d0		  ; Cutscene 0x000: 0x02542E
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation2).l
		bset	#$05,(g_Flags).l
		rts
; ---------------------------------------------------------------------------

CSA_0012:
		move.w	#$0001,d0		  ; Cutscene 0x001: 0x025430
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0013:
		move.w	#$0002,d0		  ; Cutscene 0x002: 0x025432
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0014:
		move.b	#$09,d0
		bsr.w	PlaybackInput
		move.w	#$0019,d0		  ; Cutscene 0x019: 0x025460
		bsr.w	LoadCutsceneDialogue
		bset	#$01,(Player_CombatFlags).l
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

CSA_0015:
		move.w	#$001A,d0		  ; Cutscene 0x01A: 0x025462
		bsr.w	LoadCutsceneDialogue
		bclr	#$01,(Player_CombatFlags).l
		rts
; ---------------------------------------------------------------------------

CSA_0016:
		bsr.w	CSA_015A
		move.w	#$001B,d0		  ; Cutscene 0x01B: 0x025464
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation2).l
		tst.b	(g_YesNoPromptResult).l
		beq.s	_c0016No
		move.b	#$08,d0
		jsr	(j_DoTileSwap).l
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

_c0016No:
		clr.w	(g_ControllerPlayback).l
		rts
; ---------------------------------------------------------------------------

CSA_0017:
		move.b	#$10,d0
		jsr	(j_DoTileSwap).l
		rts
; ---------------------------------------------------------------------------

CSA_0018:
		bsr.w	CSA_015A
		move.w	#$001C,d0		  ; Cutscene 0x01C: 0x025466
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation2).l
		tst.b	(g_YesNoPromptResult).l
		beq.s	_c0018No
		move.b	#$08,d0
		jsr	(j_DoTileSwap).l
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

_c0018No:
		clr.w	(g_ControllerPlayback).l
		rts
; ---------------------------------------------------------------------------

CSA_0019:
		move.b	#$08,d0
		jmp	(j_DoTileSwap).l
; ---------------------------------------------------------------------------

CSA_001A:
		move.b	#$10,d0
		jmp	(j_DoTileSwap).l
; ---------------------------------------------------------------------------

CSA_001B:
		move.b	#$08,d0
		jmp	(j_DoTileSwap).l
; ---------------------------------------------------------------------------

CSA_001C:
		move.w	#$0003,d0
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l
		move.w	#$0004,d0		  ; Cutscene 0x004: 0x025436
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_001D:
		move.w	#$0005,d0		  ; Cutscene 0x005: 0x025438
		bsr.w	LoadCutsceneDialogue
		bsr.w	_fridayCastSpell
		bset	#$07,(g_Flags).l
		jsr	(j_FadeOutToDarkness).l
		move.b	#$11,(Player_X).l
		move.b	#$10,(Player_Y).l
		bclr	#$06,(Player_InteractFlags).l
		clr.b	d0
		jsr	(j_LoadRoom_0).l
		jsr	(j_InitRoomDisplayAndFadeIn).l
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation2).l
		clr.w	(g_ControllerPlayback).l
		bset	#$04,(g_Flags).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_001E:
		bset	#$03,(g_Flags).l
		move.w	(g_CurrentRoom).l,d0
		jsr	(j_CheckForRoomTransition).l
		move.w	d0,(g_CurrentRoom).l
		jsr	(j_WarpToRoom).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_001F:
		bsr.w	CSA_015A
		move.w	#$001D,d0		  ; Cutscene 0x01D: 0x025468
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		move.b	#$0D,d0
		bsr.w	PlaybackInput
		ori.b	#$C0,(Player_RotationAndSize).l
		rts
; ---------------------------------------------------------------------------

CSA_0020:
		move.w	#$001E,d0		  ; Cutscene 0x01E: 0x02546A
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0021:
		move.w	#$0020,d0		  ; Cutscene 0x020: 0x02546E
		bsr.w	LoadCutsceneDialogue
		bset	#$00,(g_Flags+1).l
		movea.l	(g_TalkingSprite).l,a0
		move.b	RotationAndSize(a0),d0
		andi.b	#DIR_MASK,d0
		ori.b	#$01,d0
		move.b	d0,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

CSA_0022:
		move.w	#$0021,d0		  ; Cutscene 0x021: 0x025470
		bsr.w	LoadCutsceneDialogue
		bset	#$03,(g_Flags+4).l
		rts
; ---------------------------------------------------------------------------

CSA_0023:
		move.b	(g_Flags+1).l,d0
		andi.b	#$C0,d0
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d0,RotationAndSize(a5)
		bset	#$07,AnimCtrl(a5)
		rts
; ---------------------------------------------------------------------------

CSA_0024:
		move.w	#$0022,d0		  ; Cutscene 0x022: 0x025472
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0025:
		move.w	#$0023,d0		  ; Cutscene 0x023: 0x025474
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0026:
		move.w	#$0024,d0		  ; Cutscene 0x024: 0x025476
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0027:
		move.w	#$0025,d0		  ; Cutscene 0x025: 0x025478
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0028:
		move.w	#$0036,d0		  ; Cutscene 0x036: 0x02549A
		bsr.w	LoadCutsceneDialogue
		btst	#$03,(g_Flags+4).l
		beq.s	_c0028No
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_DoorLock
; ---------------------------------------------------------------------------
		move.b	#$08,d0
		jsr	(j_DoTileSwap).l
		bset	#$07,(g_Flags+4).l
		rts
; ---------------------------------------------------------------------------

_c0028No:
		clr.w	(g_ControllerPlayback).l
		rts
; ---------------------------------------------------------------------------

CSA_0029:
		move.b	#$09,d0
		bsr.w	PlaybackInput
		bset	#$00,(g_Flags+5).l
		move.w	#$0032,d0		  ; Cutscene 0x032: 0x025492
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_002A:
		move.w	#$0033,d0		  ; Cutscene 0x033: 0x025494
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_002B:
		move.w	#$0034,d0		  ; Cutscene 0x034: 0x025496
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Opens the door NW of a fixed heightmap cell by faking the player's
; position (Player_HeightmapOffset) around j_CheckForDoorNW; CSA_002D,
; CSA_00AB, CSA_00B0 and CSA_00D4 do the same for other doors.
CSA_002C:
		move.w	(Player_HeightmapOffset).l,d0
		movem.w	d0,-(sp)
		move.w	#$E8DC,(Player_HeightmapOffset).l
		jsr	(j_CheckForDoorNW).l
		movem.w	(sp)+,d0
		move.w	d0,(Player_HeightmapOffset).l
		rts
; ---------------------------------------------------------------------------

CSA_002D:
		move.w	(Player_HeightmapOffset).l,d0
		movem.w	d0,-(sp)
		move.w	#$EF58,(Player_HeightmapOffset).l
		jsr	(j_CheckForDoorNW).l
		movem.w	(sp)+,d0
		move.w	d0,(Player_HeightmapOffset).l
		rts
; ---------------------------------------------------------------------------

CSA_002E:
		move.w	#$002D,d0		  ; Cutscene 0x02D: 0x025488
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_002F:
		move.w	#$002E,d0		  ; Cutscene 0x02E: 0x02548A
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c002FNo
		bset	#$02,(g_Flags+5).l
		bsr.w	CSA_015A
		move.w	#$0030,d0		  ; Cutscene 0x030: 0x02548E
		bsr.w	LoadCutsceneDialogue
		bsr.w	_fridayCastSpell
		move.w	#$0025,d7

_c002FSpin:
		movem.w	d7,-(sp)
		lea	(Player_X).l,a0
		move.b	RotationAndSize(a0),d0
		addi.b	#$40,d0
		andi.b	#$C0,d0
		andi.b	#$3F,$00000004(a0)
		or.b	d0,$00000004(a0)
		ori.b	#$80,$0000000A(a0)
		movem.l	a5,-(sp)
		jsr	(j_SetPlayerIdlePose).l
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		movem.l	(sp)+,a5
		movem.w	(sp)+,d7
		dbf	d7,_c002FSpin
		bsr.w	_drainToNearDeath
		move.w	#$0031,d0		  ; Cutscene 0x031: 0x025490
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation2).l
		rts
; ---------------------------------------------------------------------------

_c002FNo:
		move.w	#$002F,d0		  ; Cutscene 0x02F: 0x02548C
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Fahl's dojo challenge accepted: save the player's health in
; TempHealth and fight at a locked $FF (near-death) with menu/attack/
; pick-up disabled.
CSA_0030:
		clr.b	(g_AdditionalFlags+$1A).l
		move.w	#$0037,d0		  ; Cutscene 0x037: 0x02549C
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.s	_c0030Rts
		bset	#$07,(g_Flags+5).l
		bset	#$04,(g_PlayerStatus).l
		bset	#$02,(g_LockPlayerActions).l
		move.w	(Player_CurrentHealth).l,(Player_TempHealth).l
		move.w	#$00FF,(Player_CurrentHealth).l
		bsr.w	RefreshCurrentHealthHUD
		bsr.w	MarkHUDForUpdate

_c0030Rts:
		rts
; ---------------------------------------------------------------------------

; Fahl's dojo: turn sprite 1 into the next FahlEnemyList enemy and
; make it hostile, then hand this tick to its AI (the unwind ends the
; script).
CSA_0031:
		movem.l	a5,-(sp)
		move.b	#$01,(Sprite1_Speed).l
		lea	(Sprite1_X).l,a1
		bset	#$07,InteractFlags(a1)
		bset	#$07,InitInteractFlags(a1)
		bclr	#$04,InteractFlags(a1)
		clr.w	d0
		move.b	(g_AdditionalFlags+$1A).l,d0
		move.b	FahlEnemyList(pc,d0.w),d0
		move.b	d0,SpriteType(a1)
		bsr.w	LookupSpriteGfxIndex
		move.b	SpriteGraphic(a1),d0
		bsr.w	GetEnemyStats
		bsr.s	_fahlApplySprite
		movem.l	(sp)+,a5
		jsr	(j_RunEnemyAI_B).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts

; Refreshes sprite 1 after a type change: dimensions, anim flags,
; facing, palette and redraw, with an enemy-hit sound.
_fahlApplySprite:
		bsr.w	GetSpriteDims
		bsr.w	LookupSpriteAnimFlags
		move.b	RotationAndSize(a1),d1
		bsr.w	SetSpriteRotationAnimFlags
		move.b	SpriteType(a1),d0
		movea.l	a1,a0
		jsr	(j_GetSpritePalette).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_EnemyHit1
; ---------------------------------------------------------------------------
		jsr	(j_CopyBasePaletteToActivePalette).l
		lea	(Sprite1_X).l,a1
		bset	#$07,RenderFlags(a1)
		jmp	(j_LoadSprites).l

; ---------------------------------------------------------------------------
; Fahl's dojo opponents, indexed by win count.
FahlEnemyList:	dc.b SPR_ORC1
		dc.b SPR_ORC1
		dc.b SPR_ORC2
		dc.b SPR_ORC2
		dc.b SPR_ORC3
		dc.b SPR_ORC3
		dc.b SPR_ORC3
		dc.b SPR_NINJA1
		dc.b SPR_NINJA1
		dc.b SPR_NINJA2
		dc.b SPR_NINJA2
		dc.b SPR_NINJA2
		dc.b SPR_NINJA3
		dc.b SPR_NINJA3
		dc.b SPR_NINJA3
		dc.b SPR_LIZARD1
		dc.b SPR_LIZARD1
		dc.b SPR_LIZARD2
		dc.b SPR_LIZARD2
		dc.b SPR_LIZARD3
		dc.b SPR_LIZARD3
		dc.b SPR_LIZARD3
		dc.b SPR_GIANT1
		dc.b SPR_GIANT1
		dc.b SPR_GIANT2
		dc.b SPR_GIANT2
		dc.b SPR_GIANT2
		dc.b SPR_GIANT3
		dc.b SPR_GIANT3
		dc.b SPR_GIANT3
		dc.b SPR_UNICORN1
		dc.b SPR_UNICORN1
		dc.b SPR_UNICORN2
		dc.b SPR_UNICORN2
		dc.b SPR_UNICORN3
		dc.b SPR_UNICORN3
		dc.b SPR_UNICORN3
		dc.b SPR_KNIGHT1
		dc.b SPR_KNIGHT1
		dc.b SPR_KNIGHT2
		dc.b SPR_KNIGHT2
		dc.b SPR_KNIGHT3
		dc.b SPR_KNIGHT3
		dc.b SPR_SKELETON1
		dc.b SPR_SKELETON1
		dc.b SPR_SKELETON2
		dc.b SPR_SKELETON2
		dc.b SPR_SKELETON3
		dc.b SPR_SKELETON3
		dc.b SPR_SKELETON3
; ---------------------------------------------------------------------------

; Fahl's dojo: an enemy went down - revert sprite 1 to type 1, count
; the win (g_AdditionalFlags+$1A) and run the milestone script at
; 5/10/20/30/40 wins ("keep going?"); 50 wins ends the challenge.
CSA_0032:
		lea	(Sprite1_X).l,a1
		clr.w	BehavParam(a1)
		bclr	#$07,InteractFlags(a1)
		bclr	#$07,InitInteractFlags(a1)
		move.b	#$01,d0
		move.b	d0,SpriteType(a1)
		bsr.w	LookupSpriteGfxIndex
		move.b	SpriteGraphic(a1),d0
		bsr.w	_fahlApplySprite
		tst.w	(Player_CurrentHealth).l
		beq.w	_c0032Rts
		addq.b	#$01,(g_AdditionalFlags+$1A).l
		cmpi.b	#$05,(g_AdditionalFlags+$1A).l
		beq.s	_c0032Win5
		cmpi.b	#$0A,(g_AdditionalFlags+$1A).l
		beq.s	_c0032Win10
		cmpi.b	#$14,(g_AdditionalFlags+$1A).l
		beq.s	_c0032Win20
		cmpi.b	#$1E,(g_AdditionalFlags+$1A).l
		beq.s	_c0032Win30
		cmpi.b	#$28,(g_AdditionalFlags+$1A).l
		beq.s	_c0032Win40
		cmpi.b	#$32,(g_AdditionalFlags+$1A).l
		beq.s	_c0032Win50

_c0032Rts:
		rts
; ---------------------------------------------------------------------------

_c0032Win5:
		move.w	#$0038,d0		  ; Cutscene 0x038: 0x02549E
		bra.s	_c0032Ask
; ---------------------------------------------------------------------------

_c0032Win10:
		move.w	#$0039,d0		  ; Cutscene 0x039: 0x0254A0
		bra.s	_c0032Ask
; ---------------------------------------------------------------------------

_c0032Win20:
		move.w	#$003A,d0		  ; Cutscene 0x03A: 0x0254A2
		bra.s	_c0032Ask
; ---------------------------------------------------------------------------

_c0032Win30:
		move.w	#$003B,d0		  ; Cutscene 0x03B: 0x0254A4
		bra.s	_c0032Ask
; ---------------------------------------------------------------------------

_c0032Win40:
		move.w	#$003C,d0		  ; Cutscene 0x03C: 0x0254A6

_c0032Ask:
		cmpi.w	#$00FF,(Player_CurrentHealth).l
		bne.s	_c0032End
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0032End
		rts
; ---------------------------------------------------------------------------

_c0032Win50:
		move.w	#$003D,d0		  ; Cutscene 0x03D: 0x0254A8
		bsr.w	LoadCutsceneDialogue

_c0032End:
		bclr	#$07,(g_Flags+5).l
		bclr	#$06,(g_Flags+$C).l
		move.w	(Player_TempHealth).l,(Player_CurrentHealth).l
		bsr.w	RefreshCurrentHealthHUD
		bsr.w	MarkHUDForUpdate
		bsr.w	RefreshHUD
		jsr	(j_EnableDMAQueueProcessing).l
		clr.b	(g_PlayerAnimation).l
		clr.b	(g_PlayerHurtTimer).l
		clr.b	(g_PlayerPendingHit).l
		clr.w	(g_ControllerPlayback).l
		bclr	#$00,(Player_InteractFlags).l
		bclr	#$04,(g_PlayerStatus).l
		bclr	#$02,(g_LockPlayerActions).l
		clr.w	(Sprite1_BehavParam).l
		clr.w	(Sprite2_BehavParam).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

; Fahl's dojo aftermath: restore the saved health and controls.
CSA_0033:
		bset	#$04,InteractFlags(a5)
		lea	(Player_X).l,a0
		bset	#$07,AnimCtrl(a0)
		bset	#$07,RenderFlags(a0)
		jsr	(j_SetPlayerIdlePose).l
		jsr	(j_LoadSprites).l
		move.w	(Player_TempHealth).l,(Player_CurrentHealth).l
		bsr.w	RefreshCurrentHealthHUD
		bsr.w	MarkHUDForUpdate
		bsr.w	RefreshHUD
		jsr	(j_EnableDMAQueueProcessing).l
		clr.b	(g_PlayerAnimation).l
		clr.b	(g_PlayerHurtTimer).l
		clr.b	(g_PlayerPendingHit).l
		clr.w	(g_ControllerPlayback).l
		bclr	#$00,(Player_InteractFlags).l
		bclr	#$04,(g_PlayerStatus).l
		bclr	#$02,(g_LockPlayerActions).l
		move.w	#$003E,d0		  ; Cutscene 0x03E: 0x0254AA
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0034:
		move.w	#$003F,d0		  ; Cutscene 0x03F: 0x0254AC
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.s	_c0034Rts
		bset	#$00,(g_Flags+1).l
		bset	#$05,(Sprite2_InteractFlags).l

_c0034Rts:
		rts
; ---------------------------------------------------------------------------

; Casino roulette win: pay 50/100/400 gold depending on which
; g_Flags+1 bit the ball's resting place set (trigger TA_21).
CSA_0035:
		moveq	#0000000050,d0
		btst	#$01,(g_Flags+1).l
		bne.s	_c0035Pay
		moveq	#0000000100,d0
		btst	#$02,(g_Flags+1).l
		bne.s	_c0035Pay
		move.l	#0000000400,d0

_c0035Pay:
		add.w	d0,(g_AdditionalFlags+$1C).l
		move.l	d0,(g_PrintNumericDwordValue).l
		bsr.w	AddGold
		move.w	#$0040,d0		  ; Cutscene 0x040: 0x0254AE
		bsr.w	LoadCutsceneDialogue
		bsr.w	MarkHUDForUpdate
		bra.w	RefreshHUD
; ---------------------------------------------------------------------------

; Casino roulette loss: take the same stake back.
CSA_0036:
		move.w	#$0041,d0		  ; Cutscene 0x041: 0x0254B0
		bsr.w	LoadCutsceneDialogue
		moveq	#0000000050,d0
		btst	#$01,(g_Flags+1).l
		bne.s	_c0036Take
		moveq	#0000000100,d0
		btst	#$02,(g_Flags+1).l
		bne.s	_c0036Take
		move.l	#0000000400,d0
		btst	#$03,(g_Flags+1).l
		beq.s	_c0036Rts

_c0036Take:
		sub.w	d0,(g_AdditionalFlags+$1C).l
		bsr.w	RemoveGold

_c0036Rts:
		rts
; ---------------------------------------------------------------------------

; Church donation: bump the 3-bit donation counter in g_Flags+$13
; bits 5-7 (capped at 3).
CSA_0037:
		move.b	(g_Flags+$13).l,d0
		andi.b	#$E0,d0
		cmpi.b	#$60,d0
		bcc.s	_c0037Msg
		addi.b	#$20,d0
		andi.b	#$1F,(g_Flags+$13).l
		or.b	d0,(g_Flags+$13).l

_c0037Msg:
		move.w	#$0043,d0		  ; Cutscene 0x043: 0x0254B4
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0038:
		move.w	#$0042,d0		  ; Cutscene 0x042: 0x0254B2
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.s	_c0038Rts
		bset	#$02,(g_Flags+3).l

_c0038Rts:
		rts
; ---------------------------------------------------------------------------

CSA_0039:
		move.w	#$0044,d0		  ; Cutscene 0x044: 0x0254B6
		bsr.w	LoadCutsceneDialogue
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

CSA_003A:
		move.w	#$005B,d0		  ; Cutscene 0x05B: 0x0254E4
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_003B:
		move.w	#$0045,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_003C:
		move.w	#$0046,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Gumi sacrificial rites: on Yes, transform the player.
CSA_003D:
		move.w	#$0048,d0
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.s	_c003DRts
		bsr.s	_transformToPockets
		move.w	#$0049,d0
		bsr.w	LoadCutsceneDialogue

_c003DRts:
		rts

; Locks the player's actions and swaps their sprite for Pockets'
; (the rites' transformation).
_transformToPockets:
		bset	#$04,(g_Flags+3).l
		move.b	#$07,(g_LockPlayerActions).l
		move.w	#$8141,(Player_AnimCtrl).l
		move.b	#SPR_POCKETS,(Player_SpriteType).l
		move.b	#$01,(Player_AnimFlags).l
		lea	(Player_X).l,a1
		move.b	RotationAndSize(a1),d1
		bsr.w	SetSpriteRotationAnimFlags
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		rts

; ---------------------------------------------------------------------------

CSA_003E:
		move.w	#$004A,d0		  ; Cutscene 0x04A: 0x0254C2
		bsr.w	LoadCutsceneDialogue
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

CSA_003F:
		move.w	#$004B,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0040:
		move.w	#$004C,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0041:
		move.w	#$004D,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0042:
		move.w	#$0047,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; End of the rites: Friday lands, then three rounds of the spin-and-
; drain dance before the player's own sprite and palette come back.
CSA_0043:
		move.w	#$004E,d0
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_1,(g_FridayAnimation1).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l

_c0043Wait:
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#FRIDAY_PERCH,(g_FridayAnimation1).l
		bne.s	_c0043Wait
		move.w	#$004F,d0
		bsr.w	LoadCutsceneDialogue
		move.w	#$0003,d7

_c0043Outer:
		movem.w	d7,-(sp)
		bsr.w	_fridayCastSpell
		move.w	#$0025,d7

_c0043Spin:
		movem.w	d7,-(sp)
		lea	(Player_X).l,a0
		move.b	RotationAndSize(a0),d0
		addi.b	#$40,d0
		andi.b	#$C0,d0
		andi.b	#$3F,RotationAndSize(a0)
		or.b	d0,RotationAndSize(a0)
		ori.b	#$80,AnimCtrl(a0)
		movem.l	a5,-(sp)
		jsr	(j_SetPlayerIdlePose).l
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		movem.l	(sp)+,a5
		movem.w	(sp)+,d7
		dbf	d7,_c0043Spin
		bsr.s	_drainToNearDeath
		movem.w	(sp)+,d7
		dbf	d7,_c0043Outer
		move.w	#$8000,(Player_AnimCtrl).l
		move.b	#$00,(Player_AnimFlags).l
		bclr	#$04,(g_Flags+3).l
		andi.b	#$F8,(g_LockPlayerActions).l
		jsr	(j_LoadPlayerPalette).l
		jsr	(j_CopyBasePaletteToActivePalette).l
		lea	(Player_X).l,a1
		move.b	RotationAndSize(a1),d1
		bsr.w	SetSpriteRotationAnimFlags
		jsr	(j_LoadSprites).l
		move.w	#$0050,d0
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation2).l
		rts

; Costs the player all health above $FF (used by the rites and the
; dojo defeat), leaving them at near-death.
_drainToNearDeath:
		lea	(Player_X).l,a5
		cmpi.w	#$0100,CurrentHealth(a5)
		bcs.s	_dtndRts
		move.w	#$00FF,d0
		bsr.w	RemoveHealth
		bsr.w	MarkHUDForUpdate
		bsr.w	RefreshHUD

_dtndRts:
		rts

; ---------------------------------------------------------------------------

CSA_0044:
		move.w	#$0051,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0045:
		move.w	#$0052,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0046:
		move.w	#$0053,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0047:
		move.w	#$000C,AnimationIndex(a5)
		move.w	#$0004,AnimationFrame(a5)
		bset	#$07,RenderFlags(a5)
		movem.l	a5,-(sp)
		jsr	(j_LoadSprites).l
		move.w	#$0054,d0
		bsr.w	LoadCutsceneDialogue
		movem.l	(sp)+,a5
		clr.w	AnimationFrame(a5)
		bset	#$07,RenderFlags(a5)
		rts
; ---------------------------------------------------------------------------

CSA_0048:
		move.w	#$0004,AnimationFrame(a5)
		bset	#$07,RenderFlags(a5)
		rts
; ---------------------------------------------------------------------------

CSA_0049:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordHit
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CSA_004A:
		move.w	#$0004,AnimationIndex(a5)
		clr.w	AnimationFrame(a5)
		bset	#$07,RenderFlags(a5)
		jsr	(j_LoadSprites).l
		move.w	#$0055,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_004B:
		move.w	#$0056,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_004C:
		move.w	#$0057,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_004D:
		move.w	#$0058,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_004E:
		move.w	#$0059,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_004F:
		bset	#$01,(g_Flags+$12).l
		move.w	(g_CurrentRoom).l,d0
		jsr	(j_CheckForRoomTransition).l
		move.w	d0,(g_CurrentRoom).l
		jsr	(j_WarpToRoom).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_0050:
		bset	#$00,(g_Flags+1).l
		move.w	#$005A,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0051:
		bset	#$00,(g_Flags+1).l
		move.b	(Sprite3_RotationAndSize).l,d0
		andi.b	#$C0,d0
		or.b	d0,(g_Flags+1).l
		move.w	#$005C,d0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0052:
		move.b	(g_Flags+1).l,d1
		andi.b	#$C0,d1
		movem.w	d1,-(sp)
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d1,RotationAndSize(a5)
		bset	#$07,RenderFlags(a5)
		movea.l	a5,a1
		bsr.w	SetSpriteRotationAnimFlags
		movem.w	(sp)+,d1
		lea	(Player_X).l,a0
		bset	#$07,AnimCtrl(a0)
		andi.b	#$3F,RotationAndSize(a0)
		eori.b	#DIR_FLIP,d1
		or.b	d1,RotationAndSize(a0)
		jsr	(j_SetPlayerIdlePose).l
		jsr	(j_LoadSprites).l
		move.w	#$005D,d0		  ; Cutscene 0x05D: 0x0254E8
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; The Massan raft trip: on Yes, row away - warp to room $61's warp
; destination with the player posed rowing; on No just walk off.
CSA_0053:
		move.w	#$005E,d0		  ; Cutscene 0x05E: 0x0254EA
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0053No
		bsr.w	CSA_015A
		move.w	#$005F,d0		  ; Cutscene 0x05F: 0x0254EC
		bsr.w	LoadCutsceneDialogue
		bsr.w	_fridayCastSpell

_c0053Warp:
		move.w	#$0F14,(Player_X).l
		jsr	(j_FadeOutToDarkness).l
		clr.b	(g_FridayAnimation1).l
		clr.w	(gVDPSprFriday_Y).l
		move.w	#$0061,d0
		bsr.w	SetRoomNumber
		jsr	(j_LookupWarpDestination).l
		clr.b	d0
		jsr	(j_LoadRoom_0).l
		jsr	(j_InitRoomDisplay).l
		clr.b	(g_PlayerHurtTimer).l
		clr.b	(g_PlayerPendingHit).l
		bclr	#$06,(Player_InteractFlags).l
		bclr	#$00,(Player_InteractFlags).l
		bclr	#$05,(Player_Action).l
		bclr	#$05,(Player_PrevAction).l
		move.w	#$0044,(Player_AnimationIndex).l
		move.w	#$0008,(Player_AnimationFrame).l
		bset	#$07,(Player_RenderFlags).l
		jsr	(j_LoadSprites).l
		jsr	(j_FadeInFromDarkness).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

_c0053No:
		bset	#$01,(Player_CombatFlags).l
		move.b	#$1B,d0
		bra.w	PlaybackInput
; ---------------------------------------------------------------------------

CSA_0054:
		move.w	#$0060,d0		  ; Cutscene 0x060: 0x0254EE
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0055:
		bsr.w	CSA_015A

_c0055Wait:
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#FRIDAY_PERCH,(g_FridayAnimation1).l
		bne.s	_c0055Wait
		move.w	#$0061,d0		  ; Cutscene 0x061: 0x0254F0
		btst	#$07,(g_Flags+$12).l
		beq.s	_c0055Msg
		move.w	#$0062,d0		  ; Cutscene 0x062: 0x0254F2

_c0055Msg:
		bsr.w	LoadCutsceneDialogue
		bsr.w	_fridayCastSpell
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		lea	(Player_X).l,a0
		jsr	(j_SetPlayerIdlePose).l
		bset	#$07,(Player_RenderFlags).l
		rts
; ---------------------------------------------------------------------------

; Second half of the raft trip (same warp as CSA_0053).
CSA_0056:
		bra.w	_c0053Warp
; ---------------------------------------------------------------------------

; Knock the player about: hurt flash, random facing and a jump
; (the crypt's haunted rooms).
CSA_0057:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_c0057Jump
		move.b	#$11,(g_PlayerHurtTimer).l
		bset	#$05,(Player_Action).l
		bclr	#$05,(Player_PrevAction).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_NigelHit2
; ---------------------------------------------------------------------------
		clr.b	(g_PlayerPendingHit).l
		move.w	#$0100,d6
		jsr	(j_GenerateRandomNumber).l
		andi.b	#$C0,d7
		andi.b	#$3F,(Player_RotationAndSize).l
		or.b	d7,(Player_RotationAndSize).l

_c0057Jump:
		bset	#$05,(Player_Action).l
		rts
; ---------------------------------------------------------------------------

CSA_0058:
		jmp	(j_SetUpTextbox).l
; ---------------------------------------------------------------------------

CSA_0059:
		jsr	(j_SetUpTextDisplay).l
		bclr	#$01,(Player_CombatFlags).l
		rts
; ---------------------------------------------------------------------------

CSA_005A:
		move.w	#$0063,d0		  ; Cutscene 0x063: 0x0254F4
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_005B:
		move.w	#$0064,d0		  ; Cutscene 0x064: 0x0254F6
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_005C:
		move.w	#$0065,d0		  ; Cutscene 0x065: 0x0254F8
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_005D:
		move.w	#$0066,d0		  ; Cutscene 0x066: 0x0254FA
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_005E:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_FadeOut0
; ---------------------------------------------------------------------------
		move.w	#00180,d0
		jsr	(j_Sleep).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicPiano
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CSA_005F:
		move.w	#00180,d0
		jsr	(j_Sleep).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicPalace1
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CSA_0060:
		move.w	#$0067,d0		  ; Cutscene 0x067: 0x0254FC
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0061:
		move.w	#$0068,d0		  ; Cutscene 0x068: 0x0254FE
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0062:
		bsr.w	CSA_015A
		move.w	#$0069,d0		  ; Cutscene 0x069: 0x025500
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0062No
		move.b	#$1F,d0
		bsr.w	PlaybackInput
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

_c0062No:
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation2).l
		clr.w	(g_ControllerPlayback).l
		rts
; ---------------------------------------------------------------------------

; Friday revives the player: collapse animation, fade-out, her spell,
; then a full heal and a warp back.
CSA_0063:
		move.b	#$01,(g_PlayerAnimation).l

_c0063Collapse:
		bsr.w	_collapseStep
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		cmpi.b	#$1A,(g_PlayerAnimation).l
		bne.s	_c0063Collapse
		clr.b	(g_PlayerAnimation).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_FadeOut0
; ---------------------------------------------------------------------------
		move.w	#00180,d0
		jsr	(j_Sleep).l
		jsr	(j_InitFadeToBlackParams).l
		move.w	#$0001,d6
		bsr.w	_fadeSteps
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicFridayCutscene
; ---------------------------------------------------------------------------
		move.w	#00120,d0
		jsr	(j_Sleep).l
		move.w	#$006A,d0		  ; Cutscene 0x06A: 0x025502
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_2,(g_FridayAnimation1).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l
		bsr.w	_fridayWait
		move.w	#$006B,d0		  ; Cutscene 0x06B: 0x025504
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_3,(g_FridayAnimation1).l
		move.b	#FRIDAY_FLAP,(g_FridayAnimation2).l
		bsr.w	_fridayWait
		move.w	#$006C,d0		  ; Cutscene 0x06C: 0x025506
		bsr.w	LoadCutsceneDialogue
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_FadeOut0
; ---------------------------------------------------------------------------
		move.w	#$0004,d6
		bsr.w	_fadeSteps
		clr.b	(g_FridayAnimation1).l
		clr.w	(gVDPSprFriday_Y).l
		move.w	#$FFFF,d0
		lea	(Player_X).l,a5
		jsr	(j_AddHealth).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		move.w	#00120,d0
		jsr	(j_Sleep).l
		bset	#$00,(g_Flags+$14).l
		move.w	#$140E,(Player_X).l
		move.w	#$0808,(Player_SubX).l
		jsr	(j_WarpToRoomNoFade).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		clr.w	(g_ControllerPlayback).l
		rts

; d6+1 steps of palette darkening, 20 ticks apart.
_fadeSteps:
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		move.w	#$0039,d5
		jsr	(j_DarkenPalette).l
		move.w	#00020,d0
		jsr	(j_Sleep).l
		dbf	d6,_fadeSteps
		rts

; Advances the player's collapse animation (frames 4/8/$C/$10 at
; phase 2/$F/$14/$19 of g_PlayerAnimation).
_collapseStep:
		move.w	#$0048,(Player_AnimationIndex).l
		addq.b	#$01,(g_PlayerAnimation).l
		cmpi.b	#$02,(g_PlayerAnimation).l
		bne.s	_csFrame8
		move.w	#$0004,(Player_AnimationFrame).l
		ori.b	#$80,(Player_AnimCtrl).l
		rts
; ---------------------------------------------------------------------------

_csFrame8:
		cmpi.b	#$0F,(g_PlayerAnimation).l
		bne.s	_csFrame12
		move.w	#$0008,(Player_AnimationFrame).l
		ori.b	#$80,(Player_AnimCtrl).l
		rts
; ---------------------------------------------------------------------------

_csFrame12:
		cmpi.b	#$14,(g_PlayerAnimation).l
		bne.s	_csFrame16
		move.w	#$000C,(Player_AnimationFrame).l
		ori.b	#$80,(Player_AnimCtrl).l
		rts
; ---------------------------------------------------------------------------

_csFrame16:
		cmpi.b	#$19,(g_PlayerAnimation).l
		bne.s	_csRts
		move.w	#$0010,(Player_AnimationFrame).l
		ori.b	#$80,(Player_AnimCtrl).l

_csRts:
		rts

; ---------------------------------------------------------------------------

CSA_0064:
		move.w	#$006D,d0		  ; Cutscene 0x06D: 0x025508
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0065:
		move.w	#$006E,d0		  ; Cutscene 0x06E: 0x02550A
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Tibor opens: twelve roars, then the tile swap and a ground-height
; refresh under the player.
CSA_0066:
		move.w	#$000B,d7

_c0066Roar:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_EnemyNoise
; ---------------------------------------------------------------------------
		move.w	#00005,d0
		jsr	(j_Sleep).l
		dbf	d7,_c0066Roar
		move.b	#$08,d0
		jsr	(j_DoTileSwap).l
		moveq	#$FFFFFFFF,d0
		move.w	(Player_HeightmapOffset).l,d0
		movea.l	d0,a0
		move.w	(a0),(Player_GroundHeight).l
		rts
; ---------------------------------------------------------------------------

CSA_0067:
		move.w	#$001F,d0		  ; Cutscene 0x01F: 0x02546C
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0068:
		bsr.w	CSA_015A
		move.w	#$0026,d0		  ; Cutscene 0x026: 0x02547A
		bsr.w	LoadCutsceneDialogue
		clr.b	(g_FridayAnimation1).l
		jsr	(j_DisplayLithograph).l
		move.w	#$0027,d0		  ; Cutscene 0x027: 0x02547C
		bsr.w	LoadCutsceneDialogue
		bset	#$01,(g_Flags+4).l
		move.w	(g_CurrentRoom).l,d0
		jsr	(j_CheckForRoomTransition).l
		move.w	d0,(g_CurrentRoom).l
		jsr	(j_TransitionToNewRoom).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation1).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l
		jsr	(j_WaitUntilVBlank).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

; Two sword-clash flashes with sound.
CSA_0069:
		move.w	#$0071,d0		  ; Cutscene 0x071: 0x025510
		bsr.w	LoadCutsceneDialogue
		move.w	#$0002,d7

_c0069Clash:
		movem.w	d7,-(sp)
		move.w	#$0000,AnimationFrame(a5)
		bsr.s	_showClashFrame
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordHit
; ---------------------------------------------------------------------------
		move.w	#$0004,AnimationFrame(a5)
		bsr.s	_showClashFrame
		movem.w	(sp)+,d7
		dbf	d7,_c0069Clash
		move.w	#$0072,d0		  ; Cutscene 0x072: 0x025512
		bra.w	LoadCutsceneDialogue

_showClashFrame:
		movem.l	a5,-(sp)
		move.w	#$0008,AnimationIndex(a5)
		bset	#$07,RenderFlags(a5)
		jsr	(j_LoadSprites).l
		jsr	(j_EnableDMAQueueProcessing).l
		movem.l	(sp)+,a5
		move.w	#00010,d0
		jmp	(j_Sleep).l

; ---------------------------------------------------------------------------

; Mercator dungeon door: on Yes open it (heightmap trick); on No
; sprite 1 skips $18 bytes of its behaviour script.
CSA_006A:
		bset	#$04,(g_Flags+$14).l
		move.w	#$0073,d0		  ; Cutscene 0x073: 0x025514
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c006ANo
		move.w	(Player_HeightmapOffset).l,d0
		movem.w	d0,-(sp)
		move.w	#$F258,(Player_HeightmapOffset).l
		jsr	(j_CheckForDoorNW).l
		movem.w	(sp)+,d0
		move.w	d0,(Player_HeightmapOffset).l
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

_c006ANo:
		lea	(Sprite1_X).l,a5
		addi.l	#$00000018,BehaviourLUTPtr(a5)
		movea.l	BehaviourLUTPtr(a5),a0
		move.b	(a0),BehavCmd(a5)
		move.b	$00000001(a0),BehavParam(a5)
		rts
; ---------------------------------------------------------------------------

CSA_006B:
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		eori.b	#DIR_FLIP,d1
		bset	#$07,RenderFlags(a5)
		movea.l	a5,a1
		bsr.w	SetSpriteRotationAnimFlags
		jsr	(j_LoadSprites).l
		move.w	#$0074,d0		  ; Cutscene 0x074: 0x025516
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_006C:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Throw1
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CSA_006D:
		bset	#$00,(g_Flags+1).l
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		eori.b	#$40,d0
		andi.b	#$3F,(g_Flags+1).l
		or.b	d0,(g_Flags+1).l
		move.w	#$0075,d0		  ; Cutscene 0x075: 0x025518
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_006E:
		move.b	(g_Flags+1).l,d0
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d0,RotationAndSize(a5)
		rts
; ---------------------------------------------------------------------------

CSA_006F:
		bsr.w	CSA_015A
		move.w	#$006F,d0		  ; Cutscene 0x06F: 0x02550C
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0070:
		bset	#$05,InteractFlags(a5)
		move.w	#$0070,d0		  ; Cutscene 0x070: 0x02550E
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_0071:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicKayla
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CSA_0072:
		move.w	#$000C,AnimationIndex(a5)
		clr.w	AnimationFrame(a5)
		bset	#$07,RenderFlags(a5)
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		move.w	#$0028,d0		  ; Cutscene 0x028: 0x02547E
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_4,(g_FridayAnimation1).l
		move.b	#FRIDAY_FROZEN,(g_FridayAnimation2).l
		rts
; ---------------------------------------------------------------------------

CSA_0073:
		move.w	#$0029,d0		  ; Cutscene 0x029: 0x025480
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0074:
		move.w	#$002A,d0		  ; Cutscene 0x02A: 0x025482
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0075:
		move.w	#$002B,d0		  ; Cutscene 0x02B: 0x025484
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_5,(g_FridayAnimation1).l
		move.b	#FRIDAY_FLAP,(g_FridayAnimation2).l
		rts
; ---------------------------------------------------------------------------

; Consumes the Lithograph as Friday flies its route.
CSA_0076:
		move.b	#ITM_LITHOGRAPH,d0
		jsr	(j_CheckAndConsumeItem).l
		move.w	#$002C,d0		  ; Cutscene 0x02C: 0x025486
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_6,(g_FridayAnimation1).l
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation2).l
		rts
; ---------------------------------------------------------------------------

; Sprite 1 walks off through the start-of-cutscene behaviour.
CSA_0077:
		movem.l	a5,-(sp)
		lea	(Sprite1_X).l,a5
		move.w	#BHVS_WALK_START_CUTSCENE,BehaviourLUTIndex(a5)
		jsr	(j_LoadSpriteBehaviour).l
		movem.l	(sp)+,a5
		rts
; ---------------------------------------------------------------------------

CSA_0078:
		move.w	#$0076,d0		  ; Cutscene 0x076: 0x02551A
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		bne.w	_c0078Rts
		bclr	#$02,(g_Flags+$16).l

_c0078Rts:
		rts
; ---------------------------------------------------------------------------

CSA_0079:
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

CSA_007A:
		btst	#$00,(g_Flags+$15).l
		bne.s	_c007ARts
		bset	#$00,(g_Flags+1).l

_c007ARts:
		rts
; ---------------------------------------------------------------------------

CSA_007B:
		move.b	#$08,d0
		jsr	(j_DoTileSwap).l
		move.b	#$10,d0
		jsr	(j_DoTileSwap).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_PermanentSwitch
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

CSA_007C:
		btst	#$01,(g_Flags+$15).l
		bne.s	_c007CRts
		bset	#$00,(g_Flags+1).l

_c007CRts:
		rts
; ---------------------------------------------------------------------------

CSA_007D:
		btst	#$03,(g_Flags+$15).l
		bne.s	_c007DRts
		bset	#$00,(g_Flags+1).l

_c007DRts:
		rts
; ---------------------------------------------------------------------------

CSA_007E:
		btst	#$04,(g_Flags+$15).l
		bne.s	_c007ERts
		bset	#$01,(g_Flags+1).l

_c007ERts:
		rts
; ---------------------------------------------------------------------------

CSA_007F:
		btst	#$05,(g_Flags+$15).l
		bne.s	_c007FRts
		bset	#$01,(g_Flags+1).l

_c007FRts:
		rts
; ---------------------------------------------------------------------------

CSA_0080:
		btst	#$06,(g_Flags+$15).l
		bne.s	_c0080Rts
		bset	#$00,(g_Flags+1).l

_c0080Rts:
		rts
; ---------------------------------------------------------------------------

CSA_0081:
		move.w	#$0077,d0		  ; Cutscene 0x077: 0x02551C
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0081Rts
		bset	#$00,(g_Flags+1).l

_c0081Rts:
		rts
; ---------------------------------------------------------------------------

CSA_0082:
		move.w	#$0078,d0		  ; Cutscene 0x078: 0x02551E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0083:
		move.w	#$0079,d0		  ; Cutscene 0x079: 0x025520
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0083No
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

_c0083No:
		clr.w	(g_ControllerPlayback).l
		jsr	(j_HideSprite).l
		move.b	#$28,d0
		jmp	(j_DoTileSwap).l
; ---------------------------------------------------------------------------

CSA_0084:
		move.w	#$007A,d0		  ; Cutscene 0x07A: 0x025522
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0085:
		movem.l	a5,-(sp)
		lea	(Sprite1_X).l,a5
		jsr	(j_HideSprite).l
		lea	(Sprite2_X).l,a5
		jsr	(j_HideSprite).l
		movem.l	(sp)+,a5
		rts
; ---------------------------------------------------------------------------

CSA_0086:
		move.w	#$007B,d0		  ; Cutscene 0x07B: 0x025524
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0087:
		move.w	#$007C,d0		  ; Cutscene 0x07C: 0x025526
		bsr.w	LoadCutsceneDialogue
		movem.l	a5,-(sp)
		lea	(Sprite10_X).l,a5
		jsr	(j_HideSprite).l
	if	FIX_ARMLET_SKIP
		lea	(Sprite12_X).l,a5
		jsr	(j_HideSprite).l
	endif
		movem.l	(sp)+,a5
		move.b	#ITM_ARMLET,d0
		jmp	(j_CheckAndConsumeItem).l
; ---------------------------------------------------------------------------

CSA_0088:
		move.w	#$007D,d0		  ; Cutscene 0x07D: 0x025528
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0088No
		bset	#$05,(g_Flags+$16).l
		rts
; ---------------------------------------------------------------------------

_c0088No:
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

CSA_0089:
		move.w	#$007E,d0		  ; Cutscene 0x07E: 0x02552A
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0089No
		bset	#$06,(g_Flags+$16).l
		rts
; ---------------------------------------------------------------------------

_c0089No:
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

CSA_008A:
		move.w	#$007F,d0		  ; Cutscene 0x07F: 0x02552C
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c008ARts
		bset	#$07,(g_Flags+$16).l

_c008ARts:
		rts
; ---------------------------------------------------------------------------

; CSA_008B/8C/8D/8E: the Duke's sword-swing poses (anim $38 frames
; 0/4/8/$C); CSA_008C also lands a hit on the player from the front.
CSA_008B:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordSwing
; ---------------------------------------------------------------------------
		movem.l	a5,-(sp)
		clr.w	AnimationFrame(a5)
		bra.s	_showAnim38
; ---------------------------------------------------------------------------

CSA_008C:
		movem.l	a5,-(sp)
		move.w	#$0038,AnimationIndex(a5)
		move.w	#$0004,AnimationFrame(a5)
		bset	#$07,RenderFlags(a5)
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		move.b	#$40,(g_PlayerPendingHit).l
		clr.w	(Player_AttackStrength).l
		bsr.w	_drainToNearDeath
		movem.l	(sp)+,a5
		rts
; ---------------------------------------------------------------------------

CSA_008D:
		movem.l	a5,-(sp)
		move.w	#$0008,AnimationFrame(a5)
		bra.s	_showAnim38
; ---------------------------------------------------------------------------

CSA_008E:
		movem.l	a5,-(sp)
		move.w	#$000C,AnimationFrame(a5)

_showAnim38:
		move.w	#$0038,AnimationIndex(a5)
		bset	#$07,RenderFlags(a5)
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		movem.l	(sp)+,a5
		rts
; ---------------------------------------------------------------------------

; Stops the caller's behaviour (word 0) and hands the script bytes
; after this record to sprite 2, which continues in its place.
CSA_008F:
		clr.w	BehavParam(a5)
		movea.l	BehaviourLUTPtr(a5),a0
		addi.l	#$0000000F,BehaviourLUTPtr(a5)
		addq.l	#$02,a0
		lea	(Sprite2_X).l,a5
		move.l	a0,Sprite2_BehaviourLUTPtr-Sprite2_X(a5)
		move.b	(a0),BehavCmd(a5)
		move.b	$00000001(a0),BehavParam(a5)
		rts
; ---------------------------------------------------------------------------

CSA_0090:
		move.w	#$0080,d0		  ; Cutscene 0x080: 0x02552E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0091:
		move.w	#$0081,d0		  ; Cutscene 0x081: 0x025530
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0092:
		move.w	#$0082,d0		  ; Cutscene 0x082: 0x025532
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0093:
		move.w	#$0083,d0		  ; Cutscene 0x083: 0x025534
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0094:
		move.w	#$0084,d0		  ; Cutscene 0x084: 0x025536
		bsr.w	LoadCutsceneDialogue
		bsr.w	CSA_015A
		move.w	#$0085,d0		  ; Cutscene 0x085: 0x025538
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_0095:
		bclr	#$07,(Sprite9_InteractFlags).l
		bclr	#$07,(Sprite9_InitInteractFlags).l
		rts
; ---------------------------------------------------------------------------

; Sprite 9 takes over the caller's script 4 bytes ahead and is
; pacified (hostile/hurt/invisible flags cleared).
CSA_0096:
		movea.l	a5,a0
		lea	(Sprite9_X).l,a5
		movea.l	BehaviourLUTPtr(a0),a1
		addq.l	#$04,a1
		move.l	a1,BehaviourLUTPtr(a5)
		move.b	(a1),BehavCmd(a5)
		move.b	$00000001(a1),BehavParam(a5)
		bclr	#$07,InteractFlags(a5)
		bclr	#$07,InitInteractFlags(a5)
		bclr	#$01,InteractFlags(a5)
		bclr	#$06,InteractFlags(a5)
		rts

CSA_0097:
		bclr	#$07,(Sprite4_InteractFlags).l
		bclr	#$07,(Sprite4_InitInteractFlags).l
		rts

; ---------------------------------------------------------------------------

CSA_0098:
		move.w	#$0086,d0		  ; Cutscene 0x086: 0x02553A
		bsr.w	LoadCutsceneDialogue
		bsr.w	CSA_015A
		move.w	#$0087,d0		  ; Cutscene 0x087: 0x02553C
		bsr.w	LoadCutsceneDialogue
		move.w	#$0088,d0		  ; Cutscene 0x088: 0x02553E
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_0099:
		bsr.s	CSA_0097
		clr.w	(Sprite4_BehavParam).l
		rts
; ---------------------------------------------------------------------------

; Warp-pad exit to outside Mir's Tower (room $1DB warp destination).
CSA_009A:
		move.w	#$161C,(Player_X).l
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#$80,(Player_RotationAndSize).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_WarpPad
; ---------------------------------------------------------------------------
		jsr	(j_WarpPadFx).l
		move.w	#$01DB,d0		  ; Outside Mir's tower
		bsr.w	SetRoomNumber
		jsr	(j_LookupWarpDestination).l
		clr.b	d0
		jsr	(j_LoadRoom_0).l
		jsr	(j_InitRoomDisplay).l
		jsr	(j_FadeInFromDarkness).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_009B:
		move.w	#$0089,d0		  ; Cutscene 0x089: 0x025540
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c009BRts
		bset	#$00,(g_Flags+1).l

_c009BRts:
		rts
; ---------------------------------------------------------------------------

CSA_009C:
		move.w	#$008A,d0		  ; Cutscene 0x08A: 0x025542
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_009D:
		move.b	#$23,d0
		cmpi.b	#$1D,(Player_X).l
		beq.s	_c009DPlay
		move.b	#$24,d0

_c009DPlay:
		bra.w	PlaybackInput
; ---------------------------------------------------------------------------

CSA_009E:
		move.w	#$008B,d0		  ; Cutscene 0x08B: 0x025544
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_009F:
		move.w	#$008C,d0		  ; Cutscene 0x08C: 0x025546
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00A0:
		move.w	#$008D,d0		  ; Cutscene 0x08D: 0x025548
		bsr.w	LoadCutsceneDialogue
		bsr.s	_swordFlashTwice
		move.w	#$008E,d0		  ; Cutscene 0x08E: 0x02554A
		bra.w	LoadCutsceneDialogue

; Two sword-swing flashes (anim index $10) with sound.
_swordFlashTwice:
		move.w	#$0001,d7

_sfLoop:
		movem.w	d7,-(sp)
		move.w	#$0000,AnimationFrame(a5)
		bsr.s	_showSwingFrame
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordSwing
; ---------------------------------------------------------------------------
		move.w	#$0004,AnimationFrame(a5)
		bsr.s	_showSwingFrame
		movem.w	(sp)+,d7
		dbf	d7,_sfLoop
		rts

_showSwingFrame:
		movem.l	a5,-(sp)
		move.w	#$0010,AnimationIndex(a5)
		bset	#$07,RenderFlags(a5)
		jsr	(j_LoadSprites).l
		jsr	(j_EnableDMAQueueProcessing).l
		movem.l	(sp)+,a5
		move.w	#$0008,d0
		jmp	(j_Sleep).l

; ---------------------------------------------------------------------------

CSA_00A1:
		move.w	#$008F,d0		  ; Cutscene 0x08F: 0x02554C
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00A2:
		move.w	#$0090,d0		  ; Cutscene 0x090: 0x02554E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Consumes the Red and Purple Jewels (Kazalt gate).
CSA_00A3:
		move.b	#ITM_REDJEWEL,d0
		jsr	(j_CheckAndConsumeItem).l
		move.b	#ITM_PURPLEJEWEL,d0
		jsr	(j_CheckAndConsumeItem).l
		move.w	#$0091,d0		  ; Cutscene 0x091: 0x025550
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00A4:
		move.w	#$0092,d0		  ; Cutscene 0x092: 0x025552
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00A5:
		bset	#$02,(g_Flags+$13).l
		move.w	#$0093,d0		  ; Cutscene 0x093: 0x025554
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00A6:
		move.w	#$0094,d0		  ; Cutscene 0x094: 0x025556
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00A7:
		move.w	#$0095,d0		  ; Cutscene 0x095: 0x025558
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00A8:
		move.w	#$0096,d0		  ; Cutscene 0x096: 0x02555A
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00A9:
		move.w	#$0097,d0		  ; Cutscene 0x097: 0x02555C
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00AA:
		move.w	#$0098,d0		  ; Cutscene 0x098: 0x02555E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00AB:
		move.w	(Player_HeightmapOffset).l,d0
		movem.w	d0,-(sp)
		move.w	#$E3B4,(Player_HeightmapOffset).l
		jsr	(j_CheckForDoorNW).l
		movem.w	(sp)+,d0
		move.w	d0,(Player_HeightmapOffset).l
		rts
; ---------------------------------------------------------------------------

CSA_00AC:
		move.w	#$0098,d0		  ; Cutscene 0x098: 0x02555E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00AD:
		move.w	#$0099,d0		  ; Cutscene 0x099: 0x025560
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00AE:
		move.w	#$009A,d0		  ; Cutscene 0x09A: 0x025562
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00AF:
		move.w	#$009B,d0		  ; Cutscene 0x09B: 0x025564
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00B0:
		move.w	(Player_HeightmapOffset).l,d0
		movem.w	d0,-(sp)
		move.w	#$DCA8,(Player_HeightmapOffset).l
		jsr	(j_CheckForDoorNW).l
		movem.w	(sp)+,d0
		move.w	d0,(Player_HeightmapOffset).l
		rts
; ---------------------------------------------------------------------------

CSA_00B1:
		move.w	#$009C,d0		  ; Cutscene 0x09C: 0x025566
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Zak flies off with his rider: the raw $92-$9E offsets are the NEXT
; sprite's Z/hitbox fields ($80+Z etc.), moved in step with Zak's
; own. Runs the {step id, tick count} list in ZakLaraCutsceneFlyCmds
; through the little jump table below ($FF terminates).
CSA_00B2:
		move.w	#$009D,d0		  ; Cutscene 0x09D: 0x025568
		bsr.w	LoadCutsceneDialogue
		addi.w	#$0A00,HitBoxXStart(a5)
		addi.w	#$0A00,HitBoxXEnd(a5)
		addi.w	#$0A00,HitBoxYStart(a5)
		addi.w	#$0A00,HitBoxYEnd(a5)
		addi.w	#$0A00,$00000098(a5)
		addi.w	#$0A00,$0000009A(a5)
		addi.w	#$0A00,$0000009C(a5)
		addi.w	#$0A00,$0000009E(a5)
		lea	ZakLaraCutsceneFlyCmds(pc),a0

_c00B2Cmd:
		move.b	$00000001(a0),d7
		bmi.s	_c00B2Done
		ext.w	d7

_c00B2Step:
		move.b	(a0),d0
		add.b	d0,d0
		ext.w	d0
		jsr	j_CSA_00B2_ZakOnlyFlyUp(pc,d0.w)
		bsr.w	ZakFlapWings
		movem.l	d7-a0/a5,-(sp)
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		movem.l	(sp)+,d7-a0/a5
		dbf	d7,_c00B2Step
		addq.l	#$02,a0
		bra.s	_c00B2Cmd
; ---------------------------------------------------------------------------

_c00B2Done:
		move.w	#$009E,d0		  ; Cutscene 0x09E: 0x02556A
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------
ZakLaraCutsceneFlyCmds:dc.b $00,$1F
		dc.b $01,$0F
		dc.b $02,$07
		dc.b $03,$2F
		dc.b $08,$2F
		dc.b $07,$17
		dc.b $09,$09
		dc.b $0A,$1F
		dc.b $FF,$FF

j_CSA_00B2_ZakOnlyFlyUp:
		bra.s	CSA_00B2_ZakOnlyFlyUp

; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_ZakOnlyMoveNW
; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_MoveUp
; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_MoveSW
; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_MoveNE
; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_MoveSE
; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_MoveNW
; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_FlyUpSE
; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_FlyS
; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_FlyUpSE_Spd2
; ---------------------------------------------------------------------------
		bra.s	CSA_00B2_FlyUpSE_Spd3

CSA_00B2_MoveUp:
		addq.w	#$01,$00000092(a5)
		addq.w	#$01,$000000D4(a5)

CSA_00B2_ZakOnlyFlyUp:
		addq.w	#$01,Z(a5)
		addq.w	#$01,HitBoxZEnd(a5)
		rts

; ---------------------------------------------------------------------------

CSA_00B2_ZakOnlyMoveNW:
		subq.w	#$01,CentreX(a5)
		rts

CSA_00B2_MoveSW:
		addq.w	#$01,CentreY(a5)
		addq.w	#$01,$00000096(a5)
		rts

; ---------------------------------------------------------------------------

CSA_00B2_MoveNE:
		subq.w	#$01,CentreY(a5)
		subq.w	#$01,$00000096(a5)
		rts

CSA_00B2_MoveSE:
		addq.w	#$01,CentreX(a5)
		addq.w	#$01,$00000094(a5)
		rts

; ---------------------------------------------------------------------------

CSA_00B2_MoveNW:
		subq.w	#$01,CentreX(a5)
		subq.w	#$01,$00000094(a5)
		rts

CSA_00B2_FlyUpSE:
		bsr.s	CSA_00B2_MoveUp
		bsr.s	CSA_00B2_MoveUp
		bsr.s	CSA_00B2_MoveSE
		bsr.s	CSA_00B2_MoveSE
		bsr.s	CSA_00B2_MoveSE
		bsr.w	ZakFlapWings
		rts

; ---------------------------------------------------------------------------

CSA_00B2_FlyS:
		bsr.s	CSA_00B2_MoveSW
		bsr.s	CSA_00B2_MoveSE
		bsr.w	ZakFlapWings
		rts

CSA_00B2_FlyUpSE_Spd2:
		bsr.s	CSA_00B2_FlyUpSE
		bsr.s	CSA_00B2_MoveUp
		bsr.s	CSA_00B2_MoveSE
		bsr.s	CSA_00B2_MoveSE
		bsr.w	ZakFlapWings
		bsr.w	ZakFlapWings
		bsr.w	ZakFlapWings
		rts

; ---------------------------------------------------------------------------

CSA_00B2_FlyUpSE_Spd3:
		bsr.s	CSA_00B2_FlyUpSE_Spd2
		bsr.s	CSA_00B2_MoveUp
		bsr.s	CSA_00B2_MoveSE
		bsr.s	CSA_00B2_MoveSE
		bsr.w	ZakFlapWings
		bsr.w	ZakFlapWings
		bsr.w	ZakFlapWings
		rts

_zakFlapAnim18:
		move.w	#$0018,AnimationIndex(a5)
		bra.s	_flapCommon

; One tick of Zak's wing-flap: anim index $14 (or $18 via
; _zakFlapAnim18), stepping the frame every 4 ticks with a wing beat.
ZakFlapWings:

		move.w	#$0014,AnimationIndex(a5)

_flapCommon:
		addq.b	#$01,AnimPhase(a5)
		move.b	AnimPhase(a5),d0
		andi.b	#$03,d0
		bne.s	_flapRts
		addq.b	#$04,AnimationFrame1(a5)
		andi.b	#$0C,AnimationFrame1(a5)
		bset	#$07,RenderFlags(a5)
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Slash1
; ---------------------------------------------------------------------------

_flapRts:
		rts
; ---------------------------------------------------------------------------

CSA_00B3:
		move.w	#$009E,d0		  ; Cutscene 0x09E: 0x02556A
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Sword-swing pose pair: frame 0, clang, then frame 4 by falling
; through into _showAnim8Frame.
CSA_00B4:
		move.w	#$0000,AnimationFrame(a5)
		bsr.s	_showAnim8Frame
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordSwing

; ---------------------------------------------------------------------------
		move.w	#$0004,AnimationFrame(a5)

_showAnim8Frame:
		movem.l	a5,-(sp)
		move.w	#$0008,AnimationIndex(a5)
		bset	#$07,RenderFlags(a5)
		jsr	(j_LoadSprites).l
		jsr	(j_EnableDMAQueueProcessing).l
		movem.l	(sp)+,a5
		move.w	#$0004,d0
		jmp	(j_Sleep).l

; ---------------------------------------------------------------------------

CSA_00B5:
		bset	#$06,(g_AdditionalFlags).l
		move.w	#$00A0,d0		  ; Cutscene 0x0A0: 0x02556E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00B6:
		move.w	#$00A1,d0		  ; Cutscene 0x0A1: 0x025570
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00B7:
		move.w	#$00A2,d0		  ; Cutscene 0x0A2: 0x025572
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00B8:
		move.w	#$00A3,d0		  ; Cutscene 0x0A3: 0x025574
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00B9:
		move.w	#$00A4,d0		  ; Cutscene 0x0A4: 0x025576
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00BA:
		move.w	#$00AC,d0		  ; Cutscene 0x0AC: 0x025586
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00BB:
		move.w	#$00AD,d0		  ; Cutscene 0x0AD: 0x025588
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00BC:
		rts
; ---------------------------------------------------------------------------

CSA_00BD:
		move.w	#$00AE,d0		  ; Cutscene 0x0AE: 0x02558A
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00BE:
		move.w	#$00AF,d0		  ; Cutscene 0x0AF: 0x02558C
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00BF:
		move.w	#$00B0,d0		  ; Cutscene 0x0B0: 0x02558E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00C0:
		move.w	#$00B1,d0		  ; Cutscene 0x0B1: 0x025590
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00C1:
		move.w	#$00B2,d0		  ; Cutscene 0x0B2: 0x025592
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; The injured dog: face it, and on Yes feed it an EkeEke (consumed,
; dog hidden); on No Friday just lands.
CSA_00C2:
		move.b	#$C0,d0
		cmpi.b	#$30,(Player_X).l
		beq.s	_c00C2Turn
		move.b	#$40,d0

_c00C2Turn:
		lea	(Player_X).l,a0
		andi.b	#$3F,RotationAndSize(a0)
		or.b	d0,RotationAndSize(a0)
		ori.b	#$80,AnimCtrl(a0)
		movem.l	a5,-(sp)
		jsr	(j_SetPlayerIdlePose).l
		jsr	(j_LoadSprites).l
		jsr	(j_EnableDMAQueueProcessing).l
		movem.l	(sp)+,a5
		bsr.w	CSA_015A
		move.w	#$00A5,d0		  ; Cutscene 0x0A5: 0x025578
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c00C2No
		bsr.w	_fridayCastSpell
		move.b	#ITM_EKEEKE,d0
		jsr	(j_CheckAndConsumeItem).l
		jsr	(j_UpdateEkeEkeHUD).l
		bset	#$00,(g_AdditionalFlags+4).l
		jsr	(j_HideSprite).l
		rts
; ---------------------------------------------------------------------------

_c00C2No:
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_00C3:
		move.w	#$00A6,d0		  ; Cutscene 0x0A6: 0x02557A
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00C4:
		move.w	#$00A7,d0		  ; Cutscene 0x0A7: 0x02557C
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_00C5:
		move.w	#$00A8,d0		  ; Cutscene 0x0A8: 0x02557E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00C6:
		move.w	#$00A9,d0		  ; Cutscene 0x0A9: 0x025580
		bsr.w	LoadCutsceneDialogue
		bsr.w	CSA_015A
		move.w	#$00AA,d0		  ; Cutscene 0x0AA: 0x025582
		bsr.w	LoadCutsceneDialogue
		lea	(Player_X).l,a0
		andi.b	#$3F,RotationAndSize(a0)
		ori.b	#DIR_SW,RotationAndSize(a0)
		ori.b	#$80,AnimCtrl(a0)
		movem.l	a5,-(sp)
		jsr	(j_SetPlayerIdlePose).l
		jsr	(j_LoadSprites).l
		jsr	(j_EnableDMAQueueProcessing).l
		movem.l	(sp)+,a5
		move.w	#$00AB,d0		  ; Cutscene 0x0AB: 0x025584
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		bset	#$04,(g_AdditionalFlags+4).l
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

CSA_00C7:
		rts
; ---------------------------------------------------------------------------

; Massan elder sends Friday home: on Yes she flies routes 7 and 8
; before rejoining.
CSA_00C8:
		bsr.w	CSA_015A
		move.w	#$00B3,d0		  ; Cutscene 0x0B3: 0x025594
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c00C8Done
		move.b	#FRIDAY_HOVER,(g_FridayAnimation2).l
		move.w	#$00B4,d0		  ; Cutscene 0x0B4: 0x025596
		bsr.w	LoadCutsceneDialogue
		move.w	#00060,d0
		jsr	(j_Sleep).l
		move.b	#FRIDAY_FROZEN2,(g_FridayAnimation2).l

_c00C8Wait:
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#FRIDAY_FROZEN2,(g_FridayAnimation1).l
		bne.s	_c00C8Wait
		move.w	#$00B5,d0		  ; Cutscene 0x0B5: 0x025598
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_7,(g_FridayAnimation1).l
		move.b	#FRIDAY_FLAP,(g_FridayAnimation2).l
		bsr.w	_fridayWait
		move.w	#$00B6,d0		  ; Cutscene 0x0B6: 0x02559A
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_8,(g_FridayAnimation1).l
		move.b	#FRIDAY_FLAP,(g_FridayAnimation2).l
		bsr.w	_fridayWait
		bset	#$06,(g_AdditionalFlags+4).l

_c00C8Done:
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_00C9:
		move.w	#$00B8,d0		  ; Cutscene 0x0B8: 0x02559E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00CA:
		move.w	#$00B9,d0		  ; Cutscene 0x0B9: 0x0255A0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00CB:
		move.w	#$00BA,d0		  ; Cutscene 0x0BA: 0x0255A2
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00CC:
		btst	#$07,(g_Flags+$15).l
		bne.s	_c00CCRts
		bset	#$00,(g_Flags+1).l

_c00CCRts:
		rts
; ---------------------------------------------------------------------------

CSA_00CD:
		bset	#$07,(Sprite3_JumpRate).l
		rts
; ---------------------------------------------------------------------------

CSA_00CE:
		move.w	#$00BB,d0		  ; Cutscene 0x0BB: 0x0255A4
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Sun Stone placed: warp to the lit lighthouse top, consuming it.
CSA_00CF:
		move.w	#$00BC,d0		  ; Cutscene 0x0BC: 0x0255A6
		bsr.w	LoadCutsceneDialogue
		bset	#$01,(g_AdditionalFlags+6).l
		move.w	#ROOM_RYUMA_LIGHTHOUSE_TOP,(g_CurrentRoom).l	  ; Lighthouse
		bsr.s	SpecialWarp
		bset	#$00,(g_Flags+1).l
		move.b	#ITM_SUNSTONE,d0
		jsr	(j_CheckAndConsumeItem).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts

; Mir-style warp: fade to white, load the current room's warp
; destination, fade back in.
SpecialWarp:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MirWarp
; ---------------------------------------------------------------------------
		jsr	(j_FadeToWhite).l
		jsr	(j_LookupWarpDestination).l
		clr.b	d0
		jsr	(j_LoadRoom_0).l
		jsr	(j_InitRoomDisplay).l
		jmp	(j_FadeFromWhite).l

; ---------------------------------------------------------------------------

CSA_00D0:
		move.w	#$00BD,d0		  ; Cutscene 0x0BD: 0x0255A8
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00D1:
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		beq.s	_c00D1Front
		move.w	#$00C1,d0
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c00D1Rts
		bset	#$04,(g_AdditionalFlags+$B).l

_c00D1Rts:
		rts
; ---------------------------------------------------------------------------

_c00D1Front:
		move.w	#$00C2,d0		  ; Cutscene 0x0C2: 0x0255B2
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Set sail for Verla: island-map voyage 0, then aboard the ship.
CSA_00D2:
		move.w	#$00BE,d0		  ; Cutscene 0x0BE: 0x0255AA
		bsr.w	LoadCutsceneDialogue
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicFanfare2
; ---------------------------------------------------------------------------
		moveq	#$00000000,d0
		jsr	(j_DisplayIslandMap).l
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#$80,(Player_RotationAndSize).l
		bset	#$04,(g_AdditionalFlags+8).l
		move.w	#ROOM_SHIP_TO_VERLA,(g_CurrentRoom).l	  ; Ship
		move.w	#$2724,(Player_X).l
		bsr.s	_warpReloadAll
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts

; Warp forcing every cached asset (blocksets, tileset, palette) to
; reload.
_warpReloadAll:
		move.b	#$FF,(g_PriBlockset).l
		move.b	#$FF,(g_SecBlockset).l
		move.b	#$FF,(g_CurrentTileset).l
		move.b	#$FF,(g_CurPalIdx).l
		jmp	(j_WarpToRoomNoFade).l

; ---------------------------------------------------------------------------

; Arrival: island-map voyage 1, then the docked ship.
CSA_00D3:
		moveq	#$00000001,d0
		jsr	(j_DisplayIslandMap).l
		move.w	#ROOM_VERLA_DOCKED_SHIP,(g_CurrentRoom).l	  ; Ship at dock
		move.w	#$262F,(Player_X).l
		bsr.s	_warpReloadAll
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_00D4:
		move.w	#$00C3,d0		  ; Cutscene 0x0C3: 0x0255B4
		bsr.w	LoadCutsceneDialogue
		move.w	(Player_HeightmapOffset).l,d0
		movem.w	d0,-(sp)
		move.w	#$E69C,(Player_HeightmapOffset).l
		jsr	(j_CheckForDoorNW).l
		movem.w	(sp)+,d0
		move.w	d0,(Player_HeightmapOffset).l
		rts
; ---------------------------------------------------------------------------

CSA_00D5:
		move.w	#$00BF,d0		  ; Cutscene 0x0BF: 0x0255AC
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00D6:
		move.w	#$00C0,d0		  ; Cutscene 0x0C0: 0x0255AE
		bsr.w	LoadCutsceneDialogue
		move.w	#ROOM_VERLA_EMPTY_DOCK,(g_CurrentRoom).l	  ; Empty dock
		move.w	#$2D28,(Player_X).l
		jsr	(j_WarpToRoom).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_00D7:
		move.w	#$00C4,d0		  ; Cutscene 0x0C4: 0x0255B6
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00D8:
		move.w	#$00C5,d0		  ; Cutscene 0x0C5: 0x0255B8
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00D9:
		move.w	#$00C6,d0		  ; Cutscene 0x0C6: 0x0255BA
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00DA:
		move.w	#$00C8,d0		  ; Cutscene 0x0C8: 0x0255BE
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00DB:
		move.w	#$00C9,d0		  ; Cutscene 0x0C9: 0x0255C0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00DC:
		move.w	#$00CA,d0		  ; Cutscene 0x0CA: 0x0255C2
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------
; Unreachable leftover.
		rts
; ---------------------------------------------------------------------------

CSA_00DD:
		move.w	#$00CC,d0		  ; Cutscene 0x0CC: 0x0255C6
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00DE:
		move.w	#$009F,d0		  ; Cutscene 0x09F: 0x02556C
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00DF:
		move.w	#$00CD,d0		  ; Cutscene 0x0CD: 0x0255C8
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_2,(g_FridayAnimation1).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l
		bsr.w	_fridayWait
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		move.w	#$00CE,d0		  ; Cutscene 0x0CE: 0x0255CA
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00E0:
		move.w	#$00D4,d0		  ; Cutscene 0x0D4: 0x0255D6
		bsr.w	LoadCutsceneDialogue
		bsr.w	_swordFlashTwice
		move.w	#$00D5,d0		  ; Cutscene 0x0D5: 0x0255D8
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00E1:
		move.w	#$00CF,d0		  ; Cutscene 0x0CF: 0x0255CC
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00E2:
		move.w	#$00D0,d0		  ; Cutscene 0x0D0: 0x0255CE
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Enchants the sprite's tiles with the Magic Sword sparkle (both
; gfx copies) and its two palette colours, then makes it invincible
; and hurt-flagged (Mir's barrier).
CSA_00E3:
		movem.l	a5,-(sp)
		move.b	#$01,d0
		lea	($0000F180).l,a2
		jsr	(j_LoadMagicSwordEffect).l
		move.l	#$C03A0000,(VDP_CTRL_REG).l
		move.w	#$008C,d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal1Base+$1A).l
		move.w	d1,(g_Pal1Active+$1A).l
		move.w	#$002C,d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal1Base+$1C).l
		move.w	d1,(g_Pal1Active+$1C).l
		move.l	#$C05A0000,(VDP_CTRL_REG).l
		move.w	#$008C,(VDP_DATA_REG).l
		move.w	#$002C,(VDP_DATA_REG).l
		lea	($00009880).l,a2
		move.b	#$01,d0
		jsr	(j_LoadMagicSwordEffect).l
		movem.l	(sp)+,a5
		bset	#$00,$00000048(a5)
		bset	#$01,$0000000C(a5)
		rts
; ---------------------------------------------------------------------------

CSA_00E4:
		move.w	#$00D1,d0		  ; Cutscene 0x0D1: 0x0255D0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00E5:
		clr.b	(g_Flags+8).l
		clr.b	(g_Flags+9).l
		move.w	#$00D2,d0		  ; Cutscene 0x0D2: 0x0255D2
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00E6:
		btst	#$03,(g_Flags+7).l
		bne.s	_c00E6Rts
		bset	#$02,(g_Flags+1).l

_c00E6Rts:
		rts
; ---------------------------------------------------------------------------

CSA_00E7:
		move.w	#$0100,AttackStrength(a5)
		rts
; ---------------------------------------------------------------------------

CSA_00E8:
		addi.w	#$0040,HitBoxXStart(a5)
		addi.w	#$0040,HitBoxXEnd(a5)
		move.w	#$00D3,d0		  ; Cutscene 0x0D3: 0x0255D4
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00E9:
		bset	#$05,InteractFlags(a5)
		move.w	#$00D6,d0		  ; Cutscene 0x0D6: 0x0255DA
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00EA:
		move.w	#$FFFF,(Sprite2_X).l
		rts
; ---------------------------------------------------------------------------

CSA_00EB:
		bsr.w	CSA_015A
		move.w	#$00D7,d0		  ; Cutscene 0x0D7: 0x0255DC
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00EC:
		move.w	#$00D8,d0		  ; Cutscene 0x0D8: 0x0255DE
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00ED:
		move.w	#$00D9,d0		  ; Cutscene 0x0D9: 0x0255E0
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

; On the lighthouse doorstep (X $26-$27, Y $0E): playback sequence 3.
CSA_00EE:
		move.b	(Player_X).l,d0
		andi.b	#$FE,d0
		cmpi.b	#$26,d0
		bne.s	_c00EERts
		cmpi.b	#$0E,(Player_Y).l
		bne.s	_c00EERts
		move.b	#$03,d0
		bsr.w	PlaybackInput

_c00EERts:
		rts
; ---------------------------------------------------------------------------

CSA_00EF:
		bset	#$01,(g_AdditionalFlags+$A).l
		move.w	#$00E3,d0		  ; Cutscene 0x0E3: 0x0255F4
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00F0:
		jmp	(j_RunShopWelcome).l
; ---------------------------------------------------------------------------

; Shopkeeper reaction: caught walking off with goods runs the steal
; script, otherwise the farewell.
CSA_00F1:
		move.b	#$03,d0
		bsr.w	PlaybackInput
		move.b	(Player_Action+1).l,d0
		andi.b	#$C0,d0
		cmpi.b	#$C0,d0
		bne.s	_c00F1Farewell
		jmp	(j_RunShopSteal).l
; ---------------------------------------------------------------------------

_c00F1Farewell:
		jsr	(j_FlushDMACopyQueue).l
		jmp	(j_RunShopFarewell).l
; ---------------------------------------------------------------------------

CSA_00F2:
		move.w	#$00DA,d0		  ; Cutscene 0x0DA: 0x0255E2
		bsr.w	LoadCutsceneDialogue
		clr.w	AnimationFrame(a5)
		bsr.s	_showAnim28Frame
		move.w	#$0004,AnimationFrame(a5)

_showAnim28Frame:
		movem.l	a5,-(sp)
		move.w	#$0028,AnimationIndex(a5)
		bset	#$07,RenderFlags(a5)
		jsr	(j_LoadSprites).l
		jsr	(j_EnableDMAQueueProcessing).l
		movem.l	(sp)+,a5
		move.w	#$0006,d0
		jmp	(j_Sleep).l

; ---------------------------------------------------------------------------

; Mir surrenders: back to the room BGM, and sprite 5 takes over the
; script 4 bytes ahead, pacified and made talkable.
CSA_00F3:
		bsr.w	_restartBGM
		move.w	#$00DB,d0		  ; Cutscene 0x0DB: 0x0255E4
		bsr.w	LoadCutsceneDialogue
		movea.l	a5,a0
		lea	(Sprite5_X).l,a5
		movea.l	BehaviourLUTPtr(a0),a1
		addq.l	#$04,a1
		move.l	a1,BehaviourLUTPtr(a5)
		move.b	(a1),BehavCmd(a5)
		move.b	$00000001(a1),BehavParam(a5)
		bclr	#$07,InteractFlags(a5)
		bclr	#$07,InitInteractFlags(a5)
		bclr	#$01,InteractFlags(a5)
		bclr	#$06,InteractFlags(a5)
		bclr	#$06,CombatFlags(a5)
		bclr	#$00,InteractFlags(a5)
		move.b	#$01,AnimFlags(a5)
		bset	#$04,InteractFlags(a5)
		rts
; ---------------------------------------------------------------------------

CSA_00F4:
		bclr	#$07,(Sprite5_InteractFlags).l
		bclr	#$07,(Sprite5_InitInteractFlags).l
		rts
; ---------------------------------------------------------------------------

; Zak drops the player from Mir's Tower: sink $D0 units, cost 100
; whole HP, mark the fall (g_AdditionalFlags+$19 bit 0).
CSA_00F5:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Fall
; ---------------------------------------------------------------------------
		move.w	#$0033,d7

_c00F5Sink:
		subi.w	#$0004,Z(a5)
		subi.w	#$0004,HitBoxZEnd(a5)
		bsr.w	ZakFlapWings
		bsr.w	ZakFlapWings
		bsr.w	ZakFlapWings
		bsr.w	ZakFlapWings
		movem.l	d7-a0/a5,-(sp)
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		movem.l	(sp)+,d7-a0/a5
		dbf	d7,_c00F5Sink
		movem.l	a5,-(sp)
		move.w	#$6400,d0
		lea	(Player_X).l,a5
		bsr.w	RemoveHealth
		movem.l	(sp)+,a5
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#$80,(Player_RotationAndSize).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_EnemyNoise
; ---------------------------------------------------------------------------
		bset	#$00,(g_AdditionalFlags+$19).l
		move.b	#$01,(g_PlayerAnimation).l
		rts
; ---------------------------------------------------------------------------

; Mir saves the player mid-fall: rise again, warp to the tower top,
; restore the health and hand back control.
CSA_00F6:
		bclr	#$00,(g_AdditionalFlags+$19).l
		move.w	#$00DC,d0		  ; Cutscene 0x0DC: 0x0255E6
		bsr.w	LoadCutsceneDialogue
		move.w	#$002F,d7

_c00F6Rise:
		addi.w	#$0002,Z(a5)
		addi.w	#$0002,HitBoxZEnd(a5)
		bsr.w	ZakFlapWings
		bsr.w	ZakFlapWings
		movem.l	d7-a0/a5,-(sp)
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		movem.l	(sp)+,d7-a0/a5
		dbf	d7,_c00F6Rise
		move.w	#ROOM_MIRS_TOWER_TOP,(g_CurrentRoom).l	  ; Mir's Room
		move.w	#ROOM_MIRS_TOWER_TOP,(g_OriginalRoom).l
		move.w	#$1718,(Player_X).l
		clr.w	(Player_SubX).l
		bsr.w	SpecialWarp
		clr.b	(g_PlayerHurtTimer).l
		clr.b	(g_PlayerAnimation).l
		move.w	#$00DD,d0		  ; Cutscene 0x0DD: 0x0255E8
		bsr.w	LoadCutsceneDialogue
		movem.l	a5,-(sp)
		move.w	#$6400,d0
		lea	(Player_X).l,a5
		bsr.w	AddHealth
		bsr.w	MarkHUDForUpdate
		bsr.w	RefreshHUD
		movem.l	(sp)+,a5
		lea	(Player_X).l,a1
		andi.b	#$3F,Player_RotationAndSize-Player_X(a1)
		clr.b	d1
		bsr.w	SetSpriteRotationAnimFlags
		bset	#$07,$00000048(a1)
		bclr	#$00,$0000000C(a1)
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		bsr.w	CSA_015A
		move.w	#$00DE,d0		  ; Cutscene 0x0DE: 0x0255EA
		bsr.w	LoadCutsceneDialogue
		clr.b	(g_FridayAnimation1).l
		clr.w	(gVDPSprFriday_Y).l
		clr.w	(g_ControllerPlayback).l
		bset	#$05,(g_AdditionalFlags+$A).l
		bra.w	CSA_009A
; ---------------------------------------------------------------------------
; Unreachable leftover.
		rts
; ---------------------------------------------------------------------------

CSA_00F7:
		move.w	#$0120,Z(a5)
		bset	#$06,CombatFlags(a5)
		rts

; One glide tick: two alt-flaps plus a redraw.
_zakFlyStep:
		bsr.w	_zakFlapAnim18
		bsr.w	_zakFlapAnim18
		movem.l	d7-a0/a5,-(sp)
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		movem.l	(sp)+,d7-a0/a5
		rts

; ---------------------------------------------------------------------------

; Zak swoops down to the parapet (CSA_00F9/CSA_00FE: further legs of
; the flight, moving hitbox/centre/Z per tick).
CSA_00F8:
		move.w	#$00DF,d0		  ; Cutscene 0x0DF: 0x0255EC
		bsr.w	LoadCutsceneDialogue
		move.w	#$002F,d7

_c00F8Fly:
		addi.w	#$0001,$0000001C(a5)
		addi.w	#$0001,$0000001E(a5)
		addi.w	#$0001,$00000016(a5)
		subi.w	#$0001,$00000012(a5)
		bsr.s	_zakFlyStep
		dbf	d7,_c00F8Fly
		rts
; ---------------------------------------------------------------------------

CSA_00F9:
		move.w	#$0005,d7

_c00F9Fly:
		addi.w	#$0008,$0000001C(a5)
		addi.w	#$0008,$0000001E(a5)
		addi.w	#$0008,$00000016(a5)
		addi.w	#$0001,$00000012(a5)
		bsr.s	_zakFlyStep
		dbf	d7,_c00F9Fly
		bsr.w	CSA_015A
		move.w	#$00E0,d0		  ; Cutscene 0x0E0: 0x0255EE
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		move.w	#$003F,d7

_c00F9Rise:
		addi.w	#$0002,$00000012(a5)
		bsr.w	_zakFlyStep
		dbf	d7,_c00F9Rise
		rts
; ---------------------------------------------------------------------------
; Unreachable leftover.
		rts
; ---------------------------------------------------------------------------

CSA_00FA:
		bset	#$00,(g_Flags+1).l
		move.w	#$00E1,d0		  ; Cutscene 0x0E1: 0x0255F0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_00FB:
		bclr	#$07,(Sprite4_InteractFlags).l
		bclr	#$07,(Sprite4_InitInteractFlags).l
		rts
; ---------------------------------------------------------------------------

CSA_00FC:
		bsr.w	_restartBGM
		bset	#$04,(Sprite4_InteractFlags).l
		move.w	#$00E2,d0		  ; Cutscene 0x0E2: 0x0255F2
		bsr.w	LoadCutsceneDialogue
		movea.l	a5,a0
		lea	(Sprite4_X).l,a5
		movea.l	BehaviourLUTPtr(a0),a1
		addq.l	#$04,a1
		move.l	a1,BehaviourLUTPtr(a5)
		move.b	(a1),BehavCmd(a5)
		move.b	Y(a1),BehavParam(a5)
		bclr	#$07,InteractFlags(a5)
		bclr	#$07,InitInteractFlags(a5)
		rts
; ---------------------------------------------------------------------------

CSA_00FD:
		bclr	#$04,(Sprite4_InteractFlags).l
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d1,RotationAndSize(a5)
		rts
; ---------------------------------------------------------------------------

CSA_00FE:
		move.w	#$003F,d7

_c00FEFly:
		subi.w	#$0002,HitBoxYStart(a5)
		subi.w	#$0002,HitBoxYEnd(a5)
		subi.w	#$0002,CentreY(a5)
		addi.w	#$0002,Z(a5)
		bsr.w	_zakFlyStep
		dbf	d7,_c00FEFly
		rts
; ---------------------------------------------------------------------------

CSA_00FF:
		move.w	#$00E5,d0		  ; Cutscene 0x0E5: 0x0255F8
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0100:
		move.w	#$00E6,d0		  ; Cutscene 0x0E6: 0x0255FA
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0101:
		move.w	#$00E7,d0		  ; Cutscene 0x0E7: 0x0255FC
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0102:
		move.w	#$00E8,d0		  ; Cutscene 0x0E8: 0x0255FE
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Nole warps out (visual effect) after his line.
CSA_0103:
		move.w	#$00E9,d0		  ; Cutscene 0x0E9: 0x025600
		bsr.w	LoadCutsceneDialogue
		moveq	#VFX_NOLE_WARP_OUT_2,d0
		jsr	(j_DoVisualEffect).l
		rts
; ---------------------------------------------------------------------------

CSA_0104:
		move.w	#$00EB,d0		  ; Cutscene 0x0EB: 0x025604
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0105:
		move.w	#$00EC,d0		  ; Cutscene 0x0EC: 0x025606
		bsr.w	LoadCutsceneDialogue
		bsr.w	CSA_015A
		move.w	#$00ED,d0		  ; Cutscene 0x0ED: 0x025608
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_9,(g_FridayAnimation1).l
		move.b	#FRIDAY_FLAP,(g_FridayAnimation2).l

_c0105Wait1:
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#FRIDAY_FLAP,(g_FridayAnimation1).l
		bne.s	_c0105Wait1
		move.w	#$00EE,d0		  ; Cutscene 0x0EE: 0x02560A
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_10,(g_FridayAnimation1).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l

_c0105Wait2:
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#FRIDAY_PERCH,(g_FridayAnimation1).l
		bne.s	_c0105Wait2
		move.w	#$00EF,d0		  ; Cutscene 0x0EF: 0x02560C
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Nole warps in (visual effect) before his line.
CSA_0106:
		moveq	#VFX_NOLE_WARP_IN_2,d0
		jsr	(j_DoVisualEffect).l
		move.w	#$00EA,d0		  ; Cutscene 0x0EA: 0x025602
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0107:
		move.w	#$00F0,d0		  ; Cutscene 0x0F0: 0x02560E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0108:
		move.w	#$00F1,d0		  ; Cutscene 0x0F1: 0x025610
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0109:
		move.w	#$00F2,d0		  ; Cutscene 0x0F2: 0x025612
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

; Pick the fortune-teller's line by story progress (flags).
CSA_010A:
		move.w	#$00FA,d0		  ; Cutscene 0x0FA: 0x025622
		btst	#$07,(g_AdditionalFlags+4).l
		bne.s	_c010AMsg
		move.w	#$00F9,d0
		btst	#$01,(g_Flags+4).l
		bne.s	_c010AMsg
		move.w	#$00F8,d0		  ; Cutscene 0x0F8: 0x02561E

_c010AMsg:
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_010B:
		move.w	#$00FB,d0		  ; Cutscene 0x0FB: 0x025624
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Pacifies every active sprite (and stops freshly-pacified ones).
CSA_010C:
		lea	(Sprite1_X).l,a0
		moveq	#$0000000E,d7

_c010CScan:
		tst.w	(a0)
		bmi.s	_c010CRts
		bclr	#$07,InteractFlags(a0)
		bclr	#$07,InitInteractFlags(a0)
		beq.s	_c010CNext
		clr.w	BehavParam(a0)

_c010CNext:
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,_c010CScan

_c010CRts:
		rts
; ---------------------------------------------------------------------------

; Intro screens: CSA_010D/010E/010F warp between the intro rooms
; with controls locked ($FE playback).
CSA_010D:
		move.w	#ROOM_INTRO_2,(g_CurrentRoom).l	  ; Intro screen 2
		move.w	#ROOM_INTRO_2,(g_OriginalRoom).l
		move.w	#$2014,(Player_X).l
		move.w	#$0808,(Player_SubX).l
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#$80,(Player_RotationAndSize).l
		jsr	(j_WarpToRoom).l
		move.w	#$00FE,(g_ControllerPlayback).l	; Lock controls
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_010E:
		move.w	#ROOM_INTRO_3,(g_CurrentRoom).l	  ; Intro Screen 3
		move.w	#ROOM_INTRO_3,(g_OriginalRoom).l
		move.w	#$2C2C,(Player_X).l
		move.w	#$0808,(Player_SubX).l
		ori.b	#$C0,(Player_RotationAndSize).l
		jsr	(j_WarpToRoom).l
		move.w	#$00FE,(g_ControllerPlayback).l	; Lock Controls
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_010F:
		move.w	#ROOM_INTRO_4,(g_CurrentRoom).l	  ; Intro Screen 4
		move.w	#ROOM_INTRO_4,(g_OriginalRoom).l
		move.w	#$2F1D,(Player_X).l
		move.w	#$0808,(Player_SubX).l
		ori.b	#$C0,(Player_RotationAndSize).l
		ori.b	#$40,(Player_InteractFlags).l
		jsr	(j_WarpToRoom).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicHarbour
; ---------------------------------------------------------------------------
		move.b	#$0E,(g_BGM).l
		move.w	#$00FE,(g_ControllerPlayback).l	; Lock Controls
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_0110:
		andi.b	#$BF,(Player_InteractFlags).l
		rts
; ---------------------------------------------------------------------------

; The opening narration over intro screen 1, ending with Friday
; crashing in (music + flight path 11) and the thieves' arrival.
CSA_0111:
		move.w	#$00FD,d0		  ; Cutscene 0x0FD: 0x025628
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$00FE,d0		  ; Cutscene 0x0FE: 0x02562A
		move.w	#00001,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$00FF,d0		  ; Cutscene 0x0FF: 0x02562C
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0100,d0		  ; Cutscene 0x100: 0x02562E
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jsr	(j_ClearTextbox).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicFridayAppear
; ---------------------------------------------------------------------------
		move.b	#FRIDAY_PATH_11,(g_FridayAnimation1).l
		move.b	#FRIDAY_FLAP,(g_FridayAnimation2).l

_c0111Wait:
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#FRIDAY_FLAP,(g_FridayAnimation1).l
		bne.s	_c0111Wait
		clr.b	(g_FridayAnimation1).l
		clr.w	(gVDPSprFriday_Y).l
		move.w	#$0101,d0		  ; Cutscene 0x101: 0x025630
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jsr	(j_ClearTextbox).l
		move.w	#00030,d0
		jsr	(j_Sleep).l
		bsr.w	CSA_015A
		move.w	#$0102,d0		  ; Cutscene 0x102: 0x025632
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0103,d0		  ; Cutscene 0x103: 0x025634
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jsr	(j_ClearTextbox).l
		bset	#$03,(g_Flags+1).l
		rts

; Runs cutscene script d0, then sleeps d1 ticks.
ShowCutsceneDialogueAndWait:
		movem.w	d1,-(sp)
		bsr.w	LoadCutsceneDialogue
		movem.w	(sp)+,d0
		jmp	(j_Sleep).l

; ---------------------------------------------------------------------------

; Friday tells her story; ends warping to intro screen 5 and
; consuming the Statue of Jypta.
CSA_0112:
		bsr.w	CSA_015A
		move.w	#$010E,d0		  ; Cutscene 0x10E: 0x02564A
		move.w	#00090,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$010F,d0		  ; Cutscene 0x10F: 0x02564C
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0110,d0		  ; Cutscene 0x110: 0x02564E
		move.w	#00120,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0111,d0		  ; Cutscene 0x111: 0x025650
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0112,d0		  ; Cutscene 0x112: 0x025652
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0113,d0		  ; Cutscene 0x113: 0x025654
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0114,d0		  ; Cutscene 0x114: 0x025656
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0115,d0		  ; Cutscene 0x115: 0x025658
		move.w	#00090,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0116,d0		  ; Cutscene 0x116: 0x02565A
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0117,d0		  ; Cutscene 0x117: 0x02565C
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0118,d0		  ; Cutscene 0x118: 0x02565E
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jsr	(j_ClearTextbox).l
		move.b	#FRIDAY_PATH_12,(g_FridayAnimation1).l
		move.b	#FRIDAY_FLAP,(g_FridayAnimation2).l

_c0112Wait:
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#FRIDAY_FLAP,(g_FridayAnimation1).l
		bne.s	_c0112Wait
		move.w	#ROOM_INTRO_5,(g_CurrentRoom).l	  ; Intro Screen 5
		move.w	#ROOM_INTRO_5,(g_OriginalRoom).l
		move.w	#$2119,(Player_X).l
		move.w	#$0808,(Player_SubX).l
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#$80,(Player_RotationAndSize).l
		jsr	(j_FadeOutToDarkness).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation1).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l
		jsr	(j_WarpToRoomNoFade).l
		move.w	#$00FE,(g_ControllerPlayback).l
		move.b	#ITM_STATUEOFJYPTA,d0
		jsr	(j_CheckAndConsumeItem).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

; Start the game proper: warp to the opening cave.
CSA_0113:
		move.w	#ROOM_CAVE_GAME_BEGIN,(g_CurrentRoom).l	  ; Game begin
		move.w	#$2026,(Player_X).l
		move.w	#$0808,(Player_SubX).l
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#$80,(Player_RotationAndSize).l
		bclr	#$03,(g_AdditionalFlags+7).l
		move.w	#$0090,(Player_Z).l
		jsr	(j_FadeOutToDarkness).l
		jsr	(j_LookupWarpDestination).l
		clr.b	d0
		jsr	(j_LoadRoom_0).l
		jsr	(j_StartGame).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_0114:
		move.w	#$0104,d0		  ; Cutscene 0x104: 0x025636
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0105,d0		  ; Cutscene 0x105: 0x025638
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0106,d0		  ; Cutscene 0x106: 0x02563A
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0107,d0		  ; Cutscene 0x107: 0x02563C
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0108,d0		  ; Cutscene 0x108: 0x02563E
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0109,d0		  ; Cutscene 0x109: 0x025640
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$010A,d0		  ; Cutscene 0x10A: 0x025642
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jmp	(j_ClearTextbox).l
; ---------------------------------------------------------------------------

CSA_0115:
		move.w	#$010B,d0		  ; Cutscene 0x10B: 0x025644
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		move.w	#$010C,d0		  ; Cutscene 0x10C: 0x025646
		move.w	#00120,d1
		bsr.w	ShowCutsceneDialogueAndWait
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicIntro
; ---------------------------------------------------------------------------
		jmp	(j_ClearTextbox).l
; ---------------------------------------------------------------------------

CSA_0116:
		move.w	#$010D,d0		  ; Cutscene 0x10D: 0x025648
		move.w	#00090,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jmp	(j_ClearTextbox).l
; ---------------------------------------------------------------------------

; CSA_0117-011B and CSA_011D-0122 queue intro strings 2-6 and 7-$C
; (CheckAndDisplayIntroString).
CSA_0117:
		move.b	#$02,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_0118:
		move.b	#$03,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_0119:
		move.b	#$04,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_011A:
		move.b	#$05,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_011B:
		move.b	#$06,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_011C:
		move.w	#$011A,d0		  ; Cutscene 0x11A: 0x025662
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$011B,d0		  ; Cutscene 0x11B: 0x025664
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$011C,d0		  ; Cutscene 0x11C: 0x025666
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$011D,d0		  ; Cutscene 0x11D: 0x025668
		move.w	#00120,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$011E,d0		  ; Cutscene 0x11E: 0x02566A
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$011F,d0		  ; Cutscene 0x11F: 0x02566C
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		clr.w	(g_ControllerPlayback).l
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		jmp	(j_ClearTextbox).l
; ---------------------------------------------------------------------------

CSA_011D:
		move.b	#$07,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_011E:
		move.b	#$08,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_011F:
		move.b	#$09,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_0120:
		move.b	#$0A,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_0121:
		move.b	#$0B,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_0122:
		move.b	#$0C,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

CSA_0123:
		move.w	#$0119,d0		  ; Cutscene 0x119: 0x025660
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jmp	(j_ClearTextbox).l
; ---------------------------------------------------------------------------

CSA_0124:
		move.w	#$00F3,d0		  ; Cutscene 0x0F3: 0x025614
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Mir's curse: transform the player into the dog (actions locked,
; healing disabled).
CSA_0125:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_DogTransform
; ---------------------------------------------------------------------------
		move.b	#$07,(g_LockPlayerActions).l
		bset	#STATUS_NOHEAL,(g_PlayerStatus).l
		move.w	#$814D,(Player_AnimCtrl).l
		move.b	#SPR_DOG,(Player_SpriteType).l
		move.b	#$01,(Player_AnimFlags).l
		lea	(Player_X).l,a1
		move.b	Player_RotationAndSize-Player_X(a1),d1
		bsr.w	SetSpriteRotationAnimFlags
		rts
; ---------------------------------------------------------------------------

CSA_0126:
		move.w	#$00F4,d0		  ; Cutscene 0x0F4: 0x025616
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0127:
		move.w	#$00F5,d0		  ; Cutscene 0x0F5: 0x025618
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0128:
		move.w	#$00F6,d0		  ; Cutscene 0x0F6: 0x02561A
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Lift the dog curse: restore sprite, palette and controls.
CSA_0129:
		move.w	#$8000,(Player_AnimCtrl).l
		move.b	#$00,(Player_AnimFlags).l
		bclr	#$04,(g_Flags+3).l
		andi.b	#$F8,(g_LockPlayerActions).l
		bclr	#STATUS_NOHEAL,(g_PlayerStatus).l
		jsr	(j_LoadPlayerPalette).l
		jsr	(j_CopyBasePaletteToActivePalette).l
		lea	(Player_X).l,a1
		move.b	Player_RotationAndSize-Player_X(a1),d1
		bsr.w	SetSpriteRotationAnimFlags
		jsr	(j_LoadSprites).l
		bsr.w	CSA_015A
		move.w	#$00F7,d0		  ; Cutscene 0x0F7: 0x02561C
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_012A:
		move.w	#$00FC,d0		  ; Cutscene 0x0FC: 0x025626
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_012B:
		bset	#$02,(g_AdditionalFlags+9).l
		move.w	#$0120,d0		  ; Cutscene 0x120: 0x02566E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_012C:
		move.w	#$0121,d0		  ; Cutscene 0x121: 0x025670
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_012D:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicFanfare2
; ---------------------------------------------------------------------------
		jmp	(j_RestoreBGM).l
; ---------------------------------------------------------------------------

; CSA_012E-0131: randomize the entity's RepeatCount - the casino
; chickens' race handicaps (10-14, 2-5, 1-3, 1-9 laps).
CSA_012E:
		move.w	#$0004,d6
		jsr	(j_GenerateRandomNumber).l
		addi.b	#$0A,d7
		move.b	d7,$00000066(a5)
		rts
; ---------------------------------------------------------------------------

CSA_012F:
		move.w	#$0003,d6
		jsr	(j_GenerateRandomNumber).l
		addi.b	#$02,d7
		move.b	d7,$00000066(a5)
		rts
; ---------------------------------------------------------------------------

CSA_0130:
		move.w	#$0002,d6
		jsr	(j_GenerateRandomNumber).l
		addi.b	#$01,d7
		move.b	d7,$00000066(a5)
		rts
; ---------------------------------------------------------------------------

CSA_0131:
		move.w	#$0008,d6
		jsr	(j_GenerateRandomNumber).l
		addi.b	#$01,d7
		move.b	d7,$00000066(a5)
		rts
; ---------------------------------------------------------------------------

CSA_0132:
		move.w	#$0122,d0		  ; Cutscene 0x122: 0x025672
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0132Rts
		bset	#$00,(g_Flags+1).l

_c0132Rts:
		rts
; ---------------------------------------------------------------------------

; Roulette result: the ball (sprite 2) resting on a multiple-of-4
; cell (X $0E/$12/$16, Y $10/$14/$18) is a win.
CSA_0133:
		bset	#$02,(g_Flags+1).l
		cmpi.b	#$0E,(Sprite2_X).l
		beq.s	_c0133ChkY
		cmpi.b	#$12,(Sprite2_X).l
		beq.s	_c0133ChkY
		cmpi.b	#$16,(Sprite2_X).l
		bne.s	_c0133Miss

_c0133ChkY:
		cmpi.b	#$10,(Sprite2_Y).l
		beq.s	_c0133Hit
		cmpi.b	#$14,(Sprite2_Y).l
		beq.s	_c0133Hit
		cmpi.b	#$18,(Sprite2_Y).l
		bne.s	_c0133Miss

_c0133Hit:
		move.w	#$0123,d0		  ; Cutscene 0x123: 0x025674
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

_c0133Miss:
		move.w	#$0124,d0		  ; Cutscene 0x124: 0x025676
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Chicken race result: g_Flags+1 bit 3 = the player's chicken won.
CSA_0134:
		btst	#$03,(g_Flags+1).l
		beq.s	_c0134Alt
		move.w	#$0129,d0		  ; Cutscene 0x129: 0x025680
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

_c0134Alt:
		move.w	#$0124,d0		  ; Cutscene 0x124: 0x025676
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0135:
		move.w	#$0128,d0		  ; Cutscene 0x128: 0x02567E
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0135Rts
		bset	#$00,(g_Flags+1).l

_c0135Rts:
		rts
; ---------------------------------------------------------------------------

; Chicken race: random speed (1/2/8 with 70%/28%/2% odds) and lap
; count for this chicken.
CSA_0136:
		move.w	#$0064,d6
		jsr	(j_GenerateRandomNumber).l
		move.b	#$08,d0
		cmpi.b	#$02,d7
		bcs.s	_c0136Store
		move.b	#$02,d0
		cmpi.b	#$1E,d7
		bcs.s	_c0136Store
		move.b	#$01,d0

_c0136Store:
		move.b	d0,$00000009(a5)
		move.w	#$0008,d6
		jsr	(j_GenerateRandomNumber).l
		addi.b	#$01,d7
		move.b	d7,$00000066(a5)
		rts
; ---------------------------------------------------------------------------

CSA_0137:
		move.w	#$012A,d0		  ; Cutscene 0x12A: 0x025682
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0137Rts
		bset	#$03,(g_AdditionalFlags+9).l

_c0137Rts:
		rts
; ---------------------------------------------------------------------------

CSA_0138:
		move.w	#$012B,d0		  ; Cutscene 0x12B: 0x025684
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0138Rts
		bset	#$04,(g_AdditionalFlags+9).l

_c0138Rts:
		rts
; ---------------------------------------------------------------------------

CSA_0139:
		move.w	#$012C,d0		  ; Cutscene 0x12C: 0x025686
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_013A:
		bsr.w	CSA_015A
		move.w	#$012F,d0
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_013B:
		move.b	#$10,FallRate(a5)
		rts
; ---------------------------------------------------------------------------

CSA_013C:
		bsr.w	CSA_015A
		move.w	#$012D,d0		  ; Cutscene 0x12D: 0x025688
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_013D:
		bsr.w	CSA_015A
		move.w	#$012E,d0		  ; Cutscene 0x12E: 0x02568A
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_013E:
		move.w	#$00C7,d0		  ; Cutscene 0x0C7: 0x0255BC
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_013F:
		move.w	#$0130,d0		  ; Cutscene 0x130: 0x02568E
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0140:
		move.w	#$0131,d0		  ; Cutscene 0x131: 0x025690
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0141:
		move.w	#$0132,d0		  ; Cutscene 0x132: 0x025692
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0142:
		move.w	#$0133,d0		  ; Cutscene 0x133: 0x025694
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0143:
		move.w	#$0134,d0		  ; Cutscene 0x134: 0x025696
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0144:
		bclr	#$07,(Sprite3_InteractFlags).l
		bclr	#$07,(Sprite3_InitInteractFlags).l
		bclr	#$04,(Sprite3_InteractFlags).l
		bclr	#$04,(Sprite3_InitInteractFlags).l
		rts
; ---------------------------------------------------------------------------

CSA_0145:
		bsr.w	_restartBGM
		move.w	#$0135,d0		  ; Cutscene 0x135: 0x025698
		bsr.w	LoadCutsceneDialogue
		lea	(Sprite3_X).l,a5
		jsr	(j_HideSprite).l
		rts
; ---------------------------------------------------------------------------

CSA_0146:
		bclr	#$07,(Sprite2_InteractFlags).l
		bclr	#$07,(Sprite2_InitInteractFlags).l
		bclr	#$04,(Sprite2_InteractFlags).l
		bclr	#$04,(Sprite2_InitInteractFlags).l
		rts
; ---------------------------------------------------------------------------

CSA_0147:
		move.w	#$0136,d0		  ; Cutscene 0x136: 0x02569A
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0148:
		bsr.w	_restartBGM
		move.w	#$0137,d0		  ; Cutscene 0x137: 0x02569C
		bsr.w	LoadCutsceneDialogue
		lea	(Sprite2_X).l,a5
		jsr	(j_HideSprite).l
		rts
; ---------------------------------------------------------------------------

CSA_0149:
		bsr.w	CSA_015A
		move.w	#$0138,d0		  ; Cutscene 0x138: 0x02569E
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_014A:
		bsr.w	CSA_015A
		btst	#$04,(g_AdditionalFlags+$18).l
		bne.s	_c014ARts
		move.w	#$0139,d0		  ; Cutscene 0x139: 0x0256A0
		bsr.w	LoadCutsceneDialogue

_c014ARts:
		rts
; ---------------------------------------------------------------------------

CSA_014B:
		move.w	#$013A,d0		  ; Cutscene 0x13A: 0x0256A2
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

CSA_014C:
		move.w	#$013F,d0		  ; Cutscene 0x13F: 0x0256AC
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; To the Nole boss arena (Mir-style warp).
CSA_014D:
		move.w	#ROOM_PALACE_BOSS_ARENA_NOLE,(g_CurrentRoom).l	  ; Boss Arena
		move.w	#$1E35,(Player_X).l
		move.w	#$0808,(Player_SubX).l
		bsr.w	SpecialWarp
		clr.w	(g_ControllerPlayback).l
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

; King Nole beaten: raise the treasure-room floor (bit 14 on three
; heightmap column strips), then his collapse frames.
CSA_014E:
		lea	((g_HeightMap+$13E2)).l,a0
		lea	((g_HeightMap+$1476)).l,a1
		lea	((g_HeightMap+$150A)).l,a2
		move.w	#$4000,d0
		or.w	d0,(a0)
		or.w	d0,(a1)
		or.w	d0,(a2)
		or.w	d0,$00000094(a0)
		or.w	d0,$00000094(a1)
		or.w	d0,$00000094(a2)
		or.w	d0,$00000128(a0)
		or.w	d0,$00000128(a1)
		or.w	d0,$00000128(a2)
		or.w	d0,$000001BC(a0)
		or.w	d0,$000001BC(a1)
		or.w	d0,$000001BC(a2)
		or.w	d0,$00000250(a0)
		or.w	d0,$00000250(a1)
		or.w	d0,$00000250(a2)
		or.w	d0,$000002E4(a0)
		or.w	d0,$000002E4(a1)
		or.w	d0,$000002E4(a2)
		or.w	d0,$00000378(a0)
		or.w	d0,$00000378(a1)
		or.w	d0,$00000378(a2)
		or.w	d0,$0000040C(a0)
		or.w	d0,$0000040C(a1)
		or.w	d0,$0000040C(a2)
		or.w	d0,$000004A0(a0)
		or.w	d0,$000004A0(a1)
		or.w	d0,$000004A0(a2)
		or.w	d0,$00000534(a0)
		or.w	d0,$00000534(a1)
		or.w	d0,$00000534(a2)
		or.w	d0,$000005C8(a0)
		or.w	d0,$000005C8(a1)
		or.w	d0,$000005C8(a2)
		or.w	d0,$0000065C(a0)
		or.w	d0,$0000065C(a1)
		or.w	d0,$0000065C(a2)
		or.w	d0,$000006F0(a0)
		or.w	d0,$000006F0(a1)
		or.w	d0,$000006F0(a2)
		or.w	d0,$00000784(a0)
		or.w	d0,$00000784(a1)
		or.w	d0,$00000784(a2)
		or.w	d0,$00000818(a0)
		or.w	d0,$00000818(a1)
		or.w	d0,$00000818(a2)
		or.w	d0,$000008AC(a0)
		or.w	d0,$000008AC(a1)
		or.w	d0,$000008AC(a2)
		or.w	d0,$00000940(a0)
		or.w	d0,$00000940(a1)
		or.w	d0,$00000940(a2)
		move.w	#$0140,d0		  ; Cutscene 0x140: 0x0256AE
		bsr.w	LoadCutsceneDialogue
		bclr	#$06,InteractFlags(a5)
		bclr	#$06,InitInteractFlags(a5)
		move.w	#$000C,AnimationIndex(a5)
		move.w	#$0014,AnimationFrame(a5)
		bset	#$07,RenderFlags(a5)
		movem.l	a5,-(sp)
		jsr	(j_LoadSprites).l
		movem.l	(sp)+,a5
		jsr	(j_EnableDMAQueueProcessing).l
		move.w	#$0005,d0
		jsr	(j_Sleep).l
		move.w	#$000C,AnimationIndex(a5)
		move.w	#$0010,AnimationFrame(a5)
		bset	#$07,RenderFlags(a5)
		movem.l	a5,-(sp)
		jsr	(j_LoadSprites).l
		movem.l	(sp)+,a5
		jsr	(j_EnableDMAQueueProcessing).l
		move.w	#$0005,d0
		jsr	(j_Sleep).l
		move.w	#$0004,AnimationIndex(a5)
		move.w	#$0000,AnimationFrame(a5)
		bset	#$07,RenderFlags(a5)
		rts
; ---------------------------------------------------------------------------

CSA_014F:
		bclr	#$07,(Sprite3_InteractFlags).l
		bclr	#$07,(Sprite3_InitInteractFlags).l
		rts
; ---------------------------------------------------------------------------

CSA_0150:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicFinalRoom
; ---------------------------------------------------------------------------
		move.w	#$0141,d0		  ; Cutscene 0x141: 0x0256B0
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

CSA_0151:
		move.w	#$0142,d0		  ; Cutscene 0x142: 0x0256B2
		bsr.w	LoadCutsceneDialogue
		move.w	#ROOM_PALACE_BOSS_ARENA_GOLA,(g_CurrentRoom).l	  ; Gola battle
		bsr.w	SpecialWarp
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

CSA_0152:
		bclr	#$07,(Sprite2_InteractFlags).l
		bclr	#$07,(Sprite2_InitInteractFlags).l
		rts
; ---------------------------------------------------------------------------

; Nole's treasure turns out to be Gola: sparkle-enchant sprite 3,
; ten red-flash/flicker rounds, then the final boss music.
CSA_0153:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Fireball1
; ---------------------------------------------------------------------------
		move.w	#$0008,AnimationIndex(a5)
		move.w	#$0004,AnimationFrame(a5)
		bset	#$07,RenderFlags(a5)
		movem.l	a5,-(sp)
		jsr	(j_LoadSprites).l
		movem.l	(sp)+,a5
		jsr	(j_FlushDMACopyQueue).l
		lea	($0000F180).l,a2
		move.b	#$01,d0
		jsr	(j_LoadMagicSwordEffect).l
		move.l	#$C05A0000,(VDP_CTRL_REG).l
		move.w	#$008C,d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal2Base+$1A).l
		move.w	d1,(g_Pal2Active+$1A).l
		move.w	#$002C,d1
		move.w	d1,(VDP_DATA_REG).l
		move.w	d1,(g_Pal2Base+$1C).l
		move.w	d1,(g_Pal2Active+$1C).l
		moveq	#$00000009,d7

_c0153Flash:
		movem.w	d7,-(sp)
		moveq	#VFX_RED_FLASH,d0
		jsr	(j_DoVisualEffect).l
		bsr.s	_mirFlicker
		jsr	(j_CopyBasePaletteToActivePalette).l
		bsr.s	_mirFlicker
		movem.w	(sp)+,d7
		dbf	d7,_c0153Flash
		move.w	#$0143,d0
		bsr.w	LoadCutsceneDialogue
		jsr	(j_UpdateEquipPal).l
		jsr	(j_CopyBasePaletteToActivePalette).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicFinalBoss
; ---------------------------------------------------------------------------
		lea	(Sprite3_X).l,a5
		jmp	(j_HideSprite).l

; Six frames of sprite 3 hurt-flicker.
_mirFlicker:
		moveq	#$00000005,d7

_mfLoop:
		bset	#$07,(Sprite3_RenderFlags).l
		bset	#$00,(Sprite3_RenderFlags).l
		bset	#$01,(Sprite3_InteractFlags).l
		movem.w	d7,-(sp)
		movem.l	a5,-(sp)
		jsr	(j_LoadSprites).l
		movem.l	(sp)+,a5
		jsr	(j_FlushDMACopyQueue).l
		movem.w	(sp)+,d7
		dbf	d7,_mfLoop
		rts

; ---------------------------------------------------------------------------

; Gola defeated: the ground shakes and King Nole's treasure rains
; down as gold coins, then the ending room, final scene with Friday,
; credits and EndGame.
CSA_0154:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Stop
; ---------------------------------------------------------------------------
		move.w	#00120,d0
		jsr	(j_Sleep).l
	if FIX_GOLA_BUG
		movem.l	a0,-(sp)
		bsr.w	_endingSequence
		movem.l	(sp)+,a0
	else
		bsr.w	_endingSequence
	endif
; ---------------------------------------------------------------------------
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MirWarp
; ---------------------------------------------------------------------------
		lea	(g_HUD_Row1).l,a1
		move.w	#$07FF,d7

_c0154Fill:
		move.w	#$E6B4,(a1)+
		dbf	d7,_c0154Fill
		jsr	(j_QueueFullHUDTilemapDMA).l
		move.w	#ROOM_PALACE_BOSS_ARENA_END,(g_CurrentRoom).l	  ; Gola defeated
		move.w	#$1C19,(Player_X).l
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#$80,(Player_RotationAndSize).l
		ori.b	#$80,AnimCtrl(a0)
		jsr	(j_SetPlayerIdlePose).l
		jsr	(j_LookupWarpDestination).l
		clr.b	d0
		jsr	(j_LoadRoom_0).l
		jsr	(j_InitRoomDisplay).l
		jsr	(j_FadeFromWhite).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicFinalCutscene
; ---------------------------------------------------------------------------
		bsr.w	CSA_015A
		bsr.w	_fridayWait
		move.b	#FRIDAY_PATH_14,(g_FridayAnimation1).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l
		bsr.w	_fridayWait
		move.w	#$0144,d0		  ; Cutscene 0x144: 0x0256B6
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0145,d0		  ; Cutscene 0x145: 0x0256B8
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jsr	(j_ClearTextbox).l
		move.b	#FRIDAY_PATH_15,(g_FridayAnimation1).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l
		bsr.w	_fridayWait
		move.w	#$0146,d0		  ; Cutscene 0x146: 0x0256BA
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0147,d0		  ; Cutscene 0x147: 0x0256BC
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0148,d0		  ; Cutscene 0x148: 0x0256BE
		move.w	#00120,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0149,d0		  ; Cutscene 0x149: 0x0256C0
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$014A,d0		  ; Cutscene 0x14A: 0x0256C2
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jsr	(j_ClearTextbox).l
		move.b	#FRIDAY_PATH_13,(g_FridayAnimation1).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l
		moveq	#$00000003,d7

_c0154Magic:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_FridayMagic
; ---------------------------------------------------------------------------
		move.w	#00052,d0
		jsr	(j_Sleep).l
		dbf	d7,_c0154Magic
		bsr.w	_fridayWait
		move.w	#$014B,d0		  ; Cutscene 0x14B: 0x0256C4
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$014C,d0		  ; Cutscene 0x14C: 0x0256C6
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$014D,d0		  ; Cutscene 0x14D: 0x0256C8
		move.w	#00120,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$014E,d0		  ; Cutscene 0x14E: 0x0256CA
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$014F,d0		  ; Cutscene 0x14F: 0x0256CC
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0150,d0		  ; Cutscene 0x150: 0x0256CE
		move.w	#00120,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0151,d0		  ; Cutscene 0x151: 0x0256D0
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_FadeOut0
; ---------------------------------------------------------------------------
		jsr	(j_FadeToBlack).l
		move.w	#00120,d0
		jsr	(j_Sleep).l
		clr.w	d0
		move.b	#$EF,d1
		jsr	(j_MaskVDPReg).l
		jsr	(j_PlayEndCredits).l
		jmp	(j_EndGame).l
; ---------------------------------------------------------------------------

CSA_0155:
		lea	(Sprite2_X).l,a5
		jmp	(j_HideSprite).l
; ---------------------------------------------------------------------------

CSA_0156:
		lea	(Sprite3_X).l,a5
		jmp	(j_HideSprite).l
; ---------------------------------------------------------------------------

; Chicken toss: respawn landed chickens (Z 0) at their start spots,
; counting each successful return (g_AdditionalFlags+$11).
CSA_0157:
		lea	(Sprite3_X).l,a1
		moveq	#$0000000D,d7

_c0157Scan:
		tst.b	(a1)
		bmi.s	_c0157Rts
		tst.w	$00000012(a1)
		bne.s	_c0157Next
		move.w	InitX(a1),X(a1)
		move.w	InitSubX(a1),SubX(a1)
		move.w	InitRotAndSize(a1),RotationAndSize(a1)
		move.w	InitZ(a1),Z(a1)
		movem.l	a1/a5,-(sp)
		jsr	(j_CalcSpriteHitbox).l
		jsr	(j_ValidateSpritePosition).l
		movem.l	(sp)+,a1/a5
		bcc.s	_c0157Count
		clr.w	Z(a1)
		bra.s	_c0157Next
; ---------------------------------------------------------------------------

_c0157Count:
		addq.b	#$01,(g_AdditionalFlags+$11).l

_c0157Next:
		lea	SPRITE_SIZE(a1),a1
		dbf	d7,_c0157Scan

_c0157Rts:
		rts
; ---------------------------------------------------------------------------

; Chicken toss payout: 5 gold per returned chicken, with a new-record
; line (best kept in g_AdditionalFlags+$1B).
CSA_0158:
		bset	#$02,(g_Flags+1).l
		clr.l	d0
		move.b	(g_AdditionalFlags+$11).l,d0
		movem.l	d0,-(sp)
		cmp.b	(g_AdditionalFlags+$1B).l,d0
		bls.s	_c0158Payout
		move.b	d0,(g_AdditionalFlags+$1B).l
		move.l	d0,(g_PrintNumericDwordValue).l
		move.w	#$0126,d0		  ; Cutscene 0x126: 0x02567A
		bsr.w	LoadCutsceneDialogue

_c0158Payout:
		movem.l	(sp)+,d1
		mulu.w	#$0005,d1
		move.l	d1,(g_PrintNumericDwordValue).l
		move.w	#$0127,d0		  ; Cutscene 0x127: 0x02567C
		tst.b	d1
		bne.s	_c0158Msg
		move.w	#$0124,d0

_c0158Msg:
		bsr.w	LoadCutsceneDialogue
		bsr.w	MarkHUDForUpdate
		bsr.w	RefreshHUD
		lea	(Sprite3_X).l,a1
		moveq	#$0000000D,d7

_c0158Scan:
		tst.b	(a1)
		bmi.s	_c0158Rts
		move.b	#$01,Speed(a1)
		bclr	#$05,InteractFlags(a1)
		lea	SPRITE_SIZE(a1),a1
		dbf	d7,_c0158Scan

_c0158Rts:
		rts
; ---------------------------------------------------------------------------

; Chicken toss: report the record and offer another round.
CSA_0159:
		clr.l	d0
		move.b	(g_AdditionalFlags+$1B).l,d0 ; Chicken toss room record
		move.l	d0,(g_PrintNumericDwordValue).l
		move.w	#$0125,d0		  ; Cutscene 0x125: 0x025678
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0159Rts
		bset	#$00,(g_Flags+1).l
		clr.b	(g_AdditionalFlags+$11).l

_c0159Rts:
		rts

; Scene opener: Friday flies up and perches.
CSA_015A:
		move.b	#FRIDAY_FLY_UP,(g_FridayAnimation1).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l
		rts

; Friday's spell pose, then wait for her flight path to finish
; (_fridayWait: until she perches or flaps in place).
_fridayCastSpell:
		move.b	#FRIDAY_SPELL,(g_FridayAnimation2).l

_fridayWait:
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#FRIDAY_PERCH,(g_FridayAnimation1).l
		beq.s	_fridayRts
		cmpi.b	#FRIDAY_FLAP,(g_FridayAnimation1).l
		bne.s	_fridayWait

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
; AnimationIndex/Frame, SpriteType and the Unk6E/AnimFlags word).
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
		move.w	Unk6E(a0),d0
		move.w	Unk6E(a1),Unk6E(a0)
		move.w	d0,Unk6E(a1)
		rts

; The player receives King Nole's treasure: quake, equip the Magic
; Sword look, then a shower of gold coins over the shaking screen
; until the last coin expires (_coinsEndCheck pops out of the loop).
_endingSequence:
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
; all are gone, pops the return address to exit _endingSequence.
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
