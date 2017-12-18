//
// Created by Dict on 2016/11/23.
//

#ifndef SOFTWARE_SIM800_H_H
#define SOFTWARE_SIM800_H_H

#include "stdint.h"
#include "process.h"

#define SIM800_UART             2
#define SIM800_USART_STREAM     USART_STREAM2
#define SIM800_CMDBUFF_SIZE    64
#define SIM800_RECV_BUFFER_SIZE   1024

#define SIM800_POWER_STATE    GPIOA_GPIO_Pin_6
#define SIM800_NETWORK_STATE  GPIOA_GPIO_Pin_5
#define SIM800_POWER_CTRL_PIN GPIOB_GPIO_Pin_11



enum {
    SIM800_PARSE_EVENT_OK = 0x50,
    SIM800_PARSE_EVENT_ERROR,
    SIM800_PARSE_EVENT_CPIN,
    SIM800_PARSE_EVENT_CSQ,
    SIM800_PARSE_EVENT_CREG,
    SIM800_PARSE_EVENT_CGATT,
    SIM800_PARSE_EVENT_CIFSR,
    SIM800_PARSE_EVENT_CONNECT_OK,
    SIM800_PARSE_EVENT_CLOSED,
    SIM800_PARSE_EVENT_SEND_OK,
    SIM800_PARSE_EVENT_RECV,
    SIM800_PARSE_EVENT_CHEVRONS,
    SIM800_PARSE_EVENT_PDP_DEACT,
    SIM800_USART_EVENT_DATAIN,
    SIM800_POWER_EVENT_ON,
    SIM800_POWER_EVENT_OFF,
};

enum {
    SIM800_CTRL_EVENT_CPIN,
    SIM800_CTRL_EVENT_CSQ,
    SIM800_CTRL_EVENT_CREG,
    SIM800_CTRL_EVENT_CGATT,
    SIM800_CTRL_EVENT_CSTT,
    SIM800_CTRL_EVENT_CIICR,
    SIM800_CTRL_EVENT_CIFSR,
    SIM800_CTRL_EVENT_TCP_CONNECT,
    SIM800_STATE_EVENT_TCP_CLOSED,
    SIM800_CTRL_EVENT_TCP_SENT,
    SIM800_STATE_EVENT_TCP_RECV,

    SIM800_CTRL_EVENT_POWER_ON = 0x40,
    SIM800_CTRL_EVENT_POWER_OFF,
};

enum {
    SIM800_CPIN_STATUS_FAIL = 0,
    SIM800_CPIN_STATUS_READY = !SIM800_CPIN_STATUS_FAIL,
};


void sim800_set_parent(struct process *parent);
void sim800_init(struct process *app);
void sim800_power_on(void);
void sim800_power_off(void);
void sim800_cmd_cpin(void);
void sim800_cmd_csq(void);
void sim800_cmd_creg(void);
void sim800_cmd_cgatt(void);
void sim800_cmd_cstt(char const *cstt);
void sim800_cmd_ciicr(void);
void sim800_cmd_cifsr(void);
void sim800_cmd_ciphead(void);
void sim800_cmd_ate0(void);
void sim800_cmd_cipstart(char const *domain, char const *port);
void sim800_cmd_cipmode(char const *mode);
void sim800_send(void *buf, uint32_t size);
#endif //SOFTWARE_SIM800_H_H
