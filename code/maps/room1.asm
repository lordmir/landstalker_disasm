Room1	module
; Room-load: fills the RAM WarpTbl for the current room, and - when
; the current room is a story variant - appends the original room's
; warps as well, so variant rooms keep their doorways.
LoadAllWarps:
		lea	(WarpTbl).l,a1
		clr.b	d7
		move.w	(g_CurrentRoom).l,d0
		bsr.s	LoadWarps
		move.w	(g_CurrentRoom).l,d0
		bsr.w	GetOriginalRoomNum
		cmp.w	(g_CurrentRoom).l,d0
		beq.w	_warpsDone


; Appends the warps for room d0 to WarpTbl (a1 = write pointer, d7 =
; entry count). The ROM list at (RoomExitsPtr) holds two-way
; connections, 8 bytes each:
;   WORD 0: room A (low 10 bits) | 6 flag bits (top bits)
;   WORD 2: cell in room A (X:Y)
;   WORD 4: room B (low 10 bits)
;   WORD 6: cell in room B (X:Y)
; A match on either side emits a WarpTbl entry {from cell, dest room,
; dest cell}. Flag bits 4-5 shift the arrival cell one cell along Y
; ($10) or X ($20) - the far side of the doorway - subtracting when
; travelling A to B and adding on the way back. Flag bits 2-3 widen
; the doorway one extra cell along X ($04) or Y ($08), and bit 1
; extends it to a third cell. WarpTbl holds at most 32 entries; on
; overflow the table is truncated after the debug alarm (30 beeps,
; suppressed when debug mode is active).
LoadWarps:
		movea.l	(RoomExitsPtr).l,a0

_nextEntry:
		move.w	(a0),d1
		bmi.w	_terminate
		andi.w	#$03FF,d1
		cmp.w	d1,d0
		bne.w	_chkReverse
		addq.b	#$01,d7
		cmpi.b	#$20,d7
		bhi.w	_overflow
		move.w	(a0),d1
		rol.w	#$07,d1
		andi.b	#$3F,d1
		move.w	2(a0),d3
		move.w	d3,(a1)+
		move.w	4(a0),d4
		andi.w	#$03FF,d4
		move.w	d4,(a1)+
		move.w	6(a0),d5
		move.b	d1,d6
		andi.b	#$30,d1
		beq.s	_fwdStore
		cmpi.b	#$10,d1
		bne.s	_fwdAdjX
		subq.b	#$01,d5
		bra.s	_fwdStore

_fwdAdjX:
		cmpi.b	#$20,d1
		bne.s	_fwdStore
		subi.w	#$0100,d5

_fwdStore:
		move.w	d5,(a1)+
		move.b	d6,d1
		andi.b	#$0C,d6
		beq.w	_skipEntry
		cmpi.b	#$04,d6
		bne.s	_fwdExtY
		addi.w	#$0100,d3
		addi.w	#$0100,d5
		bra.s	_fwdSecond

_fwdExtY:
		cmpi.b	#$08,d6
		bne.w	_skipEntry
		addq.b	#$01,d3
		addq.b	#$01,d5

_fwdSecond:
		addq.b	#$01,d7
		cmpi.b	#$20,d7
		bhi.w	_overflow
		move.w	d3,(a1)+
		move.w	d4,(a1)+
		move.w	d5,(a1)+
		andi.b	#$02,d1
		beq.w	_skipEntry
		cmpi.b	#$04,d6
		bne.s	_fwdExtY2
		addi.w	#$0100,d3
		addi.w	#$0100,d5
		bra.s	_fwdThird

_fwdExtY2:
		cmpi.b	#$08,d6
		bne.w	_skipEntry
		addq.b	#$01,d3
		addq.b	#$01,d5

_fwdThird:
		addq.b	#$01,d7
		cmpi.b	#$20,d7
		bhi.w	_overflow
		move.w	d3,(a1)+
		move.w	d4,(a1)+
		move.w	d5,(a1)+
		bra.w	_skipEntry

_chkReverse:
		move.w	4(a0),d1
		andi.w	#$03FF,d1
		cmp.w	d1,d0
		bne.w	_skipEntry
		addq.b	#$01,d7
		cmpi.b	#$20,d7
		bhi.w	_overflow
		move.w	(a0),d1
		rol.w	#$07,d1
		andi.b	#$3F,d1
		move.w	6(a0),d3
		move.w	d3,(a1)+
		move.w	(a0),d4
		andi.w	#$03FF,d4
		move.w	d4,(a1)+
		move.w	2(a0),d5
		move.b	d1,d6
		andi.b	#$30,d1
		beq.s	_revStore
		cmpi.b	#$10,d1
		bne.s	_revAdjX
		addq.b	#$01,d5
		bra.s	_revStore

_revAdjX:
		cmpi.b	#$20,d1
		bne.s	_revStore
		addi.w	#$0100,d5

_revStore:
		move.w	d5,(a1)+
		move.b	d6,d1
		andi.b	#$0C,d6
		beq.s	_skipEntry
		cmpi.b	#$04,d6
		bne.s	_revExtY
		addi.w	#$0100,d3
		addi.w	#$0100,d5
		bra.s	_revSecond

_revExtY:
		cmpi.b	#$08,d6
		bne.s	_skipEntry
		addq.b	#$01,d3
		addq.b	#$01,d5

