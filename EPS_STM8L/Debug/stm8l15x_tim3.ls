   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  43                     ; 168 void TIM3_DeInit(void)
  43                     ; 169 {
  45                     	switch	.text
  46  0000               _TIM3_DeInit:
  50                     ; 170   TIM3->CR1 = TIM_CR1_RESET_VALUE;
  52  0000 725f5280      	clr	21120
  53                     ; 171   TIM3->CR2 = TIM_CR2_RESET_VALUE;
  55  0004 725f5281      	clr	21121
  56                     ; 172   TIM3->SMCR = TIM_SMCR_RESET_VALUE;
  58  0008 725f5282      	clr	21122
  59                     ; 173   TIM3->ETR = TIM_ETR_RESET_VALUE;
  61  000c 725f5283      	clr	21123
  62                     ; 174   TIM3->IER = TIM_IER_RESET_VALUE;
  64  0010 725f5285      	clr	21125
  65                     ; 175   TIM3->SR2 = TIM_SR2_RESET_VALUE;
  67  0014 725f5287      	clr	21127
  68                     ; 178   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  70  0018 725f528b      	clr	21131
  71                     ; 180   TIM3->CCMR1 = 0x01;/*TIM3_ICxSource_TIxFPx */
  73  001c 35015289      	mov	21129,#1
  74                     ; 181   TIM3->CCMR2 = 0x01;/*TIM3_ICxSource_TIxFPx */
  76  0020 3501528a      	mov	21130,#1
  77                     ; 184   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  79  0024 725f528b      	clr	21131
  80                     ; 185   TIM3->CCMR1 = TIM_CCMR1_RESET_VALUE;
  82  0028 725f5289      	clr	21129
  83                     ; 186   TIM3->CCMR2 = TIM_CCMR2_RESET_VALUE;
  85  002c 725f528a      	clr	21130
  86                     ; 188   TIM3->CNTRH = TIM_CNTRH_RESET_VALUE;
  88  0030 725f528c      	clr	21132
  89                     ; 189   TIM3->CNTRL = TIM_CNTRL_RESET_VALUE;
  91  0034 725f528d      	clr	21133
  92                     ; 191   TIM3->PSCR = TIM_PSCR_RESET_VALUE;
  94  0038 725f528e      	clr	21134
  95                     ; 193   TIM3->ARRH = TIM_ARRH_RESET_VALUE;
  97  003c 35ff528f      	mov	21135,#255
  98                     ; 194   TIM3->ARRL = TIM_ARRL_RESET_VALUE;
 100  0040 35ff5290      	mov	21136,#255
 101                     ; 196   TIM3->CCR1H = TIM_CCR1H_RESET_VALUE;
 103  0044 725f5291      	clr	21137
 104                     ; 197   TIM3->CCR1L = TIM_CCR1L_RESET_VALUE;
 106  0048 725f5292      	clr	21138
 107                     ; 198   TIM3->CCR2H = TIM_CCR2H_RESET_VALUE;
 109  004c 725f5293      	clr	21139
 110                     ; 199   TIM3->CCR2L = TIM_CCR2L_RESET_VALUE;
 112  0050 725f5294      	clr	21140
 113                     ; 202   TIM3->OISR = TIM_OISR_RESET_VALUE;
 115  0054 725f5296      	clr	21142
 116                     ; 203   TIM3->EGR = 0x01;/* TIM_EGR_UG */
 118  0058 35015288      	mov	21128,#1
 119                     ; 204   TIM3->BKR = TIM_BKR_RESET_VALUE;
 121  005c 725f5295      	clr	21141
 122                     ; 205   TIM3->SR1 = TIM_SR1_RESET_VALUE;
 124  0060 725f5286      	clr	21126
 125                     ; 206 }
 128  0064 81            	ret
 290                     ; 231 void TIM3_TimeBaseInit(TIM3_Prescaler_TypeDef TIM3_Prescaler,
 290                     ; 232                        TIM3_CounterMode_TypeDef TIM3_CounterMode,
 290                     ; 233                        uint16_t TIM3_Period)
 290                     ; 234 {
 291                     	switch	.text
 292  0065               _TIM3_TimeBaseInit:
 294  0065 89            	pushw	x
 295       00000000      OFST:	set	0
 298                     ; 236   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
 300                     ; 237   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
 302                     ; 242   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8) ;
 304  0066 7b05          	ld	a,(OFST+5,sp)
 305  0068 c7528f        	ld	21135,a
 306                     ; 243   TIM3->ARRL = (uint8_t)(TIM3_Period);
 308  006b 7b06          	ld	a,(OFST+6,sp)
 309  006d c75290        	ld	21136,a
 310                     ; 246   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 312  0070 9e            	ld	a,xh
 313  0071 c7528e        	ld	21134,a
 314                     ; 249   TIM3->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 316  0074 c65280        	ld	a,21120
 317  0077 a48f          	and	a,#143
 318  0079 c75280        	ld	21120,a
 319                     ; 250   TIM3->CR1 |= (uint8_t)(TIM3_CounterMode);
 321  007c 9f            	ld	a,xl
 322  007d ca5280        	or	a,21120
 323  0080 c75280        	ld	21120,a
 324                     ; 253   TIM3->EGR = TIM3_EventSource_Update;
 326  0083 35015288      	mov	21128,#1
 327                     ; 254 }
 330  0087 85            	popw	x
 331  0088 81            	ret
 399                     ; 274 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
 399                     ; 275                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
 399                     ; 276 {
 400                     	switch	.text
 401  0089               _TIM3_PrescalerConfig:
 405                     ; 278   assert_param(IS_TIM3_PRESCALER(Prescaler));
 407                     ; 279   assert_param(IS_TIM3_PRESCALER_RELOAD(TIM3_PSCReloadMode));
 409                     ; 282   TIM3->PSCR = (uint8_t)(Prescaler);
 411  0089 9e            	ld	a,xh
 412  008a c7528e        	ld	21134,a
 413                     ; 285   if (TIM3_PSCReloadMode == TIM3_PSCReloadMode_Immediate)
 415  008d 9f            	ld	a,xl
 416  008e a101          	cp	a,#1
 417  0090 2606          	jrne	L741
 418                     ; 287     TIM3->EGR |= TIM_EGR_UG ;
 420  0092 72105288      	bset	21128,#0
 422  0096 2004          	jra	L151
 423  0098               L741:
 424                     ; 291     TIM3->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 426  0098 72115288      	bres	21128,#0
 427  009c               L151:
 428                     ; 293 }
 431  009c 81            	ret
 476                     ; 306 void TIM3_CounterModeConfig(TIM3_CounterMode_TypeDef TIM3_CounterMode)
 476                     ; 307 {
 477                     	switch	.text
 478  009d               _TIM3_CounterModeConfig:
 480  009d 88            	push	a
 481  009e 88            	push	a
 482       00000001      OFST:	set	1
 485                     ; 308   uint8_t tmpcr1 = 0;
 487                     ; 311   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
 489                     ; 313   tmpcr1 = TIM3->CR1;
 491  009f c65280        	ld	a,21120
 492  00a2 6b01          	ld	(OFST+0,sp),a
 493                     ; 316   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 495  00a4 7b01          	ld	a,(OFST+0,sp)
 496  00a6 a48f          	and	a,#143
 497  00a8 6b01          	ld	(OFST+0,sp),a
 498                     ; 319   tmpcr1 |= (uint8_t)TIM3_CounterMode;
 500  00aa 7b01          	ld	a,(OFST+0,sp)
 501  00ac 1a02          	or	a,(OFST+1,sp)
 502  00ae 6b01          	ld	(OFST+0,sp),a
 503                     ; 321   TIM3->CR1 = tmpcr1;
 505  00b0 7b01          	ld	a,(OFST+0,sp)
 506  00b2 c75280        	ld	21120,a
 507                     ; 322 }
 510  00b5 85            	popw	x
 511  00b6 81            	ret
 545                     ; 330 void TIM3_SetCounter(uint16_t Counter)
 545                     ; 331 {
 546                     	switch	.text
 547  00b7               _TIM3_SetCounter:
 551                     ; 334   TIM3->CNTRH = (uint8_t)(Counter >> 8);
 553  00b7 9e            	ld	a,xh
 554  00b8 c7528c        	ld	21132,a
 555                     ; 335   TIM3->CNTRL = (uint8_t)(Counter);
 557  00bb 9f            	ld	a,xl
 558  00bc c7528d        	ld	21133,a
 559                     ; 336 }
 562  00bf 81            	ret
 596                     ; 344 void TIM3_SetAutoreload(uint16_t Autoreload)
 596                     ; 345 {
 597                     	switch	.text
 598  00c0               _TIM3_SetAutoreload:
 602                     ; 347   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
 604  00c0 9e            	ld	a,xh
 605  00c1 c7528f        	ld	21135,a
 606                     ; 348   TIM3->ARRL = (uint8_t)(Autoreload);
 608  00c4 9f            	ld	a,xl
 609  00c5 c75290        	ld	21136,a
 610                     ; 349 }
 613  00c8 81            	ret
 665                     ; 356 uint16_t TIM3_GetCounter(void)
 665                     ; 357 {
 666                     	switch	.text
 667  00c9               _TIM3_GetCounter:
 669  00c9 5204          	subw	sp,#4
 670       00000004      OFST:	set	4
 673                     ; 358   uint16_t tmpcnt = 0;
 675                     ; 361   tmpcntrh = TIM3->CNTRH;
 677  00cb c6528c        	ld	a,21132
 678  00ce 6b02          	ld	(OFST-2,sp),a
 679                     ; 362   tmpcntrl = TIM3->CNTRL;
 681  00d0 c6528d        	ld	a,21133
 682  00d3 6b01          	ld	(OFST-3,sp),a
 683                     ; 364   tmpcnt = (uint16_t)(tmpcntrl);
 685  00d5 7b01          	ld	a,(OFST-3,sp)
 686  00d7 5f            	clrw	x
 687  00d8 97            	ld	xl,a
 688  00d9 1f03          	ldw	(OFST-1,sp),x
 689                     ; 365   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 691  00db 7b02          	ld	a,(OFST-2,sp)
 692  00dd 5f            	clrw	x
 693  00de 97            	ld	xl,a
 694  00df 4f            	clr	a
 695  00e0 02            	rlwa	x,a
 696  00e1 01            	rrwa	x,a
 697  00e2 1a04          	or	a,(OFST+0,sp)
 698  00e4 01            	rrwa	x,a
 699  00e5 1a03          	or	a,(OFST-1,sp)
 700  00e7 01            	rrwa	x,a
 701  00e8 1f03          	ldw	(OFST-1,sp),x
 702                     ; 367   return ((uint16_t)tmpcnt);
 704  00ea 1e03          	ldw	x,(OFST-1,sp)
 707  00ec 5b04          	addw	sp,#4
 708  00ee 81            	ret
 732                     ; 383 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
 732                     ; 384 {
 733                     	switch	.text
 734  00ef               _TIM3_GetPrescaler:
 738                     ; 386   return ((TIM3_Prescaler_TypeDef)TIM3->PSCR);
 740  00ef c6528e        	ld	a,21134
 743  00f2 81            	ret
 799                     ; 396 void TIM3_UpdateDisableConfig(FunctionalState NewState)
 799                     ; 397 {
 800                     	switch	.text
 801  00f3               _TIM3_UpdateDisableConfig:
 805                     ; 399   assert_param(IS_FUNCTIONAL_STATE(NewState));
 807                     ; 402   if (NewState != DISABLE)
 809  00f3 4d            	tnz	a
 810  00f4 2706          	jreq	L513
 811                     ; 404     TIM3->CR1 |= TIM_CR1_UDIS;
 813  00f6 72125280      	bset	21120,#1
 815  00fa 2004          	jra	L713
 816  00fc               L513:
 817                     ; 408     TIM3->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 819  00fc 72135280      	bres	21120,#1
 820  0100               L713:
 821                     ; 410 }
 824  0100 81            	ret
 882                     ; 420 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
 882                     ; 421 {
 883                     	switch	.text
 884  0101               _TIM3_UpdateRequestConfig:
 888                     ; 423   assert_param(IS_TIM3_UPDATE_SOURCE(TIM3_UpdateSource));
 890                     ; 426   if (TIM3_UpdateSource == TIM3_UpdateSource_Regular)
 892  0101 a101          	cp	a,#1
 893  0103 2606          	jrne	L743
 894                     ; 428     TIM3->CR1 |= TIM_CR1_URS ;
 896  0105 72145280      	bset	21120,#2
 898  0109 2004          	jra	L153
 899  010b               L743:
 900                     ; 432     TIM3->CR1 &= (uint8_t)(~TIM_CR1_URS);
 902  010b 72155280      	bres	21120,#2
 903  010f               L153:
 904                     ; 434 }
 907  010f 81            	ret
 943                     ; 442 void TIM3_ARRPreloadConfig(FunctionalState NewState)
 943                     ; 443 {
 944                     	switch	.text
 945  0110               _TIM3_ARRPreloadConfig:
 949                     ; 445   assert_param(IS_FUNCTIONAL_STATE(NewState));
 951                     ; 448   if (NewState != DISABLE)
 953  0110 4d            	tnz	a
 954  0111 2706          	jreq	L173
 955                     ; 450     TIM3->CR1 |= TIM_CR1_ARPE;
 957  0113 721e5280      	bset	21120,#7
 959  0117 2004          	jra	L373
 960  0119               L173:
 961                     ; 454     TIM3->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 963  0119 721f5280      	bres	21120,#7
 964  011d               L373:
 965                     ; 456 }
 968  011d 81            	ret
1025                     ; 466 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1025                     ; 467 {
1026                     	switch	.text
1027  011e               _TIM3_SelectOnePulseMode:
1031                     ; 469   assert_param(IS_TIM3_OPM_MODE(TIM3_OPMode));
1033                     ; 472   if (TIM3_OPMode == TIM3_OPMode_Single)
1035  011e a101          	cp	a,#1
1036  0120 2606          	jrne	L324
1037                     ; 474     TIM3->CR1 |= TIM_CR1_OPM ;
1039  0122 72165280      	bset	21120,#3
1041  0126 2004          	jra	L524
1042  0128               L324:
1043                     ; 478     TIM3->CR1 &= (uint8_t)(~TIM_CR1_OPM);
1045  0128 72175280      	bres	21120,#3
1046  012c               L524:
1047                     ; 480 }
1050  012c 81            	ret
1085                     ; 488 void TIM3_Cmd(FunctionalState NewState)
1085                     ; 489 {
1086                     	switch	.text
1087  012d               _TIM3_Cmd:
1091                     ; 491   assert_param(IS_FUNCTIONAL_STATE(NewState));
1093                     ; 494   if (NewState != DISABLE)
1095  012d 4d            	tnz	a
1096  012e 2706          	jreq	L544
1097                     ; 496     TIM3->CR1 |= TIM_CR1_CEN;
1099  0130 72105280      	bset	21120,#0
1101  0134 2004          	jra	L744
1102  0136               L544:
1103                     ; 500     TIM3->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1105  0136 72115280      	bres	21120,#0
1106  013a               L744:
1107                     ; 502 }
1110  013a 81            	ret
1308                     ; 578 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
1308                     ; 579                   TIM3_OutputState_TypeDef TIM3_OutputState,
1308                     ; 580                   uint16_t TIM3_Pulse,
1308                     ; 581                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
1308                     ; 582                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
1308                     ; 583 {
1309                     	switch	.text
1310  013b               _TIM3_OC1Init:
1312  013b 89            	pushw	x
1313  013c 88            	push	a
1314       00000001      OFST:	set	1
1317                     ; 584   uint8_t tmpccmr1 = 0;
1319                     ; 587   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
1321                     ; 588   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
1323                     ; 589   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
1325                     ; 590   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
1327                     ; 592   tmpccmr1 = TIM3->CCMR1;
1329  013d c65289        	ld	a,21129
1330  0140 6b01          	ld	(OFST+0,sp),a
1331                     ; 595   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1333  0142 7211528b      	bres	21131,#0
1334                     ; 597   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1336  0146 7b01          	ld	a,(OFST+0,sp)
1337  0148 a48f          	and	a,#143
1338  014a 6b01          	ld	(OFST+0,sp),a
1339                     ; 600   tmpccmr1 |= (uint8_t)TIM3_OCMode;
1341  014c 9e            	ld	a,xh
1342  014d 1a01          	or	a,(OFST+0,sp)
1343  014f 6b01          	ld	(OFST+0,sp),a
1344                     ; 602   TIM3->CCMR1 = tmpccmr1;
1346  0151 7b01          	ld	a,(OFST+0,sp)
1347  0153 c75289        	ld	21129,a
1348                     ; 605   if (TIM3_OutputState == TIM3_OutputState_Enable)
1350  0156 9f            	ld	a,xl
1351  0157 a101          	cp	a,#1
1352  0159 2606          	jrne	L365
1353                     ; 607     TIM3->CCER1 |= TIM_CCER1_CC1E;
1355  015b 7210528b      	bset	21131,#0
1357  015f 2004          	jra	L565
1358  0161               L365:
1359                     ; 611     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1361  0161 7211528b      	bres	21131,#0
1362  0165               L565:
1363                     ; 615   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
1365  0165 7b08          	ld	a,(OFST+7,sp)
1366  0167 a101          	cp	a,#1
1367  0169 2606          	jrne	L765
1368                     ; 617     TIM3->CCER1 |= TIM_CCER1_CC1P;
1370  016b 7212528b      	bset	21131,#1
1372  016f 2004          	jra	L175
1373  0171               L765:
1374                     ; 621     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1376  0171 7213528b      	bres	21131,#1
1377  0175               L175:
1378                     ; 625   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
1380  0175 7b09          	ld	a,(OFST+8,sp)
1381  0177 a101          	cp	a,#1
1382  0179 2606          	jrne	L375
1383                     ; 627     TIM3->OISR |= TIM_OISR_OIS1;
1385  017b 72105296      	bset	21142,#0
1387  017f 2004          	jra	L575
1388  0181               L375:
1389                     ; 631     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1391  0181 72115296      	bres	21142,#0
1392  0185               L575:
1393                     ; 635   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
1395  0185 7b06          	ld	a,(OFST+5,sp)
1396  0187 c75291        	ld	21137,a
1397                     ; 636   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
1399  018a 7b07          	ld	a,(OFST+6,sp)
1400  018c c75292        	ld	21138,a
1401                     ; 637 }
1404  018f 5b03          	addw	sp,#3
1405  0191 81            	ret
1488                     ; 664 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
1488                     ; 665                   TIM3_OutputState_TypeDef TIM3_OutputState,
1488                     ; 666                   uint16_t TIM3_Pulse,
1488                     ; 667                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
1488                     ; 668                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
1488                     ; 669 {
1489                     	switch	.text
1490  0192               _TIM3_OC2Init:
1492  0192 89            	pushw	x
1493  0193 88            	push	a
1494       00000001      OFST:	set	1
1497                     ; 670   uint8_t tmpccmr2 = 0;
1499                     ; 673   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
1501                     ; 674   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
1503                     ; 675   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
1505                     ; 676   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
1507                     ; 678   tmpccmr2 = TIM3->CCMR2;
1509  0194 c6528a        	ld	a,21130
1510  0197 6b01          	ld	(OFST+0,sp),a
1511                     ; 681   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1513  0199 7219528b      	bres	21131,#4
1514                     ; 684   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1516  019d 7b01          	ld	a,(OFST+0,sp)
1517  019f a48f          	and	a,#143
1518  01a1 6b01          	ld	(OFST+0,sp),a
1519                     ; 687   tmpccmr2 |= (uint8_t)TIM3_OCMode;
1521  01a3 9e            	ld	a,xh
1522  01a4 1a01          	or	a,(OFST+0,sp)
1523  01a6 6b01          	ld	(OFST+0,sp),a
1524                     ; 689   TIM3->CCMR2 = tmpccmr2;
1526  01a8 7b01          	ld	a,(OFST+0,sp)
1527  01aa c7528a        	ld	21130,a
1528                     ; 692   if (TIM3_OutputState == TIM3_OutputState_Enable)
1530  01ad 9f            	ld	a,xl
1531  01ae a101          	cp	a,#1
1532  01b0 2606          	jrne	L146
1533                     ; 694     TIM3->CCER1 |= TIM_CCER1_CC2E;
1535  01b2 7218528b      	bset	21131,#4
1537  01b6 2004          	jra	L346
1538  01b8               L146:
1539                     ; 698     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1541  01b8 7219528b      	bres	21131,#4
1542  01bc               L346:
1543                     ; 702   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
1545  01bc 7b08          	ld	a,(OFST+7,sp)
1546  01be a101          	cp	a,#1
1547  01c0 2606          	jrne	L546
1548                     ; 704     TIM3->CCER1 |= TIM_CCER1_CC2P;
1550  01c2 721a528b      	bset	21131,#5
1552  01c6 2004          	jra	L746
1553  01c8               L546:
1554                     ; 708     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1556  01c8 721b528b      	bres	21131,#5
1557  01cc               L746:
1558                     ; 713   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
1560  01cc 7b09          	ld	a,(OFST+8,sp)
1561  01ce a101          	cp	a,#1
1562  01d0 2606          	jrne	L156
1563                     ; 715     TIM3->OISR |= TIM_OISR_OIS2;
1565  01d2 72145296      	bset	21142,#2
1567  01d6 2004          	jra	L356
1568  01d8               L156:
1569                     ; 719     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1571  01d8 72155296      	bres	21142,#2
1572  01dc               L356:
1573                     ; 723   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
1575  01dc 7b06          	ld	a,(OFST+5,sp)
1576  01de c75293        	ld	21139,a
1577                     ; 724   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
1579  01e1 7b07          	ld	a,(OFST+6,sp)
1580  01e3 c75294        	ld	21140,a
1581                     ; 725 }
1584  01e6 5b03          	addw	sp,#3
1585  01e8 81            	ret
1783                     ; 754 void TIM3_BKRConfig(TIM3_OSSIState_TypeDef TIM3_OSSIState,
1783                     ; 755                     TIM3_LockLevel_TypeDef TIM3_LockLevel,
1783                     ; 756                     TIM3_BreakState_TypeDef TIM3_BreakState,
1783                     ; 757                     TIM3_BreakPolarity_TypeDef TIM3_BreakPolarity,
1783                     ; 758                     TIM3_AutomaticOutput_TypeDef TIM3_AutomaticOutput)
1783                     ; 759 
1783                     ; 760 {
1784                     	switch	.text
1785  01e9               _TIM3_BKRConfig:
1787  01e9 89            	pushw	x
1788  01ea 88            	push	a
1789       00000001      OFST:	set	1
1792                     ; 762   assert_param(IS_TIM3_OSSI_STATE(TIM3_OSSIState));
1794                     ; 763   assert_param(IS_TIM3_LOCK_LEVEL(TIM3_LockLevel));
1796                     ; 764   assert_param(IS_TIM3_BREAK_STATE(TIM3_BreakState));
1798                     ; 765   assert_param(IS_TIM3_BREAK_POLARITY(TIM3_BreakPolarity));
1800                     ; 766   assert_param(IS_TIM3_AUTOMATIC_OUTPUT_STATE(TIM3_AutomaticOutput));
1802                     ; 772   TIM3->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM3_OSSIState | (uint8_t)TIM3_LockLevel) | \
1802                     ; 773                                   (uint8_t)((uint8_t)TIM3_BreakState | (uint8_t)TIM3_BreakPolarity)) | \
1802                     ; 774                                   TIM3_AutomaticOutput));
1804  01eb 7b06          	ld	a,(OFST+5,sp)
1805  01ed 1a07          	or	a,(OFST+6,sp)
1806  01ef 6b01          	ld	(OFST+0,sp),a
1807  01f1 9f            	ld	a,xl
1808  01f2 1a02          	or	a,(OFST+1,sp)
1809  01f4 1a01          	or	a,(OFST+0,sp)
1810  01f6 1a08          	or	a,(OFST+7,sp)
1811  01f8 c75295        	ld	21141,a
1812                     ; 775 }
1815  01fb 5b03          	addw	sp,#3
1816  01fd 81            	ret
1852                     ; 783 void TIM3_CtrlPWMOutputs(FunctionalState NewState)
1852                     ; 784 {
1853                     	switch	.text
1854  01fe               _TIM3_CtrlPWMOutputs:
1858                     ; 786   assert_param(IS_FUNCTIONAL_STATE(NewState));
1860                     ; 790   if (NewState != DISABLE)
1862  01fe 4d            	tnz	a
1863  01ff 2706          	jreq	L5001
1864                     ; 792     TIM3->BKR |= TIM_BKR_MOE ;
1866  0201 721e5295      	bset	21141,#7
1868  0205 2004          	jra	L7001
1869  0207               L5001:
1870                     ; 796     TIM3->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1872  0207 721f5295      	bres	21141,#7
1873  020b               L7001:
1874                     ; 798 }
1877  020b 81            	ret
1942                     ; 818 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel,
1942                     ; 819                      TIM3_OCMode_TypeDef TIM3_OCMode)
1942                     ; 820 {
1943                     	switch	.text
1944  020c               _TIM3_SelectOCxM:
1946  020c 89            	pushw	x
1947       00000000      OFST:	set	0
1950                     ; 822   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1952                     ; 823   assert_param(IS_TIM3_OCM(TIM3_OCMode));
1954                     ; 825   if (TIM3_Channel == TIM3_Channel_1)
1956  020d 9e            	ld	a,xh
1957  020e 4d            	tnz	a
1958  020f 2615          	jrne	L3401
1959                     ; 828     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1961  0211 7211528b      	bres	21131,#0
1962                     ; 831     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1964  0215 c65289        	ld	a,21129
1965  0218 a48f          	and	a,#143
1966  021a c75289        	ld	21129,a
1967                     ; 834     TIM3->CCMR1 |= (uint8_t)TIM3_OCMode;
1969  021d 9f            	ld	a,xl
1970  021e ca5289        	or	a,21129
1971  0221 c75289        	ld	21129,a
1973  0224 2014          	jra	L5401
1974  0226               L3401:
1975                     ; 839     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1977  0226 7219528b      	bres	21131,#4
1978                     ; 842     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1980  022a c6528a        	ld	a,21130
1981  022d a48f          	and	a,#143
1982  022f c7528a        	ld	21130,a
1983                     ; 845     TIM3->CCMR2 |= (uint8_t)TIM3_OCMode;
1985  0232 c6528a        	ld	a,21130
1986  0235 1a02          	or	a,(OFST+2,sp)
1987  0237 c7528a        	ld	21130,a
1988  023a               L5401:
1989                     ; 847 }
1992  023a 85            	popw	x
1993  023b 81            	ret
2027                     ; 855 void TIM3_SetCompare1(uint16_t Compare)
2027                     ; 856 {
2028                     	switch	.text
2029  023c               _TIM3_SetCompare1:
2033                     ; 858   TIM3->CCR1H = (uint8_t)(Compare >> 8);
2035  023c 9e            	ld	a,xh
2036  023d c75291        	ld	21137,a
2037                     ; 859   TIM3->CCR1L = (uint8_t)(Compare);
2039  0240 9f            	ld	a,xl
2040  0241 c75292        	ld	21138,a
2041                     ; 860 }
2044  0244 81            	ret
2078                     ; 868 void TIM3_SetCompare2(uint16_t Compare)
2078                     ; 869 {
2079                     	switch	.text
2080  0245               _TIM3_SetCompare2:
2084                     ; 871   TIM3->CCR2H = (uint8_t)(Compare >> 8);
2086  0245 9e            	ld	a,xh
2087  0246 c75293        	ld	21139,a
2088                     ; 872   TIM3->CCR2L = (uint8_t)(Compare);
2090  0249 9f            	ld	a,xl
2091  024a c75294        	ld	21140,a
2092                     ; 873 }
2095  024d 81            	ret
2162                     ; 883 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2162                     ; 884 {
2163                     	switch	.text
2164  024e               _TIM3_ForcedOC1Config:
2166  024e 88            	push	a
2167  024f 88            	push	a
2168       00000001      OFST:	set	1
2171                     ; 885   uint8_t tmpccmr1 = 0;
2173                     ; 888   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
2175                     ; 890   tmpccmr1 = TIM3->CCMR1;
2177  0250 c65289        	ld	a,21129
2178  0253 6b01          	ld	(OFST+0,sp),a
2179                     ; 893   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2181  0255 7b01          	ld	a,(OFST+0,sp)
2182  0257 a48f          	and	a,#143
2183  0259 6b01          	ld	(OFST+0,sp),a
2184                     ; 896   tmpccmr1 |= (uint8_t)TIM3_ForcedAction;
2186  025b 7b01          	ld	a,(OFST+0,sp)
2187  025d 1a02          	or	a,(OFST+1,sp)
2188  025f 6b01          	ld	(OFST+0,sp),a
2189                     ; 898   TIM3->CCMR1 = tmpccmr1;
2191  0261 7b01          	ld	a,(OFST+0,sp)
2192  0263 c75289        	ld	21129,a
2193                     ; 899 }
2196  0266 85            	popw	x
2197  0267 81            	ret
2242                     ; 909 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2242                     ; 910 {
2243                     	switch	.text
2244  0268               _TIM3_ForcedOC2Config:
2246  0268 88            	push	a
2247  0269 88            	push	a
2248       00000001      OFST:	set	1
2251                     ; 911   uint8_t tmpccmr2 = 0;
2253                     ; 914   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
2255                     ; 916   tmpccmr2 = TIM3->CCMR2;
2257  026a c6528a        	ld	a,21130
2258  026d 6b01          	ld	(OFST+0,sp),a
2259                     ; 919   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2261  026f 7b01          	ld	a,(OFST+0,sp)
2262  0271 a48f          	and	a,#143
2263  0273 6b01          	ld	(OFST+0,sp),a
2264                     ; 922   tmpccmr2 |= (uint8_t)TIM3_ForcedAction;
2266  0275 7b01          	ld	a,(OFST+0,sp)
2267  0277 1a02          	or	a,(OFST+1,sp)
2268  0279 6b01          	ld	(OFST+0,sp),a
2269                     ; 924   TIM3->CCMR2 = tmpccmr2;
2271  027b 7b01          	ld	a,(OFST+0,sp)
2272  027d c7528a        	ld	21130,a
2273                     ; 925 }
2276  0280 85            	popw	x
2277  0281 81            	ret
2313                     ; 933 void TIM3_OC1PreloadConfig(FunctionalState NewState)
2313                     ; 934 {
2314                     	switch	.text
2315  0282               _TIM3_OC1PreloadConfig:
2319                     ; 936   assert_param(IS_FUNCTIONAL_STATE(NewState));
2321                     ; 939   if (NewState != DISABLE)
2323  0282 4d            	tnz	a
2324  0283 2706          	jreq	L5711
2325                     ; 941     TIM3->CCMR1 |= TIM_CCMR_OCxPE ;
2327  0285 72165289      	bset	21129,#3
2329  0289 2004          	jra	L7711
2330  028b               L5711:
2331                     ; 945     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2333  028b 72175289      	bres	21129,#3
2334  028f               L7711:
2335                     ; 947 }
2338  028f 81            	ret
2374                     ; 955 void TIM3_OC2PreloadConfig(FunctionalState NewState)
2374                     ; 956 {
2375                     	switch	.text
2376  0290               _TIM3_OC2PreloadConfig:
2380                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2382                     ; 961   if (NewState != DISABLE)
2384  0290 4d            	tnz	a
2385  0291 2706          	jreq	L7121
2386                     ; 963     TIM3->CCMR2 |= TIM_CCMR_OCxPE ;
2388  0293 7216528a      	bset	21130,#3
2390  0297 2004          	jra	L1221
2391  0299               L7121:
2392                     ; 967     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2394  0299 7217528a      	bres	21130,#3
2395  029d               L1221:
2396                     ; 969 }
2399  029d 81            	ret
2434                     ; 977 void TIM3_OC1FastConfig(FunctionalState NewState)
2434                     ; 978 {
2435                     	switch	.text
2436  029e               _TIM3_OC1FastConfig:
2440                     ; 980   assert_param(IS_FUNCTIONAL_STATE(NewState));
2442                     ; 983   if (NewState != DISABLE)
2444  029e 4d            	tnz	a
2445  029f 2706          	jreq	L1421
2446                     ; 985     TIM3->CCMR1 |= TIM_CCMR_OCxFE ;
2448  02a1 72145289      	bset	21129,#2
2450  02a5 2004          	jra	L3421
2451  02a7               L1421:
2452                     ; 989     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2454  02a7 72155289      	bres	21129,#2
2455  02ab               L3421:
2456                     ; 991 }
2459  02ab 81            	ret
2494                     ; 1000 void TIM3_OC2FastConfig(FunctionalState NewState)
2494                     ; 1001 {
2495                     	switch	.text
2496  02ac               _TIM3_OC2FastConfig:
2500                     ; 1003   assert_param(IS_FUNCTIONAL_STATE(NewState));
2502                     ; 1006   if (NewState != DISABLE)
2504  02ac 4d            	tnz	a
2505  02ad 2706          	jreq	L3621
2506                     ; 1008     TIM3->CCMR2 |= TIM_CCMR_OCxFE ;
2508  02af 7214528a      	bset	21130,#2
2510  02b3 2004          	jra	L5621
2511  02b5               L3621:
2512                     ; 1012     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2514  02b5 7215528a      	bres	21130,#2
2515  02b9               L5621:
2516                     ; 1014 }
2519  02b9 81            	ret
2555                     ; 1024 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2555                     ; 1025 {
2556                     	switch	.text
2557  02ba               _TIM3_OC1PolarityConfig:
2561                     ; 1027   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
2563                     ; 1030   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
2565  02ba a101          	cp	a,#1
2566  02bc 2606          	jrne	L5031
2567                     ; 1032     TIM3->CCER1 |= TIM_CCER1_CC1P ;
2569  02be 7212528b      	bset	21131,#1
2571  02c2 2004          	jra	L7031
2572  02c4               L5031:
2573                     ; 1036     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2575  02c4 7213528b      	bres	21131,#1
2576  02c8               L7031:
2577                     ; 1038 }
2580  02c8 81            	ret
2616                     ; 1048 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2616                     ; 1049 {
2617                     	switch	.text
2618  02c9               _TIM3_OC2PolarityConfig:
2622                     ; 1051   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
2624                     ; 1054   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
2626  02c9 a101          	cp	a,#1
2627  02cb 2606          	jrne	L7231
2628                     ; 1056     TIM3->CCER1 |= TIM_CCER1_CC2P ;
2630  02cd 721a528b      	bset	21131,#5
2632  02d1 2004          	jra	L1331
2633  02d3               L7231:
2634                     ; 1060     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2636  02d3 721b528b      	bres	21131,#5
2637  02d7               L1331:
2638                     ; 1062 }
2641  02d7 81            	ret
2686                     ; 1074 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel,
2686                     ; 1075                  FunctionalState NewState)
2686                     ; 1076 {
2687                     	switch	.text
2688  02d8               _TIM3_CCxCmd:
2690  02d8 89            	pushw	x
2691       00000000      OFST:	set	0
2694                     ; 1078   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
2696                     ; 1079   assert_param(IS_FUNCTIONAL_STATE(NewState));
2698                     ; 1081   if (TIM3_Channel == TIM3_Channel_1)
2700  02d9 9e            	ld	a,xh
2701  02da 4d            	tnz	a
2702  02db 2610          	jrne	L5531
2703                     ; 1084     if (NewState != DISABLE)
2705  02dd 9f            	ld	a,xl
2706  02de 4d            	tnz	a
2707  02df 2706          	jreq	L7531
2708                     ; 1086       TIM3->CCER1 |= TIM_CCER1_CC1E ;
2710  02e1 7210528b      	bset	21131,#0
2712  02e5 2014          	jra	L3631
2713  02e7               L7531:
2714                     ; 1090       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2716  02e7 7211528b      	bres	21131,#0
2717  02eb 200e          	jra	L3631
2718  02ed               L5531:
2719                     ; 1097     if (NewState != DISABLE)
2721  02ed 0d02          	tnz	(OFST+2,sp)
2722  02ef 2706          	jreq	L5631
2723                     ; 1099       TIM3->CCER1 |= TIM_CCER1_CC2E;
2725  02f1 7218528b      	bset	21131,#4
2727  02f5 2004          	jra	L3631
2728  02f7               L5631:
2729                     ; 1103       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2731  02f7 7219528b      	bres	21131,#4
2732  02fb               L3631:
2733                     ; 1106 }
2736  02fb 85            	popw	x
2737  02fc 81            	ret
2901                     ; 1184 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
2901                     ; 1185                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
2901                     ; 1186                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
2901                     ; 1187                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
2901                     ; 1188                  uint8_t TIM3_ICFilter)
2901                     ; 1189 {
2902                     	switch	.text
2903  02fd               _TIM3_ICInit:
2905  02fd 89            	pushw	x
2906       00000000      OFST:	set	0
2909                     ; 1191   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
2911                     ; 1193   if (TIM3_Channel == TIM3_Channel_1)
2913  02fe 9e            	ld	a,xh
2914  02ff 4d            	tnz	a
2915  0300 2614          	jrne	L5641
2916                     ; 1196     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
2918  0302 7b07          	ld	a,(OFST+7,sp)
2919  0304 88            	push	a
2920  0305 7b06          	ld	a,(OFST+6,sp)
2921  0307 97            	ld	xl,a
2922  0308 7b03          	ld	a,(OFST+3,sp)
2923  030a 95            	ld	xh,a
2924  030b cd060e        	call	L3_TI1_Config
2926  030e 84            	pop	a
2927                     ; 1199     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
2929  030f 7b06          	ld	a,(OFST+6,sp)
2930  0311 cd03e3        	call	_TIM3_SetIC1Prescaler
2933  0314 2012          	jra	L7641
2934  0316               L5641:
2935                     ; 1204     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
2937  0316 7b07          	ld	a,(OFST+7,sp)
2938  0318 88            	push	a
2939  0319 7b06          	ld	a,(OFST+6,sp)
2940  031b 97            	ld	xl,a
2941  031c 7b03          	ld	a,(OFST+3,sp)
2942  031e 95            	ld	xh,a
2943  031f cd064b        	call	L5_TI2_Config
2945  0322 84            	pop	a
2946                     ; 1207     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
2948  0323 7b06          	ld	a,(OFST+6,sp)
2949  0325 cd03fd        	call	_TIM3_SetIC2Prescaler
2951  0328               L7641:
2952                     ; 1209 }
2955  0328 85            	popw	x
2956  0329 81            	ret
3052                     ; 1235 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
3052                     ; 1236                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
3052                     ; 1237                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
3052                     ; 1238                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
3052                     ; 1239                      uint8_t TIM3_ICFilter)
3052                     ; 1240 {
3053                     	switch	.text
3054  032a               _TIM3_PWMIConfig:
3056  032a 89            	pushw	x
3057  032b 89            	pushw	x
3058       00000002      OFST:	set	2
3061                     ; 1241   uint8_t icpolarity = TIM3_ICPolarity_Rising;
3063                     ; 1242   uint8_t icselection = TIM3_ICSelection_DirectTI;
3065                     ; 1245   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
3067                     ; 1248   if (TIM3_ICPolarity == TIM3_ICPolarity_Rising)
3069  032c 9f            	ld	a,xl
3070  032d 4d            	tnz	a
3071  032e 2606          	jrne	L7351
3072                     ; 1250     icpolarity = TIM3_ICPolarity_Falling;
3074  0330 a601          	ld	a,#1
3075  0332 6b01          	ld	(OFST-1,sp),a
3077  0334 2002          	jra	L1451
3078  0336               L7351:
3079                     ; 1254     icpolarity = TIM3_ICPolarity_Rising;
3081  0336 0f01          	clr	(OFST-1,sp)
3082  0338               L1451:
3083                     ; 1258   if (TIM3_ICSelection == TIM3_ICSelection_DirectTI)
3085  0338 7b07          	ld	a,(OFST+5,sp)
3086  033a a101          	cp	a,#1
3087  033c 2606          	jrne	L3451
3088                     ; 1260     icselection = TIM3_ICSelection_IndirectTI;
3090  033e a602          	ld	a,#2
3091  0340 6b02          	ld	(OFST+0,sp),a
3093  0342 2004          	jra	L5451
3094  0344               L3451:
3095                     ; 1264     icselection = TIM3_ICSelection_DirectTI;
3097  0344 a601          	ld	a,#1
3098  0346 6b02          	ld	(OFST+0,sp),a
3099  0348               L5451:
3100                     ; 1267   if (TIM3_Channel == TIM3_Channel_1)
3102  0348 0d03          	tnz	(OFST+1,sp)
3103  034a 2626          	jrne	L7451
3104                     ; 1270     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection,
3104                     ; 1271                TIM3_ICFilter);
3106  034c 7b09          	ld	a,(OFST+7,sp)
3107  034e 88            	push	a
3108  034f 7b08          	ld	a,(OFST+6,sp)
3109  0351 97            	ld	xl,a
3110  0352 7b05          	ld	a,(OFST+3,sp)
3111  0354 95            	ld	xh,a
3112  0355 cd060e        	call	L3_TI1_Config
3114  0358 84            	pop	a
3115                     ; 1274     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
3117  0359 7b08          	ld	a,(OFST+6,sp)
3118  035b cd03e3        	call	_TIM3_SetIC1Prescaler
3120                     ; 1277     TI2_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
3122  035e 7b09          	ld	a,(OFST+7,sp)
3123  0360 88            	push	a
3124  0361 7b03          	ld	a,(OFST+1,sp)
3125  0363 97            	ld	xl,a
3126  0364 7b02          	ld	a,(OFST+0,sp)
3127  0366 95            	ld	xh,a
3128  0367 cd064b        	call	L5_TI2_Config
3130  036a 84            	pop	a
3131                     ; 1280     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
3133  036b 7b08          	ld	a,(OFST+6,sp)
3134  036d cd03fd        	call	_TIM3_SetIC2Prescaler
3137  0370 2022          	jra	L1551
3138  0372               L7451:
3139                     ; 1285     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection,
3139                     ; 1286                TIM3_ICFilter);
3141  0372 7b09          	ld	a,(OFST+7,sp)
3142  0374 88            	push	a
3143  0375 7b08          	ld	a,(OFST+6,sp)
3144  0377 97            	ld	xl,a
3145  0378 7b05          	ld	a,(OFST+3,sp)
3146  037a 95            	ld	xh,a
3147  037b cd064b        	call	L5_TI2_Config
3149  037e 84            	pop	a
3150                     ; 1289     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
3152  037f 7b08          	ld	a,(OFST+6,sp)
3153  0381 ad7a          	call	_TIM3_SetIC2Prescaler
3155                     ; 1292     TI1_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
3157  0383 7b09          	ld	a,(OFST+7,sp)
3158  0385 88            	push	a
3159  0386 7b03          	ld	a,(OFST+1,sp)
3160  0388 97            	ld	xl,a
3161  0389 7b02          	ld	a,(OFST+0,sp)
3162  038b 95            	ld	xh,a
3163  038c cd060e        	call	L3_TI1_Config
3165  038f 84            	pop	a
3166                     ; 1295     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
3168  0390 7b08          	ld	a,(OFST+6,sp)
3169  0392 ad4f          	call	_TIM3_SetIC1Prescaler
3171  0394               L1551:
3172                     ; 1297 }
3175  0394 5b04          	addw	sp,#4
3176  0396 81            	ret
3228                     ; 1304 uint16_t TIM3_GetCapture1(void)
3228                     ; 1305 {
3229                     	switch	.text
3230  0397               _TIM3_GetCapture1:
3232  0397 5204          	subw	sp,#4
3233       00000004      OFST:	set	4
3236                     ; 1306   uint16_t tmpccr1 = 0;
3238                     ; 1309   tmpccr1h = TIM3->CCR1H;
3240  0399 c65291        	ld	a,21137
3241  039c 6b02          	ld	(OFST-2,sp),a
3242                     ; 1310   tmpccr1l = TIM3->CCR1L;
3244  039e c65292        	ld	a,21138
3245  03a1 6b01          	ld	(OFST-3,sp),a
3246                     ; 1312   tmpccr1 = (uint16_t)(tmpccr1l);
3248  03a3 7b01          	ld	a,(OFST-3,sp)
3249  03a5 5f            	clrw	x
3250  03a6 97            	ld	xl,a
3251  03a7 1f03          	ldw	(OFST-1,sp),x
3252                     ; 1313   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3254  03a9 7b02          	ld	a,(OFST-2,sp)
3255  03ab 5f            	clrw	x
3256  03ac 97            	ld	xl,a
3257  03ad 4f            	clr	a
3258  03ae 02            	rlwa	x,a
3259  03af 01            	rrwa	x,a
3260  03b0 1a04          	or	a,(OFST+0,sp)
3261  03b2 01            	rrwa	x,a
3262  03b3 1a03          	or	a,(OFST-1,sp)
3263  03b5 01            	rrwa	x,a
3264  03b6 1f03          	ldw	(OFST-1,sp),x
3265                     ; 1315   return ((uint16_t)tmpccr1);
3267  03b8 1e03          	ldw	x,(OFST-1,sp)
3270  03ba 5b04          	addw	sp,#4
3271  03bc 81            	ret
3323                     ; 1323 uint16_t TIM3_GetCapture2(void)
3323                     ; 1324 {
3324                     	switch	.text
3325  03bd               _TIM3_GetCapture2:
3327  03bd 5204          	subw	sp,#4
3328       00000004      OFST:	set	4
3331                     ; 1325   uint16_t tmpccr2 = 0;
3333                     ; 1328   tmpccr2h = TIM3->CCR2H;
3335  03bf c65293        	ld	a,21139
3336  03c2 6b02          	ld	(OFST-2,sp),a
3337                     ; 1329   tmpccr2l = TIM3->CCR2L;
3339  03c4 c65294        	ld	a,21140
3340  03c7 6b01          	ld	(OFST-3,sp),a
3341                     ; 1331   tmpccr2 = (uint16_t)(tmpccr2l);
3343  03c9 7b01          	ld	a,(OFST-3,sp)
3344  03cb 5f            	clrw	x
3345  03cc 97            	ld	xl,a
3346  03cd 1f03          	ldw	(OFST-1,sp),x
3347                     ; 1332   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3349  03cf 7b02          	ld	a,(OFST-2,sp)
3350  03d1 5f            	clrw	x
3351  03d2 97            	ld	xl,a
3352  03d3 4f            	clr	a
3353  03d4 02            	rlwa	x,a
3354  03d5 01            	rrwa	x,a
3355  03d6 1a04          	or	a,(OFST+0,sp)
3356  03d8 01            	rrwa	x,a
3357  03d9 1a03          	or	a,(OFST-1,sp)
3358  03db 01            	rrwa	x,a
3359  03dc 1f03          	ldw	(OFST-1,sp),x
3360                     ; 1334   return ((uint16_t)tmpccr2);
3362  03de 1e03          	ldw	x,(OFST-1,sp)
3365  03e0 5b04          	addw	sp,#4
3366  03e2 81            	ret
3411                     ; 1347 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
3411                     ; 1348 {
3412                     	switch	.text
3413  03e3               _TIM3_SetIC1Prescaler:
3415  03e3 88            	push	a
3416  03e4 88            	push	a
3417       00000001      OFST:	set	1
3420                     ; 1349   uint8_t tmpccmr1 = 0;
3422                     ; 1352   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC1Prescaler));
3424                     ; 1354   tmpccmr1 = TIM3->CCMR1;
3426  03e5 c65289        	ld	a,21129
3427  03e8 6b01          	ld	(OFST+0,sp),a
3428                     ; 1357   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3430  03ea 7b01          	ld	a,(OFST+0,sp)
3431  03ec a4f3          	and	a,#243
3432  03ee 6b01          	ld	(OFST+0,sp),a
3433                     ; 1360   tmpccmr1 |= (uint8_t)TIM3_IC1Prescaler;
3435  03f0 7b01          	ld	a,(OFST+0,sp)
3436  03f2 1a02          	or	a,(OFST+1,sp)
3437  03f4 6b01          	ld	(OFST+0,sp),a
3438                     ; 1362   TIM3->CCMR1 = tmpccmr1;
3440  03f6 7b01          	ld	a,(OFST+0,sp)
3441  03f8 c75289        	ld	21129,a
3442                     ; 1363 }
3445  03fb 85            	popw	x
3446  03fc 81            	ret
3491                     ; 1375 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
3491                     ; 1376 {
3492                     	switch	.text
3493  03fd               _TIM3_SetIC2Prescaler:
3495  03fd 88            	push	a
3496  03fe 88            	push	a
3497       00000001      OFST:	set	1
3500                     ; 1377   uint8_t tmpccmr2 = 0;
3502                     ; 1380   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC2Prescaler));
3504                     ; 1382   tmpccmr2 = TIM3->CCMR2;
3506  03ff c6528a        	ld	a,21130
3507  0402 6b01          	ld	(OFST+0,sp),a
3508                     ; 1385   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3510  0404 7b01          	ld	a,(OFST+0,sp)
3511  0406 a4f3          	and	a,#243
3512  0408 6b01          	ld	(OFST+0,sp),a
3513                     ; 1388   tmpccmr2 |= (uint8_t)TIM3_IC2Prescaler;
3515  040a 7b01          	ld	a,(OFST+0,sp)
3516  040c 1a02          	or	a,(OFST+1,sp)
3517  040e 6b01          	ld	(OFST+0,sp),a
3518                     ; 1390   TIM3->CCMR2 = tmpccmr2;
3520  0410 7b01          	ld	a,(OFST+0,sp)
3521  0412 c7528a        	ld	21130,a
3522                     ; 1391 }
3525  0415 85            	popw	x
3526  0416 81            	ret
3612                     ; 1422 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
3612                     ; 1423 {
3613                     	switch	.text
3614  0417               _TIM3_ITConfig:
3616  0417 89            	pushw	x
3617       00000000      OFST:	set	0
3620                     ; 1425   assert_param(IS_TIM3_IT(TIM3_IT));
3622                     ; 1426   assert_param(IS_FUNCTIONAL_STATE(NewState));
3624                     ; 1428   if (NewState != DISABLE)
3626  0418 9f            	ld	a,xl
3627  0419 4d            	tnz	a
3628  041a 2709          	jreq	L3371
3629                     ; 1431     TIM3->IER |= (uint8_t)TIM3_IT;
3631  041c 9e            	ld	a,xh
3632  041d ca5285        	or	a,21125
3633  0420 c75285        	ld	21125,a
3635  0423 2009          	jra	L5371
3636  0425               L3371:
3637                     ; 1436     TIM3->IER &= (uint8_t)(~(uint8_t)TIM3_IT);
3639  0425 7b01          	ld	a,(OFST+1,sp)
3640  0427 43            	cpl	a
3641  0428 c45285        	and	a,21125
3642  042b c75285        	ld	21125,a
3643  042e               L5371:
3644                     ; 1438 }
3647  042e 85            	popw	x
3648  042f 81            	ret
3729                     ; 1451 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
3729                     ; 1452 {
3730                     	switch	.text
3731  0430               _TIM3_GenerateEvent:
3735                     ; 1454   assert_param(IS_TIM3_EVENT_SOURCE((uint8_t)TIM3_EventSource));
3737                     ; 1457   TIM3->EGR |= (uint8_t)TIM3_EventSource;
3739  0430 ca5288        	or	a,21128
3740  0433 c75288        	ld	21128,a
3741                     ; 1458 }
3744  0436 81            	ret
3883                     ; 1473 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3883                     ; 1474 {
3884                     	switch	.text
3885  0437               _TIM3_GetFlagStatus:
3887  0437 89            	pushw	x
3888  0438 89            	pushw	x
3889       00000002      OFST:	set	2
3892                     ; 1475   FlagStatus bitstatus = RESET;
3894                     ; 1476   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3898                     ; 1479   assert_param(IS_TIM3_GET_FLAG(TIM3_FLAG));
3900                     ; 1481   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)(TIM3_FLAG));
3902  0439 9f            	ld	a,xl
3903  043a c45286        	and	a,21126
3904  043d 6b01          	ld	(OFST-1,sp),a
3905                     ; 1482   tim3_flag_h = (uint8_t)(TIM3->SR2 & (uint8_t)((uint16_t)TIM3_FLAG >> 8));
3907  043f c65287        	ld	a,21127
3908  0442 1403          	and	a,(OFST+1,sp)
3909  0444 6b02          	ld	(OFST+0,sp),a
3910                     ; 1484   if ((uint8_t)(tim3_flag_l | tim3_flag_h) != 0)
3912  0446 7b01          	ld	a,(OFST-1,sp)
3913  0448 1a02          	or	a,(OFST+0,sp)
3914  044a 2706          	jreq	L7502
3915                     ; 1486     bitstatus = SET;
3917  044c a601          	ld	a,#1
3918  044e 6b02          	ld	(OFST+0,sp),a
3920  0450 2002          	jra	L1602
3921  0452               L7502:
3922                     ; 1490     bitstatus = RESET;
3924  0452 0f02          	clr	(OFST+0,sp)
3925  0454               L1602:
3926                     ; 1492   return ((FlagStatus)bitstatus);
3928  0454 7b02          	ld	a,(OFST+0,sp)
3931  0456 5b04          	addw	sp,#4
3932  0458 81            	ret
3967                     ; 1506 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3967                     ; 1507 {
3968                     	switch	.text
3969  0459               _TIM3_ClearFlag:
3971  0459 89            	pushw	x
3972       00000000      OFST:	set	0
3975                     ; 1509   assert_param(IS_TIM3_CLEAR_FLAG((uint16_t)TIM3_FLAG));
3977                     ; 1511   TIM3->SR1 = (uint8_t)(~(uint8_t)(TIM3_FLAG));
3979  045a 9f            	ld	a,xl
3980  045b 43            	cpl	a
3981  045c c75286        	ld	21126,a
3982                     ; 1512   TIM3->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM3_FLAG >> 8));
3984  045f 7b01          	ld	a,(OFST+1,sp)
3985  0461 43            	cpl	a
3986  0462 c75287        	ld	21127,a
3987                     ; 1513 }
3990  0465 85            	popw	x
3991  0466 81            	ret
4055                     ; 1526 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
4055                     ; 1527 {
4056                     	switch	.text
4057  0467               _TIM3_GetITStatus:
4059  0467 88            	push	a
4060  0468 89            	pushw	x
4061       00000002      OFST:	set	2
4064                     ; 1528   ITStatus bitstatus = RESET;
4066                     ; 1530   uint8_t TIM3_itStatus = 0x0, TIM3_itEnable = 0x0;
4070                     ; 1533   assert_param(IS_TIM3_GET_IT(TIM3_IT));
4072                     ; 1535   TIM3_itStatus = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_IT);
4074  0469 c45286        	and	a,21126
4075  046c 6b01          	ld	(OFST-1,sp),a
4076                     ; 1537   TIM3_itEnable = (uint8_t)(TIM3->IER & (uint8_t)TIM3_IT);
4078  046e c65285        	ld	a,21125
4079  0471 1403          	and	a,(OFST+1,sp)
4080  0473 6b02          	ld	(OFST+0,sp),a
4081                     ; 1539   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET))
4083  0475 0d01          	tnz	(OFST-1,sp)
4084  0477 270a          	jreq	L3312
4086  0479 0d02          	tnz	(OFST+0,sp)
4087  047b 2706          	jreq	L3312
4088                     ; 1541     bitstatus = (ITStatus)SET;
4090  047d a601          	ld	a,#1
4091  047f 6b02          	ld	(OFST+0,sp),a
4093  0481 2002          	jra	L5312
4094  0483               L3312:
4095                     ; 1545     bitstatus = (ITStatus)RESET;
4097  0483 0f02          	clr	(OFST+0,sp)
4098  0485               L5312:
4099                     ; 1547   return ((ITStatus)bitstatus);
4101  0485 7b02          	ld	a,(OFST+0,sp)
4104  0487 5b03          	addw	sp,#3
4105  0489 81            	ret
4141                     ; 1561 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
4141                     ; 1562 {
4142                     	switch	.text
4143  048a               _TIM3_ClearITPendingBit:
4147                     ; 1564   assert_param(IS_TIM3_IT(TIM3_IT));
4149                     ; 1567   TIM3->SR1 = (uint8_t)(~(uint8_t)TIM3_IT);
4151  048a 43            	cpl	a
4152  048b c75286        	ld	21126,a
4153                     ; 1568 }
4156  048e 81            	ret
4229                     ; 1581 void TIM3_DMACmd( TIM3_DMASource_TypeDef TIM3_DMASource, FunctionalState NewState)
4229                     ; 1582 {
4230                     	switch	.text
4231  048f               _TIM3_DMACmd:
4233  048f 89            	pushw	x
4234       00000000      OFST:	set	0
4237                     ; 1584   assert_param(IS_FUNCTIONAL_STATE(NewState));
4239                     ; 1585   assert_param(IS_TIM3_DMA_SOURCE(TIM3_DMASource));
4241                     ; 1587   if (NewState != DISABLE)
4243  0490 9f            	ld	a,xl
4244  0491 4d            	tnz	a
4245  0492 2709          	jreq	L1122
4246                     ; 1590     TIM3->DER |= TIM3_DMASource;
4248  0494 9e            	ld	a,xh
4249  0495 ca5284        	or	a,21124
4250  0498 c75284        	ld	21124,a
4252  049b 2009          	jra	L3122
4253  049d               L1122:
4254                     ; 1595     TIM3->DER &= (uint8_t)(~TIM3_DMASource);
4256  049d 7b01          	ld	a,(OFST+1,sp)
4257  049f 43            	cpl	a
4258  04a0 c45284        	and	a,21124
4259  04a3 c75284        	ld	21124,a
4260  04a6               L3122:
4261                     ; 1597 }
4264  04a6 85            	popw	x
4265  04a7 81            	ret
4300                     ; 1605 void TIM3_SelectCCDMA(FunctionalState NewState)
4300                     ; 1606 {
4301                     	switch	.text
4302  04a8               _TIM3_SelectCCDMA:
4306                     ; 1608   assert_param(IS_FUNCTIONAL_STATE(NewState));
4308                     ; 1610   if (NewState != DISABLE)
4310  04a8 4d            	tnz	a
4311  04a9 2706          	jreq	L3322
4312                     ; 1613     TIM3->CR2 |= TIM_CR2_CCDS;
4314  04ab 72165281      	bset	21121,#3
4316  04af 2004          	jra	L5322
4317  04b1               L3322:
4318                     ; 1618     TIM3->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4320  04b1 72175281      	bres	21121,#3
4321  04b5               L5322:
4322                     ; 1620 }
4325  04b5 81            	ret
4349                     ; 1644 void TIM3_InternalClockConfig(void)
4349                     ; 1645 {
4350                     	switch	.text
4351  04b6               _TIM3_InternalClockConfig:
4355                     ; 1647   TIM3->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4357  04b6 c65282        	ld	a,21122
4358  04b9 a4f8          	and	a,#248
4359  04bb c75282        	ld	21122,a
4360                     ; 1648 }
4363  04be 81            	ret
4452                     ; 1665 void TIM3_TIxExternalClockConfig(TIM3_TIxExternalCLK1Source_TypeDef TIM3_TIxExternalCLKSource,
4452                     ; 1666                                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
4452                     ; 1667                                  uint8_t ICFilter)
4452                     ; 1668 {
4453                     	switch	.text
4454  04bf               _TIM3_TIxExternalClockConfig:
4456  04bf 89            	pushw	x
4457       00000000      OFST:	set	0
4460                     ; 1670   assert_param(IS_TIM3_TIXCLK_SOURCE(TIM3_TIxExternalCLKSource));
4462                     ; 1671   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
4464                     ; 1672   assert_param(IS_TIM3_IC_FILTER(ICFilter));
4466                     ; 1675   if (TIM3_TIxExternalCLKSource == TIM3_TIxExternalCLK1Source_TI2)
4468  04c0 9e            	ld	a,xh
4469  04c1 a160          	cp	a,#96
4470  04c3 260f          	jrne	L7032
4471                     ; 1677     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, ICFilter);
4473  04c5 7b05          	ld	a,(OFST+5,sp)
4474  04c7 88            	push	a
4475  04c8 ae0001        	ldw	x,#1
4476  04cb 7b03          	ld	a,(OFST+3,sp)
4477  04cd 95            	ld	xh,a
4478  04ce cd064b        	call	L5_TI2_Config
4480  04d1 84            	pop	a
4482  04d2 200d          	jra	L1132
4483  04d4               L7032:
4484                     ; 1681     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, ICFilter);
4486  04d4 7b05          	ld	a,(OFST+5,sp)
4487  04d6 88            	push	a
4488  04d7 ae0001        	ldw	x,#1
4489  04da 7b03          	ld	a,(OFST+3,sp)
4490  04dc 95            	ld	xh,a
4491  04dd cd060e        	call	L3_TI1_Config
4493  04e0 84            	pop	a
4494  04e1               L1132:
4495                     ; 1685   TIM3_SelectInputTrigger((TIM3_TRGSelection_TypeDef)TIM3_TIxExternalCLKSource);
4497  04e1 7b01          	ld	a,(OFST+1,sp)
4498  04e3 ad4b          	call	_TIM3_SelectInputTrigger
4500                     ; 1688   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
4502  04e5 c65282        	ld	a,21122
4503  04e8 aa07          	or	a,#7
4504  04ea c75282        	ld	21122,a
4505                     ; 1689 }
4508  04ed 85            	popw	x
4509  04ee 81            	ret
4626                     ; 1707 void TIM3_ETRClockMode1Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
4626                     ; 1708                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
4626                     ; 1709                               uint8_t ExtTRGFilter)
4626                     ; 1710 {
4627                     	switch	.text
4628  04ef               _TIM3_ETRClockMode1Config:
4630  04ef 89            	pushw	x
4631       00000000      OFST:	set	0
4634                     ; 1712   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, ExtTRGFilter);
4636  04f0 7b05          	ld	a,(OFST+5,sp)
4637  04f2 88            	push	a
4638  04f3 9f            	ld	a,xl
4639  04f4 97            	ld	xl,a
4640  04f5 7b02          	ld	a,(OFST+2,sp)
4641  04f7 95            	ld	xh,a
4642  04f8 cd058c        	call	_TIM3_ETRConfig
4644  04fb 84            	pop	a
4645                     ; 1715   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4647  04fc c65282        	ld	a,21122
4648  04ff a4f8          	and	a,#248
4649  0501 c75282        	ld	21122,a
4650                     ; 1716   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
4652  0504 c65282        	ld	a,21122
4653  0507 aa07          	or	a,#7
4654  0509 c75282        	ld	21122,a
4655                     ; 1719   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4657  050c c65282        	ld	a,21122
4658  050f a48f          	and	a,#143
4659  0511 c75282        	ld	21122,a
4660                     ; 1720   TIM3->SMCR |= (uint8_t)((TIM3_TRGSelection_TypeDef)TIM3_TRGSelection_ETRF);
4662  0514 c65282        	ld	a,21122
4663  0517 aa70          	or	a,#112
4664  0519 c75282        	ld	21122,a
4665                     ; 1721 }
4668  051c 85            	popw	x
4669  051d 81            	ret
4727                     ; 1739 void TIM3_ETRClockMode2Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
4727                     ; 1740                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
4727                     ; 1741                               uint8_t ExtTRGFilter)
4727                     ; 1742 {
4728                     	switch	.text
4729  051e               _TIM3_ETRClockMode2Config:
4731  051e 89            	pushw	x
4732       00000000      OFST:	set	0
4735                     ; 1744   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, ExtTRGFilter);
4737  051f 7b05          	ld	a,(OFST+5,sp)
4738  0521 88            	push	a
4739  0522 9f            	ld	a,xl
4740  0523 97            	ld	xl,a
4741  0524 7b02          	ld	a,(OFST+2,sp)
4742  0526 95            	ld	xh,a
4743  0527 ad63          	call	_TIM3_ETRConfig
4745  0529 84            	pop	a
4746                     ; 1747   TIM3->ETR |= TIM_ETR_ECE ;
4748  052a 721c5283      	bset	21123,#6
4749                     ; 1748 }
4752  052e 85            	popw	x
4753  052f 81            	ret
4869                     ; 1799 void TIM3_SelectInputTrigger(TIM3_TRGSelection_TypeDef TIM3_InputTriggerSource)
4869                     ; 1800 {
4870                     	switch	.text
4871  0530               _TIM3_SelectInputTrigger:
4873  0530 88            	push	a
4874  0531 88            	push	a
4875       00000001      OFST:	set	1
4878                     ; 1801   uint8_t tmpsmcr = 0;
4880                     ; 1804   assert_param(IS_TIM3_TRIGGER_SELECTION(TIM3_InputTriggerSource));
4882                     ; 1806   tmpsmcr = TIM3->SMCR;
4884  0532 c65282        	ld	a,21122
4885  0535 6b01          	ld	(OFST+0,sp),a
4886                     ; 1809   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4888  0537 7b01          	ld	a,(OFST+0,sp)
4889  0539 a48f          	and	a,#143
4890  053b 6b01          	ld	(OFST+0,sp),a
4891                     ; 1810   tmpsmcr |= (uint8_t)TIM3_InputTriggerSource;
4893  053d 7b01          	ld	a,(OFST+0,sp)
4894  053f 1a02          	or	a,(OFST+1,sp)
4895  0541 6b01          	ld	(OFST+0,sp),a
4896                     ; 1812   TIM3->SMCR = (uint8_t)tmpsmcr;
4898  0543 7b01          	ld	a,(OFST+0,sp)
4899  0545 c75282        	ld	21122,a
4900                     ; 1813 }
4903  0548 85            	popw	x
4904  0549 81            	ret
5003                     ; 1827 void TIM3_SelectOutputTrigger(TIM3_TRGOSource_TypeDef TIM3_TRGOSource)
5003                     ; 1828 {
5004                     	switch	.text
5005  054a               _TIM3_SelectOutputTrigger:
5007  054a 88            	push	a
5008  054b 88            	push	a
5009       00000001      OFST:	set	1
5012                     ; 1829   uint8_t tmpcr2 = 0;
5014                     ; 1832   assert_param(IS_TIM3_TRGO_SOURCE(TIM3_TRGOSource));
5016                     ; 1834   tmpcr2 = TIM3->CR2;
5018  054c c65281        	ld	a,21121
5019  054f 6b01          	ld	(OFST+0,sp),a
5020                     ; 1837   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
5022  0551 7b01          	ld	a,(OFST+0,sp)
5023  0553 a48f          	and	a,#143
5024  0555 6b01          	ld	(OFST+0,sp),a
5025                     ; 1840   tmpcr2 |=  (uint8_t)TIM3_TRGOSource;
5027  0557 7b01          	ld	a,(OFST+0,sp)
5028  0559 1a02          	or	a,(OFST+1,sp)
5029  055b 6b01          	ld	(OFST+0,sp),a
5030                     ; 1842   TIM3->CR2 = tmpcr2;
5032  055d 7b01          	ld	a,(OFST+0,sp)
5033  055f c75281        	ld	21121,a
5034                     ; 1843 }
5037  0562 85            	popw	x
5038  0563 81            	ret
5121                     ; 1855 void TIM3_SelectSlaveMode(TIM3_SlaveMode_TypeDef TIM3_SlaveMode)
5121                     ; 1856 {
5122                     	switch	.text
5123  0564               _TIM3_SelectSlaveMode:
5125  0564 88            	push	a
5126  0565 88            	push	a
5127       00000001      OFST:	set	1
5130                     ; 1857   uint8_t tmpsmcr = 0;
5132                     ; 1860   assert_param(IS_TIM3_SLAVE_MODE(TIM3_SlaveMode));
5134                     ; 1862   tmpsmcr = TIM3->SMCR;
5136  0566 c65282        	ld	a,21122
5137  0569 6b01          	ld	(OFST+0,sp),a
5138                     ; 1865   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
5140  056b 7b01          	ld	a,(OFST+0,sp)
5141  056d a4f8          	and	a,#248
5142  056f 6b01          	ld	(OFST+0,sp),a
5143                     ; 1868   tmpsmcr |= (uint8_t)TIM3_SlaveMode;
5145  0571 7b01          	ld	a,(OFST+0,sp)
5146  0573 1a02          	or	a,(OFST+1,sp)
5147  0575 6b01          	ld	(OFST+0,sp),a
5148                     ; 1870   TIM3->SMCR = tmpsmcr;
5150  0577 7b01          	ld	a,(OFST+0,sp)
5151  0579 c75282        	ld	21122,a
5152                     ; 1871 }
5155  057c 85            	popw	x
5156  057d 81            	ret
5192                     ; 1879 void TIM3_SelectMasterSlaveMode(FunctionalState NewState)
5192                     ; 1880 {
5193                     	switch	.text
5194  057e               _TIM3_SelectMasterSlaveMode:
5198                     ; 1882   assert_param(IS_FUNCTIONAL_STATE(NewState));
5200                     ; 1885   if (NewState != DISABLE)
5202  057e 4d            	tnz	a
5203  057f 2706          	jreq	L7752
5204                     ; 1887     TIM3->SMCR |= TIM_SMCR_MSM;
5206  0581 721e5282      	bset	21122,#7
5208  0585 2004          	jra	L1062
5209  0587               L7752:
5210                     ; 1891     TIM3->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5212  0587 721f5282      	bres	21122,#7
5213  058b               L1062:
5214                     ; 1893 }
5217  058b 81            	ret
5273                     ; 1911 void TIM3_ETRConfig(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
5273                     ; 1912                     TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
5273                     ; 1913                     uint8_t ExtTRGFilter)
5273                     ; 1914 {
5274                     	switch	.text
5275  058c               _TIM3_ETRConfig:
5277  058c 89            	pushw	x
5278       00000000      OFST:	set	0
5281                     ; 1916   assert_param(IS_TIM3_EXT_PRESCALER(TIM3_ExtTRGPrescaler));
5283                     ; 1917   assert_param(IS_TIM3_EXT_POLARITY(TIM3_ExtTRGPolarity));
5285                     ; 1918   assert_param(IS_TIM3_EXT_FILTER(ExtTRGFilter));
5287                     ; 1921   TIM3->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM3_ExtTRGPrescaler | (uint8_t)TIM3_ExtTRGPolarity)
5287                     ; 1922                          | (uint8_t)ExtTRGFilter);
5289  058d 9f            	ld	a,xl
5290  058e 1a01          	or	a,(OFST+1,sp)
5291  0590 1a05          	or	a,(OFST+5,sp)
5292  0592 ca5283        	or	a,21123
5293  0595 c75283        	ld	21123,a
5294                     ; 1923 }
5297  0598 85            	popw	x
5298  0599 81            	ret
5411                     ; 1958 void TIM3_EncoderInterfaceConfig(TIM3_EncoderMode_TypeDef TIM3_EncoderMode,
5411                     ; 1959                                  TIM3_ICPolarity_TypeDef TIM3_IC1Polarity,
5411                     ; 1960                                  TIM3_ICPolarity_TypeDef TIM3_IC2Polarity)
5411                     ; 1961 {
5412                     	switch	.text
5413  059a               _TIM3_EncoderInterfaceConfig:
5415  059a 89            	pushw	x
5416  059b 5203          	subw	sp,#3
5417       00000003      OFST:	set	3
5420                     ; 1962   uint8_t tmpsmcr = 0;
5422                     ; 1963   uint8_t tmpccmr1 = 0;
5424                     ; 1964   uint8_t tmpccmr2 = 0;
5426                     ; 1967   assert_param(IS_TIM3_ENCODER_MODE(TIM3_EncoderMode));
5428                     ; 1968   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC1Polarity));
5430                     ; 1969   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC2Polarity));
5432                     ; 1971   tmpsmcr = TIM3->SMCR;
5434  059d c65282        	ld	a,21122
5435  05a0 6b01          	ld	(OFST-2,sp),a
5436                     ; 1972   tmpccmr1 = TIM3->CCMR1;
5438  05a2 c65289        	ld	a,21129
5439  05a5 6b02          	ld	(OFST-1,sp),a
5440                     ; 1973   tmpccmr2 = TIM3->CCMR2;
5442  05a7 c6528a        	ld	a,21130
5443  05aa 6b03          	ld	(OFST+0,sp),a
5444                     ; 1976   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5446  05ac 7b01          	ld	a,(OFST-2,sp)
5447  05ae a4f0          	and	a,#240
5448  05b0 6b01          	ld	(OFST-2,sp),a
5449                     ; 1977   tmpsmcr |= (uint8_t)TIM3_EncoderMode;
5451  05b2 9e            	ld	a,xh
5452  05b3 1a01          	or	a,(OFST-2,sp)
5453  05b5 6b01          	ld	(OFST-2,sp),a
5454                     ; 1980   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5456  05b7 7b02          	ld	a,(OFST-1,sp)
5457  05b9 a4fc          	and	a,#252
5458  05bb 6b02          	ld	(OFST-1,sp),a
5459                     ; 1981   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5461  05bd 7b03          	ld	a,(OFST+0,sp)
5462  05bf a4fc          	and	a,#252
5463  05c1 6b03          	ld	(OFST+0,sp),a
5464                     ; 1982   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5466  05c3 7b02          	ld	a,(OFST-1,sp)
5467  05c5 aa01          	or	a,#1
5468  05c7 6b02          	ld	(OFST-1,sp),a
5469                     ; 1983   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5471  05c9 7b03          	ld	a,(OFST+0,sp)
5472  05cb aa01          	or	a,#1
5473  05cd 6b03          	ld	(OFST+0,sp),a
5474                     ; 1986   if (TIM3_IC1Polarity == TIM3_ICPolarity_Falling)
5476  05cf 9f            	ld	a,xl
5477  05d0 a101          	cp	a,#1
5478  05d2 2606          	jrne	L5072
5479                     ; 1988     TIM3->CCER1 |= TIM_CCER1_CC1P ;
5481  05d4 7212528b      	bset	21131,#1
5483  05d8 2004          	jra	L7072
5484  05da               L5072:
5485                     ; 1992     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5487  05da 7213528b      	bres	21131,#1
5488  05de               L7072:
5489                     ; 1995   if (TIM3_IC2Polarity == TIM3_ICPolarity_Falling)
5491  05de 7b08          	ld	a,(OFST+5,sp)
5492  05e0 a101          	cp	a,#1
5493  05e2 2606          	jrne	L1172
5494                     ; 1997     TIM3->CCER1 |= TIM_CCER1_CC2P ;
5496  05e4 721a528b      	bset	21131,#5
5498  05e8 2004          	jra	L3172
5499  05ea               L1172:
5500                     ; 2001     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5502  05ea 721b528b      	bres	21131,#5
5503  05ee               L3172:
5504                     ; 2004   TIM3->SMCR = tmpsmcr;
5506  05ee 7b01          	ld	a,(OFST-2,sp)
5507  05f0 c75282        	ld	21122,a
5508                     ; 2005   TIM3->CCMR1 = tmpccmr1;
5510  05f3 7b02          	ld	a,(OFST-1,sp)
5511  05f5 c75289        	ld	21129,a
5512                     ; 2006   TIM3->CCMR2 = tmpccmr2;
5514  05f8 7b03          	ld	a,(OFST+0,sp)
5515  05fa c7528a        	ld	21130,a
5516                     ; 2007 }
5519  05fd 5b05          	addw	sp,#5
5520  05ff 81            	ret
5556                     ; 2015 void TIM3_SelectHallSensor(FunctionalState NewState)
5556                     ; 2016 {
5557                     	switch	.text
5558  0600               _TIM3_SelectHallSensor:
5562                     ; 2018   assert_param(IS_FUNCTIONAL_STATE(NewState));
5564                     ; 2021   if (NewState != DISABLE)
5566  0600 4d            	tnz	a
5567  0601 2706          	jreq	L3372
5568                     ; 2023     TIM3->CR2 |= TIM_CR2_TI1S;
5570  0603 721e5281      	bset	21121,#7
5572  0607 2004          	jra	L5372
5573  0609               L3372:
5574                     ; 2027     TIM3->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5576  0609 721f5281      	bres	21121,#7
5577  060d               L5372:
5578                     ; 2029 }
5581  060d 81            	ret
5653                     ; 2050 static void TI1_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity, \
5653                     ; 2051                        TIM3_ICSelection_TypeDef TIM3_ICSelection, \
5653                     ; 2052                        uint8_t TIM3_ICFilter)
5653                     ; 2053 {
5654                     	switch	.text
5655  060e               L3_TI1_Config:
5657  060e 89            	pushw	x
5658  060f 89            	pushw	x
5659       00000002      OFST:	set	2
5662                     ; 2054   uint8_t tmpccmr1 = 0;
5664                     ; 2055   uint8_t tmpicpolarity = TIM3_ICPolarity;
5666  0610 9e            	ld	a,xh
5667  0611 6b01          	ld	(OFST-1,sp),a
5668                     ; 2056   tmpccmr1 = TIM3->CCMR1;
5670  0613 c65289        	ld	a,21129
5671  0616 6b02          	ld	(OFST+0,sp),a
5672                     ; 2059   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5674                     ; 2060   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5676                     ; 2061   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5678                     ; 2064   TIM3->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5680  0618 7211528b      	bres	21131,#0
5681                     ; 2067   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5683  061c 7b02          	ld	a,(OFST+0,sp)
5684  061e a40c          	and	a,#12
5685  0620 6b02          	ld	(OFST+0,sp),a
5686                     ; 2068   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5688  0622 7b07          	ld	a,(OFST+5,sp)
5689  0624 97            	ld	xl,a
5690  0625 a610          	ld	a,#16
5691  0627 42            	mul	x,a
5692  0628 9f            	ld	a,xl
5693  0629 1a04          	or	a,(OFST+2,sp)
5694  062b 1a02          	or	a,(OFST+0,sp)
5695  062d 6b02          	ld	(OFST+0,sp),a
5696                     ; 2070   TIM3->CCMR1 = tmpccmr1;
5698  062f 7b02          	ld	a,(OFST+0,sp)
5699  0631 c75289        	ld	21129,a
5700                     ; 2073   if (tmpicpolarity == (uint8_t)(TIM3_ICPolarity_Falling))
5702  0634 7b01          	ld	a,(OFST-1,sp)
5703  0636 a101          	cp	a,#1
5704  0638 2606          	jrne	L5772
5705                     ; 2075     TIM3->CCER1 |= TIM_CCER1_CC1P;
5707  063a 7212528b      	bset	21131,#1
5709  063e 2004          	jra	L7772
5710  0640               L5772:
5711                     ; 2079     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5713  0640 7213528b      	bres	21131,#1
5714  0644               L7772:
5715                     ; 2083   TIM3->CCER1 |=  TIM_CCER1_CC1E;
5717  0644 7210528b      	bset	21131,#0
5718                     ; 2084 }
5721  0648 5b04          	addw	sp,#4
5722  064a 81            	ret
5794                     ; 2101 static void TI2_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5794                     ; 2102                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5794                     ; 2103                        uint8_t TIM3_ICFilter)
5794                     ; 2104 {
5795                     	switch	.text
5796  064b               L5_TI2_Config:
5798  064b 89            	pushw	x
5799  064c 89            	pushw	x
5800       00000002      OFST:	set	2
5803                     ; 2105   uint8_t tmpccmr2 = 0;
5805                     ; 2106   uint8_t tmpicpolarity = TIM3_ICPolarity;
5807  064d 9e            	ld	a,xh
5808  064e 6b01          	ld	(OFST-1,sp),a
5809                     ; 2109   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5811                     ; 2110   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5813                     ; 2111   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5815                     ; 2113   tmpccmr2 = TIM3->CCMR2;
5817  0650 c6528a        	ld	a,21130
5818  0653 6b02          	ld	(OFST+0,sp),a
5819                     ; 2116   TIM3->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5821  0655 7219528b      	bres	21131,#4
5822                     ; 2119   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5824  0659 7b02          	ld	a,(OFST+0,sp)
5825  065b a40c          	and	a,#12
5826  065d 6b02          	ld	(OFST+0,sp),a
5827                     ; 2120   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5829  065f 7b07          	ld	a,(OFST+5,sp)
5830  0661 97            	ld	xl,a
5831  0662 a610          	ld	a,#16
5832  0664 42            	mul	x,a
5833  0665 9f            	ld	a,xl
5834  0666 1a04          	or	a,(OFST+2,sp)
5835  0668 1a02          	or	a,(OFST+0,sp)
5836  066a 6b02          	ld	(OFST+0,sp),a
5837                     ; 2122   TIM3->CCMR2 = tmpccmr2;
5839  066c 7b02          	ld	a,(OFST+0,sp)
5840  066e c7528a        	ld	21130,a
5841                     ; 2125   if (tmpicpolarity == TIM3_ICPolarity_Falling)
5843  0671 7b01          	ld	a,(OFST-1,sp)
5844  0673 a101          	cp	a,#1
5845  0675 2606          	jrne	L7303
5846                     ; 2127     TIM3->CCER1 |= TIM_CCER1_CC2P ;
5848  0677 721a528b      	bset	21131,#5
5850  067b 2004          	jra	L1403
5851  067d               L7303:
5852                     ; 2131     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5854  067d 721b528b      	bres	21131,#5
5855  0681               L1403:
5856                     ; 2135   TIM3->CCER1 |=  TIM_CCER1_CC2E;
5858  0681 7218528b      	bset	21131,#4
5859                     ; 2136 }
5862  0685 5b04          	addw	sp,#4
5863  0687 81            	ret
5876                     	xdef	_TIM3_SelectHallSensor
5877                     	xdef	_TIM3_EncoderInterfaceConfig
5878                     	xdef	_TIM3_ETRConfig
5879                     	xdef	_TIM3_SelectMasterSlaveMode
5880                     	xdef	_TIM3_SelectSlaveMode
5881                     	xdef	_TIM3_SelectOutputTrigger
5882                     	xdef	_TIM3_SelectInputTrigger
5883                     	xdef	_TIM3_ETRClockMode2Config
5884                     	xdef	_TIM3_ETRClockMode1Config
5885                     	xdef	_TIM3_TIxExternalClockConfig
5886                     	xdef	_TIM3_InternalClockConfig
5887                     	xdef	_TIM3_SelectCCDMA
5888                     	xdef	_TIM3_DMACmd
5889                     	xdef	_TIM3_ClearITPendingBit
5890                     	xdef	_TIM3_GetITStatus
5891                     	xdef	_TIM3_ClearFlag
5892                     	xdef	_TIM3_GetFlagStatus
5893                     	xdef	_TIM3_GenerateEvent
5894                     	xdef	_TIM3_ITConfig
5895                     	xdef	_TIM3_SetIC2Prescaler
5896                     	xdef	_TIM3_SetIC1Prescaler
5897                     	xdef	_TIM3_GetCapture2
5898                     	xdef	_TIM3_GetCapture1
5899                     	xdef	_TIM3_PWMIConfig
5900                     	xdef	_TIM3_ICInit
5901                     	xdef	_TIM3_CCxCmd
5902                     	xdef	_TIM3_OC2PolarityConfig
5903                     	xdef	_TIM3_OC1PolarityConfig
5904                     	xdef	_TIM3_OC2FastConfig
5905                     	xdef	_TIM3_OC1FastConfig
5906                     	xdef	_TIM3_OC2PreloadConfig
5907                     	xdef	_TIM3_OC1PreloadConfig
5908                     	xdef	_TIM3_ForcedOC2Config
5909                     	xdef	_TIM3_ForcedOC1Config
5910                     	xdef	_TIM3_SetCompare2
5911                     	xdef	_TIM3_SetCompare1
5912                     	xdef	_TIM3_SelectOCxM
5913                     	xdef	_TIM3_CtrlPWMOutputs
5914                     	xdef	_TIM3_BKRConfig
5915                     	xdef	_TIM3_OC2Init
5916                     	xdef	_TIM3_OC1Init
5917                     	xdef	_TIM3_Cmd
5918                     	xdef	_TIM3_SelectOnePulseMode
5919                     	xdef	_TIM3_ARRPreloadConfig
5920                     	xdef	_TIM3_UpdateRequestConfig
5921                     	xdef	_TIM3_UpdateDisableConfig
5922                     	xdef	_TIM3_GetPrescaler
5923                     	xdef	_TIM3_GetCounter
5924                     	xdef	_TIM3_SetAutoreload
5925                     	xdef	_TIM3_SetCounter
5926                     	xdef	_TIM3_CounterModeConfig
5927                     	xdef	_TIM3_PrescalerConfig
5928                     	xdef	_TIM3_TimeBaseInit
5929                     	xdef	_TIM3_DeInit
5948                     	end
