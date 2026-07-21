# Landstalker Sound Driver — Music & SFX Data Format

This describes the data consumed by the Cube/Iwadare Z80 sound driver
(`code/audio/sounddrv.asm`). It covers how a track is triggered and located,
the track/SFX headers, and the per-channel event streams (notes, rests and
every `F8h`–`FFh` command, including the loop commands).

Numbers are hexadecimal unless noted. Multi-byte values are **little-endian**.

---

## 1. Triggering playback

The 68000 controls the driver through a single command byte, `NEW_OPERATION`,
at the very top of Z80 sound RAM (`1FFFh`). The driver's `Main` reads it and
dispatches:

| Value      | Action                                             |
|------------|----------------------------------------------------|
| `FFh`      | Mute (key-off every channel, silence the PSG)      |
| `FEh`      | Stop the music                                      |
| `FDh`      | Fade the music out                                 |
| `F0h`      | Set the music volume (low nibble → `MUSIC_LEVEL`)  |
| `41h`–`FF` | Play the sound effect with that id                 |
| `01h`–`40h`| Play the music track with that id                  |
| `00h`      | Idle (no request)                                  |

A few related bytes just below it (`FADE_IN_PARAMETERS`, `MUSIC_LEVEL`,
`NEW_SAMPLE_TO_LOAD`) are also written by the 68000; see `code/audio/ram.asm`.

---

## 2. Locating a track or effect

Ids are turned into a pointer through a table of 16-bit little-endian pointers:

- **Music `01h`–`40h`** index a per-bank song table. Ids up to `20h` use one
  music bank, `21h`–`40h` another; the driver pages the bank in and reads the
  pointer for that id. Each pointer targets a **music header** (§3). The song
  tables and track data live in the swappable sound banks
  (`code/audio/soundbank3.asm`, `soundbank4.asm`).
- **SFX `41h`+** index `pt_SFX` in the resident driver
  (`code/audio/sfx.asm`): entry `id - 41h` → a **SFX header** (§4). SFX ids run
  `41h`–`7Ah` (`SFX_01`–`SFX_3A`).

---

## 3. Music track header

Found at the pointer for a music id:

| Offset | Size | Field                                                        |
|--------|------|--------------------------------------------------------------|
| `+0`   | 1    | `00h` for a music track (a non-zero value reroutes it to the SFX loader) |
| `+1`   | 2    | Auto-fade timeout in frames → `MUSIC_AUTOFADE_TIMER`; `0000h` = never auto-fades |
| `+3`   | 1    | Tempo: written to YM2612 Timer B (register `26h`) as *value + 3* |
| `+4`   | 2×10 | Ten pointers to the channel event streams (§5)               |

The ten channel pointers are, in order:

```
FM 1, FM 2, FM 3, FM 4, FM 5, DAC (channel 6), PSG tone 1, PSG tone 2,
PSG tone 3, PSG noise
```

(The driver enables the YM2612 DAC on channel 6 at track load, so slot 6 plays
samples rather than FM tones — the data files usually label it `..._YM6`.)

Example (`music/music01.asm`, "Torchlight"):

```
        db 0, 0, 0, 186        ; music, no auto-fade, tempo 186 (+3)
        dw MUSIC_01_YM1        ; ten channel-stream pointers
        dw MUSIC_01_YM2
        ...
        dw MUSIC_01_PSG3       ; 10th = noise (here reusing PSG3's data)
```

---

## 4. SFX header

| Offset | Size | Field                                             |
|--------|------|---------------------------------------------------|
| `+0`   | 1    | Type: `1` = full effect, anything else = overlay  |
| `+1`   | 2×N  | N channel-stream pointers                          |

- **Type 1** provides all **ten** pointers, in the same order as a music track,
  and takes over every channel.
- **Type 2** (overlay) provides **three** pointers that play on FM channels
  4–6 *on top of* the music, using the `SFX_TYPE_2_*` channel slots. These are
  the incidental effects that don't interrupt the score.

