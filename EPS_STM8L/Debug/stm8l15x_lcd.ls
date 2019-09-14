   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  54                     ; 121 void LCD_DeInit(void)
  54                     ; 122 {
  56                     	switch	.text
  57  0000               _LCD_DeInit:
  59  0000 88            	push	a
  60       00000001      OFST:	set	1
  63                     ; 123   uint8_t counter = 0;
  65                     ; 125   LCD->CR1 = LCD_CR1_RESET_VALUE;
  67  0001 725f5400      	clr	21504
  68                     ; 126   LCD->CR2 = LCD_CR2_RESET_VALUE;
  70  0005 725f5401      	clr	21505
  71                     ; 127   LCD->CR3 = LCD_CR3_RESET_VALUE;
  73  0009 725f5402      	clr	21506
  74                     ; 128   LCD->FRQ = LCD_FRQ_RESET_VALUE;
  76  000d 725f5403      	clr	21507
  77                     ; 130   for (counter = 0;counter < 0x05; counter++)
  79  0011 0f01          	clr	(OFST+0,sp)
  80  0013               L72:
  81                     ; 132     LCD->PM[counter] = LCD_PM_RESET_VALUE;
  83  0013 7b01          	ld	a,(OFST+0,sp)
  84  0015 5f            	clrw	x
  85  0016 97            	ld	xl,a
  86  0017 724f5404      	clr	(21508,x)
  87                     ; 130   for (counter = 0;counter < 0x05; counter++)
  89  001b 0c01          	inc	(OFST+0,sp)
  92  001d 7b01          	ld	a,(OFST+0,sp)
  93  001f a105          	cp	a,#5
  94  0021 25f0          	jrult	L72
  95                     ; 135   for (counter = 0;counter < 0x16; counter++)
  97  0023 0f01          	clr	(OFST+0,sp)
  98  0025               L53:
  99                     ; 137     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
 101  0025 7b01          	ld	a,(OFST+0,sp)
 102  0027 5f            	clrw	x
 103  0028 97            	ld	xl,a
 104  0029 724f540c      	clr	(21516,x)
 105                     ; 135   for (counter = 0;counter < 0x16; counter++)
 107  002d 0c01          	inc	(OFST+0,sp)
 110  002f 7b01          	ld	a,(OFST+0,sp)
 111  0031 a116          	cp	a,#22
 112  0033 25f0          	jrult	L53
 113                     ; 140   LCD->CR4 = LCD_CR4_RESET_VALUE;
 115  0035 725f542f      	clr	21551
 116                     ; 142 }
 119  0039 84            	pop	a
 120  003a 81            	ret
 523                     ; 200 void LCD_Init(LCD_Prescaler_TypeDef LCD_Prescaler, LCD_Divider_TypeDef LCD_Divider,
 523                     ; 201               LCD_Duty_TypeDef LCD_Duty, LCD_Bias_TypeDef LCD_Bias,
 523                     ; 202               LCD_VoltageSource_TypeDef LCD_VoltageSource)
 523                     ; 203 {
 524                     	switch	.text
 525  003b               _LCD_Init:
 527  003b 89            	pushw	x
 528       00000000      OFST:	set	0
 531                     ; 205   assert_param(IS_LCD_CLOCK_PRESCALER(LCD_Prescaler));
 533                     ; 206   assert_param(IS_LCD_CLOCK_DIVIDER(LCD_Divider));
 535                     ; 207   assert_param(IS_LCD_DUTY(LCD_Duty));
 537                     ; 208   assert_param(IS_LCD_BIAS(LCD_Bias));
 539                     ; 209   assert_param(IS_LCD_VOLTAGE_SOURCE(LCD_VoltageSource));
 541                     ; 211   LCD->FRQ &= (uint8_t)(~LCD_FRQ_PS);     /* Clear the prescaler bits */
 543  003c c65403        	ld	a,21507
 544  003f a40f          	and	a,#15
 545  0041 c75403        	ld	21507,a
 546                     ; 212   LCD->FRQ |= LCD_Prescaler;
 548  0044 9e            	ld	a,xh
 549  0045 ca5403        	or	a,21507
 550  0048 c75403        	ld	21507,a
 551                     ; 214   LCD->FRQ &= (uint8_t)(~LCD_FRQ_DIV);     /* Clear the divider bits */
 553  004b c65403        	ld	a,21507
 554  004e a4f0          	and	a,#240
 555  0050 c75403        	ld	21507,a
 556                     ; 215   LCD->FRQ |= LCD_Divider;
 558  0053 9f            	ld	a,xl
 559  0054 ca5403        	or	a,21507
 560  0057 c75403        	ld	21507,a
 561                     ; 218   LCD->CR1 &= (uint8_t)(~LCD_CR1_DUTY);    /* Clear the duty bits */
 563  005a c65400        	ld	a,21504
 564  005d a4f9          	and	a,#249
 565  005f c75400        	ld	21504,a
 566                     ; 219   LCD->CR4 &= (uint8_t)(~LCD_CR4_DUTY8);   /* Clear the DUTY8 bit */
 568  0062 7213542f      	bres	21551,#1
 569                     ; 221   if (LCD_Duty == LCD_Duty_1_8)
 571  0066 7b05          	ld	a,(OFST+5,sp)
 572  0068 a120          	cp	a,#32
 573  006a 260f          	jrne	L152
 574                     ; 223     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Duty & (uint8_t)0xF0) >> 4);
 576  006c 7b05          	ld	a,(OFST+5,sp)
 577  006e a4f0          	and	a,#240
 578  0070 4e            	swap	a
 579  0071 a40f          	and	a,#15
 580  0073 ca542f        	or	a,21551
 581  0076 c7542f        	ld	21551,a
 583  0079 200a          	jra	L352
 584  007b               L152:
 585                     ; 227     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Duty & (uint8_t)0x0F);
 587  007b 7b05          	ld	a,(OFST+5,sp)
 588  007d a40f          	and	a,#15
 589  007f ca5400        	or	a,21504
 590  0082 c75400        	ld	21504,a
 591  0085               L352:
 592                     ; 231   LCD->CR1 &= (uint8_t)(~LCD_CR1_B2);      /* Clear the B2 bit */
 594  0085 72115400      	bres	21504,#0
 595                     ; 232   LCD->CR4 &= (uint8_t)(~LCD_CR4_B4);      /* Clear the B4 bit */
 597  0089 7211542f      	bres	21551,#0
 598                     ; 234   if (LCD_Bias == LCD_Bias_1_4)
 600  008d 7b06          	ld	a,(OFST+6,sp)
 601  008f a110          	cp	a,#16
 602  0091 2619          	jrne	L552
 603                     ; 236     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 605  0093 7b06          	ld	a,(OFST+6,sp)
 606  0095 a40f          	and	a,#15
 607  0097 ca5400        	or	a,21504
 608  009a c75400        	ld	21504,a
 609                     ; 237     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Bias & (uint8_t)0xF0) >> 4);
 611  009d 7b06          	ld	a,(OFST+6,sp)
 612  009f a4f0          	and	a,#240
 613  00a1 4e            	swap	a
 614  00a2 a40f          	and	a,#15
 615  00a4 ca542f        	or	a,21551
 616  00a7 c7542f        	ld	21551,a
 618  00aa 200a          	jra	L752
 619  00ac               L552:
 620                     ; 241     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 622  00ac 7b06          	ld	a,(OFST+6,sp)
 623  00ae a40f          	and	a,#15
 624  00b0 ca5400        	or	a,21504
 625  00b3 c75400        	ld	21504,a
 626  00b6               L752:
 627                     ; 244   LCD->CR2 &= (uint8_t)(~LCD_CR2_VSEL);    /* Clear the voltage source bit */
 629  00b6 72115401      	bres	21505,#0
 630                     ; 245   LCD->CR2 |= LCD_VoltageSource;
 632  00ba c65401        	ld	a,21505
 633  00bd 1a07          	or	a,(OFST+7,sp)
 634  00bf c75401        	ld	21505,a
 635                     ; 247 }
 638  00c2 85            	popw	x
 639  00c3 81            	ret
 738                     ; 262 void LCD_PortMaskConfig(LCD_PortMaskRegister_TypeDef LCD_PortMaskRegister, uint8_t LCD_Mask)
 738                     ; 263 {
 739                     	switch	.text
 740  00c4               _LCD_PortMaskConfig:
 742  00c4 89            	pushw	x
 743       00000000      OFST:	set	0
 746                     ; 265   assert_param(IS_LCD_PORT_MASK(LCD_PortMaskRegister));
 748                     ; 268   LCD->PM[LCD_PortMaskRegister] =  LCD_Mask;
 750  00c5 9e            	ld	a,xh
 751  00c6 5f            	clrw	x
 752  00c7 97            	ld	xl,a
 753  00c8 7b02          	ld	a,(OFST+2,sp)
 754  00ca d75404        	ld	(21508,x),a
 755                     ; 270 }
 758  00cd 85            	popw	x
 759  00ce 81            	ret
 814                     ; 279 void LCD_Cmd(FunctionalState NewState)
 814                     ; 280 {
 815                     	switch	.text
 816  00cf               _LCD_Cmd:
 820                     ; 282   assert_param(IS_FUNCTIONAL_STATE(NewState));
 822                     ; 284   if (NewState != DISABLE)
 824  00cf 4d            	tnz	a
 825  00d0 2706          	jreq	L153
 826                     ; 286     LCD->CR3 |= LCD_CR3_LCDEN; /* Enable the LCD peripheral*/
 828  00d2 721c5402      	bset	21506,#6
 830  00d6 2004          	jra	L353
 831  00d8               L153:
 832                     ; 290     LCD->CR3 &= (uint8_t)(~LCD_CR3_LCDEN); /* Disable the LCD peripheral*/
 834  00d8 721d5402      	bres	21506,#6
 835  00dc               L353:
 836                     ; 292 }
 839  00dc 81            	ret
 874                     ; 305 void LCD_HighDriveCmd(FunctionalState NewState)
 874                     ; 306 {
 875                     	switch	.text
 876  00dd               _LCD_HighDriveCmd:
 880                     ; 308   assert_param(IS_FUNCTIONAL_STATE(NewState));
 882                     ; 310   if (NewState != DISABLE)
 884  00dd 4d            	tnz	a
 885  00de 2706          	jreq	L373
 886                     ; 312     LCD->CR2 |= LCD_CR2_HD; /* Permanently enable low resistance divider */
 888  00e0 72185401      	bset	21505,#4
 890  00e4 2004          	jra	L573
 891  00e6               L373:
 892                     ; 316     LCD->CR2 &= (uint8_t)(~LCD_CR2_HD); /* Permanently disable low resistance divider */
 894  00e6 72195401      	bres	21505,#4
 895  00ea               L573:
 896                     ; 318 }
 899  00ea 81            	ret
