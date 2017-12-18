///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       15/Dec/2017  11:10:23
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\spiffs\src\spiffs_check.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\spiffs\src\spiffs_check.c -D
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\..\gprsdtu\dev\ -Ol --vla
//        --use_c++_inline -I D:\software\IAR\arm\CMSIS\Include\
//    List file    =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\spiffs_check.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN __aeabi_memset
        EXTERN spiffs_obj_lu_find_entry_visitor
        EXTERN spiffs_obj_lu_find_free
        EXTERN spiffs_obj_lu_find_id_and_span
        EXTERN spiffs_obj_lu_find_id_and_span_by_phdr
        EXTERN spiffs_page_allocate_data
        EXTERN spiffs_page_delete
        EXTERN spiffs_phys_cpy
        EXTERN spiffs_phys_rd
        EXTERN spiffs_phys_wr

        PUBLIC spiffs_lookup_consistency_check
        PUBLIC spiffs_object_index_consistency_check
        PUBLIC spiffs_page_consistency_check


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_object_get_data_page_index_reference:
        PUSH     {R2-R8,LR}
        MOVS     R4,R0
        MOVS     R6,R2
        MOVS     R5,R3
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+39
        BCS.N    ??spiffs_object_get_data_page_index_reference_0
        MOVS     R8,#+0
        B.N      ??spiffs_object_get_data_page_index_reference_1
??spiffs_object_get_data_page_index_reference_0:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        SUBS     R0,R6,#+39
        MOVS     R2,#+60
        UDIV     R0,R0,R2
        ADDS     R8,R0,#+1
