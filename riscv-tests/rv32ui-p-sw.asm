
rv32ui-p-sw:     file format elf32-littleriscv


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
  40:	6c3f2223          	sw	gp,1732(t5) # 700 <tohost>
  44:	00000f17          	auipc	t5,0x0
  48:	6c0f2023          	sw	zero,1728(t5) # 704 <tohost+0x4>
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
 104:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffff7cf>
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
 16c:	10928293          	addi	t0,t0,265 # b109 <_end+0xa8d9>
 170:	30229073          	csrw	medeleg,t0
 174:	30005073          	csrwi	mstatus,0
 178:	00000297          	auipc	t0,0x0
 17c:	01428293          	addi	t0,t0,20 # 18c <test_2>
 180:	34129073          	csrw	mepc,t0
 184:	f1402573          	csrr	a0,mhartid
 188:	30200073          	mret

0000018c <test_2>:
 18c:	00200193          	li	gp,2
 190:	00000117          	auipc	sp,0x0
 194:	67010113          	addi	sp,sp,1648 # 800 <begin_signature>
 198:	00aa00b7          	lui	ra,0xaa0
 19c:	0aa08093          	addi	ra,ra,170 # aa00aa <_end+0xa9f87a>
 1a0:	00000797          	auipc	a5,0x0
 1a4:	01478793          	addi	a5,a5,20 # 1b4 <test_2+0x28>
 1a8:	00112023          	sw	ra,0(sp)
 1ac:	00012703          	lw	a4,0(sp)
 1b0:	0080006f          	j	1b8 <test_2+0x2c>
 1b4:	00008713          	mv	a4,ra
 1b8:	00aa03b7          	lui	t2,0xaa0
 1bc:	0aa38393          	addi	t2,t2,170 # aa00aa <_end+0xa9f87a>
 1c0:	4c771863          	bne	a4,t2,690 <fail>

000001c4 <test_3>:
 1c4:	00300193          	li	gp,3
 1c8:	00000117          	auipc	sp,0x0
 1cc:	63810113          	addi	sp,sp,1592 # 800 <begin_signature>
 1d0:	aa00b0b7          	lui	ra,0xaa00b
 1d4:	a0008093          	addi	ra,ra,-1536 # aa00aa00 <_end+0xaa00a1d0>
 1d8:	00000797          	auipc	a5,0x0
 1dc:	01478793          	addi	a5,a5,20 # 1ec <test_3+0x28>
 1e0:	00112223          	sw	ra,4(sp)
 1e4:	00412703          	lw	a4,4(sp)
 1e8:	0080006f          	j	1f0 <test_3+0x2c>
 1ec:	00008713          	mv	a4,ra
 1f0:	aa00b3b7          	lui	t2,0xaa00b
 1f4:	a0038393          	addi	t2,t2,-1536 # aa00aa00 <_end+0xaa00a1d0>
 1f8:	48771c63          	bne	a4,t2,690 <fail>

000001fc <test_4>:
 1fc:	00400193          	li	gp,4
 200:	00000117          	auipc	sp,0x0
 204:	60010113          	addi	sp,sp,1536 # 800 <begin_signature>
 208:	0aa010b7          	lui	ra,0xaa01
 20c:	aa008093          	addi	ra,ra,-1376 # aa00aa0 <_end+0xaa00270>
 210:	00000797          	auipc	a5,0x0
 214:	01478793          	addi	a5,a5,20 # 224 <test_4+0x28>
 218:	00112423          	sw	ra,8(sp)
 21c:	00812703          	lw	a4,8(sp)
 220:	0080006f          	j	228 <test_4+0x2c>
 224:	00008713          	mv	a4,ra
 228:	0aa013b7          	lui	t2,0xaa01
 22c:	aa038393          	addi	t2,t2,-1376 # aa00aa0 <_end+0xaa00270>
 230:	46771063          	bne	a4,t2,690 <fail>

