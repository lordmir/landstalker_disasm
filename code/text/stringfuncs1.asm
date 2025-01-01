
; =============== S U B	R O U T	I N E =======================================


PrintString_0:					  ; DATA XREF: j_PrintString_0t
		move.b	#$01,(byte_FF1144).l
		bra.s	loc_22F2C
; End of function PrintString_0


; =============== S U B	R O U T	I N E =======================================


PrintString:					  ; DATA XREF: j_PrintStringt
		clr.b	(byte_FF1144).l

loc_22F2C:					  ; CODE XREF: PrintString_0+8j
		movem.l	d0-a6,-(sp)
		bsr.w	InitCompString
		cmpi.b	#$01,(g_comprStringLen).l
		beq.w	loc_2308E		  ; Done
		bsr.w	InitHuffmanDecomp
		move.l	a0,(dword_FF1848).l
		bsr.w	sub_22FD2

loc_22F4E:					  ; CODE XREF: PrintString+3Ej
		bsr.w	GetNextChar

loc_22F52:					  ; CODE XREF: sub_22FD2+1Aj
		cmpi.w	#$FFF0,d0
		beq.s	loc_22F60
		cmpi.w	#$FFF6,d0
		beq.s	loc_22F60
		bsr.s	sub_22F66

loc_22F60:					  ; CODE XREF: PrintString+30j
						  ; PrintString+36j
		bsr.w	ProcessChar
		bra.s	loc_22F4E
; End of function PrintString


; =============== S U B	R O U T	I N E =======================================


sub_22F66:					  ; CODE XREF: PrintString+38p
		cmpi.w	#$0114,(word_FF1194).l
		bls.s	locret_22FCA

HandleNewLine:					  ; CODE XREF: HandleControlChars+4j
						  ; HandleControlChars:HandleNewLineAndPromptp	...
		movem.w	d0,-(sp)
		bsr.s	sub_22F7C
		movem.w	(sp)+,d0
		rts
; End of function sub_22F66


; =============== S U B	R O U T	I N E =======================================


sub_22F7C:					  ; CODE XREF: sub_22F66+Ep
		bsr.w	sub_2313C
		bcs.s	loc_22F8E
		movem.w	d0,-(sp)
		bsr.w	DMACopyTextboxTiles
		movem.w	(sp)+,d0

loc_22F8E:					  ; CODE XREF: sub_22F7C+4j
		bsr.w	TestIfInventoryIsOpen
		bcs.s	loc_22F9A
		move.b	#$20,d1
		bra.s	loc_22F9E
; ---------------------------------------------------------------------------

loc_22F9A:					  ; CODE XREF: sub_22F7C+16j
		move.b	#$30,d1

loc_22F9E:					  ; CODE XREF: sub_22F7C+1Cj
		move.b	(byte_FF1144).l,d2
		lsr.b	#$01,d2
		ext.w	d2
		move.w	d2,(word_FF1194).l
		addi.b	#$10,(byte_FF1129).l
		cmp.b	(byte_FF1129).l,d1
		bcc.s	locret_22FCA
		bsr.w	sub_23582
		subi.b	#$10,(byte_FF1129).l

locret_22FCA:					  ; CODE XREF: sub_22F66+8j
						  ; sub_22F7C+40j
		rts
; End of function sub_22F7C


; =============== S U B	R O U T	I N E =======================================


InitCompString:					  ; CODE XREF: PrintString+Ap
		bsr.s	GetComprStringPtr
		bsr.s	InitStringVars
		rts
; End of function InitCompString


; =============== S U B	R O U T	I N E =======================================


sub_22FD2:					  ; CODE XREF: PrintString+24p
		bsr.w	GetNextChar
		cmpi.w	#~$0015,d0
		beq.s	locret_22FF0
		movem.l	d0,-(sp)
		bsr.w	InsertNewline
		movem.l	(sp)+,d0
		movem.l	(sp)+,d1
		bra.w	loc_22F52
; ---------------------------------------------------------------------------

locret_22FF0:					  ; CODE XREF: sub_22FD2+8j
		rts
; End of function sub_22FD2


; =============== S U B	R O U T	I N E =======================================


InitStringVars:					  ; CODE XREF: InitCompString+2p
		clr.l	(dword_FF1844).l
		clr.b	(byte_FF1155).l
		move.b	(a0)+,(g_comprStringLen).l ; Number of compressed bytes	to process
		move.l	#word_FF1196,(dword_FF184C).l
		move.b	#$01,d1
		add.b	d1,d1
		or.b	d1,(byte_FF1144).l	  ; |=2
		rts
