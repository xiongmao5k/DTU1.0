///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       15/Dec/2017  11:10:26
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_pwr.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_pwr.c
//        -D STM32F10X_MD -D USE_STDPERIPH_DRIVER -lb
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
//    List file    =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\stm32f10x_pwr.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB1PeriphResetCmd

        PUBLIC PWR_BackupAccessCmd
        PUBLIC PWR_ClearFlag
        PUBLIC PWR_DeInit
        PUBLIC PWR_EnterSTANDBYMode
        PUBLIC PWR_EnterSTOPMode
        PUBLIC PWR_GetFlagStatus
        PUBLIC PWR_PVDCmd
        PUBLIC PWR_PVDLevelConfig
        PUBLIC PWR_WakeUpPinCmd


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_DeInit:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+268435456
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+268435456
        BL       RCC_APB1PeriphResetCmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_BackupAccessCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable7  ;; 0x420e0020
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_PVDCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable7_1  ;; 0x420e0010
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_PVDLevelConfig:
        MOVS     R1,#+0
        LDR.N    R1,??DataTable7_2  ;; 0x40007000
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0xE0
        ORRS     R1,R0,R1
        LDR.N    R0,??DataTable7_2  ;; 0x40007000
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_WakeUpPinCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable7_3  ;; 0x420e00a0
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_EnterSTOPMode:
        MOVS     R2,#+0
        LDR.N    R2,??DataTable7_2  ;; 0x40007000
        LDR      R2,[R2, #+0]
        LSRS     R2,R2,#+2
        LSLS     R2,R2,#+2
        ORRS     R2,R0,R2
        LDR.N    R0,??DataTable7_2  ;; 0x40007000
        STR      R2,[R0, #+0]
        LDR.N    R0,??DataTable7_4  ;; 0xe000ed10
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R2,??DataTable7_4  ;; 0xe000ed10
        STR      R0,[R2, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+1
        BNE.N    ??PWR_EnterSTOPMode_0
        WFI      
        B.N      ??PWR_EnterSTOPMode_1
??PWR_EnterSTOPMode_0:
        WFE      
??PWR_EnterSTOPMode_1:
        LDR.N    R0,??DataTable7_4  ;; 0xe000ed10
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x4
        LDR.N    R1,??DataTable7_4  ;; 0xe000ed10
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_EnterSTANDBYMode:
        LDR.N    R0,??DataTable7_2  ;; 0x40007000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable7_2  ;; 0x40007000
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable7_2  ;; 0x40007000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.N    R1,??DataTable7_2  ;; 0x40007000
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable7_4  ;; 0xe000ed10
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.N    R1,??DataTable7_4  ;; 0xe000ed10
        STR      R0,[R1, #+0]
        WFI      
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_GetFlagStatus:
        MOVS     R1,#+0
        LDR.N    R1,??DataTable7_5  ;; 0x40007004
        LDR      R1,[R1, #+0]
        TST      R1,R0
        BEQ.N    ??PWR_GetFlagStatus_0
        MOVS     R1,#+1
        B.N      ??PWR_GetFlagStatus_1
??PWR_GetFlagStatus_0:
        MOVS     R1,#+0
??PWR_GetFlagStatus_1:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
PWR_ClearFlag:
        LDR.N    R1,??DataTable7_2  ;; 0x40007000
        LDR      R1,[R1, #+0]
        ORRS     R0,R1,R0, LSL #+2
        LDR.N    R1,??DataTable7_2  ;; 0x40007000
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0x420e0020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0x420e0010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     0x40007000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     0x420e00a0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     0xe000ed10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     0x40007004

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
// 220 bytes in section .text
// 
// 220 bytes of CODE memory
//
//Errors: none
//Warnings: none
