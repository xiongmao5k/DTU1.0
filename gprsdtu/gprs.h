#ifndef SOFTWARE_GPRS_H
#define SOFTWARE_GPRS_H

#include "stdint.h"
#include "contiki.h"

struct gprs_callbacks {
    void (*recv)(void *data, uint32_t size);
    void (*sent)(uint32_t status);
};

enum {
    GPRS_EVENT_OPEN,
    GPRS_EVENT_CLOSE,
};

enum {
    GPRS_STATUS_DISCONNECT,
    GPRS_STATUS_CONNECT
};

enum {
    GPRS_SENT_OK,
    GPRS_SENT_FAIL,
};

extern process_event_t gprs_event_sent;
extern process_event_t gprs_event_recv;
extern process_event_t gprs_event_connect;
extern process_event_t gprs_event_disconnect;
extern process_event_t gprs_event_closed;

#define GPRS_CMD_WAITTIME           CLOCK_SECOND * 1
#define GPRS_CMD_LOW_TIMEOUT        CLOCK_SECOND * 1
#define GPRS_CMD_HIGHT_TIMEOUT      CLOCK_SECOND * 30

void gprs_close(void);
void gprs_open(char *domain, char *port);
int gprs_connect(void);
int gprs_send(void *buf, uint32_t size);
void gprs_init(struct process *parent, struct gprs_callbacks *u);
void gprs_set_parent_process(struct process *parent);
#endif //SOFTWARE_GPRS_H
