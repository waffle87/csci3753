
char_driver_sample.ko:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <__pfx_my_open>:
   0:	90                   	nop
   1:	90                   	nop
   2:	90                   	nop
   3:	90                   	nop
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	90                   	nop
   9:	90                   	nop
   a:	90                   	nop
   b:	90                   	nop
   c:	90                   	nop
   d:	90                   	nop
   e:	90                   	nop
   f:	90                   	nop

0000000000000010 <my_open>:
  10:	e8 00 00 00 00       	call   15 <my_open+0x5>
  15:	55                   	push   %rbp
  16:	31 c0                	xor    %eax,%eax
  18:	83 05 00 00 00 00 01 	addl   $0x1,0x0(%rip)        # 1f <my_open+0xf>
  1f:	48 89 e5             	mov    %rsp,%rbp
  22:	5d                   	pop    %rbp
  23:	e9 00 00 00 00       	jmp    28 <my_open+0x18>
  28:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  2f:	00 

0000000000000030 <__pfx_my_release>:
  30:	90                   	nop
  31:	90                   	nop
  32:	90                   	nop
  33:	90                   	nop
  34:	90                   	nop
  35:	90                   	nop
  36:	90                   	nop
  37:	90                   	nop
  38:	90                   	nop
  39:	90                   	nop
  3a:	90                   	nop
  3b:	90                   	nop
  3c:	90                   	nop
  3d:	90                   	nop
  3e:	90                   	nop
  3f:	90                   	nop

0000000000000040 <my_release>:
  40:	e8 00 00 00 00       	call   45 <my_release+0x5>
  45:	55                   	push   %rbp
  46:	31 c0                	xor    %eax,%eax
  48:	83 2d 00 00 00 00 01 	subl   $0x1,0x0(%rip)        # 4f <my_release+0xf>
  4f:	48 89 e5             	mov    %rsp,%rbp
  52:	5d                   	pop    %rbp
  53:	e9 00 00 00 00       	jmp    58 <my_release+0x18>
  58:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  5f:	00 

0000000000000060 <__pfx_my_llseek>:
  60:	90                   	nop
  61:	90                   	nop
  62:	90                   	nop
  63:	90                   	nop
  64:	90                   	nop
  65:	90                   	nop
  66:	90                   	nop
  67:	90                   	nop
  68:	90                   	nop
  69:	90                   	nop
  6a:	90                   	nop
  6b:	90                   	nop
  6c:	90                   	nop
  6d:	90                   	nop
  6e:	90                   	nop
  6f:	90                   	nop

0000000000000070 <my_llseek>:
  70:	e8 00 00 00 00       	call   75 <my_llseek+0x5>
  75:	55                   	push   %rbp
  76:	48 89 e5             	mov    %rsp,%rbp
  79:	83 fa 01             	cmp    $0x1,%edx
  7c:	74 23                	je     a1 <my_llseek+0x31>
  7e:	83 fa 02             	cmp    $0x2,%edx
  81:	74 43                	je     c6 <my_llseek+0x56>
  83:	85 d2                	test   %edx,%edx
  85:	74 1e                	je     a5 <my_llseek+0x35>
  87:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
  8e:	e8 00 00 00 00       	call   93 <my_llseek+0x23>
  93:	31 c0                	xor    %eax,%eax
  95:	5d                   	pop    %rbp
  96:	31 d2                	xor    %edx,%edx
  98:	31 f6                	xor    %esi,%esi
  9a:	31 ff                	xor    %edi,%edi
  9c:	e9 00 00 00 00       	jmp    a1 <my_llseek+0x31>
  a1:	48 03 77 40          	add    0x40(%rdi),%rsi
  a5:	48 85 f6             	test   %rsi,%rsi
  a8:	78 25                	js     cf <my_llseek+0x5f>
  aa:	b8 00 04 00 00       	mov    $0x400,%eax
  af:	48 39 c6             	cmp    %rax,%rsi
  b2:	48 0f 4e c6          	cmovle %rsi,%rax
  b6:	48 89 47 40          	mov    %rax,0x40(%rdi)
  ba:	5d                   	pop    %rbp
  bb:	31 d2                	xor    %edx,%edx
  bd:	31 f6                	xor    %esi,%esi
  bf:	31 ff                	xor    %edi,%edi
  c1:	e9 00 00 00 00       	jmp    c6 <my_llseek+0x56>
  c6:	48 81 c6 00 04 00 00 	add    $0x400,%rsi
  cd:	eb d6                	jmp    a5 <my_llseek+0x35>
  cf:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
  d6:	e8 00 00 00 00       	call   db <my_llseek+0x6b>
  db:	48 c7 c0 ea ff ff ff 	mov    $0xffffffffffffffea,%rax
  e2:	5d                   	pop    %rbp
  e3:	31 d2                	xor    %edx,%edx
  e5:	31 f6                	xor    %esi,%esi
  e7:	31 ff                	xor    %edi,%edi
  e9:	e9 00 00 00 00       	jmp    ee <my_llseek+0x7e>
  ee:	66 90                	xchg   %ax,%ax

