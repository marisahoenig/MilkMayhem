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
	.file	"update.c"
	.text
	.align	2
	.global	updateCat
	.type	updateCat, %function
updateCat:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #24]
	cmp	r3, #0
	ldrne	r2, [r0, #4]
	ldrne	r3, [r0, #12]
	ldreq	r3, [r0, #4]
	rsbne	r3, r3, r2
	ldr	r2, [r0, #16]
	strne	r3, [r0, #4]
	add	r3, r3, r2
	cmp	r3, #0
	movle	r3, #0
	strle	r3, [r0, #24]
	bx	lr
	.size	updateCat, .-updateCat
	.comm	score,4,4
	.comm	prevScore,4,4
	.comm	lives,4,4
	.comm	time,4,4
	.comm	hOff,4,4
	.ident	"GCC: (devkitARM release 31) 4.5.0"
