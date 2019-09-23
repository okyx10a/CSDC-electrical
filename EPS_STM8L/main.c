/* MAIN.C file
 * 
 * Copyright (c) 2002-2005 STMicroelectronics
 */


#include "sw.h"

void main(void)
{
	sw_QuickCmd(SW1_ADDRESS);
	sw_QuickCmd(SW2_ADDRESS);
	while (1)
	{
		
	}
}

