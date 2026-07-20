TriggerActions	module
; Trigger conditions for the entity behaviour scripts. Behaviour
; command $36 (EB_WaitForCondition) calls ProcessTriggerAction every
; tick with the trigger id in d0 (a5 = the waiting entity) until the
; condition holds, so a behaviour script can block on an event: the
; player standing on a particular spot, a switch weighed down, an
; enemy killed, an item obtained. Each TA_xx handler returns carry
; set (condition met - the behaviour script advances) or carry clear
; (keep waiting - tested again next tick).
;
; A word compare on Player_X tests both tile coordinates at once:
; X in the high byte, Y in the low byte.

; The two exits (IDA: TriggerComplete / TriggerCompleteOnD0): _met
; sets the carry, _notMet clears it (the tst is just a cheap
; carry-clear).
_met:
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

_notMet:
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

; Trigger $00, the King Nole's Cave boulder trap (room 159): met once
; any of sprites 1-6 has gravity enabled; gravity is then enabled on
; all six at once, with a rumble unless g_AdditionalFlags+$A bit 6
; marks the trap as already sprung.
; Used by: King Nole's Cave/1F/Boulder Trap Room/159 Ver1 (Trap Armed)
; [Large Grey Ball].
TA_00:
		lea	(Sprite1_X).l,a0
		tst.b	FallRate(a0)
		bpl.s	_ta00Release
		tst.b	$000000A0(a0)		  ; FallRate of sprites 2-6 ($80 apart)
		bpl.s	_ta00Release
		tst.b	$00000120(a0)
		bpl.s	_ta00Release
		tst.b	$000001A0(a0)
		bpl.s	_ta00Release
		tst.b	$00000220(a0)
		bpl.s	_ta00Release
		tst.b	$000002A0(a0)
		bmi.w	_notMet

_ta00Release:
		bclr	#$07,FallRate(a0)
		bclr	#$07,$000000A0(a0)
		bclr	#$07,$00000120(a0)
		bclr	#$07,$000001A0(a0)
		bclr	#$07,$00000220(a0)
		bclr	#$07,$000002A0(a0)
		btst	#$06,(g_AdditionalFlags+$A).l
		bne.w	_met
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Rumble
; ---------------------------------------------------------------------------
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $01, a pressure switch: met while some entity (the player
; included) stands on the waiting entity - SpriteUnderneath holds the
; supporting entity's struct offset, d1 the caller's own offset.
; Used by pressure-plate switch, platform and trigger-cube scripts
; game-wide (124 rooms).
TA_01:
		lea	(Player_X).l,a0
		moveq	#$0000000F,d7
		move.l	a5,d1
		subi.l	#Player_X,d1

_ta01Scan:
		tst.w	(a0)
		bmi.w	_notMet
		move.w	SpriteUnderneath(a0),d0
		bmi.s	_ta01Skip
		cmp.w	d0,d1
		beq.w	_met

_ta01Skip:
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,_ta01Scan
		bra.w	_notMet
; ---------------------------------------------------------------------------

; Trigger $02: met when no live hostile enemy remains among sprites
; 1-15 (dead enemies - health byte $FF - and sprites removed to
; X/Y $7F/$7F don't count).
; Used by monster-gate scripts (gates, chests and rewards that appear
; once the room is cleared) game-wide (105 rooms).
TA_02:
		lea	(Sprite1_X).l,a0
		moveq	#$0000000E,d7

_ta02Scan:
		move.w	(a0),d0
		bmi.w	_met
		tst.b	InteractFlags(a0)
		bpl.s	_ta02Skip
		cmpi.b	#$FF,CurrentHealth(a0)
		beq.s	_ta02Skip
		cmpi.w	#$7F7F,d0
		bne.w	_notMet

_ta02Skip:
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,_ta02Scan
		bra.w	_met
; ---------------------------------------------------------------------------

; Triggers $03-$05: met when sprite 6/7/8 is no longer hostile
; (killed), or g_Flags+$A bit 3 is set.
; Used by: Swamp Shrine/1F/006 Orc Mushroom Challenge Room [Large
; Concrete Block].
TA_03:
		tst.b	(Sprite6_InteractFlags).l
		bpl.w	_met
		btst	#$03,(g_Flags+$A).l
		bne.w	_met
		bra.w	_notMet
; ---------------------------------------------------------------------------

TA_04:
		tst.b	(Sprite7_InteractFlags).l
		bpl.w	_met
		btst	#$03,(g_Flags+$A).l
		bne.w	_met
		bra.w	_notMet
; ---------------------------------------------------------------------------

TA_05:
		tst.b	(Sprite8_InteractFlags).l
		bpl.w	_met
		btst	#$03,(g_Flags+$A).l
		bne.w	_met
		bra.w	_notMet
; ---------------------------------------------------------------------------

; Trigger $06: the inverse of TA_01 - met while nothing stands on the
; waiting entity.
; Used by: Mercator Crypt/658 Room 5, Jim Bright [Square Switch]; Lake
; Shrine/B2F/316 Silver Knight Room [Large Wood Platform].
TA_06:
		lea	(Player_X).l,a0
		moveq	#$0000000F,d7
		move.l	a5,d1
		subi.l	#Player_X,d1

_ta06Scan:
		tst.w	(a0)
		bmi.w	_met
		move.w	SpriteUnderneath(a0),d0
		bmi.s	_ta06Skip
		cmp.w	d0,d1
		beq.w	_notMet

_ta06Skip:
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,_ta06Scan
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $07: met while the player is on row Y $0F.
; Used by: Overworld/01 - Massan, Waterfall Shrine/424 Outside Massan
; [Male Red Bear].
TA_07:
		cmpi.b	#$0F,(Player_Y).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $08: met while g_Flags+2 bit 1 is clear and the player
; stands at X $35, Y $1D or $1E.
; Used by: Waterfall Shrine/1F/180 Prospero's Room [Old Man].
TA_08:
		btst	#$01,(g_Flags+2).l
		bne.w	_notMet
		cmpi.b	#$35,(Player_X).l
		bne.w	_notMet
		cmpi.b	#$1D,(Player_Y).l
		beq.w	_met
		cmpi.b	#$1E,(Player_Y).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $09: met when the player is at Y $30 and no controller
; playback is running.
; Used by: Massan/592 Massan - Outside [Male Red Bear].
TA_09:
		cmpi.b	#$30,(Player_Y).l
		bne.w	_notMet
		tst.w	(g_ControllerPlayback).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $0A: met when the player is at Y $15 (SubY < 7) facing
; rotation 0, with g_Flags+2 bit 2 set and bits 3-4 clear.
; Used by: Gumi/Gumi - Outside/601 Ver1 (Sacrifical Rites) [Male Yellow
; Bear].
TA_0A:
		cmpi.b	#$15,(Player_Y).l
		bne.w	_notMet
		cmpi.b	#$07,(Player_SubY).l
		bcc.w	_notMet
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		bne.w	_notMet
		btst	#$02,(g_Flags+2).l
		beq.w	_notMet
		move.b	(g_Flags+2).l,d0
		andi.b	#$18,d0
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $0B: met when the player is at X $16, Y $28 (SubY >= 7) and
; g_Flags+2 has bit 2 set with bit 4 clear.
; Used by: Gumi/Gumi - Outside/601 Ver1 (Sacrifical Rites) [Male Yellow
; Bear].
TA_0B:
		cmpi.w	#$1628,(Player_X).l
		bne.w	_notMet
		cmpi.b	#$07,(Player_SubY).l
		bcs.w	_notMet
		move.b	(g_Flags+2).l,d0
		andi.b	#$14,d0
		cmpi.b	#$04,d0
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $0C: met when the player stands still (PrevAction 0) at
; X $18, Y $28, Z $60.
; Used by: Gumi/Gumi - Outside/601 Ver1 (Sacrifical Rites) [Male Yellow
; Bear].
TA_0C:
		cmpi.w	#$1828,(Player_X).l
		bne.w	_notMet
		cmpi.w	#$0060,(Player_Z).l
		bne.w	_notMet
		tst.w	(Player_PrevAction).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $0D: met when the player is at Y $22 on floor height $20.
; Used by: Swamp Shrine/4F/028 Orc King Room [Praying Yellow Bear].
TA_0D:
		cmpi.b	#$22,(Player_Y).l
		bne.w	_notMet
		cmpi.b	#$20,(Player_FloorHeight).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $0E: met when the player rests (not falling) at Z $40 within
; X $1C-$1E, Y $13-$15.
; Used by: Swamp Shrine/4F/028 Orc King Room [Fara stake].
TA_0E:
		cmpi.b	#$1C,(Player_X).l
		bcs.w	_notMet
		cmpi.b	#$13,(Player_Y).l
		bcs.w	_notMet
		cmpi.b	#$1E,(Player_X).l
		bhi.w	_notMet
		cmpi.b	#$15,(Player_Y).l
		bhi.w	_notMet
		tst.w	(Player_FallRate).l
		bne.w	_notMet
		cmpi.w	#$0040,(Player_Z).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $0F: met while g_Flags bit 5 is clear and the player stands
; at X $1E, Y $21-$22.
; Used by: King Nole's Cave/1F/148 Outside [Invisible Cube].
TA_0F:
		btst	#$05,(g_Flags).l
		bne.w	_notMet
		cmpi.b	#$1E,(Player_X).l
		bne.w	_notMet
		cmpi.b	#$21,(Player_Y).l
		beq.s	_ta0FMet
		cmpi.b	#$22,(Player_Y).l
		bne.w	_notMet

_ta0FMet:
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $10: met when the player is at X $27, Y $26 with SubY 7-8.
; Used by: Ryuma/183 Thieves' Hideout [Invisible Cube].
TA_10:
		cmpi.b	#$27,(Player_X).l
		bne.w	_notMet
		cmpi.b	#$26,(Player_Y).l
		bne.w	_notMet
		cmpi.b	#$08,(Player_SubY).l
		beq.w	_met
		cmpi.b	#$07,(Player_SubY).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $11: met when the player is fully idle (whole action long
; clear) at Z 8.
; Used by: Ryuma/183 Thieves' Hideout [Invisible Cube].
TA_11:
		cmpi.w	#$0008,(Player_Z).l
		bne.w	_notMet
		tst.l	(Player_Action).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $12: met once the player reaches Y >= $27.
