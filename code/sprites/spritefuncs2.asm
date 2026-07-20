SpriteFuncs2	module
; Runs the player's collapse animation, ticked from GameLoop while
; g_PlayerAnimation is non-zero (set when health reaches zero). The
; counter steps through the collapse poses (animation $44 or $48 by
; facing) at ticks 2/$0F/$14/$19. At the end ($96), one of:
;  - Fahl minigame (g_Flags+5 bit 7): the KO dialogue actions run
;    instead of a real death;
;  - the intro waterfall room: Nigel is carried to the Massan
;    mayor's house (_massanRescue);
;  - otherwise Friday revives the player with an EkeEke if one is
;    carried. With none left, the death path pops the return
;    address and returns carry set - landing in RestartFromSave's
;    loop check, which branches to GameOver.
LoadPlayerSpecialAnimation:
		tst.b	(g_PlayerAnimation).l
		beq.w	_done
		bset	#$00,(Player_InteractFlags).l
		andi.b	#$7F,(Player_AnimCtrl).l
		move.b	(Player_RotationAndSize).l,d0
		addi.b	#$40,d0			  ; facing SE/SW selects the
		andi.b	#$80,d0			  ; +4 animation bank
		lsr.b	#$05,d0
		ext.w	d0
		addi.w	#$0044,d0
		addq.b	#$01,(g_PlayerAnimation).l
		cmpi.b	#$02,(g_PlayerAnimation).l
		bne.s	_chkStage2
		move.w	d0,(Player_AnimationIndex).l
		move.w	#$0004,(Player_AnimationFrame).l
		ori.b	#$80,(Player_AnimCtrl).l
		rts

_chkStage2:
		cmpi.b	#$0F,(g_PlayerAnimation).l
		bne.s	_chkStage3
		move.w	d0,(Player_AnimationIndex).l
		move.w	#$0008,(Player_AnimationFrame).l
		ori.b	#$80,(Player_AnimCtrl).l
		rts

_chkStage3:
		cmpi.b	#$14,(g_PlayerAnimation).l
		bne.s	_chkStage4
		move.w	d0,(Player_AnimationIndex).l
		move.w	#$000C,(Player_AnimationFrame).l
		ori.b	#$80,(Player_AnimCtrl).l
		rts

_chkStage4:
		cmpi.b	#$19,(g_PlayerAnimation).l
		bne.s	_chkFaintEnd
		move.w	d0,(Player_AnimationIndex).l
		move.w	#$0010,(Player_AnimationFrame).l
		ori.b	#$80,(Player_AnimCtrl).l
		btst	#$07,(g_Flags+5).l
		beq.s	_stage4Done
		move.b	#$32,d0			  ; CSA_0032: reset the dojo opponent
		bsr.w	ProcessDialogueScriptAction
		move.b	#$8C,(g_PlayerAnimation).l

_stage4Done:
		rts

_chkFaintEnd:
		cmpi.b	#$96,(g_PlayerAnimation).l
		bne.w	_done
		btst	#$07,(g_Flags+5).l
		beq.s	OnFaint
		move.b	#$33,d0			  ; CSA_0033: dojo defeat aftermath
		bra.w	ProcessDialogueScriptAction

OnFaint:
		bclr	#$00,(Player_InteractFlags).l
		cmpi.w	#ROOM_MASSAN_WATERFALL,(g_CurrentRoom).l	  ; Waterfall Shrine Entrance
		bne.s	EkeEkeRecover
		btst	#$04,(g_Flags).l
		beq.w	_massanRescue

EkeEkeRecover:
		btst	#$00,(g_AdditionalFlags+$19).l
		bne.w	_stall
		move.b	#ITM_EKEEKE,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.b	d1
		beq.w	_death
		bmi.w	_death
		subq.b	#$01,d1
		jsr	(j_CheckAndConsumeItem).l
		move.b	#FRIDAY_FLY_UP,(g_FridayAnimation1).l
		move.b	#FRIDAY_HOVER,(g_FridayAnimation2).l
		move.w	#60,d0
		jsr	(j_Sleep).l
		move.b	#FRIDAY_SPELL,(g_FridayAnimation2).l

_waitFriday:
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#FRIDAY_PERCH,(g_FridayAnimation1).l
		bne.s	_waitFriday
		move.b	#FRIDAY_FLY_DOWN,(g_FridayAnimation2).l
		lea	(Player_X).l,a0
		bset	#$07,AnimCtrl(a0)
		bset	#$07,RenderFlags(a0)
		jsr	(j_SetPlayerIdlePose).l
		jsr	(j_LoadSprites).l
		bsr.w	UpdateEkeEkeHUD
		jsr	(j_EkeEkeHealthRecover).l
		clr.b	(g_PlayerAnimation).l
		move.b	#$10,(g_PlayerHurtTimer).l
		rts

; No EkeEke left: pop the return address and return carry set,
; landing in RestartFromSave's loop which goes to GameOver.
_death:
		movem.l	(sp)+,d0
		ori	#$01,ccr

_done:
		rts

; Auto-revival suppressed by scripts: hold the counter at the final
; stage.
_stall:
		subq.b	#$01,(g_PlayerAnimation).l
		rts

; Intro: Nigel collapses at the waterfall shrine and wakes up in the
; Massan mayor's house, with Friday's cutscene and scripted input.
_massanRescue:
		jsr	(j_FadeOutToDarkness).l
		clr.b	(g_PlayerAnimation).l
		move.w	#ROOM_MASSAN_MAYORS_HOUSE,(g_CurrentRoom).l	  ; Massan mayor's house
		move.w	#ROOM_MASSAN_MAYORS_HOUSE,(g_OriginalRoom).l
		move.b	#$10,(Player_X).l
		move.b	#$0F,(Player_Y).l
		bset	#$06,(Player_InteractFlags).l
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#$80,(Player_RotationAndSize).l
		clr.b	d0
		jsr	(j_LoadRoom_0).l
		jsr	(j_InitRoomDisplay).l
		move.b	#FRIDAY_PERCH,(g_FridayAnimation1).l
		move.b	#FRIDAY_HOVER,(g_FridayAnimation2).l
		move.b	#$09,d0
		bsr.w	PlaybackInput
		jmp	(j_FadeInFromDarkness).l

		modend
