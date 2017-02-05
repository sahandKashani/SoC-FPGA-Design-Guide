-- #############################################################################
-- DE1_SoC_top_level.vhd
--
-- BOARD         : DE1-SoC from Terasic
-- Author        : Sahand Kashani-Akhavan from Terasic documentation
-- Revision      : 1.4
-- Creation date : 04/02/2015
--
-- Syntax Rule : GROUP_NAME_N[bit]
--
-- GROUP  : specify a particular interface (ex: SDR_)
-- NAME   : signal name (ex: CONFIG, D, ...)
-- bit    : signal index
-- _N     : to specify an active-low signal
-- #############################################################################

library ieee;
use ieee.std_logic_1164.all;

entity DE1_SoC_top_level is
    port(
        -- ADC
     -- ADC_CS_n         : out   std_logic;
     -- ADC_DIN          : out   std_logic;
     -- ADC_DOUT         : in    std_logic;
     -- ADC_SCLK         : out   std_logic;

        -- Audio
     -- AUD_ADCDAT       : in    std_logic;
     -- AUD_ADCLRCK      : inout std_logic;
     -- AUD_BCLK         : inout std_logic;
     -- AUD_DACDAT       : out   std_logic;
     -- AUD_DACLRCK      : inout std_logic;
     -- AUD_XCK          : out   std_logic;

        -- CLOCK
        CLOCK_50 : in std_logic;
     -- CLOCK2_50        : in    std_logic;
     -- CLOCK3_50        : in    std_logic;
     -- CLOCK4_50        : in    std_logic;

        -- SDRAM
        DRAM_ADDR  : out   std_logic_vector(12 downto 0);
        DRAM_BA    : out   std_logic_vector(1 downto 0);
        DRAM_CAS_N : out   std_logic;
        DRAM_CKE   : out   std_logic;
        DRAM_CLK   : out   std_logic;
        DRAM_CS_N  : out   std_logic;
        DRAM_DQ    : inout std_logic_vector(15 downto 0);
        DRAM_LDQM  : out   std_logic;
        DRAM_RAS_N : out   std_logic;
        DRAM_UDQM  : out   std_logic;
        DRAM_WE_N  : out   std_logic;

        -- I2C for Audio and Video-In
     -- FPGA_I2C_SCLK    : out   std_logic;
     -- FPGA_I2C_SDAT    : inout std_logic;

        -- SEG7
     -- HEX0_N           : out   std_logic_vector(6 downto 0);
     -- HEX1_N           : out   std_logic_vector(6 downto 0);
     -- HEX2_N           : out   std_logic_vector(6 downto 0);
     -- HEX3_N           : out   std_logic_vector(6 downto 0);
     -- HEX4_N           : out   std_logic_vector(6 downto 0);
     -- HEX5_N           : out   std_logic_vector(6 downto 0);

        -- IR
     -- IRDA_RXD         : in    std_logic;
     -- IRDA_TXD         : out   std_logic;

        -- KEY_N
        KEY_N : in std_logic_vector(3 downto 0);

        -- LED
        LEDR : out std_logic_vector(9 downto 0);

        -- PS2
     -- PS2_CLK          : inout std_logic;
     -- PS2_CLK2         : inout std_logic;
     -- PS2_DAT          : inout std_logic;
     -- PS2_DAT2         : inout std_logic;

        -- SW
     -- SW : in std_logic_vector(9 downto 0);

        -- Video-In
     -- TD_CLK27         : inout std_logic;
     -- TD_DATA          : out   std_logic_vector(7 downto 0);
     -- TD_HS            : out   std_logic;
     -- TD_RESET_N       : out   std_logic;
     -- TD_VS            : out   std_logic;

        -- VGA
     -- VGA_B            : out   std_logic_vector(7 downto 0);
     -- VGA_BLANK_N      : out   std_logic;
     -- VGA_CLK          : out   std_logic;
     -- VGA_G            : out   std_logic_vector(7 downto 0);
     -- VGA_HS           : out   std_logic;
     -- VGA_R            : out   std_logic_vector(7 downto 0);
     -- VGA_SYNC_N       : out   std_logic;
     -- VGA_VS           : out   std_logic;

        -- GPIO_0
     -- GPIO_0           : inout std_logic_vector(35 downto 0);

        -- GPIO_1
     -- GPIO_1           : inout std_logic_vector(35 downto 0);

        -- HPS
        HPS_CONV_USB_N   : inout std_logic;
        HPS_DDR3_ADDR    : out   std_logic_vector(14 downto 0);
        HPS_DDR3_BA      : out   std_logic_vector(2 downto 0);
        HPS_DDR3_CAS_N   : out   std_logic;
        HPS_DDR3_CK_N    : out   std_logic;
        HPS_DDR3_CK_P    : out   std_logic;
        HPS_DDR3_CKE     : out   std_logic;
        HPS_DDR3_CS_N    : out   std_logic;
        HPS_DDR3_DM      : out   std_logic_vector(3 downto 0);
        HPS_DDR3_DQ      : inout std_logic_vector(31 downto 0);
        HPS_DDR3_DQS_N   : inout std_logic_vector(3 downto 0);
        HPS_DDR3_DQS_P   : inout std_logic_vector(3 downto 0);
        HPS_DDR3_ODT     : out   std_logic;
        HPS_DDR3_RAS_N   : out   std_logic;
        HPS_DDR3_RESET_N : out   std_logic;
        HPS_DDR3_RZQ     : in    std_logic;
        HPS_DDR3_WE_N    : out   std_logic;
        HPS_ENET_GTX_CLK : out   std_logic;
        HPS_ENET_INT_N   : inout std_logic;
        HPS_ENET_MDC     : out   std_logic;
        HPS_ENET_MDIO    : inout std_logic;
        HPS_ENET_RX_CLK  : in    std_logic;
        HPS_ENET_RX_DATA : in    std_logic_vector(3 downto 0);
        HPS_ENET_RX_DV   : in    std_logic;
        HPS_ENET_TX_DATA : out   std_logic_vector(3 downto 0);
        HPS_ENET_TX_EN   : out   std_logic;
        HPS_FLASH_DATA   : inout std_logic_vector(3 downto 0);
        HPS_FLASH_DCLK   : out   std_logic;
        HPS_FLASH_NCSO   : out   std_logic;
        HPS_GSENSOR_INT  : inout std_logic;
        HPS_I2C_CONTROL  : inout std_logic;
        HPS_I2C1_SCLK    : inout std_logic;
        HPS_I2C1_SDAT    : inout std_logic;
        HPS_I2C2_SCLK    : inout std_logic;
        HPS_I2C2_SDAT    : inout std_logic;
        HPS_KEY_N        : inout std_logic;
        HPS_LED          : inout std_logic;
        HPS_LTC_GPIO     : inout std_logic;
        HPS_SD_CLK       : out   std_logic;
        HPS_SD_CMD       : inout std_logic;
        HPS_SD_DATA      : inout std_logic_vector(3 downto 0);
        HPS_SPIM_CLK     : out   std_logic;
        HPS_SPIM_MISO    : in    std_logic;
        HPS_SPIM_MOSI    : out   std_logic;
        HPS_SPIM_SS      : inout std_logic;
        HPS_UART_RX      : in    std_logic;
        HPS_UART_TX      : out   std_logic;
        HPS_USB_CLKOUT   : in    std_logic;
        HPS_USB_DATA     : inout std_logic_vector(7 downto 0);
        HPS_USB_DIR      : in    std_logic;
        HPS_USB_NXT      : in    std_logic;
        HPS_USB_STP      : out   std_logic
    );
