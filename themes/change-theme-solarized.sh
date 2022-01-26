#!/usr/bin/bash
# 1 kitty-------------------------------------------------------------------------------------------
cp $HOME/.config/kitty/kitty_solarized.conf $HOME/.config/kitty/kitty.conf
killall -10 kitty
# 2 Wallpaper---------------------------------------------------------------------------------------
nitrogen --save --set-auto $HOME/Downloads/Wall/moon_root2.png
# 3 vim---------------------------------------------------------------------------------------------
cp $HOME/.config/nvim/vim-scripts/color-settings-solarized.vim $HOME/.config/nvim/vim-scripts/color-settings.vim
# 4 polybar-----------------------------------------------------------------------------------------
#cp $HOME/.config/polybar.old/config_bspwm_solarized $HOME/.config/polybar.old/config
#sh /home/root99/.config/polybar.old/launch.sh &
# 5 GTK+  // small bug in pcmanfm-------------------------------------------------------------------
# cp $HOME/.config/solarized/settings.ini $HOME/.config/gtk-3.0/
