#!/bin/sh

sopc-create-header-files \
"RTL/quartus/soc_system.sopcinfo" \
--single "hps_soc_system.h" \
--module "hps_0"

mv "hps_soc_system.h" "C/ds5/projects/"
