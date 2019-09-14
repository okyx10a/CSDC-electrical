/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __SW_H
#define __SW_H

//include section

#include "i2c.h"

#define NUM_SW								 2
#define I2C_SW1_ADDRESS        0x80
#define I2C_SW2_ADDRESS        0x82

typedef struct sw
{
	uint16_t voltage;
	uint16_t current;
	uint8_t  status;
}sw_t;

void sw_DeInit(void);
void sw_Init(void);
void sw_QuickCmd(uint8_t SlaveAddr);
void sw_WriteCmdByte(uint8_t SlaveAddr, uint8_t Cmd);
void sw_WriteExtCmdByte(uint8_t SlaveAddr, uint8_t RegAddr, uint8_t Cmd);
void sw_ReadVoltCurr(uint8_t SlaveAddr, sw_t* Switch);
void sw_ReadCurrent(uint8_t SlaveAddr, sw_t* Switch);
void sw_ReadVoltage(uint8_t SlaveAddr, sw_t* Switch);

#endif