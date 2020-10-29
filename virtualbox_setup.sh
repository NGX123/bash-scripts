#! /bin/bash

read -p "What network to setup NAT/Host-only adapter(1/2): " network_variable

# Messages
touch setup.txt
echo "
Install a Debian in CLI mode" >> setup.txt
> setup.txt
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
        + Virtualbox -> VM -> Settings -> Network -> Adapter 2(enable) -> Host only(name: newly created) -> Press OK
        Add to /etc/network/interfaces
          auto interface-name
          iface interface-name
            address 192.168.56.103/24" >> setup.txt
    fi
fi
echo "
 + Vbox -> VM -> Settings -> Shared Folders -> Add new folder -> Select path to folder, Auto-mount(ON), Mount point(/media/shared_dir)
 + VM -> Devices -> Insert guest iso" >> setup.txt
cat setup.txt

read -p "Is eveything listed done(y/n): " setupdone_variable
if [ $setupdone_variable == n ]
  then
    exit
fi
 


# Setup network
if [ $network_variable == 1 ]
  then
    echo "Nothing to do. Done"
  else
    if [ $network_variable == 2 ]
      then
        su
        apt install sudo
        /sbin/adduser user sudo
        apt install net-tools
        exit
      fi
fi

# Setup shared folders
sudo mkdir /media/shared_dir /media/vbxo_add
sudo mount /dev/cdrom /media/vbox_add && sudo apt install build-essential dkms linux-headers-$(uname -r)
cd /media/vbox_add && sudo ./VBoxLinuxAdditions.run
sudo /sbin/adduser user vboxsf
sudo /sbin/reboot


    
