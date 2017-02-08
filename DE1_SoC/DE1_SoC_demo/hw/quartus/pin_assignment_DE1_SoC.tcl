###############################################################################
# pin_assignment_DE1_SoC.tcl
#
# BOARD         : DE1-SoC from Terasic
# Author        : Sahand Kashani-Akhavan from Terasic documentation
# Revision      : 1.6
# Creation date : 04/02/2015
#
# Syntax Rule : GROUP_NAME_N[bit]
#
# GROUP  : specify a particular interface (ex: SDR_)
# NAME   : signal name (ex: CONFIG, D, ...)
# bit    : signal index
# _N     : to specify an active-low signal
#
# You can run this script from Quartus by observing the following steps:
# 1. Place this TCL script in your project directory
# 2. Open your project in Quartus
# 3. Go to the View > Utility Windows -> Tcl Console
# 4. In the Tcl Console type:
#        source pin_assignment_DE1_SoC.tcl
#
# 5. The script will assign pins and return an "assignment made" message.
###############################################################################

set_global_assignment -name FAMILY "Cyclone V"
set_global_assignment -name DEVICE 5CSEMA5F31C6
set_global_assignment -name DEVICE_FILTER_PACKAGE FBGA
set_global_assignment -name DEVICE_FILTER_PIN_COUNT 896
set_global_assignment -name DEVICE_FILTER_SPEED_GRADE 6

#============================================================
# ADC
#============================================================
set_location_assignment PIN_AJ4 -to ADC_CS_N
set_location_assignment PIN_AK4 -to ADC_DIN
set_location_assignment PIN_AK3 -to ADC_DOUT
set_location_assignment PIN_AK2 -to ADC_SCLK

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_CS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_DIN
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_DOUT
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to ADC_SCLK

#============================================================
# Audio
#============================================================
set_location_assignment PIN_K7 -to AUD_ADCDAT
set_location_assignment PIN_K8 -to AUD_ADCLRCK
set_location_assignment PIN_H7 -to AUD_BCLK
set_location_assignment PIN_J7 -to AUD_DACDAT
set_location_assignment PIN_H8 -to AUD_DACLRCK
set_location_assignment PIN_G7 -to AUD_XCK

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to AUD_ADCDAT
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to AUD_ADCLRCK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to AUD_BCLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to AUD_DACDAT
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to AUD_DACLRCK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to AUD_XCK

#============================================================
# CLOCK
#============================================================
set_location_assignment PIN_AF14 -to CLOCK_50
set_location_assignment PIN_AA16 -to CLOCK2_50
set_location_assignment PIN_Y26  -to CLOCK3_50
set_location_assignment PIN_K14  -to CLOCK4_50

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK_50
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK2_50
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK3_50
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to CLOCK4_50

