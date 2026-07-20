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

; Used by: behaviour scripts: Overworld/01 - Massan, Waterfall
; Shrine/426 Outside Waterfall Shrine [Raft].
CSA_0000:
		move.b	#$01,(g_PlayerAnimation).l
		rts

; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Overworld/01 - Massan, Waterfall
; Shrine/424 Outside Massan [Male Red Bear].
CSA_0001:
		move.w	#$0009,d0	  ; Cutscene $009: *: "The people of Gumi came and smashed the bri.." (+1)
		bra.s	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Waterfall Shrine/1F/180 Prospero's Room
; [Old Man].
CSA_0002:
		move.w	#$000A,d0	  ; Cutscene $00A: Prospero: "What a noisy boy!" (+1)
		bra.s	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Massan/592 Massan - Outside [Male Red
; Bear].
CSA_0003:
		move.w	#$000D,d0	  ; Cutscene $00D: Mayor: "Nigel! A terrible tragedy occurred soon aft.." (+2)
		bra.s	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Gumi/Gumi - Outside/601 Ver1 (Sacrifical
; Rites) [Male Yellow Bear].
CSA_0004:
		bsr.w	CSA_015A
		move.w	#$000E,d0	  ; Cutscene $00E: Friday: "Hey, Nigel! Look at the byroad! We can go u.."
		bsr.s	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Gumi/Gumi - Outside/601 Ver1 (Sacrifical
; Rites) [Male Yellow Bear].
CSA_0005:
		bsr.w	CSA_015A
		move.w	#$000F,d0	  ; Cutscene $00F: Friday: "Look! It's Fara! Let's go down from here!" (+1)
		bra.s	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Gumi/Gumi - Outside/601 Ver1 (Sacrifical
; Rites) [Male Yellow Bear].
CSA_0006:
		move.w	#$0010,d0	  ; Cutscene $010: *: "Thumpa-thumpa, yo! Sacrificial, beneficial,.." (+1)
		bra.s	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Warp to the current room's transition variant and abandon the
; script: the trailing movem pops unwind the four callers' saved
; registers and return straight to the game loop (a pattern shared
; by every room-warping action below).
; Used by: behaviour scripts: Gumi/Gumi - Outside/601 Ver1 (Sacrifical
; Rites) [Fara stake].
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

; Used by: dialogue: Prospero (Waterfall Shrine/1F/180 Prospero's Room).
CSA_0008:
		move.b	#FRIDAY_FLY_UP,(g_FridayAnimation1).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l
		move.w	#$000B,d0	  ; Cutscene $00B: Prospero: "Hmmm...you came here looking for the treasu.." (+9)
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_HOVER,(g_FridayAnimation2).l
		move.w	#$000C,d0	  ; Cutscene $00C: Prospero: "Wait, wait." (+3)
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation2).l
		rts
; ---------------------------------------------------------------------------

; Massan dance: swap sprite 1's appearance with sprite 7's, play the
; scene, then face the talker NE and finish.
; Used by: behaviour scripts: Swamp Shrine/4F/028 Orc King Room [Praying
; Yellow Bear].
CSA_0009:
		movem.l	a5,-(sp)
		move.b	#$00,d0
		move.b	#$06,d1
		bsr.w	SwapSpriteAppearance
		jsr	(j_LoadSprites).l
		jsr	(j_QueueScrollUpdates).l
		jsr	(j_EnableVRAMCopyQueueProcessing).l
		jsr	(j_EnableDMAQueueProcessing).l
		move.w	#$0012,d0	  ; Cutscene $012: *: "You! How did you get in here? Don't disturb.."
		bsr.w	LoadCutsceneDialogue
		movem.l	(sp)+,a5
		movea.l	a5,a0
		andi.b	#$3F,RotationAndSize(a0)
		bsr.w	ForceIdleFrame
		jsr	(j_LoadSprites).l
		move.w	#$0013,d0	  ; Cutscene $013: *: "Orc King! Orc King!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Swap the calling sprite's appearance with the sprite six slots on.
; Used by: behaviour scripts: Swamp Shrine/4F/028 Orc King Room [Praying
; Yellow Bear].
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

; Used by: behaviour scripts: Swamp Shrine/4F/028 Orc King Room [Orc
; King].
CSA_000B:
		move.w	#$0014,d0	  ; Cutscene $014: Orc King: "Grrrrr.... Gaorrrrrrrrrr GRAAWWRRRR!!!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Swamp Shrine/4F/028 Orc King Room [Fara
; stake].
CSA_000C:
		move.w	#$0015,d0	  ; Cutscene $015: Fara: "Oh, Nigel...sigh!... I just knew you'd come!" (+1)
		bsr.w	LoadCutsceneDialogue
		move.b	#$0C,d0
		move.b	#$0D,d1
		bsr.w	SwapSpriteAppearance
		jsr	(j_LoadSprites).l
		jsr	(j_QueueScrollUpdates).l
		jsr	(j_EnableVRAMCopyQueueProcessing).l
		jmp	(j_EnableDMAQueueProcessing).l
; ---------------------------------------------------------------------------

; Used by: dialogue: * (Gumi/Gumi - Outside/601 Ver1 (Sacrifical
; Rites)); * (Overworld/03 - Gumi, Ryuma, Mercator/449 Gumi 3
; (Landslide)).
CSA_000D:
		move.w	#$0016,d0	  ; Cutscene $016: *: "Nigel! Thanks to you, the people of Massan.." (+1)
		bsr.w	LoadCutsceneDialogue
		move.b	#$09,d0
		bsr.w	PlaybackInput
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Overworld/03 - Gumi, Ryuma, Mercator/449
; Gumi 3 (Landslide) [Female Yellow Bear].
CSA_000E:
		move.w	#$0017,d0	  ; Cutscene $017: *: "1-2-3!" (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Overworld/03 - Gumi, Ryuma, Mercator/449
; Gumi 3 (Landslide) [Female Yellow Bear].
CSA_000F:
		move.w	#$0018,d0	  ; Cutscene $018: *: "OK! You can use the road anytime, now!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Friday freed from the thieves: dance scene - sprite 1 spins through
; 40 quarter-turns.
; Used by: dialogue: * (Massan/592 Massan - Outside).
CSA_0010:
		move.w	#$0006,d0	  ; Cutscene $006: *: "Hi! Are you OK now? ...well... Where is you.."
		bsr.w	LoadCutsceneDialogue
		bsr.w	CSA_015A
		move.w	#$0007,d0	  ; Cutscene $007: Friday: "How dare you call me "mini-sized"!! You hai.."
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
		move.w	#$0008,d0	  ; Cutscene $008: *: "Oops! S-sorry! Touchy, isn't she?"
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation2).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: King Nole's Cave/1F/148 Outside [Invisible
; Cube].
CSA_0011:
		move.b	#FRIDAY_FLY_UP,(g_FridayAnimation1).l
		move.b	#FRIDAY_HOVER,(g_FridayAnimation2).l
		move.w	#$0000,d0	  ; Cutscene $000: Friday: "Now, let's start our adventure!!"
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation2).l
		bset	#$05,(g_Flags).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Overworld/01 - Massan, Waterfall
; Shrine/426 Outside Waterfall Shrine [Child Red Bear].
CSA_0012:
		move.w	#$0001,d0	  ; Cutscene $001: Fara: "Omigosh...a MAN!!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Overworld/01 - Massan, Waterfall
; Shrine/426 Outside Waterfall Shrine [Child Red Bear].
CSA_0013:
		move.w	#$0002,d0	  ; Cutscene $002: "I have to tell Grampa!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: dialogue: * (Ryuma/House 3/620 Ver1 (Man hiding from
; thieves)); * (Ryuma/Ryuma - Outside/610 Ver1 (Thieves)).
CSA_0014:
		move.b	#$09,d0
		bsr.w	PlaybackInput
		move.w	#$0019,d0	  ; Cutscene $019: *: "I heard them! I heard them!"
		bsr.w	LoadCutsceneDialogue
		bset	#$01,(Player_CombatFlags).l
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Ryuma/Ryuma - Outside/610 Ver1 (Thieves)
; [Man 1].
CSA_0015:
		move.w	#$001A,d0	  ; Cutscene $01A: *: "The mayor was killed by the thieves! What a.." (+1)
		bsr.w	LoadCutsceneDialogue
		bclr	#$01,(Player_CombatFlags).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Ryuma/183 Thieves' Hideout [Invisible
; Cube].
CSA_0016:
		bsr.w	CSA_015A
		move.w	#$001B,d0	  ; Cutscene $01B: Friday: "Are you going to the thieves' hideout?" (Y/N)
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

; Used by: behaviour scripts: Thieves' Hideout/1F/Entrance Room/185 Ver1
; (water) [Raft]; Thieves' Hideout/1F/Entrance Room/186 Ver2 (no water)
; [Raft].
CSA_0017:
		move.b	#$10,d0
		jsr	(j_DoTileSwap).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Thieves' Hideout/1F/Entrance Room/185 Ver1
; (water) [Invisible Cube]; Thieves' Hideout/1F/Entrance Room/186 Ver2
; (no water) [Invisible Cube].
CSA_0018:
		bsr.w	CSA_015A
		move.w	#$001C,d0	  ; Cutscene $01C: Friday: "Are you going back to town?" (Y/N)
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

; Used by: behaviour scripts: Ryuma/183 Thieves' Hideout [Raft].
CSA_0019:
		move.b	#$08,d0
		jmp	(j_DoTileSwap).l
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Ryuma/183 Thieves' Hideout [Raft].
CSA_001A:
		move.b	#$10,d0
		jmp	(j_DoTileSwap).l
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Thieves' Hideout/1F/Entrance Room/185 Ver1
; (water) [Raft]; Thieves' Hideout/1F/Entrance Room/186 Ver2 (no water)
; [Raft].
CSA_001B:
		move.b	#$08,d0
		jmp	(j_DoTileSwap).l
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Massan/593 Mayor's Hut [Nigel in Bed].
CSA_001C:
		move.w	#$0003,d0	  ; Cutscene $003: Nigel: ".... ....o... ...au.... ..."
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l
		move.w	#$0004,d0	  ; Cutscene $004: Friday: "He's still sleeping... He didn't seem to be.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Massan/593 Mayor's Hut [Male Red Bear].
CSA_001D:
		move.w	#$0005,d0	  ; Cutscene $005: Mayor: "Let him sleep for a while. You can stay in.." (+2)
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

; Used by: behaviour scripts: Thieves' Hideout/3F/Godess Statue Room/219
; Ver1 (water) [Godess Statue].
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

; Used by: behaviour scripts: Thieves' Hideout/4F/Treasure Room/224 Ver1
; (with prisoners) [Invisible Cube].
CSA_001F:
		bsr.w	CSA_015A
		move.w	#$001D,d0	  ; Cutscene $01D: Friday: "Hey, Nigel! You didn't get all the treasure.."
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		move.b	#$0D,d0
		bsr.w	PlaybackInput
		ori.b	#$C0,(Player_RotationAndSize).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Thieves' Hideout/4F/226 Cliff Top with
; Silver Knight [Knight 2].
CSA_0020:
		move.w	#$001E,d0	  ; Cutscene $01E: Boss: "Who goes there?!! Why, you puny...you'll ne.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: dialogue: Mayor (Ryuma/622 Mayor's House); Mayor (Thieves'
; Hideout/4F/Treasure Room/224 Ver1 (with prisoners)).
CSA_0021:
		move.w	#$0020,d0	  ; Cutscene $020: Mayor: "Nigel! We have been waiting for you! I real.." (+1)
		bsr.w	LoadCutsceneDialogue
		bset	#$00,(g_Flags+1).l
		movea.l	(g_TalkingSprite).l,a0
		move.b	RotationAndSize(a0),d0
		andi.b	#DIR_MASK,d0
		ori.b	#$01,d0
		move.b	d0,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Ryuma/622 Mayor's House [Yellow Old Man].
CSA_0022:
		move.w	#$0021,d0	  ; Cutscene $021: Mayor: "Please take this. I hope it will help you." (+1) [Safety Pass]
		bsr.w	LoadCutsceneDialogue
		bset	#$03,(g_Flags+4).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Ryuma/622 Mayor's House [Yellow Old Man].
CSA_0023:
		move.b	(g_Flags+1).l,d0
		andi.b	#$C0,d0
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d0,RotationAndSize(a5)
		bset	#$07,AnimCtrl(a5)
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Ryuma/183 Thieves' Hideout [Raft].
CSA_0024:
		move.w	#$0022,d0	  ; Cutscene $022: Kayla: "Hahahahahaha! There you are! Give me that l.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Ryuma/183 Thieves' Hideout [Raft].
CSA_0025:
		move.w	#$0023,d0	  ; Cutscene $023: Kayla: "Wally! Ink! Row to the shore!" (+2)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Ryuma/183 Thieves' Hideout [Raft].
CSA_0026:
		move.w	#$0024,d0	  ; Cutscene $024: Kayla: "What are you doing! Hurry up!" (+2)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Ryuma/183 Thieves' Hideout [Raft].
CSA_0027:
		move.w	#$0025,d0	  ; Cutscene $025: Kayla: "Noooooo! Now we're dead ducks!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Overworld/03 - Gumi, Ryuma, Mercator/454
; Mercator 1 (Gate) [Soldier].
CSA_0028:
		move.w	#$0036,d0	  ; Cutscene $036: *: "If ya ain't got a safe-conduct pass, ya ain.."
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

