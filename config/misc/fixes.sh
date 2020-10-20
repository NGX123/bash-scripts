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


# Remove snaps
snap list                # currently installed snaps
sudo snap remove program # remove all installed
sudo apt-get purge snapd # remove snap
sudo apt-mark hold snapd # don't install snap with updates
sudo apt autoremove      # remove leftover


# Only one drive(system drive) is present
sudo blkid # List the disks - select the UUID of needed one and copy it
sudo nano /etc/fstab
sudo mkdir /media/folder-name
add line - UUID=COPIED /media/folder-name ext4 rw,user,exec 0 0 
sudo mount -a # if error - undo changes in /etc/fstab
reboot
sudo chown group:user /media/folder-name
