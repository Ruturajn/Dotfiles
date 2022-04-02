#!/bin/bash

## Using feh to set the background on startup
#feh --bg-max /usr/share/wallpapers/Cluster/contents/screenshot.png
feh --bg-scale ~/Dotfiles-Private/Wallpapres/5120x2880.jpg

## Using nitrogen to set wallpaper on startup
nitrogen --restore &

## Starting compton compositor on startup for transparency
picom --no-vsync &
