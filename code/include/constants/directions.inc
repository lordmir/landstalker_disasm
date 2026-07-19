; Facing direction, held in the top two bits of RotationAndSize (and of
; other packed direction bytes). On the isometric grid:
;   NE = -Y, SE = +X, SW = +Y, NW = -X
DIR_NE:           equ 0<<6 ; $00
DIR_SE:           equ 1<<6 ; $40
DIR_SW:           equ 2<<6 ; $80
DIR_NW:           equ 3<<6 ; $C0
DIR_MASK:         equ 3<<6 ; $C0
