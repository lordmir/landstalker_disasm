init:
		di
		ld	sp, STACK_START
		xor	a
		ld	(SFX_USELESS_BYTE_1), a
		dec	a
		ld	(SFX_USELESS_BYTE_2), a
		ld	a, 0Fh
		ld	(MUSIC_LEVEL), a
		ld	a, 0FFh
		ld	(YM_TIMER_VALUE), a
		ld	a, 0Fh
		ld	(FADE_IN_PARAMETERS), a
		ld	a, 20h ; ' '
		call	Main
		call	LoadBank

Main_Loop:				; CODE XREF: init+44j init+5Aj ...
		ld	a, (YM2612_A0)
		and	2
		jr	z, Dac_Loop
		call	UpdateSound
		jp	loc_34
; ---------------------------------------------------------------------------

Dac_Loop:				; CODE XREF: init+28j
					; DATA XREF: LoadDacSound+19w
		ld	b, 5

loc_32:					; CODE XREF: init:loc_32j
		djnz	$

loc_34:					; CODE XREF: init+2Dj
		ld	a, (NEW_OPERATION)
		or	a
		call	nz, Main
		ld	a, (NEW_SAMPLE_TO_LOAD)
		or	a
		call	nz, LoadDacSound
		ld	a, d
		or	e
		jr	z, Main_Loop
		ld	b, 2Ah ; '*'
		ld	c, (hl)
		inc	hl

loc_4A:					; CODE XREF: init+4Fj
		ld	a, (YM2612_A0)
		and	80h ; '�'
		jr	nz, loc_4A
		ld	a, b
		ld	(YM2612_A0), a
		ld	a, c
		ld	(YM2612_D0), a
		dec	de
		jp	Main_Loop
; End of function init

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR Main

Mute_Sound:				; CODE XREF: Main+8j
		push	hl
		push	de
		xor	a
		ld	(CURRENTLY_MANAGING_SFX_TYPE_2), a
		ld	(CALL_YM2_INSTEAD_OF_YM1), a
		ld	bc, 407Fh
		ld	d, 4

loc_6B:					; CODE XREF: Main-144j
		call	YM_Input
		inc	b
		call	YM_Input
		inc	b
		call	YM_Input
		inc	b
		inc	b
		dec	d
		jr	nz, loc_6B
		ld	a, 1
		ld	(CALL_YM2_INSTEAD_OF_YM1), a
		ld	bc, 407Fh
		ld	d, 4

loc_85:					; CODE XREF: Main-12Aj
		call	YM2_Input
		inc	b
		call	YM2_Input
		inc	b
		call	YM2_Input
		inc	b
		inc	b
		dec	d
		jr	nz, loc_85
		ld	hl, SN76489_PSG
		ld	a, 9Fh ; '�'
		ld	(hl), a
		ld	a, 0BFh	; '�'
		ld	(hl), a
		ld	a, 0DFh	; '�'
		ld	(hl), a
		ld	a, 0FFh
		ld	(hl), a

loc_A4:					; CODE XREF: Main-115j
		ld	a, (NEW_OPERATION)
		or	a
		jr	z, loc_A4
		cp	0FFh
		jr	nz, Update_YM_Instruments
		xor	a
		ld	(NEW_OPERATION), a

Update_YM_Instruments:			; CODE XREF: Main-111j	Main-7Dj
		call	Update_YM_InstrumentsLevels
		pop	de
		pop	hl
		pop	af
		jp	Main_Loop
; END OF FUNCTION CHUNK	FOR Main

; =============== S U B	R O U T	I N E =======================================


Update_YM_InstrumentsLevels:		; CODE XREF: Main:Update_YM_Instrumentsp
					; UpdateSound+1Ep
		ld	iy, CURRENT_CHANNEL
		xor	a
		ld	(CALL_YM2_INSTEAD_OF_YM1), a
		ld	(iy+0),	a
		ld	ix, YM_CHANNEL_DATA_1
		ld	a, (ix+4)
		call	YM1_LoadInstrument
		inc	(iy+0)
		ld	ix, YM_CHANNEL_DATA_2
		ld	a, (ix+4)
		call	YM1_LoadInstrument
		inc	(iy+0)
		ld	ix, YM_CHANNEL_DATA_3
		ld	a, (ix+4)
		call	YM1_LoadInstrument
		xor	a
		ld	(iy+0),	a
		ld	a, 1

loc_F0:
		ld	(CALL_YM2_INSTEAD_OF_YM1), a
		ld	ix, YM_CHANNEL_DATA_4
		ld	a, (ix+4)
		call	YM2_Load_Instrument
		inc	(iy+0)
		ld	ix, YM_CHANNEL_DATA_5
		ld	a, (ix+4)
		call	YM2_Load_Instrument
		xor	a
		ld	(iy+0),	a
		ld	a, 1
		ld	(CURRENTLY_MANAGING_SFX_TYPE_2), a
		ld	ix, SFX_TYPE_2_CHANNEL_DATA_1
		ld	a, (ix+3)
		or	a
		jr	nz, loc_123
		ld	a, (ix+4)
		call	YM2_Load_Instrument

loc_123:				; CODE XREF: Update_YM_InstrumentsLevels+60j
		inc	(iy+0)
		ld	ix, SFX_TYPE_2_CHANNEL_DATA_2
		ld	a, (ix+3)
		or	a
		jr	nz, locret_136
		ld	a, (ix+4)
		call	YM2_Load_Instrument

locret_136:				; CODE XREF: Update_YM_InstrumentsLevels+73j
		ret
; End of function Update_YM_InstrumentsLevels

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR Main

Update_YM_Level:			; CODE XREF: Main+17j
		push	hl
		push	de
		ld	hl, MUSIC_LEVEL
		ld	a, (hl)
		and	0Fh
		ld	(hl), a
		jp	Update_YM_Instruments
; END OF FUNCTION CHUNK	FOR Main

; =============== S U B	R O U T	I N E =======================================


LoadBank:				; CODE XREF: init+20p LoadDacSound+2Ep ...
		ld	bc, 100h	; b - 0x01
					; c - 0x00
		push	hl
		push	de
		ld	hl, BANK_TO_LOAD
		ld	a, (hl)
		and	1
		ld	d, (hl)
		srl	d
		ld	hl, Z80_BANK
		ld	(hl), a		; Write	bank register
					; 0b ad1111000 - BANK *	0x8000 | 0x1E0000
		ld	(hl), d
		ld	(hl), b
		ld	(hl), b
		ld	(hl), b
		ld	(hl), b
	IF       EXPANDED == 0
		ld	(hl), c
	ELSEIF   EXPANDED == 1
		ld	(hl), b
	ENDIF
		ld	(hl), c
		ld	(hl), c
		pop	de
		pop	hl
		ret
; End of function LoadBank


; =============== S U B	R O U T	I N E =======================================


LoadMusicBank:				; CODE XREF: Main+2Bp Main+39p ...
		push	bc
		push	hl
		ld	bc, 100h
		ld	hl, Z80_BANK
		ld	a, (MUSIC_BANK_TO_LOAD)
		ld	(hl), a		; Write	bank register
					; 0b a11111000 - BANK *	0x8000 | 0x1F0000
		ld	(hl), b
		ld	(hl), b
		ld	(hl), b
		ld	(hl), b
		ld	(hl), b
	IF       EXPANDED == 0
		ld	(hl), c
	ELSEIF   EXPANDED == 1
		ld	(hl), b
	ENDIF
		ld	(hl), c
		ld	(hl), c
		pop	hl
		pop	bc
		ret
; End of function LoadMusicBank


; =============== S U B	R O U T	I N E =======================================


LoadInstrumentsBank:			; CODE XREF: YM1_LoadInstrumentp
					; YM2_Load_Instrumentp
		push	bc
		push	hl
		ld	bc, 100h
		ld	hl, Z80_BANK
		ld	(hl), b		; Write	Bank Register
					; 0b111111000 -	0x1F8000
		ld	(hl), b
		ld	(hl), b
		ld	(hl), b
		ld	(hl), b
		ld	(hl), b
	IF       EXPANDED == 0
		ld	(hl), c
	ELSEIF   EXPANDED == 1
		ld	(hl), b
	ENDIF
		ld	(hl), c
		ld	(hl), c
		pop	hl
		pop	bc
		ret
; End of function LoadInstrumentsBank


; =============== S U B	R O U T	I N E =======================================


LoadDacSound:				; CODE XREF: init+3Fp
		cp	0FEh ; '�'
		jr	nz, loc_196
		ld	hl, 0C000h
		ld	de, 0
		ret
; ---------------------------------------------------------------------------

loc_196:				; CODE XREF: LoadDacSound+2j
		dec	a
		ld	h, 0
		ld	l, a
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ld	bc, t_SAMPLE_LOAD_DATA
		add	hl, bc
		ld	a, (hl)
		inc	hl
		inc	hl
		ld	(Dac_Loop+1), a
		ld	a, (hl)
		ld	(BANK_TO_LOAD),	a
		inc	hl
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		xor	a
		ld	(NEW_SAMPLE_TO_LOAD), a
		call	LoadBank
		ret
; End of function LoadDacSound


; =============== S U B	R O U T	I N E =======================================


Main:					; CODE XREF: init+1Dp init+38p

; FUNCTION CHUNK AT 0000005D SIZE 0000005E BYTES
; FUNCTION CHUNK AT 00000137 SIZE 0000000C BYTES

		push	af
		xor	a
		ld	(NEW_OPERATION), a
		pop	af
		cp	0FFh
		jp	z, Mute_Sound
		cp	0FEh ; '�'
		jp	z, StopMusic
		cp	0FDh ; '�'
		jp	z, FadeOut
		cp	0F0h ; '�'
		jp	z, Update_YM_Level
		cp	41h ; 'A'
		jp	nc, Load_SFX
		push	hl
		push	de
		push	af
		cp	21h ; '!'
		jr	nc, loc_1F2
		ld	a, 1
		ld	(MUSIC_BANK_TO_LOAD), a
		call	LoadMusicBank
		pop	af
		ld	de,  Bank+910h	; Selected 68k Bank
		jp	Load_Music
; ---------------------------------------------------------------------------

loc_1F2:				; CODE XREF: Main+24j
		xor	a
		ld	(MUSIC_BANK_TO_LOAD), a
		call	LoadMusicBank
		pop	af
		ld	de, Bank	; Selected 68k Bank
		sub	20h ; ' '

Load_Music:				; CODE XREF: Main+32j
		dec	a
		add	a, a
		ld	h, 0
		ld	l, a
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ld	a, (hl)
		or	a
		jp	nz, Load_SFX
		ld	a, (FADE_IN_PARAMETERS)
		and	0Fh
		ld	(MUSIC_LEVEL), a
		xor	a
		ld	(FADE_IN_TIMER), a
		ld	(USELESS_BYTE),	a
		call	StopMusic
		inc	hl
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	(MUSIC_DOESNT_USE_SAMPLES), de
		ld	bc, 2B80h
		call	YM1_Input
		ld	b, 26h ; '&'
		ld	c, (hl)
		inc	c
		inc	c
		inc	c
		call	YM1_Input
		xor	a
		ld	(CURRENTLY_FADING_OUT),	a
		ld	(FADE_OUT_COUNTER), a
		ld	a, 63h ; 'c'
		ld	(FADE_OUT_TIMER), a
		inc	hl
		ld	b, 0Ah
		ld	ix, YM_CHANNEL_DATA_1

