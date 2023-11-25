#!/usr/bin/env bash
# ZHOU Cheng <c.zhou@live.com>

set -e

# Copy .ssh/authorized_keys to ubuntu user
cp -R /root/.ssh/ /home/ubuntu/ && chown -R ubuntu:ubuntu /home/ubuntu/.ssh/

# Disable sudo password
echo 'ubuntu ALL=(ALL) NOPASSWD: ALL' | EDITOR='tee -a' visudo
