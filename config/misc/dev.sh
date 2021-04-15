#! /bin/bash
# Setup machine for development

# Setup git repos
mkdir -p $HOME/github/programming-repo
cd $HOME/github/programming-repo || exit
git init
git remote add p https://github.com/NGX123/programming
git pull p master

mkdir -p $HOME/github/tos-repo
cd $HOME/github/tos-repo || exit
git init
git remote add t https://github.com/NGX123/tos
git pull t master
cd $workspace_directory

# Add local binary directory to PATH
[ ! $(cat $HOME/.bashrc | grep 'PATH=$PATH:$HOME/opt/bin') ] && echo 'PATH=$PATH:$HOME/opt/bin' >> $HOME/.bashrc