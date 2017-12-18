#include "cfs-coffee.h"
#include "cfs-coffee-arch.h"

#include "stm32f10x.h"
#include "stdint.h"
#include "stdlib.h"
#include "string.h"

static void _flash_program_page(uint32_t address, void *buf)
{
    uint32_t *src = buf;
    uint32_t *dst = (void *)(address & ~(FLASH_PAGE_SIZE - 1));
    uint32_t count = FLASH_PAGE_SIZE / FLASH_WORD_SIZE;
    FLASH_Unlock();
    FLASH_ErasePage((uint32_t)dst);
    while (count--) {
        FLASH_ProgramWord((uint32_t)dst++, *src++);
    }
    FLASH_Lock();
}

static uint8_t flash_page_buf[FLASH_PAGE_SIZE];

void cfs_coffee_arch_erase(uint16_t sector)
{
    FLASH_Unlock();
    FLASH_ErasePage(COFFEE_START + sector * COFFEE_SECTOR_SIZE);
    FLASH_Lock();
}

void cfs_coffee_arch_write(const void *buf, unsigned int size, cfs_offset_t offset)
{
    uint8_t *src = (void *)buf;
    uint8_t *dst = NULL;
    uint32_t flash_addr = COFFEE_START + offset;
    uint32_t flash_current_page = (flash_addr & ~(FLASH_PAGE_SIZE - 1));
    uint32_t flash_next_page = flash_current_page + FLASH_PAGE_SIZE;
    if (flash_addr + size > flash_next_page) {
        uint32_t count = 0;
        memcpy(flash_page_buf, (void*)flash_current_page, FLASH_PAGE_SIZE);
        count = flash_next_page - flash_addr;
        dst = &flash_page_buf[flash_addr - flash_current_page];
        while (count--) *dst++ = ~*src++;
        _flash_program_page(flash_current_page, flash_page_buf);
        memcpy(flash_page_buf, (void *)flash_next_page, FLASH_PAGE_SIZE);
        count = flash_addr + size - flash_next_page;
        dst = &flash_page_buf[0];
        while (count--) *dst++ = ~*src++;
        _flash_program_page(flash_next_page, flash_page_buf);
    } else {
        memcpy(flash_page_buf, (void*)flash_current_page, FLASH_PAGE_SIZE);
        dst = &flash_page_buf[flash_addr - flash_current_page];
        while (size--) *dst++ = ~*src++;
        _flash_program_page(flash_current_page, flash_page_buf);
    }
}

void cfs_coffee_arch_read(void *buf, unsigned int size, cfs_offset_t offset)
{
    const uint8_t *src = (const void *)(COFFEE_START + offset);
    uint8_t  *dst = buf;

    while (size--) *dst++ = ~*src++;
}
