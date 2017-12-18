#ifndef EDIT_SPIFFS_DISK_H
#define EDIT_SPIFFS_DISK_H

#include "spiffs.h"

#define SPIFFS_DISK &xFs

void
SPIFFS_DiskInit(void);

extern spiffs xFs;

#endif //EDIT_SPIFFS_DISK_H
