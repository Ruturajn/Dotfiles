# Dotfiles
My Config Files for starship, qtile, rofi, fish, etc. This branch contains scripts and config files for setting up this rice on Ubuntu.

To use the config on Ubuntu, you will need to do a few things apart from installing the required packages(If you are not using the setup script):
- Edit line `202` in the [dunstrc](https://github.com/Ruturajn/Dotfiles/blob/ubuntu/dunst/dunstrc) to add the path to dunst icons, which should be
  `~/.config/dunst/icons`, or if you have not moved the `dunst` folder to your `~/.config` directory `<Path_to_these_dotfiles>/dunst/icons`.
- Edit line `6` in the [autostart.sh](https://github.com/Ruturajn/Dotfiles/blob/ubuntu/qtile/autostart.sh) script to add the path to your wallpaper. 
  This can be skipped if you want to use nitrogen, to set your wallaper. To do that, you will need to set a wallpaper the first time you login to Qtile
  with `nitrogen`. This is only a one time thing, and the wallpaper you chose will persist, due to line `9` in the 
  [autostart.sh](https://github.com/Ruturajn/Dotfiles/blob/ubuntu/qtile/autostart.sh) script. Also, you will need to make the autostart script 
  executable, with `chmod +x <Path-to-autostart.sh>/autostart.sh`.
- Get the required fonts, to do this, copy the fonts from the `fonts` directory into `~/.fonts`, if this directory does not exist you might have to
  create it,
  ```
  # If you don't have the ~/.fonts create it
  $ mkdir ~/.fonts
  
  # Copy the fonts to that directory and update font cache
  $ cp -r <Path_To_These_Dotfiles>/fonts/. ~/.fonts
  $ fc-cache -fv
  ```
- For setting up neovim navigate to this dotfiles repo and follow,
  ```
  $ sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  $ if [[ -n $(command -v nvim) ]]; then
	    sudo apt remove neovim -y
	    sudo apt autoremove -y
    fi
  $ wget "https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb"
  $ sudo dpkg -i nvim-linux64.deb
  $ cp -r <Path_To_These_Dotfiles>/nvim ~/.config/
  $ cd ~ || exit
  $ if [[ -n $(command -v npm) ]]; then
      sudo apt remove npm -y
      sudo apt autoremove -y
    fi
  $ wget "https://nodejs.org/dist/v16.15.1/node-v16.15.1-linux-x64.tar.xz"
  $ sudo mkdir -p /usr/local/lib/nodejs
  $ sudo tar -xJvf node-v16.15.1-linux-x64.tar.xz -C /usr/local/lib/nodejs
  $ mkdir -p ~/.config/nvim/plugged
  $ nvim +'PlugInstall --sync' +qa
  $ nvim +'LspInstall --sync pyright' +qa
  $ nvim +'LspInstall --sync sumneko_lua' +qa
  $ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  $ source $HOME/.cargo/env
  $ rustup component add rust-src
  $ nvim +'LspInstall --sync rust_analyzer' +qa
  
  # Add Language Servers to path, use the command given below, if you are using my fish config
  $ sed -i 's|set -gx fish_user_paths ~/.local/bin/|set -gx fish_user_paths ~/.local/bin/ ~/.local/share/nvim/lsp_servers/python/node_modules/.bin ~/.local/share/nvim/lsp_servers/rust ~/.cargo/bin ~/.local/share/nvim/lsp_servers/sumneko_lua/extension/server/bin|g' "${HOME}"/.config/fish/config.fish
  ```
  whereas, for setting, up vim,
  ```
  $ cp <Path_To_These_Dotfiles>/.vimrc "${HOME}"/
  $ mkdir -p "${HOME}"/.vim/plugged
  $ curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
			https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  $ source "${HOME}"/.vimrc
  $ vim +'PlugInstall --sync' +qa
  ```
  Please, see the `echo` commands, from line `261` to `326` in [Ubuntu_Setup_Install.sh](https://github.com/Ruturajn/Dotfiles/blob/ubuntu/Ubuntu-Setup-Script/Ubuntu_Setup_Install.sh) as explanation on what these lines do, for neovim and vim setup respectively, if you are unfamiliar with them.

- (Optional) Using `wpgtk` and `pywal`. The modifications, required to use them are present in the `qtile config`, and the `wal-set` script is placed under 
  `qtile/Scripts` directory. To use it with my dotfiles, follow these steps:
  ```
  # Install the dependencies for pywal before the installation of wpgtk.
  $ sudo apt install imagemagick procps
  
  # Now, build and install pywal from source
  $ git clone https://github.com/dylanaraps/pywal
  $ cd pywal
  $ sudo pip3 install .
  
  # After this, install the dependencies for wpgtk
  $ sudo apt install gtk2-engines-murrine
  $ sudo pip3 install pillow
  
  # Then, build and install wpgtk from source
  $ git clone https://github.com/deviantfero/wpgtk
  $ cd wpgtk
  $ sudo pip3 install .
  
  # Then add this line to the fish config, at the end of the 'if' block
  cat ~/.config/wpg/sequences
  
  # After that, remove the line from the autostart.sh file, that restores the wallpaper with 'nitrogen',
  # and replace it with,
  wal -R
  
  # Now, run the wal-set script using 'Alt+P'. Once, the colorscheme is generated, run
  # the following to generate gtk and icon theme.
  $ wpg-install.sh -gi
  ```
  To apply the gtk and icon theme, use `lxappearance` (or any other application that you like), for choosing the theme, whose name will be displayed, 
  when you run the command `$ wpg-install.sh -gi`. Now, this should setup everything, and whenever you run the `wal-set` script, the theme will reflect 
  everywhere. I do not use this scheme for neovim, since the generated schemes do not look that great in it. You can use it, by installing a 
  [plugin](https://github.com/deviantfero/wpgtk.vim). Check the links from the **Theme** section, in the [Setup Details](#setup-details) section if you 
  have any issues while installing `wpgtk` or `pywal`.

*Note:* 
- *The Setup Install Script places the config files in their respective directories and installs the dependencies. Please read the ```README.md``` file 
  placed under the `Ubuntu-Setup-Script` directory and the script, before running the script. You can just get the script using curl (see 
  [Ubuntu-Setup-Script/README.md](https://github.com/Ruturajn/Dotfiles/tree/ubuntu/Ubuntu-Setup-Script)), it will clone this repo and do the needfull.*
- *The `picom.conf` file here, is to be used with the original picom. For [Jonaburg's Fork of picom](https://github.com/jonaburg/picom),
  I use `jonaburg_picom.conf`. If you want to use jonaburg-picom use that.*
- If you don't see the `wifi` widget show up, change line `138` in [qtile/config.py](https://github.com/Ruturajn/Dotfiles/blob/ubuntu/qtile/config.py)
  to your network interface.
- *To use the [bright_control](https://github.com/Ruturajn/Dotfiles/blob/ubuntu/qtile/Scripts/bright_control) script, the user will need to be a part of 
  the `video` group. This can be done by : `$ sudo usermod -aG video $USER`.*

If you are using the [Ubuntu_Setup_Install.sh](https://github.com/Ruturajn/Dotfiles/blob/ubuntu/Ubuntu-Setup-Script/Ubuntu_Setup_Install.sh) script, all 
of these things mentioned about editing files, picom configs (It will also ask you which fork of picom you require and place the default config
from that fork in `~/.config/picom/picom.conf`), adding your user to the groups and giving you the choice to choose `pywal` with `wpgtk` will be
taken care of by the script. The script will also backup your `$HOME/.config` directory before making any changes, so you will not loose any data.

<br />

## Setup Details

| Category | Tool Used |
| --- | --- |
| Window Manager | [Qtile](https://github.com/qtile/qtile) (with [Qtile-Extras](https://github.com/elParaguayo/qtile-extras)) |
| Terminal | [Alacritty](https://github.com/alacritty/alacritty) |
| Shell    | [Fish](https://github.com/fish-shell/fish-shell) (with [Oh-my-fish](https://github.com/oh-my-fish/oh-my-fish)) |
| Compositor | [Jonaburg's Fork of picom](https://github.com/jonaburg/picom) |
| Application Launcher | [Rofi](https://github.com/davatorium/rofi) | 
| Text Editor | [Vim](https://github.com/vim/vim) |
| Browser | [Brave](https://brave.com/) |
| Notifications | [Dunst](https://github.com/dunst-project/dunst) |
| File Manager | [Nemo](https://github.com/linuxmint/nemo) |
| Fonts | [Fantasque Sans Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FantasqueSansMono/Regular/complete), [JetBrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete), [Fontawesome Font](https://github.com/FortAwesome/Font-Awesome) and [Material Design Icon Font](https://github.com/google/material-design-icons/blob/master/font/MaterialIcons-Regular.ttf) |
| Fetch Program | [pfetch](https://github.com/dylanaraps/pfetch), [fm6000](https://github.com/anhsirk0/fetch-master-6000) and [nerdfetch](https://github.com/ThatOneCalculator/NerdFetch) |
| Terminal Programs | [cava](https://github.com/karlstav/cava), [bashtop](https://github.com/aristocratos/bashtop), [pipes.sh](https://github.com/pipeseroni/pipes.sh), [cmatrix](https://github.com/abishekvashok/cmatrix) and [cbonsai](https://gitlab.com/jallbrit/cbonsai) |
| Theme | [Catppuccin](https://github.com/catppuccin/catppuccin) or [pywal](https://github.com/dylanaraps/pywal) with [wpgtk](https://github.com/deviantfero/wpgtk) |

<br />

## Gallery

https://user-images.githubusercontent.com/56625259/177556957-b1e09610-c086-42f3-a2f8-58f6924e4b6e.mp4

![Ubuntu-Qtile-Rice-1](https://user-images.githubusercontent.com/56625259/174551823-dc47db9e-2ee6-4978-9d3b-7f03b8324691.png)

![Ubuntu-Qtile-Rice-2](https://user-images.githubusercontent.com/56625259/174551835-871f0284-97bb-44ef-b4ca-cb5e33f5caa3.png)

![Ubuntu-Qtile-Rice-Rofi](https://user-images.githubusercontent.com/56625259/174551904-c206e71a-dc31-43de-840c-d8c74b52d25c.png)

![Ubuntu-Qtile-Rice-Wifi](https://user-images.githubusercontent.com/56625259/174551959-0bca4800-958c-4321-8f7d-a84921d5df70.png)

![Ubuntu-Qtile-Rice-PowerMenu](https://user-images.githubusercontent.com/56625259/174551974-1e3bb88e-55eb-4885-a7e4-4ae9647a098d.png)

## Screenshots (Showing Volume and Brightness Control)
<details>
<summary>Old Screenshots</summary>

![Ubuntu_Qtile_Rice](https://user-images.githubusercontent.com/56625259/170973427-d2e64b55-43bf-4ce6-987c-70251b20617e.png)

![Ubuntu_Qtile_Rice_1](https://user-images.githubusercontent.com/56625259/170973472-4af755da-aaa8-4e35-bf2a-9836b06de1cc.png)

![Ubuntu_Qtile_Rice_Rofi](https://user-images.githubusercontent.com/56625259/170973507-37c1d2c4-769b-42d3-a2ad-f114174e0242.png)

![Ubuntu_Qtile_Rice_Vol-Up](https://user-images.githubusercontent.com/56625259/170973542-e341bbff-d8e0-480d-9d2b-9491619c6f0f.png)

![Ubuntu_Qtile_Rice_Vol-Down](https://user-images.githubusercontent.com/56625259/170973564-f3820e0e-2a0b-4066-bb66-38f0d46decd8.png)

![Ubuntu_Qtile_Rice_Vol-Mute](https://user-images.githubusercontent.com/56625259/170973602-06f21dbf-aafa-4b95-8759-bb01760b00cb.png)

![Ubuntu_Qtile_Rice_Vol-UnMute](https://user-images.githubusercontent.com/56625259/170973620-444910ee-aac5-418a-9756-f8f34b0d2787.png)

![Ubuntu_Qtile_Rice_Brightness](https://user-images.githubusercontent.com/56625259/170973640-10d22a17-65ff-4ede-bd28-76e9ba5050ac.png)

<br />

</details>
