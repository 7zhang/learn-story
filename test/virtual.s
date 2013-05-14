	.file	"virtual.c"
	.text
.Ltext0:
	.section	.rodata
.LC0:
	.string	"fun"
	.section	.text._ZN1A3funEv,"axG",@progbits,_ZN1A3funEv,comdat
	.align 2
	.weak	_ZN1A3funEv
	.type	_ZN1A3funEv, @function
_ZN1A3funEv:
.LFB0:
	.file 1 "virtual.c"
	.loc 1 6 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 6 0
	movl	$.LC0, (%esp)
	call	puts
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	_ZN1A3funEv, .-_ZN1A3funEv
	.section	.rodata
.LC1:
	.string	"fun1"
	.section	.text._ZN1A4fun1Ev,"axG",@progbits,_ZN1A4fun1Ev,comdat
	.align 2
	.weak	_ZN1A4fun1Ev
	.type	_ZN1A4fun1Ev, @function
_ZN1A4fun1Ev:
.LFB1:
	.loc 1 7 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 7 0
	movl	$.LC1, (%esp)
	call	puts
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	_ZN1A4fun1Ev, .-_ZN1A4fun1Ev
	.section	.rodata
.LC2:
	.string	"fun B"
	.section	.text._ZN1B3funEv,"axG",@progbits,_ZN1B3funEv,comdat
	.align 2
	.weak	_ZN1B3funEv
	.type	_ZN1B3funEv, @function
_ZN1B3funEv:
.LFB2:
	.loc 1 14 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
	.loc 1 14 0
	movl	$.LC2, (%esp)
	call	puts
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE2:
	.size	_ZN1B3funEv, .-_ZN1B3funEv
	.section	.text._ZN1AC2Ev,"axG",@progbits,_ZN1AC5Ev,comdat
	.align 2
	.weak	_ZN1AC2Ev
	.type	_ZN1AC2Ev, @function
_ZN1AC2Ev:
.LFB5:
	.loc 1 3 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
.LBB2:
	.loc 1 3 0
	movl	8(%ebp), %eax
	movl	$_ZTV1A+8, (%eax)
.LBE2:
	popl	%ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE5:
	.size	_ZN1AC2Ev, .-_ZN1AC2Ev
	.weak	_ZN1AC1Ev
	.set	_ZN1AC1Ev,_ZN1AC2Ev
	.section	.text._ZN1BC2Ev,"axG",@progbits,_ZN1BC5Ev,comdat
	.align 2
	.weak	_ZN1BC2Ev
	.type	_ZN1BC2Ev, @function
_ZN1BC2Ev:
.LFB9:
	.loc 1 11 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
.LBB3:
	.loc 1 11 0
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_ZN1AC2Ev
	movl	8(%ebp), %eax
	movl	$_ZTV1B+8, (%eax)
.LBE3:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE9:
	.size	_ZN1BC2Ev, .-_ZN1BC2Ev
	.weak	_ZN1BC1Ev
	.set	_ZN1BC1Ev,_ZN1BC2Ev
	.section	.text._ZN1CC2Ev,"axG",@progbits,_ZN1CC5Ev,comdat
	.align 2
	.weak	_ZN1CC2Ev
	.type	_ZN1CC2Ev, @function
_ZN1CC2Ev:
.LFB11:
	.loc 1 16 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	subl	$24, %esp
.LBB4:
	.loc 1 16 0
	movl	8(%ebp), %eax
	movl	%eax, (%esp)
	call	_ZN1BC2Ev
	movl	8(%ebp), %eax
	movl	$_ZTV1C+8, (%eax)
.LBE4:
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE11:
	.size	_ZN1CC2Ev, .-_ZN1CC2Ev
	.weak	_ZN1CC1Ev
	.set	_ZN1CC1Ev,_ZN1CC2Ev
	.text
	.globl	main
	.type	main, @function
main:
.LFB3:
	.loc 1 25 0
	.cfi_startproc
	pushl	%ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	movl	%esp, %ebp
	.cfi_def_cfa_register 5
	andl	$-16, %esp
	subl	$48, %esp
.LBB5:
	.loc 1 26 0
	leal	36(%esp), %eax
	movl	%eax, (%esp)
	call	_ZN1AC1Ev
	.loc 1 27 0
	leal	20(%esp), %eax
	movl	%eax, (%esp)
	call	_ZN1CC1Ev
.LBE5:
	.loc 1 28 0
	movl	$0, %eax
	leave
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE3:
	.size	main, .-main
	.weak	_ZTV1C
	.section	.rodata._ZTV1C,"aG",@progbits,_ZTV1C,comdat
	.align 8
	.type	_ZTV1C, @object
	.size	_ZTV1C, 16
