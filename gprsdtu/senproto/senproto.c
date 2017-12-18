#include "stdint.h"
#include "stddef.h"
#include "senproto.h"


#define __SENPROTO__(name) extern struct senproto_struct name##_senproto;
SENPROTO_CONFGS
#undef __SENPROTO__


struct senproto_struct *sensors_table[] = {
#define __SENPROTO__(name) &name##_senproto,
        SENPROTO_CONFGS
#undef __SENPROTO__
        NULL
};


struct senproto_struct *senproto_lookup(uint32_t id)
{
    if (id > sizeof(sensors_table)) return NULL;
    return sensors_table[id];
}
