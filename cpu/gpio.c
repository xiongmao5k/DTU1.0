#include "gpio.h"
#include "stdlib.h"

struct _gpio_cfg {
    GPIO_TypeDef *port;
    uint32_t pin;
};

struct _gpio_cfg gpiocfg[] = {
#define _GPIO_(a, b) {a, b},
    _GPIOS
#undef _GPIO_
};

void gpio_set_as_output (uint32_t gpio)
{
    
    struct _gpio_cfg *cfg = NULL;
    if (gpio < GPIOS_LIMIT) {
        cfg = &gpiocfg[gpio];
        GPIO_InitTypeDef init_type;
        init_type.GPIO_Pin = cfg->pin;
        init_type.GPIO_Mode = GPIO_Mode_Out_PP;
        init_type.GPIO_Speed = GPIO_Speed_2MHz;
        GPIO_Init(cfg->port, &init_type);
    }
}

void gpio_set_as_input (uint32_t gpio)
{
  struct _gpio_cfg *cfg = NULL;
  if (gpio < GPIOS_LIMIT) {
    cfg = &gpiocfg[gpio];
    GPIO_InitTypeDef init_type;
    init_type.GPIO_Pin = cfg->pin;
    init_type.GPIO_Mode = GPIO_Mode_IN_FLOATING;
    init_type.GPIO_Speed = GPIO_Speed_2MHz;
    GPIO_Init (cfg->port, &init_type);
  }
}

void gpio_set_pin (uint32_t gpio, uint32_t state)
{
  struct _gpio_cfg *cfg = NULL;
  if (gpio < GPIOS_LIMIT) {
    cfg = &gpiocfg[gpio];
    if (state == 1)
      GPIO_WriteBit (cfg->port, cfg->pin, Bit_SET);
    else 
      GPIO_WriteBit (cfg->port, cfg->pin, Bit_RESET);
  }
}

uint8_t gpio_get_pin (uint32_t gpio)
{
  uint8_t bitstatus = 0x00;
  struct _gpio_cfg *cfg = NULL;
  if (gpio < GPIOS_LIMIT) {
    cfg = &gpiocfg[gpio];
    bitstatus = GPIO_ReadInputDataBit(cfg->port, cfg->pin);
  }
  return bitstatus;
}

void gpio_init(void)
{
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2, ENABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOA, ENABLE);
    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
}
