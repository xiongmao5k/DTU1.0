#include "senproto.h"
#include "framebuff.h"
#include "stdio.h"
#include "rtc.h"
#include "string.h"

static uint8_t address_backup;

static uint16_t zcrc16(uint8_t *buffer, uint16_t buffer_length)
{
    uint8_t crc_hi = 0xFF; /* high CRC byte initialized */
    uint8_t crc_lo = 0xFF; /* low CRC byte initialized */
    unsigned int i; /* will index into CRC lookup */
    /* pass through message buffer */
    while (buffer_length--) {
        i = crc_hi ^ *buffer++; /* calculate the CRC  */
        crc_hi = crc_lo ^ table_crc_hi[i];
        crc_lo = table_crc_lo[i];
    }
    return (crc_hi << 8 | crc_lo);
}

int zbm001_prepare(void *buff, uint16_t addr)
{
    framebuff_t fb;
    framebuff_init(&fb, buff, 512);
    
    framebuff_push_u8(&fb, 0xA5);
    framebuff_push_u8(&fb, 0xA5);
    framebuff_push_u8(&fb, 0x99);
    framebuff_push_u8(&fb, 0x00);
    framebuff_push_u8(&fb, addr);
    framebuff_push_u8(&fb, 0x01);
    framebuff_push_u8(&fb, 0x01);
    framebuff_push_u8(&fb, 0x00);
    //framebuff_push_u8(&fb, 0x23);
    //framebuff_push_u8(&fb, 0x33);
    framebuff_push_u16(&fb, zcrc16(fb.buffer, 8));
    address_backup = addr;
    return framebuff_length(&fb);
}

int zbm001_parse(uint32_t senid, void *strbuf, void *datbuf, uint32_t size)
{
    uint8_t start1, start2, id, addr1, addr2, cmd, datlen, check1, check2, error, dataid;
    uint8_t data1, data2, data3, data4, data5, data6, data7, data8;
    uint16_t checksum;
    uint32_t tmp1, tmp2;
    float x, y;
    
    if(size < 19) return 0;
    FRAMEBUFF_PARSE_BEGIN(datbuf);
    FRAMEBUFF_PARSE_POP_U8(start1);
    FRAMEBUFF_PARSE_POP_U8(start2);
    FRAMEBUFF_PARSE_POP_U8(id);
    FRAMEBUFF_PARSE_POP_U8(addr1);
    FRAMEBUFF_PARSE_POP_U8(addr2);
    FRAMEBUFF_PARSE_POP_U8(cmd);
    FRAMEBUFF_PARSE_POP_U8(datlen);
    FRAMEBUFF_PARSE_POP_U8(error);
    FRAMEBUFF_PARSE_POP_U8(dataid);
    if (start1 != 0xA5 || start2 != 0xA5 || addr1 != address_backup || cmd != 0x01) {
        return 1;
    }
    FRAMEBUFF_PARSE_POP_U8(data1);
    FRAMEBUFF_PARSE_POP_U8(data2);
    FRAMEBUFF_PARSE_POP_U8(data3);
    FRAMEBUFF_PARSE_POP_U8(data4);
    tmp1 = (data1 << 24) | (data2 << 16) | (data3 << 8) | data4;
    x = *(float *)&tmp1;
    FRAMEBUFF_PARSE_POP_U8(data5);
    FRAMEBUFF_PARSE_POP_U8(data6);
    FRAMEBUFF_PARSE_POP_U8(data7);
    FRAMEBUFF_PARSE_POP_U8(data8);      
    tmp2 = (data5 << 24) | (data6 << 16) | (data7 << 8) | data8;
    y = *(float *)&tmp2;
    
    char buff[] = {start1,start2,id,addr1,addr2,cmd,datlen,error,dataid,data1,data2,data3,data4,data5,data6,data7,data8};
    FRAMEBUFF_PARSE_POP_U8(check1);
    FRAMEBUFF_PARSE_POP_U8(check2);
    checksum = (check2 << 8) | check1;
    if(checksum != zcrc16(buff, sizeof(buff))) return 1;
    sprintf (strbuf, "%d|%d|%.3f|%.3f", senid, rtc_get_time(), x, y);
    FRAMEBUFF_PARSE_END();

    return strlen(strbuf);
}

struct senproto_struct zbm001_senproto = {zbm001_prepare, zbm001_parse};
