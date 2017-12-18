#include <spiffs/src/spiffs.h>
#include "sensor_data_backup.h"

#include "stdint.h"
#include "stdio.h"
#include "string.h"

#include "spiffs.h"
#include "spiffs_disk.h"

#include "cfs-coffee.h"
#include "time.h"

#include "rtc.h"

#define SENSOR_DATA_BACKUP_NAME "sendat.backup"
#define SENDAT_LIMIT_SIZE 512

#define DATA_BACKUP_DEBUG 0
#if DATA_BACKUP_DEBUG
#define DBD_LOG(args...)    printf(arg...)
#else
#define DBD_LOG(args...)    (void)(0)
#endif

#define DB_NAME "RUHR_DTU_DATA_BACKUP_NAME"
#define DB_LIMIT 4096
int backup_init() {
    spiffs_stat s;
    if (dl_SPIFFS_stat(SPIFFS_DISK, DB_NAME, &s) == SPIFFS_OK) {
        return BACKUP_SUCCESS;
    }
    else {
        uint32_t o = 4;
        spiffs_file fd = 0;
        if ((fd = dl_SPIFFS_open(SPIFFS_DISK, DB_NAME, SPIFFS_WRONLY | SPIFFS_CREAT, NULL)) < 0) {
            return BACKUP_FAIL;
        }
        if (dl_SPIFFS_write(SPIFFS_DISK, fd, &o, sizeof(o)) != sizeof(o)) {
            dl_SPIFFS_close(SPIFFS_DISK, fd);
            return BACKUP_FAIL;
        }
        dl_SPIFFS_close(SPIFFS_DISK, fd);
        return BACKUP_SUCCESS;
    }
}

int backup_clean() {
    uint32_t o = 4;
    spiffs_file fd = 0;
    dl_SPIFFS_remove(SPIFFS_DISK, DB_NAME);
    if ((fd = dl_SPIFFS_open(SPIFFS_DISK, DB_NAME, SPIFFS_WRONLY | SPIFFS_CREAT, NULL)) < 0) {
        return BACKUP_FAIL;
    }
    if (dl_SPIFFS_write(SPIFFS_DISK, fd, &o, sizeof(o)) != sizeof(o)) {
        dl_SPIFFS_close(SPIFFS_DISK, fd);
        return BACKUP_FAIL;
    }
    dl_SPIFFS_close(SPIFFS_DISK, fd);
    return BACKUP_SUCCESS;
}


static int backup_check_time(unsigned int base, unsigned int offset) {
    struct tm *cur_date;
    time_t cur_time;
    time_t hour;
    time_t div;

    cur_time = rtc_get_time();
    cur_time += 8 * 60 * 60;

    cur_date = gmtime(&cur_time);
    hour = cur_date->tm_hour;

    div = hour > base ? hour - base : base - hour;

    return div < offset;
}

int backup_pop(void *b, uint32_t bs) {
    spiffs_file fd = 0;
    uint32_t o = 0;
    uint32_t l = 0;
//     if (backup_check_time(0, 1)) {
//         return BACKUP_FAIL;
//     }
    if ((fd = dl_SPIFFS_open(SPIFFS_DISK, DB_NAME, SPIFFS_RDWR, NULL)) < 0) {
        return BACKUP_FAIL;
    }
    if (dl_SPIFFS_read(SPIFFS_DISK, fd, &o, sizeof(o)) != sizeof(o)) {
        dl_SPIFFS_close(SPIFFS_DISK, fd);
        return BACKUP_FAIL;
    }
    dl_SPIFFS_lseek(SPIFFS_DISK, fd, o, SPIFFS_SEEK_SET);
    if (dl_SPIFFS_read(SPIFFS_DISK, fd, &l, sizeof(l)) != sizeof(l)) {
        dl_SPIFFS_close(SPIFFS_DISK, fd);
        return BACKUP_FAIL;
    }
#define min(x, y) (x > y ? y : x)
    if (dl_SPIFFS_read(SPIFFS_DISK, fd, b, min(bs, l)) != min(bs, l)) {
        dl_SPIFFS_close(SPIFFS_DISK, fd);
        return BACKUP_FAIL;
    }
    o += (l + sizeof(l));
    dl_SPIFFS_lseek(SPIFFS_DISK, fd, 0, SPIFFS_SEEK_SET);
    if (dl_SPIFFS_write(SPIFFS_DISK, fd, &o, sizeof(o)) != sizeof(o)) {
        dl_SPIFFS_close(SPIFFS_DISK, fd);
        return BACKUP_FAIL;
    }
    dl_SPIFFS_close(SPIFFS_DISK, fd);
    return BACKUP_SUCCESS;
}

int backup_push(void *d, uint32_t bs) {
    spiffs_file fd = 0;
    uint32_t t = 0, u = 0;
    if (backup_check_time(0, 1)) {
        return BACKUP_SUCCESS;
    }
    if (dl_SPIFFS_info(SPIFFS_DISK, &t, &u) != SPIFFS_OK) {
        return BACKUP_FAIL;
    }
    if ((t-u) < DB_LIMIT) {
        if (backup_clean() == BACKUP_FAIL) {
            return BACKUP_FAIL;
        }
    }
    if ((fd = dl_SPIFFS_open(SPIFFS_DISK, DB_NAME, SPIFFS_RDWR, NULL)) < 0) {
        return BACKUP_FAIL;
    }
    dl_SPIFFS_lseek(SPIFFS_DISK, fd, 0, SPIFFS_SEEK_END);
    if (dl_SPIFFS_write(SPIFFS_DISK, fd, &bs, sizeof(bs)) != sizeof(bs)) {
        dl_SPIFFS_close(SPIFFS_DISK, fd);
        return BACKUP_FAIL;
    }
    if (dl_SPIFFS_write(SPIFFS_DISK, fd, d, bs) != bs) {
        dl_SPIFFS_close(SPIFFS_DISK, fd);
        return BACKUP_FAIL;
    }
    dl_SPIFFS_close(SPIFFS_DISK, fd);
    return BACKUP_SUCCESS;
}

