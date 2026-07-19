Combat		module

; Per-tick attack processing. First clears every sprite's queued action
; word, keeping only the layout-refresh bit.
HandleAttack:
		lea	(Player_X).l,a0
		move.w	#ACT_REFRESH,d0
		and.w	d0,(SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(2*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(3*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(4*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(5*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(6*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(7*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(8*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(9*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(10*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(11*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(12*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(13*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(14*SPRITE_SIZE+QueuedAction)(a0)
		and.w	d0,(15*SPRITE_SIZE+QueuedAction)(a0)
		lea	SPRITE_SIZE(a0),a5
		moveq	#$E,d7
		bclr	#$00,(g_GaiaAttackQueued).l
		bne.w	_GaiaStatueQuake
		move.w	QueuedAction(a0),d0
		andi.w	#ACT_ATTACK_MASK,d0
		cmpi.w	#ACT_ATTACK2,d0
		bcs.w	_exit
		lea	_AttackBoxSideA(pc),a1
		cmpi.w	#ACT_ATTACK2,d0
		beq.s	_CheckFullCharge
		lea	_AttackBoxSideB(pc),a1
		cmpi.w	#ACT_ATTACK3,d0
		bne.s	_CheckFullCharge
		lea	_AttackBoxWide(pc),a1
		cmpi.b	#ITM_ICESWORD,(g_ChargedSword).l
		bne.s	_CheckFullCharge
		cmpi.b	#$0B,(g_SwordSwingFrame).l
		bne.s	_CheckFullCharge
		bra.w	_SpawnChargeProjectile

; Statue of Gaia was used (items2 sets g_GaiaAttackQueued): pretend a
; charged Gaia Sword release and run the screen-wide quake attack.
_GaiaStatueQuake:
		move.b	#ITM_GAIASWORD,(g_ChargedSword).l
		bra.w	_ScreenQuakeAttack

; Charged Gaia Sword released on swing frame $0B -> screen-wide quake;
; otherwise fall through to the normal melee sweep.
_CheckFullCharge:
		lea	_AttackBoxWide(pc),a1
		cmpi.b	#ITM_GAIASWORD,(g_ChargedSword).l
		bne.s	_SweepAttackHitbox
		cmpi.b	#$0B,(g_SwordSwingFrame).l
		bne.s	_SweepAttackHitbox
		bra.w	_ScreenQuakeAttack

_SweepAttackHitbox:
		move.w	CentreY(a0),d1
		move.w	d1,d2
		move.w	CentreX(a0),d3
		move.w	d3,d4
		move.w	Z(a0),d6
		lea	SPRITE_SIZE(a0),a5
		moveq	#$E,d7
		move.b	RotationAndSize(a0),d5
		andi.b	#DIR_MASK,d5
		beq.w	_SweepFacingNE
		cmpi.b	#DIR_SW,d5
		beq.w	_SweepFacingSW
		bcs.w	_SweepFacingSE
		bra.s	_SweepFacingNW
; Sword hitbox extents relative to the player centre, rotated to the
; facing direction by the four _SweepFacing chunks:
;   {forward reach, sideways one way, sideways the other, near-edge offset}
; SideA/SideB are mirrored one-sided sweeps, Wide covers both sides and
; reaches $8 behind the centre. Selected by attack action at HandleAttack
; (ACT_ATTACK2 -> SideA, ACT_ATTACK3 -> Wide, others -> SideB), but
; _CheckFullCharge reloads _AttackBoxWide unconditionally, so in practice
; every attack uses the Wide box and the one-sided tables are vestigial.
_ATKBOX_FWD:	equ 0	; forward reach (accessed as plain (a1))
_ATKBOX_SIDE1:	equ 2
_ATKBOX_SIDE2:	equ 4
_ATKBOX_NEAR:	equ 6
_AttackBoxSideA:    dc.w $0018,$0010,$0000,$0000
_AttackBoxWide:     dc.w $0020,$0010,$0010,$FFF8
_AttackBoxSideB:    dc.w $0018,$0000,$0010,$0000

_SweepFacingNW:
		sub.w	_ATKBOX_SIDE2(a1),d1
		add.w	_ATKBOX_SIDE1(a1),d2
		add.w	_ATKBOX_NEAR(a1),d3
		sub.w	(a1),d4

_sweepLoopNW:
		move.b	(a5),d5
		bmi.w	_sweepDoneNW
		cmpi.b	#$7F,d5
		beq.w	_sweepNextNW
		move.b	InteractFlags(a5),d0
		andi.b	#$82,d0
		cmpi.b	#$80,d0
		bne.w	_sweepNextNW
		cmp.w	HitBoxYStart(a5),d2
		bcs.w	_sweepNextNW
		cmp.w	HitBoxYEnd(a5),d1
		bhi.s	_sweepNextNW
		cmp.w	HitBoxXStart(a5),d3
		bcs.s	_sweepNextNW
		cmp.w	HitBoxXEnd(a5),d4
		bhi.s	_sweepNextNW
		cmp.w	HitBoxZEnd(a5),d6
		bcc.s	_sweepNextNW
		addi.w	#$001F,d6
		cmp.w	Z(a5),d6
		bcc.s	_sweepHitNW

_sweepZRestoreNW:
		subi.w	#$001F,d6
		bra.s	_sweepNextNW

_sweepHitNW:
		btst	#$00,CombatFlags(a5)
		beq.s	_sweepDamageNW
		bset	#$03,(g_AdditionalFlags+8).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_SwordHit
		bra.s	_sweepZRestoreNW

_sweepDamageNW:
		move.w	Defence(a5),d0
		bsr.w	CalculatePlayerDamageOutput
		sub.w	d0,CurrentHealth(a5)
		bhi.s	_sweepHitstunNW
		bsr.w	MarkEnemyDead
		bra.s	_sweepNextNW

_sweepHitstunNW:
		bsr.w	StartEnemyHitstun
		move.w	#BHVS_KNOCKBACK_NW,BehaviourLUTIndex(a5)
		cmpi.b	#SpriteB_GhostGen,SpriteGraphic(a5)
		bne.s	_sweepChkGolaNW
		move.w	#BHVS_ENEMY_HITSTUN_2,BehaviourLUTIndex(a5)
		bra.s	_sweepBehavNW

_sweepChkGolaNW:
		cmpi.b	#SpriteB_Gola,SpriteGraphic(a5)
		bne.s	_sweepBehavNW
		move.w	#BHVS_KNOCK_UP,BehaviourLUTIndex(a5)

_sweepBehavNW:
		jsr	(j_LoadSpriteBehaviour).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_EnemyHit1

_sweepNextNW:
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,_sweepLoopNW

_sweepDoneNW:
		rts

_SweepFacingNE:
		add.w	_ATKBOX_NEAR(a1),d1
		sub.w	(a1),d2
		sub.w	_ATKBOX_SIDE2(a1),d3
		add.w	_ATKBOX_SIDE1(a1),d4

_sweepLoopNE:
		move.b	(a5),d5
		bmi.w	_sweepDoneNE
		cmpi.b	#$7F,d5
		beq.w	_sweepNextNE
		move.b	InteractFlags(a5),d0
		andi.b	#$82,d0
		cmpi.b	#$80,d0
		bne.w	_sweepNextNE
		cmp.w	HitBoxYEnd(a5),d2
		bhi.w	_sweepNextNE
		cmp.w	HitBoxYStart(a5),d1
		bcs.s	_sweepNextNE
		cmp.w	HitBoxXEnd(a5),d3
		bhi.s	_sweepNextNE
		cmp.w	HitBoxXStart(a5),d4
		bcs.s	_sweepNextNE
		cmp.w	HitBoxZEnd(a5),d6
		bcc.s	_sweepNextNE
		addi.w	#$001F,d6
		cmp.w	Z(a5),d6
		bcc.s	_sweepHitNE

_sweepZRestoreNE:
		subi.w	#$001F,d6
		bra.s	_sweepNextNE

_sweepHitNE:
		btst	#$00,CombatFlags(a5)
		beq.s	_sweepDamageNE
		bset	#$03,(g_AdditionalFlags+8).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_SwordHit
		bra.s	_sweepZRestoreNE

_sweepDamageNE:
		move.w	Defence(a5),d0
		bsr.w	CalculatePlayerDamageOutput
		sub.w	d0,CurrentHealth(a5)
		bhi.s	_sweepHitstunNE
		bsr.w	MarkEnemyDead
		bra.s	_sweepNextNE

_sweepHitstunNE:
		bsr.w	StartEnemyHitstun
		move.w	#BHVS_KNOCKBACK_NE,BehaviourLUTIndex(a5)
		cmpi.b	#SpriteB_GhostGen,SpriteGraphic(a5)
		bne.s	_sweepChkGolaNE
		move.w	#BHVS_ENEMY_HITSTUN_2,BehaviourLUTIndex(a5)
		bra.s	_sweepBehavNE

_sweepChkGolaNE:
		cmpi.b	#SpriteB_Gola,SpriteGraphic(a5)
		bne.s	_sweepBehavNE
		move.w	#BHVS_KNOCK_UP,BehaviourLUTIndex(a5)

_sweepBehavNE:
		jsr	(j_LoadSpriteBehaviour).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_EnemyHit1

_sweepNextNE:
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,_sweepLoopNE

_sweepDoneNE:
		rts

_SweepFacingSW:
		sub.w	_ATKBOX_NEAR(a1),d1
		add.w	(a1),d2
		sub.w	_ATKBOX_SIDE2(a1),d3
		add.w	_ATKBOX_SIDE1(a1),d4

_sweepLoopSW:
		move.b	(a5),d5
		bmi.w	_sweepDoneSW
		cmpi.b	#$7F,d5
		beq.w	_sweepNextSW
		move.b	InteractFlags(a5),d0
		andi.b	#$82,d0
		cmpi.b	#$80,d0
		bne.w	_sweepNextSW
		cmp.w	HitBoxYStart(a5),d2
		bcs.w	_sweepNextSW
		cmp.w	HitBoxYEnd(a5),d1
		bhi.s	_sweepNextSW
		cmp.w	HitBoxXEnd(a5),d3
		bhi.s	_sweepNextSW
		cmp.w	HitBoxXStart(a5),d4
		bcs.s	_sweepNextSW
		cmp.w	HitBoxZEnd(a5),d6
		bcc.s	_sweepNextSW
		addi.w	#$001F,d6
		cmp.w	Z(a5),d6
		bcc.s	_sweepHitSW

_sweepZRestoreSW:
		subi.w	#$001F,d6
		bra.s	_sweepNextSW

_sweepHitSW:
		btst	#$00,CombatFlags(a5)
		beq.s	_sweepDamageSW
		bset	#$03,(g_AdditionalFlags+8).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_SwordHit
		bra.s	_sweepZRestoreSW

_sweepDamageSW:
		move.w	Defence(a5),d0
		bsr.w	CalculatePlayerDamageOutput
		sub.w	d0,CurrentHealth(a5)
		bhi.s	_sweepHitstunSW
		bsr.w	MarkEnemyDead
		bra.s	_sweepNextSW

_sweepHitstunSW:
		bsr.w	StartEnemyHitstun
		move.w	#BHVS_KNOCKBACK_SW,BehaviourLUTIndex(a5)
		cmpi.b	#SpriteB_GhostGen,SpriteGraphic(a5)
		bne.s	_sweepChkGolaSW
		move.w	#BHVS_ENEMY_HITSTUN_2,BehaviourLUTIndex(a5)
		bra.s	_sweepBehavSW

_sweepChkGolaSW:
		cmpi.b	#SpriteB_Gola,SpriteGraphic(a5)
		bne.s	_sweepBehavSW
		move.w	#BHVS_KNOCK_UP,BehaviourLUTIndex(a5)

_sweepBehavSW:
		jsr	(j_LoadSpriteBehaviour).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_EnemyHit1

_sweepNextSW:
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,_sweepLoopSW

_sweepDoneSW:
		rts

_SweepFacingSE:
		sub.w	_ATKBOX_SIDE2(a1),d1
		add.w	_ATKBOX_SIDE1(a1),d2
		sub.w	_ATKBOX_NEAR(a1),d3
		add.w	(a1),d4

_sweepLoopSE:
		move.b	(a5),d5
		bmi.w	_sweepDoneSE
		cmpi.b	#$7F,d5
		beq.w	_sweepNextSE
		move.b	InteractFlags(a5),d0
		andi.b	#$82,d0
		cmpi.b	#$80,d0
		bne.w	_sweepNextSE
		cmp.w	HitBoxYStart(a5),d2
		bcs.w	_sweepNextSE
		cmp.w	HitBoxYEnd(a5),d1
		bhi.s	_sweepNextSE
		cmp.w	HitBoxXEnd(a5),d3
		bhi.s	_sweepNextSE
		cmp.w	HitBoxXStart(a5),d4
		bcs.s	_sweepNextSE
		cmp.w	HitBoxZEnd(a5),d6
		bcc.s	_sweepNextSE
		addi.w	#$001F,d6
		cmp.w	Z(a5),d6
		bcc.s	_sweepHitSE

_sweepZRestoreSE:
		subi.w	#$001F,d6
		bra.s	_sweepNextSE

_sweepHitSE:
		btst	#$00,CombatFlags(a5)
		beq.s	_sweepDamageSE
		bset	#$03,(g_AdditionalFlags+8).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_SwordHit
		bra.s	_sweepZRestoreSE

_sweepDamageSE:
		move.w	Defence(a5),d0
		bsr.w	CalculatePlayerDamageOutput
		sub.w	d0,CurrentHealth(a5)
		bhi.s	_sweepHitstunSE
		bsr.w	MarkEnemyDead
		bra.s	_sweepNextSE

_sweepHitstunSE:
		bsr.s	StartEnemyHitstun
		move.w	#BHVS_KNOCKBACK_SE,BehaviourLUTIndex(a5)
		cmpi.b	#SpriteB_GhostGen,SpriteGraphic(a5)
		bne.s	_sweepChkGolaSE
		move.w	#BHVS_ENEMY_HITSTUN_2,BehaviourLUTIndex(a5)
		bra.s	_sweepBehavSE

_sweepChkGolaSE:
		cmpi.b	#SpriteB_Gola,SpriteGraphic(a5)
		bne.s	_sweepBehavSE
		move.w	#BHVS_KNOCK_UP,BehaviourLUTIndex(a5)

_sweepBehavSE:
		jsr	(j_LoadSpriteBehaviour).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_EnemyHit1

_sweepNextSE:
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,_sweepLoopSE

_sweepDoneSE:
		rts


; Puts an enemy into hitstun; if a charged sword landed the hit, records
; which one in RenderFlags bits 0-2 (Magic/Ice/Thunder) so
; BuildVdpSpriteEntry overlays that sword's hit effect.
StartEnemyHitstun:
		bset	#ACTBH_DAMAGE,QueuedAction(a5)
		clr.b	AIState(a5)
		bset	#$01,InteractFlags(a5)
		andi.b	#$F8,RenderFlags(a5)
		move.b	(g_ChargedSword).l,d0
		beq.s	_hitstunDone
		cmpi.b	#ITM_MAGICSWORD,d0
		bne.s	_notMagic
		bset	#$00,RenderFlags(a5)
		bra.s	_hitstunDone

_notMagic:
		cmpi.b	#ITM_THUNDERSWORD,d0
		bne.s	_notThunder
		bset	#$02,RenderFlags(a5)
		bra.s	_hitstunDone

_notThunder:
		cmpi.b	#ITM_ICESWORD,d0
		bne.s	_notIce
		bset	#$01,RenderFlags(a5)
		bra.s	_hitstunDone

_notIce:
		nop

_hitstunDone:
		rts


; Returns carry set if any vulnerable hostile enemy is present in the
; room, ignoring permanent hostiles (fixed obstacles and respawning
; ghosts, marked by the sentinel ItemDropProbability = $0001 with
; zero gold). Used by the Statue of Gaia to refuse activation
; otherwise.
AnyHostileEnemies:
		lea	(Sprite1_X).l,a5
		moveq	#$E,d7

_anyLoop:
		move.b	(a5),d5
		bmi.s	_anyNone
		cmpi.b	#$7F,d5
		beq.s	_anyNext
		move.b	InteractFlags(a5),d0
		andi.b	#$82,d0
		cmpi.b	#$80,d0
		bne.s	_anyNext
		cmpi.w	#$0001,ItemDropProbability(a5)
		bne.s	_anyFound
		tst.b	GoldOrChestContents(a5)
		bne.s	_anyFound

_anyNext:
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,_anyLoop

_anyNone:
		tst.b	d0
		rts

_anyFound:
		ori	#$01,ccr
		rts


; Damage every on-screen vulnerable enemy (charged Gaia Sword release or
; Statue of Gaia), then run GaiaEffect if anything was hit. The Lava
; Room ($20A) triggers GaiaEffect even with no enemies hit.
_ScreenQuakeAttack:
		clr.b	d6

_quakeLoop:
		move.b	(a5),d5
		bmi.w	_quakeCheckRoom
		cmpi.b	#$7F,d5
		beq.s	_quakeNext
		move.b	InteractFlags(a5),d0
		andi.b	#$82,d0
		cmpi.b	#$80,d0
		bne.s	_quakeNext
		cmpi.w	#$0001,ItemDropProbability(a5)
		bne.s	_quakeDamage
		tst.b	GoldOrChestContents(a5)
		beq.s	_quakeNext

_quakeDamage:
		tst.l	ScreenX(a5)
		beq.s	_quakeMark
		btst	#$00,CombatFlags(a5)
		bne.s	_quakeMark
		move.w	Defence(a5),d0
		bsr.w	CalculatePlayerDamageOutput
		sub.w	d0,CurrentHealth(a5)
		bhi.s	_quakeHitstun
		bsr.w	MarkEnemyDead
		bra.s	_quakeMark

_quakeHitstun:
		bsr.w	StartEnemyHitstun
		move.w	#BHVS_KNOCKBACK_BACK,BehaviourLUTIndex(a5)
		jsr	(j_LoadSpriteBehaviour).l

_quakeMark:
		move.b	#$01,d6

_quakeNext:
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,_quakeLoop

_quakeCheckRoom:
		cmpi.w	#ROOM_LAVA_STATUE,(g_CurrentRoom).l	  ; Lava Room
		beq.s	_quakeEffect
		tst.b	d6
		beq.s	_quakeDone

_quakeEffect:
		bsr.w	GaiaEffect
		rts

_quakeDone:
		rts


MarkEnemyDead:
		andi.b	#$7F,InteractFlags(a5)
		clr.w	BehavParam(a5)
		bset	#$02,CombatFlags(a5)
		clr.b	AICounter(a5)
		cmpi.b	#SPR_MUMMY3,SpriteType(a5)
		bne.s	_markDeadDone
		move.w	#100,d6
		jsr	(j_GenerateRandomNumber).l
		cmpi.w	#50,d7
		bcs.s	_markDeadDone
		move.b	#$01,AICounter(a5)
		andi.b	#$7F,InitInteractFlags(a5)

_markDeadDone:
		rts


; Charged Ice Sword released on swing frame $0B: spawn the ice
; projectile in a free sprite slot in front of the player.
_SpawnChargeProjectile:
		bsr.w	HostileEnemiesPresent
		tst.b	d6
		beq.w	_projDone
		jsr	(FindFreeSpriteSlot).l
		bcs.w	_projDone
		move.w	(Player_X).l,d0
		move.b	(Player_RotationAndSize).l,d1
		andi.b	#DIR_MASK,d1
		beq.s	_projNE
		cmpi.b	#DIR_SW,d1
		bcs.s	_projSE
		beq.s	_projSW
		subi.w	#$0200,d0	; NW
		bra.s	_projSet

_projNE:
		subq.b	#$02,d0
		bra.s	_projSet

_projSE:
		addi.w	#$0200,d0
		bra.s	_projSet

_projSW:
		addq.b	#$02,d0

_projSet:
		move.w	d0,(a1)
		move.b	d1,RotationAndSize(a1)
		move.b	#$78,d2
		move.w	(Player_Z).l,d3
		addi.w	#$0010,d3
		move.w	d3,Z(a1)
		move.w	(Player_SubX).l,SubX(a1)
		move.w	#$47C0,TileSource(a1)
		move.w	#BHVS_PLAYER_PROJECTILE,BehaviourLUTIndex(a1)
		move.b	#$04,Speed(a1)
		jsr	(InitSpawnedSprite).l

_projDone:
		rts


; Same predicate as AnyHostileEnemies but returns d6 = 1 instead of
; carry; used to require a target before spawning the charge projectile.
HostileEnemiesPresent:
		clr.b	d6

_presLoop:
		move.b	(a5),d5
		bmi.w	_presDone
		cmpi.b	#$7F,d5
		beq.s	_presNext
		move.b	InteractFlags(a5),d0
		andi.b	#$82,d0
		cmpi.b	#$80,d0
		bne.s	_presNext
		cmpi.w	#$0001,ItemDropProbability(a5)
		bne.s	_presMark
		tst.b	GoldOrChestContents(a5)
		beq.s	_presNext

_presMark:
		move.b	#$01,d6

_presNext:
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,_presLoop

_presDone:
		rts


ProcessDeadEnemies:
		lea	(Sprite1_X).l,a5
		moveq	#$E,d7

_deadLoop:
		tst.w	(a5)
		bmi.s	_deadDone
		bclr	#$02,CombatFlags(a5)
		beq.s	_deadNext
		tst.b	AICounter(a5)
		bne.w	_MummyRevive
		bsr.s	_HandleEnemyDeath

_deadNext:
		lea	SPRITE_SIZE(a5),a5
		dbf	d7,_deadLoop

_deadDone:
		rts


; Enemy death: permanent hostiles (the $0001 + zero-gold sentinel; the
; killable ones being the respawning ghosts) either re-hostile with
; $100 health or hide once their story flag is set. Everyone else
; rolls the 1-in-N item drop (corpse becomes an item box, if another
; item box isn't already on screen and the item limit allows), else
; drops GoldOrChestContents gold as a moneybag, else just despawns.
_HandleEnemyDeath:
		tst.b	(g_Flags+5).l
		bmi.w	_deathScripted
		move.w	ItemDropProbability(a5),d6
		cmpi.w	#$0001,d6
		bne.s	_deathNormal
		tst.b	GoldOrChestContents(a5)
		bne.s	_deathNormal
		btst	#$00,(g_Flags+3).l
		beq.s	_ghostRespawn
		bsr.w	SetSacredTreeCutFlag

_deathHide:
		jmp	(j_HideSprite).l

_ghostRespawn:
		bset	#$07,InteractFlags(a5)
		move.w	#$0100,CurrentHealth(a5)
		rts

_deathNormal:
		trap	#$00			  ; Trap00Handler
		dc.w SND_EnemyDie1
		tst.w	d6
		beq.s	_dropMoney
		jsr	(j_GenerateRandomNumber).l
		tst.w	d7
		bne.s	_dropMoney
		lea	(Sprite1_X).l,a0
		moveq	#$E,d7

_boxScanLoop:
		move.b	(a0),d0
		bmi.s	_dropItemBox
		cmpi.b	#$7F,d0
		beq.s	_boxScanNext
		cmpi.b	#SpriteB_ItemBox,SpriteGraphic(a0)
		beq.s	_dropMoney

_boxScanNext:
		lea	SPRITE_SIZE(a0),a0
		dbf	d7,_boxScanLoop

_dropItemBox:
		move.b	ItemDrop(a5),d0
		jsr	(j_GetRemainingItemAllowedCount).l
		tst.w	d1
		beq.s	_dropMoney
		move.w	#$0060,Dialogue(a5)
		move.b	#SpriteB_ItemBox,SpriteGraphic(a5)
		clr.b	GoldOrChestContents(a5)
		bra.s	_dropCommon

_dropMoney:
		tst.b	GoldOrChestContents(a5)
		beq.w	_deathHide
		move.w	#$000A,Dialogue(a5)
		move.b	#SpriteB_Moneybag,SpriteGraphic(a5)

_dropCommon:
		move.w	#BHV_LOOT,BehavParam(a5)
		cmpi.b	#$10,Height(a5)
		bcc.s	_dropTall

_dropShort:
		move.w	Z(a5),d0
		addi.w	#$000F,d0
		move.w	d0,HitBoxZEnd(a5)
		bra.s	_dropFinish

_dropTall:
		move.w	HitBoxZEnd(a5),d0
		subi.w	#$000F,d0
		cmp.b	FloorHeight(a5),d0
		bcs.s	_dropShort
		move.w	d0,Z(a5)

_dropFinish:
		move.b	#$08,RotationAndSize(a5)
		move.b	#$10,Height(a5)
		clr.l	BehaviourLUTPtr(a5)
		clr.w	CurrentHealth(a5)
		clr.b	CombatFlags(a5)
		clr.w	FallRate(a5)
		andi.b	#$7F,InteractFlags(a5)
		andi.b	#$3F,RotationAndSize(a5)
		bset	#$07,AnimCtrl(a5)
		bset	#$07,RenderFlags(a5)
		andi.b	#$9F,TileSource(a5)
		ori.b	#$40,TileSource(a5)
		clr.w	AnimationIndex(a5)
		clr.w	AnimationFrame(a5)
		bset	#$00,InteractFlags(a5)
		bclr	#$06,InteractFlags(a5)
		movea.l	a5,a1
		bsr.w	LookupSpriteAnimFlags
		bsr.w	CalcSpriteHitbox

_exit:
		rts

_deathScripted:
		trap	#$00			  ; Trap00Handler
		dc.w SND_EnemyDie1
		andi.b	#$7F,InteractFlags(a5)
		bset	#$00,(g_Flags+1).l
		rts

; Mummy revival: steps a $38-frame get-up animation, then re-hostiles
; the mummy at full health (see AICounter in entity.inc).
_MummyRevive:
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		addq.b	#$01,AICounter(a5)
		cmpi.b	#$08,AICounter(a5)
		bcs.w	_reviveStep
		move.w	#ACT_ATTACK4,QueuedAction(a5)
		cmpi.b	#$10,AICounter(a5)
		bcs.w	_reviveStep
		move.w	#ACT_ATTACK5,QueuedAction(a5)
		cmpi.b	#$20,AICounter(a5)
		bcs.w	_reviveStep
		move.w	#ACT_ATTACK4,QueuedAction(a5)
		cmpi.b	#$28,AICounter(a5)
		bcs.w	_reviveStep
		move.w	#ACT_ATTACK3,QueuedAction(a5)
		cmpi.b	#$30,AICounter(a5)
		bcs.w	_reviveStep
		move.w	#ACT_ATTACK2,QueuedAction(a5)
		cmpi.b	#$38,AICounter(a5)
		bcs.w	_reviveStep
		ori.b	#$80,InteractFlags(a5)
		ori.b	#$80,InitInteractFlags(a5)
		move.w	MaxHealth(a5),CurrentHealth(a5)
		movem.w	d7,-(sp)
		jsr	(j_RunEnemyAI_B).l
		movem.w	(sp)+,d7
		bra.w	_deadNext

_reviveStep:
		bset	#$02,CombatFlags(a5)
		bra.w	_deadNext


; Per-tick player damage handler: consumes g_PlayerPendingHit ($80 =
; contact hit, recoil away from facing; else bits 0-1 = hit direction),
; applies CalculateEnemyDamageOutput, rolls to shake off paralysis,
; plays the recoil, and runs the hurt/invulnerability timer
; (g_PlayerHurtTimer) with its blink flicker.
ProcessPlayerDamage:
		tst.b	(g_PlayerAnimation).l
		bne.w	_dmgDone
		tst.b	(g_PlayerHurtTimer).l
		bne.w	_UpdateHurtTimer
		move.b	(g_PlayerPendingHit).l,d1
		beq.w	_dmgDone
		movem.w	d1,-(sp)
		lea	(Player_X).l,a5
		bsr.w	CalculateEnemyDamageOutput
		bsr.w	RemoveHealth
		movem.w	(sp)+,d1
		tst.w	CurrentHealth(a5)
		beq.w	PlayerDeath
		btst	#STATUS_PARALYSIS,(g_PlayerStatus).l
		beq.s	_dmgKnockback
		move.b	(g_ParalysisCheckCount).l,d0
		addq.b	#$02,(g_ParalysisCheckCount).l
		ext.w	d0
		move.w	ParalysisClearChance(pc,d0.w),d6
		jsr	(j_GenerateRandomNumber).l
		tst.w	d7
		bne.s	_dmgKnockback
		move.b	#STATUS_PARALYSIS,d0
		bsr.w	ClearPlayerStatus

_dmgKnockback:
		tst.b	d1
		bmi.s	_dmgFromFacing
		andi.b	#$03,d1
		eori.b	#$02,d1
		andi.b	#$3F,(Player_RotationAndSize).l
		move.b	d1,d0
		lsl.b	#$06,d0
		or.b	d0,(Player_RotationAndSize).l
		bra.s	_dmgRecoil
ParalysisClearChance:
		dc.w $0003
		dc.w $0002
		dc.w $0001

_dmgFromFacing:
		move.b	(Player_RotationAndSize).l,d1
		lsr.b	#$06,d1

_dmgRecoil:
		ext.w	d1
		move.b	DamageRecoilCmd(pc,d1.w),d0
		bsr.w	PlaybackInput
		move.b	#$01,(g_PlayerHurtTimer).l
		bset	#ACTBH_DAMAGE,(Player_Action).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_NigelHit1
		bset	#$01,(Player_InteractFlags).l
		clr.b	(g_PlayerPendingHit).l

_dmgDone:
		rts

DamageRecoilCmd:dc.b $07, $05, $06, $04

PlayerDeath:
		clr.b	(g_PlayerHurtTimer).l
		clr.b	(g_PlayerPendingHit).l
		move.b	#$01,(g_PlayerAnimation).l
		move.b	#$08,d0
		bsr.w	PlaybackInput
		trap	#$00			  ; Trap00Handler
		dc.w SND_NigelDie
		clr.b	(g_PlayerStatus).l
		rts

_UpdateHurtTimer:
		clr.b	(g_PlayerPendingHit).l
		addq.b	#$01,(g_PlayerHurtTimer).l
		cmpi.b	#$02,(g_PlayerHurtTimer).l
		bne.s	_hurtChk10
		bset	#$00,(Player_InteractFlags).l
		rts

_hurtChk10:
		cmpi.b	#$10,(g_PlayerHurtTimer).l
		bcs.s	_hurtDone
		bne.s	_hurtChk40
		andi.b	#$F8,(Player_RenderFlags).l
		bclr	#$00,(Player_InteractFlags).l
		rts

_hurtChk40:
		cmpi.b	#$40,(g_PlayerHurtTimer).l
		bne.s	_hurtFlicker
		clr.b	(g_PlayerHurtTimer).l
		bclr	#$01,(Player_InteractFlags).l

_hurtFlicker:
		move.b	(Player_RenderFlags).l,d0
		andi.b	#$07,d0
		bne.s	_hurtDone
		bchg	#$06,(Player_InteractFlags).l

_hurtDone:
		rts


CalculatePlayerDamageOutput:
		movem.w	d1/d6-d7,-(sp)
		move.w	d0,d1
		move.w	(Player_MaxHealth).l,d0
		lsr.w	#$02,d0
		sub.w	d1,d0
		bmi.s	_clampMin
		cmpi.w	#$0100,d0
		bcc.s	_rollDamage

_clampMin:
		move.w	#$0100,d0

_rollDamage:
		move.w	d0,d1
		lsr.w	#$08,d0
		move.w	#$0060,d6
		jsr	(j_GenerateRandomNumber).l
		mulu.w	d7,d0
		add.w	d1,d0
		move.b	(g_ChargedSword).l,d1
		beq.s	_pdmgDone
		ext.w	d1
		add.b	d1,d1
		move.w	(ChargedSwordBoost-2)(pc,d1.w),d1
		mulu.w	d1,d0
		divu.w	#$0100,d0

_pdmgDone:
		movem.w	(sp)+,d1/d6-d7
		rts

; Charged-hit damage multiplier per sword (/$100):
; Magic 1.75x, Ice 1.5x, Thunder 2x, Gaia 1.25x
ChargedSwordBoost:dc.w $01C0, $0180, $0200, $0140


CalculateEnemyDamageOutput:
		movem.w	d1/d6-d7,-(sp)
		moveq	#$0,d0
		move.w	(Player_AttackStrength).l,d0
		beq.w	_edmgDone
		move.w	(Player_Defence).l,d1
		mulu.w	d1,d0
		lsr.l	#$08,d0
		move.w	d0,d1
		lsr.w	#$08,d0
		move.w	#$0060,d6
		jsr	(j_GenerateRandomNumber).l
		mulu.w	d7,d0
		add.w	d1,d0

_edmgDone:
		movem.w	(sp)+,d1/d6-d7
		rts


; Per-tick status effects: poison damages $0100 every $80 steps while
; walking (white palette flash, wears off after g_PoisonHitsLeft hits),
; paralysis counts down g_ParalysisTimer, and Healing Boots restore
; $0100 every 256 steps.
UpdatePlayerStatusEffects:
		cmpi.b	#$01,(Player_AnimCtrl).l
		beq.w	_statusDone
		move.b	(g_PlayerStatus).l,d0
		andi.b	#$11,d0
		cmpi.b	#$01,d0			  ; poisoned (bit 0) and NOHEAL (bit 4) clear
		bne.s	_chkParalysis
		move.b	(Player_Action+1).l,d0
		andi.b	#$0F,d0
		beq.s	_chkParalysis
		cmpi.b	#$01,(g_PlayerSpeed+1).l
		beq.s	_chkParalysis
		move.b	(g_PoisonStepCounter).l,d0
		addq.b	#$01,(g_PoisonStepCounter).l
		andi.b	#$7F,d0
		bne.s	_chkParalysis
		move.w	#$0100,d0
		lea	(Player_X).l,a5
		bsr.w	RemoveHealth
		tst.w	(Player_CurrentHealth).l
		beq.w	PlayerDeath
		lea	(g_Pal0Active).l,a0
		moveq	#$F,d7

_whiteFlashLoop:
		move.w	#$0EEE,(a0)+
		dbf	d7,_whiteFlashLoop
		jsr	(j_QueueFullPaletteDMA).l
		subq.b	#$01,(g_PoisonHitsLeft).l
		beq.s	_poisonWornOff

_chkParalysis:
		btst	#STATUS_PARALYSIS,(g_PlayerStatus).l
		beq.s	_chkHealBoots
		subq.w	#$01,(g_ParalysisTimer).l
		bne.s	_chkHealBoots
		move.b	#STATUS_PARALYSIS,d0
		bsr.w	ClearPlayerStatus

_chkHealBoots:
		cmpi.b	#ITM_HEALINGBOOTS,(g_EquippedBoots).l
		bne.s	_statusDone
		move.b	(g_PlayerStatus).l,d0
		andi.b	#$10,d0
		bne.s	_statusDone
		move.b	(Player_Action+1).l,d0
		andi.b	#$0F,d0
		beq.s	_statusDone
		cmpi.b	#$01,(g_PlayerSpeed+1).l
		beq.s	_statusDone
		move.b	(g_StepCounter).l,d0
		addq.b	#$01,(g_StepCounter).l
		bne.s	_statusDone
		move.w	#$0100,d0
		lea	(Player_X).l,a5
		bsr.w	AddHealth

_statusDone:
		rts

_poisonWornOff:
		clr.b	d0
		bsr.w	ClearPlayerStatus
		bra.s	_chkParalysis


RestorePalette0:
		tst.w	(g_Pal0Active).l
		beq.s	_palDone
		lea	(g_Pal0Base).l,a0
		lea	(g_Pal0Active).l,a1
		moveq	#$F,d7

_palLoop:
		move.w	(a0)+,(a1)+
		dbf	d7,_palLoop
		jsr	(j_QueueFullPaletteDMA).l
		jsr	(j_FlushDMACopyQueue).l

_palDone:
		rts


; Earthquake effect: temporarily equips the Gaia Sword (graphics and
; palette), rumbles, and runs the screen shake + falling debris via
; RunQuakeEffect, then restores the real equipment.
GaiaEffect:
		move.b	(g_EquippedSword).l,d0
		movem.w	d0,-(sp)
		move.b	#ITM_GAIASWORD,(g_EquippedSword).l
		jsr	(j_LoadMagicSwordGfx).l
		jsr	(j_UpdateEquipPal).l
		jsr	(j_CopyBasePaletteToActivePalette).l
		move.w	(g_VSRAMData).l,d0
		move.w	(g_VSRAMData+2).l,d1
		movem.w	d0-d1,-(sp)
		trap	#$00			  ; Trap00Handler
		dc.w SND_Rumble
		bsr.s	RunQuakeEffect
		move.b	#$10,(g_VDPSpr15_Link).l
		move.b	#$4F,(g_VDPSpr78_Link).l
		movem.w	(sp)+,d0-d1
		move.w	d0,(g_VSRAMData).l
		move.w	d1,(g_VSRAMData+2).l
		jsr	(j_QueueVSRAMUpdate).l
		movem.w	(sp)+,d0
		move.b	d0,(g_EquippedSword).l
		jsr	(j_LoadMagicSwordGfx).l
		jsr	(j_UpdateEquipPal).l
		jsr	(j_CopyBasePaletteToActivePalette).l
		jmp	(j_FlushDMACopyQueue).l


; Drives the quake: claims the free tail of the VDP sprite table for
; debris particles, then loops shake + debris updates until
; CheckQuakeDone unwinds the loop (see note there).
RunQuakeEffect:
		lea	(g_VDPSpr16_Y).l,a0
		move.b	#$10,d3
		move.w	#$003E,d7

_findFreeSpr:
		tst.w	(a0)
		beq.s	_clampDebrisCount
		addq.b	#$01,d3
		addq.w	#$08,a0
		dbf	d7,_findFreeSpr
		rts

_clampDebrisCount:
		cmpi.b	#$28,d7
		bcs.s	_startQuake
		move.b	#$28,d7

_startQuake:
		move.b	d3,(g_VDPSpr15_Link).l
		bsr.s	InitQuakeDebris

_quakeMainLoop:
		bsr.w	QuakeScreenShake
		bsr.w	UpdateQuakeDebris
		jsr	(j_FlushDMACopyQueue).l
		bsr.w	CheckQuakeDone
		bra.s	_quakeMainLoop


; Fills the claimed VDP sprites with debris: random X/Y above the
; screen, cycling rock tiles ($C78C/$C79C/$C7AC).
InitQuakeDebris:
		movea.l	a0,a1
		move.w	d7,d6
		move.w	#$C78C,d0
		clr.b	d1
		move.w	#$0004,d4
		clr.b	d5
		movem.w	d6-d7,-(sp)

_debrisInitLoop:
		movem.w	d7,-(sp)
		move.w	#$00E0,d6
		jsr	(j_GenerateRandomNumber).l
		subi.w	#$0060,d7
		move.w	d7,(a0)
		move.b	#$0F,$2(a0)
		move.w	d0,$4(a0)
		move.w	#$0140,d6
		jsr	(j_GenerateRandomNumber).l
		addi.w	#$0080,d7
		move.w	d7,$6(a0)
		addi.w	#$0010,d0
		addq.b	#$01,d1
		cmpi.b	#$03,d1
		bcs.s	_debrisInitNext
		clr.b	d1
		subi.w	#$0030,d0

_debrisInitNext:
		addq.w	#$08,a0
		movem.w	(sp)+,d7
		dbf	d7,_debrisInitLoop
		movem.w	(sp)+,d6-d7
		move.w	#$0001,-$8(a0)
		move.b	#$10,-$5(a0)
		rts


; Screen shake: offsets both vertical scroll values by +/-d4,
; alternating each frame.
QuakeScreenShake:
		add.w	d4,(g_VSRAMData).l
		add.w	d4,(g_VSRAMData+2).l
		jsr	(j_QueueVSRAMUpdate).l
		neg.w	d4
		rts


; Advances each debris particle downwards (fall speed by rock tile:
; 7/5/3), recycling it at the bottom of the screen at a random X until
; two waves have fallen, then despawning it.
UpdateQuakeDebris:
		movea.l	a1,a0
		move.w	d6,d7
		clr.b	d0

_debrisLoop:
		tst.l	$4(a0)
		beq.s	_debrisNext
		move.w	#$0007,d1
		cmpi.w	#$C78C,$4(a0)
		beq.s	_debrisFall
		move.w	#$0005,d1
		cmpi.w	#$C79C,$4(a0)
		beq.s	_debrisFall
		move.w	#$0003,d1

_debrisFall:
		add.w	d1,(a0)
		tst.w	(a0)
		bmi.s	_debrisNext
		cmpi.w	#$0138,(a0)
		bcs.s	_debrisNext
		cmpi.b	#$02,d5
		bne.s	_debrisRecycle
		clr.w	(a0)
		clr.b	$2(a0)
		clr.w	$4(a0)
		clr.w	$6(a0)
		bra.s	_debrisNext

_debrisRecycle:
		move.w	#$0088,(a0)
		movem.w	d6-d7,-(sp)
		move.w	#$0140,d6
		jsr	(j_GenerateRandomNumber).l
		addi.w	#$0080,d7
		move.w	d7,$6(a0)
		movem.w	(sp)+,d6-d7

_debrisNext:
		addq.w	#$08,a0
		dbf	d7,_debrisLoop
		cmpi.w	#$00F8,-$8(a0)
		bcs.s	_debrisDone
		move.w	#$0001,-$8(a0)
		addq.b	#$01,d5
		cmpi.b	#$02,d5
		bcs.s	_debrisDone
		clr.w	-$8(a0)
		clr.b	-$6(a0)
		clr.w	-$4(a0)
		clr.w	-$2(a0)

_debrisDone:
		rts


; Ends the quake: if any debris particle is still active, returns
; normally; once all are gone it pops its own return address (the
; movem.l below), so the rts exits RunQuakeEffect's infinite loop
; straight back to RunQuakeEffect's caller.
CheckQuakeDone:
		movea.l	a1,a0
		move.w	d6,d7

_chkDebrisLoop:
		tst.w	$4(a0)
		bne.s	_chkDebrisDone
		addq.w	#$08,a0
		dbf	d7,_chkDebrisLoop
		movem.l	(sp)+,a0

_chkDebrisDone:
		rts

		modend
