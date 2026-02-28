;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;         Cube / Idaware Sound Driver Disassembly for Landstalker          ;;
;;         =======================================================          ;;
;;                                                                          ;;
;; BUILDOPTS: -D EXPANDED={0|1} (1 for the 4MB expanded version of the ROM) ;;
;;                                                                          ;;
;; To build:                                                                ;;
;;    tools\build\asm68k.exe main.asm -o cube.p -D EXPANDED={0|1}           ;;
;;    tools\build\p2bin.exe cube.p cube.bin -l 0xff -r 0x0000-0x1f7f -k     ;;
;;                                                                          ;;
;;      Credits to Wiz (github.com/wizardwhosaysni) for his excellent       ;;
;;   disassembly of the Shining Force II sound driver, which served as a    ;;
;;                     reference for this project.                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; See: https://github.com/ShiningForceCentral/SF2DISASM/tree/build/standard/disasm/data/sound
; and  https://github.com/ShiningForceCentral/SF2DISASM/tree/build/standard/disasm/code/common/tech/sound
; for more details on the sound driver and its inner workings. (Credits to Wiz for the disassembly and documentation)

        cpu z80
        listing	off
        phase	0
; ---------------------------------------------------------------------------
        include "registers.inc"
; ---------------------------------------------------------------------------
        include "sounddrv.asm"
; ---------------------------------------------------------------------------
		include "instrument_params.asm"
		include "channel_data.asm"
		include "vars.asm"
		include "samples.asm"
		include "sfx.asm"
		include "ram.asm"
; ---------------------------------------------------------------------------
		end