Load_Music_Channels:			; CODE XREF: Main+D0j
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	(ix+0),	e
		ld	(ix+1),	d
		ld	a, 0C0h	; '�'
		ld	(ix+1Eh), a
		xor	a
		ld	(ix+2),	a
		ld	(ix+3),	a
		ld	(ix+8),	a
		ld	(ix+13h), a
		ld	(ix+14h), a
		ld	(ix+1Ch), a
		ld	(ix+1Dh), a
		ld	(ix+1Fh), a
		ld	a, 1
		ld	(ix+1Eh), a
		ld	d, (ix+1)
		ld	e, (ix+0)
		ld	a, (de)
		cp	0FFh
		jr	nz, loc_288
		ld	a, 1
		ld	(ix+3),	a

loc_288:				; CODE XREF: Main+C4j
		ld	de, 20h	; ' '
		add	ix, de
		djnz	Load_Music_Channels
		ld	b, 2

Activate_Stereo_Outputs:		; CODE XREF: Main+E9j
		push	bc
		ld	a, b
		dec	a
		ld	(CALL_YM2_INSTEAD_OF_YM1), a
		ld	bc, 0B4C0h
		call	YM_Input
		inc	b
		call	YM_Input
		inc	b
		call	YM_Input
		pop	bc
		djnz	Activate_Stereo_Outputs
		ld	a, 0C0h	; '�'
		ld	(YM_CHANNEL_4_STEREO), a
		ld	(YM_CHANNEL_5_STEREO), a
		ld	a, 0FEh	; '�'
		ld	(NEW_SAMPLE_TO_LOAD), a
		call	YM_LoadTimerB

Load_End:				; CODE XREF: Main+12Fj	Main+139j ...
		pop	de
		pop	hl
		jp	LoadBank
; ---------------------------------------------------------------------------

Load_SFX:				; CODE XREF: Main+1Cj Main+4Ej
		push	hl
		push	de
		sub	41h ; 'A'
		ld	h, 0
		ld	l, a
		add	hl, hl
		ld	de, pt_SFX
		add	hl, de
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ld	a, (hl)
		inc	hl
		cp	1
		jr	nz, Load_SFX_Type_2
		ld	b, 0Ah
		ld	ix, YM_CHANNEL_DATA_1

Load_SFX_Channels:			; CODE XREF: Main+12Dj
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (de)
		cp	0FFh
		jr	z, loc_2E5
		call	InitChannelDataForSFX

loc_2E5:				; CODE XREF: Main+123j
		ld	de, 20h	; ' '
		add	ix, de
		djnz	Load_SFX_Channels
		jr	Load_End
; ---------------------------------------------------------------------------

Load_SFX_Type_2:			; CODE XREF: Main+114j
		ld	a, (SFX_USELESS_BYTE_1)
		ld	d, a
		ld	a, (SFX_USELESS_BYTE_2)
		sub	d
		jp	c, Load_End
		ld	a, d
		ld	(SFX_USELESS_BYTE_2), a
		ld	bc, 304h
		ld	ix, SFX_TYPE_2_CHANNEL_DATA_1

loc_304:				; CODE XREF: Main+169j
		push	bc
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (de)
		cp	0FFh
		jr	z, loc_31F
		call	InitChannelDataForSFX
		ld	b, 28h ; '('
		call	YM1_Input
		ld	c, a
		add	a, 0B0h	; '�'
		ld	b, a
		ld	c, 0C0h	; '�'
		call	YM2_Input

loc_31F:				; CODE XREF: Main+14Fj
		ld	de, 20h	; ' '
		add	ix, de
		pop	bc
		inc	c
		djnz	loc_304
		jp	Load_End
; End of function Main


; =============== S U B	R O U T	I N E =======================================


InitChannelDataForSFX:			; CODE XREF: Main+125p	Main+151p
		ld	(ix+0),	e
		ld	(ix+1),	d
		ld	a, 0C0h	; '�'
		ld	(ix+1Eh), a
		xor	a
		ld	(ix+2),	a
		ld	(ix+3),	a
		ld	(ix+8),	a
		ld	(ix+13h), a
		ld	(ix+14h), a
		ld	(ix+1Ch), a
		ld	(ix+1Dh), a
		ld	(ix+1Fh), a
		ld	a, 1
		ld	(ix+1Eh), a
		ret
; End of function InitChannelDataForSFX


; =============== S U B	R O U T	I N E =======================================


StopMusic:				; CODE XREF: Main+Dj Main+60p	...
		push	hl
		ld	iy, CURRENT_CHANNEL
		xor	a
		ld	(CALL_YM2_INSTEAD_OF_YM1), a
		ld	(iy+0),	a
		ld	ix, YM_CHANNEL_DATA_1
		call	YM1_LoadInstrument
		ld	bc, 2800h
		call	YM1_Input
		inc	(iy+0)
		xor	a
		ld	ix, YM_CHANNEL_DATA_2
		call	YM1_LoadInstrument
		ld	bc, 2801h
		call	YM1_Input
		inc	(iy+0)
		xor	a
		ld	ix, YM_CHANNEL_DATA_3
		call	YM1_LoadInstrument
		ld	bc, 2802h
		call	YM1_Input
		ld	a, 1
		ld	(CALL_YM2_INSTEAD_OF_YM1), a
		xor	a
		ld	(iy+0),	a
		ld	a, (SFX_TYPE_2_CHANNEL_1_NOT_IN_USE)
		or	a
		jr	z, loc_3AD
		xor	a
		ld	ix, YM_CHANNEL_DATA_4
		call	YM2_Load_Instrument
		ld	bc, 2804h
		call	YM1_Input

loc_3AD:				; CODE XREF: StopMusic+48j
		inc	(iy+0)
		ld	a, (SFX_TYPE_2_CHANNEL_2_NOT_IN_USE)
		or	a
		jr	z, loc_3C4
		xor	a
		ld	ix, YM_CHANNEL_DATA_5
		call	YM2_Load_Instrument
		ld	bc, 2805h
		call	YM1_Input

loc_3C4:				; CODE XREF: StopMusic+5Fj
		ld	hl, SN76489_PSG
		ld	a, 9Fh ; '�'
		ld	(hl), a
		ld	a, 0BFh	; '�'
		ld	(hl), a
		ld	a, 0DFh	; '�'
		ld	(hl), a
		ld	a, 0FFh
		ld	(hl), a
		ld	hl, YM_CHANNEL_1_NOT_IN_USE
		ld	de, 20h	; ' '
		ld	b, 0Ah
		ld	a, 1

loc_3DD:				; CODE XREF: StopMusic+8Aj
		ld	(hl), a
		add	hl, de
		djnz	loc_3DD
		pop	hl
		ld	de, 0
		xor	a
		ld	(CURRENTLY_FADING_OUT),	a
		ld	(FADE_OUT_COUNTER), a
		ld	a, 63h ; 'c'

loc_3EE:
		ld	(FADE_OUT_TIMER), a
		ld	a, 0FFh
		ld	(SFX_USELESS_BYTE_2), a
		ret
; End of function StopMusic


; =============== S U B	R O U T	I N E =======================================


UpdateSound:				; CODE XREF: init+2Ap
		push	bc
		push	de
		push	hl
		ld	hl, FADE_IN_TIMER
		inc	(hl)
		ld	a, (FADE_IN_PARAMETERS)
		rrca
		rrca
		and	3Ch ; '<'
		jr	z, loc_418
		cp	(hl)
		jr	nz, loc_418
		xor	a
		ld	(hl), a
		ld	hl, MUSIC_LEVEL
		ld	a, (hl)
		cp	0Fh
		jr	z, loc_418
		inc	(hl)
		call	Update_YM_InstrumentsLevels

loc_418:				; CODE XREF: UpdateSound+Ej
					; UpdateSound+11j ...
		call	LoadMusicBank
		ld	hl, (MUSIC_DOESNT_USE_SAMPLES)
		ld	a, h
		or	l
		jr	z, loc_42B
		dec	hl
		ld	(MUSIC_DOESNT_USE_SAMPLES), hl
		ld	a, h
		or	l
		call	z, FadeOut

loc_42B:				; CODE XREF: UpdateSound+29j
		ld	a, (CURRENTLY_FADING_OUT)
		or	a
		jr	z, loc_451
		ld	a, (FADE_OUT_TIMER)
		or	a
		jr	nz, loc_44D
		ld	a, (FADE_OUT_LENGTH)
		ld	(FADE_OUT_TIMER), a
		ld	a, (FADE_OUT_COUNTER)
		inc	a
		ld	(FADE_OUT_COUNTER), a
		cp	0Ch
		jr	nz, loc_451
		call	StopMusic
		jr	loc_4BA
; ---------------------------------------------------------------------------

loc_44D:				; CODE XREF: UpdateSound+3Ej
		dec	a
		ld	(FADE_OUT_TIMER), a

loc_451:				; CODE XREF: UpdateSound+38j
					; UpdateSound+4Fj
		call	YM_LoadTimerB
		ld	iy, CURRENT_CHANNEL
		xor	a
		ld	(CURRENTLY_MANAGING_SFX_TYPE_2), a
		ld	(CALL_YM2_INSTEAD_OF_YM1), a
		ld	(iy+0),	a
		call	YM1_ParseData
		inc	(iy+0)
		call	YM1_ParseData
		inc	(iy+0)
		call	YM1_ParseData
		ld	a, 1
		ld	(CALL_YM2_INSTEAD_OF_YM1), a
		xor	a
		ld	(iy+0),	a
		call	YM2_ParseData
		inc	(iy+0)
		call	YM2_ParseData
		inc	(iy+0)
		call	YM2_ParseChannel6Data
		xor	a
		ld	(iy+0),	a
		call	PSG_ParseToneData
		inc	(iy+0)
		call	PSG_ParseToneData
		inc	(iy+0)
		call	PSG_ParseToneData
		inc	(iy+0)
		call	PSG_ParseNoiseData
		ld	a, 1
		ld	(CURRENTLY_MANAGING_SFX_TYPE_2), a
		xor	a
		ld	(iy+0),	a
		call	YM2_ParseData
		inc	(iy+0)
		call	YM2_ParseData
		inc	(iy+0)
		call	YM2_ParseChannel6Data

loc_4BA:				; CODE XREF: UpdateSound+54j
		call	LoadBank
		pop	hl
		pop	de
		pop	bc
		ret
; End of function UpdateSound


; =============== S U B	R O U T	I N E =======================================


