## [Ubuntu Server Configuration](https://ubuntu.com/server/docs)
1. Start the live installer in safe graphics mode
2. **Advice:** Select mostly the default options in the ubuntu installer
3. Update the system
    * 	```sh
		sudo apt update && sudo apt upgrade && sudo apt autoremove
		```
4. [Mount all of the drives](#mount-drives)
5. [Remove snaps](#remove-snaps)
6. [Setup samba](#smb)
* **(Optional)** [Setup SSH](#ssh)
* **(Optional)** Install the GUI
	* [Install xfce4](https://itsfoss.com/install-xfce-desktop-xubuntu/) (Lightest GUI. Apart from xfce4 package, xubuntu-desktop package is available which includes a lot of software together with the DE)
		* 	```sh
			sudo apt install xfce4
			```
* **Error:** On boot the login prompt might be not shown(seem like freeze)
	* **Fix:** Press enter several times and wait for login prompt to appear

## Services
### SMB
* [Samba Docs Guide](https://wiki.samba.org/index.php/Setting_up_Samba_as_a_Standalone_Server)
* [Samba Docs Guide 2](https://wiki.samba.org/index.php/Setting_up_a_Share_Using_POSIX_ACLs)
* [Comprehensive Samba Guide](https://www.digitalocean.com/community/tutorials/how-to-set-up-a-samba-share-for-a-small-organization-on-ubuntu-16-04)
* [Samba Setup Basics](https://www.techrepublic.com/article/how-to-set-up-quick-and-easy-file-sharing-with-samba/)
* Setup Samba
    1. Install samba
        * Fedora
            * 	```sh
                sudo dnf install samba
                ```
        * Ubuntu
            * 	```sh
                sudo apt install samba
                ```
    2. **`GROUP`** Add a group to ber owner of SMB directory where all shares dirs are stored, so users can just be added to it to gain access to shares directory
        *   ```sh
            sudo groupadd $SAMBA_GROUP
            sudo groupadd $SAMBA_ADMIN_GROUP
            ```
    3. **`ADMIN`** Add an administrator to own the samba folder(proccess of adding is same as with normal user)
        *   ```sh
            sudo useradd --shell /sbin/nologin --groups $SAMBA_GROUP --groups $SAMBA_ADMIN_GROUP --no-create-home $SAMBA_ADMIN_USER
            passwd $SAMBA_ADMIN_USER
            sudo smbpasswd -a $SAMBA_ADMIN_USER
            sudo smbpasswd -e $SAMBA_ADMIN_USER
            ```
    4. **`USER`** Add a local user as it is required to make a samba user and enable him by adding him a password(needed for use with samba)
        * 	```sh
            sudo useradd --shell /sbin/nologin --groups $SAMBA_GROUP --no-create-home $SAMBA_USER
            passwd $SAMBA_USER
            ```
    5. **`USER`** SMB has it's own password database and only users added to it can try to connect to shares(and then samba determines if they have access), existing unix users should be manually added to this database
        *   ```sh
            sudo smbpasswd -a $SAMBA_USER
            sudo smbpasswd -e $SAMBA_USER
            ```
    6. **`SAMBA`** Create SMB directory to store share dirs and make newly added group the owner for reason above
        *   ```sh
            sudo mkdir -p $SAMBA_DIR
            sudo chown $SAMBA_ADMIN_USER:$SAMBA_GROUP $SAMBA_DIR
	    sudo chmod 0750
            ```
    7. **`SHARE`** Create an Admin only share
        *   ```sh
            sudo mkdir -p $SAMBA_DIR/$ADMIN_SHARE_DIR
            sudo chown $SAMBA_ADMIN_USER:$SAMBA_ADMIN_GROUP $SAMBA_DIR/$ADMIN_SHARE_DIR
            sudo chmod 0700 $SAMBA_DIR/$ADMIN_SHARE_DIR
            ```
    8. **`SHARE`** Make a share dir for everyone and set the permissions so everyone in sambagroup has r/w/x access
        *   ```sh
            sudo mkdir -p $SAMBA_DIR/$EVERYONE_SHARE_DIR
            sudo chown $SAMBA_ADMIN_USER:$SAMBA_GROUP $SAMBA_DIR/$EVERYONE_SHARE_DIR
            sudo chmod 2770 $SAMBA_DIR/$EVERYONE_SHARE_DIR
            ```
    9. Add the configuration
        * 	```sh
            sudo nano /etc/samba/smb.conf

            workgroup = WORKGROUP
            [<everyones-samba-share-name>]
                comment = Description
                path = $SAMBA_DIR/$EVERYONE_SHARE_DIR
                browsable = yes	                # Enables clients to see the share existance
                read only = no                  # Enables write access to the share(same as "writable = yes")
                force create mode = 0660        # Makes files not have execute permissions when created
                force directory mode = 2770     # Make folders be accessible for anything

            [<admin-samba-share-name>]
                comment = Description
                path = $SAMBA_DIR/$ADMIN_SHARE_DIR
                browsable = yes	                # Enables clients to see the share existance
                read only = no                  # Enables write access to the share(same as "writable = yes")
                force create mode = 0660        # Makes files not have execute permissions when created
                force directory mode = 0770     # Make folders be accessible for anything
            ```
    10. Enable samba service
        * RHEL
            *	```sh
                sudo systemctl enable smb && sudo systemctl start smb
                ```
        * Ubuntu
            * 	```sh
                sudo systemctl restart smbd nmbd
                ```
    11. Connect to `smb://<ip address>/ShareName/` and enter the credentials of users that have access to it
* Remove smb
    * Ubuntu
        *   ```sh
            sudo apt purge samba samba-common
            ```

### SSH
* Install on Debian
    1.  ```sh
        sudo apt install -y ssh-server
        sudo systemctl status ssh
        ```
    2. (If on Ubuntu) Allow ssh through the firewall
        *   ```sh
            sudo ufw allow ssh
            ```
* Remove SSH
    * RHEL
        *   ```sh
            chkconfig sshd off
            service sshd stop
            sudo dnf remove openssh-server
            ```
    * Debian
        *   ```sh
            sudo apt-get --purge remove openssh-server
            ```

### Remove snaps
*   ```sh
    snap list                # List installed
    sudo snap remove program # Remove installed packages before removing snap
    sudo apt-get purge snapd
    sudo apt-mark hold snapd
    sudo apt autoremove
    ```

## Hardware
### Partition drives
*Note:* replace sd* with the selected drive
1. List the drives and choose the one to format
    * 	```sh
        lsblk
        ```
2. Setup Partition Table
    * Setup GPT partition table
        * 	```sh
            sudo parted /dev/`<sd*>` mklabel gpt
            ```
    *  Setup MBR parition table
        * 	```sh
            sudo parted /dev/`<sd*>` mklabel msdos
            ```
3. Create a partition on the drive(with size of 100% of it's capacity)
    * 	```sh
        sudo parted /dev/`<sd*>` -a opt mkpart primary ext4 0% 100%
        ```
4. Format the partition to ext4
    * 	```sh
        sudo mkfs.ext4 -L `<label>` `</dev/sd*1>`
        ```

### Mount drives
1. List disks and choose one
    *   ```sh
        sudo lsblk
        ```
2. List disk identifiers and copy UUID of chosen disk
    *   ```sh
        sudo blkid
        ```
3.  ```sh
    sudo mkdir /media/folder-name
    ```
4.  ```sh
    sudo nano /etc/fstab
    ```
5. Add the following line to /etc/fstab - `UUID=COPIED /media/folder-name ext4 defaults 0 0`
6. Check if everything works in fstab, if it does not - undo all changes in fstab
    *   ```sh
        sudo mount -a # if error - undo changes in /etc/fstab
        ```
7. Change ownership and reboot
    *   ```sh
        sudo chown group:user /media/folder-name
        reboot
        ```

### Disable suspend
1. Disable sleep and suspend, then reboot, to also disable hibernation add `hibernate.target hybrid-sleep.target`
    *   ```sh
        sudo system ctl mask sleep.target suspend.target
        reboot
        ```
2. Check for the result - if the services are non active
    *   ```sh
        systemctl status sleep.target suspend.target # check for result
        ```

### Monitor temperature
* Debian
    *   ```sh
        sudo apt install hardinfo
        hardinfo -rma devices.so
        ```

## Other
### Monitor network processes
*   ```sh
    sudo apt install net-tools
    sudo netstat -tunlp
    ```