_ZTV1C:
	.long	0
	.long	_ZTI1C
	.long	_ZN1B3funEv
	.long	_ZN1A4fun1Ev
	.weak	_ZTV1B
	.section	.rodata._ZTV1B,"aG",@progbits,_ZTV1B,comdat
	.align 8
	.type	_ZTV1B, @object
	.size	_ZTV1B, 16
_ZTV1B:
	.long	0
	.long	_ZTI1B
	.long	_ZN1B3funEv
	.long	_ZN1A4fun1Ev
	.weak	_ZTV1A
	.section	.rodata._ZTV1A,"aG",@progbits,_ZTV1A,comdat
	.align 8
	.type	_ZTV1A, @object
	.size	_ZTV1A, 16
_ZTV1A:
	.long	0
	.long	_ZTI1A
	.long	_ZN1A3funEv
	.long	_ZN1A4fun1Ev
	.weak	_ZTS1C
	.section	.rodata._ZTS1C,"aG",@progbits,_ZTS1C,comdat
	.type	_ZTS1C, @object
	.size	_ZTS1C, 3
_ZTS1C:
	.string	"1C"
	.weak	_ZTI1C
	.section	.rodata._ZTI1C,"aG",@progbits,_ZTI1C,comdat
	.align 4
	.type	_ZTI1C, @object
	.size	_ZTI1C, 12
_ZTI1C:
	.long	_ZTVN10__cxxabiv120__si_class_type_infoE+8
	.long	_ZTS1C
	.long	_ZTI1B
	.weak	_ZTS1B
	.section	.rodata._ZTS1B,"aG",@progbits,_ZTS1B,comdat
	.type	_ZTS1B, @object
	.size	_ZTS1B, 3
_ZTS1B:
	.string	"1B"
	.weak	_ZTI1B
	.section	.rodata._ZTI1B,"aG",@progbits,_ZTI1B,comdat
	.align 4
	.type	_ZTI1B, @object
	.size	_ZTI1B, 12
_ZTI1B:
	.long	_ZTVN10__cxxabiv120__si_class_type_infoE+8
	.long	_ZTS1B
	.long	_ZTI1A
	.weak	_ZTS1A
	.section	.rodata._ZTS1A,"aG",@progbits,_ZTS1A,comdat
	.type	_ZTS1A, @object
	.size	_ZTS1A, 3
_ZTS1A:
	.string	"1A"
	.weak	_ZTI1A
	.section	.rodata._ZTI1A,"aG",@progbits,_ZTI1A,comdat
	.align 4
	.type	_ZTI1A, @object
	.size	_ZTI1A, 8
_ZTI1A:
	.long	_ZTVN10__cxxabiv117__class_type_infoE+8
	.long	_ZTS1A
	.text
