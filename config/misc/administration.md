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
    1.   ```
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

### Remove smb
*   ```
    sudo systemctl stop smb
    sudo `<package manager>` remove samba
    ```