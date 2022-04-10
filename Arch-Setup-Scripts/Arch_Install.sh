#!/bin/bash

# Author : Ruturajn <nanotiruturaj@gmail.com>
# Copyright (c) 2022, Ruturaj A. Nanoti, All Rights Reserved
# This script installs the base arch system and adds a user

# Defining colours
# BRed="\e[1;31m" 
BGreen="\e[1;32m"
BYellow="\e[1;33m"
# BBlue="\e[1;34m"
End_Colour="\e[0m"

# Setup the system clock
echo -e "${BYellow}[ * ]Setting up the system clock${End_Colour}"
timedatectl set-ntp true

# Partition the disk
## To-Do
read -p "[1;34mEnter the disk that needs to be paritioned:[0m" disk_name
fdisk "${disk_name}" << FDISK_CMDS 
n



+512M
n



+4G
n




t
1
uefi
t
2
swap
FDISK_CMDS

# Making file-systems on each partition
echo -e "${BYellow}[ * ]Writing paritions with filesystems${End_Colour}"
echo ""
echo -e "${BYellow}[ * ]Making the root parition as ext4${End_Colour}"
mkfs.ext4 /dev/sda3
echo -e "${BYellow}[ * ]Making the swap parition${End_Colour}"
mkswap /dev/sda2
echo -e "${BYellow}[ * ]Making the boot parition as fat32${End_Colour}"
mkfs.fat -F 32 /dev/sda1

# Mounting the paritions
echo -e "${BYellow}[ * ]Mounting the paritions"
mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

# Activate the swap parition
echo -e "${BYellow}[ * ]Activating the swap parition${End_Colour}"
swapon /dev/sda2

# Installing base packages with pacstrap
echo -e "${BYellow}[ * ]Installing base packages with pacstrap${End_Colour}"
pacstrap /mnt base base-devel linux linux-firmware grub efibootmgr networkmanager \
intel-ucode

# Generate file-system table with genfstab
echo -e "${BYellow}[ * ]Generating file-system table with UUID${End_Colour}"
genfstab -U /mnt >> /mnt/etc/fstab

# Chroot into the installed base system
echo -e "${BYellow}[ * ]Chroot into the installed base system${End_Colour}"
arch-chroot /mnt

# Setting the timezone
echo -e "${BYellow}[ * ]Setting the Timezone${End_Colour}"
ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

# Syncing hardware clock
echo -e "${BYellow}[ * ]Synchronizing hardware clock to system clock${End_Colour}"
hwclock --systohc

# Uncommenting en_US.UTF-8 UTF-8 in /etc/locale.gen
echo -e "${BYellow}[ * ]Uncommenting en_US.UTF-8 UTF-8 in /etc/locale.gen{End_Colour}"
sed -i "s/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g" /etc/locale.gen

# Generating locale
echo -e "${BYellow}[ * ]Generating locale-gen{End_Colour}"
locale-gen

# Creating locale file and setting the LANG variable
echo -e "${BYellow}[ * ]Creating locale file and setting the LANG variable${End_Colour}"
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

# Creating Host-name
read -p "[1;34mEnter your desired hostname : " host_name
echo "${host_name}" >> /etc/hostname

# Creating password for the root user
echo -e "${BYellow}[ * ]Creating password for the root user${End_Colour}"
passwd

# Enabling parallel downloads for pacman
ehco -e "${BYellow}[ * ]Enabling parallel downloads for pacman${End_Colour}"
sed -i "s/#ParallelDownloads = 5/ParallelDownloads = 8/g" /etc/pacman.conf

# Installing some more packages
echo -e "${BYellow}[ * ]Installing some more packages${End_Colour}"
pacman -S grub efibootmgr networkmanager network-manager-applet dialog \
base-devel linux-headers wpa_supplicant xdg-utils xdg-user-dirs bluez \
bluez-utils cups pulseaudio alsa-utils pavucontrol terminus-font os-prober \
udisks2 ntfs-3g bash-completion nfs-utils avahi openssh rsync xorg-xinit \
xterm xf86-video-vmware firefox gnu-free-fonts noto-fonts ttf-dejavu \
ttf-ubuntu-font-family

# Installing grub bootloader
echo -e "${BYellow}[ * ]Installing grub bootloader${End_Colour}"
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# Enabling services
echo -e "${BYellow}[ * ]Enabling services at boot${End_Colour}"
systemctl enable NetworkManager
systemctl enable cups
systemctl enable bluetooth
systemctl enable avahi-daemon
systemctl enable sshd

# Adding user
echo -e "${BYellow}[ * ]Adding user${End_Colour}"
read -p "[1;34mEnter your desired username : " user_name
useradd -m "${user_name}"
passwd "${user_name}"

# Giving user sudo privileges
echo -e "${BYellow}Giving user sudo privileges[ * ]${End_Colour}"
sed -i "s/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL" /etc/sudoers

# Adding user to wheel group
echo -e "${BYellow}Adding ${user_name} to the wheel group[ * ]${End_Colour}"
usermod -aG wheel "${user_name}"

echo "Defaluts env_reset,pwfeedback" | tee -a /etc/sudoers

# Echo exit chroot and unmount partitions
echo -e "${BYellow}Exit chroot and unmount partitions[ * ]${End_Colour}"
echo -e "${BGreen}The Base Install is done !! Reboot your machine${End_Colour}"