; Used by: Ryuma/183 Thieves' Hideout [Invisible Cube].
TA_12:
		cmpi.b	#$27,(Player_Y).l
		bcs.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $13: met once the player reaches Y <= $20.
; Used by: Thieves' Hideout/1F/Entrance Room/185 Ver1 (water) [Invisible
; Cube]; Thieves' Hideout/1F/Entrance Room/186 Ver2 (no water)
; [Invisible Cube].
TA_13:
		cmpi.b	#$20,(Player_Y).l
		bhi.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $14: met when the player is at X $34-$35, Y $21 with
; SubY 7-8.
; Used by: Thieves' Hideout/1F/Entrance Room/185 Ver1 (water) [Invisible
; Cube]; Thieves' Hideout/1F/Entrance Room/186 Ver2 (no water)
; [Invisible Cube].
TA_14:
		move.b	(Player_X).l,d0
		andi.b	#$FE,d0
		cmpi.b	#$34,d0
		bne.w	_notMet
		cmpi.b	#$21,(Player_Y).l
		bne.w	_notMet
		cmpi.b	#$08,(Player_SubY).l
		beq.w	_met
		cmpi.b	#$07,(Player_SubY).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $15: same as TA_11 - fully idle at Z 8.
; Used by: Thieves' Hideout/1F/Entrance Room/185 Ver1 (water) [Invisible
; Cube]; Thieves' Hideout/1F/Entrance Room/186 Ver2 (no water)
; [Invisible Cube].
TA_15:
		cmpi.w	#$0008,(Player_Z).l
		bne.w	_notMet
		tst.l	(Player_Action).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $16: met when the player reaches X $18, Y $19 (SubX < 7);
; rumbles and restores the waiting entity's full speed by clearing
; its half-speed StateFlags bit 4.
; Used by: Thieves' Hideout/3F/Godess Statue Room/219 Ver1 (water)
; [Godess Statue].
TA_16:
		cmpi.w	#$1819,(Player_X).l
		bne.w	_notMet
		cmpi.b	#$07,(Player_SubX).l
		bcc.w	_notMet
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_Rumble
; ---------------------------------------------------------------------------
		bclr	#$04,StateFlags(a5)
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $17: met while controller playback sequence $0A runs and
; g_Flags+4 bit 1 is clear.
; Used by: Thieves' Hideout/4F/Treasure Room/224 Ver1 (with prisoners)
; [Invisible Cube].
TA_17:
		cmpi.b	#$0A,(g_ControllerPlayback).l
		bne.w	_notMet
		btst	#$01,(g_Flags+4).l
		beq.w	_met
		bra.w	_notMet
; ---------------------------------------------------------------------------

; Trigger $18: met once the player reaches X < $1C.
; Used by: Thieves' Hideout/4F/226 Cliff Top with Silver Knight
; [Invisible Cube, Knight 2, Small Thin Grey Platform].
TA_18:
		cmpi.b	#$1C,(Player_X).l
		bcc.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $19: met when the player is at X >= $2C on row Y $21.
; Used by: Gumi/Gumi - Outside/602 Ver2 (Deserted) [Pockets].
TA_19:
		cmpi.b	#$2C,(Player_X).l
		bcs.w	_notMet
		cmpi.b	#$21,(Player_Y).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $1A: met when the player reaches X $24; starts Kayla's
; music.
; Used by: Ryuma/183 Thieves' Hideout [Raft].
TA_1A:
		cmpi.b	#$24,(Player_X).l
		bne.w	_notMet
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicKayla
; ---------------------------------------------------------------------------
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $1B: met when the player is at X $13, Y $21-$23.
; Used by: Overworld/03 - Gumi, Ryuma, Mercator/454 Mercator 1 (Gate)
; [Soldier].
TA_1B:
		cmpi.b	#$13,(Player_X).l
		bne.w	_notMet
		cmpi.b	#$21,(Player_Y).l
		bcs.w	_notMet
		cmpi.b	#$23,(Player_Y).l
		bhi.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $1C: met when the player is on row Y $0F at X $25-$28.
