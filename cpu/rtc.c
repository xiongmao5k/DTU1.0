#include "stdint.h"
#include "stm32f10x.h"
#include "rtc.h"
#include "gpio.h"
#include "logger.h"

#define RTC_LOG_ENABLE 0
void rtc_init(void)
{
    uint16_t sleepFlag = 0;
    PWR_BackupAccessCmd(ENABLE);
    BKP_ClearFlag();
    sleepFlag = BKP_ReadBackupRegister(BKP_DR1);
    if (sleepFlag == 1) {
        BKP_WriteBackupRegister(BKP_DR1, 0);
        PWR_EnterSTANDBYMode();
    }
    if (PWR_GetFlagStatus(PWR_FLAG_SB) != RESET) {
        PWR_ClearFlag(PWR_FLAG_SB);
        RTC_WaitForSynchro();
        RTC_ITConfig(RTC_IT_ALR, ENABLE);
        RTC_WaitForLastTask();
    } else {
        RCC_LSEConfig(RCC_LSE_ON);
        while (RCC_GetFlagStatus(RCC_FLAG_LSERDY) == RESET);
        RCC_RTCCLKConfig(RCC_RTCCLKSource_LSE);
        RCC_RTCCLKCmd(ENABLE);
        RTC_WaitForSynchro();
        RTC_SetPrescaler(32767);
        RTC_WaitForLastTask();
        RTC_ITConfig(RTC_IT_ALR, ENABLE);
        RTC_WaitForLastTask();
        gpio_set_pin(GPIOA_GPIO_Pin_0, 1);
    }
}

void rtc_set_time(uint32_t time)
{
    RTC_SetCounter(time);
}

uint32_t rtc_get_time(void)
{
    return RTC_GetCounter();
}

void rtc_set_alarm(uint32_t time)
{
    RTC_SetAlarm(time);
}

void rtc_wakeup_after_second(uint32_t second)
{
    RTC_ClearFlag(RTC_FLAG_SEC);
    while (RTC_GetFlagStatus(RTC_FLAG_SEC) == RESET);
    RTC_SetAlarm(RTC_GetCounter() + second);
    RTC_WaitForLastTask();
    BKP_WriteBackupRegister(BKP_DR1, 1);
    LOG_OUT(RTC_LOG_ENABLE, "4\n");
    PWR_EnterSTANDBYMode();
}

void rtc_wakeup_at_second(uint32_t second)
{
    uint32_t curTime = 0;
    RTC_ClearFlag(RTC_FLAG_SEC);
    while (RTC_GetFlagStatus(RTC_FLAG_SEC) == RESET);
    curTime = RTC_GetCounter();
    if (curTime + 3 > second) {
        LOG_OUT(RTC_LOG_ENABLE, "5\n");
        second = curTime + 60 * 5;
    }
    RTC_SetAlarm(second);
    RTC_WaitForLastTask();
    BKP_WriteBackupRegister(BKP_DR1, 1);
    PWR_EnterSTANDBYMode();
}

void RTCAlarm_IRQHandler(void)
{
    RTC_ClearFlag(RTC_FLAG_ALR);
}