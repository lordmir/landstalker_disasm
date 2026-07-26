Collision	module

; Entity-vs-entity collision test for the entity at struct offset d0:
; carry set if any other active sprite's hitbox overlaps in X/Y/Z, with
; a1 -> the collider. Skips sprites with nonzero StateFlags (carried /
; dying) and any sprite standing on the tested entity.
CollisionDetect:
		lea	(Player_X).l,a0
		move.w	HitBoxXStart(a0,d0.w),d1  ; Bounding box X start
		move.w	HitBoxXEnd(a0,d0.w),d2	  ; Bounding Box X end
		move.w	HitBoxYStart(a0,d0.w),d3  ; Bounding box Y start
		move.w	HitBoxYEnd(a0,d0.w),d4	  ; Bounding box Y end
		move.w	Z(a0,d0.w),d6		  ; Bounding box Z start
		move.w	HitBoxZEnd(a0,d0.w),d5	  ; Bounding  box Z end
		clr.w	d7
		movea.l	a0,a1

_cdLoop:
		cmp.w	d7,d0
		beq.s	_cdNext
		tst.w	X(a0)
		bmi.s	_cdEnd		  ; End	of sprites
		cmp.w	HitBoxXEnd(a0),d1
		bhi.s	_cdNext
		cmp.w	HitBoxXStart(a0),d2
		bcs.s	_cdNext
		cmp.w	HitBoxYEnd(a0),d3
		bhi.s	_cdNext
		cmp.w	HitBoxYStart(a0),d4
		bcs.s	_cdNext
		cmp.w	HitBoxZEnd(a0),d6
		bhi.s	_cdNext
		cmp.w	Z(a0),d5
		bcs.s	_cdNext
		movea.l	a0,a1
		tst.b	StateFlags(a0)
		bne.s	_cdNext
		cmp.w	SpriteUnderneath(a0),d0
		beq.s	_cdNext
		ori	#$01,ccr
		rts

_cdNext:
		lea	SPRITE_SIZE(a0),a0
		addi.w	#SPRITE_SIZE,d7
		cmpi.w	#(16*SPRITE_SIZE),d7
		bcs.s	_cdLoop

_cdEnd:
		tst.b	d0
		rts


; Same as CollisionDetect minus the SpriteUnderneath exemption.
CheckForCollision:
		lea	(Player_X).l,a0
		move.w	HitBoxXStart(a0,d0.w),d1
		move.w	HitBoxXEnd(a0,d0.w),d2
		move.w	HitBoxYStart(a0,d0.w),d3
		move.w	HitBoxYEnd(a0,d0.w),d4
		move.w	Z(a0,d0.w),d6
		move.w	HitBoxZEnd(a0,d0.w),d5
		clr.w	d7
		movea.l	a0,a1

_cfLoop:
		cmp.w	d7,d0
		beq.s	_cfNext
		tst.w	(a0)
		bmi.s	_cfEnd
		cmp.w	HitBoxXEnd(a0),d1
		bhi.s	_cfNext
		cmp.w	HitBoxXStart(a0),d2
		bcs.s	_cfNext
		cmp.w	HitBoxYEnd(a0),d3
		bhi.s	_cfNext
		cmp.w	HitBoxYStart(a0),d4
		bcs.s	_cfNext
		cmp.w	HitBoxZEnd(a0),d6
		bhi.s	_cfNext
		cmp.w	Z(a0),d5
		bcs.s	_cfNext
		movea.l	a0,a1
		tst.b	StateFlags(a0)
		bne.s	_cfNext
		ori	#$01,ccr
		rts

_cfNext:
		lea	SPRITE_SIZE(a0),a0
		addi.w	#SPRITE_SIZE,d7
		cmpi.w	#(16*SPRITE_SIZE),d7
		bcs.s	_cfLoop

_cfEnd:
		tst.b	d0
		rts


; Player collision test that ignores hostile sprites - used while the
; player is in hurt-invulnerability so they can walk out through
; enemies. FIX_COLL_1 keeps permanent hostiles - fixed obstacles like
; trees and spiked balls, marked by the sentinel stat pair
; ItemDropProbability = $0001 with zero gold - solid, so
; invulnerability can't be used to clip through them.
CollisionDetectNonHostile:
		lea	(Player_X).l,a0
		move.w	Player_HitBoxXStart-Player_X(a0),d1
		move.w	HitBoxXEnd(a0),d2
		move.w	HitBoxYStart(a0),d3
		move.w	HitBoxYEnd(a0),d4
		move.w	Z(a0),d6
		move.w	HitBoxZEnd(a0),d5
		move.w	#SPRITE_SIZE,d7
		movea.l	a0,a1
		lea	SPRITE_SIZE(a0),a0

_cnLoop:
		tst.w	(a0)
		bmi.s	_cnEnd
		tst.b	InteractFlags(a0)
		bmi.s	_cnHostile

_cnBox:
		cmp.w	HitBoxXEnd(a0),d1
		bhi.s	_cnNext
		cmp.w	HitBoxXStart(a0),d2
		bcs.s	_cnNext
		cmp.w	HitBoxYEnd(a0),d3
		bhi.s	_cnNext
		cmp.w	HitBoxYStart(a0),d4
		bcs.s	_cnNext
		cmp.w	HitBoxZEnd(a0),d6
		bhi.s	_cnNext
		cmp.w	Z(a0),d5
		bcs.s	_cnNext
		movea.l	a0,a1
		tst.b	StateFlags(a0)
		bne.s	_cnNext
		ori	#$01,ccr
		rts

