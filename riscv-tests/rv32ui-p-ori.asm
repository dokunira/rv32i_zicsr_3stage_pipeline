
rv32ui-p-ori:     file format elf32-littleriscv


Disassembly of section .text.init:

00000000 <_start>:
   0:	0480006f          	j	48 <reset_vector>

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
  3c:	40302023          	sw	gp,1024(zero) # 400 <tohost>
  40:	40002223          	sw	zero,1028(zero) # 404 <tohost+0x4>
  44:	ff9ff06f          	j	3c <write_tohost>

00000048 <reset_vector>:
  48:	00000093          	li	ra,0
  4c:	00000113          	li	sp,0
  50:	00000193          	li	gp,0
  54:	00000213          	li	tp,0
  58:	00000293          	li	t0,0
  5c:	00000313          	li	t1,0
  60:	00000393          	li	t2,0
  64:	00000413          	li	s0,0
  68:	00000493          	li	s1,0
  6c:	00000513          	li	a0,0
  70:	00000593          	li	a1,0
  74:	00000613          	li	a2,0
  78:	00000693          	li	a3,0
  7c:	00000713          	li	a4,0
  80:	00000793          	li	a5,0
  84:	00000813          	li	a6,0
  88:	00000893          	li	a7,0
  8c:	00000913          	li	s2,0
  90:	00000993          	li	s3,0
  94:	00000a13          	li	s4,0
  98:	00000a93          	li	s5,0
  9c:	00000b13          	li	s6,0
  a0:	00000b93          	li	s7,0
  a4:	00000c13          	li	s8,0
  a8:	00000c93          	li	s9,0
  ac:	00000d13          	li	s10,0
  b0:	00000d93          	li	s11,0
  b4:	00000e13          	li	t3,0
  b8:	00000e93          	li	t4,0
  bc:	00000f13          	li	t5,0
  c0:	00000f93          	li	t6,0
  c4:	f1402573          	csrr	a0,mhartid
  c8:	00051063          	bnez	a0,c8 <reset_vector+0x80>
  cc:	00000297          	auipc	t0,0x0
  d0:	01028293          	addi	t0,t0,16 # dc <reset_vector+0x94>
  d4:	30529073          	csrw	mtvec,t0
  d8:	74445073          	csrwi	0x744,8
  dc:	00000297          	auipc	t0,0x0
  e0:	01028293          	addi	t0,t0,16 # ec <reset_vector+0xa4>
  e4:	30529073          	csrw	mtvec,t0
  e8:	18005073          	csrwi	satp,0
  ec:	00000297          	auipc	t0,0x0
  f0:	02028293          	addi	t0,t0,32 # 10c <reset_vector+0xc4>
  f4:	30529073          	csrw	mtvec,t0
  f8:	800002b7          	lui	t0,0x80000
  fc:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffffaff>
 100:	3b029073          	csrw	pmpaddr0,t0
 104:	01f00293          	li	t0,31
 108:	3a029073          	csrw	pmpcfg0,t0
 10c:	30405073          	csrwi	mie,0
 110:	00000297          	auipc	t0,0x0
 114:	01428293          	addi	t0,t0,20 # 124 <reset_vector+0xdc>
 118:	30529073          	csrw	mtvec,t0
 11c:	30205073          	csrwi	medeleg,0
 120:	30305073          	csrwi	mideleg,0
 124:	00000193          	li	gp,0
 128:	00000297          	auipc	t0,0x0
 12c:	edc28293          	addi	t0,t0,-292 # 4 <trap_vector>
 130:	30529073          	csrw	mtvec,t0
 134:	00100513          	li	a0,1
 138:	01f51513          	slli	a0,a0,0x1f
 13c:	00054c63          	bltz	a0,154 <reset_vector+0x10c>
 140:	0ff0000f          	fence
 144:	00100193          	li	gp,1
 148:	05d00893          	li	a7,93
 14c:	00000513          	li	a0,0
 150:	00000073          	ecall
 154:	00000293          	li	t0,0
 158:	00028a63          	beqz	t0,16c <reset_vector+0x124>
 15c:	10529073          	csrw	stvec,t0
 160:	0000b2b7          	lui	t0,0xb
 164:	10928293          	addi	t0,t0,265 # b109 <_end+0xac09>
 168:	30229073          	csrw	medeleg,t0
 16c:	30005073          	csrwi	mstatus,0
 170:	00000297          	auipc	t0,0x0
 174:	01428293          	addi	t0,t0,20 # 184 <test_2>
 178:	34129073          	csrw	mepc,t0
 17c:	f1402573          	csrr	a0,mhartid
 180:	30200073          	mret

