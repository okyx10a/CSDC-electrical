   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  44                     ; 5 void sw_DeInit(void)
  44                     ; 6 {
  46                     	switch	.text
  47  0000               _sw_DeInit:
  51                     ; 7 	I2C_LowLevel_DeInit();
  53  0000 cd0000        	call	_I2C_LowLevel_DeInit
  55                     ; 8 }
  58  0003 81            	ret
  85                     ; 10 void sw_Init(void)
  85                     ; 11 {
  86                     	switch	.text
  87  0004               _sw_Init:
  91                     ; 12   I2C_LowLevel_Init();
  93  0004 cd0000        	call	_I2C_LowLevel_Init
  95                     ; 14 	GPIOB->DDR = 0b11111111;
  97  0007 35ff5007      	mov	20487,#255
  98                     ; 18   I2C_Cmd(I2C, ENABLE);
 100  000b 4b01          	push	#1
 101  000d ae5210        	ldw	x,#21008
 102  0010 cd0000        	call	_I2C_Cmd
 104  0013 84            	pop	a
 105                     ; 20   I2C_Init(I2C, SW_I2C_SPEED, OWN_ADDR, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
 107  0014 4b00          	push	#0
 108  0016 4b04          	push	#4
 109  0018 4b00          	push	#0
 110  001a 4b00          	push	#0
 111  001c ae00a0        	ldw	x,#160
 112  001f 89            	pushw	x
 113  0020 ae86a0        	ldw	x,#34464
 114  0023 89            	pushw	x
 115  0024 ae0001        	ldw	x,#1
 116  0027 89            	pushw	x
 117  0028 ae5210        	ldw	x,#21008
 118  002b cd0000        	call	_I2C_Init
 120  002e 5b0a          	addw	sp,#10
 121                     ; 23   I2C_DMACmd(I2C, ENABLE);
 123  0030 4b01          	push	#1
 124  0032 ae5210        	ldw	x,#21008
 125  0035 cd0000        	call	_I2C_DMACmd
 127  0038 84            	pop	a
 128                     ; 24 }
 131  0039 81            	ret
 169                     ; 26 void sw_QuickCmd(uint8_t slave_addr)
 169                     ; 27 {
 170                     	switch	.text
 171  003a               _sw_QuickCmd:
 173  003a 88            	push	a
 174       00000000      OFST:	set	0
 177                     ; 28 	I2C_GenerateSTART(I2C1, ENABLE);
 179  003b 4b01          	push	#1
 180  003d ae5210        	ldw	x,#21008
 181  0040 cd0000        	call	_I2C_GenerateSTART
 183  0043 84            	pop	a
 185  0044               L15:
 186                     ; 31   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 188  0044 ae0301        	ldw	x,#769
 189  0047 89            	pushw	x
 190  0048 ae5210        	ldw	x,#21008
 191  004b cd0000        	call	_I2C_CheckEvent
 193  004e 85            	popw	x
 194  004f 4d            	tnz	a
 195  0050 27f2          	jreq	L15
 196                     ; 35   I2C_Send7bitAddress(I2C1, slave_addr, I2C_Direction_Transmitter);
 199  0052 4b00          	push	#0
 200  0054 7b02          	ld	a,(OFST+2,sp)
 201  0056 88            	push	a
 202  0057 ae5210        	ldw	x,#21008
 203  005a cd0000        	call	_I2C_Send7bitAddress
 205  005d 85            	popw	x
 207  005e               L75:
 208                     ; 38   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 210  005e ae0782        	ldw	x,#1922
 211  0061 89            	pushw	x
 212  0062 ae5210        	ldw	x,#21008
 213  0065 cd0000        	call	_I2C_CheckEvent
 215  0068 85            	popw	x
 216  0069 4d            	tnz	a
 217  006a 27f2          	jreq	L75
 218                     ; 42   I2C_GenerateSTOP(I2C1, ENABLE);
 220  006c 4b01          	push	#1
 221  006e ae5210        	ldw	x,#21008
 222  0071 cd0000        	call	_I2C_GenerateSTOP
 224  0074 84            	pop	a
 225                     ; 43 }
 228  0075 84            	pop	a
 229  0076 81            	ret
 277                     ; 45 void sw_WriteCmdByte(uint8_t SwAddr, uint8_t Cmd)
 277                     ; 46 {
 278                     	switch	.text
 279  0077               _sw_WriteCmdByte:
 281  0077 89            	pushw	x
 282       00000000      OFST:	set	0
 285                     ; 47 	I2C_GenerateSTART(I2C1, ENABLE); //sending start condition
 287  0078 4b01          	push	#1
 288  007a ae5210        	ldw	x,#21008
 289  007d cd0000        	call	_I2C_GenerateSTART
 291  0080 84            	pop	a
 293  0081               L701:
 294                     ; 51 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 296  0081 ae0301        	ldw	x,#769
 297  0084 89            	pushw	x
 298  0085 ae5210        	ldw	x,#21008
 299  0088 cd0000        	call	_I2C_CheckEvent
 301  008b 85            	popw	x
 302  008c 4d            	tnz	a
 303  008d 27f2          	jreq	L701
 304                     ; 56 	I2C_Send7bitAddress(I2C1, SwAddr, I2C_Direction_Transmitter);
 306  008f 4b00          	push	#0
 307  0091 7b02          	ld	a,(OFST+2,sp)
 308  0093 88            	push	a
 309  0094 ae5210        	ldw	x,#21008
 310  0097 cd0000        	call	_I2C_Send7bitAddress
 312  009a 85            	popw	x
 314  009b               L511:
 315                     ; 60 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 317  009b ae0782        	ldw	x,#1922
 318  009e 89            	pushw	x
 319  009f ae5210        	ldw	x,#21008
 320  00a2 cd0000        	call	_I2C_CheckEvent
 322  00a5 85            	popw	x
 323  00a6 4d            	tnz	a
 324  00a7 27f2          	jreq	L511
 325                     ; 65 	I2C_SendData(I2C1, Cmd);
 327  00a9 7b02          	ld	a,(OFST+2,sp)
 328  00ab 88            	push	a
 329  00ac ae5210        	ldw	x,#21008
 330  00af cd0000        	call	_I2C_SendData
 332  00b2 84            	pop	a
 334  00b3               L321:
 335                     ; 68 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED))
 337  00b3 ae0784        	ldw	x,#1924
 338  00b6 89            	pushw	x
 339  00b7 ae5210        	ldw	x,#21008
 340  00ba cd0000        	call	_I2C_CheckEvent
 342  00bd 85            	popw	x
 343  00be 4d            	tnz	a
 344  00bf 27f2          	jreq	L321
 345                     ; 73 	I2C_GenerateSTOP(I2C1, ENABLE);
 347  00c1 4b01          	push	#1
 348  00c3 ae5210        	ldw	x,#21008
 349  00c6 cd0000        	call	_I2C_GenerateSTOP
 351  00c9 84            	pop	a
 352                     ; 74 }
 355  00ca 85            	popw	x
 356  00cb 81            	ret
 413                     ; 76 void sw_WriteExtCmdByte(uint8_t SwAddr, uint8_t RegAddr, uint8_t ExtCmd)
 413                     ; 77 {
 414                     	switch	.text
 415  00cc               _sw_WriteExtCmdByte:
 417  00cc 89            	pushw	x
 418       00000000      OFST:	set	0
 421                     ; 78 	I2C_GenerateSTART(I2C1, ENABLE); //sending start condition
 423  00cd 4b01          	push	#1
 424  00cf ae5210        	ldw	x,#21008
 425  00d2 cd0000        	call	_I2C_GenerateSTART
 427  00d5 84            	pop	a
 429  00d6               L751:
 430                     ; 82 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 432  00d6 ae0301        	ldw	x,#769
 433  00d9 89            	pushw	x
 434  00da ae5210        	ldw	x,#21008
 435  00dd cd0000        	call	_I2C_CheckEvent
 437  00e0 85            	popw	x
 438  00e1 4d            	tnz	a
 439  00e2 27f2          	jreq	L751
 440                     ; 87 	I2C_Send7bitAddress(I2C1, SwAddr, I2C_Direction_Transmitter);
 442  00e4 4b00          	push	#0
 443  00e6 7b02          	ld	a,(OFST+2,sp)
 444  00e8 88            	push	a
 445  00e9 ae5210        	ldw	x,#21008
 446  00ec cd0000        	call	_I2C_Send7bitAddress
 448  00ef 85            	popw	x
 450  00f0               L561:
 451                     ; 91 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 453  00f0 ae0782        	ldw	x,#1922
 454  00f3 89            	pushw	x
 455  00f4 ae5210        	ldw	x,#21008
 456  00f7 cd0000        	call	_I2C_CheckEvent
 458  00fa 85            	popw	x
 459  00fb 4d            	tnz	a
 460  00fc 27f2          	jreq	L561
 461                     ; 97 	I2C_SendData(I2C1, RegAddr);
 463  00fe 7b02          	ld	a,(OFST+2,sp)
 464  0100 88            	push	a
 465  0101 ae5210        	ldw	x,#21008
 466  0104 cd0000        	call	_I2C_SendData
 468  0107 84            	pop	a
 470  0108               L371:
 471                     ; 100 	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED))
 473  0108 ae0784        	ldw	x,#1924
 474  010b 89            	pushw	x
 475  010c ae5210        	ldw	x,#21008
 476  010f cd0000        	call	_I2C_CheckEvent
 478  0112 85            	popw	x
 479  0113 4d            	tnz	a
 480  0114 27f2          	jreq	L371
 481                     ; 105 	I2C_SendData(I2C1, ExtCmd);
 483  0116 7b05          	ld	a,(OFST+5,sp)
 484  0118 88            	push	a
 485  0119 ae5210        	ldw	x,#21008
 486  011c cd0000        	call	_I2C_SendData
 488  011f 84            	pop	a
 490  0120               L102:
 491                     ; 109 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED))
 493  0120 ae0784        	ldw	x,#1924
 494  0123 89            	pushw	x
 495  0124 ae5210        	ldw	x,#21008
 496  0127 cd0000        	call	_I2C_CheckEvent
 498  012a 85            	popw	x
 499  012b 4d            	tnz	a
 500  012c 27f2          	jreq	L102
 501                     ; 114 	I2C_GenerateSTOP(I2C1, ENABLE);
 503  012e 4b01          	push	#1
 504  0130 ae5210        	ldw	x,#21008
 505  0133 cd0000        	call	_I2C_GenerateSTOP
 507  0136 84            	pop	a
 508                     ; 115 }
 511  0137 85            	popw	x
 512  0138 81            	ret
 603                     ; 117 void sw_ReadVoltCurr(uint8_t SwAddr, sw_t* Switch)
 603                     ; 118 {
 604                     	switch	.text
 605  0139               _sw_ReadVoltCurr:
 607  0139 88            	push	a
 608  013a 5205          	subw	sp,#5
 609       00000005      OFST:	set	5
 612  013c               L152:
 613                     ; 121   while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
 615  013c ae0302        	ldw	x,#770
 616  013f 89            	pushw	x
 617  0140 ae5210        	ldw	x,#21008
 618  0143 cd0000        	call	_I2C_GetFlagStatus
 620  0146 85            	popw	x
 621  0147 4d            	tnz	a
 622  0148 26f2          	jrne	L152
 623                     ; 124 	I2C_GenerateSTART(I2C1, ENABLE); //sending start condition
 625  014a 4b01          	push	#1
 626  014c ae5210        	ldw	x,#21008
 627  014f cd0000        	call	_I2C_GenerateSTART
 629  0152 84            	pop	a
 631  0153               L752:
 632                     ; 128 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 634  0153 ae0301        	ldw	x,#769
 635  0156 89            	pushw	x
 636  0157 ae5210        	ldw	x,#21008
 637  015a cd0000        	call	_I2C_CheckEvent
 639  015d 85            	popw	x
 640  015e 4d            	tnz	a
 641  015f 27f2          	jreq	L752
 642                     ; 133 	I2C_Send7bitAddress(I2C1, SwAddr, I2C_Direction_Receiver);
 644  0161 4b01          	push	#1
 645  0163 7b07          	ld	a,(OFST+2,sp)
 646  0165 88            	push	a
 647  0166 ae5210        	ldw	x,#21008
 648  0169 cd0000        	call	_I2C_Send7bitAddress
 650  016c 85            	popw	x
 652  016d               L562:
 653                     ; 136   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
 655  016d ae0302        	ldw	x,#770
 656  0170 89            	pushw	x
 657  0171 ae5210        	ldw	x,#21008
 658  0174 cd0000        	call	_I2C_CheckEvent
 660  0177 85            	popw	x
 661  0178 4d            	tnz	a
 662  0179 27f2          	jreq	L562
 664  017b               L372:
 665                     ; 143   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED)) 
 667  017b ae0340        	ldw	x,#832
 668  017e 89            	pushw	x
 669  017f ae5210        	ldw	x,#21008
 670  0182 cd0000        	call	_I2C_CheckEvent
 672  0185 85            	popw	x
 673  0186 4d            	tnz	a
 674  0187 27f2          	jreq	L372
 675                     ; 146 	buffer[0] = I2C_ReceiveData(I2C1); //meanwhile the slave send the second byte
 677  0189 ae5210        	ldw	x,#21008
 678  018c cd0000        	call	_I2C_ReceiveData
 680  018f 6b03          	ld	(OFST-2,sp),a
 682  0191               L303:
 683                     ; 150   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED)) 
 685  0191 ae0340        	ldw	x,#832
 686  0194 89            	pushw	x
 687  0195 ae5210        	ldw	x,#21008
 688  0198 cd0000        	call	_I2C_CheckEvent
 690  019b 85            	popw	x
 691  019c 4d            	tnz	a
 692  019d 27f2          	jreq	L303
 693                     ; 153 	buffer[1] = I2C_ReceiveData(I2C1); //meanwhile the slave send the third byte
 695  019f ae5210        	ldw	x,#21008
 696  01a2 cd0000        	call	_I2C_ReceiveData
 698  01a5 6b04          	ld	(OFST-1,sp),a
 699                     ; 156   I2C_AcknowledgeConfig(I2C1, DISABLE);
 701  01a7 4b00          	push	#0
 702  01a9 ae5210        	ldw	x,#21008
 703  01ac cd0000        	call	_I2C_AcknowledgeConfig
 705  01af 84            	pop	a
 706                     ; 159   I2C_GenerateSTOP(I2C1, ENABLE);
 708  01b0 4b01          	push	#1
 709  01b2 ae5210        	ldw	x,#21008
 710  01b5 cd0000        	call	_I2C_GenerateSTOP
 712  01b8 84            	pop	a
 714  01b9               L113:
 715                     ; 163   while (I2C_GetFlagStatus(I2C1, I2C_FLAG_RXNE) == RESET)
 717  01b9 ae0140        	ldw	x,#320
 718  01bc 89            	pushw	x
 719  01bd ae5210        	ldw	x,#21008
 720  01c0 cd0000        	call	_I2C_GetFlagStatus
 722  01c3 85            	popw	x
 723  01c4 4d            	tnz	a
 724  01c5 27f2          	jreq	L113
 725                     ; 166 	buffer[2] = I2C_ReceiveData(I2C1);// receieve the third bit
 727  01c7 ae5210        	ldw	x,#21008
 728  01ca cd0000        	call	_I2C_ReceiveData
 730  01cd 6b05          	ld	(OFST+0,sp),a
 731                     ; 168 	Switch->voltage = (6.65/4096)*(buffer[0]<<4|buffer[2]>>4);//in unit V
 733  01cf 1e09          	ldw	x,(OFST+4,sp)
 734  01d1 89            	pushw	x
 735  01d2 7b07          	ld	a,(OFST+2,sp)
 736  01d4 4e            	swap	a
 737  01d5 a40f          	and	a,#15
 738  01d7 5f            	clrw	x
 739  01d8 97            	ld	xl,a
 740  01d9 1f03          	ldw	(OFST-2,sp),x
 741  01db 7b05          	ld	a,(OFST+0,sp)
 742  01dd 97            	ld	xl,a
 743  01de a610          	ld	a,#16
 744  01e0 42            	mul	x,a
 745  01e1 01            	rrwa	x,a
 746  01e2 1a04          	or	a,(OFST-1,sp)
 747  01e4 41            	exg	a,xl
 748  01e5 1a03          	or	a,(OFST-2,sp)
 749  01e7 41            	exg	a,xl
 750  01e8 02            	rlwa	x,a
 751  01e9 cd0000        	call	c_itof
 753  01ec ae0004        	ldw	x,#L123
 754  01ef cd0000        	call	c_fmul
 756  01f2 cd0000        	call	c_ftoi
 758  01f5 9085          	popw	y
 759  01f7 90ff          	ldw	(y),x
 760                     ; 169 	Switch->current = (105.84/4096)*(buffer[1]<<4|buffer[2]&0b1111);// in unit mA
 762  01f9 1e09          	ldw	x,(OFST+4,sp)
 763  01fb 89            	pushw	x
 764  01fc 7b07          	ld	a,(OFST+2,sp)
 765  01fe a40f          	and	a,#15
 766  0200 6b04          	ld	(OFST-1,sp),a
 767  0202 7b06          	ld	a,(OFST+1,sp)
 768  0204 97            	ld	xl,a
 769  0205 a610          	ld	a,#16
 770  0207 42            	mul	x,a
 771  0208 01            	rrwa	x,a
 772  0209 1a04          	or	a,(OFST-1,sp)
 773  020b 02            	rlwa	x,a
 774  020c cd0000        	call	c_itof
 776  020f ae0000        	ldw	x,#L133
 777  0212 cd0000        	call	c_fmul
 779  0215 cd0000        	call	c_ftoi
 781  0218 9085          	popw	y
 782  021a 90ef02        	ldw	(2,y),x
 783                     ; 170 }
 786  021d 5b06          	addw	sp,#6
 787  021f 81            	ret
 850                     ; 172 void sw_ReadCurrent(uint8_t SwAddr, sw_t* Switch)
 850                     ; 173 {
 851                     	switch	.text
 852  0220               _sw_ReadCurrent:
 854  0220 88            	push	a
 855  0221 5204          	subw	sp,#4
 856       00000004      OFST:	set	4
 859  0223               L763:
 860                     ; 176   while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
 862  0223 ae0302        	ldw	x,#770
 863  0226 89            	pushw	x
 864  0227 ae5210        	ldw	x,#21008
 865  022a cd0000        	call	_I2C_GetFlagStatus
 867  022d 85            	popw	x
 868  022e 4d            	tnz	a
 869  022f 26f2          	jrne	L763
 870                     ; 179 	I2C_GenerateSTART(I2C1, ENABLE); //sending start condition
 872  0231 4b01          	push	#1
 873  0233 ae5210        	ldw	x,#21008
 874  0236 cd0000        	call	_I2C_GenerateSTART
 876  0239 84            	pop	a
 878  023a               L573:
 879                     ; 183 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 881  023a ae0301        	ldw	x,#769
 882  023d 89            	pushw	x
 883  023e ae5210        	ldw	x,#21008
 884  0241 cd0000        	call	_I2C_CheckEvent
 886  0244 85            	popw	x
 887  0245 4d            	tnz	a
 888  0246 27f2          	jreq	L573
 889                     ; 188 	I2C_Send7bitAddress(I2C1, SwAddr, I2C_Direction_Receiver);
 891  0248 4b01          	push	#1
 892  024a 7b06          	ld	a,(OFST+2,sp)
 893  024c 88            	push	a
 894  024d ae5210        	ldw	x,#21008
 895  0250 cd0000        	call	_I2C_Send7bitAddress
 897  0253 85            	popw	x
 899  0254               L304:
 900                     ; 191   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
 902  0254 ae0302        	ldw	x,#770
 903  0257 89            	pushw	x
 904  0258 ae5210        	ldw	x,#21008
 905  025b cd0000        	call	_I2C_CheckEvent
 907  025e 85            	popw	x
 908  025f 4d            	tnz	a
 909  0260 27f2          	jreq	L304
 911  0262               L114:
 912                     ; 198   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED)) 
 914  0262 ae0340        	ldw	x,#832
 915  0265 89            	pushw	x
 916  0266 ae5210        	ldw	x,#21008
 917  0269 cd0000        	call	_I2C_CheckEvent
 919  026c 85            	popw	x
 920  026d 4d            	tnz	a
 921  026e 27f2          	jreq	L114
 922                     ; 201 	buffer[0] = I2C_ReceiveData(I2C1); //meanwhile the slave send the second byte
 924  0270 ae5210        	ldw	x,#21008
 925  0273 cd0000        	call	_I2C_ReceiveData
 927  0276 6b03          	ld	(OFST-1,sp),a
 928                     ; 204   I2C_AcknowledgeConfig(I2C1, DISABLE);
 930  0278 4b00          	push	#0
 931  027a ae5210        	ldw	x,#21008
 932  027d cd0000        	call	_I2C_AcknowledgeConfig
 934  0280 84            	pop	a
 935                     ; 207   I2C_GenerateSTOP(I2C1, ENABLE);
 937  0281 4b01          	push	#1
 938  0283 ae5210        	ldw	x,#21008
 939  0286 cd0000        	call	_I2C_GenerateSTOP
 941  0289 84            	pop	a
 943  028a               L714:
 944                     ; 211   while (I2C_GetFlagStatus(I2C1, I2C_FLAG_RXNE) == RESET)
 946  028a ae0140        	ldw	x,#320
 947  028d 89            	pushw	x
 948  028e ae5210        	ldw	x,#21008
 949  0291 cd0000        	call	_I2C_GetFlagStatus
 951  0294 85            	popw	x
 952  0295 4d            	tnz	a
 953  0296 27f2          	jreq	L714
 954                     ; 214 	buffer[2] = I2C_ReceiveData(I2C1);
 956  0298 ae5210        	ldw	x,#21008
 957  029b cd0000        	call	_I2C_ReceiveData
 959  029e 6b05          	ld	(OFST+1,sp),a
 960                     ; 216 	Switch->current = (105.84/4096)*(buffer[0]<<4|buffer[1]>>4);// in unit mA
 962  02a0 1e08          	ldw	x,(OFST+4,sp)
 963  02a2 89            	pushw	x
 964  02a3 7b06          	ld	a,(OFST+2,sp)
 965  02a5 4e            	swap	a
 966  02a6 a40f          	and	a,#15
 967  02a8 5f            	clrw	x
 968  02a9 97            	ld	xl,a
 969  02aa 1f03          	ldw	(OFST-1,sp),x
 970  02ac 7b05          	ld	a,(OFST+1,sp)
 971  02ae 97            	ld	xl,a
 972  02af a610          	ld	a,#16
 973  02b1 42            	mul	x,a
 974  02b2 01            	rrwa	x,a
 975  02b3 1a04          	or	a,(OFST+0,sp)
 976  02b5 41            	exg	a,xl
 977  02b6 1a03          	or	a,(OFST-1,sp)
 978  02b8 41            	exg	a,xl
 979  02b9 02            	rlwa	x,a
 980  02ba cd0000        	call	c_itof
 982  02bd ae0000        	ldw	x,#L133
 983  02c0 cd0000        	call	c_fmul
 985  02c3 cd0000        	call	c_ftoi
 987  02c6 9085          	popw	y
 988  02c8 90ef02        	ldw	(2,y),x
 989                     ; 217 }
 992  02cb 5b05          	addw	sp,#5
 993  02cd 81            	ret
