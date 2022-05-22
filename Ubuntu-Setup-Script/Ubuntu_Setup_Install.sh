#!/bin/bash

# Author : Ruturajn <nanotiruturaj@gmail.com>
# Copyright (c) 2022, Ruturaj A. Nanoti, All Rights Reserved
# Run this script for setting up the Rice.

echo -ne "
██████╗ ██╗   ██╗████████╗██╗   ██╗██████╗  █████╗      ██╗███╗   ██╗
██╔══██╗██║   ██║╚══██╔══╝██║   ██║██╔══██╗██╔══██╗     ██║████╗  ██║
██████╔╝██║   ██║   ██║   ██║   ██║██████╔╝███████║     ██║██╔██╗ ██║
██╔══██╗██║   ██║   ██║   ██║   ██║██╔══██╗██╔══██║██   ██║██║╚██╗██║
██║  ██║╚██████╔╝   ██║   ╚██████╔╝██║  ██║██║  ██║╚█████╔╝██║ ╚████║
╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═══╝
=====================================================================
                  Ubuntu Qtile Setup Script                       
=====================================================================
"

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
read -rp "[1;34m[ * ]Do you want to proceed [Y/n]:[0m" setup_ans

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
	echo -e "${BYellow}[ * ]Backing up vim related config files in vim_backup_files${End_Colour}"
	mkdir "${HOME}"/vim_backup_files
	if [[ -f "${HOME}"/.vimrc ]]; then
		mv "${HOME}"/.vimrc "${HOME}"/vim_backup_files/.
	fi

	if [[ -d "${HOME}"/.vim ]]; then
		mv "${HOME}"/.vim "${HOME}"/vim_backup_files/.
	fi

	if [[ ! "$(ls -A ${HOME}/vim_backup_files)" ]]; then
		rm -r "${HOME}"/vim_backup_files
	fi

	# Updating and Upgrading System
	echo -e "${BYellow}[ * ]Updating and Upgrading System${End_Colour}"
	sudo apt update
	sudo apt upgrade

	# Installing dependencies
	echo -e "${BYellow}[ * ]Installing Dependencies with apt${End_Colour}"
	sudo apt install xorg xserver-xorg python3 python3-xcffib \
		python3-cairocffi libpangocairo-1.0-0 python3-pip python3-dbus \
		libpulse-dev pavucontrol python3-testresources git vim curl \
		fonts-fantasque-sans fish cargo lxappearance \
		nitrogen brightnessctl fonts-font-awesome playerctl python3-pip \
		build-essential cmake fonts-material-design-icons-iconfont ntfs-3g \
		ntfs-3g-dev nfs-kernel-server udisks2 papirus-icon-theme acpi lm-sensors

	echo -e "${BYellow}[ * ]Installing cxxopts from source${End_Colour}"
	if [[ ! -d "${HOME}"/Git-Repos ]]; then
		mkdir -p "${HOME}"/Git-Repos
	fi
	cd "${HOME}"/Git-Repos || exit
	git clone "https://github.com/jarro2783/cxxopts.git"
	cd ./cxxopts || exit
	cmake .
	make
	sudo make install

	# Getting various dependencies like pfetch, dunst, rofi, qtile, etc.
	echo -e "${BYellow}[ * ]Installing fontawesome and dbus-next for icons and notifications${End_Colour}"
	sudo pip3 install psutil fontawesome dbus-next

	echo -e "${BYellow}[ * ]Installing qtile from source${End_Colour}"
	cd "${HOME}"/Git-Repos || exit
	git clone "https://github.com/qtile/qtile.git"
	cd ./qtile || exit
	sudo pip3 install --upgrade --no-cache --force-reinstall cairocffi cffi xcffib
	sudo pip3 install dbus-next
	pip3 install .
	if [[ -d "/usr/share/xsessions" ]]; then
		sudo cp ./resources/qtile.desktop /usr/share/xsessions/qtile.desktop
	else
		sudo mkdir -p /usr/share/xsessions/
		sudo cp ./resources/qtile.desktop /usr/share/xsessions/qtile.desktop
	fi

	echo -e "${BYellow}[ * ]Installing qtile-extras from source${End_Colour}"
	cd "${HOME}"/Git-Repos || exit
	git clone "https://github.com/elParaguayo/qtile-extras.git"
	cd ./qtile-extras || exit
	sudo python3 setup.py install

	echo -e "${BYellow}[ * ]Installing lsd as a deb package${End_Colour}"
	wget "https://github.com/Peltoche/lsd/releases/download/0.21.0/lsd_0.21.0_amd64.deb"
	sudo dpkg -i lsd_0.21.0_amd64.deb

	echo -e "${BYellow}[ * ]Installing pipes.sh from source${End_Colour}"
	cd "${HOME}"/Git-Repos || exit
	git clone "https://github.com/pipeseroni/pipes.sh.git"
	cd ./pipes.sh || exit
	sudo make install

	echo -e "${BYellow}[ * ]Installing cava from source${End_Colour}"
	cd "${HOME}"/Git-Repos || exit
	git clone "https://github.com/karlstav/cava.git"
	cd ./cava || exit
	sudo apt install libfftw3-dev libasound2-dev libncursesw5-dev \
		libpulse-dev libtool automake libiniparser-dev libsdl2-2.0-0 libsdl2-dev
	./autogen.sh
	./configure
	make
	sudo make install

	echo -e "${BYellow}[ * ]Installing pfetch from source${End_Colour}"
	cd "${HOME}"/Git-Repos || exit
	git clone "https://github.com/dylanaraps/pfetch.git"
	cd ./pfetch || exit
	sudo cp ./pfetch /usr/local/bin/pfetch

	echo -e "${BYellow}[ * ]Installing Brave Browser${End_Colour}"
	cd "${HOME}" || exit
	sudo apt install apt-transport-https curl
	sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
	echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
	sudo apt update
	sudo apt install brave-browser

	echo -e "${BYellow}[ * ]Installing dunst from source${End_Colour}"
	sudo apt install libdbus-1-dev libx11-dev libxinerama-dev libxrandr-dev \
		libxss-dev libglib2.0-dev libpango1.0-dev libgtk-3-dev libxdg-basedir-dev \
		libnotify-dev
	cd "${HOME}"/Git-Repos || exit
	git clone "https://github.com/dunst-project/dunst.git"
	cd ./dunst || exit
	make
	sudo make install
	make dunstify
	if [[ -d "${HOME}"/.local/bin ]]; then
		sudo ln -sf "$(pwd)"/dunstify ~/.local/bin/ else
		mkdir -p "${HOME}"/.local/bin
		sudo ln -sf "$(pwd)"/dunstify ~/.local/bin/
	fi

	echo -e "${BYellow}[ * ]Installing rofi from source${End_Colour}"
	cd "${HOME}" || exit
	sudo apt install libpango-1.0-0 libpangocairo-1.0-0 libcairo2-dev xcb \
		libgdk-pixbuf2.0-dev libstartup-notification0-dev libxkbcommon-x11-dev \
		libxcb1-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-cursor-dev flex bison \
		gcc-multilib libglib2.0-dev pkgconf meson libxcb-util-dev libxcb-randr0-dev \
		libxcb-xinerama0-dev cppcheck ohcount go-md2man cmake texinfo

	cd "${HOME}"/Git-Repos || exit
	git clone "https://github.com/libcheck/check.git"
	cd ./check || exit
	autoreconf --install
	./configure
	make
	make check
	sudo make install
	sudo ldconfig

	cd "${HOME}"/Git-Repos || exit
	git clone --recursive "https://github.com/davatorium/rofi.git"
	cd ./rofi || exit
	git pull
	git submodule update --init
	autoreconf -i
	mkdir build && cd build || exit
	../configure
	make
	sudo make install

	echo -e "${BYellow}[ * ]Installing Alacritty${End_Colour}"
	sudo add-apt-repository ppa:aslatter/ppa
	sudo apt install alacritty

	echo -e "${BYellow}[ * ]Installing Fantasque Sans Mono Nerd Font${End_Colour}"
	wget "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FantasqueSansMono/Regular/complete/Fantasque%20Sans%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf"
	if [[ ! -d "${HOME}"/.fonts ]]; then
		mkdir "${HOME}"/.fonts
	fi
	cp "Fantasque Sans Mono Regular Nerd Font Complete Mono.ttf" "${HOME}"/.fonts
	fc-cache -fv

	echo -e "${BYellow}[ * ]Installing JetBrains Mono Nerd Font${End_Colour}"
	wget "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf"
	cp "JetBrains Mono Regular Nerd Font Complete Mono.ttf" "${HOME}"/.fonts
	fc-cache -fv

	echo -e "${BYellow}[ * ]Installing JetBrains Mono Font${End_Colour}"
	wget "https://github.com/JetBrains/JetBrainsMono/raw/master/fonts/ttf/JetBrainsMono-Regular.ttf"
	cp JetBrainsMono-Regular.ttf ~/.fonts/
	fc-cache -fv

	# Installing material design icon font
	echo -e "${BYellow}[ * ]Installing Material-Design-Icon Font${End_Colour}"
	wget "https://github.com/google/material-design-icons/raw/master/font/MaterialIcons-Regular.ttf"
	cp ./MaterialIcons-Regular.ttf "${HOME}"/.fonts
	fc-cache -fv

	echo -e "${BYellow}[ * ]Installing pamixer from source${End_Colour}"
	cd "${HOME}"/Git-Repos || exit
	git clone "https://github.com/cdemoulins/pamixer.git"
	cd ./pamixer || exit
	meson setup build
	meson install -C build

	# Clone the Dotfiles Repo and place all the folders in the $(HOME)/.config directory
	cd "${HOME}"/Git-Repos || exit
	echo -e "${BYellow}[ * ]Cloning the Dotfiles repo${End_Colour}"
	git clone "https://github.com/Ruturajn/Dotfiles.git"
	cd "${HOME}"/Git-Repos/Dotfiles || exit

	echo -e "${BYellow}[ * ]Placing dunst folder in ~/.config/dunst and making vol_script executable${End_Colour}"
	cp -r ./dunst "${HOME}"/.config
	chmod +x "${HOME}"/.config/dunst/vol_script
	sed -i "s|    icon_path = .*|    icon_path = $HOME/.config/dunst/icons|" "${HOME}"/.config/dunst/dunstrc

	echo -e "${BYellow}[ * ]Placing rofi folder in ~/.config/rofi${End_Colour}"
	cp -r ./rofi "${HOME}"/.config
	sed -i 's/text\-color\: \@normal\-foreground\;/text\-color\: \@text-color\;/' "${HOME}"/.config/rofi/themes/my_theme.rasi
	sed -i 's/background\-color\: \@background\;/background\-color\: \@background\-color\;/' "${HOME}"/.config/rofi/themes/my_theme.rasi

	echo -e "${BYellow}[ * ]Placing qtile/config.py and qtile/autostart.sh folder in ~/.config/qtile  and making autostart.sh executable${End_Colour}"
	cp -r ./qtile "${HOME}"/.config/
	echo "nitrogen --set-scaled ${HOME}/Git-Repos/Dotfiles/Wallpapers/China_Town.jpg --save" | sudo tee -a "${HOME}"/.config/qtile/autostart.sh
	chmod +x "${HOME}"/.config/qtile/autostart.sh
	sed -i 's/browser \= "brave"/browser \= "brave-browser"/' "${HOME}"/.config/qtile/config.py
	sed -i 's/file_manager \= "nemo"/file_manager \= "nautilus"/' "${HOME}"/.config/qtile/config.py

	echo -e "${BYellow}[ * ]Placing alacritty config in ~/.config/${End_Colour}"
	cp ./alacritty.yml ~/.config/
	sed -i 's/family\: FantasqueSansMono/family\: FantasqueSansMono Nerd Font Mono/' "${HOME}"/.config/alacritty.yml

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

	echo -e "${BYellow}[ * ]Installing picom from source${End_Colour}"
	sudo apt install libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev \
		libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev \
		libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev \
		libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev \
		libpcre2-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev meson

	echo -e "${BYellow}[ * ]Creating picom config directory${End_Colour}"
	if [[ ! -d "${HOME}"/.config/picom ]]; then
		mkdir -p "${HOME}"/.config/picom
	fi
	echo -e "${BYellow}[ * ]Choose the option for the compositor:"
	echo -e "1) picom"
	echo -e "2) jonaburg-picom"
	echo -e "3) ibhagwan-picom${End_Colour}"
	echo -e "${BGreen}Normal picom, i.e. option '1' works best in a VM${End_Colour}"
	read -rp "[1;34m[ * ]Enter the number for the picom compositor you want to install :[0m" picom_ans

	case "${picom_ans}" in
	1)
		echo -e "${BYellow}[ * ]Installing picom from source${End_Colour}"
		cd "${HOME}"/Git-Repos || exit
		git clone "https://github.com/yshui/picom.git"
		cd ./picom || exit
		git submodule update --init --recursive
		meson --buildtype=release . build
		meson configure -Dprefix=/usr/local/picom build
		ninja -C build
		sudo ninja -C build install

		echo -e "${BYellow}[ * ]Placing picom config in ~/.config/picom${End_Colour}"
		cp "${HOME}"/Git-Repos/Dotfiles/picom.conf "${HOME}"/.config/picom/
		;;
	2)
		echo -e "${BYellow}[ * ]Installing picom-jonaburg from source${End_Colour}"
		cd "${HOME}"/Git-Repos || exit
		git clone "https://github.com/jonaburg/picom.git"
		cd ./picom || exit
		git submodule update --init --recursive
		meson --buildtype=release . build
		meson configure -Dprefix=/usr/local/picom build
		ninja -C build
		sudo ninja -C build install

		echo -e "${BYellow}[ * ]Placing picom config in ~/.config/picom${End_Colour}"
		curl -fsSL "https://raw.githubusercontent.com/jonaburg/picom/next/picom.sample.conf" >"${HOME}"/.config/picom/picom.conf
		;;
	3)
		echo -e "${BYellow}[ * ]Installing picom-ibhagwan from source${End_Colour}"
		cd "${HOME}"/Git-Repos || exit
		git clone "https://github.com/ibhagwan/picom.git"
		cd ./picom || exit
		git submodule update --init --recursive
		meson --buildtype=release . build
		meson configure -Dprefix=/usr/local/picom build
		ninja -C build
		sudo ninja -C build install

		echo -e "${BYellow}[ * ]Placing picom config in ~/.config/picom${End_Colour}"
		curl -fsSL "https://raw.githubusercontent.com/ibhagwan/picom/next-rebase/picom.sample.conf" >"${HOME}"/.config/picom/picom.conf
		;;
	esac

	echo -e "${BYellow}[ * ]Changing the path for picom executable in autostart.sh${End_Colour}"
	read -rp "[1;34m[ * ]Are you Installing this on a VM?[Y/n]:" vm_ans
	if [[ -z ${vm_ans} || ${vm_ans} == "y" || ${vm_ans} == "Y" ]]; then
		sed -i 's|picom.*|/usr/local/picom/bin/picom --no-vsync \&|' "${HOME}"/.config/qtile/autostart.sh
	else
		sed -i 's|picom.*|/usr/local/picom/bin/picom \&|' "${HOME}"/.config/qtile/autostart.sh
	fi

	# Go back to the dotfiles directory
	cd "${HOME}"/Git-Repos/Dotfiles || exit

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

	echo -e "${BYellow}[ * ]Enabling pulseaudio at startup${End_Colour}"
	systemctl --user enable pulseaudio

	echo -e "${BYellow}[ * ]Add user to video group${End_Colour}"
	sudo usermod -aG video "$USER"

	echo -e "${BGreen}===================================================================${End_Colour}"
	echo -e "${BGreen}[ * ]Setup Complete !!${End_Colour}"
	echo -e "${BGreen}[ * ]Logout, and Login to Qtile !!${End_Colour}"
	echo -e "${BGreen}===================================================================${End_Colour}"
else
	echo -e "${BRed}[ * ]Skipping Rice Setup${End_Colour}"
	exit
fi
