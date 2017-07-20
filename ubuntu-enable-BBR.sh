#!/bin/sh
# ZHOU Cheng <c.zhou@live.com>

set -e

echo "----------------------------------------"
echo " Enable Google BBR"
echo " Required: linux kernel 4.9+"
echo "----------------------------------------"

# Run as root
if [ "$EUID" -ne 0 ]
then echo "Please run as root"
    exit
fi

# update system config
sudo cat >> /etc/sysctl.conf << EOL
net.core.default_qdisc=fq
net.ipv4.tcp_congestion_control=bbr
EOL

sysctl -p

sysctl net.ipv4.tcp_available_congestion_control
lsmod | grep bbr