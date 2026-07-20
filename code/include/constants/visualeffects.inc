; DoVisualEffect ids (code/graphics/visualeffects1.asm). 0/1 share a
; handler that ignores the id, and 9/A rerun 7/8 with an alternate
; sparkle centre.
VFX_WARP_PAD:         equ $00 ; warp-pad darkness sweep
VFX_WARP_PAD_2:       equ $01 ; same handler as 0
VFX_TREE_WARP_OUT:    equ $02 ; line-scroll waves build, palette darkens
VFX_TREE_WARP_IN:     equ $03 ; waves die down, fade in from black
VFX_BLACK_FLASH:      equ $04 ; active palette to greyscale
VFX_WHITE_FLASH:      equ $05 ; inverted greyscale
VFX_RED_FLASH:        equ $06 ; keep red, crush green and blue
VFX_NOLE_WARP_OUT:    equ $07 ; whiteout + rising sparkles + Kazalt strobe
VFX_NOLE_WARP_IN:     equ $08 ; sparkles wind down, fade back in
VFX_NOLE_WARP_OUT_2:  equ $09 ; as 7, alternate sparkle centre (cutscene)
VFX_NOLE_WARP_IN_2:   equ $0A ; as 8, alternate sparkle centre (cutscene)
