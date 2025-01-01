
; =============== S U B	R O U T	I N E =======================================


CheckSRAM:					  ; CODE XREF: ROM:0000050Cp

; FUNCTION CHUNK AT 00001520 SIZE 0000002C BYTES

		lea	(SRAM_MagicWord).l,a0
		lea	SRAM_ExpectedMagicWord(pc),a1 ;	"KAN&MAKIKO"
		moveq	#$00000009,d7
		UnlockSRAM

loc_14FE:					  ; CODE XREF: CheckSRAM+14j
		move.b	(a1)+,d0
		cmp.b	(a0),d0
		bne.s	SetSRAMMagicWord
		addq.w	#$02,a0
		dbf	d7,loc_14FE
		LockSRAM
		clr.b	d0
		bsr.s	CheckSaveCSums
		bsr.s	CheckSaveCSums
		bsr.s	CheckSaveCSums
		bsr.s	CheckSaveCSums
		rts
; End of function CheckSRAM


; =============== S U B	R O U T	I N E =======================================


CheckSaveCSums:					  ; CODE XREF: CheckSRAM+1Ap
						  ; CheckSRAM+1Cp ...
		ExpandBsr  VerifySaveslotCSum
		beq.s	loc_151C
		bsr.s	EraseSaveslot

loc_151C:					  ; CODE XREF: CheckSaveCSums+2j
		addq.b	#$01,d0
		rts
; End of function CheckSaveCSums

; ---------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR CheckSRAM

SetSRAMMagicWord:				  ; CODE XREF: CheckSRAM+10j
		lea	(SRAM_MagicWord).l,a0
		lea	SRAM_ExpectedMagicWord(pc),a1 ;	"KAN&MAKIKO"
		moveq	#$00000009,d7
		UnlockSRAM

loc_152C:					  ; CODE XREF: CheckSRAM+3Ej
		move.b	(a1)+,(a0)
		addq.w	#$02,a0
		dbf	d7,loc_152C
		LockSRAM
		clr.b	d0
		bsr.s	EraseSaveslot
		move.b	#$01,d0
		bsr.s	EraseSaveslot
		move.b	#$02,d0
		bsr.s	EraseSaveslot
		move.b	#$03,d0
		bsr.s	EraseSaveslot
		rts
; END OF FUNCTION CHUNK	FOR CheckSRAM

; =============== S U B	R O U T	I N E =======================================


GetCurrentSaveSlot:				  ; CODE XREF: ROM:0000EFD8p
		move.b	(g_SaveSlot).l,d0
; End of function GetCurrentSaveSlot


; =============== S U B	R O U T	I N E =======================================


EraseSaveslot:					  ; CODE XREF: CheckSaveCSums+4p
						  ; CheckSRAM+44p ...
		bsr.s	GetSaveSlotAddress
		move.w	#$03FF,d7
		UnlockSRAM

loc_1558:					  ; CODE XREF: EraseSaveslot+Aj
		clr.b	(a0)
		addq.w	#$02,a0
		dbf	d7,loc_1558
		LockSRAM
		rts
; End of function EraseSaveslot

; ---------------------------------------------------------------------------
SRAM_ExpectedMagicWord:dc.b 'KAN&MAKIKO'          ; DATA XREF: CheckSRAM+6t
						  ; CheckSRAM+34t

; =============== S U B	R O U T	I N E =======================================


VerifySaveslotCSum:				  ; CODE XREF: CheckSaveCSumsp
						  ; SaveGame:loc_15B8p
		bsr.s	GetSaveSlotAddress
		clr.w	d1
		move.w	#$03FE,d7
		UnlockSRAM

loc_1574:					  ; CODE XREF: VerifySaveslotCSum+Cj
		add.b	(a0),d1
		addq.w	#$02,a0
		dbf	d7,loc_1574
		cmp.b	(a0),d1
		LockSRAM
		rts
; End of function VerifySaveslotCSum


; =============== S U B	R O U T	I N E =======================================


GetSaveSlotAddress:				  ; CODE XREF: EraseSaveslotp
						  ; VerifySaveslotCSump ...
		clr.w	d1
		move.b	d0,d1
		mulu.w	#$0800,d1
		lea	(SaveSlot1).l,a0
		adda.w	d1,a0
		rts
; End of function GetSaveSlotAddress


; =============== S U B	R O U T	I N E =======================================


SaveGame:					  ; CODE XREF: j_SaveGamej
						  ; CheckForDebugSaveGame+14p
		movem.l	d0-d1/d7-a2,-(sp)
		move.b	(g_SaveSlot).l,d0
		bsr.s	GetSaveSlotAddress
		lea	SaveGameRamPtrs(pc),a1

loc_15A2:					  ; CODE XREF: SaveGame+24j
		movea.l	(a1)+,a2
		cmpa.l	#$00000000,a2
		beq.s	loc_15B8
		move.w	(a1)+,d7
		UnlockSRAM

