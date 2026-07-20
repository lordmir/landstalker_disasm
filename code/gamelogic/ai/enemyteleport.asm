; Teleport-in helper shared by the spectres and Nole.
;
; Move the sprite to a random spot beside the player: an offset of
; 3-10 cells, positive or negative, applied to the player's X or Y
; (staying aligned with him on the other axis), dropped to the
; player's Z with the hitbox top d1 above it. Carry set on success;
; if the spot does not validate, parks back at the hidden floating
; height (Z $100) and returns carry clear through TeleportFail
; (which Nole's teleport try also branches to directly).
;
; This file is included from the middle of nole.asm (to keep the ROM
; byte order) and deliberately has no module wrapper: its local
; labels belong to the enclosing Nole module.

TeleportBesidePlayer:
		movem.w	d1,-(sp)
		move.w	#00007,d6
		jsr	(j_GenerateRandomNumber).l
		addi.b	#$03,d7
		move.w	d7,d5
		move.w	#00002,d6
		jsr	(j_GenerateRandomNumber).l
		tst.b	d7
		beq.s	_offsetPicked
		neg.b	d5

_offsetPicked:
		move.w	#00002,d6
		jsr	(j_GenerateRandomNumber).l
		tst.b	d7
		beq.s	_alongY
		add.b	(Player_X).l,d5
		move.b	d5,X(a5)
		move.b	(Player_Y).l,Y(a5)
		bra.s	_place

_alongY:
		add.b	(Player_Y).l,d5
		move.b	d5,Y(a5)
		move.b	(Player_X).l,X(a5)

_place:
		movea.l	a5,a1
		jsr	(j_j_CalcSpriteHitbox).l
		move.w	(Player_Z).l,d0
		move.w	d0,Z(a5)
		movem.w	(sp)+,d1
		add.w	d1,d0
		move.w	d0,HitBoxZEnd(a5)
		movea.l	a5,a1
		jsr	(j_ValidateSpritePosition).l
		bcc.s	_teleportOk
		move.w	#$0100,Z(a5)
		move.w	#$0120,HitBoxZEnd(a5)

; Shared miss exit.
TeleportFail:
		tst.b	d0
		rts

_teleportOk:
		ori	#$01,ccr
		rts
