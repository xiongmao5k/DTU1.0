#ifndef SOFTWARE_DESC_H
#define SOFTWARE_DESC_H


#include "stdint.h"

struct cd_struct {
    uint32_t cvers;     // configure version
    uint32_t ccode;     // crc32 check code
    uint32_t csize;     // configure size
};
struct dd_struct {
    uint32_t cmittim;   // commit time
    uint32_t coletim;   // collect time
    uint32_t snumber;   // sensor numbers
};
struct sd_struct {
    uint32_t sid;   // sensor id
    uint32_t addr;  // rs485 addr
    uint32_t scid;  // sensor collect id
    uint32_t siid;  // sensor interface id
    uint32_t wtim;  // warm time
};


struct sdb_struct {     // sensor data block
    struct sdb_struct *next;
    uint32_t sid;       // sensor id
    uint32_t time;      // collect time
    char data[0];       // sensor data
};


#endif //SOFTWARE_DESC_H
