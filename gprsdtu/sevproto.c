#include "stdint.h"
#include "crc.h"
#include "framebuff.h"
#include "sevproto.h"
#include "stddef.h"

static uint32_t __seq;
static int __error;

int sevproto_init(void)
{
    __error = SEVPROTO_ERROR_NONE;
    __seq = 0;
    return 0;
}

void * sevproto_check(void *buff, uint32_t size)
{
#define SWAP_BYTE4(value) (((((((value) & 0xFF00FF00) >> 8) | (((value) & 0xFF00FF) << 8)) & 0xFFFF0000) >> 16) | ((((((value) & 0xFF00FF00) >> 8) | (((value) & 0xFF00FF) << 8)) & 0xFFFF) << 16))
    uint8_t *base = buff;
    uint8_t head, seq, end;
    uint16_t len;
    uint32_t crc;
    uint8_t *data;
    FRAMEBUFF_PARSE_BEGIN(buff);
    FRAMEBUFF_PARSE_POP_U8(head);
    if (head != 0x7E) {
        __error = SEVPROTO_ERROR_HEAD;
        return NULL;
    }
    FRAMEBUFF_PARSE_POP_U8(seq);
    if (seq != __seq) {
    // if (0) {
        __error = SEVPROTO_ERROR_SEQ;
        return NULL;
    }
    FRAMEBUFF_PARSE_POP_U16(len);
    FRAMEBUFF_PARSE_POP(data, len);
    FRAMEBUFF_PARSE_POP_U32(crc);
    FRAMEBUFF_PARSE_POP_U8(end);
    if (end != 0x0A) {
        __error = SEVPROTO_ERROR_TAIL;
        return NULL;
    }
    
    if (SWAP_BYTE4(crc) != crc32_calc(base+1, len+3)) {
    // if (0) {
        __error = SEVPROTO_ERROR_CRC;
        return NULL;
    }
    FRAMEBUFF_PARSE_END();
    __error = SEVPROTO_ERROR_NONE;
    return data;
}

FRAMEBUFF(sevproto_prepare_buff, 512);

void * sevproto_prepare(void *data, uint32_t size, uint32_t *framelen)
{
    uint32_t crc;
    uint8_t *base = NULL;
    framebuff_clean(&sevproto_prepare_buff);
    base = framebuff_datptr(&sevproto_prepare_buff);
    framebuff_push_u8(&sevproto_prepare_buff, 0x7E);
    framebuff_push_u8(&sevproto_prepare_buff, ++__seq);
    framebuff_push_u16(&sevproto_prepare_buff, size);
    framebuff_push(&sevproto_prepare_buff, data, size);
    crc = crc32_calc(base+1, size+3);
    framebuff_push_u32(&sevproto_prepare_buff, crc);
    framebuff_push_u8(&sevproto_prepare_buff, 0x0A);
    *framelen = framebuff_length(&sevproto_prepare_buff);
    return base;
}

int sevproto_error(void)
{
    return __error;
}