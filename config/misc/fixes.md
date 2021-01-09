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
