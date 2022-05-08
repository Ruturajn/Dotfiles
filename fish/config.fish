# Run "neofetch" for System info everytime fish is opened
# neofetch

# Run "pfetch" for System info everytime fish is opened
pfetch

# Adding the Path for ST-Development Folder
set -gx fish_user_paths /home/ruturajn/ST-Development/stlink-1.7.0/ /usr/include/libusb-1.0/ /usr/bin/gooler /home/ruturajn/.local/bin/ /usr/local/cuda-11.5/bin /usr/local/cuda-11.5/lib64 /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java /usr/local/cuda/bin /usr/local/cuda/lib64 /usr/local/include/opencv4 /usr/local/lib /usr/bin/python3.7 ~/Scripts/
set -gx LD_LIBRARY_PATH /usr/local/lib

# Adding the Path for ST-Development Folder in the bashrc format
#export PATH=$PATH:$HOME/ST-Development/stlink-1.7.0/


# Adding Aliases
#alias ll="ls -lah --color=auto"
alias ll="lsd -lah"

#set -U fish_color_param blue
set fish_greeting

# Starting the starship prompt
#starship init fish | source
