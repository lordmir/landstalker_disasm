; Game progress flags.
;
; The flags live in one 64-byte block of work RAM, split by ram.inc
; into two labels for historical reasons:
;
;   g_Flags           $FF1000   flag bytes $00-$1F   ids $000-$0FF
;   g_AdditionalFlags $FF1020   flag bytes $20-$3F   ids $100-$1FF
;
; A flag id is a bit index into that block, packed as
;
;   id = (byte << 3) | bit
;
; which is exactly what ConvertFlagNumberToBit expects in d0
; (scriptfuncs_flags.asm), and the same encoding used by the flag ids
; embedded in scripts, room transition tables and behaviour scripts.
; Because g_AdditionalFlags is g_Flags+$20, ids $100+ need no special
; case - g_Flags+(id>>3) addresses both halves.
;
; From code, use the macros below, or extract the fields inline:
;
;   btst    #(FLAG_X&7),(g_Flags+(FLAG_X>>3)).l
;
; For the runtime helpers, which take an id in d0, pass it whole:
;
;   move.w  #FLAG_X,d0
;   bsr.w   TestFlagBit
;
; Chapter notes below refer to the debug flag menu's chapter list
; (FlagMenuOpts / FlagsToSet in misc/debugmenu.asm), which sets flags
; in story order; "ch.N X" means the id appears in that chapter's
; segment, and "ch.N X end" that it terminates it.
;
; Names marked "; ?" are inferred from a single site or from the debug
; chapter list alone, and are the least certain.
;
; Story progression order
; -----------------------
; GetFlagProgress (script/<lang>/scriptflagcheck.asm) feeds three
; PickValueBasedOnFlags tables that collapse the flags into the
; g_GameFlagProgress1..3 bytes, which HandleProgressDependentDialogue
; then thresholds. The first table is the authoritative main-story
; ranking, highest first (note there is no rank $0B):
;
;   $1F FLAG_PRISONER_RELEASED        $0E FLAG_PLAYER_IS_POCKETS
;   $1E FLAG_GOLAS_EYE_USED           $0D FLAG_CASTLE_PROGRESS_2E
;   $1D FLAG_HARBOUR_SUNSTONE_SCENE   $0C FLAG_CASTLE_PROGRESS_2D
;   $1C FLAG_LAKE_SHRINE_DONE         $0A FLAG_CASTLE_PROGRESS_2C
;   $1B FLAG_VERLA_MINE_PATH_NPCS     $09 FLAG_MERCATOR_ENTRY_GRANTED
;   $1A FLAG_SUN_STONE_PLACED         $08 FLAG_THIEVES_HIDEOUT_DONE
;   $19 FLAG_GREENMAZE_CUTTER_MOVED   $07 FLAG_LITHOGRAPH_PROGRESS_20
;   $18 FLAG_CASTLE_DUNGEON_ESCAPE    $06 FLAG_RYUMA_PROGRESS_17
;   $17 FLAG_UNDER_JAIL_DONE          $05 FLAG_RYUMA_DONE
;   $16 FLAG_CRYPT_BOSS_DEAD          $04 FLAG_SWAMP_SHRINE_BOSS_DEAD
;   $15 FLAG_CRYPT_ALL_GHOSTS_DONE    $03 FLAG_GUMI_DONE
;   $14 FLAG_CASTLE_GUARDS_MOVED      $02 FLAG_INTRO_DONE
;   $13 FLAG_CATACOMB_PROGRESS_94     $01 FLAG_MASSAN_PROGRESS_10
;   $12 FLAG_CASTLE_BANQUET_DONE
;   $11 FLAG_BANQUET_PROGRESS_92    2nd table: $0154 / $0152 / $00A0
;   $10 FLAG_DUKE_THRONE_SCENE      3rd table: $013F / $013C / $0124
;   $0F FLAG_CASTLE_MERCATOR_DONE
;
; FLAG_PRISONER_RELEASED outranking everything is worth a second look
; when renaming - the name came from a single prison-cell sprite test,
; but rank $1F makes it an endgame flag.

; ---------------------------------------------------------------------
; Field extraction
; ---------------------------------------------------------------------

SetFlag     macro
            if      narg<>1
            inform  2,"Wrong number of arguments"
            mexit
            endif
            bset    #(\1&7),(g_Flags+(\1>>3)).l
            endm

ClearFlag   macro
            if      narg<>1
            inform  2,"Wrong number of arguments"
            mexit
            endif
            bclr    #(\1&7),(g_Flags+(\1>>3)).l
            endm

ToggleFlag  macro
            if      narg<>1
            inform  2,"Wrong number of arguments"
            mexit
            endif
            bchg    #(\1&7),(g_Flags+(\1>>3)).l
            endm

; Z clear = flag set.
TestFlag    macro
            if      narg<>1
            inform  2,"Wrong number of arguments"
            mexit
            endif
            btst    #(\1&7),(g_Flags+(\1>>3)).l
            endm

; ---------------------------------------------------------------------
; Byte $00 - intro, Massan, Swamp Shrine
; ---------------------------------------------------------------------

FLAG_INTRO_DONE:                  equ $000 ; ? ch.4 GUMI
FLAG_THIEVES_GODDESS_STATUE:      equ $003 ; CSA_001E, Hideout 3F statue warp
FLAG_MASSAN_RESCUE_DONE:          equ $004 ; gates _massanRescue when fainting at
                                           ; the waterfall; mayor's alt pose
FLAG_NOLE_CAVE_OUTSIDE:           equ $005 ; CSA_0011 / TA_0F, King Nole's Cave 148
FLAG_SWAMP_SHRINE_OPENED:         equ $006 ; Idol Stone used at the shrine door;
                                           ; ch.6 RYUMA
FLAG_MASSAN_MAYOR_SLEEP:          equ $007 ; CSA_001D, rest at the mayor's hut;
                                           ; ch.4 GUMI

; ---------------------------------------------------------------------
; Byte $01 - scratch, NOT persistent story flags
;
; mapload clears this byte outright (clr.b (g_Flags+1)) on every room
; load, and scenes reuse it as scratch: bit 0 is the general "the
; scripted thing happened" handshake (33 sites), bits 1-3 are reused
; per minigame. Do not treat ids $008-$00F as story flags.
; ---------------------------------------------------------------------

FLAG_SCRATCH_EVENT_DONE:          equ $008 ; generic script handshake
FLAG_SCRATCH_BIT1:                equ $009 ; Greenpea 50g cell; crypt ghosts
FLAG_SCRATCH_BIT2:                equ $00A ; Greenpea 100g cell; roulette win
FLAG_SCRATCH_BIT3:                equ $00B ; Greenpea 400g cell; chicken race won
FLAG_SCRATCH_BIT4:                equ $00C ; behaviour cross-entity signalling:
                                           ; 28 behaviours, Mercator Castle,
                                           ; Helga's Hut, Duke cutscene
