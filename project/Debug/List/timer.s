///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       15/Dec/2017  11:10:27
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\ctkcore\sys\timer.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\ctkcore\sys\timer.c -D STM32F10X_MD -D
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\gprsdtu\dev\ -Ol --vla
//        --use_c++_inline -I D:\software\IAR\arm\CMSIS\Include\
//    List file    =  D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\timer.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN clock_time

        PUBLIC timer_expired
        PUBLIC timer_remaining
        PUBLIC timer_reset
        PUBLIC timer_restart
        PUBLIC timer_set


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
timer_set:
        PUSH     {R4,LR}
        MOVS     R4,R0
        STR      R1,[R4, #+4]
        BL       clock_time
        STR      R0,[R4, #+0]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
timer_reset:
        LDR      R1,[R0, #+0]
        LDR      R2,[R0, #+4]
        ADDS     R1,R2,R1
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
timer_restart:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       clock_time
        STR      R0,[R4, #+0]
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
timer_expired:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       clock_time
        LDR      R1,[R4, #+0]
        SUBS     R0,R0,R1
        ADDS     R0,R0,#+1
        LDR      R1,[R4, #+4]
        CMP      R1,R0
        BCS.N    ??timer_expired_0
        MOVS     R0,#+1
        B.N      ??timer_expired_1
??timer_expired_0:
        MOVS     R0,#+0
??timer_expired_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
timer_remaining:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       clock_time
        LDR      R1,[R4, #+0]
        LDR      R2,[R4, #+4]
        ADDS     R1,R2,R1
        SUBS     R0,R1,R0
        POP      {R4,PC}          ;; return

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
// 84 bytes in section .text
// 
// 84 bytes of CODE memory
//
//Errors: none
//Warnings: none
