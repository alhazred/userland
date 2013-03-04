!
! This file was generated by a compiler that is currently not part of the CBE
! (as the CBE compiler does not generate code for the T4 architecture), and
! then it was modified by hand to remove some unnecessary instructions that
! the compiler generated and the main loop's branches was rearranged for
! fewer taken branches on the most frequent code path. These modifications 
! were made in 7 steps. In each step, a few lines were removed from and added
! to the compiler generated code to produce an equivalent binary. The lines
! that were removed in step <i> are marked by "!<i>" at the beginning of the
! line, the lines added in this step are marked by the same added at the end of
! the line. In other words, let C_i mean the code, after step <i> (C_0 is
! the original, compiler generated code, C_7 is the code in this file)
! To reproduce C_i (0 <= i < 7) first take C_<i+1>, remove the lines that
! end in !<i+1>, and then remove the !<i+1> string from the beginning of those
! lines that start with it. Comparing C_i and C_<i+1> is a simple task, as
! only a few lines have changed.
!  If a compiler (e.g. the Oracle Studio 12.3) becomes part of the CBE and
! it will be able to generate as efficient code as in this file the 
! longest_match.o file can simply be comp[iled from longest_match.c .
!

	.section	".text",#alloc,#execinstr,#progbits
	.file	"deflate-t4.c"

	.section	".bss",#alloc,#write,#nobits

Bbss.bss:

	.section	".data",#alloc,#write,#progbits

Ddata.data:

	.section	".rodata",#alloc,#progbits
!
! CONSTANT POOL
!

Drodata.rodata:

	.section	".picdata",#alloc,#write

Dpicdata.picdata:

	.section	".tbss",#alloc,#write,#tls,#nobits

Ttbss.bss:

	.section	".tdata",#alloc,#write,#tls,#progbits

Ttdata.data:

	.section	".rodata1",#alloc,#progbits
	.align	8
!
! CONSTANT POOL
!

.L95:
	.ascii	"invalid distance too far back\000"
	.align	8
!
! CONSTANT POOL
!

.L147:
	.ascii	"invalid distance code\000"
	.align	8
!
! CONSTANT POOL
!

.L153:
	.ascii	"invalid literal/length code\000"

	.section	".text",#alloc,#execinstr,#progbits
/* 000000	   0 */		.align	4
! FILE deflate-t4.c

!    1		      !#include <sun_prefetch.h>
!    2		      !#include "deflate.h"
!    3		      !#define NIL 0
!    5		      !uInt longest_match(s, cur_match)
!    6		      !    deflate_state *s;
!    7		      !    IPos cur_match;                             /* current match */
!    8		      !{

!
! SUBROUTINE longest_match
!
! OFFSET    SOURCE LINE	LABEL	INSTRUCTION

                       	.global longest_match
                       

			longest_match:

			.L900000112:
	save      %sp, -0xb0, %sp
	 ld        [%i0 + 0x4c], %l4	!7
	 ldn       [%i0 + 0x60], %l5	!7
	 and       %i1, %l4, %l2	!7
	 prefetch [%l5 + %l2], #n_reads	!7
!7	ld        [%i0 + 0x9c], %l4
	 ld        [%i0 + 0x9c], %l1	!7
	ld        [%i0 + 0x44], %l6
	clr       %g4
	ldn       [%i0 + 0x50], %g1
	ld        [%i0 + 0xa8], %i2
	ld        [%i0 + 0xac], %g5
	ld        [%i0 + 0xc0], %o0
!5	srl       %l4, 0x0, %l5
	ld        [%i0 + 0xbc], %l7
	add       %l6, -0x106, %i3
!5	add       %g1, %l5, %i4
!7	 add       %g1, %l4, %i4	!5
	 add       %g1, %l1, %i4	!7
!7	cwbleu    %l4, %i3, lm_0x38
	 cwbleu    %l1, %i3, lm_0x38	!7
!7	sub       %l4, %i3, %g4
	 sub       %l1, %i3, %g4	!7
		
lm_0x38:
!7	ld        [%i0 + 0x4c], %l4
!4	add       %i2, -0x1, %l3
!7	ldn       [%i0 + 0x60], %l5
!4	sra       %l3, 0x0, %o2
	 add       %i2, -0x1, %o2	!4
	ldub      [%i4 + %o2], %o2
!3	sra       %i2, 0x0, %l6
!3	ldub      [%i4 + %l6], %o1
	 ldub      [%i4 + %i2], %o1	!3
	cmp       %i2, %l7
	add       %i4, 0x102, %l7
	ld        [%i0 + 0xa4], %i3
	bcs,pn    %icc, lm_0x6c
	mov       0x102, %l3

	srl       %g5, 0x2, %g5
		
lm_0x6c:
	cmp       %o0, %i3
!6	srl       %i1, 0x0, %l0
!7	 and       %i1, %l4, %l2	!6
	movgu     %icc, %i3, %o0
		
lm_0x78:
!6	and       %i1, %l4, %l2
!6	add       %l0, %g1, %o3
	 add       %i1, %g1, %o3	!6
!3	ldub      [%o3 + %l6], %o5
	 ldub      [%o3 + %i2], %o5		!3
!1	srl       %l2, 0x0, %o4
!1	sllx      %o4, 0x1, %l2
	 sllx	  %l2, 0x1, %l2			!1
	 add       %l2, %l5, %l1		!1
	 prefetch  [%l1 - 0x40], #n_reads	!1
	cwbe     %o5, %o1, lm_0x17c_neg

lm_0x17c:
	lduh      [%l5 + %l2], %i1
	cwbleu    %i1, %g4, lm_0x190

	addcc     %g5, -0x1, %g5
	bne,pt    %icc, lm_0x78
!6	srl       %i1, 0x0, %l0
	 and       %i1, %l4, %l2	!6
		
lm_0x190:
	cmp       %i2, %i3
	movgu     %icc, %i3, %i2
	return    %i7 + 0x8
	srl       %o2, 0x0, %o0

lm_0x17c_neg:
!3	add       %o3, %l6, %o7
	 add       %o3, %i2, %o7		!3
	ldub      [%o7 - 0x1], %l1
	cwbne     %l1, %o2, lm_0x17c

!6	ldub      [%g1 + %l0], %i5
	 ldub      [%g1 + %i1], %i5	!6
	ldub      [%i4], %o5
	cwbne     %i5, %o5, lm_0x17c

	ldub      [%i4 + 0x1], %l1
	ldub      [%o3 + 0x1], %o4
	cwbne     %o4, %l1, lm_0x17c

	add       %o3, 0x2, %o3
!1	add       %l2, %l5, %l1
	add       %i4, 0x2, %o4

lm_0xc0:
	ldub      [%o4 + 0x1], %l0
	add       %o4, 0x1, %o4
	ldub      [%o3 + 0x1], %o7
	cwbne     %l0, %o7, lm_0x14c

	ldub      [%o4 + 0x1], %i5
	add       %o4, 0x1, %o4
	ldub      [%o3 + 0x2], %o5
	cwbne     %i5, %o5, lm_0x14c

	ldub      [%o4 + 0x1], %l0
	add       %o4, 0x1, %o4
	ldub      [%o3 + 0x3], %o7
	cwbne     %l0, %o7, lm_0x14c

	ldub      [%o4 + 0x1], %i5
	add       %o4, 0x1, %o4
	ldub      [%o3 + 0x4], %o5
	cwbne     %i5, %o5, lm_0x14c

	ldub      [%o4 + 0x1], %l0
	add       %o4, 0x1, %o4
	ldub      [%o3 + 0x5], %o7
	cwbne     %l0, %o7, lm_0x14c

	ldub      [%o4 + 0x1], %i5
	add       %o4, 0x1, %o4
	ldub      [%o3 + 0x6], %o5
	cwbne     %i5, %o5, lm_0x14c

	ldub      [%o4 + 0x1], %l0
	add       %o4, 0x1, %o4
	ldub      [%o3 + 0x7], %o7
	cwbne     %l0, %o7, lm_0x14c

	ldub      [%o4 + 0x1], %i5
	add       %o4, 0x1, %o4
	ldub      [%o3 + 0x8], %o5
	add       %o3, 0x8, %o3
	cwbne     %i5, %o5, lm_0x14c

	nop
	cxbcs     %o4, %l7, lm_0xc0
		
lm_0x14c:
!1	prefetch  [%l1 - 0x40], #n_reads
	sub       %l7, %o4, %l0
	sub       %l3, %l0, %o7
	cwble     %o7, %i2, lm_0x17c

	st        %i1, [%i0 + 0xa0]
	mov       %o7, %i2
	cwbge     %o7, %o0, lm_0x190

!2	sra       %o7, 0x0, %i1
!3	sra       %o7, 0x0, %l6
!2	add       %i4, %i1, %l1
	 add       %i4, %o7, %l1	!2
!2	ldub      [%i4 + %i1], %o1
	 ldub      [%i4 + %o7], %o1	!2
	 ba	   lm_0x17c
	ldub      [%l1 - 0x1], %o2
	

/* 0x0220	   0 */		.type	longest_match,#function
/* 0x0220	   0 */		.size	longest_match,(.-longest_match)
                       

			.L900000113:

	.section	".text",#alloc,#execinstr,#progbits
/* 000000	   0 */		.align	8
/* 000000	     */		.skip	24
/* 0x0018	     */		.align	4


			.L900000286:

	.section	".text",#alloc,#execinstr,#progbits

! Begin Disassembling Ident
	.ident	"cg: Sun Compiler Common 12.3 SunOS_sparc 2011/11/16"	! (NO SOURCE LINE)
	.ident	"acomp: Sun C 5.12 SunOS_sparc 2011/11/16"	! (/tmp/acomp.1329237379.172468.02.sd:24)
	.ident	"iropt: Sun Compiler Common 12.3 SunOS_sparc 2011/11/16"	! (/tmp/acomp.1329237379.172468.02.sd:25)
	.ident	"cg: Sun Compiler Common 12.3 SunOS_sparc 2011/11/16"	! (NO SOURCE LINE)
! End Disassembling Ident
