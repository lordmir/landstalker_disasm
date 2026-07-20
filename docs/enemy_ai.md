# Enemy AI reference

A summary of every enemy and boss AI in the game, decoded from the
routines in `code/gamelogic/ai/enemies/`. Each entry below links to
the source file, whose header comment carries the full details.

## How enemy AI works

Every enemy has two entry points in the AI jump table:

- **A routine** — run every tick. Dispatches on `AIState(a5)`:
  state `0` is idle (run the placed behaviour script and watch a
  detection box for the player), `$10` is the chase (follow the
  player and roll random chances for the enemy's moves, checked
  farthest-range first), and states `$20`+ are the attacks, each an
  animation/hitbox sequence driven by a low-nibble sub-state.
- **B routine** — invoked when the enemy's behaviour script runs the
  `RunSpecialAI` command ($2B), typically to reset back to the chase
  after a scripted move (rush, pounce, knockback...) finishes.

Movement itself is done by behaviour scripts (`BHVS_*` ids in
`code/include/constants/behaviourscripts.inc`, commands documented in
[behaviour_commands.md](behaviour_commands.md)); the AI picks *which*
script to run and handles the hitboxes, poses and damage. Getting hit
loads `BHVS_ENEMY_HITSTUN` (a 16-tick pause) and the recovery re-enters
the AI through the B routine.

Most regular enemies come in three tiers sharing one skeleton, with
tier 2/3 adding moves, better odds and higher damage. A few flags come
up repeatedly:

| Flag | Meaning |
|---|---|
| `CombatFlags` bit 0 | invincible (blocks, ball/armour forms) |
| `CombatFlags` bit 1 | walk backwards (retreat while still facing the player) |
| `CombatFlags` bit 6 | alternate animation bank (disguises, special poses) |
| `InteractFlags` bit 6 | invisible/undrawn (vanished, hidden) |
| `FallRate` bit 7 | no gravity (floaters) |

## Regular enemies

### Orcs — [orc1](../code/gamelogic/ai/enemies/orc1.asm) / [orc2](../code/gamelogic/ai/enemies/orc2.asm) / [orc3](../code/gamelogic/ai/enemies/orc3.asm)
Basic club fighters and the template for most melee enemies: chase,
then roll per tick for a pounce from afar, a mid-range move, or a
point-blank swing.
- **Orc1** — pounce, brief standoff, retreat, point-blank swing.
- **Orc2** — the mid-range move becomes an advance with the club
  swinging, and the moving swing advances too.
- **Orc3** — the advance becomes a leap, it never retreats, and it
  swings during every moving state.

### Bubbles — [bubble1](../code/gamelogic/ai/enemies/bubble1.asm) / [bubble2](../code/gamelogic/ai/enemies/bubble2.asm) / [bubble3](../code/gamelogic/ai/enemies/bubble3.asm)
Mostly-stationary blobs that hurt on contact.
- **Bubble1** — sits still; occasionally rolls a short move or a
  stationary wobble.
- **Bubble2** — its moves are hops, with squash/stretch poses in the
  air.
- **Bubble3–6** (one handler) — as Bubble2, but always hops when the
  player comes within its detection box.

### Mushrooms — [mushroom1](../code/gamelogic/ai/enemies/mushroom1.asm) / [mushroom2](../code/gamelogic/ai/enemies/mushroom2.asm) / [mushroom3](../code/gamelogic/ai/enemies/mushroom3.asm)
Chasers that can shrink into their cap (hitbox flattened to zero — they
cannot be hit while hidden) and ambush when the player comes close.
Attack with an all-round spore burst and a point-blank bite.
- **Mushroom1** — shrinks at mid range; plain spore burst.
- **Mushroom2** — shrinks defensively when the player is close; the
  spore burst has a 40% chance to poison.
- **Mushroom3** — the spore burst does no damage at all, only status
  effects: poison, paralysis, confusion or curse by roll.

### Giants — [giant1](../code/gamelogic/ai/enemies/giant1.asm) / [giant2](../code/gamelogic/ai/enemies/giant2.asm) / [giant3](../code/gamelogic/ai/enemies/giant3.asm)
Slow club-wielders with a deep ($21) swing box.
- **Giant1** — threatens at range with the club raised, or pounces;
  point-blank 70% quick swing / 30% slow heavy swing.
- **Giant2** — rushes instead of threatening; point-blank is the heavy
  swing or a $60-tick flurry of alternating swings.
- **Giant3** — long rush, swings during the pounce's descent,
  point-blank 50/50 heavy swing or flurry.

