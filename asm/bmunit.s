	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	THUMB_FUNC_START GetItemIndex
GetItemIndex: @ 0x080174EC
	adds r1, r0, #0
	movs r0, #0xff
	ands r0, r1
	bx lr

	THUMB_FUNC_START GetItemNameString
GetItemNameString: @ 0x080174F4
	push {lr}
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017514  @ gItemData
	adds r1, r1, r0
	ldrh r0, [r1]
	bl GetStringFromIndex
	bl FilterSomeTextFromStandardBuffer
	pop {r1}
	bx r1
	.align 2, 0
_08017514: .4byte gItemData

	THUMB_FUNC_START GetItemDescId
GetItemDescId: @ 0x08017518
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801752C  @ gItemData
	adds r1, r1, r0
	ldrh r0, [r1, #2]
	bx lr
	.align 2, 0
_0801752C: .4byte gItemData

	THUMB_FUNC_START GetItemUseDescId
GetItemUseDescId: @ 0x08017530
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017544  @ gItemData
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	bx lr
	.align 2, 0
_08017544: .4byte gItemData

	THUMB_FUNC_START GetItemWType
GetItemWType: @ 0x08017548
	push {lr}
	cmp r0, #0
	beq _08017564
	movs r1, #0xff
	ands r1, r0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08017560  @ gItemData
	adds r0, r0, r1
	ldrb r0, [r0, #7]
	b _08017566
	.align 2, 0
_08017560: .4byte gItemData
_08017564:
	movs r0, #0xff
_08017566:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetItemAttributes
GetItemAttributes: @ 0x0801756C
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017580  @ gItemData
	adds r1, r1, r0
	ldr r0, [r1, #8]
	bx lr
	.align 2, 0
_08017580: .4byte gItemData

	THUMB_FUNC_START GetItemUses
GetItemUses: @ 0x08017584
	push {lr}
	adds r2, r0, #0
	movs r1, #0xff
	ands r1, r2
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080175A4  @ gItemData
	adds r0, r0, r1
	ldr r0, [r0, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080175A8
	asrs r0, r2, #8
	b _080175AA
	.align 2, 0
_080175A4: .4byte gItemData
_080175A8:
	movs r0, #0xff
_080175AA:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetItemMaxUses
GetItemMaxUses: @ 0x080175B0
	push {lr}
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080175D0  @ gItemData
	adds r2, r1, r0
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080175D4
	ldrb r0, [r2, #0x14]
	b _080175D6
	.align 2, 0
_080175D0: .4byte gItemData
_080175D4:
	movs r0, #0xff
_080175D6:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetItemMight
GetItemMight: @ 0x080175DC
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080175F0  @ gItemData
	adds r1, r1, r0
	ldrb r0, [r1, #0x15]
	bx lr
	.align 2, 0
_080175F0: .4byte gItemData

	THUMB_FUNC_START GetItemHit
GetItemHit: @ 0x080175F4
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017608  @ gItemData
	adds r1, r1, r0
	ldrb r0, [r1, #0x16]
	bx lr
	.align 2, 0
_08017608: .4byte gItemData

	THUMB_FUNC_START GetItemWeight
GetItemWeight: @ 0x0801760C
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017620  @ gItemData
	adds r1, r1, r0
	ldrb r0, [r1, #0x17]
	bx lr
	.align 2, 0
_08017620: .4byte gItemData

	THUMB_FUNC_START GetItemCrit
GetItemCrit: @ 0x08017624
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017638  @ gItemData
	adds r1, r1, r0
	ldrb r0, [r1, #0x18]
	bx lr
	.align 2, 0
_08017638: .4byte gItemData

	THUMB_FUNC_START GetItemCost
GetItemCost: @ 0x0801763C
	push {lr}
	adds r3, r0, #0
	movs r0, #0xff
	ands r0, r3
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801765C  @ gItemData
	adds r2, r1, r0
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08017660
	ldrh r0, [r2, #0x1a]
	b _08017666
	.align 2, 0
_0801765C: .4byte gItemData
_08017660:
	asrs r0, r3, #8
	ldrh r1, [r2, #0x1a]
	muls r0, r1, r0
_08017666:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetItemMinRange
GetItemMinRange: @ 0x0801766C
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017680  @ gItemData
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	lsrs r0, r0, #4
	bx lr
	.align 2, 0
_08017680: .4byte gItemData

	THUMB_FUNC_START GetItemMaxRange
GetItemMaxRange: @ 0x08017684
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801769C  @ gItemData
	adds r1, r1, r0
	ldrb r1, [r1, #0x19]
	movs r0, #0xf
	ands r0, r1
	bx lr
	.align 2, 0
_0801769C: .4byte gItemData

	THUMB_FUNC_START GetItemRange
GetItemRange: @ 0x080176A0
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080176B4  @ gItemData
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	bx lr
	.align 2, 0
_080176B4: .4byte gItemData

	THUMB_FUNC_START GetItemWRank
GetItemWRank: @ 0x080176B8
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080176CC  @ gItemData
	adds r1, r1, r0
	ldrb r0, [r1, #0x1c]
	bx lr
	.align 2, 0
_080176CC: .4byte gItemData

	THUMB_FUNC_START GetItemEffectivenessPtr
GetItemEffectivenessPtr: @ 0x080176D0
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080176E4  @ gItemData
	adds r1, r1, r0
	ldr r0, [r1, #0x10]
	bx lr
	.align 2, 0
_080176E4: .4byte gItemData

	THUMB_FUNC_START GetItemStatBonusesPtr
GetItemStatBonusesPtr: @ 0x080176E8
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080176FC  @ gItemData
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	bx lr
	.align 2, 0
_080176FC: .4byte gItemData

	THUMB_FUNC_START GetItemIconId
GetItemIconId: @ 0x08017700
	push {lr}
	cmp r0, #0
	beq _0801771C
	movs r1, #0xff
	ands r1, r0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08017718  @ gItemData
	adds r0, r0, r1
	ldrb r0, [r0, #0x1d]
	b _08017720
	.align 2, 0
_08017718: .4byte gItemData
_0801771C:
	movs r0, #1
	negs r0, r0
_08017720:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetItemWeaponEffect
GetItemWeaponEffect: @ 0x08017724
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017738  @ gItemData
	adds r1, r1, r0
	ldrb r0, [r1, #0x1f]
	bx lr
	.align 2, 0
_08017738: .4byte gItemData

	THUMB_FUNC_START GetItemUseEffect
GetItemUseEffect: @ 0x0801773C
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017750  @ gItemData
	adds r1, r1, r0
	ldrb r0, [r1, #0x1e]
	bx lr
	.align 2, 0
_08017750: .4byte gItemData

	THUMB_FUNC_START GetItemCostPerUse
GetItemCostPerUse: @ 0x08017754
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017768  @ gItemData
	adds r1, r1, r0
	ldrh r0, [r1, #0x1a]
	bx lr
	.align 2, 0
_08017768: .4byte gItemData

	THUMB_FUNC_START GetItemMaxCost
GetItemMaxCost: @ 0x0801776C
	push {lr}
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017794  @ gItemData
	adds r2, r1, r0
	ldr r0, [r2, #8]
	movs r1, #8
	ands r0, r1
	movs r1, #0xff
	cmp r0, #0
	bne _0801778A
	ldrb r1, [r2, #0x14]
_0801778A:
	ldrh r0, [r2, #0x1a]
	muls r0, r1, r0
	pop {r1}
	bx r1
	.align 2, 0
_08017794: .4byte gItemData

	THUMB_FUNC_START GetItemWExp
GetItemWExp: @ 0x08017798
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080177AC  @ gItemData
	adds r1, r1, r0
	adds r1, #0x20
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_080177AC: .4byte gItemData

	THUMB_FUNC_START GetROMItemStructPtr
GetROMItemStructPtr: @ 0x080177B0
	adds r1, r0, #0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080177C0  @ gItemData
	adds r0, r0, r1
	bx lr
	.align 2, 0
_080177C0: .4byte gItemData

	@ bm-item / bm-unit split here!

	THUMB_FUNC_START ClearUnits
ClearUnits: @ 0x080177C4
	push {r4, r5, r6, r7, lr}
	movs r5, #0
	ldr r7, _080177F0  @ gUnknown_0859A5D0
	movs r6, #0xff
_080177CC:
	adds r0, r5, #0
	ands r0, r6
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r4, [r0]
	cmp r4, #0
	beq _080177E2
	adds r0, r4, #0
	bl ClearUnitStruct
	strb r5, [r4, #0xb]
_080177E2:
	adds r5, #1
	cmp r5, #0xff
	ble _080177CC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080177F0: .4byte gUnknown_0859A5D0

	THUMB_FUNC_START ClearUnitStruct
ClearUnitStruct: @ 0x080177F4
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrb r5, [r4, #0xb]
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r2, _08017818  @ 0x01000024
	mov r0, sp
	adds r1, r4, #0
	bl CpuSet
	strb r5, [r4, #0xb]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08017818: .4byte 0x01000024

	THUMB_FUNC_START CopyUnitStruct
CopyUnitStruct: @ 0x0801781C
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldrb r5, [r4, #0xb]
	adds r0, r4, #0
	adds r1, r2, #0
	movs r2, #0x48
	bl memcpy
	strb r5, [r4, #0xb]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START GetNextFreeUnitStructPtr
GetNextFreeUnitStructPtr: @ 0x08017838
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r3, #0x40
	adds r2, r0, #1
	cmp r2, r3
	bge _08017866
	ldr r5, _0801785C  @ gUnknown_0859A5D0
	movs r4, #0xff
_08017848:
	adds r0, r2, #0
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	bne _08017860
	adds r0, r1, #0
	b _08017868
	.align 2, 0
_0801785C: .4byte gUnknown_0859A5D0
_08017860:
	adds r2, #1
	cmp r2, r3
	blt _08017848
_08017866:
	movs r0, #0
_08017868:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetNextFreePlayerUnitStruct
GetNextFreePlayerUnitStruct: @ 0x08017870
	push {r4, r5, lr}
	movs r5, #0x40
	ldrb r4, [r0]
	bl GetPlayerLeaderUnitId
	movs r2, #1
	ldr r4, _08017894  @ gUnknown_0859A5D0
	movs r3, #0xff
_08017880:
	adds r0, r2, #0
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	bne _08017898
	adds r0, r1, #0
	b _080178A0
	.align 2, 0
_08017894: .4byte gUnknown_0859A5D0
_08017898:
	adds r2, #1
	cmp r2, r5
	blt _08017880
	movs r0, #0
_080178A0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitFogViewRange
GetUnitFogViewRange: @ 0x080178A8
	push {lr}
	adds r2, r0, #0
	ldr r0, _080178D4  @ gUnknown_0202BCF0
	ldrb r3, [r0, #0xd]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080178C4
	adds r3, #5
_080178C4:
	adds r0, r2, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	adds r0, r3, r0
	pop {r1}
	bx r1
	.align 2, 0
_080178D4: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START SetUnitNewStatus
SetUnitNewStatus: @ 0x080178D8
	push {lr}
	adds r2, r1, #0
	cmp r2, #0
	bne _080178E4
	adds r0, #0x30
	b _080178EE
_080178E4:
	adds r0, #0x30
	movs r1, #0xf
	ands r2, r1
	movs r1, #0x50
	orrs r2, r1
_080178EE:
	strb r2, [r0]
	pop {r0}
	bx r0

	THUMB_FUNC_START WriteUnitStatusDuration
WriteUnitStatusDuration: @ 0x080178F4
	adds r0, #0x30
	movs r3, #0xf
	lsls r2, r2, #4
	ands r1, r3
	orrs r2, r1
	strb r2, [r0]
	bx lr

	THUMB_FUNC_START GetUnitSMSIndex
GetUnitSMSIndex: @ 0x08017904
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	bne _0801791A
	ldr r0, [r2, #4]
	ldrb r0, [r0, #6]
	b _08017944
_0801791A:
	ldrb r0, [r2, #0x1c]
	bl GetTrap
	ldrb r0, [r0, #3]
	cmp r0, #0x36
	beq _0801793A
	cmp r0, #0x36
	bgt _08017930
	cmp r0, #0x35
	beq _08017936
	b _08017942
_08017930:
	cmp r0, #0x37
	beq _0801793E
	b _08017942
_08017936:
	movs r0, #0x58
	b _08017944
_0801793A:
	movs r0, #0x59
	b _08017944
_0801793E:
	movs r0, #0x5a
	b _08017944
_08017942:
	movs r0, #0
_08017944:
	pop {r1}
	bx r1

	THUMB_FUNC_START UnitAddItem
UnitAddItem: @ 0x08017948
	push {lr}
	movs r3, #0
	adds r2, r0, #0
	adds r2, #0x1e
_08017950:
	ldrh r0, [r2]
	cmp r0, #0
	bne _0801795C
	strh r1, [r2]
	movs r0, #1
	b _08017966
_0801795C:
	adds r2, #2
	adds r3, #1
	cmp r3, #4
	ble _08017950
	movs r0, #0
_08017966:
	pop {r1}
	bx r1

	THUMB_FUNC_START UnitClearInventory
UnitClearInventory: @ 0x0801796C
	push {lr}
	movs r2, #0
	movs r1, #4
	adds r0, #0x26
_08017974:
	strh r2, [r0]
	subs r0, #2
	subs r1, #1
	cmp r1, #0
	bge _08017974
	pop {r0}
	bx r0

	THUMB_FUNC_START RemoveUnitBlankItems
RemoveUnitBlankItems: @ 0x08017984
	push {r4, r5, r6, lr}
	sub sp, #0xc
	mov r2, sp
	movs r3, #0
	adds r5, r0, #0
	adds r5, #0x1e
	adds r4, r5, #0
	movs r6, #0
_08017994:
	lsls r0, r3, #1
	adds r1, r4, r0
	ldrh r0, [r1]
	cmp r0, #0
	beq _080179A2
	strh r0, [r2]
	adds r2, #2
_080179A2:
	strh r6, [r1]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #4
	bls _08017994
	movs r0, #0
	strh r0, [r2]
	movs r3, #0
	adds r4, r5, #0
_080179B6:
	lsls r2, r3, #1
	mov r1, sp
	adds r0, r1, r2
	ldrh r1, [r0]
	cmp r1, #0
	beq _080179D0
	adds r0, r4, r2
	strh r1, [r0]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, #4
	bls _080179B6
_080179D0:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START GetUnitItemCount
GetUnitItemCount: @ 0x080179D8
	push {lr}
	movs r2, #4
	adds r1, r0, #0
	adds r1, #0x26
_080179E0:
	ldrh r0, [r1]
	cmp r0, #0
	beq _080179EA
	adds r0, r2, #1
	b _080179F4
_080179EA:
	subs r1, #2
	subs r2, #1
	cmp r2, #0
	bge _080179E0
	movs r0, #0
_080179F4:
	pop {r1}
	bx r1

	THUMB_FUNC_START UnitHasItem
UnitHasItem: @ 0x080179F8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, r5, #0
	bl GetItemIndex
	adds r5, r0, #0
	movs r6, #0
	ldrh r0, [r4, #0x1e]
	cmp r0, #0
	beq _08017A2C
	adds r4, #0x1e
_08017A10:
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, r5
	bne _08017A1E
	movs r0, #1
	b _08017A2E
_08017A1E:
	adds r4, #2
	adds r6, #1
	cmp r6, #4
	bgt _08017A2C
	ldrh r0, [r4]
	cmp r0, #0
	bne _08017A10
_08017A2C:
	movs r0, #0
_08017A2E:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START LoadUnits
LoadUnits: @ 0x08017A34
	push {r4, r5, lr}
	adds r4, r0, #0
	movs r5, #0
	b _08017A46
_08017A3C:
	adds r0, r4, #0
	bl LoadUnit
	adds r4, #0x14
	adds r5, #1
_08017A46:
	ldrb r0, [r4]
	cmp r0, #0
	bne _08017A3C
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8017A54
sub_8017A54: @ 0x08017A54
	push {lr}
	adds r2, r0, #0
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	cmp r0, #3
	ble _08017A68
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2, #0x14]
_08017A68:
	movs r0, #0x17
	ldrsb r0, [r2, r0]
	cmp r0, #3
	ble _08017A78
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2, #0x17]
_08017A78:
	movs r0, #0x18
	ldrsb r0, [r2, r0]
	cmp r0, #3
	ble _08017A88
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2, #0x18]
_08017A88:
	pop {r0}
	bx r0

	THUMB_FUNC_START HasClassWRank
HasClassWRank: @ 0x08017A8C
	push {lr}
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r3, r1, #0x18
	cmp r2, #0
	bgt _08017A9E
	movs r0, #0
	b _08017AA8
_08017A9E:
	movs r0, #0x54
	adds r1, r2, #0
	muls r1, r0, r1
	ldr r0, _08017AB8  @ gUnknown_08807110
	adds r0, r1, r0
_08017AA8:
	adds r0, #0x2c
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08017ABC
	movs r0, #0
	b _08017ABE
	.align 2, 0
_08017AB8: .4byte gUnknown_08807110
_08017ABC:
	movs r0, #1
_08017ABE:
	pop {r1}
	bx r1

	THUMB_FUNC_START LoadUnit
LoadUnit: @ 0x08017AC4
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r6, r0, #0
	movs r5, #0
	ldrb r1, [r6, #5]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08017BAA
	ldrb r0, [r6, #1]
	bl GenerateMonsterClass
	lsls r0, r0, #0x10
	lsrs r7, r0, #0x10
	mov r1, sp
	adds r0, r6, #0
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	mov r2, sp
	ldrb r0, [r2, #3]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #3]
	mov r0, sp
	strb r7, [r0, #1]
	ldrb r0, [r6, #3]
	lsrs r0, r0, #3
	bl GenerateMonsterLevel
	mov r3, sp
	lsls r0, r0, #3
	ldrb r2, [r3, #3]
	movs r1, #7
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #3]
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	bl GenerateMonsterItems
	lsrs r4, r0, #0x10
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r0, sp
	strb r4, [r0, #0xc]
	strb r6, [r0, #0xd]
	strb r5, [r0, #0xe]
	strb r5, [r0, #0xf]
	adds r0, r4, #0
	bl GetItemWeaponEffect
	cmp r0, #1
	beq _08017B36
	cmp r6, #0
	bne _08017B44
_08017B36:
	mov r2, sp
	ldrb r1, [r2, #5]
	movs r0, #0x21
	negs r0, r0
	ands r0, r1
	strb r0, [r2, #5]
	b _08017B4E
_08017B44:
	mov r0, sp
	ldrb r1, [r0, #5]
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r0, #5]
_08017B4E:
	cmp r4, #0xac
	beq _08017B56
	cmp r4, #0xb5
	bne _08017B84
_08017B56:
	mov r0, sp
	mov r1, sp
	ldrb r1, [r1, #0xd]
	strb r1, [r0, #0xe]
	cmp r7, #0x60
	beq _08017B78
	cmp r7, #0x60
	bgt _08017B6C
	cmp r7, #0x5f
	beq _08017B72
	b _08017B84
_08017B6C:
	cmp r7, #0x61
	beq _08017B7E
	b _08017B84
_08017B72:
	mov r1, sp
	movs r0, #0xb3
	b _08017B82
_08017B78:
	mov r1, sp
	movs r0, #0xb4
	b _08017B82
_08017B7E:
	mov r1, sp
	movs r0, #0xab
_08017B82:
	strb r0, [r1, #0xd]
_08017B84:
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	movs r1, #3
	bl HasClassWRank
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08017BA8
	mov r2, sp
	mov r0, sp
	ldrb r1, [r0, #0x12]
	movs r0, #7
	ands r0, r1
	strb r0, [r2, #0x12]
	movs r1, #0x28
	orrs r0, r1
	strb r0, [r2, #0x12]
_08017BA8:
	mov r6, sp
_08017BAA:
	ldrb r0, [r6, #3]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _08017BD0
	cmp r0, #1
	bgt _08017BBE
	cmp r0, #0
	beq _08017BC4
	b _08017BD8
_08017BBE:
	cmp r0, #2
	beq _08017BCC
	b _08017BD8
_08017BC4:
	adds r0, r6, #0
	bl GetNextFreePlayerUnitStruct
	b _08017BD6
_08017BCC:
	movs r0, #0x80
	b _08017BD2
_08017BD0:
	movs r0, #0x40
_08017BD2:
	bl GetNextFreeUnitStructPtr
_08017BD6:
	adds r5, r0, #0
_08017BD8:
	cmp r5, #0
	bne _08017BE0
	movs r0, #0
	b _08017D34
_08017BE0:
	adds r0, r5, #0
	bl ClearUnitStruct
	adds r0, r5, #0
	adds r1, r6, #0
	bl StoreNewUnitFromCode
	ldr r1, [r5]
	adds r0, r5, #0
	bl LoadUnitStats
	adds r0, r5, #0
	bl HideIfUnderRoof
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x62
	beq _08017C08
	cmp r0, #0x34
	bne _08017C10
_08017C08:
	adds r0, r5, #0
	movs r1, #0xa
	bl SetUnitNewStatus
_08017C10:
	ldrb r1, [r6, #3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08017CB8
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _08017C36
	adds r0, r5, #0
	bl AutolevelRealistic
	adds r0, r5, #0
	adds r1, r6, #0
	bl AutolevelUnitWeaponRanks
	b _08017CA0
_08017C36:
	ldr r2, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r2, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	bne _08017C50
	ldrb r0, [r2, #4]
	cmp r0, #0x3f
	bhi _08017C8A
_08017C50:
	movs r0, #0
	bl GetNextFreeUnitStructPtr
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl CopyUnitStruct
	movs r0, #0
	strb r0, [r4, #9]
	adds r0, r4, #0
	bl AutolevelRealistic
	adds r0, r5, #0
	bl ClearUnitStruct
	adds r0, r4, #0
	adds r1, r5, #0
	bl CopyUnitStruct
	adds r0, r4, #0
	bl ClearUnitStruct
	movs r0, #0xff
	strb r0, [r5, #9]
	ldrb r0, [r6, #3]
	lsrs r0, r0, #3
	strb r0, [r5, #8]
	b _08017C90
_08017C8A:
	adds r0, r5, #0
	bl AutolevelUnit
_08017C90:
	adds r0, r5, #0
	adds r1, r6, #0
	bl AutolevelUnitWeaponRanks
	ldrb r1, [r6, #2]
	adds r0, r5, #0
	adds r0, #0x38
	strb r1, [r0]
_08017CA0:
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x62
	beq _08017CAC
	cmp r0, #0x34
	bne _08017CB8
_08017CAC:
	movs r1, #8
	ldrsb r1, [r5, r1]
	adds r1, #1
	lsls r0, r1, #2
	adds r0, r0, r1
	strb r0, [r5, #0x12]
_08017CB8:
	adds r0, r5, #0
	bl FixROMUnitStructPtr
	adds r0, r5, #0
	bl LoadUnitSupports
	ldrb r1, [r6, #5]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08017CD8
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r5, #0xc]
_08017CD8:
	adds r0, r5, #0
	bl CheckForStatCaps
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHPBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	strb r1, [r5, #0x13]
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x62
	beq _08017D00
	cmp r0, #0x34
	bne _08017D32
_08017D00:
	movs r4, #5
	strb r4, [r5, #0x13]
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHPBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _08017D32
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHPBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	strb r1, [r5, #0x13]
_08017D32:
	adds r0, r5, #0
_08017D34:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START StoreNewUnitFromCode
StoreNewUnitFromCode: @ 0x08017D3C
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldrb r1, [r6]
	cmp r1, #0
	bgt _08017D4C
	movs r1, #0
	b _08017D54
_08017D4C:
	movs r0, #0x34
	muls r1, r0, r1
	ldr r0, _08017D64  @ gUnknown_08803D30
	adds r1, r1, r0
_08017D54:
	str r1, [r5]
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _08017D68
	adds r1, r0, #0
	cmp r1, #0
	ble _08017D6E
	b _08017D72
	.align 2, 0
_08017D64: .4byte gUnknown_08803D30
_08017D68:
	ldrb r1, [r1, #5]
	cmp r1, #0
	bgt _08017D72
_08017D6E:
	movs r1, #0
	b _08017D7A
_08017D72:
	movs r0, #0x54
	muls r1, r0, r1
	ldr r0, _08017DBC  @ gUnknown_08807110
	adds r1, r1, r0
_08017D7A:
	str r1, [r5, #4]
	ldrb r0, [r6, #3]
	lsrs r0, r0, #3
	strb r0, [r5, #8]
	adds r1, r5, #0
	adds r1, #0x10
	adds r2, r5, #0
	adds r2, #0x11
	adds r0, r6, #0
	movs r3, #0
	bl GetPreferredPositionForUNIT
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x62
	beq _08017D9E
	cmp r0, #0x34
	bne _08017DC0
_08017D9E:
	movs r0, #0
	strh r0, [r5, #0x1e]
	movs r1, #0
	adds r3, r6, #0
	adds r3, #0xc
	adds r2, r5, #0
	adds r2, #0x20
_08017DAC:
	adds r0, r3, r1
	ldrb r0, [r0]
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #3
	ble _08017DAC
	b _08017DEA
	.align 2, 0
_08017DBC: .4byte gUnknown_08807110
_08017DC0:
	adds r1, r6, #0
	adds r1, #0xc
	ldrb r0, [r6, #0xc]
	cmp r0, #0
	beq _08017DEA
	adds r4, r1, #0
	adds r7, r4, #0
_08017DCE:
	ldrb r0, [r4]
	bl MakeItemShort
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitAddItem
	adds r4, #1
	adds r0, r7, #3
	cmp r4, r0
	bgt _08017DEA
	ldrb r0, [r4]
	cmp r0, #0
	bne _08017DCE
_08017DEA:
	adds r0, r5, #0
	adds r1, r6, #0
	bl CharStoreAI
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START CharFillInventoryFromCode
CharFillInventoryFromCode: @ 0x08017DF8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	bl UnitClearInventory
	adds r1, r4, #0
	adds r1, #0xc
	ldrb r0, [r4, #0xc]
	cmp r0, #0
	beq _08017E2C
	adds r4, r1, #0
	adds r6, r4, #0
_08017E10:
	ldrb r0, [r4]
	bl MakeItemShort
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitAddItem
	adds r4, #1
	adds r0, r6, #3
	cmp r4, r0
	bgt _08017E2C
	ldrb r0, [r4]
	cmp r0, #0
	bne _08017E10
_08017E2C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START LoadUnitStats
LoadUnitStats: @ 0x08017E34
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r2, [r4, #4]
	ldrb r0, [r2, #0xb]
	ldrb r3, [r1, #0xc]
	adds r0, r0, r3
	movs r3, #0
	strb r0, [r4, #0x12]
	ldrb r0, [r2, #0xc]
	ldrb r5, [r1, #0xd]
	adds r0, r0, r5
	strb r0, [r4, #0x14]
	ldrb r0, [r2, #0xd]
	ldrb r5, [r1, #0xe]
	adds r0, r0, r5
	strb r0, [r4, #0x15]
	ldrb r0, [r2, #0xe]
	ldrb r5, [r1, #0xf]
	adds r0, r0, r5
	strb r0, [r4, #0x16]
	ldrb r0, [r2, #0xf]
	ldrb r5, [r1, #0x10]
	adds r0, r0, r5
	strb r0, [r4, #0x17]
	ldrb r0, [r2, #0x10]
	ldrb r2, [r1, #0x11]
	adds r0, r0, r2
	strb r0, [r4, #0x18]
	ldrb r0, [r1, #0x12]
	strb r0, [r4, #0x19]
	strb r3, [r4, #0x1a]
	movs r1, #0
	adds r3, r4, #0
	adds r3, #0x28
_08017E78:
	adds r2, r3, r1
	ldr r0, [r4, #4]
	adds r0, #0x2c
	adds r0, r0, r1
	ldrb r0, [r0]
	strb r0, [r2]
	ldr r0, [r4]
	adds r0, #0x14
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08017E92
	strb r0, [r2]
_08017E92:
	adds r1, #1
	cmp r1, #7
	ble _08017E78
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	movs r0, #0xc0
	ands r1, r0
	cmp r1, #0
	bne _08017EB0
	movs r0, #8
	ldrsb r0, [r4, r0]
	cmp r0, #0x14
	beq _08017EB0
	strb r1, [r4, #9]
	b _08017EB4
_08017EB0:
	movs r0, #0xff
	strb r0, [r4, #9]
_08017EB4:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START FixROMUnitStructPtr
FixROMUnitStructPtr: @ 0x08017EBC
	push {lr}
	adds r2, r0, #0
	ldr r3, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r3, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08017EEA
	ldrb r0, [r3, #4]
	subs r1, r0, #1
	cmp r1, #0
	bgt _08017EE0
	movs r0, #0
	b _08017EE8
_08017EE0:
	movs r0, #0x34
	muls r1, r0, r1
	ldr r0, _08017EF0  @ gUnknown_08803D30
	adds r0, r1, r0
_08017EE8:
	str r0, [r2]
_08017EEA:
	pop {r0}
	bx r0
	.align 2, 0
_08017EF0: .4byte gUnknown_08803D30

	THUMB_FUNC_START LoadUnitSupports
LoadUnitSupports: @ 0x08017EF4
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	bl GetROMUnitSupportCount
	adds r6, r0, #0
	movs r4, #0
	cmp r4, r6
	bge _08017F1A
	adds r7, r5, #0
	adds r7, #0x32
_08017F08:
	adds r0, r5, #0
	adds r1, r4, #0
	bl GetUnitStartingSupportValue
	adds r1, r7, r4
	strb r0, [r1]
	adds r4, #1
	cmp r4, r6
	blt _08017F08
_08017F1A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START AutolevelUnitWeaponRanks
AutolevelUnitWeaponRanks: @ 0x08017F20
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	ldrb r1, [r1, #3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08017FB8
	movs r7, #0
	b _08017FAE
_08017F32:
	lsls r1, r7, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #5
	ands r1, r0
	cmp r1, #0
	beq _08017FAC
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _08017F66
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseAsWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08017FAC
_08017F66:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08017F82
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseAsStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08017FAC
_08017F82:
	adds r0, r4, #0
	bl GetItemAttributes
	ldr r1, _08017FC0  @ 0x003D3C00
	ands r1, r0
	cmp r1, #0
	bne _08017FAC
	adds r0, r4, #0
	bl GetItemWType
	adds r1, r6, #0
	adds r1, #0x28
	adds r5, r1, r0
	ldrb r0, [r5]
	cmp r0, #0
	bne _08017FA4
	movs r4, #0
_08017FA4:
	adds r0, r4, #0
	bl GetItemWRank
	strb r0, [r5]
_08017FAC:
	adds r7, #1
_08017FAE:
	adds r0, r6, #0
	bl GetUnitItemCount
	cmp r7, r0
	blt _08017F32
_08017FB8:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08017FC0: .4byte 0x003D3C00

	THUMB_FUNC_START IncreaseUnitStatsByLevelCount
IncreaseUnitStatsByLevelCount: @ 0x08017FC4
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r2, #0
	cmp r5, #0
	beq _0801805E
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1b]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl GetAutoleveledStat
	ldrb r1, [r4, #0x12]
	adds r1, r1, r0
	strb r1, [r4, #0x12]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1c]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl GetAutoleveledStat
	ldrb r1, [r4, #0x14]
	adds r1, r1, r0
	strb r1, [r4, #0x14]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1d]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl GetAutoleveledStat
	ldrb r1, [r4, #0x15]
	adds r1, r1, r0
	strb r1, [r4, #0x15]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1e]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl GetAutoleveledStat
	ldrb r1, [r4, #0x16]
	adds r1, r1, r0
	strb r1, [r4, #0x16]
	ldr r0, [r4, #4]
	ldrb r0, [r0, #0x1f]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl GetAutoleveledStat
	ldrb r1, [r4, #0x17]
	adds r1, r1, r0
	strb r1, [r4, #0x17]
	ldr r0, [r4, #4]
	adds r0, #0x20
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl GetAutoleveledStat
	ldrb r1, [r4, #0x18]
	adds r1, r1, r0
	strb r1, [r4, #0x18]
	ldr r0, [r4, #4]
	adds r0, #0x21
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r5, #0
	bl GetAutoleveledStat
	ldrb r1, [r4, #0x19]
	adds r1, r1, r0
	strb r1, [r4, #0x19]
_0801805E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START StoreUnitStats
StoreUnitStats: @ 0x08018064
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #8
	ldrsb r5, [r4, r5]
	cmp r2, #0
	beq _080180C4
	ldr r3, [r4]
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	cmp r5, r0
	ble _080180C4
	subs r2, r5, r2
	ldr r1, [r4, #4]
	ldrb r0, [r1, #0xb]
	ldrb r6, [r3, #0xc]
	adds r0, r0, r6
	strb r0, [r4, #0x12]
	ldrb r0, [r1, #0xc]
	ldrb r6, [r3, #0xd]
	adds r0, r0, r6
	strb r0, [r4, #0x14]
	ldrb r0, [r1, #0xd]
	ldrb r6, [r3, #0xe]
	adds r0, r0, r6
	strb r0, [r4, #0x15]
	ldrb r0, [r1, #0xe]
	ldrb r6, [r3, #0xf]
	adds r0, r0, r6
	strb r0, [r4, #0x16]
	ldrb r0, [r1, #0xf]
	ldrb r6, [r3, #0x10]
	adds r0, r0, r6
	strb r0, [r4, #0x17]
	ldrb r0, [r1, #0x10]
	ldrb r1, [r3, #0x11]
	adds r0, r0, r1
	strb r0, [r4, #0x18]
	ldrb r0, [r3, #0x12]
	strb r0, [r4, #0x19]
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	cmp r2, r0
	ble _080180C4
	strb r2, [r4, #8]
	adds r0, r4, #0
	bl AutolevelUnit
	strb r5, [r4, #8]
_080180C4:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_80180CC
sub_80180CC: @ 0x080180CC
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	cmp r2, #0
	beq _0801811A
	ldr r1, [r4, #4]
	ldrb r0, [r1, #4]
	cmp r0, #0x62
	beq _0801811A
	cmp r0, #0x34
	beq _0801811A
	cmp r2, #0
	ble _080180F0
	adds r1, r0, #0
	adds r0, r4, #0
	bl IncreaseUnitStatsByLevelCount
	b _080180FE
_080180F0:
	cmp r2, #0
	bge _080180FE
	ldrb r1, [r1, #4]
	negs r2, r2
	adds r0, r4, #0
	bl StoreUnitStats
_080180FE:
	adds r0, r4, #0
	bl CheckForStatCaps
	adds r0, r4, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHPBonus
	movs r1, #0x12
	ldrsb r1, [r4, r1]
	adds r1, r1, r0
	strb r1, [r4, #0x13]
_0801811A:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START AutolevelUnit
AutolevelUnit: @ 0x08018120
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5]
	ldr r2, [r5, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r2, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #1
	ands r0, r1
	cmp r0, #0
	beq _08018148
	ldrb r4, [r2, #5]
	bl GetCurrentPromotedLevelBonus
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl IncreaseUnitStatsByLevelCount
_08018148:
	ldr r0, [r5, #4]
	ldrb r1, [r0, #4]
	movs r2, #8
	ldrsb r2, [r5, r2]
	subs r2, #1
	adds r0, r5, #0
	bl IncreaseUnitStatsByLevelCount
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START AutolevelRealistic
AutolevelRealistic: @ 0x08018160
	push {r4, r5, r6, lr}
	sub sp, #0x80
	adds r4, r0, #0
	mov r1, sp
	adds r1, #0x6e
	movs r0, #0
	strb r0, [r1]
	movs r0, #8
	ldrsb r0, [r4, r0]
	ldr r1, [r4]
	ldrb r1, [r1, #0xb]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	beq _080181BA
	ldrb r0, [r4, #8]
	subs r0, r0, r6
	strb r0, [r4, #8]
	cmp r1, #0
	ble _080181BA
	mov r5, sp
_08018192:
	mov r0, sp
	adds r1, r4, #0
	bl CopyUnitToBattleStruct
	ldrb r0, [r5, #9]
	adds r0, #0x64
	strb r0, [r5, #9]
	mov r0, sp
	bl CheckForLevelUp
	adds r0, r4, #0
	mov r1, sp
	bl SaveUnitFromBattle
	lsls r0, r6, #0x10
	ldr r1, _080181C4  @ 0xFFFF0000
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	cmp r0, #0
	bgt _08018192
_080181BA:
	add sp, #0x80
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080181C4: .4byte 0xFFFF0000

	THUMB_FUNC_START CheckForStatCaps
CheckForStatCaps: @ 0x080181C8
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	movs r2, #0x12
	ldrsb r2, [r4, r2]
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _080181E2
	cmp r2, #0x78
	bgt _080181E6
	b _080181F8
_080181E2:
	cmp r2, #0x3c
	ble _080181F8
_080181E6:
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	movs r1, #0xc0
	ands r0, r1
	movs r1, #0x3c
	cmp r0, #0x80
	bne _080181F6
	movs r1, #0x78
_080181F6:
	strb r1, [r4, #0x12]
_080181F8:
	ldr r7, [r4, #4]
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	ldrb r2, [r7, #0x14]
	movs r0, #0x14
	ldrsb r0, [r7, r0]
	adds r5, r7, #0
	cmp r1, r0
	ble _0801820C
	strb r2, [r4, #0x14]
_0801820C:
	movs r1, #0x15
	ldrsb r1, [r4, r1]
	ldrb r2, [r5, #0x15]
	movs r0, #0x15
	ldrsb r0, [r5, r0]
	cmp r1, r0
	ble _0801821C
	strb r2, [r4, #0x15]
_0801821C:
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	ldrb r2, [r5, #0x16]
	movs r0, #0x16
	ldrsb r0, [r5, r0]
	cmp r1, r0
	ble _0801822C
	strb r2, [r4, #0x16]
_0801822C:
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	ldrb r2, [r5, #0x17]
	movs r0, #0x17
	ldrsb r0, [r5, r0]
	cmp r1, r0
	ble _0801823C
	strb r2, [r4, #0x17]
_0801823C:
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	ldrb r2, [r5, #0x18]
	movs r0, #0x18
	ldrsb r0, [r5, r0]
	cmp r1, r0
	ble _0801824C
	strb r2, [r4, #0x18]
_0801824C:
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	cmp r0, #0x1e
	ble _08018258
	movs r0, #0x1e
	strb r0, [r4, #0x19]
_08018258:
	movs r3, #0x1a
	ldrsb r3, [r4, r3]
	movs r2, #0x19
	ldrsb r2, [r5, r2]
	movs r0, #0x11
	ldrsb r0, [r5, r0]
	ldr r6, [r4]
	movs r1, #0x13
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	subs r2, r2, r0
	cmp r3, r2
	ble _0801827E
	ldrb r1, [r6, #0x13]
	ldrb r0, [r5, #0x11]
	adds r1, r1, r0
	ldrb r0, [r5, #0x19]
	subs r0, r0, r1
	strb r0, [r4, #0x1a]
_0801827E:
	movs r2, #0x1d
	ldrsb r2, [r4, r2]
	movs r1, #0x12
	ldrsb r1, [r7, r1]
	movs r0, #0xf
	subs r0, r0, r1
	cmp r2, r0
	ble _08018296
	ldrb r1, [r7, #0x12]
	movs r0, #0xf
	subs r0, r0, r1
	strb r0, [r4, #0x1d]
_08018296:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	THUMB_FUNC_START GetUnitByCharId
GetUnitByCharId: @ 0x0801829C
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r2, #1
	ldr r5, _080182C4  @ gUnknown_0859A5D0
	movs r4, #0xff
_080182A6:
	adds r0, r2, #0
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _080182C8
	ldr r0, [r1]
	cmp r0, #0
	beq _080182C8
	ldrb r0, [r0, #4]
	cmp r0, r3
	bne _080182C8
	adds r0, r1, #0
	b _080182D0
	.align 2, 0
_080182C4: .4byte gUnknown_0859A5D0
_080182C8:
	adds r2, #1
	cmp r2, #0xff
	ble _080182A6
	movs r0, #0
_080182D0:
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetNonAllyUnitStructById
GetNonAllyUnitStructById: @ 0x080182D8
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r3, r1, #0
	adds r3, #0x40
	adds r1, #1
	cmp r1, r3
	bge _08018312
	ldr r6, _08018308  @ gUnknown_0859A5D0
	movs r5, #0xff
_080182EA:
	adds r0, r1, #0
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	cmp r2, #0
	beq _0801830C
	ldr r0, [r2]
	cmp r0, #0
	beq _0801830C
	ldrb r0, [r0, #4]
	cmp r0, r4
	bne _0801830C
	adds r0, r2, #0
	b _08018314
	.align 2, 0
_08018308: .4byte gUnknown_0859A5D0
_0801830C:
	adds r1, #1
	cmp r1, r3
	blt _080182EA
_08018312:
	movs r0, #0
_08018314:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START CanUnitRescue
CanUnitRescue: @ 0x0801831C
	push {r4, lr}
	adds r4, r1, #0
	bl GetUnitAid
	ldr r1, [r4, #4]
	movs r2, #0x11
	ldrsb r2, [r1, r2]
	ldr r1, [r4]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r2, r1
	movs r1, #0x1a
	ldrsb r1, [r4, r1]
	adds r2, r2, r1
	movs r1, #0
	cmp r0, r2
	blt _08018342
	movs r1, #1
_08018342:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START UnitRescue
UnitRescue: @ 0x0801834C
	ldr r2, [r0, #0xc]
	movs r3, #0x10
	orrs r2, r3
	str r2, [r0, #0xc]
	ldr r2, [r1, #0xc]
	movs r3, #0x21
	orrs r2, r3
	str r2, [r1, #0xc]
	ldrb r2, [r1, #0xb]
	strb r2, [r0, #0x1b]
	ldrb r2, [r0, #0xb]
	strb r2, [r1, #0x1b]
	ldrb r2, [r0, #0x10]
	strb r2, [r1, #0x10]
	ldrb r0, [r0, #0x11]
	strb r0, [r1, #0x11]
	bx lr

	THUMB_FUNC_START UpdateRescuingData
UpdateRescuingData: @ 0x08018370
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r1, _080183C0  @ gUnknown_0859A5D0
	ldrb r0, [r5, #0x1b]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	adds r4, r2, #0
	ldr r0, [r5, #0xc]
	movs r1, #0x31
	negs r1, r1
	ands r0, r1
	str r0, [r5, #0xc]
	ldr r3, [r2, #0xc]
	movs r0, #0x32
	negs r0, r0
	ands r3, r0
	str r3, [r2, #0xc]
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	ldr r1, _080183C4  @ gUnknown_0202BCF0
	ldrb r1, [r1, #0xf]
	cmp r0, r1
	bne _080183AE
	movs r0, #2
	orrs r3, r0
	str r3, [r2, #0xc]
_080183AE:
	movs r0, #0
	strb r0, [r5, #0x1b]
	strb r0, [r4, #0x1b]
	strb r6, [r4, #0x10]
	strb r7, [r4, #0x11]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080183C0: .4byte gUnknown_0859A5D0
_080183C4: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START UpdateRescueData
UpdateRescueData: @ 0x080183C8
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _080183F8  @ gUnknown_0859A5D0
	ldrb r0, [r5, #0x1b]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitRescue
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl UpdateRescuingData
	adds r0, r6, #0
	adds r1, r4, #0
	bl UnitRescue
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080183F8: .4byte gUnknown_0859A5D0

	THUMB_FUNC_START sub_80183FC
sub_80183FC: @ 0x080183FC
	push {lr}
	adds r2, r0, #0
	movs r1, #0xb
	ldrsb r1, [r2, r1]
	movs r0, #0xc0
	ands r1, r0
	cmp r1, #0
	bne _08018428
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	bne _08018418
	str r1, [r2]
	b _0801842C
_08018418:
	ldr r0, [r2, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r2, #0xc]
	adds r0, r2, #0
	bl sub_80283E0
	b _0801842C
_08018428:
	movs r0, #0
	str r0, [r2]
_0801842C:
	pop {r0}
	bx r0

	THUMB_FUNC_START HandleAllegianceChange
HandleAllegianceChange: @ 0x08018430
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r6, #0
	bl GetNextFreeUnitStructPtr
	adds r4, r0, #0
	ldr r1, _0801846C  @ gUnknown_03004E50
	ldr r0, [r1]
	cmp r0, r5
	bne _08018448
	str r4, [r1]
_08018448:
	adds r0, r5, #0
	adds r1, r4, #0
	bl CopyUnitStruct
	adds r0, r5, #0
	bl ClearUnitStruct
	ldrb r0, [r4, #9]
	cmp r0, #0xff
	bne _08018474
	cmp r6, #0
	bne _08018470
	movs r0, #8
	ldrsb r0, [r4, r0]
	cmp r0, #0x14
	beq _08018470
	strb r6, [r4, #9]
	b _08018474
	.align 2, 0
_0801846C: .4byte gUnknown_03004E50
_08018470:
	movs r0, #0xff
	strb r0, [r4, #9]
_08018474:
	ldr r0, [r4, #0xc]
	ldr r1, _08018494  @ 0xFFFFEFFF
	ands r0, r1
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0x1b]
	cmp r0, #0
	beq _0801848E
	ldr r1, _08018498  @ gUnknown_0859A5D0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #0xb]
	strb r0, [r1, #0x1b]
_0801848E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08018494: .4byte 0xFFFFEFFF
_08018498: .4byte gUnknown_0859A5D0

	THUMB_FUNC_START ApplyUnitMovement
ApplyUnitMovement: @ 0x0801849C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080184BC
	ldr r1, _080184DC  @ gUnknown_0859A5D0
	ldrb r0, [r4, #0x1b]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #0x10]
	strb r0, [r1, #0x10]
	ldrb r0, [r4, #0x11]
	strb r0, [r1, #0x11]
_080184BC:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080184D6
	ldrb r0, [r4, #0x1c]
	bl GetTrap
	ldrb r1, [r4, #0x10]
	strb r1, [r0]
	ldrb r1, [r4, #0x11]
	strb r1, [r0, #1]
_080184D6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080184DC: .4byte gUnknown_0859A5D0

	THUMB_FUNC_START sub_80184E0
sub_80184E0: @ 0x080184E0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	mov r8, r0
	str r1, [sp]
	str r2, [sp, #4]
	ldr r0, _080185E0  @ 0x0000270F
	str r0, [sp, #8]
	ldr r1, _080185E4  @ gUnknown_0859A5D0
	movs r4, #0xff
	mov r2, r8
	ldrb r0, [r2, #0x1b]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov sl, r0
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldr r2, _080185E8  @ gUnknown_0880BB96
	bl FillMovementMapSomehow
	ldr r0, _080185EC  @ gUnknown_03004E50
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r3, _080185F0  @ gUnknown_0202E4D8
	ldr r1, [r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r4, [r0]
	mov r1, r8
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	ldr r1, [r3]
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r2, r8
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, _080185F4  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _08018626
_08018554:
	ldr r0, _080185F4  @ gUnknown_0202E4D4
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	ldr r2, _080185F0  @ gUnknown_0202E4D8
	subs r0, r6, #1
	mov r9, r0
	cmp r5, #0
	blt _08018620
	lsls r7, r6, #2
_08018568:
	ldr r0, _080185F8  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801861A
	ldr r0, [r2]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801861A
	ldr r0, _080185FC  @ gUnknown_0202E4EC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0801861A
	ldr r0, _08018600  @ gUnknown_0202E4DC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r4, [r0]
	mov r0, sl
	bl GetMovCostTablePtr
	movs r1, #0
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080185BC
	movs r1, #1
_080185BC:
	ldr r2, _080185F0  @ gUnknown_0202E4D8
	cmp r1, #0
	beq _0801861A
	mov r1, r8
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	subs r2, r5, r0
	cmp r2, #0
	bge _080185D0
	subs r2, r0, r5
_080185D0:
	mov r1, r8
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	subs r1, r6, r0
	cmp r1, #0
	blt _08018604
	adds r0, r2, r1
	b _08018608
	.align 2, 0
_080185E0: .4byte 0x0000270F
_080185E4: .4byte gUnknown_0859A5D0
_080185E8: .4byte gUnknown_0880BB96
_080185EC: .4byte gUnknown_03004E50
_080185F0: .4byte gUnknown_0202E4D8
_080185F4: .4byte gUnknown_0202E4D4
_080185F8: .4byte gUnknown_0202E4E0
_080185FC: .4byte gUnknown_0202E4EC
_08018600: .4byte gUnknown_0202E4DC
_08018604:
	subs r0, r0, r6
	adds r0, r2, r0
_08018608:
	ldr r2, _08018654  @ gUnknown_0202E4D8
	ldr r1, [sp, #8]
	cmp r1, r0
	blt _0801861A
	str r0, [sp, #8]
	ldr r0, [sp]
	str r5, [r0]
	ldr r1, [sp, #4]
	str r6, [r1]
_0801861A:
	subs r5, #1
	cmp r5, #0
	bge _08018568
_08018620:
	mov r6, r9
	cmp r6, #0
	bge _08018554
_08018626:
	ldr r0, _08018658  @ gUnknown_03004E50
	ldr r2, [r0]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _08018654  @ gUnknown_0202E4D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018654: .4byte gUnknown_0202E4D8
_08018658: .4byte gUnknown_03004E50

	THUMB_FUNC_START SetupActiveUnit
SetupActiveUnit: @ 0x0801865C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _080186BC  @ gUnknown_03004E50
	str r4, [r6]
	ldr r0, _080186C0  @ gUnknown_0202BE44
	ldrb r2, [r4, #0xb]
	strb r2, [r0]
	ldr r1, _080186C4  @ gUnknown_0202BE48
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r5, #0
	strh r0, [r1]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	strh r0, [r1, #2]
	ldr r0, _080186C8  @ gUnknown_0203A958
	strb r2, [r0, #0xc]
	strb r5, [r0, #0x11]
	strb r5, [r0, #0x10]
	ldr r0, _080186CC  @ gUnknown_0202BCB0
	adds r1, r0, #0
	adds r1, #0x3d
	strb r5, [r1]
	adds r0, #0x3f
	movs r1, #0xff
	strb r1, [r0]
	bl NullSomeStuff
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _080186D0  @ gUnknown_0202E4D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080186BC: .4byte gUnknown_03004E50
_080186C0: .4byte gUnknown_0202BE44
_080186C4: .4byte gUnknown_0202BE48
_080186C8: .4byte gUnknown_0203A958
_080186CC: .4byte gUnknown_0202BCB0
_080186D0: .4byte gUnknown_0202E4D8

	THUMB_FUNC_START SetActiveUnit
SetActiveUnit: @ 0x080186D4
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r6, _08018728  @ gUnknown_03004E50
	str r4, [r6]
	ldr r1, _0801872C  @ gUnknown_0202BE44
	ldrb r0, [r4, #0xb]
	strb r0, [r1]
	ldr r1, _08018730  @ gUnknown_0202BE48
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r5, #0
	strh r0, [r1]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	strh r0, [r1, #2]
	ldr r0, _08018734  @ gUnknown_0203A958
	strb r5, [r0, #0x11]
	ldr r0, _08018738  @ gUnknown_0202BCB0
	adds r0, #0x3d
	strb r5, [r0]
	bl NullSomeStuff
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _0801873C  @ gUnknown_0202E4D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08018728: .4byte gUnknown_03004E50
_0801872C: .4byte gUnknown_0202BE44
_08018730: .4byte gUnknown_0202BE48
_08018734: .4byte gUnknown_0203A958
_08018738: .4byte gUnknown_0202BCB0
_0801873C: .4byte gUnknown_0202E4D8

	THUMB_FUNC_START MoveActiveUnit
MoveActiveUnit: @ 0x08018740
	push {r4, r5, r6, lr}
	ldr r6, _080187B8  @ gUnknown_03004E50
	ldr r2, [r6]
	strb r0, [r2, #0x10]
	ldr r0, [r6]
	strb r1, [r0, #0x11]
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #2
	orrs r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	ldr r1, _080187BC  @ gUnknown_0203A958
	ldrb r1, [r1, #0x10]
	bl BWL_AddTilesMoved
	ldr r5, [r6]
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHPBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _08018796
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHPBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	strb r1, [r5, #0x13]
_08018796:
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _080187AA
	ldr r0, [r6]
	ldr r1, [r0, #0xc]
	movs r2, #2
	negs r2, r2
	ands r1, r2
	str r1, [r0, #0xc]
_080187AA:
	ldr r0, [r6]
	bl ApplyUnitMovement
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080187B8: .4byte gUnknown_03004E50
_080187BC: .4byte gUnknown_0203A958

	THUMB_FUNC_START sub_80187C0
sub_80187C0: @ 0x080187C0
	push {r4, r5, r6, lr}
	ldr r0, _08018848  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xf]
	cmp r0, #0
	bne _0801880A
	movs r4, #1
	ldr r5, _0801884C  @ gUnknown_0859A5D0
_080187CE:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	cmp r2, #0
	beq _08018804
	ldr r3, [r2]
	cmp r3, #0
	beq _08018804
	ldr r0, [r2, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	bne _08018804
	ldr r0, [r2, #0xc]
	ldr r1, _08018850  @ 0x0001000E
	ands r0, r1
	cmp r0, #0
	bne _08018804
	ldrb r0, [r3, #4]
	bl StoreSomeUnitSetFlags
_08018804:
	adds r4, #1
	cmp r4, #0x3f
	ble _080187CE
_0801880A:
	ldr r1, _08018848  @ gUnknown_0202BCF0
	ldrb r0, [r1, #0xf]
	adds r2, r0, #1
	adds r0, #0x40
	cmp r2, r0
	bge _08018842
	ldr r6, _0801884C  @ gUnknown_0859A5D0
	movs r5, #0xff
	ldr r4, _08018854  @ 0xFFFFFBBD
	adds r3, r1, #0
_0801881E:
	adds r0, r2, #0
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r0]
	cmp r1, #0
	beq _08018838
	ldr r0, [r1]
	cmp r0, #0
	beq _08018838
	ldr r0, [r1, #0xc]
	ands r0, r4
	str r0, [r1, #0xc]
_08018838:
	adds r2, #1
	ldrb r0, [r3, #0xf]
	adds r0, #0x40
	cmp r2, r0
	blt _0801881E
_08018842:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08018848: .4byte gUnknown_0202BCF0
_0801884C: .4byte gUnknown_0859A5D0
_08018850: .4byte 0x0001000E
_08018854: .4byte 0xFFFFFBBD

	THUMB_FUNC_START sub_8018858
sub_8018858: @ 0x08018858
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	movs r0, #0
	mov r8, r0
	movs r1, #0
	bl InitTargets
	ldr r0, _08018874  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xf]
	adds r6, r0, #1
	b _08018922
	.align 2, 0
_08018874: .4byte gUnknown_0202BCF0
_08018878:
	ldr r1, _08018950  @ gUnknown_0859A5D0
	movs r0, #0xff
	ands r0, r6
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r4, [r0]
	adds r5, r4, #0
	cmp r4, #0
	beq _0801891C
	ldr r0, [r4]
	cmp r0, #0
	beq _0801891C
	ldr r0, [r4, #0xc]
	ldr r1, _08018954  @ 0x0001002C
	ands r0, r1
	cmp r0, #0
	bne _0801891C
	adds r3, r4, #0
	adds r3, #0x31
	ldrb r2, [r3]
	movs r7, #0xf0
	mov ip, r7
	mov r0, ip
	ands r0, r2
	cmp r0, #0
	beq _080188BA
	lsrs r1, r2, #4
	subs r1, #1
	lsls r1, r1, #4
	movs r0, #0xf
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
_080188BA:
	ldrb r2, [r3]
	movs r1, #0xf
	movs r0, #0xf
	mov r9, r0
	ands r0, r2
	cmp r0, #0
	beq _080188E0
	lsls r0, r2, #0x1c
	lsrs r0, r0, #0x1c
	subs r0, #1
	ands r0, r1
	movs r7, #0x10
	negs r7, r7
	adds r1, r7, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r3]
	movs r0, #1
	mov r8, r0
_080188E0:
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r3, [r1]
	mov r0, ip
	ands r0, r3
	cmp r0, #0
	beq _0801891C
	mov r2, r9
	ands r2, r3
	cmp r2, #0xa
	beq _08018900
	lsrs r0, r3, #4
	subs r0, #1
	lsls r0, r0, #4
	orrs r0, r2
	strb r0, [r1]
_08018900:
	ldrb r1, [r1]
	mov r0, ip
	ands r0, r1
	cmp r0, #0
	bne _0801891C
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl AddTarget
_0801891C:
	adds r6, #1
	ldr r0, _08018958  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xf]
_08018922:
	adds r0, #0x40
	cmp r6, r0
	blt _08018878
	mov r7, r8
	cmp r7, #0
	beq _08018944
	bl sub_8019CBC
	bl RefreshFogAndUnitMaps
	bl UpdateGameTilesGraphics
	movs r0, #1
	bl NewBMXFADE
	bl SMS_UpdateFromGameData
_08018944:
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018950: .4byte gUnknown_0859A5D0
_08018954: .4byte 0x0001002C
_08018958: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START SetAllUnitNotBackSprite
SetAllUnitNotBackSprite: @ 0x0801895C
	push {r4, r5, lr}
	movs r2, #1
	ldr r5, _0801898C  @ gUnknown_0859A5D0
	movs r4, #0xff
	ldr r3, _08018990  @ 0xFFFFFEFF
_08018966:
	adds r0, r2, #0
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _08018980
	ldr r0, [r1]
	cmp r0, #0
	beq _08018980
	ldr r0, [r1, #0xc]
	ands r0, r3
	str r0, [r1, #0xc]
_08018980:
	adds r2, #1
	cmp r2, #0xbf
	ble _08018966
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801898C: .4byte gUnknown_0859A5D0
_08018990: .4byte 0xFFFFFEFF

	THUMB_FUNC_START ValidateUnitItem
ValidateUnitItem: @ 0x08018994
	push {r4, r5, lr}
	adds r5, r0, #0
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r4, r0, r1
	ldrh r0, [r4]
	cmp r0, #0
	beq _080189B0
	bl ValidateItem
	strh r0, [r4]
	adds r0, r5, #0
	bl RemoveUnitBlankItems
_080189B0:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START GetUnitAid
GetUnitAid: @ 0x080189B8
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r3, #0x28]
	ldr r0, [r2, #0x28]
	orrs r1, r0
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080189E2
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	movs r1, #0x13
	ldrsb r1, [r3, r1]
	adds r0, r0, r1
	movs r1, #0x1a
	ldrsb r1, [r4, r1]
	adds r0, r0, r1
	subs r0, #1
	b _08018A14
_080189E2:
	movs r0, #0x80
	lsls r0, r0, #7
	ands r1, r0
	cmp r1, #0
	bne _08018A00
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r0, #0x13
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r1, r1, r0
	movs r0, #0x19
	b _08018A12
_08018A00:
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r0, #0x13
	ldrsb r0, [r3, r0]
	adds r1, r1, r0
	movs r0, #0x1a
	ldrsb r0, [r4, r0]
	adds r1, r1, r0
	movs r0, #0x14
_08018A12:
	subs r0, r0, r1
_08018A14:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitMagBy2Range
GetUnitMagBy2Range: @ 0x08018A1C
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	cmp r0, #0xbe
	bne _08018A30
	movs r0, #0xa6
	bl GetItemMaxRange
	b _08018A50
_08018A30:
	adds r0, r4, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemPowBonus
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	adds r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r0, r1, #1
	cmp r0, #4
	bgt _08018A50
	movs r0, #5
_08018A50:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START UnitHasMagicRank
UnitHasMagicRank: @ 0x08018A58
	adds r2, r0, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	adds r0, #1
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r2, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	orrs r1, r0
	adds r0, r2, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	orrs r1, r0
	negs r0, r1
	orrs r0, r1
	lsrs r0, r0, #0x1f
	bx lr

	THUMB_FUNC_START sub_8018A7C
sub_8018A7C: @ 0x08018A7C
	push {r4, lr}
	adds r4, r0, #0
	ldr r3, [r4, #0xc]
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	bne _08018A96
	movs r0, #0xa
	negs r0, r0
	ands r3, r0
	str r3, [r4, #0xc]
	strb r1, [r4, #0x10]
	strb r2, [r4, #0x11]
_08018A96:
	pop {r4}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8018A9C
sub_8018A9C: @ 0x08018A9C
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r6, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08018AC2
	adds r0, r4, #0
	movs r1, #0x6b
	bl GetUnitItemSlot
	cmp r0, #0
	bge _08018AEA
_08018AC2:
	cmp r5, #0x1e
	beq _08018AE0
	cmp r5, #0x21
	bne _08018AE2
	adds r0, r4, #0
	movs r1, #0x69
	bl GetUnitItemSlot
	cmp r0, #0
	bge _08018AEA
	adds r0, r4, #0
	movs r1, #0x79
	bl GetUnitItemSlot
	b _08018AEA
_08018AE0:
	movs r6, #0x6a
_08018AE2:
	adds r0, r4, #0
	adds r1, r6, #0
	bl GetUnitItemSlot
_08018AEA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8018AF0
sub_8018AF0: @ 0x08018AF0
	push {lr}
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #3
	ands r0, r1
	cmp r0, #0
	beq _08018B02
	movs r0, #0x81
	b _08018B22
_08018B02:
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	cmp r0, #0
	beq _08018B10
	movs r0, #0x82
	b _08018B22
_08018B10:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08018B20
	movs r0, #1
	negs r0, r0
	b _08018B22
_08018B20:
	movs r0, #0x83
_08018B22:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitUseFlags
GetUnitUseFlags: @ 0x08018B28
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r6, #0
	movs r7, #0
	ldrh r4, [r5, #0x1e]
	cmp r4, #0
	beq _08018B92
	movs r0, #1
	mov r8, r0
_08018B3E:
	adds r0, r4, #0
	bl GetItemAttributes
	mov r1, r8
	ands r0, r1
	cmp r0, #0
	beq _08018B5E
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseAsWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08018B5E
	mov r0, r8
	orrs r6, r0
_08018B5E:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _08018B7E
	adds r0, r5, #0
	adds r1, r4, #0
	bl CanUnitUseAsStaff
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08018B7E
	movs r0, #2
	orrs r6, r0
_08018B7E:
	adds r7, #1
	cmp r7, #4
	bgt _08018B92
	lsls r1, r7, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _08018B3E
_08018B92:
	adds r0, r6, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8018BA0
sub_8018BA0: @ 0x08018BA0
	push {r4, r5, r6, lr}
	movs r5, #0
	movs r4, #0x81
	ldr r6, _08018BD4  @ gUnknown_0859A5D0
_08018BA8:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r0]
	cmp r1, #0
	beq _08018BC4
	ldr r0, [r1]
	cmp r0, #0
	beq _08018BC4
	adds r0, r1, #0
	bl GetUnitUseFlags
	orrs r5, r0
_08018BC4:
	adds r4, #1
	cmp r4, #0xbf
	ble _08018BA8
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08018BD4: .4byte gUnknown_0859A5D0

	THUMB_FUNC_START CanUnitMove
CanUnitMove: @ 0x08018BD8
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	ldr r1, _08018C68  @ gUnknown_080D7A64
	mov r0, sp
	movs r2, #8
	bl memcpy
	ldr r0, _08018C6C  @ gUnknown_03004E50
	ldr r2, [r0]
	movs r1, #0x1d
	ldrsb r1, [r2, r1]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, _08018C70  @ gUnknown_0203A958
	ldrb r0, [r0, #0x10]
	subs r1, r1, r0
	mov sl, r1
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	mov r9, r0
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r8, r2
	movs r7, #0
	mov r4, sp
_08018C1A:
	movs r0, #0
	ldrsb r0, [r4, r0]
	mov r1, r9
	adds r6, r1, r0
	movs r1, #1
	ldrsb r1, [r4, r1]
	add r1, r8
	ldr r0, _08018C74  @ gUnknown_0202E4D8
	ldr r0, [r0]
	lsls r5, r1, #2
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08018C7C
	ldr r0, _08018C6C  @ gUnknown_03004E50
	ldr r0, [r0]
	bl GetMovCostTablePtr
	ldr r1, _08018C78  @ gUnknown_0202E4DC
	ldr r1, [r1]
	adds r1, r5, r1
	ldr r1, [r1]
	adds r1, r1, r6
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _08018C7C
	cmp r0, sl
	bgt _08018C7C
	movs r0, #1
	b _08018C86
	.align 2, 0
_08018C68: .4byte gUnknown_080D7A64
_08018C6C: .4byte gUnknown_03004E50
_08018C70: .4byte gUnknown_0203A958
_08018C74: .4byte gUnknown_0202E4D8
_08018C78: .4byte gUnknown_0202E4DC
_08018C7C:
	adds r4, #2
	adds r7, #1
	cmp r7, #3
	ble _08018C1A
	movs r0, #0
_08018C86:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START IsPosMagicSealed
IsPosMagicSealed: @ 0x08018C98
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r3, #0x81
	ldr r6, _08018CE8  @ gUnknown_0859A5D0
_08018CA2:
	movs r0, #0xff
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r2, [r0]
	cmp r2, #0
	beq _08018CF8
	ldr r1, [r2]
	cmp r1, #0
	beq _08018CF8
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _08018CF8
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	subs r1, r0, r5
	cmp r1, #0
	bge _08018CD4
	subs r1, r5, r0
_08018CD4:
	ldrb r2, [r2, #0x11]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	subs r0, r2, r4
	cmp r0, #0
	blt _08018CEC
	adds r0, r1, r0
	cmp r0, #0xa
	ble _08018CF4
	b _08018CF8
	.align 2, 0
_08018CE8: .4byte gUnknown_0859A5D0
_08018CEC:
	subs r0, r4, r2
	adds r0, r1, r0
	cmp r0, #0xa
	bgt _08018CF8
_08018CF4:
	movs r0, #1
	b _08018D00
_08018CF8:
	adds r3, #1
	cmp r3, #0xbf
	ble _08018CA2
	movs r0, #0
_08018D00:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

	THUMB_FUNC_START CanUnitNotUseMagic
CanUnitNotUseMagic: @ 0x08018D08
	push {lr}
	adds r2, r0, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #3
	beq _08018D2E
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl IsPosMagicSealed
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08018D2E
	movs r0, #0
	b _08018D30
_08018D2E:
	movs r0, #1
_08018D30:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitLastItem
GetUnitLastItem: @ 0x08018D34
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitItemCount
	subs r0, #1
	lsls r0, r0, #1
	adds r4, #0x1e
	adds r4, r4, r0
	ldrh r0, [r4]
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetMovCostTablePtr
GetMovCostTablePtr: @ 0x08018D4C
	push {lr}
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _08018D64
	ldr r0, _08018D60  @ gUnknown_0880BC18
	b _08018D8A
	.align 2, 0
_08018D60: .4byte gUnknown_0880BC18
_08018D64:
	ldr r0, _08018D7C  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0x15]
	cmp r0, #1
	blt _08018D86
	cmp r0, #2
	ble _08018D80
	cmp r0, #4
	bne _08018D86
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x3c]
	b _08018D8A
	.align 2, 0
_08018D7C: .4byte gUnknown_0202BCF0
_08018D80:
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x40]
	b _08018D8A
_08018D86:
	ldr r0, [r2, #4]
	ldr r0, [r0, #0x38]
_08018D8A:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetClassStandingMapSpriteId
GetClassStandingMapSpriteId: @ 0x08018D90
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	bgt _08018D9C
	movs r0, #0
	b _08018DA4
_08018D9C:
	movs r0, #0x54
	muls r1, r0, r1
	ldr r0, _08018DAC  @ gUnknown_08807110
	adds r0, r1, r0
_08018DA4:
	ldrb r0, [r0, #6]
	pop {r1}
	bx r1
	.align 2, 0
_08018DAC: .4byte gUnknown_08807110

	THUMB_FUNC_START UpdatePrevDeployStates
UpdatePrevDeployStates: @ 0x08018DB0
	push {r4, r5, lr}
	movs r3, #1
	ldr r5, _08018DE0  @ gUnknown_0202BCF0
	ldr r4, _08018DE4  @ gUnknown_0859A5D0
_08018DB8:
	movs r0, #0xff
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	cmp r2, #0
	beq _08018E0E
	ldr r0, [r2]
	cmp r0, #0
	beq _08018E0E
	ldr r1, [r2, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08018DE8
	movs r0, #0x80
	lsls r0, r0, #0xe
	orrs r1, r0
	b _08018DEC
	.align 2, 0
_08018DE0: .4byte gUnknown_0202BCF0
_08018DE4: .4byte gUnknown_0859A5D0
_08018DE8:
	ldr r0, _08018E04  @ 0xFFDFFFFF
	ands r1, r0
_08018DEC:
	str r1, [r2, #0xc]
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _08018E08
	movs r0, #0x80
	lsls r0, r0, #0x13
	orrs r1, r0
	b _08018E0C
	.align 2, 0
_08018E04: .4byte 0xFFDFFFFF
_08018E08:
	ldr r0, _08018E2C  @ 0xFBFFFFFF
	ands r1, r0
_08018E0C:
	str r1, [r2, #0xc]
_08018E0E:
	adds r3, #1
	cmp r3, #0x3f
	ble _08018DB8
	ldrb r1, [r5, #0x14]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08018E22
	bl StoreUnitWordStructs
_08018E22:
	bl ResetAllPlayerUnitState
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018E2C: .4byte 0xFBFFFFFF

	THUMB_FUNC_START LoadUnitPrepScreenPositions
LoadUnitPrepScreenPositions: @ 0x08018E30
	push {r4, lr}
	bl ResetAllPlayerUnitState
	bl ClearCutsceneUnits
	movs r3, #1
	ldr r4, _08018E64  @ gUnknown_0859A5D0
_08018E3E:
	movs r0, #0xff
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	cmp r2, #0
	beq _08018E92
	ldr r0, [r2]
	cmp r0, #0
	beq _08018E92
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r1
	cmp r0, #0
	beq _08018E68
	movs r0, #8
	orrs r1, r0
	b _08018E6E
	.align 2, 0
_08018E64: .4byte gUnknown_0859A5D0
_08018E68:
	movs r0, #9
	negs r0, r0
	ands r1, r0
_08018E6E:
	str r1, [r2, #0xc]
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r0, r1
	cmp r0, #0
	beq _08018E84
	movs r0, #0x80
	lsls r0, r0, #9
	orrs r1, r0
	b _08018E88
_08018E84:
	ldr r0, _08018EB0  @ 0xFFFEFFFF
	ands r1, r0
_08018E88:
	str r1, [r2, #0xc]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
_08018E92:
	adds r3, #1
	cmp r3, #0x3f
	ble _08018E3E
	ldr r0, _08018EB4  @ gUnknown_0202BCF0
	ldrb r1, [r0, #0x14]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08018EA8
	bl LoadUnitWordStructs
_08018EA8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018EB0: .4byte 0xFFFEFFFF
_08018EB4: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_8018EB8
sub_8018EB8: @ 0x08018EB8
	push {r4, r5, lr}
	movs r4, #1
	ldr r5, _08018F44  @ gUnknown_0859A5D0
_08018EBE:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	cmp r2, #0
	beq _08018EE8
	ldr r0, [r2]
	cmp r0, #0
	beq _08018EE8
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	bne _08018EE8
	adds r0, r2, #0
	bl ClearUnitStruct
_08018EE8:
	adds r4, #1
	cmp r4, #0x3f
	ble _08018EBE
	movs r4, #0x81
	ldr r5, _08018F44  @ gUnknown_0859A5D0
_08018EF2:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _08018F0C
	ldr r0, [r1]
	cmp r0, #0
	beq _08018F0C
	adds r0, r1, #0
	bl ClearUnitStruct
_08018F0C:
	adds r4, #1
	cmp r4, #0xbf
	ble _08018EF2
	movs r4, #0x41
	ldr r5, _08018F44  @ gUnknown_0859A5D0
_08018F16:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _08018F30
	ldr r0, [r1]
	cmp r0, #0
	beq _08018F30
	adds r0, r1, #0
	bl ClearUnitStruct
_08018F30:
	adds r4, #1
	cmp r4, #0x7f
	ble _08018F16
	bl RefreshFogAndUnitMaps
	bl SMS_UpdateFromGameData
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018F44: .4byte gUnknown_0859A5D0

	THUMB_FUNC_START IsUnitSlotAvailable
IsUnitSlotAvailable: @ 0x08018F48
	push {r4, lr}
	adds r1, r0, #1
	adds r0, #0x40
	cmp r1, r0
	bge _08018F76
	ldr r4, _08018F6C  @ gUnknown_0859A5D0
	movs r3, #0xff
	adds r2, r0, #0
_08018F58:
	adds r0, r1, #0
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r0, [r0]
	cmp r0, #0
	bne _08018F70
	movs r0, #1
	b _08018F78
	.align 2, 0
_08018F6C: .4byte gUnknown_0859A5D0
_08018F70:
	adds r1, #1
	cmp r1, r2
	blt _08018F58
_08018F76:
	movs r0, #0
_08018F78:
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8018F80
sub_8018F80: @ 0x08018F80
	push {r4, r5, r6, r7, lr}
	movs r3, #1
	ldr r7, _08018FBC  @ gUnknown_0859A5D0
	movs r6, #0xff
	movs r5, #4
	movs r4, #1
_08018F8C:
	adds r0, r3, #0
	ands r0, r6
	lsls r0, r0, #2
	adds r0, r0, r7
	ldr r2, [r0]
	cmp r2, #0
	beq _08018FAE
	ldr r0, [r2]
	cmp r0, #0
	beq _08018FAE
	ldr r1, [r2, #0xc]
	adds r0, r1, #0
	ands r0, r5
	cmp r0, #0
	bne _08018FAE
	orrs r1, r4
	str r1, [r2, #0xc]
_08018FAE:
	adds r3, #1
	cmp r3, #0x3f
	ble _08018F8C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08018FBC: .4byte gUnknown_0859A5D0

	THUMB_FUNC_START sub_8018FC0
sub_8018FC0: @ 0x08018FC0
	push {r4, r5, lr}
	movs r4, #0x41
	ldr r5, _08018FEC  @ gUnknown_0859A5D0
_08018FC6:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	cmp r1, #0
	beq _08018FE0
	ldr r0, [r1]
	cmp r0, #0
	beq _08018FE0
	adds r0, r1, #0
	bl ClearUnitStruct
_08018FE0:
	adds r4, #1
	cmp r4, #0xbf
	ble _08018FC6
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018FEC: .4byte gUnknown_0859A5D0

	THUMB_FUNC_START sub_8018FF0
sub_8018FF0: @ 0x08018FF0
	push {r4, r5, r6, lr}
	movs r3, #0
	movs r2, #1
	ldr r6, _0801902C  @ gUnknown_0859A5D0
	movs r5, #0xff
	ldr r4, _08019030  @ 0x0001000C
_08018FFC:
	adds r0, r2, #0
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r0]
	cmp r1, #0
	beq _0801901E
	ldr r0, [r1]
	cmp r0, #0
	beq _0801901E
	ldr r0, [r1, #0xc]
	ands r0, r4
	cmp r0, #0
	bne _0801901E
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0801901E:
	adds r2, #1
	cmp r2, #0x3f
	ble _08018FFC
	adds r0, r3, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0801902C: .4byte gUnknown_0859A5D0
_08019030: .4byte 0x0001000C

	THUMB_FUNC_START sub_8019034
sub_8019034: @ 0x08019034
	push {r4, r5, r6, lr}
	movs r3, #0
	movs r2, #0x81
	ldr r6, _08019070  @ gUnknown_0859A5D0
	movs r5, #0xff
	movs r4, #4
_08019040:
	adds r0, r2, #0
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r0]
	cmp r1, #0
	beq _08019062
	ldr r0, [r1]
	cmp r0, #0
	beq _08019062
	ldr r0, [r1, #0xc]
	ands r0, r4
	cmp r0, #0
	bne _08019062
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08019062:
	adds r2, #1
	cmp r2, #0xbf
	ble _08019040
	adds r0, r3, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08019070: .4byte gUnknown_0859A5D0

	THUMB_FUNC_START sub_8019074
sub_8019074: @ 0x08019074
	push {r4, r5, r6, lr}
	movs r3, #0
	movs r2, #0x41
	ldr r6, _080190B0  @ gUnknown_0859A5D0
	movs r5, #0xff
	movs r4, #4
_08019080:
	adds r0, r2, #0
	ands r0, r5
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r1, [r0]
	cmp r1, #0
	beq _080190A2
	ldr r0, [r1]
	cmp r0, #0
	beq _080190A2
	ldr r0, [r1, #0xc]
	ands r0, r4
	cmp r0, #0
	bne _080190A2
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_080190A2:
	adds r2, #1
	cmp r2, #0x7f
	ble _08019080
	adds r0, r3, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080190B0: .4byte gUnknown_0859A5D0

	THUMB_FUNC_START ClearCutsceneUnits
ClearCutsceneUnits: @ 0x080190B4
	push {r4, r5, lr}
	movs r4, #1
	ldr r5, _080190EC  @ gUnknown_0859A5D0
_080190BA:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	adds r3, r2, #0
	cmp r2, #0
	beq _080190FA
	ldr r0, [r2]
	cmp r0, #0
	beq _080190FA
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _080190FA
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080190F4
	ldr r0, _080190F0  @ 0xFFBFFFFF
	ands r1, r0
	str r1, [r2, #0xc]
	b _080190FA
	.align 2, 0
_080190EC: .4byte gUnknown_0859A5D0
_080190F0: .4byte 0xFFBFFFFF
_080190F4:
	adds r0, r3, #0
	bl ClearUnitStruct
_080190FA:
	adds r4, #1
	cmp r4, #0x3f
	ble _080190BA
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START sub_8019108
sub_8019108: @ 0x08019108
	push {r4, r5, lr}
	movs r4, #1
	ldr r5, _0801914C  @ gUnknown_0859A5D0
_0801910E:
	movs r0, #0xff
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r2, [r0]
	cmp r2, #0
	beq _08019138
	ldr r0, [r2]
	cmp r0, #0
	beq _08019138
	ldr r0, [r2, #0xc]
	movs r1, #0x33
	negs r1, r1
	ands r0, r1
	str r0, [r2, #0xc]
	movs r0, #0
	strb r0, [r2, #0x1b]
	adds r0, r2, #0
	movs r1, #0
	bl SetUnitNewStatus
_08019138:
	adds r4, #1
	cmp r4, #0x3f
	ble _0801910E
	bl RefreshFogAndUnitMaps
	bl SMS_UpdateFromGameData
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801914C: .4byte gUnknown_0859A5D0

	THUMB_FUNC_START GetUnitCurrentHP
GetUnitCurrentHP: @ 0x08019150
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHPBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _08019184
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHPBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	strb r1, [r5, #0x13]
_08019184:
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	pop {r4, r5}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitMaxHP
GetUnitMaxHP: @ 0x08019190
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHPBonus
	adds r1, r0, #0
	movs r0, #0x12
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitPower
GetUnitPower: @ 0x080191B0
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemPowBonus
	adds r1, r0, #0
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitSkill
GetUnitSkill: @ 0x080191D0
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _080191F4
	adds r0, r2, #0
	bl GetItemSklBonus
	adds r1, r0, #0
	movs r0, #0x15
	ldrsb r0, [r4, r0]
	b _08019206
_080191F4:
	adds r0, r2, #0
	bl GetItemSklBonus
	adds r1, r0, #0
	movs r0, #0x15
	ldrsb r0, [r4, r0]
	lsrs r2, r0, #0x1f
	adds r0, r0, r2
	asrs r0, r0, #1
_08019206:
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitSpeed
GetUnitSpeed: @ 0x08019210
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08019234
	adds r0, r2, #0
	bl GetItemSpdBonus
	adds r1, r0, #0
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	b _08019246
_08019234:
	adds r0, r2, #0
	bl GetItemSpdBonus
	adds r1, r0, #0
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	lsrs r2, r0, #0x1f
	adds r0, r0, r2
	asrs r0, r0, #1
_08019246:
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitDefense
GetUnitDefense: @ 0x08019250
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemDefBonus
	adds r1, r0, #0
	movs r0, #0x17
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitResistance
GetUnitResistance: @ 0x08019270
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemResBonus
	adds r1, r0, #0
	movs r0, #0x18
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	adds r4, #0x31
	ldrb r1, [r4]
	lsrs r1, r1, #4
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitLuck
GetUnitLuck: @ 0x08019298
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemLckBonus
	adds r1, r0, #0
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitPortraitId
GetUnitPortraitId: @ 0x080192B8
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1]
	ldrh r2, [r0, #6]
	cmp r2, #0
	beq _080192E2
	ldr r0, _080192D8  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x22
	bne _080192DC
	cmp r2, #0x4a
	bne _080192DC
	movs r0, #0x46
	b _080192F0
	.align 2, 0
_080192D8: .4byte gUnknown_0202BCF0
_080192DC:
	ldr r0, [r1]
	ldrh r0, [r0, #6]
	b _080192F0
_080192E2:
	ldr r1, [r1, #4]
	ldrh r0, [r1, #8]
	cmp r0, #0
	bne _080192EE
	movs r0, #0
	b _080192F0
_080192EE:
	ldrh r0, [r1, #8]
_080192F0:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitMiniPortraitId
GetUnitMiniPortraitId: @ 0x080192F4
	push {lr}
	adds r2, r0, #0
	ldr r1, [r2]
	ldrb r0, [r1, #8]
	cmp r0, #0
	beq _08019308
	movs r1, #0xfe
	lsls r1, r1, #7
	adds r0, r0, r1
	b _0801933C
_08019308:
	ldrh r1, [r1, #6]
	cmp r1, #0
	beq _0801932E
	ldr r0, _08019324  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x22
	bne _08019328
	cmp r1, #0x4a
	bne _08019328
	movs r1, #0x46
	b _0801933A
	.align 2, 0
_08019324: .4byte gUnknown_0202BCF0
_08019328:
	ldr r0, [r2]
	ldrh r1, [r0, #6]
	b _0801933A
_0801932E:
	ldr r2, [r2, #4]
	ldrh r0, [r2, #8]
	movs r1, #0
	cmp r0, #0
	beq _0801933A
	adds r1, r0, #0
_0801933A:
	adds r0, r1, #0
_0801933C:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetUnitLeader
GetUnitLeader: @ 0x08019340
	push {lr}
	adds r2, r0, #0
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _08019358
	adds r0, r2, #0
	adds r0, #0x38
	ldrb r0, [r0]
	b _0801935A
_08019358:
	movs r0, #0
_0801935A:
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_8019360
sub_8019360: @ 0x08019360
	adds r0, #0x38
	strb r1, [r0]
	bx lr

	THUMB_FUNC_START SetUnitHP
SetUnitHP: @ 0x08019368
	push {r4, r5, lr}
	adds r5, r0, #0
	strb r1, [r5, #0x13]
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHPBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _0801939E
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHPBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	strb r1, [r5, #0x13]
_0801939E:
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START UnitTryHeal
UnitTryHeal: @ 0x080193A4
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	adds r4, r4, r1
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHPBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _080193D8
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHPBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r4, r1, r0
_080193D8:
	cmp r4, #0
	bge _080193DE
	movs r4, #0
_080193DE:
	strb r4, [r5, #0x13]
	pop {r4, r5}
	pop {r0}
	bx r0

	THUMB_FUNC_START GetRescuingUnitNameId
GetRescuingUnitNameId: @ 0x080193E8
	push {lr}
	adds r2, r0, #0
	ldrb r0, [r2, #0x1b]
	cmp r0, #0
	beq _08019404
	ldr r1, _08019400  @ gUnknown_0859A5D0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	b _08019408
	.align 2, 0
_08019400: .4byte gUnknown_0859A5D0
_08019404:
	ldr r0, _08019410  @ gUnknown_0859A598
	ldr r0, [r0]
_08019408:
	bl GetStringFromIndex
	pop {r1}
	bx r1
	.align 2, 0
_08019410: .4byte gUnknown_0859A598

	THUMB_FUNC_START WriteStatusTextToRAM
WriteStatusTextToRAM: @ 0x08019414
	push {lr}
	ldr r1, _0801942C  @ gUnknown_0859A598
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1a
	adds r0, r0, r1
	ldr r0, [r0]
	bl GetStringFromIndex
	pop {r1}
	bx r1
	.align 2, 0
_0801942C: .4byte gUnknown_0859A598

	THUMB_FUNC_START GetUnitStruct
GetUnitStruct: @ 0x08019430
	ldr r2, _08019440  @ gUnknown_0859A5D0
	movs r1, #0xff
	ands r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08019440: .4byte gUnknown_0859A5D0

	THUMB_FUNC_START GetROMClassStruct
GetROMClassStruct: @ 0x08019444
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	ble _0801945C
	movs r0, #0x54
	muls r0, r1, r0
	ldr r1, _08019458  @ gUnknown_08807110
	adds r0, r0, r1
	b _0801945E
	.align 2, 0
_08019458: .4byte gUnknown_08807110
_0801945C:
	movs r0, #0
_0801945E:
	pop {r1}
	bx r1

	THUMB_FUNC_START GetROMCharStruct
GetROMCharStruct: @ 0x08019464
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	ble _0801947C
	movs r0, #0x34
	muls r0, r1, r0
	ldr r1, _08019478  @ gUnknown_08803D30
	adds r0, r0, r1
	b _0801947E
	.align 2, 0
_08019478: .4byte gUnknown_08803D30
_0801947C:
	movs r0, #0
_0801947E:
	pop {r1}
	bx r1

	THUMB_FUNC_START UnitRemoveItem
UnitRemoveItem: @ 0x08019484
	push {lr}
	lsls r1, r1, #1
	adds r2, r0, #0
	adds r2, #0x1e
	adds r2, r2, r1
	movs r1, #0
	strh r1, [r2]
	bl RemoveUnitBlankItems
	pop {r0}
	bx r0

	THUMB_FUNC_START CanUnitCrossTerrain
CanUnitCrossTerrain: @ 0x0801949C
	push {r4, lr}
	adds r4, r1, #0
	bl GetMovCostTablePtr
	movs r1, #0
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080194B4
	movs r1, #1
_080194B4:
	adds r0, r1, #0
	pop {r4}
	pop {r1}
	bx r1

	.align 2, 0 @ Don't pad with nop.
