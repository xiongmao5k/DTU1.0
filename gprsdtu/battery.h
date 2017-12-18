#ifndef SOFTWARE_BATTERY_H
#define SOFTWARE_BATTERY_H
enum {
    BATTERY_POWER_LOW,
    BATTERY_POWER_HIGH,
};

#define BATTERY_POWER_THRESHOLD ((int)(3.2 * 4096 / 5.6))

void battery_init();
int battery_read(void *buff, uint32_t size);
int battery_check_power(void);
#endif //SOFTWARE_BATTERY_H
