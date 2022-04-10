# Arch-Linux Post Installation Configuration

- The ```Arch_Install.sh``` script partitions the disk, installs the base Arch System (with UEFI) and creates a user with ```sudo``` privileges. 
- The ```Arch_Setup_Install.sh``` script installs all the needed packages for the rice and puts the config files in their respective folders ```~/.config/<Program-name>```. It also creates and configures a ```swapfile``` if the user requires it. 

**Note : Please read the scripts before running them and answer the questions asked in the scripts carefully, any damage caused to your system is solely your
responsibility!**

Since, that's out of the way now :smile:

Run the Arch Setup Script with the commands :

```
$ curl -fsSL https://tinyurl.com/4xxbyzjx > Arch_Setup
$ bash ./Arch_Setup
```

Run the Base Arch Installation Script with the commands :

```
$ curl -fsSL https://tinyurl.com/4kn79x78 > Arch_Install
$ bash ./Arch_Install
```

<br />

For Disk Paritioning in the ```Arch_Install.sh```, I used this : https://stackpointer.io/unix/linux-script-to-partition-disk/632/
