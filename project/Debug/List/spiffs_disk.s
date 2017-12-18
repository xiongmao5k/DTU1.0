///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       18/Dec/2017  10:50:23
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\gprsdtu\dev\ -Ol --vla
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
        PUSH     {R4,LR}
        SUB      SP,SP,#+32
        MOVS     R0,#+0
        MOVS     R1,#+16
        MOVS     R2,#+0
        ADD      R4,SP,#+16
        MOVS     R0,R4
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
        LDR.W    R0,??DataTable14
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        LDR.W    R3,??DataTable14_1
        LDR.W    R2,??DataTable14_2
        ADD      R1,SP,#+16
        LDR.W    R0,??DataTable14_3
        BL       SPIFFS_mount
        LDR.W    R1,??DataTable14_4  ;; 0xffffd8d7
        CMP      R0,R1
        BNE.N    ??SPIFFS_DiskInit_0
        BL       SPI_FLASH_ChipErase
        LDR.W    R0,??DataTable14_3
        BL       SPIFFS_format
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOV      R0,#+640
        STR      R0,[SP, #+8]
        LDR.W    R0,??DataTable14
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        LDR.W    R3,??DataTable14_1
        LDR.W    R2,??DataTable14_2
        ADD      R1,SP,#+16
        LDR.W    R0,??DataTable14_3
        BL       SPIFFS_mount
??SPIFFS_DiskInit_0:
        ADD      SP,SP,#+32
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
prvSPIFFS_Read:
        PUSH     {R7,LR}
        MOVS     R3,R2
        MOVS     R2,R1
        MOVS     R1,R3
        BL       SPI_FLASH_Read
        MOVS     R0,#+0
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
prvSPIFFS_Write:
        PUSH     {R7,LR}
        MOVS     R3,R2
        MOVS     R2,R1
        MOVS     R1,R3
        BL       SPI_FLASH_Write
        MOVS     R0,#+0
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        THUMB
prvSPIFFS_Erase:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        LSRS     R5,R1,#+12
        B.N      ??prvSPIFFS_Erase_0
??prvSPIFFS_Erase_1:
        MOVS     R0,R4
        BL       SPI_FLASH_SectorErase
        ADDS     R4,R4,#+4096
??prvSPIFFS_Erase_0:
        MOVS     R0,R5
        SUBS     R5,R0,#+1
        CMP      R0,#+0
        BNE.N    ??prvSPIFFS_Erase_1
        MOVS     R0,#+0
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_fs_header:
        DS8 344

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
g_fs_block:
        DS8 8

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_fs_init:
        PUSH     {R4,LR}
        MOV      R2,#+344
        LDR.W    R1,??DataTable14_5
        MOVS     R0,#+0
        BL       SPI_FLASH_Read
        MOV      R1,#+336
        LDR.W    R0,??DataTable14_6
        BL       inner_make_crc16
        LDR.W    R1,??DataTable14_5
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,R1
        BNE.N    ??dl_fs_init_0
        MOVS     R0,#+1
        LDR.W    R1,??DataTable14_5
        STRB     R0,[R1, #+340]
        MOVS     R0,#+0
        B.N      ??dl_fs_init_1
??dl_fs_init_0:
        MOVS     R0,#+0
        LDR.W    R1,??DataTable14_5
        STRB     R0,[R1, #+340]
        MOV      R1,#+344
        MOVS     R2,#+0
        LDR.W    R4,??DataTable14_5
        MOVS     R0,R4
        BL       __aeabi_memset
        MOVS     R0,#+1
        LDR.W    R1,??DataTable14_5
        STRB     R0,[R1, #+340]
        MOVS     R0,#+0
??dl_fs_init_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
inner_fs_file_is_exist:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        LDR.W    R0,??DataTable14_5
        LDRB     R0,[R0, #+340]
        CMP      R0,#+0
        BEQ.N    ??inner_fs_file_is_exist_0
        MOVS     R5,#+0
        B.N      ??inner_fs_file_is_exist_1
??inner_fs_file_is_exist_2:
        ADDS     R5,R5,#+1
??inner_fs_file_is_exist_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BGE.N    ??inner_fs_file_is_exist_0
        LDR.W    R0,??DataTable14_5
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
??inner_fs_file_is_exist_0:
        MOVS     R0,#-1
??inner_fs_file_is_exist_3:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
inner_fs_get_free_block:
        MOVS     R1,#+32
        LDR.W    R0,??DataTable14_5
        LDR      R2,[R0, #+332]
        MOVS     R0,#+1
        B.N      ??inner_fs_get_free_block_0
??inner_fs_get_free_block_1:
        ADDS     R0,R0,#+1
??inner_fs_get_free_block_0:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R0,R1
        BCS.N    ??inner_fs_get_free_block_2
        MOVS     R3,R2
        LSRS     R3,R3,R0
        LSLS     R3,R3,#+31
        BMI.N    ??inner_fs_get_free_block_1
        LDR.W    R1,??DataTable14_5
        LDR      R1,[R1, #+332]
        MOVS     R2,#+1
        LSLS     R2,R2,R0
        ORRS     R1,R2,R1
        LDR.W    R2,??DataTable14_5
        STR      R1,[R2, #+332]
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        B.N      ??inner_fs_get_free_block_3
??inner_fs_get_free_block_2:
        MOVS     R0,#-1
??inner_fs_get_free_block_3:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
inner_fs_file_ceate:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        LDR.W    R0,??DataTable14_5
        LDRB     R0,[R0, #+340]
        CMP      R0,#+0
        BEQ.W    ??inner_fs_file_ceate_0
        MOVS     R5,#+0
        B.N      ??inner_fs_file_ceate_1
??inner_fs_file_ceate_2:
        ADDS     R5,R5,#+1
??inner_fs_file_ceate_1:
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R5,#+8
        BGE.N    ??inner_fs_file_ceate_0
        LDR.W    R0,??DataTable14_5
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+5
        LDRB     R0,[R0, #+4]
        CMP      R0,#+0
        BNE.N    ??inner_fs_file_ceate_2
        BL       inner_fs_get_free_block
        CMP      R0,#+0
        BPL.N    ??inner_fs_file_ceate_3
        MOVS     R0,#-1
        B.N      ??inner_fs_file_ceate_4
??inner_fs_file_ceate_3:
        LDR.W    R1,??DataTable14_5
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R5,R1
        STRB     R0,[R1, #+260]
        MOVS     R1,R4
        LDR.W    R0,??DataTable14_5
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+5
        ADDS     R0,R0,#+4
        BL       strcpy
        LDR.W    R0,??DataTable14_5
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+260]
        MOV      R1,#+4096
        MULS     R0,R1,R0
        ADDS     R0,R0,#+8
        LDR.W    R1,??DataTable14_5
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R1,R5, LSL #+2
        STR      R0,[R1, #+300]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable14_5
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R1,R1,R5, LSL #+2
        STR      R0,[R1, #+268]
        LDR.W    R0,??DataTable14_5
        LDR      R0,[R0, #+336]
        MOVS     R1,#+1
        LSLS     R1,R1,R5
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable14_5
        STR      R0,[R1, #+336]
        LDR.W    R0,??DataTable14_5
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R5,R0
        LDRB     R0,[R0, #+260]
        LDR.W    R1,??DataTable14_7
        STRB     R0,[R1, #+3]
        LDR.W    R0,??DataTable14_7
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable14_7
        STRB     R0,[R1, #+4]
        MOVS     R0,#+0
        LDR.W    R1,??DataTable14_7
        STRH     R0,[R1, #+6]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable14_7
        STRB     R0,[R1, #+2]
        MOVS     R1,#+6
        LDR.W    R0,??DataTable14_8
        BL       inner_make_crc16
        LDR.W    R1,??DataTable14_7
        STRH     R0,[R1, #+0]
        LDR.W    R0,??DataTable14_5
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+2
        LDR      R0,[R0, #+300]
        SUBS     R0,R0,#+8
        BL       SPI_FLASH_SectorErase
        MOVS     R2,#+8
        LDR.W    R1,??DataTable14_7
        LDR.W    R0,??DataTable14_5
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        ADDS     R0,R0,R5, LSL #+2
        LDR      R0,[R0, #+300]
        SUBS     R0,R0,#+8
        BL       SPI_FLASH_Write
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        MOVS     R0,R5
        B.N      ??inner_fs_file_ceate_4
??inner_fs_file_ceate_0:
        MOVS     R0,#-1
??inner_fs_file_ceate_4:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
inner_fs_file_jump_end:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        LDR.W    R0,??DataTable14_5
        ADDS     R0,R4,R0
        LDRB     R0,[R0, #+260]
        MOV      R1,#+4096
        MUL      R5,R1,R0
        B.N      ??inner_fs_file_jump_end_0
??inner_fs_file_jump_end_1:
        LDR.W    R0,??DataTable14_7
        LDRB     R0,[R0, #+4]
        MOV      R1,#+4096
        MUL      R5,R1,R0
??inner_fs_file_jump_end_0:
        MOVS     R2,#+8
        LDR.W    R1,??DataTable14_7
        MOVS     R0,R5
        BL       SPI_FLASH_Read
        MOVS     R1,#+6
        LDR.W    R0,??DataTable14_8
        BL       inner_make_crc16
        LDR.W    R1,??DataTable14_7
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R1,R0
        BEQ.N    ??inner_fs_file_jump_end_2
        MOVS     R0,#-1
        B.N      ??inner_fs_file_jump_end_3
??inner_fs_file_jump_end_2:
        LDR.W    R0,??DataTable14_7
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable14_7
        LDRB     R1,[R1, #+4]
        CMP      R0,R1
        BNE.N    ??inner_fs_file_jump_end_1
        LDR.W    R0,??DataTable14_7
        LDRH     R0,[R0, #+6]
        ADDS     R0,R0,R5
        ADDS     R0,R0,#+8
        LDR.W    R1,??DataTable14_5
        ADDS     R1,R1,R4, LSL #+2
        STR      R0,[R1, #+300]
        MOVS     R0,#+0
??inner_fs_file_jump_end_3:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_stat:
        PUSH     {R7,LR}
        MOVS     R0,R1
        BL       inner_fs_file_is_exist
        CMP      R0,#+0
        BMI.N    ??dl_SPIFFS_stat_0
        MOVS     R0,#+0
        B.N      ??dl_SPIFFS_stat_1
??dl_SPIFFS_stat_0:
        MOVS     R0,#-1
??dl_SPIFFS_stat_1:
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_lseek:
        PUSH     {R4,LR}
        MOVS     R0,R1
        CMP      R0,#+0
        BPL.N    ??dl_SPIFFS_lseek_0
        CMP      R0,#+8
        BGE.N    ??dl_SPIFFS_lseek_1
??dl_SPIFFS_lseek_0:
        LDR.W    R1,??DataTable14_5
        LDR      R1,[R1, #+336]
        MOVS     R4,R1
        LSRS     R4,R4,R0
        LSLS     R1,R4,#+31
        BMI.N    ??dl_SPIFFS_lseek_2
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_lseek_1
??dl_SPIFFS_lseek_2:
        CMP      R3,#+0
        BNE.N    ??dl_SPIFFS_lseek_3
        LDR.W    R1,??DataTable14_5
        ADDS     R1,R0,R1
        LDRB     R1,[R1, #+260]
        MOV      R3,#+4096
        MLA      R1,R3,R1,R2
        ADDS     R1,R1,#+8
        LDR.W    R2,??DataTable14_5
        ADDS     R0,R2,R0, LSL #+2
        STR      R1,[R0, #+300]
        MOVS     R0,#+0
        B.N      ??dl_SPIFFS_lseek_1
??dl_SPIFFS_lseek_3:
        CMP      R3,#+1
        BNE.N    ??dl_SPIFFS_lseek_4
        LDR.W    R1,??DataTable14_5
        ADDS     R1,R1,R0, LSL #+2
        LDR      R1,[R1, #+300]
        ADDS     R1,R2,R1
        LDR.W    R2,??DataTable14_5
        ADDS     R0,R2,R0, LSL #+2
        STR      R1,[R0, #+300]
        MOVS     R0,#+0
        B.N      ??dl_SPIFFS_lseek_1
??dl_SPIFFS_lseek_4:
        CMP      R3,#+2
        BNE.N    ??dl_SPIFFS_lseek_5
        BL       inner_fs_file_jump_end
        B.N      ??dl_SPIFFS_lseek_1
??dl_SPIFFS_lseek_5:
        MOVS     R0,#-1
??dl_SPIFFS_lseek_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_open:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R5,R2
        MOVS     R0,R7
        BL       inner_fs_file_is_exist
        MOVS     R6,R0
        CMP      R6,#+0
        BPL.N    ??dl_SPIFFS_open_0
        LSLS     R0,R5,#+29
        BPL.N    ??dl_SPIFFS_open_1
        MOVS     R0,R7
        BL       inner_fs_file_ceate
        MOVS     R6,R0
        CMP      R6,#+0
        BPL.N    ??dl_SPIFFS_open_2
        MOVS     R0,R6
        B.N      ??dl_SPIFFS_open_3
??dl_SPIFFS_open_2:
        MOVS     R0,R6
        B.N      ??dl_SPIFFS_open_3
??dl_SPIFFS_open_1:
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_open_3
??dl_SPIFFS_open_0:
        LDR.W    R0,??DataTable14_5
        LDR      R0,[R0, #+336]
        MOVS     R1,#+1
        LSLS     R1,R1,R6
        ORRS     R0,R1,R0
        LDR.W    R1,??DataTable14_5
        STR      R0,[R1, #+336]
        LSLS     R0,R5,#+31
        BPL.N    ??dl_SPIFFS_open_4
        MOVS     R3,#+2
        MOVS     R2,#+0
        MOVS     R1,R6
        MOVS     R0,R4
        BL       dl_SPIFFS_lseek
        CMP      R0,#+0
        BPL.N    ??dl_SPIFFS_open_5
        LDR.W    R0,??DataTable14_5
        LDR      R0,[R0, #+336]
        MOVS     R1,#+1
        LSLS     R1,R1,R6
        BICS     R0,R0,R1
        LDR.W    R1,??DataTable14_5
        STR      R0,[R1, #+336]
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_open_3
??dl_SPIFFS_open_4:
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,R6
        MOVS     R0,R4
        BL       dl_SPIFFS_lseek
        CMP      R0,#+0
        BPL.N    ??dl_SPIFFS_open_5
        LDR.W    R0,??DataTable14_5
        LDR      R0,[R0, #+336]
        MOVS     R1,#+1
        LSLS     R1,R1,R6
        BICS     R0,R0,R1
        LDR.W    R1,??DataTable14_5
        STR      R0,[R1, #+336]
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_open_3
??dl_SPIFFS_open_5:
        MOVS     R0,R6
??dl_SPIFFS_open_3:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_read:
        PUSH     {R4-R8,LR}
        MOVS     R7,R1
        MOVS     R4,R2
        MOVS     R5,R3
        MOVS     R6,#+0
        CMP      R7,#+0
        BPL.N    ??dl_SPIFFS_read_0
        CMP      R7,#+8
        BLT.N    ??dl_SPIFFS_read_0
        MOVS     R0,R7
        B.N      ??dl_SPIFFS_read_1
??dl_SPIFFS_read_0:
        LDR.W    R0,??DataTable14_5
        ADDS     R0,R0,R7, LSL #+2
        LDR      R0,[R0, #+268]
        CMP      R0,R5
        BCS.N    ??dl_SPIFFS_read_2
        LDR.W    R0,??DataTable14_5
        ADDS     R0,R0,R7, LSL #+2
        LDR      R5,[R0, #+268]
        B.N      ??dl_SPIFFS_read_2
??dl_SPIFFS_read_3:
        LDR.W    R0,??DataTable14_7
        LDRB     R0,[R0, #+4]
        MOV      R1,#+4096
        MULS     R0,R1,R0
        ADDS     R0,R0,#+8
        LDR.W    R1,??DataTable14_5
        ADDS     R1,R1,R7, LSL #+2
        STR      R0,[R1, #+300]
??dl_SPIFFS_read_2:
        LDR.W    R0,??DataTable14_5
        ADDS     R0,R0,R7, LSL #+2
        LDR      R0,[R0, #+300]
        LSRS     R0,R0,#+12
        MOV      R1,#+4096
        MULS     R0,R1,R0
        LDR.W    R1,??DataTable14_5
        ADDS     R1,R1,R7, LSL #+2
        LDR      R1,[R1, #+300]
        MOV      R2,#+4096
        UDIV     R3,R1,R2
        MLS      R3,R3,R2,R1
        SUBS     R8,R3,#+8
        MOVS     R2,#+8
        LDR.W    R1,??DataTable14_7
        BL       SPI_FLASH_Read
        MOVS     R1,#+6
        LDR.W    R0,??DataTable14_8
        BL       inner_make_crc16
        LDR.W    R1,??DataTable14_7
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R1,R0
        BEQ.N    ??dl_SPIFFS_read_4
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_read_1
??dl_SPIFFS_read_4:
        LDR.W    R0,??DataTable14_7
        LDRH     R0,[R0, #+6]
        CMP      R8,R0
        BGE.N    ??dl_SPIFFS_read_5
        LDR.W    R0,??DataTable14_7
        LDRH     R0,[R0, #+6]
        SUBS     R8,R0,R8
        SUBS     R0,R5,R6
        CMP      R8,R0
        BGE.N    ??dl_SPIFFS_read_6
        MOV      R2,R8
        MOVS     R1,R4
        LDR.W    R0,??DataTable14_5
        ADDS     R0,R0,R7, LSL #+2
        LDR      R0,[R0, #+300]
        BL       SPI_FLASH_Read
        LDR.W    R0,??DataTable14_5
        ADDS     R0,R0,R7, LSL #+2
        LDR      R0,[R0, #+300]
        ADDS     R0,R8,R0
        LDR.W    R1,??DataTable14_5
        ADDS     R1,R1,R7, LSL #+2
        STR      R0,[R1, #+300]
        ADDS     R6,R8,R6
        LDR.W    R0,??DataTable14_7
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable14_7
        LDRB     R1,[R1, #+4]
        CMP      R0,R1
        BNE.N    ??dl_SPIFFS_read_3
        MOVS     R0,R6
        B.N      ??dl_SPIFFS_read_1
??dl_SPIFFS_read_6:
        SUBS     R2,R5,R6
        ADDS     R1,R6,R4
        LDR.W    R0,??DataTable14_5
        ADDS     R0,R0,R7, LSL #+2
        LDR      R0,[R0, #+300]
        BL       SPI_FLASH_Read
        LDR.W    R0,??DataTable14_5
        ADDS     R0,R0,R7, LSL #+2
        LDR      R0,[R0, #+300]
        SUBS     R1,R5,R6
        ADDS     R0,R1,R0
        LDR.W    R1,??DataTable14_5
        ADDS     R1,R1,R7, LSL #+2
        STR      R0,[R1, #+300]
        ADDS     R0,R5,R6
        SUBS     R6,R0,R6
        MOVS     R0,R6
        B.N      ??dl_SPIFFS_read_1
??dl_SPIFFS_read_5:
        LDR.W    R0,??DataTable14_7
        LDRH     R0,[R0, #+6]
        CMP      R0,R8
        BNE.N    ??dl_SPIFFS_read_7
        MOVS     R0,#+0
        B.N      ??dl_SPIFFS_read_1
??dl_SPIFFS_read_7:
        MOVS     R0,#-1
??dl_SPIFFS_read_1:
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_write:
        PUSH     {R4-R10,LR}
        MOVS     R4,R2
        MOVS     R6,R3
        MOVS     R9,#+0
        CMP      R1,#+0
        BPL.N    ??dl_SPIFFS_write_0
        CMP      R1,#+8
        BLT.N    ??dl_SPIFFS_write_0
        MOVS     R0,R1
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_0:
        MOVS     R5,R1
        LDR.W    R0,??DataTable14_5
        LDRB     R0,[R0, #+332]
        LSLS     R0,R0,#+31
        BPL.N    ??dl_SPIFFS_write_2
        MOVS     R9,#+1
??dl_SPIFFS_write_2:
        LDR.W    R0,??DataTable14_5
        ADDS     R0,R0,R5, LSL #+2
        LDR      R0,[R0, #+300]
        LSRS     R0,R0,#+12
        MOV      R1,#+4096
        MUL      R8,R1,R0
        LDR.W    R0,??DataTable14_5
        ADDS     R0,R0,R5, LSL #+2
        LDR      R0,[R0, #+300]
        MOV      R1,#+4096
        UDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        SUBS     R7,R2,#+8
        MOVS     R2,#+8
        LDR.W    R1,??DataTable14_7
        MOV      R0,R8
        BL       SPI_FLASH_Read
        MOVS     R1,#+6
        LDR.W    R0,??DataTable14_8
        BL       inner_make_crc16
        LDR.W    R1,??DataTable14_7
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R1,R0
        BEQ.N    ??dl_SPIFFS_write_3
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_3:
        LDR.W    R0,??DataTable14_7
        LDRB     R0,[R0, #+3]
        LDR.W    R1,??DataTable14_7
        LDRB     R1,[R1, #+4]
        CMP      R0,R1
        BNE.W    ??dl_SPIFFS_write_4
        MOVW     R0,#+4088
        SUBS     R0,R0,R7
        CMP      R0,R6
        BCC.N    ??dl_SPIFFS_write_5
        MOV      R0,#+4096
        BL       malloc
        MOV      R9,R0
        CMP      R9,#+0
        BNE.N    ??dl_SPIFFS_write_6
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_6:
        ADDS     R2,R7,#+8
        MOV      R1,R9
        MOV      R0,R8
        BL       SPI_FLASH_Read
        LDR.W    R0,??DataTable14_7
        LDRH     R0,[R0, #+6]
        ADDS     R1,R6,R7
        CMP      R0,R1
        BGE.N    ??dl_SPIFFS_write_7
        ADDS     R0,R6,R7
        B.N      ??dl_SPIFFS_write_8
??dl_SPIFFS_write_7:
        LDR.W    R0,??DataTable14_7
        LDRH     R0,[R0, #+6]
??dl_SPIFFS_write_8:
        LDR.W    R1,??DataTable14_5
        ADDS     R1,R1,R5, LSL #+2
        LDR      R1,[R1, #+268]
        LDR.W    R2,??DataTable14_7
        LDRH     R2,[R2, #+6]
        SUBS     R0,R0,R2
        ADDS     R0,R0,R1
        LDR.W    R1,??DataTable14_5
        ADDS     R1,R1,R5, LSL #+2
        STR      R0,[R1, #+268]
        LDR.W    R0,??DataTable14_7
        LDRH     R0,[R0, #+6]
        ADDS     R1,R6,R7
        CMP      R0,R1
        BGE.N    ??dl_SPIFFS_write_9
        ADDS     R0,R6,R7
        LDR.W    R1,??DataTable14_7
        STRH     R0,[R1, #+6]
        B.N      ??dl_SPIFFS_write_10
??dl_SPIFFS_write_9:
        LDR.W    R0,??DataTable14_7
        LDRH     R0,[R0, #+6]
        LDR.W    R1,??DataTable14_7
        STRH     R0,[R1, #+6]
??dl_SPIFFS_write_10:
        MOVS     R0,#+1
        LDR.W    R1,??DataTable14_7
        STRB     R0,[R1, #+2]
        MOVS     R1,#+6
        LDR.W    R0,??DataTable14_8
        BL       inner_make_crc16
        LDR.W    R1,??DataTable14_7
        STRH     R0,[R1, #+0]
        LDR.W    R0,??DataTable14_5
        ADDS     R0,R0,R5, LSL #+2
        LDR      R0,[R0, #+300]
        ADDS     R0,R6,R0
        LDR.W    R1,??DataTable14_5
        ADDS     R1,R1,R5, LSL #+2
        STR      R0,[R1, #+300]
        MOVS     R2,#+8
        LDR.W    R1,??DataTable14_7
        MOV      R0,R9
        BL       __aeabi_memcpy
        MOVS     R2,R6
        MOVS     R1,R4
        ADDS     R0,R7,R9
        ADDS     R4,R0,#+8
        MOVS     R0,R4
        BL       __aeabi_memcpy
        MOV      R0,R8
        BL       SPI_FLASH_SectorErase
        ADDS     R0,R6,R7
        ADDS     R2,R0,#+8
        MOV      R1,R9
        MOV      R0,R8
        BL       SPI_FLASH_Write
        MOV      R0,R9
        BL       free
        MOVS     R0,R6
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_5:
        CMP      R9,#+0
        BEQ.N    ??dl_SPIFFS_write_11
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_11:
        BL       inner_fs_get_free_block
        MOV      R10,R0
        LDR.W    R0,??DataTable14_7
        LDRB     R0,[R0, #+3]
        MOV      R1,#+4096
        MUL      R8,R1,R0
        MOV      R0,#+4096
        BL       malloc
        MOV      R9,R0
        CMP      R9,#+0
        BNE.N    ??dl_SPIFFS_write_12
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_12:
        LDR.W    R0,??DataTable14_7
        LDRH     R0,[R0, #+6]
        ADDS     R2,R0,#+8
        MOV      R1,R9
        MOV      R0,R8
        BL       SPI_FLASH_Read
        LDR.W    R0,??DataTable14_7
        STRB     R10,[R0, #+4]
        LDR.W    R0,??DataTable14_5
        ADDS     R0,R0,R5, LSL #+2
        LDR      R0,[R0, #+268]
        ADDW     R0,R0,#+4088
        LDR.W    R1,??DataTable14_7
        LDRH     R1,[R1, #+6]
        SUBS     R0,R0,R1
        LDR.W    R1,??DataTable14_5
        ADDS     R1,R1,R5, LSL #+2
        STR      R0,[R1, #+268]
        MOVW     R0,#+4088
        LDR.W    R1,??DataTable14_7
        STRH     R0,[R1, #+6]
        MOVS     R1,#+6
        LDR.W    R0,??DataTable14_8
        BL       inner_make_crc16
        LDR.W    R1,??DataTable14_7
        STRH     R0,[R1, #+0]
        MOVS     R2,#+8
        LDR.W    R1,??DataTable14_7
        MOV      R0,R9
        BL       __aeabi_memcpy
        MOVW     R0,#+4088
        SUBS     R2,R0,R7
        MOVS     R1,R4
        ADDS     R0,R7,R9
        ADDS     R10,R0,#+8
        MOV      R0,R10
        BL       __aeabi_memcpy
        MOV      R0,R8
        BL       SPI_FLASH_SectorErase
        LDR.W    R0,??DataTable14_7
        LDRH     R0,[R0, #+6]
        ADDS     R2,R0,#+8
        MOV      R1,R9
        MOV      R0,R8
        BL       SPI_FLASH_Write
        MOV      R0,R9
        BL       free
        MOV      R0,#+4096
        BL       malloc
        MOV      R9,R0
        CMP      R9,#+0
        BNE.N    ??dl_SPIFFS_write_13
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_13:
        LDR.W    R0,??DataTable14_7
        LDRB     R0,[R0, #+4]
        MOV      R1,#+4096
        MUL      R8,R1,R0
        LDR.W    R0,??DataTable14_7
        LDRB     R0,[R0, #+4]
        LDR.W    R1,??DataTable14_7
        STRB     R0,[R1, #+3]
        MOVS     R0,R6
        MOVW     R1,#+4088
        SUBS     R0,R0,R1
        ADDS     R0,R7,R0
        LDR.W    R1,??DataTable14_7
        STRH     R0,[R1, #+6]
        MOVS     R0,#+1
        LDR.W    R1,??DataTable14_7
        STRB     R0,[R1, #+2]
        MOVS     R1,#+6
        LDR.W    R0,??DataTable14_8
        BL       inner_make_crc16
        LDR.W    R1,??DataTable14_7
        STRH     R0,[R1, #+0]
        ADDS     R0,R6,R8
        ADDS     R0,R0,#+8
        LDR.W    R1,??DataTable14_5
        ADDS     R1,R1,R5, LSL #+2
        STR      R0,[R1, #+300]
        MOVS     R2,#+8
        LDR.W    R1,??DataTable14_7
        MOV      R0,R9
        BL       __aeabi_memcpy
        SUBW     R0,R6,#+4088
        ADDS     R2,R7,R0
        SUBS     R0,R4,R7
        ADDW     R1,R0,#+4088
        ADDS     R4,R9,#+8
        MOVS     R0,R4
        BL       __aeabi_memcpy
        MOV      R0,R8
        BL       SPI_FLASH_SectorErase
        ADDS     R0,R7,R6
        SUBS     R2,R0,#+4080
        MOV      R1,R9
        MOV      R0,R8
        BL       SPI_FLASH_Write
        MOV      R0,R9
        BL       free
        LDR.W    R0,??DataTable14_5
        ADDS     R0,R0,R5, LSL #+2
        LDR      R0,[R0, #+268]
        ADDS     R1,R7,R6
        SUBW     R1,R1,#+4088
        ADDS     R0,R1,R0
        LDR.W    R1,??DataTable14_5
        ADDS     R1,R1,R5, LSL #+2
        STR      R0,[R1, #+268]
        MOVS     R0,R6
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_4:
        MOVW     R0,#+4088
        SUBS     R0,R0,R7
        CMP      R0,R6
        BCC.N    ??dl_SPIFFS_write_14
        MOV      R0,#+4096
        BL       malloc
        MOV      R9,R0
        CMP      R9,#+0
        BNE.N    ??dl_SPIFFS_write_15
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_15:
        LDR.W    R0,??DataTable14_7
        LDRH     R0,[R0, #+6]
        ADDS     R2,R0,#+8
        MOV      R1,R9
        MOV      R0,R8
        BL       SPI_FLASH_Read
        LDR.W    R0,??DataTable14_5
        ADDS     R0,R0,R5, LSL #+2
        LDR      R0,[R0, #+300]
        ADDS     R0,R6,R0
        LDR.W    R1,??DataTable14_5
        ADDS     R1,R1,R5, LSL #+2
        STR      R0,[R1, #+300]
        MOVS     R2,R6
        MOVS     R1,R4
        ADDS     R0,R7,R9
        ADDS     R4,R0,#+8
        MOVS     R0,R4
        BL       __aeabi_memcpy
        MOV      R0,R8
        BL       SPI_FLASH_SectorErase
        LDR.W    R0,??DataTable14_7
        LDRH     R0,[R0, #+6]
        ADDS     R2,R0,#+8
        MOV      R1,R9
        MOV      R0,R8
        BL       SPI_FLASH_Write
        MOV      R0,R9
        BL       free
        MOVS     R0,R6
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_14:
        LDR.W    R0,??DataTable14_7
        LDRB     R0,[R0, #+3]
        MOV      R1,#+4096
        MUL      R8,R1,R0
        MOV      R0,#+4096
        BL       malloc
        MOV      R9,R0
        CMP      R9,#+0
        BNE.N    ??dl_SPIFFS_write_16
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_16:
        LDR.W    R0,??DataTable14_7
        LDRH     R0,[R0, #+6]
        ADDS     R2,R0,#+8
        MOV      R1,R9
        MOV      R0,R8
        BL       SPI_FLASH_Read
        MOVW     R0,#+4088
        SUBS     R2,R0,R7
        MOVS     R1,R4
        ADDS     R0,R7,R9
        ADDS     R10,R0,#+8
        MOV      R0,R10
        BL       __aeabi_memcpy
        MOV      R0,R8
        BL       SPI_FLASH_SectorErase
        LDR.W    R0,??DataTable14_7
        LDRH     R0,[R0, #+6]
        ADDS     R2,R0,#+8
        MOV      R1,R9
        MOV      R0,R8
        BL       SPI_FLASH_Write
        MOV      R0,R9
        BL       free
        MOV      R0,#+4096
        BL       malloc
        MOV      R9,R0
        CMP      R9,#+0
        BNE.N    ??dl_SPIFFS_write_17
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_17:
        LDR.N    R0,??DataTable14_7
        LDRB     R0,[R0, #+4]
        MOV      R1,#+4096
        MUL      R8,R1,R0
        MOV      R2,#+4096
        MOV      R1,R9
        MOV      R0,R8
        BL       SPI_FLASH_Read
        MOVS     R2,#+8
        MOV      R1,R9
        LDR.W    R10,??DataTable14_7
        MOV      R0,R10
        BL       __aeabi_memcpy
        MOVS     R1,#+6
        LDR.N    R0,??DataTable14_8
        BL       inner_make_crc16
        LDR.N    R1,??DataTable14_7
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R1,R0
        BEQ.N    ??dl_SPIFFS_write_18
        MOV      R0,R9
        BL       free
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_write_1
??dl_SPIFFS_write_18:
        LDR.N    R0,??DataTable14_7
        LDRH     R0,[R0, #+6]
        SUBW     R1,R6,#+4088
        ADDS     R1,R7,R1
        CMP      R0,R1
        BCS.N    ??dl_SPIFFS_write_19
        SUBW     R0,R6,#+4088
        ADDS     R0,R7,R0
        B.N      ??dl_SPIFFS_write_20
??dl_SPIFFS_write_19:
        LDR.N    R0,??DataTable14_7
        LDRH     R0,[R0, #+6]
??dl_SPIFFS_write_20:
        LDR.N    R1,??DataTable14_5
        ADDS     R1,R1,R5, LSL #+2
        LDR      R1,[R1, #+268]
        LDR.N    R2,??DataTable14_7
        LDRH     R2,[R2, #+6]
        SUBS     R2,R0,R2
        ADDS     R1,R2,R1
        LDR.N    R2,??DataTable14_5
        ADDS     R2,R2,R5, LSL #+2
        STR      R1,[R2, #+268]
        LDR.N    R1,??DataTable14_7
        STRH     R0,[R1, #+6]
        MOVS     R0,#+1
        LDR.N    R1,??DataTable14_7
        STRB     R0,[R1, #+2]
        MOVS     R1,#+6
        LDR.N    R0,??DataTable14_8
        BL       inner_make_crc16
        LDR.N    R1,??DataTable14_7
        STRH     R0,[R1, #+0]
        LDR.N    R0,??DataTable14_7
        LDRH     R0,[R0, #+6]
        ADDS     R0,R0,R8
        ADDS     R0,R0,#+8
        LDR.N    R1,??DataTable14_5
        ADDS     R1,R1,R5, LSL #+2
        STR      R0,[R1, #+300]
        MOVS     R2,#+8
        LDR.N    R1,??DataTable14_7
        MOV      R0,R9
        BL       __aeabi_memcpy
        SUBW     R0,R6,#+4088
        ADDS     R2,R7,R0
        SUBS     R0,R4,R7
        ADDW     R1,R0,#+4088
        ADDS     R4,R9,#+8
        MOVS     R0,R4
        BL       __aeabi_memcpy
        MOV      R0,R8
        BL       SPI_FLASH_SectorErase
        LDR.N    R0,??DataTable14_7
        LDRH     R0,[R0, #+6]
        ADDS     R2,R0,#+8
        MOV      R1,R9
        MOV      R0,R8
        BL       SPI_FLASH_Write
        MOV      R0,R9
        BL       free
        MOVS     R0,R6
??dl_SPIFFS_write_1:
        POP      {R4-R10,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_close:
        PUSH     {R4,LR}
        CMP      R1,#+0
        BPL.N    ??dl_SPIFFS_close_0
        CMP      R1,#+8
        BLT.N    ??dl_SPIFFS_close_0
        MOVS     R0,R1
        B.N      ??dl_SPIFFS_close_1
??dl_SPIFFS_close_0:
        LDR.N    R0,??DataTable14_5
        LDR      R0,[R0, #+336]
        MOVS     R2,#+1
        LSLS     R1,R2,R1
        BICS     R0,R0,R1
        LDR.N    R1,??DataTable14_5
        STR      R0,[R1, #+336]
        MOV      R0,#+344
        BL       malloc
        MOVS     R4,R0
        CMP      R4,#+0
        BNE.N    ??dl_SPIFFS_close_2
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_close_1
??dl_SPIFFS_close_2:
        MOV      R2,#+344
        MOVS     R1,R4
        MOVS     R0,#+0
        BL       SPI_FLASH_Read
        MOVS     R2,#+32
        LDR.N    R1,??DataTable14_9
        ADDS     R0,R4,#+268
        BL       memcmp
        CMP      R0,#+0
        BNE.N    ??dl_SPIFFS_close_3
        MOVS     R2,#+8
        LDR.N    R1,??DataTable14_10
        ADDS     R0,R4,#+260
        BL       memcmp
        CMP      R0,#+0
        BNE.N    ??dl_SPIFFS_close_3
        MOV      R2,#+256
        LDR.N    R1,??DataTable14_6
        ADDS     R0,R4,#+4
        BL       memcmp
        CMP      R0,#+0
        BNE.N    ??dl_SPIFFS_close_3
        MOVS     R0,R4
        BL       free
        MOVS     R0,#+0
        B.N      ??dl_SPIFFS_close_1
??dl_SPIFFS_close_3:
        MOVS     R0,R4
        BL       free
        MOV      R1,#+336
        LDR.N    R0,??DataTable14_6
        BL       inner_make_crc16
        LDR.N    R1,??DataTable14_5
        STRH     R0,[R1, #+0]
        MOVS     R0,#+0
        BL       SPI_FLASH_SectorErase
        MOV      R2,#+344
        LDR.N    R1,??DataTable14_5
        MOVS     R0,#+0
        BL       SPI_FLASH_Write
        MOVS     R0,#+0
??dl_SPIFFS_close_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_fflush:
        PUSH     {R7,LR}
        CMP      R1,#+0
        BPL.N    ??dl_SPIFFS_fflush_0
        CMP      R1,#+8
        BLT.N    ??dl_SPIFFS_fflush_0
        MOVS     R0,R1
        B.N      ??dl_SPIFFS_fflush_1
??dl_SPIFFS_fflush_0:
        LDR.N    R2,??DataTable14_5
        LDR      R2,[R2, #+336]
        MOVS     R3,R2
        LSRS     R3,R3,R1
        LSLS     R2,R3,#+31
        BMI.N    ??dl_SPIFFS_fflush_2
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_fflush_1
??dl_SPIFFS_fflush_2:
        MOVS     R3,#+0
        MOVS     R2,#+0
        BL       dl_SPIFFS_lseek
        CMP      R0,#+0
        BPL.N    ??dl_SPIFFS_fflush_3
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_fflush_1
??dl_SPIFFS_fflush_3:
        MOVS     R0,#+0
??dl_SPIFFS_fflush_1:
        POP      {R1,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_remove:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        LDR.N    R0,??DataTable14_5
        LDR      R5,[R0, #+332]
        MOVS     R0,R1
        BL       inner_fs_file_is_exist
        MOVS     R6,R0
        CMP      R6,#+0
        BPL.N    ??dl_SPIFFS_remove_0
        MOVS     R0,R6
        B.N      ??dl_SPIFFS_remove_1
??dl_SPIFFS_remove_0:
        LDR.N    R0,??DataTable14_5
        ADDS     R0,R6,R0
        LDRB     R0,[R0, #+260]
        MOV      R1,#+4096
        MULS     R0,R1,R0
        LDR.N    R1,??DataTable14_5
        LDR      R1,[R1, #+332]
        MOVS     R2,#+1
        LDR.N    R3,??DataTable14_5
        ADDS     R3,R6,R3
        LDRB     R3,[R3, #+260]
        LSLS     R2,R2,R3
        BICS     R1,R1,R2
        LDR.N    R2,??DataTable14_5
        STR      R1,[R2, #+332]
        B.N      ??dl_SPIFFS_remove_2
??dl_SPIFFS_remove_3:
        LDR.N    R0,??DataTable14_7
        LDRB     R0,[R0, #+4]
        MOV      R1,#+4096
        MULS     R0,R1,R0
??dl_SPIFFS_remove_2:
        MOVS     R2,#+8
        LDR.N    R1,??DataTable14_7
        BL       SPI_FLASH_Read
        MOVS     R1,#+6
        LDR.N    R0,??DataTable14_8
        BL       inner_make_crc16
        LDR.N    R1,??DataTable14_7
        LDRH     R1,[R1, #+0]
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R1,R0
        BEQ.N    ??dl_SPIFFS_remove_4
        LDR.N    R0,??DataTable14_5
        STR      R5,[R0, #+332]
        MOVS     R0,#-1
        B.N      ??dl_SPIFFS_remove_1
??dl_SPIFFS_remove_4:
        LDR.N    R0,??DataTable14_5
        LDR      R0,[R0, #+332]
        MOVS     R1,#+1
        LDR.N    R2,??DataTable14_7
        LDRB     R2,[R2, #+3]
        LSLS     R1,R1,R2
        BICS     R0,R0,R1
        LDR.N    R1,??DataTable14_5
        STR      R0,[R1, #+332]
        LDR.N    R0,??DataTable14_7
        LDRB     R0,[R0, #+3]
        LDR.N    R1,??DataTable14_7
        LDRB     R1,[R1, #+4]
        CMP      R0,R1
        BNE.N    ??dl_SPIFFS_remove_3
        MOVS     R0,#+0
        LDR.N    R1,??DataTable14_5
        ADDS     R1,R1,R6, LSL #+5
        STRB     R0,[R1, #+4]
        MOVS     R1,R6
        MOVS     R0,R4
        BL       dl_SPIFFS_close
??dl_SPIFFS_remove_1:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_info:
        PUSH     {R4-R6}
        MOVS     R0,#+0
        LDR.N    R3,??DataTable14_5
        LDR      R3,[R3, #+332]
        MOVS     R5,#+32
        MOVS     R4,#+1
        B.N      ??dl_SPIFFS_info_0
??dl_SPIFFS_info_1:
        MOVS     R6,R3
        LSRS     R6,R6,R4
        LSLS     R6,R6,#+31
        BPL.N    ??dl_SPIFFS_info_2
        ADDS     R0,R0,#+4096
??dl_SPIFFS_info_2:
        ADDS     R4,R4,#+1
??dl_SPIFFS_info_0:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        CMP      R4,R5
        BCC.N    ??dl_SPIFFS_info_1
        MOVS     R3,#+131072
        STR      R3,[R1, #+0]
        ADDS     R0,R0,#+4096
        STR      R0,[R2, #+0]
        MOVS     R0,#+0
        POP      {R4-R6}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_creat:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R3,#+0
        MOVS     R2,#+4
        MOVS     R0,R4
        BL       dl_SPIFFS_open
        CMP      R0,#+0
        BMI.N    ??dl_SPIFFS_creat_0
??dl_SPIFFS_creat_1:
        MOVS     R1,R0
        MOVS     R0,R4
        BL       dl_SPIFFS_close
        MOVS     R0,#+0
??dl_SPIFFS_creat_0:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
dl_SPIFFS_rename:
        PUSH     {R4-R6,LR}
        MOVS     R4,R1
        MOVS     R5,R2
        LDR.N    R0,??DataTable14_5
        LDRB     R0,[R0, #+340]
        CMP      R0,#+0
        BEQ.N    ??dl_SPIFFS_rename_0
        MOVS     R6,#+0
        B.N      ??dl_SPIFFS_rename_1
??dl_SPIFFS_rename_2:
        ADDS     R6,R6,#+1
??dl_SPIFFS_rename_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+8
        BGE.N    ??dl_SPIFFS_rename_0
        LDR.N    R0,??DataTable14_5
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADDS     R0,R0,R6, LSL #+5
        ADDS     R1,R0,#+4
        MOVS     R0,R4
        BL       strcmp
        CMP      R0,#+0
        BNE.N    ??dl_SPIFFS_rename_2
        MOVS     R1,R5
        LDR.N    R0,??DataTable14_5
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        ADDS     R0,R0,R6, LSL #+5
        ADDS     R0,R0,#+4
        BL       strcpy
        MOVS     R0,#+0
        B.N      ??dl_SPIFFS_rename_3
??dl_SPIFFS_rename_0:
        MOVS     R0,#-1
??dl_SPIFFS_rename_3:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     spiffs_cache_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_1:
        DC32     spiffs_fds

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_2:
        DC32     spiffs_work_buf

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_3:
        DC32     xFs

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_4:
        DC32     0xffffd8d7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_5:
        DC32     g_fs_header

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_6:
        DC32     g_fs_header+0x4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_7:
        DC32     g_fs_block

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_8:
        DC32     g_fs_block+0x2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_9:
        DC32     g_fs_header+0x10C

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_10:
        DC32     g_fs_header+0x104

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
inner_make_crc16:
        PUSH     {R4-R7}
        MOVW     R2,#+65535
        MOVS     R4,#+0
        MOVS     R3,#+0
        B.N      ??inner_make_crc16_0
??inner_make_crc16_1:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LSRS     R5,R2,#+15
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRB     R6,[R3, R0]
        RSBS     R7,R4,#+7
        MOV      R12,R6
        ASRS     R12,R12,R7
        ANDS     R6,R12,#0x1
        LSLS     R2,R2,#+1
        UXTB     R5,R5            ;; ZeroExt  R5,R5,#+24,#+24
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        TEQ      R6,R5
        BEQ.N    ??inner_make_crc16_2
        EOR      R2,R2,#0x1000
        EORS     R2,R2,#0x21
??inner_make_crc16_2:
        ADDS     R4,R4,#+1
??inner_make_crc16_3:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+8
        BLT.N    ??inner_make_crc16_1
        ADDS     R3,R3,#+1
??inner_make_crc16_0:
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R3,R1
        BCS.N    ??inner_make_crc16_4
        MOVS     R4,#+0
        B.N      ??inner_make_crc16_3
??inner_make_crc16_4:
        MOVS     R0,R2
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        POP      {R4-R7}
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
// 1 488 bytes in section .bss
// 3 444 bytes in section .text
// 
// 3 444 bytes of CODE memory
// 1 488 bytes of DATA memory
//
//Errors: none
//Warnings: none
