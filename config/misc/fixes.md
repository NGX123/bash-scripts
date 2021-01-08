### Binaries(programms) can't be found
* **Fix:** Add the following to bashrc
    *   ```
        export PATH="$PATH:/sbin:/usr/sbin:usr/local/sbin"
        ```

### User not in sudoers file
* **Fix:** complete the following
    *   ```
        su
        adduser <username> sudo
        reboot
        ```

### Install nvidia drivers
* **Fedora:**
    *   ```
        sudo dnf update
        sudo dnf install nvidia-akmod
        reboot
        lsmod | grep nvidia # check if kernel modules are present
        ```


### Mkdir error "folder exists error"
* **Fix:** use "-p" option(this option also creates all parent dirs if non existant)
    *   ```
        mkdir -p folder...
        ```

### Rm error "file/folder exists error"
* **Fix:** use "-f" option(forces to do the operation)
    *   ```
        rm -rf file/folder...
        ```

### Remove snaps
*   ```
    snap list                # List installed
    sudo snap remove program # Remove installed packages before removing snap
    sudo apt-get purge snapd
    sudo apt-mark hold snapd
    sudo apt autoremove
    ```


### Mount additional drives
1. List disks and choose one
    *   ```
        sudo lsblk
        ```
2. List disk identifiers and copy UUID of chosen disk
    *   ```
        sudo blkid
        ```
3.  ```
    sudo mkdir /media/folder-name
    ```
4.  ```
    sudo nano /etc/fstab
    ```
5. Add the following line to /etc/fstab - `UUID=COPIED /media/folder-name ext4 defaults 0 0`
6. Check if everything works in fstab, if it does not - undo all changes in fstab
    *   ```
        sudo mount -a # if error - undo changes in /etc/fstab
        ```
7. Change ownership and reboot
    *   ```
        sudo chown group:user /media/folder-name
        reboot
        ```