; Used by: Mercator/Center/630 Ver1 (First Visit) [Soldier].
TA_1C:
		cmpi.b	#$0F,(Player_Y).l
		bne.w	_notMet
		cmpi.b	#$25,(Player_X).l
		bcs.w	_notMet
		cmpi.b	#$28,(Player_X).l
		bhi.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $1D: met when the player is within X $25-$27, Y $32-$34.
; Used by: Mercator/East/633 Ver1 (First Visit) [Boy].
TA_1D:
		cmpi.b	#$25,(Player_X).l
		bcs.w	_notMet
		cmpi.b	#$27,(Player_X).l
		bhi.w	_notMet
		cmpi.b	#$32,(Player_Y).l
		bcs.w	_notMet
		cmpi.b	#$34,(Player_Y).l
		bhi.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $1E: same as TA_06 - met while nothing stands on the
; waiting entity.
; Used by toggle-switch scripts game-wide (32 rooms), always paired with
; TA_01.
TA_1E:
		lea	(Player_X).l,a0
		moveq	#$0000000F,d7
		move.l	a5,d1
		subi.l	#Player_X,d1

_ta1EScan:
		tst.w	(a0)
		bmi.w	_met
		move.w	SpriteUnderneath(a0),d0
		bmi.s	_ta1ESkip
		cmp.w	d0,d1
		beq.w	_notMet

_ta1ESkip:
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,_ta1EScan
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $1F: met while sprite 2 stands on sprite 3, 4 or 5
; (SpriteUnderneath $180/$200/$280 = the supporter's struct offset).
; Used by: Mercator/Center/Interior/672 Greenpea's [Man 2].
TA_1F:
		cmpi.w	#$0180,(Sprite2_SpriteUnderneath).l
		beq.s	_ta1FMet
		cmpi.w	#$0200,(Sprite2_SpriteUnderneath).l
		beq.s	_ta1FMet
		cmpi.w	#$0280,(Sprite2_SpriteUnderneath).l
		bne.w	_notMet

_ta1FMet:
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $20: met when sprite 2 is idle (no walk/fall/jump action
; bits) and on the floor (Z low byte == FloorHeight) at X < $15, or
; X $15 with SubX < 8.
; Used by: Mercator/Center/Interior/672 Greenpea's [Invisible Cube].
TA_20:
		move.b	(Sprite2_Action+1).l,d0
		andi.b	#$3F,d0
		bne.w	_notMet
		cmpi.b	#$15,(Sprite2_X).l
		bhi.w	_notMet
		bne.s	_ta20Floor
		cmpi.b	#$08,(Sprite2_SubX).l
		bcc.w	_notMet

_ta20Floor:
		move.b	(Sprite2_FloorHeight).l,d0
		cmp.b	(Sprite2_Z+1).l,d0
		beq.w	_met
		bra.w	_notMet
; ---------------------------------------------------------------------------

; Trigger $21: like TA_1F, but also records which of sprites 3/4/5
; carries sprite 2 by setting g_Flags+1 bit 1/2/3.
; Used by: Mercator/Center/Interior/672 Greenpea's [Man 2].
TA_21:
		move.b	#$01,d0
		cmpi.w	#$0180,(Sprite2_SpriteUnderneath).l
		beq.s	_ta21SetFlag
		move.b	#$02,d0
		cmpi.w	#$0200,(Sprite2_SpriteUnderneath).l
		beq.s	_ta21SetFlag
		move.b	#$03,d0
		cmpi.w	#$0280,(Sprite2_SpriteUnderneath).l
		bne.w	_notMet

_ta21SetFlag:
		bset	d0,(g_Flags+1).l
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $22: met while sprites 1-7 all rest on the floor (Z low
; byte == FloorHeight) on ground type $0E.
; Used by: Mercator/Center/Interior/709 Old Woman's House, 2F [Old
; Lady].
TA_22:
		lea	(Sprite1_X).l,a0
		moveq	#$00000006,d7

_ta22Scan:
		move.b	$00000023(a0),d0	  ; GroundType
		andi.b	#$3F,d0
		cmpi.b	#$0E,d0
		bne.w	_notMet
		move.b	$00000013(a0),d0	  ; Z low byte
		cmp.b	$00000039(a0),d0	  ; FloorHeight
		bne.w	_notMet
		lea	$00000080(a0),a0
		dbf	d7,_ta22Scan
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $23: met once the player reaches Y <= $18.
; Used by: Mercator/East/Interior/Madame Yard's/707 2F Hallway [Woman
; 3].
TA_23:
		cmpi.b	#$18,(Player_Y).l
		bhi.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $24: met when the player is at exactly X $12, Y $1B with
; SubX/SubY $8/$8.
; Used by: Mercator/East/Interior/Madame Yard's/707 2F Hallway [Lord
; Arthur].
TA_24:
		cmpi.w	#$121B,(Player_X).l
		bne.w	_notMet
		cmpi.w	#$0808,(Player_SubX).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $25: met when the player is at Y $18, SubY 8.
; Used by: Mercator Castle/1F/Entrance Hall/055 Ver1 (First Visit) [Old
; Man]; Mercator Castle/1F/Entrance Hall/057 Ver3 (Return from Mir's
; Tower) [Old Man].
TA_25:
		cmpi.b	#$18,(Player_Y).l
		bne.w	_notMet
		cmpi.b	#$08,(Player_SubY).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $26: met when the player is at X $16, SubX 8.
; Used by: Mercator Castle/3F/Bathroom/101 Ver1 (Kayla) [Kayla in Bath].
TA_26:
		cmpi.b	#$16,(Player_X).l
		bne.w	_notMet
		cmpi.b	#$08,(Player_SubX).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $27: met when the player is at X $18-$19, Y $0D; starts
; Kayla's music and sets the player walking backwards (CombatFlags
; bit 1).
; Used by: Mercator Castle/3F/Kayla's Room/098 Ver1 (Ink & Wally) [Ink,
; Invisible Cube, Wally].
TA_27:
		move.b	(Player_X).l,d0
		andi.b	#$FE,d0
		cmpi.b	#$18,d0
		bne.w	_notMet
		cmpi.b	#$0D,(Player_Y).l
		bne.w	_notMet
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_MusicKayla
; ---------------------------------------------------------------------------
		bset	#$01,(Player_CombatFlags).l
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $28: met when the player is at Y $1B, SubY 8.
; Used by: Mercator Castle/2F/085 Banquet Hall [Woman 1].
TA_28:
		cmpi.b	#$1B,(Player_Y).l
		bne.w	_notMet
		cmpi.b	#$08,(Player_SubY).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $29: met when the player is at X $18, SubX 8.
; Used by: Mercator Castle/3F/097 Nigel's Room [Invisible Cube].
TA_29:
		cmpi.b	#$18,(Player_X).l
		bne.w	_notMet
		cmpi.b	#$08,(Player_SubX).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $2A: met when the player is at X $16 (SubX 8), Y $11-$12.
