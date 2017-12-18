#ifndef EDIT_SPIFLASH_H
#define EDIT_SPIFLASH_H

#include "stdint.h"
#include "stdio.h"

void stlink_write (uint32_t buf, int addr);
void stlink_read (int addr);
void SPI_FLASH_ChipErase(void);
void SPI_FLASH_BlockErase(uint32_t address);
void SPI_FLASH_SectorErase(uint32_t address);
void SPI_FLASH_Write(uint32_t address, void *buffer, size_t size);
void SPI_FLASH_Read(uint32_t address, void *buffer, size_t size);

#endif //EDIT_SPIFLASH_H
