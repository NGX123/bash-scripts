#! /bin/bash

## REPOSITORIES ##
# RPM fusion
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y update



## APPS ##
sudo dnf install -y terminator
sudo dnf install -y git
sudo dnf install -y gcc
sudo dnf install -y wireshark

#Base
sudo dnf install -y vlc
sudo dnf install -y libreoffice
sudo dnf install -y qbittorrent
sudo dnf install -y notepadqq

#Special 
sudo dnf install -y logisim
sudo dnf install -y htop
sudo dnf install -y stacer
sudo dnf install -y steam
sudo dnf install -y clamav
sudo dnf install -y clamtk



## SPECIAL INSTALLATION ##
# VS code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf -y update
sudo dnf install -y code

#Google chrome
wget -P ~/Downloads https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm 
sudo dnf install -y ~/Downloads/google-chrome*
rm ~/Downloads/google-chrome*



## CONFIGURATION ##
#Stop Recreation of default folders and remove them
sudo nano /etc/xdg/user-dirs.conf
rm -rf ~/Music ~/Pictures ~/Public ~/Templates ~/Videos

#Customize bash prompt
mv color.sh ~/.scripts 
echo '[ -f $HOME/.scripts/color.sh ] && . $HOME/.scripts/color.sh' >> ~/.bashrc

#Make Folders
mkdir ~/Files
mkdir ~/Files/backups/
mkdir ~/Files/temp
mkdir ~/Files/code 
mkdir ~/Files/github
mkdir ~/.scripts



## GUI Configuration ##
clear
echo "other changes in changes.txt"
echo "Shortcuts = switch desktops - meta + f(num); carry to desktop - ctrl + f(num); terminator - ctrl + alt + T" >> changes.txt
echo "System settings - Global theme" >> changes.txt
echo "Panel - Add widget - Icons only task manager" >> changes.txt
echo "Panel - Configure panel - remove show desktop" >> changes.txt
echo "Panel - Lock widgets" >> changes.txt
cat changes.txt
