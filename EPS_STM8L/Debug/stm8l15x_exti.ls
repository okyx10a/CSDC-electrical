   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  43                     ; 123 void EXTI_DeInit(void)
  43                     ; 124 {
  45                     	switch	.text
  46  0000               _EXTI_DeInit:
  50                     ; 125   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  52  0000 725f50a0      	clr	20640
  53                     ; 126   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  55  0004 725f50a1      	clr	20641
  56                     ; 127   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  58  0008 725f50a2      	clr	20642
  59                     ; 128   EXTI->CR4 = EXTI_CR4_RESET_VALUE;
  61  000c 725f50aa      	clr	20650
  62                     ; 129   EXTI->SR1 = 0xFF; /* Setting SR1 bits in order to clear flags */
  64  0010 35ff50a3      	mov	20643,#255
  65                     ; 130   EXTI->SR2 = 0xFF; /* Setting SR2 bits in order to clear flags */
  67  0014 35ff50a4      	mov	20644,#255
  68                     ; 131   EXTI->CONF1 = EXTI_CONF1_RESET_VALUE;
  70  0018 725f50a5      	clr	20645
  71                     ; 132   EXTI->CONF2 = EXTI_CONF2_RESET_VALUE;
  73  001c 725f50ab      	clr	20651
  74                     ; 133 }
  77  0020 81            	ret
 223                     ; 160 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin, EXTI_Trigger_TypeDef EXTI_Trigger)
 223                     ; 161 {
 224                     	switch	.text
 225  0021               _EXTI_SetPinSensitivity:
 227  0021 89            	pushw	x
 228       00000000      OFST:	set	0
 231                     ; 164   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
 233                     ; 165   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 235                     ; 168   switch (EXTI_Pin)
 237  0022 9e            	ld	a,xh
 239                     ; 202     default:
 239                     ; 203       break;
 240  0023 4d            	tnz	a
 241  0024 272f          	jreq	L12
 242  0026 a002          	sub	a,#2
 243  0028 274a          	jreq	L32
 244  002a a002          	sub	a,#2
 245  002c 2765          	jreq	L52
 246  002e a002          	sub	a,#2
 247  0030 2603cc00b2    	jreq	L72
 248  0035 a00a          	sub	a,#10
 249  0037 2603          	jrne	L05
 250  0039 cc00cf        	jp	L13
 251  003c               L05:
 252  003c a002          	sub	a,#2
 253  003e 2603          	jrne	L25
 254  0040 cc00ee        	jp	L33
 255  0043               L25:
 256  0043 a002          	sub	a,#2
 257  0045 2603          	jrne	L45
 258  0047 cc010d        	jp	L53
 259  004a               L45:
 260  004a a002          	sub	a,#2
 261  004c 2603          	jrne	L65
 262  004e cc012c        	jp	L73
 263  0051               L65:
 264  0051 ac490149      	jpf	L721
 265  0055               L12:
 266                     ; 170     case EXTI_Pin_0:
 266                     ; 171       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P0IS);
 268  0055 c650a0        	ld	a,20640
 269  0058 a4fc          	and	a,#252
 270  005a c750a0        	ld	20640,a
 271                     ; 172       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 273  005d 7b01          	ld	a,(OFST+1,sp)
 274  005f 5f            	clrw	x
 275  0060 97            	ld	xl,a
 276  0061 7b02          	ld	a,(OFST+2,sp)
 277  0063 5d            	tnzw	x
 278  0064 2704          	jreq	L01
 279  0066               L21:
 280  0066 48            	sll	a
 281  0067 5a            	decw	x
 282  0068 26fc          	jrne	L21
 283  006a               L01:
 284  006a ca50a0        	or	a,20640
 285  006d c750a0        	ld	20640,a
 286                     ; 173       break;
 288  0070 ac490149      	jpf	L721
 289  0074               L32:
 290                     ; 174     case EXTI_Pin_1:
 290                     ; 175       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P1IS);
 292  0074 c650a0        	ld	a,20640
 293  0077 a4f3          	and	a,#243
 294  0079 c750a0        	ld	20640,a
 295                     ; 176       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 297  007c 7b01          	ld	a,(OFST+1,sp)
 298  007e 5f            	clrw	x
 299  007f 97            	ld	xl,a
 300  0080 7b02          	ld	a,(OFST+2,sp)
 301  0082 5d            	tnzw	x
 302  0083 2704          	jreq	L41
 303  0085               L61:
 304  0085 48            	sll	a
 305  0086 5a            	decw	x
 306  0087 26fc          	jrne	L61
 307  0089               L41:
 308  0089 ca50a0        	or	a,20640
 309  008c c750a0        	ld	20640,a
 310                     ; 177       break;
 312  008f ac490149      	jpf	L721
 313  0093               L52:
 314                     ; 178     case EXTI_Pin_2:
 314                     ; 179       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P2IS);
 316  0093 c650a0        	ld	a,20640
 317  0096 a4cf          	and	a,#207
 318  0098 c750a0        	ld	20640,a
 319                     ; 180       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 321  009b 7b01          	ld	a,(OFST+1,sp)
 322  009d 5f            	clrw	x
 323  009e 97            	ld	xl,a
 324  009f 7b02          	ld	a,(OFST+2,sp)
 325  00a1 5d            	tnzw	x
 326  00a2 2704          	jreq	L02
 327  00a4               L22:
 328  00a4 48            	sll	a
 329  00a5 5a            	decw	x
 330  00a6 26fc          	jrne	L22
 331  00a8               L02:
 332  00a8 ca50a0        	or	a,20640
 333  00ab c750a0        	ld	20640,a
 334                     ; 181       break;
 336  00ae ac490149      	jpf	L721
 337  00b2               L72:
 338                     ; 182     case EXTI_Pin_3:
 338                     ; 183       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P3IS);
 340  00b2 c650a0        	ld	a,20640
 341  00b5 a43f          	and	a,#63
 342  00b7 c750a0        	ld	20640,a
 343                     ; 184       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 345  00ba 7b01          	ld	a,(OFST+1,sp)
 346  00bc 5f            	clrw	x
 347  00bd 97            	ld	xl,a
 348  00be 7b02          	ld	a,(OFST+2,sp)
 349  00c0 5d            	tnzw	x
 350  00c1 2704          	jreq	L42
 351  00c3               L62:
 352  00c3 48            	sll	a
 353  00c4 5a            	decw	x
 354  00c5 26fc          	jrne	L62
 355  00c7               L42:
 356  00c7 ca50a0        	or	a,20640
 357  00ca c750a0        	ld	20640,a
 358                     ; 185       break;
 360  00cd 207a          	jra	L721
 361  00cf               L13:
 362                     ; 186     case EXTI_Pin_4:
 362                     ; 187       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P4IS);
 364  00cf c650a1        	ld	a,20641
 365  00d2 a4fc          	and	a,#252
 366  00d4 c750a1        	ld	20641,a
 367                     ; 188       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 369  00d7 7b01          	ld	a,(OFST+1,sp)
 370  00d9 a4ef          	and	a,#239
 371  00db 5f            	clrw	x
 372  00dc 97            	ld	xl,a
 373  00dd 7b02          	ld	a,(OFST+2,sp)
 374  00df 5d            	tnzw	x
 375  00e0 2704          	jreq	L03
 376  00e2               L23:
 377  00e2 48            	sll	a
 378  00e3 5a            	decw	x
 379  00e4 26fc          	jrne	L23
 380  00e6               L03:
 381  00e6 ca50a1        	or	a,20641
 382  00e9 c750a1        	ld	20641,a
 383                     ; 189       break;
 385  00ec 205b          	jra	L721
 386  00ee               L33:
 387                     ; 190     case EXTI_Pin_5:
 387                     ; 191       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P5IS);
 389  00ee c650a1        	ld	a,20641
 390  00f1 a4f3          	and	a,#243
 391  00f3 c750a1        	ld	20641,a
 392                     ; 192       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 394  00f6 7b01          	ld	a,(OFST+1,sp)
 395  00f8 a4ef          	and	a,#239
 396  00fa 5f            	clrw	x
 397  00fb 97            	ld	xl,a
 398  00fc 7b02          	ld	a,(OFST+2,sp)
 399  00fe 5d            	tnzw	x
 400  00ff 2704          	jreq	L43
 401  0101               L63:
 402  0101 48            	sll	a
 403  0102 5a            	decw	x
 404  0103 26fc          	jrne	L63
 405  0105               L43:
 406  0105 ca50a1        	or	a,20641
 407  0108 c750a1        	ld	20641,a
 408                     ; 193       break;
 410  010b 203c          	jra	L721
 411  010d               L53:
 412                     ; 194     case EXTI_Pin_6:
 412                     ; 195       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P6IS);
 414  010d c650a1        	ld	a,20641
 415  0110 a4cf          	and	a,#207
 416  0112 c750a1        	ld	20641,a
 417                     ; 196       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 419  0115 7b01          	ld	a,(OFST+1,sp)
 420  0117 a4ef          	and	a,#239
 421  0119 5f            	clrw	x
 422  011a 97            	ld	xl,a
 423  011b 7b02          	ld	a,(OFST+2,sp)
 424  011d 5d            	tnzw	x
 425  011e 2704          	jreq	L04
 426  0120               L24:
 427  0120 48            	sll	a
 428  0121 5a            	decw	x
 429  0122 26fc          	jrne	L24
 430  0124               L04:
 431  0124 ca50a1        	or	a,20641
 432  0127 c750a1        	ld	20641,a
 433                     ; 197       break;
 435  012a 201d          	jra	L721
 436  012c               L73:
 437                     ; 198     case EXTI_Pin_7:
 437                     ; 199       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P7IS);
 439  012c c650a1        	ld	a,20641
 440  012f a43f          	and	a,#63
 441  0131 c750a1        	ld	20641,a
 442                     ; 200       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 444  0134 7b01          	ld	a,(OFST+1,sp)
 445  0136 a4ef          	and	a,#239
 446  0138 5f            	clrw	x
 447  0139 97            	ld	xl,a
 448  013a 7b02          	ld	a,(OFST+2,sp)
 449  013c 5d            	tnzw	x
 450  013d 2704          	jreq	L44
 451  013f               L64:
 452  013f 48            	sll	a
 453  0140 5a            	decw	x
 454  0141 26fc          	jrne	L64
 455  0143               L44:
 456  0143 ca50a1        	or	a,20641
 457  0146 c750a1        	ld	20641,a
 458                     ; 201       break;
 460  0149               L14:
 461                     ; 202     default:
 461                     ; 203       break;
 463  0149               L721:
 464                     ; 205 }
 467  0149 85            	popw	x
 468  014a 81            	ret
 551                     ; 219 void EXTI_SelectPort(EXTI_Port_TypeDef EXTI_Port)
 551                     ; 220 {
 552                     	switch	.text
 553  014b               _EXTI_SelectPort:
 555  014b 88            	push	a
 556       00000000      OFST:	set	0
 559                     ; 222   assert_param(IS_EXTI_PORT(EXTI_Port));
 561                     ; 224   if (EXTI_Port == EXTI_Port_B)
 563  014c 4d            	tnz	a
 564  014d 2606          	jrne	L761
 565                     ; 227     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PGBS);
 567  014f 721b50ab      	bres	20651,#5
 569  0153 2034          	jra	L171
 570  0155               L761:
 571                     ; 229   else if (EXTI_Port == EXTI_Port_D)
 573  0155 7b01          	ld	a,(OFST+1,sp)
 574  0157 a102          	cp	a,#2
 575  0159 2606          	jrne	L371
 576                     ; 232     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PHDS);
 578  015b 721d50ab      	bres	20651,#6
 580  015f 2028          	jra	L171
 581  0161               L371:
 582                     ; 234   else if (EXTI_Port == EXTI_Port_E)
 584  0161 7b01          	ld	a,(OFST+1,sp)
 585  0163 a104          	cp	a,#4
 586  0165 2606          	jrne	L771
 587                     ; 237     EXTI->CONF1 &= (uint8_t) (~EXTI_CONF1_PFES);
 589  0167 721f50a5      	bres	20645,#7
 591  016b 201c          	jra	L171
 592  016d               L771:
 593                     ; 239   else if (EXTI_Port == EXTI_Port_F)
 595  016d 7b01          	ld	a,(OFST+1,sp)
 596  016f a106          	cp	a,#6
 597  0171 2606          	jrne	L302
 598                     ; 242     EXTI->CONF1 |= (uint8_t) (EXTI_CONF1_PFES);
 600  0173 721e50a5      	bset	20645,#7
 602  0177 2010          	jra	L171
 603  0179               L302:
 604                     ; 244   else if (EXTI_Port == EXTI_Port_G)
 606  0179 7b01          	ld	a,(OFST+1,sp)
 607  017b a110          	cp	a,#16
 608  017d 2606          	jrne	L702
 609                     ; 247     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PGBS);
 611  017f 721a50ab      	bset	20651,#5
 613  0183 2004          	jra	L171
 614  0185               L702:
 615                     ; 252     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PHDS);
 617  0185 721c50ab      	bset	20651,#6
 618  0189               L171:
 619                     ; 254 }
 622  0189 84            	pop	a
 623  018a 81            	ret
 791                     ; 280 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 791                     ; 281                                FunctionalState NewState)
 791                     ; 282 {
 792                     	switch	.text
 793  018b               _EXTI_SetHalfPortSelection:
 795  018b 89            	pushw	x
 796       00000000      OFST:	set	0
 799                     ; 284   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 801                     ; 285   assert_param(IS_FUNCTIONAL_STATE(NewState));
 803                     ; 287   if ((EXTI_HalfPort & 0x80) == 0x00)
 805  018c 9e            	ld	a,xh
 806  018d a580          	bcp	a,#128
 807  018f 2619          	jrne	L103
 808                     ; 289     if (NewState != DISABLE)
 810  0191 0d02          	tnz	(OFST+2,sp)
 811  0193 270a          	jreq	L303
 812                     ; 292       EXTI->CONF1 |= (uint8_t)EXTI_HalfPort;
 814  0195 c650a5        	ld	a,20645
 815  0198 1a01          	or	a,(OFST+1,sp)
 816  019a c750a5        	ld	20645,a
 818  019d 2026          	jra	L703
 819  019f               L303:
 820                     ; 297       EXTI->CONF1 &= (uint8_t)(~(uint8_t)EXTI_HalfPort);
 822  019f 7b01          	ld	a,(OFST+1,sp)
 823  01a1 43            	cpl	a
 824  01a2 c450a5        	and	a,20645
 825  01a5 c750a5        	ld	20645,a
 826  01a8 201b          	jra	L703
 827  01aa               L103:
 828                     ; 302     if (NewState != DISABLE)
 830  01aa 0d02          	tnz	(OFST+2,sp)
 831  01ac 270c          	jreq	L113
 832                     ; 305       EXTI->CONF2 |= (uint8_t)(EXTI_HalfPort & (uint8_t)0x7F);
 834  01ae 7b01          	ld	a,(OFST+1,sp)
 835  01b0 a47f          	and	a,#127
 836  01b2 ca50ab        	or	a,20651
 837  01b5 c750ab        	ld	20651,a
 839  01b8 200b          	jra	L703
 840  01ba               L113:
 841                     ; 310       EXTI->CONF2 &= (uint8_t)(~(uint8_t) (EXTI_HalfPort & (uint8_t)0x7F));
 843  01ba 7b01          	ld	a,(OFST+1,sp)
 844  01bc a47f          	and	a,#127
 845  01be 43            	cpl	a
 846  01bf c450ab        	and	a,20651
 847  01c2 c750ab        	ld	20651,a
 848  01c5               L703:
 849                     ; 313 }
 852  01c5 85            	popw	x
 853  01c6 81            	ret
 899                     ; 338 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 899                     ; 339                              EXTI_Trigger_TypeDef EXTI_Trigger)
 899                     ; 340 {
 900                     	switch	.text
 901  01c7               _EXTI_SetPortSensitivity:
 903  01c7 89            	pushw	x
 904       00000000      OFST:	set	0
 907                     ; 342   assert_param(IS_EXTI_PORT(EXTI_Port));
 909                     ; 343   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 911                     ; 346   if ((EXTI_Port & 0xF0) == 0x00)
 913  01c8 9e            	ld	a,xh
 914  01c9 a5f0          	bcp	a,#240
 915  01cb 2629          	jrne	L733
 916                     ; 349     EXTI->CR3 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << EXTI_Port));
 918  01cd 7b01          	ld	a,(OFST+1,sp)
 919  01cf 5f            	clrw	x
 920  01d0 97            	ld	xl,a
 921  01d1 a603          	ld	a,#3
 922  01d3 5d            	tnzw	x
 923  01d4 2704          	jreq	L66
 924  01d6               L07:
 925  01d6 48            	sll	a
 926  01d7 5a            	decw	x
 927  01d8 26fc          	jrne	L07
 928  01da               L66:
 929  01da 43            	cpl	a
 930  01db c450a2        	and	a,20642
 931  01de c750a2        	ld	20642,a
 932                     ; 351     EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Port);
 934  01e1 7b01          	ld	a,(OFST+1,sp)
 935  01e3 5f            	clrw	x
 936  01e4 97            	ld	xl,a
 937  01e5 7b02          	ld	a,(OFST+2,sp)
 938  01e7 5d            	tnzw	x
 939  01e8 2704          	jreq	L27
 940  01ea               L47:
 941  01ea 48            	sll	a
 942  01eb 5a            	decw	x
 943  01ec 26fc          	jrne	L47
 944  01ee               L27:
 945  01ee ca50a2        	or	a,20642
 946  01f1 c750a2        	ld	20642,a
 948  01f4 202b          	jra	L143
 949  01f6               L733:
 950                     ; 356     EXTI->CR4 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << (EXTI_Port & 0x0F)));
 952  01f6 7b01          	ld	a,(OFST+1,sp)
 953  01f8 a40f          	and	a,#15
 954  01fa 5f            	clrw	x
 955  01fb 97            	ld	xl,a
 956  01fc a603          	ld	a,#3
 957  01fe 5d            	tnzw	x
 958  01ff 2704          	jreq	L67
 959  0201               L001:
 960  0201 48            	sll	a
 961  0202 5a            	decw	x
 962  0203 26fc          	jrne	L001
 963  0205               L67:
 964  0205 43            	cpl	a
 965  0206 c450aa        	and	a,20650
 966  0209 c750aa        	ld	20650,a
 967                     ; 358     EXTI->CR4 |= (uint8_t)(EXTI_Trigger << (EXTI_Port & 0x0F));
 969  020c 7b01          	ld	a,(OFST+1,sp)
 970  020e a40f          	and	a,#15
 971  0210 5f            	clrw	x
 972  0211 97            	ld	xl,a
 973  0212 7b02          	ld	a,(OFST+2,sp)
 974  0214 5d            	tnzw	x
 975  0215 2704          	jreq	L201
 976  0217               L401:
 977  0217 48            	sll	a
 978  0218 5a            	decw	x
 979  0219 26fc          	jrne	L401
 980  021b               L201:
 981  021b ca50aa        	or	a,20650
 982  021e c750aa        	ld	20650,a
 983  0221               L143:
 984                     ; 360 }
 987  0221 85            	popw	x
 988  0222 81            	ret
