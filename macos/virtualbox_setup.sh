#! /bin/bash

read -p "Do you want to setup NAT adapter(y/n): " network_variable

# Messages
touch setup.txt
> setup.txt

if [ $network_variable == y ]
  then
    echo "
    + Virtualbox -> VM -> Settings -> Network -> Adapter 1 -> Advanced -> Port Forwarding -> Add(+) -> name(ssh), protocol(TCP), host ip(127.0.0.1), host port(any free e.g. 5679), guest ip(10.0.2.15), guest port(22) -> Press OK
    + To SSH from host use - ssh -p 5679 127.0.0.1"
fi
echo "
 + Vbox -> VM -> Settings -> Shared Folders -> Add new folder -> Select path to folder, Auto-mount(ON), Mount point(/media/shared_dir)
 + VM -> Devices -> Insert guest iso
 + VM(Terminal) -> su" >> setup.txt
cat setup.txt

read -p "Is eveything listed done(y/n): " setupdone_variable
if [ $setupdone_variable == n ]
  then
    exit
fi

# Setup shared folders
mkdir /media/shared_dir /media/vbox_add
mount /dev/cdrom /media/vbox_add
apt install build-essential dkms linux-headers-$(uname -r) xorriso
cd /media/vbox_add && ./VBoxLinuxAdditions.run
/sbin/adduser user vboxsf
/sbin/reboot


    
