#include "spiflash.h"
#include "spiffs.h"
#include "string.h"


#define LOG_PAGE_SIZE   SPIFFS_CFG_LOG_PAGE_SZ(1)

spiffs xFs;
static uint8_t spiffs_work_buf[LOG_PAGE_SIZE * 2];
static uint8_t spiffs_fds[32 * 4];
static uint8_t spiffs_cache_buf[(LOG_PAGE_SIZE + 32) * 4];


static int32_t
prvSPIFFS_Read(uint32_t ulAddress, uint32_t ulSize, uint8_t *pvDst) ;
static int32_t
prvSPIFFS_Write(uint32_t ulAddress, uint32_t ulSize, uint8_t *pvSrc) ;
static int32_t
prvSPIFFS_Erase(uint32_t ulAddress, uint32_t ulSize) ;


void
SPIFFS_DiskInit(void) {
    spiffs_config xCfg;
    int32_t lResult = 0;
    memset(&xCfg, 0x00, sizeof(xCfg));
    xCfg.hal_read_f = prvSPIFFS_Read;
    xCfg.hal_write_f = prvSPIFFS_Write;
    xCfg.hal_erase_f = prvSPIFFS_Erase;
    lResult = SPIFFS_mount(
            &xFs, &xCfg,
            spiffs_work_buf,
            spiffs_fds, sizeof(spiffs_fds),
            spiffs_cache_buf, sizeof(spiffs_cache_buf),
            NULL);
    if (lResult == SPIFFS_ERR_NOT_A_FS) {
        SPI_FLASH_ChipErase();
        SPIFFS_format(&xFs);
        lResult = SPIFFS_mount(
                &xFs, &xCfg,
                spiffs_work_buf,
                spiffs_fds, sizeof(spiffs_fds),
                spiffs_cache_buf, sizeof(spiffs_cache_buf),
                NULL);
    }
}


static int32_t
prvSPIFFS_Read(uint32_t ulAddress, uint32_t ulSize, uint8_t *pvDst) {
    SPI_FLASH_Read(ulAddress, pvDst, ulSize);
    return SPIFFS_OK;
}


static int32_t
prvSPIFFS_Write(uint32_t ulAddress, uint32_t ulSize, uint8_t *pvSrc) {
    SPI_FLASH_Write(ulAddress, pvSrc, ulSize);
    return SPIFFS_OK;
}


static int32_t
prvSPIFFS_Erase(uint32_t ulAddress, uint32_t ulSize) {
    uint32_t ulCnt = ulSize / (4 * 1024);
    while (ulCnt--) {
        SPI_FLASH_SectorErase(ulAddress);
        ulAddress += (4 * 1024);
    }
    return SPIFFS_OK;
}

//flash config
#define FLASH_SAVE_FLAG     0
#define FLASH_BLOCK_SUM     32
#define FLASH_BLOCK_SIZE    4096


#define DL_FS_MAX_FILE_SUM       8
#define DL_FS_MAX_FILE_NAME_LEN  32
#pragma pack(4)


typedef struct {
    char file_name[DL_FS_MAX_FILE_SUM][DL_FS_MAX_FILE_NAME_LEN];
    uint8_t file_content_index[DL_FS_MAX_FILE_SUM];  //start block index
    uint32_t file_size[DL_FS_MAX_FILE_SUM];
    uint32_t curr_file_seek_addr[DL_FS_MAX_FILE_SUM];
    uint32_t block_use_flag;
    uint32_t file_open_flag;
}inner_fs_header_t;

typedef struct {
    uint16_t crc16;
    inner_fs_header_t fs_header;
    uint8_t  valid_flag;
}dl_fs_header_t;


typedef struct {
    uint8_t valid;
    uint8_t cur_block_index;
    uint8_t next_block_index;
    uint16_t content_len;
    uint8_t content[0];
}inner_fs_block_t;

typedef struct {
    uint16_t crc16;
    inner_fs_block_t fs_block;
}dl_fs_block_t;

#pragma pack()
uint16_t inner_make_crc16(uint8_t *msg, uint16_t len);

#define DL_FS_BLOCK_FILE_CONTENT_MAX_SIZE   (4096 - sizeof(dl_fs_block_t))

static dl_fs_header_t g_fs_header;
static dl_fs_block_t g_fs_block;

#define dl_fs_debug
#define PRINTF
#if 0

#define PRINTF printf
static u8 test_buffer[128*1024];


