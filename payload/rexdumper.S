_start:
.globl _start

li		%r3, 0xFF
bl 		post_out
bl 		delay_9600
bl 		delay_9600
bl 		delay_9600
bl 		delay_9600
bl 		delay_9600

/* Taken from xenonsprs.h */
/* msr */
mfmsr	%r3
li		%r4, 64
bl		print_reg

/* esr */
mfspr	%r3, 62
li		%r4, 64
bl		print_reg

/* ivpr */
mfspr	%r3, 63
li		%r4, 64
bl		print_reg

/* pid */
mfspr	%r3, 48
li		%r4, 64
bl		print_reg

/* ctrlrd */
mfspr	%r3, 136
li		%r4, 64
bl		print_reg

/* ctrlwr */
mfspr	%r3, 152
li		%r4, 64
bl		print_reg

/* pvr */
mfspr	%r3, 287
li		%r4, 64
bl		print_reg

/* hsprg0 */
mfspr	%r3, 304
li		%r4, 64
bl		print_reg

/* hsprg1 */
mfspr	%r3, 305
li		%r4, 64
bl		print_reg

/* hdsisr */
mfspr	%r3, 306
li		%r4, 64
bl		print_reg

/* hdar */
mfspr	%r3, 307
li		%r4, 64
bl		print_reg

/* dbcr0 */
mfspr	%r3, 308
li		%r4, 64
bl		print_reg

/* dbcr1 */
mfspr	%r3, 309
li		%r4, 64
bl		print_reg

/* hdec */
mfspr	%r3, 310
li		%r4, 64
bl		print_reg

/* hior */
mfspr	%r3, 311
li		%r4, 64
bl		print_reg

/* rmor */
mfspr	%r3, 312
li		%r4, 64
bl		print_reg

/* hrmor */
mfspr	%r3, 313
li		%r4, 64
bl		print_reg

/* hsrr0 */
mfspr	%r3, 314
li		%r4, 64
bl		print_reg

/* hsrr1 */
mfspr	%r3, 315
li		%r4, 64
bl		print_reg

/* dac1 */
mfspr	%r3, 316
li		%r4, 64
bl		print_reg

/* dac2 */
mfspr	%r3, 317
li		%r4, 64
bl		print_reg

/* lpcr */
mfspr	%r3, 318
li		%r4, 64
bl		print_reg

/* lpidr */
mfspr	%r3, 319
li		%r4, 64
bl		print_reg

/* tsr */
mfspr	%r3, 336
li		%r4, 64
bl		print_reg

/* tcr */
mfspr	%r3, 340
li		%r4, 64
bl		print_reg

/* tsrl */
mfspr	%r3, 896
li		%r4, 64
bl		print_reg

/* tsrr */
mfspr	%r3, 897
li		%r4, 64
bl		print_reg

/* tscr */
mfspr	%r3, 921
li		%r4, 64
bl		print_reg

/* ttr */
mfspr	%r3, 922
li		%r4, 64
bl		print_reg

/* PpeTlbIndexHint	*/
mfspr	%r3, 946
li		%r4, 64
bl		print_reg

/* PpeTlbIndex */
mfspr	%r3, 947
li		%r4, 64
bl		print_reg

/* PpeTlbVpn */
mfspr	%r3, 948
li		%r4, 64
bl		print_reg

/* PpeTlbRpn */
mfspr	%r3, 949
li		%r4, 64
bl		print_reg

/* PpeTlbRmt */
mfspr	%r3, 951
li		%r4, 64
bl		print_reg

/* dsr0 */
mfspr	%r3, 952
li		%r4, 64
bl		print_reg

/* drmr0 */
mfspr	%r3, 953
li		%r4, 64
bl		print_reg

/* dcidr0 */ 
mfspr	%r3, 954
li		%r4, 64
bl		print_reg

/* drsr1 */
mfspr	%r3, 955
li		%r4, 64
bl		print_reg

