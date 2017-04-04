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
	mov	r2, r2, asr #8
	cmp	r2, r3
	bgt	.L9
	ldr	r4, [r0, #20]
	ldr	ip, [r1, #20]
	add	r2, r2, r4
	add	r3, r3, ip
	cmp	r2, r3
	bge	.L10
.L9:
	mov	r0, #0
.L6:
	ldmfd	sp!, {r4}
	bx	lr
.L10:
	ldr	r3, [r0, #4]
	ldr	r0, [r0, #16]
	ldr	r2, [r1, #4]
	add	r0, r3, r0
	cmp	r0, r2
	blt	.L9
	ldr	r0, [r1, #16]
	add	r0, r2, r0
	cmp	r3, r0
	movgt	r0, #0
	movle	r0, #1
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
	beq	.L11
	ldr	r4, [r0, #4]
	ldr	r2, [r1, #0]
	ldr	ip, [r0, #12]
	ldr	r3, [r0, #0]
	rsb	ip, ip, r4
	cmp	r2, r3
	str	ip, [r0, #4]
	ble	.L14
.L13:
	cmp	r3, #0
	movle	r3, #0
	strle	r3, [r0, #24]
.L11:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L14:
	ldr	r5, [r1, #20]
	ldr	r4, [r0, #20]
	add	r2, r2, r5
	add	r4, r3, r4
	cmp	r2, r4
	blt	.L13
	ldr	r4, [r1, #16]
	ldr	r2, [r1, #4]
	add	r2, r4, r2
	cmp	ip, r2
	movle	r2, #0
	strle	r2, [r0, #24]
	b	.L13
	.size	updateHealth, .-updateHealth
	.align	2
	.global	updateBullet
	.type	updateBullet, %function
updateBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #20]
	cmp	r3, #0
	bxeq	lr
	ldmib	r0, {r2, r3}
	add	r3, r3, r2
	ldr	r2, [r0, #12]
	add	r2, r3, r2
	cmp	r2, #239
	str	r3, [r0, #4]
	movgt	r3, #0
	strgt	r3, [r0, #20]
	bx	lr
	.size	updateBullet, .-updateBullet
	.align	2
	.global	collisionCheckEnemy
	.type	collisionCheckEnemy, %function
collisionCheckEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	ldr	r3, [r1, #0]
	ldr	ip, [r1, #20]
	ldr	r2, [r0, #0]
	add	ip, r3, ip
	cmp	r2, ip
	bgt	.L17
	ldr	ip, [r0, #16]
	add	r2, r2, ip
	cmp	r3, r2
	bgt	.L17
	ldr	r3, [r0, #4]
	ldr	r4, [r0, #12]
	ldr	r2, [r1, #4]
	ldr	ip, [r1, #16]
	add	r4, r3, r4
	add	ip, r2, ip
	cmp	r4, ip
	bgt	.L19
	cmp	r4, r2
	blt	.L19
.L20:
	ldr	r2, .L21
	ldr	ip, [r2, #0]
	mov	r3, #0
	add	ip, ip, #1
	str	r3, [r1, #24]
	str	ip, [r2, #0]
	str	r3, [r0, #20]
.L17:
	ldmfd	sp!, {r4}
	bx	lr
.L19:
	cmp	r3, ip
	bgt	.L17
	cmp	r3, r2
	bge	.L20
	b	.L17
.L22:
	.align	2
.L21:
	.word	score
	.size	collisionCheckEnemy, .-collisionCheckEnemy
	.comm	score,4,4
	.comm	prevScore,4,4
	.comm	lives,4,4
	.comm	time,4,4
	.comm	hOff,4,4
	.comm	gamehOff,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
