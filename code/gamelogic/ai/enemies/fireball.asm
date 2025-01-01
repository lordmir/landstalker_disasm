; ---------------------------------------------------------------------------

EnemyAI_SmallFireball_B:			  ; CODE XREF: ROM:001A85FAj
		nop

EnemyAI_SmallFireball_A:			  ; CODE XREF: ROM:001A85F6j
		bset	#$00,Flags4(a5)		  ; Bit	0 = Invincible / Solid
		bsr.w	j_j_OnTick
		rts
