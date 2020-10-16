# Script to remove unneeded background services like samba or sshd

## Remove smb
sudo systemctl stop smb && sudo <package manager> remove samba samba-libs smaba-common-tools


## Remove ssh
# RHEL/Fedora
chkconfig sshd off
service sshd stop
dnf erase openssh-server

# Debian
sudo apt-get --purge remove openssh-server

# Now disable access to tcp port 22(ssh) in firewall 