YM_LoadTimerB:				; CODE XREF: Main+F8p
					; UpdateSound:loc_451p
		ld	bc, 273Ah
		jr	YM1_Input
; End of function YM_LoadTimerB


; =============== S U B	R O U T	I N E =======================================


YM1_ConditionalInput:			; CODE XREF: sub_880-CEp sub_880+41p
		ld	a, (CURRENTLY_MANAGING_SFX_TYPE_2)
		or	a
		jr	nz, YM1_Input
		exx
		push	ix
		pop	hl
		ld	bc, 0E3h ; '�'
		add	hl, bc
		ld	a, (hl)
		exx
		or	a
		jr	nz, YM1_Input
		ret
; End of function YM1_ConditionalInput


; =============== S U B	R O U T	I N E =======================================


YM_Input:				; CODE XREF: Main:loc_6Bp Main-14Ep ...
		ld	a, (CALL_YM2_INSTEAD_OF_YM1)
		or	a
		jr	nz, YM2_ConditionalInput
; End of function YM_Input


; =============== S U B	R O U T	I N E =======================================


YM1_Input:				; CODE XREF: Main+6Fp Main+78p ...
		ld	a, (YM2612_A0)
		and	80h ; '�'
		jr	nz, YM1_Input
		ld	a, b
		ld	(YM2612_A0), a
		ld	a, c
		ld	(YM2612_D0), a
		ret
; End of function YM1_Input


; =============== S U B	R O U T	I N E =======================================


YM2_ConditionalInput:			; CODE XREF: YM_Input+4j
					; sub_880:loc_89Cp ...
		ld	a, (CURRENTLY_MANAGING_SFX_TYPE_2)
		or	a
		jr	nz, YM2_Input
		exx
		push	ix
		pop	hl
		ld	bc, 0E3h ; '�'
		add	hl, bc
		ld	a, (hl)
		exx
		or	a
		ret	z
; End of function YM2_ConditionalInput


; =============== S U B	R O U T	I N E =======================================


YM2_Input:				; CODE XREF: Main:loc_85p Main-134p ...
		ld	a, (YM2612_A1)
		and	80h ; '�'
		jr	nz, YM2_Input
		ld	a, b
		ld	(YM2612_A1), a
		ld	a, c
		ld	(YM2612_D1), a
		ret
; End of function YM2_Input

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR PSG_ParseToneData

PSG_SetChannelAttenuation:		; CODE XREF: PSG_ParseToneData+4Fj
					; PSG_ParseNoiseData+41j
		and	0Fh
		ld	h, a
		ld	a, (CURRENT_PSG_CHANNEL)
		or	h
		or	90h ; '�'
		ld	(SN76489_PSG), a
		ret
; END OF FUNCTION CHUNK	FOR PSG_ParseToneData

; =============== S U B	R O U T	I N E =======================================


DAC_SetNewSample:			; CODE XREF: YM2_ParseChannel6Data+24p
					; YM2_ParseChannel6Data+85p
		ld	b, a
		ld	a, (CURRENTLY_MANAGING_SFX_TYPE_2)
		or	a
		jr	nz, loc_53E
		exx
		push	ix
		pop	hl
		ld	bc, 0E3h ; '�'
		add	hl, bc
		ld	a, (hl)
		exx
		or	a
		ret	z
		ld	a, (FADE_OUT_COUNTER)
		cp	3
		ret	nc
		ld	a, (MUSIC_LEVEL)
		cp	0Fh
		ret	nz

loc_53E:				; CODE XREF: DAC_SetNewSample+5j
		ld	a, b
		ld	(NEW_SAMPLE_TO_LOAD), a
		ret
; End of function DAC_SetNewSample

; ---------------------------------------------------------------------------

YM1_ParseData:				; CODE XREF: UpdateSound+6Bp
					; UpdateSound+71p ...
		ld	a, (iy+0)
		ld	ix, YM_CHANNEL_DATA_1
		push	af
		add	a, a
		add	a, a
		add	a, a
		add	a, a
		add	a, a
		ld	d, 0
		ld	e, a
		add	ix, de
		pop	af
		ld	c, 0A0h	; '�'
		add	a, c
		ld	(loc_759+1), a
		ld	c, 4
		add	a, c
		ld	(loc_750+1), a

loc_562:				; CODE XREF: ROM:00000683j
		ld	a, (ix+3)
		or	a
		ret	nz
		ld	a, (ix+6)
		cp	(ix+2)
		jr	nz, loc_57E
		ld	a, (ix+8)
		or	a
		jr	nz, loc_57E
		ld	b, 28h ; '('
		ld	a, (iy+0)
		ld	c, a
		call	YM1_Input

loc_57E:				; CODE XREF: ROM:0000056Dj
					; ROM:00000573j
		ld	a, (ix+2)
		or	a
		jp	nz, loc_686
		ld	d, (ix+1)
		ld	e, (ix+0)

YM1_Parsing_Start:			; CODE XREF: ROM:000005BDj
					; ROM:000005C9j ...
		xor	a
		ld	(ix+0Dh), a
		ld	a, (ix+9)
		ld	(ix+0Ah), a
		ld	a, (de)
		and	0F8h ; '�'
		cp	0F8h ; '�'
		jp	nz, loc_612
		ld	a, (de)
		cp	0FFh
		jp	nz, YM1_Set_Instrument
		inc	de
		ld	a, (de)
		ld	l, a
		inc	de
		ld	a, (de)
		ld	h, a
		or	a
		jr	nz, YM1_Parse_At_New_Offset
		ld	a, l
		or	a
		jr	z, loc_5B3
		ld	(NEW_OPERATION), a

loc_5B3:				; CODE XREF: ROM:000005AEj
		ld	a, 1
		ld	(ix+3),	a
		xor	a
		jp	YM1_LoadInstrument
; ---------------------------------------------------------------------------

YM1_Parse_At_New_Offset:		; CODE XREF: ROM:000005AAj
		ex	de, hl
		jr	YM1_Parsing_Start
; ---------------------------------------------------------------------------

YM1_Set_Instrument:			; CODE XREF: ROM:000005A0j
		cp	0FEh ; '�'
		jr	nz, YM1_Load_Note
		inc	de
		ld	a, (de)
		call	YM1_SetChannelInstrument
		inc	de
		jp	YM1_Parsing_Start
; ---------------------------------------------------------------------------

YM1_Load_Note:				; CODE XREF: ROM:000005C1j
		cp	0FDh ; '�'
		jr	nz, YM1_Set_Slide_Or_Key_Release
		inc	de
		ld	a, (de)
		and	0Fh
		call	YM1_LoadInstrument
		inc	de
		jp	YM1_Parsing_Start
; ---------------------------------------------------------------------------

YM1_Set_Slide_Or_Key_Release:		; CODE XREF: ROM:000005CEj
		cp	0FCh ; '�'
		jr	nz, YM1_Load_Vibrato
		call	YM1_SetSlideOrKeyRelease
		jp	YM1_Parsing_Start
; ---------------------------------------------------------------------------

YM1_Load_Vibrato:			; CODE XREF: ROM:000005DDj
		cp	0FBh ; '�'
		jr	nz, YM1_Set_Stereo
		call	LoadVibrato
		jp	YM1_Parsing_Start
; ---------------------------------------------------------------------------

YM1_Set_Stereo:				; CODE XREF: ROM:000005E7j
		cp	0FAh ; '�'
		jr	nz, YM1_Load_Note_Shift
		call	YM1_SetStereo
		jp	YM1_Parsing_Start
; ---------------------------------------------------------------------------

YM1_Load_Note_Shift:			; CODE XREF: ROM:000005F1j
		cp	0F9h ; '�'
		jr	nz, YM1_Loop_Command
		call	LoadNoteShift
		jp	YM1_Parsing_Start
; ---------------------------------------------------------------------------

YM1_Loop_Command:			; CODE XREF: ROM:000005FBj
		cp	0F8h ; '�'
		jr	nz, YM1_Bad_Command
		call	ParseLoopCommand
		jp	YM1_Parsing_Start
; ---------------------------------------------------------------------------

YM1_Bad_Command:			; CODE XREF: ROM:00000605j
		inc	de
		inc	de
		jp	YM1_Parsing_Start
; ---------------------------------------------------------------------------

loc_612:				; CODE XREF: ROM:0000059Aj
		ld	a, (de)
		and	7Fh ; ''
		cp	70h ; 'p'
		jp	z, loc_66A
		add	a, (ix+1Ch)
		ld	l, a
		ld	h, 0
		ld	bc,  t_YM_FREQUENCIES+1
		add	hl, hl
		add	hl, bc
		ld	a, (hl)
		dec	hl
		ld	l, (hl)
		ld	h, a
		ld	b, 0
		ld	c, (ix+1Dh)
		add	hl, bc
		ld	a, (loc_750+1)
		ld	b, a
		ld	c, h
		ld	(ix+12h), c
		ld	a, (ix+1Fh)
		or	a
		jr	nz, loc_644
		ld	(ix+0Fh), c
		xor	a
		ld	(ix+12h), a

loc_644:				; CODE XREF: ROM:0000063Bj
		call	YM1_Input
		ld	a, (loc_759+1)
		ld	b, a
		ld	c, l
		ld	(ix+11h), c
		ld	a, (ix+1Fh)
		or	a
		jr	nz, loc_65C
		ld	(ix+0Eh), c
		xor	a
		ld	(ix+11h), a

loc_65C:				; CODE XREF: ROM:00000653j
		call	YM1_Input
		ld	b, 28h ; '('
		ld	a, (iy+0)
		or	0F0h ; '�'
		ld	c, a
		call	YM1_Input

loc_66A:				; CODE XREF: ROM:00000617j
		ld	a, (de)
		bit	7, a
		jr	nz, Command_F0
		ld	a, (ix+7)
		jr	loc_679
; ---------------------------------------------------------------------------

Command_F0:				; CODE XREF: ROM:0000066Dj
		inc	de
		ld	a, (de)
		ld	(ix+7),	a

loc_679:				; CODE XREF: ROM:00000672j
		ld	(ix+2),	a
		inc	de
		ld	(ix+1),	d
		ld	(ix+0),	e
		jp	loc_562
; ---------------------------------------------------------------------------

loc_686:				; CODE XREF: ROM:00000582j
		dec	(ix+2)
		ld	b, (ix+12h)
		ld	c, (ix+11h)
		ld	a, b
		or	c
		jr	z, loc_70A
		ld	a, (ix+0Fh)
		ld	h, a
		ld	a, (ix+0Eh)
		ld	l, a
		push	bc
		push	hl
		or	a
		sbc	hl, bc
		ld	a, h
		ld	(TEMP_FREQUENCY), a
		jr	nc, loc_6AE
		ld	b, 0
		ld	c, (ix+1Fh)
		jp	loc_6B6
; ---------------------------------------------------------------------------

loc_6AE:				; CODE XREF: ROM:000006A4j
		ld	b, 0FFh
		ld	a, (ix+1Fh)
		neg
		ld	c, a

