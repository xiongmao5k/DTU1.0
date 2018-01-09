///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       09/Jan/2018  13:27:46
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_dac.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_dac.c
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\stm32f10x_dac.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB1PeriphResetCmd

        PUBLIC DAC_Cmd
        PUBLIC DAC_DMACmd
        PUBLIC DAC_DeInit
        PUBLIC DAC_DualSoftwareTriggerCmd
        PUBLIC DAC_GetDataOutputValue
        PUBLIC DAC_Init
        PUBLIC DAC_SetChannel1Data
        PUBLIC DAC_SetChannel2Data
        PUBLIC DAC_SetDualChannelData
        PUBLIC DAC_SoftwareTriggerCmd
        PUBLIC DAC_StructInit
        PUBLIC DAC_WaveGenerationCmd


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_DeInit:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+536870912
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+536870912
        BL       RCC_APB1PeriphResetCmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_Init:
        PUSH     {R4,R5}
        MOVS     R3,#+0
        MOVS     R2,#+0
        LDR.N    R4,??DataTable9  ;; 0x40007400
        LDR      R4,[R4, #+0]
        MOVS     R3,R4
        MOVW     R4,#+4094
        LSLS     R4,R4,R0
        BICS     R3,R3,R4
        LDR      R4,[R1, #+0]
        LDR      R5,[R1, #+4]
        ORRS     R4,R5,R4
        LDR      R5,[R1, #+8]
        ORRS     R4,R5,R4
        LDR      R5,[R1, #+12]
        ORRS     R4,R5,R4
        MOVS     R2,R4
        LSLS     R4,R2,R0
        ORRS     R3,R4,R3
        LDR.N    R4,??DataTable9  ;; 0x40007400
        STR      R3,[R4, #+0]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_StructInit:
        MOVS     R1,#+0
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STR      R1,[R0, #+4]
        MOVS     R1,#+0
        STR      R1,[R0, #+8]
        MOVS     R1,#+0
        STR      R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_Cmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??DAC_Cmd_0
        LDR.N    R2,??DataTable9  ;; 0x40007400
        LDR      R2,[R2, #+0]
        MOVS     R3,#+1
        LSLS     R3,R3,R0
        ORRS     R2,R3,R2
        LDR.N    R3,??DataTable9  ;; 0x40007400
        STR      R2,[R3, #+0]
        B.N      ??DAC_Cmd_1
??DAC_Cmd_0:
        LDR.N    R2,??DataTable9  ;; 0x40007400
        LDR      R2,[R2, #+0]
        MOVS     R3,#+1
        LSLS     R3,R3,R0
        BICS     R2,R2,R3
        LDR.N    R3,??DataTable9  ;; 0x40007400
        STR      R2,[R3, #+0]
??DAC_Cmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_DMACmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??DAC_DMACmd_0
        LDR.N    R2,??DataTable9  ;; 0x40007400
        LDR      R2,[R2, #+0]
        MOV      R3,#+4096
        LSLS     R3,R3,R0
        ORRS     R2,R3,R2
        LDR.N    R3,??DataTable9  ;; 0x40007400
        STR      R2,[R3, #+0]
        B.N      ??DAC_DMACmd_1
??DAC_DMACmd_0:
        LDR.N    R2,??DataTable9  ;; 0x40007400
        LDR      R2,[R2, #+0]
        MOV      R3,#+4096
        LSLS     R3,R3,R0
        BICS     R2,R2,R3
        LDR.N    R3,??DataTable9  ;; 0x40007400
        STR      R2,[R3, #+0]
??DAC_DMACmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_SoftwareTriggerCmd:
        PUSH     {R4}
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??DAC_SoftwareTriggerCmd_0
        LDR.N    R2,??DataTable9_1  ;; 0x40007404
        LDR      R2,[R2, #+0]
        MOVS     R3,#+1
        LSRS     R4,R0,#+4
        LSLS     R3,R3,R4
        ORRS     R2,R3,R2
        LDR.N    R3,??DataTable9_1  ;; 0x40007404
        STR      R2,[R3, #+0]
        B.N      ??DAC_SoftwareTriggerCmd_1
??DAC_SoftwareTriggerCmd_0:
        LDR.N    R2,??DataTable9_1  ;; 0x40007404
        LDR      R2,[R2, #+0]
        MOVS     R3,#+1
        LSRS     R4,R0,#+4
        LSLS     R3,R3,R4
        BICS     R2,R2,R3
        LDR.N    R3,??DataTable9_1  ;; 0x40007404
        STR      R2,[R3, #+0]
??DAC_SoftwareTriggerCmd_1:
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_DualSoftwareTriggerCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??DAC_DualSoftwareTriggerCmd_0
        LDR.N    R1,??DataTable9_1  ;; 0x40007404
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x3
        LDR.N    R2,??DataTable9_1  ;; 0x40007404
        STR      R1,[R2, #+0]
        B.N      ??DAC_DualSoftwareTriggerCmd_1
??DAC_DualSoftwareTriggerCmd_0:
        LDR.N    R1,??DataTable9_1  ;; 0x40007404
        LDR      R1,[R1, #+0]
        LSRS     R1,R1,#+2
        LSLS     R1,R1,#+2
        LDR.N    R2,??DataTable9_1  ;; 0x40007404
        STR      R1,[R2, #+0]
??DAC_DualSoftwareTriggerCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_WaveGenerationCmd:
        PUSH     {R4}
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??DAC_WaveGenerationCmd_0
        LDR.N    R3,??DataTable9  ;; 0x40007400
        LDR      R3,[R3, #+0]
        LSLS     R4,R1,R0
        ORRS     R3,R4,R3
        LDR.N    R4,??DataTable9  ;; 0x40007400
        STR      R3,[R4, #+0]
        B.N      ??DAC_WaveGenerationCmd_1
??DAC_WaveGenerationCmd_0:
        LDR.N    R3,??DataTable9  ;; 0x40007400
        LDR      R3,[R3, #+0]
        LSLS     R4,R1,R0
        BICS     R3,R3,R4
        LDR.N    R4,??DataTable9  ;; 0x40007400
        STR      R3,[R4, #+0]
??DAC_WaveGenerationCmd_1:
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_SetChannel1Data:
        SUB      SP,SP,#+4
        MOVS     R2,#+0
        STR      R2,[SP, #+0]
        LDR.N    R2,??DataTable9  ;; 0x40007400
        STR      R2,[SP, #+0]
        LDR      R2,[SP, #+0]
        ADDS     R3,R0,#+8
        ADDS     R2,R3,R2
        STR      R2,[SP, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR      R2,[SP, #+0]
        STR      R1,[R2, #+0]
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_SetChannel2Data:
        SUB      SP,SP,#+4
        MOVS     R2,#+0
        STR      R2,[SP, #+0]
        LDR.N    R2,??DataTable9  ;; 0x40007400
        STR      R2,[SP, #+0]
        LDR      R2,[SP, #+0]
        ADDS     R3,R0,#+20
        ADDS     R2,R3,R2
        STR      R2,[SP, #+0]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR      R2,[SP, #+0]
        STR      R1,[R2, #+0]
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_SetDualChannelData:
        PUSH     {R4,R5}
        MOVS     R3,#+0
        MOVS     R4,#+0
        CMP      R0,#+8
        BNE.N    ??DAC_SetDualChannelData_0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ORRS     R5,R2,R1, LSL #+8
        MOVS     R3,R5
        B.N      ??DAC_SetDualChannelData_1
??DAC_SetDualChannelData_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ORRS     R5,R2,R1, LSL #+16
        MOVS     R3,R5
??DAC_SetDualChannelData_1:
        LDR.N    R5,??DataTable9  ;; 0x40007400
        MOVS     R4,R5
        ADDS     R5,R0,#+32
        ADDS     R4,R5,R4
        STR      R3,[R4, #+0]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
DAC_GetDataOutputValue:
        SUB      SP,SP,#+4
        MOVS     R1,R0
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        LDR.N    R0,??DataTable9  ;; 0x40007400
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        LSRS     R2,R1,#+2
        ADDS     R2,R2,#+44
        ADDS     R0,R2,R0
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9:
        DC32     0x40007400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable9_1:
        DC32     0x40007404

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
// 442 bytes in section .text
// 
// 442 bytes of CODE memory
//
//Errors: none
//Warnings: none