; Used by: Mercator Castle/1F/Entrance Hall/056 Ver2 (Banquet) [Woman
; 2].
TA_2A:
		cmpi.b	#$16,(Player_X).l
		bne.w	_notMet
		cmpi.b	#$11,(Player_Y).l
		beq.s	_ta2ASubX
		cmpi.b	#$12,(Player_Y).l
		bne.w	_notMet

_ta2ASubX:
		cmpi.b	#$08,(Player_SubX).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $2B: met when the player is at X $15, SubX 8.
; Used by: Thieves' Hideout/4F/Treasure Room/224 Ver1 (with prisoners)
; [Invisible Cube].
TA_2B:
		cmpi.b	#$15,(Player_X).l
		bne.w	_notMet
		cmpi.b	#$08,(Player_SubX).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $2C: met when sprite 1's hitbox top (HitBoxZEnd low byte)
; is at height $17.
; Used by: Thieves' Hideout/4F/Treasure Room/224 Ver1 (with prisoners)
; [Yellow Old Man].
TA_2C:
		cmpi.b	#$17,(Sprite1_HitBoxZEnd+1).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $2D: met while the player stands on any sprite.
; Used by: Lake Shrine/B1F/301 Green Golem Crossroads [Invisible Cube];
; Lake Shrine/B3F/332 Golden Golem Crossroads [Invisible Cube]; Lake
; Shrine/B3F/351 Silver Golem Crossroads [Invisible Cube].
TA_2D:
		tst.w	(Player_SpriteUnderneath).l
		bmi.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $2E: met when the player is at Y $19 on floor height $20.
; Used by: Mercator/East/Interior/Monster Prison/681 Ver1 (Monsters)
; [Dexter].
TA_2E:
		cmpi.b	#$19,(Player_Y).l
		bne.w	_notMet
		cmpi.b	#$20,(Player_FloorHeight).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $2F: met when the player is within X $22-$23, Y $20-$21 at
; Z $10.
; Used by: Mercator Castle/1F/Outside West/032 Ver1 (First Visit) [Blue
; Ribbon].
TA_2F:
		move.w	(Player_X).l,d0
		andi.w	#$FEFE,d0
		cmpi.w	#$2220,d0
		bne.w	_notMet
		cmpi.b	#$10,(Player_Z+1).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $30: met when sprite 1 has gravity enabled and is not
; hostile while sprites 2 and 3 are still hostile.
; Used by: Mercator Crypt/655 Room 1, Betty Ross [Invisible Cube].
TA_30:
		tst.b	(Sprite1_FallRate).l
		bmi.w	_notMet
		tst.b	(Sprite1_InteractFlags).l
		bmi.w	_notMet
		tst.b	(Sprite2_InteractFlags).l
		bpl.w	_notMet
		tst.b	(Sprite3_InteractFlags).l
		bpl.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $31: met when sprite 2 is no longer hostile while sprite 3
; still is.
; Used by: Mercator Crypt/655 Room 1, Betty Ross [Invisible Cube].
TA_31:
		tst.b	(Sprite2_InteractFlags).l
		bmi.w	_notMet
		tst.b	(Sprite3_InteractFlags).l
		bpl.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $32: met when sprite 3 is no longer hostile.
; Used by: Mercator Crypt/655 Room 1, Betty Ross [Invisible Cube].
TA_32:
		tst.b	(Sprite3_InteractFlags).l
		bmi.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $33: met while the player falls, jumps, swings the sword or
; takes damage ($2730 = action bits 4-5, 8-10, 13).
; Used by: Mercator Crypt/654 Room 2, Ruby Silent [Invisible Cube].
TA_33:
		move.w	(Player_Action).l,d0
		andi.w	#$2730,d0
		beq.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $34: met when the player is at X $1C, Y $14.
; Used by: Mercator Crypt/653 Room 3, Jack Skywalker [Invisible Cube].
TA_34:
		cmpi.w	#$1C14,(Player_X).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $35: met while the player swings the sword ($0700 = action
; bits 8-10).
; Used by: Mercator Crypt/659 Room 4, Maria Hysterica [Invisible Cube].
TA_35:
		move.w	(Player_Action).l,d0
		andi.w	#$0700,d0
		beq.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $36, a one-shot area latch: while g_Flags+$15 bit 4 is
; clear, met as long as the player avoids the six listed tiles;
; stepping on one sets the latch and the trigger never fires again.
; Used by: Mercator Crypt/658 Room 5, Jim Bright [Invisible Cube].
TA_36:
		btst	#$04,(g_Flags+$15).l
		bne.w	_notMet
		cmpi.w	#$1317,(Player_X).l
		beq.s	_ta36Latch
		cmpi.w	#$1416,(Player_X).l
		beq.s	_ta36Latch
		cmpi.w	#$1315,(Player_X).l
		beq.s	_ta36Latch
		cmpi.w	#$1313,(Player_X).l
		beq.s	_ta36Latch
		cmpi.w	#$1412,(Player_X).l
		beq.s	_ta36Latch
		cmpi.w	#$1311,(Player_X).l
		beq.s	_ta36Latch
		bra.w	_met
; ---------------------------------------------------------------------------

_ta36Latch:
		bset	#$04,(g_Flags+$15).l
		bra.w	_notMet
; ---------------------------------------------------------------------------

; Trigger $37: met once any of sprites 1-4 is an opened chest.
; Used by: Mercator Crypt/657 Room 6, Larson E [Invisible Cube].
TA_37:
		lea	(Sprite1_X).l,a1
		jsr	(j_CheckIfChestOpened).l
		bne.w	_met
		lea	(Sprite2_X).l,a1
		jsr	(j_CheckIfChestOpened).l
		bne.w	_met
		lea	(Sprite3_X).l,a1
		jsr	(j_CheckIfChestOpened).l
		bne.w	_met
		lea	(Sprite4_X).l,a1
		jsr	(j_CheckIfChestOpened).l
		bne.w	_met
		bra.w	_notMet
; ---------------------------------------------------------------------------

; Trigger $38: met when sprite 1 is not hostile while sprites 2-4
; are; sprites 2-4 are then hidden.
; Used by: Mercator Crypt/652 Room 7, Dirk the Dark [Invisible Cube].
TA_38:
		tst.b	(Sprite1_InteractFlags).l
		bmi.w	_notMet
		tst.b	(Sprite2_InteractFlags).l
		bpl.w	_notMet
		tst.b	(Sprite3_InteractFlags).l
		bpl.w	_notMet
		tst.b	(Sprite4_InteractFlags).l
		bpl.w	_notMet
		movem.l	a5,-(sp)
		lea	(Sprite2_X).l,a5
		jsr	(j_HideSprite).l
		lea	(Sprite3_X).l,a5
		jsr	(j_HideSprite).l
		lea	(Sprite4_X).l,a5
		jsr	(j_HideSprite).l
		movem.l	(sp)+,a5
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $39: met when the player is at X $27, Y $3D, Z $18.
; Used by: Mercator Crypt/647 Main Hallway [Mummy 1].
TA_39:
		cmpi.w	#$273D,(Player_X).l
		bne.w	_notMet
		cmpi.w	#$0018,(Player_Z).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $3A: met once the player owns the Armlet.
