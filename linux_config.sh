#! /bin/bash

## USER INPUT
read -p "Package Manager: " pm
read -p "Destktop Environment: " de

## REPOSITORIES ##
# RPM fusion
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf -y update

## INSTALLING PROGRAMMS ##
#Programm Lists
programming=( gcc python3 git )
base=( vlc libreoffice qbittorrent steam stacer )
special=( terminator wireshark clamav clamtk )

#List of programm lists
#lists=( $programming $base $special )

#Installation - to be changed to more effective(one loop)
for item in "${programming[@]}"
do
    sudo $pm install -y $item
done

for item in "${base[@]}"
do
    sudo $pm install -y $item
done

for item in "${special[@]}"
do
    sudo $pm install -y $item
done


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

## REMOVE BLOAT ##
kde_bloat=( calligra-sheets calligra-stage calligra-words dragon juk k3b kamoso kmail kaddressbook kamera kget ktorrent kmahjongg kmines kolourpaint kpat kwalletmanager )

if [ $de == kde ]; then
    for app in "${kde_bloat[@]}"
    do
        sudo $pm remove -y $app
    done
fi
    

## CONFIGURATION ##
#Make Folders
mkdir ~/Files
mkdir ~/Special
mkdir ~/Special/vm
mkdir ~/Special/disk-images
mkdir ~/Special/src
mkdir ~/.scripts
mkdir ~/Files/backups/
mkdir ~/Files/temp
mkdir ~/Files/code 
mkdir ~/Files/github


#Stop Recreation of default folders and remove them
sudo nano /etc/xdg/user-dirs.conf
rm -rf ~/Music ~/Pictures ~/Public ~/Templates ~/Videos

#Customize bash prompt
mv color.sh ~/.scripts 
echo '[ -f $HOME/.scripts/color.sh ] && . $HOME/.scripts/color.sh' >> ~/.bashrc

#Scripts
mv -r scripts/* ~/.scripts

#Aliases file
echo '[ -f $HOME/.scripts/bash_aliases.sh ] && . $HOME/.scripts/bash_aliases.sh' >> ~/.bashrc



## GUI Configuration ##
clear
echo "other changes in changes.txt
Shortcuts = switch desktops - meta + f(num); carry to desktop - ctrl + f(num); terminator - ctrl + alt + T
System settings - Global theme
Configure Desktop -Change Wallapaper
System settings - Energy Saving - Change
System settings - Applications - Change default applications
Screen Locking - change wallpaper, lock time
Panel - Add widget - Icons only task manager
Panel - Configure panel - remove show desktop
Panel - Lock widgets" >> changes.txt
cat changes.txt