loc_6B6:				; CODE XREF: ROM:000006ABj
		pop	hl
		add	hl, bc
		pop	bc
		push	hl
		or	a
		sbc	hl, bc
		ld	a, (TEMP_FREQUENCY)
		xor	h
		bit	7, a
		pop	hl
		jr	nz, loc_6FD
		push	hl
		ld	a, h
		and	7
		ld	h, a
		ld	(TEMP_FREQUENCY), hl
		ld	bc, 4D4h
		or	a
		sbc	hl, bc
		jr	c, loc_6DC
		ld	bc, 596h
		jp	loc_6F0
; ---------------------------------------------------------------------------

loc_6DC:				; CODE XREF: ROM:000006D4j
		ld	hl, (TEMP_FREQUENCY)
		ld	bc, 26Ah
		or	a
		sbc	hl, bc
		jr	nc, loc_6ED
		ld	bc, 0FA6Ah
		jp	loc_6F0
; ---------------------------------------------------------------------------

loc_6ED:				; CODE XREF: ROM:000006E5j
		ld	bc, 0

loc_6F0:				; CODE XREF: ROM:000006D9j
					; ROM:000006EAj
		pop	hl
		add	hl, bc
		ld	a, h
		ld	(ix+0Fh), a
		ld	a, l
		ld	(ix+0Eh), a
		jp	loc_70A
; ---------------------------------------------------------------------------

loc_6FD:				; CODE XREF: ROM:000006C4j
		ld	(ix+0Fh), b
		ld	(ix+0Eh), c
		xor	a
		ld	(ix+11h), a
		ld	(ix+12h), a

loc_70A:				; CODE XREF: ROM:00000691j
					; ROM:000006FAj
		ld	a, (ix+0Ah)
		or	a
		jr	z, loc_716
		dec	(ix+0Ah)
		xor	a
		jr	EndPart
; ---------------------------------------------------------------------------

loc_716:				; CODE XREF: ROM:0000070Ej
					; ROM:0000073Cj
		ld	a, (ix+0Ch)
		ld	h, a
		ld	a, (ix+0Bh)
		ld	l, a
		ld	a, (ix+0Dh)
		ld	b, 0
		ld	c, a
		inc	(ix+0Dh)
		add	hl, bc
		ld	a, (hl)
		cp	81h ; '�'
		jr	nz, loc_733
		dec	(ix+0Dh)
		xor	a
		jr	EndPart
; ---------------------------------------------------------------------------

loc_733:				; CODE XREF: ROM:0000072Bj
		cp	80h ; '�'
		jp	nz, EndPart
		xor	a
		ld	(ix+0Dh), a
		jp	loc_716
; ---------------------------------------------------------------------------

EndPart:				; CODE XREF: ROM:00000714j
					; ROM:00000731j ...
		ld	c, a
		ld	a, (ix+0Eh)
		ld	l, a
		ld	a, (ix+0Fh)
		ld	h, a
		ld	b, 0
		bit	7, c
		jr	z, loc_74F
		dec	b

loc_74F:				; CODE XREF: ROM:0000074Cj
		add	hl, bc

loc_750:				; DATA XREF: ROM:0000055Fw
					; ROM:0000062Fr ...
		ld	b, 0
		ld	c, h
		ld	(ix+0Fh), c
		call	YM1_Input

loc_759:				; DATA XREF: ROM:00000559w
					; ROM:00000647r ...
		ld	b, 0
		ld	c, l
		ld	(ix+0Eh), c
		call	YM1_Input
		ld	a, (FADE_OUT_TIMER)
		or	a
		ret	nz
		ld	a, (ix+4)
		jp	YM1_LoadInstrument
; ---------------------------------------------------------------------------

YM2_ParseData:				; CODE XREF: UpdateSound+83p
					; UpdateSound+89p ...
		ld	a, (iy+0)
		ld	ix, YM_CHANNEL_DATA_4
		push	af
		add	a, a
		add	a, a
		add	a, a
		add	a, a
		add	a, a
		ld	d, 0
		ld	e, a
		add	ix, de
		ld	a, (CURRENTLY_MANAGING_SFX_TYPE_2)
		or	a
		jr	z, loc_78A
		ld	de, 0E0h ; '�'
		add	ix, de

loc_78A:				; CODE XREF: ROM:00000783j
		pop	af
		ld	c, 0A0h	; '�'
		add	a, c
		ld	(loc_9B3+1), a
		ld	c, 4
		add	a, c
		ld	(loc_9AA+1), a
; START	OF FUNCTION CHUNK FOR sub_880

loc_797:				; CODE XREF: sub_880+5Dj
		ld	a, (ix+3)
		or	a
		ret	nz
		ld	a, (ix+6)
		cp	(ix+2)
		jr	nz, loc_7B5
		ld	a, (ix+8)
		or	a
		jr	nz, loc_7B5
		ld	b, 28h ; '('
		ld	a, (iy+0)
		add	a, 4
		ld	c, a
		call	YM1_ConditionalInput

loc_7B5:				; CODE XREF: sub_880-DEj sub_880-D8j
		ld	a, (ix+2)
		or	a
		jp	nz, loc_8E0
		ld	d, (ix+1)
		ld	e, (ix+0)

YM2_Parsing_Start:			; CODE XREF: sub_880-6Bj sub_880-5Fj ...
		xor	a
		ld	(ix+0Dh), a
		ld	a, (ix+9)
		ld	(ix+0Ah), a
		ld	a, (de)
		and	0F8h ; '�'
		cp	0F8h ; '�'
		jp	nz, loc_86A
		ld	a, (de)
		cp	0FFh
		jp	nz, YM2_Set_Instrument
		inc	de
		ld	a, (de)
		ld	l, a
		inc	de
		ld	a, (de)
		ld	h, a
		or	l
		jr	nz, YM2_Parse_At_New_Offset
		ld	a, 1
		ld	(ix+3),	a
		ld	a, 0FFh
		ld	(SFX_USELESS_BYTE_2), a
		ld	a, (CURRENTLY_MANAGING_SFX_TYPE_2)
		or	a
		jr	z, loc_810
		ld	bc, 0FF20h
		add	ix, bc
		ld	a, 0B4h	; '�'
		add	a, (iy+0)
		ld	b, a
		ld	c, (ix+1Eh)
		call	YM2_Input
		ld	a, (ix+3)
		or	a
		jr	nz, loc_810
		ld	a, (ix+4)
		jp	YM2_Load_Instrument
; ---------------------------------------------------------------------------

loc_810:				; CODE XREF: sub_880-8Fj sub_880-78j
		xor	a
		jp	YM2_Load_Instrument
; ---------------------------------------------------------------------------

YM2_Parse_At_New_Offset:		; CODE XREF: sub_880-9Fj
		ex	de, hl
		jr	YM2_Parsing_Start
; ---------------------------------------------------------------------------

YM2_Set_Instrument:			; CODE XREF: sub_880-A9j
		cp	0FEh ; '�'
		jr	nz, YM2_Load_Note
		inc	de
		ld	a, (de)
		call	YM2_SetChannelInstrument
		inc	de
		jp	YM2_Parsing_Start
; ---------------------------------------------------------------------------

YM2_Load_Note:				; CODE XREF: sub_880-67j
		cp	0FDh ; '�'
		jr	nz, YM2_Set_Slide_Or_Key_Release
		inc	de
		ld	a, (de)
		and	0Fh
		call	YM2_Load_Instrument
		inc	de
		jp	YM2_Parsing_Start
; ---------------------------------------------------------------------------

YM2_Set_Slide_Or_Key_Release:		; CODE XREF: sub_880-5Aj
		cp	0FCh ; '�'
		jr	nz, YM2_Load_Vibrato
		call	YM1_SetSlideOrKeyRelease
		jp	YM2_Parsing_Start
; ---------------------------------------------------------------------------

YM2_Load_Vibrato:			; CODE XREF: sub_880-4Bj
		cp	0FBh ; '�'
		jr	nz, YM2_Set_Stereo
		call	LoadVibrato
		jp	YM2_Parsing_Start
; ---------------------------------------------------------------------------

YM2_Set_Stereo:				; CODE XREF: sub_880-41j
		cp	0FAh ; '�'
		jr	nz, YM2_Load_Note_Shift
		call	YM2_SetStereo
		jp	YM2_Parsing_Start
; ---------------------------------------------------------------------------

YM2_Load_Note_Shift:			; CODE XREF: sub_880-37j
		cp	0F9h ; '�'
		jr	nz, YM2_Loop_Command
		call	LoadNoteShift
		jp	YM2_Parsing_Start
; ---------------------------------------------------------------------------

YM2_Loop_Command:			; CODE XREF: sub_880-2Dj
		cp	0F8h ; '�'
		jr	nz, YM2_Bad_Command
		call	ParseLoopCommand
		jp	YM2_Parsing_Start
; ---------------------------------------------------------------------------

YM2_Bad_Command:			; CODE XREF: sub_880-23j
		inc	de
		inc	de
		jp	YM2_Parsing_Start
; ---------------------------------------------------------------------------

loc_86A:				; CODE XREF: sub_880-AFj
		ld	a, (de)
		and	7Fh ; ''
		cp	70h ; 'p'
		jp	z, loc_8C4
		add	a, (ix+1Ch)
		ld	l, a
		ld	h, 0
		ld	bc,  t_YM_FREQUENCIES+1
		add	hl, hl
		add	hl, bc
		ld	a, (hl)
		dec	hl
		ld	l, (hl)
; END OF FUNCTION CHUNK	FOR sub_880

; =============== S U B	R O U T	I N E =======================================


sub_880:

; FUNCTION CHUNK AT 00000797 SIZE 000000E9 BYTES

		ld	h, a
		ld	b, 0
		ld	c, (ix+1Dh)
		add	hl, bc
		ld	a, (loc_750+1)
		ld	b, a
		ld	c, h
		ld	(ix+12h), c
		ld	a, (ix+1Fh)
		or	a
		jr	nz, loc_89C
		ld	(ix+0Fh), c
		xor	a
		ld	(ix+12h), a

loc_89C:				; CODE XREF: sub_880+13j
		call	YM2_ConditionalInput
		ld	a, (loc_759+1)
		ld	b, a
		ld	c, l
		ld	(ix+11h), c
		ld	a, (ix+1Fh)
		or	a
		jr	nz, loc_8B4
		ld	(ix+0Eh), c
		xor	a
		ld	(ix+11h), a

loc_8B4:				; CODE XREF: sub_880+2Bj
		call	YM2_ConditionalInput
		ld	b, 28h ; '('
		ld	a, (iy+0)
		add	a, 4
		or	0F0h ; '�'
		ld	c, a
		call	YM1_ConditionalInput

loc_8C4:				; CODE XREF: sub_880-11j
		ld	a, (de)
		bit	7, a
		jr	nz, loc_8CE
		ld	a, (ix+7)
		jr	loc_8D3
; ---------------------------------------------------------------------------

loc_8CE:				; CODE XREF: sub_880+47j
		inc	de
		ld	a, (de)
		ld	(ix+7),	a