; Used by: dialogue: * (Mercator/Center/630 Ver1 (First Visit)).
CSA_0029:
		move.b	#$09,d0
		bsr.w	PlaybackInput
		bset	#$00,(g_Flags+5).l
		move.w	#$0032,d0	  ; Cutscene $032: *: "Mercator men tend to do some pretty stupid.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/Center/630 Ver1 (First Visit)
; [Man 2].
CSA_002A:
		move.w	#$0033,d0	  ; Cutscene $033: *: "Oh, Julie! Julie! If ya won't marry me, I'l.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/Center/630 Ver1 (First Visit)
; [Man 2].
CSA_002B:
		move.w	#$0034,d0	  ; Cutscene $034: *: "Owie!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Opens the door NW of a fixed heightmap cell by faking the player's
; position (Player_HeightmapOffset) around j_CheckForDoorNW; CSA_002D,
; CSA_00AB, CSA_00B0 and CSA_00D4 do the same for other doors.
; Used by: behaviour scripts: Mercator/Center/630 Ver1 (First Visit)
; [Man 2].
CSA_002C:
		move.w	(Player_HeightmapOffset).l,d0
		movem.w	d0,-(sp)
		move.w	#$E8DC,(Player_HeightmapOffset).l
		jsr	(j_CheckForDoorNW).l
		movem.w	(sp)+,d0
		move.w	d0,(Player_HeightmapOffset).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/East/633 Ver1 (First Visit)
; [Boy].
CSA_002D:
		move.w	(Player_HeightmapOffset).l,d0
		movem.w	d0,-(sp)
		move.w	#$EF58,(Player_HeightmapOffset).l
		jsr	(j_CheckForDoorNW).l
		movem.w	(sp)+,d0
		move.w	d0,(Player_HeightmapOffset).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/East/633 Ver1 (First Visit)
; [Boy].
CSA_002E:
		move.w	#$002D,d0	  ; Cutscene $02D: *: "I only pretended to be scared!" (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: dialogue: Purin (Mercator/East/633 Ver1 (First Visit)); Purin
; (Mercator/East/Interior/Madame Yard's/680 1F Entrance); Purin
; (Mercator/Harbour/Main Harbour/641 Ver1 (First Visit)); Purin
; (Mercator/Harbour/Public Dock/493 Ver1 (Empty Boat)).
CSA_002F:
		move.w	#$002E,d0	  ; Cutscene $02E: Purin: "Hello. I'm Purin. I'm twelve. Madame Yard i.." (+1)
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c002FNo
		bset	#$02,(g_Flags+5).l
		bsr.w	CSA_015A
		move.w	#$0030,d0	  ; Cutscene $030: Friday: "Hey, Nigel! What are you thinking of?!"
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
		move.w	#$0031,d0	  ; Cutscene $031: Nigel: "Wow-wee!"
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation2).l
		rts
; ---------------------------------------------------------------------------

_c002FNo:
		move.w	#$002F,d0	  ; Cutscene $02F: Purin: "Sigh!...oh, well....."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Fahl's dojo challenge accepted: save the player's health in
; TempHealth and fight at a locked $FF (near-death) with menu/attack/
; pick-up disabled.
; Used by: dialogue: Fahl (Mercator/Center/Interior/676 Fahl's Dojo).
CSA_0030:
		clr.b	(g_AdditionalFlags+$1A).l
		move.w	#$0037,d0	  ; Cutscene $037: Fahl: "I'm a master of martial arts! I can give yo.." (+1)
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
; Used by: behaviour scripts: Mercator/Center/Interior/676 Fahl's Dojo
; [Old Man]; behaviour(s) 333 (not room-placed).
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
; Used by: behaviour scripts: Mercator/Center/Interior/676 Fahl's Dojo
; [Invisible Cube]; also LoadPlayerSpecialAnimation (spritefuncs2) when
; the player collapses mid-challenge (health 0: only sprite 1 is reset,
; and the KO carries on to CSA_0033).
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
		move.w	#$0038,d0	  ; Cutscene $038: Fahl: "Well done! You're quite talented. Still, yo.." (+2) (Y/N)
		bra.s	_c0032Ask
; ---------------------------------------------------------------------------

_c0032Win10:
		move.w	#$0039,d0	  ; Cutscene $039: Fahl: "You may be stronger than the soldiers guard.." (+2) (Y/N)
		bra.s	_c0032Ask
; ---------------------------------------------------------------------------

_c0032Win20:
		move.w	#$003A,d0	  ; Cutscene $03A: Fahl: "Excellent!! You don't need anymore training!" (+1) (Y/N)
		bra.s	_c0032Ask
; ---------------------------------------------------------------------------

_c0032Win30:
		move.w	#$003B,d0	  ; Cutscene $03B: Fahl: "I give up! You're the strongest man I've ev.." (+1) (Y/N)
		bra.s	_c0032Ask
; ---------------------------------------------------------------------------

_c0032Win40:
		move.w	#$003C,d0	  ; Cutscene $03C: Fahl: "P.... please... I'm almost... worn out..." (+1) (Y/N)

_c0032Ask:
		cmpi.w	#$00FF,(Player_CurrentHealth).l
		bne.s	_c0032End
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0032End
		rts
; ---------------------------------------------------------------------------

_c0032Win50:
		move.w	#$003D,d0	  ; Cutscene $03D: Fahl: "OK, OK! You're the greatest swordsman in th.." (+2) [Pawn Ticket] [Pawn Ticket]
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

; Fahl's dojo defeat: the player was KO'd - restore the saved health
; and controls and admit the loss.
; Used by: LoadPlayerSpecialAnimation (spritefuncs2) when the player's
; collapse animation ends during Fahl's challenge.
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
		move.w	#$003E,d0	  ; Cutscene $03E: Fahl: "Ha, ha, ha! You need more experience!" (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: dialogue: Owner (Mercator/Center/Interior/672 Greenpea's).
CSA_0034:
		move.w	#$003F,d0	  ; Cutscene $03F: Owner: "Welcome to Greenpea's! Step right up! Have.." (+1)
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
; Used by: behaviour scripts: Mercator/Center/Interior/672 Greenpea's
; [Man 2].
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
		move.w	#$0040,d0	  ; Cutscene $040: Owner: "Congratulations! You got golds! Great! Exce.."
		bsr.w	LoadCutsceneDialogue
		bsr.w	MarkHUDForUpdate
		bra.w	RefreshHUD
; ---------------------------------------------------------------------------

; Casino roulette loss: take the same stake back.
; Used by: behaviour scripts: Mercator/Center/Interior/672 Greenpea's
; [Invisible Cube].
CSA_0036:
		move.w	#$0041,d0	  ; Cutscene $041: Owner: "Oops! Oh well...it was close! See you next.."
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
; Used by: behaviour scripts: Mercator/Center/Interior/709 Old Woman's
; House, 2F [Old Lady].
CSA_0037:
		move.b	(g_Flags+$13).l,d0
		andi.b	#$E0,d0
		cmpi.b	#$60,d0
		bcc.s	_c0037Msg
		addi.b	#$20,d0
		andi.b	#$1F,(g_Flags+$13).l
		or.b	d0,(g_Flags+$13).l

_c0037Msg:
		move.w	#$0043,d0	  ; Cutscene $043: *: "Thank you very much. Here's your reward..." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: dialogue: * (Mercator/Center/Interior/694 Old Woman's House,
; 1F); * (Mercator/Center/Interior/709 Old Woman's House, 2F).
CSA_0038:
		move.w	#$0042,d0	  ; Cutscene $042: *: "You look so powerful. If I promise to pay y.." (+1)
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.s	_c0038Rts
		bset	#$02,(g_Flags+3).l

_c0038Rts:
		rts
; ---------------------------------------------------------------------------

; Used by: dialogue: * (Mercator/Northeast/638 Northeast).
CSA_0039:
		move.w	#$0044,d0	  ; Cutscene $044: *: "My dad works in the castle. I sometimes com.." (+1)
		bsr.w	LoadCutsceneDialogue
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/3F/097 Nigel's Room [Woman
; 2].
CSA_003A:
		move.w	#$005B,d0	  ; Cutscene $05B: *: "I'll come and tell you when the party is re.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/Northeast/638 Northeast [Lord
; Arthur].
CSA_003B:
		move.w	#$0045,d0	  ; Cutscene $045: Arthur: "I'm going to Madame Yard's. Take care of th.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/Northeast/638 Northeast [Lord
; Arthur].
CSA_003C:
		move.w	#$0046,d0	  ; Cutscene $046: Arthur: "This is for you!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Gumi sacrificial rites: on Yes, transform the player.
; Used by: dialogue: Teller (Mercator/East/Interior/Fortune Teller/685
; Ver1).
CSA_003D:
		move.w	#$0048,d0	  ; Cutscene $048: Teller: "I can't cast a spell on you now. Go to the.."
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.s	_c003DRts
		bsr.s	_transformToPockets
		move.w	#$0049,d0	  ; Cutscene $049: Teller: "Voila! You can get into Madame Yard's, now!.." (+1)
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

; Used by: dialogue: Owner (Mercator/East/Interior/Madame Yard's/680 1F
; Entrance).
CSA_003E:
		move.w	#$004A,d0	  ; Cutscene $04A: Owner: "Good afternoon! First time here? Madame Yar.." (+3)
		bsr.w	LoadCutsceneDialogue
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/East/Interior/Madame Yard's/680
; 1F Entrance [Woman 3].
CSA_003F:
		move.w	#$004B,d0	  ; Cutscene $04B: Linda: "Hi, I'm Linda! First time here? OK, let's g.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/East/Interior/Madame Yard's/707
; 2F Hallway [Woman 3].
CSA_0040:
		move.w	#$004C,d0	  ; Cutscene $04C: Linda: "Come this way!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/East/Interior/Madame Yard's/707
; 2F Hallway [Woman 3].
CSA_0041:
		move.w	#$004D,d0	  ; Cutscene $04D: Linda: "Where are you going? No, no! That room is f.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/Northeast/638 Northeast [Girl].
CSA_0042:
		move.w	#$0047,d0	  ; Cutscene $047: *: "I've never seen such dishonesty in all my l.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; End of the rites: Friday lands, then three rounds of the spin-and-
; drain dance before the player's own sprite and palette come back.
; Used by: behaviour scripts: Mercator/East/Interior/Madame Yard's/708
; 2F Private Room 1 [Woman 3].
CSA_0043:
		move.w	#$004E,d0	  ; Cutscene $04E: Linda: "Are you ready? First, let me..."
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_1,(g_FridayAnimation1).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l

_c0043Wait:
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#FRIDAY_PERCH,(g_FridayAnimation1).l
		bne.s	_c0043Wait
		move.w	#$004F,d0	  ; Cutscene $04F: Friday: "Nigel!" (+1)
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
		move.w	#$0050,d0	  ; Cutscene $050: Linda: "What the?... Hey! Calm down, little..." (+9)
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

; Used by: behaviour scripts: Mercator/East/Interior/Madame Yard's/707
; 2F Hallway [Lord Arthur].
CSA_0044:
		move.w	#$0051,d0	  ; Cutscene $051: Arthur: "Alas! ...'tis a pity...!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/East/Interior/Madame Yard's/707
; 2F Hallway [Lord Arthur].
CSA_0045:
		move.w	#$0052,d0	  ; Cutscene $052: Arthur: "Sirrah! I would have a word with you! Come.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/East/Interior/Madame Yard's/710
; 2F Private Room 2 [Lord Arthur].
CSA_0046:
		move.w	#$0053,d0	  ; Cutscene $053: Arthur: "Fair Julie! Shut the door, please..." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/East/Interior/Madame Yard's/710
; 2F Private Room 2 [Lord Arthur].
CSA_0047:
		move.w	#$000C,AnimationIndex(a5)
		move.w	#$0004,AnimationFrame(a5)
		bset	#$07,RenderFlags(a5)
		movem.l	a5,-(sp)
		jsr	(j_LoadSprites).l
		move.w	#$0054,d0	  ; Cutscene $054: Arthur: "If anyone discovers I'm a member here, I sh.." (+1)
		bsr.w	LoadCutsceneDialogue
		movem.l	(sp)+,a5
		clr.w	AnimationFrame(a5)
		bset	#$07,RenderFlags(a5)
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/East/Interior/Madame Yard's/710
; 2F Private Room 2 [Lord Arthur].
CSA_0048:
		move.w	#$0004,AnimationFrame(a5)
		bset	#$07,RenderFlags(a5)
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/East/Interior/Madame Yard's/710
; 2F Private Room 2 [Lord Arthur].
CSA_0049:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordHit
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/East/Interior/Madame Yard's/710
; 2F Private Room 2 [Lord Arthur].
CSA_004A:
		move.w	#$0004,AnimationIndex(a5)
		clr.w	AnimationFrame(a5)
		bset	#$07,RenderFlags(a5)
		jsr	(j_LoadSprites).l
		move.w	#$0055,d0	  ; Cutscene $055: Julie: "No!" (+7)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/East/Interior/Madame Yard's/710
; 2F Private Room 2 [Lord Arthur].
CSA_004B:
		move.w	#$0056,d0	  ; Cutscene $056: Arthur: "What is thy name?" (+2)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/1F/Entrance Hall/055 Ver1
; (First Visit) [Old Man].
CSA_004C:
		move.w	#$0057,d0	  ; Cutscene $057: Butler: "Welcome, Mr. Nigel. I've heard stories of y.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/1F/Throne Room/051 Ver1
; (Duke) [Old Man].
CSA_004D:
		move.w	#$0058,d0	  ; Cutscene $058: Butler: "Please stay here. The duke will greet you m.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/1F/Throne Room/051 Ver1
