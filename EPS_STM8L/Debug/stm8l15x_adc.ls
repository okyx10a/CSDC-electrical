   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
 174                     ; 135 void ADC_DeInit(ADC_TypeDef* ADCx)
 174                     ; 136 {
 176                     	switch	.text
 177  0000               _ADC_DeInit:
 181                     ; 138   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 183  0000 7f            	clr	(x)
 184                     ; 139   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 186  0001 6f01          	clr	(1,x)
 187                     ; 140   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 189  0003 a61f          	ld	a,#31
 190  0005 e702          	ld	(2,x),a
 191                     ; 143   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 193  0007 a6ff          	ld	a,#255
 194  0009 e703          	ld	(3,x),a
 195                     ; 146   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 197  000b a60f          	ld	a,#15
 198  000d e706          	ld	(6,x),a
 199                     ; 147   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 201  000f a6ff          	ld	a,#255
 202  0011 e707          	ld	(7,x),a
 203                     ; 150   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 205  0013 6f08          	clr	(8,x)
 206                     ; 151   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 208  0015 6f09          	clr	(9,x)
 209                     ; 154   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 211  0017 6f0a          	clr	(10,x)
 212                     ; 155   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 214  0019 6f0b          	clr	(11,x)
 215                     ; 156   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 217  001b 6f0c          	clr	(12,x)
 218                     ; 157   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 220  001d 6f0d          	clr	(13,x)
 221                     ; 160   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 223  001f 6f0e          	clr	(14,x)
 224                     ; 161   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 226  0021 6f0f          	clr	(15,x)
 227                     ; 162   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 229  0023 6f10          	clr	(16,x)
 230                     ; 163   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 232  0025 6f11          	clr	(17,x)
 233                     ; 164 }
 236  0027 81            	ret
 383                     ; 186 void ADC_Init(ADC_TypeDef* ADCx,
 383                     ; 187               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 383                     ; 188               ADC_Resolution_TypeDef ADC_Resolution,
 383                     ; 189               ADC_Prescaler_TypeDef ADC_Prescaler)
 383                     ; 190 {
 384                     	switch	.text
 385  0028               _ADC_Init:
 387  0028 89            	pushw	x
 388       00000000      OFST:	set	0
 391                     ; 192   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 393                     ; 193   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 395                     ; 194   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 397                     ; 197   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 399  0029 f6            	ld	a,(x)
 400  002a a49b          	and	a,#155
 401  002c f7            	ld	(x),a
 402                     ; 200   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 404  002d 7b05          	ld	a,(OFST+5,sp)
 405  002f 1a06          	or	a,(OFST+6,sp)
 406  0031 fa            	or	a,(x)
 407  0032 f7            	ld	(x),a
 408                     ; 203   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 410  0033 e601          	ld	a,(1,x)
 411  0035 a47f          	and	a,#127
 412  0037 e701          	ld	(1,x),a
 413                     ; 206   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 415  0039 e601          	ld	a,(1,x)
 416  003b 1a07          	or	a,(OFST+7,sp)
 417  003d e701          	ld	(1,x),a
 418                     ; 207 }
 421  003f 85            	popw	x
 422  0040 81            	ret
 489                     ; 216 void ADC_Cmd(ADC_TypeDef* ADCx,
 489                     ; 217              FunctionalState NewState)
 489                     ; 218 {
 490                     	switch	.text
 491  0041               _ADC_Cmd:
 493  0041 89            	pushw	x
 494       00000000      OFST:	set	0
 497                     ; 220   assert_param(IS_FUNCTIONAL_STATE(NewState));
 499                     ; 222   if (NewState != DISABLE)
 501  0042 0d05          	tnz	(OFST+5,sp)
 502  0044 2706          	jreq	L142
 503                     ; 225     ADCx->CR1 |= ADC_CR1_ADON;
 505  0046 f6            	ld	a,(x)
 506  0047 aa01          	or	a,#1
 507  0049 f7            	ld	(x),a
 509  004a 2006          	jra	L342
 510  004c               L142:
 511                     ; 230     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 513  004c 1e01          	ldw	x,(OFST+1,sp)
 514  004e f6            	ld	a,(x)
 515  004f a4fe          	and	a,#254
 516  0051 f7            	ld	(x),a
 517  0052               L342:
 518                     ; 232 }
 521  0052 85            	popw	x
 522  0053 81            	ret
 560                     ; 239 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 560                     ; 240 {
 561                     	switch	.text
 562  0054               _ADC_SoftwareStartConv:
 566                     ; 242   ADCx->CR1 |= ADC_CR1_START;
 568  0054 f6            	ld	a,(x)
 569  0055 aa02          	or	a,#2
 570  0057 f7            	ld	(x),a
 571                     ; 243 }
 574  0058 81            	ret
 702                     ; 261 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 702                     ; 262                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 702                     ; 263                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 702                     ; 264 {
 703                     	switch	.text
 704  0059               _ADC_ExternalTrigConfig:
 706  0059 89            	pushw	x
 707       00000000      OFST:	set	0
 710                     ; 266   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 712                     ; 267   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 714                     ; 270   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 716  005a e601          	ld	a,(1,x)
 717  005c a487          	and	a,#135
 718  005e e701          	ld	(1,x),a
 719                     ; 274   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 719                     ; 275                           (uint8_t)ADC_ExtEventSelection);
 721  0060 7b06          	ld	a,(OFST+6,sp)
 722  0062 1a05          	or	a,(OFST+5,sp)
 723  0064 ea01          	or	a,(1,x)
 724  0066 e701          	ld	(1,x),a
 725                     ; 276 }
 728  0068 85            	popw	x
 729  0069 81            	ret
