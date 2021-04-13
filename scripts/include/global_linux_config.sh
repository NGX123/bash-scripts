# Terminal Configurations
mkdir -p $HOME/.scripts
cp -r $configDir_variable/apps/bash/* $HOME/.scripts
[ ! $(cat $HOME/.bashrc | grep '[ -f $HOME/.scripts/bash_aliases.sh ] && . $HOME/.scripts/bash_aliases.sh') ] && echo '[ -f $HOME/.scripts/bash_aliases.sh ] && . $HOME/.scripts/bash_aliases.sh' >> $HOME/.bashrc

# Remove default XDG folders
mkdir -p $HOME/.stdfldrs
cat $textfilesDir_variable/dirs > $HOME/.config/user-dirs.dirs
rm -rf $HOME/Music $HOME/Pictures $HOME/Public $HOME/Templates $HOME/Videos
