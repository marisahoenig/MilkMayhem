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
	ldr	r5, .L2
	mov	lr, #0
	str	lr, [r5, #0]
	mov	ip, #67108864
	mov	r5, #7936	@ movhi
	strh	r5, [ip, #8]	@ movhi
	mov	r5, #256	@ movhi
	strh	lr, [ip, #16]	@ movhi
	strh	r5, [ip, #0]	@ movhi
	ldr	r4, .L2+4
	mov	r0, #3
	ldr	r1, .L2+8
	mov	r2, #100663296
	mov	r3, #3280
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L2+12
	add	r2, r2, #63488
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r2, #11008
	add	r2, r2, #17
	mov	r3, #1
	ldr	r0, .L2+16
	mov	r1, #145408
	ldr	ip, .L2+20
	mov	lr, pc
	bx	ip
	ldr	r2, .L2+24
	ldr	r3, .L2+28
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L3:
	.align	2
.L2:
	.word	hOff
	.word	DMANow
	.word	splashscreenTiles
	.word	splashscreenMap
	.word	icecream
	.word	playSoundA
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
	ldr	r3, .L15+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L15+12
	mov	lr, pc
	bx	r3
	bl	goToSplash
	ldr	r7, .L15+16
	ldr	r5, .L15+20
	ldr	r6, .L15+24
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
	.word	setupInterrupts
	.word	setupSounds
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
	ldr	r1, .L18
	mov	r2, #100663296
	mov	r3, #7104
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
	mov	r5, #7424	@ movhi
	strh	r5, [ip, #8]	@ movhi
	mov	r0, #3
	strh	lr, [ip, #16]	@ movhi
	ldr	r1, .L25
	mov	r2, #100663296
	mov	r3, #4864
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
	stmfd	sp!, {r4, lr}
	ldr	r4, .L32
	ldr	r3, [r4, #0]
	tst	r3, #32
	beq	.L28
	ldr	r2, .L32+4
	ldr	r2, [r2, #0]
	tst	r2, #32
	beq	.L30
.L28:
	tst	r3, #16
	beq	.L27
	ldr	r3, .L32+4
	ldr	r3, [r3, #0]
	tst	r3, #16
	beq	.L31
.L27:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L31:
	ldmfd	sp!, {r4, lr}
	b	goToControls
.L30:
	bl	goToSplash
	ldr	r3, [r4, #0]
	b	.L28
.L33:
	.align	2
.L32:
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
	mov	r8, #4864	@ movhi
	mov	r0, #3
	ldr	r1, .L41
	add	r2, r2, #512
	mov	r3, #256
	ldr	r4, .L41+4
	strh	r8, [ip, #0]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #65536
	mov	r3, #16384
	mov	r0, #3
	ldr	r1, .L41+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L41+12
	add	r2, r3, #1016
.L35:
	mov	sl, #512	@ movhi
	strh	sl, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L35
	ldr	ip, .L41+16
	mov	r3, #120
	mov	lr, #0
	mov	r8, #1
	str	r3, [ip, #0]
	mov	r3, #230
	str	r8, [ip, #12]
	stmib	ip, {r3, lr}	@ phole stm
	mov	r5, ip
	ldmia	r5!, {r0, r1, r2, r3}
	ldr	r6, .L41+20
	ldr	r4, .L41+24
	mov	r7, #32
	mov	r9, #64
	stmia	r6!, {r0, r1, r2, r3}
	mov	sl, #23040
	str	r9, [ip, #16]
	str	r7, [ip, #20]
	str	lr, [ip, #24]
	str	lr, [ip, #28]
	str	sl, [r4, #0]
	mov	sl, #112
	str	sl, [r4, #4]
	mov	sl, #10
	ldmia	r5!, {r0, r1, r2, r3}
	str	sl, [r4, #44]
	mov	sl, #1280
	mov	fp, #2
	str	sl, [r4, #48]
	mov	sl, #40
	str	r8, [r4, #40]
	str	lr, [r4, #8]
	str	fp, [r4, #12]
	str	r7, [r4, #16]
	str	r9, [r4, #20]
	str	lr, [r4, #24]
	str	lr, [r4, #28]
	str	lr, [r4, #32]
	str	lr, [r4, #36]
	str	sl, [r4, #52]
	stmia	r6!, {r0, r1, r2, r3}
	str	lr, [ip, #36]
	str	lr, [ip, #32]
	str	lr, [ip, #40]
	ldmia	r5, {r0, r1, r2}
	ldr	r4, .L41+20
	stmia	r6, {r0, r1, r2}
	ldmia	ip!, {r0, r1, r2, r3}
	add	sl, r4, #44
	stmia	sl!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	sl!, {r0, r1, r2, r3}
	ldr	ip, .L41+28
	ldmia	r5, {r0, r1, r2}
	mov	r3, #140
	stmia	sl, {r0, r1, r2}
	mov	r4, #16
	str	r3, [ip, #0]
	mov	r3, #240
	stmib	ip, {r3, r8}	@ phole stm
	str	r4, [ip, #12]
	ldr	r6, .L41+32
	mov	r5, ip
	ldmia	r5!, {r0, r1, r2, r3}
	mov	r8, r6
	stmia	r8!, {r0, r1, r2, r3}
	str	r4, [ip, #16]
	str	lr, [ip, #20]
	ldmia	r5, {r0, r1}
	stmia	r8, {r0, r1}
	ldmia	ip!, {r0, r1, r2, r3}
	add	r6, r6, #24
	stmia	r6!, {r0, r1, r2, r3}
	ldr	r3, .L41+36
	ldmia	r5, {r0, r1}
	ldr	ip, .L41+40
	mov	r2, #208
	str	r7, [r3, #0]
	str	r2, [r3, #4]
	stmia	r6, {r0, r1}
	str	lr, [r3, #8]
	str	fp, [r3, #12]
	str	r7, [r3, #16]
	str	r9, [r3, #20]
	str	lr, [r3, #24]
	mov	r3, #145
	ldr	r5, .L41+44
	stmia	ip, {r3, lr}	@ phole stm
	str	fp, [ip, #8]
	str	r4, [ip, #12]
	str	r4, [ip, #16]
	str	lr, [ip, #20]
	str	lr, [ip, #24]
.L36:
	mov	r6, ip
	ldmia	r6!, {r0, r1, r2, r3}
	add	r4, r5, lr
	stmia	r4!, {r0, r1, r2, r3}
	add	lr, lr, #28
	ldmia	r6, {r0, r1, r2}
	cmp	lr, #140
	stmia	r4, {r0, r1, r2}
	bne	.L36
	ldr	r1, .L41+48
	mov	r2, #16
	ldr	ip, .L41+52
	mov	r0, #1
	mov	lr, #12
	mov	r4, #112
	ldr	r3, .L41+56
	str	r4, [r1, #4]
	str	r2, [r1, #12]
	str	r2, [r1, #16]
	str	lr, [r1, #0]
	str	r0, [r1, #20]
	mov	r1, #202
	str	r1, [ip, #4]
	mov	r1, #2
	str	r2, [ip, #12]
	str	r2, [ip, #16]
	str	r1, [r3, #0]
	str	r2, [r3, #12]
	mov	r1, #220
	mov	r2, #32
	str	lr, [ip, #0]
	str	r0, [ip, #20]
	str	r1, [r3, #4]
	str	r2, [r3, #16]
	str	r0, [r3, #20]
	ldr	r6, .L41+60
	mov	r4, #0
.L37:
	mov	r5, ip
	ldmia	r5!, {r0, r1, r2, r3}
	add	lr, r6, r4
	stmia	lr!, {r0, r1, r2, r3}
	add	r4, r4, #24
	ldmia	r5, {r0, r1}
	cmp	r4, #120
	stmia	lr, {r0, r1}
	bne	.L37
	ldr	lr, .L41+64
	mov	ip, #0
	str	ip, [lr, #0]
	ldr	lr, .L41+68
	str	ip, [lr, #0]
	ldr	lr, .L41+72
	mov	r4, #3
	str	r4, [lr, #0]
	ldr	lr, .L41+76
	mov	r4, #5
	str	r4, [lr, #0]
	ldr	lr, .L41+80
	mov	r1, #190464
	mov	r2, #11008
	str	ip, [lr, #0]
	ldr	r0, .L41+84
	add	r1, r1, #264
	add	r2, r2, #17
	mov	r3, #1
	ldr	ip, .L41+88
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L42:
	.align	2
.L41:
	.word	spritesheetPal
	.word	DMANow
	.word	spritesheetTiles
	.word	shadowOAM
	.word	c
	.word	cats
	.word	p
	.word	health
	.word	hearts
	.word	fridge
	.word	bullet
	.word	bullets
	.word	barplayer
	.word	barcat
	.word	barfridge
	.word	barcats
	.word	chocolateMilk
	.word	hOff
	.word	lives
	.word	catsRemaining
	.word	hurt
	.word	uke
	.word	playSoundA
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
	mov	r4, #67108864
	mov	lr, #4864	@ movhi
	mov	r6, #100663296
	mov	r3, #15104
	ldr	r5, .L44
	strh	lr, [r4, #0]	@ movhi
	strh	ip, [r4, #10]	@ movhi
	mov	r0, #3
	ldr	r1, .L44+4
	add	r2, r6, #16384
	add	r3, r3, #48
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L44+8
	add	r2, r6, #53248
	mov	r3, #4096
	mov	lr, pc
	bx	r5
	mov	ip, #6400	@ movhi
	mov	r0, #3
	ldr	r1, .L44+12
	mov	r2, r6
	mov	r3, #1120
	strh	ip, [r4, #8]	@ movhi
	mov	lr, pc
	bx	r5
	ldr	r1, .L44+16
	add	r2, r6, #51200
	mov	r3, #1024
	mov	r0, #3
	mov	lr, pc
	bx	r5
	ldr	r3, .L44+20
	ldr	r3, [r3, #0]
	add	r2, r3, r3, lsr #31
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [r4, #20]	@ movhi
	mov	r2, r2, asl #15
	ldr	r1, .L44+24
	ldr	r3, .L44+28
	mov	r2, r2, lsr #16
	str	r1, [r3, #0]
	strh	r2, [r4, #16]	@ movhi
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L45:
	.align	2
.L44:
	.word	DMANow
	.word	movebackgroundTiles
	.word	movebackgroundMap
	.word	lightsTiles
	.word	lightsMap
	.word	hOff
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
	ldr	r3, .L49+8
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+12
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L50:
	.align	2
.L49:
	.word	oldButtons
	.word	buttons
	.word	stopSoundB
	.word	unpauseSound
	.size	updatePause, .-updatePause
	.align	2
	.global	updateControls
	.type	updateControls, %function
updateControls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}
	ldr	r4, .L56
	ldr	r3, [r4, #0]
	tst	r3, #32
	beq	.L52
	ldr	r2, .L56+4
	ldr	r2, [r2, #0]
	tst	r2, #32
	beq	.L54
.L52:
	tst	r3, #8
	beq	.L51
	ldr	r3, .L56+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L55
.L51:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L55:
	ldr	r3, .L56+8
	mov	lr, pc
	bx	r3
	bl	initGame
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L54:
	bl	goToInstructions
	ldr	r3, [r4, #0]
	b	.L52
.L57:
	.align	2
.L56:
	.word	oldButtons
	.word	buttons
	.word	stopSound
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
	strh	lr, [ip, #20]	@ movhi
	mov	r0, #3
	ldr	r1, .L59
	add	r2, r5, #16384
	mov	r3, #1568
	ldr	r4, .L59+4
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r1, .L59+8
	add	r2, r5, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldr	r3, .L59+12
	mov	lr, pc
	bx	r3
	mov	r1, #80896
	mov	r2, #11008
	add	r2, r2, #17
	mov	r3, #1
	ldr	r0, .L59+16
	add	r1, r1, #64
	ldr	ip, .L59+20
	mov	lr, pc
	bx	ip
	ldr	r2, .L59+24
	ldr	r3, .L59+28
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L60:
	.align	2
.L59:
	.word	pausescreenTiles
	.word	DMANow
	.word	pausescreenMap
	.word	pauseSound
	.word	pausesound
	.word	playSoundB
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
	ldr	r3, .L62
	mov	lr, pc
	bx	r3
	mov	r5, #7680	@ movhi
	mov	ip, #67108864
	mov	lr, #0
	strh	r5, [ip, #8]	@ movhi
	mov	r5, #256	@ movhi
	strh	lr, [ip, #16]	@ movhi
	strh	r5, [ip, #0]	@ movhi
	ldr	ip, .L62+4
	mov	r3, #7232
	str	lr, [ip, #0]
	mov	r0, #3
	ldr	r1, .L62+8
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r4, .L62+12
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L62+16
	add	r2, r2, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	mov	r1, #98304
	mov	r2, #11008
	add	r2, r2, #17
	mov	r3, #1
	ldr	r0, .L62+20
	sub	r1, r1, #247
	ldr	ip, .L62+24
	mov	lr, pc
	bx	ip
	ldr	r2, .L62+28
	ldr	r3, .L62+32
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	stopSound
	.word	hOff
	.word	winscreenTiles
	.word	DMANow
	.word	winscreenMap
	.word	winsound
	.word	playSoundA
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
	stmfd	sp!, {r3, r4, r5, lr}
	ldr	r3, .L65
	mov	lr, pc
	bx	r3
	mov	ip, #67108864
	mov	lr, #7680	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	r4, #0
	mov	lr, #256	@ movhi
	strh	lr, [ip, #0]	@ movhi
	strh	r4, [ip, #16]	@ movhi
	ldr	ip, .L65+4
	mov	r3, #6336
	str	r4, [ip, #0]
	mov	r0, #3
	ldr	r1, .L65+8
	mov	r2, #100663296
	add	r3, r3, #16
	ldr	r5, .L65+12
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L65+16
	add	r2, r2, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	mov	r1, #34560
	mov	r2, #11008
	add	r2, r2, #17
	mov	r3, r4
	ldr	r0, .L65+20
	sub	r1, r1, #89
	ldr	ip, .L65+24
	mov	lr, pc
	bx	ip
	ldr	r2, .L65+28
	ldr	r3, .L65+32
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L66:
	.align	2
.L65:
	.word	stopSound
	.word	hOff
	.word	losescreen2Tiles
	.word	DMANow
	.word	losescreen2Map
	.word	losesound
	.word	playSoundA
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
	ldr	r4, .L135
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
	beq	.L68
	ldr	r2, [r1, #304]
	mvn	r2, r2
	ands	r2, r2, #32
	beq	.L69
.L68:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	ldr	r3, [r4, #36]
	tst	r2, #16
	add	r3, r3, #1
	ldr	r2, .L135
	str	r3, [r4, #36]
	beq	.L117
	ldr	sl, .L135+4
	ldr	r9, .L135+8
.L70:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L71
	ldr	r1, [sl, #0]
	ldr	r2, [r9, #24]
	ldr	r3, [r4, #12]
	cmp	r2, #0
	rsb	r3, r3, r1
	mov	r2, #1
	str	r3, [sl, #0]
	str	r2, [r4, #32]
	ldr	r3, .L135+8
	bne	.L125
.L71:
	ldr	r3, [r4, #36]
	ldr	r2, .L135+12
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	add	r2, r2, r3
	rsb	r2, r1, r2, asr #4
	rsb	r2, r2, r2, asl #4
	cmp	r3, r2, asl #1
	ldr	r3, .L135
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
.L73:
	ldr	fp, .L135+16
	ldr	r2, [fp, #0]
	cmp	r2, #0
	beq	.L76
	ldr	r2, .L135+20
	ldr	r1, [r2, #0]
	cmp	r1, #3
	movgt	r1, #0
	addle	r1, r1, #1
	strgt	r1, [fp, #0]
	movgt	r1, #1
	str	r1, [r2, #0]
.L76:
	ldr	r2, [r4, #20]
	mov	r3, r3, asr #8
	rsb	r2, r2, #159
	cmp	r3, r2
	ldr	r1, .L135
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
	ldrgt	r2, .L135
	ldr	r8, .L135+24
	strgt	r3, [r2, #4]
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r4, #4]
	ldr	r3, [r8, #0]
	tst	r3, #2
	beq	.L83
	ldr	r3, .L135+28
	ldr	r3, [r3, #0]
	tst	r3, #2
	bne	.L83
	ldr	r3, [r4, #44]
	ldr	r2, [r4, #8]
	rsb	r1, r3, #0
	cmp	r2, r1
	ldr	r1, .L135
	bgt	.L126
.L83:
	ldr	r5, .L135+32
	ldr	r6, .L135+36
	ldr	r7, [r5, #0]
	ldr	r1, [r6, #0]
	mov	r0, r7
	ldr	r2, .L135+40
	mov	lr, pc
	bx	r2
	add	r7, r7, #1
	cmp	r1, #0
	str	r7, [r5, #0]
	beq	.L84
	ldr	r7, .L135+44
	ldr	r3, [r7, #28]
.L85:
	cmp	r3, #0
	ldr	r6, .L135+44
	mov	r5, #0
	bne	.L127
.L87:
	add	r5, r5, #1
	cmp	r5, #2
	add	r6, r6, #44
	beq	.L88
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L87
.L127:
	add	r1, r5, r5, asl #2
	add	r1, r5, r1, asl #1
	add	r1, r7, r1, asl #2
	mov	r0, r1
	str	r1, [sp, #12]
	ldr	ip, .L135+48
	mov	lr, pc
	bx	ip
	ldr	r2, .L135+52
	ldr	r2, [r2, #0]
	cmp	r2, #0
	str	r2, [sp, #4]
	ldr	r1, [sp, #12]
	bne	.L87
	ldr	r0, .L135
	ldr	r3, .L135+56
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L87
	mov	r1, #3536
	mov	r2, #11008
	add	r1, r1, #11
	add	r2, r2, #17
	ldr	r3, [sp, #4]
	ldr	r0, .L135+60
	ldr	ip, .L135+64
	mov	lr, pc
	bx	ip
	ldr	r1, .L135+68
	ldr	r3, [r1, #0]
	ldr	r2, [sp, #4]
	sub	r3, r3, #1
	str	r3, [r1, #0]
	mov	r3, #1
	str	r2, [r6, #24]
	str	r3, [fp, #0]
	b	.L87
.L117:
	ldr	sl, .L135+4
	ldr	r9, .L135+8
	ldr	r0, [sl, #0]
	ldr	r1, [r9, #24]
	ldr	r3, [r2, #12]
	cmp	r1, #0
	add	r3, r0, r3
	mov	r1, #0
	str	r1, [r2, #32]
	str	r3, [sl, #0]
	beq	.L70
	mvn	r3, #1
	str	r3, [r9, #12]
	mov	r0, r9
	ldr	r3, .L135+72
	mov	lr, pc
	bx	r3
	b	.L70
.L69:
	ldr	r1, .L135+76
	ldr	sl, .L135+4
	str	r2, [r1, #0]
	ldr	r9, .L135+8
	b	.L73
.L88:
	ldr	r3, [r8, #0]
	tst	r3, #1
	beq	.L123
	ldr	r3, .L135+28
	ldr	r3, [r3, #0]
	ands	r3, r3, #1
	bne	.L123
	ldr	r6, .L135+80
	mov	r1, r6
.L94:
	ldr	r2, [r1, #20]
	cmp	r2, #0
	beq	.L128
	add	r3, r3, #1
	cmp	r3, #5
	add	r1, r1, #28
	bne	.L94
.L90:
	ldr	r5, .L135+80
	mov	r4, #0
.L93:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	bne	.L129
.L95:
	add	r4, r4, #1
	cmp	r4, #5
	add	r5, r5, #28
	bne	.L93
	ldr	r3, [r8, #0]
	tst	r3, #4
	beq	.L97
	ldr	r3, .L135+28
	ldr	r3, [r3, #0]
	ands	r3, r3, #4
	bne	.L97
	ldr	r2, .L135+52
	ldr	r1, [r2, #0]
	cmp	r1, #0
	moveq	r3, #1
	streq	r3, [r2, #0]
	strne	r3, [r2, #0]
.L97:
	ldr	r4, .L135+84
	ldr	r6, .L135+88
	ldr	r5, [r4, #0]
	ldr	r1, [r6, #0]
	mov	r0, r5
	ldr	ip, .L135+40
	mov	lr, pc
	bx	ip
	add	r5, r5, #1
	cmp	r1, #0
	str	r5, [r4, #0]
	ldrne	r4, .L135+92
	bne	.L99
	ldr	r4, .L135+92
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L100
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L130
.L101:
	ldr	r3, .L135+96
	ldr	r0, .L135+92
	ldr	r1, .L135
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L131
.L103:
	ldr	r3, .L135+100
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ble	.L132
.L104:
	ldr	r3, [r9, #24]
	cmp	r3, #0
	bne	.L108
.L106:
	ldr	r3, [sl, #0]
	ldr	r2, .L135+68
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
	ble	.L133
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L129:
	rsb	fp, r4, r4, asl #3
	add	fp, r6, fp, asl #2
	mov	r0, fp
	ldr	ip, .L135+104
	mov	lr, pc
	bx	ip
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L134
.L96:
	ldr	r3, [r7, #68]
	cmp	r3, #0
	beq	.L95
	mov	r0, fp
	ldr	r1, .L135+108
	ldr	r3, .L135+112
	mov	lr, pc
	bx	r3
	b	.L95
.L123:
	ldr	r6, .L135+80
	b	.L90
.L130:
	mov	r3, #1
.L100:
	add	r3, r3, r3, asl #1
	add	r3, r4, r3, asl #3
	mov	r2, #1
	str	r2, [r3, #20]
	mov	r2, #240
	str	r2, [r3, #4]
	ldr	r3, .L135+116
	mov	lr, pc
	bx	r3
	ldr	r2, .L135+120
	smull	r1, r2, r0, r2
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
	ldr	r3, .L135+96
	ldr	r0, .L135+124
	ldr	r1, .L135
	mov	lr, pc
	bx	r3
	ldr	r3, .L135+100
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bgt	.L104
.L132:
	ldr	r3, [r9, #24]
	cmp	r3, #0
	ldreq	r3, .L135+8
	moveq	r2, #1
	streq	r2, [r3, #24]
.L108:
	ldr	r0, .L135+8
	ldr	r1, .L135
	ldr	r3, .L135+128
	mov	lr, pc
	bx	r3
	b	.L106
.L84:
	ldr	r7, .L135+44
	ldr	r3, [r7, #28]
	cmp	r3, #0
	beq	.L86
	ldr	r2, [r7, #72]
	cmp	r2, #0
	bne	.L85
	mov	r3, #1
.L86:
	add	r2, r3, r3, asl #2
	add	r3, r3, r2, asl #1
	add	r3, r7, r3, asl #2
	mov	r2, #1
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	mov	r2, #220
	str	r2, [r3, #4]
	ldr	r3, .L135+116
	mov	lr, pc
	bx	r3
	ldr	r2, .L135+132
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, asl #2
	rsb	r3, r3, r3, asl #4
	sub	r3, r0, r3, asl #2
	add	r3, r3, #87
	str	r3, [r6, #0]
	ldr	r3, [r7, #28]
	b	.L85
.L134:
	mov	r0, fp
	ldr	r1, .L135+44
	ldr	r2, .L135+112
	mov	lr, pc
	bx	r2
	b	.L96
.L126:
	cmp	r2, r3
	ldrlt	r3, [r1, #48]
	rsblt	r3, r3, #0
	strlt	r3, [r1, #8]
	b	.L83
.L133:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	goToLose
.L125:
	mov	r2, #2
	mov	r0, r3
	str	r2, [r3, #12]
	ldr	r3, .L135+72
	mov	lr, pc
	bx	r3
	b	.L71
.L128:
	ldr	r0, [r4, #20]
	ldr	lr, [r4, #0]
	ldr	r1, [r4, #16]
	ldr	r5, [r4, #32]
	ldr	ip, [r4, #4]
	rsb	r3, r3, r3, asl #3
	mov	lr, lr, asr #8
	add	r4, r1, r1, lsr #31
	add	r0, r0, r0, lsr #31
	cmp	r5, #1
	add	r1, r6, r3, asl #2
	add	r0, lr, r0, asr #1
	add	ip, ip, r4, asr #1
	moveq	r2, #1
	mov	lr, #1
	str	lr, [r1, #20]
	str	r0, [r6, r3, asl #2]
	str	ip, [r1, #4]
	str	r2, [r1, #24]
	b	.L90
.L136:
	.align	2
.L135:
	.word	p
	.word	hOff
	.word	fridge
	.word	-2004318071
	.word	hurt
	.word	hurtCount
	.word	oldButtons
	.word	buttons
	.word	time
	.word	timeToNextCat
	.word	__aeabi_idivmod
	.word	cats
	.word	updateCat
	.word	chocolateMilk
	.word	collisionEnemyPlayer
	.word	milkspill
	.word	playSoundB
	.word	lives
	.word	updateFridge
	.word	currFrame
	.word	bullets
	.word	timetwo
	.word	timeToNextHealth
	.word	hearts
	.word	updateHealth
	.word	catsRemaining
	.word	updateBullet
	.word	cats+44
	.word	collisionCheckEnemy
	.word	rand
	.word	274877907
	.word	hearts+24
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
	ldr	r2, .L168
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r3, .L168+4
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	ldr	r1, [r2, #4]
	ldr	ip, [r3, #0]
	mvn	r0, r0, asl #17
	ldr	r3, .L168+8
	mvn	r1, r1, asl #18
	mvn	r0, r0, lsr #17
	mvn	r1, r1, lsr #18
	cmp	ip, #0
	strh	r0, [r3, #0]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	beq	.L138
	ldr	r1, [r2, #32]
	ldr	r2, [r2, #28]
	add	r2, r2, r1, asl #6
	mov	r2, r2, asl #2
	orr	r2, r2, #4096
	strh	r2, [r3, #4]	@ movhi
.L139:
	ldr	r2, .L168+12
	ldr	r1, [r2, #28]
	cmp	r1, #0
	moveq	r0, #512	@ movhi
	streqh	r0, [r3, #8]	@ movhi
	beq	.L142
	ldr	r0, [r2, #24]
	ldrb	r1, [r2, #0]	@ zero_extendqisi2
	cmp	r0, #0
	orr	r1, r1, #16384
	ldr	r0, .L168+8
	strh	r1, [r3, #8]	@ movhi
	bne	.L143
	ldr	r1, [r2, #4]
	orr	r1, r1, #-16777216
	orr	r1, r1, #16711680
	orr	r1, r1, #53248
	strh	r1, [r0, #10]	@ movhi
.L145:
	ldr	r1, [r2, #32]
	add	r1, r1, #64
	mov	r1, r1, asl #3
	strh	r1, [r3, #12]	@ movhi
.L142:
	ldr	r1, [r2, #72]
	cmp	r1, #0
	ldr	r1, .L168+12
	bne	.L146
	mov	r1, #512	@ movhi
	strh	r1, [r3, #16]	@ movhi
.L150:
	ldr	r2, .L168+16
	ldr	r1, .L168+8
	add	ip, r2, #140
.L147:
	ldr	r0, [r2, #0]
	cmp	r0, #0
	ldrne	r0, [r2, #-16]
	ldrneb	lr, [r2, #-20]	@ zero_extendqisi2
	orrne	r0, r0, #16384
	movne	r6, #640	@ movhi
	moveq	r0, #512	@ movhi
	add	r2, r2, #28
	strneh	lr, [r1, #88]	@ movhi
	strneh	r0, [r1, #90]	@ movhi
	strneh	r6, [r1, #92]	@ movhi
	streqh	r0, [r1, #88]	@ movhi
	cmp	r2, ip
	add	r1, r1, #8
	bne	.L147
	ldr	r2, .L168+20
	ldr	r1, .L168+24
	ldr	ip, [r2, #20]
	mvn	r0, #32512
	ldr	lr, [r1, #0]
	mov	r1, r0
	sub	r1, r1, #245
	cmp	ip, #0
	strh	r1, [r3, #34]	@ movhi
	ldrne	r1, [r2, #4]
	ldr	ip, .L168+8
	sub	r0, r0, #250
	ldrneh	r6, [r2, #0]
	ldr	r2, [r2, #44]
	moveq	r1, #512	@ movhi
	orrne	r1, r1, #16384
	strh	r0, [r3, #32]	@ movhi
	movne	r0, #712	@ movhi
	streqh	r1, [ip, #56]	@ movhi
	strneh	r1, [ip, #58]	@ movhi
	strneh	r6, [ip, #56]	@ movhi
	strneh	r0, [ip, #60]	@ movhi
	cmp	r2, #0
	ldr	r2, .L168+20
	ldrne	r1, [r2, #28]
	ldrneh	r2, [r2, #24]
	strneh	r2, [r3, #64]	@ movhi
	movne	r2, #712	@ movhi
	strneh	r2, [r3, #68]	@ movhi
	ldr	r2, .L168+28
	moveq	r1, #512	@ movhi
	orrne	r1, r1, #16384
	streqh	r1, [r3, #64]	@ movhi
	strneh	r1, [r3, #66]	@ movhi
	ldr	r1, [r2, #24]
	add	lr, lr, #320
	mov	lr, lr, asl #1
	cmp	r1, #0
	strh	lr, [r3, #36]	@ movhi
	beq	.L158
	ldr	r1, [r2, #4]
	ldr	ip, [r2, #0]
	add	r2, r1, #32
	mvn	r0, r1, asl #18
	mvn	r2, r2, asl #18
	add	r1, ip, #64
	mvn	r0, r0, lsr #18
	mvn	r2, r2, lsr #18
	mov	r0, r0, asl #16
	mov	r2, r2, asl #16
	and	r1, r1, #255
	mov	r0, r0, lsr #16
	mov	r2, r2, lsr #16
	orr	r1, r1, #32768
	and	ip, ip, #255
	orr	ip, ip, #32768
	strh	r0, [r3, #130]	@ movhi
	strh	r2, [r3, #138]	@ movhi
	strh	r1, [r3, #144]	@ movhi
	strh	r0, [r3, #146]	@ movhi
	strh	r1, [r3, #152]	@ movhi
	strh	r2, [r3, #154]	@ movhi
	mov	r6, #12	@ movhi
	mov	r0, #16	@ movhi
	mov	r1, #268	@ movhi
	mov	r2, #272	@ movhi
	strh	ip, [r3, #128]	@ movhi
	strh	ip, [r3, #136]	@ movhi
	strh	r6, [r3, #132]	@ movhi
	strh	r0, [r3, #140]	@ movhi
	strh	r1, [r3, #148]	@ movhi
	strh	r2, [r3, #156]	@ movhi
.L158:
	ldr	r2, .L168+32
	mov	r1, #0
	ldr	r5, .L168+36
	ldr	r4, [r2, #0]
	mov	ip, r1
	mov	r0, r1
	mov	r2, r1
.L161:
	cmp	r2, r4
	addge	lr, r3, ip
	movge	r6, #512	@ movhi
	strgeh	r6, [lr, #160]	@ movhi
	bge	.L160
	add	lr, r0, r5
	ldr	r6, [lr, #4]
	add	r6, r1, r6
	add	lr, r3, ip
	orr	r6, r6, #16384
	ldrb	r7, [r5, r0]	@ zero_extendqisi2
	strh	r6, [lr, #162]	@ movhi
	mov	r6, #716	@ movhi
	strh	r7, [lr, #160]	@ movhi
	strh	r6, [lr, #164]	@ movhi
.L160:
	sub	r1, r1, #18
	add	r2, r2, #1
	mov	r1, r1, asl #16
	cmp	r2, #5
	add	r0, r0, #24
	add	ip, ip, #8
	mov	r1, r1, lsr #16
	bne	.L161
	cmp	r4, #0
	ldrge	r2, .L168+40
	ldrlt	r1, .L168+40
	rsbge	r4, r4, #5
	strlt	r2, [r1, #0]
	strge	r4, [r2, #0]
	ldr	r1, .L168+44
	ldr	r2, .L168+48
	addge	lr, r4, r4, asl #3
	movge	lr, lr, asl #17
	ldr	r5, [r2, #4]
	ldrb	ip, [r1, #0]	@ zero_extendqisi2
	ldr	r0, [r1, #4]
	movge	lr, lr, lsr #16
	movlt	lr, #90
	ldrb	r4, [r2, #0]	@ zero_extendqisi2
	add	lr, lr, r5
	mvn	ip, ip, asl #17
	mvn	r0, r0, asl #17
	mov	r1, #712
	mov	r2, #652
	orr	lr, lr, #16384
	add	r1, r1, #2
	mvn	ip, ip, lsr #17
	mvn	r0, r0, lsr #17
	add	r2, r2, #2
	strh	r4, [r3, #200]	@ movhi
	strh	lr, [r3, #202]	@ movhi
	strh	r1, [r3, #204]	@ movhi
	strh	ip, [r3, #208]	@ movhi
	strh	r0, [r3, #210]	@ movhi
	strh	r2, [r3, #212]	@ movhi
	ldr	r3, .L168+52
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L168+8
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L168+56
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L138:
	ldr	r1, .L168+60
	ldr	r1, [r1, #0]
	cmp	r1, #0
	beq	.L140
	ldr	r1, [r2, #32]
	ldr	r2, [r2, #28]
	add	r2, r2, r1, asl #6
	mov	r2, r2, asl #2
	orr	r2, r2, #8192
	strh	r2, [r3, #4]	@ movhi
	b	.L139
.L146:
	ldr	ip, [r1, #68]
	ldrb	r0, [r1, #44]	@ zero_extendqisi2
	cmp	ip, #0
	orr	r0, r0, #16384
	ldr	ip, .L168+8
	strh	r0, [r3, #16]	@ movhi
	bne	.L148
	ldr	r1, [r1, #48]
	orr	r1, r1, #-16777216
	orr	r1, r1, #16711680
	orr	r1, r1, #53248
	strh	r1, [ip, #18]	@ movhi
.L151:
	ldr	r2, [r2, #76]
	add	r2, r2, #64
	mov	r2, r2, asl #3
	strh	r2, [r3, #20]	@ movhi
	b	.L150
.L148:
	ldr	r1, [r1, #48]
	mvn	r1, r1, asl #18
	mvn	r1, r1, lsr #18
	strh	r1, [ip, #18]	@ movhi
	b	.L151
.L140:
	ldr	r1, [r2, #32]
	ldr	r2, [r2, #28]
	add	r2, r2, r1, asl #6
	mov	r2, r2, asl #2
	strh	r2, [r3, #4]	@ movhi
	b	.L139
.L143:
	ldr	r1, [r2, #4]
	mvn	r1, r1, asl #18
	mvn	r1, r1, lsr #18
	strh	r1, [r0, #10]	@ movhi
	b	.L145
.L169:
	.align	2
.L168:
	.word	p
	.word	chocolateMilk
	.word	shadowOAM
	.word	cats
	.word	bullets+20
	.word	hearts
	.word	lives
	.word	fridge
	.word	catsRemaining
	.word	barcats
	.word	move
	.word	barfridge
	.word	barplayer
	.word	waitForVblank
	.word	DMANow
	.word	hurt
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
	bl	draw
	ldr	r3, .L173
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L170
	ldr	r3, .L173+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L172
.L170:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L172:
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L174:
	.align	2
.L173:
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
	ldr	r3, .L178
	add	r2, r3, #1016
.L176:
	mov	r1, #512	@ movhi
	strh	r1, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L176
	bx	lr
.L179:
	.align	2
.L178:
	.word	shadowOAM
	.size	hideSprites, .-hideSprites
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
	.comm	oldButtons,4,4
	.comm	buttons,4,4
	.comm	shadowOAM,1024,4
	.comm	p,60,4
	.comm	c,44,4
	.comm	cats,88,4
	.comm	timeToNextCat,4,4
	.comm	timeToNextHealth,4,4
	.comm	health,24,4
	.comm	hearts,48,4
	.comm	fridge,28,4
	.comm	chocolateMilk,4,4
	.comm	counter,4,4
	.comm	barplayer,24,4
	.comm	barcat,24,4
	.comm	barcats,120,4
	.comm	barfridge,24,4
	.comm	bullet,28,4
	.comm	bullets,140,4
	.comm	state,4,4
	.comm	currFrame,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
