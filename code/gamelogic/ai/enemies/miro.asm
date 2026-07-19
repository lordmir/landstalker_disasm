Miro	module
; AI for the Miro fights - and the mirroring is literal: the jump
; table routes both SPR_NIGEL and SPR_MIRO here, so the brief early
; encounter is this AI wearing the player's own sprite, and the real
; fight later uses Miro's. He fights like a shadow of the player: he
; dodges a swing with a backwards leap 91% of the time
; (BHVS_BACK_LEAP), jumps in from range (BHVS_RUN_JUMP /
; BHVS_LEAP_ADVANCE) slashing on the way down, and his slash is a
; continuous four-pose flurry (ACT_ATTACK1-4, with a deep, wide box
; - $21 ahead, $D lateral - live from pose 2 on) that loops until
; the state ends. His close-range fallback is a stutter-chase
; (BHVS_STUTTER_CHASE: walk, pause, walk), slashing during the
; pauses whenever the player is in reach and not already in hitstun.

; B routine (behaviour command $2B): back to chasing.
EnemyAI_Miro_B:
		bra.s	EnemyAI_Miro

; A routine, run every tick.
EnemyAI_Miro_A:
		btst	#$01,InteractFlags(a5)
		bne.s	_hurtTick
		move.b	AIState(a5),d0
		beq.s	EnemyAI_Miro
		cmpi.b	#$10,d0
		beq.s	_chase
		bra.w	_attackStates

_hurtTick:
		bsr.w	j_j_OnTick
		rts

; Fresh fight (state 0) / attack-over / hitstun recovery: chase
; (BHVS_RESUME_CHASE clears the walk-backwards flag first). No idle
; - he is aggro from the start.
EnemyAI_Miro:
		move.w	#BHVS_RESUME_CHASE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		rts

; State $10: chasing. If the player is already in hitstun just keep
; chasing; otherwise try each move in turn.
_chase:
		tst.b	(g_PlayerHurtTimer).l
		bne.s	_playerHurt
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		bsr.s	_tryRunJump
		bcs.s	_chaseTick
		bsr.s	_tryLeap
		bcs.s	_chaseTick
		bsr.w	_tryPause
		bcs.s	_chaseTick
		bsr.w	_tryDodge
		bcs.s	_chaseTick
		bsr.w	_tryStandSlash
		bcs.w	_chaseTick
		bsr.w	_tryStutter

_chaseTick:
		bsr.w	j_j_OnTick
		rts

_playerHurt:
		bra.w	RunChaseBehaviour

; Player in the $50-$70 band ahead, $18 lateral: 10-in-1000 chance to
; run and jump at him (state $20, BHVS_RUN_JUMP), slashing on the
; descent.
_tryRunJump:
		move.w	#$0070,d5
		move.w	#$FFB0,d6
		move.w	#$0018,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_runJumpMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00009,d7
		bhi.s	_runJumpMiss
		move.b	#$20,AIState(a5)
		move.w	#BHVS_RUN_JUMP,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_runJumpMiss:
		tst.b	d0
		rts

; Player in the $28-$40 band ahead, $18 lateral: 26-in-1000 chance to
; leap in (state $21, BHVS_LEAP_ADVANCE), slashing on the descent.
_tryLeap:
		move.w	#$0040,d5
		move.w	#$FFD8,d6
		move.w	#$0018,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_leapMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00025,d7
		bhi.s	_leapMiss
		move.b	#$21,AIState(a5)
		move.w	#BHVS_LEAP_ADVANCE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_leapMiss:
		tst.b	d0
		rts

; Player in the $40-$50 band ahead, $20 lateral: 13-in-1000 chance to
; stand off for a moment (state $22, BHVS_PAUSE_60_AI).
_tryPause:
		move.w	#$0050,d5
		move.w	#$FFC0,d6
		move.w	#$0020,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_pauseMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00012,d7
		bhi.s	_pauseMiss
		move.b	#$22,AIState(a5)
		move.w	#BHVS_PAUSE_60_AI,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_pauseMiss:
		tst.b	d0
		rts

; Player in the $10-$40 band ahead, $10 lateral, and mid-swing
; (attack action ids 1-7): 91% chance to dodge - a backwards leap
; out of range (state $23, BHVS_BACK_LEAP).
_tryDodge:
		move.w	#$0040,d5
		move.w	#$FFF0,d6
		move.w	#$0010,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_dodgeMiss
		move.b	(Player_Action).l,d0
		andi.b	#$07,d0
		beq.s	_dodgeMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00090,d7
		bhi.s	_dodgeMiss
		move.b	#$23,AIState(a5)
		move.w	#BHVS_BACK_LEAP,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_dodgeMiss:
		tst.b	d0
		rts

