#include <delay.h>

void ms_delay(int ms)
{
    while (ms-- > 0)
    {
        volatile int x = 1000;
        while (x-- > 0)
            __asm("nop");
    }
}

void unused_delay(int ms)
{
    while (ms-- > 0)
    {
        volatile int x = 10;
        while (x-- > 0)
            __asm("nop");
    }
}