00000000000000f0 <__pfx_my_read>:
  f0:	90                   	nop
  f1:	90                   	nop
  f2:	90                   	nop
  f3:	90                   	nop
  f4:	90                   	nop
  f5:	90                   	nop
  f6:	90                   	nop
  f7:	90                   	nop
  f8:	90                   	nop
  f9:	90                   	nop
  fa:	90                   	nop
  fb:	90                   	nop
  fc:	90                   	nop
  fd:	90                   	nop
  fe:	90                   	nop
  ff:	90                   	nop

0000000000000100 <my_read>:
 100:	e8 00 00 00 00       	call   105 <my_read+0x5>
 105:	55                   	push   %rbp
 106:	48 8b 39             	mov    (%rcx),%rdi
 109:	48 89 e5             	mov    %rsp,%rbp
 10c:	41 56                	push   %r14
 10e:	41 55                	push   %r13
 110:	41 54                	push   %r12
 112:	53                   	push   %rbx
 113:	bb 00 04 00 00       	mov    $0x400,%ebx
 118:	48 29 fb             	sub    %rdi,%rbx
 11b:	74 72                	je     18f <my_read+0x8f>
 11d:	48 39 d3             	cmp    %rdx,%rbx
 120:	4c 8d a7 00 00 00 00 	lea    0x0(%rdi),%r12
 127:	48 0f 47 da          	cmova  %rdx,%rbx
 12b:	48 81 fb ff ff ff 7f 	cmp    $0x7fffffff,%rbx
 132:	77 7e                	ja     1b2 <my_read+0xb2>
 134:	49 89 f6             	mov    %rsi,%r14
 137:	ba 01 00 00 00       	mov    $0x1,%edx
 13c:	48 89 de             	mov    %rbx,%rsi
 13f:	4c 89 e7             	mov    %r12,%rdi
 142:	49 89 cd             	mov    %rcx,%r13
 145:	e8 00 00 00 00       	call   14a <my_read+0x4a>
 14a:	48 89 da             	mov    %rbx,%rdx
 14d:	4c 89 e6             	mov    %r12,%rsi
 150:	4c 89 f7             	mov    %r14,%rdi
 153:	e8 00 00 00 00       	call   158 <my_read+0x58>
 158:	48 85 c0             	test   %rax,%rax
 15b:	75 57                	jne    1b4 <my_read+0xb4>
 15d:	49 01 5d 00          	add    %rbx,0x0(%r13)
 161:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx
 168:	48 89 de             	mov    %rbx,%rsi
 16b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 172:	e8 00 00 00 00       	call   177 <my_read+0x77>
 177:	48 89 d8             	mov    %rbx,%rax
 17a:	5b                   	pop    %rbx
 17b:	41 5c                	pop    %r12
 17d:	41 5d                	pop    %r13
 17f:	41 5e                	pop    %r14
 181:	5d                   	pop    %rbp
 182:	31 d2                	xor    %edx,%edx
 184:	31 c9                	xor    %ecx,%ecx
 186:	31 f6                	xor    %esi,%esi
 188:	31 ff                	xor    %edi,%edi
 18a:	e9 00 00 00 00       	jmp    18f <my_read+0x8f>
 18f:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 196:	e8 00 00 00 00       	call   19b <my_read+0x9b>
 19b:	31 c0                	xor    %eax,%eax
 19d:	5b                   	pop    %rbx
 19e:	41 5c                	pop    %r12
 1a0:	41 5d                	pop    %r13
 1a2:	41 5e                	pop    %r14
 1a4:	5d                   	pop    %rbp
 1a5:	31 d2                	xor    %edx,%edx
 1a7:	31 c9                	xor    %ecx,%ecx
 1a9:	31 f6                	xor    %esi,%esi
 1ab:	31 ff                	xor    %edi,%edi
 1ad:	e9 00 00 00 00       	jmp    1b2 <my_read+0xb2>
 1b2:	0f 0b                	ud2
 1b4:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 1bb:	e8 00 00 00 00       	call   1c0 <my_read+0xc0>
 1c0:	48 c7 c0 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rax
 1c7:	eb b1                	jmp    17a <my_read+0x7a>
 1c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000001d0 <__pfx_init_module>:
 1d0:	90                   	nop
 1d1:	90                   	nop
 1d2:	90                   	nop
 1d3:	90                   	nop
 1d4:	90                   	nop
 1d5:	90                   	nop
 1d6:	90                   	nop
 1d7:	90                   	nop
 1d8:	90                   	nop
 1d9:	90                   	nop
 1da:	90                   	nop
 1db:	90                   	nop
 1dc:	90                   	nop
 1dd:	90                   	nop
 1de:	90                   	nop
 1df:	90                   	nop

