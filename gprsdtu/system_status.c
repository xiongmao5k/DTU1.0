#include "contiki.h"
#include "gpio.h"
#include "rtc.h"
#include "stm32f10x.h"

#define SYSTEM_STATE_LED GPIOB_GPIO_Pin_0
#define SYSTEM_STATE_BLINK_ONTIME   (CLOCK_SECOND * 0.1)
#define SYSTEM_STATE_BLINK_OFFTIME  (CLOCK_SECOND * 0.8)
#define SYSTEM_OPERATION_TIMEOUT    (CLOCK_SECOND * 300)

PROCESS(system_status_process, "system status process");
PROCESS_THREAD(system_status_process, ev, data)
{

    PROCESS_BEGIN();
    {
        if (ev == PROCESS_EVENT_INIT) {
            gpio_set_as_output(SYSTEM_STATE_LED);
        }
        while (1) {
            static struct etimer et;
            gpio_set_pin(SYSTEM_STATE_LED, 1);
            etimer_set(&et, SYSTEM_STATE_BLINK_ONTIME);
            PROCESS_YIELD_UNTIL(ev == PROCESS_EVENT_TIMER);
            gpio_set_pin(SYSTEM_STATE_LED, 0);
            etimer_set(&et, SYSTEM_STATE_BLINK_OFFTIME);
            PROCESS_YIELD_UNTIL(ev == PROCESS_EVENT_TIMER);
        }
    }
    PROCESS_END();
}

PROCESS(system_monit_process, "system monit process");
PROCESS_THREAD(system_monit_process, ev, data)
{
    static struct timer tm;
    PROCESS_BEGIN();
    {
        if (ev == PROCESS_EVENT_INIT) {
            IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
            IWDG_SetPrescaler(IWDG_Prescaler_16);
            IWDG_SetReload(0xFFF);
            IWDG_ReloadCounter();
            IWDG_Enable();
        }
        timer_set(&tm, SYSTEM_OPERATION_TIMEOUT);
        while (1) {
            PROCESS_PAUSE();
            IWDG_ReloadCounter();
            if (timer_expired(&tm)) {
                rtc_wakeup_after_second(5);
            }
        }
    }
    PROCESS_END();
}

void system_status_init()
{
    process_start(&system_status_process, NULL);
    process_start(&system_monit_process, NULL);
}