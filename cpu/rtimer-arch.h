#ifndef RTIMER_ARCH_H_
#define RTIMER_ARCH_H_
#include "contiki.h"
#define RTIMER_ARCH_SECOND 65536
rtimer_clock_t rtimer_arch_now(void);
#endif