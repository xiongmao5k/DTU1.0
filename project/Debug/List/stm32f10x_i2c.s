///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       18/Dec/2017  10:50:26
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_i2c.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_i2c.c
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\stm32f10x_i2c.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN RCC_APB1PeriphResetCmd
        EXTERN RCC_GetClocksFreq

        PUBLIC I2C_ARPCmd
        PUBLIC I2C_AcknowledgeConfig
        PUBLIC I2C_CalculatePEC
        PUBLIC I2C_CheckEvent
        PUBLIC I2C_ClearFlag
        PUBLIC I2C_ClearITPendingBit
        PUBLIC I2C_Cmd
        PUBLIC I2C_DMACmd
        PUBLIC I2C_DMALastTransferCmd
        PUBLIC I2C_DeInit
        PUBLIC I2C_DualAddressCmd
        PUBLIC I2C_FastModeDutyCycleConfig
        PUBLIC I2C_GeneralCallCmd
        PUBLIC I2C_GenerateSTART
        PUBLIC I2C_GenerateSTOP
        PUBLIC I2C_GetFlagStatus
        PUBLIC I2C_GetITStatus
        PUBLIC I2C_GetLastEvent
        PUBLIC I2C_GetPEC
        PUBLIC I2C_ITConfig
        PUBLIC I2C_Init
        PUBLIC I2C_NACKPositionConfig
        PUBLIC I2C_OwnAddress2Config
        PUBLIC I2C_PECPositionConfig
        PUBLIC I2C_ReadRegister
        PUBLIC I2C_ReceiveData
        PUBLIC I2C_SMBusAlertConfig
        PUBLIC I2C_Send7bitAddress
        PUBLIC I2C_SendData
        PUBLIC I2C_SoftwareResetCmd
        PUBLIC I2C_StretchClockCmd
        PUBLIC I2C_StructInit
        PUBLIC I2C_TransmitPEC


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_DeInit:
        PUSH     {R7,LR}
        LDR.N    R1,??DataTable1  ;; 0x40005400
        CMP      R0,R1
        BNE.N    ??I2C_DeInit_0
        MOVS     R1,#+1
        MOVS     R0,#+2097152
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+2097152
        BL       RCC_APB1PeriphResetCmd
        B.N      ??I2C_DeInit_1
??I2C_DeInit_0:
        MOVS     R1,#+1
        MOVS     R0,#+4194304
        BL       RCC_APB1PeriphResetCmd
        MOVS     R1,#+0
        MOVS     R0,#+4194304
        BL       RCC_APB1PeriphResetCmd