loc_8D3:				; CODE XREF: sub_880+4Cj
		ld	(ix+2),	a
		inc	de
		ld	(ix+1),	d
		ld	(ix+0),	e
		jp	loc_797
; ---------------------------------------------------------------------------

loc_8E0:				; CODE XREF: sub_880-C7j
		dec	(ix+2)
		ld	b, (ix+12h)
		ld	c, (ix+11h)
		ld	a, b
		or	c
		jr	z, loc_964
		ld	a, (ix+0Fh)
		ld	h, a
		ld	a, (ix+0Eh)
		ld	l, a
		push	bc
		push	hl
		or	a
		sbc	hl, bc
		ld	a, h
		ld	(TEMP_FREQUENCY), a
		jr	nc, loc_908
		ld	b, 0
		ld	c, (ix+1Fh)
		jp	loc_910
; ---------------------------------------------------------------------------

loc_908:				; CODE XREF: sub_880+7Ej
		ld	b, 0FFh
		ld	a, (ix+1Fh)
		neg
		ld	c, a

loc_910:				; CODE XREF: sub_880+85j
		pop	hl
		add	hl, bc
		pop	bc
		push	hl
		or	a
		sbc	hl, bc
		ld	a, (TEMP_FREQUENCY)
		xor	h
		bit	7, a
		pop	hl
		jr	nz, loc_957
		push	hl
		ld	a, h
		and	7
		ld	h, a
		ld	(TEMP_FREQUENCY), hl
		ld	bc, 4D4h
		or	a
		sbc	hl, bc
		jr	c, loc_936
		ld	bc, 596h
		jp	loc_94A
; ---------------------------------------------------------------------------

loc_936:				; CODE XREF: sub_880+AEj
		ld	hl, (TEMP_FREQUENCY)
		ld	bc, 26Ah
		or	a
		sbc	hl, bc
		jr	nc, loc_947
		ld	bc, 0FA6Ah
		jp	loc_94A
; ---------------------------------------------------------------------------

loc_947:				; CODE XREF: sub_880+BFj
		ld	bc, 0

loc_94A:				; CODE XREF: sub_880+B3j sub_880+C4j
		pop	hl
		add	hl, bc
		ld	a, h
		ld	(ix+0Fh), a
		ld	a, l
		ld	(ix+0Eh), a
		jp	loc_964
; ---------------------------------------------------------------------------

loc_957:				; CODE XREF: sub_880+9Ej
		ld	(ix+0Fh), b
		ld	(ix+0Eh), c
		xor	a
		ld	(ix+11h), a
		ld	(ix+12h), a

loc_964:				; CODE XREF: sub_880+6Bj sub_880+D4j
		ld	a, (ix+0Ah)
		or	a
		jr	z, loc_970
		dec	(ix+0Ah)
		xor	a
		jr	loc_999
; ---------------------------------------------------------------------------

loc_970:				; CODE XREF: sub_880+E8j sub_880+116j
		ld	a, (ix+0Ch)
		ld	h, a
		ld	a, (ix+0Bh)
		ld	l, a
		ld	a, (ix+0Dh)
		ld	b, 0
		ld	c, a
		inc	(ix+0Dh)
		add	hl, bc
		ld	a, (hl)
		cp	81h ; '�'
		jr	nz, loc_98D
		dec	(ix+0Dh)
		xor	a
		jr	loc_999
; ---------------------------------------------------------------------------

loc_98D:				; CODE XREF: sub_880+105j
		cp	80h ; '�'
		jp	nz, loc_999
		xor	a
		ld	(ix+0Dh), a
		jp	loc_970
; ---------------------------------------------------------------------------

loc_999:				; CODE XREF: sub_880+EEj sub_880+10Bj	...
		ld	c, a
		ld	a, (ix+0Eh)
		ld	l, a
		ld	a, (ix+0Fh)
		ld	h, a
		ld	b, 0
		bit	7, c
		jr	z, loc_9A9
		dec	b

loc_9A9:				; CODE XREF: sub_880+126j
		add	hl, bc

loc_9AA:				; DATA XREF: ROM:00000794w
		ld	b, 0
		ld	c, h
		ld	(ix+0Fh), c
		call	YM2_ConditionalInput

loc_9B3:				; DATA XREF: ROM:0000078Ew
		ld	b, 0
		ld	c, l
		ld	(ix+0Eh), c
		call	YM2_ConditionalInput
		ld	a, (CURRENTLY_MANAGING_SFX_TYPE_2)
		or	a
		ret	nz
		ld	a, (FADE_OUT_TIMER)
		or	a
		ret	nz
		ld	a, (ix+4)
		jp	YM2_Load_Instrument
; End of function sub_880


; =============== S U B	R O U T	I N E =======================================


YM1_SetChannelInstrument:		; CODE XREF: ROM:000005C5p
		ld	(ix+10h), a
		ret
; End of function YM1_SetChannelInstrument


; =============== S U B	R O U T	I N E =======================================


YM1_LoadInstrument:			; CODE XREF: Update_YM_InstrumentsLevels+12p
					; Update_YM_InstrumentsLevels+1Fp ...
		call	LoadInstrumentsBank
		ld	(ix+4),	a
		ld	a, (FADE_OUT_COUNTER)
		add	a, 0Fh
		ld	h, a
		ld	a, (MUSIC_LEVEL)
		add	a, (ix+4)
		sub	h
		jr	nc, loc_9E6
		xor	a

loc_9E6:				; CODE XREF: YM1_LoadInstrument+13j
		push	de
		push	af
		ld	a, (ix+10h)
		ld	l, a
		ld	h, 0
		ld	d, h
		ld	e, l
		add	hl, hl
		add	hl, hl
		push	hl
		add	hl, de
		ld	d, h
		ld	e, l
		add	hl, hl
		add	hl, hl
		add	hl, de
		pop	de
		add	hl, de
		ld	de, 8000h
		add	hl, de
		push	hl
		ld	de, 1Ch
		add	hl, de
		ld	a, (hl)
		and	7
		ld	(ix+5),	a
		pop	hl
		ld	a, (iy+0)
		add	a, 30h ; '0'
		ld	b, 4

loc_A12:				; CODE XREF: YM1_LoadInstrument+4Ej
		push	bc
		ld	b, a
		ld	c, (hl)
		push	af
		call	YM1_Input
		pop	af
		inc	hl
		add	a, 4
		pop	bc
		djnz	loc_A12
		ld	(TEMP_REGISTER), a
		pop	af
		push	hl
		ld	d, 0
		ld	e, a
		ld	hl, t_YM_LEVELS
		ld	b, e
		add	hl, de
		ld	c, (hl)
		ld	e, (ix+5)
		ld	hl, t_SLOTS_PER_ALGO
		add	hl, de
		ld	d, (hl)
		ld	a, (TEMP_REGISTER)
		pop	hl
		ld	b, 4

loc_A3C:				; CODE XREF: YM1_LoadInstrument+8Aj
		push	bc
		ld	b, a
		push	af
		rr	d
		jr	nc, loc_A51
		ld	a, 7Fh ; ''
		sub	(hl)
		add	a, c
		ld	c, a
		cp	7Fh ; ''
		jr	c, loc_A4E
		ld	c, 7Fh ; ''

loc_A4E:				; CODE XREF: YM1_LoadInstrument+7Aj
		jp	loc_A52
; ---------------------------------------------------------------------------

loc_A51:				; CODE XREF: YM1_LoadInstrument+71j
		ld	c, (hl)

loc_A52:				; CODE XREF: YM1_LoadInstrument:loc_A4Ej
		call	YM1_Input
		pop	af
		inc	hl
		add	a, 4
		pop	bc
		djnz	loc_A3C
		ld	b, 14h

loc_A5E:				; CODE XREF: YM1_LoadInstrument+9Aj
		push	bc
		ld	b, a
		ld	c, (hl)
		push	af
		call	YM1_Input
		pop	af
		inc	hl
		add	a, 4
		pop	bc
		djnz	loc_A5E
		add	a, 10h
		ld	b, a
		ld	c, (hl)
		call	YM1_Input
		pop	de
		jp	LoadMusicBank
; End of function YM1_LoadInstrument


; =============== S U B	R O U T	I N E =======================================


YM2_SetChannelInstrument:		; CODE XREF: sub_880-63p
		ld	(ix+10h), a
		ret
; End of function YM2_SetChannelInstrument


; =============== S U B	R O U T	I N E =======================================


YM2_Load_Instrument:			; CODE XREF: Update_YM_InstrumentsLevels+3Fp
					; Update_YM_InstrumentsLevels+4Cp ...
		call	LoadInstrumentsBank
		ld	(ix+4),	a
		ld	a, (CURRENTLY_MANAGING_SFX_TYPE_2)
		or	a
		jr	z, loc_A8C
		ld	a, (ix+4)
		jr	loc_A9C
; ---------------------------------------------------------------------------

loc_A8C:				; CODE XREF: YM2_Load_Instrument+Aj
		ld	a, (FADE_OUT_COUNTER)
		add	a, 0Fh
		ld	h, a
		ld	a, (MUSIC_LEVEL)
		add	a, (ix+4)
		sub	h
		jr	nc, loc_A9C
		xor	a

loc_A9C:				; CODE XREF: YM2_Load_Instrument+Fj
					; YM2_Load_Instrument+1Ej
		push	de
		push	af
		ld	a, (ix+10h)
		ld	l, a
		ld	h, 0
		ld	d, h
		ld	e, l
		add	hl, hl
		add	hl, hl
		push	hl
		add	hl, de
		ld	d, h
		ld	e, l
		add	hl, hl
		add	hl, hl
		add	hl, de
		pop	de
		add	hl, de
		ld	de, 8000h
		add	hl, de
		push	hl
		ld	de, 1Ch
		add	hl, de
		ld	a, (hl)
		and	7
		ld	(ix+5),	a
		pop	hl
		ld	a, (iy+0)
		add	a, 30h ; '0'
		ld	b, 4

loc_AC8:				; CODE XREF: YM2_Load_Instrument+59j
		push	bc
		ld	b, a
		ld	c, (hl)
		push	af
		call	YM2_ConditionalInput
		pop	af
		inc	hl
		add	a, 4
		pop	bc
		djnz	loc_AC8
		ld	(TEMP_REGISTER), a
		pop	af
		push	hl
		ld	d, 0
		ld	e, a
		ld	hl, t_YM_LEVELS
		ld	b, e
		add	hl, de
		ld	c, (hl)
		ld	e, (ix+5)
		ld	hl, t_SLOTS_PER_ALGO
		add	hl, de
		ld	d, (hl)
		ld	a, (TEMP_REGISTER)
		pop	hl
		ld	b, 4

loc_AF2:				; CODE XREF: YM2_Load_Instrument+95j
		push	bc
		ld	b, a
		push	af
		rr	d
		jr	nc, loc_B07
		ld	a, 7Fh ; ''
		sub	(hl)
		add	a, c
		ld	c, a
		cp	7Fh ; ''
		jr	c, loc_B04
		ld	c, 7Fh ; ''

