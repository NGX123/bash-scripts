#! /bin/bash

## SCRIPT SETUP ##
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
mkdir -p ~/src ~/opt ~/github ~/.scripts

## Terminal Configurations ##
cp -r ../config/bash/* ~/.scripts
echo '[ -f $HOME/.scripts/color.sh ] && . $HOME/.scripts/color.sh' >> ~/.bashrc
echo '[ -f $HOME/.scripts/bash_aliases.sh ] && . $HOME/.scripts/bash_aliases.sh' >> ~/.bashrc

# GUI Configurations
# GNOME
if [ $de_var == gnome ]; then
    clear
    cat ./script_includes/desktop-enviroments/gnome-config
fi

if [ $de_var == kde ]; then
    clear
    cat ./script_includes/desktop-enviroments/kde-config
fi

if [ $de_var == lxqt ]; then
    clear
    cat ./script_includes/desktop-enviroments/lxqt-config
fi

if [ $de_var == xfce ]; then
    clear
    cat ./script_includes/desktop-enviroments/xfce-config
fi

## Print the final message
echo "
1. $apps_list were installed(they might not be installed if you use apt and one of the packages does not exist in repos, becuase for apt to work all packages supplied at once need to be in the repos)
2. ~/src, ~/opt, ~/github, ~/.scripts folders were made
3. Custom scripts and system config files were added to ~/.scripts
3. Bash aliases and function file inclusions were added to .bashrc
4. Bash color scheme was changed by inclusion of config file in .bashrc

5. (Optional) Bloatware was uninstalled
6. (Optional) Default folders were deleted
7. (Optional) SSH server was removed
"
