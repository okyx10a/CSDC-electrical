   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  43                     ; 130 void TIM4_DeInit(void)
  43                     ; 131 {
  45                     	switch	.text
  46  0000               _TIM4_DeInit:
  50                     ; 132   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  52  0000 725f52e0      	clr	21216
  53                     ; 133   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  55  0004 725f52e1      	clr	21217
  56                     ; 134   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  58  0008 725f52e2      	clr	21218
  59                     ; 135   TIM4->IER   = TIM4_IER_RESET_VALUE;
  61  000c 725f52e4      	clr	21220
  62                     ; 136   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  64  0010 725f52e7      	clr	21223
  65                     ; 137   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  67  0014 725f52e8      	clr	21224
  68                     ; 138   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  70  0018 35ff52e9      	mov	21225,#255
  71                     ; 139   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  73  001c 725f52e5      	clr	21221
  74                     ; 140 }
  77  0020 81            	ret
 245                     ; 165 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 245                     ; 166                        uint8_t TIM4_Period)
 245                     ; 167 {
 246                     	switch	.text
 247  0021               _TIM4_TimeBaseInit:
 251                     ; 169   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 253                     ; 171   TIM4->ARR = (uint8_t)(TIM4_Period);
 255  0021 9f            	ld	a,xl
 256  0022 c752e9        	ld	21225,a
 257                     ; 173   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 259  0025 9e            	ld	a,xh
 260  0026 c752e8        	ld	21224,a
 261                     ; 176   TIM4->EGR = TIM4_EventSource_Update;
 263  0029 350152e6      	mov	21222,#1
 264                     ; 177 }
 267  002d 81            	ret
 335                     ; 205 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 335                     ; 206                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 335                     ; 207 {
 336                     	switch	.text
 337  002e               _TIM4_PrescalerConfig:
 341                     ; 209   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 343                     ; 210   assert_param(IS_TIM4_Prescaler(Prescaler));
 345                     ; 213   TIM4->PSCR = (uint8_t) Prescaler;
 347  002e 9e            	ld	a,xh
 348  002f c752e8        	ld	21224,a
 349                     ; 216   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
 351  0032 9f            	ld	a,xl
 352  0033 a101          	cp	a,#1
 353  0035 2606          	jrne	L141
 354                     ; 218     TIM4->EGR |= TIM4_EGR_UG ;
 356  0037 721052e6      	bset	21222,#0
 358  003b 2004          	jra	L341
 359  003d               L141:
 360                     ; 222     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 362  003d 721152e6      	bres	21222,#0
 363  0041               L341:
 364                     ; 224 }
 367  0041 81            	ret
 401                     ; 232 void TIM4_SetCounter(uint8_t Counter)
 401                     ; 233 {
 402                     	switch	.text
 403  0042               _TIM4_SetCounter:
 407                     ; 235   TIM4->CNTR = (uint8_t)(Counter);
 409  0042 c752e7        	ld	21223,a
 410                     ; 236 }
 413  0045 81            	ret
 447                     ; 244 void TIM4_SetAutoreload(uint8_t Autoreload)
 447                     ; 245 {
 448                     	switch	.text
 449  0046               _TIM4_SetAutoreload:
 453                     ; 247   TIM4->ARR = (uint8_t)(Autoreload);
 455  0046 c752e9        	ld	21225,a
 456                     ; 248 }
 459  0049 81            	ret
 493                     ; 255 uint8_t TIM4_GetCounter(void)
 493                     ; 256 {
 494                     	switch	.text
 495  004a               _TIM4_GetCounter:
 497  004a 88            	push	a
 498       00000001      OFST:	set	1
 501                     ; 257   uint8_t tmpcntr = 0;
 503                     ; 258   tmpcntr = TIM4->CNTR;
 505  004b c652e7        	ld	a,21223
 506  004e 6b01          	ld	(OFST+0,sp),a
 507                     ; 260   return ((uint8_t)tmpcntr);
 509  0050 7b01          	ld	a,(OFST+0,sp)
 512  0052 5b01          	addw	sp,#1
 513  0054 81            	ret
 537                     ; 284 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 537                     ; 285 {
 538                     	switch	.text
 539  0055               _TIM4_GetPrescaler:
 543                     ; 287   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 545  0055 c652e8        	ld	a,21224
 548  0058 81            	ret
 604                     ; 296 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 604                     ; 297 {
 605                     	switch	.text
 606  0059               _TIM4_UpdateDisableConfig:
 610                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 612                     ; 302   if (NewState != DISABLE)
 614  0059 4d            	tnz	a
 615  005a 2706          	jreq	L552
 616                     ; 304     TIM4->CR1 |= TIM4_CR1_UDIS ;
 618  005c 721252e0      	bset	21216,#1
 620  0060 2004          	jra	L752
 621  0062               L552:
 622                     ; 308     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 624  0062 721352e0      	bres	21216,#1
 625  0066               L752:
 626                     ; 310 }
 629  0066 81            	ret
 687                     ; 320 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 687                     ; 321 {
 688                     	switch	.text
 689  0067               _TIM4_UpdateRequestConfig:
 693                     ; 323   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 695                     ; 326   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 697  0067 a101          	cp	a,#1
 698  0069 2606          	jrne	L703
 699                     ; 328     TIM4->CR1 |= TIM4_CR1_URS ;
 701  006b 721452e0      	bset	21216,#2
 703  006f 2004          	jra	L113
 704  0071               L703:
 705                     ; 332     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 707  0071 721552e0      	bres	21216,#2
 708  0075               L113:
 709                     ; 334 }
 712  0075 81            	ret
 748                     ; 342 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 748                     ; 343 {
 749                     	switch	.text
 750  0076               _TIM4_ARRPreloadConfig:
 754                     ; 345   assert_param(IS_FUNCTIONAL_STATE(NewState));
 756                     ; 348   if (NewState != DISABLE)
 758  0076 4d            	tnz	a
 759  0077 2706          	jreq	L133
 760                     ; 350     TIM4->CR1 |= TIM4_CR1_ARPE ;
 762  0079 721e52e0      	bset	21216,#7
 764  007d 2004          	jra	L333
 765  007f               L133:
 766                     ; 354     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 768  007f 721f52e0      	bres	21216,#7
 769  0083               L333:
 770                     ; 356 }
 773  0083 81            	ret
 830                     ; 366 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 830                     ; 367 {
 831                     	switch	.text
 832  0084               _TIM4_SelectOnePulseMode:
 836                     ; 369   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 838                     ; 372   if (TIM4_OPMode == TIM4_OPMode_Single)
 840  0084 a101          	cp	a,#1
 841  0086 2606          	jrne	L363
 842                     ; 374     TIM4->CR1 |= TIM4_CR1_OPM ;
 844  0088 721652e0      	bset	21216,#3
 846  008c 2004          	jra	L563
 847  008e               L363:
 848                     ; 378     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 850  008e 721752e0      	bres	21216,#3
 851  0092               L563:
 852                     ; 380 }
 855  0092 81            	ret
 890                     ; 388 void TIM4_Cmd(FunctionalState NewState)
 890                     ; 389 {
 891                     	switch	.text
 892  0093               _TIM4_Cmd:
 896                     ; 391   assert_param(IS_FUNCTIONAL_STATE(NewState));
 898                     ; 394   if (NewState != DISABLE)
 900  0093 4d            	tnz	a
 901  0094 2706          	jreq	L504
 902                     ; 396     TIM4->CR1 |= TIM4_CR1_CEN ;
 904  0096 721052e0      	bset	21216,#0
 906  009a 2004          	jra	L704
 907  009c               L504:
 908                     ; 400     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 910  009c 721152e0      	bres	21216,#0
 911  00a0               L704:
 912                     ; 402 }
 915  00a0 81            	ret
 980                     ; 430 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 980                     ; 431 {
 981                     	switch	.text
 982  00a1               _TIM4_ITConfig:
 984  00a1 89            	pushw	x
 985       00000000      OFST:	set	0
 988                     ; 433   assert_param(IS_TIM4_IT(TIM4_IT));
 990                     ; 434   assert_param(IS_FUNCTIONAL_STATE(NewState));
 992                     ; 436   if (NewState != DISABLE)
 994  00a2 9f            	ld	a,xl
 995  00a3 4d            	tnz	a
 996  00a4 2709          	jreq	L344
 997                     ; 439     TIM4->IER |= (uint8_t)TIM4_IT;
 999  00a6 9e            	ld	a,xh
1000  00a7 ca52e4        	or	a,21220
1001  00aa c752e4        	ld	21220,a
1003  00ad 2009          	jra	L544
1004  00af               L344:
1005                     ; 444     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
1007  00af 7b01          	ld	a,(OFST+1,sp)
1008  00b1 43            	cpl	a
1009  00b2 c452e4        	and	a,21220
1010  00b5 c752e4        	ld	21220,a
1011  00b8               L544:
1012                     ; 446 }
1015  00b8 85            	popw	x
1016  00b9 81            	ret
1073                     ; 456 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1073                     ; 457 {
1074                     	switch	.text
1075  00ba               _TIM4_GenerateEvent:
1079                     ; 459   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1081                     ; 462   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1083  00ba ca52e6        	or	a,21222
1084  00bd c752e6        	ld	21222,a
1085                     ; 463 }
1088  00c0 81            	ret
1174                     ; 474 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1174                     ; 475 {
1175                     	switch	.text
1176  00c1               _TIM4_GetFlagStatus:
1178  00c1 88            	push	a
1179       00000001      OFST:	set	1
1182                     ; 476   FlagStatus bitstatus = RESET;
1184                     ; 479   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1186                     ; 481   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1188  00c2 c452e5        	and	a,21221
1189  00c5 2706          	jreq	L735
1190                     ; 483     bitstatus = SET;
1192  00c7 a601          	ld	a,#1
1193  00c9 6b01          	ld	(OFST+0,sp),a
1195  00cb 2002          	jra	L145
1196  00cd               L735:
1197                     ; 487     bitstatus = RESET;
1199  00cd 0f01          	clr	(OFST+0,sp)
1200  00cf               L145:
1201                     ; 489   return ((FlagStatus)bitstatus);
1203  00cf 7b01          	ld	a,(OFST+0,sp)
1206  00d1 5b01          	addw	sp,#1
1207  00d3 81            	ret
1242                     ; 500 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1242                     ; 501 {
1243                     	switch	.text
1244  00d4               _TIM4_ClearFlag:
1248                     ; 503   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1250                     ; 505   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1252  00d4 43            	cpl	a
1253  00d5 c752e5        	ld	21221,a
1254                     ; 506 }
1257  00d8 81            	ret
1321                     ; 518 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1321                     ; 519 {
1322                     	switch	.text
1323  00d9               _TIM4_GetITStatus:
1325  00d9 88            	push	a
1326  00da 89            	pushw	x
1327       00000002      OFST:	set	2
1330                     ; 520   ITStatus bitstatus = RESET;
1332                     ; 522   uint8_t itStatus = 0x0, itEnable = 0x0;
1336                     ; 525   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1338                     ; 527   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1340  00db c452e5        	and	a,21221
1341  00de 6b01          	ld	(OFST-1,sp),a
1342                     ; 529   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1344  00e0 c652e4        	ld	a,21220
1345  00e3 1403          	and	a,(OFST+1,sp)
1346  00e5 6b02          	ld	(OFST+0,sp),a
1347                     ; 531   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1349  00e7 0d01          	tnz	(OFST-1,sp)
1350  00e9 270a          	jreq	L316
1352  00eb 0d02          	tnz	(OFST+0,sp)
1353  00ed 2706          	jreq	L316
1354                     ; 533     bitstatus = (ITStatus)SET;
1356  00ef a601          	ld	a,#1
1357  00f1 6b02          	ld	(OFST+0,sp),a
1359  00f3 2002          	jra	L516
1360  00f5               L316:
1361                     ; 537     bitstatus = (ITStatus)RESET;
1363  00f5 0f02          	clr	(OFST+0,sp)
1364  00f7               L516:
1365                     ; 539   return ((ITStatus)bitstatus);
1367  00f7 7b02          	ld	a,(OFST+0,sp)
1370  00f9 5b03          	addw	sp,#3
1371  00fb 81            	ret
1407                     ; 550 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1407                     ; 551 {
1408                     	switch	.text
1409  00fc               _TIM4_ClearITPendingBit:
1413                     ; 553   assert_param(IS_TIM4_IT(TIM4_IT));
1415                     ; 556   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1417  00fc 43            	cpl	a
1418  00fd c752e5        	ld	21221,a
1419                     ; 557 }
1422  0100 81            	ret
1481                     ; 568 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1481                     ; 569 {
1482                     	switch	.text
1483  0101               _TIM4_DMACmd:
1485  0101 89            	pushw	x
1486       00000000      OFST:	set	0
1489                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
1491                     ; 572   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1493                     ; 574   if (NewState != DISABLE)
1495  0102 9f            	ld	a,xl
1496  0103 4d            	tnz	a
1497  0104 2709          	jreq	L566
1498                     ; 577     TIM4->DER |= (uint8_t)TIM4_DMASource;
1500  0106 9e            	ld	a,xh
1501  0107 ca52e3        	or	a,21219
1502  010a c752e3        	ld	21219,a
1504  010d 2009          	jra	L766
1505  010f               L566:
1506                     ; 582     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1508  010f 7b01          	ld	a,(OFST+1,sp)
1509  0111 43            	cpl	a
1510  0112 c452e3        	and	a,21219
1511  0115 c752e3        	ld	21219,a
1512  0118               L766:
1513                     ; 584 }
1516  0118 85            	popw	x
1517  0119 81            	ret
1541                     ; 607 void TIM4_InternalClockConfig(void)
1541                     ; 608 {
1542                     	switch	.text
1543  011a               _TIM4_InternalClockConfig:
1547                     ; 610   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1549  011a c652e2        	ld	a,21218
1550  011d a4f8          	and	a,#248
1551  011f c752e2        	ld	21218,a
1552                     ; 611 }
1555  0122 81            	ret
1639                     ; 651 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1639                     ; 652 {
1640                     	switch	.text
1641  0123               _TIM4_SelectInputTrigger:
1643  0123 88            	push	a
1644  0124 88            	push	a
1645       00000001      OFST:	set	1
1648                     ; 653   uint8_t tmpsmcr = 0;
1650                     ; 656   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1652                     ; 658   tmpsmcr = TIM4->SMCR;
1654  0125 c652e2        	ld	a,21218
1655  0128 6b01          	ld	(OFST+0,sp),a
1656                     ; 661   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1658  012a 7b01          	ld	a,(OFST+0,sp)
1659  012c a48f          	and	a,#143
1660  012e 6b01          	ld	(OFST+0,sp),a
1661                     ; 662   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1663  0130 7b01          	ld	a,(OFST+0,sp)
1664  0132 1a02          	or	a,(OFST+1,sp)
1665  0134 6b01          	ld	(OFST+0,sp),a
1666                     ; 664   TIM4->SMCR = (uint8_t)tmpsmcr;
1668  0136 7b01          	ld	a,(OFST+0,sp)
1669  0138 c752e2        	ld	21218,a
1670                     ; 665 }
1673  013b 85            	popw	x
1674  013c 81            	ret
1749                     ; 676 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1749                     ; 677 {
1750                     	switch	.text
1751  013d               _TIM4_SelectOutputTrigger:
1753  013d 88            	push	a
1754  013e 88            	push	a
1755       00000001      OFST:	set	1
1758                     ; 678   uint8_t tmpcr2 = 0;
1760                     ; 681   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1762                     ; 683   tmpcr2 = TIM4->CR2;
1764  013f c652e1        	ld	a,21217
1765  0142 6b01          	ld	(OFST+0,sp),a
1766                     ; 686   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1768  0144 7b01          	ld	a,(OFST+0,sp)
1769  0146 a48f          	and	a,#143
1770  0148 6b01          	ld	(OFST+0,sp),a
1771                     ; 689   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1773  014a 7b01          	ld	a,(OFST+0,sp)
1774  014c 1a02          	or	a,(OFST+1,sp)
1775  014e 6b01          	ld	(OFST+0,sp),a
1776                     ; 691   TIM4->CR2 = tmpcr2;
1778  0150 7b01          	ld	a,(OFST+0,sp)
1779  0152 c752e1        	ld	21217,a
1780                     ; 692 }
1783  0155 85            	popw	x
1784  0156 81            	ret
1875                     ; 706 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1875                     ; 707 {
1876                     	switch	.text
1877  0157               _TIM4_SelectSlaveMode:
1879  0157 88            	push	a
1880  0158 88            	push	a
1881       00000001      OFST:	set	1
1884                     ; 708   uint8_t tmpsmcr = 0;
1886                     ; 711   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1888                     ; 713   tmpsmcr = TIM4->SMCR;
1890  0159 c652e2        	ld	a,21218
1891  015c 6b01          	ld	(OFST+0,sp),a
1892                     ; 716   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1894  015e 7b01          	ld	a,(OFST+0,sp)
1895  0160 a4f8          	and	a,#248
1896  0162 6b01          	ld	(OFST+0,sp),a
1897                     ; 719   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1899  0164 7b01          	ld	a,(OFST+0,sp)
1900  0166 1a02          	or	a,(OFST+1,sp)
1901  0168 6b01          	ld	(OFST+0,sp),a
1902                     ; 721   TIM4->SMCR = tmpsmcr;
1904  016a 7b01          	ld	a,(OFST+0,sp)
1905  016c c752e2        	ld	21218,a
1906                     ; 722 }
1909  016f 85            	popw	x
1910  0170 81            	ret
1946                     ; 730 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1946                     ; 731 {
1947                     	switch	.text
1948  0171               _TIM4_SelectMasterSlaveMode:
1952                     ; 733   assert_param(IS_FUNCTIONAL_STATE(NewState));
1954                     ; 736   if (NewState != DISABLE)
1956  0171 4d            	tnz	a
1957  0172 2706          	jreq	L1501
1958                     ; 738     TIM4->SMCR |= TIM4_SMCR_MSM;
1960  0174 721e52e2      	bset	21218,#7
1962  0178 2004          	jra	L3501
1963  017a               L1501:
1964                     ; 742     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1966  017a 721f52e2      	bres	21218,#7
1967  017e               L3501:
1968                     ; 744 }
1971  017e 81            	ret
1984                     	xdef	_TIM4_SelectMasterSlaveMode
1985                     	xdef	_TIM4_SelectSlaveMode
1986                     	xdef	_TIM4_SelectOutputTrigger
1987                     	xdef	_TIM4_SelectInputTrigger
1988                     	xdef	_TIM4_InternalClockConfig
1989                     	xdef	_TIM4_DMACmd
1990                     	xdef	_TIM4_ClearITPendingBit
1991                     	xdef	_TIM4_GetITStatus
1992                     	xdef	_TIM4_ClearFlag
1993                     	xdef	_TIM4_GetFlagStatus
1994                     	xdef	_TIM4_GenerateEvent
1995                     	xdef	_TIM4_ITConfig
1996                     	xdef	_TIM4_Cmd
1997                     	xdef	_TIM4_SelectOnePulseMode
1998                     	xdef	_TIM4_ARRPreloadConfig
1999                     	xdef	_TIM4_UpdateRequestConfig
2000                     	xdef	_TIM4_UpdateDisableConfig
2001                     	xdef	_TIM4_GetPrescaler
2002                     	xdef	_TIM4_GetCounter
2003                     	xdef	_TIM4_SetAutoreload
2004                     	xdef	_TIM4_SetCounter
2005                     	xdef	_TIM4_PrescalerConfig
2006                     	xdef	_TIM4_TimeBaseInit
2007                     	xdef	_TIM4_DeInit
2026                     	end
