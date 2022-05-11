# Dotfiles
My Config Files for starship, qtile, rofi, fish, etc. In the ```Arch-Setup-Scripts``` directory, I have two bash scripts one for installing this setup 
and the other for a base Arch-Linux Install. To use the config, you will need to make 2 important changes, and one optional change:
- Editing line `10` and `12` in the [bright_control](https://github.com/Ruturajn/Dotfiles/blob/main/qtile/bright_control) script to add your sudo 
  password. 
- Editing line `6` in the [autostart.sh](https://github.com/Ruturajn/Dotfiles/blob/main/qtile/autostart.sh) script to add the path to your wallpaper. 
  This can be skipped if you want to use nitrogen, to set your wallaper. You will need to set a wallpaper the first time you login to Qtile. This only a 
  one time thing, and the wallpaper you chose will persist, due to line `9` in the 
  [autostart.sh](https://github.com/Ruturajn/Dotfiles/blob/main/qtile/autostart.sh) script.
- This is optional, for rounded corners you can edit line `147` in [picom.conf](https://github.com/Ruturajn/Dotfiles/blob/main/picom.conf), and set
  set `corner-radius` to whatever value that you want.

*Note:* 
- *The Setup Install Script places the config files in their respective directories and installs the dependencies. Please read the ```README.md``` file placed
under the `Arch-Setup-Scripts` directory and the script ,before running the script. You can just get the script using curl (see 
[Arch-Setup-Scripts/README.md](https://github.com/Ruturajn/Dotfiles/tree/main/Arch-Setup-Scripts)), it will clone this repo and do the needfull.*
- *The Arch Install Script adds a user, partitions the disk, does a base Arch Installation etc. (see [Arch-Setup-Scripts/README.md](https://github.com/Ruturajn/Dotfiles/tree/main/Arch-Setup-Scripts)).*

<br />

## Arch-Linux with Rofi and Qtile

![New-Arch-Rice-1](https://user-images.githubusercontent.com/56625259/167813830-32d36fb8-e0f1-489f-9a30-43411625d1d7.png)

![New-Arch-Rice-Rofi-1](https://user-images.githubusercontent.com/56625259/167813875-e1a4483c-541e-48fc-9a36-c16985c7014b.png)

![Vol-Up](https://user-images.githubusercontent.com/56625259/167814956-abbf7f1f-aa28-4986-ac3c-873e0bb9dc02.png)

![Vol-Down](https://user-images.githubusercontent.com/56625259/167814981-39ce0d68-a505-405c-8a05-e63ba44f6e9d.png)

![Vol-Mute](https://user-images.githubusercontent.com/56625259/167815000-4dd5a088-83ad-4a15-8e5f-169e53199689.png)

![Vol-Unmute](https://user-images.githubusercontent.com/56625259/167815033-97508f5e-aa39-41ad-8e48-da05c1b5e2b8.png)

![Brightness](https://user-images.githubusercontent.com/56625259/167815454-98273e17-4d39-4a96-8233-df499eaf3ab8.png)

<br />
