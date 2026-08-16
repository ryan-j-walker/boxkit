#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
dnf upgrade -y

# Install Proton Mail
wget https://proton.me/download/mail/linux/ProtonMail-desktop-beta.rpm
dnf5 install -y ./ProtonMail-desktop-beta.rpm
rm -f ./ProtonMail-desktop-beta.rpm

# Install Proton Pass
wget https://proton.me/download/pass/linux/ProtonPass.rpm
dnf5 install -y ./ProtonPass.rpm
rm -f ./ProtonPass.rpm

grep -v '^#' ./proton-suite.packages | xargs dnf install -y
