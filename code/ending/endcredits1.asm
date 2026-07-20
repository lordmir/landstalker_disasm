EndCredits1	module
; The end credits: proportional 16px-tall 2bpp text rendered into
; dynamically allocated tiles and scrolled up plane B at one pixel
; per two frames. The HUD row buffers (g_HUD_Row1/2) are reused as
; a rolling window of plane rows, and EndCreditText is a stream of
; {delay, position, text bytes..., $00} records ($FF delay = end).
; The renderer itself lives in endcredits2 (RenderCreditLine).
;
; Stack frame (shared with the endcredits2 routines):
;   -$02 frame tick            -$04 tile allocation cursor
;   -$06 line position code    -$08 current line's base tile
;   -$0A line width            -$0C next-line time threshold
;   -$0E underline mode        -$10 secondary tick

PlayEndCredits:
		trap	#$00			  ; Trap00Handler
		dc.w SND_MusicEnding
		link	a6,#-$0010
		clr.w	-$00000002(a6)
		clr.w	-$00000010(a6)
		clr.w	-$0000000C(a6)
		clr.w	-$00000004(a6)
		lea	(g_HUD_Row1).l,a0	  ; clear the plane-row window
		move.w	#$0000,d0
		move.w	#$07FF,d7

_clearWindow:
		move.w	d0,(a0)+
		dbf	d7,_clearWindow
		jsr	(j_DisableDisplayAndInts).l
		clr.w	d0
		clr.w	d1
		clr.w	d2
		jsr	(j_DoDMAFill).l
		lea	EndCreditFont(pc),a0
		lea	(g_Buffer).l,a1
		lea	($00004000).w,a2
		jsr	(j_LoadCompressedGfx).l	  ; a0 - compressed graphics source
						  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination
		lea	EndCreditLogos(pc),a0
		lea	(g_Blockset).l,a1
		lea	($00002000).w,a2
		jsr	(j_LoadCompressedGfx).l	  ; a0 - compressed graphics source
						  ; a1 - decompressed graphics buffer
						  ; a2 - VDP tile graphics destination
		lea	EndCreditLogoMap(pc),a0
		lea	(g_Blockset).l,a1	  ; g_Blockset doubles as scratch
		jsr	(j_DecompTilemap).l	  ; for the logo tilemap
		lea	EndCreditPal(pc),a0
		lea	(g_Pal0Base).l,a1
		move.l	(a0)+,(a1)+		  ; nine bytes of palette: colours
		move.l	(a0)+,(a1)+		  ; 0-3 and the high byte of 4
		move.b	(a0)+,(a1)+
		jsr	(j_CopyBasePaletteToActivePalette).l
		jsr	(j_EnableDisplayAndInts).l
		jsr	(j_EnableVDPSpriteUpdate).l
		move.b	#$01,(g_TextColour).l
		lea	(g_CreditBGColour).l,a0	  ; background colour 0, then the
		move.b	#$00,(a0)+		  ; three font ink shades
		move.b	#$01,(a0)+		  ; (palette indices 1-3)
		move.b	#$02,(a0)+
		move.b	#$03,(a0)+
		lea	EndCreditText(pc),a0

; Main loop: -$0C accumulates the delay bytes (units of 16 frames);
; when the frame tick reaches the threshold, the next line is
; rendered. The original compared the sum against tick/16, dropping
; the tick's low bits; FIX_END_CREDS scales the sum up instead.
_mainLoop:
		move.w	-12(a6),d0
		move.w	-2(a6),d1
	if FIX_END_CREDS
		lsl.w	#4,d0
	else
		lsr.w	#4,d1
	endif
		cmp.w	d0,d1
		bcs.s	_tick
		clr.w	d0
		move.b	(a0)+,d0
		cmpi.b	#$FF,d0
		beq.w	_finish
		add.w	d0,-12(a6)
		bsr.w	_renderNextLine

_tick:
		bsr.w	AdvanceCreditFrame
		bra.s	_mainLoop

; End marker: hold for three minutes, then return with the pad
; state in d1 (the caller decides what follows).
_finish:
		move.w	#10799,d0
		jsr	(j_Sleep).l
		jsr	(j_UpdateControllerInputs).l
		move.b	(g_Controller1State).l,d1
		unlk	a6
		rts

; One credits frame: on even ticks update the plane-B vertical
; scroll (tick/2 + 16), feed the next buffer row into the plane
; when due (UpdateCreditScroll, every 16th tick), wait for VBlank
; and advance both ticks. The endcredits2 renderer calls this
; between glyphs so the scroll never stalls while text is drawn.
AdvanceCreditFrame:
		movem.l	d0-a6,-(sp)
		move.w	-$00000002(a6),d6
		lsr.w	#$01,d6
		bcs.s	_acfRow
		addi.w	#$0010,d6
		jsr	(j_FillVSRAMOffset1).l
		jsr	(j_EnableDMAQueueProcessing).l

_acfRow:
		bsr.w	UpdateCreditScroll
		jsr	(j_WaitUntilVBlank).l
		addq.w	#$01,-$00000002(a6)
		addq.w	#$01,-$00000010(a6)
		movem.l	(sp)+,d0-a6
		rts

; Reads the line's position byte and renders the line.
_renderNextLine:
		clr.w	d0
		move.b	(a0)+,d0
		bsr.w	RenderCreditLine
		rts

		modend
