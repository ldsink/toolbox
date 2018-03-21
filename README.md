toolbox
===
* some useful scripts.
* some configuration files.

- - - 

Description | Script| Usage
---|---|---
`Ubuntu`使用国内DNS（腾讯DNSPod, 阿里DNS） | [SetDNS.sh](https://raw.githubusercontent.com/ldsink/toolbox/master/SetDNS.sh) | `curl -sSL https://raw.githubusercontent.com/ldsink/toolbox/master/SetDNS.sh \| sudo sh`
`Ubuntu`关闭THP | [ubuntu-disable-transparent-hugepages.sh](https://raw.githubusercontent.com/ldsink/toolbox/master/ubuntu-disable-transparent-hugepages.sh) | `curl -sSL https://raw.githubusercontent.com/ldsink/toolbox/master/ubuntu-disable-transparent-hugepages.sh \| sudo sh`
`Ubuntu`开启BBR（linux kernel 4.9+） | [ubuntu-enable-BBR.sh](https://raw.githubusercontent.com/ldsink/toolbox/master/ubuntu-enable-BBR.sh) | `curl -sSL https://raw.githubusercontent.com/ldsink/toolbox/master/ubuntu-enable-BBR.sh \| sudo sh`
`Ubuntu`安装`MongoDB CE` | [ubuntu-install-mongo-ce.sh](https://raw.githubusercontent.com/ldsink/toolbox/master/ubuntu-install-mongo-ce.sh) | `curl -sSL https://raw.githubusercontent.com/ldsink/toolbox/master/ubuntu-install-mongo-ce.sh \| sudo sh`
`Ubuntu`安装`Nginx Stable` | [ubuntu-install-nginx-stable.sh](https://raw.githubusercontent.com/ldsink/toolbox/master/ubuntu-install-nginx-stable.sh) | `curl -sSL https://raw.githubusercontent.com/ldsink/toolbox/master/ubuntu-install-nginx-stable.sh \| sudo sh`
`Ubuntu`使用阿里源 | [ubuntu-set-aliyun-mirror.sh](https://raw.githubusercontent.com/ldsink/toolbox/master/ubuntu-set-aliyun-mirror.sh) | `curl -sSL https://raw.githubusercontent.com/ldsink/toolbox/master/ubuntu-set-aliyun-mirror.sh \| sudo bash`
设置PyPI源（默认阿里，支持豆瓣） | [set-pypi-mirror.sh](https://raw.githubusercontent.com/ldsink/toolbox/master/set-pypi-mirror.sh) | `curl -sSL https://raw.githubusercontent.com/ldsink/toolbox/master/set-pypi-mirror.sh \| sh`
[v2ex](https://www.v2ex.com/)自动签到 | [v2ex_auto_sign.py](https://raw.githubusercontent.com/ldsink/toolbox/master/v2ex_auto_sign.py)| append to crontab `20 */8 * * * /path/to/v2ex_auto_sign.py <username> <password> >> /var/log/v2ex_sign.log`

docker-compose
---
* Redis Standalone
* PostgreSQL Standalone
