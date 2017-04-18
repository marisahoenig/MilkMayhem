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
	mov	r3, #3280
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
	ldr	r3, .L11
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L5
	ldr	r3, .L11+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L9
.L5:
	ldr	r3, .L11+8
	ldr	r2, .L11+12
	ldr	r3, [r3, #0]
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #3
	add	r2, r2, r2, asl #2
	cmp	r3, r2, asl #2
	beq	.L10
	mov	r3, #6336
	mov	r0, #3
	ldr	r1, .L11+16
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r4, .L11+20
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L11+24
	add	r2, r2, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
.L4:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L10:
	mov	r3, #6336
	mov	r0, #3
	ldr	r1, .L11+28
	mov	r2, #100663296
	add	r3, r3, #16
	ldr	r4, .L11+20
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L11+32
	add	r2, r2, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	b	.L4
.L9:
	bl	goToSplash
	b	.L5
.L12:
	.align	2
.L11:
	.word	oldButtons
	.word	buttons
	.word	counter
	.word	1717986919
	.word	losescreen1Tiles
	.word	DMANow
	.word	losescreen1Map
	.word	losescreen2Tiles
	.word	losescreen2Map
	.size	updateLose, .-updateLose
	.align	2
	.global	updateWin
	.type	updateWin, %function
updateWin:
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
	b	goToSplash
.L16:
	.align	2
.L15:
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
	ldr	r0, .L19
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, .L19+4
	mov	lr, pc
	bx	r3
	bl	goToSplash
	ldr	r7, .L19+8
	ldr	r5, .L19+12
	ldr	r6, .L19+16
.L18:
	ldr	r2, [r5, #0]
	ldr	r3, [r4, #304]
	str	r2, [r7, #0]
	str	r3, [r5, #0]
	ldr	ip, [r6, #0]
	mov	lr, pc
	bx	ip
	b	.L18
.L20:
	.align	2
.L19:
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
	mov	r5, #7936	@ movhi
	strh	r5, [ip, #8]	@ movhi
	mov	r0, #3
	strh	lr, [ip, #16]	@ movhi
	ldr	r1, .L22
	mov	r2, #100663296
	mov	r3, #7104
	ldr	r4, .L22+4
	strh	lr, [ip, #20]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L22+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L22+12
	ldr	r3, .L22+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L23:
	.align	2
.L22:
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
	ldr	r3, .L26
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L26+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToInstructions
.L27:
	.align	2
.L26:
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
	mov	r5, #7424	@ movhi
	strh	r5, [ip, #8]	@ movhi
	mov	r0, #3
	strh	lr, [ip, #16]	@ movhi
	ldr	r1, .L29
	mov	r2, #100663296
	mov	r3, #4864
	ldr	r4, .L29+4
	strh	lr, [ip, #20]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #59392
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L29+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L29+12
	ldr	r3, .L29+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L30:
	.align	2
.L29:
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
	stmfd	sp!, {r4, lr}
	ldr	r4, .L36
	ldr	r3, [r4, #0]
	tst	r3, #32
	beq	.L32
	ldr	r2, .L36+4
	ldr	r2, [r2, #0]
	tst	r2, #32
	beq	.L34
.L32:
	tst	r3, #16
	beq	.L31
	ldr	r3, .L36+4
	ldr	r3, [r3, #0]
	tst	r3, #16
	beq	.L35
.L31:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L35:
	ldmfd	sp!, {r4, lr}
	b	goToControls
.L34:
	bl	goToSplash
	ldr	r3, [r4, #0]
	b	.L32
.L37:
	.align	2
.L36:
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
	ldr	r1, .L43
	add	r2, r2, #512
	mov	r3, #256
	ldr	r4, .L43+4
	strh	r7, [ip, #0]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #65536
	mov	r3, #16384
	mov	r0, #3
	ldr	r1, .L43+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L43+12
	add	r2, r3, #1016
.L39:
	mov	r9, #512	@ movhi
	strh	r9, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L39
	ldr	r3, .L43+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L43+20
	mov	lr, pc
	bx	r3
	ldr	ip, .L43+24
	mov	r3, #120
	mov	r5, #0
	mov	sl, #2
	str	r3, [ip, #0]
	mov	r3, #200
	stmib	ip, {r3, r5, sl}	@ phole stm
	mov	r6, ip
	ldr	r4, .L43+28
	ldmia	r6!, {r0, r1, r2, r3}
	ldr	r7, .L43+32
	mov	r9, #23040
	mov	r8, #32
	mov	fp, #64
	stmia	r7!, {r0, r1, r2, r3}
	str	r9, [r4, #0]
	mov	r9, #112
	str	fp, [ip, #16]
	str	r8, [ip, #20]
	str	r5, [ip, #24]
	str	r5, [ip, #28]
	str	r9, [r4, #4]
	mov	r9, #1
	str	r9, [r4, #40]
	mov	r9, #10
	ldmia	r6!, {r0, r1, r2, r3}
	str	r9, [r4, #44]
	mov	r9, #1280
	str	r9, [r4, #48]
	mov	r9, #40
	str	r5, [r4, #8]
	str	sl, [r4, #12]
	str	r8, [r4, #16]
	str	fp, [r4, #20]
	str	r5, [r4, #24]
	str	r5, [r4, #28]
	str	r5, [r4, #32]
	str	r5, [r4, #36]
	str	r9, [r4, #52]
	stmia	r7!, {r0, r1, r2, r3}
	str	r5, [ip, #32]
	str	r5, [ip, #36]
	ldmia	r6, {r0, r1}
	stmia	r7, {r0, r1}
	ldr	r7, .L43+32
	ldmia	ip!, {r0, r1, r2, r3}
	add	r4, r7, r9
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	r4!, {r0, r1, r2, r3}
	ldr	ip, .L43+36
	ldmia	r6, {r0, r1}
	mov	r3, #140
	mov	r7, #16
	str	r3, [ip, #0]
	mov	r9, #1
	mov	r3, #240
	str	r3, [ip, #4]
	str	r7, [ip, #12]
	str	r9, [ip, #8]
	mov	r6, ip
	stmia	r4, {r0, r1}
	ldr	r4, .L43+40
	ldmia	r6!, {r0, r1, r2, r3}
	str	r7, [ip, #16]
	mov	r7, r4
	stmia	r7!, {r0, r1, r2, r3}
	str	r5, [ip, #20]
	ldmia	r6, {r0, r1}
	stmia	r7, {r0, r1}
	ldmia	ip!, {r0, r1, r2, r3}
	add	r4, r4, #24
	stmia	r4!, {r0, r1, r2, r3}
	ldmia	r6, {r0, r1}
	ldr	r3, .L43+44
	ldr	ip, .L43+48
	stmia	r4, {r0, r1}
	mov	r1, #208
	mov	r2, #8
	str	r8, [r3, #0]
	stmib	r3, {r1, r5, sl}	@ phole stm
	str	r8, [r3, #16]
	str	fp, [r3, #20]
	str	r5, [r3, #24]
	mov	r3, #145
	str	r3, [ip, #0]
	ldr	r7, .L43+52
	stmib	ip, {r5, sl}	@ phole stm
	str	r2, [ip, #12]
	str	r2, [ip, #16]
	str	r5, [ip, #20]
.L40:
	mov	r6, ip
	ldmia	r6!, {r0, r1, r2, r3}
	add	r4, r7, r5
	stmia	r4!, {r0, r1, r2, r3}
	add	r5, r5, #24
	ldmia	r6, {r0, r1}
	cmp	r5, #120
	stmia	r4, {r0, r1}
	bne	.L40
	ldr	r2, .L43+56
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L43+60
	str	r3, [r2, #0]
	ldr	r2, .L43+64
	mov	r1, #3
	str	r1, [r2, #0]
	ldr	r2, .L43+68
	str	r3, [r2, #0]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L44:
	.align	2
.L43:
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
	ldr	r5, .L46
	strh	ip, [r4, #10]	@ movhi
	mov	r0, #3
	ldr	r1, .L46+4
	add	r2, r6, #16384
	add	r3, r3, #48
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L46+8
	add	r2, r6, #53248
	mov	r3, #4096
	mov	lr, pc
	bx	r5
	mov	ip, #6400	@ movhi
	strh	ip, [r4, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L46+12
	mov	r2, r6
	mov	r3, #1120
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L46+16
	add	r2, r6, #51200
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	ldr	r3, .L46+20
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
	ldr	r0, .L46+24
	strh	ip, [r4, #16]	@ movhi
	sub	r1, r1, #223
	ldr	ip, .L46+28
	mov	lr, pc
	bx	ip
	ldr	r2, .L46+32
	ldr	r3, .L46+36
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L47:
	.align	2
.L46:
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
	ldr	r4, .L53
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L49
	ldr	r2, .L53+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L51
.L49:
	tst	r3, #4
	beq	.L48
	ldr	r3, .L53+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L52
.L48:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L52:
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L51:
	bl	goToGame
	ldr	r3, [r4, #0]
	b	.L49
.L54:
	.align	2
.L53:
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
	stmfd	sp!, {r4, lr}
	ldr	r4, .L60
	ldr	r3, [r4, #0]
	tst	r3, #32
	beq	.L56
	ldr	r2, .L60+4
	ldr	r2, [r2, #0]
	tst	r2, #32
	beq	.L58
.L56:
	tst	r3, #8
	beq	.L55
	ldr	r3, .L60+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L59
.L55:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L59:
	bl	initGame
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L58:
	bl	goToInstructions
	ldr	r3, [r4, #0]
	b	.L56
.L61:
	.align	2
.L60:
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
	ldr	r1, .L63
	add	r2, r5, #16384
	mov	r3, #1568
	ldr	r4, .L63+4
	strh	lr, [ip, #20]	@ movhi
	mov	lr, pc
	bx	r4
	add	r2, r5, #61440
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L63+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L63+12
	ldr	r3, .L63+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L64:
	.align	2
.L63:
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
	ldr	ip, .L66
	mov	r3, #7232
	mov	r0, #3
	ldr	r1, .L66+4
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r4, .L66+8
	str	lr, [ip, #0]
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #61440
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L66+12
	mov	lr, pc
	bx	r4
	ldr	r2, .L66+16
	ldr	r3, .L66+20
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L67:
	.align	2
.L66:
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
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r2, #7680	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r1, .L69
	ldr	r2, .L69+4
	str	r1, [r2, #0]
	mov	r2, #0	@ movhi
	strh	r2, [r3, #16]	@ movhi
	mov	r2, #256	@ movhi
	strh	r2, [r3, #0]	@ movhi
	bx	lr
.L70:
	.align	2
.L69:
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
	ldr	r4, .L134
	sub	sp, sp, #20
	mov	r1, #67108864
	ldr	r2, [r4, #8]
	ldr	ip, [r4, #52]
	ldr	r0, [r1, #304]
	ldr	r3, [r4, #0]
	add	r2, ip, r2
	add	r3, r2, r3
	tst	r0, #16
	str	r2, [r4, #8]
	str	r3, [r4, #0]
	beq	.L72
	ldr	r2, [r1, #304]
	mvn	r2, r2
	ands	r2, r2, #32
	beq	.L73
.L72:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	ldr	r3, [r4, #36]
	tst	r2, #16
	add	r3, r3, #1
	ldr	r2, .L134
	str	r3, [r4, #36]
	beq	.L117
	ldr	sl, .L134+4
	ldr	r9, .L134+8
.L74:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L75
	ldr	r1, [sl, #0]
	ldr	r2, [r9, #24]
	ldr	r3, [r4, #12]
	cmp	r2, #0
	rsb	r3, r3, r1
	mov	r2, #1
	str	r3, [sl, #0]
	str	r2, [r4, #32]
	ldr	r3, .L134+8
	bne	.L125
.L75:
	ldr	r3, [r4, #36]
	ldr	r2, .L134+12
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	rsb	r2, r1, r2, asr #2
	add	r2, r2, r2, asl #2
	cmp	r3, r2, asl #1
	ldr	r3, .L134
	bne	.L122
	ldr	r2, [r3, #28]
	cmp	r2, #1
	addle	r2, r2, #1
	strle	r2, [r3, #28]
	ble	.L122
	cmp	r2, #2
	moveq	r2, #1
	streq	r2, [r3, #28]
.L122:
	ldr	r3, [r3, #0]
.L77:
	ldr	r2, [r4, #20]
	mov	r3, r3, asr #8
	rsb	r2, r2, #159
	cmp	r3, r2
	ldr	r1, .L134
	movge	r3, r2, asl #8
	movge	r2, #0
	strge	r3, [r1, #0]
	strge	r2, [r1, #8]
	movge	r3, r3, asr #8
	cmp	r3, #0
	ldrle	r3, [r4, #8]
	movle	r2, #0
	rsble	r3, r3, #0
	strle	r2, [r4, #0]
	strle	r3, [r4, #8]
	ldr	r2, [r4, #16]
	ldr	r3, [r4, #4]
	add	r1, r2, r3
	cmp	r1, #240
	rsbgt	r3, r2, #240
	ldrgt	r2, .L134
	ldr	r8, .L134+16
	strgt	r3, [r2, #4]
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r4, #4]
	ldr	r3, [r8, #0]
	tst	r3, #2
	beq	.L84
	ldr	r3, .L134+20
	ldr	r3, [r3, #0]
	tst	r3, #2
	bne	.L84
	ldr	r3, [r4, #44]
	ldr	r2, [r4, #8]
	rsb	r1, r3, #0
	cmp	r2, r1
	ldr	r1, .L134
	bgt	.L126
.L84:
	ldr	r6, .L134+24
	ldr	r5, .L134+28
	ldr	r7, [r6, #0]
	ldr	r1, [r5, #0]
	mov	r0, r7
	ldr	r2, .L134+32
	mov	lr, pc
	bx	r2
	add	r7, r7, #1
	cmp	r1, #0
	str	r7, [r6, #0]
	beq	.L85
	ldr	r7, .L134+36
	ldr	r3, [r7, #24]
.L86:
	cmp	r3, #0
	ldr	r6, .L134+36
	ldr	fp, .L134+40
	mov	r5, #0
	bne	.L127
.L88:
	add	r5, r5, #1
	cmp	r5, #2
	add	r6, r6, #40
	beq	.L89
	ldr	r3, [r6, #24]
	cmp	r3, #0
	beq	.L88
.L127:
	add	r1, r5, r5, asl #2
	add	r1, r7, r1, asl #3
	mov	r0, r1
	str	r1, [sp, #12]
	mov	lr, pc
	bx	fp
	ldr	ip, .L134+44
	ldr	ip, [ip, #0]
	cmp	ip, #0
	str	ip, [sp, #4]
	ldr	r1, [sp, #12]
	bne	.L88
	ldr	r0, .L134
	ldr	r2, .L134+48
	mov	lr, pc
	bx	r2
	cmp	r0, #0
	beq	.L88
	mov	r1, #4864
	mov	r2, #11008
	add	r1, r1, #10
	add	r2, r2, #17
	ldr	r3, [sp, #4]
	ldr	r0, .L134+52
	ldr	ip, .L134+56
	mov	lr, pc
	bx	ip
	ldr	r1, .L134+60
	ldr	r3, [r1, #0]
	ldr	r2, [sp, #4]
	sub	r3, r3, #1
	str	r2, [r6, #24]
	str	r3, [r1, #0]
	b	.L88
.L117:
	ldr	sl, .L134+4
	ldr	r9, .L134+8
	ldr	r0, [sl, #0]
	ldr	r1, [r9, #24]
	ldr	r3, [r2, #12]
	cmp	r1, #0
	add	r3, r0, r3
	mov	r1, #0
	str	r1, [r2, #32]
	str	r3, [sl, #0]
	beq	.L74
	mvn	r3, #1
	str	r3, [r9, #12]
	mov	r0, r9
	ldr	r3, .L134+64
	mov	lr, pc
	bx	r3
	b	.L74
.L73:
	ldr	r1, .L134+68
	ldr	sl, .L134+4
	str	r2, [r1, #0]
	ldr	r9, .L134+8
	b	.L77
.L89:
	ldr	r3, [r8, #0]
	tst	r3, #1
	beq	.L123
	ldr	r3, .L134+20
	ldr	r3, [r3, #0]
	ands	r3, r3, #1
	bne	.L123
	ldr	r6, .L134+72
	mov	r2, r6
.L94:
	ldr	r1, [r2, #20]
	cmp	r1, #0
	beq	.L128
	add	r3, r3, #1
	cmp	r3, #5
	add	r2, r2, #24
	bne	.L94
.L91:
	ldr	r5, .L134+72
	mov	r4, #0
.L93:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	bne	.L129
.L95:
	add	r4, r4, #1
	cmp	r4, #5
	add	r5, r5, #24
	bne	.L93
	ldr	r3, [r8, #0]
	tst	r3, #4
	beq	.L97
	ldr	r3, .L134+20
	ldr	r3, [r3, #0]
	ands	r3, r3, #4
	bne	.L97
	ldr	r2, .L134+44
	ldr	r1, [r2, #0]
	cmp	r1, #0
	moveq	r3, #1
	streq	r3, [r2, #0]
	strne	r3, [r2, #0]
.L97:
	ldr	r4, .L134+76
	ldr	r6, .L134+80
	ldr	r5, [r4, #0]
	ldr	r1, [r6, #0]
	mov	r0, r5
	ldr	r3, .L134+32
	mov	lr, pc
	bx	r3
	add	r5, r5, #1
	cmp	r1, #0
	str	r5, [r4, #0]
	ldrne	r4, .L134+84
	bne	.L99
	ldr	r4, .L134+84
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L100
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L130
.L101:
	ldr	r3, .L134+88
	ldr	r0, .L134+84
	ldr	r1, .L134
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L131
.L103:
	ldr	r3, .L134+92
	ldr	r3, [r3, #0]
	cmp	r3, #4
	ble	.L104
.L133:
	ldr	r3, [r9, #24]
	cmp	r3, #0
	ldreq	r3, .L134+8
	moveq	r2, #1
	streq	r2, [r3, #24]
.L108:
	ldr	r0, .L134+8
	ldr	r1, .L134
	ldr	r3, .L134+96
	mov	lr, pc
	bx	r3
.L106:
	ldr	r3, [sl, #0]
	ldr	r1, .L134+60
	add	r2, r3, r3, lsr #31
	ldr	r0, [r1, #0]
	mov	r2, r2, asl #15
	mov	r1, r3, asl #16
	mov	r1, r1, lsr #16
	mov	r3, #67108864
	mov	r2, r2, lsr #16
	cmp	r0, #0
	strh	r1, [r3, #20]	@ movhi
	strh	r2, [r3, #16]	@ movhi
	bgt	.L71
	ldr	r1, .L134+100
	ldr	r2, .L134+104
	mov	ip, #256	@ movhi
	str	r1, [r2, #0]
	mov	r2, #7680	@ movhi
	mov	r1, #0	@ movhi
	strh	r2, [r3, #8]	@ movhi
	strh	ip, [r3, #0]	@ movhi
	strh	r1, [r3, #16]	@ movhi
.L71:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L129:
	add	fp, r4, r4, asl #1
	add	fp, r6, fp, asl #3
	ldr	r3, .L134+108
	mov	r0, fp
	mov	lr, pc
	bx	r3
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L132
.L96:
	ldr	r3, [r7, #64]
	cmp	r3, #0
	beq	.L95
	mov	r0, fp
	ldr	r1, .L134+112
	ldr	r2, .L134+116
	mov	lr, pc
	bx	r2
	b	.L95
.L123:
	ldr	r6, .L134+72
	b	.L91
.L130:
	mov	r3, #1
.L100:
	add	r3, r3, r3, asl #1
	add	r3, r4, r3, asl #3
	mov	r2, #1
	str	r2, [r3, #20]
	mov	r2, #240
	str	r2, [r3, #4]
	ldr	r3, .L134+120
	mov	lr, pc
	bx	r3
	ldr	r2, .L134+124
	smull	ip, r2, r0, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #6
	rsb	r2, r3, r3, asl #5
	add	r3, r3, r2, asl #2
	sub	r3, r0, r3, asl #3
	add	r3, r3, #87
	str	r3, [r6, #0]
.L99:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L101
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L103
.L131:
	ldr	r3, .L134+88
	ldr	r0, .L134+128
	ldr	r1, .L134
	mov	lr, pc
	bx	r3
	ldr	r3, .L134+92
	ldr	r3, [r3, #0]
	cmp	r3, #4
	bgt	.L133
.L104:
	ldr	r3, [r9, #24]
	cmp	r3, #0
	beq	.L106
	b	.L108
.L85:
	ldr	r7, .L134+36
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L87
	ldr	r2, [r7, #64]
	cmp	r2, #0
	bne	.L86
	mov	r3, #1
.L87:
	add	r3, r3, r3, asl #2
	add	r3, r7, r3, asl #3
	mov	r2, #1
	str	r2, [r3, #24]
	mov	r2, #220
	str	r2, [r3, #4]
	ldr	r3, .L134+120
	mov	lr, pc
	bx	r3
	ldr	r2, .L134+132
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, asl #2
	rsb	r3, r3, r3, asl #4
	sub	r3, r0, r3, asl #2
	add	r3, r3, #87
	str	r3, [r5, #0]
	ldr	r3, [r7, #24]
	b	.L86
.L132:
	mov	r0, fp
	ldr	r1, .L134+36
	ldr	ip, .L134+116
	mov	lr, pc
	bx	ip
	b	.L96
.L126:
	cmp	r2, r3
	ldrlt	r3, [r1, #48]
	rsblt	r3, r3, #0
	strlt	r3, [r1, #8]
	b	.L84
.L125:
	mov	r2, #2
	mov	r0, r3
	str	r2, [r3, #12]
	ldr	r3, .L134+64
	mov	lr, pc
	bx	r3
	b	.L75
.L128:
	ldr	r2, [r4, #20]
	ldr	lr, [r4, #0]
	ldr	r1, [r4, #24]
	add	r3, r3, r3, asl #1
	ldr	ip, [r4, #16]
	ldr	r0, [r4, #4]
	mov	lr, lr, asr #8
	add	r4, r2, r2, lsr #31
	cmp	r1, #1
	add	r2, r6, r3, asl #3
	add	lr, lr, r4, asr #1
	str	lr, [r6, r3, asl #3]
	ldreq	r3, [r2, #8]
	add	r0, ip, r0
	mov	r1, #1
	rsbeq	r3, r3, #0
	str	r1, [r2, #20]
	str	r0, [r2, #4]
	streq	r3, [r2, #8]
	b	.L91
.L135:
	.align	2
.L134:
	.word	p
	.word	hOff
	.word	fridge
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
	.word	updateFridge
	.word	currFrame
	.word	bullets
	.word	timetwo
	.word	timeToNextHealth
	.word	hearts
	.word	updateHealth
	.word	score
	.word	collisionFridge
	.word	updateLose
	.word	state
	.word	updateBullet
	.word	cats+40
	.word	collisionCheckEnemy
	.word	rand
	.word	274877907
	.word	hearts+24
	.word	458129845
	.size	update, .-update
	.align	2
	.global	draw
	.type	draw, %function
draw:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, lr}
	ldr	r3, .L152
	ldr	r1, .L152+4
	ldrb	r0, [r3, #1]	@ zero_extendqisi2
	ldr	r2, [r3, #4]
	ldr	ip, [r1, #0]
	mvn	r0, r0, asl #17
	ldr	r1, .L152+8
	mvn	r2, r2, asl #18
	mvn	r0, r0, lsr #17
	mvn	r2, r2, lsr #18
	cmp	ip, #0
	strh	r0, [r1, #0]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	beq	.L137
	ldr	r2, [r3, #32]
	ldr	r3, [r3, #28]
	add	r3, r3, r2, asl #6
	mov	r3, r3, asl #2
	orr	r3, r3, #4096
	strh	r3, [r1, #4]	@ movhi
.L143:
	ldr	r3, .L152+12
	ldr	r2, [r3, #24]
	cmp	r2, #0
	moveq	r0, #512	@ movhi
	streqh	r0, [r1, #8]	@ movhi
	beq	.L139
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
.L139:
	ldr	r3, [r3, #64]
	cmp	r3, #0
	ldr	r3, .L152+12
	bne	.L140
	mov	r2, #512	@ movhi
	strh	r2, [r1, #16]	@ movhi
.L142:
	ldr	r3, .L152+16
	ldr	r2, .L152+8
	add	ip, r3, #120
.L141:
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
	bne	.L141
	ldr	r3, .L152+20
	ldr	r2, .L152+24
	ldr	ip, [r3, #20]
	mvn	r0, #32512
	ldr	lr, [r2, #0]
	mov	r2, r0
	sub	r2, r2, #245
	cmp	ip, #0
	strh	r2, [r1, #34]	@ movhi
	ldrne	r2, [r3, #4]
	sub	r0, r0, #250
	ldr	ip, .L152+8
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
	ldr	r3, .L152+20
	ldrne	r2, [r3, #28]
	ldrneh	r3, [r3, #24]
	moveq	r3, #512	@ movhi
	streqh	r3, [r1, #64]	@ movhi
	strneh	r3, [r1, #64]	@ movhi
	ldr	r3, .L152+28
	orrne	r2, r2, #16384
	strneh	r2, [r1, #66]	@ movhi
	ldr	r2, [r3, #24]
	movne	r0, #712	@ movhi
	add	lr, lr, #320
	mov	lr, lr, asl #1
	strneh	r0, [r1, #68]	@ movhi
	cmp	r2, #0
	strh	lr, [r1, #36]	@ movhi
	beq	.L150
	ldr	r2, [r3, #4]
	ldr	ip, [r3, #0]
	add	r3, r2, #32
	mvn	r0, r2, asl #18
	mvn	r3, r3, asl #18
	add	r2, ip, #64
	mvn	r0, r0, lsr #18
	mvn	r3, r3, lsr #18
	and	r2, r2, #255
	orr	r2, r2, #32768
	mov	r0, r0, asl #16
	mov	r3, r3, asl #16
	mov	r0, r0, lsr #16
	mov	r3, r3, lsr #16
	and	ip, ip, #255
	strh	r2, [r1, #144]	@ movhi
	strh	r2, [r1, #152]	@ movhi
	mov	r2, #12	@ movhi
	orr	ip, ip, #32768
	strh	r0, [r1, #130]	@ movhi
	strh	r3, [r1, #138]	@ movhi
	strh	r0, [r1, #146]	@ movhi
	strh	r3, [r1, #154]	@ movhi
	strh	r2, [r1, #132]	@ movhi
	mov	r3, #16	@ movhi
	mov	r0, #268	@ movhi
	mov	r2, #272	@ movhi
	strh	ip, [r1, #128]	@ movhi
	strh	ip, [r1, #136]	@ movhi
	strh	r3, [r1, #140]	@ movhi
	strh	r0, [r1, #148]	@ movhi
	strh	r2, [r1, #156]	@ movhi
.L150:
	mov	r0, #3
	ldr	r1, .L152+8
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L152+32
	mov	lr, pc
	bx	ip
	ldr	r3, .L152+36
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L137:
	ldr	r2, [r3, #32]
	ldr	r3, [r3, #28]
	add	r3, r3, r2, asl #6
	mov	r3, r3, asl #2
	strh	r3, [r1, #4]	@ movhi
	b	.L143
.L140:
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
	b	.L142
.L153:
	.align	2
.L152:
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
	ldr	r3, .L157
	mov	lr, pc
	bx	r3
	bl	draw
	ldr	r3, .L157+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L154
	ldr	r3, .L157+8
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L156
.L154:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L156:
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L158:
	.align	2
.L157:
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
	ldr	r3, .L162
	add	r2, r3, #1016
.L160:
	mov	r1, #512	@ movhi
	strh	r1, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L160
	bx	lr
.L163:
	.align	2
.L162:
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
	.comm	counter,4,4
	.comm	bullet,24,4
	.comm	bullets,120,4
	.comm	state,4,4
	.comm	currFrame,4,4
	.comm	direction,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
