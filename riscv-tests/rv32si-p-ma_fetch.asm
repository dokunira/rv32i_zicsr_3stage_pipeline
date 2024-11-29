
rv32si-p-ma_fetch:     file format elf32-littleriscv


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
  3c:	30302023          	sw	gp,768(zero) # 300 <tohost>
  40:	30002223          	sw	zero,772(zero) # 304 <tohost+0x4>
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
  fc:	fff28293          	addi	t0,t0,-1 # 7fffffff <_end+0x7ffffbff>
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
 158:	11c28293          	addi	t0,t0,284 # 270 <stvec_handler>
 15c:	00028a63          	beqz	t0,170 <reset_vector+0x128>
 160:	10529073          	csrw	stvec,t0
 164:	0000b2b7          	lui	t0,0xb
 168:	10928293          	addi	t0,t0,265 # b109 <_end+0xad09>
 16c:	30229073          	csrw	medeleg,t0
 170:	30005073          	csrwi	mstatus,0
 174:	00001537          	lui	a0,0x1
 178:	80050513          	addi	a0,a0,-2048 # 800 <_end+0x400>
 17c:	30052073          	csrs	mstatus,a0
 180:	02200513          	li	a0,34
 184:	30352073          	csrs	mideleg,a0
 188:	00000297          	auipc	t0,0x0
 18c:	01428293          	addi	t0,t0,20 # 19c <reset_vector+0x154>
 190:	34129073          	csrw	mepc,t0
 194:	f1402573          	csrr	a0,mhartid
 198:	30200073          	mret
 19c:	00200193          	li	gp,2
 1a0:	00000313          	li	t1,0
 1a4:	00000297          	auipc	t0,0x0
 1a8:	00c28293          	addi	t0,t0,12 # 1b0 <reset_vector+0x168>
 1ac:	00228367          	jalr	t1,2(t0)
 1b0:	a011                	j	1b4 <reset_vector+0x16c>
 1b2:	a019                	j	1b8 <reset_vector+0x170>
 1b4:	08c0006f          	j	240 <fail>
 1b8:	00300193          	li	gp,3
 1bc:	00000297          	auipc	t0,0x0
 1c0:	00c28293          	addi	t0,t0,12 # 1c8 <reset_vector+0x180>
 1c4:	00128367          	jalr	t1,1(t0)
 1c8:	0080006f          	j	1d0 <reset_vector+0x188>
 1cc:	0740006f          	j	240 <fail>
 1d0:	00400193          	li	gp,4
 1d4:	00000313          	li	t1,0
 1d8:	00000297          	auipc	t0,0x0
 1dc:	00c28293          	addi	t0,t0,12 # 1e4 <reset_vector+0x19c>
 1e0:	00328367          	jalr	t1,3(t0)
 1e4:	a011                	j	1e8 <reset_vector+0x1a0>
 1e6:	a019                	j	1ec <reset_vector+0x1a4>
 1e8:	0580006f          	j	240 <fail>
 1ec:	00500193          	li	gp,5
 1f0:	00000313          	li	t1,0
 1f4:	00000297          	auipc	t0,0x0
 1f8:	00c28293          	addi	t0,t0,12 # 200 <reset_vector+0x1b8>
 1fc:	0060036f          	jal	t1,202 <reset_vector+0x1ba>
 200:	a011                	j	204 <reset_vector+0x1bc>
 202:	a019                	j	208 <reset_vector+0x1c0>
 204:	03c0006f          	j	240 <fail>
 208:	00600193          	li	gp,6
 20c:	00000313          	li	t1,0
 210:	00000297          	auipc	t0,0x0
 214:	00c28293          	addi	t0,t0,12 # 21c <reset_vector+0x1d4>
 218:	00000363          	beqz	zero,21e <reset_vector+0x1d6>
 21c:	a011                	j	220 <reset_vector+0x1d8>
 21e:	a019                	j	224 <reset_vector+0x1dc>
 220:	0200006f          	j	240 <fail>
 224:	00700193          	li	gp,7
 228:	00001563          	bnez	zero,232 <reset_vector+0x1ea>
 22c:	00c0006f          	j	238 <reset_vector+0x1f0>
 230:	a009                	j	232 <reset_vector+0x1ea>
 232:	a009                	j	234 <reset_vector+0x1ec>
 234:	00c0006f          	j	240 <fail>
 238:	0240006f          	j	25c <pass>
 23c:	02301063          	bne	zero,gp,25c <pass>

00000240 <fail>:
 240:	0ff0000f          	fence
 244:	00018063          	beqz	gp,244 <fail+0x4>
 248:	00119193          	slli	gp,gp,0x1
 24c:	0011e193          	ori	gp,gp,1
 250:	05d00893          	li	a7,93
 254:	00018513          	mv	a0,gp
 258:	00000073          	ecall

0000025c <pass>:
 25c:	0ff0000f          	fence
 260:	00100193          	li	gp,1
 264:	05d00893          	li	a7,93
 268:	00000513          	li	a0,0
 26c:	00000073          	ecall

00000270 <stvec_handler>:
 270:	00200513          	li	a0,2
 274:	02a18063          	beq	gp,a0,294 <stvec_handler+0x24>
 278:	00400513          	li	a0,4
 27c:	00a18c63          	beq	gp,a0,294 <stvec_handler+0x24>
 280:	00500513          	li	a0,5
 284:	00a18863          	beq	gp,a0,294 <stvec_handler+0x24>
 288:	00600513          	li	a0,6
 28c:	00a18463          	beq	gp,a0,294 <stvec_handler+0x24>
 290:	fb1ff06f          	j	240 <fail>
 294:	fa0316e3          	bnez	t1,240 <fail>
 298:	00000593          	li	a1,0
 29c:	14202573          	csrr	a0,scause
 2a0:	fab510e3          	bne	a0,a1,240 <fail>
 2a4:	141025f3          	csrr	a1,sepc
 2a8:	00458593          	addi	a1,a1,4
 2ac:	f8b29ae3          	bne	t0,a1,240 <fail>
 2b0:	14302573          	csrr	a0,stval
 2b4:	00050663          	beqz	a0,2c0 <stvec_handler+0x50>
 2b8:	ffe50513          	addi	a0,a0,-2
 2bc:	f85512e3          	bne	a0,t0,240 <fail>
 2c0:	00858593          	addi	a1,a1,8
 2c4:	14159073          	csrw	sepc,a1
 2c8:	10200073          	sret
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
