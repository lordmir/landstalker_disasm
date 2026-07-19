EnemyAI1	module
; Per-tick AI entry for initially-hostile sprites (called from
; UpdateEntities whenever InitInteractFlags bit 7 is set, even while
; the slot is hidden). A hidden slot ($7F) may be a dead ghost
; waiting to respawn (CheckRespawnGhost); otherwise falls through to
; run the sprite's EnemyAI_*_A routine (d1 = 0).
RunEnemyAI:
		cmpi.b	#$7F,X(a5)
		beq.w	CheckRespawnGhost
		clr.w	d1			; falls through - A routine

; Dispatches to the sprite's AI pair: looks up the sprite id
; (Dialogue bits 0-9) in EnemyTable and jumps to its bra.w pair in
; EnemyAIHandlers, offset by d1 (0 = A routine, run every tick;
; 4 = B routine, run by behaviour command $2B / RunEnemyAI_B).
; Sprite ids not in the table just run the default OnTick.
DispatchEnemyAI:
		move.w	Dialogue(a5),d0
		andi.w	#$03FF,d0
		lea	EnemyTable(pc),a0

_findType:
		cmp.w	(a0),d0
		beq.s	_jump
		addq.w	#$08,d1
		cmpi.w	#$FFFF,(a0)+
		bne.s	_findType
		bsr.w	j_j_OnTick
		rts

_jump:
		lea	EnemyAIHandlers(pc),a0
		nop
		jmp	(a0,d1.w)

; Sprite ids with AI, terminated $FFFF; the Nth entry pairs with the
; Nth {A, B} pair in EnemyAIHandlers.
EnemyTable:	dc.w SPR_ORC1
		dc.w SPR_ORC2
		dc.w SPR_ORC3
		dc.w SPR_WORM1
		dc.w SPR_WORM2
		dc.w SPR_WORM3
		dc.w SPR_NINJA1
		dc.w SPR_NINJA2
		dc.w SPR_NINJA3
		dc.w SPR_LIZARD1
		dc.w SPR_LIZARD2
		dc.w SPR_LIZARD3
		dc.w SPR_KNIGHT1
		dc.w SPR_KNIGHT2
		dc.w SPR_KNIGHT3
		dc.w SPR_GHOST1
		dc.w SPR_GHOST2
		dc.w SPR_GHOST3
		dc.w SPR_MUMMY1
		dc.w SPR_MUMMY2
		dc.w SPR_MUMMY3
		dc.w SPR_UNICORN1
		dc.w SPR_UNICORN2
		dc.w SPR_UNICORN3
		dc.w SPR_SKELETON1
		dc.w SPR_SKELETON2
		dc.w SPR_SKELETON3
		dc.w SPR_MIMIC1
		dc.w SPR_MIMIC2
		dc.w SPR_MIMIC3
		dc.w SPR_MUSHROOM1
		dc.w SPR_MUSHROOM2
		dc.w SPR_MUSHROOM3
		dc.w SPR_GIANT1
		dc.w SPR_GIANT2
		dc.w SPR_GIANT3
		dc.w SPR_BUBBLE1
		dc.w SPR_BUBBLE2
		dc.w SPR_BUBBLE3
		dc.w SPR_NIGEL
		dc.w SPR_MIR
		dc.w SPR_REAPER1
		dc.w SPR_SMLFIREBALL
		dc.w SPR_DUKE
		dc.w SPR_GHOSTGEN1
		dc.w SPR_GHOSTGEN2
		dc.w SPR_GHOSTGEN3
		dc.w SPR_ZAK
		dc.w SPR_GOLEM1
		dc.w SPR_GOLEM2
		dc.w SPR_GOLEM3
		dc.w SPR_REAPER2
		dc.w SPR_UNUSEDREAPER3
		dc.w SPR_SPECTRE1
		dc.w SPR_SPECTRE2
		dc.w SPR_SPECTRE3
		dc.w SPR_UNUSEDBIRD1
		dc.w SPR_UNUSEDBIRD2
		dc.w SPR_UNUSEDBIRD3
		dc.w SPR_SPINNER1
		dc.w SPR_MIRO
		dc.w SPR_IFRIT
		dc.w SPR_GOLA
		dc.w SPR_NOLE
		dc.w SPR_STONEWARRIOR1
		dc.w SPR_BUBBLE4
		dc.w SPR_BUBBLE5
		dc.w SPR_BUBBLE6
		dc.w SPR_SPINNER2
		dc.w SPR_STONEWARRIOR2
		dc.w $FFFF