; (Duke) [Duke].
CSA_004E:
		move.w	#$0059,d0	  ; Cutscene $059: Duke: "Deel Klesso ma hahm." (+8)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/1F/Throne Room/051 Ver1
; (Duke) [Duke].
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

; Used by: dialogue: * (Mercator Castle/1F/Throne Room/051 Ver1 (Duke));
; * (Mercator Castle/2F/085 Banquet Hall); * (Mercator Castle/3F/097
; Nigel's Room); * (Mercator Castle/3F/103 Dexter's Room).
CSA_0050:
		bset	#$00,(g_Flags+1).l
		move.w	#$005A,d0	  ; Cutscene $05A: *: "Your room is ready upstairs."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: dialogue of 5 NPCs.
CSA_0051:
		bset	#$00,(g_Flags+1).l
		move.b	(Sprite3_RotationAndSize).l,d0
		andi.b	#$C0,d0
		or.b	d0,(g_Flags+1).l
		move.w	#$005C,d0	  ; Cutscene $05C: Arthur: "Hail, Sir Nigel. This is the Training Room."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/2F/Training Room/083 Ver1
; (Banquet) [Lord Arthur].
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
		move.w	#$005D,d0	  ; Cutscene $05D: "Please don't tell a soul about Julie..."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; The Massan raft trip: on Yes, row away - warp to room $61's warp
; destination with the player posed rowing; on No just walk off.
; Used by: behaviour scripts: Mercator Castle/3F/Bathroom/101 Ver1
; (Kayla) [Kayla in Bath].
CSA_0053:
		move.w	#$005E,d0	  ; Cutscene $05E: Kayla: "Hahahahaha! Nice to meet you again! Hahahah.." (+1) (Y/N)
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0053No
		bsr.w	CSA_015A
		move.w	#$005F,d0	  ; Cutscene $05F: Friday: "Hey, Nigel! I can't understand you at all!.." (+1)
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

; Used by: behaviour scripts: Mercator Castle/3F/097 Nigel's Room [Woman
; 2].
CSA_0054:
		move.w	#$0060,d0	  ; Cutscene $060: *: "Mr. Nigel, would you please come to the ban.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/3F/097 Nigel's Room [Woman
; 2].
CSA_0055:
		bsr.w	CSA_015A

_c0055Wait:
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#FRIDAY_PERCH,(g_FridayAnimation1).l
		bne.s	_c0055Wait
		move.w	#$0061,d0	  ; Cutscene $061: Friday: "Sorry, Nigel... I got a little excited..."
		btst	#$07,(g_Flags+$12).l
		beq.s	_c0055Msg
		move.w	#$0062,d0	  ; Cutscene $062: Friday: "You were off your guard when you saw her nu.."

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
; Used by: behaviour scripts: Mercator Castle/3F/100 Entrance to Kayla's
; Bathroom [Invisible Cube].
CSA_0056:
		bra.w	_c0053Warp
; ---------------------------------------------------------------------------

; Knock the player about: hurt flash, random facing and a jump
; (the crypt's haunted rooms).
; Used by: behaviour scripts: Mercator Castle/3F/100 Entrance to Kayla's
; Bathroom [Ink, Wally].
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

; Used by: behaviour scripts: Mercator Castle/3F/Kayla's Room/098 Ver1
; (Ink & Wally) [Invisible Cube].
CSA_0058:
		jmp	(j_SetUpTextbox).l
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/3F/Kayla's Room/098 Ver1
; (Ink & Wally) [Invisible Cube].
CSA_0059:
		jsr	(j_SetUpTextDisplay).l
		bclr	#$01,(Player_CombatFlags).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/2F/085 Banquet Hall [Woman
; 1].
CSA_005A:
		move.w	#$0063,d0	  ; Cutscene $063: *: "Please come in." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/2F/085 Banquet Hall
; [Duke].
CSA_005B:
		move.w	#$0064,d0	  ; Cutscene $064: Duke: "As you know, an evil magician lives in the.." (+9)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/2F/085 Banquet Hall
; [Duke].
CSA_005C:
		move.w	#$0065,d0	  ; Cutscene $065: Duke: "That's all I have to say. Now, let's enjoy.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/2F/085 Banquet Hall [Man
; 1].
CSA_005D:
		move.w	#$0066,d0	  ; Cutscene $066: Ludwig: "Thank you. Tonight, I shall play for you my.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/2F/085 Banquet Hall [Man
; 1].
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

; Used by: behaviour scripts: Mercator Castle/2F/085 Banquet Hall [Man
; 1].
CSA_005F:
		move.w	#00180,d0
		jsr	(j_Sleep).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicPalace1
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/2F/085 Banquet Hall
; [Duke].
CSA_0060:
		move.w	#$0067,d0	  ; Cutscene $067: Duke: "Bravo! That was wonderful! Ludwig, may I ha.." (+4)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/2F/085 Banquet Hall
; [Duke].
CSA_0061:
		move.w	#$0068,d0	  ; Cutscene $068: Duke: "If you'll all excuse me, I suddenly feel....." (+3)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/3F/097 Nigel's Room
; [Invisible Cube].
CSA_0062:
		bsr.w	CSA_015A
		move.w	#$0069,d0	  ; Cutscene $069: Friday: "Nigel, are you going to bed for the night?" (Y/N)
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
; Used by: behaviour scripts: Mercator Castle/3F/097 Nigel's Room
; [Invisible Cube].
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
		move.w	#$006A,d0	  ; Cutscene $06A: Friday: "...Nigel...Nigel! Are you awake?" (+6)
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_2,(g_FridayAnimation1).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l
		bsr.w	_fridayWait
		move.w	#$006B,d0	  ; Cutscene $06B: Friday: "What will you do after you get the treasure.." (+1)
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_3,(g_FridayAnimation1).l
		move.b	#FRIDAY_FLAP,(g_FridayAnimation2).l
		bsr.w	_fridayWait
		move.w	#$006C,d0	  ; Cutscene $06C: Friday: "...Good night, Nigel!"
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

; Used by: behaviour scripts: Mercator Castle/1F/Entrance Hall/056 Ver2
; (Banquet) [Woman 2].
CSA_0064:
		move.w	#$006D,d0	  ; Cutscene $06D: *: "Excuse me, Mr. Nigel? I...it's about Prince.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/1F/Entrance Hall/056 Ver2
; (Banquet) [Soldier].
CSA_0065:
		move.w	#$006E,d0	  ; Cutscene $06E: *: "Hey, you! What are you doing!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Tibor opens: twelve roars, then the tile swap and a ground-height
; refresh under the player.
; Used by: behaviour scripts: Thieves' Hideout/2F/203 Knight Pit Trap
; [Gate S].
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

; Used by: behaviour scripts: Thieves' Hideout/4F/Treasure Room/224 Ver1
; (with prisoners) [Invisible Cube].
CSA_0067:
		move.w	#$001F,d0	  ; Cutscene $01F: Mayor: "I don't know who you are, but thanks! I'm a.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Thieves' Hideout/4F/Treasure Room/224 Ver1
; (with prisoners) [Yellow Old Man].
CSA_0068:
		bsr.w	CSA_015A
		move.w	#$0026,d0	  ; Cutscene $026: Friday: "Nigel! That's Gola, one of the destructive.."
		bsr.w	LoadCutsceneDialogue
		clr.b	(g_FridayAnimation1).l
		jsr	(j_DisplayLithograph).l
		move.w	#$0027,d0	  ; Cutscene $027: Friday: "Look! Five stones are inlaid on Gola's body.." (+9)
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
; Used by: behaviour scripts: Mercator/East/Interior/Monster Prison/681
; Ver1 (Monsters) [Dexter].
CSA_0069:
		move.w	#$0071,d0	  ; Cutscene $071: *: "Hey, skeleton! Yeah, you, Mr. Big Bad Skele.." (+1)
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
		move.w	#$0072,d0	  ; Cutscene $072: *: "Huh! You don't act so tough now, do ya? Ha.."
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
; Used by: dialogue: * (Mercator/Center/630 Ver1 (First Visit)).
CSA_006A:
		bset	#$04,(g_Flags+$14).l
		move.w	#$0073,d0	  ; Cutscene $073: *: "Would you invest golds in me?"
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

; Used by: behaviour scripts: Mercator/Center/631 Ver2 (Pre-Crypt) [Man
; 2].
CSA_006B:
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		eori.b	#DIR_FLIP,d1
		bset	#$07,RenderFlags(a5)
		movea.l	a5,a1
		bsr.w	SetSpriteRotationAnimFlags
		jsr	(j_LoadSprites).l
		move.w	#$0074,d0	  ; Cutscene $074: "golds! I always repay the kindness I receiv.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/Center/631 Ver2 (Pre-Crypt) [Man
; 2].
CSA_006C:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Throw1
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

; Used by: dialogue: * (Mercator/Harbour/Main Harbour/641 Ver1 (First
; Visit)).
CSA_006D:
		bset	#$00,(g_Flags+1).l
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		eori.b	#$40,d0
		andi.b	#$3F,(g_Flags+1).l
		or.b	d0,(g_Flags+1).l
		move.w	#$0075,d0	  ; Cutscene $075: *: "Hey, a buyer! You want variety goods? Sure,.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/Harbour/Main Harbour/642 Ver2
; (After Ship Arrives) [Sailor]; Mercator/Harbour/Main Harbour/643 Ver3
; (After Lighthouse Broken) [Sailor].
CSA_006E:
		move.b	(g_Flags+1).l,d0
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d0,RotationAndSize(a5)
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/1F/Outside West/032 Ver1
; (First Visit) [Blue Ribbon].
CSA_006F:
		bsr.w	CSA_015A
		move.w	#$006F,d0	  ; Cutscene $06F: Friday: "Look, Nigel! Something's falling."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/1F/Outside West/032 Ver1
; (First Visit) [Blue Ribbon].
CSA_0070:
		bset	#$05,InteractFlags(a5)
		move.w	#$0070,d0	  ; Cutscene $070: Friday: "What a beautiful ribbon! Did somebody drop.."
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Thieves' Hideout/4F/Treasure Room/225 Ver2
; (Kayla) [Kayla].
CSA_0071:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicKayla
; ---------------------------------------------------------------------------
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Thieves' Hideout/4F/Treasure Room/225 Ver2
; (Kayla) [Ink].
CSA_0072:
		move.w	#$000C,AnimationIndex(a5)
		clr.w	AnimationFrame(a5)
		bset	#$07,RenderFlags(a5)
		jsr	(j_LoadSprites).l
		jsr	(j_FlushDMACopyQueue).l
		move.w	#$0028,d0	  ; Cutscene $028: Friday: "No! No!"
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_4,(g_FridayAnimation1).l
		move.b	#FRIDAY_FROZEN,(g_FridayAnimation2).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Thieves' Hideout/4F/Treasure Room/225 Ver2
; (Kayla) [Kayla].
CSA_0073:
		move.w	#$0029,d0	  ; Cutscene $029: Kayla: "Hahahahahaha! Great! Now I know the locatio.." (+5)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Thieves' Hideout/4F/Treasure Room/225 Ver2
; (Kayla) [Kayla].
CSA_0074:
		move.w	#$002A,d0	  ; Cutscene $02A: Kayla: "Nigel handed over the ." (+1) [Litho graph]
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Thieves' Hideout/4F/Treasure Room/225 Ver2
; (Kayla) [Kayla].
CSA_0075:
		move.w	#$002B,d0	  ; Cutscene $02B: Kayla: "I don't need her any more! 'Bye now!"
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_5,(g_FridayAnimation1).l
		move.b	#FRIDAY_FLAP,(g_FridayAnimation2).l
		rts
; ---------------------------------------------------------------------------

; Consumes the Lithograph as Friday flies its route.
; Used by: behaviour scripts: Thieves' Hideout/4F/Treasure Room/225 Ver2
; (Kayla) [Ink].
CSA_0076:
		move.b	#ITM_LITHOGRAPH,d0
		jsr	(j_CheckAndConsumeItem).l
		move.w	#$002C,d0	  ; Cutscene $02C: Friday: "Oooooo!!" (+4)
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_6,(g_FridayAnimation1).l
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation2).l
		rts
; ---------------------------------------------------------------------------

; Sprite 1 walks off through the start-of-cutscene behaviour.
; Used by: behaviour scripts: Mercator/Center/Interior/676 Fahl's Dojo
; [Invisible Cube].
CSA_0077:
		movem.l	a5,-(sp)
		lea	(Sprite1_X).l,a5
		move.w	#BHVS_WALK_START_CUTSCENE,BehaviourLUTIndex(a5)
		jsr	(j_LoadSpriteBehaviour).l
		movem.l	(sp)+,a5
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Crypt/656 Room 0, Riddler of the
; Underworld [Mummy 3].
CSA_0078:
		move.w	#$0076,d0	  ; Cutscene $076: *: "Heh heh heh... Here comes another victim....." (+1) (Y/N)
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		bne.w	_c0078Rts
		bclr	#$02,(g_Flags+$16).l

_c0078Rts:
		rts
; ---------------------------------------------------------------------------

; Used by: dialogue: * (Mercator Crypt/656 Room 0, Riddler of the
; Underworld).
CSA_0079:
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

; Used by: dialogue: * (Mercator Crypt/655 Room 1, Betty Ross).
CSA_007A:
		btst	#$00,(g_Flags+$15).l
		bne.s	_c007ARts
		bset	#$00,(g_Flags+1).l

_c007ARts:
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts in 8 rooms.
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

; Used by: dialogue: * (Mercator Crypt/654 Room 2, Ruby Silent).
CSA_007C:
		btst	#$01,(g_Flags+$15).l
		bne.s	_c007CRts
		bset	#$00,(g_Flags+1).l

