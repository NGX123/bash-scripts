install_list_var="nasm binutils diffutils valgrind clang gcc"

# Installs programms for the osdev
read -p "Package Manager(dnf, apt, macos): " pm_var

## PACKAGE INSTALLATIONS ##
# DNF Installations
if [ $pm_var == dnf ]
  then
   # Install developer tools and headers
    sudo dnf -y install $install_list_var @development-tools kernel-headers kernel-devel
fi

# APT Installations
if [ $pm_var == apt ]
  then
    # Install developer tools and headers
    sudo apt -y install $install_list_var build-essential linux-headers-$(uname -r)
fi

if [ $pm_var == macos ]
  then
    # Packages
    brew install gdb nasm binutils diffutils
fi
