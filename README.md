# Dotfiles
My Config Files for starship, qtile, rofi, fish, etc. In the ```Arch-Setup-Scripts``` directory, I have two bash scripts one for installing this setup 
and the other for a base Arch-Linux Install. To use the config, you will need to make 2 important changes, and one optional change:
- Editing line `10` and `12` in the [bright_control](https://github.com/Ruturajn/Dotfiles/blob/main/qtile/bright_control) script to add your sudo 
  password. 
- Editing line `6` in the [autostart.sh](https://github.com/Ruturajn/Dotfiles/blob/main/qtile/autostart.sh) script to add the path to your wallpaper. 
  This can be skipped if you want to use nitrogen, to set your wallaper. You will need to set a wallpaper the first time you login to Qtile. This is only a 
  one time thing, and the wallpaper you chose will persist, due to line `9` in the 
  [autostart.sh](https://github.com/Ruturajn/Dotfiles/blob/main/qtile/autostart.sh) script.

*Note:* 
- *The Setup Install Script places the config files in their respective directories and installs the dependencies. Please read the ```README.md``` file placed
under the `Arch-Setup-Scripts` directory and the script ,before running the script. You can just get the script using curl (see 
[Arch-Setup-Scripts/README.md](https://github.com/Ruturajn/Dotfiles/tree/main/Arch-Setup-Scripts)), it will clone this repo and do the needfull.*
- *The Arch Install Script adds a user, partitions the disk, does a base Arch Installation etc. (see [Arch-Setup-Scripts/README.md](https://github.com/Ruturajn/Dotfiles/tree/main/Arch-Setup-Scripts)).*

<br />

## Arch-Linux with Rofi and Qtile

![New-Arch-Rice-2](https://user-images.githubusercontent.com/56625259/168045281-d5581bc1-13c3-4295-ad71-1211b6047f3d.png)

![New-Arch-Rice-Rofi-2](https://user-images.githubusercontent.com/56625259/168045326-e1f42bbe-7374-4d9c-a7fe-1e0569355e7a.png)

![Vol-Up](https://user-images.githubusercontent.com/56625259/167814956-abbf7f1f-aa28-4986-ac3c-873e0bb9dc02.png)

![Vol-Down](https://user-images.githubusercontent.com/56625259/167814981-39ce0d68-a505-405c-8a05-e63ba44f6e9d.png)

![Vol-Mute](https://user-images.githubusercontent.com/56625259/167815000-4dd5a088-83ad-4a15-8e5f-169e53199689.png)

![Vol-Unmute](https://user-images.githubusercontent.com/56625259/167815033-97508f5e-aa39-41ad-8e48-da05c1b5e2b8.png)

![Brightness](https://user-images.githubusercontent.com/56625259/167815454-98273e17-4d39-4a96-8233-df499eaf3ab8.png)

<br />
