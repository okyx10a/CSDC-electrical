   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  43                     ; 142 void DAC_DeInit(void)
  43                     ; 143 {
  45                     	switch	.text
  46  0000               _DAC_DeInit:
  50                     ; 145   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
  52  0000 725f5380      	clr	21376
  53                     ; 146   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
  55  0004 725f5381      	clr	21377
  56                     ; 149   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
  58  0008 725f5382      	clr	21378
  59                     ; 150   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
  61  000c 725f5383      	clr	21379
  62                     ; 153   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
  64  0010 725f5384      	clr	21380
  65                     ; 156   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
  67  0014 35ff5385      	mov	21381,#255
  68                     ; 159   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
  70  0018 725f5388      	clr	21384
  71                     ; 160   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
  73  001c 725f5389      	clr	21385
  74                     ; 161   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
  76  0020 725f538c      	clr	21388
  77                     ; 162   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
  79  0024 725f538d      	clr	21389
  80                     ; 163   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
  82  0028 725f5390      	clr	21392
  83                     ; 166   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
  85  002c 725f5394      	clr	21396
  86                     ; 167   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
  88  0030 725f5395      	clr	21397
  89                     ; 168   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
  91  0034 725f5398      	clr	21400
  92                     ; 169   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
  94  0038 725f5399      	clr	21401
  95                     ; 170   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
  97  003c 725f539c      	clr	21404
  98                     ; 173   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
 100  0040 725f53a0      	clr	21408
 101                     ; 174   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
 103  0044 725f53a1      	clr	21409
 104                     ; 175   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
 106  0048 725f53a2      	clr	21410
 107                     ; 176   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
 109  004c 725f53a3      	clr	21411
 110                     ; 179   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
 112  0050 725f53a4      	clr	21412
 113                     ; 180   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
 115  0054 725f53a5      	clr	21413
 116                     ; 181   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
 118  0058 725f53a6      	clr	21414
 119                     ; 182   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
 121  005c 725f53a7      	clr	21415
 122                     ; 185   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
 124  0060 725f53a8      	clr	21416
 125                     ; 186   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
 127  0064 725f53a9      	clr	21417
 128                     ; 187 }
 131  0068 81            	ret
 290                     ; 208 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
 290                     ; 209               DAC_Trigger_TypeDef DAC_Trigger,
 290                     ; 210               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
 290                     ; 211 {
 291                     	switch	.text
 292  0069               _DAC_Init:
 294  0069 89            	pushw	x
 295  006a 5203          	subw	sp,#3
 296       00000003      OFST:	set	3
 299                     ; 212   uint8_t tmpreg = 0;
 301                     ; 213   uint16_t tmpreg2 = 0;
 303                     ; 216   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 305                     ; 217   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
 307                     ; 218   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
 309                     ; 221   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
 311  006c 9e            	ld	a,xh
 312  006d 48            	sll	a
 313  006e 5f            	clrw	x
 314  006f 97            	ld	xl,a
 315  0070 1f01          	ldw	(OFST-2,sp),x
 316                     ; 222   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
 318  0072 1e01          	ldw	x,(OFST-2,sp)
 319  0074 d65380        	ld	a,(21376,x)
 320  0077 6b03          	ld	(OFST+0,sp),a
 321                     ; 225   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
 323  0079 7b03          	ld	a,(OFST+0,sp)
 324  007b a4c1          	and	a,#193
 325  007d 6b03          	ld	(OFST+0,sp),a
 326                     ; 228   tmpreg |= (uint8_t)(DAC_OutputBuffer);
 328  007f 7b03          	ld	a,(OFST+0,sp)
 329  0081 1a08          	or	a,(OFST+5,sp)
 330  0083 6b03          	ld	(OFST+0,sp),a
 331                     ; 232   if (DAC_Trigger != DAC_Trigger_None)
 333  0085 7b05          	ld	a,(OFST+2,sp)
 334  0087 a130          	cp	a,#48
 335  0089 2708          	jreq	L511
 336                     ; 235     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 338  008b 7b05          	ld	a,(OFST+2,sp)
 339  008d aa04          	or	a,#4
 340  008f 1a03          	or	a,(OFST+0,sp)
 341  0091 6b03          	ld	(OFST+0,sp),a
 342  0093               L511:
 343                     ; 239   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 345  0093 7b03          	ld	a,(OFST+0,sp)
 346  0095 1e01          	ldw	x,(OFST-2,sp)
 347  0097 d75380        	ld	(21376,x),a
 348                     ; 240 }
 351  009a 5b05          	addw	sp,#5
 352  009c 81            	ret
 426                     ; 254 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 426                     ; 255 {
 427                     	switch	.text
 428  009d               _DAC_Cmd:
 430  009d 89            	pushw	x
 431  009e 89            	pushw	x
 432       00000002      OFST:	set	2
 435                     ; 256   uint16_t cr1addr = 0;
 437                     ; 258   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 439                     ; 259   assert_param(IS_FUNCTIONAL_STATE(NewState));
 441                     ; 262   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 443  009f 9e            	ld	a,xh
 444  00a0 48            	sll	a
 445  00a1 5f            	clrw	x
 446  00a2 97            	ld	xl,a
 447  00a3 1c5380        	addw	x,#21376
 448  00a6 1f01          	ldw	(OFST-1,sp),x
 449                     ; 264   if (NewState != DISABLE)
 451  00a8 0d04          	tnz	(OFST+2,sp)
 452  00aa 2708          	jreq	L551
 453                     ; 267     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 455  00ac 1e01          	ldw	x,(OFST-1,sp)
 456  00ae f6            	ld	a,(x)
 457  00af aa01          	or	a,#1
 458  00b1 f7            	ld	(x),a
 460  00b2 2006          	jra	L751
 461  00b4               L551:
 462                     ; 272     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 464  00b4 1e01          	ldw	x,(OFST-1,sp)
 465  00b6 f6            	ld	a,(x)
 466  00b7 a4fe          	and	a,#254
 467  00b9 f7            	ld	(x),a
 468  00ba               L751:
 469                     ; 274 }
 472  00ba 5b04          	addw	sp,#4
 473  00bc 81            	ret
 519                     ; 286 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 519                     ; 287 {
 520                     	switch	.text
 521  00bd               _DAC_SoftwareTriggerCmd:
 523  00bd 89            	pushw	x
 524       00000000      OFST:	set	0
 527                     ; 289   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 529                     ; 290   assert_param(IS_FUNCTIONAL_STATE(NewState));
 531                     ; 292   if (NewState != DISABLE)
 533  00be 9f            	ld	a,xl
 534  00bf 4d            	tnz	a
 535  00c0 2714          	jreq	L302
 536                     ; 295     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 538  00c2 9e            	ld	a,xh
 539  00c3 5f            	clrw	x
 540  00c4 97            	ld	xl,a
 541  00c5 a601          	ld	a,#1
 542  00c7 5d            	tnzw	x
 543  00c8 2704          	jreq	L41
 544  00ca               L61:
 545  00ca 48            	sll	a
 546  00cb 5a            	decw	x
 547  00cc 26fc          	jrne	L61
 548  00ce               L41:
 549  00ce ca5384        	or	a,21380
 550  00d1 c75384        	ld	21380,a
 552  00d4 2014          	jra	L502
 553  00d6               L302:
 554                     ; 300     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 556  00d6 7b01          	ld	a,(OFST+1,sp)
 557  00d8 5f            	clrw	x
 558  00d9 97            	ld	xl,a
 559  00da a601          	ld	a,#1
 560  00dc 5d            	tnzw	x
 561  00dd 2704          	jreq	L02
 562  00df               L22:
 563  00df 48            	sll	a
 564  00e0 5a            	decw	x
 565  00e1 26fc          	jrne	L22
 566  00e3               L02:
 567  00e3 43            	cpl	a
 568  00e4 c45384        	and	a,21380
 569  00e7 c75384        	ld	21380,a
 570  00ea               L502:
 571                     ; 302 }
 574  00ea 85            	popw	x
 575  00eb 81            	ret
 611                     ; 311 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 611                     ; 312 {
 612                     	switch	.text
 613  00ec               _DAC_DualSoftwareTriggerCmd:
 617                     ; 314   assert_param(IS_FUNCTIONAL_STATE(NewState));
 619                     ; 316   if (NewState != DISABLE)
 621  00ec 4d            	tnz	a
 622  00ed 270a          	jreq	L522
 623                     ; 319     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 625  00ef c65384        	ld	a,21380
 626  00f2 aa03          	or	a,#3
 627  00f4 c75384        	ld	21380,a
 629  00f7 2008          	jra	L722
 630  00f9               L522:
 631                     ; 324     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 633  00f9 c65384        	ld	a,21380
 634  00fc a4fc          	and	a,#252
 635  00fe c75384        	ld	21380,a
 636  0101               L722:
 637                     ; 326 }
 640  0101 81            	ret
 725                     ; 342 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 725                     ; 343                            DAC_Wave_TypeDef DAC_Wave,
 725                     ; 344                            FunctionalState NewState)
 725                     ; 345 {
 726                     	switch	.text
 727  0102               _DAC_WaveGenerationCmd:
 729  0102 89            	pushw	x
 730  0103 88            	push	a
 731       00000001      OFST:	set	1
 734                     ; 346   uint8_t tmpreg = 0;
 736                     ; 349   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 738                     ; 350   assert_param(IS_DAC_WAVE(DAC_Wave));
 740                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 742                     ; 354   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 744  0104 9e            	ld	a,xh
 745  0105 48            	sll	a
 746  0106 5f            	clrw	x
 747  0107 97            	ld	xl,a
 748  0108 d65380        	ld	a,(21376,x)
 749  010b a43f          	and	a,#63
 750  010d 6b01          	ld	(OFST+0,sp),a
 751                     ; 356   if (NewState != DISABLE)
 753  010f 0d06          	tnz	(OFST+5,sp)
 754  0111 2706          	jreq	L372
 755                     ; 358     tmpreg |= (uint8_t)(DAC_Wave);
 757  0113 7b01          	ld	a,(OFST+0,sp)
 758  0115 1a03          	or	a,(OFST+2,sp)
 759  0117 6b01          	ld	(OFST+0,sp),a
 760  0119               L372:
 761                     ; 362   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 763  0119 7b02          	ld	a,(OFST+1,sp)
 764  011b 48            	sll	a
 765  011c 5f            	clrw	x
 766  011d 97            	ld	xl,a
 767  011e 7b01          	ld	a,(OFST+0,sp)
 768  0120 d75380        	ld	(21376,x),a
 769                     ; 364 }
 772  0123 5b03          	addw	sp,#3
 773  0125 81            	ret
 939                     ; 388 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 939                     ; 389 {
 940                     	switch	.text
 941  0126               _DAC_SetNoiseWaveLFSR:
 943  0126 89            	pushw	x
 944  0127 5203          	subw	sp,#3
 945       00000003      OFST:	set	3
 948                     ; 390   uint8_t tmpreg = 0;
 950                     ; 391   uint16_t cr2addr = 0;
 952                     ; 394   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 954                     ; 395   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 956                     ; 398   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 958  0129 9e            	ld	a,xh
 959  012a 48            	sll	a
 960  012b 5f            	clrw	x
 961  012c 97            	ld	xl,a
 962  012d 1c5381        	addw	x,#21377
 963  0130 1f02          	ldw	(OFST-1,sp),x
 964                     ; 399   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 966  0132 1e02          	ldw	x,(OFST-1,sp)
 967  0134 f6            	ld	a,(x)
 968  0135 a4f0          	and	a,#240
 969  0137 6b01          	ld	(OFST-2,sp),a
 970                     ; 402   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 972  0139 7b01          	ld	a,(OFST-2,sp)
 973  013b 1a05          	or	a,(OFST+2,sp)
 974  013d 1e02          	ldw	x,(OFST-1,sp)
 975  013f f7            	ld	(x),a
 976                     ; 403 }
 979  0140 5b05          	addw	sp,#5
 980  0142 81            	ret