00000234 <test_5>:
 234:	00500193          	li	gp,5
 238:	00000117          	auipc	sp,0x0
 23c:	5c810113          	addi	sp,sp,1480 # 800 <begin_signature>
 240:	a00aa0b7          	lui	ra,0xa00aa
 244:	00a08093          	addi	ra,ra,10 # a00aa00a <_end+0xa00a97da>
 248:	00000797          	auipc	a5,0x0
 24c:	01478793          	addi	a5,a5,20 # 25c <test_5+0x28>
 250:	00112623          	sw	ra,12(sp)
 254:	00c12703          	lw	a4,12(sp)
 258:	0080006f          	j	260 <test_5+0x2c>
 25c:	00008713          	mv	a4,ra
 260:	a00aa3b7          	lui	t2,0xa00aa
 264:	00a38393          	addi	t2,t2,10 # a00aa00a <_end+0xa00a97da>
 268:	42771463          	bne	a4,t2,690 <fail>

0000026c <test_6>:
 26c:	00600193          	li	gp,6
 270:	00000117          	auipc	sp,0x0
 274:	5ac10113          	addi	sp,sp,1452 # 81c <tdat8>
 278:	00aa00b7          	lui	ra,0xaa0
 27c:	0aa08093          	addi	ra,ra,170 # aa00aa <_end+0xa9f87a>
 280:	00000797          	auipc	a5,0x0
 284:	01478793          	addi	a5,a5,20 # 294 <test_6+0x28>
 288:	fe112a23          	sw	ra,-12(sp)
 28c:	ff412703          	lw	a4,-12(sp)
 290:	0080006f          	j	298 <test_6+0x2c>
 294:	00008713          	mv	a4,ra
 298:	00aa03b7          	lui	t2,0xaa0
 29c:	0aa38393          	addi	t2,t2,170 # aa00aa <_end+0xa9f87a>
 2a0:	3e771863          	bne	a4,t2,690 <fail>

000002a4 <test_7>:
 2a4:	00700193          	li	gp,7
 2a8:	00000117          	auipc	sp,0x0
 2ac:	57410113          	addi	sp,sp,1396 # 81c <tdat8>
 2b0:	aa00b0b7          	lui	ra,0xaa00b
 2b4:	a0008093          	addi	ra,ra,-1536 # aa00aa00 <_end+0xaa00a1d0>
 2b8:	00000797          	auipc	a5,0x0
 2bc:	01478793          	addi	a5,a5,20 # 2cc <test_7+0x28>
 2c0:	fe112c23          	sw	ra,-8(sp)
 2c4:	ff812703          	lw	a4,-8(sp)
 2c8:	0080006f          	j	2d0 <test_7+0x2c>
 2cc:	00008713          	mv	a4,ra
 2d0:	aa00b3b7          	lui	t2,0xaa00b
 2d4:	a0038393          	addi	t2,t2,-1536 # aa00aa00 <_end+0xaa00a1d0>
 2d8:	3a771c63          	bne	a4,t2,690 <fail>

000002dc <test_8>:
 2dc:	00800193          	li	gp,8
 2e0:	00000117          	auipc	sp,0x0
 2e4:	53c10113          	addi	sp,sp,1340 # 81c <tdat8>
 2e8:	0aa010b7          	lui	ra,0xaa01
 2ec:	aa008093          	addi	ra,ra,-1376 # aa00aa0 <_end+0xaa00270>
 2f0:	00000797          	auipc	a5,0x0
 2f4:	01478793          	addi	a5,a5,20 # 304 <test_8+0x28>
 2f8:	fe112e23          	sw	ra,-4(sp)
 2fc:	ffc12703          	lw	a4,-4(sp)
 300:	0080006f          	j	308 <test_8+0x2c>
 304:	00008713          	mv	a4,ra
 308:	0aa013b7          	lui	t2,0xaa01
 30c:	aa038393          	addi	t2,t2,-1376 # aa00aa0 <_end+0xaa00270>
 310:	38771063          	bne	a4,t2,690 <fail>

00000314 <test_9>:
 314:	00900193          	li	gp,9
 318:	00000117          	auipc	sp,0x0
 31c:	50410113          	addi	sp,sp,1284 # 81c <tdat8>
 320:	a00aa0b7          	lui	ra,0xa00aa
 324:	00a08093          	addi	ra,ra,10 # a00aa00a <_end+0xa00a97da>
 328:	00000797          	auipc	a5,0x0
 32c:	01478793          	addi	a5,a5,20 # 33c <test_9+0x28>
 330:	00112023          	sw	ra,0(sp)
 334:	00012703          	lw	a4,0(sp)
 338:	0080006f          	j	340 <test_9+0x2c>
 33c:	00008713          	mv	a4,ra
 340:	a00aa3b7          	lui	t2,0xa00aa
 344:	00a38393          	addi	t2,t2,10 # a00aa00a <_end+0xa00a97da>
 348:	34771463          	bne	a4,t2,690 <fail>

