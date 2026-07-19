; ---------------------------------------------------------------------------

EnemyAI_Worm3_B:				  ; CODE XREF: ROM:001A84D2j
		bra.s	EnemyAI_Worm3
; ---------------------------------------------------------------------------

EnemyAI_Worm3_A:				  ; CODE XREF: ROM:001A84CEj
		btst	#$01,InteractFlags(a5)
		bne.s	loc_1A5B36
		move.b	AIState(a5),d0
		beq.s	loc_1A5B3C
		cmpi.b	#$10,d0
		beq.s	loc_1A5B82
		bra.w	loc_1A5D2C
; ---------------------------------------------------------------------------

loc_1A5B36:					  ; CODE XREF: ROM:001A5B24j
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A5B3C:					  ; CODE XREF: ROM:001A5B2Aj
		move.w	Z(a5),HitBoxZEnd(a5)
		bsr.w	j_j_OnTick
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0050,d5
		move.w	#$0010,d6
		move.w	#$0020,d7
		bsr.w	CheckPlayerInRange
		bcs.s	EnemyAI_Worm3
		rts
; ---------------------------------------------------------------------------

EnemyAI_Worm3:					  ; CODE XREF: ROM:EnemyAI_Worm3_Bj
						  ; ROM:001A5B66j ...
		move.w	#$0005,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5B82:					  ; CODE XREF: ROM:001A5B30j
		tst.b	(g_PlayerHurtTimer).l
		bne.s	loc_1A5BB6
		move.w	$00000014(a5),(g_Scratch1800).l
		move.w	$00000016(a5),(g_Scratch1804).l
		bsr.s	sub_1A5BC6
		bcs.s	loc_1A5BB0
		bsr.w	sub_1A5C2C
		bcs.w	loc_1A5D2C
		bsr.w	sub_1A5C96
		bcs.s	loc_1A5BB0
		bsr.w	sub_1A5CF2

loc_1A5BB0:					  ; CODE XREF: ROM:001A5B9Cj
						  ; ROM:001A5BAAj
		bsr.w	j_j_OnTick
		rts
; ---------------------------------------------------------------------------

loc_1A5BB6:					  ; CODE XREF: ROM:001A5B88j
		move.w	#$0005,$00000034(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts

; =============== S U B	R O U T	I N E =======================================


sub_1A5BC6:					  ; CODE XREF: ROM:001A5B9Ap

; FUNCTION CHUNK AT 001A5C28 SIZE 00000004 BYTES

		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1A5C28
		btst	#$06,CombatFlags(a5)
		bne.s	loc_1A5C28
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	CheckPlayerInRange
		bcc.s	loc_1A5C28
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	CheckPlayerInRange
		bcs.s	loc_1A5C28
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00037,d7
		bhi.s	loc_1A5C28
; End of function sub_1A5BC6


; =============== S U B	R O U T	I N E =======================================


