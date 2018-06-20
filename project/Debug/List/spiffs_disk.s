///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       05/Jun/2018  16:33:01
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\spiffs_disk.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\spiffs_disk.c -D STM32F10X_MD
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\gprsdtu\dev\ -On --vla
//        --use_c++_inline -I D:\software\IAR\arm\CMSIS\Include\
//    List file    =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\spiffs_disk.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN SPIFFS_format
        EXTERN SPIFFS_mount
        EXTERN SPI_FLASH_ChipErase
        EXTERN SPI_FLASH_Read
        EXTERN SPI_FLASH_SectorErase
        EXTERN SPI_FLASH_Write
        EXTERN __aeabi_memcpy
        EXTERN __aeabi_memset
        EXTERN free
        EXTERN malloc
        EXTERN memcmp
        EXTERN strcmp
        EXTERN strcpy

        PUBLIC SPIFFS_DiskInit
        PUBLIC dl_SPIFFS_close
        PUBLIC dl_SPIFFS_creat
        PUBLIC dl_SPIFFS_fflush
        PUBLIC dl_SPIFFS_info
        PUBLIC dl_SPIFFS_lseek
        PUBLIC dl_SPIFFS_open
        PUBLIC dl_SPIFFS_read
        PUBLIC dl_SPIFFS_remove
        PUBLIC dl_SPIFFS_rename
        PUBLIC dl_SPIFFS_stat
        PUBLIC dl_SPIFFS_write
        PUBLIC dl_fs_init
        PUBLIC inner_fs_file_ceate
        PUBLIC inner_fs_file_is_exist
        PUBLIC inner_fs_file_jump_end
        PUBLIC inner_fs_get_free_block
        PUBLIC inner_make_crc16
        PUBLIC xFs


        SECTION `.bss`:DATA:REORDER:NOROOT(2)
