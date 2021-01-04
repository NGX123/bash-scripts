#! /bin/bash

# To install linux as UEFI:
  # Use 64-bit images
  # Choose UEFI:diskname when booting

# CHECK IF SYSTEM IS INSTALLED AS UEFI #
echo "
--- /sys/firmware/efi existance ---" 
ls /sys/firmware/efi

echo "
--- /boot/efi in fstab ---"
cat /etc/fstab | grep "/boot/efi"

echo "
--- Kernel Log EFI messages"
sudo dmesg | grep "EFI v"

echo "
--- Check EFI vars existance ---"
ls /sys/firmware/efi/vars
ls /sys/firmware/efi/efivars

echo "----------------------------------"

# Check if /sys/firmware/efi exists
[ -d /sys/firmware/efi ] && \
echo "UEFI check \#1: Success - /sys/firmware/efi is present" || \
echo "UEFI check \#1: Fail - /sys/firmware/efi is missing"

echo " "

# Check if /boot/efi partition is mounted
cat /etc/fstab | grep "/boot/efi" > /dev/null && \
echo "UEFI check \#2: Success - /boot/efi mount point present in /etc/fstab" || \
echo "UEFI check \#2: Fail - /boot/efi mount point not found"

echo " "

# Check the kernel log for UEFI boot messages
sudo dmesg | grep "EFI v" > /dev/null && \
echo "UEFI check \#3: Success - EFI found in boot messages" || \
echo "UEFI check \#3: Fail - EFI not found in boot messages"

echo " "

# Check if the EFI variables are present
[ -d /sys/firmware/efi/vars ] || [ -d /sys/firmware/efi/efivars ] &&
echo "UEFI check \#4: Success - EFI vars present" || \
echo "UEFI check \#4: Fail - No EFI vars found"
