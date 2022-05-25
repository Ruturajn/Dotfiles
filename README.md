# Dotfiles
My Config Files for starship, qtile, rofi, fish, etc. In the ```Arch-Setup-Scripts``` directory, I have three bash scripts in this repo, two of those
are for installing this setup and for a base Arch-Linux Install respectively. The other one is for setting up this rice on Ubuntu.

To use the config on Arch, you will need to make 2 changes (If you are not using one of the setup scripts):
- Edit line `202` in the [dunstrc](https://github.com/Ruturajn/Dotfiles/blob/main/dunst/dunstrc) to add the path to dunst icons, which should be
  `~/.config/dunst/icons`, or if you have not moved the `dunst` folder to your `~/.config` directory `<Path_to_these_dotfiles>/dunst/icons`.
- Edit line `6` in the [autostart.sh](https://github.com/Ruturajn/Dotfiles/blob/main/qtile/autostart.sh) script to add the path to your wallpaper. 
  This can be skipped if you want to use nitrogen, to set your wallaper. To do that, you will need to set a wallpaper the first time you login to Qtile
  with `nitrogen`. This is only a one time thing, and the wallpaper you chose will persist, due to line `9` in the 
  [autostart.sh](https://github.com/Ruturajn/Dotfiles/blob/main/qtile/autostart.sh) script. Also, you will need to make the autostart script executable,
  with `chmod +x <Path-to-autostart.sh>/autostart.sh`.

*Note:* 
- *The Setup Install Script places the config files in their respective directories and installs the dependencies. Please read the ```README.md``` file placed
under the `Arch-Setup-Scripts` directory and the script ,before running the script. You can just get the script using curl (see 
[Arch-Setup-Scripts/README.md](https://github.com/Ruturajn/Dotfiles/tree/main/Arch-Setup-Scripts)), it will clone this repo and do the needfull.*
- *The Arch Install Script adds a user, partitions the disk, does a base Arch Installation etc. (see [Arch-Setup-Scripts/README.md](https://github.com/Ruturajn/Dotfiles/tree/main/Arch-Setup-Scripts)).*
- *The `picom.conf` file here, is to be used with the original picom. Since I am using [Jonaburg's Fork of picom](https://github.com/jonaburg/picom)
  I use the default config provided in that repo, so I have not included it here. If you want to use jonaburg-picom just use the default config there,
  I am using just that, no changes.*
- If you don't see the `wifi` widget show up, change line `364` in [qtile/config.py](https://github.com/Ruturajn/Dotfiles/blob/main/qtile/config.py)
  to your network interface.
- *To use the [bright_control](https://github.com/Ruturajn/Dotfiles/blob/main/qtile/bright_control) script, the user will need to be a part of the 
  `video` group. This can be done by : `$ sudo usermod -aG video $USER`.*
- *All of the aforementioned things stand for setting up this rice on Ubuntu as well(See [Ubuntu-Setup-Script/README.md](https://github.com/Ruturajn/Dotfiles/tree/main/Ubuntu-Setup-Script)).*

If you are using the [Arch_Setup_Install.sh](https://github.com/Ruturajn/Dotfiles/blob/main/Arch-Setup-Scripts/Arch_Setup_Install.sh) or the 
[Ubuntu_Setup_Install.sh](https://github.com/Ruturajn/Dotfiles/blob/main/Ubuntu-Setup-Script/Ubuntu_Setup_Install.sh) script, all of 
these things mentioned about editing files, picom configs (It will also ask you which fork of picom you require and place the default config
from that fork in `~/.config/picom/picom.conf`), and adding your user to the groups will be taken care of by the script. The scripts will also
backup your `$HOME/.config` directory before making any changes, so you will not loose any data.

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

<br />

## Screenshots

![Arch-Rice-2](https://user-images.githubusercontent.com/56625259/170262433-e5a55e80-7f66-4e97-962c-1fcea18ad951.png)

![Arch-Rice-2-1](https://user-images.githubusercontent.com/56625259/170262460-886c15b7-11d4-4fdf-bbe7-2a7d0b897913.png)

![Arch-Rice-2-Rofi](https://user-images.githubusercontent.com/56625259/170262487-cc528438-55bb-4881-9299-6faf45294b96.png)

![Arch-Rice-2-Exit-Menu](https://user-images.githubusercontent.com/56625259/170262689-81ea0ae2-66a4-443e-93d0-b70aeae1062d.png)

![Arch-Rice-2-Vol-Up](https://user-images.githubusercontent.com/56625259/170262732-dc154cc7-4e30-483c-822e-d3e68d7d7900.png)

![Arch-Rice-2-Vol-Down](https://user-images.githubusercontent.com/56625259/170262766-35a2d460-3d22-47b0-a6e6-e708b61f046e.png)

![Arch-Rice-2-Vol-Mute](https://user-images.githubusercontent.com/56625259/170262796-97fce2aa-afe2-4a1a-b5b6-f8bcbafed835.png)

![Arch-Rice-2-Vol-Unmute](https://user-images.githubusercontent.com/56625259/170262818-b99b2ff7-ca2f-45c6-9d90-be7c0c0c2a4e.png)

![Arch-Rice-2-Brightness](https://user-images.githubusercontent.com/56625259/170262881-9b3bdbef-dabd-4d58-850c-f828aec3abe0.png)

<br />
