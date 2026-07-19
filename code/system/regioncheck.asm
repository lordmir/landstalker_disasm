        if      REGION_CHECK
                            Align   $2
RegionCheckRoutine:         include "code\system\regioncheck_routine.asm"
RegionCheckStrings:         include "code\system\regioncheck_strings.asm"
SystemFont:                 incbin  "assets_packed\graphics\fonts\system.bin"
        endif
