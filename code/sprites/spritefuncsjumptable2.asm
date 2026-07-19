SpriteFuncsJmps2	module
; Second thunk block for the sprite systems; the unlabeled jmp is an
; unused leftover.

j_HideSprite:
		jmp	HideSprite(pc)

j_RunEnemyAI:
		jmp	RunEnemyAI(pc)

j_MoveSpriteOffscreen:
		jmp	MoveSpriteOffscreen(pc)

j_RunEnemyAI_B:
		jmp	RunEnemyAI_B(pc)

		jmp	LoadProjectilePalette(pc)

		modend
