#! /bin/bash

## SCRIPT SETUP ##
## Variable Declarations
apps_list=(terminator mpv transmission git chromium nano)

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

# Package manager local commands code
[ -f ./script_includes/package_managers.sh ] && . ./script_includes/package_managers.sh

# Remove-bloat code
[ -f ./script_includes/remove_bloat.sh ] && . ./script_includes/remove_bloat.sh


## CONFIGURATION ##
# Make Folders
mkdir -p ~/Files ~/src ~/.scripts ~/Files/backups/ ~/Files/code ~/Files/github

## Terminal Configurations ##
cp -r ../scripts/* ~/.scripts
echo '[ -f $HOME/.scripts/bash_scripts/color.sh ] && . $HOME/.scripts/bash_scripts/color.sh' >> ~/.bashrc
echo '[ -f $HOME/.scripts/bash_aliases.sh ] && . $HOME/.scripts/bash_aliases.sh' >> ~/.bashrc

# GUI Configurations
# GNOME
if [ $de_var == gnome ]; then
    clear
    cat ./config/desktop-enviroments/gnome-config
fi


