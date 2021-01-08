## Disable suspend ##
sudo system ctl mask sleep.target suspend.target # Hibernation(hibernate.target hybrid-sleep.target)
reboot
systemctl status sleep.target suspend.target # check for result


## Setup SSH ##
# Debian-based
sudo apt install -y ssh-server
sudo systemctl status ssh
# sudo ufw allow ssh
sudo systemctl enable ssh


## Monitor temperature ##
sudo apt install hardinfo
hardinfo -rma devices.so


## Remove smb
sudo systemctl stop smb && sudo <package manager> remove samba samba-libs smaba-common-tools


## Remove ssh
# RHEL/Fedora
chkconfig sshd off && service sshd stop && sudo dnf erase openssh-server
# Debian
sudo apt-get --purge remove openssh-server
# Now disable access to tcp port 22(ssh) in firewall 
