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

// Command Byte Operation (used as Cmd parameter of sw_WriteCmdByte() function)
#define V_CONT							0x01
#define V_ONCE							0x02
#define I_CONT							0x04
#define I_ONCE							0x08
#define VRANGE							0x10
#define STATUS_RD						0x40

// Extended Register Addresses (used as RegAddr parameter of sw_WriteExtCmdByte() function)
#define ALERT_EN						0x01
#define ALERT_TH						0x02
#define CONTROL							0x03

// ALERT_EN Register Operations (used as ExtCmd parameter of sw_WriteExtCmdByte() function)
#define EN_ADC_OC1					0x01
#define EN_ADC_OC4					0x02
#define EN_HS_ALERT					0x04
#define EN_OFF_ALERT				0x08
#define CLEAR								0x10

//	ALERT_TH Register Operations (sets the current threshhold for alert)

// CONTROL Register Operations
#define SWOFF								0x01 // may setting this bit to zero can turn the switch back on?

//Status Byte Operations (gained by using sw_ReadStatus() function)
#define ADC_OC							0x01
#define ADC_ALERT						0x02
#define HS_OC								0x04
#define HS_ALERT						0x08
#define OFF_STATUS					0x10
#define OFF_ALERT						0x40


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