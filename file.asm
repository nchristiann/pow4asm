extern printf
extern scanf

section .data
    fmt_int db "%d", 0
    fmt_int_newline db "%d", 10, 0
    fmt_int_space db "%d ", 0
    newline db 10, 0
    N dd 2

section .bss
    n resd 1
    arr resd 10

section .text
global main



pow4:
    push ebp
    mov ebp, esp

    mov ebx, [ebp + 8]
    mov ebx, [ebx]
    mov eax, 1
    xor ecx, ecx
    mov edx, 4

    loop:
    cmp ecx, ebx
    je buh_bye

    mov edx, 4
    mul edx
    inc ecx
    jmp loop

    buh_bye:
    mov [N], eax
    leave
    ret



main:
    push ebp
    mov ebp, esp


    lea eax, [N]
    push eax
    call pow4

    mov eax, [N]
    push eax
    push fmt_int
    call printf


    ; Return 0.
    xor eax, eax
    leave
    ret
