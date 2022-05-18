# Arch-Linux Installation and Post-Installation Setup

- The ```Arch_Install.sh``` script partitions the disk, installs the base Arch System (with UEFI) and creates a user with ```sudo``` privileges. At the 
  end it also asks whether the ```Arch_Setup_Install.sh``` script should be acquired and run, to complete the whole setup.
- The ```Arch_Setup_Install.sh``` script installs all the needed packages for the rice and puts the config files in their respective folders   
  ```~/.config/<Program-name>```. It also creates and configures a ```swapfile``` if the user requires it. The script will also
  backup your `$HOME/.config` directory before making any changes, so you will not loose any data.

**Note : Please read the scripts before running them and answer the questions asked in the scripts carefully, any damage caused to your system is solely
your responsibility! Also the ```Arch_Install.sh``` script is currently only tested on virtualbox, since it (as of yet) does not handle driver installation
for the GPU. So you will need to install NVIDIA or AMD GPU drivers yourself based on your machine (This will be incorporated in the script soon).**

Since, that's out of the way now :smile:

Important things to follow for the Setup on Virtual Box :
- Choose `VBoxVGA`  as the Graphics Driver under the `Display` Tab, for Alacritty to work in the VM. If you want to select `VMSVGA`, a different terminal
  emulator will need to be installed.
- Check the ```Enable EFI(special OSes only)``` checkbox under the ```System``` tab in *VM Settings*.
- Approximately ```20-25GB``` storage is recommended.
- **For the Keybindings see [this](https://github.com/Ruturajn/Dotfiles/blob/main/qtile/Commands.txt).**

Run the Arch Setup Script with the commands :

```
$ curl -fsSL https://tinyurl.com/arch-setup-rn > Arch_Setup
$ bash ./Arch_Setup
```

Run the Base Arch Installation Script with the commands :

```
$ curl -fsSL https://tinyurl.com/arch-install-rn > Arch_Install
$ bash ./Arch_Install
```

<br />

Disk Paritioning Reference in ```Arch_Install.sh``` : https://stackpointer.io/unix/linux-script-to-partition-disk/632/
