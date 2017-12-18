#include "stdio.h"
#include "stdint.h"
#include "usart.h"
#include "fifo.h"
#include "usart_stream.h"


#define _USART_STREAM_(sid, uid)                                               \
static struct fifo sid##_fifo;                                                 \
static uint8_t sid##_data_buffer[USART_STREAM_BUFFER_SIZE];                    \
void sid##_input_handler(uint8_t data){fifo_push_byte(&sid##_fifo, data);}
USART_STREAM_CONFIG
#undef _USART_STREAM_

void usart_stream_init(uint32_t stream_id)
{
    switch (stream_id) {
#define _USART_STREAM_(sid, uid)                                               \
        case sid:                                                              \
            fifo_init(&sid##_fifo, sid##_data_buffer, USART_STREAM_BUFFER_SIZE);\
            usart_init(uid, sid##_input_handler); break;
        USART_STREAM_CONFIG
#undef _USART_STREAM_
        default:
            break;
    }
}

uint32_t usart_stream_write(uint32_t stream_id, void *buf, uint32_t size)
{
    switch (stream_id) {
#define _USART_STREAM_(sid, uid)                                                                                    \
        case sid:return usart_write(uid, buf, size);
        USART_STREAM_CONFIG
#undef _USART_STREAM_
        default:
            return 0;
    }
}

uint32_t usart_stream_read(uint32_t stream_id, void *buf, uint32_t size)
{
    uint32_t result;
    switch (stream_id) {
#define _USART_STREAM_(sid, uid)                                                                                    \
        case sid:                                                                                                     \
            __disable_irq();                                                                                           \
            result =  fifo_pop(&sid##_fifo, buf, size);                                                                \
            __enable_irq(); return result;
        USART_STREAM_CONFIG
#undef _USART_STREAM_
        default:
            return 0;
    }
}

uint32_t usart_stream_byte(uint32_t stream_id, void *buf)
{
    uint32_t result;
    switch (stream_id) {
#define _USART_STREAM_(sid, uid)                                                                                    \
        case sid:                                                                                                     \
            __disable_irq();                                                                                           \
            result = fifo_pop_byte(&sid##_fifo, buf);                                                                  \
            __enable_irq(); return result;
        USART_STREAM_CONFIG
#undef _USART_STREAM_
        default:
            return 0;
    }
}
