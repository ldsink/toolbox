Toolbox
===

* some useful scripts.
* some configuration files.

scripts / commands
---

Based on Debian, for deepin, ubuntu etc.

| Description               | Usage                                                              |
|---------------------------|--------------------------------------------------------------------|
| 设置中国时区(Asia/Shanghai)     | `sudo timedatectl set-timezone Asia/Shanghai`                      |
| 选择默认编辑器                   | `sudo update-alternatives --config editor`                         |
| debian 系升级系统              | `sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y` |
| `Ubuntu` 开启 `universe` 仓库 | `sudo add-apt-repository universe`                                 |

shell command lines
---

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

images
---

* [caddy](https://hub.docker.com/_/caddy)

docker compose
---

* Redis Standalone
* PostgreSQL Standalone
* Jenkins LTS
* Sentry
* ClickHouse
