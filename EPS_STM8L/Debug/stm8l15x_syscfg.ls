   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  43                     ; 119 void SYSCFG_RIDeInit(void)
  43                     ; 120 {
  45                     	switch	.text
  46  0000               _SYSCFG_RIDeInit:
  50                     ; 121   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  52  0000 725f5431      	clr	21553
  53                     ; 122   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  55  0004 725f5432      	clr	21554
  56                     ; 123   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  58  0008 725f5439      	clr	21561
  59                     ; 124   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  61  000c 725f543a      	clr	21562
  62                     ; 125   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  64  0010 725f543b      	clr	21563
  65                     ; 126   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  67  0014 725f5457      	clr	21591
  68                     ; 127   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  70  0018 725f543d      	clr	21565
  71                     ; 128   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  73  001c 725f543e      	clr	21566
  74                     ; 129   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  76  0020 725f543f      	clr	21567
  77                     ; 130 }
  80  0024 81            	ret
 339                     ; 142 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 339                     ; 143                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 339                     ; 144 {
 340                     	switch	.text
 341  0025               _SYSCFG_RITIMInputCaptureConfig:
 343  0025 89            	pushw	x
 344       00000000      OFST:	set	0
 347                     ; 146   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 349                     ; 147   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 351                     ; 150   if (RI_InputCapture == RI_InputCapture_IC2)
 353  0026 9e            	ld	a,xh
 354  0027 a102          	cp	a,#2
 355  0029 2606          	jrne	L531
 356                     ; 153     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 358  002b 9f            	ld	a,xl
 359  002c c75431        	ld	21553,a
 361  002f 2005          	jra	L731
 362  0031               L531:
 363                     ; 159     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 365  0031 7b02          	ld	a,(OFST+2,sp)
 366  0033 c75432        	ld	21554,a
 367  0036               L731:
 368                     ; 161 }
 371  0036 85            	popw	x
 372  0037 81            	ret
 554                     ; 184 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 554                     ; 185                                  FunctionalState NewState)
 554                     ; 186 {
 555                     	switch	.text
 556  0038               _SYSCFG_RIAnalogSwitchConfig:
 558  0038 89            	pushw	x
 559  0039 89            	pushw	x
 560       00000002      OFST:	set	2
 563                     ; 187   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
 565                     ; 190   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
 567                     ; 191   assert_param(IS_FUNCTIONAL_STATE(NewState));
 569                     ; 194   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
 571  003a 9e            	ld	a,xh
 572  003b a4f0          	and	a,#240
 573  003d 6b01          	ld	(OFST-1,sp),a
 574                     ; 197   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
 576  003f 7b03          	ld	a,(OFST+1,sp)
 577  0041 a40f          	and	a,#15
 578  0043 6b02          	ld	(OFST+0,sp),a
 579                     ; 199   if (NewState != DISABLE)
 581  0045 0d04          	tnz	(OFST+2,sp)
 582  0047 2730          	jreq	L142
 583                     ; 201     if (AnalogSwitchRegister == (uint8_t) 0x10)
 585  0049 7b01          	ld	a,(OFST-1,sp)
 586  004b a110          	cp	a,#16
 587  004d 2615          	jrne	L342
 588                     ; 204       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 590  004f 7b02          	ld	a,(OFST+0,sp)
 591  0051 5f            	clrw	x
 592  0052 97            	ld	xl,a
 593  0053 a601          	ld	a,#1
 594  0055 5d            	tnzw	x
 595  0056 2704          	jreq	L21
 596  0058               L41:
 597  0058 48            	sll	a
 598  0059 5a            	decw	x
 599  005a 26fc          	jrne	L41
 600  005c               L21:
 601  005c ca543d        	or	a,21565
 602  005f c7543d        	ld	21565,a
 604  0062 2045          	jra	L742
 605  0064               L342:
 606                     ; 209       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 608  0064 7b02          	ld	a,(OFST+0,sp)
 609  0066 5f            	clrw	x
 610  0067 97            	ld	xl,a
 611  0068 a601          	ld	a,#1
 612  006a 5d            	tnzw	x
 613  006b 2704          	jreq	L61
 614  006d               L02:
 615  006d 48            	sll	a
 616  006e 5a            	decw	x
 617  006f 26fc          	jrne	L02
 618  0071               L61:
 619  0071 ca543e        	or	a,21566
 620  0074 c7543e        	ld	21566,a
 621  0077 2030          	jra	L742
 622  0079               L142:
 623                     ; 214     if (AnalogSwitchRegister == (uint8_t) 0x10)
 625  0079 7b01          	ld	a,(OFST-1,sp)
 626  007b a110          	cp	a,#16
 627  007d 2616          	jrne	L152
 628                     ; 217       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 630  007f 7b02          	ld	a,(OFST+0,sp)
 631  0081 5f            	clrw	x
 632  0082 97            	ld	xl,a
 633  0083 a601          	ld	a,#1
 634  0085 5d            	tnzw	x
 635  0086 2704          	jreq	L22
 636  0088               L42:
 637  0088 48            	sll	a
 638  0089 5a            	decw	x
 639  008a 26fc          	jrne	L42
 640  008c               L22:
 641  008c 43            	cpl	a
 642  008d c4543d        	and	a,21565
 643  0090 c7543d        	ld	21565,a
 645  0093 2014          	jra	L742
 646  0095               L152:
 647                     ; 222       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 649  0095 7b02          	ld	a,(OFST+0,sp)
 650  0097 5f            	clrw	x
 651  0098 97            	ld	xl,a
 652  0099 a601          	ld	a,#1
 653  009b 5d            	tnzw	x
 654  009c 2704          	jreq	L62
 655  009e               L03:
 656  009e 48            	sll	a
 657  009f 5a            	decw	x
 658  00a0 26fc          	jrne	L03
 659  00a2               L62:
 660  00a2 43            	cpl	a
 661  00a3 c4543e        	and	a,21566
 662  00a6 c7543e        	ld	21566,a
 663  00a9               L742:
 664                     ; 225 }
 667  00a9 5b04          	addw	sp,#4
 668  00ab 81            	ret
 934                     ; 234 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 934                     ; 235                              FunctionalState NewState)
 934                     ; 236 {
 935                     	switch	.text
 936  00ac               _SYSCFG_RIIOSwitchConfig:
 938  00ac 89            	pushw	x
 939  00ad 89            	pushw	x
 940       00000002      OFST:	set	2
 943                     ; 237   uint8_t IOSwitchRegister, IOSwitchIndex = 0;
 945                     ; 240   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 947                     ; 241   assert_param(IS_FUNCTIONAL_STATE(NewState));
 949                     ; 244   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 951  00ae 9e            	ld	a,xh
 952  00af a40f          	and	a,#15
 953  00b1 6b02          	ld	(OFST+0,sp),a
 954                     ; 247   IOSwitchRegister = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 956  00b3 7b03          	ld	a,(OFST+1,sp)
 957  00b5 a4f0          	and	a,#240
 958  00b7 6b01          	ld	(OFST-1,sp),a
 959                     ; 250   if (IOSwitchRegister == (uint8_t) 0x10)
 961  00b9 7b01          	ld	a,(OFST-1,sp)
 962  00bb a110          	cp	a,#16
 963  00bd 2633          	jrne	L304
 964                     ; 252     if (NewState != DISABLE)
 966  00bf 0d04          	tnz	(OFST+2,sp)
 967  00c1 2717          	jreq	L504
 968                     ; 255       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 970  00c3 7b02          	ld	a,(OFST+0,sp)
 971  00c5 5f            	clrw	x
 972  00c6 97            	ld	xl,a
 973  00c7 a601          	ld	a,#1
 974  00c9 5d            	tnzw	x
 975  00ca 2704          	jreq	L43
 976  00cc               L63:
 977  00cc 48            	sll	a
 978  00cd 5a            	decw	x
 979  00ce 26fc          	jrne	L63
 980  00d0               L43:
 981  00d0 ca5439        	or	a,21561
 982  00d3 c75439        	ld	21561,a
 984  00d6 ac890189      	jpf	L114
 985  00da               L504:
 986                     ; 260       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 988  00da 7b02          	ld	a,(OFST+0,sp)
 989  00dc 5f            	clrw	x
 990  00dd 97            	ld	xl,a
 991  00de a601          	ld	a,#1
 992  00e0 5d            	tnzw	x
 993  00e1 2704          	jreq	L04
 994  00e3               L24:
 995  00e3 48            	sll	a
 996  00e4 5a            	decw	x
 997  00e5 26fc          	jrne	L24
 998  00e7               L04:
 999  00e7 43            	cpl	a
1000  00e8 c45439        	and	a,21561
1001  00eb c75439        	ld	21561,a
1002  00ee ac890189      	jpf	L114
1003  00f2               L304:
1004                     ; 265   else if (IOSwitchRegister == (uint8_t) 0x20)
1006  00f2 7b01          	ld	a,(OFST-1,sp)
1007  00f4 a120          	cp	a,#32
1008  00f6 262f          	jrne	L314
1009                     ; 267     if (NewState != DISABLE)
1011  00f8 0d04          	tnz	(OFST+2,sp)
1012  00fa 2715          	jreq	L514
1013                     ; 270       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1015  00fc 7b02          	ld	a,(OFST+0,sp)
1016  00fe 5f            	clrw	x
1017  00ff 97            	ld	xl,a
1018  0100 a601          	ld	a,#1
1019  0102 5d            	tnzw	x
1020  0103 2704          	jreq	L44
1021  0105               L64:
1022  0105 48            	sll	a
1023  0106 5a            	decw	x
1024  0107 26fc          	jrne	L64
1025  0109               L44:
1026  0109 ca543a        	or	a,21562
1027  010c c7543a        	ld	21562,a
1029  010f 2078          	jra	L114
1030  0111               L514:
1031                     ; 275       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1033  0111 7b02          	ld	a,(OFST+0,sp)
1034  0113 5f            	clrw	x
1035  0114 97            	ld	xl,a
1036  0115 a601          	ld	a,#1
1037  0117 5d            	tnzw	x
1038  0118 2704          	jreq	L05
1039  011a               L25:
1040  011a 48            	sll	a
1041  011b 5a            	decw	x
1042  011c 26fc          	jrne	L25
1043  011e               L05:
1044  011e 43            	cpl	a
1045  011f c4543a        	and	a,21562
1046  0122 c7543a        	ld	21562,a
1047  0125 2062          	jra	L114
1048  0127               L314:
1049                     ; 280   else if (IOSwitchRegister == (uint8_t) 0x30)
1051  0127 7b01          	ld	a,(OFST-1,sp)
1052  0129 a130          	cp	a,#48
1053  012b 262f          	jrne	L324
1054                     ; 282     if (NewState != DISABLE)
1056  012d 0d04          	tnz	(OFST+2,sp)
1057  012f 2715          	jreq	L524
1058                     ; 285       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1060  0131 7b02          	ld	a,(OFST+0,sp)
1061  0133 5f            	clrw	x
1062  0134 97            	ld	xl,a
1063  0135 a601          	ld	a,#1
1064  0137 5d            	tnzw	x
1065  0138 2704          	jreq	L45
1066  013a               L65:
1067  013a 48            	sll	a
1068  013b 5a            	decw	x
1069  013c 26fc          	jrne	L65
1070  013e               L45:
1071  013e ca543b        	or	a,21563
1072  0141 c7543b        	ld	21563,a
1074  0144 2043          	jra	L114
1075  0146               L524:
1076                     ; 290       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1078  0146 7b02          	ld	a,(OFST+0,sp)
1079  0148 5f            	clrw	x
1080  0149 97            	ld	xl,a
1081  014a a601          	ld	a,#1
1082  014c 5d            	tnzw	x
1083  014d 2704          	jreq	L06
1084  014f               L26:
1085  014f 48            	sll	a
1086  0150 5a            	decw	x
1087  0151 26fc          	jrne	L26
1088  0153               L06:
1089  0153 43            	cpl	a
1090  0154 c4543b        	and	a,21563
1091  0157 c7543b        	ld	21563,a
1092  015a 202d          	jra	L114
1093  015c               L324:
1094                     ; 297     if (NewState != DISABLE)
1096  015c 0d04          	tnz	(OFST+2,sp)
1097  015e 2715          	jreq	L334
1098                     ; 300       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1100  0160 7b02          	ld	a,(OFST+0,sp)
1101  0162 5f            	clrw	x
1102  0163 97            	ld	xl,a
1103  0164 a601          	ld	a,#1
1104  0166 5d            	tnzw	x
1105  0167 2704          	jreq	L46
1106  0169               L66:
1107  0169 48            	sll	a
1108  016a 5a            	decw	x
1109  016b 26fc          	jrne	L66
1110  016d               L46:
1111  016d ca5457        	or	a,21591
1112  0170 c75457        	ld	21591,a
1114  0173 2014          	jra	L114
1115  0175               L334:
1116                     ; 305       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1118  0175 7b02          	ld	a,(OFST+0,sp)
1119  0177 5f            	clrw	x
1120  0178 97            	ld	xl,a
1121  0179 a601          	ld	a,#1
1122  017b 5d            	tnzw	x
1123  017c 2704          	jreq	L07
1124  017e               L27:
1125  017e 48            	sll	a
1126  017f 5a            	decw	x
1127  0180 26fc          	jrne	L27
1128  0182               L07:
1129  0182 43            	cpl	a
1130  0183 c45457        	and	a,21591
1131  0186 c75457        	ld	21591,a
1132  0189               L114:
1133                     ; 308 }
1136  0189 5b04          	addw	sp,#4
1137  018b 81            	ret
1217                     ; 320 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1217                     ; 321 {
1218                     	switch	.text
1219  018c               _SYSCFG_RIResistorConfig:
1221  018c 89            	pushw	x
1222       00000000      OFST:	set	0
1225                     ; 323   assert_param(IS_RI_RESISTOR(RI_Resistor));
1227                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
1229                     ; 326   if (NewState != DISABLE)
1231  018d 9f            	ld	a,xl
1232  018e 4d            	tnz	a
1233  018f 2709          	jreq	L574
1234                     ; 329     RI->RCR |= (uint8_t) RI_Resistor;
1236  0191 9e            	ld	a,xh
1237  0192 ca543f        	or	a,21567
1238  0195 c7543f        	ld	21567,a
1240  0198 2009          	jra	L774
1241  019a               L574:
1242                     ; 334     RI->RCR &= (uint8_t) (~RI_Resistor);
1244  019a 7b01          	ld	a,(OFST+1,sp)
1245  019c 43            	cpl	a
1246  019d c4543f        	and	a,21567
1247  01a0 c7543f        	ld	21567,a
1248  01a3               L774:
1249                     ; 336 }
1252  01a3 85            	popw	x
1253  01a4 81            	ret
1276                     ; 368 void SYSCFG_REMAPDeInit(void)
1276                     ; 369 {
1277                     	switch	.text
1278  01a5               _SYSCFG_REMAPDeInit:
1282                     ; 371   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1284  01a5 350c509e      	mov	20638,#12
1285                     ; 374   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1287  01a9 725f509f      	clr	20639
1288                     ; 377   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1290  01ad 725f509d      	clr	20637
1291                     ; 378 }
1294  01b1 81            	ret
1512                     ; 411 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1512                     ; 412 {
1513                     	switch	.text
1514  01b2               _SYSCFG_REMAPPinConfig:
1516  01b2 89            	pushw	x
1517  01b3 88            	push	a
1518       00000001      OFST:	set	1
1521                     ; 413   uint8_t regindex = 0;
1523                     ; 415   assert_param(IS_REMAP_PIN(REMAP_Pin));
1525                     ; 416   assert_param(IS_FUNCTIONAL_STATE(NewState));
1527                     ; 419   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1529  01b4 9e            	ld	a,xh
1530  01b5 6b01          	ld	(OFST+0,sp),a
1531                     ; 422   if (regindex == 0x01)
1533  01b7 7b01          	ld	a,(OFST+0,sp)
1534  01b9 a101          	cp	a,#1
1535  01bb 261e          	jrne	L316
1536                     ; 424     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1538  01bd 9f            	ld	a,xl
1539  01be 97            	ld	xl,a
1540  01bf a610          	ld	a,#16
1541  01c1 42            	mul	x,a
1542  01c2 9f            	ld	a,xl
1543  01c3 aa0f          	or	a,#15
1544  01c5 c4509e        	and	a,20638
1545  01c8 c7509e        	ld	20638,a
1546                     ; 425     if (NewState != DISABLE)
1548  01cb 0d06          	tnz	(OFST+5,sp)
1549  01cd 2742          	jreq	L716
1550                     ; 427       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1552  01cf 7b03          	ld	a,(OFST+2,sp)
1553  01d1 a4f0          	and	a,#240
1554  01d3 ca509e        	or	a,20638
1555  01d6 c7509e        	ld	20638,a
1556  01d9 2036          	jra	L716
1557  01db               L316:
1558                     ; 431   else if (regindex == 0x02)
1560  01db 7b01          	ld	a,(OFST+0,sp)
1561  01dd a102          	cp	a,#2
1562  01df 2619          	jrne	L126
1563                     ; 433     if (NewState != DISABLE)
1565  01e1 0d06          	tnz	(OFST+5,sp)
1566  01e3 270a          	jreq	L326
1567                     ; 435       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1569  01e5 c6509f        	ld	a,20639
1570  01e8 1a03          	or	a,(OFST+2,sp)
1571  01ea c7509f        	ld	20639,a
1573  01ed 2022          	jra	L716
1574  01ef               L326:
1575                     ; 439       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1577  01ef 7b03          	ld	a,(OFST+2,sp)
1578  01f1 43            	cpl	a
1579  01f2 c4509f        	and	a,20639
1580  01f5 c7509f        	ld	20639,a
1581  01f8 2017          	jra	L716
1582  01fa               L126:
1583                     ; 445     if (NewState != DISABLE)
1585  01fa 0d06          	tnz	(OFST+5,sp)
1586  01fc 270a          	jreq	L136
1587                     ; 447       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1589  01fe c6509d        	ld	a,20637
1590  0201 1a03          	or	a,(OFST+2,sp)
1591  0203 c7509d        	ld	20637,a
1593  0206 2009          	jra	L716
1594  0208               L136:
1595                     ; 451       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1597  0208 7b03          	ld	a,(OFST+2,sp)
1598  020a 43            	cpl	a
1599  020b c4509d        	and	a,20637
1600  020e c7509d        	ld	20637,a
1601  0211               L716:
1602                     ; 454 }
1605  0211 5b03          	addw	sp,#3
1606  0213 81            	ret
1712                     ; 470 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1712                     ; 471 {
1713                     	switch	.text
1714  0214               _SYSCFG_REMAPDMAChannelConfig:
1716  0214 88            	push	a
1717       00000000      OFST:	set	0
1720                     ; 473   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1722                     ; 476   if ((REMAP_DMAChannel & 0xF0) != RESET)
1724  0215 a5f0          	bcp	a,#240
1725  0217 270a          	jreq	L776
1726                     ; 479     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1728  0219 c6509e        	ld	a,20638
1729  021c a4f3          	and	a,#243
1730  021e c7509e        	ld	20638,a
1732  0221 2008          	jra	L107
1733  0223               L776:
1734                     ; 485     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1736  0223 c6509e        	ld	a,20638
1737  0226 a4fc          	and	a,#252
1738  0228 c7509e        	ld	20638,a
1739  022b               L107:
1740                     ; 488   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1742  022b 7b01          	ld	a,(OFST+1,sp)
1743  022d a40f          	and	a,#15
1744  022f ca509e        	or	a,20638
1745  0232 c7509e        	ld	20638,a
1746                     ; 489 }
1749  0235 84            	pop	a
1750  0236 81            	ret
1763                     	xdef	_SYSCFG_REMAPDMAChannelConfig
1764                     	xdef	_SYSCFG_REMAPPinConfig
1765                     	xdef	_SYSCFG_REMAPDeInit
1766                     	xdef	_SYSCFG_RIResistorConfig
1767                     	xdef	_SYSCFG_RIIOSwitchConfig
1768                     	xdef	_SYSCFG_RIAnalogSwitchConfig
1769                     	xdef	_SYSCFG_RITIMInputCaptureConfig
1770                     	xdef	_SYSCFG_RIDeInit
1789                     	end