; End of function InitStringVars


; =============== S U B	R O U T	I N E =======================================


GetComprStringPtr:				  ; CODE XREF: InitCompStringp
		movem.w	d0,-(sp)
		lsr.w	#$06,d0
		andi.b	#$FC,d0			  ; Top	byte: string bank
		movea.l	(StringPtr).l,a0
		movea.l	(a0,d0.w),a0
		movem.w	(sp)+,d0		  ; Bottom byte: index in bank

loc_23034:					  ; CODE XREF: GetComprStringPtr+24j
		tst.b	d0			  ; Keep looking until we find our string
		beq.s	locret_23042		  ; 1st	byte of	entry: num bytes in compressed string
		moveq	#$00000000,d7
		move.b	(a0),d7
		adda.l	d7,a0
		subq.b	#$01,d0
		bra.s	loc_23034		  ; Keep looking until we find our string
; ---------------------------------------------------------------------------

locret_23042:					  ; CODE XREF: GetComprStringPtr+1Aj
		rts
; End of function GetComprStringPtr


; =============== S U B	R O U T	I N E =======================================


GetNextChar:					  ; CODE XREF: PrintString:loc_22F4Ep
						  ; sub_22FD2p
		tst.l	(dword_FF1844).l
		bne.w	loc_23094

loc_2304E:					  ; CODE XREF: GetNextChar+82j
		movea.l	(dword_FF1848).l,a0
		bsr.w	DecodeChar
		move.l	a0,(dword_FF1848).l
		cmpi.b	#CHR_STR_BEGIN,d0	  ; String begin
		beq.s	loc_23080
		bcs.s	loc_2307A
		subi.b	#CHR_ARROW_PROMPT,d0	  ; Down arrow prompt
		andi.w	#$00FF,d0
		add.w	d0,d0
		lea	ControlChars(pc),a1
		move.w	(a1,d0.w),d0
		rts
; ---------------------------------------------------------------------------

loc_2307A:					  ; CODE XREF: GetNextChar+20j
		andi.w	#$00FF,d0
		rts
; ---------------------------------------------------------------------------

loc_23080:					  ; CODE XREF: GetNextChar+1Ej
		bsr.w	sub_2313C
		bcs.s	loc_2308A
		bsr.w	DMACopyTextboxTiles

loc_2308A:					  ; CODE XREF: GetNextChar+40j
		movem.l	(sp)+,d0

loc_2308E:					  ; CODE XREF: PrintString+16j
		movem.l	(sp)+,d0-a6
		rts
; ---------------------------------------------------------------------------

loc_23094:					  ; CODE XREF: GetNextChar+6j
						  ; GetNextChar+68j ...
		movea.l	(dword_FF1844).l,a1
		move.w	(a1)+,d0
		move.l	a1,(dword_FF1844).l
		cmpi.w	#$FFFF,d0
		beq.s	loc_230C0
		cmpi.w	#CHR_HYPHENATION_POINT,d0
		beq.s	loc_23094
		cmpi.w	#CHR_BREAKING_SPACE,d0
		beq.s	loc_230BC
		cmpi.w	#CHR_BREAK_POINT,d0
		beq.s	loc_23094
		rts
; ---------------------------------------------------------------------------

loc_230BC:					  ; CODE XREF: GetNextChar+6Ej
		clr.w	d0
		rts
; ---------------------------------------------------------------------------

loc_230C0:					  ; CODE XREF: GetNextChar+62j
		clr.l	(dword_FF1844).l
		bra.w	loc_2304E
; End of function GetNextChar


; =============== S U B	R O U T	I N E =======================================


ProcessChar:					  ; CODE XREF: PrintString:loc_22F60p
		tst.w	d0
		bpl.s	loc_230D6
		not.w	d0
		lsl.w	#$02,d0
		jmp	HandleControlChars(pc,d0.w)
; ---------------------------------------------------------------------------

loc_230D6:					  ; CODE XREF: ProcessChar+2j
						  ; HandleControlChars+76j
		cmpi.b	#CHR_BEGIN_TALK,d0
		bne.s	loc_230F4
		andi.b	#$01,(byte_FF1144).l
		ori.b	#$22,(byte_FF1144).l
		move.b	#$01,(byte_FF1155).l

loc_230F4:					  ; CODE XREF: ProcessChar+10j
		bsr.s	loc_23104
		bsr.w	sub_235FE
		bsr.s	sub_2313C
		bcc.s	locret_23102
		bsr.w	DMACopyTextboxTiles

