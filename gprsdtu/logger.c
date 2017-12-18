#include "logger.h"

#include "senif.h"
#include "spiffs.h"
#include "spiffs_disk.h"

#include "string.h"
#include "stdarg.h"
#include "stdio.h"

void log_out(const char *fmg, ...) {
    va_list arg;
    char buff[strlen(fmg) + 64];
    int res;
    spiffs_file fd = 0;

    va_start(arg, fmg);
    res = sprintf(buff, fmg, arg);

    if ((fd = dl_SPIFFS_open(SPIFFS_DISK, "logfile.txt", SPIFFS_WRONLY | SPIFFS_CREAT, NULL)) < 0) {
        return;
    }

    dl_SPIFFS_lseek(SPIFFS_DISK, fd, 0, SPIFFS_SEEK_END);

    if (dl_SPIFFS_write(SPIFFS_DISK, fd, buff, res) != res) {
        dl_SPIFFS_close(SPIFFS_DISK, fd);
        return;
    }

    dl_SPIFFS_close(SPIFFS_DISK, fd);
	log_print();
}

void log_print(void) {
    char buff[128];
    spiffs_file fd;
    int res;

    senif_power_open(SENIF3);
    senif_open(SENIF3);

    fd = dl_SPIFFS_open(SPIFFS_DISK, "logfile.txt", SPIFFS_RDONLY, NULL);
    if (fd < 0) {
        return;
    }

    while ((res = dl_SPIFFS_read(SPIFFS_DISK, fd, buff, 128)) > 0) {
        senif_write(SENIF3, buff, res);
        if (res != 128) {
            break;
        }
    }
    senif_close(SENIF3);
    senif_power_close(SENIF3);
    dl_SPIFFS_close(SPIFFS_DISK, fd);
}
