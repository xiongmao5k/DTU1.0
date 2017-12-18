#ifndef SOFTWARE_RTC_H
#define SOFTWARE_RTC_H
#include "stdint.h"

void rtc_init(void);
void rtc_set_time(uint32_t time);
uint32_t rtc_get_time(void);
void rtc_set_alarm(uint32_t time);
void rtc_wakeup_after_second(uint32_t second);
void rtc_wakeup_at_second(uint32_t second);
#endif //SOFTWARE_RTC_H
