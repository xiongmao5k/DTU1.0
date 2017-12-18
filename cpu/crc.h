#ifndef SOFTWARE_CRC_H
#define SOFTWARE_CRC_H

#include "stdint.h"

uint32_t crc_calc(void *buff, uint32_t size);
uint32_t crc32_calc(void *buff, uint32_t size);
void crc_init(void);
#endif //SOFTWARE_CRC_H
