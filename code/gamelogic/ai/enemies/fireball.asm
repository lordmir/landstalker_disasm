Fireball	module
; AI for SPR_SMLFIREBALL, the projectile thrown by the casters
; (spectres and reapers; Ifrit summons the medium fireball
; instead). The AI only holds it invincible
; (CombatFlags bit 0, every tick); its behaviour script
; (BHVS_ENEMY_PROJECTILE: no gravity, fly straight for 32 ticks,
; despawn) does the flying, and contact does the damage. The B
; routine is a nop that falls straight through into the A routine.

EnemyAI_SmallFireball_B:
		nop

EnemyAI_SmallFireball_A:
		bset	#$00,CombatFlags(a5)
		bsr.w	j_j_OnTick
		rts

		modend
