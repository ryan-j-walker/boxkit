#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm fedora-workstation-repositories
dnf upgrade -y
dnf swap -y ffmpeg-free ffmpeg --allowerasing
dnf upgrade -y
grep -v '^#' ./firefox-toolbox.packages | xargs dnf install -y
