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
	ldr	ip, .L2
	str	r4, [sp, #-4]!
	ldr	ip, [ip, #0]
	add	r0, r0, r0, asl #1
	add	r4, ip, r0, asl #2
	orr	r3, r3, #-2147483648
	str	r1, [ip, r0, asl #2]
	str	r2, [r4, #4]
	str	r3, [r4, #8]
	ldmfd	sp!, {r4}
	bx	lr
.L3:
	.align	2
.L2:
	.word	.LANCHOR0
	.size	DMANow, .-DMANow
	.align	2
	.global	loadPalette
	.type	loadPalette, %function
loadPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L5
	ldr	r1, [r3, #0]
	mov	r3, #-2147483648
	add	r2, r1, #36
	str	r0, [r1, #36]
	add	r3, r3, #256
	mov	r1, #83886080
	str	r1, [r2, #4]
	str	r3, [r2, #8]
	bx	lr
.L6:
	.align	2
.L5:
	.word	.LANCHOR0
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
	ble	.L7
	ldr	r5, .L13
	add	r8, r3, r3, lsr #31
	ldr	r4, [r5, #0]
	rsb	r1, r1, r1, asl #4
	mov	r8, r8, asr #1
	mov	ip, #0
	ldr	sl, [r5, #4]
	add	r2, r2, r1, asl #4
	add	r4, r4, #36
	orr	r8, r8, #-2147483648
	mov	r1, ip
.L10:
	add	r6, ip, ip, lsr #31
	add	r5, r2, r2, lsr #31
	bic	r6, r6, #1
	bic	r5, r5, #1
	add	r1, r1, #1
	add	r6, r0, r6
	add	r5, sl, r5
	cmp	r1, r7
	str	r6, [r4, #0]
	add	ip, ip, r3
	str	r5, [r4, #4]
	add	r2, r2, #240
	str	r8, [r4, #8]
	bne	.L10
.L7:
	ldmfd	sp!, {r4, r5, r6, r7, r8, sl}
	bx	lr
.L14:
	.align	2
.L13:
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
	ldr	r3, .L16
	ldmia	r3, {r1, ip}	@ phole ldm
	mov	r3, #-2147483648
	add	r2, r1, #36
	add	r3, r3, #19200
	str	r0, [r1, #36]
	str	ip, [r2, #4]
	str	r3, [r2, #8]
	bx	lr
.L17:
	.align	2
.L16:
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
	ble	.L18
	ldr	ip, .L22
	rsb	r0, r0, r0, asl #4
	ldmia	ip, {r4, ip}	@ phole ldm
	add	r1, r1, r0, asl #4
	add	r1, ip, r1, asl #1
	add	r0, r4, #36
	mov	ip, #0
	orr	r4, r3, #-2147483648
	add	r3, sp, #6
.L20:
	add	ip, ip, #1
	cmp	ip, r2
	str	r3, [r0, #0]
	str	r1, [r0, #4]
	str	r4, [r0, #8]
	add	r1, r1, #480
	bne	.L20
.L18:
	add	sp, sp, #12
	ldmfd	sp!, {r4}
	bx	lr
.L23:
	.align	2
.L22:
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
.L25:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L25
	mov	r2, #67108864
.L27:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L27
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
	ldrne	r1, .L33
	ldreq	r1, .L33
	ldrne	r0, [r1, #8]
	ldreq	r0, [r1, #12]
	bicne	r2, r2, #16
	orreq	r2, r2, #16
	strneh	r2, [r3, #0]	@ movhi
	streqh	r2, [r3, #0]	@ movhi
	strne	r0, [r1, #4]
	streq	r0, [r1, #4]
	bx	lr
.L34:
	.align	2
.L33:
	.word	.LANCHOR0
	.size	flipPage, .-flipPage
	.global	videoBuffer
	.global	frontBuffer
	.global	backBuffer
	.global	dma
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	dma, %object
	.size	dma, 4
dma:
	.word	67109040
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
