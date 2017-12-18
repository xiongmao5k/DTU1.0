#ifndef FRAMEBUFF_FRAMEBUFF_H
#define FRAMEBUFF_FRAMEBUFF_H

#include "stdint.h"

typedef struct framebuff_struct {
  uint8_t *buffer;
  uint8_t *ptr;
  uint8_t *limit;
} framebuff_t;
#define FRAMEBUFF(name, size)     \
static uint8_t framebuffer_##name##_data_buffer[size];  \
static framebuff_t name = {framebuffer_##name##_data_buffer, framebuffer_##name##_data_buffer, framebuffer_##name##_data_buffer + size}    \

#define FRAMEBUFF_TYPE_FUNN_CONF                              \
    __FRAMEBUFF_TYPE_FUN__(u8, uint8_t)                       \
    __FRAMEBUFF_TYPE_FUN__(u16, uint16_t)                     \
    __FRAMEBUFF_TYPE_FUN__(u32, uint32_t)                     \
    __FRAMEBUFF_TYPE_FUN__(s8, int8_t)                        \
    __FRAMEBUFF_TYPE_FUN__(s16, int16_t)                      \
    __FRAMEBUFF_TYPE_FUN__(s32, int32_t)                      \
    __FRAMEBUFF_TYPE_FUN__(float, float)                      \
    __FRAMEBUFF_TYPE_FUN__(double, double)                    \

#define FRAMEBUFF_PARSE_BEGIN(buff)         { uint8_t *ptr = buff
#define FRAMEBUFF_PARSE_POP_U8(dbuf)        dbuf = *(uint8_t *)ptr; ptr += sizeof(uint8_t)
#define FRAMEBUFF_PARSE_POP_U16(dbuf)       dbuf = *(uint16_t *)ptr; ptr += sizeof(uint16_t)
#define FRAMEBUFF_PARSE_POP_U32(dbuf)       dbuf = *(uint32_t *)ptr; ptr += sizeof(uint32_t)
#define FRAMEBUFF_PARSE_POP_S8(dbuf)        dbuf = *(int8_t *)ptr; ptr += sizeof(int8_t)
#define FRAMEBUFF_PARSE_POP_S16(dbuf)       dbuf = *(int16_t *)ptr; ptr += sizeof(int16_t)
#define FRAMEBUFF_PARSE_POP_S32(dbuf)       dbuf = *(int32_t *)ptr; ptr += sizeof(int32_t)
#define FRAMEBUFF_PARSE_POP_FLOAT(dbuf)     dbuf = *(float *)ptr; ptr += sizeof(float)
#define FRAMEBUFF_PARSE_POP_DOUBLE(dbuf)    dbuf = *(double *)ptr; ptr += sizeof(double)
#define FRAMEBUFF_PARSE_POP(dbuf, size)     dbuf = ptr; ptr += size
#define FRAMEBUFF_PARSE_END()               }

void framebuff_init(framebuff_t *fb, void *buff, uint32_t size);
int framebuff_length(framebuff_t *fb);
int framebuff_avlid(framebuff_t *fb);
int framebuff_push(framebuff_t *fb, void *data, uint32_t size);
int framebuff_pop(framebuff_t *fb, void *buff, uint32_t size);
void framebuff_clean(framebuff_t *fb);
void *framebuff_datptr(framebuff_t *fb);
int framebuff_remove(framebuff_t *fb, uint32_t size);
int framebuff_push_byte(framebuff_t *fb, uint8_t byte);
int framebuff_alloc(framebuff_t *fb, uint32_t size);
#define __FRAMEBUFF_TYPE_FUN__(name, type)                  \
int framebuff_push_##name(framebuff_t *fb, type type_data);
FRAMEBUFF_TYPE_FUNN_CONF
#undef __FRAMEBUFF_TYPE_FUN__
#endif //FRAMEBUFF_FRAMEBUFF_H