??I2C_DeInit_1:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_Init:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,#+0
        MOVS     R0,#+0
        MOVS     R1,#+4
        LDR.N    R1,??DataTable1_1  ;; 0x7a1200
        LDRH     R6,[R4, #+4]
        MOVW     R0,#+65472
        ANDS     R6,R0,R6
        ADD      R0,SP,#+0
        BL       RCC_GetClocksFreq
        LDR      R1,[SP, #+8]
        LDR.N    R0,??DataTable1_2  ;; 0xf4240
        UDIV     R0,R1,R0
        ORRS     R6,R0,R6
        STRH     R6,[R4, #+4]
        LDRH     R2,[R4, #+0]
        MOVW     R3,#+65534
        ANDS     R2,R3,R2
        STRH     R2,[R4, #+0]
        MOVS     R6,#+0
        LDR      R2,[R5, #+0]
        LDR.N    R3,??DataTable1_3  ;; 0x186a1
        CMP      R2,R3
        BCS.N    ??I2C_Init_0
        LDR      R2,[R5, #+0]
        LSLS     R2,R2,#+1
        UDIV     R1,R1,R2
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+4
        BGE.N    ??I2C_Init_1
        MOVS     R1,#+4
??I2C_Init_1:
        ORRS     R6,R1,R6
        ADDS     R0,R0,#+1
        STRH     R0,[R4, #+32]
        B.N      ??I2C_Init_2
??I2C_Init_0:
        LDRH     R2,[R5, #+6]
        MOVW     R3,#+49151
        CMP      R2,R3
        BNE.N    ??I2C_Init_3
        LDR      R2,[R5, #+0]
        MOVS     R3,#+3
        MULS     R2,R3,R2
        UDIV     R1,R1,R2
        B.N      ??I2C_Init_4
??I2C_Init_3:
        LDR      R2,[R5, #+0]
        MOVS     R3,#+25
        MULS     R2,R3,R2
        UDIV     R1,R1,R2
        ORRS     R1,R1,#0x4000
??I2C_Init_4:
        LSLS     R2,R1,#+20
        BNE.N    ??I2C_Init_5
        ORRS     R1,R1,#0x1
??I2C_Init_5:
        ORRS     R1,R1,#0x8000
        ORRS     R6,R1,R6
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        MOV      R1,#+300
        MULS     R0,R1,R0
        MOV      R1,#+1000
        SDIV     R0,R0,R1
        ADDS     R0,R0,#+1
        STRH     R0,[R4, #+32]
??I2C_Init_2:
        STRH     R6,[R4, #+28]
        LDRH     R0,[R4, #+0]
        ORRS     R0,R0,#0x1
        STRH     R0,[R4, #+0]
        LDRH     R6,[R4, #+0]
        MOVW     R0,#+64501
        ANDS     R6,R0,R6
        LDRH     R0,[R5, #+4]
        LDRH     R1,[R5, #+10]
        ORRS     R0,R1,R0
        ORRS     R6,R0,R6
        STRH     R6,[R4, #+0]
        LDRH     R0,[R5, #+12]
        LDRH     R1,[R5, #+8]
        ORRS     R0,R1,R0
        STRH     R0,[R4, #+8]
        ADD      SP,SP,#+24
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1:
        DC32     0x40005400

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_1:
        DC32     0x7a1200

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_2:
        DC32     0xf4240

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable1_3:
        DC32     0x186a1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_StructInit:
        MOVW     R1,#+5000
        STR      R1,[R0, #+0]
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
        MOVW     R1,#+49151
        STRH     R1,[R0, #+6]
        MOVS     R1,#+0
        STRH     R1,[R0, #+8]
        MOVS     R1,#+0
        STRH     R1,[R0, #+10]
        MOV      R1,#+16384
        STRH     R1,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_Cmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_Cmd_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x1
        STRH     R1,[R0, #+0]
        B.N      ??I2C_Cmd_1
??I2C_Cmd_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+65534
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??I2C_Cmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_DMACmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_DMACmd_0
        LDRH     R1,[R0, #+4]
        ORRS     R1,R1,#0x800
        STRH     R1,[R0, #+4]
        B.N      ??I2C_DMACmd_1
??I2C_DMACmd_0:
        LDRH     R1,[R0, #+4]
        MOVW     R2,#+63487
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+4]
??I2C_DMACmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_DMALastTransferCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_DMALastTransferCmd_0
        LDRH     R1,[R0, #+4]
        ORRS     R1,R1,#0x1000
        STRH     R1,[R0, #+4]
        B.N      ??I2C_DMALastTransferCmd_1
??I2C_DMALastTransferCmd_0:
        LDRH     R1,[R0, #+4]
        MOVW     R2,#+61439
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+4]
??I2C_DMALastTransferCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GenerateSTART:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_GenerateSTART_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x100
        STRH     R1,[R0, #+0]
        B.N      ??I2C_GenerateSTART_1
??I2C_GenerateSTART_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+65279
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??I2C_GenerateSTART_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GenerateSTOP:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_GenerateSTOP_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x200
        STRH     R1,[R0, #+0]
        B.N      ??I2C_GenerateSTOP_1
??I2C_GenerateSTOP_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+65023
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??I2C_GenerateSTOP_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_AcknowledgeConfig:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_AcknowledgeConfig_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x400
        STRH     R1,[R0, #+0]
        B.N      ??I2C_AcknowledgeConfig_1
??I2C_AcknowledgeConfig_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+64511
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??I2C_AcknowledgeConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_OwnAddress2Config:
        MOVS     R2,#+0
        LDRH     R2,[R0, #+12]
        MOVW     R3,#+65281
        ANDS     R2,R3,R2
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ANDS     R1,R1,#0xFE
        ORRS     R2,R1,R2
        STRH     R2,[R0, #+12]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_DualAddressCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_DualAddressCmd_0
        LDRH     R1,[R0, #+12]
        ORRS     R1,R1,#0x1
        STRH     R1,[R0, #+12]
        B.N      ??I2C_DualAddressCmd_1
??I2C_DualAddressCmd_0:
        LDRH     R1,[R0, #+12]
        MOVW     R2,#+65534
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+12]
??I2C_DualAddressCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GeneralCallCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_GeneralCallCmd_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x40
        STRH     R1,[R0, #+0]
        B.N      ??I2C_GeneralCallCmd_1
??I2C_GeneralCallCmd_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+65471
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??I2C_GeneralCallCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ITConfig:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??I2C_ITConfig_0
        LDRH     R2,[R0, #+4]
        ORRS     R1,R1,R2
        STRH     R1,[R0, #+4]
        B.N      ??I2C_ITConfig_1
??I2C_ITConfig_0:
        LDRH     R2,[R0, #+4]
        BICS     R1,R2,R1
        STRH     R1,[R0, #+4]
??I2C_ITConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_SendData:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STRH     R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ReceiveData:
        LDRH     R0,[R0, #+16]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_Send7bitAddress:
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R2,#+0
        BEQ.N    ??I2C_Send7bitAddress_0
        ORRS     R1,R1,#0x1
        B.N      ??I2C_Send7bitAddress_1
??I2C_Send7bitAddress_0:
        ANDS     R1,R1,#0xFE
??I2C_Send7bitAddress_1:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        STRH     R1,[R0, #+16]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ReadRegister:
        SUB      SP,SP,#+4
        MOVS     R2,#+0
        STR      R2,[SP, #+0]
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        ADDS     R0,R1,R0
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+0]
        LDRH     R0,[R0, #+0]
        ADD      SP,SP,#+4
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_SoftwareResetCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_SoftwareResetCmd_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x8000
        STRH     R1,[R0, #+0]
        B.N      ??I2C_SoftwareResetCmd_1
??I2C_SoftwareResetCmd_0:
        LDRH     R1,[R0, #+0]
        LSLS     R1,R1,#+17       ;; ZeroExtS R1,R1,#+17,#+17
        LSRS     R1,R1,#+17
        STRH     R1,[R0, #+0]
??I2C_SoftwareResetCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_NACKPositionConfig:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+2048
        BNE.N    ??I2C_NACKPositionConfig_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x800
        STRH     R1,[R0, #+0]
        B.N      ??I2C_NACKPositionConfig_1
??I2C_NACKPositionConfig_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+63487
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??I2C_NACKPositionConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_SMBusAlertConfig:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+8192
        BNE.N    ??I2C_SMBusAlertConfig_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x2000
        STRH     R1,[R0, #+0]
        B.N      ??I2C_SMBusAlertConfig_1
??I2C_SMBusAlertConfig_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+57343
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??I2C_SMBusAlertConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_TransmitPEC:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_TransmitPEC_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x1000
        STRH     R1,[R0, #+0]
        B.N      ??I2C_TransmitPEC_1
??I2C_TransmitPEC_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+61439
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??I2C_TransmitPEC_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_PECPositionConfig:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+2048
        BNE.N    ??I2C_PECPositionConfig_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x800
        STRH     R1,[R0, #+0]
        B.N      ??I2C_PECPositionConfig_1
??I2C_PECPositionConfig_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+63487
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??I2C_PECPositionConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_CalculatePEC:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_CalculatePEC_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x20
        STRH     R1,[R0, #+0]
        B.N      ??I2C_CalculatePEC_1
??I2C_CalculatePEC_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+65503
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??I2C_CalculatePEC_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GetPEC:
        LDRH     R0,[R0, #+24]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R0,R0,#+8
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ARPCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??I2C_ARPCmd_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x10
        STRH     R1,[R0, #+0]
        B.N      ??I2C_ARPCmd_1
??I2C_ARPCmd_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+65519
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??I2C_ARPCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_StretchClockCmd:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BNE.N    ??I2C_StretchClockCmd_0
        LDRH     R1,[R0, #+0]
        ORRS     R1,R1,#0x80
        STRH     R1,[R0, #+0]
        B.N      ??I2C_StretchClockCmd_1
??I2C_StretchClockCmd_0:
        LDRH     R1,[R0, #+0]
        MOVW     R2,#+65407
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+0]
??I2C_StretchClockCmd_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_FastModeDutyCycleConfig:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+16384
        BEQ.N    ??I2C_FastModeDutyCycleConfig_0
        LDRH     R1,[R0, #+28]
        MOVW     R2,#+49151
        ANDS     R1,R2,R1
        STRH     R1,[R0, #+28]
        B.N      ??I2C_FastModeDutyCycleConfig_1
??I2C_FastModeDutyCycleConfig_0:
        LDRH     R1,[R0, #+28]
        ORRS     R1,R1,#0x4000
        STRH     R1,[R0, #+28]
??I2C_FastModeDutyCycleConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_CheckEvent:
        MOVS     R2,#+0
        MOVS     R2,#+0
        MOVS     R3,#+0
        MOVS     R2,#+0
        LDRH     R2,[R0, #+20]
        LDRH     R3,[R0, #+24]
        LSLS     R3,R3,#+16
        ORRS     R0,R3,R2
        LSLS     R2,R0,#+8        ;; ZeroExtS R2,R0,#+8,#+8
        LSRS     R2,R2,#+8
        ANDS     R0,R1,R2
        CMP      R0,R1
        BNE.N    ??I2C_CheckEvent_0
        MOVS     R2,#+1
        B.N      ??I2C_CheckEvent_1
??I2C_CheckEvent_0:
        MOVS     R2,#+0
??I2C_CheckEvent_1:
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GetLastEvent:
        MOVS     R1,#+0
        MOVS     R1,#+0
        MOVS     R2,#+0
        LDRH     R1,[R0, #+20]
        LDRH     R2,[R0, #+24]
        LSLS     R2,R2,#+16
        ORRS     R0,R2,R1
        LSLS     R1,R0,#+8        ;; ZeroExtS R1,R0,#+8,#+8
        LSRS     R1,R1,#+8
        MOVS     R0,R1
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GetFlagStatus:
        SUB      SP,SP,#+8
        MOVS     R2,R0
        MOVS     R0,#+0
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        STR      R2,[SP, #+0]
        LSRS     R0,R1,#+28
        STR      R0,[SP, #+4]
        LSLS     R1,R1,#+8        ;; ZeroExtS R1,R1,#+8,#+8
        LSRS     R1,R1,#+8
        LDR      R0,[SP, #+4]
        CMP      R0,#+0
        BEQ.N    ??I2C_GetFlagStatus_0
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+20
        STR      R0,[SP, #+0]
        B.N      ??I2C_GetFlagStatus_1
??I2C_GetFlagStatus_0:
        LSRS     R1,R1,#+16
        LDR      R0,[SP, #+0]
        ADDS     R0,R0,#+24
        STR      R0,[SP, #+0]
??I2C_GetFlagStatus_1:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+0]
        TST      R0,R1
        BEQ.N    ??I2C_GetFlagStatus_2
        MOVS     R0,#+1
        B.N      ??I2C_GetFlagStatus_3
??I2C_GetFlagStatus_2:
        MOVS     R0,#+0
??I2C_GetFlagStatus_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        ADD      SP,SP,#+8
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ClearFlag:
        MOVS     R2,#+0
        LSLS     R2,R1,#+8        ;; ZeroExtS R2,R1,#+8,#+8
        LSRS     R2,R2,#+8
        MVNS     R1,R2
        STRH     R1,[R0, #+20]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_GetITStatus:
        MOVS     R2,#+0
        MOVS     R2,#+0
        LDRH     R2,[R0, #+4]
        ANDS     R2,R2,R1, LSR #+16
        ANDS     R2,R2,#0x700
        LSLS     R1,R1,#+8        ;; ZeroExtS R1,R1,#+8,#+8
        LSRS     R1,R1,#+8
        LDRH     R0,[R0, #+20]
        TST      R0,R1
        BEQ.N    ??I2C_GetITStatus_0
        CMP      R2,#+0
        BEQ.N    ??I2C_GetITStatus_0
        MOVS     R2,#+1
        B.N      ??I2C_GetITStatus_1
??I2C_GetITStatus_0:
        MOVS     R2,#+0
??I2C_GetITStatus_1:
        MOVS     R0,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
I2C_ClearITPendingBit:
        MOVS     R2,#+0
        LSLS     R2,R1,#+8        ;; ZeroExtS R2,R1,#+8,#+8
        LSRS     R2,R2,#+8
        MVNS     R1,R2
        STRH     R1,[R0, #+20]
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
// 1 088 bytes in section .text
// 
// 1 088 bytes of CODE memory
//
//Errors: none
//Warnings: none
