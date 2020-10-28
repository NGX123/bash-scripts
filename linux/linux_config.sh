#! /bin/bash

# Variables
apps_list="terminator mpv transmission chromium nano"
includesDir_variable=./script_includes
textfilesDir_variable=$includesDir_variable/textfiles
configDir_variable=../config
folderExists=0

# Folder existance checks
[ ! -d $includesDir_variable ] && echo "$includesDir_variable does not exist" && exit
[ ! -d $textfilesDir_variable ] && echo "$textfilesDir_variable does not exist" && exit
[ ! -d $configDir_variable ] && echo "$configDir_variable does not exist" && exit




## SCRIPT SETUP ##
## User input
read -p "Package Manager: " pm_var
read -p "Destktop Environment: " de_var
read -p "Configure install(y/n): " configureInstall_var

# Extra script configuration
if [ $configureInstall_var == y ]
    then
        read -p "Remove bloat(Not recommended for gnome)(y/n): " removeBloat_var
        read -p "Remove Folders(y/n): " removeFldrs_var
        read -p "Remove ssh(y/n): " removeSshd_var
fi

# Package manager local commands code
[ -f $includesDir_variable/package_managers.sh ] && . $includesDir_variable/package_managers.sh




## CONFIGURATION ##
# Make Folders
mkdir -p $HOME/src $HOME/opt/bin $HOME/github $HOME/.scripts

# Add the folder with compiled software to path
echo 'PATH=$PATH:$HOME/opt/bin' >> $HOME/.bashrc

# Terminal Configurations
cp -r $configDir_variable/bash/* $HOME/.scripts
echo '[ -f $HOME/.scripts/color.sh ] && . $HOME/.scripts/color.sh' >> $HOME/.bashrc
echo '[ -f $HOME/.scripts/bash_aliases.sh ] && . $HOME/.scripts/bash_aliases.sh' >> $HOME/.bashrc

# Remove default XDG folders
if [ $removeFldrs_var == y ]
    then
        mkdir -p $HOME/.stdfldrs
        cat $textfilesDir_variable/dirs > $HOME/.config/user-dirs.dirs
        rm -rf $HOME/Music $HOME/Pictures $HOME/Public $HOME/Templates $HOME/Videos
fi




## MESSAGES ##
# GUI Configurations
if [ $de_var == gnome ]
    then
        clear
        cat $textfilesDir_variable/gnome-config
fi

if [ $de_var == kde ]
    then
        clear
        cat $textfilesDir_variable/kde-config
fi

if [ $de_var == lxqt ]
    then
        clear
        cat $textfilesDir_variable/lxqt-config
fi

if [ $de_var == xfce ]
    then
        clear
        cat $textfilesDir_variable/xfce-config
fi

# Print the final message
echo "
1. $apps_list were installed(they might not be installed if you use apt and one of the packages does not exist in repos, becuase for apt to work all packages supplied at once need to be in the repos)
2. ~/src, ~/opt, ~/github, ~/.scripts folders were made
3. Local binary folder was added to PATH
4. Custom scripts and system config files were added to ~/.scripts
5. Bash aliases and function file inclusions were added to .bashrc
6. Bash color scheme was changed by inclusion of config file in .bashrc

1. (Optional) Bloatware was uninstalled
2. (Optional) Default folders were deleted
3. (Optional) SSH server was removed
"
