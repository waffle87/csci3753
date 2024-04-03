
pa2test_sample:     file format elf64-x86-64


Disassembly of section .init:

00000000004006e0 <_init>:
  4006e0:	48 83 ec 08          	sub    $0x8,%rsp
  4006e4:	48 8b 05 0d 19 20 00 	mov    0x20190d(%rip),%rax        # 601ff8 <__gmon_start__>
  4006eb:	48 85 c0             	test   %rax,%rax
  4006ee:	74 05                	je     4006f5 <_init+0x15>
  4006f0:	e8 fb 00 00 00       	call   4007f0 <__gmon_start__@plt>
  4006f5:	48 83 c4 08          	add    $0x8,%rsp
  4006f9:	c3                   	ret

Disassembly of section .plt:

0000000000400700 <.plt>:
  400700:	ff 35 02 19 20 00    	push   0x201902(%rip)        # 602008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400706:	ff 25 04 19 20 00    	jmp    *0x201904(%rip)        # 602010 <_GLOBAL_OFFSET_TABLE_+0x10>
  40070c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400710 <putchar@plt>:
  400710:	ff 25 02 19 20 00    	jmp    *0x201902(%rip)        # 602018 <putchar@GLIBC_2.2.5>
  400716:	68 00 00 00 00       	push   $0x0
  40071b:	e9 e0 ff ff ff       	jmp    400700 <.plt>

0000000000400720 <puts@plt>:
  400720:	ff 25 fa 18 20 00    	jmp    *0x2018fa(%rip)        # 602020 <puts@GLIBC_2.2.5>
  400726:	68 01 00 00 00       	push   $0x1
  40072b:	e9 d0 ff ff ff       	jmp    400700 <.plt>

0000000000400730 <write@plt>:
  400730:	ff 25 f2 18 20 00    	jmp    *0x2018f2(%rip)        # 602028 <write@GLIBC_2.2.5>
  400736:	68 02 00 00 00       	push   $0x2
  40073b:	e9 c0 ff ff ff       	jmp    400700 <.plt>

0000000000400740 <strlen@plt>:
  400740:	ff 25 ea 18 20 00    	jmp    *0x2018ea(%rip)        # 602030 <strlen@GLIBC_2.2.5>
  400746:	68 03 00 00 00       	push   $0x3
  40074b:	e9 b0 ff ff ff       	jmp    400700 <.plt>

0000000000400750 <printf@plt>:
  400750:	ff 25 e2 18 20 00    	jmp    *0x2018e2(%rip)        # 602038 <printf@GLIBC_2.2.5>
  400756:	68 04 00 00 00       	push   $0x4
  40075b:	e9 a0 ff ff ff       	jmp    400700 <.plt>

0000000000400760 <lseek@plt>:
  400760:	ff 25 da 18 20 00    	jmp    *0x2018da(%rip)        # 602040 <lseek@GLIBC_2.2.5>
  400766:	68 05 00 00 00       	push   $0x5
  40076b:	e9 90 ff ff ff       	jmp    400700 <.plt>

0000000000400770 <read@plt>:
  400770:	ff 25 d2 18 20 00    	jmp    *0x2018d2(%rip)        # 602048 <read@GLIBC_2.2.5>
  400776:	68 06 00 00 00       	push   $0x6
  40077b:	e9 80 ff ff ff       	jmp    400700 <.plt>

0000000000400780 <__libc_start_main@plt>:
  400780:	ff 25 ca 18 20 00    	jmp    *0x2018ca(%rip)        # 602050 <__libc_start_main@GLIBC_2.2.5>
  400786:	68 07 00 00 00       	push   $0x7
  40078b:	e9 70 ff ff ff       	jmp    400700 <.plt>

0000000000400790 <fgets@plt>:
  400790:	ff 25 c2 18 20 00    	jmp    *0x2018c2(%rip)        # 602058 <fgets@GLIBC_2.2.5>
  400796:	68 08 00 00 00       	push   $0x8
  40079b:	e9 60 ff ff ff       	jmp    400700 <.plt>

