#!/usr/bin/bash
# 1 kitty-------------------------------------------------------------------------------------------
cp $HOME/.config/kitty/kitty_gruvbox.conf $HOME/.config/kitty/kitty.conf
killall -10 kitty
# 2 Wallpaper---------------------------------------------------------------------------------------
nitrogen --save --set-centered $HOME/Downloads/Wall/i_am_root2.jpg
# 3 vim---------------------------------------------------------------------------------------------
cp $HOME/.config/nvim/vim-scripts/color-settings-gruvbox.vim $HOME/.config/nvim/vim-scripts/color-settings.vim
# 4 polybar-----------------------------------------------------------------------------------------
#cp $HOME/.config/polybar.old/config_bspwm_gruvbox $HOME/.config/polybar.old/config
#sh /home/root99/.config/polybar.old/launch.sh &
# 5 GTK+--------------------------------------------------------------------------------------------
cp $HOME/.config/gruvbox/settings.ini $HOME/.config/gtk-3.0/
