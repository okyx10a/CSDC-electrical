   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.2 - 02 Nov 2011
   3                     ; Generator (Limited) V4.3.7 - 29 Nov 2011
  78                     ; 128 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  78                     ; 129 {
  80                     	switch	.text
  81  0000               _IWDG_WriteAccessCmd:
  85                     ; 131   assert_param(IS_IWDG_WRITE_ACCESS_MODE(IWDG_WriteAccess));
  87                     ; 132   IWDG->KR = IWDG_WriteAccess; /* Write Access */
  89  0000 c750e0        	ld	20704,a
  90                     ; 133 }
  93  0003 81            	ret
 183                     ; 148 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 183                     ; 149 {
 184                     	switch	.text
 185  0004               _IWDG_SetPrescaler:
 189                     ; 151   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
 191                     ; 152   IWDG->PR = IWDG_Prescaler;
 193  0004 c750e1        	ld	20705,a
 194                     ; 153 }
 197  0007 81            	ret
 231                     ; 162 void IWDG_SetReload(uint8_t IWDG_Reload)
 231                     ; 163 {
 232                     	switch	.text
 233  0008               _IWDG_SetReload:
 237                     ; 164   IWDG->RLR = IWDG_Reload;
 239  0008 c750e2        	ld	20706,a
 240                     ; 165 }
 243  000b 81            	ret
 266                     ; 173 void IWDG_ReloadCounter(void)
 266                     ; 174 {
 267                     	switch	.text
 268  000c               _IWDG_ReloadCounter:
 272                     ; 175   IWDG->KR = IWDG_KEY_REFRESH;
 274  000c 35aa50e0      	mov	20704,#170
 275                     ; 176 }
 278  0010 81            	ret
 301                     ; 199 void IWDG_Enable(void)
 301                     ; 200 {
 302                     	switch	.text
 303  0011               _IWDG_Enable:
 307                     ; 201   IWDG->KR = IWDG_KEY_ENABLE;
 309  0011 35cc50e0      	mov	20704,#204
 310                     ; 202 }
 313  0015 81            	ret
 326                     	xdef	_IWDG_Enable
 327                     	xdef	_IWDG_ReloadCounter
 328                     	xdef	_IWDG_SetReload
 329                     	xdef	_IWDG_SetPrescaler
 330                     	xdef	_IWDG_WriteAccessCmd
 349                     	end
