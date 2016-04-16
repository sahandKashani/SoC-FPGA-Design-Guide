#include <assert.h>
#include <errno.h>
#include <fcntl.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>

#include "alt_generalpurpose_io.h"
#include "hps_linux.h"
#include "hwlib.h"
#include "socal/alt_gpio.h"
#include "socal/hps.h"
#include "socal/socal.h"
#include "../hps_soc_system.h"

// State variables
bool hex_increment = true;

void open_physical_memory_device() {
    // We need to access the system's physical memory so we can map it to user
    // space. We will use the /dev/mem file to do this. /dev/mem is a character
    // device file that is an image of the main memory of the computer. Byte
    // addresses in /dev/mem are interpreted as physical memory addresses.
    // Remember that you need to execute this program as ROOT in order to have
    // access to /dev/mem.

    fd_dev_mem = open("/dev/mem", O_RDWR | O_SYNC);
    if(fd_dev_mem  == -1) {
        printf("ERROR: could not open \"/dev/mem\".\n");
        printf("    errno = %s\n", strerror(errno));
        exit(EXIT_FAILURE);
    }
}

void close_physical_memory_device() {
    close(fd_dev_mem);
}

void mmap_hps_peripherals() {
    hps_gpio = mmap(NULL, hps_gpio_span, PROT_READ | PROT_WRITE, MAP_SHARED, fd_dev_mem, hps_gpio_ofst);
    if (hps_gpio == MAP_FAILED) {
        printf("Error: hps_gpio mmap() failed.\n");
        printf("    errno = %s\n", strerror(errno));
        close(fd_dev_mem);
        exit(EXIT_FAILURE);
    }
}

void munmap_hps_peripherals() {
    if (munmap(hps_gpio, hps_gpio_span) != 0) {
        printf("Error: hps_gpio munmap() failed\n");
        printf("    errno = %s\n", strerror(errno));
        close(fd_dev_mem);
        exit(EXIT_FAILURE);
    }

    hps_gpio = NULL;
}

void mmap_fpga_peripherals() {
    // Use mmap() to map the address space related to the fpga buttons and hex
    // displays into user space so we can interact with them.

    // The fpga buttons and hex displays are connected to the h2f_lw_axi_master,
    // so their base addresses are calculated from that of the h2f_lw_axi_master.

    // IMPORTANT: If you try to only mmap the fpga buttons or the hex displays,
    // the operation will fail, and you will get "Invalid argument" as errno.
    // The mmap() manual page says that you can only map a file from an offset
    // which is a multiple of the system's page size.

    // So, for example, you cannot just map the fpga buttons alone, because its
    // address is 0xFF200060, which is NOT a multiple of the page size.
    // The typical page size in Linux is 0x1000 bytes.

    // In this case, we have no choice but to map starting from 0xFF200000
    // instead, which is the starting address of the h2f_lw_axi_master to which
    // the fpga buttons are connected, and which is a multiple of the page size.

    h2f_lw_axi_master = mmap(NULL, h2f_lw_axi_master_span, PROT_READ | PROT_WRITE, MAP_SHARED, fd_dev_mem, h2f_lw_axi_master_ofst);
    if (h2f_lw_axi_master == MAP_FAILED) {
        printf("Error: h2f_lw_axi_master mmap() failed.\n");
        printf("    errno = %s\n", strerror(errno));
        close(fd_dev_mem);
        exit(EXIT_FAILURE);
    }

    fpga_buttons         = h2f_lw_axi_master + BUTTONS_0_BASE;
    fpga_hex_displays[0] = h2f_lw_axi_master + HEX_0_BASE;
    fpga_hex_displays[1] = h2f_lw_axi_master + HEX_1_BASE;
    fpga_hex_displays[2] = h2f_lw_axi_master + HEX_2_BASE;
    fpga_hex_displays[3] = h2f_lw_axi_master + HEX_3_BASE;
    fpga_hex_displays[4] = h2f_lw_axi_master + HEX_4_BASE;
    fpga_hex_displays[5] = h2f_lw_axi_master + HEX_5_BASE;
}

