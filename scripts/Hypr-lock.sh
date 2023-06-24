#!/bin/bash


swayidle -w \                                                                                                                       😀
                timeout 300 'my-lock-screen.sh' \
                timeout 600 'swaymsg "output * dpms off" & systemctl suspend ' \
                     resume 'swaymsg "output * dpms on"' \
                before-sleep 'my-lock-screen.sh' & disown