.Letext0:
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x36d
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF16
	.byte	0x4
	.long	.LASF17
	.long	.LASF18
	.long	.Ldebug_ranges0+0
	.long	0
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
	.uleb128 0x4
	.string	"C"
	.byte	0x10
	.byte	0x1
	.byte	0x10
	.long	0x12d
	.long	0xbf
	.uleb128 0x5
	.long	0xbf
	.byte	0
	.byte	0x1
	.uleb128 0x6
	.string	"k"
	.byte	0x1
	.byte	0x13
	.long	0x4f
	.byte	0xc
	.byte	0x1
	.uleb128 0x7
	.string	"C"
	.byte	0x1
	.long	0xa5
	.long	0xb0
	.uleb128 0x8
	.long	0x11c
	.uleb128 0x9
	.long	0x122
	.byte	0
	.uleb128 0xa
	.string	"C"
	.byte	0x1
	.long	0xb8
	.uleb128 0x8
	.long	0x11c
	.byte	0
	.byte	0
	.uleb128 0x4
	.string	"B"
	.byte	0xc
	.byte	0x1
	.byte	0xb
	.long	0x12d
	.long	0x11c
	.uleb128 0x5
	.long	0x12d
	.byte	0
	.byte	0x1
	.uleb128 0x7
	.string	"B"
	.byte	0x1
	.long	0xe0
	.long	0xeb
	.uleb128 0x8
	.long	0x1c6
	.uleb128 0x9
	.long	0x1cc
	.byte	0
	.uleb128 0x7
	.string	"B"
	.byte	0x1
	.long	0xf7
	.long	0xfd
	.uleb128 0x8
	.long	0x1c6
	.byte	0
	.uleb128 0xb
	.string	"fun"
	.byte	0x1
	.byte	0xe
	.long	.LASF19
	.byte	0x1
	.uleb128 0x2
	.byte	0x10
	.uleb128 0
	.long	0xbf
	.byte	0x1
	.long	0x115
	.uleb128 0x8
	.long	0x1c6
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.long	0x79
	.uleb128 0xd
	.byte	0x4
	.long	0x128
	.uleb128 0xe
	.long	0x79
	.uleb128 0x4
	.string	"A"
	.byte	0xc
	.byte	0x1
	.byte	0x3
	.long	0x12d
	.long	0x1c6
	.uleb128 0xf
	.long	.LASF20
	.long	0x1e2
	.byte	0
	.byte	0x1
	.uleb128 0x6
	.string	"i"
	.byte	0x1
	.byte	0x8
	.long	0x4f
	.byte	0x4
	.byte	0x1
	.uleb128 0x6
	.string	"j"
	.byte	0x1
	.byte	0x9
	.long	0x4f
	.byte	0x8
	.byte	0x1
	.uleb128 0x7
	.string	"A"
	.byte	0x1
	.long	0x168
	.long	0x173
	.uleb128 0x8
	.long	0x1f2
	.uleb128 0x9
	.long	0x1f8
	.byte	0
	.uleb128 0x7
	.string	"A"
	.byte	0x1
	.long	0x17f
	.long	0x185
	.uleb128 0x8
	.long	0x1f2
	.byte	0
	.uleb128 0x10
	.string	"fun"
	.byte	0x1
	.byte	0x6
	.long	.LASF21
	.byte	0x1
	.uleb128 0x2
	.byte	0x10
	.uleb128 0
	.long	0x12d
	.byte	0x1
	.long	0x1a1
	.long	0x1a7
	.uleb128 0x8
	.long	0x1f2
	.byte	0
	.uleb128 0x11
	.long	.LASF11
	.byte	0x1
	.byte	0x7
	.long	.LASF22
	.byte	0x1
	.uleb128 0x2
	.byte	0x10
	.uleb128 0x1
	.long	0x12d
	.byte	0x1
	.long	0x1bf
	.uleb128 0x8
	.long	0x1f2
	.byte	0
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.long	0xbf
	.uleb128 0xd
	.byte	0x4
	.long	0x1d2
	.uleb128 0xe
	.long	0xbf
	.uleb128 0x12
	.long	0x4f
	.long	0x1e2
	.uleb128 0x13
	.byte	0
	.uleb128 0xc
	.byte	0x4
	.long	0x1e8
	.uleb128 0x14
	.byte	0x4
	.long	.LASF23
	.long	0x1d7
	.uleb128 0xc
	.byte	0x4
	.long	0x12d
	.uleb128 0xd
	.byte	0x4
	.long	0x1fe
	.uleb128 0xe
	.long	0x12d
	.uleb128 0x15
	.long	0x185
	.long	.LFB0
	.long	.LFE0
	.uleb128 0x1
	.byte	0x9c
	.long	0x21a
	.long	0x227
	.uleb128 0x16
	.long	.LASF12
	.long	0x227
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0xe
	.long	0x1f2
	.uleb128 0x15
	.long	0x1a7
	.long	.LFB1
	.long	.LFE1
	.uleb128 0x1
	.byte	0x9c
	.long	0x243
	.long	0x250
	.uleb128 0x16
	.long	.LASF12
	.long	0x227
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x15
	.long	0xfd
	.long	.LFB2
	.long	.LFE2
	.uleb128 0x1
	.byte	0x9c
	.long	0x267
	.long	0x274
	.uleb128 0x16
	.long	.LASF12
	.long	0x274
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0xe
	.long	0x1c6
	.uleb128 0x17
	.long	0x173
	.byte	0x1
	.byte	0x3
	.byte	0x2
	.long	0x289
	.long	0x293
	.uleb128 0x18
	.long	.LASF12
	.long	0x227
	.byte	0
	.uleb128 0x19
	.long	0x279
	.long	.LASF13
	.long	.LFB5
	.long	.LFE5
	.uleb128 0x1
	.byte	0x9c
	.long	0x2ae
	.long	0x2b7
	.uleb128 0x1a
	.long	0x289
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x17
	.long	0xeb
	.byte	0x1
	.byte	0xb
	.byte	0x2
	.long	0x2c7
	.long	0x2d1
	.uleb128 0x18
	.long	.LASF12
	.long	0x274
	.byte	0
	.uleb128 0x1b
	.long	0x2b7
	.long	.LASF14
	.long	.LFB9
	.long	.LFE9
	.uleb128 0x1
	.byte	0x9c
	.long	0x2ec
	.long	0x2f5
	.uleb128 0x1a
	.long	0x2c7
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x17
	.long	0xb0
	.byte	0x1
	.byte	0x10
	.byte	0x2
	.long	0x305
	.long	0x30f
	.uleb128 0x18
	.long	.LASF12
	.long	0x30f
	.byte	0
	.uleb128 0xe
	.long	0x11c
	.uleb128 0x1b
	.long	0x2f5
	.long	.LASF15
	.long	.LFB11
	.long	.LFE11
	.uleb128 0x1
	.byte	0x9c
	.long	0x32f
	.long	0x338
	.uleb128 0x1a
	.long	0x305
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.byte	0
	.uleb128 0x1c
	.long	.LASF24
	.byte	0x1
	.byte	0x18
	.long	0x4f
	.long	.LFB3
	.long	.LFE3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1d
	.long	.LBB5
	.long	.LBE5
	.uleb128 0x1e
	.string	"a"
	.byte	0x1
	.byte	0x1a
	.long	0x12d
	.uleb128 0x2
	.byte	0x74
	.sleb128 36
	.uleb128 0x1e
	.string	"c"
	.byte	0x1
	.byte	0x1b
	.long	0x79
	.uleb128 0x2
	.byte	0x74
	.sleb128 20
	.byte	0
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
	.uleb128 0x55
	.uleb128 0x17
	.uleb128 0x11
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
	.uleb128 0x2
	.byte	0x1
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1d
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x1c
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.uleb128 0x32
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.uleb128 0x32
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
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
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x4c
	.uleb128 0xb
	.uleb128 0x4d
	.uleb128 0x18
	.uleb128 0x1d
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x32
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x10
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
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x4c
	.uleb128 0xb
	.uleb128 0x4d
	.uleb128 0x18
	.uleb128 0x1d
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x4c
	.uleb128 0xb
	.uleb128 0x4d
	.uleb128 0x18
	.uleb128 0x1d
	.uleb128 0x13
	.uleb128 0x32
	.uleb128 0xb
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x64
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x15
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x47
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x64
	.uleb128 0x13
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
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
	.uleb128 0x1d
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x1e
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
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x4c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.value	0
	.value	0
	.long	.Ltext0
	.long	.Letext0-.Ltext0
	.long	.LFB0
	.long	.LFE0-.LFB0
	.long	.LFB1
	.long	.LFE1-.LFB1
	.long	.LFB2
	.long	.LFE2-.LFB2
	.long	.LFB5
	.long	.LFE5-.LFB5
	.long	.LFB9
	.long	.LFE9-.LFB9
	.long	.LFB11
	.long	.LFE11-.LFB11
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.Ltext0
	.long	.Letext0
	.long	.LFB0
	.long	.LFE0
	.long	.LFB1
	.long	.LFE1
	.long	.LFB2
	.long	.LFE2
	.long	.LFB5
	.long	.LFE5
	.long	.LFB9
	.long	.LFE9
	.long	.LFB11
	.long	.LFE11
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF14:
	.string	"_ZN1BC2Ev"
