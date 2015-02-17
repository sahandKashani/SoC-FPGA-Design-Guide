-- #############################################################################
-- DE1_SoC_top_level.vhd
--
-- BOARD         : DE1-SoC from Terasic
-- Author        : Sahand Kashani-Akhavan from Terasic documentation
-- Revision      : 1.1
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
        -- CLOCK
        CLOCK_50         : in    std_logic;

        -- SDRAM
        DRAM_ADDR        : out   std_logic_vector(12 downto 0);
        DRAM_BA          : out   std_logic_vector(1 downto 0);
        DRAM_CAS_N       : out   std_logic;
        DRAM_CKE         : out   std_logic;
        DRAM_CLK         : out   std_logic;
        DRAM_CS_N        : out   std_logic;
        DRAM_DQ          : inout std_logic_vector(15 downto 0);
        DRAM_LDQM        : out   std_logic;
        DRAM_RAS_N       : out   std_logic;
        DRAM_UDQM        : out   std_logic;
        DRAM_WE_N        : out   std_logic;

        -- SEG7
        HEX0_N           : out   std_logic_vector(6 downto 0);
        HEX1_N           : out   std_logic_vector(6 downto 0);
        HEX2_N           : out   std_logic_vector(6 downto 0);
        HEX3_N           : out   std_logic_vector(6 downto 0);
        HEX4_N           : out   std_logic_vector(6 downto 0);
        HEX5_N           : out   std_logic_vector(6 downto 0);

        -- KEY_n
        KEY_N            : in    std_logic_vector(3 downto 0);

        -- LED
        LEDR             : out   std_logic_vector(9 downto 0);

        -- SW
        SW               : in    std_logic_vector(9 downto 0);

        -- HPS
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
        HPS_KEY          : inout std_logic;
        HPS_LED          : inout std_logic
    );
end entity DE1_SoC_top_level;

architecture rtl of DE1_SoC_top_level is
    component soc_system is
        port(
            buttons_0_external_connection_export  : in    std_logic_vector(3 downto 0)  := (others => 'X');
            clk_clk                               : in    std_logic                     := 'X';
            hex_0_external_connection_export      : out   std_logic_vector(6 downto 0);
            hex_1_external_connection_export      : out   std_logic_vector(6 downto 0);
            hex_2_external_connection_export      : out   std_logic_vector(6 downto 0);
            hex_3_external_connection_export      : out   std_logic_vector(6 downto 0);
            hex_4_external_connection_export      : out   std_logic_vector(6 downto 0);
            hex_5_external_connection_export      : out   std_logic_vector(6 downto 0);
            hps_0_ddr_mem_a                       : out   std_logic_vector(14 downto 0);
            hps_0_ddr_mem_ba                      : out   std_logic_vector(2 downto 0);
            hps_0_ddr_mem_ck                      : out   std_logic;
            hps_0_ddr_mem_ck_n                    : out   std_logic;
            hps_0_ddr_mem_cke                     : out   std_logic;
            hps_0_ddr_mem_cs_n                    : out   std_logic;
            hps_0_ddr_mem_ras_n                   : out   std_logic;
            hps_0_ddr_mem_cas_n                   : out   std_logic;
            hps_0_ddr_mem_we_n                    : out   std_logic;
            hps_0_ddr_mem_reset_n                 : out   std_logic;
            hps_0_ddr_mem_dq                      : inout std_logic_vector(31 downto 0) := (others => 'X');
            hps_0_ddr_mem_dqs                     : inout std_logic_vector(3 downto 0)  := (others => 'X');
            hps_0_ddr_mem_dqs_n                   : inout std_logic_vector(3 downto 0)  := (others => 'X');
            hps_0_ddr_mem_odt                     : out   std_logic;
            hps_0_ddr_mem_dm                      : out   std_logic_vector(3 downto 0);
            hps_0_ddr_oct_rzqin                   : in    std_logic                     := 'X';
            hps_0_io_hps_io_gpio_inst_GPIO53      : inout std_logic                     := 'X';
            hps_0_io_hps_io_gpio_inst_GPIO54      : inout std_logic                     := 'X';
            leds_0_external_connection_export     : out   std_logic_vector(9 downto 0);
            pll_0_sdram_clk                       : out   std_logic;
            reset_reset_n                         : in    std_logic                     := 'X';
            sdram_controller_0_wire_addr          : out   std_logic_vector(12 downto 0);
            sdram_controller_0_wire_ba            : out   std_logic_vector(1 downto 0);
            sdram_controller_0_wire_cas_n         : out   std_logic;
            sdram_controller_0_wire_cke           : out   std_logic;
            sdram_controller_0_wire_cs_n          : out   std_logic;
            sdram_controller_0_wire_dq            : inout std_logic_vector(15 downto 0) := (others => 'X');
            sdram_controller_0_wire_dqm           : out   std_logic_vector(1 downto 0);
            sdram_controller_0_wire_ras_n         : out   std_logic;
            sdram_controller_0_wire_we_n          : out   std_logic;
            switches_0_external_connection_export : in    std_logic_vector(9 downto 0)  := (others => 'X')
        );
    end component soc_system;