void SPI_FLASH_SectorErase(uint32_t address)
{
    //PRINTF("SPI_FLASH_SectorErase addr: %08X\n", address);
    memset(&test_buffer[address], 0xFF, 4096);
}

void SPI_FLASH_Write(uint32_t address, void *buffer, u32 size)
{
    //PRINTF("SPI_FLASH_Write addr: %08X\n", address);
    memcpy(&test_buffer[address], buffer, size);
}

void SPI_FLASH_Read(uint32_t address, void *buffer, u32 size)
{
    //PRINTF("SPI_FLASH_Read addr: %08X\n", address);
    memcpy(buffer, &test_buffer[address], size);
}


void dl_fs_debug(void)
{
    int i;
    int j;
    dl_fs_block_t fs_block;
    static char b[4096];

    for(i=0; i<DL_FS_MAX_FILE_SUM; i++) {
        PRINTF("header: %d, %d, size=%d\n", i, g_fs_header.fs_header.file_content_index[i],g_fs_header.fs_header.file_size[i]);
    }

    for(i=1; i<FLASH_BLOCK_SUM; i++) {
        SPI_FLASH_Read(i*4096, b, sizeof(b));
        memcpy(&fs_block, b, sizeof(fs_block));
        if(fs_block.crc16 == inner_make_crc16(&fs_block.fs_block, sizeof(fs_block.fs_block))) {
            PRINTF("block(%d): len=%d\n", i, fs_block.fs_block.content_len);
            PRINTF("block(%d): cur=%d\n", i, fs_block.fs_block.cur_block_index);
            PRINTF("block(%d): nex=%d\n", i, fs_block.fs_block.next_block_index);
            for(j=0; j<fs_block.fs_block.content_len; j++) {
                if((b+sizeof(fs_block))[j] != 0) {
                    PRINTF("block(%d): i=%d, v=%02X\n", i,j,(b+sizeof(fs_block))[j]);
                }
            }
        }
    }
}
#endif

int dl_fs_init(void)
{
    SPI_FLASH_Read(0, &g_fs_header, sizeof(dl_fs_header_t));
    if(inner_make_crc16((uint8_t *)&g_fs_header.fs_header, sizeof(g_fs_header.fs_header)) == g_fs_header.crc16) {
        g_fs_header.valid_flag = 1;
        // PRINTF("dl_fs_init reload ok\n");
        return 0;
    }

    g_fs_header.valid_flag = 0;
#if FLASH_SAVE_FLAG
    SPI_FLASH_Read((FLASH_BLOCK_SUM/2) * 4096, &g_fs_header, sizeof(dl_fs_header_t));
    if(inner_make_crc16(&g_fs_header.fs_header, sizeof(g_fs_header.fs_header)) == g_fs_header.crc16) {
        g_fs_header.valid_flag = 1;
        return 0;
    }
#endif

    memset(&g_fs_header, 0, sizeof(g_fs_header));
    g_fs_header.valid_flag = 1;

    // PRINTF("dl_fs_init init ok\n");
    return 0;
}


int inner_fs_file_is_exist(char *file_name)
{
    uint8_t i;
    if(g_fs_header.valid_flag) {
        for(i=0; i<DL_FS_MAX_FILE_SUM; i++) {
            if(!strcmp(file_name, g_fs_header.fs_header.file_name[i])) {
                return i;
            }
        }
    }

    return -1;
}

int inner_fs_get_free_block(void)
{
    uint8_t i;
    uint8_t block_sum = FLASH_BLOCK_SUM;
    uint32_t block_flag = g_fs_header.fs_header.block_use_flag;

    #if FLASH_SAVE_FLAG
        block_sum = FLASH_BLOCK_SUM/2;
    #endif
    for(i=1; i<block_sum; i++) {
        if(((block_flag>>i) & 0x00000001) == 0) {
            g_fs_header.fs_header.block_use_flag |= ((uint32_t)1<<i);
            return i;
        }

    }
    return -1;
}