0000034c <test_10>:
 34c:	00a00193          	li	gp,10
 350:	00000097          	auipc	ra,0x0
 354:	4d008093          	addi	ra,ra,1232 # 820 <tdat9>
 358:	12345137          	lui	sp,0x12345
 35c:	67810113          	addi	sp,sp,1656 # 12345678 <_end+0x12344e48>
 360:	fe008213          	addi	tp,ra,-32
 364:	02222023          	sw	sp,32(tp) # 20 <trap_vector+0x1c>
 368:	0000a283          	lw	t0,0(ra)
 36c:	123453b7          	lui	t2,0x12345
 370:	67838393          	addi	t2,t2,1656 # 12345678 <_end+0x12344e48>
 374:	30729e63          	bne	t0,t2,690 <fail>

00000378 <test_11>:
 378:	00b00193          	li	gp,11
 37c:	00000097          	auipc	ra,0x0
 380:	4a408093          	addi	ra,ra,1188 # 820 <tdat9>
 384:	58213137          	lui	sp,0x58213
 388:	09810113          	addi	sp,sp,152 # 58213098 <_end+0x58212868>
 38c:	ffd08093          	addi	ra,ra,-3
 390:	0020a3a3          	sw	sp,7(ra)
 394:	00000217          	auipc	tp,0x0
 398:	49020213          	addi	tp,tp,1168 # 824 <tdat10>
 39c:	00022283          	lw	t0,0(tp) # 0 <_start>
 3a0:	582133b7          	lui	t2,0x58213
 3a4:	09838393          	addi	t2,t2,152 # 58213098 <_end+0x58212868>
 3a8:	2e729463          	bne	t0,t2,690 <fail>

000003ac <test_12>:
 3ac:	00c00193          	li	gp,12
 3b0:	00000213          	li	tp,0
 3b4:	aabbd6b7          	lui	a3,0xaabbd
 3b8:	cdd68693          	addi	a3,a3,-803 # aabbccdd <_end+0xaabbc4ad>
 3bc:	00000617          	auipc	a2,0x0
 3c0:	44460613          	addi	a2,a2,1092 # 800 <begin_signature>
 3c4:	00d62023          	sw	a3,0(a2)
 3c8:	00062703          	lw	a4,0(a2)
 3cc:	aabbd3b7          	lui	t2,0xaabbd
 3d0:	cdd38393          	addi	t2,t2,-803 # aabbccdd <_end+0xaabbc4ad>
 3d4:	2a771e63          	bne	a4,t2,690 <fail>
 3d8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 3dc:	00200293          	li	t0,2
 3e0:	fc521ae3          	bne	tp,t0,3b4 <test_12+0x8>

000003e4 <test_13>:
 3e4:	00d00193          	li	gp,13
 3e8:	00000213          	li	tp,0
 3ec:	daabc6b7          	lui	a3,0xdaabc
 3f0:	ccd68693          	addi	a3,a3,-819 # daabbccd <_end+0xdaabb49d>
 3f4:	00000617          	auipc	a2,0x0
 3f8:	40c60613          	addi	a2,a2,1036 # 800 <begin_signature>
 3fc:	00000013          	nop
 400:	00d62223          	sw	a3,4(a2)
 404:	00462703          	lw	a4,4(a2)
 408:	daabc3b7          	lui	t2,0xdaabc
 40c:	ccd38393          	addi	t2,t2,-819 # daabbccd <_end+0xdaabb49d>
 410:	28771063          	bne	a4,t2,690 <fail>
 414:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 418:	00200293          	li	t0,2
 41c:	fc5218e3          	bne	tp,t0,3ec <test_13+0x8>

