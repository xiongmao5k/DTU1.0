#ifndef __GPIO_H
#define __GPIO_H

#include "stdint.h"
#include "stm32f10x.h"

#define _GPIOS                  \
    _GPIO_(GPIOA, GPIO_Pin_2)   \
    _GPIO_(GPIOA, GPIO_Pin_3)   \
    _GPIO_(GPIOC, GPIO_Pin_13)  \
    _GPIO_(GPIOA, GPIO_Pin_1)   \
    _GPIO_(GPIOA, GPIO_Pin_0)   \
    _GPIO_(GPIOA, GPIO_Pin_7)   \
    _GPIO_(GPIOA, GPIO_Pin_4)   \
    _GPIO_(GPIOB, GPIO_Pin_0)   \
    _GPIO_(GPIOA, GPIO_Pin_5)   \
    _GPIO_(GPIOD, GPIO_Pin_0)   \
    _GPIO_(GPIOA, GPIO_Pin_6)   \
    _GPIO_(GPIOA, GPIO_Pin_15)  \
    _GPIO_(GPIOA, GPIO_Pin_12)  \
    _GPIO_(GPIOA, GPIO_Pin_11)  \
    _GPIO_(GPIOB, GPIO_Pin_9)   \
    _GPIO_(GPIOB, GPIO_Pin_8)   \
    _GPIO_(GPIOB, GPIO_Pin_7)   \
    _GPIO_(GPIOB, GPIO_Pin_6)   \
    _GPIO_(GPIOB, GPIO_Pin_5)   \
    _GPIO_(GPIOB, GPIO_Pin_4)   \
    _GPIO_(GPIOB, GPIO_Pin_3)   \
    _GPIO_(GPIOB, GPIO_Pin_11)

enum {
#define _GPIO_(a , b) a##_##b,
    _GPIOS
#undef _GPIO_
      GPIOS_LIMIT,
};

void gpio_init(void);
void gpio_set_as_output(uint32_t gpio);
void gpio_set_as_input (uint32_t gpio);
void gpio_set_pin (uint32_t gpio, uint32_t state);
uint8_t gpio_get_pin (uint32_t gpio);

#endif //GPIO_H