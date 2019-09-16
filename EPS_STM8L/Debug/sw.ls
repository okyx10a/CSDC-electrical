   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  44                     ; 7 void sw_DeInit(void)
  44                     ; 8 {
  46                     	switch	.text
  47  0000               _sw_DeInit:
  51                     ; 9 	I2C_LowLevel_DeInit();
  53  0000 cd0000        	call	_I2C_LowLevel_DeInit
  55                     ; 10 }
  58  0003 81            	ret
  85                     ; 12 void sw_Init(void)
  85                     ; 13 {
  86                     	switch	.text
  87  0004               _sw_Init:
  91                     ; 14   I2C_LowLevel_Init();
  93  0004 cd0000        	call	_I2C_LowLevel_Init
  95                     ; 18   I2C_Cmd(I2C, ENABLE);
  97  0007 4b01          	push	#1
  98  0009 ae5210        	ldw	x,#21008
  99  000c cd0000        	call	_I2C_Cmd
 101  000f 84            	pop	a
 102                     ; 20   I2C_Init(I2C, I2C_SPEED, OWN_ADDR, I2C_Mode_I2C, I2C_DutyCycle_2,
 102                     ; 21            I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);
 104  0010 4b00          	push	#0
 105  0012 4b04          	push	#4
 106  0014 4b00          	push	#0
 107  0016 4b00          	push	#0
 108  0018 ae00a0        	ldw	x,#160
 109  001b 89            	pushw	x
 110  001c ae0d40        	ldw	x,#3392
 111  001f 89            	pushw	x
 112  0020 ae0003        	ldw	x,#3
 113  0023 89            	pushw	x
 114  0024 ae5210        	ldw	x,#21008
 115  0027 cd0000        	call	_I2C_Init
 117  002a 5b0a          	addw	sp,#10
 118                     ; 24   I2C_DMACmd(I2C, ENABLE);
 120  002c 4b01          	push	#1
 121  002e ae5210        	ldw	x,#21008
 122  0031 cd0000        	call	_I2C_DMACmd
 124  0034 84            	pop	a
 125                     ; 25 }
 128  0035 81            	ret
 166                     ; 27 void sw_QuickCmd(uint8_t slave_addr)
 166                     ; 28 {
 167                     	switch	.text
 168  0036               _sw_QuickCmd:
 170  0036 88            	push	a
 171       00000000      OFST:	set	0
 174                     ; 29 	I2C_GenerateSTART(I2C1, ENABLE);
 176  0037 4b01          	push	#1
 177  0039 ae5210        	ldw	x,#21008
 178  003c cd0000        	call	_I2C_GenerateSTART
 180  003f 84            	pop	a
 182  0040               L15:
 183                     ; 32   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 185  0040 ae0301        	ldw	x,#769
 186  0043 89            	pushw	x
 187  0044 ae5210        	ldw	x,#21008
 188  0047 cd0000        	call	_I2C_CheckEvent
 190  004a 85            	popw	x
 191  004b 4d            	tnz	a
 192  004c 27f2          	jreq	L15
 193                     ; 36   I2C_Send7bitAddress(I2C1, slave_addr, I2C_Direction_Transmitter);
 196  004e 4b00          	push	#0
 197  0050 7b02          	ld	a,(OFST+2,sp)
 198  0052 88            	push	a
 199  0053 ae5210        	ldw	x,#21008
 200  0056 cd0000        	call	_I2C_Send7bitAddress
 202  0059 85            	popw	x
 204  005a               L75:
 205                     ; 39   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 207  005a ae0782        	ldw	x,#1922
 208  005d 89            	pushw	x
 209  005e ae5210        	ldw	x,#21008
 210  0061 cd0000        	call	_I2C_CheckEvent
 212  0064 85            	popw	x
 213  0065 4d            	tnz	a
 214  0066 27f2          	jreq	L75
 215                     ; 43   I2C_GenerateSTOP(I2C1, ENABLE);
 217  0068 4b01          	push	#1
 218  006a ae5210        	ldw	x,#21008
 219  006d cd0000        	call	_I2C_GenerateSTOP
 221  0070 84            	pop	a
 222                     ; 44 }
 225  0071 84            	pop	a
 226  0072 81            	ret
 274                     ; 46 void sw_WriteCmdByte(uint8_t SwAddr, uint8_t Cmd)
 274                     ; 47 {
 275                     	switch	.text
 276  0073               _sw_WriteCmdByte:
 278  0073 89            	pushw	x
 279       00000000      OFST:	set	0
 282                     ; 48 	I2C_GenerateSTART(I2C1, ENABLE); //sending start condition
 284  0074 4b01          	push	#1
 285  0076 ae5210        	ldw	x,#21008
 286  0079 cd0000        	call	_I2C_GenerateSTART
 288  007c 84            	pop	a
 290  007d               L701:
 291                     ; 52 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 293  007d ae0301        	ldw	x,#769
 294  0080 89            	pushw	x
 295  0081 ae5210        	ldw	x,#21008
 296  0084 cd0000        	call	_I2C_CheckEvent
 298  0087 85            	popw	x
 299  0088 4d            	tnz	a
 300  0089 27f2          	jreq	L701
 301                     ; 57 	I2C_Send7bitAddress(I2C1, SwAddr, I2C_Direction_Transmitter);
 303  008b 4b00          	push	#0
 304  008d 7b02          	ld	a,(OFST+2,sp)
 305  008f 88            	push	a
 306  0090 ae5210        	ldw	x,#21008
 307  0093 cd0000        	call	_I2C_Send7bitAddress
 309  0096 85            	popw	x
 311  0097               L511:
 312                     ; 61 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 314  0097 ae0782        	ldw	x,#1922
 315  009a 89            	pushw	x
 316  009b ae5210        	ldw	x,#21008
 317  009e cd0000        	call	_I2C_CheckEvent
 319  00a1 85            	popw	x
 320  00a2 4d            	tnz	a
 321  00a3 27f2          	jreq	L511
 322                     ; 66 	I2C_SendData(I2C1, Cmd);
 324  00a5 7b02          	ld	a,(OFST+2,sp)
 325  00a7 88            	push	a
 326  00a8 ae5210        	ldw	x,#21008
 327  00ab cd0000        	call	_I2C_SendData
 329  00ae 84            	pop	a
 331  00af               L321:
 332                     ; 69 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED))
 334  00af ae0784        	ldw	x,#1924
 335  00b2 89            	pushw	x
 336  00b3 ae5210        	ldw	x,#21008
 337  00b6 cd0000        	call	_I2C_CheckEvent
 339  00b9 85            	popw	x
 340  00ba 4d            	tnz	a
 341  00bb 27f2          	jreq	L321
 342                     ; 74 	I2C_GenerateSTOP(I2C1, ENABLE);
 344  00bd 4b01          	push	#1
 345  00bf ae5210        	ldw	x,#21008
 346  00c2 cd0000        	call	_I2C_GenerateSTOP
 348  00c5 84            	pop	a
 349                     ; 75 }
 352  00c6 85            	popw	x
 353  00c7 81            	ret
 410                     ; 77 void sw_WriteExtCmdByte(uint8_t SwAddr, uint8_t RegAddr, uint8_t ExtCmd)
 410                     ; 78 {
 411                     	switch	.text
 412  00c8               _sw_WriteExtCmdByte:
 414  00c8 89            	pushw	x
 415       00000000      OFST:	set	0
 418                     ; 79 	I2C_GenerateSTART(I2C1, ENABLE); //sending start condition
 420  00c9 4b01          	push	#1
 421  00cb ae5210        	ldw	x,#21008
 422  00ce cd0000        	call	_I2C_GenerateSTART
 424  00d1 84            	pop	a
 426  00d2               L751:
 427                     ; 83 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 429  00d2 ae0301        	ldw	x,#769
 430  00d5 89            	pushw	x
 431  00d6 ae5210        	ldw	x,#21008
 432  00d9 cd0000        	call	_I2C_CheckEvent
 434  00dc 85            	popw	x
 435  00dd 4d            	tnz	a
 436  00de 27f2          	jreq	L751
 437                     ; 88 	I2C_Send7bitAddress(I2C1, SwAddr, I2C_Direction_Transmitter);
 439  00e0 4b00          	push	#0
 440  00e2 7b02          	ld	a,(OFST+2,sp)
 441  00e4 88            	push	a
 442  00e5 ae5210        	ldw	x,#21008
 443  00e8 cd0000        	call	_I2C_Send7bitAddress
 445  00eb 85            	popw	x
 447  00ec               L561:
 448                     ; 92 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
 450  00ec ae0782        	ldw	x,#1922
 451  00ef 89            	pushw	x
 452  00f0 ae5210        	ldw	x,#21008
 453  00f3 cd0000        	call	_I2C_CheckEvent
 455  00f6 85            	popw	x
 456  00f7 4d            	tnz	a
 457  00f8 27f2          	jreq	L561
 458                     ; 98 	I2C_SendData(I2C1, RegAddr);
 460  00fa 7b02          	ld	a,(OFST+2,sp)
 461  00fc 88            	push	a
 462  00fd ae5210        	ldw	x,#21008
 463  0100 cd0000        	call	_I2C_SendData
 465  0103 84            	pop	a
 467  0104               L371:
 468                     ; 101 	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED))
 470  0104 ae0784        	ldw	x,#1924
 471  0107 89            	pushw	x
 472  0108 ae5210        	ldw	x,#21008
 473  010b cd0000        	call	_I2C_CheckEvent
 475  010e 85            	popw	x
 476  010f 4d            	tnz	a
 477  0110 27f2          	jreq	L371
 478                     ; 106 	I2C_SendData(I2C1, ExtCmd);
 480  0112 7b05          	ld	a,(OFST+5,sp)
 481  0114 88            	push	a
 482  0115 ae5210        	ldw	x,#21008
 483  0118 cd0000        	call	_I2C_SendData
 485  011b 84            	pop	a
 487  011c               L102:
 488                     ; 110 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED))
 490  011c ae0784        	ldw	x,#1924
 491  011f 89            	pushw	x
 492  0120 ae5210        	ldw	x,#21008
 493  0123 cd0000        	call	_I2C_CheckEvent
 495  0126 85            	popw	x
 496  0127 4d            	tnz	a
 497  0128 27f2          	jreq	L102
 498                     ; 115 	I2C_GenerateSTOP(I2C1, ENABLE);
 500  012a 4b01          	push	#1
 501  012c ae5210        	ldw	x,#21008
 502  012f cd0000        	call	_I2C_GenerateSTOP
 504  0132 84            	pop	a
 505                     ; 116 }
 508  0133 85            	popw	x
 509  0134 81            	ret
 600                     ; 118 void sw_ReadVoltCurr(uint8_t SwAddr, sw_t* Switch)
 600                     ; 119 {
 601                     	switch	.text
 602  0135               _sw_ReadVoltCurr:
 604  0135 88            	push	a
 605  0136 5205          	subw	sp,#5
 606       00000005      OFST:	set	5
 609  0138               L152:
 610                     ; 122   while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
 612  0138 ae0302        	ldw	x,#770
 613  013b 89            	pushw	x
 614  013c ae5210        	ldw	x,#21008
 615  013f cd0000        	call	_I2C_GetFlagStatus
 617  0142 85            	popw	x
 618  0143 4d            	tnz	a
 619  0144 26f2          	jrne	L152
 620                     ; 125 	I2C_GenerateSTART(I2C1, ENABLE); //sending start condition
 622  0146 4b01          	push	#1
 623  0148 ae5210        	ldw	x,#21008
 624  014b cd0000        	call	_I2C_GenerateSTART
 626  014e 84            	pop	a
 628  014f               L752:
 629                     ; 129 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 631  014f ae0301        	ldw	x,#769
 632  0152 89            	pushw	x
 633  0153 ae5210        	ldw	x,#21008
 634  0156 cd0000        	call	_I2C_CheckEvent
 636  0159 85            	popw	x
 637  015a 4d            	tnz	a
 638  015b 27f2          	jreq	L752
 639                     ; 134 	I2C_Send7bitAddress(I2C1, SwAddr, I2C_Direction_Receiver);
 641  015d 4b01          	push	#1
 642  015f 7b07          	ld	a,(OFST+2,sp)
 643  0161 88            	push	a
 644  0162 ae5210        	ldw	x,#21008
 645  0165 cd0000        	call	_I2C_Send7bitAddress
 647  0168 85            	popw	x
 649  0169               L562:
 650                     ; 137   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
 652  0169 ae0302        	ldw	x,#770
 653  016c 89            	pushw	x
 654  016d ae5210        	ldw	x,#21008
 655  0170 cd0000        	call	_I2C_CheckEvent
 657  0173 85            	popw	x
 658  0174 4d            	tnz	a
 659  0175 27f2          	jreq	L562
 661  0177               L372:
 662                     ; 144   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED)) 
 664  0177 ae0340        	ldw	x,#832
 665  017a 89            	pushw	x
 666  017b ae5210        	ldw	x,#21008
 667  017e cd0000        	call	_I2C_CheckEvent
 669  0181 85            	popw	x
 670  0182 4d            	tnz	a
 671  0183 27f2          	jreq	L372
 672                     ; 147 	buffer[0] = I2C_ReceiveData(I2C1); //meanwhile the slave send the second byte
 674  0185 ae5210        	ldw	x,#21008
 675  0188 cd0000        	call	_I2C_ReceiveData
 677  018b 6b03          	ld	(OFST-2,sp),a
 679  018d               L303:
 680                     ; 151   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED)) 
 682  018d ae0340        	ldw	x,#832
 683  0190 89            	pushw	x
 684  0191 ae5210        	ldw	x,#21008
 685  0194 cd0000        	call	_I2C_CheckEvent
 687  0197 85            	popw	x
 688  0198 4d            	tnz	a
 689  0199 27f2          	jreq	L303
 690                     ; 154 	buffer[1] = I2C_ReceiveData(I2C1); //meanwhile the slave send the third byte
 692  019b ae5210        	ldw	x,#21008
 693  019e cd0000        	call	_I2C_ReceiveData
 695  01a1 6b04          	ld	(OFST-1,sp),a
 696                     ; 157   I2C_AcknowledgeConfig(I2C1, DISABLE);
 698  01a3 4b00          	push	#0
 699  01a5 ae5210        	ldw	x,#21008
 700  01a8 cd0000        	call	_I2C_AcknowledgeConfig
 702  01ab 84            	pop	a
 703                     ; 160   I2C_GenerateSTOP(I2C1, ENABLE);
 705  01ac 4b01          	push	#1
 706  01ae ae5210        	ldw	x,#21008
 707  01b1 cd0000        	call	_I2C_GenerateSTOP
 709  01b4 84            	pop	a
 711  01b5               L113:
 712                     ; 164   while (I2C_GetFlagStatus(I2C1, I2C_FLAG_RXNE) == RESET)
 714  01b5 ae0140        	ldw	x,#320
 715  01b8 89            	pushw	x
 716  01b9 ae5210        	ldw	x,#21008
 717  01bc cd0000        	call	_I2C_GetFlagStatus
 719  01bf 85            	popw	x
 720  01c0 4d            	tnz	a
 721  01c1 27f2          	jreq	L113
 722                     ; 167 	buffer[2] = I2C_ReceiveData(I2C1);// receieve the third bit
 724  01c3 ae5210        	ldw	x,#21008
 725  01c6 cd0000        	call	_I2C_ReceiveData
 727  01c9 6b05          	ld	(OFST+0,sp),a
 728                     ; 169 	Switch->voltage = (6.65/4096)*(buffer[0]<<4|buffer[2]>>4);//in unit V
 730  01cb 1e09          	ldw	x,(OFST+4,sp)
 731  01cd 89            	pushw	x
 732  01ce 7b07          	ld	a,(OFST+2,sp)
 733  01d0 4e            	swap	a
 734  01d1 a40f          	and	a,#15
 735  01d3 5f            	clrw	x
 736  01d4 97            	ld	xl,a
 737  01d5 1f03          	ldw	(OFST-2,sp),x
 738  01d7 7b05          	ld	a,(OFST+0,sp)
 739  01d9 97            	ld	xl,a
 740  01da a610          	ld	a,#16
 741  01dc 42            	mul	x,a
 742  01dd 01            	rrwa	x,a
 743  01de 1a04          	or	a,(OFST-1,sp)
 744  01e0 41            	exg	a,xl
 745  01e1 1a03          	or	a,(OFST-2,sp)
 746  01e3 41            	exg	a,xl
 747  01e4 02            	rlwa	x,a
 748  01e5 cd0000        	call	c_itof
 750  01e8 ae0004        	ldw	x,#L123
 751  01eb cd0000        	call	c_fmul
 753  01ee cd0000        	call	c_ftoi
 755  01f1 9085          	popw	y
 756  01f3 90ff          	ldw	(y),x
 757                     ; 170 	Switch->current = (105.84/4096)*(buffer[1]<<4|buffer[2]&0b1111);// in unit mA
 759  01f5 1e09          	ldw	x,(OFST+4,sp)
 760  01f7 89            	pushw	x
 761  01f8 7b07          	ld	a,(OFST+2,sp)
 762  01fa a40f          	and	a,#15
 763  01fc 6b04          	ld	(OFST-1,sp),a
 764  01fe 7b06          	ld	a,(OFST+1,sp)
 765  0200 97            	ld	xl,a
 766  0201 a610          	ld	a,#16
 767  0203 42            	mul	x,a
 768  0204 01            	rrwa	x,a
 769  0205 1a04          	or	a,(OFST-1,sp)
 770  0207 02            	rlwa	x,a
 771  0208 cd0000        	call	c_itof
 773  020b ae0000        	ldw	x,#L133
 774  020e cd0000        	call	c_fmul
 776  0211 cd0000        	call	c_ftoi
 778  0214 9085          	popw	y
 779  0216 90ef02        	ldw	(2,y),x
 780                     ; 171 }
 783  0219 5b06          	addw	sp,#6
 784  021b 81            	ret
 847                     ; 173 void sw_ReadCurrent(uint8_t SwAddr, sw_t* Switch)
 847                     ; 174 {
 848                     	switch	.text
 849  021c               _sw_ReadCurrent:
 851  021c 88            	push	a
 852  021d 5204          	subw	sp,#4
 853       00000004      OFST:	set	4
 856  021f               L763:
 857                     ; 177   while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
 859  021f ae0302        	ldw	x,#770
 860  0222 89            	pushw	x
 861  0223 ae5210        	ldw	x,#21008
 862  0226 cd0000        	call	_I2C_GetFlagStatus
 864  0229 85            	popw	x
 865  022a 4d            	tnz	a
 866  022b 26f2          	jrne	L763
 867                     ; 180 	I2C_GenerateSTART(I2C1, ENABLE); //sending start condition
 869  022d 4b01          	push	#1
 870  022f ae5210        	ldw	x,#21008
 871  0232 cd0000        	call	_I2C_GenerateSTART
 873  0235 84            	pop	a
 875  0236               L573:
 876                     ; 184 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
 878  0236 ae0301        	ldw	x,#769
 879  0239 89            	pushw	x
 880  023a ae5210        	ldw	x,#21008
 881  023d cd0000        	call	_I2C_CheckEvent
 883  0240 85            	popw	x
 884  0241 4d            	tnz	a
 885  0242 27f2          	jreq	L573
 886                     ; 189 	I2C_Send7bitAddress(I2C1, SwAddr, I2C_Direction_Receiver);
 888  0244 4b01          	push	#1
 889  0246 7b06          	ld	a,(OFST+2,sp)
 890  0248 88            	push	a
 891  0249 ae5210        	ldw	x,#21008
 892  024c cd0000        	call	_I2C_Send7bitAddress
 894  024f 85            	popw	x
 896  0250               L304:
 897                     ; 192   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
 899  0250 ae0302        	ldw	x,#770
 900  0253 89            	pushw	x
 901  0254 ae5210        	ldw	x,#21008
 902  0257 cd0000        	call	_I2C_CheckEvent
 904  025a 85            	popw	x
 905  025b 4d            	tnz	a
 906  025c 27f2          	jreq	L304
 908  025e               L114:
 909                     ; 199   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED)) 
 911  025e ae0340        	ldw	x,#832
 912  0261 89            	pushw	x
 913  0262 ae5210        	ldw	x,#21008
 914  0265 cd0000        	call	_I2C_CheckEvent
 916  0268 85            	popw	x
 917  0269 4d            	tnz	a
 918  026a 27f2          	jreq	L114
 919                     ; 202 	buffer[0] = I2C_ReceiveData(I2C1); //meanwhile the slave send the second byte
 921  026c ae5210        	ldw	x,#21008
 922  026f cd0000        	call	_I2C_ReceiveData
 924  0272 6b03          	ld	(OFST-1,sp),a
 925                     ; 205   I2C_AcknowledgeConfig(I2C1, DISABLE);
 927  0274 4b00          	push	#0
 928  0276 ae5210        	ldw	x,#21008
 929  0279 cd0000        	call	_I2C_AcknowledgeConfig
 931  027c 84            	pop	a
 932                     ; 208   I2C_GenerateSTOP(I2C1, ENABLE);
 934  027d 4b01          	push	#1
 935  027f ae5210        	ldw	x,#21008
 936  0282 cd0000        	call	_I2C_GenerateSTOP
 938  0285 84            	pop	a
 940  0286               L714:
 941                     ; 212   while (I2C_GetFlagStatus(I2C1, I2C_FLAG_RXNE) == RESET)
 943  0286 ae0140        	ldw	x,#320
 944  0289 89            	pushw	x
 945  028a ae5210        	ldw	x,#21008
 946  028d cd0000        	call	_I2C_GetFlagStatus
 948  0290 85            	popw	x
 949  0291 4d            	tnz	a
 950  0292 27f2          	jreq	L714
 951                     ; 215 	buffer[2] = I2C_ReceiveData(I2C1);
 953  0294 ae5210        	ldw	x,#21008
 954  0297 cd0000        	call	_I2C_ReceiveData
 956  029a 6b05          	ld	(OFST+1,sp),a
 957                     ; 217 	Switch->current = (105.84/4096)*(buffer[0]<<4|buffer[1]>>4);// in unit mA
 959  029c 1e08          	ldw	x,(OFST+4,sp)
 960  029e 89            	pushw	x
 961  029f 7b06          	ld	a,(OFST+2,sp)
 962  02a1 4e            	swap	a
 963  02a2 a40f          	and	a,#15
 964  02a4 5f            	clrw	x
 965  02a5 97            	ld	xl,a
 966  02a6 1f03          	ldw	(OFST-1,sp),x
 967  02a8 7b05          	ld	a,(OFST+1,sp)
 968  02aa 97            	ld	xl,a
 969  02ab a610          	ld	a,#16
 970  02ad 42            	mul	x,a
 971  02ae 01            	rrwa	x,a
 972  02af 1a04          	or	a,(OFST+0,sp)
 973  02b1 41            	exg	a,xl
 974  02b2 1a03          	or	a,(OFST-1,sp)
 975  02b4 41            	exg	a,xl
 976  02b5 02            	rlwa	x,a
 977  02b6 cd0000        	call	c_itof
 979  02b9 ae0000        	ldw	x,#L133
 980  02bc cd0000        	call	c_fmul
 982  02bf cd0000        	call	c_ftoi
 984  02c2 9085          	popw	y
 985  02c4 90ef02        	ldw	(2,y),x
 986                     ; 218 }
 989  02c7 5b05          	addw	sp,#5
 990  02c9 81            	ret
