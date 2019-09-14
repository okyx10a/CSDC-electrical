   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  50                     ; 3 void I2C_LowLevel_DeInit(void)
  50                     ; 4 {
  52                     	switch	.text
  53  0000               _I2C_LowLevel_DeInit:
  57                     ; 6   I2C_Cmd(I2C, DISABLE);
  59  0000 4b00          	push	#0
  60  0002 ae5210        	ldw	x,#21008
  61  0005 cd0000        	call	_I2C_Cmd
  63  0008 84            	pop	a
  64                     ; 9   I2C_DeInit(I2C);
  66  0009 ae5210        	ldw	x,#21008
  67  000c cd0000        	call	_I2C_DeInit
  69                     ; 12   CLK_PeripheralClockConfig(I2C_CLK, DISABLE);
  71  000f ae0300        	ldw	x,#768
  72  0012 cd0000        	call	_CLK_PeripheralClockConfig
  74                     ; 16   GPIO_Init(I2C_SCL_GPIO_PORT, I2C_SCL_PIN, GPIO_Mode_In_PU_No_IT);
  76  0015 4b40          	push	#64
  77  0017 4b02          	push	#2
  78  0019 ae500a        	ldw	x,#20490
  79  001c cd0000        	call	_GPIO_Init
  81  001f 85            	popw	x
  82                     ; 19   GPIO_Init(I2C_SDA_GPIO_PORT, I2C_SDA_PIN, GPIO_Mode_In_PU_No_IT);
  84  0020 4b40          	push	#64
  85  0022 4b01          	push	#1
  86  0024 ae500a        	ldw	x,#20490
  87  0027 cd0000        	call	_GPIO_Init
  89  002a 85            	popw	x
  90                     ; 22   DMA_Cmd(I2C_DMA_CHANNEL_TX, DISABLE);
  92  002b 4b00          	push	#0
  93  002d ae5093        	ldw	x,#20627
  94  0030 cd0000        	call	_DMA_Cmd
  96  0033 84            	pop	a
  97                     ; 23   DMA_Cmd(I2C_DMA_CHANNEL_RX, DISABLE);
  99  0034 4b00          	push	#0
 100  0036 ae5075        	ldw	x,#20597
 101  0039 cd0000        	call	_DMA_Cmd
 103  003c 84            	pop	a
 104                     ; 24   DMA_DeInit(I2C_DMA_CHANNEL_TX);
 106  003d ae5093        	ldw	x,#20627
 107  0040 cd0000        	call	_DMA_DeInit
 109                     ; 25   DMA_DeInit(I2C_DMA_CHANNEL_RX);
 111  0043 ae5075        	ldw	x,#20597
 112  0046 cd0000        	call	_DMA_DeInit
 114                     ; 26 }
 117  0049 81            	ret
 143                     ; 28 void I2C_LowLevel_Init(void)
 143                     ; 29 {
 144                     	switch	.text
 145  004a               _I2C_LowLevel_Init:
 149                     ; 31   CLK_PeripheralClockConfig(I2C_CLK, ENABLE);
 151  004a ae0301        	ldw	x,#769
 152  004d cd0000        	call	_CLK_PeripheralClockConfig
 154                     ; 34   CLK_PeripheralClockConfig(CLK_Peripheral_DMA1, ENABLE);
 156  0050 ae1401        	ldw	x,#5121
 157  0053 cd0000        	call	_CLK_PeripheralClockConfig
 159                     ; 37   DMA_DeInit(I2C_DMA_CHANNEL_TX);
 161  0056 ae5093        	ldw	x,#20627
 162  0059 cd0000        	call	_DMA_DeInit
 164                     ; 38   DMA_Init(I2C_DMA_CHANNEL_TX,
 164                     ; 39            0, /* This parameter will be configured durig communication */
 164                     ; 40            I2C_DR_Address,
 164                     ; 41            0xFF, /* This parameter will be configured durig communication */
 164                     ; 42            DMA_DIR_PeripheralToMemory,/* This parameter will be configured durig communication */
 164                     ; 43            DMA_Mode_Normal,
 164                     ; 44            DMA_MemoryIncMode_Inc,
 164                     ; 45            DMA_Priority_VeryHigh,
 164                     ; 46            DMA_MemoryDataSize_Byte);
 166  005c 4b00          	push	#0
 167  005e 4b30          	push	#48
 168  0060 4b20          	push	#32
 169  0062 4b00          	push	#0
 170  0064 4b00          	push	#0
 171  0066 4bff          	push	#255
 172  0068 ae5216        	ldw	x,#21014
 173  006b 89            	pushw	x
 174  006c ae0000        	ldw	x,#0
 175  006f 89            	pushw	x
 176  0070 ae0000        	ldw	x,#0
 177  0073 89            	pushw	x
 178  0074 ae5093        	ldw	x,#20627
 179  0077 cd0000        	call	_DMA_Init
 181  007a 5b0c          	addw	sp,#12
 182                     ; 49   DMA_DeInit(I2C_DMA_CHANNEL_RX);
 184  007c ae5075        	ldw	x,#20597
 185  007f cd0000        	call	_DMA_DeInit
 187                     ; 50   DMA_Init(I2C_DMA_CHANNEL_RX, 0, /* This parameter will be configured durig communication */
 187                     ; 51            I2C_DR_Address,
 187                     ; 52            0xFF, /* This parameter will be configured durig communication */
 187                     ; 53            DMA_DIR_PeripheralToMemory,/* This parameter will be configured durig communication */
 187                     ; 54            DMA_Mode_Normal,
 187                     ; 55            DMA_MemoryIncMode_Inc,
 187                     ; 56            DMA_Priority_VeryHigh,
 187                     ; 57            DMA_MemoryDataSize_Byte);
 189  0082 4b00          	push	#0
 190  0084 4b30          	push	#48
 191  0086 4b20          	push	#32
 192  0088 4b00          	push	#0
 193  008a 4b00          	push	#0
 194  008c 4bff          	push	#255
 195  008e ae5216        	ldw	x,#21014
 196  0091 89            	pushw	x
 197  0092 ae0000        	ldw	x,#0
 198  0095 89            	pushw	x
 199  0096 ae0000        	ldw	x,#0
 200  0099 89            	pushw	x
 201  009a ae5075        	ldw	x,#20597
 202  009d cd0000        	call	_DMA_Init
 204  00a0 5b0c          	addw	sp,#12
 205                     ; 58 }
 208  00a2 81            	ret
 263                     ; 60 void I2C_LowLevel_DMAConfig(uint16_t pBuffer, uint8_t BufferSize, uint16_t Direction)
 263                     ; 61 {
 264                     	switch	.text
 265  00a3               _I2C_LowLevel_DMAConfig:
 267  00a3 89            	pushw	x
 268       00000000      OFST:	set	0
 271                     ; 63   if (Direction == DIRECTION_TX)
 273  00a4 1e06          	ldw	x,(OFST+6,sp)
 274  00a6 2626          	jrne	L75
 275                     ; 66     DMA_Init(I2C_DMA_CHANNEL_TX, pBuffer, I2C_DR_Address, BufferSize,
 275                     ; 67              DMA_DIR_MemoryToPeripheral, DMA_Mode_Normal, DMA_MemoryIncMode_Inc,
 275                     ; 68              DMA_Priority_VeryHigh, DMA_MemoryDataSize_Byte);
 277  00a8 4b00          	push	#0
 278  00aa 4b30          	push	#48
 279  00ac 4b20          	push	#32
 280  00ae 4b00          	push	#0
 281  00b0 4b08          	push	#8
 282  00b2 7b0a          	ld	a,(OFST+10,sp)
 283  00b4 88            	push	a
 284  00b5 ae5216        	ldw	x,#21014
 285  00b8 89            	pushw	x
 286  00b9 1e09          	ldw	x,(OFST+9,sp)
 287  00bb cd0000        	call	c_uitolx
 289  00be be02          	ldw	x,c_lreg+2
 290  00c0 89            	pushw	x
 291  00c1 be00          	ldw	x,c_lreg
 292  00c3 89            	pushw	x
 293  00c4 ae5093        	ldw	x,#20627
 294  00c7 cd0000        	call	_DMA_Init
 296  00ca 5b0c          	addw	sp,#12
 298  00cc 2024          	jra	L16
 299  00ce               L75:
 300                     ; 73     DMA_Init(I2C_DMA_CHANNEL_RX, pBuffer, I2C_DR_Address, BufferSize,
 300                     ; 74              DMA_DIR_PeripheralToMemory, DMA_Mode_Normal, DMA_MemoryIncMode_Inc,
 300                     ; 75              DMA_Priority_VeryHigh, DMA_MemoryDataSize_Byte);
 302  00ce 4b00          	push	#0
 303  00d0 4b30          	push	#48
 304  00d2 4b20          	push	#32
 305  00d4 4b00          	push	#0
 306  00d6 4b00          	push	#0
 307  00d8 7b0a          	ld	a,(OFST+10,sp)
 308  00da 88            	push	a
 309  00db ae5216        	ldw	x,#21014
 310  00de 89            	pushw	x
 311  00df 1e09          	ldw	x,(OFST+9,sp)
 312  00e1 cd0000        	call	c_uitolx
 314  00e4 be02          	ldw	x,c_lreg+2
 315  00e6 89            	pushw	x
 316  00e7 be00          	ldw	x,c_lreg
 317  00e9 89            	pushw	x
 318  00ea ae5075        	ldw	x,#20597
 319  00ed cd0000        	call	_DMA_Init
 321  00f0 5b0c          	addw	sp,#12
 322  00f2               L16:
 323                     ; 79   DMA_ITConfig(I2C_DMA_CHANNEL_TX, DMA_ITx_TC, ENABLE);
 325  00f2 4b01          	push	#1
 326  00f4 4b02          	push	#2
 327  00f6 ae5093        	ldw	x,#20627
 328  00f9 cd0000        	call	_DMA_ITConfig
 330  00fc 85            	popw	x
 331                     ; 80   DMA_ITConfig(I2C_DMA_CHANNEL_RX, DMA_ITx_TC, ENABLE);
 333  00fd 4b01          	push	#1
 334  00ff 4b02          	push	#2
 335  0101 ae5075        	ldw	x,#20597
 336  0104 cd0000        	call	_DMA_ITConfig
 338  0107 85            	popw	x
 339                     ; 81 }
 342  0108 85            	popw	x
 343  0109 81            	ret
 367                     ; 83 void I2C_DMA_RX_IRQHandler(void)
 367                     ; 84 {
 368                     	switch	.text
 369  010a               _I2C_DMA_RX_IRQHandler:
 373                     ; 85 }
 376  010a 81            	ret
 400                     ; 87 void I2C_DMA_TX_IRQHandler(void)
 400                     ; 88 {
 401                     	switch	.text
 402  010b               _I2C_DMA_TX_IRQHandler:
 406                     ; 89 }
 409  010b 81            	ret
 422                     	xdef	_I2C_DMA_TX_IRQHandler
 423                     	xdef	_I2C_DMA_RX_IRQHandler
 424                     	xdef	_I2C_LowLevel_DMAConfig
 425                     	xdef	_I2C_LowLevel_Init
 426                     	xdef	_I2C_LowLevel_DeInit
 427                     	xref	_I2C_Cmd
 428                     	xref	_I2C_DeInit
 429                     	xref	_GPIO_Init
 430                     	xref	_DMA_ITConfig
 431                     	xref	_DMA_Cmd
 432                     	xref	_DMA_Init
 433                     	xref	_DMA_DeInit
 434                     	xref	_CLK_PeripheralClockConfig
 435                     	xref.b	c_lreg
 454                     	xref	c_uitolx
 455                     	end
