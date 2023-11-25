#!/usr/bin/env bash
# ZHOU Cheng <c.zhou@live.com>

set -e

# Run as root
if [ "$(id -u)" -ne "0" ] ; then
    echo "Please run as root"
    exit
fi

mirror=""
while [ $# -gt 0 ]; do
    case "$1" in
        --mirror)
            mirror="$2"
            shift
            ;;
        *)
            echo "Illegal option $1"
            ;;
    esac
    shift $(( $# > 0 ? 1 : 0 ))
done

# backup current source list
if [ -e "/etc/apt/sources.list" ]; then
    sudo cp /etc/apt/sources.list /etc/apt/sources.list.$(date +%Y%m%d%H%M%S).bak
fi

# default use tencent mirror
case "$mirror" in
    aliyun)
        sed -i -E "s/deb (ht|f)tp(s?)\:\/\/[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)([a-zA-Z0-9\-\.\?\,\'\/\\\+&amp;%\$#_]*)?\/ubuntu/deb https\:\/\/mirrors\.aliyun\.com\/ubuntu/g" /etc/apt/sources.list
        ;;
    *)
        sed -i -E "s/deb (ht|f)tp(s?)\:\/\/[0-9a-zA-Z]([-.\w]*[0-9a-zA-Z])*(:(0-9)*)*(\/?)([a-zA-Z0-9\-\.\?\,\'\/\\\+&amp;%\$#_]*)?\/ubuntu/deb https\:\/\/mirrors\.tencent\.com\/ubuntu/g" /etc/apt/sources.list
        ;;
esac