sub_1A5C0E:					  ; CODE XREF: sub_1A5C2C+46j
						  ; sub_1A5C96+3Aj ...
		move.b	#$20,AIState(a5)
		move.w	#$0013,BehaviourLUTIndex(a5)
		clr.b	AnimPhase(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		ori	#$01,ccr
		rts
; End of function sub_1A5C0E

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR sub_1A5BC6

loc_1A5C28:					  ; CODE XREF: sub_1A5BC6+8j
						  ; sub_1A5BC6+12j ...
		tst.b	d0
		rts
; END OF FUNCTION CHUNK	FOR sub_1A5BC6

; =============== S U B	R O U T	I N E =======================================


sub_1A5C2C:					  ; CODE XREF: ROM:001A5B9Ep
		move.b	AnimAction1(a5),d0
		andi.b	#$30,d0
		bne.w	loc_1A5C92
		move.w	#$0038,d5
		move.w	#$0038,d6
		move.w	#$0038,d7
		bsr.w	CheckPlayerInRange
		bcc.s	loc_1A5C92
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	CheckPlayerInRange
		bcs.s	loc_1A5C92
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00050,d7
		bhi.s	loc_1A5C92
		btst	#$06,CombatFlags(a5)
		beq.s	sub_1A5C0E
		move.b	#$21,AIState(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		clr.b	AnimPhase(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$01,d0
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A5C92:					  ; CODE XREF: sub_1A5C2C+8j
						  ; sub_1A5C2C+1Cj ...
		tst.b	d0
		rts
; End of function sub_1A5C2C


; =============== S U B	R O U T	I N E =======================================


sub_1A5C96:					  ; CODE XREF: ROM:001A5BA6p
		move.w	#$0028,d5
		move.w	#$0028,d6
		move.w	#$0028,d7
		bsr.w	CheckPlayerInRange
		bcc.s	loc_1A5CEE
		move.w	#$0018,d5
		move.w	#$0018,d6
		move.w	#$0018,d7
		bsr.w	CheckPlayerInRange
		bcs.s	loc_1A5CEE
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00037,d7
		bhi.s	loc_1A5CEE
		btst	#$06,CombatFlags(a5)
		beq.w	sub_1A5C0E
		move.b	#$22,AIState(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A5CEE:					  ; CODE XREF: sub_1A5C96+10j
						  ; sub_1A5C96+22j ...
		tst.b	d0
		rts
; End of function sub_1A5C96


; =============== S U B	R O U T	I N E =======================================


sub_1A5CF2:					  ; CODE XREF: ROM:001A5BACp
		move.w	#$0018,d5
		move.w	#$0000,d6
		move.w	#$0008,d7
		bsr.w	CheckPlayerInRange
		bcc.s	loc_1A5D28
		btst	#$06,CombatFlags(a5)
		beq.w	sub_1A5C0E
		move.b	#$23,AIState(a5)
		move.w	#$0000,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AnimPhase(a5)
		ori	#$01,ccr
		rts
; ---------------------------------------------------------------------------

loc_1A5D28:					  ; CODE XREF: sub_1A5CF2+10j
		tst.b	d0
		rts
; End of function sub_1A5CF2

; ---------------------------------------------------------------------------

loc_1A5D2C:					  ; CODE XREF: ROM:001A5B32j
						  ; ROM:001A5BA2j
		andi.b	#$0F,d0
		beq.s	loc_1A5D4A
		cmpi.b	#$01,d0
		beq.w	loc_1A5DDA
		cmpi.b	#$02,d0
		beq.w	loc_1A5E5C
		cmpi.b	#$03,d0
		bra.w	loc_1A5EE4
; ---------------------------------------------------------------------------

loc_1A5D4A:					  ; CODE XREF: ROM:001A5D30j
						  ; ROM:001A5E68j ...
		tst.b	AnimPhase(a5)
		bne.s	loc_1A5D70
		move.b	#$18,d0
		subq.b	#$01,d0
		add.b	d0,HitBoxSubZEnd(a5)
		jsr	(j_ValidateSpritePosition).l
		bcc.s	loc_1A5D6A
		move.w	Z(a5),HitBoxZEnd(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5D6A:					  ; CODE XREF: ROM:001A5D60j
		bset	#$06,CombatFlags(a5)

loc_1A5D70:					  ; CODE XREF: ROM:001A5D4Ej
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$01,AnimPhase(a5)
		bne.s	loc_1A5D8A
		move.b	#$FF,Action1(a5)
		move.w	#$0040,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5D8A:					  ; CODE XREF: ROM:001A5D7Aj
		cmpi.b	#$0A,AnimPhase(a5)
		bne.s	loc_1A5DA0
		move.b	#$FF,Action1(a5)
		move.w	#$0080,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5DA0:					  ; CODE XREF: ROM:001A5D90j
		cmpi.b	#$14,AnimPhase(a5)
		bne.s	loc_1A5DB6
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5DB6:					  ; CODE XREF: ROM:001A5DA6j
		cmpi.b	#$1E,AnimPhase(a5)
		bne.s	loc_1A5DCC
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5DCC:					  ; CODE XREF: ROM:001A5DBCj
		cmpi.b	#$32,AnimPhase(a5)
		bne.w	locret_1A5E5A
		bra.w	EnemyAI_Worm3
; ---------------------------------------------------------------------------

loc_1A5DDA:					  ; CODE XREF: ROM:001A5D36j
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$01,AnimPhase(a5)
		bne.s	loc_1A5DFA
		bclr	#$06,CombatFlags(a5)
		move.b	#$FF,Action1(a5)
		move.w	#$0100,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5DFA:					  ; CODE XREF: ROM:001A5DE4j
		cmpi.b	#$0A,AnimPhase(a5)
		bne.s	loc_1A5E10
		move.b	#$FF,Action1(a5)
		move.w	#$00C0,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5E10:					  ; CODE XREF: ROM:001A5E00j
		cmpi.b	#$14,AnimPhase(a5)
		bne.s	loc_1A5E26
		move.b	#$FF,Action1(a5)
		move.w	#$0140,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5E26:					  ; CODE XREF: ROM:001A5E16j
		cmpi.b	#$1E,AnimPhase(a5)
		bne.s	loc_1A5E3C
		move.b	#$FF,Action1(a5)
		move.w	#$0180,PrevAction(a5)
		rts
; ---------------------------------------------------------------------------

loc_1A5E3C:					  ; CODE XREF: ROM:001A5E2Cj
		cmpi.b	#$28,AnimPhase(a5)
		bne.s	locret_1A5E5A
		move.b	#$FF,Action1(a5)
		move.w	#$0020,PrevAction(a5)
		move.w	Z(a5),HitBoxZEnd(a5)
		bra.w	EnemyAI_Worm3
; ---------------------------------------------------------------------------

locret_1A5E5A:					  ; CODE XREF: ROM:001A5DD2j
						  ; ROM:001A5E42j
		rts
; ---------------------------------------------------------------------------

loc_1A5E5C:					  ; CODE XREF: ROM:001A5D3Ej
		btst	#$06,CombatFlags(a5)
		bne.s	loc_1A5E6C
		bsr.w	sub_1A5C0E
		bra.w	loc_1A5D4A
; ---------------------------------------------------------------------------

loc_1A5E6C:					  ; CODE XREF: ROM:001A5E62j
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0C,AnimPhase(a5)
		bcs.w	locret_1A5F36
		move.w	#ACT_ATTACK5,QueuedAction(a5)
		move.w	#$0020,d1
		move.w	#$0000,d2
		move.w	#$0008,d3
		bsr.w	TryHitPlayer
		bcc.s	loc_1A5EC8
		cmpi.b	#$0C,AnimPhase(a5)
		bne.s	loc_1A5EC8
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		move.b	#STATUS_POISON,d0
		cmpi.b	#010,d7
		bcs.s	loc_1A5EC2
		move.b	#STATUS_PARALYSIS,d0
		cmpi.b	#010,d7
		bcs.s	loc_1A5EC2
		move.b	#STATUS_CONFUSION,d0

loc_1A5EC2:					  ; CODE XREF: ROM:001A5EB2j
						  ; ROM:001A5EBCj
		bsr.w	j_j_AddStatusEffect
		bra.s	locret_1A5EE2
; ---------------------------------------------------------------------------

loc_1A5EC8:					  ; CODE XREF: ROM:001A5E96j
						  ; ROM:001A5E9Ej
		cmpi.b	#$18,AnimPhase(a5)
		bcs.s	locret_1A5EE2
		move.w	#ACT_ATTACK6,QueuedAction(a5)
		cmpi.b	#$20,AnimPhase(a5)
		bcs.s	locret_1A5EE2
		bra.w	loc_1A5F24
; ---------------------------------------------------------------------------

locret_1A5EE2:					  ; CODE XREF: ROM:001A5EC6j
						  ; ROM:001A5ECEj ...
		rts
; ---------------------------------------------------------------------------

loc_1A5EE4:					  ; CODE XREF: ROM:001A5D46j
		btst	#$06,CombatFlags(a5)
		bne.s	loc_1A5EF4
		bsr.w	sub_1A5C0E
		bra.w	loc_1A5D4A
; ---------------------------------------------------------------------------

loc_1A5EF4:					  ; CODE XREF: ROM:001A5EEAj
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		addq.b	#$01,AnimPhase(a5)
		cmpi.b	#$0F,AnimPhase(a5)
		bcs.s	locret_1A5F36
		move.w	#$0019,d1
		move.w	#$0009,d2
		move.w	#$0009,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK4,QueuedAction(a5)
		cmpi.b	#$1E,AnimPhase(a5)
		bcs.s	locret_1A5F36

loc_1A5F24:					  ; CODE XREF: ROM:001A5EDEj
		clr.w	QueuedAction(a5)
		clr.w	PrevAction(a5)
		bset	#$06,CombatFlags(a5)
		bra.w	EnemyAI_Worm3
; ---------------------------------------------------------------------------

locret_1A5F36:					  ; CODE XREF: ROM:001A5E7Cj
						  ; ROM:001A5F04j ...
		rts
