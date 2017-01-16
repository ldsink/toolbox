#!/bin/sh
# zhoucheng@ldsink.com
set -e

MONGODB_VERSION="3.4"

if [ "$EUID" -ne 0 ]
then echo "Please run as root"
    exit
fi

# Import the public key used by the package management system.
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 0C49F3730359A14518585931BC711F9BA15703C6

# Create a list file for MongoDB.
. /etc/lsb-release
echo "deb [ arch=amd64 ] http://repo.mongodb.org/apt/ubuntu $DISTRIB_CODENAME/mongodb-org/$MONGODB_VERSION multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-${MONGODB_VERSION}.list

# Reload local package database.
sudo apt-get update

# Install the MongoDB packages.
sudo apt-get install -y mongodb-org

# Start MongoDB.
sudo service mongod start
