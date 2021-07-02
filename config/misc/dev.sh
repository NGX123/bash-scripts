#! /bin/bash
## Setup machine for development ##
# Setup git repos
mkdir -p $HOME/github
cd $HOME/github || exit
git clone https://github.com/NGX123/programming
git clone https://github.com/NGX123/tos
git clone https://github.com/NGX123/unix
git clone https://github.com/NGX123/notes


# Add local binary directory to PATH - optional
# [ ! $(cat $HOME/.bashrc | grep 'PATH=$PATH:$HOME/opt/bin') ] && echo 'PATH=$PATH:$HOME/opt/bin' >> $HOME/.bashrc
