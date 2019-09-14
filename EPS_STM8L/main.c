/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */


#include "sw.h"

void main(void)
{
	sw_QuickCmd(I2C_SW1_ADDRESS);
	sw_QuickCmd(I2C_SW2_ADDRESS);
	while (1)
	{
		
	}
}

