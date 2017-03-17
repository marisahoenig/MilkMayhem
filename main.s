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
	.file	"main.c"
	.text
	.align	2
	.global	goToSplash
	.type	goToSplash, %function
goToSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	ip, #67108864
	mov	lr, #7936	@ movhi
	mov	r0, #3
	ldr	r1, .L2
	mov	r2, #100663296
	mov	r3, #2752
	ldr	r4, .L2+4
	strh	lr, [ip, #8]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L2+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L2+12
	mov	r2, #0
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	splashscreenTiles
	.word	DMANow
	.word	splashscreenMap
	.word	state
	.size	goToSplash, .-goToSplash
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, lr}
	mov	ip, #4352	@ movhi
	mov	r5, #67108864
	mov	r2, #83886080
	ldr	r4, .L8
	strh	ip, [r5, #0]	@ movhi
	mov	r0, #3
	ldr	r1, .L8+4
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L8+8
	add	r2, r2, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	ip, #55808
	mov	r3, #17664
	mov	r0, #3
	ldr	r1, .L8+12
	mov	r2, #100663296
	add	r3, r3, #16
	strh	ip, [r5, #8]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #53248
	mov	r3, #4096
	mov	r0, #3
	ldr	r1, .L8+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L8+20
	add	r2, r3, #1016
.L5:
	mov	r1, #512	@ movhi
	strh	r1, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L5
	ldr	r3, .L8+24
	mov	r5, #128
	ldr	r1, .L8+28
	mov	r2, #0
	str	r5, [r3, #0]
	mov	r4, #1
	mov	r0, #16
	mov	ip, #32
	mov	r5, #112
	str	r5, [r3, #4]
	str	r2, [r3, #8]
	str	r4, [r3, #12]
	str	r0, [r3, #16]
	str	ip, [r3, #20]
	str	r2, [r3, #24]
	str	r2, [r3, #32]
	str	r2, [r3, #36]
	str	r4, [r3, #40]
	mov	r3, #144
	str	r3, [r1, #0]
	mov	r3, #200
	str	r3, [r1, #4]
	mov	r3, #4
	str	r3, [r1, #12]
	ldr	r3, .L8+32
	str	r2, [r1, #8]
	str	ip, [r1, #16]
	str	r0, [r1, #20]
	str	r2, [r1, #24]
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L9:
	.align	2
.L8:
	.word	DMANow
	.word	spritesheetPal
	.word	spritesheetTiles
	.word	movebackgroundTiles
	.word	movebackgroundMap
	.word	shadowOAM
	.word	p
	.word	c
	.word	hOff
	.size	initGame, .-initGame
	.align	2
	.global	goToInstructions
	.type	goToInstructions, %function
goToInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	ip, #67108864
	mov	lr, #7680	@ movhi
	mov	r0, #3
	ldr	r1, .L11
	mov	r2, #100663296
	mov	r3, #880
	ldr	r4, .L11+4
	strh	lr, [ip, #8]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #61440
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L11+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L11+12
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L12:
	.align	2
.L11:
	.word	instructionsTiles
	.word	DMANow
	.word	instructionsMap
	.word	state
	.size	goToInstructions, .-goToInstructions
	.align	2
	.global	updateSplash
	.type	updateSplash, %function
updateSplash:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L15
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L15+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToInstructions
.L16:
	.align	2
.L15:
	.word	oldButtons
	.word	buttons
	.size	updateSplash, .-updateSplash
	.align	2
	.global	updateInstructions
	.type	updateInstructions, %function
updateInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L20
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L17
	ldr	r3, .L20+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L19
.L17:
	ldmfd	sp!, {r3, lr}
	bx	lr
.L19:
	bl	initGame
	ldr	r3, .L20+8
	mov	r2, #2
	str	r2, [r3, #0]
	mov	r3, #67108864
	mov	r2, #4352	@ movhi
	strh	r2, [r3, #0]	@ movhi
	b	.L17
.L21:
	.align	2
.L20:
	.word	oldButtons
	.word	buttons
	.word	state
	.size	updateInstructions, .-updateInstructions
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L23
	mov	r2, #2
	str	r2, [r3, #0]
	mov	r3, #67108864
	mov	r2, #4352	@ movhi
	strh	r2, [r3, #0]	@ movhi
	bx	lr
.L24:
	.align	2
.L23:
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, #7680
	stmfd	sp!, {r4, r5, r6, lr}
	add	ip, ip, #8
	mov	lr, #67108864
	mov	r6, #100663296
	mov	r5, #1024
	mov	r0, #3
	ldr	r1, .L26
	add	r2, r6, #32768
	mov	r3, #1568
	ldr	r4, .L26+4
	strh	r5, [lr, #0]	@ movhi
	strh	ip, [lr, #12]	@ movhi
	mov	lr, pc
	bx	r4
	add	r2, r6, #61440
	mov	r3, r5
	mov	r0, #3
	ldr	r1, .L26+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L26+12
	mov	r2, #5
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L27:
	.align	2
.L26:
	.word	pausescreenTiles
	.word	DMANow
	.word	pausescreenMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	updatePause
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L33
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L29
	ldr	r2, .L33+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L31
.L29:
	tst	r3, #4
	bxeq	lr
.L32:
	ldr	r3, .L33+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	bxne	lr
	b	goToSplash
.L31:
	ldr	r2, .L33+8
	mov	r1, #2
	str	r1, [r2, #0]
	tst	r3, #4
	mov	r2, #67108864
	mov	r1, #4352	@ movhi
	strh	r1, [r2, #0]	@ movhi
	bne	.L32
	bx	lr
.L34:
	.align	2
.L33:
	.word	oldButtons
	.word	buttons
	.word	state
	.size	updatePause, .-updatePause
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	ip, #67108864
	mov	lr, #256	@ movhi
	strh	lr, [ip, #0]	@ movhi
	mov	lr, #7680	@ movhi
	mov	r0, #3
	ldr	r1, .L36
	mov	r2, #100663296
	mov	r3, #1088
	ldr	r4, .L36+4
	strh	lr, [ip, #8]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #61440
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L36+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L36+12
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	winscreenTiles
	.word	DMANow
	.word	winscreenMap
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	updateWin
	.type	updateWin, %function
updateWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L40
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L40+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToSplash
.L41:
	.align	2
.L40:
	.word	oldButtons
	.word	buttons
	.size	updateWin, .-updateWin
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	ip, #67108864
	mov	lr, #256	@ movhi
	strh	lr, [ip, #0]	@ movhi
	mov	lr, #7680	@ movhi
	mov	r0, #3
	ldr	r1, .L43
	mov	r2, #100663296
	mov	r3, #1424
	ldr	r4, .L43+4
	strh	lr, [ip, #8]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #61440
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L43+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L43+12
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L44:
	.align	2
.L43:
	.word	losescreenTiles
	.word	DMANow
	.word	losescreenMap
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	updateLose
	.type	updateLose, %function
updateLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L47
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L47+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToSplash
.L48:
	.align	2
.L47:
	.word	oldButtons
	.word	buttons
	.size	updateLose, .-updateLose
	.global	__aeabi_idivmod
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	mov	r3, #67108864
	ldr	r2, [r3, #304]
	tst	r2, #16
	bne	.L73
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L71
.L73:
	ldr	r3, .L76
.L50:
	ldr	r2, [r3, #28]
	mov	r1, #0
	str	r1, [r3, #32]
	str	r2, [r3, #24]
.L52:
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #16]
	add	r0, r1, r2
	cmp	r0, #239
	rsbgt	r2, r1, #240
	ldrgt	r1, .L76
	strgt	r2, [r1, #4]
	cmp	r2, #0
	movle	r2, #1
	strle	r2, [r3, #4]
	mov	r2, #67108864
	ldr	r1, [r2, #304]
	tst	r1, #16
	beq	.L55
	ldr	r2, [r2, #304]
	tst	r2, #32
	beq	.L55
.L56:
	ldr	r4, .L76+4
	ldr	r6, .L76+8
	ldr	r5, [r4, #0]
	ldr	r1, [r6, #0]
	mov	r0, r5
	ldr	r3, .L76+12
	mov	lr, pc
	bx	r3
	add	r5, r5, #1
	cmp	r1, #0
	str	r5, [r4, #0]
	ldrne	r7, .L76+16
	bne	.L60
	ldr	r7, .L76+16
	mov	r3, r7
.L63:
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L74
	add	r1, r1, #1
	cmp	r1, #5
	add	r3, r3, #28
	bne	.L63
.L60:
	ldr	r5, .L76+16
	ldr	r6, .L76+20
	mov	r4, #0
.L62:
	ldr	r3, [r5, #24]
	cmp	r3, #0
	bne	.L75
.L64:
	add	r4, r4, #1
	cmp	r4, #5
	add	r5, r5, #28
	bne	.L62
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L55:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #16
	bne	.L57
	ldr	r2, [r3, #4]
	ldr	r1, [r3, #12]
	add	r2, r1, r2
	mov	r1, #2
	str	r1, [r3, #24]
	str	r2, [r3, #4]
.L57:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	tst	r2, #32
	bne	.L58
	ldr	r1, [r3, #4]
	ldr	r2, [r3, #12]
	rsb	r2, r2, r1
	mov	r1, #1
	str	r1, [r3, #24]
	str	r2, [r3, #4]
.L58:
	ldr	r3, [r3, #36]
	ldr	r2, .L76+24
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	add	r2, r2, r3
	rsb	r2, r1, r2, asr #4
	rsb	r2, r2, r2, asl #4
	subs	r3, r3, r2, asl #1
	ldr	r1, .L76
	bne	.L56
	ldr	r0, [r1, #32]
	cmp	r0, #1
	addle	r0, r0, #1
	strle	r0, [r1, #32]
	ble	.L56
	cmp	r0, #2
	streq	r3, [r1, #32]
	b	.L56
.L75:
	rsb	r0, r4, r4, asl #3
	add	r0, r7, r0, asl #2
	mov	lr, pc
	bx	r6
	b	.L64
.L71:
	ldr	r3, .L76
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L50
	ldr	r2, [r3, #36]
	add	r2, r2, #1
	str	r2, [r3, #36]
	b	.L52
.L74:
	rsb	r1, r1, r1, asl #3
	add	r3, r7, r1, asl #2
	mov	r2, #1
	str	r2, [r3, #24]
	mov	r2, #128
	str	r2, [r7, r1, asl #2]
	mov	r2, #220
	str	r2, [r3, #4]
	ldr	r3, .L76+28
	mov	lr, pc
	bx	r3
	ldr	r2, .L76+24
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	add	r2, r2, r0
	rsb	r3, r3, r2, asr #4
	rsb	r3, r3, r3, asl #4
	sub	r3, r0, r3, asl #1
	add	r3, r3, #80
	str	r3, [r6, #0]
	b	.L60
.L77:
	.align	2
.L76:
	.word	p
	.word	time
	.word	timeToNextCat
	.word	__aeabi_idivmod
	.word	cats
	.word	updateCat
	.word	-2004318071
	.word	rand
	.size	update, .-update
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L83
	ldmia	r3, {r0, r1}	@ phole ldm
	ldr	r3, [r3, #32]
	ldr	r2, .L83+4
	mvn	r0, r0, asl #17
	mov	r3, r3, asl #1
	mvn	r1, r1, asl #17
	mvn	r0, r0, lsr #17
	mvn	r1, r1, lsr #17
	strh	r3, [r2, #4]	@ movhi
	strh	r0, [r2, #0]	@ movhi
	ldr	r3, .L83+8
	strh	r1, [r2, #2]	@ movhi
	mov	r1, #1
.L81:
	ldr	r0, [r3, #0]
	cmp	r0, #0
	moveq	r0, #512	@ movhi
	streqh	r0, [r2, #8]	@ movhi
	beq	.L80
	ldr	r0, [r3, #-20]
	ldr	ip, [r3, #-24]
	mvn	r0, r0, asl #17
	mvn	r0, r0, lsr #17
	orr	ip, ip, #16384
	strh	r0, [r2, #10]	@ movhi
	mov	r0, #8	@ movhi
	strh	ip, [r2, #8]	@ movhi
	strh	r0, [r2, #12]	@ movhi
.L80:
	add	r1, r1, #1
	cmp	r1, #6
	add	r3, r3, #28
	add	r2, r2, #8
	bne	.L81
	mov	r0, #3
	ldr	r1, .L83+4
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L83+12
	mov	lr, pc
	bx	ip
	ldr	r3, .L83+16
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L84:
	.align	2
.L83:
	.word	p
	.word	shadowOAM
	.word	cats+24
	.word	DMANow
	.word	waitForVblank
	.size	draw, .-draw
	.align	2
	.global	updateGame
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	bl	update
	ldr	r3, .L88
	mov	lr, pc
	bx	r3
	bl	draw
	ldr	r3, .L88+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L85
	ldr	r3, .L88+8
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L87
.L85:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L87:
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L89:
	.align	2
.L88:
	.word	waitForVblank
	.word	oldButtons
	.word	buttons
	.size	updateGame, .-updateGame
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	mov	r3, #4352	@ movhi
	mov	r4, #67108864
	ldr	r0, .L103
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, .L103+4
	mov	lr, pc
	bx	r3
	bl	goToSplash
	ldr	r5, .L103+8
	ldr	r7, .L103+12
	ldr	r6, .L103+16
.L102:
	ldr	r3, [r5, #0]
	ldr	r2, [r7, #0]
.L92:
	str	r3, [r6, #0]
	ldr	r3, [r4, #304]
	str	r3, [r5, #0]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L92
.L99:
	.word	.L93
	.word	.L94
	.word	.L95
	.word	.L96
	.word	.L97
	.word	.L98
.L98:
	bl	updatePause
	b	.L102
.L97:
	bl	updateWin
	b	.L102
.L96:
	bl	updateLose
	b	.L102
.L95:
	bl	updateGame
	b	.L102
.L94:
	bl	updateInstructions
	b	.L102
.L93:
	bl	updateSplash
	b	.L102
.L104:
	.align	2
.L103:
	.word	splashscreenPal
	.word	loadPalette
	.word	buttons
	.word	state
	.word	oldButtons
	.size	main, .-main
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L108
	add	r2, r3, #1016
.L106:
	mov	r1, #512	@ movhi
	strh	r1, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L106
	bx	lr
.L109:
	.align	2
.L108:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.comm	score,4,4
	.comm	prevScore,4,4
	.comm	lives,4,4
	.comm	time,4,4
	.comm	hOff,4,4
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	shadowOAM,1024,4
	.comm	p,44,4
	.comm	c,28,4
	.comm	cats,140,4
	.comm	timeToNextCat,4,4
	.comm	state,4,4
	.comm	currFrame,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
