#ifndef SOFTWARE_USART_STREAM_H
#define SOFTWARE_USART_STREAM_H


#define USART_STREAM_BUFFER_SIZE    64


#define USART_STREAM_CONFIG     \
        _USART_STREAM_(USART_STREAM1, 1)\
        _USART_STREAM_(USART_STREAM2, 2)\


enum {
#define _USART_STREAM_(sid, uid) sid,
    USART_STREAM_CONFIG
#undef _USART_STREAM_
};


void usart_stream_init(uint32_t stream_id);
uint32_t usart_stream_write(uint32_t stream_id, void *buf, uint32_t size);
uint32_t usart_stream_read(uint32_t stream_id, void *buf, uint32_t size);
uint32_t usart_stream_byte(uint32_t stream_id, void *buf);
#endif //SOFTWARE_USART_STREAM_H
