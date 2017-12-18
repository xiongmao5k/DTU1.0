#include "senproto.h"
#include "framebuff.h"
#include "stdio.h"
#include "rtc.h"


static uint8_t address_backup;

int rst460_prepare(void *buff, uint16_t addr)
{
    framebuff_t fb;
    framebuff_init(&fb, buff, 512);
    framebuff_push_u8(&fb, 0xCC);   // head
    framebuff_push_u8(&fb, addr);   // address
    framebuff_push_u8(&fb, 0x80);   // cmd
    framebuff_push_u8(&fb, 0x00);   // data
    framebuff_push_u8(&fb, (addr + 0x80) & 0xFF);   //checksum
    address_backup = addr;
    return framebuff_length(&fb);
}

uint8_t checksum_calc(void *buf, uint32_t size)
{
    uint8_t *ptr = buf;
    uint8_t result = 0;
    while (size--) result += *ptr++;
    return result;
}

int rst460_parse(uint32_t senid, void *strbuf, void *datbuf, uint32_t size)
{
    uint8_t head, addr, cmd, datlen, checksum;
    uint32_t time;
    int32_t x, y, t;

    if (size < 17) return 0;
    FRAMEBUFF_PARSE_BEGIN(datbuf);
    FRAMEBUFF_PARSE_POP_U8(head);
    if (head != 0xCC) return 1;
    FRAMEBUFF_PARSE_POP_U8(addr);
    if (addr != address_backup) return 1;
    FRAMEBUFF_PARSE_POP_U8(cmd);
    if (cmd != 0x70) return 1;
    FRAMEBUFF_PARSE_POP_U8(datlen);
    if (datlen != 0x0C) return 1;
    FRAMEBUFF_PARSE_POP_S32(x);
    SWAP32(x);
    FRAMEBUFF_PARSE_POP_S32(y);
    SWAP32(y);
    FRAMEBUFF_PARSE_POP_S32(t);
    SWAP32(t);
    FRAMEBUFF_PARSE_POP_U8(checksum);
    if (checksum_calc((uint8_t *)datbuf + 1, 15) != checksum) return 1;
    sprintf(strbuf, "%d|%d|%d|%d|%d",senid, rtc_get_time(), x, y, t);
    FRAMEBUFF_PARSE_END();
    return strlen(strbuf);
}

struct senproto_struct rst460_senproto = {rst460_prepare, rst460_parse};