A channel pointer whose stream begins with `FFh` is left untouched (the channel
keeps doing whatever it was). The idiom for "this channel is unused" is a stream
of `FF 00 00` (an immediate end — see §5.3).

Example (`sfx/sfx01_header.asm`, "Skeleton Talk"):

```
        db 2                   ; overlay effect
        dw SFX_01_NOOP         ; FM 4 unused
        dw SFX_01_YM5          ; FM 5 plays
        dw SFX_01_NOOP         ; FM 6 unused
```

---

## 5. Channel event streams

Each channel points at a byte stream. Its parser walks the stream, acting on
one **event** per call and stopping when it has consumed a note/rest (whose
duration then holds the channel for that many ticks). A byte whose top five bits
are all set (`F8h`–`FFh`) is a **command**; any other byte begins a **note
event**.

### 5.1 Note & rest events

```
  note byte:  d ppppppp   [ duration ]
```

- `ppppppp` (bits 0–6) = **pitch** `00h`–`6Fh`, or `70h` = **rest** (a pause:
  no new note is started; any sounding note continues to release).
- `d` (bit 7) = **duration flag**. If set, one **duration byte** follows and
  becomes the new default. If clear, the previous duration is reused (so a run
  of same-length notes needs no duration bytes).
- The duration byte is the note/rest length in ticks.

Pitch handling differs by channel:

| Channel    | A pitch value means…                                                        |
|------------|------------------------------------------------------------------------------|
| FM 1–5     | Index into `t_YM_FREQUENCIES` (after adding transpose and fine detune)       |
| DAC (ch 6) | A **sample id**: sample `value + 1` is triggered (`70h` = rest / silence)     |
| PSG tone   | Index into `t_PSG_FREQUENCIES` (after transpose, minus `15h`)                |
| PSG noise  | The low 3 bits are the **noise mode** written to the PSG noise register       |

The frequency tables are a chromatic scale starting at C, so a pitch byte is
`octave × 12 + semitone`.

### 5.2 Command set

The low 3 bits of an `F8h`–`FFh` byte select the command. Which commands a
channel understands depends on its type; an unrecognised command on a channel
simply skips two bytes.

| Byte  | FM 1–5          | DAC (ch 6) | PSG tone          | PSG noise         |
|-------|-----------------|------------|-------------------|-------------------|
| `FFh` | end / jump      | end / jump | end / jump        | end / jump        |
| `FEh` | set instrument  | —          | —                 | —                 |
| `FDh` | set volume      | —          | set envelope+vol  | set envelope+vol  |
| `FCh` | slide / key-off | key-off    | key-off           | key-off           |
| `FBh` | vibrato         | —          | vibrato           | —                 |
| `FAh` | stereo / pan    | stereo     | **set tempo**     | —                 |
| `F9h` | note shift      | —          | note shift        | —                 |
| `F8h` | loop command    | loop       | loop              | loop              |

### 5.3 Command details

**`FFh` — end / jump** (2-byte operand `lo hi`):
- `hi ≠ 0`: **jump** to the 16-bit address `hi:lo` and keep parsing. Used to
  loop a track back to an earlier point.
- `0000h`: **end** — the channel is marked finished and goes silent.
- `00 LL` (`hi = 0`, `lo ≠ 0`): end the channel **and** post `LL` as a new
  `NEW_OPERATION` command (e.g. chain into another track).

**`FEh` — set instrument** (FM only, 1-byte operand): selects the FM patch
(`YM_INSTMT_nn`) used from the next note on.

**`FDh` — set volume / instrument:**
- FM: operand's low nibble → channel volume (`0` = loudest … `Fh`), re-applied
  to the operators.
- PSG: operand high nibble selects the amplitude envelope
  (`pt_PSG_INSTRUMENTS`), low nibble sets the channel volume.

**`FCh` — slide / key-off** (1-byte operand). On FM the operand chooses between
portamento and key-off timing:
- `FFh` → portamento **off**.
- `81h`–`FEh` → **portamento speed** = operand `AND 7Fh` (the channel now slides
  toward each new note instead of jumping).