_cnHostile:
	if FIX_COLL_1
		cmpi.w	#$0001,ItemDropProbability(a0)
		bne.s	_cnNext
		tst.b	GoldOrChestContents(a0)
		beq.s	_cnBox
	endif

_cnNext:
		lea	SPRITE_SIZE(a0),a0
		addi.w	#SPRITE_SIZE,d7
		cmpi.w	#(16*SPRITE_SIZE),d7
		bcs.s	_cnLoop

_cnEnd:
		tst.b	d0
		rts


; Heightmap wall probes at the player's leading hitbox edge (SW/NE =
; the Y edges, NW/SE below = the X edges): carry set if the floor cell
; there is taller than the player's Z, i.e. blocked. Also returns d5 =
; that cell's floor-type byte, which the movers' deflect logic uses.
CheckWallSW:
		move.w	(Player_HitBoxYEnd).l,d2
		bra.s	_wallProbeY


CheckWallNE:
		move.w	(Player_HitBoxYStart).l,d2

_wallProbeY:
		move.w	(Player_HitBoxXStart).l,d1
		move.w	(Player_HitBoxXEnd).l,d4
		lsr.w	#$03,d1
		lsr.w	#$03,d4
		andi.b	#$FE,d1
		andi.b	#$FE,d4
		move.w	(Player_Z).l,d3
		lsr.w	#$04,d3
		lea	(g_HeightMap).l,a6
		lsr.w	#$04,d2
		jsr	(MultiplyD2By148).l
		adda.w	d2,a6
		adda.w	d1,a6
		move.b	#$4F,d2
		move.b	(a6),d0
		and.b	d2,d0
		move.b	$1(a6),d5
		sub.w	d1,d4
		beq.s	_wallYCell2
		addq.w	#$02,a6

_wallYCell2:
		move.b	(a6),d1
		and.b	d2,d1
		cmp.b	d0,d3
		bcs.s	_wallYDone
		move.b	$1(a6),d5
		cmp.b	d1,d3

_wallYDone:
		rts


CheckWallNW:
		move.w	(Player_HitBoxXStart).l,d2
		bra.s	_wallProbeX


CheckWallSE:
		move.w	(Player_HitBoxXEnd).l,d2

_wallProbeX:
		move.w	(Player_HitBoxYStart).l,d1
		move.w	(Player_HitBoxYEnd).l,d4
		lsr.w	#$04,d1
		lsr.w	#$04,d4
		sub.w	d1,d4
		move.w	(Player_Z).l,d3
		lsr.w	#$04,d3
		lea	(g_HeightMap).l,a6
		jsr	(MultiplyD1By148).l
		adda.w	d1,a6
		lsr.w	#$03,d2
		andi.b	#$FE,d2
		adda.w	d2,a6
		move.b	#$4F,d2
		move.b	(a6),d0
		and.b	d2,d0
		move.b	$1(a6),d5
		tst.w	d4
		beq.s	_wallXCell2
		lea	$94(a6),a6

_wallXCell2:
		move.b	(a6),d1
		and.b	d2,d1
		cmp.b	d0,d3
		bcs.s	_wallXDone
		move.b	$1(a6),d5
		cmp.b	d1,d3

_wallXDone:
		rts


; As CheckWallSW etc. but for any entity a5, and with mask $6F so NPCs
; also respect NPC-only barriers ($20) and out-of-bounds ($40) cells.
; Skipped entirely (always passable) while on a raft track cell.
CheckSpriteWallSW:
		move.w	HitBoxYEnd(a5),d2
		bra.s	_swallProbeY


CheckSpriteWallNE:
		move.w	HitBoxYStart(a5),d2

_swallProbeY:
		btst	#$04,GroundHeight(a0)
		bne.s	_swallPass
		move.w	HitBoxXStart(a5),d1
		move.w	HitBoxXEnd(a5),d4
		lsr.w	#$03,d1
		lsr.w	#$03,d4
		andi.b	#$FE,d1
		andi.b	#$FE,d4
		sub.w	d1,d4
		lsr.w	#$01,d4
		move.w	Z(a5),d3
		lsr.w	#$04,d3
		lea	(g_HeightMap).l,a6
		lsr.w	#$04,d2
		jsr	(MultiplyD2By148).l
		adda.w	d2,a6
		adda.w	d1,a6
		move.b	#$6F,d1

_swallYLoop:
		move.b	(a6),d0
		and.b	d1,d0
		cmp.b	d0,d3
		bcs.s	_swallDone
		addq.w	#$02,a6
		dbf	d4,_swallYLoop

_swallPass:
		tst.b	d0

_swallDone:
		rts


CheckSpriteWallNW:
		move.w	HitBoxXStart(a5),d2
		bra.s	_swallProbeX


CheckSpriteWallSE:
		move.w	HitBoxXEnd(a5),d2

_swallProbeX:
		btst	#$04,GroundHeight(a0)
		bne.s	_swallPass
		move.w	HitBoxYStart(a5),d1
		move.w	HitBoxYEnd(a5),d4
		lsr.w	#$04,d1
		lsr.w	#$04,d4
		sub.w	d1,d4
		move.w	Z(a5),d3
		lsr.w	#$04,d3
		lea	(g_HeightMap).l,a6
		jsr	(MultiplyD1By148).l
		adda.w	d1,a6
		lsr.w	#$03,d2
		andi.b	#$FE,d2
		adda.w	d2,a6
		move.b	#$6F,d1

_swallXLoop:
		move.b	(a6),d0
		and.b	d1,d0
		cmp.b	d0,d3
		bcs.s	_swallXDone
		lea	$94(a6),a6
		dbf	d4,_swallXLoop
		tst.b	d0

_swallXDone:
		rts

		modend
