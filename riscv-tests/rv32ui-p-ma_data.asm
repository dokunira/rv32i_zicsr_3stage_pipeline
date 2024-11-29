
rv32ui-p-ma_data:     file format elf32-littleriscv


Disassembly of section .text.init:

00000000 <_start>:
   0:	0500006f          	j	50 <reset_vector>

00000004 <trap_vector>:
   4:	34202f73          	csrr	t5,mcause
   8:	00800f93          	li	t6,8
   c:	03ff0863          	beq	t5,t6,3c <write_tohost>
  10:	00900f93          	li	t6,9
  14:	03ff0463          	beq	t5,t6,3c <write_tohost>
  18:	00b00f93          	li	t6,11
  1c:	03ff0063          	beq	t5,t6,3c <write_tohost>
  20:	00000f13          	li	t5,0
  24:	000f0463          	beqz	t5,2c <trap_vector+0x28>
  28:	000f0067          	jr	t5
  2c:	34202f73          	csrr	t5,mcause
  30:	000f5463          	bgez	t5,38 <handle_exception>
  34:	0040006f          	j	38 <handle_exception>

00000038 <handle_exception>:
  38:	5391e193          	ori	gp,gp,1337

0000003c <write_tohost>:
  3c:	00000f17          	auipc	t5,0x0
  40:	7c3f2223          	sw	gp,1988(t5) # 800 <tohost>
  44:	00000f17          	auipc	t5,0x0
  48:	7c0f2023          	sw	zero,1984(t5) # 804 <tohost+0x4>
  4c:	ff1ff06f          	j	3c <write_tohost>

