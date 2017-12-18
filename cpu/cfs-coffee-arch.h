#ifndef SOFTWARE_CFS_COFFEE_ARCH_H
#define SOFTWARE_CFS_COFFEE_ARCH_H

#include "cfs-coffee.h"

#include "stdint.h"

#define FLASH_PAGE_SIZE     1024
#define FLASH_STARTA        0x0000000
#define FLASH_WORD_SIZE     4


/*---------------------------------------------------------------------------*/
/** \name Coffee port constants
 * @{
 */
/** Logical sector size */
#ifdef COFFEE_CONF_SECTOR_SIZE
#define COFFEE_SECTOR_SIZE     COFFEE_CONF_SECTOR_SIZE
#else
#define COFFEE_SECTOR_SIZE     FLASH_PAGE_SIZE
#endif
/** Logical page size */
#ifdef COFFEE_CONF_PAGE_SIZE
#define COFFEE_PAGE_SIZE       COFFEE_CONF_PAGE_SIZE
#else
#define COFFEE_PAGE_SIZE       (COFFEE_SECTOR_SIZE / 4)
#endif
/** Start offset of the file system */
#ifdef COFFEE_CONF_START
#define COFFEE_START           COFFEE_CONF_START
#else
#define COFFEE_START          (FLASH_STARTA + 1024 * 48)
#endif
/** Total size in bytes of the file system */
#ifdef COFFEE_CONF_SIZE
#define COFFEE_SIZE            COFFEE_CONF_SIZE
#else
#define COFFEE_SIZE            ((64-48-4) * 1024)
#endif
/** Maximal filename length */
#ifdef COFFEE_CONF_NAME_LENGTH
#define COFFEE_NAME_LENGTH     COFFEE_CONF_NAME_LENGTH
#else
#define COFFEE_NAME_LENGTH     40
#endif
/** Number of file cache entries */
#ifdef COFFEE_CONF_MAX_OPEN_FILES
#define COFFEE_MAX_OPEN_FILES  COFFEE_CONF_MAX_OPEN_FILES
#else
#define COFFEE_MAX_OPEN_FILES  5
#endif
/** Number of file descriptor entries */
#ifdef COFFEE_CONF_FD_SET_SIZE
#define COFFEE_FD_SET_SIZE     COFFEE_CONF_FD_SET_SIZE
#else
#define COFFEE_FD_SET_SIZE     5
#endif
/** Maximal amount of log table entries read in one batch */
#ifdef COFFEE_CONF_LOG_TABLE_LIMIT
#define COFFEE_LOG_TABLE_LIMIT COFFEE_CONF_LOG_TABLE_LIMIT
#else
#define COFFEE_LOG_TABLE_LIMIT 16
#endif
/** Default reserved file size */
#ifdef COFFEE_CONF_DYN_SIZE
#define COFFEE_DYN_SIZE        COFFEE_CONF_DYN_SIZE
#else
#define COFFEE_DYN_SIZE        (COFFEE_SECTOR_SIZE - 50)
#endif
/** Default micro-log size */
#ifdef COFFEE_CONF_LOG_SIZE
#define COFFEE_LOG_SIZE        COFFEE_CONF_LOG_SIZE
#else
#define COFFEE_LOG_SIZE        (4 * COFFEE_PAGE_SIZE)
#endif
/** Whether Coffee will use micro logs */
#ifdef COFFEE_CONF_MICRO_LOGS
#define COFFEE_MICRO_LOGS      COFFEE_CONF_MICRO_LOGS
#else
#define COFFEE_MICRO_LOGS      0
#endif
/** Whether files are expected to be appended to only */
#ifdef COFFEE_CONF_APPEND_ONLY
#define COFFEE_APPEND_ONLY     COFFEE_CONF_APPEND_ONLY
#else
#define COFFEE_APPEND_ONLY     0
#endif
/** @} */
/*---------------------------------------------------------------------------*/
/** \name Coffee port macros
 * @{
 */
/** Erase */
#define COFFEE_ERASE(sector) \
  cfs_coffee_arch_erase(sector)
/** Write */
#define COFFEE_WRITE(buf, size, offset) \
  cfs_coffee_arch_write((buf), (size), (offset))
/** Read */
#define COFFEE_READ(buf, size, offset) \
  cfs_coffee_arch_read((buf), (size), (offset))
/** @} */
/*---------------------------------------------------------------------------*/
/** \name Coffee port types
 * @{
 */
typedef int16_t coffee_page_t; /**< Page */
/** @} */
/*---------------------------------------------------------------------------*/
/** \name Coffee port functions
 * @{
 */

/** \brief Erases a device sector
 * \param sector Sector to erase
 */
void cfs_coffee_arch_erase(uint16_t sector);

/** \brief Writes a buffer to the device
 * \param buf Pointer to the buffer
 * \param size Byte size of the buffer
 * \param offset Device offset to write to
 */
void cfs_coffee_arch_write(const void *buf, unsigned int size,
                           cfs_offset_t offset);

/** \brief Reads from the device to a buffer
 * \param buf Pointer to the buffer
 * \param size Byte size of the buffer
 * \param offset Device offset to read from
 */
void cfs_coffee_arch_read(void *buf, unsigned int size, cfs_offset_t offset);


#endif //SOFTWARE_CFS_COFFEE_ARCH_H
