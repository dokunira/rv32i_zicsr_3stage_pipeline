
rv32ui-p-andi:     file format elf32-littleriscv


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
 190:	f0f6f713          	andi	a4,a3,-241
 194:	ff0103b7          	lui	t2,0xff010
 198:	f0038393          	addi	t2,t2,-256 # ff00ff00 <_end+0xff00fa00>
 19c:	1a771463          	bne	a4,t2,344 <fail>

000001a0 <test_3>:
 1a0:	00300193          	li	gp,3
 1a4:	0ff016b7          	lui	a3,0xff01
 1a8:	ff068693          	addi	a3,a3,-16 # ff00ff0 <_end+0xff00af0>
 1ac:	0f06f713          	andi	a4,a3,240
 1b0:	0f000393          	li	t2,240
 1b4:	18771863          	bne	a4,t2,344 <fail>

000001b8 <test_4>:
 1b8:	00400193          	li	gp,4
 1bc:	00ff06b7          	lui	a3,0xff0
 1c0:	0ff68693          	addi	a3,a3,255 # ff00ff <_end+0xfefbff>
 1c4:	70f6f713          	andi	a4,a3,1807
 1c8:	00f00393          	li	t2,15
 1cc:	16771c63          	bne	a4,t2,344 <fail>

000001d0 <test_5>:
 1d0:	00500193          	li	gp,5
 1d4:	f00ff6b7          	lui	a3,0xf00ff
 1d8:	00f68693          	addi	a3,a3,15 # f00ff00f <_end+0xf00feb0f>
 1dc:	0f06f713          	andi	a4,a3,240
 1e0:	00000393          	li	t2,0
 1e4:	16771063          	bne	a4,t2,344 <fail>

000001e8 <test_6>:
 1e8:	00600193          	li	gp,6
 1ec:	ff0105b7          	lui	a1,0xff010
 1f0:	f0058593          	addi	a1,a1,-256 # ff00ff00 <_end+0xff00fa00>
 1f4:	0f05f593          	andi	a1,a1,240
 1f8:	00000393          	li	t2,0
 1fc:	14759463          	bne	a1,t2,344 <fail>

00000200 <test_7>:
 200:	00700193          	li	gp,7
 204:	00000213          	li	tp,0
 208:	0ff010b7          	lui	ra,0xff01
 20c:	ff008093          	addi	ra,ra,-16 # ff00ff0 <_end+0xff00af0>
 210:	70f0f713          	andi	a4,ra,1807
 214:	00070313          	mv	t1,a4
 218:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 21c:	00200293          	li	t0,2
 220:	fe5214e3          	bne	tp,t0,208 <test_7+0x8>
 224:	70000393          	li	t2,1792
 228:	10731e63          	bne	t1,t2,344 <fail>

0000022c <test_8>:
 22c:	00800193          	li	gp,8
 230:	00000213          	li	tp,0
 234:	00ff00b7          	lui	ra,0xff0
 238:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfefbff>
 23c:	0f00f713          	andi	a4,ra,240
 240:	00000013          	nop
 244:	00070313          	mv	t1,a4
 248:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 24c:	00200293          	li	t0,2
 250:	fe5212e3          	bne	tp,t0,234 <test_8+0x8>
 254:	0f000393          	li	t2,240
 258:	0e731663          	bne	t1,t2,344 <fail>

0000025c <test_9>:
 25c:	00900193          	li	gp,9
 260:	00000213          	li	tp,0
 264:	f00ff0b7          	lui	ra,0xf00ff
 268:	00f08093          	addi	ra,ra,15 # f00ff00f <_end+0xf00feb0f>
 26c:	f0f0f713          	andi	a4,ra,-241
 270:	00000013          	nop
 274:	00000013          	nop
 278:	00070313          	mv	t1,a4
 27c:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 280:	00200293          	li	t0,2
 284:	fe5210e3          	bne	tp,t0,264 <test_9+0x8>
 288:	f00ff3b7          	lui	t2,0xf00ff
 28c:	00f38393          	addi	t2,t2,15 # f00ff00f <_end+0xf00feb0f>
 290:	0a731a63          	bne	t1,t2,344 <fail>

