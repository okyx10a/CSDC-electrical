#include "spi.h"

void LowLevel_DeInit(void)
{
  SPI_Cmd(SPI, DISABLE); /*!< SPI disable */

  /*!< SPI Periph clock disable */
  CLK_PeripheralClockConfig(SPI_CLK, DISABLE);

  /*!< Configure SPI pins: SCK */
  GPIO_Init(SPI_SCK_GPIO_PORT, SPI_SCK_PIN, GPIO_Mode_In_FL_No_IT);

  /*!< Configure SPI pins: MISO */
  GPIO_Init(SPI_MISO_GPIO_PORT, SPI_MISO_PIN, GPIO_Mode_In_FL_No_IT);

  /*!< Configure SPI pins: MOSI */
  GPIO_Init(SPI_MOSI_GPIO_PORT, SPI_MOSI_PIN, GPIO_Mode_In_FL_No_IT);

  /*!< Configure SPI_CS_PIN pin: SD Card CS pin */
  GPIO_Init(CS_GPIO_PORT, CS_PIN, GPIO_Mode_In_FL_No_IT);

  /*!< Configure SPI_DETECT_PIN pin: SD Card detect pin */
  GPIO_Init(DETECT_GPIO_PORT, DETECT_PIN, GPIO_Mode_In_FL_No_IT);
}

/**
  * @brief  Initializes the SPI and CS pins.
  * @param  None
  * @retval None
  */
void LowLevel_Init(void)
{
  /* Enable SPI clock */
  CLK_PeripheralClockConfig(SPI_CLK, ENABLE);

  /* Set the MOSI,MISO and SCK at high level */
  GPIO_ExternalPullUpConfig(SPI_SCK_GPIO_PORT, SPI_MISO_PIN | SPI_MOSI_PIN | \
                            SPI_SCK_PIN, ENABLE);

  /* SPI2 pin remap on Port I*/
  SYSCFG_REMAPPinConfig(REMAP_Pin_SPI2Full, ENABLE);

  /* SPI Config */
  SPI_Init(SPI, SPI_FirstBit_MSB, SPI_BaudRatePrescaler_4, SPI_Mode_Master,
           SPI_CPOL_High, SPI_CPHA_2Edge, SPI_Direction_2Lines_FullDuplex,
           SPI_NSS_Soft, 0x07);


  /* SPI enable */
  SPI_Cmd(SPI, ENABLE);

  /* Configure the Detect pin */
  GPIO_Init(DETECT_GPIO_PORT, DETECT_PIN, GPIO_Mode_In_PU_No_IT);

  /* Set MSD ChipSelect pin in Output push-pull high level */
  GPIO_Init(CS_GPIO_PORT, CS_PIN, GPIO_Mode_Out_PP_High_Slow);
}