#!/bin/bash

notify-send "Wallpaper downloading"
serachterm=$1

# NOTE: To make it work with cron
# export DISPLAY=:0
# export XAUTHORITY=/home/root99/.config/Xauthority
# export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

# NOTE:anime wallpapers
image_url=$(curl "https://wallhaven.cc/api/v1/search?q=$serachterm&sorting=random&exact&resolutions=1920x1080" | jq '.' | grep -Eoh "https:\/\/w.wallhaven.cc\/full\/.*(jpg|png)\b" | head -1)
 # nature wallpapers
# image_url=$(curl https://wallhaven.cc/api/v1/search\?q\=nature\&sorting\=random\&atleast\&resolutions\=1920x1080\&colors\=000000\&atleast\=1920x1080 | jq '.' | grep -Eoh "https:\/\/w.wallhaven.cc\/full\/.*(jpg|png)\b" | head -1)

 store_directory=$HOME/Downloads/tmpWall/
 wget -P $store_directory $image_url
 sxiv $store_directory$(basename $image_url)

# DISPLAY=:0 feh --bg-scale $store_directory$(basename $image_url)




# DISPLAY=:0 nitrogen --save --set-auto $store_directory$(basename $image_url)
# xwallpaper --zoom $store_directory$(basename $image_url)

#NOTE: Wayland Hyprland wallpaper changer-----------------------------------------------------------
# hyprctl hyprpaper preload $store_directory$(basename $image_url)
# hyprctl hyprpaper wallpaper "eDP-1,$store_directory$(basename $image_url)"
# hyprctl hyprpaper wallpaper "HDMI-A-2,$store_directory$(basename $image_url)"
# hyprctl hyprpaper unload all
wal -i $store_directory$(basename $image_url)
# --------------------------------------------------------------------------------------------------
swww img $store_directory$(basename $image_url) --transition-type grow --transition-fps 60 --transition-pos bottom-right  --transition-duration 5 --transition-bezier .43,1.19,1,.4
echo "Wallpaper Saved in the folder "
