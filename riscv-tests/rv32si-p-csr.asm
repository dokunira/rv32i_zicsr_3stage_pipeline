
rv32si-p-csr:     file format elf32-littleriscv


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
  fc:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffffaef>
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
 154:	00000297          	auipc	t0,0x0
 158:	1e828293          	addi	t0,t0,488 # 33c <stvec_handler>
 15c:	00028a63          	beqz	t0,170 <reset_vector+0x128>
 160:	10529073          	csrw	stvec,t0
 164:	0000b2b7          	lui	t0,0xb
 168:	10928293          	addi	t0,t0,265 # b109 <_end+0xabf9>
 16c:	30229073          	csrw	medeleg,t0
 170:	30005073          	csrwi	mstatus,0
 174:	00001537          	lui	a0,0x1
 178:	80050513          	addi	a0,a0,-2048 # 800 <_end+0x2f0>
 17c:	30052073          	csrs	mstatus,a0
 180:	02200513          	li	a0,34
 184:	30352073          	csrs	mideleg,a0
 188:	00000297          	auipc	t0,0x0
 18c:	01428293          	addi	t0,t0,20 # 19c <test_20>
 190:	34129073          	csrw	mepc,t0
 194:	f1402573          	csrr	a0,mhartid
 198:	30200073          	mret

0000019c <test_20>:
 19c:	01400193          	li	gp,20
 1a0:	14001073          	csrw	sscratch,zero
 1a4:	14002573          	csrr	a0,sscratch
 1a8:	00000393          	li	t2,0
 1ac:	16751063          	bne	a0,t2,30c <fail>

000001b0 <test_21>:
 1b0:	01500193          	li	gp,21
 1b4:	14005573          	csrrwi	a0,sscratch,0
 1b8:	1407d573          	csrrwi	a0,sscratch,15
 1bc:	00000393          	li	t2,0
 1c0:	14751663          	bne	a0,t2,30c <fail>

000001c4 <test_22>:
 1c4:	01600193          	li	gp,22
 1c8:	14086073          	csrsi	sscratch,16
 1cc:	14002573          	csrr	a0,sscratch
 1d0:	01f00393          	li	t2,31
 1d4:	12751c63          	bne	a0,t2,30c <fail>
 1d8:	1401d073          	csrwi	sscratch,3

000001dc <test_2>:
 1dc:	00200193          	li	gp,2
 1e0:	14002573          	csrr	a0,sscratch
 1e4:	00300393          	li	t2,3
 1e8:	12751263          	bne	a0,t2,30c <fail>

000001ec <test_3>:
 1ec:	00300193          	li	gp,3
 1f0:	1400f5f3          	csrrci	a1,sscratch,1
 1f4:	00300393          	li	t2,3
 1f8:	10759a63          	bne	a1,t2,30c <fail>

000001fc <test_4>:
 1fc:	00400193          	li	gp,4
 200:	14026673          	csrrsi	a2,sscratch,4
 204:	00200393          	li	t2,2
 208:	10761263          	bne	a2,t2,30c <fail>

0000020c <test_5>:
 20c:	00500193          	li	gp,5
 210:	140156f3          	csrrwi	a3,sscratch,2
 214:	00600393          	li	t2,6
 218:	0e769a63          	bne	a3,t2,30c <fail>

0000021c <test_6>:
 21c:	00600193          	li	gp,6
 220:	0bad2537          	lui	a0,0xbad2
 224:	dea50513          	addi	a0,a0,-534 # bad1dea <_end+0xbad18da>
 228:	140515f3          	csrrw	a1,sscratch,a0
 22c:	00200393          	li	t2,2
 230:	0c759e63          	bne	a1,t2,30c <fail>

00000234 <test_7>:
 234:	00700193          	li	gp,7
 238:	00002537          	lui	a0,0x2
 23c:	dea50513          	addi	a0,a0,-534 # 1dea <_end+0x18da>
 240:	140535f3          	csrrc	a1,sscratch,a0
 244:	0bad23b7          	lui	t2,0xbad2
 248:	dea38393          	addi	t2,t2,-534 # bad1dea <_end+0xbad18da>
 24c:	0c759063          	bne	a1,t2,30c <fail>

00000250 <test_8>:
 250:	00800193          	li	gp,8
 254:	0000c537          	lui	a0,0xc
 258:	eef50513          	addi	a0,a0,-273 # beef <_end+0xb9df>
 25c:	140525f3          	csrrs	a1,sscratch,a0
 260:	0bad03b7          	lui	t2,0xbad0
 264:	0a759463          	bne	a1,t2,30c <fail>

