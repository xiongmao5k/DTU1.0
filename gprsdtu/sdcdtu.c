#include "process.h"
#include "gprs.h"
#include "framebuff.h"
#include "list.h"
#include "memb.h"
#include "rtc.h"
#include "senif.h"
#include "senproto.h"
#include "stdlib.h"
#include "string.h"
#include "sdcdtu.h"
#include "sevproto.h"
#include "sensor_data_backup.h"
#include "system_status.h"
#include "configure.h"
#include "battery.h"
#include "deviceid.h"
#include "logger.h"


#define DEBUG 0
#if DEBUG
#define PRINTF(...) printf(__LINE__ ": " __VA_ARGS__)
#else
#define PRINTF(...)
#endif

#define SDCDTU_LOG_ENABLE 1

FRAMEBUFF(gprs_send_buffer, 512);

static uint32_t next_wakeuptime;
static uint8_t configure_data_buffer[sizeof(struct configure_struct) + sizeof(struct sensor_descript_struct) * 16];
struct configure_struct *dtuconfig = (void *)configure_data_buffer;


#define SDCDTU_TIMESYNC_TIMEOUT 30
PROCESS(timesync_process, "time sync process");
PROCESS_THREAD(timesync_process, ev, data)
{
    static struct etimer et;
    static struct process *parent;
    static int64_t t1, t2, ts;
    PROCESS_BEGIN();
    {
        if (ev == PROCESS_EVENT_INIT) {
            parent = data;
            gprs_set_parent_process(PROCESS_CURRENT());
        }
        if (gprs_connect() == GPRS_STATUS_CONNECT) {
            struct sevproto_timesync_require_struct timesync_require_frame;
            uint32_t size = 0;
            timesync_require_frame.devid = deviceid_read();
            timesync_require_frame.frame_type = SEVPROTO_FRAME_TYPE_TIMESYNC;
            timesync_require_frame.unixtime = rtc_get_time();
            t1 = rtc_get_time();
            gprs_send(sevproto_prepare(&timesync_require_frame, sizeof(timesync_require_frame), &size), size);
            etimer_set(&et, CLOCK_SECOND * SDCDTU_TIMESYNC_TIMEOUT);
            // wait service reply
            PROCESS_YIELD_UNTIL(ev == gprs_event_recv || ev == PROCESS_EVENT_TIMER);
            if (ev == gprs_event_recv) {
                struct sevproto_timesync_reply_struct *timesync_reply_frame_p;
                uint32_t *param = data;
                timesync_reply_frame_p = sevproto_check((void *)param[0], param[1]);
                if (timesync_reply_frame_p != NULL && timesync_reply_frame_p->devid == deviceid_read() &&
                    SEVPROTO_TYPE(timesync_reply_frame_p->frame_type) == SEVPROTO_FRAME_TYPE_TIMESYNC) {
                    int64_t td;
                    t2 = rtc_get_time();
                    td = (2*timesync_reply_frame_p->unixtime - t1 - t2) / 2;
                    rtc_set_time(rtc_get_time() + td);
                    next_wakeuptime += td;
                } else {
                    PRINTF("time sync fail.\n");
                }
            }
            if (ev == PROCESS_EVENT_TIMER) {
                PRINTF("time sync timeout.\n");
            }
        }
    }
    PROCESS_END();
}

struct sccb_struct {                            // sensor collect ctrl block
    struct sccb_struct *next;
    struct sensor_descript_struct *sendesc;     // sensor descript ptr
    uint32_t stoptime;                          // warm stop time
    char *sendat;
};

