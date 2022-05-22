#!/bin/bash

# Author : Ruturajn <nanotiruturaj@gmail.com>
# Copyright (c) 2022, Ruturaj A. Nanoti, All Rights Reserved
# This script installs the base Arch system and adds a user

echo -ne "
██████╗ ██╗   ██╗████████╗██╗   ██╗██████╗  █████╗      ██╗███╗   ██╗
██╔══██╗██║   ██║╚══██╔══╝██║   ██║██╔══██╗██╔══██╗     ██║████╗  ██║
██████╔╝██║   ██║   ██║   ██║   ██║██████╔╝███████║     ██║██╔██╗ ██║
██╔══██╗██║   ██║   ██║   ██║   ██║██╔══██╗██╔══██║██   ██║██║╚██╗██║
██║  ██║╚██████╔╝   ██║   ╚██████╔╝██║  ██║██║  ██║╚█████╔╝██║ ╚████║
╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═══╝
=====================================================================

                Arch-Linux Installation Script                       

=====================================================================
"

# Defining colours
BRed="\e[1;31m"
BGreen="\e[1;32m"
BYellow="\e[1;33m"
# BBlue="\e[1;34m"
End_Colour="\e[0m"

# Setup the system clock
echo -e "${BYellow}[ * ]Setting up the system clock${End_Colour}"
timedatectl set-ntp true

# Enabling parallel downloads for pacstrap
echo -e "${BYellow}[ * ]Enabling parallel downloads for pacstrap${End_Colour}"
sed -i "s/#ParallelDownloads = 5/ParallelDownloads = 5/g" /etc/pacman.conf

# Partition the disk
## To-Do
tput setaf 5
lsblk
tput setaf 7
read -rp "[1;34mEnter the disk that needs to be paritioned (/dev/sdX) :[0m" disk_name
if [[ -z ${disk_name} ]]; then
	echo -e "${BRed}[ * ]FATAL : No disk provided to be paritioned, cannot proceed !${End_Colour}"
	exit
fi

# fdisk "${disk_name}" << FDISK_CMDS
# n



# +512M
# n



# +4G
# n




# t
# 1
# uefi
# t
# 2
# swap
# w
# FDISK_CMDS

echo -e "${BYellow}[ * ]Paritioning the disk${End_Colour}"
sgdisk -n 1::+512M -t 1:ef00 "${disk_name}"
sgdisk -n 2::+4G -t 2:8200 "${disk_name}"
sgdisk -n 3::: -t 3:8300 "${disk_name}"

# Making file-systems on each partition
echo -e "${BYellow}[ * ]Writing paritions with filesystems${End_Colour}"
echo ""
echo -e "${BYellow}[ * ]Making the root parition as ext4${End_Colour}"
mkfs.ext4 "${disk_name}3"
echo -e "${BYellow}[ * ]Making the swap parition${End_Colour}"
mkswap "${disk_name}2"
echo -e "${BYellow}[ * ]Making the boot parition as fat32${End_Colour}"
mkfs.fat -F 32 "${disk_name}1"

# Mounting the paritions
echo -e "${BYellow}[ * ]Mounting the paritions"
mount "${disk_name}3" /mnt
mkdir /mnt/boot
mount "${disk_name}1" /mnt/boot

# Activate the swap parition
echo -e "${BYellow}[ * ]Activating the swap parition${End_Colour}"
swapon "${disk_name}2"

# Installing base packages with pacstrap
echo -e "${BYellow}[ * ]Installing base packages with pacstrap${End_Colour}"
read -rp "[1;34mEnter the ucode for your CPU (intel-ucode / amd-ucode):[0m" cpu_code
pacstrap /mnt base base-devel linux linux-firmware grub efibootmgr networkmanager \
	"${cpu_code}"

# Generate file-system table with genfstab
echo -e "${BYellow}[ * ]Generating file-system table with UUID${End_Colour}"
genfstab -U /mnt >>/mnt/etc/fstab

# Chroot into the installed base system
echo -e "${BYellow}[ * ]Chroot into the installed base system${End_Colour}"
#arch-chroot /mnt

# Setting the timezone
echo -e "${BYellow}[ * ]Setting the Timezone${End_Colour}"
arch-chroot /mnt ln -sf /usr/share/zoneinfo/Asia/Kolkata /etc/localtime

# Syncing hardware clock
echo -e "${BYellow}[ * ]Synchronizing hardware clock to system clock${End_Colour}"
arch-chroot /mnt hwclock --systohc

