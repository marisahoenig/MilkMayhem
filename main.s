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
	strh	lr, [ip, #8]	@ movhi
	mov	lr, #256	@ movhi
	strh	lr, [ip, #0]	@ movhi
	mov	lr, #0	@ movhi
	mov	r0, #3
	ldr	r1, .L2
	mov	r2, #100663296
	mov	r3, #2752
	ldr	r4, .L2+4
	strh	lr, [ip, #16]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L2+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L2+12
	ldr	r3, .L2+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	splashscreenTiles
	.word	DMANow
	.word	splashscreenMap
	.word	updateSplash
	.word	state
	.size	goToSplash, .-goToSplash
	.align	2
	.global	updateLose
	.type	updateLose, %function
updateLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L7
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L7+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToSplash
.L8:
	.align	2
.L7:
	.word	oldButtons
	.word	buttons
	.size	updateLose, .-updateLose
	.align	2
	.global	updateWin
	.type	updateWin, %function
updateWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L11
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L11+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToSplash
.L12:
	.align	2
.L11:
	.word	oldButtons
	.word	buttons
	.size	updateWin, .-updateWin
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
	ldr	r0, .L15
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, .L15+4
	mov	lr, pc
	bx	r3
	bl	goToSplash
	ldr	r7, .L15+8
	ldr	r5, .L15+12
	ldr	r6, .L15+16
.L14:
	ldr	r2, [r5, #0]
	ldr	r3, [r4, #304]
	str	r2, [r7, #0]
	str	r3, [r5, #0]
	ldr	ip, [r6, #0]
	mov	lr, pc
	bx	ip
	b	.L14
.L16:
	.align	2
.L15:
	.word	splashscreenPal
	.word	loadPalette
	.word	oldButtons
	.word	buttons
	.word	state
	.size	main, .-main
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
	strh	lr, [ip, #8]	@ movhi
	mov	r3, #5376
	mov	lr, #0	@ movhi
	mov	r0, #3
	ldr	r1, .L18
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r4, .L18+4
	strh	lr, [ip, #16]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #61440
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L18+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L18+12
	ldr	r3, .L18+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L19:
	.align	2
.L18:
	.word	instructionsTiles
	.word	DMANow
	.word	instructionsMap
	.word	updateInstructions
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
	ldr	r3, .L22
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L22+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToInstructions
.L23:
	.align	2
.L22:
	.word	oldButtons
	.word	buttons
	.size	updateSplash, .-updateSplash
	.align	2
	.global	goToControls
	.type	goToControls, %function
goToControls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	ip, #67108864
	mov	lr, #7424	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	r3, #4160
	mov	lr, #0	@ movhi
	mov	r0, #3
	ldr	r1, .L25
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r4, .L25+4
	strh	lr, [ip, #16]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #59392
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L25+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L25+12
	ldr	r3, .L25+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	controlsTiles
	.word	DMANow
	.word	controlsMap
	.word	updateControls
	.word	state
	.size	goToControls, .-goToControls
	.align	2
	.global	updateInstructions
	.type	updateInstructions, %function
updateInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L29
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L29+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToControls
.L30:
	.align	2
.L29:
	.word	oldButtons
	.word	buttons
	.size	updateInstructions, .-updateInstructions
	.align	2
	.global	initGame
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r2, #83886080
	mov	r5, #67108864
	mov	r6, #4352	@ movhi
	sub	sp, sp, #12
	ldr	r4, .L34
	mov	r0, #3
	ldr	r1, .L34+4
	add	r2, r2, #512
	mov	r3, #256
	strh	r6, [r5, #0]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L34+8
	add	r2, r2, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	ip, #55808
	mov	r3, #17664
	mov	r0, #3
	ldr	r1, .L34+12
	mov	r2, #100663296
	add	r3, r3, #16
	strh	ip, [r5, #8]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #53248
	mov	r3, #4096
	mov	r0, #3
	ldr	r1, .L34+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L34+20
	add	r2, r3, #1016
.L32:
	mov	r7, #512	@ movhi
	strh	r7, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L32
	ldr	r3, .L34+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+28
	mov	lr, pc
	bx	r3
	ldr	ip, .L34+32
	mov	r4, #0
	mov	r5, #1
	mov	r9, #140
	mov	r3, #200
	str	r5, [ip, #12]
	str	r9, [ip, #0]
	stmib	ip, {r3, r4}	@ phole stm
	ldr	r8, .L34+36
	mov	sl, ip
	ldmia	sl!, {r0, r1, r2, r3}
	mov	r7, r8
	stmia	r7!, {r0, r1, r2, r3}
	mov	r6, #16
	ldr	r3, .L34+40
	str	r7, [sp, #4]
	mov	r7, #32
	str	r7, [ip, #16]
	str	r6, [ip, #20]
	str	r4, [ip, #24]
	str	r6, [r3, #16]
	mov	r6, #10
	str	r7, [r3, #20]
	str	r6, [r3, #44]
	ldmia	sl, {r0, r1, r2}
	mov	fp, #32768
	mov	r6, #1280
	ldr	r7, [sp, #4]
	str	fp, [r3, #0]
	str	r6, [r3, #48]
	mov	fp, #112
	mov	r6, #40
	str	r5, [r3, #12]
	str	r5, [r3, #40]
	str	r6, [r3, #52]
	str	fp, [r3, #4]
	str	r4, [r3, #8]
	str	r4, [r3, #24]
	str	r4, [r3, #32]
	str	r4, [r3, #36]
	stmia	r7, {r0, r1, r2}
	ldmia	ip!, {r0, r1, r2, r3}
	add	r8, r8, #28
	stmia	r8!, {r0, r1, r2, r3}
	ldr	ip, .L34+44
	mov	r3, #220
	str	r5, [ip, #12]
	ldmia	sl, {r0, r1, r2}
	str	r9, [ip, #0]
	stmib	ip, {r3, r4}	@ phole stm
	ldr	r6, .L34+48
	mov	r5, ip
	stmia	r8, {r0, r1, r2}
	ldmia	r5!, {r0, r1, r2, r3}
	mov	r7, r6
	stmia	r7!, {r0, r1, r2, r3}
	mov	r1, #10
	mov	r2, #8
	str	r1, [ip, #16]
	str	r2, [ip, #20]
	str	r4, [ip, #24]
	ldmia	r5, {r0, r1, r2}
	stmia	r7, {r0, r1, r2}
	ldmia	ip!, {r0, r1, r2, r3}
	add	r6, r6, #28
	stmia	r6!, {r0, r1, r2, r3}
	ldr	r3, .L34+52
	ldmia	r5, {r0, r1, r2}
	str	r4, [r3, #0]
	ldr	r3, .L34+56
	stmia	r6, {r0, r1, r2}
	mov	r2, #3
	str	r2, [r3, #0]
	ldr	r3, .L34+60
	str	r4, [r3, #0]
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L35:
	.align	2
.L34:
	.word	DMANow
	.word	spritesheetPal
	.word	spritesheetTiles
	.word	movebackgroundTiles
	.word	movebackgroundMap
	.word	shadowOAM
	.word	setupInterrupts
	.word	setupSounds
	.word	c
	.word	cats
	.word	p
	.word	health
	.word	hearts
	.word	hOff
	.word	lives
	.word	score
	.size	initGame, .-initGame
	.align	2
	.global	goToGame
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L37
	stmfd	sp!, {r4, lr}
	ldrh	lr, [r3, #0]
	mov	ip, #67108864
	mov	r1, #193536
	mov	r2, #11008
	mov	r4, #4352	@ movhi
	add	r2, r2, #17
	mov	r3, #1
	strh	r4, [ip, #0]	@ movhi
	strh	lr, [ip, #16]	@ movhi
	ldr	r0, .L37+4
	sub	r1, r1, #223
	ldr	ip, .L37+8
	mov	lr, pc
	bx	ip
	ldr	r2, .L37+12
	ldr	r3, .L37+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L38:
	.align	2
.L37:
	.word	hOff
	.word	uke
	.word	playSoundA
	.word	updateGame
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	updatePause
	.type	updatePause, %function
updatePause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L44
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L40
	ldr	r2, .L44+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L42
.L40:
	tst	r3, #4
	beq	.L39
	ldr	r3, .L44+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L43
.L39:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L43:
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L42:
	bl	goToGame
	ldr	r3, [r4, #0]
	b	.L40
.L45:
	.align	2
.L44:
	.word	oldButtons
	.word	buttons
	.size	updatePause, .-updatePause
	.align	2
	.global	updateControls
	.type	updateControls, %function
updateControls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L49
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L46
	ldr	r3, .L49+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L48
.L46:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L48:
	bl	initGame
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L50:
	.align	2
.L49:
	.word	oldButtons
	.word	buttons
	.size	updateControls, .-updateControls
	.align	2
	.global	goToPause
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}
	mov	lr, #7680
	mov	ip, #67108864
	add	lr, lr, #8
	strh	lr, [ip, #12]	@ movhi
	mov	r6, #100663296
	mov	lr, #0	@ movhi
	mov	r5, #1024
	mov	r0, #3
	ldr	r1, .L52
	add	r2, r6, #32768
	mov	r3, #1568
	ldr	r4, .L52+4
	strh	r5, [ip, #0]	@ movhi
	strh	lr, [ip, #24]	@ movhi
	mov	lr, pc
	bx	r4
	add	r2, r6, #61440
	mov	r3, r5
	mov	r0, #3
	ldr	r1, .L52+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L52+12
	ldr	r3, .L52+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L53:
	.align	2
.L52:
	.word	pausescreenTiles
	.word	DMANow
	.word	pausescreenMap
	.word	updatePause
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	goToWin
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	ip, #67108864
	mov	lr, #7680	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	lr, #256	@ movhi
	strh	lr, [ip, #0]	@ movhi
	mov	lr, #0	@ movhi
	mov	r0, #3
	ldr	r1, .L55
	mov	r2, #100663296
	mov	r3, #1088
	ldr	r4, .L55+4
	strh	lr, [ip, #16]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #61440
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L55+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L55+12
	ldr	r3, .L55+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L56:
	.align	2
.L55:
	.word	winscreenTiles
	.word	DMANow
	.word	winscreenMap
	.word	updateWin
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	goToLose
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	mov	ip, #67108864
	mov	lr, #7680	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	lr, #256	@ movhi
	strh	lr, [ip, #0]	@ movhi
	mov	lr, #0	@ movhi
	mov	r0, #3
	ldr	r1, .L58
	mov	r2, #100663296
	mov	r3, #1424
	ldr	r4, .L58+4
	strh	lr, [ip, #16]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #61440
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L58+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L58+12
	ldr	r3, .L58+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L59:
	.align	2
.L58:
	.word	losescreenTiles
	.word	DMANow
	.word	losescreenMap
	.word	updateLose
	.word	state
	.size	goToLose, .-goToLose
	.global	__aeabi_idivmod
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L113
	sub	sp, sp, #12
	mov	r2, #67108864
	ldr	r3, [r4, #8]
	ldr	ip, [r4, #52]
	ldr	r0, [r2, #304]
	ldr	r1, [r4, #0]
	add	r3, ip, r3
	add	r1, r3, r1
	tst	r0, #16
	str	r3, [r4, #8]
	str	r1, [r4, #0]
	bne	.L61
	ldr	r3, [r2, #304]
	tst	r3, #32
	bne	.L103
.L61:
	ldr	r3, [r4, #28]
	mov	r2, #0
	str	r2, [r4, #32]
	str	r3, [r4, #24]
.L63:
	mov	r3, #67108864
	ldr	r2, [r3, #304]
	tst	r2, #16
	beq	.L64
	ldr	r3, [r3, #304]
	tst	r3, #32
	ldrne	r8, .L113+4
	beq	.L64
.L65:
	mov	r3, #67108864
	ldr	r6, [r3, #304]
	ands	r6, r6, #1
	ldrne	r7, .L113+8
	bne	.L69
	ldr	r7, .L113+8
	ldr	r5, .L113+12
	mov	r1, r7
	ldr	r0, .L113
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldrne	r3, .L113+16
	ldrne	r2, [r3, #0]
	addne	r2, r2, #1
	strne	r6, [r7, #24]
	strne	r2, [r3, #0]
	ldr	r0, .L113
	ldr	r1, .L113+20
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L104
.L69:
	ldr	sl, .L113+24
	ldr	r3, [sl, #0]
	tst	r3, #1
	beq	.L71
	ldr	r2, .L113+28
	ldr	r2, [r2, #0]
	tst	r2, #1
	ldreq	r9, .L113+32
	beq	.L72
.L71:
	mov	r5, #0
	ldr	r6, .L113+8
	ldr	r9, .L113+32
	ldr	fp, .L113+12
	mov	r3, r5
.L74:
	ldr	r2, [r6, #24]
	cmp	r2, #0
	bne	.L105
.L73:
	add	r5, r5, #1
	cmp	r5, #2
	add	r6, r6, #28
	bne	.L74
	ldr	r3, [sl, #0]
.L72:
	ldr	r2, [r4, #20]
	ldr	r1, [r4, #0]
	rsb	r2, r2, #159
	cmp	r2, r1, asr #8
	ldr	r1, .L113
	movle	r2, r2, asl #8
	strle	r2, [r1, #0]
	movle	r2, #0
	strle	r2, [r1, #8]
	tst	r3, #2
	beq	.L76
	ldr	r3, .L113+28
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L106
.L76:
	ldr	r4, .L113+36
	ldr	sl, .L113+40
	ldr	r6, [r4, #0]
	ldr	r5, .L113+44
	mov	r0, r6
	ldr	r1, [sl, #0]
	mov	lr, pc
	bx	r5
	add	r6, r6, #1
	cmp	r1, #0
	str	r6, [r4, #0]
	ldrne	r6, .L113+48
	bne	.L77
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L78
	ldr	r3, .L113+8
	ldr	r3, [r3, #52]
	cmp	r3, #0
	ldrne	r6, .L113+48
	beq	.L107
.L79:
	ldr	r0, .L113+8
	ldr	r3, .L113+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L113+12
	ldr	r0, .L113
	ldr	r1, .L113+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r7, #52]
	cmp	r3, #0
	beq	.L81
.L108:
	ldr	r0, .L113+20
	ldr	r3, .L113+52
	mov	lr, pc
	bx	r3
	ldr	r1, .L113+20
	ldr	r3, .L113+12
	ldr	r0, .L113
	mov	lr, pc
	bx	r3
	b	.L81
.L64:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	ldreq	r8, .L113+4
	ldreq	r3, [r8, #0]
	moveq	r2, #2
	addeq	r3, r3, #1
	streq	r2, [r4, #24]
	streq	r3, [r8, #0]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	ldrne	r8, .L113+4
	tst	r3, #32
	ldreq	r3, [r8, #0]
	moveq	r2, #1
	subeq	r3, r3, #1
	streq	r2, [r4, #24]
	streq	r3, [r8, #0]
	ldr	r2, .L113+56
	ldr	r3, [r4, #36]
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	add	r2, r2, r3
	rsb	r2, r1, r2, asr #4
	rsb	r2, r2, r2, asl #4
	subs	r3, r3, r2, asl #1
	ldr	r1, .L113
	bne	.L65
	ldr	r0, [r1, #32]
	cmp	r0, #1
	addle	r0, r0, #1
	strle	r0, [r1, #32]
	ble	.L65
	cmp	r0, #2
	streq	r3, [r1, #32]
	b	.L65
.L107:
	mov	r3, #1
.L78:
	rsb	r3, r3, r3, asl #3
	add	r3, r7, r3, asl #2
	mov	r2, #1
	str	r2, [r3, #24]
	mov	r2, #220
	str	r2, [r3, #4]
	ldr	r6, .L113+48
	mov	lr, pc
	bx	r6
	ldr	r2, .L113+60
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, asl #2
	rsb	r3, r3, r3, asl #4
	sub	r3, r0, r3, asl #2
	add	r3, r3, #87
	str	r3, [sl, #0]
.L77:
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L79
	ldr	r3, [r7, #52]
	cmp	r3, #0
	bne	.L108
.L81:
	ldr	r7, [r4, #0]
	mov	lr, pc
	bx	r6
	add	r3, r7, #1
	str	r3, [r4, #0]
	mov	r1, r0
	mov	r0, r7
	mov	lr, pc
	bx	r5
	ldr	r3, .L113+64
	smull	r2, r3, r1, r3
	mov	r2, r1, asr #31
	rsb	r3, r2, r3, asr #5
	add	r3, r3, r3, asl #2
	add	r3, r3, r3, asl #2
	cmp	r1, r3, asl #2
	ldreq	r4, .L113+68
	bne	.L109
.L82:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L84
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L110
.L86:
	ldr	r3, [r9, #0]
	ldrh	r2, [r8, #0]
	cmp	r3, #0
	mov	r3, #67108864
	strh	r2, [r3, #16]	@ movhi
	ble	.L111
.L60:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L109:
	ldr	r4, .L113+68
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L83
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L112
.L84:
	ldr	r3, .L113+72
	ldr	r0, .L113+68
	ldr	r1, .L113
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L86
.L110:
	ldr	r3, .L113+72
	ldr	r0, .L113+76
	ldr	r1, .L113
	mov	lr, pc
	bx	r3
	ldr	r3, [r9, #0]
	ldrh	r2, [r8, #0]
	cmp	r3, #0
	mov	r3, #67108864
	strh	r2, [r3, #16]	@ movhi
	bgt	.L60
.L111:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	goToLose
.L103:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L61
	ldr	r3, [r4, #36]
	add	r3, r3, #1
	str	r3, [r4, #36]
	b	.L63
.L106:
	ldr	r3, [r4, #44]
	ldr	r2, [r4, #8]
	rsb	r1, r3, #0
	cmp	r2, r1
	ldr	r1, .L113
	ble	.L76
	cmp	r2, r3
	ldrlt	r3, [r1, #48]
	rsblt	r3, r3, #0
	strlt	r3, [r1, #8]
	b	.L76
.L104:
	ldr	r3, .L113+16
	ldr	r2, [r3, #0]
	mov	r1, #0
	add	r2, r2, #1
	str	r1, [r7, #52]
	str	r2, [r3, #0]
	b	.L69
.L105:
	rsb	r1, r5, r5, asl #3
	str	r3, [sp, #4]
	ldr	r0, .L113
	add	r1, r7, r1, asl #2
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldrne	r2, [r9, #0]
	ldr	r3, [sp, #4]
	subne	r2, r2, #1
	strne	r3, [r6, #24]
	strne	r2, [r9, #0]
	b	.L73
.L112:
	mov	r3, #1
.L83:
	rsb	r3, r3, r3, asl #3
	add	r3, r4, r3, asl #2
	mov	r2, #1
	str	r2, [r3, #24]
	b	.L82
.L114:
	.align	2
.L113:
	.word	p
	.word	hOff
	.word	cats
	.word	collisionEnemyPlayer
	.word	score
	.word	cats+28
	.word	oldButtons
	.word	buttons
	.word	lives
	.word	time
	.word	timeToNextCat
	.word	__aeabi_idivmod
	.word	rand
	.word	updateCat
	.word	-2004318071
	.word	458129845
	.word	1374389535
	.word	hearts
	.word	updateHealth
	.word	hearts+28
	.size	update, .-update
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L128
	ldr	r2, .L128+4
	ldr	ip, [r3, #0]
	ldr	r0, [r3, #4]
	ldr	lr, [r2, #24]
	ldr	r1, [r3, #32]
	mov	ip, ip, asr #8
	ldr	r3, .L128+8
	mvn	r0, r0, asl #17
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
	beq	.L117
	ldmia	r2, {r0, r1}	@ phole ldm
	mvn	r1, r1, asl #17
	mvn	r1, r1, lsr #17
	orr	r0, r0, #16384
	strh	r1, [r3, #10]	@ movhi
	mov	r1, #8	@ movhi
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3, #12]	@ movhi
.L117:
	ldr	r2, [r2, #52]
	cmp	r2, #0
	ldr	r2, .L128+4
	moveq	r2, #512	@ movhi
	streqh	r2, [r3, #16]	@ movhi
	bne	.L126
	ldr	r2, .L128+12
	ldr	r0, [r2, #0]
	cmp	r0, #0
	movle	r0, #512	@ movhi
	strleh	r0, [r3, #32]	@ movhi
	ble	.L121
.L127:
	mov	ip, #24	@ movhi
	mov	r1, #16384
	add	r1, r1, #5
	strh	ip, [r3, #34]	@ movhi
	cmp	r0, #1
	mov	ip, #12	@ movhi
	ldr	r2, .L128+8
	strh	r1, [r3, #32]	@ movhi
	strh	ip, [r3, #36]	@ movhi
	ble	.L121
	cmp	r0, #2
	mov	ip, #34	@ movhi
	mov	r0, #12	@ movhi
	strh	r1, [r2, #40]	@ movhi
	strh	ip, [r2, #42]	@ movhi
	strh	r0, [r2, #44]	@ movhi
	ble	.L123
	mov	r3, #44	@ movhi
	mov	ip, #12	@ movhi
	strh	r1, [r2, #48]	@ movhi
	strh	r3, [r2, #50]	@ movhi
	strh	ip, [r2, #52]	@ movhi
.L125:
	mov	r0, #3
	ldr	r1, .L128+8
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L128+16
	mov	lr, pc
	bx	ip
	ldr	r3, .L128+20
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L121:
	mov	r0, #512	@ movhi
	strh	r0, [r3, #40]	@ movhi
.L123:
	mov	r1, #512	@ movhi
	strh	r1, [r3, #48]	@ movhi
	b	.L125
.L126:
	ldr	r0, [r2, #32]
	ldr	r1, [r2, #28]
	mvn	r2, r0, asl #17
	mvn	r2, r2, lsr #17
	strh	r2, [r3, #18]	@ movhi
	ldr	r2, .L128+12
	ldr	r0, [r2, #0]
	cmp	r0, #0
	orr	r1, r1, #16384
	mov	ip, #8	@ movhi
	movle	r0, #512	@ movhi
	strh	r1, [r3, #16]	@ movhi
	strh	ip, [r3, #20]	@ movhi
	strleh	r0, [r3, #32]	@ movhi
	ble	.L121
	b	.L127
.L129:
	.align	2
.L128:
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
	ldr	r4, .L135
	bl	update
	ldr	r3, .L135+4
	mov	lr, pc
	bx	r3
	bl	draw
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L131
	ldr	r2, .L135+8
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L133
.L131:
	tst	r3, #4
	beq	.L130
	ldr	r3, .L135+8
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L134
.L130:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L134:
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L133:
	bl	goToPause
	ldr	r3, [r4, #0]
	b	.L131
.L136:
	.align	2
.L135:
	.word	oldButtons
	.word	waitForVblank
	.word	buttons
	.size	updateGame, .-updateGame
	.align	2
	.global	hideSprites
	.type	hideSprites, %function
hideSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L140
	add	r2, r3, #1016
.L138:
	mov	r1, #512	@ movhi
	strh	r1, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L138
	bx	lr
.L141:
	.align	2
.L140:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.comm	score,4,4
	.comm	prevScore,4,4
	.comm	lives,4,4
	.comm	time,4,4
	.comm	hOff,4,4
	.comm	gamehOff,4,4
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	shadowOAM,1024,4
	.comm	p,60,4
	.comm	c,28,4
	.comm	cats,56,4
	.comm	timeToNextCat,4,4
	.comm	health,28,4
	.comm	hearts,56,4
	.comm	fridge,24,4
	.comm	state,4,4
	.comm	currFrame,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
