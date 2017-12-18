#include "usart.h"
#include <stdio.h>
#include <stdarg.h>
#include "stm32f10x.h"
#include "ringbuf.h"

#include "gpio.h"


static input_t usart1_input_fun, usart2_input_fun;


struct ringbuf usart2_rx_ringbuf;
char usart2_rx_data_buffer[512];

void usart_init(uint32_t usart, input_t input) {
    GPIO_InitTypeDef Usart;
    NVIC_InitTypeDef NVIC_InitStructure;
    NVIC_PriorityGroupConfig(NVIC_PriorityGroup_0);
    USART_TypeDef *usartdev;

   switch (usart) {
       case 1:
           usart1_input_fun = input;
           RCC_APB2PeriphClockCmd(RCC_APB2Periph_USART1, ENABLE);
           Usart.GPIO_Pin = GPIO_Pin_9;
           Usart.GPIO_Mode = GPIO_Mode_AF_PP;      //TX
           Usart.GPIO_Speed = GPIO_Speed_10MHz;
           GPIO_Init(GPIOA, &Usart);
           Usart.GPIO_Pin = GPIO_Pin_10;
           Usart.GPIO_Mode = GPIO_Mode_IPU; //RX
           GPIO_Init(GPIOA, &Usart);
           NVIC_InitStructure.NVIC_IRQChannel = USART1_IRQn;
           usartdev = USART1;
           break;
       case 2:
           usart2_input_fun = input;
           RCC_APB1PeriphClockCmd(RCC_APB1Periph_USART2, ENABLE);
           Usart.GPIO_Pin = GPIO_Pin_2;
           Usart.GPIO_Mode = GPIO_Mode_AF_PP;      //TX
           Usart.GPIO_Speed = GPIO_Speed_10MHz;
           GPIO_Init(GPIOA, &Usart);
           Usart.GPIO_Pin = GPIO_Pin_3;
           Usart.GPIO_Mode = GPIO_Mode_IN_FLOATING; //RX
           // Usart.GPIO_Mode = GPIO_Mode_IPD;
           GPIO_Init(GPIOA, &Usart);
           NVIC_InitStructure.NVIC_IRQChannel = USART2_IRQn;
           usartdev = USART2;
           break;
           // ringbuf_init(&usart2_rx_ringbuf, usart2_rx_data_buffer, sizeof(usart2_rx_data_buffer));
       default:
           usartdev = USART1;
           break;
   }
    NVIC_InitStructure.NVIC_IRQChannelPreemptionPriority = 0;
    NVIC_InitStructure.NVIC_IRQChannelCmd = ENABLE;
    NVIC_Init(&NVIC_InitStructure);
    //USART_INIT
    USART_InitTypeDef USART_InitStructure;
    USART_StructInit(&USART_InitStructure);
    USART_Init(usartdev, &USART_InitStructure);
    USART_ITConfig(usartdev, USART_IT_RXNE, ENABLE);
    USART_Cmd(usartdev, ENABLE);
}


//set stopbits WordLength baudrate
void usart_configure(uint32_t usart, uint32_t baudrate, uint32_t databits, uint32_t stopbits) {
    uint32_t i = usart, baud = baudrate, databit = databits, stopbit = stopbits;

    USART_InitTypeDef USART_InitStructure;
    USART_StructInit(&USART_InitStructure);
    //set databits
    if (databit == 8)
        USART_InitStructure.USART_WordLength = USART_WordLength_8b;
    else
        USART_InitStructure.USART_WordLength = USART_WordLength_9b;
    //set data stopbits
    if (stopbit == 1)
        USART_InitStructure.USART_StopBits = USART_StopBits_1;
    else
        USART_InitStructure.USART_StopBits = USART_StopBits_2;
    //set baudrate
    USART_InitStructure.USART_BaudRate = baud;

    if (i == 1) {
        USART_Init(USART1, &USART_InitStructure);
        USART_Cmd(USART1, ENABLE);
    } else {
        USART_Init(USART2, &USART_InitStructure);
        USART_Cmd(USART2, ENABLE);
    }
}

void usart_write8(uint32_t usart_id, uint8_t data) {
    USART_TypeDef *usart = NULL;
    switch (usart_id) {
        case 1: usart = USART1;
            break;
        case 2: usart = USART2;
            break;
        default: usart = USART1;
            break;
    }
    while (USART_GetFlagStatus(usart, USART_FLAG_TXE) == RESET);
    USART_SendData(usart, data);
    while (USART_GetFlagStatus(usart, USART_FLAG_TC) == RESET);
}

uint32_t usart_write(uint32_t usart_id, void *buf, uint32_t size)
{
    uint8_t *ptr = buf;
    uint32_t cnt = size;
    USART_TypeDef *usart;
    switch (usart_id) {
        case 1: usart = USART1;
            break;
        case 2: usart = USART2;
            break;
        default: usart = USART1;
            break;
    }
    while (cnt--) {
        USART_SendData(usart, *ptr++);
        while (USART_GetFlagStatus(usart, USART_FLAG_TXE) == RESET);
    }
    while (USART_GetFlagStatus(usart, USART_FLAG_TC) == RESET);
    return size;
}


// USART1_IRQ
void USART1_IRQHandler(void) {
    uint16_t i;
    if (USART_GetFlagStatus(USART1, USART_FLAG_RXNE) == SET) {
        i = USART_ReceiveData(USART1);
        if (usart1_input_fun != NULL) usart1_input_fun(i);
    }
    if (USART_GetFlagStatus(USART1, USART_FLAG_NE) == SET) {
        printf("UART1 NE\n");
    }
}



// USART2_IRQ
void USART2_IRQHandler(void) {
    uint16_t i;
    // gpio_set_pin(GPIOA_GPIO_Pin_4, 0);
    if ((USART2->SR & USART_FLAG_RXNE) != 0) {
        // i = USART_ReceiveData(USART2);
        i = USART2->DR & 0xFF;
        // ringbuf_put(&usart2_rx_ringbuf, i);
        // printf("%c, ", i);
        if (usart2_input_fun != NULL) usart2_input_fun(i);
    }
    /*
    if ((USART2->SR & USART_FLAG_FE) != 0) {
        printf("USART2: Frame Error.\n");
    }
    if ((USART2->SR & USART_FLAG_ORE) != 0) {
        printf("USART2: ORE Error.\n");
    }
    if ((USART2->SR & USART_FLAG_NE) != 0) {
        printf("USART2: NE Error.\n");
    }
    */
    // gpio_set_pin(GPIOA_GPIO_Pin_4, 1);
    // if (USART_GetFlagStatus(USART2, USART_FLAG_RXNE) == SET) {}
    // if (USART_GetFlagStatus(USART2, USART_FLAG_NE) == SET) {  printf("UART2 NE\n"); }
}