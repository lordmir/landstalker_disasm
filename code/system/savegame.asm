SRAM	module
; Save data lives in SRAM, which maps only every other byte (hence
; the addq #2 strides and $800-byte address span for $400 bytes of
; data). Layout: the magic word "KAN&MAKIKO" at SRAM_MagicWord, then
; four $400-byte slots, each ending in an 8-bit additive checksum.

; Boot-time SRAM check: if the magic word is missing, initialise the
; SRAM (write the magic, erase all four slots); otherwise validate
; each slot's checksum, erasing any corrupt slot.
CheckSRAM:
		lea	(SRAM_MagicWord).l,a0
		lea	SRAM_ExpectedMagicWord(pc),a1 ;	"KAN&MAKIKO"
		moveq	#$9,d7
		UnlockSRAM

_cmpMagicLoop:
		move.b	(a1)+,d0
		cmp.b	(a0),d0
		bne.s	SetSRAMMagicWord
		addq.w	#$02,a0
		dbf	d7,_cmpMagicLoop
		LockSRAM
		clr.b	d0
		bsr.s	ValidateSaveslot
		bsr.s	ValidateSaveslot
		bsr.s	ValidateSaveslot
		bsr.s	ValidateSaveslot
		rts


; Verifies slot d0's checksum and erases the slot on mismatch, then
; advances d0 to the next slot.
ValidateSaveslot:
		ExpandBsr  VerifySaveslotCSum
		beq.s	_slotOK
		bsr.s	EraseSaveslot

_slotOK:
		addq.b	#$01,d0
		rts

; First-boot initialisation: write the magic word and erase all four
; slots.
SetSRAMMagicWord:
		lea	(SRAM_MagicWord).l,a0
		lea	SRAM_ExpectedMagicWord(pc),a1 ;	"KAN&MAKIKO"
		moveq	#$9,d7
		UnlockSRAM

_writeMagicLoop:
		move.b	(a1)+,(a0)
		addq.w	#$02,a0
		dbf	d7,_writeMagicLoop
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


; Erases the slot selected in g_SaveSlot (the save menu's "erase"
; action) by falling into EraseSaveslot.
EraseCurrentSaveslot:
		move.b	(g_SaveSlot).l,d0


; Zeroes save slot d0.
EraseSaveslot:
		bsr.s	GetSaveSlotAddress
		move.w	#$03FF,d7
		UnlockSRAM

_eraseLoop:
		clr.b	(a0)
		addq.w	#$02,a0
		dbf	d7,_eraseLoop
		LockSRAM
		rts

SRAM_ExpectedMagicWord:dc.b 'KAN&MAKIKO'


; Sums slot d0's $3FF data bytes into d1 and compares against the
; stored checksum byte (Z set = valid). Leaves a0 at the checksum
; byte and the sum in d1.
VerifySaveslotCSum:
		bsr.s	GetSaveSlotAddress
		clr.w	d1
		move.w	#$03FE,d7
		UnlockSRAM

_sumLoop:
		add.b	(a0),d1
		addq.w	#$02,a0
		dbf	d7,_sumLoop
		cmp.b	(a0),d1
		LockSRAM
		rts


; a0 = SRAM address of save slot d0 (slots are $800 apart).
GetSaveSlotAddress:
		clr.w	d1
		move.b	d0,d1
		mulu.w	#$0800,d1
		lea	(SaveSlot1).l,a0
		adda.w	d1,a0
		rts


; Writes every SaveGameRamPtrs block into the g_SaveSlot slot, then
; computes and stores the checksum.
SaveGame:
		movem.l	d0-d1/d7-a2,-(sp)
		move.b	(g_SaveSlot).l,d0
		bsr.s	GetSaveSlotAddress
		lea	SaveGameRamPtrs(pc),a1

_saveBlockLoop:
		movea.l	(a1)+,a2
		cmpa.l	#0,a2
		beq.s	_writeCSum
		move.w	(a1)+,d7
		UnlockSRAM

_saveByteLoop:
		move.b	(a2)+,(a0)
		addq.w	#$02,a0
		dbf	d7,_saveByteLoop
		LockSRAM
		bra.s	_saveBlockLoop

_writeCSum:
		bsr.s	VerifySaveslotCSum
		move.b	d1,(a0)
		movem.l	(sp)+,d0-d1/d7-a2
		rts


; Reads the g_SaveSlot slot back into the SaveGameRamPtrs blocks.
LoadSavedGame:
		move.b	(g_SaveSlot).l,d0
		bsr.s	GetSaveSlotAddress
		lea	SaveGameRamPtrs(pc),a1

_loadBlockLoop:
		movea.l	(a1)+,a2
		cmpa.l	#0,a2
		beq.s	_loadDone
		move.w	(a1)+,d7
		UnlockSRAM

_loadByteLoop:
		move.b	(a0),(a2)+
		addq.w	#$02,a0
		dbf	d7,_loadByteLoop
		LockSRAM
		bra.s	_loadBlockLoop

_loadDone:
		rts


; Copies save slot d0 over save slot d1 (used by the save menu's
; copy action).
CopySaveGame:
		movem.w	d1,-(sp)
		ExpandBsr  GetSaveSlotAddress
		movea.l	a0,a1
		movem.w	(sp)+,d0
		ExpandBsr  GetSaveSlotAddress
		move.w	#$03FF,d7
		UnlockSRAM

_copyLoop:
		move.b	(a1),(a0)
		addq.w	#$02,a0
		addq.w	#$02,a1
		dbf	d7,_copyLoop
		LockSRAM
		rts

; Unreferenced: converts the RAM address in a0 (one of the
; SaveGameRamPtrs entries) into its SRAM location within the current
; slot, by summing the byte counts of the preceding blocks.
GetVarSRAMAddress:
		lea	SaveGameRamPtrs(pc),a1
		clr.w	d2

_findPtrLoop:
		cmpa.l	(a1),a0
		beq.s	_foundPtr
		add.w	4(a1),d2
		addq.w	#$01,d2
		addq.w	#$06,a1
		bra.s	_findPtrLoop

_foundPtr:
		move.b	(g_SaveSlot).l,d0
		bsr.w	GetSaveSlotAddress
		add.w	d2,d2
		adda.w	d2,a0
		rts

; {RAM address.l, byte count-1.w} blocks, null terminated.
SaveGameRamPtrs:dc.l g_Flags			  ; Address
		dc.w $001F			  ; Length
		dc.l g_Inventory		  ; Address
		dc.w $003F			  ; Length
		dc.l g_ChestOpenFlags		  ; Address
		dc.w $003F			  ; Length
		dc.l Player_X			  ; Address
		dc.w $0001			  ; Length
		dc.l Player_RotationAndSize	  ; Address
		dc.w $0000			  ; Length
		dc.l g_CurrentRoom		  ; Address
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
		dc.l g_OriginalRoom		  ; Address
		dc.w $0001			  ; Length
		dc.l $00000000

		modend
