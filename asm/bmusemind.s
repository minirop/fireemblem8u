	.INCLUDE "macro.inc"

	.SYNTAX UNIFIED

	@ Staff/Item Effect Handlers and whatnot

	THUMB_FUNC_START ExecStandardHeal
ExecStandardHeal: @ 0x0802EB98
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802EC14  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	bl sub_802CBC8
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl GetItemHealAmount
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	adds r1, r5, #0
	bl UnitTryHeal
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	bl GetUnitCurrentHP
	ldr r1, _0802EC18  @ gUnknown_0203A608
	ldr r2, [r1]
	ldr r5, _0802EC1C  @ gUnknown_0203A56C
	ldrb r1, [r5, #0x13]
	subs r1, r1, r0
	strb r1, [r2, #3]
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	bl GetUnitCurrentHP
	strb r0, [r5, #0x13]
	adds r0, r6, #0
	bl sub_802CC54
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802EC14: .4byte gUnknown_0203A958
_0802EC18: .4byte gUnknown_0203A608
_0802EC1C: .4byte gUnknown_0203A56C

	THUMB_FUNC_START ExecRestore
ExecRestore: @ 0x0802EC20
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802EC84  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	bl sub_802CBC8
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xb
	bne _0802EC68
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	movs r1, #0
	bl SetUnitNewStatus
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	ldr r1, [r0, #0xc]
	ldr r2, _0802EC88  @ 0xFFFFFBBD
	ands r1, r2
	str r1, [r0, #0xc]
_0802EC68:
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	movs r1, #0
	bl SetUnitNewStatus
	adds r0, r5, #0
	bl sub_802CC54
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802EC84: .4byte gUnknown_0203A958
_0802EC88: .4byte 0xFFFFFBBD

	THUMB_FUNC_START sub_802EC8C
sub_802EC8C: @ 0x0802EC8C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802ECCC  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	bl sub_802CBC8
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	adds r0, #0x31
	ldrb r2, [r0]
	movs r1, #0xf
	ands r1, r2
	movs r2, #0x70
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_802CC54
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802ECCC: .4byte gUnknown_0203A958

	THUMB_FUNC_START GetRescueStaffeePosition
GetRescueStaffeePosition: @ 0x0802ECD0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	str r1, [sp]
	mov r9, r2
	mov sl, r3
	movs r0, #1
	negs r0, r0
	str r0, [r2]
	str r0, [r3]
	ldr r0, _0802ED94  @ 0x0000270F
	str r0, [sp, #4]
	adds r0, r7, #0
	bl FillMovementMapForUnitPosition
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	ldr r1, _0802ED98  @ gUnknown_0202E4D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _0802ED9C  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0802EDCC
_0802ED1A:
	ldr r0, _0802ED9C  @ gUnknown_0202E4D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _0802EDC6
	lsls r6, r5, #2
_0802ED2C:
	ldr r0, _0802EDA0  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0802EDC0
	ldr r0, _0802ED98  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802EDC0
	ldr r0, _0802EDA4  @ gUnknown_0202E4EC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0802EDC0
	ldr r0, _0802EDA8  @ gUnknown_0202E4DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802EDC0
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	subs r2, r4, r0
	cmp r2, #0
	bge _0802ED84
	subs r2, r0, r4
_0802ED84:
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	subs r1, r5, r0
	cmp r1, #0
	blt _0802EDAC
	adds r0, r2, r1
	b _0802EDB0
	.align 2, 0
_0802ED94: .4byte 0x0000270F
_0802ED98: .4byte gUnknown_0202E4D8
_0802ED9C: .4byte gUnknown_0202E4D4
_0802EDA0: .4byte gUnknown_0202E4E0
_0802EDA4: .4byte gUnknown_0202E4EC
_0802EDA8: .4byte gUnknown_0202E4DC
_0802EDAC:
	subs r0, r0, r5
	adds r0, r2, r0
_0802EDB0:
	ldr r1, [sp, #4]
	cmp r1, r0
	blt _0802EDC0
	str r0, [sp, #4]
	mov r0, r9
	str r4, [r0]
	mov r1, sl
	str r5, [r1]
_0802EDC0:
	subs r4, #1
	cmp r4, #0
	bge _0802ED2C
_0802EDC6:
	mov r5, r8
	cmp r5, #0
	bge _0802ED1A
_0802EDCC:
	mov r1, r9
	ldr r0, [r1]
	cmp r0, #0
	blt _0802EDDC
	mov r1, sl
	ldr r0, [r1]
	cmp r0, #0
	bge _0802EECA
_0802EDDC:
	ldr r0, _0802EEDC  @ 0x0000270F
	str r0, [sp, #4]
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	ldr r2, _0802EEE0  @ gUnknown_0880BB96
	bl FillMovementMapSomehow
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	ldr r1, _0802EEE4  @ gUnknown_0202E4D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _0802EEE8  @ gUnknown_0202E4D4
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0802EEA6
_0802EE12:
	ldr r0, _0802EEE8  @ gUnknown_0202E4D4
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _0802EEA0
	lsls r6, r5, #2
_0802EE24:
	ldr r0, _0802EEEC  @ gUnknown_0202E4E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0802EE9A
	ldr r0, _0802EEE4  @ gUnknown_0202E4D8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802EE9A
	ldr r0, _0802EEF0  @ gUnknown_0202E4EC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0802EE9A
	ldr r0, _0802EEF4  @ gUnknown_0202E4DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl CanUnitCrossTerrain
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802EE9A
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	subs r2, r4, r0
	cmp r2, #0
	bge _0802EE7C
	subs r2, r0, r4
_0802EE7C:
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	subs r0, r5, r1
	cmp r0, #0
	bge _0802EE88
	subs r0, r1, r5
_0802EE88:
	adds r0, r2, r0
	ldr r1, [sp, #4]
	cmp r1, r0
	blt _0802EE9A
	str r0, [sp, #4]
	mov r0, r9
	str r4, [r0]
	mov r1, sl
	str r5, [r1]
_0802EE9A:
	subs r4, #1
	cmp r4, #0
	bge _0802EE24
_0802EEA0:
	mov r5, r8
	cmp r5, #0
	bge _0802EE12
_0802EEA6:
	mov r1, r9
	ldr r0, [r1]
	cmp r0, #0
	blt _0802EEB6
	mov r1, sl
	ldr r0, [r1]
	cmp r0, #0
	bge _0802EECA
_0802EEB6:
	ldr r1, [sp]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	mov r1, r9
	str r0, [r1]
	ldr r1, [sp]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	mov r1, sl
	str r0, [r1]
_0802EECA:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802EEDC: .4byte 0x0000270F
_0802EEE0: .4byte gUnknown_0880BB96
_0802EEE4: .4byte gUnknown_0202E4D8
_0802EEE8: .4byte gUnknown_0202E4D4
_0802EEEC: .4byte gUnknown_0202E4E0
_0802EEF0: .4byte gUnknown_0202E4EC
_0802EEF4: .4byte gUnknown_0202E4DC

	THUMB_FUNC_START ExecRescueStaff
ExecRescueStaff: @ 0x0802EEF8
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r4, _0802EF68  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	bl sub_802CBC8
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	adds r1, r0, #0
	add r3, sp, #4
	adds r0, r5, #0
	mov r2, sp
	bl GetRescueStaffeePosition
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	ldr r1, [sp]
	strb r1, [r0, #0x10]
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	ldr r1, [sp, #4]
	strb r1, [r0, #0x11]
	ldr r0, _0802EF6C  @ gUnknown_0203A56C
	ldr r1, [sp]
	adds r2, r0, #0
	adds r2, #0x73
	strb r1, [r2]
	ldr r1, [sp, #4]
	adds r0, #0x74
	strb r1, [r0]
	adds r0, r6, #0
	bl sub_802CC54
	bl BeginBattleAnimations
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802EF68: .4byte gUnknown_0203A958
_0802EF6C: .4byte gUnknown_0203A56C

	THUMB_FUNC_START sub_802EF70
sub_802EF70: @ 0x0802EF70
	push {lr}
	bl sub_80377CC
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_802EF80
sub_802EF80: @ 0x0802EF80
	push {lr}
	ldr r0, _0802EFA8  @ gUnknown_0203A958
	ldrb r0, [r0, #0xd]
	bl GetUnitStruct
	bl MU_GetByUnit
	bl MU_End
	bl RefreshFogAndUnitMaps
	bl UpdateGameTilesGraphics
	bl SMS_UpdateFromGameData
	bl SMS_FlushIndirect
	pop {r1}
	bx r1
	.align 2, 0
_0802EFA8: .4byte gUnknown_0203A958

	THUMB_FUNC_START ExecWarpStaff
ExecWarpStaff: @ 0x0802EFAC
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802F004  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	bl sub_802CBC8
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	ldrb r1, [r4, #0x13]
	strb r1, [r0, #0x10]
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	ldrb r1, [r4, #0x14]
	strb r1, [r0, #0x11]
	ldr r0, _0802F008  @ gUnknown_0203A56C
	ldrb r1, [r4, #0x13]
	adds r2, r0, #0
	adds r2, #0x73
	strb r1, [r2]
	ldrb r1, [r4, #0x14]
	adds r0, #0x74
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_802CC54
	bl BeginBattleAnimations
	ldr r0, _0802F00C  @ gUnknown_0859BDF0
	adds r1, r5, #0
	bl Proc_CreateBlockingChild
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802F004: .4byte gUnknown_0203A958
_0802F008: .4byte gUnknown_0203A56C
_0802F00C: .4byte gUnknown_0859BDF0

	THUMB_FUNC_START ExecStatusStaff
ExecStatusStaff: @ 0x0802F010
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802F06C  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	bl sub_802CBC8
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	adds r1, r0, #0
	adds r0, r5, #0
	bl GetStaffAccuracy
	ldr r4, _0802F070  @ gUnknown_0203A4EC
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
	bl Roll1RN
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802F07C
	ldr r0, _0802F074  @ gUnknown_0203A608
	ldr r3, [r0]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #2
	orrs r1, r0
	ldr r0, _0802F078  @ 0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	b _0802F144
	.align 2, 0
_0802F06C: .4byte gUnknown_0203A958
_0802F070: .4byte gUnknown_0203A4EC
_0802F074: .4byte gUnknown_0203A608
_0802F078: .4byte 0xFFF80000
_0802F07C:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x52
	beq _0802F0BC
	cmp r0, #0x52
	bgt _0802F094
	cmp r0, #0x51
	beq _0802F0AC
	b _0802F144
_0802F094:
	cmp r0, #0x53
	beq _0802F09E
	cmp r0, #0xb5
	beq _0802F0CC
	b _0802F144
_0802F09E:
	ldr r0, _0802F0A8  @ gUnknown_0203A56C
	adds r0, #0x6f
	movs r1, #4
	strb r1, [r0]
	b _0802F144
	.align 2, 0
_0802F0A8: .4byte gUnknown_0203A56C
_0802F0AC:
	ldr r0, _0802F0B8  @ gUnknown_0203A56C
	adds r0, #0x6f
	movs r1, #3
	strb r1, [r0]
	b _0802F144
	.align 2, 0
_0802F0B8: .4byte gUnknown_0203A56C
_0802F0BC:
	ldr r0, _0802F0C8  @ gUnknown_0203A56C
	adds r0, #0x6f
	movs r1, #2
	strb r1, [r0]
	b _0802F144
	.align 2, 0
_0802F0C8: .4byte gUnknown_0203A56C
_0802F0CC:
	ldr r0, _0802F0E0  @ gUnknown_0202BCF0
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq _0802F120
	cmp r0, #0x40
	bgt _0802F0E4
	cmp r0, #0
	beq _0802F0EA
	b _0802F144
	.align 2, 0
_0802F0E0: .4byte gUnknown_0202BCF0
_0802F0E4:
	cmp r0, #0x80
	beq _0802F104
	b _0802F144
_0802F0EA:
	ldr r2, _0802F100  @ gUnknown_0203A56C
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802F13C
	adds r1, r2, #0
	adds r1, #0x6f
	movs r0, #0xd
	b _0802F142
	.align 2, 0
_0802F100: .4byte gUnknown_0203A56C
_0802F104:
	ldr r2, _0802F11C  @ gUnknown_0203A56C
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0802F13C
	adds r1, r2, #0
	adds r1, #0x6f
	movs r0, #0xd
	b _0802F142
	.align 2, 0
_0802F11C: .4byte gUnknown_0203A56C
_0802F120:
	ldr r2, _0802F138  @ gUnknown_0203A56C
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x40
	bne _0802F13C
	adds r1, r2, #0
	adds r1, #0x6f
	movs r0, #0xd
	b _0802F142
	.align 2, 0
_0802F138: .4byte gUnknown_0203A56C
_0802F13C:
	adds r1, r2, #0
	adds r1, #0x6f
	movs r0, #0xb
_0802F142:
	strb r0, [r1]
_0802F144:
	adds r0, r6, #0
	bl sub_802CC54
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	THUMB_FUNC_START ExecFortify
ExecFortify: @ 0x0802F154
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0802F1D4  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	bl GetPlayerLeaderUnitId
	bl GetUnitByCharId
	bl sub_802CBC8
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	bl MakeTargetListForRangedHeal
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl GetItemHealAmount
	adds r6, r0, #0
	bl sub_804FD28
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _0802F1C4
_0802F1A8:
	adds r0, r4, #0
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnitStruct
	adds r1, r6, #0
	bl UnitTryHeal
	adds r4, #1
	cmp r4, r5
	blt _0802F1A8
_0802F1C4:
	adds r0, r7, #0
	bl sub_802CC54
	bl BeginBattleAnimations
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F1D4: .4byte gUnknown_0203A958

	THUMB_FUNC_START sub_802F1D8
sub_802F1D8: @ 0x0802F1D8
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802F204  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	bl sub_802CBC8
	adds r0, r5, #0
	bl sub_802CC54
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802F204: .4byte gUnknown_0203A958

	THUMB_FUNC_START sub_802F208
sub_802F208: @ 0x0802F208
	push {r4, r5, r6, lr}
	ldr r0, _0802F270  @ gUnknown_0203A958
	ldrb r0, [r0, #0xc]
	bl GetUnitStruct
	bl MakeTargetListForFuckingNightmare
	bl sub_804FD28
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _0802F26A
_0802F222:
	adds r0, r5, #0
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnitStruct
	adds r4, r0, #0
	ldr r0, _0802F270  @ gUnknown_0203A958
	ldrb r0, [r0, #0xc]
	bl GetUnitStruct
	adds r1, r4, #0
	bl GetStaffAccuracy
	bl Roll1RN
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0802F264
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0802F264
	adds r0, r4, #0
	movs r1, #2
	bl SetUnitNewStatus
_0802F264:
	adds r5, #1
	cmp r5, r6
	blt _0802F222
_0802F26A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802F270: .4byte gUnknown_0203A958

	THUMB_FUNC_START sub_802F274
sub_802F274: @ 0x0802F274
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802F2AC  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	ldr r0, _0802F2B0  @ gUnknown_0203A56C
	ldrb r1, [r4, #0x13]
	strb r1, [r0, #0x10]
	ldrb r2, [r4, #0x14]
	strb r2, [r0, #0x11]
	adds r3, r0, #0
	adds r3, #0x73
	strb r1, [r3]
	adds r0, #0x74
	strb r2, [r0]
	adds r0, r5, #0
	bl sub_802CC54
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802F2AC: .4byte gUnknown_0203A958
_0802F2B0: .4byte gUnknown_0203A56C

	THUMB_FUNC_START ExecHammerne
ExecHammerne: @ 0x0802F2B4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802F308  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	bl sub_802CBC8
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	ldrb r1, [r4, #0x15]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl MakeItemShort
	ldrb r1, [r4, #0x15]
	lsls r1, r1, #1
	adds r5, #0x1e
	adds r5, r5, r1
	strh r0, [r5]
	adds r0, r6, #0
	bl sub_802CC54
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802F308: .4byte gUnknown_0203A958

	THUMB_FUNC_START sub_802F30C
sub_802F30C: @ 0x0802F30C
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0802F37C  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	bl GetPlayerLeaderUnitId
	bl GetUnitByCharId
	bl sub_802CBC8
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	bl MakeTargetListForLatona
	bl sub_804FD28
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _0802F36C
_0802F340:
	adds r0, r5, #0
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnitStruct
	adds r4, r0, #0
	bl GetUnitMaxHP
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitHP
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitNewStatus
	adds r5, #1
	cmp r5, r6
	blt _0802F340
_0802F36C:
	adds r0, r7, #0
	bl sub_802CC54
	bl BeginBattleAnimations
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F37C: .4byte gUnknown_0203A958

	THUMB_FUNC_START ExecSomeSelfHeal
ExecSomeSelfHeal: @ 0x0802F380
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r5, _0802F3D8  @ gUnknown_0203A958
	ldrb r0, [r5, #0xc]
	bl GetUnitStruct
	ldrb r1, [r5, #0x12]
	bl sub_802CB24
	ldrb r0, [r5, #0xc]
	bl GetUnitStruct
	adds r1, r4, #0
	bl UnitTryHeal
	ldrb r0, [r5, #0xc]
	bl GetUnitStruct
	bl GetUnitCurrentHP
	ldr r1, _0802F3DC  @ gUnknown_0203A608
	ldr r2, [r1]
	ldr r4, _0802F3E0  @ gUnknown_0203A4EC
	ldrb r1, [r4, #0x13]
	subs r1, r1, r0
	strb r1, [r2, #3]
	ldrb r0, [r5, #0xc]
	bl GetUnitStruct
	bl GetUnitCurrentHP
	strb r0, [r4, #0x13]
	adds r4, #0x4a
	movs r0, #0x6c
	strh r0, [r4]
	adds r0, r6, #0
	bl sub_802CC54
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802F3D8: .4byte gUnknown_0203A958
_0802F3DC: .4byte gUnknown_0203A608
_0802F3E0: .4byte gUnknown_0203A4EC

	THUMB_FUNC_START sub_802F3E4
sub_802F3E4: @ 0x0802F3E4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802F444  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	bl GetUnitMaxHP
	adds r1, r0, #0
	adds r0, r5, #0
	bl SetUnitHP
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	bl GetUnitCurrentHP
	ldr r1, _0802F448  @ gUnknown_0203A608
	ldr r2, [r1]
	ldr r5, _0802F44C  @ gUnknown_0203A4EC
	ldrb r1, [r5, #0x13]
	subs r1, r1, r0
	strb r1, [r2, #3]
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	bl GetUnitCurrentHP
	strb r0, [r5, #0x13]
	adds r0, r6, #0
	bl sub_802CC54
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802F444: .4byte gUnknown_0203A958
_0802F448: .4byte gUnknown_0203A608
_0802F44C: .4byte gUnknown_0203A4EC

	THUMB_FUNC_START sub_802F450
sub_802F450: @ 0x0802F450
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802F488  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	adds r0, #0x31
	ldrb r2, [r0]
	movs r1, #0xf
	ands r1, r2
	movs r2, #0x70
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_802CC54
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802F488: .4byte gUnknown_0203A958

	THUMB_FUNC_START sub_802F48C
sub_802F48C: @ 0x0802F48C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802F4CC  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	adds r0, #0x31
	ldrb r2, [r0]
	movs r1, #0x10
	negs r1, r1
	ands r1, r2
	movs r2, #4
	orrs r1, r2
	strb r1, [r0]
	ldrb r0, [r4, #0xe]
	strb r0, [r4, #0x13]
	ldrb r0, [r4, #0xf]
	strb r0, [r4, #0x14]
	adds r0, r5, #0
	bl sub_802CC54
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802F4CC: .4byte gUnknown_0203A958

	THUMB_FUNC_START sub_802F4D0
sub_802F4D0: @ 0x0802F4D0
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802F508  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	movs r1, #0
	bl SetUnitNewStatus
	ldr r0, _0802F50C  @ gUnknown_0203A4EC
	movs r1, #0
	bl SetUnitNewStatus
	adds r0, r5, #0
	bl sub_802CC54
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802F508: .4byte gUnknown_0203A958
_0802F50C: .4byte gUnknown_0203A4EC

	THUMB_FUNC_START sub_802F510
sub_802F510: @ 0x0802F510
	push {r4, r5, lr}
	ldr r4, _0802F58C  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl ValidateUnitItem
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	movs r5, #0x10
	ldrsb r5, [r0, r5]
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	movs r4, #0x11
	ldrsb r4, [r0, r4]
	subs r0, r5, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	bl sub_808320C
	adds r0, r5, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	bl sub_808320C
	subs r1, r4, #1
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r5, #0
	bl sub_808320C
	adds r1, r4, #1
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r5, #0
	bl sub_808320C
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80831C8
	ldr r0, _0802F590  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802F57E
	movs r0, #0xb1
	bl m4aSongNumStart
_0802F57E:
	ldr r0, _0802F594  @ gUnknown_0203A56C
	adds r0, #0x6f
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802F58C: .4byte gUnknown_0203A958
_0802F590: .4byte gUnknown_0202BCF0
_0802F594: .4byte gUnknown_0203A56C

	THUMB_FUNC_START sub_802F598
sub_802F598: @ 0x0802F598
	push {r4, r5, r6, r7, lr}
	mov r7, r9
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov r8, r2
	movs r0, #1
	negs r0, r0
	mov r9, r0
	cmp r7, r9
	beq _0802F5CA
	ldr r3, _0802F650  @ gUnknown_0203A4EC
	ldr r1, _0802F654  @ gUnknown_0203A56C
	lsls r2, r7, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, #0x4a
	strh r0, [r1]
	adds r3, #0x4a
	strh r0, [r3]
_0802F5CA:
	adds r0, r6, #0
	bl GetUnitEquippedWeapon
	ldr r4, _0802F650  @ gUnknown_0203A4EC
	ldr r5, _0802F654  @ gUnknown_0203A56C
	adds r1, r5, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl CopyUnitToBattleStructRawStats
	adds r0, r6, #0
	bl sub_802BC00
	adds r0, r4, #0
	adds r1, r6, #0
	bl CopyUnitToBattleStructRawStats
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802BEA0
	adds r0, r4, #0
	bl BattleSetupTerrainData
	adds r0, r5, #0
	bl BattleSetupTerrainData
	mov r0, r8
	cmp r0, #0
	beq _0802F618
	ldr r0, [r6, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r6, #0xc]
_0802F618:
	cmp r7, r9
	beq _0802F624
	adds r0, r6, #0
	adds r1, r7, #0
	bl ValidateUnitItem
_0802F624:
	ldr r2, _0802F658  @ gUnknown_0203A5EC
	ldr r0, [r2]
	ldr r1, _0802F65C  @ 0xFFF80000
	ands r0, r1
	str r0, [r2]
	ldrb r1, [r2, #2]
	movs r0, #7
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #2]
	movs r0, #0
	strb r0, [r2, #3]
	ldr r1, _0802F660  @ gUnknown_0203A4D4
	movs r0, #0x10
	strh r0, [r1]
	pop {r3, r4}
	mov r8, r3
	mov r9, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F650: .4byte gUnknown_0203A4EC
_0802F654: .4byte gUnknown_0203A56C
_0802F658: .4byte gUnknown_0203A5EC
_0802F65C: .4byte 0xFFF80000
_0802F660: .4byte gUnknown_0203A4D4

	THUMB_FUNC_START sub_802F664
sub_802F664: @ 0x0802F664
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, r9
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r7, r2, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov r9, r3
	movs r0, #1
	negs r0, r0
	mov sl, r0
	cmp r7, sl
	beq _0802F69E
	ldr r3, _0802F728  @ gUnknown_0203A4EC
	ldr r1, _0802F72C  @ gUnknown_0203A56C
	lsls r2, r7, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, #0x4a
	strh r0, [r1]
	adds r3, #0x4a
	strh r0, [r3]
_0802F69E:
	adds r0, r6, #0
	bl GetUnitEquippedWeapon
	ldr r4, _0802F728  @ gUnknown_0203A4EC
	ldr r5, _0802F72C  @ gUnknown_0203A56C
	adds r1, r5, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl CopyUnitToBattleStructRawStats
	adds r0, r6, #0
	mov r1, r8
	bl sub_802BD50
	adds r0, r4, #0
	adds r1, r6, #0
	bl CopyUnitToBattleStructRawStats
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802BEA0
	adds r0, r4, #0
	bl BattleSetupTerrainData
	adds r0, r5, #0
	bl BattleSetupTerrainData
	mov r0, r9
	cmp r0, #0
	beq _0802F6EE
	ldr r0, [r6, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r6, #0xc]
_0802F6EE:
	cmp r7, sl
	beq _0802F6FA
	adds r0, r6, #0
	adds r1, r7, #0
	bl ValidateUnitItem
_0802F6FA:
	ldr r2, _0802F730  @ gUnknown_0203A5EC
	ldr r0, [r2]
	ldr r1, _0802F734  @ 0xFFF80000
	ands r0, r1
	str r0, [r2]
	ldrb r1, [r2, #2]
	movs r0, #7
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #2]
	movs r0, #0
	strb r0, [r2, #3]
	ldr r1, _0802F738  @ gUnknown_0203A4D4
	movs r0, #0x10
	strh r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov r9, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F728: .4byte gUnknown_0203A4EC
_0802F72C: .4byte gUnknown_0203A56C
_0802F730: .4byte gUnknown_0203A5EC
_0802F734: .4byte 0xFFF80000
_0802F738: .4byte gUnknown_0203A4D4

	THUMB_FUNC_START sub_802F73C
sub_802F73C: @ 0x0802F73C
	push {r4, lr}
	ldr r4, _0802F75C  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r2, [r4, #0x12]
	movs r1, #1
	movs r3, #1
	bl sub_802F664
	bl BeginBattleAnimations
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F75C: .4byte gUnknown_0203A958

	THUMB_FUNC_START sub_802F760
sub_802F760: @ 0x0802F760
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	ldr r4, _0802F7F0  @ gUnknown_0203A4EC
	ldr r5, _0802F7F4  @ gUnknown_0203A56C
	adds r0, r5, #0
	adds r0, #0x4a
	movs r2, #0
	mov r8, r2
	strh r1, [r0]
	ldr r2, _0802F7F8  @ 0x0000FFFF
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r0, r4, #0
	adds r0, #0x4a
	strh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x48
	strh r2, [r0]
	adds r0, r5, #0
	adds r1, r6, #0
	bl CopyUnitToBattleStruct
	adds r0, r6, #0
	bl sub_802BC00
	adds r0, r4, #0
	adds r1, r6, #0
	bl CopyUnitToBattleStruct
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802BEA0
	adds r0, r4, #0
	bl BattleSetupTerrainData
	adds r0, r5, #0
	bl BattleSetupTerrainData
	ldr r2, _0802F7FC  @ gUnknown_0203A5EC
	ldr r0, [r2]
	ldr r1, _0802F800  @ 0xFFF80000
	ands r0, r1
	str r0, [r2]
	ldrb r1, [r2, #2]
	movs r0, #7
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #2]
	mov r0, r8
	strb r0, [r2, #3]
	ldr r1, _0802F804  @ gUnknown_0203A4D4
	movs r0, #0x10
	strh r0, [r1]
	bl BeginBattleAnimations
	ldr r0, [r6, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r6, #0xc]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802F7F0: .4byte gUnknown_0203A4EC
_0802F7F4: .4byte gUnknown_0203A56C
_0802F7F8: .4byte 0x0000FFFF
_0802F7FC: .4byte gUnknown_0203A5EC
_0802F800: .4byte 0xFFF80000
_0802F804: .4byte gUnknown_0203A4D4

	THUMB_FUNC_START sub_802F808
sub_802F808: @ 0x0802F808
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	movs r5, #0
	lsls r0, r7, #1
	adds r1, r4, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r6, #0
	bl GetItemIndex
	cmp r0, #0x89
	bne _0802F83A
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r1, r7, #0
	bl ValidateUnitItem
	movs r0, #0x1d
	b _0802F90E
_0802F83A:
	adds r0, r6, #0
	bl GetItemStatBonusesPtr
	ldrb r1, [r0]
	ldrb r2, [r4, #0x12]
	adds r1, r1, r2
	strb r1, [r4, #0x12]
	ldrb r1, [r0]
	ldrb r2, [r4, #0x13]
	adds r1, r1, r2
	strb r1, [r4, #0x13]
	ldrb r1, [r0, #1]
	ldrb r2, [r4, #0x14]
	adds r1, r1, r2
	strb r1, [r4, #0x14]
	ldrb r1, [r0, #2]
	ldrb r2, [r4, #0x15]
	adds r1, r1, r2
	strb r1, [r4, #0x15]
	ldrb r1, [r0, #3]
	ldrb r2, [r4, #0x16]
	adds r1, r1, r2
	strb r1, [r4, #0x16]
	ldrb r1, [r0, #4]
	ldrb r2, [r4, #0x17]
	adds r1, r1, r2
	strb r1, [r4, #0x17]
	ldrb r1, [r0, #5]
	ldrb r2, [r4, #0x18]
	adds r1, r1, r2
	strb r1, [r4, #0x18]
	ldrb r1, [r0, #6]
	ldrb r2, [r4, #0x19]
	adds r1, r1, r2
	strb r1, [r4, #0x19]
	ldrb r1, [r0, #7]
	ldrb r2, [r4, #0x1d]
	adds r1, r1, r2
	strb r1, [r4, #0x1d]
	ldrb r0, [r0, #8]
	ldrb r1, [r4, #0x1a]
	adds r0, r0, r1
	strb r0, [r4, #0x1a]
	adds r0, r4, #0
	bl CheckForStatCaps
	adds r0, r4, #0
	adds r1, r7, #0
	bl ValidateUnitItem
	adds r0, r6, #0
	bl GetItemIndex
	subs r0, #0x5b
	cmp r0, #8
	bhi _0802F90C
	lsls r0, r0, #2
	ldr r1, _0802F8B4  @ _0802F8B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802F8B4: .4byte _0802F8B8
_0802F8B8: @ jump table
	.4byte _0802F8E4 @ case 0
	.4byte _0802F8FC @ case 1
	.4byte _0802F8DC @ case 2
	.4byte _0802F8EC @ case 3
	.4byte _0802F8E0 @ case 4
	.4byte _0802F8E8 @ case 5
	.4byte _0802F8F0 @ case 6
	.4byte _0802F8F4 @ case 7
	.4byte _0802F8F8 @ case 8
_0802F8DC:
	movs r5, #0x15
	b _0802F90C
_0802F8E0:
	movs r5, #0x17
	b _0802F90C
_0802F8E4:
	movs r5, #0x1c
	b _0802F90C
_0802F8E8:
	movs r5, #0x18
	b _0802F90C
_0802F8EC:
	movs r5, #0x16
	b _0802F90C
_0802F8F0:
	movs r5, #0x19
	b _0802F90C
_0802F8F4:
	movs r5, #0x1a
	b _0802F90C
_0802F8F8:
	movs r5, #0x1b
	b _0802F90C
_0802F8FC:
	adds r0, r4, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	movs r5, #0x13
	cmp r0, #0
	beq _0802F90C
	movs r5, #0x14
_0802F90C:
	adds r0, r5, #0
_0802F90E:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

	THUMB_FUNC_START sub_802F914
sub_802F914: @ 0x0802F914
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0802F96C  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r2, [r4, #0x12]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r6, [r1]
	ldr r1, _0802F970  @ gUnknown_0203A56C
	adds r1, #0x6f
	movs r2, #0xff
	strb r2, [r1]
	ldrb r1, [r4, #0x12]
	bl sub_802F808
	adds r5, r0, #0
	ldr r0, _0802F974  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802F94E
	movs r0, #0x5a
	bl m4aSongNumStart
_0802F94E:
	adds r0, r6, #0
	bl GetItemIconId
	adds r4, r0, #0
	adds r0, r5, #0
	bl GetStringFromIndex
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_801F9FC
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F96C: .4byte gUnknown_0203A958
_0802F970: .4byte gUnknown_0203A56C
_0802F974: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_802F978
sub_802F978: @ 0x0802F978
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r1, #0
	movs r4, #0
	ldr r2, _0802F9DC  @ gUnknown_080D7C44
_0802F984:
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	adds r4, #1
	cmp r4, #4
	bls _0802F984
	adds r0, r1, #0
	bl NextRN_N
	adds r2, r0, #0
	movs r4, #0
	ldr r0, _0802F9DC  @ gUnknown_080D7C44
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, r2
	bgt _0802F9BE
	adds r3, r0, #0
_0802F9AA:
	adds r4, #1
	cmp r4, #4
	bhi _0802F9BE
	adds r0, r4, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r1, r2
	ble _0802F9AA
_0802F9BE:
	adds r4, #1
	ldrb r0, [r5, #8]
	subs r0, r0, r4
	movs r1, #0
	strb r0, [r5, #8]
	strb r1, [r5, #9]
	adds r0, r5, #0
	adds r1, r6, #0
	bl ValidateUnitItem
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802F9DC: .4byte gUnknown_080D7C44

	THUMB_FUNC_START sub_802F9E0
sub_802F9E0: @ 0x0802F9E0
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r4, _0802FA40  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r2, [r4, #0x12]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r6, [r1]
	ldr r1, _0802FA44  @ gUnknown_0203A56C
	adds r1, #0x6f
	movs r2, #0xff
	strb r2, [r1]
	ldrb r1, [r4, #0x12]
	bl sub_802F978
	adds r5, r0, #0
	ldr r0, _0802FA48  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802FA1C
	movs r0, #0x5a
	bl m4aSongNumStart
_0802FA1C:
	adds r0, r6, #0
	bl GetItemIconId
	adds r4, r0, #0
	movs r0, #0x1e
	bl GetStringFromIndex
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r4, #0
	movs r2, #0
	adds r3, r5, #0
	bl sub_801FA8C
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802FA40: .4byte gUnknown_0203A958
_0802FA44: .4byte gUnknown_0203A56C
_0802FA48: .4byte gUnknown_0202BCF0

	THUMB_FUNC_START sub_802FA4C
sub_802FA4C: @ 0x0802FA4C
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802FA88  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	movs r2, #0xb
	movs r3, #0
	bl AddTrap
	adds r0, r5, #0
	bl sub_802CC54
	ldr r0, _0802FA8C  @ gUnknown_0203A56C
	adds r0, #0x6f
	movs r1, #0xff
	strb r1, [r0]
	ldrb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	adds r0, r5, #0
	bl sub_8022300
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802FA88: .4byte gUnknown_0203A958
_0802FA8C: .4byte gUnknown_0203A56C

	THUMB_FUNC_START sub_802FA90
sub_802FA90: @ 0x0802FA90
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802FAC8  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	bl AddLightRune
	adds r0, r5, #0
	bl sub_802CC54
	ldrb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	adds r0, r5, #0
	bl sub_8021684
	ldr r0, _0802FACC  @ gUnknown_0203A56C
	adds r0, #0x6f
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802FAC8: .4byte gUnknown_0203A958
_0802FACC: .4byte gUnknown_0203A56C

	THUMB_FUNC_START sub_802FAD0
sub_802FAD0: @ 0x0802FAD0
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802FB78  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	adds r0, r6, #0
	bl sub_802CC54
	ldrb r5, [r4, #0x13]
	ldrb r4, [r4, #0x14]
	adds r0, r6, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_8021818
	movs r2, #0
	ldr r6, _0802FB7C  @ gUnknown_03001788
	movs r0, #0x80
	strb r0, [r6]
	movs r0, #0x43
	strb r0, [r6, #1]
	movs r0, #1
	strb r0, [r6, #2]
	movs r0, #8
	strb r0, [r6, #3]
	movs r0, #0x3f
	ands r5, r0
	ldrb r1, [r6, #4]
	movs r0, #0x40
	negs r0, r0
	ands r0, r1
	orrs r0, r5
	strb r0, [r6, #4]
	movs r0, #0x3f
	ands r4, r0
	lsls r4, r4, #6
	ldrh r1, [r6, #4]
	ldr r0, _0802FB80  @ 0xFFFFF03F
	ands r0, r1
	orrs r0, r4
	strh r0, [r6, #4]
	strb r2, [r6, #7]
	str r2, [r6, #8]
	ldrb r1, [r6, #5]
	movs r0, #0x11
	negs r0, r0
	ands r0, r1
	movs r1, #0x21
	negs r1, r1
	ands r0, r1
	strb r0, [r6, #5]
	movs r0, #0x20
	strb r0, [r6, #0xc]
	movs r0, #0x21
	strb r0, [r6, #0xd]
	movs r0, #0x27
	strb r0, [r6, #0xe]
	movs r0, #0x29
	strb r0, [r6, #0xf]
	strb r2, [r6, #0x10]
	strb r2, [r6, #0x11]
	strb r2, [r6, #0x12]
	strb r2, [r6, #0x13]
	movs r0, #1
	bl GetUnitByCharId
	adds r2, r0, #0
	cmp r2, #0
	bne _0802FB68
	adds r0, r6, #0
	bl LoadUnits
_0802FB68:
	ldr r0, _0802FB84  @ gUnknown_0203A56C
	adds r0, #0x6f
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802FB78: .4byte gUnknown_0203A958
_0802FB7C: .4byte gUnknown_03001788
_0802FB80: .4byte 0xFFFFF03F
_0802FB84: .4byte gUnknown_0203A56C

	THUMB_FUNC_START ExecTorchStaff
ExecTorchStaff: @ 0x0802FB88
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802FBB8  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	movs r2, #0xa
	movs r3, #8
	bl AddTrap
	adds r0, r5, #0
	bl sub_802CC54
	bl BeginBattleAnimations
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802FBB8: .4byte gUnknown_0203A958

	THUMB_FUNC_START sub_802FBBC
sub_802FBBC: @ 0x0802FBBC
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r4, _0802FBFC  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	bl sub_802CB24
	ldrb r0, [r4, #0xd]
	bl GetUnitStruct
	bl sub_802CBC8
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x7e
	beq _0802FC0E
	cmp r0, #0x7e
	bgt _0802FC00
	cmp r0, #0x7d
	beq _0802FC0A
	b _0802FC18
	.align 2, 0
_0802FBFC: .4byte gUnknown_0203A958
_0802FC00:
	cmp r0, #0x7f
	beq _0802FC12
	cmp r0, #0x80
	beq _0802FC16
	b _0802FC18
_0802FC0A:
	movs r5, #5
	b _0802FC18
_0802FC0E:
	movs r5, #6
	b _0802FC18
_0802FC12:
	movs r5, #7
	b _0802FC18
_0802FC16:
	movs r5, #8
_0802FC18:
	ldr r0, _0802FC40  @ gUnknown_0203A958
	ldrb r0, [r0, #0xd]
	bl GetUnitStruct
	adds r1, r5, #0
	movs r2, #1
	bl WriteUnitStatusDuration
	ldr r1, _0802FC44  @ gUnknown_0203A4D4
	movs r0, #0x80
	lsls r0, r0, #2
	strh r0, [r1]
	adds r0, r6, #0
	bl sub_802CC54
	bl BeginBattleAnimations
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802FC40: .4byte gUnknown_0203A958
_0802FC44: .4byte gUnknown_0203A4D4

	THUMB_FUNC_START ActionStaffDoorChestUseItem
ActionStaffDoorChestUseItem: @ 0x0802FC48
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	ldr r4, _0802FC84  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	mov r8, r0
	ldr r0, _0802FC88  @ gUnknown_0203A4EC
	adds r0, #0x7e
	movs r1, #0
	strb r1, [r0]
	mov r0, r8
	subs r0, #0x4b
	cmp r0, #0x76
	bls _0802FC7A
	b _0802FF76
_0802FC7A:
	lsls r0, r0, #2
	ldr r1, _0802FC8C  @ _0802FC90
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802FC84: .4byte gUnknown_0203A958
_0802FC88: .4byte gUnknown_0203A4EC
_0802FC8C: .4byte _0802FC90
_0802FC90: @ jump table
	.4byte _0802FE6C @ case 0
	.4byte _0802FE6C @ case 1
	.4byte _0802FE6C @ case 2
	.4byte _0802FE6C @ case 3
	.4byte _0802FE84 @ case 4
	.4byte _0802FE8C @ case 5
	.4byte _0802FE74 @ case 6
	.4byte _0802FE74 @ case 7
	.4byte _0802FE74 @ case 8
	.4byte _0802FEA4 @ case 9
	.4byte _0802FE94 @ case 10
	.4byte _0802FF60 @ case 11
	.4byte _0802FEB4 @ case 12
	.4byte _0802FEAC @ case 13
	.4byte _0802FE9C @ case 14
	.4byte _0802FF76 @ case 15
	.4byte _0802FF40 @ case 16
	.4byte _0802FF40 @ case 17
	.4byte _0802FF40 @ case 18
	.4byte _0802FF40 @ case 19
	.4byte _0802FF40 @ case 20
	.4byte _0802FF40 @ case 21
	.4byte _0802FF40 @ case 22
	.4byte _0802FF40 @ case 23
	.4byte _0802FF40 @ case 24
	.4byte _0802FEEC @ case 25
	.4byte _0802FEEC @ case 26
	.4byte _0802FEEC @ case 27
	.4byte _0802FEEC @ case 28
	.4byte _0802FEEC @ case 29
	.4byte _0802FEE6 @ case 30
	.4byte _0802FEE6 @ case 31
	.4byte _0802FEE6 @ case 32
	.4byte _0802FEC4 @ case 33
	.4byte _0802FECE @ case 34
	.4byte _0802FED6 @ case 35
	.4byte _0802FEDE @ case 36
	.4byte _0802FEBC @ case 37
	.4byte _0802FF76 @ case 38
	.4byte _0802FF76 @ case 39
	.4byte _0802FF76 @ case 40
	.4byte _0802FF76 @ case 41
	.4byte _0802FF76 @ case 42
	.4byte _0802FF76 @ case 43
	.4byte _0802FF76 @ case 44
	.4byte _0802FF76 @ case 45
	.4byte _0802FEE6 @ case 46
	.4byte _0802FF50 @ case 47
	.4byte _0802FF58 @ case 48
	.4byte _0802FF76 @ case 49
	.4byte _0802FF68 @ case 50
	.4byte _0802FF68 @ case 51
	.4byte _0802FF68 @ case 52
	.4byte _0802FF68 @ case 53
	.4byte _0802FF76 @ case 54
	.4byte _0802FF76 @ case 55
	.4byte _0802FF76 @ case 56
	.4byte _0802FF76 @ case 57
	.4byte _0802FF76 @ case 58
	.4byte _0802FF76 @ case 59
	.4byte _0802FF76 @ case 60
	.4byte _0802FEEC @ case 61
	.4byte _0802FF40 @ case 62
	.4byte _0802FEEC @ case 63
	.4byte _0802FF76 @ case 64
	.4byte _0802FF48 @ case 65
	.4byte _0802FF76 @ case 66
	.4byte _0802FF76 @ case 67
	.4byte _0802FF76 @ case 68
	.4byte _0802FF76 @ case 69
	.4byte _0802FF76 @ case 70
	.4byte _0802FF76 @ case 71
	.4byte _0802FF76 @ case 72
	.4byte _0802FF76 @ case 73
	.4byte _0802FF76 @ case 74
	.4byte _0802FF76 @ case 75
	.4byte _0802FEEC @ case 76
	.4byte _0802FEEC @ case 77
	.4byte _0802FEEC @ case 78
	.4byte _0802FF76 @ case 79
	.4byte _0802FF76 @ case 80
	.4byte _0802FF76 @ case 81
	.4byte _0802FF76 @ case 82
	.4byte _0802FF76 @ case 83
	.4byte _0802FF76 @ case 84
	.4byte _0802FF76 @ case 85
	.4byte _0802FF76 @ case 86
	.4byte _0802FEC4 @ case 87
	.4byte _0802FF76 @ case 88
	.4byte _0802FF76 @ case 89
	.4byte _0802FF76 @ case 90
	.4byte _0802FE7C @ case 91
	.4byte _0802FF76 @ case 92
	.4byte _0802FF76 @ case 93
	.4byte _0802FF76 @ case 94
	.4byte _0802FF76 @ case 95
	.4byte _0802FF76 @ case 96
	.4byte _0802FF76 @ case 97
	.4byte _0802FF76 @ case 98
	.4byte _0802FF76 @ case 99
	.4byte _0802FF76 @ case 100
	.4byte _0802FF76 @ case 101
	.4byte _0802FF76 @ case 102
	.4byte _0802FF76 @ case 103
	.4byte _0802FF76 @ case 104
	.4byte _0802FF76 @ case 105
	.4byte _0802FF76 @ case 106
	.4byte _0802FF76 @ case 107
	.4byte _0802FF70 @ case 108
	.4byte _0802FF76 @ case 109
	.4byte _0802FF76 @ case 110
	.4byte _0802FF76 @ case 111
	.4byte _0802FF76 @ case 112
	.4byte _0802FF76 @ case 113
	.4byte _0802FF76 @ case 114
	.4byte _0802FF76 @ case 115
	.4byte _0802FF76 @ case 116
	.4byte _0802FF76 @ case 117
	.4byte _0802FEEC @ case 118
_0802FE6C:
	adds r0, r6, #0
	bl ExecStandardHeal
	b _0802FF76
_0802FE74:
	adds r0, r6, #0
	bl ExecStatusStaff
	b _0802FF76
_0802FE7C:
	adds r0, r6, #0
	bl sub_802F1D8
	b _0802FF76
_0802FE84:
	adds r0, r6, #0
	bl ExecFortify
	b _0802FF76
_0802FE8C:
	adds r0, r6, #0
	bl ExecRestore
	b _0802FF76
_0802FE94:
	adds r0, r6, #0
	bl ExecRescueStaff
	b _0802FF76
_0802FE9C:
	adds r0, r6, #0
	bl sub_802EC8C
	b _0802FF76
_0802FEA4:
	adds r0, r6, #0
	bl ExecWarpStaff
	b _0802FF76
_0802FEAC:
	adds r0, r6, #0
	bl sub_802F274
	b _0802FF76
_0802FEB4:
	adds r0, r6, #0
	bl ExecHammerne
	b _0802FF76
_0802FEBC:
	adds r0, r6, #0
	bl sub_802F48C
	b _0802FF76
_0802FEC4:
	adds r0, r6, #0
	movs r1, #0xa
	bl ExecSomeSelfHeal
	b _0802FF76
_0802FECE:
	adds r0, r6, #0
	bl sub_802F3E4
	b _0802FF76
_0802FED6:
	adds r0, r6, #0
	bl sub_802F450
	b _0802FF76
_0802FEDE:
	adds r0, r6, #0
	bl sub_802F4D0
	b _0802FF76
_0802FEE6:
	bl sub_802F510
	b _0802FF76
_0802FEEC:
	ldr r4, _0802FF34  @ gUnknown_0203A958
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	ldr r5, _0802FF38  @ gUnknown_0203A4EC
	ldr r7, _0802FF3C  @ gUnknown_0203A56C
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r2, r7, #0
	adds r2, #0x4a
	strh r1, [r2]
	ldrh r0, [r0]
	adds r1, r5, #0
	adds r1, #0x4a
	strh r0, [r1]
	ldrb r0, [r4, #0xc]
	bl GetUnitStruct
	bl GetUnitEquippedWeapon
	adds r1, r7, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r5, #0x48
	strh r0, [r5]
	adds r1, #0x27
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r6, #0
	bl sub_80CCA14
	b _0802FF76
	.align 2, 0
_0802FF34: .4byte gUnknown_0203A958
_0802FF38: .4byte gUnknown_0203A4EC
_0802FF3C: .4byte gUnknown_0203A56C
_0802FF40:
	adds r0, r6, #0
	bl sub_802F914
	b _0802FF76
_0802FF48:
	adds r0, r6, #0
	bl sub_802F30C
	b _0802FF76
_0802FF50:
	adds r0, r6, #0
	bl sub_802FA4C
	b _0802FF76
_0802FF58:
	adds r0, r6, #0
	bl sub_802FA90
	b _0802FF76
_0802FF60:
	adds r0, r6, #0
	bl ExecTorchStaff
	b _0802FF76
_0802FF68:
	adds r0, r6, #0
	bl sub_802FBBC
	b _0802FF76
_0802FF70:
	adds r0, r6, #0
	bl sub_802F9E0
_0802FF76:
	mov r0, r8
	cmp r0, #0xa6
	bne _0802FF8C
	ldr r0, _0802FF88  @ gUnknown_0859BE28
	adds r1, r6, #0
	bl Proc_CreateBlockingChild
	b _0802FFA2
	.align 2, 0
_0802FF88: .4byte gUnknown_0859BE28
_0802FF8C:
	ldr r0, _0802FFAC  @ gUnknown_0203A56C
	adds r0, #0x6f
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	blt _0802FFA2
	ldr r0, _0802FFB0  @ gUnknown_0859BE10
	adds r1, r6, #0
	bl Proc_CreateBlockingChild
_0802FFA2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802FFAC: .4byte gUnknown_0203A56C
_0802FFB0: .4byte gUnknown_0859BE10

	THUMB_FUNC_START ActionPick
ActionPick: @ 0x0802FFB4
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _08030008  @ gUnknown_0203A4EC
	adds r0, #0x7e
	movs r1, #0
	strb r1, [r0]
	ldr r0, _0803000C  @ gUnknown_0203A958
	movs r4, #0x13
	ldrsb r4, [r0, r4]
	movs r5, #0x14
	ldrsb r5, [r0, r5]
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_808320C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80831C8
	ldr r0, _08030010  @ gUnknown_0202BCF0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802FFEC
	movs r0, #0xb1
	bl m4aSongNumStart
_0802FFEC:
	ldr r1, _08030014  @ gUnknown_0203A56C
	adds r1, #0x6f
	movs r0, #0xff
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	blt _08030002
	ldr r0, _08030018  @ gUnknown_0859BE10
	adds r1, r6, #0
	bl Proc_CreateBlockingChild
_08030002:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08030008: .4byte gUnknown_0203A4EC
_0803000C: .4byte gUnknown_0203A958
_08030010: .4byte gUnknown_0202BCF0
_08030014: .4byte gUnknown_0203A56C
_08030018: .4byte gUnknown_0859BE10

	THUMB_FUNC_START sub_803001C
sub_803001C: @ 0x0803001C
	push {r4, lr}
	ldr r0, _08030048  @ gUnknown_0203A56C
	adds r4, r0, #0
	adds r4, #0x6f
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _08030040
	ldr r0, _0803004C  @ gUnknown_0203A958
	ldrb r0, [r0, #0xd]
	bl GetUnitStruct
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl SetUnitNewStatus
	movs r0, #0xff
	strb r0, [r4]
_08030040:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08030048: .4byte gUnknown_0203A56C
_0803004C: .4byte gUnknown_0203A958

	THUMB_FUNC_START sub_8030050
sub_8030050: @ 0x08030050
	push {lr}
	bl sub_802F208
	pop {r0}
	bx r0

.align 2, 0