FLAG_SCRATCH_BIT5:                equ $00D ; as bit 4; 18 behaviours
FLAG_SCRATCH_BIT6:                equ $00E ; as bit 4; 22 behaviours
FLAG_SCRATCH_BIT7:                equ $00F ; set by the packed script table;
                                           ; CSA_006D masks it off (andi.b #$3F)

; ---------------------------------------------------------------------
; Byte $02 - Gumi, Waterfall Shrine, Swamp Shrine
; ---------------------------------------------------------------------

FLAG_MASSAN_PROGRESS_10:          equ $010 ; ? ch.4 GUMI
FLAG_WATERFALL_PROSPERO:          equ $011 ; TA_08, Prospero's room; ch.4 GUMI
FLAG_GUMI_RITES_DONE:             equ $012 ; TA_0A; hides Gumi sprite 3
FLAG_GUMI_DONE:                   equ $014 ; ? ch.4 GUMI end
FLAG_SWAMP_SHRINE_BOSS_DEAD:      equ $015 ; hides the boss room sprite; switches
                                           ; the village BGM; ch.6 RYUMA
FLAG_GUMI_LANDSLIDE_CLEARED:      equ $016 ; moves the blocking sprite; ch.6 RYUMA

; ---------------------------------------------------------------------
; Byte $03
; ---------------------------------------------------------------------

FLAG_RYUMA_PROGRESS_17:           equ $017 ; ? ch.9 LITHOGRAPH
FLAG_AXE_MAGIC_OBTAINED:          equ $018 ; ? gates SetSacredTreeCutFlag in
                                           ; _HandleEnemyDeath; ch.30 MOUNTAINS
FLAG_OLD_WOMAN_HOUSE_VISITED:     equ $01A ; CSA_0038
FLAG_JAR_LADY_MOVED:              equ $01B ; moves sprite 7 upstairs
FLAG_PLAYER_IS_POCKETS:           equ $01C ; transform: load as Pockets, also the
                                           ; dog curse; cleared on revert
FLAG_CASTLE_MERCATOR_DONE:        equ $01D ; ? ch.16 CASTLE MRCTR end

; ---------------------------------------------------------------------
; Byte $04
; ---------------------------------------------------------------------

FLAG_LITHOGRAPH_PROGRESS_20:      equ $020 ; ? ch.9 LITHOGRAPH
FLAG_THIEVES_HIDEOUT_DONE:        equ $021 ; CSA_0068 / TA_17, Treasure Room
                                           ; prisoners freed; ch.9 LITHOGRAPH end
FLAG_RYUMA_DONE:                  equ $022 ; ? ch.6 RYUMA end
FLAG_MERCATOR_ENTRY_GRANTED:      equ $023 ; CSA_0022, Ryuma mayor rescued;
                                           ; checked at the gate; ch.10 MERCATOR end
FLAG_MERCATOR_GATE_PASSED:        equ $027 ; CSA_0028, Mercator 1 (Gate);
                                           ; ch.16 CASTLE MRCTR

; ---------------------------------------------------------------------
; Byte $05
; ---------------------------------------------------------------------

FLAG_MERCATOR_FIRST_VISIT:        equ $028 ; CSA_0029
FLAG_PURIN_MET:                   equ $02A ; CSA_002F
FLAG_CASTLE_PROGRESS_2C:          equ $02C ; ? ch.16 CASTLE MRCTR
FLAG_CASTLE_PROGRESS_2D:          equ $02D ; ? ch.16 CASTLE MRCTR
FLAG_CASTLE_PROGRESS_2E:          equ $02E ; ? ch.16 CASTLE MRCTR
FLAG_FAHL_DUEL_ACTIVE:            equ $02F ; dojo: health parked in TempHealth and
                                           ; restored by CheckTempHealthRestore

; ---------------------------------------------------------------------
; Byte $07
; ---------------------------------------------------------------------

FLAG_CRYPT_DEAD_AND_END:          equ $03B ; ? CSA_00E6, Crypt room 9

; ---------------------------------------------------------------------
; Byte $0A
; ---------------------------------------------------------------------

FLAG_SWAMP_EKEEKE_PRIZE_TAKEN:    equ $052 ; ? raises the prize sprite
FLAG_SWAMP_ORC_CHALLENGE_DONE:    equ $053 ; TA_03-$05, mushroom challenge room

; ---------------------------------------------------------------------
; Byte $0C
; ---------------------------------------------------------------------

FLAG_FAHL_DUEL_AFTERMATH:         equ $066 ; ? cleared alongside the duel flag

; ---------------------------------------------------------------------
; Byte $12 - Mercator Castle
; ---------------------------------------------------------------------

FLAG_DUKE_THRONE_SCENE:           equ $091 ; CSA_004F, Throne Room; ch.19 BANQUET
FLAG_BANQUET_PROGRESS_92:         equ $092 ; ? ch.19 CASTLE BANQUET
FLAG_CASTLE_BANQUET_DONE:         equ $093 ; ? ch.19 CASTLE BANQUET end
FLAG_CATACOMB_PROGRESS_94:        equ $094 ; ? ch.21 CATACOMB
FLAG_CASTLE_SCENE_WAIT:           equ $097 ; ? _c0055Wait

; ---------------------------------------------------------------------
; Byte $13 - see also FLAGBYTE_VASE_COUNTER for bits 5-7
; ---------------------------------------------------------------------

FLAG_MORALIS_FREED:               equ $09A ; CSA_00A5

; ---------------------------------------------------------------------
; Byte $14
; ---------------------------------------------------------------------

FLAG_CASTLE_GUARDS_MOVED:         equ $0A0 ; ? castle entrance and main hall;
                                           ; ch.21 CATACOMB end
FLAG_MERCATOR_DUNGEON_DOOR_OPEN:  equ $0A4 ; CSA_006A; moves the Mercator N sprite
FLAG_HARBOUR_NPC_MOVED:           equ $0A5 ; ? harbour, before and after Mir
FLAG_CRYPT_BOSS_DEAD:             equ $0A6 ; crypt west NPCs and the boss room
                                           ; sprite; ch.23 MIR TOWER end

; ---------------------------------------------------------------------
; Byte $15 - the eight Mercator Crypt ghosts (ch.22 THE OTHER SIDE)
;
; Once all eight are set the byte reads $FF, which customroomactions1
; tests directly (cmpi.b #$FF) to set FLAG_CRYPT_ALL_GHOSTS_DONE.
; ---------------------------------------------------------------------

FLAG_CRYPT_GHOST_BETTY_ROSS:      equ $0A8 ; room 1
FLAG_CRYPT_GHOST_RUBY_SILENT:     equ $0A9 ; room 2
FLAG_CRYPT_GHOST_ROOM3:           equ $0AA ; ? debug chapter list only
FLAG_CRYPT_GHOST_MARIA_HYSTERICA: equ $0AB ; room 4
FLAG_CRYPT_GHOST_JIM_BRIGHT:      equ $0AC ; room 5; also the TA_36 area latch
FLAG_CRYPT_GHOST_LARSON_E:        equ $0AD ; room 6
FLAG_CRYPT_GHOST_DIRK_THE_DARK:   equ $0AE ; room 7
FLAG_CRYPT_GHOST_WHODINI:         equ $0AF ; room 8

; ---------------------------------------------------------------------
; Byte $16 - Mir's Tower entrance
; ---------------------------------------------------------------------

FLAG_CRYPT_RIDDLER_DONE:          equ $0B2 ; CSA_0078, cleared at crypt room 0
FLAG_CRYPT_ALL_GHOSTS_DONE:       equ $0B3 ; set when byte $15 reads $FF;
                                           ; ch.22 THE OTHER SIDE end
FLAG_UNDER_JAIL_PROGRESS_B4:      equ $0B4 ; ? ch.24 UNDER JAIL
FLAG_MIR_TOWER_Q1:                equ $0B5 ; CSA_0088, entrance riddle
FLAG_MIR_TOWER_Q2:                equ $0B6 ; CSA_0089
FLAG_MIR_TOWER_GATE_OPEN:         equ $0B7 ; CSA_008A / TA_3C, opens Gate S

; ---------------------------------------------------------------------
; Byte $17
; ---------------------------------------------------------------------

FLAG_GARLIC_USED:                 equ $0B8 ; the flag Miro reacts to
FLAG_UNDER_JAIL_DONE:             equ $0BF ; ? ch.24 UNDER JAIL end

; =====================================================================
; g_AdditionalFlags - ids $100+
; =====================================================================

; ---------------------------------------------------------------------
; Byte $20 (g_AdditionalFlags+$00)
; ---------------------------------------------------------------------

FLAG_CASTLE_DUNGEON_ESCAPE:       equ $105 ; prison cell and dungeon entrance;
                                           ; ch.25 GREENMAZE end
FLAG_NPC_RELOCATED_106:           equ $106 ; ? CSA_00B5, five NPCs
FLAG_PRISON_CELL_NPC_MOVED:       equ $107 ; ? castle prison cell 4

; ---------------------------------------------------------------------
; Byte $24 (g_AdditionalFlags+$04) - Greenmaze
; ---------------------------------------------------------------------

FLAG_GREENMAZE_CUTTER_TURNED:     equ $120 ; ? _c00C2Turn
FLAG_GREENMAZE_CUTTER_MOVED:      equ $124 ; CSA_00C6; ch.27 VERLA
FLAG_GREENMAZE_SCENE_WAIT:        equ $126 ; ? _c00C8Wait
FLAG_TREE_WARPS_OPEN:             equ $127 ; gates the tree-warp graphics swap and
                                           ; the arrival-room enemy hiding

; ---------------------------------------------------------------------
; Byte $26 (g_AdditionalFlags+$06)
; ---------------------------------------------------------------------

FLAG_EINSTEIN_WHISTLE_USED:       equ $130 ; one-shot under FIX_WHISTLE_CHECK
FLAG_SUN_STONE_PLACED:            equ $131 ; lights the Ryuma lighthouse;
                                           ; ch.27 VERLA end
FLAG_VERLA_MINE_BOSS2_DEAD:       equ $137 ; ? clears the boss sprite's state

; ---------------------------------------------------------------------
; Byte $27 (g_AdditionalFlags+$07)
; ---------------------------------------------------------------------

FLAG_PRISONER_RELEASED:           equ $139 ; ? prison cell 4 hide test
FLAG_LAVA_COOLED:                 equ $13A ; Gaia Statue used in the lava room
FLAG_INTRO_IN_PROGRESS:           equ $13B ; set for a blank save, cleared when the
                                           ; intro ends; mutes room music and the
                                           ; object-drop sound
FLAG_WITCHES_HUT_AWAKE:           equ $13E ; ? clears sprite 2's state flag

; ---------------------------------------------------------------------
; Byte $28 (g_AdditionalFlags+$08)
; ---------------------------------------------------------------------

FLAG_VERLA_MINE_PATH_NPCS:        equ $140 ; ? moves two sprites on the Destel
                                           ; path; ch.28 DESTEL end
FLAG_SWEEP_ATTACK_HIT:            equ $143 ; set by all four sweep directions
FLAG_SAILED_TO_VERLA:             equ $144 ; CSA_00D2; checked for the overworld

; ---------------------------------------------------------------------
; Byte $29 (g_AdditionalFlags+$09)
; ---------------------------------------------------------------------

FLAG_INN_2F_SCENE:                equ $14A ; ? CSA_012B, Mercator inn
FLAG_CASINO_CORRIDOR_DONE:        equ $14B ; CSA_0137; cleared on entering
                                           ; Mercator centre
FLAG_TREE_GUARD_DONE:             equ $14C ; CSA_0138; moves the logs-entrance NPC
FLAG_GNOME_WANTS_LOGS:            equ $14D ; TA_77, Labyrinth tree room

; ---------------------------------------------------------------------
; Byte $2A (g_AdditionalFlags+$0A)
; ---------------------------------------------------------------------

FLAG_MERCATOR_FIRST_VISIT_2:      equ $151 ; ? CSA_00EF
FLAG_WHOLESALER_STOCK_BACK:       equ $153 ; hides the restricted stock
FLAG_WHOLESALER_STOCK_ALL:        equ $154 ; hides all stock; TA_69
FLAG_HARBOUR_SUNSTONE_SCENE:      equ $155 ; harbour after the Sun Stone theft;
                                           ; ch.30 MOUNTAINS end
FLAG_GOLAS_EYE_USED:              equ $156 ; opens the mountain statue warp;
                                           ; ch.31 CAVE AT THE TOP end

; ---------------------------------------------------------------------
; Byte $2B (g_AdditionalFlags+$0B)
; ---------------------------------------------------------------------

FLAG_RAFT1_BUILT:                 equ $158 ; Logs used, first raft room
FLAG_RAFT2_BUILT:                 equ $159 ; Logs used, second raft room; TA_77
FLAG_HARBOUR_WHOLESALE_OPEN:      equ $15C ; ? CSA_00D1

; ---------------------------------------------------------------------
; Byte $2A/$2B gap - Lake Shrine
; ---------------------------------------------------------------------

FLAG_LAKE_SHRINE_DONE:            equ $150 ; ? ch.29 LAKE SHRINE end

; ---------------------------------------------------------------------
; Byte $38 (g_AdditionalFlags+$18) - Labyrinth minibosses
; ---------------------------------------------------------------------

FLAG_LABYRINTH_SPINNER_DEAD:      equ $1C0 ; clears sprite 2's state flag
FLAG_LABYRINTH_MIRO_DEAD:         equ $1C2 ; clears sprite 1's state flag
FLAG_TWINKLE_VILLAGE_SCENE:       equ $1C4 ; ? CSA_014A
FLAG_LABYRINTH_IFRIT_DEAD:        equ $1C5 ; clears sprite 1's state flag

; ---------------------------------------------------------------------
; Byte $39 (g_AdditionalFlags+$19)
; ---------------------------------------------------------------------

FLAG_FALLING_NO_EKEEKE:           equ $1C8 ; set while Mir catches the player
                                           ; mid-fall; blocks EkeEke recovery
FLAG_PAWN_TICKET_USED:            equ $1CF ; once per game

; =====================================================================
; Script-referenced flags
;
; These appear only as dc.w ids inside the dialogue scripts, never as
; a bset/btst/bclr in code, so they are listed here for completeness
; rather than because anything here uses them.
;
; Two consumers, and the distinction matters when renaming:
;   SetFlagBitOnTalking        {id, first-time script, later script} -
;                              the script sets the flag itself, so
;                              these are genuinely "talked to X once".
;   CheckFlagAndDisplayMessage {id, script if set, script if clear} -
;                              read-only; the flag is set elsewhere,
;                              so a "talked" name would be wrong.
;
; All names here are provisional - they are derived from the English
; dialogue nearest the reference, so treat every one as "; ?".
; =====================================================================

; --- one-shot dialogue, set by SetFlagBitOnTalking -------------------

FLAG_TALKED_MASSAN_FRIDAY_ASK:    equ $0C0 ; "Is...is Miss Friday all right?"
FLAG_TALKED_GUMI_GREETING:        equ $0C1 ; "Nice to meet you again, young boy!"
FLAG_TALKED_GUMI_POSSESSED:       equ $0C2 ; "We let the monsters control us"
FLAG_TALKED_RYUMA_TRAVELLER:      equ $0C3 ; "Have a nice trip!"
FLAG_TALKED_SHOP_CLOSED:          equ $0C7 ; "The shop is closed now"
FLAG_TALKED_CASTLE_VISITOR:       equ $0C9 ; "This gorgeous castle is worth exploring"
FLAG_TALKED_MAGICIAN_RUMOUR:      equ $0CA ; "An evil magician is tormenting Duke Mercator"
FLAG_TALKED_CASTLE_STAFF:         equ $0CB ; "I get to see the nobility"
FLAG_TALKED_CASTLE_ART:           equ $0CC ; "The paintings and ornaments"
FLAG_TALKED_CASTLE_STARTLED:      equ $0CD ; "Ulp! I'm sorry! ...who are you?"
FLAG_TALKED_MIR_TOWER_WARNING:    equ $0CF ; "Art thou really going to the tower?"
FLAG_TALKED_CASTLE_BASEMENT:      equ $0D0 ; "Wandering about in this basement"
FLAG_TALKED_DEXTER_ZAK_SEEN:      equ $0D1 ; "Dexter and Zak came through here"
FLAG_TALKED_NIGEL_ADMIRER:        equ $0D4 ; "I have great respect for you!"
FLAG_TALKED_ARMOUR_HINT:          equ $0D5 ; "go upstairs and cut the armor"
FLAG_TALKED_OLD_GOL:              equ $0D7 ; "My name is Old Gol...keeper of Greenmaze"
FLAG_TALKED_GUMI_AGAIN:           equ $0DA ; "You again!"
FLAG_TALKED_CASTLE_GATE_GUARD:    equ $0DC ; "Company--salute! Do come in!"
FLAG_TALKED_WHOLESALER_THANKS:    equ $0DD ; "I received the goods"
FLAG_TALKED_HEALED_NPC:           equ $0DE ; "I'm completely healed"
FLAG_TALKED_KADO:                 equ $0DF ; "My name is Kado...famous swordsman"
FLAG_TALKED_MARTY_COUPLE:         equ $0E2 ; "Marty and I will make this house our home"
FLAG_TALKED_KADO_AGAIN:           equ $0E3 ; "How do you like it?"
FLAG_TALKED_FRIDAY_FRIEND_1:      equ $0E5 ; "have not seen you for 256 years!"
FLAG_TALKED_FRIDAY_FRIEND_2:      equ $0E6 ; "you're with a boy as usual"
FLAG_TALKED_GREEDY_THIEF:         equ $0E7 ; "All I wanted was a few measly treasures!"
FLAG_TALKED_DUKE_SIGHTING:        equ $0E8 ; "I thought you were...the Duke"

; --- read-only branches, tested by CheckFlagAndDisplayMessage --------

FLAG_FRIDAY_NAMED:                equ $01E ; "er, I mean, Miss Friday!"
FLAG_CASTLE_NEW_EMPLOYEES:        equ $0A1 ; "The new employees often behave rudely"
FLAG_CRYPT_WHODINI_STATE:         equ $0A2 ; "Both in this world and the one below"
FLAG_BANQUET_SUMMONS:             equ $0CE ; "The party is ready now"
FLAG_GREENPEA_INTRODUCED:         equ $0D2 ; "Greenpea is the name of the owner here"
FLAG_ABOARD_SHIP:                 equ $0D9 ; "Are you a landlubber?"
FLAG_BANQUET_READY:               equ $0DB ; "I think the party is ready now"
FLAG_TIRED_GUARD:                 equ $0E4 ; "Imagine! A little kid...I need a vacation!"
FLAG_FORTUNE_TELLER_PRIZE:        equ $132 ; "You got the {item}! My crystal ball never lies"
FLAG_VERLA_MINERS_STORY_1:        equ $135 ; "Duke Mercator forced us to dig this mine"
FLAG_VERLA_MINERS_STORY_2:        equ $136 ; "What was the duke looking for in this mine"
FLAG_VERLA_MINE_OPENING:          equ $13D ; "It will be opened soon!"
FLAG_MARKET_CLOSED:               equ $152 ; "Was the market already closed?";
                                           ; 2nd progress table, rank 2
FLAG_FAREWELL_NPC:                equ $15B ; "Take care of yourself!"

; --- set by the packed script table (assets_packed/script/*.bin) -----
;
; The script table's SetFlag command is a word with bit 15 clear,
; cmd ((word & $1C00) >> 10) = 5 and param (word & $3FF) < 1000, where
; param is the flag id in the usual packing. 26 such entries covering
; 23 distinct flags, byte-for-byte the same set in all five regional
; script binaries. The 7 below are the ones no other site references.

FLAG_MADAME_YARD_TOO_YOUNG:       equ $0C6 ; "You're too young for Madame Yard's"
FLAG_CASTLE_ENTRY_REFUSED:        equ $0C8 ; "I cannot allow you inside"
FLAG_RAFT_FATHER_ASKED:           equ $0E0 ; "You need a raft...find my son"
FLAG_RAFT_SON_ASKED:              equ $0E1 ; "go on up and cut the tree"
FLAG_BOSS_FAREWELL_SEEN:          equ $1C6 ; ? "AFTER A LONG SLEEP I SHALL
                                           ; RETURN TO THIS WORLD"
FLAG_MIR_OFFER_ACCEPTED:          equ $1C7 ; Mir's "go back now" prompt, yes

; --- 3rd progress table, no other reference --------------------------

FLAG_PROGRESS_C_STEP2:            equ $13C ; ? 3rd progress table, rank 2
FLAG_PROGRESS_C_STEP3:            equ $13F ; ? 3rd progress table, rank 3

; =====================================================================
; Behaviour-script flags (scratch/behav/*.yaml)
;
; Entity behaviour scripts have four flag opcodes - BHV_SET_FLAG ($41),
; BHV_WAIT_FOR_FLAG_SET ($42), BHV_CLEAR_FLAG ($43) and
; BHV_WAIT_FOR_FLAG_CLEAR ($46). Unlike everywhere else these store
; the byte and bit as two separate script bytes (LoadFlagCmdArgs:
; d6 = BehavParam = byte offset, d7 = script arg 2 = bit), so the ids
; below are reassembled as (byte << 3) | bit to match the rest of this
; file - the same thing the editor does when it reads them.
;
; 984 flag commands across 553 behaviours, 245 distinct ids. These are
; overwhelmingly room-local puzzle state: one behaviour sets the flag
; (room cleared, switch pressed) and a door or obstacle in the same or
; an adjacent room waits on it. Names are therefore anchored to the
; room whose entity sets the flag, cross-referenced from
; scratch/rooms/*.yaml; where one room owns several flags they are
; suffixed _A, _B, ... in ascending id order. All are placeholders.
; =====================================================================

FLAG_ROOM_012_A: equ $002 ; 012 Switch Room; waited on in 5, 15
FLAG_ROOM_601:   equ $013 ; 601 Ver1 (Sacrifical Rites)
FLAG_ROOM_756:   equ $019 ; 756 Mummy Pit
FLAG_ROOM_051:   equ $01F ; 051 Ver1 (Duke)
FLAG_ROOM_602:   equ $024 ; 602 Ver2 (Deserted)
FLAG_ROOM_180:   equ $025 ; 180 Prospero's Room; waited on in 175
FLAG_ROOM_183:   equ $026 ; 183 Thieves' Hideout
FLAG_ROOM_633:   equ $029 ; 633 Ver1 (First Visit)
FLAG_ROOM_763:   equ $02B ; 763 Ladder Room
FLAG_BHV_043:    equ $043 ; behaviour script only; no room entity uses it
FLAG_ROOM_181:   equ $050 ; 181 Orc Room
FLAG_ROOM_226_A: equ $051 ; 226 Cliff Top with Silver Knight
FLAG_ROOM_019:   equ $054 ; 019 Room with Locked Door
FLAG_ROOM_012_B: equ $057 ; 012 Switch Room
FLAG_ROOM_190:   equ $058 ; 190 Prison Cell Guard Room
FLAG_ROOM_226_B: equ $059 ; 226 Cliff Top with Silver Knight
FLAG_ROOM_203:   equ $05A ; 203 Knight Pit Trap
FLAG_ROOM_025:   equ $05C ; 025 Mushroom Room
FLAG_ROOM_050:   equ $05D ; 050 Mummy & Knight Room
FLAG_ROOM_048:   equ $05E ; 048 Unicorn Room
FLAG_ROOM_252:   equ $05F ; 252 Purple Skeleton Room
FLAG_ROOM_247:   equ $060 ; 247 Stairs to Pit
FLAG_ROOM_268:   equ $061 ; 268 Path to Third Boss Room
FLAG_ROOM_091:   equ $062 ; 091 Dungeon
FLAG_ROOM_254:   equ $063 ; 254 Path to First Boss Room
FLAG_ROOM_324:   equ $064 ; 324 Orange Orc Room
FLAG_ROOM_239:   equ $065 ; 239 Lizard Room; +1 more setter(s)
FLAG_ROOM_283:   equ $068 ; 283 Junction Room
FLAG_ROOM_250:   equ $069 ; 250 Unicorn Crossroads
FLAG_ROOM_228:   equ $06A ; 228 Crossroads with Giants
FLAG_ROOM_004:   equ $06B ; 004 Bubble Room
FLAG_ROOM_565:   equ $06C ; 565 Northwest (Orc Kings)
FLAG_ROOM_568:   equ $06D ; 568 North (Waterfall, Orc Kings)
FLAG_ROOM_212:   equ $06E ; 212 Room with Orc and Giants
FLAG_BHV_070:    equ $070 ; behaviour script only; no room entity uses it
FLAG_ROOM_640:   equ $071 ; 640 Greenmaze Switch Room
FLAG_ROOM_576:   equ $072 ; 576 Center Hub
FLAG_ROOM_385_A: equ $073 ; 385 Green Skeleton Maze; waited on in 388
FLAG_ROOM_385_B: equ $074 ; 385 Green Skeleton Maze; waited on in 390
FLAG_ROOM_347:   equ $075 ; 347 Green Boulder Puzzle Room; waited on in 330, 334
FLAG_ROOM_810_A: equ $076 ; 810 6F
FLAG_ROOM_810_B: equ $077 ; 810 6F; waited on in 808
FLAG_ROOM_249:   equ $078 ; 249 Door Lock Switch Room
FLAG_ROOM_231:   equ $079 ; 231 Spike Room
FLAG_ROOM_258:   equ $07A ; 258 Hidden Switch Room
FLAG_BHV_07B:    equ $07B ; behaviour script only; no room entity uses it
FLAG_ROOM_082:   equ $07C ; 082 Pot Elevator Puzzle Room
FLAG_ROOM_799_A: equ $07D ; 799 First Challenge (Switches); waited on in 787
FLAG_ROOM_800:   equ $07E ; 800 Second Challenge (Boulders); waited on in 787
FLAG_ROOM_801:   equ $07F ; 801 Third Challenge (Golems); waited on in 787
FLAG_ROOM_798:   equ $080 ; 798 Fourth Challenge (Platforms); waited on in 787
FLAG_ROOM_804:   equ $081 ; 804 Pit - 1F; waited on in 805
FLAG_ROOM_803:   equ $082 ; 803 Pit - B1F; waited on in 805
FLAG_ROOM_805_A: equ $083 ; 805 Pit - B2F
FLAG_ROOM_805_B: equ $084 ; 805 Pit - B2F; waited on in 803
FLAG_ROOM_805_C: equ $085 ; 805 Pit - B2F
FLAG_ROOM_343:   equ $086 ; 343 Stairs to Key Room
FLAG_ROOM_319:   equ $087 ; 319 Ice Sword Switch Room
FLAG_ROOM_799_B: equ $088 ; 799 First Challenge (Switches)
FLAG_ROOM_799_C: equ $089 ; 799 First Challenge (Switches)
FLAG_ROOM_116:   equ $08A ; 116 Mimic Room; waited on in 117
FLAG_ROOM_128:   equ $08B ; 128 Purple Lizard Trap Room
FLAG_ROOM_309:   equ $08C ; 309 Wooden Platform Switch Puzzle Room
FLAG_ROOM_312:   equ $08D ; 312 Grey Platform Jumping Switch Room
FLAG_ROOM_311:   equ $08E ; 311 Green Boulder Switch Room
FLAG_ROOM_307:   equ $08F ; 307 Revolving Spiked Ball Switch Puzzle
FLAG_ROOM_052:   equ $090 ; 052 Ver2 (Zak & Dexter); +2 more setter(s)
FLAG_ROOM_097_A: equ $095 ; 097 Nigel's Room; +1 more setter(s)
FLAG_ROOM_097_B: equ $096 ; 097 Nigel's Room
FLAG_ROOM_053_C: equ $098 ; 053 Ver3 (Duke & Kayla)
FLAG_ROOM_081:   equ $099 ; 081 Kayla Trap Room
FLAG_ROOM_043:   equ $09B ; 043 Cell 3 (Maid)
FLAG_ROOM_098:   equ $09C ; 098 Ver1 (Ink & Wally)
FLAG_ROOM_681:   equ $0A3 ; 681 Ver1 (Monsters)
FLAG_ROOM_225:   equ $0A7 ; 225 Ver2 (Kayla)
FLAG_ROOM_032:   equ $0B0 ; 032 Ver1 (First Visit)
FLAG_ROOM_762:   equ $0B9 ; 762 Hidden Door Room
FLAG_ROOM_778:   equ $0BA ; 778 Giants
FLAG_ROOM_779:   equ $0BB ; 779 Locked Door
FLAG_ROOM_783:   equ $0BC ; 783 Steps to Top
FLAG_ROOM_782:   equ $0BD ; 782 Skeletons, Miro
FLAG_ROOM_781:   equ $0BE ; 781 Jewel Room
FLAG_ROOM_072:   equ $100 ; 072 West Tower
FLAG_ROOM_090:   equ $101 ; 090 West Tower
FLAG_ROOM_104:   equ $102 ; 104 West Tower
FLAG_ROOM_105:   equ $103 ; 105 Tower Bedroom Entrance
FLAG_ROOM_108:   equ $104 ; 108 West Tower Bedroom
FLAG_ROOM_532:   equ $108 ; 532 Massan 1 (Underground Passage)
FLAG_ROOM_580:   equ $109 ; 580 West Exit
FLAG_ROOM_590:   equ $10A ; 590 Southeast Exit
FLAG_ROOM_589:   equ $10B ; 589 Southeast Exit
FLAG_ROOM_581:   equ $10C ; 581 East Exit
FLAG_ROOM_563:   equ $110 ; 563 South (Gnome Dance)
FLAG_ROOM_560_A: equ $111 ; 560 West (Einstein, Cutter)
FLAG_ROOM_562:   equ $112 ; 562 Southeast
FLAG_BHV_113:    equ $113 ; behaviour script only; no room entity uses it
FLAG_ROOM_567_A: equ $114 ; 567 Northeast (Vines)
FLAG_ROOM_567_B: equ $115 ; 567 Northeast (Vines)
FLAG_ROOM_567_C: equ $116 ; 567 Northeast (Vines)
FLAG_ROOM_567_D: equ $117 ; 567 Northeast (Vines)
FLAG_ROOM_510:   equ $118 ; 510 Greenmaze Entrance; waited on in 511
FLAG_ROOM_511:   equ $119 ; 511 Greenmaze - Sun Stone; waited on in 510
FLAG_ROOM_512:   equ $11A ; 512 Massan; waited on in 534
FLAG_ROOM_534:   equ $11B ; 534 Mercator Coast; waited on in 512
FLAG_ROOM_537:   equ $11C ; 537 Verla; waited on in 539
FLAG_ROOM_539:   equ $11D ; 539 Mercator; waited on in 537
FLAG_ROOM_513:   equ $11E ; 513 Lake Shrine; waited on in 536
FLAG_ROOM_536:   equ $11F ; 536 Destel; waited on in 513
FLAG_ROOM_560_B: equ $121 ; 560 West (Einstein, Cutter)
FLAG_ROOM_560_C: equ $122 ; 560 West (Einstein, Cutter)
FLAG_ROOM_560_D: equ $123 ; 560 West (Einstein, Cutter)
FLAG_ROOM_560_E: equ $125 ; 560 West (Einstein, Cutter)
FLAG_ROOM_535:   equ $128 ; 535 Mountainous Region; waited on in 538
FLAG_ROOM_538:   equ $129 ; 538 Mercator; waited on in 535
FLAG_BHV_12A:    equ $12A ; behaviour script only; no room entity uses it
FLAG_BHV_12B:    equ $12B ; behaviour script only; no room entity uses it
FLAG_ROOM_711:   equ $133 ; 711 Ver1 (Before Rescue)
FLAG_ROOM_722:   equ $134 ; 722 Ver1 (Before Rescue)
FLAG_ROOM_492:   equ $138 ; 492 North (Zak)
FLAG_ROOM_723:   equ $141 ; 723 Ver2 (After Rescue)
FLAG_ROOM_093:   equ $142 ; 093 South Tower
FLAG_ROOM_567_E: equ $145 ; 567 Northeast (Vines)
FLAG_ROOM_650:   equ $146 ; 650 Room 9, Dead and End
FLAG_ROOM_488:   equ $147 ; 488 Lake (Duke Cutscene); waited on in 525
FLAG_ROOM_802:   equ $148 ; 802 Helga's Room
FLAG_ROOM_281:   equ $149 ; 281 Pockets Treasure Room
FLAG_ROOM_387:   equ $14E ; 387 Lantern Room
FLAG_ROOM_486:   equ $157 ; 486 Northeast (Godess Statue, Bridge)
FLAG_ROOM_408:   equ $15A ; 408 First Raft Landing; waited on in 406
FLAG_ROOM_308:   equ $15D ; 308 Entrance Room
FLAG_ROOM_293:   equ $15E ; 293 Unicorn Room
FLAG_ROOM_333:   equ $15F ; 333 Hallway to Treasure
FLAG_ROOM_306:   equ $190 ; 306 Green Golem Room
FLAG_ROOM_317:   equ $191 ; 317 Spiked Walkway
FLAG_ROOM_358:   equ $192 ; 358 Switch & Warp Room
FLAG_ROOM_357:   equ $193 ; 357 Spiked Pathway to Switch
FLAG_ROOM_367:   equ $194 ; 367 Godess Statue and Moving Platform Room
FLAG_ROOM_365:   equ $195 ; 365 Green Skeleton and Golem Switch Room
FLAG_ROOM_566:   equ $196 ; 566 Center (Swamp)
FLAG_ROOM_321:   equ $197 ; 321 Golem Switch Room; waited on in 337
FLAG_ROOM_392:   equ $198 ; 392 Church Maze
FLAG_ROOM_391_A: equ $1A0 ; 391 Three Lizard Switch Room
FLAG_ROOM_391_B: equ $1A1 ; 391 Three Lizard Switch Room
FLAG_ROOM_391_C: equ $1A2 ; 391 Three Lizard Switch Room
FLAG_ROOM_288:   equ $1A3 ; 288 Stone Warrior Room
FLAG_ROOM_119:   equ $1A4 ; 119 Gold Warrior Arena
FLAG_ROOM_121:   equ $1A5 ; 121 Spinner 2 Arena
FLAG_BHV_1A6:    equ $1A6 ; behaviour script only; no room entity uses it
FLAG_ROOM_120:   equ $1A7 ; 120 Sub-Boss Corridor 2
FLAG_BHV_1A8:    equ $1A8 ; behaviour script only; no room entity uses it
FLAG_ROOM_118:   equ $1A9 ; 118 Sub-Boss Corridor 1
FLAG_ROOM_346:   equ $1AA ; 346 Unicorn Fight Room
FLAG_ROOM_509:   equ $1C1 ; 509 Mountains 1 (Grey Giants, Red Unicorns)
FLAG_ROOM_461:   equ $1C3 ; 461 Outside Twinkle Village
FLAG_ROOM_348:   equ $1CD ; 348 Treasure Room

; =====================================================================
; Room flag-action tables (assets_packed/roomdata/flagactions/*.bin)
;
; Twelve room-keyed tables consulted on room load. All terminate on a
; negative room word. The bit is stored in three different places
; depending on the table, so take care when hand-decoding:
;
;   SpriteVisibility  4B {room.w, byte(b7=invert), (bit<<5)|sprite}
;   RoomCleared       4B {room.w, byte, (bit<<5)|sprite}
;   LockedDoorSprite  4B  as RoomCleared - also the unlock target of
;                         CheckUnlockDoor / UnlockDoor (key doors)
;   PermanentSwitch   4B  as RoomCleared - re-presses pressed switches
;   OneTimeEvent      6B {room.w, byteA(b7=inv), (bitA<<5)|sprite,
;                         byteB(b7=inv), bitB} - hides on A AND B
;   SacredTree        4B {room.w, byte, bit}
;   Lantern           4B {room.w, byte, bit}
;   LifestockSold     4B {room.w, byte, bit}
;   RoomGfxSwap       4B {room.w, byte(neg=unconditional),
;                         (swap<<3)|bit}   <- bit is the LOW 3 bits
;   LockedDoorGfxSwap 4B  as RoomGfxSwap
;   TreeWarpGfxSwap   4B  as RoomGfxSwap, tests bit AND bit+1
;   RoomTransition    6B {orig.w, variant.w, byte, bit} - substitutes
;                         a story variant of a room; later entries win
;
; RoomVisitedFlagLookup is deliberately absent: it indexes
; g_RoomVisitedFlags, a separate array, not these flags.
;
; 259 distinct flags across the twelve tables; 198 were already named
; from code, scripts or behaviours, which is a useful cross-check -
; e.g. $002 is a PermanentSwitch in room 12, matching the behaviour
; evidence. The 61 below are new. JP swaps in _jp variants of
; spritevisibility, onetime, roomgfxswap and tileswaps.
; =====================================================================

FLAG_DOOR_197:          equ $031 ; door unlocked (gfx swap); Spiked Ball Walkway
FLAG_DOOR_217:          equ $032 ; door unlocked (gfx swap); Hall with Locked Door
FLAG_DOOR_021:          equ $033 ; door unlocked; Spiked Floor Room
FLAG_DOOR_001:          equ $034 ; door unlocked (gfx swap); Room with Platforms and Locked Door
FLAG_DOOR_019:          equ $035 ; door unlocked (gfx swap); Room with Locked Door
FLAG_DOOR_030:          equ $036 ; door unlocked; Room with Orcs Guarding Locked Door
FLAG_DOOR_038:          equ $03A ; door unlocked (gfx swap); Dungeon Room with Locked Door
FLAG_DOOR_317:          equ $03C ; door unlocked; Spiked Walkway
FLAG_DOOR_306:          equ $03D ; door unlocked; Green Golem Room
FLAG_DOOR_638:          equ $03E ; door unlocked (gfx swap); Northeast
FLAG_DOOR_179:          equ $03F ; door unlocked; Moving Platform Room
FLAG_DOOR_779:          equ $041 ; door unlocked (gfx swap); Locked Door
FLAG_DOOR_228:          equ $042 ; door unlocked; Crossroads with Giants
FLAG_DOOR_283:          equ $044 ; door unlocked (gfx swap); Junction Room
FLAG_DOOR_289:          equ $045 ; door unlocked (gfx swap); Vase Switch Puzzle Room
FLAG_DOOR_288:          equ $046 ; door unlocked (gfx swap); Stone Warrior Room
FLAG_DOOR_287:          equ $047 ; door unlocked (gfx swap); Purple Skeleton Chest Room
FLAG_DOOR_364:          equ $049 ; door unlocked; Orange Orc Room
FLAG_DOOR_330:          equ $04A ; door unlocked (gfx swap); Green Bubble Room
FLAG_DOOR_341:          equ $04B ; door unlocked (gfx swap); Locked Door to Treasures
FLAG_DOOR_416:          equ $04C ; door unlocked; Purple Lizards and Spiked Balls
FLAG_DOOR_390:          equ $04D ; door unlocked; Key Chest Room
FLAG_DOOR_376:          equ $04E ; door unlocked; Stairs to Lifestock Puzzle Room
FLAG_HIDE_032:          equ $0B1 ; sprite hidden; Ver1 (First Visit)
FLAG_LIFESTOCK_596:     equ $160 ; Life Stock sold; Shop
FLAG_LIFESTOCK_608:     equ $161 ; Life Stock sold; Inn - Downstairs
FLAG_LIFESTOCK_615:     equ $162 ; Life Stock sold; Shop
FLAG_LIFESTOCK_733:     equ $163 ; Life Stock sold; Shop - Front
FLAG_LIFESTOCK_517:     equ $164 ; Life Stock sold; Kelketo Waterfall Shop
FLAG_LIFESTOCK_526:     equ $165 ; Life Stock sold; Greedly's Shop, Front
FLAG_LIFESTOCK_720:     equ $167 ; Life Stock sold; Ver2 (After Rescue)
FLAG_SACRED_TREE_362_A: equ $170 ; sacred tree cut; Surface
FLAG_SACRED_TREE_362_B: equ $171 ; sacred tree cut; Surface
FLAG_SACRED_TREE_362_C: equ $172 ; sacred tree cut; Surface
FLAG_SACRED_TREE_362_D: equ $173 ; sacred tree cut; Surface
FLAG_SACRED_TREE_415:   equ $174 ; sacred tree cut; Tree Room
FLAG_SACRED_TREE_460_A: equ $175 ; sacred tree cut; Outside Mercator
FLAG_SACRED_TREE_460_B: equ $176 ; sacred tree cut; Outside Mercator
FLAG_SACRED_TREE_475:   equ $177 ; sacred tree cut; Mir's Tower 1 (Outside)
FLAG_SACRED_TREE_492_A: equ $178 ; sacred tree cut; North (Zak)
FLAG_SACRED_TREE_492_B: equ $179 ; sacred tree cut; North (Zak)
FLAG_SACRED_TREE_564_A: equ $17A ; sacred tree cut; East (Sun Stone)
FLAG_SACRED_TREE_564_B: equ $17B ; sacred tree cut; East (Sun Stone)
FLAG_SACRED_TREE_564_C: equ $17C ; sacred tree cut; East (Sun Stone)
FLAG_SACRED_TREE_564_D: equ $17D ; sacred tree cut; East (Sun Stone)
FLAG_SACRED_TREE_570:   equ $17E ; sacred tree cut; Massan 5 (Dahl Chest)
FLAG_SACRED_TREE_592_A: equ $17F ; sacred tree cut; Massan - Outside
FLAG_SACRED_TREE_592_B: equ $180 ; sacred tree cut; Massan - Outside
FLAG_SACRED_TREE_465:   equ $181 ; sacred tree cut; Mir's Tower 2 (Mushrooms, Orc Kings)
FLAG_LANTERN_368:       equ $1F0 ; lantern lit; Pit with Switch and Spiked Balls
FLAG_LANTERN_381:       equ $1F1 ; lantern lit; Pit Under Spiked Ball Room
FLAG_LANTERN_383:       equ $1F2 ; lantern lit; Dark Chest Mimic Room
FLAG_LANTERN_376:       equ $1F3 ; lantern lit; Stairs to Lifestock Puzzle Room
FLAG_LANTERN_389:       equ $1F4 ; lantern lit; Spiked Ball Stair Challenge
FLAG_LANTERN_397:       equ $1F5 ; lantern lit; Hidden Switch Barrier Room
FLAG_LANTERN_398:       equ $1F6 ; lantern lit; Stairs to Gola's Hands and Ifrit
FLAG_LANTERN_391:       equ $1F7 ; lantern lit; Three Lizard Switch Room
FLAG_LANTERN_416:       equ $1F8 ; lantern lit; Purple Lizards and Spiked Balls
FLAG_LANTERN_417:       equ $1F9 ; lantern lit; Miro
FLAG_LANTERN_374:       equ $1FA ; lantern lit; Iron Boots Room
FLAG_LANTERN_379:       equ $1FB ; lantern lit; Purple Ninja and Spectre Room

; =====================================================================
; Byte-level accesses that are really flag accesses
;
; 53 sites still read or write the flag block as bytes rather than
; through the macros. None of them can become TestFlag/SetFlag: the
; opcodes differ, so rewriting them would change the assembled bytes.
; They are listed here because several are genuine single-flag tests
; that do not look like one, and are easy to miss when tracing a flag.
;
; Bit 7 tested via the N flag - tst.b + bmi/bpl, equivalent to a btst
; of bit 7 but two bytes shorter:
;   combat.asm _HandleEnemyDeath   tst.b (g_Flags+5)  bmi
;                                    = FLAG_FAHL_DUEL_ACTIVE
;   customroomactions1.asm _Next7  tst.b (g_Flags)    bpl
;                                    = FLAG_MASSAN_MAYOR_SLEEP
;
; All eight bits at once:
;   customroomactions1.asm _Next12 cmpi.b #$FF,(g_Flags+$15)
;                                    = FLAGBYTE_CRYPT_GHOSTS complete
;
; Computed bit number (the flag is chosen at run time):
;   triggeractions.asm _ta21SetFlag  bset d0,(g_Flags+1)
;                                    = Greenpea ball cell, scratch 1-3
;
; Multi-bit reads, masked after loading the byte:
;   TA_0A    (g_Flags+2) & $18  bits 3-4   $013, $014
;   TA_0B    (g_Flags+2) & $14  bits 2,4   $012, $014
;   TA_5F    (g_Flags+1) & $0F  bits 0-3   scratch, all four set
;   CSA_0023 (g_Flags+1) & $C0  bits 6-7   scratch
;   CSA_0052 (g_Flags+1) & $C0  bits 6-7   scratch
;   CSA_0037 (g_Flags+$13) & $E0           FLAGBYTE_VASE_COUNTER
;   _Next19  (g_Flags+$13) & $E0           FLAGBYTE_VASE_COUNTER
;
; Whole-byte clears and stores:
;   mapload LoadRoom_0   clr.b (g_Flags+1)      scratch, every room load
;   mapload LoadGame     move.b #$03,(g_AdditionalFlags+$1B)
;                                              new-game chicken record
;   CSA_0030 / CSA_0159  clr.b of the two counters
;   CSA_00E5             clr.b (g_Flags+8) and (g_Flags+9)  - see below
;
; The remaining sites are counter arithmetic on the FLAGBYTE_/FLAGWORD_
; fields below, plus 13 lea (g_Flags) table scans (the room flag-action
; and behaviour readers).
;
; CSA_00E5 is worth a second look. It is the Mercator Crypt 'Dead and
; End' Dexter death scene, and it clears flag bytes $08 and $09
; outright - which is where 13 door-unlock flags live ($041-$047 and
; $049-$04E: Mir's Tower 7F, Verla Mine, Destel Well x4, Lake Shrine
; x2, Labyrinth x4). Normal progression reaches the crypt before those
; dungeons, so it may never be observable, but it does re-lock them.
; The same byte $08 is what CheckForDebugButtons tests with
; tst.b (g_Flags+8) before locking up in the dog-transform loop; the
; tamper-trap reading of that check sits oddly with the byte holding
; ordinary door flags, so one of the two interpretations is wrong.
; =====================================================================

; =====================================================================
; Non-bitfield bytes inside the same block
;
; These share the array but hold counters and packed values rather than
; independent bits, so they have no flag id. Offsets are relative to
; g_Flags, e.g. move.b (g_Flags+FLAGBYTE_CHICKEN_TOSS_BEST).l,d0
; =====================================================================

FLAGBYTE_EARLY_STORY:             equ $00  ; intro, Massan, Swamp Shrine, Thieves
                                           ; Hideout; only ever read as a byte by
                                           ; the bit 7 tst.b in _Next7
FLAGBYTE_SCRATCH:                 equ $01  ; per-room scratch, see ids $008-$00F
FLAGBYTE_GUMI_PROGRESS:           equ $02  ; Massan/Waterfall/Gumi/Swamp/Ryuma;
                                           ; TA_0A and TA_0B mask bits 2-4
FLAGBYTE_MERCATOR_PROGRESS:       equ $05  ; Mercator arrival and castle steps;
                                           ; bit 7 is FLAG_FAHL_DUEL_ACTIVE, read
                                           ; by the tst.b in _HandleEnemyDeath
FLAGBYTE_DOORS_1:                 equ $08  ; door unlocks $041-$047; cleared
                                           ; wholesale by CSA_00E5 and tested by
                                           ; CheckForDebugButtons
FLAGBYTE_DOORS_2:                 equ $09  ; door unlocks $049-$04E; also cleared
                                           ; by CSA_00E5
FLAGBYTE_VASE_COUNTER:            equ $13  ; bits 5-7: Old Woman's House vase task
                                           ; counter, capped at 3 (bits 0-4 are
                                           ; ordinary flags)
FLAGBYTE_CRYPT_GHOSTS:            equ $15  ; the eight ghost bits; $FF when done
FLAGBYTE_CHICKEN_TOSS_COUNT:      equ $31  ; chickens returned this round; cleared
                                           ; when a round starts
FLAGBYTE_FAHL_WINS:               equ $3A  ; dojo wins; milestones at 5/10/20/30/
                                           ; 40/50
FLAGBYTE_CHICKEN_TOSS_BEST:       equ $3B  ; best round; seeded to 3 on a new game,
                                           ; raised only when beaten
FLAGWORD_GREENPEA_WINNINGS:       equ $3C  ; word: net gold won at Greenpea; the
                                           ; script bars play above 1600