xFs:
        DS8 112

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
spiffs_work_buf:
        DS8 256

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
spiffs_fds:
        DS8 128

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
spiffs_cache_buf:
        DS8 640

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_DiskInit:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+36
        MOVS     R4,#+0
        MOVS     R5,#+16
        MOVS     R6,#+0
        ADD      R7,SP,#+16
        MOVS     R2,R6
        MOVS     R1,R5
        MOVS     R0,R7
        BL       __aeabi_memset
        ADR.W    R0,prvSPIFFS_Read
        STR      R0,[SP, #+16]
        ADR.W    R0,prvSPIFFS_Write
        STR      R0,[SP, #+20]
        ADR.W    R0,prvSPIFFS_Erase
        STR      R0,[SP, #+24]
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOV      R0,#+640
        STR      R0,[SP, #+8]
        LDR.W    R0,??DataTable11
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        LDR.W    R3,??DataTable11_1
        LDR.W    R2,??DataTable11_2
        ADD      R1,SP,#+16
        LDR.W    R0,??DataTable13
        BL       SPIFFS_mount
        MOVS     R4,R0
        LDR.W    R0,??DataTable11_3  ;; 0xffffd8d7
        CMP      R4,R0
        BNE.N    ??SPIFFS_DiskInit_0
        BL       SPI_FLASH_ChipErase
        LDR.W    R0,??DataTable13
        BL       SPIFFS_format
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOV      R0,#+640
        STR      R0,[SP, #+8]
        LDR.W    R0,??DataTable11
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        LDR.W    R3,??DataTable11_1
        LDR.W    R2,??DataTable11_2
        ADD      R1,SP,#+16
        LDR.W    R0,??DataTable13
        BL       SPIFFS_mount
        MOVS     R4,R0
??SPIFFS_DiskInit_0:
        ADD      SP,SP,#+36
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
prvSPIFFS_Read:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R2,R5
        MOVS     R1,R6
        MOVS     R0,R4
        BL       SPI_FLASH_Read
        MOVS     R0,#+0
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
prvSPIFFS_Write:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R2,R5
        MOVS     R1,R6
        MOVS     R0,R4
        BL       SPI_FLASH_Write
        MOVS     R0,#+0
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
prvSPIFFS_Erase:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        LSRS     R6,R5,#+12
??prvSPIFFS_Erase_0:
        MOVS     R0,R6
        SUBS     R6,R0,#+1
        CMP      R0,#+0
        BEQ.N    ??prvSPIFFS_Erase_1
        MOVS     R0,R4
        BL       SPI_FLASH_SectorErase
        ADDS     R4,R4,#+4096
        B.N      ??prvSPIFFS_Erase_0
??prvSPIFFS_Erase_1:
        MOVS     R0,#+0
        POP      {R4-R6,PC}       ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_fs_header:
        DS8 344

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_fs_block:
        DS8 8

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_fs_init:
        PUSH     {R4-R6,LR}
        MOV      R2,#+344
        LDR.W    R1,??DataTable14
        MOVS     R0,#+0
        BL       SPI_FLASH_Read
        MOV      R1,#+336
        LDR.W    R0,??DataTable13_1
        BL       inner_make_crc16
        LDR.W    R1,??DataTable14
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BNE.N    ??dl_fs_init_0
        MOVS     R0,#+1
        LDR.W    R1,??DataTable14
        STRB     R0,[R1, #+340]
        MOVS     R0,#+0
        B.N      ??dl_fs_init_1
??dl_fs_init_0:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable14
        STRB     R0,[R1, #+340]
        MOV      R4,#+344
        MOVS     R5,#+0
        LDR.W    R6,??DataTable14
        MOVS     R2,R5
        MOVS     R1,R4
        MOVS     R0,R6
        BL       __aeabi_memset
        MOVS     R0,#+1
        LDR.W    R1,??DataTable14
        STRB     R0,[R1, #+340]
        MOVS     R0,#+0
??dl_fs_init_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
inner_fs_file_is_exist:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        LDR.W    R0,??DataTable14
        LDRB     R0,[R0, #+340]
        CMP      R0,#+0
        BEQ.N    ??inner_fs_file_is_exist_0
        MOVS     R0,#+0
        MOVS     R5,R0
??inner_fs_file_is_exist_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BGE.N    ??inner_fs_file_is_exist_0
        LDR.W    R0,??DataTable14
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+5
        ADDS     R1,R0,#+4
        MOVS     R0,R4
        BL       strcmp
        CMP      R0,#+0
        BNE.N    ??inner_fs_file_is_exist_2
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,R5
        B.N      ??inner_fs_file_is_exist_3
??inner_fs_file_is_exist_2:
        ADDS     R5,R5,#+1
        B.N      ??inner_fs_file_is_exist_1
??inner_fs_file_is_exist_0:
        MOVS     R0,#-1
??inner_fs_file_is_exist_3:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
inner_fs_get_free_block:
        PUSH     {R4}
        MOVS     R2,#+32
        LDR.W    R0,??DataTable14
        LDR      R3,[R0, #+332]
        MOVS     R0,#+1
        MOVS     R1,R0
??inner_fs_get_free_block_0:
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        UXTB     R2,R2            ;; ZeroExt  R2,R2,#+24,#+24
        CMP      R1,R2
        BCS.N    ??inner_fs_get_free_block_1
        MOVS     R0,R3
        LSRS     R0,R0,R1
        LSLS     R0,R0,#+31
        BMI.N    ??inner_fs_get_free_block_2
        LDR.W    R0,??DataTable14
        LDR      R0,[R0, #+332]
        MOVS     R4,#+1
        LSLS     R4,R4,R1
        ORRS     R0,R4,R0
        LDR.W    R4,??DataTable14
        STR      R0,[R4, #+332]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R1
        B.N      ??inner_fs_get_free_block_3
??inner_fs_get_free_block_2:
        ADDS     R1,R1,#+1
        B.N      ??inner_fs_get_free_block_0
??inner_fs_get_free_block_1:
        MOVS     R0,#-1
??inner_fs_get_free_block_3:
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
inner_fs_file_ceate:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        LDR.W    R0,??DataTable14
        LDRB     R0,[R0, #+340]
        CMP      R0,#+0
        BEQ.W    ??inner_fs_file_ceate_0
        MOVS     R0,#+0
        MOVS     R5,R0
??inner_fs_file_ceate_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BGE.N    ??inner_fs_file_ceate_0
        LDR.W    R0,??DataTable14
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+5
        LDRB     R0,[R0, #+4]
        CMP      R0,#+0
        BNE.N    ??inner_fs_file_ceate_2
        BL       inner_fs_get_free_block
        MOVS     R6,R0
        CMP      R6,#+0
        BPL.N    ??inner_fs_file_ceate_3
        MOVS     R0,#-1
        B.N      ??inner_fs_file_ceate_4
??inner_fs_file_ceate_3:
        LDR.W    R0,??DataTable14
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R0
        STRB     R6,[R0, #+260]
        MOVS     R1,R4
        LDR.W    R0,??DataTable14
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+5
        ADDS     R0,R0,#+4
        BL       strcpy
        LDR.W    R0,??DataTable14
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+260]
        MOV      R1,#+4096
        MULS     R0,R1,R0
        ADDS     R0,R0,#+8
        LDR.W    R1,??DataTable14
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R1,R5, LSL #+2
        STR      R0,[R1, #+300]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable14
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R1,R5, LSL #+2
        STR      R0,[R1, #+268]
        LDR.W    R0,??DataTable14
        LDR      R0,[R0, #+336]
        MOVS     R1,#+1
        LSLS     R1,R1,R5
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable14
        STR      R0,[R1, #+336]
        LDR.W    R0,??DataTable14
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+260]
        LDR.W    R1,??DataTable14_1
        STRB     R0,[R1, #+3]
        LDR.W    R0,??DataTable14_1
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable14_1
        STRB     R0,[R1, #+4]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable14_1
        STRH     R0,[R1, #+6]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable14_1
        STRB     R0,[R1, #+2]
        MOVS     R1,#+6
        LDR.W    R0,??DataTable14_2
        BL       inner_make_crc16
        LDR.W    R1,??DataTable14_1
        STRH     R0,[R1, #+0]
        LDR.W    R0,??DataTable14
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+2
        LDR      R0,[R0, #+300]
        SUBS     R0,R0,#+8
        BL       SPI_FLASH_SectorErase
        MOVS     R2,#+8
        LDR.W    R1,??DataTable14_1
        LDR.W    R0,??DataTable14
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+2
        LDR      R0,[R0, #+300]
        SUBS     R0,R0,#+8
        BL       SPI_FLASH_Write
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,R5
        B.N      ??inner_fs_file_ceate_4
??inner_fs_file_ceate_2:
        ADDS     R5,R5,#+1
        B.N      ??inner_fs_file_ceate_1
??inner_fs_file_ceate_0:
        MOVS     R0,#-1
??inner_fs_file_ceate_4:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
inner_fs_file_jump_end:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        LDR.W    R0,??DataTable14
        ADDS     R0,R4,R0
        LDRB     R0,[R0, #+260]
        MOV      R1,#+4096
        MULS     R0,R1,R0
        MOVS     R5,R0
??inner_fs_file_jump_end_0:
        MOVS     R2,#+8
        LDR.W    R1,??DataTable14_1
        MOVS     R0,R5
        BL       SPI_FLASH_Read
        MOVS     R1,#+6
        LDR.W    R0,??DataTable14_2
        BL       inner_make_crc16
        LDR.W    R1,??DataTable14_1
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R1,R0
        BEQ.N    ??inner_fs_file_jump_end_1
        MOVS     R0,#-1
        B.N      ??inner_fs_file_jump_end_2
??inner_fs_file_jump_end_1:
        LDR.W    R0,??DataTable14_1
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable14_1
        LDRB     R1,[R1, #+4]
        CMP      R0,R1
        BEQ.N    ??inner_fs_file_jump_end_3
        LDR.W    R0,??DataTable14_1
        LDRB     R0,[R0, #+4]
        MOV      R1,#+4096
        MULS     R0,R1,R0
        MOVS     R5,R0
        B.N      ??inner_fs_file_jump_end_0
??inner_fs_file_jump_end_3:
        LDR.W    R0,??DataTable14_1
        LDRH     R0,[R0, #+6]
        ADDS     R0,R0,R5
        ADDS     R0,R0,#+8
        LDR.W    R1,??DataTable14
        ADDS     R1,R1,R4, LSL #+2
        STR      R0,[R1, #+300]
        MOVS     R0,#+0
??inner_fs_file_jump_end_2:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_stat:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R0,R5
        BL       inner_fs_file_is_exist
        MOVS     R1,R0
        CMP      R1,#+0
        BMI.N    ??dl_SPIFFS_stat_0
        MOVS     R0,#+0
        B.N      ??dl_SPIFFS_stat_1
??dl_SPIFFS_stat_0:
        MOVS     R0,#-1
??dl_SPIFFS_stat_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_lseek:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOV      R8,R1
        MOVS     R5,R2
        MOVS     R6,R3
        CMP      R8,#+0
        BPL.N    ??dl_SPIFFS_lseek_0
        CMP      R8,#+8
        BLT.N    ??dl_SPIFFS_lseek_0
        MOV      R0,R8
        B.N      ??dl_SPIFFS_lseek_1
??dl_SPIFFS_lseek_0:
        MOV      R7,R8
        MOVW     R0,#+4088
        SDIV     R0,R5,R0
        ADDS     R0,R0,#+1
        ADDS     R9,R5,R0, LSL #+3
        LDR.W    R0,??DataTable14
        LDR      R0,[R0, #+336]
        MOVS     R1,R0
        LSRS     R1,R1,R7
        LSLS     R0,R1,#+31
        BMI.N    ??dl_SPIFFS_lseek_2
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_lseek_1
??dl_SPIFFS_lseek_2:
        CMP      R6,#+0
        BNE.N    ??dl_SPIFFS_lseek_3
        LDR.W    R0,??DataTable14
        ADDS     R0,R7,R0
        LDRB     R0,[R0, #+260]
        MOV      R1,#+4096
        MLA      R0,R1,R0,R9
        LDR.W    R1,??DataTable14
        ADDS     R1,R1,R7, LSL #+2
        STR      R0,[R1, #+300]
        MOVS     R0,#+0
        B.N      ??dl_SPIFFS_lseek_1
??dl_SPIFFS_lseek_3:
        CMP      R6,#+1
        BNE.N    ??dl_SPIFFS_lseek_4
        LDR.W    R0,??DataTable14
        ADDS     R0,R0,R7, LSL #+2
        LDR      R0,[R0, #+300]
        ADDS     R0,R5,R0
        LDR.W    R1,??DataTable14
        ADDS     R1,R1,R7, LSL #+2
        STR      R0,[R1, #+300]
        LDR.W    R0,??DataTable14
        ADDS     R0,R0,R7, LSL #+2
        LDR      R0,[R0, #+300]
        MOV      R1,#+4096
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+8
        BCS.N    ??dl_SPIFFS_lseek_5
        LDR.W    R0,??DataTable14
        ADDS     R0,R0,R7, LSL #+2
        LDR      R0,[R0, #+300]
        ADDS     R0,R0,#+8
        LDR.W    R1,??DataTable14
        ADDS     R1,R1,R7, LSL #+2
        STR      R0,[R1, #+300]
??dl_SPIFFS_lseek_5:
        MOVS     R0,#+0
        B.N      ??dl_SPIFFS_lseek_1
??dl_SPIFFS_lseek_4:
        CMP      R6,#+2
        BNE.N    ??dl_SPIFFS_lseek_6
        MOVS     R0,R7
        BL       inner_fs_file_jump_end
        B.N      ??dl_SPIFFS_lseek_1
??dl_SPIFFS_lseek_6:
        MOVS     R0,#-1
??dl_SPIFFS_lseek_1:
        POP      {R1,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_open:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        MOVS     R0,R5
        BL       inner_fs_file_is_exist
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??dl_SPIFFS_open_0
        LSLS     R0,R6,#+29
        BPL.N    ??dl_SPIFFS_open_1
        MOVS     R0,R5
        BL       inner_fs_file_ceate
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??dl_SPIFFS_open_2
        MOV      R0,R8
        B.N      ??dl_SPIFFS_open_3
??dl_SPIFFS_open_2:
        MOV      R0,R8
        B.N      ??dl_SPIFFS_open_3
??dl_SPIFFS_open_1:
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_open_3
??dl_SPIFFS_open_0:
        LDR.W    R0,??DataTable14
        LDR      R0,[R0, #+336]
        MOVS     R1,#+1
        LSLS     R1,R1,R8
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable14
        STR      R0,[R1, #+336]
        LSLS     R0,R6,#+31
        BPL.N    ??dl_SPIFFS_open_4
        MOVS     R3,#+2
        MOVS     R2,#+0
        MOV      R1,R8
        MOVS     R0,R4
        BL       dl_SPIFFS_lseek
        CMP      R0,#+0
        BPL.N    ??dl_SPIFFS_open_5
        LDR.W    R0,??DataTable14
        LDR      R0,[R0, #+336]
        MOVS     R1,#+1
        LSLS     R1,R1,R8
        BICS     R0,R0,R1
        LDR.W    R1,??DataTable14
        STR      R0,[R1, #+336]
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_open_3
??dl_SPIFFS_open_4:
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOV      R1,R8
        MOVS     R0,R4
        BL       dl_SPIFFS_lseek
        CMP      R0,#+0
        BPL.N    ??dl_SPIFFS_open_5
        LDR.W    R0,??DataTable14
        LDR      R0,[R0, #+336]
        MOVS     R1,#+1
        LSLS     R1,R1,R8
        BICS     R0,R0,R1
        LDR.W    R1,??DataTable14
        STR      R0,[R1, #+336]
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_open_3
??dl_SPIFFS_open_5:
        MOV      R0,R8
??dl_SPIFFS_open_3:
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_read:
        PUSH     {R3-R11,LR}
        MOVS     R4,R0
        MOV      R11,R1
        MOVS     R5,R2
        MOVS     R6,R3
        MOVS     R9,#+0
        CMP      R11,#+0
        BPL.N    ??dl_SPIFFS_read_0
        CMP      R11,#+8
        BLT.N    ??dl_SPIFFS_read_0
        MOV      R0,R11
        B.N      ??dl_SPIFFS_read_1
??dl_SPIFFS_read_0:
        MOV      R7,R11
        LDR.W    R0,??DataTable14
        ADDS     R0,R0,R7, LSL #+2
        LDR      R0,[R0, #+268]
        CMP      R0,R6
        BCS.N    ??dl_SPIFFS_read_2
        LDR.W    R0,??DataTable14
        ADDS     R0,R0,R7, LSL #+2
        LDR      R0,[R0, #+268]
        MOVS     R6,R0
??dl_SPIFFS_read_2:
        LDR.W    R0,??DataTable14
        ADDS     R0,R0,R7, LSL #+2
        LDR      R0,[R0, #+300]
        MOV      R1,#+4096
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+8
        BCS.N    ??dl_SPIFFS_read_3
        LDR.W    R0,??DataTable14
        ADDS     R0,R0,R7, LSL #+2
        LDR      R0,[R0, #+300]
        ADDS     R0,R0,#+8
        LDR.W    R1,??DataTable14
        ADDS     R1,R1,R7, LSL #+2
        STR      R0,[R1, #+300]
??dl_SPIFFS_read_3:
        LDR.W    R0,??DataTable14
        ADDS     R0,R0,R7, LSL #+2
        LDR      R0,[R0, #+300]
        LSRS     R0,R0,#+12
        MOV      R1,#+4096
        MULS     R0,R1,R0
        STR      R0,[SP, #+0]
        LDR.W    R0,??DataTable14
        ADDS     R0,R0,R7, LSL #+2
        LDR      R0,[R0, #+300]
        MOV      R1,#+4096
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        SUBS     R0,R2,#+8
        MOV      R8,R0
        MOVS     R2,#+8
        LDR.W    R1,??DataTable14_1
        LDR      R0,[SP, #+0]
        BL       SPI_FLASH_Read
        MOVS     R1,#+6
        LDR.W    R0,??DataTable14_2
        BL       inner_make_crc16
        LDR.W    R1,??DataTable14_1
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R1,R0
        BEQ.N    ??dl_SPIFFS_read_4
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_read_1
??dl_SPIFFS_read_4:
        LDR.W    R0,??DataTable14_1
        LDRH     R0,[R0, #+6]
        CMP      R8,R0
        BGE.N    ??dl_SPIFFS_read_5
        LDR.W    R0,??DataTable14_1
        LDRH     R0,[R0, #+6]
        SUBS     R0,R0,R8
        MOV      R10,R0
        SUBS     R0,R6,R9
        CMP      R10,R0
        BGE.N    ??dl_SPIFFS_read_6
        MOV      R2,R10
        MOVS     R1,R5
        LDR.W    R0,??DataTable14
        ADDS     R0,R0,R7, LSL #+2
        LDR      R0,[R0, #+300]
        BL       SPI_FLASH_Read
        LDR.W    R0,??DataTable14
        ADDS     R0,R0,R7, LSL #+2
        LDR      R0,[R0, #+300]
        ADDS     R0,R10,R0
        LDR.W    R1,??DataTable14
        ADDS     R1,R1,R7, LSL #+2
        STR      R0,[R1, #+300]
        ADDS     R9,R10,R9
        LDR.W    R0,??DataTable14_1
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable14_1
        LDRB     R1,[R1, #+4]
        CMP      R0,R1
        BEQ.N    ??dl_SPIFFS_read_7
        LDR.W    R0,??DataTable14_1
        LDRB     R0,[R0, #+4]
        MOV      R1,#+4096
        MULS     R0,R1,R0
        ADDS     R0,R0,#+8
        LDR.W    R1,??DataTable14
        ADDS     R1,R1,R7, LSL #+2
        STR      R0,[R1, #+300]
        B.N      ??dl_SPIFFS_read_2
??dl_SPIFFS_read_7:
        MOV      R0,R9
        B.N      ??dl_SPIFFS_read_1
??dl_SPIFFS_read_6:
        SUBS     R2,R6,R9
        ADDS     R1,R9,R5
        LDR.W    R0,??DataTable14
        ADDS     R0,R0,R7, LSL #+2
        LDR      R0,[R0, #+300]
        BL       SPI_FLASH_Read
        LDR.W    R0,??DataTable14
        ADDS     R0,R0,R7, LSL #+2
        LDR      R0,[R0, #+300]
        SUBS     R1,R6,R9
        ADDS     R0,R1,R0
        LDR.W    R1,??DataTable14
        ADDS     R1,R1,R7, LSL #+2
        STR      R0,[R1, #+300]
        ADDS     R0,R6,R9
        SUBS     R9,R0,R9
        MOV      R0,R9
        B.N      ??dl_SPIFFS_read_1
??dl_SPIFFS_read_5:
        LDR.W    R0,??DataTable14_1
        LDRH     R0,[R0, #+6]
        CMP      R0,R8
        BNE.N    ??dl_SPIFFS_read_8
        MOVS     R0,#+0
        B.N      ??dl_SPIFFS_read_1
??dl_SPIFFS_read_8:
        MOVS     R0,#-1
??dl_SPIFFS_read_1:
        POP      {R1,R4-R11,PC}   ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_write:
        PUSH     {R0,R1,R4-R11,LR}
        SUB      SP,SP,#+28
        MOV      R11,R2
        MOVS     R4,R3
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        LDR      R0,[SP, #+32]
        CMP      R0,#+0
        BPL.N    ??dl_SPIFFS_write_0
        LDR      R0,[SP, #+32]
        CMP      R0,#+8
        BLT.N    ??dl_SPIFFS_write_0
        LDR      R0,[SP, #+32]
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_0:
        LDR      R0,[SP, #+32]
        MOVS     R5,R0
        LDR.W    R0,??DataTable14
        LDRB     R0,[R0, #+332]
        LSLS     R0,R0,#+31
        BPL.N    ??dl_SPIFFS_write_2
        MOVS     R0,#+1
        STR      R0,[SP, #+12]
??dl_SPIFFS_write_2:
        LDR.W    R0,??DataTable14
        ADDS     R0,R0,R5, LSL #+2
        LDR      R0,[R0, #+300]
        LSRS     R0,R0,#+12
        MOV      R1,#+4096
        MULS     R0,R1,R0
        MOVS     R7,R0
        LDR.W    R0,??DataTable14
        ADDS     R0,R0,R5, LSL #+2
        LDR      R0,[R0, #+300]
        MOV      R1,#+4096
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        SUBS     R0,R2,#+8
        MOVS     R6,R0
        MOVS     R2,#+8
        LDR.W    R1,??DataTable14_1
        MOVS     R0,R7
        BL       SPI_FLASH_Read
        MOVS     R1,#+6
        LDR.W    R0,??DataTable14_2
        BL       inner_make_crc16
        LDR.W    R1,??DataTable14_1
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R1,R0
        BEQ.N    ??dl_SPIFFS_write_3
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_3:
        LDR.W    R0,??DataTable14_1
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable14_1
        LDRB     R1,[R1, #+4]
        CMP      R0,R1
        BNE.W    ??dl_SPIFFS_write_4
        MOVW     R0,#+4088
        SUBS     R0,R0,R6
        CMP      R4,R0
        BCS.N    ??dl_SPIFFS_write_5
        MOV      R0,#+4096
        BL       malloc
        MOV      R8,R0
        CMP      R8,#+0
        BNE.N    ??dl_SPIFFS_write_6
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_6:
        LDR.W    R0,??DataTable14_1
        LDRH     R0,[R0, #+6]
        ADDS     R2,R0,#+8
        MOV      R1,R8
        MOVS     R0,R7
        BL       SPI_FLASH_Read
        LDR.W    R0,??DataTable14_1
        LDRH     R0,[R0, #+6]
        ADDS     R1,R4,R6
        CMP      R0,R1
        BGE.N    ??dl_SPIFFS_write_7
        ADDS     R0,R4,R6
        B.N      ??dl_SPIFFS_write_8
??dl_SPIFFS_write_7:
        LDR.W    R0,??DataTable14_1
        LDRH     R0,[R0, #+6]
??dl_SPIFFS_write_8:
        LDR.W    R1,??DataTable14
        ADDS     R1,R1,R5, LSL #+2
        LDR      R1,[R1, #+268]
        LDR.W    R2,??DataTable14_1
        LDRH     R2,[R2, #+6]
        SUBS     R0,R0,R2
        ADDS     R0,R0,R1
        LDR.W    R1,??DataTable14
        ADDS     R1,R1,R5, LSL #+2
        STR      R0,[R1, #+268]
        LDR.W    R0,??DataTable14_1
        LDRH     R0,[R0, #+6]
        ADDS     R1,R4,R6
        CMP      R0,R1
        BGE.N    ??dl_SPIFFS_write_9
        ADDS     R0,R4,R6
        LDR.W    R1,??DataTable14_1
        STRH     R0,[R1, #+6]
        B.N      ??dl_SPIFFS_write_10
??dl_SPIFFS_write_9:
        LDR.W    R0,??DataTable14_1
        LDRH     R0,[R0, #+6]
        LDR.W    R1,??DataTable14_1
        STRH     R0,[R1, #+6]
??dl_SPIFFS_write_10:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable14_1
        STRB     R0,[R1, #+2]
        MOVS     R1,#+6
        LDR.W    R0,??DataTable14_2
        BL       inner_make_crc16
        LDR.W    R1,??DataTable14_1
        STRH     R0,[R1, #+0]
        LDR.W    R0,??DataTable14
        ADDS     R0,R0,R5, LSL #+2
        LDR      R0,[R0, #+300]
        ADDS     R0,R4,R0
        LDR.W    R1,??DataTable14
        ADDS     R1,R1,R5, LSL #+2
        STR      R0,[R1, #+300]
        MOVS     R0,#+8
        STR      R0,[SP, #+0]
        LDR.W    R9,??DataTable14_1
        LDR      R2,[SP, #+0]
        MOV      R1,R9
        MOV      R0,R8
        BL       __aeabi_memcpy
        ADDS     R0,R6,R8
        ADDS     R10,R0,#+8
        MOVS     R2,R4
        MOV      R1,R11
        MOV      R0,R10
        BL       __aeabi_memcpy
        MOVS     R0,R7
        BL       SPI_FLASH_SectorErase
        LDR.W    R0,??DataTable14_1
        LDRH     R0,[R0, #+6]
        ADDS     R2,R0,#+8
        MOV      R1,R8
        MOVS     R0,R7
        BL       SPI_FLASH_Write
        MOV      R0,R8
        BL       free
        MOVS     R0,R4
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_5:
        LDR      R0,[SP, #+12]
        CMP      R0,#+0
        BEQ.N    ??dl_SPIFFS_write_11
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_11:
        BL       inner_fs_get_free_block
        STR      R0,[SP, #+16]
        LDR.W    R0,??DataTable14_1
        LDRB     R0,[R0, #+3]
        MOV      R1,#+4096
        MULS     R0,R1,R0
        MOVS     R7,R0
        MOV      R0,#+4096
        BL       malloc
        MOV      R8,R0
        CMP      R8,#+0
        BNE.N    ??dl_SPIFFS_write_12
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_12:
        LDR.W    R0,??DataTable14_1
        LDRH     R0,[R0, #+6]
        ADDS     R2,R0,#+8
        MOV      R1,R8
        MOVS     R0,R7
        BL       SPI_FLASH_Read
        LDR      R0,[SP, #+16]
        LDR.W    R1,??DataTable14_1
        STRB     R0,[R1, #+4]
        LDR.W    R0,??DataTable14
        ADDS     R0,R0,R5, LSL #+2
        LDR      R0,[R0, #+268]
        ADDW     R0,R0,#+4088
        LDR.W    R1,??DataTable14_1
        LDRH     R1,[R1, #+6]
        SUBS     R0,R0,R1
        LDR.W    R1,??DataTable14
        ADDS     R1,R1,R5, LSL #+2
        STR      R0,[R1, #+268]
        MOVW     R0,#+4088
        LDR.W    R1,??DataTable14_1
        STRH     R0,[R1, #+6]
        MOVS     R1,#+6
        LDR.W    R0,??DataTable14_2
        BL       inner_make_crc16
        LDR.W    R1,??DataTable14_1
        STRH     R0,[R1, #+0]
        MOVS     R0,#+8
        STR      R0,[SP, #+0]
        LDR.W    R9,??DataTable14_1
        LDR      R2,[SP, #+0]
        MOV      R1,R9
        MOV      R0,R8
        BL       __aeabi_memcpy
        MOVW     R0,#+4088
        SUBS     R0,R0,R6
        STR      R0,[SP, #+8]
        ADDS     R0,R6,R8
        ADDS     R10,R0,#+8
        LDR      R2,[SP, #+8]
        MOV      R1,R11
        MOV      R0,R10
        BL       __aeabi_memcpy
        MOVS     R0,R7
        BL       SPI_FLASH_SectorErase
        MOV      R2,#+4096
        MOV      R1,R8
        MOVS     R0,R7
        BL       SPI_FLASH_Write
        MOV      R0,R8
        BL       free
        MOV      R0,#+4096
        BL       malloc
        MOV      R8,R0
        CMP      R8,#+0
        BNE.N    ??dl_SPIFFS_write_13
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_13:
        LDR.W    R0,??DataTable14_1
        LDRB     R0,[R0, #+4]
        MOV      R1,#+4096
        MULS     R0,R1,R0
        MOVS     R7,R0
        LDR.W    R0,??DataTable14_1
        LDRB     R0,[R0, #+4]
        LDR.W    R1,??DataTable14_1
        STRB     R0,[R1, #+3]
        MOVS     R0,R4
        MOVW     R1,#+4088
        SUBS     R0,R0,R1
        ADDS     R0,R6,R0
        LDR.W    R1,??DataTable14_1
        STRH     R0,[R1, #+6]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable14_1
        STRB     R0,[R1, #+2]
        MOVS     R1,#+6
        LDR.W    R0,??DataTable14_2
        BL       inner_make_crc16
        LDR.W    R1,??DataTable14_1
        STRH     R0,[R1, #+0]
        ADDS     R0,R4,R7
        ADDS     R0,R6,R0
        SUBS     R0,R0,#+4080
        LDR.W    R1,??DataTable14
        ADDS     R1,R1,R5, LSL #+2
        STR      R0,[R1, #+300]
        MOVS     R9,#+8
        LDR.W    R10,??DataTable14_1
        MOV      R2,R9
        MOV      R1,R10
        MOV      R0,R8
        BL       __aeabi_memcpy
        SUBW     R0,R4,#+4088
        ADDS     R0,R6,R0
        CMP      R0,#+0
        BEQ.N    ??dl_SPIFFS_write_14
        SUBW     R0,R4,#+4088
        ADDS     R0,R6,R0
        STR      R0,[SP, #+0]
        SUBS     R0,R11,R6
        ADDW     R9,R0,#+4088
        ADDS     R10,R8,#+8
        LDR      R2,[SP, #+0]
        MOV      R1,R9
        MOV      R0,R10
        BL       __aeabi_memcpy
??dl_SPIFFS_write_14:
        MOVS     R0,R7
        BL       SPI_FLASH_SectorErase
        ADDS     R0,R6,R4
        SUBS     R2,R0,#+4080
        MOV      R1,R8
        MOVS     R0,R7
        BL       SPI_FLASH_Write
        MOV      R0,R8
        BL       free
        LDR.W    R0,??DataTable14
        ADDS     R0,R0,R5, LSL #+2
        LDR      R0,[R0, #+268]
        ADDS     R1,R6,R4
        SUBW     R1,R1,#+4088
        ADDS     R0,R1,R0
        LDR.W    R1,??DataTable14
        ADDS     R1,R1,R5, LSL #+2
        STR      R0,[R1, #+268]
        MOVS     R0,R4
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_4:
        MOVW     R0,#+4088
        SUBS     R0,R0,R6
        CMP      R4,R0
        BCS.N    ??dl_SPIFFS_write_15
        MOV      R0,#+4096
        BL       malloc
        MOV      R8,R0
        CMP      R8,#+0
        BNE.N    ??dl_SPIFFS_write_16
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_16:
        MOV      R2,#+4096
        MOV      R1,R8
        MOVS     R0,R7
        BL       SPI_FLASH_Read
        LDR.W    R0,??DataTable14
        ADDS     R0,R0,R5, LSL #+2
        LDR      R0,[R0, #+300]
        ADDS     R0,R4,R0
        LDR.W    R1,??DataTable14
        ADDS     R1,R1,R5, LSL #+2
        STR      R0,[R1, #+300]
        ADDS     R0,R6,R8
        ADDS     R9,R0,#+8
        MOVS     R2,R4
        MOV      R1,R11
        MOV      R0,R9
        BL       __aeabi_memcpy
        MOVS     R0,R7
        BL       SPI_FLASH_SectorErase
        MOV      R2,#+4096
        MOV      R1,R8
        MOVS     R0,R7
        BL       SPI_FLASH_Write
        MOV      R0,R8
        BL       free
        MOVS     R0,R4
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_15:
        LDR.W    R0,??DataTable14_1
        LDRB     R0,[R0, #+3]
        MOV      R1,#+4096
        MULS     R0,R1,R0
        MOVS     R7,R0
        MOV      R0,#+4096
        BL       malloc
        MOV      R8,R0
        CMP      R8,#+0
        BNE.N    ??dl_SPIFFS_write_17
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_17:
        LDR.W    R0,??DataTable14_1
        LDRH     R0,[R0, #+6]
        ADDS     R2,R0,#+8
        MOV      R1,R8
        MOVS     R0,R7
        BL       SPI_FLASH_Read
        MOVW     R0,#+4088
        SUBS     R9,R0,R6
        ADDS     R0,R6,R8
        ADDS     R10,R0,#+8
        MOV      R2,R9
        MOV      R1,R11
        MOV      R0,R10
        BL       __aeabi_memcpy
        MOVS     R0,R7
        BL       SPI_FLASH_SectorErase
        LDR.W    R0,??DataTable14_1
        LDRH     R0,[R0, #+6]
        ADDS     R2,R0,#+8
        MOV      R1,R8
        MOVS     R0,R7
        BL       SPI_FLASH_Write
        MOV      R0,R8
        BL       free
        MOV      R0,#+4096
        BL       malloc
        MOV      R8,R0
        CMP      R8,#+0
        BNE.N    ??dl_SPIFFS_write_18
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_18:
        LDR.W    R0,??DataTable14_1
        LDRB     R0,[R0, #+4]
        MOV      R1,#+4096
        MULS     R0,R1,R0
        MOVS     R7,R0
        MOV      R2,#+4096
        MOV      R1,R8
        MOVS     R0,R7
        BL       SPI_FLASH_Read
        MOVS     R9,#+8
        LDR.W    R10,??DataTable14_1
        MOV      R2,R9
        MOV      R1,R8
        MOV      R0,R10
        BL       __aeabi_memcpy
        MOVS     R1,#+6
        LDR.W    R0,??DataTable14_2
        BL       inner_make_crc16
        LDR.N    R1,??DataTable14_1
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R1,R0
        BEQ.N    ??dl_SPIFFS_write_19
        MOV      R0,R8
        BL       free
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_19:
        LDR.N    R0,??DataTable14_1
        LDRH     R0,[R0, #+6]
        SUBW     R1,R4,#+4088
        ADDS     R1,R6,R1
        CMP      R0,R1
        BCS.N    ??dl_SPIFFS_write_20
        SUBW     R0,R4,#+4088
        ADDS     R0,R6,R0
        STR      R0,[SP, #+4]
        B.N      ??dl_SPIFFS_write_21
??dl_SPIFFS_write_20:
        LDR.N    R0,??DataTable14_1
        LDRH     R0,[R0, #+6]
        STR      R0,[SP, #+4]
??dl_SPIFFS_write_21:
        LDR.N    R0,??DataTable14
        ADDS     R0,R0,R5, LSL #+2
        LDR      R0,[R0, #+268]
        LDR      R1,[SP, #+4]
        LDR.N    R2,??DataTable14_1
        LDRH     R2,[R2, #+6]
        SUBS     R1,R1,R2
        ADDS     R0,R1,R0
        LDR.N    R1,??DataTable14
        ADDS     R1,R1,R5, LSL #+2
        STR      R0,[R1, #+268]
        LDR      R0,[SP, #+4]
        LDR.N    R1,??DataTable14_1
        STRH     R0,[R1, #+6]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable14_1
        STRB     R0,[R1, #+2]
        MOVS     R1,#+6
        LDR.N    R0,??DataTable14_2
        BL       inner_make_crc16
        LDR.N    R1,??DataTable14_1
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable14_1
        LDRH     R0,[R0, #+6]
        ADDS     R0,R0,R7
        ADDS     R0,R0,#+8
        LDR.N    R1,??DataTable14
        ADDS     R1,R1,R5, LSL #+2
        STR      R0,[R1, #+300]
        MOVS     R0,#+8
        STR      R0,[SP, #+0]
        LDR.W    R9,??DataTable14_1
        LDR      R2,[SP, #+0]
        MOV      R1,R9
        MOV      R0,R8
        BL       __aeabi_memcpy
        SUBW     R0,R4,#+4088
        ADDS     R0,R6,R0
        STR      R0,[SP, #+8]
        SUBS     R0,R11,R6
        ADDW     R0,R0,#+4088
        STR      R0,[SP, #+20]
        ADDS     R10,R8,#+8
        LDR      R2,[SP, #+8]
        LDR      R1,[SP, #+20]
        MOV      R0,R10
        BL       __aeabi_memcpy
        MOVS     R0,R7
        BL       SPI_FLASH_SectorErase
        LDR.N    R0,??DataTable14_1
        LDRH     R0,[R0, #+6]
        ADDS     R2,R0,#+8
        MOV      R1,R8
        MOVS     R0,R7
        BL       SPI_FLASH_Write
        MOV      R0,R8
        BL       free
        MOVS     R0,R4
??dl_SPIFFS_write_1:
        ADD      SP,SP,#+36
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_close:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R7,R1
        CMP      R7,#+0
        BPL.N    ??dl_SPIFFS_close_0
        CMP      R7,#+8
        BLT.N    ??dl_SPIFFS_close_0
        MOVS     R0,R7
        B.N      ??dl_SPIFFS_close_1
??dl_SPIFFS_close_0:
        MOVS     R5,R7
        LDR.N    R0,??DataTable14
        LDR      R0,[R0, #+336]
        MOVS     R1,#+1
        LSLS     R1,R1,R5
        BICS     R0,R0,R1
        LDR.N    R1,??DataTable14
        STR      R0,[R1, #+336]
        MOV      R0,#+344
        BL       malloc
        MOVS     R6,R0
        CMP      R6,#+0
        BNE.N    ??dl_SPIFFS_close_2
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_close_1
??dl_SPIFFS_close_2:
        MOV      R2,#+344
        MOVS     R1,R6
        MOVS     R0,#+0
        BL       SPI_FLASH_Read
        MOVS     R2,#+32
        LDR.N    R1,??DataTable14_3
        ADDS     R0,R6,#+268
        BL       memcmp
        CMP      R0,#+0
        BNE.N    ??dl_SPIFFS_close_3
        MOVS     R2,#+8
        LDR.N    R1,??DataTable14_4
        ADDS     R0,R6,#+260
        BL       memcmp
        CMP      R0,#+0
        BNE.N    ??dl_SPIFFS_close_3
        MOV      R2,#+256
        LDR.N    R1,??DataTable13_1
        ADDS     R0,R6,#+4
        BL       memcmp
        CMP      R0,#+0
        BNE.N    ??dl_SPIFFS_close_3
        MOVS     R0,R6
        BL       free
        MOVS     R0,#+0
        B.N      ??dl_SPIFFS_close_1
??dl_SPIFFS_close_3:
        MOVS     R0,R6
        BL       free
        MOV      R1,#+336
        LDR.N    R0,??DataTable13_1
        BL       inner_make_crc16
        LDR.N    R1,??DataTable14
        STRH     R0,[R1, #+0]
        MOVS     R0,#+0
        BL       SPI_FLASH_SectorErase
        MOV      R2,#+344
        LDR.N    R1,??DataTable14
        MOVS     R0,#+0
        BL       SPI_FLASH_Write
        MOVS     R0,#+0
??dl_SPIFFS_close_1:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_fflush:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        CMP      R5,#+0
        BPL.N    ??dl_SPIFFS_fflush_0
        CMP      R5,#+8
        BLT.N    ??dl_SPIFFS_fflush_0
        MOVS     R0,R5
        B.N      ??dl_SPIFFS_fflush_1
??dl_SPIFFS_fflush_0:
        MOVS     R6,R5
        LDR.N    R0,??DataTable14
        LDR      R0,[R0, #+336]
        MOVS     R1,R0
        LSRS     R1,R1,R6
        LSLS     R0,R1,#+31
        BMI.N    ??dl_SPIFFS_fflush_2
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_fflush_1
??dl_SPIFFS_fflush_2:
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,R5
        MOVS     R0,R4
        BL       dl_SPIFFS_lseek
        CMP      R0,#+0
        BPL.N    ??dl_SPIFFS_fflush_3
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_fflush_1
??dl_SPIFFS_fflush_3:
        MOVS     R0,#+0
??dl_SPIFFS_fflush_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     spiffs_cache_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     spiffs_fds

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     spiffs_work_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     0xffffd8d7

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_remove:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        LDR.N    R0,??DataTable14
        LDR      R7,[R0, #+332]
        MOVS     R0,R5
        BL       inner_fs_file_is_exist
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??dl_SPIFFS_remove_0
        MOV      R0,R8
        B.N      ??dl_SPIFFS_remove_1
??dl_SPIFFS_remove_0:
        LDR.N    R0,??DataTable14
        ADDS     R0,R8,R0
        LDRB     R0,[R0, #+260]
        MOV      R1,#+4096
        MULS     R0,R1,R0
        MOVS     R6,R0
        LDR.N    R0,??DataTable14
        LDR      R0,[R0, #+332]
        MOVS     R1,#+1
        LDR.N    R2,??DataTable14
        ADDS     R2,R8,R2
        LDRB     R2,[R2, #+260]
        LSLS     R1,R1,R2
        BICS     R0,R0,R1
        LDR.N    R1,??DataTable14
        STR      R0,[R1, #+332]
??dl_SPIFFS_remove_2:
        MOVS     R2,#+8
        LDR.N    R1,??DataTable14_1
        MOVS     R0,R6
        BL       SPI_FLASH_Read
        MOVS     R1,#+6
        LDR.N    R0,??DataTable14_2
        BL       inner_make_crc16
        LDR.N    R1,??DataTable14_1
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R1,R0
        BEQ.N    ??dl_SPIFFS_remove_3
        LDR.N    R0,??DataTable14
        STR      R7,[R0, #+332]
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_remove_1
??dl_SPIFFS_remove_3:
        LDR.N    R0,??DataTable14
        LDR      R0,[R0, #+332]
        MOVS     R1,#+1
        LDR.N    R2,??DataTable14_1
        LDRB     R2,[R2, #+3]
        LSLS     R1,R1,R2
        BICS     R0,R0,R1
        LDR.N    R1,??DataTable14
        STR      R0,[R1, #+332]
        LDR.N    R0,??DataTable14_1
        LDRB     R0,[R0, #+3]
        LDR.N    R1,??DataTable14_1
        LDRB     R1,[R1, #+4]
        CMP      R0,R1
        BEQ.N    ??dl_SPIFFS_remove_4
        LDR.N    R0,??DataTable14_1
        LDRB     R0,[R0, #+4]
        MOV      R1,#+4096
        MULS     R0,R1,R0
        MOVS     R6,R0
        B.N      ??dl_SPIFFS_remove_2
??dl_SPIFFS_remove_4:
        MOVS     R0,#+0
        LDR.N    R1,??DataTable14
        ADDS     R1,R1,R8, LSL #+5
        STRB     R0,[R1, #+4]
        MOV      R1,R8
        MOVS     R0,R4
        BL       dl_SPIFFS_close
??dl_SPIFFS_remove_1:
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_info:
        PUSH     {R4-R7}
        MOVS     R3,R0
        MOVS     R4,#+0
        LDR.N    R0,??DataTable14
        LDR      R5,[R0, #+332]
        MOVS     R7,#+32
        MOVS     R0,#+1
        MOVS     R6,R0
??dl_SPIFFS_info_0:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R6,R7
        BCS.N    ??dl_SPIFFS_info_1
        MOVS     R0,R5
        LSRS     R0,R0,R6
        LSLS     R0,R0,#+31
        BPL.N    ??dl_SPIFFS_info_2
        ADDS     R4,R4,#+4096
??dl_SPIFFS_info_2:
        ADDS     R6,R6,#+1
        B.N      ??dl_SPIFFS_info_0
??dl_SPIFFS_info_1:
        MOVS     R0,#+131072
        STR      R0,[R1, #+0]
        ADDS     R0,R4,#+4096
        STR      R0,[R2, #+0]
        MOVS     R0,#+0
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     xFs

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     g_fs_header+0x4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_creat:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R3,#+0
        MOVS     R2,#+4
        MOVS     R1,R5
        MOVS     R0,R4
        BL       dl_SPIFFS_open
        MOVS     R7,R0
        CMP      R7,#+0
        BPL.N    ??dl_SPIFFS_creat_0
        MOVS     R0,R7
        B.N      ??dl_SPIFFS_creat_1
??dl_SPIFFS_creat_0:
        MOVS     R1,R7
        MOVS     R0,R4
        BL       dl_SPIFFS_close
        MOVS     R0,#+0
??dl_SPIFFS_creat_1:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_rename:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        LDR.N    R0,??DataTable14
        LDRB     R0,[R0, #+340]
        CMP      R0,#+0
        BEQ.N    ??dl_SPIFFS_rename_0
        MOVS     R0,#+0
        MOVS     R7,R0
??dl_SPIFFS_rename_1:
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        CMP      R7,#+8
        BGE.N    ??dl_SPIFFS_rename_0
        LDR.N    R0,??DataTable14
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADDS     R0,R0,R7, LSL #+5
        ADDS     R1,R0,#+4
        MOVS     R0,R5
        BL       strcmp
        CMP      R0,#+0
        BNE.N    ??dl_SPIFFS_rename_2
        MOVS     R1,R6
        LDR.N    R0,??DataTable14
        UXTB     R7,R7            ;; ZeroExt  R7,R7,#+24,#+24
        ADDS     R0,R0,R7, LSL #+5
        ADDS     R0,R0,#+4
        BL       strcpy
        MOVS     R0,#+0
        B.N      ??dl_SPIFFS_rename_3
??dl_SPIFFS_rename_2:
        ADDS     R7,R7,#+1
        B.N      ??dl_SPIFFS_rename_1
??dl_SPIFFS_rename_0:
        MOVS     R0,#-1
??dl_SPIFFS_rename_3:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     g_fs_header

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_1:
        DC32     g_fs_block

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_2:
        DC32     g_fs_block+0x2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_3:
        DC32     g_fs_header+0x10C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_4:
        DC32     g_fs_header+0x104

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
inner_make_crc16:
        PUSH     {R4-R7,LR}
        MOVS     R2,R0
        MOVW     R0,#+65535
        MOVS     R4,#+0
        MOVS     R7,#+0
        MOVS     R3,R7
??inner_make_crc16_0:
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R3,R1
        BCS.N    ??inner_make_crc16_1
        MOVS     R7,#+0
        MOVS     R4,R7
??inner_make_crc16_2:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+8
        BGE.N    ??inner_make_crc16_3
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        LSRS     R7,R0,#+15
        MOVS     R5,R7
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRB     R7,[R3, R2]
        RSBS     R12,R4,#+7
        MOV      LR,R7
        ASRS     LR,LR,R12
        ANDS     R7,LR,#0x1
        MOVS     R6,R7
        LSLS     R0,R0,#+1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        TEQ      R6,R5
        BEQ.N    ??inner_make_crc16_4
        EOR      R0,R0,#0x1000
        EORS     R0,R0,#0x21
??inner_make_crc16_4:
        ADDS     R4,R4,#+1
        B.N      ??inner_make_crc16_2
??inner_make_crc16_3:
        ADDS     R3,R3,#+1
        B.N      ??inner_make_crc16_0
??inner_make_crc16_1:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R4-R7,PC}       ;; return

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
// 1 488 bytes in section .bss
// 3 822 bytes in section .text
// 
// 3 822 bytes of CODE memory
// 1 488 bytes of DATA memory
//
//Errors: none
//Warnings: none
