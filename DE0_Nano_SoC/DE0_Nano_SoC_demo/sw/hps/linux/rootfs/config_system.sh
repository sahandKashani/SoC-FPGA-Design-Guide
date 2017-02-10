#!/bin/bash -x

# Configure the locale to have proper language support.
localedef -i en_US -c -f UTF-8 en_US.UTF-8
dpkg-reconfigure locales

# Configure the timezone.
echo "Europe/Zurich" > "/etc/timezone"
dpkg-reconfigure -f noninteractive tzdata

# Set the machine’s hostname.
echo "DE0-Nano-SoC" > "/etc/hostname"
tee "/etc/hosts" >"/dev/null" <<EOF
127.0.0.1   localhost
127.0.1.1   DE0-Nano-SoC
EOF

# Create the “/etc/network/interfaces” file that describes the network
# interfaces available on the board.
tee "/etc/network/interfaces" > "/dev/null" <<EOF
# interfaces(5) file used by ifup(8) and ifdown(8)

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto eth0
iface eth0 inet dhcp
EOF

# DNS configuration for name resolution. We use google's public DNS server here.
sudo tee "/etc/resolv.conf" > "/dev/null" <<EOF
nameserver 8.8.8.8
EOF

# Configure Ubuntu Core to display a login shell on the serial console once the
# kernel boots. We had previously configured U-Boot to supply the command-line
# argument "console=ttyS0,115200" to the linux kernel. This argument instructs
# the kernel to use serial console “ttyS0” as the boot shell, so here we choose
# to use the same serial console for the login shell-
tee "/etc/init/ttyS0.conf" > "/dev/null" <<EOF
# ttyS0 - getty
#
# This service maintains a getty on ttyS0

description "Get a getty on ttyS0"

start on runlevel [2345]
stop on runlevel [016]

respawn

exec /sbin/getty -L 115200 ttyS0 vt102
EOF

# Create a user and a password. In this example, we create a user called
# “sahand” with password "1234". Note that we compute an encrypted version of
# the password, because useradd does not allow plain text passwords to be used
# in non-interactive mode.
username="sahand"
password="1234"
encrypted_password="$(perl -e 'printf("%s\n", crypt($ARGV[0], "password"))' "${password}")"
useradd -m -p "${encrypted_password}" -s "/bin/bash" "${username}"

# Ubuntu requires the admin to be part of the "adm" and "sudo" groups, so add
# the previously-created user to the 2 groups.
addgroup ${username} adm
addgroup ${username} sudo

# Set root password to "1234" (same as previously-created user).
echo -e "${password}\n${password}\n" | passwd root

# Remove "/rootfs_config.sh" from /etc/rc.local to avoid reconfiguring system on
# next boot
tee "/etc/rc.local" > "/dev/null" <<EOF
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.

exit 0
EOF