1034                     ; 376 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin)
1034                     ; 377 {
1035                     	switch	.text
1036  0223               _EXTI_GetPinSensitivity:
1038  0223 88            	push	a
1039       00000001      OFST:	set	1
1042                     ; 378   uint8_t value = 0;
1044  0224 0f01          	clr	(OFST+0,sp)
1045                     ; 381   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
1047                     ; 383   switch (EXTI_Pin)
1050                     ; 409     default:
1050                     ; 410       break;
1051  0226 4d            	tnz	a
1052  0227 271e          	jreq	L343
1053  0229 a002          	sub	a,#2
1054  022b 2723          	jreq	L543
1055  022d a002          	sub	a,#2
1056  022f 272a          	jreq	L743
1057  0231 a002          	sub	a,#2
1058  0233 2732          	jreq	L153
1059  0235 a00a          	sub	a,#10
1060  0237 273c          	jreq	L353
1061  0239 a002          	sub	a,#2
1062  023b 2741          	jreq	L553
1063  023d a002          	sub	a,#2
1064  023f 2748          	jreq	L753
1065  0241 a002          	sub	a,#2
1066  0243 2750          	jreq	L163
1067  0245 205a          	jra	L114
1068  0247               L343:
1069                     ; 385     case EXTI_Pin_0:
1069                     ; 386       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
1071  0247 c650a0        	ld	a,20640
1072  024a a403          	and	a,#3
1073  024c 6b01          	ld	(OFST+0,sp),a
1074                     ; 387       break;
1076  024e 2051          	jra	L114
1077  0250               L543:
1078                     ; 388     case EXTI_Pin_1:
1078                     ; 389       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P1IS) >> EXTI_Pin_1);
1080  0250 c650a0        	ld	a,20640
1081  0253 a40c          	and	a,#12
1082  0255 44            	srl	a
1083  0256 44            	srl	a
1084  0257 6b01          	ld	(OFST+0,sp),a
1085                     ; 390       break;
1087  0259 2046          	jra	L114
1088  025b               L743:
1089                     ; 391     case EXTI_Pin_2:
1089                     ; 392       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P2IS) >> EXTI_Pin_2);
1091  025b c650a0        	ld	a,20640
1092  025e a430          	and	a,#48
1093  0260 4e            	swap	a
1094  0261 a40f          	and	a,#15
1095  0263 6b01          	ld	(OFST+0,sp),a
1096                     ; 393       break;
1098  0265 203a          	jra	L114
1099  0267               L153:
1100                     ; 394     case EXTI_Pin_3:
1100                     ; 395       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P3IS) >> EXTI_Pin_3);
1102  0267 c650a0        	ld	a,20640
1103  026a a4c0          	and	a,#192
1104  026c 4e            	swap	a
1105  026d 44            	srl	a
1106  026e 44            	srl	a
1107  026f a403          	and	a,#3
1108  0271 6b01          	ld	(OFST+0,sp),a
1109                     ; 396       break;
1111  0273 202c          	jra	L114
1112  0275               L353:
1113                     ; 397     case EXTI_Pin_4:
1113                     ; 398       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
1115  0275 c650a1        	ld	a,20641
1116  0278 a403          	and	a,#3
1117  027a 6b01          	ld	(OFST+0,sp),a
1118                     ; 399       break;
1120  027c 2023          	jra	L114
1121  027e               L553:
1122                     ; 400     case EXTI_Pin_5:
1122                     ; 401       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
1124  027e c650a1        	ld	a,20641
1125  0281 a40c          	and	a,#12
1126  0283 44            	srl	a
1127  0284 44            	srl	a
1128  0285 6b01          	ld	(OFST+0,sp),a
1129                     ; 402       break;
1131  0287 2018          	jra	L114
1132  0289               L753:
1133                     ; 403     case EXTI_Pin_6:
1133                     ; 404       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
1135  0289 c650a1        	ld	a,20641
1136  028c a430          	and	a,#48
1137  028e 4e            	swap	a
1138  028f a40f          	and	a,#15
1139  0291 6b01          	ld	(OFST+0,sp),a
1140                     ; 405       break;
1142  0293 200c          	jra	L114
1143  0295               L163:
1144                     ; 406     case EXTI_Pin_7:
1144                     ; 407       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
1146  0295 c650a1        	ld	a,20641
1147  0298 a4c0          	and	a,#192
1148  029a 4e            	swap	a
1149  029b 44            	srl	a
1150  029c 44            	srl	a
1151  029d a403          	and	a,#3
1152  029f 6b01          	ld	(OFST+0,sp),a
1153                     ; 408       break;
1155  02a1               L363:
1156                     ; 409     default:
1156                     ; 410       break;
1158  02a1               L114:
1159                     ; 412   return((EXTI_Trigger_TypeDef)value);
1161  02a1 7b01          	ld	a,(OFST+0,sp)
1164  02a3 5b01          	addw	sp,#1
1165  02a5 81            	ret
1211                     ; 427 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
1211                     ; 428 {
1212                     	switch	.text
1213  02a6               _EXTI_GetPortSensitivity:
1215  02a6 88            	push	a
1216  02a7 88            	push	a
1217       00000001      OFST:	set	1
1220                     ; 429   uint8_t portsensitivity = 0;
1222                     ; 432   assert_param(IS_EXTI_PORT(EXTI_Port));
1224                     ; 435   if ((EXTI_Port & 0xF0) == 0x00)
1226  02a8 a5f0          	bcp	a,#240
1227  02aa 2614          	jrne	L534
1228                     ; 438     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR3 >> EXTI_Port));
1230  02ac 7b02          	ld	a,(OFST+1,sp)
1231  02ae 5f            	clrw	x
1232  02af 97            	ld	xl,a
1233  02b0 c650a2        	ld	a,20642
1234  02b3 5d            	tnzw	x
1235  02b4 2704          	jreq	L211
1236  02b6               L411:
1237  02b6 44            	srl	a
1238  02b7 5a            	decw	x
1239  02b8 26fc          	jrne	L411
1240  02ba               L211:
1241  02ba a403          	and	a,#3
1242  02bc 6b01          	ld	(OFST+0,sp),a
1244  02be 2014          	jra	L734
1245  02c0               L534:
1246                     ; 444     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR4 >> (EXTI_Port & 0x0F)));
1248  02c0 7b02          	ld	a,(OFST+1,sp)
1249  02c2 a40f          	and	a,#15
1250  02c4 5f            	clrw	x
1251  02c5 97            	ld	xl,a
1252  02c6 c650aa        	ld	a,20650
1253  02c9 5d            	tnzw	x
1254  02ca 2704          	jreq	L611
1255  02cc               L021:
1256  02cc 44            	srl	a
1257  02cd 5a            	decw	x
1258  02ce 26fc          	jrne	L021
1259  02d0               L611:
1260  02d0 a403          	and	a,#3
1261  02d2 6b01          	ld	(OFST+0,sp),a
1262  02d4               L734:
1263                     ; 447   return((EXTI_Trigger_TypeDef)portsensitivity);
1265  02d4 7b01          	ld	a,(OFST+0,sp)
1268  02d6 85            	popw	x
1269  02d7 81            	ret
1439                     ; 487 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1439                     ; 488 {
1440                     	switch	.text
1441  02d8               _EXTI_GetITStatus:
1443  02d8 89            	pushw	x
1444  02d9 88            	push	a
1445       00000001      OFST:	set	1
1448                     ; 489   ITStatus status = RESET;
1450                     ; 491   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1452                     ; 493   if (((uint16_t)EXTI_IT & (uint16_t)0xFF00) == 0x0100)
1454  02da 01            	rrwa	x,a
1455  02db 9f            	ld	a,xl
1456  02dc a4ff          	and	a,#255
1457  02de 97            	ld	xl,a
1458  02df 4f            	clr	a
1459  02e0 02            	rlwa	x,a
1460  02e1 a30100        	cpw	x,#256
1461  02e4 260b          	jrne	L335
1462                     ; 495     status = (ITStatus)(EXTI->SR2 & (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF));
1464  02e6 7b03          	ld	a,(OFST+2,sp)
1465  02e8 a4ff          	and	a,#255
1466  02ea c450a4        	and	a,20644
1467  02ed 6b01          	ld	(OFST+0,sp),a
1469  02ef 2009          	jra	L535
1470  02f1               L335:
1471                     ; 499     status = (ITStatus)(EXTI->SR1 & ((uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF)));
1473  02f1 7b03          	ld	a,(OFST+2,sp)
1474  02f3 a4ff          	and	a,#255
1475  02f5 c450a3        	and	a,20643
1476  02f8 6b01          	ld	(OFST+0,sp),a
1477  02fa               L535:
1478                     ; 501   return((ITStatus)status);
1480  02fa 7b01          	ld	a,(OFST+0,sp)
1483  02fc 5b03          	addw	sp,#3
1484  02fe 81            	ret
1529                     ; 524 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1529                     ; 525 {
1530                     	switch	.text
1531  02ff               _EXTI_ClearITPendingBit:
1533  02ff 89            	pushw	x
1534  0300 89            	pushw	x
1535       00000002      OFST:	set	2
1538                     ; 526   uint16_t tempvalue = 0;
1540                     ; 529   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1542                     ; 531   tempvalue = ((uint16_t)EXTI_IT & (uint16_t)0xFF00);
1544  0301 01            	rrwa	x,a
1545  0302 9f            	ld	a,xl
1546  0303 a4ff          	and	a,#255
1547  0305 97            	ld	xl,a
1548  0306 4f            	clr	a
1549  0307 02            	rlwa	x,a
1550  0308 1f01          	ldw	(OFST-1,sp),x
1551  030a 01            	rrwa	x,a
1552                     ; 533   if ( tempvalue == 0x0100)
1554  030b 1e01          	ldw	x,(OFST-1,sp)
1555  030d a30100        	cpw	x,#256
1556  0310 2609          	jrne	L165
1557                     ; 535     EXTI->SR2 = (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF);
1559  0312 7b04          	ld	a,(OFST+2,sp)
1560  0314 a4ff          	and	a,#255
1561  0316 c750a4        	ld	20644,a
1563  0319 2005          	jra	L365
1564  031b               L165:
1565                     ; 539     EXTI->SR1 = (uint8_t) (EXTI_IT);
1567  031b 7b04          	ld	a,(OFST+2,sp)
1568  031d c750a3        	ld	20643,a
1569  0320               L365:
1570                     ; 541 }
1573  0320 5b04          	addw	sp,#4
1574  0322 81            	ret
1587                     	xdef	_EXTI_ClearITPendingBit
1588                     	xdef	_EXTI_GetITStatus
1589                     	xdef	_EXTI_GetPortSensitivity
1590                     	xdef	_EXTI_GetPinSensitivity
1591                     	xdef	_EXTI_SetPortSensitivity
1592                     	xdef	_EXTI_SetHalfPortSelection
1593                     	xdef	_EXTI_SelectPort
1594                     	xdef	_EXTI_SetPinSensitivity
1595                     	xdef	_EXTI_DeInit
1614                     	end
