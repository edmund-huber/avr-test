#include <avr/io.h>
#define F_CPU 2000000UL
#include <util/delay.h>

void main(void) {
    PORTD.DIRSET = (1 << 4);
    while (1) {
        PORTD.OUTTGL = (1 << 4);
        _delay_ms(100);
    }
}
