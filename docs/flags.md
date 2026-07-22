# Game progress flags

Generated summary of every game-progress flag in the ROM. The
authoritative definitions live in
[`code/include/constants/flags.inc`](../code/include/constants/flags.inc);
this document summarises coverage and lists what is unused.

## Storage and encoding

One 64-byte block of work RAM, split by `ram.inc` into two labels:

| Label | Address | Flag bytes | Ids |
| --- | --- | --- | --- |
| `g_Flags` | `$FF1000` | `$00`-`$1F` | `$000`-`$0FF` |
| `g_AdditionalFlags` | `$FF1020` | `$20`-`$3F` | `$100`-`$1FF` |

A flag id packs the byte and bit as `id = (byte << 3) | bit`. This is
what `ConvertFlagNumberToBit` expects in `d0`, and the same encoding
used by script, behaviour and room-table data. Because
`g_AdditionalFlags` is `g_Flags+$20`, ids `$100`+ need no special case:
`g_Flags+(id>>3)` addresses both halves.

Behaviour scripts are the one exception - they store the byte and bit
as two separate script bytes (`LoadFlagCmdArgs`), reassembled to the
same packing.

## Where flags are referenced

| Source | Distinct ids |
| --- | --- |
| direct code (macros) | 82 |
| script/dialogue helpers | 65 |
| GetFlagProgress tables | 34 |
| packed script table | 23 |
| behaviour scripts | 245 |
| room flag-action tables | 259 |
| debug chapter list | 43 |
| **Union** | **368** |

Every referenced id is named in `flags.inc`, and every constant in
`flags.inc` has at least one reference - the two sets match exactly.

## Coverage map

`#` = referenced, `.` = free, `C` = occupied by a counter/word field.
Bit 0 is leftmost.

| Byte | Ids | Bits 0-7 | Used | Notes |
| --- | --- | --- | --- | --- |
| `g_Flags+$00` | `$000`-`$007` | `#.######` | 7 |  |
| `g_Flags+$01` | `$008`-`$00F` | `########` | 8 | volatile scratch, cleared every room load |
| `g_Flags+$02` | `$010`-`$017` | `########` | 8 |  |
| `g_Flags+$03` | `$018`-`$01F` | `########` | 8 |  |
| `g_Flags+$04` | `$020`-`$027` | `########` | 8 |  |
| `g_Flags+$05` | `$028`-`$02F` | `########` | 8 |  |
| `g_Flags+$06` | `$030`-`$037` | `.######.` | 6 |  |
| `g_Flags+$07` | `$038`-`$03F` | `..######` | 6 |  |
| `g_Flags+$08` | `$040`-`$047` | `.#######` | 7 |  |
| `g_Flags+$09` | `$048`-`$04F` | `.######.` | 6 |  |
| `g_Flags+$0A` | `$050`-`$057` | `#####..#` | 6 |  |
| `g_Flags+$0B` | `$058`-`$05F` | `###.####` | 7 |  |
| `g_Flags+$0C` | `$060`-`$067` | `#######.` | 7 |  |
| `g_Flags+$0D` | `$068`-`$06F` | `#######.` | 7 |  |
| `g_Flags+$0E` | `$070`-`$077` | `########` | 8 |  |
| `g_Flags+$0F` | `$078`-`$07F` | `########` | 8 |  |
| `g_Flags+$10` | `$080`-`$087` | `########` | 8 |  |
| `g_Flags+$11` | `$088`-`$08F` | `########` | 8 |  |
| `g_Flags+$12` | `$090`-`$097` | `########` | 8 |  |
| `g_Flags+$13` | `$098`-`$09F` | `#####CCC` | 5 | vase counter in bits 5-7 |
| `g_Flags+$14` | `$0A0`-`$0A7` | `########` | 8 |  |
| `g_Flags+$15` | `$0A8`-`$0AF` | `########` | 8 |  |
| `g_Flags+$16` | `$0B0`-`$0B7` | `########` | 8 |  |
| `g_Flags+$17` | `$0B8`-`$0BF` | `########` | 8 |  |
| `g_Flags+$18` | `$0C0`-`$0C7` | `####..##` | 6 |  |
| `g_Flags+$19` | `$0C8`-`$0CF` | `########` | 8 |  |
| `g_Flags+$1A` | `$0D0`-`$0D7` | `###.##.#` | 6 |  |
| `g_Flags+$1B` | `$0D8`-`$0DF` | `.#######` | 7 |  |
| `g_Flags+$1C` | `$0E0`-`$0E7` | `########` | 8 |  |
| `g_Flags+$1D` | `$0E8`-`$0EF` | `#.......` | 1 |  |
| `g_Flags+$1E` | `$0F0`-`$0F7` | `........` | 0 |  |
| `g_Flags+$1F` | `$0F8`-`$0FF` | `........` | 0 |  |
| `g_AdditionalFlags+$00` | `$100`-`$107` | `########` | 8 |  |
| `g_AdditionalFlags+$01` | `$108`-`$10F` | `#####...` | 5 |  |
| `g_AdditionalFlags+$02` | `$110`-`$117` | `########` | 8 |  |
| `g_AdditionalFlags+$03` | `$118`-`$11F` | `########` | 8 |  |
| `g_AdditionalFlags+$04` | `$120`-`$127` | `########` | 8 |  |
| `g_AdditionalFlags+$05` | `$128`-`$12F` | `####....` | 4 |  |
| `g_AdditionalFlags+$06` | `$130`-`$137` | `########` | 8 |  |
| `g_AdditionalFlags+$07` | `$138`-`$13F` | `########` | 8 |  |
| `g_AdditionalFlags+$08` | `$140`-`$147` | `########` | 8 |  |
| `g_AdditionalFlags+$09` | `$148`-`$14F` | `#######.` | 7 |  |
| `g_AdditionalFlags+$0A` | `$150`-`$157` | `########` | 8 |  |
| `g_AdditionalFlags+$0B` | `$158`-`$15F` | `########` | 8 |  |
| `g_AdditionalFlags+$0C` | `$160`-`$167` | `######.#` | 7 |  |
| `g_AdditionalFlags+$0D` | `$168`-`$16F` | `........` | 0 |  |
| `g_AdditionalFlags+$0E` | `$170`-`$177` | `########` | 8 |  |
| `g_AdditionalFlags+$0F` | `$178`-`$17F` | `########` | 8 |  |
| `g_AdditionalFlags+$10` | `$180`-`$187` | `##......` | 2 |  |
| `g_AdditionalFlags+$11` | `$188`-`$18F` | `CCCCCCCC` | 0 | chicken-toss round count |
| `g_AdditionalFlags+$12` | `$190`-`$197` | `########` | 8 |  |
| `g_AdditionalFlags+$13` | `$198`-`$19F` | `#.......` | 1 |  |
| `g_AdditionalFlags+$14` | `$1A0`-`$1A7` | `########` | 8 |  |
| `g_AdditionalFlags+$15` | `$1A8`-`$1AF` | `###.....` | 3 |  |
| `g_AdditionalFlags+$16` | `$1B0`-`$1B7` | `........` | 0 |  |
| `g_AdditionalFlags+$17` | `$1B8`-`$1BF` | `........` | 0 |  |
| `g_AdditionalFlags+$18` | `$1C0`-`$1C7` | `########` | 8 |  |
| `g_AdditionalFlags+$19` | `$1C8`-`$1CF` | `#....#.#` | 3 |  |
| `g_AdditionalFlags+$1A` | `$1D0`-`$1D7` | `CCCCCCCC` | 0 | Fahl win count |
| `g_AdditionalFlags+$1B` | `$1D8`-`$1DF` | `CCCCCCCC` | 0 | chicken-toss record |
| `g_AdditionalFlags+$1C` | `$1E0`-`$1E7` | `CCCCCCCC` | 0 | Greenpea winnings (word, low) |
| `g_AdditionalFlags+$1D` | `$1E8`-`$1EF` | `CCCCCCCC` | 0 | Greenpea winnings (word, high) |
| `g_AdditionalFlags+$1E` | `$1F0`-`$1F7` | `########` | 8 |  |
| `g_AdditionalFlags+$1F` | `$1F8`-`$1FF` | `####....` | 4 |  |

## Unused flags

| | Count |
| --- | --- |
| Total ids (64 bytes x 8) | 512 |
| Referenced and named | 368 |
| Unreferenced | 144 |
| ...of those, occupied by counter/word fields | 43 |
| ...of those, in the volatile scratch byte | 0 |
| **Genuinely free for new state** | **101** |

