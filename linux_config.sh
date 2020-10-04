#! /bin/bash

## Variable Declarations
pm_var = 0
de_var = 0
removeBloat_var = n
removeFldrs_var = n
removeSshd_var = n
configureInstall_var = n
apps_list = (terminator mpv transmission git chromium nano)


## User input
read -p "Package Manager: " pm_var
read -p "Destktop Environment: " de_var
read -p "Configure install(y/n): " configureInstall_var

# Extra script configuration
if [ $configureInstall_var == y ]; then
    read -p "Remove bloat(Not recommended for gnome)(y/n): " removeBloat_var
    read -p "Remove Folders(y/n): " removeFldrs_var
    read -p "Remove ssh(y/n): " removeSshd_var
fi


### Config for APT ###
if [ $pm_var == apt ]; then
    # Variables
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
    sudo apt install -y ${apps_list[*]}

    # Development
    sudo apt install -y binutils build-essential diffutils valgrind
fi

## Config for DNF ##
if [ $pm_var == dnf ]; then
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
    sudo dnf install -y ${apps_list[*]}
    
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
if [ $removeBloat_var == y ]; then 
    if [ $de_var == kde ]; then
        sudo $pm_var $rmc -y calligra-sheets calligra-stage calligra-words dragon juk k3b kamoso kmail kaddressbook kamera kget ktorrent kmahjongg kmines kolourpaint kpat kwalletmanager #kde-connect kdeconnect konqueror krdc
    fi

    if [ $de_var == gnome ]; then
        sudo $pm_var $rmc -y gnome-maps gnome-screenshot gnome-calendar cheese gnome-contacts rhythmbox totem gnome-weather gnome-photos simple-scan gedit
    fi
fi

## Default Folders
if [ $removeFldrs_var == y ]; then
    mkdir ~/.stdfldrs
    cat ./scripts/bash_scripts/dirs > ~/.config/user-dirs.dirs
    rmdir ~/Music ~/Pictures ~/Public ~/Templates ~/Videos
fi

## Remove ssh-server
if [ $removeSshd_var == y ]; then
    if [ $pm_var == dnf ]; then 
        sudo chkconfig sshd off
        sudo service sshd stop
        sudo dnf erase openssh-server
    fi
    
    if [ $pm_var == apt ]; then 
        sudo apt-get --purge remove openssh-server
    fi
fi

# Program configurations
# NANO
if [ $configurenano == y ]; then
    touch .nanorc
    mkdir $HOME/.config/nano
fi

# Gnome GUI
if [ $de_var == gnome ]; then
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
    Details - Default Apps - Set
    
    Extensions(may be needed in some cases)
    TopIcons by ag - adds system tray back
    Desktop Icons by rastersoft/type Desktop icons in Software and find one from(https://gitlab.gnome.org/World/ShellExtensions/desktop-icons)" >> changes.txt
    cat changes.txt
fi


