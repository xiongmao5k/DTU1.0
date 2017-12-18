#include "contiki.h"
#include "stm32f10x.h"
#include "stdint.h"


uint64_t ms_count = 0;
uint64_t second_count = 0;


void clock_init(void)
{
    // RCC_HSEConfig(RCC_HSE_ON);
    // RCC_WaitForHSEStartUp();

    // RCC_PLLConfig(RCC_PLLSource_HSI_Div1, RCC_PLLMul_9);
    RCC_PLLConfig(RCC_PLLSource_HSI_Div2, RCC_PLLMul_16);
    RCC_PLLCmd(ENABLE);
    while (RCC_GetFlagStatus(RCC_FLAG_PLLRDY) == RESET);

    FLASH_SetLatency(FLASH_Latency_1);
    RCC_SYSCLKConfig(RCC_SYSCLKSource_PLLCLK);
    while (RCC_GetSYSCLKSource() != 8);

    RCC_HCLKConfig(RCC_SYSCLK_Div1);
    RCC_PCLK1Config(RCC_HCLK_Div2);
    RCC_PCLK2Config(RCC_HCLK_Div1);

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_AFIO, ENABLE);
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_BKP, ENABLE);
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_PWR, ENABLE);
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2, ENABLE);

    SysTick_CLKSourceConfig(SysTick_CLKSource_HCLK);
    SysTick_Config(64 * 1000);
    ms_count = 0;
    second_count = 0;
}
 
clock_time_t clock_time(void)
{
    return (clock_time_t)(ms_count & 0xFFFFFFFF);
}
 
unsigned long clock_seconds(void)
{
    return second_count;
}
 
void clock_set_seconds(unsigned long sec)
{
    second_count = sec;
}
 
void clock_wait(clock_time_t t)
{
    clock_time_t stop;
    stop = clock_time() + t;
    while (clock_time() < stop);
}
 
void clock_delay_usec(uint16_t dt)
{
    for (int i = 0; i < dt; ++i)
        for (int k = 0; k < 100; ++k);
}

int clock_fine_max(void)
{
    return 0;
}
 
void clock_delay(unsigned int delay)
{
    clock_delay_usec(delay);
}

void SysTick_Handler(void)
{
    ms_count += 1;
    second_count = ms_count / 1000;
}