.LASF5:
	.string	"short int"
.LASF9:
	.string	"sizetype"
.LASF11:
	.string	"fun1"
.LASF24:
	.string	"main"
.LASF6:
	.string	"long long int"
.LASF17:
	.string	"virtual.c"
.LASF8:
	.string	"long int"
.LASF15:
	.string	"_ZN1CC2Ev"
.LASF21:
	.string	"_ZN1A3funEv"
.LASF1:
	.string	"unsigned char"
.LASF4:
	.string	"signed char"
.LASF7:
	.string	"long long unsigned int"
.LASF22:
	.string	"_ZN1A4fun1Ev"
.LASF0:
	.string	"unsigned int"
.LASF2:
	.string	"short unsigned int"
.LASF10:
	.string	"char"
.LASF16:
	.string	"GNU C++ 4.7.2 20121109 (Red Hat 4.7.2-8) -mtune=generic -march=i686 -g"
.LASF12:
	.string	"this"
.LASF18:
	.string	"/usr/src"
.LASF13:
	.string	"_ZN1AC2Ev"
.LASF3:
	.string	"long unsigned int"
.LASF23:
	.string	"__vtbl_ptr_type"
.LASF20:
	.string	"_vptr.A"
.LASF19:
	.string	"_ZN1B3funEv"
	.ident	"GCC: (GNU) 4.7.2 20121109 (Red Hat 4.7.2-8)"
	.section	.note.GNU-stack,"",@progbits
