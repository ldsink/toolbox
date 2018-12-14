#!/bin/sh
# ZHOU Cheng <c.zhou@live.com>

set -e

# Run as root
if [ "$EUID" -ne 0 ]
then echo "Please run as root"
    exit
fi

# backup current source list
if [ -e "/etc/apt/sources.list" ]; then
    sudo mv /etc/apt/sources.list /etc/apt/sources.list.$(date +%Y%m%d%H%M%S).bak
fi

# set aliyun mirror
sed -i -E "s/deb (ht|f)tp(s?)\:\/\/[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)([a-zA-Z0-9\-\.\?\,\'\/\\\+&amp;%\$#_]*)?\/ubuntu/deb https\:\/\/mirrors\.aliyun\.com\/ubuntu/g" /etc/apt/sources.list