00000420 <test_14>:
 420:	00e00193          	li	gp,14
 424:	00000213          	li	tp,0
 428:	ddaac6b7          	lui	a3,0xddaac
 42c:	bcc68693          	addi	a3,a3,-1076 # ddaabbcc <_end+0xddaab39c>
 430:	00000617          	auipc	a2,0x0
 434:	3d060613          	addi	a2,a2,976 # 800 <begin_signature>
 438:	00000013          	nop
 43c:	00000013          	nop
 440:	00d62423          	sw	a3,8(a2)
 444:	00862703          	lw	a4,8(a2)
 448:	ddaac3b7          	lui	t2,0xddaac
 44c:	bcc38393          	addi	t2,t2,-1076 # ddaabbcc <_end+0xddaab39c>
 450:	24771063          	bne	a4,t2,690 <fail>
 454:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 458:	00200293          	li	t0,2
 45c:	fc5216e3          	bne	tp,t0,428 <test_14+0x8>

00000460 <test_15>:
 460:	00f00193          	li	gp,15
 464:	00000213          	li	tp,0
 468:	cddab6b7          	lui	a3,0xcddab
 46c:	bbc68693          	addi	a3,a3,-1092 # cddaabbc <_end+0xcddaa38c>
 470:	00000013          	nop
 474:	00000617          	auipc	a2,0x0
 478:	38c60613          	addi	a2,a2,908 # 800 <begin_signature>
 47c:	00d62623          	sw	a3,12(a2)
 480:	00c62703          	lw	a4,12(a2)
 484:	cddab3b7          	lui	t2,0xcddab
 488:	bbc38393          	addi	t2,t2,-1092 # cddaabbc <_end+0xcddaa38c>
 48c:	20771263          	bne	a4,t2,690 <fail>
 490:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 494:	00200293          	li	t0,2
 498:	fc5218e3          	bne	tp,t0,468 <test_15+0x8>

0000049c <test_16>:
 49c:	01000193          	li	gp,16
 4a0:	00000213          	li	tp,0
 4a4:	ccddb6b7          	lui	a3,0xccddb
 4a8:	abb68693          	addi	a3,a3,-1349 # ccddaabb <_end+0xccdda28b>
 4ac:	00000013          	nop
 4b0:	00000617          	auipc	a2,0x0
 4b4:	35060613          	addi	a2,a2,848 # 800 <begin_signature>
 4b8:	00000013          	nop
 4bc:	00d62823          	sw	a3,16(a2)
 4c0:	01062703          	lw	a4,16(a2)
 4c4:	ccddb3b7          	lui	t2,0xccddb
 4c8:	abb38393          	addi	t2,t2,-1349 # ccddaabb <_end+0xccdda28b>
 4cc:	1c771263          	bne	a4,t2,690 <fail>
 4d0:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 4d4:	00200293          	li	t0,2
 4d8:	fc5216e3          	bne	tp,t0,4a4 <test_16+0x8>

000004dc <test_17>:
 4dc:	01100193          	li	gp,17
 4e0:	00000213          	li	tp,0
 4e4:	bccde6b7          	lui	a3,0xbccde
 4e8:	aab68693          	addi	a3,a3,-1365 # bccddaab <_end+0xbccdd27b>
 4ec:	00000013          	nop
 4f0:	00000013          	nop
 4f4:	00000617          	auipc	a2,0x0
 4f8:	30c60613          	addi	a2,a2,780 # 800 <begin_signature>
 4fc:	00d62a23          	sw	a3,20(a2)
 500:	01462703          	lw	a4,20(a2)
 504:	bccde3b7          	lui	t2,0xbccde
 508:	aab38393          	addi	t2,t2,-1365 # bccddaab <_end+0xbccdd27b>
 50c:	18771263          	bne	a4,t2,690 <fail>
 510:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 514:	00200293          	li	t0,2
 518:	fc5216e3          	bne	tp,t0,4e4 <test_17+0x8>

0000051c <test_18>:
 51c:	01200193          	li	gp,18
 520:	00000213          	li	tp,0
 524:	00000117          	auipc	sp,0x0
 528:	2dc10113          	addi	sp,sp,732 # 800 <begin_signature>
 52c:	001120b7          	lui	ra,0x112
 530:	23308093          	addi	ra,ra,563 # 112233 <_end+0x111a03>
 534:	00112023          	sw	ra,0(sp)
 538:	00012703          	lw	a4,0(sp)
 53c:	001123b7          	lui	t2,0x112
 540:	23338393          	addi	t2,t2,563 # 112233 <_end+0x111a03>
 544:	14771663          	bne	a4,t2,690 <fail>
 548:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 54c:	00200293          	li	t0,2
 550:	fc521ae3          	bne	tp,t0,524 <test_18+0x8>

