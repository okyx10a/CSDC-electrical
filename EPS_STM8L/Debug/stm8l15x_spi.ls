   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
 136                     ; 128 void SPI_DeInit(SPI_TypeDef* SPIx)
 136                     ; 129 {
 138                     	switch	.text
 139  0000               _SPI_DeInit:
 143                     ; 130   SPIx->CR1    = SPI_CR1_RESET_VALUE;
 145  0000 7f            	clr	(x)
 146                     ; 131   SPIx->CR2    = SPI_CR2_RESET_VALUE;
 148  0001 6f01          	clr	(1,x)
 149                     ; 132   SPIx->CR3    = SPI_CR3_RESET_VALUE;
 151  0003 6f02          	clr	(2,x)
 152                     ; 133   SPIx->SR     = SPI_SR_RESET_VALUE;
 154  0005 a602          	ld	a,#2
 155  0007 e703          	ld	(3,x),a
 156                     ; 134   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
 158  0009 a607          	ld	a,#7
 159  000b e705          	ld	(5,x),a
 160                     ; 135 }
 163  000d 81            	ret
 489                     ; 177 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 489                     ; 178               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 489                     ; 179               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 489                     ; 180               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 489                     ; 181               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 489                     ; 182 {
 490                     	switch	.text
 491  000e               _SPI_Init:
 493  000e 89            	pushw	x
 494  000f 88            	push	a
 495       00000001      OFST:	set	1
 498                     ; 184   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 500                     ; 185   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 502                     ; 186   assert_param(IS_SPI_MODE(SPI_Mode));
 504                     ; 187   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 506                     ; 188   assert_param(IS_SPI_PHASE(SPI_CPHA));
 508                     ; 189   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 510                     ; 190   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 512                     ; 191   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 514                     ; 194   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 514                     ; 195                                   (uint8_t)SPI_BaudRatePrescaler) |
 514                     ; 196                         (uint8_t)((uint8_t)SPI_CPOL |
 514                     ; 197                                   SPI_CPHA));
 516  0010 7b09          	ld	a,(OFST+8,sp)
 517  0012 1a0a          	or	a,(OFST+9,sp)
 518  0014 6b01          	ld	(OFST+0,sp),a
 519  0016 7b06          	ld	a,(OFST+5,sp)
 520  0018 1a07          	or	a,(OFST+6,sp)
 521  001a 1a01          	or	a,(OFST+0,sp)
 522  001c 1e02          	ldw	x,(OFST+1,sp)
 523  001e f7            	ld	(x),a
 524                     ; 200   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 526  001f 7b0b          	ld	a,(OFST+10,sp)
 527  0021 1a0c          	or	a,(OFST+11,sp)
 528  0023 1e02          	ldw	x,(OFST+1,sp)
 529  0025 e701          	ld	(1,x),a
 530                     ; 202   if (SPI_Mode == SPI_Mode_Master)
 532  0027 7b08          	ld	a,(OFST+7,sp)
 533  0029 a104          	cp	a,#4
 534  002b 260a          	jrne	L562
 535                     ; 204     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 537  002d 1e02          	ldw	x,(OFST+1,sp)
 538  002f e601          	ld	a,(1,x)
 539  0031 aa01          	or	a,#1
 540  0033 e701          	ld	(1,x),a
 542  0035 2008          	jra	L762
 543  0037               L562:
 544                     ; 208     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 546  0037 1e02          	ldw	x,(OFST+1,sp)
 547  0039 e601          	ld	a,(1,x)
 548  003b a4fe          	and	a,#254
 549  003d e701          	ld	(1,x),a
 550  003f               L762:
 551                     ; 212   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 553  003f 1e02          	ldw	x,(OFST+1,sp)
 554  0041 f6            	ld	a,(x)
 555  0042 1a08          	or	a,(OFST+7,sp)
 556  0044 f7            	ld	(x),a
 557                     ; 215   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 559  0045 7b0d          	ld	a,(OFST+12,sp)
 560  0047 1e02          	ldw	x,(OFST+1,sp)
 561  0049 e705          	ld	(5,x),a
 562                     ; 216 }
 565  004b 5b03          	addw	sp,#3
 566  004d 81            	ret
 633                     ; 225 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 633                     ; 226 {
 634                     	switch	.text
 635  004e               _SPI_Cmd:
 637  004e 89            	pushw	x
 638       00000000      OFST:	set	0
 641                     ; 228   assert_param(IS_FUNCTIONAL_STATE(NewState));
 643                     ; 230   if (NewState != DISABLE)
 645  004f 0d05          	tnz	(OFST+5,sp)
 646  0051 2706          	jreq	L523
 647                     ; 232     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 649  0053 f6            	ld	a,(x)
 650  0054 aa40          	or	a,#64
 651  0056 f7            	ld	(x),a
 653  0057 2006          	jra	L723
 654  0059               L523:
 655                     ; 236     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 657  0059 1e01          	ldw	x,(OFST+1,sp)
 658  005b f6            	ld	a,(x)
 659  005c a4bf          	and	a,#191
 660  005e f7            	ld	(x),a
 661  005f               L723:
 662                     ; 238 }
 665  005f 85            	popw	x
 666  0060 81            	ret
 714                     ; 247 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 714                     ; 248 {
 715                     	switch	.text
 716  0061               _SPI_NSSInternalSoftwareCmd:
 718  0061 89            	pushw	x
 719       00000000      OFST:	set	0
 722                     ; 250   assert_param(IS_FUNCTIONAL_STATE(NewState));
 724                     ; 252   if (NewState != DISABLE)
 726  0062 0d05          	tnz	(OFST+5,sp)
 727  0064 2708          	jreq	L553
 728                     ; 254     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 730  0066 e601          	ld	a,(1,x)
 731  0068 aa01          	or	a,#1
 732  006a e701          	ld	(1,x),a
 734  006c 2008          	jra	L753
 735  006e               L553:
 736                     ; 258     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 738  006e 1e01          	ldw	x,(OFST+1,sp)
 739  0070 e601          	ld	a,(1,x)
 740  0072 a4fe          	and	a,#254
 741  0074 e701          	ld	(1,x),a
 742  0076               L753:
 743                     ; 260 }
 746  0076 85            	popw	x
 747  0077 81            	ret
 815                     ; 271 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 815                     ; 272 {
 816                     	switch	.text
 817  0078               _SPI_BiDirectionalLineConfig:
 819  0078 89            	pushw	x
 820       00000000      OFST:	set	0
 823                     ; 274   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 825                     ; 276   if (SPI_Direction != SPI_Direction_Rx)
 827  0079 0d05          	tnz	(OFST+5,sp)
 828  007b 2708          	jreq	L514
 829                     ; 278     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 831  007d e601          	ld	a,(1,x)
 832  007f aa40          	or	a,#64
 833  0081 e701          	ld	(1,x),a
 835  0083 2008          	jra	L714
 836  0085               L514:
 837                     ; 282     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 839  0085 1e01          	ldw	x,(OFST+1,sp)
 840  0087 e601          	ld	a,(1,x)
 841  0089 a4bf          	and	a,#191
 842  008b e701          	ld	(1,x),a
 843  008d               L714:
 844                     ; 284 }
 847  008d 85            	popw	x
 848  008e 81            	ret
 894                     ; 319 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 894                     ; 320 {
 895                     	switch	.text
 896  008f               _SPI_SendData:
 898  008f 89            	pushw	x
 899       00000000      OFST:	set	0
 902                     ; 321   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 904  0090 7b05          	ld	a,(OFST+5,sp)
 905  0092 1e01          	ldw	x,(OFST+1,sp)
 906  0094 e704          	ld	(4,x),a
 907                     ; 322 }
 910  0096 85            	popw	x
 911  0097 81            	ret
 948                     ; 329 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 948                     ; 330 {
 949                     	switch	.text
 950  0098               _SPI_ReceiveData:
 954                     ; 331   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 956  0098 e604          	ld	a,(4,x)
 959  009a 81            	ret
 996                     ; 414 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 996                     ; 415 {
 997                     	switch	.text
 998  009b               _SPI_TransmitCRC:
1002                     ; 416   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1004  009b e601          	ld	a,(1,x)
1005  009d aa10          	or	a,#16
1006  009f e701          	ld	(1,x),a
1007                     ; 417 }
1010  00a1 81            	ret
1059                     ; 426 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1059                     ; 427 {
1060                     	switch	.text
1061  00a2               _SPI_CalculateCRCCmd:
1063  00a2 89            	pushw	x
1064       00000000      OFST:	set	0
1067                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
1069                     ; 432   SPI_Cmd(SPI1, DISABLE);
1071  00a3 4b00          	push	#0
1072  00a5 ae5200        	ldw	x,#20992
1073  00a8 ada4          	call	_SPI_Cmd
1075  00aa 84            	pop	a
1076                     ; 434   if (NewState != DISABLE)
1078  00ab 0d05          	tnz	(OFST+5,sp)
1079  00ad 270a          	jreq	L135
1080                     ; 436     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1082  00af 1e01          	ldw	x,(OFST+1,sp)
1083  00b1 e601          	ld	a,(1,x)
1084  00b3 aa20          	or	a,#32
1085  00b5 e701          	ld	(1,x),a
1087  00b7 2008          	jra	L335
1088  00b9               L135:
1089                     ; 440     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1091  00b9 1e01          	ldw	x,(OFST+1,sp)
1092  00bb e601          	ld	a,(1,x)
1093  00bd a4df          	and	a,#223
1094  00bf e701          	ld	(1,x),a
1095  00c1               L335:
1096                     ; 442 }
1099  00c1 85            	popw	x
1100  00c2 81            	ret
1176                     ; 453 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1176                     ; 454 {
1177                     	switch	.text
1178  00c3               _SPI_GetCRC:
1180  00c3 89            	pushw	x
1181  00c4 88            	push	a
1182       00000001      OFST:	set	1
1185                     ; 455   uint8_t crcreg = 0;
1187                     ; 458   assert_param(IS_SPI_CRC(SPI_CRC));
1189                     ; 460   if (SPI_CRC != SPI_CRC_RX)
1191  00c5 0d06          	tnz	(OFST+5,sp)
1192  00c7 2706          	jreq	L575
1193                     ; 462     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1195  00c9 e607          	ld	a,(7,x)
1196  00cb 6b01          	ld	(OFST+0,sp),a
1198  00cd 2006          	jra	L775
1199  00cf               L575:
1200                     ; 466     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1202  00cf 1e02          	ldw	x,(OFST+1,sp)
1203  00d1 e606          	ld	a,(6,x)
1204  00d3 6b01          	ld	(OFST+0,sp),a
1205  00d5               L775:
1206                     ; 470   return crcreg;
1208  00d5 7b01          	ld	a,(OFST+0,sp)
1211  00d7 5b03          	addw	sp,#3
1212  00d9 81            	ret
1251                     ; 478 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1251                     ; 479 {
1252                     	switch	.text
1253  00da               _SPI_ResetCRC:
1255  00da 89            	pushw	x
1256       00000000      OFST:	set	0
1259                     ; 482   SPI_CalculateCRCCmd(SPIx, ENABLE);
1261  00db 4b01          	push	#1
1262  00dd adc3          	call	_SPI_CalculateCRCCmd
1264  00df 84            	pop	a
1265                     ; 485   SPI_Cmd(SPIx, ENABLE);
1267  00e0 4b01          	push	#1
1268  00e2 1e02          	ldw	x,(OFST+2,sp)
1269  00e4 cd004e        	call	_SPI_Cmd
1271  00e7 84            	pop	a
1272                     ; 486 }
1275  00e8 85            	popw	x
1276  00e9 81            	ret
1314                     ; 493 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1314                     ; 494 {
1315                     	switch	.text
1316  00ea               _SPI_GetCRCPolynomial:
1320                     ; 495   return SPIx->CRCPR; /* Return the CRC polynomial register */
1322  00ea e605          	ld	a,(5,x)
1325  00ec 81            	ret
1402                     ; 525 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1402                     ; 526 {
1403                     	switch	.text
1404  00ed               _SPI_DMACmd:
1406  00ed 89            	pushw	x
1407       00000000      OFST:	set	0
1410                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1412                     ; 529   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1414                     ; 531   if (NewState != DISABLE)
1416  00ee 0d06          	tnz	(OFST+6,sp)
1417  00f0 2708          	jreq	L107
1418                     ; 534     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1420  00f2 e602          	ld	a,(2,x)
1421  00f4 1a05          	or	a,(OFST+5,sp)
1422  00f6 e702          	ld	(2,x),a
1424  00f8 2009          	jra	L307
1425  00fa               L107:
1426                     ; 539     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1428  00fa 1e01          	ldw	x,(OFST+1,sp)
1429  00fc 7b05          	ld	a,(OFST+5,sp)
1430  00fe 43            	cpl	a
1431  00ff e402          	and	a,(2,x)
1432  0101 e702          	ld	(2,x),a
1433  0103               L307:
1434                     ; 541 }
1437  0103 85            	popw	x
1438  0104 81            	ret
1559                     ; 626 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
1559                     ; 627 {
1560                     	switch	.text
1561  0105               _SPI_ITConfig:
1563  0105 89            	pushw	x
1564  0106 88            	push	a
1565       00000001      OFST:	set	1
1568                     ; 628   uint8_t itpos = 0;
1570                     ; 630   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
1572                     ; 631   assert_param(IS_FUNCTIONAL_STATE(NewState));
1574                     ; 634   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
1576  0107 7b06          	ld	a,(OFST+5,sp)
1577  0109 a40f          	and	a,#15
1578  010b 5f            	clrw	x
1579  010c 97            	ld	xl,a
1580  010d a601          	ld	a,#1
1581  010f 5d            	tnzw	x
1582  0110 2704          	jreq	L04
1583  0112               L24:
1584  0112 48            	sll	a
1585  0113 5a            	decw	x
1586  0114 26fc          	jrne	L24
1587  0116               L04:
1588  0116 6b01          	ld	(OFST+0,sp),a
1589                     ; 636   if (NewState != DISABLE)
1591  0118 0d07          	tnz	(OFST+6,sp)
1592  011a 270a          	jreq	L367
1593                     ; 638     SPIx->CR3 |= itpos; /* Enable interrupt*/
1595  011c 1e02          	ldw	x,(OFST+1,sp)
1596  011e e602          	ld	a,(2,x)
1597  0120 1a01          	or	a,(OFST+0,sp)
1598  0122 e702          	ld	(2,x),a
1600  0124 2009          	jra	L567
1601  0126               L367:
1602                     ; 642     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
1604  0126 1e02          	ldw	x,(OFST+1,sp)
1605  0128 7b01          	ld	a,(OFST+0,sp)
1606  012a 43            	cpl	a
1607  012b e402          	and	a,(2,x)
1608  012d e702          	ld	(2,x),a
1609  012f               L567:
1610                     ; 644 }
1613  012f 5b03          	addw	sp,#3
1614  0131 81            	ret
1747                     ; 661 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1747                     ; 662 {
1748                     	switch	.text
1749  0132               _SPI_GetFlagStatus:
1751  0132 89            	pushw	x
1752  0133 88            	push	a
1753       00000001      OFST:	set	1
1756                     ; 663   FlagStatus status = RESET;
1758                     ; 665   assert_param(IS_SPI_FLAG(SPI_FLAG));
1760                     ; 668   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1762  0134 e603          	ld	a,(3,x)
1763  0136 1506          	bcp	a,(OFST+5,sp)
1764  0138 2706          	jreq	L1501
1765                     ; 670     status = SET; /* SPI_FLAG is set */
1767  013a a601          	ld	a,#1
1768  013c 6b01          	ld	(OFST+0,sp),a
1770  013e 2002          	jra	L3501
1771  0140               L1501:
1772                     ; 674     status = RESET; /* SPI_FLAG is reset*/
1774  0140 0f01          	clr	(OFST+0,sp)
1775  0142               L3501:
1776                     ; 678   return status;
1778  0142 7b01          	ld	a,(OFST+0,sp)
1781  0144 5b03          	addw	sp,#3
1782  0146 81            	ret
1829                     ; 696 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1829                     ; 697 {
1830                     	switch	.text
1831  0147               _SPI_ClearFlag:
1833  0147 89            	pushw	x
1834       00000000      OFST:	set	0
1837                     ; 698   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1839                     ; 700   SPIx->SR = (uint8_t)(~SPI_FLAG);
1841  0148 7b05          	ld	a,(OFST+5,sp)
1842  014a 43            	cpl	a
1843  014b 1e01          	ldw	x,(OFST+1,sp)
1844  014d e703          	ld	(3,x),a
1845                     ; 701 }
1848  014f 85            	popw	x
1849  0150 81            	ret
1943                     ; 717 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1943                     ; 718 {
1944                     	switch	.text
1945  0151               _SPI_GetITStatus:
1947  0151 89            	pushw	x
1948  0152 5203          	subw	sp,#3
1949       00000003      OFST:	set	3
1952                     ; 719   ITStatus pendingbitstatus = RESET;
1954                     ; 720   uint8_t itpos = 0;
1956                     ; 721   uint8_t itmask1 = 0;
1958                     ; 722   uint8_t itmask2 = 0;
1960                     ; 723   __IO uint8_t enablestatus = 0;
1962  0154 0f02          	clr	(OFST-1,sp)
1963                     ; 724   assert_param(IS_SPI_GET_IT(SPI_IT));
1965                     ; 726   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1967  0156 7b08          	ld	a,(OFST+5,sp)
1968  0158 a40f          	and	a,#15
1969  015a 5f            	clrw	x
1970  015b 97            	ld	xl,a
1971  015c a601          	ld	a,#1
1972  015e 5d            	tnzw	x
1973  015f 2704          	jreq	L25
1974  0161               L45:
1975  0161 48            	sll	a
1976  0162 5a            	decw	x
1977  0163 26fc          	jrne	L45
1978  0165               L25:
1979  0165 6b01          	ld	(OFST-2,sp),a
1980                     ; 729   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1982  0167 7b08          	ld	a,(OFST+5,sp)
1983  0169 4e            	swap	a
1984  016a a40f          	and	a,#15
1985  016c 6b03          	ld	(OFST+0,sp),a
1986                     ; 731   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1988  016e 7b03          	ld	a,(OFST+0,sp)
1989  0170 5f            	clrw	x
1990  0171 97            	ld	xl,a
1991  0172 a601          	ld	a,#1
1992  0174 5d            	tnzw	x
1993  0175 2704          	jreq	L65
1994  0177               L06:
1995  0177 48            	sll	a
1996  0178 5a            	decw	x
1997  0179 26fc          	jrne	L06
1998  017b               L65:
1999  017b 6b03          	ld	(OFST+0,sp),a
2000                     ; 733   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
2002  017d 1e04          	ldw	x,(OFST+1,sp)
2003  017f e603          	ld	a,(3,x)
2004  0181 1403          	and	a,(OFST+0,sp)
2005  0183 6b02          	ld	(OFST-1,sp),a
2006                     ; 735   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
2008  0185 1e04          	ldw	x,(OFST+1,sp)
2009  0187 e602          	ld	a,(2,x)
2010  0189 1501          	bcp	a,(OFST-2,sp)
2011  018b 270a          	jreq	L1511
2013  018d 0d02          	tnz	(OFST-1,sp)
2014  018f 2706          	jreq	L1511
2015                     ; 738     pendingbitstatus = SET;
2017  0191 a601          	ld	a,#1
2018  0193 6b03          	ld	(OFST+0,sp),a
2020  0195 2002          	jra	L3511
2021  0197               L1511:
2022                     ; 743     pendingbitstatus = RESET;
2024  0197 0f03          	clr	(OFST+0,sp)
2025  0199               L3511:
2026                     ; 746   return  pendingbitstatus;
2028  0199 7b03          	ld	a,(OFST+0,sp)
2031  019b 5b05          	addw	sp,#5
2032  019d 81            	ret
2089                     ; 764 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2089                     ; 765 {
2090                     	switch	.text
2091  019e               _SPI_ClearITPendingBit:
2093  019e 89            	pushw	x
2094  019f 88            	push	a
2095       00000001      OFST:	set	1
2098                     ; 766   uint8_t itpos = 0;
2100                     ; 767   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2102                     ; 772   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2104  01a0 7b06          	ld	a,(OFST+5,sp)
2105  01a2 a4f0          	and	a,#240
2106  01a4 4e            	swap	a
2107  01a5 a40f          	and	a,#15
2108  01a7 5f            	clrw	x
2109  01a8 97            	ld	xl,a
2110  01a9 a601          	ld	a,#1
2111  01ab 5d            	tnzw	x
2112  01ac 2704          	jreq	L46
2113  01ae               L66:
2114  01ae 48            	sll	a
2115  01af 5a            	decw	x
2116  01b0 26fc          	jrne	L66
2117  01b2               L46:
2118  01b2 6b01          	ld	(OFST+0,sp),a
2119                     ; 774   SPIx->SR = (uint8_t)(~itpos);
2121  01b4 7b01          	ld	a,(OFST+0,sp)
2122  01b6 43            	cpl	a
2123  01b7 1e02          	ldw	x,(OFST+1,sp)
2124  01b9 e703          	ld	(3,x),a
2125                     ; 776 }
2128  01bb 5b03          	addw	sp,#3
2129  01bd 81            	ret
2142                     	xdef	_SPI_ClearITPendingBit
2143                     	xdef	_SPI_GetITStatus
2144                     	xdef	_SPI_ClearFlag
2145                     	xdef	_SPI_GetFlagStatus
2146                     	xdef	_SPI_ITConfig
2147                     	xdef	_SPI_DMACmd
2148                     	xdef	_SPI_GetCRCPolynomial
2149                     	xdef	_SPI_ResetCRC
2150                     	xdef	_SPI_GetCRC
2151                     	xdef	_SPI_CalculateCRCCmd
2152                     	xdef	_SPI_TransmitCRC
2153                     	xdef	_SPI_ReceiveData
2154                     	xdef	_SPI_SendData
2155                     	xdef	_SPI_BiDirectionalLineConfig
2156                     	xdef	_SPI_NSSInternalSoftwareCmd
2157                     	xdef	_SPI_Cmd
2158                     	xdef	_SPI_Init
2159                     	xdef	_SPI_DeInit
2178                     	end
