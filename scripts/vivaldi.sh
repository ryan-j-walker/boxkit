#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
dnf5 upgrade -y
dnf5 install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf5 config-manager setopt fedora-cisco-openh264.enabled=1
dnf5 update @core
dnf5 install -y rpmfusion-\*-appstream-data
dnf5 upgrade -y
dnf5 swap -y ffmpeg-free ffmpeg --allowerasing
dnf5 install -y @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
wget https://downloads.vivaldi.com/stable/vivaldi-stable.x86_64.rpm
dnf5 --nogpgcheck install -y ./vivaldi-stable.x86_64.rpm
rm -f ./vivaldi-stable.x86_64.rpm
grep -v '^#' ./vivaldi.packages | xargs dnf install -y
