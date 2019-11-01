#include "sw.h"



void sw_DeInit(void)
{
	I2C_LowLevel_DeInit();
}

void sw_Init(void)
{
  I2C_LowLevel_Init();
	
	GPIOB->DDR = 0b11111111;

  /*!< I2C configuration */
  /* I2C Peripheral Enable */
  I2C_Cmd(I2C, ENABLE);
  /* I2C configuration after enabling it */
  I2C_Init(I2C, SW_I2C_SPEED, OWN_ADDR, I2C_Mode_I2C, I2C_DutyCycle_2, I2C_Ack_Enable, I2C_AcknowledgedAddress_7bit);

  /* Enable the I2C peripheral DMA requests */
  I2C_DMACmd(I2C, ENABLE);
}

void sw_QuickCmd(uint8_t slave_addr)
{
	I2C_GenerateSTART(I2C1, ENABLE);

  /*!< Test on EV5 (i2c start) and clear it */
  while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
  {};

	/*!< Send slave address we are writting to */
  I2C_Send7bitAddress(I2C1, slave_addr, I2C_Direction_Transmitter);

  /*!< Test on EV6 and clear it (an acknowledge is sent on the bus) */
  while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
  {}

  /*!< Send STOP condition */
  I2C_GenerateSTOP(I2C1, ENABLE);
}

void sw_WriteCmdByte(uint8_t SwAddr, uint8_t Cmd)
{
	I2C_GenerateSTART(I2C1, ENABLE); //sending start condition

	/*!< Test on EV5 and clear it, check if START condition has been correctly released, I2C1 is the on board I2C address */
	//S|
	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
	{}

	/*!< Send slave address we are writting to */
	//SLAVE_ADDR|W|
	I2C_Send7bitAddress(I2C1, SwAddr, I2C_Direction_Transmitter);
	
	/*!< Test on EV6 and clear it (an acknowledge has been released on the bus) */
	//A|
	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
	{}
		
	/* send the byte8 */
	//CMD_BYTE|
	I2C_SendData(I2C1, Cmd);
	
	//A|
	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED))
	{}

	/*!< Send STOP condition */
	//P
	I2C_GenerateSTOP(I2C1, ENABLE);
}

void sw_WriteExtCmdByte(uint8_t SwAddr, uint8_t RegAddr, uint8_t ExtCmd)
{
	I2C_GenerateSTART(I2C1, ENABLE); //sending start condition

	/*!< Test on EV5 and clear it, check if START condition has been correctly released, I2C1 is the on board I2C address */
	//S|
	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
	{}
	
	/*!< Send slave address we are writting to */
	//SLAVE_ADDR|W|
	I2C_Send7bitAddress(I2C1, SwAddr, I2C_Direction_Transmitter);
	
	/*!< Test on EV6 and clear it (an acknowledge has been released on the bus) */
	//A|
	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED))
	{}
	
	
	/* send the byte8 */
	//CMD_BYTE|
	I2C_SendData(I2C1, RegAddr);
	
	//A|
	while(!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED))
	{}
	
	/* send the byte8 */
	//CMD_BYTE|
	I2C_SendData(I2C1, ExtCmd);
	
	/* Test on EV8 and clear it */
	//A|
	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_TRANSMITTED))
	{}
	
	/*!< Send STOP condition */
	//P
	I2C_GenerateSTOP(I2C1, ENABLE);
}

void sw_ReadVoltCurr(uint8_t SwAddr, sw_t* Switch)
{
	uint8_t buffer[3];
	/*!< While the bus is busy */
  while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
  {}
	
	I2C_GenerateSTART(I2C1, ENABLE); //sending start condition

	/*!< Test on EV5 and clear it, check if START condition has been correctly released, I2C1 is the on board I2C address */
	//S|
	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
	{}
	
	/*!< Send slave address we are writting to */
	//SLAVE_ADDR|W|
	I2C_Send7bitAddress(I2C1, SwAddr, I2C_Direction_Receiver);
	
	/*!< Test on EV6 and clear it */
  while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
  {}
	
	//Slave sending the first byte
	
	 /* Test on EV7 and clear it */
	 //A|
  while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED)) 
  {}
	
	buffer[0] = I2C_ReceiveData(I2C1); //meanwhile the slave send the second byte
	
	/* Test on EV7 and clear it */
	 //A|
  while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED)) 
  {}
	
	buffer[1] = I2C_ReceiveData(I2C1); //meanwhile the slave send the third byte

	 /* Disable LM75_I2C acknowledgement */
  I2C_AcknowledgeConfig(I2C1, DISABLE);

  /* Send LM75_I2C STOP Condition */
  I2C_GenerateSTOP(I2C1, ENABLE);

  /* Test on RXNE flag */
	//wait for the last byte to complete transmission
  while (I2C_GetFlagStatus(I2C1, I2C_FLAG_RXNE) == RESET)
  {}
	
	buffer[2] = I2C_ReceiveData(I2C1);// receieve the third bit
	
	Switch->voltage = (6.65/4096)*(buffer[0]<<4|buffer[2]>>4);//in unit V
	Switch->current = (105.84/4096)*(buffer[1]<<4|buffer[2]&0b1111);// in unit mA
}

