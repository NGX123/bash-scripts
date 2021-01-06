# Includes the code for package managers configuration for main configurations script

### Config for APT ###
if [ $pm_var == apt ]
    then
        # Variables
        inst=install
        rmc=purge
        up=upgrade

        # Update
        sudo apt -y update && sudo apt -y upgrade

        # Install any dependencies
        sudo apt -y install curl wget

        # VS code
        curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
        sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
        sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
        sudo apt-get install apt-transport-https
        sudo apt-get update
        sudo apt-get install code

        # Google Chrome
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo dpkg -i ./google-chrome-stable_current_amd64.deb
        rm ./google-chrome-stable_current_amd64.deb

        # Apps(might not install becuase apt requires all of them to be in repos, otherwise it fails)
        sudo apt-get install -y $apps_list

        # Apps with platform specific names
        sudo apt install -y build-essential linux-headers-$(uname -r)

        # Removing
        if [ $removeSshd_var == y ]
            then
                sudo apt-get --purge remove openssh-server
        fi
fi

## Config for DNF ##
if [ $pm_var == dnf ]
    then
        # Variables
        inst=install
        rmc=remove
        up=update

        # Update
        sudo dnf -y update

        # Dependencies
        sudo dnf -y install curl wget

        # RPM Fusion
        sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
        sudo dnf -y update

        # VS code
        sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
        sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
        sudo dnf -y update
        sudo dnf install -y code

        # Google Chrome
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
        sudo dnf install -y ./google-chrome-stable_current_*.rpm
        rm ./google-chrome-stable_current_*.rpm

        # Apps
        sudo dnf install -y $apps_list

        # Apps with platform specific names
        sudo dnf -y install @development-tools kernel-headers kernel-devel

        # Removing
        if [ $removeSshd_var == y ]
            then
                sudo chkconfig sshd off
                sudo service sshd stop
                sudo dnf erase openssh-server
        fi
fi

## Config for Homebrew ##
if [ $pm_var == brew ]
    then
        # Install xcode command line tools(brew dependency)
        if [ os_var == macos ]
            then
                xcode-select --install
        fi

        # Install homebrew
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

        # Install apps
        brew install binutils diffutils nasm gdb                                # Programming
        brew install cask mpv qemu geany                                        # Install Apps
        brew cask install visual-studio-code transmission iterm2 virtualbox     # Install Cask Apps
        # Note: when installing VBox kernel kext should be allowed - Settings->Security->Allow Oracle...

        echo "
        ------------------------------------------------------
        Install google chrome - https://www.google.com/chrome/
        ------------------------------------------------------
        "
fi