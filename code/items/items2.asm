; ---------------------------------------------------------------------------

ItemUseEkeEke:					  ; CODE XREF: ROM:PreUseItemTablej
		bsr.s	EkeEkeHealthRecover
		bsr.w	ConsumeItem
		jsr	(j_UpdateEkeEkeHUD).l
		jsr	(j_MarkHUDForUpdate).l
		jsr	(j_RefreshHUD).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_HealthRecover2
; ---------------------------------------------------------------------------
		bra.w	ReturnSuccess

; =============== S U B	R O U T	I N E =======================================


EkeEkeHealthRecover:				  ; CODE XREF: ROM:ItemUseEkeEkep
						  ; DATA XREF: j_EkeEkeHealthRecovert
		lea	(Player_X).l,a5
		jsr	(j_GetMaxHealth).l
		lsr.w	#$01,d0
		cmpi.w	#$0A00,d0
		bcc.s	loc_8712
		move.w	#$0A00,d0

loc_8712:					  ; CODE XREF: EkeEkeHealthRecover+12j
		jmp	(j_AddHealth).l
; End of function EkeEkeHealthRecover

; ---------------------------------------------------------------------------

ItemUseDetoxGrass:				  ; CODE XREF: ROM:00008626j
		jsr	(j_GetPlayerStatus).l
		btst	#STATUS_POISON,d0
		beq.w	ReturnFailure
		bsr.w	ConsumeItem
		clr.b	d0
		jsr	(j_ClearPlayerStatus).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_HealthRecover2
; ---------------------------------------------------------------------------
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

ItemUseGaiaStatue:				  ; CODE XREF: ROM:0000862Cj
		btst	#$02,(g_Vars+7).l	  ; Check for lava room	flag
		bne.s	loc_8758
		cmpi.w	#$020A,(g_RmNum1).l
		bne.s	loc_8758
		bset	#$02,(g_Vars+7).l
		bra.s	loc_8762
; ---------------------------------------------------------------------------

loc_8758:					  ; CODE XREF: ROM:00008742j
						  ; ROM:0000874Cj
		jsr	(sub_103C4).l
		bcc.w	ReturnFailure

loc_8762:					  ; CODE XREF: ROM:00008756j
		bsr.w	ConsumeItem
		bset	#$00,(byte_FF1157).l
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

ItemUseGoldenStatue:				  ; CODE XREF: ROM:00008632j
		move.w	#00600,(g_GoldenStatueTimer).l
		bsr.w	ConsumeItem
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

ItemUseMindRepair:				  ; CODE XREF: ROM:00008638j
		jsr	(j_GetPlayerStatus).l
		btst	#STATUS_CONFUSION,d0
		beq.w	ReturnFailure
		bsr.w	ConsumeItem
		move.b	#STATUS_CONFUSION,d0
		jsr	(j_ClearPlayerStatus).l
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_HealthRecover2
; ---------------------------------------------------------------------------
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

ItemUseBlueRibbon:				  ; CODE XREF: ROM:0000863Ej
		bra.w	ReturnSuccess
; ---------------------------------------------------------------------------

ItemUseLantern:					  ; CODE XREF: ROM:00008644j
		bsr.s	CheckIfRoomIsLit
		bcs.w	ReturnFailure
		tst.b	d7
		beq.w	ReturnFailure
		bset	d1,(a0,d0.w)
		bra.w	ReturnSuccess

; =============== S U B	R O U T	I N E =======================================


CheckIfRoomIsLit:				  ; CODE XREF: SetRoomPalp
						  ; ROM:ItemUseLanternp
		lea	LightableRooms(pc),a0

loc_87C2:					  ; CODE XREF: CheckIfRoomIsLit+16j
		move.w	(a0),d0
		bmi.w	loc_87F2
		cmp.w	(g_RmNum1).l,d0
		beq.w	loc_87D6
		addq.l	#$04,a0
		bra.s	loc_87C2
; ---------------------------------------------------------------------------

loc_87D6:					  ; CODE XREF: CheckIfRoomIsLit+10j
		clr.w	d0
		move.b	$00000002(a0),d0
		move.b	$00000003(a0),d1
		lea	(g_Flags).l,a0
		btst	d1,(a0,d0.w)
		beq.s	loc_87F8
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_87F2:					  ; CODE XREF: CheckIfRoomIsLit+6j
		clr.b	d7
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_87F8:					  ; CODE XREF: CheckIfRoomIsLit+2Cj
		move.b	#$FF,d7
		tst.b	d0
		rts
; End of function CheckIfRoomIsLit

; ---------------------------------------------------------------------------
