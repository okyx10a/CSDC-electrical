/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __SPI_H
#define __SPI_H

//include section

#include "stm8l15x.h"

#define TIMEOUT_MAX         	 				0x10000

//SPI peripheral config
#define SPI                           SPI2
#define SPI_CLK                       CLK_Peripheral_SPI2
#define SPI_SCK_PIN                   GPIO_Pin_1                  /* PI.01 */
#define SPI_SCK_GPIO_PORT             GPIOI                       /* GPIOI */
#define SPI_MISO_PIN                  GPIO_Pin_3                  /* PI.03 */
#define SPI_MISO_GPIO_PORT            GPIOI                       /* GPIOI */
#define SPI_MOSI_PIN                  GPIO_Pin_2                  /* PI.02 */
#define SPI_MOSI_GPIO_PORT            GPIOI                       /* GPIOI */
#define CS_PIN                        GPIO_Pin_7                  /* PG.07 */
#define CS_GPIO_PORT                  GPIOG                       /* GPIOG */
#define DETECT_PIN                    GPIO_Pin_6                  /* PG.06 */
#define DETECT_GPIO_PORT              GPIOG                       /* GPIOG */


void SPI_LowLevel_DeInit(void);
void SPI_LowLevel_Init(void);

#endif