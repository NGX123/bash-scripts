#! /bin/bash

# Messages
touch setup.txt
> setup.txt


echo "
+ Virtualbox -> VM -> Settings -> Network -> Adapter 1 -> Advanced -> Port Forwarding -> Add(+) -> name(ssh), protocol(TCP), host ip(127.0.0.1), host port(any free e.g. 5679), guest ip(10.0.2.15), guest port(22) -> Press OK
+ To SSH from host use - ssh -p 5679 127.0.0.1
+ Vbox -> VM -> Settings -> Shared Folders -> Add new folder -> Select path to folder, Auto-mount(ON), Mount point(/media/shared_dir)
+ VM -> Devices -> Insert guest iso
+ VM(Terminal) -> su
+ VM(Terminal) -> cd ~/media/shared_dir && make toolchain" >> setup.txt
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


    
