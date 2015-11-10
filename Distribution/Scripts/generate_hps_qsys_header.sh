#!/bin/bash

################################################################################
# generate_hps_qsys_header.sh
#
# Author        : Sahand Kashani-Akhavan from Altera documentation
# Revision      : 1.4
# Creation date : 18/02/2015
###############################################################################

# make sure script is run from its current directory
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
cd "$DIR"

sopc-create-header-files \
"hw/quartus/soc_system.sopcinfo" \
--single "hps_soc_system.h" \
--module "hps_0"

if [ ! -d "sw/hps/application/" ]; then
    mkdir "sw/hps/application/"
fi

mv "hps_soc_system.h" "sw/hps/application/"
