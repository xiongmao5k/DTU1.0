#include "senif.h"
#include "usart.h"
#include "usart_stream.h"


struct power_ctrl_struct {
  uint32_t count;
  uint32_t channel_a_pin;
  uint32_t channel_b_pin;
};

struct senif_struct {
    uint32_t usart_stream_id;
    uint32_t power_pin;
    uint32_t rs485_dir_pin;
    struct power_ctrl_struct *power_ctrl;
};

#define __POWER_CONTROL__(name, cap, cbp)\
static struct power_ctrl_struct name = {0, cap, cbp};
POWER_CONTROL_CONFIG
#undef __POWER_CONTROL__

static struct senif_struct sensor_interfaces[] = {
#define __SENIF__(name, uart_stream, power_pin, dir_pin, power_ctrl) {uart_stream, power_pin, dir_pin, &power_ctrl},
SENIF_CONFIGS
#undef __SENIF__
};


#define SENIF_POWERON   1
#define SENIF_POWEROFF   0
#define SENIF_DIR_IN    0
#define SENIF_DIR_OUT 1


static void power_ctrl_init(struct power_ctrl_struct *ctrl)
{
    gpio_set_as_output(ctrl->channel_a_pin);
    gpio_set_as_output(ctrl->channel_b_pin);
    gpio_set_pin(ctrl->channel_b_pin, 0);
    gpio_set_pin(ctrl->channel_a_pin, 0);
    ctrl->count = 0;
}

void senif_init (uint32_t senif_id)
{
    struct senif_struct *senif;

    if (senif_id < SENIF_LIMIT) {
        senif = &sensor_interfaces[senif_id];
        usart_stream_init(senif->usart_stream_id);
        gpio_set_as_output(senif->power_pin);
        gpio_set_as_output(senif->rs485_dir_pin);
        power_ctrl_init(senif->power_ctrl);

        gpio_set_pin(senif->power_pin, SENIF_POWEROFF);
        gpio_set_pin(senif->rs485_dir_pin, SENIF_DIR_IN);
    }
}

uint32_t senif_power_open (uint32_t senif_id)
{
    struct senif_struct *senif;

    if (senif_id < SENIF_LIMIT) {
        senif = &sensor_interfaces[senif_id];
        if (senif->power_ctrl->count == 0)
            gpio_set_pin(senif->power_pin, SENIF_POWERON);
        senif->power_ctrl->count += 1;
    }
    return 0;
}

uint32_t senif_power_close (uint32_t senif_id)
{
    struct senif_struct *senif;

    if (senif_id < SENIF_LIMIT) {
        senif = &sensor_interfaces[senif_id];
        senif->power_ctrl->count -= 1;
        if (senif->power_ctrl->count == 0)
            gpio_set_pin(senif->power_pin, SENIF_POWEROFF);
    }
    return 0;
}

int senif_open(uint32_t senif_id)
{
    struct senif_struct *senif;
    uint32_t mode = senif_id % 2;

    if (senif_id < SENIF_LIMIT) {
        senif = &sensor_interfaces[senif_id];
        if (mode == 0) {
            // enable channel a
            gpio_set_pin(senif->power_ctrl->channel_b_pin, 0);
            gpio_set_pin(senif->power_ctrl->channel_a_pin, 1);
        } else {
            // enable channel b
            gpio_set_pin(senif->power_ctrl->channel_a_pin, 0);
            gpio_set_pin(senif->power_ctrl->channel_b_pin, 1);
        }
    }
    return 0;
}

int senif_close(uint32_t senif_id)
{
    struct senif_struct *senif;

    if (senif_id < SENIF_LIMIT) {
        senif = &sensor_interfaces[senif_id];
        gpio_set_pin(senif->power_ctrl->channel_b_pin, 0);
        gpio_set_pin(senif->power_ctrl->channel_a_pin, 0);
    }
    return 0;
}

uint32_t senif_write_byte (uint32_t senif_id, uint8_t byte)
{
    struct senif_struct *senif;
    if (senif_id < SENIF_LIMIT) {
        uint32_t result = 0;
        senif = &sensor_interfaces[senif_id];
        gpio_set_pin(senif->rs485_dir_pin, SENIF_DIR_OUT);
        result = usart_stream_write(senif->usart_stream_id, &byte, 1);
        gpio_set_pin(senif->rs485_dir_pin, SENIF_DIR_IN);
        return result;
    }
    return 0;
}

uint32_t senif_write (uint32_t senif_id, void *buf, int size)
{
    struct senif_struct *senif;
    if (senif_id < SENIF_LIMIT) {
        uint32_t result = 0;
        senif = &sensor_interfaces[senif_id];
        gpio_set_pin(senif->rs485_dir_pin, SENIF_DIR_OUT);
        result = usart_stream_write(senif->usart_stream_id, buf, size);
        gpio_set_pin(senif->rs485_dir_pin, SENIF_DIR_IN);
        return result;
    }
    return 0;
}

uint32_t senif_read (uint32_t senif_id, void *buf, int size)
{
    struct senif_struct *senif;
    if (senif_id < SENIF_LIMIT) {
        senif = &sensor_interfaces[senif_id];
        return usart_stream_read(senif->usart_stream_id, buf, size);
    }
    return 0;
}
