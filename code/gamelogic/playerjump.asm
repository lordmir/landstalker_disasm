JumpControl	module
; Jump input: B starts a jump, arming JumpRate and playing the jump
; sound, then runs the rise; an in-progress jump just continues
; rising. Blocked mid pickup/throw animation (0 < g_CarryPhase < $17)
; but allowed while carrying steadily.
HandleJump:
		move.b	(Player_JumpRate).l,d0
		andi.w	#$001F,d0
		bne.s	_jumpRise
		move.b	(g_CarryPhase).l,d2
		beq.s	_tryJump
		cmpi.b	#$17,d2
		bcs.s	_jumpDone

_tryJump:
		tst.b	(g_JumpButtonLatch).l
		bne.w	_jumpDone
		move.b	(g_Controller1State).l,d2
		andi.b	#CTRLBF_B,d2
		beq.s	_jumpDone
		move.b	#CTRLBF_B,(g_JumpButtonLatch).l
		trap	#$00			  ; Trap00Handler
		dc.w SND_Jump

_jumpRise:
		lea	(Player_X).l,a5


; One tick of jump ascent for entity a5: rise by JumpAcceleration
; [frame], limited by GetClearanceAbove; after $0C frames (or on
; hitting a ceiling) the jump ends and gravity takes over (FallRate
; bit 7 armed while rising).
HandleJumpRise:
		bsr.w	GetClearanceAbove
		move.b	JumpAcceleration(pc,d0.w),d1
		ext.w	d1
		cmp.w	d5,d1
		bhi.s	_jumpApex
		add.w	d1,Z(a5)
		add.w	d1,HitBoxZEnd(a5)
		andi.b	#$E0,JumpRate(a5)
		addq.b	#$01,d0
		cmpi.b	#$0C,d0
		bcs.s	_storeJumpRate

_jumpApex:
		andi.w	#$60E0,FallRate(a5)
		rts

_storeJumpRate:
		or.b	d0,JumpRate(a5)
		ori.b	#$80,FallRate(a5)

_jumpDone:
		rts

JumpAcceleration:
		dc.b $04, $04,	$03, $03, $03, $02, $02, $02
		dc.b $02, $01, $01, $01, $01, $01, $01,	$01

		modend
