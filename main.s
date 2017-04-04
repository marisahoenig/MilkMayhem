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
	mov	r7, #4352	@ movhi
	sub	sp, sp, #12
	ldr	r4, .L36
	mov	r0, #3
	ldr	r1, .L36+4
	add	r2, r2, #512
	mov	r3, #256
	strh	r7, [r5, #0]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L36+8
	add	r2, r2, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	ip, #55808
	mov	r3, #17664
	mov	r0, #3
	ldr	r1, .L36+12
	mov	r2, #100663296
	add	r3, r3, #16
	strh	ip, [r5, #8]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #53248
	mov	r3, #4096
	mov	r0, #3
	ldr	r1, .L36+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L36+20
	add	r2, r3, #1016
.L32:
	mov	r8, #512	@ movhi
	strh	r8, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L32
	ldr	r3, .L36+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L36+28
	mov	lr, pc
	bx	r3
	ldr	ip, .L36+32
	mov	r5, #0
	mov	r4, #1
	mov	sl, #140
	mov	r3, #200
	str	r4, [ip, #12]
	str	sl, [ip, #0]
	stmib	ip, {r3, r5}	@ phole stm
	ldr	r6, .L36+36
	mov	r8, ip
	ldmia	r8!, {r0, r1, r2, r3}
	mov	r7, r6
	stmia	r7!, {r0, r1, r2, r3}
	ldr	r3, .L36+40
	str	r7, [sp, #4]
	mov	r7, #16
	str	r7, [ip, #20]
	mov	r9, #32
	str	r7, [r3, #16]
	mov	r7, #10
	str	r9, [ip, #16]
	str	r5, [ip, #24]
	str	r7, [r3, #44]
	mov	fp, #32768
	mov	r7, #1280
	str	fp, [r3, #0]
	str	r7, [r3, #48]
	mov	fp, #112
	mov	r7, #40
	ldmia	r8, {r0, r1, r2}
	str	r4, [r3, #12]
	str	r4, [r3, #40]
	str	r7, [r3, #52]
	str	fp, [r3, #4]
	str	r5, [r3, #8]
	str	r9, [r3, #20]
	str	r5, [r3, #24]
	str	r5, [r3, #32]
	str	r5, [r3, #36]
	ldr	r3, [sp, #4]
	stmia	r3, {r0, r1, r2}
	ldmia	ip!, {r0, r1, r2, r3}
	add	r6, r6, #28
	stmia	r6!, {r0, r1, r2, r3}
	ldr	ip, .L36+44
	ldmia	r8, {r0, r1, r2}
	mov	r3, #220
	str	r4, [ip, #12]
	str	sl, [ip, #0]
	stmib	ip, {r3, r5}	@ phole stm
	stmia	r6, {r0, r1, r2}
	mov	r7, ip
	ldr	r6, .L36+48
	ldmia	r7!, {r0, r1, r2, r3}
	mov	r8, r6
	stmia	r8!, {r0, r1, r2, r3}
	mov	r4, #8
	mov	r1, #10
	str	r1, [ip, #16]
	str	r4, [ip, #20]
	str	r5, [ip, #24]
	ldmia	r7, {r0, r1, r2}
	stmia	r8, {r0, r1, r2}
	ldmia	ip!, {r0, r1, r2, r3}
	add	r6, r6, #28
	stmia	r6!, {r0, r1, r2, r3}
	ldmia	r7, {r0, r1, r2}
	ldr	r3, .L36+52
	stmia	r6, {r0, r1, r2}
	mov	r2, #208
	str	r2, [r3, #4]
	mvn	r2, #0
	ldr	ip, .L36+56
	str	r2, [r3, #12]
	mov	r2, #64
	str	r5, [r3, #0]
	str	r5, [r3, #8]
	str	r9, [r3, #16]
	str	r2, [r3, #20]
	str	r5, [r3, #24]
	mov	r3, #145
	str	r3, [ip, #0]
	mov	r3, #2
	str	r5, [ip, #4]
	str	r3, [ip, #8]
	str	r4, [ip, #12]
	str	r4, [ip, #16]
	str	r5, [ip, #20]
	ldr	r7, .L36+60
.L33:
	mov	r6, ip
	ldmia	r6!, {r0, r1, r2, r3}
	add	r4, r7, r5
	stmia	r4!, {r0, r1, r2, r3}
	add	r5, r5, #24
	ldmia	r6, {r0, r1}
	cmp	r5, #120
	stmia	r4, {r0, r1}
	bne	.L33
	ldr	r2, .L36+64
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L36+68
	mov	r1, #3
	str	r1, [r2, #0]
	ldr	r2, .L36+72
	str	r3, [r2, #0]
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L37:
	.align	2
.L36:
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
	.word	fridge
	.word	bullet
	.word	bullets
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
	ldr	r3, .L39
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
	ldr	r0, .L39+4
	sub	r1, r1, #223
	ldr	ip, .L39+8
	mov	lr, pc
	bx	ip
	ldr	r2, .L39+12
	ldr	r3, .L39+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L40:
	.align	2
.L39:
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
	ldr	r4, .L46
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L42
	ldr	r2, .L46+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L44
.L42:
	tst	r3, #4
	beq	.L41
	ldr	r3, .L46+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L45
.L41:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L45:
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L44:
	bl	goToGame
	ldr	r3, [r4, #0]
	b	.L42
.L47:
	.align	2
.L46:
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
	ldr	r3, .L51
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L48
	ldr	r3, .L51+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L50
.L48:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L50:
	bl	initGame
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L52:
	.align	2
.L51:
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
	ldr	r1, .L54
	add	r2, r6, #32768
	mov	r3, #1568
	ldr	r4, .L54+4
	strh	r5, [ip, #0]	@ movhi
	strh	lr, [ip, #24]	@ movhi
	mov	lr, pc
	bx	r4
	add	r2, r6, #61440
	mov	r3, r5
	mov	r0, #3
	ldr	r1, .L54+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L54+12
	ldr	r3, .L54+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L55:
	.align	2
.L54:
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
	ldr	r1, .L57
	mov	r2, #100663296
	mov	r3, #1088
	ldr	r4, .L57+4
	strh	lr, [ip, #16]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #61440
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L57+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L57+12
	ldr	r3, .L57+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L58:
	.align	2
.L57:
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
	ldr	r1, .L60
	mov	r2, #100663296
	mov	r3, #1424
	ldr	r4, .L60+4
	strh	lr, [ip, #16]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #61440
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L60+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L60+12
	ldr	r3, .L60+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L61:
	.align	2
.L60:
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
	ldr	r4, .L117
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
	bne	.L63
	ldr	r3, [r2, #304]
	tst	r3, #32
	bne	.L107
.L63:
	ldr	r3, [r4, #28]
	mov	r2, #0
	str	r2, [r4, #32]
	str	r3, [r4, #24]
.L65:
	mov	r3, #67108864
	ldr	r2, [r3, #304]
	tst	r2, #16
	beq	.L66
	ldr	r3, [r3, #304]
	tst	r3, #32
	ldrne	sl, .L117+4
	beq	.L66
.L67:
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #0]
	rsb	r3, r3, #159
	cmp	r3, r2, asr #8
	ldr	r2, .L117
	movle	r3, r3, asl #8
	ldr	r9, .L117+8
	strle	r3, [r2, #0]
	movle	r3, #0
	strle	r3, [r2, #8]
	ldr	r3, [r9, #0]
	tst	r3, #2
	beq	.L72
	ldr	r3, .L117+12
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L108
.L72:
	ldr	r8, .L117+16
	ldr	r5, .L117+20
	ldr	r6, [r8, #0]
	ldr	r1, [r5, #0]
	mov	r0, r6
	ldr	r2, .L117+24
	mov	lr, pc
	bx	r2
	add	r6, r6, #1
	cmp	r1, #0
	str	r6, [r8, #0]
	beq	.L73
	ldr	r3, .L117+28
	ldr	r7, .L117+32
	str	r3, [sp, #4]
	ldr	r3, [r7, #24]
.L74:
	cmp	r3, #0
	mov	r5, #0
	ldr	r6, .L117+32
	ldr	ip, .L117+36
	bne	.L109
.L76:
	add	r5, r5, #1
	cmp	r5, #2
	add	r6, r6, #28
	beq	.L77
.L110:
	ldr	r3, [r6, #24]
	cmp	r3, #0
	beq	.L76
.L109:
	rsb	fp, r5, r5, asl #3
	add	fp, r7, fp, asl #2
	mov	r0, fp
	str	ip, [sp, #0]
	mov	lr, pc
	bx	ip
	mov	r1, fp
	ldr	r0, .L117
	ldr	fp, .L117+40
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldr	ip, [sp, #0]
	beq	.L76
	mov	r1, #4864
	mov	r2, #11008
	add	r1, r1, #10
	add	r2, r2, #17
	mov	r3, #0
	ldr	r0, .L117+44
	ldr	fp, .L117+48
	mov	lr, pc
	bx	fp
	ldr	r1, .L117+52
	ldr	r3, [r1, #0]
	add	r5, r5, #1
	sub	r3, r3, #1
	mov	r2, #0
	cmp	r5, #2
	str	r2, [r6, #24]
	str	r3, [r1, #0]
	ldr	ip, [sp, #0]
	add	r6, r6, #28
	bne	.L110
.L77:
	ldr	r3, [r9, #0]
	tst	r3, #1
	beq	.L106
	ldr	r3, .L117+12
	ldr	r3, [r3, #0]
	ands	r3, r3, #1
	beq	.L104
.L106:
	ldr	r9, .L117+56
.L79:
	ldr	r5, .L117+56
	ldr	fp, .L117+60
	mov	r4, #0
.L81:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	bne	.L111
.L83:
	add	r4, r4, #1
	cmp	r4, #5
	add	r5, r5, #24
	bne	.L81
	ldr	r3, [sp, #4]
	ldr	r4, [r8, #0]
	mov	lr, pc
	bx	r3
	add	r3, r4, #1
	mov	r1, r0
	str	r3, [r8, #0]
	mov	r0, r4
	ldr	fp, .L117+24
	mov	lr, pc
	bx	fp
	ldr	r3, .L117+64
	smull	r2, r3, r1, r3
	mov	r2, r1, asr #31
	rsb	r3, r2, r3, asr #5
	add	r3, r3, r3, asl #2
	add	r3, r3, r3, asl #2
	cmp	r1, r3, asl #2
	ldreq	r4, .L117+68
	beq	.L85
	ldr	r4, .L117+68
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L86
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L112
.L87:
	ldr	r3, .L117+72
	ldr	r0, .L117+68
	ldr	r1, .L117
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L89
.L114:
	ldr	fp, .L117+52
	ldr	r3, .L117+72
	ldr	r0, .L117+76
	ldr	r1, .L117
	mov	lr, pc
	bx	r3
	ldr	r3, [fp, #0]
	ldrh	r2, [sl, #0]
	cmp	r3, #0
	mov	r3, #67108864
	strh	r2, [r3, #16]	@ movhi
	bgt	.L62
.L115:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	goToLose
.L66:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	ldreq	sl, .L117+4
	ldreq	r3, [sl, #0]
	moveq	r2, #2
	addeq	r3, r3, #1
	streq	r2, [r4, #24]
	streq	r3, [sl, #0]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	ldrne	sl, .L117+4
	tst	r3, #32
	ldreq	r3, [sl, #0]
	moveq	r2, #1
	subeq	r3, r3, #1
	streq	r2, [r4, #24]
	streq	r3, [sl, #0]
	ldr	r2, .L117+80
	ldr	r3, [r4, #36]
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	add	r2, r2, r3
	rsb	r2, r1, r2, asr #4
	rsb	r2, r2, r2, asl #4
	subs	r3, r3, r2, asl #1
	ldr	r1, .L117
	bne	.L67
	ldr	r0, [r1, #32]
	cmp	r0, #1
	addle	r0, r0, #1
	strle	r0, [r1, #32]
	ble	.L67
	cmp	r0, #2
	streq	r3, [r1, #32]
	b	.L67
.L111:
	add	r6, r4, r4, asl #1
	add	r6, r9, r6, asl #3
	mov	r0, r6
	mov	lr, pc
	bx	fp
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L113
.L84:
	ldr	r3, [r7, #52]
	cmp	r3, #0
	beq	.L83
	mov	r0, r6
	ldr	r1, .L117+84
	ldr	r2, .L117+88
	mov	lr, pc
	bx	r2
	b	.L83
.L112:
	mov	r3, #1
.L86:
	rsb	r3, r3, r3, asl #3
	add	r3, r4, r3, asl #2
	mov	r2, #1
	str	r2, [r3, #24]
.L85:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L87
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L114
.L89:
	ldr	fp, .L117+52
	ldr	r3, [fp, #0]
	ldrh	r2, [sl, #0]
	cmp	r3, #0
	mov	r3, #67108864
	strh	r2, [r3, #16]	@ movhi
	ble	.L115
.L62:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L73:
	ldr	r7, .L117+32
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L75
	ldr	r2, [r7, #52]
	cmp	r2, #0
	beq	.L102
	ldr	fp, .L117+28
	str	fp, [sp, #4]
	b	.L74
.L108:
	ldr	r3, [r4, #44]
	ldr	r2, [r4, #8]
	rsb	r1, r3, #0
	cmp	r2, r1
	ldr	r1, .L117
	ble	.L72
	cmp	r2, r3
	ldrlt	r3, [r1, #48]
	rsblt	r3, r3, #0
	strlt	r3, [r1, #8]
	b	.L72
.L107:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L63
	ldr	r3, [r4, #36]
	add	r3, r3, #1
	str	r3, [r4, #36]
	b	.L65
.L104:
	ldr	r9, .L117+56
	mov	r2, r9
.L82:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	beq	.L116
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #24
	bne	.L82
	b	.L79
.L113:
	mov	r0, r6
	ldr	r1, .L117+32
	ldr	r3, .L117+88
	mov	lr, pc
	bx	r3
	b	.L84
.L102:
	mov	r3, #1
.L75:
	rsb	r3, r3, r3, asl #3
	add	r3, r7, r3, asl #2
	ldr	r1, .L117+28
	mov	r2, #1
	str	r2, [r3, #24]
	mov	r2, #220
	str	r2, [r3, #4]
	str	r1, [sp, #4]
	mov	lr, pc
	bx	r1
	ldr	r2, .L117+92
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, asl #2
	rsb	r3, r3, r3, asl #4
	sub	r3, r0, r3, asl #2
	add	r3, r3, #87
	str	r3, [r5, #0]
	ldr	r3, [r7, #24]
	b	.L74
.L116:
	ldr	r2, [r4, #20]
	ldmia	r4, {r0, r1}	@ phole ldm
	add	ip, r2, r2, lsr #31
	add	r3, r3, r3, asl #1
	mov	r0, r0, asr #8
	add	r2, r9, r3, asl #3
	add	r0, r0, ip, asr #1
	add	r1, r1, #8
	mov	ip, #1
	str	ip, [r2, #20]
	str	r0, [r9, r3, asl #3]
	str	r1, [r2, #4]
	b	.L79
.L118:
	.align	2
.L117:
	.word	p
	.word	hOff
	.word	oldButtons
	.word	buttons
	.word	time
	.word	timeToNextCat
	.word	__aeabi_idivmod
	.word	rand
	.word	cats
	.word	updateCat
	.word	collisionEnemyPlayer
	.word	meow
	.word	playSoundB
	.word	lives
	.word	bullets
	.word	updateBullet
	.word	1374389535
	.word	hearts
	.word	updateHealth
	.word	hearts+28
	.word	-2004318071
	.word	cats+28
	.word	collisionCheckEnemy
	.word	458129845
	.size	update, .-update
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L135
	stmfd	sp!, {r3, lr}
	ldr	r3, .L135+4
	ldr	r0, [r2, #4]
	ldrb	ip, [r2, #1]	@ zero_extendqisi2
	ldr	lr, [r3, #24]
	ldr	r1, .L135+8
	ldr	r2, [r2, #32]
	mvn	r0, r0, asl #17
	mvn	r0, r0, lsr #17
	cmp	lr, #0
	mvn	ip, ip, asl #17
	mvn	ip, ip, lsr #17
	mov	r2, r2, asl #1
	strh	r0, [r1, #2]	@ movhi
	moveq	r0, #512	@ movhi
	strh	ip, [r1, #0]	@ movhi
	strh	r2, [r1, #4]	@ movhi
	streqh	r0, [r1, #8]	@ movhi
	beq	.L121
	ldr	r2, [r3, #4]
	ldrb	r0, [r3, #0]	@ zero_extendqisi2
	mvn	r2, r2, asl #17
	mvn	r2, r2, lsr #17
	orr	r0, r0, #16384
	strh	r2, [r1, #10]	@ movhi
	mov	r2, #8	@ movhi
	strh	r0, [r1, #8]	@ movhi
	strh	r2, [r1, #12]	@ movhi
.L121:
	ldr	r3, [r3, #52]
	cmp	r3, #0
	ldr	r3, .L135+4
	bne	.L122
	mov	r3, #512	@ movhi
	strh	r3, [r1, #16]	@ movhi
.L124:
	ldr	r3, .L135+12
	ldr	r2, .L135+8
	add	ip, r3, #120
.L123:
	ldr	r0, [r3, #0]
	cmp	r0, #0
	ldrneb	r0, [r3, #-20]	@ zero_extendqisi2
	ldrneh	lr, [r3, #-16]
	strneh	r0, [r2, #88]	@ movhi
	moveq	lr, #512	@ movhi
	movne	r0, #128	@ movhi
	add	r3, r3, #24
	strneh	lr, [r2, #90]	@ movhi
	strneh	r0, [r2, #92]	@ movhi
	streqh	lr, [r2, #88]	@ movhi
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L123
	ldr	r3, .L135+16
	ldr	r0, [r3, #0]
	cmp	r0, #0
	movle	r0, #512	@ movhi
	strleh	r0, [r1, #32]	@ movhi
	ble	.L128
	mov	r2, #16384
	add	r2, r2, #5
	mov	ip, #24	@ movhi
	mov	lr, #12	@ movhi
	cmp	r0, #1
	ldr	r3, .L135+8
	strh	r2, [r1, #32]	@ movhi
	strh	ip, [r1, #34]	@ movhi
	strh	lr, [r1, #36]	@ movhi
	ble	.L128
	mov	ip, #34	@ movhi
	mov	lr, #12	@ movhi
	cmp	r0, #2
	strh	r2, [r3, #40]	@ movhi
	strh	ip, [r3, #42]	@ movhi
	strh	lr, [r3, #44]	@ movhi
	ble	.L130
	strh	r2, [r3, #48]	@ movhi
	mov	ip, #12	@ movhi
	mov	r2, #44	@ movhi
	strh	r2, [r3, #50]	@ movhi
	strh	ip, [r3, #52]	@ movhi
.L132:
	ldr	r3, .L135+20
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L133
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [r3, #4]
	mvn	r2, r2, asl #17
	mvn	r3, r3, asl #18
	mvn	r2, r2, lsr #17
	mvn	r3, r3, lsr #18
	mov	lr, #14	@ movhi
	strh	r2, [r1, #80]	@ movhi
	strh	r3, [r1, #82]	@ movhi
	strh	lr, [r1, #84]	@ movhi
.L133:
	mov	r0, #3
	ldr	r1, .L135+8
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L135+24
	mov	lr, pc
	bx	ip
	ldr	r3, .L135+28
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L128:
	mov	r0, #512	@ movhi
	strh	r0, [r1, #40]	@ movhi
.L130:
	mov	r0, #512	@ movhi
	strh	r0, [r1, #48]	@ movhi
	b	.L132
.L122:
	ldr	r0, [r3, #32]
	ldrb	r2, [r3, #28]	@ zero_extendqisi2
	mvn	r3, r0, asl #17
	orr	r2, r2, #16384
	mvn	r3, r3, lsr #17
	mov	ip, #8	@ movhi
	strh	r2, [r1, #16]	@ movhi
	strh	r3, [r1, #18]	@ movhi
	strh	ip, [r1, #20]	@ movhi
	b	.L124
.L136:
	.align	2
.L135:
	.word	p
	.word	cats
	.word	shadowOAM
	.word	bullets+20
	.word	lives
	.word	fridge
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
	ldr	r4, .L142
	bl	update
	ldr	r3, .L142+4
	mov	lr, pc
	bx	r3
	bl	draw
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L138
	ldr	r2, .L142+8
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L140
.L138:
	tst	r3, #4
	beq	.L137
	ldr	r3, .L142+8
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L141
.L137:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L141:
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L140:
	bl	goToPause
	ldr	r3, [r4, #0]
	b	.L138
.L143:
	.align	2
.L142:
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
	ldr	r3, .L147
	add	r2, r3, #1016
.L145:
	mov	r1, #512	@ movhi
	strh	r1, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L145
	bx	lr
.L148:
	.align	2
.L147:
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
	.comm	fridge,28,4
	.comm	bullet,24,4
	.comm	bullets,120,4
	.comm	state,4,4
	.comm	currFrame,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
