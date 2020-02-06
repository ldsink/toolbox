Toolbox
===
* some useful scripts.
* some configuration files.

scripts
---
Based on Debian, for deepin, ubuntu etc.

Description | Script| Usage
---|---|---
安装`MongoDB CE` | [install-mongo-ce.sh](https://raw.githubusercontent.com/ldsink/toolbox/master/install-mongo-ce.sh) | `curl -sSL https://raw.githubusercontent.com/ldsink/toolbox/master/install-mongo-ce.sh \| sudo bash`
安装`Nginx Stable` | [install-nginx-stable.sh](https://raw.githubusercontent.com/ldsink/toolbox/master/install-nginx-stable.sh) | `curl -sSL https://raw.githubusercontent.com/ldsink/toolbox/master/install-nginx-stable.sh \| sudo bash`
安装 PostgreSQL 10 | [install-postgresql-10.sh](https://raw.githubusercontent.com/ldsink/toolbox/master/install-postgresql-10.sh) | `curl -sSL https://raw.githubusercontent.com/ldsink/toolbox/master/install-postgresql-10.sh \| bash`
设置 docker 镜像 | [set-docker-mirror.sh](https://raw.githubusercontent.com/ldsink/toolbox/master/set-docker-mirror.sh) | `curl -sSL https://raw.githubusercontent.com/ldsink/toolbox/master/set-docker-mirror.sh \| sudo bash`
设置 npm 镜像源 | [set-npm-mirror.sh](https://raw.githubusercontent.com/ldsink/toolbox/master/set-npm-mirror.sh) | `curl -sSL https://raw.githubusercontent.com/ldsink/toolbox/master/set-npm-mirror.sh \| bash`
设置 PyPI 镜像源（默认腾讯云，支持豆瓣、阿里云） | [set-pypi-mirror.sh](https://raw.githubusercontent.com/ldsink/toolbox/master/set-pypi-mirror.sh) | `curl -sSL https://raw.githubusercontent.com/ldsink/toolbox/master/set-pypi-mirror.sh \| bash`
设置中国时区(Asia/Shanghai) | [set-timezone-to-shanghai.sh](https://raw.githubusercontent.com/ldsink/toolbox/master/set-timezone-to-shanghai.sh) | `curl -sSL https://raw.githubusercontent.com/ldsink/toolbox/master/set-timezone-to-shanghai.sh \| sudo bash`
`Ubuntu`从root用户初始化ubuntu用户 | [init-ubuntu-user-from-root.sh](https://raw.githubusercontent.com/ldsink/toolbox/master/init-ubuntu-user-from-root.sh) | `curl -sSL https://raw.githubusercontent.com/ldsink/toolbox/master/init-ubuntu-user-from-root.sh \| bash`
`Ubuntu`使用阿里源 | [ubuntu-set-aliyun-mirror.sh](https://raw.githubusercontent.com/ldsink/toolbox/master/ubuntu-set-aliyun-mirror.sh) | `curl -sSL https://raw.githubusercontent.com/ldsink/toolbox/master/ubuntu-set-aliyun-mirror.sh \| sudo bash`
`Ubuntu`使用国内DNS（腾讯DNSPod, 阿里DNS） | [ubuntu-set-dns.sh](https://raw.githubusercontent.com/ldsink/toolbox/master/ubuntu-set-dns.sh) | `curl -sSL https://raw.githubusercontent.com/ldsink/toolbox/master/ubuntu-set-dns.sh \| sudo bash`
`Ubuntu`关闭THP | [ubuntu-disable-transparent-hugepages.sh](https://raw.githubusercontent.com/ldsink/toolbox/master/ubuntu-disable-transparent-hugepages.sh) | `curl -sSL https://raw.githubusercontent.com/ldsink/toolbox/master/ubuntu-disable-transparent-hugepages.sh \| sudo bash`
`Ubuntu`开启BBR（linux kernel 4.9+） | [ubuntu-enable-BBR.sh](https://raw.githubusercontent.com/ldsink/toolbox/master/ubuntu-enable-BBR.sh) | `curl -sSL https://raw.githubusercontent.com/ldsink/toolbox/master/ubuntu-enable-BBR.sh \| sudo bash`

shell command lines
---

Enable `Universe` repository
> sudo add-apt-repository universe

Update and upgrade packages
> sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

Set timezone to shanghai
> sudo timedatectl set-timezone Asia/Shanghai

Nginx reload service
> sudo nginx -t -c /etc/nginx/nginx.conf && sudo service nginx reload

docker-compose
---

* Redis Standalone
* PostgreSQL Standalone
* Jenkins LTS
* Sentry
* ClickHouse
