#include "stdint.h"
#include "stddef.h"
#include "stm32f10x.h"


#define SWAP_BYTE4(value) (((((((value) & 0xFF00FF00) >> 8) | (((value) & 0xFF00FF) << 8)) & 0xFFFF0000) >> 16) | ((((((value) & 0xFF00FF00) >> 8) | (((value) & 0xFF00FF) << 8)) & 0xFFFF) << 16))
#define SWAP_BIT8(value) \
do { \
    value = ((value & 0x55) << 1) | ((value & 0xAA) >> 1); \
    value = ((value & 0x33) << 2) | ((value & 0xCC) >> 2); \
    value = ((value & 0x0F) << 4) | ((value & 0xF0) >> 4); \
} while (0)
  
#define SWAP_BIT32(value) \
do {\
    value = ((value & 0x55555555) << 1) | ((value & 0xAAAAAAAA) >> 1); \
    value = ((value & 0x33333333) << 2) | ((value & 0xCCCCCCCC) >> 2); \
    value = ((value & 0x0F0F0F0F) << 4) | ((value & 0xF0F0F0F0) >> 4); \
    value = ((value & 0x00FF00FF) << 8) | ((value & 0xFF00FF00) >> 8); \
    value = ((value & 0x0000FFFF) << 16) | ((value & 0xFFFF0000) >> 16); \
} while(0)



void crc_init(void)
{
    RCC_AHBPeriphClockCmd(RCC_AHBPeriph_CRC, ENABLE);
    CRC_ResetDR();
}

static void swapBinaryArray(void *data, int size)
{
    uint8_t *ptr = data;
    while (size--) {
        SWAP_BIT8(*ptr);
        ptr += 1;
    }
}

uint32_t crc_calc(void *buff, uint32_t size)
{
    uint32_t cnt = size / 4;
    uint32_t align = size % 4;
    uint32_t *ptr = buff;
    uint32_t result = 0;
    CRC_ResetDR();
    swapBinaryArray(buff, size);
    while (cnt--) {
        CRC->DR = SWAP_BYTE4(*ptr);
        ptr += 1;
    }
    if (align != 0) {
        CRC->DR = SWAP_BYTE4(*ptr & ((1 << (align << 3)) - 1));
    }
    result = CRC->DR;
    SWAP_BIT32(result);
    return (result ^ 0xFFFFFFFF);
}

static inline uint32_t refin(uint32_t value)
{
    value = ((value & 0x55555555) << 1) | ((value & 0xAAAAAAAA) >> 1);
    value = ((value & 0x33333333) << 2) | ((value & 0xCCCCCCCC) >> 2);
    value = ((value & 0x0F0F0F0F) << 4) | ((value & 0xF0F0F0F0) >> 4);
    return value;
}

static inline uint32_t refout(uint32_t value)
{
    value = ((value & 0x55555555) << 1) | ((value & 0xAAAAAAAA) >> 1);
    value = ((value & 0x33333333) << 2) | ((value & 0xCCCCCCCC) >> 2);
    value = ((value & 0x0F0F0F0F) << 4) | ((value & 0xF0F0F0F0) >> 4);
    value = ((value & 0x00FF00FF) << 8) | ((value & 0xFF00FF00) >> 8);
    value = ((value & 0x0000FFFF) << 16) | ((value & 0xFFFF0000) >> 16);
    return value;
}

uint32_t crc32_calc(void *buff, uint32_t size)
{
    uint32_t align = size % 4;
    uint32_t cnt = size / 4;
    uint32_t *ptr = NULL;
    uint8_t *base = buff;
    uint32_t result = 0;
    CRC_ResetDR();
    switch (align) {
        while (cnt--) {
            CRC->DR = refin(SWAP_BYTE4(*ptr));
            ptr+=1;
            continue;
    case 0:
        ptr = buff;
        continue;
    case 1:
        CRC->DR = 0x6AA59E9D;
        CRC->DR = refin((uint32_t)base[0]);
        ptr = (uint32_t *)&base[1];
        continue;
    case 2:
        CRC->DR = 0x9746CD0A;
        CRC->DR = refin((uint32_t)((base[0] << 8) | base[1]));
        ptr = (uint32_t *)&base[2];
        continue;
    case 3:
        CRC->DR = 0xCC6021D0;
        CRC->DR = refin((uint32_t)((base[0] << 16) | (base[1] << 8) | base[2]));
        ptr = (uint32_t *)&base[3];
        continue;
        }
    default:
        break;
    }
    result = refout(CRC->DR);
    return ~result;
}
