; Cold start: mask interrupts, set up the stack, initialise the volume, timer
; and fade defaults, prime the chips via one Main pass, then run Main_Loop.
init:
		di
		ld	sp, STACK_START
		xor	a
		ld	(SFX_TYPE2_PRIORITY_CUR), a
		dec	a
		ld	(SFX_TYPE2_PRIORITY_NEW), a
		ld	a, 0Fh
		ld	(MUSIC_LEVEL), a
		ld	a, 0FFh
		ld	(YM_TIMER_VALUE), a
		ld	a, 0Fh
		ld	(FADE_IN_PARAMETERS), a
		ld	a, 20h
		call	Main
		call	LoadBank

; Idle loop. Each pass services a pending command (Main) and a pending DAC
; sample (LoadDacSound); while a sample plays it streams one PCM byte to the
; YM2612 DAC, paced by the per-sample delay in the Dac_Loop counter.
Main_Loop:
		ld	a, (YM2612_A0)
		and	2
		jr	z, Dac_Loop
		call	UpdateSound
		jp	Main_CheckOps
; ---------------------------------------------------------------------------

Dac_Loop:
		ld	b, 5

Dac_SendDelay:
		djnz	$

Main_CheckOps:
		ld	a, (NEW_OPERATION)
		or	a
		call	nz, Main
		ld	a, (NEW_SAMPLE_TO_LOAD)
		or	a
		call	nz, LoadDacSound
		ld	a, d
		or	e
		jr	z, Main_Loop
		ld	b, 2Ah
		ld	c, (hl)
		inc	hl

Dac_WaitYMBusy:
		ld	a, (YM2612_A0)
		and	80h
		jr	nz, Dac_WaitYMBusy
		ld	a, b
		ld	(YM2612_A0), a
		ld	a, c
		ld	(YM2612_D0), a
		dec	de
		jp	Main_Loop

; ---------------------------------------------------------------------------

; Command FFh: key-off and zero every FM operator and silence all four PSG
; channels, then spin until the next command arrives.
Mute_Sound:
		push	hl
		push	de
		xor	a
		ld	(CURRENTLY_MANAGING_SFX_TYPE_2), a
		ld	(CALL_YM2_INSTEAD_OF_YM1), a
		ld	bc, 407Fh
		ld	d, 4

Mute_YM1_Loop:
		call	YM_Input
		inc	b
		call	YM_Input
		inc	b
		call	YM_Input
		inc	b
		inc	b
		dec	d
		jr	nz, Mute_YM1_Loop
		ld	a, 1
		ld	(CALL_YM2_INSTEAD_OF_YM1), a
		ld	bc, 407Fh
		ld	d, 4

Mute_YM2_Loop:
		call	YM2_Input
		inc	b
		call	YM2_Input
		inc	b
		call	YM2_Input
		inc	b
		inc	b
		dec	d
		jr	nz, Mute_YM2_Loop
		ld	hl, SN76489_PSG
		ld	a, 9Fh
		ld	(hl), a
		ld	a, 0BFh
		ld	(hl), a
		ld	a, 0DFh
		ld	(hl), a
		ld	a, 0FFh
		ld	(hl), a

Mute_WaitForOp:
		ld	a, (NEW_OPERATION)
		or	a
		jr	z, Mute_WaitForOp
		cp	0FFh
		jr	nz, Update_YM_Instruments
		xor	a
		ld	(NEW_OPERATION), a

Update_YM_Instruments:
		call	Update_YM_InstrumentsLevels
		pop	de
		pop	hl
		pop	af
		jp	Main_Loop

; Re-sends each FM channel's instrument at the current volume, so a level
; change takes effect on the notes already sounding.
Update_YM_InstrumentsLevels:
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

Update_Levels_YM2:
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
		jr	nz, Update_Levels_Sfx2Ch2
		ld	a, (ix+4)
		call	YM2_Load_Instrument

Update_Levels_Sfx2Ch2:
		inc	(iy+0)
		ld	ix, SFX_TYPE_2_CHANNEL_DATA_2
		ld	a, (ix+3)
		or	a
		jr	nz, Update_Levels_Ret
		ld	a, (ix+4)
		call	YM2_Load_Instrument

Update_Levels_Ret:
		ret

; ---------------------------------------------------------------------------

; Command F0h: clamp MUSIC_LEVEL to 0-0Fh, then re-apply it to the FM channels.
Update_YM_Level:
		push	hl
		push	de
		ld	hl, MUSIC_LEVEL
		ld	a, (hl)
		and	0Fh
		ld	(hl), a
		jp	Update_YM_Instruments

; Pages the ROM bank in BANK_TO_LOAD into the Z80's banked window (DAC PCM).
LoadBank:
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

; Pages the bank in MUSIC_BANK_TO_LOAD into the banked window (song data).
LoadMusicBank:
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

; Pages the fixed instrument-data bank (1F8000h) into the banked window.
LoadInstrumentsBank:
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

; Sets up DAC playback for NEW_SAMPLE_TO_LOAD: looks the sample up in
; t_SAMPLE_LOAD_DATA, patches its playback rate, and returns hl = PCM start,
; de = length. Id FEh selects silence.
LoadDacSound:
		cp	0FEh
		jr	nz, LoadDacSound_FromTable
		ld	hl, 0C000h
		ld	de, 0
		ret
; ---------------------------------------------------------------------------

LoadDacSound_FromTable:
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

; Command dispatcher. Reads NEW_OPERATION and branches: FFh mute, FEh stop,
; FDh fade out, F0h set level, >=41h play SFX, else start that music track.
Main:

		push	af
		xor	a
		ld	(NEW_OPERATION), a
		pop	af
		cp	0FFh
		jp	z, Mute_Sound
		cp	0FEh
		jp	z, StopMusic
		cp	0FDh
		jp	z, FadeOut
		cp	0F0h
		jp	z, Update_YM_Level
		cp	41h
		jp	nc, Load_SFX
		push	hl
		push	de
		push	af
		cp	21h
		jr	nc, Main_MusicBank0
		ld	a, 1
		ld	(MUSIC_BANK_TO_LOAD), a
		call	LoadMusicBank
		pop	af
		ld	de,  Bank+910h	; Selected 68k Bank
		jp	Load_Music
; ---------------------------------------------------------------------------

Main_MusicBank0:
		xor	a
		ld	(MUSIC_BANK_TO_LOAD), a
		call	LoadMusicBank
		pop	af
		ld	de, Bank	; Selected 68k Bank
		sub	20h

; ---------------------------------------------------------------------------
; Music track data (in the banked ROM window). A track id indexes the per-bank
; song pointer table (Bank / Bank+910h) to a header:
;   +0      0 for a music track (a nonzero value re-routes to the SFX loader)
;   +1 +2   auto-fade timeout in frames (-> MUSIC_AUTOFADE_TIMER; 0 = none)
;   +3      tempo: written to YM2612 Timer B (reg 26h) as this value + 3
;   +4..    ten little-endian pointers to the channels' event streams, in
;           order YM 1-3, YM 4-6 / DAC, PSG tone 1-3, PSG noise.
; SFX are similar: an id >= 41h indexes pt_SFX to a header whose +0 byte is the
; type - type 1 gives pointers for all ten channels (a full-channel effect),
; any other type gives three that overlay onto YM channels 4-6 on top of the
; music. A channel pointer whose target begins with FFh is left untouched.
; ---------------------------------------------------------------------------
Load_Music:
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
		ld	(MUSIC_AUTOFADE_TIMER), de
		ld	bc, 2B80h
		call	YM1_Input
		ld	b, 26h
		ld	c, (hl)
		inc	c
		inc	c
		inc	c
		call	YM1_Input
		xor	a
		ld	(CURRENTLY_FADING_OUT),	a
		ld	(FADE_OUT_COUNTER), a
		ld	a, 63h
		ld	(FADE_OUT_TIMER), a
		inc	hl
		ld	b, 0Ah
		ld	ix, YM_CHANNEL_DATA_1

