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
| Fonts | [Fantasque Sans Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FantasqueSansMono/Regular/complete) and [JetBrains Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete) |
| Fetch Program | [pfetch](https://github.com/dylanaraps/pfetch) or [fm6000](https://github.com/anhsirk0/fetch-master-6000) |
| Terminal Programs | [cava](https://github.com/karlstav/cava), [bashtop](https://github.com/aristocratos/bashtop), [pipes.sh](https://github.com/pipeseroni/pipes.sh) and [cmatrix](https://github.com/abishekvashok/cmatrix) |

<br />

## Screenshots

![Arch-Rice](https://user-images.githubusercontent.com/56625259/169133033-b98ac87b-028e-4aac-856d-756fc19dc765.png)

![Arch-Rice-Rofi](https://user-images.githubusercontent.com/56625259/169133226-fcdb848b-94e4-4ac6-8914-6b88756e9e1a.png)

![Arch-Rice-Exit-Menu](https://user-images.githubusercontent.com/56625259/169133357-b0fd7ea3-e586-479e-897a-afbbda891bad.png)

![Arch-Vol-Up](https://user-images.githubusercontent.com/56625259/169133869-f2e65894-6c0a-45f2-a114-c15b71a28fd2.png)

![Arch-Vol-Down](https://user-images.githubusercontent.com/56625259/169133972-9d2eff19-016d-4b8f-abc9-94f0812983c3.png)

![Arch-Vol-Mute](https://user-images.githubusercontent.com/56625259/169134095-be37003e-54a4-4c05-ac66-46e6ed38b03e.png)

![Arch-Vol-Unmute](https://user-images.githubusercontent.com/56625259/169134193-83e8e6bf-54f1-42a4-997f-69cee7a7594b.png)

![Arch-Bright-Up](https://user-images.githubusercontent.com/56625259/169141677-856809a7-a2d3-4e8c-8f9b-84bb9c6db1c0.png)

![Arch-Bright-Down](https://user-images.githubusercontent.com/56625259/169141696-bfd5e1a9-6d14-492f-9084-d573cac8f168.png)

<br />
