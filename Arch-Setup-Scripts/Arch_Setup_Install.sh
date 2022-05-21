#!/bin/bash

echo -ne "
██████╗ ██╗   ██╗████████╗██╗   ██╗██████╗  █████╗      ██╗███╗   ██╗
██╔══██╗██║   ██║╚══██╔══╝██║   ██║██╔══██╗██╔══██╗     ██║████╗  ██║
██████╔╝██║   ██║   ██║   ██║   ██║██████╔╝███████║     ██║██╔██╗ ██║
██╔══██╗██║   ██║   ██║   ██║   ██║██╔══██╗██╔══██║██   ██║██║╚██╗██║
██║  ██║╚██████╔╝   ██║   ╚██████╔╝██║  ██║██║  ██║╚█████╔╝██║ ╚████║
╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═══╝
=====================================================================

                Arch-Linux Qtile Setup Script                       

=====================================================================
"

# Author : Ruturajn <nanotiruturaj@gmail.com>
# Copyright (c) 2022, Ruturaj A. Nanoti, All Rights Reserved
# Run this script for setting up the Rice.

BRed="\e[1;31m"
BGreen="\e[1;32m"
BYellow="\e[1;33m"
# BBlue="\e[1;34m"
End_Colour="\e[0m"

echo -e "${BRed}==========================================================================================================================${End_Colour}"
echo -e "${BRed}[ * ]!This script is going to backup your current .config folder and any vim related files that you mave have in the
     home directory to the folders named 'backup_dot_config' and 'vim_backup_files' respectively. Then it is going to
     install some packages that are required for the rice, and place the respective dotfiles in the .config directory.
     The .config directory in your system will not be replaced rather stuff will be added to it. So there will not be loss
     of current config files.\n${End_Colour}"
echo -e "${BRed}==========================================================================================================================${End_Colour}"
read -rp "[1;34m[ * ]Do you want to proceed?[Y/n]:[0m" setup_ans