int inner_fs_file_ceate(char *file_name)
{
    uint8_t i;
    int res;

    if(g_fs_header.valid_flag) {
        for(i=0; i<DL_FS_MAX_FILE_SUM; i++) {
            if(g_fs_header.fs_header.file_name[i][0] == 0) {
                res = inner_fs_get_free_block();
                if(res < 0) {
                    return -1;
                }
                g_fs_header.fs_header.file_content_index[i] = res;
                strcpy(g_fs_header.fs_header.file_name[i], file_name);
                g_fs_header.fs_header.curr_file_seek_addr[i] = (uint32_t)(g_fs_header.fs_header.file_content_index[i]) * 4096 + sizeof(g_fs_block);
                g_fs_header.fs_header.file_size[i] = 0;
                g_fs_header.fs_header.file_open_flag |= ((uint32_t)1<<i);

                g_fs_block.fs_block.cur_block_index = g_fs_header.fs_header.file_content_index[i];
                g_fs_block.fs_block.next_block_index = g_fs_block.fs_block.cur_block_index;
                g_fs_block.fs_block.content_len = 0;
                g_fs_block.fs_block.valid = 1;
                g_fs_block.crc16 = inner_make_crc16((uint8_t *)&g_fs_block.fs_block, sizeof(g_fs_block.fs_block));
                SPI_FLASH_SectorErase(g_fs_header.fs_header.curr_file_seek_addr[i]-sizeof(g_fs_block));
                SPI_FLASH_Write(g_fs_header.fs_header.curr_file_seek_addr[i]-sizeof(g_fs_block), &g_fs_block, sizeof(g_fs_block));
//                PRINTF("new file: file_opflag:%08X\n", g_fs_header.fs_header.file_open_flag);
//                PRINTF("new file: file_name:%s\n", g_fs_header.fs_header.file_name[i]);
//                PRINTF("new file: seek_addr:%08X\n", g_fs_header.fs_header.curr_file_seek_addr[i]);
//                PRINTF("new file: curr_indx:%d\n", g_fs_header.fs_header.file_content_index[i]);
//                PRINTF("new file: crc16:%04X\n", g_fs_block.crc16);
                return i;
            }
        }
    }

    return -1;
}

int inner_fs_file_jump_end(int i)
{
    uint32_t addr;

    addr = (uint32_t)(g_fs_header.fs_header.file_content_index[i]) * 4096;

    while(1) {
        SPI_FLASH_Read(addr, &g_fs_block, sizeof(g_fs_block));
        if(g_fs_block.crc16 != inner_make_crc16((uint8_t *)&g_fs_block.fs_block, sizeof(g_fs_block.fs_block))) {
//            PRINTF("inner_fs_file_jump_end crc err\n");
            return -1;
        }
        if(g_fs_block.fs_block.cur_block_index != g_fs_block.fs_block.next_block_index) {
            addr = (uint32_t)(g_fs_block.fs_block.next_block_index) * 4096;
        }
        else {
            break;
        }
    }

    g_fs_header.fs_header.curr_file_seek_addr[i] = addr+sizeof(g_fs_block)+g_fs_block.fs_block.content_len;

//    PRINTF("inner_fs_file_jump_end ok, addr=0x%08X+%d\n", addr, sizeof(g_fs_block)+g_fs_block.fs_block.content_len);
    return 0;
}

int dl_SPIFFS_stat(void *fs, char *file_name, void *a)
{
    int res = inner_fs_file_is_exist(file_name);

    if(res >= 0) {
        return 0;
    }

    return -1;
}

int dl_SPIFFS_lseek(void *fs, int fd, int len, int whence)
{
    int i;

    if(fd < 0 && fd >= DL_FS_MAX_FILE_SUM) {
        return fd;
    }

    i = fd;

    int real_len = (len/4088+1)*sizeof(g_fs_block) + len;


    if((g_fs_header.fs_header.file_open_flag & ((uint32_t)1<<i)) == 0) {
        return -1; //need to open file
    }

    if(whence == SPIFFS_SEEK_SET) {
        g_fs_header.fs_header.curr_file_seek_addr[i] = (uint32_t)(g_fs_header.fs_header.file_content_index[i])*4096+real_len;
        // PRINTF2("SEEK = %08x, %d\n", g_fs_header.fs_header.curr_file_seek_addr[i], g_fs_header.fs_header.curr_file_seek_addr[i]);
        return 0;
    }

    if(whence == SPIFFS_SEEK_CUR) {
        g_fs_header.fs_header.curr_file_seek_addr[i] += len;
        if(g_fs_header.fs_header.curr_file_seek_addr[i] % 4096 < sizeof(g_fs_block)) {
            g_fs_header.fs_header.curr_file_seek_addr[i] += sizeof(g_fs_block);
        }
        return 0;
    }

    if(whence == SPIFFS_SEEK_END) {
        return inner_fs_file_jump_end(i);
    }

    return -1;
}