00000554 <test_19>:
 554:	01300193          	li	gp,19
 558:	00000213          	li	tp,0
 55c:	00000117          	auipc	sp,0x0
 560:	2a410113          	addi	sp,sp,676 # 800 <begin_signature>
 564:	300110b7          	lui	ra,0x30011
 568:	22308093          	addi	ra,ra,547 # 30011223 <_end+0x300109f3>
 56c:	00000013          	nop
 570:	00112223          	sw	ra,4(sp)
 574:	00412703          	lw	a4,4(sp)
 578:	300113b7          	lui	t2,0x30011
 57c:	22338393          	addi	t2,t2,547 # 30011223 <_end+0x300109f3>
 580:	10771863          	bne	a4,t2,690 <fail>
 584:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 588:	00200293          	li	t0,2
 58c:	fc5218e3          	bne	tp,t0,55c <test_19+0x8>

00000590 <test_20>:
 590:	01400193          	li	gp,20
 594:	00000213          	li	tp,0
 598:	00000117          	auipc	sp,0x0
 59c:	26810113          	addi	sp,sp,616 # 800 <begin_signature>
 5a0:	330010b7          	lui	ra,0x33001
 5a4:	12208093          	addi	ra,ra,290 # 33001122 <_end+0x330008f2>
 5a8:	00000013          	nop
 5ac:	00000013          	nop
 5b0:	00112423          	sw	ra,8(sp)
 5b4:	00812703          	lw	a4,8(sp)
 5b8:	330013b7          	lui	t2,0x33001
 5bc:	12238393          	addi	t2,t2,290 # 33001122 <_end+0x330008f2>
 5c0:	0c771863          	bne	a4,t2,690 <fail>
 5c4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 5c8:	00200293          	li	t0,2
 5cc:	fc5216e3          	bne	tp,t0,598 <test_20+0x8>

000005d0 <test_21>:
 5d0:	01500193          	li	gp,21
 5d4:	00000213          	li	tp,0
 5d8:	00000117          	auipc	sp,0x0
 5dc:	22810113          	addi	sp,sp,552 # 800 <begin_signature>
 5e0:	00000013          	nop
 5e4:	233000b7          	lui	ra,0x23300
 5e8:	11208093          	addi	ra,ra,274 # 23300112 <_end+0x232ff8e2>
 5ec:	00112623          	sw	ra,12(sp)
 5f0:	00c12703          	lw	a4,12(sp)
 5f4:	233003b7          	lui	t2,0x23300
 5f8:	11238393          	addi	t2,t2,274 # 23300112 <_end+0x232ff8e2>
 5fc:	08771a63          	bne	a4,t2,690 <fail>
 600:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 604:	00200293          	li	t0,2
 608:	fc5218e3          	bne	tp,t0,5d8 <test_21+0x8>

0000060c <test_22>:
 60c:	01600193          	li	gp,22
 610:	00000213          	li	tp,0
 614:	00000117          	auipc	sp,0x0
 618:	1ec10113          	addi	sp,sp,492 # 800 <begin_signature>
 61c:	00000013          	nop
 620:	223300b7          	lui	ra,0x22330
 624:	01108093          	addi	ra,ra,17 # 22330011 <_end+0x2232f7e1>
 628:	00000013          	nop
 62c:	00112823          	sw	ra,16(sp)
 630:	01012703          	lw	a4,16(sp)
 634:	223303b7          	lui	t2,0x22330
 638:	01138393          	addi	t2,t2,17 # 22330011 <_end+0x2232f7e1>
 63c:	04771a63          	bne	a4,t2,690 <fail>
 640:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 644:	00200293          	li	t0,2
 648:	fc5216e3          	bne	tp,t0,614 <test_22+0x8>