### Sand worms — [worm1](../code/gamelogic/ai/enemies/worm1.asm) / [worm2](../code/gamelogic/ai/enemies/worm2.asm) / [worm3](../code/gamelogic/ai/enemies/worm3.asm)
Start underground (hitbox flattened — unhittable); emerge (needing
headroom) to attack with a lunging bite, and can burrow back at range.
- **Worm1** — bite only.
- **Worm2** — adds the poison dust breath: a cloud ahead with a 40%
  poison chance on hit.
- **Worm3** — longer breath cloud that always inflicts a status
  effect: poison or confusion (the paralysis branch is unreachable —
  presumably a bug).

### Knights — [knight1](../code/gamelogic/ai/enemies/knight1.asm) / [knight2](../code/gamelogic/ai/enemies/knight2.asm) / [knight3](../code/gamelogic/ai/enemies/knight3.asm)
Sword fighters with a guard: they raise a block (invincible while
held) when the player swings nearby, and a long sword thrust with a
deep $29 hit box.
- **Knight1** — pause or retreat at range; thrust, sometimes with a
  hop.
- **Knight2** — leaps at the player instead of retreating, thrusting
  during the leap.
- **Knight3** — the guard becomes a counter-attack: it leaps at the
  player with the guard up, invincible while it closes in. (Its
  random roll is compared but never branched on, so the counter always
  fires — presumably a bug.)

### Skeletons — [skeleton1](../code/gamelogic/ai/enemies/skeleton1.asm) / [skeleton2](../code/gamelogic/ai/enemies/skeleton2.asm) / [skeleton3](../code/gamelogic/ai/enemies/skeleton3.asm)
Sword fighters built around the lunge — an advance with the sword held
out, its deep $29 box live every tick.
- **Skeleton1** — rush from very long range, pounce, lunge,
  point-blank swings (sometimes hopping). An unused bone-throw spawner
  sits unreachable at the end of the file.
- **Skeleton2** — adds the block (invincible pose, held $28 ticks,
  requires head-on facing); long-range run-then-jump with a swing on
  the way down.
- **Skeleton3** — long rush that turns into the lunge for its final
  $18 ticks; blocks freely with no facing requirement.

### Ghosts — [ghost1](../code/gamelogic/ai/enemies/ghost1.asm) / [ghost2](../code/gamelogic/ai/enemies/ghost2.asm) / [ghost3](../code/gamelogic/ai/enemies/ghost3.asm) + [ghostgen](../code/gamelogic/ai/enemies/ghostgen.asm)
Materialise via fade-in frames, chase, and attack with an HP drain:
point-blank at matching height they latch on, drain health once, and
hold the player in hitstun for 60 ticks.
- **Ghost1** — drains $80.
- **Ghost2** — drains $100 with a wider grab; after the grab lands,
  10% chance of the vanish attack — a large damaging burst, after
  which the ghost disappears until respawned.
- **Ghost3** — drains $200; 20% vanish attack.
- **Ghost generator** — a stationary object; while one is alive in the
  room, vanished ghosts respawn. Destroy it to stop the respawning.

### Mimics — [mimic1](../code/gamelogic/ai/enemies/mimic1.asm) / [mimic2](../code/gamelogic/ai/enemies/mimic2.asm) / [mimic3](../code/gamelogic/ai/enemies/mimic3.asm)
Chest monsters: when nobody is close enough to watch, they transform
into a treasure chest and sit perfectly still, popping back up when the
player comes near. Their attack latches onto the player at chest height
and drains health on a repeating timer.
- **Mimic1** — drains $100 every $1E ticks. Quirks: the disguise
  roll's result is never tested (it always disguises), and its hop
  state never ticks, freezing it until a hit resets it.
- **Mimic2** — shy: flees when approached and usually (89%) flees
  instead of latching; drains $200 every $1E ticks.
- **Mimic3** — disguises most readily and sprints away 94% of the
  time, but its drain takes $300 every $A ticks. Quirk: the drain's
  lift does a byte read of `Player_HitBoxZEnd`, leaking its own Z high
  byte into the lifted position.

### Unicorns — [unicorn1](../code/gamelogic/ai/enemies/unicorn1.asm) / [unicorn2](../code/gamelogic/ai/enemies/unicorn2.asm) / [unicorn3](../code/gamelogic/ai/enemies/unicorn3.asm)
Sword duellists that fight face-to-face: at the $30–$40 ring, head-on,
they either charge or rear up in a stare-down (alternating threat
poses, re-rolling the charge every $10 ticks). If the player swings at
them head-on they can dodge — a backstep with the walk-backwards flag,
keeping their face to him while retreating. Point-blank they thrust,
box live from the first tick.
- **Unicorn1** — charges 81%, dodges 31%.
- **Unicorn2** — charges 51%, dodges 51%.
- **Unicorn3** — charges 31%, dodges 81% — the most defensive.

