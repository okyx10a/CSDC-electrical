   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
 163                     ; 148 void USART_DeInit(USART_TypeDef* USARTx)
 163                     ; 149 {
 165                     	switch	.text
 166  0000               _USART_DeInit:
 170                     ; 153   (void) USARTx->SR;
 172  0000 f6            	ld	a,(x)
 173                     ; 154   (void) USARTx->DR;
 175  0001 e601          	ld	a,(1,x)
 176                     ; 156   USARTx->BRR2 = USART_BRR2_RESET_VALUE;  /* Set USART_BRR2 to reset value 0x00 */
 178  0003 6f03          	clr	(3,x)
 179                     ; 157   USARTx->BRR1 = USART_BRR1_RESET_VALUE;  /* Set USART_BRR1 to reset value 0x00 */
 181  0005 6f02          	clr	(2,x)
 182                     ; 159   USARTx->CR1 = USART_CR1_RESET_VALUE;  /* Set USART_CR1 to reset value 0x00 */
 184  0007 6f04          	clr	(4,x)
 185                     ; 160   USARTx->CR2 = USART_CR2_RESET_VALUE;  /* Set USART_CR2 to reset value 0x00 */
 187  0009 6f05          	clr	(5,x)
 188                     ; 161   USARTx->CR3 = USART_CR3_RESET_VALUE;  /* Set USART_CR3 to reset value 0x00 */
 190  000b 6f06          	clr	(6,x)
 191                     ; 162   USARTx->CR4 = USART_CR4_RESET_VALUE;  /* Set USART_CR4 to reset value 0x00 */
 193  000d 6f07          	clr	(7,x)
 194                     ; 163 }
 197  000f 81            	ret
 389                     ; 192 void USART_Init(USART_TypeDef* USARTx, uint32_t BaudRate, USART_WordLength_TypeDef
 389                     ; 193                 USART_WordLength, USART_StopBits_TypeDef USART_StopBits,
 389                     ; 194                 USART_Parity_TypeDef USART_Parity,  USART_Mode_TypeDef USART_Mode)
 389                     ; 195 {
 390                     	switch	.text
 391  0010               _USART_Init:
 393  0010 89            	pushw	x
 394  0011 5204          	subw	sp,#4
 395       00000004      OFST:	set	4
 398                     ; 196   uint32_t BaudRate_Mantissa = 0;
 400                     ; 199   assert_param(IS_USART_BAUDRATE(BaudRate));
 402                     ; 201   assert_param(IS_USART_WORDLENGTH(USART_WordLength));
 404                     ; 203   assert_param(IS_USART_STOPBITS(USART_StopBits));
 406                     ; 205   assert_param(IS_USART_PARITY(USART_Parity));
 408                     ; 207   assert_param(IS_USART_MODE(USART_Mode));
 410                     ; 210   USARTx->CR1 &= (uint8_t)(~(USART_CR1_PCEN | USART_CR1_PS | USART_CR1_M));
 412  0013 e604          	ld	a,(4,x)
 413  0015 a4e9          	and	a,#233
 414  0017 e704          	ld	(4,x),a
 415                     ; 213   USARTx->CR1 |= (uint8_t)((uint8_t)USART_WordLength | (uint8_t)USART_Parity);
 417  0019 7b0d          	ld	a,(OFST+9,sp)
 418  001b 1a0f          	or	a,(OFST+11,sp)
 419  001d ea04          	or	a,(4,x)
 420  001f e704          	ld	(4,x),a
 421                     ; 216   USARTx->CR3 &= (uint8_t)(~USART_CR3_STOP);
 423  0021 e606          	ld	a,(6,x)
 424  0023 a4cf          	and	a,#207
 425  0025 e706          	ld	(6,x),a
 426                     ; 218   USARTx->CR3 |= (uint8_t)USART_StopBits;
 428  0027 e606          	ld	a,(6,x)
 429  0029 1a0e          	or	a,(OFST+10,sp)
 430  002b e706          	ld	(6,x),a
 431                     ; 221   USARTx->BRR1 &= (uint8_t)(~USART_BRR1_DIVM);
 433  002d 6f02          	clr	(2,x)
 434                     ; 223   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVM);
 436  002f e603          	ld	a,(3,x)
 437  0031 a40f          	and	a,#15
 438  0033 e703          	ld	(3,x),a
 439                     ; 225   USARTx->BRR2 &= (uint8_t)(~USART_BRR2_DIVF);
 441  0035 e603          	ld	a,(3,x)
 442  0037 a4f0          	and	a,#240
 443  0039 e703          	ld	(3,x),a
 444                     ; 227   BaudRate_Mantissa  = (uint32_t)(CLK_GetClockFreq() / BaudRate );
 446  003b cd0000        	call	_CLK_GetClockFreq
 448  003e 96            	ldw	x,sp
 449  003f 1c0009        	addw	x,#OFST+5
 450  0042 cd0000        	call	c_ludv
 452  0045 96            	ldw	x,sp
 453  0046 1c0001        	addw	x,#OFST-3
 454  0049 cd0000        	call	c_rtol
 456                     ; 229   USARTx->BRR2 = (uint8_t)((BaudRate_Mantissa >> (uint8_t)8) & (uint8_t)0xF0);
 458  004c 7b03          	ld	a,(OFST-1,sp)
 459  004e a4f0          	and	a,#240
 460  0050 1e05          	ldw	x,(OFST+1,sp)
 461  0052 e703          	ld	(3,x),a
 462                     ; 231   USARTx->BRR2 |= (uint8_t)(BaudRate_Mantissa & (uint8_t)0x0F);
 464  0054 1e05          	ldw	x,(OFST+1,sp)
 465  0056 7b04          	ld	a,(OFST+0,sp)
 466  0058 a40f          	and	a,#15
 467  005a ea03          	or	a,(3,x)
 468  005c e703          	ld	(3,x),a
 469                     ; 233   USARTx->BRR1 = (uint8_t)(BaudRate_Mantissa >> (uint8_t)4);
 471  005e 96            	ldw	x,sp
 472  005f 1c0001        	addw	x,#OFST-3
 473  0062 cd0000        	call	c_ltor
 475  0065 a604          	ld	a,#4
 476  0067 cd0000        	call	c_lursh
 478  006a b603          	ld	a,c_lreg+3
 479  006c 1e05          	ldw	x,(OFST+1,sp)
 480  006e e702          	ld	(2,x),a
 481                     ; 236   USARTx->CR2 &= (uint8_t)~(USART_CR2_TEN | USART_CR2_REN);
 483  0070 1e05          	ldw	x,(OFST+1,sp)
 484  0072 e605          	ld	a,(5,x)
 485  0074 a4f3          	and	a,#243
 486  0076 e705          	ld	(5,x),a
 487                     ; 238   USARTx->CR2 |= (uint8_t)USART_Mode;
 489  0078 1e05          	ldw	x,(OFST+1,sp)
 490  007a e605          	ld	a,(5,x)
 491  007c 1a10          	or	a,(OFST+12,sp)
 492  007e e705          	ld	(5,x),a
 493                     ; 239 }
 496  0080 5b06          	addw	sp,#6
 497  0082 81            	ret
 657                     ; 264 void USART_ClockInit(USART_TypeDef* USARTx, USART_Clock_TypeDef USART_Clock,
 657                     ; 265                      USART_CPOL_TypeDef USART_CPOL, USART_CPHA_TypeDef USART_CPHA,
 657                     ; 266                      USART_LastBit_TypeDef USART_LastBit)
 657                     ; 267 {
 658                     	switch	.text
 659  0083               _USART_ClockInit:
 661  0083 89            	pushw	x
 662       00000000      OFST:	set	0
 665                     ; 269   assert_param(IS_USART_CLOCK(USART_Clock));
 667                     ; 270   assert_param(IS_USART_CPOL(USART_CPOL));
 669                     ; 271   assert_param(IS_USART_CPHA(USART_CPHA));
 671                     ; 272   assert_param(IS_USART_LASTBIT(USART_LastBit));
 673                     ; 275   USARTx->CR3 &= (uint8_t)~(USART_CR3_CPOL | USART_CR3_CPHA | USART_CR3_LBCL);
 675  0084 e606          	ld	a,(6,x)
 676  0086 a4f8          	and	a,#248
 677  0088 e706          	ld	(6,x),a
 678                     ; 277   USARTx->CR3 |= (uint8_t)((uint8_t)((uint8_t)(USART_CPOL | (uint8_t)USART_CPHA ) | USART_LastBit));
 680  008a 7b06          	ld	a,(OFST+6,sp)
 681  008c 1a07          	or	a,(OFST+7,sp)
 682  008e 1a08          	or	a,(OFST+8,sp)
 683  0090 ea06          	or	a,(6,x)
 684  0092 e706          	ld	(6,x),a
 685                     ; 279   if (USART_Clock != USART_Clock_Disable)
 687  0094 0d05          	tnz	(OFST+5,sp)
 688  0096 2708          	jreq	L523
 689                     ; 281     USARTx->CR3 |= (uint8_t)(USART_CR3_CLKEN); /* Set the Clock Enable bit */
 691  0098 e606          	ld	a,(6,x)
 692  009a aa08          	or	a,#8
 693  009c e706          	ld	(6,x),a
 695  009e 2008          	jra	L723
 696  00a0               L523:
 697                     ; 285     USARTx->CR3 &= (uint8_t)(~USART_CR3_CLKEN); /* Clear the Clock Enable bit */
 699  00a0 1e01          	ldw	x,(OFST+1,sp)
 700  00a2 e606          	ld	a,(6,x)
 701  00a4 a4f7          	and	a,#247
 702  00a6 e706          	ld	(6,x),a
 703  00a8               L723:
 704                     ; 287 }
 707  00a8 85            	popw	x
 708  00a9 81            	ret
 775                     ; 296 void USART_Cmd(USART_TypeDef* USARTx, FunctionalState NewState)
 775                     ; 297 {
 776                     	switch	.text
 777  00aa               _USART_Cmd:
 779  00aa 89            	pushw	x
 780       00000000      OFST:	set	0
 783                     ; 298   if (NewState != DISABLE)
 785  00ab 0d05          	tnz	(OFST+5,sp)
 786  00ad 2708          	jreq	L563
 787                     ; 300     USARTx->CR1 &= (uint8_t)(~USART_CR1_USARTD); /**< USART Enable */
 789  00af e604          	ld	a,(4,x)
 790  00b1 a4df          	and	a,#223
 791  00b3 e704          	ld	(4,x),a
 793  00b5 2008          	jra	L763
 794  00b7               L563:
 795                     ; 304     USARTx->CR1 |= USART_CR1_USARTD;  /**< USART Disable (for low power consumption) */
 797  00b7 1e01          	ldw	x,(OFST+1,sp)
 798  00b9 e604          	ld	a,(4,x)
 799  00bb aa20          	or	a,#32
 800  00bd e704          	ld	(4,x),a
 801  00bf               L763:
 802                     ; 306 }
 805  00bf 85            	popw	x
 806  00c0 81            	ret
 852                     ; 329 void USART_SetPrescaler(USART_TypeDef* USARTx, uint8_t USART_Prescaler)
 852                     ; 330 {
 853                     	switch	.text
 854  00c1               _USART_SetPrescaler:
 856  00c1 89            	pushw	x
 857       00000000      OFST:	set	0
 860                     ; 332   USARTx->PSCR = USART_Prescaler;
 862  00c2 7b05          	ld	a,(OFST+5,sp)
 863  00c4 1e01          	ldw	x,(OFST+1,sp)
 864  00c6 e70a          	ld	(10,x),a
 865                     ; 333 }
 868  00c8 85            	popw	x
 869  00c9 81            	ret
 906                     ; 340 void USART_SendBreak(USART_TypeDef* USARTx)
 906                     ; 341 {
 907                     	switch	.text
 908  00ca               _USART_SendBreak:
 912                     ; 342   USARTx->CR2 |= USART_CR2_SBK;
 914  00ca e605          	ld	a,(5,x)
 915  00cc aa01          	or	a,#1
 916  00ce e705          	ld	(5,x),a
 917                     ; 343 }
 920  00d0 81            	ret
 957                     ; 382 uint8_t USART_ReceiveData8(USART_TypeDef* USARTx)
 957                     ; 383 {
 958                     	switch	.text
 959  00d1               _USART_ReceiveData8:
 963                     ; 384   return USARTx->DR;
 965  00d1 e601          	ld	a,(1,x)
 968  00d3 81            	ret
1014                     ; 392 uint16_t USART_ReceiveData9(USART_TypeDef* USARTx)
1014                     ; 393 {
1015                     	switch	.text
1016  00d4               _USART_ReceiveData9:
1018  00d4 89            	pushw	x
1019  00d5 89            	pushw	x
1020       00000002      OFST:	set	2
1023                     ; 394   uint16_t temp = 0;
1025                     ; 396   temp = ((uint16_t)(((uint16_t)((uint16_t)USARTx->CR1 & (uint16_t)USART_CR1_R8)) << 1));
1027  00d6 e604          	ld	a,(4,x)
1028  00d8 5f            	clrw	x
1029  00d9 a480          	and	a,#128
1030  00db 5f            	clrw	x
1031  00dc 02            	rlwa	x,a
1032  00dd 58            	sllw	x
1033  00de 1f01          	ldw	(OFST-1,sp),x
1034                     ; 397   return (uint16_t)( ((uint16_t)((uint16_t)USARTx->DR) | temp) & ((uint16_t)0x01FF));
1036  00e0 1e03          	ldw	x,(OFST+1,sp)
1037  00e2 e601          	ld	a,(1,x)
1038  00e4 5f            	clrw	x
1039  00e5 97            	ld	xl,a
1040  00e6 01            	rrwa	x,a
1041  00e7 1a02          	or	a,(OFST+0,sp)
1042  00e9 01            	rrwa	x,a
1043  00ea 1a01          	or	a,(OFST-1,sp)
1044  00ec 01            	rrwa	x,a
1045  00ed 01            	rrwa	x,a
1046  00ee a4ff          	and	a,#255
1047  00f0 01            	rrwa	x,a
1048  00f1 a401          	and	a,#1
1049  00f3 01            	rrwa	x,a
1052  00f4 5b04          	addw	sp,#4
1053  00f6 81            	ret
1099                     ; 405 void USART_SendData8(USART_TypeDef* USARTx, uint8_t Data)
1099                     ; 406 {
1100                     	switch	.text
1101  00f7               _USART_SendData8:
1103  00f7 89            	pushw	x
1104       00000000      OFST:	set	0
1107                     ; 408   USARTx->DR = Data;
1109  00f8 7b05          	ld	a,(OFST+5,sp)
1110  00fa 1e01          	ldw	x,(OFST+1,sp)
1111  00fc e701          	ld	(1,x),a
1112                     ; 409 }
1115  00fe 85            	popw	x
1116  00ff 81            	ret
1162                     ; 418 void USART_SendData9(USART_TypeDef* USARTx, uint16_t Data)
1162                     ; 419 {
1163                     	switch	.text
1164  0100               _USART_SendData9:
1166  0100 89            	pushw	x
1167       00000000      OFST:	set	0
1170                     ; 420   assert_param(IS_USART_DATA_9BITS(Data));
1172                     ; 423   USARTx->CR1 &= ((uint8_t)~USART_CR1_T8);
1174  0101 e604          	ld	a,(4,x)
1175  0103 a4bf          	and	a,#191
1176  0105 e704          	ld	(4,x),a
1177                     ; 426   USARTx->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & USART_CR1_T8);
1179  0107 1605          	ldw	y,(OFST+5,sp)
1180  0109 9054          	srlw	y
1181  010b 9054          	srlw	y
1182  010d 909f          	ld	a,yl
1183  010f a440          	and	a,#64
1184  0111 ea04          	or	a,(4,x)
1185  0113 e704          	ld	(4,x),a
1186                     ; 429   USARTx->DR   = (uint8_t)(Data);
1188  0115 7b06          	ld	a,(OFST+6,sp)
1189  0117 1e01          	ldw	x,(OFST+1,sp)
1190  0119 e701          	ld	(1,x),a
1191                     ; 430 }
1194  011b 85            	popw	x
1195  011c 81            	ret
1243                     ; 473 void USART_ReceiverWakeUpCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1243                     ; 474 {
1244                     	switch	.text
1245  011d               _USART_ReceiverWakeUpCmd:
1247  011d 89            	pushw	x
1248       00000000      OFST:	set	0
1251                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1253                     ; 477   if (NewState != DISABLE)
1255  011e 0d05          	tnz	(OFST+5,sp)
1256  0120 2708          	jreq	L575
1257                     ; 480     USARTx->CR2 |= USART_CR2_RWU;
1259  0122 e605          	ld	a,(5,x)
1260  0124 aa02          	or	a,#2
1261  0126 e705          	ld	(5,x),a
1263  0128 2008          	jra	L775
1264  012a               L575:
1265                     ; 485     USARTx->CR2 &= ((uint8_t)~USART_CR2_RWU);
1267  012a 1e01          	ldw	x,(OFST+1,sp)
1268  012c e605          	ld	a,(5,x)
1269  012e a4fd          	and	a,#253
1270  0130 e705          	ld	(5,x),a
1271  0132               L775:
1272                     ; 487 }
1275  0132 85            	popw	x
1276  0133 81            	ret
1322                     ; 496 void USART_SetAddress(USART_TypeDef* USARTx, uint8_t USART_Address)
1322                     ; 497 {
1323                     	switch	.text
1324  0134               _USART_SetAddress:
1326  0134 89            	pushw	x
1327       00000000      OFST:	set	0
1330                     ; 499   assert_param(IS_USART_ADDRESS(USART_Address));
1332                     ; 502   USARTx->CR4 &= ((uint8_t)~USART_CR4_ADD);
1334  0135 e607          	ld	a,(7,x)
1335  0137 a4f0          	and	a,#240
1336  0139 e707          	ld	(7,x),a
1337                     ; 504   USARTx->CR4 |= USART_Address;
1339  013b e607          	ld	a,(7,x)
1340  013d 1a05          	or	a,(OFST+5,sp)
1341  013f e707          	ld	(7,x),a
1342                     ; 505 }
1345  0141 85            	popw	x
1346  0142 81            	ret
1415                     ; 515 void USART_WakeUpConfig(USART_TypeDef* USARTx, USART_WakeUp_TypeDef USART_WakeUp)
1415                     ; 516 {
1416                     	switch	.text
1417  0143               _USART_WakeUpConfig:
1419  0143 89            	pushw	x
1420       00000000      OFST:	set	0
1423                     ; 517   assert_param(IS_USART_WAKEUP(USART_WakeUp));
1425                     ; 519   USARTx->CR1 &= ((uint8_t)~USART_CR1_WAKE);
1427  0144 e604          	ld	a,(4,x)
1428  0146 a4f7          	and	a,#247
1429  0148 e704          	ld	(4,x),a
1430                     ; 520   USARTx->CR1 |= (uint8_t)USART_WakeUp;
1432  014a e604          	ld	a,(4,x)
1433  014c 1a05          	or	a,(OFST+5,sp)
1434  014e e704          	ld	(4,x),a
1435                     ; 521 }
1438  0150 85            	popw	x
1439  0151 81            	ret
1487                     ; 566 void USART_HalfDuplexCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1487                     ; 567 {
1488                     	switch	.text
1489  0152               _USART_HalfDuplexCmd:
1491  0152 89            	pushw	x
1492       00000000      OFST:	set	0
1495                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
1497                     ; 570   if (NewState != DISABLE)
1499  0153 0d05          	tnz	(OFST+5,sp)
1500  0155 2708          	jreq	L507
1501                     ; 572     USARTx->CR5 |= USART_CR5_HDSEL;  /**< USART Half Duplex Enable  */
1503  0157 e608          	ld	a,(8,x)
1504  0159 aa08          	or	a,#8
1505  015b e708          	ld	(8,x),a
1507  015d 2008          	jra	L707
1508  015f               L507:
1509                     ; 576     USARTx->CR5 &= (uint8_t)~USART_CR5_HDSEL; /**< USART Half Duplex Disable */
1511  015f 1e01          	ldw	x,(OFST+1,sp)
1512  0161 e608          	ld	a,(8,x)
1513  0163 a4f7          	and	a,#247
1514  0165 e708          	ld	(8,x),a
1515  0167               L707:
1516                     ; 578 }
1519  0167 85            	popw	x
1520  0168 81            	ret
1567                     ; 644 void USART_SmartCardCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1567                     ; 645 {
1568                     	switch	.text
1569  0169               _USART_SmartCardCmd:
1571  0169 89            	pushw	x
1572       00000000      OFST:	set	0
1575                     ; 646   assert_param(IS_FUNCTIONAL_STATE(NewState));
1577                     ; 648   if (NewState != DISABLE)
1579  016a 0d05          	tnz	(OFST+5,sp)
1580  016c 2708          	jreq	L537
1581                     ; 651     USARTx->CR5 |= USART_CR5_SCEN;
1583  016e e608          	ld	a,(8,x)
1584  0170 aa20          	or	a,#32
1585  0172 e708          	ld	(8,x),a
1587  0174 2008          	jra	L737
1588  0176               L537:
1589                     ; 656     USARTx->CR5 &= ((uint8_t)(~USART_CR5_SCEN));
1591  0176 1e01          	ldw	x,(OFST+1,sp)
1592  0178 e608          	ld	a,(8,x)
1593  017a a4df          	and	a,#223
1594  017c e708          	ld	(8,x),a
1595  017e               L737:
1596                     ; 658 }
1599  017e 85            	popw	x
1600  017f 81            	ret
1648                     ; 667 void USART_SmartCardNACKCmd(USART_TypeDef* USARTx, FunctionalState NewState)
1648                     ; 668 {
1649                     	switch	.text
1650  0180               _USART_SmartCardNACKCmd:
1652  0180 89            	pushw	x
1653       00000000      OFST:	set	0
1656                     ; 669   assert_param(IS_FUNCTIONAL_STATE(NewState));
1658                     ; 671   if (NewState != DISABLE)
1660  0181 0d05          	tnz	(OFST+5,sp)
1661  0183 2708          	jreq	L567
1662                     ; 674     USARTx->CR5 |= USART_CR5_NACK;
1664  0185 e608          	ld	a,(8,x)
1665  0187 aa10          	or	a,#16
1666  0189 e708          	ld	(8,x),a
1668  018b 2008          	jra	L767
1669  018d               L567:
1670                     ; 679     USARTx->CR5 &= ((uint8_t)~(USART_CR5_NACK));
1672  018d 1e01          	ldw	x,(OFST+1,sp)
1673  018f e608          	ld	a,(8,x)
1674  0191 a4ef          	and	a,#239
1675  0193 e708          	ld	(8,x),a
1676  0195               L767:
1677                     ; 681 }
1680  0195 85            	popw	x
1681  0196 81            	ret
1727                     ; 690 void USART_SetGuardTime(USART_TypeDef* USARTx, uint8_t USART_GuardTime)
1727                     ; 691 {
1728                     	switch	.text
1729  0197               _USART_SetGuardTime:
1731  0197 89            	pushw	x
1732       00000000      OFST:	set	0
1735                     ; 693   USARTx->GTR = USART_GuardTime;
1737  0198 7b05          	ld	a,(OFST+5,sp)
1738  019a 1e01          	ldw	x,(OFST+1,sp)
1739  019c e709          	ld	(9,x),a
1740                     ; 694 }
1743  019e 85            	popw	x
1744  019f 81            	ret
1813                     ; 751 void USART_IrDAConfig(USART_TypeDef* USARTx, USART_IrDAMode_TypeDef USART_IrDAMode)
1813                     ; 752 {
1814                     	switch	.text
1815  01a0               _USART_IrDAConfig:
1817  01a0 89            	pushw	x
1818       00000000      OFST:	set	0
1821                     ; 753   assert_param(IS_USART_IRDAMODE(USART_IrDAMode));
1823                     ; 755   if (USART_IrDAMode != USART_IrDAMode_Normal)
1825  01a1 0d05          	tnz	(OFST+5,sp)
1826  01a3 2708          	jreq	L1501
1827                     ; 757     USARTx->CR5 |= USART_CR5_IRLP;
1829  01a5 e608          	ld	a,(8,x)
1830  01a7 aa04          	or	a,#4
1831  01a9 e708          	ld	(8,x),a
1833  01ab 2008          	jra	L3501
1834  01ad               L1501:
1835                     ; 761     USARTx->CR5 &= ((uint8_t)~USART_CR5_IRLP);
1837  01ad 1e01          	ldw	x,(OFST+1,sp)
1838  01af e608          	ld	a,(8,x)
1839  01b1 a4fb          	and	a,#251
1840  01b3 e708          	ld	(8,x),a
1841  01b5               L3501:
1842                     ; 763 }
1845  01b5 85            	popw	x
1846  01b6 81            	ret
1893                     ; 772 void USART_IrDACmd(USART_TypeDef* USARTx, FunctionalState NewState)
1893                     ; 773 {
1894                     	switch	.text
1895  01b7               _USART_IrDACmd:
1897  01b7 89            	pushw	x
1898       00000000      OFST:	set	0
1901                     ; 776   assert_param(IS_FUNCTIONAL_STATE(NewState));
1903                     ; 778   if (NewState != DISABLE)
1905  01b8 0d05          	tnz	(OFST+5,sp)
1906  01ba 2708          	jreq	L1011
1907                     ; 781     USARTx->CR5 |= USART_CR5_IREN;
1909  01bc e608          	ld	a,(8,x)
1910  01be aa02          	or	a,#2
1911  01c0 e708          	ld	(8,x),a
1913  01c2 2008          	jra	L3011
1914  01c4               L1011:
1915                     ; 786     USARTx->CR5 &= ((uint8_t)~USART_CR5_IREN);
1917  01c4 1e01          	ldw	x,(OFST+1,sp)
1918  01c6 e608          	ld	a,(8,x)
1919  01c8 a4fd          	and	a,#253
1920  01ca e708          	ld	(8,x),a
1921  01cc               L3011:
1922                     ; 788 }
1925  01cc 85            	popw	x
1926  01cd 81            	ret
2003                     ; 818 void USART_DMACmd(USART_TypeDef* USARTx, USART_DMAReq_TypeDef USART_DMAReq,
2003                     ; 819                   FunctionalState NewState)
2003                     ; 820 {
2004                     	switch	.text
2005  01ce               _USART_DMACmd:
2007  01ce 89            	pushw	x
2008       00000000      OFST:	set	0
2011                     ; 822   assert_param(IS_USART_DMAREQ(USART_DMAReq));
2013                     ; 823   assert_param(IS_FUNCTIONAL_STATE(NewState));
2015                     ; 825   if (NewState != DISABLE)
2017  01cf 0d06          	tnz	(OFST+6,sp)
2018  01d1 2708          	jreq	L5411
2019                     ; 829     USARTx->CR5 |= (uint8_t) USART_DMAReq;
2021  01d3 e608          	ld	a,(8,x)
2022  01d5 1a05          	or	a,(OFST+5,sp)
2023  01d7 e708          	ld	(8,x),a
2025  01d9 2009          	jra	L7411
2026  01db               L5411:
2027                     ; 835     USARTx->CR5 &= (uint8_t)~USART_DMAReq;
2029  01db 1e01          	ldw	x,(OFST+1,sp)
2030  01dd 7b05          	ld	a,(OFST+5,sp)
2031  01df 43            	cpl	a
2032  01e0 e408          	and	a,(8,x)
2033  01e2 e708          	ld	(8,x),a
2034  01e4               L7411:
2035                     ; 837 }
2038  01e4 85            	popw	x
2039  01e5 81            	ret
2183                     ; 939 void USART_ITConfig(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT, FunctionalState NewState)
2183                     ; 940 {
2184                     	switch	.text
2185  01e6               _USART_ITConfig:
2187  01e6 89            	pushw	x
2188  01e7 89            	pushw	x
2189       00000002      OFST:	set	2
2192                     ; 941   uint8_t usartreg, itpos = 0x00;
2194                     ; 942   assert_param(IS_USART_CONFIG_IT(USART_IT));
2196                     ; 943   assert_param(IS_FUNCTIONAL_STATE(NewState));
2198                     ; 946   usartreg = (uint8_t)((uint16_t)USART_IT >> 0x08);
2200  01e8 7b07          	ld	a,(OFST+5,sp)
2201  01ea 6b01          	ld	(OFST-1,sp),a
2202                     ; 948   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2204  01ec 7b08          	ld	a,(OFST+6,sp)
2205  01ee a40f          	and	a,#15
2206  01f0 5f            	clrw	x
2207  01f1 97            	ld	xl,a
2208  01f2 a601          	ld	a,#1
2209  01f4 5d            	tnzw	x
2210  01f5 2704          	jreq	L65
2211  01f7               L06:
2212  01f7 48            	sll	a
2213  01f8 5a            	decw	x
2214  01f9 26fc          	jrne	L06
2215  01fb               L65:
2216  01fb 6b02          	ld	(OFST+0,sp),a
2217                     ; 950   if (NewState != DISABLE)
2219  01fd 0d09          	tnz	(OFST+7,sp)
2220  01ff 272a          	jreq	L7321
2221                     ; 953     if (usartreg == 0x01)
2223  0201 7b01          	ld	a,(OFST-1,sp)
2224  0203 a101          	cp	a,#1
2225  0205 260a          	jrne	L1421
2226                     ; 955       USARTx->CR1 |= itpos;
2228  0207 1e03          	ldw	x,(OFST+1,sp)
2229  0209 e604          	ld	a,(4,x)
2230  020b 1a02          	or	a,(OFST+0,sp)
2231  020d e704          	ld	(4,x),a
2233  020f 2045          	jra	L1521
2234  0211               L1421:
2235                     ; 957     else if (usartreg == 0x05)
2237  0211 7b01          	ld	a,(OFST-1,sp)
2238  0213 a105          	cp	a,#5
2239  0215 260a          	jrne	L5421
2240                     ; 959       USARTx->CR5 |= itpos;
2242  0217 1e03          	ldw	x,(OFST+1,sp)
2243  0219 e608          	ld	a,(8,x)
2244  021b 1a02          	or	a,(OFST+0,sp)
2245  021d e708          	ld	(8,x),a
2247  021f 2035          	jra	L1521
2248  0221               L5421:
2249                     ; 964       USARTx->CR2 |= itpos;
2251  0221 1e03          	ldw	x,(OFST+1,sp)
2252  0223 e605          	ld	a,(5,x)
2253  0225 1a02          	or	a,(OFST+0,sp)
2254  0227 e705          	ld	(5,x),a
2255  0229 202b          	jra	L1521
2256  022b               L7321:
2257                     ; 970     if (usartreg == 0x01)
2259  022b 7b01          	ld	a,(OFST-1,sp)
2260  022d a101          	cp	a,#1
2261  022f 260b          	jrne	L3521
2262                     ; 972       USARTx->CR1 &= (uint8_t)(~itpos);
2264  0231 1e03          	ldw	x,(OFST+1,sp)
2265  0233 7b02          	ld	a,(OFST+0,sp)
2266  0235 43            	cpl	a
2267  0236 e404          	and	a,(4,x)
2268  0238 e704          	ld	(4,x),a
2270  023a 201a          	jra	L1521
2271  023c               L3521:
2272                     ; 974     else if (usartreg == 0x05)
2274  023c 7b01          	ld	a,(OFST-1,sp)
2275  023e a105          	cp	a,#5
2276  0240 260b          	jrne	L7521
2277                     ; 976       USARTx->CR5 &= (uint8_t)(~itpos);
2279  0242 1e03          	ldw	x,(OFST+1,sp)
2280  0244 7b02          	ld	a,(OFST+0,sp)
2281  0246 43            	cpl	a
2282  0247 e408          	and	a,(8,x)
2283  0249 e708          	ld	(8,x),a
2285  024b 2009          	jra	L1521
2286  024d               L7521:
2287                     ; 981       USARTx->CR2 &= (uint8_t)(~itpos);
2289  024d 1e03          	ldw	x,(OFST+1,sp)
2290  024f 7b02          	ld	a,(OFST+0,sp)
2291  0251 43            	cpl	a
2292  0252 e405          	and	a,(5,x)
2293  0254 e705          	ld	(5,x),a
2294  0256               L1521:
2295                     ; 984 }
2298  0256 5b04          	addw	sp,#4
2299  0258 81            	ret
2447                     ; 1002 FlagStatus USART_GetFlagStatus(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2447                     ; 1003 {
2448                     	switch	.text
2449  0259               _USART_GetFlagStatus:
2451  0259 89            	pushw	x
2452  025a 88            	push	a
2453       00000001      OFST:	set	1
2456                     ; 1004   FlagStatus status = RESET;
2458                     ; 1007   assert_param(IS_USART_FLAG(USART_FLAG));
2460                     ; 1009   if (USART_FLAG == USART_FLAG_SBK)
2462  025b 1e06          	ldw	x,(OFST+5,sp)
2463  025d a30101        	cpw	x,#257
2464  0260 2612          	jrne	L1531
2465                     ; 1011     if ((USARTx->CR2 & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2467  0262 1e02          	ldw	x,(OFST+1,sp)
2468  0264 e605          	ld	a,(5,x)
2469  0266 1507          	bcp	a,(OFST+6,sp)
2470  0268 2706          	jreq	L3531
2471                     ; 1014       status = SET;
2473  026a a601          	ld	a,#1
2474  026c 6b01          	ld	(OFST+0,sp),a
2476  026e 2013          	jra	L7531
2477  0270               L3531:
2478                     ; 1019       status = RESET;
2480  0270 0f01          	clr	(OFST+0,sp)
2481  0272 200f          	jra	L7531
2482  0274               L1531:
2483                     ; 1024     if ((USARTx->SR & (uint8_t)USART_FLAG) != (uint8_t)0x00)
2485  0274 1e02          	ldw	x,(OFST+1,sp)
2486  0276 f6            	ld	a,(x)
2487  0277 1507          	bcp	a,(OFST+6,sp)
2488  0279 2706          	jreq	L1631
2489                     ; 1027       status = SET;
2491  027b a601          	ld	a,#1
2492  027d 6b01          	ld	(OFST+0,sp),a
2494  027f 2002          	jra	L7531
2495  0281               L1631:
2496                     ; 1032       status = RESET;
2498  0281 0f01          	clr	(OFST+0,sp)
2499  0283               L7531:
2500                     ; 1036   return status;
2502  0283 7b01          	ld	a,(OFST+0,sp)
2505  0285 5b03          	addw	sp,#3
2506  0287 81            	ret
2553                     ; 1060 void USART_ClearFlag(USART_TypeDef* USARTx, USART_FLAG_TypeDef USART_FLAG)
2553                     ; 1061 {
2554                     	switch	.text
2555  0288               _USART_ClearFlag:
2557  0288 89            	pushw	x
2558       00000000      OFST:	set	0
2561                     ; 1063   assert_param(IS_USART_CLEAR_FLAG(USART_FLAG));
2563                     ; 1065   USARTx->SR = (uint8_t)((uint16_t)~((uint16_t)USART_FLAG));
2565  0289 7b06          	ld	a,(OFST+6,sp)
2566  028b 43            	cpl	a
2567  028c 1e01          	ldw	x,(OFST+1,sp)
2568  028e f7            	ld	(x),a
2569                     ; 1066 }
2572  028f 85            	popw	x
2573  0290 81            	ret
2676                     ; 1083 ITStatus USART_GetITStatus(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2676                     ; 1084 {
2677                     	switch	.text
2678  0291               _USART_GetITStatus:
2680  0291 89            	pushw	x
2681  0292 5203          	subw	sp,#3
2682       00000003      OFST:	set	3
2685                     ; 1085   ITStatus pendingbitstatus = RESET;
2687                     ; 1086   uint8_t temp = 0;
2689                     ; 1087   uint8_t itpos = 0;
2691                     ; 1088   uint8_t itmask1 = 0;
2693                     ; 1089   uint8_t itmask2 = 0;
2695                     ; 1090   uint8_t enablestatus = 0;
2697                     ; 1093   assert_param(IS_USART_GET_IT(USART_IT));
2699                     ; 1096   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)USART_IT & (uint8_t)0x0F));
2701  0294 7b09          	ld	a,(OFST+6,sp)
2702  0296 a40f          	and	a,#15
2703  0298 5f            	clrw	x
2704  0299 97            	ld	xl,a
2705  029a a601          	ld	a,#1
2706  029c 5d            	tnzw	x
2707  029d 2704          	jreq	L07
2708  029f               L27:
2709  029f 48            	sll	a
2710  02a0 5a            	decw	x
2711  02a1 26fc          	jrne	L27
2712  02a3               L07:
2713  02a3 6b02          	ld	(OFST-1,sp),a
2714                     ; 1098   itmask1 = (uint8_t)((uint8_t)USART_IT >> (uint8_t)4);
2716  02a5 7b09          	ld	a,(OFST+6,sp)
2717  02a7 4e            	swap	a
2718  02a8 a40f          	and	a,#15
2719  02aa 6b03          	ld	(OFST+0,sp),a
2720                     ; 1100   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2722  02ac 7b03          	ld	a,(OFST+0,sp)
2723  02ae 5f            	clrw	x
2724  02af 97            	ld	xl,a
2725  02b0 a601          	ld	a,#1
2726  02b2 5d            	tnzw	x
2727  02b3 2704          	jreq	L47
2728  02b5               L67:
2729  02b5 48            	sll	a
2730  02b6 5a            	decw	x
2731  02b7 26fc          	jrne	L67
2732  02b9               L47:
2733  02b9 6b03          	ld	(OFST+0,sp),a
2734                     ; 1103   if (USART_IT == USART_IT_PE)
2736  02bb 1e08          	ldw	x,(OFST+5,sp)
2737  02bd a30100        	cpw	x,#256
2738  02c0 261d          	jrne	L5641
2739                     ; 1106     enablestatus = (uint8_t)((uint8_t)USARTx->CR1 & itmask2);
2741  02c2 1e04          	ldw	x,(OFST+1,sp)
2742  02c4 e604          	ld	a,(4,x)
2743  02c6 1403          	and	a,(OFST+0,sp)
2744  02c8 6b03          	ld	(OFST+0,sp),a
2745                     ; 1109     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2747  02ca 1e04          	ldw	x,(OFST+1,sp)
2748  02cc f6            	ld	a,(x)
2749  02cd 1502          	bcp	a,(OFST-1,sp)
2750  02cf 270a          	jreq	L7641
2752  02d1 0d03          	tnz	(OFST+0,sp)
2753  02d3 2706          	jreq	L7641
2754                     ; 1112       pendingbitstatus = SET;
2756  02d5 a601          	ld	a,#1
2757  02d7 6b03          	ld	(OFST+0,sp),a
2759  02d9 204f          	jra	L3741
2760  02db               L7641:
2761                     ; 1117       pendingbitstatus = RESET;
2763  02db 0f03          	clr	(OFST+0,sp)
2764  02dd 204b          	jra	L3741
2765  02df               L5641:
2766                     ; 1121   else if (USART_IT == USART_IT_OR)
2768  02df 1e08          	ldw	x,(OFST+5,sp)
2769  02e1 a30235        	cpw	x,#565
2770  02e4 2629          	jrne	L5741
2771                     ; 1124     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2773  02e6 1e04          	ldw	x,(OFST+1,sp)
2774  02e8 e605          	ld	a,(5,x)
2775  02ea 1403          	and	a,(OFST+0,sp)
2776  02ec 6b03          	ld	(OFST+0,sp),a
2777                     ; 1127     temp = (uint8_t)(USARTx->CR5 & USART_CR5_EIE);
2779  02ee 1e04          	ldw	x,(OFST+1,sp)
2780  02f0 e608          	ld	a,(8,x)
2781  02f2 a401          	and	a,#1
2782  02f4 6b01          	ld	(OFST-2,sp),a
2783                     ; 1129     if (( (USARTx->SR & itpos) != 0x00) && ((enablestatus || temp)))
2785  02f6 1e04          	ldw	x,(OFST+1,sp)
2786  02f8 f6            	ld	a,(x)
2787  02f9 1502          	bcp	a,(OFST-1,sp)
2788  02fb 270e          	jreq	L7741
2790  02fd 0d03          	tnz	(OFST+0,sp)
2791  02ff 2604          	jrne	L1051
2793  0301 0d01          	tnz	(OFST-2,sp)
2794  0303 2706          	jreq	L7741
2795  0305               L1051:
2796                     ; 1132       pendingbitstatus = SET;
2798  0305 a601          	ld	a,#1
2799  0307 6b03          	ld	(OFST+0,sp),a
2801  0309 201f          	jra	L3741
2802  030b               L7741:
2803                     ; 1137       pendingbitstatus = RESET;
2805  030b 0f03          	clr	(OFST+0,sp)
2806  030d 201b          	jra	L3741
2807  030f               L5741:
2808                     ; 1144     enablestatus = (uint8_t)((uint8_t)USARTx->CR2 & itmask2);
2810  030f 1e04          	ldw	x,(OFST+1,sp)
2811  0311 e605          	ld	a,(5,x)
2812  0313 1403          	and	a,(OFST+0,sp)
2813  0315 6b03          	ld	(OFST+0,sp),a
2814                     ; 1146     if (((USARTx->SR & itpos) != (uint8_t)0x00) && enablestatus)
2816  0317 1e04          	ldw	x,(OFST+1,sp)
2817  0319 f6            	ld	a,(x)
2818  031a 1502          	bcp	a,(OFST-1,sp)
2819  031c 270a          	jreq	L7051
2821  031e 0d03          	tnz	(OFST+0,sp)
2822  0320 2706          	jreq	L7051
2823                     ; 1149       pendingbitstatus = SET;
2825  0322 a601          	ld	a,#1
2826  0324 6b03          	ld	(OFST+0,sp),a
2828  0326 2002          	jra	L3741
2829  0328               L7051:
2830                     ; 1154       pendingbitstatus = RESET;
2832  0328 0f03          	clr	(OFST+0,sp)
2833  032a               L3741:
2834                     ; 1159   return  pendingbitstatus;
2836  032a 7b03          	ld	a,(OFST+0,sp)
2839  032c 5b05          	addw	sp,#5
2840  032e 81            	ret
2878                     ; 1183 void USART_ClearITPendingBit(USART_TypeDef* USARTx, USART_IT_TypeDef USART_IT)
2878                     ; 1184 {
2879                     	switch	.text
2880  032f               _USART_ClearITPendingBit:
2884                     ; 1185   assert_param(IS_USART_CLEAR_IT(USART_IT));
2886                     ; 1188   USARTx->SR &= (uint8_t)(~USART_SR_TC);
2888  032f f6            	ld	a,(x)
2889  0330 a4bf          	and	a,#191
2890  0332 f7            	ld	(x),a
2891                     ; 1189 }
2894  0333 81            	ret
2907                     	xdef	_USART_ClearITPendingBit
2908                     	xdef	_USART_GetITStatus
2909                     	xdef	_USART_ClearFlag
2910                     	xdef	_USART_GetFlagStatus
2911                     	xdef	_USART_ITConfig
2912                     	xdef	_USART_DMACmd
2913                     	xdef	_USART_IrDACmd
2914                     	xdef	_USART_IrDAConfig
2915                     	xdef	_USART_SetGuardTime
2916                     	xdef	_USART_SmartCardNACKCmd
2917                     	xdef	_USART_SmartCardCmd
2918                     	xdef	_USART_HalfDuplexCmd
2919                     	xdef	_USART_SetAddress
2920                     	xdef	_USART_ReceiverWakeUpCmd
2921                     	xdef	_USART_WakeUpConfig
2922                     	xdef	_USART_ReceiveData9
2923                     	xdef	_USART_ReceiveData8
2924                     	xdef	_USART_SendData9
2925                     	xdef	_USART_SendData8
2926                     	xdef	_USART_SendBreak
2927                     	xdef	_USART_SetPrescaler
2928                     	xdef	_USART_Cmd
2929                     	xdef	_USART_ClockInit
2930                     	xdef	_USART_Init
2931                     	xdef	_USART_DeInit
2932                     	xref	_CLK_GetClockFreq
2933                     	xref.b	c_lreg
2934                     	xref.b	c_x
2953                     	xref	c_lursh
2954                     	xref	c_ltor
2955                     	xref	c_rtol
2956                     	xref	c_ludv
2957                     	end