void sw_ReadCurrent(uint8_t SwAddr, sw_t* Switch)
{
	uint8_t buffer[2];
	/*!< While the bus is busy */
  while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
  {}
	
	I2C_GenerateSTART(I2C1, ENABLE); //sending start condition

	/*!< Test on EV5 and clear it, check if START condition has been correctly released, I2C1 is the on board I2C address */
	//S|
	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
	{}
	
	/*!< Send slave address we are writting to */
	//SLAVE_ADDR|W|
	I2C_Send7bitAddress(I2C1, SwAddr, I2C_Direction_Receiver);
	
	/*!< Test on EV6 and clear it */
  while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
  {}
	
	//Slave sending the first byte
	
	 /* Test on EV7 and clear it */
	 //A|
  while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED)) 
  {}
	
	buffer[0] = I2C_ReceiveData(I2C1); //meanwhile the slave send the second byte

	 /* Disable LM75_I2C acknowledgement */
  I2C_AcknowledgeConfig(I2C1, DISABLE);

  /* Send LM75_I2C STOP Condition */
  I2C_GenerateSTOP(I2C1, ENABLE);

  /* Test on RXNE flag */
	//wait for the last byte to complete transmission
  while (I2C_GetFlagStatus(I2C1, I2C_FLAG_RXNE) == RESET)
  {}
	
	buffer[2] = I2C_ReceiveData(I2C1);
	
	Switch->current = (105.84/4096)*(buffer[0]<<4|buffer[1]>>4);// in unit mA
}

void sw_ReadVoltage(uint8_t SwAddr, sw_t* Switch)
{
	uint8_t buffer[2];
	/*!< While the bus is busy */
  while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
  {}
	
	I2C_GenerateSTART(I2C1, ENABLE); //sending start condition

	/*!< Test on EV5 and clear it, check if START condition has been correctly released, I2C1 is the on board I2C address */
	//S|
	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
	{}
	
	/*!< Send slave address we are writting to */
	//SLAVE_ADDR|W|
	I2C_Send7bitAddress(I2C1, SwAddr, I2C_Direction_Receiver);
	
	/*!< Test on EV6 and clear it */
  while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
  {}
	
	//Slave sending the first byte
	
	 /* Test on EV7 and clear it */
	 //A|
  while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED)) 
  {}
	
	buffer[0] = I2C_ReceiveData(I2C1); //meanwhile the slave send the second byte

	 /* Disable LM75_I2C acknowledgement */
  I2C_AcknowledgeConfig(I2C1, DISABLE);

  /* Send LM75_I2C STOP Condition */
  I2C_GenerateSTOP(I2C1, ENABLE);

  /* Test on RXNE flag */
	//wait for the last byte to complete transmission
  while (I2C_GetFlagStatus(I2C1, I2C_FLAG_RXNE) == RESET)
  {}
	
	buffer[2] = I2C_ReceiveData(I2C1);
	
	Switch->voltage = (6.65/4096)*(buffer[0]<<4|buffer[1]>>4);// in unit mA
}

void sw_ReadStatus(uint8_t SwAddr, sw_t* Switch)
{
	/*!< While the bus is busy */
  while (I2C_GetFlagStatus(I2C1, I2C_FLAG_BUSY))
  {}
	
	I2C_GenerateSTART(I2C1, ENABLE); //sending start condition

	/*!< Test on EV5 and clear it, check if START condition has been correctly released, I2C1 is the on board I2C address */
	//S|
	while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_MODE_SELECT))
	{}
	
	/*!< Send slave address we are writting to */
	//SLAVE_ADDR|W|
	I2C_Send7bitAddress(I2C1, SwAddr, I2C_Direction_Receiver);
	
	/*!< Test on EV6 and clear it */
  while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED))
  {}
	
	//Slave sending the first byte
	
	 /* Test on EV7 and clear it */
	 //A|
  while (!I2C_CheckEvent(I2C1, I2C_EVENT_MASTER_BYTE_RECEIVED)) 
  {}
	
	Switch-> status = I2C_ReceiveData(I2C1); //meanwhile the slave send the second byte

}

void sw_on(uint8_t SwAddr)
{
	switch(SwAddr)
	{
		case SW1_ADDRESS:
			setBit(GPIOB->ODR, 1);
			break;
		case SW2_ADDRESS:
			setBit(GPIOB->ODR, 1);
			break;
	}
}
void sw_off(uint8_t SwAddr)
{
	switch(SwAddr)
	{
		case SW1_ADDRESS:
			clearBit(GPIOB->ODR, 0);
			break;
		case SW2_ADDRESS:
			clearBit(GPIOB->ODR, 0);
			break;
	}
}