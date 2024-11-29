
rv32si-p-dirty:     file format elf32-littleriscv


Disassembly of section .text.init:

00000000 <_start>:
   0:	04c0006f          	j	4c <reset_vector>

00000004 <trap_vector>:
   4:	34202f73          	csrr	t5,mcause
   8:	00800f93          	li	t6,8
   c:	03ff0a63          	beq	t5,t6,40 <write_tohost>
  10:	00900f93          	li	t6,9
  14:	03ff0663          	beq	t5,t6,40 <write_tohost>
  18:	00b00f93          	li	t6,11
  1c:	03ff0263          	beq	t5,t6,40 <write_tohost>
  20:	00000f17          	auipc	t5,0x0
  24:	270f0f13          	addi	t5,t5,624 # 290 <mtvec_handler>
  28:	000f0463          	beqz	t5,30 <trap_vector+0x2c>
  2c:	000f0067          	jr	t5
  30:	34202f73          	csrr	t5,mcause
  34:	000f5463          	bgez	t5,3c <handle_exception>
  38:	0040006f          	j	3c <handle_exception>

0000003c <handle_exception>:
  3c:	5391e193          	ori	gp,gp,1337

00000040 <write_tohost>:
  40:	40302023          	sw	gp,1024(zero) # 400 <tohost>
  44:	40002223          	sw	zero,1028(zero) # 404 <tohost+0x4>
  48:	ff9ff06f          	j	40 <write_tohost>

