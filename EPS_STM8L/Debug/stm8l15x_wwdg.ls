   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  63                     ; 119 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  63                     ; 120 {
  65                     	switch	.text
  66  0000               _WWDG_Init:
  68  0000 89            	pushw	x
  69       00000000      OFST:	set	0
  72                     ; 122   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  74                     ; 124   WWDG->WR = WWDG_WR_RESET_VALUE;
  76  0001 357f50d4      	mov	20692,#127
  77                     ; 125   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  79  0005 9e            	ld	a,xh
  80  0006 aa80          	or	a,#128
  81  0008 c750d3        	ld	20691,a
  82                     ; 126   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
  84  000b 7b02          	ld	a,(OFST+2,sp)
  85  000d a47f          	and	a,#127
  86  000f c750d4        	ld	20692,a
  87                     ; 127 }
  90  0012 85            	popw	x
  91  0013 81            	ret
 135                     ; 135 void WWDG_SetWindowValue(uint8_t WindowValue)
 135                     ; 136 {
 136                     	switch	.text
 137  0014               _WWDG_SetWindowValue:
 139  0014 88            	push	a
 140       00000001      OFST:	set	1
 143                     ; 137   __IO uint8_t tmpreg = 0;
 145  0015 0f01          	clr	(OFST+0,sp)
 146                     ; 140   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
 148                     ; 143   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
 150  0017 a47f          	and	a,#127
 151  0019 1a01          	or	a,(OFST+0,sp)
 152  001b 6b01          	ld	(OFST+0,sp),a
 153                     ; 146   WWDG->WR = tmpreg;
 155  001d 7b01          	ld	a,(OFST+0,sp)
 156  001f c750d4        	ld	20692,a
 157                     ; 147 }
 160  0022 84            	pop	a
 161  0023 81            	ret
 195                     ; 156 void WWDG_SetCounter(uint8_t Counter)
 195                     ; 157 {
 196                     	switch	.text
 197  0024               _WWDG_SetCounter:
 201                     ; 159   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 203                     ; 163   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 205  0024 a47f          	and	a,#127
 206  0026 c750d3        	ld	20691,a
 207                     ; 164 }
 210  0029 81            	ret
 244                     ; 187 void WWDG_Enable(uint8_t Counter)
 244                     ; 188 {
 245                     	switch	.text
 246  002a               _WWDG_Enable:
 250                     ; 190   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 252                     ; 191   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
 254  002a aa80          	or	a,#128
 255  002c c750d3        	ld	20691,a
 256                     ; 192 }
 259  002f 81            	ret
 282                     ; 216 uint8_t WWDG_GetCounter(void)
 282                     ; 217 {
 283                     	switch	.text
 284  0030               _WWDG_GetCounter:
 288                     ; 218   return(WWDG->CR);
 290  0030 c650d3        	ld	a,20691
 293  0033 81            	ret
 316                     ; 226 void WWDG_SWReset(void)
 316                     ; 227 {
 317                     	switch	.text
 318  0034               _WWDG_SWReset:
 322                     ; 228   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 324  0034 358050d3      	mov	20691,#128
 325                     ; 229 }
 328  0038 81            	ret
 341                     	xdef	_WWDG_SWReset
 342                     	xdef	_WWDG_GetCounter
 343                     	xdef	_WWDG_Enable
 344                     	xdef	_WWDG_SetCounter
 345                     	xdef	_WWDG_SetWindowValue
 346                     	xdef	_WWDG_Init
 365                     	end