00000050 <reset_vector>:
  50:	00000093          	li	ra,0
  54:	00000113          	li	sp,0
  58:	00000193          	li	gp,0
  5c:	00000213          	li	tp,0
  60:	00000293          	li	t0,0
  64:	00000313          	li	t1,0
  68:	00000393          	li	t2,0
  6c:	00000413          	li	s0,0
  70:	00000493          	li	s1,0
  74:	00000513          	li	a0,0
  78:	00000593          	li	a1,0
  7c:	00000613          	li	a2,0
  80:	00000693          	li	a3,0
  84:	00000713          	li	a4,0
  88:	00000793          	li	a5,0
  8c:	00000813          	li	a6,0
  90:	00000893          	li	a7,0
  94:	00000913          	li	s2,0
  98:	00000993          	li	s3,0
  9c:	00000a13          	li	s4,0
  a0:	00000a93          	li	s5,0
  a4:	00000b13          	li	s6,0
  a8:	00000b93          	li	s7,0
  ac:	00000c13          	li	s8,0
  b0:	00000c93          	li	s9,0
  b4:	00000d13          	li	s10,0
  b8:	00000d93          	li	s11,0
  bc:	00000e13          	li	t3,0
  c0:	00000e93          	li	t4,0
  c4:	00000f13          	li	t5,0
  c8:	00000f93          	li	t6,0
  cc:	f1402573          	csrr	a0,mhartid
  d0:	00051063          	bnez	a0,d0 <reset_vector+0x80>
  d4:	00000297          	auipc	t0,0x0
  d8:	01028293          	addi	t0,t0,16 # e4 <reset_vector+0x94>
  dc:	30529073          	csrw	mtvec,t0
  e0:	74445073          	csrwi	0x744,8
  e4:	00000297          	auipc	t0,0x0
  e8:	01028293          	addi	t0,t0,16 # f4 <reset_vector+0xa4>
  ec:	30529073          	csrw	mtvec,t0
  f0:	18005073          	csrwi	satp,0
  f4:	00000297          	auipc	t0,0x0
  f8:	02028293          	addi	t0,t0,32 # 114 <reset_vector+0xc4>
  fc:	30529073          	csrw	mtvec,t0
 100:	800002b7          	lui	t0,0x80000
 104:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffff57f>
 108:	3b029073          	csrw	pmpaddr0,t0
 10c:	01f00293          	li	t0,31
 110:	3a029073          	csrw	pmpcfg0,t0
 114:	30405073          	csrwi	mie,0
 118:	00000297          	auipc	t0,0x0
 11c:	01428293          	addi	t0,t0,20 # 12c <reset_vector+0xdc>
 120:	30529073          	csrw	mtvec,t0
 124:	30205073          	csrwi	medeleg,0
 128:	30305073          	csrwi	mideleg,0
 12c:	00000193          	li	gp,0
 130:	00000297          	auipc	t0,0x0
 134:	ed428293          	addi	t0,t0,-300 # 4 <trap_vector>
 138:	30529073          	csrw	mtvec,t0
 13c:	00100513          	li	a0,1
 140:	01f51513          	slli	a0,a0,0x1f
 144:	00054c63          	bltz	a0,15c <reset_vector+0x10c>
 148:	0ff0000f          	fence
 14c:	00100193          	li	gp,1
 150:	05d00893          	li	a7,93
 154:	00000513          	li	a0,0
 158:	00000073          	ecall
 15c:	00000293          	li	t0,0
 160:	00028a63          	beqz	t0,174 <reset_vector+0x124>
 164:	10529073          	csrw	stvec,t0
 168:	0000b2b7          	lui	t0,0xb
 16c:	10928293          	addi	t0,t0,265 # b109 <_end+0xa689>
 170:	30229073          	csrw	medeleg,t0
 174:	30005073          	csrwi	mstatus,0
 178:	00000297          	auipc	t0,0x0
 17c:	01428293          	addi	t0,t0,20 # 18c <reset_vector+0x13c>
 180:	34129073          	csrw	mepc,t0
 184:	f1402573          	csrr	a0,mhartid
 188:	30200073          	mret
 18c:	00000417          	auipc	s0,0x0
 190:	77440413          	addi	s0,s0,1908 # 900 <begin_signature>
 194:	00100193          	li	gp,1
 198:	20100313          	li	t1,513
 19c:	00141383          	lh	t2,1(s0)
 1a0:	52731c63          	bne	t1,t2,6d8 <fail>
 1a4:	00200193          	li	gp,2
 1a8:	20100313          	li	t1,513
 1ac:	00145383          	lhu	t2,1(s0)
 1b0:	52731463          	bne	t1,t2,6d8 <fail>
 1b4:	00300193          	li	gp,3
 1b8:	04030337          	lui	t1,0x4030
 1bc:	20130313          	addi	t1,t1,513 # 4030201 <_end+0x402f781>
 1c0:	00142383          	lw	t2,1(s0)
 1c4:	50731a63          	bne	t1,t2,6d8 <fail>
 1c8:	00400193          	li	gp,4
 1cc:	05040337          	lui	t1,0x5040
 1d0:	30230313          	addi	t1,t1,770 # 5040302 <_end+0x503f882>
 1d4:	00242383          	lw	t2,2(s0)
 1d8:	50731063          	bne	t1,t2,6d8 <fail>
 1dc:	00500193          	li	gp,5
 1e0:	06050337          	lui	t1,0x6050
 1e4:	40330313          	addi	t1,t1,1027 # 6050403 <_end+0x604f983>
 1e8:	00342383          	lw	t2,3(s0)
 1ec:	4e731663          	bne	t1,t2,6d8 <fail>
 1f0:	01000193          	li	gp,16
 1f4:	00002337          	lui	t1,0x2
 1f8:	01f30313          	addi	t1,t1,31 # 201f <_end+0x159f>
 1fc:	01f41383          	lh	t2,31(s0)
 200:	4c731c63          	bne	t1,t2,6d8 <fail>
 204:	01100193          	li	gp,17
 208:	00002337          	lui	t1,0x2
 20c:	01f30313          	addi	t1,t1,31 # 201f <_end+0x159f>
 210:	01f45383          	lhu	t2,31(s0)
 214:	4c731263          	bne	t1,t2,6d8 <fail>
 218:	01200193          	li	gp,18
 21c:	201f2337          	lui	t1,0x201f2
 220:	e1d30313          	addi	t1,t1,-483 # 201f1e1d <_end+0x201f139d>
 224:	01d42383          	lw	t2,29(s0)
 228:	4a731863          	bne	t1,t2,6d8 <fail>
 22c:	01300193          	li	gp,19
 230:	21202337          	lui	t1,0x21202
 234:	f1e30313          	addi	t1,t1,-226 # 21201f1e <_end+0x2120149e>
 238:	01e42383          	lw	t2,30(s0)
 23c:	48731e63          	bne	t1,t2,6d8 <fail>
 240:	01400193          	li	gp,20
 244:	22212337          	lui	t1,0x22212
 248:	01f30313          	addi	t1,t1,31 # 2221201f <_end+0x2221159f>
 24c:	01f42383          	lw	t2,31(s0)
 250:	48731463          	bne	t1,t2,6d8 <fail>
 254:	01f00193          	li	gp,31
 258:	00004337          	lui	t1,0x4
 25c:	03f30313          	addi	t1,t1,63 # 403f <_end+0x35bf>
 260:	03f41383          	lh	t2,63(s0)
 264:	46731a63          	bne	t1,t2,6d8 <fail>
 268:	02000193          	li	gp,32
 26c:	00004337          	lui	t1,0x4
 270:	03f30313          	addi	t1,t1,63 # 403f <_end+0x35bf>
 274:	03f45383          	lhu	t2,63(s0)
 278:	46731063          	bne	t1,t2,6d8 <fail>
 27c:	02100193          	li	gp,33
 280:	403f4337          	lui	t1,0x403f4
 284:	e3d30313          	addi	t1,t1,-451 # 403f3e3d <_end+0x403f33bd>
 288:	03d42383          	lw	t2,61(s0)
 28c:	44731663          	bne	t1,t2,6d8 <fail>
 290:	02200193          	li	gp,34
 294:	41404337          	lui	t1,0x41404
 298:	f3e30313          	addi	t1,t1,-194 # 41403f3e <_end+0x414034be>
 29c:	03e42383          	lw	t2,62(s0)
 2a0:	42731c63          	bne	t1,t2,6d8 <fail>
 2a4:	02300193          	li	gp,35
 2a8:	42414337          	lui	t1,0x42414
 2ac:	03f30313          	addi	t1,t1,63 # 4241403f <_end+0x424135bf>
 2b0:	03f42383          	lw	t2,63(s0)
 2b4:	42731263          	bne	t1,t2,6d8 <fail>
 2b8:	02e00193          	li	gp,46
 2bc:	ffff8337          	lui	t1,0xffff8
 2c0:	18030313          	addi	t1,t1,384 # ffff8180 <_end+0xffff7700>
 2c4:	006410a3          	sh	t1,1(s0)
 2c8:	00141383          	lh	t2,1(s0)
 2cc:	40731663          	bne	t1,t2,6d8 <fail>
 2d0:	02f00193          	li	gp,47
 2d4:	00008337          	lui	t1,0x8
 2d8:	38230313          	addi	t1,t1,898 # 8382 <_end+0x7902>
 2dc:	006410a3          	sh	t1,1(s0)
 2e0:	00145383          	lhu	t2,1(s0)
 2e4:	3e731a63          	bne	t1,t2,6d8 <fail>
 2e8:	03000193          	li	gp,48
 2ec:	87868337          	lui	t1,0x87868
 2f0:	58430313          	addi	t1,t1,1412 # 87868584 <_end+0x87867b04>
 2f4:	006420a3          	sw	t1,1(s0)
 2f8:	00142383          	lw	t2,1(s0)
 2fc:	3c731e63          	bne	t1,t2,6d8 <fail>
 300:	03100193          	li	gp,49
 304:	8b8a9337          	lui	t1,0x8b8a9
 308:	98830313          	addi	t1,t1,-1656 # 8b8a8988 <_end+0x8b8a7f08>
 30c:	00642123          	sw	t1,2(s0)
 310:	00242383          	lw	t2,2(s0)
 314:	3c731263          	bne	t1,t2,6d8 <fail>
 318:	03200193          	li	gp,50
 31c:	8f8e9337          	lui	t1,0x8f8e9
 320:	d8c30313          	addi	t1,t1,-628 # 8f8e8d8c <_end+0x8f8e830c>
 324:	006421a3          	sw	t1,3(s0)
 328:	00342383          	lw	t2,3(s0)
 32c:	3a731663          	bne	t1,t2,6d8 <fail>
 330:	03d00193          	li	gp,61
 334:	ffffd337          	lui	t1,0xffffd
 338:	5d430313          	addi	t1,t1,1492 # ffffd5d4 <_end+0xffffcb54>
 33c:	00641fa3          	sh	t1,31(s0)
 340:	01f41383          	lh	t2,31(s0)
 344:	38731a63          	bne	t1,t2,6d8 <fail>
 348:	03e00193          	li	gp,62
 34c:	0000d337          	lui	t1,0xd
 350:	7d630313          	addi	t1,t1,2006 # d7d6 <_end+0xcd56>
 354:	00641fa3          	sh	t1,31(s0)
 358:	01f45383          	lhu	t2,31(s0)
 35c:	36731e63          	bne	t1,t2,6d8 <fail>
 360:	03f00193          	li	gp,63
 364:	dbdae337          	lui	t1,0xdbdae
 368:	9d830313          	addi	t1,t1,-1576 # dbdad9d8 <_end+0xdbdacf58>
 36c:	00642ea3          	sw	t1,29(s0)
 370:	01d42383          	lw	t2,29(s0)
 374:	36731263          	bne	t1,t2,6d8 <fail>
 378:	04000193          	li	gp,64
 37c:	dfdee337          	lui	t1,0xdfdee
 380:	ddc30313          	addi	t1,t1,-548 # dfdedddc <_end+0xdfded35c>
 384:	00642f23          	sw	t1,30(s0)
 388:	01e42383          	lw	t2,30(s0)
 38c:	34731663          	bne	t1,t2,6d8 <fail>
 390:	04100193          	li	gp,65
 394:	e3e2e337          	lui	t1,0xe3e2e
 398:	1e030313          	addi	t1,t1,480 # e3e2e1e0 <_end+0xe3e2d760>
 39c:	00642fa3          	sw	t1,31(s0)
 3a0:	01f42383          	lw	t2,31(s0)
 3a4:	32731a63          	bne	t1,t2,6d8 <fail>
 3a8:	04c00193          	li	gp,76
 3ac:	00003337          	lui	t1,0x3
 3b0:	53430313          	addi	t1,t1,1332 # 3534 <_end+0x2ab4>
 3b4:	02641fa3          	sh	t1,63(s0)
 3b8:	03f41383          	lh	t2,63(s0)
 3bc:	30731e63          	bne	t1,t2,6d8 <fail>
 3c0:	04d00193          	li	gp,77
 3c4:	00003337          	lui	t1,0x3
 3c8:	73630313          	addi	t1,t1,1846 # 3736 <_end+0x2cb6>
 3cc:	02641fa3          	sh	t1,63(s0)
 3d0:	03f45383          	lhu	t2,63(s0)
 3d4:	30731263          	bne	t1,t2,6d8 <fail>
 3d8:	04e00193          	li	gp,78
 3dc:	3b3a4337          	lui	t1,0x3b3a4
 3e0:	93830313          	addi	t1,t1,-1736 # 3b3a3938 <_end+0x3b3a2eb8>
 3e4:	02642ea3          	sw	t1,61(s0)
 3e8:	03d42383          	lw	t2,61(s0)
 3ec:	2e731663          	bne	t1,t2,6d8 <fail>
 3f0:	04f00193          	li	gp,79
 3f4:	3f3e4337          	lui	t1,0x3f3e4
 3f8:	d3c30313          	addi	t1,t1,-708 # 3f3e3d3c <_end+0x3f3e32bc>
 3fc:	02642f23          	sw	t1,62(s0)
 400:	03e42383          	lw	t2,62(s0)
 404:	2c731a63          	bne	t1,t2,6d8 <fail>
 408:	05000193          	li	gp,80
 40c:	43424337          	lui	t1,0x43424
 410:	14030313          	addi	t1,t1,320 # 43424140 <_end+0x434236c0>
 414:	02642fa3          	sw	t1,63(s0)
 418:	03f42383          	lw	t2,63(s0)
 41c:	2a731e63          	bne	t1,t2,6d8 <fail>
 420:	05b00193          	li	gp,91
 424:	0000a337          	lui	t1,0xa
 428:	99830313          	addi	t1,t1,-1640 # 9998 <_end+0x8f18>
 42c:	f9800393          	li	t2,-104
 430:	006410a3          	sh	t1,1(s0)
 434:	00140e03          	lb	t3,1(s0)
 438:	2bc39063          	bne	t2,t3,6d8 <fail>
 43c:	05c00193          	li	gp,92
 440:	0000a337          	lui	t1,0xa
 444:	b9a30313          	addi	t1,t1,-1126 # 9b9a <_end+0x911a>
 448:	f9b00393          	li	t2,-101
 44c:	006410a3          	sh	t1,1(s0)
 450:	00240e03          	lb	t3,2(s0)
 454:	29c39263          	bne	t2,t3,6d8 <fail>
 458:	05d00193          	li	gp,93
 45c:	0000a337          	lui	t1,0xa
 460:	d9c30313          	addi	t1,t1,-612 # 9d9c <_end+0x931c>
 464:	09c00393          	li	t2,156
 468:	006410a3          	sh	t1,1(s0)
 46c:	00144e03          	lbu	t3,1(s0)
 470:	27c39463          	bne	t2,t3,6d8 <fail>
 474:	05e00193          	li	gp,94
 478:	0000a337          	lui	t1,0xa
 47c:	f9e30313          	addi	t1,t1,-98 # 9f9e <_end+0x951e>
 480:	09f00393          	li	t2,159
 484:	006410a3          	sh	t1,1(s0)
 488:	00244e03          	lbu	t3,2(s0)
 48c:	25c39663          	bne	t2,t3,6d8 <fail>
 490:	05f00193          	li	gp,95
 494:	a3a2a337          	lui	t1,0xa3a2a
 498:	1a030313          	addi	t1,t1,416 # a3a2a1a0 <_end+0xa3a29720>
 49c:	fa000393          	li	t2,-96
 4a0:	006420a3          	sw	t1,1(s0)
 4a4:	00140e03          	lb	t3,1(s0)
 4a8:	23c39863          	bne	t2,t3,6d8 <fail>
 4ac:	06000193          	li	gp,96
 4b0:	a7a6a337          	lui	t1,0xa7a6a
 4b4:	5a430313          	addi	t1,t1,1444 # a7a6a5a4 <_end+0xa7a69b24>
 4b8:	0a500393          	li	t2,165
 4bc:	00642123          	sw	t1,2(s0)
 4c0:	00344e03          	lbu	t3,3(s0)
 4c4:	21c39a63          	bne	t2,t3,6d8 <fail>
 4c8:	06100193          	li	gp,97
 4cc:	abaab337          	lui	t1,0xabaab
 4d0:	9a830313          	addi	t1,t1,-1624 # abaaa9a8 <_end+0xabaa9f28>
 4d4:	ffffb3b7          	lui	t2,0xffffb
 4d8:	aa938393          	addi	t2,t2,-1367 # ffffaaa9 <_end+0xffffa029>
 4dc:	006421a3          	sw	t1,3(s0)
 4e0:	00441e03          	lh	t3,4(s0)
 4e4:	1fc39a63          	bne	t2,t3,6d8 <fail>
 4e8:	06200193          	li	gp,98
 4ec:	afaeb337          	lui	t1,0xafaeb
 4f0:	dac30313          	addi	t1,t1,-596 # afaeadac <_end+0xafaea32c>
 4f4:	0000b3b7          	lui	t2,0xb
 4f8:	fae38393          	addi	t2,t2,-82 # afae <_end+0xa52e>
 4fc:	006421a3          	sw	t1,3(s0)
 500:	00545e03          	lhu	t3,5(s0)
 504:	1dc39a63          	bne	t2,t3,6d8 <fail>
 508:	06a00193          	li	gp,106
 50c:	0000f337          	lui	t1,0xf
 510:	9e830313          	addi	t1,t1,-1560 # e9e8 <_end+0xdf68>
 514:	fe800393          	li	t2,-24
 518:	00641fa3          	sh	t1,31(s0)
 51c:	01f40e03          	lb	t3,31(s0)
 520:	1bc39c63          	bne	t2,t3,6d8 <fail>
 524:	06b00193          	li	gp,107
 528:	0000f337          	lui	t1,0xf
 52c:	bea30313          	addi	t1,t1,-1046 # ebea <_end+0xe16a>
 530:	feb00393          	li	t2,-21
 534:	00641fa3          	sh	t1,31(s0)
 538:	02040e03          	lb	t3,32(s0)
 53c:	19c39e63          	bne	t2,t3,6d8 <fail>
 540:	06c00193          	li	gp,108
 544:	0000f337          	lui	t1,0xf
 548:	dec30313          	addi	t1,t1,-532 # edec <_end+0xe36c>
 54c:	0ec00393          	li	t2,236
 550:	00641fa3          	sh	t1,31(s0)
 554:	01f44e03          	lbu	t3,31(s0)
 558:	19c39063          	bne	t2,t3,6d8 <fail>
 55c:	06d00193          	li	gp,109
 560:	0000f337          	lui	t1,0xf
 564:	fee30313          	addi	t1,t1,-18 # efee <_end+0xe56e>
 568:	0ef00393          	li	t2,239
 56c:	00641fa3          	sh	t1,31(s0)
 570:	02044e03          	lbu	t3,32(s0)
 574:	17c39263          	bne	t2,t3,6d8 <fail>
 578:	06e00193          	li	gp,110
 57c:	f3f2f337          	lui	t1,0xf3f2f
 580:	1f030313          	addi	t1,t1,496 # f3f2f1f0 <_end+0xf3f2e770>
 584:	ff000393          	li	t2,-16
 588:	00642ea3          	sw	t1,29(s0)
 58c:	01d40e03          	lb	t3,29(s0)
 590:	15c39463          	bne	t2,t3,6d8 <fail>
 594:	06f00193          	li	gp,111
 598:	f7f6f337          	lui	t1,0xf7f6f
 59c:	5f430313          	addi	t1,t1,1524 # f7f6f5f4 <_end+0xf7f6eb74>
 5a0:	0f600393          	li	t2,246
 5a4:	00642f23          	sw	t1,30(s0)
 5a8:	02044e03          	lbu	t3,32(s0)
 5ac:	13c39663          	bne	t2,t3,6d8 <fail>
 5b0:	07000193          	li	gp,112
 5b4:	fbfb0337          	lui	t1,0xfbfb0
 5b8:	9f830313          	addi	t1,t1,-1544 # fbfaf9f8 <_end+0xfbfaef78>
 5bc:	bfa00393          	li	t2,-1030
 5c0:	00642ea3          	sw	t1,29(s0)
 5c4:	01f41e03          	lh	t3,31(s0)
 5c8:	11c39863          	bne	t2,t3,6d8 <fail>
 5cc:	07100193          	li	gp,113
 5d0:	ffff0337          	lui	t1,0xffff0
 5d4:	dfc30313          	addi	t1,t1,-516 # fffefdfc <_end+0xfffef37c>
 5d8:	000103b7          	lui	t2,0x10
 5dc:	dfc38393          	addi	t2,t2,-516 # fdfc <_end+0xf37c>
 5e0:	00642fa3          	sw	t1,31(s0)
 5e4:	01f45e03          	lhu	t3,31(s0)
 5e8:	0fc39863          	bne	t2,t3,6d8 <fail>
 5ec:	07900193          	li	gp,121
 5f0:	00005337          	lui	t1,0x5
 5f4:	94830313          	addi	t1,t1,-1720 # 4948 <_end+0x3ec8>
 5f8:	04800393          	li	t2,72
 5fc:	02641fa3          	sh	t1,63(s0)
 600:	03f40e03          	lb	t3,63(s0)
 604:	0dc39a63          	bne	t2,t3,6d8 <fail>
 608:	07a00193          	li	gp,122
 60c:	00005337          	lui	t1,0x5
 610:	b4a30313          	addi	t1,t1,-1206 # 4b4a <_end+0x40ca>
 614:	04b00393          	li	t2,75
 618:	02641fa3          	sh	t1,63(s0)
 61c:	04040e03          	lb	t3,64(s0)
 620:	0bc39c63          	bne	t2,t3,6d8 <fail>
 624:	07b00193          	li	gp,123
 628:	00005337          	lui	t1,0x5
 62c:	d4c30313          	addi	t1,t1,-692 # 4d4c <_end+0x42cc>
 630:	04c00393          	li	t2,76
 634:	02641fa3          	sh	t1,63(s0)
 638:	03f44e03          	lbu	t3,63(s0)
 63c:	09c39e63          	bne	t2,t3,6d8 <fail>
 640:	07c00193          	li	gp,124
 644:	00005337          	lui	t1,0x5
 648:	f4e30313          	addi	t1,t1,-178 # 4f4e <_end+0x44ce>
 64c:	04f00393          	li	t2,79
 650:	02641fa3          	sh	t1,63(s0)
 654:	04044e03          	lbu	t3,64(s0)
 658:	09c39063          	bne	t2,t3,6d8 <fail>
 65c:	07d00193          	li	gp,125
 660:	53525337          	lui	t1,0x53525
 664:	15030313          	addi	t1,t1,336 # 53525150 <_end+0x535246d0>
 668:	05000393          	li	t2,80
 66c:	02642ea3          	sw	t1,61(s0)
 670:	03d40e03          	lb	t3,61(s0)
 674:	07c39263          	bne	t2,t3,6d8 <fail>
 678:	07e00193          	li	gp,126
 67c:	57565337          	lui	t1,0x57565
 680:	55430313          	addi	t1,t1,1364 # 57565554 <_end+0x57564ad4>
 684:	05600393          	li	t2,86
 688:	02642f23          	sw	t1,62(s0)
 68c:	04044e03          	lbu	t3,64(s0)
 690:	05c39463          	bne	t2,t3,6d8 <fail>
 694:	07f00193          	li	gp,127
 698:	5b5a6337          	lui	t1,0x5b5a6
 69c:	95830313          	addi	t1,t1,-1704 # 5b5a5958 <_end+0x5b5a4ed8>
 6a0:	000063b7          	lui	t2,0x6
 6a4:	b5a38393          	addi	t2,t2,-1190 # 5b5a <_end+0x50da>
 6a8:	02642ea3          	sw	t1,61(s0)
 6ac:	03f41e03          	lh	t3,63(s0)
 6b0:	03c39463          	bne	t2,t3,6d8 <fail>
 6b4:	08000193          	li	gp,128
 6b8:	5f5e6337          	lui	t1,0x5f5e6
 6bc:	d5c30313          	addi	t1,t1,-676 # 5f5e5d5c <_end+0x5f5e52dc>
 6c0:	000063b7          	lui	t2,0x6
 6c4:	d5c38393          	addi	t2,t2,-676 # 5d5c <_end+0x52dc>
 6c8:	02642fa3          	sw	t1,63(s0)
 6cc:	03f45e03          	lhu	t3,63(s0)
 6d0:	01c39463          	bne	t2,t3,6d8 <fail>
 6d4:	02301063          	bne	zero,gp,6f4 <pass>