end entity DE1_SoC_top_level;

architecture rtl of DE1_SoC_top_level is
    component soc_system is
        port(
            clk_clk                                  : in    std_logic                     := 'X';
            hps_0_ddr_mem_a                          : out   std_logic_vector(14 downto 0);
            hps_0_ddr_mem_ba                         : out   std_logic_vector(2 downto 0);
            hps_0_ddr_mem_ck                         : out   std_logic;
            hps_0_ddr_mem_ck_n                       : out   std_logic;
            hps_0_ddr_mem_cke                        : out   std_logic;
            hps_0_ddr_mem_cs_n                       : out   std_logic;
            hps_0_ddr_mem_ras_n                      : out   std_logic;
            hps_0_ddr_mem_cas_n                      : out   std_logic;
            hps_0_ddr_mem_we_n                       : out   std_logic;
            hps_0_ddr_mem_reset_n                    : out   std_logic;
            hps_0_ddr_mem_dq                         : inout std_logic_vector(31 downto 0) := (others => 'X');
            hps_0_ddr_mem_dqs                        : inout std_logic_vector(3 downto 0)  := (others => 'X');
            hps_0_ddr_mem_dqs_n                      : inout std_logic_vector(3 downto 0)  := (others => 'X');
            hps_0_ddr_mem_odt                        : out   std_logic;
            hps_0_ddr_mem_dm                         : out   std_logic_vector(3 downto 0);
            hps_0_ddr_oct_rzqin                      : in    std_logic                     := 'X';
            hps_0_io_hps_io_emac1_inst_TX_CLK        : out   std_logic;
            hps_0_io_hps_io_emac1_inst_TX_CTL        : out   std_logic;
            hps_0_io_hps_io_emac1_inst_TXD0          : out   std_logic;
            hps_0_io_hps_io_emac1_inst_TXD1          : out   std_logic;
            hps_0_io_hps_io_emac1_inst_TXD2          : out   std_logic;
            hps_0_io_hps_io_emac1_inst_TXD3          : out   std_logic;
            hps_0_io_hps_io_emac1_inst_RX_CLK        : in    std_logic                     := 'X';
            hps_0_io_hps_io_emac1_inst_RX_CTL        : in    std_logic                     := 'X';
            hps_0_io_hps_io_emac1_inst_RXD0          : in    std_logic                     := 'X';
            hps_0_io_hps_io_emac1_inst_RXD1          : in    std_logic                     := 'X';
            hps_0_io_hps_io_emac1_inst_RXD2          : in    std_logic                     := 'X';
            hps_0_io_hps_io_emac1_inst_RXD3          : in    std_logic                     := 'X';
            hps_0_io_hps_io_emac1_inst_MDIO          : inout std_logic                     := 'X';
            hps_0_io_hps_io_emac1_inst_MDC           : out   std_logic;
            hps_0_io_hps_io_qspi_inst_CLK            : out   std_logic;
            hps_0_io_hps_io_qspi_inst_SS0            : out   std_logic;
            hps_0_io_hps_io_qspi_inst_IO0            : inout std_logic                     := 'X';
            hps_0_io_hps_io_qspi_inst_IO1            : inout std_logic                     := 'X';
            hps_0_io_hps_io_qspi_inst_IO2            : inout std_logic                     := 'X';
            hps_0_io_hps_io_qspi_inst_IO3            : inout std_logic                     := 'X';
            hps_0_io_hps_io_sdio_inst_CLK            : out   std_logic;
            hps_0_io_hps_io_sdio_inst_CMD            : inout std_logic                     := 'X';
            hps_0_io_hps_io_sdio_inst_D0             : inout std_logic                     := 'X';
            hps_0_io_hps_io_sdio_inst_D1             : inout std_logic                     := 'X';
            hps_0_io_hps_io_sdio_inst_D2             : inout std_logic                     := 'X';
            hps_0_io_hps_io_sdio_inst_D3             : inout std_logic                     := 'X';
            hps_0_io_hps_io_usb1_inst_CLK            : in    std_logic                     := 'X';
            hps_0_io_hps_io_usb1_inst_STP            : out   std_logic;
            hps_0_io_hps_io_usb1_inst_DIR            : in    std_logic                     := 'X';
            hps_0_io_hps_io_usb1_inst_NXT            : in    std_logic                     := 'X';
            hps_0_io_hps_io_usb1_inst_D0             : inout std_logic                     := 'X';
            hps_0_io_hps_io_usb1_inst_D1             : inout std_logic                     := 'X';
            hps_0_io_hps_io_usb1_inst_D2             : inout std_logic                     := 'X';
            hps_0_io_hps_io_usb1_inst_D3             : inout std_logic                     := 'X';
            hps_0_io_hps_io_usb1_inst_D4             : inout std_logic                     := 'X';
            hps_0_io_hps_io_usb1_inst_D5             : inout std_logic                     := 'X';
            hps_0_io_hps_io_usb1_inst_D6             : inout std_logic                     := 'X';
            hps_0_io_hps_io_usb1_inst_D7             : inout std_logic                     := 'X';
            hps_0_io_hps_io_spim1_inst_CLK           : out   std_logic;
            hps_0_io_hps_io_spim1_inst_MOSI          : out   std_logic;
            hps_0_io_hps_io_spim1_inst_MISO          : in    std_logic                     := 'X';
            hps_0_io_hps_io_spim1_inst_SS0           : out   std_logic;
            hps_0_io_hps_io_uart0_inst_RX            : in    std_logic                     := 'X';
            hps_0_io_hps_io_uart0_inst_TX            : out   std_logic;
            hps_0_io_hps_io_i2c0_inst_SDA            : inout std_logic                     := 'X';
            hps_0_io_hps_io_i2c0_inst_SCL            : inout std_logic                     := 'X';
            hps_0_io_hps_io_i2c1_inst_SDA            : inout std_logic                     := 'X';
            hps_0_io_hps_io_i2c1_inst_SCL            : inout std_logic                     := 'X';
            hps_0_io_hps_io_gpio_inst_GPIO09         : inout std_logic                     := 'X';
            hps_0_io_hps_io_gpio_inst_GPIO35         : inout std_logic                     := 'X';
            hps_0_io_hps_io_gpio_inst_GPIO40         : inout std_logic                     := 'X';
            hps_0_io_hps_io_gpio_inst_GPIO48         : inout std_logic                     := 'X';
            hps_0_io_hps_io_gpio_inst_GPIO53         : inout std_logic                     := 'X';
            hps_0_io_hps_io_gpio_inst_GPIO54         : inout std_logic                     := 'X';
            hps_0_io_hps_io_gpio_inst_GPIO61         : inout std_logic                     := 'X';
            pll_0_sdram_clk                          : out   std_logic;
            reset_reset_n                            : in    std_logic                     := 'X';
            sdram_controller_0_wire_addr             : out   std_logic_vector(12 downto 0);
            sdram_controller_0_wire_ba               : out   std_logic_vector(1 downto 0);
            sdram_controller_0_wire_cas_n            : out   std_logic;
            sdram_controller_0_wire_cke              : out   std_logic;
            sdram_controller_0_wire_cs_n             : out   std_logic;
            sdram_controller_0_wire_dq               : inout std_logic_vector(15 downto 0) := (others => 'X');
            sdram_controller_0_wire_dqm              : out   std_logic_vector(1 downto 0);
            sdram_controller_0_wire_ras_n            : out   std_logic;
            sdram_controller_0_wire_we_n             : out   std_logic;
            nios_leds_external_connection_export     : out   std_logic_vector(4 downto 0);
            hps_fpga_leds_external_connection_export : out   std_logic_vector(4 downto 0)
        );
    end component soc_system;