_c007CRts:
		rts
; ---------------------------------------------------------------------------

; Used by: dialogue: * (Mercator Crypt/659 Room 4, Maria Hysterica).
CSA_007D:
		btst	#$03,(g_Flags+$15).l
		bne.s	_c007DRts
		bset	#$00,(g_Flags+1).l

_c007DRts:
		rts
; ---------------------------------------------------------------------------

; Used by: dialogue: * (Mercator Crypt/658 Room 5, Jim Bright).
CSA_007E:
		btst	#$04,(g_Flags+$15).l
		bne.s	_c007ERts
		bset	#$01,(g_Flags+1).l

_c007ERts:
		rts
; ---------------------------------------------------------------------------

; Used by: dialogue: * (Mercator Crypt/657 Room 6, Larson E).
CSA_007F:
		btst	#$05,(g_Flags+$15).l
		bne.s	_c007FRts
		bset	#$01,(g_Flags+1).l

_c007FRts:
		rts
; ---------------------------------------------------------------------------

; Used by: dialogue: * (Mercator Crypt/652 Room 7, Dirk the Dark).
CSA_0080:
		btst	#$06,(g_Flags+$15).l
		bne.s	_c0080Rts
		bset	#$00,(g_Flags+1).l

_c0080Rts:
		rts
; ---------------------------------------------------------------------------

; Used by: dialogue: * (Mercator Crypt/647 Main Hallway); * (Mercator
; Crypt/651 Armlet Room); * (Mercator Crypt/656 Room 0, Riddler of the
; Underworld).
CSA_0081:
		move.w	#$0077,d0	  ; Cutscene $077: *: "Heh heh heh... there are still more riddles.." (+1) (Y/N)
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0081Rts
		bset	#$00,(g_Flags+1).l

_c0081Rts:
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Crypt/647 Main Hallway [Mummy 1].
CSA_0082:
		move.w	#$0078,d0	  ; Cutscene $078: "Heh heh heh... So long..."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Crypt/647 Main Hallway [Mummy 1].
CSA_0083:
		move.w	#$0079,d0	  ; Cutscene $079: *: "...Impossible... How is it you came back al.." (+1) (Y/N)
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

; Used by: behaviour scripts: Mercator Crypt/647 Main Hallway [Mummy 1].
CSA_0084:
		move.w	#$007A,d0	  ; Cutscene $07A: "I can see there's something about you... I.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Crypt/654 Room 2, Ruby Silent
; [Invisible Cube].
CSA_0085:
		movem.l	a5,-(sp)
		lea	(Sprite1_X).l,a5
		jsr	(j_HideSprite).l
		lea	(Sprite2_X).l,a5
		jsr	(j_HideSprite).l
		movem.l	(sp)+,a5
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Overworld/04 - Mercator, Verla Tunnel,
; Mir's Tower/475 Mir's Tower 1 (Outside) [Invisible Cube].
CSA_0086:
		move.w	#$007B,d0	  ; Cutscene $07B: "The magic barrier prevented you from going.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Overworld/04 - Mercator, Verla Tunnel,
; Mir's Tower/475 Mir's Tower 1 (Outside) [Invisible Cube].
CSA_0087:
		move.w	#$007C,d0	  ; Cutscene $07C: "Nigel held the up over the entrance!" [Armlet]
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

; Used by: dialogue: * (Mir's Tower/1F/751 Entrance).
CSA_0088:
		move.w	#$007D,d0	  ; Cutscene $07D: Mir: "Are you going in at all costs?" (Y/N)
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

; Used by: dialogue: * (Mir's Tower/1F/751 Entrance).
CSA_0089:
		move.w	#$007E,d0	  ; Cutscene $07E: Mir: "Anything I can do for you?" (Y/N)
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

; Used by: dialogue: * (Mir's Tower/1F/751 Entrance).
CSA_008A:
		move.w	#$007F,d0	  ; Cutscene $07F: Mir: "Do you dare come in?" (Y/N)
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c008ARts
		bset	#$07,(g_Flags+$16).l

_c008ARts:
		rts
; ---------------------------------------------------------------------------

; CSA_008B/8C/8D/8E: the Duke's sword-swing poses (anim $38 frames
; 0/4/8/$C); CSA_008C also lands a hit on the player from the front.
; Used by: behaviour scripts: Mir's Tower/3F/758 Miro's Room [Nigel].
CSA_008B:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_SwordSwing
; ---------------------------------------------------------------------------
		movem.l	a5,-(sp)
		clr.w	AnimationFrame(a5)
		bra.s	_showAnim38
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mir's Tower/3F/758 Miro's Room [Nigel].
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

; Used by: behaviour scripts: Mir's Tower/3F/758 Miro's Room [Nigel].
CSA_008D:
		movem.l	a5,-(sp)
		move.w	#$0008,AnimationFrame(a5)
		bra.s	_showAnim38
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mir's Tower/3F/758 Miro's Room [Nigel].
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
; Used by: behaviour scripts: Mir's Tower/3F/758 Miro's Room [Invisible
; Cube].
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

; Used by: behaviour scripts: Mir's Tower/3F/758 Miro's Room [Invisible
; Cube].
CSA_0090:
		move.w	#$0080,d0	  ; Cutscene $080: Miro: "Pew!! Smells bad!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mir's Tower/3F/762 Hidden Door Room
; [Nigel].
CSA_0091:
		move.w	#$0081,d0	  ; Cutscene $081: Miro: "You again! Go away! Go away!!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mir's Tower/10F/784 Mir's Room [Mir].
CSA_0092:
		move.w	#$0082,d0	  ; Cutscene $082: Mir: "You don't have to feel so ashamed. It's not.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mir's Tower/10F/784 Mir's Room [Mir].
CSA_0093:
		move.w	#$0083,d0	  ; Cutscene $083: Mir: "You've done well. Now, back to the dust. fr.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mir's Tower/10F/784 Mir's Room [Mir].
CSA_0094:
		move.w	#$0084,d0	  ; Cutscene $084: Mir: "Brave young man, You're the first person to.." (+1)
		bsr.w	LoadCutsceneDialogue
		bsr.w	CSA_015A
		move.w	#$0085,d0	  ; Cutscene $085: Friday: "Shut up! We came here to defeat you!" (+3)
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mir's Tower/8F/782 Skeletons, Miro
; [Invisible Cube].
CSA_0095:
		bclr	#$07,(Sprite9_InteractFlags).l
		bclr	#$07,(Sprite9_InitInteractFlags).l
		rts
; ---------------------------------------------------------------------------

; Sprite 9 takes over the caller's script 4 bytes ahead and is
; pacified (hostile/hurt/invisible flags cleared).
; Used by: behaviour scripts: Mir's Tower/8F/782 Skeletons, Miro
; [Invisible Cube].
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

; Used by: behaviour scripts: Mir's Tower/10F/784 Mir's Room [Invisible
; Cube]; called directly by CSA_0099.
CSA_0097:
		bclr	#$07,(Sprite4_InteractFlags).l
		bclr	#$07,(Sprite4_InitInteractFlags).l
		rts

; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mir's Tower/10F/784 Mir's Room [Invisible
; Cube].
CSA_0098:
		move.w	#$0086,d0	  ; Cutscene $086: Mir: "I give up!" (+4)
		bsr.w	LoadCutsceneDialogue
		bsr.w	CSA_015A
		move.w	#$0087,d0	  ; Cutscene $087: Friday: "Really!??" (+9)
		bsr.w	LoadCutsceneDialogue
		move.w	#$0088,d0	  ; Cutscene $088: Mir: "The jewel is downstairs. Once you've found.." (+1)
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mir's Tower/10F/784 Mir's Room [Invisible
; Cube].
CSA_0099:
		bsr.s	CSA_0097
		clr.w	(Sprite4_BehavParam).l
		rts
; ---------------------------------------------------------------------------

; Warp-pad exit to outside Mir's Tower (room $1DB warp destination).
; Used by: behaviour scripts: Mir's Tower/8F/781 Jewel Room [Invisible
; Cube]; called directly by CSA_00F6.
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

; Used by: behaviour scripts: Mir's Tower/8F/781 Jewel Room [Invisible
; Cube].
CSA_009B:
		move.w	#$0089,d0	  ; Cutscene $089: Mir: "I'm going to send you directly to the groun.."
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c009BRts
		bset	#$00,(g_Flags+1).l

_c009BRts:
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/1F/Entrance Hall/057 Ver3
; (Return from Mir's Tower) [Old Man].
CSA_009C:
		move.w	#$008A,d0	  ; Cutscene $08A: Butler: "Mr. Nigel! You did it!" (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/1F/Throne Room/053 Ver3
; (Duke & Kayla) [Old Man].
CSA_009D:
		move.b	#$23,d0
		cmpi.b	#$1D,(Player_X).l
		beq.s	_c009DPlay
		move.b	#$24,d0

_c009DPlay:
		bra.w	PlaybackInput
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/1F/Throne Room/053 Ver3
; (Duke & Kayla) [Duke].
CSA_009E:
		move.w	#$008B,d0	  ; Cutscene $08B: Duke: "Mr. Nigel! I'm very glad to see you!" (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/1F/Throne Room/053 Ver3
; (Duke & Kayla) [Duke].
CSA_009F:
		move.w	#$008C,d0	  ; Cutscene $08C: Duke: "I always try to be one step ahead of the co.." (+3)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/1F/Throne Room/053 Ver3
; (Duke & Kayla) [Kayla].
CSA_00A0:
		move.w	#$008D,d0	  ; Cutscene $08D: Kayla: "Hahahahahaha!"
		bsr.w	LoadCutsceneDialogue
		bsr.s	_swordFlashTwice
		move.w	#$008E,d0	  ; Cutscene $08E: Kayla: "Well done, boy! Ol' Duke and I agreed to sh.." (+6)
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

; Used by: behaviour scripts: Mercator Castle/1F/Throne Room/053 Ver3
; (Duke & Kayla) [Kayla].
CSA_00A1:
		move.w	#$008F,d0	  ; Cutscene $08F: Kayla: "Hahaha...uh-oh!" (+2)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/1F/Throne Room/053 Ver3
; (Duke & Kayla) [Duke].
CSA_00A2:
		move.w	#$0090,d0	  ; Cutscene $090: Duke: "What a bunch of dweebs! Those treasures are.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Consumes the Red and Purple Jewels (Kazalt gate).
; Used by: behaviour scripts: Mercator Castle/1F/Throne Room/053 Ver3
; (Duke & Kayla) [Duke].
CSA_00A3:
		move.b	#ITM_REDJEWEL,d0
		jsr	(j_CheckAndConsumeItem).l
		move.b	#ITM_PURPLEJEWEL,d0
		jsr	(j_CheckAndConsumeItem).l
		move.w	#$0091,d0	  ; Cutscene $091: Duke: "The red and purple jewels were taken away f.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/B2F/081 Kayla Trap Room
; [Invisible Cube].
CSA_00A4:
		move.w	#$0092,d0	  ; Cutscene $092: Kayla: "Hey! How did you escape? You haven't seen t.." (+2)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: dialogue: Moralis (King Nole's Cave/B1F/170 Kazalt Warp);
; Moralis (Mercator Castle/B1F/042 Cell 2 (Moralis)); Moralis (Mercator
; Castle/B1F/044 Cell 4 (Empty with Hidden Door)).
CSA_00A5:
		bset	#$02,(g_Flags+$13).l
		move.w	#$0093,d0	  ; Cutscene $093: Moralis: "Thank you very much. I almost gave up hope..." (+3)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/B1F/043 Cell 3 (Maid)
; [Woman 2].
CSA_00A6:
		move.w	#$0094,d0	  ; Cutscene $094: *: "No! Don't touch me! P-please...don't touch.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/B1F/043 Cell 3 (Maid)
; [Woman 2].
CSA_00A7:
		move.w	#$0095,d0	  ; Cutscene $095: *: "I'm warning you... I have a knife!" (+3)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/1F/072 West Tower [Knight
; 1].
CSA_00A8:
		move.w	#$0096,d0	  ; Cutscene $096: *: "ARRRRRRRRR!! It's the end of the line for y.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/2F/090 West Tower [Knight
; 1].
CSA_00A9:
		move.w	#$0097,d0	  ; Cutscene $097: *: "GARRRRRRRR!!! Elf boy fall down, go BOOM!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/3F/104 West Tower [Knight
; 1].
CSA_00AA:
		move.w	#$0098,d0	  ; Cutscene $098: *: "HARRRRRRRR!!! Time for all little boys to g.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/4F/105 Tower Bedroom
; Entrance [Knight 1].
CSA_00AB:
		move.w	(Player_HeightmapOffset).l,d0
		movem.w	d0,-(sp)
		move.w	#$E3B4,(Player_HeightmapOffset).l
		jsr	(j_CheckForDoorNW).l
		movem.w	(sp)+,d0
		move.w	d0,(Player_HeightmapOffset).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/4F/105 Tower Bedroom
; Entrance [Knight 1].
CSA_00AC:
		move.w	#$0098,d0	  ; Cutscene $098: *: "HARRRRRRRR!!! Time for all little boys to g.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/4F/108 West Tower Bedroom
; [Zak].
CSA_00AD:
		move.w	#$0099,d0	  ; Cutscene $099: Zak: "Hello, boy! I watched your funny little adv.." (+4)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/4F/108 West Tower Bedroom
; [Princess].
CSA_00AE:
		move.w	#$009A,d0	  ; Cutscene $09A: Lara: "You came to save me, right? Wow, cool! It's.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/4F/108 West Tower Bedroom