int dl_SPIFFS_open(void *fs, char *file_name, uint16_t file_flag, uint16_t file_mode)
{
    int fd = inner_fs_file_is_exist(file_name);

    if(fd < 0) {
        if(SPIFFS_CREAT & file_flag) {
            fd = inner_fs_file_ceate(file_name);
            if(fd < 0) {
//                PRINTF("inner_fs_file_ceate err\n");
                return fd;
            }
//            PRINTF("inner_fs_file_ceate ok\n");
            return fd;
        }
    }
    else {
        g_fs_header.fs_header.file_open_flag |= ((uint32_t)1<<fd);
        if(SPIFFS_APPEND & file_flag) {
            if(dl_SPIFFS_lseek(fs, fd, 0, SPIFFS_SEEK_END) < 0) {
                g_fs_header.fs_header.file_open_flag &= ~((uint32_t)1<<fd);
//                PRINTF("dl_SPIFFS_lseek SPIFFS_SEEK_END ERR\n");
                return -1;
            }
        }
        else {
            if(dl_SPIFFS_lseek(fs, fd, 0, SPIFFS_SEEK_SET) < 0) {
                g_fs_header.fs_header.file_open_flag &= ~((uint32_t)1<<fd);
//                PRINTF("dl_SPIFFS_lseek SPIFFS_SEEK_SET ERR\n");
                return -1;
            }
        }

        return fd;
    }

    return -1;
}



int dl_SPIFFS_read(void *fs, int fd, uint8_t *buf, int len)
{
    int i;
    int curr_size;
    uint32_t addr;
    int copy_sum = 0;
    int temp_size;

    if(fd < 0 && fd >= DL_FS_MAX_FILE_SUM) {
        // PRINTF("dl_SPIFFS_read: fd err\n");
        return fd;
    }

    i = fd;
    if(len > g_fs_header.fs_header.file_size[i]) {
        len = g_fs_header.fs_header.file_size[i];
        // PRINTF2("dl_SPIFFS_read: max_len=%d\n", len);
    }


    while(1) {
        if(g_fs_header.fs_header.curr_file_seek_addr[i] % 4096 < sizeof(g_fs_block)) {
            g_fs_header.fs_header.curr_file_seek_addr[i] += sizeof(g_fs_block);
        }

        addr = g_fs_header.fs_header.curr_file_seek_addr[i]/4096*4096;
        curr_size = g_fs_header.fs_header.curr_file_seek_addr[i]%4096 - sizeof(g_fs_block);
        SPI_FLASH_Read(addr, &g_fs_block, sizeof(g_fs_block));
        if(g_fs_block.crc16 != inner_make_crc16((uint8_t *)&g_fs_block.fs_block, sizeof(g_fs_block.fs_block))) {
            // PRINTF2("dl_SPIFFS_read: crc err\n");
            return -1;
        }
        if(g_fs_block.fs_block.content_len>curr_size) {
            temp_size = g_fs_block.fs_block.content_len-curr_size;
            if(len-copy_sum > temp_size) {
                // PRINTF2("read1 seek=%d\n", g_fs_header.fs_header.curr_file_seek_addr[i]%4096);
                SPI_FLASH_Read(g_fs_header.fs_header.curr_file_seek_addr[i], buf, temp_size);
                g_fs_header.fs_header.curr_file_seek_addr[i] += temp_size;
                // PRINTF2("dl_SPIFFS_read: read ok1, len=%d\n", temp_size);
                copy_sum += temp_size;
                if(g_fs_block.fs_block.cur_block_index != g_fs_block.fs_block.next_block_index) {
                    g_fs_header.fs_header.curr_file_seek_addr[i] = (uint32_t)(g_fs_block.fs_block.next_block_index)*4096+sizeof(g_fs_block);
                    // PRINTF2("dl_SPIFFS_read: next block = %08X\n", g_fs_header.fs_header.curr_file_seek_addr[i]);
                }
                else {
                    //dl_fs_debug();
                    return copy_sum;
                }
            }
            else {
                // PRINTF2("read3 seek=0x%08x, %d\n", g_fs_header.fs_header.curr_file_seek_addr[i], g_fs_header.fs_header.curr_file_seek_addr[i]%4096);
                SPI_FLASH_Read(g_fs_header.fs_header.curr_file_seek_addr[i], buf+copy_sum, len-copy_sum);
                g_fs_header.fs_header.curr_file_seek_addr[i] += (len-copy_sum);
                copy_sum += (len-copy_sum);
                // PRINTF2("dl_SPIFFS_read: read ok2, len=%d\n", copy_sum);
                //dl_fs_debug();
                return copy_sum;
            }
        }
        else if(g_fs_block.fs_block.content_len == curr_size){
            // PRINTF2("dl_SPIFFS_read: read end:%d\n", curr_size);
            return 0;
        }
        else {
            // PRINTF2("dl_SPIFFS_read: inner err\n");
            return -1;
        }
    }
}

