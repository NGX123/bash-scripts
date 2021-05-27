#! /bin/bash

## Variables ##
apps_list="terminator vlc nano binutils clang cmake make nasm" # firefox(install it with a seperate dnf/apt command as firefox package may have a different name and fail)
dirs_list="$HOME/src $HOME/opt/bin $HOME/github $HOME/vm/iso $HOME/vm/vms $HOME/.scripts"
include_dir=./include
textfiles_dir=$include_dir/textfiles



## Script setup ##
# Folder existance checks
[ -d "$include_dir" ] || exit
[ -d "$textfiles_dir" ] || exit

# Get information about the system #
# Get the OS
current_os="none"
case $(uname -s) in
	Linux*) current_os="linux" ;;
	Darwin*) current_os="macos" ;;
	*) read -p "OS: " current_os ;;
esac

# Get the Desktop Environment
current_de="none"
case "$DESKTOP_SESSION" in
	gnome*) current_de="gnome" ;;
	plasma*) current_de="kde" ;;
	*) read -p "Destktop Environment: " current_de ;;
esac

# Get the Package Manager
read -p "Package Manager: " current_pm



## System-specific Configuration
# Include package manager script or exit if it does not exist
. "$include_dir"/package_management.sh || exit

# Include platform specific scripts
. "$include_dir"/"$current_os"_config.sh || exit                                                                                                                             # Distro/platform specific configs



## Cross-platform ##
# Make folders
mkdir -p $dirs_list

# Change the shell colors
touch ~/.bashrc
echo 'PS1="\[\e[36m\][\[\e[m\]\[\e[34m\]\u\[\e[m\] \[\e[33m\]\w\[\e[m\] \[\e[32m\]\\$\[\e[m\]\[\e[36m\]]\[\e[m\] "' >> ~/.bashrc
# Good PS1 Generator - https://ezprompt.net/



## Script End Messages ##
# GUI Configurations
if [[ "$current_de" != 0 && "$current_os" == "linux" ]]
    then
        clear
        echo "--- DE GUI Configuration ---"
        cat "$textfiles_dir"/$current_de-config.md
    else
        if [ "$current_os" == "macos" ]
            then
                clear
                echo "--- GUI Configuration ---"
                cat "$textfiles_dir"/macos-config.md
        fi
fi

# Print the final message
echo "
--- Check if all points were done ---
1. All of the apps were installed by the package manager:
    - On Linux - $apps_list(some or all might not be installed if apt is used becuase it fails if any package is missing)
    - On MacOS - binutils diffutils nasm gdb nano cask mpv qemu geany code transmission iterm2 vbox firefox chrome
2. Following folders were made - $dirs_listls
3. On Linux
    - Default folders were removed
    - PS1 variable was changed
4. On MacOS
    - Username and email were changed for git

--- To do manually ---
1. Configure the GUI
2. Virtualization
    1. Install QEMU-KVM Virt-Manger
        - Fedora - sudo dnf install @virtualization
        - Ubuntu - sudo apt install -y qemu qemu-kvm libvirt-daemon libvirt-clients bridge-utils virt-manager
    2. Install all the VMs through QEMU to the ~/vm/vms"