1147                     ; 427 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
1147                     ; 428 {
1148                     	switch	.text
1149  0143               _DAC_SetTriangleWaveAmplitude:
1151  0143 89            	pushw	x
1152  0144 5203          	subw	sp,#3
1153       00000003      OFST:	set	3
1156                     ; 429   uint8_t tmpreg = 0;
1158                     ; 430   uint16_t cr2addr = 0;
1160                     ; 433   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1162                     ; 434   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
1164                     ; 438   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
1166  0146 9e            	ld	a,xh
1167  0147 48            	sll	a
1168  0148 5f            	clrw	x
1169  0149 97            	ld	xl,a
1170  014a 1c5381        	addw	x,#21377
1171  014d 1f02          	ldw	(OFST-1,sp),x
1172                     ; 439   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
1174  014f 1e02          	ldw	x,(OFST-1,sp)
1175  0151 f6            	ld	a,(x)
1176  0152 a4f0          	and	a,#240
1177  0154 6b01          	ld	(OFST-2,sp),a
1178                     ; 442   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
1180  0156 7b01          	ld	a,(OFST-2,sp)
1181  0158 1a05          	or	a,(OFST+2,sp)
1182  015a 1e02          	ldw	x,(OFST-1,sp)
1183  015c f7            	ld	(x),a
1184                     ; 443 }
1187  015d 5b05          	addw	sp,#5
1188  015f 81            	ret
1260                     ; 455 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1260                     ; 456 {
1261                     	switch	.text
1262  0160               _DAC_SetChannel1Data:
1264  0160 88            	push	a
1265       00000000      OFST:	set	0
1268                     ; 458   assert_param(IS_DAC_ALIGN(DAC_Align));
1270                     ; 460   if (DAC_Align != DAC_Align_8b_R)
1272  0161 a108          	cp	a,#8
1273  0163 2712          	jreq	L505
1274                     ; 463     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1276  0165 5f            	clrw	x
1277  0166 97            	ld	xl,a
1278  0167 7b04          	ld	a,(OFST+4,sp)
1279  0169 d75388        	ld	(21384,x),a
1280                     ; 464     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1282  016c 7b01          	ld	a,(OFST+1,sp)
1283  016e 5f            	clrw	x
1284  016f 97            	ld	xl,a
1285  0170 7b05          	ld	a,(OFST+5,sp)
1286  0172 d75389        	ld	(21385,x),a
1288  0175 2005          	jra	L705
1289  0177               L505:
1290                     ; 469     assert_param(IS_DAC_DATA_08R(DAC_Data));
1292                     ; 472     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
1294  0177 7b05          	ld	a,(OFST+5,sp)
1295  0179 c75390        	ld	21392,a
1296  017c               L705:
1297                     ; 474 }
1300  017c 84            	pop	a
1301  017d 81            	ret
1346                     ; 486 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1346                     ; 487 {
1347                     	switch	.text
1348  017e               _DAC_SetChannel2Data:
1350  017e 88            	push	a
1351       00000000      OFST:	set	0
1354                     ; 489   assert_param(IS_DAC_ALIGN(DAC_Align));
1356                     ; 491   if (DAC_Align != DAC_Align_8b_R)
1358  017f a108          	cp	a,#8
1359  0181 2712          	jreq	L335
1360                     ; 494     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1362  0183 5f            	clrw	x
1363  0184 97            	ld	xl,a
1364  0185 7b04          	ld	a,(OFST+4,sp)
1365  0187 d75394        	ld	(21396,x),a
1366                     ; 495     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1368  018a 7b01          	ld	a,(OFST+1,sp)
1369  018c 5f            	clrw	x
1370  018d 97            	ld	xl,a
1371  018e 7b05          	ld	a,(OFST+5,sp)
1372  0190 d75395        	ld	(21397,x),a
1374  0193 2005          	jra	L535
1375  0195               L335:
1376                     ; 500     assert_param(IS_DAC_DATA_08R(DAC_Data));
1378                     ; 503     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
1380  0195 7b05          	ld	a,(OFST+5,sp)
1381  0197 c7539c        	ld	21404,a
1382  019a               L535:
1383                     ; 505 }
1386  019a 84            	pop	a
1387  019b 81            	ret
1450                     ; 522 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
1450                     ; 523 {
1451                     	switch	.text
1452  019c               _DAC_SetDualChannelData:
1454  019c 88            	push	a
1455  019d 89            	pushw	x
1456       00000002      OFST:	set	2
1459                     ; 524   uint16_t dchxrdhrhaddr = 0;
1461                     ; 527   assert_param(IS_DAC_ALIGN(DAC_Align));
1463                     ; 529   if (DAC_Align != DAC_Align_8b_R)
1465  019e a108          	cp	a,#8
1466  01a0 2727          	jreq	L175
1467                     ; 532     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
1469  01a2 a653          	ld	a,#83
1470  01a4 97            	ld	xl,a
1471  01a5 a6a0          	ld	a,#160
1472  01a7 1b03          	add	a,(OFST+1,sp)
1473  01a9 2401          	jrnc	L24
1474  01ab 5c            	incw	x
1475  01ac               L24:
1476  01ac 02            	rlwa	x,a
1477  01ad 1f01          	ldw	(OFST-1,sp),x
1478  01af 01            	rrwa	x,a
1479                     ; 535     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
1481  01b0 7b08          	ld	a,(OFST+6,sp)
1482  01b2 1e01          	ldw	x,(OFST-1,sp)
1483  01b4 f7            	ld	(x),a
1484                     ; 536     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
1486  01b5 7b09          	ld	a,(OFST+7,sp)
1487  01b7 1e01          	ldw	x,(OFST-1,sp)
1488  01b9 e701          	ld	(1,x),a
1489                     ; 537     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
1491  01bb 7b06          	ld	a,(OFST+4,sp)
1492  01bd 1e01          	ldw	x,(OFST-1,sp)
1493  01bf e702          	ld	(2,x),a
1494                     ; 538     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
1496  01c1 7b07          	ld	a,(OFST+5,sp)
1497  01c3 1e01          	ldw	x,(OFST-1,sp)
1498  01c5 e703          	ld	(3,x),a
1500  01c7 200a          	jra	L375
1501  01c9               L175:
1502                     ; 543     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
1504                     ; 546     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
1506  01c9 7b09          	ld	a,(OFST+7,sp)
1507  01cb c753a8        	ld	21416,a
1508                     ; 547     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
1510  01ce 7b07          	ld	a,(OFST+5,sp)
1511  01d0 c753a9        	ld	21417,a
1512  01d3               L375:
1513                     ; 549 }
1516  01d3 5b03          	addw	sp,#3
1517  01d5 81            	ret
1571                     ; 559 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
1571                     ; 560 {
1572                     	switch	.text
1573  01d6               _DAC_GetDataOutputValue:
1575  01d6 89            	pushw	x
1576       00000002      OFST:	set	2
1579                     ; 561   uint16_t outputdata = 0;
1581                     ; 562   uint16_t tmp = 0;
1583                     ; 565   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1585                     ; 567   if ( DAC_Channel ==  DAC_Channel_1)
1587  01d7 4d            	tnz	a
1588  01d8 2619          	jrne	L326
1589                     ; 570     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
1591  01da c653ac        	ld	a,21420
1592  01dd 5f            	clrw	x
1593  01de 97            	ld	xl,a
1594  01df 4f            	clr	a
1595  01e0 02            	rlwa	x,a
1596  01e1 1f01          	ldw	(OFST-1,sp),x
1597                     ; 571     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
1599  01e3 c653ad        	ld	a,21421
1600  01e6 5f            	clrw	x
1601  01e7 97            	ld	xl,a
1602  01e8 01            	rrwa	x,a
1603  01e9 1a02          	or	a,(OFST+0,sp)
1604  01eb 01            	rrwa	x,a
1605  01ec 1a01          	or	a,(OFST-1,sp)
1606  01ee 01            	rrwa	x,a
1607  01ef 1f01          	ldw	(OFST-1,sp),x
1609  01f1 2017          	jra	L526
1610  01f3               L326:
1611                     ; 576     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
1613  01f3 c653b0        	ld	a,21424
1614  01f6 5f            	clrw	x
1615  01f7 97            	ld	xl,a
1616  01f8 4f            	clr	a
1617  01f9 02            	rlwa	x,a
1618  01fa 1f01          	ldw	(OFST-1,sp),x
1619                     ; 577     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
1621  01fc c653b1        	ld	a,21425
1622  01ff 5f            	clrw	x
1623  0200 97            	ld	xl,a
1624  0201 01            	rrwa	x,a
1625  0202 1a02          	or	a,(OFST+0,sp)
1626  0204 01            	rrwa	x,a
1627  0205 1a01          	or	a,(OFST-1,sp)
1628  0207 01            	rrwa	x,a
1629  0208 1f01          	ldw	(OFST-1,sp),x
1630  020a               L526:
1631                     ; 581   return (uint16_t)outputdata;
1633  020a 1e01          	ldw	x,(OFST-1,sp)
1636  020c 5b02          	addw	sp,#2
1637  020e 81            	ret
1691                     ; 613 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1691                     ; 614 {
1692                     	switch	.text
1693  020f               _DAC_DMACmd:
1695  020f 89            	pushw	x
1696  0210 89            	pushw	x
1697       00000002      OFST:	set	2
1700                     ; 615   uint16_t cr2addr = 0;
1702                     ; 618   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1704                     ; 619   assert_param(IS_FUNCTIONAL_STATE(NewState));
1706                     ; 622   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1708  0211 9e            	ld	a,xh
1709  0212 48            	sll	a
1710  0213 5f            	clrw	x
1711  0214 97            	ld	xl,a
1712  0215 1c5381        	addw	x,#21377
1713  0218 1f01          	ldw	(OFST-1,sp),x
1714                     ; 624   if (NewState != DISABLE)
1716  021a 0d04          	tnz	(OFST+2,sp)
1717  021c 2708          	jreq	L556
1718                     ; 627     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
1720  021e 1e01          	ldw	x,(OFST-1,sp)
1721  0220 f6            	ld	a,(x)
1722  0221 aa10          	or	a,#16
1723  0223 f7            	ld	(x),a
1725  0224 2006          	jra	L756
1726  0226               L556:
1727                     ; 632     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
1729  0226 1e01          	ldw	x,(OFST-1,sp)
1730  0228 f6            	ld	a,(x)
1731  0229 a4ef          	and	a,#239
1732  022b f7            	ld	(x),a
1733  022c               L756:
1734                     ; 634 }
1737  022c 5b04          	addw	sp,#4
1738  022e 81            	ret
1815                     ; 667 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
1815                     ; 668 {
1816                     	switch	.text
1817  022f               _DAC_ITConfig:
1819  022f 89            	pushw	x
1820  0230 89            	pushw	x
1821       00000002      OFST:	set	2
1824                     ; 669   uint16_t cr2addr = 0;
1826                     ; 672   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1828                     ; 673   assert_param(IS_FUNCTIONAL_STATE(NewState));
1830                     ; 674   assert_param(IS_DAC_IT(DAC_IT));
1832                     ; 677   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1834  0231 9e            	ld	a,xh
1835  0232 48            	sll	a
1836  0233 5f            	clrw	x
1837  0234 97            	ld	xl,a
1838  0235 1c5381        	addw	x,#21377
1839  0238 1f01          	ldw	(OFST-1,sp),x
1840                     ; 679   if (NewState != DISABLE)
1842  023a 0d07          	tnz	(OFST+5,sp)
1843  023c 2708          	jreq	L127
1844                     ; 682     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
1846  023e 1e01          	ldw	x,(OFST-1,sp)
1847  0240 f6            	ld	a,(x)
1848  0241 1a04          	or	a,(OFST+2,sp)
1849  0243 f7            	ld	(x),a
1851  0244 2007          	jra	L327
1852  0246               L127:
1853                     ; 687     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
1855  0246 1e01          	ldw	x,(OFST-1,sp)
1856  0248 7b04          	ld	a,(OFST+2,sp)
1857  024a 43            	cpl	a
1858  024b f4            	and	a,(x)
1859  024c f7            	ld	(x),a
1860  024d               L327:
1861                     ; 689 }
1864  024d 5b04          	addw	sp,#4
1865  024f 81            	ret
1963                     ; 704 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1963                     ; 705 {
1964                     	switch	.text
1965  0250               _DAC_GetFlagStatus:
1967  0250 89            	pushw	x
1968  0251 88            	push	a
1969       00000001      OFST:	set	1
1972                     ; 706   FlagStatus flagstatus = RESET;
1974                     ; 707   uint8_t flag = 0;
1976                     ; 710   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1978                     ; 711   assert_param(IS_DAC_FLAG(DAC_FLAG));
1980                     ; 713   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
1982  0252 9e            	ld	a,xh
1983  0253 5f            	clrw	x
1984  0254 97            	ld	xl,a
1985  0255 7b03          	ld	a,(OFST+2,sp)
1986  0257 5d            	tnzw	x
1987  0258 2704          	jreq	L45
1988  025a               L65:
1989  025a 48            	sll	a
1990  025b 5a            	decw	x
1991  025c 26fc          	jrne	L65
1992  025e               L45:
1993  025e 6b01          	ld	(OFST+0,sp),a
1994                     ; 716   if ((DAC->SR & flag ) != (uint8_t)RESET)
1996  0260 c65385        	ld	a,21381
1997  0263 1501          	bcp	a,(OFST+0,sp)
1998  0265 2706          	jreq	L577
1999                     ; 719     flagstatus = SET;
2001  0267 a601          	ld	a,#1
2002  0269 6b01          	ld	(OFST+0,sp),a
2004  026b 2002          	jra	L777
2005  026d               L577:
2006                     ; 724     flagstatus = RESET;
2008  026d 0f01          	clr	(OFST+0,sp)
2009  026f               L777:
2010                     ; 728   return  flagstatus;
2012  026f 7b01          	ld	a,(OFST+0,sp)
2015  0271 5b03          	addw	sp,#3
2016  0273 81            	ret
2070                     ; 742 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
2070                     ; 743 {
2071                     	switch	.text
2072  0274               _DAC_ClearFlag:
2074  0274 89            	pushw	x
2075  0275 88            	push	a
2076       00000001      OFST:	set	1
2079                     ; 744   uint8_t flag = 0;
2081                     ; 747   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2083                     ; 748   assert_param(IS_DAC_FLAG(DAC_FLAG));
2085                     ; 751   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
2087  0276 9e            	ld	a,xh
2088  0277 5f            	clrw	x
2089  0278 97            	ld	xl,a
2090  0279 7b03          	ld	a,(OFST+2,sp)
2091  027b 5d            	tnzw	x
2092  027c 2704          	jreq	L26
2093  027e               L46:
2094  027e 48            	sll	a
2095  027f 5a            	decw	x
2096  0280 26fc          	jrne	L46
2097  0282               L26:
2098  0282 6b01          	ld	(OFST+0,sp),a
2099                     ; 754   DAC->SR = (uint8_t)(~flag);
2101  0284 7b01          	ld	a,(OFST+0,sp)
2102  0286 43            	cpl	a
2103  0287 c75385        	ld	21381,a
2104                     ; 755 }
2107  028a 5b03          	addw	sp,#3
2108  028c 81            	ret
2191                     ; 770 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2191                     ; 771 {
2192                     	switch	.text
2193  028d               _DAC_GetITStatus:
2195  028d 89            	pushw	x
2196  028e 89            	pushw	x
2197       00000002      OFST:	set	2
2200                     ; 772   ITStatus itstatus = RESET;
2202                     ; 773   uint8_t enablestatus = 0;
2204                     ; 774   uint8_t flagstatus = 0;
2206                     ; 775   uint8_t tempreg = 0;
2208                     ; 778   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2210                     ; 779   assert_param(IS_DAC_IT(DAC_IT));
2212                     ; 782   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
2214  028f 9e            	ld	a,xh
2215  0290 48            	sll	a
2216  0291 48            	sll	a
2217  0292 5f            	clrw	x
2218  0293 97            	ld	xl,a
2219  0294 d65381        	ld	a,(21377,x)
2220  0297 6b02          	ld	(OFST+0,sp),a
2221                     ; 783   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
2223  0299 7b03          	ld	a,(OFST+1,sp)
2224  029b 5f            	clrw	x
2225  029c 97            	ld	xl,a
2226  029d 7b04          	ld	a,(OFST+2,sp)
2227  029f 5d            	tnzw	x
2228  02a0 2704          	jreq	L07
2229  02a2               L27:
2230  02a2 48            	sll	a
2231  02a3 5a            	decw	x
2232  02a4 26fc          	jrne	L27
2233  02a6               L07:
2234  02a6 1402          	and	a,(OFST+0,sp)
2235  02a8 6b01          	ld	(OFST-1,sp),a
2236                     ; 784   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
2238  02aa a605          	ld	a,#5
2239  02ac 1003          	sub	a,(OFST+1,sp)
2240  02ae 5f            	clrw	x
2241  02af 97            	ld	xl,a
2242  02b0 7b04          	ld	a,(OFST+2,sp)
2243  02b2 5d            	tnzw	x
2244  02b3 2704          	jreq	L47
2245  02b5               L67:
2246  02b5 44            	srl	a
2247  02b6 5a            	decw	x
2248  02b7 26fc          	jrne	L67
2249  02b9               L47:
2250  02b9 c45385        	and	a,21381
2251  02bc 6b02          	ld	(OFST+0,sp),a
2252                     ; 787   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
2254  02be 0d02          	tnz	(OFST+0,sp)
2255  02c0 270a          	jreq	L1701
2257  02c2 0d01          	tnz	(OFST-1,sp)
2258  02c4 2706          	jreq	L1701
2259                     ; 790     itstatus = SET;
2261  02c6 a601          	ld	a,#1
2262  02c8 6b02          	ld	(OFST+0,sp),a
2264  02ca 2002          	jra	L3701
2265  02cc               L1701:
2266                     ; 795     itstatus = RESET;
2268  02cc 0f02          	clr	(OFST+0,sp)
2269  02ce               L3701:
2270                     ; 799   return  itstatus;
2272  02ce 7b02          	ld	a,(OFST+0,sp)
2275  02d0 5b04          	addw	sp,#4
2276  02d2 81            	ret
2322                     ; 813 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2322                     ; 814 {
2323                     	switch	.text
2324  02d3               _DAC_ClearITPendingBit:
2326  02d3 89            	pushw	x
2327       00000000      OFST:	set	0
2330                     ; 816   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2332                     ; 817   assert_param(IS_DAC_IT(DAC_IT));
2334                     ; 820   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
2336  02d4 9e            	ld	a,xh
2337  02d5 a005          	sub	a,#5
2338  02d7 40            	neg	a
2339  02d8 5f            	clrw	x
2340  02d9 97            	ld	xl,a
2341  02da 7b02          	ld	a,(OFST+2,sp)
2342  02dc 5d            	tnzw	x
2343  02dd 2704          	jreq	L201
2344  02df               L401:
2345  02df 44            	srl	a
2346  02e0 5a            	decw	x
2347  02e1 26fc          	jrne	L401
2348  02e3               L201:
2349  02e3 43            	cpl	a
2350  02e4 c75385        	ld	21381,a
2351                     ; 821 }
2354  02e7 85            	popw	x
2355  02e8 81            	ret
2368                     	xdef	_DAC_ClearITPendingBit
2369                     	xdef	_DAC_GetITStatus
2370                     	xdef	_DAC_ClearFlag
2371                     	xdef	_DAC_GetFlagStatus
2372                     	xdef	_DAC_ITConfig
2373                     	xdef	_DAC_DMACmd
2374                     	xdef	_DAC_GetDataOutputValue
2375                     	xdef	_DAC_SetDualChannelData
2376                     	xdef	_DAC_SetChannel2Data
2377                     	xdef	_DAC_SetChannel1Data
2378                     	xdef	_DAC_SetTriangleWaveAmplitude
2379                     	xdef	_DAC_SetNoiseWaveLFSR
2380                     	xdef	_DAC_WaveGenerationCmd
2381                     	xdef	_DAC_DualSoftwareTriggerCmd
2382                     	xdef	_DAC_SoftwareTriggerCmd
2383                     	xdef	_DAC_Cmd
2384                     	xdef	_DAC_Init
2385                     	xdef	_DAC_DeInit
2404                     	end
