; Values taken by BehavParam while an engine-injected carried-object
; command runs (BHV_THROWN_OBJECT / BHV_THROWN_SHOP_ITEM and
; BHV_PUT_DOWN_OBJECT / BHV_PUT_DOWN_SHOP_ITEM). No behaviour script
; contains these commands: gamelogic4's carry state machine writes
; the phase and command into BehavParam:BehavCmd directly, and the
; handlers in spritebehaviours.asm advance the phase every tick.
;
; The throw phase indexes ThrowSpeedTable (spritebehaviours.asm):
; two per-tick speed profiles back to back - a straight drop (no
; d-pad held) and a directional throw - ending at the $FF
; terminator. The first THROWPHASE_RIDE ticks of each profile still
; ride a player jump (Z snapped above his head), and from each
; profile's *_SETTLE phase onward a grounded object comes to rest
; (restoring the behaviour saved at pick-up).

THROWPHASE_DROP:         equ $00 ; straight-drop profile start
THROWPHASE_DROP_SETTLE:  equ $09 ; a grounded drop can now settle
THROWPHASE_DROP_END:     equ $17 ; drop profile exhausted: settle
THROWPHASE_THROW:        equ $17 ; directional-throw profile start
THROWPHASE_THROW_SETTLE: equ $20 ; a grounded throw can now settle
THROWPHASE_THROW_END:    equ $39 ; throw profile exhausted ($FF): settle
THROWPHASE_RIDE:         equ $03 ; jump-riding ticks at a profile start

; Put-down phases: the object slides with momentum inherited from a
; moving platform until it stops or hits something. PUTDOWNPHASE_DELAY
; (set when the platform is moving against the player's facing) skips
; the first slide tick.
PUTDOWNPHASE_SLIDE:      equ $00
PUTDOWNPHASE_DELAY:      equ $FF
