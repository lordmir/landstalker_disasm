
; =============== S U B	R O U T	I N E =======================================


PlaybackInput:					  ; CODE XREF: LoadPlayerSpecialAnimation+226p
						  ; ROM:000127E4p ...
		ext.w	d0
		lea	InputPlayback(pc),a0
		subq.w	#$01,d0
		bmi.s	loc_10856

loc_1084C:					  ; CODE XREF: PlaybackInput+Ej
						  ; PlaybackInput+10j
		cmpi.b	#$80,(a0)+
		bne.s	loc_1084C
		dbf	d0,loc_1084C

loc_10856:					  ; CODE XREF: PlaybackInput+8j
		move.b	(a0)+,(g_ControllerPlayback).l
		move.b	(a0)+,(g_ControllerPlaybackTimer).l
		move.l	a0,(g_InputPlaybackAddr).l
		rts
; End of function PlaybackInput

; ---------------------------------------------------------------------------