- `00h`–`80h` → **key-off timing**: bits 0–6 are the release point (the note is
  released when its remaining duration reaches this count), and bit 7 requests
  **hold** (tie/legato — never auto key-off).

On DAC/PSG the operand is just the key-off byte (release count + hold bit).

**`FBh` — vibrato** (1-byte operand): selects one of the pitch-effect tables
(`pt_PITCH_EFFECTS`) and its speed. Table `0` is flat (no vibrato).

**`FAh` — stereo / tempo** (1-byte operand):
- FM / DAC: **stereo/pan** — bits 6–7 (L/R enable) are written to YM2612
  register `B4h` for the channel. (Bit 0 set makes the command a no-op.)
- PSG tone: **set tempo** — the operand is written to YM2612 Timer B
  (register `26h`), changing the playback speed mid-track.

**`F9h` — note shift** (1-byte operand): sets the channel transpose in semitones
(sign-extended from the low nibble) and a fine detune (bits 4–6), added to every
following note's frequency.

**`F8h` — loop command:** see §5.4.

### 5.4 Loop commands (`F8h`)

`F8h` is followed by one **control byte**; its top 3 bits select a sub-command
and (for some) the low bits carry a parameter. Each channel keeps two loop
"markers" (A and B), a counted-loop return point with a counter, and two
one-shot flags.

Markers A and B are also known as "loop point 1" and "loop point 2", and the
counted-loop return as "loop point 3", in lordmir's `MUSIC_FORMAT.md` (§7).

| Control byte | Sub-command                                                            |
|--------------|------------------------------------------------------------------------|
| `00h`–`1Fh`  | **Set marker A** (loop point 1) — remember the current position        |
| `20h`–`3Fh`  | **Set marker B** (loop point 2) — remember the current position and clear both one-shot flags |
| `40h`–`5Fh`  | **Play-once section A** — on the first pass, continue (play the section); on later passes, skip forward to the next `F8 60` (or track end) |
| `60h`–`7Fh`  | **Play-once section B** — on the first pass, continue; on later passes, skip forward to the next `F8 80` (or end). Also the closing marker for a section-A block |
| `80h`–`9Fh`  | **No-op** — a plain marker; closes a section-B block                    |
| `A0h`–`BFh`  | **Jump to a marker** — to marker B (`A0h`), or to marker A (`A1h`) if bit 0 of the control byte is set |
| `C0h`–`DFh`  | **Begin counted loop** — save the return point (loop point 3); repeat count = (control byte `AND 1Fh`) + 1 |
| `E0h`–`FFh`  | **End counted loop** — decrement the counter; if not exhausted, jump back to the matching `C0`–`DF` (loop point 3), otherwise fall through |

Typical use:

- **Infinite loop:** `F8 20` (set marker B) at the loop point, then `F8 A0`
  (jump to marker B) at the end. The `F8 20` also clears the one-shot flags so
  play-once intros re-arm if the whole track is ever restarted.
- **First-time-only intro:** wrap it in `F8 40 … F8 60`. The first time through
  it plays; once the section-A flag is set, later passes skip straight past it.
  Nesting a second one-shot uses `F8 60 … F8 80`.
- **Counted repeat:** `F8 Cn … F8 En` repeats the enclosed events *n+1* times
  (n = low 5 bits of the `Cn` byte).

---

## 6. Related tables

The parsers and loaders draw on several data tables, each documented where it
is defined:

- `code/audio/instrument_params.asm` — note-frequency tables, the volume→
  attenuation curve, FM algorithm carrier masks, and the vibrato / PSG-envelope
  tables.
- `code/audio/ym_instruments.asm` — the 29-byte FM instrument patches.
- `code/audio/samples.asm` — the DAC sample directory.
- `code/audio/channel_data.asm` — the per-channel runtime state block (the
  `(ix+N)` fields the parsers read and write).
- `code/audio/vars.asm`, `ram.asm` — the driver's variables.

