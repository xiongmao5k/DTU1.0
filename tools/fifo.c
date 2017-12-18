#include "fifo.h"
#include "string.h"

int fifo_init(struct fifo *fifo, uint8_t *dbuf, uint32_t size)
{
	fifo->data = dbuf;
	fifo->size = size;
	fifo->head = fifo->tail = 0;
    return 0;
}

int fifo_get_length(struct fifo *fifo)
{
	return (fifo->head + fifo->size - fifo->tail) % fifo->size;
}

int fifo_get_avlid(struct fifo *fifo)
{
	return fifo->size - fifo_get_length(fifo) - 1;
}

int fifo_push_byte(struct fifo *fifo, uint8_t data)
{
	if (fifo_get_avlid(fifo) == 0)
		return 0;
	fifo->data[fifo->head] = data;
	fifo->head = (fifo->head + 1) % fifo->size;
	return 1;
}

int fifo_pop_byte(struct fifo *fifo, uint8_t *buf)
{
	if (fifo_get_length(fifo) == 0)
		return 0;
	*buf = fifo->data[fifo->tail];
	fifo->tail = (fifo->tail + 1) % fifo->size;
	return 1;
}

int fifo_push(struct fifo *fifo, uint8_t *data, uint32_t size)
{
	uint32_t tmp;
	tmp = fifo_get_length(fifo);
	size = size < tmp ? size : tmp;
	tmp = fifo->size - fifo->head;
	if (tmp < size) {
		memcpy(&fifo->data[fifo->head], data, tmp);
		memcpy(fifo->data, &data[tmp], size - tmp);
	} else {
		memcpy(&fifo->data[fifo->head], data, size);
	}
	fifo->head = (fifo->head + size) % fifo->size;
	return size;
}

int fifo_pop(struct fifo *fifo, uint8_t *buf, uint32_t size)
{
	uint32_t tmp;

    tmp = fifo_get_length(fifo);
	size = size < tmp ? size : tmp;
	tmp = fifo->size - fifo->tail;
	if (tmp < size) {
		memcpy(buf, &fifo->data[fifo->tail], tmp);
		memcpy(&buf[tmp], fifo->data, size - tmp);
	} else {
		memcpy(buf, &fifo->data[fifo->tail], size);
	}
	fifo->tail = (fifo->tail + size) % fifo->size;
	return size;
}

int fifo_peek(struct fifo *fifo, uint8_t *buf, uint32_t size)
{
	uint32_t tmp;

	tmp = fifo_get_length(fifo);
	size = size < tmp ? size : tmp;
	tmp = fifo->size - fifo->tail;
	if (tmp < size) {
		memcpy(buf, &fifo->data[fifo->tail], tmp);
		memcpy(&buf[tmp], fifo->data, size - tmp);
	} else {
		memcpy(buf, &fifo->data[fifo->tail], size);
	}
	return size;
}

int fifo_clean(struct fifo *fifo)
{
	fifo->head = fifo->tail = 0;
	return 0;
}

