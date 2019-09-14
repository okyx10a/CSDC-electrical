#include "i2c.h"

void I2C_LowLevel_DeInit(void)
{
	/* I2C Peripheral Disable */
  I2C_Cmd(I2C, DISABLE);

  /* I2C DeInit */
  I2C_DeInit(I2C);

  /*!< I2C Periph clock disable */
  CLK_PeripheralClockConfig(I2C_CLK, DISABLE);

  /*!< GPIO configuration */
  /*!< Configure I2C pins: SCL */
  GPIO_Init(I2C_SCL_GPIO_PORT, I2C_SCL_PIN, GPIO_Mode_In_PU_No_IT);

  /*!< Configure I2C pins: SDA */
  GPIO_Init(I2C_SDA_GPIO_PORT, I2C_SDA_PIN, GPIO_Mode_In_PU_No_IT);

  /* Disable and Deinitialize the DMA channels */
  DMA_Cmd(I2C_DMA_CHANNEL_TX, DISABLE);
  DMA_Cmd(I2C_DMA_CHANNEL_RX, DISABLE);
  DMA_DeInit(I2C_DMA_CHANNEL_TX);
  DMA_DeInit(I2C_DMA_CHANNEL_RX);
}

void I2C_LowLevel_Init(void)
{
	/*!< I2C Periph clock enable */
  CLK_PeripheralClockConfig(I2C_CLK, ENABLE);

  /*!< Enable the DMA clock */
  CLK_PeripheralClockConfig(CLK_Peripheral_DMA1, ENABLE);

  /* I2C TX DMA Channel configuration */
  DMA_DeInit(I2C_DMA_CHANNEL_TX);
  DMA_Init(I2C_DMA_CHANNEL_TX,
           0, /* This parameter will be configured durig communication */
           I2C_DR_Address,
           0xFF, /* This parameter will be configured durig communication */
           DMA_DIR_PeripheralToMemory,/* This parameter will be configured durig communication */
           DMA_Mode_Normal,
           DMA_MemoryIncMode_Inc,
           DMA_Priority_VeryHigh,
           DMA_MemoryDataSize_Byte);

  /* I2C RX DMA Channel configuration */
  DMA_DeInit(I2C_DMA_CHANNEL_RX);
  DMA_Init(I2C_DMA_CHANNEL_RX, 0, /* This parameter will be configured durig communication */
           I2C_DR_Address,
           0xFF, /* This parameter will be configured durig communication */
           DMA_DIR_PeripheralToMemory,/* This parameter will be configured durig communication */
           DMA_Mode_Normal,
           DMA_MemoryIncMode_Inc,
           DMA_Priority_VeryHigh,
           DMA_MemoryDataSize_Byte);
}

void I2C_LowLevel_DMAConfig(uint16_t pBuffer, uint8_t BufferSize, uint16_t Direction)
{
	/* Initialize the DMA with the new parameters */
  if (Direction == DIRECTION_TX)
  {
    /* Configure the DMA Tx Channel with the buffer address and the buffer size */
    DMA_Init(I2C_DMA_CHANNEL_TX, pBuffer, I2C_DR_Address, BufferSize,
             DMA_DIR_MemoryToPeripheral, DMA_Mode_Normal, DMA_MemoryIncMode_Inc,
             DMA_Priority_VeryHigh, DMA_MemoryDataSize_Byte);
  }
  else
  {
    /* Configure the DMA Rx Channel with the buffer address and the buffer size */
    DMA_Init(I2C_DMA_CHANNEL_RX, pBuffer, I2C_DR_Address, BufferSize,
             DMA_DIR_PeripheralToMemory, DMA_Mode_Normal, DMA_MemoryIncMode_Inc,
             DMA_Priority_VeryHigh, DMA_MemoryDataSize_Byte);
  }

  /* Enable the DMA Channels Interrupts */
  DMA_ITConfig(I2C_DMA_CHANNEL_TX, DMA_ITx_TC, ENABLE);
  DMA_ITConfig(I2C_DMA_CHANNEL_RX, DMA_ITx_TC, ENABLE);
}

void I2C_DMA_RX_IRQHandler(void)
{
}

void I2C_DMA_TX_IRQHandler(void)
{
}