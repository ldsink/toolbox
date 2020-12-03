#!/usr/bin/env bash
# ZHOU Cheng <c.zhou@live.com>

# Run as root
if [ "$(id -u)" -ne "0" ] ; then
    echo "Please run as root"
    exit
fi

# update system config
sudo cat > /etc/docker/daemon.json << EOL
{
    "registry-mirrors": [
        "https://hub-mirror.c.163.com",
        "https://mirror.baidubce.com"
    ]
}
EOL

sudo service docker restart
