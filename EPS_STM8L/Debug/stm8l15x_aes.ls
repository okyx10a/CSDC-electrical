   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  43                     ; 93 void AES_DeInit(void)
  43                     ; 94 {
  45                     	switch	.text
  46  0000               _AES_DeInit:
  50                     ; 96   AES->CR = AES_CR_ERRC | AES_CR_CCFC;
  52  0000 351853d0      	mov	21456,#24
  53                     ; 97   AES->DINR = AES_DINR_RESET_VALUE;       /* Set AES_DINR to reset value 0x00 */
  55  0004 725f53d2      	clr	21458
  56                     ; 98   AES->DOUTR = AES_DOUTR_RESET_VALUE;     /* Set AES_DOUTR to reset value 0x00 */
  58  0008 725f53d3      	clr	21459
  59                     ; 99 }
  62  000c 81            	ret
 136                     ; 112 void AES_OperationModeConfig(AES_Operation_TypeDef AES_Operation)
 136                     ; 113 {
 137                     	switch	.text
 138  000d               _AES_OperationModeConfig:
 140  000d 88            	push	a
 141       00000000      OFST:	set	0
 144                     ; 115   assert_param(IS_AES_MODE(AES_Operation));
 146                     ; 118   AES->CR &= (uint8_t) (~AES_CR_MODE);
 148  000e c653d0        	ld	a,21456
 149  0011 a4f9          	and	a,#249
 150  0013 c753d0        	ld	21456,a
 151                     ; 121   AES->CR |= (uint8_t) (AES_Operation);
 153  0016 c653d0        	ld	a,21456
 154  0019 1a01          	or	a,(OFST+1,sp)
 155  001b c753d0        	ld	21456,a
 156                     ; 122 }
 159  001e 84            	pop	a
 160  001f 81            	ret
 215                     ; 132 void AES_Cmd(FunctionalState NewState)
 215                     ; 133 {
 216                     	switch	.text
 217  0020               _AES_Cmd:
 221                     ; 135   assert_param(IS_FUNCTIONAL_STATE(NewState));
 223                     ; 137   if (NewState != DISABLE)
 225  0020 4d            	tnz	a
 226  0021 2706          	jreq	L101
 227                     ; 139     AES->CR |= (uint8_t) AES_CR_EN;   /**< AES Enable */
 229  0023 721053d0      	bset	21456,#0
 231  0027 2004          	jra	L301
 232  0029               L101:
 233                     ; 143     AES->CR &= (uint8_t)(~AES_CR_EN);  /**< AES Disable */
 235  0029 721153d0      	bres	21456,#0
 236  002d               L301:
 237                     ; 145 }
 240  002d 81            	ret
 274                     ; 170 void AES_WriteSubData(uint8_t Data)
 274                     ; 171 {
 275                     	switch	.text
 276  002e               _AES_WriteSubData:
 280                     ; 173   AES->DINR = Data;
 282  002e c753d2        	ld	21458,a
 283                     ; 174 }
 286  0031 81            	ret
 320                     ; 183 void AES_WriteSubKey(uint8_t Key)
 320                     ; 184 {
 321                     	switch	.text
 322  0032               _AES_WriteSubKey:
 326                     ; 186   AES->DINR = Key;
 328  0032 c753d2        	ld	21458,a
 329                     ; 187 }
 332  0035 81            	ret
 355                     ; 195 uint8_t AES_ReadSubData(void)
 355                     ; 196 {
 356                     	switch	.text
 357  0036               _AES_ReadSubData:
 361                     ; 197   return AES->DOUTR;
 363  0036 c653d3        	ld	a,21459
 366  0039 81            	ret
 389                     ; 206 uint8_t AES_ReadSubKey(void)
 389                     ; 207 {
 390                     	switch	.text
 391  003a               _AES_ReadSubKey:
 395                     ; 208   return AES->DOUTR;
 397  003a c653d3        	ld	a,21459
 400  003d 81            	ret
 459                     ; 237 void AES_DMAConfig(AES_DMATransfer_TypeDef AES_DMATransfer, FunctionalState NewState)
 459                     ; 238 {
 460                     	switch	.text
 461  003e               _AES_DMAConfig:
 463  003e 89            	pushw	x
 464       00000000      OFST:	set	0
 467                     ; 240   assert_param(IS_AES_DMATRANSFER(AES_DMATransfer));
 469                     ; 242   if (NewState != DISABLE)
 471  003f 9f            	ld	a,xl
 472  0040 4d            	tnz	a
 473  0041 2709          	jreq	L112
 474                     ; 245     AES->CR |= (uint8_t) AES_DMATransfer;
 476  0043 9e            	ld	a,xh
 477  0044 ca53d0        	or	a,21456
 478  0047 c753d0        	ld	21456,a
 480  004a 2009          	jra	L312
 481  004c               L112:
 482                     ; 250     AES->CR &= (uint8_t)(~AES_DMATransfer);
 484  004c 7b01          	ld	a,(OFST+1,sp)
 485  004e 43            	cpl	a
 486  004f c453d0        	and	a,21456
 487  0052 c753d0        	ld	21456,a
 488  0055               L312:
 489                     ; 252 }
 492  0055 85            	popw	x
 493  0056 81            	ret
 558                     ; 281 void AES_ITConfig(AES_IT_TypeDef AES_IT, FunctionalState NewState)
 558                     ; 282 {
 559                     	switch	.text
 560  0057               _AES_ITConfig:
 562  0057 89            	pushw	x
 563       00000000      OFST:	set	0
 566                     ; 284   assert_param(IS_FUNCTIONAL_STATE(NewState));
 568                     ; 285   assert_param(IS_AES_IT(AES_IT));
 570                     ; 287   if (NewState != DISABLE)
 572  0058 9f            	ld	a,xl
 573  0059 4d            	tnz	a
 574  005a 2709          	jreq	L742
 575                     ; 289     AES->CR |= (uint8_t) AES_IT;    /**< AES_IT Enable */
 577  005c 9e            	ld	a,xh
 578  005d ca53d0        	or	a,21456
 579  0060 c753d0        	ld	21456,a
 581  0063 2009          	jra	L152
 582  0065               L742:
 583                     ; 293     AES->CR &= (uint8_t)(~AES_IT);  /**< AES_IT Disable */
 585  0065 7b01          	ld	a,(OFST+1,sp)
 586  0067 43            	cpl	a
 587  0068 c453d0        	and	a,21456
 588  006b c753d0        	ld	21456,a
 589  006e               L152:
 590                     ; 295 }
 593  006e 85            	popw	x
 594  006f 81            	ret
 687                     ; 307 FlagStatus AES_GetFlagStatus(AES_FLAG_TypeDef AES_FLAG)
 687                     ; 308 {
 688                     	switch	.text
 689  0070               _AES_GetFlagStatus:
 691  0070 88            	push	a
 692  0071 88            	push	a
 693       00000001      OFST:	set	1
 696                     ; 309   FlagStatus status = RESET;
 698                     ; 312   assert_param(IS_AES_FLAG(AES_FLAG));
 700                     ; 314   if (AES_FLAG == AES_FLAG_CCF)
 702  0072 a101          	cp	a,#1
 703  0074 2611          	jrne	L713
 704                     ; 316     if ((AES->SR & (uint8_t)AES_FLAG_CCF) != (uint8_t)0x00)
 706  0076 c653d1        	ld	a,21457
 707  0079 a501          	bcp	a,#1
 708  007b 2706          	jreq	L123
 709                     ; 319       status = (FlagStatus) SET;
 711  007d a601          	ld	a,#1
 712  007f 6b01          	ld	(OFST+0,sp),a
 714  0081 202a          	jra	L523
 715  0083               L123:
 716                     ; 324       status = (FlagStatus) RESET;
 718  0083 0f01          	clr	(OFST+0,sp)
 719  0085 2026          	jra	L523
 720  0087               L713:
 721                     ; 327   else if (AES_FLAG == AES_FLAG_RDERR)
 723  0087 7b02          	ld	a,(OFST+1,sp)
 724  0089 a102          	cp	a,#2
 725  008b 2611          	jrne	L723
 726                     ; 329     if ((AES->SR & (uint8_t)AES_FLAG_RDERR) != (uint8_t)0x00)
 728  008d c653d1        	ld	a,21457
 729  0090 a502          	bcp	a,#2
 730  0092 2706          	jreq	L133
 731                     ; 332       status = (FlagStatus) SET;
 733  0094 a601          	ld	a,#1
 734  0096 6b01          	ld	(OFST+0,sp),a
 736  0098 2013          	jra	L523
 737  009a               L133:
 738                     ; 337       status = (FlagStatus) RESET;
 740  009a 0f01          	clr	(OFST+0,sp)
 741  009c 200f          	jra	L523
 742  009e               L723:
 743                     ; 342     if ((AES->SR & (uint8_t)AES_FLAG_WRERR) != (uint8_t)0x00)
 745  009e c653d1        	ld	a,21457
 746  00a1 a504          	bcp	a,#4
 747  00a3 2706          	jreq	L733
 748                     ; 345       status = (FlagStatus) SET;
 750  00a5 a601          	ld	a,#1
 751  00a7 6b01          	ld	(OFST+0,sp),a
 753  00a9 2002          	jra	L523
 754  00ab               L733:
 755                     ; 350       status = (FlagStatus) RESET;
 757  00ab 0f01          	clr	(OFST+0,sp)
 758  00ad               L523:
 759                     ; 354   return ((FlagStatus) status);
 761  00ad 7b01          	ld	a,(OFST+0,sp)
 764  00af 85            	popw	x
 765  00b0 81            	ret
 800                     ; 366 void AES_ClearFlag(AES_FLAG_TypeDef AES_FLAG)
 800                     ; 367 {
 801                     	switch	.text
 802  00b1               _AES_ClearFlag:
 806                     ; 369   assert_param(IS_AES_FLAG(AES_FLAG));
 808                     ; 372   if (AES_FLAG == AES_FLAG_CCF)
 810  00b1 a101          	cp	a,#1
 811  00b3 2606          	jrne	L163
 812                     ; 375     AES->CR |= (uint8_t) AES_CR_CCFC;
 814  00b5 721653d0      	bset	21456,#3
 816  00b9 2004          	jra	L363
 817  00bb               L163:
 818                     ; 380     AES->CR |= (uint8_t) AES_CR_ERRC;
 820  00bb 721853d0      	bset	21456,#4
 821  00bf               L363:
 822                     ; 382 }
 825  00bf 81            	ret
 891                     ; 392 ITStatus AES_GetITStatus(AES_IT_TypeDef AES_IT)
 891                     ; 393 {
 892                     	switch	.text
 893  00c0               _AES_GetITStatus:
 895  00c0 88            	push	a
 896  00c1 89            	pushw	x
 897       00000002      OFST:	set	2
 900                     ; 394   ITStatus itstatus = RESET;
 902                     ; 395   BitStatus cciebitstatus, ccfbitstatus = RESET;
 904                     ; 398   assert_param(IS_AES_IT(AES_IT));
 906                     ; 400   cciebitstatus = (BitStatus) (AES->CR & AES_CR_CCIE);
 908  00c2 c653d0        	ld	a,21456
 909  00c5 a420          	and	a,#32
 910  00c7 6b01          	ld	(OFST-1,sp),a
 911                     ; 401   ccfbitstatus =  (BitStatus) (AES->SR & AES_SR_CCF);
 913  00c9 c653d1        	ld	a,21457
 914  00cc a401          	and	a,#1
 915  00ce 6b02          	ld	(OFST+0,sp),a
 916                     ; 404   if (AES_IT == AES_IT_CCIE)
 918  00d0 7b03          	ld	a,(OFST+1,sp)
 919  00d2 a120          	cp	a,#32
 920  00d4 2612          	jrne	L714
 921                     ; 407     if (((cciebitstatus) != RESET) && ((ccfbitstatus) != RESET))
 923  00d6 0d01          	tnz	(OFST-1,sp)
 924  00d8 270a          	jreq	L124
 926  00da 0d02          	tnz	(OFST+0,sp)
 927  00dc 2706          	jreq	L124
 928                     ; 410       itstatus = (ITStatus) SET;
 930  00de a601          	ld	a,#1
 931  00e0 6b02          	ld	(OFST+0,sp),a
 933  00e2 201e          	jra	L524
 934  00e4               L124:
 935                     ; 415       itstatus = (ITStatus) RESET;
 937  00e4 0f02          	clr	(OFST+0,sp)
 938  00e6 201a          	jra	L524
 939  00e8               L714:
 940                     ; 421     if ((AES->CR & AES_CR_ERRIE) != RESET)
 942  00e8 c653d0        	ld	a,21456
 943  00eb a540          	bcp	a,#64
 944  00ed 2711          	jreq	L724
 945                     ; 424       if ((AES->SR & (uint8_t)(AES_SR_WRERR | AES_SR_RDERR)) != RESET)
 947  00ef c653d1        	ld	a,21457
 948  00f2 a506          	bcp	a,#6
 949  00f4 2706          	jreq	L134
 950                     ; 427         itstatus = (ITStatus) SET;
 952  00f6 a601          	ld	a,#1
 953  00f8 6b02          	ld	(OFST+0,sp),a
 955  00fa 2006          	jra	L524
 956  00fc               L134:
 957                     ; 432         itstatus = (ITStatus) RESET;
 959  00fc 0f02          	clr	(OFST+0,sp)
 960  00fe 2002          	jra	L524
 961  0100               L724:
 962                     ; 438       itstatus = (ITStatus) RESET;
 964  0100 0f02          	clr	(OFST+0,sp)
 965  0102               L524:
 966                     ; 443   return ((ITStatus)itstatus);
 968  0102 7b02          	ld	a,(OFST+0,sp)
 971  0104 5b03          	addw	sp,#3
 972  0106 81            	ret
1008                     ; 454 void AES_ClearITPendingBit(AES_IT_TypeDef AES_IT)
1008                     ; 455 {
1009                     	switch	.text
1010  0107               _AES_ClearITPendingBit:
1014                     ; 457   assert_param(IS_AES_IT(AES_IT));
1016                     ; 460   if (AES_IT == AES_IT_CCIE)
1018  0107 a120          	cp	a,#32
1019  0109 2606          	jrne	L554
1020                     ; 463     AES->CR |= (uint8_t) AES_CR_CCFC;
1022  010b 721653d0      	bset	21456,#3
1024  010f 2004          	jra	L754
1025  0111               L554:
1026                     ; 468     AES->CR |= (uint8_t) AES_CR_ERRC;
1028  0111 721853d0      	bset	21456,#4
1029  0115               L754:
1030                     ; 470 }
1033  0115 81            	ret
1046                     	xdef	_AES_ClearITPendingBit
1047                     	xdef	_AES_GetITStatus
1048                     	xdef	_AES_ClearFlag
1049                     	xdef	_AES_GetFlagStatus
1050                     	xdef	_AES_ITConfig
1051                     	xdef	_AES_DMAConfig
1052                     	xdef	_AES_ReadSubKey
1053                     	xdef	_AES_ReadSubData
1054                     	xdef	_AES_WriteSubKey
1055                     	xdef	_AES_WriteSubData
1056                     	xdef	_AES_Cmd
1057                     	xdef	_AES_OperationModeConfig
1058                     	xdef	_AES_DeInit
1077                     	end
