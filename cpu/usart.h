#ifndef __USART_H
#define __USART_H

#include "stm32f10x.h"
#include "stdint.h"
#include "stddef.h"
#include <stdio.h>

typedef void (*input_t)(uint8_t byte);

void usart_init (uint32_t usart, input_t input);

void usart_write8 (uint32_t usart_id, uint8_t data);

uint32_t usart_write(uint32_t usart_id, void *buf, uint32_t size);

void usart_configure (uint32_t usart, uint32_t baudrate, uint32_t databits, uint32_t stopbits);

#endif //__USART_H