Load_Music_Channels:
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	(ix+0),	e
		ld	(ix+1),	d
		ld	a, 0C0h
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
		jr	nz, Load_Music_Channels_NoEnd
		ld	a, 1
		ld	(ix+3),	a

Load_Music_Channels_NoEnd:
		ld	de, 20h
		add	ix, de
		djnz	Load_Music_Channels
		ld	b, 2

; Enables both stereo outputs on FM parts 1 and 2 (register B4h) as a track loads.
Activate_Stereo_Outputs:
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
		ld	a, 0C0h
		ld	(YM_CHANNEL_4_STEREO), a
		ld	(YM_CHANNEL_5_STEREO), a
		ld	a, 0FEh
		ld	(NEW_SAMPLE_TO_LOAD), a
		call	YM_LoadTimerB

Load_End:
		pop	de
		pop	hl
		jp	LoadBank
; ---------------------------------------------------------------------------

; Command >=41h: start a sound effect. Type 1 seizes all ten channels; other
; types overlay a few channels on top of the music (Load_SFX_Type_2).
Load_SFX:
		push	hl
		push	de
		sub	41h
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

Load_SFX_Channels:
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (de)
		cp	0FFh
		jr	z, Load_SFX_Channels_Skip
		call	InitChannelDataForSFX

Load_SFX_Channels_Skip:
		ld	de, 20h
		add	ix, de
		djnz	Load_SFX_Channels
		jr	Load_End
; ---------------------------------------------------------------------------

; Loads a type-2 (overlay) SFX into the three SFX_TYPE_2 channels, which play
; over YM channels 4-6 without stopping the music.
Load_SFX_Type_2:
		ld	a, (SFX_TYPE2_PRIORITY_CUR)	; vestigial priority gate:
		ld	d, a				; CUR is always 0, so NEW - CUR
		ld	a, (SFX_TYPE2_PRIORITY_NEW)	; never borrows and this bail
		sub	d				; is unreachable
		jp	c, Load_End
		ld	a, d
		ld	(SFX_TYPE2_PRIORITY_NEW), a
		ld	bc, 304h
		ld	ix, SFX_TYPE_2_CHANNEL_DATA_1

Load_SFX_Type_2_Loop:
		push	bc
		ld	e, (hl)
		inc	hl
		ld	d, (hl)
		inc	hl
		ld	a, (de)
		cp	0FFh
		jr	z, Load_SFX_Type_2_Skip
		call	InitChannelDataForSFX
		ld	b, 28h
		call	YM1_Input
		ld	c, a
		add	a, 0B0h
		ld	b, a
		ld	c, 0C0h
		call	YM2_Input

Load_SFX_Type_2_Skip:
		ld	de, 20h
		add	ix, de
		pop	bc
		inc	c
		djnz	Load_SFX_Type_2_Loop
		jp	Load_End

; Points a channel's state block at stream de and clears its counters/flags,
; leaving it ready to parse from the start.
InitChannelDataForSFX:
		ld	(ix+0),	e
		ld	(ix+1),	d
		ld	a, 0C0h
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

; Command FEh: key-off every FM and PSG channel, mark them all finished, and
; reset the fade state - leaves the driver silent.
StopMusic:
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
		ld	a, (SFX_TYPE_2_CHANNEL_DATA_1 + 3)
		or	a
		jr	z, StopMusic_Ch5
		xor	a
		ld	ix, YM_CHANNEL_DATA_4
		call	YM2_Load_Instrument
		ld	bc, 2804h
		call	YM1_Input

StopMusic_Ch5:
		inc	(iy+0)
		ld	a, (SFX_TYPE_2_CHANNEL_DATA_2 + 3)
		or	a
		jr	z, StopMusic_SilencePSG
		xor	a
		ld	ix, YM_CHANNEL_DATA_5
		call	YM2_Load_Instrument
		ld	bc, 2805h
		call	YM1_Input

StopMusic_SilencePSG:
		ld	hl, SN76489_PSG
		ld	a, 9Fh
		ld	(hl), a
		ld	a, 0BFh
		ld	(hl), a
		ld	a, 0DFh
		ld	(hl), a
		ld	a, 0FFh
		ld	(hl), a
		ld	hl, YM_CHANNEL_DATA_1 + 3
		ld	de, 20h
		ld	b, 0Ah
		ld	a, 1

StopMusic_KeyOffLoop:
		ld	(hl), a
		add	hl, de
		djnz	StopMusic_KeyOffLoop
		pop	hl
		ld	de, 0
		xor	a
		ld	(CURRENTLY_FADING_OUT),	a
		ld	(FADE_OUT_COUNTER), a
		ld	a, 63h

StopMusic_SetFadeState:
		ld	(FADE_OUT_TIMER), a
		ld	a, 0FFh
		ld	(SFX_TYPE2_PRIORITY_NEW), a
		ret

; Per-frame tick: step the fade-in and fade-out, then parse one event-tick of
; every channel and push the results to the YM2612 and PSG.
UpdateSound:
		push	bc
		push	de
		push	hl
		ld	hl, FADE_IN_TIMER
		inc	(hl)
		ld	a, (FADE_IN_PARAMETERS)
		rrca
		rrca
		and	3Ch
		jr	z, UpdateSound_AfterFadeIn
		cp	(hl)
		jr	nz, UpdateSound_AfterFadeIn
		xor	a
		ld	(hl), a
		ld	hl, MUSIC_LEVEL
		ld	a, (hl)
		cp	0Fh
		jr	z, UpdateSound_AfterFadeIn
		inc	(hl)
		call	Update_YM_InstrumentsLevels

UpdateSound_AfterFadeIn:
		call	LoadMusicBank
		ld	hl, (MUSIC_AUTOFADE_TIMER)
		ld	a, h
		or	l
		jr	z, UpdateSound_FadeOutCheck
		dec	hl
		ld	(MUSIC_AUTOFADE_TIMER), hl
		ld	a, h
		or	l
		call	z, FadeOut

UpdateSound_FadeOutCheck:
		ld	a, (CURRENTLY_FADING_OUT)
		or	a
		jr	z, UpdateSound_ParseAllChannels
		ld	a, (FADE_OUT_TIMER)
		or	a
		jr	nz, UpdateSound_FadeOutTick
		ld	a, (FADE_OUT_LENGTH)
		ld	(FADE_OUT_TIMER), a
		ld	a, (FADE_OUT_COUNTER)
		inc	a
		ld	(FADE_OUT_COUNTER), a
		cp	0Ch
		jr	nz, UpdateSound_ParseAllChannels
		call	StopMusic
		jr	UpdateSound_Done
; ---------------------------------------------------------------------------

UpdateSound_FadeOutTick:
		dec	a
		ld	(FADE_OUT_TIMER), a

UpdateSound_ParseAllChannels:
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

UpdateSound_Done:
		call	LoadBank
		pop	hl
		pop	de
		pop	bc
		ret

; Re-arms the YM2612 timers (register 27h); Timer B is what paces UpdateSound.
YM_LoadTimerB:
		ld	bc, 273Ah
		jr	YM1_Input

; As YM1_Input, but for an SFX-overlaid channel writes only while that channel
; is active, so an idle SFX slot leaves the music untouched.
YM1_ConditionalInput:
		ld	a, (CURRENTLY_MANAGING_SFX_TYPE_2)
		or	a
		jr	nz, YM1_Input
		exx
		push	ix
		pop	hl
		ld	bc, 0E3h
		add	hl, bc
		ld	a, (hl)
		exx
		or	a
		jr	nz, YM1_Input
		ret

; Writes value c to YM2612 register b, choosing part 1 or 2 per CALL_YM2_INSTEAD_OF_YM1.
YM_Input:
		ld	a, (CALL_YM2_INSTEAD_OF_YM1)
		or	a
		jr	nz, YM2_ConditionalInput

; Writes value c to register b on YM2612 part 1 (channels 1-3), after waiting
; for the chip to be ready.
YM1_Input:
		ld	a, (YM2612_A0)
		and	80h
		jr	nz, YM1_Input
		ld	a, b
		ld	(YM2612_A0), a
		ld	a, c
		ld	(YM2612_D0), a
		ret