_revSecond:
		addq.b	#$01,d7
		cmpi.b	#$20,d7
		bhi.w	_overflow
		move.w	d3,(a1)+
		move.w	d4,(a1)+
		move.w	d5,(a1)+
		andi.b	#$02,d1
		beq.s	_skipEntry
		cmpi.b	#$04,d6
		bne.s	_revExtY2
		addi.w	#$0100,d3
		addi.w	#$0100,d5
		bra.s	_revThird

_revExtY2:
		cmpi.b	#$08,d6
		bne.s	_skipEntry
		addq.b	#$01,d3
		addq.b	#$01,d5

_revThird:
		addq.b	#$01,d7
		cmpi.b	#$20,d7
		bhi.w	_overflow
		move.w	d3,(a1)+
		move.w	d4,(a1)+
		move.w	d5,(a1)+

_skipEntry:
		addq.l	#$08,a0
		bra.w	_nextEntry

_terminate:
		move.w	#$FFFF,(a1)

_warpsDone:
		rts

; Debug alarm: too many warps in one room (more than 32 WarpTbl
; entries). Beeps 30 times unless debug mode is on, then truncates.
_overflow:
		tst.w	(DebugModeEnable).w
		bmi.w	_terminate
		move.w	#29,d7

_beepLoop:
		trap	#$00			  ; Trap00Handler
		dc.w SND_NigelDropObj2
		move.w	#$0002,d0
		jsr	(j_Sleep).l
		dbf	d7,_beepLoop
		bra.s	_terminate


; Finds the warp entry matching the player's map cell in WarpTbl
; (entries {fromX.b, fromY.b, destRoom.w, destX.b, destY.b}) and sets
; g_OriginalRoom/g_CurrentRoom (via CheckForRoomTransition) plus the
; player's new position.
LookupWarpDestination:
		lea	(WarpTbl).l,a0
		move.b	(Player_X).l,d0
		move.b	(Player_Y).l,d1

_findCell:
		move.b	(a0),d2
		bmi.s	_lwdDone
		cmp.b	d2,d0
		bne.s	_nextWarp
		cmp.b	1(a0),d1
		bne.s	_nextWarp
		move.w	2(a0),d0
		move.w	d0,(g_OriginalRoom).l
		bsr.w	CheckForRoomTransition
		move.w	d0,(g_CurrentRoom).l
		move.b	4(a0),(Player_X).l
		move.b	5(a0),(Player_Y).l
		move.w	#$0808,(Player_SubX).l

_lwdDone:
		rts

_nextWarp:
		addq.w	#$06,a0
		bra.s	_findCell


; Room-load: caches the rooms reached by falling through a pit
; (g_RoomFallDest) and climbing off the top of a ladder
; (g_RoomClimbDest) for the current room; negative = none.
LoadFallClimbDests:
		lea	RoomFallDestination(pc),a0
		bsr.s	FindRoomDest
		move.w	d1,(g_RoomFallDest).l
		lea	RoomClimbDestination(pc),a0
		bsr.s	FindRoomDest
		move.w	d1,(g_RoomClimbDest).l
		rts


; Scans the {room.w, dest room.w} table at a0 for the current room
; (original, pre-variant number); returns d1 = dest room, or the
; negative terminator if the room has no entry.
FindRoomDest:
		move.w	(g_CurrentRoom).l,d0
		bsr.s	GetOriginalRoomNum
		move.w	#$FFFF,d1

_frdScan:
		move.w	(a0),d1
		bmi.s	_frdDone
		cmp.w	d0,d1
		beq.s	_frdFound
		addq.l	#$04,a0
		bra.s	_frdScan

_frdFound:
		move.w	2(a0),d1

_frdDone:
		rts


; Maps room d0 to its story variant: scans RoomTransitionLookup
; ({orig room.w, variant room.w, flag byte.b, flag bit.b}) and
; substitutes the variant whenever the entry's story flag is set.
; Later entries override earlier ones, so variants can chain.
CheckForRoomTransition:
		movem.l	d1-d2/a0-a1,-(sp)
		lea	RoomTransitionLookup(pc),a0
		lea	(g_Flags).l,a1

_cftScan:
		move.w	(a0),d1
		bmi.s	_cftDone
		cmp.w	d0,d1
		bne.s	_cftNext
		clr.w	d1
		move.b	4(a0),d1
		move.b	5(a0),d2
		btst	d2,(a1,d1.w)
		beq.s	_cftNext
		move.w	2(a0),d0

_cftNext:
		addq.l	#$06,a0
		bra.s	_cftScan

_cftDone:
		movem.l	(sp)+,d1-d2/a0-a1
		rts


; Reverse of CheckForRoomTransition: maps a variant room number in d0
; back to the original room it substitutes (d0 unchanged if not a
; variant). Warps, fall/climb destinations and the island map are
; keyed on original numbers.
GetOriginalRoomNum:
		movem.l	d1-d3/a0-a1,-(sp)
		move.w	d0,d3
		lea	RoomTransitionLookup(pc),a0
		lea	(g_Flags).l,a1

_gorScan:
		move.w	2(a0),d1
		bmi.s	_gorDone
		cmp.w	d0,d1
		bne.s	_gorNext
		move.w	(a0),d3

_gorNext:
		addq.l	#$06,a0
		bra.s	_gorScan

_gorDone:
		move.w	d3,d0
		movem.l	(sp)+,d1-d3/a0-a1
		rts

		modend