; Used by: Mercator Crypt/651 Armlet Room [Invisible Cube].
TA_3A:
		move.b	#ITM_ARMLET,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $3B: met when the player is at X $15-$16, Y $1B.
; Used by: Overworld/04 - Mercator, Verla Tunnel, Mir's Tower/475 Mir's
; Tower 1 (Outside) [Invisible Cube].
TA_3B:
		cmpi.b	#$15,(Player_X).l
		beq.s	_ta3BY
		cmpi.b	#$16,(Player_X).l
		bne.w	_notMet

_ta3BY:
		cmpi.b	#$1B,(Player_Y).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $3C: met once g_Flags+1 bit 0 or g_Flags+$16 bit 7 is set.
; Used by: Mir's Tower/1F/751 Entrance [Gate S].
TA_3C:
		btst	#$00,(g_Flags+1).l
		bne.w	_met
		btst	#$07,(g_Flags+$16).l
		bne.w	_met
		bra.w	_notMet
; ---------------------------------------------------------------------------

; Trigger $3D: met when the player is at Y $11 with SubY > 8.
; Used by: Mir's Tower/3F/758 Miro's Room [Nigel].
TA_3D:
		cmpi.b	#$11,(Player_Y).l
		bne.w	_notMet
		cmpi.b	#$08,(Player_SubY).l
		bls.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $3E: met when the player is on row Y $19.
; Used by: Mir's Tower/3F/762 Hidden Door Room [Nigel].
TA_3E:
		cmpi.b	#$19,(Player_Y).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $3F: met when the player is at Z $20 on floor height $20.
; Used by: Mir's Tower/6F/778 Giants [Nigel].
TA_3F:
		cmpi.b	#$20,(Player_FloorHeight).l
		bne.w	_notMet
		cmpi.w	#$0020,(Player_Z).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $40: met when the player is at X $17, Y <= $15.
; Used by: Mir's Tower/7F/779 Locked Door [Nigel].
TA_40:
		cmpi.b	#$17,(Player_X).l
		bne.w	_notMet
		cmpi.b	#$15,(Player_Y).l
		bhi.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $41: met when the player is at X $14, Y <= $16.
; Used by: Mir's Tower/9F/783 Steps to Top [Nigel].
TA_41:
		cmpi.b	#$14,(Player_X).l
		bne.w	_notMet
		cmpi.b	#$16,(Player_Y).l
		bhi.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $42: met when the player is within X <= $17, Y <= $19.
; Used by: Mir's Tower/8F/782 Skeletons, Miro [Nigel].
TA_42:
		cmpi.b	#$17,(Player_X).l
		bhi.w	_notMet
		cmpi.b	#$19,(Player_Y).l
		bhi.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $43: met when sprite 9's health drops below 100 ($64) HP.
; Used by: Mir's Tower/8F/782 Skeletons, Miro [Invisible Cube].
TA_43:
		cmpi.w	#$6400,(Sprite9_CurrentHealth).l
		bcc.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $44: met when sprite 4's health drops below 100 ($64) HP.
; Used by: Mir's Tower/10F/784 Mir's Room [Invisible Cube].
TA_44:
		cmpi.w	#$6400,(Sprite4_CurrentHealth).l
		bcc.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $45: met once the player owns the Purple Jewel.
; Used by: Mir's Tower/8F/781 Jewel Room [Invisible Cube].
TA_45:
		move.b	#ITM_PURPLEJEWEL,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $46: met while the player is within X $31-$33, Y $1B-$1D.
; Used by: Mir's Tower/8F/781 Jewel Room [Invisible Cube].
TA_46:
		move.b	(Player_X).l,d0
		subi.b	#$31,d0
		cmpi.b	#$03,d0
		bcc.w	_notMet
		move.b	(Player_Y).l,d0
		subi.b	#$1B,d0
		cmpi.b	#$03,d0
		bcc.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $47: the inverse of TA_46 - met while the player is outside
; X $31-$33, Y $1B-$1D.
; Used by: Mir's Tower/8F/781 Jewel Room [Invisible Cube].
TA_47:
		move.b	(Player_X).l,d0
		subi.b	#$31,d0
		cmpi.b	#$03,d0
		bcc.w	_met
		move.b	(Player_Y).l,d0
		subi.b	#$1B,d0
		cmpi.b	#$03,d0
		bcs.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $48: met when the controller playback timer reads $FE.
; Used by: Mercator Castle/1F/Throne Room/053 Ver3 (Duke & Kayla) [Old
; Man].
TA_48:
		cmpi.b	#$FE,(g_ControllerPlaybackTimer).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $49: met when the player is on column X $1F.
; Used by: Mercator Castle/B2F/081 Kayla Trap Room [Invisible Cube].
TA_49:
		cmpi.b	#$1F,(Player_X).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $4A: met when the player is on row Y $11.
; Used by: Mercator Castle/B1F/043 Cell 3 (Maid) [Woman 2].
TA_4A:
		cmpi.b	#$11,(Player_Y).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $4B: met when the player is at X $1C, Y <= $19.
; Used by: Mercator Castle/2F/090 West Tower [Knight 1].
TA_4B:
		cmpi.b	#$1C,(Player_X).l
		bne.w	_notMet
		cmpi.b	#$19,(Player_Y).l
		bhi.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $4C: met when the player is on row Y $1F.
; Used by: Mercator Castle/3F/104 West Tower [Gate S, Knight 1].
TA_4C:
		cmpi.b	#$1F,(Player_Y).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $4D: met when the player is on row Y $1D.
; Used by: Mercator Castle/4F/105 Tower Bedroom Entrance [Knight 1].
TA_4D:
		cmpi.b	#$1D,(Player_Y).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $4E: met when the player is at X >= $12 on row Y $0F.
; Used by: Mercator Castle/4F/108 West Tower Bedroom [Princess].
TA_4E:
		cmpi.b	#$12,(Player_X).l
		bcs.w	_notMet
		cmpi.b	#$0F,(Player_Y).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $4F: met when the player is on row Y $11.
; Used by: Mercator Castle/B1F/044 Cell 4 (Empty with Hidden Door)
; [Moralis].
TA_4F:
		cmpi.b	#$11,(Player_Y).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $50: met when the player is at X $27, Y $2A.
; Used by: Greenmaze/Overground/563 South (Gnome Dance) [Gnome].
TA_50:
		cmpi.w	#$272A,(Player_X).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $51: met when the player is at X $26 (SubX >= 8), Y $2E.
; Used by: Greenmaze/Overground/560 West (Einstein, Cutter) [Gnome].
TA_51:
		cmpi.w	#$262E,(Player_X).l
		bne.w	_notMet
		cmpi.b	#$08,(Player_SubX).l
		bcs.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $52: met when the player is at X >= $2C on row Y $25.