1053                     ; 220 void sw_ReadVoltage(uint8_t SwAddr, sw_t* Switch)
1053                     ; 221 {
1054                     	switch	.text
1055  02ca               _sw_ReadVoltage:
1057  02ca 88            	push	a
1058  02cb 5204          	subw	sp,#4
1059       00000004      OFST:	set	4
1062  02cd               L554:
1063                     ; 224   while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
1065  02cd ae0302        	ldw	x,#770
1066  02d0 89            	pushw	x
1067  02d1 ae5210        	ldw	x,#21008
1068  02d4 cd0000        	call	_I2C_GetFlagStatus
1070  02d7 85            	popw	x
1071  02d8 4d            	tnz	a
1072  02d9 26f2          	jrne	L554
1073                     ; 227 	I2C_GenerateSTART(I2C1, ENABLE); //sending start condition
1075  02db 4b01          	push	#1
1076  02dd ae5210        	ldw	x,#21008
1077  02e0 cd0000        	call	_I2C_GenerateSTART
1079  02e3 84            	pop	a
1081  02e4               L364:
1082                     ; 231 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
1084  02e4 ae0301        	ldw	x,#769
1085  02e7 89            	pushw	x
1086  02e8 ae5210        	ldw	x,#21008
1087  02eb cd0000        	call	_I2C_CheckEvent
1089  02ee 85            	popw	x
1090  02ef 4d            	tnz	a
1091  02f0 27f2          	jreq	L364
1092                     ; 236 	I2C_Send7bitAddress(I2C1, SwAddr, I2C_Direction_Receiver);
1094  02f2 4b01          	push	#1
1095  02f4 7b06          	ld	a,(OFST+2,sp)
1096  02f6 88            	push	a
1097  02f7 ae5210        	ldw	x,#21008
1098  02fa cd0000        	call	_I2C_Send7bitAddress
1100  02fd 85            	popw	x
1102  02fe               L174:
1103                     ; 239   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
1105  02fe ae0302        	ldw	x,#770
1106  0301 89            	pushw	x
1107  0302 ae5210        	ldw	x,#21008
1108  0305 cd0000        	call	_I2C_CheckEvent
1110  0308 85            	popw	x
1111  0309 4d            	tnz	a
1112  030a 27f2          	jreq	L174
1114  030c               L774:
1115                     ; 246   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED)) 
1117  030c ae0340        	ldw	x,#832
1118  030f 89            	pushw	x
1119  0310 ae5210        	ldw	x,#21008
1120  0313 cd0000        	call	_I2C_CheckEvent
1122  0316 85            	popw	x
1123  0317 4d            	tnz	a
1124  0318 27f2          	jreq	L774
1125                     ; 249 	buffer[0] = I2C_ReceiveData(I2C1); //meanwhile the slave send the second byte
1127  031a ae5210        	ldw	x,#21008
1128  031d cd0000        	call	_I2C_ReceiveData
1130  0320 6b03          	ld	(OFST-1,sp),a
1131                     ; 252   I2C_AcknowledgeConfig(I2C1, DISABLE);
1133  0322 4b00          	push	#0
1134  0324 ae5210        	ldw	x,#21008
1135  0327 cd0000        	call	_I2C_AcknowledgeConfig
1137  032a 84            	pop	a
1138                     ; 255   I2C_GenerateSTOP(I2C1, ENABLE);
1140  032b 4b01          	push	#1
1141  032d ae5210        	ldw	x,#21008
1142  0330 cd0000        	call	_I2C_GenerateSTOP
1144  0333 84            	pop	a
1146  0334               L505:
1147                     ; 259   while (I2C_GetFlagStatus(I2C1, I2C_FLAG_RXNE) == RESET)
1149  0334 ae0140        	ldw	x,#320
1150  0337 89            	pushw	x
1151  0338 ae5210        	ldw	x,#21008
1152  033b cd0000        	call	_I2C_GetFlagStatus
1154  033e 85            	popw	x
1155  033f 4d            	tnz	a
1156  0340 27f2          	jreq	L505
1157                     ; 262 	buffer[2] = I2C_ReceiveData(I2C1);
1159  0342 ae5210        	ldw	x,#21008
1160  0345 cd0000        	call	_I2C_ReceiveData
1162  0348 6b05          	ld	(OFST+1,sp),a
1163                     ; 264 	Switch->voltage = (6.65/4096)*(buffer[0]<<4|buffer[1]>>4);// in unit mA
1165  034a 1e08          	ldw	x,(OFST+4,sp)
1166  034c 89            	pushw	x
1167  034d 7b06          	ld	a,(OFST+2,sp)
1168  034f 4e            	swap	a
1169  0350 a40f          	and	a,#15
1170  0352 5f            	clrw	x
1171  0353 97            	ld	xl,a
1172  0354 1f03          	ldw	(OFST-1,sp),x
1173  0356 7b05          	ld	a,(OFST+1,sp)
1174  0358 97            	ld	xl,a
1175  0359 a610          	ld	a,#16
1176  035b 42            	mul	x,a
1177  035c 01            	rrwa	x,a
1178  035d 1a04          	or	a,(OFST+0,sp)
1179  035f 41            	exg	a,xl
1180  0360 1a03          	or	a,(OFST-1,sp)
1181  0362 41            	exg	a,xl
1182  0363 02            	rlwa	x,a
1183  0364 cd0000        	call	c_itof
1185  0367 ae0004        	ldw	x,#L123
1186  036a cd0000        	call	c_fmul
1188  036d cd0000        	call	c_ftoi
1190  0370 9085          	popw	y
1191  0372 90ff          	ldw	(y),x
1192                     ; 265 }
1195  0374 5b05          	addw	sp,#5
1196  0376 81            	ret
1247                     ; 267 void sw_ReadStatus(uint8_t SwAddr, sw_t* Switch)
1247                     ; 268 {
1248                     	switch	.text
1249  0377               _sw_ReadStatus:
1251  0377 88            	push	a
1252       00000000      OFST:	set	0
1255  0378               L735:
1256                     ; 270   while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
1258  0378 ae0302        	ldw	x,#770
1259  037b 89            	pushw	x
1260  037c ae5210        	ldw	x,#21008
1261  037f cd0000        	call	_I2C_GetFlagStatus
1263  0382 85            	popw	x
1264  0383 4d            	tnz	a
1265  0384 26f2          	jrne	L735
1266                     ; 273 	I2C_GenerateSTART(I2C1, ENABLE); //sending start condition
1268  0386 4b01          	push	#1
1269  0388 ae5210        	ldw	x,#21008
1270  038b cd0000        	call	_I2C_GenerateSTART
1272  038e 84            	pop	a
1274  038f               L545:
1275                     ; 277 	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
1277  038f ae0301        	ldw	x,#769
1278  0392 89            	pushw	x
1279  0393 ae5210        	ldw	x,#21008
1280  0396 cd0000        	call	_I2C_CheckEvent
1282  0399 85            	popw	x
1283  039a 4d            	tnz	a
1284  039b 27f2          	jreq	L545
1285                     ; 282 	I2C_Send7bitAddress(I2C1, SwAddr, I2C_Direction_Receiver);
1287  039d 4b01          	push	#1
1288  039f 7b02          	ld	a,(OFST+2,sp)
1289  03a1 88            	push	a
1290  03a2 ae5210        	ldw	x,#21008
1291  03a5 cd0000        	call	_I2C_Send7bitAddress
1293  03a8 85            	popw	x
1295  03a9               L355:
1296                     ; 285   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
1298  03a9 ae0302        	ldw	x,#770
1299  03ac 89            	pushw	x
1300  03ad ae5210        	ldw	x,#21008
1301  03b0 cd0000        	call	_I2C_CheckEvent
1303  03b3 85            	popw	x
1304  03b4 4d            	tnz	a
1305  03b5 27f2          	jreq	L355
1307  03b7               L165:
1308                     ; 292   while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED)) 
1310  03b7 ae0340        	ldw	x,#832
1311  03ba 89            	pushw	x
1312  03bb ae5210        	ldw	x,#21008
1313  03be cd0000        	call	_I2C_CheckEvent
1315  03c1 85            	popw	x
1316  03c2 4d            	tnz	a
1317  03c3 27f2          	jreq	L165
1318                     ; 295 	Switch-> status = I2C_ReceiveData(I2C1); //meanwhile the slave send the second byte
1320  03c5 ae5210        	ldw	x,#21008
1321  03c8 cd0000        	call	_I2C_ReceiveData
1323  03cb 1e04          	ldw	x,(OFST+4,sp)
1324  03cd e704          	ld	(4,x),a
1325                     ; 297 }
1328  03cf 84            	pop	a
1329  03d0 81            	ret
1356                     	switch	.ubsct
1357  0000               _Switch:
1358  0000 000000000000  	ds.b	10
1359                     	xdef	_Switch
1360                     	xdef	_sw_ReadStatus
1361                     	xdef	_sw_ReadVoltage
1362                     	xdef	_sw_ReadCurrent
1363                     	xdef	_sw_ReadVoltCurr
1364                     	xdef	_sw_WriteExtCmdByte
1365                     	xdef	_sw_WriteCmdByte
1366                     	xdef	_sw_QuickCmd
1367                     	xdef	_sw_Init
1368                     	xdef	_sw_DeInit
1369                     	xref	_I2C_LowLevel_Init
1370                     	xref	_I2C_LowLevel_DeInit
1371                     	xref	_I2C_GetFlagStatus
1372                     	xref	_I2C_CheckEvent
1373                     	xref	_I2C_DMACmd
1374                     	xref	_I2C_ReceiveData
1375                     	xref	_I2C_SendData
1376                     	xref	_I2C_Send7bitAddress
1377                     	xref	_I2C_AcknowledgeConfig
1378                     	xref	_I2C_GenerateSTOP
1379                     	xref	_I2C_GenerateSTART
1380                     	xref	_I2C_Cmd
1381                     	xref	_I2C_Init
1382                     .const:	section	.text
1383  0000               L133:
1384  0000 3cd3ae14      	dc.w	15571,-20972
1385  0004               L123:
1386  0004 3ad4cccc      	dc.w	15060,-13108
1387                     	xref.b	c_x
1407                     	xref	c_ftoi
1408                     	xref	c_fmul
1409                     	xref	c_itof
1410                     	end
