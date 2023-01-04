#!/usr/bin/env bash
# ZHOU Cheng <c.zhou@live.com>

# swap 文件路径
SWAP_PATH=/swapfile
# swap 文件大小，单位 MiB
SWAP_SIZE=8192

# Run as root
if [ "$(id -u)" -ne "0" ]; then
  echo "Please run as root"
  exit
fi

echo "在路径 ${SWAP_PATH} 创建 ${SWAP_SIZE}MiB 的 swap 文件"
dd if=/dev/zero of=${SWAP_PATH} bs=1M count=8192

echo "更改文件权限为 600"
chmod 600 ${SWAP_PATH}

echo "更改文件属性为 swap"
mkswap ${SWAP_PATH}

echo "启用 swap"
swapon ${SWAP_PATH}

echo "实现 swap 开机自动挂载，将 swap 文件挂载写入/etc/fstab"
echo "${SWAP_PATH} swap swap defaults 0 0" >>/etc/fstab

echo "挂载 swap"
mount -a
