	.file	"macro_offset.c"
	.text
.Ltext0:
	.globl	add
	.type	add, @function
add:
.LFB0:
	.file 1 "macro_offset.c"
	.loc 1 14 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	.loc 1 16 0
	movl	c.1825, %eax
	addl	$1, %eax
	movl	%eax, c.1825
	.loc 1 18 0
	movl	d.1826, %eax
	addl	$1, %eax
	movl	%eax, d.1826
	.loc 1 19 0
	movl	12(%ebp), %eax
	movl	8(%ebp), %edx
	addl	%edx, %eax
	.loc 1 20 0
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	add, .-add
	.section	.rodata
.LC0:
	.string	"add=%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.loc 1 22 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$32, %esp
	.loc 1 23 0
	movl	$0, 28(%esp)
	.loc 1 24 0
	movl	$0, 28(%esp)
	jmp	.L4
.L5:
	.loc 1 25 0 discriminator 2
	movl	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$0, (%esp)
	call	add
	movl	%eax, 4(%esp)
	movl	$.LC0, (%esp)
	call	printf
	.loc 1 24 0 discriminator 2
	addl	$1, 28(%esp)
.L4:
	.loc 1 24 0 is_stmt 0 discriminator 1
	cmpl	$2, 28(%esp)
	jle	.L5
	.loc 1 26 0 is_stmt 1
	movl	$0, %eax
	.loc 1 27 0
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.local	c.1825
	.comm	c.1825,4,4
	.local	d.1826
	.comm	d.1826,4,4
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0xef
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF12
	.byte	0x1
	.long	.LASF13
	.long	.LASF14
	.long	.Ltext0
	.long	.Letext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF2
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF7
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF8
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF9
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF10
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF11
	.uleb128 0x4
	.string	"add"
	.byte	0x1
	.byte	0xd
	.long	0x4f
	.long	.LFB0
	.long	.LFE0
	.uleb128 0x1
	.byte	0x9c
	.long	0xd0
	.uleb128 0x5
	.string	"a"
	.byte	0x1
	.byte	0xd
	.long	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x5
	.string	"b"
	.byte	0x1
	.byte	0xd
	.long	0x4f
	.uleb128 0x2
	.byte	0x91
	.sleb128 4
	.uleb128 0x6
	.string	"c"
	.byte	0x1
	.byte	0xf
	.long	0x4f
	.uleb128 0x5
	.byte	0x3
	.long	c.1825
	.uleb128 0x6
	.string	"d"
	.byte	0x1
	.byte	0x11
	.long	0x4f
	.uleb128 0x5
	.byte	0x3
	.long	d.1826
	.byte	0
	.uleb128 0x7
	.long	.LASF15
	.byte	0x1
	.byte	0x15
	.long	0x4f
	.long	.LFB1
	.long	.LFE1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.string	"i"
	.byte	0x1
	.byte	0x17
	.long	0x4f
	.uleb128 0x2
	.byte	0x74
	.sleb128 28
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x1c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF6:
	.string	"long long int"
.LASF2:
	.string	"short unsigned int"
.LASF0:
	.string	"unsigned int"
.LASF4:
	.string	"signed char"
.LASF3:
	.string	"long unsigned int"
.LASF7:
	.string	"long long unsigned int"
.LASF10:
	.string	"char"
.LASF13:
	.string	"macro_offset.c"
.LASF1:
	.string	"unsigned char"
.LASF15:
	.string	"main"
.LASF8:
	.string	"long int"
.LASF14:
	.string	"/usr/src"
.LASF11:
	.string	"float"
.LASF5:
	.string	"short int"
.LASF12:
	.string	"GNU C 4.7.2 20121109 (Red Hat 4.7.2-8) -mtune=generic -march=i686 -g"
.LASF9:
	.string	"sizetype"
	.ident	"GCC: (GNU) 4.7.2 20121109 (Red Hat 4.7.2-8)"
	.section	.note.GNU-stack,"",@progbits