
; =============== S U B	R O U T	I N E =======================================


sub_10ACE:					  ; DATA XREF: sub_10350t
		tst.b	(byte_FF1145).l
		beq.w	locret_10C84
		bset	#$00,(Player_Flags2).l
		andi.b	#$7F,(Player_Unk0A).l
		move.b	(Player_RotationAndSize).l,d0
		addi.b	#$40,d0
		andi.b	#$80,d0
		lsr.b	#$05,d0
		ext.w	d0
		addi.w	#$0044,d0
		addq.b	#$01,(byte_FF1145).l
		cmpi.b	#$02,(byte_FF1145).l
		bne.s	loc_10B26
		move.w	d0,(Player_AnimationIndex).l
		move.w	#$0004,(Player_AnimationFrame).l
		ori.b	#$80,(Player_Unk0A).l
		rts
; ---------------------------------------------------------------------------

loc_10B26:					  ; CODE XREF: sub_10ACE+3Ej
		cmpi.b	#$0F,(byte_FF1145).l
		bne.s	loc_10B48
		move.w	d0,(Player_AnimationIndex).l
		move.w	#$0008,(Player_AnimationFrame).l
		ori.b	#$80,(Player_Unk0A).l
		rts
; ---------------------------------------------------------------------------

loc_10B48:					  ; CODE XREF: sub_10ACE+60j
		cmpi.b	#$14,(byte_FF1145).l
		bne.s	loc_10B6A
		move.w	d0,(Player_AnimationIndex).l
		move.w	#$000C,(Player_AnimationFrame).l
		ori.b	#$80,(Player_Unk0A).l
		rts
; ---------------------------------------------------------------------------

loc_10B6A:					  ; CODE XREF: sub_10ACE+82j
		cmpi.b	#$19,(byte_FF1145).l
		bne.s	loc_10BA6
		move.w	d0,(Player_AnimationIndex).l
		move.w	#$0010,(Player_AnimationFrame).l
		ori.b	#$80,(Player_Unk0A).l
		btst	#$07,(g_Flags+5).l
		beq.s	locret_10BA4
		move.b	#$32,d0
		bsr.w	ProcessDialogueScriptAction
		move.b	#$8C,(byte_FF1145).l

locret_10BA4:					  ; CODE XREF: sub_10ACE+C4j
		rts
; ---------------------------------------------------------------------------

loc_10BA6:					  ; CODE XREF: sub_10ACE+A4j
		cmpi.b	#$96,(byte_FF1145).l
		bne.w	locret_10C84
		btst	#$07,(g_Flags+5).l
		beq.s	loc_10BC4
		move.b	#$33,d0
		bra.w	ProcessDialogueScriptAction
; ---------------------------------------------------------------------------

loc_10BC4:					  ; CODE XREF: sub_10ACE+ECj
		bclr	#$00,(Player_Flags2).l
		cmpi.w	#$01AA,(g_RmNum1).l	  ; Waterfall Shrine Entrance
		bne.s	loc_10BE2
		btst	#$04,(g_Flags).l
		beq.w	loc_10C8E

loc_10BE2:					  ; CODE XREF: sub_10ACE+106j
		btst	#$00,(g_Vars+$19).l
		bne.w	loc_10C86
		move.b	#ITM_EKEEKE,d0
		jsr	(j_GetItemQtyAndMaxQty).l
		tst.b	d1
		beq.w	loc_10C7C
		bmi.w	loc_10C7C
		subq.b	#$01,d1
		jsr	(j_CheckAndConsumeItem).l
		move.b	#$01,(g_FridayAnimation1).l
		move.b	#$11,(g_FridayAnimation2).l
		move.w	#$003C,d0
		jsr	(j_Sleep).l
		move.b	#$41,(g_FridayAnimation2).l

loc_10C2C:					  ; CODE XREF: sub_10ACE+16Cj
		jsr	(j_WaitUntilVBlank).l
		cmpi.b	#$21,(g_FridayAnimation1).l
		bne.s	loc_10C2C
		move.b	#$31,(g_FridayAnimation2).l
		lea	(Player_X).l,a0
		bset	#$07,Unk0A(a0)
		bset	#$07,Unk48(a0)
		jsr	(sub_3FE).l
		jsr	(sub_3F8).l
		bsr.w	UpdateEkeEkeHUD
		jsr	(j_EkeEkeHealthRecover).l
		clr.b	(byte_FF1145).l
		move.b	#$10,(byte_FF1142).l
		rts
; ---------------------------------------------------------------------------

loc_10C7C:					  ; CODE XREF: sub_10ACE+12Cj
						  ; sub_10ACE+130j
		movem.l	(sp)+,d0
		ori	#$01,ccr

locret_10C84:					  ; CODE XREF: sub_10ACE+6j
						  ; sub_10ACE+E0j
		rts
; ---------------------------------------------------------------------------

loc_10C86:					  ; CODE XREF: sub_10ACE+11Cj
		subq.b	#$01,(byte_FF1145).l
		rts
; ---------------------------------------------------------------------------

loc_10C8E:					  ; CODE XREF: sub_10ACE+110j
		jsr	(sub_3E6).l
		clr.b	(byte_FF1145).l
		move.w	#$0251,(g_RmNum1).l	  ; Massan mayor's house
		move.w	#$0251,(RmNum2).l
		move.b	#$10,(Player_X).l
		move.b	#$0F,(Player_Y).l
		bset	#$06,(Player_Flags2).l
		andi.b	#$3F,(Player_RotationAndSize).l
		ori.b	#$80,(Player_RotationAndSize).l
		clr.b	d0
		jsr	(j_LoadRoom_0).l
		jsr	(sub_410).l
		move.b	#$21,(g_FridayAnimation1).l
		move.b	#$11,(g_FridayAnimation2).l
		move.b	#$09,d0
		bsr.w	PlaybackInput
		jmp	(j_FadeInFromDarkness).l
; End of function sub_10ACE

