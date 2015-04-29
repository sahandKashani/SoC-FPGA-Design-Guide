#!/bin/bash

################################################################################
# generate_hps_qsys.ds
#
# Author        : Sahand Kashani-Akhavan from Altera documentation
# Revision      : 1.2
# Creation date : 18/02/2015
###############################################################################

# make sure script is run from its current directory
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "$DIR"

sopc-create-header-files \
"RTL/quartus/soc_system.sopcinfo" \
--single "hps_soc_system.h" \
--module "hps_0"

mv "hps_soc_system.h" "C/ds5/projects/"
