VisualFX	module
; Full-screen visual effects: palette flashes and the warp
; transitions. Everything here runs synchronously (the game loop is
; paused while an effect plays), driving the VDP directly and
; restoring what it changed on the way out. The Nole warp's tick
; helpers continue in nolewarpupdate.asm and share NoleWarp's stack
; frame (the _nw_* vars below).

; Run visual effect d0 (VFX_* ids, constants/visualeffects.inc):
;   0,1 - warp-pad darkness sweep (the id is not used by the handler)
;   2   - tree warp out, 3 - tree warp in
;   4   - black flash, 5 - white flash, 6 - red flash
;   7   - Nole/Kazalt warp out, 8 - Nole/Kazalt warp in
;   9,A - as 7,8 with an alternate sparkle centre (cutscene use)
DoVisualEffect:
		movem.l	d0-a6,-(sp)
		lea	VisualFXTable(pc),a0
		move.w	d0,d1
		lsl.l	#$02,d1
		movea.l	(a0,d1.l),a0
		jsr	(a0)
		movem.l	(sp)+,d0-a6
		rts

VisualFXTable:	dc.l WarpPadFx
		dc.l WarpPadFx
		dc.l TreeWarpFx
		dc.l TreeWarpFx
		dc.l BlackFlash
		dc.l WhiteFlash
		dc.l RedFlash
		dc.l NoleWarp
		dc.l NoleWarp
		dc.l NoleWarp
		dc.l NoleWarp
	modend
