#include "stdint.h"
#include "stdio.h"
#include "sim800.h"
#include "contiki.h"
#include "gprs.h"
#include "process.h"
#include "logger.h"

#define GPRS_LOG_ENABLE 0

#define DEBUG 1
#if DEBUG
#define PRINTF(...) printf(__VA_ARGS__)
#else
#define PRINTF(...)
#endif


static struct gprs_callbacks *callbacks;
static struct process *gprs_parent_process;
static uint32_t gprs_connect_status = GPRS_STATUS_DISCONNECT;
static char *gprs_domain = NULL;
static char *gprs_port = NULL;

process_event_t gprs_event_sent;
process_event_t gprs_event_recv;
process_event_t gprs_event_connect;
process_event_t gprs_event_disconnect;
process_event_t gprs_event_closed;


PROCESS(gprs_communication_process, "gprs_communication process");
PROCESS_THREAD(gprs_communication_process, ev, data)
{
    static struct etimer et_proc;
    PROCESS_BEGIN();
    if (ev == PROCESS_EVENT_INIT) {
        sim800_set_parent(PROCESS_CURRENT());
    }
    while (1) {
#define GPRS_CMD(name, param, success, fail, timeout)                                           \
        sim800_cmd_##name(param);                                                               \
        etimer_set(&et_proc, timeout);                                                          \
        PROCESS_YIELD_UNTIL(success || fail || ev == PROCESS_EVENT_TIMER);                      \
        if (success) {PRINTF("GPRS: "#name" success.\n");}                                      \
        if (fail) {PRINTF("GPRS: "#name" fail.\n"); goto poweroff;}                             \
        if (ev == PROCESS_EVENT_TIMER) {PRINTF("GPRS: "#name" timeouted.\n"); goto poweroff;}
#define GPRS_WAIT(waittime)                                                                     \
        etimer_set(&et_proc, waittime);                                                         \
        PROCESS_YIELD_UNTIL(ev == PROCESS_EVENT_TIMER)
        while (1) {
            sim800_power_on();
            PROCESS_YIELD_UNTIL(ev == SIM800_POWER_EVENT_ON);
            etimer_set(&et_proc, CLOCK_SECOND * 5);
            PROCESS_YIELD_UNTIL(ev == PROCESS_EVENT_TIMER);
            GPRS_CMD(ate0, , ev == SIM800_PARSE_EVENT_OK, ev == SIM800_PARSE_EVENT_ERROR, GPRS_CMD_LOW_TIMEOUT);
            GPRS_WAIT(GPRS_CMD_WAITTIME * 2);
            GPRS_CMD(cstt, "cnnet", ev == SIM800_PARSE_EVENT_OK, ev == SIM800_PARSE_EVENT_ERROR, GPRS_CMD_LOW_TIMEOUT);
            GPRS_WAIT(GPRS_CMD_WAITTIME);
            GPRS_CMD(ciicr, , ev == SIM800_PARSE_EVENT_OK, ev == SIM800_PARSE_EVENT_ERROR, GPRS_CMD_HIGHT_TIMEOUT);
            GPRS_WAIT(GPRS_CMD_WAITTIME);
            GPRS_CMD(cifsr, , ev == SIM800_PARSE_EVENT_CIFSR, ev == SIM800_PARSE_EVENT_ERROR, GPRS_CMD_HIGHT_TIMEOUT);
            GPRS_WAIT(GPRS_CMD_WAITTIME);
            GPRS_CMD(ciphead, , ev == SIM800_PARSE_EVENT_OK, ev == SIM800_PARSE_EVENT_ERROR, GPRS_CMD_LOW_TIMEOUT);
            GPRS_WAIT(GPRS_CMD_WAITTIME);
            reconnect:
            sim800_cmd_cipstart(gprs_domain, gprs_port);
            etimer_set(&et_proc, GPRS_CMD_HIGHT_TIMEOUT);
            PROCESS_YIELD_UNTIL(ev == SIM800_PARSE_EVENT_OK || ev == SIM800_PARSE_EVENT_ERROR || ev == PROCESS_EVENT_TIMER);
            if (ev == SIM800_PARSE_EVENT_OK) {
                PRINTF("GPRS: cipstart success.\n");
            }
            if (ev == SIM800_PARSE_EVENT_ERROR) {
                PRINTF("GPRS: cipstart fail.\n");
                LOG_OUT(GPRS_LOG_ENABLE, "7\n");
                goto poweroff;
            }
            if (ev == PROCESS_EVENT_TIMER) {
                PRINTF("GPRS: cipstart timeouted.\n");
                LOG_OUT(GPRS_LOG_ENABLE, "8\n");
                goto poweroff;
            }
            etimer_set(&et_proc, GPRS_CMD_HIGHT_TIMEOUT);
            PROCESS_YIELD_UNTIL(ev == SIM800_PARSE_EVENT_CONNECT_OK || ev == PROCESS_EVENT_TIMER);
            if (ev == SIM800_PARSE_EVENT_CONNECT_OK) {
                PRINTF("GPRS: connect success.\n");
                gprs_connect_status = GPRS_STATUS_CONNECT;
                if (gprs_parent_process != NULL) {
                    process_post(gprs_parent_process, gprs_event_connect, NULL);
                }
                while (1) {
                    PROCESS_WAIT_EVENT();
                    if (ev == SIM800_PARSE_EVENT_SEND_OK) {
                        if (gprs_parent_process != NULL) {
                            process_post(gprs_parent_process, gprs_event_sent, data);
                        }
                    }
                    if (ev == SIM800_PARSE_EVENT_CLOSED || ev == SIM800_PARSE_EVENT_PDP_DEACT) {
                        gprs_connect_status = GPRS_STATUS_DISCONNECT;
                        if (gprs_parent_process != NULL) {
                            process_post(gprs_parent_process, gprs_event_disconnect, NULL);
                        }
                        // process_post(PROCESS_CURRENT(), GPRS_EVENT_OPEN, NULL);
                        goto reconnect;
                    }
                    if (ev == SIM800_PARSE_EVENT_RECV) {
                        if (callbacks != NULL) {
                            uint8_t *datptr = NULL;
                            uint32_t size = 0;
                            uint32_t *param = NULL;
                            param = data;
                            datptr = (void *)param[0];
                            size = param[1];
                            callbacks->recv(datptr, size);
                        }
                        if (gprs_parent_process != NULL) {
                            process_post(gprs_parent_process, gprs_event_recv, data);
                        }
                    }
                }
            }
            if (ev == PROCESS_EVENT_TIMER) {
                PRINTF("GPRS: TCP connect timeout.\n");
                goto reconnect;
            }
            poweroff:
            sim800_power_off();
            PROCESS_YIELD_UNTIL(ev == SIM800_POWER_EVENT_OFF);
            etimer_set(&et_proc, CLOCK_SECOND * 1);
            PROCESS_YIELD_UNTIL(ev == PROCESS_EVENT_TIMER);
        }
    }
    PROCESS_END();
}


PROCESS(gprs_process, "gprs proc");
PROCESS_THREAD(gprs_process, ev, data)
{
    PROCESS_BEGIN();
    if (ev == PROCESS_EVENT_INIT) {
        gprs_domain = NULL;
        gprs_port = NULL;
        gprs_connect_status = GPRS_STATUS_DISCONNECT;
        sim800_set_parent(PROCESS_CURRENT());
    }
    while (1) {
        PROCESS_WAIT_EVENT();
        if (ev == GPRS_EVENT_OPEN) {
            process_start(&gprs_communication_process, NULL);
        }
        if (ev == GPRS_EVENT_CLOSE) {
            static struct etimer et;
            gprs_connect_status = GPRS_STATUS_DISCONNECT;
            process_exit(&gprs_communication_process);
            sim800_set_parent(PROCESS_CURRENT());
            etimer_set(&et, CLOCK_SECOND * 3);
            PROCESS_YIELD_UNTIL(ev == PROCESS_EVENT_TIMER);
            sim800_power_off();
            PROCESS_YIELD_UNTIL(ev == SIM800_POWER_EVENT_OFF);
            if (gprs_parent_process != NULL) {
                process_post(gprs_parent_process, gprs_event_closed, NULL);
            }
        }
    }
    PROCESS_END();
}

void gprs_init(struct process *parent, struct gprs_callbacks *u)
{
    gprs_parent_process = parent;
    callbacks = u;
    gprs_event_connect    = process_alloc_event();
    gprs_event_disconnect = process_alloc_event();
    gprs_event_recv       = process_alloc_event();
    gprs_event_sent       = process_alloc_event();
    gprs_event_closed     = process_alloc_event();
    sim800_init(NULL);
    process_start(&gprs_process, NULL);

}

void gprs_set_parent_process(struct process *parent)
{
    gprs_parent_process = parent;
}

int gprs_send(void *buf, uint32_t size)
{
    sim800_send(buf, size);
    return size;
}

int gprs_connect(void)
{
    return gprs_connect_status;
}

void gprs_open(char *domain, char *port)
{
    gprs_domain = domain;
    gprs_port = port;
    process_post(&gprs_process, GPRS_EVENT_OPEN, NULL);
}

void gprs_close(void)
{
    gprs_domain = NULL;
    gprs_port = NULL;
    process_post(&gprs_process, GPRS_EVENT_CLOSE, NULL);
}
