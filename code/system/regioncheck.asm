        if      ENABLE_REGION_CHECK
                            Align   $2
RegionCheckRoutine:         include "code\system\regioncheck_routine.asm"
RegionCheckStrings:         include "code\system\regioncheck_strings.asm"
                            Align   $2
SystemFont:                 incbin  "assets_packed\graphics\fonts\system.bin"
        endif
