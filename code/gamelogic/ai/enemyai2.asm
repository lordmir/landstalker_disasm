EnemyAI2	module
; Shared helpers for the enemy AI bank: hide/despawn, the ghost
; respawn tail, melee hit and player-detection box tests, the
; chase-state resets, and local thunks.

; Parks the sprite in the hidden $7F7F state: $7F into X/Y and the
; high bytes of the Centre and hitbox-X words, so the slot reads as
; $7F7F (skipped by most scans, reclaimable by FindFreeSpriteSlot).
MoveSpriteOffscreen:
		move.b	#$7F,X(a5)
		move.b	#$7F,Y(a5)
		move.b	#$7F,CentreX(a5)
		move.b	#$7F,CentreY(a5)
		move.b	#$7F,HitBoxXStart(a5)
		move.b	#$7F,HitBoxXEnd(a5)
		rts

; Fully hides the sprite: hidden flag (StateFlags bit 0) + parked
; offscreen.
HideSprite:
		ori.b	#$01,StateFlags(a5)
		bra.s	MoveSpriteOffscreen

; Tail of the ghost respawn (CheckRespawnGhost): the spawn spot is
; clear, so reset actions and animation; a ghost graphic starts its
; materialise animation (anim 8) and runs its AI B routine once.
FinishGhostRespawn:
		clr.w	QueuedAction(a5)
		move.w	#$FFFF,PrevAction(a5)
		clr.w	AnimationFrame(a5)
		ori.b	#$80,AnimCtrl(a5)
		cmpi.b	#SpriteB_Ghost,SpriteGraphic(a5)
		bne.s	_ghostPlainAnim
		move.w	#$0008,AnimationIndex(a5)
		bset	#$07,RenderFlags(a5)
		bsr.w	RunEnemyAI_B
		rts

_ghostPlainAnim:
		bset	#$07,RenderFlags(a5)
		clr.w	AnimationIndex(a5)
		rts

; Enemy melee hit check: if the facing-relative attack box (d1 = reach
; ahead, d2 = extent behind, d3 = lateral half-width, from CentreX/Y)
; touches the player, queue the pending hit (direction code $40 +
; facing 0-3) with this enemy's AttackStrength. Carry set = hit landed.
TryHitPlayer:
		bsr.s	CheckAttackBoxVsPlayer
		bcc.s	_hitRts
		move.b	d0,(g_PlayerPendingHit).l
		move.w	AttackStrength(a5),(Player_AttackStrength).l
		ori	#$01,ccr

_hitRts:
		rts

; The box test for TryHitPlayer: rotates the d1-d3 box by facing,
; compares it plus the Z span against the player's hitbox. Carry set
; = overlap, d0 = pending-hit direction code.
CheckAttackBoxVsPlayer:
		move.w	d3,d4
		move.w	Z(a5),d5
		move.w	HitBoxZEnd(a5),d6
		lea	(Player_X).l,a1
		move.b	RotationAndSize(a5),d7
		andi.b	#DIR_MASK,d7
		beq.s	_boxNE
		cmpi.b	#DIR_SW,d7
		beq.w	_boxSW
		bcs.w	_boxSE
		neg.w	d1
		add.w	CentreX(a5),d1
		add.w	CentreX(a5),d2
		neg.w	d3
		add.w	CentreY(a5),d3
		add.w	CentreY(a5),d4
		cmp.w	HitBoxXEnd(a1),d1
		bhi.s	_missNW
		cmp.w	HitBoxXStart(a1),d2
		bcs.s	_missNW
		cmp.w	HitBoxYEnd(a1),d3
		bhi.s	_missNW
		cmp.w	HitBoxYStart(a1),d4
		bcs.s	_missNW
		cmp.w	HitBoxZEnd(a1),d5
		bhi.s	_missNW
		cmp.w	Z(a1),d6
		bcs.s	_missNW
		move.b	#$43,d0
		ori	#$01,ccr
		rts

_missNW:
		tst.b	d0
		rts

_boxNE:
		neg.w	d1
		add.w	CentreY(a5),d1
		add.w	CentreY(a5),d2
		add.w	CentreX(a5),d3
		neg.w	d4
		add.w	CentreX(a5),d4
		cmp.w	HitBoxYEnd(a1),d1
		bhi.s	_missNE
		cmp.w	HitBoxYStart(a1),d2
		bcs.s	_missNE
		cmp.w	HitBoxXStart(a1),d3
		bcs.w	_missNE
		cmp.w	HitBoxXEnd(a1),d4
		bhi.s	_missNE
		cmp.w	HitBoxZEnd(a1),d5
		bhi.s	_missNE
		cmp.w	Z(a1),d6
		bcs.s	_missNE
		move.b	#$40,d0
		ori	#$01,ccr
		rts

_missNE:
		tst.b	d0
		rts

_boxSW:
		add.w	CentreY(a5),d1
		neg.w	d2
		add.w	CentreY(a5),d2
		neg.w	d3
		add.w	CentreX(a5),d3
		add.w	CentreX(a5),d4
		cmp.w	HitBoxYStart(a1),d1
		bcs.s	_missSW
		cmp.w	HitBoxYEnd(a1),d2
		bhi.s	_missSW
		cmp.w	HitBoxXEnd(a1),d3
		bhi.s	_missSW
		cmp.w	HitBoxXStart(a1),d4
		bcs.s	_missSW
		cmp.w	HitBoxZEnd(a1),d5
		bhi.s	_missSW
		cmp.w	Z(a1),d6
		bcs.s	_missSW
		move.b	#$42,d0
		ori	#$01,ccr
		rts