loc_B04:				; CODE XREF: YM2_Load_Instrument+85j
		jp	loc_B08
; ---------------------------------------------------------------------------

loc_B07:				; CODE XREF: YM2_Load_Instrument+7Cj
		ld	c, (hl)

loc_B08:				; CODE XREF: YM2_Load_Instrument:loc_B04j
		call	YM2_ConditionalInput
		pop	af
		inc	hl
		add	a, 4
		pop	bc
		djnz	loc_AF2
		ld	b, 14h

loc_B14:				; CODE XREF: YM2_Load_Instrument+A5j
		push	bc
		ld	b, a
		ld	c, (hl)
		push	af
		call	YM2_ConditionalInput
		pop	af
		inc	hl
		add	a, 4
		pop	bc
		djnz	loc_B14
		add	a, 10h
		ld	b, a
		ld	c, (hl)
		call	YM2_ConditionalInput
		pop	de
		jp	LoadMusicBank
; End of function YM2_Load_Instrument


; =============== S U B	R O U T	I N E =======================================


YM2_ParseChannel6Data:			; CODE XREF: UpdateSound+8Fp
					; UpdateSound+C0p
		ld	ix, YM_CHANNEL_DATA_6
		ld	a, (CURRENTLY_MANAGING_SFX_TYPE_2)
		or	a
		jr	z, loc_B3C
		ld	de, 0E0h ; '�'
		add	ix, de

loc_B3C:				; CODE XREF: YM2_ParseChannel6Data+8j
					; YM2_ParseChannel6Data+A1j
		ld	a, (ix+3)
		or	a
		ret	nz
		ld	a, (ix+6)
		cp	(ix+2)
		jr	nz, loc_B54
		ld	a, (ix+8)
		or	a
		jr	nz, loc_B54
		ld	a, 0FEh	; '�'
		call	DAC_SetNewSample

loc_B54:				; CODE XREF: YM2_ParseChannel6Data+1Aj
					; YM2_ParseChannel6Data+20j
		ld	a, (ix+2)
		or	a
		jp	nz, loc_BD1
		ld	d, (ix+1)
		ld	e, (ix+0)

DAC_Parsing_Start:			; CODE XREF: YM2_ParseChannel6Data+57j
					; YM2_ParseChannel6Data+60j ...
		ld	a, (de)
		and	0F8h ; '�'
		cp	0F8h ; '�'
		jp	nz, loc_BA9
		ld	a, (de)
		cp	0FFh
		jp	nz, DAC_Set_Key_Release
		inc	de
		ld	a, (de)
		ld	l, a
		inc	de
		ld	a, (de)
		ld	h, a
		or	l
		jr	nz, DAC_Parse_At_New_Offset
		ld	a, 1
		ld	(ix+3),	a
		ld	a, 0FFh
		ld	(SFX_USELESS_BYTE_2), a
		ret
; ---------------------------------------------------------------------------

DAC_Parse_At_New_Offset:		; CODE XREF: YM2_ParseChannel6Data+49j
		ex	de, hl
		jr	DAC_Parsing_Start
; ---------------------------------------------------------------------------

DAC_Set_Key_Release:			; CODE XREF: YM2_ParseChannel6Data+3Fj
		cp	0FCh ; '�'
		jr	nz, DAC_Set_Stereo
		call	SetRelease
		jp	DAC_Parsing_Start
; ---------------------------------------------------------------------------

DAC_Set_Stereo:				; CODE XREF: YM2_ParseChannel6Data+5Bj
		cp	0FAh ; '�'
		jr	nz, DAC_Loop_Command
		call	YM2_SetStereo
		jp	DAC_Parsing_Start
; ---------------------------------------------------------------------------

DAC_Loop_Command:			; CODE XREF: YM2_ParseChannel6Data+65j
		cp	0F8h ; '�'
		jr	nz, DAC_Bad_Command
		call	ParseLoopCommand
		jp	DAC_Parsing_Start
; ---------------------------------------------------------------------------

DAC_Bad_Command:			; CODE XREF: YM2_ParseChannel6Data+6Fj
		inc	de
		inc	de
		jp	DAC_Parsing_Start
; ---------------------------------------------------------------------------

loc_BA9:				; CODE XREF: YM2_ParseChannel6Data+39j
		ld	a, (de)
		and	7Fh ; ''
		cp	70h ; 'p'
		jp	z, loc_BB5
		inc	a
		call	DAC_SetNewSample

loc_BB5:				; CODE XREF: YM2_ParseChannel6Data+81j
		ld	a, (de)
		bit	7, a
		jr	nz, loc_BBF
		ld	a, (ix+7)
		jr	loc_BC4
; ---------------------------------------------------------------------------

loc_BBF:				; CODE XREF: YM2_ParseChannel6Data+8Bj
		inc	de
		ld	a, (de)
		ld	(ix+7),	a

loc_BC4:				; CODE XREF: YM2_ParseChannel6Data+90j
		ld	(ix+2),	a
		inc	de
		ld	(ix+1),	d
		ld	(ix+0),	e
		jp	loc_B3C
; ---------------------------------------------------------------------------

loc_BD1:				; CODE XREF: YM2_ParseChannel6Data+2Bj
		dec	(ix+2)
		ld	a, (FADE_OUT_TIMER)
		or	a
		ret	nz
		ret
; End of function YM2_ParseChannel6Data


; =============== S U B	R O U T	I N E =======================================


PSG_ParseToneData:			; CODE XREF: UpdateSound+96p
					; UpdateSound+9Cp ...

; FUNCTION CHUNK AT 00000512 SIZE 0000000D BYTES

		ld	a, (iy+0)
		ld	ix, PSG_CHANNEL_DATA_TONE_1
		ld	h, 0
		ld	l, a
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		add	hl, hl
		ex	de, hl
		add	ix, de
		rrca
		rrca
		rrca
		and	60h ; '`'
		ld	(CURRENT_PSG_CHANNEL), a

loc_BF4:				; CODE XREF: PSG_ParseToneData+106j
		ld	a, (ix+3)
		or	a
		ret	nz
		ld	a, (ix+2)
		or	a
		jp	nz, loc_CE3
		ld	d, (ix+1)
		ld	e, (ix+0)

PSG_Parsing_Start:			; CODE XREF: PSG_ParseToneData+53j
					; PSG_ParseToneData+5Cj ...
		ld	a, (de)
		and	0F8h ; '�'
		cp	0F8h ; '�'
		jp	nz, loc_C76
		ld	a, (de)
		cp	0FFh
		jp	nz, PSG_Load_Instrument
		inc	de
		ld	a, (de)
		ld	l, a
		inc	de
		ld	a, (de)
		ld	h, a
		or	l
		jr	nz, PSG_Parse_At_New_Offset
		ld	a, 1
		ld	(ix+3),	a
		ld	a, 0FFh
		ld	(SFX_USELESS_BYTE_2), a
		ld	a, 0Fh
		jp	PSG_SetChannelAttenuation
; ---------------------------------------------------------------------------

PSG_Parse_At_New_Offset:		; CODE XREF: PSG_ParseToneData+41j
		ex	de, hl
		jr	PSG_Parsing_Start
; ---------------------------------------------------------------------------

PSG_Load_Instrument:			; CODE XREF: PSG_ParseToneData+37j
		cp	0FDh ; '�'
		jr	nz, PSG_Set_Key_Release
		call	PSG_LoadInstrument
		jp	PSG_Parsing_Start
; ---------------------------------------------------------------------------

PSG_Set_Key_Release:			; CODE XREF: PSG_ParseToneData+57j
		cp	0FCh ; '�'
		jr	nz, PSG_Load_Vibrato
		call	SetRelease
		jp	PSG_Parsing_Start
; ---------------------------------------------------------------------------

PSG_Load_Vibrato:			; CODE XREF: PSG_ParseToneData+61j
		cp	0FBh ; '�'
		jr	nz, PSG_Set_Timer
		call	LoadVibrato
		jp	PSG_Parsing_Start
; ---------------------------------------------------------------------------

PSG_Set_Timer:				; CODE XREF: PSG_ParseToneData+6Bj
		cp	0FAh ; '�'
		jr	nz, PSG_Load_Note_Shift
		inc	de
		ld	b, 26h ; '&'
		ld	a, (de)
		ld	c, a
		inc	de
		call	YM1_Input
		jp	PSG_Parsing_Start
; ---------------------------------------------------------------------------

PSG_Load_Note_Shift:			; CODE XREF: PSG_ParseToneData+75j
		cp	0F9h ; '�'
		jr	nz, PSG_Loop_Command
		call	LoadNoteShift
		jp	PSG_Parsing_Start
; ---------------------------------------------------------------------------

PSG_Loop_Command:			; CODE XREF: PSG_ParseToneData+85j
		cp	0F8h ; '�'
		jr	nz, PSG_Bad_Command
		call	ParseLoopCommand
		jp	PSG_Parsing_Start
; ---------------------------------------------------------------------------

PSG_Bad_Command:			; CODE XREF: PSG_ParseToneData+8Fj
		inc	de
		inc	de
		jp	PSG_Parsing_Start
; ---------------------------------------------------------------------------

loc_C76:				; CODE XREF: PSG_ParseToneData+31j
		ld	a, (de)
		and	7Fh ; ''
		cp	70h ; 'p'
		jp	z, loc_CBF
		push	af
		ld	a, (ix+1Eh)
		or	a
		jr	z, Set_New_Note
		xor	a
		ld	(ix+12h), a
		ld	(ix+1Eh), a
		ld	a, (ix+9)
		ld	(ix+0Ah), a

Set_New_Note:				; CODE XREF: PSG_ParseToneData+A9j
		xor	a
		ld	(ix+0Dh), a
		pop	af
		add	a, (ix+1Ch)
		sub	15h
		ld	l, a
		ld	h, 0
		ld	bc, t_PSG_FREQUENCIES
		add	hl, hl
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	l, a
		ld	b, 0
		ld	c, (ix+1Dh)
		srl	c
		add	hl, bc
		ld	c, l
		ld	(ix+0Eh), c
		ld	c, h
		ld	(ix+0Fh), c
		ld	a, (ix+8)
		and	80h ; '�'
		jr	loc_CC4
; ---------------------------------------------------------------------------

loc_CBF:				; CODE XREF: PSG_ParseToneData+A1j
		ld	a, (ix+8)
		or	1

loc_CC4:				; CODE XREF: PSG_ParseToneData+E3j
		ld	(ix+8),	a
		ld	a, (de)
		bit	7, a
		jr	nz, loc_CD1
		ld	a, (ix+7)
		jr	loc_CD6
; ---------------------------------------------------------------------------

loc_CD1:				; CODE XREF: PSG_ParseToneData+F0j
		inc	de
		ld	a, (de)
		ld	(ix+7),	a

