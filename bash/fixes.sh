# Binaries(programms) can't be found, add to .bashrc the following 
export PATH="$PATH:/sbin:/usr/sbin:usr/local/sbin"

# User not in sudoers file - enter the following line as root into terminal and reboot
adduser <username> sudo

# Fedora nvidia drivers
sudo dnf update
sudo dnf install nvidia-akmod
reboot
lsmod | grep nvidia           # check if nvidia modules are running, check if nvidia control panel is an application
