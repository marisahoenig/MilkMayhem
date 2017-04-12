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
	mov	r3, #6720
	mov	r5, #7936	@ movhi
	strh	r5, [ip, #8]	@ movhi
	mov	r0, #3
	strh	lr, [ip, #16]	@ movhi
	ldr	r1, .L18
	mov	r2, #100663296
	add	r3, r3, #48
	ldr	r4, .L18+4
	strh	lr, [ip, #20]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #63488
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
	mov	r3, #4864
	mov	r5, #7424	@ movhi
	strh	r5, [ip, #8]	@ movhi
	mov	r0, #3
	strh	lr, [ip, #16]	@ movhi
	ldr	r1, .L25
	mov	r2, #100663296
	add	r3, r3, #48
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
	mov	ip, #67108864
	mov	r2, #83886080
	mov	r7, #4864	@ movhi
	mov	r0, #3
	ldr	r1, .L36
	add	r2, r2, #512
	mov	r3, #256
	ldr	r4, .L36+4
	strh	r7, [ip, #0]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #65536
	mov	r3, #16384
	mov	r0, #3
	ldr	r1, .L36+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L36+12
	add	r2, r3, #1016
.L32:
	mov	sl, #512	@ movhi
	strh	sl, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L32
	ldr	r3, .L36+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L36+20
	mov	lr, pc
	bx	r3
	ldr	ip, .L36+24
	mov	r3, #120
	mov	r5, #0
	mov	r8, #1
	str	r3, [ip, #0]
	mov	r3, #200
	stmib	ip, {r3, r5, r8}	@ phole stm
	mov	r6, ip
	ldr	r4, .L36+28
	ldmia	r6!, {r0, r1, r2, r3}
	ldr	r7, .L36+32
	mov	sl, #23040
	mov	r9, #32
	mov	fp, #64
	stmia	r7!, {r0, r1, r2, r3}
	str	sl, [r4, #0]
	mov	sl, #112
	str	fp, [ip, #16]
	str	r9, [ip, #20]
	str	r5, [ip, #24]
	str	r5, [ip, #28]
	str	sl, [r4, #4]
	mov	sl, #2
	str	sl, [r4, #12]
	mov	sl, #8
	ldmia	r6!, {r0, r1, r2, r3}
	str	sl, [r4, #44]
	mov	sl, #1280
	str	sl, [r4, #48]
	mov	sl, #40
	str	r5, [r4, #8]
	str	r9, [r4, #16]
	str	fp, [r4, #20]
	str	r5, [r4, #24]
	str	r5, [r4, #28]
	str	r5, [r4, #32]
	str	r5, [r4, #36]
	str	r8, [r4, #40]
	str	sl, [r4, #52]
	stmia	r7!, {r0, r1, r2, r3}
	str	r5, [ip, #32]
	str	r5, [ip, #36]
	ldmia	r6, {r0, r1}
	stmia	r7, {r0, r1}
	ldr	r7, .L36+32
	ldmia	ip!, {r0, r1, r2, r3}
	add	r4, r7, sl
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldr	ip, .L36+36
	ldmia	r6, {r0, r1}
	mov	r3, #140
	mov	r7, #16
	str	r3, [ip, #0]
	mov	r3, #240
	str	r3, [ip, #4]
	str	r7, [ip, #12]
	str	r8, [ip, #8]
	mov	r6, ip
	stmia	r4, {r0, r1}
	ldr	r4, .L36+40
	ldmia	r6!, {r0, r1, r2, r3}
	mov	sl, r4
	stmia	sl!, {r0, r1, r2, r3}
	str	r7, [ip, #16]
	str	r5, [ip, #20]
	ldmia	r6, {r0, r1}
	stmia	sl, {r0, r1}
	ldmia	ip!, {r0, r1, r2, r3}
	add	r4, r4, #24
	stmia	r4!, {r0, r1, r2, r3}
	ldr	r3, .L36+44
	mov	r2, #96
	ldr	ip, .L36+48
	ldmia	r6, {r0, r1}
	str	r2, [r3, #0]
	mov	r2, #208
	stmib	r3, {r2, r5, r8, r9}	@ phole stm
	str	fp, [r3, #20]
	str	r5, [r3, #24]
	mov	r3, #145
	stmia	r4, {r0, r1}
	str	r3, [ip, #0]
	mov	r1, #2
	mov	r3, #8
	str	r5, [ip, #4]
	str	r1, [ip, #8]
	str	r3, [ip, #12]
	str	r3, [ip, #16]
	str	r5, [ip, #20]
	ldr	r7, .L36+52
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
	ldr	r2, .L36+56
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L36+60
	str	r3, [r2, #0]
	ldr	r2, .L36+64
	mov	r1, #3
	str	r1, [r2, #0]
	ldr	r2, .L36+68
	str	r3, [r2, #0]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	spritesheetPal
	.word	DMANow
	.word	spritesheetTiles
	.word	shadowOAM
	.word	setupInterrupts
	.word	setupSounds
	.word	c
	.word	p
	.word	cats
	.word	health
	.word	hearts
	.word	fridge
	.word	bullet
	.word	bullets
	.word	chocolateMilk
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
	mvn	ip, #9664
	stmfd	sp!, {r4, r5, r6, lr}
	sub	ip, ip, #59
	mov	lr, #4864	@ movhi
	mov	r4, #67108864
	mov	r6, #100663296
	mov	r3, #15104
	strh	lr, [r4, #0]	@ movhi
	ldr	r5, .L39
	strh	ip, [r4, #10]	@ movhi
	mov	r0, #3
	ldr	r1, .L39+4
	add	r2, r6, #16384
	add	r3, r3, #48
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L39+8
	add	r2, r6, #53248
	mov	r3, #4096
	mov	lr, pc
	bx	r5
	mov	ip, #6400	@ movhi
	strh	ip, [r4, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L39+12
	mov	r2, r6
	mov	r3, #1120
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L39+16
	add	r2, r6, #51200
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	ldr	r3, .L39+20
	ldr	lr, [r3, #0]
	add	ip, lr, lr, lsr #31
	mov	ip, ip, asl #15
	mov	lr, lr, asl #16
	mov	lr, lr, lsr #16
	mov	ip, ip, lsr #16
	mov	r1, #193536
	mov	r2, #11008
	add	r2, r2, #17
	mov	r3, #1
	strh	lr, [r4, #20]	@ movhi
	ldr	r0, .L39+24
	strh	ip, [r4, #16]	@ movhi
	sub	r1, r1, #223
	ldr	ip, .L39+28
	mov	lr, pc
	bx	ip
	ldr	r2, .L39+32
	ldr	r3, .L39+36
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L40:
	.align	2
.L39:
	.word	DMANow
	.word	movebackgroundTiles
	.word	movebackgroundMap
	.word	lightsTiles
	.word	lightsMap
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
	stmfd	sp!, {r3, r4, r5, lr}
	mov	lr, #7680
	mov	ip, #67108864
	add	lr, lr, #4
	strh	lr, [ip, #10]	@ movhi
	mov	lr, #512	@ movhi
	strh	lr, [ip, #0]	@ movhi
	mov	r5, #100663296
	mov	lr, #0	@ movhi
	mov	r0, #3
	ldr	r1, .L54
	add	r2, r5, #16384
	mov	r3, #1568
	ldr	r4, .L54+4
	strh	lr, [ip, #20]	@ movhi
	mov	lr, pc
	bx	r4
	add	r2, r5, #61440
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L54+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L54+12
	ldr	r3, .L54+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
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
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L130
	sub	sp, sp, #20
	mov	r1, #67108864
	ldr	r3, [r4, #8]
	ldr	ip, [r4, #52]
	ldr	r0, [r1, #304]
	ldr	r2, [r4, #0]
	add	r3, ip, r3
	add	r2, r3, r2
	tst	r0, #16
	str	r3, [r4, #8]
	str	r2, [r4, #0]
	beq	.L63
	ldr	r3, [r1, #304]
	mvn	r3, r3
	ands	r1, r3, #32
	beq	.L64
.L63:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	ldr	r2, [r4, #36]
	tst	r3, #16
	add	r2, r2, #1
	ldr	r3, .L130
	str	r2, [r4, #36]
	ldrne	sl, .L130+4
	beq	.L118
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	ldrne	r3, [r4, #4]
	beq	.L119
.L68:
	ldr	r2, [r4, #36]
	ldr	r1, .L130+8
	smull	ip, r1, r2, r1
	mov	r0, r2, asr #31
	rsb	r1, r0, r1, asr #2
	add	r1, r1, r1, asl #2
	cmp	r2, r1, asl #1
	ldr	r2, .L130
	beq	.L70
.L116:
	ldr	r2, [r2, #0]
.L71:
	ldr	r1, [r4, #20]
	mov	r2, r2, asr #8
	rsb	r1, r1, #159
	cmp	r2, r1
	ldr	r0, .L130
	movge	r2, r1, asl #8
	movge	r1, #0
	strge	r2, [r0, #0]
	strge	r1, [r0, #8]
	movge	r2, r2, asr #8
	cmp	r2, #0
	ldrle	r2, [r4, #8]
	rsble	r2, r2, #0
	strle	r2, [r4, #8]
	ldr	r2, [r4, #16]
	movle	r1, #0
	strle	r1, [r4, #0]
	add	r1, r3, r2
	cmp	r1, #240
	rsbgt	r3, r2, #240
	ldrgt	r2, .L130
	ldr	r8, .L130+12
	strgt	r3, [r2, #4]
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r4, #4]
	ldr	r3, [r8, #0]
	tst	r3, #2
	beq	.L78
	ldr	r3, .L130+16
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L120
.L78:
	ldr	r5, .L130+20
	ldr	r9, .L130+24
	ldr	r6, [r5, #0]
	ldr	r1, [r9, #0]
	mov	r0, r6
	ldr	r2, .L130+28
	mov	lr, pc
	bx	r2
	add	r6, r6, #1
	cmp	r1, #0
	str	r6, [r5, #0]
	beq	.L79
	ldr	r7, .L130+32
	ldr	r3, [r7, #24]
.L80:
	cmp	r3, #0
	ldr	r6, .L130+32
	ldr	r9, .L130+36
	ldr	fp, .L130+40
	mov	r5, #0
	bne	.L121
.L82:
	add	r5, r5, #1
	cmp	r5, #2
	add	r6, r6, #40
	beq	.L83
	ldr	r3, [r6, #24]
	cmp	r3, #0
	beq	.L82
.L121:
	add	r1, r5, r5, asl #2
	add	r1, r7, r1, asl #3
	mov	r0, r1
	str	r1, [sp, #12]
	mov	lr, pc
	bx	r9
	ldr	ip, [fp, #0]
	cmp	ip, #0
	str	ip, [sp, #4]
	ldr	r1, [sp, #12]
	bne	.L82
	ldr	r0, .L130
	ldr	r2, .L130+44
	mov	lr, pc
	bx	r2
	cmp	r0, #0
	beq	.L82
	mov	r1, #4864
	mov	r2, #11008
	ldr	r0, .L130+48
	add	r1, r1, #10
	ldr	r3, [sp, #4]
	add	r2, r2, #17
	ldr	ip, .L130+52
	mov	lr, pc
	bx	ip
	ldr	r0, .L130+56
	ldr	r3, [r0, #0]
	ldr	r1, [sp, #4]
	sub	r3, r3, #1
	str	r1, [r6, #24]
	str	r3, [r0, #0]
	b	.L82
.L83:
	ldr	r3, [r8, #0]
	tst	r3, #1
	beq	.L117
	ldr	r3, .L130+16
	ldr	r3, [r3, #0]
	ands	r3, r3, #1
	beq	.L113
.L117:
	ldr	r9, .L130+60
.L85:
	ldr	r5, .L130+60
	ldr	fp, .L130+64
	mov	r4, #0
.L87:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	bne	.L122
.L89:
	add	r4, r4, #1
	cmp	r4, #5
	add	r5, r5, #24
	bne	.L87
	ldr	r3, [r8, #0]
	tst	r3, #4
	beq	.L91
	ldr	r3, .L130+16
	ldr	r3, [r3, #0]
	ands	r3, r3, #4
	beq	.L123
.L91:
	ldr	r4, .L130+68
	ldr	r6, .L130+72
	ldr	r5, [r4, #0]
	ldr	r1, [r6, #0]
	mov	r0, r5
	ldr	ip, .L130+28
	mov	lr, pc
	bx	ip
	add	r5, r5, #1
	cmp	r1, #0
	str	r5, [r4, #0]
	ldrne	r4, .L130+76
	bne	.L93
	ldr	r4, .L130+76
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L94
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L124
.L95:
	ldr	r3, .L130+80
	ldr	r0, .L130+76
	ldr	r1, .L130
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L97
.L127:
	ldr	r3, .L130+80
	ldr	r0, .L130+84
	ldr	r1, .L130
	mov	lr, pc
	bx	r3
	ldr	r3, .L130+88
	ldr	r3, [r3, #0]
	cmp	r3, #4
	bgt	.L125
.L98:
	ldr	r3, .L130+92
	ldr	r3, [r3, #24]
	cmp	r3, #0
	beq	.L100
	b	.L102
.L122:
	add	r6, r4, r4, asl #1
	add	r6, r9, r6, asl #3
	mov	r0, r6
	mov	lr, pc
	bx	fp
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L126
.L90:
	ldr	r3, [r7, #64]
	cmp	r3, #0
	beq	.L89
	mov	r0, r6
	ldr	r1, .L130+96
	ldr	r3, .L130+100
	mov	lr, pc
	bx	r3
	b	.L89
.L124:
	mov	r3, #1
.L94:
	add	r3, r3, r3, asl #1
	add	r3, r4, r3, asl #3
	mov	r2, #1
	str	r2, [r3, #20]
	mov	r2, #240
	str	r2, [r3, #4]
	ldr	r3, .L130+104
	mov	lr, pc
	bx	r3
	ldr	r2, .L130+108
	smull	r1, r2, r0, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #6
	rsb	r2, r3, r3, asl #5
	add	r3, r3, r2, asl #2
	sub	r3, r0, r3, asl #3
	add	r3, r3, #87
	str	r3, [r6, #0]
.L93:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L95
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L127
.L97:
	ldr	r3, .L130+88
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	.L98
.L125:
	ldr	r3, .L130+92
	ldr	r2, [r3, #24]
	cmp	r2, #0
	moveq	r2, #1
	streq	r2, [r3, #24]
.L102:
	ldr	r0, .L130+92
	ldr	r1, .L130
	ldr	r3, .L130+112
	mov	lr, pc
	bx	r3
.L100:
	ldr	r3, [sl, #0]
	ldr	r2, .L130+56
	add	r1, r3, r3, lsr #31
	ldr	r0, [r2, #0]
	mov	r3, r3, asl #16
	mov	r1, r1, asl #15
	mov	r2, #67108864
	mov	r3, r3, lsr #16
	mov	r1, r1, lsr #16
	cmp	r0, #0
	strh	r3, [r2, #20]	@ movhi
	strh	r1, [r2, #16]	@ movhi
	ble	.L128
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L79:
	ldr	r7, .L130+32
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L81
	ldr	r2, [r7, #64]
	cmp	r2, #0
	bne	.L80
	mov	r3, #1
.L81:
	add	r3, r3, r3, asl #2
	add	r3, r7, r3, asl #3
	mov	r2, #1
	str	r2, [r3, #24]
	mov	r2, #220
	str	r2, [r3, #4]
	ldr	r3, .L130+104
	mov	lr, pc
	bx	r3
	ldr	r2, .L130+116
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, asl #2
	rsb	r3, r3, r3, asl #4
	sub	r3, r0, r3, asl #2
	add	r3, r3, #87
	str	r3, [r9, #0]
	ldr	r3, [r7, #24]
	b	.L80
.L70:
	ldr	r1, [r2, #28]
	cmp	r1, #1
	addle	r1, r1, #1
	strle	r1, [r2, #28]
	ble	.L116
	cmp	r1, #2
	moveq	r1, #1
	streq	r1, [r2, #28]
	b	.L116
.L119:
	ldr	r2, [r4, #12]
	ldr	r1, [r4, #4]
	add	r3, r2, r2, lsr #31
	sub	r3, r1, r3, asr #1
	cmp	r3, #120
	mov	r1, #1
	str	r1, [r4, #32]
	str	r3, [r4, #4]
	ble	.L69
	ldr	r1, [sl, #0]
	rsb	r2, r2, r1
	str	r2, [sl, #0]
	b	.L68
.L118:
	ldr	r2, [r3, #12]
	ldr	r1, [r3, #4]
	add	r0, r2, r2, lsr #31
	add	r1, r1, r0, asr #1
	cmp	r1, #119
	mov	r0, #0
	str	r0, [r3, #32]
	str	r1, [r3, #4]
	bgt	.L66
	ldr	sl, .L130+4
	ldr	r3, [sl, #0]
	add	r2, r3, r2
	str	r2, [sl, #0]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	ldrne	r3, [r4, #4]
	bne	.L68
	b	.L119
.L64:
	ldr	r0, .L130+120
	ldr	r3, [r4, #4]
	str	r1, [r0, #0]
	ldr	sl, .L130+4
	b	.L71
.L123:
	ldr	r2, .L130+40
	ldr	r1, [r2, #0]
	cmp	r1, #0
	moveq	r3, #1
	streq	r3, [r2, #0]
	strne	r3, [r2, #0]
	b	.L91
.L113:
	ldr	r9, .L130+60
	mov	r2, r9
.L88:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	beq	.L129
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #24
	bne	.L88
	b	.L85
.L120:
	ldr	r3, [r4, #44]
	ldr	r2, [r4, #8]
	rsb	r1, r3, #0
	cmp	r2, r1
	ldr	r1, .L130
	ble	.L78
	cmp	r2, r3
	ldrlt	r3, [r1, #48]
	rsblt	r3, r3, #0
	strlt	r3, [r1, #8]
	b	.L78
.L126:
	mov	r0, r6
	ldr	r1, .L130+32
	ldr	r2, .L130+100
	mov	lr, pc
	bx	r2
	b	.L90
.L66:
	ldr	r3, .L130+8
	mov	r2, r2, asl #2
	smull	r0, r3, r2, r3
	ldr	sl, .L130+4
	mov	r2, r2, asr #31
	ldr	r1, [sl, #0]
	rsb	r3, r2, r3, asr #1
	add	r3, r3, r1
	str	r3, [sl, #0]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	ldrne	r3, [r4, #4]
	bne	.L68
	b	.L119
.L69:
	ldr	r0, .L130+8
	mov	r2, r2, asl #2
	smull	r1, r0, r2, r0
	ldr	r1, [sl, #0]
	mov	r2, r2, asr #31
	sub	r2, r2, r0, asr #1
	add	r2, r2, r1
	str	r2, [sl, #0]
	b	.L68
.L128:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	goToLose
.L129:
	ldr	r2, [r4, #20]
	ldr	r0, [r4, #0]
	ldr	ip, [r4, #16]
	ldr	r1, [r4, #4]
	add	r3, r3, r3, asl #1
	add	lr, r2, r2, lsr #31
	mov	r0, r0, asr #8
	add	r2, r9, r3, asl #3
	add	r1, ip, r1
	add	r0, r0, lr, asr #1
	mov	ip, #1
	str	ip, [r2, #20]
	str	r0, [r9, r3, asl #3]
	str	r1, [r2, #4]
	b	.L85
.L131:
	.align	2
.L130:
	.word	p
	.word	hOff
	.word	1717986919
	.word	oldButtons
	.word	buttons
	.word	time
	.word	timeToNextCat
	.word	__aeabi_idivmod
	.word	cats
	.word	updateCat
	.word	chocolateMilk
	.word	collisionEnemyPlayer
	.word	meow
	.word	playSoundB
	.word	lives
	.word	bullets
	.word	updateBullet
	.word	timetwo
	.word	timeToNextHealth
	.word	hearts
	.word	updateHealth
	.word	hearts+24
	.word	score
	.word	fridge
	.word	cats+40
	.word	collisionCheckEnemy
	.word	rand
	.word	274877907
	.word	collisionFridge
	.word	458129845
	.word	currFrame
	.size	update, .-update
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L148
	ldr	r1, .L148+4
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	ldr	r2, [r3, #4]
	ldr	ip, [r1, #0]
	mvn	r0, r0, asl #17
	ldr	r1, .L148+8
	mvn	r2, r2, asl #18
	mvn	r0, r0, lsr #17
	mvn	r2, r2, lsr #18
	cmp	ip, #0
	strh	r0, [r1, #0]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	beq	.L133
	ldr	r2, [r3, #32]
	ldr	r3, [r3, #28]
	add	r3, r3, r2, asl #6
	mov	r3, r3, asl #2
	orr	r3, r3, #4096
	strh	r3, [r1, #4]	@ movhi
.L139:
	ldr	r3, .L148+12
	ldr	r2, [r3, #24]
	cmp	r2, #0
	moveq	r0, #512	@ movhi
	streqh	r0, [r1, #8]	@ movhi
	beq	.L135
	ldr	r0, [r3, #4]
	ldr	r2, [r3, #28]
	ldrb	ip, [r3, #0]	@ zero_extendqisi2
	mvn	r0, r0, asl #18
	add	r2, r2, #64
	orr	ip, ip, #16384
	mvn	r0, r0, lsr #18
	mov	r2, r2, asl #3
	strh	ip, [r1, #8]	@ movhi
	strh	r0, [r1, #10]	@ movhi
	strh	r2, [r1, #12]	@ movhi
.L135:
	ldr	r3, [r3, #64]
	cmp	r3, #0
	ldr	r3, .L148+12
	bne	.L136
	mov	r2, #512	@ movhi
	strh	r2, [r1, #16]	@ movhi
.L138:
	ldr	r3, .L148+16
	ldr	r2, .L148+8
	add	ip, r3, #120
.L137:
	ldr	r0, [r3, #0]
	cmp	r0, #0
	ldrneb	r0, [r3, #-20]	@ zero_extendqisi2
	orrne	r0, r0, #16384
	strneh	r0, [r2, #88]	@ movhi
	ldrneh	r0, [r3, #-16]
	moveq	r0, #512	@ movhi
	strneh	r0, [r2, #90]	@ movhi
	add	r3, r3, #24
	movne	r0, #640	@ movhi
	strneh	r0, [r2, #92]	@ movhi
	streqh	r0, [r2, #88]	@ movhi
	cmp	r3, ip
	add	r2, r2, #8
	bne	.L137
	ldr	r3, .L148+20
	ldr	r2, .L148+24
	ldr	ip, [r3, #20]
	mvn	r0, #32512
	ldr	lr, [r2, #0]
	mov	r2, r0
	sub	r2, r2, #245
	cmp	ip, #0
	strh	r2, [r1, #34]	@ movhi
	ldrne	r2, [r3, #4]
	sub	r0, r0, #250
	ldr	ip, .L148+8
	orrne	r2, r2, #16384
	strh	r0, [r1, #32]	@ movhi
	ldrneh	r0, [r3, #0]
	ldr	r3, [r3, #44]
	moveq	r2, #512	@ movhi
	strneh	r2, [ip, #58]	@ movhi
	movne	r2, #712	@ movhi
	streqh	r2, [ip, #56]	@ movhi
	strneh	r2, [ip, #60]	@ movhi
	strneh	r0, [ip, #56]	@ movhi
	cmp	r3, #0
	ldr	r3, .L148+20
	ldrne	r2, [r3, #28]
	ldrneh	r3, [r3, #24]
	moveq	r3, #512	@ movhi
	streqh	r3, [r1, #64]	@ movhi
	strneh	r3, [r1, #64]	@ movhi
	ldr	r3, .L148+28
	orrne	r2, r2, #16384
	strneh	r2, [r1, #66]	@ movhi
	ldr	r2, [r3, #24]
	movne	r0, #712	@ movhi
	add	lr, lr, #320
	mov	lr, lr, asl #1
	strneh	r0, [r1, #68]	@ movhi
	cmp	r2, #0
	strh	lr, [r1, #36]	@ movhi
	beq	.L146
	ldrb	r2, [r3, #0]	@ zero_extendqisi2
	ldr	r3, [r3, #4]
	mvn	r2, r2, asl #17
	mvn	r2, r2, lsr #17
	mvn	r3, r3, asl #18
	mvn	r3, r3, lsr #18
	strh	r2, [r1, #80]	@ movhi
	mov	r2, #12	@ movhi
	strh	r3, [r1, #82]	@ movhi
	strh	r2, [r1, #84]	@ movhi
.L146:
	mov	r0, #3
	ldr	r1, .L148+8
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L148+32
	mov	lr, pc
	bx	ip
	ldr	r3, .L148+36
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L133:
	ldr	r2, [r3, #32]
	ldr	r3, [r3, #28]
	add	r3, r3, r2, asl #6
	mov	r3, r3, asl #2
	strh	r3, [r1, #4]	@ movhi
	b	.L139
.L136:
	ldr	r2, [r3, #44]
	ldr	ip, [r3, #68]
	ldrb	r0, [r3, #40]	@ zero_extendqisi2
	mvn	r2, r2, asl #18
	add	r3, ip, #64
	orr	r0, r0, #16384
	mvn	r2, r2, lsr #18
	mov	r3, r3, asl #3
	strh	r0, [r1, #16]	@ movhi
	strh	r2, [r1, #18]	@ movhi
	strh	r3, [r1, #20]	@ movhi
	b	.L138
.L149:
	.align	2
.L148:
	.word	p
	.word	chocolateMilk
	.word	shadowOAM
	.word	cats
	.word	bullets+20
	.word	hearts
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
	bl	update
	ldr	r3, .L153
	mov	lr, pc
	bx	r3
	bl	draw
	ldr	r3, .L153+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L150
	ldr	r3, .L153+8
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L152
.L150:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L152:
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L154:
	.align	2
.L153:
	.word	waitForVblank
	.word	oldButtons
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
	ldr	r3, .L158
	add	r2, r3, #1016
.L156:
	mov	r1, #512	@ movhi
	strh	r1, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L156
	bx	lr
.L159:
	.align	2
.L158:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
	.comm	score,4,4
	.comm	prevScore,4,4
	.comm	lives,4,4
	.comm	time,4,4
	.comm	timetwo,4,4
	.comm	hOff,4,4
	.comm	gamehOff,4,4
	.comm	catFrame,4,4
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	shadowOAM,1024,4
	.comm	p,60,4
	.comm	c,40,4
	.comm	cats,80,4
	.comm	timeToNextCat,4,4
	.comm	timeToNextHealth,4,4
	.comm	health,24,4
	.comm	hearts,48,4
	.comm	fridge,28,4
	.comm	chocolateMilk,4,4
	.comm	bullet,24,4
	.comm	bullets,120,4
	.comm	state,4,4
	.comm	currFrame,4,4
	.comm	direction,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
