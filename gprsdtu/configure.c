#include <stdint.h>
#include "cfs-coffee.h"
#include "string.h"
#include "configure.h"
#include "spiffs_disk.h"
#include "spiffs.h"

#define CONFIG_DEBUG 0
#if CONFIG_DEBUG
#define CONFIG_LOG(arg...) printf(arg)
#else
#define CONFIG_LOG(arg...)  (void)0
#endif



int configure_read(struct configure_struct *conf) {
    spiffs_file fd = 0;
    uint32_t sendes_length = 0;
    fd = dl_SPIFFS_open(SPIFFS_DISK, CONFIGURE_FILE_NAME, SPIFFS_RDWR, 0);
    if (fd < 0) {
        CONFIG_LOG("configure_read: open configure file fail.\r\n");
        goto BAD_END;
    }
    if (dl_SPIFFS_read(SPIFFS_DISK, fd, conf, sizeof(*conf)) != sizeof(*conf)) {
        CONFIG_LOG("configure_read: read configure file fail.\r\n");
        goto BAD_END;
    }
    sendes_length = conf->device_descript.sensor_descript_number * sizeof(struct sensor_descript_struct);
    if (dl_SPIFFS_read(SPIFFS_DISK, fd, conf->sensor_descript, sendes_length) != sendes_length) {
        CONFIG_LOG("configure_read: read sensor descript fail.\r\n");
        goto BAD_END;
    }
    dl_SPIFFS_close(SPIFFS_DISK, fd);
    return CONF_SUCCESS;
    BAD_END:
    dl_SPIFFS_close(SPIFFS_DISK, fd);
    return CONF_FAIL;
}


int configure_update_init(uint32_t version, uint16_t size) {
    spiffs_file fd = 0;
    dl_SPIFFS_remove(SPIFFS_DISK, NEW_CONFIGURE_FILE_NAME);
    if (dl_SPIFFS_creat(SPIFFS_DISK, NEW_CONFIGURE_FILE_NAME, NULL) != SPIFFS_OK) {
        CONFIG_LOG("configure_update_init: open file %s fail.\r\n", NEW_CONFIGURE_FILE_NAME);
        return CONF_FAIL;
    }
    return CONF_SUCCESS;
}


int configure_update_push(void *data, uint32_t size)
{
    spiffs_file fd = 0;
    fd = dl_SPIFFS_open(SPIFFS_DISK, NEW_CONFIGURE_FILE_NAME, SPIFFS_WRONLY, 0);
    if (fd < 0) {
        CONFIG_LOG("configure_update_push: open file %s fail.\r\n", NEW_CONFIGURE_FILE_NAME);
        return CONF_FAIL;
    }
    if (dl_SPIFFS_write(SPIFFS_DISK, fd, data, size) != size) {
        CONFIG_LOG("configure_update_push: write configure data fail.\r\n");
        return CONF_FAIL;
    }
    dl_SPIFFS_close(SPIFFS_DISK, fd);
    return CONF_SUCCESS;
}

int configure_update_check()
{
    return CONF_SUCCESS;
}


int configure_update_apply() {
    dl_SPIFFS_remove(SPIFFS_DISK, CONFIGURE_FILE_NAME);
    dl_SPIFFS_rename(SPIFFS_DISK, NEW_CONFIGURE_FILE_NAME, CONFIGURE_FILE_NAME);
    return 0;
}

// int configure_update_apply_backup()
// {
//     uint32_t size;
//     uint8_t buff[128];
//     uint32_t inf, ouf;
//     cfs_remove(CONFIGURE_FILE_NAME);
//     inf = cfs_open(NEW_CONFIGURE_FILE_NAME, CFS_READ);
//     ouf = cfs_open(CONFIGURE_FILE_NAME, CFS_WRITE);
//     if (inf == -1 || ouf == -1) {
//         return CONF_FAIL;
//     }
//     // cfs_seek(ouf, 0, CFS_SEEK_SET);
//     while ((size = cfs_read(inf, buff, sizeof(buff))) == sizeof(buff)) {
//         if (cfs_write(ouf, buff, size) != size) {
//             goto BADEND;
//         }
//     }
//     if (cfs_write(ouf, buff, size) != size) {
//         goto BADEND;
//     }
//     cfs_close(inf);
//     cfs_close(ouf);
//     return CONF_SUCCESS;
//     BADEND:
//     cfs_close(inf);
//     cfs_close(ouf);
//     return CONF_FAIL;
// }

// int configure_read_backup(struct configure_struct *conf)
// {
//     uint32_t fd = cfs_open(CONFIGURE_FILE_NAME, CFS_READ);
//     uint32_t sensor_descript_size;
//     if (fd == -1) goto BADEND;
//     if (cfs_read(fd, conf, sizeof(*conf)) != sizeof(*conf)) {
//         goto BADEND;
//     }
//     sensor_descript_size = conf->device_descript.sensor_descript_number * sizeof(struct sensor_descript_struct);
//     if (cfs_read(fd, conf->sensor_descript, sensor_descript_size) != sensor_descript_size) {
//         goto BADEND;
//     }
//     cfs_close(fd);
//     return CONF_SUCCESS;
//     BADEND:
//     cfs_close(fd);
//     memset(conf, 0x00, sizeof(struct configure_struct));
//     return CONF_FAIL;
// }


// int configure_update_init_backup(uint32_t version, uint16_t size)
// {
//     uint32_t fd;
//     cfs_remove(NEW_CONFIGURE_FILE_NAME);
//     fd  = cfs_open(NEW_CONFIGURE_FILE_NAME, CFS_WRITE);
//     if (fd == -1) {
//         return CONF_FAIL;
//     }
//     return CONF_SUCCESS;
// }

// int configure_update_push_backup(void *data, uint32_t size)
// {
//     uint32_t fd = cfs_open(NEW_CONFIGURE_FILE_NAME, CFS_WRITE);
//     uint32_t result = CONF_SUCCESS;
//     if (fd == 0) {
//         return CONF_FAIL;
//     }
//     if (cfs_write(fd, data, size) != size) {
//         result = CONF_FAIL;
//     }
//     cfs_close(fd);
//     return result;
// }
