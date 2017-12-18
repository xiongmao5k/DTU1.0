///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       15/Dec/2017  11:10:24
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\spiffs\src\spiffs_hydrogen.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\spiffs\src\spiffs_hydrogen.c
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\spiffs_hydrogen.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memcpy
        EXTERN __aeabi_memset
        EXTERN printf
        EXTERN spiffs_cache_fd_release
        EXTERN spiffs_cache_init
        EXTERN spiffs_cache_page_allocate_by_fd
        EXTERN spiffs_cache_page_get_by_fd
        EXTERN spiffs_erase_block
        EXTERN spiffs_fd_find_new
        EXTERN spiffs_fd_get
        EXTERN spiffs_fd_return
        EXTERN spiffs_fd_temporal_cache_rehash
        EXTERN spiffs_gc_check
        EXTERN spiffs_gc_quick
        EXTERN spiffs_lookup_consistency_check
        EXTERN spiffs_obj_lu_find_entry_visitor
        EXTERN spiffs_obj_lu_find_free_obj_id
        EXTERN spiffs_obj_lu_find_id_and_span
        EXTERN spiffs_obj_lu_scan
        EXTERN spiffs_object_append
        EXTERN spiffs_object_create
        EXTERN spiffs_object_find_object_index_header_by_name
        EXTERN spiffs_object_index_consistency_check
        EXTERN spiffs_object_modify
        EXTERN spiffs_object_open_by_page
        EXTERN spiffs_object_read
        EXTERN spiffs_object_truncate
        EXTERN spiffs_object_update_index_hdr
        EXTERN spiffs_page_consistency_check
        EXTERN spiffs_phys_rd
        EXTERN spiffs_populate_ix_map
        EXTERN strcpy
        EXTERN strlen
        EXTERN strncpy

        PUBLIC SPIFFS_bytes_to_ix_map_entries
        PUBLIC SPIFFS_check
        PUBLIC SPIFFS_clearerr
        PUBLIC SPIFFS_close
        PUBLIC SPIFFS_closedir
        PUBLIC SPIFFS_creat
        PUBLIC SPIFFS_eof
        PUBLIC SPIFFS_errno
        PUBLIC SPIFFS_fflush
        PUBLIC SPIFFS_format
        PUBLIC SPIFFS_fremove
        PUBLIC SPIFFS_fstat
        PUBLIC SPIFFS_fupdate_meta
        PUBLIC SPIFFS_gc
        PUBLIC SPIFFS_gc_quick
        PUBLIC SPIFFS_info
        PUBLIC SPIFFS_ix_map
        PUBLIC SPIFFS_ix_map_entries_to_bytes
        PUBLIC SPIFFS_ix_remap
        PUBLIC SPIFFS_ix_unmap
        PUBLIC SPIFFS_lseek
        PUBLIC SPIFFS_mount
        PUBLIC SPIFFS_mounted
        PUBLIC SPIFFS_open
        PUBLIC SPIFFS_open_by_dirent
        PUBLIC SPIFFS_open_by_page
        PUBLIC SPIFFS_opendir
        PUBLIC SPIFFS_read
        PUBLIC SPIFFS_readdir
        PUBLIC SPIFFS_remove
        PUBLIC SPIFFS_rename
        PUBLIC SPIFFS_set_file_callback_func
        PUBLIC SPIFFS_stat
        PUBLIC SPIFFS_tell
        PUBLIC SPIFFS_unmount
        PUBLIC SPIFFS_update_meta
        PUBLIC SPIFFS_vis
        PUBLIC SPIFFS_write


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_mounted:
        LDRB     R0,[R0, #+100]
        CMP      R0,#+0
        BEQ.N    ??SPIFFS_mounted_0
        MOVS     R0,#+1
        B.N      ??SPIFFS_mounted_1
??SPIFFS_mounted_0:
        MOVS     R0,#+0
??SPIFFS_mounted_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_format:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        LDR      R0,[R4, #+108]
        LDR.W    R1,??DataTable10  ;; 0x20090315
        CMP      R0,R1
        BEQ.N    ??SPIFFS_format_0
        LDR.W    R0,??DataTable10_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable10_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_format_1
??SPIFFS_format_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BEQ.N    ??SPIFFS_format_2
        LDR.W    R0,??DataTable10_2  ;; 0xffffd8d6
        STR      R0,[R4, #+52]
        MOVS     R0,#-1
        B.N      ??SPIFFS_format_1
??SPIFFS_format_2:
        MOVS     R5,#+0
        B.N      ??SPIFFS_format_3
??SPIFFS_format_4:
        ADDS     R5,R5,#+1
??SPIFFS_format_3:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        LDR      R0,[R4, #+16]
        CMP      R5,R0
        BCS.N    ??SPIFFS_format_5
        MOVS     R0,#+0
        STRH     R0,[R4, #+70]
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_erase_block
        CMP      R0,#+0
        BEQ.N    ??SPIFFS_format_6
        LDR.W    R0,??DataTable11  ;; 0xffffd8d5
??SPIFFS_format_6:
        CMP      R0,#+0
        BPL.N    ??SPIFFS_format_4
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_format_1
??SPIFFS_format_5:
        MOVS     R0,#+0
??SPIFFS_format_1:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_mount:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOVS     R5,R3
        LDR      R8,[R4, #+104]
        MOVS     R1,#+112
        MOVS     R2,#+0
        MOVS     R0,R4
        BL       __aeabi_memset
        MOVS     R2,#+16
        MOVS     R1,R6
        MOVS     R0,R4
        BL       __aeabi_memcpy
        STR      R8,[R4, #+104]
        MOVS     R0,#+32
        STR      R0,[R4, #+16]
        STR      R7,[R4, #+40]
        ADDS     R0,R7,#+128
        STR      R0,[R4, #+36]
        LDR      R6,[SP, #+24]
        MOVS     R2,#+0
        MOVS     R1,R6
        MOVS     R0,R5
        BL       __aeabi_memset
        MOVS     R0,#+4
        SUBS     R1,R0,#+1
        ANDS     R3,R1,R5
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BEQ.N    ??SPIFFS_mount_0
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        SUBS     R1,R0,R3
        ADDS     R5,R1,R5
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        SUBS     R1,R0,R3
        SUBS     R6,R6,R1
??SPIFFS_mount_0:
        STR      R5,[R4, #+44]
        MOVS     R1,#+48
        UDIV     R1,R6,R1
        STR      R1,[R4, #+48]
        LDR      R1,[SP, #+28]
        SUBS     R2,R0,#+1
        ANDS     R3,R2,R1
        LDR      R2,[SP, #+32]
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BEQ.N    ??SPIFFS_mount_1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        SUBS     R5,R0,R3
        ADDS     R1,R5,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        SUBS     R3,R0,R3
        SUBS     R2,R2,R3
??SPIFFS_mount_1:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        SUBS     R3,R0,#+1
        TST      R2,R3
        BEQ.N    ??SPIFFS_mount_2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        SUBS     R0,R0,#+1
        ANDS     R0,R0,R2
        SUBS     R2,R2,R0
??SPIFFS_mount_2:
        STR      R1,[R4, #+76]
        CMP      R2,#+4096
        BLS.N    ??SPIFFS_mount_3
        MOV      R2,#+4096
        B.N      ??SPIFFS_mount_4
??SPIFFS_mount_3:
??SPIFFS_mount_4:
        STR      R2,[R4, #+80]
        MOVS     R0,R4
        BL       spiffs_cache_init
        MOVS     R0,#+0
        CMP      R0,#+0
        BPL.N    ??SPIFFS_mount_5
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_mount_6
??SPIFFS_mount_5:
        LDR.W    R0,??DataTable10  ;; 0x20090315
        STR      R0,[R4, #+108]
        MOVS     R0,R4
        BL       spiffs_obj_lu_scan
        CMP      R0,#+0
        BPL.N    ??SPIFFS_mount_7
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_mount_6
??SPIFFS_mount_7:
        LDR      R0,[SP, #+36]
        STR      R0,[R4, #+92]
        MOVS     R0,#+1
        STRB     R0,[R4, #+100]
        MOVS     R0,#+0
??SPIFFS_mount_6:
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_unmount:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        LDR      R0,[R4, #+108]
        LDR.W    R1,??DataTable10  ;; 0x20090315
        CMP      R0,R1
        BNE.N    ??SPIFFS_unmount_0
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_unmount_1
??SPIFFS_unmount_0:
        B.N      ??SPIFFS_unmount_2
??SPIFFS_unmount_1:
        LDR      R6,[R4, #+44]
        MOVS     R5,#+0
        B.N      ??SPIFFS_unmount_3
??SPIFFS_unmount_4:
        MOVS     R0,#+48
        MLA      R7,R0,R5,R6
        LDRSH    R0,[R7, #+4]
        CMP      R0,#+0
        BEQ.N    ??SPIFFS_unmount_5
        LDRSH    R1,[R7, #+4]
        MOVS     R0,R4
        BL       spiffs_fflush_cache
        LDRSH    R1,[R7, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
??SPIFFS_unmount_5:
        ADDS     R5,R5,#+1
??SPIFFS_unmount_3:
        LDR      R0,[R4, #+48]
        CMP      R5,R0
        BCC.N    ??SPIFFS_unmount_4
        MOVS     R0,#+0
        STRB     R0,[R4, #+100]
??SPIFFS_unmount_2:
        POP      {R0,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_errno:
        LDR      R0,[R0, #+52]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_clearerr:
        MOVS     R1,#+0
        STR      R1,[R0, #+52]
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_creat:
        PUSH     {R1-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,[R4, #+108]
        LDR.W    R1,??DataTable10  ;; 0x20090315
        CMP      R0,R1
        BEQ.N    ??SPIFFS_creat_0
        LDR.W    R0,??DataTable10_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable10_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_creat_1
??SPIFFS_creat_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_creat_2
        LDR.W    R0,??DataTable12  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable12  ;; 0xffffd8f0
        B.N      ??SPIFFS_creat_1
??SPIFFS_creat_2:
        MOVS     R0,R5
        BL       strlen
        CMP      R0,#+32
        BCC.N    ??SPIFFS_creat_3
        LDR.W    R0,??DataTable13  ;; 0xffffd8cc
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable13  ;; 0xffffd8cc
        B.N      ??SPIFFS_creat_1
??SPIFFS_creat_3:
        MOVS     R2,R5
        ADD      R1,SP,#+8
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_free_obj_id
        CMP      R0,#+0
        BPL.N    ??SPIFFS_creat_4
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_creat_1
??SPIFFS_creat_4:
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,R5
        LDRH     R1,[SP, #+8]
        MOVS     R0,R4
        BL       spiffs_object_create
        CMP      R0,#+0
        BPL.N    ??SPIFFS_creat_5
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_creat_1
??SPIFFS_creat_5:
        MOVS     R0,#+0
??SPIFFS_creat_1:
        POP      {R1-R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_open:
        PUSH     {R0-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R0,[R4, #+108]
        LDR.W    R1,??DataTable10  ;; 0x20090315
        CMP      R0,R1
        BEQ.N    ??SPIFFS_open_0
        LDR.W    R0,??DataTable10_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable10_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_open_1
??SPIFFS_open_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_open_2
        LDR.W    R0,??DataTable12  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable12  ;; 0xffffd8f0
        B.N      ??SPIFFS_open_1
??SPIFFS_open_2:
        MOVS     R0,R5
        BL       strlen
        CMP      R0,#+32
        BCC.N    ??SPIFFS_open_3
        LDR.W    R0,??DataTable13  ;; 0xffffd8cc
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable13  ;; 0xffffd8cc
        B.N      ??SPIFFS_open_1
??SPIFFS_open_3:
        MOVS     R2,R5
        ADD      R1,SP,#+8
        MOVS     R0,R4
        BL       spiffs_fd_find_new
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_4
        STR      R8,[R4, #+52]
        MOV      R0,R8
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        B.N      ??SPIFFS_open_1
??SPIFFS_open_4:
        ADD      R2,SP,#+12
        MOVS     R1,R5
        MOVS     R0,R4
        BL       spiffs_object_find_object_index_header_by_name
        MOV      R8,R0
        LSLS     R0,R6,#+29
        BMI.N    ??SPIFFS_open_5
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_6
        LDR      R0,[SP, #+8]
        LDRSH    R1,[R0, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
??SPIFFS_open_6:
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_5
        STR      R8,[R4, #+52]
        MOV      R0,R8
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        B.N      ??SPIFFS_open_1
??SPIFFS_open_5:
        CMP      R8,#+0
        BNE.N    ??SPIFFS_open_7
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ANDS     R0,R6,#0x44
        CMP      R0,#+68
        BNE.N    ??SPIFFS_open_7
        LDR.W    R8,??DataTable14  ;; 0xffffd8d2
        LDR      R0,[SP, #+8]
        LDRSH    R1,[R0, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_7
        STR      R8,[R4, #+52]
        MOV      R0,R8
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        B.N      ??SPIFFS_open_1
??SPIFFS_open_7:
        LSLS     R0,R6,#+29
        BPL.N    ??SPIFFS_open_8
        LDR.W    R0,??DataTable15  ;; 0xffffd8ee
        CMP      R8,R0
        BNE.N    ??SPIFFS_open_8
        MOVS     R2,#+0
        ADD      R1,SP,#+14
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_free_obj_id
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_9
        LDR      R0,[SP, #+8]
        LDRSH    R1,[R0, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
??SPIFFS_open_9:
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_10
        STR      R8,[R4, #+52]
        MOV      R0,R8
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        B.N      ??SPIFFS_open_1
??SPIFFS_open_10:
        ADD      R0,SP,#+12
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,R5
        LDRH     R1,[SP, #+14]
        MOVS     R0,R4
        BL       spiffs_object_create
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_11
        LDR      R0,[SP, #+8]
        LDRSH    R1,[R0, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
??SPIFFS_open_11:
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_12
        STR      R8,[R4, #+52]
        MOV      R0,R8
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        B.N      ??SPIFFS_open_1
??SPIFFS_open_12:
        MOVW     R0,#+65533
        ANDS     R6,R0,R6
??SPIFFS_open_13:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        STR      R7,[SP, #+0]
        MOVS     R3,R6
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDR      R2,[SP, #+8]
        LDRH     R1,[SP, #+12]
        MOVS     R0,R4
        BL       spiffs_object_open_by_page
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_14
        LDR      R0,[SP, #+8]
        LDRSH    R1,[R0, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
??SPIFFS_open_14:
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_15
        STR      R8,[R4, #+52]
        MOV      R0,R8
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        B.N      ??SPIFFS_open_1
??SPIFFS_open_8:
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_16
        LDR      R0,[SP, #+8]
        LDRSH    R1,[R0, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
??SPIFFS_open_16:
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_13
        STR      R8,[R4, #+52]
        MOV      R0,R8
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        B.N      ??SPIFFS_open_1
??SPIFFS_open_15:
        LSLS     R0,R6,#+30
        BPL.N    ??SPIFFS_open_17
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR      R0,[SP, #+8]
        BL       spiffs_object_truncate
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_18
        LDR      R0,[SP, #+8]
        LDRSH    R1,[R0, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
??SPIFFS_open_18:
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_17
        STR      R8,[R4, #+52]
        MOV      R0,R8
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        B.N      ??SPIFFS_open_1
??SPIFFS_open_17:
        MOVS     R0,#+0
        LDR      R1,[SP, #+8]
        STR      R0,[R1, #+24]
        LDR      R0,[SP, #+8]
        LDRSH    R0,[R0, #+4]
        CMP      R0,#+0
        BEQ.N    ??SPIFFS_open_19
        LDR      R0,[SP, #+8]
        LDRH     R0,[R0, #+4]
        LDRSH    R1,[R4, #+12]
        ADDS     R0,R1,R0
        B.N      ??SPIFFS_open_20
??SPIFFS_open_19:
        MOVS     R0,#+0
??SPIFFS_open_20:
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
??SPIFFS_open_1:
        ADD      SP,SP,#+16
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_open_by_dirent:
        PUSH     {R2-R8,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R5,R2
        MOVS     R7,R3
        LDR      R0,[R4, #+108]
        LDR.W    R1,??DataTable10  ;; 0x20090315
        CMP      R0,R1
        BEQ.N    ??SPIFFS_open_by_dirent_0
        LDR.W    R0,??DataTable10_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable10_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_open_by_dirent_1
??SPIFFS_open_by_dirent_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_open_by_dirent_2
        LDR.W    R0,??DataTable12  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable12  ;; 0xffffd8f0
        B.N      ??SPIFFS_open_by_dirent_1
??SPIFFS_open_by_dirent_2:
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        MOVS     R0,R4
        BL       spiffs_fd_find_new
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_by_dirent_3
        STR      R8,[R4, #+52]
        MOV      R0,R8
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        B.N      ??SPIFFS_open_by_dirent_1
??SPIFFS_open_by_dirent_3:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        STR      R7,[SP, #+0]
        MOVS     R3,R5
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDR      R2,[SP, #+4]
        LDRH     R1,[R6, #+40]
        MOVS     R0,R4
        BL       spiffs_object_open_by_page
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_by_dirent_4
        LDR      R0,[SP, #+4]
        LDRSH    R1,[R0, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
??SPIFFS_open_by_dirent_4:
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_by_dirent_5
        STR      R8,[R4, #+52]
        MOV      R0,R8
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        B.N      ??SPIFFS_open_by_dirent_1
??SPIFFS_open_by_dirent_5:
        LSLS     R0,R5,#+30
        BPL.N    ??SPIFFS_open_by_dirent_6
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR      R0,[SP, #+4]
        BL       spiffs_object_truncate
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_by_dirent_7
        LDR      R0,[SP, #+4]
        LDRSH    R1,[R0, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
??SPIFFS_open_by_dirent_7:
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_by_dirent_6
        STR      R8,[R4, #+52]
        MOV      R0,R8
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        B.N      ??SPIFFS_open_by_dirent_1
??SPIFFS_open_by_dirent_6:
        MOVS     R0,#+0
        LDR      R1,[SP, #+4]
        STR      R0,[R1, #+24]
        LDR      R0,[SP, #+4]
        LDRSH    R0,[R0, #+4]
        CMP      R0,#+0
        BEQ.N    ??SPIFFS_open_by_dirent_8
        LDR      R0,[SP, #+4]
        LDRH     R0,[R0, #+4]
        LDRSH    R1,[R4, #+12]
        ADDS     R0,R1,R0
        B.N      ??SPIFFS_open_by_dirent_9
??SPIFFS_open_by_dirent_8:
        MOVS     R0,#+0
??SPIFFS_open_by_dirent_9:
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
??SPIFFS_open_by_dirent_1:
        POP      {R1,R2,R4-R8,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_open_by_page:
        PUSH     {R2-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R0,[R4, #+108]
        LDR.W    R1,??DataTable10  ;; 0x20090315
        CMP      R0,R1
        BEQ.N    ??SPIFFS_open_by_page_0
        LDR.W    R0,??DataTable10_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable10_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_open_by_page_1
??SPIFFS_open_by_page_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_open_by_page_2
        LDR.W    R0,??DataTable12  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable12  ;; 0xffffd8f0
        B.N      ??SPIFFS_open_by_page_1
??SPIFFS_open_by_page_2:
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        MOVS     R0,R4
        BL       spiffs_fd_find_new
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_by_page_3
        STR      R8,[R4, #+52]
        MOV      R0,R8
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        B.N      ??SPIFFS_open_by_page_1
??SPIFFS_open_by_page_3:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R0,#+32
        SDIV     R1,R5,R0
        MLS      R1,R1,R0,R5
        CMP      R1,#+0
        BNE.N    ??SPIFFS_open_by_page_4
        LDR.W    R8,??DataTable18  ;; 0xffffd8d1
        LDR      R0,[SP, #+4]
        LDRSH    R1,[R0, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_by_page_4
        STR      R8,[R4, #+52]
        MOV      R0,R8
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        B.N      ??SPIFFS_open_by_page_1
??SPIFFS_open_by_page_4:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        STR      R7,[SP, #+0]
        MOVS     R3,R6
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDR      R2,[SP, #+4]
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_object_open_by_page
        MOV      R8,R0
        LDR.W    R0,??DataTable17  ;; 0xffffd8e4
        CMP      R8,R0
        BEQ.N    ??SPIFFS_open_by_page_5
        LDR.W    R0,??DataTable17_1  ;; 0xffffd8ec
        CMP      R8,R0
        BEQ.N    ??SPIFFS_open_by_page_5
        LDR.W    R0,??DataTable17_2  ;; 0xffffd8eb
        CMP      R8,R0
        BEQ.N    ??SPIFFS_open_by_page_5
        LDR.W    R0,??DataTable17_3  ;; 0xffffd8ea
        CMP      R8,R0
        BEQ.N    ??SPIFFS_open_by_page_5
        LDR.W    R0,??DataTable17_4  ;; 0xffffd8e3
        CMP      R8,R0
        BNE.N    ??SPIFFS_open_by_page_6
??SPIFFS_open_by_page_5:
        LDR.W    R8,??DataTable18  ;; 0xffffd8d1
??SPIFFS_open_by_page_6:
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_by_page_7
        LDR      R0,[SP, #+4]
        LDRSH    R1,[R0, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
??SPIFFS_open_by_page_7:
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_by_page_8
        STR      R8,[R4, #+52]
        MOV      R0,R8
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        B.N      ??SPIFFS_open_by_page_1
??SPIFFS_open_by_page_8:
        LSLS     R0,R6,#+30
        BPL.N    ??SPIFFS_open_by_page_9
        MOVS     R2,#+0
        MOVS     R1,#+0
        LDR      R0,[SP, #+4]
        BL       spiffs_object_truncate
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_by_page_10
        LDR      R0,[SP, #+4]
        LDRSH    R1,[R0, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
??SPIFFS_open_by_page_10:
        CMP      R8,#+0
        BPL.N    ??SPIFFS_open_by_page_9
        STR      R8,[R4, #+52]
        MOV      R0,R8
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        B.N      ??SPIFFS_open_by_page_1
??SPIFFS_open_by_page_9:
        MOVS     R0,#+0
        LDR      R1,[SP, #+4]
        STR      R0,[R1, #+24]
        LDR      R0,[SP, #+4]
        LDRSH    R0,[R0, #+4]
        CMP      R0,#+0
        BEQ.N    ??SPIFFS_open_by_page_11
        LDR      R0,[SP, #+4]
        LDRH     R0,[R0, #+4]
        LDRSH    R1,[R4, #+12]
        ADDS     R0,R1,R0
        B.N      ??SPIFFS_open_by_page_12
??SPIFFS_open_by_page_11:
        MOVS     R0,#+0
??SPIFFS_open_by_page_12:
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
??SPIFFS_open_by_page_1:
        POP      {R1,R2,R4-R8,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_read:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R0,[R4, #+108]
        LDR.W    R1,??DataTable10  ;; 0x20090315
        CMP      R0,R1
        BEQ.N    ??SPIFFS_read_0
        LDR.W    R0,??DataTable10_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable10_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_read_1
??SPIFFS_read_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_read_2
        LDR.W    R0,??DataTable12  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable12  ;; 0xffffd8f0
        B.N      ??SPIFFS_read_1
??SPIFFS_read_2:
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.N    ??SPIFFS_read_3
        LDRSH    R0,[R4, #+12]
        SUBS     R5,R5,R0
        B.N      ??SPIFFS_read_4
??SPIFFS_read_3:
        MOVS     R5,#+0
??SPIFFS_read_4:
        ADD      R2,SP,#+0
        MOVS     R1,R5
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_fd_get
        CMP      R0,#+0
        BPL.N    ??SPIFFS_read_5
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_read_1
??SPIFFS_read_5:
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+28]
        LSLS     R0,R0,#+28
        BMI.N    ??SPIFFS_read_6
        LDR.W    R0,??DataTable19  ;; 0xffffd8da
        CMP      R0,#+0
        BPL.N    ??SPIFFS_read_6
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_read_1
??SPIFFS_read_6:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+8]
        CMN      R0,#+1
        BNE.N    ??SPIFFS_read_7
        CMP      R7,#+1
        BLT.N    ??SPIFFS_read_7
        LDR.W    R0,??DataTable21  ;; 0xffffd8ed
        CMP      R0,#+0
        BPL.N    ??SPIFFS_read_7
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_read_1
??SPIFFS_read_7:
        MOVS     R1,R5
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_fflush_cache
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+24]
        ADDS     R0,R7,R0
        LDR      R1,[SP, #+0]
        LDR      R1,[R1, #+8]
        CMP      R0,R1
        BCC.N    ??SPIFFS_read_8
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+8]
        LDR      R1,[SP, #+0]
        LDR      R1,[R1, #+24]
        SUBS     R7,R0,R1
        CMP      R7,#+1
        BGE.N    ??SPIFFS_read_9
        LDR.W    R0,??DataTable21  ;; 0xffffd8ed
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable21  ;; 0xffffd8ed
        B.N      ??SPIFFS_read_1
??SPIFFS_read_9:
        MOVS     R3,R6
        MOVS     R2,R7
        LDR      R0,[SP, #+0]
        LDR      R1,[R0, #+24]
        LDR      R0,[SP, #+0]
        BL       spiffs_object_read
        LDR.W    R1,??DataTable21  ;; 0xffffd8ed
        CMP      R0,R1
        BNE.N    ??SPIFFS_read_10
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+24]
        ADDS     R0,R7,R0
        LDR      R1,[SP, #+0]
        STR      R0,[R1, #+24]
        MOVS     R0,R7
        B.N      ??SPIFFS_read_1
??SPIFFS_read_10:
        CMP      R0,#+0
        BPL.N    ??SPIFFS_read_11
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_read_1
??SPIFFS_read_11:
??SPIFFS_read_12:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+24]
        ADDS     R0,R7,R0
        LDR      R1,[SP, #+0]
        STR      R0,[R1, #+24]
        MOVS     R0,R7
??SPIFFS_read_1:
        POP      {R1,R4-R7,PC}    ;; return
??SPIFFS_read_8:
        MOVS     R3,R6
        MOVS     R2,R7
        LDR      R0,[SP, #+0]
        LDR      R1,[R0, #+24]
        LDR      R0,[SP, #+0]
        BL       spiffs_object_read
        CMP      R0,#+0
        BPL.N    ??SPIFFS_read_12
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_read_1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_hydro_write:
        PUSH     {R3-R9,LR}
        MOVS     R4,R1
        MOVS     R5,R2
        MOVS     R6,R3
        MOVS     R0,#+0
        LDR      R7,[SP, #+32]
        MOV      R8,R7
        LDR      R0,[R4, #+8]
        CMN      R0,#+1
        BEQ.N    ??spiffs_hydro_write_0
        LDR      R0,[R4, #+8]
        CMP      R6,R0
        BCS.N    ??spiffs_hydro_write_0
        LDR      R0,[R4, #+8]
        SUBS     R0,R0,R6
        CMP      R0,R7
        BGE.N    ??spiffs_hydro_write_1
        LDR      R0,[R4, #+8]
        SUBS     R9,R0,R6
        B.N      ??spiffs_hydro_write_2
??spiffs_hydro_write_1:
        MOV      R9,R7
??spiffs_hydro_write_2:
        MOV      R3,R9
        MOVS     R2,R5
        MOVS     R1,R6
        MOVS     R0,R4
        BL       spiffs_object_modify
        CMP      R0,#+0
        BMI.N    ??spiffs_hydro_write_3
??spiffs_hydro_write_4:
        SUBS     R8,R8,R9
        ADDS     R5,R9,R5
        ADDS     R6,R9,R6
??spiffs_hydro_write_0:
        CMP      R8,#+1
        BLT.N    ??spiffs_hydro_write_5
        MOV      R3,R8
        MOVS     R2,R5
        MOVS     R1,R6
        MOVS     R0,R4
        BL       spiffs_object_append
        CMP      R0,#+0
        BMI.N    ??spiffs_hydro_write_3
??spiffs_hydro_write_6:
??spiffs_hydro_write_5:
        MOVS     R0,R7
??spiffs_hydro_write_3:
        POP      {R1,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_write:
        PUSH     {R4-R9,LR}
        SUB      SP,SP,#+12
        MOVS     R5,R0
        MOVS     R6,R2
        MOVS     R4,R3
        LDR      R0,[R5, #+108]
        LDR.W    R2,??DataTable10  ;; 0x20090315
        CMP      R0,R2
        BEQ.N    ??SPIFFS_write_0
        LDR.W    R0,??DataTable10_1  ;; 0xffffd8d8
        STR      R0,[R5, #+52]
        LDR.W    R0,??DataTable10_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_write_1
??SPIFFS_write_0:
        LDRB     R0,[R5, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_write_2
        LDR.W    R0,??DataTable12  ;; 0xffffd8f0
        STR      R0,[R5, #+52]
        LDR.W    R0,??DataTable12  ;; 0xffffd8f0
        B.N      ??SPIFFS_write_1
??SPIFFS_write_2:
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??SPIFFS_write_3
        LDRSH    R0,[R5, #+12]
        SUBS     R1,R1,R0
        B.N      ??SPIFFS_write_4
??SPIFFS_write_3:
        MOVS     R1,#+0
??SPIFFS_write_4:
        ADD      R2,SP,#+4
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        BL       spiffs_fd_get
        MOV      R9,R0
        CMP      R9,#+0
        BPL.N    ??SPIFFS_write_5
        STR      R9,[R5, #+52]
        MOV      R0,R9
        B.N      ??SPIFFS_write_1
??SPIFFS_write_5:
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+28]
        LSLS     R0,R0,#+27
        BMI.N    ??SPIFFS_write_6
        LDR.W    R9,??DataTable26  ;; 0xffffd8db
        CMP      R9,#+0
        BPL.N    ??SPIFFS_write_6
        STR      R9,[R5, #+52]
        MOV      R0,R9
        B.N      ??SPIFFS_write_1
??SPIFFS_write_6:
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+28]
        LSLS     R0,R0,#+31
        BPL.N    ??SPIFFS_write_7
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+8]
        CMN      R0,#+1
        BNE.N    ??SPIFFS_write_8
        MOVS     R0,#+0
        B.N      ??SPIFFS_write_9
??SPIFFS_write_8:
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+8]
??SPIFFS_write_9:
        LDR      R1,[SP, #+4]
        STR      R0,[R1, #+24]
??SPIFFS_write_7:
        LDR      R0,[SP, #+4]
        LDR      R7,[R0, #+24]
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_write_10
        LDR      R1,[SP, #+4]
        MOVS     R0,R5
        BL       spiffs_cache_page_get_by_fd
        LDR      R1,[SP, #+4]
        STR      R0,[R1, #+32]
??SPIFFS_write_10:
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+28]
        LSLS     R0,R0,#+31
        BPL.N    ??SPIFFS_write_11
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+8]
        CMN      R0,#+1
        BNE.N    ??SPIFFS_write_12
        MOVS     R7,#+0
        B.N      ??SPIFFS_write_13
??SPIFFS_write_12:
        LDR      R0,[SP, #+4]
        LDR      R7,[R0, #+8]
??SPIFFS_write_13:
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        CMP      R0,#+0
        BEQ.N    ??SPIFFS_write_11
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        LDR      R0,[R0, #+12]
        LDR      R1,[SP, #+4]
        LDR      R1,[R1, #+32]
        LDRH     R1,[R1, #+16]
        ADDS     R0,R1,R0
        CMP      R0,R7
        BCC.N    ??SPIFFS_write_11
??SPIFFS_write_14:
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        LDR      R0,[R0, #+12]
        LDR      R1,[SP, #+4]
        LDR      R1,[R1, #+32]
        LDRH     R1,[R1, #+16]
        ADDS     R7,R1,R0
??SPIFFS_write_11:
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+28]
        LSLS     R0,R0,#+26
        BMI.W    ??SPIFFS_write_15
        CMP      R4,#+128
        BGE.W    ??SPIFFS_write_16
        MOVS     R8,#+1
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        CMP      R0,#+0
        BEQ.N    ??SPIFFS_write_17
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        LDR      R0,[R0, #+12]
        CMP      R7,R0
        BCC.N    ??SPIFFS_write_18
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        LDR      R0,[R0, #+12]
        LDR      R1,[SP, #+4]
        LDR      R1,[R1, #+32]
        LDRH     R1,[R1, #+16]
        ADDS     R0,R1,R0
        CMP      R0,R7
        BCC.N    ??SPIFFS_write_18
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        LDR      R0,[R0, #+12]
        ADDS     R0,R0,#+128
        ADDS     R1,R4,R7
        CMP      R0,R1
        BCS.N    ??SPIFFS_write_19
??SPIFFS_write_18:
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        LDRH     R0,[R0, #+16]
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        LDR      R3,[R0, #+12]
        LDR      R0,[R5, #+76]
        LDR      R0,[R0, #+16]
        LDR      R1,[SP, #+4]
        LDR      R1,[R1, #+32]
        LDRB     R1,[R1, #+1]
        MOVS     R2,#+148
        MLA      R0,R2,R1,R0
        ADDS     R2,R0,#+20
        LDR      R1,[SP, #+4]
        MOVS     R0,R5
        BL       spiffs_hydro_write
        MOV      R9,R0
        LDR      R0,[SP, #+4]
        LDR      R1,[R0, #+32]
        MOVS     R0,R5
        BL       spiffs_cache_fd_release
        CMP      R9,#+0
        BPL.N    ??SPIFFS_write_17
        STR      R9,[R5, #+52]
        MOV      R0,R9
        B.N      ??SPIFFS_write_1
??SPIFFS_write_19:
        MOVS     R8,#+0
??SPIFFS_write_17:
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,#+0
        BEQ.N    ??SPIFFS_write_20
        LDR      R1,[SP, #+4]
        MOVS     R0,R5
        BL       spiffs_cache_page_allocate_by_fd
        LDR      R1,[SP, #+4]
        STR      R0,[R1, #+32]
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        CMP      R0,#+0
        BEQ.N    ??SPIFFS_write_20
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        STR      R7,[R0, #+12]
        MOVS     R0,#+0
        LDR      R1,[SP, #+4]
        LDR      R1,[R1, #+32]
        STRH     R0,[R1, #+16]
??SPIFFS_write_20:
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        CMP      R0,#+0
        BEQ.N    ??SPIFFS_write_21
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        LDR      R0,[R0, #+12]
        SUBS     R7,R7,R0
        LDR      R0,[R5, #+76]
        LDR      R0,[R0, #+16]
        LDR      R1,[SP, #+4]
        LDR      R1,[R1, #+32]
        LDRB     R1,[R1, #+1]
        MOVS     R2,#+148
        MLA      R0,R2,R1,R0
        ADDS     R0,R0,#+20
        MOVS     R2,R4
        ADDS     R5,R7,R0
        MOVS     R1,R6
        MOVS     R0,R5
        BL       __aeabi_memcpy
        ADDS     R0,R4,R7
        LDR      R1,[SP, #+4]
        LDR      R1,[R1, #+32]
        LDRH     R1,[R1, #+16]
        CMP      R0,R1
        BCS.N    ??SPIFFS_write_22
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        LDRH     R0,[R0, #+16]
        B.N      ??SPIFFS_write_23
??SPIFFS_write_22:
        ADDS     R0,R4,R7
??SPIFFS_write_23:
        LDR      R1,[SP, #+4]
        LDR      R1,[R1, #+32]
        STRH     R0,[R1, #+16]
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+24]
        ADDS     R0,R4,R0
        LDR      R1,[SP, #+4]
        STR      R0,[R1, #+24]
        MOVS     R0,R4
        B.N      ??SPIFFS_write_1
??SPIFFS_write_21:
        STR      R4,[SP, #+0]
        MOVS     R3,R7
        MOVS     R2,R6
        LDR      R1,[SP, #+4]
        MOVS     R0,R5
        BL       spiffs_hydro_write
        MOV      R9,R0
        CMP      R9,#+0
        BPL.N    ??SPIFFS_write_24
        STR      R9,[R5, #+52]
        MOV      R0,R9
        B.N      ??SPIFFS_write_1
??SPIFFS_write_24:
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+24]
        ADDS     R0,R4,R0
        LDR      R1,[SP, #+4]
        STR      R0,[R1, #+24]
        MOV      R0,R9
        B.N      ??SPIFFS_write_1
??SPIFFS_write_16:
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        CMP      R0,#+0
        BEQ.N    ??SPIFFS_write_15
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        LDRH     R0,[R0, #+16]
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        LDR      R3,[R0, #+12]
        LDR      R0,[R5, #+76]
        LDR      R0,[R0, #+16]
        LDR      R1,[SP, #+4]
        LDR      R1,[R1, #+32]
        LDRB     R1,[R1, #+1]
        MOVS     R2,#+148
        MLA      R0,R2,R1,R0
        ADDS     R2,R0,#+20
        LDR      R1,[SP, #+4]
        MOVS     R0,R5
        BL       spiffs_hydro_write
        MOV      R9,R0
        LDR      R0,[SP, #+4]
        LDR      R1,[R0, #+32]
        MOVS     R0,R5
        BL       spiffs_cache_fd_release
        CMP      R9,#+0
        BPL.N    ??SPIFFS_write_15
        STR      R9,[R5, #+52]
        MOV      R0,R9
        B.N      ??SPIFFS_write_1
??SPIFFS_write_15:
        STR      R4,[SP, #+0]
        MOVS     R3,R7
        MOVS     R2,R6
        LDR      R1,[SP, #+4]
        MOVS     R0,R5
        BL       spiffs_hydro_write
        MOV      R9,R0
        CMP      R9,#+0
        BPL.N    ??SPIFFS_write_25
        STR      R9,[R5, #+52]
        MOV      R0,R9
        B.N      ??SPIFFS_write_1
??SPIFFS_write_25:
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+24]
        ADDS     R0,R4,R0
        LDR      R1,[SP, #+4]
        STR      R0,[R1, #+24]
        MOV      R0,R9
??SPIFFS_write_1:
        POP      {R1-R9,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_lseek:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+16
        MOVS     R4,R0
        MOVS     R7,R1
        MOVS     R5,R2
        MOVS     R6,R3
        LDR      R0,[R4, #+108]
        LDR.N    R1,??DataTable10  ;; 0x20090315
        CMP      R0,R1
        BEQ.N    ??SPIFFS_lseek_0
        LDR.N    R0,??DataTable10_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.N    R0,??DataTable10_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_lseek_1
??SPIFFS_lseek_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_lseek_2
        LDR.W    R0,??DataTable12  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable12  ;; 0xffffd8f0
        B.N      ??SPIFFS_lseek_1
??SPIFFS_lseek_2:
        SXTH     R7,R7            ;; SignExt  R7,R7,#+16,#+16
        CMP      R7,#+0
        BEQ.N    ??SPIFFS_lseek_3
        LDRSH    R0,[R4, #+12]
        SUBS     R7,R7,R0
        B.N      ??SPIFFS_lseek_4
??SPIFFS_lseek_3:
        MOVS     R7,#+0
??SPIFFS_lseek_4:
        ADD      R2,SP,#+4
        MOVS     R1,R7
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_fd_get
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??SPIFFS_lseek_5
        STR      R8,[R4, #+52]
        MOV      R0,R8
        B.N      ??SPIFFS_lseek_1
??SPIFFS_lseek_5:
        MOVS     R1,R7
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_fflush_cache
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+8]
        CMN      R0,#+1
        BNE.N    ??SPIFFS_lseek_6
        MOVS     R0,#+0
        B.N      ??SPIFFS_lseek_7
??SPIFFS_lseek_6:
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+8]
??SPIFFS_lseek_7:
        CMP      R6,#+1
        BEQ.N    ??SPIFFS_lseek_8
        CMP      R6,#+2
        BEQ.N    ??SPIFFS_lseek_9
        B.N      ??SPIFFS_lseek_10
??SPIFFS_lseek_8:
        LDR      R1,[SP, #+4]
        LDR      R1,[R1, #+24]
        ADDS     R5,R1,R5
        B.N      ??SPIFFS_lseek_10
??SPIFFS_lseek_9:
        ADDS     R5,R0,R5
??SPIFFS_lseek_10:
        CMP      R0,R5
        BGE.N    ??SPIFFS_lseek_11
        LDR      R1,[SP, #+4]
        STR      R0,[R1, #+24]
        LDR.W    R8,??DataTable21  ;; 0xffffd8ed
??SPIFFS_lseek_11:
        CMP      R8,#+0
        BPL.N    ??SPIFFS_lseek_12
        STR      R8,[R4, #+52]
        MOV      R0,R8
        B.N      ??SPIFFS_lseek_1
??SPIFFS_lseek_12:
        MOVS     R0,#+123
        UDIV     R0,R5,R0
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        CMP      R0,#+39
        BCS.N    ??SPIFFS_lseek_13
        MOVS     R6,#+0
        B.N      ??SPIFFS_lseek_14
??SPIFFS_lseek_13:
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        SUBS     R0,R0,#+39
        MOVS     R1,#+60
        UDIV     R0,R0,R1
        ADDS     R6,R0,#+1
??SPIFFS_lseek_14:
        LDR      R0,[SP, #+4]
        LDRH     R0,[R0, #+16]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R0,R6
        BEQ.N    ??SPIFFS_lseek_15
        ADD      R0,SP,#+8
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,R6
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDR      R0,[SP, #+4]
        LDRH     R0,[R0, #+6]
        ORRS     R1,R0,#0x8000
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_id_and_span
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??SPIFFS_lseek_16
        STR      R8,[R4, #+52]
        MOV      R0,R8
        B.N      ??SPIFFS_lseek_1
??SPIFFS_lseek_16:
        LDR      R0,[SP, #+4]
        STRH     R6,[R0, #+16]
        LDRH     R0,[SP, #+8]
        LDR      R1,[SP, #+4]
        STRH     R0,[R1, #+14]
??SPIFFS_lseek_15:
        LDR      R0,[SP, #+4]
        STR      R5,[R0, #+24]
        MOVS     R0,R5
??SPIFFS_lseek_1:
        ADD      SP,SP,#+16
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_remove:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+16
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,[R4, #+108]
        LDR.N    R1,??DataTable10  ;; 0x20090315
        CMP      R0,R1
        BEQ.N    ??SPIFFS_remove_0
        LDR.N    R0,??DataTable10_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.N    R0,??DataTable10_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_remove_1
??SPIFFS_remove_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_remove_2
        LDR.N    R0,??DataTable12  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.N    R0,??DataTable12  ;; 0xffffd8f0
        B.N      ??SPIFFS_remove_1
??SPIFFS_remove_2:
        MOVS     R0,R5
        BL       strlen
        CMP      R0,#+32
        BCC.N    ??SPIFFS_remove_3
        LDR.N    R0,??DataTable13  ;; 0xffffd8cc
        STR      R0,[R4, #+52]
        LDR.N    R0,??DataTable13  ;; 0xffffd8cc
        B.N      ??SPIFFS_remove_1
??SPIFFS_remove_3:
        MOVS     R2,#+0
        ADD      R1,SP,#+4
        MOVS     R0,R4
        BL       spiffs_fd_find_new
        MOVS     R6,R0
        CMP      R6,#+0
        BPL.N    ??SPIFFS_remove_4
        STR      R6,[R4, #+52]
        MOVS     R0,R6
        B.N      ??SPIFFS_remove_1
??SPIFFS_remove_4:
        ADD      R2,SP,#+8
        MOVS     R1,R5
        MOVS     R0,R4
        BL       spiffs_object_find_object_index_header_by_name
        MOVS     R6,R0
        CMP      R6,#+0
        BEQ.N    ??SPIFFS_remove_5
        LDR      R0,[SP, #+4]
        LDRSH    R1,[R0, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
??SPIFFS_remove_5:
        CMP      R6,#+0
        BPL.N    ??SPIFFS_remove_6
        STR      R6,[R4, #+52]
        MOVS     R0,R6
        B.N      ??SPIFFS_remove_1
??SPIFFS_remove_6:
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        LDR      R2,[SP, #+4]
        LDRH     R1,[SP, #+8]
        MOVS     R0,R4
        BL       spiffs_object_open_by_page
        MOVS     R6,R0
        CMP      R6,#+0
        BEQ.N    ??SPIFFS_remove_7
        LDR      R0,[SP, #+4]
        LDRSH    R1,[R0, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
??SPIFFS_remove_7:
        CMP      R6,#+0
        BPL.N    ??SPIFFS_remove_8
        STR      R6,[R4, #+52]
        MOVS     R0,R6
        B.N      ??SPIFFS_remove_1
??SPIFFS_remove_8:
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR      R0,[SP, #+4]
        BL       spiffs_object_truncate
        MOVS     R6,R0
        CMP      R6,#+0
        BEQ.N    ??SPIFFS_remove_9
        LDR      R0,[SP, #+4]
        LDRSH    R1,[R0, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
??SPIFFS_remove_9:
        CMP      R6,#+0
        BPL.N    ??SPIFFS_remove_10
        STR      R6,[R4, #+52]
        MOVS     R0,R6
        B.N      ??SPIFFS_remove_1
??SPIFFS_remove_10:
        MOVS     R0,#+0
??SPIFFS_remove_1:
        ADD      SP,SP,#+16
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10:
        DC32     0x20090315

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_1:
        DC32     0xffffd8d8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable10_2:
        DC32     0xffffd8d6

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_fremove:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        LDR      R0,[R4, #+108]
        LDR.W    R2,??DataTable30  ;; 0x20090315
        CMP      R0,R2
        BEQ.N    ??SPIFFS_fremove_0
        LDR.W    R0,??DataTable30_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable30_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_fremove_1
??SPIFFS_fremove_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_fremove_2
        LDR.N    R0,??DataTable12  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.N    R0,??DataTable12  ;; 0xffffd8f0
        B.N      ??SPIFFS_fremove_1
??SPIFFS_fremove_2:
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??SPIFFS_fremove_3
        LDRSH    R0,[R4, #+12]
        SUBS     R1,R1,R0
        B.N      ??SPIFFS_fremove_4
??SPIFFS_fremove_3:
        MOVS     R1,#+0
??SPIFFS_fremove_4:
        ADD      R2,SP,#+0
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_fd_get
        CMP      R0,#+0
        BPL.N    ??SPIFFS_fremove_5
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_fremove_1
??SPIFFS_fremove_5:
        LDR      R0,[SP, #+0]
        LDRB     R0,[R0, #+28]
        LSLS     R0,R0,#+27
        BMI.N    ??SPIFFS_fremove_6
        LDR.W    R0,??DataTable26  ;; 0xffffd8db
        CMP      R0,#+0
        BPL.N    ??SPIFFS_fremove_6
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_fremove_1
??SPIFFS_fremove_6:
        LDR      R0,[SP, #+0]
        LDR      R1,[R0, #+32]
        MOVS     R0,R4
        BL       spiffs_cache_fd_release
        MOVS     R2,#+1
        MOVS     R1,#+0
        LDR      R0,[SP, #+0]
        BL       spiffs_object_truncate
        CMP      R0,#+0
        BPL.N    ??SPIFFS_fremove_7
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_fremove_1
??SPIFFS_fremove_7:
        MOVS     R0,#+0
??SPIFFS_fremove_1:
        POP      {R1,R2,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     0xffffd8d5

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_stat_pix:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+64
        MOVS     R6,R0
        MOVS     R4,R1
        MOVS     R7,R2
        MOVS     R5,R3
        ADD      R0,SP,#+12
        STR      R0,[SP, #+4]
        MOVS     R0,#+49
        STR      R0,[SP, #+0]
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R0,#+128
        MUL      R3,R0,R4
        MOVS     R2,R7
        SXTH     R2,R2            ;; SignExt  R2,R2,#+16,#+16
        MOVS     R1,#+22
        MOVS     R0,R6
        BL       spiffs_phys_rd
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??spiffs_stat_pix_0
        STR      R8,[R6, #+52]
        MOV      R0,R8
        B.N      ??spiffs_stat_pix_1
??spiffs_stat_pix_0:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R0,#+32
        SDIV     R0,R4,R0
        MOV      R1,#+4096
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R2,#+32
        SDIV     R3,R4,R2
        MLS      R3,R3,R2,R4
        SUBS     R2,R3,#+1
        LSLS     R2,R2,#+1
        MLA      R3,R1,R0,R2
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        MOVS     R2,R7
        SXTH     R2,R2            ;; SignExt  R2,R2,#+16,#+16
        MOVS     R1,#+20
        MOVS     R0,R6
        BL       spiffs_phys_rd
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??spiffs_stat_pix_2
        STR      R8,[R6, #+52]
        MOV      R0,R8
        B.N      ??spiffs_stat_pix_1
??spiffs_stat_pix_2:
        LDRH     R0,[SP, #+8]
        LSLS     R0,R0,#+17       ;; ZeroExtS R0,R0,#+17,#+17
        LSRS     R0,R0,#+17
        STRH     R0,[R5, #+0]
        LDRB     R0,[SP, #+24]
        STRB     R0,[R5, #+8]
        LDR      R0,[SP, #+20]
        CMN      R0,#+1
        BNE.N    ??spiffs_stat_pix_3
        MOVS     R0,#+0
        B.N      ??spiffs_stat_pix_4
??spiffs_stat_pix_3:
        LDR      R0,[SP, #+20]
??spiffs_stat_pix_4:
        STR      R0,[R5, #+4]
        STRH     R4,[R5, #+10]
        MOVS     R2,#+32
        ADD      R1,SP,#+25
        ADDS     R0,R5,#+12
        BL       strncpy
        MOVS     R2,#+4
        ADD      R1,SP,#+57
        ADDS     R4,R5,#+44
        MOVS     R0,R4
        BL       __aeabi_memcpy
        MOV      R0,R8
??spiffs_stat_pix_1:
        ADD      SP,SP,#+64
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_stat:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        LDR      R0,[R4, #+108]
        LDR.W    R1,??DataTable30  ;; 0x20090315
        CMP      R0,R1
        BEQ.N    ??SPIFFS_stat_0
        LDR.W    R0,??DataTable30_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable30_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_stat_1
??SPIFFS_stat_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_stat_2
        LDR.N    R0,??DataTable12  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.N    R0,??DataTable12  ;; 0xffffd8f0
        B.N      ??SPIFFS_stat_1
??SPIFFS_stat_2:
        MOVS     R0,R5
        BL       strlen
        CMP      R0,#+32
        BCC.N    ??SPIFFS_stat_3
        LDR.W    R0,??DataTable34  ;; 0xffffd8cc
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable34  ;; 0xffffd8cc
        B.N      ??SPIFFS_stat_1
??SPIFFS_stat_3:
        ADD      R2,SP,#+0
        MOVS     R1,R5
        MOVS     R0,R4
        BL       spiffs_object_find_object_index_header_by_name
        CMP      R0,#+0
        BPL.N    ??SPIFFS_stat_4
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_stat_1
??SPIFFS_stat_4:
        MOVS     R3,R6
        MOVS     R2,#+0
        LDRH     R1,[SP, #+0]
        MOVS     R0,R4
        BL       spiffs_stat_pix
??SPIFFS_stat_1:
        POP      {R1,R2,R4-R6,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0xffffd8f0

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_fstat:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        LDR      R0,[R4, #+108]
        LDR.W    R1,??DataTable30  ;; 0x20090315
        CMP      R0,R1
        BEQ.N    ??SPIFFS_fstat_0
        LDR.W    R0,??DataTable30_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable30_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_fstat_1
??SPIFFS_fstat_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_fstat_2
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        B.N      ??SPIFFS_fstat_1
??SPIFFS_fstat_2:
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.N    ??SPIFFS_fstat_3
        LDRSH    R0,[R4, #+12]
        SUBS     R5,R5,R0
        B.N      ??SPIFFS_fstat_4
??SPIFFS_fstat_3:
        MOVS     R5,#+0
??SPIFFS_fstat_4:
        ADD      R2,SP,#+0
        MOVS     R1,R5
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_fd_get
        CMP      R0,#+0
        BPL.N    ??SPIFFS_fstat_5
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_fstat_1
??SPIFFS_fstat_5:
        MOVS     R1,R5
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_fflush_cache
        MOVS     R3,R6
        MOVS     R2,R5
        SXTH     R2,R2            ;; SignExt  R2,R2,#+16,#+16
        LDR      R0,[SP, #+0]
        LDRH     R1,[R0, #+12]
        MOVS     R0,R4
        BL       spiffs_stat_pix
??SPIFFS_fstat_1:
        POP      {R1,R2,R4-R6,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     0xffffd8cc

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_fflush_cache:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+12
        MOVS     R4,R0
        MOVS     R5,#+0
        ADD      R2,SP,#+4
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_fd_get
        MOVS     R5,R0
        CMP      R5,#+0
        BPL.N    ??spiffs_fflush_cache_0
        STR      R5,[R4, #+52]
        MOVS     R0,R5
        B.N      ??spiffs_fflush_cache_1
??spiffs_fflush_cache_0:
        LDR      R0,[SP, #+4]
        LDRB     R0,[R0, #+28]
        LSLS     R0,R0,#+26
        BMI.N    ??spiffs_fflush_cache_2
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        CMP      R0,#+0
        BNE.N    ??spiffs_fflush_cache_3
        LDR      R1,[SP, #+4]
        MOVS     R0,R4
        BL       spiffs_cache_page_get_by_fd
        LDR      R1,[SP, #+4]
        STR      R0,[R1, #+32]
??spiffs_fflush_cache_3:
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        CMP      R0,#+0
        BEQ.N    ??spiffs_fflush_cache_2
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        LDRH     R0,[R0, #+16]
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+4]
        LDR      R0,[R0, #+32]
        LDR      R3,[R0, #+12]
        LDR      R0,[R4, #+76]
        LDR      R0,[R0, #+16]
        LDR      R1,[SP, #+4]
        LDR      R1,[R1, #+32]
        LDRB     R1,[R1, #+1]
        MOVS     R2,#+148
        MLA      R0,R2,R1,R0
        ADDS     R2,R0,#+20
        LDR      R1,[SP, #+4]
        MOVS     R0,R4
        BL       spiffs_hydro_write
        MOVS     R5,R0
        CMP      R5,#+0
        BPL.N    ??spiffs_fflush_cache_4
        STR      R5,[R4, #+52]
??spiffs_fflush_cache_4:
        LDR      R0,[SP, #+4]
        LDR      R1,[R0, #+32]
        MOVS     R0,R4
        BL       spiffs_cache_fd_release
??spiffs_fflush_cache_2:
        MOVS     R0,R5
??spiffs_fflush_cache_1:
        POP      {R1-R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_fflush:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,[R4, #+108]
        LDR.W    R2,??DataTable30  ;; 0x20090315
        CMP      R0,R2
        BEQ.N    ??SPIFFS_fflush_0
        LDR.W    R0,??DataTable30_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable30_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_fflush_1
??SPIFFS_fflush_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_fflush_2
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        B.N      ??SPIFFS_fflush_1
??SPIFFS_fflush_2:
        MOVS     R0,#+0
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??SPIFFS_fflush_3
        LDRSH    R0,[R4, #+12]
        SUBS     R1,R1,R0
        B.N      ??SPIFFS_fflush_4
??SPIFFS_fflush_3:
        MOVS     R1,#+0
??SPIFFS_fflush_4:
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_fflush_cache
        CMP      R0,#+0
        BPL.N    ??SPIFFS_fflush_5
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_fflush_1
??SPIFFS_fflush_5:
??SPIFFS_fflush_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     0xffffd8d2

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_close:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,[R4, #+108]
        LDR.W    R1,??DataTable30  ;; 0x20090315
        CMP      R0,R1
        BEQ.N    ??SPIFFS_close_0
        LDR.W    R0,??DataTable30_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable30_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_close_1
??SPIFFS_close_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_close_2
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        B.N      ??SPIFFS_close_1
??SPIFFS_close_2:
        MOVS     R0,#+0
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.N    ??SPIFFS_close_3
        LDRSH    R0,[R4, #+12]
        SUBS     R5,R5,R0
        B.N      ??SPIFFS_close_4
??SPIFFS_close_3:
        MOVS     R5,#+0
??SPIFFS_close_4:
        MOVS     R1,R5
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_fflush_cache
        CMP      R0,#+0
        BPL.N    ??SPIFFS_close_5
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_close_1
??SPIFFS_close_5:
        MOVS     R1,R5
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_fd_return
        CMP      R0,#+0
        BPL.N    ??SPIFFS_close_6
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_close_1
??SPIFFS_close_6:
??SPIFFS_close_1:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable15:
        DC32     0xffffd8ee

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_rename:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+28
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        LDR      R0,[R4, #+108]
        LDR.W    R1,??DataTable30  ;; 0x20090315
        CMP      R0,R1
        BEQ.N    ??SPIFFS_rename_0
        LDR.W    R0,??DataTable30_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable30_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_rename_1
??SPIFFS_rename_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_rename_2
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        B.N      ??SPIFFS_rename_1
??SPIFFS_rename_2:
        MOVS     R0,R6
        BL       strlen
        CMP      R0,#+32
        BCS.N    ??SPIFFS_rename_3
        MOVS     R0,R5
        BL       strlen
        CMP      R0,#+32
        BCC.N    ??SPIFFS_rename_4
??SPIFFS_rename_3:
        LDR.W    R0,??DataTable34  ;; 0xffffd8cc
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable34  ;; 0xffffd8cc
        B.N      ??SPIFFS_rename_1
??SPIFFS_rename_4:
        ADD      R2,SP,#+26
        MOVS     R1,R5
        MOVS     R0,R4
        BL       spiffs_object_find_object_index_header_by_name
        MOVS     R7,R0
        CMP      R7,#+0
        BPL.N    ??SPIFFS_rename_5
        STR      R7,[R4, #+52]
        MOVS     R0,R7
        B.N      ??SPIFFS_rename_1
??SPIFFS_rename_5:
        ADD      R2,SP,#+24
        MOVS     R1,R6
        MOVS     R0,R4
        BL       spiffs_object_find_object_index_header_by_name
        MOVS     R7,R0
        LDR.W    R0,??DataTable34_7  ;; 0xffffd8ee
        CMP      R7,R0
        BNE.N    ??SPIFFS_rename_6
        MOVS     R7,#+0
        B.N      ??SPIFFS_rename_7
??SPIFFS_rename_6:
        CMP      R7,#+0
        BNE.N    ??SPIFFS_rename_7
        LDR.W    R7,??DataTable34_8  ;; 0xffffd8d9
??SPIFFS_rename_7:
        CMP      R7,#+0
        BPL.N    ??SPIFFS_rename_8
        STR      R7,[R4, #+52]
        MOVS     R0,R7
        B.N      ??SPIFFS_rename_1
??SPIFFS_rename_8:
        MOVS     R2,#+0
        ADD      R1,SP,#+20
        MOVS     R0,R4
        BL       spiffs_fd_find_new
        MOVS     R7,R0
        CMP      R7,#+0
        BPL.N    ??SPIFFS_rename_9
        STR      R7,[R4, #+52]
        MOVS     R0,R7
        B.N      ??SPIFFS_rename_1
??SPIFFS_rename_9:
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        LDR      R2,[SP, #+20]
        LDRH     R1,[SP, #+26]
        MOVS     R0,R4
        BL       spiffs_object_open_by_page
        MOVS     R7,R0
        CMP      R7,#+0
        BEQ.N    ??SPIFFS_rename_10
        LDR      R0,[SP, #+20]
        LDRSH    R1,[R0, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
??SPIFFS_rename_10:
        CMP      R7,#+0
        BPL.N    ??SPIFFS_rename_11
        STR      R7,[R4, #+52]
        MOVS     R0,R7
        B.N      ??SPIFFS_rename_1
??SPIFFS_rename_11:
        ADD      R0,SP,#+24
        STR      R0,[SP, #+16]
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        STR      R6,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+20]
        LDRH     R3,[R0, #+12]
        LDR      R0,[SP, #+20]
        LDRH     R2,[R0, #+6]
        LDR      R1,[SP, #+20]
        MOVS     R0,R4
        BL       spiffs_object_update_index_hdr
        MOVS     R7,R0
        CMP      R7,#+0
        BNE.N    ??SPIFFS_rename_12
        MOVS     R2,R6
        MOVS     R1,R5
        MOVS     R0,R4
        BL       spiffs_fd_temporal_cache_rehash
??SPIFFS_rename_12:
        LDR      R0,[SP, #+20]
        LDRSH    R1,[R0, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
        CMP      R7,#+0
        BPL.N    ??SPIFFS_rename_13
        STR      R7,[R4, #+52]
        MOVS     R0,R7
        B.N      ??SPIFFS_rename_1
??SPIFFS_rename_13:
        MOVS     R0,R7
??SPIFFS_rename_1:
        ADD      SP,SP,#+28
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_update_meta:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+32
        MOVS     R4,R0
        MOVS     R5,R2
        LDR      R0,[R4, #+108]
        LDR.W    R2,??DataTable30  ;; 0x20090315
        CMP      R0,R2
        BEQ.N    ??SPIFFS_update_meta_0
        LDR.W    R0,??DataTable30_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable30_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_update_meta_1
??SPIFFS_update_meta_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_update_meta_2
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        B.N      ??SPIFFS_update_meta_1
??SPIFFS_update_meta_2:
        ADD      R2,SP,#+24
        MOVS     R0,R4
        BL       spiffs_object_find_object_index_header_by_name
        MOVS     R6,R0
        CMP      R6,#+0
        BPL.N    ??SPIFFS_update_meta_3
        STR      R6,[R4, #+52]
        MOVS     R0,R6
        B.N      ??SPIFFS_update_meta_1
??SPIFFS_update_meta_3:
        MOVS     R2,#+0
        ADD      R1,SP,#+20
        MOVS     R0,R4
        BL       spiffs_fd_find_new
        MOVS     R6,R0
        CMP      R6,#+0
        BPL.N    ??SPIFFS_update_meta_4
        STR      R6,[R4, #+52]
        MOVS     R0,R6
        B.N      ??SPIFFS_update_meta_1
??SPIFFS_update_meta_4:
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        LDR      R2,[SP, #+20]
        LDRH     R1,[SP, #+24]
        MOVS     R0,R4
        BL       spiffs_object_open_by_page
        MOVS     R6,R0
        CMP      R6,#+0
        BEQ.N    ??SPIFFS_update_meta_5
        LDR      R0,[SP, #+20]
        LDRSH    R1,[R0, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
??SPIFFS_update_meta_5:
        CMP      R6,#+0
        BPL.N    ??SPIFFS_update_meta_6
        STR      R6,[R4, #+52]
        MOVS     R0,R6
        B.N      ??SPIFFS_update_meta_1
??SPIFFS_update_meta_6:
        ADD      R0,SP,#+26
        STR      R0,[SP, #+16]
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        STR      R5,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+20]
        LDRH     R3,[R0, #+12]
        LDR      R0,[SP, #+20]
        LDRH     R2,[R0, #+6]
        LDR      R1,[SP, #+20]
        MOVS     R0,R4
        BL       spiffs_object_update_index_hdr
        MOVS     R6,R0
        LDR      R0,[SP, #+20]
        LDRSH    R1,[R0, #+4]
        MOVS     R0,R4
        BL       spiffs_fd_return
        CMP      R6,#+0
        BPL.N    ??SPIFFS_update_meta_7
        STR      R6,[R4, #+52]
        MOVS     R0,R6
        B.N      ??SPIFFS_update_meta_1
??SPIFFS_update_meta_7:
        MOVS     R0,R6
??SPIFFS_update_meta_1:
        ADD      SP,SP,#+32
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17:
        DC32     0xffffd8e4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_1:
        DC32     0xffffd8ec

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_2:
        DC32     0xffffd8eb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_3:
        DC32     0xffffd8ea

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17_4:
        DC32     0xffffd8e3

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_fupdate_meta:
        PUSH     {R4,R5,LR}
        SUB      SP,SP,#+28
        MOVS     R4,R0
        MOVS     R5,R2
        LDR      R0,[R4, #+108]
        LDR.W    R2,??DataTable30  ;; 0x20090315
        CMP      R0,R2
        BEQ.N    ??SPIFFS_fupdate_meta_0
        LDR.W    R0,??DataTable30_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable30_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_fupdate_meta_1
??SPIFFS_fupdate_meta_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_fupdate_meta_2
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        B.N      ??SPIFFS_fupdate_meta_1
??SPIFFS_fupdate_meta_2:
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??SPIFFS_fupdate_meta_3
        LDRSH    R0,[R4, #+12]
        SUBS     R1,R1,R0
        B.N      ??SPIFFS_fupdate_meta_4
??SPIFFS_fupdate_meta_3:
        MOVS     R1,#+0
??SPIFFS_fupdate_meta_4:
        ADD      R2,SP,#+20
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_fd_get
        CMP      R0,#+0
        BPL.N    ??SPIFFS_fupdate_meta_5
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_fupdate_meta_1
??SPIFFS_fupdate_meta_5:
        LDR      R0,[SP, #+20]
        LDRB     R0,[R0, #+28]
        LSLS     R0,R0,#+27
        BMI.N    ??SPIFFS_fupdate_meta_6
        LDR.N    R0,??DataTable26  ;; 0xffffd8db
        CMP      R0,#+0
        BPL.N    ??SPIFFS_fupdate_meta_6
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_fupdate_meta_1
??SPIFFS_fupdate_meta_6:
        ADD      R0,SP,#+24
        STR      R0,[SP, #+16]
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        STR      R5,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+20]
        LDRH     R3,[R0, #+12]
        LDR      R0,[SP, #+20]
        LDRH     R2,[R0, #+6]
        LDR      R1,[SP, #+20]
        MOVS     R0,R4
        BL       spiffs_object_update_index_hdr
        CMP      R0,#+0
        BPL.N    ??SPIFFS_fupdate_meta_7
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_fupdate_meta_1
??SPIFFS_fupdate_meta_7:
??SPIFFS_fupdate_meta_1:
        ADD      SP,SP,#+28
        POP      {R4,R5,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18:
        DC32     0xffffd8d1

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_opendir:
        LDR      R1,[R0, #+108]
        LDR.W    R3,??DataTable30  ;; 0x20090315
        CMP      R1,R3
        BEQ.N    ??SPIFFS_opendir_0
        LDR.W    R1,??DataTable30_1  ;; 0xffffd8d8
        STR      R1,[R0, #+52]
        MOVS     R0,#+0
        B.N      ??SPIFFS_opendir_1
??SPIFFS_opendir_0:
        LDRB     R1,[R0, #+100]
        CMP      R1,#+0
        BNE.N    ??SPIFFS_opendir_2
        LDR.W    R1,??DataTable34_1  ;; 0xffffd8f0
        STR      R1,[R0, #+52]
        MOVS     R0,#+0
        B.N      ??SPIFFS_opendir_1
??SPIFFS_opendir_2:
        STR      R0,[R2, #+0]
        MOVS     R0,#+0
        STRH     R0,[R2, #+4]
        MOVS     R0,#+0
        STR      R0,[R2, #+8]
        MOVS     R0,R2
??SPIFFS_opendir_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19:
        DC32     0xffffd8da

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_read_dir_v:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+64
        MOVS     R4,R1
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVW     R1,#+65535
        CMP      R4,R1
        BEQ.N    ??spiffs_read_dir_v_0
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+0
        BEQ.N    ??spiffs_read_dir_v_0
        LSLS     R1,R4,#+16
        BMI.N    ??spiffs_read_dir_v_1
??spiffs_read_dir_v_0:
        LDR.W    R0,??DataTable34_9  ;; 0xffffd8aa
        B.N      ??spiffs_read_dir_v_2
??spiffs_read_dir_v_1:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ADDS     R1,R3,R2, LSL #+5
        ADDS     R5,R1,#+1
        ADD      R1,SP,#+8
        STR      R1,[SP, #+4]
        MOVS     R1,#+49
        STR      R1,[SP, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R1,#+128
        MUL      R3,R1,R5
        MOVS     R2,#+0
        MOVS     R1,#+21
        BL       spiffs_phys_rd
        CMP      R0,#+0
        BNE.N    ??spiffs_read_dir_v_2
??spiffs_read_dir_v_3:
        LSLS     R0,R4,#+16
        BPL.N    ??spiffs_read_dir_v_4
        LDRH     R0,[SP, #+10]
        CMP      R0,#+0
        BNE.N    ??spiffs_read_dir_v_4
        LDRB     R0,[SP, #+12]
        ANDS     R0,R0,#0xC2
        CMP      R0,#+192
        BNE.N    ??spiffs_read_dir_v_4
        LDR      R6,[SP, #+84]
        STRH     R4,[R6, #+0]
        ADD      R1,SP,#+21
        ADDS     R0,R6,#+2
        BL       strcpy
        LDRB     R0,[SP, #+20]
        STRB     R0,[R6, #+34]
        LDR      R0,[SP, #+16]
        CMN      R0,#+1
        BNE.N    ??spiffs_read_dir_v_5
        MOVS     R0,#+0
        B.N      ??spiffs_read_dir_v_6
??spiffs_read_dir_v_5:
        LDR      R0,[SP, #+16]
??spiffs_read_dir_v_6:
        STR      R0,[R6, #+36]
        STRH     R5,[R6, #+40]
        MOVS     R2,#+4
        ADD      R1,SP,#+53
        ADDS     R4,R6,#+42
        MOVS     R0,R4
        BL       __aeabi_memcpy
        MOVS     R0,#+0
        B.N      ??spiffs_read_dir_v_2
??spiffs_read_dir_v_4:
        LDR.W    R0,??DataTable34_9  ;; 0xffffd8aa
??spiffs_read_dir_v_2:
        ADD      SP,SP,#+64
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_readdir:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+32
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,[R4, #+0]
        LDRB     R0,[R0, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_readdir_0
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        LDR      R1,[R4, #+0]
        STR      R0,[R1, #+52]
        MOVS     R0,#+0
        B.N      ??SPIFFS_readdir_1
??SPIFFS_readdir_0:
        MOVS     R6,#+0
        ADD      R0,SP,#+28
        STR      R0,[SP, #+20]
        ADD      R0,SP,#+24
        STR      R0,[SP, #+16]
        STR      R5,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        LDR.W    R0,??DataTable34_10
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+4
        LDR      R2,[R4, #+8]
        LDRH     R1,[R4, #+4]
        LDR      R0,[R4, #+0]
        BL       spiffs_obj_lu_find_entry_visitor
        CMP      R0,#+0
        BNE.N    ??SPIFFS_readdir_2
        LDRH     R0,[SP, #+24]
        STRH     R0,[R4, #+4]
        LDR      R0,[SP, #+28]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+8]
        LDRH     R0,[R5, #+0]
        LSLS     R0,R0,#+17       ;; ZeroExtS R0,R0,#+17,#+17
        LSRS     R0,R0,#+17
        STRH     R0,[R5, #+0]
        MOVS     R6,R5
        B.N      ??SPIFFS_readdir_3
??SPIFFS_readdir_2:
        LDR      R1,[R4, #+0]
        STR      R0,[R1, #+52]
??SPIFFS_readdir_3:
        MOVS     R0,R6
??SPIFFS_readdir_1:
        ADD      SP,SP,#+32
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable21:
        DC32     0xffffd8ed

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_closedir:
        LDR      R1,[R0, #+0]
        LDR      R1,[R1, #+108]
        LDR.W    R2,??DataTable30  ;; 0x20090315
        CMP      R1,R2
        BEQ.N    ??SPIFFS_closedir_0
        LDR.W    R1,??DataTable30_1  ;; 0xffffd8d8
        LDR      R0,[R0, #+0]
        STR      R1,[R0, #+52]
        LDR.W    R0,??DataTable30_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_closedir_1
??SPIFFS_closedir_0:
        LDR      R1,[R0, #+0]
        LDRB     R1,[R1, #+100]
        CMP      R1,#+0
        BNE.N    ??SPIFFS_closedir_2
        LDR.W    R1,??DataTable34_1  ;; 0xffffd8f0
        LDR      R0,[R0, #+0]
        STR      R1,[R0, #+52]
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        B.N      ??SPIFFS_closedir_1
??SPIFFS_closedir_2:
        MOVS     R0,#+0
??SPIFFS_closedir_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_check:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,[R4, #+108]
        LDR.N    R1,??DataTable30  ;; 0x20090315
        CMP      R0,R1
        BEQ.N    ??SPIFFS_check_0
        LDR.N    R0,??DataTable30_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.N    R0,??DataTable30_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_check_1
??SPIFFS_check_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_check_2
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        B.N      ??SPIFFS_check_1
??SPIFFS_check_2:
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       spiffs_lookup_consistency_check
        MOVS     R0,R4
        BL       spiffs_object_index_consistency_check
        MOVS     R0,R4
        BL       spiffs_page_consistency_check
        MOVS     R0,R4
        BL       spiffs_obj_lu_scan
??SPIFFS_check_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_info:
        PUSH     {R4-R7}
        MOVS     R3,#+0
        LDR      R4,[R0, #+108]
        LDR.N    R5,??DataTable30  ;; 0x20090315
        CMP      R4,R5
        BEQ.N    ??SPIFFS_info_0
        LDR.N    R1,??DataTable30_1  ;; 0xffffd8d8
        STR      R1,[R0, #+52]
        LDR.N    R0,??DataTable30_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_info_1
??SPIFFS_info_0:
        LDRB     R4,[R0, #+100]
        CMP      R4,#+0
        BNE.N    ??SPIFFS_info_2
        LDR.W    R1,??DataTable34_1  ;; 0xffffd8f0
        STR      R1,[R0, #+52]
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        B.N      ??SPIFFS_info_1
??SPIFFS_info_2:
        MOVS     R4,#+32
        LDR      R5,[R0, #+16]
        MOVS     R6,#+1
        MOVS     R7,#+123
        SUBS     R5,R5,#+2
        SUBS     R4,R4,R6
        MUL      R4,R4,R5
        ADDS     R4,R4,#+1
        CMP      R1,#+0
        BEQ.N    ??SPIFFS_info_3
        MULS     R4,R7,R4
        STR      R4,[R1, #+0]
??SPIFFS_info_3:
        CMP      R2,#+0
        BEQ.N    ??SPIFFS_info_4
        LDR      R0,[R0, #+60]
        MULS     R0,R7,R0
        STR      R0,[R2, #+0]
??SPIFFS_info_4:
        MOVS     R0,R3
??SPIFFS_info_1:
        POP      {R4-R7}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_gc_quick:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,[R4, #+108]
        LDR.N    R2,??DataTable30  ;; 0x20090315
        CMP      R0,R2
        BEQ.N    ??SPIFFS_gc_quick_0
        LDR.N    R0,??DataTable30_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.N    R0,??DataTable30_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_gc_quick_1
??SPIFFS_gc_quick_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_gc_quick_2
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        B.N      ??SPIFFS_gc_quick_1
??SPIFFS_gc_quick_2:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_gc_quick
        CMP      R0,#+0
        BPL.N    ??SPIFFS_gc_quick_3
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_gc_quick_1
??SPIFFS_gc_quick_3:
        MOVS     R0,#+0
??SPIFFS_gc_quick_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_gc:
        PUSH     {R4,LR}
        MOVS     R4,R0
        LDR      R0,[R4, #+108]
        LDR.N    R2,??DataTable30  ;; 0x20090315
        CMP      R0,R2
        BEQ.N    ??SPIFFS_gc_0
        LDR.N    R0,??DataTable30_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.N    R0,??DataTable30_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_gc_1
??SPIFFS_gc_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_gc_2
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        B.N      ??SPIFFS_gc_1
??SPIFFS_gc_2:
        MOVS     R0,R4
        BL       spiffs_gc_check
        CMP      R0,#+0
        BPL.N    ??SPIFFS_gc_3
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_gc_1
??SPIFFS_gc_3:
        MOVS     R0,#+0
??SPIFFS_gc_1:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable26:
        DC32     0xffffd8db

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_eof:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,[R4, #+108]
        LDR.N    R1,??DataTable30  ;; 0x20090315
        CMP      R0,R1
        BEQ.N    ??SPIFFS_eof_0
        LDR.N    R0,??DataTable30_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.N    R0,??DataTable30_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_eof_1
??SPIFFS_eof_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_eof_2
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        B.N      ??SPIFFS_eof_1
??SPIFFS_eof_2:
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.N    ??SPIFFS_eof_3
        LDRSH    R0,[R4, #+12]
        SUBS     R5,R5,R0
        B.N      ??SPIFFS_eof_4
??SPIFFS_eof_3:
        MOVS     R5,#+0
??SPIFFS_eof_4:
        ADD      R2,SP,#+0
        MOVS     R1,R5
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_fd_get
        CMP      R0,#+0
        BPL.N    ??SPIFFS_eof_5
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_eof_1
??SPIFFS_eof_5:
        MOVS     R1,R5
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_fflush_cache
        CMP      R0,#+0
        BPL.N    ??SPIFFS_eof_6
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_eof_1
??SPIFFS_eof_6:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+8]
        CMN      R0,#+1
        BNE.N    ??SPIFFS_eof_7
        MOVS     R0,#+0
        B.N      ??SPIFFS_eof_8
??SPIFFS_eof_7:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+8]
??SPIFFS_eof_8:
        LDR      R1,[SP, #+0]
        LDR      R1,[R1, #+24]
        CMP      R1,R0
        BCC.N    ??SPIFFS_eof_9
        MOVS     R0,#+1
        B.N      ??SPIFFS_eof_10
??SPIFFS_eof_9:
        MOVS     R0,#+0
??SPIFFS_eof_10:
??SPIFFS_eof_1:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_tell:
        PUSH     {R3-R5,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R0,[R4, #+108]
        LDR.N    R1,??DataTable30  ;; 0x20090315
        CMP      R0,R1
        BEQ.N    ??SPIFFS_tell_0
        LDR.N    R0,??DataTable30_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.N    R0,??DataTable30_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_tell_1
??SPIFFS_tell_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_tell_2
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        B.N      ??SPIFFS_tell_1
??SPIFFS_tell_2:
        SXTH     R5,R5            ;; SignExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.N    ??SPIFFS_tell_3
        LDRSH    R0,[R4, #+12]
        SUBS     R5,R5,R0
        B.N      ??SPIFFS_tell_4
??SPIFFS_tell_3:
        MOVS     R5,#+0
??SPIFFS_tell_4:
        ADD      R2,SP,#+0
        MOVS     R1,R5
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_fd_get
        CMP      R0,#+0
        BPL.N    ??SPIFFS_tell_5
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_tell_1
??SPIFFS_tell_5:
        MOVS     R1,R5
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_fflush_cache
        CMP      R0,#+0
        BPL.N    ??SPIFFS_tell_6
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_tell_1
??SPIFFS_tell_6:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+24]
??SPIFFS_tell_1:
        POP      {R1,R4,R5,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_set_file_callback_func:
        STR      R1,[R0, #+96]
        MOVS     R0,#+0
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_ix_map:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R2
        MOVS     R6,R3
        LDR      R0,[R4, #+108]
        LDR.N    R2,??DataTable30  ;; 0x20090315
        CMP      R0,R2
        BEQ.N    ??SPIFFS_ix_map_0
        LDR.N    R0,??DataTable30_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.N    R0,??DataTable30_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_ix_map_1
??SPIFFS_ix_map_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_ix_map_2
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        B.N      ??SPIFFS_ix_map_1
??SPIFFS_ix_map_2:
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??SPIFFS_ix_map_3
        LDRSH    R0,[R4, #+12]
        SUBS     R1,R1,R0
        B.N      ??SPIFFS_ix_map_4
??SPIFFS_ix_map_3:
        MOVS     R1,#+0
??SPIFFS_ix_map_4:
        ADD      R2,SP,#+0
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_fd_get
        CMP      R0,#+0
        BPL.N    ??SPIFFS_ix_map_5
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_ix_map_1
??SPIFFS_ix_map_5:
        LDR      R0,[SP, #+0]
        LDR      R0,[R0, #+44]
        CMP      R0,#+0
        BEQ.N    ??SPIFFS_ix_map_6
        LDR.W    R0,??DataTable34_11  ;; 0xffffd8ca
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable34_11  ;; 0xffffd8ca
        B.N      ??SPIFFS_ix_map_1
??SPIFFS_ix_map_6:
        LDR      R7,[SP, #+28]
        STR      R7,[R5, #+0]
        STR      R6,[R5, #+4]
        MOVS     R0,#+123
        UDIV     R0,R6,R0
        STRH     R0,[R5, #+8]
        LDR      R0,[SP, #+24]
        ADDS     R0,R0,R6
        MOVS     R1,#+123
        UDIV     R0,R0,R1
        STRH     R0,[R5, #+10]
        LDRH     R0,[R5, #+10]
        LDRH     R1,[R5, #+8]
        SUBS     R0,R0,R1
        ADDS     R0,R0,#+1
        LSLS     R1,R0,#+1
        MOVS     R2,#+0
        MOVS     R0,R7
        BL       __aeabi_memset
        LDR      R0,[SP, #+0]
        STR      R5,[R0, #+44]
        LDRH     R0,[R5, #+10]
        LDRH     R1,[R5, #+8]
        SUBS     R0,R0,R1
        ADDS     R3,R0,#+1
        MOVS     R2,#+0
        LDR      R1,[SP, #+0]
        MOVS     R0,R4
        BL       spiffs_populate_ix_map
        CMP      R0,#+0
        BPL.N    ??SPIFFS_ix_map_7
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_ix_map_1
??SPIFFS_ix_map_7:
??SPIFFS_ix_map_1:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_ix_unmap:
        PUSH     {R4,LR}
        SUB      SP,SP,#+8
        MOVS     R4,R0
        LDR      R0,[R4, #+108]
        LDR.N    R2,??DataTable30  ;; 0x20090315
        CMP      R0,R2
        BEQ.N    ??SPIFFS_ix_unmap_0
        LDR.N    R0,??DataTable30_1  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.N    R0,??DataTable30_1  ;; 0xffffd8d8
        B.N      ??SPIFFS_ix_unmap_1
??SPIFFS_ix_unmap_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_ix_unmap_2
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.W    R0,??DataTable34_1  ;; 0xffffd8f0
        B.N      ??SPIFFS_ix_unmap_1
??SPIFFS_ix_unmap_2:
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??SPIFFS_ix_unmap_3
        LDRSH    R0,[R4, #+12]
        SUBS     R1,R1,R0
        B.N      ??SPIFFS_ix_unmap_4
??SPIFFS_ix_unmap_3:
        MOVS     R1,#+0
??SPIFFS_ix_unmap_4:
        ADD      R2,SP,#+0
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_fd_get
        CMP      R0,#+0
        BPL.N    ??SPIFFS_ix_unmap_5
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_ix_unmap_1
??SPIFFS_ix_unmap_5:
        LDR      R1,[SP, #+0]
        LDR      R1,[R1, #+44]
        CMP      R1,#+0
        BNE.N    ??SPIFFS_ix_unmap_6
        LDR.W    R0,??DataTable34_12  ;; 0xffffd8cb
        STR      R0,[R4, #+52]
        LDR.N    R0,??DataTable34_12  ;; 0xffffd8cb
        B.N      ??SPIFFS_ix_unmap_1
??SPIFFS_ix_unmap_6:
        MOVS     R1,#+0
        LDR      R2,[SP, #+0]
        STR      R1,[R2, #+44]
??SPIFFS_ix_unmap_1:
        POP      {R1,R2,R4,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30:
        DC32     0x20090315

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable30_1:
        DC32     0xffffd8d8

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_ix_remap:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R7,R2
        MOVS     R0,#+0
        LDR      R0,[R4, #+108]
        LDR.N    R2,??DataTable34_13  ;; 0x20090315
        CMP      R0,R2
        BEQ.N    ??SPIFFS_ix_remap_0
        LDR.N    R0,??DataTable34_14  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.N    R0,??DataTable34_14  ;; 0xffffd8d8
        B.N      ??SPIFFS_ix_remap_1
??SPIFFS_ix_remap_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_ix_remap_2
        LDR.N    R0,??DataTable34_1  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.N    R0,??DataTable34_1  ;; 0xffffd8f0
        B.N      ??SPIFFS_ix_remap_1
??SPIFFS_ix_remap_2:
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BEQ.N    ??SPIFFS_ix_remap_3
        LDRSH    R0,[R4, #+12]
        SUBS     R1,R1,R0
        B.N      ??SPIFFS_ix_remap_4
??SPIFFS_ix_remap_3:
        MOVS     R1,#+0
??SPIFFS_ix_remap_4:
        ADD      R2,SP,#+0
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_fd_get
        CMP      R0,#+0
        BPL.N    ??SPIFFS_ix_remap_5
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_ix_remap_1
??SPIFFS_ix_remap_5:
        LDR      R1,[SP, #+0]
        LDR      R1,[R1, #+44]
        CMP      R1,#+0
        BNE.N    ??SPIFFS_ix_remap_6
        LDR.N    R0,??DataTable34_12  ;; 0xffffd8cb
        STR      R0,[R4, #+52]
        LDR.N    R0,??DataTable34_12  ;; 0xffffd8cb
        B.N      ??SPIFFS_ix_remap_1
??SPIFFS_ix_remap_6:
        LDR      R1,[SP, #+0]
        LDR      R5,[R1, #+44]
        MOVS     R1,#+123
        UDIV     R1,R7,R1
        LDRH     R2,[R5, #+8]
        SUBS     R6,R1,R2
        STR      R7,[R5, #+4]
        CMP      R6,#+0
        BEQ.N    ??SPIFFS_ix_remap_7
        LDRH     R0,[R5, #+10]
        LDRH     R1,[R5, #+8]
        SUBS     R0,R0,R1
        ADDS     R7,R0,#+1
        LDRH     R0,[R5, #+8]
        ADDS     R0,R6,R0
        STRH     R0,[R5, #+8]
        LDRH     R0,[R5, #+10]
        ADDS     R0,R6,R0
        STRH     R0,[R5, #+10]
        CMP      R6,R7
        BLT.N    ??SPIFFS_ix_remap_8
        LSLS     R1,R7,#+1
        MOVS     R2,#+0
        MOVS     R0,R5
        BL       __aeabi_memset
        SUBS     R3,R7,#+1
        MOVS     R2,#+0
        LDR      R1,[SP, #+0]
        MOVS     R0,R4
        BL       spiffs_populate_ix_map
        CMP      R0,#+0
        BPL.N    ??SPIFFS_ix_remap_7
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_ix_remap_1
??SPIFFS_ix_remap_8:
        CMP      R6,#+1
        BLT.N    ??SPIFFS_ix_remap_9
        MOVS     R0,#+0
        B.N      ??SPIFFS_ix_remap_10
??SPIFFS_ix_remap_11:
        LDR      R1,[R5, #+0]
        ADDS     R2,R6,R0
        LDRH     R1,[R1, R2, LSL #+1]
        LDR      R2,[R5, #+0]
        STRH     R1,[R2, R0, LSL #+1]
        ADDS     R0,R0,#+1
??SPIFFS_ix_remap_10:
        SUBS     R1,R7,R6
        CMP      R0,R1
        BLT.N    ??SPIFFS_ix_remap_11
        LSLS     R1,R6,#+1
        MOVS     R2,#+0
        LDR      R0,[R5, #+0]
        SUBS     R3,R7,R6
        ADDS     R5,R0,R3, LSL #+1
        MOVS     R0,R5
        BL       __aeabi_memset
        SUBS     R3,R7,#+1
        SUBS     R2,R7,R6
        LDR      R1,[SP, #+0]
        MOVS     R0,R4
        BL       spiffs_populate_ix_map
        CMP      R0,#+0
        BPL.N    ??SPIFFS_ix_remap_7
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_ix_remap_1
??SPIFFS_ix_remap_9:
        SUBS     R0,R7,#+1
        B.N      ??SPIFFS_ix_remap_12
??SPIFFS_ix_remap_13:
        LDR      R1,[R5, #+0]
        ADDS     R2,R6,R0
        LDRH     R1,[R1, R2, LSL #+1]
        LDR      R2,[R5, #+0]
        STRH     R1,[R2, R0, LSL #+1]
        SUBS     R0,R0,#+1
??SPIFFS_ix_remap_12:
        CMN      R0,R6
        BGE.N    ??SPIFFS_ix_remap_13
        RSBS     R0,R6,#+0
        LSLS     R1,R0,#+1
        MOVS     R2,#+0
        LDR      R5,[R5, #+0]
        MOVS     R0,R5
        BL       __aeabi_memset
        MOVS     R0,#-1
        SUBS     R3,R0,R6
        MOVS     R2,#+0
        LDR      R1,[SP, #+0]
        MOVS     R0,R4
        BL       spiffs_populate_ix_map
        CMP      R0,#+0
        BPL.N    ??SPIFFS_ix_remap_7
        STR      R0,[R4, #+52]
        B.N      ??SPIFFS_ix_remap_1
??SPIFFS_ix_remap_7:
??SPIFFS_ix_remap_1:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_bytes_to_ix_map_entries:
        LDR      R2,[R0, #+108]
        LDR.N    R3,??DataTable34_13  ;; 0x20090315
        CMP      R2,R3
        BEQ.N    ??SPIFFS_bytes_to_ix_map_entries_0
        LDR.N    R1,??DataTable34_14  ;; 0xffffd8d8
        STR      R1,[R0, #+52]
        LDR.N    R0,??DataTable34_14  ;; 0xffffd8d8
        B.N      ??SPIFFS_bytes_to_ix_map_entries_1
??SPIFFS_bytes_to_ix_map_entries_0:
        ADDS     R0,R1,#+123
        MOVS     R1,#+123
        UDIV     R0,R0,R1
??SPIFFS_bytes_to_ix_map_entries_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_ix_map_entries_to_bytes:
        LDR      R2,[R0, #+108]
        LDR.N    R3,??DataTable34_13  ;; 0x20090315
        CMP      R2,R3
        BEQ.N    ??SPIFFS_ix_map_entries_to_bytes_0
        LDR.N    R1,??DataTable34_14  ;; 0xffffd8d8
        STR      R1,[R0, #+52]
        LDR.N    R0,??DataTable34_14  ;; 0xffffd8d8
        B.N      ??SPIFFS_ix_map_entries_to_bytes_1
??SPIFFS_ix_map_entries_to_bytes_0:
        MOVS     R0,#+123
        MUL      R0,R0,R1
??SPIFFS_ix_map_entries_to_bytes_1:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
SPIFFS_vis:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+20
        MOVS     R4,R0
        MOVS     R6,#+0
        LDR      R0,[R4, #+108]
        LDR.N    R1,??DataTable34_13  ;; 0x20090315
        CMP      R0,R1
        BEQ.N    ??SPIFFS_vis_0
        LDR.N    R0,??DataTable34_14  ;; 0xffffd8d8
        STR      R0,[R4, #+52]
        LDR.N    R0,??DataTable34_14  ;; 0xffffd8d8
        B.N      ??SPIFFS_vis_1
??SPIFFS_vis_0:
        LDRB     R0,[R4, #+100]
        CMP      R0,#+0
        BNE.N    ??SPIFFS_vis_2
        LDR.N    R0,??DataTable34_1  ;; 0xffffd8f0
        STR      R0,[R4, #+52]
        LDR.N    R0,??DataTable34_1  ;; 0xffffd8f0
        B.N      ??SPIFFS_vis_1
??SPIFFS_vis_2:
        MOVS     R5,#+64
        LDR      R0,[R4, #+36]
        STR      R0,[SP, #+12]
        MOVS     R7,#+0
        B.N      ??SPIFFS_vis_3
??SPIFFS_vis_4:
        LDR.N    R0,??DataTable34_15
        BL       printf
??SPIFFS_vis_5:
        ADDS     R7,R7,#+1
??SPIFFS_vis_3:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDR      R0,[R4, #+16]
        CMP      R7,R0
        BCS.W    ??SPIFFS_vis_6
        MOVS     R9,#+0
        MOVS     R8,#+0
        B.N      ??SPIFFS_vis_7
??SPIFFS_vis_8:
        ADDS     R9,R9,#+1
??SPIFFS_vis_7:
        CMP      R6,#+0
        BNE.N    ??SPIFFS_vis_9
        CMP      R9,#+1
        BGE.N    ??SPIFFS_vis_9
        MUL      R10,R5,R9
        LDR      R0,[R4, #+36]
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOV      R0,#+4096
        MOVS     R1,#+128
        MUL      R1,R1,R9
        MLA      R3,R0,R7,R1
        MOVS     R2,#+0
        MOVS     R1,#+20
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOVS     R6,R0
        B.N      ??SPIFFS_vis_10
??SPIFFS_vis_11:
        ADR.N    R0,??DataTable34_2  ;; "d"
        BL       printf
??SPIFFS_vis_12:
        ADDS     R8,R8,#+1
        TST      R8,#0x3F
        BNE.N    ??SPIFFS_vis_10
        ADR.N    R0,??DataTable34_3  ;; "\n"
        BL       printf
??SPIFFS_vis_10:
        CMP      R6,#+0
        BNE.N    ??SPIFFS_vis_8
        SUBS     R0,R8,R10
        CMP      R0,R5
        BGE.N    ??SPIFFS_vis_8
        CMP      R8,#+31
        BGE.N    ??SPIFFS_vis_8
        LDR      R0,[SP, #+12]
        SUBS     R1,R8,R10
        LDRH     R11,[R0, R1, LSL #+1]
        CMP      R8,#+0
        BNE.N    ??SPIFFS_vis_13
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R1,R7
        LDR.N    R0,??DataTable34_16
        BL       printf
        B.N      ??SPIFFS_vis_14
??SPIFFS_vis_13:
        TST      R8,#0x3F
        BNE.N    ??SPIFFS_vis_14
        LDR.N    R0,??DataTable34_17
        BL       printf
??SPIFFS_vis_14:
        UXTH     R11,R11          ;; ZeroExt  R11,R11,#+16,#+16
        MOVW     R0,#+65535
        CMP      R11,R0
        BNE.N    ??SPIFFS_vis_15
        ADR.N    R0,??DataTable34_4  ;; "_"
        BL       printf
        B.N      ??SPIFFS_vis_12
??SPIFFS_vis_15:
        UXTH     R11,R11          ;; ZeroExt  R11,R11,#+16,#+16
        CMP      R11,#+0
        BNE.N    ??SPIFFS_vis_16
        ADR.N    R0,??DataTable34_5  ;; "/"
        BL       printf
        B.N      ??SPIFFS_vis_12
??SPIFFS_vis_16:
        LSLS     R0,R11,#+16
        BPL.N    ??SPIFFS_vis_11
        ADR.N    R0,??DataTable34_6  ;; "i"
        BL       printf
        B.N      ??SPIFFS_vis_12
??SPIFFS_vis_9:
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOV      R0,#+4096
        MUL      R0,R0,R7
        ADDS     R3,R0,#+126
        MOVS     R2,#+0
        MOVS     R1,#+21
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOVS     R6,R0
        CMP      R6,#+0
        BPL.N    ??SPIFFS_vis_17
        MOVS     R0,R6
        B.N      ??SPIFFS_vis_1
??SPIFFS_vis_17:
        LDRH     R0,[SP, #+8]
        MOVW     R1,#+65535
        CMP      R0,R1
        BEQ.W    ??SPIFFS_vis_4
        LDRH     R1,[SP, #+8]
        LDR.N    R0,??DataTable34_18
        BL       printf
        B.N      ??SPIFFS_vis_5
??SPIFFS_vis_6:
        LDRH     R1,[R4, #+70]
        LDR.N    R0,??DataTable34_19
        BL       printf
        LDR      R1,[R4, #+52]
        LDR.N    R0,??DataTable34_20
        BL       printf
        LDR      R1,[R4, #+16]
        LDR.N    R0,??DataTable34_21
        BL       printf
        LDR      R1,[R4, #+56]
        LDR.N    R0,??DataTable34_22
        BL       printf
        LDR      R1,[R4, #+60]
        LDR.N    R0,??DataTable34_23
        BL       printf
        LDR      R1,[R4, #+64]
        LDR.N    R0,??DataTable34_24
        BL       printf
        ADD      R2,SP,#+0
        ADD      R1,SP,#+4
        MOVS     R0,R4
        BL       SPIFFS_info
        LDR      R2,[SP, #+4]
        LDR      R1,[SP, #+0]
        LDR.N    R0,??DataTable34_25
        BL       printf
        MOVS     R0,R6
??SPIFFS_vis_1:
        ADD      SP,SP,#+20
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34:
        DC32     0xffffd8cc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_1:
        DC32     0xffffd8f0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_2:
        DC8      "d",0x0,0x0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_3:
        DC8      "\n",0x0,0x0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_4:
        DC8      "_",0x0,0x0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_5:
        DC8      "/",0x0,0x0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_6:
        DC8      "i",0x0,0x0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_7:
        DC32     0xffffd8ee

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_8:
        DC32     0xffffd8d9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_9:
        DC32     0xffffd8aa

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_10:
        DC32     spiffs_read_dir_v

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_11:
        DC32     0xffffd8ca

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_12:
        DC32     0xffffd8cb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_13:
        DC32     0x20090315

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_14:
        DC32     0xffffd8d8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_15:
        DC32     ?_8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_16:
        DC32     ?_0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_17:
        DC32     ?_1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_18:
        DC32     ?_7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_19:
        DC32     ?_9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_20:
        DC32     ?_10

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_21:
        DC32     ?_11

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_22:
        DC32     ?_12

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_23:
        DC32     ?_13

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_24:
        DC32     ?_14

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable34_25:
        DC32     ?_15

        SECTION `.iar_vfe_header`:DATA:NOALLOC:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
        DC32 0

        SECTION __DLIB_PERTHREAD:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION __DLIB_PERTHREAD_init:DATA:REORDER:NOROOT(0)
        SECTION_TYPE SHT_PROGBITS, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_0:
        DATA
        DC8 "%4i "
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_1:
        DATA
        DC8 "     "
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 "_"

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 "/"

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 "i"

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 "d"

        SECTION `.rodata`:CONST:REORDER:NOROOT(1)
        DATA
        DC8 "\012"

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_7:
        DATA
        DC8 "\tera_cnt: %i\012"
        DC8 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_8:
        DATA
        DC8 "\tera_cnt: N/A\012"
        DC8 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_9:
        DATA
        DC8 "era_cnt_max: %i\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_10:
        DATA
        DC8 "last_errno:  %i\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_11:
        DATA
        DC8 "blocks:      %i\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_12:
        DATA
        DC8 "free_blocks: %i\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_13:
        DATA
        DC8 "page_alloc:  %i\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_14:
        DATA
        DC8 "page_delet:  %i\012"
        DC8 0, 0, 0

        SECTION `.rodata`:CONST:REORDER:NOROOT(2)
?_15:
        DATA
        DC8 "used:        %i of %i\012"
        DC8 0

        END
// 
//   202 bytes in section .rodata
// 6 726 bytes in section .text
// 
// 6 726 bytes of CODE  memory
//   202 bytes of CONST memory
//
//Errors: none
//Warnings: none