00000000004007a0 <fprintf@plt>:
  4007a0:	ff 25 ba 18 20 00    	jmp    *0x2018ba(%rip)        # 602060 <fprintf@GLIBC_2.2.5>
  4007a6:	68 09 00 00 00       	push   $0x9
  4007ab:	e9 50 ff ff ff       	jmp    400700 <.plt>

00000000004007b0 <malloc@plt>:
  4007b0:	ff 25 b2 18 20 00    	jmp    *0x2018b2(%rip)        # 602068 <malloc@GLIBC_2.2.5>
  4007b6:	68 0a 00 00 00       	push   $0xa
  4007bb:	e9 40 ff ff ff       	jmp    400700 <.plt>

00000000004007c0 <open@plt>:
  4007c0:	ff 25 aa 18 20 00    	jmp    *0x2018aa(%rip)        # 602070 <open@GLIBC_2.2.5>
  4007c6:	68 0b 00 00 00       	push   $0xb
  4007cb:	e9 30 ff ff ff       	jmp    400700 <.plt>

00000000004007d0 <atoi@plt>:
  4007d0:	ff 25 a2 18 20 00    	jmp    *0x2018a2(%rip)        # 602078 <atoi@GLIBC_2.2.5>
  4007d6:	68 0c 00 00 00       	push   $0xc
  4007db:	e9 20 ff ff ff       	jmp    400700 <.plt>

00000000004007e0 <exit@plt>:
  4007e0:	ff 25 9a 18 20 00    	jmp    *0x20189a(%rip)        # 602080 <exit@GLIBC_2.2.5>
  4007e6:	68 0d 00 00 00       	push   $0xd
  4007eb:	e9 10 ff ff ff       	jmp    400700 <.plt>

Disassembly of section .plt.got:

00000000004007f0 <__gmon_start__@plt>:
  4007f0:	ff 25 02 18 20 00    	jmp    *0x201802(%rip)        # 601ff8 <__gmon_start__>
  4007f6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000400800 <_start>:
  400800:	31 ed                	xor    %ebp,%ebp
  400802:	49 89 d1             	mov    %rdx,%r9
  400805:	5e                   	pop    %rsi
  400806:	48 89 e2             	mov    %rsp,%rdx
  400809:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  40080d:	50                   	push   %rax
  40080e:	54                   	push   %rsp
  40080f:	49 c7 c0 a0 0d 40 00 	mov    $0x400da0,%r8
  400816:	48 c7 c1 30 0d 40 00 	mov    $0x400d30,%rcx
  40081d:	48 c7 c7 f6 08 40 00 	mov    $0x4008f6,%rdi
  400824:	e8 57 ff ff ff       	call   400780 <__libc_start_main@plt>
  400829:	f4                   	hlt
  40082a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400830 <deregister_tm_clones>:
  400830:	b8 9f 20 60 00       	mov    $0x60209f,%eax
  400835:	55                   	push   %rbp
  400836:	48 2d 98 20 60 00    	sub    $0x602098,%rax
  40083c:	48 83 f8 0e          	cmp    $0xe,%rax
  400840:	48 89 e5             	mov    %rsp,%rbp
  400843:	76 1b                	jbe    400860 <deregister_tm_clones+0x30>
  400845:	b8 00 00 00 00       	mov    $0x0,%eax
  40084a:	48 85 c0             	test   %rax,%rax
  40084d:	74 11                	je     400860 <deregister_tm_clones+0x30>
  40084f:	5d                   	pop    %rbp
  400850:	bf 98 20 60 00       	mov    $0x602098,%edi
  400855:	ff e0                	jmp    *%rax
  400857:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  40085e:	00 00 
  400860:	5d                   	pop    %rbp
  400861:	c3                   	ret
  400862:	0f 1f 40 00          	nopl   0x0(%rax)
  400866:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  40086d:	00 00 00 