; Used by: Greenmaze/Overground/562 Southeast [Gnome].
TA_52:
		cmpi.b	#$2C,(Player_X).l
		bcs.w	_notMet
		cmpi.b	#$25,(Player_Y).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $53: met when the player is at X $22, Y $25 (SubY >= 7).
; Used by: Greenmaze/Overground/567 Northeast (Vines) [Gnome].
TA_53:
		cmpi.w	#$2225,(Player_X).l
		bne.w	_notMet
		cmpi.b	#$07,(Player_SubY).l
		bcs.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $54: met when the player is at X $37, Y $15.
; Used by: Greenmaze/Overground/567 Northeast (Vines) [Gnome].
TA_54:
		cmpi.w	#$3715,(Player_X).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $55: met when the player is at X $37 (SubX >= 6), Y $19.
; Used by: Greenmaze/Overground/567 Northeast (Vines) [Invisible Cube].
TA_55:
		cmpi.w	#$3719,(Player_X).l
		bne.w	_notMet
		cmpi.b	#$06,(Player_SubX).l
		bcs.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $56: met while the player is within X $2E-$30, Y $15-$16.
; Used by: Greenmaze/Overground/560 West (Einstein, Cutter) [Injured
; Dog].
TA_56:
		move.b	(Player_X).l,d0
		subi.b	#$2E,d0
		cmpi.b	#$03,d0
		bcc.w	_notMet
		move.b	(Player_Y).l,d0
		subq.b	#$01,d0
		andi.b	#$FE,d0
		cmpi.b	#$14,d0
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $57: met while the player is outside the strip X $27-$3A,
; Y $15-$16.
; Used by: Greenmaze/Overground/560 West (Einstein, Cutter) [Injured
; Dog].
TA_57:
		move.b	(Player_X).l,d0
		subi.b	#$27,d0
		cmpi.b	#$14,d0
		bcc.w	_met
		move.b	(Player_Y).l,d0
		subq.b	#$01,d0
		andi.b	#$FE,d0
		cmpi.b	#$14,d0
		bne.w	_met
		bra.w	_notMet
; ---------------------------------------------------------------------------

; Trigger $58: met while the player walks, falls or jumps (action
; bits 0-5).
; Used by: Greenmaze/Overground/560 West (Einstein, Cutter) [Dog].
TA_58:
		move.b	(Player_Action+1).l,d0
		andi.b	#$3F,d0
		beq.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $59: met when the player is at X $23, Y $15-$16.
; Used by: Greenmaze/Overground/560 West (Einstein, Cutter) [Dog].
TA_59:
		cmpi.b	#$23,(Player_X).l
		bne.w	_notMet
		move.b	(Player_Y).l,d0
		subi.b	#$15,d0
		cmpi.b	#$02,d0
		bcc.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $5A: met when the player is at X $1E, Y $1E.
; Used by: Greenmaze/Overground/560 West (Einstein, Cutter) [Dog].
TA_5A:
		cmpi.w	#$1E1E,(Player_X).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $5B: met when the player is at X $37, Y $1A.
; Used by: Overworld/06 - Massan, Greenmaze/532 Massan 1 (Underground
; Passage) [Invisible Cube].
TA_5B:
		cmpi.w	#$371A,(Player_X).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $5C: met when the player is at X $11, Y $2D.
; Used by: Greenmaze/Central Underpass/580 West Exit [Invisible Cube].
TA_5C:
		cmpi.w	#$112D,(Player_X).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $5D: met when the player is at X $18, Y $16.
; Used by: Greenmaze/Underpass - W, NW, SE/590 Southeast Exit [Invisible
; Cube]; Greenmaze/Underpass - SW, SE/589 Southeast Exit [Invisible
; Cube]; Greenmaze/Central Underpass/581 East Exit [Invisible Cube].
TA_5D:
		cmpi.w	#$1816,(Player_X).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $5E: met when the player is at X $2F, Y $1E-$21.
; Used by: Greenmaze/Overground/564 East (Sun Stone) [Invisible Cube].
TA_5E:
		cmpi.b	#$2F,(Player_X).l
		bne.w	_notMet
		move.b	(Player_Y).l,d0
		subi.b	#$1E,d0
		cmpi.b	#$04,d0
		bcc.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $5F: met once g_Flags+1 bits 0-3 are all set (the bits
; triggers like TA_21/TA_76 maintain).
; Used by multi-switch puzzle rewards (gates, chests, platforms) in
; seven rooms across Destel Well, Mercator Castle, Lake Shrine and the
; Labyrinth.
TA_5F:
		move.b	(g_Flags+1).l,d0
		andi.b	#$0F,d0
		cmpi.b	#$0F,d0
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $60: met once the player owns the Sun Stone.
; Used by: Greenmaze/Overground/564 East (Sun Stone) [Invisible Cube].
TA_60:
		move.b	#ITM_SUNSTONE,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $61: met when the player is at X $20-$21, Y $28.
; Used by: Verla/Verla - Outside/711 Ver1 (Before Rescue) [Knight 2].
TA_61:
		move.b	(Player_X).l,d0
		andi.b	#$FE,d0
		cmpi.b	#$20,d0
		bne.w	_notMet
		cmpi.b	#$28,(Player_Y).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $62: same as TA_02 - met when no live hostile enemy remains
; - with the field offsets written out ($C = InteractFlags, $3E =
; CurrentHealth).
; Used by monster-gate scripts in 14 rooms, mainly around Verla and
; Verla Mine.
TA_62:
		lea	(Sprite1_X).l,a0
		moveq	#$0000000E,d7

_ta62Scan:
		move.w	(a0),d0
		bmi.w	_notMet
		tst.b	$0000000C(a0)
		bpl.s	_ta62Skip
		cmpi.b	#$FF,$0000003E(a0)
		beq.s	_ta62Skip
		cmpi.w	#$7F7F,d0
		bne.w	_met

_ta62Skip:
		lea	$00000080(a0),a0
		dbf	d7,_ta62Scan
		bra.w	_notMet
; ---------------------------------------------------------------------------

; Trigger $63: met when the player is on row Y $1A.
; Used by: Verla/House 2/722 Ver1 (Before Rescue) [Knight 3].
TA_63:
		cmpi.b	#$1A,(Player_Y).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $64: met when the player is at X $21, Y $3B-$3C.
; Used by: Greenmaze/Overground/567 Northeast (Vines) [Ink, Kayla,
; Wally].
TA_64:
		cmpi.b	#$21,(Player_X).l
		bne.w	_notMet
		move.b	(Player_Y).l,d0
		subq.b	#$01,d0
		andi.b	#$FE,d0
		cmpi.b	#$3A,d0
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $65: met when the player is at X $13, Y $13-$15.
; Used by: Mercator Crypt/650 Room 9, Dead and End [Dexter].
TA_65:
		cmpi.b	#$13,(Player_X).l
		bne.w	_notMet
		move.b	(Player_Y).l,d0
		subi.b	#$13,d0
		cmpi.b	#$03,d0
		bcc.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $66: met when the player is at X $15-$16, Y $10.