; [Zak].
CSA_00AF:
		move.w	#$009B,d0	  ; Cutscene $09B: Zak: "L...lizard? I'm a Drakkonian, not a lizard!.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/4F/108 West Tower Bedroom
; [Princess, Zak].
CSA_00B0:
		move.w	(Player_HeightmapOffset).l,d0
		movem.w	d0,-(sp)
		move.w	#$DCA8,(Player_HeightmapOffset).l
		jsr	(j_CheckForDoorNW).l
		movem.w	(sp)+,d0
		move.w	d0,(Player_HeightmapOffset).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/4F/108 West Tower Bedroom
; [Princess].
CSA_00B1:
		move.w	#$009C,d0	  ; Cutscene $09C: Lara: "Hey! Where are you going? Help me! Save me,.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Zak flies off with his rider: the raw $92-$9E offsets are the NEXT
; sprite's Z/hitbox fields ($80+Z etc.), moved in step with Zak's
; own. Runs the {step id, tick count} list in ZakLaraCutsceneFlyCmds
; through the little jump table below ($FF terminates).
; Used by: behaviour scripts: Mercator Castle/3F/035 Outside West Tower
; [Zak].
CSA_00B2:
		move.w	#$009D,d0	  ; Cutscene $09D: Zak: "Stay there! Or this noisy girl will fall to.." (+1)
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
		move.w	#$009E,d0	  ; Cutscene $09E: Lara: "Wow! I'm flying! See? I'm flying! Say! Are.." (+1)
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

; Used by: no data reference found.
CSA_00B3:
		move.w	#$009E,d0	  ; Cutscene $09E: Lara: "Wow! I'm flying! See? I'm flying! Say! Are.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Sword-swing pose pair: frame 0, clang, then frame 4 by falling
; through into _showAnim8Frame.
; Used by: behaviour scripts: Mercator Castle/2F/Training Room/084 Ver2
; (Arthur and Silver Knight) [Knight 2].
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

; Used by: dialogue of 5 NPCs.
CSA_00B5:
		bset	#$06,(g_AdditionalFlags).l
		move.w	#$00A0,d0	  ; Cutscene $0A0: Arthur: "Sir Nigel!" (+7) [Sun Stone]
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/2F/Training Room/084 Ver2
; (Arthur and Silver Knight) [Lord Arthur].
CSA_00B6:
		move.w	#$00A1,d0	  ; Cutscene $0A1: Arthur: "Hurry! Follow the duke as soon as you can!.." (+2)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/B1F/044 Cell 4 (Empty with
; Hidden Door) [Moralis].
CSA_00B7:
		move.w	#$00A2,d0	  ; Cutscene $0A2: Moralis: "Oh, it's you! While I was looking for the e.." (+8)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Greenmaze/Overground/563 South (Gnome
; Dance) [Gnome].
CSA_00B8:
		move.w	#$00A3,d0	  ; Cutscene $0A3: *: "La-la-la, we like to make people lose their.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Greenmaze/Overground/563 South (Gnome
; Dance) [Gnome].
CSA_00B9:
		move.w	#$00A4,d0	  ; Cutscene $0A4: *: "Hello! You're lost, aren't you?" (+2)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Greenmaze/Overground/560 West (Einstein,
; Cutter) [Gnome].
CSA_00BA:
		move.w	#$00AC,d0	  ; Cutscene $0AC: *: "Oh!! Don't frighten me like that!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Greenmaze/Overground/562 Southeast
; [Gnome].
CSA_00BB:
		move.w	#$00AD,d0	  ; Cutscene $0AD: *: "Woah! That made me dizzy!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: no data reference found.
CSA_00BC:
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Greenmaze/Overground/567 Northeast (Vines)
; [Gnome].
CSA_00BD:
		move.w	#$00AE,d0	  ; Cutscene $0AE: *: "You're off guard!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Greenmaze/Overground/567 Northeast (Vines)
; [Gnome].
CSA_00BE:
		move.w	#$00AF,d0	  ; Cutscene $0AF: *: "Ha ha ha ha! Try once more!" (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Greenmaze/Overground/567 Northeast (Vines)
; [Gnome].
CSA_00BF:
		move.w	#$00B0,d0	  ; Cutscene $0B0: *: "You've got grit! ...OK, I'll give you a hin.." (+2)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Greenmaze/Overground/567 Northeast (Vines)
; [Gnome].
CSA_00C0:
		move.w	#$00B1,d0	  ; Cutscene $0B1: *: "You're doing very well! But you're still co.." (+2)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Greenmaze/Overground/567 Northeast (Vines)
; [Invisible Cube].
CSA_00C1:
		move.w	#$00B2,d0	  ; Cutscene $0B2: *: "I can't see you, but I'm glad to meet you." (+2)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; The injured dog: face it, and on Yes feed it an EkeEke (consumed,
; dog hidden); on No Friday just lands.
; Used by: behaviour scripts: Greenmaze/Overground/560 West (Einstein,
; Cutter) [Injured Dog].
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
		move.w	#$00A5,d0	  ; Cutscene $0A5: Friday: "Look, Nigel! This dog is badly hurt!" (+2) [EkeEke]
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

; Used by: behaviour scripts: Greenmaze/Overground/560 West (Einstein,
; Cutter) [Dog].
CSA_00C3:
		move.w	#$00A6,d0	  ; Cutscene $0A6: Friday: "Good! He looks much better, now. If only I.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Greenmaze/Overground/560 West (Einstein,
; Cutter) [Dog].
CSA_00C4:
		move.w	#$00A7,d0	  ; Cutscene $0A7: Einstein: "Bow-wow-wow!" (+1)
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Greenmaze/Overground/560 West (Einstein,
; Cutter) [Dog].
CSA_00C5:
		move.w	#$00A8,d0	  ; Cutscene $0A8: Einstein: "Bow-wow-wow!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: dialogue: Cutter (Greenmaze/Overground/560 West (Einstein,
; Cutter)); Cutter (Greenmaze/Overground/564 East (Sun Stone)).
CSA_00C6:
		move.w	#$00A9,d0	  ; Cutscene $0A9: Cutter: "Thank you, Nigel and Friday. You saved my d.."
		bsr.w	LoadCutsceneDialogue
		bsr.w	CSA_015A
		move.w	#$00AA,d0	  ; Cutscene $0AA: Friday: "Just a minute! How come you know our names?.." (+5) [Einstein Whistle]
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
		move.w	#$00AB,d0	  ; Cutscene $0AB: Einstein: "Thanks, Nigel! I was attacked by savage For.." (+2)
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		bset	#$04,(g_AdditionalFlags+4).l
		bset	#$00,(g_Flags+1).l
		rts
; ---------------------------------------------------------------------------

; Used by: no data reference found.
CSA_00C7:
		rts
; ---------------------------------------------------------------------------

; Massan elder sends Friday home: on Yes she flies routes 7 and 8
; before rejoining.
; Used by: behaviour scripts: Greenmaze/Overground/564 East (Sun Stone)
; [Invisible Cube].
CSA_00C8:
		bsr.w	CSA_015A
		move.w	#$00B3,d0	  ; Cutscene $0B3: Friday: "Nigel, look! I can see something shining ov.." (+1) [Sun Stone]
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c00C8Done
		move.b	#FRIDAY_HOVER,(g_FridayAnimation2).l
		move.w	#$00B4,d0	  ; Cutscene $0B4: Friday: "No, don't give up now! not when it's before.."
		bsr.w	LoadCutsceneDialogue
		move.w	#00060,d0
		jsr	(j_Sleep).l
		move.b	#FRIDAY_FROZEN2,(g_FridayAnimation2).l

_c00C8Wait:
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#FRIDAY_FROZEN2,(g_FridayAnimation1).l
		bne.s	_c00C8Wait
		move.w	#$00B5,d0	  ; Cutscene $0B5: Friday: "Oh, I know!"
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_7,(g_FridayAnimation1).l
		move.b	#FRIDAY_FLAP,(g_FridayAnimation2).l
		bsr.w	_fridayWait
		move.w	#$00B6,d0	  ; Cutscene $0B6: Friday: "Let's call Einstein here! I think he knows.." (+2)
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_8,(g_FridayAnimation1).l
		move.b	#FRIDAY_FLAP,(g_FridayAnimation2).l
		bsr.w	_fridayWait
		bset	#$06,(g_AdditionalFlags+4).l

_c00C8Done:
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Greenmaze/Overground/564 East (Sun Stone)
; [Man 2].
CSA_00C9:
		move.w	#$00B8,d0	  ; Cutscene $0B8: Friday: "Nigel... I heard a dog barking! It must be.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Greenmaze/Overground/564 East (Sun Stone)
; [Man 2].
CSA_00CA:
		move.w	#$00B9,d0	  ; Cutscene $0B9: Einstein: "Bow-wow! Nigel! Friday!" (+2)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Greenmaze/Overground/564 East (Sun Stone)
; [Man 2].
CSA_00CB:
		move.w	#$00BA,d0	  ; Cutscene $0BA: Cutter: "Finished!" (+4)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: dialogue: * (Mercator Crypt/648 Room 8, Whodini).
CSA_00CC:
		btst	#$07,(g_Flags+$15).l
		bne.s	_c00CCRts
		bset	#$00,(g_Flags+1).l

_c00CCRts:
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Ryuma/Ryuma - Outside/610 Ver1 (Thieves)
; [Old Man].
CSA_00CD:
		bset	#$07,(Sprite3_JumpRate).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Ryuma/Lighthouse Top/628 Ver2 (After Sun
; Stone Theft) [Old Man].
CSA_00CE:
		move.w	#$00BB,d0	  ; Cutscene $0BB: *: "Oh, the ! How did you get it?! I can fix th.." [Sun Stone]
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Sun Stone placed: warp to the lit lighthouse top, consuming it.
; Used by: behaviour scripts: Ryuma/Lighthouse Top/628 Ver2 (After Sun
; Stone Theft) [Old Man].
CSA_00CF:
		move.w	#$00BC,d0	  ; Cutscene $0BC: *: "Yo-ho!"
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

; Used by: behaviour scripts: Ryuma/Lighthouse Top/629 Ver3 (After
; Restoring Sun Stone) [Old Man].
CSA_00D0:
		move.w	#$00BD,d0	  ; Cutscene $0BD: *: "Thanks to you, the lighthouse is now comple.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: dialogue: * (Mercator/Harbour/Main Harbour/641 Ver1 (First
; Visit)); * (Mercator/Harbour/Wholesale Shop B1F/660 Ver1 (Empty)).
CSA_00D1:
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		beq.s	_c00D1Front
		move.w	#$00C1,d0	  ; Cutscene $0C1: *: "The ship will soon set sail for Verla! You.." (+1) (Y/N)
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c00D1Rts
		bset	#$04,(g_AdditionalFlags+$B).l

_c00D1Rts:
		rts
; ---------------------------------------------------------------------------

_c00D1Front:
		move.w	#$00C2,d0	  ; Cutscene $0C2: "We have to leave now! Step lively! And, don.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Set sail for Verla: island-map voyage 0, then aboard the ship.
; Used by: dialogue: * (Mercator/Harbour/Main Harbour/641 Ver1 (First
; Visit)); * (Mercator/Harbour/Public Dock/493 Ver1 (Empty Boat)).
CSA_00D2:
		move.w	#$00BE,d0	  ; Cutscene $0BE: *: "It's all set! Let's go!"
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
; Used by: behaviour scripts: Overworld/07 - Verla, Verla Tunnel, Verla
; Mines/497 Boat [Sailor].
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

; Used by: behaviour scripts: Verla/Verla - Outside/711 Ver1 (Before
; Rescue) [Knight 2].
CSA_00D4:
		move.w	#$00C3,d0	  ; Cutscene $0C3: *: "YAAAAAAARG!!! RRRAAAAARG!!!"
		bsr.w	LoadCutsceneDialogue
		move.w	(Player_HeightmapOffset).l,d0
		movem.w	d0,-(sp)
		move.w	#$E69C,(Player_HeightmapOffset).l
		jsr	(j_CheckForDoorNW).l
		movem.w	(sp)+,d0
		move.w	d0,(Player_HeightmapOffset).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/Harbour/Public Dock/495 Ver3
; (Unused) [Sailor].
CSA_00D5:
		move.w	#$00BF,d0	  ; Cutscene $0BF: *: "The town of Verla! All ashore that's going.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/Harbour/Public Dock/495 Ver3
; (Unused) [Sailor].
CSA_00D6:
		move.w	#$00C0,d0	  ; Cutscene $0C0: *: "Everybody set? let's go!"
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

; Used by: behaviour scripts: Verla/House 2/722 Ver1 (Before Rescue)
; [Knight 3].
CSA_00D7:
		move.w	#$00C4,d0	  ; Cutscene $0C4: *: "YAAAAAAARG!!! RRRAAAAARG!!!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Verla Mine/B2F/255 First Boss Room [Knight
; 3].
CSA_00D8:
		move.w	#$00C5,d0	  ; Cutscene $0C5: *: "Do you want to die so early? RRAAAAAWRRR!!!" (+3)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Verla Mine/B4F/269 Third Boss Room [Knight
; 3].
CSA_00D9:
		move.w	#$00C6,d0	  ; Cutscene $0C6: *: "YAAAARRRR!!!" (+2)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Verla Mine/B1F/242 Second Boss Room
; [Knight 3].
CSA_00DA:
		move.w	#$00C8,d0	  ; Cutscene $0C8: *: "YAAAAAAARG!!! RRRAAAAARG!!!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Verla Mine/B1F/242 Second Boss Room