0000004c <reset_vector>:
  4c:	00000093          	li	ra,0
  50:	00000113          	li	sp,0
  54:	00000193          	li	gp,0
  58:	00000213          	li	tp,0
  5c:	00000293          	li	t0,0
  60:	00000313          	li	t1,0
  64:	00000393          	li	t2,0
  68:	00000413          	li	s0,0
  6c:	00000493          	li	s1,0
  70:	00000513          	li	a0,0
  74:	00000593          	li	a1,0
  78:	00000613          	li	a2,0
  7c:	00000693          	li	a3,0
  80:	00000713          	li	a4,0
  84:	00000793          	li	a5,0
  88:	00000813          	li	a6,0
  8c:	00000893          	li	a7,0
  90:	00000913          	li	s2,0
  94:	00000993          	li	s3,0
  98:	00000a13          	li	s4,0
  9c:	00000a93          	li	s5,0
  a0:	00000b13          	li	s6,0
  a4:	00000b93          	li	s7,0
  a8:	00000c13          	li	s8,0
  ac:	00000c93          	li	s9,0
  b0:	00000d13          	li	s10,0
  b4:	00000d93          	li	s11,0
  b8:	00000e13          	li	t3,0
  bc:	00000e93          	li	t4,0
  c0:	00000f13          	li	t5,0
  c4:	00000f93          	li	t6,0
  c8:	f1402573          	csrr	a0,mhartid
  cc:	00051063          	bnez	a0,cc <reset_vector+0x80>
  d0:	00000297          	auipc	t0,0x0
  d4:	01028293          	addi	t0,t0,16 # e0 <reset_vector+0x94>
  d8:	30529073          	csrw	mtvec,t0
  dc:	74445073          	csrwi	0x744,8
  e0:	00000297          	auipc	t0,0x0
  e4:	01028293          	addi	t0,t0,16 # f0 <reset_vector+0xa4>
  e8:	30529073          	csrw	mtvec,t0
  ec:	18005073          	csrwi	satp,0
  f0:	00000297          	auipc	t0,0x0
  f4:	02028293          	addi	t0,t0,32 # 110 <reset_vector+0xc4>
  f8:	30529073          	csrw	mtvec,t0
  fc:	800002b7          	lui	t0,0x80000
 100:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7fffefef>
 104:	3b029073          	csrw	pmpaddr0,t0
 108:	01f00293          	li	t0,31
 10c:	3a029073          	csrw	pmpcfg0,t0
 110:	30405073          	csrwi	mie,0
 114:	00000297          	auipc	t0,0x0
 118:	01428293          	addi	t0,t0,20 # 128 <reset_vector+0xdc>
 11c:	30529073          	csrw	mtvec,t0
 120:	30205073          	csrwi	medeleg,0
 124:	30305073          	csrwi	mideleg,0
 128:	00000193          	li	gp,0
 12c:	00000297          	auipc	t0,0x0
 130:	ed828293          	addi	t0,t0,-296 # 4 <trap_vector>
 134:	30529073          	csrw	mtvec,t0
 138:	00100513          	li	a0,1
 13c:	01f51513          	slli	a0,a0,0x1f
 140:	00054c63          	bltz	a0,158 <reset_vector+0x10c>
 144:	0ff0000f          	fence
 148:	00100193          	li	gp,1
 14c:	05d00893          	li	a7,93
 150:	00000513          	li	a0,0
 154:	00000073          	ecall
 158:	00000293          	li	t0,0
 15c:	00028a63          	beqz	t0,170 <reset_vector+0x124>
 160:	10529073          	csrw	stvec,t0
 164:	0000b2b7          	lui	t0,0xb
 168:	10928293          	addi	t0,t0,265 # b109 <_end+0xa0f9>
 16c:	30229073          	csrw	medeleg,t0
 170:	30005073          	csrwi	mstatus,0
 174:	00002537          	lui	a0,0x2
 178:	80050513          	addi	a0,a0,-2048 # 1800 <_end+0x7f0>
 17c:	30052073          	csrs	mstatus,a0
 180:	00000297          	auipc	t0,0x0
 184:	01428293          	addi	t0,t0,20 # 194 <reset_vector+0x148>
 188:	34129073          	csrw	mepc,t0
 18c:	f1402573          	csrr	a0,mhartid
 190:	30200073          	mret
 194:	80000537          	lui	a0,0x80000
 198:	00001597          	auipc	a1,0x1
 19c:	e6858593          	addi	a1,a1,-408 # 1000 <begin_signature>
 1a0:	00c5d593          	srli	a1,a1,0xc
 1a4:	00a5e5b3          	or	a1,a1,a0
 1a8:	18059073          	csrw	satp,a1
 1ac:	12000073          	sfence.vma
 1b0:	000215b7          	lui	a1,0x21
 1b4:	80058593          	addi	a1,a1,-2048 # 20800 <_end+0x1f7f0>
 1b8:	3005a073          	csrs	mstatus,a1
 1bc:	00200193          	li	gp,2
 1c0:	00100393          	li	t2,1
 1c4:	80001517          	auipc	a0,0x80001
 1c8:	e4752223          	sw	t2,-444(a0) # 80001008 <_end+0x7ffffff8>
 1cc:	00300193          	li	gp,3
 1d0:	000415b7          	lui	a1,0x41
 1d4:	80058593          	addi	a1,a1,-2048 # 40800 <_end+0x3f7f0>
 1d8:	3005a073          	csrs	mstatus,a1
 1dc:	80001297          	auipc	t0,0x80001
 1e0:	e2c2a283          	lw	t0,-468(t0) # 80001008 <_end+0x7ffffff8>
 1e4:	10029c63          	bnez	t0,2fc <die>
 1e8:	80001517          	auipc	a0,0x80001
 1ec:	e2752023          	sw	t2,-480(a0) # 80001008 <_end+0x7ffffff8>
 1f0:	80001297          	auipc	t0,0x80001
 1f4:	e182a283          	lw	t0,-488(t0) # 80001008 <_end+0x7ffffff8>
 1f8:	10729263          	bne	t0,t2,2fc <die>
 1fc:	000202b7          	lui	t0,0x20
 200:	3002b073          	csrc	mstatus,t0
 204:	00001297          	auipc	t0,0x1
 208:	dfc2a283          	lw	t0,-516(t0) # 1000 <begin_signature>
 20c:	0c000513          	li	a0,192
 210:	00a2f2b3          	and	t0,t0,a0
 214:	0ea29463          	bne	t0,a0,2fc <die>
 218:	000202b7          	lui	t0,0x20
 21c:	3002a073          	csrs	mstatus,t0
 220:	00400193          	li	gp,4
 224:	80001517          	auipc	a0,0x80001
 228:	ddc52503          	lw	a0,-548(a0) # 80001000 <_end+0x7ffffff0>
 22c:	40056513          	ori	a0,a0,1024
 230:	80001297          	auipc	t0,0x80001
 234:	dca2a823          	sw	a0,-560(t0) # 80001000 <_end+0x7ffffff0>
 238:	12000073          	sfence.vma
 23c:	80001297          	auipc	t0,0x80001
 240:	dca2a223          	sw	a0,-572(t0) # 80001000 <_end+0x7ffffff0>
 244:	0b80006f          	j	2fc <die>
 248:	0ff0000f          	fence
 24c:	00100193          	li	gp,1
 250:	05d00893          	li	a7,93
 254:	00000513          	li	a0,0
 258:	00000073          	ecall
 25c:	02301063          	bne	zero,gp,27c <pass>