??spiffs_object_get_data_page_index_reference_1:
        LDR      R7,[SP, #+32]
        STR      R7,[SP, #+0]
        MOVS     R3,#+0
        MOV      R2,R8
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        ORRS     R1,R1,#0x8000
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_id_and_span
        CMP      R0,#+0
        BMI.N    ??spiffs_object_get_data_page_index_reference_2
??spiffs_object_get_data_page_index_reference_3:
        LDRH     R0,[R7, #+0]
        MOVS     R1,#+128
        MUL      R3,R1,R0
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        CMP      R8,#+0
        BNE.N    ??spiffs_object_get_data_page_index_reference_4
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        LSLS     R0,R6,#+1
        ADDS     R0,R0,#+49
        ADDS     R3,R0,R3
        B.N      ??spiffs_object_get_data_page_index_reference_5
??spiffs_object_get_data_page_index_reference_4:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+39
        BCS.N    ??spiffs_object_get_data_page_index_reference_6
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        B.N      ??spiffs_object_get_data_page_index_reference_7
??spiffs_object_get_data_page_index_reference_6:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        SUBS     R0,R6,#+39
        MOVS     R1,#+60
        UDIV     R2,R0,R1
        MLS      R6,R1,R2,R0
??spiffs_object_get_data_page_index_reference_7:
        LSLS     R0,R6,#+1
        ADDS     R0,R0,#+8
        ADDS     R3,R0,R3
??spiffs_object_get_data_page_index_reference_5:
        STR      R5,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        MOVS     R2,#+0
        MOVS     R1,#+21
        MOVS     R0,R4
        BL       spiffs_phys_rd
??spiffs_object_get_data_page_index_reference_2:
        POP      {R1,R2,R4-R8,PC}  ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_rewrite_page:
        PUSH     {R0-R6,LR}
        MOVS     R4,R0
        MOVS     R6,R1
        MOVS     R5,R3
        STR      R5,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        LDRH     R1,[R2, #+0]
        MOVS     R0,R4
        BL       spiffs_page_allocate_data
        CMP      R0,#+0
        BMI.N    ??spiffs_rewrite_page_0
??spiffs_rewrite_page_1:
        MOVS     R0,#+123
        STR      R0,[SP, #+0]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R0,#+128
        MUL      R0,R0,R6
        ADDS     R3,R0,#+5
        LDRH     R0,[R5, #+0]
        MOVS     R1,#+128
        MULS     R0,R1,R0
        ADDS     R2,R0,#+5
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       spiffs_phys_cpy
        CMP      R0,#+0
        BMI.N    ??spiffs_rewrite_page_0
??spiffs_rewrite_page_2:
??spiffs_rewrite_page_0:
        ADD      SP,SP,#+16
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_rewrite_index:
        PUSH     {R1,R4-R9,LR}
        SUB      SP,SP,#+16
        MOVS     R5,R0
        MOVS     R6,R2
        MOVS     R7,R3
        LDRH     R0,[SP, #+16]
        ORRS     R0,R0,#0x8000
        STRH     R0,[SP, #+16]
        ADD      R0,SP,#+12
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+8
        LDR      R2,[R5, #+24]
        LDRH     R1,[R5, #+20]
        MOVS     R0,R5
        BL       spiffs_obj_lu_find_free
        CMP      R0,#+0
        BMI.W    ??spiffs_rewrite_index_0
??spiffs_rewrite_index_1:
        LDRH     R0,[SP, #+8]
        LDR      R1,[SP, #+12]
        ADDS     R0,R1,R0, LSL #+5
        ADDS     R8,R0,#+1
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+39
        BCS.N    ??spiffs_rewrite_index_2
        MOVS     R9,#+0
        B.N      ??spiffs_rewrite_index_3
??spiffs_rewrite_index_2:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        SUBS     R0,R6,#+39
        MOVS     R1,#+60
        UDIV     R0,R0,R1
        ADDS     R9,R0,#+1
??spiffs_rewrite_index_3:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R9,#+0
        BNE.N    ??spiffs_rewrite_index_4
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        STR      R6,[SP, #+12]
        B.N      ??spiffs_rewrite_index_5
??spiffs_rewrite_index_4:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+39
        BCS.N    ??spiffs_rewrite_index_6
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOVS     R0,R6
        B.N      ??spiffs_rewrite_index_7
??spiffs_rewrite_index_6:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        SUBS     R0,R6,#+39
        MOVS     R1,#+60
        UDIV     R2,R0,R1
        MLS      R0,R1,R2,R0
??spiffs_rewrite_index_7:
        STR      R0,[SP, #+12]
??spiffs_rewrite_index_5:
        LDR      R4,[SP, #+48]
        LDR      R0,[R5, #+36]
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R0,#+128
        MUL      R3,R0,R4
        MOVS     R2,#+0
        MOVS     R1,#+21
        MOVS     R0,R5
        BL       spiffs_phys_rd
        CMP      R0,#+0
        BMI.N    ??spiffs_rewrite_index_0
??spiffs_rewrite_index_8:
        LDR      R0,[R5, #+36]
        LDRH     R1,[R0, #+0]
        LDRH     R2,[SP, #+16]
        CMP      R1,R2
        BEQ.N    ??spiffs_rewrite_index_9
        MOV      R1,R8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        BL       spiffs_page_delete
        LDR.W    R0,??DataTable4  ;; 0xffffd8bd
        B.N      ??spiffs_rewrite_index_0
??spiffs_rewrite_index_9:
        LDRH     R1,[R0, #+2]
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R1,R9
        BEQ.N    ??spiffs_rewrite_index_10
        MOV      R1,R8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        BL       spiffs_page_delete
        LDR.W    R0,??DataTable4_1  ;; 0xffffd8bc
        B.N      ??spiffs_rewrite_index_0
??spiffs_rewrite_index_10:
        LDRB     R0,[R0, #+4]
        ANDS     R0,R0,#0xC7
        CMP      R0,#+192
        BEQ.N    ??spiffs_rewrite_index_11
        MOV      R1,R8
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        BL       spiffs_page_delete
        LDR.W    R0,??DataTable4_2  ;; 0xffffd8bb
        B.N      ??spiffs_rewrite_index_0
??spiffs_rewrite_index_11:
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R9,#+0
        BNE.N    ??spiffs_rewrite_index_12
        LDR      R0,[R5, #+36]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ADDS     R0,R0,R6, LSL #+1
        STRH     R7,[R0, #+49]
        B.N      ??spiffs_rewrite_index_13
??spiffs_rewrite_index_12:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        CMP      R6,#+39
        BCS.N    ??spiffs_rewrite_index_14
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        B.N      ??spiffs_rewrite_index_15
??spiffs_rewrite_index_14:
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        SUBS     R0,R6,#+39
        MOVS     R1,#+60
        UDIV     R2,R0,R1
        MLS      R6,R1,R2,R0
??spiffs_rewrite_index_15:
        LDR      R0,[R5, #+36]
        ADDS     R0,R0,R6, LSL #+1
        STRH     R7,[R0, #+8]
??spiffs_rewrite_index_13:
        LDR      R0,[R5, #+36]
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOVS     R0,#+128
        MUL      R3,R0,R8
        MOVS     R2,#+0
        MOVS     R1,#+7
        MOVS     R0,R5
        BL       spiffs_phys_wr
        CMP      R0,#+0
        BMI.N    ??spiffs_rewrite_index_0
??spiffs_rewrite_index_16:
        ADD      R0,SP,#+16
        STR      R0,[SP, #+4]
        MOVS     R0,#+2
        STR      R0,[SP, #+0]
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOVS     R0,#+32
        SDIV     R0,R8,R0
        MOV      R1,#+4096
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOVS     R2,#+32
        SDIV     R3,R8,R2
        MLS      R3,R3,R2,R8
        SUBS     R2,R3,#+1
        LSLS     R2,R2,#+1
        MLA      R3,R1,R0,R2
        MOVS     R2,#+0
        MOVS     R1,#+4
        MOVS     R0,R5
        BL       spiffs_phys_wr
        CMP      R0,#+0
        BMI.N    ??spiffs_rewrite_index_0
??spiffs_rewrite_index_17:
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R5
        BL       spiffs_page_delete
??spiffs_rewrite_index_0:
        ADD      SP,SP,#+20
        POP      {R4-R9,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_delete_obj_lazy:
        PUSH     {R4,LR}
        SUB      SP,SP,#+16
        MOVS     R4,R0
        ADD      R0,SP,#+10
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_id_and_span
        LDR.W    R1,??DataTable4_3  ;; 0xffffd8ee
        CMP      R0,R1
        BNE.N    ??spiffs_delete_obj_lazy_0
        MOVS     R0,#+0
        B.N      ??spiffs_delete_obj_lazy_1
??spiffs_delete_obj_lazy_0:
        CMP      R0,#+0
        BMI.N    ??spiffs_delete_obj_lazy_1
??spiffs_delete_obj_lazy_2:
        MOVS     R0,#+191
        STRB     R0,[SP, #+8]
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+10]
        MOVS     R1,#+128
        MULS     R0,R1,R0
        ADDS     R3,R0,#+4
        MOVS     R2,#+0
        MOVS     R1,#+4
        MOVS     R0,R4
        BL       spiffs_phys_wr
??spiffs_delete_obj_lazy_1:
        ADD      SP,SP,#+16
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_lookup_check_validate:
        PUSH     {R4-R10,LR}
        SUB      SP,SP,#+72
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        MOVS     R9,#+0
        MOVS     R10,#+0
        LDR      R8,[SP, #+112]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BNE.N    ??spiffs_lookup_check_validate_0
        LDRB     R0,[R6, #+4]
        LSLS     R0,R0,#+24
        BMI.N    ??spiffs_lookup_check_validate_1
??spiffs_lookup_check_validate_0:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVW     R0,#+65535
        CMP      R5,R0
        BNE.W    ??spiffs_lookup_check_validate_2
        LDRB     R0,[R6, #+4]
        LSLS     R0,R0,#+31
        BMI.W    ??spiffs_lookup_check_validate_2
??spiffs_lookup_check_validate_1:
        MOVS     R0,#+1
        STR      R0,[R8, #+0]
        MOVS     R9,#+1
        LDRB     R0,[R6, #+4]
        LSLS     R0,R0,#+29
        BPL.N    ??spiffs_lookup_check_validate_3
        ADD      R0,SP,#+26
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+20
        LDRH     R2,[R6, #+2]
        LDRH     R1,[R6, #+0]
        MOVS     R0,R4
        BL       spiffs_object_get_data_page_index_reference
        MOV      R10,R0
        LDR.W    R0,??DataTable4_3  ;; 0xffffd8ee
        CMP      R10,R0
        BNE.N    ??spiffs_lookup_check_validate_4
        MOVS     R10,#+0
        B.N      ??spiffs_lookup_check_validate_2
??spiffs_lookup_check_validate_4:
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_5
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_5:
        LDRH     R0,[SP, #+20]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R0,R7
        BNE.W    ??spiffs_lookup_check_validate_2
        ADD      R3,SP,#+34
        MOVS     R2,R6
        MOVS     R1,R7
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_rewrite_page
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_7
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_7:
        MOVS     R0,#+1
        STR      R0,[R8, #+0]
        LDRH     R0,[SP, #+26]
        STR      R0,[SP, #+0]
        LDRH     R3,[SP, #+34]
        LDRH     R2,[R6, #+2]
        LDRH     R1,[R6, #+0]
        MOVS     R0,R4
        BL       spiffs_rewrite_index
        MOV      R10,R0
        LDR.W    R0,??DataTable4_2  ;; 0xffffd8bb
        SUBS     R0,R10,R0
        CMP      R0,#+3
        BCS.N    ??spiffs_lookup_check_validate_8
        LDRH     R1,[SP, #+34]
        MOVS     R0,R4
        BL       spiffs_page_delete
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_9
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_9:
        LDRH     R1,[R6, #+0]
        MOVS     R0,R4
        BL       spiffs_delete_obj_lazy
        MOV      R10,R0
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_10
        MOVS     R3,#+0
        LDRH     R2,[R6, #+0]
        MOVS     R1,#+6
        MOVS     R0,#+0
        LDR      R12,[R4, #+92]
        BLX      R12
??spiffs_lookup_check_validate_10:
        B.N      ??spiffs_lookup_check_validate_11
??spiffs_lookup_check_validate_8:
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_12
        LDRH     R3,[R6, #+2]
        LDRH     R2,[R6, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+0
        LDR      R12,[R4, #+92]
        BLX      R12
??spiffs_lookup_check_validate_12:
??spiffs_lookup_check_validate_11:
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_13
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_13:
        B.N      ??spiffs_lookup_check_validate_2
??spiffs_lookup_check_validate_3:
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,R7
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRH     R2,[R6, #+2]
        LDRH     R0,[R6, #+0]
        ORRS     R1,R0,#0x8000
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_id_and_span
        MOV      R10,R0
        LDR.W    R0,??DataTable4_3  ;; 0xffffd8ee
        CMP      R10,R0
        BNE.N    ??spiffs_lookup_check_validate_14
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        LDRH     R0,[R6, #+0]
        ORRS     R1,R0,#0x8000
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_id_and_span_by_phdr
        MOV      R10,R0
        CMP      R10,#+0
        BNE.N    ??spiffs_lookup_check_validate_2
        ADD      R3,SP,#+42
        MOVS     R2,R6
        MOVS     R1,R7
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_rewrite_page
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_15
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_15:
        MOVS     R0,#+1
        STR      R0,[R8, #+0]
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_16
        LDRH     R3,[R6, #+2]
        LDRH     R2,[R6, #+0]
        MOVS     R1,#+3
        MOVS     R0,#+0
        LDR      R12,[R4, #+92]
        BLX      R12
??spiffs_lookup_check_validate_16:
        B.N      ??spiffs_lookup_check_validate_2
??spiffs_lookup_check_validate_14:
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_17
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_17:
??spiffs_lookup_check_validate_2:
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVW     R0,#+65535
        CMP      R5,R0
        BEQ.W    ??spiffs_lookup_check_validate_18
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        CMP      R5,#+0
        BEQ.W    ??spiffs_lookup_check_validate_18
        LDRH     R0,[R6, #+0]
        ORRS     R0,R0,#0x8000
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        ORRS     R1,R5,#0x8000
        CMP      R0,R1
        BEQ.W    ??spiffs_lookup_check_validate_19
        MOVS     R9,#+1
        LDRB     R0,[R6, #+4]
        ANDS     R0,R0,#0x82
        CMP      R0,#+128
        BNE.W    ??spiffs_lookup_check_validate_18
        LDRB     R0,[R6, #+4]
        MOVS     R1,#+68
        TST      R0,R1
        BEQ.W    ??spiffs_lookup_check_validate_18
        LDRB     R0,[R6, #+4]
        LSLS     R0,R0,#+29
        BPL.N    ??spiffs_lookup_check_validate_20
        ADD      R0,SP,#+26
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+20
        LDRH     R2,[R6, #+2]
        LDRH     R1,[R6, #+0]
        MOVS     R0,R4
        BL       spiffs_object_get_data_page_index_reference
        MOV      R10,R0
        LDR.W    R0,??DataTable4_3  ;; 0xffffd8ee
        CMP      R10,R0
        BNE.N    ??spiffs_lookup_check_validate_21
        MOVS     R10,#+0
        B.N      ??spiffs_lookup_check_validate_18
??spiffs_lookup_check_validate_21:
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_22
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_22:
        LDRH     R0,[SP, #+20]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R0,R7
        BNE.W    ??spiffs_lookup_check_validate_18
        ADD      R3,SP,#+32
        MOVS     R2,R6
        MOVS     R1,R7
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_rewrite_page
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_23
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_23:
        LDRH     R0,[SP, #+26]
        STR      R0,[SP, #+0]
        LDRH     R3,[SP, #+32]
        LDRH     R2,[R6, #+2]
        LDRH     R1,[R6, #+0]
        MOVS     R0,R4
        BL       spiffs_rewrite_index
        MOV      R10,R0
        LDR.W    R0,??DataTable4_2  ;; 0xffffd8bb
        SUBS     R0,R10,R0
        CMP      R0,#+3
        BCS.N    ??spiffs_lookup_check_validate_24
        LDRH     R1,[SP, #+32]
        MOVS     R0,R4
        BL       spiffs_page_delete
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_25
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_25:
        LDRH     R1,[R6, #+0]
        MOVS     R0,R4
        BL       spiffs_delete_obj_lazy
        MOV      R10,R0
        MOVS     R0,#+1
        STR      R0,[R8, #+0]
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_26
        MOVS     R3,#+0
        LDRH     R2,[R6, #+0]
        MOVS     R1,#+6
        MOVS     R0,#+0
        LDR      R5,[R4, #+92]
        BLX      R5
??spiffs_lookup_check_validate_26:
??spiffs_lookup_check_validate_24:
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_27
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_27:
        B.N      ??spiffs_lookup_check_validate_18
??spiffs_lookup_check_validate_20:
        ADD      R0,SP,#+18
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        LDRH     R2,[R6, #+2]
        ORRS     R1,R5,#0x8000
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_id_and_span
        MOV      R10,R0
        LDR.W    R0,??DataTable4_3  ;; 0xffffd8ee
        CMP      R10,R0
        BNE.N    ??spiffs_lookup_check_validate_28
        MOVS     R10,#+0
        MOVS     R0,#+0
        STRH     R0,[SP, #+18]
??spiffs_lookup_check_validate_28:
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_29
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_29:
        ADD      R0,SP,#+16
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        LDRH     R2,[R6, #+2]
        LDRH     R0,[R6, #+0]
        ORRS     R1,R0,#0x8000
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_id_and_span
        MOV      R10,R0
        LDR.W    R0,??DataTable4_3  ;; 0xffffd8ee
        CMP      R10,R0
        BNE.N    ??spiffs_lookup_check_validate_30
        MOVS     R10,#+0
        MOVS     R0,#+0
        STRH     R0,[SP, #+16]
??spiffs_lookup_check_validate_30:
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_31
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_31:
        LDRH     R0,[SP, #+16]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_32
        LDRH     R0,[SP, #+18]
        CMP      R0,#+0
        BNE.W    ??spiffs_lookup_check_validate_18
??spiffs_lookup_check_validate_32:
        ADD      R0,SP,#+30
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        LSLS     R1,R5,#+17       ;; ZeroExtS R1,R5,#+17,#+17
        LSRS     R1,R1,#+17
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_id_and_span
        MOV      R10,R0
        LDR.W    R0,??DataTable4_3  ;; 0xffffd8ee
        CMP      R10,R0
        BNE.N    ??spiffs_lookup_check_validate_33
        MOVS     R10,#+0
        MOVS     R0,#+0
        STRH     R0,[SP, #+18]
??spiffs_lookup_check_validate_33:
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_34
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_34:
        ADD      R0,SP,#+28
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        LDRH     R0,[R6, #+0]
        LSLS     R1,R0,#+17       ;; ZeroExtS R1,R0,#+17,#+17
        LSRS     R1,R1,#+17
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_id_and_span
        MOV      R10,R0
        LDR.W    R0,??DataTable4_3  ;; 0xffffd8ee
        CMP      R10,R0
        BNE.N    ??spiffs_lookup_check_validate_35
        MOVS     R10,#+0
        MOVS     R0,#+0
        STRH     R0,[SP, #+16]
??spiffs_lookup_check_validate_35:
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_36
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_36:
        MOVS     R0,#+248
        STRB     R0,[SP, #+48]
        LDRH     R0,[R6, #+2]
        STRH     R0,[SP, #+46]
        LDRH     R0,[SP, #+18]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_37
        LDRH     R0,[SP, #+30]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_37
        LDRH     R0,[SP, #+28]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_37
        LDRH     R0,[SP, #+16]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_38
??spiffs_lookup_check_validate_37:
        LDRH     R0,[SP, #+18]
        CMP      R0,#+0
        BNE.N    ??spiffs_lookup_check_validate_39
        LDRH     R0,[SP, #+28]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_39
        LDRH     R0,[SP, #+16]
        CMP      R0,#+0
        BNE.N    ??spiffs_lookup_check_validate_39
??spiffs_lookup_check_validate_38:
        LDRH     R0,[R6, #+0]
        ORRS     R0,R0,#0x8000
        STRH     R0,[SP, #+44]
        ADD      R3,SP,#+40
        ADD      R2,SP,#+44
        MOVS     R1,R7
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_rewrite_page
        MOV      R10,R0
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_40
        LDRH     R3,[R6, #+2]
        LDRH     R2,[R6, #+0]
        MOVS     R1,#+3
        MOVS     R0,#+0
        LDR      R5,[R4, #+92]
        BLX      R5
??spiffs_lookup_check_validate_40:
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_41
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_41:
        MOVS     R0,#+1
        STR      R0,[R8, #+0]
        B.N      ??spiffs_lookup_check_validate_18
??spiffs_lookup_check_validate_39:
        LDRH     R0,[SP, #+16]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_42
        LDRH     R0,[SP, #+28]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_42
        LDRH     R0,[SP, #+30]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_42
        LDRH     R0,[SP, #+18]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_43
??spiffs_lookup_check_validate_42:
        LDRH     R0,[SP, #+16]
        CMP      R0,#+0
        BNE.W    ??spiffs_lookup_check_validate_18
        LDRH     R0,[SP, #+30]
        CMP      R0,#+0
        BEQ.W    ??spiffs_lookup_check_validate_18
        LDRH     R0,[SP, #+18]
        CMP      R0,#+0
        BNE.W    ??spiffs_lookup_check_validate_18
??spiffs_lookup_check_validate_43:
        ORRS     R0,R5,#0x8000
        STRH     R0,[SP, #+44]
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_44
        LDRH     R3,[R6, #+2]
        LDRH     R2,[R6, #+0]
        MOVS     R1,#+3
        MOVS     R0,#+0
        LDR      R5,[R4, #+92]
        BLX      R5
??spiffs_lookup_check_validate_44:
        ADD      R3,SP,#+40
        ADD      R2,SP,#+44
        MOVS     R1,R7
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_rewrite_page
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_45
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_45:
        MOVS     R0,#+1
        STR      R0,[R8, #+0]
        B.N      ??spiffs_lookup_check_validate_18
??spiffs_lookup_check_validate_19:
        LSLS     R0,R5,#+16
        BPL.N    ??spiffs_lookup_check_validate_46
        LDRB     R0,[R6, #+4]
        LSLS     R0,R0,#+29
        BMI.N    ??spiffs_lookup_check_validate_47
??spiffs_lookup_check_validate_46:
        LSLS     R0,R5,#+16
        BMI.W    ??spiffs_lookup_check_validate_48
        LDRB     R0,[R6, #+4]
        LSLS     R0,R0,#+29
        BMI.W    ??spiffs_lookup_check_validate_48
??spiffs_lookup_check_validate_47:
        ADD      R0,SP,#+24
        STR      R0,[SP, #+0]
        MOVS     R3,R7
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRH     R2,[R6, #+2]
        LSLS     R1,R5,#+17       ;; ZeroExtS R1,R5,#+17,#+17
        LSRS     R1,R1,#+17
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_id_and_span
        MOV      R10,R0
        LDR.N    R0,??DataTable4_3  ;; 0xffffd8ee
        CMP      R10,R0
        BNE.N    ??spiffs_lookup_check_validate_49
        MOVS     R10,#+0
        MOVS     R0,#+0
        STRH     R0,[SP, #+24]
??spiffs_lookup_check_validate_49:
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_50
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_50:
        ADD      R0,SP,#+22
        STR      R0,[SP, #+0]
        MOVS     R3,R7
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRH     R2,[R6, #+2]
        ORRS     R1,R5,#0x8000
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_id_and_span
        MOV      R10,R0
        LDR.N    R0,??DataTable4_3  ;; 0xffffd8ee
        CMP      R10,R0
        BNE.N    ??spiffs_lookup_check_validate_51
        MOVS     R10,#+0
        MOVS     R0,#+0
        STRH     R0,[SP, #+22]
??spiffs_lookup_check_validate_51:
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_52
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_52:
        MOVS     R9,#+1
        LDRH     R0,[SP, #+24]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_53
        LDRH     R0,[SP, #+22]
        CMP      R0,#+0
        BNE.W    ??spiffs_lookup_check_validate_18
??spiffs_lookup_check_validate_53:
        LDRH     R0,[SP, #+24]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_54
        LDRH     R0,[SP, #+22]
        CMP      R0,#+0
        BNE.N    ??spiffs_lookup_check_validate_54
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_55
        LDRH     R3,[R6, #+2]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R2,R5
        MOVS     R1,#+2
        MOVS     R0,#+0
        LDR      R12,[R4, #+92]
        BLX      R12
??spiffs_lookup_check_validate_55:
        MOVS     R0,#+248
        STRB     R0,[SP, #+64]
        ORRS     R0,R5,#0x8000
        STRH     R0,[SP, #+60]
        LDRH     R0,[R6, #+2]
        STRH     R0,[SP, #+62]
        ADD      R0,SP,#+38
        STR      R0,[SP, #+12]
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        ADD      R2,SP,#+60
        LDRH     R1,[SP, #+60]
        MOVS     R0,R4
        BL       spiffs_page_allocate_data
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_56
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_56:
        MOVS     R0,#+123
        STR      R0,[SP, #+0]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R0,#+128
        MUL      R0,R0,R7
        ADDS     R3,R0,#+5
        LDRH     R0,[SP, #+38]
        MOVS     R1,#+128
        MULS     R0,R1,R0
        ADDS     R2,R0,#+5
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       spiffs_phys_cpy
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_57
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_57:
        B.N      ??spiffs_lookup_check_validate_18
??spiffs_lookup_check_validate_54:
        LDRH     R0,[SP, #+24]
        CMP      R0,#+0
        BNE.W    ??spiffs_lookup_check_validate_18
        LDRH     R0,[SP, #+22]
        CMP      R0,#+0
        BEQ.W    ??spiffs_lookup_check_validate_18
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_58
        LDRH     R3,[R6, #+2]
        UXTH     R5,R5            ;; ZeroExt  R5,R5,#+16,#+16
        MOVS     R2,R5
        MOVS     R1,#+3
        MOVS     R0,#+0
        LDR      R12,[R4, #+92]
        BLX      R12
??spiffs_lookup_check_validate_58:
        MOVS     R0,#+252
        STRB     R0,[SP, #+56]
        LSLS     R0,R5,#+17       ;; ZeroExtS R0,R5,#+17,#+17
        LSRS     R0,R0,#+17
        STRH     R0,[SP, #+52]
        LDRH     R0,[R6, #+2]
        STRH     R0,[SP, #+54]
        ADD      R0,SP,#+36
        STR      R0,[SP, #+12]
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        ADD      R2,SP,#+52
        LDRH     R1,[SP, #+52]
        MOVS     R0,R4
        BL       spiffs_page_allocate_data
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_59
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_59:
        MOVS     R0,#+123
        STR      R0,[SP, #+0]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R0,#+128
        MUL      R0,R0,R7
        ADDS     R3,R0,#+5
        LDRH     R0,[SP, #+36]
        MOVS     R1,#+128
        MULS     R0,R1,R0
        ADDS     R2,R0,#+5
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       spiffs_phys_cpy
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_60
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_60:
        B.N      ??spiffs_lookup_check_validate_18
??spiffs_lookup_check_validate_48:
        LDRB     R0,[R6, #+4]
        LSLS     R0,R0,#+24
        BMI.N    ??spiffs_lookup_check_validate_61
        MOVS     R9,#+1
        B.N      ??spiffs_lookup_check_validate_18
??spiffs_lookup_check_validate_61:
        LDRB     R0,[R6, #+4]
        LSLS     R0,R0,#+30
        BPL.N    ??spiffs_lookup_check_validate_18
        MOVS     R0,#+1
        STR      R0,[R8, #+0]
        ADD      R0,SP,#+26
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+20
        LDRH     R2,[R6, #+2]
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_object_get_data_page_index_reference
        MOV      R10,R0
        LDR.N    R0,??DataTable4_3  ;; 0xffffd8ee
        CMP      R10,R0
        BNE.N    ??spiffs_lookup_check_validate_62
        MOVS     R10,#+0
        MOVS     R9,#+1
        B.N      ??spiffs_lookup_check_validate_18
??spiffs_lookup_check_validate_62:
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_63
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_63:
        LDRH     R0,[SP, #+20]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R0,R7
        BEQ.N    ??spiffs_lookup_check_validate_64
        MOVS     R9,#+1
        B.N      ??spiffs_lookup_check_validate_18
??spiffs_lookup_check_validate_64:
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_65
        LDRH     R3,[R6, #+2]
        LDRH     R2,[R6, #+0]
        MOVS     R1,#+3
        MOVS     R0,#+0
        LDR      R5,[R4, #+92]
        BLX      R5
??spiffs_lookup_check_validate_65:
        MOVS     R0,#+253
        STRB     R0,[SP, #+8]
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        MOVS     R0,#+1
        STR      R0,[SP, #+0]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R0,#+128
        MUL      R0,R0,R7
        ADDS     R3,R0,#+4
        MOVS     R2,#+0
        MOVS     R1,#+7
        MOVS     R0,R4
        BL       spiffs_phys_wr
        MOV      R10,R0
??spiffs_lookup_check_validate_18:
        UXTB     R9,R9            ;; ZeroExt  R9,R9,#+24,#+24
        CMP      R9,#+0
        BEQ.N    ??spiffs_lookup_check_validate_66
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_validate_67
        MOVS     R3,#+0
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R2,R7
        MOVS     R1,#+5
        MOVS     R0,#+0
        LDR      R5,[R4, #+92]
        BLX      R5
??spiffs_lookup_check_validate_67:
        MOVS     R1,R7
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_page_delete
        MOV      R10,R0
        CMP      R10,#+0
        BPL.N    ??spiffs_lookup_check_validate_68
        MOV      R0,R10
        B.N      ??spiffs_lookup_check_validate_6
??spiffs_lookup_check_validate_68:
??spiffs_lookup_check_validate_66:
        MOV      R0,R10
??spiffs_lookup_check_validate_6:
        ADD      SP,SP,#+72
        POP      {R4-R10,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_lookup_check_v:
        PUSH     {R4-R8,LR}
        SUB      SP,SP,#+24
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        MOVS     R7,R3
        MOVS     R0,#+0
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        ADDS     R0,R7,R6, LSL #+5
        ADDS     R8,R0,#+1
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_v_0
        MOVS     R3,#+0
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        MOV      R0,#+256
        MUL      R0,R0,R6
        LDR      R1,[R4, #+16]
        UDIV     R2,R0,R1
        MOVS     R1,#+0
        MOVS     R0,#+0
        LDR      R12,[R4, #+92]
        BLX      R12
??spiffs_lookup_check_v_0:
        ADD      R0,SP,#+16
        STR      R0,[SP, #+4]
        MOVS     R0,#+5
        STR      R0,[SP, #+0]
        UXTH     R8,R8            ;; ZeroExt  R8,R8,#+16,#+16
        MOVS     R0,#+128
        MUL      R3,R0,R8
        MOVS     R2,#+0
        MOVS     R1,#+21
        MOVS     R0,R4
        BL       spiffs_phys_rd
        CMP      R0,#+0
        BMI.N    ??spiffs_lookup_check_v_1
??spiffs_lookup_check_v_2:
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        ADD      R0,SP,#+12
        STR      R0,[SP, #+8]
        STR      R7,[SP, #+4]
        UXTH     R6,R6            ;; ZeroExt  R6,R6,#+16,#+16
        STR      R6,[SP, #+0]
        MOV      R3,R8
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        ADD      R2,SP,#+16
        MOVS     R1,R5
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_lookup_check_validate
        CMP      R0,#+0
        BMI.N    ??spiffs_lookup_check_v_1
??spiffs_lookup_check_v_3:
        CMP      R0,#+0
        BNE.N    ??spiffs_lookup_check_v_4
        LDR      R0,[SP, #+12]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_check_v_5
        LDR.W    R0,??DataTable7  ;; 0xffffd8a9
        B.N      ??spiffs_lookup_check_v_6
??spiffs_lookup_check_v_5:
        LDR.W    R0,??DataTable7_1  ;; 0xffffd8aa
??spiffs_lookup_check_v_6:
        B.N      ??spiffs_lookup_check_v_1
??spiffs_lookup_check_v_4:
??spiffs_lookup_check_v_1:
        ADD      SP,SP,#+24
        POP      {R4-R8,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_lookup_consistency_check:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+24
        MOVS     R4,R0
        MOVS     R5,#+0
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_consistency_check_0
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+0
        LDR      R5,[R4, #+92]
        BLX      R5
??spiffs_lookup_consistency_check_0:
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
        MOVS     R0,#+0
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        LDR.W    R0,??DataTable7_2
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_entry_visitor
        MOVS     R5,R0
        LDR.W    R0,??DataTable7_3  ;; 0xffffd8a8
        CMP      R5,R0
        BNE.N    ??spiffs_lookup_consistency_check_1
        MOVS     R5,#+0
??spiffs_lookup_consistency_check_1:
        CMP      R5,#+0
        BEQ.N    ??spiffs_lookup_consistency_check_2
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_consistency_check_3
        MOVS     R3,#+0
        MOVS     R2,R5
        MOVS     R1,#+1
        MOVS     R0,#+0
        LDR      R6,[R4, #+92]
        BLX      R6
??spiffs_lookup_consistency_check_3:
??spiffs_lookup_consistency_check_2:
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_lookup_consistency_check_4
        MOVS     R3,#+0
        MOV      R2,#+256
        MOVS     R1,#+0
        MOVS     R0,#+0
        LDR      R4,[R4, #+92]
        BLX      R4
??spiffs_lookup_consistency_check_4:
        MOVS     R0,R5
        ADD      SP,SP,#+24
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     0xffffd8bd

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     0xffffd8bc

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     0xffffd8bb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     0xffffd8ee

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_page_consistency_check_i:
        PUSH     {R4-R11,LR}
        SUB      SP,SP,#+76
        MOVS     R4,R0
        MOVS     R0,#+4
        STR      R0,[SP, #+24]
        MOV      R0,#+1024
        LDR      R1,[SP, #+24]
        UDIV     R0,R0,R1
        STRH     R0,[SP, #+22]
        MOVS     R5,#+0
        MOVS     R0,#+0
        STRH     R0,[SP, #+16]
        B.N      ??spiffs_page_consistency_check_i_0
??spiffs_page_consistency_check_i_1:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??spiffs_page_consistency_check_i_0
        LDRH     R0,[SP, #+16]
        LDRH     R1,[SP, #+22]
        ADDS     R0,R1,R0
        STRH     R0,[SP, #+16]
??spiffs_page_consistency_check_i_0:
        LDRH     R0,[SP, #+16]
        LDR      R1,[R4, #+16]
        CMP      R0,R1, LSL #+5
        BCS.W    ??spiffs_page_consistency_check_i_2
        MOVS     R6,#+0
        MOVS     R1,#+128
        MOVS     R2,#+0
        LDR      R7,[R4, #+40]
        MOVS     R0,R7
        BL       __aeabi_memset
        MOVS     R0,#+0
        STRH     R0,[SP, #+18]
        B.N      ??spiffs_page_consistency_check_i_3
??spiffs_page_consistency_check_i_4:
        LDRH     R0,[SP, #+18]
        ADDS     R0,R0,#+1
        STRH     R0,[SP, #+18]
??spiffs_page_consistency_check_i_3:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.W    ??spiffs_page_consistency_check_i_5
        LDRH     R0,[SP, #+18]
        LDR      R1,[R4, #+16]
        CMP      R0,R1
        BCS.W    ??spiffs_page_consistency_check_i_5
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_page_consistency_check_i_6
        MOVS     R3,#+0
        LDRH     R0,[SP, #+16]
        MOV      R1,#+256
        MULS     R0,R1,R0
        LDR      R1,[R4, #+16]
        LSLS     R1,R1,#+5
        UDIV     R0,R0,R1
        LDRH     R1,[SP, #+18]
        LDRH     R2,[SP, #+22]
        MULS     R1,R2,R1
        MOV      R2,#+256
        MULS     R1,R2,R1
        LDR      R2,[R4, #+16]
        LSLS     R2,R2,#+5
        UDIV     R1,R1,R2
        LDR      R2,[R4, #+16]
        UDIV     R1,R1,R2
        ADDS     R2,R1,R0
        MOVS     R1,#+0
        MOVS     R0,#+2
        LDR      R7,[R4, #+92]
        BLX      R7
??spiffs_page_consistency_check_i_6:
        LDRH     R0,[SP, #+18]
        LSLS     R0,R0,#+5
        ADDS     R7,R0,#+1
        B.N      ??spiffs_page_consistency_check_i_7
??spiffs_page_consistency_check_i_8:
        LDRH     R0,[SP, #+16]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        CMP      R7,R0
        BCC.N    ??spiffs_page_consistency_check_i_9
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDRH     R0,[SP, #+16]
        LDRH     R1,[SP, #+22]
        ADDS     R0,R1,R0
        CMP      R7,R0
        BGE.N    ??spiffs_page_consistency_check_i_9
        MOVS     R0,#+1
        B.N      ??spiffs_page_consistency_check_i_10
??spiffs_page_consistency_check_i_9:
        MOVS     R0,#+0
??spiffs_page_consistency_check_i_10:
        MOVS     R1,#+8
        LDR      R2,[SP, #+24]
        UDIV     R1,R1,R2
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDRH     R2,[SP, #+16]
        SUBS     R2,R7,R2
        UDIV     R1,R2,R1
        MOVS     R2,#+8
        LDR      R3,[SP, #+24]
        UDIV     R2,R2,R3
        SUBS     R2,R2,#+1
        ANDS     R2,R2,R7
        LDR      R3,[SP, #+24]
        MULS     R2,R3,R2
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??spiffs_page_consistency_check_i_11
        LDRB     R3,[SP, #+32]
        ANDS     R3,R3,#0x81
        CMP      R3,#+128
        BNE.N    ??spiffs_page_consistency_check_i_11
        LDR      R3,[R4, #+40]
        LDRB     R3,[R1, R3]
        MOVS     R12,#+1
        LSLS     R12,R12,R2
        ORRS     R3,R12,R3
        LDR      R12,[R4, #+40]
        STRB     R3,[R1, R12]
??spiffs_page_consistency_check_i_11:
        LDRB     R3,[SP, #+32]
        ANDS     R3,R3,#0xC5
        CMP      R3,#+192
        BNE.W    ??spiffs_page_consistency_check_i_12
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.N    ??spiffs_page_consistency_check_i_13
        LDR      R0,[R4, #+40]
        LDRB     R0,[R1, R0]
        MOVS     R3,#+1
        ADDS     R2,R2,#+2
        LSLS     R2,R3,R2
        ORRS     R0,R2,R0
        LDR      R2,[R4, #+40]
        STRB     R0,[R1, R2]
??spiffs_page_consistency_check_i_13:
        LDR      R0,[R4, #+36]
        STR      R0,[SP, #+4]
        MOVS     R0,#+128
        STR      R0,[SP, #+0]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R0,#+128
        MUL      R3,R0,R7
        MOVS     R2,#+0
        MOVS     R1,#+21
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOVS     R5,R0
        CMP      R5,#+0
        BPL.N    ??spiffs_page_consistency_check_i_14
        MOVS     R0,R5
        B.N      ??spiffs_page_consistency_check_i_15
??spiffs_page_consistency_check_i_14:
        LDR      R0,[R4, #+36]
        STR      R0,[SP, #+36]
        LDRH     R0,[SP, #+30]
        CMP      R0,#+0
        BNE.N    ??spiffs_page_consistency_check_i_16
        MOVS     R0,#+39
        STR      R0,[SP, #+40]
        MOVS     R11,#+0
        LDR      R0,[R4, #+36]
        ADDS     R0,R0,#+49
        STR      R0,[SP, #+44]
        B.N      ??spiffs_page_consistency_check_i_17
??spiffs_page_consistency_check_i_16:
        MOVS     R0,#+60
        STR      R0,[SP, #+40]
        LDRH     R0,[SP, #+30]
        MOVS     R1,#+60
        MULS     R0,R1,R0
        SUBS     R11,R0,#+21
        LDR      R0,[R4, #+36]
        ADDS     R0,R0,#+8
        STR      R0,[SP, #+44]
??spiffs_page_consistency_check_i_17:
        MOVS     R8,#+0
        B.N      ??spiffs_page_consistency_check_i_18
??spiffs_page_consistency_check_i_19:
        MOVS     R6,#+1
??spiffs_page_consistency_check_i_20:
        LDR      R0,[R4, #+40]
        LDRB     R0,[R9, R0]
        MOVS     R1,#+1
        ADDS     R2,R10,#+1
        LSLS     R1,R1,R2
        ORRS     R0,R1,R0
        LDR      R1,[R4, #+40]
        STRB     R0,[R9, R1]
??spiffs_page_consistency_check_i_21:
        ADDS     R8,R8,#+1
??spiffs_page_consistency_check_i_18:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.W    ??spiffs_page_consistency_check_i_12
        LDR      R0,[SP, #+40]
        CMP      R8,R0
        BGE.W    ??spiffs_page_consistency_check_i_12
        LDR      R0,[SP, #+44]
        LDRH     R10,[R0, R8, LSL #+1]
        LDRH     R0,[SP, #+16]
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R10,R0
        BCC.N    ??spiffs_page_consistency_check_i_22
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        LDRH     R0,[SP, #+16]
        LDRH     R1,[SP, #+22]
        ADDS     R0,R1,R0
        CMP      R10,R0
        BGE.N    ??spiffs_page_consistency_check_i_22
        MOVS     R0,#+1
        B.N      ??spiffs_page_consistency_check_i_23
??spiffs_page_consistency_check_i_22:
        MOVS     R0,#+0
??spiffs_page_consistency_check_i_23:
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        MOVW     R1,#+65535
        CMP      R10,R1
        BEQ.N    ??spiffs_page_consistency_check_i_24
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        CMP      R10,#+1024
        BGT.N    ??spiffs_page_consistency_check_i_25
??spiffs_page_consistency_check_i_24:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.W    ??spiffs_page_consistency_check_i_26
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        MOVS     R1,#+32
        SDIV     R2,R10,R1
        MLS      R2,R2,R1,R10
        CMP      R2,#+0
        BNE.N    ??spiffs_page_consistency_check_i_26
??spiffs_page_consistency_check_i_25:
        ADD      R0,SP,#+20
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        ADDS     R2,R8,R11
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDR      R0,[SP, #+36]
        LDRH     R0,[R0, #+0]
        LSLS     R1,R0,#+17       ;; ZeroExtS R1,R0,#+17,#+17
        LSRS     R1,R1,#+17
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_id_and_span
        MOVS     R5,R0
        LDR.W    R0,??DataTable7_4  ;; 0xffffd8ee
        CMP      R5,R0
        BNE.N    ??spiffs_page_consistency_check_i_27
        MOVS     R5,#+0
        MOVS     R0,#+0
        STRH     R0,[SP, #+20]
??spiffs_page_consistency_check_i_27:
        CMP      R5,#+0
        BPL.N    ??spiffs_page_consistency_check_i_28
        MOVS     R0,R5
        B.N      ??spiffs_page_consistency_check_i_15
??spiffs_page_consistency_check_i_28:
        LDRH     R0,[SP, #+20]
        CMP      R0,#+0
        BNE.N    ??spiffs_page_consistency_check_i_29
        MOVS     R0,#+252
        STRB     R0,[SP, #+52]
        LDR      R0,[SP, #+36]
        LDRH     R0,[R0, #+0]
        LSLS     R0,R0,#+17       ;; ZeroExtS R0,R0,#+17,#+17
        LSRS     R0,R0,#+17
        STRH     R0,[SP, #+48]
        ADDS     R0,R8,R11
        STRH     R0,[SP, #+50]
        ADD      R0,SP,#+20
        STR      R0,[SP, #+12]
        MOVS     R0,#+1
        STR      R0,[SP, #+8]
        MOVS     R0,#+0
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        ADD      R2,SP,#+48
        LDRH     R1,[SP, #+48]
        MOVS     R0,R4
        BL       spiffs_page_allocate_data
        MOVS     R5,R0
        CMP      R5,#+0
        BPL.N    ??spiffs_page_consistency_check_i_30
        MOVS     R0,R5
        B.N      ??spiffs_page_consistency_check_i_15
??spiffs_page_consistency_check_i_30:
??spiffs_page_consistency_check_i_29:
        MOVS     R0,R7
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STR      R0,[SP, #+0]
        LDRH     R3,[SP, #+20]
        ADDS     R2,R8,R11
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDR      R0,[SP, #+36]
        LDRH     R0,[R0, #+0]
        ORRS     R1,R0,#0x8000
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_rewrite_index
        MOVS     R5,R0
        LDR.W    R0,??DataTable7_5  ;; 0xffffd8bb
        SUBS     R0,R5,R0
        CMP      R0,#+3
        BCS.N    ??spiffs_page_consistency_check_i_31
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_page_consistency_check_i_32
        MOVS     R3,#+0
        LDR      R0,[SP, #+36]
        LDRH     R2,[R0, #+0]
        MOVS     R1,#+6
        MOVS     R0,#+2
        LDR      R5,[R4, #+92]
        BLX      R5
??spiffs_page_consistency_check_i_32:
        MOVS     R1,R7
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_page_delete
        MOVS     R5,R0
        B.N      ??spiffs_page_consistency_check_i_33
??spiffs_page_consistency_check_i_31:
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_page_consistency_check_i_34
        LDR      R0,[SP, #+36]
        LDRH     R3,[R0, #+2]
        LDR      R0,[SP, #+36]
        LDRH     R2,[R0, #+0]
        MOVS     R1,#+2
        MOVS     R0,#+2
        LDR      R6,[R4, #+92]
        BLX      R6
??spiffs_page_consistency_check_i_34:
??spiffs_page_consistency_check_i_33:
        CMP      R5,#+0
        BPL.N    ??spiffs_page_consistency_check_i_35
        MOVS     R0,R5
        B.N      ??spiffs_page_consistency_check_i_15
??spiffs_page_consistency_check_i_35:
        MOVS     R6,#+1
        B.N      ??spiffs_page_consistency_check_i_21
??spiffs_page_consistency_check_i_26:
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+0
        BEQ.W    ??spiffs_page_consistency_check_i_21
        ADD      R0,SP,#+56
        STR      R0,[SP, #+4]
        MOVS     R0,#+5
        STR      R0,[SP, #+0]
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        MOVS     R0,#+128
        MUL      R3,R0,R10
        MOVS     R2,#+0
        MOVS     R1,#+21
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOVS     R5,R0
        CMP      R5,#+0
        BPL.N    ??spiffs_page_consistency_check_i_36
        MOVS     R0,R5
        B.N      ??spiffs_page_consistency_check_i_15
??spiffs_page_consistency_check_i_36:
        LDRH     R0,[SP, #+56]
        LDRH     R1,[SP, #+28]
        BICS     R1,R1,#0x8000
        CMP      R0,R1
        BNE.N    ??spiffs_page_consistency_check_i_37
        LDRH     R0,[SP, #+58]
        UXTH     R11,R11          ;; ZeroExt  R11,R11,#+16,#+16
        ADDS     R1,R8,R11
        CMP      R0,R1
        BNE.N    ??spiffs_page_consistency_check_i_37
        LDRB     R0,[SP, #+60]
        ANDS     R0,R0,#0x85
        CMP      R0,#+132
        BEQ.W    ??spiffs_page_consistency_check_i_38
??spiffs_page_consistency_check_i_37:
        ADD      R0,SP,#+10
        STR      R0,[SP, #+0]
        MOV      R3,R10
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        ADDS     R2,R8,R11
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDRH     R0,[SP, #+28]
        LSLS     R1,R0,#+17       ;; ZeroExtS R1,R0,#+17,#+17
        LSRS     R1,R1,#+17
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_id_and_span
        MOVS     R5,R0
        LDR.W    R0,??DataTable7_4  ;; 0xffffd8ee
        CMP      R5,R0
        BNE.N    ??spiffs_page_consistency_check_i_39
        MOVS     R5,#+0
        MOVS     R0,#+0
        STRH     R0,[SP, #+10]
??spiffs_page_consistency_check_i_39:
        CMP      R5,#+0
        BPL.N    ??spiffs_page_consistency_check_i_40
        MOVS     R0,R5
        B.N      ??spiffs_page_consistency_check_i_15
??spiffs_page_consistency_check_i_40:
        LDRH     R0,[SP, #+10]
        CMP      R0,#+0
        BNE.N    ??spiffs_page_consistency_check_i_41
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_page_consistency_check_i_42
        MOVS     R3,#+0
        LDRH     R2,[SP, #+28]
        MOVS     R1,#+6
        MOVS     R0,#+2
        LDR      R5,[R4, #+92]
        BLX      R5
??spiffs_page_consistency_check_i_42:
        LDRH     R1,[SP, #+28]
        MOVS     R0,R4
        BL       spiffs_delete_obj_lazy
        MOVS     R5,R0
        CMP      R5,#+0
        BPL.N    ??spiffs_page_consistency_check_i_43
        MOVS     R0,R5
        B.N      ??spiffs_page_consistency_check_i_15
??spiffs_page_consistency_check_i_43:
??spiffs_page_consistency_check_i_12:
        ADDS     R7,R7,#+1
??spiffs_page_consistency_check_i_7:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.W    ??spiffs_page_consistency_check_i_4
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        LDRH     R0,[SP, #+18]
        ADDS     R0,R0,#+1
        CMP      R7,R0, LSL #+5
        BGE.W    ??spiffs_page_consistency_check_i_4
        ADD      R0,SP,#+28
        STR      R0,[SP, #+4]
        MOVS     R0,#+5
        STR      R0,[SP, #+0]
        UXTH     R7,R7            ;; ZeroExt  R7,R7,#+16,#+16
        MOVS     R0,#+128
        MUL      R3,R0,R7
        MOVS     R2,#+0
        MOVS     R1,#+21
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOVS     R5,R0
        CMP      R5,#+0
        BPL.W    ??spiffs_page_consistency_check_i_8
        MOVS     R0,R5
        B.N      ??spiffs_page_consistency_check_i_15
??spiffs_page_consistency_check_i_41:
        MOVS     R0,R7
        UXTH     R0,R0            ;; ZeroExt  R0,R0,#+16,#+16
        STR      R0,[SP, #+0]
        LDRH     R3,[SP, #+10]
        ADDS     R2,R8,R11
        UXTH     R2,R2            ;; ZeroExt  R2,R2,#+16,#+16
        LDRH     R1,[SP, #+28]
        MOVS     R0,R4
        BL       spiffs_rewrite_index
        MOVS     R5,R0
        LDR.W    R0,??DataTable7_5  ;; 0xffffd8bb
        SUBS     R0,R5,R0
        CMP      R0,#+3
        BCS.N    ??spiffs_page_consistency_check_i_44
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_page_consistency_check_i_45
        MOVS     R3,#+0
        LDRH     R2,[SP, #+28]
        MOVS     R1,#+6
        MOVS     R0,#+2
        LDR      R5,[R4, #+92]
        BLX      R5
??spiffs_page_consistency_check_i_45:
        LDRH     R1,[SP, #+28]
        MOVS     R0,R4
        BL       spiffs_delete_obj_lazy
        MOVS     R5,R0
        B.N      ??spiffs_page_consistency_check_i_46
??spiffs_page_consistency_check_i_44:
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_page_consistency_check_i_47
        LDRH     R3,[SP, #+30]
        LDRH     R2,[SP, #+28]
        MOVS     R1,#+2
        MOVS     R0,#+2
        LDR      R6,[R4, #+92]
        BLX      R6
??spiffs_page_consistency_check_i_47:
??spiffs_page_consistency_check_i_46:
        CMP      R5,#+0
        BPL.N    ??spiffs_page_consistency_check_i_48
        MOVS     R0,R5
        B.N      ??spiffs_page_consistency_check_i_15
??spiffs_page_consistency_check_i_48:
        MOVS     R6,#+1
        B.N      ??spiffs_page_consistency_check_i_21
??spiffs_page_consistency_check_i_38:
        MOVS     R0,#+8
        LDR      R1,[SP, #+24]
        UDIV     R0,R0,R1
        UXTH     R10,R10          ;; ZeroExt  R10,R10,#+16,#+16
        LDRH     R1,[SP, #+16]
        SUBS     R1,R10,R1
        UDIV     R9,R1,R0
        MOVS     R0,#+8
        LDR      R1,[SP, #+24]
        UDIV     R0,R0,R1
        SUBS     R0,R0,#+1
        ANDS     R0,R0,R10
        LDR      R1,[SP, #+24]
        MUL      R10,R1,R0
        LDR      R0,[R4, #+40]
        LDRB     R0,[R9, R0]
        MOVS     R1,#+1
        ADDS     R2,R10,#+1
        LSLS     R1,R1,R2
        TST      R0,R1
        BEQ.W    ??spiffs_page_consistency_check_i_20
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_page_consistency_check_i_49
        MOVS     R3,#+0
        LDRH     R2,[SP, #+28]
        MOVS     R1,#+6
        MOVS     R0,#+2
        LDR      R5,[R4, #+92]
        BLX      R5
??spiffs_page_consistency_check_i_49:
        LDRH     R1,[SP, #+28]
        MOVS     R0,R4
        BL       spiffs_delete_obj_lazy
        MOVS     R5,R0
        CMP      R5,#+0
        BPL.N    ??spiffs_page_consistency_check_i_50
        MOVS     R0,R5
        B.N      ??spiffs_page_consistency_check_i_15
??spiffs_page_consistency_check_i_50:
        MOVS     R1,R7
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_page_delete
        MOVS     R5,R0
        CMP      R5,#+0
        BPL.W    ??spiffs_page_consistency_check_i_19
        MOVS     R0,R5
        B.N      ??spiffs_page_consistency_check_i_15
??spiffs_page_consistency_check_i_5:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.W    ??spiffs_page_consistency_check_i_1
        MOVS     R7,#+0
        B.N      ??spiffs_page_consistency_check_i_51
??spiffs_page_consistency_check_i_52:
        ADDS     R7,R7,#+1
??spiffs_page_consistency_check_i_51:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.W    ??spiffs_page_consistency_check_i_1
        CMP      R7,#+128
        BCS.W    ??spiffs_page_consistency_check_i_1
        MOVS     R8,#+0
        B.N      ??spiffs_page_consistency_check_i_53
??spiffs_page_consistency_check_i_54:
??spiffs_page_consistency_check_i_55:
??spiffs_page_consistency_check_i_56:
        ADDS     R8,R8,#+1
??spiffs_page_consistency_check_i_53:
        UXTB     R6,R6            ;; ZeroExt  R6,R6,#+24,#+24
        CMP      R6,#+0
        BNE.N    ??spiffs_page_consistency_check_i_52
        MOVS     R0,#+8
        LDR      R1,[SP, #+24]
        UDIV     R0,R0,R1
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        CMP      R8,R0
        BCS.N    ??spiffs_page_consistency_check_i_52
        LDR      R0,[R4, #+40]
        LDRB     R0,[R7, R0]
        LDR      R1,[SP, #+24]
        MUL      R1,R1,R8
        MOVS     R2,R0
        ASRS     R2,R2,R1
        ANDS     R0,R2,#0x7
        LDRH     R1,[SP, #+16]
        MOVS     R2,#+8
        LDR      R3,[SP, #+24]
        UDIV     R2,R2,R3
        MLA      R1,R2,R7,R1
        UXTB     R8,R8            ;; ZeroExt  R8,R8,#+24,#+24
        ADDS     R9,R8,R1
        UXTB     R0,R0            ;; ZeroExt  R0,R0,#+24,#+24
        CMP      R0,#+1
        BNE.N    ??spiffs_page_consistency_check_i_55
        MOVS     R10,#+0
        MOVS     R11,#+0
        ADD      R0,SP,#+36
        STR      R0,[SP, #+4]
        MOVS     R0,#+5
        STR      R0,[SP, #+0]
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        MOVS     R0,#+128
        MUL      R3,R0,R9
        MOVS     R2,#+0
        MOVS     R1,#+21
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOVS     R5,R0
        CMP      R5,#+0
        BPL.N    ??spiffs_page_consistency_check_i_57
        MOVS     R0,R5
        B.N      ??spiffs_page_consistency_check_i_15
??spiffs_page_consistency_check_i_57:
        ADD      R0,SP,#+12
        STR      R0,[SP, #+0]
        ADD      R3,SP,#+8
        LDRH     R2,[SP, #+38]
        LDRH     R1,[SP, #+36]
        MOVS     R0,R4
        BL       spiffs_object_get_data_page_index_reference
        MOVS     R5,R0
        CMP      R5,#+0
        BNE.N    ??spiffs_page_consistency_check_i_58
        LDRH     R0,[SP, #+8]
        MOVW     R1,#+65535
        CMP      R0,R1
        BEQ.N    ??spiffs_page_consistency_check_i_59
        LDRH     R0,[SP, #+8]
        CMP      R0,#+1024
        BGT.N    ??spiffs_page_consistency_check_i_59
        LDRH     R0,[SP, #+8]
        MOVS     R1,#+32
        SDIV     R2,R0,R1
        MLS      R2,R2,R1,R0
        CMP      R2,#+0
        BNE.N    ??spiffs_page_consistency_check_i_60
??spiffs_page_consistency_check_i_59:
        MOVS     R10,#+1
        B.N      ??spiffs_page_consistency_check_i_61
??spiffs_page_consistency_check_i_60:
        ADD      R0,SP,#+64
        STR      R0,[SP, #+4]
        MOVS     R0,#+5
        STR      R0,[SP, #+0]
        LDRH     R0,[SP, #+8]
        MOVS     R1,#+128
        MUL      R3,R1,R0
        MOVS     R2,#+0
        MOVS     R1,#+21
        MOVS     R0,R4
        BL       spiffs_phys_rd
        MOVS     R5,R0
        CMP      R5,#+0
        BPL.N    ??spiffs_page_consistency_check_i_62
        MOVS     R0,R5
        B.N      ??spiffs_page_consistency_check_i_15
??spiffs_page_consistency_check_i_62:
        LDRH     R0,[SP, #+36]
        BICS     R0,R0,#0x8000
        LDRH     R1,[SP, #+64]
        CMP      R0,R1
        BNE.N    ??spiffs_page_consistency_check_i_63
        LDRB     R0,[SP, #+68]
        ANDS     R0,R0,#0x87
        CMP      R0,#+132
        BNE.N    ??spiffs_page_consistency_check_i_63
        MOVS     R11,#+1
        B.N      ??spiffs_page_consistency_check_i_61
??spiffs_page_consistency_check_i_63:
        LDRH     R0,[SP, #+8]
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        CMP      R0,R9
        BEQ.N    ??spiffs_page_consistency_check_i_61
        MOVS     R10,#+1
        B.N      ??spiffs_page_consistency_check_i_61
??spiffs_page_consistency_check_i_58:
        LDR.W    R0,??DataTable7_4  ;; 0xffffd8ee
        CMP      R5,R0
        BNE.N    ??spiffs_page_consistency_check_i_61
        MOVS     R11,#+1
        MOVS     R5,#+0
??spiffs_page_consistency_check_i_61:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+0
        BEQ.N    ??spiffs_page_consistency_check_i_64
        LDRH     R0,[SP, #+12]
        STR      R0,[SP, #+0]
        MOV      R3,R9
        UXTH     R3,R3            ;; ZeroExt  R3,R3,#+16,#+16
        LDRH     R2,[SP, #+38]
        LDRH     R1,[SP, #+36]
        MOVS     R0,R4
        BL       spiffs_rewrite_index
        MOVS     R5,R0
        LDR.N    R0,??DataTable7_5  ;; 0xffffd8bb
        SUBS     R0,R5,R0
        CMP      R0,#+3
        BCS.N    ??spiffs_page_consistency_check_i_65
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_page_consistency_check_i_66
        MOVS     R3,#+0
        LDRH     R2,[SP, #+36]
        MOVS     R1,#+6
        MOVS     R0,#+2
        LDR      R5,[R4, #+92]
        BLX      R5
??spiffs_page_consistency_check_i_66:
        MOV      R1,R9
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_page_delete
        MOVS     R5,R0
        CMP      R5,#+0
        BPL.N    ??spiffs_page_consistency_check_i_67
        MOVS     R0,R5
        B.N      ??spiffs_page_consistency_check_i_15
??spiffs_page_consistency_check_i_67:
        LDRH     R1,[SP, #+36]
        MOVS     R0,R4
        BL       spiffs_delete_obj_lazy
        MOVS     R5,R0
        B.N      ??spiffs_page_consistency_check_i_68
??spiffs_page_consistency_check_i_65:
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_page_consistency_check_i_69
        LDRH     R3,[SP, #+38]
        LDRH     R2,[SP, #+36]
        MOVS     R1,#+2
        MOVS     R0,#+2
        LDR      R6,[R4, #+92]
        BLX      R6
??spiffs_page_consistency_check_i_69:
??spiffs_page_consistency_check_i_68:
        CMP      R5,#+0
        BPL.N    ??spiffs_page_consistency_check_i_70
        MOVS     R0,R5
        B.N      ??spiffs_page_consistency_check_i_15
??spiffs_page_consistency_check_i_70:
        MOVS     R6,#+1
        B.N      ??spiffs_page_consistency_check_i_56
??spiffs_page_consistency_check_i_64:
        UXTB     R11,R11          ;; ZeroExt  R11,R11,#+24,#+24
        CMP      R11,#+0
        BEQ.N    ??spiffs_page_consistency_check_i_71
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_page_consistency_check_i_72
        MOVS     R3,#+0
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        MOV      R2,R9
        MOVS     R1,#+5
        MOVS     R0,#+2
        LDR      R5,[R4, #+92]
        BLX      R5
??spiffs_page_consistency_check_i_72:
        MOV      R1,R9
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOVS     R0,R4
        BL       spiffs_page_delete
        MOVS     R5,R0
??spiffs_page_consistency_check_i_71:
        CMP      R5,#+0
        BPL.W    ??spiffs_page_consistency_check_i_54
        MOVS     R0,R5
        B.N      ??spiffs_page_consistency_check_i_15
??spiffs_page_consistency_check_i_2:
        MOVS     R0,R5
??spiffs_page_consistency_check_i_15:
        ADD      SP,SP,#+76
        POP      {R4-R11,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_page_consistency_check:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_page_consistency_check_0
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+2
        LDR      R5,[R4, #+92]
        BLX      R5
??spiffs_page_consistency_check_0:
        MOVS     R0,R4
        BL       spiffs_page_consistency_check_i
        MOVS     R5,R0
        CMP      R5,#+0
        BEQ.N    ??spiffs_page_consistency_check_1
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_page_consistency_check_2
        MOVS     R3,#+0
        MOVS     R2,R5
        MOVS     R1,#+1
        MOVS     R0,#+2
        LDR      R6,[R4, #+92]
        BLX      R6
??spiffs_page_consistency_check_2:
??spiffs_page_consistency_check_1:
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_page_consistency_check_3
        MOVS     R3,#+0
        MOV      R2,#+256
        MOVS     R1,#+0
        MOVS     R0,#+2
        LDR      R4,[R4, #+92]
        BLX      R4
??spiffs_page_consistency_check_3:
        MOVS     R0,R5
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_object_index_search:
        LDR      R2,[R0, #+40]
        LSLS     R1,R1,#+17       ;; ZeroExtS R1,R1,#+17,#+17
        LSRS     R1,R1,#+17
        MOVS     R0,#+0
        B.N      ??spiffs_object_index_search_0
??spiffs_object_index_search_1:
        ADDS     R0,R0,#+1
??spiffs_object_index_search_0:
        CMP      R0,#+64
        BCS.N    ??spiffs_object_index_search_2
        LDRH     R3,[R2, R0, LSL #+1]
        BICS     R3,R3,#0x8000
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        CMP      R3,R1
        BNE.N    ??spiffs_object_index_search_1
        B.N      ??spiffs_object_index_search_3
??spiffs_object_index_search_2:
        MOVS     R0,#-1
??spiffs_object_index_search_3:
        BX       LR               ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_object_index_consistency_check_v:
        PUSH     {R0-R10,LR}
        MOV      R8,R0
        MOVS     R4,R1
        MOV      R9,R2
        MOV      R10,R3
        LDR.N    R5,??DataTable7_1  ;; 0xffffd8aa
        MOVS     R0,#+0
        LDR      R6,[SP, #+52]
        LDR      R7,[R8, #+40]
        LDR      R0,[R8, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_object_index_consistency_check_v_0
        MOVS     R3,#+0
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        MOV      R0,#+256
        MUL      R0,R0,R9
        LDR      R1,[R8, #+16]
        UDIV     R2,R0,R1
        MOVS     R1,#+0
        MOVS     R0,#+1
        LDR      R12,[R8, #+92]
        BLX      R12
??spiffs_object_index_consistency_check_v_0:
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVW     R0,#+65535
        CMP      R4,R0
        BEQ.W    ??spiffs_object_index_consistency_check_v_1
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        CMP      R4,#+0
        BEQ.W    ??spiffs_object_index_consistency_check_v_1
        LSLS     R0,R4,#+16
        BPL.W    ??spiffs_object_index_consistency_check_v_1
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        ADDS     R0,R10,R9, LSL #+5
        ADDS     R9,R0,#+1
        ADD      R0,SP,#+8
        STR      R0,[SP, #+4]
        MOVS     R0,#+5
        STR      R0,[SP, #+0]
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        MOVS     R0,#+128
        MUL      R3,R0,R9
        MOVS     R2,#+0
        MOVS     R1,#+21
        MOV      R0,R8
        BL       spiffs_phys_rd
        CMP      R0,#+0
        BMI.W    ??spiffs_object_index_consistency_check_v_2
??spiffs_object_index_consistency_check_v_3:
        LDRH     R0,[SP, #+10]
        CMP      R0,#+0
        BNE.N    ??spiffs_object_index_consistency_check_v_4
        LDRB     R0,[SP, #+12]
        ANDS     R0,R0,#0xC6
        CMP      R0,#+128
        BNE.N    ??spiffs_object_index_consistency_check_v_4
        LDR      R0,[R8, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_object_index_consistency_check_v_5
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R3,R4
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        MOV      R2,R9
        MOVS     R1,#+5
        MOVS     R0,#+1
        LDR      R4,[R8, #+92]
        BLX      R4
??spiffs_object_index_consistency_check_v_5:
        MOV      R1,R9
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOV      R0,R8
        BL       spiffs_page_delete
        CMP      R0,#+0
        BMI.N    ??spiffs_object_index_consistency_check_v_2
??spiffs_object_index_consistency_check_v_6:
        MOVS     R0,R5
        B.N      ??spiffs_object_index_consistency_check_v_2
??spiffs_object_index_consistency_check_v_4:
        LDRB     R0,[SP, #+12]
        ANDS     R0,R0,#0xC6
        CMP      R0,#+192
        BNE.N    ??spiffs_object_index_consistency_check_v_7
        MOVS     R0,R5
        B.N      ??spiffs_object_index_consistency_check_v_2
??spiffs_object_index_consistency_check_v_7:
        LDRH     R0,[SP, #+10]
        CMP      R0,#+0
        BNE.N    ??spiffs_object_index_consistency_check_v_8
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOV      R0,R8
        BL       spiffs_object_index_search
        CMN      R0,#+1
        BNE.N    ??spiffs_object_index_consistency_check_v_1
        LSLS     R0,R4,#+17       ;; ZeroExtS R0,R4,#+17,#+17
        LSRS     R0,R0,#+17
        LDR      R1,[R6, #+0]
        STRH     R0,[R7, R1, LSL #+1]
        LDR      R0,[R6, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[R6, #+0]
        LDR      R0,[R6, #+0]
        CMP      R0,#+64
        BCC.N    ??spiffs_object_index_consistency_check_v_1
        MOVS     R0,#+0
        STR      R0,[R6, #+0]
        B.N      ??spiffs_object_index_consistency_check_v_1
??spiffs_object_index_consistency_check_v_8:
        MOVS     R1,R4
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOV      R0,R8
        BL       spiffs_object_index_search
        MOVS     R10,#+0
        CMN      R0,#+1
        BNE.N    ??spiffs_object_index_consistency_check_v_9
        ADD      R0,SP,#+4
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        ORRS     R1,R4,#0x8000
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOV      R0,R8
        BL       spiffs_obj_lu_find_id_and_span
        LDR.N    R5,??DataTable7  ;; 0xffffd8a9
        CMP      R0,#+0
        BNE.N    ??spiffs_object_index_consistency_check_v_10
        LSLS     R0,R4,#+17       ;; ZeroExtS R0,R4,#+17,#+17
        LSRS     R0,R0,#+17
        LDR      R1,[R6, #+0]
        STRH     R0,[R7, R1, LSL #+1]
        B.N      ??spiffs_object_index_consistency_check_v_11
??spiffs_object_index_consistency_check_v_10:
        LDR.N    R1,??DataTable7_4  ;; 0xffffd8ee
        CMP      R0,R1
        BNE.N    ??spiffs_object_index_consistency_check_v_12
        MOVS     R10,#+1
        ORRS     R0,R4,#0x8000
        LDR      R1,[R6, #+0]
        STRH     R0,[R7, R1, LSL #+1]
        B.N      ??spiffs_object_index_consistency_check_v_11
??spiffs_object_index_consistency_check_v_12:
        CMP      R0,#+0
        BMI.N    ??spiffs_object_index_consistency_check_v_2
??spiffs_object_index_consistency_check_v_13:
??spiffs_object_index_consistency_check_v_11:
        LDR      R0,[R6, #+0]
        ADDS     R0,R0,#+1
        STR      R0,[R6, #+0]
        LDR      R0,[R6, #+0]
        CMP      R0,#+64
        BCC.N    ??spiffs_object_index_consistency_check_v_14
        MOVS     R0,#+0
        STR      R0,[R6, #+0]
        B.N      ??spiffs_object_index_consistency_check_v_14
??spiffs_object_index_consistency_check_v_9:
        LDRH     R0,[R7, R0, LSL #+1]
        LSLS     R0,R0,#+16
        BPL.N    ??spiffs_object_index_consistency_check_v_14
        MOVS     R10,#+1
??spiffs_object_index_consistency_check_v_14:
        UXTB     R10,R10          ;; ZeroExt  R10,R10,#+24,#+24
        CMP      R10,#+0
        BEQ.N    ??spiffs_object_index_consistency_check_v_1
        LDR      R0,[R8, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_object_index_consistency_check_v_15
        UXTH     R4,R4            ;; ZeroExt  R4,R4,#+16,#+16
        MOVS     R3,R4
        UXTH     R9,R9            ;; ZeroExt  R9,R9,#+16,#+16
        MOV      R2,R9
        MOVS     R1,#+4
        MOVS     R0,#+1
        LDR      R4,[R8, #+92]
        BLX      R4
??spiffs_object_index_consistency_check_v_15:
        MOV      R1,R9
        UXTH     R1,R1            ;; ZeroExt  R1,R1,#+16,#+16
        MOV      R0,R8
        BL       spiffs_page_delete
        CMP      R0,#+0
        BMI.N    ??spiffs_object_index_consistency_check_v_2
??spiffs_object_index_consistency_check_v_16:
??spiffs_object_index_consistency_check_v_1:
        MOVS     R0,R5
??spiffs_object_index_consistency_check_v_2:
        ADD      SP,SP,#+16
        POP      {R4-R10,PC}      ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
spiffs_object_index_consistency_check:
        PUSH     {R4-R6,LR}
        SUB      SP,SP,#+32
        MOVS     R4,R0
        MOVS     R5,#+0
        MOVS     R1,#+128
        MOVS     R2,#+0
        LDR      R5,[R4, #+40]
        MOVS     R0,R5
        BL       __aeabi_memset
        MOVS     R0,#+0
        STR      R0,[SP, #+24]
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_object_index_consistency_check_0
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,#+1
        LDR      R5,[R4, #+92]
        BLX      R5
??spiffs_object_index_consistency_check_0:
        MOVS     R0,#+0
        STR      R0,[SP, #+20]
        MOVS     R0,#+0
        STR      R0,[SP, #+16]
        ADD      R0,SP,#+24
        STR      R0,[SP, #+12]
        MOVS     R0,#+0
        STR      R0,[SP, #+8]
        LDR.N    R0,??DataTable7_6
        STR      R0,[SP, #+4]
        MOVS     R0,#+0
        STR      R0,[SP, #+0]
        MOVS     R3,#+0
        MOVS     R2,#+0
        MOVS     R1,#+0
        MOVS     R0,R4
        BL       spiffs_obj_lu_find_entry_visitor
        MOVS     R5,R0
        LDR.N    R0,??DataTable7_3  ;; 0xffffd8a8
        CMP      R5,R0
        BNE.N    ??spiffs_object_index_consistency_check_1
        MOVS     R5,#+0
??spiffs_object_index_consistency_check_1:
        CMP      R5,#+0
        BEQ.N    ??spiffs_object_index_consistency_check_2
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_object_index_consistency_check_3
        MOVS     R3,#+0
        MOVS     R2,R5
        MOVS     R1,#+1
        MOVS     R0,#+1
        LDR      R6,[R4, #+92]
        BLX      R6
??spiffs_object_index_consistency_check_3:
??spiffs_object_index_consistency_check_2:
        LDR      R0,[R4, #+92]
        CMP      R0,#+0
        BEQ.N    ??spiffs_object_index_consistency_check_4
        MOVS     R3,#+0
        MOV      R2,#+256
        MOVS     R1,#+0
        MOVS     R0,#+1
        LDR      R4,[R4, #+92]
        BLX      R4
??spiffs_object_index_consistency_check_4:
        MOVS     R0,R5
        ADD      SP,SP,#+32
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7:
        DC32     0xffffd8a9

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_1:
        DC32     0xffffd8aa

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_2:
        DC32     spiffs_lookup_check_v

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_3:
        DC32     0xffffd8a8

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_4:
        DC32     0xffffd8ee

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_5:
        DC32     0xffffd8bb

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable7_6:
        DC32     spiffs_object_index_consistency_check_v

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
// 5 334 bytes in section .text
// 
// 5 334 bytes of CODE memory
//
//Errors: none
//Warnings: none