; One {A routine, B routine} bra.w pair per EnemyTable entry.
EnemyAIHandlers:
		bra.w	EnemyAI_Orc1_A			; SPR_ORC1
		bra.w	EnemyAI_Orc1_B
		bra.w	EnemyAI_Orc2_A			; SPR_ORC2
		bra.w	EnemyAI_Orc2_B
		bra.w	EnemyAI_Orc3_A			; SPR_ORC3
		bra.w	EnemyAI_Orc3_B
		bra.w	EnemyAI_Worm1_A			; SPR_WORM1
		bra.w	EnemyAI_Worm1_B
		bra.w	EnemyAI_Worm2_A			; SPR_WORM2
		bra.w	EnemyAI_Worm2_B
		bra.w	EnemyAI_Worm3_A			; SPR_WORM3
		bra.w	EnemyAI_Worm3_B
		bra.w	EnemyAI_Ninja1_A		; SPR_NINJA1
		bra.w	EnemyAI_Ninja1_B
		bra.w	EnemyAI_Ninja2_A		; SPR_NINJA2
		bra.w	EnemyAI_Ninja2_B
		bra.w	EnemyAI_Ninja3_A		; SPR_NINJA3
		bra.w	EnemyAI_Ninja3_B
		bra.w	EnemyAI_Lizard1_A		; SPR_LIZARD1
		bra.w	EnemyAI_Lizard1_B
		bra.w	EnemyAI_Lizard2_A		; SPR_LIZARD2
		bra.w	EnemyAI_Lizard2_B
		bra.w	EnemyAI_Lizard3_A		; SPR_LIZARD3
		bra.w	EnemyAI_Lizard3_B
		bra.w	EnemyAI_Knight1_A		; SPR_KNIGHT1
		bra.w	EnemyAI_Knight1_B
		bra.w	EnemyAI_Knight2_A		; SPR_KNIGHT2
		bra.w	EnemyAI_Knight2_B
		bra.w	EnemyAI_Knight3_A		; SPR_KNIGHT3
		bra.w	EnemyAI_Knight3_B
		bra.w	EnemyAI_Ghost1_A		; SPR_GHOST1
		bra.w	EnemyAI_Ghost1_B
		bra.w	EnemyAI_Ghost2_A		; SPR_GHOST2
		bra.w	EnemyAI_Ghost2_B
		bra.w	EnemyAI_Ghost3_A		; SPR_GHOST3
		bra.w	EnemyAI_Ghost3_B
		bra.w	EnemyAI_Mummy1_A		; SPR_MUMMY1
		bra.w	EnemyAI_Mummy1_B
		bra.w	EnemyAI_Mummy2_A		; SPR_MUMMY2
		bra.w	EnemyAI_Mummy2_B
		bra.w	EnemyAI_Mummy3_A		; SPR_MUMMY3
		bra.w	EnemyAI_Mummy3_B
		bra.w	EnemyAI_Unicorn1_A		; SPR_UNICORN1
		bra.w	EnemyAI_Unicorn1_B
		bra.w	EnemyAI_Unicorn2_A		; SPR_UNICORN2
		bra.w	EnemyAI_Unicorn2_B
		bra.w	EnemyAI_Unicorn3_A		; SPR_UNICORN3
		bra.w	EnemyAI_Unicorn3_B
		bra.w	EnemyAI_Skeleton1_A		; SPR_SKELETON1
		bra.w	EnemyAI_Skeleton1_B
		bra.w	EnemyAI_Skeleton2_A		; SPR_SKELETON2
		bra.w	EnemyAI_Skeleton2_B
		bra.w	EnemyAI_Skeleton3_A		; SPR_SKELETON3
		bra.w	EnemyAI_Skeleton3_B
		bra.w	EnemyAI_Mimic1_A		; SPR_MIMIC1
		bra.w	EnemyAI_Mimic1_B
		bra.w	EnemyAI_Mimic2_A		; SPR_MIMIC2
		bra.w	EnemyAI_Mimic2_B
		bra.w	EnemyAI_Mimic3_A		; SPR_MIMIC3
		bra.w	EnemyAI_Mimic3_B
		bra.w	EnemyAI_Mushroom1_A		; SPR_MUSHROOM1
		bra.w	EnemyAI_Mushroom1_B
		bra.w	EnemyAI_Mushroom2_A		; SPR_MUSHROOM2
		bra.w	EnemyAI_Mushroom2_B
		bra.w	EnemyAI_Mushroom3_A		; SPR_MUSHROOM3
		bra.w	EnemyAI_Mushroom3_B
		bra.w	EnemyAI_Giant1_A		; SPR_GIANT1
		bra.w	EnemyAI_Giant1_B
		bra.w	EnemyAI_Giant2_A		; SPR_GIANT2
		bra.w	EnemyAI_Giant2_B
		bra.w	EnemyAI_Giant3_A		; SPR_GIANT3
		bra.w	EnemyAI_Giant3_B
		bra.w	EnemyAI_Bubble1_A		; SPR_BUBBLE1
		bra.w	EnemyAI_Bubble1_B
		bra.w	EnemyAI_Bubble2_A		; SPR_BUBBLE2
		bra.w	EnemyAI_Bubble2_B
		bra.w	EnemyAI_Bubble3_A		; SPR_BUBBLE3
		bra.w	EnemyAI_Bubble3_B
		bra.w	EnemyAI_Miro_A			; SPR_NIGEL
		bra.w	EnemyAI_Miro_B
		bra.w	EnemyAI_Mir_A			; SPR_MIR
		bra.w	EnemyAI_Mir_B
		bra.w	EnemyAI_Reaper1_A		; SPR_REAPER1
		bra.w	EnemyAI_Reaper1_B
		bra.w	EnemyAI_SmallFireball_A		; SPR_SMLFIREBALL
		bra.w	EnemyAI_SmallFireball_B
		bra.w	EnemyAI_Duke_A			; SPR_DUKE
		bra.w	EnemyAI_Duke_B
		bra.w	EnemyAI_GhostGen_A		; SPR_GHOSTGEN1
		bra.w	EnemyAI_GhostGen_B
		bra.w	EnemyAI_GhostGen_A		; SPR_GHOSTGEN2
		bra.w	EnemyAI_GhostGen_B
		bra.w	EnemyAI_GhostGen_A		; SPR_GHOSTGEN3
		bra.w	EnemyAI_GhostGen_B
		bra.w	EnemyAI_Zak_A_0			; SPR_ZAK
		bra.w	EnemyAI_Zak_B_0
		bra.w	EnemyAI_Golem1_A		; SPR_GOLEM1
		bra.w	EnemyAI_Golem1_B
		bra.w	EnemyAI_Golem2_A		; SPR_GOLEM2
		bra.w	EnemyAI_Golem2_B
		bra.w	EnemyAI_Golem2_A		; SPR_GOLEM3
		bra.w	EnemyAI_Golem2_B
		bra.w	EnemyAI_Reaper2_A		; SPR_REAPER2
		bra.w	EnemyAI_Reaper2_B
		bra.w	EnemyAI_Reaper3_A		; SPR_UNUSEDREAPER3
		bra.w	EnemyAI_Reaper3_B
		bra.w	EnemyAI_Spectre1_A		; SPR_SPECTRE1
		bra.w	EnemyAI_Spectre1_B
		bra.w	EnemyAI_Spectre2_A		; SPR_SPECTRE2
		bra.w	EnemyAI_Spectre2_B
		bra.w	EnemyAI_Spectre3_A		; SPR_SPECTRE3
		bra.w	EnemyAI_Spectre3_B
		bra.w	EnemyAI_Harpy1_A		; SPR_UNUSEDBIRD1
		bra.w	EnemyAI_Harpy1_B
		bra.w	EnemyAI_Harpy2_A		; SPR_UNUSEDBIRD2
		bra.w	EnemyAI_Harpy2_B
		bra.w	EnemyAI_Harpy3_A		; SPR_UNUSEDBIRD3
		bra.w	EnemyAI_Harpy3_B
		bra.w	EnemyAI_Spinner_A		; SPR_SPINNER1
		bra.w	EnemyAI_Spinner_B
		bra.w	EnemyAI_Miro_A			; SPR_MIRO
		bra.w	EnemyAI_Miro_B
		bra.w	EnemyAI_Ifrit_A			; SPR_IFRIT
		bra.w	EnemyAI_Ifrit_B
		bra.w	EnemyAI_Gola_A			; SPR_GOLA
		bra.w	EnemyAI_Gola_B
		bra.w	EnemyAI_Nole_A			; SPR_NOLE
		bra.w	EnemyAI_Nole_B
		bra.w	EnemyAI_StoneWarrior_A		; SPR_STONEWARRIOR1
		bra.w	EnemyAI_StoneWarrior_B
		bra.w	EnemyAI_Bubble3_A		; SPR_BUBBLE4
		bra.w	EnemyAI_Bubble3_B
		bra.w	EnemyAI_Bubble3_A		; SPR_BUBBLE5
		bra.w	EnemyAI_Bubble3_B
		bra.w	EnemyAI_Bubble3_A		; SPR_BUBBLE6
		bra.w	EnemyAI_Bubble3_B
		bra.w	EnemyAI_Spinner_A		; SPR_SPINNER2
		bra.w	EnemyAI_Spinner_B
		bra.w	EnemyAI_StoneWarrior_A		; SPR_STONEWARRIOR2
		bra.w	EnemyAI_StoneWarrior_B

; Runs the sprite's EnemyAI_*_B routine (the second entry of its
; pair in the AI dispatch ladder), then the default OnTick.
RunEnemyAI_B:
		move.w	#$0004,d1
		bsr.w	DispatchEnemyAI
		bra.w	j_j_OnTick

		modend
