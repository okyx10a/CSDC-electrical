   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  44                     ; 7 void DeInit(void)
  44                     ; 8 {
  46                     	switch	.text
  47  0000               _DeInit:
  51                     ; 9 	I2C_LowLevel_DeInit();
  53  0000 cd0000        	call	_I2C_LowLevel_DeInit
  55                     ; 10 }
  58  0003 81            	ret
  85                     ; 12 void Init(void)
  85                     ; 13 {
  86                     	switch	.text
  87  0004               _Init:
  91                     ; 14   I2C_LowLevel_Init();
  93  0004 cd0000        	call	_I2C_LowLevel_Init
  95                     ; 18   I2C_Cmd(I2C, ENABLE);
  97  0007 4b01          	push	#1
  98  0009 ae5210        	ldw	x,#21008
  99  000c cd0000        	call	_I2C_Cmd
 101  000f 84            	pop	a
 102                     ; 20   I2C_Init(I2C, I2C_SPEED, OWN_ADDR, I2C_Mode_I2C, I2C_DutyCycle_2,
 102                     ; 21            I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
 104  0010 4b00          	push	#0
 105  0012 4b04          	push	#4
 106  0014 4b00          	push	#0
 107  0016 4b00          	push	#0
 108  0018 ae00a0        	ldw	x,#160
 109  001b 89            	pushw	x
 110  001c ae0d40        	ldw	x,#3392
 111  001f 89            	pushw	x
 112  0020 ae0003        	ldw	x,#3
 113  0023 89            	pushw	x
 114  0024 ae5210        	ldw	x,#21008
 115  0027 cd0000        	call	_I2C_Init
 117  002a 5b0a          	addw	sp,#10
 118                     ; 24   I2C_DMACmd(I2C, ENABLE);
 120  002c 4b01          	push	#1
 121  002e ae5210        	ldw	x,#21008
 122  0031 cd0000        	call	_I2C_DMACmd
 124  0034 84            	pop	a
 125                     ; 25 }
 128  0035 81            	ret
 166                     ; 27 void sw_QuickCmd(uint8_t slave_addr)
 166                     ; 28 {
 167                     	switch	.text
 168  0036               _sw_QuickCmd:
 170  0036 88            	push	a
 171       00000000      OFST:	set	0
 174                     ; 29 	I2C_GenerateSTART(I2C1, ENABLE);
 176  0037 4b01          	push	#1
 177  0039 ae5210        	ldw	x,#21008
 178  003c cd0000        	call	_I2C_GenerateSTART
 180  003f 84            	pop	a
 182  0040               L15:
 183                     ; 32   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 185  0040 ae0301        	ldw	x,#769
 186  0043 89            	pushw	x
 187  0044 ae5210        	ldw	x,#21008
 188  0047 cd0000        	call	_I2C_CheckEvent
 190  004a 85            	popw	x
 191  004b 4d            	tnz	a
 192  004c 27f2          	jreq	L15
 193                     ; 36   I2C_Send7bitAddress(I2C1, slave_addr, I2C_Direction_Transmitter);
 196  004e 4b00          	push	#0
 197  0050 7b02          	ld	a,(OFST+2,sp)
 198  0052 88            	push	a
 199  0053 ae5210        	ldw	x,#21008
 200  0056 cd0000        	call	_I2C_Send7bitAddress
 202  0059 85            	popw	x
 204  005a               L75:
 205                     ; 39   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 207  005a ae0782        	ldw	x,#1922
 208  005d 89            	pushw	x
 209  005e ae5210        	ldw	x,#21008
 210  0061 cd0000        	call	_I2C_CheckEvent
 212  0064 85            	popw	x
 213  0065 4d            	tnz	a
 214  0066 27f2          	jreq	L75
 215                     ; 43   I2C_GenerateSTOP(I2C1, ENABLE);
 218  0068 4b01          	push	#1
 219  006a ae5210        	ldw	x,#21008
 220  006d cd0000        	call	_I2C_GenerateSTOP
 222  0070 84            	pop	a
 223                     ; 44 }
 226  0071 84            	pop	a
 227  0072 81            	ret
 261                     ; 46 void WriteCmdByte(uint8_t SlaveAddr, uint8_t Cmd)
 261                     ; 47 {
 262                     	switch	.text
 263  0073               _WriteCmdByte:
 267                     ; 48 }
 270  0073 81            	ret
 304                     ; 50 void WriteExtCmdByte(uint8_t SlaveAddr, uint8_t RegAddr, uint8_t Cmd)
 304                     ; 51 {
 305                     	switch	.text
 306  0074               _WriteExtCmdByte:
 310                     ; 52 }
 313  0074 81            	ret
 347                     ; 54 void ReadVoltCurr(uint8_t SlaveAddr, sw_t* Switch)
 347                     ; 55 {
 348                     	switch	.text
 349  0075               _ReadVoltCurr:
 353                     ; 56 }
 356  0075 81            	ret
 390                     ; 58 void ReadCurrent(uint8_t SlaveAddr, sw_t* Switch)
 390                     ; 59 {
 391                     	switch	.text
 392  0076               _ReadCurrent:
 396                     ; 60 }
 399  0076 81            	ret
 433                     ; 62 void ReadVoltage(uint8_t SlaveAddr, sw_t* Switch)
 433                     ; 63 {
 434                     	switch	.text
 435  0077               _ReadVoltage:
 439                     ; 64 }
 442  0077 81            	ret
 497                     	xdef	_ReadVoltage
 498                     	xdef	_ReadCurrent
 499                     	xdef	_ReadVoltCurr
 500                     	xdef	_WriteExtCmdByte
 501                     	xdef	_WriteCmdByte
 502                     	xdef	_Init
 503                     	xdef	_DeInit
 504                     	switch	.ubsct
 505  0000               _Switch:
 506  0000 000000000000  	ds.b	10
 507                     	xdef	_Switch
 508                     	xdef	_sw_QuickCmd
 509                     	xref	_I2C_LowLevel_Init
 510                     	xref	_I2C_LowLevel_DeInit
 511                     	xref	_I2C_CheckEvent
 512                     	xref	_I2C_DMACmd
 513                     	xref	_I2C_Send7bitAddress
 514                     	xref	_I2C_GenerateSTOP
 515                     	xref	_I2C_GenerateSTART
 516                     	xref	_I2C_Cmd
 517                     	xref	_I2C_Init
 537                     	end