; [Knight 3].
CSA_00DB:
		move.w	#$00C9,d0	  ; Cutscene $0C9: *: "Are you that runt Nigel, the one who's alwa.." (+3)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Verla Mine/B1F/242 Second Boss Room [Man
; 1].
CSA_00DC:
		move.w	#$00CA,d0	  ; Cutscene $0CA: *: "We have been secretly digging an escape tun.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------
; Unreachable leftover.
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Verla/House 2/723 Ver2 (After Rescue) [Man
; 1].
CSA_00DD:
		move.w	#$00CC,d0	  ; Cutscene $0CC: *: "We were discussing what kind of present to.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Castle/2F/Training Room/084 Ver2
; (Arthur and Silver Knight) [Lord Arthur].
CSA_00DE:
		move.w	#$009F,d0	  ; Cutscene $09F: Arthur: "Ouch...!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: dialogue: * (Verla Mine/B1F/242 Second Boss Room); *
; (Verla/Verla - Outside/711 Ver1 (Before Rescue)).
CSA_00DF:
		move.w	#$00CD,d0	  ; Cutscene $0CD: *: "Hi, cutie! Would you be my..."
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_2,(g_FridayAnimation1).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l
		bsr.w	_fridayWait
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		move.w	#$00CE,d0	  ; Cutscene $0CE: "....Never mind! Good luck!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Greenmaze/Overground/567 Northeast (Vines)
; [Kayla].
CSA_00E0:
		move.w	#$00D4,d0	  ; Cutscene $0D4: Kayla: "Rats! Somebody, tell me the way I should go.." (+2)
		bsr.w	LoadCutsceneDialogue
		bsr.w	_swordFlashTwice
		move.w	#$00D5,d0	  ; Cutscene $0D5: Ink: "Ooooouuch!" (+2)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Crypt/650 Room 9, Dead and End
; [Dexter].
CSA_00E1:
		move.w	#$00CF,d0	  ; Cutscene $0CF: Dexter: "Gee! How'd you get here so early?" (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Crypt/650 Room 9, Dead and End
; [Dexter].
CSA_00E2:
		move.w	#$00D0,d0	  ; Cutscene $0D0: Dexter: "What does it say?! .....got it!.... So long.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Enchants the sprite's tiles with the Magic Sword sparkle (both
; gfx copies) and its two palette colours, then makes it invincible
; and hurt-flagged (Mir's barrier).
; Used by: behaviour scripts: Mercator Crypt/650 Room 9, Dead and End
; [Dexter].
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

; Used by: behaviour scripts: Mercator Crypt/650 Room 9, Dead and End
; [Dexter].
CSA_00E4:
		move.w	#$00D1,d0	  ; Cutscene $0D1: Dexter: "Ouch!!! Aughhhh!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Crypt/650 Room 9, Dead and End
; [Dexter].
CSA_00E5:
		clr.b	(g_Flags+8).l
		clr.b	(g_Flags+9).l
		move.w	#$00D2,d0	  ; Cutscene $0D2: Dexter: "NOOOOO!!! akkggghhh..........."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: dialogue: * (Mercator Crypt/650 Room 9, Dead and End).
CSA_00E6:
		btst	#$03,(g_Flags+7).l
		bne.s	_c00E6Rts
		bset	#$02,(g_Flags+1).l

_c00E6Rts:
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Crypt/650 Room 9, Dead and End
; [Small Fireball].
CSA_00E7:
		move.w	#$0100,AttackStrength(a5)
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator Crypt/651 Armlet Room [Mummy 2].
CSA_00E8:
		addi.w	#$0040,HitBoxXStart(a5)
		addi.w	#$0040,HitBoxXEnd(a5)
		move.w	#$00D3,d0	  ; Cutscene $0D3: *: "Mmmmm!...Bright boy brains!! love to eat th.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Overworld/09 - Destel, Lake/488 Lake (Duke
; Cutscene) [Duke Chair].
CSA_00E9:
		bset	#$05,InteractFlags(a5)
		move.w	#$00D6,d0	  ; Cutscene $0D6: Duke: "Well, hello, Nigel! Are you still alive? Pi.." (+4)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Overworld/09 - Destel, Lake/488 Lake (Duke
; Cutscene) [Duke Chair].
CSA_00EA:
		move.w	#$FFFF,(Sprite2_X).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Overworld/09 - Destel, Lake/525 Lake
; (Hill, Duke Cutscene) [Raft].
CSA_00EB:
		bsr.w	CSA_015A
		move.w	#$00D7,d0	  ; Cutscene $0D7: Friday: "Look, Nigel! There goes the duke...!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Overworld/09 - Destel, Lake/525 Lake
; (Hill, Duke Cutscene) [Duke].
CSA_00EC:
		move.w	#$00D8,d0	  ; Cutscene $0D8: Duke: "Ha ha ha! The view from up there must be gr.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Overworld/09 - Destel, Lake/525 Lake
; (Hill, Duke Cutscene) [Soldier].
CSA_00ED:
		move.w	#$00D9,d0	  ; Cutscene $0D9: Friday: "What a hateful man! Nigel, let's go down an.."
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

; On the lighthouse doorstep (X $26-$27, Y $0E): playback sequence 3.
; Used by: behaviour scripts: Mercator/Center/631 Ver2 (Pre-Crypt)
; [Woman 1].
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

; Used by: dialogue: * (Mercator/Center/630 Ver1 (First Visit)).
CSA_00EF:
		bset	#$01,(g_AdditionalFlags+$A).l
		move.w	#$00E3,d0	  ; Cutscene $0E3: *: "Company--salute! Do come in! Duke Mercator.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/Harbour/Wholesale Shop B1F/661
; Ver2 (Items) [Invisible Cube].
CSA_00F0:
		jmp	(j_RunShopWelcome).l
; ---------------------------------------------------------------------------

; Shopkeeper reaction: caught walking off with goods runs the steal
; script, otherwise the farewell.
; Used by: behaviour scripts: Mercator/Harbour/Wholesale Shop B1F/661
; Ver2 (Items) [Invisible Cube].
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

; Used by: behaviour scripts: Lake Shrine/B3F/348 Treasure Room [Duke];
; behaviour(s) 603 (not room-placed).
CSA_00F2:
		move.w	#$00DA,d0	  ; Cutscene $0DA: Duke: "Why are you so stubborn? I guess I've under.." (+1)
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
; Used by: behaviour scripts: Lake Shrine/B3F/348 Treasure Room
; [Invisible Cube].
CSA_00F3:
		bsr.w	_restartBGM
		move.w	#$00DB,d0	  ; Cutscene $0DB: Duke: "Impossible!... I-I... you..."
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

; Used by: behaviour scripts: Lake Shrine/B3F/348 Treasure Room
; [Invisible Cube].
CSA_00F4:
		bclr	#$07,(Sprite5_InteractFlags).l
		bclr	#$07,(Sprite5_InitInteractFlags).l
		rts
; ---------------------------------------------------------------------------

; Zak drops the player from Mir's Tower: sink $D0 units, cost 100
; whole HP, mark the fall (g_AdditionalFlags+$19 bit 0).
; Used by: behaviour scripts: Lake Shrine/B3F/348 Treasure Room [Zak].
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
; Used by: behaviour scripts: Lake Shrine/B3F/348 Treasure Room [Zak].
CSA_00F6:
		bclr	#$00,(g_AdditionalFlags+$19).l
		move.w	#$00DC,d0	  ; Cutscene $0DC: Duke: "Excellent, Zak! Ha ha ha ha! Got you, elf-b.." (+3)
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
		move.w	#$00DD,d0	  ; Cutscene $0DD: Mir: "Nigel! Friday! Are you OK? Owt... es'Eht....."
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
		move.w	#$00DE,d0	  ; Cutscene $0DE: Mir: "What a narrow escape!" (+8) [Axe Magic]
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

; Used by: behaviour scripts: Mountainous Region/Overground/486
; Northeast (Godess Statue, Bridge) [Zak].
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
; Used by: behaviour scripts: Mountainous Region/Overground/486
; Northeast (Godess Statue, Bridge) [Zak].
CSA_00F8:
		move.w	#$00DF,d0	  ; Cutscene $0DF: Zak: "Ah, good...you escaped! I'm sorry about wha.." (+4)
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

; Used by: behaviour scripts: Mountainous Region/Overground/486
; Northeast (Godess Statue, Bridge) [Zak].
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
		move.w	#$00E0,d0	  ; Cutscene $0E0: Friday: "Stop it! STOP!!" (+4)
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

; Used by: dialogue of 8 NPCs.
CSA_00FA:
		bset	#$00,(g_Flags+1).l
		move.w	#$00E1,d0	  ; Cutscene $0E1: Zak: "Is this all right with you, little sister?.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mountainous Region/Overground/492 North
; (Zak) [Invisible Cube].
CSA_00FB:
		bclr	#$07,(Sprite4_InteractFlags).l
		bclr	#$07,(Sprite4_InitInteractFlags).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mountainous Region/Overground/492 North
; (Zak) [Invisible Cube].
CSA_00FC:
		bsr.w	_restartBGM
		bset	#$04,(Sprite4_InteractFlags).l
		move.w	#$00E2,d0	  ; Cutscene $0E2: Zak: "You...you won! I can't believe you're just.." (+3) [Gola's Eye]
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

; Used by: behaviour scripts: Mountainous Region/Overground/492 North
; (Zak) [Zak].
CSA_00FD:
		bclr	#$04,(Sprite4_InteractFlags).l
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#$C0,d1
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d1,RotationAndSize(a5)
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mountainous Region/Overground/492 North
; (Zak) [Invisible Cube].
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

; Used by: behaviour scripts: King Nole's Cave/B1F/170 Kazalt Warp
; [Duke].
CSA_00FF:
		move.w	#$00E5,d0	  ; Cutscene $0E5: Duke: "You again!" (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: King Nole's Cave/B1F/170 Kazalt Warp
; [Duke].
CSA_0100:
		move.w	#$00E6,d0	  ; Cutscene $0E6: Duke: "Ha ha ha! Look!" (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: King Nole's Cave/B1F/170 Kazalt Warp
; [Duke].
CSA_0101:
		move.w	#$00E7,d0	  ; Cutscene $0E7: Duke: "Princess Lara! Sing the song you learned in.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: King Nole's Cave/B1F/170 Kazalt Warp
; [Princess].
CSA_0102:
		move.w	#$00E8,d0	  ; Cutscene $0E8: Lara: "N-no! No, no! No! I'll never sing it for yo.." (+2)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Nole warps out (visual effect) after his line.
; Used by: behaviour scripts: King Nole's Cave/B1F/170 Kazalt Warp
; [Princess].
CSA_0103:
		move.w	#$00E9,d0	  ; Cutscene $0E9: Lara: "Eeeeeeeee! Noooooooooooo!" (+1)
		bsr.w	LoadCutsceneDialogue
		moveq	#VFX_NOLE_WARP_OUT_2,d0
		jsr	(j_DoVisualEffect).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: King Nole's Cave/B1F/170 Kazalt Warp
; [Princess].
CSA_0104:
		move.w	#$00EB,d0	  ; Cutscene $0EB: Lara: "Oh, my prince! I just knew you'd come to sa.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: King Nole's Cave/B1F/170 Kazalt Warp
; [Princess].
CSA_0105:
		move.w	#$00EC,d0	  ; Cutscene $0EC: Lara: "Ever since the duke trapped me in that cast.." (+5)
		bsr.w	LoadCutsceneDialogue
		bsr.w	CSA_015A
		move.w	#$00ED,d0	  ; Cutscene $0ED: Friday: "Put a lid on it, sister! And quit calling h.." (+3)
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_9,(g_FridayAnimation1).l
		move.b	#FRIDAY_FLAP,(g_FridayAnimation2).l

_c0105Wait1:
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#FRIDAY_FLAP,(g_FridayAnimation1).l
		bne.s	_c0105Wait1
		move.w	#$00EE,d0	  ; Cutscene $0EE: Friday: "That's it!! I've had it with you! Take that.."
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_PATH_10,(g_FridayAnimation1).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l

_c0105Wait2:
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#FRIDAY_PERCH,(g_FridayAnimation1).l
		bne.s	_c0105Wait2
		move.w	#$00EF,d0	  ; Cutscene $0EF: Lara: "Ouch! Ouch!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Nole warps in (visual effect) before his line.
; Used by: behaviour scripts: King Nole's Cave/B1F/170 Kazalt Warp
; [Princess].
CSA_0106:
		moveq	#VFX_NOLE_WARP_IN_2,d0
		jsr	(j_DoVisualEffect).l
		move.w	#$00EA,d0	  ; Cutscene $0EA: Duke: "Ha ha ha ha! The legendary treasures will b.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: King Nole's Cave/B1F/170 Kazalt Warp
; [Woman 2].
CSA_0107:
		move.w	#$00F0,d0	  ; Cutscene $0F0: Lara: "Stay out of this, Moralis! I can handle thi.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: King Nole's Cave/B1F/170 Kazalt Warp
; [Moralis].
CSA_0108:
		move.w	#$00F1,d0	  ; Cutscene $0F1: Moralis: "Mr. Nigel! Thank you very much for all of y.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: King Nole's Cave/B1F/170 Kazalt Warp
; [Woman 2].
CSA_0109:
		move.w	#$00F2,d0	  ; Cutscene $0F2: Friday: "Poor girl... I think she must've cracked be.." (+2)
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

