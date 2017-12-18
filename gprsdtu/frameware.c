#include "cfs-coffee.h"
#include "stm32f10x.h"

enum {
    FRAMEWARE_SUCCESS,
    FRAMEWARE_FAIL,
};


#define FRAMEWARE_NAME "frameware.bin"


int frameware_update_init()
{
    cfs_remove(FRAMEWARE_NAME);
    return FRAMEWARE_SUCCESS;
}


int frameware_update_push(void *buff, uint32_t size)
{
    uint32_t ouf;
    int result = SUCCESS;
    if ((ouf = cfs_open(FRAMEWARE_NAME, CFS_WRITE)) == 0) {
        return FRAMEWARE_FAIL;
    }
    if (cfs_write(ouf, buff, size) != size) {
        result = FRAMEWARE_FAIL;
    }
    cfs_close(ouf);
    return result;
}


int frameware_update_check()
{
    return FRAMEWARE_SUCCESS;
}


int frameware_update_apply(uint32_t address)
{
    return 0;
}
