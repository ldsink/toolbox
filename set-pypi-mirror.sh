#!/usr/bin/env bash
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
        url="https://pypi.douban.com/simple/"
        ;;
    aliyun)
        host="mirrors.aliyun.com"
        url="https://mirrors.aliyun.com/pypi/simple/"
        ;;
    *)
        host="mirrors.cloud.tencent.com"
        url="https://mirrors.cloud.tencent.com/pypi/simple/"
        ;;
esac

mkdir -p ~/.pip
cat > ~/.pip/pip.conf << EOF
[global]
index-url = ${url}

[install]
trusted-host = ${host}
EOF
