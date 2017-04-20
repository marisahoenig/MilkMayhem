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
	mov	r3, #3280
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
	ldr	r3, .L8
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L5
	ldr	r3, .L8+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L7
.L5:
	mov	r3, #6336
	mov	r0, #3
	ldr	r1, .L8+8
	mov	r2, #100663296
	add	r3, r3, #16
	ldr	r4, .L8+12
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L8+16
	add	r2, r2, #61440
	mov	r3, #1024
	mov	lr, pc
	bx	r4
	ldmfd	sp!, {r4, lr}
	bx	lr
.L7:
	bl	goToSplash
	b	.L5
.L9:
	.align	2
.L8:
	.word	oldButtons
	.word	buttons
	.word	losescreen2Tiles
	.word	DMANow
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
	ldr	r3, .L12
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L12+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToSplash
.L13:
	.align	2
.L12:
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
	ldr	r0, .L16
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, .L16+4
	mov	lr, pc
	bx	r3
	bl	goToSplash
	ldr	r7, .L16+8
	ldr	r5, .L16+12
	ldr	r6, .L16+16
.L15:
	ldr	r2, [r5, #0]
	ldr	r3, [r4, #304]
	str	r2, [r7, #0]
	str	r3, [r5, #0]
	ldr	ip, [r6, #0]
	mov	lr, pc
	bx	ip
	b	.L15
.L17:
	.align	2
.L16:
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
	ldr	r1, .L19
	mov	r2, #100663296
	mov	r3, #7104
	ldr	r4, .L19+4
	strh	lr, [ip, #20]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #63488
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L19+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L19+12
	ldr	r3, .L19+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L20:
	.align	2
.L19:
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
	ldr	r3, .L23
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L23+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToInstructions
.L24:
	.align	2
.L23:
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
	ldr	r1, .L26
	mov	r2, #100663296
	mov	r3, #4864
	ldr	r4, .L26+4
	strh	lr, [ip, #20]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #59392
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L26+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L26+12
	ldr	r3, .L26+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L27:
	.align	2
.L26:
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
	ldr	r4, .L33
	ldr	r3, [r4, #0]
	tst	r3, #32
	beq	.L29
	ldr	r2, .L33+4
	ldr	r2, [r2, #0]
	tst	r2, #32
	beq	.L31
.L29:
	tst	r3, #16
	beq	.L28
	ldr	r3, .L33+4
	ldr	r3, [r3, #0]
	tst	r3, #16
	beq	.L32
.L28:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L32:
	ldmfd	sp!, {r4, lr}
	b	goToControls
.L31:
	bl	goToSplash
	ldr	r3, [r4, #0]
	b	.L29
.L34:
	.align	2
.L33:
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
	ldr	r1, .L42
	add	r2, r2, #512
	mov	r3, #256
	ldr	r4, .L42+4
	strh	r7, [ip, #0]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #65536
	mov	r3, #16384
	mov	r0, #3
	ldr	r1, .L42+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L42+12
	add	r2, r3, #1016
.L36:
	mov	r9, #512	@ movhi
	strh	r9, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L36
	ldr	r3, .L42+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L42+20
	mov	lr, pc
	bx	r3
	ldr	ip, .L42+24
	mov	r3, #120
	mov	r5, #0
	mov	sl, #1
	str	r3, [ip, #0]
	mov	r3, #230
	stmib	ip, {r3, r5, sl}	@ phole stm
	mov	r4, ip
	ldr	r6, .L42+28
	ldmia	r4!, {r0, r1, r2, r3}
	ldr	r7, .L42+32
	mov	r9, #23040
	mov	r8, #32
	mov	fp, #64
	stmia	r7!, {r0, r1, r2, r3}
	str	r9, [r6, #0]
	mov	r9, #112
	str	fp, [ip, #16]
	str	r8, [ip, #20]
	str	r5, [ip, #24]
	str	r5, [ip, #28]
	str	r9, [r6, #4]
	mov	r9, #2
	str	r9, [r6, #12]
	mov	r9, #10
	ldmia	r4!, {r0, r1, r2, r3}
	str	r9, [r6, #44]
	mov	r9, #1280
	str	r9, [r6, #48]
	mov	r9, #40
	str	sl, [r6, #40]
	str	r5, [r6, #8]
	str	r8, [r6, #16]
	str	fp, [r6, #20]
	str	r5, [r6, #24]
	str	r5, [r6, #28]
	str	r5, [r6, #32]
	str	r5, [r6, #36]
	str	r9, [r6, #52]
	stmia	r7!, {r0, r1, r2, r3}
	str	r5, [ip, #36]
	str	r5, [ip, #32]
	str	r5, [ip, #40]
	ldmia	r4, {r0, r1, r2}
	stmia	r7, {r0, r1, r2}
	ldr	r7, .L42+32
	ldmia	ip!, {r0, r1, r2, r3}
	add	r6, r7, #44
	stmia	r6!, {r0, r1, r2, r3}
	ldmia	ip!, {r0, r1, r2, r3}
	stmia	r6!, {r0, r1, r2, r3}
	ldr	ip, .L42+36
	ldmia	r4, {r0, r1, r2}
	mov	r3, #140
	stmia	r6, {r0, r1, r2}
	mov	r4, #16
	str	r3, [ip, #0]
	mov	r3, #240
	stmib	ip, {r3, sl}	@ phole stm
	str	r4, [ip, #12]
	ldr	r6, .L42+40
	mov	r7, ip
	ldmia	r7!, {r0, r1, r2, r3}
	mov	r9, r6
	stmia	r9!, {r0, r1, r2, r3}
	str	r4, [ip, #16]
	str	r5, [ip, #20]
	ldmia	r7, {r0, r1}
	stmia	r9, {r0, r1}
	ldmia	ip!, {r0, r1, r2, r3}
	add	r6, r6, #24
	stmia	r6!, {r0, r1, r2, r3}
	ldr	r3, .L42+44
	ldmia	r7, {r0, r1}
	ldr	ip, .L42+48
	mov	sl, #2
	mov	r2, #208
	str	r8, [r3, #0]
	str	r2, [r3, #4]
	stmia	r6, {r0, r1}
	str	r5, [r3, #8]
	str	sl, [r3, #12]
	str	r8, [r3, #16]
	str	fp, [r3, #20]
	str	r5, [r3, #24]
	mov	r3, #145
	ldr	r7, .L42+52
	stmia	ip, {r3, r5, sl}	@ phole stm
	str	r4, [ip, #12]
	str	r4, [ip, #16]
	str	r5, [ip, #20]
	str	r5, [ip, #24]
.L37:
	mov	r6, ip
	ldmia	r6!, {r0, r1, r2, r3}
	add	r4, r7, r5
	stmia	r4!, {r0, r1, r2, r3}
	add	r5, r5, #28
	ldmia	r6, {r0, r1, r2}
	cmp	r5, #140
	stmia	r4, {r0, r1, r2}
	bne	.L37
	ldr	r1, .L42+56
	mov	r2, #16
	ldr	ip, .L42+60
	mov	r0, #1
	mov	r4, #14
	mov	r5, #112
	ldr	r3, .L42+64
	str	r5, [r1, #4]
	str	r2, [r1, #12]
	str	r2, [r1, #16]
	str	r4, [r1, #0]
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
	str	r4, [ip, #0]
	str	r0, [ip, #20]
	str	r1, [r3, #4]
	str	r2, [r3, #16]
	str	r0, [r3, #20]
	ldr	r7, .L42+68
	mov	r5, #0
.L38:
	mov	r6, ip
	ldmia	r6!, {r0, r1, r2, r3}
	add	r4, r7, r5
	stmia	r4!, {r0, r1, r2, r3}
	add	r5, r5, #24
	ldmia	r6, {r0, r1}
	cmp	r5, #120
	stmia	r4, {r0, r1}
	bne	.L38
	ldr	r2, .L42+72
	mov	r3, #0
	str	r3, [r2, #0]
	ldr	r2, .L42+76
	str	r3, [r2, #0]
	ldr	r2, .L42+80
	mov	r1, #3
	str	r1, [r2, #0]
	ldr	r2, .L42+84
	mov	r1, #5
	str	r1, [r2, #0]
	ldr	r2, .L42+88
	str	r3, [r2, #0]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L43:
	.align	2
.L42:
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
	.word	barplayer
	.word	barcat
	.word	barfridge
	.word	barcats
	.word	chocolateMilk
	.word	hOff
	.word	lives
	.word	catsRemaining
	.word	hurt
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
	ldr	r5, .L45
	strh	ip, [r4, #10]	@ movhi
	mov	r0, #3
	ldr	r1, .L45+4
	add	r2, r6, #16384
	add	r3, r3, #48
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L45+8
	add	r2, r6, #53248
	mov	r3, #4096
	mov	lr, pc
	bx	r5
	mov	ip, #6400	@ movhi
	strh	ip, [r4, #8]	@ movhi
	mov	r0, #3
	ldr	r1, .L45+12
	mov	r2, r6
	mov	r3, #1120
	mov	lr, pc
	bx	r5
	mov	r0, #3
	ldr	r1, .L45+16
	add	r2, r6, #51200
	mov	r3, #1024
	mov	lr, pc
	bx	r5
	ldr	r3, .L45+20
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
	ldr	r0, .L45+24
	strh	ip, [r4, #16]	@ movhi
	sub	r1, r1, #223
	ldr	ip, .L45+28
	mov	lr, pc
	bx	ip
	ldr	r2, .L45+32
	ldr	r3, .L45+36
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L46:
	.align	2
.L45:
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
	ldr	r4, .L52
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L48
	ldr	r2, .L52+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L50
.L48:
	tst	r3, #4
	beq	.L47
	ldr	r3, .L52+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L51
.L47:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L51:
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L50:
	bl	goToGame
	ldr	r3, [r4, #0]
	b	.L48
.L53:
	.align	2
.L52:
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
	ldr	r4, .L59
	ldr	r3, [r4, #0]
	tst	r3, #32
	beq	.L55
	ldr	r2, .L59+4
	ldr	r2, [r2, #0]
	tst	r2, #32
	beq	.L57
.L55:
	tst	r3, #8
	beq	.L54
	ldr	r3, .L59+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L58
.L54:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L58:
	bl	initGame
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L57:
	bl	goToInstructions
	ldr	r3, [r4, #0]
	b	.L55
.L60:
	.align	2
.L59:
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
	ldr	r1, .L62
	add	r2, r5, #16384
	mov	r3, #1568
	ldr	r4, .L62+4
	strh	lr, [ip, #20]	@ movhi
	mov	lr, pc
	bx	r4
	add	r2, r5, #61440
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L62+8
	mov	lr, pc
	bx	r4
	ldr	r2, .L62+12
	ldr	r3, .L62+16
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L63:
	.align	2
.L62:
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
	ldr	ip, .L65
	mov	r3, #7232
	mov	r0, #3
	ldr	r1, .L65+4
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r4, .L65+8
	str	lr, [ip, #0]
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #61440
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L65+12
	mov	lr, pc
	bx	r4
	ldr	r2, .L65+16
	ldr	r3, .L65+20
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L66:
	.align	2
.L65:
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
	stmfd	sp!, {r3, r4, r5, lr}
	mov	ip, #67108864
	mov	r5, #7680	@ movhi
	mov	lr, #0
	strh	r5, [ip, #8]	@ movhi
	mov	r5, #256	@ movhi
	strh	r5, [ip, #0]	@ movhi
	strh	lr, [ip, #16]	@ movhi
	ldr	ip, .L68
	mov	r3, #6336
	mov	r0, #3
	ldr	r1, .L68+4
	mov	r2, #100663296
	add	r3, r3, #16
	ldr	r4, .L68+8
	str	lr, [ip, #0]
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #61440
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L68+12
	mov	lr, pc
	bx	r4
	ldr	r2, .L68+16
	ldr	r3, .L68+20
	str	r2, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
	bx	lr
.L69:
	.align	2
.L68:
	.word	hOff
	.word	losescreen2Tiles
	.word	DMANow
	.word	losescreen2Map
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
	ldr	r4, .L138
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
	beq	.L71
	ldr	r2, [r1, #304]
	mvn	r2, r2
	ands	r2, r2, #32
	beq	.L72
.L71:
	mov	r2, #67108864
	ldr	r2, [r2, #304]
	ldr	r3, [r4, #36]
	tst	r2, #16
	add	r3, r3, #1
	ldr	r2, .L138
	str	r3, [r4, #36]
	beq	.L120
	ldr	sl, .L138+4
	ldr	r9, .L138+8
.L73:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #32
	bne	.L74
	ldr	r1, [sl, #0]
	ldr	r2, [r9, #24]
	ldr	r3, [r4, #12]
	cmp	r2, #0
	rsb	r3, r3, r1
	mov	r2, #1
	str	r3, [sl, #0]
	str	r2, [r4, #32]
	ldr	r3, .L138+8
	bne	.L128
.L74:
	ldr	r3, [r4, #36]
	ldr	r2, .L138+12
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	add	r2, r2, r3
	rsb	r2, r1, r2, asr #4
	rsb	r2, r2, r2, asl #4
	cmp	r3, r2, asl #1
	ldr	r3, .L138
	bne	.L125
	ldr	r2, [r3, #28]
	cmp	r2, #1
	addle	r2, r2, #1
	strle	r2, [r3, #28]
	ble	.L125
	cmp	r2, #2
	moveq	r2, #1
	streq	r2, [r3, #28]
.L125:
	ldr	r3, [r3, #0]
.L76:
	ldr	fp, .L138+16
	ldr	r2, [fp, #0]
	cmp	r2, #0
	beq	.L79
	ldr	r2, .L138+20
	ldr	r1, [r2, #0]
	cmp	r1, #3
	movgt	r1, #0
	addle	r1, r1, #1
	strgt	r1, [fp, #0]
	movgt	r1, #1
	str	r1, [r2, #0]
.L79:
	ldr	r2, [r4, #20]
	mov	r3, r3, asr #8
	rsb	r2, r2, #159
	cmp	r3, r2
	ldr	r1, .L138
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
	ldrgt	r2, .L138
	ldr	r8, .L138+24
	strgt	r3, [r2, #4]
	cmp	r3, #0
	movlt	r3, #0
	strlt	r3, [r4, #4]
	ldr	r3, [r8, #0]
	tst	r3, #2
	beq	.L86
	ldr	r3, .L138+28
	ldr	r3, [r3, #0]
	tst	r3, #2
	bne	.L86
	ldr	r3, [r4, #44]
	ldr	r2, [r4, #8]
	rsb	r1, r3, #0
	cmp	r2, r1
	ldr	r1, .L138
	bgt	.L129
.L86:
	ldr	r5, .L138+32
	ldr	r6, .L138+36
	ldr	r7, [r5, #0]
	ldr	r1, [r6, #0]
	mov	r0, r7
	ldr	r2, .L138+40
	mov	lr, pc
	bx	r2
	add	r7, r7, #1
	cmp	r1, #0
	str	r7, [r5, #0]
	beq	.L87
	ldr	r7, .L138+44
	ldr	r3, [r7, #28]
.L88:
	cmp	r3, #0
	ldr	r6, .L138+44
	mov	r5, #0
	bne	.L130
.L90:
	add	r5, r5, #1
	cmp	r5, #2
	add	r6, r6, #44
	beq	.L91
	ldr	r3, [r6, #28]
	cmp	r3, #0
	beq	.L90
.L130:
	add	r1, r5, r5, asl #2
	add	r1, r5, r1, asl #1
	add	r1, r7, r1, asl #2
	mov	r0, r1
	str	r1, [sp, #12]
	ldr	ip, .L138+48
	mov	lr, pc
	bx	ip
	ldr	r2, .L138+52
	ldr	r2, [r2, #0]
	cmp	r2, #0
	str	r2, [sp, #4]
	ldr	r1, [sp, #12]
	bne	.L90
	ldr	r0, .L138
	ldr	r3, .L138+56
	mov	lr, pc
	bx	r3
	cmp	r0, #0
	beq	.L90
	mov	r1, #4864
	mov	r2, #11008
	add	r1, r1, #10
	add	r2, r2, #17
	ldr	r3, [sp, #4]
	ldr	r0, .L138+60
	ldr	ip, .L138+64
	mov	lr, pc
	bx	ip
	ldr	r1, .L138+68
	ldr	r3, [r1, #0]
	ldr	r2, [sp, #4]
	sub	r3, r3, #1
	str	r3, [r1, #0]
	mov	r3, #1
	str	r2, [r6, #24]
	str	r3, [fp, #0]
	b	.L90
.L120:
	ldr	sl, .L138+4
	ldr	r9, .L138+8
	ldr	r0, [sl, #0]
	ldr	r1, [r9, #24]
	ldr	r3, [r2, #12]
	cmp	r1, #0
	add	r3, r0, r3
	mov	r1, #0
	str	r1, [r2, #32]
	str	r3, [sl, #0]
	beq	.L73
	mvn	r3, #1
	str	r3, [r9, #12]
	mov	r0, r9
	ldr	r3, .L138+72
	mov	lr, pc
	bx	r3
	b	.L73
.L72:
	ldr	r1, .L138+76
	ldr	sl, .L138+4
	str	r2, [r1, #0]
	ldr	r9, .L138+8
	b	.L76
.L91:
	ldr	r3, [r8, #0]
	tst	r3, #1
	beq	.L126
	ldr	r3, .L138+28
	ldr	r3, [r3, #0]
	ands	r3, r3, #1
	bne	.L126
	ldr	r6, .L138+80
	mov	r1, r6
.L97:
	ldr	r2, [r1, #20]
	cmp	r2, #0
	beq	.L131
	add	r3, r3, #1
	cmp	r3, #5
	add	r1, r1, #28
	bne	.L97
.L93:
	ldr	r5, .L138+80
	mov	r4, #0
.L96:
	ldr	r3, [r5, #20]
	cmp	r3, #0
	bne	.L132
.L98:
	add	r4, r4, #1
	cmp	r4, #5
	add	r5, r5, #28
	bne	.L96
	ldr	r3, [r8, #0]
	tst	r3, #4
	beq	.L100
	ldr	r3, .L138+28
	ldr	r3, [r3, #0]
	ands	r3, r3, #4
	bne	.L100
	ldr	r2, .L138+52
	ldr	r1, [r2, #0]
	cmp	r1, #0
	moveq	r3, #1
	streq	r3, [r2, #0]
	strne	r3, [r2, #0]
.L100:
	ldr	r4, .L138+84
	ldr	r6, .L138+88
	ldr	r5, [r4, #0]
	ldr	r1, [r6, #0]
	mov	r0, r5
	ldr	ip, .L138+40
	mov	lr, pc
	bx	ip
	add	r5, r5, #1
	cmp	r1, #0
	str	r5, [r4, #0]
	ldrne	r4, .L138+92
	bne	.L102
	ldr	r4, .L138+92
	ldr	r3, [r4, #20]
	cmp	r3, #0
	beq	.L103
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L133
.L104:
	ldr	r3, .L138+96
	ldr	r0, .L138+92
	ldr	r1, .L138
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #44]
	cmp	r3, #0
	bne	.L134
.L106:
	ldr	r3, .L138+100
	ldr	r3, [r3, #0]
	cmp	r3, #0
	ble	.L135
.L107:
	ldr	r3, [r9, #24]
	cmp	r3, #0
	bne	.L111
.L109:
	ldr	r3, [sl, #0]
	ldr	r2, .L138+68
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
	ble	.L136
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L132:
	rsb	fp, r4, r4, asl #3
	add	fp, r6, fp, asl #2
	mov	r0, fp
	ldr	ip, .L138+104
	mov	lr, pc
	bx	ip
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L137
.L99:
	ldr	r3, [r7, #68]
	cmp	r3, #0
	beq	.L98
	mov	r0, fp
	ldr	r1, .L138+108
	ldr	r3, .L138+112
	mov	lr, pc
	bx	r3
	b	.L98
.L126:
	ldr	r6, .L138+80
	b	.L93
.L133:
	mov	r3, #1
.L103:
	add	r3, r3, r3, asl #1
	add	r3, r4, r3, asl #3
	mov	r2, #1
	str	r2, [r3, #20]
	mov	r2, #240
	str	r2, [r3, #4]
	ldr	r3, .L138+116
	mov	lr, pc
	bx	r3
	ldr	r2, .L138+120
	smull	r1, r2, r0, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #6
	rsb	r2, r3, r3, asl #5
	add	r3, r3, r2, asl #2
	sub	r3, r0, r3, asl #3
	add	r3, r3, #87
	str	r3, [r6, #0]
.L102:
	ldr	r3, [r4, #20]
	cmp	r3, #0
	bne	.L104
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L106
.L134:
	ldr	r3, .L138+96
	ldr	r0, .L138+124
	ldr	r1, .L138
	mov	lr, pc
	bx	r3
	ldr	r3, .L138+100
	ldr	r3, [r3, #0]
	cmp	r3, #0
	bgt	.L107
.L135:
	ldr	r3, [r9, #24]
	cmp	r3, #0
	ldreq	r3, .L138+8
	moveq	r2, #1
	streq	r2, [r3, #24]
.L111:
	ldr	r0, .L138+8
	ldr	r1, .L138
	ldr	r3, .L138+128
	mov	lr, pc
	bx	r3
	b	.L109
.L87:
	ldr	r7, .L138+44
	ldr	r3, [r7, #28]
	cmp	r3, #0
	beq	.L89
	ldr	r2, [r7, #72]
	cmp	r2, #0
	bne	.L88
	mov	r3, #1
.L89:
	add	r2, r3, r3, asl #2
	add	r3, r3, r2, asl #1
	add	r3, r7, r3, asl #2
	mov	r2, #1
	str	r2, [r3, #24]
	str	r2, [r3, #28]
	mov	r2, #220
	str	r2, [r3, #4]
	ldr	r3, .L138+116
	mov	lr, pc
	bx	r3
	ldr	r2, .L138+132
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, asl #2
	rsb	r3, r3, r3, asl #4
	sub	r3, r0, r3, asl #2
	add	r3, r3, #87
	str	r3, [r6, #0]
	ldr	r3, [r7, #28]
	b	.L88
.L137:
	mov	r0, fp
	ldr	r1, .L138+44
	ldr	r2, .L138+112
	mov	lr, pc
	bx	r2
	b	.L99
.L129:
	cmp	r2, r3
	ldrlt	r3, [r1, #48]
	rsblt	r3, r3, #0
	strlt	r3, [r1, #8]
	b	.L86
.L136:
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	goToLose
.L128:
	mov	r2, #2
	mov	r0, r3
	str	r2, [r3, #12]
	ldr	r3, .L138+72
	mov	lr, pc
	bx	r3
	b	.L74
.L131:
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
	b	.L93
.L139:
	.align	2
.L138:
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
	ldr	r2, .L171
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	ldr	r3, .L171+4
	ldrb	r0, [r2, #1]	@ zero_extendqisi2
	ldr	r1, [r2, #4]
	ldr	ip, [r3, #0]
	mvn	r0, r0, asl #17
	ldr	r3, .L171+8
	mvn	r1, r1, asl #18
	mvn	r0, r0, lsr #17
	mvn	r1, r1, lsr #18
	cmp	ip, #0
	strh	r0, [r3, #0]	@ movhi
	strh	r1, [r3, #2]	@ movhi
	beq	.L141
	ldr	r1, [r2, #32]
	ldr	r2, [r2, #28]
	add	r2, r2, r1, asl #6
	mov	r2, r2, asl #2
	orr	r2, r2, #4096
	strh	r2, [r3, #4]	@ movhi
.L142:
	ldr	r2, .L171+12
	ldr	r1, [r2, #28]
	cmp	r1, #0
	moveq	r0, #512	@ movhi
	streqh	r0, [r3, #8]	@ movhi
	beq	.L145
	ldr	r0, [r2, #24]
	ldrb	r1, [r2, #0]	@ zero_extendqisi2
	cmp	r0, #0
	orr	r1, r1, #16384
	ldr	r0, .L171+8
	strh	r1, [r3, #8]	@ movhi
	bne	.L146
	ldr	r1, [r2, #4]
	orr	r1, r1, #-16777216
	orr	r1, r1, #16711680
	orr	r1, r1, #53248
	strh	r1, [r0, #10]	@ movhi
.L148:
	ldr	r1, [r2, #32]
	add	r1, r1, #64
	mov	r1, r1, asl #3
	strh	r1, [r3, #12]	@ movhi
.L145:
	ldr	r1, [r2, #72]
	cmp	r1, #0
	ldr	r1, .L171+12
	bne	.L149
	mov	r1, #512	@ movhi
	strh	r1, [r3, #16]	@ movhi
.L153:
	ldr	r2, .L171+16
	ldr	r1, .L171+8
	add	ip, r2, #140
.L150:
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
	bne	.L150
	ldr	r2, .L171+20
	ldr	r1, .L171+24
	ldr	ip, [r2, #20]
	mvn	r0, #32512
	ldr	lr, [r1, #0]
	mov	r1, r0
	sub	r1, r1, #245
	cmp	ip, #0
	strh	r1, [r3, #34]	@ movhi
	ldrne	r1, [r2, #4]
	ldr	ip, .L171+8
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
	ldr	r2, .L171+20
	ldrne	r1, [r2, #28]
	ldrneh	r2, [r2, #24]
	strneh	r2, [r3, #64]	@ movhi
	movne	r2, #712	@ movhi
	strneh	r2, [r3, #68]	@ movhi
	ldr	r2, .L171+28
	moveq	r1, #512	@ movhi
	orrne	r1, r1, #16384
	streqh	r1, [r3, #64]	@ movhi
	strneh	r1, [r3, #66]	@ movhi
	ldr	r1, [r2, #24]
	add	lr, lr, #320
	mov	lr, lr, asl #1
	cmp	r1, #0
	strh	lr, [r3, #36]	@ movhi
	beq	.L161
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
.L161:
	ldr	r2, .L171+32
	mov	r1, #0
	ldr	r5, .L171+36
	ldr	r4, [r2, #0]
	mov	ip, r1
	mov	r0, r1
	mov	r2, r1
.L164:
	cmp	r2, r4
	addge	lr, r3, ip
	movge	r6, #512	@ movhi
	strgeh	r6, [lr, #160]	@ movhi
	bge	.L163
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
.L163:
	sub	r1, r1, #18
	add	r2, r2, #1
	mov	r1, r1, asl #16
	cmp	r2, #5
	add	r0, r0, #24
	add	ip, ip, #8
	mov	r1, r1, lsr #16
	bne	.L164
	cmp	r4, #0
	ldrge	r2, .L171+40
	ldrlt	r1, .L171+40
	rsbge	r4, r4, #5
	strlt	r2, [r1, #0]
	strge	r4, [r2, #0]
	ldr	r1, .L171+44
	ldr	r2, .L171+48
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
	ldr	r3, .L171+52
	mov	lr, pc
	bx	r3
	mov	r0, #3
	ldr	r1, .L171+8
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L171+56
	mov	lr, pc
	bx	ip
	ldmfd	sp!, {r3, r4, r5, r6, r7, lr}
	bx	lr
.L141:
	ldr	r1, .L171+60
	ldr	r1, [r1, #0]
	cmp	r1, #0
	beq	.L143
	ldr	r1, [r2, #32]
	ldr	r2, [r2, #28]
	add	r2, r2, r1, asl #6
	mov	r2, r2, asl #2
	orr	r2, r2, #8192
	strh	r2, [r3, #4]	@ movhi
	b	.L142
.L149:
	ldr	ip, [r1, #68]
	ldrb	r0, [r1, #44]	@ zero_extendqisi2
	cmp	ip, #0
	orr	r0, r0, #16384
	ldr	ip, .L171+8
	strh	r0, [r3, #16]	@ movhi
	bne	.L151
	ldr	r1, [r1, #48]
	orr	r1, r1, #-16777216
	orr	r1, r1, #16711680
	orr	r1, r1, #53248
	strh	r1, [ip, #18]	@ movhi
.L154:
	ldr	r2, [r2, #76]
	add	r2, r2, #64
	mov	r2, r2, asl #3
	strh	r2, [r3, #20]	@ movhi
	b	.L153
.L151:
	ldr	r1, [r1, #48]
	mvn	r1, r1, asl #18
	mvn	r1, r1, lsr #18
	strh	r1, [ip, #18]	@ movhi
	b	.L154
.L143:
	ldr	r1, [r2, #32]
	ldr	r2, [r2, #28]
	add	r2, r2, r1, asl #6
	mov	r2, r2, asl #2
	strh	r2, [r3, #4]	@ movhi
	b	.L142
.L146:
	ldr	r1, [r2, #4]
	mvn	r1, r1, asl #18
	mvn	r1, r1, lsr #18
	strh	r1, [r0, #10]	@ movhi
	b	.L148
.L172:
	.align	2
.L171:
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
	ldr	r3, .L176
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L173
	ldr	r3, .L176+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L175
.L173:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L175:
	ldmfd	sp!, {r4, lr}
	b	goToPause
.L177:
	.align	2
.L176:
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
	ldr	r3, .L181
	add	r2, r3, #1016
.L179:
	mov	r1, #512	@ movhi
	strh	r1, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L179
	bx	lr
.L182:
	.align	2
.L181:
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
