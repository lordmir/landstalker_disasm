Items2	module
; Item use, part 2: the first batch of pre-use handlers, reached
; through PreUseItemTable. The shared exits (ReturnSuccess /
; ReturnFailure / ConsumeItem) are in items3.asm.

; EkeEke: restore health, consume one, redraw the HUD.
ItemUseEkeEke:
		bsr.s	EkeEkeHealthRecover
		bsr.w	ConsumeItem
		jsr	(j_UpdateEkeEkeHUD).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_HealthRecover2

		bra.w	ReturnSuccess

; The EkeEke heal: half the max health, but at least $A00 (10
; units). Also used when Friday revives the player.
EkeEkeHealthRecover:
		lea	(Player_X).l,a5
		jsr	(j_GetMaxHealth).l
		lsr.w	#$01,d0
		cmpi.w	#$0A00,d0
		bcc.s	_ehrAdd
		move.w	#$0A00,d0

_ehrAdd:
		jmp	(j_AddHealth).l
; ---------------------------------------------------------------------------

; Detox Grass: cure poison (fails without it).
ItemUseDetoxGrass:
		jsr	(j_GetPlayerStatus).l
		btst	#STATUS_POISON,d0
		beq.w	ReturnFailure
		bsr.w	ConsumeItem
		clr.b	d0
		jsr	(j_ClearPlayerStatus).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_HealthRecover2

		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

; Gaia Statue: in the lava statue room the first use sets the
; lava-cooling flag; anywhere else it needs a hostile enemy
; present, and queues the Gaia attack.
ItemUseGaiaStatue:
		TestFlag	FLAG_LAVA_COOLED ; Check for lava room flag
		bne.s	_gsNeedEnemies
		cmpi.w	#ROOM_LAVA_STATUE,(g_CurrentRoom).l
		bne.s	_gsNeedEnemies
		SetFlag	FLAG_LAVA_COOLED
		bra.s	_gsQueue
; ---------------------------------------------------------------------------

_gsNeedEnemies:
		jsr	(j_AnyHostileEnemies).l
		bcc.w	ReturnFailure

_gsQueue:
		bsr.w	ConsumeItem
		bset	#$00,(g_GaiaAttackQueued).l
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

; Golden Statue: start the 600-frame attack boost.
ItemUseGoldenStatue:
		move.w	#00600,(g_GoldenStatueTimer).l
		bsr.w	ConsumeItem
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

; Mind Repair: cure confusion.
ItemUseMindRepair:
		jsr	(j_GetPlayerStatus).l
		btst	#STATUS_CONFUSION,d0
		beq.w	ReturnFailure
		bsr.w	ConsumeItem
		move.b	#STATUS_CONFUSION,d0
		jsr	(j_ClearPlayerStatus).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_HealthRecover2

		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

; Blue Ribbon: does nothing (its text was printed in the menu).
ItemUseBlueRibbon:
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

; Lantern: light the current room by setting its darkness flag
; (located by CheckIfRoomIsLit; fails when already lit or the room
; is not lightable).
ItemUseLantern:
		bsr.s	CheckIfRoomIsLit
		bcs.w	ReturnFailure
		tst.b	d7
		beq.w	ReturnFailure
		bset	d1,(a0,d0.w)
		bra.w	ReturnSuccess

; Look the current room up in LightableRooms ({room word, flag
; byte offset, bit} entries, negative terminator). Carry set =
; already lit. Carry clear: d7 = $FF with a0 = g_Flags and the
; flag's offset/bit in d0/d1 (ready to set), or d7 = 0 when the
; room is not in the table. Also used by SetRoomPal.
CheckIfRoomIsLit:
		lea	LightableRooms(pc),a0

_crlScan:
		move.w	(a0),d0
		bmi.w	_crlNoEntry
		cmp.w	(g_CurrentRoom).l,d0
		beq.w	_crlFound
		addq.l	#$04,a0
		bra.s	_crlScan
; ---------------------------------------------------------------------------

_crlFound:
		clr.w	d0
		move.b	$00000002(a0),d0
		move.b	$00000003(a0),d1
		lea	(g_Flags).l,a0
		btst	d1,(a0,d0.w)
		beq.s	_crlUnlit
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

_crlNoEntry:
		clr.b	d7
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

_crlUnlit:
		move.b	#$FF,d7
		tst.b	d0
		rts

	modend
