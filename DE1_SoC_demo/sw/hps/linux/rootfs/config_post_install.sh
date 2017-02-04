#!/bin/bash -x

# apt sources
# uncomment the "deb" lines (no need to uncomment "deb src" lines)
sudo perl -pi -e 's/^#+\s+(deb\s+http)/$1/g' "/etc/apt/sources.list"

# install software packages required
sudo apt update
sudo apt -y install ssh gdbserver nano