### Wholly unused bytes

These five bytes have no reference of any kind - no bit access, no
byte access, nothing. They sit inside the SRAM-saved region, so they
persist across save/load.

| Byte | Ids | Free bits |
| --- | --- | --- |
| `g_Flags+$1E` | `$0F0`-`$0F7` | 8 |
| `g_Flags+$1F` | `$0F8`-`$0FF` | 8 |
| `g_AdditionalFlags+$0D` | `$168`-`$16F` | 8 |
| `g_AdditionalFlags+$16` | `$1B0`-`$1B7` | 8 |
| `g_AdditionalFlags+$17` | `$1B8`-`$1BF` | 8 |

### Scattered free bits

Individual unused bits inside bytes that are otherwise in use.

| Byte | Free bits | Ids |
| --- | --- | --- |
| `g_Flags+$00` | 1 | `$001` |
| `g_Flags+$06` | 0, 7 | `$030` `$037` |
| `g_Flags+$07` | 0, 1 | `$038` `$039` |
| `g_Flags+$08` | 0 | `$040` |
| `g_Flags+$09` | 0, 7 | `$048` `$04F` |
| `g_Flags+$0A` | 5, 6 | `$055` `$056` |
| `g_Flags+$0B` | 3 | `$05B` |
| `g_Flags+$0C` | 7 | `$067` |
| `g_Flags+$0D` | 7 | `$06F` |
| `g_Flags+$18` | 4, 5 | `$0C4` `$0C5` |
| `g_Flags+$1A` | 3, 6 | `$0D3` `$0D6` |
| `g_Flags+$1B` | 0 | `$0D8` |
| `g_Flags+$1D` | 1, 2, 3, 4, 5, 6, 7 | `$0E9` `$0EA` `$0EB` `$0EC` `$0ED` `$0EE` `$0EF` |
| `g_AdditionalFlags+$01` | 5, 6, 7 | `$10D` `$10E` `$10F` |
| `g_AdditionalFlags+$05` | 4, 5, 6, 7 | `$12C` `$12D` `$12E` `$12F` |
| `g_AdditionalFlags+$09` | 7 | `$14F` |
| `g_AdditionalFlags+$0C` | 6 | `$166` |
| `g_AdditionalFlags+$10` | 2, 3, 4, 5, 6, 7 | `$182` `$183` `$184` `$185` `$186` `$187` |
| `g_AdditionalFlags+$13` | 1, 2, 3, 4, 5, 6, 7 | `$199` `$19A` `$19B` `$19C` `$19D` `$19E` `$19F` |
| `g_AdditionalFlags+$15` | 3, 4, 5, 6, 7 | `$1AB` `$1AC` `$1AD` `$1AE` `$1AF` |
| `g_AdditionalFlags+$19` | 1, 2, 3, 4, 6 | `$1C9` `$1CA` `$1CB` `$1CC` `$1CE` |
| `g_AdditionalFlags+$1F` | 4, 5, 6, 7 | `$1FC` `$1FD` `$1FE` `$1FF` |

All eight bits of the volatile scratch byte (`$008`-`$00F`) are
referenced, but none of them count as usable state: `mapload` clears
that byte on every room load, so nothing there survives a transition.

## Byte and word fields

Parts of the block hold counters and packed values rather than
independent bits. They are named `FLAGBYTE_*` / `FLAGWORD_*` and are
offsets relative to `g_Flags`.

| Field | Offset | Meaning |
| --- | --- | --- |
| `FLAGBYTE_EARLY_STORY` | `$00` | intro, Massan, Swamp Shrine, Thieves |
| `FLAGBYTE_SCRATCH` | `$01` | per-room scratch, see ids $008-$00F |
| `FLAGBYTE_GUMI_PROGRESS` | `$02` | Massan/Waterfall/Gumi/Swamp/Ryuma; |
| `FLAGBYTE_MERCATOR_PROGRESS` | `$05` | Mercator arrival and castle steps; |
| `FLAGBYTE_DOORS_1` | `$08` | door unlocks $041-$047; cleared |
| `FLAGBYTE_DOORS_2` | `$09` | door unlocks $049-$04E; also cleared |
| `FLAGBYTE_VASE_COUNTER` | `$13` | bits 5-7: Old Woman's House vase task |
| `FLAGBYTE_CRYPT_GHOSTS` | `$15` | the eight ghost bits; $FF when done |
| `FLAGBYTE_CHICKEN_TOSS_COUNT` | `$31` | chickens returned this round; cleared |
| `FLAGBYTE_FAHL_WINS` | `$3A` | dojo wins; milestones at 5/10/20/30/ |
| `FLAGBYTE_CHICKEN_TOSS_BEST` | `$3B` | best round; seeded to 3 on a new game, |
| `FLAGWORD_GREENPEA_WINNINGS` | `$3C` | word: net gold won at Greenpea; the |


## Flag reference

Every named flag, with where it is read and written. Sources:

- `file:line` - a `TestFlag` / `SetFlag` / `ClearFlag` macro in code
- `dialogue branch` - `CheckFlagAndDisplayMessage` in a language script
- `talk-once script` - `SetFlagBitOnTalking` (tests, then sets on first talk)
- `script test` / `script set` - `TestFlagBit` / `SetFlagBit` with an id in `d0`
- `progress table` - `GetFlagProgress` via `PickValueBasedOnFlags`
- `script table` - the packed `SetFlag` command in `assets_packed/script/*.bin`
- `behaviour xN` - entity behaviour script opcodes, N occurrences
- `<Table> (rm N)` - a room flag-action table keyed on that room
- `debug menu` - set by the debug chapter warp (`FlagsToSet`)

