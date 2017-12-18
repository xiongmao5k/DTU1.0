#ifndef LOGGER_H
#define LOGGER_H

#define LOG_OUT_ENABLE 1

#if LOG_OUT_ENABLE
#define LOG_OUT(l, msg...) if (l) log_out(msg)
#else
#define LOG_OUT(l, msg)
#endif

void log_out(const char *restrict, ...);
void log_print(void);

#endif
