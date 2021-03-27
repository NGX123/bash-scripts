# Terminal Configurations
mkdir -p $HOME/.scripts
cp -r $configDir_variable/apps/bash/* $HOME/.scripts
[ ! $(cat $HOME/.bashrc | grep '[ -f $HOME/.scripts/color.sh ] && . $HOME/.scripts/color.sh') ] && echo '[ -f $HOME/.scripts/color.sh ] && . $HOME/.scripts/color.sh' >> $HOME/.bashrc
[ ! $(cat $HOME/.bashrc | grep '[ -f $HOME/.scripts/bash_aliases.sh ] && . $HOME/.scripts/bash_aliases.sh') ] && echo '[ -f $HOME/.scripts/bash_aliases.sh ] && . $HOME/.scripts/bash_aliases.sh' >> $HOME/.bashrc
# PS1="\[\e[34m\]\u\[\e[m\] \[\e[33m\]\w\[\e[m\]\[\e[32m\] \[\e[m\]\[\e[32m\]\\$\[\e[m\] "

# Remove default XDG folders
mkdir -p $HOME/.stdfldrs
cat $textfilesDir_variable/dirs > $HOME/.config/user-dirs.dirs
rm -rf $HOME/Music $HOME/Pictures $HOME/Public $HOME/Templates $HOME/Videos
