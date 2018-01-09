///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       09/Jan/2018  13:27:47
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_gpio.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_gpio.c
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\stm32f10x_gpio.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB2PeriphResetCmd

        PUBLIC GPIO_AFIODeInit
        PUBLIC GPIO_DeInit
        PUBLIC GPIO_ETH_MediaInterfaceConfig
        PUBLIC GPIO_EXTILineConfig
        PUBLIC GPIO_EventOutputCmd
        PUBLIC GPIO_EventOutputConfig
        PUBLIC GPIO_Init
        PUBLIC GPIO_PinLockConfig
        PUBLIC GPIO_PinRemapConfig
        PUBLIC GPIO_ReadInputData
        PUBLIC GPIO_ReadInputDataBit
        PUBLIC GPIO_ReadOutputData
        PUBLIC GPIO_ReadOutputDataBit
        PUBLIC GPIO_ResetBits
        PUBLIC GPIO_SetBits
        PUBLIC GPIO_StructInit
        PUBLIC GPIO_Write
        PUBLIC GPIO_WriteBit


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_DeInit:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR.W    R0,??DataTable5  ;; 0x40010800
        CMP      R4,R0
        BNE.N    ??GPIO_DeInit_0
        MOVS     R1,#+1
        MOVS     R0,#+4
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+4
        BL       RCC_APB2PeriphResetCmd
        B.N      ??GPIO_DeInit_1
??GPIO_DeInit_0:
        LDR.W    R0,??DataTable5_1  ;; 0x40010c00
        CMP      R4,R0
        BNE.N    ??GPIO_DeInit_2
        MOVS     R1,#+1
        MOVS     R0,#+8
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+8
        BL       RCC_APB2PeriphResetCmd
        B.N      ??GPIO_DeInit_1
??GPIO_DeInit_2:
        LDR.N    R0,??DataTable5_2  ;; 0x40011000
        CMP      R4,R0
        BNE.N    ??GPIO_DeInit_3
        MOVS     R1,#+1
        MOVS     R0,#+16
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+16
        BL       RCC_APB2PeriphResetCmd
        B.N      ??GPIO_DeInit_1
??GPIO_DeInit_3:
        LDR.N    R0,??DataTable5_3  ;; 0x40011400
        CMP      R4,R0
        BNE.N    ??GPIO_DeInit_4
        MOVS     R1,#+1
        MOVS     R0,#+32
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+32
        BL       RCC_APB2PeriphResetCmd
        B.N      ??GPIO_DeInit_1
??GPIO_DeInit_4:
        LDR.N    R0,??DataTable5_4  ;; 0x40011800
        CMP      R4,R0
        BNE.N    ??GPIO_DeInit_5
        MOVS     R1,#+1
        MOVS     R0,#+64
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+64
        BL       RCC_APB2PeriphResetCmd
        B.N      ??GPIO_DeInit_1
??GPIO_DeInit_5:
        LDR.N    R0,??DataTable5_5  ;; 0x40011c00
        CMP      R4,R0
        BNE.N    ??GPIO_DeInit_6
        MOVS     R1,#+1
        MOVS     R0,#+128
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+128
        BL       RCC_APB2PeriphResetCmd
        B.N      ??GPIO_DeInit_1
??GPIO_DeInit_6:
        LDR.N    R0,??DataTable5_6  ;; 0x40012000
        CMP      R4,R0
        BNE.N    ??GPIO_DeInit_1
        MOVS     R1,#+1
        MOV      R0,#+256
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOV      R0,#+256
        BL       RCC_APB2PeriphResetCmd