#define dl_max(x, y) ((x) < (y) ? (y) : (x))

int dl_SPIFFS_write(void *fs, int fd, uint8_t *buf, int len)
{
    int i;
    int curr_size;
    uint32_t addr;
    //int temp_size;
    int no_new_block = 0;
    uint8_t *malloc_buf;
    int new_block_index;
    int temp_len;

    if(fd < 0 && fd >= DL_FS_MAX_FILE_SUM) {
        return fd;
    }

    i = fd;

    #if FLASH_SAVE_FLAG
    if(g_fs_header.fs_header.block_use_flag & 0x0000FFFE == 0x0000FFFE) {
        // PRINTF2("no_new_block\n");
        no_new_block = 1;
    }
    #else
    if(g_fs_header.fs_header.block_use_flag & 0xFFFFFFFE == 0xFFFFFFFE) {
        // PRINTF2("no_new_block\n");
        no_new_block = 1;
    }
    #endif
    addr = g_fs_header.fs_header.curr_file_seek_addr[i]/4096*4096;
    curr_size = g_fs_header.fs_header.curr_file_seek_addr[i]%4096 - sizeof(g_fs_block);
    SPI_FLASH_Read(addr, &g_fs_block, sizeof(g_fs_block));
    if(g_fs_block.crc16 != inner_make_crc16((uint8_t *)&g_fs_block.fs_block, sizeof(g_fs_block.fs_block))) {
        // PRINTF2("dl_SPIFFS_write crc err:%04X\n", g_fs_block.crc16);
        return -1;
    }
    if(g_fs_block.fs_block.cur_block_index == g_fs_block.fs_block.next_block_index) {
        if(DL_FS_BLOCK_FILE_CONTENT_MAX_SIZE-curr_size > len) {
            malloc_buf = malloc(4096);
            if(!malloc_buf) {
                return -1;
            }
            //SPI_FLASH_Read(addr, malloc_buf, sizeof(g_fs_block)+curr_size);
            SPI_FLASH_Read(addr, malloc_buf, sizeof(g_fs_block)+g_fs_block.fs_block.content_len);
            g_fs_header.fs_header.file_size[i] += (dl_max(g_fs_block.fs_block.content_len, curr_size+len) - g_fs_block.fs_block.content_len);
            g_fs_block.fs_block.content_len = dl_max(g_fs_block.fs_block.content_len, curr_size+len);
            g_fs_block.fs_block.valid = 1;
            g_fs_block.crc16 = inner_make_crc16((uint8_t *)&g_fs_block.fs_block, sizeof(g_fs_block.fs_block));
            g_fs_header.fs_header.curr_file_seek_addr[i] += len;

            memcpy(malloc_buf, &g_fs_block, sizeof(g_fs_block));
            memcpy(malloc_buf+sizeof(g_fs_block)+curr_size, buf, len);

            SPI_FLASH_SectorErase(addr);
            //SPI_FLASH_Write(addr, malloc_buf, sizeof(g_fs_block)+curr_size+len);
            SPI_FLASH_Write(addr, malloc_buf, sizeof(g_fs_block)+g_fs_block.fs_block.content_len);
            //dl_fs_debug();
            free(malloc_buf);
            // PRINTF2("write2 seek=%d\n", g_fs_header.fs_header.curr_file_seek_addr[i]%4096);
            // PRINTF2("dl_SPIFFS_write write2: total=%d, w=%d, %d\n", g_fs_header.fs_header.file_size[i], sizeof(g_fs_block)+curr_size+len, g_fs_block.fs_block.content_len);
            return len;
        }
        else {
            if(no_new_block) {
                return -1;
            }
            new_block_index = inner_fs_get_free_block();

            //modify curr block
            addr = (uint32_t)(g_fs_block.fs_block.cur_block_index)*4096;
            malloc_buf = malloc(4096);
            if(!malloc_buf) {
                return -1;
            }
            SPI_FLASH_Read(addr, malloc_buf, sizeof(g_fs_block)+g_fs_block.fs_block.content_len);
            g_fs_block.fs_block.next_block_index = new_block_index;
            g_fs_header.fs_header.file_size[i] += (DL_FS_BLOCK_FILE_CONTENT_MAX_SIZE-g_fs_block.fs_block.content_len);
            g_fs_block.fs_block.content_len = DL_FS_BLOCK_FILE_CONTENT_MAX_SIZE;
            g_fs_block.crc16 = inner_make_crc16((uint8_t *)&g_fs_block.fs_block, sizeof(g_fs_block.fs_block));
            memcpy(malloc_buf, &g_fs_block, sizeof(g_fs_block));
            memcpy(
                malloc_buf+sizeof(g_fs_block)+curr_size,
                buf,
                DL_FS_BLOCK_FILE_CONTENT_MAX_SIZE-curr_size
            );
            SPI_FLASH_SectorErase(addr);
            SPI_FLASH_Write(addr, malloc_buf, 4096);
            //dl_fs_debug();
            free(malloc_buf);
            // PRINTF2("dl_SPIFFS_write write3: total=%d, w=%d, %d\n", g_fs_header.fs_header.file_size[i], DL_FS_BLOCK_FILE_CONTENT_MAX_SIZE-curr_size, g_fs_block.fs_block.content_len);
            malloc_buf = malloc(4096);
            if(!malloc_buf) {
                return -1;
            }

            addr = (uint32_t)(g_fs_block.fs_block.next_block_index)*4096;

            g_fs_block.fs_block.cur_block_index = g_fs_block.fs_block.next_block_index;
            g_fs_block.fs_block.content_len = len-(DL_FS_BLOCK_FILE_CONTENT_MAX_SIZE-curr_size);
            g_fs_block.fs_block.valid = 1;
            g_fs_block.crc16 = inner_make_crc16((uint8_t *)&g_fs_block.fs_block, sizeof(g_fs_block.fs_block));
            g_fs_header.fs_header.curr_file_seek_addr[i] = addr+sizeof(g_fs_block)+(len-(DL_FS_BLOCK_FILE_CONTENT_MAX_SIZE-curr_size));

            memcpy(malloc_buf, &g_fs_block, sizeof(g_fs_block));
            if(len-(DL_FS_BLOCK_FILE_CONTENT_MAX_SIZE-curr_size)) {
                memcpy(
                    malloc_buf+sizeof(g_fs_block),
                    buf+(DL_FS_BLOCK_FILE_CONTENT_MAX_SIZE-curr_size),
                    len-(DL_FS_BLOCK_FILE_CONTENT_MAX_SIZE-curr_size)
                );
            }

            SPI_FLASH_SectorErase(addr);
            SPI_FLASH_Write(addr, malloc_buf, sizeof(g_fs_block)+(len-(DL_FS_BLOCK_FILE_CONTENT_MAX_SIZE-curr_size)));

            free(malloc_buf);

            g_fs_header.fs_header.file_size[i] += (len-(DL_FS_BLOCK_FILE_CONTENT_MAX_SIZE-curr_size));
            //dl_fs_debug();
            // PRINTF2("write4 seek=%d\n", g_fs_header.fs_header.curr_file_seek_addr[i]%4096);
            // PRINTF2("dl_SPIFFS_write write4: total=%d, w=%d, %d\n", g_fs_header.fs_header.file_size[i], sizeof(g_fs_block)+(len-(DL_FS_BLOCK_FILE_CONTENT_MAX_SIZE-curr_size)), g_fs_block.fs_block.content_len);
            return len;
        }
    }
    else {
        if(DL_FS_BLOCK_FILE_CONTENT_MAX_SIZE-curr_size > len) {
            malloc_buf = malloc(4096);
            if(!malloc_buf) {
                return -1;
            }
            SPI_FLASH_Read(addr, malloc_buf, 4096);
            g_fs_header.fs_header.curr_file_seek_addr[i] += len;

            memcpy(malloc_buf+sizeof(g_fs_block)+curr_size, buf, len);

            SPI_FLASH_SectorErase(addr);
            SPI_FLASH_Write(addr, malloc_buf, 4096);
            free(malloc_buf);
            // PRINTF2("write5 seek=%d\n", g_fs_header.fs_header.curr_file_seek_addr[i]%4096);
            // PRINTF2("dl_SPIFFS_write write5: addr=%08X, size=%d\n", addr, sizeof(g_fs_block)+curr_size+len);
            return len;
        }
        else {
            //modify curr block
            addr = (uint32_t)(g_fs_block.fs_block.cur_block_index)*4096;
            malloc_buf = malloc(4096);
            if(!malloc_buf) {
                return -1;
            }
            SPI_FLASH_Read(addr, malloc_buf, sizeof(g_fs_block)+g_fs_block.fs_block.content_len);
            memcpy(
                malloc_buf+sizeof(g_fs_block)+curr_size,
                buf,
                DL_FS_BLOCK_FILE_CONTENT_MAX_SIZE-curr_size
            );
            SPI_FLASH_SectorErase(addr);
            SPI_FLASH_Write(addr, malloc_buf, sizeof(g_fs_block)+g_fs_block.fs_block.content_len);
            free(malloc_buf);

            malloc_buf = malloc(4096);
            if(!malloc_buf) {
                return -1;
            }
            addr = (uint32_t)(g_fs_block.fs_block.next_block_index)*4096;
            SPI_FLASH_Read(addr, malloc_buf, 4096);
            memcpy(&g_fs_block, malloc_buf, sizeof(g_fs_block));
            if(g_fs_block.crc16 != inner_make_crc16((uint8_t *)&g_fs_block.fs_block, sizeof(g_fs_block.fs_block))) {
                // PRINTF("dl_SPIFFS_write crc err2:%04X\n", g_fs_block.crc16);
                free(malloc_buf);
                return -1;
            }

            temp_len = dl_max(g_fs_block.fs_block.content_len, len-(DL_FS_BLOCK_FILE_CONTENT_MAX_SIZE-curr_size));
            g_fs_header.fs_header.file_size[i] += (temp_len - g_fs_block.fs_block.content_len);
            g_fs_block.fs_block.content_len = temp_len;
            g_fs_block.fs_block.valid = 1;
            g_fs_block.crc16 = inner_make_crc16((uint8_t *)&g_fs_block.fs_block, sizeof(g_fs_block.fs_block));
            g_fs_header.fs_header.curr_file_seek_addr[i] = addr+sizeof(g_fs_block)+g_fs_block.fs_block.content_len;

            memcpy(malloc_buf, &g_fs_block, sizeof(g_fs_block));
            memcpy(
                malloc_buf+sizeof(g_fs_block),
                buf+(DL_FS_BLOCK_FILE_CONTENT_MAX_SIZE-curr_size),
                len-(DL_FS_BLOCK_FILE_CONTENT_MAX_SIZE-curr_size)
            );

            SPI_FLASH_SectorErase(addr);
            SPI_FLASH_Write(addr, malloc_buf, sizeof(g_fs_block)+g_fs_block.fs_block.content_len);
            free(malloc_buf);

            // PRINTF2("write6 seek=%d\n", g_fs_header.fs_header.curr_file_seek_addr[i]%4096);
            return len;
        }
    }
}



