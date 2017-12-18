#include "contiki.h"
#include "sys/rtimer.h"

void rtimer_arch_init(void)
{
  return;
}

void rtimer_arch_schedule(rtimer_clock_t t)
{
  
}

rtimer_clock_t rtimer_arch_now()
{
  return 0;
}