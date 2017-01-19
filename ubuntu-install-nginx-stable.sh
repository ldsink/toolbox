#!/usr/bin/env bash
# ZHOU Cheng <c.zhou@live.com>

set -e

# Run as root
if [ "$EUID" -ne 0 ]
then echo "Please run as root"
    exit
fi

. /etc/lsb-release

# add the key used to sign the nginx packages and repository to the apt program keyring.
wget https://nginx.org/keys/nginx_signing.key && sudo apt-key add nginx_signing.key && rm nginx_signing.key

# backup current source list
if [ -e "/etc/apt/sources.list.d/nginx.list" ]; then
    sudo mv /etc/apt/sources.list.d/nginx.list /etc/apt/sources.list.d/nginx.list.$(date +%Y%m%d%H%M%S).bak
fi

# add nginx source list
sudo cat > /etc/apt/sources.list.d/nginx.list << EOL
deb http://nginx.org/packages/ubuntu/ $DISTRIB_CODENAME nginx
deb-src http://nginx.org/packages/ubuntu/ $DISTRIB_CODENAME nginx
EOL

# install nginx stable version
sudo apt update && sudo apt install nginx -y
