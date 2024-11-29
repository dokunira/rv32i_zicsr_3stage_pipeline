
rv32ui-p-jalr:     file format elf32-littleriscv


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
 154:	00000293          	li	t0,0
 158:	00028a63          	beqz	t0,16c <reset_vector+0x124>
 15c:	10529073          	csrw	stvec,t0
 160:	0000b2b7          	lui	t0,0xb
 164:	10928293          	addi	t0,t0,265 # b109 <_end+0xad09>
 168:	30229073          	csrw	medeleg,t0
 16c:	30005073          	csrwi	mstatus,0
 170:	00000297          	auipc	t0,0x0
 174:	01428293          	addi	t0,t0,20 # 184 <test_2>
 178:	34129073          	csrw	mepc,t0
 17c:	f1402573          	csrr	a0,mhartid
 180:	30200073          	mret

00000184 <test_2>:
 184:	00200193          	li	gp,2
 188:	00000293          	li	t0,0
 18c:	00000317          	auipc	t1,0x0
 190:	01030313          	addi	t1,t1,16 # 19c <target_2>
 194:	000302e7          	jalr	t0,t1

00000198 <linkaddr_2>:
 198:	0e00006f          	j	278 <fail>

0000019c <target_2>:
 19c:	00000317          	auipc	t1,0x0
 1a0:	ffc30313          	addi	t1,t1,-4 # 198 <linkaddr_2>
 1a4:	0c629a63          	bne	t0,t1,278 <fail>

000001a8 <test_3>:
 1a8:	00300193          	li	gp,3
 1ac:	00000297          	auipc	t0,0x0
 1b0:	01028293          	addi	t0,t0,16 # 1bc <target_3>
 1b4:	000282e7          	jalr	t0,t0

000001b8 <linkaddr_3>:
 1b8:	0c00006f          	j	278 <fail>

000001bc <target_3>:
 1bc:	00000317          	auipc	t1,0x0
 1c0:	ffc30313          	addi	t1,t1,-4 # 1b8 <linkaddr_3>
 1c4:	0a629a63          	bne	t0,t1,278 <fail>

000001c8 <test_4>:
 1c8:	00400193          	li	gp,4
 1cc:	00000213          	li	tp,0
 1d0:	00000317          	auipc	t1,0x0
 1d4:	01030313          	addi	t1,t1,16 # 1e0 <test_4+0x18>
 1d8:	000306e7          	jalr	a3,t1
 1dc:	08301e63          	bne	zero,gp,278 <fail>
 1e0:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 1e4:	00200293          	li	t0,2
 1e8:	fe5214e3          	bne	tp,t0,1d0 <test_4+0x8>

000001ec <test_5>:
 1ec:	00500193          	li	gp,5
 1f0:	00000213          	li	tp,0
 1f4:	00000317          	auipc	t1,0x0
 1f8:	01430313          	addi	t1,t1,20 # 208 <test_5+0x1c>
 1fc:	00000013          	nop
 200:	000306e7          	jalr	a3,t1
 204:	06301a63          	bne	zero,gp,278 <fail>
 208:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 20c:	00200293          	li	t0,2
 210:	fe5212e3          	bne	tp,t0,1f4 <test_5+0x8>

00000214 <test_6>:
 214:	00600193          	li	gp,6
 218:	00000213          	li	tp,0
 21c:	00000317          	auipc	t1,0x0
 220:	01830313          	addi	t1,t1,24 # 234 <test_6+0x20>
 224:	00000013          	nop
 228:	00000013          	nop
 22c:	000306e7          	jalr	a3,t1
 230:	04301463          	bne	zero,gp,278 <fail>
 234:	00120213          	addi	tp,tp,1 # 1 <_start+0x1>
 238:	00200293          	li	t0,2
 23c:	fe5210e3          	bne	tp,t0,21c <test_6+0x8>

00000240 <test_7>:
 240:	00700193          	li	gp,7
 244:	00100293          	li	t0,1
 248:	00000317          	auipc	t1,0x0
 24c:	01c30313          	addi	t1,t1,28 # 264 <test_7+0x24>
 250:	ffc30067          	jr	-4(t1)
 254:	00128293          	addi	t0,t0,1
 258:	00128293          	addi	t0,t0,1
 25c:	00128293          	addi	t0,t0,1
 260:	00128293          	addi	t0,t0,1
 264:	00128293          	addi	t0,t0,1
 268:	00128293          	addi	t0,t0,1
 26c:	00400393          	li	t2,4
 270:	00729463          	bne	t0,t2,278 <fail>
 274:	02301063          	bne	zero,gp,294 <pass>

00000278 <fail>:
 278:	0ff0000f          	fence
 27c:	00018063          	beqz	gp,27c <fail+0x4>
 280:	00119193          	slli	gp,gp,0x1
 284:	0011e193          	ori	gp,gp,1
 288:	05d00893          	li	a7,93
 28c:	00018513          	mv	a0,gp
 290:	00000073          	ecall

00000294 <pass>:
 294:	0ff0000f          	fence
 298:	00100193          	li	gp,1
 29c:	05d00893          	li	a7,93
 2a0:	00000513          	li	a0,0
 2a4:	00000073          	ecall
 2a8:	c0001073          	unimp
 2ac:	0000                	.insn	2, 0x
 2ae:	0000                	.insn	2, 0x
 2b0:	0000                	.insn	2, 0x
 2b2:	0000                	.insn	2, 0x