00000184 <test_2>:
 184:	00200193          	li	gp,2
 188:	ff0106b7          	lui	a3,0xff010
 18c:	f0068693          	addi	a3,a3,-256 # ff00ff00 <_end+0xff00fa00>
 190:	f0f6e713          	ori	a4,a3,-241
 194:	f0f00393          	li	t2,-241
 198:	1c771463          	bne	a4,t2,360 <fail>

0000019c <test_3>:
 19c:	00300193          	li	gp,3
 1a0:	0ff016b7          	lui	a3,0xff01
 1a4:	ff068693          	addi	a3,a3,-16 # ff00ff0 <_end+0xff00af0>
 1a8:	0f06e713          	ori	a4,a3,240
 1ac:	0ff013b7          	lui	t2,0xff01
 1b0:	ff038393          	addi	t2,t2,-16 # ff00ff0 <_end+0xff00af0>
 1b4:	1a771663          	bne	a4,t2,360 <fail>

000001b8 <test_4>:
 1b8:	00400193          	li	gp,4
 1bc:	00ff06b7          	lui	a3,0xff0
 1c0:	0ff68693          	addi	a3,a3,255 # ff00ff <_end+0xfefbff>
 1c4:	70f6e713          	ori	a4,a3,1807
 1c8:	00ff03b7          	lui	t2,0xff0
 1cc:	7ff38393          	addi	t2,t2,2047 # ff07ff <_end+0xff02ff>
 1d0:	18771863          	bne	a4,t2,360 <fail>

000001d4 <test_5>:
 1d4:	00500193          	li	gp,5
 1d8:	f00ff6b7          	lui	a3,0xf00ff
 1dc:	00f68693          	addi	a3,a3,15 # f00ff00f <_end+0xf00feb0f>
 1e0:	0f06e713          	ori	a4,a3,240
 1e4:	f00ff3b7          	lui	t2,0xf00ff
 1e8:	0ff38393          	addi	t2,t2,255 # f00ff0ff <_end+0xf00febff>
 1ec:	16771a63          	bne	a4,t2,360 <fail>

000001f0 <test_6>:
 1f0:	00600193          	li	gp,6
 1f4:	ff0105b7          	lui	a1,0xff010
 1f8:	f0058593          	addi	a1,a1,-256 # ff00ff00 <_end+0xff00fa00>
 1fc:	0f05e593          	ori	a1,a1,240
 200:	ff0103b7          	lui	t2,0xff010
 204:	ff038393          	addi	t2,t2,-16 # ff00fff0 <_end+0xff00faf0>
 208:	14759c63          	bne	a1,t2,360 <fail>

0000020c <test_7>:
 20c:	00700193          	li	gp,7
 210:	00000213          	li	tp,0
 214:	0ff010b7          	lui	ra,0xff01
 218:	ff008093          	addi	ra,ra,-16 # ff00ff0 <_end+0xff00af0>
 21c:	0f00e713          	ori	a4,ra,240
 220:	00070313          	mv	t1,a4
 224:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 228:	00200293          	li	t0,2
 22c:	fe5214e3          	bne	tp,t0,214 <test_7+0x8>
 230:	0ff013b7          	lui	t2,0xff01
 234:	ff038393          	addi	t2,t2,-16 # ff00ff0 <_end+0xff00af0>
 238:	12731463          	bne	t1,t2,360 <fail>

0000023c <test_8>:
 23c:	00800193          	li	gp,8
 240:	00000213          	li	tp,0
 244:	00ff00b7          	lui	ra,0xff0
 248:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfefbff>
 24c:	70f0e713          	ori	a4,ra,1807
 250:	00000013          	nop
 254:	00070313          	mv	t1,a4
 258:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 25c:	00200293          	li	t0,2
 260:	fe5212e3          	bne	tp,t0,244 <test_8+0x8>
 264:	00ff03b7          	lui	t2,0xff0
 268:	7ff38393          	addi	t2,t2,2047 # ff07ff <_end+0xff02ff>
 26c:	0e731a63          	bne	t1,t2,360 <fail>

