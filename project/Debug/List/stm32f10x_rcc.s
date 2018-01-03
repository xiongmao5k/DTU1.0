///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       29/Dec/2017  09:11:28
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_rcc.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_rcc.c
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\gprsdtu\dev\ -On --vla
//        --use_c++_inline -I D:\software\IAR\arm\CMSIS\Include\
//    List file    =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\stm32f10x_rcc.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC RCC_ADCCLKConfig
        PUBLIC RCC_AHBPeriphClockCmd
        PUBLIC RCC_APB1PeriphClockCmd
        PUBLIC RCC_APB1PeriphResetCmd
        PUBLIC RCC_APB2PeriphClockCmd
        PUBLIC RCC_APB2PeriphResetCmd
        PUBLIC RCC_AdjustHSICalibrationValue
        PUBLIC RCC_BackupResetCmd
        PUBLIC RCC_ClearFlag
        PUBLIC RCC_ClearITPendingBit
        PUBLIC RCC_ClockSecuritySystemCmd
        PUBLIC RCC_DeInit
        PUBLIC RCC_GetClocksFreq
        PUBLIC RCC_GetFlagStatus
        PUBLIC RCC_GetITStatus
        PUBLIC RCC_GetSYSCLKSource
        PUBLIC RCC_HCLKConfig
        PUBLIC RCC_HSEConfig
        PUBLIC RCC_HSICmd
        PUBLIC RCC_ITConfig
        PUBLIC RCC_LSEConfig
        PUBLIC RCC_LSICmd
        PUBLIC RCC_MCOConfig
        PUBLIC RCC_PCLK1Config
        PUBLIC RCC_PCLK2Config
        PUBLIC RCC_PLLCmd
        PUBLIC RCC_PLLConfig
        PUBLIC RCC_RTCCLKCmd
        PUBLIC RCC_RTCCLKConfig
        PUBLIC RCC_SYSCLKConfig
        PUBLIC RCC_USBCLKConfig
        PUBLIC RCC_WaitForHSEStartUp


        SECTION `.data`:DATA:REORDER:NOROOT(2)
APBAHBPrescTable:
        DATA
        DC8 0, 0, 0, 0, 1, 2, 3, 4, 1, 2, 3, 4, 6, 7, 8, 9

        SECTION `.data`:DATA:REORDER:NOROOT(2)
