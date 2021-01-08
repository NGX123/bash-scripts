### Disable suspend
1. Disable sleep and suspend, then reboot, to also disable hibernation add `hibernate.target hybrid-sleep.target`
    *   ```
        sudo system ctl mask sleep.target suspend.target
        reboot
        ```
2. Check for the result - if the services are non active
    *   ```
        systemctl status sleep.target suspend.target # check for result
        ```

### Monitor temperature
* Debian
    *   ```
        sudo apt install hardinfo
        hardinfo -rma devices.so
        ```

### SSH
* Install on Debian
    1.  ```
        sudo apt install -y ssh-server
        sudo systemctl status ssh
        ```
    2. (If on Ubuntu) Allow ssh through the firewall
        *   ```
            sudo ufw allow ssh
            ```
* Remove SSH
    * RHEL
        *   ```
            chkconfig sshd off
            service sshd stop
            sudo dnf remove openssh-server
            ```
    * Debian
        *   ```
            sudo apt-get --purge remove openssh-server
            ```

### Partition the disk from command line(replace sd* with the selected drive)
1. List the drives and choose the one to format
    * 	```
        lsblk
        ```
2. Setup Partition Table
    * Setup GPT partition table
        * 	```
            sudo parted /dev/`<sd*>` mklabel gpt
            ```
    *  Setup MBR parition table
        * 	```
            sudo parted /dev/`<sd*>` mklabel msdos
            ```
3. Create a partition on the drive(with size of 100% of it's capacity)
    * 	```
        sudo parted /dev/`<sd*>` -a opt mkpart primary ext4 0% 100%
        ```
4. Format the partition to ext4
    * 	```
        sudo mkfs.ext4 -L `<label>` `</dev/sd*1>`
        ```

### SMB
* [Samba Docs Guide](https://wiki.samba.org/index.php/Setting_up_Samba_as_a_Standalone_Server)
* [Other Guide](https://www.techrepublic.com/article/how-to-set-up-quick-and-easy-file-sharing-with-samba/)
* Setup Samba
    1. Install samba
        * Fedora
            * 	```
                sudo dnf install samba
                ```
        * Ubuntu
            * 	```
                sudo apt install samba
                ```
    2. Make the direcotry for samba share and set the correct permission(Other permissions could be set, but these are recommended). First zero in chmod means it does not recieve the permissions from parent folder
        * 	```
            mkdir -p `</path/to/sambashare/>` && chmod 0770 /path/to/sambashare/>
            ```
    3. Local user should exist to add him to samba, (-M - no homedir) (-s nologin - user with no shell)
        * 	```
            sudo useradd -M -s /sbin/nologin `<username>`
            ```
    4. Enable the new user by adding him a password
        * 	```
            passwd `<username>`
            ```
    5. Add the user to the samba database
        * 	```
            smbpasswd -a `<username>`
            ```
    6. Add group ownership to the direcotry so users can be just added to the group to obtain access
        * 	```
            sudo groupadd `<groupname>` && usermode -aG `<groupname>` `<username>` && chgrp -R `<groupname>` `</path/to/sambashare/>`
            ```
    7. Add the configuration
        * 	```
            sudo nano /etc/samba/smb.conf
            workgroup = WORKGROUP
            [<samba-share-name>]
                comment = Description
                path = </path/to/sambashare/>
                browsable = yes								# Enables windows clients to browse using Explorer
                writable = yes
                read only = no
                create mask = 0770							# Permissions for files created inside
            ```
    8. Enable samba service
        * Fedora
            *	```
                sudo systemctl enable smb && sudo systemctl start smb
                ```
        * Ubuntu
            * 	```
                sudo systemctl restart smbd nmbd
                ```
    9. Connect to `smb://<ip address>/ShareName/` and enter the credentials of users that have access to it
* Remove smb
    *   ```
        sudo systemctl stop smb
        sudo `<package manager>` remove samba
        ```

## Ubuntu Server Configuration
1. Start the live installer in safe graphics mode
2. **Advice:** Select mostly the default options in the ubuntu installer
3. Mount all of the drives(using fstab)
4. Update the system
	* 	```
		sudo apt update && sudo apt upgrade && sudo apt autoremove
		```
5. Remove snaps
6. Setup samba
* **(Optional)** Setup SSH
* **(Optional)** Install the GUI
	* Install xfce4(lightest GUI. Apart from xfce4 package, xubuntu-desktop package is available which includes a lot of software together with the DE)
		* 	```
			sudo apt install xfce4
			```
		* [XFCE Installation Tutorial](https://itsfoss.com/install-xfce-desktop-xubuntu/)
* **Error:** On boot the login prompt might be not shown(seem like freeze)
	* **Fix:** Press enter several times and wait for login prompt to appear