#include <gprs.h>
#include <cfs/cfs-coffee.h>
#include "contiki.h"
#include "stdio.h"
#include "rtc.h"
#include "stm32f10x.h"
#include "cfs.h"
#include "string.h"
#include "gpio.h"
#include "clock.h"
#include "usart.h"
#include "ringbuf.h"
#include "sim800.h"
#include "gprs.h"
#include "crc.h"
#include "senif.h"
#include "battery.h"
#include "sensor_data_backup.h"
#include "system_status.h"
#include "crc.h"
#include "spiffs_disk.h"
#include "spiffs.h"
#include "configure.h"
#include "logger.h"

static void spiffs_test(void);

static void senifs_init(void)
{
    senif_init(SENIF1);
    senif_init(SENIF2);
    senif_init(SENIF3);
    senif_init(SENIF4);
    senif_init(SENIF5);
    senif_init(SENIF6);
}

extern void sdcdtu_init(void);
int main()
{
    clock_init();
    gpio_init();    
    crc_init();
    SPI_FLASH_Init();
    //SPI_FLASH_ChipErase();
    dl_fs_init();
    senifs_init();
    rtc_init();
    battery_init();
    backup_init();
    //log_print();
    //while(1);
    //spiffs_test();
    process_init();
    process_start(&etimer_process, NULL);
    gprs_init(NULL, NULL);
    sdcdtu_init();
    system_status_init();
    while (1) {
        process_run();
        etimer_request_poll();
    }
}


void SystemInit(void)
{

}


size_t __write(int handle, const unsigned char *buffer, size_t size)
{
    // usart_write(1, (void *)buffer, size);
    return size;
}


static void spiffs_test(void) {
  static uint8_t test_data[40] = {0};
  int i = 0, res = 0;
  for(i; i<3000; i++){
    res = backup_push(test_data, 36); 
    if (res != 0){
        printf("test");
        return;
    }
  }
  for (i = 0; i < 1000 ; i++) {
    static char t[600] = {0};
    if(backup_pop(t, 512) == 1){
        printf("test2");
        return ;
    }
  }
  backup_clean();
}
