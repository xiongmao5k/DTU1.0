#ifndef FIFO_H
#define FIFO_H

#include "stdint.h"
#include "stddef.h"

struct fifo
{
	uint8_t *data;
	uint32_t head;
	uint32_t tail;
	uint32_t size;
};

int fifo_init(struct fifo *fifo, uint8_t *dbuf, uint32_t size);

int fifo_get_length(struct fifo *fifo);
int fifo_get_avlid(struct fifo *fifo);
int fifo_push_byte(struct fifo *fifo, uint8_t data);
int fifo_pop_byte(struct fifo *fifo, uint8_t *buf);
int fifo_push(struct fifo *fifo, uint8_t *data, uint32_t size);
int fifo_pop(struct fifo *fifo, uint8_t *buf, uint32_t size);
int fifo_peek(struct fifo *fifo, uint8_t *buf, uint32_t size);
int fifo_clean(struct fifo *fifo);

#define FIFO(name, size)	\
static char _##name##_fifo_data_buffer[size];\
static struct fifo name = {_##name##_fifo_data_buffer, 0, 0, size};

#endif
