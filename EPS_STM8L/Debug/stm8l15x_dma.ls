   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  43                     ; 140 void DMA_GlobalDeInit(void)
  43                     ; 141 {
  45                     	switch	.text
  46  0000               _DMA_GlobalDeInit:
  50                     ; 143   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  52  0000 72115070      	bres	20592,#0
  53                     ; 146   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  55  0004 35fc5070      	mov	20592,#252
  56                     ; 147 }
  59  0008 81            	ret
 175                     ; 155 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 175                     ; 156 {
 176                     	switch	.text
 177  0009               _DMA_DeInit:
 179  0009 89            	pushw	x
 180       00000000      OFST:	set	0
 183                     ; 158   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 185                     ; 161   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 187  000a f6            	ld	a,(x)
 188  000b a4fe          	and	a,#254
 189  000d f7            	ld	(x),a
 190                     ; 164   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 192  000e 7f            	clr	(x)
 193                     ; 167   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 195  000f 6f02          	clr	(2,x)
 196                     ; 170   if (DMA_Channelx == DMA1_Channel3)
 198  0011 a35093        	cpw	x,#20627
 199  0014 2608          	jrne	L501
 200                     ; 172     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 202  0016 a640          	ld	a,#64
 203  0018 e703          	ld	(3,x),a
 204                     ; 173     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 206  001a 6f05          	clr	(5,x)
 208  001c 2006          	jra	L701
 209  001e               L501:
 210                     ; 177     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 212  001e 1e01          	ldw	x,(OFST+1,sp)
 213  0020 a652          	ld	a,#82
 214  0022 e703          	ld	(3,x),a
 215  0024               L701:
 216                     ; 179   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 218  0024 1e01          	ldw	x,(OFST+1,sp)
 219  0026 6f04          	clr	(4,x)
 220                     ; 182   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 222  0028 1e01          	ldw	x,(OFST+1,sp)
 223  002a 6f06          	clr	(6,x)
 224                     ; 183   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 226  002c 1e01          	ldw	x,(OFST+1,sp)
 227  002e 6f07          	clr	(7,x)
 228                     ; 186   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 230  0030 1e01          	ldw	x,(OFST+1,sp)
 231  0032 6f01          	clr	(1,x)
 232                     ; 187 }
 235  0034 85            	popw	x
 236  0035 81            	ret
 482                     ; 224 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
 482                     ; 225               uint32_t DMA_Memory0BaseAddr,
 482                     ; 226               uint16_t DMA_PeripheralMemory1BaseAddr,
 482                     ; 227               uint8_t DMA_BufferSize,
 482                     ; 228               DMA_DIR_TypeDef DMA_DIR,
 482                     ; 229               DMA_Mode_TypeDef DMA_Mode,
 482                     ; 230               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
 482                     ; 231               DMA_Priority_TypeDef DMA_Priority,
 482                     ; 232               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
 482                     ; 233 {
 483                     	switch	.text
 484  0036               _DMA_Init:
 486  0036 89            	pushw	x
 487       00000000      OFST:	set	0
 490                     ; 235   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 492                     ; 236   assert_param(IS_DMA_DIR(DMA_DIR));
 494                     ; 237   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
 496                     ; 238   assert_param(IS_DMA_MODE(DMA_Mode));
 498                     ; 239   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
 500                     ; 240   assert_param(IS_DMA_PRIORITY(DMA_Priority));
 502                     ; 244   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 504  0037 f6            	ld	a,(x)
 505  0038 a4fe          	and	a,#254
 506  003a f7            	ld	(x),a
 507                     ; 247   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 509  003b 7f            	clr	(x)
 510                     ; 250   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
 510                     ; 251                                            (uint8_t)DMA_Mode) | \
 510                     ; 252                                            (uint8_t)DMA_MemoryIncMode);
 512  003c 7b0c          	ld	a,(OFST+12,sp)
 513  003e 1a0d          	or	a,(OFST+13,sp)
 514  0040 1a0e          	or	a,(OFST+14,sp)
 515  0042 fa            	or	a,(x)
 516  0043 f7            	ld	(x),a
 517                     ; 255   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
 519  0044 e601          	ld	a,(1,x)
 520  0046 a4c7          	and	a,#199
 521  0048 e701          	ld	(1,x),a
 522                     ; 258   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
 522                     ; 259                                   (uint8_t)DMA_MemoryDataSize);
 524  004a 7b0f          	ld	a,(OFST+15,sp)
 525  004c 1a10          	or	a,(OFST+16,sp)
 526  004e ea01          	or	a,(1,x)
 527  0050 e701          	ld	(1,x),a
 528                     ; 263   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 530  0052 7b0b          	ld	a,(OFST+11,sp)
 531  0054 1e01          	ldw	x,(OFST+1,sp)
 532  0056 e702          	ld	(2,x),a
 533                     ; 268   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 535  0058 7b09          	ld	a,(OFST+9,sp)
 536  005a 1e01          	ldw	x,(OFST+1,sp)
 537  005c e703          	ld	(3,x),a
 538                     ; 269   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 540  005e 7b0a          	ld	a,(OFST+10,sp)
 541  0060 1e01          	ldw	x,(OFST+1,sp)
 542  0062 e704          	ld	(4,x),a
 543                     ; 273   if (DMA_Channelx == DMA1_Channel3)
 545  0064 1e01          	ldw	x,(OFST+1,sp)
 546  0066 a35093        	cpw	x,#20627
 547  0069 2606          	jrne	L742
 548                     ; 275     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 550  006b 7b06          	ld	a,(OFST+6,sp)
 551  006d 1e01          	ldw	x,(OFST+1,sp)
 552  006f e705          	ld	(5,x),a
 553  0071               L742:
 554                     ; 277   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 556  0071 7b07          	ld	a,(OFST+7,sp)
 557  0073 1e01          	ldw	x,(OFST+1,sp)
 558  0075 e706          	ld	(6,x),a
 559                     ; 278   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 561  0077 7b08          	ld	a,(OFST+8,sp)
 562  0079 1e01          	ldw	x,(OFST+1,sp)
 563  007b e707          	ld	(7,x),a
 564                     ; 280 }
 567  007d 85            	popw	x
 568  007e 81            	ret
 623                     ; 288 void DMA_GlobalCmd(FunctionalState NewState)
 623                     ; 289 {
 624                     	switch	.text
 625  007f               _DMA_GlobalCmd:
 629                     ; 291   assert_param(IS_FUNCTIONAL_STATE(NewState));
 631                     ; 293   if (NewState != DISABLE)
 633  007f 4d            	tnz	a
 634  0080 2706          	jreq	L772
 635                     ; 296     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 637  0082 72105070      	bset	20592,#0
 639  0086 2004          	jra	L103
 640  0088               L772:
 641                     ; 301     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 643  0088 72115070      	bres	20592,#0
 644  008c               L103:
 645                     ; 303 }
 648  008c 81            	ret
 695                     ; 314 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 695                     ; 315 {
 696                     	switch	.text
 697  008d               _DMA_Cmd:
 699  008d 89            	pushw	x
 700       00000000      OFST:	set	0
 703                     ; 317   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 705                     ; 318   assert_param(IS_FUNCTIONAL_STATE(NewState));
 707                     ; 320   if (NewState != DISABLE)
 709  008e 0d05          	tnz	(OFST+5,sp)
 710  0090 2706          	jreq	L723
 711                     ; 323     DMA_Channelx->CCR |= DMA_CCR_CE;
 713  0092 f6            	ld	a,(x)
 714  0093 aa01          	or	a,#1
 715  0095 f7            	ld	(x),a
 717  0096 2006          	jra	L133
 718  0098               L723:
 719                     ; 328     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 721  0098 1e01          	ldw	x,(OFST+1,sp)
 722  009a f6            	ld	a,(x)
 723  009b a4fe          	and	a,#254
 724  009d f7            	ld	(x),a
 725  009e               L133:
 726                     ; 330 }
 729  009e 85            	popw	x
 730  009f 81            	ret
 764                     ; 342 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 764                     ; 343 {
 765                     	switch	.text
 766  00a0               _DMA_SetTimeOut:
 770                     ; 345   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 772                     ; 348   DMA1->GCSR = 0;
 774  00a0 725f5070      	clr	20592
 775                     ; 349   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 777  00a4 48            	sll	a
 778  00a5 48            	sll	a
 779  00a6 c75070        	ld	20592,a
 780                     ; 351 }
 783  00a9 81            	ret
 830                     ; 401 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 830                     ; 402 {
 831                     	switch	.text
 832  00aa               _DMA_SetCurrDataCounter:
 834  00aa 89            	pushw	x
 835       00000000      OFST:	set	0
 838                     ; 404   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 840                     ; 407   DMA_Channelx->CNBTR = DataNumber;
 842  00ab 7b05          	ld	a,(OFST+5,sp)
 843  00ad 1e01          	ldw	x,(OFST+1,sp)
 844  00af e702          	ld	(2,x),a
 845                     ; 408 }
 848  00b1 85            	popw	x
 849  00b2 81            	ret
 887                     ; 415 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 887                     ; 416 {
 888                     	switch	.text
 889  00b3               _DMA_GetCurrDataCounter:
 893                     ; 418   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 895                     ; 421   return ((uint8_t)(DMA_Channelx->CNBTR));
 897  00b3 e602          	ld	a,(2,x)
 900  00b5 81            	ret
 977                     ; 482 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 977                     ; 483                   DMA_ITx_TypeDef DMA_ITx,
 977                     ; 484                   FunctionalState NewState)
 977                     ; 485 {
 978                     	switch	.text
 979  00b6               _DMA_ITConfig:
 981  00b6 89            	pushw	x
 982       00000000      OFST:	set	0
 985                     ; 487   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 987                     ; 488   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 989                     ; 489   assert_param(IS_FUNCTIONAL_STATE(NewState));
 991                     ; 491   if (NewState != DISABLE)
 993  00b7 0d06          	tnz	(OFST+6,sp)
 994  00b9 2706          	jreq	L554
 995                     ; 494     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 997  00bb f6            	ld	a,(x)
 998  00bc 1a05          	or	a,(OFST+5,sp)
 999  00be f7            	ld	(x),a
1001  00bf 2007          	jra	L754
1002  00c1               L554:
1003                     ; 499     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
1005  00c1 1e01          	ldw	x,(OFST+1,sp)
1006  00c3 7b05          	ld	a,(OFST+5,sp)
1007  00c5 43            	cpl	a
1008  00c6 f4            	and	a,(x)
1009  00c7 f7            	ld	(x),a
1010  00c8               L754:
1011                     ; 501 }
1014  00c8 85            	popw	x
1015  00c9 81            	ret
1264                     ; 530 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1264                     ; 531 {
1265                     	switch	.text
1266  00ca               _DMA_GetFlagStatus:
1268  00ca 89            	pushw	x
1269  00cb 5204          	subw	sp,#4
1270       00000004      OFST:	set	4
1273                     ; 532   FlagStatus flagstatus = RESET;
1275                     ; 533   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1277                     ; 534   uint8_t tmpgir1 = 0;
1279                     ; 535   uint8_t tmpgcsr = 0;
1281                     ; 538   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1283                     ; 541   tmpgcsr = DMA1->GCSR;
1285  00cd c65070        	ld	a,20592
1286  00d0 6b04          	ld	(OFST+0,sp),a
1287                     ; 542   tmpgir1 = DMA1->GIR1;
1289  00d2 c65071        	ld	a,20593
1290  00d5 6b01          	ld	(OFST-3,sp),a
1291                     ; 544   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
1293  00d7 01            	rrwa	x,a
1294  00d8 9f            	ld	a,xl
1295  00d9 a40f          	and	a,#15
1296  00db 97            	ld	xl,a
1297  00dc 4f            	clr	a
1298  00dd 02            	rlwa	x,a
1299  00de 5d            	tnzw	x
1300  00df 2736          	jreq	L706
1301                     ; 547     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
1303  00e1 7b05          	ld	a,(OFST+1,sp)
1304  00e3 a501          	bcp	a,#1
1305  00e5 2707          	jreq	L116
1306                     ; 549       DMA_Channelx = DMA1_Channel0;
1308  00e7 ae5075        	ldw	x,#20597
1309  00ea 1f02          	ldw	(OFST-2,sp),x
1311  00ec 201f          	jra	L316
1312  00ee               L116:
1313                     ; 551     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
1315  00ee 7b05          	ld	a,(OFST+1,sp)
1316  00f0 a502          	bcp	a,#2
1317  00f2 2707          	jreq	L516
1318                     ; 553       DMA_Channelx = DMA1_Channel1;
1320  00f4 ae507f        	ldw	x,#20607
1321  00f7 1f02          	ldw	(OFST-2,sp),x
1323  00f9 2012          	jra	L316
1324  00fb               L516:
1325                     ; 555     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
1327  00fb 7b05          	ld	a,(OFST+1,sp)
1328  00fd a504          	bcp	a,#4
1329  00ff 2707          	jreq	L126
1330                     ; 557       DMA_Channelx = DMA1_Channel2;
1332  0101 ae5089        	ldw	x,#20617
1333  0104 1f02          	ldw	(OFST-2,sp),x
1335  0106 2005          	jra	L316
1336  0108               L126:
1337                     ; 561       DMA_Channelx = DMA1_Channel3;
1339  0108 ae5093        	ldw	x,#20627
1340  010b 1f02          	ldw	(OFST-2,sp),x
1341  010d               L316:
1342                     ; 565     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1344  010d 1e02          	ldw	x,(OFST-2,sp)
1345  010f e601          	ld	a,(1,x)
1346  0111 1406          	and	a,(OFST+2,sp)
1347  0113 6b04          	ld	(OFST+0,sp),a
1349  0115 2014          	jra	L526
1350  0117               L706:
1351                     ; 567   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
1353  0117 7b05          	ld	a,(OFST+1,sp)
1354  0119 a510          	bcp	a,#16
1355  011b 2708          	jreq	L726
1356                     ; 570     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1358  011d 7b06          	ld	a,(OFST+2,sp)
1359  011f 1401          	and	a,(OFST-3,sp)
1360  0121 6b04          	ld	(OFST+0,sp),a
1362  0123 2006          	jra	L526
1363  0125               L726:
1364                     ; 575     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1366  0125 7b04          	ld	a,(OFST+0,sp)
1367  0127 a402          	and	a,#2
1368  0129 6b04          	ld	(OFST+0,sp),a
1369  012b               L526:
1370                     ; 579   return (flagstatus);
1372  012b 7b04          	ld	a,(OFST+0,sp)
1375  012d 5b06          	addw	sp,#6
1376  012f 81            	ret
1423                     ; 597 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1423                     ; 598 {
1424                     	switch	.text
1425  0130               _DMA_ClearFlag:
1427  0130 89            	pushw	x
1428  0131 89            	pushw	x
1429       00000002      OFST:	set	2
1432                     ; 599   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1434                     ; 602   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1436                     ; 605   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
1438  0132 01            	rrwa	x,a
1439  0133 9f            	ld	a,xl
1440  0134 a401          	and	a,#1
1441  0136 97            	ld	xl,a
1442  0137 4f            	clr	a
1443  0138 02            	rlwa	x,a
1444  0139 5d            	tnzw	x
1445  013a 2707          	jreq	L756
1446                     ; 607     DMA_Channelx = DMA1_Channel0;
1448  013c ae5075        	ldw	x,#20597
1449  013f 1f01          	ldw	(OFST-1,sp),x
1451  0141 201f          	jra	L166
1452  0143               L756:
1453                     ; 611     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
1455  0143 7b03          	ld	a,(OFST+1,sp)
1456  0145 a502          	bcp	a,#2
1457  0147 2707          	jreq	L366
1458                     ; 613       DMA_Channelx = DMA1_Channel1;
1460  0149 ae507f        	ldw	x,#20607
1461  014c 1f01          	ldw	(OFST-1,sp),x
1463  014e 2012          	jra	L166
1464  0150               L366:
1465                     ; 617       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
1467  0150 7b03          	ld	a,(OFST+1,sp)
1468  0152 a504          	bcp	a,#4
1469  0154 2707          	jreq	L766
1470                     ; 619         DMA_Channelx = DMA1_Channel2;
1472  0156 ae5089        	ldw	x,#20617
1473  0159 1f01          	ldw	(OFST-1,sp),x
1475  015b 2005          	jra	L166
1476  015d               L766:
1477                     ; 623         DMA_Channelx = DMA1_Channel3;
1479  015d ae5093        	ldw	x,#20627
1480  0160 1f01          	ldw	(OFST-1,sp),x
1481  0162               L166:
1482                     ; 629   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1484  0162 1e01          	ldw	x,(OFST-1,sp)
1485  0164 7b04          	ld	a,(OFST+2,sp)
1486  0166 a406          	and	a,#6
1487  0168 43            	cpl	a
1488  0169 e401          	and	a,(1,x)
1489  016b e701          	ld	(1,x),a
1490                     ; 630 }
1493  016d 5b04          	addw	sp,#4
1494  016f 81            	ret
1632                     ; 646 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1632                     ; 647 {
1633                     	switch	.text
1634  0170               _DMA_GetITStatus:
1636  0170 88            	push	a
1637  0171 5204          	subw	sp,#4
1638       00000004      OFST:	set	4
1641                     ; 648   ITStatus itstatus = RESET;
1643                     ; 649   uint8_t tmpreg = 0;
1645                     ; 650   uint8_t tmp2 = 0;
1647                     ; 651   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1649                     ; 654   assert_param(IS_DMA_GET_IT(DMA_IT));
1651                     ; 657   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1653  0173 a510          	bcp	a,#16
1654  0175 2707          	jreq	L757
1655                     ; 659     DMA_Channelx = DMA1_Channel0;
1657  0177 ae5075        	ldw	x,#20597
1658  017a 1f03          	ldw	(OFST-1,sp),x
1660  017c 201f          	jra	L167
1661  017e               L757:
1662                     ; 663     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
1664  017e 7b05          	ld	a,(OFST+1,sp)
1665  0180 a520          	bcp	a,#32
1666  0182 2707          	jreq	L367
1667                     ; 665       DMA_Channelx = DMA1_Channel1;
1669  0184 ae507f        	ldw	x,#20607
1670  0187 1f03          	ldw	(OFST-1,sp),x
1672  0189 2012          	jra	L167
1673  018b               L367:
1674                     ; 669       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
1676  018b 7b05          	ld	a,(OFST+1,sp)
1677  018d a540          	bcp	a,#64
1678  018f 2707          	jreq	L767
1679                     ; 671         DMA_Channelx = DMA1_Channel2;
1681  0191 ae5089        	ldw	x,#20617
1682  0194 1f03          	ldw	(OFST-1,sp),x
1684  0196 2005          	jra	L167
1685  0198               L767:
1686                     ; 675         DMA_Channelx = DMA1_Channel3;
1688  0198 ae5093        	ldw	x,#20627
1689  019b 1f03          	ldw	(OFST-1,sp),x
1690  019d               L167:
1691                     ; 680   tmpreg =  DMA_Channelx->CSPR ;
1693  019d 1e03          	ldw	x,(OFST-1,sp)
1694  019f e601          	ld	a,(1,x)
1695  01a1 6b01          	ld	(OFST-3,sp),a
1696                     ; 681   tmpreg &= DMA_Channelx->CCR ;
1698  01a3 1e03          	ldw	x,(OFST-1,sp)
1699  01a5 7b01          	ld	a,(OFST-3,sp)
1700  01a7 f4            	and	a,(x)
1701  01a8 6b01          	ld	(OFST-3,sp),a
1702                     ; 682   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1704  01aa 7b05          	ld	a,(OFST+1,sp)
1705  01ac a406          	and	a,#6
1706  01ae 6b02          	ld	(OFST-2,sp),a
1707                     ; 683   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1709  01b0 7b01          	ld	a,(OFST-3,sp)
1710  01b2 1402          	and	a,(OFST-2,sp)
1711  01b4 6b02          	ld	(OFST-2,sp),a
1712                     ; 686   return (itstatus);
1714  01b6 7b02          	ld	a,(OFST-2,sp)
1717  01b8 5b05          	addw	sp,#5
1718  01ba 81            	ret
1766                     ; 704 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1766                     ; 705 {
1767                     	switch	.text
1768  01bb               _DMA_ClearITPendingBit:
1770  01bb 88            	push	a
1771  01bc 89            	pushw	x
1772       00000002      OFST:	set	2
1775                     ; 706   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1777                     ; 709   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1779                     ; 711   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1781  01bd a510          	bcp	a,#16
1782  01bf 2707          	jreq	L7101
1783                     ; 713     DMA_Channelx = DMA1_Channel0;
1785  01c1 ae5075        	ldw	x,#20597
1786  01c4 1f01          	ldw	(OFST-1,sp),x
1788  01c6 201f          	jra	L1201
1789  01c8               L7101:
1790                     ; 717     if ((DMA_IT & 0x20) != (uint8_t)RESET)
1792  01c8 7b03          	ld	a,(OFST+1,sp)
1793  01ca a520          	bcp	a,#32
1794  01cc 2707          	jreq	L3201
1795                     ; 719       DMA_Channelx = DMA1_Channel1;
1797  01ce ae507f        	ldw	x,#20607
1798  01d1 1f01          	ldw	(OFST-1,sp),x
1800  01d3 2012          	jra	L1201
1801  01d5               L3201:
1802                     ; 723       if ((DMA_IT & 0x40) != (uint8_t)RESET)
1804  01d5 7b03          	ld	a,(OFST+1,sp)
1805  01d7 a540          	bcp	a,#64
1806  01d9 2707          	jreq	L7201
1807                     ; 725         DMA_Channelx = DMA1_Channel2;
1809  01db ae5089        	ldw	x,#20617
1810  01de 1f01          	ldw	(OFST-1,sp),x
1812  01e0 2005          	jra	L1201
1813  01e2               L7201:
1814                     ; 729         DMA_Channelx = DMA1_Channel3;
1816  01e2 ae5093        	ldw	x,#20627
1817  01e5 1f01          	ldw	(OFST-1,sp),x
1818  01e7               L1201:
1819                     ; 734   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1821  01e7 1e01          	ldw	x,(OFST-1,sp)
1822  01e9 7b03          	ld	a,(OFST+1,sp)
1823  01eb a406          	and	a,#6
1824  01ed 43            	cpl	a
1825  01ee e401          	and	a,(1,x)
1826  01f0 e701          	ld	(1,x),a
1827                     ; 735 }
1830  01f2 5b03          	addw	sp,#3
1831  01f4 81            	ret
1844                     	xdef	_DMA_ClearITPendingBit
1845                     	xdef	_DMA_GetITStatus
1846                     	xdef	_DMA_ClearFlag
1847                     	xdef	_DMA_GetFlagStatus
1848                     	xdef	_DMA_ITConfig
1849                     	xdef	_DMA_GetCurrDataCounter
1850                     	xdef	_DMA_SetCurrDataCounter
1851                     	xdef	_DMA_SetTimeOut
1852                     	xdef	_DMA_Cmd
1853                     	xdef	_DMA_GlobalCmd
1854                     	xdef	_DMA_Init
1855                     	xdef	_DMA_DeInit
1856                     	xdef	_DMA_GlobalDeInit
1875                     	end
