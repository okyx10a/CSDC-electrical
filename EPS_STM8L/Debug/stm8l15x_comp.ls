   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  43                     ; 111 void COMP_DeInit(void)
  43                     ; 112 {
  45                     	switch	.text
  46  0000               _COMP_DeInit:
  50                     ; 114   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
  52  0000 725f5440      	clr	21568
  53                     ; 117   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
  55  0004 725f5441      	clr	21569
  56                     ; 120   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
  58  0008 35c05442      	mov	21570,#192
  59                     ; 123   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
  61  000c 725f5443      	clr	21571
  62                     ; 126   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
  64  0010 725f5444      	clr	21572
  65                     ; 127 }
  68  0014 81            	ret
 244                     ; 153 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
 244                     ; 154                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
 244                     ; 155 {
 245                     	switch	.text
 246  0015               _COMP_Init:
 248  0015 89            	pushw	x
 249       00000000      OFST:	set	0
 252                     ; 157   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 254                     ; 158   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 256                     ; 159   assert_param(IS_COMP_SPEED(COMP_Speed));
 258                     ; 162   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 260  0016 c65442        	ld	a,21570
 261  0019 a4c7          	and	a,#199
 262  001b c75442        	ld	21570,a
 263                     ; 164   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 265  001e 9e            	ld	a,xh
 266  001f ca5442        	or	a,21570
 267  0022 c75442        	ld	21570,a
 268                     ; 167   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 270  0025 c65442        	ld	a,21570
 271  0028 a43f          	and	a,#63
 272  002a c75442        	ld	21570,a
 273                     ; 169   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 275  002d 9f            	ld	a,xl
 276  002e ca5442        	or	a,21570
 277  0031 c75442        	ld	21570,a
 278                     ; 172   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 280  0034 72155441      	bres	21569,#2
 281                     ; 174   COMP->CSR2 |= (uint8_t) COMP_Speed;
 283  0038 c65441        	ld	a,21569
 284  003b 1a05          	or	a,(OFST+5,sp)
 285  003d c75441        	ld	21569,a
 286                     ; 175 }
 289  0040 85            	popw	x
 290  0041 81            	ret
 346                     ; 183 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 346                     ; 184 {
 347                     	switch	.text
 348  0042               _COMP_VrefintToCOMP1Connect:
 352                     ; 186   assert_param(IS_FUNCTIONAL_STATE(NewState));
 354                     ; 188   if (NewState != DISABLE)
 356  0042 4d            	tnz	a
 357  0043 2706          	jreq	L341
 358                     ; 191     COMP->CSR3 |= COMP_CSR3_VREFEN;
 360  0045 72145442      	bset	21570,#2
 362  0049 2004          	jra	L541
 363  004b               L341:
 364                     ; 196     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 366  004b 72155442      	bres	21570,#2
 367  004f               L541:
 368                     ; 198 }
 371  004f 81            	ret
 466                     ; 212 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 466                     ; 213 {
 467                     	switch	.text
 468  0050               _COMP_EdgeConfig:
 470  0050 89            	pushw	x
 471       00000000      OFST:	set	0
 474                     ; 215   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 476                     ; 216   assert_param(IS_COMP_EDGE(COMP_Edge));
 478                     ; 219   if (COMP_Selection == COMP_Selection_COMP1)
 480  0051 9e            	ld	a,xh
 481  0052 a101          	cp	a,#1
 482  0054 2611          	jrne	L312
 483                     ; 222     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 485  0056 c65440        	ld	a,21568
 486  0059 a4fc          	and	a,#252
 487  005b c75440        	ld	21568,a
 488                     ; 225     COMP->CSR1 |= (uint8_t) COMP_Edge;
 490  005e 9f            	ld	a,xl
 491  005f ca5440        	or	a,21568
 492  0062 c75440        	ld	21568,a
 494  0065 2010          	jra	L512
 495  0067               L312:
 496                     ; 231     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 498  0067 c65441        	ld	a,21569
 499  006a a4fc          	and	a,#252
 500  006c c75441        	ld	21569,a
 501                     ; 234     COMP->CSR2 |= (uint8_t) COMP_Edge;
 503  006f c65441        	ld	a,21569
 504  0072 1a02          	or	a,(OFST+2,sp)
 505  0074 c75441        	ld	21569,a
 506  0077               L512:
 507                     ; 236 }
 510  0077 85            	popw	x
 511  0078 81            	ret
 579                     ; 251 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 579                     ; 252 {
 580                     	switch	.text
 581  0079               _COMP_GetOutputLevel:
 583  0079 88            	push	a
 584       00000001      OFST:	set	1
 587                     ; 256   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 589                     ; 259   if (COMP_Selection == COMP_Selection_COMP1)
 591  007a a101          	cp	a,#1
 592  007c 2611          	jrne	L152
 593                     ; 262     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 595  007e c65440        	ld	a,21568
 596  0081 a508          	bcp	a,#8
 597  0083 2706          	jreq	L352
 598                     ; 265       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 600  0085 a601          	ld	a,#1
 601  0087 6b01          	ld	(OFST+0,sp),a
 603  0089 2013          	jra	L752
 604  008b               L352:
 605                     ; 271       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 607  008b 0f01          	clr	(OFST+0,sp)
 608  008d 200f          	jra	L752
 609  008f               L152:
 610                     ; 278     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 612  008f c65441        	ld	a,21569
 613  0092 a508          	bcp	a,#8
 614  0094 2706          	jreq	L162
 615                     ; 281       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 617  0096 a601          	ld	a,#1
 618  0098 6b01          	ld	(OFST+0,sp),a
 620  009a 2002          	jra	L752
 621  009c               L162:
 622                     ; 287       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 624  009c 0f01          	clr	(OFST+0,sp)
 625  009e               L752:
 626                     ; 292   return (COMP_OutputLevel_TypeDef)(compout);
 628  009e 7b01          	ld	a,(OFST+0,sp)
 631  00a0 5b01          	addw	sp,#1
 632  00a2 81            	ret
 667                     ; 324 void COMP_WindowCmd(FunctionalState NewState)
 667                     ; 325 {
 668                     	switch	.text
 669  00a3               _COMP_WindowCmd:
 673                     ; 327   assert_param(IS_FUNCTIONAL_STATE(NewState));
 675                     ; 329   if (NewState != DISABLE)
 677  00a3 4d            	tnz	a
 678  00a4 2706          	jreq	L303
 679                     ; 332     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 681  00a6 72125442      	bset	21570,#1
 683  00aa 2004          	jra	L503
 684  00ac               L303:
 685                     ; 337     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 687  00ac 72135442      	bres	21570,#1
 688  00b0               L503:
 689                     ; 339 }
 692  00b0 81            	ret
 728                     ; 362 void COMP_VrefintOutputCmd(FunctionalState NewState)
 728                     ; 363 {
 729                     	switch	.text
 730  00b1               _COMP_VrefintOutputCmd:
 734                     ; 365   assert_param(IS_FUNCTIONAL_STATE(NewState));
 736                     ; 367   if (NewState != DISABLE)
 738  00b1 4d            	tnz	a
 739  00b2 2706          	jreq	L523
 740                     ; 370     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 742  00b4 72105442      	bset	21570,#0
 744  00b8 2004          	jra	L723
 745  00ba               L523:
 746                     ; 375     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 748  00ba 72115442      	bres	21570,#0
 749  00be               L723:
 750                     ; 377 }
 753  00be 81            	ret
 789                     ; 401 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 789                     ; 402 {
 790                     	switch	.text
 791  00bf               _COMP_SchmittTriggerCmd:
 795                     ; 404   assert_param(IS_FUNCTIONAL_STATE(NewState));
 797                     ; 406   if (NewState != DISABLE)
 799  00bf 4d            	tnz	a
 800  00c0 2706          	jreq	L743
 801                     ; 409     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 803  00c2 72145440      	bset	21568,#2
 805  00c6 2004          	jra	L153
 806  00c8               L743:
 807                     ; 414     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 809  00c8 72155440      	bres	21568,#2
 810  00cc               L153:
 811                     ; 416 }
 814  00cc 81            	ret
 934                     ; 435 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 934                     ; 436                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 934                     ; 437                         FunctionalState NewState)
 934                     ; 438 {
 935                     	switch	.text
 936  00cd               _COMP_TriggerConfig:
 938  00cd 89            	pushw	x
 939       00000000      OFST:	set	0
 942                     ; 440   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 944                     ; 441   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 946                     ; 443   switch (COMP_TriggerGroup)
 948  00ce 9e            	ld	a,xh
 950                     ; 490     default:
 950                     ; 491       break;
 951  00cf 4a            	dec	a
 952  00d0 270b          	jreq	L353
 953  00d2 4a            	dec	a
 954  00d3 2721          	jreq	L553
 955  00d5 4a            	dec	a
 956  00d6 273d          	jreq	L753
 957  00d8 4a            	dec	a
 958  00d9 2753          	jreq	L163
 959  00db 206e          	jra	L344
 960  00dd               L353:
 961                     ; 445     case COMP_TriggerGroup_InvertingInput:
 961                     ; 446 
 961                     ; 447       if (NewState != DISABLE)
 963  00dd 0d05          	tnz	(OFST+5,sp)
 964  00df 270b          	jreq	L544
 965                     ; 449         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 967  00e1 7b02          	ld	a,(OFST+2,sp)
 968  00e3 43            	cpl	a
 969  00e4 c45443        	and	a,21571
 970  00e7 c75443        	ld	21571,a
 972  00ea 205f          	jra	L344
 973  00ec               L544:
 974                     ; 453         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 976  00ec c65443        	ld	a,21571
 977  00ef 1a02          	or	a,(OFST+2,sp)
 978  00f1 c75443        	ld	21571,a
 979  00f4 2055          	jra	L344
 980  00f6               L553:
 981                     ; 457     case COMP_TriggerGroup_NonInvertingInput:
 981                     ; 458       if (NewState != DISABLE)
 983  00f6 0d05          	tnz	(OFST+5,sp)
 984  00f8 270e          	jreq	L154
 985                     ; 460         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 987  00fa 7b02          	ld	a,(OFST+2,sp)
 988  00fc 48            	sll	a
 989  00fd 48            	sll	a
 990  00fe 48            	sll	a
 991  00ff 43            	cpl	a
 992  0100 c45443        	and	a,21571
 993  0103 c75443        	ld	21571,a
 995  0106 2043          	jra	L344
 996  0108               L154:
 997                     ; 464         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
 999  0108 7b02          	ld	a,(OFST+2,sp)
1000  010a 48            	sll	a
1001  010b 48            	sll	a
1002  010c 48            	sll	a
1003  010d ca5443        	or	a,21571
1004  0110 c75443        	ld	21571,a
1005  0113 2036          	jra	L344
1006  0115               L753:
1007                     ; 468     case COMP_TriggerGroup_VREFINTOutput:
1007                     ; 469       if (NewState != DISABLE)
1009  0115 0d05          	tnz	(OFST+5,sp)
1010  0117 270b          	jreq	L554
1011                     ; 471         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
1013  0119 7b02          	ld	a,(OFST+2,sp)
1014  011b 43            	cpl	a
1015  011c c45444        	and	a,21572
1016  011f c75444        	ld	21572,a
1018  0122 2027          	jra	L344
1019  0124               L554:
1020                     ; 475         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
1022  0124 c65444        	ld	a,21572
1023  0127 1a02          	or	a,(OFST+2,sp)
1024  0129 c75444        	ld	21572,a
1025  012c 201d          	jra	L344
1026  012e               L163:
1027                     ; 479     case COMP_TriggerGroup_DACOutput:
1027                     ; 480       if (NewState != DISABLE)
1029  012e 0d05          	tnz	(OFST+5,sp)
1030  0130 270e          	jreq	L164
1031                     ; 482         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
1033  0132 7b02          	ld	a,(OFST+2,sp)
1034  0134 48            	sll	a
1035  0135 48            	sll	a
1036  0136 48            	sll	a
1037  0137 43            	cpl	a
1038  0138 c45444        	and	a,21572
1039  013b c75444        	ld	21572,a
1041  013e 200b          	jra	L344
1042  0140               L164:
1043                     ; 486         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1045  0140 7b02          	ld	a,(OFST+2,sp)
1046  0142 48            	sll	a
1047  0143 48            	sll	a
1048  0144 48            	sll	a
1049  0145 ca5444        	or	a,21572
1050  0148 c75444        	ld	21572,a
1051  014b               L363:
1052                     ; 490     default:
1052                     ; 491       break;
1054  014b               L344:
1055                     ; 493 }
1058  014b 85            	popw	x
1059  014c 81            	ret
1104                     ; 521 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
1104                     ; 522 {
1105                     	switch	.text
1106  014d               _COMP_ITConfig:
1108  014d 89            	pushw	x
1109       00000000      OFST:	set	0
1112                     ; 524   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1114                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1116                     ; 528   if (COMP_Selection == COMP_Selection_COMP1)
1118  014e 9e            	ld	a,xh
1119  014f a101          	cp	a,#1
1120  0151 2610          	jrne	L705
1121                     ; 530     if (NewState != DISABLE)
1123  0153 9f            	ld	a,xl
1124  0154 4d            	tnz	a
1125  0155 2706          	jreq	L115
1126                     ; 533       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
1128  0157 721a5440      	bset	21568,#5
1130  015b 2014          	jra	L515
1131  015d               L115:
1132                     ; 538       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
1134  015d 721b5440      	bres	21568,#5
1135  0161 200e          	jra	L515
1136  0163               L705:
1137                     ; 543     if (NewState != DISABLE)
1139  0163 0d02          	tnz	(OFST+2,sp)
1140  0165 2706          	jreq	L715
1141                     ; 546       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
1143  0167 721a5441      	bset	21569,#5
1145  016b 2004          	jra	L515
1146  016d               L715:
1147                     ; 551       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
1149  016d 721b5441      	bres	21569,#5
1150  0171               L515:
1151                     ; 554 }
1154  0171 85            	popw	x
1155  0172 81            	ret
1221                     ; 564 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1221                     ; 565 {
1222                     	switch	.text
1223  0173               _COMP_GetFlagStatus:
1225  0173 88            	push	a
1226       00000001      OFST:	set	1
1229                     ; 566   FlagStatus bitstatus = RESET;
1231                     ; 569   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1233                     ; 572   if (COMP_Selection == COMP_Selection_COMP1)
1235  0174 a101          	cp	a,#1
1236  0176 2611          	jrne	L555
1237                     ; 574     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1239  0178 c65440        	ld	a,21568
1240  017b a510          	bcp	a,#16
1241  017d 2706          	jreq	L755
1242                     ; 577       bitstatus = SET;
1244  017f a601          	ld	a,#1
1245  0181 6b01          	ld	(OFST+0,sp),a
1247  0183 2013          	jra	L365
1248  0185               L755:
1249                     ; 582       bitstatus = RESET;
1251  0185 0f01          	clr	(OFST+0,sp)
1252  0187 200f          	jra	L365
1253  0189               L555:
1254                     ; 587     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1256  0189 c65441        	ld	a,21569
1257  018c a510          	bcp	a,#16
1258  018e 2706          	jreq	L565
1259                     ; 590       bitstatus = SET;
1261  0190 a601          	ld	a,#1
1262  0192 6b01          	ld	(OFST+0,sp),a
1264  0194 2002          	jra	L365
1265  0196               L565:
1266                     ; 595       bitstatus = RESET;
1268  0196 0f01          	clr	(OFST+0,sp)
1269  0198               L365:
1270                     ; 600   return (FlagStatus)(bitstatus);
1272  0198 7b01          	ld	a,(OFST+0,sp)
1275  019a 5b01          	addw	sp,#1
1276  019c 81            	ret
1311                     ; 611 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1311                     ; 612 {
1312                     	switch	.text
1313  019d               _COMP_ClearFlag:
1317                     ; 614   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1319                     ; 616   if (COMP_Selection == COMP_Selection_COMP1)
1321  019d a101          	cp	a,#1
1322  019f 2606          	jrne	L706
1323                     ; 619     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1325  01a1 72195440      	bres	21568,#4
1327  01a5 2004          	jra	L116
1328  01a7               L706:
1329                     ; 624     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1331  01a7 72195441      	bres	21569,#4
1332  01ab               L116:
1333                     ; 626 }
1336  01ab 81            	ret
1400                     ; 636 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1400                     ; 637 {
1401                     	switch	.text
1402  01ac               _COMP_GetITStatus:
1404  01ac 89            	pushw	x
1405       00000002      OFST:	set	2
1408                     ; 638   ITStatus bitstatus = RESET;
1410                     ; 639   uint8_t itstatus = 0x00, itenable = 0x00;
1414                     ; 642   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1416                     ; 644   if (COMP_Selection == COMP_Selection_COMP1)
1418  01ad a101          	cp	a,#1
1419  01af 2620          	jrne	L546
1420                     ; 647     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1422  01b1 c65440        	ld	a,21568
1423  01b4 a410          	and	a,#16
1424  01b6 6b01          	ld	(OFST-1,sp),a
1425                     ; 650     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1427  01b8 c65440        	ld	a,21568
1428  01bb a420          	and	a,#32
1429  01bd 6b02          	ld	(OFST+0,sp),a
1430                     ; 652     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
1432  01bf 0d01          	tnz	(OFST-1,sp)
1433  01c1 270a          	jreq	L746
1435  01c3 0d02          	tnz	(OFST+0,sp)
1436  01c5 2706          	jreq	L746
1437                     ; 655       bitstatus = SET;
1439  01c7 a601          	ld	a,#1
1440  01c9 6b02          	ld	(OFST+0,sp),a
1442  01cb 2022          	jra	L356
1443  01cd               L746:
1444                     ; 660       bitstatus = RESET;
1446  01cd 0f02          	clr	(OFST+0,sp)
1447  01cf 201e          	jra	L356
1448  01d1               L546:
1449                     ; 666     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
1451  01d1 c65441        	ld	a,21569
1452  01d4 a410          	and	a,#16
1453  01d6 6b01          	ld	(OFST-1,sp),a
1454                     ; 669     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1456  01d8 c65441        	ld	a,21569
1457  01db a420          	and	a,#32
1458  01dd 6b02          	ld	(OFST+0,sp),a
1459                     ; 671     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1461  01df 0d01          	tnz	(OFST-1,sp)
1462  01e1 270a          	jreq	L556
1464  01e3 0d02          	tnz	(OFST+0,sp)
1465  01e5 2706          	jreq	L556
1466                     ; 674       bitstatus = SET;
1468  01e7 a601          	ld	a,#1
1469  01e9 6b02          	ld	(OFST+0,sp),a
1471  01eb 2002          	jra	L356
1472  01ed               L556:
1473                     ; 679       bitstatus = RESET;
1475  01ed 0f02          	clr	(OFST+0,sp)
1476  01ef               L356:
1477                     ; 684   return (ITStatus) bitstatus;
1479  01ef 7b02          	ld	a,(OFST+0,sp)
1482  01f1 85            	popw	x
1483  01f2 81            	ret
1519                     ; 695 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1519                     ; 696 {
1520                     	switch	.text
1521  01f3               _COMP_ClearITPendingBit:
1525                     ; 698   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1527                     ; 700   if (COMP_Selection == COMP_Selection_COMP1)
1529  01f3 a101          	cp	a,#1
1530  01f5 2606          	jrne	L776
1531                     ; 703     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1533  01f7 72195440      	bres	21568,#4
1535  01fb 2004          	jra	L107
1536  01fd               L776:
1537                     ; 708     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1539  01fd 72195441      	bres	21569,#4
1540  0201               L107:
1541                     ; 710 }
1544  0201 81            	ret
1557                     	xdef	_COMP_ClearITPendingBit
1558                     	xdef	_COMP_GetITStatus
1559                     	xdef	_COMP_ClearFlag
1560                     	xdef	_COMP_GetFlagStatus
1561                     	xdef	_COMP_ITConfig
1562                     	xdef	_COMP_TriggerConfig
1563                     	xdef	_COMP_SchmittTriggerCmd
1564                     	xdef	_COMP_VrefintOutputCmd
1565                     	xdef	_COMP_WindowCmd
1566                     	xdef	_COMP_GetOutputLevel
1567                     	xdef	_COMP_EdgeConfig
1568                     	xdef	_COMP_VrefintToCOMP1Connect
1569                     	xdef	_COMP_Init
1570                     	xdef	_COMP_DeInit
1589                     	end
