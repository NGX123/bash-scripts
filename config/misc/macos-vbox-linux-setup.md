## Tutorial to setup a linux VM that you can ssh in on MacOS using VBox
### Setup Virtual Machine
- Create a VM - `VirtualBox App -> Machine -> New -> Create the VM, Insert linux ISO and Install Linux`
	* Add a description to the VM - `VirtualBox App -> Linux VM -> Settings -> General -> Description -> Add notes that inlude: Hostname, Username, Password, SSH port(all this data needs to be of the linux VM and not the host, except SSH port which should be the host exposed port(e.g. 64400 and not 22)`
	* Make sure that ssh is installed on the Linux VM
- Setup network - `VirtualBox App -> Linux VM -> Settings -> Network -> Adapter 1 -> Advanced -> Port forwarding -> Add(+) -> Name(SSH), Protocol(TCP), Host IP(127.0.0.1), Host port(64400(Random Port)), Guest IP(10.0.2.15, if problems occur find current IP on VM usin "ip addr"), Guest Port(22) -> Ok`
- Setup Shared Folder - `VirtualBox App -> Linux VM -> Settings -> Shared Folders -> Add(+) -> Path(Select a folder on host), Auto-Mount(On), Mount Point(/media/shared) -> Ok`

### Setup Shared Folders in the linux inside the VM
- Create the folder on the path where the shared direcotry will be mounted - (Terminal in linux in the VM)`sudo mkdir /media/shared`
- Mount and run VBox Guest CD
	* Linux VM Running Window -> Devices -> Insert Guest ISO
	* Mount the guest ISO -> (Terminal in the VM)`sudo mkdir /media/guest && sudo mount /dev/cdrom /media/guest`
	* Run the Guest ISO -> (Terminal in the VM)`cd /media/guest && sudo ./VBoxLinuxAdditions.run && sudo adduser user vboxsf`
- Give user permissions to access the shared directory - `sudo usermod -a -G vboxsf user`
- Reboot -> (Terminal in the VM)`sudo reboot now`

### Usage
- SSH into VM - `ssh -p \<selected host port\> user@127.0.0.1`
- Shared Folder is mounted automatically into /media/shared(this is where the tOS code will be)
