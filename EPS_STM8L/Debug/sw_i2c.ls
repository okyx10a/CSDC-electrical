   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  49                     ; 5 void sw_LowLevel_DeInit(void)
  49                     ; 6 {
  51                     	switch	.text
  52  0000               _sw_LowLevel_DeInit:
  56                     ; 8   I2C_Cmd(sw_I2C, DISABLE);
  58  0000 4b00          	push	#0
  59  0002 ae5210        	ldw	x,#21008
  60  0005 cd0000        	call	_I2C_Cmd
  62  0008 84            	pop	a
  63                     ; 11   I2C_DeInit(sw_I2C);
  65  0009 ae5210        	ldw	x,#21008
  66  000c cd0000        	call	_I2C_DeInit
  68                     ; 14   CLK_PeripheralClockConfig(sw_I2C_CLK, DISABLE);
  70  000f ae0300        	ldw	x,#768
  71  0012 cd0000        	call	_CLK_PeripheralClockConfig
  73                     ; 18   GPIO_Init(sw_I2C_SCL_GPIO_PORT, sw_I2C_SCL_PIN, GPIO_Mode_In_PU_No_IT);
  75  0015 4b40          	push	#64
  76  0017 4b02          	push	#2
  77  0019 ae500a        	ldw	x,#20490
  78  001c cd0000        	call	_GPIO_Init
  80  001f 85            	popw	x
  81                     ; 21   GPIO_Init(sw_I2C_SDA_GPIO_PORT, sw_I2C_SDA_PIN, GPIO_Mode_In_PU_No_IT);
  83  0020 4b40          	push	#64
  84  0022 4b01          	push	#1
  85  0024 ae500a        	ldw	x,#20490
  86  0027 cd0000        	call	_GPIO_Init
  88  002a 85            	popw	x
  89                     ; 24   DMA_Cmd(sw_I2C_DMA_CHANNEL_TX, DISABLE);
  91  002b 4b00          	push	#0
  92  002d ae5093        	ldw	x,#20627
  93  0030 cd0000        	call	_DMA_Cmd
  95  0033 84            	pop	a
  96                     ; 25   DMA_Cmd(sw_I2C_DMA_CHANNEL_RX, DISABLE);
  98  0034 4b00          	push	#0
  99  0036 ae5075        	ldw	x,#20597
 100  0039 cd0000        	call	_DMA_Cmd
 102  003c 84            	pop	a
 103                     ; 26   DMA_DeInit(sw_I2C_DMA_CHANNEL_TX);
 105  003d ae5093        	ldw	x,#20627
 106  0040 cd0000        	call	_DMA_DeInit
 108                     ; 27   DMA_DeInit(sw_I2C_DMA_CHANNEL_RX);
 110  0043 ae5075        	ldw	x,#20597
 111  0046 cd0000        	call	_DMA_DeInit
 113                     ; 28 }
 116  0049 81            	ret
 142                     ; 30 void sw_LowLevel_Init(void)
 142                     ; 31 {
 143                     	switch	.text
 144  004a               _sw_LowLevel_Init:
 148                     ; 33   CLK_PeripheralClockConfig(sw_I2C_CLK, ENABLE);
 150  004a ae0301        	ldw	x,#769
 151  004d cd0000        	call	_CLK_PeripheralClockConfig
 153                     ; 36   CLK_PeripheralClockConfig(CLK_Peripheral_DMA1, ENABLE);
 155  0050 ae1401        	ldw	x,#5121
 156  0053 cd0000        	call	_CLK_PeripheralClockConfig
 158                     ; 39   DMA_DeInit(sw_I2C_DMA_CHANNEL_TX);
 160  0056 ae5093        	ldw	x,#20627
 161  0059 cd0000        	call	_DMA_DeInit
 163                     ; 40   DMA_Init(sw_I2C_DMA_CHANNEL_TX,
 163                     ; 41            0, /* This parameter will be configured durig communication */
 163                     ; 42            sw_I2C_DR_Address,
 163                     ; 43            0xFF, /* This parameter will be configured durig communication */
 163                     ; 44            DMA_DIR_PeripheralToMemory,/* This parameter will be configured durig communication */
 163                     ; 45            DMA_Mode_Normal,
 163                     ; 46            DMA_MemoryIncMode_Inc,
 163                     ; 47            DMA_Priority_VeryHigh,
 163                     ; 48            DMA_MemoryDataSize_Byte);
 165  005c 4b00          	push	#0
 166  005e 4b30          	push	#48
 167  0060 4b20          	push	#32
 168  0062 4b00          	push	#0
 169  0064 4b00          	push	#0
 170  0066 4bff          	push	#255
 171  0068 ae5216        	ldw	x,#21014
 172  006b 89            	pushw	x
 173  006c ae0000        	ldw	x,#0
 174  006f 89            	pushw	x
 175  0070 ae0000        	ldw	x,#0
 176  0073 89            	pushw	x
 177  0074 ae5093        	ldw	x,#20627
 178  0077 cd0000        	call	_DMA_Init
 180  007a 5b0c          	addw	sp,#12
 181                     ; 51   DMA_DeInit(sw_I2C_DMA_CHANNEL_RX);
 183  007c ae5075        	ldw	x,#20597
 184  007f cd0000        	call	_DMA_DeInit
 186                     ; 52   DMA_Init(sw_I2C_DMA_CHANNEL_RX, 0, /* This parameter will be configured durig communication */
 186                     ; 53            sw_I2C_DR_Address,
 186                     ; 54            0xFF, /* This parameter will be configured durig communication */
 186                     ; 55            DMA_DIR_PeripheralToMemory,/* This parameter will be configured durig communication */
 186                     ; 56            DMA_Mode_Normal,
 186                     ; 57            DMA_MemoryIncMode_Inc,
 186                     ; 58            DMA_Priority_VeryHigh,
 186                     ; 59            DMA_MemoryDataSize_Byte);
 188  0082 4b00          	push	#0
 189  0084 4b30          	push	#48
 190  0086 4b20          	push	#32
 191  0088 4b00          	push	#0
 192  008a 4b00          	push	#0
 193  008c 4bff          	push	#255
 194  008e ae5216        	ldw	x,#21014
 195  0091 89            	pushw	x
 196  0092 ae0000        	ldw	x,#0
 197  0095 89            	pushw	x
 198  0096 ae0000        	ldw	x,#0
 199  0099 89            	pushw	x
 200  009a ae5075        	ldw	x,#20597
 201  009d cd0000        	call	_DMA_Init
 203  00a0 5b0c          	addw	sp,#12
 204                     ; 60 }
 207  00a2 81            	ret
 262                     ; 62 void sw_LowLevel_DMAConfig(uint16_t pBuffer, uint8_t BufferSize, uint16_t Direction)
 262                     ; 63 {
 263                     	switch	.text
 264  00a3               _sw_LowLevel_DMAConfig:
 266  00a3 89            	pushw	x
 267       00000000      OFST:	set	0
 270                     ; 65   if (Direction == sw_DIRECTION_TX)
 272  00a4 1e06          	ldw	x,(OFST+6,sp)
 273  00a6 2626          	jrne	L75
 274                     ; 68     DMA_Init(sw_I2C_DMA_CHANNEL_TX, pBuffer, sw_I2C_DR_Address, BufferSize,
 274                     ; 69              DMA_DIR_MemoryToPeripheral, DMA_Mode_Normal, DMA_MemoryIncMode_Inc,
 274                     ; 70              DMA_Priority_VeryHigh, DMA_MemoryDataSize_Byte);
 276  00a8 4b00          	push	#0
 277  00aa 4b30          	push	#48
 278  00ac 4b20          	push	#32
 279  00ae 4b00          	push	#0
 280  00b0 4b08          	push	#8
 281  00b2 7b0a          	ld	a,(OFST+10,sp)
 282  00b4 88            	push	a
 283  00b5 ae5216        	ldw	x,#21014
 284  00b8 89            	pushw	x
 285  00b9 1e09          	ldw	x,(OFST+9,sp)
 286  00bb cd0000        	call	c_uitolx
 288  00be be02          	ldw	x,c_lreg+2
 289  00c0 89            	pushw	x
 290  00c1 be00          	ldw	x,c_lreg
 291  00c3 89            	pushw	x
 292  00c4 ae5093        	ldw	x,#20627
 293  00c7 cd0000        	call	_DMA_Init
 295  00ca 5b0c          	addw	sp,#12
 297  00cc 2024          	jra	L16
 298  00ce               L75:
 299                     ; 75     DMA_Init(sw_I2C_DMA_CHANNEL_RX, pBuffer, sw_I2C_DR_Address, BufferSize,
 299                     ; 76              DMA_DIR_PeripheralToMemory, DMA_Mode_Normal, DMA_MemoryIncMode_Inc,
 299                     ; 77              DMA_Priority_VeryHigh, DMA_MemoryDataSize_Byte);
 301  00ce 4b00          	push	#0
 302  00d0 4b30          	push	#48
 303  00d2 4b20          	push	#32
 304  00d4 4b00          	push	#0
 305  00d6 4b00          	push	#0
 306  00d8 7b0a          	ld	a,(OFST+10,sp)
 307  00da 88            	push	a
 308  00db ae5216        	ldw	x,#21014
 309  00de 89            	pushw	x
 310  00df 1e09          	ldw	x,(OFST+9,sp)
 311  00e1 cd0000        	call	c_uitolx
 313  00e4 be02          	ldw	x,c_lreg+2
 314  00e6 89            	pushw	x
 315  00e7 be00          	ldw	x,c_lreg
 316  00e9 89            	pushw	x
 317  00ea ae5075        	ldw	x,#20597
 318  00ed cd0000        	call	_DMA_Init
 320  00f0 5b0c          	addw	sp,#12
 321  00f2               L16:
 322                     ; 81   DMA_ITConfig(sw_I2C_DMA_CHANNEL_TX, DMA_ITx_TC, ENABLE);
 324  00f2 4b01          	push	#1
 325  00f4 4b02          	push	#2
 326  00f6 ae5093        	ldw	x,#20627
 327  00f9 cd0000        	call	_DMA_ITConfig
 329  00fc 85            	popw	x
 330                     ; 82   DMA_ITConfig(sw_I2C_DMA_CHANNEL_RX, DMA_ITx_TC, ENABLE);
 332  00fd 4b01          	push	#1
 333  00ff 4b02          	push	#2
 334  0101 ae5075        	ldw	x,#20597
 335  0104 cd0000        	call	_DMA_ITConfig
 337  0107 85            	popw	x
 338                     ; 83 }
 341  0108 85            	popw	x
 342  0109 81            	ret
 366                     ; 85 void sw_DeInit(void)
 366                     ; 86 {
 367                     	switch	.text
 368  010a               _sw_DeInit:
 372                     ; 87 	sw_LowLevel_DeInit();
 374  010a cd0000        	call	_sw_LowLevel_DeInit
 376                     ; 88 }
 379  010d 81            	ret
 406                     ; 90 void sw_Init(void)
 406                     ; 91 {
 407                     	switch	.text
 408  010e               _sw_Init:
 412                     ; 92   sw_LowLevel_Init();
 414  010e cd004a        	call	_sw_LowLevel_Init
 416                     ; 96   I2C_Cmd(sw_I2C, ENABLE);
 418  0111 4b01          	push	#1
 419  0113 ae5210        	ldw	x,#21008
 420  0116 cd0000        	call	_I2C_Cmd
 422  0119 84            	pop	a
 423                     ; 98   I2C_Init(sw_I2C, I2C_SPEED, OWN_ADDR, I2C_Mode_I2C, I2C_DutyCycle_2,
 423                     ; 99            I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
 425  011a 4b00          	push	#0
 426  011c 4b04          	push	#4
 427  011e 4b00          	push	#0
 428  0120 4b00          	push	#0
 429  0122 ae00a0        	ldw	x,#160
 430  0125 89            	pushw	x
 431  0126 ae0d40        	ldw	x,#3392
 432  0129 89            	pushw	x
 433  012a ae0003        	ldw	x,#3
 434  012d 89            	pushw	x
 435  012e ae5210        	ldw	x,#21008
 436  0131 cd0000        	call	_I2C_Init
 438  0134 5b0a          	addw	sp,#10
 439                     ; 102   I2C_DMACmd(sw_I2C, ENABLE);
 441  0136 4b01          	push	#1
 442  0138 ae5210        	ldw	x,#21008
 443  013b cd0000        	call	_I2C_DMACmd
 445  013e 84            	pop	a
 446                     ; 103 }
 449  013f 81            	ret
 487                     ; 105 void sw_QuickCmd(uint8_t slave_addr)
 487                     ; 106 {
 488                     	switch	.text
 489  0140               _sw_QuickCmd:
 491  0140 88            	push	a
 492       00000000      OFST:	set	0
 495                     ; 107 	I2C_GenerateSTART(I2C1, ENABLE);
 497  0141 4b01          	push	#1
 498  0143 ae5210        	ldw	x,#21008
 499  0146 cd0000        	call	_I2C_GenerateSTART
 501  0149 84            	pop	a
 503  014a               L321:
 504                     ; 110   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 506  014a ae0301        	ldw	x,#769
 507  014d 89            	pushw	x
 508  014e ae5210        	ldw	x,#21008
 509  0151 cd0000        	call	_I2C_CheckEvent
 511  0154 85            	popw	x
 512  0155 4d            	tnz	a
 513  0156 27f2          	jreq	L321
 514                     ; 114   I2C_Send7bitAddress(I2C1, slave_addr, I2C_Direction_Transmitter);
 517  0158 4b00          	push	#0
 518  015a 7b02          	ld	a,(OFST+2,sp)
 519  015c 88            	push	a
 520  015d ae5210        	ldw	x,#21008
 521  0160 cd0000        	call	_I2C_Send7bitAddress
 523  0163 85            	popw	x
 525  0164               L131:
 526                     ; 117   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 528  0164 ae0782        	ldw	x,#1922
 529  0167 89            	pushw	x
 530  0168 ae5210        	ldw	x,#21008
 531  016b cd0000        	call	_I2C_CheckEvent
 533  016e 85            	popw	x
 534  016f 4d            	tnz	a
 535  0170 27f2          	jreq	L131
 536                     ; 121   I2C_GenerateSTOP(I2C1, ENABLE);
 539  0172 4b01          	push	#1
 540  0174 ae5210        	ldw	x,#21008
 541  0177 cd0000        	call	_I2C_GenerateSTOP
 543  017a 84            	pop	a
 544                     ; 122 }
 547  017b 84            	pop	a
 548  017c 81            	ret
 582                     ; 124 void sw_WriteCmdByte(uint8_t SlaveAddr, uint8_t Cmd)
 582                     ; 125 {
 583                     	switch	.text
 584  017d               _sw_WriteCmdByte:
 588                     ; 126 }
 591  017d 81            	ret
 625                     ; 128 void sw_WriteExtCmdByte(uint8_t SlaveAddr, uint8_t RegAddr, uint8_t Cmd)
 625                     ; 129 {
 626                     	switch	.text
 627  017e               _sw_WriteExtCmdByte:
 631                     ; 130 }
 634  017e 81            	ret
 668                     ; 132 void sw_ReadVoltCurr(uint8_t SlaveAddr, sw_t* Switch)
 668                     ; 133 {
 669                     	switch	.text
 670  017f               _sw_ReadVoltCurr:
 674                     ; 134 }
 677  017f 81            	ret
 711                     ; 136 void sw_ReadCurrent(uint8_t SlaveAddr, sw_t* Switch)
 711                     ; 137 {
 712                     	switch	.text
 713  0180               _sw_ReadCurrent:
 717                     ; 138 }
 720  0180 81            	ret
 754                     ; 140 void sw_ReadVoltage(uint8_t SlaveAddr, sw_t* Switch)
 754                     ; 141 {
 755                     	switch	.text
 756  0181               _sw_ReadVoltage:
 760                     ; 142 }
 763  0181 81            	ret
 787                     ; 144 void sw_I2C_DMA_RX_IRQHandler(void)
 787                     ; 145 {
 788                     	switch	.text
 789  0182               _sw_I2C_DMA_RX_IRQHandler:
 793                     ; 146 }
 796  0182 81            	ret
 820                     ; 148 void sw_I2C_DMA_TX_IRQHandler(void)
 820                     ; 149 {
 821                     	switch	.text
 822  0183               _sw_I2C_DMA_TX_IRQHandler:
 826                     ; 150 }
 829  0183 81            	ret
 884                     	switch	.ubsct
 885  0000               _Switch:
 886  0000 000000000000  	ds.b	10
 887                     	xdef	_Switch
 888                     	xdef	_sw_I2C_DMA_TX_IRQHandler
 889                     	xdef	_sw_I2C_DMA_RX_IRQHandler
 890                     	xdef	_sw_ReadVoltage
 891                     	xdef	_sw_ReadCurrent
 892                     	xdef	_sw_ReadVoltCurr
 893                     	xdef	_sw_WriteExtCmdByte
 894                     	xdef	_sw_WriteCmdByte
 895                     	xdef	_sw_QuickCmd
 896                     	xdef	_sw_Init
 897                     	xdef	_sw_DeInit
 898                     	xdef	_sw_LowLevel_DMAConfig
 899                     	xdef	_sw_LowLevel_Init
 900                     	xdef	_sw_LowLevel_DeInit
 901                     	xref	_I2C_CheckEvent
 902                     	xref	_I2C_DMACmd
 903                     	xref	_I2C_Send7bitAddress
 904                     	xref	_I2C_GenerateSTOP
 905                     	xref	_I2C_GenerateSTART
 906                     	xref	_I2C_Cmd
 907                     	xref	_I2C_Init
 908                     	xref	_I2C_DeInit
 909                     	xref	_GPIO_Init
 910                     	xref	_DMA_ITConfig
 911                     	xref	_DMA_Cmd
 912                     	xref	_DMA_Init
 913                     	xref	_DMA_DeInit
 914                     	xref	_CLK_PeripheralClockConfig
 915                     	xref.b	c_lreg
 935                     	xref	c_uitolx
 936                     	end
