#!/bin/sh
# ZHOU Cheng <c.zhou@live.com>

set -e

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

# default use aliyun mirror
case "$mirror" in
    douban)
        host="pypi.douban.com"
        url="https://pypi.douban.com/simple"
        ;;
    *)
        host="mirrors.aliyun.com"
        url="https://mirrors.aliyun.com/pypi/simple"
        ;;
esac

mkdir -p ~/.pip
cat > ~/.pip/pip.conf << EOF
[global]
trusted-host = ${host}
index-url = ${url}
EOF
