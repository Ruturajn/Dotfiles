# Arch-Linux Post Installation Configuration

This script installs all the needed packages and puts the config files in their respective folders ```~/.config/<Program-name>```. It also creates and
configures a ```swapfile``` if the user requires it. 

**Note : This script is a work in progress, any damage caused to your system is solely your responsibility. Please proceed with Caution !! (The 
only *dangerous* part as such is the ```swapfile``` creation and configuration, since it adds stuff to the ```/etc/fstab``` file, and also uses the 
```dd``` command, hence the disclaimer :stuck_out_tongue: )**

*That said, you can give it a try in a Virtual Machine. :sweat_smile:*

Since, that's out of the way now :smile: , you can run the script with the command :

```
$ curl -fsSL https://tinyurl.com/5ahryh23 > Arch_Setup
$ bash ./Arch_Setup
```
