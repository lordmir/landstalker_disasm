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
            
UnlockSRAM  macro
            if EXPANDED
            move.b #03, ($A130F1).l
            endif
            endm
            
LockSRAM    macro
            if EXPANDED
            move.b #00, ($A130F1).l
            endif
            endm
            
ExpandBsr   macro
            if EXPANDED
            jsr     \1
            else
            bsr.s   \1
            endif
            endm