loc_CD6:				; CODE XREF: PSG_ParseToneData+F5j
		ld	(ix+2),	a
		inc	de
		ld	(ix+1),	d
		ld	(ix+0),	e
		jp	loc_BF4
; ---------------------------------------------------------------------------

loc_CE3:				; CODE XREF: PSG_ParseToneData+23j
		dec	(ix+2)
		ld	a, (ix+0Ah)
		or	a
		jr	z, Apply_Vibrato
		dec	(ix+0Ah)
		xor	a
		jr	loc_D1A
; ---------------------------------------------------------------------------

Apply_Vibrato:				; CODE XREF: PSG_ParseToneData+110j
					; PSG_ParseToneData+13Dj
		ld	a, (ix+0Ch)
		ld	h, a
		ld	a, (ix+0Bh)
		ld	l, a
		ld	a, (ix+0Dh)
		ld	b, 0
		ld	c, a
		inc	(ix+0Dh)
		add	hl, bc
		ld	a, (hl)
		cp	81h ; '�'
		jr	nz, loc_D0E
		dec	(ix+0Dh)
		jr	loc_D35
; ---------------------------------------------------------------------------

loc_D0E:				; CODE XREF: PSG_ParseToneData+12Dj
		cp	80h ; '�'
		jp	nz, loc_D1A
		xor	a
		ld	(ix+0Dh), a
		jp	Apply_Vibrato
; ---------------------------------------------------------------------------

loc_D1A:				; CODE XREF: PSG_ParseToneData+116j
					; PSG_ParseToneData+136j
		neg
		ld	c, a
		ld	a, (ix+0Eh)
		ld	l, a
		ld	a, (ix+0Fh)
		ld	h, a
		ld	b, 0
		bit	7, c
		jr	z, loc_D2C
		dec	b

loc_D2C:				; CODE XREF: PSG_ParseToneData+14Fj
		add	hl, bc
		ld	a, h
		ld	(ix+0Fh), a
		ld	a, l
		ld	(ix+0Eh), a

loc_D35:				; CODE XREF: PSG_ParseToneData+132j
		call	PSG_GetInstrumentPointer
		ld	b, (hl)
		bit	7, b
		jr	nz, loc_D41
		inc	a
		ld	(ix+12h), a

loc_D41:				; CODE XREF: PSG_ParseToneData+161j
		res	7, b
		ld	a, 0Fh
		sub	b
		ld	b, a
		ld	a, (ix+4)
		sub	b
		jr	nc, loc_D4E
		xor	a

loc_D4E:				; CODE XREF: PSG_ParseToneData+171j
		ld	b, a
		ld	a, (iy+0)
		cp	2
		jr	nz, loc_D5A
		ld	a, 0Fh
		jr	loc_D5D
; ---------------------------------------------------------------------------

loc_D5A:				; CODE XREF: PSG_ParseToneData+17Aj
		ld	a, (MUSIC_LEVEL)

loc_D5D:				; CODE XREF: PSG_ParseToneData+17Ej
		add	a, b
		sub	0Fh
		jr	nc, loc_D63
		xor	a

loc_D63:				; CODE XREF: PSG_ParseToneData+186j
		ld	(ix+5),	a
		ld	b, (ix+8)
		ld	a, (ix+2)
		or	a
		jr	z, PSG_Release_Key
		bit	7, b
		jr	nz, loc_D96
		cp	(ix+6)
		jr	nz, loc_D96

PSG_Release_Key:			; CODE XREF: PSG_ParseToneData+193j
		ld	a, b
		or	a
		jr	nz, loc_D96
		ld	c, 1
		ld	(ix+1Eh), c
		or	2
		ld	(ix+8),	a

loc_D86:				; CODE XREF: PSG_ParseToneData+1B7j
		call	PSG_GetInstrumentPointer
		ld	a, (hl)
		and	80h ; '�'
		jr	nz, loc_D93
		inc	(ix+12h)
		jr	loc_D86
; ---------------------------------------------------------------------------

loc_D93:				; CODE XREF: PSG_ParseToneData+1B2j
		inc	(ix+12h)

loc_D96:				; CODE XREF: PSG_ParseToneData+197j
					; PSG_ParseToneData+19Cj ...
		ld	a, (FADE_OUT_TIMER)
		or	a
		jr	nz, Transmit_Data
		ld	a, (iy+0)
		cp	2
		jr	z, Transmit_Data
		ld	a, (ix+4)
		or	a
		jr	z, Transmit_Data
		dec	a
		ld	(ix+4),	a

Transmit_Data:				; CODE XREF: PSG_ParseToneData+1C0j
					; PSG_ParseToneData+1C7j ...
		ld	a, (ix+0Fh)
		ld	b, a
		ld	a, (ix+0Eh)
		ld	c, a
		and	0Fh
		ld	h, a
		ld	a, (CURRENT_PSG_CHANNEL)
		or	h
		or	80h ; '�'
		ld	(SN76489_PSG), a
		ld	a, c
		srl	b
		rra
		srl	b
		rra
		rra
		rra
		and	3Fh ; '?'
		ld	(SN76489_PSG), a
		ld	a, 0Fh
		sub	(ix+5)
		ld	h, a
		ld	a, (CURRENT_PSG_CHANNEL)
		or	h
		or	90h ; '�'
		ld	(SN76489_PSG), a
		ret
; End of function PSG_ParseToneData


; =============== S U B	R O U T	I N E =======================================


PSG_GetInstrumentPointer:		; CODE XREF: PSG_ParseToneData:loc_D35p
					; PSG_ParseToneData:loc_D86p ...
		ld	a, (ix+11h)
		ld	h, a
		ld	a, (ix+10h)
		ld	l, a
		ld	b, 0
		ld	a, (ix+12h)
		ld	c, a
		add	hl, bc
		ret
; End of function PSG_GetInstrumentPointer


; =============== S U B	R O U T	I N E =======================================


PSG_LoadInstrument:			; CODE XREF: PSG_ParseToneData+59p
					; PSG_ParseNoiseData+4Cp
		inc	de
		ld	a, (de)
		ld	c, a
		and	0Fh
		ld	b, a
		ld	a, (iy+0)
		cp	2
		jr	z, loc_E02
		ld	a, (CURRENTLY_FADING_OUT)
		or	a
		jr	nz, loc_E05

loc_E02:				; CODE XREF: PSG_LoadInstrument+Bj
		ld	(ix+4),	b

loc_E05:				; CODE XREF: PSG_LoadInstrument+11j
		ld	a, c
		rra
		rra
		rra
		rra
		and	0Fh
		inc	de
		ld	h, 0
		ld	l, a
		add	hl, hl
		ld	bc, pt_PSG_INSTRUMENTS
		add	hl, bc
		ld	c, (hl)
		inc	hl
		ld	b, (hl)
		ld	(ix+10h), c
		ld	(ix+11h), b
		ret
; End of function PSG_LoadInstrument


; =============== S U B	R O U T	I N E =======================================


PSG_ParseNoiseData:			; CODE XREF: UpdateSound+A8p
		ld	a, (iy+0)
		ld	ix, PSG_CHANNEL_DATA_NOISE
		ld	a, 60h ; '`'
		ld	(CURRENT_PSG_CHANNEL), a

loc_E2B:				; CODE XREF: PSG_ParseNoiseData+B1j
		ld	a, (ix+3)
		or	a
		ret	nz
		ld	a, (ix+2)
		or	a
		jp	nz, loc_ED3
		ld	d, (ix+1)
		ld	e, (ix+0)

PSGN_Parsing_Start:			; CODE XREF: PSG_ParseNoiseData+45j
					; PSG_ParseNoiseData+4Fj ...
		ld	a, (de)
		and	0F8h ; '�'
		cp	0F8h ; '�'
		jp	nz, loc_E8A
		ld	a, (de)
		cp	0FFh
		jp	nz, PSGN_Load_Instrument
		inc	de
		ld	a, (de)
		ld	l, a
		inc	de
		ld	a, (de)
		ld	h, a
		or	l
		jr	nz, loc_E63
		ld	a, 1
		ld	(ix+3),	a
		ld	a, 0FFh
		ld	(SFX_USELESS_BYTE_2), a
		ld	a, 0Fh
		jp	PSG_SetChannelAttenuation
; ---------------------------------------------------------------------------

loc_E63:				; CODE XREF: PSG_ParseNoiseData+33j
		ex	de, hl
		jp	PSGN_Parsing_Start
; ---------------------------------------------------------------------------

PSGN_Load_Instrument:			; CODE XREF: PSG_ParseNoiseData+29j
		cp	0FDh ; '�'
		jr	nz, PSGN_Set_Key_Release
		call	PSG_LoadInstrument
		jp	PSGN_Parsing_Start
; ---------------------------------------------------------------------------

PSGN_Set_Key_Release:			; CODE XREF: PSG_ParseNoiseData+4Aj
		cp	0FCh ; '�'
		jr	nz, PSGN_Loop_Command
		call	SetRelease
		jp	PSGN_Parsing_Start
; ---------------------------------------------------------------------------

PSGN_Loop_Command:			; CODE XREF: PSG_ParseNoiseData+54j
		cp	0F8h ; '�'
		jr	nz, PSGN_Bad_Command
		call	ParseLoopCommand
		jp	PSGN_Parsing_Start
; ---------------------------------------------------------------------------

PSGN_Bad_Command:			; CODE XREF: PSG_ParseNoiseData+5Ej
		inc	de
		inc	de
		jp	PSGN_Parsing_Start
; ---------------------------------------------------------------------------

loc_E8A:				; CODE XREF: PSG_ParseNoiseData+23j
		ld	a, (de)
		and	7Fh ; ''
		cp	70h ; 'p'
		jp	z, loc_EAF
		push	af
		ld	a, (ix+1Eh)
		or	a
		jr	z, loc_EA0
		xor	a
		ld	(ix+12h), a
		ld	(ix+1Eh), a

loc_EA0:				; CODE XREF: PSG_ParseNoiseData+78j
		pop	af
		and	7
		or	0E0h ; '�'
		ld	(SN76489_PSG), a
		ld	a, (ix+8)
		and	80h ; '�'
		jr	loc_EB4
; ---------------------------------------------------------------------------

loc_EAF:				; CODE XREF: PSG_ParseNoiseData+70j
		ld	a, (ix+8)
		or	1

loc_EB4:				; CODE XREF: PSG_ParseNoiseData+8Ej
		ld	(ix+8),	a
		ld	a, (de)
		bit	7, a
		jr	nz, loc_EC1
		ld	a, (ix+7)
		jr	loc_EC6
; ---------------------------------------------------------------------------

loc_EC1:				; CODE XREF: PSG_ParseNoiseData+9Bj
		inc	de
		ld	a, (de)
		ld	(ix+7),	a

loc_EC6:				; CODE XREF: PSG_ParseNoiseData+A0j
		ld	(ix+2),	a
		inc	de
		ld	(ix+1),	d
		ld	(ix+0),	e
		jp	loc_E2B
; ---------------------------------------------------------------------------

