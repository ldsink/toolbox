#!/usr/bin/env bash
# ZHOU Cheng <c.zhou@live.com>

set -e

if [ "$(id -u)" -ne "0" ] ; then
    echo "Please run as root"
    exit
fi

echo "Install the prerequisites"
apt install curl gnupg2 ca-certificates lsb-release -y

echo "Add the key used to sign the nginx packages and repository to the apt program keyring"
curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add -

echo "Verify that you now have the proper key"
apt-key fingerprint ABF5BD827BD9BF62

echo "Set up the apt repository for stable nginx packages"
echo "deb http://nginx.org/packages/ubuntu `lsb_release -cs` nginx" | tee /etc/apt/sources.list.d/nginx.list

echo "Install nginx stable version"
apt update && apt install nginx -y
