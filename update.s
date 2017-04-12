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
	str	r4, [sp, #-4]!
	ldr	r3, [r0, #24]
	cmp	r3, #0
	beq	.L1
	ldr	r2, [r0, #4]
	cmp	r2, #0
	movle	r3, #0
	strle	r3, [r0, #24]
	ldr	r3, [r0, #36]
	ldr	r4, .L6
	add	r3, r3, #1
	smull	r1, r4, r3, r4
	mov	r1, r3, asr #31
	ldr	ip, [r0, #12]
	rsb	r1, r1, r4, asr #2
	add	r1, r1, r1, asl #2
	rsb	r2, ip, r2
	cmp	r3, r1, asl #1
	str	r2, [r0, #4]
	str	r3, [r0, #36]
	bne	.L1
	ldr	r3, [r0, #28]
	cmp	r3, #1
	addle	r3, r3, #1
	strle	r3, [r0, #28]
	ble	.L1
	cmp	r3, #2
	moveq	r3, #1
	streq	r3, [r0, #28]
.L1:
	ldmfd	sp!, {r4}
	bx	lr
.L7:
	.align	2
.L6:
	.word	1717986919
	.size	updateCat, .-updateCat
	.align	2
	.global	updateFridge
	.type	updateFridge, %function
updateFridge:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #4]
	cmp	r3, #0
	movle	r3, #0
	strle	r3, [r0, #24]
	bx	lr
	.size	updateFridge, .-updateFridge
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
	bgt	.L14
	ldr	r4, [r0, #20]
	ldr	ip, [r1, #20]
	add	r2, r2, r4
	add	r3, r3, ip
	cmp	r2, r3
	bge	.L15
.L14:
	mov	r0, #0
.L11:
	ldmfd	sp!, {r4}
	bx	lr
.L15:
	ldr	r3, [r0, #4]
	ldr	r0, [r0, #16]
	ldr	r2, [r1, #4]
	add	r0, r3, r0
	cmp	r0, r2
	blt	.L14
	ldr	r0, [r1, #16]
	add	r0, r2, r0
	cmp	r3, r0
	movgt	r0, #0
	movle	r0, #1
	b	.L11
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
	ldr	r3, [r0, #20]
	cmp	r3, #0
	beq	.L16
	ldr	ip, [r1, #0]
	ldr	r2, [r0, #0]
	ldmib	r0, {r3, r4}
	sub	r3, r3, r4
	mov	ip, ip, asr #8
	cmp	ip, r2
	str	r3, [r0, #4]
	ble	.L19
.L18:
	cmp	r3, #0
	movle	r3, #0
	strle	r3, [r0, #20]
.L16:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L19:
	ldr	r5, [r1, #20]
	ldr	r4, [r0, #16]
	add	ip, ip, r5
	add	r2, r2, r4
	cmp	ip, r2
	blt	.L18
	ldr	r2, [r1, #4]
	ldr	r1, [r1, #16]
	add	r1, r2, r1
	cmp	r3, r1
	bgt	.L18
	ldr	r1, [r0, #12]
	add	r1, r3, r1
	cmp	r2, r1
	bgt	.L18
	ldr	r2, .L20
	ldr	r1, [r2, #0]
	cmp	r1, #2
	mov	ip, #0
	addle	r1, r1, #1
	str	ip, [r0, #20]
	strle	r1, [r2, #0]
	b	.L18
.L21:
	.align	2
.L20:
	.word	lives
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
	ble	.L25
	mov	r3, #0
	str	r3, [r0, #20]
	bx	lr
.L25:
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r0, #20]
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
	bgt	.L26
	ldr	ip, [r0, #16]
	add	r2, r2, ip
	cmp	r3, r2
	bgt	.L26
	ldr	r3, [r0, #4]
	ldr	r4, [r0, #12]
	ldr	r2, [r1, #4]
	ldr	ip, [r1, #16]
	add	r4, r3, r4
	add	ip, r2, ip
	cmp	r4, ip
	bgt	.L28
	cmp	r4, r2
	blt	.L28
.L29:
	ldr	r2, .L30
	ldr	ip, [r2, #0]
	mov	r3, #0
	add	ip, ip, #1
	str	r3, [r1, #24]
	str	ip, [r2, #0]
	str	r3, [r0, #20]
.L26:
	ldmfd	sp!, {r4}
	bx	lr
.L28:
	cmp	r3, ip
	bgt	.L26
	cmp	r3, r2
	bge	.L29
	b	.L26
.L31:
	.align	2
.L30:
	.word	score
	.size	collisionCheckEnemy, .-collisionCheckEnemy
	.align	2
	.global	collisionFridge
	.type	collisionFridge, %function
collisionFridge:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r2, [r1, #0]
	ldr	r3, [r0, #0]
	ldr	ip, [r0, #20]
	mov	r2, r2, asr #8
	add	ip, r3, ip
	cmp	r2, ip
	bgt	.L32
	ldr	ip, [r1, #20]
	add	r2, r2, ip
	cmp	r3, r2
	bgt	.L32
	ldr	ip, [r1, #16]
	ldr	r2, [r1, #4]
	ldr	r3, [r0, #4]
	ldr	r1, [r0, #16]
	add	r2, ip, r2
	add	r1, r3, r1
	cmp	r2, r1
	bgt	.L32
	cmp	r2, r3
	bge	.L34
.L32:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L34:
	ldr	r3, .L35
	mov	lr, pc
	bx	r3
	b	.L32
.L36:
	.align	2
.L35:
	.word	goToWin
	.size	collisionFridge, .-collisionFridge
	.comm	score,4,4
	.comm	prevScore,4,4
	.comm	lives,4,4
	.comm	time,4,4
	.comm	timetwo,4,4
	.comm	hOff,4,4
	.comm	gamehOff,4,4
	.comm	catFrame,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
