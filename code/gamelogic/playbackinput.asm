Playback	module
; Starts scripted-input playback: d0.b is a sequence index into the
; InputPlayback table (sequences are input+duration byte pairs, each
; terminated by an $80 byte - a negative input byte ends playback in
; ProcessControlScript). Seeks past d0 terminators, then loads the
; first pair and stores the resume pointer for ProcessControlScript.
PlaybackInput:
		ext.w	d0
		lea	InputPlayback(pc),a0
		subq.w	#$01,d0
		bmi.s	_loadPair

_skipSeq:
		cmpi.b	#$80,(a0)+
		bne.s	_skipSeq
		dbf	d0,_skipSeq

_loadPair:
		move.b	(a0)+,(g_ControllerPlayback).l
		move.b	(a0)+,(g_ControllerPlaybackTimer).l
		move.l	a0,(g_InputPlaybackAddr).l
		rts

		modend
