#ifndef SOFTWARE_CONFIGURE_H
#define SOFTWARE_CONFIGURE_H

#include "stdint.h"

#define CONFIGURE_FILE_NAME     "RUHR_DTU_CONFIG"
#define NEW_CONFIGURE_FILE_NAME "RUHR_DTU_CONFIG_NEW"


__packed struct configure_descript_struct {
    uint16_t configure_size;
    uint32_t configure_version;
    uint32_t crc32;
};

__packed struct communication_descript_struct {
#define COMM_DOMAIN_LEN 32
#define COMM_PORT_LEN 8
    uint8_t domain[COMM_DOMAIN_LEN];
    uint8_t port[COMM_PORT_LEN];
};

__packed struct device_descript_struct {
    uint32_t device_id;
    uint32_t commit_time;
    uint32_t collect_time;  
    uint8_t sensor_descript_number;
};

__packed struct sensor_descript_struct {
    uint32_t sensor_id;
    uint16_t sensor_type;
    uint16_t sensor_address;
    uint32_t sensor_prewarm_time;
    uint8_t sensor_interface_id;
};

__packed struct configure_struct {
    struct configure_descript_struct configure_descript;
    struct communication_descript_struct communication_descript;
    struct device_descript_struct device_descript;
    struct sensor_descript_struct sensor_descript[0];
};


enum {
    CONF_FAIL,
    CONF_SUCCESS,
};


int configure_read(struct configure_struct *conf);
int configure_update_init(uint32_t version, uint16_t size);
int configure_update_push(void *data, uint32_t size);
int configure_update_apply();
int configure_update_check();
#endif //SOFTWARE_CONFIGURE_H
