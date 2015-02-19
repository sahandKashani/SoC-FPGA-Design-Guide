#include <assert.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>

#include "alt_clock_manager.h"
#include "alt_generalpurpose_io.h"
#include "alt_globaltmr.h"
#include "hps_baremetal.h"
#include "hwlib.h"
#include "socal/alt_gpio.h"
#include "socal/hps.h"
#include "socal/socal.h"
#include "../hps_soc_system.h"

// State variables
bool hex_increment = true;

void setup_peripherals() {
    setup_hps_timer();
    setup_hps_gpio();
    setup_hex_displays();
}

void setup_hps_timer() {
    assert(ALT_E_SUCCESS == alt_globaltmr_init());
}

void setup_hps_gpio() {
    uint32_t hps_gpio_config_len = 2;
    ALT_GPIO_CONFIG_RECORD_t hps_gpio_config[] = {
        {HPS_LED_IDX, ALT_GPIO_PIN_OUTPUT, ALT_GPIO_PIN_LEVEL_TRIG_INT, ALT_GPIO_PIN_ACTIVE_HIGH, ALT_GPIO_PIN_DEBOUNCE, ALT_GPIO_PIN_DATAZERO},
        {HPS_KEY_IDX, ALT_GPIO_PIN_INPUT , ALT_GPIO_PIN_LEVEL_TRIG_INT, ALT_GPIO_PIN_ACTIVE_HIGH, ALT_GPIO_PIN_DEBOUNCE, ALT_GPIO_PIN_DATAZERO}
    };

    assert(ALT_E_SUCCESS == alt_gpio_init());
    assert(ALT_E_SUCCESS == alt_gpio_group_config(hps_gpio_config, hps_gpio_config_len));
}

void setup_hex_displays() {
    set_hex_displays(0);
}

/* The HPS doesn't have a sleep() function like the Nios II, so we can make one
 * by using the global timer.
 */
void delay_us(uint32_t us) {
    uint64_t start_time = alt_globaltmr_get64();
    uint32_t timer_prescaler = alt_globaltmr_prescaler_get() + 1;
    uint64_t end_time;
    alt_freq_t timer_clock;

    assert(ALT_E_SUCCESS == alt_clk_freq_get(ALT_CLK_MPU_PERIPH, &timer_clock));
    end_time = start_time + us * ((timer_clock / timer_prescaler) / ALT_MICROSECS_IN_A_SEC);

    while(alt_globaltmr_get64() < end_time) {
        // polling wait
    }
}

void set_hex_displays(uint32_t value) {
	char current_char[2] = " \0";
	char hex_counter_hex_string[HEX_DISPLAY_COUNT + 1];

    // get hex string representation of hex_counter
    snprintf(hex_counter_hex_string, HEX_DISPLAY_COUNT + 1, "%0*x", HEX_DISPLAY_COUNT, (unsigned int) value);

	uint32_t hex_display_index = 0;
	for (hex_display_index = 0; hex_display_index < HEX_DISPLAY_COUNT; hex_display_index++) {
		current_char[0] = hex_counter_hex_string[HEX_DISPLAY_COUNT - hex_display_index - 1];

		uint32_t number = (uint32_t) strtol(current_char, NULL, 16);

		uint32_t hex_value_to_write = hex_display_table[number];
		alt_write_word(fpga_hex_displays[hex_display_index], hex_value_to_write);
	}
}

void handle_hps_led() {
    uint32_t hps_gpio_input = alt_gpio_port_data_read(HPS_KEY_PORT, HPS_KEY_MASK);

    // HPS_KEY is active-low
    bool toggle_hps_led = (~hps_gpio_input & HPS_KEY_MASK);

    if (toggle_hps_led) {
        uint32_t hps_led_value = alt_read_word(ALT_GPIO1_SWPORTA_DR_ADDR);
        hps_led_value >>= HPS_LED_PORT_BIT;
        hps_led_value = !hps_led_value;
        hps_led_value <<= HPS_LED_PORT_BIT;
        assert(ALT_E_SUCCESS == alt_gpio_port_data_write(HPS_LED_PORT, HPS_LED_MASK, hps_led_value));
    }
}

bool is_fpga_button_pressed(uint32_t button_number) {
	// buttons are active-low
	return ((~alt_read_word(fpga_buttons)) & (1 << button_number));
}

void handle_hex_displays(uint32_t *hex_counter) {
    // FPGA button 0 will invert the counting direction
    if (is_fpga_button_pressed(0)) {
        hex_increment = !hex_increment;
    }

    if (hex_increment) {
        *hex_counter += 1;
    } else {
        *hex_counter -= 1;
    }

    // FPGA button 1 will reset the counter to 0
    if (is_fpga_button_pressed(1)) {
        *hex_counter = 0;
    }

    // restrict hex_counter_uint to HEX_DISPLAY_COUNT digits
    *hex_counter &= HEX_COUNTER_MASK;
    set_hex_displays(*hex_counter);
}

int main() {
	printf("DE1-SoC bare-metal demo\n");

	setup_peripherals();

	uint32_t hex_counter = 0;
	while (true) {
	    handle_hex_displays(&hex_counter);
		handle_hps_led();
		delay_us(ALT_MICROSECS_IN_A_SEC / 10);
	}

	return 0;
}
