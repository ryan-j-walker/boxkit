#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
wget https://repo.librewolf.net/librewolf.repo -P /etc/yum.repos.d/
dnf upgrade -y
grep -v '^#' ./librewolf.packages | xargs dnf install -y