??GPIO_DeInit_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_AFIODeInit:
        PUSH     {R7,LR}
        MOVS     R1,#+1
        MOVS     R0,#+1
        BL       RCC_APB2PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+1
        BL       RCC_APB2PeriphResetCmd
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_Init:
        PUSH     {R4-R7,LR}
        MOVS     R7,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R4,#+0
        MOVS     R5,#+0
        MOVS     R6,#+0
        LDRB     R12,[R1, #+3]
        ANDS     R12,R12,#0xF
        MOV      R7,R12
        LDRB     R12,[R1, #+3]
        LSLS     R12,R12,#+27
        BPL.N    ??GPIO_Init_0
        LDRB     R12,[R1, #+2]
        ORRS     R7,R12,R7
??GPIO_Init_0:
        LDRB     R12,[R1, #+0]
        LSLS     R12,R12,#+24
        BEQ.N    ??GPIO_Init_1
        LDR      R12,[R0, #+0]
        MOV      R5,R12
        MOVS     R12,#+0
        MOV      R3,R12
??GPIO_Init_2:
        CMP      R3,#+8
        BCS.N    ??GPIO_Init_3
        MOVS     R12,#+1
        LSLS     R12,R12,R3
        MOV      R4,R12
        LDRH     R12,[R1, #+0]
        ANDS     R12,R4,R12
        MOV      R2,R12
        CMP      R2,R4
        BNE.N    ??GPIO_Init_4
        LSLS     R12,R3,#+2
        MOV      R4,R12
        MOVS     R12,#+15
        LSLS     R12,R12,R4
        MOV      R6,R12
        BICS     R5,R5,R6
        LSLS     R12,R7,R4
        ORRS     R5,R12,R5
        LDRB     R12,[R1, #+3]
        CMP      R12,#+40
        BNE.N    ??GPIO_Init_5
        MOVS     R12,#+1
        LSLS     R12,R12,R3
        STR      R12,[R0, #+20]
        B.N      ??GPIO_Init_4
??GPIO_Init_5:
        LDRB     R12,[R1, #+3]
        CMP      R12,#+72
        BNE.N    ??GPIO_Init_4
        MOVS     R12,#+1
        LSLS     R12,R12,R3
        STR      R12,[R0, #+16]
??GPIO_Init_4:
        ADDS     R3,R3,#+1
        B.N      ??GPIO_Init_2
??GPIO_Init_3:
        STR      R5,[R0, #+0]
??GPIO_Init_1:
        LDRH     R12,[R1, #+0]
        CMP      R12,#+255
        BLE.N    ??GPIO_Init_6
        LDR      R12,[R0, #+4]
        MOV      R5,R12
        MOVS     R12,#+0
        MOV      R3,R12
??GPIO_Init_7:
        CMP      R3,#+8
        BCS.N    ??GPIO_Init_8
        MOVS     R12,#+1
        ADDS     LR,R3,#+8
        LSLS     R12,R12,LR
        MOV      R4,R12
        LDRH     R12,[R1, #+0]
        ANDS     R12,R4,R12
        MOV      R2,R12
        CMP      R2,R4
        BNE.N    ??GPIO_Init_9
        LSLS     R12,R3,#+2
        MOV      R4,R12
        MOVS     R12,#+15
        LSLS     R12,R12,R4
        MOV      R6,R12
        BICS     R5,R5,R6
        LSLS     R12,R7,R4
        ORRS     R5,R12,R5
        LDRB     R12,[R1, #+3]
        CMP      R12,#+40
        BNE.N    ??GPIO_Init_10
        MOVS     R12,#+1
        ADDS     LR,R3,#+8
        LSLS     R12,R12,LR
        STR      R12,[R0, #+20]
??GPIO_Init_10:
        LDRB     R12,[R1, #+3]
        CMP      R12,#+72
        BNE.N    ??GPIO_Init_9
        MOVS     R12,#+1
        ADDS     LR,R3,#+8
        LSLS     R12,R12,LR
        STR      R12,[R0, #+16]
??GPIO_Init_9:
        ADDS     R3,R3,#+1
        B.N      ??GPIO_Init_7
??GPIO_Init_8:
        STR      R5,[R0, #+4]
??GPIO_Init_6:
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_StructInit:
        MOVW     R1,#+65535
        STRH     R1,[R0, #+0]
        MOVS     R1,#+2
        STRB     R1,[R0, #+2]
        MOVS     R1,#+4
        STRB     R1,[R0, #+3]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ReadInputDataBit:
        MOVS     R2,R0
        MOVS     R0,#+0
        LDR      R3,[R2, #+8]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        TST      R3,R1
        BEQ.N    ??GPIO_ReadInputDataBit_0
        MOVS     R3,#+1
        MOVS     R0,R3
        B.N      ??GPIO_ReadInputDataBit_1
??GPIO_ReadInputDataBit_0:
        MOVS     R3,#+0
        MOVS     R0,R3
??GPIO_ReadInputDataBit_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ReadInputData:
        LDR      R0,[R0, #+8]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ReadOutputDataBit:
        MOVS     R2,R0
        MOVS     R0,#+0
        LDR      R3,[R2, #+12]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        TST      R3,R1
        BEQ.N    ??GPIO_ReadOutputDataBit_0
        MOVS     R3,#+1
        MOVS     R0,R3
        B.N      ??GPIO_ReadOutputDataBit_1
??GPIO_ReadOutputDataBit_0:
        MOVS     R3,#+0
        MOVS     R0,R3
??GPIO_ReadOutputDataBit_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ReadOutputData:
        LDR      R0,[R0, #+12]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_SetBits:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ResetBits:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_WriteBit:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??GPIO_WriteBit_0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+16]
        B.N      ??GPIO_WriteBit_1
??GPIO_WriteBit_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+20]
??GPIO_WriteBit_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_Write:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_PinLockConfig:
        MOVS     R2,#+65536
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        ORRS     R2,R1,R2
        STR      R2,[R0, #+24]
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        STR      R1,[R0, #+24]
        STR      R2,[R0, #+24]
        LDR      R3,[R0, #+24]
        MOVS     R2,R3
        LDR      R3,[R0, #+24]
        MOVS     R2,R3
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_EventOutputConfig:
        MOVS     R2,#+0
        LDR.N    R3,??DataTable5_7  ;; 0x40010000
        LDR      R3,[R3, #+0]
        MOVS     R2,R3
        MOVW     R3,#+65408
        ANDS     R2,R3,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ORRS     R2,R2,R0, LSL #+4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ORRS     R2,R1,R2
        LDR.N    R3,??DataTable5_7  ;; 0x40010000
        STR      R2,[R3, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_EventOutputCmd:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        LDR.N    R1,??DataTable5_8  ;; 0x4220001c
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_PinRemapConfig:
        PUSH     {R4-R7}
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R5,#+0
        MOVS     R4,#+0
        CMP      R0,#+0
        BPL.N    ??GPIO_PinRemapConfig_0
        LDR.N    R6,??DataTable5_9  ;; 0x4001001c
        LDR      R6,[R6, #+0]
        MOVS     R5,R6
        B.N      ??GPIO_PinRemapConfig_1
??GPIO_PinRemapConfig_0:
        LDR.N    R6,??DataTable5_10  ;; 0x40010004
        LDR      R6,[R6, #+0]
        MOVS     R5,R6
??GPIO_PinRemapConfig_1:
        UBFX     R6,R0,#+16,#+4
        MOVS     R4,R6
        UXTH     R6,R0            ;; ZeroExt  R6,R0,#+16,#+16
        MOVS     R2,R6
        ANDS     R6,R0,#0x300000
        CMP      R6,#+3145728
        BNE.N    ??GPIO_PinRemapConfig_2
        BICS     R5,R5,#0xF000000
        LDR.N    R6,??DataTable5_10  ;; 0x40010004
        LDR      R6,[R6, #+0]
        BICS     R6,R6,#0xF000000
        LDR.N    R7,??DataTable5_10  ;; 0x40010004
        STR      R6,[R7, #+0]
        B.N      ??GPIO_PinRemapConfig_3
??GPIO_PinRemapConfig_2:
        LSLS     R6,R0,#+11
        BPL.N    ??GPIO_PinRemapConfig_4
        MOVS     R6,#+3
        LSLS     R6,R6,R4
        MOVS     R3,R6
        BICS     R5,R5,R3
        ORRS     R5,R5,#0xF000000
        B.N      ??GPIO_PinRemapConfig_3
??GPIO_PinRemapConfig_4:
        LSRS     R6,R0,#+21
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LSLS     R6,R6,#+4
        LSLS     R6,R2,R6
        BICS     R5,R5,R6
        ORRS     R5,R5,#0xF000000
??GPIO_PinRemapConfig_3:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??GPIO_PinRemapConfig_5
        LSRS     R6,R0,#+21
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        LSLS     R6,R6,#+4
        LSLS     R6,R2,R6
        ORRS     R5,R6,R5
??GPIO_PinRemapConfig_5:
        CMP      R0,#+0
        BPL.N    ??GPIO_PinRemapConfig_6
        LDR.N    R6,??DataTable5_9  ;; 0x4001001c
        STR      R5,[R6, #+0]
        B.N      ??GPIO_PinRemapConfig_7
??GPIO_PinRemapConfig_6:
        LDR.N    R6,??DataTable5_10  ;; 0x40010004
        STR      R5,[R6, #+0]
??GPIO_PinRemapConfig_7:
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_EXTILineConfig:
        PUSH     {R4,R5}
        MOVS     R2,#+0
        MOVS     R3,#+15
        ANDS     R4,R1,#0x3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R4,R4,#+2
        LSLS     R3,R3,R4
        MOVS     R2,R3
        LDR.N    R3,??DataTable5_11  ;; 0x40010008
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ASRS     R4,R1,#+2
        LDR      R3,[R3, R4, LSL #+2]
        BICS     R3,R3,R2
        LDR.N    R4,??DataTable5_11  ;; 0x40010008
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ASRS     R5,R1,#+2
        STR      R3,[R4, R5, LSL #+2]
        LDR.N    R3,??DataTable5_11  ;; 0x40010008
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ASRS     R4,R1,#+2
        LDR      R3,[R3, R4, LSL #+2]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ANDS     R4,R1,#0x3
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        LSLS     R4,R4,#+2
        LSLS     R4,R0,R4
        ORRS     R3,R4,R3
        LDR.N    R4,??DataTable5_11  ;; 0x40010008
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ASRS     R5,R1,#+2
        STR      R3,[R4, R5, LSL #+2]
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
GPIO_ETH_MediaInterfaceConfig:
        LDR.N    R1,??DataTable5_12  ;; 0x422000dc
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5:
        DC32     0x40010800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_1:
        DC32     0x40010c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_2:
        DC32     0x40011000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_3:
        DC32     0x40011400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_4:
        DC32     0x40011800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_5:
        DC32     0x40011c00

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_6:
        DC32     0x40012000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_7:
        DC32     0x40010000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_8:
        DC32     0x4220001c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_9:
        DC32     0x4001001c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_10:
        DC32     0x40010004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_11:
        DC32     0x40010008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable5_12:
        DC32     0x422000dc

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
// 964 bytes in section .text
// 
// 964 bytes of CODE memory
//
//Errors: none
//Warnings: none