locret_23102:					  ; CODE XREF: ProcessChar+32j
						  ; HandleControlChars+68j ...
		rts
; End of function ProcessChar

; ---------------------------------------------------------------------------

loc_23104:					  ; CODE XREF: ProcessChar:loc_230F4p
		movem.w	d0,-(sp)
		tst.b	(byte_FF1155).l
		beq.s	loc_23136
		cmpi.b	#CHR_Space,d0
		beq.s	loc_23136
		cmpi.b	#CHR_FullStop,d0
		beq.s	loc_23136
		addq.b	#$01,(byte_FF1155).l
		btst	#$01,(byte_FF1155).l
		beq.s	loc_23136
		move.b	(g_TalkSoundEffect).l,d0
		trap	#$00			  ; Trap00Handler
; ---------------------------------------------------------------------------
		dc.w SND_LoadFromD0
; ---------------------------------------------------------------------------

loc_23136:					  ; CODE XREF: ROM:0002310Ej
						  ; ROM:00023114j ...
		movem.w	(sp)+,d0
		rts

; =============== S U B	R O U T	I N E =======================================


sub_2313C:					  ; CODE XREF: sub_22F7Cp
						  ; GetNextChar:loc_23080p ...
		btst	#$00,(byte_FF1144).l
		beq.s	loc_2314A
		tst.b	d0
		rts
; ---------------------------------------------------------------------------

loc_2314A:					  ; CODE XREF: sub_2313C+8j
		ori	#$01,ccr
		rts
; End of function sub_2313C


; =============== S U B	R O U T	I N E =======================================


HandleControlChars:				  ; CODE XREF: ProcessChar+8j

; FUNCTION CHUNK AT 0002332A SIZE 0000000C BYTES

		bra.w	HandleYesNo
; ---------------------------------------------------------------------------
		bra.w	HandleNewLine
; ---------------------------------------------------------------------------
		bra.w	PopName
; ---------------------------------------------------------------------------
		bra.w	HandleItemName
; ---------------------------------------------------------------------------
		bra.w	HandleWaitForInput
; ---------------------------------------------------------------------------
		bra.w	HandleSpeakerName
; ---------------------------------------------------------------------------
		bra.w	locret_2320A
; ---------------------------------------------------------------------------
		bra.w	locret_2320C
; ---------------------------------------------------------------------------
		bra.w	Handle1sPauseOrInput
; ---------------------------------------------------------------------------
		bra.w	Handle1_5sPauseOrInput
; ---------------------------------------------------------------------------
		bra.w	Handle2sPauseOrInput
; ---------------------------------------------------------------------------
		bra.w	Handle1sPause
; ---------------------------------------------------------------------------
		bra.w	HandleNumericVariable
; ---------------------------------------------------------------------------
		bra.w	HandleNewLineAndPrompt
; ---------------------------------------------------------------------------
		bra.w	InsertNewline
; ---------------------------------------------------------------------------
		bra.w	HandleContinuePrompt
; ---------------------------------------------------------------------------
		dcb.l 5,$00000000
; ---------------------------------------------------------------------------
		bra.w	locret_2332A
; ---------------------------------------------------------------------------
		dcb.l 3,$00000000
; ---------------------------------------------------------------------------
		bra.w	loc_2332C
; ---------------------------------------------------------------------------
		bra.w	locret_23102
; ---------------------------------------------------------------------------
		bra.w	loc_231C4
; ---------------------------------------------------------------------------
		bra.w	locret_23102
; ---------------------------------------------------------------------------

loc_231C4:					  ; CODE XREF: HandleControlChars+6Cj
		clr.w	d0
		bra.w	loc_230D6
; ---------------------------------------------------------------------------

HandleYesNo:					  ; CODE XREF: HandleControlCharsj
		bsr.w	sub_2313C
		bcs.s	loc_231D4
		bsr.w	DMACopyTextboxTiles

loc_231D4:					  ; CODE XREF: HandleControlChars+7Ej
		movem.l	(sp)+,d0
		rts
; ---------------------------------------------------------------------------

PopName:					  ; CODE XREF: HandleControlChars+8j
		bsr.w	PopItem
		bra.w	CopyStringToBuffer
; ---------------------------------------------------------------------------

HandleItemName:					  ; CODE XREF: HandleControlChars+Cj
		bsr.w	PopItem
		bsr.w	LoadUncompressedString
		bra.w	CopyStringToBuffer
; ---------------------------------------------------------------------------

