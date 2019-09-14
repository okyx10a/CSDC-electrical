   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
 109                     ; 96 void GPIO_DeInit(GPIO_TypeDef* GPIOx)
 109                     ; 97 {
 111                     	switch	.text
 112  0000               _GPIO_DeInit:
 116                     ; 98   GPIOx->CR2 = GPIO_CR2_RESET_VALUE; /* Reset Control Register 2 */
 118  0000 6f04          	clr	(4,x)
 119                     ; 99   GPIOx->ODR = GPIO_ODR_RESET_VALUE; /* Reset Output Data Register */
 121  0002 7f            	clr	(x)
 122                     ; 100   GPIOx->DDR = GPIO_DDR_RESET_VALUE; /* Reset Data Direction Register */
 124  0003 6f02          	clr	(2,x)
 125                     ; 101   GPIOx->CR1 = GPIO_CR1_RESET_VALUE; /* Reset Control Register 1 */
 127  0005 6f03          	clr	(3,x)
 128                     ; 102 }
 131  0007 81            	ret
 287                     ; 133 void GPIO_Init(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, GPIO_Mode_TypeDef GPIO_Mode)
 287                     ; 134 {
 288                     	switch	.text
 289  0008               _GPIO_Init:
 291  0008 89            	pushw	x
 292       00000000      OFST:	set	0
 295                     ; 139   assert_param(IS_GPIO_MODE(GPIO_Mode));
 297                     ; 140   assert_param(IS_GPIO_PIN(GPIO_Pin));
 299                     ; 143   GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 301  0009 7b05          	ld	a,(OFST+5,sp)
 302  000b 43            	cpl	a
 303  000c e404          	and	a,(4,x)
 304  000e e704          	ld	(4,x),a
 305                     ; 149   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x80) != (uint8_t)0x00) /* Output mode */
 307  0010 7b06          	ld	a,(OFST+6,sp)
 308  0012 a580          	bcp	a,#128
 309  0014 271d          	jreq	L541
 310                     ; 151     if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x10) != (uint8_t)0x00) /* High level */
 312  0016 7b06          	ld	a,(OFST+6,sp)
 313  0018 a510          	bcp	a,#16
 314  001a 2706          	jreq	L741
 315                     ; 153       GPIOx->ODR |= GPIO_Pin;
 317  001c f6            	ld	a,(x)
 318  001d 1a05          	or	a,(OFST+5,sp)
 319  001f f7            	ld	(x),a
 321  0020 2007          	jra	L151
 322  0022               L741:
 323                     ; 156       GPIOx->ODR &= (uint8_t)(~(GPIO_Pin));
 325  0022 1e01          	ldw	x,(OFST+1,sp)
 326  0024 7b05          	ld	a,(OFST+5,sp)
 327  0026 43            	cpl	a
 328  0027 f4            	and	a,(x)
 329  0028 f7            	ld	(x),a
 330  0029               L151:
 331                     ; 159     GPIOx->DDR |= GPIO_Pin;
 333  0029 1e01          	ldw	x,(OFST+1,sp)
 334  002b e602          	ld	a,(2,x)
 335  002d 1a05          	or	a,(OFST+5,sp)
 336  002f e702          	ld	(2,x),a
 338  0031 2009          	jra	L351
 339  0033               L541:
 340                     ; 163     GPIOx->DDR &= (uint8_t)(~(GPIO_Pin));
 342  0033 1e01          	ldw	x,(OFST+1,sp)
 343  0035 7b05          	ld	a,(OFST+5,sp)
 344  0037 43            	cpl	a
 345  0038 e402          	and	a,(2,x)
 346  003a e702          	ld	(2,x),a
 347  003c               L351:
 348                     ; 170   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x40) != (uint8_t)0x00) /* Pull-Up or Push-Pull */
 350  003c 7b06          	ld	a,(OFST+6,sp)
 351  003e a540          	bcp	a,#64
 352  0040 270a          	jreq	L551
 353                     ; 172     GPIOx->CR1 |= GPIO_Pin;
 355  0042 1e01          	ldw	x,(OFST+1,sp)
 356  0044 e603          	ld	a,(3,x)
 357  0046 1a05          	or	a,(OFST+5,sp)
 358  0048 e703          	ld	(3,x),a
 360  004a 2009          	jra	L751
 361  004c               L551:
 362                     ; 175     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 364  004c 1e01          	ldw	x,(OFST+1,sp)
 365  004e 7b05          	ld	a,(OFST+5,sp)
 366  0050 43            	cpl	a
 367  0051 e403          	and	a,(3,x)
 368  0053 e703          	ld	(3,x),a
 369  0055               L751:
 370                     ; 182   if ((((uint8_t)(GPIO_Mode)) & (uint8_t)0x20) != (uint8_t)0x00) /* Interrupt or Slow slope */
 372  0055 7b06          	ld	a,(OFST+6,sp)
 373  0057 a520          	bcp	a,#32
 374  0059 270a          	jreq	L161
 375                     ; 184     GPIOx->CR2 |= GPIO_Pin;
 377  005b 1e01          	ldw	x,(OFST+1,sp)
 378  005d e604          	ld	a,(4,x)
 379  005f 1a05          	or	a,(OFST+5,sp)
 380  0061 e704          	ld	(4,x),a
 382  0063 2009          	jra	L361
 383  0065               L161:
 384                     ; 187     GPIOx->CR2 &= (uint8_t)(~(GPIO_Pin));
 386  0065 1e01          	ldw	x,(OFST+1,sp)
 387  0067 7b05          	ld	a,(OFST+5,sp)
 388  0069 43            	cpl	a
 389  006a e404          	and	a,(4,x)
 390  006c e704          	ld	(4,x),a
 391  006e               L361:
 392                     ; 190 }
 395  006e 85            	popw	x
 396  006f 81            	ret
 473                     ; 209 void GPIO_ExternalPullUpConfig(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin, FunctionalState NewState)
 473                     ; 210 {
 474                     	switch	.text
 475  0070               _GPIO_ExternalPullUpConfig:
 477  0070 89            	pushw	x
 478       00000000      OFST:	set	0
 481                     ; 212   assert_param(IS_GPIO_PIN(GPIO_Pin));
 483                     ; 213   assert_param(IS_FUNCTIONAL_STATE(NewState));
 485                     ; 215   if (NewState != DISABLE) /* External Pull-Up Set*/
 487  0071 0d06          	tnz	(OFST+6,sp)
 488  0073 2708          	jreq	L522
 489                     ; 217     GPIOx->CR1 |= GPIO_Pin;
 491  0075 e603          	ld	a,(3,x)
 492  0077 1a05          	or	a,(OFST+5,sp)
 493  0079 e703          	ld	(3,x),a
 495  007b 2009          	jra	L722
 496  007d               L522:
 497                     ; 220     GPIOx->CR1 &= (uint8_t)(~(GPIO_Pin));
 499  007d 1e01          	ldw	x,(OFST+1,sp)
 500  007f 7b05          	ld	a,(OFST+5,sp)
 501  0081 43            	cpl	a
 502  0082 e403          	and	a,(3,x)
 503  0084 e703          	ld	(3,x),a
 504  0086               L722:
 505                     ; 222 }
 508  0086 85            	popw	x
 509  0087 81            	ret
 555                     ; 248 void GPIO_Write(GPIO_TypeDef* GPIOx, uint8_t GPIO_PortVal)
 555                     ; 249 {
 556                     	switch	.text
 557  0088               _GPIO_Write:
 559  0088 89            	pushw	x
 560       00000000      OFST:	set	0
 563                     ; 250   GPIOx->ODR = GPIO_PortVal;
 565  0089 7b05          	ld	a,(OFST+5,sp)
 566  008b 1e01          	ldw	x,(OFST+1,sp)
 567  008d f7            	ld	(x),a
 568                     ; 251 }
 571  008e 85            	popw	x
 572  008f 81            	ret
 732                     ; 270 void GPIO_WriteBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin, BitAction GPIO_BitVal)
 732                     ; 271 {
 733                     	switch	.text
 734  0090               _GPIO_WriteBit:
 736  0090 89            	pushw	x
 737       00000000      OFST:	set	0
 740                     ; 273   assert_param(IS_GPIO_PIN(GPIO_Pin));
 742                     ; 274   assert_param(IS_STATE_VALUE(GPIO_BitVal));
 744                     ; 276   if (GPIO_BitVal != RESET)
 746  0091 0d06          	tnz	(OFST+6,sp)
 747  0093 2706          	jreq	L743
 748                     ; 278     GPIOx->ODR |= GPIO_Pin;
 750  0095 f6            	ld	a,(x)
 751  0096 1a05          	or	a,(OFST+5,sp)
 752  0098 f7            	ld	(x),a
 754  0099 2007          	jra	L153
 755  009b               L743:
 756                     ; 283     GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 758  009b 1e01          	ldw	x,(OFST+1,sp)
 759  009d 7b05          	ld	a,(OFST+5,sp)
 760  009f 43            	cpl	a
 761  00a0 f4            	and	a,(x)
 762  00a1 f7            	ld	(x),a
 763  00a2               L153:
 764                     ; 285 }
 767  00a2 85            	popw	x
 768  00a3 81            	ret
 814                     ; 303 void GPIO_SetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 814                     ; 304 {
 815                     	switch	.text
 816  00a4               _GPIO_SetBits:
 818  00a4 89            	pushw	x
 819       00000000      OFST:	set	0
 822                     ; 305   GPIOx->ODR |= GPIO_Pin;
 824  00a5 f6            	ld	a,(x)
 825  00a6 1a05          	or	a,(OFST+5,sp)
 826  00a8 f7            	ld	(x),a
 827                     ; 306 }
 830  00a9 85            	popw	x
 831  00aa 81            	ret
 877                     ; 324 void GPIO_ResetBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 877                     ; 325 {
 878                     	switch	.text
 879  00ab               _GPIO_ResetBits:
 881  00ab 89            	pushw	x
 882       00000000      OFST:	set	0
 885                     ; 326   GPIOx->ODR &= (uint8_t)(~GPIO_Pin);
 887  00ac 7b05          	ld	a,(OFST+5,sp)
 888  00ae 43            	cpl	a
 889  00af f4            	and	a,(x)
 890  00b0 f7            	ld	(x),a
 891                     ; 327 }
 894  00b1 85            	popw	x
 895  00b2 81            	ret
 941                     ; 336 void GPIO_ToggleBits(GPIO_TypeDef* GPIOx, uint8_t GPIO_Pin)
 941                     ; 337 {
 942                     	switch	.text
 943  00b3               _GPIO_ToggleBits:
 945  00b3 89            	pushw	x
 946       00000000      OFST:	set	0
 949                     ; 338   GPIOx->ODR ^= GPIO_Pin;
 951  00b4 f6            	ld	a,(x)
 952  00b5 1805          	xor	a,	(OFST+5,sp)
 953  00b7 f7            	ld	(x),a
 954                     ; 339 }
 957  00b8 85            	popw	x
 958  00b9 81            	ret
 995                     ; 347 uint8_t GPIO_ReadInputData(GPIO_TypeDef* GPIOx)
 995                     ; 348 {
 996                     	switch	.text
 997  00ba               _GPIO_ReadInputData:
1001                     ; 349   return ((uint8_t)GPIOx->IDR);
1003  00ba e601          	ld	a,(1,x)
1006  00bc 81            	ret
1044                     ; 358 uint8_t GPIO_ReadOutputData(GPIO_TypeDef* GPIOx)
1044                     ; 359 {
1045                     	switch	.text
1046  00bd               _GPIO_ReadOutputData:
1050                     ; 360   return ((uint8_t)GPIOx->ODR);
1052  00bd f6            	ld	a,(x)
1055  00be 81            	ret
1104                     ; 378 BitStatus GPIO_ReadInputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1104                     ; 379 {
1105                     	switch	.text
1106  00bf               _GPIO_ReadInputDataBit:
1108  00bf 89            	pushw	x
1109       00000000      OFST:	set	0
1112                     ; 380   return ((BitStatus)(GPIOx->IDR & (uint8_t)GPIO_Pin));
1114  00c0 e601          	ld	a,(1,x)
1115  00c2 1405          	and	a,(OFST+5,sp)
1118  00c4 85            	popw	x
1119  00c5 81            	ret
1168                     ; 389 BitStatus GPIO_ReadOutputDataBit(GPIO_TypeDef* GPIOx, GPIO_Pin_TypeDef GPIO_Pin)
1168                     ; 390 {
1169                     	switch	.text
1170  00c6               _GPIO_ReadOutputDataBit:
1172  00c6 89            	pushw	x
1173       00000000      OFST:	set	0
1176                     ; 391   return ((BitStatus)(GPIOx->ODR & (uint8_t)GPIO_Pin));
1178  00c7 f6            	ld	a,(x)
1179  00c8 1405          	and	a,(OFST+5,sp)
1182  00ca 85            	popw	x
1183  00cb 81            	ret
1196                     	xdef	_GPIO_ReadOutputDataBit
1197                     	xdef	_GPIO_ReadInputDataBit
1198                     	xdef	_GPIO_ReadOutputData
1199                     	xdef	_GPIO_ReadInputData
1200                     	xdef	_GPIO_ToggleBits
1201                     	xdef	_GPIO_ResetBits
1202                     	xdef	_GPIO_SetBits
1203                     	xdef	_GPIO_WriteBit
1204                     	xdef	_GPIO_Write
1205                     	xdef	_GPIO_ExternalPullUpConfig
1206                     	xdef	_GPIO_Init
1207                     	xdef	_GPIO_DeInit
1226                     	end
