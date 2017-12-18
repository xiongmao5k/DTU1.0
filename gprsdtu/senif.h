#ifndef SOFTWARE_SENIF_H
#define SOFTWARE_SENIF_H

#include "stm32f10x.h"
#include "gpio.h"
#include "stdint.h"

#define POWER_CONTROL_CONFIG \
  __POWER_CONTROL__(power_ctrl1, GPIOB_GPIO_Pin_3, GPIOA_GPIO_Pin_15) \
  __POWER_CONTROL__(power_ctrl2, GPIOB_GPIO_Pin_6, GPIOB_GPIO_Pin_5) \
  __POWER_CONTROL__(power_ctrl3, GPIOB_GPIO_Pin_9, GPIOB_GPIO_Pin_8)

    
#define SENIF_CONFIGS   \
    __SENIF__(SENIF1, USART_STREAM1, GPIOB_GPIO_Pin_4, GPIOA_GPIO_Pin_11, power_ctrl1) \
    __SENIF__(SENIF2, USART_STREAM1, GPIOB_GPIO_Pin_4, GPIOA_GPIO_Pin_11, power_ctrl1) \
    __SENIF__(SENIF3, USART_STREAM1, GPIOB_GPIO_Pin_7, GPIOA_GPIO_Pin_11, power_ctrl2) \
    __SENIF__(SENIF4, USART_STREAM1, GPIOB_GPIO_Pin_7, GPIOA_GPIO_Pin_11, power_ctrl2) \
    __SENIF__(SENIF5, USART_STREAM1, GPIOC_GPIO_Pin_13, GPIOA_GPIO_Pin_11, power_ctrl3) \
    __SENIF__(SENIF6, USART_STREAM1, GPIOC_GPIO_Pin_13, GPIOA_GPIO_Pin_11, power_ctrl3) \


enum {
#define __SENIF__(name, args...) name,
    SENIF_CONFIGS
#undef __SENIF__
    SENIF_LIMIT
};


#define RS485_TE GPIOA_GPIO_Pin_11
#define RS485_RE GPIOA_GPIO_Pin_12
#define RS485_EN GPIOD_GPIO_Pin_0


typedef void (*senif_input_t)(uint8_t byte);

void senif_init (uint32_t senif_id);
uint32_t senif_power_open (uint32_t sendif_id);
uint32_t senif_power_close (uint32_t sendif_id);
int senif_open(uint32_t senif_id);
int senif_close(uint32_t senif_id);
uint32_t senif_read (uint32_t senif_id, void *buf, int size);
uint32_t senif_write_byte (uint32_t senif_id, uint8_t byte);
uint32_t senif_write (uint32_t senif_id, void *buf, int size);

#endif //SOFTWARE_SENIF_H
