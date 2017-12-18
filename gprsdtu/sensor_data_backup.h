#ifndef SOFTWARE_SENSOR_DATA_BACKUP_H
#define SOFTWARE_SENSOR_DATA_BACKUP_H

#include "stdint.h"

enum {
    BACKUP_SUCCESS,
    BACKUP_FAIL,
    BACKUP_NOTHING,
};
int backup_init();
int backup_clean();
int backup_pop(void *buff, uint32_t buffSize);
int backup_push(void *dataBuff, uint32_t buffSize);

int backup_print_backupfile(void);
int backup_test(void);
#endif //SOFTWARE_SENSOR_DATA_BACKUP_H