0000064c <test_23>:
 64c:	01700193          	li	gp,23
 650:	00000213          	li	tp,0
 654:	00000117          	auipc	sp,0x0
 658:	1ac10113          	addi	sp,sp,428 # 800 <begin_signature>
 65c:	00000013          	nop
 660:	00000013          	nop
 664:	122330b7          	lui	ra,0x12233
 668:	00108093          	addi	ra,ra,1 # 12233001 <_end+0x122327d1>
 66c:	00112a23          	sw	ra,20(sp)
 670:	01412703          	lw	a4,20(sp)
 674:	122333b7          	lui	t2,0x12233
 678:	00138393          	addi	t2,t2,1 # 12233001 <_end+0x122327d1>
 67c:	00771a63          	bne	a4,t2,690 <fail>
 680:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 684:	00200293          	li	t0,2
 688:	fc5216e3          	bne	tp,t0,654 <test_23+0x8>
 68c:	02301063          	bne	zero,gp,6ac <pass>

00000690 <fail>:
 690:	0ff0000f          	fence
 694:	00018063          	beqz	gp,694 <fail+0x4>
 698:	00119193          	slli	gp,gp,0x1
 69c:	0011e193          	ori	gp,gp,1
 6a0:	05d00893          	li	a7,93
 6a4:	00018513          	mv	a0,gp
 6a8:	00000073          	ecall

000006ac <pass>:
 6ac:	0ff0000f          	fence
 6b0:	00100193          	li	gp,1
 6b4:	05d00893          	li	a7,93
 6b8:	00000513          	li	a0,0
 6bc:	00000073          	ecall
 6c0:	c0001073          	unimp
 6c4:	0000                	.insn	2, 0x
 6c6:	0000                	.insn	2, 0x
 6c8:	0000                	.insn	2, 0x
 6ca:	0000                	.insn	2, 0x
 6cc:	0000                	.insn	2, 0x
 6ce:	0000                	.insn	2, 0x
 6d0:	0000                	.insn	2, 0x
 6d2:	0000                	.insn	2, 0x
 6d4:	0000                	.insn	2, 0x
 6d6:	0000                	.insn	2, 0x
 6d8:	0000                	.insn	2, 0x
 6da:	0000                	.insn	2, 0x
 6dc:	0000                	.insn	2, 0x
 6de:	0000                	.insn	2, 0x
 6e0:	0000                	.insn	2, 0x
 6e2:	0000                	.insn	2, 0x
 6e4:	0000                	.insn	2, 0x
 6e6:	0000                	.insn	2, 0x
 6e8:	0000                	.insn	2, 0x
 6ea:	0000                	.insn	2, 0x
 6ec:	0000                	.insn	2, 0x
 6ee:	0000                	.insn	2, 0x
 6f0:	0000                	.insn	2, 0x
 6f2:	0000                	.insn	2, 0x
 6f4:	0000                	.insn	2, 0x
 6f6:	0000                	.insn	2, 0x
 6f8:	0000                	.insn	2, 0x
 6fa:	0000                	.insn	2, 0x

Disassembly of section .data:

00000800 <begin_signature>:
 800:	deadbeef          	jal	t4,fffdbdea <_end+0xfffdb5ba>

00000804 <tdat2>:
 804:	deadbeef          	jal	t4,fffdbdee <_end+0xfffdb5be>

00000808 <tdat3>:
 808:	deadbeef          	jal	t4,fffdbdf2 <_end+0xfffdb5c2>

0000080c <tdat4>:
 80c:	deadbeef          	jal	t4,fffdbdf6 <_end+0xfffdb5c6>

00000810 <tdat5>:
 810:	deadbeef          	jal	t4,fffdbdfa <_end+0xfffdb5ca>

00000814 <tdat6>:
 814:	deadbeef          	jal	t4,fffdbdfe <_end+0xfffdb5ce>

00000818 <tdat7>:
 818:	deadbeef          	jal	t4,fffdbe02 <_end+0xfffdb5d2>

0000081c <tdat8>:
 81c:	deadbeef          	jal	t4,fffdbe06 <_end+0xfffdb5d6>

00000820 <tdat9>:
 820:	deadbeef          	jal	t4,fffdbe0a <_end+0xfffdb5da>

00000824 <tdat10>:
 824:	deadbeef          	jal	t4,fffdbe0e <_end+0xfffdb5de>
 828:	0000                	.insn	2, 0x
 82a:	0000                	.insn	2, 0x
 82c:	0000                	.insn	2, 0x
 82e:	0000                	.insn	2, 0x
