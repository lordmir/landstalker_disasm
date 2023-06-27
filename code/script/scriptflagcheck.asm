; ---------------------------------------------------------------------------

GetFlagProgress:				  ; CODE XREF: HandleProgressDependentDialogue+4p
		move.l	a0,-(sp)
		lea	(g_GameFlagProgress1).l,a0
		bsr.w	PickValueBasedOnFlags
; ---------------------------------------------------------------------------
		dc.w $0139,$1F00
		dc.w $0156,$1E00
		dc.w $0155,$1D00
		dc.w $0150,$1C00
		dc.w $0140,$1B00
		dc.w $0131,$1A00
		dc.w $0124,$1900
		dc.w $0105,$1800
		dc.w $00BF,$1700
		dc.w $00A6,$1600
		dc.w $00B3,$1500
		dc.w $00A0,$1400
		dc.w $0094,$1300
		dc.w $0093,$1200
		dc.w $0092,$1100
		dc.w $0091,$1000
		dc.w $001D,$0F00
		dc.w $001C,$0E00
		dc.w $002E,$0D00
		dc.w $002D,$0C00
		dc.w $002C,$0A00
		dc.w $0023,$0900
		dc.w $0021,$0800
		dc.w $0020,$0700
		dc.w $0017,$0600
		dc.w $0022,$0500
		dc.w $0015,$0400
		dc.w $0014,$0300
		dc.w $0000,$0200
		dc.w $0010,$0100
		dc.w $FFFF
; ---------------------------------------------------------------------------
		addq.l	#$01,a0
		bsr.w	PickValueBasedOnFlags
; ---------------------------------------------------------------------------
		dc.w $0154, $0300
		dc.w $0152, $0200
		dc.w $00A0, $0100
		dc.w $FFFF
; ---------------------------------------------------------------------------
		addq.l	#$01,a0
		bsr.w	PickValueBasedOnFlags
; ---------------------------------------------------------------------------
		dc.w $013F, $0300
		dc.w $013C, $0200
		dc.w $0124, $0100
		dc.w $FFFF
; ---------------------------------------------------------------------------
		movea.l	(sp)+,a0
		rts

; =============== S U B	R O U T	I N E =======================================


PickValueBasedOnFlags:				  ; CODE XREF: ROM:00025320p
						  ; ROM:000253A0p ...
		movem.l	d0/a1,-(sp)
		clr.b	(a0)
		movea.l	$00000008(sp),a1

loc_253D4:					  ; CODE XREF: PickValueBasedOnFlags+16j
		move.w	(a1)+,d0
		blt.s	loc_253EE
		bsr.w	TestFlagBit
		bne.s	loc_253E2
		addq.l	#$02,a1
		bra.s	loc_253D4
; ---------------------------------------------------------------------------

loc_253E2:					  ; CODE XREF: PickValueBasedOnFlags+12j
		move.b	(a1),(a0)
		addq.l	#$02,a1

loc_253E6:					  ; CODE XREF: PickValueBasedOnFlags+22j
		tst.w	(a1)+
		blt.s	loc_253EE
		addq.l	#$02,a1
		bra.s	loc_253E6
; ---------------------------------------------------------------------------

loc_253EE:					  ; CODE XREF: PickValueBasedOnFlags+Cj
						  ; PickValueBasedOnFlags+1Ej
		move.l	a1,$00000008(sp)
		movem.l	(sp)+,d0/a1
		rts
; End of function PickValueBasedOnFlags