; Used by: Mercator Crypt/650 Room 9, Dead and End [Small Fireball].
TA_66:
		cmpi.b	#$10,(Player_Y).l
		bne.w	_notMet
		move.b	(Player_X).l,d0
		subi.b	#$15,d0
		cmpi.b	#$02,d0
		bcc.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $67: met when the player is at X $2B-$2C, Y $17.
; Used by: Overworld/09 - Destel, Lake/488 Lake (Duke Cutscene) [Duke
; Chair].
TA_67:
		move.b	(Player_X).l,d0
		subi.b	#$2B,d0
		cmpi.b	#$02,d0
		bcc.w	_notMet
		cmpi.b	#$17,(Player_Y).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $68: met when the player is at X $31, Y $2B.
; Used by: Overworld/09 - Destel, Lake/525 Lake (Hill, Duke Cutscene)
; [Raft].
TA_68:
		cmpi.w	#$312B,(Player_X).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $69: met while g_AdditionalFlags+$A bit 4 is clear and the
; player stands at X $22-$24, Y $20, Z >= $40, facing rotation 0.
; Used by: Mercator/Harbour/Wholesale Shop B1F/661 Ver2 (Items)
; [Invisible Cube].
TA_69:
		btst	#$04,(g_AdditionalFlags+$A).l
		bne.w	_notMet
		move.b	(Player_X).l,d0
		subi.b	#$22,d0
		cmpi.b	#$03,d0
		bcc.w	_notMet
		cmpi.b	#$20,(Player_Y).l
		bne.w	_notMet
		cmpi.w	#$0040,(Player_Z).l
		bcs.w	_notMet
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $6A: met once sprites 1-4 and 9-12 are all removed
; (X byte $7F).
; Used by: Mercator/Harbour/Wholesale Shop B1F/661 Ver2 (Items)
; [Invisible Cube].
TA_6A:
		lea	(Sprite1_X).l,a0
		cmpi.b	#$7F,(a0)
		bne.w	_notMet
		cmpi.b	#$7F,$00000080(a0)
		bne.w	_notMet
		cmpi.b	#$7F,$00000100(a0)
		bne.w	_notMet
		cmpi.b	#$7F,$00000180(a0)
		bne.w	_notMet
		cmpi.b	#$7F,$00000400(a0)
		bne.w	_notMet
		cmpi.b	#$7F,$00000480(a0)
		bne.w	_notMet
		cmpi.b	#$7F,$00000500(a0)
		bne.w	_notMet
		cmpi.b	#$7F,$00000580(a0)
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $6B: met when sprite 5's health drops below 100 ($64) HP.
; Used by: Lake Shrine/B3F/348 Treasure Room [Invisible Cube].
TA_6B:
		cmpi.w	#$6400,(Sprite5_CurrentHealth).l
		bcc.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $6C: met when the player is at X $16, Y $13.
; Used by: Lake Shrine/B3F/348 Treasure Room [Zak].
TA_6C:
		cmpi.w	#$1613,(Player_X).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $6D: met when the player is at X >= $29, Y $2D on floor
; height $F0.
; Used by: Mountainous Region/Overground/486 Northeast (Godess Statue,
; Bridge) [Zak].
TA_6D:
		cmpi.b	#$29,(Player_X).l
		bcs.w	_notMet
		cmpi.b	#$2D,(Player_Y).l
		bne.w	_notMet
		cmpi.b	#$F0,(Player_FloorHeight).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $6E: met when sprite 4's health drops below 100 ($64) HP.
; Used by: Mountainous Region/Overground/492 North (Zak) [Invisible
; Cube].
TA_6E:
		cmpi.w	#$6400,(Sprite4_CurrentHealth).l
		bcc.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $6F: met once the player owns Axe Magic.
; Only behaviour script 631 waits on this, and no room entity uses that
; script.
TA_6F:
		move.b	#ITM_AXEMAGIC,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $70: met when the player is at X $20, Y $1D facing
; rotation 3.
; Used by: Tibor/533 - Entrance [Invisible Cube].
TA_70:
		cmpi.w	#$201D,(Player_X).l
		bne.w	_notMet
		move.b	(Player_RotationAndSize).l,d0
		andi.b	#$C0,d0
		cmpi.b	#$C0,d0
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $71: met when the controller playback word reads $FE.
; Used by: Intro/Jypta Ruins/140 Pillar Jump Puzzle [Invisible Cube];
; Intro/Jypta Ruins/141 Statue of Jypta Room [Invisible Cube].
TA_71:
		cmpi.w	#$00FE,(g_ControllerPlayback).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $72: met while the player carries at least one Key.
; Used by: Verla Mine/B1F/242 Second Boss Room [Man 1].
TA_72:
		move.b	#ITM_KEY,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	_notMet
		beq.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $73: met when the player is at X $28, Y $20.
; Used by: Destel Well/3F/281 Pockets Treasure Room [Pockets].
TA_73:
		cmpi.w	#$2820,(Player_X).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $74: met whenever sprite 2 has moved since the last test
; (its X/Y word is compared against, then stored to,
; g_TriggerSprite2LastPos).
; Used by: Mercator/Center/Casino/664 Roulette Room [Invisible Cube].
TA_74:
		move.w	(Sprite2_X).l,d0
		cmp.w	(g_TriggerSprite2LastPos).l,d0
		beq.w	_notMet
		move.w	d0,(g_TriggerSprite2LastPos).l
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $75: met when the player is at X $36 (SubX < 8) on an even
; row.
; Used by: Mercator/Center/Casino/665 Chicken Race [Invisible Cube].
TA_75:
		cmpi.b	#$36,(Player_X).l
		bne.w	_notMet
		cmpi.b	#$08,(Player_SubX).l
		bcc.w	_notMet
		move.b	(Player_Y).l,d0
		btst	#$00,d0
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $76: find which of sprites 2-5 sits at X $0E and set or
; clear g_Flags+1 bit 3 to whether the player stands on that sprite;
; met once judged (not met while no sprite is at X $0E).
; Used by: Mercator/Center/Casino/665 Chicken Race [Invisible Cube].
TA_76:
		cmpi.b	#$0E,(Sprite2_X).l
		beq.w	_ta76Spr2
		cmpi.b	#$0E,(Sprite3_X).l
		beq.w	_ta76Spr3
		cmpi.b	#$0E,(Sprite4_X).l
		beq.w	_ta76Spr4
		cmpi.b	#$0E,(Sprite5_X).l
		beq.w	_ta76Spr5
		bra.w	_notMet
; ---------------------------------------------------------------------------

_ta76Spr2:
		cmpi.w	#$0100,(Player_SpriteUnderneath).l
		beq.s	_ta76Set
		bra.s	_ta76Clear
; ---------------------------------------------------------------------------

_ta76Spr3:
		cmpi.w	#$0180,(Player_SpriteUnderneath).l
		beq.s	_ta76Set
		bra.s	_ta76Clear
; ---------------------------------------------------------------------------

_ta76Spr4:
		cmpi.w	#$0200,(Player_SpriteUnderneath).l
		beq.s	_ta76Set
		bra.s	_ta76Clear
; ---------------------------------------------------------------------------

