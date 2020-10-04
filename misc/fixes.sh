# Binaries(programms) can't be found, add to .bashrc the following 
export PATH="$PATH:/sbin:/usr/sbin:usr/local/sbin"

# User not in sudoers file - enter the following line as root into terminal and reboot
adduser <username> sudo

# Fedora nvidia drivers
sudo dnf update
sudo dnf install nvidia-akmod
reboot
lsmod | grep nvidia           # check if nvidia modules are running, check if nvidia control panel is an application



# mkdir "folder exists error" - use "-p" option and it will not try to create if already exists(the option also has another effect)
mkdir -p folder...

# rmdir or rm "file/folder exists error" - use "-f" option
rm -rf file/folder...