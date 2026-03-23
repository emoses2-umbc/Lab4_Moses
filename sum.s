.section .text
        .globl   array_sum
        .type    array_sum, @function

array_sum:
        pushl   %ebp
        movl    %esp, %ebp

        pushl   %esi
        pushl   %ebx

        movl    8(%ebp), %esi
        movl    12(%ebp), %ecx

        xorl    %eax, %eax
        xorl    %ebx, %ebx

        testl   %ecx, %ecx
        jle     .done

.loop:
        cmpl    %ecx, %ebx
        jge     .done

        movl    (%esi, %ebx, 4), %edx

        addl    %edx, %eax

        incl    %ebx

        jmp     .loop

.done:
        popl    %ebx
        popl    %esi

        popl    %ebp
        ret

        .size   array_sum, .-array_sum
