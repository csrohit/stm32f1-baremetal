
build/src/main.o:     file format elf32-littlearm


Disassembly of section .text.__NVIC_EnableIRQ:

00000000 <__NVIC_EnableIRQ>:
   0:	b480      	push	{r7}
   2:	b083      	sub	sp, #12
   4:	af00      	add	r7, sp, #0
   6:	4603      	mov	r3, r0
   8:	71fb      	strb	r3, [r7, #7]
   a:	f997 3007 	ldrsb.w	r3, [r7, #7]
   e:	2b00      	cmp	r3, #0
  10:	db0b      	blt.n	2a <__NVIC_EnableIRQ+0x2a>
  12:	79fb      	ldrb	r3, [r7, #7]
  14:	f003 021f 	and.w	r2, r3, #31
  18:	4906      	ldr	r1, [pc, #24]	; (34 <__NVIC_EnableIRQ+0x34>)
  1a:	f997 3007 	ldrsb.w	r3, [r7, #7]
  1e:	095b      	lsrs	r3, r3, #5
  20:	2001      	movs	r0, #1
  22:	fa00 f202 	lsl.w	r2, r0, r2
  26:	f841 2023 	str.w	r2, [r1, r3, lsl #2]
  2a:	bf00      	nop
  2c:	370c      	adds	r7, #12
  2e:	46bd      	mov	sp, r7
  30:	bc80      	pop	{r7}
  32:	4770      	bx	lr
  34:	e000e100 	and	lr, r0, r0, lsl #2

Disassembly of section .text.__NVIC_SetPriority:

00000000 <__NVIC_SetPriority>:
   0:	b480      	push	{r7}
   2:	b083      	sub	sp, #12
   4:	af00      	add	r7, sp, #0
   6:	4603      	mov	r3, r0
   8:	6039      	str	r1, [r7, #0]
   a:	71fb      	strb	r3, [r7, #7]
   c:	f997 3007 	ldrsb.w	r3, [r7, #7]
  10:	2b00      	cmp	r3, #0
  12:	db0a      	blt.n	2a <__NVIC_SetPriority+0x2a>
  14:	683b      	ldr	r3, [r7, #0]
  16:	b2da      	uxtb	r2, r3
  18:	490c      	ldr	r1, [pc, #48]	; (4c <__NVIC_SetPriority+0x4c>)
  1a:	f997 3007 	ldrsb.w	r3, [r7, #7]
  1e:	0112      	lsls	r2, r2, #4
  20:	b2d2      	uxtb	r2, r2
  22:	440b      	add	r3, r1
  24:	f883 2300 	strb.w	r2, [r3, #768]	; 0x300
  28:	e00a      	b.n	40 <__NVIC_SetPriority+0x40>
  2a:	683b      	ldr	r3, [r7, #0]
  2c:	b2da      	uxtb	r2, r3
  2e:	4908      	ldr	r1, [pc, #32]	; (50 <__NVIC_SetPriority+0x50>)
  30:	79fb      	ldrb	r3, [r7, #7]
  32:	f003 030f 	and.w	r3, r3, #15
  36:	3b04      	subs	r3, #4
  38:	0112      	lsls	r2, r2, #4
  3a:	b2d2      	uxtb	r2, r2
  3c:	440b      	add	r3, r1
  3e:	761a      	strb	r2, [r3, #24]
  40:	bf00      	nop
  42:	370c      	adds	r7, #12
  44:	46bd      	mov	sp, r7
  46:	bc80      	pop	{r7}
  48:	4770      	bx	lr
  4a:	bf00      	nop
  4c:	e000e100 	and	lr, r0, r0, lsl #2
  50:	e000ed00 	and	lr, r0, r0, lsl #26

Disassembly of section .text.SysTick_Config:

00000000 <SysTick_Config>:
   0:	b580      	push	{r7, lr}
   2:	b082      	sub	sp, #8
   4:	af00      	add	r7, sp, #0
   6:	6078      	str	r0, [r7, #4]
   8:	687b      	ldr	r3, [r7, #4]
   a:	3b01      	subs	r3, #1
   c:	f1b3 7f80 	cmp.w	r3, #16777216	; 0x1000000
  10:	d301      	bcc.n	16 <SysTick_Config+0x16>
  12:	2301      	movs	r3, #1
  14:	e00f      	b.n	36 <SysTick_Config+0x36>
  16:	4a0a      	ldr	r2, [pc, #40]	; (40 <SysTick_Config+0x40>)
  18:	687b      	ldr	r3, [r7, #4]
  1a:	3b01      	subs	r3, #1
  1c:	6053      	str	r3, [r2, #4]
  1e:	210f      	movs	r1, #15
  20:	f04f 30ff 	mov.w	r0, #4294967295	; 0xffffffff
  24:	f7ff fffe 	bl	0 <SysTick_Config>
  28:	4b05      	ldr	r3, [pc, #20]	; (40 <SysTick_Config+0x40>)
  2a:	2200      	movs	r2, #0
  2c:	609a      	str	r2, [r3, #8]
  2e:	4b04      	ldr	r3, [pc, #16]	; (40 <SysTick_Config+0x40>)
  30:	2207      	movs	r2, #7
  32:	601a      	str	r2, [r3, #0]
  34:	2300      	movs	r3, #0
  36:	4618      	mov	r0, r3
  38:	3708      	adds	r7, #8
  3a:	46bd      	mov	sp, r7
  3c:	bd80      	pop	{r7, pc}
  3e:	bf00      	nop
  40:	e000e010 	and	lr, r0, r0, lsl r0

Disassembly of section .bss.msTicks:

00000000 <msTicks>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section .text.USART1_init:

00000000 <USART1_init>:
   0:	b580      	push	{r7, lr}
   2:	b084      	sub	sp, #16
   4:	af00      	add	r7, sp, #0
   6:	6078      	str	r0, [r7, #4]
   8:	4b16      	ldr	r3, [pc, #88]	; (64 <USART1_init+0x64>)
   a:	699b      	ldr	r3, [r3, #24]
   c:	4a15      	ldr	r2, [pc, #84]	; (64 <USART1_init+0x64>)
   e:	f443 4380 	orr.w	r3, r3, #16384	; 0x4000
  12:	f043 0304 	orr.w	r3, r3, #4
  16:	6193      	str	r3, [r2, #24]
  18:	4b13      	ldr	r3, [pc, #76]	; (68 <USART1_init+0x68>)
  1a:	685b      	ldr	r3, [r3, #4]
  1c:	4a12      	ldr	r2, [pc, #72]	; (68 <USART1_init+0x68>)
  1e:	f423 637f 	bic.w	r3, r3, #4080	; 0xff0
  22:	6053      	str	r3, [r2, #4]
  24:	4b10      	ldr	r3, [pc, #64]	; (68 <USART1_init+0x68>)
  26:	685b      	ldr	r3, [r3, #4]
  28:	4a0f      	ldr	r2, [pc, #60]	; (68 <USART1_init+0x68>)
  2a:	f043 03b0 	orr.w	r3, r3, #176	; 0xb0
  2e:	6053      	str	r3, [r2, #4]
  30:	4b0d      	ldr	r3, [pc, #52]	; (68 <USART1_init+0x68>)
  32:	685b      	ldr	r3, [r3, #4]
  34:	4a0c      	ldr	r2, [pc, #48]	; (68 <USART1_init+0x68>)
  36:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
  3a:	6053      	str	r3, [r2, #4]
  3c:	4b0b      	ldr	r3, [pc, #44]	; (6c <USART1_init+0x6c>)
  3e:	681a      	ldr	r2, [r3, #0]
  40:	687b      	ldr	r3, [r7, #4]
  42:	fbb2 f3f3 	udiv	r3, r2, r3
  46:	60fb      	str	r3, [r7, #12]
  48:	4a09      	ldr	r2, [pc, #36]	; (70 <USART1_init+0x70>)
  4a:	68fb      	ldr	r3, [r7, #12]
  4c:	6093      	str	r3, [r2, #8]
  4e:	4b08      	ldr	r3, [pc, #32]	; (70 <USART1_init+0x70>)
  50:	f242 022c 	movw	r2, #8236	; 0x202c
  54:	60da      	str	r2, [r3, #12]
  56:	2025      	movs	r0, #37	; 0x25
  58:	f7ff fffe 	bl	0 <USART1_init>
  5c:	bf00      	nop
  5e:	3710      	adds	r7, #16
  60:	46bd      	mov	sp, r7
  62:	bd80      	pop	{r7, pc}
  64:	40021000 	andmi	r1, r2, r0
  68:	40010800 	andmi	r0, r1, r0, lsl #16
  6c:	00000000 	andeq	r0, r0, r0
  70:	40013800 	andmi	r3, r1, r0, lsl #16

Disassembly of section .data.SystemCoreClock:

00000000 <SystemCoreClock>:
   0:	007a1200 	rsbseq	r1, sl, r0, lsl #4

Disassembly of section .bss.msg:

00000000 <msg>:
	...

Disassembly of section .bss.flag:

00000000 <flag>:
   0:	00000000 	andeq	r0, r0, r0

Disassembly of section .bss.adc_value:

00000000 <adc_value>:
	...

Disassembly of section .text.init_clock:

00000000 <init_clock>:
   0:	b480      	push	{r7}
   2:	af00      	add	r7, sp, #0
   4:	4b24      	ldr	r3, [pc, #144]	; (98 <init_clock+0x98>)
   6:	681b      	ldr	r3, [r3, #0]
   8:	4a23      	ldr	r2, [pc, #140]	; (98 <init_clock+0x98>)
   a:	f043 0304 	orr.w	r3, r3, #4
   e:	6013      	str	r3, [r2, #0]
  10:	4b22      	ldr	r3, [pc, #136]	; (9c <init_clock+0x9c>)
  12:	685b      	ldr	r3, [r3, #4]
  14:	4a21      	ldr	r2, [pc, #132]	; (9c <init_clock+0x9c>)
  16:	f443 6380 	orr.w	r3, r3, #1024	; 0x400
  1a:	6053      	str	r3, [r2, #4]
  1c:	4b1f      	ldr	r3, [pc, #124]	; (9c <init_clock+0x9c>)
  1e:	4a1f      	ldr	r2, [pc, #124]	; (9c <init_clock+0x9c>)
  20:	685b      	ldr	r3, [r3, #4]
  22:	6053      	str	r3, [r2, #4]
  24:	4b1d      	ldr	r3, [pc, #116]	; (9c <init_clock+0x9c>)
  26:	681b      	ldr	r3, [r3, #0]
  28:	4a1c      	ldr	r2, [pc, #112]	; (9c <init_clock+0x9c>)
  2a:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
  2e:	6013      	str	r3, [r2, #0]
  30:	bf00      	nop
  32:	4b1a      	ldr	r3, [pc, #104]	; (9c <init_clock+0x9c>)
  34:	681b      	ldr	r3, [r3, #0]
  36:	f403 3300 	and.w	r3, r3, #131072	; 0x20000
  3a:	2b00      	cmp	r3, #0
  3c:	d0f9      	beq.n	32 <init_clock+0x32>
  3e:	4b17      	ldr	r3, [pc, #92]	; (9c <init_clock+0x9c>)
  40:	685b      	ldr	r3, [r3, #4]
  42:	4a16      	ldr	r2, [pc, #88]	; (9c <init_clock+0x9c>)
  44:	f443 3380 	orr.w	r3, r3, #65536	; 0x10000
  48:	6053      	str	r3, [r2, #4]
  4a:	4b14      	ldr	r3, [pc, #80]	; (9c <init_clock+0x9c>)
  4c:	685b      	ldr	r3, [r3, #4]
  4e:	4a13      	ldr	r2, [pc, #76]	; (9c <init_clock+0x9c>)
  50:	f443 13e0 	orr.w	r3, r3, #1835008	; 0x1c0000
  54:	6053      	str	r3, [r2, #4]
  56:	4b11      	ldr	r3, [pc, #68]	; (9c <init_clock+0x9c>)
  58:	681b      	ldr	r3, [r3, #0]
  5a:	4a10      	ldr	r2, [pc, #64]	; (9c <init_clock+0x9c>)
  5c:	f043 7380 	orr.w	r3, r3, #16777216	; 0x1000000
  60:	6013      	str	r3, [r2, #0]
  62:	bf00      	nop
  64:	4b0d      	ldr	r3, [pc, #52]	; (9c <init_clock+0x9c>)
  66:	681b      	ldr	r3, [r3, #0]
  68:	f003 7300 	and.w	r3, r3, #33554432	; 0x2000000
  6c:	2b00      	cmp	r3, #0
  6e:	d0f9      	beq.n	64 <init_clock+0x64>
  70:	4b0a      	ldr	r3, [pc, #40]	; (9c <init_clock+0x9c>)
  72:	685b      	ldr	r3, [r3, #4]
  74:	4a09      	ldr	r2, [pc, #36]	; (9c <init_clock+0x9c>)
  76:	f043 0302 	orr.w	r3, r3, #2
  7a:	6053      	str	r3, [r2, #4]
  7c:	bf00      	nop
  7e:	4b07      	ldr	r3, [pc, #28]	; (9c <init_clock+0x9c>)
  80:	685b      	ldr	r3, [r3, #4]
  82:	f003 0308 	and.w	r3, r3, #8
  86:	2b00      	cmp	r3, #0
  88:	d0f9      	beq.n	7e <init_clock+0x7e>
  8a:	4b05      	ldr	r3, [pc, #20]	; (a0 <init_clock+0xa0>)
  8c:	4a05      	ldr	r2, [pc, #20]	; (a4 <init_clock+0xa4>)
  8e:	601a      	str	r2, [r3, #0]
  90:	bf00      	nop
  92:	46bd      	mov	sp, r7
  94:	bc80      	pop	{r7}
  96:	4770      	bx	lr
  98:	40022000 	andmi	r2, r2, r0
  9c:	40021000 	andmi	r1, r2, r0
  a0:	00000000 	andeq	r0, r0, r0
  a4:	044aa200 	strbeq	sl, [sl], #-512	; 0xfffffe00

Disassembly of section .text.init_adc:

00000000 <init_adc>:
   0:	b580      	push	{r7, lr}
   2:	af00      	add	r7, sp, #0
   4:	4b27      	ldr	r3, [pc, #156]	; (a4 <init_adc+0xa4>)
   6:	685b      	ldr	r3, [r3, #4]
   8:	4a26      	ldr	r2, [pc, #152]	; (a4 <init_adc+0xa4>)
   a:	f443 4300 	orr.w	r3, r3, #32768	; 0x8000
   e:	6053      	str	r3, [r2, #4]
  10:	4b24      	ldr	r3, [pc, #144]	; (a4 <init_adc+0xa4>)
  12:	699b      	ldr	r3, [r3, #24]
  14:	4a23      	ldr	r2, [pc, #140]	; (a4 <init_adc+0xa4>)
  16:	f443 7301 	orr.w	r3, r3, #516	; 0x204
  1a:	6193      	str	r3, [r2, #24]
  1c:	4b22      	ldr	r3, [pc, #136]	; (a8 <init_adc+0xa8>)
  1e:	681b      	ldr	r3, [r3, #0]
  20:	4a21      	ldr	r2, [pc, #132]	; (a8 <init_adc+0xa8>)
  22:	f023 030f 	bic.w	r3, r3, #15
  26:	6013      	str	r3, [r2, #0]
  28:	4b20      	ldr	r3, [pc, #128]	; (ac <init_adc+0xac>)
  2a:	691b      	ldr	r3, [r3, #16]
  2c:	4a1f      	ldr	r2, [pc, #124]	; (ac <init_adc+0xac>)
  2e:	f043 0303 	orr.w	r3, r3, #3
  32:	6113      	str	r3, [r2, #16]
  34:	4b1d      	ldr	r3, [pc, #116]	; (ac <init_adc+0xac>)
  36:	685b      	ldr	r3, [r3, #4]
  38:	4a1c      	ldr	r2, [pc, #112]	; (ac <init_adc+0xac>)
  3a:	f043 0320 	orr.w	r3, r3, #32
  3e:	6053      	str	r3, [r2, #4]
  40:	4b1a      	ldr	r3, [pc, #104]	; (ac <init_adc+0xac>)
  42:	689b      	ldr	r3, [r3, #8]
  44:	4a19      	ldr	r2, [pc, #100]	; (ac <init_adc+0xac>)
  46:	f043 0301 	orr.w	r3, r3, #1
  4a:	6093      	str	r3, [r2, #8]
  4c:	2012      	movs	r0, #18
  4e:	f7ff fffe 	bl	0 <init_adc>
  52:	4b16      	ldr	r3, [pc, #88]	; (ac <init_adc+0xac>)
  54:	689b      	ldr	r3, [r3, #8]
  56:	4a15      	ldr	r2, [pc, #84]	; (ac <init_adc+0xac>)
  58:	f423 6300 	bic.w	r3, r3, #2048	; 0x800
  5c:	6093      	str	r3, [r2, #8]
  5e:	4b13      	ldr	r3, [pc, #76]	; (ac <init_adc+0xac>)
  60:	689b      	ldr	r3, [r3, #8]
  62:	4a12      	ldr	r2, [pc, #72]	; (ac <init_adc+0xac>)
  64:	f043 0308 	orr.w	r3, r3, #8
  68:	6093      	str	r3, [r2, #8]
  6a:	bf00      	nop
  6c:	4b0f      	ldr	r3, [pc, #60]	; (ac <init_adc+0xac>)
  6e:	689b      	ldr	r3, [r3, #8]
  70:	f003 0308 	and.w	r3, r3, #8
  74:	2b00      	cmp	r3, #0
  76:	d1f9      	bne.n	6c <init_adc+0x6c>
  78:	4b0c      	ldr	r3, [pc, #48]	; (ac <init_adc+0xac>)
  7a:	689b      	ldr	r3, [r3, #8]
  7c:	4a0b      	ldr	r2, [pc, #44]	; (ac <init_adc+0xac>)
  7e:	f043 0304 	orr.w	r3, r3, #4
  82:	6093      	str	r3, [r2, #8]
  84:	bf00      	nop
  86:	4b09      	ldr	r3, [pc, #36]	; (ac <init_adc+0xac>)
  88:	689b      	ldr	r3, [r3, #8]
  8a:	f003 0304 	and.w	r3, r3, #4
  8e:	2b00      	cmp	r3, #0
  90:	d1f9      	bne.n	86 <init_adc+0x86>
  92:	4b06      	ldr	r3, [pc, #24]	; (ac <init_adc+0xac>)
  94:	689b      	ldr	r3, [r3, #8]
  96:	4a05      	ldr	r2, [pc, #20]	; (ac <init_adc+0xac>)
  98:	f043 0301 	orr.w	r3, r3, #1
  9c:	6093      	str	r3, [r2, #8]
  9e:	bf00      	nop
  a0:	bd80      	pop	{r7, pc}
  a2:	bf00      	nop
  a4:	40021000 	andmi	r1, r2, r0
  a8:	40010800 	andmi	r0, r1, r0, lsl #16
  ac:	40012400 	andmi	r2, r1, r0, lsl #8

Disassembly of section .text.ADC_IRQHandler:

00000000 <ADC_IRQHandler>:
   0:	b480      	push	{r7}
   2:	af00      	add	r7, sp, #0
   4:	4b05      	ldr	r3, [pc, #20]	; (1c <ADC_IRQHandler+0x1c>)
   6:	2201      	movs	r2, #1
   8:	601a      	str	r2, [r3, #0]
   a:	4b05      	ldr	r3, [pc, #20]	; (20 <ADC_IRQHandler+0x20>)
   c:	6cdb      	ldr	r3, [r3, #76]	; 0x4c
   e:	b29a      	uxth	r2, r3
  10:	4b04      	ldr	r3, [pc, #16]	; (24 <ADC_IRQHandler+0x24>)
  12:	801a      	strh	r2, [r3, #0]
  14:	bf00      	nop
  16:	46bd      	mov	sp, r7
  18:	bc80      	pop	{r7}
  1a:	4770      	bx	lr
  1c:	00000000 	andeq	r0, r0, r0
  20:	40012400 	andmi	r2, r1, r0, lsl #8
  24:	00000000 	andeq	r0, r0, r0

Disassembly of section .rodata:

00000000 <.rodata>:
   0:	6c6c6548 	cfstr64vs	mvdx6, [ip], #-288	; 0xfffffee0
   4:	0a0d206f 	beq	3481c8 <init_adc+0x3481c8>
   8:	00000000 	andeq	r0, r0, r0
   c:	69676944 	stmdbvs	r7!, {r2, r6, r8, fp, sp, lr}^
  10:	206c6174 	rsbcs	r6, ip, r4, ror r1
  14:	756c6176 	strbvc	r6, [ip, #-374]!	; 0xfffffe8a
  18:	25203a65 	strcs	r3, [r0, #-2661]!	; 0xfffff59b
  1c:	0a0d7568 	beq	35d5c4 <init_adc+0x35d5c4>
	...

Disassembly of section .text.main:

00000000 <main>:
   0:	b580      	push	{r7, lr}
   2:	b082      	sub	sp, #8
   4:	af00      	add	r7, sp, #0
   6:	f7ff fffe 	bl	0 <main>
   a:	f44f 5016 	mov.w	r0, #9600	; 0x2580
   e:	f7ff fffe 	bl	0 <main>
  12:	4b16      	ldr	r3, [pc, #88]	; (6c <main+0x6c>)
  14:	681b      	ldr	r3, [r3, #0]
  16:	4a16      	ldr	r2, [pc, #88]	; (70 <main+0x70>)
  18:	fba2 2303 	umull	r2, r3, r2, r3
  1c:	099b      	lsrs	r3, r3, #6
  1e:	4618      	mov	r0, r3
  20:	f7ff fffe 	bl	0 <main>
  24:	4603      	mov	r3, r0
  26:	607b      	str	r3, [r7, #4]
  28:	687b      	ldr	r3, [r7, #4]
  2a:	2b00      	cmp	r3, #0
  2c:	da00      	bge.n	30 <main+0x30>
  2e:	e7fe      	b.n	2e <main+0x2e>
  30:	f7ff fffe 	bl	0 <main>
  34:	480f      	ldr	r0, [pc, #60]	; (74 <main+0x74>)
  36:	f7ff fffe 	bl	0 <USART1_puts>
  3a:	4b0f      	ldr	r3, [pc, #60]	; (78 <main+0x78>)
  3c:	681b      	ldr	r3, [r3, #0]
  3e:	2b00      	cmp	r3, #0
  40:	d0fb      	beq.n	3a <main+0x3a>
  42:	4b0e      	ldr	r3, [pc, #56]	; (7c <main+0x7c>)
  44:	881b      	ldrh	r3, [r3, #0]
  46:	461a      	mov	r2, r3
  48:	490d      	ldr	r1, [pc, #52]	; (80 <main+0x80>)
  4a:	480e      	ldr	r0, [pc, #56]	; (84 <main+0x84>)
  4c:	f7ff fffe 	bl	0 <sprintf_>
  50:	480c      	ldr	r0, [pc, #48]	; (84 <main+0x84>)
  52:	f7ff fffe 	bl	0 <USART1_puts>
  56:	4b08      	ldr	r3, [pc, #32]	; (78 <main+0x78>)
  58:	2200      	movs	r2, #0
  5a:	601a      	str	r2, [r3, #0]
  5c:	4b0a      	ldr	r3, [pc, #40]	; (88 <main+0x88>)
  5e:	689b      	ldr	r3, [r3, #8]
  60:	4a09      	ldr	r2, [pc, #36]	; (88 <main+0x88>)
  62:	f043 0301 	orr.w	r3, r3, #1
  66:	6093      	str	r3, [r2, #8]
  68:	e7e7      	b.n	3a <main+0x3a>
  6a:	bf00      	nop
  6c:	00000000 	andeq	r0, r0, r0
  70:	10624dd3 	ldrdne	r4, [r2], #-211	; 0xffffff2d	; <UNPREDICTABLE>
	...
  80:	0000000c 	andeq	r0, r0, ip
  84:	00000000 	andeq	r0, r0, r0
  88:	40012400 	andmi	r2, r1, r0, lsl #8

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	00000b1f 	andeq	r0, r0, pc, lsl fp
   4:	00000002 	andeq	r0, r0, r2
   8:	01040000 	mrseq	r0, (UNDEF: 4)
   c:	00000459 	andeq	r0, r0, r9, asr r4
  10:	0006450c 	andeq	r4, r6, ip, lsl #10
  14:	0001e800 	andeq	lr, r1, r0, lsl #16
	...
  28:	06010200 	streq	r0, [r1], -r0, lsl #4
  2c:	00000639 	andeq	r0, r0, r9, lsr r6
  30:	00051803 	andeq	r1, r5, r3, lsl #16
  34:	182b0400 	stmdane	fp!, {sl}
  38:	0000003c 	andeq	r0, r0, ip, lsr r0
  3c:	d4080102 	strle	r0, [r8], #-258	; 0xfffffefe
  40:	02000005 	andeq	r0, r0, #5
  44:	04460502 	strbeq	r0, [r6], #-1282	; 0xfffffafe
  48:	b1030000 	mrslt	r0, (UNDEF: 3)
  4c:	04000001 	streq	r0, [r0], #-1
  50:	00561939 	subseq	r1, r6, r9, lsr r9
  54:	02020000 	andeq	r0, r2, #0
  58:	00065007 	andeq	r5, r6, r7
  5c:	00dc0300 	sbcseq	r0, ip, r0, lsl #6
  60:	4d040000 	stcmi	0, cr0, [r4, #-0]
  64:	00006918 	andeq	r6, r0, r8, lsl r9
  68:	05040200 	streq	r0, [r4, #-512]	; 0xfffffe00
  6c:	00000450 	andeq	r0, r0, r0, asr r4
  70:	0005ee03 	andeq	lr, r5, r3, lsl #28
  74:	194f0400 	stmdbne	pc, {sl}^	; <UNPREDICTABLE>
  78:	0000007c 	andeq	r0, r0, ip, ror r0
  7c:	7d070402 	cfstrsvc	mvf0, [r7, #-8]
  80:	02000005 	andeq	r0, r0, #5
  84:	031e0508 	tsteq	lr, #8, 10	; 0x2000000
  88:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
  8c:	00018d07 	andeq	r8, r1, r7, lsl #26
  90:	05040400 	streq	r0, [r4, #-1024]	; 0xfffffc00
  94:	00746e69 	rsbseq	r6, r4, r9, ror #28
  98:	c0070402 	andgt	r0, r7, r2, lsl #8
  9c:	03000000 	movweq	r0, #0
  a0:	000002ea 	andeq	r0, r0, sl, ror #5
  a4:	30131805 	andscc	r1, r3, r5, lsl #16
  a8:	05000000 	streq	r0, [r0, #-0]
  ac:	0000009f 	muleq	r0, pc, r0	; <UNPREDICTABLE>
  b0:	0003c703 	andeq	ip, r3, r3, lsl #14
  b4:	14240500 	strtne	r0, [r4], #-1280	; 0xfffffb00
  b8:	0000004a 	andeq	r0, r0, sl, asr #32
  bc:	00059903 	andeq	r9, r5, r3, lsl #18
  c0:	132c0500 			; <UNDEFINED> instruction: 0x132c0500
  c4:	0000005d 	andeq	r0, r0, sp, asr r0
  c8:	00014603 	andeq	r4, r1, r3, lsl #12
  cc:	14300500 	ldrtne	r0, [r0], #-1280	; 0xfffffb00
  d0:	00000070 	andeq	r0, r0, r0, ror r0
  d4:	0000c805 	andeq	ip, r0, r5, lsl #16
  d8:	00d40600 	sbcseq	r0, r4, r0, lsl #12
  dc:	08020000 	stmdaeq	r2, {}	; <UNPREDICTABLE>
  e0:	0003bb04 	andeq	fp, r3, r4, lsl #22
  e4:	01050700 	tsteq	r5, r0, lsl #14
  e8:	00000029 	andeq	r0, r0, r9, lsr #32
  ec:	2c014606 	stccs	6, cr4, [r1], {6}
  f0:	08000002 	stmdaeq	r0, {r1}
  f4:	000004e4 	andeq	r0, r0, r4, ror #9
  f8:	06730872 			; <UNDEFINED> instruction: 0x06730872
  fc:	08730000 	ldmdaeq	r3!, {}^	; <UNPREDICTABLE>
 100:	00000130 	andeq	r0, r0, r0, lsr r1
 104:	03410874 	movteq	r0, #6260	; 0x1874
 108:	08750000 	ldmdaeq	r5!, {}^	; <UNPREDICTABLE>
 10c:	000005c4 	andeq	r0, r0, r4, asr #11
 110:	06060876 			; <UNDEFINED> instruction: 0x06060876
 114:	087b0000 	ldmdaeq	fp!, {}^	; <UNPREDICTABLE>
 118:	000005b2 			; <UNDEFINED> instruction: 0x000005b2
 11c:	0116087c 	tsteq	r6, ip, ror r8
 120:	087e0000 	ldmdaeq	lr!, {}^	; <UNPREDICTABLE>
 124:	0000056b 	andeq	r0, r0, fp, ror #10
 128:	032c097f 			; <UNDEFINED> instruction: 0x032c097f
 12c:	09000000 	stmdbeq	r0, {}	; <UNPREDICTABLE>
 130:	0000035a 	andeq	r0, r0, sl, asr r3
 134:	06da0901 	ldrbeq	r0, [sl], r1, lsl #18
 138:	09020000 	stmdbeq	r2, {}	; <UNPREDICTABLE>
 13c:	000003f7 	strdeq	r0, [r0], -r7
 140:	00e60903 	rsceq	r0, r6, r3, lsl #18
 144:	09040000 	stmdbeq	r4, {}	; <UNPREDICTABLE>
 148:	00000122 	andeq	r0, r0, r2, lsr #2
 14c:	00f70905 	rscseq	r0, r7, r5, lsl #18
 150:	09060000 	stmdbeq	r6, {}	; <UNPREDICTABLE>
 154:	000002f2 	strdeq	r0, [r0], -r2
 158:	02710907 	rsbseq	r0, r1, #114688	; 0x1c000
 15c:	09080000 	stmdbeq	r8, {}	; <UNPREDICTABLE>
 160:	00000663 	andeq	r0, r0, r3, ror #12
 164:	034f0909 	movteq	r0, #63753	; 0xf909
 168:	090a0000 	stmdbeq	sl, {}	; <UNPREDICTABLE>
 16c:	000002c5 	andeq	r0, r0, r5, asr #5
 170:	00ad090b 	adceq	r0, sp, fp, lsl #18
 174:	090c0000 	stmdbeq	ip, {}	; <UNPREDICTABLE>
 178:	0000037d 	andeq	r0, r0, sp, ror r3
 17c:	017a090d 	cmneq	sl, sp, lsl #18
 180:	090e0000 	stmdbeq	lr, {}	; <UNPREDICTABLE>
 184:	00000626 	andeq	r0, r0, r6, lsr #12
 188:	02a2090f 	adceq	r0, r2, #245760	; 0x3c000
 18c:	09100000 	ldmdbeq	r0, {}	; <UNPREDICTABLE>
 190:	0000007a 	andeq	r0, r0, sl, ror r0
 194:	06b40911 	ssateq	r0, #21, r1, lsl #18
 198:	09120000 	ldmdbeq	r2, {}	; <UNPREDICTABLE>
 19c:	000001ca 	andeq	r0, r0, sl, asr #3
 1a0:	00000913 	andeq	r0, r0, r3, lsl r9
 1a4:	09140000 	ldmdbeq	r4, {}	; <UNPREDICTABLE>
 1a8:	000001bc 			; <UNDEFINED> instruction: 0x000001bc
 1ac:	006c0915 	rsbeq	r0, ip, r5, lsl r9
 1b0:	09160000 	ldmdbeq	r6, {}	; <UNPREDICTABLE>
 1b4:	000005f9 	strdeq	r0, [r0], -r9
 1b8:	01590917 	cmpeq	r9, r7, lsl r9
 1bc:	09180000 	ldmdbeq	r8, {}	; <UNPREDICTABLE>
 1c0:	000003d0 	ldrdeq	r0, [r0], -r0	; <UNPREDICTABLE>
 1c4:	053a0919 	ldreq	r0, [sl, #-2329]!	; 0xfffff6e7
 1c8:	091a0000 	ldmdbeq	sl, {}	; <UNPREDICTABLE>
 1cc:	00000501 	andeq	r0, r0, r1, lsl #10
 1d0:	058f091b 	streq	r0, [pc, #2331]	; af3 <.debug_info+0xaf3>
 1d4:	091c0000 	ldmdbeq	ip, {}	; <UNPREDICTABLE>
 1d8:	000002bb 			; <UNDEFINED> instruction: 0x000002bb
 1dc:	00a3091d 	adceq	r0, r3, sp, lsl r9
 1e0:	091e0000 	ldmdbeq	lr, {}	; <UNPREDICTABLE>
 1e4:	0000039c 	muleq	r0, ip, r3
 1e8:	055e091f 	ldrbeq	r0, [lr, #-2335]	; 0xfffff6e1
 1ec:	09200000 	stmdbeq	r0!, {}	; <UNPREDICTABLE>
 1f0:	0000028b 	andeq	r0, r0, fp, lsl #5
 1f4:	008d0921 	addeq	r0, sp, r1, lsr #18
 1f8:	09220000 	stmdbeq	r2!, {}	; <UNPREDICTABLE>
 1fc:	00000170 	andeq	r0, r0, r0, ror r1
 200:	06170923 	ldreq	r0, [r7], -r3, lsr #18
 204:	09240000 	stmdbeq	r4!, {}	; <UNPREDICTABLE>
 208:	00000693 	muleq	r0, r3, r6
 20c:	02140925 	andseq	r0, r4, #606208	; 0x94000
 210:	09260000 	stmdbeq	r6!, {}	; <UNPREDICTABLE>
 214:	000006c5 	andeq	r0, r0, r5, asr #13
 218:	01020927 	tsteq	r2, r7, lsr #18
 21c:	09280000 	stmdbeq	r8!, {}	; <UNPREDICTABLE>
 220:	000003e8 	andeq	r0, r0, r8, ror #7
 224:	03030929 	movweq	r0, #14633	; 0x3929
 228:	002a0000 	eoreq	r0, sl, r0
 22c:	0001de03 	andeq	sp, r1, r3, lsl #28
 230:	037e0600 	cmneq	lr, #0, 12
 234:	000000e5 	andeq	r0, r0, r5, ror #1
 238:	010e040a 	tsteq	lr, sl, lsl #8
 23c:	1e090154 	mcrne	1, 0, r0, cr9, cr4, {2}
 240:	0b000003 	bleq	254 <.debug_info+0x254>
 244:	00000154 	andeq	r0, r0, r4, asr r1
 248:	12015601 	andne	r5, r1, #1048576	; 0x100000
 24c:	0000032e 	andeq	r0, r0, lr, lsr #6
 250:	0b002302 	bleq	8e60 <init_adc+0x8e60>
 254:	00000414 	andeq	r0, r0, r4, lsl r4
 258:	12015701 	andne	r5, r1, #262144	; 0x40000
 25c:	00000333 	andeq	r0, r0, r3, lsr r3
 260:	0b202302 	bleq	808e70 <init_adc+0x808e70>
 264:	00000612 	andeq	r0, r0, r2, lsl r6
 268:	12015801 	andne	r5, r1, #65536	; 0x10000
 26c:	0000032e 	andeq	r0, r0, lr, lsr #6
 270:	01802303 	orreq	r2, r0, r3, lsl #6
 274:	0001670b 	andeq	r6, r1, fp, lsl #14
 278:	01590100 	cmpeq	r9, r0, lsl #2
 27c:	00033312 	andeq	r3, r3, r2, lsl r3
 280:	a0230300 	eorge	r0, r3, r0, lsl #6
 284:	06820b01 	streq	r0, [r2], r1, lsl #22
 288:	5a010000 	bpl	40290 <init_adc+0x40290>
 28c:	032e1201 			; <UNDEFINED> instruction: 0x032e1201
 290:	23030000 	movwcs	r0, #12288	; 0x3000
 294:	1e0b0280 	cdpne	2, 0, cr0, cr11, cr0, {4}
 298:	01000004 	tsteq	r0, r4
 29c:	3312015b 	tstcc	r2, #-1073741802	; 0xc0000016
 2a0:	03000003 	movweq	r0, #3
 2a4:	0b02a023 	bleq	a8338 <init_adc+0xa8338>
 2a8:	00000370 	andeq	r0, r0, r0, ror r3
 2ac:	12015c01 	andne	r5, r1, #256	; 0x100
 2b0:	0000032e 	andeq	r0, r0, lr, lsr #6
 2b4:	03802303 	orreq	r2, r0, #201326592	; 0xc000000
 2b8:	0004280b 	andeq	r2, r4, fp, lsl #16
 2bc:	015d0100 	cmpeq	sp, r0, lsl #2
 2c0:	00033312 	andeq	r3, r3, r2, lsl r3
 2c4:	a0230300 	eorge	r0, r3, r0, lsl #6
 2c8:	06210b03 	strteq	r0, [r1], -r3, lsl #22
 2cc:	5e010000 	cdppl	0, 0, cr0, cr1, cr0, {0}
 2d0:	032e1201 			; <UNDEFINED> instruction: 0x032e1201
 2d4:	23030000 	movwcs	r0, #12288	; 0x3000
 2d8:	320b0480 	andcc	r0, fp, #128, 8	; 0x80000000
 2dc:	01000004 	tsteq	r0, r4
 2e0:	4312015f 	tstmi	r2, #-1073741801	; 0xc0000017
 2e4:	03000003 	movweq	r0, #3
 2e8:	0c04a023 	stceq	0, cr10, [r4], {35}	; 0x23
 2ec:	01005049 	tsteq	r0, r9, asr #32
 2f0:	63120160 	tstvs	r2, #96, 2
 2f4:	03000003 	movweq	r0, #3
 2f8:	0b068023 	bleq	1a038c <init_adc+0x1a038c>
 2fc:	0000043c 	andeq	r0, r0, ip, lsr r4
 300:	12016101 	andne	r6, r1, #1073741824	; 0x40000000
 304:	00000368 	andeq	r0, r0, r8, ror #6
 308:	07f02303 	ldrbeq	r2, [r0, r3, lsl #6]!
 30c:	0003dd0b 	andeq	sp, r3, fp, lsl #26
 310:	01620100 	cmneq	r2, r0, lsl #2
 314:	0000d412 	andeq	sp, r0, r2, lsl r4
 318:	80230300 	eorhi	r0, r3, r0, lsl #6
 31c:	d40d001c 	strle	r0, [sp], #-28	; 0xffffffe4
 320:	2e000000 	cdpcs	0, 0, cr0, cr0, cr0, {0}
 324:	0e000003 	cdpeq	0, 0, cr0, cr0, cr3, {0}
 328:	00000098 	muleq	r0, r8, r0
 32c:	1e050007 	cdpne	0, 0, cr0, cr5, cr7, {0}
 330:	0d000003 	stceq	0, cr0, [r0, #-12]
 334:	000000c8 	andeq	r0, r0, r8, asr #1
 338:	00000343 	andeq	r0, r0, r3, asr #6
 33c:	0000980e 	andeq	r9, r0, lr, lsl #16
 340:	0d001700 	stceq	7, cr1, [r0, #-0]
 344:	000000c8 	andeq	r0, r0, r8, asr #1
 348:	00000353 	andeq	r0, r0, r3, asr r3
 34c:	0000980e 	andeq	r9, r0, lr, lsl #16
 350:	0d003700 	stceq	7, cr3, [r0, #-0]
 354:	000000ab 	andeq	r0, r0, fp, lsr #1
 358:	00000363 	andeq	r0, r0, r3, ror #6
 35c:	0000980e 	andeq	r9, r0, lr, lsl #16
 360:	0500ef00 	streq	lr, [r0, #-3840]	; 0xfffff100
 364:	00000353 	andeq	r0, r0, r3, asr r3
 368:	0000c80d 	andeq	ip, r0, sp, lsl #16
 36c:	00037900 	andeq	r7, r3, r0, lsl #18
 370:	00980f00 	addseq	r0, r8, r0, lsl #30
 374:	02830000 	addeq	r0, r3, #0
 378:	05221000 	streq	r1, [r2, #-0]!
 37c:	63010000 	movwvs	r0, #4096	; 0x1000
 380:	02380401 	eorseq	r0, r8, #16777216	; 0x1000000
 384:	8c110000 	ldchi	0, cr0, [r1], {-0}
 388:	09017601 	stmdbeq	r1, {r0, r9, sl, ip, sp, lr}
 38c:	000004e2 	andeq	r0, r0, r2, ror #9
 390:	00022e0b 	andeq	r2, r2, fp, lsl #28
 394:	01780100 	cmneq	r8, r0, lsl #2
 398:	0000d912 	andeq	sp, r0, r2, lsl r9
 39c:	00230200 	eoreq	r0, r3, r0, lsl #4
 3a0:	0005780b 	andeq	r7, r5, fp, lsl #16
 3a4:	01790100 	cmneq	r9, r0, lsl #2
 3a8:	0000d412 	andeq	sp, r0, r2, lsl r4
 3ac:	04230200 	strteq	r0, [r3], #-512	; 0xfffffe00
 3b0:	0005590b 	andeq	r5, r5, fp, lsl #18
 3b4:	017a0100 	cmneq	sl, r0, lsl #2
 3b8:	0000d412 	andeq	sp, r0, r2, lsl r4
 3bc:	08230200 	stmdaeq	r3!, {r9}
 3c0:	0002b50b 	andeq	fp, r2, fp, lsl #10
 3c4:	017b0100 	cmneq	fp, r0, lsl #2
 3c8:	0000d412 	andeq	sp, r0, r2, lsl r4
 3cc:	0c230200 	sfmeq	f0, 4, [r3], #-0
 3d0:	5243530c 	subpl	r5, r3, #12, 6	; 0x30000000
 3d4:	017c0100 	cmneq	ip, r0, lsl #2
 3d8:	0000d412 	andeq	sp, r0, r2, lsl r4
 3dc:	10230200 	eorne	r0, r3, r0, lsl #4
 3e0:	5243430c 	subpl	r4, r3, #12, 6	; 0x30000000
 3e4:	017d0100 	cmneq	sp, r0, lsl #2
 3e8:	0000d412 	andeq	sp, r0, r2, lsl r4
 3ec:	14230200 	strtne	r0, [r3], #-512	; 0xfffffe00
 3f0:	5048530c 	subpl	r5, r8, ip, lsl #6
 3f4:	017e0100 	cmneq	lr, r0, lsl #2
 3f8:	0004f212 	andeq	pc, r4, r2, lsl r2	; <UNPREDICTABLE>
 3fc:	18230200 	stmdane	r3!, {r9}
 400:	0003360b 	andeq	r3, r3, fp, lsl #12
 404:	017f0100 	cmneq	pc, r0, lsl #2
 408:	0000d412 	andeq	sp, r0, r2, lsl r4
 40c:	24230200 	strtcs	r0, [r3], #-512	; 0xfffffe00
 410:	00033c0b 	andeq	r3, r3, fp, lsl #24
 414:	01800100 	orreq	r0, r0, r0, lsl #2
 418:	0000d412 	andeq	sp, r0, r2, lsl r4
 41c:	28230200 	stmdacs	r3!, {r9}
 420:	0002980b 	andeq	r9, r2, fp, lsl #16
 424:	01810100 	orreq	r0, r1, r0, lsl #2
 428:	0000d412 	andeq	sp, r0, r2, lsl r4
 42c:	2c230200 	sfmcs	f0, 4, [r3], #-0
 430:	0000d20b 	andeq	sp, r0, fp, lsl #4
 434:	01820100 	orreq	r0, r2, r0, lsl #2
 438:	0000d412 	andeq	sp, r0, r2, lsl r4
 43c:	30230200 	eorcc	r0, r3, r0, lsl #4
 440:	0003e20b 	andeq	lr, r3, fp, lsl #4
 444:	01830100 	orreq	r0, r3, r0, lsl #2
 448:	0000d412 	andeq	sp, r0, r2, lsl r4
 44c:	34230200 	strtcc	r0, [r3], #-512	; 0xfffffe00
 450:	0005350b 	andeq	r3, r5, fp, lsl #10
 454:	01840100 	orreq	r0, r4, r0, lsl #2
 458:	0000d412 	andeq	sp, r0, r2, lsl r4
 45c:	38230200 	stmdacc	r3!, {r9}
 460:	0002540b 	andeq	r5, r2, fp, lsl #8
 464:	01850100 	orreq	r0, r5, r0, lsl #2
 468:	0000d412 	andeq	sp, r0, r2, lsl r4
 46c:	3c230200 	sfmcc	f0, 4, [r3], #-0
 470:	5246500c 	subpl	r5, r6, #12
 474:	01860100 	orreq	r0, r6, r0, lsl #2
 478:	00050c12 	andeq	r0, r5, r2, lsl ip
 47c:	40230200 	eormi	r0, r3, r0, lsl #4
 480:	5246440c 	subpl	r4, r6, #12, 8	; 0xc000000
 484:	01870100 	orreq	r0, r7, r0, lsl #2
 488:	0000d912 	andeq	sp, r0, r2, lsl r9
 48c:	48230200 	stmdami	r3!, {r9}
 490:	5244410c 	subpl	r4, r4, #12, 2
 494:	01880100 	orreq	r0, r8, r0, lsl #2
 498:	0000d912 	andeq	sp, r0, r2, lsl r9
 49c:	4c230200 	sfmmi	f0, 4, [r3], #-0
 4a0:	00014f0b 	andeq	r4, r1, fp, lsl #30
 4a4:	01890100 	orreq	r0, r9, r0, lsl #2
 4a8:	00052612 	andeq	r2, r5, r2, lsl r6
 4ac:	50230200 	eorpl	r0, r3, r0, lsl #4
 4b0:	0006c00b 	andeq	ip, r6, fp
 4b4:	018a0100 	orreq	r0, sl, r0, lsl #2
 4b8:	00054012 	andeq	r4, r5, r2, lsl r0
 4bc:	60230200 	eorvs	r0, r3, r0, lsl #4
 4c0:	0004140b 	andeq	r1, r4, fp, lsl #8
 4c4:	018b0100 	orreq	r0, fp, r0, lsl #2
 4c8:	00054512 	andeq	r4, r5, r2, lsl r5
 4cc:	74230200 	strtvc	r0, [r3], #-512	; 0xfffffe00
 4d0:	0000350b 	andeq	r3, r0, fp, lsl #10
 4d4:	018c0100 	orreq	r0, ip, r0, lsl #2
 4d8:	0000d412 	andeq	sp, r0, r2, lsl r4
 4dc:	88230300 	stmdahi	r3!, {r8, r9}
 4e0:	ab0d0001 	blge	3404ec <init_adc+0x3404ec>
 4e4:	f2000000 	vhadd.s8	d0, d0, d0
 4e8:	0e000004 	cdpeq	0, 0, cr0, cr0, cr4, {0}
 4ec:	00000098 	muleq	r0, r8, r0
 4f0:	e205000b 	and	r0, r5, #11
 4f4:	0d000004 	stceq	0, cr0, [r0, #-16]
 4f8:	000000d9 	ldrdeq	r0, [r0], -r9
 4fc:	00000507 	andeq	r0, r0, r7, lsl #10
 500:	0000980e 	andeq	r9, r0, lr, lsl #16
 504:	06000100 	streq	r0, [r0], -r0, lsl #2
 508:	000004f7 	strdeq	r0, [r0], -r7
 50c:	00050705 	andeq	r0, r5, r5, lsl #14
 510:	00d90d00 	sbcseq	r0, r9, r0, lsl #26
 514:	05210000 	streq	r0, [r1, #-0]!
 518:	980e0000 	stmdals	lr, {}	; <UNPREDICTABLE>
 51c:	03000000 	movweq	r0, #0
 520:	05110600 	ldreq	r0, [r1, #-1536]	; 0xfffffa00
 524:	21050000 	mrscs	r0, (UNDEF: 5)
 528:	0d000005 	stceq	0, cr0, [r0, #-20]	; 0xffffffec
 52c:	000000d9 	ldrdeq	r0, [r0], -r9
 530:	0000053b 	andeq	r0, r0, fp, lsr r5
 534:	0000980e 	andeq	r9, r0, lr, lsl #16
 538:	06000400 	streq	r0, [r0], -r0, lsl #8
 53c:	0000052b 	andeq	r0, r0, fp, lsr #10
 540:	00053b05 	andeq	r3, r5, r5, lsl #22
 544:	00c80d00 	sbceq	r0, r8, r0, lsl #26
 548:	05550000 	ldrbeq	r0, [r5, #-0]
 54c:	980e0000 	stmdals	lr, {}	; <UNPREDICTABLE>
 550:	04000000 	streq	r0, [r0], #-0
 554:	052c1000 	streq	r1, [ip, #-0]!
 558:	8d010000 	stchi	0, cr0, [r1, #-0]
 55c:	03860301 	orreq	r0, r6, #67108864	; 0x4000000
 560:	10110000 	andsne	r0, r1, r0
 564:	0902b601 	stmdbeq	r2, {r0, r9, sl, ip, sp, pc}
 568:	000005ad 	andeq	r0, r0, sp, lsr #11
 56c:	0006eb0b 	andeq	lr, r6, fp, lsl #22
 570:	02b80100 	adcseq	r0, r8, #0, 2
 574:	0000d412 	andeq	sp, r0, r2, lsl r4
 578:	00230200 	eoreq	r0, r3, r0, lsl #4
 57c:	0000cd0b 	andeq	ip, r0, fp, lsl #26
 580:	02b90100 	adcseq	r0, r9, #0, 2
 584:	0000d412 	andeq	sp, r0, r2, lsl r4
 588:	04230200 	strteq	r0, [r3], #-512	; 0xfffffe00
 58c:	4c41560c 	mcrrmi	6, 0, r5, r1, cr12
 590:	02ba0100 	adcseq	r0, sl, #0, 2
 594:	0000d412 	andeq	sp, r0, r2, lsl r4
 598:	08230200 	stmdaeq	r3!, {r9}
 59c:	0000f10b 	andeq	pc, r0, fp, lsl #2
 5a0:	02bb0100 	adcseq	r0, fp, #0, 2
 5a4:	0000d912 	andeq	sp, r0, r2, lsl r9
 5a8:	0c230200 	sfmeq	f0, 4, [r3], #-0
 5ac:	03ae1000 			; <UNDEFINED> instruction: 0x03ae1000
 5b0:	bc010000 	stclt	0, cr0, [r1], {-0}
 5b4:	05620302 	strbeq	r0, [r2, #-770]!	; 0xfffffcfe
 5b8:	50120000 	andspl	r0, r2, r0
 5bc:	ee099006 	cdp	0, 0, cr9, cr9, cr6, {0}
 5c0:	13000006 	movwne	r0, #6
 5c4:	06005253 			; <UNDEFINED> instruction: 0x06005253
 5c8:	00d41192 	smullseq	r1, r4, r2, r1
 5cc:	23020000 	movwcs	r0, #8192	; 0x2000
 5d0:	52431300 	subpl	r1, r3, #0, 6
 5d4:	93060031 	movwls	r0, #24625	; 0x6031
 5d8:	0000d411 	andeq	sp, r0, r1, lsl r4
 5dc:	04230200 	strteq	r0, [r3], #-512	; 0xfffffe00
 5e0:	32524313 	subscc	r4, r2, #1275068416	; 0x4c000000
 5e4:	11940600 	orrsne	r0, r4, r0, lsl #12
 5e8:	000000d4 	ldrdeq	r0, [r0], -r4
 5ec:	14082302 	strne	r2, [r8], #-770	; 0xfffffcfe
 5f0:	00000390 	muleq	r0, r0, r3
 5f4:	d4119506 	ldrle	r9, [r1], #-1286	; 0xfffffafa
 5f8:	02000000 	andeq	r0, r0, #0
 5fc:	96140c23 	ldrls	r0, [r4], -r3, lsr #24
 600:	06000003 	streq	r0, [r0], -r3
 604:	00d41196 	smullseq	r1, r4, r6, r1
 608:	23020000 	movwcs	r0, #8192	; 0x2000
 60c:	06871410 	pkhbteq	r1, r7, r0, lsl #8
 610:	97060000 	strls	r0, [r6, -r0]
 614:	0000d411 	andeq	sp, r0, r1, lsl r4
 618:	14230200 	strtne	r0, [r3], #-512	; 0xfffffe00
 61c:	00068d14 	andeq	r8, r6, r4, lsl sp
 620:	11980600 	orrsne	r0, r8, r0, lsl #12
 624:	000000d4 	ldrdeq	r0, [r0], -r4
 628:	14182302 	ldrne	r2, [r8], #-770	; 0xfffffcfe
 62c:	000002fd 	strdeq	r0, [r0], -sp
 630:	d4119906 	ldrle	r9, [r1], #-2310	; 0xfffff6fa
 634:	02000000 	andeq	r0, r0, #0
 638:	9f141c23 	svcls	0x00141c23
 63c:	06000006 	streq	r0, [r0], -r6
 640:	00d4119a 	smullseq	r1, r4, sl, r1
 644:	23020000 	movwcs	r0, #8192	; 0x2000
 648:	54481320 	strbpl	r1, [r8], #-800	; 0xfffffce0
 64c:	9b060052 	blls	18079c <init_adc+0x18079c>
 650:	0000d411 	andeq	sp, r0, r1, lsl r4
 654:	24230200 	strtcs	r0, [r3], #-512	; 0xfffffe00
 658:	52544c13 	subspl	r4, r4, #4864	; 0x1300
 65c:	119c0600 	orrsne	r0, ip, r0, lsl #12
 660:	000000d4 	ldrdeq	r0, [r0], -r4
 664:	14282302 	strtne	r2, [r8], #-770	; 0xfffffcfe
 668:	0000001e 	andeq	r0, r0, lr, lsl r0
 66c:	d4119d06 	ldrle	r9, [r1], #-3334	; 0xfffff2fa
 670:	02000000 	andeq	r0, r0, #0
 674:	23142c23 	tstcs	r4, #8960	; 0x2300
 678:	06000000 	streq	r0, [r0], -r0
 67c:	00d4119e 	smullseq	r1, r4, lr, r1
 680:	23020000 	movwcs	r0, #8192	; 0x2000
 684:	00281430 	eoreq	r1, r8, r0, lsr r4
 688:	9f060000 	svcls	0x00060000
 68c:	0000d411 	andeq	sp, r0, r1, lsl r4
 690:	34230200 	strtcc	r0, [r3], #-512	; 0xfffffe00
 694:	00036b14 	andeq	r6, r3, r4, lsl fp
 698:	11a00600 	lslne	r0, r0, #12
 69c:	000000d4 	ldrdeq	r0, [r0], -r4
 6a0:	14382302 	ldrtne	r2, [r8], #-770	; 0xfffffcfe
 6a4:	00000400 	andeq	r0, r0, r0, lsl #8
 6a8:	d411a106 	ldrle	sl, [r1], #-262	; 0xfffffefa
 6ac:	02000000 	andeq	r0, r0, #0
 6b0:	05143c23 	ldreq	r3, [r4, #-3107]	; 0xfffff3dd
 6b4:	06000004 	streq	r0, [r0], -r4
 6b8:	00d411a2 	sbcseq	r1, r4, r2, lsr #3
 6bc:	23020000 	movwcs	r0, #8192	; 0x2000
 6c0:	040a1440 	streq	r1, [sl], #-1088	; 0xfffffbc0
 6c4:	a3060000 	movwge	r0, #24576	; 0x6000
 6c8:	0000d411 	andeq	sp, r0, r1, lsl r4
 6cc:	44230200 	strtmi	r0, [r3], #-512	; 0xfffffe00
 6d0:	00040f14 	andeq	r0, r4, r4, lsl pc
 6d4:	11a40600 			; <UNDEFINED> instruction: 0x11a40600
 6d8:	000000d4 	ldrdeq	r0, [r0], -r4
 6dc:	13482302 	movtne	r2, #33538	; 0x8302
 6e0:	06005244 	streq	r5, [r0], -r4, asr #4
 6e4:	00d411a5 	sbcseq	r1, r4, r5, lsr #3
 6e8:	23020000 	movwcs	r0, #8192	; 0x2000
 6ec:	1203004c 	andne	r0, r3, #76	; 0x4c
 6f0:	06000003 	streq	r0, [r0], -r3
 6f4:	05ba03a6 	ldreq	r0, [sl, #934]!	; 0x3a6
 6f8:	24110000 	ldrcs	r0, [r1], #-0
 6fc:	09014506 	stmdbeq	r1, {r1, r2, r8, sl, lr}
 700:	00000792 	muleq	r0, r2, r7
 704:	5243410c 	subpl	r4, r3, #12, 2
 708:	01470600 	cmpeq	r7, r0, lsl #12
 70c:	0000d411 	andeq	sp, r0, r1, lsl r4
 710:	00230200 	eoreq	r0, r3, r0, lsl #4
 714:	0001110b 	andeq	r1, r1, fp, lsl #2
 718:	01480600 	cmpeq	r8, r0, lsl #12
 71c:	0000d411 	andeq	sp, r0, r1, lsl r4
 720:	04230200 	strteq	r0, [r3], #-512	; 0xfffffe00
 724:	0001a90b 	andeq	sl, r1, fp, lsl #18
 728:	01490600 	cmpeq	r9, r0, lsl #12
 72c:	0000d411 	andeq	sp, r0, r1, lsl r4
 730:	08230200 	stmdaeq	r3!, {r9}
 734:	0052530c 	subseq	r5, r2, ip, lsl #6
 738:	11014a06 	tstne	r1, r6, lsl #20
 73c:	000000d4 	ldrdeq	r0, [r0], -r4
 740:	0c0c2302 	stceq	3, cr2, [ip], {2}
 744:	06005243 	streq	r5, [r0], -r3, asr #4
 748:	d411014b 	ldrle	r0, [r1], #-331	; 0xfffffeb5
 74c:	02000000 	andeq	r0, r0, #0
 750:	410c1023 	tstmi	ip, r3, lsr #32
 754:	4c060052 	stcmi	0, cr0, [r6], {82}	; 0x52
 758:	00d41101 	sbcseq	r1, r4, r1, lsl #2
 75c:	23020000 	movwcs	r0, #8192	; 0x2000
 760:	00150b14 	andseq	r0, r5, r4, lsl fp
 764:	4d060000 	stcmi	0, cr0, [r6, #-0]
 768:	00d41101 	sbcseq	r1, r4, r1, lsl #2
 76c:	23020000 	movwcs	r0, #8192	; 0x2000
 770:	424f0c18 	submi	r0, pc, #24, 24	; 0x1800
 774:	4e060052 	mcrmi	0, 0, r0, cr6, cr2, {2}
 778:	00d41101 	sbcseq	r1, r4, r1, lsl #2
 77c:	23020000 	movwcs	r0, #8192	; 0x2000
 780:	03a90b1c 			; <UNDEFINED> instruction: 0x03a90b1c
 784:	4f060000 	svcmi	0x00060000
 788:	00d41101 	sbcseq	r1, r4, r1, lsl #2
 78c:	23020000 	movwcs	r0, #8192	; 0x2000
 790:	20100020 	andscs	r0, r0, r0, lsr #32
 794:	06000002 	streq	r0, [r0], -r2
 798:	fa030150 	blx	c0ce0 <init_adc+0xc0ce0>
 79c:	11000006 	tstne	r0, r6
 7a0:	0166061c 	cmneq	r6, ip, lsl r6
 7a4:	00081a09 	andeq	r1, r8, r9, lsl #20
 7a8:	52430c00 	subpl	r0, r3, #0, 24
 7ac:	6806004c 	stmdavs	r6, {r2, r3, r6}
 7b0:	00d41101 	sbcseq	r1, r4, r1, lsl #2
 7b4:	23020000 	movwcs	r0, #8192	; 0x2000
 7b8:	52430c00 	subpl	r0, r3, #0, 24
 7bc:	69060048 	stmdbvs	r6, {r3, r6}
 7c0:	00d41101 	sbcseq	r1, r4, r1, lsl #2
 7c4:	23020000 	movwcs	r0, #8192	; 0x2000
 7c8:	44490c04 	strbmi	r0, [r9], #-3076	; 0xfffff3fc
 7cc:	6a060052 	bvs	18091c <init_adc+0x18091c>
 7d0:	00d41101 	sbcseq	r1, r4, r1, lsl #2
 7d4:	23020000 	movwcs	r0, #8192	; 0x2000
 7d8:	444f0c08 	strbmi	r0, [pc], #-3080	; 7e0 <.debug_info+0x7e0>
 7dc:	6b060052 	blvs	18092c <init_adc+0x18092c>
 7e0:	00d41101 	sbcseq	r1, r4, r1, lsl #2
 7e4:	23020000 	movwcs	r0, #8192	; 0x2000
 7e8:	004b0b0c 	subeq	r0, fp, ip, lsl #22
 7ec:	6c060000 	stcvs	0, cr0, [r6], {-0}
 7f0:	00d41101 	sbcseq	r1, r4, r1, lsl #2
 7f4:	23020000 	movwcs	r0, #8192	; 0x2000
 7f8:	52420c10 	subpl	r0, r2, #16, 24	; 0x1000
 7fc:	6d060052 	stcvs	0, cr0, [r6, #-328]	; 0xfffffeb8
 800:	00d41101 	sbcseq	r1, r4, r1, lsl #2
 804:	23020000 	movwcs	r0, #8192	; 0x2000
 808:	06e60b14 	usateq	r0, #6, r4, lsl #22
 80c:	6e060000 	cdpvs	0, 0, cr0, cr6, cr0, {0}
 810:	00d41101 	sbcseq	r1, r4, r1, lsl #2
 814:	23020000 	movwcs	r0, #8192	; 0x2000
 818:	4c100018 	ldcmi	0, cr0, [r0], {24}
 81c:	06000005 	streq	r0, [r0], -r5
 820:	9f03016f 	svcls	0x0003016f
 824:	11000007 	tstne	r0, r7
 828:	01a80628 			; <UNDEFINED> instruction: 0x01a80628
 82c:	0008d109 	andeq	sp, r8, r9, lsl #2
 830:	52430c00 	subpl	r0, r3, #0, 24
 834:	01aa0600 			; <UNDEFINED> instruction: 0x01aa0600
 838:	0000d411 	andeq	sp, r0, r1, lsl r4
 83c:	00230200 	eoreq	r0, r3, r0, lsl #4
 840:	0005130b 	andeq	r1, r5, fp, lsl #6
 844:	01ab0600 			; <UNDEFINED> instruction: 0x01ab0600
 848:	0000d411 	andeq	sp, r0, r1, lsl r4
 84c:	04230200 	strteq	r0, [r3], #-512	; 0xfffffe00
 850:	5249430c 	subpl	r4, r9, #12, 6	; 0x30000000
 854:	01ac0600 			; <UNDEFINED> instruction: 0x01ac0600
 858:	0000d411 	andeq	sp, r0, r1, lsl r4
 85c:	08230200 	stmdaeq	r3!, {r9}
 860:	0000630b 	andeq	r6, r0, fp, lsl #6
 864:	01ad0600 			; <UNDEFINED> instruction: 0x01ad0600
 868:	0000d411 	andeq	sp, r0, r1, lsl r4
 86c:	0c230200 	sfmeq	f0, 4, [r3], #-0
 870:	0002820b 	andeq	r8, r2, fp, lsl #4
 874:	01ae0600 			; <UNDEFINED> instruction: 0x01ae0600
 878:	0000d411 	andeq	sp, r0, r1, lsl r4
 87c:	10230200 	eorne	r0, r3, r0, lsl #4
 880:	0002e30b 	andeq	lr, r2, fp, lsl #6
 884:	01af0600 			; <UNDEFINED> instruction: 0x01af0600
 888:	0000d411 	andeq	sp, r0, r1, lsl r4
 88c:	14230200 	strtne	r0, [r3], #-512	; 0xfffffe00
 890:	0003750b 	andeq	r7, r3, fp, lsl #10
 894:	01b00600 	lslseq	r0, r0, #12
 898:	0000d411 	andeq	sp, r0, r1, lsl r4
 89c:	18230200 	stmdane	r3!, {r9}
 8a0:	00002d0b 	andeq	r2, r0, fp, lsl #26
 8a4:	01b10600 			; <UNDEFINED> instruction: 0x01b10600
 8a8:	0000d411 	andeq	sp, r0, r1, lsl r4
 8ac:	1c230200 	sfmne	f0, 4, [r3], #-0
 8b0:	0000d70b 	andeq	sp, r0, fp, lsl #14
 8b4:	01b20600 			; <UNDEFINED> instruction: 0x01b20600
 8b8:	0000d411 	andeq	sp, r0, r1, lsl r4
 8bc:	20230200 	eorcs	r0, r3, r0, lsl #4
 8c0:	5253430c 	subspl	r4, r3, #12, 6	; 0x30000000
 8c4:	01b30600 			; <UNDEFINED> instruction: 0x01b30600
 8c8:	0000d411 	andeq	sp, r0, r1, lsl r4
 8cc:	24230200 	strtcs	r0, [r3], #-512	; 0xfffffe00
 8d0:	02341000 	eorseq	r1, r4, #0
 8d4:	b6060000 	strlt	r0, [r6], -r0
 8d8:	08270301 	stmdaeq	r7!, {r0, r8, r9}
 8dc:	1c110000 	ldcne	0, cr0, [r1], {-0}
 8e0:	0901fb06 	stmdbeq	r1, {r1, r2, r8, r9, fp, ip, sp, lr, pc}
 8e4:	00000957 	andeq	r0, r0, r7, asr r9
 8e8:	0052530c 	subseq	r5, r2, ip, lsl #6
 8ec:	1101fd06 	tstne	r1, r6, lsl #26	; <UNPREDICTABLE>
 8f0:	000000d4 	ldrdeq	r0, [r0], -r4
 8f4:	0c002302 	stceq	3, cr2, [r0], {2}
 8f8:	06005244 	streq	r5, [r0], -r4, asr #4
 8fc:	d41101fe 	ldrle	r0, [r1], #-510	; 0xfffffe02
 900:	02000000 	andeq	r0, r0, #0
 904:	420c0423 	andmi	r0, ip, #587202560	; 0x23000000
 908:	06005252 			; <UNDEFINED> instruction: 0x06005252
 90c:	d41101ff 	ldrle	r0, [r1], #-511	; 0xfffffe01
 910:	02000000 	andeq	r0, r0, #0
 914:	430c0823 	movwmi	r0, #51235	; 0xc823
 918:	06003152 			; <UNDEFINED> instruction: 0x06003152
 91c:	d4110200 	ldrle	r0, [r1], #-512	; 0xfffffe00
 920:	02000000 	andeq	r0, r0, #0
 924:	430c0c23 	movwmi	r0, #52259	; 0xcc23
 928:	06003252 			; <UNDEFINED> instruction: 0x06003252
 92c:	d4110201 	ldrle	r0, [r1], #-513	; 0xfffffdff
 930:	02000000 	andeq	r0, r0, #0
 934:	430c1023 	movwmi	r1, #49187	; 0xc023
 938:	06003352 			; <UNDEFINED> instruction: 0x06003352
 93c:	d4110202 	ldrle	r0, [r1], #-514	; 0xfffffdfe
 940:	02000000 	andeq	r0, r0, #0
 944:	2b0b1423 	blcs	2c59d8 <init_adc+0x2c59d8>
 948:	06000001 	streq	r0, [r0], -r1
 94c:	d4110203 	ldrle	r0, [r1], #-515	; 0xfffffdfd
 950:	02000000 	andeq	r0, r0, #0
 954:	10001823 	andne	r1, r0, r3, lsr #16
 958:	00000259 	andeq	r0, r0, r9, asr r2
 95c:	03020406 	movweq	r0, #9222	; 0x2406
 960:	000008de 	ldrdeq	r0, [r0], -lr
 964:	00036315 	andeq	r6, r3, r5, lsl r3
 968:	1a0a0700 	bne	282570 <init_adc+0x282570>
 96c:	000000d4 	ldrdeq	r0, [r0], -r4
 970:	00000305 	andeq	r0, r0, r5, lsl #6
 974:	3b160000 	blcc	58097c <init_adc+0x58097c>
 978:	02000000 	andeq	r0, r0, #0
 97c:	00c81106 	sbceq	r1, r8, r6, lsl #2
 980:	01010000 	mrseq	r0, (UNDEF: 1)
 984:	00097617 	andeq	r7, r9, r7, lsl r6
 988:	0a1d0300 	beq	741590 <init_adc+0x741590>
 98c:	00000305 	andeq	r0, r0, r5, lsl #6
 990:	a20d0000 	andge	r0, sp, #0
 994:	a2000009 	andge	r0, r0, #9
 998:	0e000009 	cdpeq	0, 0, cr0, cr0, cr9, {0}
 99c:	00000098 	muleq	r0, r8, r0
 9a0:	0102001b 	tsteq	r2, fp, lsl r0
 9a4:	00029d08 	andeq	r9, r2, r8, lsl #26
 9a8:	736d1800 	cmnvc	sp, #0, 16
 9ac:	23030067 	movwcs	r0, #12391	; 0x3067
 9b0:	00099206 	andeq	r9, r9, r6, lsl #4
 9b4:	03050100 	movweq	r0, #20736	; 0x5100
 9b8:	00000000 	andeq	r0, r0, r0
 9bc:	00050e19 	andeq	r0, r5, r9, lsl lr
 9c0:	05250300 	streq	r0, [r5, #-768]!	; 0xfffffd00
 9c4:	00000091 	muleq	r0, r1, r0
 9c8:	00030501 	andeq	r0, r3, r1, lsl #10
 9cc:	19000000 	stmdbne	r0, {}	; <UNPREDICTABLE>
 9d0:	00000267 	andeq	r0, r0, r7, ror #4
 9d4:	b00a2703 	andlt	r2, sl, r3, lsl #14
 9d8:	01000000 	mrseq	r0, (UNDEF: 0)
 9dc:	00000305 	andeq	r0, r0, r5, lsl #6
 9e0:	011a0000 	tsteq	sl, r0
 9e4:	0000066e 	andeq	r0, r0, lr, ror #12
 9e8:	01057203 	tsteq	r5, r3, lsl #4
 9ec:	00000091 	muleq	r0, r1, r0
 9f0:	00000000 	andeq	r0, r0, r0
 9f4:	0000008c 	andeq	r0, r0, ip, lsl #1
 9f8:	00000000 	andeq	r0, r0, r0
 9fc:	000a1101 	andeq	r1, sl, r1, lsl #2
 a00:	65721b00 	ldrbvs	r1, [r2, #-2816]!	; 0xfffff500
 a04:	77030074 	smlsdxvc	r3, r4, r0, r0
 a08:	00009109 	andeq	r9, r0, r9, lsl #2
 a0c:	74910200 	ldrvc	r0, [r1], #512	; 0x200
 a10:	a5011c00 	strge	r1, [r1, #-3072]	; 0xfffff400
 a14:	03000006 	movweq	r0, #6
 a18:	0000066b 	andeq	r0, r0, fp, ror #12
 a1c:	00280000 	eoreq	r0, r8, r0
 a20:	00380000 	eorseq	r0, r8, r0
 a24:	1d010000 	stcne	0, cr0, [r1, #-0]
 a28:	0006d101 	andeq	sp, r6, r1, lsl #2
 a2c:	06480300 	strbeq	r0, [r8], -r0, lsl #6
 a30:	00000001 	andeq	r0, r0, r1
 a34:	0000b000 	andeq	fp, r0, r0
 a38:	00007c00 	andeq	r7, r0, r0, lsl #24
 a3c:	011e0100 	tsteq	lr, r0, lsl #2
 a40:	000002d8 	ldrdeq	r0, [r0], -r8
 a44:	01062d03 	tsteq	r6, r3, lsl #26
 a48:	00000000 	andeq	r0, r0, r0
 a4c:	000000a8 	andeq	r0, r0, r8, lsr #1
 a50:	000000a8 	andeq	r0, r0, r8, lsr #1
 a54:	05e21f01 	strbeq	r1, [r2, #3841]!	; 0xf01
 a58:	0d020000 	stceq	0, cr0, [r2, #-0]
 a5c:	00000114 	andeq	r0, r0, r4, lsl r1
 a60:	00740000 	rsbseq	r0, r4, r0
 a64:	00ec0000 	rsceq	r0, ip, r0
 a68:	8e010000 	cdphi	0, 0, cr0, cr1, cr0, {0}
 a6c:	2000000a 	andcs	r0, r0, sl
 a70:	0000009a 	muleq	r0, sl, r0
 a74:	c8290d02 	stmdagt	r9!, {r1, r8, sl, fp}
 a78:	02000000 	andeq	r0, r0, #0
 a7c:	4f156c91 	svcmi	0x00156c91
 a80:	02000002 	andeq	r0, r0, #2
 a84:	00c80e1b 	sbceq	r0, r8, fp, lsl lr
 a88:	91020000 	mrsls	r0, (UNDEF: 2)
 a8c:	40210074 	eormi	r0, r1, r4, ror r0
 a90:	01000002 	tsteq	r0, r2
 a94:	011a072a 	tsteq	sl, sl, lsr #14
 a98:	000000c8 	andeq	r0, r0, r8, asr #1
 a9c:	00000000 	andeq	r0, r0, r0
 aa0:	00000044 	andeq	r0, r0, r4, asr #32
 aa4:	0000013c 	andeq	r0, r0, ip, lsr r1
 aa8:	000abe01 	andeq	fp, sl, r1, lsl #28
 aac:	027c2200 	rsbseq	r2, ip, #0, 4
 ab0:	2a010000 	bcs	40ab8 <init_adc+0x40ab8>
 ab4:	00c83207 	sbceq	r3, r8, r7, lsl #4
 ab8:	91020000 	mrsls	r0, (UNDEF: 2)
 abc:	50230074 	eorpl	r0, r3, r4, ror r0
 ac0:	01000000 	mrseq	r0, (UNDEF: 0)
 ac4:	01160667 	tsteq	r6, r7, ror #12
 ac8:	00000000 	andeq	r0, r0, r0
 acc:	00000054 	andeq	r0, r0, r4, asr r0
 ad0:	0000018c 	andeq	r0, r0, ip, lsl #3
 ad4:	000afa01 	andeq	pc, sl, r1, lsl #20
 ad8:	01a42200 			; <UNDEFINED> instruction: 0x01a42200
 adc:	67010000 	strvs	r0, [r1, -r0]
 ae0:	022c3306 	eoreq	r3, ip, #402653184	; 0x18000000
 ae4:	91020000 	mrsls	r0, (UNDEF: 2)
 ae8:	04f82277 	ldrbteq	r2, [r8], #631	; 0x277
 aec:	67010000 	strvs	r0, [r1, -r0]
 af0:	00c84206 	sbceq	r4, r8, r6, lsl #4
 af4:	91020000 	mrsls	r0, (UNDEF: 2)
 af8:	a1240070 			; <UNDEFINED> instruction: 0xa1240070
 afc:	01000005 	tsteq	r0, r5
 b00:	011605e7 	tsteq	r6, r7, ror #11
 b04:	00000000 	andeq	r0, r0, r0
 b08:	00000038 	andeq	r0, r0, r8, lsr r0
 b0c:	000001e8 	andeq	r0, r0, r8, ror #3
 b10:	01a42201 			; <UNDEFINED> instruction: 0x01a42201
 b14:	e7010000 	str	r0, [r1, -r0]
 b18:	022c3105 	eoreq	r3, ip, #1073741825	; 0x40000001
 b1c:	91020000 	mrsls	r0, (UNDEF: 2)
 b20:	Address 0x0000000000000b20 is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	25011101 	strcs	r1, [r1, #-257]	; 0xfffffeff
   4:	030b130e 	movweq	r1, #45838	; 0xb30e
   8:	550e1b0e 	strpl	r1, [lr, #-2830]	; 0xfffff4f2
   c:	52011106 	andpl	r1, r1, #-2147483647	; 0x80000001
  10:	00061001 	andeq	r1, r6, r1
  14:	00240200 	eoreq	r0, r4, r0, lsl #4
  18:	0b3e0b0b 	bleq	f82c4c <init_adc+0xf82c4c>
  1c:	00000e03 	andeq	r0, r0, r3, lsl #28
  20:	03001603 	movweq	r1, #1539	; 0x603
  24:	3b0b3a0e 	blcc	2ce864 <init_adc+0x2ce864>
  28:	490b390b 	stmdbmi	fp, {r0, r1, r3, r8, fp, ip, sp}
  2c:	04000013 	streq	r0, [r0], #-19	; 0xffffffed
  30:	0b0b0024 	bleq	2c00c8 <init_adc+0x2c00c8>
  34:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
  38:	35050000 	strcc	r0, [r5, #-0]
  3c:	00134900 	andseq	r4, r3, r0, lsl #18
  40:	00260600 	eoreq	r0, r6, r0, lsl #12
  44:	00001349 	andeq	r1, r0, r9, asr #6
  48:	3e010407 	cdpcc	4, 0, cr0, cr1, cr7, {0}
  4c:	490b0b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp}
  50:	3b0b3a13 	blcc	2ce8a4 <init_adc+0x2ce8a4>
  54:	010b390b 	tsteq	fp, fp, lsl #18
  58:	08000013 	stmdaeq	r0, {r0, r1, r4}
  5c:	0e030028 	cdpeq	0, 0, cr0, cr3, cr8, {1}
  60:	00000d1c 	andeq	r0, r0, ip, lsl sp
  64:	03002809 	movweq	r2, #2057	; 0x809
  68:	000b1c0e 	andeq	r1, fp, lr, lsl #24
  6c:	01130a00 	tsteq	r3, r0, lsl #20
  70:	0b3a050b 	bleq	e814a4 <init_adc+0xe814a4>
  74:	0b39053b 	bleq	e41568 <init_adc+0xe41568>
  78:	00001301 	andeq	r1, r0, r1, lsl #6
  7c:	03000d0b 	movweq	r0, #3339	; 0xd0b
  80:	3b0b3a0e 	blcc	2ce8c0 <init_adc+0x2ce8c0>
  84:	490b3905 	stmdbmi	fp, {r0, r2, r8, fp, ip, sp}
  88:	000a3813 	andeq	r3, sl, r3, lsl r8
  8c:	000d0c00 	andeq	r0, sp, r0, lsl #24
  90:	0b3a0803 	bleq	e820a4 <init_adc+0xe820a4>
  94:	0b39053b 	bleq	e41588 <init_adc+0xe41588>
  98:	0a381349 	beq	e04dc4 <init_adc+0xe04dc4>
  9c:	010d0000 	mrseq	r0, (UNDEF: 13)
  a0:	01134901 	tsteq	r3, r1, lsl #18
  a4:	0e000013 	mcreq	0, 0, r0, cr0, cr3, {0}
  a8:	13490021 	movtne	r0, #36897	; 0x9021
  ac:	00000b2f 	andeq	r0, r0, pc, lsr #22
  b0:	4900210f 	stmdbmi	r0, {r0, r1, r2, r3, r8, sp}
  b4:	00052f13 	andeq	r2, r5, r3, lsl pc
  b8:	00161000 	andseq	r1, r6, r0
  bc:	0b3a0e03 	bleq	e838d0 <init_adc+0xe838d0>
  c0:	0b39053b 	bleq	e415b4 <init_adc+0xe415b4>
  c4:	00001349 	andeq	r1, r0, r9, asr #6
  c8:	0b011311 	bleq	44d14 <init_adc+0x44d14>
  cc:	3b0b3a0b 	blcc	2ce900 <init_adc+0x2ce900>
  d0:	010b3905 	tsteq	fp, r5, lsl #18
  d4:	12000013 	andne	r0, r0, #19
  d8:	0b0b0113 	bleq	2c052c <init_adc+0x2c052c>
  dc:	0b3b0b3a 	bleq	ec2dcc <init_adc+0xec2dcc>
  e0:	13010b39 	movwne	r0, #6969	; 0x1b39
  e4:	0d130000 	ldceq	0, cr0, [r3, #-0]
  e8:	3a080300 	bcc	200cf0 <init_adc+0x200cf0>
  ec:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  f0:	3813490b 	ldmdacc	r3, {r0, r1, r3, r8, fp, lr}
  f4:	1400000a 	strne	r0, [r0], #-10
  f8:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
  fc:	0b3b0b3a 	bleq	ec2dec <init_adc+0xec2dec>
 100:	13490b39 	movtne	r0, #39737	; 0x9b39
 104:	00000a38 	andeq	r0, r0, r8, lsr sl
 108:	03003415 	movweq	r3, #1045	; 0x415
 10c:	3b0b3a0e 	blcc	2ce94c <init_adc+0x2ce94c>
 110:	490b390b 	stmdbmi	fp, {r0, r1, r3, r8, fp, ip, sp}
 114:	000a0213 	andeq	r0, sl, r3, lsl r2
 118:	00341600 	eorseq	r1, r4, r0, lsl #12
 11c:	0b3a0e03 	bleq	e83930 <init_adc+0xe83930>
 120:	0b390b3b 	bleq	e42e14 <init_adc+0xe42e14>
 124:	0c3f1349 	ldceq	3, cr1, [pc], #-292	; 8 <.debug_abbrev+0x8>
 128:	00000c3c 	andeq	r0, r0, ip, lsr ip
 12c:	47003417 	smladmi	r0, r7, r4, r3
 130:	3b0b3a13 	blcc	2ce984 <init_adc+0x2ce984>
 134:	020b390b 	andeq	r3, fp, #180224	; 0x2c000
 138:	1800000a 	stmdane	r0, {r1, r3}
 13c:	08030034 	stmdaeq	r3, {r2, r4, r5}
 140:	0b3b0b3a 	bleq	ec2e30 <init_adc+0xec2e30>
 144:	13490b39 	movtne	r0, #39737	; 0x9b39
 148:	0a020c3f 	beq	8324c <init_adc+0x8324c>
 14c:	34190000 	ldrcc	r0, [r9], #-0
 150:	3a0e0300 	bcc	380d58 <init_adc+0x380d58>
 154:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 158:	3f13490b 	svccc	0x0013490b
 15c:	000a020c 	andeq	r0, sl, ip, lsl #4
 160:	012e1a00 			; <UNDEFINED> instruction: 0x012e1a00
 164:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 168:	0b3b0b3a 	bleq	ec2e58 <init_adc+0xec2e58>
 16c:	0c270b39 			; <UNDEFINED> instruction: 0x0c270b39
 170:	01111349 	tsteq	r1, r9, asr #6
 174:	06400112 			; <UNDEFINED> instruction: 0x06400112
 178:	010c4296 			; <UNDEFINED> instruction: 0x010c4296
 17c:	1b000013 	blne	1d0 <.debug_abbrev+0x1d0>
 180:	08030034 	stmdaeq	r3, {r2, r4, r5}
 184:	0b3b0b3a 	bleq	ec2e74 <init_adc+0xec2e74>
 188:	13490b39 	movtne	r0, #39737	; 0x9b39
 18c:	00000a02 	andeq	r0, r0, r2, lsl #20
 190:	3f002e1c 	svccc	0x00002e1c
 194:	3a0e030c 	bcc	380dcc <init_adc+0x380dcc>
 198:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 19c:	1201110b 	andne	r1, r1, #-1073741822	; 0xc0000002
 1a0:	97064001 	strls	r4, [r6, -r1]
 1a4:	00000c42 	andeq	r0, r0, r2, asr #24
 1a8:	3f002e1d 	svccc	0x00002e1d
 1ac:	3a0e030c 	bcc	380de4 <init_adc+0x380de4>
 1b0:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 1b4:	110c270b 	tstne	ip, fp, lsl #14
 1b8:	40011201 	andmi	r1, r1, r1, lsl #4
 1bc:	0c429606 	mcrreq	6, 0, r9, r2, cr6
 1c0:	2e1e0000 	cdpcs	0, 1, cr0, cr14, cr0, {0}
 1c4:	030c3f00 	movweq	r3, #52992	; 0xcf00
 1c8:	3b0b3a0e 	blcc	2cea08 <init_adc+0x2cea08>
 1cc:	270b390b 	strcs	r3, [fp, -fp, lsl #18]
 1d0:	1201110c 	andne	r1, r1, #12, 2
 1d4:	97064001 	strls	r4, [r6, -r1]
 1d8:	00000c42 	andeq	r0, r0, r2, asr #24
 1dc:	03012e1f 	movweq	r2, #7711	; 0x1e1f
 1e0:	3b0b3a0e 	blcc	2cea20 <init_adc+0x2cea20>
 1e4:	270b390b 	strcs	r3, [fp, -fp, lsl #18]
 1e8:	1201110c 	andne	r1, r1, #12, 2
 1ec:	96064001 	strls	r4, [r6], -r1
 1f0:	13010c42 	movwne	r0, #7234	; 0x1c42
 1f4:	05200000 	streq	r0, [r0, #-0]!
 1f8:	3a0e0300 	bcc	380e00 <init_adc+0x380e00>
 1fc:	390b3b0b 	stmdbcc	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 200:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 204:	2100000a 	tstcs	r0, sl
 208:	0e03012e 	adfeqsp	f0, f3, #0.5
 20c:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 210:	0c270b39 			; <UNDEFINED> instruction: 0x0c270b39
 214:	01111349 	tsteq	r1, r9, asr #6
 218:	06400112 			; <UNDEFINED> instruction: 0x06400112
 21c:	010c4296 			; <UNDEFINED> instruction: 0x010c4296
 220:	22000013 	andcs	r0, r0, #19
 224:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 228:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xfffff4c6
 22c:	13490b39 	movtne	r0, #39737	; 0x9b39
 230:	00000a02 	andeq	r0, r0, r2, lsl #20
 234:	03012e23 	movweq	r2, #7715	; 0x1e23
 238:	3b0b3a0e 	blcc	2cea78 <init_adc+0x2cea78>
 23c:	270b3905 	strcs	r3, [fp, -r5, lsl #18]
 240:	1201110c 	andne	r1, r1, #12, 2
 244:	97064001 	strls	r4, [r6, -r1]
 248:	13010c42 	movwne	r0, #7234	; 0x1c42
 24c:	2e240000 	cdpcs	0, 2, cr0, cr4, cr0, {0}
 250:	3a0e0301 	bcc	380e5c <init_adc+0x380e5c>
 254:	39053b0b 	stmdbcc	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 258:	110c270b 	tstne	ip, fp, lsl #14
 25c:	40011201 	andmi	r1, r1, r1, lsl #4
 260:	0c429706 	mcrreq	7, 0, r9, r2, cr6
 264:	Address 0x0000000000000264 is out of bounds.


Disassembly of section .debug_loc:

00000000 <.debug_loc>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000002 	andeq	r0, r0, r2
   8:	007d0002 	rsbseq	r0, sp, r2
   c:	00000002 	andeq	r0, r0, r2
  10:	00000004 	andeq	r0, r0, r4
  14:	087d0002 	ldmdaeq	sp!, {r1}^
  18:	00000004 	andeq	r0, r0, r4
  1c:	00000006 	andeq	r0, r0, r6
  20:	107d0002 	rsbsne	r0, sp, r2
  24:	00000006 	andeq	r0, r0, r6
  28:	0000008c 	andeq	r0, r0, ip, lsl #1
  2c:	10770002 	rsbsne	r0, r7, r2
	...
  3c:	00000002 	andeq	r0, r0, r2
  40:	007d0002 	rsbseq	r0, sp, r2
  44:	00000002 	andeq	r0, r0, r2
  48:	00000004 	andeq	r0, r0, r4
  4c:	047d0002 	ldrbteq	r0, [sp], #-2
  50:	00000004 	andeq	r0, r0, r4
  54:	00000018 	andeq	r0, r0, r8, lsl r0
  58:	04770002 	ldrbteq	r0, [r7], #-2
  5c:	00000018 	andeq	r0, r0, r8, lsl r0
  60:	0000001a 	andeq	r0, r0, sl, lsl r0
  64:	047d0002 	ldrbteq	r0, [sp], #-2
  68:	0000001a 	andeq	r0, r0, sl, lsl r0
  6c:	00000028 	andeq	r0, r0, r8, lsr #32
  70:	007d0002 	rsbseq	r0, sp, r2
	...
  80:	00000002 	andeq	r0, r0, r2
  84:	007d0002 	rsbseq	r0, sp, r2
  88:	00000002 	andeq	r0, r0, r2
  8c:	00000004 	andeq	r0, r0, r4
  90:	087d0002 	ldmdaeq	sp!, {r1}^
  94:	00000004 	andeq	r0, r0, r4
  98:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
  9c:	08770002 	ldmdaeq	r7!, {r1}^
	...
  ac:	00000002 	andeq	r0, r0, r2
  b0:	007d0002 	rsbseq	r0, sp, r2
  b4:	00000002 	andeq	r0, r0, r2
  b8:	00000004 	andeq	r0, r0, r4
  bc:	047d0002 	ldrbteq	r0, [sp], #-2
  c0:	00000004 	andeq	r0, r0, r4
  c4:	00000094 	muleq	r0, r4, r0
  c8:	04770002 	ldrbteq	r0, [r7], #-2
  cc:	00000094 	muleq	r0, r4, r0
  d0:	00000096 	muleq	r0, r6, r0
  d4:	047d0002 	ldrbteq	r0, [sp], #-2
  d8:	00000096 	muleq	r0, r6, r0
  dc:	000000a8 	andeq	r0, r0, r8, lsr #1
  e0:	007d0002 	rsbseq	r0, sp, r2
	...
  f0:	00000002 	andeq	r0, r0, r2
  f4:	007d0002 	rsbseq	r0, sp, r2
  f8:	00000002 	andeq	r0, r0, r2
  fc:	00000004 	andeq	r0, r0, r4
 100:	087d0002 	ldmdaeq	sp!, {r1}^
 104:	00000004 	andeq	r0, r0, r4
 108:	00000006 	andeq	r0, r0, r6
 10c:	187d0002 	ldmdane	sp!, {r1}^
 110:	00000006 	andeq	r0, r0, r6
 114:	00000060 	andeq	r0, r0, r0, rrx
 118:	18770002 	ldmdane	r7!, {r1}^
 11c:	00000060 	andeq	r0, r0, r0, rrx
 120:	00000062 	andeq	r0, r0, r2, rrx
 124:	08770002 	ldmdaeq	r7!, {r1}^
 128:	00000062 	andeq	r0, r0, r2, rrx
 12c:	00000074 	andeq	r0, r0, r4, ror r0
 130:	087d0002 	ldmdaeq	sp!, {r1}^
	...
 140:	00000002 	andeq	r0, r0, r2
 144:	007d0002 	rsbseq	r0, sp, r2
 148:	00000002 	andeq	r0, r0, r2
 14c:	00000004 	andeq	r0, r0, r4
 150:	087d0002 	ldmdaeq	sp!, {r1}^
 154:	00000004 	andeq	r0, r0, r4
 158:	00000006 	andeq	r0, r0, r6
 15c:	107d0002 	rsbsne	r0, sp, r2
 160:	00000006 	andeq	r0, r0, r6
 164:	0000003a 	andeq	r0, r0, sl, lsr r0
 168:	10770002 	rsbsne	r0, r7, r2
 16c:	0000003a 	andeq	r0, r0, sl, lsr r0
 170:	0000003c 	andeq	r0, r0, ip, lsr r0
 174:	08770002 	ldmdaeq	r7!, {r1}^
 178:	0000003c 	andeq	r0, r0, ip, lsr r0
 17c:	00000044 	andeq	r0, r0, r4, asr #32
 180:	087d0002 	ldmdaeq	sp!, {r1}^
	...
 190:	00000002 	andeq	r0, r0, r2
 194:	007d0002 	rsbseq	r0, sp, r2
 198:	00000002 	andeq	r0, r0, r2
 19c:	00000004 	andeq	r0, r0, r4
 1a0:	047d0002 	ldrbteq	r0, [sp], #-2
 1a4:	00000004 	andeq	r0, r0, r4
 1a8:	00000006 	andeq	r0, r0, r6
 1ac:	107d0002 	rsbsne	r0, sp, r2
 1b0:	00000006 	andeq	r0, r0, r6
 1b4:	00000044 	andeq	r0, r0, r4, asr #32
 1b8:	10770002 	rsbsne	r0, r7, r2
 1bc:	00000044 	andeq	r0, r0, r4, asr #32
 1c0:	00000046 	andeq	r0, r0, r6, asr #32
 1c4:	04770002 	ldrbteq	r0, [r7], #-2
 1c8:	00000046 	andeq	r0, r0, r6, asr #32
 1cc:	00000048 	andeq	r0, r0, r8, asr #32
 1d0:	047d0002 	ldrbteq	r0, [sp], #-2
 1d4:	00000048 	andeq	r0, r0, r8, asr #32
 1d8:	00000054 	andeq	r0, r0, r4, asr r0
 1dc:	007d0002 	rsbseq	r0, sp, r2
	...
 1ec:	00000002 	andeq	r0, r0, r2
 1f0:	007d0002 	rsbseq	r0, sp, r2
 1f4:	00000002 	andeq	r0, r0, r2
 1f8:	00000004 	andeq	r0, r0, r4
 1fc:	047d0002 	ldrbteq	r0, [sp], #-2
 200:	00000004 	andeq	r0, r0, r4
 204:	00000006 	andeq	r0, r0, r6
 208:	107d0002 	rsbsne	r0, sp, r2
 20c:	00000006 	andeq	r0, r0, r6
 210:	0000002e 	andeq	r0, r0, lr, lsr #32
 214:	10770002 	rsbsne	r0, r7, r2
 218:	0000002e 	andeq	r0, r0, lr, lsr #32
 21c:	00000030 	andeq	r0, r0, r0, lsr r0
 220:	04770002 	ldrbteq	r0, [r7], #-2
 224:	00000030 	andeq	r0, r0, r0, lsr r0
 228:	00000032 	andeq	r0, r0, r2, lsr r0
 22c:	047d0002 	ldrbteq	r0, [sp], #-2
 230:	00000032 	andeq	r0, r0, r2, lsr r0
 234:	00000038 	andeq	r0, r0, r8, lsr r0
 238:	007d0002 	rsbseq	r0, sp, r2
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	00000054 	andeq	r0, r0, r4, asr r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
	...
  14:	00000038 	andeq	r0, r0, r8, lsr r0
  18:	00000000 	andeq	r0, r0, r0
  1c:	00000054 	andeq	r0, r0, r4, asr r0
  20:	00000000 	andeq	r0, r0, r0
  24:	00000044 	andeq	r0, r0, r4, asr #32
  28:	00000000 	andeq	r0, r0, r0
  2c:	00000074 	andeq	r0, r0, r4, ror r0
  30:	00000000 	andeq	r0, r0, r0
  34:	000000a8 	andeq	r0, r0, r8, lsr #1
  38:	00000000 	andeq	r0, r0, r0
  3c:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
  40:	00000000 	andeq	r0, r0, r0
  44:	00000028 	andeq	r0, r0, r8, lsr #32
  48:	00000000 	andeq	r0, r0, r0
  4c:	0000008c 	andeq	r0, r0, ip, lsl #1
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000038 	andeq	r0, r0, r8, lsr r0
   8:	00000000 	andeq	r0, r0, r0
   c:	00000054 	andeq	r0, r0, r4, asr r0
  10:	00000000 	andeq	r0, r0, r0
  14:	00000044 	andeq	r0, r0, r4, asr #32
  18:	00000000 	andeq	r0, r0, r0
  1c:	00000074 	andeq	r0, r0, r4, ror r0
  20:	00000000 	andeq	r0, r0, r0
  24:	000000a8 	andeq	r0, r0, r8, lsr #1
  28:	00000000 	andeq	r0, r0, r0
  2c:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
  30:	00000000 	andeq	r0, r0, r0
  34:	00000028 	andeq	r0, r0, r8, lsr #32
  38:	00000000 	andeq	r0, r0, r0
  3c:	0000008c 	andeq	r0, r0, ip, lsl #1
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	000002ea 	andeq	r0, r0, sl, ror #5
   4:	00da0003 	sbcseq	r0, sl, r3
   8:	01020000 	mrseq	r0, (UNDEF: 2)
   c:	000d0efb 	strdeq	r0, [sp], -fp
  10:	01010101 	tsteq	r1, r1, lsl #2
  14:	01000000 	mrseq	r0, (UNDEF: 0)
  18:	69010000 	stmdbvs	r1, {}	; <UNPREDICTABLE>
  1c:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
  20:	73006564 	movwvc	r6, #1380	; 0x564
  24:	2f006372 	svccs	0x00006372
  28:	6c707041 	ldclvs	0, cr7, [r0], #-260	; 0xfffffefc
  2c:	74616369 	strbtvc	r6, [r1], #-873	; 0xfffffc97
  30:	736e6f69 	cmnvc	lr, #420	; 0x1a4
  34:	4d52412f 	ldfmie	f4, [r2, #-188]	; 0xffffff44
  38:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
  3c:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
  40:	61652d65 	cmnvs	r5, r5, ror #26
  44:	692f6962 	stmdbvs	pc!, {r1, r5, r6, r8, fp, sp, lr}	; <UNPREDICTABLE>
  48:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
  4c:	6d2f6564 	cfstr32vs	mvfx6, [pc, #-400]!	; fffffec4 <init_adc+0xfffffec4>
  50:	69686361 	stmdbvs	r8!, {r0, r5, r6, r8, r9, sp, lr}^
  54:	2f00656e 	svccs	0x0000656e
  58:	6c707041 	ldclvs	0, cr7, [r0], #-260	; 0xfffffefc
  5c:	74616369 	strbtvc	r6, [r1], #-873	; 0xfffffc97
  60:	736e6f69 	cmnvc	lr, #420	; 0x1a4
  64:	4d52412f 	ldfmie	f4, [r2, #-188]	; 0xffffff44
  68:	6d72612f 	ldfvse	f6, [r2, #-188]!	; 0xffffff44
  6c:	6e6f6e2d 	cdpvs	14, 6, cr6, cr15, cr13, {1}
  70:	61652d65 	cmnvs	r5, r5, ror #26
  74:	692f6962 	stmdbvs	pc!, {r1, r5, r6, r8, fp, sp, lr}	; <UNPREDICTABLE>
  78:	756c636e 	strbvc	r6, [ip, #-878]!	; 0xfffffc92
  7c:	732f6564 			; <UNDEFINED> instruction: 0x732f6564
  80:	00007379 	andeq	r7, r0, r9, ror r3
  84:	65726f63 	ldrbvs	r6, [r2, #-3939]!	; 0xfffff09d
  88:	336d635f 	cmncc	sp, #2080374785	; 0x7c000001
  8c:	0100682e 	tsteq	r0, lr, lsr #16
  90:	61750000 	cmnvs	r5, r0
  94:	682e7472 	stmdavs	lr!, {r1, r4, r5, r6, sl, ip, sp, lr}
  98:	00000100 	andeq	r0, r0, r0, lsl #2
  9c:	6e69616d 	powvsez	f6, f1, #5.0
  a0:	0200632e 	andeq	r6, r0, #-1207959552	; 0xb8000000
  a4:	645f0000 	ldrbvs	r0, [pc], #-0	; ac <.debug_line+0xac>
  a8:	75616665 	strbvc	r6, [r1, #-1637]!	; 0xfffff99b
  ac:	745f746c 	ldrbvc	r7, [pc], #-1132	; b4 <.debug_line+0xb4>
  b0:	73657079 	cmnvc	r5, #121	; 0x79
  b4:	0300682e 	movweq	r6, #2094	; 0x82e
  b8:	735f0000 	cmpvc	pc, #0
  bc:	6e696474 	mcrvs	4, 3, r6, cr9, cr4, {3}
  c0:	00682e74 	rsbeq	r2, r8, r4, ror lr
  c4:	73000004 	movwvc	r0, #4
  c8:	32336d74 	eorscc	r6, r3, #116, 26	; 0x1d00
  cc:	33303166 	teqcc	r0, #-2147483623	; 0x80000019
  d0:	682e6278 	stmdavs	lr!, {r3, r4, r5, r6, r9, sp, lr}
  d4:	00000100 	andeq	r0, r0, r0, lsl #2
  d8:	656d6974 	strbvs	r6, [sp, #-2420]!	; 0xfffff68c
  dc:	00682e72 	rsbeq	r2, r8, r2, ror lr
  e0:	00000001 	andeq	r0, r0, r1
  e4:	05000105 	streq	r0, [r0, #-261]	; 0xfffffefb
  e8:	00000002 	andeq	r0, r0, r2
  ec:	0be70300 	bleq	ff9c0cf4 <init_adc+0xff9c0cf4>
  f0:	59060501 	stmdbpl	r6, {r0, r8, sl}
  f4:	054c5105 	strbeq	r5, [ip, #-261]	; 0xfffffefb
  f8:	12053c09 	andne	r3, r5, #2304	; 0x900
  fc:	2e220520 	cfsh64cs	mvdx0, mvdx2, #16
 100:	05202d05 	streq	r2, [r0, #-3333]!	; 0xfffff2fb
 104:	01053c2b 	tsteq	r5, fp, lsr #24
 108:	00070230 	andeq	r0, r7, r0, lsr r2
 10c:	01050101 	tsteq	r5, r1, lsl #2
 110:	00020500 	andeq	r0, r2, r0, lsl #10
 114:	03000000 	movweq	r0, #0
 118:	05010ce7 	streq	r0, [r1, #-3303]	; 0xfffff319
 11c:	30056706 	andcc	r6, r5, r6, lsl #14
 120:	2e09054c 	cfsh32cs	mvfx0, mvfx9, #44
 124:	05200f05 	streq	r0, [r0, #-3845]!	; 0xfffff0fb
 128:	2e052e30 	mcrcs	14, 0, r2, cr5, cr0, {1}
 12c:	4201052e 	andmi	r0, r1, #192937984	; 0xb800000
 130:	051e3005 	ldreq	r3, [lr, #-5]
 134:	20052e08 	andcs	r2, r5, r8, lsl #28
 138:	3c280520 	cfstr32cc	mvfx0, [r8], #-128	; 0xffffff80
 13c:	05203005 	streq	r3, [r0, #-5]!
 140:	01052e2e 	tsteq	r5, lr, lsr #28
 144:	000a0230 	andeq	r0, sl, r0, lsr r2
 148:	01050101 	tsteq	r5, r1, lsl #2
 14c:	00020500 	andeq	r0, r2, r0, lsl #10
 150:	03000000 	movweq	r0, #0
 154:	05010eaa 	streq	r0, [r1, #-3754]	; 0xfffff156
 158:	06054b0e 	streq	r4, [r5], -lr, lsl #22
 15c:	3e0c052e 	cfsh32cc	mvfx0, mvfx12, #30
 160:	05310a05 	ldreq	r0, [r1, #-2565]!	; 0xfffff5fb
 164:	12052014 	andne	r2, r5, #20
 168:	2103052e 	tstcs	r3, lr, lsr #10
 16c:	05590a05 	ldrbeq	r0, [r9, #-2565]	; 0xfffff5fb
 170:	0a052012 	beq	1481c0 <init_adc+0x1481c0>
 174:	2012052f 	andscs	r0, r2, pc, lsr #10
 178:	05310a05 	ldreq	r0, [r1, #-2565]!	; 0xfffff5fb
 17c:	07022101 	streq	r2, [r2, -r1, lsl #2]
 180:	04010100 	streq	r0, [r1], #-256	; 0xffffff00
 184:	00010502 	andeq	r0, r1, r2, lsl #10
 188:	00000205 	andeq	r0, r0, r5, lsl #4
 18c:	0d030000 	stceq	0, cr0, [r3, #-0]
 190:	4c120501 	cfldr32mi	mvfx0, [r2], {1}
 194:	69851005 	stmibvs	r5, {r0, r2, ip}
 198:	68150569 	ldmdavs	r5, {r0, r3, r5, r6, r8, sl}
 19c:	052e0e05 	streq	r0, [lr, #-3589]!	; 0xfffff1fb
 1a0:	11054c0b 	tstne	r5, fp, lsl #24
 1a4:	310b0520 	tstcc	fp, r0, lsr #10
 1a8:	05201105 	streq	r1, [r0, #-261]!	; 0xfffffefb
 1ac:	01053f05 	tsteq	r5, r5, lsl #30
 1b0:	000c023d 	andeq	r0, ip, sp, lsr r2
 1b4:	03040101 	movweq	r0, #16641	; 0x4101
 1b8:	05000105 	streq	r0, [r0, #-261]	; 0xfffffefb
 1bc:	00000002 	andeq	r0, r0, r2
 1c0:	012d0300 			; <UNDEFINED> instruction: 0x012d0300
 1c4:	052f1005 	streq	r1, [pc, #-5]!	; 1c7 <.debug_line+0x1c7>
 1c8:	0567670f 	strbeq	r6, [r7, #-1807]!	; 0xfffff8f1
 1cc:	0b054b0d 	bleq	152e08 <init_adc+0x152e08>
 1d0:	00110567 	andseq	r0, r1, r7, ror #10
 1d4:	20010402 	andcs	r0, r1, r2, lsl #8
 1d8:	02001605 	andeq	r1, r0, #5242880	; 0x500000
 1dc:	052e0104 	streq	r0, [lr, #-260]!	; 0xfffffefc
 1e0:	0402000b 	streq	r0, [r2], #-11
 1e4:	0f052e01 	svceq	0x00052e01
 1e8:	0d056731 	stceq	7, cr6, [r5, #-196]	; 0xffffff3c
 1ec:	670b0567 	strvs	r0, [fp, -r7, ror #10]
 1f0:	02001105 	andeq	r1, r0, #1073741825	; 0x40000001
 1f4:	05200104 	streq	r0, [r0, #-260]!	; 0xfffffefc
 1f8:	04020016 	streq	r0, [r2], #-22	; 0xffffffea
 1fc:	0b052e01 	bleq	14ba08 <init_adc+0x14ba08>
 200:	01040200 	mrseq	r0, R12_usr
 204:	310f052e 	tstcc	pc, lr, lsr #10
 208:	05680b05 	strbeq	r0, [r8, #-2821]!	; 0xfffff4fb
 20c:	04020011 	streq	r0, [r2], #-17	; 0xffffffef
 210:	18052001 	stmdane	r5, {r0, sp}
 214:	01040200 	mrseq	r0, R12_usr
 218:	000b052e 	andeq	r0, fp, lr, lsr #10
 21c:	2e010402 	cdpcs	4, 0, cr0, cr1, cr2, {0}
 220:	05311505 	ldreq	r1, [r1, #-1285]!	; 0xfffffafb
 224:	0c023d01 	stceq	13, cr3, [r2], {1}
 228:	04010100 	streq	r0, [r1], #-256	; 0xffffff00
 22c:	00010503 	andeq	r0, r1, r3, lsl #10
 230:	00000205 	andeq	r0, r0, r5, lsl #4
 234:	c8030000 	stmdagt	r3, {}	; <UNPREDICTABLE>
 238:	0f050100 	svceq	0x00050100
 23c:	69120530 	ldmdbvs	r2, {r4, r5, r8, sl}
 240:	05691005 	strbeq	r1, [r9, #-5]!
 244:	0f056911 	svceq	0x00056911
 248:	05056867 	streq	r6, [r5, #-2151]	; 0xfffff799
 24c:	3f0f0567 	svccc	0x000f0567
 250:	670b0569 	strvs	r0, [fp, -r9, ror #10]
 254:	02001005 	andeq	r1, r0, #5
 258:	05200104 	streq	r0, [r0, #-260]!	; 0xfffffefc
 25c:	04020016 	streq	r0, [r2], #-22	; 0xffffffea
 260:	0b052e01 	bleq	14ba6c <init_adc+0x14ba6c>
 264:	01040200 	mrseq	r0, R12_usr
 268:	320f052e 	andcc	r0, pc, #192937984	; 0xb800000
 26c:	05670b05 	strbeq	r0, [r7, #-2821]!	; 0xfffff4fb
 270:	04020010 	streq	r0, [r2], #-16
 274:	16052001 	strne	r2, [r5], -r1
 278:	01040200 	mrseq	r0, R12_usr
 27c:	000b052e 	andeq	r0, fp, lr, lsr #10
 280:	2e010402 	cdpcs	4, 0, cr0, cr1, cr2, {0}
 284:	05320f05 	ldreq	r0, [r2, #-3845]!	; 0xfffff0fb
 288:	09026701 	stmdbeq	r2, {r0, r8, r9, sl, sp, lr}
 28c:	04010100 	streq	r0, [r1], #-256	; 0xffffff00
 290:	00010503 	andeq	r0, r1, r3, lsl #10
 294:	00000205 	andeq	r0, r0, r5, lsl #4
 298:	eb030000 	bl	c02a0 <init_adc+0xc02a0>
 29c:	0f050100 	svceq	0x00050100
 2a0:	3d15052f 	cfldr32cc	mvfx0, [r5, #-188]	; 0xffffff44
 2a4:	052e0f05 	streq	r0, [lr, #-3845]!	; 0xfffff0fb
 2a8:	0a023e01 	beq	8fab4 <init_adc+0x8fab4>
 2ac:	04010100 	streq	r0, [r1], #-256	; 0xffffff00
 2b0:	00010503 	andeq	r0, r1, r3, lsl #10
 2b4:	00000205 	andeq	r0, r0, r5, lsl #4
 2b8:	f2030000 	vhadd.s8	d0, d3, d0
 2bc:	05050100 	streq	r0, [r5, #-256]	; 0xffffff00
 2c0:	0f052f3d 	svceq	0x00052f3d
 2c4:	9e09054c 	cfsh32ls	mvfx0, mvfx9, #44
 2c8:	05210805 	streq	r0, [r1, #-2053]!	; 0xfffff7fb
 2cc:	0402000f 	streq	r0, [r2], #-15
 2d0:	05053d01 	streq	r3, [r5, #-3329]	; 0xfffff2ff
 2d4:	0d052f22 	stceq	15, cr2, [r5, #-136]	; 0xffffff78
 2d8:	2e0c053f 	mcrcs	5, 0, r0, cr12, cr15, {1}
 2dc:	75300d05 	ldrvc	r0, [r0, #-3333]!	; 0xfffff2fb
 2e0:	053d1205 	ldreq	r1, [sp, #-517]!	; 0xfffffdfb
 2e4:	0c053d17 	stceq	13, cr3, [r5], {23}
 2e8:	00120261 	andseq	r0, r2, r1, ror #4
 2ec:	Address 0x00000000000002ec is out of bounds.


Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	5f425355 	svcpl	0x00425355
   4:	435f504c 	cmpmi	pc, #76	; 0x4c
   8:	5f314e41 	svcpl	0x00314e41
   c:	5f305852 	svcpl	0x00305852
  10:	6e515249 	cdpvs	2, 5, cr5, cr1, cr9, {2}
  14:	53455200 	movtpl	r5, #20992	; 0x5200
  18:	45565245 	ldrbmi	r5, [r6, #-581]	; 0xfffffdbb
  1c:	51530044 	cmppl	r3, r4, asr #32
  20:	53003152 	movwpl	r3, #338	; 0x152
  24:	00325251 	eorseq	r5, r2, r1, asr r2
  28:	33525153 	cmpcc	r2, #-1073741804	; 0xc0000014
  2c:	42504100 	subsmi	r4, r0, #0, 2
  30:	524e4531 	subpl	r4, lr, #205520896	; 0xc400000
  34:	41504300 	cmpmi	r0, r0, lsl #6
  38:	53005243 	movwpl	r5, #579	; 0x243
  3c:	65747379 	ldrbvs	r7, [r4, #-889]!	; 0xfffffc87
  40:	726f436d 	rsbvc	r4, pc, #-1275068415	; 0xb4000001
  44:	6f6c4365 	svcvs	0x006c4365
  48:	42006b63 	andmi	r6, r0, #101376	; 0x18c00
  4c:	00525253 	subseq	r5, r2, r3, asr r2
  50:	564e5f5f 			; <UNDEFINED> instruction: 0x564e5f5f
  54:	535f4349 	cmppl	pc, #603979777	; 0x24000001
  58:	72507465 	subsvc	r7, r0, #1694498816	; 0x65000000
  5c:	69726f69 	ldmdbvs	r2!, {r0, r3, r5, r6, r8, r9, sl, fp, sp, lr}^
  60:	41007974 	tstmi	r0, r4, ror r9
  64:	52324250 	eorspl	r4, r2, #80, 4
  68:	00525453 	subseq	r5, r2, r3, asr r4
  6c:	314e4143 	cmpcc	lr, r3, asr #2
  70:	4543535f 	strbmi	r5, [r3, #-863]	; 0xfffffca1
  74:	5152495f 	cmppl	r2, pc, asr r9
  78:	4d44006e 	stclmi	0, cr0, [r4, #-440]	; 0xfffffe48
  7c:	435f3141 	cmpmi	pc, #1073741840	; 0x40000010
  80:	6e6e6168 	powvsez	f6, f6, #0.0
  84:	5f376c65 	svcpl	0x00376c65
  88:	6e515249 	cdpvs	2, 5, cr5, cr1, cr9, {2}
  8c:	43324900 	teqmi	r2, #0, 18
  90:	52455f32 	subpl	r5, r5, #50, 30	; 0xc8
  94:	5152495f 	cmppl	r2, pc, asr r9
  98:	6162006e 	cmnvs	r2, lr, rrx
  9c:	61726475 	cmnvs	r2, r5, ror r4
  a0:	54006574 	strpl	r6, [r0], #-1396	; 0xfffffa8c
  a4:	5f344d49 	svcpl	0x00344d49
  a8:	6e515249 	cdpvs	2, 5, cr5, cr1, cr9, {2}
  ac:	414d4400 	cmpmi	sp, r0, lsl #8
  b0:	68435f31 	stmdavs	r3, {r0, r4, r5, r8, r9, sl, fp, ip, lr}^
  b4:	656e6e61 	strbvs	r6, [lr, #-3681]!	; 0xfffff19f
  b8:	495f326c 	ldmdbmi	pc, {r2, r3, r5, r6, r9, ip, sp}^	; <UNPREDICTABLE>
  bc:	006e5152 	rsbeq	r5, lr, r2, asr r1
  c0:	69736e75 	ldmdbvs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
  c4:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xfffff199
  c8:	746e6920 	strbtvc	r6, [lr], #-2336	; 0xfffff6e0
  cc:	414f4c00 	cmpmi	pc, r0, lsl #24
  d0:	46440044 	strbmi	r0, [r4], -r4, asr #32
  d4:	42005253 	andmi	r5, r0, #805306373	; 0x30000005
  d8:	00524344 	subseq	r4, r2, r4, asr #6
  dc:	6e695f5f 	mcrvs	15, 3, r5, cr9, cr15, {2}
  e0:	5f323374 	svcpl	0x00323374
  e4:	4c460074 	mcrrmi	0, 7, r0, r6, cr4
  e8:	5f485341 	svcpl	0x00485341
  ec:	6e515249 	cdpvs	2, 5, cr5, cr1, cr9, {2}
  f0:	4c414300 	mcrrmi	3, 0, r4, r1, cr0
  f4:	45004249 	strmi	r4, [r0, #-585]	; 0xfffffdb7
  f8:	30495458 	subcc	r5, r9, r8, asr r4
  fc:	5152495f 	cmppl	r2, pc, asr r9
 100:	5845006e 	stmdapl	r5, {r1, r2, r3, r5, r6}^
 104:	35314954 	ldrcc	r4, [r1, #-2388]!	; 0xfffff6ac
 108:	5f30315f 	svcpl	0x0030315f
 10c:	6e515249 	cdpvs	2, 5, cr5, cr1, cr9, {2}
 110:	59454b00 	stmdbpl	r5, {r8, r9, fp, lr}^
 114:	65500052 	ldrbvs	r0, [r0, #-82]	; 0xffffffae
 118:	5653646e 	ldrbpl	r6, [r3], -lr, ror #8
 11c:	5152495f 	cmppl	r2, pc, asr r9
 120:	4352006e 	cmpmi	r2, #110	; 0x6e
 124:	52495f43 	subpl	r5, r9, #268	; 0x10c
 128:	47006e51 	smlsdmi	r0, r1, lr, r6
 12c:	00525054 	subseq	r5, r2, r4, asr r0
 130:	6f6d654d 	svcvs	0x006d654d
 134:	614d7972 	hvcvs	55186	; 0xd792
 138:	6567616e 	strbvs	r6, [r7, #-366]!	; 0xfffffe92
 13c:	746e656d 	strbtvc	r6, [lr], #-1389	; 0xfffffa93
 140:	5152495f 	cmppl	r2, pc, asr r9
 144:	6975006e 	ldmdbvs	r5!, {r1, r2, r3, r5, r6}^
 148:	3233746e 	eorscc	r7, r3, #1845493760	; 0x6e000000
 14c:	4d00745f 	cfstrsmi	mvf7, [r0, #-380]	; 0xfffffe84
 150:	0052464d 	subseq	r4, r2, sp, asr #12
 154:	52455349 	subpl	r5, r5, #603979777	; 0x24000001
 158:	4d495400 	cfstrdmi	mvd5, [r9, #-0]
 15c:	52425f31 	subpl	r5, r2, #49, 30	; 0xc4
 160:	52495f4b 	subpl	r5, r9, #300	; 0x12c
 164:	52006e51 	andpl	r6, r0, #1296	; 0x510
 168:	56524553 			; <UNDEFINED> instruction: 0x56524553
 16c:	00314445 	eorseq	r4, r1, r5, asr #8
 170:	31495053 	qdaddcc	r5, r3, r9
 174:	5152495f 	cmppl	r2, pc, asr r9
 178:	4d44006e 	stclmi	0, cr0, [r4, #-440]	; 0xfffffe48
 17c:	435f3141 	cmpmi	pc, #1073741840	; 0x40000010
 180:	6e6e6168 	powvsez	f6, f6, #0.0
 184:	5f346c65 	svcpl	0x00346c65
 188:	6e515249 	cdpvs	2, 5, cr5, cr1, cr9, {2}
 18c:	6e6f6c00 	cdpvs	12, 6, cr6, cr15, cr0, {0}
 190:	6f6c2067 	svcvs	0x006c2067
 194:	7520676e 	strvc	r6, [r0, #-1902]!	; 0xfffff892
 198:	6769736e 	strbvs	r7, [r9, -lr, ror #6]!
 19c:	2064656e 	rsbcs	r6, r4, lr, ror #10
 1a0:	00746e69 	rsbseq	r6, r4, r9, ror #28
 1a4:	6e515249 	cdpvs	2, 5, cr5, cr1, cr9, {2}
 1a8:	54504f00 	ldrbpl	r4, [r0], #-3840	; 0xfffff100
 1ac:	5259454b 	subspl	r4, r9, #314572800	; 0x12c00000
 1b0:	755f5f00 	ldrbvc	r5, [pc, #-3840]	; fffff2b8 <init_adc+0xfffff2b8>
 1b4:	31746e69 	cmncc	r4, r9, ror #28
 1b8:	00745f36 	rsbseq	r5, r4, r6, lsr pc
 1bc:	314e4143 	cmpcc	lr, r3, asr #2
 1c0:	3158525f 	cmpcc	r8, pc, asr r2
 1c4:	5152495f 	cmppl	r2, pc, asr r9
 1c8:	5355006e 	cmppl	r5, #110	; 0x6e
 1cc:	50485f42 	subpl	r5, r8, r2, asr #30
 1d0:	4e41435f 	mcrmi	3, 2, r4, cr1, cr15, {2}
 1d4:	58545f31 	ldmdapl	r4, {r0, r4, r5, r8, r9, sl, fp, ip, lr}^
 1d8:	5152495f 	cmppl	r2, pc, asr r9
 1dc:	5249006e 	subpl	r0, r9, #110	; 0x6e
 1e0:	545f6e51 	ldrbpl	r6, [pc], #-3665	; 1e8 <.debug_str+0x1e8>
 1e4:	00657079 	rsbeq	r7, r5, r9, ror r0
 1e8:	6573552f 	ldrbvs	r5, [r3, #-1327]!	; 0xfffffad1
 1ec:	632f7372 			; <UNDEFINED> instruction: 0x632f7372
 1f0:	686f7273 	stmdavs	pc!, {r0, r1, r4, r5, r6, r9, ip, sp, lr}^	; <UNPREDICTABLE>
 1f4:	632f7469 			; <UNDEFINED> instruction: 0x632f7469
 1f8:	2f65646f 	svccs	0x0065646f
 1fc:	65756c62 	ldrbvs	r6, [r5, #-3170]!	; 0xfffff39e
 200:	6c69702d 	stclvs	0, cr7, [r9], #-180	; 0xffffff4c
 204:	64612f6c 	strbtvs	r2, [r1], #-3948	; 0xfffff094
 208:	6e692f63 	cdpvs	15, 6, cr2, cr9, cr3, {3}
 20c:	72726574 	rsbsvc	r6, r2, #116, 10	; 0x1d000000
 210:	00747075 	rsbseq	r7, r4, r5, ror r0
 214:	52415355 	subpl	r5, r1, #1409286145	; 0x54000001
 218:	495f3254 	ldmdbmi	pc, {r2, r4, r6, r9, ip, sp}^	; <UNPREDICTABLE>
 21c:	006e5152 	rsbeq	r5, lr, r2, asr r1
 220:	53414c46 	movtpl	r4, #7238	; 0x1c46
 224:	79545f48 	ldmdbvc	r4, {r3, r6, r8, r9, sl, fp, ip, lr}^
 228:	65446570 	strbvs	r6, [r4, #-1392]	; 0xfffffa90
 22c:	50430066 	subpl	r0, r3, r6, rrx
 230:	00444955 	subeq	r4, r4, r5, asr r9
 234:	5f434352 	svcpl	0x00434352
 238:	65707954 	ldrbvs	r7, [r0, #-2388]!	; 0xfffff6ac
 23c:	00666544 	rsbeq	r6, r6, r4, asr #10
 240:	54737953 	ldrbtpl	r7, [r3], #-2387	; 0xfffff6ad
 244:	5f6b6369 	svcpl	0x006b6369
 248:	666e6f43 	strbtvs	r6, [lr], -r3, asr #30
 24c:	62006769 	andvs	r6, r0, #27525120	; 0x1a40000
 250:	00647561 	rsbeq	r7, r4, r1, ror #10
 254:	52534641 	subspl	r4, r3, #68157440	; 0x4100000
 258:	41535500 	cmpmi	r3, r0, lsl #10
 25c:	545f5452 	ldrbpl	r5, [pc], #-1106	; 264 <.debug_str+0x264>
 260:	44657079 	strbtmi	r7, [r5], #-121	; 0xffffff87
 264:	61006665 	tstvs	r0, r5, ror #12
 268:	765f6364 	ldrbvc	r6, [pc], -r4, ror #6
 26c:	65756c61 	ldrbvs	r6, [r5, #-3169]!	; 0xfffff39f
 270:	54584500 	ldrbpl	r4, [r8], #-1280	; 0xfffffb00
 274:	495f3249 	ldmdbmi	pc, {r0, r3, r6, r9, ip, sp}^	; <UNPREDICTABLE>
 278:	006e5152 	rsbeq	r5, lr, r2, asr r1
 27c:	6b636974 	blvs	18da854 <init_adc+0x18da854>
 280:	50410073 	subpl	r0, r1, r3, ror r0
 284:	53523142 	cmppl	r2, #-2147483632	; 0x80000010
 288:	49005254 	stmdbmi	r0, {r2, r4, r6, r9, ip, lr}
 28c:	5f324332 	svcpl	0x00324332
 290:	495f5645 	ldmdbmi	pc, {r0, r2, r6, r9, sl, ip, lr}^	; <UNPREDICTABLE>
 294:	006e5152 	rsbeq	r5, lr, r2, asr r1
 298:	52534648 	subspl	r4, r3, #72, 12	; 0x4800000
 29c:	61686300 	cmnvs	r8, r0, lsl #6
 2a0:	4d440072 	stclmi	0, cr0, [r4, #-456]	; 0xfffffe38
 2a4:	435f3141 	cmpmi	pc, #1073741840	; 0x40000010
 2a8:	6e6e6168 	powvsez	f6, f6, #0.0
 2ac:	5f366c65 	svcpl	0x00366c65
 2b0:	6e515249 	cdpvs	2, 5, cr5, cr1, cr9, {2}
 2b4:	52494100 	subpl	r4, r9, #0, 2
 2b8:	54005243 	strpl	r5, [r0], #-579	; 0xfffffdbd
 2bc:	5f334d49 	svcpl	0x00334d49
 2c0:	6e515249 	cdpvs	2, 5, cr5, cr1, cr9, {2}
 2c4:	414d4400 	cmpmi	sp, r0, lsl #8
 2c8:	68435f31 	stmdavs	r3, {r0, r4, r5, r8, r9, sl, fp, ip, lr}^
 2cc:	656e6e61 	strbvs	r6, [lr, #-3681]!	; 0xfffff19f
 2d0:	495f316c 	ldmdbmi	pc, {r2, r3, r5, r6, r8, ip, sp}^	; <UNPREDICTABLE>
 2d4:	006e5152 	rsbeq	r5, lr, r2, asr r1
 2d8:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xfffff197
 2dc:	6f6c635f 	svcvs	0x006c635f
 2e0:	41006b63 	tstmi	r0, r3, ror #22
 2e4:	4e454248 	cdpmi	2, 4, cr4, cr5, cr8, {2}
 2e8:	69750052 	ldmdbvs	r5!, {r1, r4, r6}^
 2ec:	5f38746e 	svcpl	0x0038746e
 2f0:	58450074 	stmdapl	r5, {r2, r4, r5, r6}^
 2f4:	5f314954 	svcpl	0x00314954
 2f8:	6e515249 	cdpvs	2, 5, cr5, cr1, cr9, {2}
 2fc:	464f4a00 	strbmi	r4, [pc], -r0, lsl #20
 300:	55003352 	strpl	r3, [r0, #-850]	; 0xfffffcae
 304:	61574253 	cmpvs	r7, r3, asr r2
 308:	7055656b 	subsvc	r6, r5, fp, ror #10
 30c:	5152495f 	cmppl	r2, pc, asr r9
 310:	4441006e 	strbmi	r0, [r1], #-110	; 0xffffff92
 314:	79545f43 	ldmdbvc	r4, {r0, r1, r6, r8, r9, sl, fp, ip, lr}^
 318:	65446570 	strbvs	r6, [r4, #-1392]	; 0xfffffa90
 31c:	6f6c0066 	svcvs	0x006c0066
 320:	6c20676e 	stcvs	7, cr6, [r0], #-440	; 0xfffffe48
 324:	20676e6f 	rsbcs	r6, r7, pc, ror #28
 328:	00746e69 	rsbseq	r6, r4, r9, ror #28
 32c:	47445757 	smlsldmi	r5, r4, r7, r7
 330:	5152495f 	cmppl	r2, pc, asr r9
 334:	4853006e 	ldmdami	r3, {r1, r2, r3, r5, r6}^
 338:	00525343 	subseq	r5, r2, r3, asr #6
 33c:	52534643 	subspl	r4, r3, #70254592	; 0x4300000
 340:	73754200 	cmnvc	r5, #0, 4
 344:	6c756146 	ldfvse	f6, [r5], #-280	; 0xfffffee8
 348:	52495f74 	subpl	r5, r9, #116, 30	; 0x1d0
 34c:	45006e51 	strmi	r6, [r0, #-3665]	; 0xfffff1af
 350:	34495458 	strbcc	r5, [r9], #-1112	; 0xfffffba8
 354:	5152495f 	cmppl	r2, pc, asr r9
 358:	5650006e 	ldrbpl	r0, [r0], -lr, rrx
 35c:	52495f44 	subpl	r5, r9, #68, 30	; 0x110
 360:	6d006e51 	stcvs	14, cr6, [r0, #-324]	; 0xfffffebc
 364:	63695473 	cmnvs	r9, #1929379840	; 0x73000000
 368:	4a00736b 	bmi	1d11c <init_adc+0x1d11c>
 36c:	00525153 	subseq	r5, r2, r3, asr r1
 370:	52504349 	subspl	r4, r0, #603979777	; 0x24000001
 374:	42504100 	subsmi	r4, r0, #0, 2
 378:	524e4532 	subpl	r4, lr, #209715200	; 0xc800000
 37c:	414d4400 	cmpmi	sp, r0, lsl #8
 380:	68435f31 	stmdavs	r3, {r0, r4, r5, r8, r9, sl, fp, ip, lr}^
 384:	656e6e61 	strbvs	r6, [lr, #-3681]!	; 0xfffff19f
 388:	495f336c 	ldmdbmi	pc, {r2, r3, r5, r6, r8, r9, ip, sp}^	; <UNPREDICTABLE>
 38c:	006e5152 	rsbeq	r5, lr, r2, asr r1
 390:	52504d53 	subspl	r4, r0, #5312	; 0x14c0
 394:	4d530031 	ldclmi	0, cr0, [r3, #-196]	; 0xffffff3c
 398:	00325250 	eorseq	r5, r2, r0, asr r2
 39c:	31433249 	cmpcc	r3, r9, asr #4
 3a0:	5f56455f 	svcpl	0x0056455f
 3a4:	6e515249 	cdpvs	2, 5, cr5, cr1, cr9, {2}
 3a8:	50525700 	subspl	r5, r2, r0, lsl #14
 3ac:	79530052 	ldmdbvc	r3, {r1, r4, r6}^
 3b0:	63695473 	cmnvs	r9, #1929379840	; 0x73000000
 3b4:	79545f6b 	ldmdbvc	r4, {r0, r1, r3, r5, r6, r8, r9, sl, fp, ip, lr}^
 3b8:	6c006570 	cfstr32vs	mvfx6, [r0], {112}	; 0x70
 3bc:	20676e6f 	rsbcs	r6, r7, pc, ror #28
 3c0:	62756f64 	rsbsvs	r6, r5, #100, 30	; 0x190
 3c4:	7500656c 	strvc	r6, [r0, #-1388]	; 0xfffffa94
 3c8:	31746e69 	cmncc	r4, r9, ror #28
 3cc:	00745f36 	rsbseq	r5, r4, r6, lsr pc
 3d0:	314d4954 	cmpcc	sp, r4, asr r9
 3d4:	5f50555f 	svcpl	0x0050555f
 3d8:	6e515249 	cdpvs	2, 5, cr5, cr1, cr9, {2}
 3dc:	49545300 	ldmdbmi	r4, {r8, r9, ip, lr}^
 3e0:	4d4d0052 	stclmi	0, cr0, [sp, #-328]	; 0xfffffeb8
 3e4:	00524146 	subseq	r4, r2, r6, asr #2
 3e8:	5f435452 	svcpl	0x00435452
 3ec:	72616c41 	rsbvc	r6, r1, #16640	; 0x4100
 3f0:	52495f6d 	subpl	r5, r9, #436	; 0x1b4
 3f4:	52006e51 	andpl	r6, r0, #1296	; 0x510
 3f8:	495f4354 	ldmdbmi	pc, {r2, r4, r6, r8, r9, lr}^	; <UNPREDICTABLE>
 3fc:	006e5152 	rsbeq	r5, lr, r2, asr r1
 400:	3152444a 	cmpcc	r2, sl, asr #8
 404:	52444a00 	subpl	r4, r4, #0, 20
 408:	444a0032 	strbmi	r0, [sl], #-50	; 0xffffffce
 40c:	4a003352 	bmi	d15c <init_adc+0xd15c>
 410:	00345244 	eorseq	r5, r4, r4, asr #4
 414:	45534552 	ldrbmi	r4, [r3, #-1362]	; 0xfffffaae
 418:	44455652 	strbmi	r5, [r5], #-1618	; 0xfffff9ae
 41c:	45520030 	ldrbmi	r0, [r2, #-48]	; 0xffffffd0
 420:	56524553 			; <UNDEFINED> instruction: 0x56524553
 424:	00324445 	eorseq	r4, r2, r5, asr #8
 428:	45534552 	ldrbmi	r4, [r3, #-1362]	; 0xfffffaae
 42c:	44455652 	strbmi	r5, [r5], #-1618	; 0xfffff9ae
 430:	45520033 	ldrbmi	r0, [r2, #-51]	; 0xffffffcd
 434:	56524553 			; <UNDEFINED> instruction: 0x56524553
 438:	00344445 	eorseq	r4, r4, r5, asr #8
 43c:	45534552 	ldrbmi	r4, [r3, #-1362]	; 0xfffffaae
 440:	44455652 	strbmi	r5, [r5], #-1618	; 0xfffff9ae
 444:	68730035 	ldmdavs	r3!, {r0, r2, r4, r5}^
 448:	2074726f 	rsbscs	r7, r4, pc, ror #4
 44c:	00746e69 	rsbseq	r6, r4, r9, ror #28
 450:	676e6f6c 	strbvs	r6, [lr, -ip, ror #30]!
 454:	746e6920 	strbtvc	r6, [lr], #-2336	; 0xfffff6e0
 458:	554e4700 	strbpl	r4, [lr, #-1792]	; 0xfffff900
 45c:	37314320 	ldrcc	r4, [r1, -r0, lsr #6]!
 460:	2e303120 	rsfcssp	f3, f0, f0
 464:	20312e33 	eorscs	r2, r1, r3, lsr lr
 468:	31323032 	teqcc	r2, r2, lsr r0
 46c:	34323830 	ldrtcc	r3, [r2], #-2096	; 0xfffff7d0
 470:	65722820 	ldrbvs	r2, [r2, #-2080]!	; 0xfffff7e0
 474:	7361656c 	cmnvc	r1, #108, 10	; 0x1b000000
 478:	2d202965 			; <UNDEFINED> instruction: 0x2d202965
 47c:	6f6c666d 	svcvs	0x006c666d
 480:	612d7461 			; <UNDEFINED> instruction: 0x612d7461
 484:	733d6962 	teqvc	sp, #1605632	; 0x188000
 488:	2074666f 	rsbscs	r6, r4, pc, ror #12
 48c:	68746d2d 	ldmdavs	r4!, {r0, r2, r3, r5, r8, sl, fp, sp, lr}^
 490:	20626d75 	rsbcs	r6, r2, r5, ror sp
 494:	70636d2d 	rsbvc	r6, r3, sp, lsr #26
 498:	6f633d75 	svcvs	0x00633d75
 49c:	78657472 	stmdavc	r5!, {r1, r4, r5, r6, sl, ip, sp, lr}^
 4a0:	20336d2d 	eorscs	r6, r3, sp, lsr #26
 4a4:	72616d2d 	rsbvc	r6, r1, #2880	; 0xb40
 4a8:	613d6863 	teqvs	sp, r3, ror #16
 4ac:	37766d72 			; <UNDEFINED> instruction: 0x37766d72
 4b0:	2d206d2d 	stccs	13, cr6, [r0, #-180]!	; 0xffffff4c
 4b4:	672d2067 	strvs	r2, [sp, -r7, rrx]!
 4b8:	72617764 	rsbvc	r7, r1, #100, 14	; 0x1900000
 4bc:	20322d66 	eorscs	r2, r2, r6, ror #26
 4c0:	6164662d 	cmnvs	r4, sp, lsr #12
 4c4:	732d6174 			; <UNDEFINED> instruction: 0x732d6174
 4c8:	69746365 	ldmdbvs	r4!, {r0, r2, r5, r6, r8, r9, sp, lr}^
 4cc:	20736e6f 	rsbscs	r6, r3, pc, ror #28
 4d0:	7566662d 	strbvc	r6, [r6, #-1581]!	; 0xfffff9d3
 4d4:	6974636e 	ldmdbvs	r4!, {r1, r2, r3, r5, r6, r8, r9, sp, lr}^
 4d8:	732d6e6f 			; <UNDEFINED> instruction: 0x732d6e6f
 4dc:	69746365 	ldmdbvs	r4!, {r0, r2, r5, r6, r8, r9, sp, lr}^
 4e0:	00736e6f 	rsbseq	r6, r3, pc, ror #28
 4e4:	4d6e6f4e 	stclmi	15, cr6, [lr, #-312]!	; 0xfffffec8
 4e8:	616b7361 	cmnvs	fp, r1, ror #6
 4ec:	49656c62 	stmdbmi	r5!, {r1, r5, r6, sl, fp, sp, lr}^
 4f0:	495f746e 	ldmdbmi	pc, {r1, r2, r3, r5, r6, sl, ip, sp, lr}^	; <UNPREDICTABLE>
 4f4:	006e5152 	rsbeq	r5, lr, r2, asr r1
 4f8:	6f697270 	svcvs	0x00697270
 4fc:	79746972 	ldmdbvc	r4!, {r1, r4, r5, r6, r8, fp, sp, lr}^
 500:	4d495400 	cfstrdmi	mvd5, [r9, #-0]
 504:	43435f31 	movtmi	r5, #16177	; 0x3f31
 508:	5152495f 	cmppl	r2, pc, asr r9
 50c:	6c66006e 	stclvs	0, cr0, [r6], #-440	; 0xfffffe48
 510:	43006761 	movwmi	r6, #1889	; 0x761
 514:	00524746 	subseq	r4, r2, r6, asr #14
 518:	69755f5f 	ldmdbvs	r5!, {r0, r1, r2, r3, r4, r6, r8, r9, sl, fp, ip, lr}^
 51c:	5f38746e 	svcpl	0x0038746e
 520:	564e0074 			; <UNDEFINED> instruction: 0x564e0074
 524:	545f4349 	ldrbpl	r4, [pc], #-841	; 52c <.debug_str+0x52c>
 528:	00657079 	rsbeq	r7, r5, r9, ror r0
 52c:	5f424353 	svcpl	0x00424353
 530:	65707954 	ldrbvs	r7, [r0, #-2388]!	; 0xfffff6ac
 534:	41464200 	mrsmi	r4, (UNDEF: 102)
 538:	49540052 	ldmdbmi	r4, {r1, r4, r6}^
 53c:	545f314d 	ldrbpl	r3, [pc], #-333	; 544 <.debug_str+0x544>
 540:	435f4752 	cmpmi	pc, #21495808	; 0x1480000
 544:	495f4d4f 	ldmdbmi	pc, {r0, r1, r2, r3, r6, r8, sl, fp, lr}^	; <UNPREDICTABLE>
 548:	006e5152 	rsbeq	r5, lr, r2, asr r1
 54c:	4f495047 	svcmi	0x00495047
 550:	7079545f 	rsbsvc	r5, r9, pc, asr r4
 554:	66654465 	strbtvs	r4, [r5], -r5, ror #8
 558:	4f545600 	svcmi	0x00545600
 55c:	32490052 	subcc	r0, r9, #82	; 0x52
 560:	455f3143 	ldrbmi	r3, [pc, #-323]	; 425 <.debug_str+0x425>
 564:	52495f52 	subpl	r5, r9, #328	; 0x148
 568:	53006e51 	movwpl	r6, #3665	; 0xe51
 56c:	69547379 	ldmdbvs	r4, {r0, r3, r4, r5, r6, r8, r9, ip, sp, lr}^
 570:	495f6b63 	ldmdbmi	pc, {r0, r1, r5, r6, r8, r9, fp, sp, lr}^	; <UNPREDICTABLE>
 574:	006e5152 	rsbeq	r5, lr, r2, asr r1
 578:	52534349 	subspl	r4, r3, #603979777	; 0x24000001
 57c:	6e6f6c00 	cdpvs	12, 6, cr6, cr15, cr0, {0}
 580:	6e752067 	cdpvs	0, 7, cr2, cr5, cr7, {3}
 584:	6e676973 			; <UNDEFINED> instruction: 0x6e676973
 588:	69206465 	stmdbvs	r0!, {r0, r2, r5, r6, sl, sp, lr}
 58c:	5400746e 	strpl	r7, [r0], #-1134	; 0xfffffb92
 590:	5f324d49 	svcpl	0x00324d49
 594:	6e515249 	cdpvs	2, 5, cr5, cr1, cr9, {2}
 598:	746e6900 	strbtvc	r6, [lr], #-2304	; 0xfffff700
 59c:	745f3233 	ldrbvc	r3, [pc], #-563	; 5a4 <.debug_str+0x5a4>
 5a0:	4e5f5f00 	cdpmi	15, 5, cr5, cr15, cr0, {0}
 5a4:	5f434956 	svcpl	0x00434956
 5a8:	62616e45 	rsbvs	r6, r1, #1104	; 0x450
 5ac:	5249656c 	subpl	r6, r9, #108, 10	; 0x1b000000
 5b0:	65440051 	strbvs	r0, [r4, #-81]	; 0xffffffaf
 5b4:	4d677562 	cfstr64mi	mvdx7, [r7, #-392]!	; 0xfffffe78
 5b8:	74696e6f 	strbtvc	r6, [r9], #-3695	; 0xfffff191
 5bc:	495f726f 	ldmdbmi	pc, {r0, r1, r2, r3, r5, r6, r9, ip, sp, lr}^	; <UNPREDICTABLE>
 5c0:	006e5152 	rsbeq	r5, lr, r2, asr r1
 5c4:	67617355 			; <UNDEFINED> instruction: 0x67617355
 5c8:	75614665 	strbvc	r4, [r1, #-1637]!	; 0xfffff99b
 5cc:	495f746c 	ldmdbmi	pc, {r2, r3, r5, r6, sl, ip, sp, lr}^	; <UNPREDICTABLE>
 5d0:	006e5152 	rsbeq	r5, lr, r2, asr r1
 5d4:	69736e75 	ldmdbvs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
 5d8:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xfffff199
 5dc:	61686320 	cmnvs	r8, r0, lsr #6
 5e0:	53550072 	cmppl	r5, #114	; 0x72
 5e4:	31545241 	cmpcc	r4, r1, asr #4
 5e8:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 5ec:	5f5f0074 	svcpl	0x005f0074
 5f0:	746e6975 	strbtvc	r6, [lr], #-2421	; 0xfffff68b
 5f4:	745f3233 	ldrbvc	r3, [pc], #-563	; 5fc <.debug_str+0x5fc>
 5f8:	54584500 	ldrbpl	r4, [r8], #-1280	; 0xfffffb00
 5fc:	355f3949 	ldrbcc	r3, [pc, #-2377]	; fffffcbb <init_adc+0xfffffcbb>
 600:	5152495f 	cmppl	r2, pc, asr r9
 604:	5653006e 	ldrbpl	r0, [r3], -lr, rrx
 608:	6c6c6143 	stfvse	f6, [ip], #-268	; 0xfffffef4
 60c:	5152495f 	cmppl	r2, pc, asr r9
 610:	4349006e 	movtmi	r0, #36974	; 0x906e
 614:	53005245 	movwpl	r5, #581	; 0x245
 618:	5f324950 	svcpl	0x00324950
 61c:	6e515249 	cdpvs	2, 5, cr5, cr1, cr9, {2}
 620:	42414900 	submi	r4, r1, #0, 18
 624:	4d440052 	stclmi	0, cr0, [r4, #-328]	; 0xfffffeb8
 628:	435f3141 	cmpmi	pc, #1073741840	; 0x40000010
 62c:	6e6e6168 	powvsez	f6, f6, #0.0
 630:	5f356c65 	svcpl	0x00356c65
 634:	6e515249 	cdpvs	2, 5, cr5, cr1, cr9, {2}
 638:	67697300 	strbvs	r7, [r9, -r0, lsl #6]!
 63c:	2064656e 	rsbcs	r6, r4, lr, ror #10
 640:	72616863 	rsbvc	r6, r1, #6488064	; 0x630000
 644:	63727300 	cmnvs	r2, #0, 6
 648:	69616d2f 	stmdbvs	r1!, {r0, r1, r2, r3, r5, r8, sl, fp, sp, lr}^
 64c:	00632e6e 	rsbeq	r2, r3, lr, ror #28
 650:	726f6873 	rsbvc	r6, pc, #7536640	; 0x730000
 654:	6e752074 	mrcvs	0, 3, r2, cr5, cr4, {3}
 658:	6e676973 			; <UNDEFINED> instruction: 0x6e676973
 65c:	69206465 	stmdbvs	r0!, {r0, r2, r5, r6, sl, sp, lr}
 660:	4500746e 	strmi	r7, [r0, #-1134]	; 0xfffffb92
 664:	33495458 	movtcc	r5, #37976	; 0x9458
 668:	5152495f 	cmppl	r2, pc, asr r9
 66c:	616d006e 	cmnvs	sp, lr, rrx
 670:	48006e69 	stmdami	r0, {r0, r3, r5, r6, r9, sl, fp, sp, lr}
 674:	46647261 	strbtmi	r7, [r4], -r1, ror #4
 678:	746c7561 	strbtvc	r7, [ip], #-1377	; 0xfffffa9f
 67c:	5152495f 	cmppl	r2, pc, asr r9
 680:	5349006e 	movtpl	r0, #36974	; 0x906e
 684:	4a005250 	bmi	14fcc <init_adc+0x14fcc>
 688:	3152464f 	cmpcc	r2, pc, asr #12
 68c:	464f4a00 	strbmi	r4, [pc], -r0, lsl #20
 690:	55003252 	strpl	r3, [r0, #-594]	; 0xfffffdae
 694:	54524153 	ldrbpl	r4, [r2], #-339	; 0xfffffead
 698:	52495f31 	subpl	r5, r9, #49, 30	; 0xc4
 69c:	4a006e51 	bmi	1bfe8 <init_adc+0x1bfe8>
 6a0:	3452464f 	ldrbcc	r4, [r2], #-1615	; 0xfffff9b1
 6a4:	43444100 	movtmi	r4, #16640	; 0x4100
 6a8:	5152495f 	cmppl	r2, pc, asr r9
 6ac:	646e6148 	strbtvs	r6, [lr], #-328	; 0xfffffeb8
 6b0:	0072656c 	rsbseq	r6, r2, ip, ror #10
 6b4:	31434441 	cmpcc	r3, r1, asr #8
 6b8:	495f325f 	ldmdbmi	pc, {r0, r1, r2, r3, r4, r6, r9, ip, sp}^	; <UNPREDICTABLE>
 6bc:	006e5152 	rsbeq	r5, lr, r2, asr r1
 6c0:	52415349 	subpl	r5, r1, #603979777	; 0x24000001
 6c4:	41535500 	cmpmi	r3, r0, lsl #10
 6c8:	5f335452 	svcpl	0x00335452
 6cc:	6e515249 	cdpvs	2, 5, cr5, cr1, cr9, {2}
 6d0:	696e6900 	stmdbvs	lr!, {r8, fp, sp, lr}^
 6d4:	64615f74 	strbtvs	r5, [r1], #-3956	; 0xfffff08c
 6d8:	41540063 	cmpmi	r4, r3, rrx
 6dc:	5245504d 	subpl	r5, r5, #77	; 0x4d
 6e0:	5152495f 	cmppl	r2, pc, asr r9
 6e4:	434c006e 	movtmi	r0, #49262	; 0xc06e
 6e8:	4300524b 	movwmi	r5, #587	; 0x24b
 6ec:	004c5254 	subeq	r5, ip, r4, asr r2

Disassembly of section .comment:

00000000 <.comment>:
   0:	43434700 	movtmi	r4, #14080	; 0x3700
   4:	4728203a 			; <UNDEFINED> instruction: 0x4728203a
   8:	4120554e 			; <UNDEFINED> instruction: 0x4120554e
   c:	45206d72 	strmi	r6, [r0, #-3442]!	; 0xfffff28e
  10:	6465626d 	strbtvs	r6, [r5], #-621	; 0xfffffd93
  14:	20646564 	rsbcs	r6, r4, r4, ror #10
  18:	6c6f6f54 	stclvs	15, cr6, [pc], #-336	; fffffed0 <init_adc+0xfffffed0>
  1c:	69616863 	stmdbvs	r1!, {r0, r1, r5, r6, fp, sp, lr}^
  20:	3031206e 	eorscc	r2, r1, lr, rrx
  24:	322d332e 	eorcc	r3, sp, #-1207959552	; 0xb8000000
  28:	2e313230 	mrccs	2, 1, r3, cr1, cr0, {1}
  2c:	20293031 	eorcs	r3, r9, r1, lsr r0
  30:	332e3031 			; <UNDEFINED> instruction: 0x332e3031
  34:	3220312e 	eorcc	r3, r0, #-2147483637	; 0x8000000b
  38:	30313230 	eorscc	r3, r1, r0, lsr r2
  3c:	20343238 	eorscs	r3, r4, r8, lsr r2
  40:	6c657228 	sfmvs	f7, 2, [r5], #-160	; 0xffffff60
  44:	65736165 	ldrbvs	r6, [r3, #-357]!	; 0xfffffe9b
  48:	Address 0x0000000000000048 is out of bounds.


Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 			; <UNDEFINED> instruction: 0xffffffff
   8:	7c020001 	stcvc	0, cr0, [r2], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	00000024 	andeq	r0, r0, r4, lsr #32
	...
  1c:	00000038 	andeq	r0, r0, r8, lsr r0
  20:	87040e41 	strhi	r0, [r4, -r1, asr #28]
  24:	100e4101 	andne	r4, lr, r1, lsl #2
  28:	54070d41 	strpl	r0, [r7], #-3393	; 0xfffff2bf
  2c:	0d41040e 	cfstrdeq	mvd0, [r1, #-56]	; 0xffffffc8
  30:	0ec7410d 	poleqs	f4, f7, #5.0
  34:	00000000 	andeq	r0, r0, r0
  38:	00000024 	andeq	r0, r0, r4, lsr #32
	...
  44:	00000054 	andeq	r0, r0, r4, asr r0
  48:	87040e41 	strhi	r0, [r4, -r1, asr #28]
  4c:	100e4101 	andne	r4, lr, r1, lsl #2
  50:	5f070d41 	svcpl	0x00070d41
  54:	0d41040e 	cfstrdeq	mvd0, [r1, #-56]	; 0xffffffc8
  58:	0ec7410d 	poleqs	f4, f7, #5.0
  5c:	00000000 	andeq	r0, r0, r0
  60:	00000020 	andeq	r0, r0, r0, lsr #32
	...
  6c:	00000044 	andeq	r0, r0, r4, asr #32
  70:	87080e41 	strhi	r0, [r8, -r1, asr #28]
  74:	41018e02 	tstmi	r1, r2, lsl #28
  78:	0d41100e 	stcleq	0, cr1, [r1, #-56]	; 0xffffffc8
  7c:	080e5a07 	stmdaeq	lr, {r0, r1, r2, r9, fp, ip, lr}
  80:	000d0d41 	andeq	r0, sp, r1, asr #26
  84:	00000020 	andeq	r0, r0, r0, lsr #32
	...
  90:	00000074 	andeq	r0, r0, r4, ror r0
  94:	87080e41 	strhi	r0, [r8, -r1, asr #28]
  98:	41018e02 	tstmi	r1, r2, lsl #28
  9c:	0d41180e 	stcleq	8, cr1, [r1, #-56]	; 0xffffffc8
  a0:	080e6d07 	stmdaeq	lr, {r0, r1, r2, r8, sl, fp, sp, lr}
  a4:	000d0d41 	andeq	r0, sp, r1, asr #26
  a8:	0000001c 	andeq	r0, r0, ip, lsl r0
	...
  b4:	000000a8 	andeq	r0, r0, r8, lsr #1
  b8:	87040e41 	strhi	r0, [r4, -r1, asr #28]
  bc:	070d4101 	streq	r4, [sp, -r1, lsl #2]
  c0:	0d0d4802 	stceq	8, cr4, [sp, #-8]
  c4:	000ec741 	andeq	ip, lr, r1, asr #14
  c8:	00000018 	andeq	r0, r0, r8, lsl r0
	...
  d4:	000000b0 	strheq	r0, [r0], -r0	; <UNPREDICTABLE>
  d8:	87080e41 	strhi	r0, [r8, -r1, asr #28]
  dc:	41018e02 	tstmi	r1, r2, lsl #28
  e0:	0000070d 	andeq	r0, r0, sp, lsl #14
  e4:	0000001c 	andeq	r0, r0, ip, lsl r0
	...
  f0:	00000028 	andeq	r0, r0, r8, lsr #32
  f4:	87040e41 	strhi	r0, [r4, -r1, asr #28]
  f8:	070d4101 	streq	r4, [sp, -r1, lsl #2]
  fc:	410d0d4a 	tstmi	sp, sl, asr #26
 100:	00000ec7 	andeq	r0, r0, r7, asr #29
 104:	0000001c 	andeq	r0, r0, ip, lsl r0
	...
 110:	0000008c 	andeq	r0, r0, ip, lsl #1
 114:	87080e41 	strhi	r0, [r8, -r1, asr #28]
 118:	41018e02 	tstmi	r1, r2, lsl #28
 11c:	0d41100e 	stcleq	0, cr1, [r1, #-56]	; 0xffffffc8
 120:	00000007 	andeq	r0, r0, r7

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00002c41 	andeq	r2, r0, r1, asr #24
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	00000022 	andeq	r0, r0, r2, lsr #32
  10:	4d2d3705 	stcmi	7, cr3, [sp, #-20]!	; 0xffffffec
  14:	070a0600 	streq	r0, [sl, -r0, lsl #12]
  18:	1202094d 	andne	r0, r2, #1261568	; 0x134000
  1c:	15011404 	strne	r1, [r1, #-1028]	; 0xfffffbfc
  20:	18031701 	stmdane	r3, {r0, r8, r9, sl, ip}
  24:	1a011901 	bne	46430 <init_adc+0x46430>
  28:	22061e01 	andcs	r1, r6, #1, 28
  2c:	Address 0x000000000000002c is out of bounds.

