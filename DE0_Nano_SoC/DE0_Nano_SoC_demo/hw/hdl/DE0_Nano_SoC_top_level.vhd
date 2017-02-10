-- #############################################################################
-- DE0_Nano_SoC_top_level.vhd
--
-- BOARD         : DE0-Nano-SoC from Terasic
-- Author        : Sahand Kashani-Akhavan from Terasic documentation
-- Revision      : 1.0
-- Creation date : 11/06/2015
--
-- Syntax Rule : GROUP_NAME_N[bit]
--
-- GROUP : specify a particular interface (ex: SDR_)
-- NAME  : signal name (ex: CONFIG, D, ...)
-- bit   : signal index
-- _N    : to specify an active-low signal
-- #############################################################################

library ieee;
use ieee.std_logic_1164.all;

entity DE0_Nano_SoC_top_level is
    port(
        -- ADC
     -- ADC_CONVST       : out   std_logic;
     -- ADC_SCK          : out   std_logic;
     -- ADC_SDI          : out   std_logic;
     -- ADC_SDO          : in    std_logic;

        -- ARDUINO
     -- ARDUINO_IO       : inout std_logic_vector(15 downto 0);
     -- ARDUINO_RESET_N  : inout std_logic;

        -- CLOCK
        FPGA_CLK1_50     : in    std_logic;
     -- FPGA_CLK2_50     : in    std_logic;
     -- FPGA_CLK3_50     : in    std_logic;

        -- KEY
        KEY_N            : in    std_logic_vector(1 downto 0);

        -- LED
        LED              : out   std_logic_vector(7 downto 0);

        -- SW
     -- SW               : in    std_logic_vector(3 downto 0);

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
        HPS_GSENSOR_INT  : inout std_logic;
        HPS_I2C0_SCLK    : inout std_logic;
        HPS_I2C0_SDAT    : inout std_logic;
        HPS_I2C1_SCLK    : inout std_logic;
        HPS_I2C1_SDAT    : inout std_logic;
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
end entity DE0_Nano_SoC_top_level;

architecture rtl of DE0_Nano_SoC_top_level is
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
            hps_0_io_hps_io_gpio_inst_GPIO53         : inout std_logic                     := 'X';
            hps_0_io_hps_io_gpio_inst_GPIO54         : inout std_logic                     := 'X';
            hps_0_io_hps_io_gpio_inst_GPIO61         : inout std_logic                     := 'X';
            hps_fpga_leds_external_connection_export : out   std_logic_vector(3 downto 0);
            nios_leds_external_connection_export     : out   std_logic_vector(3 downto 0);
            reset_reset_n                            : in    std_logic                     := 'X'
        );
    end component soc_system;

begin
    soc_system_inst : component soc_system
    port map(
        clk_clk                                  => FPGA_CLK1_50,
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
        hps_0_io_hps_io_i2c0_inst_SDA            => HPS_I2C0_SDAT,
        hps_0_io_hps_io_i2c0_inst_SCL            => HPS_I2C0_SCLK,
        hps_0_io_hps_io_i2c1_inst_SDA            => HPS_I2C1_SDAT,
        hps_0_io_hps_io_i2c1_inst_SCL            => HPS_I2C1_SCLK,
        hps_0_io_hps_io_gpio_inst_GPIO09         => HPS_CONV_USB_N,
        hps_0_io_hps_io_gpio_inst_GPIO35         => HPS_ENET_INT_N,
        hps_0_io_hps_io_gpio_inst_GPIO40         => HPS_LTC_GPIO,
        hps_0_io_hps_io_gpio_inst_GPIO53         => HPS_LED,
        hps_0_io_hps_io_gpio_inst_GPIO54         => HPS_KEY_N,
        hps_0_io_hps_io_gpio_inst_GPIO61         => HPS_GSENSOR_INT,
        hps_fpga_leds_external_connection_export => LED(7 downto 4),
        nios_leds_external_connection_export     => LED(3 downto 0),
        reset_reset_n                            => KEY_N(0)
    );
end;
