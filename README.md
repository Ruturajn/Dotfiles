# Dotfiles
My Config Files for starship, qtile, rofi, fish, etc. This branch contains scripts and config files for setting up this rice on Ubuntu.

To use the config on Ubuntu, you will need to make 2 changes (If you are not using one of the setup scripts):
- Edit line `202` in the [dunstrc](https://github.com/Ruturajn/Dotfiles/blob/ubuntu/dunst/dunstrc) to add the path to dunst icons, which should be
  `~/.config/dunst/icons`, or if you have not moved the `dunst` folder to your `~/.config` directory `<Path_to_these_dotfiles>/dunst/icons`.
- Edit line `6` in the [autostart.sh](https://github.com/Ruturajn/Dotfiles/blob/ubuntu/qtile/autostart.sh) script to add the path to your wallpaper. 
  This can be skipped if you want to use nitrogen, to set your wallaper. To do that, you will need to set a wallpaper the first time you login to Qtile
  with `nitrogen`. This is only a one time thing, and the wallpaper you chose will persist, due to line `9` in the 
  [autostart.sh](https://github.com/Ruturajn/Dotfiles/blob/ubuntu/qtile/autostart.sh) script. Also, you will need to make the autostart script executable,
  with `chmod +x <Path-to-autostart.sh>/autostart.sh`.

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
from that fork in `~/.config/picom/picom.conf`), and adding your user to the groups will be taken care of by the script. The script will also
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

![Ubuntu_Qtile_Rice](https://user-images.githubusercontent.com/56625259/170973427-d2e64b55-43bf-4ce6-987c-70251b20617e.png)

![Ubuntu_Qtile_Rice_1](https://user-images.githubusercontent.com/56625259/170973472-4af755da-aaa8-4e35-bf2a-9836b06de1cc.png)

![Ubuntu_Qtile_Rice_Rofi](https://user-images.githubusercontent.com/56625259/170973507-37c1d2c4-769b-42d3-a2ad-f114174e0242.png)

![Ubuntu_Qtile_Rice_Vol-Up](https://user-images.githubusercontent.com/56625259/170973542-e341bbff-d8e0-480d-9d2b-9491619c6f0f.png)

![Ubuntu_Qtile_Rice_Vol-Down](https://user-images.githubusercontent.com/56625259/170973564-f3820e0e-2a0b-4066-bb66-38f0d46decd8.png)

![Ubuntu_Qtile_Rice_Vol-Mute](https://user-images.githubusercontent.com/56625259/170973602-06f21dbf-aafa-4b95-8759-bb01760b00cb.png)

![Ubuntu_Qtile_Rice_Vol-UnMute](https://user-images.githubusercontent.com/56625259/170973620-444910ee-aac5-418a-9756-f8f34b0d2787.png)

![Ubuntu_Qtile_Rice_Brightness](https://user-images.githubusercontent.com/56625259/170973640-10d22a17-65ff-4ede-bd28-76e9ba5050ac.png)

<br />
