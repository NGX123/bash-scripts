# Git configuration
git config --global user.name "NGX123"
git config --global user.email "NGX123"

# Change zsh to bash
bash_installed=n
brew install bash bash-completion
ls /usr/local/bin/bash && \
sudo sh -c "echo '/usr/local/bin/bash' >> /etc/shells" && \
chsh -s /usr/local/bin/bash && \
sudo chsh -s /usr/local/bin/bash && \
bash_installed=y
if [ $bash_installed == y ]
  then
    touch $HOME/.bash_profile $HOME/.bashrc
    echo '[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"' >> $HOME/.bash_profile
    
    mkdir -p $HOME/.scripts
    cp -r $configDir_variable/apps/bash/* $HOME/.scripts
    [ ! $(cat $HOME/.bashrc | grep -q '[ -f $HOME/.scripts/color.sh ] && . $HOME/.scripts/color.sh') ] && echo '[ -f $HOME/.scripts/color.sh ] && . $HOME/.scripts/color.sh' >> $HOME/.bashrc
    [ ! $(cat $HOME/.bashrc | grep -q '[ -f $HOME/.scripts/bash_aliases.sh ] && . $HOME/.scripts/bash_aliases.sh') ] && echo '[ -f $HOME/.scripts/bash_aliases.sh ] && . $HOME/.scripts/bash_aliases.sh' >> $HOME/.bashrc
fi


# User message
# echo "
# ---------------------------------------------------------------------------------------------------------
# 1. Check if VScode, Transmission, iTerm2, Vbox, Geany, MPV, Qemu and Google Chrome were installed
# 2. Check if vm, opt, src, .config, github folders were created
# 3. Try pushing commits to private repos to check if macos uses the nickname(NGX123) and not the real name
# ---------------------------------------------------------------------------------------------------------
# "