1006                     ; 335 void LCD_PulseOnDurationConfig(LCD_PulseOnDuration_TypeDef LCD_PulseOnDuration)
1006                     ; 336 {
1007                     	switch	.text
1008  00eb               _LCD_PulseOnDurationConfig:
1010  00eb 88            	push	a
1011       00000000      OFST:	set	0
1014                     ; 338   assert_param(IS_LCD_PULSE_DURATION(LCD_PulseOnDuration));
1016                     ; 340   LCD->CR2 &= (uint8_t)(~LCD_CR2_PON); /* Clear the pulses on duration bits */
1018  00ec c65401        	ld	a,21505
1019  00ef a41f          	and	a,#31
1020  00f1 c75401        	ld	21505,a
1021                     ; 341   LCD->CR2 |= LCD_PulseOnDuration;
1023  00f4 c65401        	ld	a,21505
1024  00f7 1a01          	or	a,(OFST+1,sp)
1025  00f9 c75401        	ld	21505,a
1026                     ; 342 }
1029  00fc 84            	pop	a
1030  00fd 81            	ret
1127                     ; 358 void LCD_DeadTimeConfig(LCD_DeadTime_TypeDef LCD_DeadTime)
1127                     ; 359 {
1128                     	switch	.text
1129  00fe               _LCD_DeadTimeConfig:
1131  00fe 88            	push	a
1132       00000000      OFST:	set	0
1135                     ; 361   assert_param(IS_LCD_DEAD_TIME(LCD_DeadTime));
1137                     ; 363   LCD->CR3 &= (uint8_t)(~LCD_CR3_DEAD);  /* Clear the dead time bits  */
1139  00ff c65402        	ld	a,21506
1140  0102 a4f8          	and	a,#248
1141  0104 c75402        	ld	21506,a
1142                     ; 365   LCD->CR3 |= LCD_DeadTime;
1144  0107 c65402        	ld	a,21506
1145  010a 1a01          	or	a,(OFST+1,sp)
1146  010c c75402        	ld	21506,a
1147                     ; 367 }
1150  010f 84            	pop	a
1151  0110 81            	ret
1303                     ; 391 void LCD_BlinkConfig(LCD_BlinkMode_TypeDef LCD_BlinkMode, LCD_BlinkFrequency_TypeDef LCD_BlinkFrequency)
1303                     ; 392 {
1304                     	switch	.text
1305  0111               _LCD_BlinkConfig:
1309                     ; 394   assert_param(IS_LCD_BLINK_MODE(LCD_BlinkMode));
1311                     ; 395   assert_param(IS_LCD_BLINK_FREQUENCY(LCD_BlinkFrequency));
1313                     ; 397   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINK); /* Clear the blink mode bits */
1315  0111 c65400        	ld	a,21504
1316  0114 a43f          	and	a,#63
1317  0116 c75400        	ld	21504,a
1318                     ; 398   LCD->CR1 |= LCD_BlinkMode; /* Config the LCD Blink Mode */
1320  0119 9e            	ld	a,xh
1321  011a ca5400        	or	a,21504
1322  011d c75400        	ld	21504,a
1323                     ; 400   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINKF); /* Clear the blink frequency bits */
1325  0120 c65400        	ld	a,21504
1326  0123 a4c7          	and	a,#199
1327  0125 c75400        	ld	21504,a
1328                     ; 401   LCD->CR1 |= LCD_BlinkFrequency; /* Config the LCD Blink Frequency */
1330  0128 9f            	ld	a,xl
1331  0129 ca5400        	or	a,21504
1332  012c c75400        	ld	21504,a
1333                     ; 403 }
1336  012f 81            	ret
1441                     ; 419 void LCD_ContrastConfig(LCD_Contrast_TypeDef LCD_Contrast)
1441                     ; 420 {
1442                     	switch	.text
1443  0130               _LCD_ContrastConfig:
1445  0130 88            	push	a
1446       00000000      OFST:	set	0
1449                     ; 422   assert_param(IS_LCD_CONTRAST(LCD_Contrast));
1451                     ; 424   LCD->CR2 &= (uint8_t)(~LCD_CR2_CC); /* Clear the contrast bits  */
1453  0131 c65401        	ld	a,21505
1454  0134 a4f1          	and	a,#241
1455  0136 c75401        	ld	21505,a
1456                     ; 425   LCD->CR2 |= LCD_Contrast; /* Select the maximum voltage value Vlcd */
1458  0139 c65401        	ld	a,21505
1459  013c 1a01          	or	a,(OFST+1,sp)
1460  013e c75401        	ld	21505,a
1461                     ; 427 }
1464  0141 84            	pop	a
1465  0142 81            	ret
1669                     ; 474 void LCD_WriteRAM(LCD_RAMRegister_TypeDef LCD_RAMRegister, uint8_t LCD_Data)
1669                     ; 475 {
1670                     	switch	.text
1671  0143               _LCD_WriteRAM:
1673  0143 89            	pushw	x
1674       00000000      OFST:	set	0
1677                     ; 477   assert_param(IS_LCD_RAM_REGISTER(LCD_RAMRegister));
1679                     ; 480   LCD->RAM[LCD_RAMRegister] =  LCD_Data;
1681  0144 9e            	ld	a,xh
1682  0145 5f            	clrw	x
1683  0146 97            	ld	xl,a
1684  0147 7b02          	ld	a,(OFST+2,sp)
1685  0149 d7540c        	ld	(21516,x),a
1686                     ; 482 }
1689  014c 85            	popw	x
1690  014d 81            	ret
1747                     ; 492 void LCD_PageSelect(LCD_PageSelection_TypeDef LCD_PageSelection)
1747                     ; 493 {
1748                     	switch	.text
1749  014e               _LCD_PageSelect:
1753                     ; 495   assert_param(IS_LCD_PAGE_SELECT(LCD_PageSelection));
1755                     ; 497   LCD->CR4 &= (uint8_t)(~LCD_CR4_PAGECOM); /* Clear the PAGE COM bit */
1757  014e 7215542f      	bres	21551,#2
1758                     ; 498   LCD->CR4 |= LCD_PageSelection; /* Select the LCD page */
1760  0152 ca542f        	or	a,21551
1761  0155 c7542f        	ld	21551,a
1762                     ; 500 }
1765  0158 81            	ret
1800                     ; 525 void LCD_ITConfig(FunctionalState NewState)
1800                     ; 526 {
1801                     	switch	.text
1802  0159               _LCD_ITConfig:
1806                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1808                     ; 530   if (NewState != DISABLE)
1810  0159 4d            	tnz	a
1811  015a 2706          	jreq	L577
1812                     ; 532     LCD->CR3 |= LCD_CR3_SOFIE; /* Enable interrupt*/
1814  015c 721a5402      	bset	21506,#5
1816  0160 2004          	jra	L777
1817  0162               L577:
1818                     ; 536     LCD->CR3 &= (uint8_t)(~LCD_CR3_SOFIE); /* Disable interrupt*/
1820  0162 721b5402      	bres	21506,#5
1821  0166               L777:
1822                     ; 539 }
1825  0166 81            	ret
1881                     ; 546 FlagStatus LCD_GetFlagStatus(void)
1881                     ; 547 {
1882                     	switch	.text
1883  0167               _LCD_GetFlagStatus:
1885  0167 88            	push	a
1886       00000001      OFST:	set	1
1889                     ; 548   FlagStatus status = RESET;
1891                     ; 551   if ((LCD->CR3 & (uint8_t)LCD_CR3_SOF) != (uint8_t)RESET)
1893  0168 c65402        	ld	a,21506
1894  016b a510          	bcp	a,#16
1895  016d 2706          	jreq	L7201
1896                     ; 553     status = SET; /* Flag is set */
1898  016f a601          	ld	a,#1
1899  0171 6b01          	ld	(OFST+0,sp),a
1901  0173 2002          	jra	L1301
1902  0175               L7201:
1903                     ; 557     status = RESET; /* Flag is reset*/
1905  0175 0f01          	clr	(OFST+0,sp)
1906  0177               L1301:
1907                     ; 560   return status;
1909  0177 7b01          	ld	a,(OFST+0,sp)
1912  0179 5b01          	addw	sp,#1
1913  017b 81            	ret
1936                     ; 569 void LCD_ClearFlag(void)
1936                     ; 570 {
1937                     	switch	.text
1938  017c               _LCD_ClearFlag:
1942                     ; 572   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
1944  017c 72165402      	bset	21506,#3
1945                     ; 574 }
1948  0180 81            	ret
1993                     ; 582 ITStatus LCD_GetITStatus(void)
1993                     ; 583 {
1994                     	switch	.text
1995  0181               _LCD_GetITStatus:
1997  0181 88            	push	a
1998       00000001      OFST:	set	1
2001                     ; 584   ITStatus pendingbitstatus = RESET;
2003                     ; 585   uint8_t enablestatus = 0;
2005                     ; 587   enablestatus = (uint8_t)((uint8_t)LCD->CR3 & LCD_CR3_SOFIE);
2007  0182 c65402        	ld	a,21506
2008  0185 a420          	and	a,#32
2009  0187 6b01          	ld	(OFST+0,sp),a
2010                     ; 589   if (((LCD->CR3 & LCD_CR3_SOF) != RESET) && enablestatus)
2012  0189 c65402        	ld	a,21506
2013  018c a510          	bcp	a,#16
2014  018e 270a          	jreq	L5601
2016  0190 0d01          	tnz	(OFST+0,sp)
2017  0192 2706          	jreq	L5601
2018                     ; 592     pendingbitstatus = SET;
2020  0194 a601          	ld	a,#1
2021  0196 6b01          	ld	(OFST+0,sp),a
2023  0198 2002          	jra	L7601
2024  019a               L5601:
2025                     ; 597     pendingbitstatus = RESET;
2027  019a 0f01          	clr	(OFST+0,sp)
2028  019c               L7601:
2029                     ; 600   return  pendingbitstatus;
2031  019c 7b01          	ld	a,(OFST+0,sp)
2034  019e 5b01          	addw	sp,#1
2035  01a0 81            	ret
2059                     ; 609 void LCD_ClearITPendingBit(void)
2059                     ; 610 {
2060                     	switch	.text
2061  01a1               _LCD_ClearITPendingBit:
2065                     ; 612   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
2067  01a1 72165402      	bset	21506,#3
2068                     ; 614 }
2071  01a5 81            	ret
2084                     	xdef	_LCD_ClearITPendingBit
2085                     	xdef	_LCD_GetITStatus
2086                     	xdef	_LCD_ClearFlag
2087                     	xdef	_LCD_GetFlagStatus
2088                     	xdef	_LCD_ITConfig
2089                     	xdef	_LCD_PageSelect
2090                     	xdef	_LCD_WriteRAM
2091                     	xdef	_LCD_ContrastConfig
2092                     	xdef	_LCD_BlinkConfig
2093                     	xdef	_LCD_DeadTimeConfig
2094                     	xdef	_LCD_PulseOnDurationConfig
2095                     	xdef	_LCD_HighDriveCmd
2096                     	xdef	_LCD_Cmd
2097                     	xdef	_LCD_PortMaskConfig
2098                     	xdef	_LCD_Init
2099                     	xdef	_LCD_DeInit
2118                     	end