/* drmr1 */
mfspr	%r3, 956
li		%r4, 64
bl		print_reg

/* dcidr1 */
mfspr	%r3, 957
li		%r4, 64
bl		print_reg

/* issr0 */
mfspr	%r3, 976
li		%r4, 64
bl		print_reg

/* irmr0 */
mfspr	%r3, 977
li		%r4, 64
bl		print_reg

/* icidr0 */
mfspr	%r3, 978
li		%r4, 64
bl		print_reg

/* irsr1 */
mfspr	%r3, 979
li		%r4, 64
bl		print_reg

/* irmr1 */
mfspr	%r3, 980
li		%r4, 64
bl		print_reg

/* icidr1 */
mfspr	%r3, 981
li		%r4, 64
bl		print_reg

/* hid0 */
mfspr	%r3, 1008
li		%r4, 64
bl		print_reg

/* hid1 */
mfspr	%r3, 1009
li		%r4, 64
bl		print_reg

/* hid4 */
mfspr	%r3, 1012
li		%r4, 64
bl		print_reg

/* iabr */
mfspr	%r3, 1010
li		%r4, 64
bl		print_reg

/* dabr */
mfspr	%r3, 1013
li		%r4, 64
bl		print_reg

/* dabrx */
mfspr	%r3, 1015
li		%r4, 64
bl		print_reg

/* buscsr */
mfspr	%r3, 1016
li		%r4, 64
bl		print_reg

/* hid6 */
mfspr	%r3, 1017
li		%r4, 64
bl		print_reg

/* l2sr */
mfspr	%r3, 1018
li		%r4, 64
bl		print_reg

/* BpVr */
mfspr	%r3, 1022
li		%r4, 64
bl		print_reg

/* pir */
mfspr	%r3, 1023
li		%r4, 64
bl		print_reg

end:
	nop
	b   end
	
post_out:
	mfmsr	%r7
	andi.	%r7, %r7, 0x30
	cmpwi	%r7, 0x30
	lis		%r7, 0x2006
	ori		%r7, %r7, 0x1010
	sldi	%r3, %r3, 56
	beq		post_write
	li      %r7,0x200
	oris	%r7,%r7,0x8000
	rldicr	%r7,%r7,32,31
	ori	    %r7,%r7,0x1010
	oris 	%r7,%r7,6
post_write:
	std		%r3, 0(%r7)
	blr

delay_9600:
	li		%r3, 0x00
	ori		%r3, %r3, 0x1458
tdelay:
	mftb	%r8
	add		%r3, %r3, %r8
tdelay_loop:
	or		%r31, %r31, %r31
	mftb	%r8
	cmpw	%r8, %r3
	ble 	tdelay_loop
	blr

send_start:
	mflr	%r1
	li		%r3, 0
	bl		post_out
	bl		delay_9600
	mtlr	%r1
	blr

send_stop:
	mflr	%r1
	li		%r3, 0xFF
	bl		post_out
	bl		delay_9600
	li 		%r2, 0
	addi	%r9, %r9, 1
	mtlr	%r1
	blr

print_reg:
	mr		%r5, %r3
	mflr	%r6
	li 		%r2, 0
	li		%r9, 1
	mr		%r10, %r4
shift_and_print:
	cmpwi	%r2, 0
	beql	send_start
	subi	%r4, %r4, 1
	srd		%r3, %r5, %r4
	mulli	%r11, %r9, 8
	subf	%r11, %r2, %r11
	subf	%r11, %r11, %r10
	srd		%r3, %r5, %r11
	andi.	%r3, %r3, 1
	bl		post_out
	bl 		delay_9600
	addi	%r2, %r2, 1
	cmpwi	%r2, 8
	beql	send_stop
	cmpwi	%r4, 0
	bne 	shift_and_print
	bl		send_stop
	mtlr	%r6
	blr




