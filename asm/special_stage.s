.include "asm/macros.inc"
.include "constants/constants.inc"

.syntax unified
.arm

	thumb_func_start sub_806F84C
sub_806F84C: @ 0x0806F84C
	push {r4, r5, lr}
	asrs r0, r0, #8
	asrs r1, r1, #8
	movs r5, #0
	adds r2, r0, #0
	muls r2, r0, r2
	adds r0, r2, #0
	adds r2, r1, #0
	muls r2, r1, r2
	adds r1, r2, #0
	adds r4, r0, r1
	cmp r4, #1
	bhi _0806F876
	lsls r0, r4, #0x10
	b _0806F906
_0806F86A:
	lsls r4, r4, #1
	lsls r0, r5, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r5, r0, #0x10
_0806F876:
	cmp r4, #0
	bgt _0806F86A
	lsrs r2, r4, #0x10
	mvns r2, r2
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	lsrs r3, r2, #1
	adds r1, r3, #0
	adds r0, r1, #0
	muls r0, r2, r0
	lsrs r3, r0, #0x12
	adds r1, r1, r3
	adds r0, r3, #0
	muls r0, r2, r0
	lsrs r3, r0, #0x11
	adds r1, r1, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r3, #0
	muls r0, r2, r0
	lsrs r3, r0, #0x10
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #0xd
	lsrs r3, r0, #0x10
	adds r1, r1, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	adds r0, r3, #0
	muls r0, r2, r0
	lsrs r3, r0, #0x10
	ldr r0, _0806F8F0 @ =0x0000B333
	muls r0, r3, r0
	lsrs r3, r0, #0x10
	adds r1, r1, r3
	lsls r1, r1, #0x10
	ldr r0, _0806F8F4 @ =0xFFFF0000
	eors r1, r0
	lsrs r3, r1, #0x10
	adds r0, r3, #0
	muls r0, r3, r0
	subs r0, r4, r0
	asrs r0, r0, #0x11
	adds r0, r3, r0
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r2, r5, #0x10
	asrs r0, r2, #0x10
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0806F8FC
	asrs r0, r2, #0x11
	asrs r3, r0
	ldr r0, _0806F8F8 @ =0x0000B505
	muls r0, r3, r0
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r0, r2
	b _0806F902
	.align 2, 0
_0806F8F0: .4byte 0x0000B333
_0806F8F4: .4byte 0xFFFF0000
_0806F8F8: .4byte 0x0000B505
_0806F8FC:
	asrs r0, r2, #0x11
	asrs r3, r0
	lsls r0, r3, #0x10
_0806F902:
	lsrs r3, r0, #0x10
	lsls r0, r3, #0x10
_0806F906:
	asrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

	thumb_func_start sub_806F910