0000000000400870 <register_tm_clones>:
  400870:	be 98 20 60 00       	mov    $0x602098,%esi
  400875:	55                   	push   %rbp
  400876:	48 81 ee 98 20 60 00 	sub    $0x602098,%rsi
  40087d:	48 c1 fe 03          	sar    $0x3,%rsi
  400881:	48 89 e5             	mov    %rsp,%rbp
  400884:	48 89 f0             	mov    %rsi,%rax
  400887:	48 c1 e8 3f          	shr    $0x3f,%rax
  40088b:	48 01 c6             	add    %rax,%rsi
  40088e:	48 d1 fe             	sar    %rsi
  400891:	74 15                	je     4008a8 <register_tm_clones+0x38>
  400893:	b8 00 00 00 00       	mov    $0x0,%eax
  400898:	48 85 c0             	test   %rax,%rax
  40089b:	74 0b                	je     4008a8 <register_tm_clones+0x38>
  40089d:	5d                   	pop    %rbp
  40089e:	bf 98 20 60 00       	mov    $0x602098,%edi
  4008a3:	ff e0                	jmp    *%rax
  4008a5:	0f 1f 00             	nopl   (%rax)
  4008a8:	5d                   	pop    %rbp
  4008a9:	c3                   	ret
  4008aa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

00000000004008b0 <__do_global_dtors_aux>:
  4008b0:	80 3d 11 18 20 00 00 	cmpb   $0x0,0x201811(%rip)        # 6020c8 <completed.7594>
  4008b7:	75 11                	jne    4008ca <__do_global_dtors_aux+0x1a>
  4008b9:	55                   	push   %rbp
  4008ba:	48 89 e5             	mov    %rsp,%rbp
  4008bd:	e8 6e ff ff ff       	call   400830 <deregister_tm_clones>
  4008c2:	5d                   	pop    %rbp
  4008c3:	c6 05 fe 17 20 00 01 	movb   $0x1,0x2017fe(%rip)        # 6020c8 <completed.7594>
  4008ca:	f3 c3                	repz ret
  4008cc:	0f 1f 40 00          	nopl   0x0(%rax)

00000000004008d0 <frame_dummy>:
  4008d0:	bf 20 1e 60 00       	mov    $0x601e20,%edi
  4008d5:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  4008d9:	75 05                	jne    4008e0 <frame_dummy+0x10>
  4008db:	eb 93                	jmp    400870 <register_tm_clones>
  4008dd:	0f 1f 00             	nopl   (%rax)
  4008e0:	b8 00 00 00 00       	mov    $0x0,%eax
  4008e5:	48 85 c0             	test   %rax,%rax
  4008e8:	74 f1                	je     4008db <frame_dummy+0xb>
  4008ea:	55                   	push   %rbp
  4008eb:	48 89 e5             	mov    %rsp,%rbp
  4008ee:	ff d0                	call   *%rax
  4008f0:	5d                   	pop    %rbp
  4008f1:	e9 7a ff ff ff       	jmp    400870 <register_tm_clones>

