///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       18/Dec/2017  10:50:25
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_flash.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\cpu\Libraries\STM32F10x_StdPeriph_Driver\src\stm32f10x_flash.c
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\stm32f10x_flash.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        PUBLIC FLASH_ClearFlag
        PUBLIC FLASH_EnableWriteProtection
        PUBLIC FLASH_EraseAllBank1Pages
        PUBLIC FLASH_EraseAllPages
        PUBLIC FLASH_EraseOptionBytes
        PUBLIC FLASH_ErasePage
        PUBLIC FLASH_GetBank1Status
        PUBLIC FLASH_GetFlagStatus
        PUBLIC FLASH_GetPrefetchBufferStatus
        PUBLIC FLASH_GetReadOutProtectionStatus
        PUBLIC FLASH_GetStatus
        PUBLIC FLASH_GetUserOptionByte
        PUBLIC FLASH_GetWriteProtectionOptionByte
        PUBLIC FLASH_HalfCycleAccessCmd
        PUBLIC FLASH_ITConfig
        PUBLIC FLASH_Lock
        PUBLIC FLASH_LockBank1
        PUBLIC FLASH_PrefetchBufferCmd
        PUBLIC FLASH_ProgramHalfWord
        PUBLIC FLASH_ProgramOptionByteData
        PUBLIC FLASH_ProgramWord
        PUBLIC FLASH_ReadOutProtection
        PUBLIC FLASH_SetLatency
        PUBLIC FLASH_Unlock
        PUBLIC FLASH_UnlockBank1
        PUBLIC FLASH_UserOptionByteConfig
        PUBLIC FLASH_WaitForLastBank1Operation
        PUBLIC FLASH_WaitForLastOperation


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_SetLatency:
        MOVS     R1,#+0
        LDR.W    R1,??DataTable25  ;; 0x40022000
        LDR      R1,[R1, #+0]
        ANDS     R1,R1,#0x38
        ORRS     R1,R0,R1
        LDR.W    R0,??DataTable25  ;; 0x40022000
        STR      R1,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_HalfCycleAccessCmd:
        LDR.W    R1,??DataTable25  ;; 0x40022000
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x8
        LDR.W    R2,??DataTable25  ;; 0x40022000
        STR      R1,[R2, #+0]
        LDR.W    R1,??DataTable25  ;; 0x40022000
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.W    R1,??DataTable25  ;; 0x40022000
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_PrefetchBufferCmd:
        LDR.W    R1,??DataTable25  ;; 0x40022000
        LDR      R1,[R1, #+0]
        BICS     R1,R1,#0x10
        LDR.W    R2,??DataTable25  ;; 0x40022000
        STR      R1,[R2, #+0]
        LDR.W    R1,??DataTable25  ;; 0x40022000
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.W    R1,??DataTable25  ;; 0x40022000
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_Unlock:
        LDR.W    R0,??DataTable25_1  ;; 0x45670123
        LDR.W    R1,??DataTable25_2  ;; 0x40022004
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable25_3  ;; 0xcdef89ab
        LDR.W    R1,??DataTable25_2  ;; 0x40022004
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_UnlockBank1:
        LDR.W    R0,??DataTable25_1  ;; 0x45670123
        LDR.W    R1,??DataTable25_2  ;; 0x40022004
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable25_3  ;; 0xcdef89ab
        LDR.W    R1,??DataTable25_2  ;; 0x40022004
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_Lock:
        LDR.W    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_LockBank1:
        LDR.W    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x80
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_ErasePage:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+4
        MOVS     R0,#+720896
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_ErasePage_0
        LDR.W    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x2
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable25_5  ;; 0x40022014
        STR      R4,[R0, #+0]
        LDR.W    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        MOVS     R0,#+720896
        BL       FLASH_WaitForLastOperation
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        LDR      R1,[R1, #+0]
        MOVW     R2,#+8189
        ANDS     R1,R2,R1
        LDR.W    R2,??DataTable25_4  ;; 0x40022010
        STR      R1,[R2, #+0]
??FLASH_ErasePage_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_EraseAllPages:
        PUSH     {R7,LR}
        MOVS     R0,#+4
        MOVS     R0,#+720896
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_EraseAllPages_0
        LDR.W    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        MOVS     R0,#+720896
        BL       FLASH_WaitForLastOperation
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        LDR      R1,[R1, #+0]
        MOVW     R2,#+8187
        ANDS     R1,R2,R1
        LDR.W    R2,??DataTable25_4  ;; 0x40022010
        STR      R1,[R2, #+0]
??FLASH_EraseAllPages_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_EraseAllBank1Pages:
        PUSH     {R7,LR}
        MOVS     R0,#+4
        MOVS     R0,#+720896
        BL       FLASH_WaitForLastBank1Operation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_EraseAllBank1Pages_0
        LDR.W    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x4
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        MOVS     R0,#+720896
        BL       FLASH_WaitForLastBank1Operation
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        LDR      R1,[R1, #+0]
        MOVW     R2,#+8187
        ANDS     R1,R2,R1
        LDR.W    R2,??DataTable25_4  ;; 0x40022010
        STR      R1,[R2, #+0]
??FLASH_EraseAllBank1Pages_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_EraseOptionBytes:
        PUSH     {R4,LR}
        MOVS     R4,#+165
        MOVS     R0,#+4
        BL       FLASH_GetReadOutProtectionStatus
        CMP      R0,#+0
        BEQ.N    ??FLASH_EraseOptionBytes_0
        MOVS     R4,#+0
??FLASH_EraseOptionBytes_0:
        MOVS     R0,#+720896
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_EraseOptionBytes_1
        LDR.W    R0,??DataTable25_1  ;; 0x45670123
        LDR.W    R1,??DataTable25_6  ;; 0x40022008
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable25_3  ;; 0xcdef89ab
        LDR.W    R1,??DataTable25_6  ;; 0x40022008
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        MOVS     R0,#+720896
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_EraseOptionBytes_2
        LDR.W    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVW     R1,#+8159
        ANDS     R0,R1,R0
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        LDR.W    R0,??DataTable25_7  ;; 0x1ffff800
        STRH     R4,[R0, #+0]
        MOV      R0,#+8192
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BEQ.N    ??FLASH_EraseOptionBytes_1
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        LDR      R1,[R1, #+0]
        MOVW     R2,#+8175
        ANDS     R1,R2,R1
        LDR.W    R2,??DataTable25_4  ;; 0x40022010
        STR      R1,[R2, #+0]
        B.N      ??FLASH_EraseOptionBytes_1
??FLASH_EraseOptionBytes_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BEQ.N    ??FLASH_EraseOptionBytes_1
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        LDR      R1,[R1, #+0]
        MOVW     R2,#+8175
        ANDS     R1,R2,R1
        LDR.W    R2,??DataTable25_4  ;; 0x40022010
        STR      R1,[R2, #+0]
??FLASH_EraseOptionBytes_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_ProgramWord:
        PUSH     {R3-R5,LR}
        MOVS     R5,R0
        MOVS     R4,R1
        MOVS     R0,#+4
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOV      R0,#+8192
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_ProgramWord_0
        LDR.W    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        STRH     R4,[R5, #+0]
        MOV      R0,#+8192
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_ProgramWord_1
        ADDS     R0,R5,#+2
        STR      R0,[SP, #+0]
        LSRS     R0,R4,#+16
        LDR      R1,[SP, #+0]
        STRH     R0,[R1, #+0]
        MOV      R0,#+8192
        BL       FLASH_WaitForLastOperation
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        LDR      R1,[R1, #+0]
        MOVW     R2,#+8190
        ANDS     R1,R2,R1
        LDR.W    R2,??DataTable25_4  ;; 0x40022010
        STR      R1,[R2, #+0]
        B.N      ??FLASH_ProgramWord_0
??FLASH_ProgramWord_1:
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        LDR      R1,[R1, #+0]
        MOVW     R2,#+8190
        ANDS     R1,R2,R1
        LDR.W    R2,??DataTable25_4  ;; 0x40022010
        STR      R1,[R2, #+0]
??FLASH_ProgramWord_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_ProgramHalfWord:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+4
        MOV      R0,#+8192
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_ProgramHalfWord_0
        LDR.W    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x1
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        STRH     R5,[R4, #+0]
        MOV      R0,#+8192
        BL       FLASH_WaitForLastOperation
        LDR.W    R1,??DataTable25_4  ;; 0x40022010
        LDR      R1,[R1, #+0]
        MOVW     R2,#+8190
        ANDS     R1,R2,R1
        LDR.W    R2,??DataTable25_4  ;; 0x40022010
        STR      R1,[R2, #+0]
??FLASH_ProgramHalfWord_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_ProgramOptionByteData:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+4
        MOV      R0,#+8192
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_ProgramOptionByteData_0
        LDR.N    R0,??DataTable25_1  ;; 0x45670123
        LDR.N    R1,??DataTable25_6  ;; 0x40022008
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable25_3  ;; 0xcdef89ab
        LDR.N    R1,??DataTable25_6  ;; 0x40022008
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        STRH     R5,[R4, #+0]
        MOV      R0,#+8192
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BEQ.N    ??FLASH_ProgramOptionByteData_0
        LDR.N    R1,??DataTable25_4  ;; 0x40022010
        LDR      R1,[R1, #+0]
        MOVW     R2,#+8175
        ANDS     R1,R2,R1
        LDR.N    R2,??DataTable25_4  ;; 0x40022010
        STR      R1,[R2, #+0]
??FLASH_ProgramOptionByteData_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_EnableWriteProtection:
        PUSH     {R3-R7,LR}
        MOVS     R1,R0
        MOVW     R4,#+65535
        MOVW     R5,#+65535
        MOVW     R6,#+65535
        MOVW     R7,#+65535
        MOVS     R0,#+4
        MVNS     R1,R1
        ANDS     R4,R1,#0xFF
        UBFX     R5,R1,#+8,#+8
        LSRS     R0,R1,#+16
        UXTB     R6,R0            ;; ZeroExt  R6,R0,#+24,#+24
        LSRS     R7,R1,#+24
        MOV      R0,#+8192
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_EnableWriteProtection_0
        LDR.N    R1,??DataTable25_1  ;; 0x45670123
        LDR.N    R2,??DataTable25_6  ;; 0x40022008
        STR      R1,[R2, #+0]
        LDR.N    R1,??DataTable25_3  ;; 0xcdef89ab
        LDR.N    R2,??DataTable25_6  ;; 0x40022008
        STR      R1,[R2, #+0]
        LDR.N    R1,??DataTable25_4  ;; 0x40022010
        LDR      R1,[R1, #+0]
        ORRS     R1,R1,#0x10
        LDR.N    R2,??DataTable25_4  ;; 0x40022010
        STR      R1,[R2, #+0]
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+255
        BEQ.N    ??FLASH_EnableWriteProtection_1
        LDR.N    R0,??DataTable25_8  ;; 0x1ffff808
        STRH     R4,[R0, #+0]
        MOV      R0,#+8192
        BL       FLASH_WaitForLastOperation
??FLASH_EnableWriteProtection_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_EnableWriteProtection_2
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+255
        BEQ.N    ??FLASH_EnableWriteProtection_2
        LDR.N    R0,??DataTable25_9  ;; 0x1ffff80a
        STRH     R5,[R0, #+0]
        MOV      R0,#+8192
        BL       FLASH_WaitForLastOperation
??FLASH_EnableWriteProtection_2:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_EnableWriteProtection_3
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+255
        BEQ.N    ??FLASH_EnableWriteProtection_3
        LDR.N    R0,??DataTable25_10  ;; 0x1ffff80c
        STRH     R6,[R0, #+0]
        MOV      R0,#+8192
        BL       FLASH_WaitForLastOperation
??FLASH_EnableWriteProtection_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_EnableWriteProtection_4
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+255
        BEQ.N    ??FLASH_EnableWriteProtection_4
        LDR.N    R0,??DataTable25_11  ;; 0x1ffff80e
        STRH     R7,[R0, #+0]
        MOV      R0,#+8192
        BL       FLASH_WaitForLastOperation
??FLASH_EnableWriteProtection_4:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BEQ.N    ??FLASH_EnableWriteProtection_0
        LDR.N    R1,??DataTable25_4  ;; 0x40022010
        LDR      R1,[R1, #+0]
        MOVW     R2,#+8175
        ANDS     R1,R2,R1
        LDR.N    R2,??DataTable25_4  ;; 0x40022010
        STR      R1,[R2, #+0]
??FLASH_EnableWriteProtection_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_ReadOutProtection:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+4
        MOVS     R0,#+720896
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_ReadOutProtection_0
        LDR.N    R0,??DataTable25_1  ;; 0x45670123
        LDR.N    R1,??DataTable25_6  ;; 0x40022008
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable25_3  ;; 0xcdef89ab
        LDR.N    R1,??DataTable25_6  ;; 0x40022008
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x20
        LDR.N    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x40
        LDR.N    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        MOVS     R0,#+720896
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_ReadOutProtection_1
        LDR.N    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        MOVW     R1,#+8159
        ANDS     R0,R1,R0
        LDR.N    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??FLASH_ReadOutProtection_2
        MOVS     R0,#+0
        LDR.N    R1,??DataTable25_7  ;; 0x1ffff800
        STRH     R0,[R1, #+0]
        B.N      ??FLASH_ReadOutProtection_3
??FLASH_ReadOutProtection_2:
        MOVS     R0,#+165
        LDR.N    R1,??DataTable25_7  ;; 0x1ffff800
        STRH     R0,[R1, #+0]
??FLASH_ReadOutProtection_3:
        MOVS     R0,#+720896
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BEQ.N    ??FLASH_ReadOutProtection_0
        LDR.N    R1,??DataTable25_4  ;; 0x40022010
        LDR      R1,[R1, #+0]
        MOVW     R2,#+8175
        ANDS     R1,R2,R1
        LDR.N    R2,??DataTable25_4  ;; 0x40022010
        STR      R1,[R2, #+0]
        B.N      ??FLASH_ReadOutProtection_0
??FLASH_ReadOutProtection_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BEQ.N    ??FLASH_ReadOutProtection_0
        LDR.N    R1,??DataTable25_4  ;; 0x40022010
        LDR      R1,[R1, #+0]
        MOVW     R2,#+8159
        ANDS     R1,R2,R1
        LDR.N    R2,??DataTable25_4  ;; 0x40022010
        STR      R1,[R2, #+0]
??FLASH_ReadOutProtection_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_UserOptionByteConfig:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R0,#+4
        LDR.N    R0,??DataTable25_1  ;; 0x45670123
        LDR.N    R1,??DataTable25_6  ;; 0x40022008
        STR      R0,[R1, #+0]
        LDR.N    R0,??DataTable25_3  ;; 0xcdef89ab
        LDR.N    R1,??DataTable25_6  ;; 0x40022008
        STR      R0,[R1, #+0]
        MOV      R0,#+8192
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+4
        BNE.N    ??FLASH_UserOptionByteConfig_0
        LDR.N    R0,??DataTable25_4  ;; 0x40022010
        LDR      R0,[R0, #+0]
        ORRS     R0,R0,#0x10
        LDR.N    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        ORRS     R0,R6,#0xF8
        ORRS     R0,R0,R5
        ORRS     R0,R0,R4
        LDR.N    R1,??DataTable25_12  ;; 0x1ffff802
        STRH     R0,[R1, #+0]
        MOV      R0,#+8192
        BL       FLASH_WaitForLastOperation
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+5
        BEQ.N    ??FLASH_UserOptionByteConfig_0
        LDR.N    R1,??DataTable25_4  ;; 0x40022010
        LDR      R1,[R1, #+0]
        MOVW     R2,#+8175
        ANDS     R1,R2,R1
        LDR.N    R2,??DataTable25_4  ;; 0x40022010
        STR      R1,[R2, #+0]
??FLASH_UserOptionByteConfig_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_GetUserOptionByte:
        LDR.N    R0,??DataTable25_13  ;; 0x4002201c
        LDR      R0,[R0, #+0]
        LSRS     R0,R0,#+2
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_GetWriteProtectionOptionByte:
        LDR.N    R0,??DataTable25_14  ;; 0x40022020
        LDR      R0,[R0, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_GetReadOutProtectionStatus:
        MOVS     R0,#+0
        LDR.N    R0,??DataTable25_13  ;; 0x4002201c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+30
        BPL.N    ??FLASH_GetReadOutProtectionStatus_0
        MOVS     R0,#+1
        B.N      ??FLASH_GetReadOutProtectionStatus_1
??FLASH_GetReadOutProtectionStatus_0:
        MOVS     R0,#+0
??FLASH_GetReadOutProtectionStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_GetPrefetchBufferStatus:
        MOVS     R0,#+0
        LDR.N    R0,??DataTable25  ;; 0x40022000
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+26
        BPL.N    ??FLASH_GetPrefetchBufferStatus_0
        MOVS     R0,#+1
        B.N      ??FLASH_GetPrefetchBufferStatus_1
??FLASH_GetPrefetchBufferStatus_0:
        MOVS     R0,#+0
??FLASH_GetPrefetchBufferStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_ITConfig:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+0
        BEQ.N    ??FLASH_ITConfig_0
        LDR.N    R1,??DataTable25_4  ;; 0x40022010
        LDR      R1,[R1, #+0]
        ORRS     R0,R0,R1
        LDR.N    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
        B.N      ??FLASH_ITConfig_1
??FLASH_ITConfig_0:
        LDR.N    R1,??DataTable25_4  ;; 0x40022010
        LDR      R1,[R1, #+0]
        BICS     R0,R1,R0
        LDR.N    R1,??DataTable25_4  ;; 0x40022010
        STR      R0,[R1, #+0]
??FLASH_ITConfig_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_GetFlagStatus:
        MOVS     R1,#+0
        CMP      R0,#+1
        BNE.N    ??FLASH_GetFlagStatus_0
        LDR.N    R0,??DataTable25_13  ;; 0x4002201c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??FLASH_GetFlagStatus_1
        MOVS     R1,#+1
        B.N      ??FLASH_GetFlagStatus_2
??FLASH_GetFlagStatus_1:
        MOVS     R1,#+0
        B.N      ??FLASH_GetFlagStatus_2
??FLASH_GetFlagStatus_0:
        LDR.N    R1,??DataTable25_15  ;; 0x4002200c
        LDR      R1,[R1, #+0]
        TST      R1,R0
        BEQ.N    ??FLASH_GetFlagStatus_3
        MOVS     R1,#+1
        B.N      ??FLASH_GetFlagStatus_2
??FLASH_GetFlagStatus_3:
        MOVS     R1,#+0
??FLASH_GetFlagStatus_2:
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_ClearFlag:
        LDR.N    R1,??DataTable25_15  ;; 0x4002200c
        STR      R0,[R1, #+0]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_GetStatus:
        MOVS     R0,#+4
        LDR.N    R0,??DataTable25_15  ;; 0x4002200c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??FLASH_GetStatus_0
        MOVS     R0,#+1
        B.N      ??FLASH_GetStatus_1
??FLASH_GetStatus_0:
        LDR.N    R0,??DataTable25_15  ;; 0x4002200c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??FLASH_GetStatus_2
        MOVS     R0,#+2
        B.N      ??FLASH_GetStatus_1
??FLASH_GetStatus_2:
        LDR.N    R0,??DataTable25_15  ;; 0x4002200c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BPL.N    ??FLASH_GetStatus_3
        MOVS     R0,#+3
        B.N      ??FLASH_GetStatus_1
??FLASH_GetStatus_3:
        MOVS     R0,#+4
??FLASH_GetStatus_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_GetBank1Status:
        MOVS     R0,#+4
        LDR.N    R0,??DataTable25_15  ;; 0x4002200c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+31
        BPL.N    ??FLASH_GetBank1Status_0
        MOVS     R0,#+1
        B.N      ??FLASH_GetBank1Status_1
??FLASH_GetBank1Status_0:
        LDR.N    R0,??DataTable25_15  ;; 0x4002200c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+29
        BPL.N    ??FLASH_GetBank1Status_2
        MOVS     R0,#+2
        B.N      ??FLASH_GetBank1Status_1
??FLASH_GetBank1Status_2:
        LDR.N    R0,??DataTable25_15  ;; 0x4002200c
        LDR      R0,[R0, #+0]
        LSLS     R0,R0,#+27
        BPL.N    ??FLASH_GetBank1Status_3
        MOVS     R0,#+3
        B.N      ??FLASH_GetBank1Status_1
??FLASH_GetBank1Status_3:
        MOVS     R0,#+4
??FLASH_GetBank1Status_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25:
        DC32     0x40022000

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_1:
        DC32     0x45670123

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_2:
        DC32     0x40022004

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_3:
        DC32     0xcdef89ab

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_4:
        DC32     0x40022010

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_5:
        DC32     0x40022014

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_6:
        DC32     0x40022008

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_7:
        DC32     0x1ffff800

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_8:
        DC32     0x1ffff808

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_9:
        DC32     0x1ffff80a

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_10:
        DC32     0x1ffff80c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_11:
        DC32     0x1ffff80e

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_12:
        DC32     0x1ffff802

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_13:
        DC32     0x4002201c

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_14:
        DC32     0x40022020

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_15:
        DC32     0x4002200c

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_WaitForLastOperation:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+4
        BL       FLASH_GetBank1Status
        B.N      ??FLASH_WaitForLastOperation_0
??FLASH_WaitForLastOperation_1:
        BL       FLASH_GetBank1Status
        SUBS     R4,R4,#+1
??FLASH_WaitForLastOperation_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FLASH_WaitForLastOperation_2
        CMP      R4,#+0
        BNE.N    ??FLASH_WaitForLastOperation_1
??FLASH_WaitForLastOperation_2:
        CMP      R4,#+0
        BNE.N    ??FLASH_WaitForLastOperation_3
        MOVS     R0,#+5
??FLASH_WaitForLastOperation_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
FLASH_WaitForLastBank1Operation:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R0,#+4
        BL       FLASH_GetBank1Status
        B.N      ??FLASH_WaitForLastBank1Operation_0
??FLASH_WaitForLastBank1Operation_1:
        BL       FLASH_GetBank1Status
        SUBS     R4,R4,#+1
??FLASH_WaitForLastBank1Operation_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??FLASH_WaitForLastBank1Operation_2
        CMP      R4,#+0
        BNE.N    ??FLASH_WaitForLastBank1Operation_1
??FLASH_WaitForLastBank1Operation_2:
        CMP      R4,#+0
        BNE.N    ??FLASH_WaitForLastBank1Operation_3
        MOVS     R0,#+5
??FLASH_WaitForLastBank1Operation_3:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
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
// 1 696 bytes in section .text
// 
// 1 696 bytes of CODE memory
//
//Errors: none
//Warnings: none
