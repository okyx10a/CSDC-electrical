   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  43                     ; 181 void TIM1_DeInit(void)
  43                     ; 182 {
  45                     	switch	.text
  46  0000               _TIM1_DeInit:
  50                     ; 183   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  52  0000 725f52b0      	clr	21168
  53                     ; 184   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  55  0004 725f52b1      	clr	21169
  56                     ; 185   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  58  0008 725f52b2      	clr	21170
  59                     ; 186   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  61  000c 725f52b3      	clr	21171
  62                     ; 187   TIM1->IER  = TIM1_IER_RESET_VALUE;
  64  0010 725f52b5      	clr	21173
  65                     ; 190   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  67  0014 725f52bd      	clr	21181
  68                     ; 191   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  70  0018 725f52be      	clr	21182
  71                     ; 193   TIM1->CCMR1 = 0x01;
  73  001c 350152b9      	mov	21177,#1
  74                     ; 194   TIM1->CCMR2 = 0x01;
  76  0020 350152ba      	mov	21178,#1
  77                     ; 195   TIM1->CCMR3 = 0x01;
  79  0024 350152bb      	mov	21179,#1
  80                     ; 196   TIM1->CCMR4 = 0x01;
  82  0028 350152bc      	mov	21180,#1
  83                     ; 198   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  85  002c 725f52bd      	clr	21181
  86                     ; 199   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  88  0030 725f52be      	clr	21182
  89                     ; 200   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  91  0034 725f52b9      	clr	21177
  92                     ; 201   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  94  0038 725f52ba      	clr	21178
  95                     ; 202   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  97  003c 725f52bb      	clr	21179
  98                     ; 203   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 100  0040 725f52bc      	clr	21180
 101                     ; 204   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 103  0044 725f52bf      	clr	21183
 104                     ; 205   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 106  0048 725f52c0      	clr	21184
 107                     ; 206   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 109  004c 725f52c1      	clr	21185
 110                     ; 207   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 112  0050 725f52c2      	clr	21186
 113                     ; 208   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 115  0054 35ff52c3      	mov	21187,#255
 116                     ; 209   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 118  0058 35ff52c4      	mov	21188,#255
 119                     ; 210   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 121  005c 725f52c6      	clr	21190
 122                     ; 211   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 124  0060 725f52c7      	clr	21191
 125                     ; 212   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 127  0064 725f52c8      	clr	21192
 128                     ; 213   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 130  0068 725f52c9      	clr	21193
 131                     ; 214   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 133  006c 725f52ca      	clr	21194
 134                     ; 215   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 136  0070 725f52cb      	clr	21195
 137                     ; 216   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 139  0074 725f52cc      	clr	21196
 140                     ; 217   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 142  0078 725f52cd      	clr	21197
 143                     ; 218   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 145  007c 725f52d0      	clr	21200
 146                     ; 219   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 148  0080 350152b8      	mov	21176,#1
 149                     ; 220   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 151  0084 725f52cf      	clr	21199
 152                     ; 221   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 154  0088 725f52ce      	clr	21198
 155                     ; 222   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 157  008c 725f52c5      	clr	21189
 158                     ; 223   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 160  0090 725f52b6      	clr	21174
 161                     ; 224   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
 163  0094 725f52b7      	clr	21175
 164                     ; 225 }
 167  0098 81            	ret
 276                     ; 241 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 276                     ; 242                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 276                     ; 243                        uint16_t TIM1_Period,
 276                     ; 244                        uint8_t TIM1_RepetitionCounter)
 276                     ; 245 {
 277                     	switch	.text
 278  0099               _TIM1_TimeBaseInit:
 280  0099 89            	pushw	x
 281       00000000      OFST:	set	0
 284                     ; 247   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 286                     ; 251   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 288  009a 7b06          	ld	a,(OFST+6,sp)
 289  009c c752c3        	ld	21187,a
 290                     ; 252   TIM1->ARRL = (uint8_t)(TIM1_Period);
 292  009f 7b07          	ld	a,(OFST+7,sp)
 293  00a1 c752c4        	ld	21188,a
 294                     ; 255   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 296  00a4 9e            	ld	a,xh
 297  00a5 c752c1        	ld	21185,a
 298                     ; 256   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 300  00a8 9f            	ld	a,xl
 301  00a9 c752c2        	ld	21186,a
 302                     ; 259   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 302                     ; 260                         | (uint8_t)(TIM1_CounterMode));
 304  00ac c652b0        	ld	a,21168
 305  00af a48f          	and	a,#143
 306  00b1 1a05          	or	a,(OFST+5,sp)
 307  00b3 c752b0        	ld	21168,a
 308                     ; 263   TIM1->RCR = TIM1_RepetitionCounter;
 310  00b6 7b08          	ld	a,(OFST+8,sp)
 311  00b8 c752c5        	ld	21189,a
 312                     ; 265 }
 315  00bb 85            	popw	x
 316  00bc 81            	ret
 383                     ; 279 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 383                     ; 280 {
 384                     	switch	.text
 385  00bd               _TIM1_PrescalerConfig:
 387  00bd 89            	pushw	x
 388       00000000      OFST:	set	0
 391                     ; 282   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
 393                     ; 285   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 395  00be 9e            	ld	a,xh
 396  00bf c752c1        	ld	21185,a
 397                     ; 286   TIM1->PSCRL = (uint8_t)(Prescaler);
 399  00c2 9f            	ld	a,xl
 400  00c3 c752c2        	ld	21186,a
 401                     ; 289   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 403  00c6 7b05          	ld	a,(OFST+5,sp)
 404  00c8 c752b8        	ld	21176,a
 405                     ; 290 }
 408  00cb 85            	popw	x
 409  00cc 81            	ret
 445                     ; 303 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 445                     ; 304 {
 446                     	switch	.text
 447  00cd               _TIM1_CounterModeConfig:
 449  00cd 88            	push	a
 450       00000000      OFST:	set	0
 453                     ; 306   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 455                     ; 310   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 455                     ; 311                         | (uint8_t)TIM1_CounterMode);
 457  00ce c652b0        	ld	a,21168
 458  00d1 a48f          	and	a,#143
 459  00d3 1a01          	or	a,(OFST+1,sp)
 460  00d5 c752b0        	ld	21168,a
 461                     ; 312 }
 464  00d8 84            	pop	a
 465  00d9 81            	ret
 499                     ; 320 void TIM1_SetCounter(uint16_t Counter)
 499                     ; 321 {
 500                     	switch	.text
 501  00da               _TIM1_SetCounter:
 505                     ; 323   TIM1->CNTRH = (uint8_t)(Counter >> 8);
 507  00da 9e            	ld	a,xh
 508  00db c752bf        	ld	21183,a
 509                     ; 324   TIM1->CNTRL = (uint8_t)(Counter);
 511  00de 9f            	ld	a,xl
 512  00df c752c0        	ld	21184,a
 513                     ; 325 }
 516  00e2 81            	ret
 550                     ; 333 void TIM1_SetAutoreload(uint16_t Autoreload)
 550                     ; 334 {
 551                     	switch	.text
 552  00e3               _TIM1_SetAutoreload:
 556                     ; 336   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 558  00e3 9e            	ld	a,xh
 559  00e4 c752c3        	ld	21187,a
 560                     ; 337   TIM1->ARRL = (uint8_t)(Autoreload);
 562  00e7 9f            	ld	a,xl
 563  00e8 c752c4        	ld	21188,a
 564                     ; 338 }
 567  00eb 81            	ret
 619                     ; 345 uint16_t TIM1_GetCounter(void)
 619                     ; 346 {
 620                     	switch	.text
 621  00ec               _TIM1_GetCounter:
 623  00ec 5204          	subw	sp,#4
 624       00000004      OFST:	set	4
 627                     ; 348   uint16_t tmpcntr = 0;
 629                     ; 349   uint8_t tmpcntrl = 0, tmpcntrh = 0;
 633                     ; 351   tmpcntrh = TIM1->CNTRH;
 635  00ee c652bf        	ld	a,21183
 636  00f1 6b02          	ld	(OFST-2,sp),a
 637                     ; 352   tmpcntrl = TIM1->CNTRL;
 639  00f3 c652c0        	ld	a,21184
 640  00f6 6b01          	ld	(OFST-3,sp),a
 641                     ; 354   tmpcntr  = (uint16_t)(tmpcntrl);
 643  00f8 7b01          	ld	a,(OFST-3,sp)
 644  00fa 5f            	clrw	x
 645  00fb 97            	ld	xl,a
 646  00fc 1f03          	ldw	(OFST-1,sp),x
 647                     ; 355   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 649  00fe 7b02          	ld	a,(OFST-2,sp)
 650  0100 5f            	clrw	x
 651  0101 97            	ld	xl,a
 652  0102 4f            	clr	a
 653  0103 02            	rlwa	x,a
 654  0104 01            	rrwa	x,a
 655  0105 1a04          	or	a,(OFST+0,sp)
 656  0107 01            	rrwa	x,a
 657  0108 1a03          	or	a,(OFST-1,sp)
 658  010a 01            	rrwa	x,a
 659  010b 1f03          	ldw	(OFST-1,sp),x
 660                     ; 358   return (uint16_t)tmpcntr;
 662  010d 1e03          	ldw	x,(OFST-1,sp)
 665  010f 5b04          	addw	sp,#4
 666  0111 81            	ret
 700                     ; 366 uint16_t TIM1_GetPrescaler(void)
 700                     ; 367 {
 701                     	switch	.text
 702  0112               _TIM1_GetPrescaler:
 704  0112 89            	pushw	x
 705       00000002      OFST:	set	2
 708                     ; 368   uint16_t tmpreg = 0;
 710                     ; 369   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 712  0113 c652c1        	ld	a,21185
 713  0116 5f            	clrw	x
 714  0117 97            	ld	xl,a
 715  0118 4f            	clr	a
 716  0119 02            	rlwa	x,a
 717  011a 1f01          	ldw	(OFST-1,sp),x
 718                     ; 371   return (uint16_t)(tmpreg | TIM1->PSCRL);
 720  011c c652c2        	ld	a,21186
 721  011f 5f            	clrw	x
 722  0120 97            	ld	xl,a
 723  0121 01            	rrwa	x,a
 724  0122 1a02          	or	a,(OFST+0,sp)
 725  0124 01            	rrwa	x,a
 726  0125 1a01          	or	a,(OFST-1,sp)
 727  0127 01            	rrwa	x,a
 730  0128 5b02          	addw	sp,#2
 731  012a 81            	ret
 787                     ; 380 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 787                     ; 381 {
 788                     	switch	.text
 789  012b               _TIM1_UpdateDisableConfig:
 793                     ; 383   assert_param(IS_FUNCTIONAL_STATE(NewState));
 795                     ; 386   if (NewState != DISABLE)
 797  012b 4d            	tnz	a
 798  012c 2706          	jreq	L772
 799                     ; 388     TIM1->CR1 |= TIM1_CR1_UDIS;
 801  012e 721252b0      	bset	21168,#1
 803  0132 2004          	jra	L103
 804  0134               L772:
 805                     ; 392     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 807  0134 721352b0      	bres	21168,#1
 808  0138               L103:
 809                     ; 394 }
 812  0138 81            	ret
 870                     ; 404 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 870                     ; 405 {
 871                     	switch	.text
 872  0139               _TIM1_UpdateRequestConfig:
 876                     ; 407   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 878                     ; 410   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
 880  0139 4d            	tnz	a
 881  013a 2706          	jreq	L133
 882                     ; 412     TIM1->CR1 |= TIM1_CR1_URS;
 884  013c 721452b0      	bset	21168,#2
 886  0140 2004          	jra	L333
 887  0142               L133:
 888                     ; 416     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 890  0142 721552b0      	bres	21168,#2
 891  0146               L333:
 892                     ; 418 }
 895  0146 81            	ret
 931                     ; 426 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 931                     ; 427 {
 932                     	switch	.text
 933  0147               _TIM1_ARRPreloadConfig:
 937                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
 939                     ; 432   if (NewState != DISABLE)
 941  0147 4d            	tnz	a
 942  0148 2706          	jreq	L353
 943                     ; 434     TIM1->CR1 |= TIM1_CR1_ARPE;
 945  014a 721e52b0      	bset	21168,#7
 947  014e 2004          	jra	L553
 948  0150               L353:
 949                     ; 438     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 951  0150 721f52b0      	bres	21168,#7
 952  0154               L553:
 953                     ; 440 }
 956  0154 81            	ret
1013                     ; 450 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
1013                     ; 451 {
1014                     	switch	.text
1015  0155               _TIM1_SelectOnePulseMode:
1019                     ; 453   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
1021                     ; 456   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
1023  0155 4d            	tnz	a
1024  0156 2706          	jreq	L504
1025                     ; 458     TIM1->CR1 |= TIM1_CR1_OPM;
1027  0158 721652b0      	bset	21168,#3
1029  015c 2004          	jra	L704
1030  015e               L504:
1031                     ; 462     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
1033  015e 721752b0      	bres	21168,#3
1034  0162               L704:
1035                     ; 464 }
1038  0162 81            	ret
1073                     ; 472 void TIM1_Cmd(FunctionalState NewState)
1073                     ; 473 {
1074                     	switch	.text
1075  0163               _TIM1_Cmd:
1079                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1081                     ; 478   if (NewState != DISABLE)
1083  0163 4d            	tnz	a
1084  0164 2706          	jreq	L724
1085                     ; 480     TIM1->CR1 |= TIM1_CR1_CEN;
1087  0166 721052b0      	bset	21168,#0
1089  016a 2004          	jra	L134
1090  016c               L724:
1091                     ; 484     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1093  016c 721152b0      	bres	21168,#0
1094  0170               L134:
1095                     ; 486 }
1098  0170 81            	ret
1383                     ; 577 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1383                     ; 578                   TIM1_OutputState_TypeDef TIM1_OutputState,
1383                     ; 579                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1383                     ; 580                   uint16_t TIM1_Pulse,
1383                     ; 581                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1383                     ; 582                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1383                     ; 583                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1383                     ; 584                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1383                     ; 585 {
1384                     	switch	.text
1385  0171               _TIM1_OC1Init:
1387  0171 89            	pushw	x
1388  0172 5203          	subw	sp,#3
1389       00000003      OFST:	set	3
1392                     ; 587   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1394                     ; 588   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1396                     ; 589   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1398                     ; 590   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1400                     ; 591   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1402                     ; 592   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1404                     ; 593   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1406                     ; 597   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
1406                     ; 598                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
1408  0174 c652bd        	ld	a,21181
1409  0177 a4f0          	and	a,#240
1410  0179 c752bd        	ld	21181,a
1411                     ; 601   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
1411                     ; 602                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
1411                     ; 603                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
1411                     ; 604                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
1413  017c 7b0c          	ld	a,(OFST+9,sp)
1414  017e a408          	and	a,#8
1415  0180 6b03          	ld	(OFST+0,sp),a
1416  0182 7b0b          	ld	a,(OFST+8,sp)
1417  0184 a402          	and	a,#2
1418  0186 1a03          	or	a,(OFST+0,sp)
1419  0188 6b02          	ld	(OFST-1,sp),a
1420  018a 7b08          	ld	a,(OFST+5,sp)
1421  018c a404          	and	a,#4
1422  018e 6b01          	ld	(OFST-2,sp),a
1423  0190 9f            	ld	a,xl
1424  0191 a401          	and	a,#1
1425  0193 1a01          	or	a,(OFST-2,sp)
1426  0195 1a02          	or	a,(OFST-1,sp)
1427  0197 ca52bd        	or	a,21181
1428  019a c752bd        	ld	21181,a
1429                     ; 607   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
1429                     ; 608                           | (uint8_t)TIM1_OCMode);
1431  019d c652b9        	ld	a,21177
1432  01a0 a48f          	and	a,#143
1433  01a2 1a04          	or	a,(OFST+1,sp)
1434  01a4 c752b9        	ld	21177,a
1435                     ; 611   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
1437  01a7 c652d0        	ld	a,21200
1438  01aa a4fc          	and	a,#252
1439  01ac c752d0        	ld	21200,a
1440                     ; 613   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
1440                     ; 614                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
1442  01af 7b0e          	ld	a,(OFST+11,sp)
1443  01b1 a402          	and	a,#2
1444  01b3 6b03          	ld	(OFST+0,sp),a
1445  01b5 7b0d          	ld	a,(OFST+10,sp)
1446  01b7 a401          	and	a,#1
1447  01b9 1a03          	or	a,(OFST+0,sp)
1448  01bb ca52d0        	or	a,21200
1449  01be c752d0        	ld	21200,a
1450                     ; 617   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
1452  01c1 7b09          	ld	a,(OFST+6,sp)
1453  01c3 c752c6        	ld	21190,a
1454                     ; 618   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
1456  01c6 7b0a          	ld	a,(OFST+7,sp)
1457  01c8 c752c7        	ld	21191,a
1458                     ; 619 }
1461  01cb 5b05          	addw	sp,#5
1462  01cd 81            	ret
1566                     ; 658 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1566                     ; 659                   TIM1_OutputState_TypeDef TIM1_OutputState,
1566                     ; 660                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1566                     ; 661                   uint16_t TIM1_Pulse,
1566                     ; 662                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1566                     ; 663                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1566                     ; 664                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1566                     ; 665                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1566                     ; 666 {
1567                     	switch	.text
1568  01ce               _TIM1_OC2Init:
1570  01ce 89            	pushw	x
1571  01cf 5203          	subw	sp,#3
1572       00000003      OFST:	set	3
1575                     ; 669   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1577                     ; 670   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1579                     ; 671   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1581                     ; 672   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1583                     ; 673   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1585                     ; 674   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1587                     ; 675   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1589                     ; 679   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1591  01d1 c652bd        	ld	a,21181
1592  01d4 a40f          	and	a,#15
1593  01d6 c752bd        	ld	21181,a
1594                     ; 682   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
1594                     ; 683                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
1596  01d9 7b0c          	ld	a,(OFST+9,sp)
1597  01db a480          	and	a,#128
1598  01dd 6b03          	ld	(OFST+0,sp),a
1599  01df 7b0b          	ld	a,(OFST+8,sp)
1600  01e1 a420          	and	a,#32
1601  01e3 1a03          	or	a,(OFST+0,sp)
1602  01e5 6b02          	ld	(OFST-1,sp),a
1603  01e7 7b08          	ld	a,(OFST+5,sp)
1604  01e9 a440          	and	a,#64
1605  01eb 6b01          	ld	(OFST-2,sp),a
1606  01ed 9f            	ld	a,xl
1607  01ee a410          	and	a,#16
1608  01f0 1a01          	or	a,(OFST-2,sp)
1609  01f2 1a02          	or	a,(OFST-1,sp)
1610  01f4 ca52bd        	or	a,21181
1611  01f7 c752bd        	ld	21181,a
1612                     ; 686   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1614  01fa c652ba        	ld	a,21178
1615  01fd a48f          	and	a,#143
1616  01ff 1a04          	or	a,(OFST+1,sp)
1617  0201 c752ba        	ld	21178,a
1618                     ; 689   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1620  0204 c652d0        	ld	a,21200
1621  0207 a4f3          	and	a,#243
1622  0209 c752d0        	ld	21200,a
1623                     ; 691   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1625  020c 7b0e          	ld	a,(OFST+11,sp)
1626  020e a408          	and	a,#8
1627  0210 6b03          	ld	(OFST+0,sp),a
1628  0212 7b0d          	ld	a,(OFST+10,sp)
1629  0214 a404          	and	a,#4
1630  0216 1a03          	or	a,(OFST+0,sp)
1631  0218 ca52d0        	or	a,21200
1632  021b c752d0        	ld	21200,a
1633                     ; 694   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1635  021e 7b09          	ld	a,(OFST+6,sp)
1636  0220 c752c8        	ld	21192,a
1637                     ; 695   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1639  0223 7b0a          	ld	a,(OFST+7,sp)
1640  0225 c752c9        	ld	21193,a
1641                     ; 696 }
1644  0228 5b05          	addw	sp,#5
1645  022a 81            	ret
1749                     ; 735 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1749                     ; 736                   TIM1_OutputState_TypeDef TIM1_OutputState,
1749                     ; 737                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1749                     ; 738                   uint16_t TIM1_Pulse,
1749                     ; 739                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1749                     ; 740                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1749                     ; 741                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1749                     ; 742                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1749                     ; 743 {
1750                     	switch	.text
1751  022b               _TIM1_OC3Init:
1753  022b 89            	pushw	x
1754  022c 5203          	subw	sp,#3
1755       00000003      OFST:	set	3
1758                     ; 746   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1760                     ; 747   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1762                     ; 748   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1764                     ; 749   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1766                     ; 750   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1768                     ; 751   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1770                     ; 752   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1772                     ; 756   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1774  022e c652be        	ld	a,21182
1775  0231 a4f0          	and	a,#240
1776  0233 c752be        	ld	21182,a
1777                     ; 759   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
1777                     ; 760                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
1779  0236 7b0c          	ld	a,(OFST+9,sp)
1780  0238 a408          	and	a,#8
1781  023a 6b03          	ld	(OFST+0,sp),a
1782  023c 7b0b          	ld	a,(OFST+8,sp)
1783  023e a402          	and	a,#2
1784  0240 1a03          	or	a,(OFST+0,sp)
1785  0242 6b02          	ld	(OFST-1,sp),a
1786  0244 7b08          	ld	a,(OFST+5,sp)
1787  0246 a404          	and	a,#4
1788  0248 6b01          	ld	(OFST-2,sp),a
1789  024a 9f            	ld	a,xl
1790  024b a401          	and	a,#1
1791  024d 1a01          	or	a,(OFST-2,sp)
1792  024f 1a02          	or	a,(OFST-1,sp)
1793  0251 ca52be        	or	a,21182
1794  0254 c752be        	ld	21182,a
1795                     ; 763   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1797  0257 c652bb        	ld	a,21179
1798  025a a48f          	and	a,#143
1799  025c 1a04          	or	a,(OFST+1,sp)
1800  025e c752bb        	ld	21179,a
1801                     ; 766   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1803  0261 c652d0        	ld	a,21200
1804  0264 a4cf          	and	a,#207
1805  0266 c752d0        	ld	21200,a
1806                     ; 768   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1808  0269 7b0e          	ld	a,(OFST+11,sp)
1809  026b a420          	and	a,#32
1810  026d 6b03          	ld	(OFST+0,sp),a
1811  026f 7b0d          	ld	a,(OFST+10,sp)
1812  0271 a410          	and	a,#16
1813  0273 1a03          	or	a,(OFST+0,sp)
1814  0275 ca52d0        	or	a,21200
1815  0278 c752d0        	ld	21200,a
1816                     ; 771   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1818  027b 7b09          	ld	a,(OFST+6,sp)
1819  027d c752ca        	ld	21194,a
1820                     ; 772   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1822  0280 7b0a          	ld	a,(OFST+7,sp)
1823  0282 c752cb        	ld	21195,a
1824                     ; 773 }
1827  0285 5b05          	addw	sp,#5
1828  0287 81            	ret
2035                     ; 803 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
2035                     ; 804                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
2035                     ; 805                      uint8_t TIM1_DeadTime,
2035                     ; 806                      TIM1_BreakState_TypeDef TIM1_Break,
2035                     ; 807                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
2035                     ; 808                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
2035                     ; 809 {
2036                     	switch	.text
2037  0288               _TIM1_BDTRConfig:
2039  0288 89            	pushw	x
2040  0289 88            	push	a
2041       00000001      OFST:	set	1
2044                     ; 812   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
2046                     ; 813   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
2048                     ; 814   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
2050                     ; 815   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
2052                     ; 816   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
2054                     ; 818   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2056  028a 7b06          	ld	a,(OFST+5,sp)
2057  028c c752cf        	ld	21199,a
2058                     ; 822   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
2058                     ; 823                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
2058                     ; 824                                       | (uint8_t)TIM1_AutomaticOutput));
2060  028f 7b07          	ld	a,(OFST+6,sp)
2061  0291 1a08          	or	a,(OFST+7,sp)
2062  0293 1a09          	or	a,(OFST+8,sp)
2063  0295 6b01          	ld	(OFST+0,sp),a
2064  0297 9f            	ld	a,xl
2065  0298 1a02          	or	a,(OFST+1,sp)
2066  029a 1a01          	or	a,(OFST+0,sp)
2067  029c c752ce        	ld	21198,a
2068                     ; 826 }
2071  029f 5b03          	addw	sp,#3
2072  02a1 81            	ret
2108                     ; 834 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2108                     ; 835 {
2109                     	switch	.text
2110  02a2               _TIM1_CtrlPWMOutputs:
2114                     ; 837   assert_param(IS_FUNCTIONAL_STATE(NewState));
2116                     ; 841   if (NewState != DISABLE)
2118  02a2 4d            	tnz	a
2119  02a3 2706          	jreq	L5601
2120                     ; 843     TIM1->BKR |= TIM1_BKR_MOE;
2122  02a5 721e52ce      	bset	21198,#7
2124  02a9 2004          	jra	L7601
2125  02ab               L5601:
2126                     ; 847     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2128  02ab 721f52ce      	bres	21198,#7
2129  02af               L7601:
2130                     ; 849 }
2133  02af 81            	ret
2212                     ; 871 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
2212                     ; 872 {
2213                     	switch	.text
2214  02b0               _TIM1_SelectOCxM:
2216  02b0 89            	pushw	x
2217       00000000      OFST:	set	0
2220                     ; 874   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
2222                     ; 875   assert_param(IS_TIM1_OCM(TIM1_OCMode));
2224                     ; 877   if (TIM1_Channel == TIM1_Channel_1)
2226  02b1 9e            	ld	a,xh
2227  02b2 4d            	tnz	a
2228  02b3 2610          	jrne	L7211
2229                     ; 880     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2231  02b5 721152bd      	bres	21181,#0
2232                     ; 883     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2234  02b9 c652b9        	ld	a,21177
2235  02bc a48f          	and	a,#143
2236  02be 1a02          	or	a,(OFST+2,sp)
2237  02c0 c752b9        	ld	21177,a
2239  02c3 2024          	jra	L1311
2240  02c5               L7211:
2241                     ; 885   else if (TIM1_Channel == TIM1_Channel_2)
2243  02c5 7b01          	ld	a,(OFST+1,sp)
2244  02c7 a101          	cp	a,#1
2245  02c9 2610          	jrne	L3311
2246                     ; 888     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2248  02cb 721952bd      	bres	21181,#4
2249                     ; 891     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2251  02cf c652ba        	ld	a,21178
2252  02d2 a48f          	and	a,#143
2253  02d4 1a02          	or	a,(OFST+2,sp)
2254  02d6 c752ba        	ld	21178,a
2256  02d9 200e          	jra	L1311
2257  02db               L3311:
2258                     ; 896     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2260  02db 721152be      	bres	21182,#0
2261                     ; 899     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2263  02df c652bb        	ld	a,21179
2264  02e2 a48f          	and	a,#143
2265  02e4 1a02          	or	a,(OFST+2,sp)
2266  02e6 c752bb        	ld	21179,a
2267  02e9               L1311:
2268                     ; 902 }
2271  02e9 85            	popw	x
2272  02ea 81            	ret
2306                     ; 910 void TIM1_SetCompare1(uint16_t Compare1)
2306                     ; 911 {
2307                     	switch	.text
2308  02eb               _TIM1_SetCompare1:
2312                     ; 913   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
2314  02eb 9e            	ld	a,xh
2315  02ec c752c6        	ld	21190,a
2316                     ; 914   TIM1->CCR1L = (uint8_t)(Compare1);
2318  02ef 9f            	ld	a,xl
2319  02f0 c752c7        	ld	21191,a
2320                     ; 916 }
2323  02f3 81            	ret
2357                     ; 924 void TIM1_SetCompare2(uint16_t Compare2)
2357                     ; 925 {
2358                     	switch	.text
2359  02f4               _TIM1_SetCompare2:
2363                     ; 927   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
2365  02f4 9e            	ld	a,xh
2366  02f5 c752c8        	ld	21192,a
2367                     ; 928   TIM1->CCR2L = (uint8_t)(Compare2);
2369  02f8 9f            	ld	a,xl
2370  02f9 c752c9        	ld	21193,a
2371                     ; 929 }
2374  02fc 81            	ret
2408                     ; 937 void TIM1_SetCompare3(uint16_t Compare3)
2408                     ; 938 {
2409                     	switch	.text
2410  02fd               _TIM1_SetCompare3:
2414                     ; 940   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
2416  02fd 9e            	ld	a,xh
2417  02fe c752ca        	ld	21194,a
2418                     ; 941   TIM1->CCR3L = (uint8_t)(Compare3);
2420  0301 9f            	ld	a,xl
2421  0302 c752cb        	ld	21195,a
2422                     ; 942 }
2425  0305 81            	ret
2459                     ; 950 void TIM1_SetCompare4(uint16_t Compare4)
2459                     ; 951 {
2460                     	switch	.text
2461  0306               _TIM1_SetCompare4:
2465                     ; 953   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
2467  0306 9e            	ld	a,xh
2468  0307 c752cc        	ld	21196,a
2469                     ; 954   TIM1->CCR4L = (uint8_t)(Compare4);
2471  030a 9f            	ld	a,xl
2472  030b c752cd        	ld	21197,a
2473                     ; 955 }
2476  030e 81            	ret
2512                     ; 963 void TIM1_CCPreloadControl(FunctionalState NewState)
2512                     ; 964 {
2513                     	switch	.text
2514  030f               _TIM1_CCPreloadControl:
2518                     ; 966   assert_param(IS_FUNCTIONAL_STATE(NewState));
2520                     ; 969   if (NewState != DISABLE)
2522  030f 4d            	tnz	a
2523  0310 2706          	jreq	L5421
2524                     ; 971     TIM1->CR2 |= TIM1_CR2_CCPC;
2526  0312 721052b1      	bset	21169,#0
2528  0316 2004          	jra	L7421
2529  0318               L5421:
2530                     ; 975     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
2532  0318 721152b1      	bres	21169,#0
2533  031c               L7421:
2534                     ; 977 }
2537  031c 81            	ret
2595                     ; 987 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2595                     ; 988 {
2596                     	switch	.text
2597  031d               _TIM1_ForcedOC1Config:
2599  031d 88            	push	a
2600       00000000      OFST:	set	0
2603                     ; 990   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2605                     ; 993   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2607  031e c652b9        	ld	a,21177
2608  0321 a48f          	and	a,#143
2609  0323 1a01          	or	a,(OFST+1,sp)
2610  0325 c752b9        	ld	21177,a
2611                     ; 994 }
2614  0328 84            	pop	a
2615  0329 81            	ret
2651                     ; 1004 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2651                     ; 1005 {
2652                     	switch	.text
2653  032a               _TIM1_ForcedOC2Config:
2655  032a 88            	push	a
2656       00000000      OFST:	set	0
2659                     ; 1007   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2661                     ; 1010   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2663  032b c652ba        	ld	a,21178
2664  032e a48f          	and	a,#143
2665  0330 1a01          	or	a,(OFST+1,sp)
2666  0332 c752ba        	ld	21178,a
2667                     ; 1011 }
2670  0335 84            	pop	a
2671  0336 81            	ret
2707                     ; 1021 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2707                     ; 1022 {
2708                     	switch	.text
2709  0337               _TIM1_ForcedOC3Config:
2711  0337 88            	push	a
2712       00000000      OFST:	set	0
2715                     ; 1024   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2717                     ; 1027   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2719  0338 c652bb        	ld	a,21179
2720  033b a48f          	and	a,#143
2721  033d 1a01          	or	a,(OFST+1,sp)
2722  033f c752bb        	ld	21179,a
2723                     ; 1028 }
2726  0342 84            	pop	a
2727  0343 81            	ret
2763                     ; 1036 void TIM1_OC1PreloadConfig(FunctionalState NewState)
2763                     ; 1037 {
2764                     	switch	.text
2765  0344               _TIM1_OC1PreloadConfig:
2769                     ; 1039   assert_param(IS_FUNCTIONAL_STATE(NewState));
2771                     ; 1042   if (NewState != DISABLE)
2773  0344 4d            	tnz	a
2774  0345 2706          	jreq	L1531
2775                     ; 1044     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
2777  0347 721652b9      	bset	21177,#3
2779  034b 2004          	jra	L3531
2780  034d               L1531:
2781                     ; 1048     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2783  034d 721752b9      	bres	21177,#3
2784  0351               L3531:
2785                     ; 1050 }
2788  0351 81            	ret
2824                     ; 1058 void TIM1_OC2PreloadConfig(FunctionalState NewState)
2824                     ; 1059 {
2825                     	switch	.text
2826  0352               _TIM1_OC2PreloadConfig:
2830                     ; 1061   assert_param(IS_FUNCTIONAL_STATE(NewState));
2832                     ; 1064   if (NewState != DISABLE)
2834  0352 4d            	tnz	a
2835  0353 2706          	jreq	L3731
2836                     ; 1066     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
2838  0355 721652ba      	bset	21178,#3
2840  0359 2004          	jra	L5731
2841  035b               L3731:
2842                     ; 1070     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2844  035b 721752ba      	bres	21178,#3
2845  035f               L5731:
2846                     ; 1072 }
2849  035f 81            	ret
2885                     ; 1080 void TIM1_OC3PreloadConfig(FunctionalState NewState)
2885                     ; 1081 {
2886                     	switch	.text
2887  0360               _TIM1_OC3PreloadConfig:
2891                     ; 1083   assert_param(IS_FUNCTIONAL_STATE(NewState));
2893                     ; 1086   if (NewState != DISABLE)
2895  0360 4d            	tnz	a
2896  0361 2706          	jreq	L5141
2897                     ; 1088     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
2899  0363 721652bb      	bset	21179,#3
2901  0367 2004          	jra	L7141
2902  0369               L5141:
2903                     ; 1092     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2905  0369 721752bb      	bres	21179,#3
2906  036d               L7141:
2907                     ; 1094 }
2910  036d 81            	ret
2946                     ; 1102 void TIM1_OC4PreloadConfig(FunctionalState NewState)
2946                     ; 1103 {
2947                     	switch	.text
2948  036e               _TIM1_OC4PreloadConfig:
2952                     ; 1105   assert_param(IS_FUNCTIONAL_STATE(NewState));
2954                     ; 1108   if (NewState != DISABLE)
2956  036e 4d            	tnz	a
2957  036f 2706          	jreq	L7341
2958                     ; 1110     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
2960  0371 721652bc      	bset	21180,#3
2962  0375 2004          	jra	L1441
2963  0377               L7341:
2964                     ; 1114     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2966  0377 721752bc      	bres	21180,#3
2967  037b               L1441:
2968                     ; 1116 }
2971  037b 81            	ret
3006                     ; 1124 void TIM1_OC1FastConfig(FunctionalState NewState)
3006                     ; 1125 {
3007                     	switch	.text
3008  037c               _TIM1_OC1FastConfig:
3012                     ; 1127   assert_param(IS_FUNCTIONAL_STATE(NewState));
3014                     ; 1130   if (NewState != DISABLE)
3016  037c 4d            	tnz	a
3017  037d 2706          	jreq	L1641
3018                     ; 1132     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
3020  037f 721452b9      	bset	21177,#2
3022  0383 2004          	jra	L3641
3023  0385               L1641:
3024                     ; 1136     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3026  0385 721552b9      	bres	21177,#2
3027  0389               L3641:
3028                     ; 1138 }
3031  0389 81            	ret
3066                     ; 1146 void TIM1_OC2FastConfig(FunctionalState NewState)
3066                     ; 1147 {
3067                     	switch	.text
3068  038a               _TIM1_OC2FastConfig:
3072                     ; 1149   assert_param(IS_FUNCTIONAL_STATE(NewState));
3074                     ; 1152   if (NewState != DISABLE)
3076  038a 4d            	tnz	a
3077  038b 2706          	jreq	L3051
3078                     ; 1154     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
3080  038d 721452ba      	bset	21178,#2
3082  0391 2004          	jra	L5051
3083  0393               L3051:
3084                     ; 1158     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3086  0393 721552ba      	bres	21178,#2
3087  0397               L5051:
3088                     ; 1160 }
3091  0397 81            	ret
3126                     ; 1168 void TIM1_OC3FastConfig(FunctionalState NewState)
3126                     ; 1169 {
3127                     	switch	.text
3128  0398               _TIM1_OC3FastConfig:
3132                     ; 1171   assert_param(IS_FUNCTIONAL_STATE(NewState));
3134                     ; 1174   if (NewState != DISABLE)
3136  0398 4d            	tnz	a
3137  0399 2706          	jreq	L5251
3138                     ; 1176     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
3140  039b 721452bb      	bset	21179,#2
3142  039f 2004          	jra	L7251
3143  03a1               L5251:
3144                     ; 1180     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3146  03a1 721552bb      	bres	21179,#2
3147  03a5               L7251:
3148                     ; 1182 }
3151  03a5 81            	ret
3186                     ; 1190 void TIM1_ClearOC1Ref(FunctionalState NewState)
3186                     ; 1191 {
3187                     	switch	.text
3188  03a6               _TIM1_ClearOC1Ref:
3192                     ; 1193   assert_param(IS_FUNCTIONAL_STATE(NewState));
3194                     ; 1196   if (NewState != DISABLE)
3196  03a6 4d            	tnz	a
3197  03a7 2706          	jreq	L7451
3198                     ; 1198     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
3200  03a9 721e52b9      	bset	21177,#7
3202  03ad 2004          	jra	L1551
3203  03af               L7451:
3204                     ; 1202     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3206  03af 721f52b9      	bres	21177,#7
3207  03b3               L1551:
3208                     ; 1204 }
3211  03b3 81            	ret
3246                     ; 1212 void TIM1_ClearOC2Ref(FunctionalState NewState)
3246                     ; 1213 {
3247                     	switch	.text
3248  03b4               _TIM1_ClearOC2Ref:
3252                     ; 1215   assert_param(IS_FUNCTIONAL_STATE(NewState));
3254                     ; 1218   if (NewState != DISABLE)
3256  03b4 4d            	tnz	a
3257  03b5 2706          	jreq	L1751
3258                     ; 1220     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
3260  03b7 721e52ba      	bset	21178,#7
3262  03bb 2004          	jra	L3751
3263  03bd               L1751:
3264                     ; 1224     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3266  03bd 721f52ba      	bres	21178,#7
3267  03c1               L3751:
3268                     ; 1226 }
3271  03c1 81            	ret
3306                     ; 1234 void TIM1_ClearOC3Ref(FunctionalState NewState)
3306                     ; 1235 {
3307                     	switch	.text
3308  03c2               _TIM1_ClearOC3Ref:
3312                     ; 1237   assert_param(IS_FUNCTIONAL_STATE(NewState));
3314                     ; 1240   if (NewState != DISABLE)
3316  03c2 4d            	tnz	a
3317  03c3 2706          	jreq	L3161
3318                     ; 1242     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
3320  03c5 721e52bb      	bset	21179,#7
3322  03c9 2004          	jra	L5161
3323  03cb               L3161:
3324                     ; 1246     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3326  03cb 721f52bb      	bres	21179,#7
3327  03cf               L5161:
3328                     ; 1248 }
3331  03cf 81            	ret
3366                     ; 1256 void TIM1_ClearOC4Ref(FunctionalState NewState)
3366                     ; 1257 {
3367                     	switch	.text
3368  03d0               _TIM1_ClearOC4Ref:
3372                     ; 1259   assert_param(IS_FUNCTIONAL_STATE(NewState));
3374                     ; 1262   if (NewState != DISABLE)
3376  03d0 4d            	tnz	a
3377  03d1 2706          	jreq	L5361
3378                     ; 1264     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
3380  03d3 721e52bc      	bset	21180,#7
3382  03d7 2004          	jra	L7361
3383  03d9               L5361:
3384                     ; 1268     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3386  03d9 721f52bc      	bres	21180,#7
3387  03dd               L7361:
3388                     ; 1270 }
3391  03dd 81            	ret
3427                     ; 1280 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3427                     ; 1281 {
3428                     	switch	.text
3429  03de               _TIM1_OC1PolarityConfig:
3433                     ; 1283   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3435                     ; 1286   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3437  03de 4d            	tnz	a
3438  03df 2706          	jreq	L7561
3439                     ; 1288     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3441  03e1 721252bd      	bset	21181,#1
3443  03e5 2004          	jra	L1661
3444  03e7               L7561:
3445                     ; 1292     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3447  03e7 721352bd      	bres	21181,#1
3448  03eb               L1661:
3449                     ; 1294 }
3452  03eb 81            	ret
3488                     ; 1304 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3488                     ; 1305 {
3489                     	switch	.text
3490  03ec               _TIM1_OC1NPolarityConfig:
3494                     ; 1307   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3496                     ; 1310   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3498  03ec 4d            	tnz	a
3499  03ed 2706          	jreq	L1071
3500                     ; 1312     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
3502  03ef 721652bd      	bset	21181,#3
3504  03f3 2004          	jra	L3071
3505  03f5               L1071:
3506                     ; 1316     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
3508  03f5 721752bd      	bres	21181,#3
3509  03f9               L3071:
3510                     ; 1318 }
3513  03f9 81            	ret
3549                     ; 1328 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3549                     ; 1329 {
3550                     	switch	.text
3551  03fa               _TIM1_OC2PolarityConfig:
3555                     ; 1331   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3557                     ; 1334   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3559  03fa 4d            	tnz	a
3560  03fb 2706          	jreq	L3271
3561                     ; 1336     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3563  03fd 721a52bd      	bset	21181,#5
3565  0401 2004          	jra	L5271
3566  0403               L3271:
3567                     ; 1340     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3569  0403 721b52bd      	bres	21181,#5
3570  0407               L5271:
3571                     ; 1342 }
3574  0407 81            	ret
3610                     ; 1352 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3610                     ; 1353 {
3611                     	switch	.text
3612  0408               _TIM1_OC2NPolarityConfig:
3616                     ; 1355   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3618                     ; 1358   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3620  0408 4d            	tnz	a
3621  0409 2706          	jreq	L5471
3622                     ; 1360     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
3624  040b 721e52bd      	bset	21181,#7
3626  040f 2004          	jra	L7471
3627  0411               L5471:
3628                     ; 1364     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
3630  0411 721f52bd      	bres	21181,#7
3631  0415               L7471:
3632                     ; 1366 }
3635  0415 81            	ret
3671                     ; 1376 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3671                     ; 1377 {
3672                     	switch	.text
3673  0416               _TIM1_OC3PolarityConfig:
3677                     ; 1379   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3679                     ; 1382   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3681  0416 4d            	tnz	a
3682  0417 2706          	jreq	L7671
3683                     ; 1384     TIM1->CCER2 |= TIM1_CCER2_CC3P;
3685  0419 721252be      	bset	21182,#1
3687  041d 2004          	jra	L1771
3688  041f               L7671:
3689                     ; 1388     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
3691  041f 721352be      	bres	21182,#1
3692  0423               L1771:
3693                     ; 1390 }
3696  0423 81            	ret
3732                     ; 1400 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3732                     ; 1401 {
3733                     	switch	.text
3734  0424               _TIM1_OC3NPolarityConfig:
3738                     ; 1403   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3740                     ; 1406   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3742  0424 4d            	tnz	a
3743  0425 2706          	jreq	L1102
3744                     ; 1408     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
3746  0427 721652be      	bset	21182,#3
3748  042b 2004          	jra	L3102
3749  042d               L1102:
3750                     ; 1412     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
3752  042d 721752be      	bres	21182,#3
3753  0431               L3102:
3754                     ; 1414 }
3757  0431 81            	ret
3816                     ; 1424 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
3816                     ; 1425 {
3817                     	switch	.text
3818  0432               _TIM1_SelectOCREFClear:
3822                     ; 1427   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
3824                     ; 1430   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
3826  0432 721752b2      	bres	21170,#3
3827                     ; 1431   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
3829  0436 ca52b2        	or	a,21170
3830  0439 c752b2        	ld	21170,a
3831                     ; 1432 }
3834  043c 81            	ret
3869                     ; 1440 void TIM1_SelectCOM(FunctionalState NewState)
3869                     ; 1441 {
3870                     	switch	.text
3871  043d               _TIM1_SelectCOM:
3875                     ; 1443   assert_param(IS_FUNCTIONAL_STATE(NewState));
3877                     ; 1446   if (NewState != DISABLE)
3879  043d 4d            	tnz	a
3880  043e 2706          	jreq	L1602
3881                     ; 1448     TIM1->CR2 |= TIM1_CR2_CCUS;
3883  0440 721452b1      	bset	21169,#2
3885  0444 2004          	jra	L3602
3886  0446               L1602:
3887                     ; 1452     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
3889  0446 721552b1      	bres	21169,#2
3890  044a               L3602:
3891                     ; 1454 }
3894  044a 81            	ret
3939                     ; 1468 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3939                     ; 1469 {
3940                     	switch	.text
3941  044b               _TIM1_CCxCmd:
3943  044b 89            	pushw	x
3944       00000000      OFST:	set	0
3947                     ; 1471   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
3949                     ; 1472   assert_param(IS_FUNCTIONAL_STATE(NewState));
3951                     ; 1474   if (TIM1_Channel == TIM1_Channel_1)
3953  044c 9e            	ld	a,xh
3954  044d 4d            	tnz	a
3955  044e 2610          	jrne	L7012
3956                     ; 1477     if (NewState != DISABLE)
3958  0450 9f            	ld	a,xl
3959  0451 4d            	tnz	a
3960  0452 2706          	jreq	L1112
3961                     ; 1479       TIM1->CCER1 |= TIM1_CCER1_CC1E;
3963  0454 721052bd      	bset	21181,#0
3965  0458 2040          	jra	L5112
3966  045a               L1112:
3967                     ; 1483       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
3969  045a 721152bd      	bres	21181,#0
3970  045e 203a          	jra	L5112
3971  0460               L7012:
3972                     ; 1486   else if (TIM1_Channel == TIM1_Channel_2)
3974  0460 7b01          	ld	a,(OFST+1,sp)
3975  0462 a101          	cp	a,#1
3976  0464 2610          	jrne	L7112
3977                     ; 1489     if (NewState != DISABLE)
3979  0466 0d02          	tnz	(OFST+2,sp)
3980  0468 2706          	jreq	L1212
3981                     ; 1491       TIM1->CCER1 |= TIM1_CCER1_CC2E;
3983  046a 721852bd      	bset	21181,#4
3985  046e 202a          	jra	L5112
3986  0470               L1212:
3987                     ; 1495       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
3989  0470 721952bd      	bres	21181,#4
3990  0474 2024          	jra	L5112
3991  0476               L7112:
3992                     ; 1498   else if (TIM1_Channel == TIM1_Channel_3)
3994  0476 7b01          	ld	a,(OFST+1,sp)
3995  0478 a102          	cp	a,#2
3996  047a 2610          	jrne	L7212
3997                     ; 1501     if (NewState != DISABLE)
3999  047c 0d02          	tnz	(OFST+2,sp)
4000  047e 2706          	jreq	L1312
4001                     ; 1503       TIM1->CCER2 |= TIM1_CCER2_CC3E;
4003  0480 721052be      	bset	21182,#0
4005  0484 2014          	jra	L5112
4006  0486               L1312:
4007                     ; 1507       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
4009  0486 721152be      	bres	21182,#0
4010  048a 200e          	jra	L5112
4011  048c               L7212:
4012                     ; 1513     if (NewState != DISABLE)
4014  048c 0d02          	tnz	(OFST+2,sp)
4015  048e 2706          	jreq	L7312
4016                     ; 1515       TIM1->CCER2 |= TIM1_CCER2_CC4E;
4018  0490 721852be      	bset	21182,#4
4020  0494 2004          	jra	L5112
4021  0496               L7312:
4022                     ; 1519       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
4024  0496 721952be      	bres	21182,#4
4025  049a               L5112:
4026                     ; 1522 }
4029  049a 85            	popw	x
4030  049b 81            	ret
4075                     ; 1535 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
4075                     ; 1536 {
4076                     	switch	.text
4077  049c               _TIM1_CCxNCmd:
4079  049c 89            	pushw	x
4080       00000000      OFST:	set	0
4083                     ; 1538   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
4085                     ; 1539   assert_param(IS_FUNCTIONAL_STATE(NewState));
4087                     ; 1541   if (TIM1_Channel == TIM1_Channel_1)
4089  049d 9e            	ld	a,xh
4090  049e 4d            	tnz	a
4091  049f 2610          	jrne	L5612
4092                     ; 1544     if (NewState != DISABLE)
4094  04a1 9f            	ld	a,xl
4095  04a2 4d            	tnz	a
4096  04a3 2706          	jreq	L7612
4097                     ; 1546       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
4099  04a5 721452bd      	bset	21181,#2
4101  04a9 202a          	jra	L3712
4102  04ab               L7612:
4103                     ; 1550       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
4105  04ab 721552bd      	bres	21181,#2
4106  04af 2024          	jra	L3712
4107  04b1               L5612:
4108                     ; 1553   else if (TIM1_Channel == TIM1_Channel_2)
4110  04b1 7b01          	ld	a,(OFST+1,sp)
4111  04b3 a101          	cp	a,#1
4112  04b5 2610          	jrne	L5712
4113                     ; 1556     if (NewState != DISABLE)
4115  04b7 0d02          	tnz	(OFST+2,sp)
4116  04b9 2706          	jreq	L7712
4117                     ; 1558       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
4119  04bb 721c52bd      	bset	21181,#6
4121  04bf 2014          	jra	L3712
4122  04c1               L7712:
4123                     ; 1562       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
4125  04c1 721d52bd      	bres	21181,#6
4126  04c5 200e          	jra	L3712
4127  04c7               L5712:
4128                     ; 1568     if (NewState != DISABLE)
4130  04c7 0d02          	tnz	(OFST+2,sp)
4131  04c9 2706          	jreq	L5022
4132                     ; 1570       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
4134  04cb 721452be      	bset	21182,#2
4136  04cf 2004          	jra	L3712
4137  04d1               L5022:
4138                     ; 1574       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
4140  04d1 721552be      	bres	21182,#2
4141  04d5               L3712:
4142                     ; 1577 }
4145  04d5 85            	popw	x
4146  04d6 81            	ret
4314                     ; 1664 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
4314                     ; 1665                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4314                     ; 1666                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
4314                     ; 1667                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4314                     ; 1668                  uint8_t TIM1_ICFilter)
4314                     ; 1669 {
4315                     	switch	.text
4316  04d7               _TIM1_ICInit:
4318  04d7 89            	pushw	x
4319       00000000      OFST:	set	0
4322                     ; 1672   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
4324                     ; 1673   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4326                     ; 1674   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4328                     ; 1675   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4330                     ; 1676   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
4332                     ; 1678   if (TIM1_Channel == TIM1_Channel_1)
4334  04d8 9e            	ld	a,xh
4335  04d9 4d            	tnz	a
4336  04da 2614          	jrne	L5032
4337                     ; 1681     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4339  04dc 7b07          	ld	a,(OFST+7,sp)
4340  04de 88            	push	a
4341  04df 7b06          	ld	a,(OFST+6,sp)
4342  04e1 97            	ld	xl,a
4343  04e2 7b03          	ld	a,(OFST+3,sp)
4344  04e4 95            	ld	xh,a
4345  04e5 cd080c        	call	L3_TI1_Config
4347  04e8 84            	pop	a
4348                     ; 1683     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4350  04e9 7b06          	ld	a,(OFST+6,sp)
4351  04eb cd0640        	call	_TIM1_SetIC1Prescaler
4354  04ee 2046          	jra	L7032
4355  04f0               L5032:
4356                     ; 1685   else if (TIM1_Channel == TIM1_Channel_2)
4358  04f0 7b01          	ld	a,(OFST+1,sp)
4359  04f2 a101          	cp	a,#1
4360  04f4 2614          	jrne	L1132
4361                     ; 1688     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4363  04f6 7b07          	ld	a,(OFST+7,sp)
4364  04f8 88            	push	a
4365  04f9 7b06          	ld	a,(OFST+6,sp)
4366  04fb 97            	ld	xl,a
4367  04fc 7b03          	ld	a,(OFST+3,sp)
4368  04fe 95            	ld	xh,a
4369  04ff cd083c        	call	L5_TI2_Config
4371  0502 84            	pop	a
4372                     ; 1690     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4374  0503 7b06          	ld	a,(OFST+6,sp)
4375  0505 cd064d        	call	_TIM1_SetIC2Prescaler
4378  0508 202c          	jra	L7032
4379  050a               L1132:
4380                     ; 1692   else if (TIM1_Channel == TIM1_Channel_3)
4382  050a 7b01          	ld	a,(OFST+1,sp)
4383  050c a102          	cp	a,#2
4384  050e 2614          	jrne	L5132
4385                     ; 1695     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4387  0510 7b07          	ld	a,(OFST+7,sp)
4388  0512 88            	push	a
4389  0513 7b06          	ld	a,(OFST+6,sp)
4390  0515 97            	ld	xl,a
4391  0516 7b03          	ld	a,(OFST+3,sp)
4392  0518 95            	ld	xh,a
4393  0519 cd086c        	call	L7_TI3_Config
4395  051c 84            	pop	a
4396                     ; 1697     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
4398  051d 7b06          	ld	a,(OFST+6,sp)
4399  051f cd065a        	call	_TIM1_SetIC3Prescaler
4402  0522 2012          	jra	L7032
4403  0524               L5132:
4404                     ; 1702     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4406  0524 7b07          	ld	a,(OFST+7,sp)
4407  0526 88            	push	a
4408  0527 7b06          	ld	a,(OFST+6,sp)
4409  0529 97            	ld	xl,a
4410  052a 7b03          	ld	a,(OFST+3,sp)
4411  052c 95            	ld	xh,a
4412  052d cd089c        	call	L11_TI4_Config
4414  0530 84            	pop	a
4415                     ; 1704     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
4417  0531 7b06          	ld	a,(OFST+6,sp)
4418  0533 cd0667        	call	_TIM1_SetIC4Prescaler
4420  0536               L7032:
4421                     ; 1706 }
4424  0536 85            	popw	x
4425  0537 81            	ret
4523                     ; 1733 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
4523                     ; 1734                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4523                     ; 1735                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
4523                     ; 1736                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4523                     ; 1737                      uint8_t TIM1_ICFilter)
4523                     ; 1738 {
4524                     	switch	.text
4525  0538               _TIM1_PWMIConfig:
4527  0538 89            	pushw	x
4528  0539 89            	pushw	x
4529       00000002      OFST:	set	2
4532                     ; 1739   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
4534                     ; 1740   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
4536                     ; 1743   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
4538                     ; 1744   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4540                     ; 1745   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4542                     ; 1746   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4544                     ; 1749   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
4546  053a 9f            	ld	a,xl
4547  053b a101          	cp	a,#1
4548  053d 2706          	jreq	L7632
4549                     ; 1751     icpolarity = TIM1_ICPolarity_Falling;
4551  053f a601          	ld	a,#1
4552  0541 6b01          	ld	(OFST-1,sp),a
4554  0543 2002          	jra	L1732
4555  0545               L7632:
4556                     ; 1755     icpolarity = TIM1_ICPolarity_Rising;
4558  0545 0f01          	clr	(OFST-1,sp)
4559  0547               L1732:
4560                     ; 1759   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
4562  0547 7b07          	ld	a,(OFST+5,sp)
4563  0549 a101          	cp	a,#1
4564  054b 2606          	jrne	L3732
4565                     ; 1761     icselection = TIM1_ICSelection_IndirectTI;
4567  054d a602          	ld	a,#2
4568  054f 6b02          	ld	(OFST+0,sp),a
4570  0551 2004          	jra	L5732
4571  0553               L3732:
4572                     ; 1765     icselection = TIM1_ICSelection_DirectTI;
4574  0553 a601          	ld	a,#1
4575  0555 6b02          	ld	(OFST+0,sp),a
4576  0557               L5732:
4577                     ; 1768   if (TIM1_Channel == TIM1_Channel_1)
4579  0557 0d03          	tnz	(OFST+1,sp)
4580  0559 2626          	jrne	L7732
4581                     ; 1771     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4583  055b 7b09          	ld	a,(OFST+7,sp)
4584  055d 88            	push	a
4585  055e 7b08          	ld	a,(OFST+6,sp)
4586  0560 97            	ld	xl,a
4587  0561 7b05          	ld	a,(OFST+3,sp)
4588  0563 95            	ld	xh,a
4589  0564 cd080c        	call	L3_TI1_Config
4591  0567 84            	pop	a
4592                     ; 1774     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4594  0568 7b08          	ld	a,(OFST+6,sp)
4595  056a cd0640        	call	_TIM1_SetIC1Prescaler
4597                     ; 1777     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
4599  056d 7b09          	ld	a,(OFST+7,sp)
4600  056f 88            	push	a
4601  0570 7b03          	ld	a,(OFST+1,sp)
4602  0572 97            	ld	xl,a
4603  0573 7b02          	ld	a,(OFST+0,sp)
4604  0575 95            	ld	xh,a
4605  0576 cd083c        	call	L5_TI2_Config
4607  0579 84            	pop	a
4608                     ; 1780     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4610  057a 7b08          	ld	a,(OFST+6,sp)
4611  057c cd064d        	call	_TIM1_SetIC2Prescaler
4614  057f 2024          	jra	L1042
4615  0581               L7732:
4616                     ; 1785     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4618  0581 7b09          	ld	a,(OFST+7,sp)
4619  0583 88            	push	a
4620  0584 7b08          	ld	a,(OFST+6,sp)
4621  0586 97            	ld	xl,a
4622  0587 7b05          	ld	a,(OFST+3,sp)
4623  0589 95            	ld	xh,a
4624  058a cd083c        	call	L5_TI2_Config
4626  058d 84            	pop	a
4627                     ; 1788     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4629  058e 7b08          	ld	a,(OFST+6,sp)
4630  0590 cd064d        	call	_TIM1_SetIC2Prescaler
4632                     ; 1791     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
4634  0593 7b09          	ld	a,(OFST+7,sp)
4635  0595 88            	push	a
4636  0596 7b03          	ld	a,(OFST+1,sp)
4637  0598 97            	ld	xl,a
4638  0599 7b02          	ld	a,(OFST+0,sp)
4639  059b 95            	ld	xh,a
4640  059c cd080c        	call	L3_TI1_Config
4642  059f 84            	pop	a
4643                     ; 1794     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4645  05a0 7b08          	ld	a,(OFST+6,sp)
4646  05a2 cd0640        	call	_TIM1_SetIC1Prescaler
4648  05a5               L1042:
4649                     ; 1796 }
4652  05a5 5b04          	addw	sp,#4
4653  05a7 81            	ret
4705                     ; 1803 uint16_t TIM1_GetCapture1(void)
4705                     ; 1804 {
4706                     	switch	.text
4707  05a8               _TIM1_GetCapture1:
4709  05a8 5204          	subw	sp,#4
4710       00000004      OFST:	set	4
4713                     ; 1807   uint16_t tmpccr1 = 0;
4715                     ; 1808   uint8_t tmpccr1l = 0, tmpccr1h = 0;
4719                     ; 1810   tmpccr1h = TIM1->CCR1H;
4721  05aa c652c6        	ld	a,21190
4722  05ad 6b02          	ld	(OFST-2,sp),a
4723                     ; 1811   tmpccr1l = TIM1->CCR1L;
4725  05af c652c7        	ld	a,21191
4726  05b2 6b01          	ld	(OFST-3,sp),a
4727                     ; 1813   tmpccr1 = (uint16_t)(tmpccr1l);
4729  05b4 7b01          	ld	a,(OFST-3,sp)
4730  05b6 5f            	clrw	x
4731  05b7 97            	ld	xl,a
4732  05b8 1f03          	ldw	(OFST-1,sp),x
4733                     ; 1814   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4735  05ba 7b02          	ld	a,(OFST-2,sp)
4736  05bc 5f            	clrw	x
4737  05bd 97            	ld	xl,a
4738  05be 4f            	clr	a
4739  05bf 02            	rlwa	x,a
4740  05c0 01            	rrwa	x,a
4741  05c1 1a04          	or	a,(OFST+0,sp)
4742  05c3 01            	rrwa	x,a
4743  05c4 1a03          	or	a,(OFST-1,sp)
4744  05c6 01            	rrwa	x,a
4745  05c7 1f03          	ldw	(OFST-1,sp),x
4746                     ; 1816   return (uint16_t)tmpccr1;
4748  05c9 1e03          	ldw	x,(OFST-1,sp)
4751  05cb 5b04          	addw	sp,#4
4752  05cd 81            	ret
4804                     ; 1824 uint16_t TIM1_GetCapture2(void)
4804                     ; 1825 {
4805                     	switch	.text
4806  05ce               _TIM1_GetCapture2:
4808  05ce 5204          	subw	sp,#4
4809       00000004      OFST:	set	4
4812                     ; 1828   uint16_t tmpccr2 = 0;
4814                     ; 1829   uint8_t tmpccr2l = 0, tmpccr2h = 0;
4818                     ; 1831   tmpccr2h = TIM1->CCR2H;
4820  05d0 c652c8        	ld	a,21192
4821  05d3 6b02          	ld	(OFST-2,sp),a
4822                     ; 1832   tmpccr2l = TIM1->CCR2L;
4824  05d5 c652c9        	ld	a,21193
4825  05d8 6b01          	ld	(OFST-3,sp),a
4826                     ; 1834   tmpccr2 = (uint16_t)(tmpccr2l);
4828  05da 7b01          	ld	a,(OFST-3,sp)
4829  05dc 5f            	clrw	x
4830  05dd 97            	ld	xl,a
4831  05de 1f03          	ldw	(OFST-1,sp),x
4832                     ; 1835   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4834  05e0 7b02          	ld	a,(OFST-2,sp)
4835  05e2 5f            	clrw	x
4836  05e3 97            	ld	xl,a
4837  05e4 4f            	clr	a
4838  05e5 02            	rlwa	x,a
4839  05e6 01            	rrwa	x,a
4840  05e7 1a04          	or	a,(OFST+0,sp)
4841  05e9 01            	rrwa	x,a
4842  05ea 1a03          	or	a,(OFST-1,sp)
4843  05ec 01            	rrwa	x,a
4844  05ed 1f03          	ldw	(OFST-1,sp),x
4845                     ; 1837   return (uint16_t)tmpccr2;
4847  05ef 1e03          	ldw	x,(OFST-1,sp)
4850  05f1 5b04          	addw	sp,#4
4851  05f3 81            	ret
4903                     ; 1845 uint16_t TIM1_GetCapture3(void)
4903                     ; 1846 {
4904                     	switch	.text
4905  05f4               _TIM1_GetCapture3:
4907  05f4 5204          	subw	sp,#4
4908       00000004      OFST:	set	4
4911                     ; 1848   uint16_t tmpccr3 = 0;
4913                     ; 1849   uint8_t tmpccr3l = 0, tmpccr3h = 0;
4917                     ; 1851   tmpccr3h = TIM1->CCR3H;
4919  05f6 c652ca        	ld	a,21194
4920  05f9 6b02          	ld	(OFST-2,sp),a
4921                     ; 1852   tmpccr3l = TIM1->CCR3L;
4923  05fb c652cb        	ld	a,21195
4924  05fe 6b01          	ld	(OFST-3,sp),a
4925                     ; 1854   tmpccr3 = (uint16_t)(tmpccr3l);
4927  0600 7b01          	ld	a,(OFST-3,sp)
4928  0602 5f            	clrw	x
4929  0603 97            	ld	xl,a
4930  0604 1f03          	ldw	(OFST-1,sp),x
4931                     ; 1855   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4933  0606 7b02          	ld	a,(OFST-2,sp)
4934  0608 5f            	clrw	x
4935  0609 97            	ld	xl,a
4936  060a 4f            	clr	a
4937  060b 02            	rlwa	x,a
4938  060c 01            	rrwa	x,a
4939  060d 1a04          	or	a,(OFST+0,sp)
4940  060f 01            	rrwa	x,a
4941  0610 1a03          	or	a,(OFST-1,sp)
4942  0612 01            	rrwa	x,a
4943  0613 1f03          	ldw	(OFST-1,sp),x
4944                     ; 1857   return (uint16_t)tmpccr3;
4946  0615 1e03          	ldw	x,(OFST-1,sp)
4949  0617 5b04          	addw	sp,#4
4950  0619 81            	ret
5002                     ; 1865 uint16_t TIM1_GetCapture4(void)
5002                     ; 1866 {
5003                     	switch	.text
5004  061a               _TIM1_GetCapture4:
5006  061a 5204          	subw	sp,#4
5007       00000004      OFST:	set	4
5010                     ; 1868   uint16_t tmpccr4 = 0;
5012                     ; 1869   uint8_t tmpccr4l = 0, tmpccr4h = 0;
5016                     ; 1871   tmpccr4h = TIM1->CCR4H;
5018  061c c652cc        	ld	a,21196
5019  061f 6b02          	ld	(OFST-2,sp),a
5020                     ; 1872   tmpccr4l = TIM1->CCR4L;
5022  0621 c652cd        	ld	a,21197
5023  0624 6b01          	ld	(OFST-3,sp),a
5024                     ; 1874   tmpccr4 = (uint16_t)(tmpccr4l);
5026  0626 7b01          	ld	a,(OFST-3,sp)
5027  0628 5f            	clrw	x
5028  0629 97            	ld	xl,a
5029  062a 1f03          	ldw	(OFST-1,sp),x
5030                     ; 1875   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
5032  062c 7b02          	ld	a,(OFST-2,sp)
5033  062e 5f            	clrw	x
5034  062f 97            	ld	xl,a
5035  0630 4f            	clr	a
5036  0631 02            	rlwa	x,a
5037  0632 01            	rrwa	x,a
5038  0633 1a04          	or	a,(OFST+0,sp)
5039  0635 01            	rrwa	x,a
5040  0636 1a03          	or	a,(OFST-1,sp)
5041  0638 01            	rrwa	x,a
5042  0639 1f03          	ldw	(OFST-1,sp),x
5043                     ; 1877   return (uint16_t)tmpccr4;
5045  063b 1e03          	ldw	x,(OFST-1,sp)
5048  063d 5b04          	addw	sp,#4
5049  063f 81            	ret
5085                     ; 1890 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5085                     ; 1891 {
5086                     	switch	.text
5087  0640               _TIM1_SetIC1Prescaler:
5089  0640 88            	push	a
5090       00000000      OFST:	set	0
5093                     ; 1893   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
5095                     ; 1896   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
5097  0641 c652b9        	ld	a,21177
5098  0644 a4f3          	and	a,#243
5099  0646 1a01          	or	a,(OFST+1,sp)
5100  0648 c752b9        	ld	21177,a
5101                     ; 1897 }
5104  064b 84            	pop	a
5105  064c 81            	ret
5141                     ; 1909 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5141                     ; 1910 {
5142                     	switch	.text
5143  064d               _TIM1_SetIC2Prescaler:
5145  064d 88            	push	a
5146       00000000      OFST:	set	0
5149                     ; 1912   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
5151                     ; 1915   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
5153  064e c652ba        	ld	a,21178
5154  0651 a4f3          	and	a,#243
5155  0653 1a01          	or	a,(OFST+1,sp)
5156  0655 c752ba        	ld	21178,a
5157                     ; 1916 }
5160  0658 84            	pop	a
5161  0659 81            	ret
5197                     ; 1928 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5197                     ; 1929 {
5198                     	switch	.text
5199  065a               _TIM1_SetIC3Prescaler:
5201  065a 88            	push	a
5202       00000000      OFST:	set	0
5205                     ; 1932   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
5207                     ; 1935   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
5209  065b c652bb        	ld	a,21179
5210  065e a4f3          	and	a,#243
5211  0660 1a01          	or	a,(OFST+1,sp)
5212  0662 c752bb        	ld	21179,a
5213                     ; 1936 }
5216  0665 84            	pop	a
5217  0666 81            	ret
5253                     ; 1948 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
5253                     ; 1949 {
5254                     	switch	.text
5255  0667               _TIM1_SetIC4Prescaler:
5257  0667 88            	push	a
5258       00000000      OFST:	set	0
5261                     ; 1952   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
5263                     ; 1955   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
5265  0668 c652bc        	ld	a,21180
5266  066b a4f3          	and	a,#243
5267  066d 1a01          	or	a,(OFST+1,sp)
5268  066f c752bc        	ld	21180,a
5269                     ; 1956 }
5272  0672 84            	pop	a
5273  0673 81            	ret
5380                     ; 1991 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
5380                     ; 1992 {
5381                     	switch	.text
5382  0674               _TIM1_ITConfig:
5384  0674 89            	pushw	x
5385       00000000      OFST:	set	0
5388                     ; 1994   assert_param(IS_TIM1_IT(TIM1_IT));
5390                     ; 1995   assert_param(IS_FUNCTIONAL_STATE(NewState));
5392                     ; 1997   if (NewState != DISABLE)
5394  0675 9f            	ld	a,xl
5395  0676 4d            	tnz	a
5396  0677 2709          	jreq	L1762
5397                     ; 2000     TIM1->IER |= (uint8_t)TIM1_IT;
5399  0679 9e            	ld	a,xh
5400  067a ca52b5        	or	a,21173
5401  067d c752b5        	ld	21173,a
5403  0680 2009          	jra	L3762
5404  0682               L1762:
5405                     ; 2005     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
5407  0682 7b01          	ld	a,(OFST+1,sp)
5408  0684 43            	cpl	a
5409  0685 c452b5        	and	a,21173
5410  0688 c752b5        	ld	21173,a
5411  068b               L3762:
5412                     ; 2007 }
5415  068b 85            	popw	x
5416  068c 81            	ret
5521                     ; 2023 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5521                     ; 2024 {
5522                     	switch	.text
5523  068d               _TIM1_GenerateEvent:
5527                     ; 2026   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
5529                     ; 2029   TIM1->EGR = (uint8_t)TIM1_EventSource;
5531  068d c752b8        	ld	21176,a
5532                     ; 2030 }
5535  0690 81            	ret
5709                     ; 2049 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
5709                     ; 2050 {
5710                     	switch	.text
5711  0691               _TIM1_GetFlagStatus:
5713  0691 89            	pushw	x
5714  0692 89            	pushw	x
5715       00000002      OFST:	set	2
5718                     ; 2051   FlagStatus bitstatus = RESET;
5720                     ; 2052   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
5724                     ; 2055   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
5726                     ; 2057   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
5728  0693 9f            	ld	a,xl
5729  0694 c452b6        	and	a,21174
5730  0697 6b01          	ld	(OFST-1,sp),a
5731                     ; 2058   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
5733  0699 c652b7        	ld	a,21175
5734  069c 1403          	and	a,(OFST+1,sp)
5735  069e 6b02          	ld	(OFST+0,sp),a
5736                     ; 2060   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
5738  06a0 7b01          	ld	a,(OFST-1,sp)
5739  06a2 1a02          	or	a,(OFST+0,sp)
5740  06a4 2706          	jreq	L5303
5741                     ; 2062     bitstatus = SET;
5743  06a6 a601          	ld	a,#1
5744  06a8 6b02          	ld	(OFST+0,sp),a
5746  06aa 2002          	jra	L7303
5747  06ac               L5303:
5748                     ; 2066     bitstatus = RESET;
5750  06ac 0f02          	clr	(OFST+0,sp)
5751  06ae               L7303:
5752                     ; 2068   return (FlagStatus)(bitstatus);
5754  06ae 7b02          	ld	a,(OFST+0,sp)
5757  06b0 5b04          	addw	sp,#4
5758  06b2 81            	ret
5793                     ; 2089 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
5793                     ; 2090 {
5794                     	switch	.text
5795  06b3               _TIM1_ClearFlag:
5797  06b3 89            	pushw	x
5798       00000000      OFST:	set	0
5801                     ; 2092   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
5803                     ; 2095   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
5805  06b4 9f            	ld	a,xl
5806  06b5 43            	cpl	a
5807  06b6 c752b6        	ld	21174,a
5808                     ; 2096   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
5810  06b9 7b01          	ld	a,(OFST+1,sp)
5811  06bb 43            	cpl	a
5812  06bc a41e          	and	a,#30
5813  06be c752b7        	ld	21175,a
5814                     ; 2097 }
5817  06c1 85            	popw	x
5818  06c2 81            	ret
5882                     ; 2114 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
5882                     ; 2115 {
5883                     	switch	.text
5884  06c3               _TIM1_GetITStatus:
5886  06c3 88            	push	a
5887  06c4 89            	pushw	x
5888       00000002      OFST:	set	2
5891                     ; 2116   ITStatus bitstatus = RESET;
5893                     ; 2118   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
5897                     ; 2121   assert_param(IS_TIM1_GET_IT(TIM1_IT));
5899                     ; 2123   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
5901  06c5 c452b6        	and	a,21174
5902  06c8 6b01          	ld	(OFST-1,sp),a
5903                     ; 2125   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
5905  06ca c652b5        	ld	a,21173
5906  06cd 1403          	and	a,(OFST+1,sp)
5907  06cf 6b02          	ld	(OFST+0,sp),a
5908                     ; 2127   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
5910  06d1 0d01          	tnz	(OFST-1,sp)
5911  06d3 270a          	jreq	L1113
5913  06d5 0d02          	tnz	(OFST+0,sp)
5914  06d7 2706          	jreq	L1113
5915                     ; 2129     bitstatus = SET;
5917  06d9 a601          	ld	a,#1
5918  06db 6b02          	ld	(OFST+0,sp),a
5920  06dd 2002          	jra	L3113
5921  06df               L1113:
5922                     ; 2133     bitstatus = RESET;
5924  06df 0f02          	clr	(OFST+0,sp)
5925  06e1               L3113:
5926                     ; 2135   return (ITStatus)(bitstatus);
5928  06e1 7b02          	ld	a,(OFST+0,sp)
5931  06e3 5b03          	addw	sp,#3
5932  06e5 81            	ret
5968                     ; 2152 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
5968                     ; 2153 {
5969                     	switch	.text
5970  06e6               _TIM1_ClearITPendingBit:
5974                     ; 2155   assert_param(IS_TIM1_IT(TIM1_IT));
5976                     ; 2158   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
5978  06e6 43            	cpl	a
5979  06e7 c752b6        	ld	21174,a
5980                     ; 2159 }
5983  06ea 81            	ret
6521                     ; 2167 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
6521                     ; 2168                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
6521                     ; 2169 {
6522                     	switch	.text
6523  06eb               _TIM1_DMAConfig:
6527                     ; 2171   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
6529                     ; 2172   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
6531                     ; 2175   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
6533  06eb 9e            	ld	a,xh
6534  06ec c752d1        	ld	21201,a
6535                     ; 2176   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
6537  06ef 9f            	ld	a,xl
6538  06f0 c752d2        	ld	21202,a
6539                     ; 2177 }
6542  06f3 81            	ret
6636                     ; 2189 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
6636                     ; 2190 {
6637                     	switch	.text
6638  06f4               _TIM1_DMACmd:
6640  06f4 89            	pushw	x
6641       00000000      OFST:	set	0
6644                     ; 2192   assert_param(IS_FUNCTIONAL_STATE(NewState));
6646                     ; 2193   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
6648                     ; 2195   if (NewState != DISABLE)
6650  06f5 9f            	ld	a,xl
6651  06f6 4d            	tnz	a
6652  06f7 2709          	jreq	L7243
6653                     ; 2198     TIM1->DER |= (uint8_t)TIM1_DMASource;
6655  06f9 9e            	ld	a,xh
6656  06fa ca52b4        	or	a,21172
6657  06fd c752b4        	ld	21172,a
6659  0700 2009          	jra	L1343
6660  0702               L7243:
6661                     ; 2203     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
6663  0702 7b01          	ld	a,(OFST+1,sp)
6664  0704 43            	cpl	a
6665  0705 c452b4        	and	a,21172
6666  0708 c752b4        	ld	21172,a
6667  070b               L1343:
6668                     ; 2205 }
6671  070b 85            	popw	x
6672  070c 81            	ret
6707                     ; 2213 void TIM1_SelectCCDMA(FunctionalState NewState)
6707                     ; 2214 {
6708                     	switch	.text
6709  070d               _TIM1_SelectCCDMA:
6713                     ; 2216   assert_param(IS_FUNCTIONAL_STATE(NewState));
6715                     ; 2218   if (NewState != DISABLE)
6717  070d 4d            	tnz	a
6718  070e 2706          	jreq	L1543
6719                     ; 2221     TIM1->CR2 |= TIM1_CR2_CCDS;
6721  0710 721652b1      	bset	21169,#3
6723  0714 2004          	jra	L3543
6724  0716               L1543:
6725                     ; 2226     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
6727  0716 721752b1      	bres	21169,#3
6728  071a               L3543:
6729                     ; 2228 }
6732  071a 81            	ret
6756                     ; 2251 void TIM1_InternalClockConfig(void)
6756                     ; 2252 {
6757                     	switch	.text
6758  071b               _TIM1_InternalClockConfig:
6762                     ; 2254   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
6764  071b c652b2        	ld	a,21170
6765  071e a4f8          	and	a,#248
6766  0720 c752b2        	ld	21170,a
6767                     ; 2255 }
6770  0723 81            	ret
6859                     ; 2272 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
6859                     ; 2273                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
6859                     ; 2274                                  uint8_t ICFilter)
6859                     ; 2275 {
6860                     	switch	.text
6861  0724               _TIM1_TIxExternalClockConfig:
6863  0724 89            	pushw	x
6864       00000000      OFST:	set	0
6867                     ; 2277   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
6869                     ; 2278   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
6871                     ; 2279   assert_param(IS_TIM1_IC_FILTER(ICFilter));
6873                     ; 2282   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
6875  0725 9e            	ld	a,xh
6876  0726 a160          	cp	a,#96
6877  0728 260f          	jrne	L5253
6878                     ; 2284     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6880  072a 7b05          	ld	a,(OFST+5,sp)
6881  072c 88            	push	a
6882  072d ae0001        	ldw	x,#1
6883  0730 7b03          	ld	a,(OFST+3,sp)
6884  0732 95            	ld	xh,a
6885  0733 cd083c        	call	L5_TI2_Config
6887  0736 84            	pop	a
6889  0737 200d          	jra	L7253
6890  0739               L5253:
6891                     ; 2288     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6893  0739 7b05          	ld	a,(OFST+5,sp)
6894  073b 88            	push	a
6895  073c ae0001        	ldw	x,#1
6896  073f 7b03          	ld	a,(OFST+3,sp)
6897  0741 95            	ld	xh,a
6898  0742 cd080c        	call	L3_TI1_Config
6900  0745 84            	pop	a
6901  0746               L7253:
6902                     ; 2292   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
6904  0746 7b01          	ld	a,(OFST+1,sp)
6905  0748 ad34          	call	_TIM1_SelectInputTrigger
6907                     ; 2295   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
6909  074a c652b2        	ld	a,21170
6910  074d aa07          	or	a,#7
6911  074f c752b2        	ld	21170,a
6912                     ; 2296 }
6915  0752 85            	popw	x
6916  0753 81            	ret
7033                     ; 2314 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7033                     ; 2315                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7033                     ; 2316                               uint8_t ExtTRGFilter)
7033                     ; 2317 {
7034                     	switch	.text
7035  0754               _TIM1_ETRClockMode1Config:
7037  0754 89            	pushw	x
7038       00000000      OFST:	set	0
7041                     ; 2319   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7043                     ; 2320   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7045                     ; 2321   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7047                     ; 2324   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7049  0755 7b05          	ld	a,(OFST+5,sp)
7050  0757 88            	push	a
7051  0758 9f            	ld	a,xl
7052  0759 97            	ld	xl,a
7053  075a 7b02          	ld	a,(OFST+2,sp)
7054  075c 95            	ld	xh,a
7055  075d ad54          	call	_TIM1_ETRConfig
7057  075f 84            	pop	a
7058                     ; 2327   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
7058                     ; 2328                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
7060  0760 c652b2        	ld	a,21170
7061  0763 a488          	and	a,#136
7062  0765 aa77          	or	a,#119
7063  0767 c752b2        	ld	21170,a
7064                     ; 2329 }
7067  076a 85            	popw	x
7068  076b 81            	ret
7126                     ; 2347 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7126                     ; 2348                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7126                     ; 2349                               uint8_t ExtTRGFilter)
7126                     ; 2350 {
7127                     	switch	.text
7128  076c               _TIM1_ETRClockMode2Config:
7130  076c 89            	pushw	x
7131       00000000      OFST:	set	0
7134                     ; 2352   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7136                     ; 2353   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7138                     ; 2356   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7140  076d 7b05          	ld	a,(OFST+5,sp)
7141  076f 88            	push	a
7142  0770 9f            	ld	a,xl
7143  0771 97            	ld	xl,a
7144  0772 7b02          	ld	a,(OFST+2,sp)
7145  0774 95            	ld	xh,a
7146  0775 ad3c          	call	_TIM1_ETRConfig
7148  0777 84            	pop	a
7149                     ; 2359   TIM1->ETR |= TIM1_ETR_ECE;
7151  0778 721c52b3      	bset	21171,#6
7152                     ; 2360 }
7155  077c 85            	popw	x
7156  077d 81            	ret
7263                     ; 2410 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
7263                     ; 2411 {
7264                     	switch	.text
7265  077e               _TIM1_SelectInputTrigger:
7267  077e 88            	push	a
7268       00000000      OFST:	set	0
7271                     ; 2413   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
7273                     ; 2416   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
7275  077f c652b2        	ld	a,21170
7276  0782 a48f          	and	a,#143
7277  0784 1a01          	or	a,(OFST+1,sp)
7278  0786 c752b2        	ld	21170,a
7279                     ; 2417 }
7282  0789 84            	pop	a
7283  078a 81            	ret
7389                     ; 2433 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
7389                     ; 2434 {
7390                     	switch	.text
7391  078b               _TIM1_SelectOutputTrigger:
7393  078b 88            	push	a
7394       00000000      OFST:	set	0
7397                     ; 2436   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
7399                     ; 2438   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
7401  078c c652b1        	ld	a,21169
7402  078f a48f          	and	a,#143
7403  0791 1a01          	or	a,(OFST+1,sp)
7404  0793 c752b1        	ld	21169,a
7405                     ; 2439 }
7408  0796 84            	pop	a
7409  0797 81            	ret
7483                     ; 2451 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
7483                     ; 2452 {
7484                     	switch	.text
7485  0798               _TIM1_SelectSlaveMode:
7487  0798 88            	push	a
7488       00000000      OFST:	set	0
7491                     ; 2454   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
7493                     ; 2457   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
7495  0799 c652b2        	ld	a,21170
7496  079c a4f8          	and	a,#248
7497  079e 1a01          	or	a,(OFST+1,sp)
7498  07a0 c752b2        	ld	21170,a
7499                     ; 2459 }
7502  07a3 84            	pop	a
7503  07a4 81            	ret
7539                     ; 2467 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
7539                     ; 2468 {
7540                     	switch	.text
7541  07a5               _TIM1_SelectMasterSlaveMode:
7545                     ; 2470   assert_param(IS_FUNCTIONAL_STATE(NewState));
7547                     ; 2473   if (NewState != DISABLE)
7549  07a5 4d            	tnz	a
7550  07a6 2706          	jreq	L5004
7551                     ; 2475     TIM1->SMCR |= TIM1_SMCR_MSM;
7553  07a8 721e52b2      	bset	21170,#7
7555  07ac 2004          	jra	L7004
7556  07ae               L5004:
7557                     ; 2479     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
7559  07ae 721f52b2      	bres	21170,#7
7560  07b2               L7004:
7561                     ; 2481 }
7564  07b2 81            	ret
7620                     ; 2499 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7620                     ; 2500                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7620                     ; 2501                     uint8_t ExtTRGFilter)
7620                     ; 2502 {
7621                     	switch	.text
7622  07b3               _TIM1_ETRConfig:
7624  07b3 89            	pushw	x
7625       00000000      OFST:	set	0
7628                     ; 2503   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7630                     ; 2506   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
7630                     ; 2507                                    | (uint8_t) TIM1_ExtTRGPolarity)
7630                     ; 2508                          | (uint8_t) ExtTRGFilter);
7632  07b4 9f            	ld	a,xl
7633  07b5 1a01          	or	a,(OFST+1,sp)
7634  07b7 1a05          	or	a,(OFST+5,sp)
7635  07b9 ca52b3        	or	a,21171
7636  07bc c752b3        	ld	21171,a
7637                     ; 2509 }
7640  07bf 85            	popw	x
7641  07c0 81            	ret
7727                     ; 2547 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
7727                     ; 2548                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
7727                     ; 2549                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
7727                     ; 2550 {
7728                     	switch	.text
7729  07c1               _TIM1_EncoderInterfaceConfig:
7731  07c1 89            	pushw	x
7732       00000000      OFST:	set	0
7735                     ; 2552   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
7737                     ; 2553   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
7739                     ; 2554   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
7741                     ; 2557   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
7743  07c2 9f            	ld	a,xl
7744  07c3 4d            	tnz	a
7745  07c4 2706          	jreq	L7704
7746                     ; 2559     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7748  07c6 721252bd      	bset	21181,#1
7750  07ca 2004          	jra	L1014
7751  07cc               L7704:
7752                     ; 2563     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7754  07cc 721352bd      	bres	21181,#1
7755  07d0               L1014:
7756                     ; 2566   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
7758  07d0 0d05          	tnz	(OFST+5,sp)
7759  07d2 2706          	jreq	L3014
7760                     ; 2568     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7762  07d4 721a52bd      	bset	21181,#5
7764  07d8 2004          	jra	L5014
7765  07da               L3014:
7766                     ; 2572     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7768  07da 721b52bd      	bres	21181,#5
7769  07de               L5014:
7770                     ; 2575   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
7772  07de c652b2        	ld	a,21170
7773  07e1 a4f0          	and	a,#240
7774  07e3 1a01          	or	a,(OFST+1,sp)
7775  07e5 c752b2        	ld	21170,a
7776                     ; 2578   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
7778  07e8 c652b9        	ld	a,21177
7779  07eb a4fc          	and	a,#252
7780  07ed aa01          	or	a,#1
7781  07ef c752b9        	ld	21177,a
7782                     ; 2579   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
7784  07f2 c652ba        	ld	a,21178
7785  07f5 a4fc          	and	a,#252
7786  07f7 aa01          	or	a,#1
7787  07f9 c752ba        	ld	21178,a
7788                     ; 2581 }
7791  07fc 85            	popw	x
7792  07fd 81            	ret
7828                     ; 2589 void TIM1_SelectHallSensor(FunctionalState NewState)
7828                     ; 2590 {
7829                     	switch	.text
7830  07fe               _TIM1_SelectHallSensor:
7834                     ; 2592   assert_param(IS_FUNCTIONAL_STATE(NewState));
7836                     ; 2595   if (NewState != DISABLE)
7838  07fe 4d            	tnz	a
7839  07ff 2706          	jreq	L5214
7840                     ; 2597     TIM1->CR2 |= TIM1_CR2_TI1S;
7842  0801 721e52b1      	bset	21169,#7
7844  0805 2004          	jra	L7214
7845  0807               L5214:
7846                     ; 2601     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
7848  0807 721f52b1      	bres	21169,#7
7849  080b               L7214:
7850                     ; 2603 }
7853  080b 81            	ret
7905                     ; 2623 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7905                     ; 2624 {
7906                     	switch	.text
7907  080c               L3_TI1_Config:
7909  080c 89            	pushw	x
7910  080d 88            	push	a
7911       00000001      OFST:	set	1
7914                     ; 2627   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7916  080e 721152bd      	bres	21181,#0
7917                     ; 2630   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7917                     ; 2631                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7919  0812 7b06          	ld	a,(OFST+5,sp)
7920  0814 97            	ld	xl,a
7921  0815 a610          	ld	a,#16
7922  0817 42            	mul	x,a
7923  0818 9f            	ld	a,xl
7924  0819 1a03          	or	a,(OFST+2,sp)
7925  081b 6b01          	ld	(OFST+0,sp),a
7926  081d c652b9        	ld	a,21177
7927  0820 a40c          	and	a,#12
7928  0822 1a01          	or	a,(OFST+0,sp)
7929  0824 c752b9        	ld	21177,a
7930                     ; 2636   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7932  0827 0d02          	tnz	(OFST+1,sp)
7933  0829 2706          	jreq	L7514
7934                     ; 2638     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7936  082b 721252bd      	bset	21181,#1
7938  082f 2004          	jra	L1614
7939  0831               L7514:
7940                     ; 2642     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7942  0831 721352bd      	bres	21181,#1
7943  0835               L1614:
7944                     ; 2646   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7946  0835 721052bd      	bset	21181,#0
7947                     ; 2647 }
7950  0839 5b03          	addw	sp,#3
7951  083b 81            	ret
8003                     ; 2663 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8003                     ; 2664 {
8004                     	switch	.text
8005  083c               L5_TI2_Config:
8007  083c 89            	pushw	x
8008  083d 88            	push	a
8009       00000001      OFST:	set	1
8012                     ; 2666   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
8014  083e 721952bd      	bres	21181,#4
8015                     ; 2669   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8015                     ; 2670                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8017  0842 7b06          	ld	a,(OFST+5,sp)
8018  0844 97            	ld	xl,a
8019  0845 a610          	ld	a,#16
8020  0847 42            	mul	x,a
8021  0848 9f            	ld	a,xl
8022  0849 1a03          	or	a,(OFST+2,sp)
8023  084b 6b01          	ld	(OFST+0,sp),a
8024  084d c652ba        	ld	a,21178
8025  0850 a40c          	and	a,#12
8026  0852 1a01          	or	a,(OFST+0,sp)
8027  0854 c752ba        	ld	21178,a
8028                     ; 2672   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8030  0857 0d02          	tnz	(OFST+1,sp)
8031  0859 2706          	jreq	L1124
8032                     ; 2674     TIM1->CCER1 |= TIM1_CCER1_CC2P;
8034  085b 721a52bd      	bset	21181,#5
8036  085f 2004          	jra	L3124
8037  0861               L1124:
8038                     ; 2678     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
8040  0861 721b52bd      	bres	21181,#5
8041  0865               L3124:
8042                     ; 2681   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
8044  0865 721852bd      	bset	21181,#4
8045                     ; 2682 }
8048  0869 5b03          	addw	sp,#3
8049  086b 81            	ret
8101                     ; 2698 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8101                     ; 2699 {
8102                     	switch	.text
8103  086c               L7_TI3_Config:
8105  086c 89            	pushw	x
8106  086d 88            	push	a
8107       00000001      OFST:	set	1
8110                     ; 2701   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
8112  086e 721152be      	bres	21182,#0
8113                     ; 2704   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8113                     ; 2705                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8115  0872 7b06          	ld	a,(OFST+5,sp)
8116  0874 97            	ld	xl,a
8117  0875 a610          	ld	a,#16
8118  0877 42            	mul	x,a
8119  0878 9f            	ld	a,xl
8120  0879 1a03          	or	a,(OFST+2,sp)
8121  087b 6b01          	ld	(OFST+0,sp),a
8122  087d c652bb        	ld	a,21179
8123  0880 a40c          	and	a,#12
8124  0882 1a01          	or	a,(OFST+0,sp)
8125  0884 c752bb        	ld	21179,a
8126                     ; 2708   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8128  0887 0d02          	tnz	(OFST+1,sp)
8129  0889 2706          	jreq	L3424
8130                     ; 2710     TIM1->CCER2 |= TIM1_CCER2_CC3P;
8132  088b 721252be      	bset	21182,#1
8134  088f 2004          	jra	L5424
8135  0891               L3424:
8136                     ; 2714     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
8138  0891 721352be      	bres	21182,#1
8139  0895               L5424:
8140                     ; 2717   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
8142  0895 721052be      	bset	21182,#0
8143                     ; 2718 }
8146  0899 5b03          	addw	sp,#3
8147  089b 81            	ret
8199                     ; 2733 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8199                     ; 2734 {
8200                     	switch	.text
8201  089c               L11_TI4_Config:
8203  089c 89            	pushw	x
8204  089d 88            	push	a
8205       00000001      OFST:	set	1
8208                     ; 2737   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8210  089e 721952be      	bres	21182,#4
8211                     ; 2740   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8211                     ; 2741                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8213  08a2 7b06          	ld	a,(OFST+5,sp)
8214  08a4 97            	ld	xl,a
8215  08a5 a610          	ld	a,#16
8216  08a7 42            	mul	x,a
8217  08a8 9f            	ld	a,xl
8218  08a9 1a03          	or	a,(OFST+2,sp)
8219  08ab 6b01          	ld	(OFST+0,sp),a
8220  08ad c652bc        	ld	a,21180
8221  08b0 a40c          	and	a,#12
8222  08b2 1a01          	or	a,(OFST+0,sp)
8223  08b4 c752bc        	ld	21180,a
8224                     ; 2744   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8226  08b7 0d02          	tnz	(OFST+1,sp)
8227  08b9 2706          	jreq	L5724
8228                     ; 2746     TIM1->CCER2 |= TIM1_CCER2_CC4P;
8230  08bb 721a52be      	bset	21182,#5
8232  08bf 2004          	jra	L7724
8233  08c1               L5724:
8234                     ; 2750     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
8236  08c1 721b52be      	bres	21182,#5
8237  08c5               L7724:
8238                     ; 2754   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
8240  08c5 721852be      	bset	21182,#4
8241                     ; 2755 }
8244  08c9 5b03          	addw	sp,#3
8245  08cb 81            	ret
8258                     	xdef	_TIM1_SelectHallSensor
8259                     	xdef	_TIM1_EncoderInterfaceConfig
8260                     	xdef	_TIM1_ETRConfig
8261                     	xdef	_TIM1_SelectMasterSlaveMode
8262                     	xdef	_TIM1_SelectSlaveMode
8263                     	xdef	_TIM1_SelectOutputTrigger
8264                     	xdef	_TIM1_SelectInputTrigger
8265                     	xdef	_TIM1_ETRClockMode2Config
8266                     	xdef	_TIM1_ETRClockMode1Config
8267                     	xdef	_TIM1_TIxExternalClockConfig
8268                     	xdef	_TIM1_InternalClockConfig
8269                     	xdef	_TIM1_SelectCCDMA
8270                     	xdef	_TIM1_DMACmd
8271                     	xdef	_TIM1_DMAConfig
8272                     	xdef	_TIM1_ClearITPendingBit
8273                     	xdef	_TIM1_GetITStatus
8274                     	xdef	_TIM1_ClearFlag
8275                     	xdef	_TIM1_GetFlagStatus
8276                     	xdef	_TIM1_GenerateEvent
8277                     	xdef	_TIM1_ITConfig
8278                     	xdef	_TIM1_SetIC4Prescaler
8279                     	xdef	_TIM1_SetIC3Prescaler
8280                     	xdef	_TIM1_SetIC2Prescaler
8281                     	xdef	_TIM1_SetIC1Prescaler
8282                     	xdef	_TIM1_GetCapture4
8283                     	xdef	_TIM1_GetCapture3
8284                     	xdef	_TIM1_GetCapture2
8285                     	xdef	_TIM1_GetCapture1
8286                     	xdef	_TIM1_PWMIConfig
8287                     	xdef	_TIM1_ICInit
8288                     	xdef	_TIM1_CCxNCmd
8289                     	xdef	_TIM1_CCxCmd
8290                     	xdef	_TIM1_SelectCOM
8291                     	xdef	_TIM1_SelectOCREFClear
8292                     	xdef	_TIM1_OC3NPolarityConfig
8293                     	xdef	_TIM1_OC3PolarityConfig
8294                     	xdef	_TIM1_OC2NPolarityConfig
8295                     	xdef	_TIM1_OC2PolarityConfig
8296                     	xdef	_TIM1_OC1NPolarityConfig
8297                     	xdef	_TIM1_OC1PolarityConfig
8298                     	xdef	_TIM1_ClearOC4Ref
8299                     	xdef	_TIM1_ClearOC3Ref
8300                     	xdef	_TIM1_ClearOC2Ref
8301                     	xdef	_TIM1_ClearOC1Ref
8302                     	xdef	_TIM1_OC3FastConfig
8303                     	xdef	_TIM1_OC2FastConfig
8304                     	xdef	_TIM1_OC1FastConfig
8305                     	xdef	_TIM1_OC4PreloadConfig
8306                     	xdef	_TIM1_OC3PreloadConfig
8307                     	xdef	_TIM1_OC2PreloadConfig
8308                     	xdef	_TIM1_OC1PreloadConfig
8309                     	xdef	_TIM1_ForcedOC3Config
8310                     	xdef	_TIM1_ForcedOC2Config
8311                     	xdef	_TIM1_ForcedOC1Config
8312                     	xdef	_TIM1_CCPreloadControl
8313                     	xdef	_TIM1_SetCompare4
8314                     	xdef	_TIM1_SetCompare3
8315                     	xdef	_TIM1_SetCompare2
8316                     	xdef	_TIM1_SetCompare1
8317                     	xdef	_TIM1_SelectOCxM
8318                     	xdef	_TIM1_CtrlPWMOutputs
8319                     	xdef	_TIM1_BDTRConfig
8320                     	xdef	_TIM1_OC3Init
8321                     	xdef	_TIM1_OC2Init
8322                     	xdef	_TIM1_OC1Init
8323                     	xdef	_TIM1_Cmd
8324                     	xdef	_TIM1_SelectOnePulseMode
8325                     	xdef	_TIM1_ARRPreloadConfig
8326                     	xdef	_TIM1_UpdateRequestConfig
8327                     	xdef	_TIM1_UpdateDisableConfig
8328                     	xdef	_TIM1_GetPrescaler
8329                     	xdef	_TIM1_GetCounter
8330                     	xdef	_TIM1_SetAutoreload
8331                     	xdef	_TIM1_SetCounter
8332                     	xdef	_TIM1_CounterModeConfig
8333                     	xdef	_TIM1_PrescalerConfig
8334                     	xdef	_TIM1_TimeBaseInit
8335                     	xdef	_TIM1_DeInit
8354                     	end
