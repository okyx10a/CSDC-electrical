   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  96                     ; 232 ErrorStatus RTC_DeInit(void)
  96                     ; 233 {
  98                     	switch	.text
  99  0000               _RTC_DeInit:
 101  0000 5205          	subw	sp,#5
 102       00000005      OFST:	set	5
 105                     ; 234   ErrorStatus status = ERROR;
 107                     ; 235   uint16_t wutwfcount = 0;
 109  0002 5f            	clrw	x
 110  0003 1f02          	ldw	(OFST-3,sp),x
 111                     ; 236   uint16_t recalpfcount = 0;
 113  0005 5f            	clrw	x
 114  0006 1f04          	ldw	(OFST-1,sp),x
 115                     ; 239   RTC->WPR = 0xCA;
 117  0008 35ca5159      	mov	20825,#202
 118                     ; 240   RTC->WPR = 0x53;
 120  000c 35535159      	mov	20825,#83
 121                     ; 243   if (RTC_EnterInitMode() == ERROR)
 123  0010 cd0161        	call	_RTC_EnterInitMode
 125  0013 4d            	tnz	a
 126  0014 260b          	jrne	L35
 127                     ; 245     status = ERROR;
 129  0016 0f01          	clr	(OFST-4,sp)
 130                     ; 247     RTC->WPR = 0xFF; 
 132  0018 35ff5159      	mov	20825,#255
 134  001c               L55:
 135                     ; 343   return (ErrorStatus)status;
 137  001c 7b01          	ld	a,(OFST-4,sp)
 140  001e 5b05          	addw	sp,#5
 141  0020 81            	ret
 142  0021               L35:
 143                     ; 252     RTC->TR1 = RTC_TR1_RESET_VALUE;
 145  0021 725f5140      	clr	20800
 146                     ; 253     RTC->TR2 = RTC_TR2_RESET_VALUE;
 148  0025 725f5141      	clr	20801
 149                     ; 254     RTC->TR3 = RTC_TR3_RESET_VALUE;
 151  0029 725f5142      	clr	20802
 152                     ; 257     RTC->DR1 = RTC_DR1_RESET_VALUE;
 154  002d 35015144      	mov	20804,#1
 155                     ; 258     RTC->DR2 = RTC_DR2_RESET_VALUE;
 157  0031 35215145      	mov	20805,#33
 158                     ; 259     RTC->DR3 = RTC_DR3_RESET_VALUE;
 160  0035 725f5146      	clr	20806
 161                     ; 262     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 163  0039 725f5150      	clr	20816
 164                     ; 263     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 166  003d 35ff5151      	mov	20817,#255
 167                     ; 264     RTC->APRER  = RTC_APRER_RESET_VALUE;
 169  0041 357f5152      	mov	20818,#127
 170                     ; 266     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 172  0045 725f516c      	clr	20844
 173                     ; 267     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 175  0049 725f516d      	clr	20845
 176                     ; 271     RTC->CR1 = RTC_CR1_RESET_VALUE;
 178  004d 725f5148      	clr	20808
 179                     ; 272     RTC->CR2 = RTC_CR2_RESET_VALUE;
 181  0051 725f5149      	clr	20809
 182                     ; 273     RTC->CR3 = RTC_CR3_RESET_VALUE;
 184  0055 725f514a      	clr	20810
 186  0059 200b          	jra	L36
 187  005b               L75:
 188                     ; 278       wutwfcount++;
 190  005b 1e02          	ldw	x,(OFST-3,sp)
 191  005d 1c0001        	addw	x,#1
 192  0060 1f02          	ldw	(OFST-3,sp),x
 193                     ; 279       RTC->ISR1 = 0;
 195  0062 725f514c      	clr	20812
 196  0066               L36:
 197                     ; 276     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 199  0066 c6514c        	ld	a,20812
 200  0069 a504          	bcp	a,#4
 201  006b 2607          	jrne	L76
 203  006d 1e02          	ldw	x,(OFST-3,sp)
 204  006f a3ffff        	cpw	x,#65535
 205  0072 26e7          	jrne	L75
 206  0074               L76:
 207                     ; 282     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 209  0074 c6514c        	ld	a,20812
 210  0077 a504          	bcp	a,#4
 211  0079 2608          	jrne	L17
 212                     ; 284       status = ERROR;
 214  007b 0f01          	clr	(OFST-4,sp)
 215                     ; 286       RTC->WPR = 0xFF; 
 217  007d 35ff5159      	mov	20825,#255
 219  0081 2099          	jra	L55
 220  0083               L17:
 221                     ; 291       RTC->CR1 = RTC_CR1_RESET_VALUE;
 223  0083 725f5148      	clr	20808
 224                     ; 294       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 226  0087 35ff5154      	mov	20820,#255
 227                     ; 295       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 229  008b 35ff5155      	mov	20821,#255
 230                     ; 298       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 232  008f 725f515c      	clr	20828
 233                     ; 299       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 235  0093 725f515d      	clr	20829
 236                     ; 300       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 238  0097 725f515e      	clr	20830
 239                     ; 301       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 241  009b 725f515f      	clr	20831
 242                     ; 303       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 244  009f 725f5164      	clr	20836
 245                     ; 304       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 247  00a3 725f5165      	clr	20837
 248                     ; 305       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 250  00a7 725f5166      	clr	20838
 251                     ; 308       RTC->ISR1 = (uint8_t)0x00;
 253  00ab 725f514c      	clr	20812
 254                     ; 309       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 256  00af 725f514d      	clr	20813
 257                     ; 311       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 259  00b3 c6514c        	ld	a,20812
 260  00b6 a502          	bcp	a,#2
 261  00b8 2717          	jreq	L57
 263  00ba 2007          	jra	L101
 264  00bc               L77:
 265                     ; 315           recalpfcount++;
 267  00bc 1e04          	ldw	x,(OFST-1,sp)
 268  00be 1c0001        	addw	x,#1
 269  00c1 1f04          	ldw	(OFST-1,sp),x
 270  00c3               L101:
 271                     ; 313         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 273  00c3 c6514c        	ld	a,20812
 274  00c6 a502          	bcp	a,#2
 275  00c8 2707          	jreq	L57
 277  00ca 1e04          	ldw	x,(OFST-1,sp)
 278  00cc a3ffff        	cpw	x,#65535
 279  00cf 26eb          	jrne	L77
 280  00d1               L57:
 281                     ; 318       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 283  00d1 c6514c        	ld	a,20812
 284  00d4 a502          	bcp	a,#2
 285  00d6 2618          	jrne	L701
 286                     ; 320         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 288  00d8 725f516a      	clr	20842
 289                     ; 321         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 291  00dc 725f516b      	clr	20843
 292                     ; 323         if (RTC_WaitForSynchro() == ERROR)
 294  00e0 cd01a1        	call	_RTC_WaitForSynchro
 296  00e3 4d            	tnz	a
 297  00e4 2604          	jrne	L111
 298                     ; 325           status = ERROR;
 300  00e6 0f01          	clr	(OFST-4,sp)
 302  00e8 2008          	jra	L511
 303  00ea               L111:
 304                     ; 329           status = SUCCESS;
 306  00ea a601          	ld	a,#1
 307  00ec 6b01          	ld	(OFST-4,sp),a
 308  00ee 2002          	jra	L511
 309  00f0               L701:
 310                     ; 334         status = ERROR;
 312  00f0 0f01          	clr	(OFST-4,sp)
 313  00f2               L511:
 314                     ; 338       RTC->WPR = 0xFF; 
 316  00f2 35ff5159      	mov	20825,#255
 317  00f6 ac1c001c      	jpf	L55
 417                     ; 359 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 417                     ; 360 {
 418                     	switch	.text
 419  00fa               _RTC_Init:
 421  00fa 89            	pushw	x
 422  00fb 88            	push	a
 423       00000001      OFST:	set	1
 426                     ; 361   ErrorStatus status = ERROR;
 428                     ; 364   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 430                     ; 365   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 432                     ; 366   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 434                     ; 369   RTC->WPR = 0xCA;
 436  00fc 35ca5159      	mov	20825,#202
 437                     ; 370   RTC->WPR = 0x53;
 439  0100 35535159      	mov	20825,#83
 440                     ; 373   if (RTC_EnterInitMode() == ERROR)
 442  0104 ad5b          	call	_RTC_EnterInitMode
 444  0106 4d            	tnz	a
 445  0107 2604          	jrne	L761
 446                     ; 375     status = ERROR;
 448  0109 0f01          	clr	(OFST+0,sp)
 450  010b 202d          	jra	L171
 451  010d               L761:
 452                     ; 380     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 454  010d 721d5148      	bres	20808,#6
 455                     ; 383     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 457  0111 1e02          	ldw	x,(OFST+1,sp)
 458  0113 c65148        	ld	a,20808
 459  0116 fa            	or	a,(x)
 460  0117 c75148        	ld	20808,a
 461                     ; 386     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 463  011a 1e02          	ldw	x,(OFST+1,sp)
 464  011c ee02          	ldw	x,(2,x)
 465  011e 4f            	clr	a
 466  011f 01            	rrwa	x,a
 467  0120 9f            	ld	a,xl
 468  0121 c75150        	ld	20816,a
 469                     ; 387     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 471  0124 1e02          	ldw	x,(OFST+1,sp)
 472  0126 e603          	ld	a,(3,x)
 473  0128 c75151        	ld	20817,a
 474                     ; 388     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 476  012b 1e02          	ldw	x,(OFST+1,sp)
 477  012d e601          	ld	a,(1,x)
 478  012f c75152        	ld	20818,a
 479                     ; 391     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 481  0132 721f514c      	bres	20812,#7
 482                     ; 393     status = SUCCESS;
 484  0136 a601          	ld	a,#1
 485  0138 6b01          	ld	(OFST+0,sp),a
 486  013a               L171:
 487                     ; 397   RTC->WPR = 0xFF; 
 489  013a 35ff5159      	mov	20825,#255
 490                     ; 400   return (ErrorStatus)(status);
 492  013e 7b01          	ld	a,(OFST+0,sp)
 495  0140 5b03          	addw	sp,#3
 496  0142 81            	ret
 533                     ; 410 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 533                     ; 411 {
 534                     	switch	.text
 535  0143               _RTC_StructInit:
 539                     ; 413   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 541  0143 7f            	clr	(x)
 542                     ; 416   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 544  0144 a67f          	ld	a,#127
 545  0146 e701          	ld	(1,x),a
 546                     ; 419   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 548  0148 90ae00ff      	ldw	y,#255
 549  014c ef02          	ldw	(2,x),y
 550                     ; 420 }
 553  014e 81            	ret
 609                     ; 430 void RTC_WriteProtectionCmd(FunctionalState NewState)
 609                     ; 431 {
 610                     	switch	.text
 611  014f               _RTC_WriteProtectionCmd:
 615                     ; 433   assert_param(IS_FUNCTIONAL_STATE(NewState));
 617                     ; 435   if (NewState != DISABLE)
 619  014f 4d            	tnz	a
 620  0150 2706          	jreq	L142
 621                     ; 438     RTC->WPR = RTC_WPR_EnableKey;
 623  0152 35ff5159      	mov	20825,#255
 625  0156 2008          	jra	L342
 626  0158               L142:
 627                     ; 443     RTC->WPR = RTC_WPR_DisableKey1;
 629  0158 35ca5159      	mov	20825,#202
 630                     ; 444     RTC->WPR = RTC_WPR_DisableKey2;
 632  015c 35535159      	mov	20825,#83
 633  0160               L342:
 634                     ; 446 }
 637  0160 81            	ret
 682                     ; 458 ErrorStatus RTC_EnterInitMode(void)
 682                     ; 459 {
 683                     	switch	.text
 684  0161               _RTC_EnterInitMode:
 686  0161 5203          	subw	sp,#3
 687       00000003      OFST:	set	3
 690                     ; 460   ErrorStatus status = ERROR;
 692                     ; 461   uint16_t initfcount = 0;
 694  0163 5f            	clrw	x
 695  0164 1f02          	ldw	(OFST-1,sp),x
 696                     ; 464   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 698  0166 c6514c        	ld	a,20812
 699  0169 a540          	bcp	a,#64
 700  016b 261b          	jrne	L762
 701                     ; 467     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 703  016d 3580514c      	mov	20812,#128
 705  0171 2007          	jra	L572
 706  0173               L172:
 707                     ; 472       initfcount++;
 709  0173 1e02          	ldw	x,(OFST-1,sp)
 710  0175 1c0001        	addw	x,#1
 711  0178 1f02          	ldw	(OFST-1,sp),x
 712  017a               L572:
 713                     ; 470     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 715  017a c6514c        	ld	a,20812
 716  017d a540          	bcp	a,#64
 717  017f 2607          	jrne	L762
 719  0181 1e02          	ldw	x,(OFST-1,sp)
 720  0183 a3ffff        	cpw	x,#65535
 721  0186 26eb          	jrne	L172
 722  0188               L762:
 723                     ; 476   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 725  0188 c6514c        	ld	a,20812
 726  018b a540          	bcp	a,#64
 727  018d 2604          	jrne	L303
 728                     ; 478     status = ERROR;
 730  018f 0f01          	clr	(OFST-2,sp)
 732  0191 2004          	jra	L503
 733  0193               L303:
 734                     ; 482     status = SUCCESS;
 736  0193 a601          	ld	a,#1
 737  0195 6b01          	ld	(OFST-2,sp),a
 738  0197               L503:
 739                     ; 485   return (ErrorStatus)status;
 741  0197 7b01          	ld	a,(OFST-2,sp)
 744  0199 5b03          	addw	sp,#3
 745  019b 81            	ret
 768                     ; 498 void RTC_ExitInitMode(void)
 768                     ; 499 {
 769                     	switch	.text
 770  019c               _RTC_ExitInitMode:
 774                     ; 501   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 776  019c 721f514c      	bres	20812,#7
 777                     ; 502 }
 780  01a0 81            	ret
 825                     ; 527 ErrorStatus RTC_WaitForSynchro(void)
 825                     ; 528 {
 826                     	switch	.text
 827  01a1               _RTC_WaitForSynchro:
 829  01a1 5203          	subw	sp,#3
 830       00000003      OFST:	set	3
 833                     ; 529   uint16_t rsfcount = 0;
 835  01a3 5f            	clrw	x
 836  01a4 1f02          	ldw	(OFST-1,sp),x
 837                     ; 530   ErrorStatus status = ERROR;
 839                     ; 533   RTC->WPR = 0xCA;
 841  01a6 35ca5159      	mov	20825,#202
 842                     ; 534   RTC->WPR = 0x53;
 844  01aa 35535159      	mov	20825,#83
 845                     ; 537   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 847  01ae c6514c        	ld	a,20812
 848  01b1 a45f          	and	a,#95
 849  01b3 c7514c        	ld	20812,a
 851  01b6 2007          	jra	L343
 852  01b8               L143:
 853                     ; 542     rsfcount++;
 855  01b8 1e02          	ldw	x,(OFST-1,sp)
 856  01ba 1c0001        	addw	x,#1
 857  01bd 1f02          	ldw	(OFST-1,sp),x
 858  01bf               L343:
 859                     ; 540   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
 861  01bf c6514c        	ld	a,20812
 862  01c2 a520          	bcp	a,#32
 863  01c4 2607          	jrne	L743
 865  01c6 1e02          	ldw	x,(OFST-1,sp)
 866  01c8 a3ffff        	cpw	x,#65535
 867  01cb 26eb          	jrne	L143
 868  01cd               L743:
 869                     ; 546   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
 871  01cd c6514c        	ld	a,20812
 872  01d0 a520          	bcp	a,#32
 873  01d2 2706          	jreq	L153
 874                     ; 548     status = SUCCESS;
 876  01d4 a601          	ld	a,#1
 877  01d6 6b01          	ld	(OFST-2,sp),a
 879  01d8 2002          	jra	L353
 880  01da               L153:
 881                     ; 552     status = ERROR;
 883  01da 0f01          	clr	(OFST-2,sp)
 884  01dc               L353:
 885                     ; 556   RTC->WPR = 0xFF; 
 887  01dc 35ff5159      	mov	20825,#255
 888                     ; 558   return (ErrorStatus)status;
 890  01e0 7b01          	ld	a,(OFST-2,sp)
 893  01e2 5b03          	addw	sp,#3
 894  01e4 81            	ret
 929                     ; 568 void RTC_RatioCmd(FunctionalState NewState)
 929                     ; 569 {
 930                     	switch	.text
 931  01e5               _RTC_RatioCmd:
 935                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
 937                     ; 574   RTC->WPR = 0xCA;
 939  01e5 35ca5159      	mov	20825,#202
 940                     ; 575   RTC->WPR = 0x53;
 942  01e9 35535159      	mov	20825,#83
 943                     ; 577   if (NewState != DISABLE)
 945  01ed 4d            	tnz	a
 946  01ee 2706          	jreq	L373
 947                     ; 580     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 949  01f0 721a5148      	bset	20808,#5
 951  01f4 2004          	jra	L573
 952  01f6               L373:
 953                     ; 585     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 955  01f6 721b5148      	bres	20808,#5
 956  01fa               L573:
 957                     ; 589   RTC->WPR = 0xFF; 
 959  01fa 35ff5159      	mov	20825,#255
 960                     ; 590 }
 963  01fe 81            	ret
 999                     ; 598 void RTC_BypassShadowCmd(FunctionalState NewState)
 999                     ; 599 {
1000                     	switch	.text
1001  01ff               _RTC_BypassShadowCmd:
1005                     ; 601   assert_param(IS_FUNCTIONAL_STATE(NewState));
1007                     ; 604   RTC->WPR = 0xCA;
1009  01ff 35ca5159      	mov	20825,#202
1010                     ; 605   RTC->WPR = 0x53;
1012  0203 35535159      	mov	20825,#83
1013                     ; 607   if (NewState != DISABLE)
1015  0207 4d            	tnz	a
1016  0208 2706          	jreq	L514
1017                     ; 610     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
1019  020a 72185148      	bset	20808,#4
1021  020e 2004          	jra	L714
1022  0210               L514:
1023                     ; 615     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
1025  0210 72195148      	bres	20808,#4
1026  0214               L714:
1027                     ; 619   RTC->WPR = 0xFF; 
1029  0214 35ff5159      	mov	20825,#255
1030                     ; 620 }
1033  0218 81            	ret
1181                     ; 659 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1181                     ; 660                         RTC_TimeTypeDef* RTC_TimeStruct)
1181                     ; 661 {
1182                     	switch	.text
1183  0219               _RTC_SetTime:
1185  0219 88            	push	a
1186  021a 88            	push	a
1187       00000001      OFST:	set	1
1190                     ; 662   ErrorStatus status = ERROR;
1192                     ; 663   uint8_t temp = 0;
1194                     ; 666   assert_param(IS_RTC_FORMAT(RTC_Format));
1196                     ; 668   if (RTC_Format == RTC_Format_BIN)
1198  021b 4d            	tnz	a
1199  021c 2609          	jrne	L315
1200                     ; 671     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1202  021e c65148        	ld	a,20808
1203  0221 a540          	bcp	a,#64
1204  0223 2700          	jreq	L515
1205                     ; 673       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1207                     ; 674       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1210  0225               L515:
1211                     ; 678       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1213                     ; 680     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1215                     ; 681     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1218  0225 2007          	jra	L125
1219  0227               L315:
1220                     ; 686     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1222  0227 c65148        	ld	a,20808
1223  022a a540          	bcp	a,#64
1224  022c 2700          	jreq	L325
1225                     ; 688       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1227                     ; 689       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1230  022e               L325:
1231                     ; 693       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1233                     ; 695     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1235                     ; 696     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1237  022e               L125:
1238                     ; 701   RTC->WPR = 0xCA;
1240  022e 35ca5159      	mov	20825,#202
1241                     ; 702   RTC->WPR = 0x53;
1243  0232 35535159      	mov	20825,#83
1244                     ; 705   if (RTC_EnterInitMode() == ERROR)
1246  0236 cd0161        	call	_RTC_EnterInitMode
1248  0239 4d            	tnz	a
1249  023a 2608          	jrne	L725
1250                     ; 707     status = ERROR;
1252  023c 0f01          	clr	(OFST+0,sp)
1253                     ; 709     RTC->WPR = 0xFF; 
1255  023e 35ff5159      	mov	20825,#255
1257  0242 2072          	jra	L135
1258  0244               L725:
1259                     ; 714     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1261  0244 c65148        	ld	a,20808
1262  0247 a540          	bcp	a,#64
1263  0249 2708          	jreq	L335
1264                     ; 716       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1266                     ; 717       temp = RTC_TimeStruct->RTC_H12;
1268  024b 1e05          	ldw	x,(OFST+4,sp)
1269  024d e603          	ld	a,(3,x)
1270  024f 6b01          	ld	(OFST+0,sp),a
1272  0251 2002          	jra	L535
1273  0253               L335:
1274                     ; 721       temp = 0;
1276  0253 0f01          	clr	(OFST+0,sp)
1277  0255               L535:
1278                     ; 724     if (RTC_Format != RTC_Format_BIN)
1280  0255 0d02          	tnz	(OFST+1,sp)
1281  0257 2718          	jreq	L735
1282                     ; 726       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1284  0259 1e05          	ldw	x,(OFST+4,sp)
1285  025b e602          	ld	a,(2,x)
1286  025d c75140        	ld	20800,a
1287                     ; 727       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1289  0260 1e05          	ldw	x,(OFST+4,sp)
1290  0262 e601          	ld	a,(1,x)
1291  0264 c75141        	ld	20801,a
1292                     ; 728       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1294  0267 1e05          	ldw	x,(OFST+4,sp)
1295  0269 f6            	ld	a,(x)
1296  026a 1a01          	or	a,(OFST+0,sp)
1297  026c c75142        	ld	20802,a
1299  026f 201f          	jra	L145
1300  0271               L735:
1301                     ; 732       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1303  0271 1e05          	ldw	x,(OFST+4,sp)
1304  0273 e602          	ld	a,(2,x)
1305  0275 cd0994        	call	L3_ByteToBcd2
1307  0278 c75140        	ld	20800,a
1308                     ; 733       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1310  027b 1e05          	ldw	x,(OFST+4,sp)
1311  027d e601          	ld	a,(1,x)
1312  027f cd0994        	call	L3_ByteToBcd2
1314  0282 c75141        	ld	20801,a
1315                     ; 734       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1317  0285 1e05          	ldw	x,(OFST+4,sp)
1318  0287 f6            	ld	a,(x)
1319  0288 cd0994        	call	L3_ByteToBcd2
1321  028b 1a01          	or	a,(OFST+0,sp)
1322  028d c75142        	ld	20802,a
1323  0290               L145:
1324                     ; 737     (void)(RTC->DR3);
1326  0290 c65146        	ld	a,20806
1327                     ; 740     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1329  0293 721f514c      	bres	20812,#7
1330                     ; 743     RTC->WPR = 0xFF; 
1332  0297 35ff5159      	mov	20825,#255
1333                     ; 746     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1335  029b c65148        	ld	a,20808
1336  029e a510          	bcp	a,#16
1337  02a0 2610          	jrne	L345
1338                     ; 748       if (RTC_WaitForSynchro() == ERROR)
1340  02a2 cd01a1        	call	_RTC_WaitForSynchro
1342  02a5 4d            	tnz	a
1343  02a6 2604          	jrne	L545
1344                     ; 750         status = ERROR;
1346  02a8 0f01          	clr	(OFST+0,sp)
1348  02aa 200a          	jra	L135
1349  02ac               L545:
1350                     ; 754         status = SUCCESS;
1352  02ac a601          	ld	a,#1
1353  02ae 6b01          	ld	(OFST+0,sp),a
1354  02b0 2004          	jra	L135
1355  02b2               L345:
1356                     ; 759       status = SUCCESS;
1358  02b2 a601          	ld	a,#1
1359  02b4 6b01          	ld	(OFST+0,sp),a
1360  02b6               L135:
1361                     ; 763   return (ErrorStatus)status;
1363  02b6 7b01          	ld	a,(OFST+0,sp)
1366  02b8 85            	popw	x
1367  02b9 81            	ret
1404                     ; 775 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
1404                     ; 776 {
1405                     	switch	.text
1406  02ba               _RTC_TimeStructInit:
1410                     ; 778   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
1412  02ba 6f03          	clr	(3,x)
1413                     ; 779   RTC_TimeStruct->RTC_Hours = 0;
1415  02bc 7f            	clr	(x)
1416                     ; 780   RTC_TimeStruct->RTC_Minutes = 0;
1418  02bd 6f01          	clr	(1,x)
1419                     ; 781   RTC_TimeStruct->RTC_Seconds = 0;
1421  02bf 6f02          	clr	(2,x)
1422                     ; 782 }
1425  02c1 81            	ret
1482                     ; 798 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
1482                     ; 799                  RTC_TimeTypeDef* RTC_TimeStruct)
1482                     ; 800 {
1483                     	switch	.text
1484  02c2               _RTC_GetTime:
1486  02c2 88            	push	a
1487  02c3 88            	push	a
1488       00000001      OFST:	set	1
1491                     ; 801   uint8_t  tmpreg = 0;
1493                     ; 804   assert_param(IS_RTC_FORMAT(RTC_Format));
1495                     ; 808   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
1497  02c4 1e05          	ldw	x,(OFST+4,sp)
1498  02c6 c65140        	ld	a,20800
1499  02c9 e702          	ld	(2,x),a
1500                     ; 811   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
1502  02cb 1e05          	ldw	x,(OFST+4,sp)
1503  02cd c65141        	ld	a,20801
1504  02d0 e701          	ld	(1,x),a
1505                     ; 814   tmpreg = (uint8_t)RTC->TR3;
1507  02d2 c65142        	ld	a,20802
1508  02d5 6b01          	ld	(OFST+0,sp),a
1509                     ; 817   (void) (RTC->DR3) ;
1511  02d7 c65146        	ld	a,20806
1512                     ; 821   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1514  02da 7b01          	ld	a,(OFST+0,sp)
1515  02dc a4bf          	and	a,#191
1516  02de 1e05          	ldw	x,(OFST+4,sp)
1517  02e0 f7            	ld	(x),a
1518                     ; 824   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1520  02e1 7b01          	ld	a,(OFST+0,sp)
1521  02e3 a440          	and	a,#64
1522  02e5 1e05          	ldw	x,(OFST+4,sp)
1523  02e7 e703          	ld	(3,x),a
1524                     ; 827   if (RTC_Format == RTC_Format_BIN)
1526  02e9 0d02          	tnz	(OFST+1,sp)
1527  02eb 261f          	jrne	L326
1528                     ; 830     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
1530  02ed 1e05          	ldw	x,(OFST+4,sp)
1531  02ef f6            	ld	a,(x)
1532  02f0 cd09b3        	call	L5_Bcd2ToByte
1534  02f3 1e05          	ldw	x,(OFST+4,sp)
1535  02f5 f7            	ld	(x),a
1536                     ; 831     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
1538  02f6 1e05          	ldw	x,(OFST+4,sp)
1539  02f8 e601          	ld	a,(1,x)
1540  02fa cd09b3        	call	L5_Bcd2ToByte
1542  02fd 1e05          	ldw	x,(OFST+4,sp)
1543  02ff e701          	ld	(1,x),a
1544                     ; 832     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
1546  0301 1e05          	ldw	x,(OFST+4,sp)
1547  0303 e602          	ld	a,(2,x)
1548  0305 cd09b3        	call	L5_Bcd2ToByte
1550  0308 1e05          	ldw	x,(OFST+4,sp)
1551  030a e702          	ld	(2,x),a
1552  030c               L326:
1553                     ; 834 }
1556  030c 85            	popw	x
1557  030d 81            	ret
1609                     ; 845 uint16_t RTC_GetSubSecond(void)
1609                     ; 846 {
1610                     	switch	.text
1611  030e               _RTC_GetSubSecond:
1613  030e 5206          	subw	sp,#6
1614       00000006      OFST:	set	6
1617                     ; 847   uint8_t ssrhreg = 0, ssrlreg = 0;
1621                     ; 848   uint16_t ssrreg = 0;
1623                     ; 851   ssrhreg = RTC->SSRH;
1625  0310 c65157        	ld	a,20823
1626  0313 6b03          	ld	(OFST-3,sp),a
1627                     ; 852   ssrlreg = RTC->SSRL;
1629  0315 c65158        	ld	a,20824
1630  0318 6b04          	ld	(OFST-2,sp),a
1631                     ; 855   (void) (RTC->DR3);
1633  031a c65146        	ld	a,20806
1634                     ; 858   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
1636  031d 7b04          	ld	a,(OFST-2,sp)
1637  031f 5f            	clrw	x
1638  0320 97            	ld	xl,a
1639  0321 1f01          	ldw	(OFST-5,sp),x
1640  0323 7b03          	ld	a,(OFST-3,sp)
1641  0325 5f            	clrw	x
1642  0326 97            	ld	xl,a
1643  0327 4f            	clr	a
1644  0328 02            	rlwa	x,a
1645  0329 01            	rrwa	x,a
1646  032a 1a02          	or	a,(OFST-4,sp)
1647  032c 01            	rrwa	x,a
1648  032d 1a01          	or	a,(OFST-5,sp)
1649  032f 01            	rrwa	x,a
1650  0330 1f05          	ldw	(OFST-1,sp),x
1651                     ; 859   return (uint16_t)(ssrreg);
1653  0332 1e05          	ldw	x,(OFST-1,sp)
1656  0334 5b06          	addw	sp,#6
1657  0336 81            	ret
1909                     ; 876 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
1909                     ; 877                         RTC_DateTypeDef* RTC_DateStruct)
1909                     ; 878 {
1910                     	switch	.text
1911  0337               _RTC_SetDate:
1913  0337 88            	push	a
1914  0338 89            	pushw	x
1915       00000002      OFST:	set	2
1918                     ; 879   ErrorStatus status = ERROR;
1920                     ; 881   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
1922  0339 4d            	tnz	a
1923  033a 2616          	jrne	L1001
1925  033c 1e06          	ldw	x,(OFST+4,sp)
1926  033e e601          	ld	a,(1,x)
1927  0340 a410          	and	a,#16
1928  0342 a110          	cp	a,#16
1929  0344 260c          	jrne	L1001
1930                     ; 883     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
1932  0346 1e06          	ldw	x,(OFST+4,sp)
1933  0348 e601          	ld	a,(1,x)
1934  034a a4ef          	and	a,#239
1935  034c ab0a          	add	a,#10
1936  034e 1e06          	ldw	x,(OFST+4,sp)
1937  0350 e701          	ld	(1,x),a
1938  0352               L1001:
1939                     ; 887   assert_param(IS_RTC_FORMAT(RTC_Format));
1941                     ; 888   if (RTC_Format == RTC_Format_BIN)
1943  0352 0d03          	tnz	(OFST+1,sp)
1944  0354 2600          	jrne	L3001
1945                     ; 890     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
1947                     ; 891     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
1949                     ; 892     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
1951                     ; 893     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
1953                     ; 894     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
1956  0356               L3001:
1957                     ; 898     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
1959                     ; 899     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1961                     ; 900     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1963                     ; 901     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1965                     ; 902     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1967                     ; 904   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
1969                     ; 907   RTC->WPR = 0xCA;
1971  0356 35ca5159      	mov	20825,#202
1972                     ; 908   RTC->WPR = 0x53;
1974  035a 35535159      	mov	20825,#83
1975                     ; 911   if (RTC_EnterInitMode() == ERROR)
1977  035e cd0161        	call	_RTC_EnterInitMode
1979  0361 4d            	tnz	a
1980  0362 2608          	jrne	L7001
1981                     ; 913     status = ERROR;
1983  0364 0f02          	clr	(OFST+0,sp)
1984                     ; 915     RTC->WPR = 0xFF; 
1986  0366 35ff5159      	mov	20825,#255
1988  036a 2073          	jra	L1101
1989  036c               L7001:
1990                     ; 919     (void)(RTC->TR1);
1992  036c c65140        	ld	a,20800
1993                     ; 922     if (RTC_Format != RTC_Format_BIN)
1995  036f 0d03          	tnz	(OFST+1,sp)
1996  0371 271f          	jreq	L3101
1997                     ; 924       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
1999  0373 1e06          	ldw	x,(OFST+4,sp)
2000  0375 e602          	ld	a,(2,x)
2001  0377 c75144        	ld	20804,a
2002                     ; 925       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2004  037a 1e06          	ldw	x,(OFST+4,sp)
2005  037c f6            	ld	a,(x)
2006  037d 97            	ld	xl,a
2007  037e a620          	ld	a,#32
2008  0380 42            	mul	x,a
2009  0381 9f            	ld	a,xl
2010  0382 1e06          	ldw	x,(OFST+4,sp)
2011  0384 ea01          	or	a,(1,x)
2012  0386 c75145        	ld	20805,a
2013                     ; 926       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
2015  0389 1e06          	ldw	x,(OFST+4,sp)
2016  038b e603          	ld	a,(3,x)
2017  038d c75146        	ld	20806,a
2019  0390 202a          	jra	L5101
2020  0392               L3101:
2021                     ; 930       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
2023  0392 1e06          	ldw	x,(OFST+4,sp)
2024  0394 e602          	ld	a,(2,x)
2025  0396 cd0994        	call	L3_ByteToBcd2
2027  0399 c75144        	ld	20804,a
2028                     ; 931       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2030  039c 1e06          	ldw	x,(OFST+4,sp)
2031  039e f6            	ld	a,(x)
2032  039f 97            	ld	xl,a
2033  03a0 a620          	ld	a,#32
2034  03a2 42            	mul	x,a
2035  03a3 9f            	ld	a,xl
2036  03a4 6b01          	ld	(OFST-1,sp),a
2037  03a6 1e06          	ldw	x,(OFST+4,sp)
2038  03a8 e601          	ld	a,(1,x)
2039  03aa cd0994        	call	L3_ByteToBcd2
2041  03ad 1a01          	or	a,(OFST-1,sp)
2042  03af c75145        	ld	20805,a
2043                     ; 932       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
2045  03b2 1e06          	ldw	x,(OFST+4,sp)
2046  03b4 e603          	ld	a,(3,x)
2047  03b6 cd0994        	call	L3_ByteToBcd2
2049  03b9 c75146        	ld	20806,a
2050  03bc               L5101:
2051                     ; 936     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
2053  03bc 721f514c      	bres	20812,#7
2054                     ; 939     RTC->WPR = 0xFF; 
2056  03c0 35ff5159      	mov	20825,#255
2057                     ; 942     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
2059  03c4 c65148        	ld	a,20808
2060  03c7 a510          	bcp	a,#16
2061  03c9 2610          	jrne	L7101
2062                     ; 944       if (RTC_WaitForSynchro() == ERROR)
2064  03cb cd01a1        	call	_RTC_WaitForSynchro
2066  03ce 4d            	tnz	a
2067  03cf 2604          	jrne	L1201
2068                     ; 946         status = ERROR;
2070  03d1 0f02          	clr	(OFST+0,sp)
2072  03d3 200a          	jra	L1101
2073  03d5               L1201:
2074                     ; 950         status = SUCCESS;
2076  03d5 a601          	ld	a,#1
2077  03d7 6b02          	ld	(OFST+0,sp),a
2078  03d9 2004          	jra	L1101
2079  03db               L7101:
2080                     ; 955       status = SUCCESS;
2082  03db a601          	ld	a,#1
2083  03dd 6b02          	ld	(OFST+0,sp),a
2084  03df               L1101:
2085                     ; 959   return (ErrorStatus)status;
2087  03df 7b02          	ld	a,(OFST+0,sp)
2090  03e1 5b03          	addw	sp,#3
2091  03e3 81            	ret
2128                     ; 968 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
2128                     ; 969 {
2129                     	switch	.text
2130  03e4               _RTC_DateStructInit:
2134                     ; 971   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
2136  03e4 a601          	ld	a,#1
2137  03e6 f7            	ld	(x),a
2138                     ; 972   RTC_DateStruct->RTC_Date = 1;
2140  03e7 a601          	ld	a,#1
2141  03e9 e702          	ld	(2,x),a
2142                     ; 973   RTC_DateStruct->RTC_Month = RTC_Month_January;
2144  03eb a601          	ld	a,#1
2145  03ed e701          	ld	(1,x),a
2146                     ; 974   RTC_DateStruct->RTC_Year = 0;
2148  03ef 6f03          	clr	(3,x)
2149                     ; 975 }
2152  03f1 81            	ret
2209                     ; 988 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2209                     ; 989                  RTC_DateTypeDef* RTC_DateStruct)
2209                     ; 990 {
2210                     	switch	.text
2211  03f2               _RTC_GetDate:
2213  03f2 88            	push	a
2214  03f3 88            	push	a
2215       00000001      OFST:	set	1
2218                     ; 991   uint8_t tmpreg = 0;
2220                     ; 994   assert_param(IS_RTC_FORMAT(RTC_Format));
2222                     ; 997   (void) (RTC->TR1) ;
2224  03f4 c65140        	ld	a,20800
2225                     ; 998   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2227  03f7 1e05          	ldw	x,(OFST+4,sp)
2228  03f9 c65144        	ld	a,20804
2229  03fc e702          	ld	(2,x),a
2230                     ; 999   tmpreg = (uint8_t)RTC->DR2;
2232  03fe c65145        	ld	a,20805
2233  0401 6b01          	ld	(OFST+0,sp),a
2234                     ; 1000   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2236  0403 1e05          	ldw	x,(OFST+4,sp)
2237  0405 c65146        	ld	a,20806
2238  0408 e703          	ld	(3,x),a
2239                     ; 1003   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2241  040a 7b01          	ld	a,(OFST+0,sp)
2242  040c a41f          	and	a,#31
2243  040e 1e05          	ldw	x,(OFST+4,sp)
2244  0410 e701          	ld	(1,x),a
2245                     ; 1004   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2247  0412 7b01          	ld	a,(OFST+0,sp)
2248  0414 a4e0          	and	a,#224
2249  0416 4e            	swap	a
2250  0417 44            	srl	a
2251  0418 a407          	and	a,#7
2252  041a 1e05          	ldw	x,(OFST+4,sp)
2253  041c f7            	ld	(x),a
2254                     ; 1007   if (RTC_Format == RTC_Format_BIN)
2256  041d 0d02          	tnz	(OFST+1,sp)
2257  041f 2621          	jrne	L7701
2258                     ; 1010     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2260  0421 1e05          	ldw	x,(OFST+4,sp)
2261  0423 e603          	ld	a,(3,x)
2262  0425 cd09b3        	call	L5_Bcd2ToByte
2264  0428 1e05          	ldw	x,(OFST+4,sp)
2265  042a e703          	ld	(3,x),a
2266                     ; 1011     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2268  042c 1e05          	ldw	x,(OFST+4,sp)
2269  042e e601          	ld	a,(1,x)
2270  0430 cd09b3        	call	L5_Bcd2ToByte
2272  0433 1e05          	ldw	x,(OFST+4,sp)
2273  0435 e701          	ld	(1,x),a
2274                     ; 1012     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2276  0437 1e05          	ldw	x,(OFST+4,sp)
2277  0439 e602          	ld	a,(2,x)
2278  043b cd09b3        	call	L5_Bcd2ToByte
2280  043e 1e05          	ldw	x,(OFST+4,sp)
2281  0440 e702          	ld	(2,x),a
2282  0442               L7701:
2283                     ; 1014 }
2286  0442 85            	popw	x
2287  0443 81            	ret
2436                     ; 1044 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2436                     ; 1045                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2436                     ; 1046 {
2437                     	switch	.text
2438  0444               _RTC_SetAlarm:
2440  0444 88            	push	a
2441  0445 5205          	subw	sp,#5
2442       00000005      OFST:	set	5
2445                     ; 1047   uint8_t tmpreg1 = 0;
2447                     ; 1048   uint8_t tmpreg2 = 0;
2449                     ; 1049   uint8_t tmpreg3 = 0;
2451                     ; 1050   uint8_t tmpreg4 = 0;
2453                     ; 1053   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
2455                     ; 1054   assert_param(IS_RTC_FORMAT(RTC_Format));
2457                     ; 1055   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
2459                     ; 1056   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
2461                     ; 1059   if (RTC_Format == RTC_Format_BIN)
2463  0447 4d            	tnz	a
2464  0448 2609          	jrne	L5711
2465                     ; 1062     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2467  044a c65148        	ld	a,20808
2468  044d a540          	bcp	a,#64
2469  044f 2700          	jreq	L7711
2470                     ; 1064       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2472                     ; 1065       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2475  0451               L7711:
2476                     ; 1069       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2478                     ; 1071     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
2480                     ; 1072     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
2483  0451 2007          	jra	L3021
2484  0453               L5711:
2485                     ; 1077     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2487  0453 c65148        	ld	a,20808
2488  0456 a540          	bcp	a,#64
2489  0458 2700          	jreq	L5021
2490                     ; 1079       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2492                     ; 1080       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2495  045a               L5021:
2496                     ; 1084       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2498                     ; 1087     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
2500                     ; 1089     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
2502  045a               L3021:
2503                     ; 1094   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
2505  045a 1e09          	ldw	x,(OFST+4,sp)
2506  045c e604          	ld	a,(4,x)
2507  045e a510          	bcp	a,#16
2508  0460 2608          	jrne	L1121
2509                     ; 1096     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
2511  0462 1e09          	ldw	x,(OFST+4,sp)
2512  0464 e605          	ld	a,(5,x)
2513  0466 a140          	cp	a,#64
2514  0468 2600          	jrne	L3121
2515                     ; 1098       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2518  046a               L3121:
2519                     ; 1102       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2521                     ; 1103       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2523  046a               L1121:
2524                     ; 1108   RTC->WPR = 0xCA;
2526  046a 35ca5159      	mov	20825,#202
2527                     ; 1109   RTC->WPR = 0x53;
2529  046e 35535159      	mov	20825,#83
2530                     ; 1113   if (RTC_Format != RTC_Format_BIN)
2532  0472 0d06          	tnz	(OFST+1,sp)
2533  0474 2747          	jreq	L7121
2534                     ; 1115     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
2534                     ; 1116                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
2536  0476 1e09          	ldw	x,(OFST+4,sp)
2537  0478 e604          	ld	a,(4,x)
2538  047a a480          	and	a,#128
2539  047c 1e09          	ldw	x,(OFST+4,sp)
2540  047e ea02          	or	a,(2,x)
2541  0480 6b02          	ld	(OFST-3,sp),a
2542                     ; 1118     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
2542                     ; 1119                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2544  0482 1e09          	ldw	x,(OFST+4,sp)
2545  0484 e604          	ld	a,(4,x)
2546  0486 48            	sll	a
2547  0487 a480          	and	a,#128
2548  0489 1e09          	ldw	x,(OFST+4,sp)
2549  048b ea01          	or	a,(1,x)
2550  048d 6b03          	ld	(OFST-2,sp),a
2551                     ; 1121     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
2551                     ; 1122                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2551                     ; 1123                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2553  048f 1e09          	ldw	x,(OFST+4,sp)
2554  0491 e604          	ld	a,(4,x)
2555  0493 48            	sll	a
2556  0494 48            	sll	a
2557  0495 a480          	and	a,#128
2558  0497 6b01          	ld	(OFST-4,sp),a
2559  0499 1e09          	ldw	x,(OFST+4,sp)
2560  049b e603          	ld	a,(3,x)
2561  049d 1e09          	ldw	x,(OFST+4,sp)
2562  049f fa            	or	a,(x)
2563  04a0 1a01          	or	a,(OFST-4,sp)
2564  04a2 6b04          	ld	(OFST-1,sp),a
2565                     ; 1125     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
2565                     ; 1126                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2565                     ; 1127                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
2567  04a4 1e09          	ldw	x,(OFST+4,sp)
2568  04a6 e604          	ld	a,(4,x)
2569  04a8 48            	sll	a
2570  04a9 48            	sll	a
2571  04aa 48            	sll	a
2572  04ab a480          	and	a,#128
2573  04ad 6b01          	ld	(OFST-4,sp),a
2574  04af 1e09          	ldw	x,(OFST+4,sp)
2575  04b1 e605          	ld	a,(5,x)
2576  04b3 1e09          	ldw	x,(OFST+4,sp)
2577  04b5 ea06          	or	a,(6,x)
2578  04b7 1a01          	or	a,(OFST-4,sp)
2579  04b9 6b05          	ld	(OFST+0,sp),a
2581  04bb 2059          	jra	L1221
2582  04bd               L7121:
2583                     ; 1132     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
2583                     ; 1133                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
2585  04bd 1e09          	ldw	x,(OFST+4,sp)
2586  04bf e604          	ld	a,(4,x)
2587  04c1 a480          	and	a,#128
2588  04c3 6b01          	ld	(OFST-4,sp),a
2589  04c5 1e09          	ldw	x,(OFST+4,sp)
2590  04c7 e602          	ld	a,(2,x)
2591  04c9 cd0994        	call	L3_ByteToBcd2
2593  04cc 1a01          	or	a,(OFST-4,sp)
2594  04ce 6b02          	ld	(OFST-3,sp),a
2595                     ; 1135     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
2595                     ; 1136                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2597  04d0 1e09          	ldw	x,(OFST+4,sp)
2598  04d2 e604          	ld	a,(4,x)
2599  04d4 48            	sll	a
2600  04d5 a480          	and	a,#128
2601  04d7 6b01          	ld	(OFST-4,sp),a
2602  04d9 1e09          	ldw	x,(OFST+4,sp)
2603  04db e601          	ld	a,(1,x)
2604  04dd cd0994        	call	L3_ByteToBcd2
2606  04e0 1a01          	or	a,(OFST-4,sp)
2607  04e2 6b03          	ld	(OFST-2,sp),a
2608                     ; 1138     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
2608                     ; 1139                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2608                     ; 1140                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2610  04e4 1e09          	ldw	x,(OFST+4,sp)
2611  04e6 e604          	ld	a,(4,x)
2612  04e8 48            	sll	a
2613  04e9 48            	sll	a
2614  04ea a480          	and	a,#128
2615  04ec 6b01          	ld	(OFST-4,sp),a
2616  04ee 1e09          	ldw	x,(OFST+4,sp)
2617  04f0 f6            	ld	a,(x)
2618  04f1 cd0994        	call	L3_ByteToBcd2
2620  04f4 1e09          	ldw	x,(OFST+4,sp)
2621  04f6 ea03          	or	a,(3,x)
2622  04f8 1a01          	or	a,(OFST-4,sp)
2623  04fa 6b04          	ld	(OFST-1,sp),a
2624                     ; 1142     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
2624                     ; 1143                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2624                     ; 1144                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
2626  04fc 1e09          	ldw	x,(OFST+4,sp)
2627  04fe e604          	ld	a,(4,x)
2628  0500 48            	sll	a
2629  0501 48            	sll	a
2630  0502 48            	sll	a
2631  0503 a480          	and	a,#128
2632  0505 6b01          	ld	(OFST-4,sp),a
2633  0507 1e09          	ldw	x,(OFST+4,sp)
2634  0509 e606          	ld	a,(6,x)
2635  050b cd0994        	call	L3_ByteToBcd2
2637  050e 1e09          	ldw	x,(OFST+4,sp)
2638  0510 ea05          	or	a,(5,x)
2639  0512 1a01          	or	a,(OFST-4,sp)
2640  0514 6b05          	ld	(OFST+0,sp),a
2641  0516               L1221:
2642                     ; 1148   RTC->ALRMAR1 = tmpreg1;
2644  0516 7b02          	ld	a,(OFST-3,sp)
2645  0518 c7515c        	ld	20828,a
2646                     ; 1149   RTC->ALRMAR2 = tmpreg2;
2648  051b 7b03          	ld	a,(OFST-2,sp)
2649  051d c7515d        	ld	20829,a
2650                     ; 1150   RTC->ALRMAR3 = tmpreg3;
2652  0520 7b04          	ld	a,(OFST-1,sp)
2653  0522 c7515e        	ld	20830,a
2654                     ; 1151   RTC->ALRMAR4 = tmpreg4;
2656  0525 7b05          	ld	a,(OFST+0,sp)
2657  0527 c7515f        	ld	20831,a
2658                     ; 1154   RTC->WPR = 0xFF; 
2660  052a 35ff5159      	mov	20825,#255
2661                     ; 1155 }
2664  052e 5b06          	addw	sp,#6
2665  0530 81            	ret
2703                     ; 1165 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
2703                     ; 1166 {
2704                     	switch	.text
2705  0531               _RTC_AlarmStructInit:
2709                     ; 1168   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
2711  0531 6f03          	clr	(3,x)
2712                     ; 1169   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
2714  0533 7f            	clr	(x)
2715                     ; 1170   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
2717  0534 6f01          	clr	(1,x)
2718                     ; 1171   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
2720  0536 6f02          	clr	(2,x)
2721                     ; 1174   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
2723  0538 6f05          	clr	(5,x)
2724                     ; 1175   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
2726  053a a601          	ld	a,#1
2727  053c e706          	ld	(6,x),a
2728                     ; 1178   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
2730  053e a6f0          	ld	a,#240
2731  0540 e704          	ld	(4,x),a
2732                     ; 1179 }
2735  0542 81            	ret
2828                     ; 1188 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
2828                     ; 1189                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2828                     ; 1190 {
2829                     	switch	.text
2830  0543               _RTC_GetAlarm:
2832  0543 88            	push	a
2833  0544 5204          	subw	sp,#4
2834       00000004      OFST:	set	4
2837                     ; 1191   uint8_t tmpreg1 = 0;
2839                     ; 1192   uint8_t tmpreg2 = 0;
2841                     ; 1193   uint8_t tmpreg3 = 0;
2843                     ; 1194   uint8_t tmpreg4 = 0;
2845                     ; 1195   uint8_t alarmmask = 0;
2847                     ; 1198   assert_param(IS_RTC_FORMAT(RTC_Format));
2849                     ; 1201   tmpreg1 = (uint8_t)RTC->ALRMAR1;
2851  0546 c6515c        	ld	a,20828
2852  0549 6b04          	ld	(OFST+0,sp),a
2853                     ; 1202   tmpreg2 = (uint8_t)RTC->ALRMAR2;
2855  054b c6515d        	ld	a,20829
2856  054e 6b01          	ld	(OFST-3,sp),a
2857                     ; 1203   tmpreg3 = (uint8_t)RTC->ALRMAR3;
2859  0550 c6515e        	ld	a,20830
2860  0553 6b02          	ld	(OFST-2,sp),a
2861                     ; 1204   tmpreg4 = (uint8_t)RTC->ALRMAR4;
2863  0555 c6515f        	ld	a,20831
2864  0558 6b03          	ld	(OFST-1,sp),a
2865                     ; 1207   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
2867  055a 7b04          	ld	a,(OFST+0,sp)
2868  055c a47f          	and	a,#127
2869  055e 1e08          	ldw	x,(OFST+4,sp)
2870  0560 e702          	ld	(2,x),a
2871                     ; 1208   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
2873  0562 7b04          	ld	a,(OFST+0,sp)
2874  0564 a480          	and	a,#128
2875  0566 6b04          	ld	(OFST+0,sp),a
2876                     ; 1211   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
2878  0568 7b01          	ld	a,(OFST-3,sp)
2879  056a a47f          	and	a,#127
2880  056c 1e08          	ldw	x,(OFST+4,sp)
2881  056e e701          	ld	(1,x),a
2882                     ; 1212   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
2884  0570 7b01          	ld	a,(OFST-3,sp)
2885  0572 a480          	and	a,#128
2886  0574 44            	srl	a
2887  0575 1a04          	or	a,(OFST+0,sp)
2888  0577 6b04          	ld	(OFST+0,sp),a
2889                     ; 1215   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
2891  0579 7b02          	ld	a,(OFST-2,sp)
2892  057b a43f          	and	a,#63
2893  057d 1e08          	ldw	x,(OFST+4,sp)
2894  057f f7            	ld	(x),a
2895                     ; 1216   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
2897  0580 7b02          	ld	a,(OFST-2,sp)
2898  0582 a440          	and	a,#64
2899  0584 1e08          	ldw	x,(OFST+4,sp)
2900  0586 e703          	ld	(3,x),a
2901                     ; 1217   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
2903  0588 7b02          	ld	a,(OFST-2,sp)
2904  058a a480          	and	a,#128
2905  058c 44            	srl	a
2906  058d 44            	srl	a
2907  058e 1a04          	or	a,(OFST+0,sp)
2908  0590 6b04          	ld	(OFST+0,sp),a
2909                     ; 1220   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
2911  0592 7b03          	ld	a,(OFST-1,sp)
2912  0594 a43f          	and	a,#63
2913  0596 1e08          	ldw	x,(OFST+4,sp)
2914  0598 e706          	ld	(6,x),a
2915                     ; 1221   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
2917  059a 7b03          	ld	a,(OFST-1,sp)
2918  059c a440          	and	a,#64
2919  059e 1e08          	ldw	x,(OFST+4,sp)
2920  05a0 e705          	ld	(5,x),a
2921                     ; 1222   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
2923  05a2 7b03          	ld	a,(OFST-1,sp)
2924  05a4 a480          	and	a,#128
2925  05a6 44            	srl	a
2926  05a7 44            	srl	a
2927  05a8 44            	srl	a
2928  05a9 1a04          	or	a,(OFST+0,sp)
2929  05ab 6b04          	ld	(OFST+0,sp),a
2930                     ; 1224   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
2932  05ad 7b04          	ld	a,(OFST+0,sp)
2933  05af 1e08          	ldw	x,(OFST+4,sp)
2934  05b1 e704          	ld	(4,x),a
2935                     ; 1226   if (RTC_Format == RTC_Format_BIN)
2937  05b3 0d05          	tnz	(OFST+1,sp)
2938  05b5 262a          	jrne	L3131
2939                     ; 1228     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
2941  05b7 1e08          	ldw	x,(OFST+4,sp)
2942  05b9 f6            	ld	a,(x)
2943  05ba cd09b3        	call	L5_Bcd2ToByte
2945  05bd 1e08          	ldw	x,(OFST+4,sp)
2946  05bf f7            	ld	(x),a
2947                     ; 1229     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
2949  05c0 1e08          	ldw	x,(OFST+4,sp)
2950  05c2 e601          	ld	a,(1,x)
2951  05c4 cd09b3        	call	L5_Bcd2ToByte
2953  05c7 1e08          	ldw	x,(OFST+4,sp)
2954  05c9 e701          	ld	(1,x),a
2955                     ; 1230     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
2957  05cb 1e08          	ldw	x,(OFST+4,sp)
2958  05cd e602          	ld	a,(2,x)
2959  05cf cd09b3        	call	L5_Bcd2ToByte
2961  05d2 1e08          	ldw	x,(OFST+4,sp)
2962  05d4 e702          	ld	(2,x),a
2963                     ; 1231     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
2965  05d6 1e08          	ldw	x,(OFST+4,sp)
2966  05d8 e606          	ld	a,(6,x)
2967  05da cd09b3        	call	L5_Bcd2ToByte
2969  05dd 1e08          	ldw	x,(OFST+4,sp)
2970  05df e706          	ld	(6,x),a
2971  05e1               L3131:
2972                     ; 1233 }
2975  05e1 5b05          	addw	sp,#5
2976  05e3 81            	ret
3040                     ; 1242 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
3040                     ; 1243 {
3041                     	switch	.text
3042  05e4               _RTC_AlarmCmd:
3044  05e4 5203          	subw	sp,#3
3045       00000003      OFST:	set	3
3048                     ; 1244   __IO uint16_t alrawfcount = 0;
3050  05e6 5f            	clrw	x
3051  05e7 1f01          	ldw	(OFST-2,sp),x
3052                     ; 1245   ErrorStatus status = ERROR;
3054                     ; 1246   uint8_t temp1 = 0;
3056                     ; 1249   assert_param(IS_FUNCTIONAL_STATE(NewState));
3058                     ; 1252   RTC->WPR = 0xCA;
3060  05e9 35ca5159      	mov	20825,#202
3061                     ; 1253   RTC->WPR = 0x53;
3063  05ed 35535159      	mov	20825,#83
3064                     ; 1256   if (NewState != DISABLE)
3066  05f1 4d            	tnz	a
3067  05f2 2711          	jreq	L7431
3068                     ; 1258     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
3070  05f4 72105149      	bset	20809,#0
3071                     ; 1259     status = SUCCESS;
3073  05f8 a601          	ld	a,#1
3074  05fa 6b03          	ld	(OFST+0,sp),a
3076  05fc               L1531:
3077                     ; 1283   RTC->WPR = 0xFF; 
3079  05fc 35ff5159      	mov	20825,#255
3080                     ; 1286   return (ErrorStatus)status;
3082  0600 7b03          	ld	a,(OFST+0,sp)
3085  0602 5b03          	addw	sp,#3
3086  0604 81            	ret
3087  0605               L7431:
3088                     ; 1263     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
3090  0605 72115149      	bres	20809,#0
3091                     ; 1266     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
3093  0609 c6514c        	ld	a,20812
3094  060c a401          	and	a,#1
3095  060e 6b03          	ld	(OFST+0,sp),a
3097  0610 2007          	jra	L7531
3098  0612               L3531:
3099                     ; 1269       alrawfcount++;
3101  0612 1e01          	ldw	x,(OFST-2,sp)
3102  0614 1c0001        	addw	x,#1
3103  0617 1f01          	ldw	(OFST-2,sp),x
3104  0619               L7531:
3105                     ; 1267     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
3107  0619 1e01          	ldw	x,(OFST-2,sp)
3108  061b a3ffff        	cpw	x,#65535
3109  061e 2704          	jreq	L3631
3111  0620 0d03          	tnz	(OFST+0,sp)
3112  0622 27ee          	jreq	L3531
3113  0624               L3631:
3114                     ; 1272     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
3116  0624 c6514c        	ld	a,20812
3117  0627 a501          	bcp	a,#1
3118  0629 2604          	jrne	L5631
3119                     ; 1274       status = ERROR;
3121  062b 0f03          	clr	(OFST+0,sp)
3123  062d 20cd          	jra	L1531
3124  062f               L5631:
3125                     ; 1278       status = SUCCESS;
3127  062f a601          	ld	a,#1
3128  0631 6b03          	ld	(OFST+0,sp),a
3129  0633 20c7          	jra	L1531
3330                     ; 1298 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
3330                     ; 1299                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
3330                     ; 1300 {
3331                     	switch	.text
3332  0635               _RTC_AlarmSubSecondConfig:
3334  0635 89            	pushw	x
3335  0636 88            	push	a
3336       00000001      OFST:	set	1
3339                     ; 1301   uint8_t alarmstatus = 0;
3341                     ; 1302   ErrorStatus status = ERROR;
3343                     ; 1305   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
3345                     ; 1306   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
3347                     ; 1309   RTC->WPR = 0xCA;
3349  0637 35ca5159      	mov	20825,#202
3350                     ; 1310   RTC->WPR = 0x53;
3352  063b 35535159      	mov	20825,#83
3353                     ; 1313   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
3355  063f c6514c        	ld	a,20812
3356  0642 a540          	bcp	a,#64
3357  0644 2626          	jrne	L7641
3358                     ; 1316     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
3360  0646 c65149        	ld	a,20809
3361  0649 aa01          	or	a,#1
3362  064b 6b01          	ld	(OFST+0,sp),a
3363                     ; 1319     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
3365  064d 72115149      	bres	20809,#0
3366                     ; 1322     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
3368  0651 9e            	ld	a,xh
3369  0652 c75164        	ld	20836,a
3370                     ; 1323     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
3372  0655 9f            	ld	a,xl
3373  0656 c75165        	ld	20837,a
3374                     ; 1324     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
3376  0659 7b06          	ld	a,(OFST+5,sp)
3377  065b c75166        	ld	20838,a
3378                     ; 1327     RTC->CR2 |= alarmstatus;
3380  065e c65149        	ld	a,20809
3381  0661 1a01          	or	a,(OFST+0,sp)
3382  0663 c75149        	ld	20809,a
3383                     ; 1329     status = SUCCESS;
3385  0666 a601          	ld	a,#1
3386  0668 6b01          	ld	(OFST+0,sp),a
3388  066a 2002          	jra	L1741
3389  066c               L7641:
3390                     ; 1333     status = ERROR;
3392  066c 0f01          	clr	(OFST+0,sp)
3393  066e               L1741:
3394                     ; 1337   RTC->WPR = 0xFF; 
3396  066e 35ff5159      	mov	20825,#255
3397                     ; 1339   return (ErrorStatus)status;
3399  0672 7b01          	ld	a,(OFST+0,sp)
3402  0674 5b03          	addw	sp,#3
3403  0676 81            	ret
3493                     ; 1369 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3493                     ; 1370 {
3494                     	switch	.text
3495  0677               _RTC_WakeUpClockConfig:
3497  0677 88            	push	a
3498       00000000      OFST:	set	0
3501                     ; 1373   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3503                     ; 1376   RTC->WPR = 0xCA;
3505  0678 35ca5159      	mov	20825,#202
3506                     ; 1377   RTC->WPR = 0x53;
3508  067c 35535159      	mov	20825,#83
3509                     ; 1380   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3511  0680 72155149      	bres	20809,#2
3512                     ; 1383   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3514  0684 c65148        	ld	a,20808
3515  0687 a4f8          	and	a,#248
3516  0689 c75148        	ld	20808,a
3517                     ; 1386   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3519  068c c65148        	ld	a,20808
3520  068f 1a01          	or	a,(OFST+1,sp)
3521  0691 c75148        	ld	20808,a
3522                     ; 1389   RTC->WPR = 0xFF; 
3524  0694 35ff5159      	mov	20825,#255
3525                     ; 1390 }
3528  0698 84            	pop	a
3529  0699 81            	ret
3564                     ; 1400 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3564                     ; 1401 {
3565                     	switch	.text
3566  069a               _RTC_SetWakeUpCounter:
3570                     ; 1403   RTC->WPR = 0xCA;
3572  069a 35ca5159      	mov	20825,#202
3573                     ; 1404   RTC->WPR = 0x53;
3575  069e 35535159      	mov	20825,#83
3576                     ; 1408   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3578  06a2 9e            	ld	a,xh
3579  06a3 c75154        	ld	20820,a
3580                     ; 1409   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3582  06a6 9f            	ld	a,xl
3583  06a7 c75155        	ld	20821,a
3584                     ; 1412   RTC->WPR = 0xFF; 
3586  06aa 35ff5159      	mov	20825,#255
3587                     ; 1413 }
3590  06ae 81            	ret
3625                     ; 1420 uint16_t RTC_GetWakeUpCounter(void)
3625                     ; 1421 {
3626                     	switch	.text
3627  06af               _RTC_GetWakeUpCounter:
3629  06af 89            	pushw	x
3630       00000002      OFST:	set	2
3633                     ; 1422   uint16_t tmpreg = 0;
3635                     ; 1425   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3637  06b0 c65154        	ld	a,20820
3638  06b3 5f            	clrw	x
3639  06b4 97            	ld	xl,a
3640  06b5 4f            	clr	a
3641  06b6 02            	rlwa	x,a
3642  06b7 1f01          	ldw	(OFST-1,sp),x
3643                     ; 1426   tmpreg |= RTC->WUTRL;
3645  06b9 c65155        	ld	a,20821
3646  06bc 5f            	clrw	x
3647  06bd 97            	ld	xl,a
3648  06be 01            	rrwa	x,a
3649  06bf 1a02          	or	a,(OFST+0,sp)
3650  06c1 01            	rrwa	x,a
3651  06c2 1a01          	or	a,(OFST-1,sp)
3652  06c4 01            	rrwa	x,a
3653  06c5 1f01          	ldw	(OFST-1,sp),x
3654                     ; 1429   return (uint16_t)tmpreg;
3656  06c7 1e01          	ldw	x,(OFST-1,sp)
3659  06c9 5b02          	addw	sp,#2
3660  06cb 81            	ret
3715                     ; 1440 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3715                     ; 1441 {
3716                     	switch	.text
3717  06cc               _RTC_WakeUpCmd:
3719  06cc 5203          	subw	sp,#3
3720       00000003      OFST:	set	3
3723                     ; 1442   ErrorStatus status = ERROR;
3725                     ; 1443   uint16_t wutwfcount = 0;
3727  06ce 5f            	clrw	x
3728  06cf 1f02          	ldw	(OFST-1,sp),x
3729                     ; 1446   assert_param(IS_FUNCTIONAL_STATE(NewState));
3731                     ; 1449   RTC->WPR = 0xCA;
3733  06d1 35ca5159      	mov	20825,#202
3734                     ; 1450   RTC->WPR = 0x53;
3736  06d5 35535159      	mov	20825,#83
3737                     ; 1452   if (NewState != DISABLE)
3739  06d9 4d            	tnz	a
3740  06da 2711          	jreq	L3161
3741                     ; 1455     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3743  06dc 72145149      	bset	20809,#2
3744                     ; 1457     status = SUCCESS;
3746  06e0 a601          	ld	a,#1
3747  06e2 6b01          	ld	(OFST-2,sp),a
3749  06e4               L5161:
3750                     ; 1482   RTC->WPR = 0xFF; 
3752  06e4 35ff5159      	mov	20825,#255
3753                     ; 1485   return (ErrorStatus)status;
3755  06e8 7b01          	ld	a,(OFST-2,sp)
3758  06ea 5b03          	addw	sp,#3
3759  06ec 81            	ret
3760  06ed               L3161:
3761                     ; 1462     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3763  06ed 72155149      	bres	20809,#2
3765  06f1 2007          	jra	L1261
3766  06f3               L7161:
3767                     ; 1467       wutwfcount++;
3769  06f3 1e02          	ldw	x,(OFST-1,sp)
3770  06f5 1c0001        	addw	x,#1
3771  06f8 1f02          	ldw	(OFST-1,sp),x
3772  06fa               L1261:
3773                     ; 1465     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
3775  06fa c6514c        	ld	a,20812
3776  06fd a504          	bcp	a,#4
3777  06ff 2607          	jrne	L5261
3779  0701 1e02          	ldw	x,(OFST-1,sp)
3780  0703 a3ffff        	cpw	x,#65535
3781  0706 26eb          	jrne	L7161
3782  0708               L5261:
3783                     ; 1471     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
3785  0708 c6514c        	ld	a,20812
3786  070b a504          	bcp	a,#4
3787  070d 2604          	jrne	L7261
3788                     ; 1473       status = ERROR;
3790  070f 0f01          	clr	(OFST-2,sp)
3792  0711 20d1          	jra	L5161
3793  0713               L7261:
3794                     ; 1477       status = SUCCESS;
3796  0713 a601          	ld	a,#1
3797  0715 6b01          	ld	(OFST-2,sp),a
3798  0717 20cb          	jra	L5161
3888                     ; 1522 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
3888                     ; 1523                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
3888                     ; 1524 {
3889                     	switch	.text
3890  0719               _RTC_DayLightSavingConfig:
3892  0719 89            	pushw	x
3893       00000000      OFST:	set	0
3896                     ; 1526   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
3898                     ; 1527   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
3900                     ; 1530   RTC->WPR = 0xCA;
3902  071a 35ca5159      	mov	20825,#202
3903                     ; 1531   RTC->WPR = 0x53;
3905  071e 35535159      	mov	20825,#83
3906                     ; 1534   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
3908  0722 7215514a      	bres	20810,#2
3909                     ; 1537   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
3911  0726 9f            	ld	a,xl
3912  0727 1a01          	or	a,(OFST+1,sp)
3913  0729 ca514a        	or	a,20810
3914  072c c7514a        	ld	20810,a
3915                     ; 1540   RTC->WPR = 0xFF; 
3917  072f 35ff5159      	mov	20825,#255
3918                     ; 1541 }
3921  0733 85            	popw	x
3922  0734 81            	ret
3947                     ; 1549 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
3947                     ; 1550 {
3948                     	switch	.text
3949  0735               _RTC_GetStoreOperation:
3953                     ; 1552   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
3955  0735 c6514a        	ld	a,20810
3956  0738 a404          	and	a,#4
3959  073a 81            	ret
4053                     ; 1587 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
4053                     ; 1588                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
4053                     ; 1589 {
4054                     	switch	.text
4055  073b               _RTC_OutputConfig:
4057  073b 89            	pushw	x
4058       00000000      OFST:	set	0
4061                     ; 1591   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
4063                     ; 1592   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
4065                     ; 1595   RTC->WPR = 0xCA;
4067  073c 35ca5159      	mov	20825,#202
4068                     ; 1596   RTC->WPR = 0x53;
4070  0740 35535159      	mov	20825,#83
4071                     ; 1599   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
4073  0744 c6514a        	ld	a,20810
4074  0747 a48f          	and	a,#143
4075  0749 c7514a        	ld	20810,a
4076                     ; 1602   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
4078  074c 9f            	ld	a,xl
4079  074d 1a01          	or	a,(OFST+1,sp)
4080  074f ca514a        	or	a,20810
4081  0752 c7514a        	ld	20810,a
4082                     ; 1605   RTC->WPR = 0xFF; 
4084  0755 35ff5159      	mov	20825,#255
4085                     ; 1606 }
4088  0759 85            	popw	x
4089  075a 81            	ret
4184                     ; 1639 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
4184                     ; 1640                                    uint16_t RTC_ShiftSubFS)
4184                     ; 1641 {
4185                     	switch	.text
4186  075b               _RTC_SynchroShiftConfig:
4188  075b 88            	push	a
4189  075c 5203          	subw	sp,#3
4190       00000003      OFST:	set	3
4193                     ; 1642   uint8_t shiftrhreg = 0;
4195                     ; 1643   ErrorStatus status = ERROR;
4197                     ; 1644   uint16_t shpfcount = 0;
4199  075e 5f            	clrw	x
4200  075f 1f02          	ldw	(OFST-1,sp),x
4201                     ; 1647   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
4203                     ; 1648   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
4205                     ; 1651   RTC->WPR = 0xCA;
4207  0761 35ca5159      	mov	20825,#202
4208                     ; 1652   RTC->WPR = 0x53;
4210  0765 35535159      	mov	20825,#83
4211                     ; 1655   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
4213  0769 c6514c        	ld	a,20812
4214  076c a508          	bcp	a,#8
4215  076e 2717          	jreq	L7102
4217  0770 2007          	jra	L3202
4218  0772               L1202:
4219                     ; 1660       shpfcount++;
4221  0772 1e02          	ldw	x,(OFST-1,sp)
4222  0774 1c0001        	addw	x,#1
4223  0777 1f02          	ldw	(OFST-1,sp),x
4224  0779               L3202:
4225                     ; 1658     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
4227  0779 c6514c        	ld	a,20812
4228  077c a508          	bcp	a,#8
4229  077e 2707          	jreq	L7102
4231  0780 1e02          	ldw	x,(OFST-1,sp)
4232  0782 a3ffff        	cpw	x,#65535
4233  0785 26eb          	jrne	L1202
4234  0787               L7102:
4235                     ; 1665   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
4237  0787 c6514c        	ld	a,20812
4238  078a a508          	bcp	a,#8
4239  078c 2616          	jrne	L1302
4240                     ; 1668     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
4242  078e 7b07          	ld	a,(OFST+4,sp)
4243  0790 1a04          	or	a,(OFST+1,sp)
4244  0792 6b01          	ld	(OFST-2,sp),a
4245                     ; 1669     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
4247  0794 7b01          	ld	a,(OFST-2,sp)
4248  0796 c7515a        	ld	20826,a
4249                     ; 1670     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
4251  0799 7b08          	ld	a,(OFST+5,sp)
4252  079b c7515b        	ld	20827,a
4253                     ; 1672     status = SUCCESS;
4255  079e a601          	ld	a,#1
4256  07a0 6b01          	ld	(OFST-2,sp),a
4258  07a2 2002          	jra	L3302
4259  07a4               L1302:
4260                     ; 1676     status = ERROR;
4262  07a4 0f01          	clr	(OFST-2,sp)
4263  07a6               L3302:
4264                     ; 1680   RTC->WPR = 0xFF; 
4266  07a6 35ff5159      	mov	20825,#255
4267                     ; 1682   return (ErrorStatus)(status);
4269  07aa 7b01          	ld	a,(OFST-2,sp)
4272  07ac 5b04          	addw	sp,#4
4273  07ae 81            	ret
4403                     ; 1718 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
4403                     ; 1719                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
4403                     ; 1720                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
4403                     ; 1721 {
4404                     	switch	.text
4405  07af               _RTC_SmoothCalibConfig:
4407  07af 89            	pushw	x
4408  07b0 5203          	subw	sp,#3
4409       00000003      OFST:	set	3
4412                     ; 1722   ErrorStatus status = ERROR;
4414                     ; 1723   uint16_t recalpfcount = 0;
4416  07b2 5f            	clrw	x
4417  07b3 1f02          	ldw	(OFST-1,sp),x
4418                     ; 1726   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
4420                     ; 1727   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
4422                     ; 1728   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
4424                     ; 1731   RTC->WPR = 0xCA;
4426  07b5 35ca5159      	mov	20825,#202
4427                     ; 1732   RTC->WPR = 0x53;
4429  07b9 35535159      	mov	20825,#83
4430                     ; 1735   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
4432  07bd c6514c        	ld	a,20812
4433  07c0 a502          	bcp	a,#2
4434  07c2 2717          	jreq	L5112
4436  07c4 2007          	jra	L1212
4437  07c6               L7112:
4438                     ; 1740       recalpfcount++;
4440  07c6 1e02          	ldw	x,(OFST-1,sp)
4441  07c8 1c0001        	addw	x,#1
4442  07cb 1f02          	ldw	(OFST-1,sp),x
4443  07cd               L1212:
4444                     ; 1738     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
4446  07cd c6514c        	ld	a,20812
4447  07d0 a502          	bcp	a,#2
4448  07d2 2707          	jreq	L5112
4450  07d4 1e02          	ldw	x,(OFST-1,sp)
4451  07d6 a3ffff        	cpw	x,#65535
4452  07d9 26eb          	jrne	L7112
4453  07db               L5112:
4454                     ; 1746   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
4456  07db c6514c        	ld	a,20812
4457  07de a502          	bcp	a,#2
4458  07e0 2614          	jrne	L7212
4459                     ; 1749     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
4459                     ; 1750                            (uint8_t)RTC_SmoothCalibPlusPulses) | \
4459                     ; 1751                            (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
4461  07e2 7b04          	ld	a,(OFST+1,sp)
4462  07e4 1a05          	or	a,(OFST+2,sp)
4463  07e6 1a08          	or	a,(OFST+5,sp)
4464  07e8 c7516a        	ld	20842,a
4465                     ; 1752     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
4467  07eb 7b09          	ld	a,(OFST+6,sp)
4468  07ed c7516b        	ld	20843,a
4469                     ; 1754     status = SUCCESS;
4471  07f0 a601          	ld	a,#1
4472  07f2 6b01          	ld	(OFST-2,sp),a
4474  07f4 2002          	jra	L1312
4475  07f6               L7212:
4476                     ; 1758     status = ERROR;
4478  07f6 0f01          	clr	(OFST-2,sp)
4479  07f8               L1312:
4480                     ; 1762   RTC->WPR = 0xFF; 
4482  07f8 35ff5159      	mov	20825,#255
4483                     ; 1764   return (ErrorStatus)(status);
4485  07fc 7b01          	ld	a,(OFST-2,sp)
4488  07fe 5b05          	addw	sp,#5
4489  0800 81            	ret
4547                     ; 1790 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
4547                     ; 1791 {
4548                     	switch	.text
4549  0801               _RTC_CalibOutputConfig:
4553                     ; 1793   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
4555                     ; 1796   RTC->WPR = 0xCA;
4557  0801 35ca5159      	mov	20825,#202
4558                     ; 1797   RTC->WPR = 0x53;
4560  0805 35535159      	mov	20825,#83
4561                     ; 1799   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
4563  0809 4d            	tnz	a
4564  080a 2706          	jreq	L1612
4565                     ; 1802     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
4567  080c 7216514a      	bset	20810,#3
4569  0810 2004          	jra	L3612
4570  0812               L1612:
4571                     ; 1807     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
4573  0812 7217514a      	bres	20810,#3
4574  0816               L3612:
4575                     ; 1811   RTC->WPR = 0xFF; 
4577  0816 35ff5159      	mov	20825,#255
4578                     ; 1812 }
4581  081a 81            	ret
4616                     ; 1820 void RTC_CalibOutputCmd(FunctionalState NewState)
4616                     ; 1821 {
4617                     	switch	.text
4618  081b               _RTC_CalibOutputCmd:
4622                     ; 1823   assert_param(IS_FUNCTIONAL_STATE(NewState));
4624                     ; 1826   RTC->WPR = 0xCA;
4626  081b 35ca5159      	mov	20825,#202
4627                     ; 1827   RTC->WPR = 0x53;
4629  081f 35535159      	mov	20825,#83
4630                     ; 1829   if (NewState != DISABLE)
4632  0823 4d            	tnz	a
4633  0824 2706          	jreq	L3022
4634                     ; 1832     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
4636  0826 721e514a      	bset	20810,#7
4638  082a 2004          	jra	L5022
4639  082c               L3022:
4640                     ; 1837     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
4642  082c 721f514a      	bres	20810,#7
4643  0830               L5022:
4644                     ; 1841   RTC->WPR = 0xFF; 
4646  0830 35ff5159      	mov	20825,#255
4647                     ; 1842 }
4650  0834 81            	ret
4745                     ; 1871 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4745                     ; 1872                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4745                     ; 1873 {
4746                     	switch	.text
4747  0835               _RTC_TamperLevelConfig:
4749  0835 89            	pushw	x
4750       00000000      OFST:	set	0
4753                     ; 1875   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4755                     ; 1876   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4757                     ; 1879   RTC->WPR = 0xCA;
4759  0836 35ca5159      	mov	20825,#202
4760                     ; 1880   RTC->WPR = 0x53;
4762  083a 35535159      	mov	20825,#83
4763                     ; 1882   if (RTC_TamperLevel != RTC_TamperLevel_Low)
4765  083e 9f            	ld	a,xl
4766  083f 4d            	tnz	a
4767  0840 270a          	jreq	L3522
4768                     ; 1885     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4770  0842 9e            	ld	a,xh
4771  0843 48            	sll	a
4772  0844 ca516c        	or	a,20844
4773  0847 c7516c        	ld	20844,a
4775  084a 200a          	jra	L5522
4776  084c               L3522:
4777                     ; 1890     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4779  084c 7b01          	ld	a,(OFST+1,sp)
4780  084e 48            	sll	a
4781  084f 43            	cpl	a
4782  0850 c4516c        	and	a,20844
4783  0853 c7516c        	ld	20844,a
4784  0856               L5522:
4785                     ; 1894   RTC->WPR = 0xFF; 
4787  0856 35ff5159      	mov	20825,#255
4788                     ; 1895 }
4791  085a 85            	popw	x
4792  085b 81            	ret
4866                     ; 1903 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4866                     ; 1904 {
4867                     	switch	.text
4868  085c               _RTC_TamperFilterConfig:
4870  085c 88            	push	a
4871       00000000      OFST:	set	0
4874                     ; 1907   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4876                     ; 1910   RTC->WPR = 0xCA;
4878  085d 35ca5159      	mov	20825,#202
4879                     ; 1911   RTC->WPR = 0x53;
4881  0861 35535159      	mov	20825,#83
4882                     ; 1914   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4884  0865 c6516d        	ld	a,20845
4885  0868 a4e7          	and	a,#231
4886  086a c7516d        	ld	20845,a
4887                     ; 1917   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4889  086d c6516d        	ld	a,20845
4890  0870 1a01          	or	a,(OFST+1,sp)
4891  0872 c7516d        	ld	20845,a
4892                     ; 1920   RTC->WPR = 0xFF; 
4894  0875 35ff5159      	mov	20825,#255
4895                     ; 1922 }
4898  0879 84            	pop	a
4899  087a 81            	ret
5012                     ; 1931 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
5012                     ; 1932 {
5013                     	switch	.text
5014  087b               _RTC_TamperSamplingFreqConfig:
5016  087b 88            	push	a
5017       00000000      OFST:	set	0
5020                     ; 1934   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
5022                     ; 1937   RTC->WPR = 0xCA;
5024  087c 35ca5159      	mov	20825,#202
5025                     ; 1938   RTC->WPR = 0x53;
5027  0880 35535159      	mov	20825,#83
5028                     ; 1941   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
5030  0884 c6516d        	ld	a,20845
5031  0887 a4f8          	and	a,#248
5032  0889 c7516d        	ld	20845,a
5033                     ; 1944   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
5035  088c c6516d        	ld	a,20845
5036  088f 1a01          	or	a,(OFST+1,sp)
5037  0891 c7516d        	ld	20845,a
5038                     ; 1947   RTC->WPR = 0xFF; 
5040  0894 35ff5159      	mov	20825,#255
5041                     ; 1948 }
5044  0898 84            	pop	a
5045  0899 81            	ret
5128                     ; 1958 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
5128                     ; 1959 {
5129                     	switch	.text
5130  089a               _RTC_TamperPinsPrechargeDuration:
5132  089a 88            	push	a
5133       00000000      OFST:	set	0
5136                     ; 1961   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
5138                     ; 1964   RTC->WPR = 0xCA;
5140  089b 35ca5159      	mov	20825,#202
5141                     ; 1965   RTC->WPR = 0x53;
5143  089f 35535159      	mov	20825,#83
5144                     ; 1968   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
5146  08a3 c6516d        	ld	a,20845
5147  08a6 a41f          	and	a,#31
5148  08a8 c7516d        	ld	20845,a
5149                     ; 1971   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
5151  08ab c6516d        	ld	a,20845
5152  08ae 1a01          	or	a,(OFST+1,sp)
5153  08b0 c7516d        	ld	20845,a
5154                     ; 1974   RTC->WPR = 0xFF; 
5156  08b3 35ff5159      	mov	20825,#255
5157                     ; 1975 }
5160  08b7 84            	pop	a
5161  08b8 81            	ret
5206                     ; 1987 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
5206                     ; 1988                    FunctionalState NewState)
5206                     ; 1989 {
5207                     	switch	.text
5208  08b9               _RTC_TamperCmd:
5210  08b9 89            	pushw	x
5211       00000000      OFST:	set	0
5214                     ; 1992   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
5216                     ; 1993   assert_param(IS_FUNCTIONAL_STATE(NewState));
5218                     ; 1996   RTC->WPR = 0xCA;
5220  08ba 35ca5159      	mov	20825,#202
5221                     ; 1997   RTC->WPR = 0x53;
5223  08be 35535159      	mov	20825,#83
5224                     ; 2000   if (NewState != DISABLE)
5226  08c2 9f            	ld	a,xl
5227  08c3 4d            	tnz	a
5228  08c4 2709          	jreq	L1342
5229                     ; 2003     RTC->TCR1 |= (uint8_t)RTC_Tamper;
5231  08c6 9e            	ld	a,xh
5232  08c7 ca516c        	or	a,20844
5233  08ca c7516c        	ld	20844,a
5235  08cd 2009          	jra	L3342
5236  08cf               L1342:
5237                     ; 2008     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
5239  08cf 7b01          	ld	a,(OFST+1,sp)
5240  08d1 43            	cpl	a
5241  08d2 c4516c        	and	a,20844
5242  08d5 c7516c        	ld	20844,a
5243  08d8               L3342:
5244                     ; 2013   RTC->WPR = 0xFF; 
5246  08d8 35ff5159      	mov	20825,#255
5247                     ; 2014 }
5250  08dc 85            	popw	x
5251  08dd 81            	ret
5323                     ; 2058 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
5323                     ; 2059 {
5324                     	switch	.text
5325  08de               _RTC_ITConfig:
5327  08de 89            	pushw	x
5328       00000000      OFST:	set	0
5331                     ; 2061   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
5333                     ; 2062   assert_param(IS_FUNCTIONAL_STATE(NewState));
5335                     ; 2065   RTC->WPR = 0xCA;
5337  08df 35ca5159      	mov	20825,#202
5338                     ; 2066   RTC->WPR = 0x53;
5340  08e3 35535159      	mov	20825,#83
5341                     ; 2068   if (NewState != DISABLE)
5343  08e7 0d05          	tnz	(OFST+5,sp)
5344  08e9 2715          	jreq	L1742
5345                     ; 2071     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5347  08eb 9f            	ld	a,xl
5348  08ec a4f0          	and	a,#240
5349  08ee ca5149        	or	a,20809
5350  08f1 c75149        	ld	20809,a
5351                     ; 2072     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
5353  08f4 7b02          	ld	a,(OFST+2,sp)
5354  08f6 a401          	and	a,#1
5355  08f8 ca516c        	or	a,20844
5356  08fb c7516c        	ld	20844,a
5358  08fe 2016          	jra	L3742
5359  0900               L1742:
5360                     ; 2077     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5362  0900 7b02          	ld	a,(OFST+2,sp)
5363  0902 a4f0          	and	a,#240
5364  0904 43            	cpl	a
5365  0905 c45149        	and	a,20809
5366  0908 c75149        	ld	20809,a
5367                     ; 2078     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
5369  090b 7b02          	ld	a,(OFST+2,sp)
5370  090d a401          	and	a,#1
5371  090f 43            	cpl	a
5372  0910 c4516c        	and	a,20844
5373  0913 c7516c        	ld	20844,a
5374  0916               L3742:
5375                     ; 2082   RTC->WPR = 0xFF; 
5377  0916 35ff5159      	mov	20825,#255
5378                     ; 2083 }
5381  091a 85            	popw	x
5382  091b 81            	ret
5556                     ; 2090 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5556                     ; 2091 {
5557                     	switch	.text
5558  091c               _RTC_GetFlagStatus:
5560  091c 89            	pushw	x
5561  091d 5203          	subw	sp,#3
5562       00000003      OFST:	set	3
5565                     ; 2092   FlagStatus flagstatus = RESET;
5567                     ; 2093   uint16_t tmpreg1 = 0;
5569                     ; 2094   uint16_t tmpreg2 = 0;
5571                     ; 2097   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5573                     ; 2100   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5575  091f c6514c        	ld	a,20812
5576  0922 5f            	clrw	x
5577  0923 97            	ld	xl,a
5578  0924 4f            	clr	a
5579  0925 02            	rlwa	x,a
5580  0926 1f02          	ldw	(OFST-1,sp),x
5581                     ; 2101   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5583  0928 c6514d        	ld	a,20813
5584  092b 5f            	clrw	x
5585  092c 97            	ld	xl,a
5586  092d 01            	rrwa	x,a
5587  092e 1a03          	or	a,(OFST+0,sp)
5588  0930 01            	rrwa	x,a
5589  0931 1a02          	or	a,(OFST-1,sp)
5590  0933 01            	rrwa	x,a
5591  0934 1f02          	ldw	(OFST-1,sp),x
5592                     ; 2104   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
5594  0936 1e02          	ldw	x,(OFST-1,sp)
5595  0938 01            	rrwa	x,a
5596  0939 1405          	and	a,(OFST+2,sp)
5597  093b 01            	rrwa	x,a
5598  093c 1404          	and	a,(OFST+1,sp)
5599  093e 01            	rrwa	x,a
5600  093f a30000        	cpw	x,#0
5601  0942 2706          	jreq	L3752
5602                     ; 2106     flagstatus = SET;
5604  0944 a601          	ld	a,#1
5605  0946 6b01          	ld	(OFST-2,sp),a
5607  0948 2002          	jra	L5752
5608  094a               L3752:
5609                     ; 2110     flagstatus = RESET;
5611  094a 0f01          	clr	(OFST-2,sp)
5612  094c               L5752:
5613                     ; 2112   return (FlagStatus)flagstatus;
5615  094c 7b01          	ld	a,(OFST-2,sp)
5618  094e 5b05          	addw	sp,#5
5619  0950 81            	ret
5654                     ; 2122 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5654                     ; 2123 {
5655                     	switch	.text
5656  0951               _RTC_ClearFlag:
5658  0951 89            	pushw	x
5659       00000000      OFST:	set	0
5662                     ; 2125   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5664                     ; 2128   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5666  0952 9f            	ld	a,xl
5667  0953 43            	cpl	a
5668  0954 c7514d        	ld	20813,a
5669                     ; 2129   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5671  0957 7b01          	ld	a,(OFST+1,sp)
5672  0959 43            	cpl	a
5673  095a a47f          	and	a,#127
5674  095c c7514c        	ld	20812,a
5675                     ; 2130 }
5678  095f 85            	popw	x
5679  0960 81            	ret
5743                     ; 2138 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5743                     ; 2139 {
5744                     	switch	.text
5745  0961               _RTC_GetITStatus:
5747  0961 89            	pushw	x
5748  0962 89            	pushw	x
5749       00000002      OFST:	set	2
5752                     ; 2140   ITStatus itstatus = RESET;
5754                     ; 2141   uint8_t enablestatus = 0, tmpreg = 0;
5758                     ; 2144   assert_param(IS_RTC_GET_IT(RTC_IT));
5760                     ; 2147   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5762  0963 9f            	ld	a,xl
5763  0964 c45149        	and	a,20809
5764  0967 6b01          	ld	(OFST-1,sp),a
5765                     ; 2150   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5767  0969 1e03          	ldw	x,(OFST+1,sp)
5768  096b 54            	srlw	x
5769  096c 54            	srlw	x
5770  096d 54            	srlw	x
5771  096e 54            	srlw	x
5772  096f 9f            	ld	a,xl
5773  0970 c4514d        	and	a,20813
5774  0973 6b02          	ld	(OFST+0,sp),a
5775                     ; 2153   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
5777  0975 0d01          	tnz	(OFST-1,sp)
5778  0977 270a          	jreq	L7462
5780  0979 0d02          	tnz	(OFST+0,sp)
5781  097b 2706          	jreq	L7462
5782                     ; 2155     itstatus = SET;
5784  097d a601          	ld	a,#1
5785  097f 6b02          	ld	(OFST+0,sp),a
5787  0981 2002          	jra	L1562
5788  0983               L7462:
5789                     ; 2159     itstatus = RESET;
5791  0983 0f02          	clr	(OFST+0,sp)
5792  0985               L1562:
5793                     ; 2162   return (ITStatus)itstatus;
5795  0985 7b02          	ld	a,(OFST+0,sp)
5798  0987 5b04          	addw	sp,#4
5799  0989 81            	ret
5835                     ; 2172 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
5835                     ; 2173 {
5836                     	switch	.text
5837  098a               _RTC_ClearITPendingBit:
5841                     ; 2175   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
5843                     ; 2178   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
5845  098a 54            	srlw	x
5846  098b 54            	srlw	x
5847  098c 54            	srlw	x
5848  098d 54            	srlw	x
5849  098e 9f            	ld	a,xl
5850  098f 43            	cpl	a
5851  0990 c7514d        	ld	20813,a
5852                     ; 2179 }
5855  0993 81            	ret
5898                     ; 2202 static uint8_t ByteToBcd2(uint8_t Value)
5898                     ; 2203 {
5899                     	switch	.text
5900  0994               L3_ByteToBcd2:
5902  0994 88            	push	a
5903  0995 88            	push	a
5904       00000001      OFST:	set	1
5907                     ; 2204   uint8_t bcdhigh = 0;
5909  0996 0f01          	clr	(OFST+0,sp)
5911  0998 2008          	jra	L7172
5912  099a               L3172:
5913                     ; 2208     bcdhigh++;
5915  099a 0c01          	inc	(OFST+0,sp)
5916                     ; 2209     Value -= 10;
5918  099c 7b02          	ld	a,(OFST+1,sp)
5919  099e a00a          	sub	a,#10
5920  09a0 6b02          	ld	(OFST+1,sp),a
5921  09a2               L7172:
5922                     ; 2206   while (Value >= 10)
5924  09a2 7b02          	ld	a,(OFST+1,sp)
5925  09a4 a10a          	cp	a,#10
5926  09a6 24f2          	jruge	L3172
5927                     ; 2212   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
5929  09a8 7b01          	ld	a,(OFST+0,sp)
5930  09aa 97            	ld	xl,a
5931  09ab a610          	ld	a,#16
5932  09ad 42            	mul	x,a
5933  09ae 9f            	ld	a,xl
5934  09af 1a02          	or	a,(OFST+1,sp)
5937  09b1 85            	popw	x
5938  09b2 81            	ret
5981                     ; 2220 static uint8_t Bcd2ToByte(uint8_t Value)
5981                     ; 2221 {
5982                     	switch	.text
5983  09b3               L5_Bcd2ToByte:
5985  09b3 88            	push	a
5986  09b4 88            	push	a
5987       00000001      OFST:	set	1
5990                     ; 2222   uint8_t tmp = 0;
5992                     ; 2224   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
5994  09b5 a4f0          	and	a,#240
5995  09b7 4e            	swap	a
5996  09b8 a40f          	and	a,#15
5997  09ba 97            	ld	xl,a
5998  09bb a60a          	ld	a,#10
5999  09bd 42            	mul	x,a
6000  09be 9f            	ld	a,xl
6001  09bf 6b01          	ld	(OFST+0,sp),a
6002                     ; 2226   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
6004  09c1 7b02          	ld	a,(OFST+1,sp)
6005  09c3 a40f          	and	a,#15
6006  09c5 1b01          	add	a,(OFST+0,sp)
6009  09c7 85            	popw	x
6010  09c8 81            	ret
6023                     	xdef	_RTC_ClearITPendingBit
6024                     	xdef	_RTC_GetITStatus
6025                     	xdef	_RTC_ClearFlag
6026                     	xdef	_RTC_GetFlagStatus
6027                     	xdef	_RTC_ITConfig
6028                     	xdef	_RTC_TamperCmd
6029                     	xdef	_RTC_TamperPinsPrechargeDuration
6030                     	xdef	_RTC_TamperSamplingFreqConfig
6031                     	xdef	_RTC_TamperFilterConfig
6032                     	xdef	_RTC_TamperLevelConfig
6033                     	xdef	_RTC_CalibOutputCmd
6034                     	xdef	_RTC_CalibOutputConfig
6035                     	xdef	_RTC_SmoothCalibConfig
6036                     	xdef	_RTC_SynchroShiftConfig
6037                     	xdef	_RTC_OutputConfig
6038                     	xdef	_RTC_GetStoreOperation
6039                     	xdef	_RTC_DayLightSavingConfig
6040                     	xdef	_RTC_WakeUpCmd
6041                     	xdef	_RTC_GetWakeUpCounter
6042                     	xdef	_RTC_SetWakeUpCounter
6043                     	xdef	_RTC_WakeUpClockConfig
6044                     	xdef	_RTC_AlarmSubSecondConfig
6045                     	xdef	_RTC_AlarmCmd
6046                     	xdef	_RTC_GetAlarm
6047                     	xdef	_RTC_AlarmStructInit
6048                     	xdef	_RTC_SetAlarm
6049                     	xdef	_RTC_GetDate
6050                     	xdef	_RTC_DateStructInit
6051                     	xdef	_RTC_SetDate
6052                     	xdef	_RTC_GetSubSecond
6053                     	xdef	_RTC_GetTime
6054                     	xdef	_RTC_TimeStructInit
6055                     	xdef	_RTC_SetTime
6056                     	xdef	_RTC_BypassShadowCmd
6057                     	xdef	_RTC_RatioCmd
6058                     	xdef	_RTC_WaitForSynchro
6059                     	xdef	_RTC_ExitInitMode
6060                     	xdef	_RTC_EnterInitMode
6061                     	xdef	_RTC_WriteProtectionCmd
6062                     	xdef	_RTC_StructInit
6063                     	xdef	_RTC_Init
6064                     	xdef	_RTC_DeInit
6083                     	end
