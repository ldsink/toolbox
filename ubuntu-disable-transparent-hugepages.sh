#!/bin/bash
# ZHOU Cheng <c.zhou@live.com>
# Disable Transparent Huge Pages (THP) in Ubuntu
# https://docs.mongodb.com/manual/tutorial/transparent-huge-pages/

set -e

# Run as root
if [ "$EUID" -ne 0 ]
then echo "Please run as root"
    exit
fi

# Create the init.d script.
wget https://raw.githubusercontent.com/ldsink/toolbox/master/disable-transparent-hugepages.sh && sudo mv disable-transparent-hugepages.sh /etc/init.d/disable-transparent-hugepages

# Make it executable.
sudo chmod 755 /etc/init.d/disable-transparent-hugepages

# Configure your operating system to run it on boot.
sudo update-rc.d disable-transparent-hugepages defaults

# Test Changes
cat /sys/kernel/mm/transparent_hugepage/enabled
cat /sys/kernel/mm/transparent_hugepage/defrag
