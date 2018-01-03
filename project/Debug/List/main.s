///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       29/Dec/2017  09:11:22
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\main.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\main.c -D STM32F10X_MD -D
//        USE_STDPERIPH_DRIVER -lb
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\ --diag_suppress
//        Pa050 -o D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\Obj\ --no_cse
//        --no_unroll --no_inline --no_code_motion --no_tbaa --no_clustering
//        --no_scheduling --debug --endian=little --cpu=Cortex-M3 -e --fpu=None
//        --dlib_config D:\software\IAR\arm\INC\c\DLib_Config_Normal.h -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\cpu\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\cpu\Libraries\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\cpu\Libraries\STM32F10x_StdPeriph_Driver\inc\
//        -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\cpu\Libraries\CMSIS\CM3\DeviceSupport\ST\STM32F10x\
//        -I D:\Ruhr\Xiongmao\github\DTU1.0\project\..\ctkcore\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\ctkcore\sys\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\ctkcore\lib\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\ctkcore\cfs\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\gprsdtu\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\gprsdtu\senproto\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\tools\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\gprsdtu\spiffs\src\ -I
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\gprsdtu\dev\ -On --vla
//        --use_c++_inline -I D:\software\IAR\arm\CMSIS\Include\
//    List file    =  D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\main.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN SPI_FLASH_Init
        EXTERN backup_init
        EXTERN battery_init
        EXTERN clock_init
        EXTERN crc_init
        EXTERN dl_fs_init
        EXTERN etimer_process
        EXTERN etimer_request_poll
        EXTERN gpio_init
        EXTERN gprs_init
        EXTERN process_init
        EXTERN process_run
        EXTERN process_start
        EXTERN rtc_init
        EXTERN sdcdtu_init
        EXTERN senif_init
        EXTERN system_status_init

        PUBLIC SystemInit
        PUBLIC __write
        PUBLIC main


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
senifs_init:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        BL       senif_init
        MOVS     R0,#+1
        BL       senif_init
        MOVS     R0,#+2
        BL       senif_init
        MOVS     R0,#+3
        BL       senif_init
        MOVS     R0,#+4
        BL       senif_init
        MOVS     R0,#+5
        BL       senif_init
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
main:
        PUSH     {R7,LR}
        BL       clock_init
        BL       gpio_init
        BL       crc_init
        BL       SPI_FLASH_Init
        BL       dl_fs_init
        BL       senifs_init
        BL       rtc_init
        BL       battery_init
        BL       backup_init
        BL       process_init
        MOVS     R1,#+0
        LDR.N    R0,??DataTable0
        BL       process_start
        MOVS     R1,#+0
        MOVS     R0,#+0
        BL       gprs_init
        BL       sdcdtu_init
        BL       system_status_init
??main_0:
        BL       process_run
        BL       etimer_request_poll
        B.N      ??main_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable0:
        DC32     etimer_process

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SystemInit:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
__write:
        MOVS     R3,R0
        MOVS     R0,R2
        BX       LR               ;; return

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        END
// 
// 128 bytes in section .text
// 
// 128 bytes of CODE memory
//
//Errors: none
//Warnings: 12
