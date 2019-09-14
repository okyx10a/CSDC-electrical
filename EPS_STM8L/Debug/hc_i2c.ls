   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  48                     ; 5 void hc_i2c_init(void)
  48                     ; 6 {
  50                     	switch	.text
  51  0000               _hc_i2c_init:
  55                     ; 8 	CLK_PeripheralClockConfig(CLK_Peripheral_I2C1,ENABLE);
  57  0000 ae0301        	ldw	x,#769
  58  0003 cd0000        	call	_CLK_PeripheralClockConfig
  60                     ; 10 	I2C_DeInit(I2C1);
  62  0006 ae5210        	ldw	x,#21008
  63  0009 cd0000        	call	_I2C_DeInit
  65                     ; 12 	I2C_Cmd(I2C1,ENABLE);
  67  000c 4b01          	push	#1
  68  000e ae5210        	ldw	x,#21008
  69  0011 cd0000        	call	_I2C_Cmd
  71  0014 84            	pop	a
  72                     ; 23 	I2C_Init(I2C1, I2C_SPEED, I2C_OWN_ADDR, I2C_Mode_I2C, I2C_DutyCycle_2,I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
  74  0015 4b00          	push	#0
  75  0017 4b04          	push	#4
  76  0019 4b00          	push	#0
  77  001b 4b00          	push	#0
  78  001d ae00a0        	ldw	x,#160
  79  0020 89            	pushw	x
  80  0021 ae2710        	ldw	x,#10000
  81  0024 89            	pushw	x
  82  0025 ae0000        	ldw	x,#0
  83  0028 89            	pushw	x
  84  0029 ae5210        	ldw	x,#21008
  85  002c cd0000        	call	_I2C_Init
  87  002f 5b0a          	addw	sp,#10
  88                     ; 25 	I2C_DMACmd(I2C1, ENABLE);
  90  0031 4b01          	push	#1
  91  0033 ae5210        	ldw	x,#21008
  92  0036 cd0000        	call	_I2C_DMACmd
  94  0039 84            	pop	a
  95                     ; 26 }
  98  003a 81            	ret
 146                     ; 28 void hc_i2c_writeByte(uint8_t slave_addr, uint8_t data)
 146                     ; 29 {
 147                     	switch	.text
 148  003b               _hc_i2c_writeByte:
 150  003b 89            	pushw	x
 151       00000000      OFST:	set	0
 154                     ; 30 	I2C_GenerateSTART(I2C1, ENABLE);
 156  003c 4b01          	push	#1
 157  003e ae5210        	ldw	x,#21008
 158  0041 cd0000        	call	_I2C_GenerateSTART
 160  0044 84            	pop	a
 162  0045               L54:
 163                     ; 33   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 165  0045 ae0301        	ldw	x,#769
 166  0048 89            	pushw	x
 167  0049 ae5210        	ldw	x,#21008
 168  004c cd0000        	call	_I2C_CheckEvent
 170  004f 85            	popw	x
 171  0050 4d            	tnz	a
 172  0051 27f2          	jreq	L54
 173                     ; 37   I2C_Send7bitAddress(I2C1, slave_addr, I2C_Direction_Transmitter);
 175  0053 4b00          	push	#0
 176  0055 7b02          	ld	a,(OFST+2,sp)
 177  0057 88            	push	a
 178  0058 ae5210        	ldw	x,#21008
 179  005b cd0000        	call	_I2C_Send7bitAddress
 181  005e 85            	popw	x
 183  005f               L35:
 184                     ; 40   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 186  005f ae0782        	ldw	x,#1922
 187  0062 89            	pushw	x
 188  0063 ae5210        	ldw	x,#21008
 189  0066 cd0000        	call	_I2C_CheckEvent
 191  0069 85            	popw	x
 192  006a 4d            	tnz	a
 193  006b 27f2          	jreq	L35
 194                     ; 44   I2C_SendData(I2C1, data);
 196  006d 7b02          	ld	a,(OFST+2,sp)
 197  006f 88            	push	a
 198  0070 ae5210        	ldw	x,#21008
 199  0073 cd0000        	call	_I2C_SendData
 201  0076 84            	pop	a
 203  0077               L16:
 204                     ; 47   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED))
 206  0077 ae0784        	ldw	x,#1924
 207  007a 89            	pushw	x
 208  007b ae5210        	ldw	x,#21008
 209  007e cd0000        	call	_I2C_CheckEvent
 211  0081 85            	popw	x
 212  0082 4d            	tnz	a
 213  0083 27f2          	jreq	L16
 214                     ; 51   I2C_GenerateSTOP(I2C1, ENABLE);
 216  0085 4b01          	push	#1
 217  0087 ae5210        	ldw	x,#21008
 218  008a cd0000        	call	_I2C_GenerateSTOP
 220  008d 84            	pop	a
 221                     ; 52 }
 224  008e 85            	popw	x
 225  008f 81            	ret
 259                     ; 54 void hc_i2c_readByte(uint8_t slave_addr, uint8_t* data_buffer)
 259                     ; 55 {
 260                     	switch	.text
 261  0090               _hc_i2c_readByte:
 265                     ; 57 }
 268  0090 81            	ret
 306                     ; 59 void hc_i2c_quickCmd(uint8_t slave_addr)
 306                     ; 60 {
 307                     	switch	.text
 308  0091               _hc_i2c_quickCmd:
 310  0091 88            	push	a
 311       00000000      OFST:	set	0
 314                     ; 61 	I2C_GenerateSTART(I2C1, ENABLE);
 316  0092 4b01          	push	#1
 317  0094 ae5210        	ldw	x,#21008
 318  0097 cd0000        	call	_I2C_GenerateSTART
 320  009a 84            	pop	a
 322  009b               L321:
 323                     ; 64   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 325  009b ae0301        	ldw	x,#769
 326  009e 89            	pushw	x
 327  009f ae5210        	ldw	x,#21008
 328  00a2 cd0000        	call	_I2C_CheckEvent
 330  00a5 85            	popw	x
 331  00a6 4d            	tnz	a
 332  00a7 27f2          	jreq	L321
 333                     ; 68   I2C_Send7bitAddress(I2C1, slave_addr, I2C_Direction_Transmitter);
 335  00a9 4b00          	push	#0
 336  00ab 7b02          	ld	a,(OFST+2,sp)
 337  00ad 88            	push	a
 338  00ae ae5210        	ldw	x,#21008
 339  00b1 cd0000        	call	_I2C_Send7bitAddress
 341  00b4 85            	popw	x
 343  00b5               L131:
 344                     ; 71   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 346  00b5 ae0782        	ldw	x,#1922
 347  00b8 89            	pushw	x
 348  00b9 ae5210        	ldw	x,#21008
 349  00bc cd0000        	call	_I2C_CheckEvent
 351  00bf 85            	popw	x
 352  00c0 4d            	tnz	a
 353  00c1 27f2          	jreq	L131
 354                     ; 75   I2C_GenerateSTOP(I2C1, ENABLE);
 356  00c3 4b01          	push	#1
 357  00c5 ae5210        	ldw	x,#21008
 358  00c8 cd0000        	call	_I2C_GenerateSTOP
 360  00cb 84            	pop	a
 361                     ; 76 }
 364  00cc 84            	pop	a
 365  00cd 81            	ret
 378                     	xdef	_hc_i2c_quickCmd
 379                     	xdef	_hc_i2c_readByte
 380                     	xdef	_hc_i2c_writeByte
 381                     	xdef	_hc_i2c_init
 382                     	xref	_I2C_CheckEvent
 383                     	xref	_I2C_DMACmd
 384                     	xref	_I2C_SendData
 385                     	xref	_I2C_Send7bitAddress
 386                     	xref	_I2C_GenerateSTOP
 387                     	xref	_I2C_GenerateSTART
 388                     	xref	_I2C_Cmd
 389                     	xref	_I2C_Init
 390                     	xref	_I2C_DeInit
 391                     	xref	_CLK_PeripheralClockConfig
 410                     	end
