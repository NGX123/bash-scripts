# File that includes bloat removal code for the main file to run it

if [ $removeBloat_var == y ]; then
    if [ $de_var == kde ]; then
        sudo $pm_var $rmc -y calligra-sheets calligra-stage calligra-words dragon juk k3b kamoso kmail kaddressbook kamera kget ktorrent kmahjongg kmines kolourpaint kpat # kwalletmanager kde-connect kdeconnect konqueror krdc
    fi

    if [ $de_var == gnome ]; then
        sudo $pm_var $rmc -y gnome-maps gnome-screenshot gnome-calendar cheese gnome-contacts rhythmbox totem gnome-weather gnome-photos simple-scan gedit
    fi
fi

## Remove ssh-server
if [ $removeSshd_var == y ]; then
    if [ $pm_var == dnf ]; then
        sudo chkconfig sshd off
        sudo service sshd stop
        sudo dnf erase openssh-server
    fi

    if [ $pm_var == apt ]; then
        sudo apt-get --purge remove openssh-server
    fi
fi

## Default Folders
if [ $removeFldrs_var == y ]; then
    mkdir -p ~/.stdfldrs
    cat ./script_includes/dirs > ~/.config/user-dirs.dirs
    rm -rf ~/Music ~/Pictures ~/Public ~/Templates ~/Videos
fi
