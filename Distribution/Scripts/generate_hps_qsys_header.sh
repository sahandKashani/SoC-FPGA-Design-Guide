#!/bin/sh

################################################################################
# generate_hps_qsys.ds
#
# Author        : Sahand Kashani-Akhavan from Altera documentation
# Revision      : 1.1
# Creation date : 18/02/2015
###############################################################################

sopc-create-header-files \
"RTL/quartus/soc_system.sopcinfo" \
--single "hps_soc_system.h" \
--module "hps_0"

mv "hps_soc_system.h" "C/ds5/projects/"
