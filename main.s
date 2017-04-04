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
	mov	r9, #512	@ movhi
	strh	r9, [r3, #8]!	@ movhi
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
	mov	r6, #1
	mov	sl, #140
	mov	r3, #200
	str	sl, [ip, #0]
	stmib	ip, {r3, r5, r6}	@ phole stm
	ldr	r4, .L36+36
	mov	r8, ip
	ldmia	r8!, {r0, r1, r2, r3}
	mov	r7, r4
	stmia	r7!, {r0, r1, r2, r3}
	ldr	r3, .L36+40
	mov	fp, #32
	str	r7, [sp, #4]
	mov	r9, #32256
	mov	r7, #16
	str	r7, [ip, #20]
	str	fp, [ip, #16]
	str	r5, [ip, #24]
	str	r9, [r3, #0]
	mov	r9, #112
	str	r9, [r3, #4]
	str	r7, [r3, #16]
	mov	r9, #2
	mov	r7, #10
	ldmia	r8, {r0, r1, r2}
	str	r9, [r3, #12]
	str	r7, [r3, #44]
	ldr	r9, [sp, #4]
	mov	r7, #1280
	str	r7, [r3, #48]
	mov	r7, #40
	str	r7, [r3, #52]
	str	r5, [r3, #8]
	str	fp, [r3, #20]
	str	r5, [r3, #24]
	str	r5, [r3, #32]
	str	r5, [r3, #36]
	str	r6, [r3, #40]
	stmia	r9, {r0, r1, r2}
	ldmia	ip!, {r0, r1, r2, r3}
	add	r4, r4, #28
	stmia	r4!, {r0, r1, r2, r3}
	ldr	ip, .L36+44
	ldmia	r8, {r0, r1, r2}
	mov	r3, #220
	str	sl, [ip, #0]
	stmib	ip, {r3, r5, r6}	@ phole stm
	stmia	r4, {r0, r1, r2}
	mov	r8, ip
	ldr	r4, .L36+48
	ldmia	r8!, {r0, r1, r2, r3}
	mov	sl, r4
	mov	r7, #8
	stmia	sl!, {r0, r1, r2, r3}
	mov	r1, #10
	str	r7, [ip, #20]
	str	r1, [ip, #16]
	str	r5, [ip, #24]
	ldmia	r8, {r0, r1, r2}
	stmia	sl, {r0, r1, r2}
	ldmia	ip!, {r0, r1, r2, r3}
	add	r4, r4, #28
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r8, {r0, r1, r2}
	ldr	r3, .L36+52
	stmia	r4, {r0, r1, r2}
	mov	r2, #96
	str	r2, [r3, #0]
	mov	r2, #208
	ldr	ip, .L36+56
	str	r2, [r3, #4]
	mov	r2, #64
	str	r2, [r3, #20]
	str	r5, [r3, #8]
	str	r6, [r3, #12]
	str	fp, [r3, #16]
	str	r5, [r3, #24]
	mov	r2, #2
	mov	r3, #145
	str	r7, [ip, #12]
	str	r7, [ip, #16]
	stmia	ip, {r3, r5}	@ phole stm
	str	r2, [ip, #8]
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
	stmfd	sp!, {r3, r4, r5, lr}
	mov	ip, #67108864
	mov	r5, #7680	@ movhi
	mov	lr, #0
	strh	r5, [ip, #8]	@ movhi
	mov	r5, #256	@ movhi
	strh	r5, [ip, #0]	@ movhi
	strh	lr, [ip, #16]	@ movhi
	ldr	ip, .L57
	mov	r0, #3
	ldr	r1, .L57+4
	mov	r2, #100663296
	mov	r3, #1088
	ldr	r4, .L57+8
	str	lr, [ip, #0]
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #61440
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L57+12
	mov	lr, pc
	bx	r4
	ldr	r2, .L57+16
	ldr	r3, .L57+20
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L58:
	.align	2
.L57:
	.word	hOff
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
	ldr	r4, .L125
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
	bne	.L112
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
	ldrne	sl, .L125+4
	beq	.L66
.L67:
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #0]
	rsb	r3, r3, #159
	cmp	r3, r2, asr #8
	ldr	r2, .L125
	movle	r3, r3, asl #8
	ldr	r9, .L125+8
	strle	r3, [r2, #0]
	movle	r3, #0
	strle	r3, [r2, #8]
	ldr	r3, [r9, #0]
	tst	r3, #2
	beq	.L72
	ldr	r3, .L125+12
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L113
.L72:
	ldr	r8, .L125+16
	ldr	r5, .L125+20
	ldr	r6, [r8, #0]
	ldr	r1, [r5, #0]
	mov	r0, r6
	ldr	r2, .L125+24
	mov	lr, pc
	bx	r2
	add	r6, r6, #1
	cmp	r1, #0
	str	r6, [r8, #0]
	beq	.L73
	ldr	r3, .L125+28
	ldr	r7, .L125+32
	str	r3, [sp, #4]
	ldr	r3, [r7, #24]
.L74:
	cmp	r3, #0
	mov	r5, #0
	ldr	r6, .L125+32
	ldr	ip, .L125+36
	bne	.L114
.L76:
	add	r5, r5, #1
	cmp	r5, #2
	add	r6, r6, #28
	beq	.L77
.L115:
	ldr	r3, [r6, #24]
	cmp	r3, #0
	beq	.L76
.L114:
	rsb	fp, r5, r5, asl #3
	add	fp, r7, fp, asl #2
	mov	r0, fp
	str	ip, [sp, #0]
	mov	lr, pc
	bx	ip
	mov	r1, fp
	ldr	r0, .L125
	ldr	fp, .L125+40
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
	ldr	r0, .L125+44
	ldr	fp, .L125+48
	mov	lr, pc
	bx	fp
	ldr	r1, .L125+52
	ldr	r3, [r1, #0]
	add	r5, r5, #1
	sub	r3, r3, #1
	mov	r2, #0
	cmp	r5, #2
	str	r2, [r6, #24]
	str	r3, [r1, #0]
	ldr	ip, [sp, #0]
	add	r6, r6, #28
	bne	.L115
.L77:
	ldr	r3, [r9, #0]
	tst	r3, #1
	beq	.L110
	ldr	r3, .L125+12
	ldr	r3, [r3, #0]
	ands	r3, r3, #1
	beq	.L108
.L110:
	ldr	r9, .L125+56
.L79:
	ldr	r5, .L125+56
	ldr	fp, .L125+60
	mov	r4, #0
.L81:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	bne	.L116
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
	ldr	fp, .L125+24
	mov	lr, pc
	bx	fp
	ldr	r3, .L125+64
	smull	r2, r3, r1, r3
	mov	r2, r1, asr #31
	rsb	r3, r2, r3, asr #5
	add	r3, r3, r3, asl #2
	add	r3, r3, r3, asl #2
	cmp	r1, r3, asl #2
	ldreq	r4, .L125+68
	beq	.L85
	ldr	r4, .L125+68
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L86
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L117
.L87:
	ldr	r3, .L125+72
	ldr	r0, .L125+68
	ldr	r1, .L125
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L89
.L121:
	ldr	r3, .L125+72
	ldr	r0, .L125+76
	ldr	r1, .L125
	mov	lr, pc
	bx	r3
	ldr	r3, .L125+80
	ldr	r3, [r3, #0]
	cmp	r3, #4
	bgt	.L118
.L90:
	ldr	r3, .L125+84
	ldr	r3, [r3, #24]
	cmp	r3, #0
	bne	.L94
	ldr	fp, .L125+52
	ldr	r3, [fp, #0]
	ldrh	r2, [sl, #0]
	cmp	r3, #0
	mov	r3, #67108864
	strh	r2, [r3, #16]	@ movhi
	bgt	.L62
.L122:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	goToLose
.L66:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	ldrne	sl, .L125+4
	beq	.L119
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L69
.L123:
	ldr	r1, [sl, #0]
	ldr	r3, [r4, #12]
	ldr	r2, [r4, #4]
	rsb	r2, r3, r2
	add	r3, r1, r3
	mov	r1, #1
	str	r1, [r4, #24]
	str	r2, [r4, #4]
	str	r3, [sl, #0]
.L69:
	ldr	r3, [r4, #36]
	ldr	r2, .L125+88
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	add	r2, r2, r3
	rsb	r2, r1, r2, asr #4
	rsb	r2, r2, r2, asl #4
	subs	r3, r3, r2, asl #1
	ldr	r1, .L125
	bne	.L67
	ldr	r0, [r1, #32]
	cmp	r0, #1
	addle	r0, r0, #1
	strle	r0, [r1, #32]
	ble	.L67
	cmp	r0, #2
	streq	r3, [r1, #32]
	b	.L67
.L116:
	add	r6, r4, r4, asl #1
	add	r6, r9, r6, asl #3
	mov	r0, r6
	mov	lr, pc
	bx	fp
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L120
.L84:
	ldr	r3, [r7, #52]
	cmp	r3, #0
	beq	.L83
	mov	r0, r6
	ldr	r1, .L125+92
	ldr	r2, .L125+96
	mov	lr, pc
	bx	r2
	b	.L83
.L117:
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
	bne	.L121
.L89:
	ldr	r3, .L125+80
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	.L90
.L118:
	ldr	r3, .L125+84
	ldr	r2, [r3, #24]
	cmp	r2, #0
	moveq	r2, #1
	streq	r2, [r3, #24]
.L94:
	ldr	fp, .L125+52
	ldr	r3, .L125+100
	ldr	r0, .L125+84
	ldr	r1, .L125
	mov	lr, pc
	bx	r3
	ldr	r3, [fp, #0]
	ldrh	r2, [sl, #0]
	cmp	r3, #0
	mov	r3, #67108864
	strh	r2, [r3, #16]	@ movhi
	ble	.L122
.L62:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L73:
	ldr	r7, .L125+32
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L75
	ldr	r2, [r7, #52]
	cmp	r2, #0
	beq	.L106
	ldr	fp, .L125+28
	str	fp, [sp, #4]
	b	.L74
.L119:
	ldr	sl, .L125+4
	ldr	r3, [r4, #12]
	ldr	r1, [sl, #0]
	ldr	r2, [r4, #4]
	add	r2, r3, r2
	add	r3, r1, r3
	mov	r1, #2
	str	r3, [sl, #0]
	str	r1, [r4, #24]
	str	r2, [r4, #4]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L69
	b	.L123
.L108:
	ldr	r9, .L125+56
	mov	r2, r9
.L82:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	beq	.L124
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #24
	bne	.L82
	b	.L79
.L113:
	ldr	r3, [r4, #44]
	ldr	r2, [r4, #8]
	rsb	r1, r3, #0
	cmp	r2, r1
	ldr	r1, .L125
	ble	.L72
	cmp	r2, r3
	ldrlt	r3, [r1, #48]
	rsblt	r3, r3, #0
	strlt	r3, [r1, #8]
	b	.L72
.L112:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L63
	ldr	r3, [r4, #36]
	add	r3, r3, #1
	str	r3, [r4, #36]
	b	.L65
.L120:
	mov	r0, r6
	ldr	r1, .L125+32
	ldr	r3, .L125+96
	mov	lr, pc
	bx	r3
	b	.L84
.L106:
	mov	r3, #1
.L75:
	rsb	r3, r3, r3, asl #3
	add	r3, r7, r3, asl #2
	ldr	r1, .L125+28
	mov	r2, #1
	str	r2, [r3, #24]
	mov	r2, #220
	str	r2, [r3, #4]
	str	r1, [sp, #4]
	mov	lr, pc
	bx	r1
	ldr	r2, .L125+104
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
.L124:
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
.L126:
	.align	2
.L125:
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
	.word	score
	.word	fridge
	.word	-2004318071
	.word	cats+28
	.word	collisionCheckEnemy
	.word	collisionFridge
	.word	458129845
	.size	update, .-update
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L143
	stmfd	sp!, {r3, lr}
	ldr	r3, .L143+4
	ldr	r0, [r2, #4]
	ldrb	ip, [r2, #1]	@ zero_extendqisi2
	ldr	lr, [r3, #24]
	ldr	r1, .L143+8
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
	beq	.L129
	ldr	r2, [r3, #4]
	ldrb	r0, [r3, #0]	@ zero_extendqisi2
	mvn	r2, r2, asl #17
	mvn	r2, r2, lsr #17
	orr	r0, r0, #16384
	strh	r2, [r1, #10]	@ movhi
	mov	r2, #8	@ movhi
	strh	r0, [r1, #8]	@ movhi
	strh	r2, [r1, #12]	@ movhi
.L129:
	ldr	r3, [r3, #52]
	cmp	r3, #0
	ldr	r3, .L143+4
	bne	.L130
	mov	r3, #512	@ movhi
	strh	r3, [r1, #16]	@ movhi
.L132:
	ldr	r3, .L143+12
	ldr	r2, .L143+8
	add	ip, r3, #120
.L131:
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
	bne	.L131
	ldr	r3, .L143+16
	ldr	r0, [r3, #0]
	cmp	r0, #0
	movle	r0, #512	@ movhi
	strleh	r0, [r1, #32]	@ movhi
	ble	.L136
	mov	r2, #16384
	add	r2, r2, #5
	mov	ip, #24	@ movhi
	mov	lr, #12	@ movhi
	cmp	r0, #1
	ldr	r3, .L143+8
	strh	r2, [r1, #32]	@ movhi
	strh	ip, [r1, #34]	@ movhi
	strh	lr, [r1, #36]	@ movhi
	ble	.L136
	mov	ip, #34	@ movhi
	mov	lr, #12	@ movhi
	cmp	r0, #2
	strh	r2, [r3, #40]	@ movhi
	strh	ip, [r3, #42]	@ movhi
	strh	lr, [r3, #44]	@ movhi
	ble	.L138
	strh	r2, [r3, #48]	@ movhi
	mov	ip, #12	@ movhi
	mov	r2, #44	@ movhi
	strh	r2, [r3, #50]	@ movhi
	strh	ip, [r3, #52]	@ movhi
.L140:
	ldr	r3, .L143+20
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L141
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
.L141:
	mov	r0, #3
	ldr	r1, .L143+8
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L143+24
	mov	lr, pc
	bx	ip
	ldr	r3, .L143+28
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L136:
	mov	r0, #512	@ movhi
	strh	r0, [r1, #40]	@ movhi
.L138:
	mov	r0, #512	@ movhi
	strh	r0, [r1, #48]	@ movhi
	b	.L140
.L130:
	ldr	r0, [r3, #32]
	ldrb	r2, [r3, #28]	@ zero_extendqisi2
	mvn	r3, r0, asl #17
	orr	r2, r2, #16384
	mvn	r3, r3, lsr #17
	mov	ip, #8	@ movhi
	strh	r2, [r1, #16]	@ movhi
	strh	r3, [r1, #18]	@ movhi
	strh	ip, [r1, #20]	@ movhi
	b	.L132
.L144:
	.align	2
.L143:
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
	ldr	r4, .L150
	bl	update
	ldr	r3, .L150+4
	mov	lr, pc
	bx	r3
	bl	draw
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L146
	ldr	r2, .L150+8
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L148
.L146:
	tst	r3, #4
	beq	.L145
	ldr	r3, .L150+8
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L149
.L145:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L149:
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L148:
	bl	goToPause
	ldr	r3, [r4, #0]
	b	.L146
.L151:
	.align	2
.L150:
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
	ldr	r3, .L155
	add	r2, r3, #1016
.L153:
	mov	r1, #512	@ movhi
	strh	r1, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L153
	bx	lr
.L156:
	.align	2
.L155:
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