int dl_SPIFFS_close(void *fs, int fd)
{
    int i;
    dl_fs_header_t *fs_header;

//    PRINTF("dl_SPIFFS_close1: fd=%d, file_open_flag = %08X\n", fd, g_fs_header.fs_header.file_open_flag);
    if(fd < 0 && fd >= DL_FS_MAX_FILE_SUM) {
        return fd;
    }

    i = fd;

    g_fs_header.fs_header.file_open_flag &= ~((uint32_t)1<<i);

    fs_header = malloc(sizeof(dl_fs_header_t));
    if(fs_header == NULL) {
        return -1;
    }
    SPI_FLASH_Read(0, fs_header, sizeof(dl_fs_header_t));
    if(memcmp(&fs_header->fs_header.file_size, &g_fs_header.fs_header.file_size, sizeof(g_fs_header.fs_header.file_size)) == 0 &&
       memcmp(&fs_header->fs_header.file_content_index, &g_fs_header.fs_header.file_content_index, sizeof(g_fs_header.fs_header.file_content_index)) == 0 &&
       memcmp(&fs_header->fs_header.file_name, &g_fs_header.fs_header.file_name, sizeof(g_fs_header.fs_header.file_name)) == 0) {
//        PRINTF("dl_SPIFFS_close2: same\n");
        free(fs_header);
        return 0;
    }

    free(fs_header);
    g_fs_header.crc16 = inner_make_crc16((uint8_t *)&g_fs_header.fs_header, sizeof(g_fs_header.fs_header));
    SPI_FLASH_SectorErase(0);
    SPI_FLASH_Write(0, &g_fs_header, sizeof(g_fs_header));
    #if FLASH_SAVE_FLAG
    SPI_FLASH_SectorErase((FLASH_BLOCK_SUM/2) * 4096);
    SPI_FLASH_Write((FLASH_BLOCK_SUM/2) * 4096, &g_fs_header, sizeof(g_fs_header));
    #endif
//    PRINTF("dl_SPIFFS_close2: file_open_flag = %08X\n", g_fs_header.fs_header.file_open_flag);
    return 0;
}