LIST(sensor_prewarm_list);
LIST(sendat_collect_list);
LIST(sendat_commit_list);
MEMB(sccb_memb, struct sccb_struct, 16);
PROCESS(sensor_prewarm_process, "sensor prewarm process");
PROCESS_THREAD(sensor_prewarm_process, ev, data)
{
    static struct process *parent;
    PROCESS_BEGIN();
    {
        if (ev == PROCESS_EVENT_INIT) {
            parent = data;
            memb_init(&sccb_memb);
        }
        struct sccb_struct *sccb;
        struct sensor_descript_struct *sendesc = dtuconfig->sensor_descript;
        uint32_t sendescnum = dtuconfig->device_descript.sensor_descript_number;
        for (uint32_t cnt = 0; cnt < sendescnum; cnt+=1) {
            sccb = memb_alloc(&sccb_memb);
            if (sccb != NULL) {
                sccb->sendesc = &sendesc[cnt];
                sccb->stoptime = sendesc[cnt].sensor_prewarm_time + rtc_get_time();
                senif_power_open(sendesc[cnt].sensor_interface_id);
                list_add(sensor_prewarm_list, sccb);
            } else {
                PRINTF("alloc sccb fail.\n")
            }
        }
        while (list_length(sensor_prewarm_list)) {
            PROCESS_PAUSE();
            struct sccb_struct *sccb;
            for (sccb = list_head(sensor_prewarm_list); sccb != NULL; sccb = list_item_next(sccb)) {
                if (sccb->stoptime < rtc_get_time()) {
                    list_remove(sensor_prewarm_list, sccb);
                    list_add(sendat_collect_list, sccb);
                    break;
                }
            }
        }
    }
    PROCESS_END();
}
FRAMEBUFF(sensorInterfaceSendReceiveBuffer, 512);
FRAMEBUFF(sensorDataStringBuffer, 512);
#define SDCDTU_SENDAT_COLLECT_TIMEOUT   3
PROCESS(sendat_collect_process, "sendat collect process");
PROCESS_THREAD(sendat_collect_process, ev, data)
{
    static struct process *parent;
    static struct timer tm;
    PROCESS_BEGIN();
    {
        if (ev == PROCESS_EVENT_INIT) {
            parent = data;
        }
        while (process_is_running(&sensor_prewarm_process) ||
               list_length(sendat_collect_list)) {
            static struct sccb_struct *sensorCollectControlBlock;
            static struct senproto_struct *sensorProtocol;
            PROCESS_PAUSE();
            if (((sensorCollectControlBlock = list_pop(sendat_collect_list)) != NULL) &&
                (sensorProtocol = senproto_lookup(sensorCollectControlBlock->sendesc->sensor_type)) != NULL) {
                uint32_t frameSize = 0;
                framebuff_clean(&sensorInterfaceSendReceiveBuffer);
                frameSize = (uint32_t) sensorProtocol->prepare(framebuff_datptr(&sensorInterfaceSendReceiveBuffer),
                                                         (uint8_t) sensorCollectControlBlock->sendesc->sensor_address);
                senif_open(sensorCollectControlBlock->sendesc->sensor_interface_id);
                senif_write(sensorCollectControlBlock->sendesc->sensor_interface_id, framebuff_datptr(&sensorInterfaceSendReceiveBuffer), frameSize);
                timer_set(&tm, CLOCK_SECOND * SDCDTU_SENDAT_COLLECT_TIMEOUT);
                framebuff_clean(&sensorInterfaceSendReceiveBuffer);
                while (1) {
                    uint8_t sensorInterfaceReceviceSize = 0;
                    uint32_t parseReply = 0;
                    PROCESS_PAUSE();
                    if (timer_expired(&tm)) {
                        senif_close(sensorCollectControlBlock->sendesc->sensor_interface_id);
                        senif_power_close(sensorCollectControlBlock->sendesc->sensor_interface_id);
                        PRINTF("read sensor(sensor id: %d) data fail.\n", sensorCollectControlBlock->psd->sid);
                        memb_free(&sccb_memb, sensorCollectControlBlock);
                        break;
                    }
                    if (senif_read(sensorCollectControlBlock->sendesc->sensor_interface_id, &sensorInterfaceReceviceSize, 1)) {
                        framebuff_push_u8(&sensorInterfaceSendReceiveBuffer, sensorInterfaceReceviceSize);
                        parseReply = sensorProtocol->parse(sensorCollectControlBlock->sendesc->sensor_id,
                                                framebuff_datptr(&sensorDataStringBuffer),
                                                framebuff_datptr(&sensorInterfaceSendReceiveBuffer),
                                                (uint32_t) framebuff_length(&sensorInterfaceSendReceiveBuffer));
                        if (parseReply == 1) framebuff_remove(&sensorInterfaceSendReceiveBuffer, 1);
                        if (parseReply > 1) {
                            senif_close(sensorCollectControlBlock->sendesc->sensor_interface_id);
                            senif_power_close(sensorCollectControlBlock->sendesc->sensor_interface_id);
                            if ((sensorCollectControlBlock->sendat = malloc(parseReply+1)) != NULL) {
                                memset(sensorCollectControlBlock->sendat, 0, parseReply+1);
                                memcpy(sensorCollectControlBlock->sendat, framebuff_datptr(&sensorDataStringBuffer), parseReply);
                                list_remove(sendat_collect_list, sensorCollectControlBlock);
                                list_add(sendat_commit_list, sensorCollectControlBlock);
                            } else {
                                LOG_OUT(SDCDTU_LOG_ENABLE, "9\n");
                                PRINTF("malloc sensor data buffer fail.\n");
                                memb_free(&sccb_memb, sensorCollectControlBlock);
                            }
                            break;
                        }
                    }
                }
            }
        }
    }
    PROCESS_END();
}


