/*
 * params_test.h
 *
 *  Created on: May 26, 2013
 *      Author: petera
 */

#ifndef PARAMS_TEST_H_
#define PARAMS_TEST_H_


#define SPIFFS_SINGLETON                    1
#define SPIFFS_CFG_PHYS_SZ(ignore)          (128 * 1024)
#define SPIFFS_CFG_PHYS_ERASE_SZ(ignore)    (4 * 1024)
#define SPIFFS_CFG_PHYS_ADDR(ignore)        (0)
#define SPIFFS_CFG_LOG_PAGE_SZ(ignore)      (128)
#define SPIFFS_CFG_LOG_BLOCK_SZ(ignore)     (4 * 1024)

#define SPIFFS_CACHE                        1
#define SPIFFS_CACHE_WR                     1
#define SPIFFS_TEMPORAL_FD_CACHE            1

#define SPIFFS_USE_MAGIC                    1
#define SPIFFS_USE_MAGIC_LENGTH             1

#define SPIFFS_HAL_CALLBACK_EXTRA           0
#define SPIFFS_FILEHDL_OFFSET               1

#define DEFAULT_NUM_FD                      16

#define SPIFFS_OBJ_META_LEN                 4

#define SPIFFS_LOCK(fs)
#define SPIFFS_UNLOCK(fs)
// dbg output
#define SPIFFS_DBG(args...)         //printf(args)
#define SPIFFS_GC_DBG(args...)      //printf(args)
#define SPIFFS_CACHE_DBG(args...)   //printf(args)
#define SPIFFS_CHECK_DBG(args...)   //printf(args)


#define DEFAULT_NUM_CACHE_PAGES             8

#define ASSERT(c, m) real_assert((c),(m), __FILE__, __LINE__);
void real_assert(int c, const char *n, const char *file, int l);


// needed types
typedef signed int      s32_t;
typedef unsigned int    u32_t;
typedef signed short    s16_t;
typedef unsigned short  u16_t;
typedef signed char     s8_t;
typedef unsigned char   u8_t;

#endif /* PARAMS_TEST_H_ */
