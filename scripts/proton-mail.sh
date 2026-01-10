#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
dnf upgrade -y
wget https://proton.me/download/mail/linux/ProtonMail-desktop-beta.rpm
dnf install -y ./ProtonMail-desktop-beta.rpm
rm -f ProtonMail-desktop-beta.rpm
grep -v '^#' ./proton-mail.packages | xargs dnf install -y
