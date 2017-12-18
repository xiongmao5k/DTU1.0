#include "stdint.h"
#include "configure.h"
#include "string.h"

uint32_t deviceid_read(void)
{
    char bc[256];
    struct configure_struct *cfg = (void *)bc;
    memset(cfg, 0x00, sizeof(bc));
    if (configure_read(cfg) == CONF_SUCCESS) {
        return cfg->device_descript.device_id;
    }
    else {
        return 0x00;
    }
    // uint32_t cpuid1, cpuid2, cpuid3;
    // cpuid1 = *(uint32_t *)(0x1ffff7e8);
    // cpuid2 = *(uint32_t *)(0x1ffff7ec);
    // cpuid3 = *(uint32_t *)(0x1ffff7f0);
    // return cpuid1 ^ cpuid2 ^ cpuid3;
}
