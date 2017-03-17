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
	.file	"myLib.c"
	.text
	.align	2
	.global	DMANow
	.type	DMANow, %function
DMANow:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r0, r0, r0, asl #1
	mov	r0, r0, asl #2
	add	r0, r0, #67108864
	add	ip, r0, #176
	orr	r3, r3, #-2147483648
	str	r1, [r0, #176]
	str	r2, [ip, #4]
	str	r3, [ip, #8]
	bx	lr
	.size	DMANow, .-DMANow
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #-2147483648
	mov	r3, #67108864
	add	r2, r2, #256
	mov	r1, #83886080
	str	r0, [r3, #212]
	str	r1, [r3, #216]
	str	r2, [r3, #220]
	bx	lr
	.size	loadPalette, .-loadPalette
	.align	2
	.global	drawImage4
	.type	drawImage4, %function
drawImage4:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, sl}
	ldr	r7, [sp, #24]
	tst	r2, #1
	addne	r2, r2, #1
	cmp	r7, #0
	ble	.L3
	ldr	r4, .L9
	add	r8, r3, r3, lsr #31
	rsb	r1, r1, r1, asl #4
	mov	r8, r8, asr #1
	mov	ip, #0
	ldr	sl, [r4, #0]
	add	r2, r2, r1, asl #4
	orr	r8, r8, #-2147483648
	mov	r4, ip
	mov	r1, #67108864
.L6:
	add	r6, ip, ip, lsr #31
	add	r5, r2, r2, lsr #31
	bic	r6, r6, #1
	bic	r5, r5, #1
	add	r4, r4, #1
	add	r6, r0, r6
	add	r5, sl, r5
	cmp	r4, r7
	str	r6, [r1, #212]
	add	ip, ip, r3
	str	r5, [r1, #216]
	add	r2, r2, #240
	str	r8, [r1, #220]
	bne	.L6
.L3:
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr
.L10:
	.align	2
.L9:
	.word	.LANCHOR0
	.size	drawImage4, .-drawImage4
	.align	2
	.global	drawBackgroundImage4
	.type	drawBackgroundImage4, %function
drawBackgroundImage4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L12
	mov	r2, #-2147483648
	ldr	r1, [r3, #0]
	add	r2, r2, #19200
	mov	r3, #67108864
	str	r0, [r3, #212]
	str	r1, [r3, #216]
	str	r2, [r3, #220]
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LANCHOR0
	.size	drawBackgroundImage4, .-drawBackgroundImage4
	.align	2
	.global	drawRect
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	str	r4, [sp, #-4]!
	sub	sp, sp, #12
	ldrh	ip, [sp, #16]
	cmp	r2, #0
	strh	ip, [sp, #6]	@ movhi
	ble	.L14
	ldr	ip, .L18
	rsb	r0, r0, r0, asl #4
	ldr	ip, [ip, #0]
	add	r1, r1, r0, asl #4
	orr	r4, r3, #-2147483648
	add	r1, ip, r1, asl #1
	mov	r0, #0
	add	r3, sp, #6
	mov	ip, #67108864
.L16:
	add	r0, r0, #1
	cmp	r0, r2
	str	r3, [ip, #212]
	str	r1, [ip, #216]
	str	r4, [ip, #220]
	add	r1, r1, #480
	bne	.L16
.L14:
	add	sp, sp, #12
	ldmfd	sp!, {r4}
	bx	lr
.L19:
	.align	2
.L18:
	.word	.LANCHOR0
	.size	drawRect, .-drawRect
	.align	2
	.global	waitForVblank
	.type	waitForVblank, %function
waitForVblank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L21:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L21
	mov	r2, #67108864
.L23:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L23
	bx	lr
	.size	waitForVblank, .-waitForVblank
	.align	2
	.global	flipPage
	.type	flipPage, %function
flipPage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	ldrh	r2, [r3, #0]
	tst	r2, #16
	ldrne	r1, .L29
	ldreq	r1, .L29
	ldrne	r0, [r1, #4]
	ldreq	r0, [r1, #8]
	bicne	r2, r2, #16
	orreq	r2, r2, #16
	strneh	r2, [r3, #0]	@ movhi
	streqh	r2, [r3, #0]	@ movhi
	strne	r0, [r1, #0]
	streq	r0, [r1, #0]
	bx	lr
.L30:
	.align	2
.L29:
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.global	videoBuffer
	.global	frontBuffer
	.global	backBuffer
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	videoBuffer, %object
	.size	videoBuffer, 4
videoBuffer:
	.word	100663296
	.type	backBuffer, %object
	.size	backBuffer, 4
backBuffer:
	.word	100704256
	.type	frontBuffer, %object
	.size	frontBuffer, 4
frontBuffer:
	.word	100663296
	.ident	"GCC: (devkitARM release 31) 4.5.0"
