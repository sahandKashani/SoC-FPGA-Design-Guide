#!/bin/bash -x

# apt sources
# uncomment the "deb" lines (no need to uncomment "deb src" lines)
sudo perl -pi -e 's/^#+\s+(deb\s+http)/$1/g' "/etc/apt/sources.list"

# install software packages required
sudo apt update
sudo apt -y install ssh gdbserver nano

# allow root SSH login with password (needed so we can use ARM DS-5 for remote
# debugging)
sudo perl -pi -e 's/^(PermitRootLogin) without-password$/$1 yes/g' "/etc/ssh/sshd_config"
