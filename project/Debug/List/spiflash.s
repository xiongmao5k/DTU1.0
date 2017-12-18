///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       15/Dec/2017  11:10:24
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\dev\spiflash.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\dev\spiflash.c -D STM32F10X_MD
//        -D USE_STDPERIPH_DRIVER -lb
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\spiflash.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN GPIO_Init
        EXTERN GPIO_ResetBits
        EXTERN GPIO_SetBits
        EXTERN SPI_Cmd
        EXTERN SPI_I2S_GetFlagStatus
        EXTERN SPI_I2S_ReceiveData
        EXTERN SPI_I2S_SendData
        EXTERN SPI_Init
        EXTERN SPI_StructInit

        PUBLIC SPI_FLASH_BlockErase
        PUBLIC SPI_FLASH_ChipErase
        PUBLIC SPI_FLASH_Init
        PUBLIC SPI_FLASH_Read
        PUBLIC SPI_FLASH_SectorErase
        PUBLIC SPI_FLASH_Write


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_FLASH_ChipSelect:
        PUSH     {R7,LR}
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SPI_FLASH_ChipSelect_0
        MOV      R1,#+256
        LDR.N    R0,??DataTable2  ;; 0x40010800
        BL       GPIO_ResetBits
        B.N      ??SPI_FLASH_ChipSelect_1
??SPI_FLASH_ChipSelect_0:
        MOV      R1,#+256
        LDR.N    R0,??DataTable2  ;; 0x40010800
        BL       GPIO_SetBits
??SPI_FLASH_ChipSelect_1:
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_FLASH_SwapByte:
        PUSH     {R4,LR}
        MOVS     R4,R0
??SPI_FLASH_SwapByte_0:
        MOVS     R1,#+2
        LDR.N    R0,??DataTable2_1  ;; 0x40003800
        BL       SPI_I2S_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??SPI_FLASH_SwapByte_0
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        LDR.N    R0,??DataTable2_1  ;; 0x40003800
        BL       SPI_I2S_SendData
??SPI_FLASH_SwapByte_1:
        MOVS     R1,#+1
        LDR.N    R0,??DataTable2_1  ;; 0x40003800
        BL       SPI_I2S_GetFlagStatus
        CMP      R0,#+0
        BEQ.N    ??SPI_FLASH_SwapByte_1
        LDR.N    R0,??DataTable2_1  ;; 0x40003800
        BL       SPI_I2S_ReceiveData
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_FLASH_SelectProtect:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,#+0
        MOVS     R0,#+0
        BL       SPI_FLASH_ChipSelect
        MOVS     R0,#+5
        BL       SPI_FLASH_SwapByte
        MOVS     R0,#+0
        BL       SPI_FLASH_SwapByte
        MOVS     R5,R0
        MOVS     R0,#+1
        BL       SPI_FLASH_ChipSelect
        ANDS     R4,R4,#0x3
        ANDS     R0,R5,#0xF3
        ORRS     R5,R0,R4, LSL #+2
        MOVS     R0,#+0
        BL       SPI_FLASH_ChipSelect
        MOVS     R0,#+80
        BL       SPI_FLASH_SwapByte
        MOVS     R0,#+1
        BL       SPI_FLASH_ChipSelect
        MOVS     R0,#+0
        BL       SPI_FLASH_ChipSelect
        MOVS     R0,#+1
        BL       SPI_FLASH_SwapByte
        MOVS     R0,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SPI_FLASH_SwapByte
        MOVS     R0,#+1
        BL       SPI_FLASH_ChipSelect
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_FLASH_WriteEnable:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        BL       SPI_FLASH_ChipSelect
        MOVS     R0,#+6
        BL       SPI_FLASH_SwapByte
        MOVS     R0,#+1
        BL       SPI_FLASH_ChipSelect
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_FLASH_WriteDisable:
        PUSH     {R7,LR}
        MOVS     R0,#+0
        BL       SPI_FLASH_ChipSelect
        MOVS     R0,#+4
        BL       SPI_FLASH_SwapByte
        MOVS     R0,#+1
        BL       SPI_FLASH_ChipSelect
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_FLASH_SendCommandAndAddress:
        PUSH     {R3-R5,LR}
        MOVS     R4,R1
        MOVS     R5,#+3
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SPI_FLASH_SwapByte
        B.N      ??SPI_FLASH_SendCommandAndAddress_0
??SPI_FLASH_SendCommandAndAddress_1:
        LSLS     R1,R5,#+3
        MOVS     R0,R4
        LSRS     R0,R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BL       SPI_FLASH_SwapByte
