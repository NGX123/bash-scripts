#! /bin/bash

# RPM fusion
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# Apps
sudo dnf install -y  terminator
sudo dnf install -y git
sudo dnf install -y gcc
sudo dnf install -y wireshark

sudo dnf install -y vlc
sudo dnf install -y libreoffice
sudo dnf install -y qbittorrent
sudo dnf install -y notepadqq
# VS code
sudo dnf install -y logisim

sudo dnf install -y htop
sudo dnf install -y timeshift
sudo dnf install -y stacer
sudo dnf install -y steam
sudo dnf install -y clamav
sudo dnf install -y clamtk

#Stop Recreation of default folders
sudo nano /etc/xdg/user-dirs.conf

#Make the Directories
rm -rf ~/Music ~/Pictures ~/Public ~/Templates ~/Videos
mkdir ~/Files

mkdir ~/Documents/temp/
mkdir ~/Files/backups/
mkdir ~/Files/code 
mkdir ~/Files/code/c  ~/Files/code/different ~/Files/code/python
mkdir ~/Files/github

#Others
cls
echo other changes in changes.txt
echo Shortcuts = switch desktops - meta + f(num); carry to desktop - ctrl + f(num); terminator - ctrl + alt + T >> changes.txt
echo fancy_bash prompt.sh copy into ~/.bashrc
 
