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
	mov	lr, #7936	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	r4, #0
	mov	lr, #256	@ movhi
	mov	r0, #3
	ldr	r1, .L2
	mov	r2, #100663296
	mov	r3, #2752
	ldr	r5, .L2+4
	strh	lr, [ip, #0]	@ movhi
	strh	r4, [ip, #16]	@ movhi
	mov	lr, pc
	bx	r5
	mov	r2, #100663296
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L2+8
	add	r2, r2, #63488
	mov	lr, pc
	bx	r5
	ldr	r3, .L2+12
	str	r4, [r3, #0]
	ldmfd	sp!, {r3, r4, r5, lr}
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
	strh	lr, [ip, #8]	@ movhi
	mov	r3, #5376
	mov	lr, #0	@ movhi
	mov	r0, #3
	ldr	r1, .L5
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r4, .L5+4
	strh	lr, [ip, #16]	@ movhi
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
	ldr	r1, .L13
	mov	r2, #100663296
	add	r3, r3, #32
	ldr	r4, .L13+4
	strh	lr, [ip, #16]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #59392
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L13+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L13+12
	mov	r2, #2
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	controlsTiles
	.word	DMANow
	.word	controlsMap
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
	ldr	r3, .L17
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L17+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToControls
.L18:
	.align	2
.L17:
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
	ldr	r4, .L22
	mov	r0, #3
	ldr	r1, .L22+4
	add	r2, r2, #512
	mov	r3, #256
	strh	r6, [r5, #0]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	mov	r0, #3
	ldr	r1, .L22+8
	add	r2, r2, #65536
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	mov	ip, #55808
	mov	r3, #17664
	mov	r0, #3
	ldr	r1, .L22+12
	mov	r2, #100663296
	add	r3, r3, #16
	strh	ip, [r5, #8]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #53248
	mov	r3, #4096
	mov	r0, #3
	ldr	r1, .L22+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L22+20
	add	r2, r3, #1016
.L20:
	mov	r7, #512	@ movhi
	strh	r7, [r3, #8]!	@ movhi
	cmp	r3, r2
	bne	.L20
	ldr	r3, .L22+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+28
	mov	lr, pc
	bx	r3
	ldr	ip, .L22+32
	mov	r4, #0
	mov	r5, #1
	mov	r9, #140
	mov	r3, #200
	str	r5, [ip, #12]
	str	r9, [ip, #0]
	stmib	ip, {r3, r4}	@ phole stm
	ldr	r8, .L22+36
	mov	sl, ip
	ldmia	sl!, {r0, r1, r2, r3}
	mov	r7, r8
	stmia	r7!, {r0, r1, r2, r3}
	mov	r6, #16
	ldr	r3, .L22+40
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
	ldr	ip, .L22+44
	mov	r3, #220
	str	r5, [ip, #12]
	ldmia	sl, {r0, r1, r2}
	str	r9, [ip, #0]
	stmib	ip, {r3, r4}	@ phole stm
	ldr	r6, .L22+48
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
	ldr	r3, .L22+52
	ldmia	r5, {r0, r1, r2}
	str	r4, [r3, #0]
	ldr	r3, .L22+56
	stmia	r6, {r0, r1, r2}
	mov	r2, #3
	str	r2, [r3, #0]
	ldr	r3, .L22+60
	str	r4, [r3, #0]
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L23:
	.align	2
.L22:
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
	ldr	r3, .L25
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
	ldr	r0, .L25+4
	sub	r1, r1, #223
	ldr	ip, .L25+8
	mov	lr, pc
	bx	ip
	ldr	r3, .L25+12
	mov	r2, #3
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	hOff
	.word	uke
	.word	playSoundA
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	updateControls
	.type	updateControls, %function
updateControls:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L30
	stmfd	sp!, {r4, lr}
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L27
	ldr	r3, .L30+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	beq	.L29
.L27:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L29:
	bl	initGame
	ldmfd	sp!, {r4, lr}
	b	goToGame
.L31:
	.align	2
.L30:
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
	ldr	r1, .L33
	add	r2, r6, #32768
	mov	r3, #1568
	ldr	r4, .L33+4
	strh	r5, [ip, #0]	@ movhi
	strh	lr, [ip, #24]	@ movhi
	mov	lr, pc
	bx	r4
	add	r2, r6, #61440
	mov	r3, r5
	mov	r0, #3
	ldr	r1, .L33+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L33+12
	mov	r2, #6
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, r5, r6, lr}
	bx	lr
.L34:
	.align	2
.L33:
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
	stmfd	sp!, {r4, lr}
	ldr	r4, .L40
	ldr	r3, [r4, #0]
	tst	r3, #8
	beq	.L36
	ldr	r2, .L40+4
	ldr	r2, [r2, #0]
	tst	r2, #8
	beq	.L38
.L36:
	tst	r3, #4
	beq	.L35
	ldr	r3, .L40+4
	ldr	r3, [r3, #0]
	tst	r3, #4
	beq	.L39
.L35:
	ldmfd	sp!, {r4, lr}
	bx	lr
.L39:
	ldmfd	sp!, {r4, lr}
	b	goToSplash
.L38:
	bl	goToGame
	ldr	r3, [r4, #0]
	b	.L36
.L41:
	.align	2
.L40:
	.word	oldButtons
	.word	buttons
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
	mov	lr, #7680	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	lr, #256	@ movhi
	strh	lr, [ip, #0]	@ movhi
	mov	lr, #0	@ movhi
	mov	r0, #3
	ldr	r1, .L43
	mov	r2, #100663296
	mov	r3, #1088
	ldr	r4, .L43+4
	strh	lr, [ip, #16]	@ movhi
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
	mov	r2, #5
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L44:
	.align	2
.L43:
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
	mov	lr, #7680	@ movhi
	strh	lr, [ip, #8]	@ movhi
	mov	lr, #256	@ movhi
	strh	lr, [ip, #0]	@ movhi
	mov	lr, #0	@ movhi
	mov	r0, #3
	ldr	r1, .L50
	mov	r2, #100663296
	mov	r3, #1424
	ldr	r4, .L50+4
	strh	lr, [ip, #16]	@ movhi
	mov	lr, pc
	bx	r4
	mov	r2, #100663296
	add	r2, r2, #61440
	mov	r3, #1024
	mov	r0, #3
	ldr	r1, .L50+8
	mov	lr, pc
	bx	r4
	ldr	r3, .L50+12
	mov	r2, #4
	str	r2, [r3, #0]
	ldmfd	sp!, {r4, lr}
	bx	lr
.L51:
	.align	2
.L50:
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
	ldr	r3, .L54
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L54+4
	ldr	r3, [r3, #0]
	tst	r3, #8
	bxne	lr
	b	goToSplash
.L55:
	.align	2
.L54:
	.word	oldButtons
	.word	buttons
	.size	updateLose, .-updateLose
	.global	__aeabi_idivmod
	.align	2
	.global	update
	.type	update, %function
update:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r4, .L109
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
	bne	.L57
	ldr	r3, [r2, #304]
	tst	r3, #32
	bne	.L99
.L57:
	ldr	r3, [r4, #28]
	mov	r2, #0
	str	r2, [r4, #32]
	str	r3, [r4, #24]
.L59:
	mov	r3, #67108864
	ldr	r2, [r3, #304]
	tst	r2, #16
	beq	.L60
	ldr	r3, [r3, #304]
	tst	r3, #32
	ldrne	r8, .L109+4
	beq	.L60
.L61:
	mov	r3, #67108864
	ldr	r6, [r3, #304]
	ands	r6, r6, #1
	ldrne	r7, .L109+8
	bne	.L65
	ldr	r7, .L109+8
	ldr	r5, .L109+12
	mov	r1, r7
	ldr	r0, .L109
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	ldrne	r3, .L109+16
	ldrne	r2, [r3, #0]
	addne	r2, r2, #1
	strne	r6, [r7, #24]
	strne	r2, [r3, #0]
	ldr	r0, .L109
	ldr	r1, .L109+20
	mov	lr, pc
	bx	r5
	cmp	r0, #0
	bne	.L100
.L65:
	ldr	sl, .L109+24
	ldr	r3, [sl, #0]
	tst	r3, #1
	beq	.L67
	ldr	r2, .L109+28
	ldr	r2, [r2, #0]
	tst	r2, #1
	ldreq	r9, .L109+32
	beq	.L68
.L67:
	mov	r5, #0
	ldr	r6, .L109+8
	ldr	r9, .L109+32
	ldr	fp, .L109+12
	mov	r3, r5
.L70:
	ldr	r2, [r6, #24]
	cmp	r2, #0
	bne	.L101
.L69:
	add	r5, r5, #1
	cmp	r5, #2
	add	r6, r6, #28
	bne	.L70
	ldr	r3, [sl, #0]
.L68:
	ldr	r2, [r4, #20]
	ldr	r1, [r4, #0]
	rsb	r2, r2, #159
	cmp	r2, r1, asr #8
	ldr	r1, .L109
	movle	r2, r2, asl #8
	strle	r2, [r1, #0]
	movle	r2, #0
	strle	r2, [r1, #8]
	tst	r3, #2
	beq	.L72
	ldr	r3, .L109+28
	ldr	r3, [r3, #0]
	tst	r3, #2
	beq	.L102
.L72:
	ldr	r4, .L109+36
	ldr	sl, .L109+40
	ldr	r6, [r4, #0]
	ldr	r5, .L109+44
	mov	r0, r6
	ldr	r1, [sl, #0]
	mov	lr, pc
	bx	r5
	add	r6, r6, #1
	cmp	r1, #0
	str	r6, [r4, #0]
	ldrne	r6, .L109+48
	bne	.L73
	ldr	r3, [r7, #24]
	cmp	r3, #0
	beq	.L74
	ldr	r3, .L109+8
	ldr	r3, [r3, #52]
	cmp	r3, #0
	ldrne	r6, .L109+48
	beq	.L103
.L75:
	ldr	r0, .L109+8
	ldr	r3, .L109+52
	mov	lr, pc
	bx	r3
	ldr	r3, .L109+12
	ldr	r0, .L109
	ldr	r1, .L109+8
	mov	lr, pc
	bx	r3
	ldr	r3, [r7, #52]
	cmp	r3, #0
	beq	.L77
.L104:
	ldr	r0, .L109+20
	ldr	r3, .L109+52
	mov	lr, pc
	bx	r3
	ldr	r1, .L109+20
	ldr	r3, .L109+12
	ldr	r0, .L109
	mov	lr, pc
	bx	r3
	b	.L77
.L60:
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	tst	r3, #16
	ldreq	r8, .L109+4
	ldreq	r3, [r8, #0]
	moveq	r2, #2
	addeq	r3, r3, #1
	streq	r2, [r4, #24]
	streq	r3, [r8, #0]
	mov	r3, #67108864
	ldr	r3, [r3, #304]
	ldrne	r8, .L109+4
	tst	r3, #32
	ldreq	r3, [r8, #0]
	moveq	r2, #1
	subeq	r3, r3, #1
	streq	r2, [r4, #24]
	streq	r3, [r8, #0]
	ldr	r2, .L109+56
	ldr	r3, [r4, #36]
	smull	r1, r2, r3, r2
	mov	r1, r3, asr #31
	add	r2, r2, r3
	rsb	r2, r1, r2, asr #4
	rsb	r2, r2, r2, asl #4
	subs	r3, r3, r2, asl #1
	ldr	r1, .L109
	bne	.L61
	ldr	r0, [r1, #32]
	cmp	r0, #1
	addle	r0, r0, #1
	strle	r0, [r1, #32]
	ble	.L61
	cmp	r0, #2
	streq	r3, [r1, #32]
	b	.L61
.L103:
	mov	r3, #1
.L74:
	rsb	r3, r3, r3, asl #3
	add	r3, r7, r3, asl #2
	mov	r2, #1
	str	r2, [r3, #24]
	mov	r2, #220
	str	r2, [r3, #4]
	ldr	r6, .L109+48
	mov	lr, pc
	bx	r6
	ldr	r2, .L109+60
	smull	r3, r2, r0, r2
	mov	r3, r0, asr #31
	rsb	r3, r3, r2, asr #6
	add	r3, r3, r3, asl #2
	add	r3, r3, r3, asl #2
	sub	r3, r0, r3, asl #3
	add	r3, r3, #87
	str	r3, [sl, #0]
.L73:
	ldr	r3, [r7, #24]
	cmp	r3, #0
	bne	.L75
	ldr	r3, [r7, #52]
	cmp	r3, #0
	bne	.L104
.L77:
	ldr	r7, [r4, #0]
	mov	lr, pc
	bx	r6
	add	r3, r7, #1
	str	r3, [r4, #0]
	mov	r1, r0
	mov	r0, r7
	mov	lr, pc
	bx	r5
	ldr	r3, .L109+60
	smull	r2, r3, r1, r3
	mov	r2, r1, asr #31
	rsb	r3, r2, r3, asr #5
	add	r3, r3, r3, asl #2
	add	r3, r3, r3, asl #2
	cmp	r1, r3, asl #2
	ldreq	r4, .L109+64
	bne	.L105
.L78:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	bne	.L80
	ldr	r3, [r4, #52]
	cmp	r3, #0
	bne	.L106
.L82:
	ldr	r3, [r9, #0]
	ldrh	r2, [r8, #0]
	cmp	r3, #0
	mov	r3, #67108864
	strh	r2, [r3, #16]	@ movhi
	ble	.L107
.L56:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L105:
	ldr	r4, .L109+64
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L79
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L108
.L80:
	ldr	r3, .L109+68
	ldr	r0, .L109+64
	ldr	r1, .L109
	mov	lr, pc
	bx	r3
	ldr	r3, [r4, #52]
	cmp	r3, #0
	beq	.L82
.L106:
	ldr	r3, .L109+68
	ldr	r0, .L109+72
	ldr	r1, .L109
	mov	lr, pc
	bx	r3
	ldr	r3, [r9, #0]
	ldrh	r2, [r8, #0]
	cmp	r3, #0
	mov	r3, #67108864
	strh	r2, [r3, #16]	@ movhi
	bgt	.L56
.L107:
	add	sp, sp, #12
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	b	goToLose
.L99:
	ldr	r3, [r4, #24]
	cmp	r3, #0
	beq	.L57
	ldr	r3, [r4, #36]
	add	r3, r3, #1
	str	r3, [r4, #36]
	b	.L59
.L102:
	ldr	r3, [r4, #44]
	ldr	r2, [r4, #8]
	rsb	r1, r3, #0
	cmp	r2, r1
	ldr	r1, .L109
	ble	.L72
	cmp	r2, r3
	ldrlt	r3, [r1, #48]
	rsblt	r3, r3, #0
	strlt	r3, [r1, #8]
	b	.L72
.L100:
	ldr	r3, .L109+16
	ldr	r2, [r3, #0]
	mov	r1, #0
	add	r2, r2, #1
	str	r1, [r7, #52]
	str	r2, [r3, #0]
	b	.L65
.L101:
	rsb	r1, r5, r5, asl #3
	str	r3, [sp, #4]
	ldr	r0, .L109
	add	r1, r7, r1, asl #2
	mov	lr, pc
	bx	fp
	cmp	r0, #0
	ldrne	r2, [r9, #0]
	ldr	r3, [sp, #4]
	subne	r2, r2, #1
	strne	r3, [r6, #24]
	strne	r2, [r9, #0]
	b	.L69
.L108:
	mov	r3, #1
.L79:
	rsb	r3, r3, r3, asl #3
	add	r3, r4, r3, asl #2
	mov	r2, #1
	str	r2, [r3, #24]
	b	.L78
.L110:
	.align	2
.L109:
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
	beq	.L113
	ldmia	r2, {r0, r1}	@ phole ldm
	mvn	r1, r1, asl #17
	mvn	r1, r1, lsr #17
	orr	r0, r0, #16384
	strh	r1, [r3, #10]	@ movhi
	mov	r1, #8	@ movhi
	strh	r0, [r3, #8]	@ movhi
	strh	r1, [r3, #12]	@ movhi
.L113:
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
	ble	.L117
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
	ble	.L117
	cmp	r0, #2
	mov	ip, #34	@ movhi
	mov	r0, #12	@ movhi
	strh	r1, [r2, #40]	@ movhi
	strh	ip, [r2, #42]	@ movhi
	strh	r0, [r2, #44]	@ movhi
	ble	.L119
	mov	ip, #44	@ movhi
	mov	r0, #12	@ movhi
	strh	r1, [r2, #48]	@ movhi
	strh	ip, [r2, #50]	@ movhi
	strh	r0, [r2, #52]	@ movhi
.L121:
	ldr	r2, .L128+16
	ldr	r1, [r2, #24]
	cmp	r1, #0
	ldrne	r1, [r2, #0]
	ldrneh	ip, [r2, #4]
	ldr	r2, [r2, #52]
	moveq	r1, #512	@ movhi
	orrne	r1, r1, #16384
	movne	r0, #12	@ movhi
	streqh	r1, [r3, #56]	@ movhi
	strneh	r1, [r3, #56]	@ movhi
	strneh	ip, [r3, #58]	@ movhi
	strneh	r0, [r3, #60]	@ movhi
	cmp	r2, #0
	ldr	r2, .L128+16
	ldrne	r1, [r2, #28]
	ldrneh	r2, [r2, #32]
	moveq	r1, #512	@ movhi
	strneh	r2, [r3, #66]	@ movhi
	orrne	r1, r1, #16384
	movne	r2, #12	@ movhi
	streqh	r1, [r3, #64]	@ movhi
	strneh	r1, [r3, #64]	@ movhi
	strneh	r2, [r3, #68]	@ movhi
	mov	r0, #3
	ldr	r1, .L128+8
	mov	r2, #117440512
	mov	r3, #512
	ldr	ip, .L128+20
	mov	lr, pc
	bx	ip
	ldr	r3, .L128+24
	mov	lr, pc
	bx	r3
	ldmfd	sp!, {r3, lr}
	bx	lr
.L117:
	mov	r0, #512	@ movhi
	strh	r0, [r3, #40]	@ movhi
.L119:
	mov	r1, #512	@ movhi
	strh	r1, [r3, #48]	@ movhi
	b	.L121
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
	ble	.L117
	b	.L127
.L129:
	.align	2
.L128:
	.word	p
	.word	cats
	.word	shadowOAM
	.word	lives
	.word	hearts
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
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, lr}
	mov	r3, #4352	@ movhi
	mov	r4, #67108864
	ldr	r0, .L151
	strh	r3, [r4, #0]	@ movhi
	ldr	r3, .L151+4
	mov	lr, pc
	bx	r3
	bl	goToSplash
	ldr	r5, .L151+8
	ldr	r7, .L151+12
	ldr	r6, .L151+16
.L150:
	ldr	r3, [r5, #0]
	ldr	r2, [r7, #0]
.L139:
	str	r3, [r6, #0]
	ldr	r3, [r4, #304]
	str	r3, [r5, #0]
	cmp	r2, #6
	ldrls	pc, [pc, r2, asl #2]
	b	.L139
.L147:
	.word	.L140
	.word	.L141
	.word	.L142
	.word	.L143
	.word	.L144
	.word	.L145
	.word	.L146
.L146:
	bl	updatePause
	b	.L150
.L145:
	bl	updateWin
	b	.L150
.L144:
	bl	updateLose
	b	.L150
.L143:
	bl	updateGame
	b	.L150
.L142:
	bl	updateControls
	b	.L150
.L141:
	bl	updateInstructions
	b	.L150
.L140:
	bl	updateSplash
	b	.L150
.L152:
	.align	2
.L151:
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
