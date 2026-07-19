# Behaviour-script commands

Every entity (the 15 sprite slots and the player) runs a *behaviour
script*: a byte stream of `{command, arguments...}` records. The engine
state per entity is:

| Field | Purpose |
|---|---|
| `BehaviourLUTPtr` ($32) | Pointer to the current record |
| `BehavCmd` ($2B) | Current command byte |
| `BehavParam` ($2A) | The byte following the command — the first argument, or free state for the command to count with |
| `BehaviourLUTIndex` ($34) | Script number, resolved through `SpriteBehaviourOffsets` / `SpriteBehaviourTable` by `LoadSpriteBehaviour` |

Each tick, `OnTick` (`spritebehaviourjumptable.asm`) dispatches
`BehavCmd` to its `EB_*` handler (`spritebehaviours.asm`). A handler
either **returns** (the same command runs again next tick) or
**consumes its record** — `LoadNextCmd` advances the pointer by the
record size and loads the next command/argument pair.

Conventions used in the table below:

* **Size** is the record length in bytes (command byte included) —
  what gets consumed when the command completes. `BehavParam` is
  always loaded with the byte after the command, even for 1-byte
  records; commands marked *(uses BehavParam as state)* overwrite it
  freely while running.
* *(immediate)* — the handler consumes its record and the **next
  command still runs in the same tick**, so chains of immediate
  commands execute at once. Everything else ends the tick (waiting
  commands end it many times before completing).
* **engine state** — never written by scripts; the engine forces the
  command into `BehavParam`/`BehavCmd` directly (throwing, loot drops).
  Where an object is picked up, the previous behaviour state is saved
  in the `Saved*` fields and restored when the object settles.
* Command ids have `BHV_*` constants (`constants/behaviours.inc`).
  Facing values are `DIR_NE`=$00, `DIR_SE`=$40, `DIR_SW`=$80,
  `DIR_NW`=$C0; movement is at `Speed` pixels per tick.

A `BehavParam:BehavCmd` word of `$0000` means "no behaviour" and
skips dispatch entirely (`EB_NULL`).

## Command reference