HandleSpeakerName:				  ; CODE XREF: HandleControlChars+14j
		bsr.w	InsertNewline
		bsr.w	PopItem
		bsr.w	GetChrName
		bsr.w	CopyStringToBuffer
		move.w	#CHR_Colon,(a1)+
		clr.w	(a1)+
		move.w	#$FFFF,(a1)+
		rts
; ---------------------------------------------------------------------------

locret_2320A:					  ; CODE XREF: HandleControlChars+18j
		rts
; ---------------------------------------------------------------------------

locret_2320C:					  ; CODE XREF: HandleControlChars+1Cj
		rts
; ---------------------------------------------------------------------------

Handle1sPauseOrInput:				  ; CODE XREF: HandleControlChars+20j
		move.w	#00059,d0

loc_23212:					  ; CODE XREF: HandleControlChars+ECj
						  ; HandleControlChars+F2j
		movem.w	d2,-(sp)

loc_23216:					  ; CODE XREF: HandleControlChars+DEj
		jsr	(j_UpdateControllerInputs).l
		move.b	(g_Controller1State).l,d1
		andi.b	#$70,d1
		bne.s	loc_23232
		jsr	(j_WaitUntilVBlank).l
		dbf	d0,loc_23216

loc_23232:					  ; CODE XREF: HandleControlChars+D6j
						  ; HandleControlChars+148j ...
		movem.w	(sp)+,d0
		rts
; ---------------------------------------------------------------------------

Handle1_5sPauseOrInput:				  ; CODE XREF: HandleControlChars+24j
		move.w	#00089,d0
		bra.s	loc_23212
; ---------------------------------------------------------------------------

Handle2sPauseOrInput:				  ; CODE XREF: HandleControlChars+28j
		move.w	#00119,d0
		bra.s	loc_23212
; ---------------------------------------------------------------------------

Handle1sPause:					  ; CODE XREF: HandleControlChars+2Cj
		move.w	#00059,d0
		jmp	(j_Sleep).l
; ---------------------------------------------------------------------------

HandleNumericVariable:				  ; CODE XREF: HandleControlChars+30j
		move.l	(g_PrintNumericDwordValue).l,d7
		jsr	(j_ConvertToBase10).l
		lea	(unk_FF119E).l,a1
		move.l	a1,(dword_FF1844).l
		lea	(unk_FF0F92).l,a0
		moveq	#$00000009,d1

loc_2326E:					  ; CODE XREF: HandleControlChars:loc_23276j
		clr.w	d0
		move.b	(a0)+,d0
		beq.s	loc_23276
		move.w	d0,(a1)+

loc_23276:					  ; CODE XREF: HandleControlChars+122j
		dbf	d1,loc_2326E
		move.w	#$FFFF,(a1)+
		rts
; ---------------------------------------------------------------------------

HandleWaitForInput:				  ; CODE XREF: HandleControlChars+10j
		movem.w	d2,-(sp)

loc_23284:					  ; CODE XREF: HandleControlChars+13Cj
		jsr	(j_WaitUntilVBlank).l
		bsr.s	sub_232CE
		bne.s	loc_23284

loc_2328E:					  ; CODE XREF: HandleControlChars+146j
		jsr	(j_WaitUntilVBlank).l
		bsr.s	sub_232CE
		beq.s	loc_2328E
		bra.s	loc_23232
; ---------------------------------------------------------------------------

HandleNewLineAndPrompt:				  ; CODE XREF: HandleControlChars+34j
		bsr.w	HandleNewLine

HandleContinuePrompt:				  ; CODE XREF: HandleControlChars+3Cj
		bsr.w	sub_2339E
		clr.b	(word_FF1800).l
		movem.w	d2,-(sp)

loc_232AC:					  ; CODE XREF: HandleControlChars+166j
		jsr	(j_WaitUntilVBlank).l
		bsr.s	sub_232E0
		bsr.s	sub_232CE
		bne.s	loc_232AC

loc_232B8:					  ; CODE XREF: HandleControlChars+172j
		jsr	(j_WaitUntilVBlank).l
		bsr.s	sub_232E0
		bsr.s	sub_232CE
		beq.s	loc_232B8
		clr.w	(g_VDPSpr02_Y).l
		bra.w	loc_23232
; End of function HandleControlChars


; =============== S U B	R O U T	I N E =======================================


sub_232CE:					  ; CODE XREF: HandleControlChars+13Ap
						  ; HandleControlChars+144p ...
		jsr	(j_UpdateControllerInputs).l
		move.b	(g_Controller1State).l,d1
		andi.b	#$70,d1
		rts
