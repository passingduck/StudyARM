.syntax unified
.cpu cortex-m7
.thumb

.section .vector_table,"a",%progbits
.align 8
vector_table:
    .word 0x20000200    @ 스택 포인터 초기값 (0x200 byte 배정)
    .word reset_handler @ 리셋 핸들러
    .word default_handler
    .word default_handler

.section .text
.thumb_func
.global reset_handler
reset_handler:
    // 여기서부터 실제 코드 시작
    movs r0, #1      @ r0 = 1
    movs r1, #2      @ r1 = 2
    movs r2, #3      @ r2 = 3
    movs r3, #4      @ r3 = 4
    // 덧셈 수행
    adds r4, r0, r1  @ r4 = r0 + r1 (1 + 2 = 3)
    adds r5, r2, r3  @ r5 = r2 + r3 (3 + 4 = 7)
    // 곱셈 수행
    mul r6, r0, r1  @ r6 = r0 * r1 (1 * 2 = 2)
    mul r7, r2, r3  @ r7 = r2 * r3 (3 * 4 = 12)
    // 무한 루프
    b .              @ 무한 루프
.thumb_func
default_handler:
    b .
.end