| Id | Name | Read by | Written by |
| --- | --- | --- | --- |
| `$000` | `FLAG_INTRO_DONE` | OneTimeEvent (rm 592,593+); RoomGfxSwap (rm 177,425); SpriteVisibility (rm 425,592+); +2 more | script table x5; debug menu |
| `$002` | `FLAG_ROOM_012_A` | PermanentSwitch (rm 12); behaviour x2 | behaviour x1 |
| `$003` | `FLAG_THIEVES_GODDESS_STATUE` | RoomTransition (rm 185,192+) | dialogueactions.asm:393 |
| `$004` | `FLAG_MASSAN_RESCUE_DONE` | LockedDoorGfxSwap (rm 160); customroomactions1.asm:100; spritefuncs2.asm:76 | UnlockDoorTileSwap; dialogueactions.asm:382 |
| `$005` | `FLAG_NOLE_CAVE_OUTSIDE` | behaviour x1; triggeractions.asm:284 | dialogueactions.asm:249 |
| `$006` | `FLAG_SWAMP_SHRINE_OPENED` | RoomGfxSwap (rm 433); items3.asm:251 | debug menu; items3.asm:460 |
| `$007` | `FLAG_MASSAN_MAYOR_SLEEP` | customroomactions1.asm:93 (tst.b bit 7) | debug menu; dialogueactions.asm:372 |
| `$008` | `FLAG_SCRATCH_EVENT_DONE` | behaviour x134; dialogue branch; script test; +2 more | script table x5; behaviour x82; combat.asm:742; +32 more |
| `$009` | `FLAG_SCRATCH_BIT1` | behaviour x67; dialogueactions.asm:870; dialogueactions.asm:894; +1 more | behaviour x49; dialogueactions.asm:1936; dialogueactions.asm:1946; +2 more |
| `$00A` | `FLAG_SCRATCH_BIT2` | behaviour x33; dialogueactions.asm:873; dialogueactions.asm:897; +2 more | behaviour x37; dialogueactions.asm:3263; dialogueactions.asm:4325; +3 more |
| `$00B` | `FLAG_SCRATCH_BIT3` | behaviour x25; dialogueactions.asm:4355; dialogueactions.asm:900; +1 more | behaviour x23; dialogueactions.asm:3908; mapload.asm:157 (clr.b every room load); +3 more |
| `$00C` | `FLAG_SCRATCH_BIT4` | behaviour x14 | behaviour x19; mapload.asm:157 (clr.b every room load) |
| `$00D` | `FLAG_SCRATCH_BIT5` | behaviour x8 | behaviour x12; mapload.asm:157 (clr.b every room load) |
| `$00E` | `FLAG_SCRATCH_BIT6` | behaviour x12; dialogueactions.asm:449/1243 (masked $C0) | behaviour x12; dialogueactions.asm:1761 (andi.b #$3F); mapload.asm:157 (clr.b every room load) |
| `$00F` | `FLAG_SCRATCH_BIT7` | behaviour x7; dialogueactions.asm:449/1243 (masked $C0); script test | script table x5; behaviour x11; dialogueactions.asm:1761 (andi.b #$3F); +1 more |
| `$010` | `FLAG_MASSAN_PROGRESS_10` | SpriteVisibility (rm 424); progress table | behaviour x1; debug menu |
| `$011` | `FLAG_WATERFALL_PROSPERO` | triggeractions.asm:179 | behaviour x1; debug menu |
| `$012` | `FLAG_GUMI_RITES_DONE` | OneTimeEvent (rm 592); SpriteVisibility (rm 425); customroomactions1.asm:32; +3 more | behaviour x1 |
| `$013` | `FLAG_ROOM_601` | triggeractions.asm:215 (masked $18) | behaviour x1 |
| `$014` | `FLAG_GUMI_DONE` | RoomTransition (rm 601); SpriteVisibility (rm 433,592); behaviour x3; +3 more | behaviour x1; debug menu |
| `$015` | `FLAG_SWAMP_SHRINE_BOSS_DEAD` | OneTimeEvent (rm 593,594+); RoomTransition (rm 601,602); SpriteVisibility (rm 433,604+); +4 more | behaviour x1; debug menu |
| `$016` | `FLAG_GUMI_LANDSLIDE_CLEARED` | SpriteVisibility (rm 449); customroomactions1.asm:48 | behaviour x1; debug menu |
| `$017` | `FLAG_RYUMA_PROGRESS_17` | SpriteVisibility (rm 610,613+); behaviour x1; progress table | behaviour x1; debug menu |
| `$018` | `FLAG_AXE_MAGIC_OBTAINED` | combat.asm:645 | script table x5; behaviour x1; debug menu |
| `$019` | `FLAG_ROOM_756` | PermanentSwitch (rm 756); RoomTransition (rm 752) | behaviour x1 |
| `$01A` | `FLAG_OLD_WOMAN_HOUSE_VISITED` | SpriteVisibility (rm 680); behaviour x1; dialogue branch; +1 more | behaviour x3; dialogueactions.asm:936 |
| `$01B` | `FLAG_JAR_LADY_MOVED` | SpriteVisibility (rm 694); behaviour x1; customroomactions1.asm:127; +1 more | behaviour x2 |
| `$01C` | `FLAG_PLAYER_IS_POCKETS` | mapload.asm:406; progress table | script table x5; dialogueactions.asm:1083; dialogueactions.asm:4217; +2 more |
| `$01D` | `FLAG_CASTLE_MERCATOR_DONE` | SpriteVisibility (rm 680,710); behaviour x4; progress table | behaviour x1; debug menu |
| `$01E` | `FLAG_FRIDAY_NAMED` | SpriteVisibility (rm 707); behaviour x2; dialogue branch | behaviour x1 |
| `$01F` | `FLAG_ROOM_051` | SpriteVisibility (rm 55,59); behaviour x1 | behaviour x1 |
| `$020` | `FLAG_LITHOGRAPH_PROGRESS_20` | SpriteVisibility (rm 183); behaviour x2; progress table | script table x5; debug menu |
| `$021` | `FLAG_THIEVES_HIDEOUT_DONE` | RoomCleared (rm 224); RoomGfxSwap (rm 533); RoomTransition (rm 224); +5 more | debug menu; dialogueactions.asm:1652 |
| `$022` | `FLAG_RYUMA_DONE` | SpriteVisibility (rm 449); progress table | script table x5; debug menu |
| `$023` | `FLAG_MERCATOR_ENTRY_GRANTED` | dialogueactions.asm:486; progress table; script test | script table x5; debug menu; dialogueactions.asm:443 |
| `$024` | `FLAG_ROOM_602` | SpriteVisibility (rm 602) | behaviour x1 |
| `$025` | `FLAG_ROOM_180` | PermanentSwitch (rm 180); behaviour x2 | behaviour x1 |
| `$026` | `FLAG_ROOM_183` | SpriteVisibility (rm 183); behaviour x1 | behaviour x1 |
| `$027` | `FLAG_MERCATOR_GATE_PASSED` | RoomGfxSwap (rm 454); behaviour x4 | debug menu; dialogueactions.asm:494 |
| `$028` | `FLAG_MERCATOR_FIRST_VISIT` | behaviour x2; dialogue branch | dialogueactions.asm:507 |
| `$029` | `FLAG_ROOM_633` | behaviour x3 | behaviour x1 |
| `$02A` | `FLAG_PURIN_MET` | dialogue branch | dialogueactions.asm:569 |
| `$02B` | `FLAG_ROOM_763` | PermanentSwitch (rm 763); behaviour x1 | behaviour x1 |
| `$02C` | `FLAG_CASTLE_PROGRESS_2C` | SpriteVisibility (rm 638); progress table | debug menu; script set |
| `$02D` | `FLAG_CASTLE_PROGRESS_2D` | SpriteVisibility (rm 633,680); behaviour x4; progress table | behaviour x1; debug menu |
| `$02E` | `FLAG_CASTLE_PROGRESS_2E` | SpriteVisibility (rm 685); progress table | script table x5; debug menu |
| `$02F` | `FLAG_FAHL_DUEL_ACTIVE` | behaviour x1; combat.asm:638 (tst.b bit 7); mapload.asm:261 (Z = prior state); +2 more | dialogueactions.asm:614; dialogueactions.asm:801; mapload.asm:261 |
| `$031` | `FLAG_DOOR_197` | LockedDoorGfxSwap (rm 197) | UnlockDoorTileSwap |
| `$032` | `FLAG_DOOR_217` | LockedDoorGfxSwap (rm 217) | UnlockDoorTileSwap |
| `$033` | `FLAG_DOOR_021` | LockedDoorSprite (rm 21) | UnlockDoor |
| `$034` | `FLAG_DOOR_001` | LockedDoorGfxSwap (rm 1) | UnlockDoorTileSwap |
| `$035` | `FLAG_DOOR_019` | LockedDoorGfxSwap (rm 19) | UnlockDoorTileSwap |
| `$036` | `FLAG_DOOR_030` | LockedDoorSprite (rm 30); RoomCleared (rm 30) | UnlockDoor |
| `$03A` | `FLAG_DOOR_038` | LockedDoorGfxSwap (rm 38) | UnlockDoorTileSwap |
| `$03B` | `FLAG_CRYPT_DEAD_AND_END` | LockedDoorGfxSwap (rm 650); dialogueactions.asm:3261 | UnlockDoorTileSwap; behaviour x1 |
| `$03C` | `FLAG_DOOR_317` | LockedDoorSprite (rm 317) | UnlockDoor |
| `$03D` | `FLAG_DOOR_306` | LockedDoorSprite (rm 306); RoomCleared (rm 306) | UnlockDoor |
| `$03E` | `FLAG_DOOR_638` | LockedDoorGfxSwap (rm 638) | UnlockDoorTileSwap |
| `$03F` | `FLAG_DOOR_179` | LockedDoorSprite (rm 179) | UnlockDoor |
| `$041` | `FLAG_DOOR_779` | LockedDoorGfxSwap (rm 779); gamelogic2.asm:40 (tst.b whole byte) | UnlockDoorTileSwap; dialogueactions.asm:3253 (clr.b whole byte) |
| `$042` | `FLAG_DOOR_228` | LockedDoorSprite (rm 228); gamelogic2.asm:40 (tst.b whole byte) | UnlockDoor; dialogueactions.asm:3253 (clr.b whole byte) |
| `$043` | `FLAG_BHV_043` | LockedDoorGfxSwap (rm 233); behaviour x1; gamelogic2.asm:40 (tst.b whole byte) | UnlockDoorTileSwap; dialogueactions.asm:3253 (clr.b whole byte) |
| `$044` | `FLAG_DOOR_283` | LockedDoorGfxSwap (rm 283); gamelogic2.asm:40 (tst.b whole byte) | UnlockDoorTileSwap; dialogueactions.asm:3253 (clr.b whole byte) |
| `$045` | `FLAG_DOOR_289` | LockedDoorGfxSwap (rm 289); gamelogic2.asm:40 (tst.b whole byte) | UnlockDoorTileSwap; dialogueactions.asm:3253 (clr.b whole byte) |
| `$046` | `FLAG_DOOR_288` | LockedDoorGfxSwap (rm 288); gamelogic2.asm:40 (tst.b whole byte) | UnlockDoorTileSwap; dialogueactions.asm:3253 (clr.b whole byte) |
| `$047` | `FLAG_DOOR_287` | LockedDoorGfxSwap (rm 287); gamelogic2.asm:40 (tst.b whole byte) | UnlockDoorTileSwap; dialogueactions.asm:3253 (clr.b whole byte) |
| `$049` | `FLAG_DOOR_364` | LockedDoorSprite (rm 364) | UnlockDoor; dialogueactions.asm:3254 (clr.b whole byte) |
| `$04A` | `FLAG_DOOR_330` | LockedDoorGfxSwap (rm 330) | UnlockDoorTileSwap; dialogueactions.asm:3254 (clr.b whole byte) |
| `$04B` | `FLAG_DOOR_341` | LockedDoorGfxSwap (rm 341) | UnlockDoorTileSwap; dialogueactions.asm:3254 (clr.b whole byte) |
| `$04C` | `FLAG_DOOR_416` | LockedDoorSprite (rm 416) | UnlockDoor; dialogueactions.asm:3254 (clr.b whole byte) |
| `$04D` | `FLAG_DOOR_390` | LockedDoorSprite (rm 390) | UnlockDoor; dialogueactions.asm:3254 (clr.b whole byte) |
| `$04E` | `FLAG_DOOR_376` | LockedDoorSprite (rm 376) | UnlockDoor; dialogueactions.asm:3254 (clr.b whole byte) |
| `$050` | `FLAG_ROOM_181` | RoomCleared (rm 181) | behaviour x2 |
| `$051` | `FLAG_ROOM_226_A` | RoomCleared (rm 226); RoomGfxSwap (rm 226); behaviour x1 | behaviour x1 |
| `$052` | `FLAG_SWAMP_EKEEKE_PRIZE_TAKEN` | RoomCleared (rm 7); customroomactions1.asm:217 | behaviour x1 |
| `$053` | `FLAG_SWAMP_ORC_CHALLENGE_DONE` | RoomCleared (rm 6); triggeractions.asm:121; triggeractions.asm:129; +1 more | behaviour x1 |
| `$054` | `FLAG_ROOM_019` | RoomCleared (rm 19) | behaviour x1 |
| `$057` | `FLAG_ROOM_012_B` | RoomCleared (rm 12) | behaviour x1 |
| `$058` | `FLAG_ROOM_190` | RoomCleared (rm 190); RoomGfxSwap (rm 190) | behaviour x1 |
| `$059` | `FLAG_ROOM_226_B` | - | behaviour x1 |
| `$05A` | `FLAG_ROOM_203` | RoomCleared (rm 203); RoomGfxSwap (rm 203) | behaviour x1 |
| `$05C` | `FLAG_ROOM_025` | RoomCleared (rm 25) | behaviour x1 |
| `$05D` | `FLAG_ROOM_050` | RoomCleared (rm 50) | behaviour x1 |
| `$05E` | `FLAG_ROOM_048` | RoomCleared (rm 48) | behaviour x1 |
| `$05F` | `FLAG_ROOM_252` | RoomCleared (rm 252) | behaviour x1 |
| `$060` | `FLAG_ROOM_247` | RoomCleared (rm 247) | behaviour x1 |
| `$061` | `FLAG_ROOM_268` | RoomCleared (rm 268) | behaviour x2 |
| `$062` | `FLAG_ROOM_091` | RoomCleared (rm 91); RoomGfxSwap (rm 91) | behaviour x2 |
| `$063` | `FLAG_ROOM_254` | RoomCleared (rm 254) | behaviour x1 |
| `$064` | `FLAG_ROOM_324` | RoomCleared (rm 324) | behaviour x1 |
| `$065` | `FLAG_ROOM_239` | RoomCleared (rm 350) | behaviour x2 |
| `$066` | `FLAG_FAHL_DUEL_AFTERMATH` | RoomCleared (rm 239) | dialogueactions.asm:802 |
| `$068` | `FLAG_ROOM_283` | RoomCleared (rm 283) | behaviour x1 |
| `$069` | `FLAG_ROOM_250` | RoomCleared (rm 250) | behaviour x1 |
| `$06A` | `FLAG_ROOM_228` | RoomCleared (rm 228) | behaviour x1 |
| `$06B` | `FLAG_ROOM_004` | RoomCleared (rm 4) | behaviour x1 |
| `$06C` | `FLAG_ROOM_565` | RoomCleared (rm 565) | behaviour x1 |
| `$06D` | `FLAG_ROOM_568` | RoomCleared (rm 568); behaviour x2 | behaviour x1 |
| `$06E` | `FLAG_ROOM_212` | RoomCleared (rm 212) | behaviour x1 |
| `$070` | `FLAG_BHV_070` | behaviour x1 | behaviour x1 |
| `$071` | `FLAG_ROOM_640` | PermanentSwitch (rm 640); RoomGfxSwap (rm 638) | behaviour x1 |
| `$072` | `FLAG_ROOM_576` | PermanentSwitch (rm 576); behaviour x1 | behaviour x1 |
| `$073` | `FLAG_ROOM_385_A` | PermanentSwitch (rm 385); behaviour x1 | behaviour x1 |
| `$074` | `FLAG_ROOM_385_B` | PermanentSwitch (rm 385); SpriteVisibility (rm 390); behaviour x1 | behaviour x1 |
| `$075` | `FLAG_ROOM_347` | PermanentSwitch (rm 347); SpriteVisibility (rm 330,334); behaviour x2 | behaviour x1 |
| `$076` | `FLAG_ROOM_810_A` | PermanentSwitch (rm 810); behaviour x1 | behaviour x1 |
| `$077` | `FLAG_ROOM_810_B` | PermanentSwitch (rm 810); behaviour x1 | behaviour x1 |
| `$078` | `FLAG_ROOM_249` | PermanentSwitch (rm 249); RoomGfxSwap (rm 250); behaviour x1 | behaviour x1 |
| `$079` | `FLAG_ROOM_231` | PermanentSwitch (rm 231); RoomGfxSwap (rm 240) | behaviour x1 |
| `$07A` | `FLAG_ROOM_258` | PermanentSwitch (rm 258); RoomGfxSwap (rm 266) | behaviour x1 |
| `$07B` | `FLAG_BHV_07B` | PermanentSwitch (rm 263) | behaviour x1 |
| `$07C` | `FLAG_ROOM_082` | PermanentSwitch (rm 82); behaviour x1 | behaviour x1 |
| `$07D` | `FLAG_ROOM_799_A` | PermanentSwitch (rm 799); behaviour x1 | behaviour x1 |
| `$07E` | `FLAG_ROOM_800` | PermanentSwitch (rm 800); behaviour x1 | behaviour x1 |
| `$07F` | `FLAG_ROOM_801` | PermanentSwitch (rm 801); behaviour x1 | behaviour x1 |
| `$080` | `FLAG_ROOM_798` | PermanentSwitch (rm 798); behaviour x1 | behaviour x1 |
| `$081` | `FLAG_ROOM_804` | PermanentSwitch (rm 804); behaviour x3 | behaviour x1 |
| `$082` | `FLAG_ROOM_803` | PermanentSwitch (rm 803); behaviour x2 | behaviour x1 |
| `$083` | `FLAG_ROOM_805_A` | PermanentSwitch (rm 805); behaviour x2 | behaviour x1 |
| `$084` | `FLAG_ROOM_805_B` | PermanentSwitch (rm 805); behaviour x1 | behaviour x1 |
| `$085` | `FLAG_ROOM_805_C` | PermanentSwitch (rm 805); behaviour x1 | behaviour x1 |
| `$086` | `FLAG_ROOM_343` | PermanentSwitch (rm 343); behaviour x1 | behaviour x1 |
| `$087` | `FLAG_ROOM_319` | PermanentSwitch (rm 319); RoomTransition (rm 344) | behaviour x1 |
| `$088` | `FLAG_ROOM_799_B` | behaviour x2 | behaviour x8 |
| `$089` | `FLAG_ROOM_799_C` | behaviour x1 | behaviour x1 |
| `$08A` | `FLAG_ROOM_116` | PermanentSwitch (rm 116); SpriteVisibility (rm 117); behaviour x1 | behaviour x1 |
| `$08B` | `FLAG_ROOM_128` | PermanentSwitch (rm 128); RoomGfxSwap (rm 128) | behaviour x1 |
| `$08C` | `FLAG_ROOM_309` | PermanentSwitch (rm 309); behaviour x1 | behaviour x1 |
| `$08D` | `FLAG_ROOM_312` | PermanentSwitch (rm 312); behaviour x2 | behaviour x1 |
| `$08E` | `FLAG_ROOM_311` | PermanentSwitch (rm 311); RoomCleared (rm 316) | behaviour x1 |
| `$08F` | `FLAG_ROOM_307` | PermanentSwitch (rm 307); behaviour x1 | behaviour x1 |
| `$090` | `FLAG_ROOM_052` | SpriteVisibility (rm 60,86+); behaviour x1 | behaviour x4 |
| `$091` | `FLAG_DUKE_THRONE_SCENE` | RoomTransition (rm 51,55+); progress table | debug menu; dialogueactions.asm:1209 |
| `$092` | `FLAG_BANQUET_PROGRESS_92` | RoomCleared (rm 52); SpriteVisibility (rm 638); progress table | behaviour x1; debug menu |
| `$093` | `FLAG_CASTLE_BANQUET_DONE` | OneTimeEvent (rm 60,65+); SpriteVisibility (rm 56,78+); progress table | script table x15; debug menu |
| `$094` | `FLAG_CATACOMB_PROGRESS_94` | OneTimeEvent (rm 65); RoomCleared (rm 85); SpriteVisibility (rm 63,68+); +2 more | behaviour x1; debug menu |
| `$095` | `FLAG_ROOM_097_A` | SpriteVisibility (rm 97,100) | behaviour x2 |
| `$096` | `FLAG_ROOM_097_B` | - | behaviour x1 |
| `$097` | `FLAG_CASTLE_SCENE_WAIT` | dialogueactions.asm:1329 | behaviour x1 |
| `$098` | `FLAG_ROOM_053_C` | - | behaviour x1 |
| `$099` | `FLAG_ROOM_081` | behaviour x1 | behaviour x1 |
| `$09A` | `FLAG_MORALIS_FREED` | SpriteVisibility (rm 42); behaviour x1 | dialogueactions.asm:2390 |
| `$09B` | `FLAG_ROOM_043` | SpriteVisibility (rm 43) | behaviour x1 |
| `$09C` | `FLAG_ROOM_098` | RoomCleared (rm 98) | behaviour x1 |
| `$0A0` | `FLAG_CASTLE_GUARDS_MOVED` | OneTimeEvent (rm 32,60+); RoomGfxSwap (rm 85,667); RoomTransition (rm 630,633+); +5 more | debug menu; dialogueactions.asm:1536 |
| `$0A1` | `FLAG_CASTLE_NEW_EMPLOYEES` | SpriteVisibility (rm 56); dialogue branch | behaviour x1 |
| `$0A2` | `FLAG_CRYPT_WHODINI_STATE` | dialogue branch | behaviour x1 |
| `$0A3` | `FLAG_ROOM_681` | behaviour x1 | behaviour x1 |
| `$0A4` | `FLAG_MERCATOR_DUNGEON_DOOR_OPEN` | customroomactions1.asm:139; dialogue branch | dialogueactions.asm:1706 |
| `$0A5` | `FLAG_HARBOUR_NPC_MOVED` | customroomactions1.asm:149; customroomactions2.asm:158; dialogue branch | behaviour x1 |
| `$0A6` | `FLAG_CRYPT_BOSS_DEAD` | SpriteVisibility (rm 631,638); behaviour x4; customroomactions1.asm:186; +2 more | behaviour x1; debug menu |
| `$0A7` | `FLAG_ROOM_225` | RoomCleared (rm 225) | behaviour x1 |
| `$0A8` | `FLAG_CRYPT_GHOST_BETTY_ROSS` | behaviour x1; customroomactions1.asm:174 (cmpi.b #$FF, all 8); dialogueactions.asm:1891 | behaviour x1; debug menu |
| `$0A9` | `FLAG_CRYPT_GHOST_RUBY_SILENT` | behaviour x1; customroomactions1.asm:174 (cmpi.b #$FF, all 8); dialogueactions.asm:1914 | behaviour x1; debug menu |
| `$0AA` | `FLAG_CRYPT_GHOST_ROOM3` | behaviour x1; customroomactions1.asm:174 (cmpi.b #$FF, all 8) | behaviour x1; debug menu |
| `$0AB` | `FLAG_CRYPT_GHOST_MARIA_HYSTERICA` | behaviour x1; customroomactions1.asm:174 (cmpi.b #$FF, all 8); dialogueactions.asm:1924 | behaviour x1; debug menu |
| `$0AC` | `FLAG_CRYPT_GHOST_JIM_BRIGHT` | behaviour x1; customroomactions1.asm:174 (cmpi.b #$FF, all 8); dialogueactions.asm:1934; +1 more | debug menu; triggeractions.asm:813 |
| `$0AD` | `FLAG_CRYPT_GHOST_LARSON_E` | behaviour x2; customroomactions1.asm:174 (cmpi.b #$FF, all 8); dialogueactions.asm:1944 | behaviour x1; debug menu |
| `$0AE` | `FLAG_CRYPT_GHOST_DIRK_THE_DARK` | behaviour x1; customroomactions1.asm:174 (cmpi.b #$FF, all 8); dialogueactions.asm:1954 | behaviour x1; debug menu |
| `$0AF` | `FLAG_CRYPT_GHOST_WHODINI` | behaviour x1; customroomactions1.asm:174 (cmpi.b #$FF, all 8); dialogueactions.asm:2945 | behaviour x1; debug menu |
| `$0B0` | `FLAG_ROOM_032` | SpriteVisibility (rm 32) | behaviour x1 |
| `$0B1` | `FLAG_HIDE_032` | SpriteVisibility (rm 32) | - |
| `$0B2` | `FLAG_CRYPT_RIDDLER_DONE` | behaviour x1 | behaviour x1; dialogueactions.asm:1876 |
| `$0B3` | `FLAG_CRYPT_ALL_GHOSTS_DONE` | progress table | customroomactions1.asm:176; debug menu |
| `$0B4` | `FLAG_UNDER_JAIL_PROGRESS_B4` | SpriteVisibility (rm 475); behaviour x1 | behaviour x1; debug menu |
| `$0B5` | `FLAG_MIR_TOWER_Q1` | SpriteVisibility (rm 751); behaviour x1 | dialogueactions.asm:2047 |
| `$0B6` | `FLAG_MIR_TOWER_Q2` | SpriteVisibility (rm 751); behaviour x1 | dialogueactions.asm:2062 |
| `$0B7` | `FLAG_MIR_TOWER_GATE_OPEN` | behaviour x1; triggeractions.asm:898 | dialogueactions.asm:2077 |
| `$0B8` | `FLAG_GARLIC_USED` | SpriteVisibility (rm 758); behaviour x2 | items3.asm:399 |
| `$0B9` | `FLAG_ROOM_762` | SpriteVisibility (rm 762) | behaviour x1 |
| `$0BA` | `FLAG_ROOM_778` | SpriteVisibility (rm 778) | behaviour x1 |
| `$0BB` | `FLAG_ROOM_779` | SpriteVisibility (rm 779) | behaviour x1 |
| `$0BC` | `FLAG_ROOM_783` | SpriteVisibility (rm 783) | behaviour x1 |
| `$0BD` | `FLAG_ROOM_782` | SpriteVisibility (rm 782); behaviour x2 | behaviour x1 |
| `$0BE` | `FLAG_ROOM_781` | SpriteVisibility (rm 781) | behaviour x1 |
| `$0BF` | `FLAG_UNDER_JAIL_DONE` | OneTimeEvent (rm 32); RoomTransition (rm 51,52+); SpriteVisibility (rm 32,631+); +2 more | behaviour x1; debug menu |
| `$0C0` | `FLAG_TALKED_MASSAN_FRIDAY_ASK` | talk-once script | talk-once script |
| `$0C1` | `FLAG_TALKED_GUMI_GREETING` | talk-once script | talk-once script |
| `$0C2` | `FLAG_TALKED_GUMI_POSSESSED` | talk-once script | talk-once script |
| `$0C3` | `FLAG_TALKED_RYUMA_TRAVELLER` | talk-once script | talk-once script |
| `$0C6` | `FLAG_MADAME_YARD_TOO_YOUNG` | - | script table x5 |
| `$0C7` | `FLAG_TALKED_SHOP_CLOSED` | talk-once script | talk-once script |
| `$0C8` | `FLAG_CASTLE_ENTRY_REFUSED` | script test | script table x10 |
| `$0C9` | `FLAG_TALKED_CASTLE_VISITOR` | talk-once script | talk-once script |
| `$0CA` | `FLAG_TALKED_MAGICIAN_RUMOUR` | talk-once script | talk-once script |
| `$0CB` | `FLAG_TALKED_CASTLE_STAFF` | talk-once script | talk-once script |
| `$0CC` | `FLAG_TALKED_CASTLE_ART` | talk-once script | talk-once script |
| `$0CD` | `FLAG_TALKED_CASTLE_STARTLED` | talk-once script | talk-once script |
| `$0CE` | `FLAG_BANQUET_SUMMONS` | dialogue branch; talk-once script | talk-once script |
| `$0CF` | `FLAG_TALKED_MIR_TOWER_WARNING` | talk-once script | talk-once script |
| `$0D0` | `FLAG_TALKED_CASTLE_BASEMENT` | talk-once script | talk-once script |
| `$0D1` | `FLAG_TALKED_DEXTER_ZAK_SEEN` | talk-once script | talk-once script |
| `$0D2` | `FLAG_GREENPEA_INTRODUCED` | dialogue branch | script table x5 |
| `$0D4` | `FLAG_TALKED_NIGEL_ADMIRER` | talk-once script | talk-once script |
| `$0D5` | `FLAG_TALKED_ARMOUR_HINT` | talk-once script | talk-once script |
| `$0D7` | `FLAG_TALKED_OLD_GOL` | talk-once script | talk-once script |
| `$0D9` | `FLAG_ABOARD_SHIP` | dialogue branch | script table x5 |
| `$0DA` | `FLAG_TALKED_GUMI_AGAIN` | talk-once script | talk-once script |
| `$0DB` | `FLAG_BANQUET_READY` | dialogue branch | script table x5 |
| `$0DC` | `FLAG_TALKED_CASTLE_GATE_GUARD` | talk-once script | talk-once script |
| `$0DD` | `FLAG_TALKED_WHOLESALER_THANKS` | talk-once script | talk-once script |
| `$0DE` | `FLAG_TALKED_HEALED_NPC` | talk-once script | talk-once script |
| `$0DF` | `FLAG_TALKED_KADO` | talk-once script | talk-once script |
| `$0E0` | `FLAG_RAFT_FATHER_ASKED` | script test | script table x5 |
| `$0E1` | `FLAG_RAFT_SON_ASKED` | script test | script table x5 |
| `$0E2` | `FLAG_TALKED_MARTY_COUPLE` | talk-once script | talk-once script |
| `$0E3` | `FLAG_TALKED_KADO_AGAIN` | talk-once script | talk-once script |
| `$0E4` | `FLAG_TIRED_GUARD` | dialogue branch | script table x5 |
| `$0E5` | `FLAG_TALKED_FRIDAY_FRIEND_1` | talk-once script | talk-once script |
| `$0E6` | `FLAG_TALKED_FRIDAY_FRIEND_2` | talk-once script | talk-once script |
| `$0E7` | `FLAG_TALKED_GREEDY_THIEF` | talk-once script | talk-once script |
| `$0E8` | `FLAG_TALKED_DUKE_SIGHTING` | talk-once script | talk-once script |
| `$100` | `FLAG_ROOM_072` | RoomCleared (rm 72) | behaviour x1 |
| `$101` | `FLAG_ROOM_090` | RoomCleared (rm 90) | behaviour x1 |
| `$102` | `FLAG_ROOM_104` | RoomCleared (rm 104) | behaviour x1 |
| `$103` | `FLAG_ROOM_105` | RoomCleared (rm 105) | behaviour x1 |
| `$104` | `FLAG_ROOM_108` | SpriteVisibility (rm 108); behaviour x1 | behaviour x1 |
| `$105` | `FLAG_CASTLE_DUNGEON_ESCAPE` | RoomCleared (rm 35,108+); RoomGfxSwap (rm 628); RoomTransition (rm 32,51+); +5 more | behaviour x1; debug menu |
| `$106` | `FLAG_NPC_RELOCATED_106` | SpriteVisibility (rm 84); behaviour x3 | dialogueactions.asm:2705 |
| `$107` | `FLAG_PRISON_CELL_NPC_MOVED` | RoomGfxSwap (rm 44); behaviour x1; customroomactions1.asm:232 | behaviour x1 |
| `$108` | `FLAG_ROOM_532` | RoomGfxSwap (rm 532); behaviour x1 | behaviour x1 |
| `$109` | `FLAG_ROOM_580` | RoomGfxSwap (rm 580); behaviour x1 | behaviour x1 |
| `$10A` | `FLAG_ROOM_590` | RoomGfxSwap (rm 590); behaviour x1 | behaviour x1 |
| `$10B` | `FLAG_ROOM_589` | RoomGfxSwap (rm 589); behaviour x1 | behaviour x1 |
| `$10C` | `FLAG_ROOM_581` | RoomGfxSwap (rm 581); behaviour x1 | behaviour x1 |
| `$110` | `FLAG_ROOM_563` | SpriteVisibility (rm 563) | behaviour x1 |
| `$111` | `FLAG_ROOM_560_A` | SpriteVisibility (rm 560) | behaviour x1 |
| `$112` | `FLAG_ROOM_562` | SpriteVisibility (rm 562) | behaviour x1 |
| `$113` | `FLAG_BHV_113` | behaviour x1 | - |
| `$114` | `FLAG_ROOM_567_A` | SpriteVisibility (rm 567) | behaviour x1 |
| `$115` | `FLAG_ROOM_567_B` | SpriteVisibility (rm 567) | behaviour x1 |
| `$116` | `FLAG_ROOM_567_C` | SpriteVisibility (rm 567) | behaviour x1 |
| `$117` | `FLAG_ROOM_567_D` | behaviour x1 | behaviour x1 |
| `$118` | `FLAG_ROOM_510` | TreeWarpGfxSwap (rm 510,511); behaviour x1 | behaviour x1 |
| `$119` | `FLAG_ROOM_511` | TreeWarpGfxSwap (rm 510,511); behaviour x1 | behaviour x1 |
| `$11A` | `FLAG_ROOM_512` | TreeWarpGfxSwap (rm 512,534); behaviour x1 | behaviour x1 |
| `$11B` | `FLAG_ROOM_534` | TreeWarpGfxSwap (rm 512,534); behaviour x1 | behaviour x1 |
| `$11C` | `FLAG_ROOM_537` | TreeWarpGfxSwap (rm 537,539); behaviour x1 | behaviour x1 |
| `$11D` | `FLAG_ROOM_539` | TreeWarpGfxSwap (rm 537,539); behaviour x1 | behaviour x1 |
| `$11E` | `FLAG_ROOM_513` | TreeWarpGfxSwap (rm 513,536); behaviour x1 | behaviour x1 |
| `$11F` | `FLAG_ROOM_536` | TreeWarpGfxSwap (rm 513,536); behaviour x1 | behaviour x1 |
| `$120` | `FLAG_GREENMAZE_CUTTER_TURNED` | SpriteVisibility (rm 560); behaviour x4 | dialogueactions.asm:2821 |
| `$121` | `FLAG_ROOM_560_B` | behaviour x1 | behaviour x1 |
| `$122` | `FLAG_ROOM_560_C` | SpriteVisibility (rm 560); behaviour x1 | behaviour x1 |
| `$123` | `FLAG_ROOM_560_D` | SpriteVisibility (rm 560); behaviour x1 | behaviour x1 |
| `$124` | `FLAG_GREENMAZE_CUTTER_MOVED` | SpriteVisibility (rm 560); progress table | debug menu; dialogueactions.asm:2874 |
| `$125` | `FLAG_ROOM_560_E` | OneTimeEvent (rm 560) | behaviour x1 |
| `$126` | `FLAG_GREENMAZE_SCENE_WAIT` | behaviour x1 | dialogueactions.asm:2915 |
| `$127` | `FLAG_TREE_WARPS_OPEN` | SpriteVisibility (rm 809); behaviour x13; customroomactions2.asm:7; +2 more | behaviour x1 |
| `$128` | `FLAG_ROOM_535` | TreeWarpGfxSwap (rm 535,538); behaviour x1 | behaviour x1 |
| `$129` | `FLAG_ROOM_538` | TreeWarpGfxSwap (rm 535,538); behaviour x1 | behaviour x1 |
| `$12A` | `FLAG_BHV_12A` | behaviour x1 | behaviour x1 |
| `$12B` | `FLAG_BHV_12B` | behaviour x1 | behaviour x1 |
| `$130` | `FLAG_EINSTEIN_WHISTLE_USED` | OneTimeEvent (rm 560); RoomCleared (rm 564); SpriteVisibility (rm 560); +2 more | items3.asm:418; items3.asm:430; items3.asm:436 |
| `$131` | `FLAG_SUN_STONE_PLACED` | RoomCleared (rm 64,79+); RoomTransition (rm 493,627+); SpriteVisibility (rm 84,632+); +1 more | debug menu; dialogueactions.asm:2973 |
| `$132` | `FLAG_FORTUNE_TELLER_PRIZE` | behaviour x1; dialogue branch | behaviour x1 |
| `$133` | `FLAG_ROOM_711` | RoomCleared (rm 711) | behaviour x1 |
| `$134` | `FLAG_ROOM_722` | SpriteVisibility (rm 722) | behaviour x1 |
| `$135` | `FLAG_VERLA_MINERS_STORY_1` | RoomCleared (rm 255); SpriteVisibility (rm 255); dialogue branch | behaviour x1 |
| `$136` | `FLAG_VERLA_MINERS_STORY_2` | RoomCleared (rm 269); dialogue branch | behaviour x1 |
| `$137` | `FLAG_VERLA_MINE_BOSS2_DEAD` | RoomCleared (rm 242); SpriteVisibility (rm 242); customroomactions2.asm:28; +1 more | behaviour x1 |
| `$138` | `FLAG_ROOM_492` | SpriteVisibility (rm 492); behaviour x1 | behaviour x1 |
| `$139` | `FLAG_PRISONER_RELEASED` | RoomCleared (rm 170); RoomGfxSwap (rm 171,637); SpriteVisibility (rm 45); +2 more | behaviour x1 |
| `$13A` | `FLAG_LAVA_COOLED` | RoomTransition (rm 523); items2.asm:50 | items2.asm:54 |
| `$13B` | `FLAG_INTRO_IN_PROGRESS` | gamelogic4.asm:729; mapload.asm:301; script test | dialogueactions.asm:3994; mapload.asm:79 |
| `$13C` | `FLAG_PROGRESS_C_STEP2` | behaviour x2; progress table | script table x5 |
| `$13D` | `FLAG_VERLA_MINE_OPENING` | RoomGfxSwap (rm 242); SpriteVisibility (rm 242); dialogue branch | behaviour x1 |
| `$13E` | `FLAG_WITCHES_HUT_AWAKE` | RoomGfxSwap (rm 480); SpriteVisibility (rm 480); behaviour x1; +1 more | behaviour x1 |
| `$13F` | `FLAG_PROGRESS_C_STEP3` | PermanentSwitch (rm 802); SpriteVisibility (rm 480,592+); behaviour x2; +1 more | behaviour x1 |
| `$140` | `FLAG_VERLA_MINE_PATH_NPCS` | RoomCleared (rm 242,243+); RoomGfxSwap (rm 243,459+); RoomTransition (rm 711,713+); +4 more | behaviour x1; debug menu |
| `$141` | `FLAG_ROOM_723` | behaviour x1 | behaviour x1 |
| `$142` | `FLAG_ROOM_093` | RoomGfxSwap (rm 93) | behaviour x1 |
| `$143` | `FLAG_SWEEP_ATTACK_HIT` | behaviour x1 | behaviour x1; combat.asm:127; combat.asm:201; +2 more |
| `$144` | `FLAG_SAILED_TO_VERLA` | RoomTransition (rm 493,494); SpriteVisibility (rm 644); mapload.asm:315 | dialogueactions.asm:3043 |
| `$145` | `FLAG_ROOM_567_E` | behaviour x3 | behaviour x1 |
| `$146` | `FLAG_ROOM_650` | SpriteVisibility (rm 650) | behaviour x1 |
| `$147` | `FLAG_ROOM_488` | RoomCleared (rm 488); behaviour x2 | behaviour x1 |
| `$148` | `FLAG_ROOM_802` | PermanentSwitch (rm 802); behaviour x2 | behaviour x1 |
| `$149` | `FLAG_ROOM_281` | SpriteVisibility (rm 281) | behaviour x1 |
| `$14A` | `FLAG_INN_2F_SCENE` | behaviour x2; dialogue branch | dialogueactions.asm:4242 |
| `$14B` | `FLAG_CASINO_CORRIDOR_DONE` | behaviour x1; script test | customroomactions1.asm:12; dialogueactions.asm:4410 |
| `$14C` | `FLAG_TREE_GUARD_DONE` | behaviour x2; customroomactions2.asm:86 | dialogueactions.asm:4423 |
| `$14D` | `FLAG_GNOME_WANTS_LOGS` | SpriteVisibility (rm 415); dialogue branch; triggeractions.asm:1589 | behaviour x1 |
| `$14E` | `FLAG_ROOM_387` | behaviour x1 | behaviour x1 |
| `$150` | `FLAG_LAKE_SHRINE_DONE` | RoomGfxSwap (rm 726); SpriteVisibility (rm 726,730+); behaviour x1; +1 more | behaviour x1; debug menu |
| `$151` | `FLAG_MERCATOR_FIRST_VISIT_2` | behaviour x4 | dialogueactions.asm:3342 |
| `$152` | `FLAG_MARKET_CLOSED` | dialogue branch; progress table | script table x5 |
| `$153` | `FLAG_WHOLESALER_STOCK_BACK` | RoomTransition (rm 697); customroomactions1.asm:298; dialogue branch | script table x5 |
| `$154` | `FLAG_WHOLESALER_STOCK_ALL` | RoomGfxSwap (rm 698); RoomTransition (rm 695); SpriteVisibility (rm 698); +4 more | behaviour x1 |
| `$155` | `FLAG_HARBOUR_SUNSTONE_SCENE` | OneTimeEvent (rm 704); RoomCleared (rm 348,644+); RoomTransition (rm 681); +4 more | debug menu; dialogueactions.asm:3514 |
| `$156` | `FLAG_GOLAS_EYE_USED` | RoomGfxSwap (rm 160); RoomTransition (rm 144,146+); customroomactions1.asm:324; +4 more | debug menu; items3.asm:443 |
| `$157` | `FLAG_ROOM_486` | SpriteVisibility (rm 492); behaviour x1 | behaviour x1 |
| `$158` | `FLAG_RAFT1_BUILT` | behaviour x1; items3.asm:218 (Z = prior state) | items3.asm:218 |
| `$159` | `FLAG_RAFT2_BUILT` | behaviour x1; customroomactions2.asm:118; items3.asm:236 (Z = prior state); +1 more | items3.asm:236 |
| `$15A` | `FLAG_ROOM_408` | SpriteVisibility (rm 408); behaviour x2 | behaviour x1 |
| `$15B` | `FLAG_FAREWELL_NPC` | behaviour x2; dialogue branch | behaviour x1 |
| `$15C` | `FLAG_HARBOUR_WHOLESALE_OPEN` | behaviour x1 | dialogueactions.asm:3018 |
| `$15D` | `FLAG_ROOM_308` | RoomCleared (rm 308) | behaviour x1 |
| `$15E` | `FLAG_ROOM_293` | RoomCleared (rm 293) | behaviour x1 |
| `$15F` | `FLAG_ROOM_333` | RoomCleared (rm 333) | behaviour x1 |
| `$160` | `FLAG_LIFESTOCK_596` | LifestockSold (rm 596) | SetLifestockSoldFlag |
| `$161` | `FLAG_LIFESTOCK_608` | LifestockSold (rm 608) | SetLifestockSoldFlag |
| `$162` | `FLAG_LIFESTOCK_615` | LifestockSold (rm 615) | SetLifestockSoldFlag |
| `$163` | `FLAG_LIFESTOCK_733` | LifestockSold (rm 733) | SetLifestockSoldFlag |
| `$164` | `FLAG_LIFESTOCK_517` | LifestockSold (rm 517) | SetLifestockSoldFlag |
| `$165` | `FLAG_LIFESTOCK_526` | LifestockSold (rm 526) | SetLifestockSoldFlag |
| `$167` | `FLAG_LIFESTOCK_720` | LifestockSold (rm 720) | SetLifestockSoldFlag |
| `$170` | `FLAG_SACRED_TREE_362_A` | SacredTree (rm 362) | SetSacredTreeCutFlag |
| `$171` | `FLAG_SACRED_TREE_362_B` | SacredTree (rm 362) | SetSacredTreeCutFlag |
| `$172` | `FLAG_SACRED_TREE_362_C` | SacredTree (rm 362) | SetSacredTreeCutFlag |
| `$173` | `FLAG_SACRED_TREE_362_D` | SacredTree (rm 362) | SetSacredTreeCutFlag |
| `$174` | `FLAG_SACRED_TREE_415` | SacredTree (rm 415) | SetSacredTreeCutFlag |
| `$175` | `FLAG_SACRED_TREE_460_A` | SacredTree (rm 460) | SetSacredTreeCutFlag |
| `$176` | `FLAG_SACRED_TREE_460_B` | SacredTree (rm 460) | SetSacredTreeCutFlag |
| `$177` | `FLAG_SACRED_TREE_475` | SacredTree (rm 475) | SetSacredTreeCutFlag |
| `$178` | `FLAG_SACRED_TREE_492_A` | SacredTree (rm 492) | SetSacredTreeCutFlag |
| `$179` | `FLAG_SACRED_TREE_492_B` | SacredTree (rm 492) | SetSacredTreeCutFlag |
| `$17A` | `FLAG_SACRED_TREE_564_A` | SacredTree (rm 564) | SetSacredTreeCutFlag |
| `$17B` | `FLAG_SACRED_TREE_564_B` | SacredTree (rm 564) | SetSacredTreeCutFlag |
| `$17C` | `FLAG_SACRED_TREE_564_C` | SacredTree (rm 564) | SetSacredTreeCutFlag |
| `$17D` | `FLAG_SACRED_TREE_564_D` | SacredTree (rm 564) | SetSacredTreeCutFlag |
| `$17E` | `FLAG_SACRED_TREE_570` | SacredTree (rm 570) | SetSacredTreeCutFlag |
| `$17F` | `FLAG_SACRED_TREE_592_A` | SacredTree (rm 592) | SetSacredTreeCutFlag |
| `$180` | `FLAG_SACRED_TREE_592_B` | SacredTree (rm 592) | SetSacredTreeCutFlag |
| `$181` | `FLAG_SACRED_TREE_465` | SacredTree (rm 465) | SetSacredTreeCutFlag |
| `$190` | `FLAG_ROOM_306` | PermanentSwitch (rm 306); behaviour x2 | behaviour x1 |
| `$191` | `FLAG_ROOM_317` | PermanentSwitch (rm 317); SpriteVisibility (rm 324); behaviour x2 | behaviour x1 |
| `$192` | `FLAG_ROOM_358` | PermanentSwitch (rm 358); SpriteVisibility (rm 358); behaviour x1 | behaviour x1 |
| `$193` | `FLAG_ROOM_357` | PermanentSwitch (rm 357); behaviour x1 | behaviour x1 |
| `$194` | `FLAG_ROOM_367` | PermanentSwitch (rm 367); behaviour x1 | behaviour x1 |
| `$195` | `FLAG_ROOM_365` | PermanentSwitch (rm 365); behaviour x1 | behaviour x1 |
| `$196` | `FLAG_ROOM_566` | PermanentSwitch (rm 566); behaviour x1 | behaviour x1 |
| `$197` | `FLAG_ROOM_321` | PermanentSwitch (rm 321); behaviour x1 | behaviour x1 |
| `$198` | `FLAG_ROOM_392` | PermanentSwitch (rm 392); behaviour x1 | behaviour x1 |
| `$1A0` | `FLAG_ROOM_391_A` | SpriteVisibility (rm 391) | behaviour x1 |
| `$1A1` | `FLAG_ROOM_391_B` | SpriteVisibility (rm 391) | behaviour x1 |
| `$1A2` | `FLAG_ROOM_391_C` | SpriteVisibility (rm 391) | behaviour x1 |
| `$1A3` | `FLAG_ROOM_288` | SpriteVisibility (rm 288) | behaviour x1 |
| `$1A4` | `FLAG_ROOM_119` | RoomCleared (rm 119); RoomGfxSwap (rm 119) | behaviour x1 |
| `$1A5` | `FLAG_ROOM_121` | RoomCleared (rm 121); RoomGfxSwap (rm 121) | behaviour x1 |
| `$1A6` | `FLAG_BHV_1A6` | - | behaviour x1 |
| `$1A7` | `FLAG_ROOM_120` | RoomCleared (rm 120); RoomGfxSwap (rm 120) | behaviour x1 |
| `$1A8` | `FLAG_BHV_1A8` | - | behaviour x1 |
| `$1A9` | `FLAG_ROOM_118` | RoomCleared (rm 118); RoomGfxSwap (rm 118) | behaviour x1 |
| `$1AA` | `FLAG_ROOM_346` | RoomCleared (rm 346) | behaviour x1 |
| `$1C0` | `FLAG_LABYRINTH_SPINNER_DEAD` | RoomCleared (rm 410); RoomGfxSwap (rm 172,406+); behaviour x1; +1 more | behaviour x1 |
| `$1C1` | `FLAG_ROOM_509` | RoomGfxSwap (rm 515) | behaviour x1 |
| `$1C2` | `FLAG_LABYRINTH_MIRO_DEAD` | RoomCleared (rm 417); RoomGfxSwap (rm 172,417); behaviour x2; +1 more | behaviour x1 |
| `$1C3` | `FLAG_ROOM_461` | behaviour x1 | behaviour x1 |
| `$1C4` | `FLAG_TWINKLE_VILLAGE_SCENE` | dialogueactions.asm:4570 | behaviour x1 |
| `$1C5` | `FLAG_LABYRINTH_IFRIT_DEAD` | RoomGfxSwap (rm 172,404); SpriteVisibility (rm 398,404); behaviour x1; +1 more | behaviour x1 |
| `$1C6` | `FLAG_BOSS_FAREWELL_SEEN` | behaviour x2 | script table x5 |
| `$1C7` | `FLAG_MIR_OFFER_ACCEPTED` | behaviour x1 | script table x5 |
| `$1C8` | `FLAG_FALLING_NO_EKEEKE` | spritefuncs2.asm:80 | dialogueactions.asm:3460; dialogueactions.asm:3469 |
| `$1CD` | `FLAG_ROOM_348` | behaviour x2 | behaviour x1 |
| `$1CF` | `FLAG_PAWN_TICKET_USED` | items3.asm:74 (Z = prior state) | items3.asm:74 |
| `$1F0` | `FLAG_LANTERN_368` | Lantern (rm 368) | ItemUseLantern |
| `$1F1` | `FLAG_LANTERN_381` | Lantern (rm 381) | ItemUseLantern |
| `$1F2` | `FLAG_LANTERN_383` | Lantern (rm 383) | ItemUseLantern |
| `$1F3` | `FLAG_LANTERN_376` | Lantern (rm 376) | ItemUseLantern |
| `$1F4` | `FLAG_LANTERN_389` | Lantern (rm 389) | ItemUseLantern |
| `$1F5` | `FLAG_LANTERN_397` | Lantern (rm 397) | ItemUseLantern |
| `$1F6` | `FLAG_LANTERN_398` | Lantern (rm 398) | ItemUseLantern |
| `$1F7` | `FLAG_LANTERN_391` | Lantern (rm 391) | ItemUseLantern |
| `$1F8` | `FLAG_LANTERN_416` | Lantern (rm 416) | ItemUseLantern |
| `$1F9` | `FLAG_LANTERN_417` | Lantern (rm 417) | ItemUseLantern |
| `$1FA` | `FLAG_LANTERN_374` | Lantern (rm 374) | ItemUseLantern |
| `$1FB` | `FLAG_LANTERN_379` | Lantern (rm 379) | ItemUseLantern |

### Read-only and write-only flags

2 flags are only ever read and never written by anything we can see,
and 6 are only ever written and never read. Both groups are worth a
second look when renaming - a write-only flag may be vestigial, and a
read-only one is probably set from a source not yet decoded.

Read-only: `$0B1`, `$113`

Write-only: `$059`, `$096`, `$098`, `$0C6`, `$1A6`, `$1A8`