000006d8 <fail>:
 6d8:	0ff0000f          	fence
 6dc:	00018063          	beqz	gp,6dc <fail+0x4>
 6e0:	00119193          	slli	gp,gp,0x1
 6e4:	0011e193          	ori	gp,gp,1
 6e8:	05d00893          	li	a7,93
 6ec:	00018513          	mv	a0,gp
 6f0:	00000073          	ecall

000006f4 <pass>:
 6f4:	0ff0000f          	fence
 6f8:	00100193          	li	gp,1
 6fc:	05d00893          	li	a7,93
 700:	00000513          	li	a0,0
 704:	00000073          	ecall
 708:	c0001073          	unimp
 70c:	0000                	.insn	2, 0x
 70e:	0000                	.insn	2, 0x
 710:	0000                	.insn	2, 0x
 712:	0000                	.insn	2, 0x
 714:	0000                	.insn	2, 0x
 716:	0000                	.insn	2, 0x
 718:	0000                	.insn	2, 0x
 71a:	0000                	.insn	2, 0x
 71c:	0000                	.insn	2, 0x
 71e:	0000                	.insn	2, 0x
 720:	0000                	.insn	2, 0x
 722:	0000                	.insn	2, 0x
 724:	0000                	.insn	2, 0x
 726:	0000                	.insn	2, 0x
 728:	0000                	.insn	2, 0x
 72a:	0000                	.insn	2, 0x
 72c:	0000                	.insn	2, 0x
 72e:	0000                	.insn	2, 0x
 730:	0000                	.insn	2, 0x
 732:	0000                	.insn	2, 0x
 734:	0000                	.insn	2, 0x
 736:	0000                	.insn	2, 0x
 738:	0000                	.insn	2, 0x
 73a:	0000                	.insn	2, 0x

