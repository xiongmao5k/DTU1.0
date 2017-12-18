#include <stm32f10x_conf.h>
#include "stdint.h"
#include "stm32f10x.h"
#include "gpio.h"
#include "senif.h"
#include "stdio.h"
#include "rtc.h"
#include "string.h"
#include "deviceid.h"
#include "battery.h"

#define BETTERY_CHARGE_STATE_PIN GPIOA_GPIO_Pin_12

static void adc_init()
{
    ADC_InitTypeDef adc_init_struct;
    GPIO_InitTypeDef gpio_init_struct;

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_ADC1, ENABLE);
    RCC_ADCCLKConfig(RCC_PCLK2_Div6);

    gpio_init_struct.GPIO_Mode = GPIO_Mode_AIN;
    gpio_init_struct.GPIO_Pin = GPIO_Pin_1;
    gpio_init_struct.GPIO_Speed = GPIO_Speed_2MHz;
    GPIO_Init(GPIOB, &gpio_init_struct);

    ADC_StructInit(&adc_init_struct);
    adc_init_struct.ADC_NbrOfChannel = 1;
    adc_init_struct.ADC_ExternalTrigConv = ADC_ExternalTrigConv_None;
    ADC_Init(ADC1, &adc_init_struct);

    
    ADC_Cmd(ADC1, ENABLE);
    
    ADC_ResetCalibration(ADC1);
    while(ADC_GetResetCalibrationStatus(ADC1));
    ADC_StartCalibration(ADC1);
    while(ADC_GetCalibrationStatus(ADC1));
    
    ADC_RegularChannelConfig(ADC1, ADC_Channel_9, 1, ADC_SampleTime_1Cycles5);

}

static uint32_t adc_read(void)
{
    ADC_SoftwareStartConvCmd(ADC1, ENABLE);
    while (ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == RESET);
    return ADC_GetConversionValue(ADC1);
}



static int charg_state()
{
    return gpio_get_pin(BETTERY_CHARGE_STATE_PIN);
}

static void simple_delay()
{
    volatile int cnt = 100000;
    while (cnt--);
}

int battery_check_power(void)
{
    uint32_t btval1, btval2, btval3;
    senif_power_open(SENIF1);
    simple_delay();
    btval1 = adc_read();
    senif_power_close(SENIF1);
    senif_power_open(SENIF3);
    simple_delay();
    btval2 = adc_read();
    senif_power_close(SENIF3);
    senif_power_open(SENIF5);
    simple_delay();
    btval3 = adc_read();
    senif_power_close(SENIF5);
    if (btval1 < 700 && btval3 < 700) {
        if (btval2 < BATTERY_POWER_THRESHOLD) {
            return BATTERY_POWER_LOW;
        } else {
            return BATTERY_POWER_HIGH;
        }
    } else {
        if (btval1 < BATTERY_POWER_THRESHOLD ||
            btval2 < BATTERY_POWER_THRESHOLD ||
            btval3 < BATTERY_POWER_THRESHOLD) {
            return BATTERY_POWER_LOW;
        } else {
            return BATTERY_POWER_HIGH;
        }
    }
}




int battery_read(void *buff, uint32_t size)
{
#define ADCVAL_TO_VOLTAGE(val) (((double)val) * 5.6 / 4096.0)
    uint32_t btval1, btval2, btval3;
    uint32_t btcharg1, btcharg2, btcharg3;
    senif_power_open(SENIF1);
    simple_delay();
    btval1 = adc_read();
    btcharg1 = charg_state();
    senif_power_close(SENIF1);
    senif_power_open(SENIF3);
    simple_delay();
    btval2 = adc_read();
    btcharg2 = charg_state();
    senif_power_close(SENIF3);
    senif_power_open(SENIF5);
    simple_delay();
    btval3 = adc_read();
    btcharg3 = charg_state();
    senif_power_close(SENIF5);
    sprintf(buff, "%u|%d|%.2lf|%.2lf|%.2lf|%d|%d|%d", deviceid_read(), rtc_get_time(),
            ADCVAL_TO_VOLTAGE(btval1), ADCVAL_TO_VOLTAGE(btval2), ADCVAL_TO_VOLTAGE(btval3),
            btcharg1, btcharg2, btcharg3);
    return strlen(buff);
}


void battery_init()
{
    GPIO_InitTypeDef gpio_init_struct;

    gpio_init_struct.GPIO_Speed = GPIO_Speed_10MHz;
    gpio_init_struct.GPIO_Mode = GPIO_Mode_IPD;
    gpio_init_struct.GPIO_Pin = GPIO_Pin_12;
    GPIO_Init(GPIOA, &gpio_init_struct);
    adc_init();
}
