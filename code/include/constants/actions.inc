; Action word (QueuedAction/PrevAction and Player_Action): a bitfield of
; requested actions, consumed each frame by the movement/game logic and
; by UpdateSpriteFrame to select the animation:
;   $0001/$0002/$0004/$0008  walk NE(-Y) / SW(+Y) / NW(-X) / SE(+X)
;   $0010/$0020              fall / jump
;   $0040/$0080/$00C0        pick up / put down
;   $0100-$0700              attack / special animation number
;                            (sprite-specific: player sword swings,
;                            enemy attacks, Duke sitting, mummy get-up)
;   $1000                    ladder climb
;   $2000                    take damage
;   $4000                    rebuild sprite piece layout (set on throw,
;                            consumed by the sprite render code)

; bit numbers (bset/bclr/btst on the full word)
ACTB_WALK_NE:     equ 0
ACTB_WALK_SW:     equ 1
ACTB_WALK_NW:     equ 2
ACTB_WALK_SE:     equ 3
ACTB_FALL:        equ 4
ACTB_JUMP:        equ 5
ACTB_PICKUP:      equ 6
ACTB_PUTDOWN:     equ 7
ACTB_CLIMB:       equ 12
ACTB_DAMAGE:      equ 13
ACTB_REFRESH:     equ 14

; bit numbers within the high byte (byte-sized ops on QueuedAction or
; Player_Action address directly)
ACTBH_CLIMB:      equ 4
ACTBH_DAMAGE:     equ 5
ACTBH_REFRESH:    equ 6

; word values and masks
ACT_WALK_MASK:    equ $000F
ACT_FALL:         equ $0010
ACT_JUMP:         equ $0020
ACT_AIR_MASK:     equ $0030
ACT_PICKUP_MASK:  equ $00C0
ACT_ATTACK1:      equ $0100
ACT_ATTACK2:      equ $0200
ACT_ATTACK3:      equ $0300
ACT_ATTACK4:      equ $0400
ACT_ATTACK5:      equ $0500
ACT_ATTACK6:      equ $0600
ACT_ATTACK7:      equ $0700
ACT_ATTACK_MASK:  equ $0700
ACT_CLIMB:        equ $1000
ACT_DAMAGE:       equ $2000
ACT_REFRESH:      equ $4000