# Uncommenting en_US.UTF-8 UTF-8 in /etc/locale.gen
echo -e "${BYellow}[ * ]Uncommenting en_US.UTF-8 UTF-8 in /etc/locale.gen${End_Colour}"
arch-chroot /mnt sed -i "s/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g" /etc/locale.gen

# Generating locale
echo -e "${BYellow}[ * ]Generating locale-gen${End_Colour}"
arch-chroot /mnt locale-gen

# Creating locale file and setting the LANG variable
echo -e "${BYellow}[ * ]Creating locale file and setting the LANG variable${End_Colour}"
arch-chroot /mnt echo "LANG=en_US.UTF-8" | tee -a /mnt/etc/locale.conf

# Creating Host-name
read -rp "[1;34mEnter your desired hostname:[0m" host_name
arch-chroot /mnt touch /etc/hostname
arch-chroot /mnt echo "${host_name}" | tee -a /mnt/etc/hostname

# Creating password for the root user
echo -e "${BYellow}[ * ]Creating password for the root user${End_Colour}"
arch-chroot /mnt passwd

# Enabling parallel downloads for pacman
echo -e "${BYellow}[ * ]Enabling parallel downloads for pacman${End_Colour}"
arch-chroot /mnt sed -i "s/#ParallelDownloads = 5/ParallelDownloads = 5/g" /etc/pacman.conf

# Installing some more packages
echo -e "${BYellow}[ * ]Installing some more packages${End_Colour}"
arch-chroot /mnt pacman -S grub efibootmgr networkmanager network-manager-applet dialog \
	base-devel linux-headers wpa_supplicant xdg-utils xdg-user-dirs bluez \
	bluez-utils cups pulseaudio alsa-utils pavucontrol terminus-font os-prober \
	udisks2 ntfs-3g bash-completion nfs-utils avahi openssh rsync xorg-xinit \
	xterm xf86-video-vmware firefox gnu-free-fonts noto-fonts ttf-dejavu \
	ttf-ubuntu-font-family vim git curl nemo gwenview simplescreenrecorder polkit

# Installing grub bootloader
echo -e "${BYellow}[ * ]Installing grub bootloader${End_Colour}"
arch-chroot /mnt grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg

# Enabling services
echo -e "${BYellow}[ * ]Enabling services at boot${End_Colour}"
arch-chroot /mnt systemctl enable NetworkManager
arch-chroot /mnt systemctl enable cups
arch-chroot /mnt systemctl enable bluetooth
arch-chroot /mnt systemctl enable avahi-daemon
arch-chroot /mnt systemctl enable sshd

# Adding user
echo -e "${BYellow}[ * ]Adding user${End_Colour}"
read -rp "[1;34mEnter your desired username:[0m" user_name
arch-chroot /mnt useradd -m "${user_name}"
arch-chroot /mnt passwd "${user_name}"

# Giving user sudo privileges
echo -e "${BYellow}Giving user sudo privileges[ * ]${End_Colour}"
arch-chroot /mnt sed -i "s/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/" /etc/sudoers

# Adding user to wheel group
echo -e "${BYellow}Adding ${user_name} to the wheel group[ * ]${End_Colour}"
arch-chroot /mnt usermod -aG wheel "${user_name}"

arch-chroot /mnt echo "Defaults env_reset,pwfeedback" | tee -a /mnt/etc/sudoers

echo -e "${BGreen}The Base Install is done !!${End_Colour}"

read -rp "[1;34mDo you want to setup the Qtile Rice? [Y/n]:[0m" rice_ans
if [[ -z ${rice_ans} || ${rice_ans} == "y" || ${rice_ans} == "Y" ]]; then
	curl -fSL https://tinyurl.com/arch-setup-rn >Arch_Setup
	mv ./Arch_Setup /mnt/home/"${user_name}"
	arch-chroot /mnt runuser -u "${user_name}" -- bash /home/"${user_name}"/Arch_Setup
elif [[ ${rice_ans} == "n" || ${rice_ans} == "N" ]]; then
	echo -e "${BRed}Skipping Rice Setup${End_Colour}"
else
	echo -e "${BRed}Not a valid option, Skipping Rice Setup${End_Colour}"
fi

# Echo exit chroot and unmount partitions
echo -e "${BYellow}[ * ]Unmounting partitions${End_Colour}"
umount -R /mnt

echo -e "${BGreen}Setup Completed !! Reboot Your Machine${End_Colour}"
