#!/bin/sh
# zhoucheng@ldsink.com
set -e

. /etc/lsb-release

# backup current source list
if [ -e "/etc/apt/sources.list" ]; then
    sudo mv /etc/apt/sources.list /etc/apt/sources.list.$(date +%Y%m%d%H%M%S).bak
fi

# set aliyun mirror
sudo cat > /etc/apt/sources.list << EOL
deb http://mirrors.aliyun.com/ubuntu/ $DISTRIB_CODENAME main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ $DISTRIB_CODENAME-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ $DISTRIB_CODENAME-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ $DISTRIB_CODENAME-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ $DISTRIB_CODENAME-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ $DISTRIB_CODENAME main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ $DISTRIB_CODENAME-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ $DISTRIB_CODENAME-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ $DISTRIB_CODENAME-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ $DISTRIB_CODENAME-backports main restricted universe multiverse
EOL