ADCPrescTable:
        DATA
        DC8 2, 4, 6, 8

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_DeInit:
        LDR.W    R0,??DataTable30  ;; 0x40021000
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable30  ;; 0x40021000
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable30_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable30_2  ;; 0xf8ff0000
        ANDS     R0,R1,R0
        LDR.W    R1,??DataTable30_1  ;; 0x40021004
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable30  ;; 0x40021000
        LDR      R0,[R0, #+0]
        LDR.W    R1,??DataTable30_3  ;; 0xfef6ffff
        ANDS     R0,R1,R0
        LDR.W    R1,??DataTable30  ;; 0x40021000
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable30  ;; 0x40021000
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x40000
        LDR.W    R1,??DataTable30  ;; 0x40021000
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable30_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        BICS     R0,R0,#0x7F0000
        LDR.W    R1,??DataTable30_1  ;; 0x40021004
        STR      R0,[R1, #+0]
        MOVS     R0,#+10420224
        LDR.W    R1,??DataTable30_4  ;; 0x40021008
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_HSEConfig:
        LDR.W    R1,??DataTable30  ;; 0x40021000
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x10000
        LDR.W    R2,??DataTable30  ;; 0x40021000
        STR      R1,[R2, #+0]
        LDR.W    R1,??DataTable30  ;; 0x40021000
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x40000
        LDR.W    R2,??DataTable30  ;; 0x40021000
        STR      R1,[R2, #+0]
        MOVS     R1,R0
        CMP      R1,#+65536
        BEQ.N    ??RCC_HSEConfig_0
        CMP      R1,#+262144
        BEQ.N    ??RCC_HSEConfig_1
        B.N      ??RCC_HSEConfig_2
??RCC_HSEConfig_0:
        LDR.W    R1,??DataTable30  ;; 0x40021000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x10000
        LDR.W    R2,??DataTable30  ;; 0x40021000
        STR      R1,[R2, #+0]
        B.N      ??RCC_HSEConfig_3
??RCC_HSEConfig_1:
        LDR.W    R1,??DataTable30  ;; 0x40021000
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x50000
        LDR.W    R2,??DataTable30  ;; 0x40021000
        STR      R1,[R2, #+0]
        B.N      ??RCC_HSEConfig_3
??RCC_HSEConfig_2:
??RCC_HSEConfig_3:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_WaitForHSEStartUp:
        PUSH     {R3-R5,LR}
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R4,#+0
        MOVS     R5,#+0
??RCC_WaitForHSEStartUp_0:
        MOVS     R0,#+49
        BL       RCC_GetFlagStatus
        MOVS     R5,R0
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        CMP      R0,#+1280
        BEQ.N    ??RCC_WaitForHSEStartUp_1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+0
        BEQ.N    ??RCC_WaitForHSEStartUp_0
??RCC_WaitForHSEStartUp_1:
        MOVS     R0,#+49
        BL       RCC_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??RCC_WaitForHSEStartUp_2
        MOVS     R0,#+1
        MOVS     R4,R0
        B.N      ??RCC_WaitForHSEStartUp_3
??RCC_WaitForHSEStartUp_2:
        MOVS     R0,#+0
        MOVS     R4,R0
??RCC_WaitForHSEStartUp_3:
        MOVS     R0,R4
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_AdjustHSICalibrationValue:
        MOVS     R1,#+0
        LDR.W    R2,??DataTable30  ;; 0x40021000
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        BICS     R1,R1,#0xF8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R1,R1,R0, LSL #+3
        LDR.W    R2,??DataTable30  ;; 0x40021000
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_HSICmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable30_5  ;; 0x42420000
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_PLLConfig:
        MOVS     R2,#+0
        LDR.W    R3,??DataTable30_1  ;; 0x40021004
        LDR      R3,[R3, #+0]
        MOVS     R2,R3
        BICS     R2,R2,#0x3F0000
        ORRS     R3,R1,R0
        ORRS     R2,R3,R2
        LDR.W    R3,??DataTable30_1  ;; 0x40021004
        STR      R2,[R3, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_PLLCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.W    R1,??DataTable30_6  ;; 0x42420060
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_SYSCLKConfig:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        LSRS     R1,R1,#+2
        LSLS     R1,R1,#+2
        ORRS     R1,R0,R1
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_GetSYSCLKSource:
        LDR.N    R0,??DataTable30_1  ;; 0x40021004
        LDR      R0,[R0, #+0]
        ANDS     R0,R0,#0xC
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_HCLKConfig:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        BICS     R1,R1,#0xF0
        ORRS     R1,R0,R1
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_PCLK1Config:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        BICS     R1,R1,#0x700
        ORRS     R1,R0,R1
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_PCLK2Config:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        BICS     R1,R1,#0x3800
        ORRS     R1,R1,R0, LSL #+3
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_ITConfig:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_ITConfig_0
        LDR.N    R2,??DataTable30_7  ;; 0x40021009
        LDRB     R2,[R2, #+0]
        ORRS     R2,R0,R2
        LDR.N    R3,??DataTable30_7  ;; 0x40021009
        STRB     R2,[R3, #+0]
        B.N      ??RCC_ITConfig_1
??RCC_ITConfig_0:
        LDR.N    R2,??DataTable30_7  ;; 0x40021009
        LDRB     R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR.N    R3,??DataTable30_7  ;; 0x40021009
        STRB     R2,[R3, #+0]
??RCC_ITConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_USBCLKConfig:
        LDR.N    R1,??DataTable30_8  ;; 0x424200d8
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_ADCCLKConfig:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        LDR      R2,[R2, #+0]
        MOVS     R1,R2
        BICS     R1,R1,#0xC000
        ORRS     R1,R0,R1
        LDR.N    R2,??DataTable30_1  ;; 0x40021004
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_LSEConfig:
        MOVS     R1,#+0
        LDR.N    R2,??DataTable30_9  ;; 0x40021020
        STRB     R1,[R2, #+0]
        MOVS     R1,#+0
        LDR.N    R2,??DataTable30_9  ;; 0x40021020
        STRB     R1,[R2, #+0]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        MOVS     R1,R0
        CMP      R1,#+1
        BEQ.N    ??RCC_LSEConfig_0
        CMP      R1,#+4
        BEQ.N    ??RCC_LSEConfig_1
        B.N      ??RCC_LSEConfig_2
??RCC_LSEConfig_0:
        MOVS     R1,#+1
        LDR.N    R2,??DataTable30_9  ;; 0x40021020
        STRB     R1,[R2, #+0]
        B.N      ??RCC_LSEConfig_3
??RCC_LSEConfig_1:
        MOVS     R1,#+5
        LDR.N    R2,??DataTable30_9  ;; 0x40021020
        STRB     R1,[R2, #+0]
        B.N      ??RCC_LSEConfig_3
??RCC_LSEConfig_2:
??RCC_LSEConfig_3:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_LSICmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable30_10  ;; 0x42420480
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_RTCCLKConfig:
        LDR.N    R1,??DataTable30_9  ;; 0x40021020
        LDR      R1,[R1, #+0]
        ORRS     R1,R0,R1
        LDR.N    R2,??DataTable30_9  ;; 0x40021020
        STR      R1,[R2, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_RTCCLKCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable30_11  ;; 0x4242043c
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_GetClocksFreq:
        PUSH     {R4-R6}
        MOVS     R1,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R4,#+0
        LDR.N    R5,??DataTable30_1  ;; 0x40021004
        LDR      R5,[R5, #+0]
        ANDS     R5,R5,#0xC
        MOVS     R1,R5
        MOVS     R5,R1
        CMP      R5,#+0
        BEQ.N    ??RCC_GetClocksFreq_0
        CMP      R5,#+4
        BEQ.N    ??RCC_GetClocksFreq_1
        CMP      R5,#+8
        BEQ.N    ??RCC_GetClocksFreq_2
        B.N      ??RCC_GetClocksFreq_3
??RCC_GetClocksFreq_0:
        LDR.N    R5,??DataTable30_12  ;; 0x7a1200
        STR      R5,[R0, #+0]
        B.N      ??RCC_GetClocksFreq_4
??RCC_GetClocksFreq_1:
        LDR.N    R5,??DataTable30_12  ;; 0x7a1200
        STR      R5,[R0, #+0]
        B.N      ??RCC_GetClocksFreq_4
??RCC_GetClocksFreq_2:
        LDR.N    R5,??DataTable30_1  ;; 0x40021004
        LDR      R5,[R5, #+0]
        ANDS     R5,R5,#0x3C0000
        MOVS     R2,R5
        LDR.N    R5,??DataTable30_1  ;; 0x40021004
        LDR      R5,[R5, #+0]
        ANDS     R5,R5,#0x10000
        MOVS     R3,R5
        LSRS     R2,R2,#+18
        ADDS     R2,R2,#+2
        CMP      R3,#+0
        BNE.N    ??RCC_GetClocksFreq_5
        LDR.N    R5,??DataTable30_13  ;; 0x3d0900
        MUL      R5,R5,R2
        STR      R5,[R0, #+0]
        B.N      ??RCC_GetClocksFreq_6
??RCC_GetClocksFreq_5:
        LDR.N    R5,??DataTable30_1  ;; 0x40021004
        LDR      R5,[R5, #+0]
        LSLS     R5,R5,#+14
        BPL.N    ??RCC_GetClocksFreq_7
        LDR.N    R5,??DataTable30_13  ;; 0x3d0900
        MUL      R5,R5,R2
        STR      R5,[R0, #+0]
        B.N      ??RCC_GetClocksFreq_6
??RCC_GetClocksFreq_7:
        LDR.N    R5,??DataTable30_12  ;; 0x7a1200
        MUL      R5,R5,R2
        STR      R5,[R0, #+0]
??RCC_GetClocksFreq_6:
        B.N      ??RCC_GetClocksFreq_4
??RCC_GetClocksFreq_3:
        LDR.N    R5,??DataTable30_12  ;; 0x7a1200
        STR      R5,[R0, #+0]
??RCC_GetClocksFreq_4:
        LDR.N    R5,??DataTable30_1  ;; 0x40021004
        LDR      R5,[R5, #+0]
        ANDS     R5,R5,#0xF0
        MOVS     R1,R5
        LSRS     R1,R1,#+4
        LDR.N    R5,??DataTable30_14
        LDRB     R5,[R1, R5]
        MOVS     R4,R5
        LDR      R5,[R0, #+0]
        MOVS     R6,R5
        LSRS     R6,R6,R4
        STR      R6,[R0, #+4]
        LDR.N    R5,??DataTable30_1  ;; 0x40021004
        LDR      R5,[R5, #+0]
        ANDS     R5,R5,#0x700
        MOVS     R1,R5
        LSRS     R1,R1,#+8
        LDR.N    R5,??DataTable30_14
        LDRB     R5,[R1, R5]
        MOVS     R4,R5
        LDR      R5,[R0, #+4]
        MOVS     R6,R5
        LSRS     R6,R6,R4
        STR      R6,[R0, #+8]
        LDR.N    R5,??DataTable30_1  ;; 0x40021004
        LDR      R5,[R5, #+0]
        ANDS     R5,R5,#0x3800
        MOVS     R1,R5
        LSRS     R1,R1,#+11
        LDR.N    R5,??DataTable30_14
        LDRB     R5,[R1, R5]
        MOVS     R4,R5
        LDR      R5,[R0, #+4]
        MOVS     R6,R5
        LSRS     R6,R6,R4
        STR      R6,[R0, #+12]
        LDR.N    R5,??DataTable30_1  ;; 0x40021004
        LDR      R5,[R5, #+0]
        ANDS     R5,R5,#0xC000
        MOVS     R1,R5
        LSRS     R1,R1,#+14
        LDR.N    R5,??DataTable30_15
        LDRB     R5,[R1, R5]
        MOVS     R4,R5
        LDR      R5,[R0, #+12]
        UDIV     R5,R5,R4
        STR      R5,[R0, #+16]
        POP      {R4-R6}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_AHBPeriphClockCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_AHBPeriphClockCmd_0
        LDR.N    R2,??DataTable30_16  ;; 0x40021014
        LDR      R2,[R2, #+0]
        ORRS     R2,R0,R2
        LDR.N    R3,??DataTable30_16  ;; 0x40021014
        STR      R2,[R3, #+0]
        B.N      ??RCC_AHBPeriphClockCmd_1
??RCC_AHBPeriphClockCmd_0:
        LDR.N    R2,??DataTable30_16  ;; 0x40021014
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR.N    R3,??DataTable30_16  ;; 0x40021014
        STR      R2,[R3, #+0]
??RCC_AHBPeriphClockCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_APB2PeriphClockCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_APB2PeriphClockCmd_0
        LDR.N    R2,??DataTable30_17  ;; 0x40021018
        LDR      R2,[R2, #+0]
        ORRS     R2,R0,R2
        LDR.N    R3,??DataTable30_17  ;; 0x40021018
        STR      R2,[R3, #+0]
        B.N      ??RCC_APB2PeriphClockCmd_1
??RCC_APB2PeriphClockCmd_0:
        LDR.N    R2,??DataTable30_17  ;; 0x40021018
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR.N    R3,??DataTable30_17  ;; 0x40021018
        STR      R2,[R3, #+0]
??RCC_APB2PeriphClockCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_APB1PeriphClockCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_APB1PeriphClockCmd_0
        LDR.N    R2,??DataTable30_18  ;; 0x4002101c
        LDR      R2,[R2, #+0]
        ORRS     R2,R0,R2
        LDR.N    R3,??DataTable30_18  ;; 0x4002101c
        STR      R2,[R3, #+0]
        B.N      ??RCC_APB1PeriphClockCmd_1
??RCC_APB1PeriphClockCmd_0:
        LDR.N    R2,??DataTable30_18  ;; 0x4002101c
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR.N    R3,??DataTable30_18  ;; 0x4002101c
        STR      R2,[R3, #+0]
??RCC_APB1PeriphClockCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_APB2PeriphResetCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_APB2PeriphResetCmd_0
        LDR.N    R2,??DataTable30_19  ;; 0x4002100c
        LDR      R2,[R2, #+0]
        ORRS     R2,R0,R2
        LDR.N    R3,??DataTable30_19  ;; 0x4002100c
        STR      R2,[R3, #+0]
        B.N      ??RCC_APB2PeriphResetCmd_1
??RCC_APB2PeriphResetCmd_0:
        LDR.N    R2,??DataTable30_19  ;; 0x4002100c
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR.N    R3,??DataTable30_19  ;; 0x4002100c
        STR      R2,[R3, #+0]
??RCC_APB2PeriphResetCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_APB1PeriphResetCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??RCC_APB1PeriphResetCmd_0
        LDR.N    R2,??DataTable30_20  ;; 0x40021010
        LDR      R2,[R2, #+0]
        ORRS     R2,R0,R2
        LDR.N    R3,??DataTable30_20  ;; 0x40021010
        STR      R2,[R3, #+0]
        B.N      ??RCC_APB1PeriphResetCmd_1
??RCC_APB1PeriphResetCmd_0:
        LDR.N    R2,??DataTable30_20  ;; 0x40021010
        LDR      R2,[R2, #+0]
        BICS     R2,R2,R0
        LDR.N    R3,??DataTable30_20  ;; 0x40021010
        STR      R2,[R3, #+0]
??RCC_APB1PeriphResetCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_BackupResetCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable30_21  ;; 0x42420440
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_ClockSecuritySystemCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable30_22  ;; 0x4242004c
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_MCOConfig:
        LDR.N    R1,??DataTable30_23  ;; 0x40021007
        STRB     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_GetFlagStatus:
        PUSH     {R4}
        MOVS     R1,R0
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R0,#+0
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LSRS     R4,R1,#+5
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R2,R4
        CMP      R2,#+1
        BNE.N    ??RCC_GetFlagStatus_0
        LDR.N    R4,??DataTable30  ;; 0x40021000
        LDR      R4,[R4, #+0]
        MOVS     R3,R4
        B.N      ??RCC_GetFlagStatus_1
??RCC_GetFlagStatus_0:
        CMP      R2,#+2
        BNE.N    ??RCC_GetFlagStatus_2
        LDR.N    R4,??DataTable30_9  ;; 0x40021020
        LDR      R4,[R4, #+0]
        MOVS     R3,R4
        B.N      ??RCC_GetFlagStatus_1
??RCC_GetFlagStatus_2:
        LDR.N    R4,??DataTable30_24  ;; 0x40021024
        LDR      R4,[R4, #+0]
        MOVS     R3,R4
??RCC_GetFlagStatus_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ANDS     R4,R1,#0x1F
        MOVS     R2,R4
        MOVS     R4,R3
        LSRS     R4,R4,R2
        LSLS     R4,R4,#+31
        BPL.N    ??RCC_GetFlagStatus_3
        MOVS     R4,#+1
        MOVS     R0,R4
        B.N      ??RCC_GetFlagStatus_4
??RCC_GetFlagStatus_3:
        MOVS     R4,#+0
        MOVS     R0,R4
??RCC_GetFlagStatus_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_ClearFlag:
        LDR.N    R0,??DataTable30_24  ;; 0x40021024
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1000000
        LDR.N    R1,??DataTable30_24  ;; 0x40021024
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_GetITStatus:
        MOVS     R1,R0
        MOVS     R0,#+0
        LDR.N    R2,??DataTable30_4  ;; 0x40021008
        LDR      R2,[R2, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        TST      R2,R1
        BEQ.N    ??RCC_GetITStatus_0
        MOVS     R2,#+1
        MOVS     R0,R2
        B.N      ??RCC_GetITStatus_1
??RCC_GetITStatus_0:
        MOVS     R2,#+0
        MOVS     R0,R2
??RCC_GetITStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
RCC_ClearITPendingBit:
        LDR.N    R1,??DataTable30_25  ;; 0x4002100a
        STRB     R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30:
        DC32     0x40021000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_1:
        DC32     0x40021004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_2:
        DC32     0xf8ff0000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_3:
        DC32     0xfef6ffff

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_4:
        DC32     0x40021008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_5:
        DC32     0x42420000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_6:
        DC32     0x42420060

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_7:
        DC32     0x40021009

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_8:
        DC32     0x424200d8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_9:
        DC32     0x40021020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_10:
        DC32     0x42420480

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_11:
        DC32     0x4242043c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_12:
        DC32     0x7a1200

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_13:
        DC32     0x3d0900

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_14:
        DC32     APBAHBPrescTable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_15:
        DC32     ADCPrescTable

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_16:
        DC32     0x40021014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_17:
        DC32     0x40021018

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_18:
        DC32     0x4002101c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_19:
        DC32     0x4002100c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_20:
        DC32     0x40021010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_21:
        DC32     0x42420440

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_22:
        DC32     0x4242004c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_23:
        DC32     0x40021007

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_24:
        DC32     0x40021024

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_25:
        DC32     0x4002100a

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
//    20 bytes in section .data
// 1 172 bytes in section .text
// 
// 1 172 bytes of CODE memory
//    20 bytes of DATA memory
//
//Errors: none
//Warnings: none