int dl_SPIFFS_fflush(void *fs, int fd)
{
    int i;
    if(fd < 0 && fd >= DL_FS_MAX_FILE_SUM) {
        return fd;
    }

    i = fd;

    if((g_fs_header.fs_header.file_open_flag & ((uint32_t)1<<i)) == 0) {
        return -1; //need to open file
    }

    if(dl_SPIFFS_lseek(fs, fd, 0, SPIFFS_SEEK_SET) < 0) {
        return -1;
    }

    return 0;
}


int dl_SPIFFS_remove(void *fs, char *file_name)
{
    uint32_t addr;
    uint32_t flag_bak = g_fs_header.fs_header.block_use_flag;
    int i = inner_fs_file_is_exist(file_name);

    if(i < 0) {
        return i;
    }

    addr = (uint32_t)(g_fs_header.fs_header.file_content_index[i]) * 4096;
    g_fs_header.fs_header.block_use_flag &= ~((uint32_t)1<<g_fs_header.fs_header.file_content_index[i]);

    while(1) {
        SPI_FLASH_Read(addr, &g_fs_block, sizeof(g_fs_block));
        if(g_fs_block.crc16 != inner_make_crc16((uint8_t *)&g_fs_block.fs_block, sizeof(g_fs_block.fs_block))) {
            g_fs_header.fs_header.block_use_flag = flag_bak;
            return -1;
        }
        g_fs_header.fs_header.block_use_flag &= ~((uint32_t)1<<g_fs_block.fs_block.cur_block_index);
        if(g_fs_block.fs_block.cur_block_index != g_fs_block.fs_block.next_block_index) {
            addr = (uint32_t)(g_fs_block.fs_block.next_block_index) * 4096;
        }
        else {
            break;
        }
    }

    g_fs_header.fs_header.file_name[i][0] = 0;

    return dl_SPIFFS_close(fs, i);
}