; End of function sub_232CE


; =============== S U B	R O U T	I N E =======================================


sub_232E0:					  ; CODE XREF: HandleControlChars+162p
						  ; HandleControlChars+16Ep
		move.w	#$0148,d0
		addq.b	#$08,(word_FF1800).l
		tst.b	(word_FF1800).l
		bpl.s	loc_232F4
		clr.w	d0

loc_232F4:					  ; CODE XREF: sub_232E0+10j
		move.w	d0,(g_VDPSpr02_Y).l
		move.b	#$05,(g_VDPSpr02_Size).l
		move.w	#$E524,(g_VDPSpr02_TileSource).l
		move.w	#$01A0,(g_VDPSpr02_X).l
		rts
; End of function sub_232E0


; =============== S U B	R O U T	I N E =======================================


InsertNewline:					  ; CODE XREF: sub_22FD2+Ep
						  ; HandleControlChars+38j ...
		move.b	(byte_FF1144).l,d2
		lsr.b	#$01,d2
		ext.w	d2
		cmp.w	(word_FF1194).l,d2
		bne.w	HandleNewLine
		rts
; End of function InsertNewline

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR HandleControlChars

locret_2332A:					  ; CODE XREF: HandleControlChars+54j
		rts
; ---------------------------------------------------------------------------

loc_2332C:					  ; CODE XREF: HandleControlChars+64j
		bsr.s	PopItem
		move.b	d1,(byte_FF112A).l
		rts
; END OF FUNCTION CHUNK	FOR HandleControlChars

; =============== S U B	R O U T	I N E =======================================


PopItem:					  ; CODE XREF: HandleControlChars:PopNamep
						  ; HandleControlChars:HandleItemNamep	...
		movea.l	(dword_FF184C).l,a1
		move.w	(a1)+,d1
		move.l	a1,(dword_FF184C).l
		rts
; End of function PopItem

; ---------------------------------------------------------------------------

loc_23346:					  ; CODE XREF: ROM:00023352j
		dbf	d0,loc_2334C
		bra.s	loc_23354
; ---------------------------------------------------------------------------

loc_2334C:					  ; CODE XREF: ROM:loc_23346j
		clr.l	d1
		move.b	(a2),d1
		adda.l	d1,a2
		bra.s	loc_23346
; ---------------------------------------------------------------------------

loc_23354:					  ; CODE XREF: ROM:0002334Aj
		clr.l	d7
		move.b	(a2)+,d7
		subq.w	#$02,d7
		rts

; =============== S U B	R O U T	I N E =======================================


CopyStringToBuffer:				  ; CODE XREF: HandleControlChars+8Ej
						  ; HandleControlChars+9Aj ...
		lea	(unk_FF119E).l,a1
		move.l	a1,(dword_FF1844).l

loc_23368:					  ; CODE XREF: CopyStringToBuffer+12j
		clr.w	d0
		move.b	(a2)+,d0
		move.w	d0,(a1)+
		dbf	d7,loc_23368
		move.w	#$FFFF,(a1)
		rts
; End of function CopyStringToBuffer

; ---------------------------------------------------------------------------
ControlChars:	dc.w ~$0015			  ; DATA XREF: GetNextChar+2Ct
		dc.w ~$000E			  ; 57
		dc.w ~$0001			  ; 58
		dc.w ~$000B			  ; 59
		dc.w ~$000C			  ; 5A
		dc.w ~$0005			  ; 5B
		dc.w ~$0007			  ; 5C
		dc.w ~$0006			  ; 5D
		dc.w ~$0004			  ; 5E
		dc.w ~$0003			  ; 5F
		dc.w ~$0002			  ; 60
		dc.w ~$0018			  ; 61
		dc.w ~$000F			  ; 62
		dc.w ~$000D			  ; 63
		dc.w ~$0008			  ; 64
		dc.w ~$0009			  ; 65
		dc.w ~$000A			  ; 66
		dc.w ~$0017			  ; 67
		dc.w ~$0019			  ; 68

; =============== S U B	R O U T	I N E =======================================


sub_2339E:					  ; CODE XREF: HandleControlChars:HandleContinuePromptp
		lea	DownArrowGfx(pc),a0
		lea	($0000A480).l,a1
		move.w	#$0040,d0
		jsr	(j_QueueDMAOp).l
		jsr	(j_EnableDMAQueueProcessing).l
		rts
; End of function sub_2339E

; ---------------------------------------------------------------------------
