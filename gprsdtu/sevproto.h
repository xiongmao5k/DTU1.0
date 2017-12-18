#ifndef SOFTWARE_SEVPROTO_H
#define SOFTWARE_SEVPROTO_H

#include "stdint.h"

enum {
    SEVPROTO_ERROR_NONE,
    SEVPROTO_ERROR_SEQ,
    SEVPROTO_ERROR_HEAD,
    SEVPROTO_ERROR_CRC,
    SEVPROTO_ERROR_TAIL
};


#define __SEVPROTO_FRAME_HEAD__ \
    uint32_t devid; \
    uint8_t frame_type;

__packed struct sevproto_timesync_require_struct {
    __SEVPROTO_FRAME_HEAD__
    uint32_t unixtime;
};
__packed struct sevproto_timesync_reply_struct {
    __SEVPROTO_FRAME_HEAD__
    uint32_t unixtime;
};
__packed struct sevproto_data_commit_require_struct {
    __SEVPROTO_FRAME_HEAD__
    uint8_t data[0];
};
__packed struct sevproto_data_commit_reply_struct {
    __SEVPROTO_FRAME_HEAD__
    uint8_t status;
};
__packed struct sevproto_configure_require_struct {
    __SEVPROTO_FRAME_HEAD__
    uint32_t version;
};
__packed struct sevproto_configure_reply_struct {
    __SEVPROTO_FRAME_HEAD__
    uint32_t version;
    uint16_t size;
};
__packed struct sevproto_configure_data_require_struct {
    __SEVPROTO_FRAME_HEAD__
    uint32_t version;
    uint16_t offset;
    uint16_t size;
};
__packed struct sevproto_configure_data_reply_struct {
    __SEVPROTO_FRAME_HEAD__
    uint8_t data[0];
};
__packed struct sevproto_fraemware_require_struct {
    __SEVPROTO_FRAME_HEAD__
    uint32_t version;
};
__packed struct sevproto_frameware_reply_struct {
    __SEVPROTO_FRAME_HEAD__
    uint32_t version;
    uint16_t size;
};
__packed struct sevproto_frameware_data_require_struct {
    __SEVPROTO_FRAME_HEAD__
    uint32_t version;
    uint16_t offset;
    uint16_t size;
};
__packed struct sevproto_frameware_data_reply_struct {
    __SEVPROTO_FRAME_HEAD__
    uint8_t data[0];
};

__packed struct sevproto_frame_struct {
    __SEVPROTO_FRAME_HEAD__
    uint8_t option[0];
};

#define SEVPROTO_FRAME_TYPE_KEEPLIVE        0x00
#define SEVPROTO_FRAME_TYPE_TIMESYNC        0x01
#define SEVPROTO_FRAME_TYPE_DATACOMMIT      0x02
#define SEVPROTO_FRAME_TYPE_CONFIGURE       0x03
#define SEVPROTO_FRAME_TYPE_CONFIGURE_DATA  0x04
#define SEVPROTO_FRAME_TYPE_FRAMEWARE       0x05
#define SEVPROTO_FRAME_TYPE_FRAMEWARE_DATA  0x06
#define SEVPROTO_FRAME_TYPE_REPLY_MRK       0x80
#define SEVPROTO_TYPE(val)                  (val & (~SEVPROTO_FRAME_TYPE_REPLY_MRK))

int sevproto_init(void);
void * sevproto_check(void *buff, uint32_t size);
void * sevproto_prepare(void *data, uint32_t size, uint32_t *framelen);
int sevproto_error(void);
#endif //SOFTWARE_SEVPROTO_H
