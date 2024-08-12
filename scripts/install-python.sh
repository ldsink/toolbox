#!/usr/bin/env bash
# ZHOU Cheng <c.zhou@live.com>

if [ "$(id -u)" -ne "0" ]; then
  echo "Please run as root"
  exit
fi

python_path=$(pwd)
read -r -p "Set python install path (default: ${python_path} ):" path
if [ "${path}" != "" ]; then
  python_path="${path}"
fi
if [[ ! -d "${python_path}" ]]; then
  echo "Create directory: ${python_path}"
  mkdir -p "${python_path}"
fi

python_version="3.12.5"
read -r -p "Set python version (default: ${python_version} ):" version
if [ "${version}" != "" ]; then
  python_version="${version}"
fi

echo "Python-${python_version} will install on ${python_path}"
read -r -p "Are you sure? [y/N] " response
if [[ ! "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
  exit 0
fi

cd "${python_path}" || exit 1

installRequiredDependencies() {
  echo "Install required packages"
  if which apt >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y make build-essential libssl-dev zlib1g-dev
    sudo apt install -y libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm
    sudo apt install -y libncurses5-dev libncursesw5-dev xz-utils tk-dev
  elif which dnf >/dev/null 2>&1; then
    dnf update
    dnf install curl gcc openssl-devel bzip2-devel libffi-devel zlib-devel wget make -y
  elif which yum >/dev/null 2>&1; then
    yum update
    yum install curl gcc openssl-devel bzip2-devel libffi-devel zlib-devel wget make -y
  fi
}
installRequiredDependencies

#echo "Download python source release"
#wget "https://www.python.org/ftp/python/${python_version}/Python-${python_version}.tgz"
echo "Download python source release from https://cdn.npmmirror.com/"
wget "https://cdn.npmmirror.com/binaries/python/${python_version}/Python-${python_version}.tgz"

echo "Unzip source code"
tar xvf "Python-${python_version}.tgz"
rm -f "Python-${python_version}.tgz"

echo "Configure and install Python-${python-version}"
cd "Python-${python_version}" || exit 2
./configure --enable-shared --enable-optimizations
make -j8 && sudo make altinstall && sudo make clean
