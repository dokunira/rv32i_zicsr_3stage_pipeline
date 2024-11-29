
rv32mi-p-zicntr:     file format elf32-littleriscv


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
  24:	2a8f0f13          	addi	t5,t5,680 # 2c8 <mtvec_handler>
  28:	000f0463          	beqz	t5,30 <trap_vector+0x2c>
  2c:	000f0067          	jr	t5
  30:	34202f73          	csrr	t5,mcause
  34:	000f5463          	bgez	t5,3c <handle_exception>
  38:	0040006f          	j	3c <handle_exception>

0000003c <handle_exception>:
  3c:	5391e193          	ori	gp,gp,1337

00000040 <write_tohost>:
  40:	30302023          	sw	gp,768(zero) # 300 <tohost>
  44:	30002223          	sw	zero,772(zero) # 304 <tohost+0x4>
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
 100:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffffbff>
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
 168:	10928293          	addi	t0,t0,265 # b109 <_end+0xad09>
 16c:	30229073          	csrw	medeleg,t0
 170:	30005073          	csrwi	mstatus,0
 174:	00002537          	lui	a0,0x2
 178:	80050513          	addi	a0,a0,-2048 # 1800 <_end+0x1400>
 17c:	30052073          	csrs	mstatus,a0
 180:	00000297          	auipc	t0,0x0
 184:	01428293          	addi	t0,t0,20 # 194 <test_2>
 188:	34129073          	csrw	mepc,t0
 18c:	f1402573          	csrr	a0,mhartid
 190:	30200073          	mret

00000194 <test_2>:
 194:	00200193          	li	gp,2
 198:	c0003073          	csrc	cycle,zero
 19c:	00000393          	li	t2,0
 1a0:	0e701c63          	bne	zero,t2,298 <fail>

000001a4 <test_3>:
 1a4:	00300193          	li	gp,3
 1a8:	c0002073          	rdcycle	zero
 1ac:	00000393          	li	t2,0
 1b0:	0e701463          	bne	zero,t2,298 <fail>

000001b4 <test_4>:
 1b4:	00400193          	li	gp,4
 1b8:	c0007073          	csrci	cycle,0
 1bc:	00000393          	li	t2,0
 1c0:	0c701c63          	bne	zero,t2,298 <fail>

000001c4 <test_5>:
 1c4:	00500193          	li	gp,5
 1c8:	c0006073          	csrsi	cycle,0
 1cc:	00000393          	li	t2,0
 1d0:	0c701463          	bne	zero,t2,298 <fail>

000001d4 <test_6>:
 1d4:	00600193          	li	gp,6
 1d8:	c0203073          	csrc	instret,zero
 1dc:	00000393          	li	t2,0
 1e0:	0a701c63          	bne	zero,t2,298 <fail>

000001e4 <test_7>:
 1e4:	00700193          	li	gp,7
 1e8:	c0202073          	rdinstret	zero
 1ec:	00000393          	li	t2,0
 1f0:	0a701463          	bne	zero,t2,298 <fail>

000001f4 <test_8>:
 1f4:	00800193          	li	gp,8
 1f8:	c0207073          	csrci	instret,0
 1fc:	00000393          	li	t2,0
 200:	08701c63          	bne	zero,t2,298 <fail>

00000204 <test_9>:
 204:	00900193          	li	gp,9
 208:	c0206073          	csrsi	instret,0
 20c:	00000393          	li	t2,0
 210:	08701463          	bne	zero,t2,298 <fail>

00000214 <test_12>:
 214:	00c00193          	li	gp,12
 218:	c8003073          	csrc	cycleh,zero
 21c:	00000393          	li	t2,0
 220:	06701c63          	bne	zero,t2,298 <fail>

00000224 <test_13>:
 224:	00d00193          	li	gp,13
 228:	c8002073          	rdcycleh	zero
 22c:	00000393          	li	t2,0
 230:	06701463          	bne	zero,t2,298 <fail>

00000234 <test_14>:
 234:	00e00193          	li	gp,14
 238:	c8007073          	csrci	cycleh,0
 23c:	00000393          	li	t2,0
 240:	04701c63          	bne	zero,t2,298 <fail>

00000244 <test_15>:
 244:	00f00193          	li	gp,15
 248:	c8006073          	csrsi	cycleh,0
 24c:	00000393          	li	t2,0
 250:	04701463          	bne	zero,t2,298 <fail>

00000254 <test_16>:
 254:	01000193          	li	gp,16
 258:	c8203073          	csrc	instreth,zero
 25c:	00000393          	li	t2,0
 260:	02701c63          	bne	zero,t2,298 <fail>

00000264 <test_17>:
 264:	01100193          	li	gp,17
 268:	c8202073          	rdinstreth	zero
 26c:	00000393          	li	t2,0
 270:	02701463          	bne	zero,t2,298 <fail>

00000274 <test_18>:
 274:	01200193          	li	gp,18
 278:	c8207073          	csrci	instreth,0
 27c:	00000393          	li	t2,0
 280:	00701c63          	bne	zero,t2,298 <fail>

00000284 <test_19>:
 284:	01300193          	li	gp,19
 288:	c8206073          	csrsi	instreth,0
 28c:	00000393          	li	t2,0
 290:	00701463          	bne	zero,t2,298 <fail>
 294:	02301063          	bne	zero,gp,2b4 <pass>

00000298 <fail>:
 298:	0ff0000f          	fence
 29c:	00018063          	beqz	gp,29c <fail+0x4>
 2a0:	00119193          	slli	gp,gp,0x1
 2a4:	0011e193          	ori	gp,gp,1
 2a8:	05d00893          	li	a7,93
 2ac:	00018513          	mv	a0,gp
 2b0:	00000073          	ecall

000002b4 <pass>:
 2b4:	0ff0000f          	fence
 2b8:	00100193          	li	gp,1
 2bc:	05d00893          	li	a7,93
 2c0:	00000513          	li	a0,0
 2c4:	00000073          	ecall

000002c8 <mtvec_handler>:
 2c8:	fd1ff06f          	j	298 <fail>
 2cc:	c0001073          	unimp
 2d0:	0000                	.insn	2, 0x
 2d2:	0000                	.insn	2, 0x
 2d4:	0000                	.insn	2, 0x
 2d6:	0000                	.insn	2, 0x
 2d8:	0000                	.insn	2, 0x
 2da:	0000                	.insn	2, 0x
 2dc:	0000                	.insn	2, 0x
 2de:	0000                	.insn	2, 0x
 2e0:	0000                	.insn	2, 0x
 2e2:	0000                	.insn	2, 0x
 2e4:	0000                	.insn	2, 0x
 2e6:	0000                	.insn	2, 0x
 2e8:	0000                	.insn	2, 0x
 2ea:	0000                	.insn	2, 0x
 2ec:	0000                	.insn	2, 0x
 2ee:	0000                	.insn	2, 0x
 2f0:	0000                	.insn	2, 0x
 2f2:	0000                	.insn	2, 0x
 2f4:	0000                	.insn	2, 0x
 2f6:	0000                	.insn	2, 0x
