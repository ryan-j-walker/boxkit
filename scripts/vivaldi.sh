#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
dnf upgrade -y
wget https://downloads.vivaldi.com/stable/vivaldi-stable.x86_64.rpm
dnf --nogpgcheck install -y ./vivaldi-stable.x86_64.rpm
rm -f ./vivaldi-stable.x86_64.rpm
grep -v '^#' ./vivaldi.packages | xargs dnf install -y
