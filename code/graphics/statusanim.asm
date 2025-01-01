
; =============== S U B	R O U T	I N E =======================================


LoadStatusGfx:					  ; DATA XREF: j_LoadStatusGfxt
		move.b	(byte_FF1147).l,d0
		addq.b	#$01,(byte_FF1147).l
		andi.b	#$07,d0
		bne.s	locret_16EC8
		move.b	#$08,d0
		lea	CurseAnim(pc),a0
		btst	#$03,d1
		bne.s	loc_16E96
		move.b	#$18,d0
		lea	ParalysisAnim(pc),a0
		btst	#$02,d1
		bne.s	loc_16E96
		lea	ConfusionAnim(pc),a0
		btst	#$01,d1
		bne.s	loc_16E96
		lea	PoisonAnim(pc),a0

loc_16E96:					  ; CODE XREF: LoadStatusGfx+1Ej
						  ; LoadStatusGfx+2Cj ...
		moveq	#$00000000,d1
		move.b	(byte_FF1147).l,d1
		and.b	d0,d1
		lsr.b	#$01,d1
		adda.l	d1,a0
		movea.l	(a0),a0
		lea	(g_Buffer).l,a1
		lea	($0000A280).l,a2
		cmpi.b	#$18,(g_VDPReg10_HIntLine+1).l
		beq.s	loc_16EC2
		jmp	(j_DecompressAndQueueGfxCopy).l
; ---------------------------------------------------------------------------

loc_16EC2:					  ; CODE XREF: LoadStatusGfx+60j
		jsr	(j_LoadCompressedGfx).l	  ; a0 - compressed graphics source
						  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination

locret_16EC8:					  ; CODE XREF: LoadStatusGfx+10j
		rts
; End of function LoadStatusGfx

; ---------------------------------------------------------------------------
