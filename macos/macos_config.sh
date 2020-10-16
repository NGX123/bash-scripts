#! /bin/bash

read -p "Is the system updated and xcode is installed from appstore(y/n)?" before_config_check
if [ $before_config_check == n ]
    then
        exit
fi

# Install xcode command line tools
xcode-select --install

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Install cask
brew install cask

# Install other apps
brew cask install visual-studio-code
brew cask install google-chrome
brew cask install transmission
brew cask install iterm2

brew install mpv