FRAMEBUFF(commit_buff, 256);
#define SDCDTU_SENDAT_COMMIT_TIMEOUT 30
PROCESS(sendat_commit_process, "sendat commit process");
PROCESS_THREAD(sendat_commit_process, ev, data)
{
    static struct process *parent;
    static uint32_t sendat_sent_flag = 0;
    static struct etimer et;
    PROCESS_BEGIN();
    {
        if (ev == PROCESS_EVENT_INIT) {
            parent = data;
            sendat_sent_flag = 1;
            gprs_set_parent_process(PROCESS_CURRENT());
        }
        while (process_is_running(&sendat_collect_process) || list_length(sendat_commit_list)) {
            static struct sccb_struct *sccb = NULL;
            if (gprs_connect() == GPRS_STATUS_CONNECT) {
                if ((sccb = list_pop(sendat_commit_list)) != NULL) {
                    uint32_t size = 0;
                    framebuff_clean(&commit_buff);
                    framebuff_push_u32(&commit_buff, deviceid_read());
                    framebuff_push_u8(&commit_buff, SEVPROTO_FRAME_TYPE_DATACOMMIT);
                    framebuff_push(&commit_buff, sccb->sendat, strlen(sccb->sendat));
                    gprs_send(sevproto_prepare(framebuff_datptr(&commit_buff),
                                               framebuff_length(&commit_buff), &size),
                              size);
                    etimer_set(&et, CLOCK_SECOND * SDCDTU_SENDAT_COMMIT_TIMEOUT);
                    PROCESS_YIELD_UNTIL(ev == gprs_event_recv || ev == PROCESS_EVENT_TIMER);
                    if (ev == PROCESS_EVENT_TIMER) {
                        backup_push(sccb->sendat, strlen(sccb->sendat));
                    }
                    if (ev == gprs_event_recv){
                        uint32_t *param = data;
                        uint32_t recvsize = param[1];
                        struct sevproto_data_commit_reply_struct *data_commit_reply_frame_p = NULL;
                        data_commit_reply_frame_p = sevproto_check( (void *)param[0], recvsize);
                        if (data_commit_reply_frame_p == NULL || data_commit_reply_frame_p->devid != deviceid_read() ||
                            SEVPROTO_TYPE(data_commit_reply_frame_p->frame_type) != SEVPROTO_FRAME_TYPE_DATACOMMIT ||
                            data_commit_reply_frame_p->status != 0) {
                            backup_push(sccb->sendat, strlen(sccb->sendat));
                        }
                    }
                    free(sccb->sendat);
                    memb_free(&sccb_memb, sccb);
                }
            } else {
                if ((sccb = list_pop(sendat_commit_list)) != NULL) {
                    backup_push(sccb->sendat, strlen(sccb->sendat));
                    free(sccb->sendat);
                    memb_free(&sccb_memb, sccb);
                }
            }
            PROCESS_PAUSE();
        }
    }
    PROCESS_END();
}