00000294 <test_10>:
 294:	00a00193          	li	gp,10
 298:	00000213          	li	tp,0
 29c:	0ff010b7          	lui	ra,0xff01
 2a0:	ff008093          	addi	ra,ra,-16 # ff00ff0 <_end+0xff00af0>
 2a4:	70f0f713          	andi	a4,ra,1807
 2a8:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2ac:	00200293          	li	t0,2
 2b0:	fe5216e3          	bne	tp,t0,29c <test_10+0x8>
 2b4:	70000393          	li	t2,1792
 2b8:	08771663          	bne	a4,t2,344 <fail>

000002bc <test_11>:
 2bc:	00b00193          	li	gp,11
 2c0:	00000213          	li	tp,0
 2c4:	00ff00b7          	lui	ra,0xff0
 2c8:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfefbff>
 2cc:	00000013          	nop
 2d0:	0f00f713          	andi	a4,ra,240
 2d4:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 2d8:	00200293          	li	t0,2
 2dc:	fe5214e3          	bne	tp,t0,2c4 <test_11+0x8>
 2e0:	0f000393          	li	t2,240
 2e4:	06771063          	bne	a4,t2,344 <fail>

000002e8 <test_12>:
 2e8:	00c00193          	li	gp,12
 2ec:	00000213          	li	tp,0
 2f0:	f00ff0b7          	lui	ra,0xf00ff
 2f4:	00f08093          	addi	ra,ra,15 # f00ff00f <_end+0xf00feb0f>
 2f8:	00000013          	nop
 2fc:	00000013          	nop
 300:	70f0f713          	andi	a4,ra,1807
 304:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 308:	00200293          	li	t0,2
 30c:	fe5212e3          	bne	tp,t0,2f0 <test_12+0x8>
 310:	00f00393          	li	t2,15
 314:	02771863          	bne	a4,t2,344 <fail>

00000318 <test_13>:
 318:	00d00193          	li	gp,13
 31c:	0f007093          	andi	ra,zero,240
 320:	00000393          	li	t2,0
 324:	02709063          	bne	ra,t2,344 <fail>

00000328 <test_14>:
 328:	00e00193          	li	gp,14
 32c:	00ff00b7          	lui	ra,0xff0
 330:	0ff08093          	addi	ra,ra,255 # ff00ff <_end+0xfefbff>
 334:	70f0f013          	andi	zero,ra,1807
 338:	00000393          	li	t2,0
 33c:	00701463          	bne	zero,t2,344 <fail>
 340:	02301063          	bne	zero,gp,360 <pass>

00000344 <fail>:
 344:	0ff0000f          	fence
 348:	00018063          	beqz	gp,348 <fail+0x4>
 34c:	00119193          	slli	gp,gp,0x1
 350:	0011e193          	ori	gp,gp,1
 354:	05d00893          	li	a7,93
 358:	00018513          	mv	a0,gp
 35c:	00000073          	ecall

00000360 <pass>:
 360:	0ff0000f          	fence
 364:	00100193          	li	gp,1
 368:	05d00893          	li	a7,93
 36c:	00000513          	li	a0,0
 370:	00000073          	ecall
 374:	c0001073          	unimp
 378:	0000                	.insn	2, 0x
 37a:	0000                	.insn	2, 0x
 37c:	0000                	.insn	2, 0x
 37e:	0000                	.insn	2, 0x
 380:	0000                	.insn	2, 0x
 382:	0000                	.insn	2, 0x
 384:	0000                	.insn	2, 0x
 386:	0000                	.insn	2, 0x
 388:	0000                	.insn	2, 0x
 38a:	0000                	.insn	2, 0x
 38c:	0000                	.insn	2, 0x
 38e:	0000                	.insn	2, 0x
 390:	0000                	.insn	2, 0x
 392:	0000                	.insn	2, 0x
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
