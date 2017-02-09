#include <stdio.h>
#include <stdbool.h>
#include <stdint.h>
#include <unistd.h>
#include "io.h"
#include "altera_avalon_pio_regs.h"
#include "system.h"

#define SLEEP_DELAY_US (100 * 1000)

void setup_leds() {
    // Switch on first LED only
    IOWR_ALTERA_AVALON_PIO_DATA(NIOS_LEDS_BASE, 0x1);
}

void handle_leds() {
    uint32_t leds_mask = IORD_ALTERA_AVALON_PIO_DATA(NIOS_LEDS_BASE);

    if (leds_mask != (0x01 << (NIOS_LEDS_DATA_WIDTH - 1))) {
        // rotate leds
        leds_mask <<= 1;
    } else {
        // reset leds
        leds_mask = 0x1;
    }

    IOWR_ALTERA_AVALON_PIO_DATA(NIOS_LEDS_BASE, leds_mask);
}

int main() {
    printf("DE1-SoC nios demo\n");

    setup_leds();

    while (true) {
        handle_leds();
        usleep(SLEEP_DELAY_US);
    }

    return 0;
}