#define SDCDTU_CONFIGURE_UPDATE_DATA_REQUIRE_SIZE   512
#define SDCDTU_CONFIGURE_UPDATE_VERSION_REQUIRE_TIMEOUT 30
#define SDCDTU_CONFIGURE_UPDATE_DATA_REQUIRE_TIMEOUT 30
PROCESS(configure_update_process, "configure update process");
PROCESS_THREAD(configure_update_process, ev, data)
{
    static struct process *parent;
    static struct etimer et;
    PROCESS_BEGIN();
    {
        static struct sevproto_configure_require_struct config_require_frame;
        uint32_t fsize = 0;

        if (ev == PROCESS_EVENT_INIT) {
            parent = data;
            gprs_set_parent_process(PROCESS_CURRENT());
        }
        if (gprs_connect() == GPRS_STATUS_CONNECT) {
            config_require_frame.devid = deviceid_read();
            config_require_frame.frame_type = SEVPROTO_FRAME_TYPE_CONFIGURE;
            config_require_frame.version = dtuconfig->configure_descript.configure_version;
            gprs_send(sevproto_prepare(&config_require_frame, sizeof(config_require_frame), &fsize), fsize);
            etimer_set(&et, CLOCK_SECOND * SDCDTU_CONFIGURE_UPDATE_VERSION_REQUIRE_TIMEOUT);
            PROCESS_YIELD_UNTIL(ev == gprs_event_recv || ev == PROCESS_EVENT_TIMER);
            if (ev == PROCESS_EVENT_TIMER) {
                // TODO: require configure update new_version timeout.
                PROCESS_EXIT();
            }
            if (ev == gprs_event_recv) {
                static uint32_t new_version, new_configure_size, recvsize;
                static uint32_t offset = 0;
                struct sevproto_configure_reply_struct *config_reply_frame_p;
                uint32_t *param = data;
                config_reply_frame_p = sevproto_check((void *)param[0], param[1]);
                if (config_reply_frame_p == NULL || config_reply_frame_p->devid != deviceid_read() ||
                    SEVPROTO_TYPE(config_reply_frame_p->frame_type) != SEVPROTO_FRAME_TYPE_CONFIGURE) {
                    //require configure update version fail.
                    PROCESS_EXIT();
                }
                if (config_reply_frame_p->version == dtuconfig->configure_descript.configure_version) {
                    // the last version
                    PROCESS_EXIT();
                }
                new_configure_size = config_reply_frame_p->size;
                new_version = config_reply_frame_p->version;
                configure_update_init(new_version, new_configure_size);
                while (1) {
                    static struct sevproto_configure_data_require_struct config_data_require_frame;
                    uint32_t sendsize = 0;
                    PROCESS_PAUSE();
                    recvsize = new_configure_size - offset > SDCDTU_CONFIGURE_UPDATE_DATA_REQUIRE_SIZE ?
                               SDCDTU_CONFIGURE_UPDATE_DATA_REQUIRE_SIZE : new_configure_size - offset;
                    config_data_require_frame.devid = deviceid_read();
                    config_data_require_frame.frame_type = SEVPROTO_FRAME_TYPE_CONFIGURE_DATA;
                    config_data_require_frame.version = new_version;
                    config_data_require_frame.offset = offset;
                    config_data_require_frame.size = recvsize;
                    gprs_send(sevproto_prepare(&config_data_require_frame, sizeof(config_data_require_frame), &sendsize), sendsize);
                    etimer_set(&et, CLOCK_SECOND * SDCDTU_CONFIGURE_UPDATE_DATA_REQUIRE_TIMEOUT);
                    PROCESS_YIELD_UNTIL(ev == PROCESS_EVENT_TIMER || ev == gprs_event_recv);
                    if (ev == PROCESS_EVENT_TIMER) {
                        // TODO: configure update data require timeout.
                        PROCESS_EXIT();
                    }
                    if (ev == gprs_event_recv) {
                        uint32_t *param = data;
                        struct sevproto_configure_data_reply_struct *config_data_reply_frame_p;
                        config_data_reply_frame_p = sevproto_check((void *)param[0], param[1]);
                        if (config_data_reply_frame_p == NULL || config_data_reply_frame_p->devid != deviceid_read() ||
                            SEVPROTO_TYPE(config_data_reply_frame_p->frame_type) != SEVPROTO_FRAME_TYPE_CONFIGURE_DATA) {
                            // configure update data require fail.
                            PROCESS_EXIT();
                        }
                        configure_update_push(config_data_reply_frame_p->data, recvsize);
                        offset += recvsize;
                        if (offset == new_configure_size) {
                            // TODO: configure update success.
                            if (CONF_SUCCESS == configure_update_check()) {
                                configure_update_apply();
                            }
                            PROCESS_EXIT();
                        }
                    }
                }
            }

        }
    }
    PROCESS_END();
}