void munmap_fpga_peripherals() {
    if (munmap(h2f_lw_axi_master, h2f_lw_axi_master_span) != 0) {
        printf("Error: h2f_lw_axi_master munmap() failed\n");
        printf("    errno = %s\n", strerror(errno));
        close(fd_dev_mem);
        exit(EXIT_FAILURE);
    }

    h2f_lw_axi_master    = NULL;
    fpga_buttons         = NULL;
    fpga_hex_displays[0] = NULL;
    fpga_hex_displays[1] = NULL;
    fpga_hex_displays[2] = NULL;
    fpga_hex_displays[3] = NULL;
    fpga_hex_displays[4] = NULL;
    fpga_hex_displays[5] = NULL;
}

void mmap_peripherals() {
    mmap_hps_peripherals();
    mmap_fpga_peripherals();
}

void munmap_peripherals() {
    munmap_hps_peripherals();
    munmap_fpga_peripherals();
}

void setup_hps_gpio() {
    // Initialize the HPS PIO controller:
    //     Set the direction of the HPS_LED GPIO bit to "output"
    //     Set the direction of the HPS_KEY_N GPIO bit to "input"
    void *hps_gpio_direction = ALT_GPIO_SWPORTA_DDR_ADDR(hps_gpio);
    alt_setbits_word(hps_gpio_direction, ALT_GPIO_PIN_OUTPUT << HPS_LED_PORT_BIT);
    alt_setbits_word(hps_gpio_direction, ALT_GPIO_PIN_INPUT << HPS_KEY_N_PORT_BIT);
}

void setup_hex_displays() {
    set_hex_displays(0);
}

void set_hex_displays(uint32_t value) {
	char current_char[2] = " \0";
	char hex_counter_hex_string[HEX_DISPLAY_COUNT + 1];

    // get hex string representation of input value on HEX_DISPLAY_COUNT 7-segment displays
    snprintf(hex_counter_hex_string, HEX_DISPLAY_COUNT + 1, "%0*x", HEX_DISPLAY_COUNT, (unsigned int) value);

	uint32_t hex_display_index = 0;
	for (hex_display_index = 0; hex_display_index < HEX_DISPLAY_COUNT; hex_display_index++) {
		current_char[0] = hex_counter_hex_string[HEX_DISPLAY_COUNT - hex_display_index - 1];

		// get decimal representation for this 7-segment display
		uint32_t number = (uint32_t) strtol(current_char, NULL, 16);

		// use lookup table to find active-low value to represent number on the 7-segment display
		uint32_t hex_value_to_write = hex_display_table[number];

		alt_write_word(fpga_hex_displays[hex_display_index], hex_value_to_write);
	}
}

void handle_hps_led() {
    void *hps_gpio_data = ALT_GPIO_SWPORTA_DR_ADDR(hps_gpio);
    void *hps_gpio_port = ALT_GPIO_EXT_PORTA_ADDR(hps_gpio);

    uint32_t hps_gpio_input = alt_read_word(hps_gpio_port) & HPS_KEY_N_MASK;

    // HPS_KEY_N is active-low
    bool toggle_hps_led = (~hps_gpio_input & HPS_KEY_N_MASK);

    if (toggle_hps_led) {
        uint32_t hps_led_value = alt_read_word(hps_gpio_data);
        hps_led_value >>= HPS_LED_PORT_BIT;
        hps_led_value = !hps_led_value;
        hps_led_value <<= HPS_LED_PORT_BIT;
        alt_replbits_word(hps_gpio_data, HPS_LED_MASK, hps_led_value);
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

    // restrict hex_counter to HEX_DISPLAY_COUNT digits
    *hex_counter &= HEX_COUNTER_MASK;
    set_hex_displays(*hex_counter);
}

int main() {
	printf("DE1-SoC linux demo\n");

	open_physical_memory_device();
	mmap_peripherals();

    setup_hps_gpio();
    setup_hex_displays();

	uint32_t hex_counter = 0;
	while (true) {
	    handle_hex_displays(&hex_counter);
		handle_hps_led();
		usleep(ALT_MICROSECS_IN_A_SEC / 10);
	}

	munmap_peripherals();
	close_physical_memory_device();

	return 0;
}