00000000000001e0 <init_module>:
 1e0:	e8 00 00 00 00       	call   1e5 <init_module+0x5>
 1e5:	55                   	push   %rbp
 1e6:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
 1ed:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 1f4:	48 89 e5             	mov    %rsp,%rbp
 1f7:	53                   	push   %rbx
 1f8:	e8 00 00 00 00       	call   1fd <init_module+0x1d>
 1fd:	49 c7 c0 00 00 00 00 	mov    $0x0,%r8
 204:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx
 20b:	31 f6                	xor    %esi,%esi
 20d:	ba 00 01 00 00       	mov    $0x100,%edx
 212:	bf ff 01 00 00       	mov    $0x1ff,%edi
 217:	e8 00 00 00 00       	call   21c <init_module+0x3c>
 21c:	89 c3                	mov    %eax,%ebx
 21e:	85 c0                	test   %eax,%eax
 220:	75 2a                	jne    24c <init_module+0x6c>
 222:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
 229:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 230:	e8 00 00 00 00       	call   235 <init_module+0x55>
 235:	89 d8                	mov    %ebx,%eax
 237:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
 23b:	c9                   	leave
 23c:	31 d2                	xor    %edx,%edx
 23e:	31 c9                	xor    %ecx,%ecx
 240:	31 f6                	xor    %esi,%esi
 242:	31 ff                	xor    %edi,%edi
 244:	45 31 c0             	xor    %r8d,%r8d
 247:	e9 00 00 00 00       	jmp    24c <init_module+0x6c>
 24c:	89 c6                	mov    %eax,%esi
 24e:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 255:	e8 00 00 00 00       	call   25a <init_module+0x7a>
 25a:	89 d8                	mov    %ebx,%eax
 25c:	48 8b 5d f8          	mov    -0x8(%rbp),%rbx
 260:	c9                   	leave
 261:	31 d2                	xor    %edx,%edx
 263:	31 c9                	xor    %ecx,%ecx
 265:	31 f6                	xor    %esi,%esi
 267:	31 ff                	xor    %edi,%edi
 269:	45 31 c0             	xor    %r8d,%r8d
 26c:	e9 00 00 00 00       	jmp    271 <init_module+0x91>
 271:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
 278:	00 00 00 00 
 27c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000280 <__pfx_cleanup_module>:
 280:	90                   	nop
 281:	90                   	nop
 282:	90                   	nop
 283:	90                   	nop
 284:	90                   	nop
 285:	90                   	nop
 286:	90                   	nop
 287:	90                   	nop
 288:	90                   	nop
 289:	90                   	nop
 28a:	90                   	nop
 28b:	90                   	nop
 28c:	90                   	nop
 28d:	90                   	nop
 28e:	90                   	nop
 28f:	90                   	nop

