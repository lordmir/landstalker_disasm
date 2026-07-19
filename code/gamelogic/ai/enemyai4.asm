EnemyAI4	module

; Spawns a small enemy projectile one grid cell ahead of this sprite:
; d0 = projectile type 1-3 (1 = small fireball, 2 = Nole's axe,
; 3 = Zak's boomerang, from _projectileGraphics), d1 = AttackStrength
; for the new sprite. The projectile inherits the spawner's facing and
; sub-position, spawns at Z + $10, runs behaviour script $21C at
; speed 4, and is flagged hostile + invincible with enemy AI enabled.
; Carry set = no free sprite slot.
SpawnSmallProjectile:
		movem.w	d0-d1,-(sp)
		jsr	(j_FindFreeSpriteSlot).l
		bcs.w	_noFreeSlot
		move.w	X(a5),d0
		move.b	RotationAndSize(a5),d1
		andi.b	#DIR_MASK,d1
		beq.s	_aheadNE
		cmpi.b	#DIR_SW,d1
		bcs.s	_aheadSE
		beq.s	_aheadSW
		subi.w	#$0100,d0	; NW: X - 1
		bra.s	_setPos

_aheadNE:
		subq.b	#$01,d0		; NE: Y - 1
		bra.s	_setPos

_aheadSE:
		addi.w	#$0100,d0	; SE: X + 1
		bra.s	_setPos

_aheadSW:
		addq.b	#$01,d0		; SW: Y + 1

_setPos:
		move.w	d0,(a1)
		move.b	d1,RotationAndSize(a1)
		movem.w	(sp)+,d0-d1
		ext.w	d0
		move.b	_projectileGraphics-1(pc,d0.w),d2
		move.w	d1,AttackStrength(a1)
		move.w	Z(a5),d3
		addi.w	#$0010,d3
		move.w	d3,Z(a1)
		move.w	SubX(a5),SubX(a1)
		move.w	#$64C0,TileSource(a1)
		move.w	#$021C,BehaviourLUTIndex(a1)
		move.b	#$04,Speed(a1)
		jsr	(j_InitSpawnedSprite).l
		bset	#$00,CombatFlags(a1)
		bset	#$07,InteractFlags(a1)
		bset	#$07,InitInteractFlags(a1)
		tst.b	d0
		rts

_noFreeSlot:
		movem.w	(sp)+,d0-d1
		ori	#$01,ccr
		rts

; Projectile sprite graphics, 1-based (read via _projectileGraphics-1
; above).
_projectileGraphics:
		dc.b SPR_SMLFIREBALL		; 1
		dc.b SPR_NOLEAXEPROJECTILE	; 2
		dc.b SPR_ZAKBOOMERANG		; 3
		dc.b $FF			; unused

		modend
