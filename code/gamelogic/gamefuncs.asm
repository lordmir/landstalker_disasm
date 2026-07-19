GameFuncs	module

; Inflicts status d0 (STATUS_* bit number) on the player, unless the
; equipped ring blocks it: Mars Stone blocks poison AND paralysis
; (paralysis falls through the bne below into the Mars check, despite
; the manual claiming poison only), Moon Stone blocks the others
; (confusion/curse). Paralysis is inflicted by mushroom3/worm3 and the
; Death Statue's random roll.
AddStatusEffect:
		tst.b	d0
		beq.s	_chkMarsStone
		cmpi.b	#STATUS_PARALYSIS,d0
		bne.s	_chkMoonStone

_chkMarsStone:
		cmpi.b	#ITM_MARSSTONE,(g_EquippedRing).l
		beq.s	_blocked
		bra.s	_applyStatus

_chkMoonStone:
		cmpi.b	#ITM_MOONSTONE,(g_EquippedRing).l
		beq.s	_blocked

_applyStatus:
		trap	#$00			  ; Trap00Handler
		dc.w SND_Poison
		bset	d0,(g_PlayerStatus).l
		cmpi.b	#$01,d0
		bcs.s	_initPoison
		cmpi.b	#STATUS_PARALYSIS,d0
		beq.s	_initParalysis

_blocked:
		rts

_initPoison:
		clr.b	(g_PoisonStepCounter).l
		move.b	#$08,(g_PoisonHitsLeft).l
		rts

_initParalysis:
		move.w	#1200,(g_ParalysisTimer).l
		clr.b	(g_ParalysisCheckCount).l
		rts


ClearPlayerStatus:
		bclr	d0,(g_PlayerStatus).l
		rts


GetPlayerStatus:
		move.b	(g_PlayerStatus).l,d0
		rts


GetGold:
		move.w	(g_Gold).l,d0
		rts


AddGold:
		add.w	d0,(g_Gold).l
		bcc.s	_goldHUD
		move.w	#$FFFF,(g_Gold).l

_goldHUD:
		bsr.w	RefreshGoldHUD
		rts


; Returns carry set if the player cannot afford d0 gold.
RemoveGold:
		cmp.w	(g_Gold).l,d0
		bhi.s	_notEnough
		sub.w	d0,(g_Gold).l
		bsr.w	RefreshGoldHUD
		tst.b	d0
		rts

_notEnough:
		ori	#$01,ccr
		rts


AddHealth:
		add.w	CurrentHealth(a5),d0
		bcs.s	_capMax
		cmp.w	MaxHealth(a5),d0
		bls.s	_setHealth

_capMax:
		move.w	MaxHealth(a5),d0

_setHealth:
		move.w	d0,CurrentHealth(a5)
		cmpa.l	#Player_X,a5
		bne.s	_addDone
		bsr.w	RefreshCurrentHealthHUD

_addDone:
		rts


RemoveHealth:
		sub.w	d0,CurrentHealth(a5)
		bcc.s	_chkPlayer
		clr.w	CurrentHealth(a5)

_chkPlayer:
		cmpa.l	#Player_X,a5
		bne.s	_remDone
		bsr.w	RefreshCurrentHealthHUD

_remDone:
		rts


AddToMaxHealth:
		add.w	d0,MaxHealth(a5)
		bsr.w	RefreshMaxHealthHUD
		rts


GetMaxHealth:
		move.w	MaxHealth(a5),d0
		rts


; Per-tick charge meter fill (cap $3200 = full). Rate $20, or $40 with
; the Saturn Stone, $60 with the Venus Stone; a running Statue of Golden
; charges at $0A00 (full in 5 ticks) while its timer counts down.
IncrementSwordCharge:
		move.w	(g_GoldenStatueTimer).l,d0
		beq.s	_ringRate
		subq.w	#$01,(g_GoldenStatueTimer).l
		move.w	#$0A00,d0
		bra.s	_applyRate

_ringRate:
		move.w	#$0060,d0
		cmpi.b	#ITM_VENUSSTONE,(g_EquippedRing).l
		beq.s	_applyRate
		move.w	#$0040,d0
		cmpi.b	#ITM_SATURNSTONE,(g_EquippedRing).l
		beq.s	_applyRate
		move.w	#$0020,d0

_applyRate:
		cmpi.w	#$3200,(g_SwordChargeMeter).l
		bcc.s	_incDone
		add.w	d0,(g_SwordChargeMeter).l
		cmpi.w	#$3200,(g_SwordChargeMeter).l
		bls.s	_chargeHUD
		move.w	#$3200,(g_SwordChargeMeter).l

_chargeHUD:
		bsr.w	RefreshSwordChargeHUD

_incDone:
		rts


DecreaseSwordCharge:
		sub.w	d0,(g_SwordChargeMeter).l
		bpl.s	_decDone
		clr.w	(g_SwordChargeMeter).l
		bsr.w	RefreshSwordChargeHUD

_decDone:
		rts


; Runs OnTick for every active sprite (enemies get j_RespawnGhost instead
; when InitInteractFlags bit 7 is set).
UpdateEntities:
		lea	(Sprite1_X).l,a5
		moveq	#$E,d7

_entLoop:
		move.b	(a5),d0
		bmi.s	_entDone
		movem.l	d7/a5,-(sp)
		tst.b	InitInteractFlags(a5)
		bmi.s	_entEnemy
		cmpi.b	#$7F,d0
		beq.s	_entNext
		bsr.w	OnTick

_entNext:
		movem.l	(sp)+,d7/a5
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,_entLoop

_entDone:
		rts

_entEnemy:
		jsr	(j_RespawnGhost).l
		bra.s	_entNext

		modend
