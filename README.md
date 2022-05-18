# Dotfiles
My Config Files for starship, qtile, rofi, fish, etc. In the ```Arch-Setup-Scripts``` directory, I have two bash scripts one for installing this setup 
and the other for a base Arch-Linux Install. To use the config, you will need to make 2 changes (If you are not using one of the setup scripts):
- Edit line `202` in the [dunstrc](https://github.com/Ruturajn/Dotfiles/blob/main/dunst/dunstrc) to add the path to dunst icons, which should be
  `~/.config/dunst/icons`, or if you have not moved the `dunst` folder to your `~/.config` directory `<Path_to_these_dotfiles>/dunst/icons`.
- Edit line `6` in the [autostart.sh](https://github.com/Ruturajn/Dotfiles/blob/main/qtile/autostart.sh) script to add the path to your wallpaper. 
  This can be skipped if you want to use nitrogen, to set your wallaper. To do that, you will need to set a wallpaper the first time you login to Qtile
  with `nitrogen`. This is only a one time thing, and the wallpaper you chose will persist, due to line `9` in the 
  [autostart.sh](https://github.com/Ruturajn/Dotfiles/blob/main/qtile/autostart.sh) script.

*Note:* 
- *The Setup Install Script places the config files in their respective directories and installs the dependencies. Please read the ```README.md``` file placed
under the `Arch-Setup-Scripts` directory and the script ,before running the script. You can just get the script using curl (see 
[Arch-Setup-Scripts/README.md](https://github.com/Ruturajn/Dotfiles/tree/main/Arch-Setup-Scripts)), it will clone this repo and do the needfull.*
- *The Arch Install Script adds a user, partitions the disk, does a base Arch Installation etc. (see [Arch-Setup-Scripts/README.md](https://github.com/Ruturajn/Dotfiles/tree/main/Arch-Setup-Scripts)).*
- *The `picom.conf` file here, is to be used with the original picom. Since I am using [Jonaburg's Fork of picom](https://github.com/jonaburg/picom)
  I use the default config provided in that repo, so I have not included it here. If you want to use jonaburg-picom just use the default config there,
  since I am using just that, no changes.*
- *To use the [bright_control](https://github.com/Ruturajn/Dotfiles/blob/main/qtile/bright_control) script, the user will need to be a part of the 
  `video` group. This can be done by : `$ sudo usermod -aG video $USER`.*
- *All of the aforementioned things stand for setting up this rice on Ubuntu as well.*

If you are using the [Arch_Setup_Install.sh](https://github.com/Ruturajn/Dotfiles/blob/main/Arch-Setup-Scripts/Arch_Setup_Install.sh) or the 
[Ubuntu_Setup_Install.sh](https://github.com/Ruturajn/Dotfiles/blob/main/Ubuntu-Setup-Script/Ubuntu_Setup_Install.sh) script, all of 
these things mentioned about editing files, picom configs (It will also ask you which fork of picom you require and place the default config
from that fork in `~/.config/picom/picom.conf`), and adding your user to the groups will be taken care of by the script.

<br />

### Setup Details

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

## Rofi and Qtile

![New-Arch-Rice-2](https://user-images.githubusercontent.com/56625259/168045281-d5581bc1-13c3-4295-ad71-1211b6047f3d.png)

![New-Arch-Rice-Rofi-2](https://user-images.githubusercontent.com/56625259/168045326-e1f42bbe-7374-4d9c-a7fe-1e0569355e7a.png)

![Vol-Up](https://user-images.githubusercontent.com/56625259/167814956-abbf7f1f-aa28-4986-ac3c-873e0bb9dc02.png)

![Vol-Down](https://user-images.githubusercontent.com/56625259/167814981-39ce0d68-a505-405c-8a05-e63ba44f6e9d.png)

![Vol-Mute](https://user-images.githubusercontent.com/56625259/167815000-4dd5a088-83ad-4a15-8e5f-169e53199689.png)

![Vol-Unmute](https://user-images.githubusercontent.com/56625259/167815033-97508f5e-aa39-41ad-8e48-da05c1b5e2b8.png)

![Brightness](https://user-images.githubusercontent.com/56625259/167815454-98273e17-4d39-4a96-8233-df499eaf3ab8.png)

<br />