begin
    soc_system_inst : component soc_system
        port map(buttons_0_external_connection_export  => KEY_N,
                 clk_clk                               => CLOCK_50,
                 hex_0_external_connection_export      => HEX0_N,
                 hex_1_external_connection_export      => HEX1_N,
                 hex_2_external_connection_export      => HEX2_N,
                 hex_3_external_connection_export      => HEX3_N,
                 hex_4_external_connection_export      => HEX4_N,
                 hex_5_external_connection_export      => HEX5_N,
                 hps_0_ddr_mem_a                       => HPS_DDR3_ADDR,
                 hps_0_ddr_mem_ba                      => HPS_DDR3_BA,
                 hps_0_ddr_mem_ck                      => HPS_DDR3_CK_P,
                 hps_0_ddr_mem_ck_n                    => HPS_DDR3_CK_N,
                 hps_0_ddr_mem_cke                     => HPS_DDR3_CKE,
                 hps_0_ddr_mem_cs_n                    => HPS_DDR3_CS_N,
                 hps_0_ddr_mem_ras_n                   => HPS_DDR3_RAS_N,
                 hps_0_ddr_mem_cas_n                   => HPS_DDR3_CAS_N,
                 hps_0_ddr_mem_we_n                    => HPS_DDR3_WE_N,
                 hps_0_ddr_mem_reset_n                 => HPS_DDR3_RESET_N,
                 hps_0_ddr_mem_dq                      => HPS_DDR3_DQ,
                 hps_0_ddr_mem_dqs                     => HPS_DDR3_DQS_P,
                 hps_0_ddr_mem_dqs_n                   => HPS_DDR3_DQS_N,
                 hps_0_ddr_mem_odt                     => HPS_DDR3_ODT,
                 hps_0_ddr_mem_dm                      => HPS_DDR3_DM,
                 hps_0_ddr_oct_rzqin                   => HPS_DDR3_RZQ,
                 hps_0_io_hps_io_gpio_inst_GPIO53      => HPS_LED,
                 hps_0_io_hps_io_gpio_inst_GPIO54      => HPS_KEY,
                 leds_0_external_connection_export     => LEDR,
                 pll_0_sdram_clk                       => DRAM_CLK,
                 reset_reset_n                         => '1',
                 sdram_controller_0_wire_addr          => DRAM_ADDR,
                 sdram_controller_0_wire_ba            => DRAM_BA,
                 sdram_controller_0_wire_cas_n         => DRAM_CAS_N,
                 sdram_controller_0_wire_cke           => DRAM_CKE,
                 sdram_controller_0_wire_cs_n          => DRAM_CS_N,
                 sdram_controller_0_wire_dq            => DRAM_DQ,
                 sdram_controller_0_wire_dqm(1)        => DRAM_UDQM,
                 sdram_controller_0_wire_dqm(0)        => DRAM_LDQM,
                 sdram_controller_0_wire_ras_n         => DRAM_RAS_N,
                 sdram_controller_0_wire_we_n          => DRAM_WE_N,
                 switches_0_external_connection_export => SW);
end;
