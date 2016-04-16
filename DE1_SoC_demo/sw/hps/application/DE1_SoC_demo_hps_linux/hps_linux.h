#ifndef HPS_LINUX_H_
#define HPS_LINUX_H_

#include <stdbool.h>
#include <stdint.h>

#include "socal/hps.h"
#include "../hps_soc_system.h"

// |=============|==========|==============|==========|
// | Signal Name | HPS GPIO | Register/bit | Function |
// |=============|==========|==============|==========|
// |   HPS_LED   |  GPIO53  |   GPIO1[24]  |    I/O   |
// |=============|==========|==============|==========|
#define HPS_LED_IDX      (ALT_GPIO_1BIT_53)                      // GPIO53
#define HPS_LED_PORT     (alt_gpio_bit_to_pid(HPS_LED_IDX))      // ALT_GPIO_PORTB
#define HPS_LED_PORT_BIT (alt_gpio_bit_to_port_pin(HPS_LED_IDX)) // 24 (from GPIO1[24])
#define HPS_LED_MASK     (1 << HPS_LED_PORT_BIT)

// |=============|==========|==============|==========|
// | Signal Name | HPS GPIO | Register/bit | Function |
// |=============|==========|==============|==========|
// |  HPS_KEY_N  |  GPIO54  |   GPIO1[25]  |    I/O   |
// |=============|==========|==============|==========|
#define HPS_KEY_N_IDX      (ALT_GPIO_1BIT_54)                        // GPIO54
#define HPS_KEY_N_PORT     (alt_gpio_bit_to_pid(HPS_KEY_N_IDX))      // ALT_GPIO_PORTB
#define HPS_KEY_N_PORT_BIT (alt_gpio_bit_to_port_pin(HPS_KEY_N_IDX)) // 25 (from GPIO1[25])
#define HPS_KEY_N_MASK     (1 << HPS_KEY_N_PORT_BIT)

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

// physical memory file descriptor
int fd_dev_mem = 0;

// memory-mapped peripherals
void   *hps_gpio     = NULL;
size_t hps_gpio_span = ALT_GPIO1_UB_ADDR - ALT_GPIO1_LB_ADDR + 1;
size_t hps_gpio_ofst = ALT_GPIO1_OFST;

void   *h2f_lw_axi_master     = NULL;
size_t h2f_lw_axi_master_span = ALT_LWFPGASLVS_UB_ADDR - ALT_LWFPGASLVS_LB_ADDR + 1;
size_t h2f_lw_axi_master_ofst = ALT_LWFPGASLVS_OFST;

void *fpga_buttons                         = NULL;
void *fpga_hex_displays[HEX_DISPLAY_COUNT] = {NULL, NULL, NULL, NULL, NULL, NULL};

uint32_t hex_display_table[16] = {HEX_DISPLAY_ZERO , HEX_DISPLAY_ONE,
                                  HEX_DISPLAY_TWO  , HEX_DISPLAY_THREE,
                                  HEX_DISPLAY_FOUR , HEX_DISPLAY_FIVE,
                                  HEX_DISPLAY_SIX  , HEX_DISPLAY_SEVEN,
                                  HEX_DISPLAY_EIGHT, HEX_DISPLAY_NINE,
                                  HEX_DISPLAY_A    , HEX_DISPLAY_B,
                                  HEX_DISPLAY_C    , HEX_DISPLAY_D,
                                  HEX_DISPLAY_E    , HEX_DISPLAY_F};

void open_physical_memory_device();
void close_physical_memory_device();
void mmap_hps_peripherals();
void munmap_hps_peripherals();
void mmap_fpga_peripherals();
void munmap_fpga_peripherals();
void mmap_peripherals();
void munmap_peripherals();
void setup_hps_gpio();
void setup_hex_displays();
void set_hex_displays(uint32_t value);
void handle_hps_led();
bool is_fpga_button_pressed(uint32_t button_number);
void handle_hex_displays(uint32_t *hex_counter);


#endif