00000260 <fail>:
 260:	0ff0000f          	fence
 264:	00018063          	beqz	gp,264 <fail+0x4>
 268:	00119193          	slli	gp,gp,0x1
 26c:	0011e193          	ori	gp,gp,1
 270:	05d00893          	li	a7,93
 274:	00018513          	mv	a0,gp
 278:	00000073          	ecall

0000027c <pass>:
 27c:	0ff0000f          	fence
 280:	00100193          	li	gp,1
 284:	05d00893          	li	a7,93
 288:	00000513          	li	a0,0
 28c:	00000073          	ecall

00000290 <mtvec_handler>:
 290:	342022f3          	csrr	t0,mcause
 294:	ff128293          	addi	t0,t0,-15
 298:	06029263          	bnez	t0,2fc <die>
 29c:	00200313          	li	t1,2
 2a0:	02619263          	bne	gp,t1,2c4 <skip+0x10>
 2a4:	00001297          	auipc	t0,0x1
 2a8:	d5c2a283          	lw	t0,-676(t0) # 1000 <begin_signature>
 2ac:	0802f313          	andi	t1,t0,128
 2b0:	04031663          	bnez	t1,2fc <die>

000002b4 <skip>:
 2b4:	341022f3          	csrr	t0,mepc
 2b8:	00428293          	addi	t0,t0,4
 2bc:	34129073          	csrw	mepc,t0
 2c0:	30200073          	mret
 2c4:	00300313          	li	t1,3
 2c8:	02619463          	bne	gp,t1,2f0 <skip+0x3c>
 2cc:	00001297          	auipc	t0,0x1
 2d0:	d342a283          	lw	t0,-716(t0) # 1000 <begin_signature>
 2d4:	0802f313          	andi	t1,t0,128
 2d8:	02031263          	bnez	t1,2fc <die>
 2dc:	0802e293          	ori	t0,t0,128
 2e0:	00001317          	auipc	t1,0x1
 2e4:	d2532023          	sw	t0,-736(t1) # 1000 <begin_signature>
 2e8:	12000073          	sfence.vma
 2ec:	30200073          	mret
 2f0:	00400313          	li	t1,4
 2f4:	00619463          	bne	gp,t1,2fc <die>
 2f8:	f85ff06f          	j	27c <pass>

000002fc <die>:
 2fc:	0ff0000f          	fence
 300:	00018063          	beqz	gp,300 <die+0x4>
 304:	00119193          	slli	gp,gp,0x1
 308:	0011e193          	ori	gp,gp,1
 30c:	05d00893          	li	a7,93
 310:	00018513          	mv	a0,gp
 314:	00000073          	ecall
 318:	c0001073          	unimp
 31c:	0000                	.insn	2, 0x
 31e:	0000                	.insn	2, 0x
 320:	0000                	.insn	2, 0x
 322:	0000                	.insn	2, 0x
 324:	0000                	.insn	2, 0x
 326:	0000                	.insn	2, 0x
 328:	0000                	.insn	2, 0x
 32a:	0000                	.insn	2, 0x
 32c:	0000                	.insn	2, 0x
 32e:	0000                	.insn	2, 0x
 330:	0000                	.insn	2, 0x
 332:	0000                	.insn	2, 0x
 334:	0000                	.insn	2, 0x
 336:	0000                	.insn	2, 0x

Disassembly of section .data:

00001000 <begin_signature>:
    1000:	005f 2000 0000      	.insn	6, 0x2000005f
    1006:	0000                	.insn	2, 0x

00001008 <dummy>:
    1008:	0000                	.insn	2, 0x
    100a:	0000                	.insn	2, 0x
    100c:	0000                	.insn	2, 0x
    100e:	0000                	.insn	2, 0x