; As YM2_Input, but writes only while the current SFX channel is active.
YM2_ConditionalInput:
		ld	a, (CURRENTLY_MANAGING_SFX_TYPE_2)
		or	a
		jr	nz, YM2_Input
		exx
		push	ix
		pop	hl
		ld	bc, 0E3h
		add	hl, bc
		ld	a, (hl)
		exx
		or	a
		ret	z

; Writes value c to register b on YM2612 part 2 (channels 4-6).
YM2_Input:
		ld	a, (YM2612_A1)
		and	80h
		jr	nz, YM2_Input
		ld	a, b
		ld	(YM2612_A1), a
		ld	a, c
		ld	(YM2612_D1), a
		ret

; ---------------------------------------------------------------------------

; Writes a 4-bit attenuation (a) to the current PSG channel's volume register.
PSG_SetChannelAttenuation:
		and	0Fh
		ld	h, a
		ld	a, (CURRENT_PSG_CHANNEL)
		or	h
		or	90h
		ld	(SN76489_PSG), a
		ret

; Requests DAC sample a. For music channels it only takes effect when the
; channel is active, not fading, and at full volume, so SFX keep priority.
DAC_SetNewSample:
		ld	b, a
		ld	a, (CURRENTLY_MANAGING_SFX_TYPE_2)
		or	a
		jr	nz, DAC_SetNewSample_Store
		exx
		push	ix
		pop	hl
		ld	bc, 0E3h
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

DAC_SetNewSample_Store:
		ld	a, b
		ld	(NEW_SAMPLE_TO_LOAD), a
		ret

; ---------------------------------------------------------------------------

