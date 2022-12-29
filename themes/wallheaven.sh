#!/bin/bash

# NOTE: To make it work with cron
export DISPLAY=:0
export XAUTHORITY=/home/root99/.config/Xauthority
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus

 image_url=$(curl https://wallhaven.cc/api/v1/search\?q\=anime\&sorting\=random\&atleast\&resolutions\=1920x1080\&colors\=000000\&atleast\=1920x1080 | jq '.' | grep -Eoh "https:\/\/w.wallhaven.cc\/full\/.*(jpg|png)\b" | head -1)

 store_directory=$HOME/Downloads/tmpWall/
 wget -P $store_directory $image_url

DISPLAY=:0 feh --bg-scale $store_directory$(basename $image_url)
# DISPLAY=:0 nitrogen --save --set-auto $store_directory$(basename $image_url)
# xwallpaper --zoom $store_directory$(basename $image_url)

notify-send "Wallpaper changed"
