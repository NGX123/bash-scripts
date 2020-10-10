# Installs programms for the osdev
read -p "Package Manager: " pm_var

# DNF Installations
if [ $pm_var == dnf ]; then
  # Install the dependencies
  sudo dnf -y install gcc gcc-c++ make bison flex gmp-devel libmpc-devel mpfr-devel texinfo automake autoconf xorriso

  # Packages 
  sudo dnf -y install binutils @development-tools nasm
  
  # Kernel headers(for linux device drivers)
  sudo dnf install kernel-headers kernel-devel
fi

# APT Installations
if [ $pm_var == apt ]; then
  # Kernel headers
  sudo apt -y install linux-headers-(uname -r) # If does not work check "ls -l /usr/src/linux-headers-$(uname -r)"(if does not exist then there are no headers), insetad try to find the latest version if not installed
  
  # Packages 
  sudo apt -y install build-essential nasm binutils
  
  # Dependencies
  sudo apt -y install build-essential bison flex libgmp3-dev libmpc-dev libmpfr-dev texinfo
fi



# i386 CROSS COMPILER
# Create directories to store source and build directory
mkdir -p ~/Special/src/cross-compiler/binutils2.30/build
mkdir -p ~/Special/src/cross-compiler/gcc9.3.0/build

# Download and unpack source code  
cd ~/Special/src/cross-compiler/binutils2.30/
wget https://ftp.gnu.org/gnu/binutils/binutils-2.30.tar.gz
tar -xzf binutils-2.30.tar.gz
rm binutils-2.30.tar.gz

cd ~/Special/src/cross-compiler/gcc9.3.0
wget https://ftp.gnu.org/gnu/gcc/gcc-9.3.0/gcc-9.3.0.tar.gz
tar -xzf gcc-9.3.0.tar.gz
rm gcc-9.3.0.tar.gz


# Get ready for the build
mkdir -p ~/opt/cross-compiler
export PREFIX="$HOME/opt/cross-compiler"
export TARGET=i686-elf
export PATH="$PREFIX/bin:$PATH"


# Building binutils
cd $HOME/Special/src/cross-compiler/binutils2.30/build
../binutils-2.30/configure --target=$TARGET --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make 
make install

# Building GCC
cd $HOME/Special/src/cross-compiler/gcc9.3.0/build
which -- $TARGET-as || echo $TARGET-as is not in the PATH
../gcc-9.3.0/configure --target=$TARGET --prefix="$PREFIX" --disable-nls --enable-language=c,c++ --without-headers
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc




#Check
qemu-system-i386 --version
$HOME/opt/cross-compiler/bin/$TARGET-gcc --version
grub2-mkrescue --version