static void sdcdtu_frameware_update_require_version_prepare(uint32_t oldversion)
{
    framebuff_clean(&gprs_send_buffer);
    framebuff_push_u8(&gprs_send_buffer, 0x7E);     // head
    framebuff_push_u8(&gprs_send_buffer, 0x00);     // seq
    framebuff_push_u16(&gprs_send_buffer, 9);        // length
    // TODO: add devid read
    framebuff_push_u32(&gprs_send_buffer, 0x00);    // devid
    framebuff_push_u8(&gprs_send_buffer, 0x05);     // type
    framebuff_push_u32(&gprs_send_buffer, oldversion);
    // TODO: add crc32 calc
    framebuff_push_u32(&gprs_send_buffer, 0x00);    // crc32
    framebuff_push_u8(&gprs_send_buffer, 0x0A);     // end
}
static int sdcdtu_frameware_update_reply_version_process(void *data, uint32_t *cv, uint32_t *hardwaresize)
{
    uint32_t *param = data;
    uint8_t head, seq, end, type;
    uint16_t len;
    uint32_t crc, devid, size;
    size = param[1];
    if (size < 20) return 1;
    FRAMEBUFF_PARSE_BEGIN((void *)param[0]);
    FRAMEBUFF_PARSE_POP_U8(head);               // frame head
    if (head != 0x7E) return 2;
    FRAMEBUFF_PARSE_POP_U8(seq);                // frame seq
    FRAMEBUFF_PARSE_POP_U16(len);               // data length
    if (len != 11) return 1;
    FRAMEBUFF_PARSE_POP_U32(devid);             // device id
    if (devid != 0x0) return 3;
    FRAMEBUFF_PARSE_POP_U8(type);               // frame type
    if (type != 0x85) return 4;
    FRAMEBUFF_PARSE_POP_U32(*cv);               // new hardware version
    FRAMEBUFF_PARSE_POP_U16(*hardwaresize);     // new hardware size
    FRAMEBUFF_PARSE_POP_U32(crc);               // crc32 check code
    FRAMEBUFF_PARSE_POP_U8(end);                // frame end
    if (end != 0x0A) return 5;
    FRAMEBUFF_PARSE_END();
    return 0;
}
static void sdcdtu_frameware_update_data_require_prepare(uint32_t newversion, uint32_t offset, uint32_t size)
{
    framebuff_clean(&gprs_send_buffer);
    framebuff_push_u8(&gprs_send_buffer, 0x7E);     // head
    framebuff_push_u8(&gprs_send_buffer, 0x00);     // seq
    framebuff_push_u16(&gprs_send_buffer, 13);        // length
    // TODO: add devid read
    framebuff_push_u32(&gprs_send_buffer, 0x00);    // devid
    framebuff_push_u8(&gprs_send_buffer, 0x06);     // type
    // TODO: add current hardware version
    framebuff_push_u32(&gprs_send_buffer, newversion);
    framebuff_push_u16(&gprs_send_buffer, offset);
    framebuff_push_u16(&gprs_send_buffer, size);
    // TODO: add crc32 calc
    framebuff_push_u32(&gprs_send_buffer, 0x00);    // crc32
    framebuff_push_u8(&gprs_send_buffer, 0x0A);     // end
}
static int sdcdtu_frameware_update_data_reply_process(void *data)
{
    uint32_t *param = data;
    uint8_t head, seq, end, type;
    uint16_t len, datlen;
    uint32_t crc, devid, size;
    uint8_t *fdat = NULL;
    size = param[1];
    if (size < 13) return 1;
    FRAMEBUFF_PARSE_BEGIN((void *)param[0]);
    FRAMEBUFF_PARSE_POP_U8(head);               // frame head
    if (head != 0x7E) return 2;
    FRAMEBUFF_PARSE_POP_U8(seq);                // frame seq
    FRAMEBUFF_PARSE_POP_U16(len);               // data length
    datlen = len - 5;
    // if (len != 11) return 1;
    FRAMEBUFF_PARSE_POP_U32(devid);             // device id
    if (devid != 0x0) return 3;
    FRAMEBUFF_PARSE_POP_U8(type);               // frame type
    if (type != 0x86) return 4;
    FRAMEBUFF_PARSE_POP(fdat, datlen);          // hardware data
    FRAMEBUFF_PARSE_POP_U32(crc);               // crc32 check code
    FRAMEBUFF_PARSE_POP_U8(end);                // frame end
    if (end != 0x0A) return 5;
    FRAMEBUFF_PARSE_END();
    return datlen;
}
#define SDCDTU_HARDWARE_UPDATE_DATA_REQUIRE_SIZE   512
#define SDCDTU_HARDWARE_UPDATE_VERSION_REQUIRE_TIMEOUT 30
#define SDCDTU_HARDWARE_UPDATE_DATA_REQUIRE_TIMEOUT 30
PROCESS(hardware_update_process, "frameware update process");
PROCESS_THREAD(hardware_update_process, ev, data)
{
    static struct etimer et;
    static uint32_t oldversion, newversion, hardwaresize, recvsize;
    static uint32_t offset = 0;
    struct process *parent;
    PROCESS_BEGIN();
    {
        if (ev == PROCESS_EVENT_INIT) {
            parent = data;
            gprs_set_parent_process(PROCESS_CURRENT());
            oldversion = 0;
        }
        while (gprs_connect() == 0)
            PROCESS_PAUSE();
        sdcdtu_frameware_update_require_version_prepare(oldversion);
        gprs_send(framebuff_datptr(&gprs_send_buffer), framebuff_length(&gprs_send_buffer));
        etimer_set(&et, CLOCK_SECOND * SDCDTU_HARDWARE_UPDATE_VERSION_REQUIRE_TIMEOUT);
        PROCESS_YIELD_UNTIL(ev == gprs_event_recv || ev == PROCESS_EVENT_TIMER);
        if (ev == PROCESS_EVENT_TIMER) {
            //TODO: hardware update version require timeout.
            PROCESS_EXIT();
        }
        if (ev == gprs_event_recv) {
            if (sdcdtu_frameware_update_reply_version_process(data, &newversion, &hardwaresize)) {
                //TODO: hardware update verison require fail.
                PROCESS_EXIT();
            }
            if (oldversion == newversion) {
                // TODO: the last version
                PROCESS_EXIT();
            }
            while (1) {
                PROCESS_PAUSE();
                recvsize = hardwaresize - offset > SDCDTU_HARDWARE_UPDATE_DATA_REQUIRE_SIZE ?
                           SDCDTU_HARDWARE_UPDATE_DATA_REQUIRE_SIZE : hardwaresize - offset;
                sdcdtu_frameware_update_data_require_prepare(newversion, offset, recvsize);
                gprs_send(framebuff_datptr(&gprs_send_buffer), framebuff_length(&gprs_send_buffer));
                etimer_set(&et, CLOCK_SECOND * SDCDTU_HARDWARE_UPDATE_DATA_REQUIRE_TIMEOUT);
                PROCESS_YIELD_UNTIL(ev == PROCESS_EVENT_TIMER || ev == gprs_event_recv);
                if (ev == PROCESS_EVENT_TIMER) {
                    //TODO: hardware update data require timeout.
                    PROCESS_EXIT();
                }
                if (ev == gprs_event_recv) {
                    if (recvsize != sdcdtu_frameware_update_data_reply_process(data)) {
                        //TODO: hardware update data requuire fail.
                        PROCESS_EXIT();
                    }
                }
                offset += recvsize;
                // TODO: check config file crc
                if (offset == hardwaresize) 
                    PROCESS_EXIT();
            }
        }
    }
    PROCESS_END();
}

