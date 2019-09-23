/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __SW_H
#define __SW_H

//include section

#include "i2c.h"

#define SW1_ADDRESS        	0x80
#define SW1_CTRL_PIN				GPIO_Pin_0
#define SW2_ADDRESS        	0x82
#define SW2_CTRL_PIN				GPIO_Pin_1
#define SW_CTRL_PORT        GPIOB
#define SW_I2C_SPEED      	100000 /*!< I2C Speed */
#define I2C_TIMEOUT         (uint32_t)0x3FFFF /*!< I2C Time out */

#define setBit(reg, bit) (reg = reg | (1 << bit))
#define clearBit(reg, bit) (reg = reg & ~(1 << bit))
#define toggleBit(reg, bit) (reg = reg ^ (1 << bit))

typedef struct sw
{
	uint16_t voltage;
	uint16_t current;
	uint8_t  status;
}sw_t;

void sw_DeInit(void);
void sw_Init(void);
void sw_QuickCmd(uint8_t SwAddr);
void sw_WriteCmdByte(uint8_t SwAddr, uint8_t Cmd);
void sw_WriteExtCmdByte(uint8_t SwAddr, uint8_t RegAddr, uint8_t ExtCmd);
void sw_ReadVoltCurr(uint8_t SwAddr, sw_t* Switch);
void sw_ReadCurrent(uint8_t SwAddr, sw_t* Switch);
void sw_ReadVoltage(uint8_t SwAddr, sw_t* Switch);
void sw_ReadStatus(uint8_t SwAddr, sw_t* Switch);
void sw_on(uint8_t SwAddr);//pretending i2c interface
void sw_off(uint8_t SwAddr);
#endif