??SPI_FLASH_SendCommandAndAddress_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BNE.N    ??SPI_FLASH_SendCommandAndAddress_1
        POP      {R0,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_FLASH_WaitForBusy:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R0,#+0
        STRB     R0,[SP, #+0]
        ADD      R4,SP,#+0
        MOVS     R0,#+0
        BL       SPI_FLASH_ChipSelect
        MOVS     R0,#+5
        BL       SPI_FLASH_SwapByte
??SPI_FLASH_WaitForBusy_0:
        MOVS     R0,#+0
        BL       SPI_FLASH_SwapByte
        STRB     R0,[SP, #+0]
        LDRB     R0,[R4, #+0]
        ANDS     R0,R0,#0x1
        CMP      R0,#+0
        BNE.N    ??SPI_FLASH_WaitForBusy_0
        MOVS     R0,#+1
        BL       SPI_FLASH_ChipSelect
        POP      {R0,R1,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_FLASH_ChipErase:
        PUSH     {R7,LR}
        BL       SPI_FLASH_WriteEnable
        MOVS     R0,#+0
        BL       SPI_FLASH_ChipSelect
        MOVS     R0,#+96
        BL       SPI_FLASH_SwapByte
        MOVS     R0,#+1
        BL       SPI_FLASH_ChipSelect
        BL       SPI_FLASH_WaitForBusy
        BL       SPI_FLASH_WriteDisable
        POP      {R0,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_FLASH_BlockErase:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       SPI_FLASH_WriteEnable
        MOVS     R0,#+0
        BL       SPI_FLASH_ChipSelect
        MOVS     R1,R4
        MOVS     R0,#+82
        BL       SPI_FLASH_SendCommandAndAddress
        MOVS     R0,#+1
        BL       SPI_FLASH_ChipSelect
        BL       SPI_FLASH_WaitForBusy
        BL       SPI_FLASH_WriteDisable
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_FLASH_SectorErase:
        PUSH     {R4,LR}
        MOVS     R4,R0
        BL       SPI_FLASH_WriteEnable
        MOVS     R0,#+0
        BL       SPI_FLASH_ChipSelect
        MOVS     R1,R4
        MOVS     R0,#+32
        BL       SPI_FLASH_SendCommandAndAddress
        MOVS     R0,#+1
        BL       SPI_FLASH_ChipSelect
        BL       SPI_FLASH_WaitForBusy
        BL       SPI_FLASH_WriteDisable
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_FLASH_Write:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        BL       SPI_FLASH_WriteEnable
        BL       SPI_FLASH_WaitForBusy
        MOVS     R0,#+0
        BL       SPI_FLASH_ChipSelect
        MOVS     R1,R4
        MOVS     R0,#+175
        BL       SPI_FLASH_SendCommandAndAddress
        CMP      R6,#+1
        BNE.N    ??SPI_FLASH_Write_0
        LDRB     R0,[R5, #+0]
        BL       SPI_FLASH_SwapByte
        ADDS     R5,R5,#+1
        MOVS     R0,#+1
        BL       SPI_FLASH_ChipSelect
        BL       SPI_FLASH_WaitForBusy
        B.N      ??SPI_FLASH_Write_1
??SPI_FLASH_Write_2:
        LDRB     R0,[R5, #+0]
        BL       SPI_FLASH_SwapByte
        ADDS     R5,R5,#+1
        MOVS     R0,#+1
        BL       SPI_FLASH_ChipSelect
        BL       SPI_FLASH_WaitForBusy
        CMP      R6,#+0
        BEQ.N    ??SPI_FLASH_Write_0
        MOVS     R0,#+0
        BL       SPI_FLASH_ChipSelect
        MOVS     R0,#+175
        BL       SPI_FLASH_SwapByte
??SPI_FLASH_Write_0:
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        CMP      R0,#+0
        BNE.N    ??SPI_FLASH_Write_2
??SPI_FLASH_Write_1:
        BL       SPI_FLASH_WriteDisable
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_FLASH_Read:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R0,#+0
        BL       SPI_FLASH_ChipSelect
        MOVS     R1,R4
        MOVS     R0,#+3
        BL       SPI_FLASH_SendCommandAndAddress
        B.N      ??SPI_FLASH_Read_0
??SPI_FLASH_Read_1:
        MOVS     R0,#+0
        BL       SPI_FLASH_SwapByte
        STRB     R0,[R5, #+0]
        ADDS     R5,R5,#+1
??SPI_FLASH_Read_0:
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        CMP      R0,#+0
        BNE.N    ??SPI_FLASH_Read_1
        MOVS     R0,#+1
        BL       SPI_FLASH_ChipSelect
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPI_FLASH_Init:
        PUSH     {LR}
        SUB      SP,SP,#+28
        MOVS     R0,#+24
        STRB     R0,[SP, #+3]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOV      R0,#+57344
        STRH     R0,[SP, #+0]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable2_2  ;; 0x40010c00
        BL       GPIO_Init
        MOVS     R0,#+16
        STRB     R0,[SP, #+3]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOV      R0,#+256
        STRH     R0,[SP, #+0]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable2  ;; 0x40010800
        BL       GPIO_Init
        MOVS     R0,#+16
        STRB     R0,[SP, #+3]
        MOVS     R0,#+3
        STRB     R0,[SP, #+2]
        MOV      R0,#+4096
        STRH     R0,[SP, #+0]
        ADD      R1,SP,#+0
        LDR.N    R0,??DataTable2_2  ;; 0x40010c00
        BL       GPIO_Init
        MOV      R1,#+4096
        LDR.N    R0,??DataTable2_2  ;; 0x40010c00
        BL       GPIO_SetBits
        MOV      R1,#+256
        LDR.N    R0,??DataTable2  ;; 0x40010800
        BL       GPIO_SetBits
        ADD      R0,SP,#+4
        BL       SPI_StructInit
        MOV      R0,#+260
        STRH     R0,[SP, #+6]
        MOV      R0,#+512
        STRH     R0,[SP, #+14]
        MOVS     R0,#+16
        STRH     R0,[SP, #+16]
        MOVS     R0,#+2
        STRH     R0,[SP, #+10]
        MOVS     R0,#+1
        STRH     R0,[SP, #+12]
        ADD      R1,SP,#+4
        LDR.N    R0,??DataTable2_1  ;; 0x40003800
        BL       SPI_Init
        MOVS     R1,#+1
        LDR.N    R0,??DataTable2_1  ;; 0x40003800
        BL       SPI_Cmd
        MOVS     R0,#+0
        BL       SPI_FLASH_SelectProtect
        ADD      SP,SP,#+28
        POP      {PC}             ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2:
        DC32     0x40010800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_1:
        DC32     0x40003800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable2_2:
        DC32     0x40010c00

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
// 754 bytes in section .text
// 
// 754 bytes of CODE memory
//
//Errors: none
//Warnings: none
