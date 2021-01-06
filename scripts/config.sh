#! /bin/bash

## Functions ##
fail_function () {             # Called when program fails
    clear
    echo "--- Fail - $1 ---"
    exit
}




## Variables ##
apps_list="terminator mpv transmission firefox \
nasm nano binutils diffutils valgrind clang"
dirs_list="$HOME/src $HOME/opt/bin $HOME/github $HOME/vm/iso $HOME/vm/vms $HOME/.scripts"

includesDir_variable=./include
textfilesDir_variable=$includesDir_variable/textfiles
configDir_variable=../config




## Script setup ##
# Folder existance checks
[ ! -d $includesDir_variable ] && fail_function "$includesDir_variable does not exist"
[ ! -d $textfilesDir_variable ] && fail_function "$textfilesDir_variable does not exist"
[ ! -d $configDir_variable ] && fail_function "$configDir_variable does not exist"

# User input
read -p "OS: " os_var
read -p "Package Manager: " pm_var
read -p "Destktop Environment: " de_var




## System-specific Configuration
# Include platform specific scripts
[ -f $includesDir_variable/"$os_var"_config.sh ] && . $includesDir_variable/"$os_var"_config.sh || fail_function "$includesDir_variable/"$os_var"_config.sh does not exist"                                                 # Distro/platform specific configs
[ $(echo $os_var | grep linux) ] && [ -f $includesDir_variable/global_linux_config.sh ] && . $includesDir_variable/global_linux_config.sh || fail_function "$includesDir_variable/global_linux_config.sh does not exist"    # Configs that apply to all linuxes

# Include package manager script
[ -f $includesDir_variable/package_managers.sh ] && . $includesDir_variable/package_managers.sh || fail_function "$includesDir_variable/package_managers.sh does not exist"




## Cross-platform ##
# Make folders
mkdir -p $dirs_list

# Add local binary directory to PATH
[ ! $(cat $HOME/.bashrc | grep 'PATH=$PATH:$HOME/opt/bin') ] && echo 'PATH=$PATH:$HOME/opt/bin' >> $HOME/.bashrc

# Setup git repos
mkdir -p $HOME/github/programming-repo
cd $HOME/github/programming-repo || fail_function "Can't setup programming-repo"
git init
git remote add p https://github.com/NGX123/programming
git pull p master

mkdir -p $HOME/github/tos-repo
cd $HOME/github/tos-repo || fail_function "Can't setup tos-repo"
git init
git remote add t https://github.com/NGX123/tos
git pull t master




## Script End Messages ##
# GUI Configurations
if [ $de_var != 0 ]
    then
        clear
        echo "--- DE GUI Configuration ---"
        cat $textfilesDir_variable/$de_var-config
fi

# Print the final message
echo "
--- Check if all points were done ---
1. All of the apps were installed by the package manager:
    - On Linux - $apps_list(some or all might not be installed if apt is used becuase it fails if any package is missing)
    - On MacOS - binutils diffutils nasm gdb nano cask mpv qemu geany code transmission iterm2 vbox firefox chrome
2. Following folders were made - $dirs_list
3. Local binary folder was added to PATH
4. Github repos were cloned to ~/github/programming-repo & ~/github/tos-repo
5. On Linux
    - Default folders were removed
    - Custom scripts and system config files were added to ~/.scripts
    - Bash aliases and function file inclusions were added to .bashrc
    - Bash color scheme was changed by inclusion of config file in .bashrc
6. On MacOS
    - Username and email were changed for git

--- To do manually ---
1. Configure the GUI
2. Install all the VMs through QEMU to the ~/vm/vms