0000000000000290 <cleanup_module>:
 290:	e8 00 00 00 00       	call   295 <cleanup_module+0x5>
 295:	55                   	push   %rbp
 296:	8b 05 00 00 00 00    	mov    0x0(%rip),%eax        # 29c <cleanup_module+0xc>
 29c:	48 89 e5             	mov    %rsp,%rbp
 29f:	85 c0                	test   %eax,%eax
 2a1:	75 3b                	jne    2de <cleanup_module+0x4e>
 2a3:	48 c7 c1 00 00 00 00 	mov    $0x0,%rcx
 2aa:	ba 00 01 00 00       	mov    $0x100,%edx
 2af:	31 f6                	xor    %esi,%esi
 2b1:	bf ff 01 00 00       	mov    $0x1ff,%edi
 2b6:	e8 00 00 00 00       	call   2bb <cleanup_module+0x2b>
 2bb:	48 c7 c6 00 00 00 00 	mov    $0x0,%rsi
 2c2:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 2c9:	e8 00 00 00 00       	call   2ce <cleanup_module+0x3e>
 2ce:	5d                   	pop    %rbp
 2cf:	31 c0                	xor    %eax,%eax
 2d1:	31 d2                	xor    %edx,%edx
 2d3:	31 c9                	xor    %ecx,%ecx
 2d5:	31 f6                	xor    %esi,%esi
 2d7:	31 ff                	xor    %edi,%edi
 2d9:	e9 00 00 00 00       	jmp    2de <cleanup_module+0x4e>
 2de:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 2e5:	e8 00 00 00 00       	call   2ea <cleanup_module+0x5a>
 2ea:	5d                   	pop    %rbp
 2eb:	31 c0                	xor    %eax,%eax
 2ed:	31 d2                	xor    %edx,%edx
 2ef:	31 c9                	xor    %ecx,%ecx
 2f1:	31 f6                	xor    %esi,%esi
 2f3:	31 ff                	xor    %edi,%edi
 2f5:	e9 00 00 00 00       	jmp    2fa <cleanup_module+0x6a>
 2fa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000300 <__pfx_my_write>:
 300:	90                   	nop
 301:	90                   	nop
 302:	90                   	nop
 303:	90                   	nop
 304:	90                   	nop
 305:	90                   	nop
 306:	90                   	nop
 307:	90                   	nop
 308:	90                   	nop
 309:	90                   	nop
 30a:	90                   	nop
 30b:	90                   	nop
 30c:	90                   	nop
 30d:	90                   	nop
 30e:	90                   	nop
 30f:	90                   	nop

0000000000000310 <my_write>:
 310:	e8 00 00 00 00       	call   315 <my_write+0x5>
 315:	55                   	push   %rbp
 316:	48 8b 39             	mov    (%rcx),%rdi
 319:	48 89 e5             	mov    %rsp,%rbp
 31c:	41 56                	push   %r14
 31e:	41 55                	push   %r13
 320:	41 54                	push   %r12
 322:	53                   	push   %rbx
 323:	bb 00 04 00 00       	mov    $0x400,%ebx
 328:	48 29 fb             	sub    %rdi,%rbx
 32b:	0f 84 85 00 00 00    	je     3b6 <my_write+0xa6>
 331:	48 39 d3             	cmp    %rdx,%rbx
 334:	4c 8d a7 00 00 00 00 	lea    0x0(%rdi),%r12
 33b:	48 0f 47 da          	cmova  %rdx,%rbx
 33f:	48 81 fb ff ff ff 7f 	cmp    $0x7fffffff,%rbx
 346:	77 57                	ja     39f <my_write+0x8f>
 348:	31 d2                	xor    %edx,%edx
 34a:	49 89 f5             	mov    %rsi,%r13
 34d:	4c 89 e7             	mov    %r12,%rdi
 350:	48 89 de             	mov    %rbx,%rsi
 353:	49 89 ce             	mov    %rcx,%r14
 356:	e8 00 00 00 00       	call   35b <my_write+0x4b>
 35b:	48 89 da             	mov    %rbx,%rdx
 35e:	4c 89 ee             	mov    %r13,%rsi
 361:	4c 89 e7             	mov    %r12,%rdi
 364:	e8 00 00 00 00       	call   369 <my_write+0x59>
 369:	48 85 c0             	test   %rax,%rax
 36c:	75 33                	jne    3a1 <my_write+0x91>
 36e:	49 01 1e             	add    %rbx,(%r14)
 371:	48 c7 c2 00 00 00 00 	mov    $0x0,%rdx
 378:	48 89 de             	mov    %rbx,%rsi
 37b:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 382:	e8 00 00 00 00       	call   387 <my_write+0x77>
 387:	48 89 d8             	mov    %rbx,%rax
 38a:	5b                   	pop    %rbx
 38b:	41 5c                	pop    %r12
 38d:	41 5d                	pop    %r13
 38f:	41 5e                	pop    %r14
 391:	5d                   	pop    %rbp
 392:	31 d2                	xor    %edx,%edx
 394:	31 c9                	xor    %ecx,%ecx
 396:	31 f6                	xor    %esi,%esi
 398:	31 ff                	xor    %edi,%edi
 39a:	e9 00 00 00 00       	jmp    39f <my_write+0x8f>
 39f:	0f 0b                	ud2
 3a1:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 3a8:	e8 00 00 00 00       	call   3ad <my_write+0x9d>
 3ad:	48 c7 c0 f2 ff ff ff 	mov    $0xfffffffffffffff2,%rax
 3b4:	eb d4                	jmp    38a <my_write+0x7a>
 3b6:	48 c7 c7 00 00 00 00 	mov    $0x0,%rdi
 3bd:	e8 00 00 00 00       	call   3c2 <my_write+0xb2>
 3c2:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
 3c9:	eb bf                	jmp    38a <my_write+0x7a>