00000268 <test_9>:
 268:	00900193          	li	gp,9
 26c:	0bad2537          	lui	a0,0xbad2
 270:	dea50513          	addi	a0,a0,-534 # bad1dea <_end+0xbad18da>
 274:	14051573          	csrrw	a0,sscratch,a0
 278:	0badc3b7          	lui	t2,0xbadc
 27c:	eef38393          	addi	t2,t2,-273 # badbeef <_end+0xbadb9df>
 280:	08751663          	bne	a0,t2,30c <fail>

00000284 <test_10>:
 284:	00a00193          	li	gp,10
 288:	00002537          	lui	a0,0x2
 28c:	dea50513          	addi	a0,a0,-534 # 1dea <_end+0x18da>
 290:	14053573          	csrrc	a0,sscratch,a0
 294:	0bad23b7          	lui	t2,0xbad2
 298:	dea38393          	addi	t2,t2,-534 # bad1dea <_end+0xbad18da>
 29c:	06751863          	bne	a0,t2,30c <fail>

000002a0 <test_11>:
 2a0:	00b00193          	li	gp,11
 2a4:	0000c537          	lui	a0,0xc
 2a8:	eef50513          	addi	a0,a0,-273 # beef <_end+0xb9df>
 2ac:	14052573          	csrrs	a0,sscratch,a0
 2b0:	0bad03b7          	lui	t2,0xbad0
 2b4:	04751c63          	bne	a0,t2,30c <fail>

000002b8 <test_12>:
 2b8:	00c00193          	li	gp,12
 2bc:	14002573          	csrr	a0,sscratch
 2c0:	0badc3b7          	lui	t2,0xbadc
 2c4:	eef38393          	addi	t2,t2,-273 # badbeef <_end+0xbadb9df>
 2c8:	04751263          	bne	a0,t2,30c <fail>
 2cc:	10000293          	li	t0,256
 2d0:	1002b073          	csrc	sstatus,t0
 2d4:	00000297          	auipc	t0,0x0
 2d8:	01028293          	addi	t0,t0,16 # 2e4 <test_15>
 2dc:	14129073          	csrw	sepc,t0
 2e0:	10200073          	sret

000002e4 <test_15>:
 2e4:	00f00193          	li	gp,15
 2e8:	00000013          	nop
 2ec:	00000393          	li	t2,0
 2f0:	00701e63          	bne	zero,t2,30c <fail>

000002f4 <finish>:
 2f4:	0ff0000f          	fence
 2f8:	00100193          	li	gp,1
 2fc:	05d00893          	li	a7,93
 300:	00000513          	li	a0,0
 304:	00000073          	ecall
 308:	02301063          	bne	zero,gp,328 <pass>

0000030c <fail>:
 30c:	0ff0000f          	fence
 310:	00018063          	beqz	gp,310 <fail+0x4>
 314:	00119193          	slli	gp,gp,0x1
 318:	0011e193          	ori	gp,gp,1
 31c:	05d00893          	li	a7,93
 320:	00018513          	mv	a0,gp
 324:	00000073          	ecall

00000328 <pass>:
 328:	0ff0000f          	fence
 32c:	00100193          	li	gp,1
 330:	05d00893          	li	a7,93
 334:	00000513          	li	a0,0
 338:	00000073          	ecall

0000033c <stvec_handler>:
 33c:	00d00293          	li	t0,13
 340:	0051e663          	bltu	gp,t0,34c <stvec_handler+0x10>
 344:	00f00293          	li	t0,15
 348:	0232f263          	bgeu	t0,gp,36c <privileged>
 34c:	142022f3          	csrr	t0,scause
 350:	00800313          	li	t1,8
 354:	fa629ce3          	bne	t0,t1,30c <fail>
 358:	0ff0000f          	fence
 35c:	00100193          	li	gp,1
 360:	05d00893          	li	a7,93
 364:	00000513          	li	a0,0
 368:	00000073          	ecall

0000036c <privileged>:
 36c:	142022f3          	csrr	t0,scause
 370:	00200313          	li	t1,2
 374:	f8629ce3          	bne	t0,t1,30c <fail>
 378:	141022f3          	csrr	t0,sepc
 37c:	00428293          	addi	t0,t0,4
 380:	14129073          	csrw	sepc,t0
 384:	10200073          	sret
 388:	c0001073          	unimp
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
 3b4:	0000                	.insn	2, 0x
 3b6:	0000                	.insn	2, 0x

Disassembly of section .data:

00000500 <begin_signature>:
 500:	0001                	.insn	2, 0x0001
 502:	0000                	.insn	2, 0x
 504:	0000                	.insn	2, 0x
 506:	0000                	.insn	2, 0x
 508:	0000                	.insn	2, 0x
 50a:	0000                	.insn	2, 0x
 50c:	0000                	.insn	2, 0x
 50e:	0000                	.insn	2, 0x
