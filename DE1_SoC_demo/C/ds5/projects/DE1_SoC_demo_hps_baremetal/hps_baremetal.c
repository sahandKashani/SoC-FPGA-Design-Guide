#include <stdio.h>
#include <stdlib.h>

#include "../hps_soc_system.h"
#include "hwlib.h"
#include "socal/alt_gpio.h"
#include "socal/hps.h"
#include "socal/socal.h"

// |=============|==========|==============|==========|
// | Signal Name | HPS GPIO | Register/bit | Function |
// |=============|==========|==============|==========|
// |   HPS_LED   |  GPIO53  |   GPIO1[24]  |    I/O   |
// |   HPS_KEY   |  GPIO54  |   GPIO1[25]  |    I/O   |
// |=============|==========|==============|==========|
#define HPS_LED_BIT  (24)
#define HPS_KEY_BIT  (25)
#define HPS_LED_MASK (1 << HPS_LED_BIT)
#define HPS_KEY_MASK (1 << HPS_KEY_BIT)

// The 7-segment display is active low
#define HEX_DISPLAY_CLEAR (0x7F)
#define HEX_DISPLAY_ZERO  (0x40)
#define HEX_DISPLAY_ONE   (0x79)
#define HEX_DISPLAY_TWO   (0x24)
#define HEX_DISPLAY_THREE (0x30)
#define HEX_DISPLAY_FOUR  (0x19)
#define HEX_DISPLAY_FIVE  (0x12)
#define HEX_DISPLAY_SIX   (0x02)
#define HEX_DISPLAY_SEVEN (0x78)
#define HEX_DISPLAY_EIGHT (0x00)
#define HEX_DISPLAY_NINE  (0x18)
#define HEX_DISPLAY_A     (0x08)
#define HEX_DISPLAY_B     (0x03)
#define HEX_DISPLAY_C     (0x46)
#define HEX_DISPLAY_D     (0x21)
#define HEX_DISPLAY_E     (0x06)
#define HEX_DISPLAY_F     (0x0E)

// The HPS will only use HEX_DISPLAY_COUNT of the 6 7-segment displays
#define HEX_DISPLAY_COUNT (6)
#define HEX_COUNTER_MASK  ((1 << (4 * HEX_DISPLAY_COUNT)) - 1)

// Globals
void *hps_gpio1_data               = ALT_GPIO1_SWPORTA_DR_ADDR;
void *hps_gpio1_direction          = ALT_GPIO1_SWPORTA_DDR_ADDR;
void *hps_gpio1_external_interface = ALT_GPIO1_EXT_PORTA_ADDR;

void *fpga_buttons                          =  ALT_LWFPGASLVS_ADDR + BUTTONS_0_BASE;
void **fpga_hex_displays[HEX_DISPLAY_COUNT] = {ALT_LWFPGASLVS_ADDR + HEX_0_BASE,
                                               ALT_LWFPGASLVS_ADDR + HEX_1_BASE,
                                               ALT_LWFPGASLVS_ADDR + HEX_2_BASE,
                                               ALT_LWFPGASLVS_ADDR + HEX_3_BASE,
                                               ALT_LWFPGASLVS_ADDR + HEX_4_BASE,
                                               ALT_LWFPGASLVS_ADDR + HEX_5_BASE};

uint32_t hex_display_table[16] = {HEX_DISPLAY_ZERO , HEX_DISPLAY_ONE,
                                  HEX_DISPLAY_TWO  , HEX_DISPLAY_THREE,
                                  HEX_DISPLAY_FOUR , HEX_DISPLAY_FIVE,
                                  HEX_DISPLAY_SIX  , HEX_DISPLAY_SEVEN,
                                  HEX_DISPLAY_EIGHT, HEX_DISPLAY_NINE,
                                  HEX_DISPLAY_A    , HEX_DISPLAY_B,
                                  HEX_DISPLAY_C    , HEX_DISPLAY_D,
                                  HEX_DISPLAY_E    , HEX_DISPLAY_F};

bool hps_led_on    = true;
bool hex_increment = true;

uint32_t hex_counter_uint = 0;
char hex_counter_hex_string[HEX_DISPLAY_COUNT + 1];

void initialize_peripherals() {
	// Initialize the PIO controller:
	//     Set the direction of the HPS_LED GPIO1 bit to "output" - set to 1
	//     Set the direction of the HPS_KEY GPIO1 bit to "input"  - set to 0
	alt_setbits_word(hps_gpio1_direction, HPS_LED_MASK);
	alt_clrbits_word(hps_gpio1_direction, HPS_KEY_MASK);

	// Clear 7-segment displays
	uint32_t hex_display_index = 0;
	for (hex_display_index = 0; hex_display_index < HEX_DISPLAY_COUNT; hex_display_index++) {
		alt_write_word(fpga_hex_displays[hex_display_index], HEX_DISPLAY_ZERO);
	}
}

void update_hex_displays() {
	char current_char[2] = " \0";
	uint32_t hex_display_index = 0;
	for (hex_display_index = 0; hex_display_index < HEX_DISPLAY_COUNT; hex_display_index++) {
		current_char[0] = hex_counter_hex_string[HEX_DISPLAY_COUNT - hex_display_index - 1];

		uint32_t number = (uint32_t) strtol(current_char, NULL, 16);

		uint32_t hex_value_to_write = hex_display_table[number];
		alt_write_word(fpga_hex_displays[hex_display_index], hex_value_to_write);
	}
}

void toggle_hps_led() {
	uint32_t hps_gpio1_input = alt_read_word(hps_gpio1_external_interface);

	// the input is active-low
	if (~hps_gpio1_input & HPS_KEY_MASK) {
		hps_led_on = !hps_led_on;
	}

	if (hps_led_on) {
		alt_setbits_word(hps_gpio1_data, HPS_LED_MASK);
	} else {
		alt_clrbits_word(hps_gpio1_data, HPS_LED_MASK);
	}
}

bool is_button_pressed(uint32_t button_number) {
	// buttons are active-low
	return ((~alt_read_word(fpga_buttons)) & (1 << button_number));
}

// button 0 = increment (1)/decrement (0) (active-low)
// button 1 = reset hex displays to 0
// timer-based interrupt for rotating 5 right leds (based on switches) (switches up = 1/down = 0) leds (1 = on/0 = off)
int main() {
	printf("print test\n");

	initialize_peripherals();

	while (true) {
		// Button 0 will invert the increment/decrement direction of the hex counter
		if (is_button_pressed(0)) {
			hex_increment = !hex_increment;
		}

		if (hex_increment) {
			hex_counter_uint += 1;
		} else {
			hex_counter_uint -= 1;
		}

		// restrict hex_counter_uint to HEX_DISPLAY_COUNT digits
		hex_counter_uint &= HEX_COUNTER_MASK;

		// get hex string representation of hex_counter
		snprintf(hex_counter_hex_string, HEX_DISPLAY_COUNT + 1, "%0*x", HEX_DISPLAY_COUNT, (unsigned int) hex_counter_uint);

		update_hex_displays();

		toggle_hps_led();
	}

	return 0;
}