### Spectres — [spectre1](../code/gamelogic/ai/enemies/spectre1.asm) / [spectre2](../code/gamelogic/ai/enemies/spectre2.asm) / [spectre3](../code/gamelogic/ai/enemies/spectre3.asm)
Floating casters (no gravity, ever). They can vanish — undrawn, still
chasing at floating height — and re-materialise beside the player via
the shared [TeleportBesidePlayer](../code/gamelogic/ai/enemyteleport.asm)
helper, and they summon a small fireball (its own entity, though it
shares its flame graphics with the Magic Sword's burn animation). They
also have a standard melee swing.
- **Spectre1 / 2 / 3** — fireball AttackStrength $300 / $500 / $700,
  with the vanish and cast odds rising each tier.

### Mummies — [mummy1](../code/gamelogic/ai/enemies/mummy1.asm) / [mummy2](../code/gamelogic/ai/enemies/mummy2.asm) / [mummy3](../code/gamelogic/ai/enemies/mummy3.asm)
Shamblers with three tools: an unravel (collapsing into a pile of
bandages and lying still until the player comes within $30, then
winding back up), a deep and wide slash ($21 ahead, $11 lateral), and
a grab that absorbs $40 health every $28 ticks until the player breaks
free.
- **Mummy1** — may pause or back off on the approach; 80% slash / 20%
  drain in reach.
- **Mummy2** — rushes instead of retreating, unravels more readily,
  60% slash / 40% drain.
- **Mummy3** — pure pressure: opens with a rush or wait-then-rush,
  40% slash / 60% drain, and does not unravel (the pause move survives
  only as unreachable leftover code).

### Reapers — [reaper1](../code/gamelogic/ai/enemies/reaper1.asm) / [reaper2](../code/gamelogic/ai/enemies/reaper2.asm) / [reaper3](../code/gamelogic/ai/enemies/reaper3.asm)
Ambushers that never walk: once aggro'd (a huge $100 detection box)
they stay hidden and frozen, acting on a countdown — appearing on the
spot to cast if the player is in the band ahead, or teleporting in
behind the player (facing his back) or in front (facing him) and
casting a fireball. No melee; contact and fireballs do the damage.
- **Reaper1** — acts every $3C ticks, fireball $300.
- **Reaper2** — every $2D ticks, fireball $500.
- **Reaper3** — every $1E ticks, fireball $800 — the hardest-hitting
  projectile of the regular enemies.

### Lizards — [lizard1](../code/gamelogic/ai/enemies/lizard1.asm) / [lizard2](../code/gamelogic/ai/enemies/lizard2.asm) / [lizard3](../code/gamelogic/ai/enemies/lizard3.asm)
Sword fighters with two swings: the deep slash ($29 box) and a second,
shorter slash ($19 box).
- **Lizard1** — pause, pounce or advance-with-slash on the approach;
  point-blank 60% deep slash / 40% short slash.
- **Lizard2** — adds a rush, and its pounce is a jumping slash.
- **Lizard3** — fights like Skeleton3: the rush turns into a slash for
  its last 8 ticks, the mid-range advance is a lunge with the box live
  every tick, and the pounce is a jumping slash.

### Ninjas — [ninja1](../code/gamelogic/ai/enemies/ninja1.asm) / [ninja2](../code/gamelogic/ai/enemies/ninja2.asm) / [ninja3](../code/gamelogic/ai/enemies/ninja3.asm)
Sword fighters that square up in a two-frame stance at range and leap
in with a slash.
- **Ninja1** — stance, retreat, leaping slash; no teleport.
- **Ninja2** — adds the teleport: vanishes and reappears $18 in front
  of the player, facing him, dropping out of the air straight into a
  slash.
- **Ninja3** — teleports to either side — $18 behind the player facing
  his back, or in front facing him — and drops the retreat.

### Harpies (unused) — [harpy1](../code/gamelogic/ai/enemies/harpy1.asm) / [harpy2](../code/gamelogic/ai/enemies/harpy2.asm) / [harpy3](../code/gamelogic/ai/enemies/harpy3.asm)
Flying enemies that never made it into the game; all three run
identical logic (only the sprites differ). They never aggro on their
own — the idle detection check's result is discarded — waking only
when hit. Once active they wander rather than chase, opportunistically
pouncing, hovering or backing off, with a claw attack in reach (50%
standing, 50% with a hop).

### Small fireball — [fireball](../code/gamelogic/ai/enemies/fireball.asm)
The casters' projectile (spectres and reapers). The AI only holds it
invincible; its behaviour script does the flying (no gravity, straight,
32 ticks) and contact does the damage.

## Bosses

### Mir — [mir.asm](../code/gamelogic/ai/enemies/mir.asm)
Hovers at a fixed ring distance from the player, always turned to face
him: too far and he closes in, too close and he slips away in 8-tick
dashes — the dodging — and from the band in between he summons a
fireball aimed straight at the player. He has no idle state, so he
opens the fight casting.

### Golems — [golem1](../code/gamelogic/ai/enemies/golem1.asm) / [golem2](../code/gamelogic/ai/enemies/golem2.asm)
The simplest kit in the game: chase, and once the player is within $20
always attack — raising the fist and bringing it down on the player's
head. Golem1 may pause to menace on the approach; Golem2/3 instead
have a small chance to rush.

### Stone / Gold Warrior — [stonewarrior.asm](../code/gamelogic/ai/enemies/stonewarrior.asm)
Both encounters run exactly the same AI (only sprite and placement
stats differ). Two moves: a leap-slam (invincible while airborne,
landing with a heavy thud and a screen shake), and the hammer
floor-strike — a mini earthquake that stuns the player anywhere in the
room unless he is airborne when it hits. After hitstun it turns 180°
and pounces — a retaliation leap.

### Duke — [duke.asm](../code/gamelogic/ai/enemies/duke.asm)
A sword fight on Skeleton3's kit and odds: a long rush ending in the
jab, a block (invincible for $28 ticks, dropped if he is hurt), the
jab itself — a deep $29 box live every tick with no windup — and
leaping/advancing closes. He holds the alternate animation bank every
tick for his special poses, including the receive-damage animation.

### Miro — [miro.asm](../code/gamelogic/ai/enemies/miro.asm)
Fought twice, and the mirroring is literal: the jump table routes both
`SPR_NIGEL` and `SPR_MIRO` here, so the brief early encounter is this
AI wearing the player's own sprite. He dodges a swing with a backwards
leap 91% of the time, jumps in from range slashing on the way down,
and his slash is a continuous four-pose flurry with a deep, wide box
that loops until the state ends. His close-range fallback is a
stutter-chase (walk, pause, walk), slashing during the pauses.

### Zak — [zak.asm](../code/gamelogic/ai/enemies/zak.asm)
His signature move is the fly-up: he beats his wings and rises for $1F
ticks with gravity off, then drops — tracking the player horizontally
every tick until he falls to within a random height of him, where he
commits to the dive and can no longer follow; landing is contact
damage. He also has a slash (standing, advancing or leaping) and the
boomerang throw (AttackStrength $1400 — it flies out 32 ticks, turns
180°, and comes back).

### Spinner — [spinner.asm](../code/gamelogic/ai/enemies/spinner.asm)
An armoured boss with two signature moves. The roll: from anywhere in
the $40–$A0 band ahead he winds up, tucks into his ball form
(invincible), and charges at speed 8 until he hits a wall — and state
0 *is* the wind-up, so he opens the fight with it. The steel-claw
slash: a four-pose swing, invincible throughout — standing, rushing or
leaping in. If the player swings his sword while close, he back-leaps
out of range.

### Ifrit — [ifrit.asm](../code/gamelogic/ai/enemies/ifrit.asm)
Lives on a grid of four lava pits and never walks. Each tick in his
ready state he rolls: a dash (11%) — an invincible no-clip glide to
the adjacent pit his facing points at; a teleport (21%) — sinking
down and surfacing in a random other pit facing the player; or a
fireball cast — 75% a single medium fireball (AttackStrength $F00),
25% a spread of three (straight, diagonally right, diagonally left).

### Nole — [nole.asm](../code/gamelogic/ai/enemies/nole.asm)
An axe fighter with the spectres' vanishing trick: he opens by
sinking out of sight, chases invisibly while invincible and floating,
then teleports in beside the player and fades back in. Visible, he
swings his axe to loose the axe projectile (AttackStrength $1E00 —
the hardest-hitting attack in the game; he never lets go of the axe
itself) from up to $A0 away, and swings it in melee, leaping in or
standing.

### Gola — [gola.asm](../code/gamelogic/ai/enemies/gola.asm)
The final boss, a fire-breathing dragon god. The sprite is only her
head — the body and tail are part of the stage background — and her
height drives the move set:

- **Very high** — swoops down to the north or west edge of the arena,
  aligned with the player.
- **High** — the tail lash: an earthquake animated by background tile
  swaps around a screen shake that stuns the player if he is on the
  ground; if the stun lands she dives down beside him and breathes
  fire in his face — a level-flying fireball every 3 ticks while the
  room's backdrop pulses deep red.
- **Low** — spits large fireballs (AttackStrength $1400): one while
  advancing along her edge steering toward the player, or the spread
  of three; and rises away, with a chance that grows as the player
  closes in on her corner.
