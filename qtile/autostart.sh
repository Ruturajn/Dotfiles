#!/bin/bash

## Using feh to set the background on startup
# You can uncomment the line below, if you are doing the setup on your own.
# If you are running the setup script, it will add this line.
# feh --bg-scale <Path_To_Dotfiles>/Dotfiles/Wallpapres/5120x2880.jpg

## Using nitrogen to set wallpaper on startup
nitrogen --restore &

## Starting compton compositor on startup for transparency
# If transparency is not working, try with vsync
picom --no-vsync &

# Start pulseaudio
pulseaudio --start
