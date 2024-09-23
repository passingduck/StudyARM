# Usage

## Build step
1. $ arm-none-eabi-as -march=armv7e-m -mcpu=cortex-m7 -mthumb -o Example.o ./Example.S
2. $ arm-none-eabi-ld -T linkscript.ld -o Example.elf Example.o
3. $ arm-none-eabi-objcopy -O binary Example.elf Example.bin

## Flash step
1. $ st-flash write ./Example.bin 0x08000000

## Debug step
1. $ st-util
2. $ arm-none-eabi-gdb (on another tab)
    - (gdb) target remote localhost:4242
    - (gdb) break *0x8000010
    - (gdb) monitor reset halt
    - (gdb) continue
        #### ---- repeat ----
    - (gdb) print info
    - (gdb) stepi
        #### ----------------

## Extra
How to check VTOR (Vector Table Offset Register)
1. (gdb) x/x 0xE000ED08
In my case(STM32F746ZG) : 0x200000

## Question
1. 왜 VTOR 이 0x200000인데 제공되는 linker script들은 다 200000번지를 사용하지 않을까? 이 영역대를 사용하면 더 효율적일까 아니면 이미 aliasing 기능으로 200000번지가 사용되고 있는걸까...