00000270 <test_9>:
 270:	00900193          	li	gp,9
 274:	00000213          	li	tp,0
 278:	f00ff0b7          	lui	ra,0xf00ff
 27c:	00f08093          	addi	ra,ra,15 # f00ff00f <_end+0xf00feb0f>
 280:	0f00e713          	ori	a4,ra,240
 284:	00000013          	nop
 288:	00000013          	nop
 28c:	00070313          	mv	t1,a4
 290:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 294:	00200293          	li	t0,2
 298:	fe5210e3          	bne	tp,t0,278 <test_9+0x8>
 29c:	f00ff3b7          	lui	t2,0xf00ff
 2a0:	0ff38393          	addi	t2,t2,255 # f00ff0ff <_end+0xf00febff>
 2a4:	0a731e63          	bne	t1,t2,360 <fail>

000002a8 <test_10>:
 2a8:	00a00193          	li	gp,10
 2ac:	00000213          	li	tp,0
 2b0:	0ff010b7          	lui	ra,0xff01
 2b4:	ff008093          	addi	ra,ra,-16 # ff00ff0 <_end+0xff00af0>
 2b8:	0f00e713          	ori	a4,ra,240
 2bc:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2c0:	00200293          	li	t0,2
 2c4:	fe5216e3          	bne	tp,t0,2b0 <test_10+0x8>
 2c8:	0ff013b7          	lui	t2,0xff01
 2cc:	ff038393          	addi	t2,t2,-16 # ff00ff0 <_end+0xff00af0>
 2d0:	08771863          	bne	a4,t2,360 <fail>

000002d4 <test_11>:
 2d4:	00b00193          	li	gp,11
 2d8:	00000213          	li	tp,0
 2dc:	00ff00b7          	lui	ra,0xff0
 2e0:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfefbff>
 2e4:	00000013          	nop
 2e8:	f0f0e713          	ori	a4,ra,-241
 2ec:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2f0:	00200293          	li	t0,2
 2f4:	fe5214e3          	bne	tp,t0,2dc <test_11+0x8>
 2f8:	fff00393          	li	t2,-1
 2fc:	06771263          	bne	a4,t2,360 <fail>

00000300 <test_12>:
 300:	00c00193          	li	gp,12
 304:	00000213          	li	tp,0
 308:	f00ff0b7          	lui	ra,0xf00ff
 30c:	00f08093          	addi	ra,ra,15 # f00ff00f <_end+0xf00feb0f>
 310:	00000013          	nop
 314:	00000013          	nop
 318:	0f00e713          	ori	a4,ra,240
 31c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 320:	00200293          	li	t0,2
 324:	fe5212e3          	bne	tp,t0,308 <test_12+0x8>
 328:	f00ff3b7          	lui	t2,0xf00ff
 32c:	0ff38393          	addi	t2,t2,255 # f00ff0ff <_end+0xf00febff>
 330:	02771863          	bne	a4,t2,360 <fail>

00000334 <test_13>:
 334:	00d00193          	li	gp,13
 338:	0f006093          	ori	ra,zero,240
 33c:	0f000393          	li	t2,240
 340:	02709063          	bne	ra,t2,360 <fail>

00000344 <test_14>:
 344:	00e00193          	li	gp,14
 348:	00ff00b7          	lui	ra,0xff0
 34c:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfefbff>
 350:	70f0e013          	ori	zero,ra,1807
 354:	00000393          	li	t2,0
 358:	00701463          	bne	zero,t2,360 <fail>
 35c:	02301063          	bne	zero,gp,37c <pass>

00000360 <fail>:
 360:	0ff0000f          	fence
 364:	00018063          	beqz	gp,364 <fail+0x4>
 368:	00119193          	slli	gp,gp,0x1
 36c:	0011e193          	ori	gp,gp,1
 370:	05d00893          	li	a7,93
 374:	00018513          	mv	a0,gp
 378:	00000073          	ecall

0000037c <pass>:
 37c:	0ff0000f          	fence
 380:	00100193          	li	gp,1
 384:	05d00893          	li	a7,93
 388:	00000513          	li	a0,0
 38c:	00000073          	ecall
 390:	c0001073          	unimp
 394:	0000                	.insn	2, 0x
 396:	0000                	.insn	2, 0x
 398:	0000                	.insn	2, 0x
 39a:	0000                	.insn	2, 0x
 39c:	0000                	.insn	2, 0x
 39e:	0000                	.insn	2, 0x
 3a0:	0000                	.insn	2, 0x
 3a2:	0000                	.insn	2, 0x
 3a4:	0000                	.insn	2, 0x
 3a6:	0000                	.insn	2, 0x
 3a8:	0000                	.insn	2, 0x
 3aa:	0000                	.insn	2, 0x
 3ac:	0000                	.insn	2, 0x
 3ae:	0000                	.insn	2, 0x
 3b0:	0000                	.insn	2, 0x
 3b2:	0000                	.insn	2, 0x
