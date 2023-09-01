#!/bin/bash
# nitrogen --set-auto --no-recurse --random $HOME/Downloads/Wall/
# DISPLAY=:0 feh --bg-scale --randomize $HOME/Downloads/Wall/
#
#
#
# Hyprland Wallpaper changer
# 1: Hyprppaer--------------------------------------------------------------------------------------
# filepath=$1
# hyprctl hyprpaper preload $filepath
# hyprctl hyprpaper wallpaper "eDP-1,$filepath"
# hyprctl hyprpaper unload all
# --------------------------------------------------------------------------------------------------
# 2: swww
swww img $1 --transition-type grow --transition-fps 60 --transition-pos bottom-right  --transition-duration 5 --transition-bezier .43,1.19,1,.4
