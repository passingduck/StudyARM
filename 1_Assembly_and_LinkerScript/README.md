##usage

#Build step
1. $ arm-none-eabi-as -march=armv7e-m -mcpu=cortex-m7 -mthumb -o Example.o ./Example.S
2. $ arm-none-eabi-ld -T linkscript.ld -o Example.elf Example.o
3. $ arm-none-eabi-objcopy -O binary Example.elf Example.bin

#Flash step
1. $ st-flash write ./Example.bin 0x08000000

#Debug step
1. $ st-util
2. $ arm-none-eabi-gdb (on another tab)
    2-1. (gdb) target remote localhost:4242
    2-2. (gdb) break *0x8000010
    2-3. (gdb) continue
    ---- repeat ----
    2-4. (gdb) print info
    2-5. (gdb) stepi
    ----------------

#Extra
How to check VTOR (Vector Table Offset Register)
1. (gdb) x/x 0xE000ED08
In my case(STM32F746ZG) : 0x200000