; Pick the fortune-teller's line by story progress (flags).
; Used by: behaviour scripts: Tibor/533 - Entrance [Invisible Cube].
CSA_010A:
		move.w	#$00FA,d0	  ; Cutscene $0FA: Tibor: "Hello! Me? Oh, I'm fine, now. Are my childr.."
		btst	#$07,(g_AdditionalFlags+4).l
		bne.s	_c010AMsg
		move.w	#$00F9,d0
		btst	#$01,(g_Flags+4).l
		bne.s	_c010AMsg
		move.w	#$00F8,d0	  ; Cutscene $0F8: Tibor: "Moooaaann... Grooooaaann...ooooaaannn..."

_c010AMsg:
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Tibor/809 8F [Chest].
CSA_010B:
		move.w	#$00FB,d0	  ; Cutscene $0FB: Tibor: "Wow! No more pain! Say...that feels good!" (+4)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Pacifies every active sprite (and stops freshly-pacified ones).
; Used by: behaviour scripts: Lake Shrine/1F/304 Golden Golem Room
; [Round Switch].
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
; Used by: behaviour scripts: Intro/Jypta Ruins/139 Sea Bridge [Large
; Grey Ball].
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

; Used by: behaviour scripts: Intro/Jypta Ruins/140 Pillar Jump Puzzle
; [Invisible Cube].
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

; Used by: behaviour scripts: Intro/Jypta Ruins/141 Statue of Jypta Room
; [Invisible Cube].
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

; Used by: behaviour scripts: Intro/142 Kalva Harbor [Old Man].
CSA_0110:
		andi.b	#$BF,(Player_InteractFlags).l
		rts
; ---------------------------------------------------------------------------

; The opening narration over intro screen 1, ending with Friday
; crashing in (music + flight path 11) and the thieves' arrival.
; Used by: behaviour scripts: Intro/142 Kalva Harbor [Old Man].
CSA_0111:
		move.w	#$00FD,d0	  ; Cutscene $0FD: Owner: "Heh heh heh! Here's your money for the ." [Statue of Jypta]
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$00FE,d0	  ; Cutscene $0FE: Owner: "Nigel got 2000 golds!"
		move.w	#00001,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$00FF,d0	  ; Cutscene $0FF: Owner: "You're a very good treasure hunter...heh he.."
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0100,d0	  ; Cutscene $100: "With that money, you won't have to work for.."
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
		move.w	#$0101,d0	  ; Cutscene $101: Nigel: "Wh...what?!"
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jsr	(j_ClearTextbox).l
		move.w	#00030,d0
		jsr	(j_Sleep).l
		bsr.w	CSA_015A
		move.w	#$0102,d0	  ; Cutscene $102: Friday: "Help me, please!"
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0103,d0	  ; Cutscene $103: Nigel: "Who are you?"
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
; Used by: behaviour scripts: Intro/142 Kalva Harbor [Kayla].
CSA_0112:
		bsr.w	CSA_015A
		move.w	#$010E,d0	  ; Cutscene $10E: Friday: "We did it! She's gone!"
		move.w	#00090,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$010F,d0	  ; Cutscene $10F: Nigel: "Hey, girl! Did you really see the legendary.."
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0110,d0	  ; Cutscene $110: Friday: "The name's Friday! Don't call me "girl"!"
		move.w	#00120,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0111,d0	  ; Cutscene $111: Nigel: "OK, ok...and you can call me Nigel. Now, ta.."
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0112,d0	  ; Cutscene $112: Friday: "To tell the truth, I didn't really..."
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0113,d0	  ; Cutscene $113: Nigel: "Quit fooling!" (+1)
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0114,d0	  ; Cutscene $114: Friday: "Well, I didn't actually SEE them, but I kno.."
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0115,d0	  ; Cutscene $115: Nigel: "Great! Take me to the general area..."
		move.w	#00090,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0116,d0	  ; Cutscene $116: "After that, my keen senses will lead us to.."
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0117,d0	  ; Cutscene $117: Friday: "All right, then! Follow me, Nigel!"
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0118,d0	  ; Cutscene $118: Nigel: "Let's get one thing straight--I'm not your.."
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
; Used by: behaviour scripts: Intro/143 Giant Bird [Invisible Cube].
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

; Used by: behaviour scripts: Intro/142 Kalva Harbor [Kayla].
CSA_0114:
		move.w	#$0104,d0	  ; Cutscene $104: Kayla: "Hey, you! Hand me that little girl!"
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0105,d0	  ; Cutscene $105: Wally: "...girl."
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0106,d0	  ; Cutscene $106: Ink: "...girl."
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0107,d0	  ; Cutscene $107: Friday: "They know I've seen King Nole's treasures!" (+1)
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0108,d0	  ; Cutscene $108: "They'll probably even kill me! Who knows! S.."
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0109,d0	  ; Cutscene $109: Nigel: "Wait a minute! Did you say "King Nole's tre.."
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$010A,d0	  ; Cutscene $10A: Kayla: "What's with all the jibber-jabber!? I told.."
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jmp	(j_ClearTextbox).l
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Intro/142 Kalva Harbor [Kayla].
CSA_0115:
		move.w	#$010B,d0	  ; Cutscene $10B: Friday: "Run! Hurry!!"
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		move.w	#$010C,d0	  ; Cutscene $10C: Nigel: "Hmmm...could be interesting! OK, c'mon!"
		move.w	#00120,d1
		bsr.w	ShowCutsceneDialogueAndWait
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicIntro
; ---------------------------------------------------------------------------
		jmp	(j_ClearTextbox).l
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Intro/142 Kalva Harbor [Kayla].
CSA_0116:
		move.w	#$010D,d0	  ; Cutscene $10D: Kayla: "Hahahahahaha! You won't get away...."
		move.w	#00090,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jmp	(j_ClearTextbox).l
; ---------------------------------------------------------------------------

; CSA_0117-011B and CSA_011D-0122 queue intro strings 2-6 and 7-$C
; (CheckAndDisplayIntroString).
; Used by: behaviour scripts: Intro/Jypta Ruins/139 Sea Bridge
; [Invisible Cube].
CSA_0117:
		move.b	#$02,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Intro/143 Giant Bird [Invisible Cube].
CSA_0118:
		move.b	#$03,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Intro/Jypta Ruins/140 Pillar Jump Puzzle
; [Invisible Cube].
CSA_0119:
		move.b	#$04,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Intro/142 Kalva Harbor [Invisible Cube].
CSA_011A:
		move.b	#$05,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Intro/Jypta Ruins/140 Pillar Jump Puzzle
; [Invisible Cube].
CSA_011B:
		move.b	#$06,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: King Nole's Cave/1F/148 Outside [Invisible
; Cube].
CSA_011C:
		move.w	#$011A,d0	  ; Cutscene $11A: Nigel: "I hope you're right about those treasures,.." (+1)
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$011B,d0	  ; Cutscene $11B: Friday: "But, the ship going to the island only come.."
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$011C,d0	  ; Cutscene $11C: "You said, "I don't care how much it costs..."
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$011D,d0	  ; Cutscene $11D: Nigel: "...but, 2000 golds! that's more than I....."
		move.w	#00120,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$011E,d0	  ; Cutscene $11E: Friday: "The treasure's worth more than 2000 golds,.."
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$011F,d0	  ; Cutscene $11F: Nigel: "I guess so... Well, in for a copper, in for.."
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		clr.w	(g_ControllerPlayback).l
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		jmp	(j_ClearTextbox).l
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Intro/Jypta Ruins/141 Statue of Jypta Room
; [Invisible Cube].
CSA_011D:
		move.b	#$07,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Intro/Jypta Ruins/141 Statue of Jypta Room
; [Invisible Cube].
CSA_011E:
		move.b	#$08,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Intro/142 Kalva Harbor [Invisible Cube].
CSA_011F:
		move.b	#$09,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Intro/142 Kalva Harbor [Invisible Cube].
CSA_0120:
		move.b	#$0A,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Intro/143 Giant Bird [Invisible Cube].
CSA_0121:
		move.b	#$0B,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Intro/143 Giant Bird [Invisible Cube].
CSA_0122:
		move.b	#$0C,(g_IntroStringToDisplay).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Intro/143 Giant Bird [Invisible Cube].
CSA_0123:
		move.w	#$0119,d0	  ; Cutscene $119: Nigel: "I've got a really bad feeling about all thi.."
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jmp	(j_ClearTextbox).l
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Helga's Hut/1F/480 Entrance [Dog].
CSA_0124:
		move.w	#$00F3,d0	  ; Cutscene $0F3: Marty: "Run away! Hurry! She'll change you into a d.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Mir's curse: transform the player into the dog (actions locked,
; healing disabled).
; Used by: behaviour scripts: Helga's Hut/1F/480 Entrance [Old Lady].
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

; Used by: behaviour scripts: Helga's Hut/B5F/802 Helga's Room [Old
; Lady].
CSA_0126:
		move.w	#$00F4,d0	  ; Cutscene $0F4: Helga: "Hee hee hee... So. You finally made it!..." (+2)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Helga's Hut/B5F/802 Helga's Room [Old
; Lady].
CSA_0127:
		move.w	#$00F5,d0	  ; Cutscene $0F5: Helga: "Ha ha ha!... Your life will come to an end.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Helga's Hut/B5F/802 Helga's Room [Large
; Grey Spiked Ball].
CSA_0128:
		move.w	#$00F6,d0	  ; Cutscene $0F6: Helga: "Aauugh! I made a mistake!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Lift the dog curse: restore sprite, palette and controls.
; Used by: behaviour scripts: Helga's Hut/B5F/802 Helga's Room [Old
; Lady].
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
		move.w	#$00F7,d0	  ; Cutscene $0F7: Friday: "What a wigged-out witch! Now, let's go!"
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Destel Well/3F/281 Pockets Treasure Room
; [Pockets].
CSA_012A:
		move.w	#$00FC,d0	  ; Cutscene $0FC: Pockets: "Ho, ho...It's me! I came down here to look.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: dialogue: * (Mercator/Center/Interior/704 Inn 2F).
CSA_012B:
		bset	#$02,(g_AdditionalFlags+9).l
		move.w	#$0120,d0	  ; Cutscene $120: *: "One more Diet Dahl Delight!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/Center/Interior/704 Inn 2F
; [Madame Yard].
CSA_012C:
		move.w	#$0121,d0	  ; Cutscene $121: Owner: "One Diet Dahl, coming up! Here you are! How.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/Center/Interior/704 Inn 2F
; [Madame Yard].
CSA_012D:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicFanfare2
; ---------------------------------------------------------------------------
		jmp	(j_RestoreBGM).l
; ---------------------------------------------------------------------------

; CSA_012E-0131: randomize the entity's RepeatCount - the casino
; chickens' race handicaps (10-14, 2-5, 1-3, 1-9 laps).
; Used by: behaviour scripts: Mercator/Center/Casino/664 Roulette Room
; [Small Grey Ball].
CSA_012E:
		move.w	#$0004,d6
		jsr	(j_GenerateRandomNumber).l
		addi.b	#$0A,d7
		move.b	d7,$00000066(a5)
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/Center/Casino/664 Roulette Room
; [Small Grey Ball].
CSA_012F:
		move.w	#$0003,d6
		jsr	(j_GenerateRandomNumber).l
		addi.b	#$02,d7
		move.b	d7,$00000066(a5)
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/Center/Casino/664 Roulette Room
; [Small Grey Ball].
CSA_0130:
		move.w	#$0002,d6
		jsr	(j_GenerateRandomNumber).l
		addi.b	#$01,d7
		move.b	d7,$00000066(a5)
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Mercator/Center/Casino/664 Roulette Room
; [Small Grey Ball].
CSA_0131:
		move.w	#$0008,d6
		jsr	(j_GenerateRandomNumber).l
		addi.b	#$01,d7
		move.b	d7,$00000066(a5)
		rts
; ---------------------------------------------------------------------------

; Used by: dialogue Asm of character 313 (CS_0139, the casino games
; barker: Mercator/Center/Casino rooms 664-666), queued via
; g_PendingCutsceneAction.
CSA_0132:
		move.w	#$0122,d0	  ; Cutscene $122: *: "Welcome! Let's play Roulette!" (+3)
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0132Rts
		bset	#$00,(g_Flags+1).l

_c0132Rts:
		rts
; ---------------------------------------------------------------------------

; Roulette result: the ball (sprite 2) resting on a multiple-of-4
; cell (X $0E/$12/$16, Y $10/$14/$18) is a win.
; Used by: behaviour scripts: Mercator/Center/Casino/664 Roulette Room
; [Small Grey Ball].
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
		move.w	#$0123,d0	  ; Cutscene $123: (func XS_0123)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

_c0133Miss:
		move.w	#$0124,d0	  ; Cutscene $124: *: "Please try again!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Chicken race result: g_Flags+1 bit 3 = the player's chicken won.
; Used by: behaviour scripts: Mercator/Center/Casino/665 Chicken Race
; [Invisible Cube].
CSA_0134:
		btst	#$03,(g_Flags+1).l
		beq.s	_c0134Alt
		move.w	#$0129,d0	  ; Cutscene $129: (func XS_0129)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

_c0134Alt:
		move.w	#$0124,d0	  ; Cutscene $124: *: "Please try again!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: dialogue Asm of character 315 (CS_013B, Mercator/Center/
; Casino/665 Chicken Race), queued via g_PendingCutsceneAction.
CSA_0135:
		move.w	#$0128,d0	  ; Cutscene $128: *: "Welcome to the Chicken Race!" (+3)
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0135Rts
		bset	#$00,(g_Flags+1).l

_c0135Rts:
		rts
; ---------------------------------------------------------------------------

; Chicken race: random speed (1/2/8 with 70%/28%/2% odds) and lap
; count for this chicken.
; Used by: behaviour scripts: Mercator/Center/Casino/665 Chicken Race
; [Golem 1, Knight 1, Mummy 1, Skeleton 1].
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

