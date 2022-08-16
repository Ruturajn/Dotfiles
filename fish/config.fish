if status is-interactive
    # Run "neofetch" for System info everytime fish is opened
    # neofetch
    
    # Run "pfetch" for System info everytime fish is opened
    pfetch
    
    # Adding the Path for ST-Development Folder
    set -gx fish_user_paths ~/.local/bin/ ~/.cargo/bin 
    set -gx LD_LIBRARY_PATH /usr/local/lib
    
    # Adding the Path for ST-Development Folder in the bashrc format
    #export PATH=$PATH:$HOME/ST-Development/stlink-1.7.0/
    
    
    # Adding Aliases
    #alias ll="ls -lah --color=auto"
    alias ll="lsd -lah"
    alias sudo!!="history | head -n1 | sed 's|^|sudo |'; fish -c (history | head -n1 | sed 's|^|sudo |')"
    alias lf="~/.config/lf/wrapper.sh"
    
    #set -U fish_color_param blue
    set fish_greeting
    
    # Starting the starship prompt
    # starship init fish | source

    if test -e ~/.config/wpg/sequences
        cat ~/.config/wpg/sequences
    end

    # Set Environment variable for qt5
    set -gx QT_QPA_PLATFORMTHEME "qt5ct"
end
