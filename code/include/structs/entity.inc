; SpriteStructOffsets
X:                    equ $00
Y:                    equ $01
SubX:                 equ $02
SubY:                 equ $03
RotationAndSize:      equ $04
Height:               equ $05
TileSource:           equ $06
; StateFlags bits:
;   0 = Hidden/inactive. Set by HideSprite, cleared to (re)enable a sprite
;       (customroomactions2). Skips drawing (gamelogic3:ProjectSpriteToScreen), collision,
;       talk/pickup checks. Initialised from room sprite data bit 5.
;   3 = Shop-item pick-up latch: set once by EB_ShopItem when the player
;       lifts a shop item overhead (runs the shop script only once).
;   4 = Half movement speed (HandleDirectionalControl halves g_PlayerSpeed).
;       Initialised from room sprite data bit 4; cleared by trigger action TA_16.
;   5 = Grabbed by player (pickup stage 1, set in ProcessActionButton;
;       UpdateCarriedSpritePos makes it inherit Player_SpriteUnderneath).
;   6 = Carried above player's head (pickup stage 2; Z tracks
;       Player_HitBoxZEnd; cleared when thrown). Bits 1-2 and 7 appear unused.
StateFlags:           equ $08
Speed:                equ $09
; AnimCtrl: animation control byte.
;   Bits 0-6 = animation enabled: effectively a boolean -- only ever
;       written as $01 (every spawn path) or $00 (Mir's AI clears it to
;       freeze his animation). While zero, UpdateSpriteFrame skips the
;       sprite and LookupSpriteAnimFlags returns the default; the $7F
;       masks in those routines just strip bit 7 for the test.
;   Bit 7 = frame dirty: set whenever AnimationFrame1 changes; tells the
;       render code (gamelogic3:_frameLoadSprite) to reload the sprite's frame
;       graphics, then cleared. Usually set together with RenderFlags bit 7.
AnimCtrl:             equ $0A
SpriteGraphic:        equ $0B
; InteractFlags bits (bits 0/2/4/5/7 initialised from room sprite data byte 2):
;   0 = No rotation/auto-animation: sprite has a single orientation and its
;       AnimationIndex is managed manually (chests, Zak). Skips
;       rotate-to-face-player in CheckTalk and idle anim updates.
;   1 = Hurt/knockback state. Set on taking damage (combat:StartEnemyHitstun),
;       blocks further damage while set, drives the damage flicker.
;   2 = Frictionless: not dragged along by the sprite it stands on
;       (MoveSpriteWithPlatform).
;   4 = Talkable NPC: has dialogue (CheckTalk, GetSpeakerSpriteId).
;   5 = Liftable: player can pick this sprite up (CheckPickUpEntity).
;   6 = Do not draw this frame (toggled rapidly for damage/blink flicker,
;       checked by gamelogic3:ProjectSpriteToScreen).
;   7 = Hostile: deals contact damage, targetable by sword, loads enemy
;       stats on room init (EB_MakeHostile / EB_MakeNonHostile).
InteractFlags:        equ $0C
; AnimPhase: animation phase counter. UpdateSpriteFrame advances it by Speed
; (2x Speed for walk cycles) every tick; when it wraps its threshold
; ($3F idle, $07/$0F walk) AnimationFrame1 steps to the next frame.
; The player walk code resets it to $FF on a direction change and
; increments it per tick. Enemy AIs also reuse it freely as a
; general-purpose state timer (e.g. attack windup/recovery counts).
AnimPhase:            equ $0D
; ScreenX/ScreenY (words): the sprite's projected screen position in VDP
; coordinates, recomputed each frame by gamelogic3:ProjectSpriteToScreen:
;   ScreenX = screen X = (CentreX-Z) - (CentreY-Z) - camera + $120
;   ScreenY = screen Y = ((CentreX-Z) + (CentreY-Z))/2  - camera + $E8
; Both cleared to 0 when the sprite is hidden, blinking or culled
; off-screen. Read by BuildVdpSpriteEntry to build VDP sprite attribute entries
; and to position status icons above the sprite. The previous frame's
; values are saved to PrevScreenX/PrevScreenY (gamelogic3:ProjectAllSprites).
ScreenX:              equ $0E
ScreenY:              equ $10
Z:                    equ $12
CentreX:              equ $14
CentreY:              equ $16
HitBoxXStart:         equ $18
HitBoxXEnd:           equ $1A
HitBoxYStart:         equ $1C
HitBoxYEnd:           equ $1E
; FallRate bit 7 = gravity disabled: set at spawn for static sprites
; (no speed, no behaviour parameter, not liftable), cleared when the
; sprite is picked up or thrown so it starts falling.
FallRate:             equ $20
JumpRate:             equ $21
GroundHeight:         equ $22
GroundType:           equ $23
AnimationIndex:       equ $24
AnimationIndex1:      equ $25
AnimationFrame:       equ $26
AnimationFrame1:      equ $27
HeightmapOffset:      equ $28
BehavParam:           equ $2A
BehavCmd:             equ $2B
QueuedAction:         equ $2C
Action1:              equ $2D
PrevAction:           equ $2E
AnimAction1:          equ $2F
SpriteUnderneath:     equ $30
BehaviourLUTPtr:      equ $32
BehaviourLUTIndex:    equ $34
; For enemies: the gold amount dropped (as a moneybag) when the item
; roll fails - zero means nothing is left behind. For chests: the
; contents item id ($3F = empty trapped chest). Cleared when an enemy
; corpse turns into an item box instead.
GoldOrChestContents:  equ $36
; AIState: state variable for the entity's AI -- enemy AIs step it
; through phases ($10/$20/$21...) and StartEnemyHitstun clears it on
; hit. Chest sprites reuse the same byte to hold their chest index;
; the chest code (chests1/chests2) uses the ChestIndex alias.
AIState:              equ $37
ChestIndex:           equ $37

