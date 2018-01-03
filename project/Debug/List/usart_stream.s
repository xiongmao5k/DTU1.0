///////////////////////////////////////////////////////////////////////////////
//
// IAR ANSI C/C++ Compiler V7.40.3.8902/W32 for ARM       29/Dec/2017  09:11:30
// Copyright 1999-2015 IAR Systems AB.
//
//    Cpu mode     =  thumb
//    Endian       =  little
//    Source file  =  D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\usart_stream.c
//    Command line =  
//        D:\Ruhr\Xiongmao\github\DTU1.0\gprsdtu\usart_stream.c -D STM32F10X_MD
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
//        D:\Ruhr\Xiongmao\github\DTU1.0\project\Debug\List\usart_stream.s
//
///////////////////////////////////////////////////////////////////////////////

        #define SHT_PROGBITS 0x1

        EXTERN fifo_init
        EXTERN fifo_pop
        EXTERN fifo_pop_byte
        EXTERN fifo_push_byte
        EXTERN usart_init
        EXTERN usart_write

        PUBLIC USART_STREAM1_input_handler
        PUBLIC USART_STREAM2_input_handler
        PUBLIC usart_stream_byte
        PUBLIC usart_stream_init
        PUBLIC usart_stream_read
        PUBLIC usart_stream_write


        SECTION `.text`:CODE:NOROOT(1)
        THUMB
USART_STREAM1_input_handler:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable4
        BL       fifo_push_byte
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
// __interwork __softfp void USART_STREAM2_input_handler(uint8_t)
USART_STREAM2_input_handler:
        PUSH     {R4,LR}
        MOVS     R4,R0
        MOVS     R1,R4
        UXTB     R1,R1            ;; ZeroExt  R1,R1,#+24,#+24
        LDR.N    R0,??DataTable4_1
        BL       fifo_push_byte
        POP      {R4,PC}          ;; return

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// static __absolute struct fifo USART_STREAM1_fifo
USART_STREAM1_fifo:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// static __absolute uint8_t USART_STREAM1_data_buffer[64]
USART_STREAM1_data_buffer:
        DS8 64

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// static __absolute struct fifo USART_STREAM2_fifo
USART_STREAM2_fifo:
        DS8 16

        SECTION `.bss`:DATA:REORDER:NOROOT(2)
// static __absolute uint8_t USART_STREAM2_data_buffer[64]
USART_STREAM2_data_buffer:
        DS8 64

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
usart_stream_init:
        PUSH     {R4,LR}
        MOVS     R4,R0
        CMP      R4,#+0
        BEQ.N    ??usart_stream_init_0
        CMP      R4,#+1
        BEQ.N    ??usart_stream_init_1
        B.N      ??usart_stream_init_2
??usart_stream_init_0:
        MOVS     R2,#+64
        LDR.N    R1,??DataTable4_2
        LDR.N    R0,??DataTable4
        BL       fifo_init
        LDR.N    R1,??DataTable4_3
        MOVS     R0,#+1
        BL       usart_init
        B.N      ??usart_stream_init_3
??usart_stream_init_1:
        MOVS     R2,#+64
        LDR.N    R1,??DataTable4_4
        LDR.N    R0,??DataTable4_1
        BL       fifo_init
        LDR.N    R1,??DataTable4_5
        MOVS     R0,#+2
        BL       usart_init
        B.N      ??usart_stream_init_3
??usart_stream_init_2:
??usart_stream_init_3:
        POP      {R4,PC}          ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
usart_stream_write:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        CMP      R4,#+0
        BEQ.N    ??usart_stream_write_0
        CMP      R4,#+1
        BEQ.N    ??usart_stream_write_1
        B.N      ??usart_stream_write_2
??usart_stream_write_0:
        MOVS     R2,R6
        MOVS     R1,R5
        MOVS     R0,#+1
        BL       usart_write
        B.N      ??usart_stream_write_3
??usart_stream_write_1:
        MOVS     R2,R6
        MOVS     R1,R5
        MOVS     R0,#+2
        BL       usart_write
        B.N      ??usart_stream_write_3
??usart_stream_write_2:
        MOVS     R0,#+0
??usart_stream_write_3:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
usart_stream_read:
        PUSH     {R3-R7,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        MOVS     R6,R2
        CMP      R4,#+0
        BEQ.N    ??usart_stream_read_0
        CMP      R4,#+1
        BEQ.N    ??usart_stream_read_1
        B.N      ??usart_stream_read_2
??usart_stream_read_0:
        CPSID    I
        MOVS     R2,R6
        MOVS     R1,R5
        LDR.N    R0,??DataTable4
        BL       fifo_pop
        MOVS     R7,R0
        CPSIE    I
        MOVS     R0,R7
        B.N      ??usart_stream_read_3
??usart_stream_read_1:
        CPSID    I
        MOVS     R2,R6
        MOVS     R1,R5
        LDR.N    R0,??DataTable4_1
        BL       fifo_pop
        MOVS     R7,R0
        CPSIE    I
        MOVS     R0,R7
        B.N      ??usart_stream_read_3
??usart_stream_read_2:
        MOVS     R0,#+0
??usart_stream_read_3:
        POP      {R1,R4-R7,PC}    ;; return

        SECTION `.text`:CODE:NOROOT(1)
        THUMB
usart_stream_byte:
        PUSH     {R4-R6,LR}
        MOVS     R4,R0
        MOVS     R5,R1
        CMP      R4,#+0
        BEQ.N    ??usart_stream_byte_0
        CMP      R4,#+1
        BEQ.N    ??usart_stream_byte_1
        B.N      ??usart_stream_byte_2
??usart_stream_byte_0:
        CPSID    I
        MOVS     R1,R5
        LDR.N    R0,??DataTable4
        BL       fifo_pop_byte
        MOVS     R6,R0
        CPSIE    I
        MOVS     R0,R6
        B.N      ??usart_stream_byte_3
??usart_stream_byte_1:
        CPSID    I
        MOVS     R1,R5
        LDR.N    R0,??DataTable4_1
        BL       fifo_pop_byte
        MOVS     R6,R0
        CPSIE    I
        MOVS     R0,R6
        B.N      ??usart_stream_byte_3
??usart_stream_byte_2:
        MOVS     R0,#+0
??usart_stream_byte_3:
        POP      {R4-R6,PC}       ;; return

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4:
        DC32     USART_STREAM1_fifo

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_1:
        DC32     USART_STREAM2_fifo

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_2:
        DC32     USART_STREAM1_data_buffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_3:
        DC32     USART_STREAM1_input_handler

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_4:
        DC32     USART_STREAM2_data_buffer

        SECTION `.text`:CODE:NOROOT(2)
        SECTION_TYPE SHT_PROGBITS, 0
        DATA
??DataTable4_5:
        DC32     USART_STREAM2_input_handler

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
// 160 bytes in section .bss
// 276 bytes in section .text
// 
// 276 bytes of CODE memory
// 160 bytes of DATA memory
//
//Errors: none
//Warnings: none
