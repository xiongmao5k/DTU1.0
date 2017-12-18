#include "stdint.h"
#include "string.h"
#include "framebuff.h"


void framebuff_init(framebuff_t *fb, void *buff, uint32_t size)
{
  fb->buffer = fb->ptr = buff;
  fb->limit = fb->buffer + size;
}

int framebuff_length(framebuff_t *fb)
{
  return (int)(fb->ptr - fb->buffer);
}

int framebuff_avlid(framebuff_t *fb)
{
  return (int) (fb->limit - fb->ptr);
}

int framebuff_push(framebuff_t *fb, void *data, uint32_t size)
{
  uint32_t avlid = (uint32_t) framebuff_avlid(fb);
  size = size > avlid ? avlid : size;
  memcpy(fb->ptr, data, size);
  fb->ptr += size;
  return size;
}

int framebuff_pop(framebuff_t *fb, void *buff, uint32_t size)
{
  uint32_t length = (uint32_t) framebuff_length(fb);
  size = length > size ? size : length;
  memcpy(buff, fb->buffer, size);
  if (size == length) {
    fb->ptr = fb->buffer;
  } else {
    memmove(fb->buffer, fb->buffer + size, length - size);
    fb->ptr -= size;
  }
  return size;
}

void framebuff_clean(framebuff_t *fb)
{
  fb->ptr = fb->buffer;
}

void *framebuff_datptr(framebuff_t *fb)
{
  return fb->buffer;
}

int framebuff_remove(framebuff_t *fb, uint32_t size)
{
  uint32_t length = (uint32_t) framebuff_length(fb);
  size = length > size ? size : length;
  if (length == size) {
    fb->ptr = fb->buffer;
  } else {
    memmove(fb->buffer, fb->buffer + size, length - size);
    fb->ptr -= size;
  }
  return size;
}

int framebuff_push_byte(framebuff_t *fb, uint8_t byte)
{
  uint32_t avlid = (uint32_t) framebuff_avlid(fb);
  if (avlid){
    *fb->ptr++ = byte;
    return 1;
  } else {
    return 0;
  }
}


#define __FRAMEBUFF_TYPE_FUN__(name, type)                    \
int framebuff_push_##name(framebuff_t *fb, type type_data) {  \
  uint32_t avlid = (uint32_t) framebuff_avlid(fb);            \
  if (avlid > sizeof(type)-1) {                               \
    *((type *)fb->ptr) = type_data;                           \
    fb->ptr += sizeof(type);                                  \
    return sizeof(type);                                      \
  } else {                                                    \
    return 0;}}
FRAMEBUFF_TYPE_FUNN_CONF
#undef __FRAMEBUFF_TYPE_FUN__



int framebuff_alloc(framebuff_t *fb, uint32_t size)
{
  uint32_t avlid = framebuff_avlid(fb);
  if (avlid < size) {
    return 0;
  } else {
    fb->ptr += size;
    return size;
  }
}