#============================================================
# SDRAM
#============================================================
set_location_assignment PIN_AK14 -to DRAM_ADDR[0]
set_location_assignment PIN_AK14 -to DRAM_ADDR_0
set_location_assignment PIN_AH14 -to DRAM_ADDR[1]
set_location_assignment PIN_AH14 -to DRAM_ADDR_1
set_location_assignment PIN_AG15 -to DRAM_ADDR[2]
set_location_assignment PIN_AG15 -to DRAM_ADDR_2
set_location_assignment PIN_AE14 -to DRAM_ADDR[3]
set_location_assignment PIN_AE14 -to DRAM_ADDR_3
set_location_assignment PIN_AB15 -to DRAM_ADDR[4]
set_location_assignment PIN_AB15 -to DRAM_ADDR_4
set_location_assignment PIN_AC14 -to DRAM_ADDR[5]
set_location_assignment PIN_AC14 -to DRAM_ADDR_5
set_location_assignment PIN_AD14 -to DRAM_ADDR[6]
set_location_assignment PIN_AD14 -to DRAM_ADDR_6
set_location_assignment PIN_AF15 -to DRAM_ADDR[7]
set_location_assignment PIN_AF15 -to DRAM_ADDR_7
set_location_assignment PIN_AH15 -to DRAM_ADDR[8]
set_location_assignment PIN_AH15 -to DRAM_ADDR_8
set_location_assignment PIN_AG13 -to DRAM_ADDR[9]
set_location_assignment PIN_AG13 -to DRAM_ADDR_9
set_location_assignment PIN_AG12 -to DRAM_ADDR[10]
set_location_assignment PIN_AG12 -to DRAM_ADDR_10
set_location_assignment PIN_AH13 -to DRAM_ADDR[11]
set_location_assignment PIN_AH13 -to DRAM_ADDR_11
set_location_assignment PIN_AJ14 -to DRAM_ADDR[12]
set_location_assignment PIN_AJ14 -to DRAM_ADDR_12
set_location_assignment PIN_AF13 -to DRAM_BA[0]
set_location_assignment PIN_AF13 -to DRAM_BA_0
set_location_assignment PIN_AJ12 -to DRAM_BA[1]
set_location_assignment PIN_AJ12 -to DRAM_BA_1
set_location_assignment PIN_AF11 -to DRAM_CAS_N
set_location_assignment PIN_AK13 -to DRAM_CKE
set_location_assignment PIN_AG11 -to DRAM_CS_N
set_location_assignment PIN_AH12 -to DRAM_CLK
set_location_assignment PIN_AK6  -to DRAM_DQ[0]
set_location_assignment PIN_AK6  -to DRAM_DQ_0
set_location_assignment PIN_AJ7  -to DRAM_DQ[1]
set_location_assignment PIN_AJ7  -to DRAM_DQ_1
set_location_assignment PIN_AK7  -to DRAM_DQ[2]
set_location_assignment PIN_AK7  -to DRAM_DQ_2
set_location_assignment PIN_AK8  -to DRAM_DQ[3]
set_location_assignment PIN_AK8  -to DRAM_DQ_3
set_location_assignment PIN_AK9  -to DRAM_DQ[4]
set_location_assignment PIN_AK9  -to DRAM_DQ_4
set_location_assignment PIN_AG10 -to DRAM_DQ[5]
set_location_assignment PIN_AG10 -to DRAM_DQ_5
set_location_assignment PIN_AK11 -to DRAM_DQ[6]
set_location_assignment PIN_AK11 -to DRAM_DQ_6
set_location_assignment PIN_AJ11 -to DRAM_DQ[7]
set_location_assignment PIN_AJ11 -to DRAM_DQ_7
set_location_assignment PIN_AH10 -to DRAM_DQ[8]
set_location_assignment PIN_AH10 -to DRAM_DQ_8
set_location_assignment PIN_AJ10 -to DRAM_DQ[9]
set_location_assignment PIN_AJ10 -to DRAM_DQ_9
set_location_assignment PIN_AJ9  -to DRAM_DQ[10]
set_location_assignment PIN_AJ9  -to DRAM_DQ_10
set_location_assignment PIN_AH9  -to DRAM_DQ[11]
set_location_assignment PIN_AH9  -to DRAM_DQ_11
set_location_assignment PIN_AH8  -to DRAM_DQ[12]
set_location_assignment PIN_AH8  -to DRAM_DQ_12
set_location_assignment PIN_AH7  -to DRAM_DQ[13]
set_location_assignment PIN_AH7  -to DRAM_DQ_13
set_location_assignment PIN_AJ6  -to DRAM_DQ[14]
set_location_assignment PIN_AJ6  -to DRAM_DQ_14
set_location_assignment PIN_AJ5  -to DRAM_DQ[15]
set_location_assignment PIN_AJ5  -to DRAM_DQ_15
set_location_assignment PIN_AB13 -to DRAM_LDQM
set_location_assignment PIN_AE13 -to DRAM_RAS_N
set_location_assignment PIN_AK12 -to DRAM_UDQM
set_location_assignment PIN_AA13 -to DRAM_WE_N

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_4
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_5
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_6
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_7
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_8
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_9
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_10
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_11
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_ADDR_12
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_BA[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_BA_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_BA[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_BA_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CAS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CKE
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_CLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_4
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_5
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_6
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_7
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_8
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_9
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_10
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_11
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_12
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_13
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_14
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_DQ_15
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_LDQM
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_RAS_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_UDQM
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to DRAM_WE_N

#============================================================
# I2C for Audio and Video-In
#============================================================
set_location_assignment PIN_J12 -to FPGA_I2C_SCLK
set_location_assignment PIN_K12 -to FPGA_I2C_SDAT

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FPGA_I2C_SCLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to FPGA_I2C_SDAT

#============================================================
# SEG7
#============================================================
set_location_assignment PIN_AE26 -to HEX0_N[0]
set_location_assignment PIN_AE26 -to HEX0_N_0
set_location_assignment PIN_AE27 -to HEX0_N[1]
set_location_assignment PIN_AE27 -to HEX0_N_1
set_location_assignment PIN_AE28 -to HEX0_N[2]
set_location_assignment PIN_AE28 -to HEX0_N_2
set_location_assignment PIN_AG27 -to HEX0_N[3]
set_location_assignment PIN_AG27 -to HEX0_N_3
set_location_assignment PIN_AF28 -to HEX0_N[4]
set_location_assignment PIN_AF28 -to HEX0_N_4
set_location_assignment PIN_AG28 -to HEX0_N[5]
set_location_assignment PIN_AG28 -to HEX0_N_5
set_location_assignment PIN_AH28 -to HEX0_N[6]
set_location_assignment PIN_AH28 -to HEX0_N_6
set_location_assignment PIN_AJ29 -to HEX1_N[0]
set_location_assignment PIN_AJ29 -to HEX1_N_0
set_location_assignment PIN_AH29 -to HEX1_N[1]
set_location_assignment PIN_AH29 -to HEX1_N_1
set_location_assignment PIN_AH30 -to HEX1_N[2]
set_location_assignment PIN_AH30 -to HEX1_N_2
set_location_assignment PIN_AG30 -to HEX1_N[3]
set_location_assignment PIN_AG30 -to HEX1_N_3
set_location_assignment PIN_AF29 -to HEX1_N[4]
set_location_assignment PIN_AF29 -to HEX1_N_4
set_location_assignment PIN_AF30 -to HEX1_N[5]
set_location_assignment PIN_AF30 -to HEX1_N_5
set_location_assignment PIN_AD27 -to HEX1_N[6]
set_location_assignment PIN_AD27 -to HEX1_N_6
set_location_assignment PIN_AB23 -to HEX2_N[0]
set_location_assignment PIN_AB23 -to HEX2_N_0
set_location_assignment PIN_AE29 -to HEX2_N[1]
set_location_assignment PIN_AE29 -to HEX2_N_1
set_location_assignment PIN_AD29 -to HEX2_N[2]
set_location_assignment PIN_AD29 -to HEX2_N_2
set_location_assignment PIN_AC28 -to HEX2_N[3]
set_location_assignment PIN_AC28 -to HEX2_N_3
set_location_assignment PIN_AD30 -to HEX2_N[4]
set_location_assignment PIN_AD30 -to HEX2_N_4
set_location_assignment PIN_AC29 -to HEX2_N[5]
set_location_assignment PIN_AC29 -to HEX2_N_5
set_location_assignment PIN_AC30 -to HEX2_N[6]
set_location_assignment PIN_AC30 -to HEX2_N_6
set_location_assignment PIN_AD26 -to HEX3_N[0]
set_location_assignment PIN_AD26 -to HEX3_N_0
set_location_assignment PIN_AC27 -to HEX3_N[1]
set_location_assignment PIN_AC27 -to HEX3_N_1
set_location_assignment PIN_AD25 -to HEX3_N[2]
set_location_assignment PIN_AD25 -to HEX3_N_2
set_location_assignment PIN_AC25 -to HEX3_N[3]
set_location_assignment PIN_AC25 -to HEX3_N_3
set_location_assignment PIN_AB28 -to HEX3_N[4]
set_location_assignment PIN_AB28 -to HEX3_N_4
set_location_assignment PIN_AB25 -to HEX3_N[5]
set_location_assignment PIN_AB25 -to HEX3_N_5
set_location_assignment PIN_AB22 -to HEX3_N[6]
set_location_assignment PIN_AB22 -to HEX3_N_6
set_location_assignment PIN_AA24 -to HEX4_N[0]
set_location_assignment PIN_AA24 -to HEX4_N_0
set_location_assignment PIN_Y23  -to HEX4_N[1]
set_location_assignment PIN_Y23  -to HEX4_N_1
set_location_assignment PIN_Y24  -to HEX4_N[2]
set_location_assignment PIN_Y24  -to HEX4_N_2
set_location_assignment PIN_W22  -to HEX4_N[3]
set_location_assignment PIN_W22  -to HEX4_N_3
set_location_assignment PIN_W24  -to HEX4_N[4]
set_location_assignment PIN_W24  -to HEX4_N_4
set_location_assignment PIN_V23  -to HEX4_N[5]
set_location_assignment PIN_V23  -to HEX4_N_5
set_location_assignment PIN_W25  -to HEX4_N[6]
set_location_assignment PIN_W25  -to HEX4_N_6
set_location_assignment PIN_V25  -to HEX5_N[0]
set_location_assignment PIN_V25  -to HEX5_N_0
set_location_assignment PIN_AA28 -to HEX5_N[1]
set_location_assignment PIN_AA28 -to HEX5_N_1
set_location_assignment PIN_Y27  -to HEX5_N[2]
set_location_assignment PIN_Y27  -to HEX5_N_2
set_location_assignment PIN_AB27 -to HEX5_N[3]
set_location_assignment PIN_AB27 -to HEX5_N_3
set_location_assignment PIN_AB26 -to HEX5_N[4]
set_location_assignment PIN_AB26 -to HEX5_N_4
set_location_assignment PIN_AA26 -to HEX5_N[5]
set_location_assignment PIN_AA26 -to HEX5_N_5
set_location_assignment PIN_AA25 -to HEX5_N[6]
set_location_assignment PIN_AA25 -to HEX5_N_6

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_N[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_N_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_N[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_N_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_N[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_N_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_N[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_N_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_N[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_N_4
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_N[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_N_5
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_N[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX0_N_6
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_N[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_N_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_N[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_N_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_N[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_N_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_N[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_N_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_N[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_N_4
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_N[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_N_5
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_N[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX1_N_6
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_N[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_N_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_N[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_N_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_N[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_N_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_N[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_N_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_N[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_N_4
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_N[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_N_5
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_N[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX2_N_6
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_N[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_N_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_N[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_N_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_N[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_N_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_N[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_N_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_N[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_N_4
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_N[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_N_5
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_N[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX3_N_6
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4_N[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4_N_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4_N[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4_N_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4_N[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4_N_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4_N[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4_N_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4_N[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4_N_4
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4_N[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4_N_5
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4_N[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX4_N_6
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5_N[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5_N_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5_N[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5_N_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5_N[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5_N_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5_N[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5_N_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5_N[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5_N_4
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5_N[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5_N_5
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5_N[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HEX5_N_6

#============================================================
# IR
#============================================================
set_location_assignment PIN_AA30 -to IRDA_RXD
set_location_assignment PIN_AB30 -to IRDA_TXD

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to IRDA_RXD
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to IRDA_TXD

#============================================================
# KEY_N
#============================================================
set_location_assignment PIN_AA14 -to KEY_N[0]
set_location_assignment PIN_AA14 -to KEY_N_0
set_location_assignment PIN_AA15 -to KEY_N[1]
set_location_assignment PIN_AA15 -to KEY_N_1
set_location_assignment PIN_W15  -to KEY_N[2]
set_location_assignment PIN_W15  -to KEY_N_2
set_location_assignment PIN_Y16  -to KEY_N[3]
set_location_assignment PIN_Y16  -to KEY_N_3

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY_N[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY_N_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY_N[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY_N_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY_N[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY_N_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY_N[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to KEY_N_3

#============================================================
# LED
#============================================================
set_location_assignment PIN_V16 -to LEDR[0]
set_location_assignment PIN_V16 -to LEDR_0
set_location_assignment PIN_W16 -to LEDR[1]
set_location_assignment PIN_W16 -to LEDR_1
set_location_assignment PIN_V17 -to LEDR[2]
set_location_assignment PIN_V17 -to LEDR_2
set_location_assignment PIN_V18 -to LEDR[3]
set_location_assignment PIN_V18 -to LEDR_3
set_location_assignment PIN_W17 -to LEDR[4]
set_location_assignment PIN_W17 -to LEDR_4
set_location_assignment PIN_W19 -to LEDR[5]
set_location_assignment PIN_W19 -to LEDR_5
set_location_assignment PIN_Y19 -to LEDR[6]
set_location_assignment PIN_Y19 -to LEDR_6
set_location_assignment PIN_W20 -to LEDR[7]
set_location_assignment PIN_W20 -to LEDR_7
set_location_assignment PIN_W21 -to LEDR[8]
set_location_assignment PIN_W21 -to LEDR_8
set_location_assignment PIN_Y21 -to LEDR[9]
set_location_assignment PIN_Y21 -to LEDR_9

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR_4
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR_5
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR_6
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR_7
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR_8
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to LEDR_9

#============================================================
# PS2
#============================================================
set_location_assignment PIN_AD7 -to PS2_CLK
set_location_assignment PIN_AD9 -to PS2_CLK2
set_location_assignment PIN_AE7 -to PS2_DAT
set_location_assignment PIN_AE9 -to PS2_DAT2

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PS2_CLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PS2_CLK2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PS2_DAT
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to PS2_DAT2

#============================================================
# SW
#============================================================
set_location_assignment PIN_AB12 -to SW[0]
set_location_assignment PIN_AB12 -to SW_0
set_location_assignment PIN_AC12 -to SW[1]
set_location_assignment PIN_AC12 -to SW_1
set_location_assignment PIN_AF9  -to SW[2]
set_location_assignment PIN_AF9  -to SW_2
set_location_assignment PIN_AF10 -to SW[3]
set_location_assignment PIN_AF10 -to SW_3
set_location_assignment PIN_AD11 -to SW[4]
set_location_assignment PIN_AD11 -to SW_4
set_location_assignment PIN_AD12 -to SW[5]
set_location_assignment PIN_AD12 -to SW_5
set_location_assignment PIN_AE11 -to SW[6]
set_location_assignment PIN_AE11 -to SW_6
set_location_assignment PIN_AC9  -to SW[7]
set_location_assignment PIN_AC9  -to SW_7
set_location_assignment PIN_AD10 -to SW[8]
set_location_assignment PIN_AD10 -to SW_8
set_location_assignment PIN_AE12 -to SW[9]
set_location_assignment PIN_AE12 -to SW_9

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_4
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_5
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_6
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_7
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_8
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to SW_9

#============================================================
# Video-In
#============================================================
set_location_assignment PIN_H15 -to TD_CLK27
set_location_assignment PIN_D2  -to TD_DATA[0]
set_location_assignment PIN_D2  -to TD_DATA_0
set_location_assignment PIN_B1  -to TD_DATA[1]
set_location_assignment PIN_B1  -to TD_DATA_1
set_location_assignment PIN_E2  -to TD_DATA[2]
set_location_assignment PIN_E2  -to TD_DATA_2
set_location_assignment PIN_B2  -to TD_DATA[3]
set_location_assignment PIN_B2  -to TD_DATA_3
set_location_assignment PIN_D1  -to TD_DATA[4]
set_location_assignment PIN_D1  -to TD_DATA_4
set_location_assignment PIN_E1  -to TD_DATA[5]
set_location_assignment PIN_E1  -to TD_DATA_5
set_location_assignment PIN_C2  -to TD_DATA[6]
set_location_assignment PIN_C2  -to TD_DATA_6
set_location_assignment PIN_B3  -to TD_DATA[7]
set_location_assignment PIN_B3  -to TD_DATA_7
set_location_assignment PIN_A5  -to TD_HS
set_location_assignment PIN_F6  -to TD_RESET_N
set_location_assignment PIN_A3  -to TD_VS

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_CLK27
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_DATA[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_DATA_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_DATA[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_DATA_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_DATA[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_DATA_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_DATA[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_DATA_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_DATA[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_DATA_4
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_DATA[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_DATA_5
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_DATA[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_DATA_6
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_DATA[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_DATA_7
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_HS
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_RESET_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to TD_VS

#============================================================
# VGA
#============================================================
set_location_assignment PIN_B13 -to VGA_B[0]
set_location_assignment PIN_B13 -to VGA_B_0
set_location_assignment PIN_G13 -to VGA_B[1]
set_location_assignment PIN_G13 -to VGA_B_1
set_location_assignment PIN_H13 -to VGA_B[2]
set_location_assignment PIN_H13 -to VGA_B_2
set_location_assignment PIN_F14 -to VGA_B[3]
set_location_assignment PIN_F14 -to VGA_B_3
set_location_assignment PIN_H14 -to VGA_B[4]
set_location_assignment PIN_H14 -to VGA_B_4
set_location_assignment PIN_F15 -to VGA_B[5]
set_location_assignment PIN_F15 -to VGA_B_5
set_location_assignment PIN_G15 -to VGA_B[6]
set_location_assignment PIN_G15 -to VGA_B_6
set_location_assignment PIN_J14 -to VGA_B[7]
set_location_assignment PIN_J14 -to VGA_B_7
set_location_assignment PIN_F10 -to VGA_BLANK_N
set_location_assignment PIN_A11 -to VGA_CLK
set_location_assignment PIN_J9  -to VGA_G[0]
set_location_assignment PIN_J9  -to VGA_G_0
set_location_assignment PIN_J10 -to VGA_G[1]
set_location_assignment PIN_J10 -to VGA_G_1
set_location_assignment PIN_H12 -to VGA_G[2]
set_location_assignment PIN_H12 -to VGA_G_2
set_location_assignment PIN_G10 -to VGA_G[3]
set_location_assignment PIN_G10 -to VGA_G_3
set_location_assignment PIN_G11 -to VGA_G[4]
set_location_assignment PIN_G11 -to VGA_G_4
set_location_assignment PIN_G12 -to VGA_G[5]
set_location_assignment PIN_G12 -to VGA_G_5
set_location_assignment PIN_F11 -to VGA_G[6]
set_location_assignment PIN_F11 -to VGA_G_6
set_location_assignment PIN_E11 -to VGA_G[7]
set_location_assignment PIN_E11 -to VGA_G_7
set_location_assignment PIN_B11 -to VGA_HS
set_location_assignment PIN_A13 -to VGA_R[0]
set_location_assignment PIN_A13 -to VGA_R_0
set_location_assignment PIN_C13 -to VGA_R[1]
set_location_assignment PIN_C13 -to VGA_R_1
set_location_assignment PIN_E13 -to VGA_R[2]
set_location_assignment PIN_E13 -to VGA_R_2
set_location_assignment PIN_B12 -to VGA_R[3]
set_location_assignment PIN_B12 -to VGA_R_3
set_location_assignment PIN_C12 -to VGA_R[4]
set_location_assignment PIN_C12 -to VGA_R_4
set_location_assignment PIN_D12 -to VGA_R[5]
set_location_assignment PIN_D12 -to VGA_R_5
set_location_assignment PIN_E12 -to VGA_R[6]
set_location_assignment PIN_E12 -to VGA_R_6
set_location_assignment PIN_F13 -to VGA_R[7]
set_location_assignment PIN_F13 -to VGA_R_7
set_location_assignment PIN_C10 -to VGA_SYNC_N
set_location_assignment PIN_D11 -to VGA_VS

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B_4
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B_5
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B_6
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_B_7
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_BLANK_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_CLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G_4
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G_5
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G_6
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_G_7
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_HS
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R_4
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R_5
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R_6
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_R_7
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_SYNC_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to VGA_VS

#============================================================
# HPS
#============================================================
set_location_assignment PIN_B15  -to HPS_CONV_USB_N
set_location_assignment PIN_F26  -to HPS_DDR3_ADDR[0]
set_location_assignment PIN_F26  -to HPS_DDR3_ADDR_0
set_location_assignment PIN_G30  -to HPS_DDR3_ADDR[1]
set_location_assignment PIN_G30  -to HPS_DDR3_ADDR_1
set_location_assignment PIN_F28  -to HPS_DDR3_ADDR[2]
set_location_assignment PIN_F28  -to HPS_DDR3_ADDR_2
set_location_assignment PIN_F30  -to HPS_DDR3_ADDR[3]
set_location_assignment PIN_F30  -to HPS_DDR3_ADDR_3
set_location_assignment PIN_J25  -to HPS_DDR3_ADDR[4]
set_location_assignment PIN_J25  -to HPS_DDR3_ADDR_4
set_location_assignment PIN_J27  -to HPS_DDR3_ADDR[5]
set_location_assignment PIN_J27  -to HPS_DDR3_ADDR_5
set_location_assignment PIN_F29  -to HPS_DDR3_ADDR[6]
set_location_assignment PIN_F29  -to HPS_DDR3_ADDR_6
set_location_assignment PIN_E28  -to HPS_DDR3_ADDR[7]
set_location_assignment PIN_E28  -to HPS_DDR3_ADDR_7
set_location_assignment PIN_H27  -to HPS_DDR3_ADDR[8]
set_location_assignment PIN_H27  -to HPS_DDR3_ADDR_8
set_location_assignment PIN_G26  -to HPS_DDR3_ADDR[9]
set_location_assignment PIN_G26  -to HPS_DDR3_ADDR_9
set_location_assignment PIN_D29  -to HPS_DDR3_ADDR[10]
set_location_assignment PIN_D29  -to HPS_DDR3_ADDR_10
set_location_assignment PIN_C30  -to HPS_DDR3_ADDR[11]
set_location_assignment PIN_C30  -to HPS_DDR3_ADDR_11
set_location_assignment PIN_B30  -to HPS_DDR3_ADDR[12]
set_location_assignment PIN_B30  -to HPS_DDR3_ADDR_12
set_location_assignment PIN_C29  -to HPS_DDR3_ADDR[13]
set_location_assignment PIN_C29  -to HPS_DDR3_ADDR_13
set_location_assignment PIN_H25  -to HPS_DDR3_ADDR[14]
set_location_assignment PIN_H25  -to HPS_DDR3_ADDR_14
set_location_assignment PIN_E29  -to HPS_DDR3_BA[0]
set_location_assignment PIN_E29  -to HPS_DDR3_BA_0
set_location_assignment PIN_J24  -to HPS_DDR3_BA[1]
set_location_assignment PIN_J24  -to HPS_DDR3_BA_1
set_location_assignment PIN_J23  -to HPS_DDR3_BA[2]
set_location_assignment PIN_J23  -to HPS_DDR3_BA_2
set_location_assignment PIN_K28  -to HPS_DDR3_DM[0]
set_location_assignment PIN_K28  -to HPS_DDR3_DM_0
set_location_assignment PIN_M28  -to HPS_DDR3_DM[1]
set_location_assignment PIN_M28  -to HPS_DDR3_DM_1
set_location_assignment PIN_R28  -to HPS_DDR3_DM[2]
set_location_assignment PIN_R28  -to HPS_DDR3_DM_2
set_location_assignment PIN_W30  -to HPS_DDR3_DM[3]
set_location_assignment PIN_W30  -to HPS_DDR3_DM_3
set_location_assignment PIN_K23  -to HPS_DDR3_DQ[0]
set_location_assignment PIN_K23  -to HPS_DDR3_DQ_0
set_location_assignment PIN_K22  -to HPS_DDR3_DQ[1]
set_location_assignment PIN_K22  -to HPS_DDR3_DQ_1
set_location_assignment PIN_H30  -to HPS_DDR3_DQ[2]
set_location_assignment PIN_H30  -to HPS_DDR3_DQ_2
set_location_assignment PIN_G28  -to HPS_DDR3_DQ[3]
set_location_assignment PIN_G28  -to HPS_DDR3_DQ_3
set_location_assignment PIN_L25  -to HPS_DDR3_DQ[4]
set_location_assignment PIN_L25  -to HPS_DDR3_DQ_4
set_location_assignment PIN_L24  -to HPS_DDR3_DQ[5]
set_location_assignment PIN_L24  -to HPS_DDR3_DQ_5
set_location_assignment PIN_J30  -to HPS_DDR3_DQ[6]
set_location_assignment PIN_J30  -to HPS_DDR3_DQ_6
set_location_assignment PIN_J29  -to HPS_DDR3_DQ[7]
set_location_assignment PIN_J29  -to HPS_DDR3_DQ_7
set_location_assignment PIN_K26  -to HPS_DDR3_DQ[8]
set_location_assignment PIN_K26  -to HPS_DDR3_DQ_8
set_location_assignment PIN_L26  -to HPS_DDR3_DQ[9]
set_location_assignment PIN_L26  -to HPS_DDR3_DQ_9
set_location_assignment PIN_K29  -to HPS_DDR3_DQ[10]
set_location_assignment PIN_K29  -to HPS_DDR3_DQ_10
set_location_assignment PIN_K27  -to HPS_DDR3_DQ[11]
set_location_assignment PIN_K27  -to HPS_DDR3_DQ_11
set_location_assignment PIN_M26  -to HPS_DDR3_DQ[12]
set_location_assignment PIN_M26  -to HPS_DDR3_DQ_12
set_location_assignment PIN_M27  -to HPS_DDR3_DQ[13]
set_location_assignment PIN_M27  -to HPS_DDR3_DQ_13
set_location_assignment PIN_L28  -to HPS_DDR3_DQ[14]
set_location_assignment PIN_L28  -to HPS_DDR3_DQ_14
set_location_assignment PIN_M30  -to HPS_DDR3_DQ[15]
set_location_assignment PIN_M30  -to HPS_DDR3_DQ_15
set_location_assignment PIN_U26  -to HPS_DDR3_DQ[16]
set_location_assignment PIN_U26  -to HPS_DDR3_DQ_16
set_location_assignment PIN_T26  -to HPS_DDR3_DQ[17]
set_location_assignment PIN_T26  -to HPS_DDR3_DQ_17
set_location_assignment PIN_N29  -to HPS_DDR3_DQ[18]
set_location_assignment PIN_N29  -to HPS_DDR3_DQ_18
set_location_assignment PIN_N28  -to HPS_DDR3_DQ[19]
set_location_assignment PIN_N28  -to HPS_DDR3_DQ_19
set_location_assignment PIN_P26  -to HPS_DDR3_DQ[20]
set_location_assignment PIN_P26  -to HPS_DDR3_DQ_20
set_location_assignment PIN_P27  -to HPS_DDR3_DQ[21]
set_location_assignment PIN_P27  -to HPS_DDR3_DQ_21
set_location_assignment PIN_N27  -to HPS_DDR3_DQ[22]
set_location_assignment PIN_N27  -to HPS_DDR3_DQ_22
set_location_assignment PIN_R29  -to HPS_DDR3_DQ[23]
set_location_assignment PIN_R29  -to HPS_DDR3_DQ_23
set_location_assignment PIN_P24  -to HPS_DDR3_DQ[24]
set_location_assignment PIN_P24  -to HPS_DDR3_DQ_24
set_location_assignment PIN_P25  -to HPS_DDR3_DQ[25]
set_location_assignment PIN_P25  -to HPS_DDR3_DQ_25
set_location_assignment PIN_T29  -to HPS_DDR3_DQ[26]
set_location_assignment PIN_T29  -to HPS_DDR3_DQ_26
set_location_assignment PIN_T28  -to HPS_DDR3_DQ[27]
set_location_assignment PIN_T28  -to HPS_DDR3_DQ_27
set_location_assignment PIN_R27  -to HPS_DDR3_DQ[28]
set_location_assignment PIN_R27  -to HPS_DDR3_DQ_28
set_location_assignment PIN_R26  -to HPS_DDR3_DQ[29]
set_location_assignment PIN_R26  -to HPS_DDR3_DQ_29
set_location_assignment PIN_V30  -to HPS_DDR3_DQ[30]
set_location_assignment PIN_V30  -to HPS_DDR3_DQ_30
set_location_assignment PIN_W29  -to HPS_DDR3_DQ[31]
set_location_assignment PIN_W29  -to HPS_DDR3_DQ_31
set_location_assignment PIN_E27  -to HPS_DDR3_CAS_N
set_location_assignment PIN_L29  -to HPS_DDR3_CKE
set_location_assignment PIN_H24  -to HPS_DDR3_CS_N
set_location_assignment PIN_H28  -to HPS_DDR3_ODT
set_location_assignment PIN_D30  -to HPS_DDR3_RAS_N
set_location_assignment PIN_C28  -to HPS_DDR3_WE_N
set_location_assignment PIN_P30  -to HPS_DDR3_RESET_N
set_location_assignment PIN_D27  -to HPS_DDR3_RZQ
set_location_assignment PIN_N18  -to HPS_DDR3_DQS_P[0]
set_location_assignment PIN_N18  -to HPS_DDR3_DQS_P_0
set_location_assignment PIN_M19  -to HPS_DDR3_DQS_N[0]
set_location_assignment PIN_M19  -to HPS_DDR3_DQS_N_0
set_location_assignment PIN_N25  -to HPS_DDR3_DQS_P[1]
set_location_assignment PIN_N25  -to HPS_DDR3_DQS_P_1
set_location_assignment PIN_N24  -to HPS_DDR3_DQS_N[1]
set_location_assignment PIN_N24  -to HPS_DDR3_DQS_N_1
set_location_assignment PIN_R19  -to HPS_DDR3_DQS_P[2]
set_location_assignment PIN_R19  -to HPS_DDR3_DQS_P_2
set_location_assignment PIN_R18  -to HPS_DDR3_DQS_N[2]
set_location_assignment PIN_R18  -to HPS_DDR3_DQS_N_2
set_location_assignment PIN_R22  -to HPS_DDR3_DQS_P[3]
set_location_assignment PIN_R22  -to HPS_DDR3_DQS_P_3
set_location_assignment PIN_R21  -to HPS_DDR3_DQS_N[3]
set_location_assignment PIN_R21  -to HPS_DDR3_DQS_N_3
set_location_assignment PIN_M23  -to HPS_DDR3_CK_P
set_location_assignment PIN_L23  -to HPS_DDR3_CK_N
set_location_assignment PIN_H19  -to HPS_ENET_GTX_CLK
set_location_assignment PIN_C19  -to HPS_ENET_INT_N
set_location_assignment PIN_B21  -to HPS_ENET_MDC
set_location_assignment PIN_E21  -to HPS_ENET_MDIO
set_location_assignment PIN_G20  -to HPS_ENET_RX_CLK
set_location_assignment PIN_A21  -to HPS_ENET_RX_DATA[0]
set_location_assignment PIN_A21  -to HPS_ENET_RX_DATA_0
set_location_assignment PIN_B20  -to HPS_ENET_RX_DATA[1]
set_location_assignment PIN_B20  -to HPS_ENET_RX_DATA_1
set_location_assignment PIN_B18  -to HPS_ENET_RX_DATA[2]
set_location_assignment PIN_B18  -to HPS_ENET_RX_DATA_2
set_location_assignment PIN_D21  -to HPS_ENET_RX_DATA[3]
set_location_assignment PIN_D21  -to HPS_ENET_RX_DATA_3
set_location_assignment PIN_K17  -to HPS_ENET_RX_DV
set_location_assignment PIN_F20  -to HPS_ENET_TX_DATA[0]
set_location_assignment PIN_F20  -to HPS_ENET_TX_DATA_0
set_location_assignment PIN_J19  -to HPS_ENET_TX_DATA[1]
set_location_assignment PIN_J19  -to HPS_ENET_TX_DATA_1
set_location_assignment PIN_F21  -to HPS_ENET_TX_DATA[2]
set_location_assignment PIN_F21  -to HPS_ENET_TX_DATA_2
set_location_assignment PIN_F19  -to HPS_ENET_TX_DATA[3]
set_location_assignment PIN_F19  -to HPS_ENET_TX_DATA_3
set_location_assignment PIN_A20  -to HPS_ENET_TX_EN
set_location_assignment PIN_C20  -to HPS_FLASH_DATA[0]
set_location_assignment PIN_C20  -to HPS_FLASH_DATA_0
set_location_assignment PIN_H18  -to HPS_FLASH_DATA[1]
set_location_assignment PIN_H18  -to HPS_FLASH_DATA_1
set_location_assignment PIN_A19  -to HPS_FLASH_DATA[2]
set_location_assignment PIN_A19  -to HPS_FLASH_DATA_2
set_location_assignment PIN_E19  -to HPS_FLASH_DATA[3]
set_location_assignment PIN_E19  -to HPS_FLASH_DATA_3
set_location_assignment PIN_D19  -to HPS_FLASH_DCLK
set_location_assignment PIN_A18  -to HPS_FLASH_NCSO
set_location_assignment PIN_B22  -to HPS_GSENSOR_INT
set_location_assignment PIN_E23  -to HPS_I2C1_SCLK
set_location_assignment PIN_C24  -to HPS_I2C1_SDAT
set_location_assignment PIN_H23  -to HPS_I2C2_SCLK
set_location_assignment PIN_A25  -to HPS_I2C2_SDAT
set_location_assignment PIN_B26  -to HPS_I2C_CONTROL
set_location_assignment PIN_G21  -to HPS_KEY_N
set_location_assignment PIN_A24  -to HPS_LED
set_location_assignment PIN_H17  -to HPS_LTC_GPIO
set_location_assignment PIN_A16  -to HPS_SD_CLK
set_location_assignment PIN_F18  -to HPS_SD_CMD
set_location_assignment PIN_G18  -to HPS_SD_DATA[0]
set_location_assignment PIN_G18  -to HPS_SD_DATA_0
set_location_assignment PIN_C17  -to HPS_SD_DATA[1]
set_location_assignment PIN_C17  -to HPS_SD_DATA_1
set_location_assignment PIN_D17  -to HPS_SD_DATA[2]
set_location_assignment PIN_D17  -to HPS_SD_DATA_2
set_location_assignment PIN_B16  -to HPS_SD_DATA[3]
set_location_assignment PIN_B16  -to HPS_SD_DATA_3
set_location_assignment PIN_C23  -to HPS_SPIM_CLK
set_location_assignment PIN_E24  -to HPS_SPIM_MISO
set_location_assignment PIN_D22  -to HPS_SPIM_MOSI
set_location_assignment PIN_D24  -to HPS_SPIM_SS
set_location_assignment PIN_B25  -to HPS_UART_RX
set_location_assignment PIN_C25  -to HPS_UART_TX
set_location_assignment PIN_N16  -to HPS_USB_CLKOUT
set_location_assignment PIN_E16  -to HPS_USB_DATA[0]
set_location_assignment PIN_E16  -to HPS_USB_DATA_0
set_location_assignment PIN_G16  -to HPS_USB_DATA[1]
set_location_assignment PIN_G16  -to HPS_USB_DATA_1
set_location_assignment PIN_D16  -to HPS_USB_DATA[2]
set_location_assignment PIN_D16  -to HPS_USB_DATA_2
set_location_assignment PIN_D14  -to HPS_USB_DATA[3]
set_location_assignment PIN_D14  -to HPS_USB_DATA_3
set_location_assignment PIN_A15  -to HPS_USB_DATA[4]
set_location_assignment PIN_A15  -to HPS_USB_DATA_4
set_location_assignment PIN_C14  -to HPS_USB_DATA[5]
set_location_assignment PIN_C14  -to HPS_USB_DATA_5
set_location_assignment PIN_D15  -to HPS_USB_DATA[6]
set_location_assignment PIN_D15  -to HPS_USB_DATA_6
set_location_assignment PIN_M17  -to HPS_USB_DATA[7]
set_location_assignment PIN_M17  -to HPS_USB_DATA_7
set_location_assignment PIN_E14  -to HPS_USB_DIR
set_location_assignment PIN_A14  -to HPS_USB_NXT
set_location_assignment PIN_C15  -to HPS_USB_STP

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_CONV_USB_N
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR[0]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR_0
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR[1]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR_1
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR[2]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR_2
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR[3]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR_3
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR[4]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR_4
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR[5]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR_5
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR[6]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR_6
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR[7]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR_7
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR[8]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR_8
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR[9]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR_9
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR[10]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR_10
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR[11]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR_11
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR[12]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR_12
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR[13]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR_13
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR[14]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ADDR_14
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_BA[0]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_BA_0
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_BA[1]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_BA_1
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_BA[2]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_BA_2
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DM[0]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DM_0
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DM[1]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DM_1
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DM[2]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DM_2
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DM[3]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DM_3
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[0]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_0
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[1]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_1
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[2]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_2
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[3]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_3
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[4]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_4
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[5]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_5
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[6]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_6
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[7]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_7
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[8]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_8
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[9]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_9
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[10]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_10
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[11]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_11
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[12]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_12
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[13]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_13
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[14]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_14
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[15]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_15
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[16]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_16
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[17]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_17
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[18]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_18
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[19]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_19
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[20]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_20
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[21]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_21
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[22]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_22
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[23]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_23
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[24]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_24
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[25]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_25
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[26]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_26
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[27]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_27
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[28]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_28
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[29]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_29
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[30]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_30
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ[31]
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_DQ_31
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_CAS_N
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_CKE
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_CS_N
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_ODT
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_RAS_N
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_WE_N
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_RESET_N
set_instance_assignment -name IO_STANDARD "SSTL-15 CLASS I" -to HPS_DDR3_RZQ
set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to HPS_DDR3_DQS_P[0]
set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to HPS_DDR3_DQS_P_0
set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to HPS_DDR3_DQS_N[0]
set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to HPS_DDR3_DQS_N_0
set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to HPS_DDR3_DQS_P[1]
set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to HPS_DDR3_DQS_P_1
set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to HPS_DDR3_DQS_N[1]
set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to HPS_DDR3_DQS_N_1
set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to HPS_DDR3_DQS_P[2]
set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to HPS_DDR3_DQS_P_2
set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to HPS_DDR3_DQS_N[2]
set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to HPS_DDR3_DQS_N_2
set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to HPS_DDR3_DQS_P[3]
set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to HPS_DDR3_DQS_P_3
set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to HPS_DDR3_DQS_N[3]
set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to HPS_DDR3_DQS_N_3
set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to HPS_DDR3_CK_P
set_instance_assignment -name IO_STANDARD "DIFFERENTIAL 1.5-V SSTL CLASS I" -to HPS_DDR3_CK_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_GTX_CLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_INT_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_MDC
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_MDIO
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_RX_CLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_RX_DATA[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_RX_DATA_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_RX_DATA[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_RX_DATA_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_RX_DATA[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_RX_DATA_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_RX_DATA[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_RX_DATA_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_RX_DV
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_TX_DATA[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_TX_DATA_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_TX_DATA[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_TX_DATA_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_TX_DATA[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_TX_DATA_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_TX_DATA[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_TX_DATA_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_ENET_TX_EN
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_FLASH_DATA[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_FLASH_DATA_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_FLASH_DATA[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_FLASH_DATA_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_FLASH_DATA[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_FLASH_DATA_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_FLASH_DATA[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_FLASH_DATA_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_FLASH_DCLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_FLASH_NCSO
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_GSENSOR_INT
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_I2C1_SCLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_I2C1_SDAT
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_I2C2_SCLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_I2C2_SDAT
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_I2C_CONTROL
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_KEY_N
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_LED
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_LTC_GPIO
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_SD_CLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_SD_CMD
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_SD_DATA[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_SD_DATA_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_SD_DATA[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_SD_DATA_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_SD_DATA[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_SD_DATA_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_SD_DATA[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_SD_DATA_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_SPIM_CLK
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_SPIM_MISO
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_SPIM_MOSI
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_SPIM_SS
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_UART_RX
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_UART_TX
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_CLKOUT
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_DATA[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_DATA_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_DATA[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_DATA_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_DATA[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_DATA_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_DATA[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_DATA_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_DATA[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_DATA_4
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_DATA[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_DATA_5
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_DATA[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_DATA_6
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_DATA[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_DATA_7
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_DIR
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_NXT
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to HPS_USB_STP

#============================================================
# GPIO_0, GPIO_0 connect to GPIO Default
#============================================================
set_location_assignment PIN_AC18 -to GPIO_0[0]
set_location_assignment PIN_AC18 -to GPIO_0_0
set_location_assignment PIN_Y17  -to GPIO_0[1]
set_location_assignment PIN_Y17  -to GPIO_0_1
set_location_assignment PIN_AD17 -to GPIO_0[2]
set_location_assignment PIN_AD17 -to GPIO_0_2
set_location_assignment PIN_Y18  -to GPIO_0[3]
set_location_assignment PIN_Y18  -to GPIO_0_3
set_location_assignment PIN_AK16 -to GPIO_0[4]
set_location_assignment PIN_AK16 -to GPIO_0_4
set_location_assignment PIN_AK18 -to GPIO_0[5]
set_location_assignment PIN_AK18 -to GPIO_0_5
set_location_assignment PIN_AK19 -to GPIO_0[6]
set_location_assignment PIN_AK19 -to GPIO_0_6
set_location_assignment PIN_AJ19 -to GPIO_0[7]
set_location_assignment PIN_AJ19 -to GPIO_0_7
set_location_assignment PIN_AJ17 -to GPIO_0[8]
set_location_assignment PIN_AJ17 -to GPIO_0_8
set_location_assignment PIN_AJ16 -to GPIO_0[9]
set_location_assignment PIN_AJ16 -to GPIO_0_9
set_location_assignment PIN_AH18 -to GPIO_0[10]
set_location_assignment PIN_AH18 -to GPIO_0_10
set_location_assignment PIN_AH17 -to GPIO_0[11]
set_location_assignment PIN_AH17 -to GPIO_0_11
set_location_assignment PIN_AG16 -to GPIO_0[12]
set_location_assignment PIN_AG16 -to GPIO_0_12
set_location_assignment PIN_AE16 -to GPIO_0[13]
set_location_assignment PIN_AE16 -to GPIO_0_13
set_location_assignment PIN_AF16 -to GPIO_0[14]
set_location_assignment PIN_AF16 -to GPIO_0_14
set_location_assignment PIN_AG17 -to GPIO_0[15]
set_location_assignment PIN_AG17 -to GPIO_0_15
set_location_assignment PIN_AA18 -to GPIO_0[16]
set_location_assignment PIN_AA18 -to GPIO_0_16
set_location_assignment PIN_AA19 -to GPIO_0[17]
set_location_assignment PIN_AA19 -to GPIO_0_17
set_location_assignment PIN_AE17 -to GPIO_0[18]
set_location_assignment PIN_AE17 -to GPIO_0_18
set_location_assignment PIN_AC20 -to GPIO_0[19]
set_location_assignment PIN_AC20 -to GPIO_0_19
set_location_assignment PIN_AH19 -to GPIO_0[20]
set_location_assignment PIN_AH19 -to GPIO_0_20
set_location_assignment PIN_AJ20 -to GPIO_0[21]
set_location_assignment PIN_AJ20 -to GPIO_0_21
set_location_assignment PIN_AH20 -to GPIO_0[22]
set_location_assignment PIN_AH20 -to GPIO_0_22
set_location_assignment PIN_AK21 -to GPIO_0[23]
set_location_assignment PIN_AK21 -to GPIO_0_23
set_location_assignment PIN_AD19 -to GPIO_0[24]
set_location_assignment PIN_AD19 -to GPIO_0_24
set_location_assignment PIN_AD20 -to GPIO_0[25]
set_location_assignment PIN_AD20 -to GPIO_0_25
set_location_assignment PIN_AE18 -to GPIO_0[26]
set_location_assignment PIN_AE18 -to GPIO_0_26
set_location_assignment PIN_AE19 -to GPIO_0[27]
set_location_assignment PIN_AE19 -to GPIO_0_27
set_location_assignment PIN_AF20 -to GPIO_0[28]
set_location_assignment PIN_AF20 -to GPIO_0_28
set_location_assignment PIN_AF21 -to GPIO_0[29]
set_location_assignment PIN_AF21 -to GPIO_0_29
set_location_assignment PIN_AF19 -to GPIO_0[30]
set_location_assignment PIN_AF19 -to GPIO_0_30
set_location_assignment PIN_AG21 -to GPIO_0[31]
set_location_assignment PIN_AG21 -to GPIO_0_31
set_location_assignment PIN_AF18 -to GPIO_0[32]
set_location_assignment PIN_AF18 -to GPIO_0_32
set_location_assignment PIN_AG20 -to GPIO_0[33]
set_location_assignment PIN_AG20 -to GPIO_0_33
set_location_assignment PIN_AG18 -to GPIO_0[34]
set_location_assignment PIN_AG18 -to GPIO_0_34
set_location_assignment PIN_AJ21 -to GPIO_0[35]
set_location_assignment PIN_AJ21 -to GPIO_0_35

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_4
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_5
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_6
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_7
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_8
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_9
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_10
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_11
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_12
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_13
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_14
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_15
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[16]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_16
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[17]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_17
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[18]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_18
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[19]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_19
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[20]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_20
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[21]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_21
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[22]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_22
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[23]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_23
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[24]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_24
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[25]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_25
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[26]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_26
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[27]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_27
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[28]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_28
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[29]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_29
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[30]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_30
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[31]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_31
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[32]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_32
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[33]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_33
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[34]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_34
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0[35]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_0_35

#============================================================
# GPIO_1, GPIO_1 connect to GPIO Default
#============================================================
set_location_assignment PIN_AB17 -to GPIO_1[0]
set_location_assignment PIN_AB17 -to GPIO_1_0
set_location_assignment PIN_AA21 -to GPIO_1[1]
set_location_assignment PIN_AA21 -to GPIO_1_1
set_location_assignment PIN_AB21 -to GPIO_1[2]
set_location_assignment PIN_AB21 -to GPIO_1_2
set_location_assignment PIN_AC23 -to GPIO_1[3]
set_location_assignment PIN_AC23 -to GPIO_1_3
set_location_assignment PIN_AD24 -to GPIO_1[4]
set_location_assignment PIN_AD24 -to GPIO_1_4
set_location_assignment PIN_AE23 -to GPIO_1[5]
set_location_assignment PIN_AE23 -to GPIO_1_5
set_location_assignment PIN_AE24 -to GPIO_1[6]
set_location_assignment PIN_AE24 -to GPIO_1_6
set_location_assignment PIN_AF25 -to GPIO_1[7]
set_location_assignment PIN_AF25 -to GPIO_1_7
set_location_assignment PIN_AF26 -to GPIO_1[8]
set_location_assignment PIN_AF26 -to GPIO_1_8
set_location_assignment PIN_AG25 -to GPIO_1[9]
set_location_assignment PIN_AG25 -to GPIO_1_9
set_location_assignment PIN_AG26 -to GPIO_1[10]
set_location_assignment PIN_AG26 -to GPIO_1_10
set_location_assignment PIN_AH24 -to GPIO_1[11]
set_location_assignment PIN_AH24 -to GPIO_1_11
set_location_assignment PIN_AH27 -to GPIO_1[12]
set_location_assignment PIN_AH27 -to GPIO_1_12
set_location_assignment PIN_AJ27 -to GPIO_1[13]
set_location_assignment PIN_AJ27 -to GPIO_1_13
set_location_assignment PIN_AK29 -to GPIO_1[14]
set_location_assignment PIN_AK29 -to GPIO_1_14
set_location_assignment PIN_AK28 -to GPIO_1[15]
set_location_assignment PIN_AK28 -to GPIO_1_15
set_location_assignment PIN_AK27 -to GPIO_1[16]
set_location_assignment PIN_AK27 -to GPIO_1_16
set_location_assignment PIN_AJ26 -to GPIO_1[17]
set_location_assignment PIN_AJ26 -to GPIO_1_17
set_location_assignment PIN_AK26 -to GPIO_1[18]
set_location_assignment PIN_AK26 -to GPIO_1_18
set_location_assignment PIN_AH25 -to GPIO_1[19]
set_location_assignment PIN_AH25 -to GPIO_1_19
set_location_assignment PIN_AJ25 -to GPIO_1[20]
set_location_assignment PIN_AJ25 -to GPIO_1_20
set_location_assignment PIN_AJ24 -to GPIO_1[21]
set_location_assignment PIN_AJ24 -to GPIO_1_21
set_location_assignment PIN_AK24 -to GPIO_1[22]
set_location_assignment PIN_AK24 -to GPIO_1_22
set_location_assignment PIN_AG23 -to GPIO_1[23]
set_location_assignment PIN_AG23 -to GPIO_1_23
set_location_assignment PIN_AK23 -to GPIO_1[24]
set_location_assignment PIN_AK23 -to GPIO_1_24
set_location_assignment PIN_AH23 -to GPIO_1[25]
set_location_assignment PIN_AH23 -to GPIO_1_25
set_location_assignment PIN_AK22 -to GPIO_1[26]
set_location_assignment PIN_AK22 -to GPIO_1_26
set_location_assignment PIN_AJ22 -to GPIO_1[27]
set_location_assignment PIN_AJ22 -to GPIO_1_27
set_location_assignment PIN_AH22 -to GPIO_1[28]
set_location_assignment PIN_AH22 -to GPIO_1_28
set_location_assignment PIN_AG22 -to GPIO_1[29]
set_location_assignment PIN_AG22 -to GPIO_1_29
set_location_assignment PIN_AF24 -to GPIO_1[30]
set_location_assignment PIN_AF24 -to GPIO_1_30
set_location_assignment PIN_AF23 -to GPIO_1[31]
set_location_assignment PIN_AF23 -to GPIO_1_31
set_location_assignment PIN_AE22 -to GPIO_1[32]
set_location_assignment PIN_AE22 -to GPIO_1_32
set_location_assignment PIN_AD21 -to GPIO_1[33]
set_location_assignment PIN_AD21 -to GPIO_1_33
set_location_assignment PIN_AA20 -to GPIO_1[34]
set_location_assignment PIN_AA20 -to GPIO_1_34
set_location_assignment PIN_AC22 -to GPIO_1[35]
set_location_assignment PIN_AC22 -to GPIO_1_35

set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[0]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_0
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[1]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_1
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[2]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_2
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[3]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_3
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[4]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_4
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[5]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_5
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[6]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_6
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[7]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_7
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[8]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_8
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[9]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_9
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[10]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_10
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[11]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_11
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[12]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_12
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[13]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_13
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[14]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_14
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[15]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_15
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[16]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_16
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[17]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_17
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[18]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_18
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[19]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_19
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[20]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_20
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[21]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_21
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[22]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_22
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[23]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_23
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[24]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_24
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[25]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_25
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[26]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_26
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[27]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_27
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[28]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_28
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[29]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_29
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[30]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_30
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[31]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_31
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[32]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_32
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[33]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_33
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[34]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_34
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1[35]
set_instance_assignment -name IO_STANDARD "3.3-V LVTTL" -to GPIO_1_35