| Cmd | Handler | Size | Description |
|---|---|---|---|
| $00 | `EB_Pause` | 2 | **ticks** — do nothing for *ticks* ticks. |
| $01 | `EB_MoveTimed` | 2 | **ticks** — walk forward for *ticks* ticks; blocked ticks count too. |
| $02 | `EB_TurnCW` | 1 | Turn 90° clockwise and refresh the facing animation (all turn/set-dir commands skip the refresh when rotation is disabled, InteractFlags bit 0). |
| $03 | `EB_TurnCCW` | 1 | Turn 90° counter-clockwise. |
| $04 | `EB_TurnNE` | 1 | Face NE. |
| $05 | `EB_TurnSE` | 1 | Face SE. |
| $06 | `EB_TurnSW` | 1 | Face SW. |
| $07 | `EB_TurnNW` | 1 | Face NW. |
| $08 | `EB_SetDirCW` | 1 | As $02 but without touching the animation. |
| $09 | `EB_SetDirCCW` | 1 | As $03 without the animation. |
| $0A | `EB_SetDirNE` | 1 | Face NE, animation untouched. |
| $0B | `EB_SetDirSE` | 1 | Face SE, animation untouched. |
| $0C | `EB_SetDirSW` | 1 | Face SW, animation untouched. |
| $0D | `EB_SetDirNW` | 1 | Face NW, animation untouched. |
| $0E | `EB_MakeVisible` | 1 | Clear the do-not-draw flag (InteractFlags bit 6). *(immediate)* |
| $0F | `EB_MakeInvisible` | 1 | Set the do-not-draw flag — the sprite still exists and collides. *(immediate)* |
| $10 | `EB_ThrownObject` | — | **engine state** — flight of a thrown/dropped carried object; `BehavParam` indexes `ThrowSpeedTable` ($00 straight drop, $17 directional throw). Rides a player jump in the early phases, damages a struck enemy as a player attack, shatters vases (→ $55), bounces off walls, then restores the saved behaviour. |
| $11 | `EB_MoveRelative` | 2 | **steps** — walk forward *steps* unblocked steps (blocked ticks don't count). |
| $12 | `EB_GoToInstruction` | 2 | **offset** — jump *offset* (signed) bytes within the script, relative to this command byte. *(immediate)* |
| $13 | `EB_MoveUntilCollision` | 1 | Walk forward until blocked by a wall or sprite. |
| $14 | `EB_TurnRandom` | 1 | Face a random direction, with animation refresh. |
| $15 | `EB_SetDirRandom` | 1 | Face a random direction, animation untouched. |
| $16 | `EB_PutDownObject` | — | **engine state** — object just put down, sliding with momentum inherited from a moving platform until it stops or hits something, then restores the saved behaviour. |
| $17 | `EB_TurnRandomImmediate` | 1 | As $14. *(immediate)* |
| $18 | `EB_TurnCWImmediate` | 1 | As $02. *(immediate)* |
| $19 | `EB_TurnCCWImmediate` | 1 | As $03. *(immediate)* |
| $1A | `EB_TurnNEImmediate` | 1 | As $04. *(immediate)* |
| $1B | `EB_TurnSEImmediate` | 1 | As $05. *(immediate)* |
| $1C | `EB_TurnSWImmediate` | 1 | As $06. *(immediate)* |
| $1D | `EB_TurnNWImmediate` | 1 | As $07. *(immediate)* |
| $1E | `EB_Freeze` | 1 | Speed = 0 (this family's "SetSpeed0"). *(immediate)* |
| $1F | `EB_SetSpeed1` | 1 | Speed = 1 pixel/tick. *(immediate)* |
| $20 | `EB_SetSpeed2` | 1 | Speed = 2. *(immediate)* |
| $21 | `EB_SetSpeed3` | 1 | Speed = 4. *(immediate)* |
| $22 | `EB_SetSpeed4` | 1 | Speed = 8. *(immediate)* |
| $23 | `EB_Turn180` | 1 | Turn 180°, with animation refresh. |
| $24 | `EB_SetDir180` | 1 | Turn 180°, animation untouched. |
| $25 | `EB_Turn180Immediate` | 1 | As $23. *(immediate)* |
| $26 | `EB_FollowPlayerWithJump` | 2 | **ticks** — follow the player, jumping up ledges (JumpRate bit 7) when blocked; stands off (reverses) within $0F pixels. |
| $27 | `EB_Jump` | 1 | Start a jump (JumpRate bit 7). *(immediate)* |
| $28 | `EB_EnableRotation` | 1 | Clear InteractFlags bit 0 (allow rotate-to-face and idle animation). *(immediate)* |
| $29 | `EB_DisableRotation` | 1 | Set InteractFlags bit 0. *(immediate)* |
| $2A | `EB_MoveRandomTime` | 3 | **range, max** — walk forward for `max - random(0..range-1) + 1` ticks, then continues as $01. |
| $2B | `EB_RunSpecialAI` | 1 | Run the sprite's `EnemyAI_*_B` routine every tick (the AI takes over and changes the behaviour itself). |
| $2C | `EB_FollowPlayerNoJump` | 2 | **ticks** — as $26 but never jumps. |
| $2D | `EB_Loot` | — | **engine state** (set by the enemy-death drop code) — money bag / item box waiting to be collected; the player takes the item or gold, a hostile enemy absorbs dropped gold into its own drop. Lifetime timer runs in `CurrentHealth`: blinks from tick $F0, faster from $168, despawns at 420. |
| $2E | `EB_ShopItem` | — | Persistent shop-stock item: pick-up runs the shop pick-up/steal script; put-down only settles on a counter tile (`FLOOR_COUNTER`) at ground height and runs the put-down script. Item id is exchanged through `g_ShopItemId` ($FF = despawn me). |
| $2F | `EB_ThrownObject` | — | **engine state** — as $10 for a shop item; restores to $2E when it lands. |
| $30 | `EB_MoveUpRelative` | 2 | **ticks** — rise `Speed`/tick; the countdown pauses while blocked by something above. |
| $31 | `EB_MoveDownRelative` | 2 | **ticks** — sink `Speed`/tick; countdown pauses while blocked. |
| $32 | `EB_PutDownObject` | — | **engine state** — as $16 for a shop item; restores to $2E. |
| $33 | `EB_FleePlayer` | 2 | **ticks** — run directly away from the player. |
| $34 | `EB_PlaybackInput` | 2 | **sequence** — force controller playback of `InputPlayback` sequence *sequence* (moves the player). *(immediate)* |
| $35 | `EB_ResetPlayback` | 1 | Stop controller playback. *(immediate)* |
| $36 | `EB_WaitForCondition` | 2 | **trigger** — wait until trigger condition *trigger* holds (`ProcessTriggerAction`). |
| $37 | `EB_Pause4s` | 1 | Playback sequence 9: hold the player still for ~4.2 s and clear the player's action word. *(immediate — the pause happens through the input playback, not the script)* |
| $38 | `EB_EnableGravity` | 1 | Clear FallRate bit 7. *(immediate)* |
| $39 | `EB_DisableGravity` | 1 | Set FallRate bit 7 (no falling). *(immediate)* |
| $3A | `EB_MoveUpTimed` | 2 | **ticks** — as $30 but blocked ticks count down too. |
| $3B | `EB_MoveDownTimed` | 2 | **ticks** — as $31 but blocked ticks count. |
| $3C | `EB_MoveUpAbsolute` | 2 | **z** — rise until `Z` ≥ *z* (pixels). |
| $3D | `EB_MoveDownAbsolute` | 2 | **z** — sink until `Z` ≤ *z*. |
| $3E | `EB_DespawnEntity` | — | Despawn (thunk to `HideSprite`); terminal. |
| $3F | `EB_NudgeUp` | 1 | Rise every tick until blocked by something above, then advance. |
| $40 | `EB_MoveDownUntilCollision` | 1 | Sink until landing on the heightmap floor or another sprite. |
| $41 | `EB_SetFlag` | 3 | **byte, bit** — set story flag `g_Flags[byte]` bit *bit*. *(immediate)* |
| $42 | `EB_WaitForFlagSet` | 3 | **byte, bit** — wait until the flag is set. |
| $43 | `EB_ClearFlag` | 3 | **byte, bit** — clear the flag. *(immediate)* |
| $44 | `EB_Hide` | 1 | Set the hidden flag (StateFlags bit 0) but keep running the script. *(immediate)* |
| $45 | `EB_ShowWhenCollisionClear` | 1 | Wait until nothing overlaps this spot, then unhide. |
| $46 | `EB_WaitForFlagClear` | 3 | **byte, bit** — wait until the flag is clear. |
| $47 | `EB_WaitSpriteNotHostile` | 2 | **slot** — wait until sprite slot *slot* is no longer hostile. |
| $48 | `EB_SetEntitySpeed` | 3 | **slot, speed** — set sprite slot *slot*'s `Speed`. *(immediate)* |
| $49 | `EB_ActivateSwitch` | 1 | Switch pressed: face SW with animation refresh and `SND_Switch`. *(immediate)* |
| $4A | `EB_ResetSwitch` | 1 | Switch released: face NE with animation refresh. *(immediate)* |
| $4B | `EB_MoveToXYPosImmediate` | 3 | **x, y** — teleport to cell (*x*, *y*) and recompute the hitbox. *(immediate)* |
| $4C | `EB_MoveToZPosImmediate` | 2 | **z** — teleport to height *z*. *(immediate)* |
| $4D | `EB_ResetToInitParams` | 1 | Restore the spawn-time state (position, graphic, flags, dialogue, health). *(immediate — but if the spawn spot is blocked, hides and stops instead)* |
| $4E | `EB_StartLoCutscene` | 2 | **action** — run dialogue script action *action*. *(immediate)* |
| $4F | `EB_MoveNoClip` | 2 | **steps** — as $11 but through walls and sprites. |
| $50 | `EB_RotatePlayer` | 2 | **dir** — turn the player to facing *dir* (0–3 = NE/SE/SW/NW) and reload the idle pose. *(immediate)* |
| $51 | `EB_MakeHostile` | 1 | Set the hostile flag (also in the respawn template) and load this sprite type's enemy stats. *(immediate)* |
| $52 | `EB_MakeNonHostile` | 1 | Clear the hostile flag. *(immediate)* |
| $53 | `EB_DisableWalkBackwards` | 1 | Walk normally again (clear CombatFlags bit 1). *(immediate)* |
| $54 | `EB_EnableWalkBackwards` | 1 | Walk backwards: the walk cycle plays in reverse and the facing draws flipped 180° (the unicorns' backwards charge). *(immediate)* |
| $55 | `EB_SpecialAnimation` | — | **phase** *(uses BehavParam as state, start at 0)* — collapse animation: thud + special-anim frame 0, frame 4 at $0A, sunken frame with reduced height at $14, blink-out and despawn from $1E. Also the shattered-vase behaviour set by $10. |
| $56 | `EB_MoveUpToInitPos` | 1 | Rise back to the spawn height (`InitZ`); shoves an extra step past anything it touches. |
| $57 | `EB_TriggerTileSwap` | 2 | **swap** — apply map tile swap *swap* (`DoTileSwap`). *(immediate)* |
| $58 | `EB_UpdateSpriteFacing` | 1 | Refresh the facing animation. *(immediate)* |
| $59 | `EB_PrintText` | 3 | **hi, lo** — print string number `hi<<8 \| lo`. *(immediate)* |
| $5A | `EB_ProjectileHitEnemies` | 2 | **ticks** — player-side projectile: fly forward; on impact it despawns, damaging a struck vulnerable hostile as a player attack with hitstun. |
| $5B | `EB_SetTargetPosition` | 5 | **x, y, subX, subY** — store the movement target. *(immediate)* |
| $5C | `EB_MoveToTargetPosition` | 1 | Steer towards the stored target (compared at 4-pixel granularity) until arrival. A non-hostile sprite running this passes through the player. |
| $5D | `EB_RepeatBegin` | 2 | **count** — start of a repeat block (loop point = the next record); *count* = iterations, 0 keeps the current count (nested restarts). *(immediate)* |
| $5E | `EB_RepeatEnd` | 1 | Jump back to the repeat block's start until the count runs out. *(immediate on exit)* |
| $5F | `EB_DecayFlash` | 2 | **counter** *(state, start at 0)* — despawn/appear flicker: toggles visibility at the accelerating tick marks in `DecayFlashFrames`, advancing the script when the schedule ends. |
| $60 | `EB_FlashSpinAppear` | 2 | **counter** *(state)* — $5F plus a spin between flicker steps, slowing as it materialises. |
| $61 | `EB_FlashSpinDisappear` | 2 | **counter** *(state)* — mirror of $60: spins faster as it fades. |
| $62 | `EB_PlaySound` | 2 | **sound** — play sound id *sound*. *(immediate)* |
| $63 | `EB_ProjectileMove` | 2 | **ticks** — enemy projectile: fly forward, dealing contact damage; a wall or a sprite of a different type despawns it, same-type sprites are flown through. |
| $64 | `EB_StartHiCutscene` | 2 | **action** — run dialogue script action `$100 + action`. *(immediate)* |
| $65 | `EB_ProjectileWeaveCW` | 2 | **ticks** — as $63 but each tick takes a second step rotated 90° CW: a diagonal path between two facings. |
| $66 | `EB_ProjectileWeaveCCW` | 2 | **ticks** — mirror of $65. |
| $67 | `EB_ProjectileFall` | — | As $63 but also sinking `Speed`/tick; despawns on landing. Terminal (never advances the script). |

## Notes

* **Carried/thrown lifecycle.** Picking a sprite up
  (`CheckPickUpEntity`) saves `BehaviourLUTPtr`/`BehavCmd`/
  `BehavParam`/`Speed` into the `Saved*` fields. The carry state
  machine (gamelogic4) then injects $10 (throw; param $17 for a
  directional throw, $00 for a straight drop) or $16 (put-down),
  using the $2F/$32 variants for shop items. When the object settles,
  the saved behaviour is restored — unless the saved command was
  itself one of $10/$16/$32 (stop dead, `BehavParam:BehavCmd` = 0) or
  $2F (revert to $2E).
* **Waiting commands** ($00, $36, $42, $45, $46, $47, and every
  mover) hold the script for at least one tick per attempt; chains of
  *(immediate)* commands all run within a single tick, which is how
  scripts do their one-off setup.
* **Projectiles** get their contact damage from the shared move
  routine (`ApplyContactDamage`): a hostile mover touching the player
  queues a pending hit with its `AttackStrength`. The $63/$65/$66/$67
  family despawns on walls (`d7` = 0) and on different-type sprites,
  so volleys of the same projectile pass through each other.
* **Engine-injected commands** ($10/$16/$2D/$2F/$32) never appear in
  script data — the code forces them into `BehavParam`/`BehavCmd`
  directly.
