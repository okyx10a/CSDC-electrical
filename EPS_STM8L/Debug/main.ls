   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  44                     ; 9 void main(void)
  44                     ; 10 {
  46                     	switch	.text
  47  0000               _main:
  51                     ; 11 	sw_QuickCmd(I2C_SW1_ADDRESS);
  53  0000 a680          	ld	a,#128
  54  0002 cd0000        	call	_sw_QuickCmd
  56                     ; 12 	sw_QuickCmd(I2C_SW2_ADDRESS);
  58  0005 a682          	ld	a,#130
  59  0007 cd0000        	call	_sw_QuickCmd
  61  000a               L12:
  63  000a 20fe          	jra	L12
  76                     	xdef	_main
  77                     	xref	_sw_QuickCmd
  96                     	end
