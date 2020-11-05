#! /bin/bash

## CHECK ##
read -p "Is the system updated and xcode is installed from appstore(y/n)?" before_config_check
if [ $before_config_check == n ]
    then
        exit
fi


## INSTALLATIONS ##
# Install xcode command line tools
xcode-select --install

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install cask
brew install cask

# Install other apps
brew cask install visual-studio-code
brew cask install transmission
brew cask install iterm2
brew cask install virtualbox # allow the kext in Settings->Security->Allow Oracle...
brew cask install geany
brew install mpv
brew install qemu

echo "
------------------------------------------------------
Install google chrome - https://www.google.com/chrome/
------------------------------------------------------
"


## OTHER ##
# Folder creation
mkdir -p $HOME/vm $HOME/opt $HOME/src $HOME/.config $HOME/github/tos-repo $HOME/github/programming-repo

# Git configuration
git config --global user.name "NGX123"
git config --global user.email "NGX123"
[ -f ~/.gitconfig ] || echo "
-------------------------------------------------------------------------------
The ~/.gitconfig file was not created, probably the git config commands failed
-------------------------------------------------------------------------------
"

# User message
echo "
---------------------------------------------------------------------------------------------------------
1. Check if VScode, Transmission, iTerm2, Vbox, Geany, MPV, Qemu and Google Chrome were installed
2. Check if vm, opt, src, .config, github folders were created
3. Try pushing commits to private repos to check if macos uses the nickname(NGX123) and not the real name
---------------------------------------------------------------------------------------------------------
"
