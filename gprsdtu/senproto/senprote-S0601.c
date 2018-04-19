#include "senproto.h"
#include "framebuff.h"
#include "stdio.h"
#include "rtc.h"
#include "string.h"

static uint8_t address_backup;

int S0610_prepare(void *buff, uint16_t addr)
{
    framebuff_t fb;
    framebuff_init(&fb, buff, 512);
    
    framebuff_push_u8(&fb, addr);
    framebuff_push_u8(&fb, 0x03);
    framebuff_push_u8(&fb, 0x00);
    framebuff_push_u8(&fb, 0x02);
    framebuff_push_u8(&fb, 0x00);
    framebuff_push_u8(&fb, 0x04);
    framebuff_push_u16(&fb, crc16(fb.buffer, 6));
    address_backup = addr;
    return framebuff_length(&fb);
}

int S0610_parse(uint32_t senid, void *strbuf, void *datbuf, uint32_t size)
{
    uint8_t addr, cmd, datlen, check1, check2;
    uint8_t data1, data2, data3, data4, data5, data6, data7, data8;
    uint16_t checksum;
    uint32_t x,y;
    
    if(size < 13) return 0;
    FRAMEBUFF_PARSE_BEGIN(datbuf);
    FRAMEBUFF_PARSE_POP_U8(addr);
    FRAMEBUFF_PARSE_POP_U8(cmd);
    FRAMEBUFF_PARSE_POP_U8(datlen);
    if (datlen != 0x08 || addr != address_backup || cmd != 0x03) {
        return 1;
    }
    FRAMEBUFF_PARSE_POP_U8(data1);
    FRAMEBUFF_PARSE_POP_U8(data2);
    FRAMEBUFF_PARSE_POP_U8(data3);
    FRAMEBUFF_PARSE_POP_U8(data4);
    FRAMEBUFF_PARSE_POP_U8(data5);
    FRAMEBUFF_PARSE_POP_U8(data6);
    FRAMEBUFF_PARSE_POP_U8(data7);
    FRAMEBUFF_PARSE_POP_U8(data8);

    x = (data1 << 24) | (data2 << 16) | (data3 << 8) | data4;
    y = (data5 << 24) | (data6 << 16) | (data7 << 8) | data8;
    
    char buff[] = {addr,cmd,datlen,data1,data2,data3,data4,data5,data6,data7,data8};
    FRAMEBUFF_PARSE_POP_U8(check1);
    FRAMEBUFF_PARSE_POP_U8(check2);
    checksum = (check2 << 8) | check1;
    if(checksum != crc16(buff, sizeof(buff))) return 1;
    sprintf (strbuf, "%d|%d|%d|%d", senid, rtc_get_time(), x, y);
    FRAMEBUFF_PARSE_END();
    
    return strlen(strbuf);
}

struct senproto_struct S0610_senproto = {S0610_prepare, S0610_parse};