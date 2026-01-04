#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
sh -c "cat > /etc/yum.repos.d/vivaldi.repo <<'EOF'
[repository]
name=LibreWolf Software Repository
baseurl=https://repo.librewolf.net
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://repo.librewolf.net/pubkey.gpg
EOF"
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm fedora-workstation-repositories
dnf upgrade -y
dnf swap -y ffmpeg-free ffmpeg --allowerasing
dnf upgrade -y
grep -v '^#' ./librewolf.packages | xargs dnf install -y