PROCESS(dtudata_commit_process, "dtudata commit process");
PROCESS_THREAD(dtudata_commit_process, ev, data)
{
#define DTUDATA_COMMIT_TIMEOUT 30
    static struct etimer et;
    PROCESS_BEGIN();
    {
        static char dtuData[128];
        uint32_t datasize;
        if (ev == PROCESS_EVENT_INIT) {
            gprs_set_parent_process(PROCESS_CURRENT());
        }
        memset(dtuData, 0, sizeof(dtuData));
        datasize = battery_read(dtuData, sizeof(dtuData));
        if (gprs_connect() == GPRS_STATUS_CONNECT) {
            framebuff_clean(&commit_buff);
            framebuff_push_u32(&commit_buff, deviceid_read());
            framebuff_push_u8(&commit_buff, SEVPROTO_FRAME_TYPE_DATACOMMIT);
            framebuff_push(&commit_buff, dtuData, strlen(dtuData));
            gprs_send(sevproto_prepare(framebuff_datptr(&commit_buff),
                                       framebuff_length(&commit_buff), &datasize), datasize);
            etimer_set(&et, CLOCK_SECOND * DTUDATA_COMMIT_TIMEOUT);
            PROCESS_YIELD_UNTIL(ev == gprs_event_recv || ev == PROCESS_EVENT_TIMER);
            if (ev == PROCESS_EVENT_TIMER) {
                PRINTF("commit dtu data timeout.\n");
                backup_push(dtuData, strlen(dtuData));
                PROCESS_EXIT();
            }
            if (ev == gprs_event_recv) {
                uint32_t *param = data;
                uint32_t recvsize = param[1];
                struct sevproto_data_commit_reply_struct *data_commit_reply_frame_p = NULL;
                data_commit_reply_frame_p = sevproto_check( (void *)param[0], recvsize);
                if (data_commit_reply_frame_p == NULL || data_commit_reply_frame_p->devid != deviceid_read() ||
                    SEVPROTO_TYPE(data_commit_reply_frame_p->frame_type) != SEVPROTO_FRAME_TYPE_DATACOMMIT ||
                    data_commit_reply_frame_p->status != 0) {
                    backup_push(dtuData, strlen(dtuData));
                    PROCESS_EXIT();
                }
            }
        } else {
            backup_push(dtuData, strlen(dtuData));
        }
    }
    PROCESS_END();
}

