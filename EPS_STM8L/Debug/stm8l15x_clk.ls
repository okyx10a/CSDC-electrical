   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  15                     .const:	section	.text
  16  0000               _SYSDivFactor:
  17  0000 01            	dc.b	1
  18  0001 02            	dc.b	2
  19  0002 04            	dc.b	4
  20  0003 08            	dc.b	8
  21  0004 10            	dc.b	16
  50                     ; 120 void CLK_DeInit(void)
  50                     ; 121 {
  52                     	switch	.text
  53  0000               _CLK_DeInit:
  57                     ; 122   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  59  0000 351150c2      	mov	20674,#17
  60                     ; 123   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  62  0004 725f50c6      	clr	20678
  63                     ; 124   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  65  0008 725f50c1      	clr	20673
  66                     ; 125   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  68  000c 725f50cb      	clr	20683
  69                     ; 126   CLK->SWR  = CLK_SWR_RESET_VALUE;
  71  0010 350150c8      	mov	20680,#1
  72                     ; 127   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  74  0014 725f50c9      	clr	20681
  75                     ; 128   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  77  0018 350350c0      	mov	20672,#3
  78                     ; 129   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  80  001c 725f50c3      	clr	20675
  81                     ; 130   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  83  0020 358050c4      	mov	20676,#128
  84                     ; 131   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  86  0024 725f50d0      	clr	20688
  87                     ; 132   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  89  0028 725f50ca      	clr	20682
  90                     ; 133   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  92  002c 725f50c5      	clr	20677
  93                     ; 134   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  95  0030 725f50cd      	clr	20685
  96                     ; 135   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
  98  0034 725f50cc      	clr	20684
  99                     ; 136   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
 101  0038 725f50ce      	clr	20686
 102                     ; 137   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
 104  003c 35b950cf      	mov	20687,#185
 105                     ; 138 }
 108  0040 81            	ret
 163                     ; 160 void CLK_HSICmd(FunctionalState NewState)
 163                     ; 161 {
 164                     	switch	.text
 165  0041               _CLK_HSICmd:
 169                     ; 163   assert_param(IS_FUNCTIONAL_STATE(NewState));
 171                     ; 165   if (NewState != DISABLE)
 173  0041 4d            	tnz	a
 174  0042 2706          	jreq	L74
 175                     ; 168     CLK->ICKCR |= CLK_ICKCR_HSION;
 177  0044 721050c2      	bset	20674,#0
 179  0048 2004          	jra	L15
 180  004a               L74:
 181                     ; 173     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 183  004a 721150c2      	bres	20674,#0
 184  004e               L15:
 185                     ; 175 }
 188  004e 81            	ret
 224                     ; 188 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 224                     ; 189 {
 225                     	switch	.text
 226  004f               _CLK_AdjustHSICalibrationValue:
 230                     ; 191   CLK->HSIUNLCKR = 0xAC;
 232  004f 35ac50ce      	mov	20686,#172
 233                     ; 192   CLK->HSIUNLCKR = 0x35;
 235  0053 353550ce      	mov	20686,#53
 236                     ; 195   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 238  0057 c750cd        	ld	20685,a
 239                     ; 196 }
 242  005a 81            	ret
 277                     ; 212 void CLK_LSICmd(FunctionalState NewState)
 277                     ; 213 {
 278                     	switch	.text
 279  005b               _CLK_LSICmd:
 283                     ; 216   assert_param(IS_FUNCTIONAL_STATE(NewState));
 285                     ; 218   if (NewState != DISABLE)
 287  005b 4d            	tnz	a
 288  005c 2706          	jreq	L701
 289                     ; 221     CLK->ICKCR |= CLK_ICKCR_LSION;
 291  005e 721450c2      	bset	20674,#2
 293  0062 2004          	jra	L111
 294  0064               L701:
 295                     ; 226     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 297  0064 721550c2      	bres	20674,#2
 298  0068               L111:
 299                     ; 228 }
 302  0068 81            	ret
 364                     ; 249 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 364                     ; 250 {
 365                     	switch	.text
 366  0069               _CLK_HSEConfig:
 370                     ; 252   assert_param(IS_CLK_HSE(CLK_HSE));
 372                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 374  0069 721150c6      	bres	20678,#0
 375                     ; 259   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 377  006d 721950c6      	bres	20678,#4
 378                     ; 262   CLK->ECKCR |= (uint8_t)CLK_HSE;
 380  0071 ca50c6        	or	a,20678
 381  0074 c750c6        	ld	20678,a
 382                     ; 263 }
 385  0077 81            	ret
 447                     ; 280 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 447                     ; 281 {
 448                     	switch	.text
 449  0078               _CLK_LSEConfig:
 453                     ; 283   assert_param(IS_CLK_LSE(CLK_LSE));
 455                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 457  0078 721550c6      	bres	20678,#2
 458                     ; 290   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 460  007c 721b50c6      	bres	20678,#5
 461                     ; 293   CLK->ECKCR |= (uint8_t)CLK_LSE;
 463  0080 ca50c6        	or	a,20678
 464  0083 c750c6        	ld	20678,a
 465                     ; 295 }
 468  0086 81            	ret
 492                     ; 306 void CLK_ClockSecuritySystemEnable(void)
 492                     ; 307 {
 493                     	switch	.text
 494  0087               _CLK_ClockSecuritySystemEnable:
 498                     ; 309   CLK->CSSR |= CLK_CSSR_CSSEN;
 500  0087 721050ca      	bset	20682,#0
 501                     ; 310 }
 504  008b 81            	ret
 540                     ; 317 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 540                     ; 318 {
 541                     	switch	.text
 542  008c               _CLK_ClockSecuritySytemDeglitchCmd:
 546                     ; 320   assert_param(IS_FUNCTIONAL_STATE(NewState));
 548                     ; 322   if (NewState != DISABLE)
 550  008c 4d            	tnz	a
 551  008d 2706          	jreq	L122
 552                     ; 325     CLK->CSSR |= CLK_CSSR_CSSDGON;
 554  008f 721850ca      	bset	20682,#4
 556  0093 2004          	jra	L322
 557  0095               L122:
 558                     ; 330     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 560  0095 721950ca      	bres	20682,#4
 561  0099               L322:
 562                     ; 332 }
 565  0099 81            	ret
 706                     ; 356 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 706                     ; 357 {
 707                     	switch	.text
 708  009a               _CLK_CCOConfig:
 710  009a 89            	pushw	x
 711       00000000      OFST:	set	0
 714                     ; 359   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 716                     ; 360   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 718                     ; 363   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 720  009b 9f            	ld	a,xl
 721  009c 1a01          	or	a,(OFST+1,sp)
 722  009e c750c5        	ld	20677,a
 723                     ; 364 }
 726  00a1 85            	popw	x
 727  00a2 81            	ret
 801                     ; 416 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 801                     ; 417 {
 802                     	switch	.text
 803  00a3               _CLK_SYSCLKSourceConfig:
 807                     ; 419   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 809                     ; 422   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 811  00a3 c750c8        	ld	20680,a
 812                     ; 423 }
 815  00a6 81            	ret
 840                     ; 435 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 840                     ; 436 {
 841                     	switch	.text
 842  00a7               _CLK_GetSYSCLKSource:
 846                     ; 437   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 848  00a7 c650c7        	ld	a,20679
 851  00aa 81            	ret
 923                     ; 478 uint32_t CLK_GetClockFreq(void)
 923                     ; 479 {
 924                     	switch	.text
 925  00ab               _CLK_GetClockFreq:
 927  00ab 5209          	subw	sp,#9
 928       00000009      OFST:	set	9
 931                     ; 480   uint32_t clockfrequency = 0;
 933                     ; 481   uint32_t sourcefrequency = 0;
 935  00ad ae0000        	ldw	x,#0
 936  00b0 1f07          	ldw	(OFST-2,sp),x
 937  00b2 ae0000        	ldw	x,#0
 938  00b5 1f05          	ldw	(OFST-4,sp),x
 939                     ; 482   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 941                     ; 483   uint8_t tmp = 0, presc = 0;
 945                     ; 486   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 947  00b7 c650c7        	ld	a,20679
 948  00ba 6b09          	ld	(OFST+0,sp),a
 949                     ; 488   if ( clocksource == CLK_SYSCLKSource_HSI)
 951  00bc 7b09          	ld	a,(OFST+0,sp)
 952  00be a101          	cp	a,#1
 953  00c0 260c          	jrne	L704
 954                     ; 490     sourcefrequency = HSI_VALUE;
 956  00c2 ae2400        	ldw	x,#9216
 957  00c5 1f07          	ldw	(OFST-2,sp),x
 958  00c7 ae00f4        	ldw	x,#244
 959  00ca 1f05          	ldw	(OFST-4,sp),x
 961  00cc 2022          	jra	L114
 962  00ce               L704:
 963                     ; 492   else if ( clocksource == CLK_SYSCLKSource_LSI)
 965  00ce 7b09          	ld	a,(OFST+0,sp)
 966  00d0 a102          	cp	a,#2
 967  00d2 260c          	jrne	L314
 968                     ; 494     sourcefrequency = LSI_VALUE;
 970  00d4 ae9470        	ldw	x,#38000
 971  00d7 1f07          	ldw	(OFST-2,sp),x
 972  00d9 ae0000        	ldw	x,#0
 973  00dc 1f05          	ldw	(OFST-4,sp),x
 975  00de 2010          	jra	L114
 976  00e0               L314:
 977                     ; 496   else if ( clocksource == CLK_SYSCLKSource_HSE)
 979  00e0 7b09          	ld	a,(OFST+0,sp)
 980  00e2 a104          	cp	a,#4
 981  00e4 260a          	jrne	L714
 982                     ; 498     sourcefrequency = HSE_VALUE;
 984  00e6 ae2400        	ldw	x,#9216
 985  00e9 1f07          	ldw	(OFST-2,sp),x
 986  00eb ae00f4        	ldw	x,#244
 987  00ee 1f05          	ldw	(OFST-4,sp),x
 989  00f0               L714:
 990                     ; 502     clockfrequency = LSE_VALUE;
 992  00f0               L114:
 993                     ; 506   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 995  00f0 c650c0        	ld	a,20672
 996  00f3 a407          	and	a,#7
 997  00f5 6b09          	ld	(OFST+0,sp),a
 998                     ; 507   presc = SYSDivFactor[tmp];
1000  00f7 7b09          	ld	a,(OFST+0,sp)
1001  00f9 5f            	clrw	x
1002  00fa 97            	ld	xl,a
1003  00fb d60000        	ld	a,(_SYSDivFactor,x)
1004  00fe 6b09          	ld	(OFST+0,sp),a
1005                     ; 510   clockfrequency = sourcefrequency / presc;
1007  0100 7b09          	ld	a,(OFST+0,sp)
1008  0102 b703          	ld	c_lreg+3,a
1009  0104 3f02          	clr	c_lreg+2
1010  0106 3f01          	clr	c_lreg+1
1011  0108 3f00          	clr	c_lreg
1012  010a 96            	ldw	x,sp
1013  010b 1c0001        	addw	x,#OFST-8
1014  010e cd0000        	call	c_rtol
1016  0111 96            	ldw	x,sp
1017  0112 1c0005        	addw	x,#OFST-4
1018  0115 cd0000        	call	c_ltor
1020  0118 96            	ldw	x,sp
1021  0119 1c0001        	addw	x,#OFST-8
1022  011c cd0000        	call	c_ludv
1024  011f 96            	ldw	x,sp
1025  0120 1c0005        	addw	x,#OFST-4
1026  0123 cd0000        	call	c_rtol
1028                     ; 512   return((uint32_t)clockfrequency);
1030  0126 96            	ldw	x,sp
1031  0127 1c0005        	addw	x,#OFST-4
1032  012a cd0000        	call	c_ltor
1036  012d 5b09          	addw	sp,#9
1037  012f 81            	ret
1135                     ; 528 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1135                     ; 529 {
1136                     	switch	.text
1137  0130               _CLK_SYSCLKDivConfig:
1141                     ; 531   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1143                     ; 533   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1145  0130 c750c0        	ld	20672,a
1146                     ; 534 }
1149  0133 81            	ret
1185                     ; 541 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1185                     ; 542 {
1186                     	switch	.text
1187  0134               _CLK_SYSCLKSourceSwitchCmd:
1191                     ; 544   assert_param(IS_FUNCTIONAL_STATE(NewState));
1193                     ; 546   if (NewState != DISABLE)
1195  0134 4d            	tnz	a
1196  0135 2706          	jreq	L305
1197                     ; 549     CLK->SWCR |= CLK_SWCR_SWEN;
1199  0137 721250c9      	bset	20681,#1
1201  013b 2004          	jra	L505
1202  013d               L305:
1203                     ; 554     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1205  013d 721350c9      	bres	20681,#1
1206  0141               L505:
1207                     ; 556 }
1210  0141 81            	ret
1356                     ; 616 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1356                     ; 617 {
1357                     	switch	.text
1358  0142               _CLK_RTCClockConfig:
1360  0142 89            	pushw	x
1361       00000000      OFST:	set	0
1364                     ; 619   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1366                     ; 620   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1368                     ; 623   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1370  0143 9f            	ld	a,xl
1371  0144 1a01          	or	a,(OFST+1,sp)
1372  0146 c750c1        	ld	20673,a
1373                     ; 624 }
1376  0149 85            	popw	x
1377  014a 81            	ret
1443                     ; 635 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1443                     ; 636 {
1444                     	switch	.text
1445  014b               _CLK_BEEPClockConfig:
1449                     ; 638   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1451                     ; 641   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1453  014b c750cb        	ld	20683,a
1454                     ; 643 }
1457  014e 81            	ret
1682                     ; 677 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1682                     ; 678 {
1683                     	switch	.text
1684  014f               _CLK_PeripheralClockConfig:
1686  014f 89            	pushw	x
1687  0150 88            	push	a
1688       00000001      OFST:	set	1
1691                     ; 679   uint8_t reg = 0;
1693                     ; 682   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1695                     ; 683   assert_param(IS_FUNCTIONAL_STATE(NewState));
1697                     ; 686   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1699  0151 9e            	ld	a,xh
1700  0152 a4f0          	and	a,#240
1701  0154 6b01          	ld	(OFST+0,sp),a
1702                     ; 688   if ( reg == 0x00)
1704  0156 0d01          	tnz	(OFST+0,sp)
1705  0158 2635          	jrne	L527
1706                     ; 690     if (NewState != DISABLE)
1708  015a 0d03          	tnz	(OFST+2,sp)
1709  015c 2719          	jreq	L727
1710                     ; 693       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1712  015e 7b02          	ld	a,(OFST+1,sp)
1713  0160 a40f          	and	a,#15
1714  0162 5f            	clrw	x
1715  0163 97            	ld	xl,a
1716  0164 a601          	ld	a,#1
1717  0166 5d            	tnzw	x
1718  0167 2704          	jreq	L64
1719  0169               L05:
1720  0169 48            	sll	a
1721  016a 5a            	decw	x
1722  016b 26fc          	jrne	L05
1723  016d               L64:
1724  016d ca50c3        	or	a,20675
1725  0170 c750c3        	ld	20675,a
1727  0173 acf901f9      	jpf	L337
1728  0177               L727:
1729                     ; 698       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1731  0177 7b02          	ld	a,(OFST+1,sp)
1732  0179 a40f          	and	a,#15
1733  017b 5f            	clrw	x
1734  017c 97            	ld	xl,a
1735  017d a601          	ld	a,#1
1736  017f 5d            	tnzw	x
1737  0180 2704          	jreq	L25
1738  0182               L45:
1739  0182 48            	sll	a
1740  0183 5a            	decw	x
1741  0184 26fc          	jrne	L45
1742  0186               L25:
1743  0186 43            	cpl	a
1744  0187 c450c3        	and	a,20675
1745  018a c750c3        	ld	20675,a
1746  018d 206a          	jra	L337
1747  018f               L527:
1748                     ; 701   else if (reg == 0x10)
1750  018f 7b01          	ld	a,(OFST+0,sp)
1751  0191 a110          	cp	a,#16
1752  0193 2633          	jrne	L537
1753                     ; 703     if (NewState != DISABLE)
1755  0195 0d03          	tnz	(OFST+2,sp)
1756  0197 2717          	jreq	L737
1757                     ; 706       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1759  0199 7b02          	ld	a,(OFST+1,sp)
1760  019b a40f          	and	a,#15
1761  019d 5f            	clrw	x
1762  019e 97            	ld	xl,a
1763  019f a601          	ld	a,#1
1764  01a1 5d            	tnzw	x
1765  01a2 2704          	jreq	L65
1766  01a4               L06:
1767  01a4 48            	sll	a
1768  01a5 5a            	decw	x
1769  01a6 26fc          	jrne	L06
1770  01a8               L65:
1771  01a8 ca50c4        	or	a,20676
1772  01ab c750c4        	ld	20676,a
1774  01ae 2049          	jra	L337
1775  01b0               L737:
1776                     ; 711       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1778  01b0 7b02          	ld	a,(OFST+1,sp)
1779  01b2 a40f          	and	a,#15
1780  01b4 5f            	clrw	x
1781  01b5 97            	ld	xl,a
1782  01b6 a601          	ld	a,#1
1783  01b8 5d            	tnzw	x
1784  01b9 2704          	jreq	L26
1785  01bb               L46:
1786  01bb 48            	sll	a
1787  01bc 5a            	decw	x
1788  01bd 26fc          	jrne	L46
1789  01bf               L26:
1790  01bf 43            	cpl	a
1791  01c0 c450c4        	and	a,20676
1792  01c3 c750c4        	ld	20676,a
1793  01c6 2031          	jra	L337
1794  01c8               L537:
1795                     ; 716     if (NewState != DISABLE)
1797  01c8 0d03          	tnz	(OFST+2,sp)
1798  01ca 2717          	jreq	L547
1799                     ; 719       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1801  01cc 7b02          	ld	a,(OFST+1,sp)
1802  01ce a40f          	and	a,#15
1803  01d0 5f            	clrw	x
1804  01d1 97            	ld	xl,a
1805  01d2 a601          	ld	a,#1
1806  01d4 5d            	tnzw	x
1807  01d5 2704          	jreq	L66
1808  01d7               L07:
1809  01d7 48            	sll	a
1810  01d8 5a            	decw	x
1811  01d9 26fc          	jrne	L07
1812  01db               L66:
1813  01db ca50d0        	or	a,20688
1814  01de c750d0        	ld	20688,a
1816  01e1 2016          	jra	L337
1817  01e3               L547:
1818                     ; 724       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1820  01e3 7b02          	ld	a,(OFST+1,sp)
1821  01e5 a40f          	and	a,#15
1822  01e7 5f            	clrw	x
1823  01e8 97            	ld	xl,a
1824  01e9 a601          	ld	a,#1
1825  01eb 5d            	tnzw	x
1826  01ec 2704          	jreq	L27
1827  01ee               L47:
1828  01ee 48            	sll	a
1829  01ef 5a            	decw	x
1830  01f0 26fc          	jrne	L47
1831  01f2               L27:
1832  01f2 43            	cpl	a
1833  01f3 c450d0        	and	a,20688
1834  01f6 c750d0        	ld	20688,a
1835  01f9               L337:
1836                     ; 727 }
1839  01f9 5b03          	addw	sp,#3
1840  01fb 81            	ret
1864                     ; 765 void CLK_LSEClockSecuritySystemEnable(void)
1864                     ; 766 {
1865                     	switch	.text
1866  01fc               _CLK_LSEClockSecuritySystemEnable:
1870                     ; 768   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1872  01fc 72105190      	bset	20880,#0
1873                     ; 769 }
1876  0200 81            	ret
1900                     ; 777 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1900                     ; 778 {
1901                     	switch	.text
1902  0201               _CLK_RTCCLKSwitchOnLSEFailureEnable:
1906                     ; 780   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1908  0201 72125190      	bset	20880,#1
1909                     ; 781 }
1912  0205 81            	ret
1987                     ; 807 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1987                     ; 808 {
1988                     	switch	.text
1989  0206               _CLK_HaltConfig:
1991  0206 89            	pushw	x
1992       00000000      OFST:	set	0
1995                     ; 810   assert_param(IS_CLK_HALT(CLK_Halt));
1997                     ; 811   assert_param(IS_FUNCTIONAL_STATE(NewState));
1999                     ; 813   if (NewState != DISABLE)
2001  0207 9f            	ld	a,xl
2002  0208 4d            	tnz	a
2003  0209 2709          	jreq	L5201
2004                     ; 815     CLK->ICKCR |= (uint8_t)(CLK_Halt);
2006  020b 9e            	ld	a,xh
2007  020c ca50c2        	or	a,20674
2008  020f c750c2        	ld	20674,a
2010  0212 2009          	jra	L7201
2011  0214               L5201:
2012                     ; 819     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
2014  0214 7b01          	ld	a,(OFST+1,sp)
2015  0216 43            	cpl	a
2016  0217 c450c2        	and	a,20674
2017  021a c750c2        	ld	20674,a
2018  021d               L7201:
2019                     ; 821 }
2022  021d 85            	popw	x
2023  021e 81            	ret
2059                     ; 831 void CLK_MainRegulatorCmd(FunctionalState NewState)
2059                     ; 832 {
2060                     	switch	.text
2061  021f               _CLK_MainRegulatorCmd:
2065                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2067                     ; 836   if (NewState != DISABLE)
2069  021f 4d            	tnz	a
2070  0220 2706          	jreq	L7401
2071                     ; 839     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2073  0222 721350cf      	bres	20687,#1
2075  0226 2004          	jra	L1501
2076  0228               L7401:
2077                     ; 844     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2079  0228 721250cf      	bset	20687,#1
2080  022c               L1501:
2081                     ; 846 }
2084  022c 81            	ret
2156                     ; 875 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2156                     ; 876 {
2157                     	switch	.text
2158  022d               _CLK_ITConfig:
2160  022d 89            	pushw	x
2161       00000000      OFST:	set	0
2164                     ; 879   assert_param(IS_CLK_IT(CLK_IT));
2166                     ; 880   assert_param(IS_FUNCTIONAL_STATE(NewState));
2168                     ; 882   if (NewState != DISABLE)
2170  022e 9f            	ld	a,xl
2171  022f 4d            	tnz	a
2172  0230 271d          	jreq	L7011
2173                     ; 884     if (CLK_IT == CLK_IT_SWIF)
2175  0232 9e            	ld	a,xh
2176  0233 a11c          	cp	a,#28
2177  0235 2606          	jrne	L1111
2178                     ; 887       CLK->SWCR |= CLK_SWCR_SWIEN;
2180  0237 721450c9      	bset	20681,#2
2182  023b 202e          	jra	L1211
2183  023d               L1111:
2184                     ; 889     else if (CLK_IT == CLK_IT_LSECSSF)
2186  023d 7b01          	ld	a,(OFST+1,sp)
2187  023f a12c          	cp	a,#44
2188  0241 2606          	jrne	L5111
2189                     ; 892       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2191  0243 72145190      	bset	20880,#2
2193  0247 2022          	jra	L1211
2194  0249               L5111:
2195                     ; 897       CLK->CSSR |= CLK_CSSR_CSSDIE;
2197  0249 721450ca      	bset	20682,#2
2198  024d 201c          	jra	L1211
2199  024f               L7011:
2200                     ; 902     if (CLK_IT == CLK_IT_SWIF)
2202  024f 7b01          	ld	a,(OFST+1,sp)
2203  0251 a11c          	cp	a,#28
2204  0253 2606          	jrne	L3211
2205                     ; 905       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2207  0255 721550c9      	bres	20681,#2
2209  0259 2010          	jra	L1211
2210  025b               L3211:
2211                     ; 907     else if (CLK_IT == CLK_IT_LSECSSF)
2213  025b 7b01          	ld	a,(OFST+1,sp)
2214  025d a12c          	cp	a,#44
2215  025f 2606          	jrne	L7211
2216                     ; 910       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2218  0261 72155190      	bres	20880,#2
2220  0265 2004          	jra	L1211
2221  0267               L7211:
2222                     ; 915       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2224  0267 721550ca      	bres	20682,#2
2225  026b               L1211:
2226                     ; 918 }
2229  026b 85            	popw	x
2230  026c 81            	ret
2453                     ; 945 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2453                     ; 946 {
2454                     	switch	.text
2455  026d               _CLK_GetFlagStatus:
2457  026d 88            	push	a
2458  026e 89            	pushw	x
2459       00000002      OFST:	set	2
2462                     ; 947   uint8_t reg = 0;
2464                     ; 948   uint8_t pos = 0;
2466                     ; 949   FlagStatus bitstatus = RESET;
2468                     ; 952   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2470                     ; 955   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2472  026f a4f0          	and	a,#240
2473  0271 6b02          	ld	(OFST+0,sp),a
2474                     ; 958   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2476  0273 7b03          	ld	a,(OFST+1,sp)
2477  0275 a40f          	and	a,#15
2478  0277 6b01          	ld	(OFST-1,sp),a
2479                     ; 960   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2481  0279 0d02          	tnz	(OFST+0,sp)
2482  027b 2607          	jrne	L7421
2483                     ; 962     reg = CLK->CRTCR;
2485  027d c650c1        	ld	a,20673
2486  0280 6b02          	ld	(OFST+0,sp),a
2488  0282 2060          	jra	L1521
2489  0284               L7421:
2490                     ; 964   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2492  0284 7b02          	ld	a,(OFST+0,sp)
2493  0286 a110          	cp	a,#16
2494  0288 2607          	jrne	L3521
2495                     ; 966     reg = CLK->ICKCR;
2497  028a c650c2        	ld	a,20674
2498  028d 6b02          	ld	(OFST+0,sp),a
2500  028f 2053          	jra	L1521
2501  0291               L3521:
2502                     ; 968   else if (reg == 0x20) /* The flag to check is in CCOR register */
2504  0291 7b02          	ld	a,(OFST+0,sp)
2505  0293 a120          	cp	a,#32
2506  0295 2607          	jrne	L7521
2507                     ; 970     reg = CLK->CCOR;
2509  0297 c650c5        	ld	a,20677
2510  029a 6b02          	ld	(OFST+0,sp),a
2512  029c 2046          	jra	L1521
2513  029e               L7521:
2514                     ; 972   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2516  029e 7b02          	ld	a,(OFST+0,sp)
2517  02a0 a130          	cp	a,#48
2518  02a2 2607          	jrne	L3621
2519                     ; 974     reg = CLK->ECKCR;
2521  02a4 c650c6        	ld	a,20678
2522  02a7 6b02          	ld	(OFST+0,sp),a
2524  02a9 2039          	jra	L1521
2525  02ab               L3621:
2526                     ; 976   else if (reg == 0x40) /* The flag to check is in SWCR register */
2528  02ab 7b02          	ld	a,(OFST+0,sp)
2529  02ad a140          	cp	a,#64
2530  02af 2607          	jrne	L7621
2531                     ; 978     reg = CLK->SWCR;
2533  02b1 c650c9        	ld	a,20681
2534  02b4 6b02          	ld	(OFST+0,sp),a
2536  02b6 202c          	jra	L1521
2537  02b8               L7621:
2538                     ; 980   else if (reg == 0x50) /* The flag to check is in CSSR register */
2540  02b8 7b02          	ld	a,(OFST+0,sp)
2541  02ba a150          	cp	a,#80
2542  02bc 2607          	jrne	L3721
2543                     ; 982     reg = CLK->CSSR;
2545  02be c650ca        	ld	a,20682
2546  02c1 6b02          	ld	(OFST+0,sp),a
2548  02c3 201f          	jra	L1521
2549  02c5               L3721:
2550                     ; 984   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2552  02c5 7b02          	ld	a,(OFST+0,sp)
2553  02c7 a170          	cp	a,#112
2554  02c9 2607          	jrne	L7721
2555                     ; 986     reg = CLK->REGCSR;
2557  02cb c650cf        	ld	a,20687
2558  02ce 6b02          	ld	(OFST+0,sp),a
2560  02d0 2012          	jra	L1521
2561  02d2               L7721:
2562                     ; 988   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2564  02d2 7b02          	ld	a,(OFST+0,sp)
2565  02d4 a180          	cp	a,#128
2566  02d6 2607          	jrne	L3031
2567                     ; 990     reg = CSSLSE->CSR;
2569  02d8 c65190        	ld	a,20880
2570  02db 6b02          	ld	(OFST+0,sp),a
2572  02dd 2005          	jra	L1521
2573  02df               L3031:
2574                     ; 994     reg = CLK->CBEEPR;
2576  02df c650cb        	ld	a,20683
2577  02e2 6b02          	ld	(OFST+0,sp),a
2578  02e4               L1521:
2579                     ; 998   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2581  02e4 7b01          	ld	a,(OFST-1,sp)
2582  02e6 5f            	clrw	x
2583  02e7 97            	ld	xl,a
2584  02e8 a601          	ld	a,#1
2585  02ea 5d            	tnzw	x
2586  02eb 2704          	jreq	L211
2587  02ed               L411:
2588  02ed 48            	sll	a
2589  02ee 5a            	decw	x
2590  02ef 26fc          	jrne	L411
2591  02f1               L211:
2592  02f1 1402          	and	a,(OFST+0,sp)
2593  02f3 2706          	jreq	L7031
2594                     ; 1000     bitstatus = SET;
2596  02f5 a601          	ld	a,#1
2597  02f7 6b02          	ld	(OFST+0,sp),a
2599  02f9 2002          	jra	L1131
2600  02fb               L7031:
2601                     ; 1004     bitstatus = RESET;
2603  02fb 0f02          	clr	(OFST+0,sp)
2604  02fd               L1131:
2605                     ; 1008   return((FlagStatus)bitstatus);
2607  02fd 7b02          	ld	a,(OFST+0,sp)
2610  02ff 5b03          	addw	sp,#3
2611  0301 81            	ret
2634                     ; 1016 void CLK_ClearFlag(void)
2634                     ; 1017 {
2635                     	switch	.text
2636  0302               _CLK_ClearFlag:
2640                     ; 1020   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2642  0302 72175190      	bres	20880,#3
2643                     ; 1021 }
2646  0306 81            	ret
2692                     ; 1032 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2692                     ; 1033 {
2693                     	switch	.text
2694  0307               _CLK_GetITStatus:
2696  0307 88            	push	a
2697  0308 88            	push	a
2698       00000001      OFST:	set	1
2701                     ; 1035   ITStatus bitstatus = RESET;
2703                     ; 1038   assert_param(IS_CLK_IT(CLK_IT));
2705                     ; 1040   if (CLK_IT == CLK_IT_SWIF)
2707  0309 a11c          	cp	a,#28
2708  030b 2611          	jrne	L5431
2709                     ; 1043     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2711  030d c450c9        	and	a,20681
2712  0310 a10c          	cp	a,#12
2713  0312 2606          	jrne	L7431
2714                     ; 1045       bitstatus = SET;
2716  0314 a601          	ld	a,#1
2717  0316 6b01          	ld	(OFST+0,sp),a
2719  0318 202e          	jra	L3531
2720  031a               L7431:
2721                     ; 1049       bitstatus = RESET;
2723  031a 0f01          	clr	(OFST+0,sp)
2724  031c 202a          	jra	L3531
2725  031e               L5431:
2726                     ; 1052   else if (CLK_IT == CLK_IT_LSECSSF)
2728  031e 7b02          	ld	a,(OFST+1,sp)
2729  0320 a12c          	cp	a,#44
2730  0322 2613          	jrne	L5531
2731                     ; 1055     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2733  0324 c65190        	ld	a,20880
2734  0327 1402          	and	a,(OFST+1,sp)
2735  0329 a10c          	cp	a,#12
2736  032b 2606          	jrne	L7531
2737                     ; 1057       bitstatus = SET;
2739  032d a601          	ld	a,#1
2740  032f 6b01          	ld	(OFST+0,sp),a
2742  0331 2015          	jra	L3531
2743  0333               L7531:
2744                     ; 1061       bitstatus = RESET;
2746  0333 0f01          	clr	(OFST+0,sp)
2747  0335 2011          	jra	L3531
2748  0337               L5531:
2749                     ; 1067     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2751  0337 c650ca        	ld	a,20682
2752  033a 1402          	and	a,(OFST+1,sp)
2753  033c a10c          	cp	a,#12
2754  033e 2606          	jrne	L5631
2755                     ; 1069       bitstatus = SET;
2757  0340 a601          	ld	a,#1
2758  0342 6b01          	ld	(OFST+0,sp),a
2760  0344 2002          	jra	L3531
2761  0346               L5631:
2762                     ; 1073       bitstatus = RESET;
2764  0346 0f01          	clr	(OFST+0,sp)
2765  0348               L3531:
2766                     ; 1078   return bitstatus;
2768  0348 7b01          	ld	a,(OFST+0,sp)
2771  034a 85            	popw	x
2772  034b 81            	ret
2808                     ; 1089 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2808                     ; 1090 {
2809                     	switch	.text
2810  034c               _CLK_ClearITPendingBit:
2814                     ; 1093   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2816                     ; 1095   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2818  034c a4f0          	and	a,#240
2819  034e a120          	cp	a,#32
2820  0350 2606          	jrne	L7041
2821                     ; 1098     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2823  0352 72175190      	bres	20880,#3
2825  0356 2004          	jra	L1141
2826  0358               L7041:
2827                     ; 1103     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2829  0358 721750c9      	bres	20681,#3
2830  035c               L1141:
2831                     ; 1105 }
2834  035c 81            	ret
2859                     	xdef	_SYSDivFactor
2860                     	xdef	_CLK_ClearITPendingBit
2861                     	xdef	_CLK_GetITStatus
2862                     	xdef	_CLK_ClearFlag
2863                     	xdef	_CLK_GetFlagStatus
2864                     	xdef	_CLK_ITConfig
2865                     	xdef	_CLK_MainRegulatorCmd
2866                     	xdef	_CLK_HaltConfig
2867                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
2868                     	xdef	_CLK_LSEClockSecuritySystemEnable
2869                     	xdef	_CLK_PeripheralClockConfig
2870                     	xdef	_CLK_BEEPClockConfig
2871                     	xdef	_CLK_RTCClockConfig
2872                     	xdef	_CLK_SYSCLKSourceSwitchCmd
2873                     	xdef	_CLK_SYSCLKDivConfig
2874                     	xdef	_CLK_GetClockFreq
2875                     	xdef	_CLK_GetSYSCLKSource
2876                     	xdef	_CLK_SYSCLKSourceConfig
2877                     	xdef	_CLK_CCOConfig
2878                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
2879                     	xdef	_CLK_ClockSecuritySystemEnable
2880                     	xdef	_CLK_LSEConfig
2881                     	xdef	_CLK_HSEConfig
2882                     	xdef	_CLK_LSICmd
2883                     	xdef	_CLK_AdjustHSICalibrationValue
2884                     	xdef	_CLK_HSICmd
2885                     	xdef	_CLK_DeInit
2886                     	xref.b	c_lreg
2887                     	xref.b	c_x
2906                     	xref	c_ludv
2907                     	xref	c_rtol
2908                     	xref	c_ltor
2909                     	end
