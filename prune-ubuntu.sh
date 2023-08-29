#!/usr/bin/env bash
# ZHOU Cheng <c.zhou@live.com>
# Ubuntu Prune

set -e

# Run as root
if [ "$(id -u)" -ne "0" ] ; then
    echo "Please run as root"
    exit
fi

# Purge ubuntu-advantage-tools
apt purge ubuntu-advantage-tools -y

# Disable the dynamic MOTD news service
if [ -f /etc/default/motd-news ]; then
    sed -i -E "s/ENABLED=1/ENABLED=0/g" /etc/default/motd-news
fi