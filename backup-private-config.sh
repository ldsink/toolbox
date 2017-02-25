#!/bin/bash
# ZHOU Cheng <c.zhou@live.com>

rm -rf Back
mkdir Back

# 备份 vim 配置文件
cp ~/.vimrc ./Back/.vimrc

# 备份SSH密钥
cp -r ~/.ssh ./Back/.ssh

# 备份hosts文件
cp /etc/hosts ./Back/hosts

# 打包
tar -czvf Back.tar.gz Back 

rm -rf Back
