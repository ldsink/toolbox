#!/bin/sh
# ZHOU Cheng <c.zhou@live.com>

set -e

if [ "$(id -u)" -ne "0" ] ; then
    echo "Please run as root"
    exit
fi

# Create a source file for PostgreSQL.
echo " deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list

# Add public key
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Reload local package database.
sudo apt update

# Install the PostgreSQL 10.
sudo apt install -y postgresql-10

# Restart service.
sudo service postgresql restart