loc_15AE:					  ; CODE XREF: SaveGame+20j
		move.b	(a2)+,(a0)
		addq.w	#$02,a0
		dbf	d7,loc_15AE
		LockSRAM
		bra.s	loc_15A2
; ---------------------------------------------------------------------------

loc_15B8:					  ; CODE XREF: SaveGame+18j
		bsr.s	VerifySaveslotCSum
		move.b	d1,(a0)
		movem.l	(sp)+,d0-d1/d7-a2
		rts
; End of function SaveGame


; =============== S U B	R O U T	I N E =======================================


LoadSavedGame:					  ; CODE XREF: ROM:0000EF46p
						  ; sub_F78E+2p ...
		move.b	(g_SaveSlot).l,d0
		bsr.s	GetSaveSlotAddress
		lea	SaveGameRamPtrs(pc),a1

loc_15CE:					  ; CODE XREF: LoadSavedGame+20j
		movea.l	(a1)+,a2
		cmpa.l	#$00000000,a2
		beq.s	locret_15E4
		move.w	(a1)+,d7
		UnlockSRAM

loc_15DA:					  ; CODE XREF: LoadSavedGame+1Cj
		move.b	(a0),(a2)+
		addq.w	#$02,a0
		dbf	d7,loc_15DA
		LockSRAM
		bra.s	loc_15CE
; ---------------------------------------------------------------------------

locret_15E4:					  ; CODE XREF: LoadSavedGame+14j
		rts
; End of function LoadSavedGame


; =============== S U B	R O U T	I N E =======================================


CopySaveGame:					  ; CODE XREF: ROM:0000EFA6p
		movem.w	d1,-(sp)
		ExpandBsr  GetSaveSlotAddress
		movea.l	a0,a1
		movem.w	(sp)+,d0
		ExpandBsr  GetSaveSlotAddress
		move.w	#$03FF,d7
		UnlockSRAM

loc_15F8:					  ; CODE XREF: CopySaveGame+18j
		move.b	(a1),(a0)
		addq.w	#$02,a0
		addq.w	#$02,a1
		dbf	d7,loc_15F8
		LockSRAM
		rts
; End of function CopySaveGame

; ---------------------------------------------------------------------------
		lea	SaveGameRamPtrs(pc),a1
		clr.w	d2

loc_160A:					  ; CODE XREF: ROM:00001616j
		cmpa.l	(a1),a0
		beq.s	loc_1618
		add.w	$00000004(a1),d2
		addq.w	#$01,d2
		addq.w	#$06,a1
		bra.s	loc_160A
; ---------------------------------------------------------------------------

loc_1618:					  ; CODE XREF: ROM:0000160Cj
		move.b	(g_SaveSlot).l,d0
		bsr.w	GetSaveSlotAddress
		add.w	d2,d2
		adda.w	d2,a0
		rts
; ---------------------------------------------------------------------------
SaveGameRamPtrs:dc.l g_Flags			  ; Address ; DATA XREF: SaveGame+Ct
						  ; LoadSavedGame+8t ...
		dc.w $001F			  ; Length
		dc.l g_Inventory		  ; Address
		dc.w $003F			  ; Length
		dc.l g_ChestOpenFlags		  ; Address
		dc.w $003F			  ; Length
		dc.l Player_X			  ; Address
		dc.w $0001			  ; Length
		dc.l Player_RotationAndSize	  ; Address
		dc.w $0000			  ; Length
		dc.l g_RmNum1			  ; Address
		dc.w $0001			  ; Length
		dc.l g_Gold			  ; Address
		dc.w $0001			  ; Length
		dc.l Player_AttackStrength	  ; Address
		dc.w $0001			  ; Length
		dc.l Player_CurrentHealth	  ; Address
		dc.w $0001			  ; Length
		dc.l Player_Defence		  ; Address
		dc.w $0001			  ; Length
		dc.l Player_MaxHealth		  ; Address
		dc.w $0001			  ; Length
		dc.l g_RoomVisitedFlags		  ; Address
		dc.w $0063			  ; Length
		dc.l g_CurrentEquippedItems	  ; Address
		dc.w $0001			  ; Length
		dc.l g_EquippedSword		  ; Address
		dc.w $0000			  ; Length
		dc.l g_EquippedArmour		  ; Address
		dc.w $0000			  ; Length
		dc.l g_EquippedBoots		  ; Address
		dc.w $0000			  ; Length
		dc.l g_EquippedRing		  ; Address
		dc.w $0000			  ; Length
		dc.l g_FrameCount		  ; Address
		dc.w $0001			  ; Length
		dc.l g_MinuteCount		  ; Address
		dc.w $0001			  ; Length
		dc.l g_HourCount		  ; Address
		dc.w $0001			  ; Length
		dc.l g_AdditionalFlags		  ; Address
		dc.w $001F			  ; Length
		dc.l g_PlayerStatus		  ; Address
		dc.w $0000			  ; Length
		dc.l RmNum2			  ; Address
		dc.w $0001			  ; Length
		dc.l $00000000
