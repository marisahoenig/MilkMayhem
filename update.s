	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"update.c"
	.text
	.align	2
	.global	updateCat
	.type	updateCat, %function
updateCat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #4]
	cmp	r3, #0
	movle	r2, #0
	strle	r2, [r0, #24]
	ldr	r2, [r0, #12]
	rsb	r3, r2, r3
	str	r3, [r0, #4]
	bx	lr
	.size	updateCat, .-updateCat
	.align	2
	.global	collisionEnemyPlayer
	.type	collisionEnemyPlayer, %function
collisionEnemyPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r2, [r0, #0]
	ldr	r3, [r1, #0]
	cmp	r2, r3
	bgt	.L8
	ldr	r4, [r0, #20]
	ldr	ip, [r1, #20]
	add	r2, r2, r4
	add	r3, r3, ip
	cmp	r2, r3
	bge	.L9
.L8:
	mov	r0, #0
.L6:
	ldmfd	sp!, {r4}
	bx	lr
.L9:
	ldr	ip, [r0, #16]
	ldr	r2, [r0, #4]
	ldr	r3, [r1, #4]
	add	r0, ip, r2
	cmp	r0, r3
	movlt	r0, #0
	movge	r0, #1
	b	.L6
	.size	collisionEnemyPlayer, .-collisionEnemyPlayer
	.align	2
	.global	updateHealth
	.type	updateHealth, %function
updateHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5}
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L10
	ldr	r4, [r0, #4]
	ldr	r2, [r1, #0]
	ldr	ip, [r0, #12]
	ldr	r3, [r0, #0]
	rsb	ip, ip, r4
	cmp	r2, r3
	str	ip, [r0, #4]
	ble	.L13
.L12:
	cmp	r3, #0
	movle	r3, #0
	strle	r3, [r0, #24]
.L10:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L13:
	ldr	r5, [r1, #20]
	ldr	r4, [r0, #20]
	add	r2, r2, r5
	add	r4, r3, r4
	cmp	r2, r4
	blt	.L12
	ldr	r4, [r1, #16]
	ldr	r2, [r1, #4]
	add	r2, r4, r2
	cmp	ip, r2
	movle	r2, #0
	strle	r2, [r0, #24]
	b	.L12
	.size	updateHealth, .-updateHealth
	.comm	score,4,4
	.comm	prevScore,4,4
	.comm	lives,4,4
	.comm	time,4,4
	.comm	hOff,4,4
	.comm	gamehOff,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