_missSW:
		tst.b	d0
		rts

_boxSE:
		add.w	CentreX(a5),d1
		neg.w	d2
		add.w	CentreX(a5),d2
		add.w	CentreY(a5),d3
		neg.w	d4
		add.w	CentreY(a5),d4
		cmp.w	HitBoxXStart(a1),d1
		bcs.s	_missSE
		cmp.w	HitBoxXEnd(a1),d2
		bhi.s	_missSE
		cmp.w	HitBoxYStart(a1),d3
		bcs.s	_missSE
		cmp.w	HitBoxYEnd(a1),d4
		bhi.s	_missSE
		cmp.w	HitBoxZEnd(a1),d5
		bhi.s	_missSE
		cmp.w	Z(a1),d6
		bcs.s	_missSE
		move.b	#$41,d0
		ori	#$01,ccr
		rts

_missSE:
		tst.b	d0
		rts

; Is the player inside this enemy's facing-relative detection box?
; The enemy's CentreX/CentreY are passed in g_Scratch1800/g_Scratch1804;
; d5 = range ahead, d6 = range behind, d7 = lateral half-range.
; Carry set = player in range.
CheckPlayerInRange:
		move.b	RotationAndSize(a5),d0
		andi.b	#DIR_MASK,d0
		beq.s	_rangeNE
		cmpi.b	#DIR_SW,d0
		bcs.w	_rangeSE
		beq.w	_rangeSW
		move.w	(g_Scratch1800).l,d1
		sub.w	d5,d1
		cmp.w	(Player_CentreX).l,d1
		bhi.w	_rangeMiss
		move.w	(g_Scratch1800).l,d1
		add.w	d6,d1
		cmp.w	(Player_CentreX).l,d1
		bcs.w	_rangeMiss
		move.w	(g_Scratch1804).l,d2
		sub.w	d7,d2
		cmp.w	(Player_CentreY).l,d2
		bhi.w	_rangeMiss
		move.w	(g_Scratch1804).l,d2
		add.w	d7,d2
		cmp.w	(Player_CentreY).l,d2
		bcs.w	_rangeMiss
		ori	#$01,ccr
		rts

_rangeNE:
		move.w	(g_Scratch1800).l,d1
		sub.w	d7,d1
		cmp.w	(Player_CentreX).l,d1
		bhi.w	_rangeMiss
		move.w	(g_Scratch1800).l,d1
		add.w	d7,d1
		cmp.w	(Player_CentreX).l,d1
		bcs.w	_rangeMiss
		move.w	(g_Scratch1804).l,d2
		sub.w	d5,d2
		cmp.w	(Player_CentreY).l,d2
		bhi.w	_rangeMiss
		move.w	(g_Scratch1804).l,d2
		add.w	d6,d2
		cmp.w	(Player_CentreY).l,d2
		bcs.w	_rangeMiss
		ori	#$01,ccr
		rts

_rangeSE:
		move.w	(g_Scratch1800).l,d1
		add.w	d5,d1
		cmp.w	(Player_CentreX).l,d1
		bcs.s	_rangeMiss
		move.w	(g_Scratch1800).l,d1
		sub.w	d6,d1
		cmp.w	(Player_CentreX).l,d1
		bhi.s	_rangeMiss
		move.w	(g_Scratch1804).l,d2
		sub.w	d7,d2
		cmp.w	(Player_CentreY).l,d2
		bhi.s	_rangeMiss
		move.w	(g_Scratch1804).l,d2
		add.w	d7,d2
		cmp.w	(Player_CentreY).l,d2
		bcs.s	_rangeMiss
		ori	#$01,ccr
		rts

_rangeSW:
		move.w	(g_Scratch1800).l,d1
		sub.w	d7,d1
		cmp.w	(Player_CentreX).l,d1
		bhi.s	_rangeMiss
		move.w	(g_Scratch1800).l,d1
		add.w	d7,d1
		cmp.w	(Player_CentreX).l,d1
		bcs.s	_rangeMiss
		move.w	(g_Scratch1804).l,d2
		add.w	d5,d2
		cmp.w	(Player_CentreY).l,d2
		bcs.s	_rangeMiss
		move.w	(g_Scratch1804).l,d2
		sub.w	d6,d2
		cmp.w	(Player_CentreY).l,d2
		bhi.s	_rangeMiss
		ori	#$01,ccr
		rts

_rangeMiss:
		tst.b	d0
		rts

; Switch to behaviour script 6 (follow the player with ledge jumps,
; looped forever) and run this tick's OnTick.
RunChaseBehaviour:
		move.w	#BHVS_CHASE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bsr.w	j_j_OnTick
		rts

; Reset to the chase state: behaviour script 6 (follow the player),
; AIState $10, hurt flag cleared (the EnemyAI_* hitstun-recovery
; entries jump here).
StartEnemyChase:
		move.w	#BHVS_CHASE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		rts

; Short-callable thunks for the AI bank.
j_j_RemoveHealth:
		jmp	(j_RemoveHealth).l

j_j_AddStatusEffect:
		jmp	(j_AddStatusEffect).l

j_j_OnTick:
		jmp	(j_OnTick).l

j_j_LoadSpriteBehaviour:
		jmp	(j_LoadSpriteBehaviour).l

j_j_CalcSpriteHitbox:
		jmp	(j_CalcSpriteHitbox).l

j_j_PlayerDeath:
		jmp	(j_PlayerDeath).l

		modend
