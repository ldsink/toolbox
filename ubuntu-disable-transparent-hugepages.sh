#!/bin/bash
# ZHOU Cheng <c.zhou@live.com>
# Disable Transparent Huge Pages (THP) in Ubuntu
# https://docs.mongodb.com/manual/tutorial/transparent-huge-pages/

set -e

# Run as root
if [ "$(id -u)" -ne "0" ] ; then
    echo "Please run as root"
    exit
fi

# Create the init.d script.
wget https://raw.githubusercontent.com/ldsink/toolbox/master/disable-transparent-hugepages.sh && sudo mv disable-transparent-hugepages.sh /etc/init.d/disable-transparent-hugepages

# Make it executable.
sudo chmod 755 /etc/init.d/disable-transparent-hugepages

# Configure your operating system to run it on boot.
sudo update-rc.d disable-transparent-hugepages defaults

echo
echo
echo "Success. Please reboot your system to make it works."
echo "You can check the status of THP support by issuing the following commands:"
echo "    cat /sys/kernel/mm/transparent_hugepage/enabled"
echo "    cat /sys/kernel/mm/transparent_hugepage/defrag"
echo "For both files, the correct output resembles:"
echo "    always madvise [never]"