1056                     ; 219 void sw_ReadVoltage(uint8_t SwAddr, sw_t* Switch)
1056                     ; 220 {
1057                     	switch	.text
1058  02ce               _sw_ReadVoltage:
1060  02ce 88            	push	a
1061  02cf 5204          	subw	sp,#4
1062       00000004      OFST:	set	4
1065  02d1               L554:
1066                     ; 223   while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
1068  02d1 ae0302        	ldw	x,#770
1069  02d4 89            	pushw	x
1070  02d5 ae5210        	ldw	x,#21008
1071  02d8 cd0000        	call	_I2C_GetFlagStatus
1073  02db 85            	popw	x
1074  02dc 4d            	tnz	a
1075  02dd 26f2          	jrne	L554
1076                     ; 226 	I2C_GenerateSTART(I2C1, ENABLE); //sending start condition
1078  02df 4b01          	push	#1
1079  02e1 ae5210        	ldw	x,#21008
1080  02e4 cd0000        	call	_I2C_GenerateSTART
1082  02e7 84            	pop	a
1084  02e8               L364:
1085                     ; 230 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
1087  02e8 ae0301        	ldw	x,#769
1088  02eb 89            	pushw	x
1089  02ec ae5210        	ldw	x,#21008
1090  02ef cd0000        	call	_I2C_CheckEvent
1092  02f2 85            	popw	x
1093  02f3 4d            	tnz	a
1094  02f4 27f2          	jreq	L364
1095                     ; 235 	I2C_Send7bitAddress(I2C1, SwAddr, I2C_Direction_Receiver);
1097  02f6 4b01          	push	#1
1098  02f8 7b06          	ld	a,(OFST+2,sp)
1099  02fa 88            	push	a
1100  02fb ae5210        	ldw	x,#21008
1101  02fe cd0000        	call	_I2C_Send7bitAddress
1103  0301 85            	popw	x
1105  0302               L174:
1106                     ; 238   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
1108  0302 ae0302        	ldw	x,#770
1109  0305 89            	pushw	x
1110  0306 ae5210        	ldw	x,#21008
1111  0309 cd0000        	call	_I2C_CheckEvent
1113  030c 85            	popw	x
1114  030d 4d            	tnz	a
1115  030e 27f2          	jreq	L174
1117  0310               L774:
1118                     ; 245   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED)) 
1120  0310 ae0340        	ldw	x,#832
1121  0313 89            	pushw	x
1122  0314 ae5210        	ldw	x,#21008
1123  0317 cd0000        	call	_I2C_CheckEvent
1125  031a 85            	popw	x
1126  031b 4d            	tnz	a
1127  031c 27f2          	jreq	L774
1128                     ; 248 	buffer[0] = I2C_ReceiveData(I2C1); //meanwhile the slave send the second byte
1130  031e ae5210        	ldw	x,#21008
1131  0321 cd0000        	call	_I2C_ReceiveData
1133  0324 6b03          	ld	(OFST-1,sp),a
1134                     ; 251   I2C_AcknowledgeConfig(I2C1, DISABLE);
1136  0326 4b00          	push	#0
1137  0328 ae5210        	ldw	x,#21008
1138  032b cd0000        	call	_I2C_AcknowledgeConfig
1140  032e 84            	pop	a
1141                     ; 254   I2C_GenerateSTOP(I2C1, ENABLE);
1143  032f 4b01          	push	#1
1144  0331 ae5210        	ldw	x,#21008
1145  0334 cd0000        	call	_I2C_GenerateSTOP
1147  0337 84            	pop	a
1149  0338               L505:
1150                     ; 258   while (I2C_GetFlagStatus(I2C1, I2C_FLAG_RXNE) == RESET)
1152  0338 ae0140        	ldw	x,#320
1153  033b 89            	pushw	x
1154  033c ae5210        	ldw	x,#21008
1155  033f cd0000        	call	_I2C_GetFlagStatus
1157  0342 85            	popw	x
1158  0343 4d            	tnz	a
1159  0344 27f2          	jreq	L505
1160                     ; 261 	buffer[2] = I2C_ReceiveData(I2C1);
1162  0346 ae5210        	ldw	x,#21008
1163  0349 cd0000        	call	_I2C_ReceiveData
1165  034c 6b05          	ld	(OFST+1,sp),a
1166                     ; 263 	Switch->voltage = (6.65/4096)*(buffer[0]<<4|buffer[1]>>4);// in unit mA
1168  034e 1e08          	ldw	x,(OFST+4,sp)
1169  0350 89            	pushw	x
1170  0351 7b06          	ld	a,(OFST+2,sp)
1171  0353 4e            	swap	a
1172  0354 a40f          	and	a,#15
1173  0356 5f            	clrw	x
1174  0357 97            	ld	xl,a
1175  0358 1f03          	ldw	(OFST-1,sp),x
1176  035a 7b05          	ld	a,(OFST+1,sp)
1177  035c 97            	ld	xl,a
1178  035d a610          	ld	a,#16
1179  035f 42            	mul	x,a
1180  0360 01            	rrwa	x,a
1181  0361 1a04          	or	a,(OFST+0,sp)
1182  0363 41            	exg	a,xl
1183  0364 1a03          	or	a,(OFST-1,sp)
1184  0366 41            	exg	a,xl
1185  0367 02            	rlwa	x,a
1186  0368 cd0000        	call	c_itof
1188  036b ae0004        	ldw	x,#L123
1189  036e cd0000        	call	c_fmul
1191  0371 cd0000        	call	c_ftoi
1193  0374 9085          	popw	y
1194  0376 90ff          	ldw	(y),x
1195                     ; 264 }
1198  0378 5b05          	addw	sp,#5
1199  037a 81            	ret
1250                     ; 266 void sw_ReadStatus(uint8_t SwAddr, sw_t* Switch)
1250                     ; 267 {
1251                     	switch	.text
1252  037b               _sw_ReadStatus:
1254  037b 88            	push	a
1255       00000000      OFST:	set	0
1258  037c               L735:
1259                     ; 269   while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
1261  037c ae0302        	ldw	x,#770
1262  037f 89            	pushw	x
1263  0380 ae5210        	ldw	x,#21008
1264  0383 cd0000        	call	_I2C_GetFlagStatus
1266  0386 85            	popw	x
1267  0387 4d            	tnz	a
1268  0388 26f2          	jrne	L735
1269                     ; 272 	I2C_GenerateSTART(I2C1, ENABLE); //sending start condition
1271  038a 4b01          	push	#1
1272  038c ae5210        	ldw	x,#21008
1273  038f cd0000        	call	_I2C_GenerateSTART
1275  0392 84            	pop	a
1277  0393               L545:
1278                     ; 276 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
1280  0393 ae0301        	ldw	x,#769
1281  0396 89            	pushw	x
1282  0397 ae5210        	ldw	x,#21008
1283  039a cd0000        	call	_I2C_CheckEvent
1285  039d 85            	popw	x
1286  039e 4d            	tnz	a
1287  039f 27f2          	jreq	L545
1288                     ; 281 	I2C_Send7bitAddress(I2C1, SwAddr, I2C_Direction_Receiver);
1290  03a1 4b01          	push	#1
1291  03a3 7b02          	ld	a,(OFST+2,sp)
1292  03a5 88            	push	a
1293  03a6 ae5210        	ldw	x,#21008
1294  03a9 cd0000        	call	_I2C_Send7bitAddress
1296  03ac 85            	popw	x
1298  03ad               L355:
1299                     ; 284   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
1301  03ad ae0302        	ldw	x,#770
1302  03b0 89            	pushw	x
1303  03b1 ae5210        	ldw	x,#21008
1304  03b4 cd0000        	call	_I2C_CheckEvent
1306  03b7 85            	popw	x
1307  03b8 4d            	tnz	a
1308  03b9 27f2          	jreq	L355
1310  03bb               L165:
1311                     ; 291   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED)) 
1313  03bb ae0340        	ldw	x,#832
1314  03be 89            	pushw	x
1315  03bf ae5210        	ldw	x,#21008
1316  03c2 cd0000        	call	_I2C_CheckEvent
1318  03c5 85            	popw	x
1319  03c6 4d            	tnz	a
1320  03c7 27f2          	jreq	L165
1321                     ; 294 	Switch-> status = I2C_ReceiveData(I2C1); //meanwhile the slave send the second byte
1323  03c9 ae5210        	ldw	x,#21008
1324  03cc cd0000        	call	_I2C_ReceiveData
1326  03cf 1e04          	ldw	x,(OFST+4,sp)
1327  03d1 e704          	ld	(4,x),a
1328                     ; 296 }
1331  03d3 84            	pop	a
1332  03d4 81            	ret
1366                     ; 298 void sw_on(uint8_t SwAddr)
1366                     ; 299 {
1367                     	switch	.text
1368  03d5               _sw_on:
1372                     ; 300 	switch(SwAddr)
1375                     ; 307 			break;
1376  03d5 a080          	sub	a,#128
1377  03d7 2706          	jreq	L565
1378  03d9 a002          	sub	a,#2
1379  03db 2708          	jreq	L765
1380  03dd 200a          	jra	L116
1381  03df               L565:
1382                     ; 302 		case SW1_ADDRESS:
1382                     ; 303 			setBit(GPIOB->ODR, 1);
1384  03df 72125005      	bset	20485,#1
1385                     ; 304 			break;
1387  03e3 2004          	jra	L116
1388  03e5               L765:
1389                     ; 305 		case SW2_ADDRESS:
1389                     ; 306 			setBit(GPIOB->ODR, 1);
1391  03e5 72125005      	bset	20485,#1
1392                     ; 307 			break;
1394  03e9               L116:
1395                     ; 309 }
1398  03e9 81            	ret
1432                     ; 310 void sw_off(uint8_t SwAddr)
1432                     ; 311 {
1433                     	switch	.text
1434  03ea               _sw_off:
1438                     ; 312 	switch(SwAddr)
1441                     ; 319 			break;
1442  03ea a080          	sub	a,#128
1443  03ec 2706          	jreq	L316
1444  03ee a002          	sub	a,#2
1445  03f0 2708          	jreq	L516
1446  03f2 200a          	jra	L736
1447  03f4               L316:
1448                     ; 314 		case SW1_ADDRESS:
1448                     ; 315 			clearBit(GPIOB->ODR, 0);
1450  03f4 72115005      	bres	20485,#0
1451                     ; 316 			break;
1453  03f8 2004          	jra	L736
1454  03fa               L516:
1455                     ; 317 		case SW2_ADDRESS:
1455                     ; 318 			clearBit(GPIOB->ODR, 0);
1457  03fa 72115005      	bres	20485,#0
1458                     ; 319 			break;
1460  03fe               L736:
1461                     ; 321 }
1464  03fe 81            	ret
1477                     	xdef	_sw_off
1478                     	xdef	_sw_on
1479                     	xdef	_sw_ReadStatus
1480                     	xdef	_sw_ReadVoltage
1481                     	xdef	_sw_ReadCurrent
1482                     	xdef	_sw_ReadVoltCurr
1483                     	xdef	_sw_WriteExtCmdByte
1484                     	xdef	_sw_WriteCmdByte
1485                     	xdef	_sw_QuickCmd
1486                     	xdef	_sw_Init
1487                     	xdef	_sw_DeInit
1488                     	xref	_I2C_LowLevel_Init
1489                     	xref	_I2C_LowLevel_DeInit
1490                     	xref	_I2C_GetFlagStatus
1491                     	xref	_I2C_CheckEvent
1492                     	xref	_I2C_DMACmd
1493                     	xref	_I2C_ReceiveData
1494                     	xref	_I2C_SendData
1495                     	xref	_I2C_Send7bitAddress
1496                     	xref	_I2C_AcknowledgeConfig
1497                     	xref	_I2C_GenerateSTOP
1498                     	xref	_I2C_GenerateSTART
1499                     	xref	_I2C_Cmd
1500                     	xref	_I2C_Init
1501                     .const:	section	.text
1502  0000               L133:
1503  0000 3cd3ae14      	dc.w	15571,-20972
1504  0004               L123:
1505  0004 3ad4cccc      	dc.w	15060,-13108
1506                     	xref.b	c_x
1526                     	xref	c_ftoi
1527                     	xref	c_fmul
1528                     	xref	c_itof
1529                     	end
