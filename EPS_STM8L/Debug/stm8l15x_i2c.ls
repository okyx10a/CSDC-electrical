   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
 199                     ; 141 void I2C_DeInit(I2C_TypeDef* I2Cx)
 199                     ; 142 {
 201                     	switch	.text
 202  0000               _I2C_DeInit:
 206                     ; 143   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 208  0000 7f            	clr	(x)
 209                     ; 144   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 211  0001 6f01          	clr	(1,x)
 212                     ; 145   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 214  0003 6f02          	clr	(2,x)
 215                     ; 146   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 217  0005 6f03          	clr	(3,x)
 218                     ; 147   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 220  0007 6f04          	clr	(4,x)
 221                     ; 148   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 223  0009 6f05          	clr	(5,x)
 224                     ; 149   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 226  000b 6f0a          	clr	(10,x)
 227                     ; 150   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 229  000d 6f0b          	clr	(11,x)
 230                     ; 151   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 232  000f 6f0c          	clr	(12,x)
 233                     ; 152   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 235  0011 a602          	ld	a,#2
 236  0013 e70d          	ld	(13,x),a
 237                     ; 153 }
 240  0015 81            	ret
 464                     .const:	section	.text
 465  0000               L01:
 466  0000 000f4240      	dc.l	1000000
 467  0004               L21:
 468  0004 000186a1      	dc.l	100001
 469  0008               L41:
 470  0008 00000004      	dc.l	4
 471                     ; 184 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 471                     ; 185               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 471                     ; 186               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 471                     ; 187 {
 472                     	switch	.text
 473  0016               _I2C_Init:
 475  0016 89            	pushw	x
 476  0017 520c          	subw	sp,#12
 477       0000000c      OFST:	set	12
 480                     ; 188   uint32_t result = 0x0004;
 482                     ; 189   uint16_t tmpval = 0;
 484                     ; 190   uint8_t tmpccrh = 0;
 486  0019 0f07          	clr	(OFST-5,sp)
 487                     ; 191   uint8_t input_clock = 0;
 489                     ; 194   assert_param(IS_I2C_MODE(I2C_Mode));
 491                     ; 195   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 493                     ; 196   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 495                     ; 197   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 497                     ; 198   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 499                     ; 199   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 501                     ; 203   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 503  001b cd0000        	call	_CLK_GetClockFreq
 505  001e ae0000        	ldw	x,#L01
 506  0021 cd0000        	call	c_ludv
 508  0024 b603          	ld	a,c_lreg+3
 509  0026 6b08          	ld	(OFST-4,sp),a
 510                     ; 207   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 512  0028 1e0d          	ldw	x,(OFST+1,sp)
 513  002a e602          	ld	a,(2,x)
 514  002c a4c0          	and	a,#192
 515  002e e702          	ld	(2,x),a
 516                     ; 209   I2Cx->FREQR |= input_clock;
 518  0030 1e0d          	ldw	x,(OFST+1,sp)
 519  0032 e602          	ld	a,(2,x)
 520  0034 1a08          	or	a,(OFST-4,sp)
 521  0036 e702          	ld	(2,x),a
 522                     ; 213   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 524  0038 1e0d          	ldw	x,(OFST+1,sp)
 525  003a f6            	ld	a,(x)
 526  003b a4fe          	and	a,#254
 527  003d f7            	ld	(x),a
 528                     ; 216   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 530  003e 1e0d          	ldw	x,(OFST+1,sp)
 531  0040 e60c          	ld	a,(12,x)
 532  0042 a430          	and	a,#48
 533  0044 e70c          	ld	(12,x),a
 534                     ; 217   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 536  0046 1e0d          	ldw	x,(OFST+1,sp)
 537  0048 6f0b          	clr	(11,x)
 538                     ; 220   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 540  004a 96            	ldw	x,sp
 541  004b 1c0011        	addw	x,#OFST+5
 542  004e cd0000        	call	c_ltor
 544  0051 ae0004        	ldw	x,#L21
 545  0054 cd0000        	call	c_lcmp
 547  0057 2403          	jruge	L61
 548  0059 cc00f7        	jp	L362
 549  005c               L61:
 550                     ; 223     tmpccrh = I2C_CCRH_FS;
 552  005c a680          	ld	a,#128
 553  005e 6b07          	ld	(OFST-5,sp),a
 554                     ; 225     if (I2C_DutyCycle == I2C_DutyCycle_2)
 556  0060 0d18          	tnz	(OFST+12,sp)
 557  0062 2633          	jrne	L562
 558                     ; 228       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 560  0064 96            	ldw	x,sp
 561  0065 1c0011        	addw	x,#OFST+5
 562  0068 cd0000        	call	c_ltor
 564  006b a603          	ld	a,#3
 565  006d cd0000        	call	c_smul
 567  0070 96            	ldw	x,sp
 568  0071 1c0001        	addw	x,#OFST-11
 569  0074 cd0000        	call	c_rtol
 571  0077 7b08          	ld	a,(OFST-4,sp)
 572  0079 b703          	ld	c_lreg+3,a
 573  007b 3f02          	clr	c_lreg+2
 574  007d 3f01          	clr	c_lreg+1
 575  007f 3f00          	clr	c_lreg
 576  0081 ae0000        	ldw	x,#L01
 577  0084 cd0000        	call	c_lmul
 579  0087 96            	ldw	x,sp
 580  0088 1c0001        	addw	x,#OFST-11
 581  008b cd0000        	call	c_ludv
 583  008e 96            	ldw	x,sp
 584  008f 1c0009        	addw	x,#OFST-3
 585  0092 cd0000        	call	c_rtol
 588  0095 2037          	jra	L762
 589  0097               L562:
 590                     ; 233       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 592  0097 96            	ldw	x,sp
 593  0098 1c0011        	addw	x,#OFST+5
 594  009b cd0000        	call	c_ltor
 596  009e a619          	ld	a,#25
 597  00a0 cd0000        	call	c_smul
 599  00a3 96            	ldw	x,sp
 600  00a4 1c0001        	addw	x,#OFST-11
 601  00a7 cd0000        	call	c_rtol
 603  00aa 7b08          	ld	a,(OFST-4,sp)
 604  00ac b703          	ld	c_lreg+3,a
 605  00ae 3f02          	clr	c_lreg+2
 606  00b0 3f01          	clr	c_lreg+1
 607  00b2 3f00          	clr	c_lreg
 608  00b4 ae0000        	ldw	x,#L01
 609  00b7 cd0000        	call	c_lmul
 611  00ba 96            	ldw	x,sp
 612  00bb 1c0001        	addw	x,#OFST-11
 613  00be cd0000        	call	c_ludv
 615  00c1 96            	ldw	x,sp
 616  00c2 1c0009        	addw	x,#OFST-3
 617  00c5 cd0000        	call	c_rtol
 619                     ; 235       tmpccrh |= I2C_CCRH_DUTY;
 621  00c8 7b07          	ld	a,(OFST-5,sp)
 622  00ca aa40          	or	a,#64
 623  00cc 6b07          	ld	(OFST-5,sp),a
 624  00ce               L762:
 625                     ; 239     if (result < (uint16_t)0x01)
 627  00ce 96            	ldw	x,sp
 628  00cf 1c0009        	addw	x,#OFST-3
 629  00d2 cd0000        	call	c_lzmp
 631  00d5 260a          	jrne	L172
 632                     ; 242       result = (uint16_t)0x0001;
 634  00d7 ae0001        	ldw	x,#1
 635  00da 1f0b          	ldw	(OFST-1,sp),x
 636  00dc ae0000        	ldw	x,#0
 637  00df 1f09          	ldw	(OFST-3,sp),x
 638  00e1               L172:
 639                     ; 248     tmpval = ((input_clock * 3) / 10) + 1;
 641  00e1 7b08          	ld	a,(OFST-4,sp)
 642  00e3 97            	ld	xl,a
 643  00e4 a603          	ld	a,#3
 644  00e6 42            	mul	x,a
 645  00e7 a60a          	ld	a,#10
 646  00e9 cd0000        	call	c_sdivx
 648  00ec 5c            	incw	x
 649  00ed 1f05          	ldw	(OFST-7,sp),x
 650                     ; 249     I2Cx->TRISER = (uint8_t)tmpval;
 652  00ef 7b06          	ld	a,(OFST-6,sp)
 653  00f1 1e0d          	ldw	x,(OFST+1,sp)
 654  00f3 e70d          	ld	(13,x),a
 656  00f5 205c          	jra	L372
 657  00f7               L362:
 658                     ; 256     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 660  00f7 96            	ldw	x,sp
 661  00f8 1c0011        	addw	x,#OFST+5
 662  00fb cd0000        	call	c_ltor
 664  00fe 3803          	sll	c_lreg+3
 665  0100 3902          	rlc	c_lreg+2
 666  0102 3901          	rlc	c_lreg+1
 667  0104 3900          	rlc	c_lreg
 668  0106 96            	ldw	x,sp
 669  0107 1c0001        	addw	x,#OFST-11
 670  010a cd0000        	call	c_rtol
 672  010d 7b08          	ld	a,(OFST-4,sp)
 673  010f b703          	ld	c_lreg+3,a
 674  0111 3f02          	clr	c_lreg+2
 675  0113 3f01          	clr	c_lreg+1
 676  0115 3f00          	clr	c_lreg
 677  0117 ae0000        	ldw	x,#L01
 678  011a cd0000        	call	c_lmul
 680  011d 96            	ldw	x,sp
 681  011e 1c0001        	addw	x,#OFST-11
 682  0121 cd0000        	call	c_ludv
 684  0124 b602          	ld	a,c_lreg+2
 685  0126 97            	ld	xl,a
 686  0127 b603          	ld	a,c_lreg+3
 687  0129 cd0000        	call	c_uitol
 689  012c 96            	ldw	x,sp
 690  012d 1c0009        	addw	x,#OFST-3
 691  0130 cd0000        	call	c_rtol
 693                     ; 259     if (result < (uint16_t)0x0004)
 695  0133 96            	ldw	x,sp
 696  0134 1c0009        	addw	x,#OFST-3
 697  0137 cd0000        	call	c_ltor
 699  013a ae0008        	ldw	x,#L41
 700  013d cd0000        	call	c_lcmp
 702  0140 240a          	jruge	L572
 703                     ; 262       result = (uint16_t)0x0004;
 705  0142 ae0004        	ldw	x,#4
 706  0145 1f0b          	ldw	(OFST-1,sp),x
 707  0147 ae0000        	ldw	x,#0
 708  014a 1f09          	ldw	(OFST-3,sp),x
 709  014c               L572:
 710                     ; 268     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 712  014c 7b08          	ld	a,(OFST-4,sp)
 713  014e 4c            	inc	a
 714  014f 1e0d          	ldw	x,(OFST+1,sp)
 715  0151 e70d          	ld	(13,x),a
 716  0153               L372:
 717                     ; 273   I2Cx->CCRL = (uint8_t)result;
 719  0153 7b0c          	ld	a,(OFST+0,sp)
 720  0155 1e0d          	ldw	x,(OFST+1,sp)
 721  0157 e70b          	ld	(11,x),a
 722                     ; 274   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 724  0159 7b07          	ld	a,(OFST-5,sp)
 725  015b 1e0d          	ldw	x,(OFST+1,sp)
 726  015d e70c          	ld	(12,x),a
 727                     ; 277   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 729  015f 1e0d          	ldw	x,(OFST+1,sp)
 730  0161 7b17          	ld	a,(OFST+11,sp)
 731  0163 aa01          	or	a,#1
 732  0165 fa            	or	a,(x)
 733  0166 f7            	ld	(x),a
 734                     ; 280   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 736  0167 1e0d          	ldw	x,(OFST+1,sp)
 737  0169 e601          	ld	a,(1,x)
 738  016b 1a19          	or	a,(OFST+13,sp)
 739  016d e701          	ld	(1,x),a
 740                     ; 283   I2Cx->OARL = (uint8_t)(OwnAddress);
 742  016f 7b16          	ld	a,(OFST+10,sp)
 743  0171 1e0d          	ldw	x,(OFST+1,sp)
 744  0173 e703          	ld	(3,x),a
 745                     ; 284   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 745                     ; 285                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 747  0175 7b15          	ld	a,(OFST+9,sp)
 748  0177 97            	ld	xl,a
 749  0178 7b16          	ld	a,(OFST+10,sp)
 750  017a 9f            	ld	a,xl
 751  017b a403          	and	a,#3
 752  017d 97            	ld	xl,a
 753  017e 4f            	clr	a
 754  017f 02            	rlwa	x,a
 755  0180 4f            	clr	a
 756  0181 01            	rrwa	x,a
 757  0182 48            	sll	a
 758  0183 59            	rlcw	x
 759  0184 9f            	ld	a,xl
 760  0185 6b04          	ld	(OFST-8,sp),a
 761  0187 7b1a          	ld	a,(OFST+14,sp)
 762  0189 aa40          	or	a,#64
 763  018b 1a04          	or	a,(OFST-8,sp)
 764  018d 1e0d          	ldw	x,(OFST+1,sp)
 765  018f e704          	ld	(4,x),a
 766                     ; 286 }
 769  0191 5b0e          	addw	sp,#14
 770  0193 81            	ret
 837                     ; 295 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 837                     ; 296 {
 838                     	switch	.text
 839  0194               _I2C_Cmd:
 841  0194 89            	pushw	x
 842       00000000      OFST:	set	0
 845                     ; 299   assert_param(IS_FUNCTIONAL_STATE(NewState));
 847                     ; 301   if (NewState != DISABLE)
 849  0195 0d05          	tnz	(OFST+5,sp)
 850  0197 2706          	jreq	L333
 851                     ; 304     I2Cx->CR1 |= I2C_CR1_PE;
 853  0199 f6            	ld	a,(x)
 854  019a aa01          	or	a,#1
 855  019c f7            	ld	(x),a
 857  019d 2006          	jra	L533
 858  019f               L333:
 859                     ; 309     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 861  019f 1e01          	ldw	x,(OFST+1,sp)
 862  01a1 f6            	ld	a,(x)
 863  01a2 a4fe          	and	a,#254
 864  01a4 f7            	ld	(x),a
 865  01a5               L533:
 866                     ; 311 }
 869  01a5 85            	popw	x
 870  01a6 81            	ret
 917                     ; 320 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 917                     ; 321 {
 918                     	switch	.text
 919  01a7               _I2C_GeneralCallCmd:
 921  01a7 89            	pushw	x
 922       00000000      OFST:	set	0
 925                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 927                     ; 326   if (NewState != DISABLE)
 929  01a8 0d05          	tnz	(OFST+5,sp)
 930  01aa 2706          	jreq	L363
 931                     ; 329     I2Cx->CR1 |= I2C_CR1_ENGC;
 933  01ac f6            	ld	a,(x)
 934  01ad aa40          	or	a,#64
 935  01af f7            	ld	(x),a
 937  01b0 2006          	jra	L563
 938  01b2               L363:
 939                     ; 334     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 941  01b2 1e01          	ldw	x,(OFST+1,sp)
 942  01b4 f6            	ld	a,(x)
 943  01b5 a4bf          	and	a,#191
 944  01b7 f7            	ld	(x),a
 945  01b8               L563:
 946                     ; 336 }
 949  01b8 85            	popw	x
 950  01b9 81            	ret
 997                     ; 347 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
 997                     ; 348 {
 998                     	switch	.text
 999  01ba               _I2C_GenerateSTART:
1001  01ba 89            	pushw	x
1002       00000000      OFST:	set	0
1005                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
1007                     ; 353   if (NewState != DISABLE)
1009  01bb 0d05          	tnz	(OFST+5,sp)
1010  01bd 2708          	jreq	L314
1011                     ; 356     I2Cx->CR2 |= I2C_CR2_START;
1013  01bf e601          	ld	a,(1,x)
1014  01c1 aa01          	or	a,#1
1015  01c3 e701          	ld	(1,x),a
1017  01c5 2008          	jra	L514
1018  01c7               L314:
1019                     ; 361     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
1021  01c7 1e01          	ldw	x,(OFST+1,sp)
1022  01c9 e601          	ld	a,(1,x)
1023  01cb a4fe          	and	a,#254
1024  01cd e701          	ld	(1,x),a
1025  01cf               L514:
1026                     ; 363 }
1029  01cf 85            	popw	x
1030  01d0 81            	ret
1077                     ; 372 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1077                     ; 373 {
1078                     	switch	.text
1079  01d1               _I2C_GenerateSTOP:
1081  01d1 89            	pushw	x
1082       00000000      OFST:	set	0
1085                     ; 376   assert_param(IS_FUNCTIONAL_STATE(NewState));
1087                     ; 378   if (NewState != DISABLE)
1089  01d2 0d05          	tnz	(OFST+5,sp)
1090  01d4 2708          	jreq	L344
1091                     ; 381     I2Cx->CR2 |= I2C_CR2_STOP;
1093  01d6 e601          	ld	a,(1,x)
1094  01d8 aa02          	or	a,#2
1095  01da e701          	ld	(1,x),a
1097  01dc 2008          	jra	L544
1098  01de               L344:
1099                     ; 386     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1101  01de 1e01          	ldw	x,(OFST+1,sp)
1102  01e0 e601          	ld	a,(1,x)
1103  01e2 a4fd          	and	a,#253
1104  01e4 e701          	ld	(1,x),a
1105  01e6               L544:
1106                     ; 388 }
1109  01e6 85            	popw	x
1110  01e7 81            	ret
1158                     ; 397 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1158                     ; 398 {
1159                     	switch	.text
1160  01e8               _I2C_SoftwareResetCmd:
1162  01e8 89            	pushw	x
1163       00000000      OFST:	set	0
1166                     ; 400   assert_param(IS_FUNCTIONAL_STATE(NewState));
1168                     ; 402   if (NewState != DISABLE)
1170  01e9 0d05          	tnz	(OFST+5,sp)
1171  01eb 2708          	jreq	L374
1172                     ; 405     I2Cx->CR2 |= I2C_CR2_SWRST;
1174  01ed e601          	ld	a,(1,x)
1175  01ef aa80          	or	a,#128
1176  01f1 e701          	ld	(1,x),a
1178  01f3 2008          	jra	L574
1179  01f5               L374:
1180                     ; 410     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1182  01f5 1e01          	ldw	x,(OFST+1,sp)
1183  01f7 e601          	ld	a,(1,x)
1184  01f9 a47f          	and	a,#127
1185  01fb e701          	ld	(1,x),a
1186  01fd               L574:
1187                     ; 412 }
1190  01fd 85            	popw	x
1191  01fe 81            	ret
1239                     ; 421 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1239                     ; 422 {
1240                     	switch	.text
1241  01ff               _I2C_StretchClockCmd:
1243  01ff 89            	pushw	x
1244       00000000      OFST:	set	0
1247                     ; 424   assert_param(IS_FUNCTIONAL_STATE(NewState));
1249                     ; 426   if (NewState != DISABLE)
1251  0200 0d05          	tnz	(OFST+5,sp)
1252  0202 2706          	jreq	L325
1253                     ; 429     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1255  0204 f6            	ld	a,(x)
1256  0205 a47f          	and	a,#127
1257  0207 f7            	ld	(x),a
1259  0208 2006          	jra	L525
1260  020a               L325:
1261                     ; 435     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1263  020a 1e01          	ldw	x,(OFST+1,sp)
1264  020c f6            	ld	a,(x)
1265  020d aa80          	or	a,#128
1266  020f f7            	ld	(x),a
1267  0210               L525:
1268                     ; 437 }
1271  0210 85            	popw	x
1272  0211 81            	ret
1319                     ; 446 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1319                     ; 447 {
1320                     	switch	.text
1321  0212               _I2C_ARPCmd:
1323  0212 89            	pushw	x
1324       00000000      OFST:	set	0
1327                     ; 449   assert_param(IS_FUNCTIONAL_STATE(NewState));
1329                     ; 451   if (NewState != DISABLE)
1331  0213 0d05          	tnz	(OFST+5,sp)
1332  0215 2706          	jreq	L355
1333                     ; 454     I2Cx->CR1 |= I2C_CR1_ARP;
1335  0217 f6            	ld	a,(x)
1336  0218 aa10          	or	a,#16
1337  021a f7            	ld	(x),a
1339  021b 2006          	jra	L555
1340  021d               L355:
1341                     ; 460     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1343  021d 1e01          	ldw	x,(OFST+1,sp)
1344  021f f6            	ld	a,(x)
1345  0220 a4ef          	and	a,#239
1346  0222 f7            	ld	(x),a
1347  0223               L555:
1348                     ; 462 }
1351  0223 85            	popw	x
1352  0224 81            	ret
1400                     ; 471 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1400                     ; 472 {
1401                     	switch	.text
1402  0225               _I2C_AcknowledgeConfig:
1404  0225 89            	pushw	x
1405       00000000      OFST:	set	0
1408                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
1410                     ; 476   if (NewState != DISABLE)
1412  0226 0d05          	tnz	(OFST+5,sp)
1413  0228 2708          	jreq	L306
1414                     ; 479     I2Cx->CR2 |= I2C_CR2_ACK;
1416  022a e601          	ld	a,(1,x)
1417  022c aa04          	or	a,#4
1418  022e e701          	ld	(1,x),a
1420  0230 2008          	jra	L506
1421  0232               L306:
1422                     ; 484     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1424  0232 1e01          	ldw	x,(OFST+1,sp)
1425  0234 e601          	ld	a,(1,x)
1426  0236 a4fb          	and	a,#251
1427  0238 e701          	ld	(1,x),a
1428  023a               L506:
1429                     ; 486 }
1432  023a 85            	popw	x
1433  023b 81            	ret
1489                     ; 494 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1489                     ; 495 {
1490                     	switch	.text
1491  023c               _I2C_OwnAddress2Config:
1493  023c 89            	pushw	x
1494  023d 88            	push	a
1495       00000001      OFST:	set	1
1498                     ; 496   uint8_t tmpreg = 0;
1500                     ; 499   tmpreg = I2Cx->OAR2;
1502  023e e605          	ld	a,(5,x)
1503  0240 6b01          	ld	(OFST+0,sp),a
1504                     ; 502   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1506  0242 7b01          	ld	a,(OFST+0,sp)
1507  0244 a401          	and	a,#1
1508  0246 6b01          	ld	(OFST+0,sp),a
1509                     ; 505   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1511  0248 7b06          	ld	a,(OFST+5,sp)
1512  024a a4fe          	and	a,#254
1513  024c 1a01          	or	a,(OFST+0,sp)
1514  024e 6b01          	ld	(OFST+0,sp),a
1515                     ; 508   I2Cx->OAR2 = tmpreg;
1517  0250 7b01          	ld	a,(OFST+0,sp)
1518  0252 1e02          	ldw	x,(OFST+1,sp)
1519  0254 e705          	ld	(5,x),a
1520                     ; 509 }
1523  0256 5b03          	addw	sp,#3
1524  0258 81            	ret
1571                     ; 518 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1571                     ; 519 {
1572                     	switch	.text
1573  0259               _I2C_DualAddressCmd:
1575  0259 89            	pushw	x
1576       00000000      OFST:	set	0
1579                     ; 521   assert_param(IS_FUNCTIONAL_STATE(NewState));
1581                     ; 523   if (NewState != DISABLE)
1583  025a 0d05          	tnz	(OFST+5,sp)
1584  025c 2708          	jreq	L366
1585                     ; 526     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1587  025e e605          	ld	a,(5,x)
1588  0260 aa01          	or	a,#1
1589  0262 e705          	ld	(5,x),a
1591  0264 2008          	jra	L566
1592  0266               L366:
1593                     ; 531     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1595  0266 1e01          	ldw	x,(OFST+1,sp)
1596  0268 e605          	ld	a,(5,x)
1597  026a a4fe          	and	a,#254
1598  026c e705          	ld	(5,x),a
1599  026e               L566:
1600                     ; 533 }
1603  026e 85            	popw	x
1604  026f 81            	ret
1674                     ; 545 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1674                     ; 546 {
1675                     	switch	.text
1676  0270               _I2C_AckPositionConfig:
1678  0270 89            	pushw	x
1679       00000000      OFST:	set	0
1682                     ; 548   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1684                     ; 551   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1686  0271 e601          	ld	a,(1,x)
1687  0273 a4f7          	and	a,#247
1688  0275 e701          	ld	(1,x),a
1689                     ; 553   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1691  0277 e601          	ld	a,(1,x)
1692  0279 1a05          	or	a,(OFST+5,sp)
1693  027b e701          	ld	(1,x),a
1694                     ; 554 }
1697  027d 85            	popw	x
1698  027e 81            	ret
1767                     ; 565 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1767                     ; 566 {
1768                     	switch	.text
1769  027f               _I2C_SMBusAlertConfig:
1771  027f 89            	pushw	x
1772       00000000      OFST:	set	0
1775                     ; 569   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1777                     ; 571   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1779  0280 0d05          	tnz	(OFST+5,sp)
1780  0282 2708          	jreq	L757
1781                     ; 574     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1783  0284 e601          	ld	a,(1,x)
1784  0286 aa20          	or	a,#32
1785  0288 e701          	ld	(1,x),a
1787  028a 2008          	jra	L167
1788  028c               L757:
1789                     ; 579     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1791  028c 1e01          	ldw	x,(OFST+1,sp)
1792  028e e601          	ld	a,(1,x)
1793  0290 a4df          	and	a,#223
1794  0292 e701          	ld	(1,x),a
1795  0294               L167:
1796                     ; 581 }
1799  0294 85            	popw	x
1800  0295 81            	ret
1848                     ; 592 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1848                     ; 593 {
1849                     	switch	.text
1850  0296               _I2C_FastModeDutyCycleConfig:
1852  0296 89            	pushw	x
1853       00000000      OFST:	set	0
1856                     ; 596   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1858                     ; 598   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1860  0297 7b05          	ld	a,(OFST+5,sp)
1861  0299 a140          	cp	a,#64
1862  029b 2608          	jrne	L7001
1863                     ; 601     I2Cx->CCRH |= I2C_CCRH_DUTY;
1865  029d e60c          	ld	a,(12,x)
1866  029f aa40          	or	a,#64
1867  02a1 e70c          	ld	(12,x),a
1869  02a3 2008          	jra	L1101
1870  02a5               L7001:
1871                     ; 606     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1873  02a5 1e01          	ldw	x,(OFST+1,sp)
1874  02a7 e60c          	ld	a,(12,x)
1875  02a9 a4bf          	and	a,#191
1876  02ab e70c          	ld	(12,x),a
1877  02ad               L1101:
1878                     ; 608 }
1881  02ad 85            	popw	x
1882  02ae 81            	ret
1961                     ; 621 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1961                     ; 622 {
1962                     	switch	.text
1963  02af               _I2C_Send7bitAddress:
1965  02af 89            	pushw	x
1966       00000000      OFST:	set	0
1969                     ; 624   assert_param(IS_I2C_ADDRESS(Address));
1971                     ; 625   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1973                     ; 628   if (I2C_Direction != I2C_Direction_Transmitter)
1975  02b0 0d06          	tnz	(OFST+6,sp)
1976  02b2 2708          	jreq	L3501
1977                     ; 631     Address |= OAR1_ADD0_Set;
1979  02b4 7b05          	ld	a,(OFST+5,sp)
1980  02b6 aa01          	or	a,#1
1981  02b8 6b05          	ld	(OFST+5,sp),a
1983  02ba 2006          	jra	L5501
1984  02bc               L3501:
1985                     ; 636     Address &= OAR1_ADD0_Reset;
1987  02bc 7b05          	ld	a,(OFST+5,sp)
1988  02be a4fe          	and	a,#254
1989  02c0 6b05          	ld	(OFST+5,sp),a
1990  02c2               L5501:
1991                     ; 639   I2Cx->DR = Address;
1993  02c2 7b05          	ld	a,(OFST+5,sp)
1994  02c4 1e01          	ldw	x,(OFST+1,sp)
1995  02c6 e706          	ld	(6,x),a
1996                     ; 640 }
1999  02c8 85            	popw	x
2000  02c9 81            	ret
2046                     ; 664 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
2046                     ; 665 {
2047                     	switch	.text
2048  02ca               _I2C_SendData:
2050  02ca 89            	pushw	x
2051       00000000      OFST:	set	0
2054                     ; 667   I2Cx->DR = Data;
2056  02cb 7b05          	ld	a,(OFST+5,sp)
2057  02cd 1e01          	ldw	x,(OFST+1,sp)
2058  02cf e706          	ld	(6,x),a
2059                     ; 668 }
2062  02d1 85            	popw	x
2063  02d2 81            	ret
2100                     ; 676 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2100                     ; 677 {
2101                     	switch	.text
2102  02d3               _I2C_ReceiveData:
2106                     ; 679   return ((uint8_t)I2Cx->DR);
2108  02d3 e606          	ld	a,(6,x)
2111  02d5 81            	ret
2158                     ; 705 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2158                     ; 706 {
2159                     	switch	.text
2160  02d6               _I2C_TransmitPEC:
2162  02d6 89            	pushw	x
2163       00000000      OFST:	set	0
2166                     ; 708   assert_param(IS_FUNCTIONAL_STATE(NewState));
2168                     ; 710   if (NewState != DISABLE)
2170  02d7 0d05          	tnz	(OFST+5,sp)
2171  02d9 2708          	jreq	L7411
2172                     ; 713     I2Cx->CR2 |= I2C_CR2_PEC;
2174  02db e601          	ld	a,(1,x)
2175  02dd aa10          	or	a,#16
2176  02df e701          	ld	(1,x),a
2178  02e1 2008          	jra	L1511
2179  02e3               L7411:
2180                     ; 718     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2182  02e3 1e01          	ldw	x,(OFST+1,sp)
2183  02e5 e601          	ld	a,(1,x)
2184  02e7 a4ef          	and	a,#239
2185  02e9 e701          	ld	(1,x),a
2186  02eb               L1511:
2187                     ; 720 }
2190  02eb 85            	popw	x
2191  02ec 81            	ret
2238                     ; 729 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2238                     ; 730 {
2239                     	switch	.text
2240  02ed               _I2C_CalculatePEC:
2242  02ed 89            	pushw	x
2243       00000000      OFST:	set	0
2246                     ; 732   assert_param(IS_FUNCTIONAL_STATE(NewState));
2248                     ; 734   if (NewState != DISABLE)
2250  02ee 0d05          	tnz	(OFST+5,sp)
2251  02f0 2706          	jreq	L7711
2252                     ; 737     I2Cx->CR1 |= I2C_CR1_ENPEC;
2254  02f2 f6            	ld	a,(x)
2255  02f3 aa20          	or	a,#32
2256  02f5 f7            	ld	(x),a
2258  02f6 2006          	jra	L1021
2259  02f8               L7711:
2260                     ; 742     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2262  02f8 1e01          	ldw	x,(OFST+1,sp)
2263  02fa f6            	ld	a,(x)
2264  02fb a4df          	and	a,#223
2265  02fd f7            	ld	(x),a
2266  02fe               L1021:
2267                     ; 744 }
2270  02fe 85            	popw	x
2271  02ff 81            	ret
2341                     ; 755 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2341                     ; 756 {
2342                     	switch	.text
2343  0300               _I2C_PECPositionConfig:
2345  0300 89            	pushw	x
2346       00000000      OFST:	set	0
2349                     ; 758   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2351                     ; 761   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2353  0301 e601          	ld	a,(1,x)
2354  0303 a4f7          	and	a,#247
2355  0305 e701          	ld	(1,x),a
2356                     ; 763   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2358  0307 e601          	ld	a,(1,x)
2359  0309 1a05          	or	a,(OFST+5,sp)
2360  030b e701          	ld	(1,x),a
2361                     ; 764 }
2364  030d 85            	popw	x
2365  030e 81            	ret
2402                     ; 772 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2402                     ; 773 {
2403                     	switch	.text
2404  030f               _I2C_GetPEC:
2408                     ; 775   return (I2Cx->PECR);
2410  030f e60e          	ld	a,(14,x)
2413  0311 81            	ret
2460                     ; 803 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2460                     ; 804 {
2461                     	switch	.text
2462  0312               _I2C_DMACmd:
2464  0312 89            	pushw	x
2465       00000000      OFST:	set	0
2468                     ; 806   assert_param(IS_FUNCTIONAL_STATE(NewState));
2470                     ; 808   if (NewState != DISABLE)
2472  0313 0d05          	tnz	(OFST+5,sp)
2473  0315 2708          	jreq	L3031
2474                     ; 811     I2Cx->ITR |= I2C_ITR_DMAEN;
2476  0317 e60a          	ld	a,(10,x)
2477  0319 aa08          	or	a,#8
2478  031b e70a          	ld	(10,x),a
2480  031d 2008          	jra	L5031
2481  031f               L3031:
2482                     ; 816     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2484  031f 1e01          	ldw	x,(OFST+1,sp)
2485  0321 e60a          	ld	a,(10,x)
2486  0323 a4f7          	and	a,#247
2487  0325 e70a          	ld	(10,x),a
2488  0327               L5031:
2489                     ; 818 }
2492  0327 85            	popw	x
2493  0328 81            	ret
2541                     ; 827 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2541                     ; 828 {
2542                     	switch	.text
2543  0329               _I2C_DMALastTransferCmd:
2545  0329 89            	pushw	x
2546       00000000      OFST:	set	0
2549                     ; 830   assert_param(IS_FUNCTIONAL_STATE(NewState));
2551                     ; 832   if (NewState != DISABLE)
2553  032a 0d05          	tnz	(OFST+5,sp)
2554  032c 2708          	jreq	L3331
2555                     ; 835     I2Cx->ITR |= I2C_ITR_LAST;
2557  032e e60a          	ld	a,(10,x)
2558  0330 aa10          	or	a,#16
2559  0332 e70a          	ld	(10,x),a
2561  0334 2008          	jra	L5331
2562  0336               L3331:
2563                     ; 840     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2565  0336 1e01          	ldw	x,(OFST+1,sp)
2566  0338 e60a          	ld	a,(10,x)
2567  033a a4ef          	and	a,#239
2568  033c e70a          	ld	(10,x),a
2569  033e               L5331:
2570                     ; 842 }
2573  033e 85            	popw	x
2574  033f 81            	ret
2763                     ; 954 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2763                     ; 955 {
2764                     	switch	.text
2765  0340               _I2C_ITConfig:
2767  0340 89            	pushw	x
2768       00000000      OFST:	set	0
2771                     ; 957   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2773                     ; 958   assert_param(IS_FUNCTIONAL_STATE(NewState));
2775                     ; 960   if (NewState != DISABLE)
2777  0341 0d07          	tnz	(OFST+7,sp)
2778  0343 2708          	jreq	L7341
2779                     ; 963     I2Cx->ITR |= (uint8_t)I2C_IT;
2781  0345 e60a          	ld	a,(10,x)
2782  0347 1a06          	or	a,(OFST+6,sp)
2783  0349 e70a          	ld	(10,x),a
2785  034b 2009          	jra	L1441
2786  034d               L7341:
2787                     ; 968     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2789  034d 1e01          	ldw	x,(OFST+1,sp)
2790  034f 7b06          	ld	a,(OFST+6,sp)
2791  0351 43            	cpl	a
2792  0352 e40a          	and	a,(10,x)
2793  0354 e70a          	ld	(10,x),a
2794  0356               L1441:
2795                     ; 970 }
2798  0356 85            	popw	x
2799  0357 81            	ret
2960                     ; 994 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2960                     ; 995 {
2961                     	switch	.text
2962  0358               _I2C_ReadRegister:
2964  0358 89            	pushw	x
2965  0359 5204          	subw	sp,#4
2966       00000004      OFST:	set	4
2969                     ; 996   __IO uint16_t tmp = 0;
2971  035b 5f            	clrw	x
2972  035c 1f03          	ldw	(OFST-1,sp),x
2973                     ; 998   assert_param(IS_I2C_REGISTER(I2C_Register));
2975                     ; 1000   tmp = (uint16_t) I2Cx;
2977  035e 1e05          	ldw	x,(OFST+1,sp)
2978  0360 1f03          	ldw	(OFST-1,sp),x
2979                     ; 1001   tmp += I2C_Register;
2981  0362 7b09          	ld	a,(OFST+5,sp)
2982  0364 5f            	clrw	x
2983  0365 97            	ld	xl,a
2984  0366 1f01          	ldw	(OFST-3,sp),x
2985  0368 1e03          	ldw	x,(OFST-1,sp)
2986  036a 72fb01        	addw	x,(OFST-3,sp)
2987  036d 1f03          	ldw	(OFST-1,sp),x
2988                     ; 1004   return (*(__IO uint8_t *) tmp);
2990  036f 1e03          	ldw	x,(OFST-1,sp)
2991  0371 f6            	ld	a,(x)
2994  0372 5b06          	addw	sp,#6
2995  0374 81            	ret
3249                     ; 1044 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3249                     ; 1045 {
3250                     	switch	.text
3251  0375               _I2C_CheckEvent:
3253  0375 89            	pushw	x
3254  0376 5206          	subw	sp,#6
3255       00000006      OFST:	set	6
3258                     ; 1046   __IO uint16_t lastevent = 0x00;
3260  0378 5f            	clrw	x
3261  0379 1f04          	ldw	(OFST-2,sp),x
3262                     ; 1047   uint8_t flag1 = 0x00 ;
3264                     ; 1048   uint8_t flag2 = 0x00;
3266                     ; 1049   ErrorStatus status = ERROR;
3268                     ; 1052   assert_param(IS_I2C_EVENT(I2C_Event));
3270                     ; 1054   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3272  037b 1e0b          	ldw	x,(OFST+5,sp)
3273  037d a30004        	cpw	x,#4
3274  0380 260c          	jrne	L5561
3275                     ; 1056     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3277  0382 1e07          	ldw	x,(OFST+1,sp)
3278  0384 e608          	ld	a,(8,x)
3279  0386 a404          	and	a,#4
3280  0388 5f            	clrw	x
3281  0389 97            	ld	xl,a
3282  038a 1f04          	ldw	(OFST-2,sp),x
3284  038c 2021          	jra	L7561
3285  038e               L5561:
3286                     ; 1060     flag1 = I2Cx->SR1;
3288  038e 1e07          	ldw	x,(OFST+1,sp)
3289  0390 e607          	ld	a,(7,x)
3290  0392 6b03          	ld	(OFST-3,sp),a
3291                     ; 1061     flag2 = I2Cx->SR3;
3293  0394 1e07          	ldw	x,(OFST+1,sp)
3294  0396 e609          	ld	a,(9,x)
3295  0398 6b06          	ld	(OFST+0,sp),a
3296                     ; 1062     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3298  039a 7b03          	ld	a,(OFST-3,sp)
3299  039c 5f            	clrw	x
3300  039d 97            	ld	xl,a
3301  039e 1f01          	ldw	(OFST-5,sp),x
3302  03a0 7b06          	ld	a,(OFST+0,sp)
3303  03a2 5f            	clrw	x
3304  03a3 97            	ld	xl,a
3305  03a4 4f            	clr	a
3306  03a5 02            	rlwa	x,a
3307  03a6 01            	rrwa	x,a
3308  03a7 1a02          	or	a,(OFST-4,sp)
3309  03a9 01            	rrwa	x,a
3310  03aa 1a01          	or	a,(OFST-5,sp)
3311  03ac 01            	rrwa	x,a
3312  03ad 1f04          	ldw	(OFST-2,sp),x
3313  03af               L7561:
3314                     ; 1065   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3316  03af 1e04          	ldw	x,(OFST-2,sp)
3317  03b1 01            	rrwa	x,a
3318  03b2 140c          	and	a,(OFST+6,sp)
3319  03b4 01            	rrwa	x,a
3320  03b5 140b          	and	a,(OFST+5,sp)
3321  03b7 01            	rrwa	x,a
3322  03b8 130b          	cpw	x,(OFST+5,sp)
3323  03ba 2606          	jrne	L1661
3324                     ; 1068     status = SUCCESS;
3326  03bc a601          	ld	a,#1
3327  03be 6b06          	ld	(OFST+0,sp),a
3329  03c0 2002          	jra	L3661
3330  03c2               L1661:
3331                     ; 1073     status = ERROR;
3333  03c2 0f06          	clr	(OFST+0,sp)
3334  03c4               L3661:
3335                     ; 1077   return status;
3337  03c4 7b06          	ld	a,(OFST+0,sp)
3340  03c6 5b08          	addw	sp,#8
3341  03c8 81            	ret
3406                     ; 1095 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3406                     ; 1096 {
3407                     	switch	.text
3408  03c9               _I2C_GetLastEvent:
3410  03c9 89            	pushw	x
3411  03ca 5206          	subw	sp,#6
3412       00000006      OFST:	set	6
3415                     ; 1097   __IO uint16_t lastevent = 0;
3417  03cc 5f            	clrw	x
3418  03cd 1f05          	ldw	(OFST-1,sp),x
3419                     ; 1098   uint16_t flag1 = 0;
3421                     ; 1099   uint16_t flag2 = 0;
3423                     ; 1101   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3425  03cf 1e07          	ldw	x,(OFST+1,sp)
3426  03d1 e608          	ld	a,(8,x)
3427  03d3 a504          	bcp	a,#4
3428  03d5 2707          	jreq	L1271
3429                     ; 1103     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3431  03d7 ae0004        	ldw	x,#4
3432  03da 1f05          	ldw	(OFST-1,sp),x
3434  03dc 201d          	jra	L3271
3435  03de               L1271:
3436                     ; 1108     flag1 = I2Cx->SR1;
3438  03de 1e07          	ldw	x,(OFST+1,sp)
3439  03e0 e607          	ld	a,(7,x)
3440  03e2 5f            	clrw	x
3441  03e3 97            	ld	xl,a
3442  03e4 1f01          	ldw	(OFST-5,sp),x
3443                     ; 1109     flag2 = I2Cx->SR3;
3445  03e6 1e07          	ldw	x,(OFST+1,sp)
3446  03e8 e609          	ld	a,(9,x)
3447  03ea 5f            	clrw	x
3448  03eb 97            	ld	xl,a
3449  03ec 1f03          	ldw	(OFST-3,sp),x
3450                     ; 1112     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3452  03ee 1e03          	ldw	x,(OFST-3,sp)
3453  03f0 4f            	clr	a
3454  03f1 02            	rlwa	x,a
3455  03f2 01            	rrwa	x,a
3456  03f3 1a02          	or	a,(OFST-4,sp)
3457  03f5 01            	rrwa	x,a
3458  03f6 1a01          	or	a,(OFST-5,sp)
3459  03f8 01            	rrwa	x,a
3460  03f9 1f05          	ldw	(OFST-1,sp),x
3461  03fb               L3271:
3462                     ; 1115   return (I2C_Event_TypeDef)lastevent;
3464  03fb 1e05          	ldw	x,(OFST-1,sp)
3467  03fd 5b08          	addw	sp,#8
3468  03ff 81            	ret
3725                     ; 1152 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3725                     ; 1153 {
3726                     	switch	.text
3727  0400               _I2C_GetFlagStatus:
3729  0400 89            	pushw	x
3730  0401 89            	pushw	x
3731       00000002      OFST:	set	2
3734                     ; 1154   uint8_t tempreg = 0;
3736  0402 0f02          	clr	(OFST+0,sp)
3737                     ; 1155   uint8_t regindex = 0;
3739                     ; 1156   FlagStatus bitstatus = RESET;
3741                     ; 1159   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3743                     ; 1162   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3745  0404 7b07          	ld	a,(OFST+5,sp)
3746  0406 6b01          	ld	(OFST-1,sp),a
3747                     ; 1164   switch (regindex)
3749  0408 7b01          	ld	a,(OFST-1,sp)
3751                     ; 1181     default:
3751                     ; 1182       break;
3752  040a 4a            	dec	a
3753  040b 2708          	jreq	L5271
3754  040d 4a            	dec	a
3755  040e 270d          	jreq	L7271
3756  0410 4a            	dec	a
3757  0411 2712          	jreq	L1371
3758  0413 2016          	jra	L7602
3759  0415               L5271:
3760                     ; 1167     case 0x01:
3760                     ; 1168       tempreg = (uint8_t)I2Cx->SR1;
3762  0415 1e03          	ldw	x,(OFST+1,sp)
3763  0417 e607          	ld	a,(7,x)
3764  0419 6b02          	ld	(OFST+0,sp),a
3765                     ; 1169       break;
3767  041b 200e          	jra	L7602
3768  041d               L7271:
3769                     ; 1172     case 0x02:
3769                     ; 1173       tempreg = (uint8_t)I2Cx->SR2;
3771  041d 1e03          	ldw	x,(OFST+1,sp)
3772  041f e608          	ld	a,(8,x)
3773  0421 6b02          	ld	(OFST+0,sp),a
3774                     ; 1174       break;
3776  0423 2006          	jra	L7602
3777  0425               L1371:
3778                     ; 1177     case 0x03:
3778                     ; 1178       tempreg = (uint8_t)I2Cx->SR3;
3780  0425 1e03          	ldw	x,(OFST+1,sp)
3781  0427 e609          	ld	a,(9,x)
3782  0429 6b02          	ld	(OFST+0,sp),a
3783                     ; 1179       break;
3785  042b               L3371:
3786                     ; 1181     default:
3786                     ; 1182       break;
3788  042b               L7602:
3789                     ; 1186   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3791  042b 7b08          	ld	a,(OFST+6,sp)
3792  042d 1502          	bcp	a,(OFST+0,sp)
3793  042f 2706          	jreq	L1702
3794                     ; 1189     bitstatus = SET;
3796  0431 a601          	ld	a,#1
3797  0433 6b02          	ld	(OFST+0,sp),a
3799  0435 2002          	jra	L3702
3800  0437               L1702:
3801                     ; 1194     bitstatus = RESET;
3803  0437 0f02          	clr	(OFST+0,sp)
3804  0439               L3702:
3805                     ; 1197   return bitstatus;
3807  0439 7b02          	ld	a,(OFST+0,sp)
3810  043b 5b04          	addw	sp,#4
3811  043d 81            	ret
3867                     ; 1229 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3867                     ; 1230 {
3868                     	switch	.text
3869  043e               _I2C_ClearFlag:
3871  043e 89            	pushw	x
3872  043f 89            	pushw	x
3873       00000002      OFST:	set	2
3876                     ; 1231   uint16_t flagpos = 0;
3878                     ; 1233   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3880                     ; 1236   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3882  0440 7b07          	ld	a,(OFST+5,sp)
3883  0442 97            	ld	xl,a
3884  0443 7b08          	ld	a,(OFST+6,sp)
3885  0445 a4ff          	and	a,#255
3886  0447 5f            	clrw	x
3887  0448 02            	rlwa	x,a
3888  0449 1f01          	ldw	(OFST-1,sp),x
3889  044b 01            	rrwa	x,a
3890                     ; 1238   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3892  044c 7b02          	ld	a,(OFST+0,sp)
3893  044e 43            	cpl	a
3894  044f 1e03          	ldw	x,(OFST+1,sp)
3895  0451 e708          	ld	(8,x),a
3896                     ; 1239 }
3899  0453 5b04          	addw	sp,#4
3900  0455 81            	ret
3976                     ; 1264 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3976                     ; 1265 {
3977                     	switch	.text
3978  0456               _I2C_GetITStatus:
3980  0456 89            	pushw	x
3981  0457 5204          	subw	sp,#4
3982       00000004      OFST:	set	4
3985                     ; 1266   ITStatus bitstatus = RESET;
3987                     ; 1267   __IO uint8_t enablestatus = 0;
3989  0459 0f03          	clr	(OFST-1,sp)
3990                     ; 1268   uint16_t tempregister = 0;
3992                     ; 1271   assert_param(IS_I2C_GET_IT(I2C_IT));
3994                     ; 1273   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
3996  045b 7b09          	ld	a,(OFST+5,sp)
3997  045d 97            	ld	xl,a
3998  045e 7b0a          	ld	a,(OFST+6,sp)
3999  0460 9f            	ld	a,xl
4000  0461 a407          	and	a,#7
4001  0463 97            	ld	xl,a
4002  0464 4f            	clr	a
4003  0465 02            	rlwa	x,a
4004  0466 4f            	clr	a
4005  0467 01            	rrwa	x,a
4006  0468 9f            	ld	a,xl
4007  0469 5f            	clrw	x
4008  046a 97            	ld	xl,a
4009  046b 1f01          	ldw	(OFST-3,sp),x
4010                     ; 1276   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
4012  046d 1e05          	ldw	x,(OFST+1,sp)
4013  046f e60a          	ld	a,(10,x)
4014  0471 1402          	and	a,(OFST-2,sp)
4015  0473 6b03          	ld	(OFST-1,sp),a
4016                     ; 1278   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
4018  0475 7b09          	ld	a,(OFST+5,sp)
4019  0477 97            	ld	xl,a
4020  0478 7b0a          	ld	a,(OFST+6,sp)
4021  047a 9f            	ld	a,xl
4022  047b a430          	and	a,#48
4023  047d 97            	ld	xl,a
4024  047e 4f            	clr	a
4025  047f 02            	rlwa	x,a
4026  0480 a30100        	cpw	x,#256
4027  0483 2616          	jrne	L5612
4028                     ; 1281     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4030  0485 1e05          	ldw	x,(OFST+1,sp)
4031  0487 e607          	ld	a,(7,x)
4032  0489 150a          	bcp	a,(OFST+6,sp)
4033  048b 270a          	jreq	L7612
4035  048d 0d03          	tnz	(OFST-1,sp)
4036  048f 2706          	jreq	L7612
4037                     ; 1284       bitstatus = SET;
4039  0491 a601          	ld	a,#1
4040  0493 6b04          	ld	(OFST+0,sp),a
4042  0495 2018          	jra	L3712
4043  0497               L7612:
4044                     ; 1289       bitstatus = RESET;
4046  0497 0f04          	clr	(OFST+0,sp)
4047  0499 2014          	jra	L3712
4048  049b               L5612:
4049                     ; 1295     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4051  049b 1e05          	ldw	x,(OFST+1,sp)
4052  049d e608          	ld	a,(8,x)
4053  049f 150a          	bcp	a,(OFST+6,sp)
4054  04a1 270a          	jreq	L5712
4056  04a3 0d03          	tnz	(OFST-1,sp)
4057  04a5 2706          	jreq	L5712
4058                     ; 1298       bitstatus = SET;
4060  04a7 a601          	ld	a,#1
4061  04a9 6b04          	ld	(OFST+0,sp),a
4063  04ab 2002          	jra	L3712
4064  04ad               L5712:
4065                     ; 1303       bitstatus = RESET;
4067  04ad 0f04          	clr	(OFST+0,sp)
4068  04af               L3712:
4069                     ; 1307   return  bitstatus;
4071  04af 7b04          	ld	a,(OFST+0,sp)
4074  04b1 5b06          	addw	sp,#6
4075  04b3 81            	ret
4132                     ; 1340 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4132                     ; 1341 {
4133                     	switch	.text
4134  04b4               _I2C_ClearITPendingBit:
4136  04b4 89            	pushw	x
4137  04b5 89            	pushw	x
4138       00000002      OFST:	set	2
4141                     ; 1342   uint16_t flagpos = 0;
4143                     ; 1345   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
4145                     ; 1348   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
4147  04b6 7b07          	ld	a,(OFST+5,sp)
4148  04b8 97            	ld	xl,a
4149  04b9 7b08          	ld	a,(OFST+6,sp)
4150  04bb a4ff          	and	a,#255
4151  04bd 5f            	clrw	x
4152  04be 02            	rlwa	x,a
4153  04bf 1f01          	ldw	(OFST-1,sp),x
4154  04c1 01            	rrwa	x,a
4155                     ; 1351   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4157  04c2 7b02          	ld	a,(OFST+0,sp)
4158  04c4 43            	cpl	a
4159  04c5 1e03          	ldw	x,(OFST+1,sp)
4160  04c7 e708          	ld	(8,x),a
4161                     ; 1352 }
4164  04c9 5b04          	addw	sp,#4
4165  04cb 81            	ret
4178                     	xdef	_I2C_ClearITPendingBit
4179                     	xdef	_I2C_GetITStatus
4180                     	xdef	_I2C_ClearFlag
4181                     	xdef	_I2C_GetFlagStatus
4182                     	xdef	_I2C_GetLastEvent
4183                     	xdef	_I2C_CheckEvent
4184                     	xdef	_I2C_ReadRegister
4185                     	xdef	_I2C_ITConfig
4186                     	xdef	_I2C_DMALastTransferCmd
4187                     	xdef	_I2C_DMACmd
4188                     	xdef	_I2C_CalculatePEC
4189                     	xdef	_I2C_TransmitPEC
4190                     	xdef	_I2C_GetPEC
4191                     	xdef	_I2C_PECPositionConfig
4192                     	xdef	_I2C_ReceiveData
4193                     	xdef	_I2C_SendData
4194                     	xdef	_I2C_Send7bitAddress
4195                     	xdef	_I2C_SMBusAlertConfig
4196                     	xdef	_I2C_FastModeDutyCycleConfig
4197                     	xdef	_I2C_AckPositionConfig
4198                     	xdef	_I2C_DualAddressCmd
4199                     	xdef	_I2C_OwnAddress2Config
4200                     	xdef	_I2C_AcknowledgeConfig
4201                     	xdef	_I2C_GenerateSTOP
4202                     	xdef	_I2C_GenerateSTART
4203                     	xdef	_I2C_ARPCmd
4204                     	xdef	_I2C_StretchClockCmd
4205                     	xdef	_I2C_SoftwareResetCmd
4206                     	xdef	_I2C_GeneralCallCmd
4207                     	xdef	_I2C_Cmd
4208                     	xdef	_I2C_Init
4209                     	xdef	_I2C_DeInit
4210                     	xref	_CLK_GetClockFreq
4211                     	xref.b	c_lreg
4212                     	xref.b	c_x
4231                     	xref	c_uitol
4232                     	xref	c_sdivx
4233                     	xref	c_lzmp
4234                     	xref	c_rtol
4235                     	xref	c_smul
4236                     	xref	c_lmul
4237                     	xref	c_lcmp
4238                     	xref	c_ltor
4239                     	xref	c_ludv
4240                     	end
