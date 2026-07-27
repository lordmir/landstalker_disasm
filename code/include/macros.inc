False:                  equ     0
True:                   equ     1

US:                     equ     0
JP:                     equ     1
UK:                     equ     2
FR:                     equ     3
DE:                     equ     4
US_BETA:                equ     5

ScriptID    macro
            if      narg<>2
            inform  2,"Wrong number of arguments"
            mexit
            endif
            dc.w Script+(\1*2)+(\2*2)+1-*
            endm

ScriptJump  macro
            if      narg<>2
            inform  2,"Wrong number of arguments"
            mexit
            endif
            dc.w \1+(\2*2)-*
            endm

Align       macro
            if      narg<>1
            inform  2,"Wrong number of arguments"
            mexit
            endif
            if      \1<2
            mexit
            endif
            if      (\1-*%\1)=\1
            mexit
            endif
            dcb.b   (\1-*%\1),$FF
            endm

PadTo       macro
            if narg<>1
            inform  2,"Wrong number of arguments"
            mexit
            endif
            if      \1<*
            inform  2,"Unable to pad to \1: PC is too high"
            mexit
            elseif \1=*
            mexit
            endif
            dcb.b   (\1-*),$FF
            endm
            
ROM_End     macro
            if     EXPANDED
            dc.l   $3FFFFF
            else
            dc.l   $1FFFFF
            endif
            endm
            
; On the expanded ROM the audio data (DAC/music/instruments) lives in the
; top of the ROM at $200000-$3FFFFF, the same window SRAM is mapped into by
; $A130F1. Before exposing SRAM we must halt the Z80 so the sound driver
; cannot fetch samples from that window (they would read SRAM = corrupted
; audio). Interrupts are masked too, because the VBlank handler also does a
; Z80 busreq and RELEASES it, which would un-halt the Z80 mid-window. The
; halt/resume bodies live in SRAMBeginAccess/SRAMEndAccess (savegame.asm) so
; each call site stays the same size as the plain $A130F1 write it replaces,
; leaving nearby branch ranges unchanged. The caller's interrupt state is
; parked on the stack between the paired macros.
UnlockSRAM  macro
            if EXPANDED
            move    sr,-(sp)                    ; Save interrupt state
            jsr     (SRAMBeginAccess).l         ; Mask ints, halt Z80, map SRAM
            endif
            endm

LockSRAM    macro
            if EXPANDED
            jsr     (SRAMEndAccess).l           ; Restore ROM, resume Z80
            move    (sp)+,sr                    ; Restore interrupt state
            endif
            endm
            
ExpandBsr   macro
            if EXPANDED
            jsr     \1
            else
            bsr.s   \1
            endif
            endm

; Fakes the player's heightmap position at grid cell (X, Y) for a door
; check. The heightmap is a fixed-stride array from g_HeightMap ($94 bytes
; per row, 2 bytes per column); Player_HeightmapOffset holds the low word
; of the cell address ($FF0000 | offset). \1 = X cell, \2 = Y cell.
SetHeightmap macro
            if      narg<>2
            inform  2,"Wrong number of arguments"
            mexit
            endif
            move.w  #((g_HeightMap+(\2*$94)+(\1*2))&$FFFF),(Player_HeightmapOffset).l
            endm

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
