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
