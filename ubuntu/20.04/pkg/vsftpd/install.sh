#!/bin/bash
#
# Download and run the latest release version.
# https://github.com/w3labkr/sh-amp-init
#
# Usage
# git clone https://github.com/w3labkr/sh-amp-init.git
# cd sh-amp-init
# chmod +x ./install.sh
# ./install.sh

# Work even if somebody does "sh thisscript.sh".
set -e

# Print a welcome message.
echo
echo "Installation begins."

# Start installing the package.
apt -y install vsftpd

# Start the package and set it to start on boot.
systemctl reload vsftpd

# Create backup and configuration files.
cp -v /etc/vsftpd.conf{,.bak}
cp -v /etc/ftpusers{,.bak}
cp -v /etc/vsftpd.user_list{,.bak}
cp -v /etc/vsftpd.chroot_list{,.bak}

# Load the changed configuration file.
systemctl reload apache2

# Print a completion message.
echo
echo "Installation is complete."
