#ifndef __AVR_ATmega328P__
#define __AVR_ATmega328P__
#endif

#ifndef F_CPU
#define F_CPU 1000000UL // or whatever may be your frequency
#endif

 
#include <avr/io.h>
#include <util/delay.h>                // for _delay_ms()
 
int main(void)
{
//    DDRC = 0x01;                       // initialize port CDDRB |= (1 << PB0);
    DDRC |= (1 << PC0);
    while(1)
    {
        // LED on
        PORTC = 0b00000001;            // PC0 = High = Vcc
        _delay_ms(500);                // wait 500 milliseconds
 
        //LED off
        PORTC = 0b00000000;            // PC0 = Low = 0v
        _delay_ms(500);                // wait 500 milliseconds
    }
}