Disassembly of section .data:

00000900 <begin_signature>:
 900:	0100                	.insn	2, 0x0100
 902:	0302                	.insn	2, 0x0302
 904:	0504                	.insn	2, 0x0504
 906:	0706                	.insn	2, 0x0706
 908:	0908                	.insn	2, 0x0908
 90a:	0b0a                	.insn	2, 0x0b0a
 90c:	0d0c                	.insn	2, 0x0d0c
 90e:	0f0e                	.insn	2, 0x0f0e
 910:	1110                	.insn	2, 0x1110
 912:	1312                	.insn	2, 0x1312
 914:	1514                	.insn	2, 0x1514
 916:	1716                	.insn	2, 0x1716
 918:	1918                	.insn	2, 0x1918
 91a:	1b1a                	.insn	2, 0x1b1a
 91c:	1d1c                	.insn	2, 0x1d1c
 91e:	1f1e                	.insn	2, 0x1f1e
 920:	2120                	.insn	2, 0x2120
 922:	2322                	.insn	2, 0x2322
 924:	2524                	.insn	2, 0x2524
 926:	2726                	.insn	2, 0x2726
 928:	2928                	.insn	2, 0x2928
 92a:	2b2a                	.insn	2, 0x2b2a
 92c:	2d2c                	.insn	2, 0x2d2c
 92e:	2f2e                	.insn	2, 0x2f2e
 930:	3130                	.insn	2, 0x3130
 932:	3332                	.insn	2, 0x3332
 934:	3534                	.insn	2, 0x3534
 936:	3736                	.insn	2, 0x3736
 938:	3938                	.insn	2, 0x3938
 93a:	3b3a                	.insn	2, 0x3b3a
 93c:	3d3c                	.insn	2, 0x3d3c
 93e:	3f3e                	.insn	2, 0x3f3e
 940:	4140                	.insn	2, 0x4140
 942:	4342                	.insn	2, 0x4342
 944:	4544                	.insn	2, 0x4544
 946:	4746                	.insn	2, 0x4746
 948:	4948                	.insn	2, 0x4948
 94a:	4b4a                	.insn	2, 0x4b4a
 94c:	4d4c                	.insn	2, 0x4d4c
 94e:	4f4e                	.insn	2, 0x4f4e
 950:	5150                	.insn	2, 0x5150
 952:	5352                	.insn	2, 0x5352
 954:	5554                	.insn	2, 0x5554
 956:	5756                	.insn	2, 0x5756
 958:	5958                	.insn	2, 0x5958
 95a:	5b5a                	.insn	2, 0x5b5a
 95c:	5d5c                	.insn	2, 0x5d5c
 95e:	5f5e                	.insn	2, 0x5f5e
 960:	6160                	.insn	2, 0x6160
 962:	6362                	.insn	2, 0x6362
 964:	6564                	.insn	2, 0x6564
 966:	6766                	.insn	2, 0x6766
 968:	6968                	.insn	2, 0x6968
 96a:	6b6a                	.insn	2, 0x6b6a
 96c:	6d6c                	.insn	2, 0x6d6c
 96e:	6f6e                	.insn	2, 0x6f6e
 970:	7170                	.insn	2, 0x7170
 972:	7372                	.insn	2, 0x7372
 974:	7574                	.insn	2, 0x7574
 976:	7776                	.insn	2, 0x7776
 978:	7978                	.insn	2, 0x7978
 97a:	7b7a                	.insn	2, 0x7b7a
 97c:	7d7c                	.insn	2, 0x7d7c
 97e:	7f7e                	.insn	2, 0x7f7e
 980:	5050                	.insn	2, 0x5050
 982:	5050                	.insn	2, 0x5050
 984:	5050                	.insn	2, 0x5050
 986:	5050                	.insn	2, 0x5050
 988:	5050                	.insn	2, 0x5050
 98a:	5050                	.insn	2, 0x5050
 98c:	5050                	.insn	2, 0x5050
 98e:	5050                	.insn	2, 0x5050
 990:	5050                	.insn	2, 0x5050
 992:	5050                	.insn	2, 0x5050
 994:	5050                	.insn	2, 0x5050
 996:	5050                	.insn	2, 0x5050
 998:	5050                	.insn	2, 0x5050
 99a:	5050                	.insn	2, 0x5050
 99c:	5050                	.insn	2, 0x5050
 99e:	5050                	.insn	2, 0x5050
 9a0:	5050                	.insn	2, 0x5050
 9a2:	5050                	.insn	2, 0x5050
 9a4:	5050                	.insn	2, 0x5050
 9a6:	5050                	.insn	2, 0x5050
 9a8:	5050                	.insn	2, 0x5050
 9aa:	5050                	.insn	2, 0x5050
 9ac:	5050                	.insn	2, 0x5050
 9ae:	5050                	.insn	2, 0x5050
 9b0:	5050                	.insn	2, 0x5050
 9b2:	5050                	.insn	2, 0x5050
 9b4:	5050                	.insn	2, 0x5050
 9b6:	5050                	.insn	2, 0x5050
 9b8:	5050                	.insn	2, 0x5050
 9ba:	5050                	.insn	2, 0x5050
 9bc:	5050                	.insn	2, 0x5050
 9be:	5050                	.insn	2, 0x5050
 9c0:	5050                	.insn	2, 0x5050
 9c2:	5050                	.insn	2, 0x5050
 9c4:	5050                	.insn	2, 0x5050
 9c6:	5050                	.insn	2, 0x5050
 9c8:	5050                	.insn	2, 0x5050
 9ca:	5050                	.insn	2, 0x5050
 9cc:	5050                	.insn	2, 0x5050
 9ce:	5050                	.insn	2, 0x5050
 9d0:	5050                	.insn	2, 0x5050
 9d2:	5050                	.insn	2, 0x5050
 9d4:	5050                	.insn	2, 0x5050
 9d6:	5050                	.insn	2, 0x5050
 9d8:	5050                	.insn	2, 0x5050
 9da:	5050                	.insn	2, 0x5050
 9dc:	5050                	.insn	2, 0x5050
 9de:	5050                	.insn	2, 0x5050
 9e0:	5050                	.insn	2, 0x5050
 9e2:	5050                	.insn	2, 0x5050
 9e4:	5050                	.insn	2, 0x5050
 9e6:	5050                	.insn	2, 0x5050
 9e8:	5050                	.insn	2, 0x5050
 9ea:	5050                	.insn	2, 0x5050
 9ec:	5050                	.insn	2, 0x5050
 9ee:	5050                	.insn	2, 0x5050
 9f0:	5050                	.insn	2, 0x5050
 9f2:	5050                	.insn	2, 0x5050
 9f4:	5050                	.insn	2, 0x5050
 9f6:	5050                	.insn	2, 0x5050
 9f8:	5050                	.insn	2, 0x5050
 9fa:	5050                	.insn	2, 0x5050
 9fc:	5050                	.insn	2, 0x5050
 9fe:	5050                	.insn	2, 0x5050
 a00:	5050                	.insn	2, 0x5050
 a02:	5050                	.insn	2, 0x5050
 a04:	5050                	.insn	2, 0x5050
 a06:	5050                	.insn	2, 0x5050
 a08:	5050                	.insn	2, 0x5050
 a0a:	5050                	.insn	2, 0x5050
 a0c:	5050                	.insn	2, 0x5050
 a0e:	5050                	.insn	2, 0x5050
 a10:	5050                	.insn	2, 0x5050
 a12:	5050                	.insn	2, 0x5050
 a14:	5050                	.insn	2, 0x5050
 a16:	5050                	.insn	2, 0x5050
 a18:	5050                	.insn	2, 0x5050
 a1a:	5050                	.insn	2, 0x5050
 a1c:	5050                	.insn	2, 0x5050
 a1e:	5050                	.insn	2, 0x5050
 a20:	5050                	.insn	2, 0x5050
 a22:	5050                	.insn	2, 0x5050
 a24:	5050                	.insn	2, 0x5050
 a26:	5050                	.insn	2, 0x5050
 a28:	5050                	.insn	2, 0x5050
 a2a:	5050                	.insn	2, 0x5050
 a2c:	5050                	.insn	2, 0x5050
 a2e:	5050                	.insn	2, 0x5050
 a30:	5050                	.insn	2, 0x5050
 a32:	5050                	.insn	2, 0x5050
 a34:	5050                	.insn	2, 0x5050
 a36:	5050                	.insn	2, 0x5050
 a38:	5050                	.insn	2, 0x5050
 a3a:	5050                	.insn	2, 0x5050
 a3c:	5050                	.insn	2, 0x5050
 a3e:	5050                	.insn	2, 0x5050
 a40:	5050                	.insn	2, 0x5050
 a42:	5050                	.insn	2, 0x5050
 a44:	5050                	.insn	2, 0x5050
 a46:	5050                	.insn	2, 0x5050
 a48:	5050                	.insn	2, 0x5050
 a4a:	5050                	.insn	2, 0x5050
 a4c:	5050                	.insn	2, 0x5050
 a4e:	5050                	.insn	2, 0x5050
 a50:	5050                	.insn	2, 0x5050
 a52:	5050                	.insn	2, 0x5050
 a54:	5050                	.insn	2, 0x5050
 a56:	5050                	.insn	2, 0x5050
 a58:	5050                	.insn	2, 0x5050
 a5a:	5050                	.insn	2, 0x5050
 a5c:	5050                	.insn	2, 0x5050
 a5e:	5050                	.insn	2, 0x5050
 a60:	5050                	.insn	2, 0x5050
 a62:	5050                	.insn	2, 0x5050
 a64:	5050                	.insn	2, 0x5050
 a66:	5050                	.insn	2, 0x5050
 a68:	5050                	.insn	2, 0x5050
 a6a:	5050                	.insn	2, 0x5050
 a6c:	5050                	.insn	2, 0x5050
 a6e:	5050                	.insn	2, 0x5050
 a70:	5050                	.insn	2, 0x5050
 a72:	5050                	.insn	2, 0x5050
 a74:	5050                	.insn	2, 0x5050
 a76:	5050                	.insn	2, 0x5050
 a78:	5050                	.insn	2, 0x5050
 a7a:	5050                	.insn	2, 0x5050
 a7c:	5050                	.insn	2, 0x5050
 a7e:	0050                	.insn	2, 0x0050
