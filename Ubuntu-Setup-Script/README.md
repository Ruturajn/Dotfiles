# Setting Up the Rice on Ubuntu

- The `Ubuntu_Setup_Install.sh` script places all the required config files under their respective folders `$HOME/.config/<Program-name>`, and installs 
   all the dependencies. You can just get the script by using `curl` as shown below, and it will clone this repo and do the needfull. The script will 
   backup your `$HOME/.config` directory before making any changes, so you will not loose any data.
- The config files need to be a changed slightly while using them, this is handled by `Ubuntu_Setup_Install.sh` script. If you plan to place
  the config files manually, the following changes need to be made:
    - Line `202` in [dunst/dunstrc](https://github.com/Ruturajn/Dotfiles/blob/ubuntu/dunst/dunstrc) needs to be changed to
      `$HOME/.config/dunst/icons`, and if you have not placed the dunst folder in your `$HOME/.config`, then use
      `<Path-To-These-Dotfiles>/dunst/icons`.
    - Edit line `6` in the [qtile/autostart.sh](https://github.com/Ruturajn/Dotfiles/blob/ubuntu/qtile/autostart.sh) script to add the path
      to your wallpaper. This can be skipped if you want to use nitrogen, to set your wallaper. To do that, you will need to set a wallpaper
      the first time you login to Qtile with `nitrogen`. This is only a one time thing, and the wallpaper you chose will persist,
      due to line `9` in the [qtile/autostart.sh](https://github.com/Ruturajn/Dotfiles/blob/ubuntu/qtile/autostart.sh) script. Also, you will
      need to make the autostart script executable, with `chmod +x <Path-to-autostart.sh>/autostart.sh`.
    - If you don't see the `wifi` widget show up, change line `138` in [qtile/config.py](https://github.com/Ruturajn/Dotfiles/blob/ubuntu/qtile/config.py)
      to your network interface.
  
**Note : Please read the scripts before running them and answer the questions asked in the scripts carefully, any damage caused to your system is solely
your responsibility! But, that's highly unlikely, I needed to give a disclaimer just in case.**

Since, that's out of the way now, 😄

Run the `Ubuntu_Setup_Install.sh` script with:

```
curl -fsSL https://tinyurl.com/ubuntu-setup-rn > Ubuntu_Setup
bash ./Ubuntu_Setup
```
