///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       29/Dec/2017  09:11:20
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\cpu\clock.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\clock.c -D STM32F10X_MD -D
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
//    List file    =  D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\clock.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN FLASH_SetLatency
        EXTERN RCC_APB1PeriphClockCmd
        EXTERN RCC_APB2PeriphClockCmd
        EXTERN RCC_GetFlagStatus
        EXTERN RCC_GetSYSCLKSource
        EXTERN RCC_HCLKConfig
        EXTERN RCC_PCLK1Config
        EXTERN RCC_PCLK2Config
        EXTERN RCC_PLLCmd
        EXTERN RCC_PLLConfig
        EXTERN RCC_SYSCLKConfig
        EXTERN SysTick_CLKSourceConfig
        EXTERN __aeabi_uldivmod

        PUBLIC SysTick_Handler
        PUBLIC clock_delay
        PUBLIC clock_delay_usec
        PUBLIC clock_fine_max
        PUBLIC clock_init
        PUBLIC clock_seconds
        PUBLIC clock_set_seconds
        PUBLIC clock_time
        PUBLIC clock_wait
        PUBLIC ms_count
        PUBLIC second_count


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp void NVIC_SetPriority(IRQn_Type, uint32_t)
NVIC_SetPriority:
        PUSH     {R4}
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BPL.N    ??NVIC_SetPriority_0
        LSLS     R2,R1,#+4
        LDR.N    R3,??DataTable6  ;; 0xe000ed18
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        ANDS     R4,R0,#0xF
        ADDS     R3,R4,R3
        STRB     R2,[R3, #-4]
        B.N      ??NVIC_SetPriority_1
??NVIC_SetPriority_0:
        LSLS     R2,R1,#+4
        LDR.N    R3,??DataTable6_1  ;; 0xe000e400
        SXTB     R0,R0            ;; SignExt  R0,R0,#+24,#+24
        STRB     R2,[R0, R3]
??NVIC_SetPriority_1:
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// static __interwork __softfp uint32_t SysTick_Config(uint32_t)
SysTick_Config:
        PUSH     {R4,LR}
        MOVS     R4,R0
        SUBS     R0,R4,#+1
        CMP      R0,#+16777216
        BCC.N    ??SysTick_Config_0
        MOVS     R0,#+1
        B.N      ??SysTick_Config_1
??SysTick_Config_0:
        SUBS     R0,R4,#+1
        LDR.N    R1,??DataTable6_2  ;; 0xe000e014
        STR      R0,[R1, #+0]
        MOVS     R1,#+15
        MOVS     R0,#-1
        BL       NVIC_SetPriority
        MOVS     R0,#+0
        LDR.N    R1,??DataTable6_3  ;; 0xe000e018
        STR      R0,[R1, #+0]
        MOVS     R0,#+7
        LDR.N    R1,??DataTable6_4  ;; 0xe000e010
        STR      R0,[R1, #+0]
        MOVS     R0,#+0
??SysTick_Config_1:
        POP      {R4,PC}          ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
ms_count:
        DS8 8

        SECTION `.bss`:DATA:REORDER:NOROOT(3)
second_count:
        DS8 8

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
clock_init:
        PUSH     {R7,LR}
        MOVS     R1,#+3670016
        MOVS     R0,#+0
        BL       RCC_PLLConfig
        MOVS     R0,#+1
        BL       RCC_PLLCmd
??clock_init_0:
        MOVS     R0,#+57
        BL       RCC_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??clock_init_0
        MOVS     R0,#+1
        BL       FLASH_SetLatency
        MOVS     R0,#+2
        BL       RCC_SYSCLKConfig
??clock_init_1:
        BL       RCC_GetSYSCLKSource
        CMP      R0,#+8
        BNE.N    ??clock_init_1
        MOVS     R0,#+0
        BL       RCC_HCLKConfig
        MOV      R0,#+1024
        BL       RCC_PCLK1Config
        MOVS     R0,#+0
        BL       RCC_PCLK2Config
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       RCC_APB2PeriphClockCmd
        MOVS     R1,#+1
        MOVS     R0,#+134217728
        BL       RCC_APB1PeriphClockCmd
        MOVS     R1,#+1
        MOVS     R0,#+268435456
        BL       RCC_APB1PeriphClockCmd
        MOVS     R1,#+1
        MOV      R0,#+16384
        BL       RCC_APB1PeriphClockCmd
        MOVS     R0,#+4
        BL       SysTick_CLKSourceConfig
        MOV      R0,#+64000
        BL       SysTick_Config
        MOVS     R0,#+0
        MOVS     R1,#+0
        LDR.N    R2,??DataTable6_5
        STRD     R0,R1,[R2, #+0]
        MOVS     R0,#+0
        MOVS     R1,#+0
        LDR.N    R2,??DataTable6_6
        STRD     R0,R1,[R2, #+0]
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
clock_time:
        LDR.N    R2,??DataTable6_5
        LDRD     R0,R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
clock_seconds:
        LDR.N    R2,??DataTable6_6
        LDRD     R0,R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
clock_set_seconds:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable6_6
        STRD     R0,R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
clock_wait:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        BL       clock_time
        ADDS     R0,R4,R0
        MOVS     R5,R0
??clock_wait_0:
        BL       clock_time
        CMP      R0,R5
        BCC.N    ??clock_wait_0
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
clock_delay_usec:
        MOVS     R1,#+0
??clock_delay_usec_0:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R1,R0
        BGE.N    ??clock_delay_usec_1
        MOVS     R2,#+0
??clock_delay_usec_2:
        CMP      R2,#+100
        BGE.N    ??clock_delay_usec_3
        ADDS     R2,R2,#+1
        B.N      ??clock_delay_usec_2
??clock_delay_usec_3:
        ADDS     R1,R1,#+1
        B.N      ??clock_delay_usec_0
??clock_delay_usec_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
clock_fine_max:
        MOVS     R0,#+0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
clock_delay:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BL       clock_delay_usec
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SysTick_Handler:
        PUSH     {LR}
        LDR.N    R0,??DataTable6_5
        LDRD     R2,R3,[R0, #+0]
        ADDS     R0,R2,#+1
        ADCS     R1,R3,#+0
        LDR.N    R2,??DataTable6_5
        STRD     R0,R1,[R2, #+0]
        LDR.N    R2,??DataTable6_5
        LDRD     R0,R1,[R2, #+0]
        MOV      R2,#+1000
        MOVS     R3,#+0
        BL       __aeabi_uldivmod
        LDR.N    R2,??DataTable6_6
        STRD     R0,R1,[R2, #+0]
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6:
        DC32     0xe000ed18

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_1:
        DC32     0xe000e400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_2:
        DC32     0xe000e014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_3:
        DC32     0xe000e018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_4:
        DC32     0xe000e010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_5:
        DC32     ms_count

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable6_6:
        DC32     second_count

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
//  16 bytes in section .bss
// 390 bytes in section .text
// 
// 390 bytes of CODE memory
//  16 bytes of DATA memory
//
//Errors: none
//Warnings: none
