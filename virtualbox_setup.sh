#! /bin/bash

read -p "What network to setup NAT/Host-only adapter(1/2): " network_variable

echo "
Install a Debian in CLI mode"

touch setup.txt

# Setup network
if [ $network_variable == 1 ]
  then
    echo "
    + Virtualbox -> VM -> Settings -> Network -> Adapter 1 -> Advanced -> Port Forwarding -> Add(+) -> name(ssh), protocol(TCP), host ip(127.0.0.1), host port(any free e.g. 5679), guest ip(10.0.2.15), guest port(22) -> Press OK
    + To SSH from host use - ssh -p 5679 127.0.0.1"
  else
    if [ $network_variable == 2 ]
      then
        echo "
        + Virtualbox -> File -> Host Network Manager -> Add
        + Virtualbox -> VM -> Settings -> Network -> Adapter 2(enable) -> Host only(name: newly created) -> Press OK" >> setup.txt
        su
        apt install sudo
        /sbin/adduser user sudo
        apt install net-tools
        exit
        echo "
        Add to /etc/network/interfaces
          auto interface-name
          iface interface-name
            address 192.168.56.103/24" >> setup.txt
      fi
fi

# Setup shared folders
echo "
 + Vbox -> VM -> Settings -> Shared Folders -> Add new folder -> Select path to folder, Auto-mount(ON), Mount point(/media/shared_dir)
 + VM -> Devices -> Insert guest iso" >> setup.txt
sudo mkdir /media/shared_dir /media/vbxo_add
sudo mount /dev/cdrom /media/vbox_add && sudo apt install build-essential dkms linux-headers-$(uname -r)
cd /media/vbox_add && sudo ./VBoxLinuxAdditions.run
sudo /sbin/adduser user vboxsf

cat setup.txt


    
