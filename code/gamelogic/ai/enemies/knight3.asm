; ---------------------------------------------------------------------------

EnemyAI_Knight3_B:				  ; CODE XREF: ROM:001A851Aj
		bra.s	EnemyAI_Knight3
; ---------------------------------------------------------------------------

EnemyAI_Knight3_A:				  ; CODE XREF: ROM:001A8516j
		btst	#$01,InteractFlags(a5)
		bne.s	loc_1A730E
		move.b	AIState(a5),d0
		beq.s	loc_1A7314
		cmpi.b	#$10,d0
		beq.s	loc_1A7340
		bra.w	loc_1A7490
; ---------------------------------------------------------------------------

loc_1A730E:					  ; CODE XREF: ROM:001A72FCj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A7314:					  ; CODE XREF: ROM:001A7302j
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0060,d5
		move.w	#$0010,d6
		move.w	#$0030,d7
		bsr.w	CheckPlayerInRange
		bcs.s	EnemyAI_Knight3
		rts
; ---------------------------------------------------------------------------

EnemyAI_Knight3:				  ; CODE XREF: ROM:EnemyAI_Knight3_Bj
						  ; ROM:001A7338j ...
		bra.w	StartEnemyChase
; ---------------------------------------------------------------------------

loc_1A7340:					  ; CODE XREF: ROM:001A7308j
		tst.b	(g_PlayerHurtTimer).l
		bne.s	loc_1A7370
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	sub_1A7374
		bcs.s	loc_1A736A
		bsr.s	sub_1A73B0
		bcs.s	loc_1A736A
		bsr.w	sub_1A73F6
		bcs.s	loc_1A736A
		bsr.w	sub_1A7436

loc_1A736A:					  ; CODE XREF: ROM:001A735Aj
						  ; ROM:001A735Ej ...
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A7370:					  ; CODE XREF: ROM:001A7346j
		bra.w	RunChaseBehaviour

; =============== S U B	R O U T	I N E =======================================


sub_1A7374:					  ; CODE XREF: ROM:001A7358p
		move.w	#$0040,d5
		move.w	#$FFD0,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	loc_1A73AC
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		bhi.s	loc_1A73AC
		move.b	#$20,AIState(a5)
		move.w	#$0012,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A73AC:					  ; CODE XREF: sub_1A7374+10j
						  ; sub_1A7374+20j
		tst.b	d0
		rts
; End of function sub_1A7374


; =============== S U B	R O U T	I N E =======================================


sub_1A73B0:					  ; CODE XREF: ROM:001A735Cp
		move.w	#$0038,d5
		move.w	#$FFE0,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	loc_1A73F2
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00018,d7
		move.b	(Player_Action).l,d0	  ; Bit0 - Walk	NE (-Y)
						  ; Bit1 - Walk	SW (+Y)
						  ; Bit2 - Walk	NW (-X)
						  ; Bit3 - Walk	SE (+X)
						  ; Bit4 - Fall
						  ; Bit5 - Jump
						  ; Bit6-Bit7 -	Pick up	/ Put down
						  ; Bit8-Bit11 - Sword swing, attack
						  ; Bit12 - Ladder Climb
						  ; Bit13 - Receive Damage
		andi.b	#$07,d0
		beq.s	loc_1A73F2
		move.b	#$21,AIState(a5)
		move.w	#$0012,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A73F2:					  ; CODE XREF: sub_1A73B0+10j
						  ; sub_1A73B0+2Aj
		tst.b	d0
		rts
; End of function sub_1A73B0


; =============== S U B	R O U T	I N E =======================================


sub_1A73F6:					  ; CODE XREF: ROM:001A7360p
		move.w	#$0030,d5
		move.w	#$0000,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	loc_1A7432
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00075,d7
		bhi.s	loc_1A7432
		move.b	#$22,AIState(a5)
		move.w	#$0011,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7432:					  ; CODE XREF: sub_1A73F6+10j
						  ; sub_1A73F6+20j
		tst.b	d0
		rts
; End of function sub_1A73F6


; =============== S U B	R O U T	I N E =======================================


sub_1A7436:					  ; CODE XREF: ROM:001A7366p
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	loc_1A748C
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00010,d7
		bcc.s	loc_1A7472
		move.b	#$23,AIState(a5)
		move.w	#$0009,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A7472:					  ; CODE XREF: sub_1A7436+20j
		move.b	#$24,AIState(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A748C:					  ; CODE XREF: sub_1A7436+10j
		tst.b	d0
		rts
; End of function sub_1A7436

; ---------------------------------------------------------------------------

loc_1A7490:					  ; CODE XREF: ROM:001A730Aj
		andi.b	#$0F,d0
		beq.s	loc_1A74E2
		cmpi.b	#$01,d0
		beq.s	loc_1A74AC
		cmpi.b	#$02,d0
		beq.s	loc_1A74E2
		cmpi.b	#$03,d0
		beq.s	loc_1A74E2
		bra.w	loc_1A74E2
; ---------------------------------------------------------------------------

loc_1A74AC:					  ; CODE XREF: ROM:001A749Aj
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$05,AnimPhase(a5)
		bcs.s	loc_1A74D6
		move.w	#ACT_ATTACK4,QueuedAction(a5)
		cmpi.b	#$17,AnimPhase(a5)
		bcs.s	loc_1A74D6
		bclr	#$00,CombatFlags(a5)
		bra.w	EnemyAI_Knight3
; ---------------------------------------------------------------------------

loc_1A74D6:					  ; CODE XREF: ROM:001A74BCj
						  ; ROM:001A74CAj
		bset	#$00,CombatFlags(a5)
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A74E2:					  ; CODE XREF: ROM:001A7494j
						  ; ROM:001A74A0j ...
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	loc_1A7516
		move.w	#$0029,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcs.s	loc_1A7516
		bra.w	EnemyAI_Knight3
; ---------------------------------------------------------------------------

loc_1A7516:					  ; CODE XREF: ROM:001A74F2j
						  ; ROM:001A7510j
		bsr.w	j_j_OnTick
		rts