int dl_SPIFFS_info(void *fs, uint32_t *total, uint32_t *used)
{
    uint32_t s = 0;
    uint32_t bak = g_fs_header.fs_header.block_use_flag;
    uint8_t i;
    #if FLASH_SAVE_FLAG
    uint8_t block_size = FLASH_BLOCK_SUM/2;
    #else
    uint8_t block_size = FLASH_BLOCK_SUM;
    #endif
    for(i=1; i<block_size; i++){
        if((bak >> i) & 0x00000001) {
            s+=4096;
        }
    }
    #if FLASH_SAVE_FLAG
    *total = (FLASH_BLOCK_SUM/2)*4096;
    #else
    *total = (FLASH_BLOCK_SUM)*4096;
    #endif
    *used = s+4096;
    return 0;
}

int dl_SPIFFS_creat(void *fs, char *path, uint16_t file_mode)
{
    int fd;

    fd = dl_SPIFFS_open(fs, path, SPIFFS_CREAT, 0);
    if(fd < 0) {
        return fd;
    }

    dl_SPIFFS_close(fs, fd);

    return 0;
}

int dl_SPIFFS_rename(void *fs, char *old_path, char *new_path)
{
    uint8_t i;

    if(g_fs_header.valid_flag) {
        for(i=0; i<DL_FS_MAX_FILE_SUM; i++) {
            if(!strcmp(old_path, g_fs_header.fs_header.file_name[i])) {
                strcpy(g_fs_header.fs_header.file_name[i], new_path);
                return 0;
            }
        }
    }

    return -1;
}

uint16_t inner_make_crc16(uint8_t *msg, uint16_t len)
{
    uint16_t crc16 = 0xFFFF;
    uint16_t i,j=0;
    uint8_t c15,bit;

    for (i = 0; i < len ; i++) {
        for (j = 0; j < 8; j++) {
             c15 = ((crc16 >> 15 & 1) == 1);
             bit = ((msg[i] >> (7 - j) & 1) == 1);
             crc16 <<= 1;
             if (c15 ^ bit) {
                 crc16 ^= 0x1021;
             }
        }
    }
    return crc16;
}