00000000004008f6 <main>:
  4008f6:	55                   	push   %rbp
  4008f7:	48 89 e5             	mov    %rsp,%rbp
  4008fa:	48 83 ec 30          	sub    $0x30,%rsp
  4008fe:	89 7d dc             	mov    %edi,-0x24(%rbp)
  400901:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  400905:	bf 50 00 00 00       	mov    $0x50,%edi
  40090a:	e8 a1 fe ff ff       	call   4007b0 <malloc@plt>
  40090f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
  400913:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
  400918:	75 39                	jne    400953 <main+0x5d>
  40091a:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  40091e:	48 8b 10             	mov    (%rax),%rdx
  400921:	48 8b 05 98 17 20 00 	mov    0x201798(%rip),%rax        # 6020c0 <stderr@GLIBC_2.2.5>
  400928:	b9 b8 0d 40 00       	mov    $0x400db8,%ecx
  40092d:	be c6 0d 40 00       	mov    $0x400dc6,%esi
  400932:	48 89 c7             	mov    %rax,%rdi
  400935:	b8 00 00 00 00       	mov    $0x0,%eax
  40093a:	e8 61 fe ff ff       	call   4007a0 <fprintf@plt>
  40093f:	bf 0a 00 00 00       	mov    $0xa,%edi
  400944:	e8 c7 fd ff ff       	call   400710 <putchar@plt>
  400949:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  40094e:	e8 8d fe ff ff       	call   4007e0 <exit@plt>
  400953:	83 7d dc 01          	cmpl   $0x1,-0x24(%rbp)
  400957:	7f 39                	jg     400992 <main+0x9c>
  400959:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  40095d:	48 8b 10             	mov    (%rax),%rdx
  400960:	48 8b 05 59 17 20 00 	mov    0x201759(%rip),%rax        # 6020c0 <stderr@GLIBC_2.2.5>
  400967:	b9 d3 0d 40 00       	mov    $0x400dd3,%ecx
  40096c:	be c6 0d 40 00       	mov    $0x400dc6,%esi
  400971:	48 89 c7             	mov    %rax,%rdi
  400974:	b8 00 00 00 00       	mov    $0x0,%eax
  400979:	e8 22 fe ff ff       	call   4007a0 <fprintf@plt>
  40097e:	bf 0a 00 00 00       	mov    $0xa,%edi
  400983:	e8 88 fd ff ff       	call   400710 <putchar@plt>
  400988:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  40098d:	e8 4e fe ff ff       	call   4007e0 <exit@plt>
  400992:	83 7d dc 02          	cmpl   $0x2,-0x24(%rbp)
  400996:	7e 39                	jle    4009d1 <main+0xdb>
  400998:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  40099c:	48 8b 10             	mov    (%rax),%rdx
  40099f:	48 8b 05 1a 17 20 00 	mov    0x20171a(%rip),%rax        # 6020c0 <stderr@GLIBC_2.2.5>
  4009a6:	b9 e4 0d 40 00       	mov    $0x400de4,%ecx
  4009ab:	be c6 0d 40 00       	mov    $0x400dc6,%esi
  4009b0:	48 89 c7             	mov    %rax,%rdi
  4009b3:	b8 00 00 00 00       	mov    $0x0,%eax
  4009b8:	e8 e3 fd ff ff       	call   4007a0 <fprintf@plt>
  4009bd:	bf 0a 00 00 00       	mov    $0xa,%edi
  4009c2:	e8 49 fd ff ff       	call   400710 <putchar@plt>
  4009c7:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  4009cc:	e8 0f fe ff ff       	call   4007e0 <exit@plt>
  4009d1:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  4009d5:	48 83 c0 08          	add    $0x8,%rax
  4009d9:	48 8b 00             	mov    (%rax),%rax
  4009dc:	be 02 00 00 00       	mov    $0x2,%esi
  4009e1:	48 89 c7             	mov    %rax,%rdi
  4009e4:	b8 00 00 00 00       	mov    $0x0,%eax
  4009e9:	e8 d2 fd ff ff       	call   4007c0 <open@plt>
  4009ee:	89 45 ec             	mov    %eax,-0x14(%rbp)
  4009f1:	83 7d ec ff          	cmpl   $0xffffffff,-0x14(%rbp)
  4009f5:	75 39                	jne    400a30 <main+0x13a>
  4009f7:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  4009fb:	48 8b 10             	mov    (%rax),%rdx
  4009fe:	48 8b 05 bb 16 20 00 	mov    0x2016bb(%rip),%rax        # 6020c0 <stderr@GLIBC_2.2.5>
  400a05:	b9 f8 0d 40 00       	mov    $0x400df8,%ecx
  400a0a:	be c6 0d 40 00       	mov    $0x400dc6,%esi
  400a0f:	48 89 c7             	mov    %rax,%rdi
  400a12:	b8 00 00 00 00       	mov    $0x0,%eax
  400a17:	e8 84 fd ff ff       	call   4007a0 <fprintf@plt>
  400a1c:	bf 0a 00 00 00       	mov    $0xa,%edi
  400a21:	e8 ea fc ff ff       	call   400710 <putchar@plt>
  400a26:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  400a2b:	e8 b0 fd ff ff       	call   4007e0 <exit@plt>
  400a30:	be 10 0e 40 00       	mov    $0x400e10,%esi
  400a35:	bf 3f 0e 40 00       	mov    $0x400e3f,%edi
  400a3a:	b8 00 00 00 00       	mov    $0x0,%eax
  400a3f:	e8 0c fd ff ff       	call   400750 <printf@plt>
  400a44:	48 8b 15 55 16 20 00 	mov    0x201655(%rip),%rdx        # 6020a0 <stdin@GLIBC_2.2.5>
  400a4b:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400a4f:	be 50 00 00 00       	mov    $0x50,%esi
  400a54:	48 89 c7             	mov    %rax,%rdi
  400a57:	e8 34 fd ff ff       	call   400790 <fgets@plt>
  400a5c:	48 85 c0             	test   %rax,%rax
  400a5f:	75 14                	jne    400a75 <main+0x17f>
  400a61:	bf 0a 00 00 00       	mov    $0xa,%edi
  400a66:	e8 a5 fc ff ff       	call   400710 <putchar@plt>
  400a6b:	bf 00 00 00 00       	mov    $0x0,%edi
  400a70:	e8 6b fd ff ff       	call   4007e0 <exit@plt>
  400a75:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400a79:	0f b6 00             	movzbl (%rax),%eax
  400a7c:	0f be c0             	movsbl %al,%eax
  400a7f:	83 f8 73             	cmp    $0x73,%eax
  400a82:	0f 84 9d 01 00 00    	je     400c25 <main+0x32f>
  400a88:	83 f8 77             	cmp    $0x77,%eax
  400a8b:	0f 84 d1 00 00 00    	je     400b62 <main+0x26c>
  400a91:	83 f8 72             	cmp    $0x72,%eax
  400a94:	0f 85 8f 02 00 00    	jne    400d29 <main+0x433>
  400a9a:	be 48 0e 40 00       	mov    $0x400e48,%esi
  400a9f:	bf 3f 0e 40 00       	mov    $0x400e3f,%edi
  400aa4:	b8 00 00 00 00       	mov    $0x0,%eax
  400aa9:	e8 a2 fc ff ff       	call   400750 <printf@plt>
  400aae:	48 8b 15 eb 15 20 00 	mov    0x2015eb(%rip),%rdx        # 6020a0 <stdin@GLIBC_2.2.5>
  400ab5:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400ab9:	be 50 00 00 00       	mov    $0x50,%esi
  400abe:	48 89 c7             	mov    %rax,%rdi
  400ac1:	e8 ca fc ff ff       	call   400790 <fgets@plt>
  400ac6:	48 85 c0             	test   %rax,%rax
  400ac9:	75 14                	jne    400adf <main+0x1e9>
  400acb:	bf 0a 00 00 00       	mov    $0xa,%edi
  400ad0:	e8 3b fc ff ff       	call   400710 <putchar@plt>
  400ad5:	bf 00 00 00 00       	mov    $0x0,%edi
  400ada:	e8 01 fd ff ff       	call   4007e0 <exit@plt>
  400adf:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400ae3:	48 89 c7             	mov    %rax,%rdi
  400ae6:	e8 e5 fc ff ff       	call   4007d0 <atoi@plt>
  400aeb:	48 63 d0             	movslq %eax,%rdx
  400aee:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  400af2:	8b 45 ec             	mov    -0x14(%rbp),%eax
  400af5:	48 89 ce             	mov    %rcx,%rsi
  400af8:	89 c7                	mov    %eax,%edi
  400afa:	e8 71 fc ff ff       	call   400770 <read@plt>
  400aff:	89 45 f0             	mov    %eax,-0x10(%rbp)
  400b02:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%rbp)
  400b06:	75 39                	jne    400b41 <main+0x24b>
  400b08:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  400b0c:	48 8b 10             	mov    (%rax),%rdx
  400b0f:	48 8b 05 aa 15 20 00 	mov    0x2015aa(%rip),%rax        # 6020c0 <stderr@GLIBC_2.2.5>
  400b16:	b9 75 0e 40 00       	mov    $0x400e75,%ecx
  400b1b:	be c6 0d 40 00       	mov    $0x400dc6,%esi
  400b20:	48 89 c7             	mov    %rax,%rdi
  400b23:	b8 00 00 00 00       	mov    $0x0,%eax
  400b28:	e8 73 fc ff ff       	call   4007a0 <fprintf@plt>
  400b2d:	bf 0a 00 00 00       	mov    $0xa,%edi
  400b32:	e8 d9 fb ff ff       	call   400710 <putchar@plt>
  400b37:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  400b3c:	e8 9f fc ff ff       	call   4007e0 <exit@plt>
  400b41:	8b 45 f0             	mov    -0x10(%rbp),%eax
  400b44:	48 63 d0             	movslq %eax,%rdx
  400b47:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400b4b:	48 01 d0             	add    %rdx,%rax
  400b4e:	c6 00 00             	movb   $0x0,(%rax)
  400b51:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400b55:	48 89 c7             	mov    %rax,%rdi
  400b58:	e8 c3 fb ff ff       	call   400720 <puts@plt>
  400b5d:	e9 c7 01 00 00       	jmp    400d29 <main+0x433>
  400b62:	be 88 0e 40 00       	mov    $0x400e88,%esi
  400b67:	bf 3f 0e 40 00       	mov    $0x400e3f,%edi
  400b6c:	b8 00 00 00 00       	mov    $0x0,%eax
  400b71:	e8 da fb ff ff       	call   400750 <printf@plt>
  400b76:	48 8b 15 23 15 20 00 	mov    0x201523(%rip),%rdx        # 6020a0 <stdin@GLIBC_2.2.5>
  400b7d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400b81:	be 50 00 00 00       	mov    $0x50,%esi
  400b86:	48 89 c7             	mov    %rax,%rdi
  400b89:	e8 02 fc ff ff       	call   400790 <fgets@plt>
  400b8e:	48 85 c0             	test   %rax,%rax
  400b91:	75 14                	jne    400ba7 <main+0x2b1>
  400b93:	bf 0a 00 00 00       	mov    $0xa,%edi
  400b98:	e8 73 fb ff ff       	call   400710 <putchar@plt>
  400b9d:	bf 00 00 00 00       	mov    $0x0,%edi
  400ba2:	e8 39 fc ff ff       	call   4007e0 <exit@plt>
  400ba7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400bab:	48 89 c7             	mov    %rax,%rdi
  400bae:	e8 8d fb ff ff       	call   400740 <strlen@plt>
  400bb3:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
  400bb7:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400bbb:	48 01 d0             	add    %rdx,%rax
  400bbe:	c6 00 00             	movb   $0x0,(%rax)
  400bc1:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400bc5:	48 89 c7             	mov    %rax,%rdi
  400bc8:	e8 73 fb ff ff       	call   400740 <strlen@plt>
  400bcd:	48 8d 50 01          	lea    0x1(%rax),%rdx
  400bd1:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  400bd5:	8b 45 ec             	mov    -0x14(%rbp),%eax
  400bd8:	48 89 ce             	mov    %rcx,%rsi
  400bdb:	89 c7                	mov    %eax,%edi
  400bdd:	e8 4e fb ff ff       	call   400730 <write@plt>
  400be2:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  400be6:	0f 85 36 01 00 00    	jne    400d22 <main+0x42c>
  400bec:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  400bf0:	48 8b 10             	mov    (%rax),%rdx
  400bf3:	48 8b 05 c6 14 20 00 	mov    0x2014c6(%rip),%rax        # 6020c0 <stderr@GLIBC_2.2.5>
  400bfa:	b9 ab 0e 40 00       	mov    $0x400eab,%ecx
  400bff:	be c6 0d 40 00       	mov    $0x400dc6,%esi
  400c04:	48 89 c7             	mov    %rax,%rdi
  400c07:	b8 00 00 00 00       	mov    $0x0,%eax
  400c0c:	e8 8f fb ff ff       	call   4007a0 <fprintf@plt>
  400c11:	bf 0a 00 00 00       	mov    $0xa,%edi
  400c16:	e8 f5 fa ff ff       	call   400710 <putchar@plt>
  400c1b:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  400c20:	e8 bb fb ff ff       	call   4007e0 <exit@plt>
  400c25:	be b8 0e 40 00       	mov    $0x400eb8,%esi
  400c2a:	bf 3f 0e 40 00       	mov    $0x400e3f,%edi
  400c2f:	b8 00 00 00 00       	mov    $0x0,%eax
  400c34:	e8 17 fb ff ff       	call   400750 <printf@plt>
  400c39:	48 8b 15 60 14 20 00 	mov    0x201460(%rip),%rdx        # 6020a0 <stdin@GLIBC_2.2.5>
  400c40:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400c44:	be 50 00 00 00       	mov    $0x50,%esi
  400c49:	48 89 c7             	mov    %rax,%rdi
  400c4c:	e8 3f fb ff ff       	call   400790 <fgets@plt>
  400c51:	48 85 c0             	test   %rax,%rax
  400c54:	75 14                	jne    400c6a <main+0x374>
  400c56:	bf 0a 00 00 00       	mov    $0xa,%edi
  400c5b:	e8 b0 fa ff ff       	call   400710 <putchar@plt>
  400c60:	bf 00 00 00 00       	mov    $0x0,%edi
  400c65:	e8 76 fb ff ff       	call   4007e0 <exit@plt>
  400c6a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400c6e:	48 89 c7             	mov    %rax,%rdi
  400c71:	e8 5a fb ff ff       	call   4007d0 <atoi@plt>
  400c76:	89 45 f0             	mov    %eax,-0x10(%rbp)
  400c79:	be d0 0e 40 00       	mov    $0x400ed0,%esi
  400c7e:	bf 3f 0e 40 00       	mov    $0x400e3f,%edi
  400c83:	b8 00 00 00 00       	mov    $0x0,%eax
  400c88:	e8 c3 fa ff ff       	call   400750 <printf@plt>
  400c8d:	48 8b 15 0c 14 20 00 	mov    0x20140c(%rip),%rdx        # 6020a0 <stdin@GLIBC_2.2.5>
  400c94:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400c98:	be 50 00 00 00       	mov    $0x50,%esi
  400c9d:	48 89 c7             	mov    %rax,%rdi
  400ca0:	e8 eb fa ff ff       	call   400790 <fgets@plt>
  400ca5:	48 85 c0             	test   %rax,%rax
  400ca8:	75 14                	jne    400cbe <main+0x3c8>
  400caa:	bf 0a 00 00 00       	mov    $0xa,%edi
  400caf:	e8 5c fa ff ff       	call   400710 <putchar@plt>
  400cb4:	bf 00 00 00 00       	mov    $0x0,%edi
  400cb9:	e8 22 fb ff ff       	call   4007e0 <exit@plt>
  400cbe:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  400cc2:	48 89 c7             	mov    %rax,%rdi
  400cc5:	e8 06 fb ff ff       	call   4007d0 <atoi@plt>
  400cca:	89 45 f4             	mov    %eax,-0xc(%rbp)
  400ccd:	8b 45 f0             	mov    -0x10(%rbp),%eax
  400cd0:	48 63 c8             	movslq %eax,%rcx
  400cd3:	8b 55 f4             	mov    -0xc(%rbp),%edx
  400cd6:	8b 45 ec             	mov    -0x14(%rbp),%eax
  400cd9:	48 89 ce             	mov    %rcx,%rsi
  400cdc:	89 c7                	mov    %eax,%edi
  400cde:	e8 7d fa ff ff       	call   400760 <lseek@plt>
  400ce3:	48 83 f8 ff          	cmp    $0xffffffffffffffff,%rax
  400ce7:	75 3f                	jne    400d28 <main+0x432>
  400ce9:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  400ced:	48 8b 10             	mov    (%rax),%rdx
  400cf0:	48 8b 05 c9 13 20 00 	mov    0x2013c9(%rip),%rax        # 6020c0 <stderr@GLIBC_2.2.5>
  400cf7:	b9 eb 0e 40 00       	mov    $0x400eeb,%ecx
  400cfc:	be c6 0d 40 00       	mov    $0x400dc6,%esi
  400d01:	48 89 c7             	mov    %rax,%rdi
  400d04:	b8 00 00 00 00       	mov    $0x0,%eax
  400d09:	e8 92 fa ff ff       	call   4007a0 <fprintf@plt>
  400d0e:	bf 0a 00 00 00       	mov    $0xa,%edi
  400d13:	e8 f8 f9 ff ff       	call   400710 <putchar@plt>
  400d18:	bf ff ff ff ff       	mov    $0xffffffff,%edi
  400d1d:	e8 be fa ff ff       	call   4007e0 <exit@plt>
  400d22:	90                   	nop
  400d23:	e9 08 fd ff ff       	jmp    400a30 <main+0x13a>
  400d28:	90                   	nop
  400d29:	e9 02 fd ff ff       	jmp    400a30 <main+0x13a>
  400d2e:	66 90                	xchg   %ax,%ax

