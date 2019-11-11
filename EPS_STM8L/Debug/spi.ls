   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  46                     ; 3 void LowLevel_DeInit(void)
  46                     ; 4 {
  48                     	switch	.text
  49  0000               _LowLevel_DeInit:
  53                     ; 5   SPI_Cmd(SPI, DISABLE); /*!< SPI disable */
  55  0000 4b00          	push	#0
  56  0002 ae53c0        	ldw	x,#21440
  57  0005 cd0000        	call	_SPI_Cmd
  59  0008 84            	pop	a
  60                     ; 8   CLK_PeripheralClockConfig(SPI_CLK, DISABLE);
  62  0009 ae2200        	ldw	x,#8704
  63  000c cd0000        	call	_CLK_PeripheralClockConfig
  65                     ; 11   GPIO_Init(SPI_SCK_GPIO_PORT, SPI_SCK_PIN, GPIO_Mode_In_FL_No_IT);
  67  000f 4b00          	push	#0
  68  0011 4b02          	push	#2
  69  0013 ae5028        	ldw	x,#20520
  70  0016 cd0000        	call	_GPIO_Init
  72  0019 85            	popw	x
  73                     ; 14   GPIO_Init(SPI_MISO_GPIO_PORT, SPI_MISO_PIN, GPIO_Mode_In_FL_No_IT);
  75  001a 4b00          	push	#0
  76  001c 4b08          	push	#8
  77  001e ae5028        	ldw	x,#20520
  78  0021 cd0000        	call	_GPIO_Init
  80  0024 85            	popw	x
  81                     ; 17   GPIO_Init(SPI_MOSI_GPIO_PORT, SPI_MOSI_PIN, GPIO_Mode_In_FL_No_IT);
  83  0025 4b00          	push	#0
  84  0027 4b04          	push	#4
  85  0029 ae5028        	ldw	x,#20520
  86  002c cd0000        	call	_GPIO_Init
  88  002f 85            	popw	x
  89                     ; 20   GPIO_Init(CS_GPIO_PORT, CS_PIN, GPIO_Mode_In_FL_No_IT);
  91  0030 4b00          	push	#0
  92  0032 4b80          	push	#128
  93  0034 ae501e        	ldw	x,#20510
  94  0037 cd0000        	call	_GPIO_Init
  96  003a 85            	popw	x
  97                     ; 23   GPIO_Init(DETECT_GPIO_PORT, DETECT_PIN, GPIO_Mode_In_FL_No_IT);
  99  003b 4b00          	push	#0
 100  003d 4b40          	push	#64
 101  003f ae501e        	ldw	x,#20510
 102  0042 cd0000        	call	_GPIO_Init
 104  0045 85            	popw	x
 105                     ; 24 }
 108  0046 81            	ret
 137                     ; 31 void LowLevel_Init(void)
 137                     ; 32 {
 138                     	switch	.text
 139  0047               _LowLevel_Init:
 143                     ; 34   CLK_PeripheralClockConfig(SPI_CLK, ENABLE);
 145  0047 ae2201        	ldw	x,#8705
 146  004a cd0000        	call	_CLK_PeripheralClockConfig
 148                     ; 37   GPIO_ExternalPullUpConfig(SPI_SCK_GPIO_PORT, SPI_MISO_PIN | SPI_MOSI_PIN | \
 148                     ; 38                             SPI_SCK_PIN, ENABLE);
 150  004d 4b01          	push	#1
 151  004f 4b0e          	push	#14
 152  0051 ae5028        	ldw	x,#20520
 153  0054 cd0000        	call	_GPIO_ExternalPullUpConfig
 155  0057 85            	popw	x
 156                     ; 41   SYSCFG_REMAPPinConfig(REMAP_Pin_SPI2Full, ENABLE);
 158  0058 4b01          	push	#1
 159  005a ae0220        	ldw	x,#544
 160  005d cd0000        	call	_SYSCFG_REMAPPinConfig
 162  0060 84            	pop	a
 163                     ; 44   SPI_Init(SPI, SPI_FirstBit_MSB, SPI_BaudRatePrescaler_4, SPI_Mode_Master,
 163                     ; 45            SPI_CPOL_High, SPI_CPHA_2Edge, SPI_Direction_2Lines_FullDuplex,
 163                     ; 46            SPI_NSS_Soft, 0x07);
 165  0061 4b07          	push	#7
 166  0063 4b02          	push	#2
 167  0065 4b00          	push	#0
 168  0067 4b01          	push	#1
 169  0069 4b02          	push	#2
 170  006b 4b04          	push	#4
 171  006d 4b08          	push	#8
 172  006f 4b00          	push	#0
 173  0071 ae53c0        	ldw	x,#21440
 174  0074 cd0000        	call	_SPI_Init
 176  0077 5b08          	addw	sp,#8
 177                     ; 50   SPI_Cmd(SPI, ENABLE);
 179  0079 4b01          	push	#1
 180  007b ae53c0        	ldw	x,#21440
 181  007e cd0000        	call	_SPI_Cmd
 183  0081 84            	pop	a
 184                     ; 53   GPIO_Init(DETECT_GPIO_PORT, DETECT_PIN, GPIO_Mode_In_PU_No_IT);
 186  0082 4b40          	push	#64
 187  0084 4b40          	push	#64
 188  0086 ae501e        	ldw	x,#20510
 189  0089 cd0000        	call	_GPIO_Init
 191  008c 85            	popw	x
 192                     ; 56   GPIO_Init(CS_GPIO_PORT, CS_PIN, GPIO_Mode_Out_PP_High_Slow);
 194  008d 4bd0          	push	#208
 195  008f 4b80          	push	#128
 196  0091 ae501e        	ldw	x,#20510
 197  0094 cd0000        	call	_GPIO_Init
 199  0097 85            	popw	x
 200                     ; 57 }
 203  0098 81            	ret
 216                     	xdef	_LowLevel_Init
 217                     	xdef	_LowLevel_DeInit
 218                     	xref	_SYSCFG_REMAPPinConfig
 219                     	xref	_SPI_Cmd
 220                     	xref	_SPI_Init
 221                     	xref	_GPIO_ExternalPullUpConfig
 222                     	xref	_GPIO_Init
 223                     	xref	_CLK_PeripheralClockConfig
 242                     	end
