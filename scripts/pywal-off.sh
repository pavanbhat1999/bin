#!/bin/bash

cd $HOME
# For zshrc
line_zshrc=$(grep -in ".cache/wal/sequences" .zshrc | cut -d ":" -f 1)
if [[ -n "$line_zshrc" ]]; then
    sed -i "${line_zshrc}d" $HOME/.zshrc
    echo "Line(s) containing so removed"
else
    echo "(cat ~/.cache/wal/sequences &)" >> $HOME/.zshrc
    echo "No lines containing so appended"
fi

#For nvim
line_nvim=$(grep -in "pywal.setup" $HOME/.config/nvim/init.lua | cut -d ":" -f 1)
if [[ -n "$line_nvim" ]]; then
    sed -i "${line_nvim}d" $HOME/.config/nvim/init.lua
    echo "nvim : Line(s) containing so removed"
else
    echo "local pywal = require('pywal') pywal.setup()" >> $HOME/.config/nvim/init.lua
    echo "nvim : No lines containing so appended"
fi

