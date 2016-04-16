#include <stdio.h>
#include <stdint.h>
#include <unistd.h>
#include "io.h"
#include "altera_avalon_pio_regs.h"
#include "system.h"

#define LEDS_MAX_ITERATION (1000)
#define SLEEP_DELAY_US (100 * 1000)

void rotate_leds() {
    int loop_count = 0;
    int leds_mask = 0x01;

    // 0/1 = left/right direction
    int led_direction = 0;

    while (loop_count < LEDS_MAX_ITERATION) {
        uint32_t switches_value = IORD_ALTERA_AVALON_PIO_DATA(SWITCHES_0_BASE);
        uint32_t leds_value = ~leds_mask;

        // only turn on leds which have their corresponding switch enabled
        IOWR_ALTERA_AVALON_PIO_DATA(LEDS_0_BASE, leds_value & switches_value);

        usleep(SLEEP_DELAY_US);

        if (led_direction == 0) {
            leds_mask <<= 1;
            if (leds_mask == (0x01 << (LEDS_0_DATA_WIDTH - 1))) {
                led_direction = 1;
            }
        } else {
            leds_mask >>= 1;
            if (leds_mask == 0x01) {
                led_direction = 0;
                loop_count++;
            }
        }
    }
}

int main() {
    rotate_leds();
    return 0;
}
