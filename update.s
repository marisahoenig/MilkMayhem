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
	ldr	r3, [r0, #28]
	cmp	r3, #0
	bxeq	lr
	ldr	r3, [r0, #4]
	cmp	r3, #239
	movhi	r2, #0
	strhi	r2, [r0, #28]
	ldr	r2, [r0, #24]
	cmp	r2, #0
	ldrne	r2, [r0, #12]
	ldreq	r2, [r0, #12]
	rsbne	r3, r2, r3
	addeq	r3, r2, r3
	strne	r3, [r0, #4]
	streq	r3, [r0, #4]
	ldr	r3, [r0, #40]
	ldr	r2, .L8
	add	r3, r3, #1
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #2
	add	r2, r2, r2, asl #2
	cmp	r3, r2, asl #1
	str	r3, [r0, #40]
	bxne	lr
	ldr	r3, [r0, #32]
	cmp	r3, #1
	addle	r3, r3, #1
	strle	r3, [r0, #32]
	bxle	lr
	cmp	r3, #2
	moveq	r3, #1
	streq	r3, [r0, #32]
	bx	lr
.L9:
	.align	2
.L8:
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
	ldr	r2, [r0, #12]
	add	r3, r2, r3
	cmp	r3, #0
	str	r3, [r0, #4]
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
	ldr	r3, [r1, #24]
	cmp	r3, #0
	ldr	r2, [r0, #0]
	moveq	r0, r3
	beq	.L13
	ldr	r3, [r1, #0]
	mov	r2, r2, asr #8
	cmp	r2, r3
	bgt	.L17
	ldr	r4, [r0, #20]
	ldr	ip, [r1, #20]
	add	r2, r2, r4
	add	r3, r3, ip
	cmp	r2, r3
	blt	.L17
	ldr	r3, [r0, #4]
	ldr	r0, [r0, #16]
	ldr	r2, [r1, #4]
	add	r0, r3, r0
	cmp	r0, r2
	blt	.L17
	ldr	r0, [r1, #16]
	add	r2, r2, r0
	cmp	r3, r2
	movgt	r0, #0
	movle	r0, #1
.L13:
	ldmfd	sp!, {r4}
	bx	lr
.L17:
	mov	r0, #0
	b	.L13
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
	beq	.L18
	ldr	ip, [r1, #0]
	ldr	r2, [r0, #0]
	ldmib	r0, {r3, r4}
	sub	r3, r3, r4
	mov	ip, ip, asr #8
	cmp	ip, r2
	str	r3, [r0, #4]
	ble	.L21
.L20:
	cmp	r3, #0
	movle	r3, #0
	strle	r3, [r0, #20]
.L18:
	ldmfd	sp!, {r4, r5}
	bx	lr
.L21:
	ldr	r5, [r1, #20]
	ldr	r4, [r0, #16]
	add	ip, ip, r5
	add	r2, r2, r4
	cmp	ip, r2
	blt	.L20
	ldr	r2, [r1, #4]
	ldr	r1, [r1, #16]
	add	r1, r2, r1
	cmp	r3, r1
	bgt	.L20
	ldr	r1, [r0, #12]
	add	r1, r3, r1
	cmp	r2, r1
	bgt	.L20
	ldr	r2, .L22
	ldr	r1, [r2, #0]
	cmp	r1, #2
	addle	r1, r1, #1
	movle	ip, #0
	strle	ip, [r0, #20]
	strle	r1, [r2, #0]
	b	.L20
.L23:
	.align	2
.L22:
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
	ldr	r3, [r0, #24]
	cmp	r3, #1
	beq	.L28
	ldmib	r0, {r2, r3}
	add	r3, r3, r2
	ldr	r2, [r0, #12]
	add	r2, r3, r2
	cmp	r2, #239
	str	r3, [r0, #4]
	bxle	lr
.L27:
	mov	r3, #0
	str	r3, [r0, #20]
	bx	lr
.L28:
	ldmib	r0, {r2, r3}
	sub	r3, r2, r3
	cmp	r3, #0
	str	r3, [r0, #4]
	bxge	lr
	b	.L27
	.size	updateBullet, .-updateBullet
	.align	2
	.global	collisionCheckEnemy
	.type	collisionCheckEnemy, %function
collisionCheckEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	ip, r1
	ldr	r3, [r1, #0]
	ldr	r1, [r1, #20]
	ldr	r2, [r0, #0]
	add	r1, r3, r1
	cmp	r2, r1
	mov	r4, r0
	bgt	.L29
	ldr	r1, [r0, #16]
	add	r2, r2, r1
	cmp	r3, r2
	bgt	.L29
	ldr	r3, [r0, #4]
	ldr	r2, [ip, #4]
	ldr	r0, [r0, #12]
	ldr	r1, [ip, #16]
	add	r0, r3, r0
	add	r1, r2, r1
	cmp	r0, r1
	bgt	.L31
	cmp	r0, r2
	blt	.L31
.L32:
	ldr	lr, .L33
	ldr	r5, [lr, #0]
	mov	r3, #0
	mov	r1, #4864
	mov	r2, #11008
	sub	r5, r5, #1
	str	r3, [ip, #24]
	ldr	r0, .L33+4
	str	r3, [r4, #20]
	add	r1, r1, #10
	add	r2, r2, #17
	str	r5, [lr, #0]
	ldr	ip, .L33+8
	mov	lr, pc
	bx	ip
.L29:
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L31:
	cmp	r3, r1
	bgt	.L29
	cmp	r3, r2
	bge	.L32
	b	.L29
.L34:
	.align	2
.L33:
	.word	catsRemaining
	.word	meow
	.word	playSoundB
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
	bgt	.L35
	ldr	ip, [r1, #20]
	add	r2, r2, ip
	cmp	r3, r2
	bgt	.L35
	ldr	ip, [r1, #16]
	ldr	r2, [r1, #4]
	ldr	r3, [r0, #4]
	ldr	r1, [r0, #16]
	add	r2, ip, r2
	add	r1, r3, r1
	cmp	r2, r1
	bgt	.L35
	cmp	r2, r3
	bge	.L37
.L35:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L37:
	ldr	r3, .L38
	mov	lr, pc
	bx	r3
	b	.L35
.L39:
	.align	2
.L38:
	.word	goToWin
	.size	collisionFridge, .-collisionFridge
	.comm	catsRemaining,4,4
	.comm	lives,4,4
	.comm	time,4,4
	.comm	timetwo,4,4
	.comm	hOff,4,4
	.comm	gamehOff,4,4
	.comm	hurt,4,4
	.comm	hurtCount,4,4
	.comm	move,4,4
	.comm	catFrame,4,4
	.comm	direction,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
