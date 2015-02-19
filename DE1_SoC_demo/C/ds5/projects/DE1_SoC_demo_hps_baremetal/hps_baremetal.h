#ifndef HPS_BAREMETAL_H_
#define HPS_BAREMETAL_H_

#include <stdbool.h>
#include <stdint.h>
#include "hps.h"
#include "../hps_soc_system.h"

// |=============|==========|==============|==========|
// | Signal Name | HPS GPIO | Register/bit | Function |
// |=============|==========|==============|==========|
// |   HPS_LED   |  GPIO53  |   GPIO1[24]  |    I/O   |
// |=============|==========|==============|==========|
#define HPS_LED_IDX      (ALT_GPIO_1BIT_53)
#define HPS_LED_MASK     (1 << alt_gpio_bit_to_port_pin(HPS_LED_IDX))
#define HPS_LED_PORT     (alt_gpio_bit_to_pid(HPS_LED_IDX))
#define HPS_LED_PORT_BIT (alt_gpio_bit_to_port_pin(HPS_LED_IDX))

// |=============|==========|==============|==========|
// | Signal Name | HPS GPIO | Register/bit | Function |
// |=============|==========|==============|==========|
// |   HPS_KEY   |  GPIO54  |   GPIO1[25]  |    I/O   |
// |=============|==========|==============|==========|
#define HPS_KEY_IDX      (ALT_GPIO_1BIT_54)
#define HPS_KEY_MASK     (1 << alt_gpio_bit_to_port_pin(HPS_KEY_IDX))
#define HPS_KEY_PORT     (alt_gpio_bit_to_pid(HPS_KEY_IDX))
#define HPS_KEY_PORT_BIT (alt_gpio_bit_to_port_pin(HPS_KEY_IDX))

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

void *fpga_buttons                         = ALT_LWFPGASLVS_ADDR + BUTTONS_0_BASE;

void *fpga_hex_displays[HEX_DISPLAY_COUNT] = {ALT_LWFPGASLVS_ADDR + HEX_0_BASE,
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

void setup_peripherals();
void setup_hps_timer();
void setup_hex_displays();
void setup_hps_gpio();
void delay_us(uint32_t us);
void set_hex_displays(uint32_t value);
void toggle_hps_led(bool *hps_led_on);
bool is_fpga_button_pressed(uint32_t button_number);

#endif
