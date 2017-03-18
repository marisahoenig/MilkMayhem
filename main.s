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
	mov	lr, #256	@ movhi
	strh	lr, [ip, #0]	@ movhi
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
	ldr	r1, .L5
	mov	r2, #100663296
	mov	r3, #880
	ldr	r4, .L5+4
	strh	lr, [ip, #8]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #61440
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L5+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L5+12
	mov	r2, #1
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L6:
	.align	2
.L5:
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
	ldr	r3, .L10
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L10+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToInstructions
.L11:
	.align	2
.L10:
	.word	oldButtons
	.word	buttons
	.size	updateSplash, .-updateSplash
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	mov	ip, #4352	@ movhi
	mov	r5, #67108864
	mov	r2, #83886080
	ldr	r4, .L15
	strh	ip, [r5, #0]	@ movhi
	mov	r0, #3
	ldr	r1, .L15+4
	add	r2, r2, #512
	mov	r3, #256
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L15+8
	add	r2, r2, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	ip, #55808
	mov	r3, #17664
	mov	r0, #3
	ldr	r1, .L15+12
	mov	r2, #100663296
	add	r3, r3, #16
	strh	ip, [r5, #8]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #53248
	mov	r3, #4096
	mov	r0, #3
	ldr	r1, .L15+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L15+20
	add	r2, r3, #1016
.L13:
	mov	r1, #512	@ movhi
	strh	r1, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L13
	ldr	ip, .L15+24
	mov	r3, #144
	mov	r5, #0
	str	r3, [ip, #0]
	mov	r6, #1
	mov	r3, #200
	stmib	ip, {r3, r5, r6}	@ phole stm
	ldr	r7, .L15+28
	mov	r9, ip
	ldmia	r9!, {r0, r1, r2, r3}
	mov	r4, r7
	stmia	r4!, {r0, r1, r2, r3}
	mov	r8, #16
	mov	sl, #32
	str	sl, [ip, #16]
	str	r8, [ip, #20]
	str	r5, [ip, #24]
	ldmia	r9, {r0, r1, r2}
	mov	r3, r4
	ldr	r4, .L15+32
	stmia	r3, {r0, r1, r2}
	ldmia	ip!, {r0, r1, r2, r3}
	mov	ip, #128
	str	ip, [r4, #0]
	add	r7, r7, #28
	mov	ip, #112
	str	ip, [r4, #4]
	str	r5, [r4, #8]
	str	r6, [r4, #12]
	str	r8, [r4, #16]
	str	sl, [r4, #20]
	str	r5, [r4, #24]
	str	r5, [r4, #32]
	str	r5, [r4, #36]
	stmia	r7!, {r0, r1, r2, r3}
	ldr	r3, .L15+36
	ldmia	r9, {r0, r1, r2}
	str	r5, [r3, #0]
	ldr	r3, .L15+40
	stmia	r7, {r0, r1, r2}
	mov	r2, #3
	str	r6, [r4, #40]
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	DMANow
	.word	spritesheetPal
	.word	spritesheetTiles
	.word	movebackgroundTiles
	.word	movebackgroundMap
	.word	shadowOAM
	.word	c
	.word	cats
	.word	p
	.word	hOff
	.word	lives
	.size	initGame, .-initGame
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
	mov	r3, #67108864
	stmfd	sp!, {r4, r5, r6, lr}
	ldr	r2, [r3, #304]
	tst	r2, #16
	bne	.L74
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L72
.L74:
	ldr	r3, .L79
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
	ldrgt	r1, .L79
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
	ldr	r4, .L79+4
	ldr	r6, .L79+8
	ldr	r5, [r4, #0]
	ldr	r1, [r6, #0]
	mov	r0, r5
	ldr	r3, .L79+12
	mov	lr, pc
	bx	r3
	add	r5, r5, #1
	cmp	r1, #0
	str	r5, [r4, #0]
	ldrne	r4, .L79+16
	bne	.L60
	ldr	r4, .L79+16
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L61
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L75
.L62:
	ldr	r3, .L79+20
	ldr	r0, .L79+16
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L64
.L78:
	ldr	r4, .L79+24
	ldr	r3, .L79+20
	ldr	r0, .L79+28
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #0]
	tst	r3, #1
	bne	.L76
.L65:
	tst	r3, #2
	beq	.L49
	ldr	r3, .L79+32
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L77
.L49:
	ldmfd	sp!, {r4, r5, r6, lr}
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
	ldr	r2, .L79+36
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	add	r2, r2, r3
	rsb	r2, r1, r2, asr #4
	rsb	r2, r2, r2, asl #4
	subs	r3, r3, r2, asl #1
	ldr	r1, .L79
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
	mov	r3, #1
.L61:
	rsb	r3, r3, r3, asl #3
	add	r2, r4, r3, asl #2
	mov	r1, #1
	str	r1, [r2, #24]
	mov	r1, #128
	str	r1, [r4, r3, asl #2]
	mov	r3, #220
	str	r3, [r2, #4]
	ldr	r3, .L79+40
	mov	lr, pc
	bx	r3
	ldr	r2, .L79+44
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, asl #2
	add	r3, r3, r3, asl #2
	sub	r3, r0, r3, asl #3
	add	r3, r3, #87
	str	r3, [r6, #0]
.L60:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L62
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L78
.L64:
	ldr	r4, .L79+24
	ldr	r3, [r4, #0]
	tst	r3, #1
	beq	.L65
.L76:
	ldr	r2, .L79+32
	ldr	r2, [r2, #0]
	tst	r2, #1
	bne	.L65
	bl	goToWin
	ldr	r3, [r4, #0]
	b	.L65
.L72:
	ldr	r3, .L79
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L50
	ldr	r2, [r3, #36]
	add	r2, r2, #1
	str	r2, [r3, #36]
	b	.L52
.L77:
	ldmfd	sp!, {r4, r5, r6, lr}
	b	goToLose
.L80:
	.align	2
.L79:
	.word	p
	.word	time
	.word	timeToNextCat
	.word	__aeabi_idivmod
	.word	cats
	.word	updateCat
	.word	oldButtons
	.word	cats+28
	.word	buttons
	.word	-2004318071
	.word	rand
	.word	1374389535
	.size	update, .-update
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L94
	ldr	r2, .L94+4
	ldr	r0, [r3, #4]
	ldr	ip, [r3, #0]
	ldr	lr, [r2, #24]
	ldr	r1, [r3, #32]
	mvn	r0, r0, asl #17
	ldr	r3, .L94+8
	mvn	r0, r0, lsr #17
	cmp	lr, #0
	mvn	ip, ip, asl #17
	mvn	ip, ip, lsr #17
	mov	r1, r1, asl #1
	strh	r0, [r3, #2]	@ movhi
	moveq	r0, #512	@ movhi
	strh	ip, [r3, #0]	@ movhi
	strh	r1, [r3, #4]	@ movhi
	streqh	r0, [r3, #8]	@ movhi
	beq	.L83
	ldmia	r2, {r0, r1}	@ phole ldm
	mvn	r1, r1, asl #17
	mvn	r1, r1, lsr #17
	orr	r0, r0, #16384
	strh	r1, [r3, #10]	@ movhi
	mov	r1, #8	@ movhi
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3, #12]	@ movhi
.L83:
	ldr	r2, [r2, #52]
	cmp	r2, #0
	ldr	r2, .L94+4
	moveq	r2, #512	@ movhi
	streqh	r2, [r3, #16]	@ movhi
	bne	.L92
	ldr	r2, .L94+12
	ldr	r0, [r2, #0]
	cmp	r0, #0
	movle	r0, #512	@ movhi
	strleh	r0, [r3, #32]	@ movhi
	ble	.L87
.L93:
	mov	r1, #16384
	mov	ip, r1
	add	ip, ip, #24
	add	r1, r1, #5
	strh	ip, [r3, #34]	@ movhi
	cmp	r0, #1
	mov	ip, #12	@ movhi
	ldr	r2, .L94+8
	strh	r1, [r3, #32]	@ movhi
	strh	ip, [r3, #36]	@ movhi
	ble	.L87
	mov	ip, #16384
	add	ip, ip, #34
	strh	ip, [r2, #42]	@ movhi
	cmp	r0, #2
	mov	ip, #12	@ movhi
	strh	r1, [r2, #40]	@ movhi
	strh	ip, [r2, #44]	@ movhi
	ble	.L89
	mov	r3, #16384
	add	r3, r3, #44
	strh	r1, [r2, #48]	@ movhi
	mov	r1, #12	@ movhi
	strh	r3, [r2, #50]	@ movhi
	strh	r1, [r2, #52]	@ movhi
.L91:
	mov	r0, #3
	ldr	r1, .L94+8
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L94+16
	mov	lr, pc
	bx	ip
	ldr	r3, .L94+20
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L87:
	mov	r0, #512	@ movhi
	strh	r0, [r3, #40]	@ movhi
.L89:
	mov	r0, #512	@ movhi
	strh	r0, [r3, #48]	@ movhi
	b	.L91
.L92:
	ldr	r0, [r2, #32]
	ldr	r1, [r2, #28]
	mvn	r2, r0, asl #17
	mvn	r2, r2, lsr #17
	strh	r2, [r3, #18]	@ movhi
	ldr	r2, .L94+12
	ldr	r0, [r2, #0]
	cmp	r0, #0
	orr	r1, r1, #16384
	mov	ip, #8	@ movhi
	movle	r0, #512	@ movhi
	strh	r1, [r3, #16]	@ movhi
	strh	ip, [r3, #20]	@ movhi
	strleh	r0, [r3, #32]	@ movhi
	ble	.L87
	b	.L93
.L95:
	.align	2
.L94:
	.word	p
	.word	cats
	.word	shadowOAM
	.word	lives
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
	ldr	r4, .L101
	bl	update
	ldr	r3, .L101+4
	mov	lr, pc
	bx	r3
	bl	draw
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L97
	ldr	r2, .L101+8
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L99
.L97:
	tst	r3, #4
	beq	.L96
	ldr	r3, .L101+8
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L100
.L96:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L100:
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L99:
	bl	goToPause
	ldr	r3, [r4, #0]
	b	.L97
.L102:
	.align	2
.L101:
	.word	oldButtons
	.word	waitForVblank
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
	ldr	r0, .L116
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, .L116+4
	mov	lr, pc
	bx	r3
	bl	goToSplash
	ldr	r5, .L116+8
	ldr	r7, .L116+12
	ldr	r6, .L116+16
.L115:
	ldr	r3, [r5, #0]
	ldr	r2, [r7, #0]
.L105:
	str	r3, [r6, #0]
	ldr	r3, [r4, #304]
	str	r3, [r5, #0]
	cmp	r2, #5
	ldrls	pc, [pc, r2, asl #2]
	b	.L105
.L112:
	.word	.L106
	.word	.L107
	.word	.L108
	.word	.L109
	.word	.L110
	.word	.L111
.L111:
	bl	updatePause
	b	.L115
.L110:
	bl	updateWin
	b	.L115
.L109:
	bl	updateLose
	b	.L115
.L108:
	bl	updateGame
	b	.L115
.L107:
	bl	updateInstructions
	b	.L115
.L106:
	bl	updateSplash
	b	.L115
.L117:
	.align	2
.L116:
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
	ldr	r3, .L121
	add	r2, r3, #1016
.L119:
	mov	r1, #512	@ movhi
	strh	r1, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L119
	bx	lr
.L122:
	.align	2
.L121:
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
	.comm	cats,56,4
	.comm	timeToNextCat,4,4
	.comm	state,4,4
	.comm	currFrame,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