; Player within $38 ahead, $18 lateral: 8-in-1000 chance to stand and
; slash (state $24, BHVS_PAUSE_60_AI).
_tryStandSlash:
		move.w	#$0038,d5
		move.w	#$0000,d6
		move.w	#$0018,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_standSlashMiss
		move.w	#01000,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00007,d7
		bhi.s	_standSlashMiss
		move.b	#$24,AIState(a5)
		move.w	#BHVS_PAUSE_60_AI,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_standSlashMiss:
		tst.b	d0
		rts

; Player within $28 ahead, $18 lateral: the stutter-chase (state
; $26). The roll is dead - both branches take the same path, so the
; state $25 setter below is unreachable.
_tryStutter:
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0018,d7
		bsr.w	CheckPlayerInRange
		bcc.s	_stutterMiss
		move.w	#00100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#00070,d7
		bcc.s	_startStutter
		bra.s	_startStutter

; Unreachable leftover: a stand-and-slash-once state ($25).
		move.b	#$25,AIState(a5)
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_startStutter:
		move.b	#$26,AIState(a5)
		move.w	#BHVS_STUTTER_CHASE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		clr.b	AICounter(a5)
		ori	#$01,ccr
		rts

_stutterMiss:
		tst.b	d0
		rts

; States $20+: 0/1 = jump in (slash on the descent), 2/3 = pause /
; dodge (behaviour ticks), 4 = slash, 5 = slash once (unreachable),
; 6+ = the stutter-chase.
_attackStates:
		andi.b	#$0F,d0
		beq.w	_jumpSlash
		cmpi.b	#$01,d0
		beq.s	_jumpSlash
		cmpi.b	#$02,d0
		beq.w	_behaviourTick
		cmpi.b	#$03,d0
		beq.w	_behaviourTick
		cmpi.b	#$04,d0
		beq.s	_slash
		cmpi.b	#$05,d0
		beq.s	_slashOnce
		bra.w	_stutterSlash
		nop

; The slash: a looping four-pose flurry driven by AICounter -
; ACT_ATTACK1 (ticks 1-3), then the deep, wide hit box ($21 ahead, 9
; behind, $D lateral) is live every tick through ACT_ATTACK2 (4-7),
; ACT_ATTACK3 (8-$B) and ACT_ATTACK4 ($C-$F), then the counter and
; action clear and it starts over. Runs the behaviour, so the moving
; variants keep moving.
_slash:
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$04,AICounter(a5)
		bcs.s	_slashTick
		move.w	#$0021,d1
		move.w	#$0009,d2
		move.w	#$000D,d3
		bsr.w	TryHitPlayer
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$08,AICounter(a5)
		bcs.s	_slashTick
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		cmpi.b	#$0C,AICounter(a5)
		bcs.s	_slashTick
		move.w	#ACT_ATTACK4,QueuedAction(a5)
		cmpi.b	#$10,AICounter(a5)
		bcs.s	_slashTick
		clr.w	QueuedAction(a5)
		clr.b	AICounter(a5)

_slashTick:
		bsr.w	j_j_OnTick
		rts

; Jump in (run-jump or leap): ride the behaviour; the slash starts
; on the descent (Action1 fall bit) and keeps going once started.
_jumpSlash:
		tst.b	AICounter(a5)
		bne.s	_slash
		btst	#$04,Action1(a5)
		bne.s	_slash
		bsr.w	j_j_OnTick
		rts

_behaviourTick:
		bsr.w	j_j_OnTick
		rts

; Slash once (unreachable state $25): one flurry, resetting when the
; loop wraps.
_slashOnce:
		bsr.s	_slash
		tst.w	QueuedAction(a5)
		beq.w	EnemyAI_Miro
		rts

; The stutter-chase: while the behaviour is walking (BehavCmd not a
; pause) just tick, with the slash cleared; during the pauses,
; keep slashing if already started, otherwise slash when the player
; is within $28 ahead, $18 lateral and not already in hitstun -
; reset if he gets away.
_stutterSlash:
		tst.b	BehavCmd(a5)
		bne.w	_stutterWalk
		tst.b	AICounter(a5)
		bne.w	_slash
		move.w	CentreX(a5),(g_Scratch1800).l
		move.w	CentreY(a5),(g_Scratch1804).l
		move.w	#$0028,d5
		move.w	#$0000,d6
		move.w	#$0018,d7
		bsr.w	CheckPlayerInRange
		bcc.w	EnemyAI_Miro
		tst.b	(g_PlayerHurtTimer).l
		beq.w	_slash
		rts

_stutterWalk:
		clr.w	QueuedAction(a5)
		clr.b	AICounter(a5)
		bsr.w	j_j_OnTick
		rts

		modend
