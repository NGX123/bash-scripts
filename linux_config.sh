#! /bin/bash

## Variables
read -p "Package Manager: " pm
read -p "Destktop Environment: " de
read -p "Remove bloat(Not recommended for gnome)(y/n): " bloat
read -p "Remove Folders(y/n): " fldrs
read -p "Remove ssh(y/n): " sshd_remove
read -p "PM Configuration(y/n): " cnf

apps=(terminator mpv transmission git chromium nano)




## Configuration ##
if [ $cnf == y ]; then
    read -p "Install cmd: " inst
    read -p "Remove cmd: " rmc
    read -p "Update cmd: " up

    sudo $pm -y $up
    sudo $pm $inst -y terminator mpv qbittorrent git chromium
    # sudo $pm $inst -y binutils gcc build-essential diffutils
fi

### Config for APT ###
if [ $pm == apt ]; then
    inst = install
    rmc = purge
    up = upgrade

    sudo apt -y update && sudo apt -y upgrade

    # VS code
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
    sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

    sudo apt-get install apt-transport-https
    sudo apt-get update
    sudo apt-get install code

    # Apps
    sudo apt install -y ${apps[*]}

    # Development
    sudo apt install -y binutils build-essential diffutils valgrind
fi

## Config for DNF ##
if [ $pm == dnf ]; then
    # Variables
    inst = install
    rmc = remove
    up = update
    
    sudo dnf -y update

    # RPM Fusion
    sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
    sudo dnf -y update
    
    # VS code
    sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
    sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
    sudo dnf -y update
    sudo dnf install -y code
    
    # Apps
    sudo dnf install -y ${apps[*]}
    
    # Development
    sudo dnf install -y @development-tools diffutils valgrind
fi




## CONFIGURATION ##
# Make Folders
mkdir ~/Files ~/src ~/.scripts ~/Files/backups/ ~/Files/code ~/Files/github

## Terminal Configurations ##
cp -r ./scripts/* ~/.scripts
echo '[ -f $HOME/.scripts/bash_scripts/color.sh ] && . $HOME/.scripts/bash_scripts/color.sh' >> ~/.bashrc
echo '[ -f $HOME/.scripts/bash_aliases.sh ] && . $HOME/.scripts/bash_aliases.sh' >> ~/.bashrc




### OPTIONAL ###
## Remove Bloat ##
if [ $bloat == y ]; then 
    if [ $de == kde ]; then
        sudo $pm $rmc -y calligra-sheets calligra-stage calligra-words dragon juk k3b kamoso kmail kaddressbook kamera kget ktorrent kmahjongg kmines kolourpaint kpat kwalletmanager #kde-connect kdeconnect konqueror krdc
    fi

    if [ $de == gnome ]; then
        sudo $pm $rmc -y gnome-maps gnome-screenshot gnome-calendar cheese gnome-contacts rhythmbox totem gnome-weather gnome-photos simple-scan gedit
    fi
fi

## Default Folders
if [ $fldrs == y ]; then
    cat ./scripts/bash_scripts/dirs > ~/.config/user-dirs.dirs
    rmdir ~/Music ~/Pictures ~/Public ~/Templates ~/Videos
fi

## Remove ssh-server
if [ $sshd_remove == y ]; then
    if [ $pm == dnf ]; then 
        sudo chkconfig sshd off
        sudo service sshd stop
        sudo dnf erase openssh-server
    fi
    
    if [ $pm == apt ]; then 
        sudo apt-get --purge remove openssh-server
    fi
fi

# Program configurations
# NANO
if [ $configurenano == y ]; then
    touch .nanorc
    mkdir $HOME/.config/nano
fi

#KDE GUI
if [ $de == kde ]; then
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
fi

# Gnome GUI
if [ $de == gnome ]; then
    clear
    echo "
    Tweaks
    General - Suspend when laptop lid is closed, turn off animations
    Appearance - Applications(Adwaita-dark)
    Extensions - Turn off. Install: TopIcons(system tray)
    Keyboard & mouse - Mouse click emulation set to area(OPTIONAL)
    Top Bar - Disable everything
    Windows Titlebars - Titlebar Buttons - Turn on minimize and maximize
    
    
    Settings
    Notifications - manage notifications
    Search - Turn off search(application search stays)
    Privacy - Turn off everything except Screen Lock 
    Power - Automatic suspend, blank screen, dim when inactive
    Devices - Keyboard Shortcuts - super + e = nautilus, ctrl + alt + t = terminator, ctrl + shift + esc = gnome-system monitor, super + f* = switch to workspace *, ctrl + f* = move window to workspace *, ctrl + space = change input language
    Details - Default Apps - Set" >> changes.txt
    cat changes.txt
fi