begin
    soc_system_inst : component soc_system
    port map(
        clk_clk                                  => CLOCK_50,
        hps_0_ddr_mem_a                          => HPS_DDR3_ADDR,
        hps_0_ddr_mem_ba                         => HPS_DDR3_BA,
        hps_0_ddr_mem_ck                         => HPS_DDR3_CK_P,
        hps_0_ddr_mem_ck_n                       => HPS_DDR3_CK_N,
        hps_0_ddr_mem_cke                        => HPS_DDR3_CKE,
        hps_0_ddr_mem_cs_n                       => HPS_DDR3_CS_N,
        hps_0_ddr_mem_ras_n                      => HPS_DDR3_RAS_N,
        hps_0_ddr_mem_cas_n                      => HPS_DDR3_CAS_N,
        hps_0_ddr_mem_we_n                       => HPS_DDR3_WE_N,
        hps_0_ddr_mem_reset_n                    => HPS_DDR3_RESET_N,
        hps_0_ddr_mem_dq                         => HPS_DDR3_DQ,
        hps_0_ddr_mem_dqs                        => HPS_DDR3_DQS_P,
        hps_0_ddr_mem_dqs_n                      => HPS_DDR3_DQS_N,
        hps_0_ddr_mem_odt                        => HPS_DDR3_ODT,
        hps_0_ddr_mem_dm                         => HPS_DDR3_DM,
        hps_0_ddr_oct_rzqin                      => HPS_DDR3_RZQ,
        hps_0_io_hps_io_emac1_inst_TX_CLK        => HPS_ENET_GTX_CLK,
        hps_0_io_hps_io_emac1_inst_TX_CTL        => HPS_ENET_TX_EN,
        hps_0_io_hps_io_emac1_inst_TXD0          => HPS_ENET_TX_DATA(0),
        hps_0_io_hps_io_emac1_inst_TXD1          => HPS_ENET_TX_DATA(1),
        hps_0_io_hps_io_emac1_inst_TXD2          => HPS_ENET_TX_DATA(2),
        hps_0_io_hps_io_emac1_inst_TXD3          => HPS_ENET_TX_DATA(3),
        hps_0_io_hps_io_emac1_inst_RX_CLK        => HPS_ENET_RX_CLK,
        hps_0_io_hps_io_emac1_inst_RX_CTL        => HPS_ENET_RX_DV,
        hps_0_io_hps_io_emac1_inst_RXD0          => HPS_ENET_RX_DATA(0),
        hps_0_io_hps_io_emac1_inst_RXD1          => HPS_ENET_RX_DATA(1),
        hps_0_io_hps_io_emac1_inst_RXD2          => HPS_ENET_RX_DATA(2),
        hps_0_io_hps_io_emac1_inst_RXD3          => HPS_ENET_RX_DATA(3),
        hps_0_io_hps_io_emac1_inst_MDIO          => HPS_ENET_MDIO,
        hps_0_io_hps_io_emac1_inst_MDC           => HPS_ENET_MDC,
        hps_0_io_hps_io_qspi_inst_CLK            => HPS_FLASH_DCLK,
        hps_0_io_hps_io_qspi_inst_SS0            => HPS_FLASH_NCSO,
        hps_0_io_hps_io_qspi_inst_IO0            => HPS_FLASH_DATA(0),
        hps_0_io_hps_io_qspi_inst_IO1            => HPS_FLASH_DATA(1),
        hps_0_io_hps_io_qspi_inst_IO2            => HPS_FLASH_DATA(2),
        hps_0_io_hps_io_qspi_inst_IO3            => HPS_FLASH_DATA(3),
        hps_0_io_hps_io_sdio_inst_CLK            => HPS_SD_CLK,
        hps_0_io_hps_io_sdio_inst_CMD            => HPS_SD_CMD,
        hps_0_io_hps_io_sdio_inst_D0             => HPS_SD_DATA(0),
        hps_0_io_hps_io_sdio_inst_D1             => HPS_SD_DATA(1),
        hps_0_io_hps_io_sdio_inst_D2             => HPS_SD_DATA(2),
        hps_0_io_hps_io_sdio_inst_D3             => HPS_SD_DATA(3),
        hps_0_io_hps_io_usb1_inst_CLK            => HPS_USB_CLKOUT,
        hps_0_io_hps_io_usb1_inst_STP            => HPS_USB_STP,
        hps_0_io_hps_io_usb1_inst_DIR            => HPS_USB_DIR,
        hps_0_io_hps_io_usb1_inst_NXT            => HPS_USB_NXT,
        hps_0_io_hps_io_usb1_inst_D0             => HPS_USB_DATA(0),
        hps_0_io_hps_io_usb1_inst_D1             => HPS_USB_DATA(1),
        hps_0_io_hps_io_usb1_inst_D2             => HPS_USB_DATA(2),
        hps_0_io_hps_io_usb1_inst_D3             => HPS_USB_DATA(3),
        hps_0_io_hps_io_usb1_inst_D4             => HPS_USB_DATA(4),
        hps_0_io_hps_io_usb1_inst_D5             => HPS_USB_DATA(5),
        hps_0_io_hps_io_usb1_inst_D6             => HPS_USB_DATA(6),
        hps_0_io_hps_io_usb1_inst_D7             => HPS_USB_DATA(7),
        hps_0_io_hps_io_spim1_inst_CLK           => HPS_SPIM_CLK,
        hps_0_io_hps_io_spim1_inst_MOSI          => HPS_SPIM_MOSI,
        hps_0_io_hps_io_spim1_inst_MISO          => HPS_SPIM_MISO,
        hps_0_io_hps_io_spim1_inst_SS0           => HPS_SPIM_SS,
        hps_0_io_hps_io_uart0_inst_RX            => HPS_UART_RX,
        hps_0_io_hps_io_uart0_inst_TX            => HPS_UART_TX,
        hps_0_io_hps_io_i2c0_inst_SDA            => HPS_I2C1_SDAT,
        hps_0_io_hps_io_i2c0_inst_SCL            => HPS_I2C1_SCLK,
        hps_0_io_hps_io_i2c1_inst_SDA            => HPS_I2C2_SDAT,
        hps_0_io_hps_io_i2c1_inst_SCL            => HPS_I2C2_SCLK,
        hps_0_io_hps_io_gpio_inst_GPIO09         => HPS_CONV_USB_N,
        hps_0_io_hps_io_gpio_inst_GPIO35         => HPS_ENET_INT_N,
        hps_0_io_hps_io_gpio_inst_GPIO40         => HPS_LTC_GPIO,
        hps_0_io_hps_io_gpio_inst_GPIO48         => HPS_I2C_CONTROL,
        hps_0_io_hps_io_gpio_inst_GPIO53         => HPS_LED,
        hps_0_io_hps_io_gpio_inst_GPIO54         => HPS_KEY_N,
        hps_0_io_hps_io_gpio_inst_GPIO61         => HPS_GSENSOR_INT,
        pll_0_sdram_clk                          => DRAM_CLK,
        reset_reset_n                            => KEY_N(0),
        sdram_controller_0_wire_addr             => DRAM_ADDR,
        sdram_controller_0_wire_ba               => DRAM_BA,
        sdram_controller_0_wire_cas_n            => DRAM_CAS_N,
        sdram_controller_0_wire_cke              => DRAM_CKE,
        sdram_controller_0_wire_cs_n             => DRAM_CS_N,
        sdram_controller_0_wire_dq               => DRAM_DQ,
        sdram_controller_0_wire_dqm(1)           => DRAM_UDQM,
        sdram_controller_0_wire_dqm(0)           => DRAM_LDQM,
        sdram_controller_0_wire_ras_n            => DRAM_RAS_N,
        sdram_controller_0_wire_we_n             => DRAM_WE_N,
        nios_leds_external_connection_export     => LEDR(4 downto 0),
        hps_fpga_leds_external_connection_export => LEDR(9 downto 5)
    );
end;
