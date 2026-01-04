#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
sh -c "cat > /etc/yum.repos.d/vivaldi.repo <<'EOF'
[vivaldi]
name=vivaldi
baseurl=https://repo.vivaldi.com/archive/rpm/x86_64
enabled=1
gpgcheck=1
gpgkey=https://repo.vivaldi.com/archive/linux_signing_key.pub
EOF"
dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm fedora-workstation-repositories
dnf upgrade -y
dnf swap -y ffmpeg-free ffmpeg --allowerasing
dnf upgrade -y
grep -v '^#' ./vivaldi.packages | xargs dnf install -y