PROCESS(backup_commit_process, "backup commit process");
PROCESS_THREAD(backup_commit_process, ev, data)
{
    char *base = framebuff_datptr(&sensorDataStringBuffer);
    int buffFlag = BACKUP_SUCCESS;
    PROCESS_BEGIN();
    {
        static struct etimer et;
        if (ev == PROCESS_EVENT_INIT) {
            gprs_set_parent_process(PROCESS_CURRENT());
        }
        if (gprs_connect() == GPRS_STATUS_CONNECT) {
            while ((buffFlag = backup_pop(base, 512)) == BACKUP_SUCCESS) {
                uint32_t dataSize = 0;
                framebuff_clean(&commit_buff);
                framebuff_push_u32(&commit_buff, deviceid_read());
                framebuff_push_u8(&commit_buff, SEVPROTO_FRAME_TYPE_DATACOMMIT);
                framebuff_push(&commit_buff, base, strlen(base));
                gprs_send(sevproto_prepare(framebuff_datptr(&commit_buff),
                                           framebuff_length(&commit_buff), &dataSize), dataSize);
                etimer_set(&et, CLOCK_SECOND * DTUDATA_COMMIT_TIMEOUT);
                PROCESS_YIELD_UNTIL(ev == PROCESS_EVENT_TIMER || ev == gprs_event_recv);
                if (ev == PROCESS_EVENT_TIMER) {
                    backup_push(base, strlen(base));
                    PROCESS_EXIT();
                }
                if (ev == gprs_event_recv) {
                    uint32_t *param = data;
                    uint32_t recvSize = param[1];
                    struct sevproto_data_commit_reply_struct *dataCommitReplyFrame_P = NULL;
                    dataCommitReplyFrame_P = sevproto_check( (void *)param[0], recvSize);
                    if (dataCommitReplyFrame_P == NULL || dataCommitReplyFrame_P->devid != deviceid_read() ||
                        SEVPROTO_TYPE(dataCommitReplyFrame_P->frame_type) != SEVPROTO_FRAME_TYPE_DATACOMMIT ||
                        dataCommitReplyFrame_P->status != 0) {
                        backup_push(base, strlen(base));
                        PROCESS_EXIT();
                    }
                }
            }
            if (buffFlag == BACKUP_NOTHING) {
                backup_clean();
            }
        }
    }
    PROCESS_END();
}

