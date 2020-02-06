#!/bin/bash
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
        "https://dockerhub.azk8s.cn",
        "https://reg-mirror.qiniu.com"
    ]
}
EOL

sudo service docker restart
