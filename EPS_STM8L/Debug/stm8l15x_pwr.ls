   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  43                     ; 82 void PWR_DeInit(void)
  43                     ; 83 {
  45                     	switch	.text
  46  0000               _PWR_DeInit:
  50                     ; 84   PWR->CSR1 = PWR_CSR1_PVDIF;
  52  0000 352050b2      	mov	20658,#32
  53                     ; 85   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
  55  0004 725f50b3      	clr	20659
  56                     ; 86 }
  59  0008 81            	ret
 156                     ; 102 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
 156                     ; 103 {
 157                     	switch	.text
 158  0009               _PWR_PVDLevelConfig:
 160  0009 88            	push	a
 161       00000000      OFST:	set	0
 164                     ; 105   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
 166                     ; 108   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
 168  000a c650b2        	ld	a,20658
 169  000d a4f1          	and	a,#241
 170  000f c750b2        	ld	20658,a
 171                     ; 111   PWR->CSR1 |= PWR_PVDLevel;
 173  0012 c650b2        	ld	a,20658
 174  0015 1a01          	or	a,(OFST+1,sp)
 175  0017 c750b2        	ld	20658,a
 176                     ; 113 }
 179  001a 84            	pop	a
 180  001b 81            	ret
 235                     ; 121 void PWR_PVDCmd(FunctionalState NewState)
 235                     ; 122 {
 236                     	switch	.text
 237  001c               _PWR_PVDCmd:
 241                     ; 124   assert_param(IS_FUNCTIONAL_STATE(NewState));
 243                     ; 126   if (NewState != DISABLE)
 245  001c 4d            	tnz	a
 246  001d 2706          	jreq	L111
 247                     ; 129     PWR->CSR1 |= PWR_CSR1_PVDE;
 249  001f 721050b2      	bset	20658,#0
 251  0023 2004          	jra	L311
 252  0025               L111:
 253                     ; 134     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
 255  0025 721150b2      	bres	20658,#0
 256  0029               L311:
 257                     ; 136 }
 260  0029 81            	ret
 295                     ; 171 void PWR_FastWakeUpCmd(FunctionalState NewState)
 295                     ; 172 {
 296                     	switch	.text
 297  002a               _PWR_FastWakeUpCmd:
 301                     ; 174   assert_param(IS_FUNCTIONAL_STATE(NewState));
 303                     ; 176   if (NewState != DISABLE)
 305  002a 4d            	tnz	a
 306  002b 2706          	jreq	L331
 307                     ; 179     PWR->CSR2 |= PWR_CSR2_FWU;
 309  002d 721450b3      	bset	20659,#2
 311  0031 2004          	jra	L531
 312  0033               L331:
 313                     ; 184     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
 315  0033 721550b3      	bres	20659,#2
 316  0037               L531:
 317                     ; 186 }
 320  0037 81            	ret
 356                     ; 194 void PWR_UltraLowPowerCmd(FunctionalState NewState)
 356                     ; 195 {
 357                     	switch	.text
 358  0038               _PWR_UltraLowPowerCmd:
 362                     ; 197   assert_param(IS_FUNCTIONAL_STATE(NewState));
 364                     ; 199   if (NewState != DISABLE)
 366  0038 4d            	tnz	a
 367  0039 2706          	jreq	L551
 368                     ; 202     PWR->CSR2 |= PWR_CSR2_ULP;
 370  003b 721250b3      	bset	20659,#1
 372  003f 2004          	jra	L751
 373  0041               L551:
 374                     ; 207     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
 376  0041 721350b3      	bres	20659,#1
 377  0045               L751:
 378                     ; 209 }
 381  0045 81            	ret
 416                     ; 232 void PWR_PVDITConfig(FunctionalState NewState)
 416                     ; 233 {
 417                     	switch	.text
 418  0046               _PWR_PVDITConfig:
 422                     ; 235   assert_param(IS_FUNCTIONAL_STATE(NewState));
 424                     ; 237   if (NewState != DISABLE)
 426  0046 4d            	tnz	a
 427  0047 2706          	jreq	L771
 428                     ; 240     PWR->CSR1 |= PWR_CSR1_PVDIEN;
 430  0049 721850b2      	bset	20658,#4
 432  004d 2004          	jra	L102
 433  004f               L771:
 434                     ; 245     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
 436  004f 721950b2      	bres	20658,#4
 437  0053               L102:
 438                     ; 247 }
 441  0053 81            	ret
 534                     ; 261 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
 534                     ; 262 {
 535                     	switch	.text
 536  0054               _PWR_GetFlagStatus:
 538  0054 88            	push	a
 539  0055 88            	push	a
 540       00000001      OFST:	set	1
 543                     ; 263   FlagStatus bitstatus = RESET;
 545                     ; 266   assert_param(IS_PWR_FLAG(PWR_FLAG));
 547                     ; 268   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
 549  0056 a501          	bcp	a,#1
 550  0058 2711          	jreq	L742
 551                     ; 270     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
 553  005a c650b3        	ld	a,20659
 554  005d a501          	bcp	a,#1
 555  005f 2706          	jreq	L152
 556                     ; 272       bitstatus = SET;
 558  0061 a601          	ld	a,#1
 559  0063 6b01          	ld	(OFST+0,sp),a
 561  0065 2013          	jra	L552
 562  0067               L152:
 563                     ; 276       bitstatus = RESET;
 565  0067 0f01          	clr	(OFST+0,sp)
 566  0069 200f          	jra	L552
 567  006b               L742:
 568                     ; 281     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
 570  006b c650b2        	ld	a,20658
 571  006e 1502          	bcp	a,(OFST+1,sp)
 572  0070 2706          	jreq	L752
 573                     ; 283       bitstatus = SET;
 575  0072 a601          	ld	a,#1
 576  0074 6b01          	ld	(OFST+0,sp),a
 578  0076 2002          	jra	L552
 579  0078               L752:
 580                     ; 287       bitstatus = RESET;
 582  0078 0f01          	clr	(OFST+0,sp)
 583  007a               L552:
 584                     ; 292   return((FlagStatus)bitstatus);
 586  007a 7b01          	ld	a,(OFST+0,sp)
 589  007c 85            	popw	x
 590  007d 81            	ret
 613                     ; 300 void PWR_PVDClearFlag(void)
 613                     ; 301 {
 614                     	switch	.text
 615  007e               _PWR_PVDClearFlag:
 619                     ; 303   PWR->CSR1 |= PWR_CSR1_PVDIF;
 621  007e 721a50b2      	bset	20658,#5
 622                     ; 304 }
 625  0082 81            	ret
 679                     ; 311 ITStatus PWR_PVDGetITStatus(void)
 679                     ; 312 {
 680                     	switch	.text
 681  0083               _PWR_PVDGetITStatus:
 683  0083 89            	pushw	x
 684       00000002      OFST:	set	2
 687                     ; 313   ITStatus bitstatus = RESET;
 689                     ; 315   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
 693                     ; 317   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
 695  0084 c650b2        	ld	a,20658
 696  0087 a420          	and	a,#32
 697  0089 6b01          	ld	(OFST-1,sp),a
 698                     ; 318   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
 700  008b c650b2        	ld	a,20658
 701  008e a410          	and	a,#16
 702  0090 6b02          	ld	(OFST+0,sp),a
 703                     ; 320   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
 705  0092 0d01          	tnz	(OFST-1,sp)
 706  0094 270a          	jreq	L123
 708  0096 0d02          	tnz	(OFST+0,sp)
 709  0098 2706          	jreq	L123
 710                     ; 322     bitstatus = (ITStatus)SET;
 712  009a a601          	ld	a,#1
 713  009c 6b02          	ld	(OFST+0,sp),a
 715  009e 2002          	jra	L323
 716  00a0               L123:
 717                     ; 326     bitstatus = (ITStatus)RESET;
 719  00a0 0f02          	clr	(OFST+0,sp)
 720  00a2               L323:
 721                     ; 328   return ((ITStatus)bitstatus);
 723  00a2 7b02          	ld	a,(OFST+0,sp)
 726  00a4 85            	popw	x
 727  00a5 81            	ret
 751                     ; 336 void PWR_PVDClearITPendingBit(void)
 751                     ; 337 {
 752                     	switch	.text
 753  00a6               _PWR_PVDClearITPendingBit:
 757                     ; 339   PWR->CSR1 |= PWR_CSR1_PVDIF;
 759  00a6 721a50b2      	bset	20658,#5
 760                     ; 340 }
 763  00aa 81            	ret
 776                     	xdef	_PWR_PVDClearITPendingBit
 777                     	xdef	_PWR_PVDClearFlag
 778                     	xdef	_PWR_GetFlagStatus
 779                     	xdef	_PWR_PVDGetITStatus
 780                     	xdef	_PWR_PVDITConfig
 781                     	xdef	_PWR_UltraLowPowerCmd
 782                     	xdef	_PWR_FastWakeUpCmd
 783                     	xdef	_PWR_PVDCmd
 784                     	xdef	_PWR_PVDLevelConfig
 785                     	xdef	_PWR_DeInit
 804                     	end