PROCESS(sdcdtu_process, "sdcdtu process");
PROCESS_THREAD(sdcdtu_process, ev, data)
{
#define SDCDTU_GPRS_CONNECT_TIMEOUT 120
    static struct etimer et;
    PROCESS_BEGIN();
    {
        if (ev == PROCESS_EVENT_INIT) {
        }
STARTUP:
        next_wakeuptime = rtc_get_time();
        if (battery_check_power() == BATTERY_POWER_LOW) {
            LOG_OUT(SDCDTU_LOG_ENABLE, "1\n");
            rtc_wakeup_after_second(6);
        }
        if (configure_read(dtuconfig) == CONF_SUCCESS) {
            gprs_set_parent_process(PROCESS_CURRENT());
            etimer_set(&et, CLOCK_SECOND * SDCDTU_GPRS_CONNECT_TIMEOUT);
            gprs_open(dtuconfig->communication_descript.domain, dtuconfig->communication_descript.port);
            PROCESS_YIELD_UNTIL(ev == PROCESS_EVENT_TIMER || ev == gprs_event_connect);
            if (ev == PROCESS_EVENT_TIMER) {
                gprs_set_parent_process(PROCESS_CURRENT());
                gprs_close();
                PROCESS_YIELD_UNTIL(ev == gprs_event_closed);
                LOG_OUT(SDCDTU_LOG_ENABLE, "3\n");
                process_start(&sensor_prewarm_process, PROCESS_CURRENT());
                process_start(&sendat_collect_process, PROCESS_CURRENT());
                while (process_is_running(&sensor_prewarm_process) || process_is_running(&sendat_collect_process)) {
                    PROCESS_PAUSE();
                    struct sccb_struct *sccb = NULL;
                    if ((sccb = list_pop(sendat_commit_list)) != NULL) {
                        backup_push(sccb->sendat, strlen(sccb->sendat));
                        free(sccb->sendat);
                        memb_free(&sccb_memb, sccb);
                    }
                }
                next_wakeuptime += dtuconfig->device_descript.commit_time;
                if (next_wakeuptime > rtc_get_time()) {
                    rtc_wakeup_at_second(next_wakeuptime);
                }
                else {
                    goto STARTUP;
                }
            }
            if (ev == gprs_event_connect) {
                process_start(&timesync_process, PROCESS_CURRENT());
                while (process_is_running(&timesync_process)) {
                    PROCESS_PAUSE();
                }
                process_start(&backup_commit_process, PROCESS_CURRENT());
                while (process_is_running(&backup_commit_process)) {
                    PROCESS_PAUSE();
                }
                process_start(&sensor_prewarm_process, PROCESS_CURRENT());
                process_start(&sendat_collect_process, PROCESS_CURRENT());
                process_start(&sendat_commit_process, PROCESS_CURRENT());
                while (process_is_running(&sensor_prewarm_process) || process_is_running(&sendat_commit_process) ||
                       process_is_running(&sendat_collect_process)) {
                    PROCESS_PAUSE();
                }
                process_start(&dtudata_commit_process, PROCESS_CURRENT());
                while (process_is_running(&dtudata_commit_process)) {
                    PROCESS_PAUSE();
                }
                process_start(&configure_update_process, PROCESS_CURRENT());
                while (process_is_running(&configure_update_process)) {
                    PROCESS_PAUSE();
                }
                gprs_set_parent_process(PROCESS_CURRENT());
                gprs_close();
                PROCESS_YIELD_UNTIL(ev == gprs_event_closed);
                next_wakeuptime += dtuconfig->device_descript.commit_time;
                if (next_wakeuptime > rtc_get_time()) {
                    rtc_wakeup_at_second(next_wakeuptime);
                }
                else {
                    goto STARTUP;
                }
            }
        }
        else {
            LOG_OUT(SDCDTU_LOG_ENABLE, "2.\n");
            while(1);
        }
        if (0) {
            process_start(&hardware_update_process, PROCESS_CURRENT());
            while (process_is_running(&hardware_update_process)) {
                PROCESS_PAUSE();
            }
        }
    }
    PROCESS_END();
}


void sdcdtu_init(void)
{
    process_start(&sdcdtu_process, NULL);
}