; Used by: dialogue Asm of character 316 (CS_013C, Mercator/Center/
; Casino/663 Corridor), queued via g_PendingCutsceneAction.
CSA_0137:
		move.w	#$012A,d0	  ; Cutscene $12A: *: "Oh! I see you have a casino ticket." (+1) [Casino Ticket]
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0137Rts
		bset	#$03,(g_AdditionalFlags+9).l

_c0137Rts:
		rts
; ---------------------------------------------------------------------------

; Used by: dialogue Asm of character 321 (CS_0141, Labyrinth/B2F/414
; Tree Guard Room), queued via g_PendingCutsceneAction.
CSA_0138:
		move.w	#$012B,d0	  ; Cutscene $12B: *: "I wish we could grow more trees underground.."
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0138Rts
		bset	#$04,(g_AdditionalFlags+9).l

_c0138Rts:
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Labyrinth/B1F/415 Tree Room [Gnome].
CSA_0139:
		move.w	#$012C,d0	  ; Cutscene $12C: *: "Why did you cut the tree if you didn't need.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Labyrinth/B2F/387 Lantern Room [Invisible
; Cube].
CSA_013A:
		bsr.w	CSA_015A
		move.w	#$012F,d0	  ; Cutscene $12F: Friday: "Nigel, we can go back to the dark room, now!" (+4)
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Labyrinth/B5F/408 First Raft Landing
; [Raft]; Labyrinth/B4F/407 Raft Waterfall [Raft].
CSA_013B:
		move.b	#$10,FallRate(a5)
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Labyrinth/B3F/406 Raft Room [Raft].
CSA_013C:
		bsr.w	CSA_015A
		move.w	#$012D,d0	  ; Cutscene $12D: Friday: "Wow, this is wild! Where are we going, Nige.." (+1)
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Labyrinth/B6F/410 Spinner [Invisible
; Cube].
CSA_013D:
		bsr.w	CSA_015A
		move.w	#$012E,d0	  ; Cutscene $12E: Friday: "A little scary, but a lot of fun!" (+1)
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Verla Mine/B4F/269 Third Boss Room [Man
; 1].
CSA_013E:
		move.w	#$00C7,d0	  ; Cutscene $0C7: *: "Thank you! I don't know who you are, but I.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Lake Shrine/1F/308 Entrance Room [Unicorn
; 3].
CSA_013F:
		move.w	#$0130,d0	  ; Cutscene $130: *: "Nice to meet you! We're not like Dex and th.." (+3)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Lake Shrine/B1F/293 Unicorn Room [Unicorn
; 3].
CSA_0140:
		move.w	#$0131,d0	  ; Cutscene $131: *: "Ah...so you ARE here! I'd better go tell th.."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Lake Shrine/B3F/333 Hallway to Treasure
; [Duke].
CSA_0141:
		move.w	#$0132,d0	  ; Cutscene $132: Duke: "Nigel? Is that you over there? Hello, how a.." (+4)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Lake Shrine/B3F/333 Hallway to Treasure
; [Duke].
CSA_0142:
		move.w	#$0133,d0	  ; Cutscene $133: "Am I going slow enough? Hurry! You might st.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Labyrinth/B6F/410 Spinner [Spinner 1].
CSA_0143:
		move.w	#$0134,d0	  ; Cutscene $134: Spinner: "Ho ho ho! You shall never get the treasures.." (+1)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Labyrinth/B6F/410 Spinner [Chest].
CSA_0144:
		bclr	#$07,(Sprite3_InteractFlags).l
		bclr	#$07,(Sprite3_InitInteractFlags).l
		bclr	#$04,(Sprite3_InteractFlags).l
		bclr	#$04,(Sprite3_InitInteractFlags).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Labyrinth/B6F/410 Spinner [Chest].
CSA_0145:
		bsr.w	_restartBGM
		move.w	#$0135,d0	  ; Cutscene $135: Spinner: "Sorry...my king! I...let you...down...!"
		bsr.w	LoadCutsceneDialogue
		lea	(Sprite3_X).l,a5
		jsr	(j_HideSprite).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Labyrinth/B3F/417 Miro [Chest].
CSA_0146:
		bclr	#$07,(Sprite2_InteractFlags).l
		bclr	#$07,(Sprite2_InitInteractFlags).l
		bclr	#$04,(Sprite2_InteractFlags).l
		bclr	#$04,(Sprite2_InitInteractFlags).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Labyrinth/B3F/417 Miro [Miro].
CSA_0147:
		move.w	#$0136,d0	  ; Cutscene $136: Miro: "Do you remember me?" (+2)
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Labyrinth/B3F/417 Miro [Chest].
CSA_0148:
		bsr.w	_restartBGM
		move.w	#$0137,d0	  ; Cutscene $137: Miro: "Why... I'm the same as you... in every way..." (+1)
		bsr.w	LoadCutsceneDialogue
		lea	(Sprite2_X).l,a5
		jsr	(j_HideSprite).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Overworld/04 - Mercator, Verla Tunnel,
; Mir's Tower/461 Outside Twinkle Village [Invisible Cube].
CSA_0149:
		bsr.w	CSA_015A
		move.w	#$0138,d0	  ; Cutscene $138: Friday: "Nigel! My hometown is just over there! Shal.."
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Overworld/04 - Mercator, Verla Tunnel,
; Mir's Tower/462 Twinkle Village [Invisible Cube].
CSA_014A:
		bsr.w	CSA_015A
		btst	#$04,(g_AdditionalFlags+$18).l
		bne.s	_c014ARts
		move.w	#$0139,d0	  ; Cutscene $139: Friday: "Wow, Twinkle Village! How is everybody?"
		bsr.w	LoadCutsceneDialogue

_c014ARts:
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: Overworld/04 - Mercator, Verla Tunnel,
; Mir's Tower/462 Twinkle Village [Invisible Cube].
CSA_014B:
		move.w	#$013A,d0	  ; Cutscene $13A: Friday: "'Bye now!"
		bsr.w	LoadCutsceneDialogue
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation1).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: King Nole's Palace/Treasure Hall/421
; Stairs [Invisible Cube].
CSA_014C:
		move.w	#$013F,d0	  ; Cutscene $13F: "The 3 items suddenly shone brightly!"
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; To the Nole boss arena (Mir-style warp).
; Used by: behaviour scripts: King Nole's Palace/Treasure Hall/421
; Stairs [Gola's Fang].
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
; Used by: behaviour scripts: King Nole's Palace/Treasure Hall/Treasure
; Room/111 Ver1 (Nole) [Nole].
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
		move.w	#$0140,d0	  ; Cutscene $140: Nole: "Rrrrrrrrr... Rrrrrrrr.... Rrrrrr.... Rrrrrr.." (+2)
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

; Used by: behaviour scripts: King Nole's Palace/Treasure Hall/Treasure
; Room/111 Ver1 (Nole) [Invisible Cube].
CSA_014F:
		bclr	#$07,(Sprite3_InteractFlags).l
		bclr	#$07,(Sprite3_InitInteractFlags).l
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: King Nole's Palace/Treasure Hall/Treasure
; Room/111 Ver1 (Nole) [Duke].
CSA_0150:
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicFinalRoom
; ---------------------------------------------------------------------------
		move.w	#$0141,d0	  ; Cutscene $141: Nole: "M Y . . . . . . . . P R E C I O U S. . . ..."
		bra.w	LoadCutsceneDialogue
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: King Nole's Palace/Treasure Hall/Treasure
; Room/111 Ver1 (Nole) [Duke].
CSA_0151:
		move.w	#$0142,d0	  ; Cutscene $142: Duke: "You again! How'd you get ahead of me? Well,.." (+6)
		bsr.w	LoadCutsceneDialogue
		move.w	#ROOM_PALACE_BOSS_ARENA_GOLA,(g_CurrentRoom).l	  ; Gola battle
		bsr.w	SpecialWarp
		movem.l	(sp)+,d0
		movem.l	(sp)+,a5
		movem.l	(sp)+,d0
		movem.l	(sp)+,d7/a5
		rts
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: King Nole's Palace/Treasure Hall/Treasure
; Room/112 Ver2 (Gola) [Invisible Cube].
CSA_0152:
		bclr	#$07,(Sprite2_InteractFlags).l
		bclr	#$07,(Sprite2_InitInteractFlags).l
		rts
; ---------------------------------------------------------------------------

; Nole's treasure turns out to be Gola: sparkle-enchant sprite 3,
; ten red-flash/flicker rounds, then the final boss music.
; Used by: behaviour scripts: King Nole's Palace/Treasure Hall/Treasure
; Room/112 Ver2 (Gola) [Gola].
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
		move.w	#$0143,d0	  ; Cutscene $143: Duke: "AAAuuuuuuggghhhh!!!"
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
; Used by: behaviour scripts: King Nole's Palace/Treasure Hall/Treasure
; Room/112 Ver2 (Gola) [Invisible Cube].
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
		move.w	#$0144,d0	  ; Cutscene $144: Friday: "Nigel! YOU DID IT!! You slew the guardian!.."
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0145,d0	  ; Cutscene $145: Friday: "There must be over a zillion golds...and ev.." (+1)
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		jsr	(j_ClearTextbox).l
		move.b	#FRIDAY_PATH_15,(g_FridayAnimation1).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation2).l
		bsr.w	_fridayWait
		move.w	#$0146,d0	  ; Cutscene $146: Friday: "WheeeEEEE!! I've never seen so much money i.." (+1)
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0147,d0	  ; Cutscene $147: Nigel: "OK, OK...hey, calm down!"
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0148,d0	  ; Cutscene $148: Friday: "...washboard and dryer, a maid, of course,.."
		move.w	#00120,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0149,d0	  ; Cutscene $149: Nigel: "What is it? Did you find a special weapon?"
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$014A,d0	  ; Cutscene $14A: Friday: "No, silly! It's much more valuable than tha.."
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
		move.w	#$014B,d0	  ; Cutscene $14B: "...Tee-hee!!..."
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$014C,d0	  ; Cutscene $14C: Friday: "... my heart! You're not embarrassed, are y.."
		move.w	#00060,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$014D,d0	  ; Cutscene $14D: Nigel: "Wha...huh? Oh! I must've drifted off..." (+2)
		move.w	#00120,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$014E,d0	  ; Cutscene $14E: Friday: "...I... I... I hate you! I HATE you! You'll.."
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$014F,d0	  ; Cutscene $14F: "killed without me! If it weren't for me, yo.."
		move.w	#00180,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0150,d0	  ; Cutscene $150: Nigel: "Hey, are you going with me, or not?"
		move.w	#00120,d1
		bsr.w	ShowCutsceneDialogueAndWait
		move.w	#$0151,d0	  ; Cutscene $151: Friday: "... ... ... Oh! ...er, yes, of course!! Wha.."
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

; Used by: behaviour scripts: King Nole's Palace/Treasure Hall/Treasure
; Room/112 Ver2 (Gola) [Invisible Cube].
CSA_0155:
		lea	(Sprite2_X).l,a5
		jmp	(j_HideSprite).l
; ---------------------------------------------------------------------------

; Used by: behaviour scripts: King Nole's Palace/Treasure Hall/Treasure
; Room/111 Ver1 (Nole) [Duke].
CSA_0156:
		lea	(Sprite3_X).l,a5
		jmp	(j_HideSprite).l
; ---------------------------------------------------------------------------

; Chicken toss: respawn landed chickens (Z 0) at their start spots,
; counting each successful return (g_AdditionalFlags+$11).
; Used by: behaviour scripts: Mercator/Center/Casino/666 Chicken Toss
; [Woman 3].
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
; Used by: behaviour scripts: Mercator/Center/Casino/666 Chicken Toss
; [Woman 3].
CSA_0158:
		bset	#$02,(g_Flags+1).l
		clr.l	d0
		move.b	(g_AdditionalFlags+$11).l,d0
		movem.l	d0,-(sp)
		cmp.b	(g_AdditionalFlags+$1B).l,d0
		bls.s	_c0158Payout
		move.b	d0,(g_AdditionalFlags+$1B).l
		move.l	d0,(g_PrintNumericDwordValue).l
		move.w	#$0126,d0	  ; Cutscene $126: *: "Ding-ding! Ding-ding! New room record!"
		bsr.w	LoadCutsceneDialogue

_c0158Payout:
		movem.l	(sp)+,d1
		mulu.w	#$0005,d1
		move.l	d1,(g_PrintNumericDwordValue).l
		move.w	#$0127,d0	  ; Cutscene $127: *: "Congratulations! Here ya go!" (+1)
		tst.b	d1
		bne.s	_c0158Msg
		move.w	#$0124,d0	  ; Cutscene $124: *: "Please try again!"

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
; Used by: dialogue Asm of character 314 (CS_013A, Mercator/Center/
; Casino/666 Chicken Toss), queued via g_PendingCutsceneAction.
CSA_0159:
		clr.l	d0
		move.b	(g_AdditionalFlags+$1B).l,d0 ; Chicken toss room record
		move.l	d0,(g_PrintNumericDwordValue).l
		move.w	#$0125,d0	  ; Cutscene $125: *: "Hello! Let's play Chicken Toss! Try to catc.." (+4)
		bsr.w	LoadCutsceneDialogue
		tst.b	(g_YesNoPromptResult).l
		beq.w	_c0159Rts
		bset	#$00,(g_Flags+1).l
		clr.b	(g_AdditionalFlags+$11).l

_c0159Rts:
		rts

; Scene opener: Friday flies up and perches.
; Used by: called directly by 30 other actions.
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