loc_ED3:				; CODE XREF: PSG_ParseNoiseData+15j
		dec	(ix+2)
		call	PSG_GetInstrumentPointer
		ld	b, (hl)
		bit	7, b
		jr	nz, loc_EE2
		inc	a
		ld	(ix+12h), a

loc_EE2:				; CODE XREF: PSG_ParseNoiseData+BDj
		res	7, b
		ld	a, 0Fh
		sub	b
		ld	b, a
		ld	a, (ix+4)
		sub	b
		jr	nc, loc_EEF
		xor	a

loc_EEF:				; CODE XREF: PSG_ParseNoiseData+CDj
		ld	b, a
		ld	a, (MUSIC_LEVEL)
		add	a, b
		sub	0Fh
		jr	nc, loc_EF9
		xor	a

loc_EF9:				; CODE XREF: PSG_ParseNoiseData+D7j
		ld	(ix+5),	a
		ld	b, (ix+8)
		ld	a, (ix+2)
		or	a
		jr	z, Release_Key
		bit	7, b
		jr	nz, loc_F2C
		cp	(ix+6)
		jr	nz, loc_F2C

Release_Key:				; CODE XREF: PSG_ParseNoiseData+E4j
		ld	a, b
		or	a
		jr	nz, loc_F2C
		ld	c, 1

loc_F14:
		ld	(ix+1Eh), c
		or	2
		ld	(ix+8),	a

loc_F1C:				; CODE XREF: PSG_ParseNoiseData+108j
		call	PSG_GetInstrumentPointer
		ld	a, (hl)
		and	80h ; '�'
		jr	nz, loc_F29
		inc	(ix+12h)
		jr	loc_F1C
; ---------------------------------------------------------------------------

loc_F29:				; CODE XREF: PSG_ParseNoiseData+103j
		inc	(ix+12h)

loc_F2C:				; CODE XREF: PSG_ParseNoiseData+E8j
					; PSG_ParseNoiseData+EDj ...
		ld	a, (FADE_OUT_TIMER)
		or	a
		jr	nz, Transmit_Attenuation
		ld	a, (ix+4)
		or	a
		jr	z, Transmit_Attenuation
		dec	a
		ld	(ix+4),	a

Transmit_Attenuation:			; CODE XREF: PSG_ParseNoiseData+111j
					; PSG_ParseNoiseData+117j
		ld	a, 0Fh
		sub	(ix+5)
		or	0F0h ; '�'
		ld	(SN76489_PSG), a
		ret
; End of function PSG_ParseNoiseData


; =============== S U B	R O U T	I N E =======================================


YM1_SetSlideOrKeyRelease:		; CODE XREF: ROM:000005DFp sub_880-49p
		inc	de
		ld	a, (de)
		cp	0FFh
		jr	nz, loc_F53
		xor	a
		ld	(ix+1Fh), a
		inc	de
		ret
; ---------------------------------------------------------------------------

loc_F53:				; CODE XREF: YM1_SetSlideOrKeyRelease+4j
		cp	81h ; '�'
		jr	c, loc_F60
		and	7Fh ; ''
		ld	(ix+1Fh), a
		inc	de
		ret
; End of function YM1_SetSlideOrKeyRelease


; =============== S U B	R O U T	I N E =======================================


SetRelease:				; CODE XREF: YM2_ParseChannel6Data+5Dp
					; PSG_ParseToneData+63p ...
		inc	de
		ld	a, (de)

loc_F60:				; CODE XREF: YM1_SetSlideOrKeyRelease+Ej
		ld	c, a
		and	80h ; '�'
		ld	(ix+8),	a
		ld	a, c
		and	7Fh ; ''
		ld	(ix+6),	a
		inc	de
		ret
; End of function SetRelease


; =============== S U B	R O U T	I N E =======================================


LoadVibrato:				; CODE XREF: ROM:000005E9p sub_880-3Fp ...
		inc	de
		ld	a, (de)
		push	af
		rra
		rra
		rra
		and	1Eh
		ld	hl, pt_PITCH_EFFECTS
		ld	b, 0
		ld	c, a
		add	hl, bc
		ld	a, (hl)
		inc	hl
		ld	h, (hl)
		ld	(ix+0Bh), a
		ld	a, h
		ld	(ix+0Ch), a
		pop	af
		rla
		and	1Eh
		jr	z, loc_F8E
		dec	a

loc_F8E:				; CODE XREF: LoadVibrato+1Dj
		ld	(ix+9),	a
		inc	de
		ret
; End of function LoadVibrato


; =============== S U B	R O U T	I N E =======================================


YM1_SetStereo:				; CODE XREF: ROM:000005F3p

; FUNCTION CHUNK AT 00000FBA SIZE 00000009 BYTES

		inc	de
		ld	a, (de)
		bit	0, a
		jr	nz, loc_FBA
		and	0C0h ; '�'
		ld	c, a
		ld	b, 0B4h	; '�'
		ld	a, (iy+0)
		add	a, b
		ld	b, a
		inc	de
		jp	YM1_Input
; End of function YM1_SetStereo


; =============== S U B	R O U T	I N E =======================================


YM2_SetStereo:				; CODE XREF: sub_880-35p
					; YM2_ParseChannel6Data+67p
		inc	de
		ld	a, (de)
		and	0C0h ; '�'
		ld	(ix+1Eh), a
		ld	c, a
		ld	b, 0B4h	; '�'
		ld	a, (iy+0)
		add	a, b
		ld	b, a
		inc	de
		jp	YM2_ConditionalInput
; End of function YM2_SetStereo

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR YM1_SetStereo

loc_FBA:				; CODE XREF: YM1_SetStereo+4j
		ld	a, (USELESS_BYTE)
		inc	a
		ld	(USELESS_BYTE),	a
		inc	de
		ret
; END OF FUNCTION CHUNK	FOR YM1_SetStereo

; =============== S U B	R O U T	I N E =======================================


LoadNoteShift:				; CODE XREF: ROM:000005FDp sub_880-2Bp ...
		inc	de
		ld	a, (de)
		and	8Fh ; '�'
		bit	7, a
		jr	z, loc_FCD
		or	0F0h ; '�'

loc_FCD:				; CODE XREF: LoadNoteShift+6j
		ld	(ix+1Ch), a
		ld	a, (de)
		rrca
		rrca
		rrca
		and	0Eh
		ld	(ix+1Dh), a
		inc	de
		ret
; End of function LoadNoteShift


; =============== S U B	R O U T	I N E =======================================


ParseLoopCommand:			; CODE XREF: ROM:00000607p sub_880-21p ...
		inc	de
		ld	a, (de)
		ld	b, a
		inc	de
		rlca
		rlca
		rlca
		and	7
		jr	nz, _LoopCmd20
		ld	(ix+13h), e
		ld	(ix+14h), d
		ret
; ---------------------------------------------------------------------------

_LoopCmd20:				; CODE XREF: ParseLoopCommand+9j
		cp	1
		jr	nz, _LoopCmd40
		ld	(ix+15h), e
		ld	(ix+16h), d
		xor	a
		ld	(ix+1Ah), a
		ld	(ix+1Bh), a
		ret
; ---------------------------------------------------------------------------

_LoopCmd40:				; CODE XREF: ParseLoopCommand+14j
		cp	2
		jr	nz, _LoopCmd60
		ld	a, (ix+1Ah)
		or	a
		jr	nz, loc_100F
		ld	a, 1
		ld	(ix+1Ah), a
		ret
; ---------------------------------------------------------------------------

loc_100F:				; CODE XREF: ParseLoopCommand+2Cj
					; ParseLoopCommand+45j	...
		ld	a, (de)
		ld	b, a
		inc	de
		ld	a, (de)
		ld	c, a
		inc	de
		ld	a, b
		cp	0FFh
		jr	z, loc_102A
		cp	0F8h ; '�'
		jr	z, loc_1025
		and	80h ; '�'
		jr	nz, loc_100F
		dec	de
		jr	loc_100F
; ---------------------------------------------------------------------------

loc_1025:				; CODE XREF: ParseLoopCommand+41j
		ld	a, c
		cp	60h ; '`'
		jr	nz, loc_100F

loc_102A:				; CODE XREF: ParseLoopCommand+3Dj
					; ParseLoopCommand+6Bj	...
		dec	de
		dec	de
		ret
; ---------------------------------------------------------------------------

_LoopCmd60:				; CODE XREF: ParseLoopCommand+26j
		cp	3
		jr	nz, _LoopCmd80
		ld	a, (ix+1Bh)
		or	a
		jr	nz, loc_103D
		ld	a, 1
		ld	(ix+1Bh), a
		ret
; ---------------------------------------------------------------------------

loc_103D:				; CODE XREF: ParseLoopCommand+5Aj
					; ParseLoopCommand+73j	...
		ld	a, (de)
		ld	b, a
		inc	de
		ld	a, (de)
		ld	c, a
		inc	de
		ld	a, b
		cp	0FFh
		jr	z, loc_102A
		cp	0F8h ; '�'
		jr	z, loc_1053
		and	80h ; '�'
		jr	nz, loc_103D
		dec	de
		jr	loc_103D
; ---------------------------------------------------------------------------

loc_1053:				; CODE XREF: ParseLoopCommand+6Fj
		ld	a, c
		cp	80h ; '�'
		jr	nz, loc_103D
		jr	loc_102A
; ---------------------------------------------------------------------------

_LoopCmd80:				; CODE XREF: ParseLoopCommand+54j
		cp	4
		jr	nz, _LoopCmdA0
		ret
; ---------------------------------------------------------------------------

_LoopCmdA0:				; CODE XREF: ParseLoopCommand+81j
		cp	5
		jr	nz, _LoopCmdC0
		bit	0, b
		jr	nz, loc_106E
		ld	e, (ix+15h)
		ld	d, (ix+16h)
		ret
; ---------------------------------------------------------------------------

loc_106E:				; CODE XREF: ParseLoopCommand+8Aj
		ld	e, (ix+13h)
		ld	d, (ix+14h)
		ret
; ---------------------------------------------------------------------------

_LoopCmdC0:				; CODE XREF: ParseLoopCommand+86j
		cp	6
		jr	nz, _LoopCmdE0
		ld	(ix+17h), e
		ld	(ix+18h), d
		ld	a, b
		and	1Fh
		inc	a
		ld	(ix+19h), a
		ret
; ---------------------------------------------------------------------------

_LoopCmdE0:				; CODE XREF: ParseLoopCommand+9Cj
		dec	(ix+19h)
		ret	z
		ld	e, (ix+17h)
		ld	d, (ix+18h)
		ret
; End of function ParseLoopCommand


; =============== S U B	R O U T	I N E =======================================


FadeOut:				; CODE XREF: Main+12j UpdateSound+31p
		ld	a, 12h
		ld	(FADE_OUT_LENGTH), a
		ld	a, 1
		ld	(CURRENTLY_FADING_OUT),	a
		ld	a, (FADE_OUT_LENGTH)
		ld	(FADE_OUT_TIMER), a
		ret
; End of function FadeOut
