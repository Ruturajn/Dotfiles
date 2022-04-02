# Dotfiles
My Config Files for starship, qtile, rofi, fish, etc. I have created a bash script for installing this setup. The Install script is placed under the ```Arch-Config-Script``` directory.

*Note: The Install Script does not install arch-linux itself but just places the config files in their respective directories. Please read the ```README.md``` file placed under the ```Arch-Config-Script``` directory carefully, before running the script.*

<br />

## To-Do
- [x] Search for Battery Notification Fix. (Edit : Worked perfectly after a Reboot &#8594; ```dbus-next``` is a dependency)
- [ ] Add different icons for battery (https://icons8.com/)
- [x] Create Install Script for complete setup.
- [ ] Clean the Qtile config (Make it modular).

<br />

## Arch-Linux with Rofi and Qtile

![Arch_Rice_Systray](https://user-images.githubusercontent.com/56625259/158530348-1731d299-dafb-4dce-a1cd-5b64af39ea63.png)

![Arch_Rice_Systray_Rofi](https://user-images.githubusercontent.com/56625259/158530407-ce4b8163-0afd-4725-b518-ce2e88a887b5.png)

![Mute_dunst](https://user-images.githubusercontent.com/56625259/158999869-5ec4e180-543d-438a-a110-277b8b4024a9.png)

![Unmute_dunst](https://user-images.githubusercontent.com/56625259/158999877-c758ae92-5ef6-40a9-a787-3a580a4c6ebd.png)

![Vol_down_dunst](https://user-images.githubusercontent.com/56625259/159000138-8341a030-af0d-493a-9603-ad52b11b956e.png)

![Vol_up_dunst](https://user-images.githubusercontent.com/56625259/158999919-361b7049-89a5-4a17-803e-11a5705da830.png)

https://user-images.githubusercontent.com/56625259/159149079-1ee59cc7-9bcc-45fc-9382-6253958b0292.mp4

<br />

## Arch-Linux with Rofi and Qtile (Garuda Wallpaper)

![Arch-New-Rice](https://user-images.githubusercontent.com/56625259/160415761-2fb4e1ce-696e-40f4-863c-8396f7aa10cb.png)

![Arch-New-Rice-Rofi](https://user-images.githubusercontent.com/56625259/160415798-246dc4a8-0fd9-481b-99df-b772ca45be38.png)

<br />

## Gnome-Terminal with Starship Prompt
![image](https://user-images.githubusercontent.com/56625259/154846590-9736e3fa-94c0-4dae-abc7-58c30f9fe884.png)

<br />

## Gnome-Desktop
![image](https://user-images.githubusercontent.com/56625259/154847508-bbea1a52-aa21-4a7b-bee4-16edb18bb97f.png)


#### For the rounded corners of the top bar add the following lines to the end of your ```gnome-shell.css``` file in the theme (current theme that is being used) folder. 

Command to navigate to the directory : ```$ cd /usr/share/themes/<Your-Current-Theme-Folder>/gnome-shell/```. In this directory you will find ```gnome-shell.css``` :

```
/*TOP BAR BOX*/
#panelBox {
  padding: 0.35em 0.9em;
  background: transparent; }

#panel {
  border-radius: 12px; }
```

- Fetch tool: https://github.com/dylanaraps/pfetch

- ls command: https://github.com/Peltoche/lsd

- Arch-Linux shell prompt in the screenshot: https://github.com/romkatv/zsh4humans

- The Wallpapers have been taken from: https://wallpaperscraft.com/

- For gnome-terminal on Arch use : https://aur.archlinux.org/packages/gnome-terminal-transparency

<br />

#### Dependencies for Arch-Qtile Rice
- Qtile-Extras : https://qtile-extras.readthedocs.io/en/latest/manual/install.html
- Fontawesome Icons : https://fontawesome.com/search?m=free | https://pypi.org/project/fontawesome/
- Colour Palette Generation : https://coolors.co/493657-ce7da5-bee5bf-dff3e3-ffd1ba
- Try out this fork of picom on actual hardware : https://github.com/jonaburg/picom
- The new screenshots use `robbyrussell` theme of the fish shell, instead of zsh. So, fish and oh-my-fish is also required.
- dunst for notifications : https://github.com/dunst-project/dunst
- Screen Brightness Utility (not running in virtual-box) : https://gitlab.com/cameronnemo/brillo
- Garuda-Linux Wallpapers : https://gitlab.com/garuda-linux/themes-and-settings/artwork/garuda-wallpapers
