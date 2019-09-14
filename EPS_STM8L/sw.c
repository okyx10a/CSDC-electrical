#include "sw.h"

sw_t Switch[NUM_SW];



void sw_DeInit(void)
{
	I2C_LowLevel_DeInit();
}

void sw_Init(void)
{
  I2C_LowLevel_Init();

  /*!< I2C configuration */
  /* I2C Peripheral Enable */
  I2C_Cmd(I2C, ENABLE);
  /* I2C configuration after enabling it */
  I2C_Init(I2C, I2C_SPEED, OWN_ADDR, I2C_Mode_I2C, I2C_DutyCycle_2,
           I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);

  /* Enable the I2C peripheral DMA requests */
  I2C_DMACmd(I2C, ENABLE);
}

void sw_QuickCmd(uint8_t slave_addr)
{
	I2C_GenerateSTART(I2C1, ENABLE);

  /*!< Test on EV5 (i2c start) and clear it */
  while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
  {};

  /*!< Send slave address for write */
  I2C_Send7bitAddress(I2C1, slave_addr, I2C_Direction_Transmitter);

  /*!< Test on EV6 and clear it (an acknowledge is sent on the bus) */
  while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
  {};

  /*!< Send STOP condition */
  I2C_GenerateSTOP(I2C1, ENABLE);
}

void sw_WriteCmdByte(uint8_t SlaveAddr, uint8_t Cmd)
{
}

void sw_WriteExtCmdByte(uint8_t SlaveAddr, uint8_t RegAddr, uint8_t Cmd)
{
}

void sw_ReadVoltCurr(uint8_t SlaveAddr, sw_t* Switch)
{
}

void sw_ReadCurrent(uint8_t SlaveAddr, sw_t* Switch)
{
}

void sw_ReadVoltage(uint8_t SlaveAddr, sw_t* Switch)
{
}

