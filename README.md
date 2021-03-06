Toolbox
===
* some useful scripts.
* some configuration files.

scripts
---
Based on Debian, for deepin, ubuntu etc.

Description | Script| Usage
---|---|---
安装 Python | [install-python.sh](./install-python.sh) | `curl -sSL https://gitee.com/ldsink/toolbox/raw/master/install-python.sh \| sudo bash`
安装`MongoDB CE` | [install-mongo-ce.sh](./install-mongo-ce.sh) | `curl -sSL https://gitee.com/ldsink/toolbox/raw/master/install-mongo-ce.sh \| sudo bash`
安装`Nginx Stable` | [install-nginx-stable.sh](./install-nginx-stable.sh) | `curl -sSL https://gitee.com/ldsink/toolbox/raw/master/install-nginx-stable.sh \| sudo bash`
安装 PostgreSQL 10 | [install-postgresql-10.sh](./install-postgresql-10.sh) | `curl -sSL https://gitee.com/ldsink/toolbox/raw/master/install-postgresql-10.sh \| bash`
设置 docker 镜像 | [set-docker-mirror.sh](./set-docker-mirror.sh) | `curl -sSL https://gitee.com/ldsink/toolbox/raw/master/set-docker-mirror.sh \| sudo bash`
设置 npm 镜像源 | [set-npm-mirror.sh](./set-npm-mirror.sh) | `curl -sSL https://gitee.com/ldsink/toolbox/raw/master/set-npm-mirror.sh \| bash`
设置 PyPI 镜像源（默认腾讯云，支持豆瓣、阿里云） | [set-pypi-mirror.sh](./set-pypi-mirror.sh) | `curl -sSL https://gitee.com/ldsink/toolbox/raw/master/set-pypi-mirror.sh \| bash`
设置中国时区(Asia/Shanghai) | [set-timezone-to-shanghai.sh](./set-timezone-to-shanghai.sh) | `curl -sSL https://gitee.com/ldsink/toolbox/raw/master/set-timezone-to-shanghai.sh \| sudo bash`
`Ubuntu`从root用户初始化ubuntu用户 | [init-ubuntu-user-from-root.sh](./init-ubuntu-user-from-root.sh) | `curl -sSL https://gitee.com/ldsink/toolbox/raw/master/init-ubuntu-user-from-root.sh \| bash`
`Ubuntu`使用国内源（默认腾讯云，支持阿里云） | [ubuntu-set-mirror.sh](./ubuntu-set-mirror.sh) | `curl -sSL https://gitee.com/ldsink/toolbox/raw/master/ubuntu-set-mirror.sh \| sudo bash`
`Ubuntu`使用国内DNS（腾讯DNSPod, 阿里DNS） | [ubuntu-set-dns.sh](./ubuntu-set-dns.sh) | `curl -sSL https://gitee.com/ldsink/toolbox/raw/master/ubuntu-set-dns.sh \| sudo bash`
`Ubuntu`关闭THP | [ubuntu-disable-transparent-hugepages.sh](./ubuntu-disable-transparent-hugepages.sh) | `curl -sSL https://gitee.com/ldsink/toolbox/raw/master/ubuntu-disable-transparent-hugepages.sh \| sudo bash`
`Ubuntu`开启BBR（linux kernel 4.9+） | [ubuntu-enable-BBR.sh](./ubuntu-enable-BBR.sh) | `curl -sSL https://gitee.com/ldsink/toolbox/raw/master/ubuntu-enable-BBR.sh \| sudo bash`

shell command lines
---

Install Docker
> sudo ./get-docker.sh --mirror Aliyun

Choose default editor
> sudo update-alternatives --config editor

Enable `Universe` repository
> sudo add-apt-repository universe

Update and upgrade packages
> sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y

Set timezone to shanghai
> sudo timedatectl set-timezone Asia/Shanghai

Nginx reload service
> sudo nginx -t -c /etc/nginx/nginx.conf && sudo service nginx reload

Changing your Git author identity [ref](https://www.git-tower.com/learn/git/faq/change-author-name-email)
```shell
git filter-branch --env-filter '
WRONG_EMAIL="cheng@macos.local"
NEW_NAME="ZHOU Cheng"
NEW_EMAIL="c.zhou@live.com"

if [ "$GIT_COMMITTER_EMAIL" = "$WRONG_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$NEW_NAME"
    export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$WRONG_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$NEW_NAME"
    export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags
```

ansible playbooks
---

**TODO**

docker-compose
---

* Redis Standalone
* PostgreSQL Standalone
* Jenkins LTS
* Sentry
* ClickHouse
