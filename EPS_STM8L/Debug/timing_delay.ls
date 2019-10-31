   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  53                     ; 75 void TimingDelay_Init(void)
  53                     ; 76 {
  55                     	switch	.text
  56  0000               _TimingDelay_Init:
  60                     ; 78   CLK_PeripheralClockConfig(CLK_Peripheral_TIM2, ENABLE);
  62  0000 ae0001        	ldw	x,#1
  63  0003 cd0000        	call	_CLK_PeripheralClockConfig
  65                     ; 81   SYSCFG_REMAPPinConfig(REMAP_Pin_TIM2TRIGLSE, ENABLE);
  67  0006 4b01          	push	#1
  68  0008 ae0208        	ldw	x,#520
  69  000b cd0000        	call	_SYSCFG_REMAPPinConfig
  71  000e 84            	pop	a
  72                     ; 84   CLK_LSEConfig(CLK_LSE_ON);
  74  000f a604          	ld	a,#4
  75  0011 cd0000        	call	_CLK_LSEConfig
  78  0014               L52:
  79                     ; 86   while (CLK_GetFlagStatus(CLK_FLAG_LSERDY) == RESET);
  81  0014 a633          	ld	a,#51
  82  0016 cd0000        	call	_CLK_GetFlagStatus
  84  0019 4d            	tnz	a
  85  001a 27f8          	jreq	L52
  86                     ; 96   TIM2_TimeBaseInit(TIM2_Prescaler_1, TIM2_CounterMode_Up, TIM2_PERIOD);
  88  001c ae0007        	ldw	x,#7
  89  001f 89            	pushw	x
  90  0020 5f            	clrw	x
  91  0021 cd0000        	call	_TIM2_TimeBaseInit
  93  0024 85            	popw	x
  94                     ; 97   TIM2_ETRClockMode2Config(TIM2_ExtTRGPSC_DIV4, TIM2_ExtTRGPolarity_NonInverted, 0);
  96  0025 4b00          	push	#0
  97  0027 ae2000        	ldw	x,#8192
  98  002a cd0000        	call	_TIM2_ETRClockMode2Config
 100  002d 84            	pop	a
 101                     ; 99   TIM2_UpdateRequestConfig(TIM2_UpdateSource_Global);
 103  002e 4f            	clr	a
 104  002f cd0000        	call	_TIM2_UpdateRequestConfig
 106                     ; 102   TIM2_ClearFlag(TIM2_FLAG_Update);
 108  0032 ae0001        	ldw	x,#1
 109  0035 cd0000        	call	_TIM2_ClearFlag
 111                     ; 105   TIM2_ITConfig(TIM2_IT_Update, ENABLE);
 113  0038 ae0101        	ldw	x,#257
 114  003b cd0000        	call	_TIM2_ITConfig
 116                     ; 107   TIM2_Cmd(ENABLE);
 118  003e a601          	ld	a,#1
 119  0040 cd0000        	call	_TIM2_Cmd
 121                     ; 108 }
 124  0043 81            	ret
 159                     ; 115 void Delay(__IO uint32_t nTime)
 159                     ; 116 {
 160                     	switch	.text
 161  0044               _Delay:
 163       00000000      OFST:	set	0
 166                     ; 117   TimingDelay = nTime;
 168  0044 1e05          	ldw	x,(OFST+5,sp)
 169  0046 bf02          	ldw	L3_TimingDelay+2,x
 170  0048 1e03          	ldw	x,(OFST+3,sp)
 171  004a bf00          	ldw	L3_TimingDelay,x
 173  004c               L35:
 174                     ; 118   while (TimingDelay != 0);
 176  004c ae0000        	ldw	x,#L3_TimingDelay
 177  004f cd0000        	call	c_lzmp
 179  0052 26f8          	jrne	L35
 180                     ; 119 }
 183  0054 81            	ret
 208                     ; 135 void TimingDelay_Decrement(void)
 208                     ; 136 {
 209                     	switch	.text
 210  0055               _TimingDelay_Decrement:
 214                     ; 137   if (TimingDelay != 0x00)
 216  0055 ae0000        	ldw	x,#L3_TimingDelay
 217  0058 cd0000        	call	c_lzmp
 219  005b 2708          	jreq	L76
 220                     ; 139     TimingDelay--;
 222  005d ae0000        	ldw	x,#L3_TimingDelay
 223  0060 a601          	ld	a,#1
 224  0062 cd0000        	call	c_lgsbc
 226  0065               L76:
 227                     ; 141 }
 230  0065 81            	ret
 254                     	switch	.ubsct
 255  0000               L3_TimingDelay:
 256  0000 00000000      	ds.b	4
 257                     	xdef	_TimingDelay_Init
 258                     	xdef	_TimingDelay_Decrement
 259                     	xdef	_Delay
 260                     	xref	_TIM2_ETRClockMode2Config
 261                     	xref	_TIM2_ClearFlag
 262                     	xref	_TIM2_ITConfig
 263                     	xref	_TIM2_Cmd
 264                     	xref	_TIM2_UpdateRequestConfig
 265                     	xref	_TIM2_TimeBaseInit
 266                     	xref	_SYSCFG_REMAPPinConfig
 267                     	xref	_CLK_GetFlagStatus
 268                     	xref	_CLK_PeripheralClockConfig
 269                     	xref	_CLK_LSEConfig
 289                     	xref	c_lgsbc
 290                     	xref	c_lzmp
 291                     	end
