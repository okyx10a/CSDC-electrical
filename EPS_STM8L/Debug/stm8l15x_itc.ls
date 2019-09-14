   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  43                     ; 56 uint8_t ITC_GetCPUCC(void)
  43                     ; 57 {
  45                     	switch	.text
  46  0000               _ITC_GetCPUCC:
  50                     ; 59   _asm("push cc");
  53  0000 8a            push cc
  55                     ; 60   _asm("pop a");
  58  0001 84            pop a
  60                     ; 61   return; /* Ignore compiler warning, the returned value is in A register */
  63  0002 81            	ret
  86                     ; 87 void ITC_DeInit(void)
  86                     ; 88 {
  87                     	switch	.text
  88  0003               _ITC_DeInit:
  92                     ; 89   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  94  0003 35ff7f70      	mov	32624,#255
  95                     ; 90   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  97  0007 35ff7f71      	mov	32625,#255
  98                     ; 91   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 100  000b 35ff7f72      	mov	32626,#255
 101                     ; 92   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 103  000f 35ff7f73      	mov	32627,#255
 104                     ; 93   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 106  0013 35ff7f74      	mov	32628,#255
 107                     ; 94   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 109  0017 35ff7f75      	mov	32629,#255
 110                     ; 95   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 112  001b 35ff7f76      	mov	32630,#255
 113                     ; 96   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 115  001f 35ff7f77      	mov	32631,#255
 116                     ; 97 }
 119  0023 81            	ret
 144                     ; 104 uint8_t ITC_GetSoftIntStatus(void)
 144                     ; 105 {
 145                     	switch	.text
 146  0024               _ITC_GetSoftIntStatus:
 150                     ; 106   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 152  0024 adda          	call	_ITC_GetCPUCC
 154  0026 a428          	and	a,#40
 157  0028 81            	ret
 466                     .const:	section	.text
 467  0000               L22:
 468  0000 004d          	dc.w	L14
 469  0002 004d          	dc.w	L14
 470  0004 004d          	dc.w	L14
 471  0006 0056          	dc.w	L34
 472  0008 0056          	dc.w	L34
 473  000a 0056          	dc.w	L34
 474  000c 0056          	dc.w	L34
 475  000e 005f          	dc.w	L54
 476  0010 005f          	dc.w	L54
 477  0012 005f          	dc.w	L54
 478  0014 005f          	dc.w	L54
 479  0016 0068          	dc.w	L74
 480  0018 0068          	dc.w	L74
 481  001a 0068          	dc.w	L74
 482  001c 0068          	dc.w	L74
 483  001e 0071          	dc.w	L15
 484  0020 0071          	dc.w	L15
 485  0022 0071          	dc.w	L15
 486  0024 0071          	dc.w	L15
 487  0026 007a          	dc.w	L35
 488  0028 007a          	dc.w	L35
 489  002a 007a          	dc.w	L35
 490  002c 007a          	dc.w	L35
 491  002e 0083          	dc.w	L55
 492  0030 0083          	dc.w	L55
 493  0032 0083          	dc.w	L55
 494  0034 0083          	dc.w	L55
 495  0036 008c          	dc.w	L75
 496  0038 008c          	dc.w	L75
 497                     ; 114 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 497                     ; 115 {
 498                     	switch	.text
 499  0029               _ITC_GetSoftwarePriority:
 501  0029 88            	push	a
 502  002a 89            	pushw	x
 503       00000002      OFST:	set	2
 506                     ; 116   uint8_t Value = 0;
 508  002b 0f02          	clr	(OFST+0,sp)
 509                     ; 117   uint8_t Mask = 0;
 511                     ; 120   assert_param(IS_ITC_IRQ(IRQn));
 513                     ; 123   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 515  002d a403          	and	a,#3
 516  002f 48            	sll	a
 517  0030 5f            	clrw	x
 518  0031 97            	ld	xl,a
 519  0032 a603          	ld	a,#3
 520  0034 5d            	tnzw	x
 521  0035 2704          	jreq	L41
 522  0037               L61:
 523  0037 48            	sll	a
 524  0038 5a            	decw	x
 525  0039 26fc          	jrne	L61
 526  003b               L41:
 527  003b 6b01          	ld	(OFST-1,sp),a
 528                     ; 125   switch (IRQn)
 530  003d 7b03          	ld	a,(OFST+1,sp)
 532                     ; 223     default:
 532                     ; 224       break;
 533  003f 4a            	dec	a
 534  0040 a11d          	cp	a,#29
 535  0042 2407          	jruge	L02
 536  0044 5f            	clrw	x
 537  0045 97            	ld	xl,a
 538  0046 58            	sllw	x
 539  0047 de0000        	ldw	x,(L22,x)
 540  004a fc            	jp	(x)
 541  004b               L02:
 542  004b 2046          	jra	L522
 543  004d               L14:
 544                     ; 127     case FLASH_IRQn:
 544                     ; 128     case DMA1_CHANNEL0_1_IRQn:
 544                     ; 129     case DMA1_CHANNEL2_3_IRQn:
 544                     ; 130       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 546  004d c67f70        	ld	a,32624
 547  0050 1401          	and	a,(OFST-1,sp)
 548  0052 6b02          	ld	(OFST+0,sp),a
 549                     ; 131       break;
 551  0054 203d          	jra	L522
 552  0056               L34:
 553                     ; 133     case EXTIE_F_PVD_IRQn:
 553                     ; 134 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 553                     ; 135     case RTC_IRQn:
 553                     ; 136     case EXTIB_IRQn:
 553                     ; 137     case EXTID_IRQn:
 553                     ; 138 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 553                     ; 139     case RTC_CSSLSE_IRQn:
 553                     ; 140     case EXTIB_IRQn:
 553                     ; 141     case EXTID_IRQn:
 553                     ; 142 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 553                     ; 143     case RTC_CSSLSE_IRQn:
 553                     ; 144     case EXTIB_G_IRQn:
 553                     ; 145     case EXTID_H_IRQn:
 553                     ; 146 #endif  /* STM8L15X_MD */
 553                     ; 147       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 555  0056 c67f71        	ld	a,32625
 556  0059 1401          	and	a,(OFST-1,sp)
 557  005b 6b02          	ld	(OFST+0,sp),a
 558                     ; 148       break;
 560  005d 2034          	jra	L522
 561  005f               L54:
 562                     ; 150     case EXTI0_IRQn:
 562                     ; 151     case EXTI1_IRQn:
 562                     ; 152     case EXTI2_IRQn:
 562                     ; 153     case EXTI3_IRQn:
 562                     ; 154       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 564  005f c67f72        	ld	a,32626
 565  0062 1401          	and	a,(OFST-1,sp)
 566  0064 6b02          	ld	(OFST+0,sp),a
 567                     ; 155       break;
 569  0066 202b          	jra	L522
 570  0068               L74:
 571                     ; 157     case EXTI4_IRQn:
 571                     ; 158     case EXTI5_IRQn:
 571                     ; 159     case EXTI6_IRQn:
 571                     ; 160     case EXTI7_IRQn:
 571                     ; 161       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 573  0068 c67f73        	ld	a,32627
 574  006b 1401          	and	a,(OFST-1,sp)
 575  006d 6b02          	ld	(OFST+0,sp),a
 576                     ; 162       break;
 578  006f 2022          	jra	L522
 579  0071               L15:
 580                     ; 167     case SWITCH_CSS_BREAK_DAC_IRQn:
 580                     ; 168 #endif /* STM8L15X_LD */		
 580                     ; 169     case ADC1_COMP_IRQn:
 580                     ; 170 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 580                     ; 171     case LCD_IRQn:
 580                     ; 172     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 580                     ; 173 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 580                     ; 174     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 580                     ; 175 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 580                     ; 176     case LCD_AES_IRQn:
 580                     ; 177     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 580                     ; 178 #endif  /* STM8L15X_MD */
 580                     ; 179       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 582  0071 c67f74        	ld	a,32628
 583  0074 1401          	and	a,(OFST-1,sp)
 584  0076 6b02          	ld	(OFST+0,sp),a
 585                     ; 180       break;
 587  0078 2019          	jra	L522
 588  007a               L35:
 589                     ; 183     case TIM1_UPD_OVF_TRG_IRQn:
 589                     ; 184 #endif /* STM8L15X_LD */		
 589                     ; 185 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 589                     ; 186  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 589                     ; 187     case TIM2_CC_IRQn:
 589                     ; 188     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 589                     ; 189     case TIM3_CC_IRQn:
 589                     ; 190 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 589                     ; 191     case TIM2_CC_USART2_RX_IRQn:
 589                     ; 192     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 589                     ; 193     case TIM3_CC_USART3_RX_IRQn:
 589                     ; 194 #endif  /* STM8L15X_MD */
 589                     ; 195       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 591  007a c67f75        	ld	a,32629
 592  007d 1401          	and	a,(OFST-1,sp)
 593  007f 6b02          	ld	(OFST+0,sp),a
 594                     ; 196       break;
 596  0081 2010          	jra	L522
 597  0083               L55:
 598                     ; 199     case TIM1_CC_IRQn:
 598                     ; 200 #endif /* STM8L15X_LD */	
 598                     ; 201     case TIM4_UPD_OVF_TRG_IRQn:
 598                     ; 202     case SPI1_IRQn:
 598                     ; 203 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 598                     ; 204  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 598                     ; 205     case USART1_TX_IRQn:
 598                     ; 206 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 598                     ; 207     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 598                     ; 208 #endif  /* STM8L15X_MD || STM8L15X_LD */
 598                     ; 209       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 600  0083 c67f76        	ld	a,32630
 601  0086 1401          	and	a,(OFST-1,sp)
 602  0088 6b02          	ld	(OFST+0,sp),a
 603                     ; 210       break;
 605  008a 2007          	jra	L522
 606  008c               L75:
 607                     ; 214     case USART1_RX_IRQn:
 607                     ; 215     case I2C1_IRQn:
 607                     ; 216 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 607                     ; 217     case USART1_RX_TIM5_CC_IRQn:
 607                     ; 218     case I2C1_SPI2_IRQn:
 607                     ; 219 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 607                     ; 220       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 609  008c c67f77        	ld	a,32631
 610  008f 1401          	and	a,(OFST-1,sp)
 611  0091 6b02          	ld	(OFST+0,sp),a
 612                     ; 221       break;
 614  0093               L16:
 615                     ; 223     default:
 615                     ; 224       break;
 617  0093               L522:
 618                     ; 227   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 620  0093 7b03          	ld	a,(OFST+1,sp)
 621  0095 a403          	and	a,#3
 622  0097 48            	sll	a
 623  0098 5f            	clrw	x
 624  0099 97            	ld	xl,a
 625  009a 7b02          	ld	a,(OFST+0,sp)
 626  009c 5d            	tnzw	x
 627  009d 2704          	jreq	L42
 628  009f               L62:
 629  009f 44            	srl	a
 630  00a0 5a            	decw	x
 631  00a1 26fc          	jrne	L62
 632  00a3               L42:
 633  00a3 6b02          	ld	(OFST+0,sp),a
 634                     ; 229   return((ITC_PriorityLevel_TypeDef)Value);
 636  00a5 7b02          	ld	a,(OFST+0,sp)
 639  00a7 5b03          	addw	sp,#3
 640  00a9 81            	ret
 704                     	switch	.const
 705  003a               L44:
 706  003a 00e2          	dc.w	L722
 707  003c 00e2          	dc.w	L722
 708  003e 00e2          	dc.w	L722
 709  0040 00f4          	dc.w	L132
 710  0042 00f4          	dc.w	L132
 711  0044 00f4          	dc.w	L132
 712  0046 00f4          	dc.w	L132
 713  0048 0106          	dc.w	L332
 714  004a 0106          	dc.w	L332
 715  004c 0106          	dc.w	L332
 716  004e 0106          	dc.w	L332
 717  0050 0118          	dc.w	L532
 718  0052 0118          	dc.w	L532
 719  0054 0118          	dc.w	L532
 720  0056 0118          	dc.w	L532
 721  0058 012a          	dc.w	L732
 722  005a 012a          	dc.w	L732
 723  005c 012a          	dc.w	L732
 724  005e 012a          	dc.w	L732
 725  0060 013c          	dc.w	L142
 726  0062 013c          	dc.w	L142
 727  0064 013c          	dc.w	L142
 728  0066 013c          	dc.w	L142
 729  0068 014e          	dc.w	L342
 730  006a 014e          	dc.w	L342
 731  006c 014e          	dc.w	L342
 732  006e 014e          	dc.w	L342
 733  0070 0160          	dc.w	L542
 734  0072 0160          	dc.w	L542
 735                     ; 250 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 735                     ; 251 {
 736                     	switch	.text
 737  00aa               _ITC_SetSoftwarePriority:
 739  00aa 89            	pushw	x
 740  00ab 89            	pushw	x
 741       00000002      OFST:	set	2
 744                     ; 252   uint8_t Mask = 0;
 746                     ; 253   uint8_t NewPriority = 0;
 748                     ; 256   assert_param(IS_ITC_IRQ(IRQn));
 750                     ; 257   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 752                     ; 260   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 754                     ; 264   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 756  00ac 9e            	ld	a,xh
 757  00ad a403          	and	a,#3
 758  00af 48            	sll	a
 759  00b0 5f            	clrw	x
 760  00b1 97            	ld	xl,a
 761  00b2 a603          	ld	a,#3
 762  00b4 5d            	tnzw	x
 763  00b5 2704          	jreq	L23
 764  00b7               L43:
 765  00b7 48            	sll	a
 766  00b8 5a            	decw	x
 767  00b9 26fc          	jrne	L43
 768  00bb               L23:
 769  00bb 43            	cpl	a
 770  00bc 6b01          	ld	(OFST-1,sp),a
 771                     ; 266   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 773  00be 7b03          	ld	a,(OFST+1,sp)
 774  00c0 a403          	and	a,#3
 775  00c2 48            	sll	a
 776  00c3 5f            	clrw	x
 777  00c4 97            	ld	xl,a
 778  00c5 7b04          	ld	a,(OFST+2,sp)
 779  00c7 5d            	tnzw	x
 780  00c8 2704          	jreq	L63
 781  00ca               L04:
 782  00ca 48            	sll	a
 783  00cb 5a            	decw	x
 784  00cc 26fc          	jrne	L04
 785  00ce               L63:
 786  00ce 6b02          	ld	(OFST+0,sp),a
 787                     ; 268   switch (IRQn)
 789  00d0 7b03          	ld	a,(OFST+1,sp)
 791                     ; 372     default:
 791                     ; 373       break;
 792  00d2 4a            	dec	a
 793  00d3 a11d          	cp	a,#29
 794  00d5 2407          	jruge	L24
 795  00d7 5f            	clrw	x
 796  00d8 97            	ld	xl,a
 797  00d9 58            	sllw	x
 798  00da de003a        	ldw	x,(L44,x)
 799  00dd fc            	jp	(x)
 800  00de               L24:
 801  00de ac700170      	jpf	L503
 802  00e2               L722:
 803                     ; 270     case FLASH_IRQn:
 803                     ; 271     case DMA1_CHANNEL0_1_IRQn:
 803                     ; 272     case DMA1_CHANNEL2_3_IRQn:
 803                     ; 273       ITC->ISPR1 &= Mask;
 805  00e2 c67f70        	ld	a,32624
 806  00e5 1401          	and	a,(OFST-1,sp)
 807  00e7 c77f70        	ld	32624,a
 808                     ; 274       ITC->ISPR1 |= NewPriority;
 810  00ea c67f70        	ld	a,32624
 811  00ed 1a02          	or	a,(OFST+0,sp)
 812  00ef c77f70        	ld	32624,a
 813                     ; 275       break;
 815  00f2 207c          	jra	L503
 816  00f4               L132:
 817                     ; 277     case EXTIE_F_PVD_IRQn:
 817                     ; 278 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 817                     ; 279     case RTC_IRQn:
 817                     ; 280     case EXTIB_IRQn:
 817                     ; 281     case EXTID_IRQn:
 817                     ; 282 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 817                     ; 283     case RTC_CSSLSE_IRQn:
 817                     ; 284     case EXTIB_IRQn:
 817                     ; 285     case EXTID_IRQn:
 817                     ; 286 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 817                     ; 287     case RTC_CSSLSE_IRQn:
 817                     ; 288     case EXTIB_G_IRQn:
 817                     ; 289     case EXTID_H_IRQn:
 817                     ; 290 #endif  /* STM8L15X_MD */
 817                     ; 291       ITC->ISPR2 &= Mask;
 819  00f4 c67f71        	ld	a,32625
 820  00f7 1401          	and	a,(OFST-1,sp)
 821  00f9 c77f71        	ld	32625,a
 822                     ; 292       ITC->ISPR2 |= NewPriority;
 824  00fc c67f71        	ld	a,32625
 825  00ff 1a02          	or	a,(OFST+0,sp)
 826  0101 c77f71        	ld	32625,a
 827                     ; 293       break;
 829  0104 206a          	jra	L503
 830  0106               L332:
 831                     ; 295     case EXTI0_IRQn:
 831                     ; 296     case EXTI1_IRQn:
 831                     ; 297     case EXTI2_IRQn:
 831                     ; 298     case EXTI3_IRQn:
 831                     ; 299       ITC->ISPR3 &= Mask;
 833  0106 c67f72        	ld	a,32626
 834  0109 1401          	and	a,(OFST-1,sp)
 835  010b c77f72        	ld	32626,a
 836                     ; 300       ITC->ISPR3 |= NewPriority;
 838  010e c67f72        	ld	a,32626
 839  0111 1a02          	or	a,(OFST+0,sp)
 840  0113 c77f72        	ld	32626,a
 841                     ; 301       break;
 843  0116 2058          	jra	L503
 844  0118               L532:
 845                     ; 303     case EXTI4_IRQn:
 845                     ; 304     case EXTI5_IRQn:
 845                     ; 305     case EXTI6_IRQn:
 845                     ; 306     case EXTI7_IRQn:
 845                     ; 307       ITC->ISPR4 &= Mask;
 847  0118 c67f73        	ld	a,32627
 848  011b 1401          	and	a,(OFST-1,sp)
 849  011d c77f73        	ld	32627,a
 850                     ; 308       ITC->ISPR4 |= NewPriority;
 852  0120 c67f73        	ld	a,32627
 853  0123 1a02          	or	a,(OFST+0,sp)
 854  0125 c77f73        	ld	32627,a
 855                     ; 309       break;
 857  0128 2046          	jra	L503
 858  012a               L732:
 859                     ; 311     case SWITCH_CSS_BREAK_DAC_IRQn:
 859                     ; 312 #else
 859                     ; 313     case SWITCH_CSS_IRQn:
 859                     ; 314 #endif /*	STM8L15X_LD	*/
 859                     ; 315     case ADC1_COMP_IRQn:
 859                     ; 316 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 859                     ; 317     case LCD_IRQn:
 859                     ; 318     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 859                     ; 319 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 859                     ; 320     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 859                     ; 321 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 859                     ; 322     case LCD_AES_IRQn:
 859                     ; 323     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 859                     ; 324 #endif  /* STM8L15X_MD */
 859                     ; 325       ITC->ISPR5 &= Mask;
 861  012a c67f74        	ld	a,32628
 862  012d 1401          	and	a,(OFST-1,sp)
 863  012f c77f74        	ld	32628,a
 864                     ; 326       ITC->ISPR5 |= NewPriority;
 866  0132 c67f74        	ld	a,32628
 867  0135 1a02          	or	a,(OFST+0,sp)
 868  0137 c77f74        	ld	32628,a
 869                     ; 327       break;
 871  013a 2034          	jra	L503
 872  013c               L142:
 873                     ; 329     case TIM1_UPD_OVF_TRG_IRQn:
 873                     ; 330 #endif  /* STM8L15X_LD */
 873                     ; 331 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 873                     ; 332  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 873                     ; 333     case TIM2_CC_IRQn:
 873                     ; 334     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 873                     ; 335     case TIM3_CC_IRQn:
 873                     ; 336 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 873                     ; 337     case TIM2_CC_USART2_RX_IRQn:
 873                     ; 338     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 873                     ; 339     case TIM3_CC_USART3_RX_IRQn:
 873                     ; 340 #endif  /* STM8L15X_MD */
 873                     ; 341       ITC->ISPR6 &= Mask;
 875  013c c67f75        	ld	a,32629
 876  013f 1401          	and	a,(OFST-1,sp)
 877  0141 c77f75        	ld	32629,a
 878                     ; 342       ITC->ISPR6 |= NewPriority;
 880  0144 c67f75        	ld	a,32629
 881  0147 1a02          	or	a,(OFST+0,sp)
 882  0149 c77f75        	ld	32629,a
 883                     ; 343       break;
 885  014c 2022          	jra	L503
 886  014e               L342:
 887                     ; 346     case TIM1_CC_IRQn:
 887                     ; 347 #endif  /* STM8L15X_LD */
 887                     ; 348     case TIM4_UPD_OVF_TRG_IRQn:
 887                     ; 349     case SPI1_IRQn:
 887                     ; 350 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 887                     ; 351  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 887                     ; 352     case USART1_TX_IRQn:
 887                     ; 353 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 887                     ; 354     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 887                     ; 355 #endif  /* STM8L15X_MD */
 887                     ; 356       ITC->ISPR7 &= Mask;
 889  014e c67f76        	ld	a,32630
 890  0151 1401          	and	a,(OFST-1,sp)
 891  0153 c77f76        	ld	32630,a
 892                     ; 357       ITC->ISPR7 |= NewPriority;
 894  0156 c67f76        	ld	a,32630
 895  0159 1a02          	or	a,(OFST+0,sp)
 896  015b c77f76        	ld	32630,a
 897                     ; 358       break;
 899  015e 2010          	jra	L503
 900  0160               L542:
 901                     ; 362     case USART1_RX_IRQn:
 901                     ; 363     case I2C1_IRQn:
 901                     ; 364 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 901                     ; 365     case USART1_RX_TIM5_CC_IRQn:
 901                     ; 366     case I2C1_SPI2_IRQn:
 901                     ; 367 #endif  /* STM8L15X_MD */
 901                     ; 368       ITC->ISPR8 &= Mask;
 903  0160 c67f77        	ld	a,32631
 904  0163 1401          	and	a,(OFST-1,sp)
 905  0165 c77f77        	ld	32631,a
 906                     ; 369       ITC->ISPR8 |= NewPriority;
 908  0168 c67f77        	ld	a,32631
 909  016b 1a02          	or	a,(OFST+0,sp)
 910  016d c77f77        	ld	32631,a
 911                     ; 370       break;
 913  0170               L742:
 914                     ; 372     default:
 914                     ; 373       break;
 916  0170               L503:
 917                     ; 375 }
 920  0170 5b04          	addw	sp,#4
 921  0172 81            	ret
 934                     	xdef	_ITC_GetSoftwarePriority
 935                     	xdef	_ITC_SetSoftwarePriority
 936                     	xdef	_ITC_GetSoftIntStatus
 937                     	xdef	_ITC_GetCPUCC
 938                     	xdef	_ITC_DeInit
 957                     	end
