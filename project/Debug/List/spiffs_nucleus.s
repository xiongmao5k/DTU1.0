///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       25/Dec/2017  16:03:41
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\spiffs\src\spiffs_nucleus.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\spiffs\src\spiffs_nucleus.c -D
//        STM32F10X_MD -D USE_STDPERIPH_DRIVER -lb
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\spiffs_nucleus.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memcpy
        EXTERN __aeabi_memset
        EXTERN spiffs_gc_check
        EXTERN spiffs_gc_quick
        EXTERN spiffs_phys_rd
        EXTERN spiffs_phys_wr
        EXTERN strcmp
        EXTERN strncpy

        PUBLIC spiffs_cb_object_event
        PUBLIC spiffs_erase_block
        PUBLIC spiffs_fd_find_new
        PUBLIC spiffs_fd_get
        PUBLIC spiffs_fd_return
        PUBLIC spiffs_fd_temporal_cache_rehash
        PUBLIC spiffs_obj_lu_find_entry_visitor
        PUBLIC spiffs_obj_lu_find_free
        PUBLIC spiffs_obj_lu_find_free_obj_id
        PUBLIC spiffs_obj_lu_find_id
        PUBLIC spiffs_obj_lu_find_id_and_span
        PUBLIC spiffs_obj_lu_find_id_and_span_by_phdr
        PUBLIC spiffs_obj_lu_scan
        PUBLIC spiffs_object_append
        PUBLIC spiffs_object_create
        PUBLIC spiffs_object_find_object_index_header_by_name
        PUBLIC spiffs_object_modify
        PUBLIC spiffs_object_open_by_id
        PUBLIC spiffs_object_open_by_page
        PUBLIC spiffs_object_read
        PUBLIC spiffs_object_truncate
        PUBLIC spiffs_object_update_index_hdr
        PUBLIC spiffs_page_allocate_data
        PUBLIC spiffs_page_delete
        PUBLIC spiffs_page_move
        PUBLIC spiffs_phys_cpy
        PUBLIC spiffs_populate_ix_map


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_page_data_check:
        PUSH     {R0-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        MOVS     R8,#+0
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVW     R0,#+65535
        CMP      R6,R0
        BNE.N    ??spiffs_page_data_check_0
        LDR.W    R0,??DataTable11  ;; 0xffffd8e1
        B.N      ??spiffs_page_data_check_1
??spiffs_page_data_check_0:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R0,#+32
        SDIV     R1,R6,R0
        MLS      R1,R1,R0,R6
        CMP      R1,#+0
        BNE.N    ??spiffs_page_data_check_2
        LDR.W    R0,??DataTable11_1  ;; 0xffffd8e0
        B.N      ??spiffs_page_data_check_1
??spiffs_page_data_check_2:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+1024
        BLE.N    ??spiffs_page_data_check_3
        LDR.W    R0,??DataTable11_2  ;; 0xffffd8df
        B.N      ??spiffs_page_data_check_1
??spiffs_page_data_check_3:
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        MOVS     R0,#+5
        STR      R0,[SP, #+0]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R0,#+128
        MUL      R3,R0,R6
        LDRSH    R2,[R5, #+4]
        MOVS     R1,#+23
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??spiffs_page_data_check_4
        MOV      R0,R8
        B.N      ??spiffs_page_data_check_1
??spiffs_page_data_check_4:
        LDRB     R0,[SP, #+12]
        LSLS     R0,R0,#+31
        BPL.N    ??spiffs_page_data_check_5
        LDR.W    R0,??DataTable11_3  ;; 0xffffd8e4
        B.N      ??spiffs_page_data_check_1
??spiffs_page_data_check_5:
        LDRB     R0,[SP, #+12]
        LSLS     R0,R0,#+24
        BMI.N    ??spiffs_page_data_check_6
        LDR.W    R0,??DataTable11_4  ;; 0xffffd8ec
        B.N      ??spiffs_page_data_check_1
??spiffs_page_data_check_6:
        LDRB     R0,[SP, #+12]
        LSLS     R0,R0,#+30
        BPL.N    ??spiffs_page_data_check_7
        LDR.W    R0,??DataTable11_5  ;; 0xffffd8eb
        B.N      ??spiffs_page_data_check_1
??spiffs_page_data_check_7:
        LDRB     R0,[SP, #+12]
        LSLS     R0,R0,#+29
        BMI.N    ??spiffs_page_data_check_8
        LDR.W    R0,??DataTable11_6  ;; 0xffffd8e5
        B.N      ??spiffs_page_data_check_1
??spiffs_page_data_check_8:
        LDRH     R0,[SP, #+10]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R0,R7
        BEQ.N    ??spiffs_page_data_check_9
        LDR.W    R0,??DataTable11_7  ;; 0xffffd8e2
        B.N      ??spiffs_page_data_check_1
??spiffs_page_data_check_9:
        MOV      R0,R8
??spiffs_page_data_check_1:
        ADD      SP,SP,#+16
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_page_index_check:
        PUSH     {R0-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        MOVS     R8,#+0
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVW     R0,#+65535
        CMP      R6,R0
        BNE.N    ??spiffs_page_index_check_0
        LDR.W    R0,??DataTable11_8  ;; 0xffffd8de
        B.N      ??spiffs_page_index_check_1
??spiffs_page_index_check_0:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R0,#+32
        SDIV     R1,R6,R0
        MLS      R1,R1,R0,R6
        CMP      R1,#+0
        BNE.N    ??spiffs_page_index_check_2
        LDR.W    R0,??DataTable11_9  ;; 0xffffd8dd
        B.N      ??spiffs_page_index_check_1
??spiffs_page_index_check_2:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+1024
        BLE.N    ??spiffs_page_index_check_3
        LDR.W    R0,??DataTable11_10  ;; 0xffffd8dc
        B.N      ??spiffs_page_index_check_1
??spiffs_page_index_check_3:
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        MOVS     R0,#+5
        STR      R0,[SP, #+0]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R0,#+128
        MUL      R3,R0,R6
        LDRSH    R2,[R5, #+4]
        MOVS     R1,#+22
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??spiffs_page_index_check_4
        MOV      R0,R8
        B.N      ??spiffs_page_index_check_1
??spiffs_page_index_check_4:
        LDRB     R0,[SP, #+12]
        LSLS     R0,R0,#+31
        BPL.N    ??spiffs_page_index_check_5
        LDR.W    R0,??DataTable11_3  ;; 0xffffd8e4
        B.N      ??spiffs_page_index_check_1
??spiffs_page_index_check_5:
        LDRB     R0,[SP, #+12]
        LSLS     R0,R0,#+24
        BMI.N    ??spiffs_page_index_check_6
        LDR.W    R0,??DataTable11_4  ;; 0xffffd8ec
        B.N      ??spiffs_page_index_check_1
??spiffs_page_index_check_6:
        LDRB     R0,[SP, #+12]
        LSLS     R0,R0,#+30
        BPL.N    ??spiffs_page_index_check_7
        LDR.W    R0,??DataTable11_5  ;; 0xffffd8eb
        B.N      ??spiffs_page_index_check_1
??spiffs_page_index_check_7:
        LDRB     R0,[SP, #+12]
        LSLS     R0,R0,#+29
        BPL.N    ??spiffs_page_index_check_8
        LDR.W    R0,??DataTable11_11  ;; 0xffffd8ea
        B.N      ??spiffs_page_index_check_1
??spiffs_page_index_check_8:
        LDRH     R0,[R5, #+6]
        LSLS     R0,R0,#+16
        BMI.N    ??spiffs_page_index_check_9
        LDR.W    R0,??DataTable11_11  ;; 0xffffd8ea
        B.N      ??spiffs_page_index_check_1
??spiffs_page_index_check_9:
        LDRH     R0,[SP, #+10]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R0,R7
        BEQ.N    ??spiffs_page_index_check_10
        LDR.W    R0,??DataTable11_12  ;; 0xffffd8e3
        B.N      ??spiffs_page_index_check_1
??spiffs_page_index_check_10:
        MOV      R0,R8
??spiffs_page_index_check_1:
        ADD      SP,SP,#+16
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_phys_cpy:
        PUSH     {R4-R10,LR}
        SUB      SP,SP,#+72
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+104]
??spiffs_phys_cpy_0:
        CMP      R8,#+0
        BEQ.N    ??spiffs_phys_cpy_1
        CMP      R8,#+65
        BCC.N    ??spiffs_phys_cpy_2
        MOVS     R9,#+64
        B.N      ??spiffs_phys_cpy_3
??spiffs_phys_cpy_2:
        MOV      R9,R8
??spiffs_phys_cpy_3:
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        STR      R9,[SP, #+0]
        MOVS     R3,R7
        MOVS     R2,R5
        SXTH     R2,R2            ;; SignExt  R2,R2,#+16,#+16
        MOVS     R1,#+11
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_phys_cpy_4
        MOV      R0,R10
        B.N      ??spiffs_phys_cpy_5
??spiffs_phys_cpy_4:
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        STR      R9,[SP, #+0]
        MOVS     R3,R6
        MOVS     R2,R5
        SXTH     R2,R2            ;; SignExt  R2,R2,#+16,#+16
        MOVS     R1,#+15
        MOVS     R0,R4
        BL       spiffs_phys_wr
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_phys_cpy_6
        MOV      R0,R10
        B.N      ??spiffs_phys_cpy_5
??spiffs_phys_cpy_6:
        SUBS     R8,R8,R9
        ADDS     R7,R9,R7
        ADDS     R6,R9,R6
        B.N      ??spiffs_phys_cpy_0
??spiffs_phys_cpy_1:
        MOVS     R0,#+0
??spiffs_phys_cpy_5:
        ADD      SP,SP,#+72
        POP      {R4-R10,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_obj_lu_find_entry_visitor:
        PUSH     {R1-R11,LR}
        SUB      SP,SP,#+16
        MOVS     R4,R0
        MOVS     R5,#+0
        LDR      R0,[R4, #+16]
        MOVS     R1,#+31
        MUL      R6,R1,R0
        LDRH     R9,[SP, #+16]
        LDRH     R0,[SP, #+16]
        MOV      R1,#+4096
        MUL      R7,R1,R0
        LDR      R0,[R4, #+36]
        STR      R0,[SP, #+12]
        LDR      R8,[SP, #+20]
        MOVS     R0,#+64
        STR      R0,[SP, #+8]
        CMP      R8,#+31
        BLT.N    ??spiffs_obj_lu_find_entry_visitor_0
        MOVS     R0,#+0
        MOV      R8,R0
        ADDS     R9,R9,#+1
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        MOV      R0,#+4096
        MUL      R0,R0,R9
        MOVS     R7,R0
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        LDR      R0,[R4, #+16]
        CMP      R9,R0
        BCC.N    ??spiffs_obj_lu_find_entry_visitor_0
        LDRB     R0,[SP, #+24]
        LSLS     R0,R0,#+29
        BPL.N    ??spiffs_obj_lu_find_entry_visitor_1
        LDR.W    R0,??DataTable11_13  ;; 0xffffd8a8
        B.N      ??spiffs_obj_lu_find_entry_visitor_2
??spiffs_obj_lu_find_entry_visitor_1:
        MOVS     R0,#+0
        MOV      R9,R0
        MOVS     R0,#+0
        MOVS     R7,R0
??spiffs_obj_lu_find_entry_visitor_0:
        CMP      R5,#+0
        BNE.W    ??spiffs_obj_lu_find_entry_visitor_3
        CMP      R6,#+1
        BLT.W    ??spiffs_obj_lu_find_entry_visitor_3
        LDR      R0,[SP, #+8]
        SDIV     R10,R8,R0
??spiffs_obj_lu_find_entry_visitor_4:
        CMP      R5,#+0
        BNE.W    ??spiffs_obj_lu_find_entry_visitor_5
        CMP      R10,#+1
        BGE.N    ??spiffs_obj_lu_find_entry_visitor_5
        LDR      R0,[SP, #+8]
        MUL      R11,R0,R10
        LDR      R0,[R4, #+36]
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        MOVS     R0,#+128
        MLA      R3,R0,R10,R7
        MOVS     R2,#+0
        MOVS     R1,#+20
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOVS     R5,R0
??spiffs_obj_lu_find_entry_visitor_6:
        CMP      R5,#+0
        BNE.N    ??spiffs_obj_lu_find_entry_visitor_7
        SUBS     R0,R8,R11
        LDR      R1,[SP, #+8]
        CMP      R0,R1
        BGE.N    ??spiffs_obj_lu_find_entry_visitor_7
        CMP      R8,#+31
        BGE.N    ??spiffs_obj_lu_find_entry_visitor_7
        LDRB     R0,[SP, #+24]
        LSLS     R0,R0,#+31
        BPL.N    ??spiffs_obj_lu_find_entry_visitor_8
        LDR      R0,[SP, #+12]
        SUBS     R1,R8,R11
        LDRH     R0,[R0, R1, LSL #+1]
        LDRH     R1,[SP, #+64]
        CMP      R0,R1
        BNE.N    ??spiffs_obj_lu_find_entry_visitor_9
??spiffs_obj_lu_find_entry_visitor_8:
        LDR      R0,[SP, #+80]
        CMP      R0,#+0
        BEQ.N    ??spiffs_obj_lu_find_entry_visitor_10
        LDR      R0,[SP, #+80]
        STRH     R9,[R0, #+0]
??spiffs_obj_lu_find_entry_visitor_10:
        LDR      R0,[SP, #+84]
        CMP      R0,#+0
        BEQ.N    ??spiffs_obj_lu_find_entry_visitor_11
        LDR      R0,[SP, #+84]
        STR      R8,[R0, #+0]
??spiffs_obj_lu_find_entry_visitor_11:
        LDR      R0,[SP, #+68]
        CMP      R0,#+0
        BEQ.N    ??spiffs_obj_lu_find_entry_visitor_12
        LDRB     R0,[SP, #+24]
        LSLS     R0,R0,#+30
        BPL.N    ??spiffs_obj_lu_find_entry_visitor_13
        LDRH     R1,[SP, #+64]
        B.N      ??spiffs_obj_lu_find_entry_visitor_14
??spiffs_obj_lu_find_entry_visitor_13:
        LDR      R0,[SP, #+12]
        SUBS     R1,R8,R11
        LDRH     R1,[R0, R1, LSL #+1]
??spiffs_obj_lu_find_entry_visitor_14:
        LDR      R0,[SP, #+76]
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+72]
        STR      R0,[SP, #+0]
        MOV      R3,R8
        MOV      R2,R9
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        LDR      R12,[SP, #+68]
        BLX      R12
        MOVS     R5,R0
        LDR.W    R0,??DataTable11_14  ;; 0xffffd8aa
        CMP      R5,R0
        BEQ.N    ??spiffs_obj_lu_find_entry_visitor_15
        LDR.W    R0,??DataTable11_15  ;; 0xffffd8a9
        CMP      R5,R0
        BNE.N    ??spiffs_obj_lu_find_entry_visitor_16
??spiffs_obj_lu_find_entry_visitor_15:
        LDR.W    R0,??DataTable11_15  ;; 0xffffd8a9
        CMP      R5,R0
        BNE.N    ??spiffs_obj_lu_find_entry_visitor_17
        LDR      R0,[R4, #+36]
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        MOVS     R0,#+128
        MLA      R3,R0,R10,R7
        MOVS     R2,#+0
        MOVS     R1,#+20
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOVS     R5,R0
        CMP      R5,#+0
        BPL.N    ??spiffs_obj_lu_find_entry_visitor_18
        MOVS     R0,R5
        B.N      ??spiffs_obj_lu_find_entry_visitor_2
??spiffs_obj_lu_find_entry_visitor_18:
??spiffs_obj_lu_find_entry_visitor_17:
        MOVS     R0,#+0
        MOVS     R5,R0
        ADDS     R8,R8,#+1
        SUBS     R6,R6,#+1
        B.N      ??spiffs_obj_lu_find_entry_visitor_6
??spiffs_obj_lu_find_entry_visitor_16:
        MOVS     R0,R5
        B.N      ??spiffs_obj_lu_find_entry_visitor_2
??spiffs_obj_lu_find_entry_visitor_12:
        MOVS     R0,#+0
        B.N      ??spiffs_obj_lu_find_entry_visitor_2
??spiffs_obj_lu_find_entry_visitor_9:
        SUBS     R6,R6,#+1
        ADDS     R8,R8,#+1
        B.N      ??spiffs_obj_lu_find_entry_visitor_6
??spiffs_obj_lu_find_entry_visitor_7:
        ADDS     R10,R10,#+1
        B.N      ??spiffs_obj_lu_find_entry_visitor_4
??spiffs_obj_lu_find_entry_visitor_5:
        MOVS     R0,#+0
        MOV      R8,R0
        ADDS     R9,R9,#+1
        ADDS     R7,R7,#+4096
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        LDR      R0,[R4, #+16]
        CMP      R9,R0
        BCC.W    ??spiffs_obj_lu_find_entry_visitor_0
        LDRB     R0,[SP, #+24]
        LSLS     R0,R0,#+29
        BPL.N    ??spiffs_obj_lu_find_entry_visitor_19
        LDR.W    R0,??DataTable11_13  ;; 0xffffd8a8
        B.N      ??spiffs_obj_lu_find_entry_visitor_2
??spiffs_obj_lu_find_entry_visitor_19:
        MOVS     R0,#+0
        MOV      R9,R0
        MOVS     R0,#+0
        MOVS     R7,R0
        B.N      ??spiffs_obj_lu_find_entry_visitor_0
??spiffs_obj_lu_find_entry_visitor_3:
        CMP      R5,#+0
        BPL.N    ??spiffs_obj_lu_find_entry_visitor_20
        MOVS     R0,R5
        B.N      ??spiffs_obj_lu_find_entry_visitor_2
??spiffs_obj_lu_find_entry_visitor_20:
        LDR.W    R0,??DataTable11_13  ;; 0xffffd8a8
??spiffs_obj_lu_find_entry_visitor_2:
        ADD      SP,SP,#+28
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_erase_block:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+16
        MOVS     R4,R0
        MOVS     R5,R1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOV      R0,#+4096
        MUL      R7,R0,R5
        MOV      R8,#+4096
??spiffs_erase_block_0:
        CMP      R8,#+1
        BLT.N    ??spiffs_erase_block_1
        MOV      R1,#+4096
        MOVS     R0,R7
        LDR      R2,[R4, #+8]
        BLX      R2
        ADDS     R7,R7,#+4096
        SUBS     R8,R8,#+4096
        B.N      ??spiffs_erase_block_0
??spiffs_erase_block_1:
        LDR      R0,[R4, #+56]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+56]
        ADDS     R0,R4,#+70
        STR      R0,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOV      R0,#+4096
        MUL      R0,R0,R5
        ADDS     R3,R0,#+126
        MOVS     R2,#+0
        MOVS     R1,#+25
        MOVS     R0,R4
        BL       spiffs_phys_wr
        MOVS     R6,R0
        CMP      R6,#+0
        BPL.N    ??spiffs_erase_block_2
        MOVS     R0,R6
        B.N      ??spiffs_erase_block_3
??spiffs_erase_block_2:
        LDR      R0,[R4, #+16]
        SUBS     R0,R0,R5
        MOVW     R1,#+1449
        EORS     R0,R1,R0
        STRH     R0,[SP, #+8]
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOV      R0,#+4096
        MUL      R0,R0,R5
        ADDS     R3,R0,#+124
        MOVS     R2,#+0
        MOVS     R1,#+25
        MOVS     R0,R4
        BL       spiffs_phys_wr
        MOVS     R6,R0
        CMP      R6,#+0
        BPL.N    ??spiffs_erase_block_4
        MOVS     R0,R6
        B.N      ??spiffs_erase_block_3
??spiffs_erase_block_4:
        LDRH     R0,[R4, #+70]
        ADDS     R0,R0,#+1
        STRH     R0,[R4, #+70]
        LDRH     R0,[R4, #+70]
        CMP      R0,#+32768
        BNE.N    ??spiffs_erase_block_5
        MOVS     R0,#+0
        STRH     R0,[R4, #+70]
??spiffs_erase_block_5:
        MOVS     R0,R6
??spiffs_erase_block_3:
        ADD      SP,SP,#+16
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_obj_lu_scan_v:
        PUSH     {R4}
        MOVS     R4,R0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVW     R0,#+65535
        CMP      R1,R0
        BNE.N    ??spiffs_obj_lu_scan_v_0
        CMP      R3,#+0
        BNE.N    ??spiffs_obj_lu_scan_v_1
        LDR      R0,[R4, #+56]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+56]
        B.N      ??spiffs_obj_lu_scan_v_1
??spiffs_obj_lu_scan_v_0:
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R1,#+0
        BNE.N    ??spiffs_obj_lu_scan_v_2
        LDR      R0,[R4, #+64]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+64]
        B.N      ??spiffs_obj_lu_scan_v_1
??spiffs_obj_lu_scan_v_2:
        LDR      R0,[R4, #+60]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+60]
??spiffs_obj_lu_scan_v_1:
        LDR.W    R0,??DataTable11_14  ;; 0xffffd8aa
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_obj_lu_scan:
        PUSH     {R4-R9,LR}
        SUB      SP,SP,#+36
        MOVS     R4,R0
        MOVW     R6,#+65535
        MOVS     R0,#+0
        STRH     R0,[SP, #+24]
        MOVW     R8,#+65535
        MOVS     R9,#+0
??spiffs_obj_lu_scan_0:
        LDRH     R0,[SP, #+24]
        LDR      R1,[R4, #+16]
        CMP      R0,R1
        BCS.N    ??spiffs_obj_lu_scan_1
        ADD      R0,SP,#+28
        STR      R0,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+24]
        MOV      R1,#+4096
        MULS     R0,R1,R0
        ADDS     R3,R0,#+124
        MOVS     R2,#+0
        MOVS     R1,#+21
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOVS     R5,R0
        CMP      R5,#+0
        BPL.N    ??spiffs_obj_lu_scan_2
        MOVS     R0,R5
        B.N      ??spiffs_obj_lu_scan_3
??spiffs_obj_lu_scan_2:
        LDRH     R0,[SP, #+28]
        LDR      R1,[R4, #+16]
        LDRH     R2,[SP, #+24]
        SUBS     R1,R1,R2
        MOVW     R2,#+1449
        EORS     R1,R2,R1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R0,R1
        BEQ.N    ??spiffs_obj_lu_scan_4
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVW     R0,#+65535
        CMP      R6,R0
        BNE.N    ??spiffs_obj_lu_scan_5
        LDRH     R0,[SP, #+24]
        MOVS     R6,R0
        B.N      ??spiffs_obj_lu_scan_4
??spiffs_obj_lu_scan_5:
        LDR.W    R0,??DataTable12  ;; 0xffffd8d7
        B.N      ??spiffs_obj_lu_scan_3
??spiffs_obj_lu_scan_4:
        ADD      R0,SP,#+26
        STR      R0,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+24]
        MOV      R1,#+4096
        MULS     R0,R1,R0
        ADDS     R3,R0,#+126
        MOVS     R2,#+0
        MOVS     R1,#+21
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOVS     R5,R0
        CMP      R5,#+0
        BPL.N    ??spiffs_obj_lu_scan_6
        MOVS     R0,R5
        B.N      ??spiffs_obj_lu_scan_3
??spiffs_obj_lu_scan_6:
        LDRH     R0,[SP, #+26]
        MOVW     R1,#+65535
        CMP      R0,R1
        BEQ.N    ??spiffs_obj_lu_scan_7
        LDRH     R0,[SP, #+26]
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,R0
        BCC.N    ??spiffs_obj_lu_scan_8
??spiffs_obj_lu_scan_9:
        LDRH     R8,[SP, #+26]
??spiffs_obj_lu_scan_8:
        LDRH     R0,[SP, #+26]
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R0,R9
        BCC.N    ??spiffs_obj_lu_scan_7
??spiffs_obj_lu_scan_10:
        LDRH     R9,[SP, #+26]
??spiffs_obj_lu_scan_7:
        LDRH     R0,[SP, #+24]
        ADDS     R0,R0,#+1
        STRH     R0,[SP, #+24]
        B.N      ??spiffs_obj_lu_scan_0
??spiffs_obj_lu_scan_1:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+0
        BNE.N    ??spiffs_obj_lu_scan_11
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        MOVW     R0,#+65535
        CMP      R9,R0
        BNE.N    ??spiffs_obj_lu_scan_11
        MOVS     R0,#+0
        MOVS     R7,R0
        B.N      ??spiffs_obj_lu_scan_12
??spiffs_obj_lu_scan_11:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        SUBS     R0,R9,R8
        CMP      R0,#+32768
        BLT.N    ??spiffs_obj_lu_scan_13
        ADDS     R0,R8,#+1
        MOVS     R7,R0
        B.N      ??spiffs_obj_lu_scan_12
??spiffs_obj_lu_scan_13:
        ADDS     R0,R9,#+1
        MOVS     R7,R0
??spiffs_obj_lu_scan_12:
        STRH     R7,[R4, #+70]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVW     R0,#+65535
        CMP      R6,R0
        BEQ.N    ??spiffs_obj_lu_scan_14
        MOVS     R1,R6
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_erase_block
        MOVS     R5,R0
        CMP      R5,#+0
        BPL.N    ??spiffs_obj_lu_scan_15
        MOVS     R0,R5
        B.N      ??spiffs_obj_lu_scan_3
??spiffs_obj_lu_scan_15:
??spiffs_obj_lu_scan_14:
        MOVS     R0,#+0
        STR      R0,[R4, #+56]
        MOVS     R0,#+0
        STR      R0,[R4, #+60]
        MOVS     R0,#+0
        STR      R0,[R4, #+64]
        ADD      R0,SP,#+32
        STR      R0,[SP, #+20]
        ADD      R0,SP,#+24
        STR      R0,[SP, #+16]
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        LDR.W    R0,??DataTable12_1
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_entry_visitor
        MOVS     R5,R0
        LDR.W    R0,??DataTable12_2  ;; 0xffffd8a8
        CMP      R5,R0
        BNE.N    ??spiffs_obj_lu_scan_16
        MOVS     R0,#+0
        MOVS     R5,R0
??spiffs_obj_lu_scan_16:
        CMP      R5,#+0
        BPL.N    ??spiffs_obj_lu_scan_17
        MOVS     R0,R5
        B.N      ??spiffs_obj_lu_scan_3
??spiffs_obj_lu_scan_17:
        MOVS     R0,R5
??spiffs_obj_lu_scan_3:
        ADD      SP,SP,#+36
        POP      {R4-R9,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_obj_lu_find_free:
        PUSH     {R4-R9,LR}
        SUB      SP,SP,#+12
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+40]
        LDRB     R0,[R4, #+68]
        CMP      R0,#+0
        BNE.N    ??spiffs_obj_lu_find_free_0
        LDR      R0,[R4, #+56]
        CMP      R0,#+2
        BCS.N    ??spiffs_obj_lu_find_free_0
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       spiffs_gc_quick
        MOV      R9,R0
        LDR.W    R0,??DataTable12_3  ;; 0xffffd8d3
        CMP      R9,R0
        BNE.N    ??spiffs_obj_lu_find_free_1
        MOVS     R0,#+0
        MOV      R9,R0
??spiffs_obj_lu_find_free_1:
        CMP      R9,#+0
        BPL.N    ??spiffs_obj_lu_find_free_2
        MOV      R0,R9
        B.N      ??spiffs_obj_lu_find_free_3
??spiffs_obj_lu_find_free_2:
        LDR      R0,[R4, #+56]
        CMP      R0,#+2
        BCS.N    ??spiffs_obj_lu_find_free_0
        LDR.W    R0,??DataTable12_4  ;; 0xffffd8ef
        B.N      ??spiffs_obj_lu_find_free_3
??spiffs_obj_lu_find_free_0:
        STR      R8,[SP, #+4]
        STR      R7,[SP, #+0]
        MOVW     R3,#+65535
        MOVS     R2,R6
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_id
        MOV      R9,R0
        CMP      R9,#+0
        BNE.N    ??spiffs_obj_lu_find_free_4
        LDRH     R0,[R7, #+0]
        STRH     R0,[R4, #+20]
        LDR      R0,[R8, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+24]
        LDR      R0,[R8, #+0]
        CMP      R0,#+0
        BNE.N    ??spiffs_obj_lu_find_free_4
        LDR      R0,[R4, #+56]
        SUBS     R0,R0,#+1
        STR      R0,[R4, #+56]
??spiffs_obj_lu_find_free_4:
        MOV      R0,R9
??spiffs_obj_lu_find_free_3:
        POP      {R1-R9,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_obj_lu_find_id:
        PUSH     {R4-R9,LR}
        SUB      SP,SP,#+28
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+56]
        LDR      R9,[SP, #+60]
        STR      R9,[SP, #+20]
        STR      R8,[SP, #+16]
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,R7
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        MOVS     R2,R6
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_entry_visitor
        LDR.W    R1,??DataTable11_13  ;; 0xffffd8a8
        CMP      R0,R1
        BNE.N    ??spiffs_obj_lu_find_id_0
        LDR.W    R1,??DataTable13  ;; 0xffffd8ee
        MOVS     R0,R1
??spiffs_obj_lu_find_id_0:
        ADD      SP,SP,#+28
        POP      {R4-R9,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_obj_lu_find_id_and_span_v:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+20
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+56]
        LDR      R9,[SP, #+60]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ADDS     R0,R7,R6, LSL #+5
        ADDS     R11,R0,#+1
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        MOVS     R0,#+5
        STR      R0,[SP, #+0]
        UXTH     R11,R11          ;; ZeroExt  R11,R11,#+16,#+16
        MOVS     R0,#+128
        MUL      R3,R0,R11
        MOVS     R2,#+21
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_obj_lu_find_id_and_span_v_0
        MOV      R0,R10
        B.N      ??spiffs_obj_lu_find_id_and_span_v_1
??spiffs_obj_lu_find_id_and_span_v_0:
        LDRH     R0,[SP, #+8]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R0,R5
        BNE.N    ??spiffs_obj_lu_find_id_and_span_v_2
        LDRH     R0,[SP, #+10]
        LDRH     R1,[R9, #+0]
        CMP      R0,R1
        BNE.N    ??spiffs_obj_lu_find_id_and_span_v_2
        LDRB     R0,[SP, #+12]
        ANDS     R0,R0,#0x83
        CMP      R0,#+128
        BNE.N    ??spiffs_obj_lu_find_id_and_span_v_2
        LSLS     R0,R5,#+16
        BPL.N    ??spiffs_obj_lu_find_id_and_span_v_3
        LDRB     R0,[SP, #+12]
        LSLS     R0,R0,#+25
        BMI.N    ??spiffs_obj_lu_find_id_and_span_v_3
        LDRH     R0,[SP, #+10]
        CMP      R0,#+0
        BEQ.N    ??spiffs_obj_lu_find_id_and_span_v_2
??spiffs_obj_lu_find_id_and_span_v_3:
        CMP      R8,#+0
        BEQ.N    ??spiffs_obj_lu_find_id_and_span_v_4
        LDRH     R0,[R8, #+0]
        UXTH     R11,R11          ;; ZeroExt  R11,R11,#+16,#+16
        CMP      R0,R11
        BEQ.N    ??spiffs_obj_lu_find_id_and_span_v_2
??spiffs_obj_lu_find_id_and_span_v_4:
        MOVS     R0,#+0
        B.N      ??spiffs_obj_lu_find_id_and_span_v_1
??spiffs_obj_lu_find_id_and_span_v_2:
        LDR.W    R0,??DataTable11_14  ;; 0xffffd8aa
??spiffs_obj_lu_find_id_and_span_v_1:
        ADD      SP,SP,#+20
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_obj_lu_find_id_and_span:
        PUSH     {R2-R7,LR}
        SUB      SP,SP,#+36
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R6,[SP, #+64]
        LDRH     R0,[SP, #+40]
        CMP      R0,#+0
        BEQ.N    ??spiffs_obj_lu_find_id_and_span_0
        ADD      R0,SP,#+40
        B.N      ??spiffs_obj_lu_find_id_and_span_1
??spiffs_obj_lu_find_id_and_span_0:
        MOVS     R0,#+0
??spiffs_obj_lu_find_id_and_span_1:
        ADD      R1,SP,#+28
        STR      R1,[SP, #+20]
        ADD      R1,SP,#+24
        STR      R1,[SP, #+16]
        ADD      R1,SP,#+36
        STR      R1,[SP, #+12]
        STR      R0,[SP, #+8]
        LDR.W    R0,??DataTable13_1
        STR      R0,[SP, #+4]
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        LDR      R2,[R4, #+32]
        LDRH     R1,[R4, #+28]
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_entry_visitor
        MOVS     R7,R0
        LDR.W    R0,??DataTable11_13  ;; 0xffffd8a8
        CMP      R7,R0
        BNE.N    ??spiffs_obj_lu_find_id_and_span_2
        LDR.W    R0,??DataTable13  ;; 0xffffd8ee
        MOVS     R7,R0
??spiffs_obj_lu_find_id_and_span_2:
        CMP      R7,#+0
        BPL.N    ??spiffs_obj_lu_find_id_and_span_3
        MOVS     R0,R7
        B.N      ??spiffs_obj_lu_find_id_and_span_4
??spiffs_obj_lu_find_id_and_span_3:
        CMP      R6,#+0
        BEQ.N    ??spiffs_obj_lu_find_id_and_span_5
        LDRH     R0,[SP, #+24]
        LDR      R1,[SP, #+28]
        ADDS     R0,R1,R0, LSL #+5
        ADDS     R0,R0,#+1
        STRH     R0,[R6, #+0]
??spiffs_obj_lu_find_id_and_span_5:
        LDRH     R0,[SP, #+24]
        STRH     R0,[R4, #+28]
        LDR      R0,[SP, #+28]
        STR      R0,[R4, #+32]
        MOVS     R0,R7
??spiffs_obj_lu_find_id_and_span_4:
        ADD      SP,SP,#+44
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_obj_lu_find_id_and_span_by_phdr:
        PUSH     {R2-R7,LR}
        SUB      SP,SP,#+36
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R6,[SP, #+64]
        LDRH     R0,[SP, #+40]
        CMP      R0,#+0
        BEQ.N    ??spiffs_obj_lu_find_id_and_span_by_phdr_0
        ADD      R0,SP,#+40
        B.N      ??spiffs_obj_lu_find_id_and_span_by_phdr_1
??spiffs_obj_lu_find_id_and_span_by_phdr_0:
        MOVS     R0,#+0
??spiffs_obj_lu_find_id_and_span_by_phdr_1:
        ADD      R1,SP,#+28
        STR      R1,[SP, #+20]
        ADD      R1,SP,#+24
        STR      R1,[SP, #+16]
        ADD      R1,SP,#+36
        STR      R1,[SP, #+12]
        STR      R0,[SP, #+8]
        LDR.W    R0,??DataTable13_1
        STR      R0,[SP, #+4]
        MOVS     R0,R5
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STR      R0,[SP, #+0]
        MOVS     R3,#+2
        LDR      R2,[R4, #+32]
        LDRH     R1,[R4, #+28]
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_entry_visitor
        MOVS     R7,R0
        LDR.W    R0,??DataTable11_13  ;; 0xffffd8a8
        CMP      R7,R0
        BNE.N    ??spiffs_obj_lu_find_id_and_span_by_phdr_2
        LDR.W    R0,??DataTable13  ;; 0xffffd8ee
        MOVS     R7,R0
??spiffs_obj_lu_find_id_and_span_by_phdr_2:
        CMP      R7,#+0
        BPL.N    ??spiffs_obj_lu_find_id_and_span_by_phdr_3
        MOVS     R0,R7
        B.N      ??spiffs_obj_lu_find_id_and_span_by_phdr_4
??spiffs_obj_lu_find_id_and_span_by_phdr_3:
        CMP      R6,#+0
        BEQ.N    ??spiffs_obj_lu_find_id_and_span_by_phdr_5
        LDRH     R0,[SP, #+24]
        LDR      R1,[SP, #+28]
        ADDS     R0,R1,R0, LSL #+5
        ADDS     R0,R0,#+1
        STRH     R0,[R6, #+0]
??spiffs_obj_lu_find_id_and_span_by_phdr_5:
        LDRH     R0,[SP, #+24]
        STRH     R0,[R4, #+28]
        LDR      R0,[SP, #+28]
        STR      R0,[R4, #+32]
        MOVS     R0,R7
??spiffs_obj_lu_find_id_and_span_by_phdr_4:
        ADD      SP,SP,#+44
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_update_ix_map:
        PUSH     {R4-R11,LR}
        LDR      R4,[R1, #+44]
        LDRH     R5,[R4, #+8]
        CMP      R5,#+39
        BCS.N    ??spiffs_update_ix_map_0
        MOVS     R5,#+0
        B.N      ??spiffs_update_ix_map_1
??spiffs_update_ix_map_0:
        LDRH     R5,[R4, #+8]
        SUBS     R5,R5,#+39
        MOVS     R6,#+60
        UDIV     R5,R5,R6
        ADDS     R5,R5,#+1
??spiffs_update_ix_map_1:
        LDRH     R6,[R4, #+10]
        CMP      R6,#+39
        BCS.N    ??spiffs_update_ix_map_2
        MOVS     R6,#+0
        B.N      ??spiffs_update_ix_map_3
??spiffs_update_ix_map_2:
        LDRH     R6,[R4, #+10]
        SUBS     R6,R6,#+39
        MOVS     R7,#+60
        UDIV     R6,R6,R7
        ADDS     R6,R6,#+1
??spiffs_update_ix_map_3:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R2,R5
        BCC.N    ??spiffs_update_ix_map_4
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R6,R2
        BCS.N    ??spiffs_update_ix_map_5
??spiffs_update_ix_map_4:
        B.N      ??spiffs_update_ix_map_6
??spiffs_update_ix_map_5:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+0
        BNE.N    ??spiffs_update_ix_map_7
        MOVS     R7,#+0
        B.N      ??spiffs_update_ix_map_8
??spiffs_update_ix_map_7:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOVS     R7,#+60
        MUL      R7,R7,R2
        SUBS     R7,R7,#+21
??spiffs_update_ix_map_8:
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+0
        BNE.N    ??spiffs_update_ix_map_9
        MOVS     R12,#+39
        B.N      ??spiffs_update_ix_map_10
??spiffs_update_ix_map_9:
        MOVS     R12,#+60
??spiffs_update_ix_map_10:
        ADDS     R12,R12,R7
        LDRH     LR,[R4, #+8]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,LR
        BCS.N    ??spiffs_update_ix_map_11
        LDRH     LR,[R4, #+8]
        B.N      ??spiffs_update_ix_map_12
??spiffs_update_ix_map_11:
        MOV      LR,R7
??spiffs_update_ix_map_12:
        LDRH     R8,[R4, #+10]
        ADDS     R8,R8,#+1
        UXTH     R12,R12          ;; ZeroExt  R12,R12,#+16,#+16
        CMP      R8,R12
        BGE.N    ??spiffs_update_ix_map_13
        LDRH     R8,[R4, #+10]
        ADDS     R8,R8,#+1
        B.N      ??spiffs_update_ix_map_14
??spiffs_update_ix_map_13:
        MOV      R8,R12
??spiffs_update_ix_map_14:
        UXTH     LR,LR            ;; ZeroExt  LR,LR,#+16,#+16
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      LR,R8
        BCS.N    ??spiffs_update_ix_map_15
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        CMP      R2,#+0
        BNE.N    ??spiffs_update_ix_map_16
        UXTH     LR,LR            ;; ZeroExt  LR,LR,#+16,#+16
        ADDS     R10,R3,LR, LSL #+1
        LDRH     R10,[R10, #+49]
        MOV      R9,R10
        B.N      ??spiffs_update_ix_map_17
??spiffs_update_ix_map_16:
        UXTH     LR,LR            ;; ZeroExt  LR,LR,#+16,#+16
        CMP      LR,#+39
        BCS.N    ??spiffs_update_ix_map_18
        UXTH     LR,LR            ;; ZeroExt  LR,LR,#+16,#+16
        MOV      R9,LR
        B.N      ??spiffs_update_ix_map_19
??spiffs_update_ix_map_18:
        UXTH     LR,LR            ;; ZeroExt  LR,LR,#+16,#+16
        SUBS     R9,LR,#+39
        MOVS     R10,#+60
        UDIV     R11,R9,R10
        MLS      R9,R10,R11,R9
??spiffs_update_ix_map_19:
        ADDS     R9,R3,R9, LSL #+1
        LDRH     R9,[R9, #+8]
??spiffs_update_ix_map_17:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        MOVW     R10,#+65535
        CMP      R9,R10
        BEQ.N    ??spiffs_update_ix_map_15
??spiffs_update_ix_map_20:
        LDR      R10,[R4, #+0]
        UXTH     LR,LR            ;; ZeroExt  LR,LR,#+16,#+16
        LDRH     R11,[R4, #+8]
        SUBS     R11,LR,R11
        STRH     R9,[R10, R11, LSL #+1]
        ADDS     LR,LR,#+1
        B.N      ??spiffs_update_ix_map_14
??spiffs_update_ix_map_15:
??spiffs_update_ix_map_6:
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_populate_ix_map_v:
        PUSH     {R1-R11,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+52]
        MOV      R10,R8
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ADDS     R0,R7,R6, LSL #+5
        ADDS     R0,R0,#+1
        STRH     R0,[SP, #+8]
        LDR      R11,[R4, #+40]
        STR      R11,[SP, #+4]
        MOVS     R0,#+8
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+8]
        MOVS     R1,#+128
        MUL      R3,R1,R0
        MOVS     R2,#+0
        MOVS     R1,#+21
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOV      R9,R0
        CMP      R9,#+0
        BPL.N    ??spiffs_populate_ix_map_v_0
        MOV      R0,R9
        B.N      ??spiffs_populate_ix_map_v_1
??spiffs_populate_ix_map_v_0:
        LDRB     R0,[R11, #+4]
        LSLS     R0,R0,#+31
        BPL.N    ??spiffs_populate_ix_map_v_2
        LDR.N    R0,??DataTable11_3  ;; 0xffffd8e4
        B.N      ??spiffs_populate_ix_map_v_1
??spiffs_populate_ix_map_v_2:
        LDRB     R0,[R11, #+4]
        LSLS     R0,R0,#+24
        BMI.N    ??spiffs_populate_ix_map_v_3
        LDR.N    R0,??DataTable11_4  ;; 0xffffd8ec
        B.N      ??spiffs_populate_ix_map_v_1
??spiffs_populate_ix_map_v_3:
        LDRB     R0,[R11, #+4]
        LSLS     R0,R0,#+30
        BPL.N    ??spiffs_populate_ix_map_v_4
        LDR.N    R0,??DataTable11_5  ;; 0xffffd8eb
        B.N      ??spiffs_populate_ix_map_v_1
??spiffs_populate_ix_map_v_4:
        LDRB     R0,[R11, #+4]
        LSLS     R0,R0,#+29
        BPL.N    ??spiffs_populate_ix_map_v_5
        LDR.N    R0,??DataTable11_11  ;; 0xffffd8ea
        B.N      ??spiffs_populate_ix_map_v_1
??spiffs_populate_ix_map_v_5:
        LSLS     R0,R5,#+16
        BMI.N    ??spiffs_populate_ix_map_v_6
        LDR.N    R0,??DataTable11_11  ;; 0xffffd8ea
        B.N      ??spiffs_populate_ix_map_v_1
??spiffs_populate_ix_map_v_6:
        LDRH     R0,[R11, #+2]
        LDRH     R1,[R11, #+2]
        CMP      R0,R1
        BEQ.N    ??spiffs_populate_ix_map_v_7
        LDR.N    R0,??DataTable11_12  ;; 0xffffd8e3
        B.N      ??spiffs_populate_ix_map_v_1
??spiffs_populate_ix_map_v_7:
        LDRB     R0,[R11, #+4]
        ANDS     R0,R0,#0xC2
        CMP      R0,#+192
        BNE.N    ??spiffs_populate_ix_map_v_8
        LDRH     R0,[R11, #+2]
        LDRH     R1,[R10, #+8]
        CMP      R0,R1
        BCC.N    ??spiffs_populate_ix_map_v_8
        LDRH     R0,[R10, #+10]
        LDRH     R1,[R11, #+2]
        CMP      R0,R1
        BCC.N    ??spiffs_populate_ix_map_v_8
        ADDS     R0,R11,#+8
        STR      R0,[SP, #+4]
        MOVS     R0,#+120
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+8]
        MOVS     R1,#+128
        MULS     R0,R1,R0
        ADDS     R3,R0,#+8
        MOVS     R2,#+0
        MOVS     R1,#+21
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOV      R9,R0
        CMP      R9,#+0
        BPL.N    ??spiffs_populate_ix_map_v_9
        MOV      R0,R9
        B.N      ??spiffs_populate_ix_map_v_1
??spiffs_populate_ix_map_v_9:
        MOV      R3,R11
        LDRH     R2,[R11, #+2]
        LDR      R1,[R10, #+0]
        MOVS     R0,R4
        BL       spiffs_update_ix_map
        LDR      R0,[R10, #+4]
        SUBS     R0,R0,#+1
        STR      R0,[R10, #+4]
??spiffs_populate_ix_map_v_8:
        CMP      R9,#+0
        BNE.N    ??spiffs_populate_ix_map_v_10
        LDR      R0,[R10, #+4]
        CMP      R0,#+0
        BEQ.N    ??spiffs_populate_ix_map_v_11
        LDR.W    R9,??DataTable11_14  ;; 0xffffd8aa
        B.N      ??spiffs_populate_ix_map_v_10
??spiffs_populate_ix_map_v_11:
        LDR.W    R9,??DataTable12_2  ;; 0xffffd8a8
??spiffs_populate_ix_map_v_10:
        MOV      R0,R9
??spiffs_populate_ix_map_v_1:
        POP      {R1-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_populate_ix_map:
        PUSH     {R4-R9,LR}
        SUB      SP,SP,#+36
        MOVS     R4,R0
        MOVS     R5,R1
        MOV      R8,R2
        MOV      R9,R3
        LDR      R7,[R5, #+44]
        LDRH     R0,[R7, #+10]
        LDRH     R1,[R7, #+8]
        SUBS     R0,R0,R1
        CMP      R0,R8
        BGE.N    ??spiffs_populate_ix_map_0
        LDRH     R0,[R7, #+10]
        LDRH     R1,[R7, #+8]
        SUBS     R8,R0,R1
        B.N      ??spiffs_populate_ix_map_1
??spiffs_populate_ix_map_0:
??spiffs_populate_ix_map_1:
        LDRH     R0,[R7, #+10]
        LDRH     R1,[R7, #+8]
        SUBS     R0,R0,R1
        CMP      R9,R0
        BGE.N    ??spiffs_populate_ix_map_2
        LDRH     R0,[R7, #+10]
        LDRH     R1,[R7, #+8]
        SUBS     R9,R0,R1
        B.N      ??spiffs_populate_ix_map_3
??spiffs_populate_ix_map_2:
??spiffs_populate_ix_map_3:
        CMP      R9,R8
        BCS.N    ??spiffs_populate_ix_map_4
        LDR.W    R0,??DataTable13_2  ;; 0xffffd8c9
        B.N      ??spiffs_populate_ix_map_5
??spiffs_populate_ix_map_4:
        LDRH     R0,[R7, #+8]
        ADDS     R0,R8,R0
        CMP      R0,#+39
        BCS.N    ??spiffs_populate_ix_map_6
        MOVS     R0,#+0
        STRH     R0,[SP, #+32]
        B.N      ??spiffs_populate_ix_map_7
??spiffs_populate_ix_map_6:
        LDRH     R0,[R7, #+8]
        ADDS     R0,R8,R0
        SUBS     R0,R0,#+39
        MOVS     R1,#+60
        UDIV     R0,R0,R1
        ADDS     R0,R0,#+1
        STRH     R0,[SP, #+32]
??spiffs_populate_ix_map_7:
        LDRH     R0,[R7, #+8]
        ADDS     R0,R9,R0
        CMP      R0,#+39
        BCS.N    ??spiffs_populate_ix_map_8
        MOVS     R0,#+0
        B.N      ??spiffs_populate_ix_map_9
??spiffs_populate_ix_map_8:
        LDRH     R0,[R7, #+8]
        ADDS     R0,R9,R0
        SUBS     R0,R0,#+39
        MOVS     R1,#+60
        UDIV     R0,R0,R1
        ADDS     R0,R0,#+1
??spiffs_populate_ix_map_9:
        STRH     R0,[SP, #+34]
        LDRH     R0,[SP, #+34]
        LDRH     R1,[SP, #+32]
        SUBS     R0,R0,R1
        ADDS     R0,R0,#+1
        STR      R0,[SP, #+28]
        STR      R5,[SP, #+24]
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
        ADD      R0,SP,#+24
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        LDR.W    R0,??DataTable13_3
        STR      R0,[SP, #+4]
        LDRH     R0,[R5, #+6]
        ORRS     R0,R0,#0x8000
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STR      R0,[SP, #+0]
        MOVS     R3,#+1
        LDRH     R0,[R5, #+12]
        MOVS     R1,#+32
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        SUBS     R2,R2,#+1
        LDRH     R0,[R5, #+12]
        MOVS     R1,#+32
        SDIV     R1,R0,R1
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_entry_visitor
        MOVS     R6,R0
        LDR.W    R0,??DataTable12_2  ;; 0xffffd8a8
        CMP      R6,R0
        BNE.N    ??spiffs_populate_ix_map_10
        MOVS     R0,#+0
        MOVS     R6,R0
??spiffs_populate_ix_map_10:
        MOVS     R0,R6
??spiffs_populate_ix_map_5:
        ADD      SP,SP,#+36
        POP      {R4-R9,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11:
        DC32     0xffffd8e1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_1:
        DC32     0xffffd8e0

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_2:
        DC32     0xffffd8df

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_3:
        DC32     0xffffd8e4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_4:
        DC32     0xffffd8ec

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_5:
        DC32     0xffffd8eb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_6:
        DC32     0xffffd8e5

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_7:
        DC32     0xffffd8e2

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_8:
        DC32     0xffffd8de

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_9:
        DC32     0xffffd8dd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_10:
        DC32     0xffffd8dc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_11:
        DC32     0xffffd8ea

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_12:
        DC32     0xffffd8e3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_13:
        DC32     0xffffd8a8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_14:
        DC32     0xffffd8aa

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable11_15:
        DC32     0xffffd8a9

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_page_allocate_data:
        PUSH     {R1,R4-R11,LR}
        SUB      SP,SP,#+16
        MOVS     R5,R0
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+56]
        LDR      R9,[SP, #+60]
        LDR      R4,[SP, #+64]
        LDR      R10,[SP, #+68]
        MOVS     R11,#+0
        ADD      R0,SP,#+12
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+8
        LDR      R2,[R5, #+24]
        LDRH     R1,[R5, #+20]
        MOVS     R0,R5
        BL       spiffs_obj_lu_find_free
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_page_allocate_data_0
        MOV      R0,R11
        B.N      ??spiffs_page_allocate_data_1
??spiffs_page_allocate_data_0:
        ADD      R0,SP,#+16
        STR      R0,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+8]
        MOV      R1,#+4096
        LDR      R2,[SP, #+12]
        LSLS     R2,R2,#+1
        MLA      R3,R1,R0,R2
        MOVS     R2,#+0
        MOVS     R1,#+4
        MOVS     R0,R5
        BL       spiffs_phys_wr
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_page_allocate_data_2
        MOV      R0,R11
        B.N      ??spiffs_page_allocate_data_1
??spiffs_page_allocate_data_2:
        LDR      R0,[R5, #+60]
        ADDS     R0,R0,#+1
        STR      R0,[R5, #+60]
        LDRB     R0,[R6, #+4]
        ANDS     R0,R0,#0xFE
        STRB     R0,[R6, #+4]
        STR      R6,[SP, #+4]
        MOVS     R0,#+5
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+8]
        MOV      R1,#+4096
        LDR      R2,[SP, #+12]
        ADDS     R2,R2,#+1
        MOVS     R3,#+128
        MULS     R2,R3,R2
        MLA      R3,R1,R0,R2
        MOVS     R2,#+0
        MOVS     R1,#+7
        MOVS     R0,R5
        BL       spiffs_phys_wr
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_page_allocate_data_3
        MOV      R0,R11
        B.N      ??spiffs_page_allocate_data_1
??spiffs_page_allocate_data_3:
        CMP      R7,#+0
        BEQ.N    ??spiffs_page_allocate_data_4
        STR      R7,[SP, #+4]
        STR      R8,[SP, #+0]
        LDRH     R0,[SP, #+8]
        MOV      R1,#+4096
        LDR      R2,[SP, #+12]
        MOVS     R3,#+128
        MULS     R2,R3,R2
        MLA      R0,R1,R0,R2
        ADDS     R0,R9,R0
        ADDS     R3,R0,#+133
        MOVS     R2,#+0
        MOVS     R1,#+7
        MOVS     R0,R5
        BL       spiffs_phys_wr
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_page_allocate_data_5
        MOV      R0,R11
        B.N      ??spiffs_page_allocate_data_1
??spiffs_page_allocate_data_5:
??spiffs_page_allocate_data_4:
        UXTB     R4,R4            ;; ZeroExt  R4,R4,#+24,#+24
        CMP      R4,#+0
        BEQ.N    ??spiffs_page_allocate_data_6
        LDRB     R0,[R6, #+4]
        LSLS     R0,R0,#+30
        BPL.N    ??spiffs_page_allocate_data_6
        LDRB     R0,[R6, #+4]
        ANDS     R0,R0,#0xFD
        STRB     R0,[R6, #+4]
        ADDS     R0,R6,#+4
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+8]
        MOV      R1,#+4096
        LDR      R2,[SP, #+12]
        MOVS     R3,#+128
        MULS     R2,R3,R2
        MLA      R0,R1,R0,R2
        ADDS     R3,R0,#+132
        MOVS     R2,#+0
        MOVS     R1,#+7
        MOVS     R0,R5
        BL       spiffs_phys_wr
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_page_allocate_data_7
        MOV      R0,R11
        B.N      ??spiffs_page_allocate_data_1
??spiffs_page_allocate_data_7:
??spiffs_page_allocate_data_6:
        CMP      R10,#+0
        BEQ.N    ??spiffs_page_allocate_data_8
        LDRH     R0,[SP, #+8]
        LDR      R1,[SP, #+12]
        ADDS     R0,R1,R0, LSL #+5
        ADDS     R0,R0,#+1
        STRH     R0,[R10, #+0]
??spiffs_page_allocate_data_8:
        MOV      R0,R11
??spiffs_page_allocate_data_1:
        ADD      SP,SP,#+20
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_page_move:
        PUSH     {R3-R11,LR}
        SUB      SP,SP,#+16
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        LDR      R4,[SP, #+60]
        LDR      R8,[SP, #+64]
        MOVS     R9,#+0
        ADD      R0,SP,#+12
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+10
        LDR      R2,[R5, #+24]
        LDRH     R1,[R5, #+20]
        MOVS     R0,R5
        BL       spiffs_obj_lu_find_free
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_page_move_0
        MOV      R0,R11
        B.N      ??spiffs_page_move_1
??spiffs_page_move_0:
        LDRH     R0,[SP, #+10]
        LDR      R1,[SP, #+12]
        ADDS     R0,R1,R0, LSL #+5
        ADDS     R0,R0,#+1
        STRH     R0,[SP, #+8]
        CMP      R8,#+0
        BEQ.N    ??spiffs_page_move_2
        LDRH     R0,[SP, #+8]
        STRH     R0,[R8, #+0]
??spiffs_page_move_2:
        CMP      R7,#+0
        BEQ.N    ??spiffs_page_move_3
        MOV      R10,R7
        B.N      ??spiffs_page_move_4
??spiffs_page_move_3:
        LDR      R10,[SP, #+56]
??spiffs_page_move_4:
        CMP      R7,#+0
        BEQ.N    ??spiffs_page_move_5
        LDRB     R0,[R10, #+4]
        UBFX     R0,R0,#+1,#+1
        ANDS     R0,R0,#0x1
        EORS     R0,R0,#0x1
        MOV      R9,R0
        LDRB     R0,[R10, #+4]
        ORRS     R0,R0,#0x2
        STRB     R0,[R10, #+4]
        LDRB     R0,[R10, #+4]
        ANDS     R0,R0,#0xFE
        STRB     R0,[R10, #+4]
        STR      R7,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+8]
        MOVS     R1,#+128
        MUL      R3,R1,R0
        MOVS     R2,#+0
        MOVS     R1,#+7
        MOVS     R0,R5
        BL       spiffs_phys_wr
        MOV      R11,R0
        B.N      ??spiffs_page_move_6
??spiffs_page_move_5:
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R0,#+128
        MUL      R3,R0,R4
        LDRH     R0,[SP, #+8]
        MOVS     R1,#+128
        MUL      R2,R1,R0
        MOVS     R1,R6
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        BL       spiffs_phys_cpy
        MOV      R11,R0
??spiffs_page_move_6:
        CMP      R11,#+0
        BPL.N    ??spiffs_page_move_7
        MOV      R0,R11
        B.N      ??spiffs_page_move_1
??spiffs_page_move_7:
        ADD      R0,SP,#+16
        STR      R0,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+8]
        MOVS     R1,#+32
        SDIV     R0,R0,R1
        MOV      R1,#+4096
        LDRH     R2,[SP, #+8]
        MOVS     R3,#+32
        SDIV     R12,R2,R3
        MLS      R12,R12,R3,R2
        SUBS     R2,R12,#+1
        LSLS     R2,R2,#+1
        MLA      R3,R1,R0,R2
        MOVS     R2,#+0
        MOVS     R1,#+4
        MOVS     R0,R5
        BL       spiffs_phys_wr
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_page_move_8
        MOV      R0,R11
        B.N      ??spiffs_page_move_1
??spiffs_page_move_8:
        LDR      R0,[R5, #+60]
        ADDS     R0,R0,#+1
        STR      R0,[R5, #+60]
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BEQ.N    ??spiffs_page_move_9
        LDRB     R0,[R10, #+4]
        ANDS     R0,R0,#0xFC
        STRB     R0,[R10, #+4]
        ADDS     R0,R10,#+4
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+8]
        MOVS     R1,#+128
        MULS     R0,R1,R0
        ADDS     R3,R0,#+4
        MOVS     R2,R6
        SXTH     R2,R2            ;; SignExt  R2,R2,#+16,#+16
        MOVS     R1,#+7
        MOVS     R0,R5
        BL       spiffs_phys_wr
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_page_move_10
        MOV      R0,R11
        B.N      ??spiffs_page_move_1
??spiffs_page_move_10:
??spiffs_page_move_9:
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        BL       spiffs_page_delete
        MOV      R11,R0
        MOV      R0,R11
??spiffs_page_move_1:
        ADD      SP,SP,#+20
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_page_delete:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R0,#+126
        STRB     R0,[SP, #+16]
        MOVS     R0,#+0
        STRH     R0,[SP, #+8]
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R0,#+32
        SDIV     R0,R5,R0
        MOV      R1,#+4096
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R2,#+32
        SDIV     R3,R5,R2
        MLS      R3,R3,R2,R5
        SUBS     R2,R3,#+1
        LSLS     R2,R2,#+1
        MLA      R3,R1,R0,R2
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       spiffs_phys_wr
        MOVS     R6,R0
        CMP      R6,#+0
        BPL.N    ??spiffs_page_delete_0
        MOVS     R0,R6
        B.N      ??spiffs_page_delete_1
??spiffs_page_delete_0:
        LDR      R0,[R4, #+64]
        ADDS     R0,R0,#+1
        STR      R0,[R4, #+64]
        LDR      R0,[R4, #+60]
        SUBS     R0,R0,#+1
        STR      R0,[R4, #+60]
        ADD      R0,SP,#+16
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R0,#+128
        MUL      R0,R0,R5
        ADDS     R3,R0,#+4
        MOVS     R2,#+0
        MOVS     R1,#+3
        MOVS     R0,R4
        BL       spiffs_phys_wr
        MOVS     R6,R0
        MOVS     R0,R6
??spiffs_page_delete_1:
        ADD      SP,SP,#+24
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_object_create:
        PUSH     {R1,R2,R4-R11,LR}
        SUB      SP,SP,#+76
        MOVS     R5,R0
        MOVS     R6,R3
        LDR      R4,[SP, #+120]
        LDR      R7,[SP, #+124]
        MOVS     R8,#+0
        MOVS     R1,#+123
        MOVS     R0,R5
        BL       spiffs_gc_check
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??spiffs_object_create_0
        MOV      R0,R8
        B.N      ??spiffs_object_create_1
??spiffs_object_create_0:
        LDRH     R0,[SP, #+76]
        ORRS     R0,R0,#0x8000
        STRH     R0,[SP, #+76]
        ADD      R0,SP,#+16
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+12
        LDR      R2,[R5, #+24]
        LDRH     R1,[R5, #+20]
        MOVS     R0,R5
        BL       spiffs_obj_lu_find_free
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??spiffs_object_create_2
        MOV      R0,R8
        B.N      ??spiffs_object_create_1
??spiffs_object_create_2:
        ADD      R0,SP,#+76
        STR      R0,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+12]
        MOV      R1,#+4096
        LDR      R2,[SP, #+16]
        LSLS     R2,R2,#+1
        MLA      R3,R1,R0,R2
        MOVS     R2,#+0
        MOVS     R1,#+4
        MOVS     R0,R5
        BL       spiffs_phys_wr
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??spiffs_object_create_3
        MOV      R0,R8
        B.N      ??spiffs_object_create_1
??spiffs_object_create_3:
        LDR      R0,[R5, #+60]
        ADDS     R0,R0,#+1
        STR      R0,[R5, #+60]
        LDRH     R0,[SP, #+76]
        STRH     R0,[SP, #+20]
        MOVS     R0,#+0
        STRH     R0,[SP, #+22]
        MOVS     R0,#+248
        STRB     R0,[SP, #+24]
        STRB     R4,[SP, #+32]
        MOVS     R0,#-1
        STR      R0,[SP, #+28]
        MOVS     R2,#+32
        LDR      R1,[SP, #+80]
        ADD      R0,SP,#+33
        BL       strncpy
        CMP      R6,#+0
        BEQ.N    ??spiffs_object_create_4
        MOVS     R9,#+4
        ADD      R10,SP,#+65
        MOV      R2,R9
        MOVS     R1,R6
        MOV      R0,R10
        BL       __aeabi_memcpy
        B.N      ??spiffs_object_create_5
??spiffs_object_create_4:
        MOVS     R9,#+4
        MOV      R10,#+255
        ADD      R11,SP,#+65
        MOV      R2,R10
        MOV      R1,R9
        MOV      R0,R11
        BL       __aeabi_memset
??spiffs_object_create_5:
        ADD      R0,SP,#+20
        STR      R0,[SP, #+4]
        MOVS     R0,#+49
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+12]
        MOV      R1,#+4096
        LDR      R2,[SP, #+16]
        ADDS     R2,R2,#+1
        MOVS     R3,#+128
        MULS     R2,R3,R2
        MLA      R3,R1,R0,R2
        MOVS     R2,#+0
        MOVS     R1,#+7
        MOVS     R0,R5
        BL       spiffs_phys_wr
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??spiffs_object_create_6
        MOV      R0,R8
        B.N      ??spiffs_object_create_1
??spiffs_object_create_6:
        MOVS     R0,#-1
        STR      R0,[SP, #+8]
        LDRH     R0,[SP, #+12]
        LDR      R1,[SP, #+16]
        ADDS     R0,R1,R0, LSL #+5
        ADDS     R0,R0,#+1
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        LDRH     R3,[SP, #+76]
        MOVS     R2,#+1
        ADD      R1,SP,#+20
        MOVS     R0,R5
        BL       spiffs_cb_object_event
        CMP      R7,#+0
        BEQ.N    ??spiffs_object_create_7
        LDRH     R0,[SP, #+12]
        LDR      R1,[SP, #+16]
        ADDS     R0,R1,R0, LSL #+5
        ADDS     R0,R0,#+1
        STRH     R0,[R7, #+0]
??spiffs_object_create_7:
        MOV      R0,R8
??spiffs_object_create_1:
        ADD      SP,SP,#+84
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_object_update_index_hdr:
        PUSH     {R3-R11,LR}
        SUB      SP,SP,#+16
        MOVS     R4,R0
        MOVS     R5,R1
        MOV      R9,R2
        LDR      R6,[SP, #+56]
        LDR      R7,[SP, #+72]
        MOVS     R10,#+0
        ORRS     R9,R9,#0x8000
        CMP      R6,#+0
        BEQ.N    ??spiffs_object_update_index_hdr_0
        MOV      R8,R6
        B.N      ??spiffs_object_update_index_hdr_1
??spiffs_object_update_index_hdr_0:
        LDR      R0,[R4, #+40]
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+16]
        MOVS     R1,#+128
        MUL      R3,R1,R0
        LDRSH    R2,[R5, #+4]
        MOVS     R1,#+22
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_object_update_index_hdr_2
        MOV      R0,R10
        B.N      ??spiffs_object_update_index_hdr_3
??spiffs_object_update_index_hdr_2:
        LDR      R0,[R4, #+40]
        MOV      R8,R0
??spiffs_object_update_index_hdr_1:
        LDRB     R0,[R8, #+4]
        LSLS     R0,R0,#+31
        BPL.N    ??spiffs_object_update_index_hdr_4
        LDR.W    R0,??DataTable14  ;; 0xffffd8e4
        B.N      ??spiffs_object_update_index_hdr_3
??spiffs_object_update_index_hdr_4:
        LDRB     R0,[R8, #+4]
        LSLS     R0,R0,#+24
        BMI.N    ??spiffs_object_update_index_hdr_5
        LDR.W    R0,??DataTable14_1  ;; 0xffffd8ec
        B.N      ??spiffs_object_update_index_hdr_3
??spiffs_object_update_index_hdr_5:
        LDRB     R0,[R8, #+4]
        LSLS     R0,R0,#+30
        BPL.N    ??spiffs_object_update_index_hdr_6
        LDR.W    R0,??DataTable14_2  ;; 0xffffd8eb
        B.N      ??spiffs_object_update_index_hdr_3
??spiffs_object_update_index_hdr_6:
        LDRB     R0,[R8, #+4]
        LSLS     R0,R0,#+29
        BPL.N    ??spiffs_object_update_index_hdr_7
        LDR.W    R0,??DataTable14_3  ;; 0xffffd8ea
        B.N      ??spiffs_object_update_index_hdr_3
??spiffs_object_update_index_hdr_7:
        LSLS     R0,R9,#+16
        BMI.N    ??spiffs_object_update_index_hdr_8
        LDR.W    R0,??DataTable14_3  ;; 0xffffd8ea
        B.N      ??spiffs_object_update_index_hdr_3
??spiffs_object_update_index_hdr_8:
        LDRH     R0,[R8, #+2]
        CMP      R0,#+0
        BEQ.N    ??spiffs_object_update_index_hdr_9
        LDR.N    R0,??DataTable13_4  ;; 0xffffd8e3
        B.N      ??spiffs_object_update_index_hdr_3
??spiffs_object_update_index_hdr_9:
        LDR      R0,[SP, #+60]
        CMP      R0,#+0
        BEQ.N    ??spiffs_object_update_index_hdr_10
        MOVS     R2,#+32
        LDR      R1,[SP, #+60]
        ADDS     R0,R8,#+13
        BL       strncpy
??spiffs_object_update_index_hdr_10:
        LDR      R0,[SP, #+64]
        CMP      R0,#+0
        BEQ.N    ??spiffs_object_update_index_hdr_11
        MOVS     R0,#+4
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+64]
        STR      R0,[SP, #+0]
        ADDS     R11,R8,#+45
        LDR      R2,[SP, #+4]
        LDR      R1,[SP, #+0]
        MOV      R0,R11
        BL       __aeabi_memcpy
??spiffs_object_update_index_hdr_11:
        LDR      R0,[SP, #+68]
        CMP      R0,#+0
        BEQ.N    ??spiffs_object_update_index_hdr_12
        LDR      R0,[SP, #+68]
        STR      R0,[R8, #+8]
??spiffs_object_update_index_hdr_12:
        CMP      R5,#+0
        BNE.N    ??spiffs_object_update_index_hdr_13
        MOVS     R1,#+0
        B.N      ??spiffs_object_update_index_hdr_14
??spiffs_object_update_index_hdr_13:
        LDRSH    R1,[R5, #+4]
??spiffs_object_update_index_hdr_14:
        ADD      R0,SP,#+12
        STR      R0,[SP, #+8]
        LDRH     R0,[SP, #+16]
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOV      R3,R9
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOV      R2,R8
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_page_move
        MOV      R10,R0
        CMP      R10,#+0
        BNE.N    ??spiffs_object_update_index_hdr_15
        CMP      R7,#+0
        BEQ.N    ??spiffs_object_update_index_hdr_16
        LDRH     R0,[SP, #+12]
        STRH     R0,[R7, #+0]
??spiffs_object_update_index_hdr_16:
        CMP      R6,#+0
        BEQ.N    ??spiffs_object_update_index_hdr_17
        MOVS     R2,#+0
        B.N      ??spiffs_object_update_index_hdr_18
??spiffs_object_update_index_hdr_17:
        MOVS     R2,#+4
??spiffs_object_update_index_hdr_18:
        LDR      R0,[R8, #+8]
        STR      R0,[SP, #+8]
        LDRH     R0,[SP, #+12]
        STR      R0,[SP, #+4]
        LDRH     R0,[R8, #+2]
        STR      R0,[SP, #+0]
        MOV      R3,R9
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOV      R1,R8
        MOVS     R0,R4
        BL       spiffs_cb_object_event
        CMP      R5,#+0
        BEQ.N    ??spiffs_object_update_index_hdr_15
        LDRH     R0,[SP, #+12]
        STRH     R0,[R5, #+12]
??spiffs_object_update_index_hdr_15:
        MOV      R0,R10
??spiffs_object_update_index_hdr_3:
        ADD      SP,SP,#+20
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12:
        DC32     0xffffd8d7

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_1:
        DC32     spiffs_obj_lu_scan_v

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_2:
        DC32     0xffffd8a8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_3:
        DC32     0xffffd8d3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable12_4:
        DC32     0xffffd8ef

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_cb_object_event:
        PUSH     {R1,R4-R11,LR}
        SUB      SP,SP,#+8
        MOVS     R6,R0
        MOVS     R7,R2
        MOV      R8,R3
        LDR      R4,[SP, #+48]
        LDR      R5,[SP, #+52]
        LDR      R9,[SP, #+56]
        LSLS     R0,R8,#+17       ;; ZeroExtS R0,R8,#+17,#+17
        LSRS     R0,R0,#+17
        STRH     R0,[SP, #+0]
        LDR      R0,[R6, #+44]
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        MOV      R10,R0
??spiffs_cb_object_event_0:
        LDR      R0,[R6, #+48]
        CMP      R10,R0
        BCS.N    ??spiffs_cb_object_event_1
        LDR      R0,[SP, #+4]
        MOVS     R1,#+48
        MLA      R0,R1,R10,R0
        LDRH     R1,[R0, #+40]
        CMP      R1,#+0
        BEQ.N    ??spiffs_cb_object_event_2
        LDRH     R1,[R0, #+6]
        BICS     R1,R1,#0x8000
        LDRH     R2,[SP, #+0]
        CMP      R1,R2
        BEQ.N    ??spiffs_cb_object_event_3
??spiffs_cb_object_event_2:
        B.N      ??spiffs_cb_object_event_4
??spiffs_cb_object_event_3:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+0
        BNE.N    ??spiffs_cb_object_event_5
        CMP      R7,#+2
        BEQ.N    ??spiffs_cb_object_event_6
        STRH     R5,[R0, #+12]
        CMP      R9,#+0
        BEQ.N    ??spiffs_cb_object_event_5
        STR      R9,[R0, #+8]
        B.N      ??spiffs_cb_object_event_5
??spiffs_cb_object_event_6:
        MOVS     R1,#+0
        STRH     R1,[R0, #+4]
        MOVS     R1,#+0
        STRH     R1,[R0, #+6]
??spiffs_cb_object_event_5:
        LDRH     R1,[R0, #+16]
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R1,R4
        BNE.N    ??spiffs_cb_object_event_4
        CMP      R7,#+2
        BEQ.N    ??spiffs_cb_object_event_7
        STRH     R5,[R0, #+14]
        B.N      ??spiffs_cb_object_event_4
??spiffs_cb_object_event_7:
        MOVS     R1,#+0
        STRH     R1,[R0, #+14]
??spiffs_cb_object_event_4:
        ADDS     R10,R10,#+1
        B.N      ??spiffs_cb_object_event_0
??spiffs_cb_object_event_1:
        CMP      R7,#+0
        BEQ.N    ??spiffs_cb_object_event_8
        CMP      R7,#+1
        BNE.N    ??spiffs_cb_object_event_9
??spiffs_cb_object_event_8:
        MOVS     R0,#+0
        MOV      R10,R0
??spiffs_cb_object_event_10:
        LDR      R0,[R6, #+48]
        CMP      R10,R0
        BCS.N    ??spiffs_cb_object_event_9
        LDR      R0,[SP, #+4]
        MOVS     R1,#+48
        MLA      R11,R1,R10,R0
        LDRSH    R0,[R11, #+4]
        CMP      R0,#+0
        BEQ.N    ??spiffs_cb_object_event_11
        LDR      R0,[R11, #+44]
        CMP      R0,#+0
        BEQ.N    ??spiffs_cb_object_event_11
        LDRH     R0,[R11, #+6]
        BICS     R0,R0,#0x8000
        LDRH     R1,[SP, #+0]
        CMP      R0,R1
        BEQ.N    ??spiffs_cb_object_event_12
??spiffs_cb_object_event_11:
        B.N      ??spiffs_cb_object_event_13
??spiffs_cb_object_event_12:
        LDR      R3,[SP, #+8]
        MOVS     R2,R4
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        MOV      R1,R11
        MOVS     R0,R6
        BL       spiffs_update_ix_map
??spiffs_cb_object_event_13:
        ADDS     R10,R10,#+1
        B.N      ??spiffs_cb_object_event_10
??spiffs_cb_object_event_9:
        LDR      R0,[R6, #+96]
        CMP      R0,#+0
        BEQ.N    ??spiffs_cb_object_event_14
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+0
        BNE.N    ??spiffs_cb_object_event_14
        LSLS     R0,R8,#+16
        BPL.N    ??spiffs_cb_object_event_14
        CMP      R7,#+1
        BNE.N    ??spiffs_cb_object_event_15
        MOVS     R0,#+0
        MOV      R11,R0
        B.N      ??spiffs_cb_object_event_16
??spiffs_cb_object_event_15:
        CMP      R7,#+0
        BEQ.N    ??spiffs_cb_object_event_17
        CMP      R7,#+3
        BEQ.N    ??spiffs_cb_object_event_17
        CMP      R7,#+4
        BNE.N    ??spiffs_cb_object_event_18
??spiffs_cb_object_event_17:
        MOVS     R0,#+1
        MOV      R11,R0
        B.N      ??spiffs_cb_object_event_16
??spiffs_cb_object_event_18:
        CMP      R7,#+2
        BNE.N    ??spiffs_cb_object_event_19
        MOVS     R0,#+2
        MOV      R11,R0
        B.N      ??spiffs_cb_object_event_16
??spiffs_cb_object_event_19:
        B.N      ??spiffs_cb_object_event_20
??spiffs_cb_object_event_16:
        MOVS     R3,R5
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRH     R2,[SP, #+0]
        MOV      R1,R11
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        MOVS     R0,R6
        LDR      R12,[R6, #+96]
        BLX      R12
??spiffs_cb_object_event_14:
??spiffs_cb_object_event_20:
        POP      {R0-R2,R4-R11,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_object_open_by_id:
        PUSH     {R4-R9,LR}
        SUB      SP,SP,#+12
        MOVS     R5,R0
        MOVS     R6,R1
        MOVS     R7,R2
        MOV      R8,R3
        LDR      R4,[SP, #+40]
        MOVS     R9,#+0
        ADD      R0,SP,#+4
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        ORRS     R1,R6,#0x8000
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        BL       spiffs_obj_lu_find_id_and_span
        MOV      R9,R0
        CMP      R9,#+0
        BPL.N    ??spiffs_object_open_by_id_0
        MOV      R0,R9
        B.N      ??spiffs_object_open_by_id_1
??spiffs_object_open_by_id_0:
        MOVS     R0,R4
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STR      R0,[SP, #+0]
        MOV      R3,R8
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        MOVS     R2,R7
        LDRH     R1,[SP, #+4]
        MOVS     R0,R5
        BL       spiffs_object_open_by_page
        MOV      R9,R0
        MOV      R0,R9
??spiffs_object_open_by_id_1:
        POP      {R1-R9,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_object_open_by_page:
        PUSH     {R4-R10,LR}
        SUB      SP,SP,#+64
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        MOVS     R8,#+0
        ADD      R0,SP,#+12
        STR      R0,[SP, #+4]
        MOVS     R0,#+49
        STR      R0,[SP, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R0,#+128
        MUL      R3,R0,R5
        LDRSH    R2,[R6, #+4]
        MOVS     R1,#+22
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOV      R8,R0
        CMP      R8,#+0
        BPL.N    ??spiffs_object_open_by_page_0
        MOV      R0,R8
        B.N      ??spiffs_object_open_by_page_1
??spiffs_object_open_by_page_0:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R0,#+32
        SDIV     R9,R5,R0
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R0,#+32
        SDIV     R1,R5,R0
        MLS      R1,R1,R0,R5
        SUBS     R10,R1,#+1
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        MOV      R0,#+4096
        LSLS     R1,R10,#+1
        MLA      R3,R0,R9,R1
        MOVS     R2,#+0
        MOVS     R1,#+20
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOV      R8,R0
        STR      R4,[R6, #+0]
        STRH     R5,[R6, #+12]
        LDR      R0,[SP, #+20]
        STR      R0,[R6, #+8]
        MOVS     R0,#+0
        STR      R0,[R6, #+20]
        STRH     R5,[R6, #+14]
        MOVS     R0,#+0
        STRH     R0,[R6, #+16]
        LDRH     R0,[SP, #+8]
        STRH     R0,[R6, #+6]
        STRH     R7,[R6, #+28]
        LDRB     R0,[SP, #+16]
        LSLS     R0,R0,#+31
        BPL.N    ??spiffs_object_open_by_page_2
        LDR.W    R0,??DataTable14  ;; 0xffffd8e4
        B.N      ??spiffs_object_open_by_page_1
??spiffs_object_open_by_page_2:
        LDRB     R0,[SP, #+16]
        LSLS     R0,R0,#+24
        BMI.N    ??spiffs_object_open_by_page_3
        LDR.W    R0,??DataTable14_1  ;; 0xffffd8ec
        B.N      ??spiffs_object_open_by_page_1
??spiffs_object_open_by_page_3:
        LDRB     R0,[SP, #+16]
        LSLS     R0,R0,#+30
        BPL.N    ??spiffs_object_open_by_page_4
        LDR.W    R0,??DataTable14_2  ;; 0xffffd8eb
        B.N      ??spiffs_object_open_by_page_1
??spiffs_object_open_by_page_4:
        LDRB     R0,[SP, #+16]
        LSLS     R0,R0,#+29
        BPL.N    ??spiffs_object_open_by_page_5
        LDR.W    R0,??DataTable14_3  ;; 0xffffd8ea
        B.N      ??spiffs_object_open_by_page_1
??spiffs_object_open_by_page_5:
        LDRH     R0,[R6, #+6]
        LSLS     R0,R0,#+16
        BMI.N    ??spiffs_object_open_by_page_6
        LDR.W    R0,??DataTable14_3  ;; 0xffffd8ea
        B.N      ??spiffs_object_open_by_page_1
??spiffs_object_open_by_page_6:
        LDRH     R0,[SP, #+14]
        CMP      R0,#+0
        BEQ.N    ??spiffs_object_open_by_page_7
        LDR.N    R0,??DataTable13_4  ;; 0xffffd8e3
        B.N      ??spiffs_object_open_by_page_1
??spiffs_object_open_by_page_7:
        MOV      R0,R8
??spiffs_object_open_by_page_1:
        ADD      SP,SP,#+64
        POP      {R4-R10,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13:
        DC32     0xffffd8ee

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_1:
        DC32     spiffs_obj_lu_find_id_and_span_v

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_2:
        DC32     0xffffd8c9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_3:
        DC32     spiffs_populate_ix_map_v

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable13_4:
        DC32     0xffffd8e3

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_object_append:
        PUSH     {R2-R11,LR}
        SUB      SP,SP,#+60
        MOVS     R4,R0
        MOVS     R5,R1
        LDR      R6,[R4, #+0]
        MOVS     R11,#+0
        MOVS     R7,#+0
        LDR      R0,[R4, #+8]
        CMP      R0,R5
        BCS.N    ??spiffs_object_append_0
        LDR      R0,[R4, #+8]
        MOVS     R5,R0
??spiffs_object_append_0:
        LDR      R0,[SP, #+64]
        ADDS     R1,R0,#+123
        MOVS     R0,R6
        BL       spiffs_gc_check
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_append_1
        MOV      R0,R11
        B.N      ??spiffs_object_append_2
??spiffs_object_append_1:
        LDR      R0,[R6, #+40]
        STR      R0,[SP, #+24]
        LDR      R0,[R6, #+40]
        STR      R0,[SP, #+40]
        MOVS     R9,#+0
        MOVW     R0,#+65535
        STRH     R0,[SP, #+28]
        LDRH     R0,[R4, #+12]
        STRH     R0,[SP, #+20]
        MOVS     R0,#+123
        UDIV     R8,R5,R0
        MOVS     R0,#+123
        UDIV     R1,R5,R0
        MLS      R0,R0,R1,R5
        STR      R0,[SP, #+36]
??spiffs_object_append_3:
        CMP      R11,#+0
        BNE.W    ??spiffs_object_append_4
        LDR      R0,[SP, #+64]
        CMP      R7,R0
        BCS.W    ??spiffs_object_append_4
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+39
        BCS.N    ??spiffs_object_append_5
        MOVS     R9,#+0
        B.N      ??spiffs_object_append_6
??spiffs_object_append_5:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        SUBS     R0,R8,#+39
        MOVS     R1,#+60
        UDIV     R0,R0,R1
        ADDS     R9,R0,#+1
??spiffs_object_append_6:
        LDRH     R0,[SP, #+28]
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R9,R0
        BEQ.W    ??spiffs_object_append_7
        CMP      R7,#+0
        BEQ.W    ??spiffs_object_append_8
        LDRH     R0,[SP, #+28]
        CMP      R0,#+0
        BNE.N    ??spiffs_object_append_9
        ADDS     R0,R7,R5
        LDR      R1,[SP, #+24]
        STR      R0,[R1, #+8]
        CMP      R5,#+0
        BNE.N    ??spiffs_object_append_10
        MOVS     R3,#+0
        LDRH     R2,[SP, #+20]
        MOVS     R1,R4
        MOVS     R0,R6
        BL       spiffs_page_index_check
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_append_11
        MOV      R0,R11
        B.N      ??spiffs_object_append_2
??spiffs_object_append_11:
        LDR      R0,[R6, #+40]
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+20]
        MOVS     R1,#+128
        MUL      R3,R1,R0
        LDRSH    R2,[R4, #+4]
        MOVS     R1,#+6
        MOVS     R0,R6
        BL       spiffs_phys_wr
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_append_12
        MOV      R0,R11
        B.N      ??spiffs_object_append_2
??spiffs_object_append_12:
        B.N      ??spiffs_object_append_13
??spiffs_object_append_10:
        ADD      R0,SP,#+32
        STR      R0,[SP, #+16]
        ADDS     R0,R7,R5
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        LDR      R0,[R6, #+40]
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+12]
        LDRH     R2,[R4, #+6]
        MOVS     R1,R4
        MOVS     R0,R6
        BL       spiffs_object_update_index_hdr
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_append_14
        MOV      R0,R11
        B.N      ??spiffs_object_append_2
??spiffs_object_append_14:
        B.N      ??spiffs_object_append_13
??spiffs_object_append_9:
        LDRH     R3,[SP, #+28]
        LDRH     R2,[SP, #+20]
        MOVS     R1,R4
        MOVS     R0,R6
        BL       spiffs_page_index_check
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_append_15
        MOV      R0,R11
        B.N      ??spiffs_object_append_2
??spiffs_object_append_15:
        LDR      R0,[R6, #+40]
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+20]
        MOVS     R1,#+128
        MUL      R3,R1,R0
        LDRSH    R2,[R4, #+4]
        MOVS     R1,#+6
        MOVS     R0,R6
        BL       spiffs_phys_wr
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_append_16
        MOV      R0,R11
        B.N      ??spiffs_object_append_2
??spiffs_object_append_16:
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        LDRH     R0,[SP, #+20]
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+40]
        LDRH     R0,[R0, #+2]
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+6]
        MOVS     R2,#+0
        LDR      R1,[R6, #+40]
        MOVS     R0,R6
        BL       spiffs_cb_object_event
        ADD      R0,SP,#+32
        STR      R0,[SP, #+16]
        ADDS     R0,R7,R5
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+12]
        LDRH     R2,[R4, #+6]
        MOVS     R1,R4
        MOVS     R0,R6
        BL       spiffs_object_update_index_hdr
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_append_17
        MOV      R0,R11
        B.N      ??spiffs_object_append_2
??spiffs_object_append_17:
??spiffs_object_append_13:
        ADDS     R0,R7,R5
        STR      R0,[R4, #+8]
        ADDS     R0,R7,R5
        STR      R0,[R4, #+20]
??spiffs_object_append_8:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R9,#+0
        BNE.N    ??spiffs_object_append_18
        LDR      R0,[R6, #+40]
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+20]
        MOVS     R1,#+128
        MUL      R3,R1,R0
        LDRSH    R2,[R4, #+4]
        MOVS     R1,#+22
        MOVS     R0,R6
        BL       spiffs_phys_rd
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_append_19
        MOV      R0,R11
        B.N      ??spiffs_object_append_2
??spiffs_object_append_19:
        LDR      R0,[SP, #+24]
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+31
        BPL.N    ??spiffs_object_append_20
        LDR.W    R0,??DataTable14  ;; 0xffffd8e4
        B.N      ??spiffs_object_append_2
??spiffs_object_append_20:
        LDR      R0,[SP, #+24]
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+24
        BMI.N    ??spiffs_object_append_21
        LDR.W    R0,??DataTable14_1  ;; 0xffffd8ec
        B.N      ??spiffs_object_append_2
??spiffs_object_append_21:
        LDR      R0,[SP, #+24]
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+30
        BPL.N    ??spiffs_object_append_22
        LDR.W    R0,??DataTable14_2  ;; 0xffffd8eb
        B.N      ??spiffs_object_append_2
??spiffs_object_append_22:
        LDR      R0,[SP, #+24]
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+29
        BPL.N    ??spiffs_object_append_23
        LDR.W    R0,??DataTable14_3  ;; 0xffffd8ea
        B.N      ??spiffs_object_append_2
??spiffs_object_append_23:
        LDRH     R0,[R4, #+6]
        LSLS     R0,R0,#+16
        BMI.N    ??spiffs_object_append_24
        LDR.W    R0,??DataTable14_3  ;; 0xffffd8ea
        B.N      ??spiffs_object_append_2
??spiffs_object_append_24:
        LDR      R0,[SP, #+24]
        LDRH     R0,[R0, #+2]
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R0,R9
        BEQ.W    ??spiffs_object_append_25
        LDR.W    R0,??DataTable17  ;; 0xffffd8e3
        B.N      ??spiffs_object_append_2
??spiffs_object_append_18:
        LDR      R0,[R4, #+8]
        SUBS     R0,R0,#+1
        MOVS     R1,#+123
        UDIV     R0,R0,R1
        CMP      R0,#+39
        BCS.N    ??spiffs_object_append_26
        MOVS     R10,#+0
        B.N      ??spiffs_object_append_27
??spiffs_object_append_26:
        LDR      R0,[R4, #+8]
        SUBS     R0,R0,#+1
        MOVS     R1,#+123
        UDIV     R0,R0,R1
        SUBS     R0,R0,#+39
        MOVS     R1,#+60
        UDIV     R0,R0,R1
        ADDS     R10,R0,#+1
??spiffs_object_append_27:
        CMP      R7,#+0
        BNE.N    ??spiffs_object_append_28
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R10,R9
        BCS.N    ??spiffs_object_append_29
??spiffs_object_append_28:
        LDRH     R0,[R4, #+6]
        ORRS     R0,R0,#0x8000
        STRH     R0,[SP, #+44]
        STRH     R9,[SP, #+46]
        MOVS     R0,#+249
        STRB     R0,[SP, #+48]
        ADD      R0,SP,#+20
        STR      R0,[SP, #+12]
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        ADD      R2,SP,#+44
        LDRH     R0,[R4, #+6]
        ORRS     R1,R0,#0x8000
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R6
        BL       spiffs_page_allocate_data
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_append_30
        MOV      R0,R11
        B.N      ??spiffs_object_append_2
??spiffs_object_append_30:
        MOVS     R0,#+128
        STR      R0,[SP, #+56]
        MOVS     R0,#+255
        STR      R0,[SP, #+52]
        LDR      R0,[R6, #+40]
        STR      R0,[SP, #+0]
        LDR      R2,[SP, #+52]
        LDR      R1,[SP, #+56]
        LDR      R0,[SP, #+0]
        BL       __aeabi_memset
        LDR      R0,[SP, #+0]
        MOVS     R0,#+5
        STR      R0,[SP, #+16]
        ADD      R0,SP,#+44
        STR      R0,[SP, #+12]
        LDR      R0,[R6, #+40]
        STR      R0,[SP, #+0]
        LDR      R2,[SP, #+16]
        LDR      R1,[SP, #+12]
        LDR      R0,[SP, #+0]
        BL       __aeabi_memcpy
        LDR      R0,[SP, #+0]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        LDRH     R0,[SP, #+20]
        STR      R0,[SP, #+4]
        MOV      R0,R9
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+6]
        MOVS     R2,#+1
        LDR      R1,[R6, #+40]
        MOVS     R0,R6
        BL       spiffs_cb_object_event
        B.N      ??spiffs_object_append_31
??spiffs_object_append_29:
        LDRH     R0,[R4, #+16]
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R0,R9
        BNE.N    ??spiffs_object_append_32
        LDRH     R0,[R4, #+14]
        STRH     R0,[SP, #+30]
        B.N      ??spiffs_object_append_33
??spiffs_object_append_32:
        ADD      R0,SP,#+30
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOV      R2,R9
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDRH     R0,[R4, #+6]
        ORRS     R1,R0,#0x8000
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R6
        BL       spiffs_obj_lu_find_id_and_span
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_append_34
        MOV      R0,R11
        B.N      ??spiffs_object_append_2
??spiffs_object_append_34:
??spiffs_object_append_33:
        LDR      R0,[R6, #+40]
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+30]
        MOVS     R1,#+128
        MUL      R3,R1,R0
        LDRSH    R2,[R4, #+4]
        MOVS     R1,#+22
        MOVS     R0,R6
        BL       spiffs_phys_rd
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_append_35
        MOV      R0,R11
        B.N      ??spiffs_object_append_2
??spiffs_object_append_35:
        LDR      R0,[SP, #+24]
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+31
        BPL.N    ??spiffs_object_append_36
        LDR.N    R0,??DataTable14  ;; 0xffffd8e4
        B.N      ??spiffs_object_append_2
??spiffs_object_append_36:
        LDR      R0,[SP, #+24]
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+24
        BMI.N    ??spiffs_object_append_37
        LDR.N    R0,??DataTable14_1  ;; 0xffffd8ec
        B.N      ??spiffs_object_append_2
??spiffs_object_append_37:
        LDR      R0,[SP, #+24]
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+30
        BPL.N    ??spiffs_object_append_38
        LDR.N    R0,??DataTable14_2  ;; 0xffffd8eb
        B.N      ??spiffs_object_append_2
??spiffs_object_append_38:
        LDR      R0,[SP, #+24]
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+29
        BPL.N    ??spiffs_object_append_39
        LDR.N    R0,??DataTable14_3  ;; 0xffffd8ea
        B.N      ??spiffs_object_append_2
??spiffs_object_append_39:
        LDRH     R0,[R4, #+6]
        LSLS     R0,R0,#+16
        BMI.N    ??spiffs_object_append_40
        LDR.N    R0,??DataTable14_3  ;; 0xffffd8ea
        B.N      ??spiffs_object_append_2
??spiffs_object_append_40:
        LDR      R0,[SP, #+24]
        LDRH     R0,[R0, #+2]
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R0,R9
        BEQ.N    ??spiffs_object_append_41
        LDR.W    R0,??DataTable17  ;; 0xffffd8e3
        B.N      ??spiffs_object_append_2
??spiffs_object_append_41:
        LDRH     R0,[SP, #+30]
        STRH     R0,[SP, #+20]
??spiffs_object_append_31:
        LDRH     R0,[SP, #+20]
        STRH     R0,[R4, #+14]
        STRH     R9,[R4, #+16]
        ADDS     R0,R7,R5
        STR      R0,[R4, #+20]
        ADDS     R0,R7,R5
        STR      R0,[R4, #+8]
??spiffs_object_append_25:
        STRH     R9,[SP, #+28]
??spiffs_object_append_7:
        LDR      R0,[SP, #+64]
        SUBS     R0,R0,R7
        LDR      R1,[SP, #+36]
        RSBS     R1,R1,#+123
        CMP      R0,R1
        BCS.N    ??spiffs_object_append_42
        LDR      R0,[SP, #+64]
        SUBS     R10,R0,R7
        B.N      ??spiffs_object_append_43
??spiffs_object_append_42:
        LDR      R0,[SP, #+36]
        RSBS     R10,R0,#+123
??spiffs_object_append_43:
        LDR      R0,[SP, #+36]
        CMP      R0,#+0
        BNE.N    ??spiffs_object_append_44
        LDRH     R0,[R4, #+6]
        LSLS     R0,R0,#+17       ;; ZeroExtS R0,R0,#+17,#+17
        LSRS     R0,R0,#+17
        STRH     R0,[SP, #+44]
        STRH     R8,[SP, #+46]
        MOVS     R0,#+253
        STRB     R0,[SP, #+48]
        ADD      R0,SP,#+22
        STR      R0,[SP, #+12]
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        LDR      R0,[SP, #+36]
        STR      R0,[SP, #+4]
        STR      R10,[SP, #+0]
        LDR      R0,[SP, #+60]
        ADDS     R3,R7,R0
        ADD      R2,SP,#+44
        LDRH     R0,[R4, #+6]
        LSLS     R1,R0,#+17       ;; ZeroExtS R1,R0,#+17,#+17
        LSRS     R1,R1,#+17
        MOVS     R0,R6
        BL       spiffs_page_allocate_data
        MOV      R11,R0
        B.N      ??spiffs_object_append_45
??spiffs_object_append_44:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R9,#+0
        BNE.N    ??spiffs_object_append_46
        LDR      R0,[SP, #+24]
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        ADDS     R0,R0,R8, LSL #+1
        LDRH     R0,[R0, #+49]
        STRH     R0,[SP, #+22]
        B.N      ??spiffs_object_append_47
??spiffs_object_append_46:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+39
        BCS.N    ??spiffs_object_append_48
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOV      R0,R8
        B.N      ??spiffs_object_append_49
??spiffs_object_append_48:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        SUBS     R0,R8,#+39
        MOVS     R1,#+60
        UDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
??spiffs_object_append_49:
        LDR      R1,[SP, #+40]
        ADDS     R0,R1,R0, LSL #+1
        LDRH     R0,[R0, #+8]
        STRH     R0,[SP, #+22]
??spiffs_object_append_47:
        MOV      R3,R8
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRH     R2,[SP, #+22]
        MOVS     R1,R4
        MOVS     R0,R6
        BL       spiffs_page_data_check
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_append_50
        MOV      R0,R11
        B.N      ??spiffs_object_append_2
??spiffs_object_append_50:
        LDR      R0,[SP, #+60]
        ADDS     R0,R7,R0
        STR      R0,[SP, #+4]
        STR      R10,[SP, #+0]
        LDRH     R0,[SP, #+22]
        MOVS     R1,#+128
        LDR      R2,[SP, #+36]
        MLA      R0,R1,R0,R2
        ADDS     R3,R0,#+5
        LDRSH    R2,[R4, #+4]
        MOVS     R1,#+7
        MOVS     R0,R6
        BL       spiffs_phys_wr
        MOV      R11,R0
??spiffs_object_append_45:
        CMP      R11,#+0
        BNE.N    ??spiffs_object_append_4
??spiffs_object_append_51:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R9,#+0
        BNE.N    ??spiffs_object_append_52
        LDRH     R0,[SP, #+22]
        LDR      R1,[SP, #+24]
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        ADDS     R1,R1,R8, LSL #+1
        STRH     R0,[R1, #+49]
        ADDS     R0,R7,R5
        LDR      R1,[SP, #+24]
        STR      R0,[R1, #+8]
        B.N      ??spiffs_object_append_53
??spiffs_object_append_52:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+39
        BCS.N    ??spiffs_object_append_54
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOV      R0,R8
        B.N      ??spiffs_object_append_55
??spiffs_object_append_54:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        SUBS     R0,R8,#+39
        MOVS     R1,#+60
        UDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
??spiffs_object_append_55:
        LDRH     R1,[SP, #+22]
        LDR      R2,[SP, #+40]
        ADDS     R0,R2,R0, LSL #+1
        STRH     R1,[R0, #+8]
??spiffs_object_append_53:
        MOVS     R0,#+0
        STR      R0,[SP, #+36]
        ADDS     R8,R8,#+1
        ADDS     R7,R10,R7
        B.N      ??spiffs_object_append_3
??spiffs_object_append_4:
        ADDS     R0,R7,R5
        STR      R0,[R4, #+8]
        ADDS     R0,R7,R5
        STR      R0,[R4, #+20]
        LDRH     R0,[SP, #+20]
        STRH     R0,[R4, #+14]
        STRH     R9,[R4, #+16]
        MOVS     R10,#+0
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R9,#+0
        BEQ.N    ??spiffs_object_append_56
        MOV      R3,R9
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRH     R2,[SP, #+20]
        MOVS     R1,R4
        MOVS     R0,R6
        BL       spiffs_page_index_check
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_object_append_57
        MOV      R0,R10
        B.N      ??spiffs_object_append_2
??spiffs_object_append_57:
        LDR      R0,[R6, #+40]
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+20]
        MOVS     R1,#+128
        MUL      R3,R1,R0
        LDRSH    R2,[R4, #+4]
        MOVS     R1,#+6
        MOVS     R0,R6
        BL       spiffs_phys_wr
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_object_append_58
        MOV      R0,R10
        B.N      ??spiffs_object_append_2
??spiffs_object_append_58:
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        LDRH     R0,[SP, #+20]
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+40]
        LDRH     R0,[R0, #+2]
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+6]
        MOVS     R2,#+0
        LDR      R1,[R6, #+40]
        MOVS     R0,R6
        BL       spiffs_cb_object_event
        ADD      R0,SP,#+32
        STR      R0,[SP, #+16]
        ADDS     R0,R7,R5
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+12]
        LDRH     R2,[R4, #+6]
        MOVS     R1,R4
        MOVS     R0,R6
        BL       spiffs_object_update_index_hdr
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_object_append_59
        MOV      R0,R10
        B.N      ??spiffs_object_append_2
??spiffs_object_append_59:
        B.N      ??spiffs_object_append_60
??spiffs_object_append_56:
        CMP      R5,#+0
        BNE.N    ??spiffs_object_append_61
        ADDS     R0,R7,R5
        LDR      R1,[SP, #+24]
        STR      R0,[R1, #+8]
        MOV      R3,R9
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRH     R2,[SP, #+20]
        MOVS     R1,R4
        MOVS     R0,R6
        BL       spiffs_page_index_check
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_object_append_62
        MOV      R0,R10
        B.N      ??spiffs_object_append_2
??spiffs_object_append_62:
        LDR      R0,[R6, #+40]
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+20]
        MOVS     R1,#+128
        MUL      R3,R1,R0
        LDRSH    R2,[R4, #+4]
        MOVS     R1,#+6
        MOVS     R0,R6
        BL       spiffs_phys_wr
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_object_append_63
        MOV      R0,R10
        B.N      ??spiffs_object_append_2
??spiffs_object_append_63:
        LDR      R0,[SP, #+24]
        LDR      R0,[R0, #+8]
        STR      R0,[SP, #+8]
        LDRH     R0,[SP, #+20]
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+24]
        LDRH     R0,[R0, #+2]
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+6]
        MOVS     R2,#+4
        LDR      R1,[R6, #+40]
        MOVS     R0,R6
        BL       spiffs_cb_object_event
        B.N      ??spiffs_object_append_60
??spiffs_object_append_61:
        ADD      R0,SP,#+32
        STR      R0,[SP, #+16]
        ADDS     R0,R7,R5
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        LDR      R0,[R6, #+40]
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+12]
        LDRH     R2,[R4, #+6]
        MOVS     R1,R4
        MOVS     R0,R6
        BL       spiffs_object_update_index_hdr
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_object_append_64
        MOV      R0,R10
        B.N      ??spiffs_object_append_2
??spiffs_object_append_64:
??spiffs_object_append_60:
        MOV      R0,R11
??spiffs_object_append_2:
        ADD      SP,SP,#+68
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14:
        DC32     0xffffd8e4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_1:
        DC32     0xffffd8ec

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_2:
        DC32     0xffffd8eb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable14_3:
        DC32     0xffffd8ea

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_object_modify:
        PUSH     {R1-R11,LR}
        SUB      SP,SP,#+56
        MOVS     R4,R0
        LDR      R5,[R4, #+0]
        MOVS     R11,#+0
        MOVS     R6,#+0
        LDR      R0,[SP, #+64]
        ADDS     R1,R0,#+123
        MOVS     R0,R5
        BL       spiffs_gc_check
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_modify_0
        MOV      R0,R11
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_0:
        LDR      R7,[R5, #+40]
        LDR      R0,[R5, #+40]
        STR      R0,[SP, #+32]
        MOVS     R10,#+0
        MOVW     R0,#+65535
        STRH     R0,[SP, #+24]
        LDRH     R0,[R4, #+12]
        STRH     R0,[SP, #+20]
        LDR      R0,[SP, #+56]
        MOVS     R1,#+123
        UDIV     R8,R0,R1
        MOVS     R0,#+123
        LDR      R1,[SP, #+56]
        LDR      R2,[SP, #+56]
        UDIV     R2,R2,R0
        MLS      R9,R0,R2,R1
??spiffs_object_modify_2:
        CMP      R11,#+0
        BNE.W    ??spiffs_object_modify_3
        LDR      R0,[SP, #+64]
        CMP      R6,R0
        BCS.W    ??spiffs_object_modify_3
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+39
        BCS.N    ??spiffs_object_modify_4
        MOVS     R10,#+0
        B.N      ??spiffs_object_modify_5
??spiffs_object_modify_4:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        SUBS     R0,R8,#+39
        MOVS     R1,#+60
        UDIV     R0,R0,R1
        ADDS     R10,R0,#+1
??spiffs_object_modify_5:
        LDRH     R0,[SP, #+24]
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R10,R0
        BEQ.W    ??spiffs_object_modify_6
        CMP      R6,#+0
        BEQ.N    ??spiffs_object_modify_7
        LDRH     R0,[SP, #+24]
        CMP      R0,#+0
        BNE.N    ??spiffs_object_modify_8
        ADD      R0,SP,#+40
        STR      R0,[SP, #+16]
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        LDR      R0,[R5, #+40]
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+12]
        LDRH     R2,[R4, #+6]
        MOVS     R1,R4
        MOVS     R0,R5
        BL       spiffs_object_update_index_hdr
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_modify_9
        MOV      R0,R11
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_9:
        B.N      ??spiffs_object_modify_7
??spiffs_object_modify_8:
        LDRH     R3,[SP, #+24]
        LDRH     R2,[SP, #+20]
        MOVS     R1,R4
        MOVS     R0,R5
        BL       spiffs_page_index_check
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_modify_10
        MOV      R0,R11
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_10:
        ADD      R0,SP,#+38
        STR      R0,[SP, #+8]
        LDRH     R0,[SP, #+20]
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+6]
        LDR      R2,[SP, #+32]
        LDRSH    R1,[R4, #+4]
        MOVS     R0,R5
        BL       spiffs_page_move
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_modify_11
        MOV      R0,R11
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_11:
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        LDRH     R0,[SP, #+38]
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+32]
        LDRH     R0,[R0, #+2]
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+6]
        MOVS     R2,#+0
        LDR      R1,[SP, #+32]
        MOVS     R0,R5
        BL       spiffs_cb_object_event
??spiffs_object_modify_7:
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R10,#+0
        BNE.N    ??spiffs_object_modify_12
        LDR      R0,[R5, #+40]
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+20]
        MOVS     R1,#+128
        MUL      R3,R1,R0
        LDRSH    R2,[R4, #+4]
        MOVS     R1,#+22
        MOVS     R0,R5
        BL       spiffs_phys_rd
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_modify_13
        MOV      R0,R11
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_13:
        LDRB     R0,[R7, #+4]
        LSLS     R0,R0,#+31
        BPL.N    ??spiffs_object_modify_14
        LDR.W    R0,??DataTable18  ;; 0xffffd8e4
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_14:
        LDRB     R0,[R7, #+4]
        LSLS     R0,R0,#+24
        BMI.N    ??spiffs_object_modify_15
        LDR.W    R0,??DataTable19  ;; 0xffffd8ec
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_15:
        LDRB     R0,[R7, #+4]
        LSLS     R0,R0,#+30
        BPL.N    ??spiffs_object_modify_16
        LDR.W    R0,??DataTable19_1  ;; 0xffffd8eb
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_16:
        LDRB     R0,[R7, #+4]
        LSLS     R0,R0,#+29
        BPL.N    ??spiffs_object_modify_17
        LDR.W    R0,??DataTable19_2  ;; 0xffffd8ea
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_17:
        LDRH     R0,[R4, #+6]
        LSLS     R0,R0,#+16
        BMI.N    ??spiffs_object_modify_18
        LDR.W    R0,??DataTable19_2  ;; 0xffffd8ea
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_18:
        LDRH     R0,[R7, #+2]
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R0,R10
        BEQ.N    ??spiffs_object_modify_19
        LDR.W    R0,??DataTable17  ;; 0xffffd8e3
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_12:
        LDRH     R0,[R4, #+16]
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R0,R10
        BNE.N    ??spiffs_object_modify_20
        LDRH     R0,[R4, #+14]
        STRH     R0,[SP, #+26]
        B.N      ??spiffs_object_modify_21
??spiffs_object_modify_20:
        ADD      R0,SP,#+26
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOV      R2,R10
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDRH     R0,[R4, #+6]
        ORRS     R1,R0,#0x8000
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        BL       spiffs_obj_lu_find_id_and_span
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_modify_22
        MOV      R0,R11
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_22:
??spiffs_object_modify_21:
        LDR      R0,[R5, #+40]
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+26]
        MOVS     R1,#+128
        MUL      R3,R1,R0
        LDRSH    R2,[R4, #+4]
        MOVS     R1,#+22
        MOVS     R0,R5
        BL       spiffs_phys_rd
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_modify_23
        MOV      R0,R11
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_23:
        LDRB     R0,[R7, #+4]
        LSLS     R0,R0,#+31
        BPL.N    ??spiffs_object_modify_24
        LDR.W    R0,??DataTable18  ;; 0xffffd8e4
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_24:
        LDRB     R0,[R7, #+4]
        LSLS     R0,R0,#+24
        BMI.N    ??spiffs_object_modify_25
        LDR.W    R0,??DataTable19  ;; 0xffffd8ec
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_25:
        LDRB     R0,[R7, #+4]
        LSLS     R0,R0,#+30
        BPL.N    ??spiffs_object_modify_26
        LDR.W    R0,??DataTable19_1  ;; 0xffffd8eb
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_26:
        LDRB     R0,[R7, #+4]
        LSLS     R0,R0,#+29
        BPL.N    ??spiffs_object_modify_27
        LDR.W    R0,??DataTable19_2  ;; 0xffffd8ea
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_27:
        LDRH     R0,[R4, #+6]
        LSLS     R0,R0,#+16
        BMI.N    ??spiffs_object_modify_28
        LDR.W    R0,??DataTable19_2  ;; 0xffffd8ea
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_28:
        LDRH     R0,[R7, #+2]
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R0,R10
        BEQ.N    ??spiffs_object_modify_29
        LDR.W    R0,??DataTable17  ;; 0xffffd8e3
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_29:
        LDRH     R0,[SP, #+26]
        STRH     R0,[SP, #+20]
??spiffs_object_modify_19:
        LDRH     R0,[SP, #+20]
        STRH     R0,[R4, #+14]
        STRH     R10,[R4, #+16]
        LDR      R0,[SP, #+56]
        ADDS     R0,R6,R0
        STR      R0,[R4, #+20]
        STRH     R10,[SP, #+24]
??spiffs_object_modify_6:
        LDR      R0,[SP, #+64]
        SUBS     R0,R0,R6
        RSBS     R1,R9,#+123
        CMP      R0,R1
        BCS.N    ??spiffs_object_modify_30
        LDR      R0,[SP, #+64]
        SUBS     R0,R0,R6
        STR      R0,[SP, #+28]
        B.N      ??spiffs_object_modify_31
??spiffs_object_modify_30:
        RSBS     R0,R9,#+123
        STR      R0,[SP, #+28]
??spiffs_object_modify_31:
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R10,#+0
        BNE.N    ??spiffs_object_modify_32
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        ADDS     R0,R7,R8, LSL #+1
        LDRH     R0,[R0, #+49]
        STRH     R0,[SP, #+16]
        B.N      ??spiffs_object_modify_33
??spiffs_object_modify_32:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+39
        BCS.N    ??spiffs_object_modify_34
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOV      R0,R8
        B.N      ??spiffs_object_modify_35
??spiffs_object_modify_34:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        SUBS     R0,R8,#+39
        MOVS     R1,#+60
        UDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
??spiffs_object_modify_35:
        LDR      R1,[SP, #+32]
        ADDS     R0,R1,R0, LSL #+1
        LDRH     R0,[R0, #+8]
        STRH     R0,[SP, #+16]
??spiffs_object_modify_33:
        LDRH     R0,[R4, #+6]
        LSLS     R0,R0,#+17       ;; ZeroExtS R0,R0,#+17,#+17
        LSRS     R0,R0,#+17
        STRH     R0,[SP, #+44]
        STRH     R8,[SP, #+46]
        MOVS     R0,#+255
        STRB     R0,[SP, #+48]
        CMP      R9,#+0
        BNE.N    ??spiffs_object_modify_36
        LDR      R0,[SP, #+28]
        CMP      R0,#+123
        BNE.N    ??spiffs_object_modify_36
        ADD      R0,SP,#+22
        STR      R0,[SP, #+12]
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        STR      R9,[SP, #+4]
        LDR      R0,[SP, #+28]
        STR      R0,[SP, #+0]
        LDR      R0,[SP, #+60]
        ADDS     R3,R6,R0
        ADD      R2,SP,#+44
        LDRH     R0,[R4, #+6]
        LSLS     R1,R0,#+17       ;; ZeroExtS R1,R0,#+17,#+17
        LSRS     R1,R1,#+17
        MOVS     R0,R5
        BL       spiffs_page_allocate_data
        MOV      R11,R0
        B.N      ??spiffs_object_modify_37
??spiffs_object_modify_36:
        MOV      R3,R8
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRH     R2,[SP, #+16]
        MOVS     R1,R4
        MOVS     R0,R5
        BL       spiffs_page_data_check
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_modify_38
        MOV      R0,R11
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_38:
        ADD      R0,SP,#+22
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        ADD      R2,SP,#+44
        LDRH     R0,[R4, #+6]
        LSLS     R1,R0,#+17       ;; ZeroExtS R1,R0,#+17,#+17
        LSRS     R1,R1,#+17
        MOVS     R0,R5
        BL       spiffs_page_allocate_data
        MOV      R11,R0
        CMP      R11,#+0
        BNE.W    ??spiffs_object_modify_3
??spiffs_object_modify_39:
        CMP      R9,#+0
        BEQ.N    ??spiffs_object_modify_40
        STR      R9,[SP, #+0]
        LDRH     R0,[SP, #+16]
        MOVS     R1,#+128
        MULS     R0,R1,R0
        ADDS     R3,R0,#+5
        LDRH     R0,[SP, #+22]
        MOVS     R1,#+128
        MULS     R0,R1,R0
        ADDS     R2,R0,#+5
        LDRSH    R1,[R4, #+4]
        MOVS     R0,R5
        BL       spiffs_phys_cpy
        MOV      R11,R0
        CMP      R11,#+0
        BNE.W    ??spiffs_object_modify_3
??spiffs_object_modify_40:
        LDR      R0,[SP, #+28]
        ADDS     R0,R0,R9
        CMP      R0,#+123
        BCS.N    ??spiffs_object_modify_41
        RSBS     R0,R9,#+123
        LDR      R1,[SP, #+28]
        SUBS     R0,R0,R1
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+16]
        MOVS     R1,#+128
        MLA      R0,R1,R0,R9
        LDR      R1,[SP, #+28]
        ADDS     R0,R1,R0
        ADDS     R3,R0,#+5
        LDRH     R0,[SP, #+22]
        MOVS     R1,#+128
        MLA      R0,R1,R0,R9
        LDR      R1,[SP, #+28]
        ADDS     R0,R1,R0
        ADDS     R2,R0,#+5
        LDRSH    R1,[R4, #+4]
        MOVS     R0,R5
        BL       spiffs_phys_cpy
        MOV      R11,R0
        CMP      R11,#+0
        BNE.N    ??spiffs_object_modify_3
??spiffs_object_modify_41:
        LDR      R0,[SP, #+60]
        ADDS     R0,R6,R0
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+28]
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+22]
        MOVS     R1,#+128
        MLA      R0,R1,R0,R9
        ADDS     R3,R0,#+5
        LDRSH    R2,[R4, #+4]
        MOVS     R1,#+7
        MOVS     R0,R5
        BL       spiffs_phys_wr
        MOV      R11,R0
        CMP      R11,#+0
        BNE.N    ??spiffs_object_modify_3
??spiffs_object_modify_42:
        LDRB     R0,[SP, #+48]
        ANDS     R0,R0,#0xFD
        STRB     R0,[SP, #+48]
        ADD      R0,SP,#+48
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+22]
        MOVS     R1,#+128
        MULS     R0,R1,R0
        ADDS     R3,R0,#+4
        LDRSH    R2,[R4, #+4]
        MOVS     R1,#+7
        MOVS     R0,R5
        BL       spiffs_phys_wr
        MOV      R11,R0
        CMP      R11,#+0
        BNE.N    ??spiffs_object_modify_3
??spiffs_object_modify_37:
        LDRH     R1,[SP, #+16]
        MOVS     R0,R5
        BL       spiffs_page_delete
        MOV      R11,R0
        CMP      R11,#+0
        BNE.N    ??spiffs_object_modify_3
??spiffs_object_modify_43:
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R10,#+0
        BNE.N    ??spiffs_object_modify_44
        LDRH     R0,[SP, #+22]
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        ADDS     R1,R7,R8, LSL #+1
        STRH     R0,[R1, #+49]
        B.N      ??spiffs_object_modify_45
??spiffs_object_modify_44:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+39
        BCS.N    ??spiffs_object_modify_46
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOV      R0,R8
        B.N      ??spiffs_object_modify_47
??spiffs_object_modify_46:
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        SUBS     R0,R8,#+39
        MOVS     R1,#+60
        UDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
??spiffs_object_modify_47:
        LDRH     R1,[SP, #+22]
        LDR      R2,[SP, #+32]
        ADDS     R0,R2,R0, LSL #+1
        STRH     R1,[R0, #+8]
??spiffs_object_modify_45:
        MOVS     R0,#+0
        MOV      R9,R0
        ADDS     R8,R8,#+1
        LDR      R0,[SP, #+28]
        ADDS     R6,R0,R6
        B.N      ??spiffs_object_modify_2
??spiffs_object_modify_3:
        LDR      R0,[SP, #+56]
        ADDS     R0,R6,R0
        STR      R0,[R4, #+20]
        LDRH     R0,[SP, #+20]
        STRH     R0,[R4, #+14]
        STRH     R10,[R4, #+16]
        MOVS     R0,#+0
        STR      R0,[SP, #+28]
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R10,#+0
        BEQ.N    ??spiffs_object_modify_48
        MOV      R3,R10
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRH     R2,[SP, #+20]
        MOVS     R1,R4
        MOVS     R0,R5
        BL       spiffs_page_index_check
        STR      R0,[SP, #+28]
        LDR      R0,[SP, #+28]
        CMP      R0,#+0
        BPL.N    ??spiffs_object_modify_49
        LDR      R0,[SP, #+28]
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_49:
        ADD      R0,SP,#+36
        STR      R0,[SP, #+8]
        LDRH     R0,[SP, #+20]
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+6]
        LDR      R2,[SP, #+32]
        LDRSH    R1,[R4, #+4]
        MOVS     R0,R5
        BL       spiffs_page_move
        STR      R0,[SP, #+28]
        LDRH     R0,[SP, #+36]
        STRH     R0,[R4, #+14]
        STRH     R10,[R4, #+16]
        LDR      R0,[SP, #+28]
        CMP      R0,#+0
        BPL.N    ??spiffs_object_modify_50
        LDR      R0,[SP, #+28]
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_50:
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        LDRH     R0,[SP, #+36]
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+32]
        LDRH     R0,[R0, #+2]
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+6]
        MOVS     R2,#+0
        LDR      R1,[SP, #+32]
        MOVS     R0,R5
        BL       spiffs_cb_object_event
        B.N      ??spiffs_object_modify_51
??spiffs_object_modify_48:
        ADD      R0,SP,#+40
        STR      R0,[SP, #+16]
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        LDR      R0,[R5, #+40]
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+12]
        LDRH     R2,[R4, #+6]
        MOVS     R1,R4
        MOVS     R0,R5
        BL       spiffs_object_update_index_hdr
        STR      R0,[SP, #+28]
        LDR      R0,[SP, #+28]
        CMP      R0,#+0
        BPL.N    ??spiffs_object_modify_52
        LDR      R0,[SP, #+28]
        B.N      ??spiffs_object_modify_1
??spiffs_object_modify_52:
??spiffs_object_modify_51:
        MOV      R0,R11
??spiffs_object_modify_1:
        ADD      SP,SP,#+68
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_object_find_object_index_header_by_name_v:
        PUSH     {R4-R10,LR}
        SUB      SP,SP,#+64
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+96]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ADDS     R0,R7,R6, LSL #+5
        ADDS     R10,R0,#+1
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVW     R0,#+65535
        CMP      R5,R0
        BEQ.N    ??spiffs_object_find_object_index_header_by_nam_0
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.N    ??spiffs_object_find_object_index_header_by_nam_0
        LSLS     R0,R5,#+16
        BMI.N    ??spiffs_object_find_object_index_header_by_nam_1
??spiffs_object_find_object_index_header_by_nam_0:
        LDR.W    R0,??DataTable22  ;; 0xffffd8aa
        B.N      ??spiffs_object_find_object_index_header_by_nam_2
??spiffs_object_find_object_index_header_by_nam_1:
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        MOVS     R0,#+49
        STR      R0,[SP, #+0]
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        MOVS     R0,#+128
        MUL      R3,R0,R10
        MOVS     R2,#+0
        MOVS     R1,#+21
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOV      R9,R0
        CMP      R9,#+0
        BPL.N    ??spiffs_object_find_object_index_header_by_nam_3
        MOV      R0,R9
        B.N      ??spiffs_object_find_object_index_header_by_nam_2
??spiffs_object_find_object_index_header_by_nam_3:
        LDRH     R0,[SP, #+10]
        CMP      R0,#+0
        BNE.N    ??spiffs_object_find_object_index_header_by_nam_4
        LDRB     R0,[SP, #+12]
        ANDS     R0,R0,#0xC2
        CMP      R0,#+192
        BNE.N    ??spiffs_object_find_object_index_header_by_nam_4
        ADD      R1,SP,#+21
        MOV      R0,R8
        BL       strcmp
        CMP      R0,#+0
        BNE.N    ??spiffs_object_find_object_index_header_by_nam_4
        MOVS     R0,#+0
        B.N      ??spiffs_object_find_object_index_header_by_nam_2
??spiffs_object_find_object_index_header_by_nam_4:
        LDR.W    R0,??DataTable22  ;; 0xffffd8aa
??spiffs_object_find_object_index_header_by_nam_2:
        ADD      SP,SP,#+64
        POP      {R4-R10,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_object_find_object_index_header_by_name:
        PUSH     {R4-R7,LR}
        SUB      SP,SP,#+36
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        ADD      R0,SP,#+28
        STR      R0,[SP, #+20]
        ADD      R0,SP,#+24
        STR      R0,[SP, #+16]
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        STR      R5,[SP, #+8]
        LDR.W    R0,??DataTable22_1
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        LDR      R2,[R4, #+32]
        LDRH     R1,[R4, #+28]
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_entry_visitor
        MOVS     R7,R0
        LDR.W    R0,??DataTable22_2  ;; 0xffffd8a8
        CMP      R7,R0
        BNE.N    ??spiffs_object_find_object_index_header_by_nam_5
        LDR.W    R0,??DataTable23  ;; 0xffffd8ee
        MOVS     R7,R0
??spiffs_object_find_object_index_header_by_nam_5:
        CMP      R7,#+0
        BPL.N    ??spiffs_object_find_object_index_header_by_nam_6
        MOVS     R0,R7
        B.N      ??spiffs_object_find_object_index_header_by_nam_7
??spiffs_object_find_object_index_header_by_nam_6:
        CMP      R6,#+0
        BEQ.N    ??spiffs_object_find_object_index_header_by_nam_8
        LDRH     R0,[SP, #+24]
        LDR      R1,[SP, #+28]
        ADDS     R0,R1,R0, LSL #+5
        ADDS     R0,R0,#+1
        STRH     R0,[R6, #+0]
??spiffs_object_find_object_index_header_by_nam_8:
        LDRH     R0,[SP, #+24]
        STRH     R0,[R4, #+28]
        LDR      R0,[SP, #+28]
        STR      R0,[R4, #+32]
        MOVS     R0,R7
??spiffs_object_find_object_index_header_by_nam_7:
        ADD      SP,SP,#+36
        POP      {R4-R7,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable17:
        DC32     0xffffd8e3

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_object_truncate:
        PUSH     {R2,R4-R11,LR}
        SUB      SP,SP,#+56
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R11,#+0
        LDR      R6,[R4, #+0]
        LDR      R0,[R4, #+8]
        CMN      R0,#+1
        BEQ.N    ??spiffs_object_truncate_0
        LDR      R0,[R4, #+8]
        CMP      R0,#+0
        BNE.N    ??spiffs_object_truncate_1
??spiffs_object_truncate_0:
        LDRB     R0,[SP, #+56]
        CMP      R0,#+0
        BNE.N    ??spiffs_object_truncate_1
        MOV      R0,R11
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_1:
        LDRB     R0,[SP, #+56]
        CMP      R0,#+0
        BNE.N    ??spiffs_object_truncate_3
        MOVS     R1,#+246
        MOVS     R0,R6
        BL       spiffs_gc_check
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_truncate_4
        MOV      R0,R11
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_4:
??spiffs_object_truncate_3:
        LDRH     R0,[R4, #+12]
        STRH     R0,[SP, #+20]
        LDR      R0,[R4, #+8]
        CMP      R0,#+0
        BEQ.N    ??spiffs_object_truncate_5
        LDR      R0,[R4, #+8]
        SUBS     R0,R0,#+1
        B.N      ??spiffs_object_truncate_6
??spiffs_object_truncate_5:
        MOVS     R0,#+0
??spiffs_object_truncate_6:
        MOVS     R1,#+123
        UDIV     R7,R0,R1
        LDR      R0,[R4, #+8]
        CMN      R0,#+1
        BNE.N    ??spiffs_object_truncate_7
        MOVS     R8,#+0
        B.N      ??spiffs_object_truncate_8
??spiffs_object_truncate_7:
        LDR      R8,[R4, #+8]
??spiffs_object_truncate_8:
        MOVS     R10,#+0
        MOVW     R0,#+65535
        STRH     R0,[SP, #+24]
        LDR      R9,[R6, #+40]
        LDR      R0,[R6, #+40]
        STR      R0,[SP, #+36]
        LDRB     R0,[SP, #+56]
        CMP      R0,#+0
        BEQ.N    ??spiffs_object_truncate_9
        CMP      R5,#+0
        BNE.N    ??spiffs_object_truncate_9
        MOVS     R0,#+184
        STRB     R0,[SP, #+28]
        ADD      R0,SP,#+28
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        LDRH     R0,[R4, #+12]
        MOVS     R1,#+128
        MULS     R0,R1,R0
        ADDS     R3,R0,#+4
        LDRSH    R2,[R4, #+4]
        MOVS     R1,#+6
        MOVS     R0,R6
        BL       spiffs_phys_wr
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_truncate_10
        MOV      R0,R11
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_10:
??spiffs_object_truncate_9:
        CMP      R5,R8
        BCS.W    ??spiffs_object_truncate_11
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+39
        BCS.N    ??spiffs_object_truncate_12
        MOVS     R10,#+0
        B.N      ??spiffs_object_truncate_13
??spiffs_object_truncate_12:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        SUBS     R0,R7,#+39
        MOVS     R1,#+60
        UDIV     R0,R0,R1
        ADDS     R10,R0,#+1
??spiffs_object_truncate_13:
        LDRH     R0,[SP, #+24]
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R0,R10
        BEQ.W    ??spiffs_object_truncate_14
        LDRH     R0,[SP, #+24]
        MOVW     R1,#+65535
        CMP      R0,R1
        BEQ.N    ??spiffs_object_truncate_15
        LDRH     R3,[SP, #+24]
        LDRH     R2,[SP, #+20]
        MOVS     R1,R4
        MOVS     R0,R6
        BL       spiffs_page_index_check
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_truncate_16
        MOV      R0,R11
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_16:
        LDRH     R1,[SP, #+20]
        MOVS     R0,R6
        BL       spiffs_page_delete
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_truncate_17
        MOV      R0,R11
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_17:
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        LDRH     R0,[SP, #+20]
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+36]
        LDRH     R0,[R0, #+2]
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+6]
        MOVS     R2,#+2
        MOVS     R1,#+0
        MOVS     R0,R6
        BL       spiffs_cb_object_event
        LDRH     R0,[SP, #+24]
        CMP      R0,#+0
        BEQ.N    ??spiffs_object_truncate_15
        LDRB     R0,[SP, #+56]
        CMP      R0,#+0
        BNE.N    ??spiffs_object_truncate_18
        ADD      R0,SP,#+30
        STR      R0,[SP, #+16]
        STR      R8,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+12]
        LDRH     R2,[R4, #+6]
        MOVS     R1,R4
        MOVS     R0,R6
        BL       spiffs_object_update_index_hdr
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_truncate_19
        MOV      R0,R11
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_19:
??spiffs_object_truncate_18:
        STR      R8,[R4, #+8]
??spiffs_object_truncate_15:
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R10,#+0
        BNE.N    ??spiffs_object_truncate_20
        LDRH     R0,[R4, #+12]
        STRH     R0,[SP, #+20]
        B.N      ??spiffs_object_truncate_21
??spiffs_object_truncate_20:
        ADD      R0,SP,#+20
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOV      R2,R10
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDRH     R0,[R4, #+6]
        ORRS     R1,R0,#0x8000
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R6
        BL       spiffs_obj_lu_find_id_and_span
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_truncate_22
        MOV      R0,R11
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_22:
??spiffs_object_truncate_21:
        LDR      R0,[R6, #+40]
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+20]
        MOVS     R1,#+128
        MUL      R3,R1,R0
        LDRSH    R2,[R4, #+4]
        MOVS     R1,#+22
        MOVS     R0,R6
        BL       spiffs_phys_rd
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_truncate_23
        MOV      R0,R11
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_23:
        LDRB     R0,[R9, #+4]
        LSLS     R0,R0,#+31
        BPL.N    ??spiffs_object_truncate_24
        LDR.W    R0,??DataTable18  ;; 0xffffd8e4
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_24:
        LDRB     R0,[R9, #+4]
        LSLS     R0,R0,#+24
        BMI.N    ??spiffs_object_truncate_25
        LDR.W    R0,??DataTable19  ;; 0xffffd8ec
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_25:
        LDRB     R0,[R9, #+4]
        LSLS     R0,R0,#+30
        BPL.N    ??spiffs_object_truncate_26
        LDR.W    R0,??DataTable19_1  ;; 0xffffd8eb
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_26:
        LDRB     R0,[R9, #+4]
        LSLS     R0,R0,#+29
        BPL.N    ??spiffs_object_truncate_27
        LDR.W    R0,??DataTable19_2  ;; 0xffffd8ea
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_27:
        LDRH     R0,[R4, #+6]
        LSLS     R0,R0,#+16
        BMI.N    ??spiffs_object_truncate_28
        LDR.W    R0,??DataTable19_2  ;; 0xffffd8ea
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_28:
        LDRH     R0,[R9, #+2]
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R0,R10
        BEQ.N    ??spiffs_object_truncate_29
        LDR.W    R0,??DataTable25  ;; 0xffffd8e3
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_29:
        LDRH     R0,[SP, #+20]
        STRH     R0,[R4, #+14]
        STRH     R10,[R4, #+16]
        STR      R8,[R4, #+20]
        STRH     R10,[SP, #+24]
??spiffs_object_truncate_14:
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R10,#+0
        BNE.N    ??spiffs_object_truncate_30
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ADDS     R0,R9,R7, LSL #+1
        LDRH     R0,[R0, #+49]
        STRH     R0,[SP, #+22]
        MOVW     R0,#+65535
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ADDS     R1,R9,R7, LSL #+1
        STRH     R0,[R1, #+49]
        B.N      ??spiffs_object_truncate_31
??spiffs_object_truncate_30:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+39
        BCS.N    ??spiffs_object_truncate_32
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R0,R7
        B.N      ??spiffs_object_truncate_33
??spiffs_object_truncate_32:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        SUBS     R0,R7,#+39
        MOVS     R1,#+60
        UDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
??spiffs_object_truncate_33:
        LDR      R1,[SP, #+36]
        ADDS     R0,R1,R0, LSL #+1
        LDRH     R0,[R0, #+8]
        STRH     R0,[SP, #+22]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+39
        BCS.N    ??spiffs_object_truncate_34
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R0,R7
        B.N      ??spiffs_object_truncate_35
??spiffs_object_truncate_34:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        SUBS     R0,R7,#+39
        MOVS     R1,#+60
        UDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
??spiffs_object_truncate_35:
        MOVW     R1,#+65535
        LDR      R2,[SP, #+36]
        ADDS     R0,R2,R0, LSL #+1
        STRH     R1,[R0, #+8]
??spiffs_object_truncate_31:
        CMP      R5,#+0
        BEQ.N    ??spiffs_object_truncate_36
        LDRB     R0,[SP, #+56]
        CMP      R0,#+0
        BNE.N    ??spiffs_object_truncate_36
        SUBS     R0,R8,R5
        CMP      R0,#+123
        BCC.N    ??spiffs_object_truncate_37
??spiffs_object_truncate_36:
        MOVS     R3,R7
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRH     R2,[SP, #+22]
        MOVS     R1,R4
        MOVS     R0,R6
        BL       spiffs_page_data_check
        MOV      R11,R0
        LDR.W    R0,??DataTable19  ;; 0xffffd8ec
        CMP      R11,R0
        BEQ.N    ??spiffs_object_truncate_38
        CMP      R11,#+0
        BEQ.N    ??spiffs_object_truncate_38
        LDR.W    R0,??DataTable25_1  ;; 0xffffd8e1
        CMP      R11,R0
        BNE.W    ??spiffs_object_truncate_11
??spiffs_object_truncate_38:
        CMP      R11,#+0
        BNE.N    ??spiffs_object_truncate_39
        LDRH     R1,[SP, #+22]
        MOVS     R0,R6
        BL       spiffs_page_delete
        MOV      R11,R0
        CMP      R11,#+0
        BEQ.N    ??spiffs_object_truncate_40
        B.N      ??spiffs_object_truncate_11
??spiffs_object_truncate_39:
        LDR.W    R0,??DataTable19  ;; 0xffffd8ec
        CMP      R11,R0
        BEQ.N    ??spiffs_object_truncate_41
        LDR.W    R0,??DataTable25_1  ;; 0xffffd8e1
        CMP      R11,R0
        BNE.N    ??spiffs_object_truncate_40
??spiffs_object_truncate_41:
        MOVS     R0,#+0
        MOV      R11,R0
??spiffs_object_truncate_40:
        MOVS     R0,#+123
        UDIV     R1,R8,R0
        MLS      R0,R0,R1,R8
        CMP      R0,#+0
        BNE.N    ??spiffs_object_truncate_42
        SUBS     R8,R8,#+123
        B.N      ??spiffs_object_truncate_43
??spiffs_object_truncate_42:
        MOVS     R0,#+123
        SUBS     R1,R8,R8
        UDIV     R2,R8,R0
        MLA      R8,R0,R2,R1
??spiffs_object_truncate_43:
        STR      R8,[R4, #+8]
        STR      R8,[R4, #+20]
        SUBS     R7,R7,#+1
        B.N      ??spiffs_object_truncate_9
??spiffs_object_truncate_37:
        MOVS     R0,#+123
        RSBS     R1,R5,#+123
        UDIV     R2,R5,R0
        MLA      R0,R0,R2,R1
        STR      R0,[SP, #+16]
        MOVS     R3,R7
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRH     R2,[SP, #+22]
        MOVS     R1,R4
        MOVS     R0,R6
        BL       spiffs_page_data_check
        MOV      R11,R0
        CMP      R11,#+0
        BNE.N    ??spiffs_object_truncate_11
??spiffs_object_truncate_44:
        LDRH     R0,[R4, #+6]
        LSLS     R0,R0,#+17       ;; ZeroExtS R0,R0,#+17,#+17
        LSRS     R0,R0,#+17
        STRH     R0,[SP, #+40]
        STRH     R7,[SP, #+42]
        MOVS     R0,#+255
        STRB     R0,[SP, #+44]
        ADD      R0,SP,#+26
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        ADD      R2,SP,#+40
        LDRH     R0,[R4, #+6]
        LSLS     R1,R0,#+17       ;; ZeroExtS R1,R0,#+17,#+17
        LSRS     R1,R1,#+17
        MOVS     R0,R6
        BL       spiffs_page_allocate_data
        MOV      R11,R0
        CMP      R11,#+0
        BNE.N    ??spiffs_object_truncate_11
??spiffs_object_truncate_45:
        LDR      R0,[SP, #+16]
        RSBS     R0,R0,#+123
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+22]
        MOVS     R1,#+128
        MULS     R0,R1,R0
        ADDS     R3,R0,#+5
        LDRH     R0,[SP, #+26]
        MOVS     R1,#+128
        MULS     R0,R1,R0
        ADDS     R2,R0,#+5
        MOVS     R1,#+0
        MOVS     R0,R6
        BL       spiffs_phys_cpy
        MOV      R11,R0
        CMP      R11,#+0
        BNE.N    ??spiffs_object_truncate_11
??spiffs_object_truncate_46:
        LDRH     R1,[SP, #+22]
        MOVS     R0,R6
        BL       spiffs_page_delete
        MOV      R11,R0
        CMP      R11,#+0
        BNE.N    ??spiffs_object_truncate_11
??spiffs_object_truncate_47:
        LDRB     R0,[SP, #+44]
        ANDS     R0,R0,#0xFD
        STRB     R0,[SP, #+44]
        ADD      R0,SP,#+44
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+26]
        MOVS     R1,#+128
        MULS     R0,R1,R0
        ADDS     R3,R0,#+4
        LDRSH    R2,[R4, #+4]
        MOVS     R1,#+7
        MOVS     R0,R6
        BL       spiffs_phys_wr
        MOV      R11,R0
        CMP      R11,#+0
        BNE.N    ??spiffs_object_truncate_11
??spiffs_object_truncate_48:
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R10,#+0
        BNE.N    ??spiffs_object_truncate_49
        LDRH     R0,[SP, #+26]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ADDS     R1,R9,R7, LSL #+1
        STRH     R0,[R1, #+49]
        B.N      ??spiffs_object_truncate_50
??spiffs_object_truncate_49:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+39
        BCS.N    ??spiffs_object_truncate_51
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R0,R7
        B.N      ??spiffs_object_truncate_52
??spiffs_object_truncate_51:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        SUBS     R0,R7,#+39
        MOVS     R1,#+60
        UDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
??spiffs_object_truncate_52:
        LDRH     R1,[SP, #+26]
        LDR      R2,[SP, #+36]
        ADDS     R0,R2,R0, LSL #+1
        STRH     R1,[R0, #+8]
??spiffs_object_truncate_50:
        MOV      R8,R5
        STR      R5,[R4, #+8]
        STR      R8,[R4, #+20]
??spiffs_object_truncate_11:
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R10,#+0
        BNE.N    ??spiffs_object_truncate_53
        CMP      R8,#+0
        BNE.N    ??spiffs_object_truncate_54
        LDRB     R0,[SP, #+56]
        CMP      R0,#+0
        BEQ.N    ??spiffs_object_truncate_55
        MOVS     R3,#+0
        LDRH     R2,[SP, #+20]
        MOVS     R1,R4
        MOVS     R0,R6
        BL       spiffs_page_index_check
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_truncate_56
        MOV      R0,R11
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_56:
        LDRH     R1,[SP, #+20]
        MOVS     R0,R6
        BL       spiffs_page_delete
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_truncate_57
        MOV      R0,R11
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_57:
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        LDRH     R0,[SP, #+20]
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+6]
        MOVS     R2,#+2
        MOVS     R1,#+0
        MOVS     R0,R6
        BL       spiffs_cb_object_event
        B.N      ??spiffs_object_truncate_58
??spiffs_object_truncate_55:
        MOVS     R0,#+79
        STR      R0,[SP, #+48]
        MOVS     R0,#+255
        STR      R0,[SP, #+32]
        LDR      R0,[R6, #+40]
        ADDS     R0,R0,#+49
        STR      R0,[SP, #+0]
        LDR      R2,[SP, #+32]
        LDR      R1,[SP, #+48]
        LDR      R0,[SP, #+0]
        BL       __aeabi_memset
        LDR      R0,[SP, #+0]
        ADD      R0,SP,#+30
        STR      R0,[SP, #+16]
        MOVS     R0,#-1
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        LDR      R0,[R6, #+40]
        STR      R0,[SP, #+0]
        LDRH     R3,[SP, #+20]
        LDRH     R2,[R4, #+6]
        MOVS     R1,R4
        MOVS     R0,R6
        BL       spiffs_object_update_index_hdr
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_truncate_59
        MOV      R0,R11
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_59:
        B.N      ??spiffs_object_truncate_58
??spiffs_object_truncate_54:
        ADD      R0,SP,#+30
        STR      R0,[SP, #+16]
        STR      R8,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        LDR      R0,[R6, #+40]
        STR      R0,[SP, #+0]
        LDRH     R3,[SP, #+20]
        LDRH     R2,[R4, #+6]
        MOVS     R1,R4
        MOVS     R0,R6
        BL       spiffs_object_update_index_hdr
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_truncate_60
        MOV      R0,R11
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_60:
        B.N      ??spiffs_object_truncate_58
??spiffs_object_truncate_53:
        MOV      R3,R10
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRH     R2,[SP, #+20]
        MOVS     R1,R4
        MOVS     R0,R6
        BL       spiffs_page_index_check
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_truncate_61
        MOV      R0,R11
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_61:
        ADD      R0,SP,#+32
        STR      R0,[SP, #+8]
        LDRH     R0,[SP, #+20]
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+6]
        MOV      R2,R9
        LDRSH    R1,[R4, #+4]
        MOVS     R0,R6
        BL       spiffs_page_move
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_truncate_62
        MOV      R0,R11
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_62:
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        LDRH     R0,[SP, #+32]
        STR      R0,[SP, #+4]
        LDR      R0,[SP, #+36]
        LDRH     R0,[R0, #+2]
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+6]
        MOVS     R2,#+0
        MOV      R1,R9
        MOVS     R0,R6
        BL       spiffs_cb_object_event
        LDRH     R0,[SP, #+32]
        STRH     R0,[R4, #+14]
        STRH     R10,[R4, #+16]
        STR      R8,[R4, #+20]
        ADD      R0,SP,#+30
        STR      R0,[SP, #+16]
        STR      R8,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        LDRH     R3,[R4, #+12]
        LDRH     R2,[R4, #+6]
        MOVS     R1,R4
        MOVS     R0,R6
        BL       spiffs_object_update_index_hdr
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_object_truncate_63
        MOV      R0,R11
        B.N      ??spiffs_object_truncate_2
??spiffs_object_truncate_63:
??spiffs_object_truncate_58:
        STR      R8,[R4, #+8]
        MOV      R0,R11
??spiffs_object_truncate_2:
        ADD      SP,SP,#+60
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable18:
        DC32     0xffffd8e4

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_object_read:
        PUSH     {R1,R2,R4-R11,LR}
        SUB      SP,SP,#+28
        MOVS     R4,R0
        MOVS     R5,R3
        MOVS     R10,#+0
        LDR      R6,[R4, #+0]
        LDR      R0,[SP, #+28]
        MOVS     R1,#+123
        UDIV     R7,R0,R1
        LDR      R8,[SP, #+28]
        MOVW     R0,#+65535
        STRH     R0,[SP, #+16]
        LDR      R0,[R6, #+40]
        STR      R0,[SP, #+20]
        LDR      R0,[R6, #+40]
        STR      R0,[SP, #+12]
??spiffs_object_read_0:
        LDR      R0,[SP, #+28]
        LDR      R1,[SP, #+32]
        ADDS     R0,R1,R0
        CMP      R8,R0
        BCS.W    ??spiffs_object_read_1
        LDR      R0,[R4, #+44]
        CMP      R0,#+0
        BEQ.N    ??spiffs_object_read_2
        LDR      R0,[R4, #+44]
        LDRH     R0,[R0, #+8]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,R0
        BCC.N    ??spiffs_object_read_2
        LDR      R0,[R4, #+44]
        LDRH     R0,[R0, #+10]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R0,R7
        BCC.N    ??spiffs_object_read_2
        LDR      R0,[R4, #+44]
        LDR      R0,[R0, #+0]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDR      R1,[R4, #+44]
        LDRH     R1,[R1, #+8]
        SUBS     R1,R7,R1
        LDRH     R0,[R0, R1, LSL #+1]
        CMP      R0,#+0
        BEQ.N    ??spiffs_object_read_2
        LDR      R0,[R4, #+44]
        LDR      R0,[R0, #+0]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDR      R1,[R4, #+44]
        LDRH     R1,[R1, #+8]
        SUBS     R1,R7,R1
        LDRH     R0,[R0, R1, LSL #+1]
        STRH     R0,[SP, #+8]
        B.N      ??spiffs_object_read_3
??spiffs_object_read_2:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+39
        BCS.N    ??spiffs_object_read_4
        MOVS     R9,#+0
        B.N      ??spiffs_object_read_5
??spiffs_object_read_4:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        SUBS     R0,R7,#+39
        MOVS     R1,#+60
        UDIV     R0,R0,R1
        ADDS     R9,R0,#+1
??spiffs_object_read_5:
        LDRH     R0,[SP, #+16]
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R0,R9
        BEQ.N    ??spiffs_object_read_6
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R9,#+0
        BNE.N    ??spiffs_object_read_7
        LDRH     R0,[R4, #+12]
        STRH     R0,[SP, #+10]
        B.N      ??spiffs_object_read_8
??spiffs_object_read_7:
        LDRH     R0,[R4, #+16]
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R0,R9
        BNE.N    ??spiffs_object_read_9
        LDRH     R0,[R4, #+14]
        STRH     R0,[SP, #+10]
        B.N      ??spiffs_object_read_8
??spiffs_object_read_9:
        ADD      R0,SP,#+10
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOV      R2,R9
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDRH     R0,[R4, #+6]
        ORRS     R1,R0,#0x8000
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R6
        BL       spiffs_obj_lu_find_id_and_span
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_object_read_10
        MOV      R0,R10
        B.N      ??spiffs_object_read_11
??spiffs_object_read_10:
??spiffs_object_read_8:
        LDR      R0,[R6, #+40]
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+10]
        MOVS     R1,#+128
        MUL      R3,R1,R0
        LDRSH    R2,[R4, #+4]
        MOVS     R1,#+22
        MOVS     R0,R6
        BL       spiffs_phys_rd
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_object_read_12
        MOV      R0,R10
        B.N      ??spiffs_object_read_11
??spiffs_object_read_12:
        LDR      R0,[SP, #+12]
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+31
        BPL.N    ??spiffs_object_read_13
        LDR.W    R0,??DataTable25_2  ;; 0xffffd8e4
        B.N      ??spiffs_object_read_11
??spiffs_object_read_13:
        LDR      R0,[SP, #+12]
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+24
        BMI.N    ??spiffs_object_read_14
        LDR.N    R0,??DataTable19  ;; 0xffffd8ec
        B.N      ??spiffs_object_read_11
??spiffs_object_read_14:
        LDR      R0,[SP, #+12]
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+30
        BPL.N    ??spiffs_object_read_15
        LDR.N    R0,??DataTable19_1  ;; 0xffffd8eb
        B.N      ??spiffs_object_read_11
??spiffs_object_read_15:
        LDR      R0,[SP, #+12]
        LDRB     R0,[R0, #+4]
        LSLS     R0,R0,#+29
        BPL.N    ??spiffs_object_read_16
        LDR.N    R0,??DataTable19_2  ;; 0xffffd8ea
        B.N      ??spiffs_object_read_11
??spiffs_object_read_16:
        LDRH     R0,[R4, #+6]
        LSLS     R0,R0,#+16
        BMI.N    ??spiffs_object_read_17
        LDR.N    R0,??DataTable19_2  ;; 0xffffd8ea
        B.N      ??spiffs_object_read_11
??spiffs_object_read_17:
        LDR      R0,[SP, #+12]
        LDRH     R0,[R0, #+2]
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R0,R9
        BEQ.N    ??spiffs_object_read_18
        LDR.W    R0,??DataTable25  ;; 0xffffd8e3
        B.N      ??spiffs_object_read_11
??spiffs_object_read_18:
        STR      R8,[R4, #+20]
        LDRH     R0,[SP, #+10]
        STRH     R0,[R4, #+14]
        STRH     R9,[R4, #+16]
        STRH     R9,[SP, #+16]
??spiffs_object_read_6:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R9,#+0
        BNE.N    ??spiffs_object_read_19
        LDR      R0,[SP, #+20]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        ADDS     R0,R0,R7, LSL #+1
        LDRH     R0,[R0, #+49]
        STRH     R0,[SP, #+8]
        B.N      ??spiffs_object_read_3
??spiffs_object_read_19:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,#+39
        BCS.N    ??spiffs_object_read_20
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R0,R7
        B.N      ??spiffs_object_read_21
??spiffs_object_read_20:
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        SUBS     R0,R7,#+39
        MOVS     R1,#+60
        UDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
??spiffs_object_read_21:
        LDR      R1,[SP, #+12]
        ADDS     R0,R1,R0, LSL #+1
        LDRH     R0,[R0, #+8]
        STRH     R0,[SP, #+8]
??spiffs_object_read_3:
        LDR      R0,[SP, #+28]
        LDR      R1,[SP, #+32]
        ADDS     R0,R1,R0
        SUBS     R11,R0,R8
        MOVS     R0,#+123
        RSBS     R1,R8,#+123
        UDIV     R2,R8,R0
        MLA      R0,R0,R2,R1
        CMP      R11,R0
        BCC.N    ??spiffs_object_read_22
??spiffs_object_read_23:
        MOVS     R0,#+123
        RSBS     R1,R8,#+123
        UDIV     R2,R8,R0
        MLA      R11,R0,R2,R1
??spiffs_object_read_22:
        LDR      R0,[R4, #+8]
        CMP      R11,R0
        BCC.N    ??spiffs_object_read_24
??spiffs_object_read_25:
        LDR      R11,[R4, #+8]
??spiffs_object_read_24:
        CMP      R11,#+0
        BNE.N    ??spiffs_object_read_26
        LDR.W    R0,??DataTable25_3  ;; 0xffffd8ed
        MOV      R10,R0
        B.N      ??spiffs_object_read_1
??spiffs_object_read_26:
        MOVS     R3,R7
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRH     R2,[SP, #+8]
        MOVS     R1,R4
        MOVS     R0,R6
        BL       spiffs_page_data_check
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_object_read_27
        MOV      R0,R10
        B.N      ??spiffs_object_read_11
??spiffs_object_read_27:
        MOVS     R0,#+123
        STR      R5,[SP, #+4]
        STR      R11,[SP, #+0]
        LDRH     R1,[SP, #+8]
        MOVS     R2,#+128
        MLA      R1,R2,R1,R8
        ADDS     R1,R1,#+5
        UDIV     R2,R8,R0
        MLS      R3,R0,R2,R1
        LDRSH    R2,[R4, #+4]
        MOVS     R1,#+23
        MOVS     R0,R6
        BL       spiffs_phys_rd
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_object_read_28
        MOV      R0,R10
        B.N      ??spiffs_object_read_11
??spiffs_object_read_28:
        ADDS     R5,R11,R5
        ADDS     R8,R11,R8
        STR      R8,[R4, #+20]
        ADDS     R7,R7,#+1
        B.N      ??spiffs_object_read_0
??spiffs_object_read_1:
        MOV      R0,R10
??spiffs_object_read_11:
        ADD      SP,SP,#+36
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19:
        DC32     0xffffd8ec

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_1:
        DC32     0xffffd8eb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable19_2:
        DC32     0xffffd8ea

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_obj_lu_find_free_obj_id_bitmap_v:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+68
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        LDR      R8,[SP, #+104]
        LDR      R9,[SP, #+108]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVW     R0,#+65535
        CMP      R5,R0
        BEQ.N    ??spiffs_obj_lu_find_free_obj_id_bitmap_v_0
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.N    ??spiffs_obj_lu_find_free_obj_id_bitmap_v_0
        LDRH     R10,[R9, #+0]
        STR      R8,[SP, #+12]
        LDR      R0,[SP, #+12]
        CMP      R0,#+0
        BEQ.N    ??spiffs_obj_lu_find_free_obj_id_bitmap_v_1
        LSLS     R0,R5,#+16
        BPL.N    ??spiffs_obj_lu_find_free_obj_id_bitmap_v_1
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ADDS     R0,R7,R6, LSL #+5
        ADDS     R0,R0,#+1
        STRH     R0,[SP, #+8]
        ADD      R0,SP,#+16
        STR      R0,[SP, #+4]
        MOVS     R0,#+49
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+8]
        MOVS     R1,#+128
        MUL      R3,R1,R0
        MOVS     R2,#+0
        MOVS     R1,#+21
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOV      R11,R0
        CMP      R11,#+0
        BPL.N    ??spiffs_obj_lu_find_free_obj_id_bitmap_v_2
        MOV      R0,R11
        B.N      ??spiffs_obj_lu_find_free_obj_id_bitmap_v_3
??spiffs_obj_lu_find_free_obj_id_bitmap_v_2:
        LDRH     R0,[SP, #+18]
        CMP      R0,#+0
        BNE.N    ??spiffs_obj_lu_find_free_obj_id_bitmap_v_1
        LDRB     R0,[SP, #+20]
        ANDS     R0,R0,#0xC2
        CMP      R0,#+192
        BNE.N    ??spiffs_obj_lu_find_free_obj_id_bitmap_v_1
        ADD      R1,SP,#+29
        MOV      R0,R8
        BL       strcmp
        CMP      R0,#+0
        BNE.N    ??spiffs_obj_lu_find_free_obj_id_bitmap_v_1
        LDR.W    R0,??DataTable25_4  ;; 0xffffd8d9
        B.N      ??spiffs_obj_lu_find_free_obj_id_bitmap_v_3
??spiffs_obj_lu_find_free_obj_id_bitmap_v_1:
        LSLS     R5,R5,#+17       ;; ZeroExtS R5,R5,#+17,#+17
        LSRS     R5,R5,#+17
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        SUBS     R0,R5,R10
        ANDS     R1,R0,#0x7
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        SUBS     R0,R5,R10
        ASRS     R0,R0,#+3
        CMP      R0,#+0
        BMI.N    ??spiffs_obj_lu_find_free_obj_id_bitmap_v_0
        CMP      R0,#+128
        BCS.N    ??spiffs_obj_lu_find_free_obj_id_bitmap_v_0
        LDR      R2,[R4, #+40]
        LDRB     R2,[R0, R2]
        MOVS     R3,#+1
        LSLS     R1,R3,R1
        ORRS     R1,R1,R2
        LDR      R2,[R4, #+40]
        STRB     R1,[R0, R2]
??spiffs_obj_lu_find_free_obj_id_bitmap_v_0:
        LDR.N    R0,??DataTable22  ;; 0xffffd8aa
??spiffs_obj_lu_find_free_obj_id_bitmap_v_3:
        ADD      SP,SP,#+68
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_obj_lu_find_free_obj_id_compact_v:
        PUSH     {R4-R10,LR}
        SUB      SP,SP,#+64
        MOVS     R4,R0
        MOV      R10,R1
        MOVS     R5,R2
        MOVS     R6,R3
        LDR      R7,[SP, #+96]
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        MOVW     R0,#+65535
        CMP      R10,R0
        BEQ.N    ??spiffs_obj_lu_find_free_obj_id_compact_v_0
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R10,#+0
        BEQ.N    ??spiffs_obj_lu_find_free_obj_id_compact_v_0
        LSLS     R0,R10,#+16
        BPL.N    ??spiffs_obj_lu_find_free_obj_id_compact_v_0
        MOV      R9,R7
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        MOVS     R0,#+49
        STR      R0,[SP, #+0]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOV      R0,#+4096
        ADDS     R1,R6,#+1
        MOVS     R2,#+128
        MULS     R1,R2,R1
        MLA      R3,R0,R5,R1
        MOVS     R2,#+0
        MOVS     R1,#+21
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOV      R8,R0
        CMP      R8,#+0
        BNE.N    ??spiffs_obj_lu_find_free_obj_id_compact_v_0
        LDRH     R0,[SP, #+10]
        CMP      R0,#+0
        BNE.N    ??spiffs_obj_lu_find_free_obj_id_compact_v_0
        LDRB     R0,[SP, #+12]
        ANDS     R0,R0,#0x86
        CMP      R0,#+128
        BNE.N    ??spiffs_obj_lu_find_free_obj_id_compact_v_0
        LDR      R0,[R9, #+8]
        CMP      R0,#+0
        BEQ.N    ??spiffs_obj_lu_find_free_obj_id_compact_v_1
        ADD      R1,SP,#+21
        LDR      R0,[R9, #+8]
        BL       strcmp
        CMP      R0,#+0
        BNE.N    ??spiffs_obj_lu_find_free_obj_id_compact_v_1
        LDR.W    R0,??DataTable25_4  ;; 0xffffd8d9
        B.N      ??spiffs_obj_lu_find_free_obj_id_compact_v_2
??spiffs_obj_lu_find_free_obj_id_compact_v_1:
        LSLS     R10,R10,#+17     ;; ZeroExtS R10,R10,#+17,#+17
        LSRS     R10,R10,#+17
        LDRH     R0,[R9, #+0]
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R10,R0
        BCC.N    ??spiffs_obj_lu_find_free_obj_id_compact_v_0
        LDRH     R0,[R9, #+2]
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R0,R10
        BCC.N    ??spiffs_obj_lu_find_free_obj_id_compact_v_0
        LDR      R0,[R4, #+40]
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        LDRH     R1,[R9, #+0]
        SUBS     R1,R10,R1
        LDR      R2,[R9, #+4]
        UDIV     R1,R1,R2
        LDRB     R2,[R1, R0]
        ADDS     R2,R2,#+1
        STRB     R2,[R1, R0]
??spiffs_obj_lu_find_free_obj_id_compact_v_0:
        LDR.N    R0,??DataTable22  ;; 0xffffd8aa
??spiffs_obj_lu_find_free_obj_id_compact_v_2:
        ADD      SP,SP,#+64
        POP      {R4-R10,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_obj_lu_find_free_obj_id:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+52
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R8,#+0
        LDR      R0,[R4, #+16]
        MOVS     R1,#+31
        MULS     R0,R1,R0
        LSRS     R0,R0,#+1
        STR      R0,[SP, #+36]
        MOVW     R7,#+65535
        MOVS     R0,#+1
        STRH     R0,[SP, #+24]
        LDR      R0,[SP, #+36]
        ADDS     R0,R0,#+1
        STRH     R0,[SP, #+26]
        LDRH     R0,[SP, #+26]
        LSLS     R0,R0,#+16
        BPL.N    ??spiffs_obj_lu_find_free_obj_id_0
        MOVW     R0,#+32767
        STRH     R0,[SP, #+26]
??spiffs_obj_lu_find_free_obj_id_0:
        MOVS     R0,#+0
        STR      R0,[SP, #+28]
        STR      R6,[SP, #+32]
??spiffs_obj_lu_find_free_obj_id_1:
        CMP      R8,#+0
        BNE.W    ??spiffs_obj_lu_find_free_obj_id_2
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVW     R0,#+65535
        CMP      R7,R0
        BNE.W    ??spiffs_obj_lu_find_free_obj_id_2
        LDRH     R0,[SP, #+26]
        LDRH     R1,[SP, #+24]
        SUBS     R0,R0,R1
        CMP      R0,#+1024
        BGT.N    ??spiffs_obj_lu_find_free_obj_id_3
        MOVS     R0,#+128
        STR      R0,[SP, #+44]
        MOVS     R0,#+0
        STR      R0,[SP, #+40]
        LDR      R11,[R4, #+40]
        LDR      R2,[SP, #+40]
        LDR      R1,[SP, #+44]
        MOV      R0,R11
        BL       __aeabi_memset
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
        ADD      R0,SP,#+24
        STR      R0,[SP, #+12]
        STR      R6,[SP, #+8]
        LDR.N    R0,??DataTable25_5
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_entry_visitor
        MOV      R8,R0
        LDR.N    R0,??DataTable22_2  ;; 0xffffd8a8
        CMP      R8,R0
        BNE.N    ??spiffs_obj_lu_find_free_obj_id_4
        MOVS     R0,#+0
        MOV      R8,R0
??spiffs_obj_lu_find_free_obj_id_4:
        CMP      R8,#+0
        BPL.N    ??spiffs_obj_lu_find_free_obj_id_5
        MOV      R0,R8
        B.N      ??spiffs_obj_lu_find_free_obj_id_6
??spiffs_obj_lu_find_free_obj_id_5:
        MOVS     R0,#+0
        MOV      R9,R0
??spiffs_obj_lu_find_free_obj_id_7:
        CMP      R9,#+128
        BCS.N    ??spiffs_obj_lu_find_free_obj_id_8
        LDR      R0,[R4, #+40]
        LDRB     R1,[R9, R0]
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        CMP      R1,#+255
        BEQ.N    ??spiffs_obj_lu_find_free_obj_id_9
??spiffs_obj_lu_find_free_obj_id_10:
        MOVS     R0,#+0
        MOV      R10,R0
??spiffs_obj_lu_find_free_obj_id_11:
        CMP      R10,#+8
        BCS.N    ??spiffs_obj_lu_find_free_obj_id_9
        MOVS     R0,#+1
        LSLS     R2,R0,R10
        MOVS     R0,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        TST      R0,R2
        BNE.N    ??spiffs_obj_lu_find_free_obj_id_12
        ADDS     R0,R10,R9, LSL #+3
        LDRH     R2,[SP, #+24]
        ADDS     R0,R2,R0
        STRH     R0,[R5, #+0]
        MOVS     R0,#+0
        B.N      ??spiffs_obj_lu_find_free_obj_id_6
??spiffs_obj_lu_find_free_obj_id_12:
        ADDS     R10,R10,#+1
        B.N      ??spiffs_obj_lu_find_free_obj_id_11
??spiffs_obj_lu_find_free_obj_id_9:
        ADDS     R9,R9,#+1
        B.N      ??spiffs_obj_lu_find_free_obj_id_7
??spiffs_obj_lu_find_free_obj_id_8:
        LDR.N    R0,??DataTable25_6  ;; 0xffffd8ef
        B.N      ??spiffs_obj_lu_find_free_obj_id_6
??spiffs_obj_lu_find_free_obj_id_3:
        LDR      R0,[SP, #+28]
        CMP      R0,#+0
        BEQ.N    ??spiffs_obj_lu_find_free_obj_id_13
        MOVS     R2,#+0
        LDR      R3,[R4, #+40]
        MOV      LR,#+255
        MOVS     R0,#+0
        MOVS     R1,R0
??spiffs_obj_lu_find_free_obj_id_14:
        CMP      R1,#+128
        BCS.N    ??spiffs_obj_lu_find_free_obj_id_15
        LDRB     R0,[R1, R3]
        UXTB     LR,LR            ;; ZeroExt  LR,LR,#+24,#+24
        CMP      R0,LR
        BCS.N    ??spiffs_obj_lu_find_free_obj_id_16
        LDRB     R0,[R1, R3]
        MOV      LR,R0
        MOVS     R2,R1
        UXTB     LR,LR            ;; ZeroExt  LR,LR,#+24,#+24
        CMP      LR,#+0
        BEQ.N    ??spiffs_obj_lu_find_free_obj_id_15
??spiffs_obj_lu_find_free_obj_id_16:
        ADDS     R1,R1,#+1
        B.N      ??spiffs_obj_lu_find_free_obj_id_14
??spiffs_obj_lu_find_free_obj_id_15:
        UXTB     LR,LR            ;; ZeroExt  LR,LR,#+24,#+24
        LDR      R0,[SP, #+28]
        CMP      LR,R0
        BNE.N    ??spiffs_obj_lu_find_free_obj_id_17
        LDR.N    R0,??DataTable25_6  ;; 0xffffd8ef
        B.N      ??spiffs_obj_lu_find_free_obj_id_6
??spiffs_obj_lu_find_free_obj_id_17:
        UXTB     LR,LR            ;; ZeroExt  LR,LR,#+24,#+24
        CMP      LR,#+0
        BNE.N    ??spiffs_obj_lu_find_free_obj_id_18
        LDR      R0,[SP, #+28]
        LDRH     R12,[SP, #+24]
        MLA      R0,R0,R2,R12
        STRH     R0,[R5, #+0]
        MOVS     R0,#+0
        B.N      ??spiffs_obj_lu_find_free_obj_id_6
??spiffs_obj_lu_find_free_obj_id_18:
        LDRH     R0,[SP, #+24]
        LDR      R12,[SP, #+28]
        MLA      R0,R12,R2,R0
        STRH     R0,[SP, #+24]
        LDRH     R0,[SP, #+24]
        LDR      R12,[SP, #+28]
        ADDS     R0,R12,R0
        STRH     R0,[SP, #+26]
        LDRH     R0,[SP, #+26]
        LDRH     R12,[SP, #+24]
        SUBS     R0,R0,R12
        CMP      R0,#+1024
        BLE.W    ??spiffs_obj_lu_find_free_obj_id_1
??spiffs_obj_lu_find_free_obj_id_13:
        LDRH     R0,[SP, #+26]
        LDRH     R1,[SP, #+24]
        SUBS     R0,R0,R1
        LSRS     R0,R0,#+7
        STR      R0,[SP, #+28]
        MOVS     R9,#+128
        MOVS     R10,#+0
        LDR      R11,[R4, #+40]
        MOV      R2,R10
        MOV      R1,R9
        MOV      R0,R11
        BL       __aeabi_memset
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        ADD      R0,SP,#+24
        STR      R0,[SP, #+8]
        LDR.N    R0,??DataTable25_7
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_entry_visitor
        MOV      R8,R0
        LDR.N    R0,??DataTable22_2  ;; 0xffffd8a8
        CMP      R8,R0
        BNE.N    ??spiffs_obj_lu_find_free_obj_id_19
        MOVS     R0,#+0
        MOV      R8,R0
??spiffs_obj_lu_find_free_obj_id_19:
        CMP      R8,#+0
        BPL.N    ??spiffs_obj_lu_find_free_obj_id_20
        MOV      R0,R8
        B.N      ??spiffs_obj_lu_find_free_obj_id_6
??spiffs_obj_lu_find_free_obj_id_20:
        MOVS     R0,#+0
        STR      R0,[SP, #+32]
        B.N      ??spiffs_obj_lu_find_free_obj_id_1
??spiffs_obj_lu_find_free_obj_id_2:
        MOV      R0,R8
??spiffs_obj_lu_find_free_obj_id_6:
        ADD      SP,SP,#+52
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22:
        DC32     0xffffd8aa

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_1:
        DC32     spiffs_object_find_object_index_header_by_name_v

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable22_2:
        DC32     0xffffd8a8

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_hash:
        PUSH     {R4,R5}
        MOVS     R2,R0
        MOVW     R0,#+5381
        MOVS     R4,#+0
??spiffs_hash_0:
        LDRB     R5,[R4, R1]
        MOVS     R3,R5
        ADDS     R4,R4,#+1
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        CMP      R3,#+0
        BEQ.N    ??spiffs_hash_1
        CMP      R4,#+32
        BGE.N    ??spiffs_hash_1
        MOVS     R5,#+33
        MULS     R0,R5,R0
        UXTB     R3,R3            ;; ZeroExt  R3,R3,#+24,#+24
        EORS     R0,R3,R0
        B.N      ??spiffs_hash_0
??spiffs_hash_1:
        POP      {R4,R5}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_fd_find_new:
        PUSH     {R3-R9,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVW     R7,#+65535
        MOVS     R8,#-1
        CMP      R6,#+0
        BEQ.N    ??spiffs_fd_find_new_0
        MOVS     R1,R6
        MOVS     R0,R4
        BL       spiffs_hash
        MOVS     R1,R0
        B.N      ??spiffs_fd_find_new_1
??spiffs_fd_find_new_0:
        MOVS     R1,#+0
??spiffs_fd_find_new_1:
        LDR      R2,[R4, #+44]
        CMP      R6,#+0
        BEQ.N    ??spiffs_fd_find_new_2
        MOVS     R0,#+0
        MOV      R9,R0
??spiffs_fd_find_new_3:
        LDR      R0,[R4, #+48]
        CMP      R9,R0
        BCS.N    ??spiffs_fd_find_new_2
        MOVS     R0,#+48
        MLA      R0,R0,R9,R2
        LDRSH    R3,[R0, #+4]
        CMP      R3,#+0
        BNE.N    ??spiffs_fd_find_new_4
        LDRH     R3,[R0, #+40]
        CMP      R3,#+2
        BLT.N    ??spiffs_fd_find_new_4
        LDRH     R3,[R0, #+40]
        SUBS     R3,R3,#+1
        STRH     R3,[R0, #+40]
??spiffs_fd_find_new_4:
        ADDS     R9,R9,#+1
        B.N      ??spiffs_fd_find_new_3
??spiffs_fd_find_new_2:
        MOVS     R0,#+0
        MOV      R9,R0
??spiffs_fd_find_new_5:
        LDR      R0,[R4, #+48]
        CMP      R9,R0
        BCS.N    ??spiffs_fd_find_new_6
        MOVS     R0,#+48
        MLA      R0,R0,R9,R2
        LDRSH    R3,[R0, #+4]
        CMP      R3,#+0
        BNE.N    ??spiffs_fd_find_new_7
        CMP      R6,#+0
        BEQ.N    ??spiffs_fd_find_new_8
        LDR      R3,[R0, #+36]
        CMP      R3,R1
        BNE.N    ??spiffs_fd_find_new_8
        MOV      R8,R9
        B.N      ??spiffs_fd_find_new_6
??spiffs_fd_find_new_8:
        LDRH     R3,[R0, #+40]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R3,R7
        BCS.N    ??spiffs_fd_find_new_7
        LDRH     R3,[R0, #+40]
        MOVS     R7,R3
        MOV      R8,R9
??spiffs_fd_find_new_7:
        ADDS     R9,R9,#+1
        B.N      ??spiffs_fd_find_new_5
??spiffs_fd_find_new_6:
        CMN      R8,#+1
        BEQ.N    ??spiffs_fd_find_new_9
        MOVS     R0,#+48
        MLA      R3,R0,R8,R2
        CMP      R6,#+0
        BEQ.N    ??spiffs_fd_find_new_10
        LDR      R0,[R3, #+36]
        CMP      R0,R1
        BNE.N    ??spiffs_fd_find_new_11
        LDRH     R0,[R3, #+40]
        CMP      R0,#+0
        BEQ.N    ??spiffs_fd_find_new_11
        LDRH     R0,[R3, #+12]
        MOVS     R12,#+32
        SDIV     R0,R0,R12
        STRH     R0,[R4, #+28]
        LDRH     R0,[R3, #+12]
        MOVS     R12,#+32
        SDIV     LR,R0,R12
        MLS      LR,LR,R12,R0
        SUBS     R0,LR,#+1
        STR      R0,[R4, #+32]
        LDRH     R0,[R3, #+40]
        MOVW     R12,#+65531
        CMP      R0,R12
        BGE.N    ??spiffs_fd_find_new_12
        LDRH     R0,[R3, #+40]
        ADDS     R0,R0,#+4
        STRH     R0,[R3, #+40]
        B.N      ??spiffs_fd_find_new_10
??spiffs_fd_find_new_12:
        MOVW     R0,#+65535
        STRH     R0,[R3, #+40]
        B.N      ??spiffs_fd_find_new_10
??spiffs_fd_find_new_11:
        MOVS     R0,#+4
        STRH     R0,[R3, #+40]
        STR      R1,[R3, #+36]
??spiffs_fd_find_new_10:
        ADDS     R0,R8,#+1
        STRH     R0,[R3, #+4]
        STR      R3,[R5, #+0]
        MOVS     R0,#+0
        B.N      ??spiffs_fd_find_new_13
??spiffs_fd_find_new_9:
        LDR.N    R0,??DataTable25_8  ;; 0xffffd8e9
??spiffs_fd_find_new_13:
        POP      {R1,R4-R9,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable23:
        DC32     0xffffd8ee

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_fd_return:
        PUSH     {R4}
        MOVS     R2,R0
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        CMP      R1,#+1
        BLT.N    ??spiffs_fd_return_0
        LDR      R0,[R2, #+48]
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        CMP      R0,R1
        BGE.N    ??spiffs_fd_return_1
??spiffs_fd_return_0:
        LDR.N    R0,??DataTable25_9  ;; 0xffffd8e6
        B.N      ??spiffs_fd_return_2
??spiffs_fd_return_1:
        LDR      R3,[R2, #+44]
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,#+48
        MLA      R0,R0,R1,R3
        SUBS     R4,R0,#+48
        LDRSH    R0,[R4, #+4]
        CMP      R0,#+0
        BNE.N    ??spiffs_fd_return_3
        LDR.N    R0,??DataTable25_10  ;; 0xffffd8e8
        B.N      ??spiffs_fd_return_2
??spiffs_fd_return_3:
        MOVS     R0,#+0
        STRH     R0,[R4, #+4]
        MOVS     R0,#+0
        STR      R0,[R4, #+44]
        MOVS     R0,#+0
??spiffs_fd_return_2:
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_fd_get:
        PUSH     {R4}
        MOVS     R3,R0
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        CMP      R1,#+1
        BLT.N    ??spiffs_fd_get_0
        LDR      R0,[R3, #+48]
        SXTH     R0,R0            ;; SignExt  R0,R0,#+16,#+16
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        CMP      R0,R1
        BGE.N    ??spiffs_fd_get_1
??spiffs_fd_get_0:
        LDR.N    R0,??DataTable25_9  ;; 0xffffd8e6
        B.N      ??spiffs_fd_get_2
??spiffs_fd_get_1:
        LDR      R4,[R3, #+44]
        SXTH     R1,R1            ;; SignExt  R1,R1,#+16,#+16
        MOVS     R0,#+48
        MLA      R0,R0,R1,R4
        SUBS     R0,R0,#+48
        STR      R0,[R2, #+0]
        LDR      R0,[R2, #+0]
        LDRSH    R0,[R0, #+4]
        CMP      R0,#+0
        BNE.N    ??spiffs_fd_get_3
        LDR.N    R0,??DataTable25_10  ;; 0xffffd8e8
        B.N      ??spiffs_fd_get_2
??spiffs_fd_get_3:
        MOVS     R0,#+0
??spiffs_fd_get_2:
        POP      {R4}
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25:
        DC32     0xffffd8e3

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_1:
        DC32     0xffffd8e1

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_2:
        DC32     0xffffd8e4

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_3:
        DC32     0xffffd8ed

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_4:
        DC32     0xffffd8d9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_5:
        DC32     spiffs_obj_lu_find_free_obj_id_bitmap_v

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_6:
        DC32     0xffffd8ef

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_7:
        DC32     spiffs_obj_lu_find_free_obj_id_compact_v

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_8:
        DC32     0xffffd8e9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_9:
        DC32     0xffffd8e6

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable25_10:
        DC32     0xffffd8e8

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_fd_temporal_cache_rehash:
        PUSH     {R4-R8,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R1,R5
        MOVS     R0,R4
        BL       spiffs_hash
        MOV      R8,R0
        MOVS     R1,R6
        MOVS     R0,R4
        BL       spiffs_hash
        LDR      R1,[R4, #+44]
        MOVS     R2,#+0
        MOVS     R7,R2
??spiffs_fd_temporal_cache_rehash_0:
        LDR      R2,[R4, #+48]
        CMP      R7,R2
        BCS.N    ??spiffs_fd_temporal_cache_rehash_1
        MOVS     R2,#+48
        MLA      R2,R2,R7,R1
        LDRH     R3,[R2, #+40]
        CMP      R3,#+0
        BEQ.N    ??spiffs_fd_temporal_cache_rehash_2
        LDR      R3,[R2, #+36]
        CMP      R3,R8
        BNE.N    ??spiffs_fd_temporal_cache_rehash_2
        STR      R0,[R2, #+36]
??spiffs_fd_temporal_cache_rehash_2:
        ADDS     R7,R7,#+1
        B.N      ??spiffs_fd_temporal_cache_rehash_0
??spiffs_fd_temporal_cache_rehash_1:
        POP      {R4-R8,PC}       ;; return

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
// 12 222 bytes in section .text
// 
// 12 222 bytes of CODE memory
//
//Errors: none
//Warnings: none
