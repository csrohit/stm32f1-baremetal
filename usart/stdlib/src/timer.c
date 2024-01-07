#include<timer.h>



volatile uint32_t msTicks = 0;

inline void SysTick_Handler(void)
{
	msTicks++;
}

void delay(uint32_t ms)
{
	uint32_t expected_ticks = msTicks + ms;
	while (msTicks < expected_ticks)
	{
		__asm("nop");
	}
}