; ---------------------------------------------------------------------------
; Channel event streams. Each channel points at a byte stream the matching
; parser below walks. A byte whose top five bits are all set (F8h-FFh) is a
; command; any other byte is a note event:
;
;   note event:  %d ppppppp  [duration]
;     ppppppp = pitch 00h-6Fh, or 70h = rest. Bit 7 (d) set means an explicit
;     duration byte follows; clear reuses the previous duration. The pitch
;     indexes the frequency table (after adding the channel's transpose). On
;     the DAC channel the value is instead a sample id (played as id + 1); on
;     the PSG noise channel its low 3 bits are the noise mode.
;
; Commands - the low 3 bits of the F8h-FFh byte select which. Which commands a
; channel recognises differs by type; an unrecognised one skips two bytes:
;
;   byte  FM 1-6         DAC (ch 6)   PSG tone          PSG noise
;   FFh   end / jump     end / jump   end / jump        end / jump
;   FEh   set instrument    -            -                 -
;   FDh   set volume        -         set envelope+vol  set envelope+vol
;   FCh   slide / key-off  key-off     key-off           key-off
;   FBh   vibrato           -         vibrato              -
;   FAh   stereo / pan     stereo     set Timer B          -
;   F9h   note shift        -         note shift           -
;   F8h   loop command     loop        loop              loop
;
; FFh takes a 16-bit operand: a nonzero high byte jumps to that address (used
; to loop a track); 0000h ends the channel; 00LLh ends it and posts LLh as a
; new driver command. F8h (loop) takes a control byte whose top 3 bits pick a
; sub-op: set or recall one of two loop markers, a counted repeat, or a
; play-once conditional skip.
; ---------------------------------------------------------------------------
; Parses one event-tick of FM channels 1-3 (music part 1).
YM1_ParseData:
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
		ld	c, 0A0h
		add	a, c
		ld	(YM1_WriteFreqLo+1), a
		ld	c, 4
		add	a, c
		ld	(YM1_WriteFreqHi+1), a

YM1_ParseData_Channel:
		ld	a, (ix+3)
		or	a
		ret	nz
		ld	a, (ix+6)
		cp	(ix+2)
		jr	nz, YM1_ParseData_Fetch
		ld	a, (ix+8)
		or	a
		jr	nz, YM1_ParseData_Fetch
		ld	b, 28h
		ld	a, (iy+0)
		ld	c, a
		call	YM1_Input

YM1_ParseData_Fetch:
		ld	a, (ix+2)
		or	a
		jp	nz, YM1_Parse_HeldNote
		ld	d, (ix+1)
		ld	e, (ix+0)

YM1_Parsing_Start:
		xor	a
		ld	(ix+0Dh), a
		ld	a, (ix+9)
		ld	(ix+0Ah), a
		ld	a, (de)
		and	0F8h
		cp	0F8h
		jp	nz, YM1_Parse_PlayNote
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
		jr	z, YM1_Parse_TrackDone
		ld	(NEW_OPERATION), a

YM1_Parse_TrackDone:
		ld	a, 1
		ld	(ix+3),	a
		xor	a
		jp	YM1_LoadInstrument
; ---------------------------------------------------------------------------

YM1_Parse_At_New_Offset:
		ex	de, hl
		jr	YM1_Parsing_Start
; ---------------------------------------------------------------------------

YM1_Set_Instrument:
		cp	0FEh
		jr	nz, YM1_Load_Note
		inc	de
		ld	a, (de)
		call	YM1_SetChannelInstrument
		inc	de
		jp	YM1_Parsing_Start
; ---------------------------------------------------------------------------

YM1_Load_Note:
		cp	0FDh
		jr	nz, YM1_Set_Slide_Or_Key_Release
		inc	de
		ld	a, (de)
		and	0Fh
		call	YM1_LoadInstrument
		inc	de
		jp	YM1_Parsing_Start
; ---------------------------------------------------------------------------

YM1_Set_Slide_Or_Key_Release:
		cp	0FCh
		jr	nz, YM1_Load_Vibrato
		call	YM1_SetSlideOrKeyRelease
		jp	YM1_Parsing_Start
; ---------------------------------------------------------------------------

YM1_Load_Vibrato:
		cp	0FBh
		jr	nz, YM1_Set_Stereo
		call	LoadVibrato
		jp	YM1_Parsing_Start
; ---------------------------------------------------------------------------

YM1_Set_Stereo:
		cp	0FAh
		jr	nz, YM1_Load_Note_Shift
		call	YM1_SetStereo
		jp	YM1_Parsing_Start
; ---------------------------------------------------------------------------

YM1_Load_Note_Shift:
		cp	0F9h
		jr	nz, YM1_Loop_Command
		call	LoadNoteShift
		jp	YM1_Parsing_Start
; ---------------------------------------------------------------------------

YM1_Loop_Command:
		cp	0F8h
		jr	nz, YM1_Bad_Command
		call	ParseLoopCommand
		jp	YM1_Parsing_Start
; ---------------------------------------------------------------------------

YM1_Bad_Command:
		inc	de
		inc	de
		jp	YM1_Parsing_Start
; ---------------------------------------------------------------------------

YM1_Parse_PlayNote:
		ld	a, (de)
		and	7Fh
		cp	70h
		jp	z, YM1_Parse_ReadDuration
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
		ld	a, (YM1_WriteFreqHi+1)
		ld	b, a
		ld	c, h
		ld	(ix+12h), c
		ld	a, (ix+1Fh)
		or	a
		jr	nz, YM1_Parse_FreqHiDone
		ld	(ix+0Fh), c
		xor	a
		ld	(ix+12h), a

YM1_Parse_FreqHiDone:
		call	YM1_Input
		ld	a, (YM1_WriteFreqLo+1)
		ld	b, a
		ld	c, l
		ld	(ix+11h), c
		ld	a, (ix+1Fh)
		or	a
		jr	nz, YM1_Parse_FreqLoDone
		ld	(ix+0Eh), c
		xor	a
		ld	(ix+11h), a

YM1_Parse_FreqLoDone:
		call	YM1_Input
		ld	b, 28h
		ld	a, (iy+0)
		or	0F0h
		ld	c, a
		call	YM1_Input

YM1_Parse_ReadDuration:
		ld	a, (de)
		bit	7, a
		jr	nz, Command_F0
		ld	a, (ix+7)
		jr	YM1_Parse_StoreEvent
; ---------------------------------------------------------------------------

Command_F0:
		inc	de
		ld	a, (de)
		ld	(ix+7),	a

YM1_Parse_StoreEvent:
		ld	(ix+2),	a
		inc	de
		ld	(ix+1),	d
		ld	(ix+0),	e
		jp	YM1_ParseData_Channel
; ---------------------------------------------------------------------------

YM1_Parse_HeldNote:
		dec	(ix+2)
		ld	b, (ix+12h)
		ld	c, (ix+11h)
		ld	a, b
		or	c
		jr	z, YM1_Vibrato
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
		jr	nc, YM1_Slide_Down
		ld	b, 0
		ld	c, (ix+1Fh)
		jp	YM1_Slide_Apply
; ---------------------------------------------------------------------------

YM1_Slide_Down:
		ld	b, 0FFh
		ld	a, (ix+1Fh)
		neg
		ld	c, a

YM1_Slide_Apply:
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
		jr	nz, YM1_Slide_Reset
		push	hl
		ld	a, h
		and	7
		ld	h, a
		ld	(TEMP_FREQUENCY), hl
		ld	bc, 4D4h
		or	a
		sbc	hl, bc
		jr	c, YM1_Slide_ClampLow
		ld	bc, 596h
		jp	YM1_Slide_Store
; ---------------------------------------------------------------------------

YM1_Slide_ClampLow:
		ld	hl, (TEMP_FREQUENCY)
		ld	bc, 26Ah
		or	a
		sbc	hl, bc
		jr	nc, YM1_Slide_NoClamp
		ld	bc, 0FA6Ah
		jp	YM1_Slide_Store
; ---------------------------------------------------------------------------

YM1_Slide_NoClamp:
		ld	bc, 0

YM1_Slide_Store:
		pop	hl
		add	hl, bc
		ld	a, h
		ld	(ix+0Fh), a
		ld	a, l
		ld	(ix+0Eh), a
		jp	YM1_Vibrato
; ---------------------------------------------------------------------------

YM1_Slide_Reset:
		ld	(ix+0Fh), b
		ld	(ix+0Eh), c
		xor	a
		ld	(ix+11h), a
		ld	(ix+12h), a

YM1_Vibrato:
		ld	a, (ix+0Ah)
		or	a
		jr	z, YM1_Vibrato_Read
		dec	(ix+0Ah)
		xor	a
		jr	EndPart
; ---------------------------------------------------------------------------

YM1_Vibrato_Read:
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
		cp	81h
		jr	nz, YM1_Vibrato_Restart
		dec	(ix+0Dh)
		xor	a
		jr	EndPart
; ---------------------------------------------------------------------------

YM1_Vibrato_Restart:
		cp	80h
		jp	nz, EndPart
		xor	a
		ld	(ix+0Dh), a
		jp	YM1_Vibrato_Read
; ---------------------------------------------------------------------------

EndPart:
		ld	c, a
		ld	a, (ix+0Eh)
		ld	l, a
		ld	a, (ix+0Fh)
		ld	h, a
		ld	b, 0
		bit	7, c
		jr	z, YM1_EndPart_Neg
		dec	b

YM1_EndPart_Neg:
		add	hl, bc

YM1_WriteFreqHi:
		ld	b, 0
		ld	c, h
		ld	(ix+0Fh), c
		call	YM1_Input

YM1_WriteFreqLo:
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

; Parses one event-tick of FM channels 4-5 (part 2), or the type-2 SFX
; channels when an overlay SFX is active.
YM2_ParseData:
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
		jr	z, YM2_ParseData_NoSfx2
		ld	de, 0E0h
		add	ix, de

YM2_ParseData_NoSfx2:
		pop	af
		ld	c, 0A0h
		add	a, c
		ld	(YM2_WriteFreqLo+1), a
		ld	c, 4
		add	a, c
		ld	(YM2_WriteFreqHi+1), a

YM2_ParseData_Channel:
		ld	a, (ix+3)
		or	a
		ret	nz
		ld	a, (ix+6)
		cp	(ix+2)
		jr	nz, YM2_ParseData_Fetch
		ld	a, (ix+8)
		or	a
		jr	nz, YM2_ParseData_Fetch
		ld	b, 28h
		ld	a, (iy+0)
		add	a, 4
		ld	c, a
		call	YM1_ConditionalInput

YM2_ParseData_Fetch:
		ld	a, (ix+2)
		or	a
		jp	nz, YM2_Parse_HeldNote
		ld	d, (ix+1)
		ld	e, (ix+0)

YM2_Parsing_Start:
		xor	a
		ld	(ix+0Dh), a
		ld	a, (ix+9)
		ld	(ix+0Ah), a
		ld	a, (de)
		and	0F8h
		cp	0F8h
		jp	nz, YM2_Parse_PlayNote
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
		ld	(SFX_TYPE2_PRIORITY_NEW), a
		ld	a, (CURRENTLY_MANAGING_SFX_TYPE_2)
		or	a
		jr	z, YM2_Parse_LoadSilent
		ld	bc, 0FF20h
		add	ix, bc
		ld	a, 0B4h
		add	a, (iy+0)
		ld	b, a
		ld	c, (ix+1Eh)
		call	YM2_Input
		ld	a, (ix+3)
		or	a
		jr	nz, YM2_Parse_LoadSilent
		ld	a, (ix+4)
		jp	YM2_Load_Instrument
; ---------------------------------------------------------------------------

YM2_Parse_LoadSilent:
		xor	a
		jp	YM2_Load_Instrument
; ---------------------------------------------------------------------------

YM2_Parse_At_New_Offset:
		ex	de, hl
		jr	YM2_Parsing_Start
; ---------------------------------------------------------------------------

YM2_Set_Instrument:
		cp	0FEh
		jr	nz, YM2_Load_Note
		inc	de
		ld	a, (de)
		call	YM2_SetChannelInstrument
		inc	de
		jp	YM2_Parsing_Start
; ---------------------------------------------------------------------------

YM2_Load_Note:
		cp	0FDh
		jr	nz, YM2_Set_Slide_Or_Key_Release
		inc	de
		ld	a, (de)
		and	0Fh
		call	YM2_Load_Instrument
		inc	de
		jp	YM2_Parsing_Start
; ---------------------------------------------------------------------------

YM2_Set_Slide_Or_Key_Release:
		cp	0FCh
		jr	nz, YM2_Load_Vibrato
		call	YM1_SetSlideOrKeyRelease
		jp	YM2_Parsing_Start
; ---------------------------------------------------------------------------

YM2_Load_Vibrato:
		cp	0FBh
		jr	nz, YM2_Set_Stereo
		call	LoadVibrato
		jp	YM2_Parsing_Start
; ---------------------------------------------------------------------------

YM2_Set_Stereo:
		cp	0FAh
		jr	nz, YM2_Load_Note_Shift
		call	YM2_SetStereo
		jp	YM2_Parsing_Start
; ---------------------------------------------------------------------------

YM2_Load_Note_Shift:
		cp	0F9h
		jr	nz, YM2_Loop_Command
		call	LoadNoteShift
		jp	YM2_Parsing_Start
; ---------------------------------------------------------------------------

YM2_Loop_Command:
		cp	0F8h
		jr	nz, YM2_Bad_Command
		call	ParseLoopCommand
		jp	YM2_Parsing_Start
; ---------------------------------------------------------------------------

YM2_Bad_Command:
		inc	de
		inc	de
		jp	YM2_Parsing_Start
; ---------------------------------------------------------------------------

YM2_Parse_PlayNote:
		ld	a, (de)
		and	7Fh
		cp	70h
		jp	z, YM2_Parse_ReadDuration
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
		ld	a, (YM1_WriteFreqHi+1)
		ld	b, a
		ld	c, h
		ld	(ix+12h), c
		ld	a, (ix+1Fh)
		or	a
		jr	nz, YM2_Parse_FreqHiDone
		ld	(ix+0Fh), c
		xor	a
		ld	(ix+12h), a

YM2_Parse_FreqHiDone:
		call	YM2_ConditionalInput
		ld	a, (YM1_WriteFreqLo+1)
		ld	b, a
		ld	c, l
		ld	(ix+11h), c
		ld	a, (ix+1Fh)
		or	a
		jr	nz, YM2_Parse_FreqLoDone
		ld	(ix+0Eh), c
		xor	a
		ld	(ix+11h), a

YM2_Parse_FreqLoDone:
		call	YM2_ConditionalInput
		ld	b, 28h
		ld	a, (iy+0)
		add	a, 4
		or	0F0h
		ld	c, a
		call	YM1_ConditionalInput

YM2_Parse_ReadDuration:
		ld	a, (de)
		bit	7, a
		jr	nz, YM2_Parse_DurationByte
		ld	a, (ix+7)
		jr	YM2_Parse_StoreEvent
; ---------------------------------------------------------------------------

YM2_Parse_DurationByte:
		inc	de
		ld	a, (de)
		ld	(ix+7),	a

YM2_Parse_StoreEvent:
		ld	(ix+2),	a
		inc	de
		ld	(ix+1),	d
		ld	(ix+0),	e
		jp	YM2_ParseData_Channel
; ---------------------------------------------------------------------------

YM2_Parse_HeldNote:
		dec	(ix+2)
		ld	b, (ix+12h)
		ld	c, (ix+11h)
		ld	a, b
		or	c
		jr	z, YM2_Vibrato
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
		jr	nc, YM2_Slide_Down
		ld	b, 0
		ld	c, (ix+1Fh)
		jp	YM2_Slide_Apply
; ---------------------------------------------------------------------------

YM2_Slide_Down:
		ld	b, 0FFh
		ld	a, (ix+1Fh)
		neg
		ld	c, a

YM2_Slide_Apply:
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
		jr	nz, YM2_Slide_Reset
		push	hl
		ld	a, h
		and	7
		ld	h, a
		ld	(TEMP_FREQUENCY), hl
		ld	bc, 4D4h
		or	a
		sbc	hl, bc
		jr	c, YM2_Slide_ClampLow
		ld	bc, 596h
		jp	YM2_Slide_Store
; ---------------------------------------------------------------------------

YM2_Slide_ClampLow:
		ld	hl, (TEMP_FREQUENCY)
		ld	bc, 26Ah
		or	a
		sbc	hl, bc
		jr	nc, YM2_Slide_NoClamp
		ld	bc, 0FA6Ah
		jp	YM2_Slide_Store
; ---------------------------------------------------------------------------

YM2_Slide_NoClamp:
		ld	bc, 0

YM2_Slide_Store:
		pop	hl
		add	hl, bc
		ld	a, h
		ld	(ix+0Fh), a
		ld	a, l
		ld	(ix+0Eh), a
		jp	YM2_Vibrato
; ---------------------------------------------------------------------------

YM2_Slide_Reset:
		ld	(ix+0Fh), b
		ld	(ix+0Eh), c
		xor	a
		ld	(ix+11h), a
		ld	(ix+12h), a

YM2_Vibrato:
		ld	a, (ix+0Ah)
		or	a
		jr	z, YM2_Vibrato_Read
		dec	(ix+0Ah)
		xor	a
		jr	YM2_EndPart
; ---------------------------------------------------------------------------

YM2_Vibrato_Read:
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
		cp	81h
		jr	nz, YM2_Vibrato_Restart
		dec	(ix+0Dh)
		xor	a
		jr	YM2_EndPart
; ---------------------------------------------------------------------------

YM2_Vibrato_Restart:
		cp	80h
		jp	nz, YM2_EndPart
		xor	a
		ld	(ix+0Dh), a
		jp	YM2_Vibrato_Read
; ---------------------------------------------------------------------------

YM2_EndPart:
		ld	c, a
		ld	a, (ix+0Eh)
		ld	l, a
		ld	a, (ix+0Fh)
		ld	h, a
		ld	b, 0
		bit	7, c
		jr	z, YM2_EndPart_Neg
		dec	b

YM2_EndPart_Neg:
		add	hl, bc

YM2_WriteFreqHi:
		ld	b, 0
		ld	c, h
		ld	(ix+0Fh), c
		call	YM2_ConditionalInput

YM2_WriteFreqLo:
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

; Records this FM channel's instrument number for the next note-on (command FEh).
YM1_SetChannelInstrument:
		ld	(ix+10h), a
		ret

; Loads instrument (ix+10h)'s 29-byte patch to this part-1 FM channel's
; operator registers, scaling the carriers' levels by volume a and the fade.
YM1_LoadInstrument:
		call	LoadInstrumentsBank
		ld	(ix+4),	a
		ld	a, (FADE_OUT_COUNTER)
		add	a, 0Fh
		ld	h, a
		ld	a, (MUSIC_LEVEL)
		add	a, (ix+4)
		sub	h
		jr	nc, YM1_LoadInstrument_Level
		xor	a

YM1_LoadInstrument_Level:
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
		add	a, 30h
		ld	b, 4

YM1_LoadInstrument_DetuneMul:
		push	bc
		ld	b, a
		ld	c, (hl)
		push	af
		call	YM1_Input
		pop	af
		inc	hl
		add	a, 4
		pop	bc
		djnz	YM1_LoadInstrument_DetuneMul
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

YM1_LoadInstrument_TLLoop:
		push	bc
		ld	b, a
		push	af
		rr	d
		jr	nc, YM1_LoadInstrument_TLRaw
		ld	a, 7Fh
		sub	(hl)
		add	a, c
		ld	c, a
		cp	7Fh
		jr	c, YM1_LoadInstrument_TLJoin
		ld	c, 7Fh

YM1_LoadInstrument_TLJoin:
		jp	YM1_LoadInstrument_TLSend
; ---------------------------------------------------------------------------

YM1_LoadInstrument_TLRaw:
		ld	c, (hl)

YM1_LoadInstrument_TLSend:
		call	YM1_Input
		pop	af
		inc	hl
		add	a, 4
		pop	bc
		djnz	YM1_LoadInstrument_TLLoop
		ld	b, 14h

YM1_LoadInstrument_Regs:
		push	bc
		ld	b, a
		ld	c, (hl)
		push	af
		call	YM1_Input
		pop	af
		inc	hl
		add	a, 4
		pop	bc
		djnz	YM1_LoadInstrument_Regs
		add	a, 10h
		ld	b, a
		ld	c, (hl)
		call	YM1_Input
		pop	de
		jp	LoadMusicBank

; Records this part-2 FM channel's instrument number for the next note-on.
YM2_SetChannelInstrument:
		ld	(ix+10h), a
		ret

; As YM1_LoadInstrument, for a part-2 FM channel (uses conditional writes so
; an overlay SFX does not disturb the music).
YM2_Load_Instrument:
		call	LoadInstrumentsBank
		ld	(ix+4),	a
		ld	a, (CURRENTLY_MANAGING_SFX_TYPE_2)
		or	a
		jr	z, YM2_LoadInstrument_Level
		ld	a, (ix+4)
		jr	YM2_LoadInstrument_Setup
; ---------------------------------------------------------------------------

YM2_LoadInstrument_Level:
		ld	a, (FADE_OUT_COUNTER)
		add	a, 0Fh
		ld	h, a
		ld	a, (MUSIC_LEVEL)
		add	a, (ix+4)
		sub	h
		jr	nc, YM2_LoadInstrument_Setup
		xor	a

YM2_LoadInstrument_Setup:
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
		add	a, 30h
		ld	b, 4

YM2_LoadInstrument_DetuneMul:
		push	bc
		ld	b, a
		ld	c, (hl)
		push	af
		call	YM2_ConditionalInput
		pop	af
		inc	hl
		add	a, 4
		pop	bc
		djnz	YM2_LoadInstrument_DetuneMul
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

YM2_LoadInstrument_TLLoop:
		push	bc
		ld	b, a
		push	af
		rr	d
		jr	nc, YM2_LoadInstrument_TLRaw
		ld	a, 7Fh
		sub	(hl)
		add	a, c
		ld	c, a
		cp	7Fh
		jr	c, YM2_LoadInstrument_TLJoin
		ld	c, 7Fh

YM2_LoadInstrument_TLJoin:
		jp	YM2_LoadInstrument_TLSend
; ---------------------------------------------------------------------------

YM2_LoadInstrument_TLRaw:
		ld	c, (hl)

YM2_LoadInstrument_TLSend:
		call	YM2_ConditionalInput
		pop	af
		inc	hl
		add	a, 4
		pop	bc
		djnz	YM2_LoadInstrument_TLLoop
		ld	b, 14h

YM2_LoadInstrument_Regs:
		push	bc
		ld	b, a
		ld	c, (hl)
		push	af
		call	YM2_ConditionalInput
		pop	af
		inc	hl
		add	a, 4
		pop	bc
		djnz	YM2_LoadInstrument_Regs
		add	a, 10h
		ld	b, a
		ld	c, (hl)
		call	YM2_ConditionalInput
		pop	de
		jp	LoadMusicBank

; Parses one event-tick of FM channel 6, the DAC channel: its notes trigger
; DAC samples rather than FM tones.
YM2_ParseChannel6Data:
		ld	ix, YM_CHANNEL_DATA_6
		ld	a, (CURRENTLY_MANAGING_SFX_TYPE_2)
		or	a
		jr	z, DAC_ParseData_Channel
		ld	de, 0E0h
		add	ix, de

DAC_ParseData_Channel:
		ld	a, (ix+3)
		or	a
		ret	nz
		ld	a, (ix+6)
		cp	(ix+2)
		jr	nz, DAC_ParseData_Fetch
		ld	a, (ix+8)
		or	a
		jr	nz, DAC_ParseData_Fetch
		ld	a, 0FEh
		call	DAC_SetNewSample

DAC_ParseData_Fetch:
		ld	a, (ix+2)
		or	a
		jp	nz, DAC_Parse_HeldNote
		ld	d, (ix+1)
		ld	e, (ix+0)

DAC_Parsing_Start:
		ld	a, (de)
		and	0F8h
		cp	0F8h
		jp	nz, DAC_Parse_PlaySample
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
		ld	(SFX_TYPE2_PRIORITY_NEW), a
		ret
; ---------------------------------------------------------------------------

DAC_Parse_At_New_Offset:
		ex	de, hl
		jr	DAC_Parsing_Start
; ---------------------------------------------------------------------------

DAC_Set_Key_Release:
		cp	0FCh
		jr	nz, DAC_Set_Stereo
		call	SetRelease
		jp	DAC_Parsing_Start
; ---------------------------------------------------------------------------

DAC_Set_Stereo:
		cp	0FAh
		jr	nz, DAC_Loop_Command
		call	YM2_SetStereo
		jp	DAC_Parsing_Start
; ---------------------------------------------------------------------------

DAC_Loop_Command:
		cp	0F8h
		jr	nz, DAC_Bad_Command
		call	ParseLoopCommand
		jp	DAC_Parsing_Start
; ---------------------------------------------------------------------------

DAC_Bad_Command:
		inc	de
		inc	de
		jp	DAC_Parsing_Start
; ---------------------------------------------------------------------------

DAC_Parse_PlaySample:
		ld	a, (de)
		and	7Fh
		cp	70h
		jp	z, DAC_Parse_ReadDuration
		inc	a
		call	DAC_SetNewSample

DAC_Parse_ReadDuration:
		ld	a, (de)
		bit	7, a
		jr	nz, DAC_Parse_DurationByte
		ld	a, (ix+7)
		jr	DAC_Parse_StoreEvent
; ---------------------------------------------------------------------------

DAC_Parse_DurationByte:
		inc	de
		ld	a, (de)
		ld	(ix+7),	a

DAC_Parse_StoreEvent:
		ld	(ix+2),	a
		inc	de
		ld	(ix+1),	d
		ld	(ix+0),	e
		jp	DAC_ParseData_Channel
; ---------------------------------------------------------------------------

DAC_Parse_HeldNote:
		dec	(ix+2)
		ld	a, (FADE_OUT_TIMER)
		or	a
		ret	nz
		ret

; Parses one event-tick of a PSG tone channel.
PSG_ParseToneData:

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
		and	60h
		ld	(CURRENT_PSG_CHANNEL), a

PSG_ParseData_Channel:
		ld	a, (ix+3)
		or	a
		ret	nz
		ld	a, (ix+2)
		or	a
		jp	nz, PSG_Parse_HeldNote
		ld	d, (ix+1)
		ld	e, (ix+0)

PSG_Parsing_Start:
		ld	a, (de)
		and	0F8h
		cp	0F8h
		jp	nz, PSG_Parse_PlayNote
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
		ld	(SFX_TYPE2_PRIORITY_NEW), a
		ld	a, 0Fh
		jp	PSG_SetChannelAttenuation
; ---------------------------------------------------------------------------

PSG_Parse_At_New_Offset:
		ex	de, hl
		jr	PSG_Parsing_Start
; ---------------------------------------------------------------------------

PSG_Load_Instrument:
		cp	0FDh
		jr	nz, PSG_Set_Key_Release
		call	PSG_LoadInstrument
		jp	PSG_Parsing_Start
; ---------------------------------------------------------------------------

PSG_Set_Key_Release:
		cp	0FCh
		jr	nz, PSG_Load_Vibrato
		call	SetRelease
		jp	PSG_Parsing_Start
; ---------------------------------------------------------------------------

PSG_Load_Vibrato:
		cp	0FBh
		jr	nz, PSG_Set_Timer
		call	LoadVibrato
		jp	PSG_Parsing_Start
; ---------------------------------------------------------------------------

PSG_Set_Timer:
		cp	0FAh
		jr	nz, PSG_Load_Note_Shift
		inc	de
		ld	b, 26h
		ld	a, (de)
		ld	c, a
		inc	de
		call	YM1_Input
		jp	PSG_Parsing_Start
; ---------------------------------------------------------------------------

PSG_Load_Note_Shift:
		cp	0F9h
		jr	nz, PSG_Loop_Command
		call	LoadNoteShift
		jp	PSG_Parsing_Start
; ---------------------------------------------------------------------------

PSG_Loop_Command:
		cp	0F8h
		jr	nz, PSG_Bad_Command
		call	ParseLoopCommand
		jp	PSG_Parsing_Start
; ---------------------------------------------------------------------------

PSG_Bad_Command:
		inc	de
		inc	de
		jp	PSG_Parsing_Start
; ---------------------------------------------------------------------------

PSG_Parse_PlayNote:
		ld	a, (de)
		and	7Fh
		cp	70h
		jp	z, PSG_Parse_KeepInstr
		push	af
		ld	a, (ix+1Eh)
		or	a
		jr	z, Set_New_Note
		xor	a
		ld	(ix+12h), a
		ld	(ix+1Eh), a
		ld	a, (ix+9)
		ld	(ix+0Ah), a

Set_New_Note:
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
		and	80h
		jr	PSG_Parse_ReadDuration
; ---------------------------------------------------------------------------

PSG_Parse_KeepInstr:
		ld	a, (ix+8)
		or	1

PSG_Parse_ReadDuration:
		ld	(ix+8),	a
		ld	a, (de)
		bit	7, a
		jr	nz, PSG_Parse_DurationByte
		ld	a, (ix+7)
		jr	PSG_Parse_StoreEvent
; ---------------------------------------------------------------------------

PSG_Parse_DurationByte:
		inc	de
		ld	a, (de)
		ld	(ix+7),	a

PSG_Parse_StoreEvent:
		ld	(ix+2),	a
		inc	de
		ld	(ix+1),	d
		ld	(ix+0),	e
		jp	PSG_ParseData_Channel
; ---------------------------------------------------------------------------

PSG_Parse_HeldNote:
		dec	(ix+2)
		ld	a, (ix+0Ah)
		or	a
		jr	z, Apply_Vibrato
		dec	(ix+0Ah)
		xor	a
		jr	PSG_Vibrato_Apply
; ---------------------------------------------------------------------------

Apply_Vibrato:
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
		cp	81h
		jr	nz, PSG_Vibrato_Restart
		dec	(ix+0Dh)
		jr	PSG_Parse_Envelope
; ---------------------------------------------------------------------------

PSG_Vibrato_Restart:
		cp	80h
		jp	nz, PSG_Vibrato_Apply
		xor	a
		ld	(ix+0Dh), a
		jp	Apply_Vibrato
; ---------------------------------------------------------------------------

PSG_Vibrato_Apply:
		neg
		ld	c, a
		ld	a, (ix+0Eh)
		ld	l, a
		ld	a, (ix+0Fh)
		ld	h, a
		ld	b, 0
		bit	7, c
		jr	z, PSG_Vibrato_Neg
		dec	b

PSG_Vibrato_Neg:
		add	hl, bc
		ld	a, h
		ld	(ix+0Fh), a
		ld	a, l
		ld	(ix+0Eh), a

PSG_Parse_Envelope:
		call	PSG_GetInstrumentPointer
		ld	b, (hl)
		bit	7, b
		jr	nz, PSG_Env_NoAdvance
		inc	a
		ld	(ix+12h), a

PSG_Env_NoAdvance:
		res	7, b
		ld	a, 0Fh
		sub	b
		ld	b, a
		ld	a, (ix+4)
		sub	b
		jr	nc, PSG_Env_LevelClamp
		xor	a

PSG_Env_LevelClamp:
		ld	b, a
		ld	a, (iy+0)
		cp	2
		jr	nz, PSG_Env_UseMusicLevel
		ld	a, 0Fh
		jr	PSG_Env_AddLevel
; ---------------------------------------------------------------------------

PSG_Env_UseMusicLevel:
		ld	a, (MUSIC_LEVEL)

PSG_Env_AddLevel:
		add	a, b
		sub	0Fh
		jr	nc, PSG_Env_Store
		xor	a

PSG_Env_Store:
		ld	(ix+5),	a
		ld	b, (ix+8)
		ld	a, (ix+2)
		or	a
		jr	z, PSG_Release_Key
		bit	7, b
		jr	nz, PSG_Parse_ApplyFade
		cp	(ix+6)
		jr	nz, PSG_Parse_ApplyFade

PSG_Release_Key:
		ld	a, b
		or	a
		jr	nz, PSG_Parse_ApplyFade
		ld	c, 1
		ld	(ix+1Eh), c
		or	2
		ld	(ix+8),	a

PSG_Env_SkipLoop:
		call	PSG_GetInstrumentPointer
		ld	a, (hl)
		and	80h
		jr	nz, PSG_Env_SkipDone
		inc	(ix+12h)
		jr	PSG_Env_SkipLoop
; ---------------------------------------------------------------------------

PSG_Env_SkipDone:
		inc	(ix+12h)

PSG_Parse_ApplyFade:
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

Transmit_Data:
		ld	a, (ix+0Fh)
		ld	b, a
		ld	a, (ix+0Eh)
		ld	c, a
		and	0Fh
		ld	h, a
		ld	a, (CURRENT_PSG_CHANNEL)
		or	h
		or	80h
		ld	(SN76489_PSG), a
		ld	a, c
		srl	b
		rra
		srl	b
		rra
		rra
		rra
		and	3Fh
		ld	(SN76489_PSG), a
		ld	a, 0Fh
		sub	(ix+5)
		ld	h, a
		ld	a, (CURRENT_PSG_CHANNEL)
		or	h
		or	90h
		ld	(SN76489_PSG), a
		ret

; Returns hl = the current byte of this PSG channel's amplitude envelope
; (base ix+10h/11h plus step index ix+12h).
PSG_GetInstrumentPointer:
		ld	a, (ix+11h)
		ld	h, a
		ld	a, (ix+10h)
		ld	l, a
		ld	b, 0
		ld	a, (ix+12h)
		ld	c, a
		add	hl, bc
		ret

; Command FDh: selects the PSG amplitude envelope (operand high nibble) and
; sets the channel volume (low nibble).
PSG_LoadInstrument:
		inc	de
		ld	a, (de)
		ld	c, a
		and	0Fh
		ld	b, a
		ld	a, (iy+0)
		cp	2
		jr	z, PSG_LoadInstrument_SetLevel
		ld	a, (CURRENTLY_FADING_OUT)
		or	a
		jr	nz, PSG_LoadInstrument_Pointer

PSG_LoadInstrument_SetLevel:
		ld	(ix+4),	b

PSG_LoadInstrument_Pointer:
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

; Parses one event-tick of the PSG noise channel.
PSG_ParseNoiseData:
		ld	a, (iy+0)
		ld	ix, PSG_CHANNEL_DATA_NOISE
		ld	a, 60h
		ld	(CURRENT_PSG_CHANNEL), a

PSGN_ParseData_Channel:
		ld	a, (ix+3)
		or	a
		ret	nz
		ld	a, (ix+2)
		or	a
		jp	nz, PSGN_Parse_HeldNote
		ld	d, (ix+1)
		ld	e, (ix+0)

PSGN_Parsing_Start:
		ld	a, (de)
		and	0F8h
		cp	0F8h
		jp	nz, PSGN_Parse_PlayNote
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
		jr	nz, PSGN_Parse_NewOffset
		ld	a, 1
		ld	(ix+3),	a
		ld	a, 0FFh
		ld	(SFX_TYPE2_PRIORITY_NEW), a
		ld	a, 0Fh
		jp	PSG_SetChannelAttenuation
; ---------------------------------------------------------------------------

PSGN_Parse_NewOffset:
		ex	de, hl
		jp	PSGN_Parsing_Start
; ---------------------------------------------------------------------------

PSGN_Load_Instrument:
		cp	0FDh
		jr	nz, PSGN_Set_Key_Release
		call	PSG_LoadInstrument
		jp	PSGN_Parsing_Start
; ---------------------------------------------------------------------------

PSGN_Set_Key_Release:
		cp	0FCh
		jr	nz, PSGN_Loop_Command
		call	SetRelease
		jp	PSGN_Parsing_Start
; ---------------------------------------------------------------------------

PSGN_Loop_Command:
		cp	0F8h
		jr	nz, PSGN_Bad_Command
		call	ParseLoopCommand
		jp	PSGN_Parsing_Start
; ---------------------------------------------------------------------------

PSGN_Bad_Command:
		inc	de
		inc	de
		jp	PSGN_Parsing_Start
; ---------------------------------------------------------------------------

PSGN_Parse_PlayNote:
		ld	a, (de)
		and	7Fh
		cp	70h
		jp	z, PSGN_Parse_KeepInstr
		push	af
		ld	a, (ix+1Eh)
		or	a
		jr	z, PSGN_Parse_NoteReset
		xor	a
		ld	(ix+12h), a
		ld	(ix+1Eh), a

PSGN_Parse_NoteReset:
		pop	af
		and	7
		or	0E0h
		ld	(SN76489_PSG), a
		ld	a, (ix+8)
		and	80h
		jr	PSGN_Parse_SetKeyOn
; ---------------------------------------------------------------------------

PSGN_Parse_KeepInstr:
		ld	a, (ix+8)
		or	1

PSGN_Parse_SetKeyOn:
		ld	(ix+8),	a
		ld	a, (de)
		bit	7, a
		jr	nz, PSGN_Parse_DurationByte
		ld	a, (ix+7)
		jr	PSGN_Parse_StoreEvent
; ---------------------------------------------------------------------------

PSGN_Parse_DurationByte:
		inc	de
		ld	a, (de)
		ld	(ix+7),	a

PSGN_Parse_StoreEvent:
		ld	(ix+2),	a
		inc	de
		ld	(ix+1),	d
		ld	(ix+0),	e
		jp	PSGN_ParseData_Channel
; ---------------------------------------------------------------------------

PSGN_Parse_HeldNote:
		dec	(ix+2)
		call	PSG_GetInstrumentPointer
		ld	b, (hl)
		bit	7, b
		jr	nz, PSGN_Env_NoAdvance
		inc	a
		ld	(ix+12h), a

PSGN_Env_NoAdvance:
		res	7, b
		ld	a, 0Fh
		sub	b
		ld	b, a
		ld	a, (ix+4)
		sub	b
		jr	nc, PSGN_Env_LevelClamp
		xor	a

PSGN_Env_LevelClamp:
		ld	b, a
		ld	a, (MUSIC_LEVEL)
		add	a, b
		sub	0Fh
		jr	nc, PSGN_Env_Store
		xor	a

PSGN_Env_Store:
		ld	(ix+5),	a
		ld	b, (ix+8)
		ld	a, (ix+2)
		or	a
		jr	z, Release_Key
		bit	7, b
		jr	nz, PSGN_Parse_ApplyFade
		cp	(ix+6)
		jr	nz, PSGN_Parse_ApplyFade

Release_Key:
		ld	a, b
		or	a
		jr	nz, PSGN_Parse_ApplyFade
		ld	c, 1

PSGN_Env_KeyOff:
		ld	(ix+1Eh), c
		or	2
		ld	(ix+8),	a

PSGN_Env_SkipLoop:
		call	PSG_GetInstrumentPointer
		ld	a, (hl)
		and	80h
		jr	nz, PSGN_Env_SkipDone
		inc	(ix+12h)
		jr	PSGN_Env_SkipLoop
; ---------------------------------------------------------------------------

PSGN_Env_SkipDone:
		inc	(ix+12h)

PSGN_Parse_ApplyFade:
		ld	a, (FADE_OUT_TIMER)
		or	a
		jr	nz, Transmit_Attenuation
		ld	a, (ix+4)
		or	a
		jr	z, Transmit_Attenuation
		dec	a
		ld	(ix+4),	a

Transmit_Attenuation:
		ld	a, 0Fh
		sub	(ix+5)
		or	0F0h
		ld	(SN76489_PSG), a
		ret

; Command FCh (FM): sets portamento speed, turns portamento off (operand FFh),
; or sets the note key-off timing, depending on the operand.
YM1_SetSlideOrKeyRelease:
		inc	de
		ld	a, (de)
		cp	0FFh
		jr	nz, YM1_SetSlide_NotFF
		xor	a
		ld	(ix+1Fh), a
		inc	de
		ret
; ---------------------------------------------------------------------------

YM1_SetSlide_NotFF:
		cp	81h
		jr	c, SetKeyRelease_Store
		and	7Fh
		ld	(ix+1Fh), a
		inc	de
		ret

; Command FCh (DAC/PSG): reads the key-off timing byte (release count + hold bit).
SetRelease:
		inc	de
		ld	a, (de)

SetKeyRelease_Store:
		ld	c, a
		and	80h
		ld	(ix+8),	a
		ld	a, c
		and	7Fh
		ld	(ix+6),	a
		inc	de
		ret

; Command FBh: picks a pitch-effect (vibrato) table and its speed for the channel.
LoadVibrato:
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
		jr	z, LoadVibrato_Store
		dec	a

LoadVibrato_Store:
		ld	(ix+9),	a
		inc	de
		ret

; Command FAh (FM part 1): writes the channel's stereo/pan bits to register B4h.
YM1_SetStereo:

		inc	de
		ld	a, (de)
		bit	0, a
		jr	nz, YM1_SetStereo_Ignore
		and	0C0h
		ld	c, a
		ld	b, 0B4h
		ld	a, (iy+0)
		add	a, b
		ld	b, a
		inc	de
		jp	YM1_Input

; Command FAh (FM part 2 / DAC): writes the channel's stereo/pan bits (register B4h).
YM2_SetStereo:
		inc	de
		ld	a, (de)
		and	0C0h
		ld	(ix+1Eh), a
		ld	c, a
		ld	b, 0B4h
		ld	a, (iy+0)
		add	a, b
		ld	b, a
		inc	de
		jp	YM2_ConditionalInput

; ---------------------------------------------------------------------------

YM1_SetStereo_Ignore:
		ld	a, (USELESS_BYTE)
		inc	a
		ld	(USELESS_BYTE),	a
		inc	de
		ret

; Command F9h: sets the channel's note transpose (semitones) and fine detune.
LoadNoteShift:
		inc	de
		ld	a, (de)
		and	8Fh
		bit	7, a
		jr	z, LoadNoteShift_Store
		or	0F0h

LoadNoteShift_Store:
		ld	(ix+1Ch), a
		ld	a, (de)
		rrca
		rrca
		rrca
		and	0Eh
		ld	(ix+1Dh), a
		inc	de
		ret

; Command F8h: the loop/marker sub-commands (top 3 bits of the operand) - set
; or recall a loop point, run a counted repeat, or take a play-once jump.
ParseLoopCommand:
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

_LoopCmd20:
		cp	1
		jr	nz, _LoopCmd40
		ld	(ix+15h), e
		ld	(ix+16h), d
		xor	a
		ld	(ix+1Ah), a
		ld	(ix+1Bh), a
		ret
; ---------------------------------------------------------------------------

_LoopCmd40:
		cp	2
		jr	nz, _LoopCmd60
		ld	a, (ix+1Ah)
		or	a
		jr	nz, LoopCmd40_Scan
		ld	a, 1
		ld	(ix+1Ah), a
		ret
; ---------------------------------------------------------------------------

LoopCmd40_Scan:
		ld	a, (de)
		ld	b, a
		inc	de
		ld	a, (de)
		ld	c, a
		inc	de
		ld	a, b
		cp	0FFh
		jr	z, LoopCmd_Rewind2
		cp	0F8h
		jr	z, LoopCmd40_CheckEnd
		and	80h
		jr	nz, LoopCmd40_Scan
		dec	de
		jr	LoopCmd40_Scan
; ---------------------------------------------------------------------------

LoopCmd40_CheckEnd:
		ld	a, c
		cp	60h
		jr	nz, LoopCmd40_Scan

LoopCmd_Rewind2:
		dec	de
		dec	de
		ret
; ---------------------------------------------------------------------------

_LoopCmd60:
		cp	3
		jr	nz, _LoopCmd80
		ld	a, (ix+1Bh)
		or	a
		jr	nz, LoopCmd60_Scan
		ld	a, 1
		ld	(ix+1Bh), a
		ret
; ---------------------------------------------------------------------------

LoopCmd60_Scan:
		ld	a, (de)
		ld	b, a
		inc	de
		ld	a, (de)
		ld	c, a
		inc	de
		ld	a, b
		cp	0FFh
		jr	z, LoopCmd_Rewind2
		cp	0F8h
		jr	z, LoopCmd60_CheckEnd
		and	80h
		jr	nz, LoopCmd60_Scan
		dec	de
		jr	LoopCmd60_Scan
; ---------------------------------------------------------------------------

LoopCmd60_CheckEnd:
		ld	a, c
		cp	80h
		jr	nz, LoopCmd60_Scan
		jr	LoopCmd_Rewind2
; ---------------------------------------------------------------------------

_LoopCmd80:
		cp	4
		jr	nz, _LoopCmdA0
		ret
; ---------------------------------------------------------------------------

_LoopCmdA0:
		cp	5
		jr	nz, _LoopCmdC0
		bit	0, b
		jr	nz, LoopCmdA0_Alt
		ld	e, (ix+15h)
		ld	d, (ix+16h)
		ret
; ---------------------------------------------------------------------------

LoopCmdA0_Alt:
		ld	e, (ix+13h)
		ld	d, (ix+14h)
		ret
; ---------------------------------------------------------------------------

_LoopCmdC0:
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

_LoopCmdE0:
		dec	(ix+19h)
		ret	z
		ld	e, (ix+17h)
		ld	d, (ix+18h)
		ret

; Command FDh and the auto-fade timeout: begin a gradual fade-out; StopMusic
; runs once it completes.
FadeOut:
		ld	a, 12h
		ld	(FADE_OUT_LENGTH), a
		ld	a, 1
		ld	(CURRENTLY_FADING_OUT),	a
		ld	a, (FADE_OUT_LENGTH)
		ld	(FADE_OUT_TIMER), a
		ret
