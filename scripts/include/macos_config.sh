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
    mkdir -p $HOME/.scripts
    
    cp -r $configDir_variable/apps/bash/* $HOME/.scripts
    
    echo '. $HOME/.bashrc' >> $HOME/.bash_profile
    echo '[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"' >> $HOME/.bash_profile
    
    [ ! $(cat $HOME/.bashrc | grep '. $HOME/.scripts/bash_aliases.sh') ] && echo '[ -f $HOME/.scripts/bash_aliases.sh ] && . $HOME/.scripts/bash_aliases.sh' >> $HOME/.bashrc
    echo 'export CLICOLOR=1' >> $HOME/.bashrc
    echo 'export PS1="\[\e[34m\]\u\[\e[m\]\[\e[34m\]:\[\e[m\]\[\e[32m\]\w\[\e[m\]\[\e[32m\]>\[\e[m\] "' >> $HOME/.bashrc
fi


# User message
# echo "
# ---------------------------------------------------------------------------------------------------------
# 1. Check if VScode, Transmission, iTerm2, Vbox, Geany, MPV, Qemu and Google Chrome were installed
# 2. Check if vm, opt, src, .config, github folders were created
# 3. Try pushing commits to private repos to check if macos uses the nickname(NGX123) and not the real name
# ---------------------------------------------------------------------------------------------------------
# "
