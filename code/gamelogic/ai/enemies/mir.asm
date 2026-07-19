Mir	module
; AI for SPR_MIR, the Mir boss fight. Mir hovers at a fixed ring
; distance from the player, always turned to face him: more than $70
; away on either axis he closes in (BHVS_CHASE_8), closer than $60 on
; both axes he slips away (BHVS_FLEE_8, 8 ticks at a time - the
; dodging), and from the band in between he summons a fireball
; (AttackStrength $300) aimed straight at the player. He has no idle:
; any state but the hover ($10) runs the casting sequence, so he
; opens the fight with a fireball. The A routine holds InteractFlags
; bit 0 every tick (cleared just for the facing update -
; SetSpriteRotationAnimFlags only applies the SE/SW mirror flag while
; it is clear) and keeps CombatFlags bit 1 (walk backwards) clear.

; B routine (behaviour command $2B): back to hovering.
EnemyAI_Mir_B:
		bra.s	EnemyAI_Mir

; A routine, run every tick.
EnemyAI_Mir_A:
		bset	#$00,InteractFlags(a5)
		bclr	#$01,CombatFlags(a5)
		btst	#$01,InteractFlags(a5)
		bne.w	_tick
		move.b	AIState(a5),d0
		cmpi.b	#$10,d0
		bne.w	_cast
		bra.s	_hover

; Cast-over / hitstun recovery: hover (AIState $10) on the idle
; behaviour.
EnemyAI_Mir:
		move.w	#BHVS_IDLE,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		move.b	#$10,AIState(a5)
		bclr	#$01,InteractFlags(a5)
		rts

; State $10: hover. Turn to face the player, then keep the ring
; distance: outside a +-$70 window of him on either axis - approach;
; inside +-$60 on both axes - flee; in the band between - start
; summoning (state $20).
_hover:
		bsr.w	GetDirToPlayer
		move.b	d2,d1
		movea.l	a5,a1
		bclr	#$00,InteractFlags(a5)
		jsr	(j_SetSpriteRotationAnimFlags).l
		bset	#$07,RenderFlags(a5)
		clr.b	AnimCtrl(a5)
		move.w	(Player_CentreX).l,d0
		subi.w	#$0070,d0
		move.w	CentreX(a5),d1
		sub.w	d0,d1
		cmpi.w	#$00E0,d1
		bcc.s	_approach
		move.w	(Player_CentreY).l,d0
		subi.w	#$0070,d0
		move.w	CentreY(a5),d2
		sub.w	d0,d2
		cmpi.w	#$00E0,d2
		bcc.s	_approach
		move.w	(Player_CentreX).l,d0
		subi.w	#$0060,d0
		move.w	CentreX(a5),d1
		sub.w	d0,d1
		cmpi.w	#$00C0,d1
		bcc.s	_startCast
		move.w	(Player_CentreY).l,d0
		subi.w	#$0060,d0
		move.w	CentreY(a5),d2
		sub.w	d0,d2
		cmpi.w	#$00C0,d2
		bcc.s	_startCast
		move.w	#BHVS_FLEE_8,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour

_tick:
		bsr.w	j_j_OnTick
		rts

_approach:
		move.w	#BHVS_CHASE_8,BehaviourLUTIndex(a5)
		bsr.w	j_j_LoadSpriteBehaviour
		bra.s	_tick

_startCast:
		clr.b	AICounter(a5)
		move.b	#$20,AIState(a5)
		rts

; Compute the quadrant direction from the sprite toward the player
; in d2 (DIR_NE/SE/SW/NW), from the isometric axis tests on dx+dy
; and dx-dy - used for facing and for aiming projectiles. Also
; called by Zak, Ifrit and Gola.
GetDirToPlayer:
		move.w	CentreX(a5),d0
		sub.w	(Player_CentreX).l,d0
		move.w	CentreY(a5),d1
		sub.w	(Player_CentreY).l,d1
		movem.w	d0-d1,-(sp)
		add.w	d0,d1
		bpl.s	_dirSouthOf
		movem.w	(sp)+,d0-d1
		move.b	#$80,d2
		sub.w	d1,d0
		bpl.s	_dirRts
		move.b	#$40,d2
		bra.s	_dirRts

_dirSouthOf:
		movem.w	(sp)+,d0-d1
		move.b	#$C0,d2
		sub.w	d1,d0
		bpl.s	_dirRts
		clr.b	d2

_dirRts:
		rts

; Summon a fireball (every state but $10, including the initial
; state 0): turn to face the player, force the casting animation
; (animation index 8/$C, frame 0, ACT_ATTACK1), then run the
; sequence on AICounter: tick 1 - load the fireball's flame graphics
; (shared with the Magic Sword's burn animation) to VRAM $9880 (tail
; call); tick 2 - load the projectile palette; tick $F - briefly
; point RotationAndSize at the player, spawn the fireball (type 1,
; AttackStrength $300; back to the hover if no free slot) and
; restore the facing; then recover (frame 4, ACT_ATTACK2) until
; tick $1E.
_cast:
		bset	#$07,RenderFlags(a5)
		bsr.w	GetDirToPlayer
		move.b	d2,d1
		movea.l	a5,a1
		bclr	#$00,InteractFlags(a5)
		jsr	(j_SetSpriteRotationAnimFlags).l
		bset	#$00,InteractFlags(a5)
		andi.w	#$0004,AnimationIndex(a5)
		addi.w	#$0008,AnimationIndex(a5)
		move.b	#$01,AnimCtrl(a5)
		andi.b	#$BF,InteractFlags(a5)
		addq.b	#$01,AICounter(a5)
		move.w	#$0000,AnimationFrame(a5)
		move.w	#ACT_ATTACK1,QueuedAction(a5)
		cmpi.b	#$01,AICounter(a5)
		bne.s	_castPalette
		lea	($00009880).l,a2
		move.b	#ITM_MAGICSWORD,d0
		jmp	(j_LoadMagicSwordEffect).l

_castPalette:
		cmpi.b	#$02,AICounter(a5)
		bne.w	_castThrow
		move.b	#$01,d0
		bra.w	LoadProjectilePalette

_castThrow:
		cmpi.b	#$0F,AICounter(a5)
		bhi.w	_castRecover
		bcs.w	_castWait
		bsr.w	GetDirToPlayer
		move.b	RotationAndSize(a5),d0
		movem.w	d0,-(sp)
		andi.b	#$3F,RotationAndSize(a5)
		or.b	d2,RotationAndSize(a5)
		move.b	#$01,d0
		move.w	#$0300,d1
		bsr.w	SpawnSmallProjectile
		bcs.s	_throwFail
		movem.w	(sp)+,d0
		move.b	d0,RotationAndSize(a5)
		rts

_throwFail:
		movem.w	(sp)+,d0
		move.b	d0,RotationAndSize(a5)
		bra.w	EnemyAI_Mir

_castRecover:
		move.w	#$0004,AnimationFrame(a5)
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$1E,AICounter(a5)
		beq.w	EnemyAI_Mir

_castWait:
		rts

		modend
