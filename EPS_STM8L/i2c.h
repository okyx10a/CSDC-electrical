/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __I2C_H
#define __I2C_H

//include section

#include "stm8l15x.h"

#define OWN_ADDR							 				0xA0 //stm8's own address when acting as a master

/* Defintions for the state of the DMA transfer */   
#define STATE_READY         	 				0
#define STATE_BUSY          	 				1

/* Maximum timeout value for counting before exiting waiting loop on DMA 
   Trasnfer Complete. This value depends directly on the maximum page size and
   the sytem clock frequency. */
#define TIMEOUT_MAX         	 				0x10000

//i2c peripheral config
#define I2C                    				I2C1
#define I2C_CLK                      	CLK_Peripheral_I2C1
#define I2C_SCL_PIN                  	GPIO_Pin_1                  /* PC.01 */
#define I2C_SCL_GPIO_PORT            	GPIOC                       /* GPIOC */
#define I2C_SDA_PIN                  	GPIO_Pin_0                  /* PC.00 */
#define I2C_SDA_GPIO_PORT            	GPIOC                       /* GPIOC */

//i2c DMA config
#define I2C_DMA                      	DMA1
#define I2C_DMA_CHANNEL_TX           	DMA1_Channel3
#define I2C_DMA_CHANNEL_RX           	DMA1_Channel0
#define I2C_DMA_FLAG_TX_TC           	DMA1_FLAG_TC3
#define I2C_DMA_FLAG_RX_TC           	DMA1_FLAG_TC0
#define I2C_DR_Address               	((uint16_t)0x005216) //this address is related to DMA
#define USE_DMA

//macro config
#define DIRECTION_TX                 	0
#define DIRECTION_RX                 	1


//function prototypes
void I2C_LowLevel_DeInit(void);
void I2C_LowLevel_Init(void);
void I2C_LowLevel_DMAConfig(uint16_t pBuffer, uint8_t BufferSize, uint16_t Direction);
void I2C_DMA_RX_IRQHandler(void);
void I2C_DMA_TX_IRQHandler(void);

#endif