#! /bin/bash

# NOTE: To install minimal debian environment when selecting software deselect everything except SSH and standard system utilities

read -p "What is the username: " username_variable

# Add sbin to the path
echo 'PATH=$PATH:/sbin:/usr/sbin' >> $HOME/.bashrc
source $HOME/.bashrc

# Make normal user sudo
su
apt update && apt upgrade
apt install sudo
/sbin/adduser username_variable sudo

# Add non-free repositories
apt-add-repository contrib
apt-add-repository non-free
apt update && sudo apt upgrade
exit