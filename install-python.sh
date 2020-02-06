#!/bin/bash
# ZHOU Cheng <c.zhou@live.com>

# Run as root
if [ "$(id -u)" -ne "0" ] ; then
    echo "Please run as root"
    exit
fi

# Set install path
python_path=$(pwd)
read -p "Set python install path (default: ${python_path} ):" path
if [ "${path}" != "" ]; then
  python_path="${path}"
fi
if [[ ! -d "${python_path}" ]]; then
  echo "Create directory: ${python_path}"
  mkdir -p "${python_path}"
fi

# Set python version
python_version="3.8.1"
read -p "Set python version (default: ${python_version} ):" version
if [ "${version}" != "" ]; then
  python_version="${version}"
fi

echo "Python-${python_version} will install on ${python_path}"
cd "${python_path}" || exit 1

echo "Install required packages"
sudo apt update
sudo apt install -y make build-essential libssl-dev zlib1g-dev
sudo apt install -y libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm
sudo apt install -y libncurses5-dev  libncursesw5-dev xz-utils tk-dev

echo "Download python source release"
wget "https://www.python.org/ftp/python/${python_version}/Python-${python_version}.tgz"

echo "Unzip source code"
tar xvf "Python-${python_version}.tgz"

echo "Configure and install Python-${python-version}"
cd "Python-${python_version}" || exit 2
./configure --enable-optimizations
make -j8 && sudo make altinstall && sudo make clean