sub_806F910: @ 0x0806F910
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0806F940 @ =sub_806EC24
	movs r2, #0x80
	lsls r2, r2, #7
	movs r4, #0
	str r4, [sp]
	movs r1, #8
	movs r3, #0
	bl TaskCreate
	ldrh r1, [r0, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	adds r1, r1, r2
	str r5, [r1]
	strh r4, [r1, #4]
	movs r2, #0x3c
	strh r2, [r1, #6]
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0806F940: .4byte sub_806EC24

	thumb_func_start sub_806F944
sub_806F944: @ 0x0806F944
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	ldr r1, [r0, #0xc]
	ldrh r6, [r1, #6]
	movs r2, #0xc0
	lsls r2, r2, #0x12
	ldr r0, [r0, #0x14]
	ldrh r1, [r0, #6]
	adds r1, r1, r2
	adds r2, #0xa8
	adds r0, r6, r2
	ldr r5, [r0]
	adds r2, #4
	adds r0, r6, r2
	ldr r0, [r0]
	mov r8, r0
	ldr r0, [r1, #0x40]
	ldr r1, [r1, #0x44]
	subs r5, r5, r0
	asrs r0, r5, #4
	mov r2, r8
	subs r2, r2, r1
	mov r8, r2
	asrs r1, r2, #4
	bl sub_806F84C
	adds r4, r0, #0
	ldr r0, _0806F9C0 @ =IWRAM_START + 0xD0
	adds r0, r0, r6
	mov sb, r0
	lsls r5, r5, #5
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	adds r0, r5, #0
	adds r1, r4, #0
	bl __divsi3
	mov r1, sb
	str r0, [r1]
	ldr r2, _0806F9C4 @ =IWRAM_START + 0xD4
	adds r5, r6, r2
	mov r0, r8
	lsls r0, r0, #5
	mov r8, r0
	adds r1, r4, #0
	bl __divsi3
	str r0, [r5]
	ldr r1, _0806F9C8 @ =IWRAM_START + 0xB8
	adds r6, r6, r1
	movs r0, #0xc0
	lsls r0, r0, #2
	strh r0, [r6]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F9C0: .4byte IWRAM_START + 0xD0
_0806F9C4: .4byte IWRAM_START + 0xD4
_0806F9C8: .4byte IWRAM_START + 0xB8

	thumb_func_start sub_806F9CC
sub_806F9CC: @ 0x0806F9CC
	push {lr}
	movs r0, #0
	bl sub_806EDB4
	bl sub_806EF44
	bl sub_806FA34
	bl sub_806F468
	pop {r0}
	bx r0

	thumb_func_start sub_806F9E4
sub_806F9E4: @ 0x0806F9E4
	push {r4, lr}
	ldr r0, _0806FA28 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldrh r4, [r0, #6]
	movs r0, #1
	bl sub_806EDB4
	bl sub_806EF44
	bl sub_806FA34
	ldr r0, _0806FA2C @ =gInput
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r1, r0, #0x10
	cmp r1, #0
	bne _0806FA1C
	ldr r2, _0806FA30 @ =IWRAM_START + 0xB4
	adds r0, r4, r2
	strh r1, [r0]
_0806FA1C:
	bl sub_806F468
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806FA28: .4byte gCurTask
_0806FA2C: .4byte gInput
_0806FA30: .4byte IWRAM_START + 0xB4

	thumb_func_start sub_806FA34
sub_806FA34: @ 0x0806FA34
	push {r4, lr}
	ldr r0, _0806FA84 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldrh r3, [r0, #6]
	ldr r0, _0806FA88 @ =gPressedKeys
	ldr r1, _0806FA8C @ =gUnknown_03005B38
	ldrh r2, [r0]
	ldrh r0, [r1]
	ands r0, r2
	cmp r0, #0
	beq _0806FA7E
	ldr r0, _0806FA90 @ =IWRAM_START + 0xB4
	adds r1, r3, r0
	movs r2, #0
	movs r0, #4
	strh r0, [r1]
	ldr r1, _0806FA94 @ =IWRAM_START + 0xB0
	adds r0, r3, r1
	strh r2, [r0]
	ldr r4, _0806FA98 @ =IWRAM_START + 0xEC
	adds r0, r3, r4
	ldrh r1, [r0]
	subs r4, #0x34
	adds r0, r3, r4
	strh r1, [r0]
	ldr r1, _0806FA9C @ =IWRAM_START + 0xBA
	adds r0, r3, r1
	strh r2, [r0]
	movs r0, #0x74
	bl m4aSongNumStart
_0806FA7E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806FA84: .4byte gCurTask
_0806FA88: .4byte gPressedKeys
_0806FA8C: .4byte gUnknown_03005B38
_0806FA90: .4byte IWRAM_START + 0xB4
_0806FA94: .4byte IWRAM_START + 0xB0
_0806FA98: .4byte IWRAM_START + 0xEC
_0806FA9C: .4byte IWRAM_START + 0xBA

	thumb_func_start sub_806FAA0
sub_806FAA0: @ 0x0806FAA0
	push {r4, lr}
	ldr r0, _0806FAF0 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	ldrh r3, [r0, #6]
	ldr r0, _0806FAF4 @ =IWRAM_START + 0xA8
	adds r1, r3, r0
	ldr r0, [r1]
	ldr r4, _0806FAF8 @ =0x002FFFFF
	cmp r0, r4
	bgt _0806FAC6
	movs r0, #0xc0
	lsls r0, r0, #0xe
	str r0, [r1]
_0806FAC6:
	ldr r0, [r1]
	movs r2, #0xf4
	lsls r2, r2, #0x12
	cmp r0, r2
	ble _0806FAD2
	str r2, [r1]
_0806FAD2:
	ldr r0, _0806FAFC @ =IWRAM_START + 0xAC
	adds r1, r3, r0
	ldr r0, [r1]
	cmp r0, r4
	bgt _0806FAE2
	movs r0, #0xc0
	lsls r0, r0, #0xe
	str r0, [r1]
_0806FAE2:
	ldr r0, [r1]
	cmp r0, r2
	ble _0806FAEA
	str r2, [r1]
_0806FAEA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806FAF0: .4byte gCurTask
_0806FAF4: .4byte IWRAM_START + 0xA8
_0806FAF8: .4byte 0x002FFFFF
_0806FAFC: .4byte IWRAM_START + 0xAC

	thumb_func_start sub_806FB00
sub_806FB00: @ 0x0806FB00
	bx lr
	.align 2, 0

	thumb_func_start sub_806FB04
sub_806FB04: @ 0x0806FB04
	push {r4, r5, r6, lr}
	ldr r0, _0806FB58 @ =gCurTask
	ldr r0, [r0]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r4, r0
	ldr r6, [r5]
	bl sub_8070C58
	bl sub_806FFC8
	bl sub_8070D14
	ldr r0, _0806FB5C @ =IWRAM_START + 0x2A8
	adds r4, r4, r0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0806FB44
	ldr r1, _0806FB60 @ =0x000005B4
	adds r0, r6, r1
	ldrh r0, [r0]
	cmp r0, #4
	bne _0806FB3C
	adds r0, r5, #0
	bl sub_8070D80
_0806FB3C:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0806FB80
_0806FB44:
	ldr r2, _0806FB60 @ =0x000005B4
	adds r0, r6, r2
	ldrh r0, [r0]
	cmp r0, #4
	beq _0806FB64
	adds r0, r5, #0
	bl sub_8070DE0
	b _0806FB80
	.align 2, 0
_0806FB58: .4byte gCurTask
_0806FB5C: .4byte IWRAM_START + 0x2A8
_0806FB60: .4byte 0x000005B4
_0806FB64:
	ldr r1, _0806FBB8 @ =0x000005A2
	adds r0, r6, r1
	ldrh r1, [r0]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0x1d
	ble _0806FB7A
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0806FB80
_0806FB7A:
	adds r0, r5, #0
	bl sub_8070DD0
_0806FB80:
	ldr r0, _0806FBBC @ =0x000002A9
	adds r4, r5, r0
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0806FBA4
	ldr r1, _0806FBC0 @ =0x000005BA
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806FB9C
	adds r0, r5, #0
	bl sub_80701D4
_0806FB9C:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0806FBCA
_0806FBA4:
	ldr r2, _0806FBC0 @ =0x000005BA
	adds r0, r6, r2
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806FBC4
	adds r0, r5, #0
	bl sub_8070E68
	b _0806FBCA
	.align 2, 0
_0806FBB8: .4byte 0x000005A2
_0806FBBC: .4byte 0x000002A9
_0806FBC0: .4byte 0x000005BA
_0806FBC4:
	adds r0, r5, #0
	bl sub_8070E00
_0806FBCA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

	thumb_func_start sub_806FBD0
sub_806FBD0: @ 0x0806FBD0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x48
	mov sl, r0
	ldm r0!, {r2}
	ldr r3, _0806FCE4 @ =0x000005BB
	adds r1, r2, r3
	movs r4, #0
	ldrsb r4, [r1, r4]
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r3, #1
	adds r1, r2, r3
	movs r5, #0
	ldrsb r5, [r1, r5]
	lsls r5, r5, #0x10
	lsrs r5, r5, #0x10
	ldr r1, _0806FCE8 @ =0x000005BD
	adds r2, r2, r1
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r8, r2
	mov r3, r8
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	ldr r3, _0806FCEC @ =0x00000377
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0xc0
	str r1, [sp, #4]
	movs r1, #0xe
	str r1, [sp, #8]
	movs r1, #1
	str r1, [sp, #0xc]
	movs r6, #0
	str r6, [sp, #0x10]
	str r6, [sp, #0x14]
	movs r1, #0
	movs r2, #1
	bl sub_806CA88
	lsls r4, r4, #0x10
	asrs r4, r4, #0xd
	ldr r3, _0806FCF0 @ =gUnknown_080DF7E8
	mov sb, r3
	adds r7, r4, r3
	mov r0, sl
	adds r0, #0x34
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0xcc
	str r1, [sp, #4]
	movs r4, #0x12
	str r4, [sp, #8]
	movs r1, #1
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	str r6, [sp, #0x14]
	movs r1, #0
	bl sub_806CA88
	lsls r5, r5, #0x10
	asrs r5, r5, #0xd
	mov r3, sb
	adds r7, r5, r3
	mov r0, sl
	adds r0, #0x64
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0xd4
	str r1, [sp, #4]
	str r4, [sp, #8]
	movs r1, #1
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	str r6, [sp, #0x14]
	movs r1, #0
	bl sub_806CA88
	mov r3, r8
	lsls r3, r3, #0x10
	asrs r3, r3, #0xd
	mov r8, r3
	mov r7, r8
	add r7, sb
	mov r1, sl
	adds r1, #0x94
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #0xdc
	str r0, [sp, #4]
	str r4, [sp, #8]
	movs r0, #1
	str r0, [sp, #0xc]
	ldrb r0, [r7, #2]
	str r0, [sp, #0x10]
	str r6, [sp, #0x14]
	adds r0, r1, #0
	movs r1, #0
	bl sub_806CA88
	ldr r3, _0806FCF4 @ =0x00000379
	str r6, [sp]
	str r6, [sp, #4]
	str r6, [sp, #8]
	str r6, [sp, #0xc]
	str r6, [sp, #0x10]
	str r6, [sp, #0x14]
	add r0, sp, #0x18
	movs r1, #0
	movs r2, #0
	bl sub_806CA88
	add sp, #0x48
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FCE4: .4byte 0x000005BB
_0806FCE8: .4byte 0x000005BD
_0806FCEC: .4byte 0x00000377
_0806FCF0: .4byte gUnknown_080DF7E8
_0806FCF4: .4byte 0x00000379

	thumb_func_start sub_806FCF8
sub_806FCF8: @ 0x0806FCF8
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r0, _0806FD58 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r5, r2, r0
	ldr r1, [r5]
	ldr r3, _0806FD5C @ =0x000005BB
	adds r0, r1, r3
	movs r3, #0
	ldrsb r3, [r0, r3]
	lsls r3, r3, #0x10
	ldr r4, _0806FD60 @ =0x000005BC
	adds r0, r1, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0806FD64 @ =0x000005BD
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r1, _0806FD68 @ =IWRAM_START + 0x2AA
	adds r2, r2, r1
	ldrh r0, [r2]
	adds r1, r0, #1
	movs r0, #0xff
	ands r1, r0
	strh r1, [r2]
	lsrs r0, r3, #0x10
	mov ip, r0
	cmp r3, #0
	bne _0806FD7E
	lsls r0, r4, #0x10
	asrs r2, r0, #0x10
	adds r7, r0, #0
	cmp r2, #0
	bne _0806FD6C
	movs r0, #8
	b _0806FD72
	.align 2, 0
_0806FD58: .4byte gCurTask
_0806FD5C: .4byte 0x000005BB
_0806FD60: .4byte 0x000005BC
_0806FD64: .4byte 0x000005BD
_0806FD68: .4byte IWRAM_START + 0x2AA
_0806FD6C:
	cmp r2, #2
	bgt _0806FD7E
	movs r0, #0x10
_0806FD72:
	ands r0, r1
	movs r6, #3
	cmp r0, #0
	beq _0806FD82
	movs r6, #0
	b _0806FD82
_0806FD7E:
	movs r6, #0
	lsls r7, r4, #0x10
_0806FD82:
	mov r1, ip
	lsls r0, r1, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	beq _0806FDB8
	lsls r1, r4, #3
	ldr r0, _0806FE28 @ =gUnknown_080DF7E8
	adds r1, r1, r0
	adds r3, r5, #0
	adds r3, #0x34
	ldrh r0, [r1]
	strh r0, [r3, #0xa]
	ldrh r1, [r1, #2]
	adds r0, r5, #0
	adds r0, #0x54
	strb r1, [r0]
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r3, #0x10]
	adds r0, r5, #0
	adds r0, #0x59
	strb r6, [r0]
	adds r0, r3, #0
	bl sub_8004558
_0806FDB8:
	asrs r1, r7, #0x10
	adds r0, r4, #0
	orrs r0, r1
	cmp r0, #0
	beq _0806FDEE
	lsls r1, r1, #3
	ldr r0, _0806FE28 @ =gUnknown_080DF7E8
	adds r1, r1, r0
	adds r3, r5, #0
	adds r3, #0x64
	ldrh r0, [r1]
	strh r0, [r3, #0xa]
	ldrh r1, [r1, #2]
	adds r0, r5, #0
	adds r0, #0x84
	strb r1, [r0]
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r3, #0x10]
	adds r0, r5, #0
	adds r0, #0x89
	strb r6, [r0]
	adds r0, r3, #0
	bl sub_8004558
_0806FDEE:
	mov r3, r8
	lsls r0, r3, #0x10
	asrs r0, r0, #0xd
	ldr r1, _0806FE28 @ =gUnknown_080DF7E8
	adds r1, r0, r1
	adds r3, r5, #0
	adds r3, #0x94
	ldrh r0, [r1]
	strh r0, [r3, #0xa]
	ldrh r1, [r1, #2]
	adds r0, r5, #0
	adds r0, #0xb4
	strb r1, [r0]
	ldr r0, [r3, #0x10]
	movs r1, #0x80
	lsls r1, r1, #0xb
	orrs r0, r1
	str r0, [r3, #0x10]
	adds r0, r5, #0
	adds r0, #0xb9
	strb r6, [r0]
	adds r0, r3, #0
	bl sub_8004558
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FE28: .4byte gUnknown_080DF7E8

	thumb_func_start sub_806FE2C
sub_806FE2C: @ 0x0806FE2C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	mov sl, r0
	ldr r5, [r0]
	ldr r1, _0806FFB0 @ =0x000005BF
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	ldr r1, _0806FFB4 @ =gUnknown_080DF7E8
	adds r7, r0, r1
	mov r0, sl
	adds r0, #0xc4
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	movs r6, #0x80
	lsls r6, r6, #5
	str r6, [sp]
	movs r1, #0x64
	str r1, [sp, #4]
	movs r1, #0x10
	mov r8, r1
	str r1, [sp, #8]
	movs r1, #1
	mov sb, r1
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	movs r4, #0
	str r4, [sp, #0x14]
	movs r1, #0
	bl sub_806CA88
	movs r1, #0xb8
	lsls r1, r1, #3
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	ldr r1, _0806FFB4 @ =gUnknown_080DF7E8
	adds r7, r0, r1
	mov r0, sl
	adds r0, #0xf4
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	str r6, [sp]
	movs r1, #0x6c
	str r1, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	mov r1, sb
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #0
	bl sub_806CA88
	ldr r1, _0806FFB8 @ =0x000005C1
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	ldr r1, _0806FFB4 @ =gUnknown_080DF7E8
	adds r7, r0, r1
	movs r0, #0x92
	lsls r0, r0, #1
	add r0, sl
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	str r6, [sp]
	movs r1, #0x74
	str r1, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	mov r1, sb
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #0
	bl sub_806CA88
	movs r0, #0xaa
	lsls r0, r0, #1
	add r0, sl
	movs r3, #0xde
	lsls r3, r3, #2
	str r6, [sp]
	movs r1, #0x78
	str r1, [sp, #4]
	movs r1, #0xe
	str r1, [sp, #8]
	movs r1, #2
	str r1, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #0
	movs r2, #8
	bl sub_806CA88
	ldr r1, _0806FFBC @ =0x000005C2
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	ldr r1, _0806FFB4 @ =gUnknown_080DF7E8
	adds r7, r0, r1
	movs r0, #0xc2
	lsls r0, r0, #1
	add r0, sl
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	str r6, [sp]
	movs r1, #0x7c
	str r1, [sp, #4]
	movs r1, #0x18
	mov r8, r1
	str r1, [sp, #8]
	mov r1, sb
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #0
	bl sub_806CA88
	ldr r1, _0806FFC0 @ =0x000005C3
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	ldr r1, _0806FFB4 @ =gUnknown_080DF7E8
	adds r7, r0, r1
	movs r0, #0xda
	lsls r0, r0, #1
	add r0, sl
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	str r6, [sp]
	movs r1, #0x84
	str r1, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	mov r1, sb
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #0
	bl sub_806CA88
	ldr r0, _0806FFC4 @ =0x000005C4
	adds r5, r5, r0
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #3
	ldr r1, _0806FFB4 @ =gUnknown_080DF7E8
	adds r7, r0, r1
	movs r0, #0xf2
	lsls r0, r0, #1
	add r0, sl
	ldrh r2, [r7, #4]
	ldrh r3, [r7]
	str r6, [sp]
	movs r1, #0x8c
	str r1, [sp, #4]
	mov r1, r8
	str r1, [sp, #8]
	mov r1, sb
	str r1, [sp, #0xc]
	ldrb r1, [r7, #2]
	str r1, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #0
	bl sub_806CA88
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806FFB0: .4byte 0x000005BF
_0806FFB4: .4byte gUnknown_080DF7E8
_0806FFB8: .4byte 0x000005C1
_0806FFBC: .4byte 0x000005C2
_0806FFC0: .4byte 0x000005C3
_0806FFC4: .4byte 0x000005C4

	thumb_func_start sub_806FFC8
sub_806FFC8: @ 0x0806FFC8
	push {r4, r5, r6, r7, lr}
	ldr r0, _08070064 @ =gCurTask
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r7, r0
	ldr r6, [r4]
	ldr r1, _08070068 @ =0x000005BA
	adds r0, r6, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _0806FFE6
	bl sub_8070078
_0806FFE6:
	ldr r0, _0807006C @ =0x000005BF
	adds r5, r6, r0
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _08070002
	ldr r1, _08070070 @ =IWRAM_START + 0xC4
	adds r0, r7, r1
	bl sub_80051E8
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08070012
_08070002:
	movs r1, #0xb8
	lsls r1, r1, #3
	adds r0, r6, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0807001A
_08070012:
	adds r0, r4, #0
	adds r0, #0xf4
	bl sub_80051E8
_0807001A:
	movs r1, #0x92
	lsls r1, r1, #1
	adds r0, r4, r1
	bl sub_80051E8
	movs r1, #0xaa
	lsls r1, r1, #1
	adds r0, r4, r1
	bl sub_80051E8
	ldr r0, _08070074 @ =0x000005C2
	adds r5, r6, r0
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _08070044
	movs r1, #0xc2
	lsls r1, r1, #1
	adds r0, r4, r1
	bl sub_80051E8
_08070044:
	ldrh r0, [r5]
	cmp r0, #0
	beq _08070054
	movs r1, #0xda
	lsls r1, r1, #1
	adds r0, r4, r1
	bl sub_80051E8
_08070054:
	movs r1, #0xf2
	lsls r1, r1, #1
	adds r0, r4, r1
	bl sub_80051E8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070064: .4byte gCurTask
_08070068: .4byte 0x000005BA
_0807006C: .4byte 0x000005BF
_08070070: .4byte IWRAM_START + 0xC4
_08070074: .4byte 0x000005C2

	thumb_func_start sub_8070078
sub_8070078: @ 0x08070078
	push {r4, r5, r6, r7, lr}
	ldr r0, _08070148 @ =gCurTask
	ldr r0, [r0]
	ldrh r6, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r6, r0
	ldr r5, [r0]
	ldr r1, _0807014C @ =0x000005BF
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	ldr r4, _08070150 @ =gUnknown_080DF7E8
	adds r1, r0, r4
	ldr r3, _08070154 @ =IWRAM_START + 0xC4
	adds r2, r6, r3
	ldrh r0, [r1]
	movs r7, #0
	strh r0, [r2, #0xa]
	ldrh r1, [r1, #2]
	adds r3, #0x20
	adds r0, r6, r3
	strb r1, [r0]
	adds r0, r2, #0
	bl sub_8004558
	movs r1, #0xb8
	lsls r1, r1, #3
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r4
	ldr r3, _08070158 @ =IWRAM_START + 0xF4
	adds r2, r6, r3
	ldrh r0, [r1]
	strh r0, [r2, #0xa]
	ldrh r1, [r1, #2]
	adds r3, #0x20
	adds r0, r6, r3
	strb r1, [r0]
	adds r0, r2, #0
	bl sub_8004558
	ldr r1, _0807015C @ =0x000005C1
	adds r0, r5, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r1, r0, r4
	ldr r3, _08070160 @ =IWRAM_START + 0x124
	adds r2, r6, r3
	ldrh r0, [r1]
	strh r0, [r2, #0xa]
	ldrh r1, [r1, #2]
	ldr r4, _08070164 @ =IWRAM_START + 0x144
	adds r0, r6, r4
	strb r1, [r0]
	adds r0, r2, #0
	bl sub_8004558
	ldr r0, _08070168 @ =0x000005C5
	adds r3, r5, r0
	movs r0, #0
	ldrsb r0, [r3, r0]
	cmp r0, #0
	bne _08070180
	ldr r1, _0807016C @ =0x000005A4
	adds r0, r5, r1
	ldr r2, _08070170 @ =0x000005A6
	adds r1, r5, r2
	movs r4, #0
	ldrsh r2, [r0, r4]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r2, r0
	blt _080701CA
	movs r4, #1
	strb r4, [r3]
	movs r0, #0x35
	bl m4aSongNumStart
	ldr r1, _08070174 @ =0x000005C7
	adds r0, r5, r1
	strb r4, [r0]
	movs r2, #0xb9
	lsls r2, r2, #3
	adds r1, r5, r2
	movs r0, #0x78
	strb r0, [r1]
	ldr r3, _08070178 @ =IWRAM_START + 0x154
	adds r2, r6, r3
	movs r0, #0xde
	lsls r0, r0, #2
	strh r0, [r2, #0xa]
	ldr r1, _0807017C @ =IWRAM_START + 0x174
	adds r0, r6, r1
	strb r4, [r0]
	b _080701A6
	.align 2, 0
_08070148: .4byte gCurTask
_0807014C: .4byte 0x000005BF
_08070150: .4byte gUnknown_080DF7E8
_08070154: .4byte IWRAM_START + 0xC4
_08070158: .4byte IWRAM_START + 0xF4
_0807015C: .4byte 0x000005C1
_08070160: .4byte IWRAM_START + 0x124
_08070164: .4byte IWRAM_START + 0x144
_08070168: .4byte 0x000005C5
_0807016C: .4byte 0x000005A4
_08070170: .4byte 0x000005A6
_08070174: .4byte 0x000005C7
_08070178: .4byte IWRAM_START + 0x154
_0807017C: .4byte IWRAM_START + 0x174
_08070180:
	ldr r2, _080701B0 @ =0x000005A4
	adds r0, r5, r2
	ldr r4, _080701B4 @ =0x000005A6
	adds r1, r5, r4
	movs r4, #0
	ldrsh r2, [r0, r4]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r2, r0
	bge _080701C0
	strb r7, [r3]
	ldr r0, _080701B8 @ =IWRAM_START + 0x154
	adds r2, r6, r0
	movs r0, #0xde
	lsls r0, r0, #2
	strh r0, [r2, #0xa]
	ldr r1, _080701BC @ =IWRAM_START + 0x174
	adds r0, r6, r1
	strb r7, [r0]
_080701A6:
	adds r0, r2, #0
	bl sub_8004558
	b _080701CA
	.align 2, 0
_080701B0: .4byte 0x000005A4
_080701B4: .4byte 0x000005A6
_080701B8: .4byte IWRAM_START + 0x154
_080701BC: .4byte IWRAM_START + 0x174
_080701C0:
	ldr r3, _080701D0 @ =IWRAM_START + 0x154
	adds r2, r6, r3
	adds r0, r2, #0
	bl sub_8004558
_080701CA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080701D0: .4byte IWRAM_START + 0x154

	thumb_func_start sub_80701D4
sub_80701D4: @ 0x080701D4
	push {r4, r5, r6, lr}
	sub sp, #0x3c
	adds r5, r0, #0
	movs r0, #0x9d
	lsls r0, r0, #2
	adds r6, r5, r0
	ldr r0, _08070270 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldrb r4, [r0, #6]
	subs r4, #1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	ldr r1, _08070274 @ =gUnknown_080DF8F0
	add r0, sp, #0x18
	movs r2, #0x24
	bl memcpy
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #1
	mov r0, sp
	adds r0, r0, r1
	adds r0, #0x18
	ldrh r2, [r0]
	mov r0, sp
	adds r0, #0x1a
	adds r0, r0, r1
	ldrh r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #5
	str r0, [sp]
	movs r0, #0x78
	str r0, [sp, #4]
	movs r0, #0x50
	str r0, [sp, #8]
	movs r4, #0
	str r4, [sp, #0xc]
	add r0, sp, #0x1c
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [sp, #0x10]
	str r4, [sp, #0x14]
	adds r0, r6, #0
	movs r1, #1
	bl sub_806CA88
	ldr r0, _08070278 @ =0x040000D4
	ldr r2, _0807027C @ =gObjPalette + 0x1F2
	str r2, [r0]
	movs r3, #0xab
	lsls r3, r3, #2
	adds r1, r5, r3
	str r1, [r0, #4]
	ldr r3, _08070280 @ =0x80000003
	str r3, [r0, #8]
	ldr r1, [r0, #8]
	adds r2, #6
	str r2, [r0]
	ldr r2, _08070284 @ =0x000002B2
	adds r1, r5, r2
	str r1, [r0, #4]
	str r3, [r0, #8]
	ldr r0, [r0, #8]
	ldr r3, _08070288 @ =0x000002A9
	adds r5, r5, r3
	movs r0, #1
	strb r0, [r5]
	bl m4aMPlayAllStop
	movs r0, #0x8e
	bl m4aSongNumStart
	add sp, #0x3c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070270: .4byte gLoadedSaveGame
_08070274: .4byte gUnknown_080DF8F0
_08070278: .4byte 0x040000D4
_0807027C: .4byte gObjPalette + 0x1F2
_08070280: .4byte 0x80000003
_08070284: .4byte 0x000002B2
_08070288: .4byte 0x000002A9

	thumb_func_start sub_807028C
sub_807028C: @ 0x0807028C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	adds r7, r0, #0
	ldr r2, [r7]
	ldr r0, _08070310 @ =gLoadedSaveGame
	ldr r0, [r0]
	ldr r3, _08070314 @ =0x000005B6
	adds r1, r2, r3
	ldrb r4, [r1]
	adds r0, #0xc
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp, #0x18]
	ldr r1, _08070318 @ =gUnknown_03005B5C
	ldr r6, _0807031C @ =0x000005D4
	adds r0, r2, r6
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _08070320 @ =gUnknown_03005B58
	movs r6, #0
	str r6, [r0]
	ldr r0, _08070324 @ =0x000005C5
	adds r2, r2, r0
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	cmp r2, #0
	beq _08070330
	adds r0, r7, #4
	ldr r3, _08070328 @ =0x0000037D
	str r6, [sp]
	movs r5, #0x98
	lsls r5, r5, #1
	str r5, [sp, #4]
	movs r1, #0x20
	str r1, [sp, #8]
	str r6, [sp, #0xc]
	movs r1, #1
	str r1, [sp, #0x10]
	str r6, [sp, #0x14]
	movs r2, #0x28
	bl sub_806CA88
	adds r0, r7, #0
	adds r0, #0x34
	ldr r1, _0807032C @ =gUnknown_080DF880
	lsls r4, r4, #3
	adds r4, r4, r1
	ldrh r2, [r4, #4]
	ldrh r3, [r4]
	str r6, [sp]
	str r5, [sp, #4]
	movs r1, #0x18
	str r1, [sp, #8]
	str r6, [sp, #0xc]
	ldrb r1, [r4, #2]
	str r1, [sp, #0x10]
	str r6, [sp, #0x14]
	movs r1, #1
	bl sub_806CA88
	b _0807034E
	.align 2, 0
_08070310: .4byte gLoadedSaveGame
_08070314: .4byte 0x000005B6
_08070318: .4byte gUnknown_03005B5C
_0807031C: .4byte 0x000005D4
_08070320: .4byte gUnknown_03005B58
_08070324: .4byte 0x000005C5
_08070328: .4byte 0x0000037D
_0807032C: .4byte gUnknown_080DF880
_08070330:
	adds r0, r7, #4
	ldr r3, _080704EC @ =0x0000037D
	str r2, [sp]
	movs r1, #0x98
	lsls r1, r1, #1
	str r1, [sp, #4]
	movs r1, #0x20
	str r1, [sp, #8]
	str r2, [sp, #0xc]
	str r2, [sp, #0x10]
	str r2, [sp, #0x14]
	movs r1, #1
	movs r2, #0x20
	bl sub_806CA88
_0807034E:
	movs r1, #0xda
	lsls r1, r1, #1
	adds r0, r7, r1
	ldr r6, _080704F0 @ =0x0000037E
	movs r4, #0
	str r4, [sp]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r5, r2, #0
	movs r1, #0x30
	orrs r1, r5
	str r1, [sp, #4]
	movs r1, #0x48
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r4, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #1
	movs r2, #0x16
	adds r3, r6, #0
	bl sub_806CA88
	movs r3, #0xf2
	lsls r3, r3, #1
	adds r0, r7, r3
	str r4, [sp]
	movs r1, #0x30
	orrs r1, r5
	str r1, [sp, #4]
	movs r1, #0x5c
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	movs r1, #1
	str r1, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r2, #0x16
	adds r3, r6, #0
	bl sub_806CA88
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r7, r1
	str r4, [sp]
	movs r1, #0x30
	orrs r1, r5
	str r1, [sp, #4]
	movs r1, #0x70
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	movs r1, #2
	str r1, [sp, #0x10]
	str r4, [sp, #0x14]
	movs r1, #1
	movs r2, #0x16
	adds r3, r6, #0
	bl sub_806CA88
	movs r2, #0
	movs r0, #0x9e
	lsls r0, r0, #0x10
	mov sb, r0
	movs r0, #0x9e
	lsls r0, r0, #0x10
	mov sl, r0
	movs r0, #0x9e
	lsls r0, r0, #0x10
	str r0, [sp, #0x1c]
	ldr r6, _080704F4 @ =gUnknown_080DF7E8
	movs r5, #0
	ldrb r3, [r6, #2]
	mov r8, r3
_080703DC:
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	movs r1, #0x91
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r7, r0
	str r5, [sp]
	lsls r2, r4, #3
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r2, r3
	mov r3, sb
	asrs r1, r3, #0x10
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [sp, #4]
	movs r1, #0x58
	str r1, [sp, #8]
	str r5, [sp, #0xc]
	mov r1, r8
	str r1, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #1
	ldrh r2, [r6, #4]
	ldrh r3, [r6]
	bl sub_806CA88
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r2, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #4
	ble _080703DC
	movs r2, #0
	ldr r6, _080704F4 @ =gUnknown_080DF7E8
	movs r5, #0
	ldrb r3, [r6, #2]
	mov r8, r3
_08070430:
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	movs r1, #0xcd
	lsls r1, r1, #2
	adds r0, r0, r1
	adds r0, r7, r0
	str r5, [sp]
	lsls r2, r4, #3
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r2, r3
	mov r3, sl
	asrs r1, r3, #0x10
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [sp, #4]
	movs r1, #0x6c
	str r1, [sp, #8]
	str r5, [sp, #0xc]
	mov r1, r8
	str r1, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #1
	ldrh r2, [r6, #4]
	ldrh r3, [r6]
	bl sub_806CA88
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r2, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #4
	ble _08070430
	movs r2, #0
	ldr r6, _080704F4 @ =gUnknown_080DF7E8
	movs r5, #0
	ldrb r3, [r6, #2]
	mov r8, r3
_08070484:
	lsls r4, r2, #0x10
	asrs r4, r4, #0x10
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #4
	ldr r1, _080704F8 @ =0x00000424
	adds r0, r0, r1
	adds r0, r7, r0
	str r5, [sp]
	lsls r2, r4, #3
	movs r3, #0x80
	lsls r3, r3, #1
	adds r2, r2, r3
	ldr r3, [sp, #0x1c]
	asrs r1, r3, #0x10
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	str r1, [sp, #4]
	movs r1, #0x80
	str r1, [sp, #8]
	str r5, [sp, #0xc]
	mov r1, r8
	str r1, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #1
	ldrh r2, [r6, #4]
	ldrh r3, [r6]
	bl sub_806CA88
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r2, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #4
	ble _08070484
	movs r2, #0
	movs r5, #0
_080704D0:
	lsls r2, r2, #0x10
	asrs r3, r2, #0x10
	ldr r1, [sp, #0x18]
	asrs r1, r3
	movs r0, #1
	ands r1, r0
	adds r4, r2, #0
	cmp r1, #0
	beq _08070500
	lsls r1, r3, #3
	ldr r0, _080704FC @ =gUnknown_080DF8A8
	adds r2, r1, r0
	b _08070502
	.align 2, 0
_080704EC: .4byte 0x0000037D
_080704F0: .4byte 0x0000037E
_080704F4: .4byte gUnknown_080DF7E8
_080704F8: .4byte 0x00000424
_080704FC: .4byte gUnknown_080DF8A8
_08070500:
	ldr r2, _0807057C @ =gUnknown_080DF8E0
_08070502:
	asrs r4, r4, #0x10
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r0, r1, #4
	adds r0, #0x64
	adds r0, r7, r0
	ldrh r3, [r2]
	str r5, [sp]
	lsls r1, r1, #0x13
	movs r6, #0x92
	lsls r6, r6, #0x11
	adds r1, r1, r6
	asrs r1, r1, #0x10
	str r1, [sp, #4]
	movs r1, #0x34
	str r1, [sp, #8]
	str r5, [sp, #0xc]
	ldrb r1, [r2, #2]
	str r1, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #1
	movs r2, #9
	bl sub_806CA88
	adds r4, #1
	lsls r4, r4, #0x10
	lsrs r2, r4, #0x10
	asrs r4, r4, #0x10
	cmp r4, #6
	ble _080704D0
	ldr r0, _08070580 @ =0x00000514
	adds r1, r7, r0
	movs r0, #0
	strh r0, [r1]
	ldr r1, _08070584 @ =0x00000516
	adds r0, r7, r1
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0]
	movs r2, #0xa3
	lsls r2, r2, #3
	adds r0, r7, r2
	strh r1, [r0]
	ldr r3, _08070588 @ =0x0000051A
	adds r0, r7, r3
	strh r1, [r0]
	ldr r6, _0807058C @ =0x0000051C
	adds r0, r7, r6
	strh r1, [r0]
	adds r2, #6
	adds r0, r7, r2
	strh r1, [r0]
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807057C: .4byte gUnknown_080DF8E0
_08070580: .4byte 0x00000514
_08070584: .4byte 0x00000516
_08070588: .4byte 0x0000051A
_0807058C: .4byte 0x0000051C

	thumb_func_start sub_8070590
sub_8070590: @ 0x08070590
	push {r4, r5, lr}
	ldr r5, _08070610 @ =gCurTask
	ldr r0, [r5]
	ldrh r0, [r0, #6]
	ldr r1, _08070614 @ =IWRAM_START + 0x514
	adds r4, r0, r1
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0xb
	bgt _080705A8
	bl sub_807061C
_080705A8:
	ldrh r0, [r4]
	subs r0, #8
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xb
	bhi _080705BA
	asrs r0, r1, #0x10
	bl sub_8070680
_080705BA:
	ldrh r0, [r4]
	subs r0, #0x10
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xb
	bhi _080705CC
	asrs r0, r1, #0x10
	bl sub_80706D8
_080705CC:
	ldrh r0, [r4]
	subs r0, #0x18
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xb
	bhi _080705DE
	asrs r0, r1, #0x10
	bl sub_8070740
_080705DE:
	ldrh r0, [r4]
	subs r0, #0x20
	lsls r1, r0, #0x10
	lsrs r0, r1, #0x10
	cmp r0, #0xb
	bhi _080705F0
	asrs r0, r1, #0x10
	bl sub_80707A8
_080705F0:
	bl sub_807087C
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x2b
	ble _08070608
	ldr r1, [r5]
	ldr r0, _08070618 @ =sub_8070EF0
	str r0, [r1, #8]
_08070608:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08070610: .4byte gCurTask
_08070614: .4byte IWRAM_START + 0x514
_08070618: .4byte sub_8070EF0

	thumb_func_start sub_807061C
sub_807061C: @ 0x0807061C
	push {r4, r5, lr}
	ldr r1, _08070660 @ =gCurTask
	ldr r1, [r1]
	ldrh r4, [r1, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r4, r1
	ldr r2, [r1]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xb
	subs r1, r1, r0
	movs r0, #0x16
	muls r1, r0, r1
	ldr r0, _08070664 @ =IWRAM_START + 0x516
	adds r5, r4, r0
	strh r1, [r5]
	ldr r0, _08070668 @ =IWRAM_START+4
	adds r3, r4, r0
	ldr r0, _0807066C @ =0x000005C5
	adds r2, r2, r0
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _08070674
	adds r0, r1, #0
	adds r0, #0x4c
	strh r0, [r3, #0x16]
	ldr r0, _08070670 @ =IWRAM_START + 0x34
	adds r3, r4, r0
	ldrh r0, [r5]
	adds r0, #4
	b _08070678
	.align 2, 0
_08070660: .4byte gCurTask
_08070664: .4byte IWRAM_START + 0x516
_08070668: .4byte IWRAM_START+4
_0807066C: .4byte 0x000005C5
_08070670: .4byte IWRAM_START + 0x34
_08070674:
	adds r0, r1, #0
	adds r0, #0x30
_08070678:
	strh r0, [r3, #0x16]
	pop {r4, r5}
	pop {r0}
	bx r0

	thumb_func_start sub_8070680
sub_8070680: @ 0x08070680
	push {r4, r5, lr}
	ldr r1, _080706D0 @ =gCurTask
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xb
	subs r1, r1, r0
	movs r0, #0x16
	muls r1, r0, r1
	ldr r3, _080706D4 @ =IWRAM_START + 0x518
	adds r0, r2, r3
	strh r1, [r0]
	movs r0, #0
	adds r4, r2, r3
_080706A4:
	lsls r2, r0, #0x10
	asrs r2, r2, #0x10
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r3, r1, #4
	adds r3, #0x64
	adds r3, r5, r3
	lsls r1, r1, #3
	ldrh r0, [r4]
	adds r0, #0x24
	adds r1, r1, r0
	strh r1, [r3, #0x16]
	adds r2, #1
	lsls r2, r2, #0x10
	lsrs r0, r2, #0x10
	asrs r2, r2, #0x10
	cmp r2, #6
	ble _080706A4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080706D0: .4byte gCurTask
_080706D4: .4byte IWRAM_START + 0x518

	thumb_func_start sub_80706D8
sub_80706D8: @ 0x080706D8
	push {r4, r5, r6, lr}
	ldr r1, _08070734 @ =gCurTask
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xb
	subs r1, r1, r0
	movs r0, #0x16
	muls r0, r1, r0
	ldr r3, _08070738 @ =IWRAM_START + 0x51A
	adds r1, r2, r3
	strh r0, [r1]
	ldr r1, _0807073C @ =IWRAM_START + 0x1B4
	adds r3, r2, r1
	adds r0, #0x30
	strh r0, [r3, #0x16]
	movs r0, #0
	movs r6, #0x91
	lsls r6, r6, #2
	ldr r3, _08070738 @ =IWRAM_START + 0x51A
	adds r4, r2, r3
_0807070A:
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r6
	adds r3, r5, r0
	lsls r2, r1, #3
	ldrh r0, [r4]
	adds r0, #0x9e
	adds r2, r2, r0
	strh r2, [r3, #0x16]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	ble _0807070A
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070734: .4byte gCurTask
_08070738: .4byte IWRAM_START + 0x51A
_0807073C: .4byte IWRAM_START + 0x1B4

	thumb_func_start sub_8070740
sub_8070740: @ 0x08070740
	push {r4, r5, r6, lr}
	ldr r1, _0807079C @ =gCurTask
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xb
	subs r1, r1, r0
	movs r0, #0x16
	muls r0, r1, r0
	ldr r3, _080707A0 @ =IWRAM_START + 0x51C
	adds r1, r2, r3
	strh r0, [r1]
	ldr r1, _080707A4 @ =IWRAM_START + 0x1E4
	adds r3, r2, r1
	adds r0, #0x30
	strh r0, [r3, #0x16]
	movs r0, #0
	movs r6, #0xcd
	lsls r6, r6, #2
	ldr r3, _080707A0 @ =IWRAM_START + 0x51C
	adds r4, r2, r3
_08070772:
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r6
	adds r3, r5, r0
	lsls r2, r1, #3
	ldrh r0, [r4]
	adds r0, #0x9e
	adds r2, r2, r0
	strh r2, [r3, #0x16]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	ble _08070772
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807079C: .4byte gCurTask
_080707A0: .4byte IWRAM_START + 0x51C
_080707A4: .4byte IWRAM_START + 0x1E4

	thumb_func_start sub_80707A8
sub_80707A8: @ 0x080707A8
	push {r4, r5, r6, lr}
	ldr r1, _08070804 @ =gCurTask
	ldr r1, [r1]
	ldrh r2, [r1, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r5, r2, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	movs r1, #0xb
	subs r1, r1, r0
	movs r0, #0x16
	muls r0, r1, r0
	ldr r3, _08070808 @ =IWRAM_START + 0x51E
	adds r1, r2, r3
	strh r0, [r1]
	ldr r1, _0807080C @ =IWRAM_START + 0x214
	adds r3, r2, r1
	adds r0, #0x30
	strh r0, [r3, #0x16]
	movs r0, #0
	ldr r6, _08070810 @ =0x00000424
	ldr r3, _08070808 @ =IWRAM_START + 0x51E
	adds r4, r2, r3
_080707D8:
	lsls r1, r0, #0x10
	asrs r1, r1, #0x10
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, r0, r6
	adds r3, r5, r0
	lsls r2, r1, #3
	ldrh r0, [r4]
	adds r0, #0x9e
	adds r2, r2, r0
	strh r2, [r3, #0x16]
	adds r1, #1
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #4
	ble _080707D8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070804: .4byte gCurTask
_08070808: .4byte IWRAM_START + 0x51E
_0807080C: .4byte IWRAM_START + 0x214
_08070810: .4byte 0x00000424

	thumb_func_start sub_8070814
sub_8070814: @ 0x08070814
	push {r4, r5, r6, r7, lr}
	ldr r7, _0807086C @ =gCurTask
	ldr r0, [r7]
	ldrh r4, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r4, r0
	ldr r0, [r6]
	movs r1, #0xb7
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r5, [r0]
	bl sub_807087C
	ldr r0, _08070870 @ =IWRAM_START + 0x514
	adds r4, r4, r0
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xb
	ble _08070864
	adds r1, r5, #0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x64
	adds r0, r6, r0
	ldr r2, _08070874 @ =gUnknown_080DF8A8
	lsls r1, r1, #3
	adds r1, r1, r2
	ldrh r2, [r1]
	strh r2, [r0, #0xa]
	ldrh r1, [r1, #2]
	adds r0, #0x20
	strb r1, [r0]
	ldr r1, [r7]
	ldr r0, _08070878 @ =sub_8070EE4
	str r0, [r1, #8]
_08070864:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807086C: .4byte gCurTask
_08070870: .4byte IWRAM_START + 0x514
_08070874: .4byte gUnknown_080DF8A8
_08070878: .4byte sub_8070EE4

	thumb_func_start sub_807087C
sub_807087C: @ 0x0807087C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x28
	ldr r0, _08070B74 @ =gCurTask
	ldr r0, [r0]
	ldrh r7, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r0, r7
	mov sl, r0
	ldr r0, [r0]
	mov r8, r0
	movs r0, #0xb5
	lsls r0, r0, #3
	add r0, r8
	ldr r5, [r0]
	ldr r0, _08070B78 @ =0x000005AC
	add r0, r8
	ldr r0, [r0]
	mov sb, r0
	movs r0, #0xb6
	lsls r0, r0, #3
	add r0, r8
	ldr r0, [r0]
	str r0, [sp, #0x24]
	mov r4, sp
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	strh r0, [r4, #8]
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	mov r5, sp
	movs r1, #0xa
	bl __modsi3
	strh r0, [r5, #6]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	mov r5, sp
	movs r1, #0xa
	bl __modsi3
	strh r0, [r5, #4]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	mov r5, sp
	movs r1, #0xa
	bl __modsi3
	strh r0, [r5, #2]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	mov r4, sp
	movs r1, #0xa
	bl __modsi3
	strh r0, [r4]
	add r6, sp, #0xc
	mov r0, sb
	movs r1, #0xa
	bl __modsi3
	strh r0, [r6, #8]
	mov r0, sb
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	movs r1, #0xa
	bl __modsi3
	strh r0, [r6, #6]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	movs r1, #0xa
	bl __modsi3
	strh r0, [r6, #4]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	movs r1, #0xa
	bl __modsi3
	strh r0, [r6, #2]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	strh r0, [r6]
	add r5, sp, #0x18
	ldr r0, [sp, #0x24]
	movs r1, #0xa
	bl __modsi3
	strh r0, [r5, #8]
	ldr r0, [sp, #0x24]
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	movs r1, #0xa
	bl __modsi3
	strh r0, [r5, #6]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	movs r1, #0xa
	bl __modsi3
	strh r0, [r5, #4]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	movs r1, #0xa
	bl __modsi3
	strh r0, [r5, #2]
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	strh r0, [r5]
	ldr r1, _08070B7C @ =IWRAM_START+4
	adds r0, r7, r1
	bl sub_80051E8
	ldr r2, _08070B80 @ =0x000005C5
	add r8, r2
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	mov sb, r6
	cmp r0, #0
	beq _080709D2
	ldr r2, _08070B84 @ =IWRAM_START + 0x34
	adds r0, r7, r2
	bl sub_80051E8
_080709D2:
	movs r6, #0
_080709D4:
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #4
	adds r4, #0x64
	add r4, sl
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
	adds r5, #1
	lsls r5, r5, #0x10
	lsrs r6, r5, #0x10
	asrs r5, r5, #0x10
	cmp r5, #6
	ble _080709D4
	movs r0, #0xda
	lsls r0, r0, #1
	add r0, sl
	bl sub_80051E8
	movs r0, #0xf2
	lsls r0, r0, #1
	add r0, sl
	bl sub_80051E8
	movs r0, #0x85
	lsls r0, r0, #2
	add r0, sl
	bl sub_80051E8
	movs r6, #0
	movs r7, #0
	ldr r0, _08070B88 @ =gUnknown_080DF7E8
	mov r8, r0
_08070A20:
	lsls r5, r6, #0x10
	cmp r7, #0
	bne _08070A38
	asrs r1, r5, #0x10
	lsls r0, r1, #1
	add r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _08070A38
	cmp r1, #4
	bne _08070A76
_08070A38:
	movs r7, #1
	asrs r0, r5, #0x10
	lsls r1, r0, #1
	adds r0, r1, r0
	lsls r0, r0, #4
	movs r2, #0x91
	lsls r2, r2, #2
	adds r0, r0, r2
	mov r2, sl
	adds r4, r2, r0
	add r1, sp
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r4, #0xa]
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r0, #2]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_08070A76:
	lsls r0, r6, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08070A20
	movs r6, #0
	movs r7, #0
	ldr r2, _08070B88 @ =gUnknown_080DF7E8
	mov r8, r2
_08070A8E:
	lsls r5, r6, #0x10
	cmp r7, #0
	bne _08070AA6
	asrs r1, r5, #0x10
	lsls r0, r1, #1
	add r0, sb
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _08070AA6
	cmp r1, #4
	bne _08070AE4
_08070AA6:
	movs r7, #1
	asrs r0, r5, #0x10
	lsls r1, r0, #1
	adds r0, r1, r0
	lsls r0, r0, #4
	movs r2, #0xcd
	lsls r2, r2, #2
	adds r0, r0, r2
	mov r2, sl
	adds r4, r2, r0
	add r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r4, #0xa]
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r0, #2]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_08070AE4:
	lsls r0, r6, #0x10
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r0, r1
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08070A8E
	movs r6, #0
	movs r7, #0
	ldr r2, _08070B88 @ =gUnknown_080DF7E8
	mov r8, r2
_08070AFC:
	lsls r5, r6, #0x10
	cmp r7, #0
	bne _08070B16
	asrs r1, r5, #0x10
	lsls r0, r1, #1
	add r0, sp
	adds r0, #0x18
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bne _08070B16
	cmp r1, #4
	bne _08070B54
_08070B16:
	movs r7, #1
	asrs r0, r5, #0x10
	lsls r1, r0, #1
	adds r0, r1, r0
	lsls r0, r0, #4
	ldr r2, _08070B8C @ =0x00000424
	adds r0, r0, r2
	mov r2, sl
	adds r4, r2, r0
	add r1, sp
	adds r1, #0x18
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	add r0, r8
	ldrh r0, [r0]
	strh r0, [r4, #0xa]
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	add r0, r8
	ldrh r1, [r0, #2]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8004558
	adds r0, r4, #0
	bl sub_80051E8
_08070B54:
	movs r1, #0x80
	lsls r1, r1, #9
	adds r0, r5, r1
	lsrs r6, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	ble _08070AFC
	add sp, #0x28
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08070B74: .4byte gCurTask
_08070B78: .4byte 0x000005AC
_08070B7C: .4byte IWRAM_START+4
_08070B80: .4byte 0x000005C5
_08070B84: .4byte IWRAM_START + 0x34
_08070B88: .4byte gUnknown_080DF7E8
_08070B8C: .4byte 0x00000424

	thumb_func_start sub_8070B90
sub_8070B90: @ 0x08070B90
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08070BD8 @ =sub_806FB04
	movs r1, #0xae
	lsls r1, r1, #2
	movs r2, #0xd0
	lsls r2, r2, #8
	ldr r3, _08070BDC @ =sub_8070BEC
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	adds r4, r0, #0
	ldrh r3, [r4, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r3, r0
	str r5, [r0]
	ldr r2, _08070BE0 @ =IWRAM_START + 0x2A4
	adds r1, r3, r2
	movs r2, #0
	str r2, [r1]
	ldr r5, _08070BE4 @ =IWRAM_START + 0x2A8
	adds r1, r3, r5
	strb r2, [r1]
	ldr r1, _08070BE8 @ =IWRAM_START + 0x2A9
	adds r3, r3, r1
	strb r2, [r3]
	bl sub_8070C3C
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08070BD8: .4byte sub_806FB04
_08070BDC: .4byte sub_8070BEC
_08070BE0: .4byte IWRAM_START + 0x2A4
_08070BE4: .4byte IWRAM_START + 0x2A8
_08070BE8: .4byte IWRAM_START + 0x2A9

	thumb_func_start sub_8070BEC
sub_8070BEC: @ 0x08070BEC
	bx lr
	.align 2, 0

	thumb_func_start sub_8070BF0
sub_8070BF0: @ 0x08070BF0
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _08070C24 @ =sub_8070590
	movs r1, #0xa4
	lsls r1, r1, #3
	movs r2, #0xd0
	lsls r2, r2, #8
	ldr r3, _08070C28 @ =sub_8070C2C
	str r3, [sp]
	movs r3, #0
	bl TaskCreate
	adds r4, r0, #0
	ldrh r0, [r4, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	str r5, [r0]
	bl sub_807028C
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08070C24: .4byte sub_8070590
_08070C28: .4byte sub_8070C2C

	thumb_func_start sub_8070C2C
sub_8070C2C: @ 0x08070C2C
	bx lr
	.align 2, 0

	thumb_func_start sub_8070C30
sub_8070C30: @ 0x08070C30
	ldr r1, [r0, #0x10]
	ldr r0, _08070C38 @ =sub_8070E88
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_08070C38: .4byte sub_8070E88

	thumb_func_start sub_8070C3C
sub_8070C3C: @ 0x08070C3C
	push {r4, lr}
	adds r4, r0, #0
	bl sub_806FBD0
	adds r0, r4, #0
	bl sub_806FE2C
	adds r0, r4, #0
	bl sub_8070CD8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8070C58
sub_8070C58: @ 0x08070C58
	push {r4, r5, r6, lr}
	ldr r0, _08070CB8 @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r5, r0
	ldr r4, [r0]
	ldr r1, _08070CBC @ =0x000005BA
	adds r0, r4, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08070C76
	bl sub_806FCF8
_08070C76:
	ldr r1, _08070CC0 @ =IWRAM_START+4
	adds r0, r5, r1
	bl sub_80051E8
	ldr r0, _08070CC4 @ =0x000005BB
	adds r6, r4, r0
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _08070C92
	ldr r1, _08070CC8 @ =IWRAM_START + 0x34
	adds r0, r5, r1
	bl sub_80051E8
_08070C92:
	ldr r1, _08070CCC @ =0x000005BC
	adds r0, r4, r1
	ldrb r1, [r6]
	ldrb r0, [r0]
	orrs r1, r0
	cmp r1, #0
	beq _08070CA8
	ldr r1, _08070CD0 @ =IWRAM_START + 0x64
	adds r0, r5, r1
	bl sub_80051E8
_08070CA8:
	ldr r1, _08070CD4 @ =IWRAM_START + 0x94
	adds r0, r5, r1
	bl sub_80051E8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070CB8: .4byte gCurTask
_08070CBC: .4byte 0x000005BA
_08070CC0: .4byte IWRAM_START+4
_08070CC4: .4byte 0x000005BB
_08070CC8: .4byte IWRAM_START + 0x34
_08070CCC: .4byte 0x000005BC
_08070CD0: .4byte IWRAM_START + 0x64
_08070CD4: .4byte IWRAM_START + 0x94

	thumb_func_start sub_8070CD8
sub_8070CD8: @ 0x08070CD8
	push {r4, lr}
	sub sp, #0x18
	ldr r4, _08070D10 @ =gUnknown_080DF840
	movs r1, #0x85
	lsls r1, r1, #2
	adds r0, r0, r1
	ldrh r2, [r4, #4]
	ldrh r3, [r4]
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0x70
	str r1, [sp, #4]
	movs r1, #0x64
	str r1, [sp, #8]
	movs r1, #2
	str r1, [sp, #0xc]
	ldrb r1, [r4, #2]
	str r1, [sp, #0x10]
	movs r1, #0
	str r1, [sp, #0x14]
	bl sub_806CA88
	add sp, #0x18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08070D10: .4byte gUnknown_080DF840

	thumb_func_start sub_8070D14
sub_8070D14: @ 0x08070D14
	push {r4, r5, lr}
	ldr r0, _08070D68 @ =gCurTask
	ldr r0, [r0]
	ldrh r2, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r0, r2, r0
	ldr r3, [r0]
	ldr r0, [r3, #0xc]
	ldrh r0, [r0, #6]
	ldr r1, _08070D6C @ =IWRAM_START + 0xC0
	adds r0, r0, r1
	movs r4, #0
	ldrsh r1, [r0, r4]
	cmp r1, #1
	ble _08070D60
	lsls r1, r1, #3
	ldr r0, _08070D70 @ =gUnknown_080DF830
	adds r1, r1, r0
	ldr r5, _08070D74 @ =IWRAM_START + 0x214
	adds r4, r2, r5
	ldr r5, _08070D78 @ =0x000005BA
	adds r0, r3, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _08070D5A
	ldrh r0, [r1]
	strh r0, [r4, #0xa]
	ldrh r1, [r1, #2]
	ldr r3, _08070D7C @ =IWRAM_START + 0x234
	adds r0, r2, r3
	strb r1, [r0]
	adds r0, r4, #0
	bl sub_8004558
_08070D5A:
	adds r0, r4, #0
	bl sub_80051E8
_08070D60:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08070D68: .4byte gCurTask
_08070D6C: .4byte IWRAM_START + 0xC0
_08070D70: .4byte gUnknown_080DF830
_08070D74: .4byte IWRAM_START + 0x214
_08070D78: .4byte 0x000005BA
_08070D7C: .4byte IWRAM_START + 0x234

	thumb_func_start sub_8070D80
sub_8070D80: @ 0x08070D80
	push {r4, r5, lr}
	sub sp, #0x18
	adds r2, r0, #0
	movs r1, #0x91
	lsls r1, r1, #2
	adds r0, r2, r1
	movs r3, #0xaa
	lsls r3, r3, #2
	adds r1, r2, r3
	movs r5, #0
	movs r4, #1
	strb r4, [r1]
	movs r1, #0xa9
	lsls r1, r1, #2
	adds r2, r2, r1
	ldr r1, _08070DCC @ =gUnknown_03005B5C
	ldr r1, [r1]
	str r1, [r2]
	adds r3, #0xce
	movs r1, #0x80
	lsls r1, r1, #5
	str r1, [sp]
	movs r1, #0x78
	str r1, [sp, #4]
	movs r1, #0x50
	str r1, [sp, #8]
	str r4, [sp, #0xc]
	str r5, [sp, #0x10]
	str r5, [sp, #0x14]
	movs r1, #0
	movs r2, #0x14
	bl sub_806CA88
	add sp, #0x18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08070DCC: .4byte gUnknown_03005B5C

	thumb_func_start sub_8070DD0
sub_8070DD0: @ 0x08070DD0
	push {lr}
	movs r1, #0x91
	lsls r1, r1, #2
	adds r0, r0, r1
	bl sub_80051E8
	pop {r0}
	bx r0

	thumb_func_start sub_8070DE0
sub_8070DE0: @ 0x08070DE0
	adds r3, r0, #0
	ldr r1, _08070DFC @ =gUnknown_03005B5C
	movs r0, #0xa9
	lsls r0, r0, #2
	adds r2, r3, r0
	ldr r0, [r2]
	str r0, [r1]
	movs r1, #0
	str r1, [r2]
	movs r2, #0xaa
	lsls r2, r2, #2
	adds r0, r3, r2
	strb r1, [r0]
	bx lr
	.align 2, 0
_08070DFC: .4byte gUnknown_03005B5C

	thumb_func_start sub_8070E00
sub_8070E00: @ 0x08070E00
	push {r4, r5, r6, lr}
	adds r3, r0, #0
	movs r0, #0x9d
	lsls r0, r0, #2
	adds r5, r3, r0
	ldr r0, [r3]
	ldr r1, _08070E1C @ =0x000005C6
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	bne _08070E28
	ldr r2, _08070E20 @ =0x050003F8
	ldr r4, _08070E24 @ =0x050003F2
	b _08070E2C
	.align 2, 0
_08070E1C: .4byte 0x000005C6
_08070E20: .4byte 0x050003F8
_08070E24: .4byte 0x050003F2
_08070E28:
	ldr r2, _08070E54 @ =0x050003F2
	ldr r4, _08070E58 @ =0x050003F8
_08070E2C:
	ldr r0, _08070E5C @ =0x040000D4
	ldr r6, _08070E60 @ =0x000002B2
	adds r1, r3, r6
	str r1, [r0]
	str r2, [r0, #4]
	ldr r2, _08070E64 @ =0x80000003
	str r2, [r0, #8]
	ldr r1, [r0, #8]
	subs r6, #6
	adds r1, r3, r6
	str r1, [r0]
	str r4, [r0, #4]
	str r2, [r0, #8]
	ldr r0, [r0, #8]
	adds r0, r5, #0
	bl sub_80051E8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070E54: .4byte 0x050003F2
_08070E58: .4byte 0x050003F8
_08070E5C: .4byte 0x040000D4
_08070E60: .4byte 0x000002B2
_08070E64: .4byte 0x80000003

	thumb_func_start sub_8070E68
sub_8070E68: @ 0x08070E68
	push {lr}
	ldr r1, _08070E80 @ =0x000002A9
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	ldr r0, _08070E84 @ =gUnknown_03005B58
	str r1, [r0]
	bl m4aMPlayAllContinue
	pop {r0}
	bx r0
	.align 2, 0
_08070E80: .4byte 0x000002A9
_08070E84: .4byte gUnknown_03005B58

	thumb_func_start sub_8070E88
sub_8070E88: @ 0x08070E88
	push {r4, r5, r6, lr}
	ldr r6, _08070ED4 @ =gCurTask
	ldr r0, [r6]
	ldrh r4, [r0, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r1, r4, r1
	ldr r0, [r1]
	movs r2, #0xb7
	lsls r2, r2, #3
	adds r0, r0, r2
	ldrb r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #4
	adds r0, #0x64
	adds r1, r1, r0
	ldr r2, _08070ED8 @ =gUnknown_080DF8A8
	adds r0, r2, #0
	adds r0, #0x40
	ldrh r0, [r0]
	movs r5, #0
	strh r0, [r1, #0xa]
	adds r2, #0x42
	ldrh r0, [r2]
	adds r1, #0x20
	strb r0, [r1]
	bl sub_807087C
	ldr r0, _08070EDC @ =IWRAM_START + 0x514
	adds r4, r4, r0
	strh r5, [r4]
	ldr r1, [r6]
	ldr r0, _08070EE0 @ =sub_8070814
	str r0, [r1, #8]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070ED4: .4byte gCurTask
_08070ED8: .4byte gUnknown_080DF8A8
_08070EDC: .4byte IWRAM_START + 0x514
_08070EE0: .4byte sub_8070814

	thumb_func_start sub_8070EE4
sub_8070EE4: @ 0x08070EE4
	push {lr}
	bl sub_807087C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8070EF0
sub_8070EF0: @ 0x08070EF0
	push {lr}
	bl sub_807087C
	pop {r0}
	bx r0
	.align 2, 0

	thumb_func_start sub_8070EFC
sub_8070EFC: @ 0x08070EFC
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6]
	movs r1, #0xb7
	lsls r1, r1, #3
	adds r0, r0, r1
	ldrb r4, [r0]
	ldr r5, _08070F90 @ =gUnknown_080DF914
	adds r0, r5, #0
	bl sub_806CF44
	ldr r2, _08070F94 @ =gUnknown_03005B5C
	ldr r1, [r2]
	str r1, [r6, #0x34]
	lsls r0, r0, #0x10
	asrs r0, r0, #0xb
	adds r0, r1, r0
	str r0, [r2]
	adds r0, r6, #4
	movs r2, #7
	str r2, [sp]
	str r5, [sp, #4]
	movs r2, #0x78
	movs r3, #0x3c
	bl sub_8071380
	str r5, [r6, #0x38]
	movs r3, #0
	movs r0, #1
	strh r0, [r6, #0x3c]
	ldr r0, _08070F98 @ =gUnknown_080DF9A0
	lsls r4, r4, #3
	adds r1, r4, r0
	ldr r1, [r1]
	str r1, [r6, #0x40]
	adds r0, #4
	adds r0, r4, r0
	ldr r0, [r0]
	str r0, [r6, #0x44]
	ldr r2, _08070F9C @ =gUnknown_080DF968
	adds r0, r4, r2
	ldrh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, #2
	strh r3, [r0]
	adds r0, r2, #2
	adds r0, r4, r0
	ldrh r0, [r0]
	adds r1, r6, #0
	adds r1, #0x4e
	strh r0, [r1]
	adds r0, r2, #4
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r6, #0
	adds r0, #0x50
	strh r1, [r0]
	adds r2, #6
	adds r4, r4, r2
	ldrh r0, [r4]
	adds r1, r6, #0
	adds r1, #0x52
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x3c
	strh r0, [r1]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08070F90: .4byte gUnknown_080DF914
_08070F94: .4byte gUnknown_03005B5C
_08070F98: .4byte gUnknown_080DF9A0
_08070F9C: .4byte gUnknown_080DF968

	thumb_func_start sub_8070FA0
sub_8070FA0: @ 0x08070FA0
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x2c
	ldr r0, _08071090 @ =gCurTask
	ldr r0, [r0]
	ldrh r0, [r0, #6]
	mov r8, r0
	movs r0, #0xc0
	lsls r0, r0, #0x12
	mov r1, r8
	adds r6, r1, r0
	ldr r7, [r6]
	ldr r5, _08071094 @ =gOamBuffer + 0x3E6
	ldr r2, _08071098 @ =0x000005BA
	adds r2, r2, r7
	mov sb, r2
	ldrb r0, [r2]
	cmp r0, #0
	bne _08070FCE
	bl sub_8071478
_08070FCE:
	ldr r0, [r6, #0x40]
	str r0, [sp, #4]
	ldr r0, [r6, #0x44]
	str r0, [sp, #8]
	movs r2, #0
	str r2, [sp, #0xc]
	add r0, sp, #4
	movs r1, #0x20
	strh r1, [r0, #0xc]
	strh r1, [r0, #0xe]
	strh r2, [r0, #0x10]
	adds r1, r0, #0
	movs r0, #0x1d
	strh r0, [r1, #0x12]
	add r4, sp, #0x18
	ldr r2, [r6]
	adds r0, r4, #0
	bl sub_806CB84
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08071082
	ldrh r0, [r4, #0xc]
	strh r0, [r5]
	adds r5, #8
	ldrh r0, [r4, #0xe]
	strh r0, [r5]
	adds r5, #8
	ldrh r0, [r4, #0x10]
	strh r0, [r5]
	ldrh r0, [r4, #0x12]
	strh r0, [r5, #8]
	ldr r0, _0807109C @ =IWRAM_START + 0x48
	add r0, r8
	movs r2, #0xb4
	lsls r2, r2, #3
	adds r1, r7, r2
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	adds r0, #0x40
	ldr r2, _080710A0 @ =0x000003FF
	adds r1, r2, #0
	ands r0, r1
	lsls r3, r0, #0x10
	movs r0, #4
	ldrsh r5, [r4, r0]
	ldr r1, _080710A4 @ =0x000005CC
	adds r0, r7, r1
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r0, #0x3c
	movs r7, #5
	cmp r5, r0
	bge _0807103E
	movs r7, #0xc
_0807103E:
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0
	bne _08071060
	ldr r0, _080710A8 @ =IWRAM_START+4
	add r0, r8
	movs r2, #2
	ldrsh r1, [r4, r2]
	lsrs r3, r3, #0x17
	lsls r3, r3, #3
	ldr r2, [r6, #0x38]
	adds r2, r2, r3
	str r2, [sp]
	adds r2, r5, #0
	adds r3, r7, #0
	bl sub_8071530
_08071060:
	movs r0, #0x3c
	ldrsh r1, [r6, r0]
	cmp r1, #2
	bne _0807107C
	ldr r0, _080710AC @ =IWRAM_START + 0x4C
	add r0, r8
	ldrh r0, [r0]
	ands r1, r0
	cmp r1, #0
	beq _0807107C
	mov r1, sb
	ldrb r0, [r1]
	cmp r0, #0
	beq _08071082
_0807107C:
	adds r0, r6, #4
	bl sub_80051E8
_08071082:
	add sp, #0x2c
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071090: .4byte gCurTask
_08071094: .4byte gOamBuffer + 0x3E6
_08071098: .4byte 0x000005BA
_0807109C: .4byte IWRAM_START + 0x48
_080710A0: .4byte 0x000003FF
_080710A4: .4byte 0x000005CC
_080710A8: .4byte IWRAM_START+4
_080710AC: .4byte IWRAM_START + 0x4C

	thumb_func_start sub_80710B0
sub_80710B0: @ 0x080710B0
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	ldr r0, _0807114C @ =gCurTask
	ldr r0, [r0]
	ldrh r5, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r6, r5, r0
	ldr r0, [r6]
	ldr r0, [r0, #0xc]
	ldrh r1, [r0, #6]
	ldr r0, _08071150 @ =IWRAM_START + 0x48
	adds r0, r0, r5
	mov r8, r0
	ldrh r2, [r0]
	mov ip, r2
	mov r3, ip
	rsbs r2, r3, #0
	ldr r0, _08071154 @ =0x000003FF
	mov sl, r0
	mov r3, sl
	ands r2, r3
	ldr r0, _08071158 @ =gSineTable
	mov sb, r0
	lsls r0, r2, #1
	add r0, sb
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r7, r0, #2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	add r0, sb
	movs r2, #0
	ldrsh r3, [r0, r2]
	ldr r2, _0807115C @ =IWRAM_START + 0xA8
	adds r0, r1, r2
	ldr r2, [r0]
	ldr r0, [r6, #0x40]
	subs r2, r2, r0
	ldr r0, _08071160 @ =IWRAM_START + 0xAC
	adds r1, r1, r0
	ldr r1, [r1]
	ldr r0, [r6, #0x44]
	subs r1, r1, r0
	asrs r0, r7, #8
	asrs r1, r1, #8
	adds r4, r0, #0
	muls r4, r1, r4
	asrs r3, r3, #6
	asrs r2, r2, #8
	adds r0, r3, #0
	muls r0, r2, r0
	adds r4, r4, r0
	rsbs r0, r7, #0
	asrs r0, r0, #8
	muls r2, r0, r2
	adds r0, r3, #0
	muls r0, r1, r0
	adds r0, r2, r0
	mov r1, sb
	cmp r4, #0
	ble _08071168
	ldr r2, _08071164 @ =IWRAM_START + 0x50
	adds r0, r5, r2
	ldrh r0, [r0]
	mov r3, ip
	subs r0, r3, r0
	mov r2, sl
	ands r0, r2
	mov r3, r8
	strh r0, [r3]
	b _08071192
	.align 2, 0
_0807114C: .4byte gCurTask
_08071150: .4byte IWRAM_START + 0x48
_08071154: .4byte 0x000003FF
_08071158: .4byte gSineTable
_0807115C: .4byte IWRAM_START + 0xA8
_08071160: .4byte IWRAM_START + 0xAC
_08071164: .4byte IWRAM_START + 0x50
_08071168:
	cmp r4, #0
	bge _0807117C
	ldr r2, _08071178 @ =IWRAM_START + 0x50
	adds r0, r5, r2
	ldrh r0, [r0]
	add r0, ip
	b _0807118A
	.align 2, 0
_08071178: .4byte IWRAM_START + 0x50
_0807117C:
	cmp r0, #0
	bge _08071192
	ldr r3, _08071208 @ =IWRAM_START + 0x50
	adds r0, r5, r3
	ldrh r0, [r0]
	mov r2, ip
	subs r0, r2, r0
_0807118A:
	mov r3, sl
	ands r0, r3
	mov r2, r8
	strh r0, [r2]
_08071192:
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r1
	movs r3, #0
	ldrsh r0, [r0, r3]
	lsls r7, r0, #2
	movs r3, #0x80
	lsls r3, r3, #1
	adds r0, r2, r3
	lsls r0, r0, #1
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r5, r0, #2
	adds r4, r6, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r1, r7, #0
	muls r1, r0, r1
	asrs r1, r1, #8
	ldr r0, [r6, #0x40]
	subs r0, r0, r1
	str r0, [r6, #0x40]
	ldrh r0, [r4]
	adds r1, r5, #0
	muls r1, r0, r1
	asrs r1, r1, #8
	ldr r0, [r6, #0x44]
	subs r0, r0, r1
	str r0, [r6, #0x44]
	adds r0, r6, #0
	bl sub_80714F4
	adds r0, r6, #0
	bl sub_807120C
	adds r2, r6, #0
	adds r2, #0x52
	ldrh r0, [r2]
	ldrh r3, [r4]
	adds r0, r0, r3
	strh r0, [r4]
	ldrh r1, [r4]
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _080711F8
	ldrh r0, [r2]
	strh r0, [r4]
_080711F8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08071208: .4byte IWRAM_START + 0x50

	thumb_func_start sub_807120C
sub_807120C: @ 0x0807120C
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	ldr r7, [r5]
	ldr r0, [r7, #0xc]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r4, r1, r0
	ldr r0, [r5, #0x40]
	lsrs r3, r0, #0x10
	ldr r0, [r5, #0x44]
	lsrs r0, r0, #0x10
	mov r8, r0
	ldr r2, _08071270 @ =IWRAM_START + 0xA8
	adds r0, r1, r2
	ldrh r2, [r0, #2]
	ldr r6, _08071274 @ =IWRAM_START + 0xAC
	adds r0, r1, r6
	ldrh r0, [r0, #2]
	mov sl, r0
	adds r6, #4
	adds r0, r1, r6
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x18
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov ip, r0
	ldr r0, _08071278 @ =IWRAM_START + 0xB4
	adds r1, r1, r0
	ldrh r6, [r1]
	mov sb, r6
	movs r0, #0
	ldrsh r1, [r1, r0]
	cmp r1, #6
	bne _0807125E
	b _08071372
_0807125E:
	cmp r1, #6
	bgt _0807127C
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0807126C
	b _08071372
_0807126C:
	b _08071284
	.align 2, 0
_08071270: .4byte IWRAM_START + 0xA8
_08071274: .4byte IWRAM_START + 0xAC
_08071278: .4byte IWRAM_START + 0xB4
_0807127C:
	cmp r1, #0xa
	beq _08071372
	cmp r1, #0xe
	beq _08071372
_08071284:
	lsls r0, r3, #0x10
	asrs r3, r0, #0x10
	subs r1, r3, #5
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bge _08071372
	adds r0, r3, #5
	cmp r0, r2
	ble _08071372
	mov r1, r8
	lsls r0, r1, #0x10
	asrs r3, r0, #0x10
	subs r1, r3, #5
	mov r2, sl
	lsls r0, r2, #0x10
	asrs r2, r0, #0x10
	cmp r1, r2
	bge _08071372
	adds r0, r3, #5
	cmp r0, r2
	ble _08071372
	movs r1, #0
	mov r6, ip
	lsls r0, r6, #0x10
	asrs r0, r0, #0x10
	cmp r1, r0
	bgt _08071372
	cmp r0, #3
	bgt _08071372
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r1, r0, #0x10
	ldr r2, _080712F8 @ =0xFFFC0000
	adds r0, r0, r2
	lsrs r0, r0, #0x10
	cmp r0, #1
	bls _080712D4
	cmp r1, #9
	bne _08071300
_080712D4:
	adds r0, r5, #0
	adds r0, #0x54
	ldrh r1, [r0]
	subs r0, #8
	strh r1, [r0]
	movs r0, #2
	strh r0, [r5, #0x3c]
	adds r0, r7, #0
	bl sub_806F944
	adds r1, r4, #0
	adds r1, #0xb4
	movs r0, #0xa
	strh r0, [r1]
	ldr r0, _080712FC @ =0x00000113
	bl m4aSongNumStart
	b _08071372
	.align 2, 0
_080712F8: .4byte 0xFFFC0000
_080712FC: .4byte 0x00000113
_08071300:
	ldr r6, _08071338 @ =0x000005A4
	adds r0, r7, r6
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _0807133C
	adds r0, r4, #0
	adds r0, #0xb6
	movs r6, #0
	ldrsh r2, [r0, r6]
	cmp r2, #0
	bne _08071372
	adds r0, #0x46
	ldrh r1, [r0]
	subs r0, #0x44
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0xb4
	movs r0, #0xe
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0xc8
	str r2, [r0]
	movs r0, #0x92
	bl m4aSongNumStart
	b _08071372
	.align 2, 0
_08071338: .4byte 0x000005A4
_0807133C:
	adds r6, r4, #0
	adds r6, #0xb6
	movs r0, #0
	ldrsh r5, [r6, r0]
	cmp r5, #0
	bne _08071372
	adds r0, r7, #0
	movs r1, #0xa
	bl sub_806D924
	adds r0, r4, #0
	adds r0, #0xf8
	ldrh r1, [r0]
	subs r0, #0x40
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0xb4
	movs r0, #6
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0xc8
	str r5, [r0]
	movs r0, #0x96
	strh r0, [r6]
	movs r0, #0x76
	bl m4aSongNumStart
_08071372:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

	thumb_func_start sub_8071380
sub_8071380: @ 0x08071380
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov ip, r0
	adds r4, r1, #0
	ldr r0, [sp, #0x1c]
	ldr r6, [sp, #0x20]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sb, r3
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r5, _0807142C @ =gOamBuffer + 0x3E6
	ldr r1, _08071430 @ =0x0000107F
	ldrb r2, [r6, #7]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080713B4
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r1, r0
_080713B4:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080713C2
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r1, r0
_080713C2:
	mov r0, ip
	str r4, [r0, #4]
	movs r2, #0
	movs r4, #0
	strh r4, [r0, #8]
	ldrh r0, [r6]
	mov r7, ip
	strh r0, [r7, #0xa]
	str r1, [r7, #0x10]
	mov r0, r8
	strh r0, [r7, #0x16]
	mov r1, sb
	strh r1, [r7, #0x18]
	lsls r0, r3, #6
	strh r0, [r7, #0x1a]
	strh r4, [r7, #0x1c]
	ldr r0, _08071434 @ =0x0000FFFF
	strh r0, [r7, #0x1e]
	ldrh r1, [r6, #2]
	mov r0, ip
	adds r0, #0x20
	strb r1, [r0]
	mov r1, ip
	adds r1, #0x21
	movs r0, #0xff
	strb r0, [r1]
	ldrb r0, [r6, #6]
	adds r1, #1
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x25
	strb r2, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r7, #0x28]
	mov r0, ip
	bl sub_8004558
	movs r7, #0x80
	lsls r7, r7, #1
	adds r0, r7, #0
	strh r0, [r5]
	adds r5, #8
	strh r4, [r5]
	adds r5, #8
	strh r4, [r5]
	strh r0, [r5, #8]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807142C: .4byte gOamBuffer + 0x3E6
_08071430: .4byte 0x0000107F
_08071434: .4byte 0x0000FFFF

	thumb_func_start sub_8071438
sub_8071438: @ 0x08071438
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _0807146C @ =sub_8070FA0
	movs r2, #0xa0
	lsls r2, r2, #8
	ldr r1, _08071470 @ =sub_8071474
	str r1, [sp]
	movs r1, #0x58
	movs r3, #0
	bl TaskCreate
	adds r4, r0, #0
	ldrh r0, [r4, #6]
	movs r1, #0xc0
	lsls r1, r1, #0x12
	adds r0, r0, r1
	str r5, [r0]
	bl sub_8070EFC
	adds r0, r4, #0
	add sp, #4
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0807146C: .4byte sub_8070FA0
_08071470: .4byte sub_8071474

	thumb_func_start sub_8071474
sub_8071474: @ 0x08071474
	bx lr
	.align 2, 0

	thumb_func_start sub_8071478
sub_8071478: @ 0x08071478
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r0, _080714B8 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r3, r1, r0
	ldr r2, [r3]
	mov r1, sp
	ldr r0, _080714BC @ =gUnknown_080DF95C
	ldm r0!, {r4, r5, r6}
	stm r1!, {r4, r5, r6}
	ldr r0, _080714C0 @ =0x000005B4
	adds r2, r2, r0
	ldrh r0, [r2]
	subs r0, #4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #1
	bhi _080714B0
	movs r1, #0x3c
	ldrsh r0, [r3, r1]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	bl _call_via_r0
_080714B0:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080714B8: .4byte gCurTask
_080714BC: .4byte gUnknown_080DF95C
_080714C0: .4byte 0x000005B4

	thumb_func_start sub_80714C4
sub_80714C4: @ 0x080714C4
	bx lr
	.align 2, 0

	thumb_func_start sub_80714C8
sub_80714C8: @ 0x080714C8
	push {lr}
	ldr r0, _080714F0 @ =gCurTask
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0xc0
	lsls r0, r0, #0x12
	adds r2, r1, r0
	adds r0, #0x4c
	adds r1, r1, r0
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bgt _080714EA
	movs r0, #1
	strh r0, [r2, #0x3c]
_080714EA:
	pop {r0}
	bx r0
	.align 2, 0
_080714F0: .4byte gCurTask

	thumb_func_start sub_80714F4
sub_80714F4: @ 0x080714F4
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x40]
	ldr r3, _08071528 @ =0x0029FFFF
	cmp r0, r3
	bgt _08071506
	movs r0, #0xa8
	lsls r0, r0, #0xe
	str r0, [r1, #0x40]
_08071506:
	ldr r0, [r1, #0x40]
	ldr r2, _0807152C @ =0x3D60000
	cmp r0, r2
	ble _08071510
	str r2, [r1, #0x40]
_08071510:
	ldr r0, [r1, #0x44]
	cmp r0, r3
	bgt _0807151C
	movs r0, #0xa8
	lsls r0, r0, #0xe
	str r0, [r1, #0x44]
_0807151C:
	ldr r0, [r1, #0x44]
	cmp r0, r2
	ble _08071524
	str r2, [r1, #0x44]
_08071524:
	pop {r0}
	bx r0
	.align 2, 0
_08071528: .4byte 0x0029FFFF
_0807152C: .4byte 0x3D60000

	thumb_func_start sub_8071530
sub_8071530: @ 0x08071530
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	ldr r5, [sp, #0x14]
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	lsls r2, r2, #0x10
	lsrs r6, r2, #0x10
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	ldr r2, _0807158C @ =0x0000107F
	ldrb r1, [r5, #7]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08071554
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
_08071554:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08071562
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
_08071562:
	ldrh r0, [r5]
	strh r0, [r4, #0xa]
	str r2, [r4, #0x10]
	strh r7, [r4, #0x16]
	strh r6, [r4, #0x18]
	lsls r0, r3, #6
	strh r0, [r4, #0x1a]
	ldrh r1, [r5, #2]
	adds r0, r4, #0
	adds r0, #0x20
	strb r1, [r0]
	ldrb r0, [r5, #6]
	adds r1, r4, #0
	adds r1, #0x22
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_8004558
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807158C: .4byte 0x0000107F