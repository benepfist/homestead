#!/usr/bin/env bash

echo ">>> Installing Percona Xtrabackup"

PACKAGE="percona-release_0.1-3.$(lsb_release -sc)_all.deb"

# Fetch the percona packages from percona web
sudo wget --quiet ~/. https://repo.percona.com/apt/$PACKAGE

# Install the downloaded package witch dpkg
sudo dpkg -i ~/$PACKAGE

# Update the local cache
sudo apt-get update

# Install the package
sudo apt-get install percona-xtabackup-24

# Remove install package
sudo rm ~/$PACKAGE