; CombatFlags bits:
;   0 = Invincible: sword hits clink (SND_SwordHit) and deal no damage.
;       Toggled freely by boss AIs (Duke, Ifrit, Knight) for attack windows.
;   1 = Walk backwards: facing shown flipped 180 degrees and walk animation
;       plays in reverse (set by EB_EnableWalkBackwards, cleared by
;       EB_DisableWalkBackwards; the unicorns use it for their backwards charge).
;   2 = Died this frame: set when health reaches 0 (combat:MarkEnemyDead),
;       consumed by combat:ProcessDeadEnemies which runs the death/item-drop logic.
;   6 = Use alternate animation bank (+8 anim index offset) -- the
;       "disguised/second form" for mimic, mushroom, Duke-in-chair, Ifrit.
;   7 = Shop-item put-down latch: set once by EB_ShopItem when a shop
;       item settles on a counter tile. Bits 3-5 appear unused.
CombatFlags:          equ $38
FloorHeight:          equ $39
Dialogue:             equ $3A
SpriteType:           equ $3B
AttackStrength:       equ $3C
CurrentHealth:        equ $3E
CurrentSubHealth:     equ $3F
InitX:                equ $40
InitY:                equ $41
InitSubX:             equ $42
InitSubY:             equ $43
InitRotAndSize:       equ $44
InitHeight:           equ $45
InitTileSource:       equ $46
; RenderFlags bits:
;   0-2 = Charged-hit effect: StartEnemyHitstun records which charged
;       sword landed the hit (Magic/Ice/Thunder -> bit 0/1/2; a charged
;       Gaia Sword quakes instead). While in hitstun with any of these
;       set, BuildVdpSpriteEntry overlays that sword's hit effect
;       sprites instead of the plain blink flicker.
;   6 = No-clip move: set around EB_MoveNoClip movement (MoveSpriteForwardNoClip) so
;       the shared move routine skips collision detection.
;   7 = Layout dirty: rebuild the sprite's VDP piece layout and reload
;       frame tiles (consumed together with AnimCtrl bit 7 by
;       gamelogic3:_frameLoadSprite; set by AI/script code whenever it changes
;       the animation directly).
RenderFlags:          equ $48
; SavedSpeed: Speed saved by CheckPickUpEntity when the player lifts
; this sprite; restored with the Saved* behaviour fields at $5E-$69.
SavedSpeed:           equ $49
InitAnimCtrl:         equ $4A
InitSpriteGraphic:    equ $4B
InitInteractFlags:    equ $4C
; AICounter: general-purpose per-entity counter, used freely by boss and
; enemy AIs for attack phases (Gola, Ifrit, ghosts, knights...). The one
; engine-level use is the mummy (SPR_MUMMY3) revival: MarkEnemyDead sets
; it to 1 with a 50% chance, and ProcessDeadEnemies then steps a $38-frame
; get-up sequence ending with the mummy re-hostiled at full health.
AICounter:            equ $4D
; PrevScreenX/PrevScreenY (words): previous frame's ScreenX/ScreenY,
; saved by ProjectAllSprites before reprojection. BuildVdpSpriteEntry
; tests them to know whether the cached VDP sprite pieces are valid
; (zero = sprite was not drawn last frame).
PrevScreenX:          equ $4E
PrevScreenY:          equ $50
InitZ:                equ $52
HitBoxZEnd:           equ $54
HitBoxSubZEnd:        equ $55
; DrawOrder (word): isometric depth sort key, computed each frame by
; ProjectSpriteToScreen as (HitBoxXStart+HitBoxYStart)/2 + Height + Z
; + HitBoxZEnd (larger = nearer the camera). SortSpritesByDepth sorts the draw
; list descending on it, putting nearer sprites earlier in the VDP
; sprite list so they overlap the ones behind them.
DrawOrder:            equ $56
; TempHealth: backup of CurrentHealth for scripted knockout sequences:
; a cutscene action saves the player's health here, sets CurrentHealth
; to $00FF (near death) and flags g_Flags+5 bit 7; restored on the next
; room load (mapload) or by the follow-up cutscene action. Only the
; Player_TempHealth mirror is referenced.
TempHealth:           equ $58
TargetX:              equ $5A ; word: target X (12.4 pixels), set by behaviour cmd $5B
TargetY:              equ $5C ; word: target Y (12.4 pixels)
; SavedBehaviourLUTPtr (long, $5E-$61) / SavedBehavParam / SavedBehavCmd:
; together with SavedSpeed ($49), the behaviour state saved by
; CheckPickUpEntity when the player picks the sprite up. Restored by the
; carried/thrown behaviour handlers in OnTick (EB_ThrownObject / EB_PutDownObject)
; when the sprite is put down or lands -- unless the saved BehavCmd is
; itself a carried/thrown command ($10/$16/$2F/$32), in which case the
; behaviour is cleared or replaced instead.
SavedBehaviourLUTPtr: equ $5E
RepeatPtr:            equ $62
RepeatCount:          equ $66
SavedBehavParam:      equ $67
; InitCombatFlags: CombatFlags copy taken at spawn (InitialiseSprites),
; restored when the entity's behaviour state is reset (spritebehaviours).
InitCombatFlags:      equ $68
SavedBehavCmd:        equ $69
; InitBehavParam/InitBehavCmd: initial BehavParam+BehavCmd pair, saved
; as one word at spawn (InitialiseSprites) and restored as one word by
; CheckRespawnGhost to restart the behaviour script from its initial state.
InitBehavParam:       equ $6A
InitBehavCmd:         equ $6B
; MovedDirFlags: bits 0-3 are set when the entity moves in each of the
; four isometric directions (same layout as the Action1 walk bits:
; 0=NE/-Y, 1=SW/+Y, 2=NW/-X, 3=SE/+X), by both the player movement code
; and the entity behaviour move routines. ProcessGravity's helper
; (gamelogic2:GetDropDistance) tests the low nibble to decide whether to
; recompute FloorHeight. NB: initialised to $FF and never cleared, so in
; practice the recompute always runs -- looks like a vestigial
; optimisation. Bits 4-7 unused.
MovedDirFlags:        equ $6D
; Unk6E: no writer or dedicated reader found; only touched because the
; sprite-swap cutscene action (dialogueactions:SwapSpriteAppearance)
; swaps the word at $6E to move AnimFlags between the two entities.
Unk6E:                equ $6E
; AnimFlags is not runtime state: it is a per-SpriteGraphic capability byte
; looked up from the SpriteAnimFlags table (spritefuncs1.asm) by
; LookupSpriteAnimFlags; defaults to $01 for graphics not in the table.
; Bits (decoded by UpdateSpriteFrame):
;   0 = Has idle/stationary animation
;   1 = Idle animation uses separate anim bank (+8 anim index)
;   2 = Has jump animation (also selects alternate damage frame)
;   3 = Alternate walk animation handling (with bit 6 clear)
;   4 = Single orientation: no rotation-specific frames (always NW frame set)
;   5 = Has take-damage animation
;   6 = Extended animation set (larger frame mask, different attack/jump
;       anim indices)
AnimFlags:            equ $6F
TileCopySource:       equ $71
InitBehaviourLUTPtr:  equ $72
InitGoldOrChestCont:  equ $76
ItemDrop:             equ $77
; ItemDropProbability (word): initial 1-in-N item drop probability,
; written by GetEnemyStats from ItemDropProbabilityLookup (indexed by
; bits packed into the enemy's defence/drop stat bytes). The drop roll
; scales a 16-bit random into [0,N) and drops on 0, so $0001 means a
; guaranteed item drop and $0000 means never; a failed item roll drops
; GoldOrChestContents gold instead. The stat pair "$0001 with
; GoldOrChestContents = 0" never occurs on real enemies and serves as
; a sentinel for permanent hostiles - indestructible obstacles (trees,
; spiked balls) and respawning ghosts. They are excluded from the
; hostile-enemy scans and the quake attack, stay solid during
; hurt-invulnerability (FIX_COLL_1), and on death (the ghosts) respawn
; hostile with $100 health instead of dying.
ItemDropProbability:  equ $78
InitDialogue:         equ $7A
InitSpriteType:       equ $7B
Defence:              equ $7C
MaxHealth:            equ $7E
SPRITE_SIZE:          equ $80
ALL_SPRITES_SIZE:     equ $800