1043                     ; 339 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1043                     ; 340                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1043                     ; 341 {
1044                     	switch	.text
1045  006a               _ADC_AnalogWatchdogChannelSelect:
1047  006a 89            	pushw	x
1048       00000000      OFST:	set	0
1051                     ; 343   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1053                     ; 346   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1055  006b e602          	ld	a,(2,x)
1056  006d a4e0          	and	a,#224
1057  006f e702          	ld	(2,x),a
1058                     ; 349   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1060  0071 e602          	ld	a,(2,x)
1061  0073 1a05          	or	a,(OFST+5,sp)
1062  0075 e702          	ld	(2,x),a
1063                     ; 350 }
1066  0077 85            	popw	x
1067  0078 81            	ret
1123                     ; 361 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1123                     ; 362 {
1124                     	switch	.text
1125  0079               _ADC_AnalogWatchdogThresholdsConfig:
1127  0079 89            	pushw	x
1128       00000000      OFST:	set	0
1131                     ; 364   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1133                     ; 365   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1135                     ; 368   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1137  007a 7b05          	ld	a,(OFST+5,sp)
1138  007c 1e01          	ldw	x,(OFST+1,sp)
1139  007e e706          	ld	(6,x),a
1140                     ; 369   ADCx->HTRL = (uint8_t)(HighThreshold);
1142  0080 7b06          	ld	a,(OFST+6,sp)
1143  0082 1e01          	ldw	x,(OFST+1,sp)
1144  0084 e707          	ld	(7,x),a
1145                     ; 372   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1147  0086 7b07          	ld	a,(OFST+7,sp)
1148  0088 1e01          	ldw	x,(OFST+1,sp)
1149  008a e708          	ld	(8,x),a
1150                     ; 373   ADCx->LTRL = (uint8_t)(LowThreshold);
1152  008c 7b08          	ld	a,(OFST+8,sp)
1153  008e 1e01          	ldw	x,(OFST+1,sp)
1154  0090 e709          	ld	(9,x),a
1155                     ; 374 }
1158  0092 85            	popw	x
1159  0093 81            	ret
1226                     ; 412 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1226                     ; 413                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1226                     ; 414                               uint16_t HighThreshold,
1226                     ; 415                               uint16_t LowThreshold)
1226                     ; 416 {
1227                     	switch	.text
1228  0094               _ADC_AnalogWatchdogConfig:
1230  0094 89            	pushw	x
1231       00000000      OFST:	set	0
1234                     ; 418   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1236                     ; 419   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1238                     ; 420   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1240                     ; 423   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1242  0095 e602          	ld	a,(2,x)
1243  0097 a4e0          	and	a,#224
1244  0099 e702          	ld	(2,x),a
1245                     ; 426   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1247  009b e602          	ld	a,(2,x)
1248  009d 1a05          	or	a,(OFST+5,sp)
1249  009f e702          	ld	(2,x),a
1250                     ; 429   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1252  00a1 7b06          	ld	a,(OFST+6,sp)
1253  00a3 1e01          	ldw	x,(OFST+1,sp)
1254  00a5 e706          	ld	(6,x),a
1255                     ; 430   ADCx->HTRL = (uint8_t)(HighThreshold);
1257  00a7 7b07          	ld	a,(OFST+7,sp)
1258  00a9 1e01          	ldw	x,(OFST+1,sp)
1259  00ab e707          	ld	(7,x),a
1260                     ; 433   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1262  00ad 7b08          	ld	a,(OFST+8,sp)
1263  00af 1e01          	ldw	x,(OFST+1,sp)
1264  00b1 e708          	ld	(8,x),a
1265                     ; 434   ADCx->LTRL = (uint8_t)LowThreshold;
1267  00b3 7b09          	ld	a,(OFST+9,sp)
1268  00b5 1e01          	ldw	x,(OFST+1,sp)
1269  00b7 e709          	ld	(9,x),a
1270                     ; 435 }
1273  00b9 85            	popw	x
1274  00ba 81            	ret
1309                     ; 474 void ADC_TempSensorCmd(FunctionalState NewState)
1309                     ; 475 {
1310                     	switch	.text
1311  00bb               _ADC_TempSensorCmd:
1315                     ; 477   assert_param(IS_FUNCTIONAL_STATE(NewState));
1317                     ; 479   if (NewState != DISABLE)
1319  00bb 4d            	tnz	a
1320  00bc 2706          	jreq	L175
1321                     ; 482     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1323  00be 721a534e      	bset	21326,#5
1325  00c2 2004          	jra	L375
1326  00c4               L175:
1327                     ; 487     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1329  00c4 721b534e      	bres	21326,#5
1330  00c8               L375:
1331                     ; 489 }
1334  00c8 81            	ret
1369                     ; 497 void ADC_VrefintCmd(FunctionalState NewState)
1369                     ; 498 {
1370                     	switch	.text
1371  00c9               _ADC_VrefintCmd:
1375                     ; 500   assert_param(IS_FUNCTIONAL_STATE(NewState));
1377                     ; 502   if (NewState != DISABLE)
1379  00c9 4d            	tnz	a
1380  00ca 2706          	jreq	L316
1381                     ; 505     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1383  00cc 7218534e      	bset	21326,#4
1385  00d0 2004          	jra	L516
1386  00d2               L316:
1387                     ; 510     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1389  00d2 7219534e      	bres	21326,#4
1390  00d6               L516:
1391                     ; 512 }
1394  00d6 81            	ret
1706                     ; 583 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1706                     ; 584 {
1707                     	switch	.text
1708  00d7               _ADC_ChannelCmd:
1710  00d7 89            	pushw	x
1711  00d8 88            	push	a
1712       00000001      OFST:	set	1
1715                     ; 585   uint8_t regindex = 0;
1717                     ; 587   assert_param(IS_FUNCTIONAL_STATE(NewState));
1719                     ; 589   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1721  00d9 7b06          	ld	a,(OFST+5,sp)
1722  00db 6b01          	ld	(OFST+0,sp),a
1723                     ; 591   if (NewState != DISABLE)
1725  00dd 0d08          	tnz	(OFST+7,sp)
1726  00df 270f          	jreq	L367
1727                     ; 594     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1729  00e1 01            	rrwa	x,a
1730  00e2 1b01          	add	a,(OFST+0,sp)
1731  00e4 2401          	jrnc	L23
1732  00e6 5c            	incw	x
1733  00e7               L23:
1734  00e7 02            	rlwa	x,a
1735  00e8 e60a          	ld	a,(10,x)
1736  00ea 1a07          	or	a,(OFST+6,sp)
1737  00ec e70a          	ld	(10,x),a
1739  00ee 2012          	jra	L567
1740  00f0               L367:
1741                     ; 599     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1743  00f0 7b02          	ld	a,(OFST+1,sp)
1744  00f2 97            	ld	xl,a
1745  00f3 7b03          	ld	a,(OFST+2,sp)
1746  00f5 1b01          	add	a,(OFST+0,sp)
1747  00f7 2401          	jrnc	L43
1748  00f9 5c            	incw	x
1749  00fa               L43:
1750  00fa 02            	rlwa	x,a
1751  00fb 7b07          	ld	a,(OFST+6,sp)
1752  00fd 43            	cpl	a
1753  00fe e40a          	and	a,(10,x)
1754  0100 e70a          	ld	(10,x),a
1755  0102               L567:
1756                     ; 601 }
1759  0102 5b03          	addw	sp,#3
1760  0104 81            	ret
1910                     ; 625 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1910                     ; 626                             ADC_Group_TypeDef ADC_GroupChannels,
1910                     ; 627                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1910                     ; 628 {
1911                     	switch	.text
1912  0105               _ADC_SamplingTimeConfig:
1914  0105 89            	pushw	x
1915       00000000      OFST:	set	0
1918                     ; 630   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1920                     ; 631   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1922                     ; 633   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1924  0106 0d05          	tnz	(OFST+5,sp)
1925  0108 2712          	jreq	L3501
1926                     ; 636     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1928  010a e602          	ld	a,(2,x)
1929  010c a41f          	and	a,#31
1930  010e e702          	ld	(2,x),a
1931                     ; 637     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1933  0110 7b06          	ld	a,(OFST+6,sp)
1934  0112 4e            	swap	a
1935  0113 48            	sll	a
1936  0114 a4e0          	and	a,#224
1937  0116 ea02          	or	a,(2,x)
1938  0118 e702          	ld	(2,x),a
1940  011a 2010          	jra	L5501
1941  011c               L3501:
1942                     ; 642     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1944  011c 1e01          	ldw	x,(OFST+1,sp)
1945  011e e601          	ld	a,(1,x)
1946  0120 a4f8          	and	a,#248
1947  0122 e701          	ld	(1,x),a
1948                     ; 643     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1950  0124 1e01          	ldw	x,(OFST+1,sp)
1951  0126 e601          	ld	a,(1,x)
1952  0128 1a06          	or	a,(OFST+6,sp)
1953  012a e701          	ld	(1,x),a
1954  012c               L5501:
1955                     ; 645 }
1958  012c 85            	popw	x
1959  012d 81            	ret
2026                     ; 691 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
2026                     ; 692                               FunctionalState NewState)
2026                     ; 693 {
2027                     	switch	.text
2028  012e               _ADC_SchmittTriggerConfig:
2030  012e 89            	pushw	x
2031  012f 88            	push	a
2032       00000001      OFST:	set	1
2035                     ; 694   uint8_t regindex = 0;
2037                     ; 696   assert_param(IS_FUNCTIONAL_STATE(NewState));
2039                     ; 698   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2041  0130 7b06          	ld	a,(OFST+5,sp)
2042  0132 6b01          	ld	(OFST+0,sp),a
2043                     ; 700   if (NewState != DISABLE)
2045  0134 0d08          	tnz	(OFST+7,sp)
2046  0136 2710          	jreq	L3111
2047                     ; 703     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2049  0138 01            	rrwa	x,a
2050  0139 1b01          	add	a,(OFST+0,sp)
2051  013b 2401          	jrnc	L24
2052  013d 5c            	incw	x
2053  013e               L24:
2054  013e 02            	rlwa	x,a
2055  013f 7b07          	ld	a,(OFST+6,sp)
2056  0141 43            	cpl	a
2057  0142 e40e          	and	a,(14,x)
2058  0144 e70e          	ld	(14,x),a
2060  0146 2011          	jra	L5111
2061  0148               L3111:
2062                     ; 708     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2064  0148 7b02          	ld	a,(OFST+1,sp)
2065  014a 97            	ld	xl,a
2066  014b 7b03          	ld	a,(OFST+2,sp)
2067  014d 1b01          	add	a,(OFST+0,sp)
2068  014f 2401          	jrnc	L44
2069  0151 5c            	incw	x
2070  0152               L44:
2071  0152 02            	rlwa	x,a
2072  0153 e60e          	ld	a,(14,x)
2073  0155 1a07          	or	a,(OFST+6,sp)
2074  0157 e70e          	ld	(14,x),a
2075  0159               L5111:
2076                     ; 710 }
2079  0159 5b03          	addw	sp,#3
2080  015b 81            	ret
2127                     ; 717 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2127                     ; 718 {
2128                     	switch	.text
2129  015c               _ADC_GetConversionValue:
2131  015c 89            	pushw	x
2132  015d 89            	pushw	x
2133       00000002      OFST:	set	2
2136                     ; 719   uint16_t tmpreg = 0;
2138                     ; 722   tmpreg = (uint16_t)(ADCx->DRH);
2140  015e e604          	ld	a,(4,x)
2141  0160 5f            	clrw	x
2142  0161 97            	ld	xl,a
2143  0162 1f01          	ldw	(OFST-1,sp),x
2144                     ; 723   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2146  0164 1e01          	ldw	x,(OFST-1,sp)
2147  0166 1603          	ldw	y,(OFST+1,sp)
2148  0168 90e605        	ld	a,(5,y)
2149  016b 02            	rlwa	x,a
2150  016c 1f01          	ldw	(OFST-1,sp),x
2151                     ; 726   return (uint16_t)(tmpreg) ;
2153  016e 1e01          	ldw	x,(OFST-1,sp)
2156  0170 5b04          	addw	sp,#4
2157  0172 81            	ret
2204                     ; 760 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2204                     ; 761 {
2205                     	switch	.text
2206  0173               _ADC_DMACmd:
2208  0173 89            	pushw	x
2209       00000000      OFST:	set	0
2212                     ; 763   assert_param(IS_FUNCTIONAL_STATE(NewState));
2214                     ; 765   if (NewState != DISABLE)
2216  0174 0d05          	tnz	(OFST+5,sp)
2217  0176 2708          	jreq	L7611
2218                     ; 768     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2220  0178 e60a          	ld	a,(10,x)
2221  017a a47f          	and	a,#127
2222  017c e70a          	ld	(10,x),a
2224  017e 2008          	jra	L1711
2225  0180               L7611:
2226                     ; 773     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2228  0180 1e01          	ldw	x,(OFST+1,sp)
2229  0182 e60a          	ld	a,(10,x)
2230  0184 aa80          	or	a,#128
2231  0186 e70a          	ld	(10,x),a
2232  0188               L1711:
2233                     ; 775 }
2236  0188 85            	popw	x
2237  0189 81            	ret
2321                     ; 831 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2321                     ; 832 {
2322                     	switch	.text
2323  018a               _ADC_ITConfig:
2325  018a 89            	pushw	x
2326       00000000      OFST:	set	0
2329                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2331                     ; 835   assert_param(IS_ADC_IT(ADC_IT));
2333                     ; 837   if (NewState != DISABLE)
2335  018b 0d06          	tnz	(OFST+6,sp)
2336  018d 2706          	jreq	L5321
2337                     ; 840     ADCx->CR1 |= (uint8_t) ADC_IT;
2339  018f f6            	ld	a,(x)
2340  0190 1a05          	or	a,(OFST+5,sp)
2341  0192 f7            	ld	(x),a
2343  0193 2007          	jra	L7321
2344  0195               L5321:
2345                     ; 845     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2347  0195 1e01          	ldw	x,(OFST+1,sp)
2348  0197 7b05          	ld	a,(OFST+5,sp)
2349  0199 43            	cpl	a
2350  019a f4            	and	a,(x)
2351  019b f7            	ld	(x),a
2352  019c               L7321:
2353                     ; 847 }
2356  019c 85            	popw	x
2357  019d 81            	ret
2462                     ; 859 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2462                     ; 860 {
2463                     	switch	.text
2464  019e               _ADC_GetFlagStatus:
2466  019e 89            	pushw	x
2467  019f 88            	push	a
2468       00000001      OFST:	set	1
2471                     ; 861   FlagStatus flagstatus = RESET;
2473                     ; 864   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2475                     ; 867   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2477  01a0 e603          	ld	a,(3,x)
2478  01a2 1506          	bcp	a,(OFST+5,sp)
2479  01a4 2706          	jreq	L3131
2480                     ; 870     flagstatus = SET;
2482  01a6 a601          	ld	a,#1
2483  01a8 6b01          	ld	(OFST+0,sp),a
2485  01aa 2002          	jra	L5131
2486  01ac               L3131:
2487                     ; 875     flagstatus = RESET;
2489  01ac 0f01          	clr	(OFST+0,sp)
2490  01ae               L5131:
2491                     ; 879   return  flagstatus;
2493  01ae 7b01          	ld	a,(OFST+0,sp)
2496  01b0 5b03          	addw	sp,#3
2497  01b2 81            	ret
2544                     ; 892 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2544                     ; 893                    ADC_FLAG_TypeDef ADC_FLAG)
2544                     ; 894 {
2545                     	switch	.text
2546  01b3               _ADC_ClearFlag:
2548  01b3 89            	pushw	x
2549       00000000      OFST:	set	0
2552                     ; 896   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2554                     ; 899   ADCx->SR = (uint8_t)~ADC_FLAG;
2556  01b4 7b05          	ld	a,(OFST+5,sp)
2557  01b6 43            	cpl	a
2558  01b7 1e01          	ldw	x,(OFST+1,sp)
2559  01b9 e703          	ld	(3,x),a
2560                     ; 900 }
2563  01bb 85            	popw	x
2564  01bc 81            	ret
2640                     ; 912 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2640                     ; 913                          ADC_IT_TypeDef ADC_IT)
2640                     ; 914 {
2641                     	switch	.text
2642  01bd               _ADC_GetITStatus:
2644  01bd 89            	pushw	x
2645  01be 5203          	subw	sp,#3
2646       00000003      OFST:	set	3
2649                     ; 915   ITStatus itstatus = RESET;
2651                     ; 916   uint8_t itmask = 0, enablestatus = 0;
2655                     ; 919   assert_param(IS_ADC_GET_IT(ADC_IT));
2657                     ; 922   itmask = (uint8_t)(ADC_IT >> 3);
2659  01c0 7b08          	ld	a,(OFST+5,sp)
2660  01c2 44            	srl	a
2661  01c3 44            	srl	a
2662  01c4 44            	srl	a
2663  01c5 6b03          	ld	(OFST+0,sp),a
2664                     ; 923   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2664                     ; 924                                 (uint8_t)(itmask & (uint8_t)0x03));
2666  01c7 7b03          	ld	a,(OFST+0,sp)
2667  01c9 a403          	and	a,#3
2668  01cb 6b01          	ld	(OFST-2,sp),a
2669  01cd 7b03          	ld	a,(OFST+0,sp)
2670  01cf a410          	and	a,#16
2671  01d1 44            	srl	a
2672  01d2 44            	srl	a
2673  01d3 1a01          	or	a,(OFST-2,sp)
2674  01d5 6b03          	ld	(OFST+0,sp),a
2675                     ; 927   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2677  01d7 f6            	ld	a,(x)
2678  01d8 1408          	and	a,(OFST+5,sp)
2679  01da 6b02          	ld	(OFST-1,sp),a
2680                     ; 930   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2682  01dc e603          	ld	a,(3,x)
2683  01de 1503          	bcp	a,(OFST+0,sp)
2684  01e0 270a          	jreq	L3041
2686  01e2 0d02          	tnz	(OFST-1,sp)
2687  01e4 2706          	jreq	L3041
2688                     ; 933     itstatus = SET;
2690  01e6 a601          	ld	a,#1
2691  01e8 6b03          	ld	(OFST+0,sp),a
2693  01ea 2002          	jra	L5041
2694  01ec               L3041:
2695                     ; 938     itstatus = RESET;
2697  01ec 0f03          	clr	(OFST+0,sp)
2698  01ee               L5041:
2699                     ; 942   return  itstatus;
2701  01ee 7b03          	ld	a,(OFST+0,sp)
2704  01f0 5b05          	addw	sp,#5
2705  01f2 81            	ret
2762                     ; 955 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2762                     ; 956                            ADC_IT_TypeDef ADC_IT)
2762                     ; 957 {
2763                     	switch	.text
2764  01f3               _ADC_ClearITPendingBit:
2766  01f3 89            	pushw	x
2767  01f4 89            	pushw	x
2768       00000002      OFST:	set	2
2771                     ; 958   uint8_t itmask = 0;
2773                     ; 961   assert_param(IS_ADC_IT(ADC_IT));
2775                     ; 964   itmask = (uint8_t)(ADC_IT >> 3);
2777  01f5 7b07          	ld	a,(OFST+5,sp)
2778  01f7 44            	srl	a
2779  01f8 44            	srl	a
2780  01f9 44            	srl	a
2781  01fa 6b02          	ld	(OFST+0,sp),a
2782                     ; 965   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2782                     ; 966                                  (uint8_t)(itmask & (uint8_t)0x03));
2784  01fc 7b02          	ld	a,(OFST+0,sp)
2785  01fe a403          	and	a,#3
2786  0200 6b01          	ld	(OFST-1,sp),a
2787  0202 7b02          	ld	a,(OFST+0,sp)
2788  0204 a410          	and	a,#16
2789  0206 44            	srl	a
2790  0207 44            	srl	a
2791  0208 1a01          	or	a,(OFST-1,sp)
2792  020a 6b02          	ld	(OFST+0,sp),a
2793                     ; 969   ADCx->SR = (uint8_t)~itmask;
2795  020c 7b02          	ld	a,(OFST+0,sp)
2796  020e 43            	cpl	a
2797  020f 1e03          	ldw	x,(OFST+1,sp)
2798  0211 e703          	ld	(3,x),a
2799                     ; 970 }
2802  0213 5b04          	addw	sp,#4
2803  0215 81            	ret
2816                     	xdef	_ADC_ClearITPendingBit
2817                     	xdef	_ADC_GetITStatus
2818                     	xdef	_ADC_ClearFlag
2819                     	xdef	_ADC_GetFlagStatus
2820                     	xdef	_ADC_ITConfig
2821                     	xdef	_ADC_DMACmd
2822                     	xdef	_ADC_GetConversionValue
2823                     	xdef	_ADC_SchmittTriggerConfig
2824                     	xdef	_ADC_SamplingTimeConfig
2825                     	xdef	_ADC_ChannelCmd
2826                     	xdef	_ADC_VrefintCmd
2827                     	xdef	_ADC_TempSensorCmd
2828                     	xdef	_ADC_AnalogWatchdogConfig
2829                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2830                     	xdef	_ADC_AnalogWatchdogChannelSelect
2831                     	xdef	_ADC_ExternalTrigConfig
2832                     	xdef	_ADC_SoftwareStartConv
2833                     	xdef	_ADC_Cmd
2834                     	xdef	_ADC_Init
2835                     	xdef	_ADC_DeInit
2854                     	end