_ta76Spr5:
		cmpi.w	#$0280,(Player_SpriteUnderneath).l
		beq.s	_ta76Set
		bra.s	_ta76Clear
; ---------------------------------------------------------------------------

_ta76Set:
		bset	#$03,(g_Flags+1).l
		bra.w	_met
; ---------------------------------------------------------------------------

_ta76Clear:
		bclr	#$03,(g_Flags+1).l
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $77: met while g_AdditionalFlags+9 bit 5 is set, +$B bit 1
; is clear, the player is at X $14, and fewer than two Logs are held.
; Used by: Labyrinth/B1F/415 Tree Room [Gnome].
TA_77:
		btst	#$05,(g_AdditionalFlags+9).l
		beq.w	_notMet
		btst	#$01,(g_AdditionalFlags+$B).l
		bne.w	_notMet
		cmpi.b	#$14,(Player_X).l
		bne.w	_notMet
		move.b	#ITM_LOGS,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	_met
		cmpi.b	#$02,d1
		bcc.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $78: met once the player owns the Lantern.
; Used by: Labyrinth/B2F/387 Lantern Room [Invisible Cube].
TA_78:
		move.b	#ITM_LANTERN,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $79: met when the player is within X $2E-$2F, Y $2E-$2F at
; Z $68.
; Used by: Labyrinth/B3F/406 Raft Room [Raft].
TA_79:
		move.w	(Player_X).l,d0
		andi.w	#$FEFE,d0
		cmpi.w	#$2E2E,d0
		bne.w	_notMet
		cmpi.w	#$0068,(Player_Z).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $7A: met when the player is at X $16-$17, Y $11-$12, Z $38.
; Used by: Labyrinth/B5F/409 Second Raft Room [Raft].
TA_7A:
		move.b	(Player_X).l,d0
		andi.b	#$FE,d0
		cmpi.b	#$16,d0
		bne.w	_notMet
		move.b	(Player_Y).l,d0
		subq.b	#$01,d0
		andi.b	#$FE,d0
		cmpi.b	#$10,d0
		bne.w	_notMet
		cmpi.w	#$0038,(Player_Z).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $7B: met when the player is at Z $40.
; Used by: Labyrinth/B6F/410 Spinner [Invisible Cube].
TA_7B:
		cmpi.w	#$0040,(Player_Z).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $7C: met when the player is on column X $21.
; Used by: Labyrinth/B6F/410 Spinner [Spinner 1].
TA_7C:
		cmpi.b	#$21,(Player_X).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $7D: met when sprite 3's health drops below 100 ($64) HP.
; Used by: Labyrinth/B6F/410 Spinner [Chest].
TA_7D:
		cmpi.w	#$6400,(Sprite3_CurrentHealth).l
		bcc.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $7E: met when the player is on row Y $19.
; Used by: Labyrinth/B3F/417 Miro [Chest].
TA_7E:
		cmpi.b	#$19,(Player_Y).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $7F: met when sprite 2's health drops below 100 ($64) HP.
; Used by: Labyrinth/B3F/417 Miro [Chest].
TA_7F:
		cmpi.w	#$6400,(Sprite2_CurrentHealth).l
		bcc.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $80: met when the player is at X $21, Y $16, Z >= $A0.
; Used by: Overworld/04 - Mercator, Verla Tunnel, Mir's Tower/462
; Twinkle Village [Invisible Cube].
TA_80:
		cmpi.w	#$2116,(Player_X).l
		bne.w	_notMet
		cmpi.w	#$00A0,(Player_Z).l
		bcs.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Triggers $81-$83: met once sprite 1/2/3 has been removed
; (X byte $7F).
; Used by: Labyrinth/B2F/391 Three Lizard Switch Room [Round Switch].
TA_81:
		cmpi.b	#$7F,(Sprite1_X).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

TA_82:
		cmpi.b	#$7F,(Sprite2_X).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

TA_83:
		cmpi.b	#$7F,(Sprite3_X).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $84: met when the player is on column X $15.
; Used by: King Nole's Palace/B1F/120 Sub-Boss Corridor 2 [Invisible
; Cube]; King Nole's Palace/B1F/118 Sub-Boss Corridor 1 [Invisible
; Cube].
TA_84:
		cmpi.b	#$15,(Player_X).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $85: met when the player is on column X $11.
; Used by: King Nole's Palace/B1F/119 Gold Warrior Arena [Invisible
; Cube]; King Nole's Palace/B1F/121 Spinner 2 Arena [Invisible Cube].
TA_85:
		cmpi.b	#$11,(Player_X).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $86: met when the player is at X < $19 on row Y $16 owning
; Gola's Nail, Horn and Fang.
; Used by: King Nole's Palace/Treasure Hall/421 Stairs [Invisible Cube].
TA_86:
		cmpi.b	#$19,(Player_X).l
		bcc.w	_notMet
		cmpi.b	#$16,(Player_Y).l
		bne.w	_notMet
		move.b	#ITM_GOLASNAIL,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	_notMet
		move.b	#ITM_GOLASHORN,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	_notMet
		move.b	#ITM_GOLASFANG,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.w	d1
		bmi.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $87: met when sprite 3's health drops below 100 ($64) HP.
; Used by: King Nole's Palace/Treasure Hall/Treasure Room/111 Ver1
; (Nole) [Duke].
TA_87:
		cmpi.w	#$6400,(Sprite3_CurrentHealth).l
		bcc.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $88: met when the player is within X $1C-$1D, Y $16-$18.
; Used by: King Nole's Palace/Treasure Hall/Treasure Room/111 Ver1
; (Nole) [Duke].
TA_88:
		cmpi.b	#$1C,(Player_X).l
		beq.s	_ta88Y
		cmpi.b	#$1D,(Player_X).l
		bne.w	_notMet

_ta88Y:
		cmpi.b	#$16,(Player_Y).l
		beq.w	_met
		cmpi.b	#$17,(Player_Y).l
		beq.w	_met
		cmpi.b	#$18,(Player_Y).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $89: met when sprite 2's health drops below 100 ($64) HP.
; Used by: King Nole's Palace/Treasure Hall/Treasure Room/112 Ver2
; (Gola) [Invisible Cube].
TA_89:
		cmpi.w	#$6400,(Sprite2_CurrentHealth).l
		bcc.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $8A: met when the player is neither hurt-flashing nor in a
; special animation.
; Used by: King Nole's Palace/Treasure Hall/Treasure Room/111 Ver1
; (Nole) [Duke]; King Nole's Palace/Treasure Hall/Treasure Room/112 Ver2
; (Gola) [Invisible Cube].
TA_8A:
		tst.b	(g_PlayerHurtTimer).l
		bne.w	_notMet
		tst.b	(g_PlayerAnimation).l
		bne.w	_notMet
		bra.w	_met
; ---------------------------------------------------------------------------

; Trigger $8B: met when the player is at X $36, Y $34.
; Used by: Mercator/Center/Casino/666 Chicken Toss [Woman 3].
TA_8B:
		cmpi.w	#$3634,(Player_X).l
		bne.w	_notMet
		bra.w	_met

	modend