if [[ -z ${setup_ans} || ${setup_ans} == "y" || ${setup_ans} == "Y" ]]; then
	# Backup the current config files
	echo -e "${BYellow}[ * ]Backing up current config folder and files in backup_dot_config${End_Colour}"
	if [[ -d "${HOME}"/.config ]]; then
		mkdir "${HOME}"/backup_dot_config
		cp -r "${HOME}"/.config/. "${HOME}"/backup_dot_config
	else
		mkdir "${HOME}"/.config
	fi

	# Backup vim related config files
	mkdir "${HOME}"/vim_backup_files
	echo -e "${BYellow}[ * ]Backing up vim related config files in vim_backup_files${End_Colour}"
	if [[ -f "${HOME}"/.vimrc ]]; then
		mv "${HOME}"/.vimrc "${HOME}"/vim_backup_files/.
	fi

	if [[ -d "${HOME}"/.vim ]]; then
		mv "${HOME}"/.vim "${HOME}"/vim_backup_files/.
	fi

	if [[ ! "$(ls -A ${HOME}/vim_backup_files)" ]]; then
		rm -r "${HOME}"/vim_backup_files
	fi

	# Install the required packages for the Rice
	echo -e "${BYellow}[ * ]Installing packages${End_Colour}"
	sudo pacman -Syyu neofetch htop nitrogen xorg fish rofi qtile dunst \
		python-dbus linux-headers base base-devel p7zip unzip tar python-pip \
		papirus-icon-theme cmatrix pamixer feh alsa-utils pavucontrol alacritty \
		git vim curl flameshot pulseaudio playerctl scrot ttf-fantasque-sans-mono \
		brightnessctl

	# Adding a swapfile
	read -rp "[1;34m[ * ]Do you want to create a swapfile [Y/n]:[0m" ans
	if [[ -z ${ans} || ${ans} == "y" || ${ans} == "Y" ]]; then
		echo -e "${BYellow}[ * ]Creating 4G swapfile${End_Colour}"
		sudo dd if=/dev/zero of=/swapfile bs=1M count=4096
		sudo chmod 600 /swapfile
		sudo mkswap /swapfile
		sudo swapon /swapfile
		echo "/swapfile                                       none            swap            defaults        0 0" | sudo tee -a /etc/fstab
		echo -e "${BGreen}Swapfile creation and configuration successfull !!${End_Colour}"
	elif [[ ${ans} == "n" || ${ans} == "N" ]]; then
		echo -e "${BRed}Skipping Swapfile creation${End_Colour}"
	else
		echo -e "${BRed}Not a valid option, Skipping Swapfile creation${End_Colour}"
	fi

	# Install stuff with pip
	echo -e "${BYellow}[ * ]Installing fontawesome and dbus-next for icons and notifications${End_Colour}"
	sudo pip3 install psutil fontawesome dbus-next

	# Install `yay` as the AUR Helper, interact wherever required
	read -rp "[1;34m[ * ]Do you want to install yay as the AUR Helper? [Y/n]:[0m" aur_ans
	if [[ ${aur_ans} == "n" || ${aur_ans} == "N" ]]; then
		read -rp "[1;34m[ * ]Please enter the name of the installed AUR Helper:[0m" aur_name
		if [[ -z ${aur_name} ]]; then
			echo -e "${BRed}FATAL : Cannot proceed without an AUR Helper !!${End_Colour}" && exit
		fi
	elif [[ -z ${aur_ans} || ${aur_ans} == "y" || ${aur_ans} == "Y" ]]; then
		echo -e "${BYellow}[ * ]Installing yay as the AUR Helper${End_Colour}"
		sudo git clone https://aur.archlinux.org/yay.git
		sudo chown -R "${USER}":"${USER}" yay
		cd ./yay || exit
		makepkg -si
		aur_name="yay"
	fi

	# Upgrade system with yay
	echo -e "${BYellow}[ * ]Updating and Upgrading system with ${aur_name}${End_Colour}"
	"${aur_name}" -Syu

	# Install lsd for the ls command and qtile-extras from desired AUR Helper
	echo -e "${BYellow}[ * ]Installing lsd and qtile-extras with ${aur_name}${End_Colour}"
	"${aur_name}" -S lsd qtile-extras-git

	# Install the required fonts
	echo -e "${BYellow}[ * ]Installing Fantasque Sans Mono Nerd Font and JetBrains Mono Font with ${aur_name}${End_Colour}"
	"${aur_name}" -S nerd-fonts-fantasque-sans-mono ttf-jetbrains-mono

	# Install pipes and cava with yay
	echo -e "${BYellow}[ * ]Installing pipes.sh, cava and brave-bin with ${aur_name}${End_Colour}"
	"${aur_name}" -S pipes.sh cava brave-bin

	# Getting pfetch as fetch tool
	echo -e "${BYellow}[ * ]Installing pfetch as the fetch tool${End_Colour}"
	mkdir "${HOME}"/Git-repos
	cd "${HOME}"/Git-repos || exit
	git clone https://github.com/dylanaraps/pfetch.git
	cd ./pfetch || exit
	sudo cp ./pfetch /usr/bin/pfetch

	# Clone the Dotfiles Repo and place all the folders in the $(HOME)/.config directory
	cd "${HOME}"/Git-repos/ || exit
	echo -e "${BYellow}[ * ]Cloning the Dotfiles repo${End_Colour}"
	git clone https://github.com/Ruturajn/Dotfiles.git
	cd "${HOME}"/Git-repos/Dotfiles || exit

	echo -e "${BYellow}[ * ]Placing dunst folder in ~/.config/dunst and making vol_script executable${End_Colour}"
	cp -r ./dunst "${HOME}"/.config
	chmod +x "${HOME}"/.config/dunst/vol_script
	sed -i "s|    icon_path = .*|    icon_path = $HOME/.config/dunst/icons|" "${HOME}"/.config/dunst/dunstrc

	echo -e "${BYellow}[ * ]Placing rofi folder in ~/.config/rofi${End_Colour}"
	cp -r ./rofi "${HOME}"/.config

	echo -e "${BYellow}[ * ]Placing qtile/config.py and qtile/autostart.sh folder in ~/.config/qtile  and making autostart.sh executable${End_Colour}"
	#mkdir -p "${HOME}"/.config/qtile
	#cp ./qtile/config.py "${HOME}"/.config/qtile/config.py
	#cp ./qtile/autostart.sh "${HOME}"/.config/qtile/
	cp -r ./qtile "${HOME}/.config/"
	echo "nitrogen --set-scaled ${HOME}/Git-repos/Dotfiles/Wallpapers/China_Town.jpg" | sudo tee -a "${HOME}"/.config/qtile/autostart.sh
	chmod +x "${HOME}"/.config/qtile/autostart.sh

	echo -e "${BYellow}[ * ]Placing alacritty config in ~/.config/${End_Colour}"
	cp ./alacritty.yml ~/.config/

	echo -e "${BYellow}[ * ]Placing .vimrc in ~/${End_Colour}"
	cp ./.vimrc "${HOME}"/

	echo -e "${BYellow}[ *]Making ~/.vim/plugged directory"
	mkdir -p "${HOME}"/.vim/plugged

	echo -e "${BYellow}[ * ]Installing Vim-Plug${End_Colour}"
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

	echo -e "${BYellow}[ * ]Sourcing .vimrc${End_Colour}"
	source "${HOME}"/.vimrc

	echo -e "${BYellow}[ * ]Installing vim plugins${End_Colour}"
	vim +'PlugInstall --sync' +qa

	echo -e "${BYellow}[ * ]Making ~/.config/picom${End_Colour}"
	mkdir -p "${HOME}"/.config/picom

	echo -e "${BYellow}[ * ]Choose the option for the compositor:"
	echo -e "1) picom"
	echo -e "2) jonaburg-picom"
	echo -e "3) ibhagwan-picom${End_Colour}"
	read -rp "[1;34m[ * ]Enter the number for the picom compositor you want to install :[0m" picom_ans

	case "${picom_ans}" in
	1)
		echo -e "${BYellow}[ * ]Installing picom${End_Colour}"
		sudo pacman -S picom

		echo -e "${BYellow}[ * ]Placing picom config in ~/.config/picom${End_Colour}"
		cp ./picom.conf "${HOME}"/.config/picom/
		;;
	2)
		echo -e "${BYellow}[ * ]Installing picom-jonaburg-git with ${aur_name}${End_Colour}"
		"${aur_name}" -S picom-jonaburg-git

		echo -e "${BYellow}[ * ]Placing picom config in ~/.config/picom${End_Colour}"
		curl -fsSL "https://raw.githubusercontent.com/jonaburg/picom/next/picom.sample.conf" >"${HOME}"/.config/picom/picom.conf
		;;
	3)
		echo -e "${BYellow}[ * ]Installing picom-ibhagwan-git with ${aur_name}${End_Colour}"
		"${aur_name}" -S picom-ibhagwan-git

		echo -e "${BYellow}[ * ]Placing picom config in ~/.config/picom${End_Colour}"
		curl -fsSL "https://raw.githubusercontent.com/ibhagwan/picom/next-rebase/picom.sample.conf" >"${HOME}"/.config/picom/picom.conf
		;;
	esac

	# Install fish and change default shell
	read -rp "[1;34m[ * ]Do you want to change the default shell to fish? [Y/n]:[0m" shell_ans
	if [[ -z ${shell_ans} || ${shell_ans} == "y" || ${shell_ans} == "Y" ]]; then
		echo -e "${BYellow}[ * ]Changing Default shell to fish and installing omf with robbyrussell theme${End_Colour}"
		chsh -s /usr/bin/fish
		echo -e "${BYellow}[ * ]Placing fish config in ~/.config/fish${End_Colour}"
		mkdir -p "${HOME}"/.config/fish
		cp ./fish/config.fish "${HOME}"/.config/fish/config.fish
	elif [[ ${shell_ans} == "n" || ${shell_ans} == "N" ]]; then
		echo -e "${BRed}Skipping Shell change${End_Colour}"
	else
		echo -e "${BRed}Not a valid option, Skipping Shell change${End_Colour}"
	fi

	# # Enable lightdm service with the following steps
	# read -rp "[1;34m[ * ]Do you want to install the lightdm login manager?[Y/n]:[0m" lightdm_ans
	# if [[ -z ${lightdm_ans} || ${lightdm_ans} == "y" || ${lightdm_ans} == "Y" ]] ; then
	#     echo -e "${BYellow}[ * ]Installing Lightdm${End_Colour}"
	#     sudo pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
	#     echo -e "${BYellow}[ * ]Uncommenting 'greeter-session' option in '/etc/lightdm/lightdm.conf' and replacing with 'greeter-session=lightdm'${End_Colour}"
	#     sudo sed -i "s/# greeter-session = Session to load for greeter/greeter-session=lightdm/g" /etc/lightdm/lightdm.conf
	#     echo -e "${BYellow}[ * ]Starting the lightdm service at boot with 'sudo systemctl enable lightdm.service'${End_Colour}"
	#     sudo systemctl enable lightdm.service
	#     echo -e "${BYellow}[ * ]Reboot the system with 'sudo systemctl reboot'${End_Colour}"
	# elif [[ ${lightdm_ans} == "n" || ${lightdm_ans} == "N" ]] ; then
	#     echo -e "${BRed}Skipping Lightdm Installation${End_Colour}"
	# else
	#     echo -e "${BRed}Not a valid option, Skipping Lightdm Installation${End_Colour}"
	# fi

	# Install and Enable sddm service with the following steps
	read -rp "[1;34m[ * ]Do you want to install the sddm login manager?[Y/n]:[0m" sddm_ans
	if [[ -z ${sddm_ans} || ${sddm_ans} == "y" || ${sddm_ans} == "Y" ]]; then
		echo -e "${BYellow}[ * ]Installing sddm${End_Colour}"
		sudo pacman -S sddm
		echo -e "${BYellow}[ * ]Installing Candy Theme for sddm with ${aur_name}${End_Colour}"
		"${aur_name}" -S sddm-theme-sugar-candy-git
		echo -e "${BYellow}[ * ]Editing the conf file for sddm to change the theme to Sugar-Candy${End_Colour}"
		sudo sed -i 's/Current=.*/Current=Sugar-Candy/' /usr/lib/sddm/sddm.conf.d/default.conf
		echo -e "${BYellow}[ * ]Starting the sddm service at boot with 'sudo systemctl enable sddm.service'${End_Colour}"
		sudo systemctl enable sddm.service
		echo -e "${BYellow}[ * ]Reboot the system with 'sudo systemctl reboot'${End_Colour}"
	elif [[ ${sddm_ans} == "n" || ${sddm_ans} == "N" ]]; then
		echo -e "${BRed}Skipping sddm Installation${End_Colour}"
	else
		echo -e "${BRed}Not a valid option, Skipping sddm Installation${End_Colour}"
	fi

	# Enabling pulseaudio for user
	echo -e "${BYellow}[ * ]Enabling pulseaudio at startup${End_Colour}"
	systemctl --user enable pulseaudio

	# Adding user to video group
	echo -e "${BYellow}[ * ]Add user to video group${End_Colour}"
	sudo usermod -aG video "$USER"

	# Installation Success
	echo -e "${BGreen}Installation Successfull, Logout and Login to Qtile!!${End_Colour}"
else
	echo -e "${BRed}[ * ]Skipping Rice Setup${End_Colour}"
	exit
fi
