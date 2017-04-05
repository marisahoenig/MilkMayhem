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
	stmfd	sp!, {r3, r4, r5, lr}
	mov	ip, #67108864
	mov	r5, #7936	@ movhi
	strh	r5, [ip, #8]	@ movhi
	mov	lr, #0
	mov	r5, #256	@ movhi
	strh	lr, [ip, #16]	@ movhi
	mov	r0, #3
	ldr	r1, .L2
	mov	r2, #100663296
	mov	r3, #2752
	ldr	r4, .L2+4
	strh	r5, [ip, #0]	@ movhi
	strh	lr, [ip, #20]	@ movhi
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
	ldmfd	sp!, {r3, r4, r5, lr}
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
	stmfd	sp!, {r3, r4, r5, lr}
	mov	ip, #67108864
	mov	lr, #0
	mov	r3, #5376
	mov	r5, #7680	@ movhi
	strh	r5, [ip, #8]	@ movhi
	mov	r0, #3
	strh	lr, [ip, #16]	@ movhi
	ldr	r1, .L18
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r4, .L18+4
	strh	lr, [ip, #20]	@ movhi
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
	ldmfd	sp!, {r3, r4, r5, lr}
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
	stmfd	sp!, {r3, r4, r5, lr}
	mov	ip, #67108864
	mov	lr, #0
	mov	r3, #4160
	mov	r5, #7424	@ movhi
	strh	r5, [ip, #8]	@ movhi
	mov	r0, #3
	strh	lr, [ip, #16]	@ movhi
	ldr	r1, .L25
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r4, .L25+4
	strh	lr, [ip, #20]	@ movhi
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
	ldmfd	sp!, {r3, r4, r5, lr}
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
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	r2, #83886080
	mov	r5, #67108864
	mov	r7, #4864	@ movhi
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
	mvn	ip, #9664
	sub	ip, ip, #59
	mov	r2, #100663296
	mov	r3, #15104
	strh	ip, [r5, #10]	@ movhi
	mov	r0, #3
	ldr	r1, .L36+12
	add	r2, r2, #16384
	add	r3, r3, #48
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L36+16
	add	r2, r2, #53248
	mov	r3, #4096
	mov	r8, #6400	@ movhi
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L36+20
	mov	r2, #100663296
	mov	r3, #1120
	strh	r8, [r5, #8]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #51200
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L36+24
	mov	lr, pc
	bx	r4
	ldr	r3, .L36+28
	add	r2, r3, #1016
.L32:
	mov	r9, #512	@ movhi
	strh	r9, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L32
	ldr	r3, .L36+32
	mov	lr, pc
	bx	r3
	ldr	r3, .L36+36
	mov	lr, pc
	bx	r3
	ldr	ip, .L36+40
	mov	r5, #0
	mov	sl, #1
	mov	fp, #140
	mov	r3, #200
	str	fp, [ip, #0]
	stmib	ip, {r3, r5, sl}	@ phole stm
	mov	r6, ip
	ldmia	r6!, {r0, r1, r2, r3}
	ldr	r7, .L36+44
	ldr	r4, .L36+48
	stmia	r7!, {r0, r1, r2, r3}
	mov	r8, #16
	mov	r1, #32
	str	r8, [ip, #20]
	str	r1, [ip, #16]
	str	r5, [ip, #24]
	str	r5, [ip, #28]
	mov	r9, #32256
	str	r9, [r4, #0]
	mov	r9, #112
	ldmia	r6!, {r0, r1, r2, r3}
	str	r9, [r4, #4]
	str	r8, [r4, #16]
	mov	r9, #2
	mov	r8, #1280
	str	r9, [r4, #12]
	str	r8, [r4, #48]
	mov	r9, #10
	mov	r8, #40
	str	r0, [r4, #20]
	str	r9, [r4, #44]
	str	r8, [r4, #52]
	str	r5, [r4, #8]
	str	r5, [r4, #24]
	str	r5, [r4, #32]
	str	r5, [r4, #36]
	str	sl, [r4, #40]
	str	r5, [ip, #32]
	stmia	r7!, {r0, r1, r2, r3}
	str	r5, [ip, #40]
	ldmia	r6, {r0, r1, r2}
	stmia	r7, {r0, r1, r2}
	ldr	r7, .L36+44
	ldmia	ip!, {r0, r1, r2, r3}
	add	r4, r7, #44
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldr	ip, .L36+52
	ldmia	r6, {r0, r1, r2}
	mov	r3, #220
	stmia	r4, {r0, r1, r2}
	str	fp, [ip, #0]
	stmib	ip, {r3, r5, sl}	@ phole stm
	ldr	r6, .L36+56
	mov	r7, ip
	ldmia	r7!, {r0, r1, r2, r3}
	mov	r8, r6
	stmia	r8!, {r0, r1, r2, r3}
	mov	r4, #8
	str	r9, [ip, #16]
	str	r4, [ip, #20]
	str	r5, [ip, #24]
	ldmia	r7, {r0, r1, r2}
	stmia	r8, {r0, r1, r2}
	ldmia	ip!, {r0, r1, r2, r3}
	add	r6, r6, #28
	stmia	r6!, {r0, r1, r2, r3}
	ldmia	r7, {r0, r1, r2}
	ldr	r3, .L36+60
	stmia	r6, {r0, r1, r2}
	mov	r2, #96
	str	r2, [r3, #0]
	mov	r2, #208
	ldr	ip, .L36+64
	str	r2, [r3, #4]
	mov	r9, #32
	mov	r2, #64
	str	r5, [r3, #8]
	str	sl, [r3, #12]
	str	r9, [r3, #16]
	str	r2, [r3, #20]
	str	r5, [r3, #24]
	mov	r1, #2
	mov	r3, #145
	ldr	r7, .L36+68
	stmia	ip, {r3, r5}	@ phole stm
	str	r1, [ip, #8]
	str	r4, [ip, #12]
	str	r4, [ip, #16]
	str	r5, [ip, #20]
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
	ldr	r2, .L36+72
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L36+76
	mov	r1, #3
	str	r1, [r2, #0]
	ldr	r2, .L36+80
	str	r3, [r2, #0]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	DMANow
	.word	spritesheetPal
	.word	spritesheetTiles
	.word	movebackgroundTiles
	.word	movebackgroundMap
	.word	lightsTiles
	.word	lightsMap
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
	ldr	r4, [r3, #0]
	add	lr, r4, r4, lsr #31
	mov	r4, r4, asl #16
	mov	ip, #67108864
	mov	r4, r4, lsr #16
	mov	lr, lr, asl #15
	strh	r4, [ip, #20]	@ movhi
	mov	lr, lr, lsr #16
	mov	r1, #193536
	mov	r2, #11008
	mov	r4, #4864	@ movhi
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
	strh	lr, [ip, #20]	@ movhi
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
	ldr	r4, .L126
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
	bne	.L113
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
	ldrne	sl, .L126+4
	beq	.L66
.L67:
	ldr	r3, [r4, #20]
	ldr	r2, [r4, #0]
	rsb	r3, r3, #159
	cmp	r3, r2, asr #8
	ldr	r2, .L126
	movle	r3, r3, asl #8
	strle	r3, [r2, #0]
	movle	r3, #0
	strle	r3, [r2, #8]
	ldr	r3, [r4, #4]
	ldr	r2, [r4, #16]
	add	r1, r2, r3
	cmp	r1, #240
	rsbgt	r3, r2, #240
	ldrgt	r2, .L126
	ldr	r9, .L126+8
	strgt	r3, [r2, #4]
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r4, #4]
	ldr	r3, [r9, #0]
	tst	r3, #2
	beq	.L74
	ldr	r3, .L126+12
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L114
.L74:
	ldr	r8, .L126+16
	ldr	r5, .L126+20
	ldr	r6, [r8, #0]
	ldr	r1, [r5, #0]
	mov	r0, r6
	ldr	r2, .L126+24
	mov	lr, pc
	bx	r2
	add	r6, r6, #1
	cmp	r1, #0
	str	r6, [r8, #0]
	beq	.L75
	ldr	r3, .L126+28
	ldr	r7, .L126+32
	str	r3, [sp, #4]
	ldr	r3, [r7, #24]
.L76:
	cmp	r3, #0
	mov	r5, #0
	ldr	r6, .L126+32
	ldr	ip, .L126+36
	bne	.L115
.L78:
	add	r5, r5, #1
	cmp	r5, #2
	add	r6, r6, #44
	beq	.L79
.L116:
	ldr	r3, [r6, #24]
	cmp	r3, #0
	beq	.L78
.L115:
	add	fp, r5, r5, asl #2
	add	fp, r5, fp, asl #1
	add	fp, r7, fp, asl #2
	mov	r0, fp
	str	ip, [sp, #0]
	mov	lr, pc
	bx	ip
	mov	r1, fp
	ldr	r0, .L126
	ldr	fp, .L126+40
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldr	ip, [sp, #0]
	beq	.L78
	mov	r1, #4864
	mov	r2, #11008
	add	r1, r1, #10
	add	r2, r2, #17
	mov	r3, #0
	ldr	r0, .L126+44
	ldr	fp, .L126+48
	mov	lr, pc
	bx	fp
	ldr	r1, .L126+52
	ldr	r3, [r1, #0]
	add	r5, r5, #1
	sub	r3, r3, #1
	mov	r2, #0
	cmp	r5, #2
	str	r2, [r6, #24]
	str	r3, [r1, #0]
	ldr	ip, [sp, #0]
	add	r6, r6, #44
	bne	.L116
.L79:
	ldr	r3, [r9, #0]
	tst	r3, #1
	beq	.L112
	ldr	r3, .L126+12
	ldr	r3, [r3, #0]
	ands	r3, r3, #1
	beq	.L110
.L112:
	ldr	r9, .L126+56
.L81:
	ldr	r5, .L126+56
	ldr	fp, .L126+60
	mov	r4, #0
.L83:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	bne	.L117
.L85:
	add	r4, r4, #1
	cmp	r4, #5
	add	r5, r5, #24
	bne	.L83
	ldr	r3, [sp, #4]
	ldr	r4, [r8, #0]
	mov	lr, pc
	bx	r3
	add	r3, r4, #1
	mov	r1, r0
	str	r3, [r8, #0]
	mov	r0, r4
	ldr	fp, .L126+24
	mov	lr, pc
	bx	fp
	ldr	r3, .L126+64
	smull	r2, r3, r1, r3
	mov	r2, r1, asr #31
	rsb	r3, r2, r3, asr #5
	add	r3, r3, r3, asl #2
	add	r3, r3, r3, asl #2
	cmp	r1, r3, asl #2
	ldreq	r4, .L126+68
	beq	.L87
	ldr	r4, .L126+68
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L88
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L118
.L89:
	ldr	r3, .L126+72
	ldr	r0, .L126+68
	ldr	r1, .L126
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L91
.L122:
	ldr	r3, .L126+72
	ldr	r0, .L126+76
	ldr	r1, .L126
	mov	lr, pc
	bx	r3
	ldr	r3, .L126+80
	ldr	r3, [r3, #0]
	cmp	r3, #4
	bgt	.L119
.L92:
	ldr	r3, .L126+84
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L94
	b	.L96
.L66:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	ldrne	sl, .L126+4
	beq	.L120
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L69
.L124:
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
	ldr	r2, .L126+88
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #3
	add	r2, r2, r2, asl #2
	subs	r3, r3, r2, asl #2
	ldr	r1, .L126
	bne	.L67
	ldr	r0, [r1, #32]
	cmp	r0, #1
	addle	r0, r0, #1
	strle	r0, [r1, #32]
	ble	.L67
	cmp	r0, #2
	streq	r3, [r1, #32]
	b	.L67
.L117:
	add	r6, r4, r4, asl #1
	add	r6, r9, r6, asl #3
	mov	r0, r6
	mov	lr, pc
	bx	fp
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L121
.L86:
	ldr	r3, [r7, #68]
	cmp	r3, #0
	beq	.L85
	mov	r0, r6
	ldr	r1, .L126+92
	ldr	r2, .L126+96
	mov	lr, pc
	bx	r2
	b	.L85
.L118:
	mov	r3, #1
.L88:
	rsb	r3, r3, r3, asl #3
	add	r3, r4, r3, asl #2
	mov	r2, #1
	str	r2, [r3, #24]
.L87:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L89
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L122
.L91:
	ldr	r3, .L126+80
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	.L92
.L119:
	ldr	r3, .L126+84
	ldr	r2, [r3, #24]
	cmp	r2, #0
	moveq	r2, #1
	streq	r2, [r3, #24]
.L96:
	ldr	r0, .L126+84
	ldr	r1, .L126
	ldr	r3, .L126+100
	mov	lr, pc
	bx	r3
.L94:
	ldr	r3, [sl, #0]
	ldr	fp, .L126+52
	add	r1, r3, r3, lsr #31
	ldr	r0, [fp, #0]
	mov	r3, r3, asl #16
	mov	r1, r1, asl #15
	mov	r2, #67108864
	mov	r3, r3, lsr #16
	mov	r1, r1, lsr #16
	cmp	r0, #0
	strh	r3, [r2, #20]	@ movhi
	strh	r1, [r2, #16]	@ movhi
	ble	.L123
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L75:
	ldr	r7, .L126+32
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L77
	ldr	r2, [r7, #68]
	cmp	r2, #0
	beq	.L108
	ldr	fp, .L126+28
	str	fp, [sp, #4]
	b	.L76
.L120:
	ldr	sl, .L126+4
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
	b	.L124
.L110:
	ldr	r9, .L126+56
	mov	r2, r9
.L84:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	beq	.L125
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #24
	bne	.L84
	b	.L81
.L114:
	ldr	r3, [r4, #44]
	ldr	r2, [r4, #8]
	rsb	r1, r3, #0
	cmp	r2, r1
	ldr	r1, .L126
	ble	.L74
	cmp	r2, r3
	ldrlt	r3, [r1, #48]
	rsblt	r3, r3, #0
	strlt	r3, [r1, #8]
	b	.L74
.L113:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L63
	ldr	r3, [r4, #36]
	add	r3, r3, #1
	str	r3, [r4, #36]
	b	.L65
.L121:
	mov	r0, r6
	ldr	r1, .L126+32
	ldr	r3, .L126+96
	mov	lr, pc
	bx	r3
	b	.L86
.L123:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	goToLose
.L108:
	mov	r3, #1
.L77:
	add	r2, r3, r3, asl #2
	add	r3, r3, r2, asl #1
	add	r3, r7, r3, asl #2
	ldr	r1, .L126+28
	mov	r2, #1
	str	r2, [r3, #24]
	mov	r2, #220
	str	r2, [r3, #4]
	str	r1, [sp, #4]
	mov	lr, pc
	bx	r1
	ldr	r2, .L126+104
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, asl #2
	rsb	r3, r3, r3, asl #4
	sub	r3, r0, r3, asl #2
	add	r3, r3, #87
	str	r3, [r5, #0]
	ldr	r3, [r7, #24]
	b	.L76
.L125:
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
	b	.L81
.L127:
	.align	2
.L126:
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
	.word	1717986919
	.word	cats+44
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
	ldr	r2, .L144
	stmfd	sp!, {r3, lr}
	ldr	r3, .L144+4
	ldr	r0, [r2, #4]
	ldrb	ip, [r2, #1]	@ zero_extendqisi2
	ldr	lr, [r3, #24]
	ldr	r1, .L144+8
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
	beq	.L130
	ldr	r0, [r3, #4]
	ldr	r2, [r3, #28]
	ldrb	ip, [r3, #0]	@ zero_extendqisi2
	mvn	r0, r0, asl #17
	mov	r2, r2, asl #6
	orr	ip, ip, #16384
	mvn	r0, r0, lsr #17
	add	r2, r2, #8
	strh	ip, [r1, #8]	@ movhi
	strh	r0, [r1, #10]	@ movhi
	strh	r2, [r1, #12]	@ movhi
.L130:
	ldr	r3, [r3, #68]
	cmp	r3, #0
	ldr	r3, .L144+4
	bne	.L131
	mov	r2, #512	@ movhi
	strh	r2, [r1, #16]	@ movhi
.L133:
	ldr	r3, .L144+12
	ldr	r2, .L144+8
	add	ip, r3, #120
.L132:
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
	bne	.L132
	ldr	r3, .L144+16
	ldr	r0, [r3, #0]
	cmp	r0, #0
	movle	r0, #512	@ movhi
	strleh	r0, [r1, #32]	@ movhi
	ble	.L137
	mov	r2, #16384
	add	r2, r2, #5
	mov	ip, #10	@ movhi
	mov	lr, #12	@ movhi
	cmp	r0, #1
	ldr	r3, .L144+8
	strh	r2, [r1, #32]	@ movhi
	strh	ip, [r1, #34]	@ movhi
	strh	lr, [r1, #36]	@ movhi
	ble	.L137
	mov	ip, #20	@ movhi
	mov	lr, #12	@ movhi
	cmp	r0, #2
	strh	r2, [r3, #40]	@ movhi
	strh	ip, [r3, #42]	@ movhi
	strh	lr, [r3, #44]	@ movhi
	ble	.L139
	strh	r2, [r3, #48]	@ movhi
	mov	ip, #12	@ movhi
	mov	r2, #30	@ movhi
	strh	r2, [r3, #50]	@ movhi
	strh	ip, [r3, #52]	@ movhi
.L141:
	ldr	r3, .L144+20
	ldr	r2, [r3, #24]
	cmp	r2, #0
	beq	.L142
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
.L142:
	mov	r0, #3
	ldr	r1, .L144+8
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L144+24
	mov	lr, pc
	bx	ip
	ldr	r3, .L144+28
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L137:
	mov	r0, #512	@ movhi
	strh	r0, [r1, #40]	@ movhi
.L139:
	mov	r0, #512	@ movhi
	strh	r0, [r1, #48]	@ movhi
	b	.L141
.L131:
	ldr	r2, [r3, #48]
	ldr	ip, [r3, #72]
	ldrb	r0, [r3, #44]	@ zero_extendqisi2
	mvn	r2, r2, asl #17
	mov	r3, ip, asl #6
	orr	r0, r0, #16384
	mvn	r2, r2, lsr #17
	add	r3, r3, #8
	strh	r0, [r1, #16]	@ movhi
	strh	r2, [r1, #18]	@ movhi
	strh	r3, [r1, #20]	@ movhi
	b	.L133
.L145:
	.align	2
.L144:
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
	ldr	r4, .L151
	bl	update
	ldr	r3, .L151+4
	mov	lr, pc
	bx	r3
	bl	draw
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L147
	ldr	r2, .L151+8
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L149
.L147:
	tst	r3, #4
	beq	.L146
	ldr	r3, .L151+8
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L150
.L146:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L150:
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L149:
	bl	goToPause
	ldr	r3, [r4, #0]
	b	.L147
.L152:
	.align	2
.L151:
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
	ldr	r3, .L156
	add	r2, r3, #1016
.L154:
	mov	r1, #512	@ movhi
	strh	r1, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L154
	bx	lr
.L157:
	.align	2
.L156:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.comm	score,4,4
	.comm	prevScore,4,4
	.comm	lives,4,4
	.comm	time,4,4
	.comm	hOff,4,4
	.comm	gamehOff,4,4
	.comm	catFrame,4,4
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	shadowOAM,1024,4
	.comm	p,60,4
	.comm	c,44,4
	.comm	cats,88,4
	.comm	timeToNextCat,4,4
	.comm	health,28,4
	.comm	hearts,56,4
	.comm	fridge,28,4
	.comm	bullet,24,4
	.comm	bullets,120,4
	.comm	state,4,4
	.comm	currFrame,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