0000000000400d30 <__libc_csu_init>:
  400d30:	41 57                	push   %r15
  400d32:	41 56                	push   %r14
  400d34:	41 89 ff             	mov    %edi,%r15d
  400d37:	41 55                	push   %r13
  400d39:	41 54                	push   %r12
  400d3b:	4c 8d 25 ce 10 20 00 	lea    0x2010ce(%rip),%r12        # 601e10 <__frame_dummy_init_array_entry>
  400d42:	55                   	push   %rbp
  400d43:	48 8d 2d ce 10 20 00 	lea    0x2010ce(%rip),%rbp        # 601e18 <__do_global_dtors_aux_fini_array_entry>
  400d4a:	53                   	push   %rbx
  400d4b:	49 89 f6             	mov    %rsi,%r14
  400d4e:	49 89 d5             	mov    %rdx,%r13
  400d51:	4c 29 e5             	sub    %r12,%rbp
  400d54:	48 83 ec 08          	sub    $0x8,%rsp
  400d58:	48 c1 fd 03          	sar    $0x3,%rbp
  400d5c:	e8 7f f9 ff ff       	call   4006e0 <_init>
  400d61:	48 85 ed             	test   %rbp,%rbp
  400d64:	74 20                	je     400d86 <__libc_csu_init+0x56>
  400d66:	31 db                	xor    %ebx,%ebx
  400d68:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  400d6f:	00 
  400d70:	4c 89 ea             	mov    %r13,%rdx
  400d73:	4c 89 f6             	mov    %r14,%rsi
  400d76:	44 89 ff             	mov    %r15d,%edi
  400d79:	41 ff 14 dc          	call   *(%r12,%rbx,8)
  400d7d:	48 83 c3 01          	add    $0x1,%rbx
  400d81:	48 39 eb             	cmp    %rbp,%rbx
  400d84:	75 ea                	jne    400d70 <__libc_csu_init+0x40>
  400d86:	48 83 c4 08          	add    $0x8,%rsp
  400d8a:	5b                   	pop    %rbx
  400d8b:	5d                   	pop    %rbp
  400d8c:	41 5c                	pop    %r12
  400d8e:	41 5d                	pop    %r13
  400d90:	41 5e                	pop    %r14
  400d92:	41 5f                	pop    %r15
  400d94:	c3                   	ret
  400d95:	90                   	nop
  400d96:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  400d9d:	00 00 00 

0000000000400da0 <__libc_csu_fini>:
  400da0:	f3 c3                	repz ret

Disassembly of section .fini:

0000000000400da4 <_fini>:
  400da4:	48 83 ec 08          	sub    $0x8,%rsp
  400da8:	48 83 c4 08          	add    $0x8,%rsp
  400dac:	c3                   	ret
